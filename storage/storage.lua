-- storage.lua
-- Finalisierte Fortschrittslogik für KeijinAchievementMonitorNEW
-- Account- und Char-Tracking strikt getrennt, mit paralleler Speicherung und Backfill-Erkennung

-- 🔁 Gibt aktiven Fortschrittsspeicher zurück
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

-- 🔁 Holt oder initialisiert Eintrag zu einer ID
function KAMN_GetAchievementData(id)
  local db = KAMN_GetActiveProgress()
  if id and not db[id] then
    db[id] = {}
  end
  return id and db[id] or nil
end

-- 💾 Fortschritt speichern (immer in beiden Speicher)
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

  -- 📌 Fortschritt CHARAKTER
  local currentChar = charStore[id] or { progress = 0, complete = false }
  if newProgress > (currentChar.progress or 0) then
    charStore[id] = {
      complete = (newComplete and data.completedBy == playerName) or false,
      progress = newProgress,
      completedBy = data.completedBy,
      date = data.date,
      lastProgressTime = time(),
      timestamp = timestamp,
    }
    if KAMN.debug then
      DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Char++ ➜ " .. id .. " (" .. newProgress .. ")")
    end
  elseif KAMN.debug then
    --DEFAULT_CHAT_FRAME:AddMessage("|cffffaa88[KAM]|r Kein Update: Char-Fortschritt bereits bei " .. (currentChar.progress or 0))
  end

  -- 📌 Fortschritt ACCOUNT
  local currentAcc = accStore[id] or { progress = 0, complete = false }
  if newProgress > (currentAcc.progress or 0) then
    accStore[id] = {
      complete = newComplete,
      progress = newProgress,
      completedBy = data.completedBy,
      date = data.date,
      lastProgressTime = time(),
      timestamp = timestamp,
    }
    if KAMN.debug then
      DEFAULT_CHAT_FRAME:AddMessage("|cff8888ff[KAM]|r Acc++ ➜ " .. id .. " (" .. newProgress .. ")")
    end
  elseif KAMN.debug then
    --DEFAULT_CHAT_FRAME:AddMessage("|cffffaa88[KAM]|r Kein Update: Acc-Fortschritt bereits bei " .. (currentAcc.progress or 0))
  end

  -- 🔁 Backfill-Trigger aufrufen
  KAMN_CheckBackfillTriggers(id, newProgress)
end

-- 🛠 Dev: Accountdaten manuell setzen
function KAMN_SaveToAccount(id, data)
  if not id or type(data) ~= "table" then return end
  if not KAMN_AccountProgress then KAMN_AccountProgress = {} end

  KAMN_AccountProgress[id] = {
    complete = data.complete,
    progress = data.progress,
    completedBy = data.completedBy or UnitName("player"),
    date = data.date or date("%Y-%m-%d %H:%M"),
    lastProgressTime = data.lastProgressTime or time(),
    timestamp = data.timestamp or time(),
  }

  DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Dev]|r Manuell gespeichert: " .. id)
end

-- 🔁 Lade Fortschritt (Char oder Account, je nach Modus)
function KAMN_LoadSavedProgress()
  local db = KAMN_GetActiveProgress()

  -- 🧹 Reset local progress (UI-Buffer)
  for _, a in ipairs(KAMN.achievements or {}) do
    if type(a) == "table" then
      a.complete = false
      a.progress = 0
      a.completedBy = nil
      a.date = nil
      a.lastProgressTime = nil
      a.timestamp = nil
    end
  end

  -- ⬇️ Lade gespeicherten Fortschritt aus DB
  for _, a in ipairs(KAMN.achievements or {}) do
    if a.id then
      local saved = db[a.id]
      if saved then
        a.complete = saved.complete
        a.progress = saved.progress
        a.completedBy = saved.completedBy
        a.date = saved.date
        a.lastProgressTime = saved.lastProgressTime
        a.timestamp = saved.timestamp

        local goal = a.value or a.amount or 1
        if a.complete and (not a.progress or a.progress < goal) then
          a.progress = goal
        end

        if a.complete and (not a.date or a.date == "") then
          a.date = date("%Y-%m-%d %H:%M")
          if KAMN.debug then
            DEFAULT_CHAT_FRAME:AddMessage("[KAM Debug] Date hinzugefügt: " .. (a.name or "Unknown"))
          end
        end
      end
    end
  end
end

-- 🧼 Löscht nur Fortschritt des aktuellen Chars
function KAMN_ResetCharacterProgress()
  if KAMN_UseAccountData then
    DEFAULT_CHAT_FRAME:AddMessage("|cffffaa00[KAM]|r Reset nicht möglich – Account-Modus aktiv.")
    return
  end

  local key = KAMN_GetCharKey()
  if KAMN_PlayerProgress and KAMN_PlayerProgress[key] then
    KAMN_PlayerProgress[key] = {}

    for _, a in ipairs(KAMN.achievements or {}) do
      if type(a) == "table" then
        a.complete = false
        a.progress = 0
        a.completedBy = nil
        a.date = nil
        a.lastProgressTime = nil
        a.timestamp = nil
      end
    end

    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Charakter-Fortschritt wurde zurückgesetzt.")
  end

  if KAMNMainFrame and KAMNMainFrame:IsShown() and KAMN_UpdateUI then
    KAMN_UpdateUI()
  end
end

-- 🔍 Developer Tool: Fortschritt anzeigen
function KAMN_DumpProgress()
  local db = KAMN_GetActiveProgress()
  local count = 0
  DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Liste abgeschlossener Erfolge im aktiven Modus:")

  for id, data in pairs(db or {}) do
    if data and data.complete then
      local line = string.format("• [%s] %s (%s)", id, data.date or "?", data.completedBy or "unknown")
      DEFAULT_CHAT_FRAME:AddMessage(line)
      count = count + 1
    end
  end

  DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Gesamt abgeschlossen: " .. count)
end

-- 🔢 Berechnet die Gesamtpunktzahl abhängig vom Speicher-Modus (Char/Acc)
function KAMN_CalculateTotalPoints(isChar)
  local total = 0
  for _, a in ipairs(KAMN.achievements or {}) do
    if a.points then
      local d = KAMN_GetAchievementData(a.id, isChar)
      if d and d.complete then
        total = total + a.points
      end
    end
  end
  return total
end
