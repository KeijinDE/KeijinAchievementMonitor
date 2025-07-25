-- events.lua
-- Zentrale Eventverarbeitung für KeijinAchievementMonitorNEW
-- Nur Steuerlogik – tatsächliche Triggerreaktionen werden in modulespezifische Handler ausgelagert

-- 📌 Sichere Ersatzfunktion für string.match (kompatibel mit Classic Lua 5.1)
local function SafeMatch(str, pattern)
  if type(str) ~= "string" or type(pattern) ~= "string" then return nil end
  if string and type(string.match) == "function" then
    return string.match(str, pattern)
  end
  local s, e = string.find(str, pattern)
  if s and e then
    return string.sub(str, s, e)
  end
  return nil
end


-- 📌 Fortschrittsabruf aus der internen Registry (zur Verwendung in Submodulen erlaubt)
local function GetRegistryProgress(id)
  return (KAMN_RegistryByID and KAMN_RegistryByID[id] and KAMN_RegistryByID[id].progress) or 0
end

-- 📌 Hilfsfunktion zur Textextraktion (z. B. für Questnamen)
local function SafeExtract(str, pattern, lang)
  if type(str) ~= "string" then return nil end
  local startPos, endPos = string.find(str, pattern)
  if startPos and endPos then
    local tail = string.sub(str, endPos + 1)
    local name = string.match(tail, '^([^"\n]+)')
    if name then
      return name
    end
  end
  if KAMN and KAMN.debug and lang then
    DEFAULT_CHAT_FRAME:AddMessage("[KAM Debug] Keine Quest erkannt ("..lang.."): " .. str)
  end
  return nil
end

-- 📦 Interner Speicher für Vergleichszwecke
local lastQuestCount = GetNumQuestLogEntries()

-- 📌 Erstelle EventFrame und registriere relevante Events
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("PLAYER_LEVEL_UP")
eventFrame:RegisterEvent("COMBAT_TEXT_UPDATE")
eventFrame:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
eventFrame:RegisterEvent("QUEST_LOG_UPDATE")
eventFrame:RegisterEvent("CHAT_MSG_SYSTEM")
eventFrame:RegisterEvent("UI_INFO_MESSAGE")
eventFrame:RegisterEvent("CHAT_MSG_SKILL")
eventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
eventFrame:RegisterEvent("MINIMAP_ZONE_CHANGED")
eventFrame:RegisterEvent("CHAT_MSG_COMBAT_FACTION_CHANGE")

-- 📌 Haupt-Eventdispatcher
-- Ruft für jedes Event die passende Handler-Funktion aus einem Submodul auf
eventFrame:SetScript("OnEvent", function()
  local updated = false

  -- 📌 KILL-EVENTS: Generische Kills via Kampftext
  if event == "COMBAT_TEXT_UPDATE" and KAMN_HandleCombatTextUpdate then
    updated = KAMN_HandleCombatTextUpdate(event, arg1) or updated

  -- 📌 KILL-EVENTS: Benannte Gegner / Bosse
elseif event == "CHAT_MSG_COMBAT_HOSTILE_DEATH" then
  if KAMN_HandleHostileDeath then
    updated = KAMN_HandleHostileDeath(event, arg1) or updated
  end
  if KAMN_HandleNamedKillGroup then
    updated = KAMN_HandleNamedKillGroup(event, arg1) or updated
  end

  -- 📌 QUEST-EVENTS (Folgt bei nächstem Modul)
  elseif event == "QUEST_LOG_UPDATE" and KAMN_HandleQuestLogUpdate then
    updated = KAMN_HandleQuestLogUpdate(event)

  elseif event == "CHAT_MSG_SYSTEM" and KAMN_HandleSystemMessage then
    updated = KAMN_HandleSystemMessage(event, arg1)

  -- 📌 SKILL-EVENTS (Folgt bei Modul skill)
  elseif event == "CHAT_MSG_SKILL" and KAMN_HandleSkillEvent then
    updated = KAMN_HandleSkillEvent(event, arg1)

  -- 📌 ZONENENTDECKUNG (UI Info Message)
  elseif event == "UI_INFO_MESSAGE" and KAMN_HandleZoneDiscovery then
    updated = KAMN_HandleZoneDiscovery(event, arg1)

  -- 📌 RUFERKENNUNG
  elseif event == "CHAT_MSG_COMBAT_FACTION_CHANGE" and KAMN_HandleReputation then
    updated = KAMN_HandleReputation(event, arg1)
  end

  -- 📌 UI nur aktualisieren, wenn Fortschritt verändert wurde
  if updated and KAMNMainFrame and KAMNMainFrame:IsShown() and KAMN_UpdateUI then
    KAMN_UpdateUI()
  end
  --MetaCheck
  if KAMN_HandleMetaCheck then
  KAMN_HandleMetaCheck()
end

end)
