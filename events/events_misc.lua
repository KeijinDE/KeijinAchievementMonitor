-- events_misc.lua
-- Handles misc triggers like Beta/Alpha participation or debug simulation

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")

frame:SetScript("OnEvent", function()
  if event ~= "PLAYER_LOGIN" then return end

  for _, a in ipairs(KAMN.achievements or {}) do
    -- Nur misc-Erfolge prüfen, die aktiv und unvollständig sind
    if a.type == "misc" and (a.active ~= false) and not a.complete then
      a.progress = 1
      a.complete = true
      a.completedBy = UnitName("player")
      a.date = date("%d.%m.%Y %H:%M")
      a.timestamp = time()
      KAMN_SaveProgress(a.id, a)

      if KAMN_ShowNotify then
        KAMN_ShowNotify(a.name)
      end

      if KAMN.debug then
        DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Debug]|r Auto-complete for misc achievement: " .. a.id)
      end

      if KAMN_UpdateUI then
        KAMN_UpdateUI()
      end
    end
  end
end)
