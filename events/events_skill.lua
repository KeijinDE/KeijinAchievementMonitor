-- events/events_skill.lua
-- Trigger-Handler für Berufe und Waffenfähigkeiten (z. B. Erste Hilfe, Schwertkampf)
-- Wichtig: Skill-/Waffen-Erfolge zählen NICHT additiv, sondern immer den höchsten erreichten Wert (Max-Logik)
-- Kompatibilität: Turtle WoW (1.12), Lua 5.1 (ohne Verwendung von string.gmatch)

-- 🔒 Kompatibles string.match (Classic Lua 5.1 / 5.0 Fallback)
local function SafeMatch(str, pattern)
  if type(str) ~= "string" or type(pattern) ~= "string" then return nil end
  if string and type(string.match) == "function" then
    return (string.match(str, pattern))
  end
  local s, e = string.find(str, pattern)
  if s and e then
    return string.sub(str, s, e)
  end
  return nil
end

-- 📌 Fortschritt aus Registry holen (lokale Sicherung)
local function GetRegistryProgress(id)
  if KAMN_RegistryByID and KAMN_RegistryByID[id] and KAMN_RegistryByID[id].progress then
    return KAMN_RegistryByID[id].progress
  end
  return 0
end

-- 🧮 Extrahiere Ziel-Skillwert aus der Chatmeldung
-- Beispiele:
-- EN: "Your skill in Defense has increased to 15."
-- DE: "Eure Fertigkeit 'Verteidigung' wurde auf 15 erhöht."
-- Hinweis: Kein string.gmatch verwenden → wir iterieren mit string.find über "%d+"
local function ExtractNewSkillValue(msg)
  if not msg or type(msg) ~= "string" then return nil end

  local lastNumStr = nil
  local pos = 1
  while true do
    local s, e = string.find(msg, "%d+", pos)
    if not s then break end
    lastNumStr = string.sub(msg, s, e)
    pos = e + 1
  end

  if lastNumStr then
    local n = tonumber(lastNumStr)
    if n and n >= 0 then
      return n
    end
  end
  return nil
end

-- 📌 Handler für CHAT_MSG_SKILL – erkennt Skill- und Waffenfortschritte
function KAMN_HandleSkillEvent(event, msg)
  if not msg or type(msg) ~= "string" then return false end
  local updated = false

  -- Versuche, den neuen Zielwert aus der Meldung zu lesen.
  -- Gelingt das nicht, fällt der Fallback unten auf Max(current, current+1) zurück.
  local parsedValue = ExtractNewSkillValue(msg)

  local ach = KAMN and KAMN.achievements or {}
  local i
  for i = 1, (table.getn and table.getn(ach) or 0) do
    local a = ach[i]
    -- Nur Skill-/Waffen-Erfolge, aktiv, unvollständig und mit Skill-Name
    if a
      and (a.type == "skill" or a.type == "weapon")
      and (a.active ~= false)
      and (not a.complete)
      and a.skillname
    then
      -- Case-insensitive Match auf den Skillnamen im Chattext
      local msgLow = string.lower(msg)
      local skLow  = string.lower(a.skillname)
      if string.find(msgLow, skLow, 1, true) then
        local current = GetRegistryProgress(a.id)
        local target

        if parsedValue then
          -- 👉 Max-Logik: niemals additiv, immer den größeren der beiden Stände übernehmen
          if current < parsedValue then
            target = parsedValue
          else
            target = current
          end
        else
          -- Fallback: konservativ nur Max(current, current+1)
          local nextVal = current + 1
          if nextVal > current then
            target = nextVal
          else
            target = current
          end
        end

        if target and target ~= current then
          KAMN_TriggerProgress(a.id, target, false)
          updated = true

          if KAMN and KAMN.debug then
            local label = (a.type == "skill") and "Skill" or "Weapon"
            DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Debug]|r " .. label .. " Fortschritt: " .. (a.name or a.skillname or "?") .. " = " .. target .. " (prev " .. current .. ")")
          end
        end
      end
    end
  end

  return updated
end
