-- ui_dropdown.lua
-- Ausgelagerter Dropdown-Code für Kategorie-Auswahl im KAM-Addon

function KAMN_CreateCategoryDropdown(parentFrame)
  local categoryBtn = CreateFrame("Button", nil, parentFrame, "UIPanelButtonTemplate")
  categoryBtn:SetWidth(150)
  categoryBtn:SetHeight(18)
  categoryBtn:SetText("Category: Summary")
  categoryBtn:SetPoint("TOPLEFT", parentFrame, "TOPLEFT", 10, -60)
  
  local categoryList = CreateFrame("Frame", nil, parentFrame)
  categoryList:SetWidth(170)
  categoryList:SetHeight(12 * 18)
  categoryList:SetPoint("TOPLEFT", categoryBtn, "BOTTOMLEFT", 0, 0)
  categoryList:SetBackdrop(nil)
  categoryList:Hide()
  categoryList:SetFrameStrata("DIALOG")
  categoryList:SetFrameLevel(20)

  local baseCategories = {
    { label = "Summary", value = "summary" },
    { label = "Character", value = "Character" },
    { label = "Combat", value = "Combat" },
    { label = "Exploration", value = "Exploration" },
    { label = "Quests", value = "Quests" },
    { label = "Reputation", value = "Reputation" }
  }

  local knownValues, categories = {}, {}
  for i = 1, table.getn(baseCategories) do
    table.insert(categories, baseCategories[i])
    knownValues[baseCategories[i].value] = true
  end

if KAMN and KAMN.achievements then
  for _, a in ipairs(KAMN.achievements) do
    if a.category and not knownValues[a.category] then
      table.insert(categories, { label = a.category, value = a.category })
      knownValues[a.category] = true
    end
  end
end

-- ⏹ Mapping: value → label für spätere Textaktualisierung
KAMN_CategoryLabelMap = {}
for i = 1, table.getn(categories) do
  local cat = categories[i]
  KAMN_CategoryLabelMap[cat.value] = cat.label
end

  for i = 1, table.getn(categories) do
    local cat = categories[i]
    local b = CreateFrame("Button", nil, categoryList, "UIPanelButtonTemplate")
    b:SetWidth(150)
    b:SetHeight(18)
    b:SetText(cat.label)
    b:SetPoint("TOPLEFT", categoryList, "TOPLEFT", 10, -((i - 1) * 18) - 5)
    b:SetScript("OnClick", function()
      currentCategory = cat.value
      if KAMN_ClearDetailSection then KAMN_ClearDetailSection() end
      KAMN_GlobalCategoryView = false
      categoryBtn:SetText("Category: " .. cat.label)
      categoryList:Hide()
      KAM_ScrollOffset = 0
      KAMN_UpdateUI()
    end)
  end

  categoryBtn:SetScript("OnClick", function()
    if categoryList:IsShown() then
      categoryList:Hide()
    else
      categoryList:Show()
    end
  end)
  
  --minihome 
local miniHome = KAMN_CreateDialogButton(parentFrame, "|cff88ff88H|r", 24, 18, function()
  currentCategory = "summary"
  KAMN_GlobalCategoryView = false
  KAM_ScrollOffset = 0
  KAMN_SelectedAchievementIndex = nil

  if KAMN_UpdateDropdownLabel then
    KAMN_UpdateDropdownLabel()
  elseif KAMNMainFrame and KAMNMainFrame.categoryBtn then
    KAMNMainFrame.categoryBtn:SetText("Category: Summary")
  end

  if KAMN_ClearDetailSection then KAMN_ClearDetailSection() end
  KAMN_UpdateUI()
end)
miniHome:SetPoint("TOPLEFT", parentFrame, "TOPLEFT", 10, -94)

local innerButton = select(1, miniHome:GetChildren())
innerButton:SetScript("OnEnter", function()
  GameTooltip:SetOwner(innerButton, "ANCHOR_RIGHT")
  GameTooltip:SetText("Back to Summary View", 1, 1, 1)
end)
innerButton:SetScript("OnLeave", GameTooltip.Hide)


  return categoryBtn, categoryList
end
function KAMN_UpdateDropdownLabel()
  if KAMNMainFrame and KAMNMainFrame.categoryBtn and KAMN_CategoryLabelMap then
    local label = KAMN_CategoryLabelMap[currentCategory] or currentCategory
    KAMNMainFrame.categoryBtn:SetText("Category: " .. label)
  end
end

