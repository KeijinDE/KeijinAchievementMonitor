-- ui_config.lua – Konsistente Config-UI (Classic 1.12)
-- • Einheitliche Chat-Ausgaben: |cff88ff88[KAM]|r <Label>: enabled/disabled (grün/rot)
-- • Linke Spalte sortiert: ON/OFF-Buttons → Abstand → Show/Play-Buttons
-- • Rechte Spalte: Reset, Reset Position, Toggle Storage Mode (Popup) + Live-Label
-- • Classic-kompatibel: kein SetSize(), kein #table, kein _G, keine OnUpdate/elapsed

-- =========================================================
-- 🔧 Wrapper-Helfer (nutzt KAMN_CreateDialogButton aus ui_main.lua, fällt sonst zurück)
-- =========================================================
local function KAMN_MakeWrappedButton(parent, label, width, height, clickFunc, tooltipText)
  if KAMN_CreateDialogButton then
    local w, b = KAMN_CreateDialogButton(parent, label, width, height, clickFunc, tooltipText)
    return w, b, true
  end

  local w = CreateFrame("Frame", nil, parent)
  w:SetWidth(width or 140)
  w:SetHeight(height or 20)
  w:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true, tileSize = 16, edgeSize = 12,
    insets = { left = 2, right = 2, top = 2, bottom = 2 }
  })
  w:SetBackdropColor(0.1, 0.2, 0.1, 1.0)

  local b = CreateFrame("Button", nil, w, "UIPanelButtonTemplate")
  b:SetWidth(width or 140)
  b:SetHeight(height or 20)
  b:SetPoint("CENTER", w, "CENTER", 0, 0)
  b:SetText(label)

  if type(clickFunc) == "function" then b:SetScript("OnClick", clickFunc) end
  if tooltipText then
    b:SetScript("OnEnter", function()
      GameTooltip:SetOwner(b, "ANCHOR_RIGHT")
      GameTooltip:SetText(tooltipText, 1, 1, 1)
      GameTooltip:Show()
    end)
    b:SetScript("OnLeave", function() GameTooltip:Hide() end)
  end

  return w, b, false
end

-- =========================================================
-- 🔘 Status-Button (ON/OFF): Wrapper + kleine Statusbox + Text
--    Classic-sicherer Click-Handler (this:GetParent())
-- =========================================================
local function KAMN_CreateStatusButton(parent, opts)
  -- opts: { label, tooltip, getStateFunc, onClick, width, height }
  local width = opts.width or 200
  local height = opts.height or 22
  local wrapper, btn = KAMN_MakeWrappedButton(parent, opts.label, width, height, nil, opts.tooltip)

  -- Status-Symbol (links)
  local box = wrapper:CreateTexture(nil, "OVERLAY")
  box:SetTexture("Interface\\Buttons\\WHITE8x8")
  box:SetWidth(10)
  box:SetHeight(10)
  box:SetPoint("LEFT", wrapper, "LEFT", 6, 0)

  -- Status-Text
  local st = wrapper:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  st:SetPoint("LEFT", box, "RIGHT", 6, 0)
  st:SetText("")

  -- Button-Text etwas nach rechts (nur Optik)
  if btn and btn.GetFontString then
    local fs = btn:GetFontString()
    if fs then
      fs:ClearAllPoints()
      fs:SetPoint("CENTER", btn, "CENTER", 18, 0)
    end
  end

  -- Update-Funktion
  wrapper.KAMN_UpdateStatus = function(self)
    local on = false
    if type(opts.getStateFunc) == "function" then on = opts.getStateFunc() and true or false end
    if on then
      box:SetVertexColor(0.53, 1.0, 0.53, 1.0) -- grün
      st:SetText("|cff88ff88ON|r")
    else
      box:SetVertexColor(1.0, 0.3, 0.3, 1.0)   -- rot
      st:SetText("|cffff5555OFF|r")
    end
  end

  btn:SetScript("OnClick", function()
    if type(opts.onClick) == "function" then opts.onClick() end
    local parentWrapper = this and this:GetParent()
    if parentWrapper and parentWrapper.KAMN_UpdateStatus then
      parentWrapper:KAMN_UpdateStatus()
    end
  end)

  wrapper:KAMN_UpdateStatus()
  return wrapper, btn
end

-- =========================================================
-- 🧱 Trennzeile (horizontale Linie) für optischen Abstand
-- =========================================================
local function KAMN_CreateSeparator(parent, width)
  local line = parent:CreateTexture(nil, "ARTWORK")
  line:SetTexture(1, 1, 1, 0.25)
  line:SetHeight(1)
  line:SetWidth(width or 180)
  return line
