-- events/events_reputation.lua
-- Trigger-Handler für Ruf-Fortschritte über Fraktionen
local SafeMatch = SafeMatch or function(str, pattern)
  if type(str) ~= "string" or type(pattern) ~= "string" then return nil end
  if string and type(string.match) == "function" then
    return string.match(str, pattern)
  end
  local s, e = string.find(str, pattern)
  if s and e then return string.sub(str, s, e) end
  return nil
end

-- 📌 Fortschritt aus Registry holen
local function GetRegistryProgress(id)
  return (KAMN_RegistryByID and KAMN_RegistryByID[id] and KAMN_RegistryByID[id].progress) or 0
end

-- 📌 Handler für CHAT_MSG_COMBAT_FACTION_CHANGE
function KAMN_HandleReputation(event, msg)
  if not msg or type(msg) ~= "string" then return false end

  local gain = tonumber(SafeMatch(msg, "%d+")) or 1

  local updated = false

  for _, a in ipairs(KAMN.achievements or {}) do
    if a.type == "reputation" and (a.active ~= false) and not a.complete and a.faction then
      local cleanFaction = string.gsub(string.lower(a.faction), "%s+", "%%s+")
      if string.find(string.lower(msg), cleanFaction) then
        local current = GetRegistryProgress(a.id)
        KAMN_TriggerProgress(a.id, current + gain, false)
        updated = true

        if KAMN.debug then
          DEFAULT_CHAT_FRAME:AddMessage("[KAM Debug] Rep by " .. a.faction .. ": +" .. gain .. " (new: " .. (current + gain) .. ")")
        end
      end
    end
  end

  return updated
end
