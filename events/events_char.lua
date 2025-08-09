-- events_char.lua
-- Handles level-based achievements (PLAYER_LEVEL_UP event)
-- Classic-kompatibel (Lua 5.1), keine modernen Features

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LEVEL_UP")

frame:SetScript("OnEvent", function()
  if event ~= "PLAYER_LEVEL_UP" then return end

  -- Level aus arg1 (Classic-Event) oder Fallback auf Spielerlevel
  local level = arg1 or UnitLevel("player")
  local updated = false

  for _, a in ipairs(KAMN.achievements or {}) do
    -- Nur Level-Erfolge betrachten
    -- 🔒 Neu: (a.active ~= false) respektieren, damit HC-Erfolge vor Aktivierung nicht auslösen
    if a.type == "level" and (a.active ~= false) and not a.complete and a.level and level >= a.level then

      -- 🔒 Zusätzliche Sicherheitsprüfung:
      -- Wenn der Erfolg explizit HC verlangt, nur werten, wenn der Char HC ist
      if a.requiresHC == true and (not KAMN_IsHardcore or not KAMN_IsHardcore()) then
        -- Nicht werten, da kein HC – weiter zum nächsten Erfolg
      else
        -- Erfolg abschließen
        a.progress = a.level
        a.complete = true
        a.completedBy = UnitName("player")
        a.date = date("%d.%m.%Y %H:%M")
        a.timestamp = time()
        KAMN_SaveProgress(a.id, a)
        updated = true

        if KAMN_ShowNotify then
          KAMN_ShowNotify(a.name)
        end

        if KAMN and KAMN.debug then
          DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Debug]|r Level-Achievement abgeschlossen: " .. (a.id or "?"))
        end
      end
    end
  end

  if updated and KAMN_UpdateUI then
    KAMN_UpdateUI()
  end
end)
