-- events_char.lua
-- Handles level-based achievements (PLAYER_LEVEL_UP event)

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LEVEL_UP")

frame:SetScript("OnEvent", function()
  if event ~= "PLAYER_LEVEL_UP" then return end

  local level = arg1 or UnitLevel("player")
  local updated = false

  for _, a in ipairs(KAMN.achievements or {}) do
    if a.type == "level" and not a.complete and a.level and level >= a.level then
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

      if KAMN.debug then
        DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Debug]|r Level-Achievement abgeschlossen: " .. (a.id or "?"))
      end
    end
  end

  if updated and KAMN_UpdateUI then
    KAMN_UpdateUI()
  end
end)
