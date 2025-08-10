-- ✅ Datei: logic_scroll.lua – Final-Version mit Mausrad-Bindung über ScrollWrapper
-- 🔃 Classic-kompatible Scroll- und Sichtbarkeitsfunktionen mit robuster Kategorielogik

if not KAM_ScrollOffset then KAM_ScrollOffset = 0 end
if not KAM_MaxVisible then KAM_MaxVisible = 15 end

-- 🔒 Lokaler Wrapper für sicheren Zugriff auf zentrale Filterfunktion
local function KAM_GetFilteredAchievements(category, filter, search)
  if KAMN and KAMN.KAM_GetFilteredAchievements then
    return KAMN.KAM_GetFilteredAchievements(category, filter, search)
  end
  return {}
end

-- 📐 Maximale Scroll-Position berechnen
function KAM_GetMaxOffset(category)
  local list = KAM_GetFilteredAchievements(category, currentFilter, currentSearch)
  local total = 0
  if type(list) == "table" then
    total = table.getn(list)
  end
  if total <= KAM_MaxVisible then return 0 end
  return total - KAM_MaxVisible
end

-- 👁 Sichtbare Ergebnisse basierend auf aktuellem Offset
function KAM_GetVisibleAchievements(category)
  local filter = currentFilter or "ALL"
  local search = currentSearch or ""
  local fullList = KAM_GetFilteredAchievements(category, filter, search)
  local visible = {}
  if type(fullList) ~= "table" then return visible end

  for i = 1, KAM_MaxVisible do
    local index = KAM_ScrollOffset + i
    if fullList[index] then
      table.insert(visible, fullList[index])
    end
  end
  return visible
end

-- 🔼🔽 Scrollen rauf/runter mit Kategorie
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

-- 🖱 Mausrad scrollt sichtbare Liste (bindet sich an Frame wie scrollWrapper)
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

-- 🔍 Gruppensperre für Meilensteine (inkl. namedkillgroup via groupMatch-Signatur)
local function KAMN_NKG_Signature(a)
  -- Erzeugt eine stabile Signatur für namedkillgroup anhand groupMatch
  if not a or a.type ~= "namedkillgroup" or not a.groupMatch then return nil end
  local names, i = {}, 1
  for i = 1, table.getn(a.groupMatch) do
    local n = a.groupMatch[i]
    if n and type(n) == "string" then
      table.insert(names, string.lower(n))
    end
  end
  table.sort(names)
  return table.concat(names, "|")
end

function KAMN_ShouldDisplayAchievement(a)
  if a.complete then return true end

  -- 1) Generische Gruppensperre (z. B. DEATH_COUNT, QUEST_COUNT, …)
  if a.group and a.value then
    local i
    for i = 1, table.getn(KAMN.achievements) do
      local b = KAMN.achievements[i]
      if b and b.group == a.group and not b.complete and (b.value or 0) < a.value then
        return false
      end
    end
  end

  -- 2) Skills / Weapon (pro Skillname staffeln)
  if (a.type == "skill" or a.type == "weapon") and a.skillname and a.value then
    local i
    for i = 1, table.getn(KAMN.achievements) do
      local b = KAMN.achievements[i]
      if b and b.id ~= a.id and b.type == a.type and b.skillname == a.skillname and not b.complete and (b.value or 0) < a.value then
        return false
      end
    end
  end

  -- 3) Quests (generic)
  if a.type == "quest" and a.value then
    local i
    for i = 1, table.getn(KAMN.achievements) do
      local b = KAMN.achievements[i]
      if b and b.id ~= a.id and b.type == "quest" and not b.complete and (b.value or 0) < a.value then
        return false
      end
    end
  end

  -- 4) Generic Kills
  if a.type == "generickill" and a.value then
    local i
    for i = 1, table.getn(KAMN.achievements) do
      local b = KAMN.achievements[i]
      if b and b.id ~= a.id and b.type == "generickill" and not b.complete and (b.value or 0) < a.value then
        return false
      end
    end
  end

  -- 5) Level
  if a.type == "level" and a.value then
    local i
    for i = 1, table.getn(KAMN.achievements) do
      local b = KAMN.achievements[i]
      if b and b.id ~= a.id and b.type == "level" and not b.complete and (b.value or 0) < a.value then
        return false
      end
    end
  end

  -- 6) Reputation (pro Fraktion)
  if a.type == "reputation" and a.faction and a.value then
    local i
    for i = 1, table.getn(KAMN.achievements) do
      local b = KAMN.achievements[i]
      if b and b.id ~= a.id and b.type == "reputation" and b.faction == a.faction and not b.complete and (b.value or 0) < a.value then
        return false
      end
    end
  end

  -- 7) Death (nur innerhalb gleicher group staffeln; Qualifier ohne group blocken NICHT)
  if a.type == "death" and a.value then
    local i
    for i = 1, table.getn(KAMN.achievements) do
      local b = KAMN.achievements[i]
      if b and b.id ~= a.id and b.type == "death" and not b.complete then
        if a.group and b.group and a.group == b.group and (b.value or 0) < a.value then
          return false
        end
      end
    end
  end

  -- 8) 🆕 namedkillgroup (staffeln nur innerhalb derselben Mob-Gruppe via groupMatch)
  if a.type == "namedkillgroup" and a.value and a.groupMatch then
    local sigA = KAMN_NKG_Signature(a)
    if sigA then
      local i
      for i = 1, table.getn(KAMN.achievements) do
        local b = KAMN.achievements[i]
        if b and b.id ~= a.id and b.type == "namedkillgroup" and not b.complete and (b.value or 0) < a.value and b.groupMatch then
          local sigB = KAMN_NKG_Signature(b)
          if sigB and sigB == sigA then
            return false
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