end

-- ============================
-- ⚙ Hauptfunktion: Settings UI
-- ============================
function KAMN_CreateSettingsFrame()
  if KAMNConfigFrame then return end

  local f = CreateFrame("Frame", "KAMNConfigFrame", UIParent)
  f:SetWidth(420)
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
  f.title:SetText("|cff88ff88KAM Settings|r")

  -- 📎 Bereichs-Labels
  local leftLabel = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  leftLabel:SetPoint("TOPLEFT", f, "TOPLEFT", 20, -28)
  leftLabel:SetText("General")

  local rightLabel = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  rightLabel:SetPoint("TOPRIGHT", f, "TOPRIGHT", -40, -28)
  rightLabel:SetTextColor(1, 1, 0.533)
  rightLabel:SetText("Data Options")

  -- │ Vertikale Linie
  local vLine = f:CreateTexture(nil, "ARTWORK")
  vLine:SetTexture(1, 1, 1, 0.4)
  vLine:SetWidth(1)
  vLine:SetHeight(230)
  vLine:SetPoint("TOP", f, "TOP", 0, -36)

  -- ======================
  -- ⬅ Linke Spalte (UI)
  -- Reihenfolge: ON/OFF → (Abstand) → Show/Play
  -- ======================

  -- 🔊 Toggle Debug Mode (ON/OFF)
  local debugBtn = KAMN_CreateStatusButton(f, {
    label = "Toggle Debug Mode",
    tooltip = "Enable/Disable verbose debug messages in chat.",
    getStateFunc = function() return KAMN and KAMN.debug == true end,
    onClick = function()
      KAMN = KAMN or {}
      KAMN.debug = not KAMN.debug
      local msg = KAMN.debug and "|cff88ff88enabled|r" or "|cffff5555disabled|r"
      DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Debug Mode: " .. msg)
    end,
    width = 180, height = 22
  })
  debugBtn:SetPoint("TOPLEFT", f, "TOPLEFT", 20, -48)

  -- 🔔 Toggle Notify Frame (ON/OFF)
  local notifyBtn = KAMN_CreateStatusButton(f, {
    label = "Toggle Notify Frame",
    tooltip = "Show/Hide the floating notify frame.",
    getStateFunc = function()
      KAMN_Settings = KAMN_Settings or {}
      return KAMN_Settings.NotifyEnabled == true
    end,
    onClick = function()
      KAMN_Settings = KAMN_Settings or {}
      KAMN_Settings.NotifyEnabled = not KAMN_Settings.NotifyEnabled
      local msg = KAMN_Settings.NotifyEnabled and "|cff88ff88enabled|r" or "|cffff5555disabled|r"
      DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Notify Frame: " .. msg)
    end,
    width = 180, height = 22
  })
  notifyBtn:SetPoint("TOPLEFT", debugBtn, "BOTTOMLEFT", 0, -10)

  -- 🔊 Toggle Notify Sound (ON/OFF)
  local soundBtn = KAMN_CreateStatusButton(f, {
    label = "Toggle Notify Sound",
    tooltip = "Enable/Disable sound on achievement notify.",
    getStateFunc = function()
      KAMN_Settings = KAMN_Settings or {}
      return KAMN_Settings.NotifySoundEnabled == true
    end,
    onClick = function()
      KAMN_Settings = KAMN_Settings or {}
      KAMN_Settings.NotifySoundEnabled = not KAMN_Settings.NotifySoundEnabled
      local msg = KAMN_Settings.NotifySoundEnabled and "|cff88ff88enabled|r" or "|cffff5555disabled|r"
      DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Notify Sound: " .. msg)
    end,
    width = 180, height = 22
  })
  soundBtn:SetPoint("TOPLEFT", notifyBtn, "BOTTOMLEFT", 0, -10)

  -- 🛈 Tooltip Info (ON/OFF)
  local tooltipBtn = KAMN_CreateStatusButton(f, {
    label = "Toggle Tooltip Info",
    tooltip = "Show extra info in item/achievement tooltips.",
    getStateFunc = function()
      KAMN_Options = KAMN_Options or {}
      return KAMN_Options.showTooltipInfo == true
    end,
    onClick = function()
      KAMN_Options = KAMN_Options or {}
      KAMN_Options.showTooltipInfo = not KAMN_Options.showTooltipInfo
      local msg = KAMN_Options.showTooltipInfo and "|cff88ff88enabled|r" or "|cffff5555disabled|r"
      DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Tooltip Info: " .. msg)
    end,
    width = 180, height = 22
  })
  tooltipBtn:SetPoint("TOPLEFT", soundBtn, "BOTTOMLEFT", 0, -10)

  -- Kleiner Abstand (Separator)
  local sepLeft = KAMN_CreateSeparator(f, 180)
  sepLeft:SetPoint("TOPLEFT", tooltipBtn, "BOTTOMLEFT", 10, -8)
  sepLeft:SetVertexColor(1, 1, 1, 0.20)

  -- 🪧 Show Notify Test (Button)
  local showTestWrapper
  showTestWrapper = KAMN_MakeWrappedButton(f, "Show Notify Test", 180, 22, function()
    if KAMN_ShowNotify then
      KAMN_ShowNotify("Test message: Works!")
    end
    -- keine Statusmeldung nötig; der Test selbst zeigt die Notify
  end, "Play a test notification (visual only)")
  showTestWrapper:SetPoint("TOPLEFT", sepLeft, "BOTTOMLEFT", -10, -10)

  -- ▶ Play Last Achievement (Button)
  local replayWrapper
  replayWrapper = KAMN_MakeWrappedButton(f, "Play Last Achievement", 180, 22, function()
    if KAMN_LastNotifyQueue and KAMN_ShowNotify then
      for i = 1, table.getn(KAMN_LastNotifyQueue) do
        KAMN_ShowNotify(KAMN_LastNotifyQueue[i])
      end
    end
  end, "Replay the last shown achievement notifications")
  replayWrapper:SetPoint("TOPLEFT", showTestWrapper, "BOTTOMLEFT", 0, -10)

  -- =======================
  -- ➡ Rechte Spalte (Data)
  -- =======================

  -- ↩ Reset Achievements (Wrapper + Popup)
  local resetWrapper
  resetWrapper = KAMN_MakeWrappedButton(f, "|cffffff88Reset Achievements|r", 180, 22, function()
    StaticPopupDialogs["KAMN_RESET_CONFIRM"] = {
      text = "Do you really want to reset all achievement progress?\nThis will also remove completed legacy achievements.",
      button1 = "Yes", button2 = "No",
      OnAccept = function()
        if KAMN_ResetCharacterProgress then
          KAMN_ResetCharacterProgress()
          DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Progress Reset: |cffff5555done|r")
        end
      end,
      timeout = 0, whileDead = true, hideOnEscape = true, showAlert = true,
    }
    StaticPopup_Show("KAMN_RESET_CONFIRM")
  end, "Reset all progress for the current storage scope")
  resetWrapper:SetPoint("TOPRIGHT", f, "TOPRIGHT", -20, -48)

  -- ↩ Reset Frame Position (Wrapper + Popup)
  local resetPosWrapper
  resetPosWrapper = KAMN_MakeWrappedButton(f, "|cffffff88Reset Frame Position|r", 180, 22, function()
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
          DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Frame Position: |cff88ff88reset|r")
        else
          DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Position will reset on next open.")
        end
      end,
      timeout = 0, whileDead = true, hideOnEscape = true, showAlert = true,
    }
    StaticPopup_Show("KAMN_RESET_FRAME_POSITION")
  end, "Reset the main window position to default")
  resetPosWrapper:SetPoint("TOPRIGHT", resetWrapper, "BOTTOMRIGHT", 0, -10)

  -- ⚠ Popup zur Bestätigung des Storage Mode
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
        DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Storage Mode: |cff88ff88switched|r")
      else
        DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Storage Mode: |cffff5555function missing|r")
      end
    end,
    timeout = 0, whileDead = true, hideOnEscape = true, showAlert = true,
  }

-- 🔁 Storage Mode Switch (nur Button mit Popup) – jetzt links auf Höhe des letzten linken Buttons
local storageBtnWrapper
storageBtnWrapper = KAMN_MakeWrappedButton(f, "Toggle Storage Mode", 180, 22, function()
  StaticPopup_Show("KAMN_STORAGE_MODE_CONFIRM")
end, "Switch between Account-wide and Character-only data storage")
storageBtnWrapper:SetPoint("TOPLEFT", replayWrapper, "TOPRIGHT", 20, 0) -- gleiche Höhe wie Play Last Achievement


  -- =======================================
  -- 📦 Live-Anzeige unten rechts
  -- =======================================
  f.storageModeLabel = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  f.storageModeLabel:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -10, 10)
  f.storageModeLabel:SetTextColor(1, 1, 0.533)
  local liveMode = KAMN_UseAccountData and "Account" or "Character"
  f.storageModeLabel:SetText("" .. liveMode)

  KAMNConfigFrame = f
  f:Hide()
end
