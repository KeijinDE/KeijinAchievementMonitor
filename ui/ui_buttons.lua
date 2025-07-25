-- ui_buttons.lua
-- Enthält den einheitlichen Button-Stil und UI-Buttons für KAMN

-- 🔘 Klassischer Dialog-Stil-Button
function KAMN_CreateDialogButton(parent, label, width, height, clickFunc)
  local wrapper = CreateFrame("Frame", nil, parent)
  wrapper:SetWidth(width or 80)
  wrapper:SetHeight(height or 20)

  wrapper:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true, tileSize = 16, edgeSize = 12,
    insets = { left = 2, right = 2, top = 2, bottom = 2 }
  })
  wrapper:SetBackdropColor(0.1, 0.2, 0.1, 1.0)

  local btn = CreateFrame("Button", nil, wrapper)
  btn:SetAllPoints(wrapper)

  local text = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  text:SetPoint("CENTER", btn, "CENTER", 0, 0)
  text:SetTextColor(1.0, 0.9, 0.4)
  text:SetText(label)
  btn:SetFontString(text)

  local hl = btn:CreateTexture(nil, "HIGHLIGHT")
  hl:SetTexture(1.0, 1.0, 0.6, 0.1)
  hl:SetPoint("TOPLEFT", btn, "TOPLEFT", 4, -4)
  hl:SetPoint("BOTTOMRIGHT", btn, "BOTTOMRIGHT", -4, 4)
  btn:SetHighlightTexture(hl)

  if type(clickFunc) == "function" then
    btn:SetScript("OnClick", clickFunc)
  end

return wrapper, btn

end

-- 🔳 Filter-Buttons All / Incomplete / Completed
function KAMN_CreateFilterButtons(parentFrame)
  local filterWrapper = CreateFrame("Frame", nil, parentFrame)
  filterWrapper:SetWidth(270)
  filterWrapper:SetHeight(20)
  filterWrapper:SetPoint("TOPLEFT", parentFrame, "TOPLEFT", 10, -40)

  local filterAll = KAMN_CreateDialogButton(filterWrapper, "All", 70, 20, function()
    currentCategory = "ALL"
    if KAMN_ClearDetailSection then KAMN_ClearDetailSection() end
    currentFilter = "ALL"
    KAM_ScrollOffset = 0
    if KAMNMainFrame and KAMNMainFrame.categoryBtn then
      KAMNMainFrame.categoryBtn:SetText("Category: All Categories")
    end
    KAMN_UpdateUI()
  end)
  filterAll:SetPoint("LEFT", filterWrapper, "LEFT", 0, 0)

  local filterOpen = KAMN_CreateDialogButton(filterWrapper, "Incomplete", 90, 20, function()
    currentCategory = "ALL"
    if KAMN_ClearDetailSection then KAMN_ClearDetailSection() end
    currentFilter = "OPEN"
    KAM_ScrollOffset = 0
    if KAMNMainFrame and KAMNMainFrame.categoryBtn then
      KAMNMainFrame.categoryBtn:SetText("Category: All Categories")
    end
    KAMN_UpdateUI()
  end)
  filterOpen:SetPoint("LEFT", filterAll, "RIGHT", 5, 0)

  local filterDone = KAMN_CreateDialogButton(filterWrapper, "Completed", 90, 20, function()
    currentCategory = "ALL"
    if KAMN_ClearDetailSection then KAMN_ClearDetailSection() end
    currentFilter = "DONE"
    KAM_ScrollOffset = 0
    if KAMNMainFrame and KAMNMainFrame.categoryBtn then
      KAMNMainFrame.categoryBtn:SetText("Category: All Categories")
    end
    KAMN_UpdateUI()
  end)
  filterDone:SetPoint("LEFT", filterOpen, "RIGHT", 5, 0)

  return filterWrapper
end

-- 🔲 Mini-Buttons: A (All), X (Incomplete), D (Done)
function KAMN_CreateMiniButtons(parentFrame)
  local buttons = {}

  -- 🅰 All
  buttons.all = KAMN_CreateDialogButton(parentFrame, "|cff88ff88A|r", 24, 18, function()
    currentFilter = "ALL"
    KAM_ScrollOffset = 0
    KAMN_UpdateUI()
  end)
  buttons.all:SetPoint("TOPRIGHT", parentFrame, "TOPRIGHT", -10 - (24 + 5) * 2, -94)
  buttons.all:SetScript("OnEnter", function()
    GameTooltip:SetOwner(buttons.all, "ANCHOR_LEFT")
    GameTooltip:SetText("Show all achievements in current category", 1, 1, 1)
  end)
  buttons.all:SetScript("OnLeave", GameTooltip.Hide)

  -- ❌ Incomplete
  buttons.open = KAMN_CreateDialogButton(parentFrame, "|cff88ff88X|r", 24, 18, function()
    currentFilter = "OPEN"
    KAM_ScrollOffset = 0
    KAMN_UpdateUI()
  end)
  buttons.open:SetPoint("TOPRIGHT", parentFrame, "TOPRIGHT", -10 - (24 + 5), -94)
  buttons.open:SetScript("OnEnter", function()
    GameTooltip:SetOwner(buttons.open, "ANCHOR_LEFT")
    GameTooltip:SetText("Show incomplete achievements", 1, 1, 1)
  end)
  buttons.open:SetScript("OnLeave", GameTooltip.Hide)

  -- ✅ Done
  buttons.done = KAMN_CreateDialogButton(parentFrame, "|cff88ff88D|r", 24, 18, function()
    currentFilter = "DONE"
    KAM_ScrollOffset = 0
    KAMN_UpdateUI()
  end)
  buttons.done:SetPoint("TOPRIGHT", parentFrame, "TOPRIGHT", -10, -94)
  buttons.done:SetScript("OnEnter", function()
    GameTooltip:SetOwner(buttons.done, "ANCHOR_LEFT")
    GameTooltip:SetText("Show completed achievements", 1, 1, 1)
  end)
  buttons.done:SetScript("OnLeave", GameTooltip.Hide)

  return buttons
end


-- 🏠 miniHome (Summary) - ui_dropdown.lua
