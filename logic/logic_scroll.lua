-- ✅ Datei: logic_scroll.lua – Classic-kompatible Scroll- und Sichtbarkeitsfunktionen
-- 🛠 Fixes:
--  - Blockierlogik ignoriert inaktive/hardcore-inaktive Einträge
--  - "Just completed" (Notify-Batch) blockt nicht mehr die nächste Stufe
--  - Level-Livecheck, Registry-Check für Quests/Kills unverändert

if not KAM_ScrollOffset then KAM_ScrollOffset = 0 end
if not KAM_MaxVisible then KAM_MaxVisible = 15 end

-- 🔒 Sicherer Zugriff auf zentrale Filterfunktion
local function KAM_GetFilteredAchievements(category, filter, search)
  if KAMN and KAMN.KAM_GetFilteredAchievements then
    return KAMN.KAM_GetFilteredAchievements(category, filter, search)
  end
  return {}
end

-- 📐 Maximale Scroll-Position
function KAM_GetMaxOffset(category)
  local list = KAM_GetFilteredAchievements(category, currentFilter, currentSearch)
  local total = (type(list) == "table" and table.getn(list)) or 0
  if total <= KAM_MaxVisible then return 0 end
  return total - KAM_MaxVisible
end

-- 👁 Sichtbare Ergebnisse
function KAM_GetVisibleAchievements(category)
  local filter = currentFilter or "ALL"
  local search = currentSearch or ""
  local fullList = KAM_GetFilteredAchievements(category, filter, search)
  local visible = {}
  if type(fullList) ~= "table" then return visible end
  local i
  for i = 1, KAM_MaxVisible do
    local index = KAM_ScrollOffset + i
    if fullList[index] then
      table.insert(visible, fullList[index])
    end
  end
  return visible
end

-- 🔼🔽 Scrollen
function KAM_ScrollAchievements(direction, category)
  local maxOffset = KAM_GetMaxOffset(category)
  if not maxOffset then maxOffset = 0 end
  if not KAM_ScrollOffset then KAM_ScrollOffset = 0 end

  if direction == "up" then
    KAM_ScrollOffset = math.max(0, KAM_ScrollOffset - 1)
  elseif direction == "down" then
    KAM_ScrollOffset = math.min(maxOffset, KAM_ScrollOffset + 1)
  end

  if KAMN_UpdateUI then KAMN_UpdateUI() end
end

-- 🖱 Mausradbindung
function KAM_AttachMouseScroll(frame, category)
  if not frame then return end
  frame:EnableMouseWheel(true)
  frame:SetScript("OnMouseWheel", function()
    if arg1 and arg1 > 0 then
      KAMN.KAM_ScrollAchievements("up", currentCategory)
    elseif arg1 and arg1 < 0 then
      KAMN.KAM_ScrollAchievements("down", currentCategory)
    end
  end)
end

-- 🔎 Signatur für namedkillgroup
local function KAMN_NKG_Signature(a)
  if not a or a.type ~= "namedkillgroup" or not a.groupMatch then return nil end
  local names = {}
  local i
  for i = 1, table.getn(a.groupMatch) do
    local n = a.groupMatch[i]
    if n and type(n) == "string" then
      table.insert(names, string.lower(n))
    end
  end
  table.sort(names)
  return table.concat(names, "|")
end

-- 🧭 Hardcore-Status (lokal wie in labels.lua)
local function HardcoreEnabled()
  if type(KAMN_IsHardcore) == "function" then
    local ok = KAMN_IsHardcore()
    if ok ~= nil then return ok == true end
  end
  local name = UnitName and UnitName("player") or "Unknown"
  local realm = GetRealmName and GetRealmName() or "Realm"
  local key = realm .. "-" .. name
  if KAMN_CharacterDB and KAMN_CharacterDB[key] and KAMN_CharacterDB[key].isHardcore ~= nil then
    return KAMN_CharacterDB[key].isHardcore == true
  end
  return false
end

-- 🧠 "Gerade eben abgeschlossen?" – prüft Notify-Batch
local function KAMN_WasJustCompleted(b)
  if not (b and b.name) then return false end
  if not KAMN_LastNotifyQueue or type(KAMN_LastNotifyQueue) ~= "table" then return false end
  local i
  for i = 1, table.getn(KAMN_LastNotifyQueue) do
    if KAMN_LastNotifyQueue[i] == b.name then
      return true
    end
  end
  return false
end

-- 📊 Fortschritt aus Registry
local function KAMN_GetProgress(id)
  if KAMN_RegistryByID and KAMN_RegistryByID[id] and KAMN_RegistryByID[id].progress then
    return KAMN_RegistryByID[id].progress
  end
  return 0
