-- events/events_quest.lua
-- Trigger-Handler für Quest-Erfolge: allgemeine und benannte Quests

-- 📌 Initialisiere internen Questzähler, wenn nicht vorhanden
KAMN_Internal = KAMN_Internal or {}
KAMN_Internal.questCountLast = KAMN_Internal.questCountLast or GetNumQuestLogEntries()

-- 📌 Generische Questabschlüsse (z. B. "Schließe 5 Quests ab")
function KAMN_HandleQuestLogUpdate(event)
  local updated = false
  local currentQuestCount = GetNumQuestLogEntries()

  -- Vergleiche mit vorherigem Stand
  if currentQuestCount < KAMN_Internal.questCountLast then
    for _, a in ipairs(KAMN.achievements or {}) do
      if a.type == "quest" and (a.active ~= false) and not a.complete then
        local current = (KAMN_RegistryByID[a.id] and KAMN_RegistryByID[a.id].progress) or 0
        KAMN_TriggerProgress(a.id, current + 1, false)
        updated = true
      end
    end
  end

  -- Aktualisiere den Zähler
  KAMN_Internal.questCountLast = currentQuestCount
  return updated
end

-- 📌 Benannte Quests (Named-Quest-Abschluss über CHAT_MSG_SYSTEM)
function KAMN_HandleSystemMessage(event, msg)
  local updated = false
  local questname = nil

  if string.find(msg, 'Quest "') and string.find(msg, '" completed%.') then
    questname = SafeExtract(msg, 'Quest "', "EN")
  elseif string.find(msg, 'Quest "') and string.find(msg, '" abgeschlossen%.') then
    questname = SafeExtract(msg, 'Quest "', "DE")
  elseif string.find(msg, " completed%.") then
    questname = string.gsub(msg, " completed%." , "")
  elseif string.find(msg, " abgeschlossen%.") then
    questname = string.gsub(msg, " abgeschlossen%." , "")
  end

  if questname then
    for _, a in ipairs(KAMN.achievements or {}) do
      if a.type == "namedquest" and (a.active ~= false) and not a.complete and a.questname
      and string.lower(a.questname) == string.lower(questname) then
        KAMN_TriggerProgress(a.id, 1, false)
        updated = true
        if KAMN.debug then
          DEFAULT_CHAT_FRAME:AddMessage("[KAM Debug] Named Quest abgeschlossen: " .. a.questname)
        end
      end
    end
  elseif KAMN.debug then
    DEFAULT_CHAT_FRAME:AddMessage("[KAM Debug] CHAT_MSG_SYSTEM ohne erkannte Quest: " .. msg)
  end

  return updated
end
