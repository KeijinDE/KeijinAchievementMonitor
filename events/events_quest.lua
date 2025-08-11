-- events/events_quest.lua
-- Trigger-Handler für Quest-Erfolge: generische und benannte Quests
-- Classic-kompatibel (Lua 5.1). Eigenständige Helfer (SafeExtract / SafeMatch), keine Abhängigkeit zu events.lua.

-- ############################################################
-- 🔧 Lokale Helper (kollisionsfrei, Classic-sicher)
-- ############################################################

-- (Defensiver) Ersatz für string.match, falls global manipuliert
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

-- Extrahiert einen Questnamen aus einer Systemnachricht in EN/DE (und robusten Fallbacks)
-- Beispiele:
--   EN: Quest "Your Place in the World" completed.
--   DE: Quest "Dein Platz in der Welt" abgeschlossen.
-- Fallback: Entfernt Abschluss-Suffixe und Anführungszeichen.
local function SafeExtract(msg)
  if type(msg) ~= "string" then return nil end

  -- Versuche das Muster: Quest "NAME" completed/abgeschlossen.
  local startPos, endPos = string.find(msg, 'Quest "')
  if startPos and endPos then
    -- Rest nach dem öffnenden "
    local tail = string.sub(msg, endPos + 1)
    -- Bis zum nächsten " (keine Zeilenumbrüche)
    local name = SafeMatch(tail, '^([^"\n]+)')
    if name and name ~= "" then
      return name
    end
  end

  -- Fallback 1: EN – entfernt " completed."
  if string.find(msg, " completed%.") then
    local stripped = string.gsub(msg, " completed%." , "")
    stripped = string.gsub(stripped, '^Quest%s*"', "")  -- führendes Quest "
    stripped = string.gsub(stripped, '"%s*$', "")        -- schließendes "
    stripped = string.gsub(stripped, "^%s+", "")
    stripped = string.gsub(stripped, "%s+$", "")
    if stripped ~= "" then return stripped end
  end

  -- Fallback 2: DE – entfernt " abgeschlossen."
  if string.find(msg, " abgeschlossen%.") then
    local stripped = string.gsub(msg, " abgeschlossen%." , "")
    stripped = string.gsub(stripped, '^Quest%s*"', "")  -- führendes Quest "
    stripped = string.gsub(stripped, '"%s*$', "")        -- schließendes "
    stripped = string.gsub(stripped, "^%s+", "")
    stripped = string.gsub(stripped, "%s+$", "")
    if stripped ~= "" then return stripped end
  end

  return nil
end

-- Fortschritt aus Registry holen (ohne globale Helper-Abhängigkeit)
local function GetRegistryProgress(id)
  if KAMN_RegistryByID and KAMN_RegistryByID[id] and KAMN_RegistryByID[id].progress then
    return KAMN_RegistryByID[id].progress
  end
  return 0
end

-- ############################################################
-- 🧠 Interner Questzähler (State)
-- ############################################################

KAMN_Internal = KAMN_Internal or {}
KAMN_Internal.questCountLast = KAMN_Internal.questCountLast or (GetNumQuestLogEntries and GetNumQuestLogEntries() or 0)

-- ############################################################
-- 📌 Generische Questabschlüsse (z. B. "Complete 5/10/... quests")
--    Wird über QUEST_LOG_UPDATE getriggert.
--    Logik: Wenn die Anzahl der Einträge im Questlog sinkt → eine Quest wurde abgegeben.
-- ############################################################
function KAMN_HandleQuestLogUpdate(event)
  local updated = false
  local currentQuestCount = GetNumQuestLogEntries and GetNumQuestLogEntries() or KAMN_Internal.questCountLast

  -- Nur wenn es weniger aktive Quests gibt, zählen wir einen Abschluss
  if currentQuestCount < KAMN_Internal.questCountLast then
    local list = (KAMN and KAMN.achievements) or {}
    local i, n = 1, (type(list) == "table" and table.getn(list) or 0)
    for i = 1, n do
      local a = list[i]
      if a and a.type == "quest" and (a.active ~= false) and not a.complete then
        local current = GetRegistryProgress(a.id)
        if type(KAMN_TriggerProgress) == "function" then
          KAMN_TriggerProgress(a.id, current + 1, false)
          updated = true
        end
      end
    end

    if KAMN and KAMN.debug then
      DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Debug]|r Quest complete detected (generic). -1 in quest log")
    end
  end

  -- Zähler aktualisieren
  KAMN_Internal.questCountLast = currentQuestCount
  return updated
end

-- ############################################################
-- 📌 Benannte Quests (Named-Quest-Abschluss über CHAT_MSG_SYSTEM)
--    Erkennt EN/DE-Varianten und nutzt robuste Extraktion.
-- ############################################################
function KAMN_HandleSystemMessage(event, msg)
  local updated = false
  if type(msg) ~= "string" or msg == "" then return false end

  -- Nur Nachrichten weiterverarbeiten, die wie ein Questabschluss aussehen
  -- (kleiner Filter, um Spam zu vermeiden)
  if not (string.find(msg, "Quest ") or string.find(msg, "Quest\"") or string.find(msg, " completed%.") or string.find(msg, " abgeschlossen%.")) then
    return false
  end

  local questname = SafeExtract(msg)

  if questname and questname ~= "" then
    local targetLower = string.lower(questname)
    local list = (KAMN and KAMN.achievements) or {}
    local i, n = 1, (type(list) == "table" and table.getn(list) or 0)

    for i = 1, n do
      local a = list[i]
      if a
        and a.type == "namedquest"
        and (a.active ~= false)
        and not a.complete
        and a.questname
        and string.lower(a.questname) == targetLower
      then
        if type(KAMN_TriggerProgress) == "function" then
          KAMN_TriggerProgress(a.id, 1, false)
          updated = true
        end

        if KAMN and KAMN.debug then
          DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Debug]|r Named Quest completed: " .. a.questname)
        end
        -- Kein break: Falls mehrere Achievements dieselbe Quest referenzieren (ungewöhnlich, aber sicher)
      end
    end

    if not updated and KAMN and KAMN.debug then
      DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Debug]|r Named Quest not mapped: " .. questname)
    end
  else
    if KAMN and KAMN.debug then
      DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Debug]|r System message did not contain a recognizable quest: " .. msg)
    end
  end

  return updated
end
