-- events/events_skill.lua
-- Trigger-Handler für Berufe und Waffenfähigkeiten (z. B. Erste Hilfe, Schwertkampf)

-- 📌 Fortschritt aus Registry holen (lokale Sicherung)
local function GetRegistryProgress(id)
  return (KAMN_RegistryByID and KAMN_RegistryByID[id] and KAMN_RegistryByID[id].progress) or 0
end

-- 📌 Handler für CHAT_MSG_SKILL – erkennt Skill- und Waffenfortschritte
function KAMN_HandleSkillEvent(event, msg)
  if not msg or type(msg) ~= "string" then return false end
  local updated = false

  for _, a in ipairs(KAMN.achievements or {}) do
    if (a.type == "skill" or a.type == "weapon") and (a.active ~= false) and not a.complete and a.skillname then
      if string.find(string.lower(msg), string.lower(a.skillname)) then
        local current = GetRegistryProgress(a.id)
        KAMN_TriggerProgress(a.id, current + 1, false)
        updated = true

        if KAMN.debug then
          local label = (a.type == "skill") and "Skill" or "Weapon"
          DEFAULT_CHAT_FRAME:AddMessage("[KAM Debug] " .. label .. " Fortschritt: " .. a.name .. " = " .. (current + 1))
        end
      end
    end
  end

  return updated
end
