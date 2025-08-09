-- events/events_skill.lua
-- Trigger-Handler für Berufe und Waffenfähigkeiten (z. B. Erste Hilfe, Schwertkampf)
-- Wichtig: Skill-/Waffen-Erfolge zählen NICHT additiv, sondern immer den höchsten erreichten Wert (Max-Logik)

-- 🔒 Kompatibles string.match (Classic Lua 5.1)
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
  return (KAMN_RegistryByID and KAMN_RegistryByID[id] and KAMN_RegistryByID[id].progress) or 0
end

-- 🧮 Extrahiere Ziel-Skillwert aus der Chatmeldung
-- Beispiele:
-- EN: "Your skill in Defense has increased to 15."
-- DE: "Eure Fertigkeit 'Verteidigung' wurde auf 15 erhöht."
local function ExtractNewSkillValue(msg)
  if not msg or type(msg) ~= "string" then return nil end

  -- generische Zahlensuche: wir nehmen die LETZTE Zahl im String (robust bei Sonderfällen)
  local lastNum = nil
  for num in string.gmatch(msg, "(%d+)") do
    lastNum = num
  end
  if lastNum then
    local n = tonumber(lastNum)
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
  -- Gelingt das nicht, fallen wir optional auf +1 zurück (letzte Zeile).
  local parsedValue = ExtractNewSkillValue(msg)

  for _, a in ipairs(KAMN.achievements or {}) do
    -- Nur Skill-/Waffen-Erfolge, aktiv, unvollständig und mit Skill-Name
    if (a.type == "skill" or a.type == "weapon") and (a.active ~= false) and not a.complete and a.skillname then
      if string.find(string.lower(msg), string.lower(a.skillname)) then
        local current = GetRegistryProgress(a.id)
        local target  = nil

        if parsedValue then
          -- 👉 Max-Logik: niemals additiv, immer den größeren der beiden Stände übernehmen
          if current < parsedValue then
            target = parsedValue
          else
            target = current
          end
        else
          -- Fallback (sollte selten vorkommen): konservativ nur Max( current, current+1 )
          -- Dadurch wird auch hier nicht quer über Chars addiert, sofern current already higher.
          if current + 1 > current then
            target = current + 1
          else
            target = current
          end
        end

        if target and target ~= current then
          KAMN_TriggerProgress(a.id, target, false)
          updated = true

          if KAMN and KAMN.debug then
            local label = (a.type == "skill") and "Skill" or "Weapon"
            DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Debug]|r " .. label .. " Fortschritt: " .. a.name .. " = " .. target .. " (prev " .. current .. ")")
          end
        end
      end
    end
  end

  return updated
end
