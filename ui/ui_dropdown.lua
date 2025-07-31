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

-- 🔧 Initiale Dropdown-Kategorien
local baseCategories = {
  { label = "Summary", value = "summary" },
  { label = "Character", value = "Character" },
  { label = "Combat", value = "Combat" },
  { label = "Exploration", value = "Exploration" },
  { label = "Quests", value = "Quests" },
  { label = "Reputation", value = "Reputation" },
  { label = "Skills", value = "Skills" },
  { label = "Misc", value = "Misc" },
  { label = "Meta", value = "Meta" },
  { label = "Legacy", value = "Legacy" }
}

local knownValues, categories = {}, {}
for i = 1, table.getn(baseCategories) do
  table.insert(categories, baseCategories[i])
  knownValues[baseCategories[i].value] = true
end

-- 🔁 Zusätzliche segmentierte ALL-Kategorien einfügen
if KAMN.AllCategorySegments then
  for _, seg in ipairs(KAMN.AllCategorySegments) do
    if not knownValues[seg.key] then
      table.insert(categories, { label = seg.label, value = seg.key })
      knownValues[seg.key] = true
    end
  end
end

-- 📦 Aufbau der finalen Dropdown-Liste + Label-Map
local categoryMap = {}
for i = 1, table.getn(categories) do
  local cat = categories[i]
  categoryMap[cat.value] = cat.label
end
KAMN_CategoryLabelMap = categoryMap

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
      if KAMN_UpdateDropdownLabel then
  KAMN_UpdateDropdownLabel()
end

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

if KAMN_UpdateDropdownLabel then
  KAMN_UpdateDropdownLabel()
end

  return categoryBtn, categoryList
end

-- UpdateDropDownList

function KAMN_UpdateDropdownLabel()
  if not KAMNMainFrame then return end

  local label = currentCategory or ""

  -- 🔍 Prüfe segmentierte ALL-Kategorien
  if string.find(label, "^ALL") and KAMN.AllCategorySegments then
    for _, seg in ipairs(KAMN.AllCategorySegments) do
      if seg.key == label then
        label = seg.label
        break
      end
    end
  elseif KAMN_CategoryLabelMap and KAMN_CategoryLabelMap[label] then
    label = KAMN_CategoryLabelMap[label]
  end

  local fullLabel = "Category: " .. label

  -- ⬅ Aktualisiere sowohl Button als auch Labeltext
  if KAMNMainFrame.categoryBtn then
    KAMNMainFrame.categoryBtn:SetText(fullLabel)
  end
  if KAMNMainFrame.categoryBtnLabel then
    KAMNMainFrame.categoryBtnLabel:SetText(fullLabel)
  end
end

