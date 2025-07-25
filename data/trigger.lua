-- trigger.lua
-- Einheitlicher Trigger-Aufruf mit optionalem Backfill
-- 🔒 SafeMatch – Ersatz für string.match (nur einfacher Prefix möglich)
-- Sucht einen fixen Prefix bis zum ersten Ziffernblock (z. B. "KILLGROUP_BOARS01" → "KILLGROUP_BOARS")
function SafeMatchPrefixBeforeNumber(s)
  if not s or type(s) ~= "string" then return nil end
  local startPos = string.find(s, "%d") -- erste Ziffer finden
  if startPos and startPos > 1 then
    return string.sub(s, 1, startPos - 1)
  end
  return nil
end

-- 📌 Primäre Fortschrittsauslösung für eine Achievement-ID
function KAMN_TriggerProgress(id, value, isBackfill)
  local a = KAMN_RegistryByID and KAMN_RegistryByID[id]
  if not a then return 0 end
  if a.complete then return a.progress or 0 end

  -- Aktuellen Fortschritt ermitteln
  a.progress = value or (a.progress or 0) + 1

  -- 📌 Zielwert definieren – fallback bei meta- oder unvollständigen Erfolgen
  local goal = a.amount or a.value or 1

  -- 📌 Ziel erreicht?
  if a.progress >= goal and not a.complete then
    a.progress = goal
    a.complete = true
    a.date = date("%d.%m.%Y %H:%M")
    a.completedBy = UnitName("player") or "Unknown"
    a.timestamp = time()

    if not isBackfill and KAMN_ShowNotify then
      KAMN_ShowNotify(a.name)
    end

    if KAMN.debug then
      if isBackfill then
        DEFAULT_CHAT_FRAME:AddMessage("|cffffff55[KAM]|r [Backfill] Erfolg erkannt: " .. (a.name or id))
      else
        DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Erfolg abgeschlossen: " .. (a.name or id))
      end
    end
  end

  -- 📦 Fortschritt speichern (immer beide Speicher: Account & Char)
  KAMN_SaveProgress(a.id, a)

  return a.progress or 0
end

-- 🔄 Prüft retroaktive Gruppenerfolge bei Teilabschlüssen
function KAMN_CheckBackfillTriggers(id, currentProgress)
  if not KAMN_RegistryByID then return end
  if not currentProgress or currentProgress <= 0 then return end

  for _, a in ipairs(KAMN.achievements or {}) do
    if a and a.id and not a.complete and a.group and a.group == id then
      local goal = a.amount or a.value or 1
      if type(goal) == "number" and currentProgress >= goal then
        local existing = a.progress or 0
        if existing < goal then
          if KAMN.debug then
            DEFAULT_CHAT_FRAME:AddMessage("|cffffff55[KAM]|r Prüfe Backfill: " .. a.name .. " (Ziel: " .. goal .. ", Stand: " .. currentProgress .. ")")
          end
          KAMN_TriggerProgress(a.id, goal, true)
        end
      end
    end
  end
end

-- KAMN_ShouldDisplayAchievement(a)
-- Versteckt Erfolge, wenn ein niedrigerer, noch nicht abgeschlossener Erfolg derselben Gruppe existiert
-- Gilt für: Kills, Level, Reputation, NamedKillGroups

function KAMN_ShouldDisplayAchievement(a)
-- Immer anzeigen, wenn vollständig
local data = KAMN_GetAchievementData(a.id)
if data and data.complete then return true end

-- Gruppenschlüssel ermitteln
local groupKey = nil
local groupValue = a.value or 0
local groupType = a.type or ""

if groupType == "kill" then
 groupKey = "GENERIC_KILL"
elseif groupType == "level" then
 groupKey = "LEVEL"
elseif groupType == "reputation" and a.faction then
 groupKey = "REPUTATION_" .. a.faction
elseif groupType == "namedkillgroup" and string.find(a.id, "KILLGROUP_") then
 groupKey = SafeMatchPrefixBeforeNumber(a.id)
elseif groupType == "weapon" then
 groupKey = "WEAPON_SKILL"
elseif groupType == "skill" then
 groupKey = "PROFESSION_SKILL"
elseif groupType == "quests" and a.generic then
 groupKey = "GENERIC_QUESTS"
end

-- Wenn keine Gruppe erkennbar, anzeigen
if not groupKey then return true end

-- Niedrigsten offenen Erfolg dieser Gruppe finden
for i = 1, table.getn(KAMN.achievements) do
 local other = KAMN.achievements[i]
 if other and other.id ~= a.id then
   local otherType = other.type or ""
   local otherData = KAMN_GetAchievementData(other.id)
   local otherValue = other.value or 0
   local match = false

   -- Gleiches Gruppenprinzip prüfen
   if groupType == "kill" and otherType == "kill" then
     match = true
   elseif groupType == "level" and otherType == "level" then
     match = true
   elseif groupType == "reputation" and otherType == "reputation" and a.faction == other.faction then
     match = true
   elseif groupType == "namedkillgroup" and otherType == "namedkillgroup" then
     local otherGroupKey = SafeMatchPrefixBeforeNumber(other.id)
     match = (otherGroupKey == groupKey)
   elseif groupType == "weapon" and otherType == "weapon" then
     match = true
   elseif groupType == "skill" and otherType == "skill" then
     match = true
   elseif groupType == "quests" and otherType == "quests" and a.generic and other.generic then
     match = true
   end

   -- Wenn ein kleinerer Erfolg der Gruppe noch offen ist → aktuellen ausblenden
   if match and not (otherData and otherData.complete) and (otherValue < groupValue) then
     return false
   end
 end
end

return true
end
