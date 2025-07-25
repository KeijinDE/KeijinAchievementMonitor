-- ui_config.lua – Settings mit Tooltip-Toggle + Bereichslabels + Trennlinie

function KAMN_CreateSettingsFrame()
  if KAMNConfigFrame then return end

  local f = CreateFrame("Frame", "KAMNConfigFrame", UIParent)
  f:SetWidth(400)
  f:SetHeight(360)
  f:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
  f:SetBackdrop({
  bgFile = "Interface/DialogFrame/UI-DialogBox-Background",
  edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
    tile = true, tileSize = 16, edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
  })
  f:SetBackdropColor(0, 0, 0, 1)
  f:SetMovable(true)
  f:EnableMouse(true)
  f:RegisterForDrag("LeftButton")
  f:SetScript("OnDragStart", function() this:StartMoving() end)
  f:SetScript("OnDragStop", function() this:StopMovingOrSizing() end)

  -- ❌ Close
  local close = CreateFrame("Button", nil, f, "UIPanelCloseButton")
  close:SetPoint("TOPRIGHT", f, "TOPRIGHT", -4, -4)

  -- 🏷 Title
  f.title = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  f.title:SetPoint("TOP", f, "TOP", 0, -10)
  f.title:SetText("KAMN Settings")

  -- 📎 Labels
  local leftLabel = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  leftLabel:SetPoint("TOPLEFT", f, "TOPLEFT", 20, -22)
  leftLabel:SetText("|cff88ff88General Settings|r")

  local rightLabel = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  rightLabel:SetPoint("TOPRIGHT", f, "TOPRIGHT", -40, -22)
  rightLabel:SetTextColor(1, 1, 0.533)
  rightLabel:SetText("Data Options")

  -- │ Vertical line
  local vLine = f:CreateTexture(nil, "ARTWORK")
  vLine:SetTexture(1, 1, 1)
  vLine:SetWidth(1)
  vLine:SetHeight(185)
  vLine:SetPoint("TOP", f, "TOP", 0, -30)

  -- 🔘 LEFT SIDE
  local debugBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
  debugBtn:SetWidth(160)
  debugBtn:SetHeight(24)
  debugBtn:SetText("|cff88ff88Toggle Debug Mode|r")
  debugBtn:SetPoint("TOPLEFT", f, "TOPLEFT", 20, -40)
  debugBtn:SetScript("OnClick", function()
    KAMN.debug = not KAMN.debug
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Debug]|r Mode: " .. (KAMN.debug and "On" or "Off"))
  end)

  local dummyBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
  dummyBtn:SetWidth(160)
  dummyBtn:SetHeight(24)
  dummyBtn:SetText("|cff88ff88Show Notify Test|r")
  dummyBtn:SetPoint("TOP", debugBtn, "BOTTOM", 0, -10)
  dummyBtn:SetScript("OnClick", function()
    if KAMN_ShowNotify then
      KAMN_ShowNotify("Test message: Works!")
    end
  end)

  local toggleNotifyBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
  toggleNotifyBtn:SetWidth(160)
  toggleNotifyBtn:SetHeight(24)
  toggleNotifyBtn:SetText("|cff88ff88Toggle Notify Frame|r")
  toggleNotifyBtn:SetPoint("TOP", dummyBtn, "BOTTOM", 0, -10)
  toggleNotifyBtn:SetScript("OnClick", function()
    KAMN_Settings = KAMN_Settings or {}
    KAMN_Settings.NotifyEnabled = not KAMN_Settings.NotifyEnabled
    local state = KAMN_Settings.NotifyEnabled and "enabled" or "disabled"
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r NotifyFrame is now " .. state .. ".")
  end)

  local replayBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
  replayBtn:SetWidth(160)
  replayBtn:SetHeight(24)
  replayBtn:SetText("|cff88ff88Play Last Achievement|r")
  replayBtn:SetPoint("TOP", toggleNotifyBtn, "BOTTOM", 0, -10)
  replayBtn:SetScript("OnClick", function()
    if KAMN_LastNotifyQueue then
      for i = 1, table.getn(KAMN_LastNotifyQueue) do
        KAMN_ShowNotify(KAMN_LastNotifyQueue[i])
      end
    end
  end)

  -- 🔘 RIGHT SIDE
  local resetBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
  resetBtn:SetWidth(160)
  resetBtn:SetHeight(24)
  resetBtn:SetText("|cffffff88Reset Achievements|r")
  resetBtn:SetPoint("TOPRIGHT", f, "TOPRIGHT", -20, -40)
  resetBtn:SetScript("OnClick", function()
    StaticPopupDialogs["KAMN_RESET_CONFIRM"] = {
      text = "Do you really want to reset all achievement progress?\nThis will also remove completed legacy achievements.",
      button1 = "Yes", button2 = "No",
      OnAccept = function()
        if KAMN_ResetCharacterProgress then
          KAMN_ResetCharacterProgress()
        end
      end,
      timeout = 0, whileDead = true, hideOnEscape = true, showAlert = true,
    }
    StaticPopup_Show("KAMN_RESET_CONFIRM")
  end)

 -- ↩ Reset Frame Position
local resetPosBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
resetPosBtn:SetWidth(160)
resetPosBtn:SetHeight(24)
resetPosBtn:SetText("|cffffff88Reset Frame Position|r")
resetPosBtn:SetPoint("TOP", resetBtn, "BOTTOM", 0, -10)
resetPosBtn:SetScript("OnClick", function()
  StaticPopupDialogs["KAMN_RESET_FRAME_POSITION"] = {
    text = "Do you really want to reset the position of the achievement frame?",
    button1 = "Yes",
    button2 = "No",
    OnAccept = function()
      KAMN_CharacterDB = KAMN_CharacterDB or {}
      KAMN_CharacterDB.MainFrameX = 0
      KAMN_CharacterDB.MainFrameY = 0
      if KAMNMainFrame then
        KAMNMainFrame:ClearAllPoints()
  KAMNMainFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 30, -30)

        KAMNMainFrame:StopMovingOrSizing()
        DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Frame position reset.")
      else
        DEFAULT_CHAT_FRAME:AddMessage("|cffffff00[KAM]|r Position will reset on next open.")
      end
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    showAlert = true,
  }
  StaticPopup_Show("KAMN_RESET_FRAME_POSITION")
end)

StaticPopupDialogs["KAMN_STORAGE_MODE_CONFIRM"] = {
  text = "Changing the storage mode can corrupt your achievement data.\nDo you really want to continue?",
  button1 = "Yes",
  button2 = "No",
  OnAccept = function()
    if KAMN_ToggleStorageMode then
      KAMN_ToggleStorageMode()

      if KAMNConfigFrame and KAMNConfigFrame.storageModeLabel then
        local label = "" .. (KAMN_UseAccountData and "Account" or "Character")
        KAMNConfigFrame.storageModeLabel:SetText(label)
      end

      DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Storage mode switched.")
    else
      DEFAULT_CHAT_FRAME:AddMessage("|cffff0000[KAM]|r ToggleStorageMode() not found.")
    end
  end,
  timeout = 0,
  whileDead = true,
  hideOnEscape = true,
  showAlert = true,
}

  local storageToggleBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
  storageToggleBtn:SetWidth(160)
  storageToggleBtn:SetHeight(24)
  storageToggleBtn:SetText("|cffffff88Toggle Storage Mode|r")
  storageToggleBtn:SetPoint("TOP", resetPosBtn, "BOTTOM", 0, -10)
  storageToggleBtn:SetScript("OnClick", function()
    StaticPopup_Show("KAMN_STORAGE_MODE_CONFIRM")
  end)

  -- Trennlinie unten
  local hLine = f:CreateTexture(nil, "ARTWORK")
  hLine:SetTexture(1, 1, 1, 0.3)
  hLine:SetHeight(1)
  hLine:SetPoint("TOPLEFT", f, "TOPLEFT", 10, -230)
  hLine:SetPoint("TOPRIGHT", f, "TOPRIGHT", -10, -230)

  -- 🧪 Tooltip Toggle (Experimental)
  local labelExp = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  labelExp:SetPoint("TOPLEFT", f, "TOPLEFT", 20, -240)
  labelExp:SetText("|cff88ccffExperimental Features|r")

  local tooltipBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
  tooltipBtn:SetWidth(160)
  tooltipBtn:SetHeight(24)
  tooltipBtn:SetText("|cff88ccffToggle Tooltip Info|r")
  tooltipBtn:SetPoint("TOPLEFT", labelExp, "BOTTOMLEFT", 0, -10)
  tooltipBtn:SetScript("OnClick", function()
    KAMN_Options = KAMN_Options or {}
    KAMN_Options.showTooltipInfo = not KAMN_Options.showTooltipInfo
    local state = KAMN_Options.showTooltipInfo and "|cff88ff88enabled|r" or "|cffff5555disabled|r"
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ccff[KAM]|r Tooltip Info is now " .. state .. ".")
  end)

  -- 📦 Speichermodusanzeige
  f.storageModeLabel = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  f.storageModeLabel:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -10, 10)
  f.storageModeLabel:SetTextColor(1, 1, 0.533)
  local liveMode = KAMN_UseAccountData and "Account" or "Character"
  f.storageModeLabel:SetText("" .. liveMode)

  KAMNConfigFrame = f
  f:Hide()
end
