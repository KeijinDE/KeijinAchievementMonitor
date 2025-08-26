-- storage/storage.lua
-- Fortschritts- & Punktspeicher für KeijinAchievementMonitor (Turtle 1.12, Lua 5.1)
-- WICHTIG:
--  • Manuell gewährte Abschlüsse (via /kam grant) setzen 'manual = true' im aktiven Speicher.
--  • Einträge mit 'manual = true' werden bei der Punktsumme IGNORIERT.
--  • Wenn der Erfolg später regulär triggert (ohne data.manual = true), wird 'manual' entfernt,
--    sodass Punkte ab diesem Zeitpunkt normal gezählt werden.
--  • Diese Datei fasst NUR Speicher-/Ladelogik an; UI/Events bleiben unberührt.

-- 🧩 Abhängigkeiten (bereitgestellt vom Addon):
--  • KAMN_UseAccountData (boolean)    – aktiver Modus (Account/Char)
--  • KAMN_PlayerProgress (table)      – per-Char Speicher
--  • KAMN_AccountProgress (table)     – Account-weiter Speicher
--  • KAMN_achievements (array)        – statische Achievement-Definitionen
--  • KAMN_GetCharKey()                – liefert eindeutigen Char-Key
--  • KAMN_CheckBackfillTriggers(id, progress) – Backfill/Meta-Checks
--  • KAMN.debug (boolean)             – Debug-Ausgaben schalten

-- 🔁 Aktiven Fortschrittsspeicher ermitteln (Account vs. Char)
function KAMN_GetActiveProgress()
  if KAMN_UseAccountData then
    return KAMN_AccountProgress
  else
    local key = KAMN_GetCharKey()
    if not KAMN_PlayerProgress[key] then
      KAMN_PlayerProgress[key] = {}
    end
    return KAMN_PlayerProgress[key]
  end
end

-- 🔍 Datensatz für eine Achievement-ID holen/initialisieren
function KAMN_GetAchievementData(id)
  local db = KAMN_GetActiveProgress()
  if id and not db[id] then
    db[id] = {}
  end
  return id and db[id] or nil
end

-- 💾 Fortschritt speichern (gleichzeitig Char & Account berücksichtigen)
-- Regeln für 'manual':
--  • Wenn data.manual == true (explizit) → setze manual = true.
--  • Wenn data.manual nicht gesetzt ist  → manual = nil (entfernen), damit reguläre Abschlüsse Punkte zählen.
function KAMN_SaveProgress(id, data)
  if not id or not data then return end

  local playerName = UnitName("player")
  local charKey = KAMN_GetCharKey()
  local timestamp = data.timestamp or time()

  if not KAMN_AccountProgress then KAMN_AccountProgress = {} end
  if not KAMN_PlayerProgress then KAMN_PlayerProgress = {} end
  if not KAMN_PlayerProgress[charKey] then KAMN_PlayerProgress[charKey] = {} end

  local charStore = KAMN_PlayerProgress[charKey]
  local accStore  = KAMN_AccountProgress

  local newProgress = data.progress or 0
  local newComplete = data.complete or false
  local markManual  = (data.manual == true)  -- nur wenn explizit true übergeben

  -- 📌 CHAR-SPEICHER
  local currentChar = charStore[id] or { progress = 0, complete = false }
  local needCharUpdate = (newProgress > (currentChar.progress or 0)) or (newComplete ~= (currentChar.complete or false))
  if needCharUpdate then
    charStore[id] = {
      complete = (newComplete and data.completedBy == playerName) or (currentChar.complete or false),
      progress = (newProgress > (currentChar.progress or 0)) and newProgress or (currentChar.progress or 0),
      completedBy = data.completedBy or currentChar.completedBy,
      date = data.date or currentChar.date,
      lastProgressTime = time(),
      timestamp = timestamp,
      manual = markManual and true or nil,  -- ← manuell nur setzen, wenn explizit gewünscht
    }
    if KAMN and KAMN.debug then
      DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Char++ ➜ " .. id .. " (" .. tostring(charStore[id].progress or 0) .. ")" .. (charStore[id].manual and " [manual]" or ""))
    end
  end

  -- 📌 ACCOUNT-SPEICHER
  local currentAcc = accStore[id] or { progress = 0, complete = false }
  local needAccUpdate = (newProgress > (currentAcc.progress or 0)) or (newComplete ~= (currentAcc.complete or false))
  if needAccUpdate then
    accStore[id] = {
      complete = newComplete or (currentAcc.complete or false),
      progress = (newProgress > (currentAcc.progress or 0)) and newProgress or (currentAcc.progress or 0),
      completedBy = data.completedBy or currentAcc.completedBy,
      date = data.date or currentAcc.date,
      lastProgressTime = time(),
      timestamp = timestamp,
      manual = markManual and true or nil,  -- ← dito
    }
    if KAMN and KAMN.debug then
      DEFAULT_CHAT_FRAME:AddMessage("|cff8888ff[KAM]|r Acc++ ➜ " .. id .. " (" .. tostring(accStore[id].progress or 0) .. ")" .. (accStore[id].manual and " [manual]" or ""))
    end
  end

  -- 🔁 Backfill-/Meta-Auswertung mit dem höheren der beiden Fortschrittswerte
  local effProgress = (accStore[id] and accStore[id].progress) or 0
  if charStore[id] and (charStore[id].progress or 0) > effProgress then
    effProgress = charStore[id].progress or 0
  end
  if type(KAMN_CheckBackfillTriggers) == "function" then
    KAMN_CheckBackfillTriggers(id, effProgress)
  end
