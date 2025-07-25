-- events/events_reputation.lua
-- Trigger-Handler für Ruf-Fortschritte über Fraktionen

-- 📌 Fortschritt aus Registry holen
local function GetRegistryProgress(id)
  return (KAMN_RegistryByID and KAMN_RegistryByID[id] and KAMN_RegistryByID[id].progress) or 0
end

-- 📌 Handler für CHAT_MSG_COMBAT_FACTION_CHANGE
function KAMN_HandleReputation(event, msg)
  if not msg or type(msg) ~= "string" then return false end

  local gain = tonumber(string.match(msg, "%d+")) or 1
  local updated = false

  for _, a in ipairs(KAMN.achievements or {}) do
    if a.type == "reputation" and (a.active ~= false) and not a.complete and a.faction then
      if string.find(string.lower(msg), string.lower(a.faction)) then
        local current = GetRegistryProgress(a.id)
        KAMN_TriggerProgress(a.id, current + gain, false)
        updated = true

        if KAMN.debug then
          DEFAULT_CHAT_FRAME:AddMessage("[KAM Debug] Ruf bei " .. a.faction .. ": +" .. gain .. " (neu: " .. (current + gain) .. ")")
        end
      end
    end
  end

  return updated
end
