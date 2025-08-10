-- events/events_reputation.lua
-- Trigger-Handler für Ruf-Fortschritte über Fraktionen (Classic 1.12 / Lua 5.1)
-- Fix: Eigener lokaler Matcher (kein Konflikt mit globalen SafeMatch), sichere tonumber-Umwandlung.

-- 🔎 Lokaler, konfliktfreier Matcher
local function KAMN_SafeMatch(str, pattern)
  if type(str) ~= "string" or type(pattern) ~= "string" then return nil end
  if string and type(string.match) == "function" then
    return string.match(str, pattern)
  end
  local s, e = string.find(str, pattern)
  if s and e then return string.sub(str, s, e) end
  return nil
end

-- 📌 Progress aus Registry holen (falls vorhanden)
local function GetRegistryProgress(id)
  if KAMN_RegistryByID and KAMN_RegistryByID[id] and KAMN_RegistryByID[id].progress then
    return KAMN_RegistryByID[id].progress
  end
  return 0
end

-- 📌 Handler für CHAT_MSG_COMBAT_FACTION_CHANGE
function KAMN_HandleReputation(event, msg)
  if not msg or type(msg) ~= "string" then return false end

  -- Sichere Zahlenerkennung: fällt auf 1 zurück, wenn nichts gefunden/umwandelbar
  local raw = KAMN_SafeMatch(msg, "(%d+)")
  local gain = 1
  if raw ~= nil then
    local n = tonumber(raw)
    if n then gain = n end
  end

  local updated = false

  -- Prüfe alle aktiven, unvollständigen Ruf-Erfolge mit Fraktionsangabe
  local list = KAMN and KAMN.achievements or {}
  local i
  for i = 1, (type(list) == "table" and table.getn(list) or 0) do
    local a = list[i]
    if a
      and a.type == "reputation"
      and a.faction
      and (a.active ~= false)
      and not a.complete
    then
      -- Fraktionsname tolerant matchen (Whitespace zu %s+)
      local cleanFaction = string.gsub(string.lower(a.faction), "%s+", "%%s+")
      if string.find(string.lower(msg), cleanFaction) then
        local current = GetRegistryProgress(a.id)

        -- Fortschritt erhöhen um 'gain'
        if KAMN_TriggerProgress then
          KAMN_TriggerProgress(a.id, current + gain, false)
          updated = true
        end

        if KAMN and KAMN.debug then
          DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Debug]|r Rep " .. a.faction .. ": +" .. gain .. " → " .. (current + gain))
        end
      end
    end
  end

  return updated
end
