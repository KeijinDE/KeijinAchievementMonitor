-- events/events_zone.lua
-- Trigger-Handler für Zonenentdeckungen über UI_INFO_MESSAGE

-- 📌 Handler für UI_INFO_MESSAGE – Zonen entdecken
function KAMN_HandleZoneDiscovery(event, msg)
  if not msg or type(msg) ~= "string" then return false end

  local prefix = "Discovered: "
  local discoveredZone = nil
  local updated = false

  if string.find(msg, prefix) then
    discoveredZone = string.sub(msg, string.len(prefix) + 1)
  end

  if discoveredZone then
    for _, a in ipairs(KAMN.achievements or {}) do
      if a.type == "discover" and (a.active ~= false) and not a.complete and a.zonename and string.lower(a.zonename) == string.lower(discoveredZone) then
        KAMN_TriggerProgress(a.id, 1, false)
        updated = true

        if KAMN.debug then
          DEFAULT_CHAT_FRAME:AddMessage("[KAM Debug] Discover ausgelöst: " .. a.name)
        end
      end
    end
  end

  return updated
end