end

-- 🧮 Live-/Registry-Status
local function KAMN_IsTrulyIncomplete(b)
  if not b then return false end
  if b.complete then return false end
  if KAMN_WasJustCompleted(b) then return false end

  -- Level: Live prüfen
  if b.type == "level" and b.value then
    local lvl = UnitLevel and UnitLevel("player") or 1
    if lvl >= (b.value or 0) then
      return false
    end
    return true
  end

  -- Generische Kills
  if b.type == "generickill" and b.value then
    local prog = KAMN_GetProgress(b.id)
    -- (Optionaler Live-Puffer wäre hier addierbar)
    if prog >= (b.value or 0) then return false end
    return true
  end

  -- Generische Quests
  if b.type == "quest" and b.value then
    local prog = KAMN_GetProgress(b.id)
    -- (Optionaler Live-Puffer wäre hier addierbar)
    if prog >= (b.value or 0) then return false end
    return true
  end

  -- Standard: Registry
  local prog = KAMN_GetProgress(b.id)
  if prog >= (b.value or 0) then return false end
  return true
end

-- 🛡 Sichtbarkeitslogik – gemeinsamer Blockprüfer
local function IsBlockedByLowerIncomplete(a, matchType, extraCheck)
  if not a or not a.value then return false end
  local i
  for i = 1, table.getn(KAMN.achievements) do
    local b = KAMN.achievements[i]
    if b
      and b.id ~= a.id
      and b.type == matchType
      and (b.value or 0) < a.value
      and (not extraCheck or extraCheck(a, b))
    then
      -- 🔕 Inaktive oder für diesen Char irrelevante Einträge NICHT blockierend
      if b.active == false then
        -- skip
      elseif b.category == "Hardcore" and not HardcoreEnabled() then
        -- skip
      else
        if KAMN_IsTrulyIncomplete(b) then
          return true
        end
      end
    end
  end
  return false
end

function KAMN_ShouldDisplayAchievement(a)
  if a.complete then return true end

  -- 2) Skills / Weapon (pro Skillname)
  if (a.type == "skill" or a.type == "weapon") and a.skillname then
    if IsBlockedByLowerIncomplete(a, a.type, function(aa, bb) return bb.skillname == aa.skillname end) then
      return false
    end
  end

  -- 3) Quests (generic)
  if a.type == "quest" then
    if IsBlockedByLowerIncomplete(a, "quest") then
      return false
    end
  end

  -- 4) Generic Kills
  if a.type == "generickill" then
    if IsBlockedByLowerIncomplete(a, "generickill") then
      return false
    end
  end

  -- 5) Level
  if a.type == "level" then
    if IsBlockedByLowerIncomplete(a, "level") then
      return false
    end
  end

  -- 6) Reputation (pro Fraktion)
  if a.type == "reputation" and a.faction then
    if IsBlockedByLowerIncomplete(a, "reputation", function(aa, bb) return bb.faction == aa.faction end) then
      return false
    end
  end

  -- 7) Death (nur innerhalb gleicher group)
  if a.type == "death" and a.group then
    if IsBlockedByLowerIncomplete(a, "death", function(aa, bb) return bb.group == aa.group end) then
      return false
    end
  end

  -- 8) namedkillgroup (Signaturgleichheit)
  if a.type == "namedkillgroup" and a.groupMatch then
    local sigA = KAMN_NKG_Signature(a)
    if sigA then
      local i
      for i = 1, table.getn(KAMN.achievements) do
        local b = KAMN.achievements[i]
        if b
          and b.id ~= a.id
          and b.type == "namedkillgroup"
          and (b.value or 0) < (a.value or 0)
          and b.groupMatch
        then
          -- Skip inaktive / HC-inaktive
          if b.active == false then
            -- skip
          elseif b.category == "Hardcore" and not HardcoreEnabled() then
            -- skip
          else
            local sigB = KAMN_NKG_Signature(b)
            if sigB and sigB == sigA and KAMN_IsTrulyIncomplete(b) then
              return false
            end
          end
        end
      end
    end
  end

  return true
end

-- 🔁 Export
KAMN = KAMN or {}
KAMN.KAM_AttachMouseScroll = KAM_AttachMouseScroll
KAMN.KAM_GetVisibleAchievements = KAM_GetVisibleAchievements
KAMN.KAM_ScrollAchievements = KAM_ScrollAchievements
KAMN.KAM_GetMaxOffset = KAM_GetMaxOffset
KAMN_ShouldDisplayAchievement = KAMN_ShouldDisplayAchievement
