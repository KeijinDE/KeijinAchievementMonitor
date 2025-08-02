-- 📁 ui_pagination.lua
-- 🔄 Steuerung der segmentierten "ALL"-Ansicht über Vor-/Zurück-Buttons

KAMN_State = KAMN_State or {}
if not KAMN_State.segmentIndex then
  KAMN_State.segmentIndex = 1
end

function KAMN_ChangeSegment(direction)
  local max = table.getn(KAMN.AllCategorySegments)
  KAMN_State.segmentIndex = KAMN_State.segmentIndex + direction
  if KAMN_State.segmentIndex > max then
    KAMN_State.segmentIndex = 1
  elseif KAMN_State.segmentIndex < 1 then
    KAMN_State.segmentIndex = max
  end

  local segment = KAMN.AllCategorySegments[KAMN_State.segmentIndex]
  if segment then
    currentCategory = segment.key
    currentFilter = "ALL"
    KAM_ScrollOffset = 0
    if KAMN_ClearDetailSection then KAMN_ClearDetailSection() end

    -- 📛 Label aktualisieren
    if KAMNMainFrame and KAMNMainFrame.categoryBtnLabel and segment.label then
      KAMNMainFrame.categoryBtnLabel:SetText("" .. segment.label)
    end

    -- 🔍 Erfolgsfilterung inkl. Gruppensperre
    local rawList = KAM_GetFilteredAchievements(segment.category or "ALL", "ALL", nil)
    local filtered = {}

    for i = 1, table.getn(rawList) do
      local a = rawList[i]
      if KAMN_ShouldDisplayAchievement and KAMN_ShouldDisplayAchievement(a) then
        table.insert(filtered, a)
      end
    end

    -- 🔒 Speichern für Scrolllogik
    KAMN_SegmentAchievements = filtered
    KAMN_UpdateUI()
  end
end


-- 🖼 UI-Button-Erstellung (links/rechts)
function KAMN_CreateSegmentButtons(parent)
  local leftBtn = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
  leftBtn:SetWidth(24)
  leftBtn:SetHeight(20)
  leftBtn:SetText("◀")
  leftBtn:SetPoint("TOPLEFT", parent, "TOPLEFT", 10, -30)
  leftBtn:SetScript("OnClick", function()
    KAMN_ChangeSegment(-1)
  end)

  local rightBtn = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
  rightBtn:SetWidth(24)
  rightBtn:SetHeight(20)
  rightBtn:SetText("▶")
  rightBtn:SetPoint("TOPLEFT", parent, "TOPLEFT", 40, -30)
  rightBtn:SetScript("OnClick", function()
    KAMN_ChangeSegment(1)
  end)
end