end

-- 🔁 Fortschritt aus aktivem Speicher in die Achievement-Objekte laden
--  • Propagiert 'manual' ins UI-Objekt, damit Anzeigen korrekt reagieren.
function KAMN_LoadSavedProgress()
  local db = KAMN_GetActiveProgress()

  -- UI-Puffer zurücksetzen
  local i
  for i = 1, table.getn(KAMN.achievements or {}) do
    local a = KAMN.achievements[i]
    if type(a) == "table" then
      a.complete = false
      a.progress = 0
      a.completedBy = nil
      a.date = nil
      a.lastProgressTime = nil
      a.timestamp = nil
      a.manual = nil
    end
  end

  -- Aus DB übernehmen
  for i = 1, table.getn(KAMN.achievements or {}) do
    local a = KAMN.achievements[i]
    if a and a.id then
      local saved = db[a.id]
      if saved then
        a.complete = saved.complete
        a.progress = saved.progress
        a.completedBy = saved.completedBy
        a.date = saved.date
        a.lastProgressTime = saved.lastProgressTime
        a.timestamp = saved.timestamp
        a.manual = saved.manual  -- ← wichtig für UI/Anzeigen

        local goal = a.value or a.amount or 1
        if a.complete and (not a.progress or a.progress < goal) then
          a.progress = goal
        end
      end
    end
  end

  if KAMN and KAMN.debug then
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Fortschritt geladen (Modus: " .. (KAMN_UseAccountData and "Account" or "Char") .. ")")
  end
end

-- 🧹 Charakter-Fortschritt zurücksetzen (nur im Char-Modus sinnvoll)
function KAMN_ResetCharacterProgress()
  if KAMN_UseAccountData then
    DEFAULT_CHAT_FRAME:AddMessage("|cffffaa00[KAM]|r Reset nicht möglich – Account-Modus aktiv.")
    return
  end

  local key = KAMN_GetCharKey()
  if KAMN_PlayerProgress and KAMN_PlayerProgress[key] then
    KAMN_PlayerProgress[key] = {}

    local i
    for i = 1, table.getn(KAMN.achievements or {}) do
      local a = KAMN.achievements[i]
      if type(a) == "table" then
        a.complete = false
        a.progress = 0
        a.completedBy = nil
        a.date = nil
        a.lastProgressTime = nil
        a.timestamp = nil
        a.manual = nil
      end
    end

    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Charakter-Fortschritt wurde zurückgesetzt.")
  end

  if KAMNMainFrame and KAMNMainFrame:IsShown() and KAMN_UpdateUI then
    KAMN_UpdateUI()
  end
end

-- 🔍 Entwicklerhilfe: Kurzer Dump abgeschlossener Erfolge
function KAMN_DumpProgress()
  local db = KAMN_GetActiveProgress()
  local count = 0
  DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Abgeschlossene Erfolge (aktiver Modus):")
  for id, data in pairs(db or {}) do
    if data and data.complete then
      local line = "• [" .. id .. "] " .. (data.date or "?") .. " (" .. (data.completedBy or "unknown") .. ")"
      if data.manual then
        line = line .. " |cffaaaaaa[manual]|r"
      end
      DEFAULT_CHAT_FRAME:AddMessage(line)
      count = count + 1
    end
  end
  DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Gesamt: " .. count)
end

-- 🔢 Gesamtpunkte berechnen (manuelle Grants ignorieren)
function KAMN_CalculateTotalPoints(isChar)
  local total = 0
  local i
  for i = 1, table.getn(KAMN.achievements or {}) do
    local a = KAMN.achievements[i]
    if a and a.points then
      local d = KAMN_GetAchievementData(a.id)
      if d and d.complete and (not d.manual) then
        total = total + a.points
      end
    end
  end
  return total
end
