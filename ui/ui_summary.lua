-- ui_summary.lua
-- Summary logic for KeijinAchievementMonitor (summary view with clickable entries)

function KAMN_BuildSummaryLines()
  local total = 0
  local done = 0
  local lastCompleted = nil
  local lastProgressList = {}
  -- Reset detailPoints bei Aufruf
  if KAMNMainFrame.detailPoints then
    KAMNMainFrame.detailPoints:SetText("")
    KAMNMainFrame.detailPoints:Hide()
  end
if KAMNMainFrame.detailExtra then
  KAMNMainFrame.detailExtra:SetText("")
  KAMNMainFrame.detailExtra:Hide()
end
-- 🧹 Clean up metaLinks (Required for UI-Links)
if KAMNMainFrame.metaLinks then
  for _, obj in ipairs(KAMNMainFrame.metaLinks) do
    if obj and obj.Hide then obj:Hide() end
  end
  KAMNMainFrame.metaLinks = {}
end

  for _, a in ipairs(KAMN.achievements or {}) do
    if a.id then
      local data = KAMN_GetAchievementData(a.id)
      if data then
        total = total + 1

        if data.complete then
          done = done + 1
          local ts = data.timestamp or 0
          if (not lastCompleted) or ts > (lastCompleted.meta.timestamp or 0) then
            lastCompleted = { ref = a, meta = data }
          end
        elseif (data.progress or 0) > 0 then
          if data.lastProgressTime and KAMN_ShouldDisplayAchievement(a) then

            table.insert(lastProgressList, { ref = a, meta = data })
          end
        end
      end
    end
  end

  local open = total - done
  
-- 🔢 Dynamisch Punkte zählen basierend auf aktuellem Modus
local totalPoints = 0
local isChar = not KAMN_UseAccountData and true or false

for _, a in ipairs(KAMN.achievements or {}) do
  if a.points then
    local d = KAMN_GetAchievementData(a.id, isChar)
    if d and d.complete then
      totalPoints = totalPoints + a.points
    end
  end
end


  -- Create summary frame if needed
  if not KAMN_SummaryLinesFrame then
    local f = CreateFrame("Frame", "KAMN_SummaryLinesFrame", KAMNMainFrame)
    f:SetWidth(370)
    f:SetHeight(250)
    f:SetPoint("TOPLEFT", KAMNMainFrame, "TOPLEFT", 12, -105)
    f.lines = {}
  end

  -- Clean up existing lines
  if not KAMN_SummaryLinesFrame.lines then
    KAMN_SummaryLinesFrame.lines = {}
  else
    for i = 1, table.getn(KAMN_SummaryLinesFrame.lines) do
      local fs = KAMN_SummaryLinesFrame.lines[i]
      if fs then
        fs:SetText("")
        fs:Hide()
        fs:SetParent(nil)
      end
    end
    for i = table.getn(KAMN_SummaryLinesFrame.lines), 1, -1 do
      table.remove(KAMN_SummaryLinesFrame.lines, i)
    end
  end

  local f = KAMN_SummaryLinesFrame
  local y = 0

  -- 🟦 Overview section
local title1 = f:CreateFontString(nil, "OVERLAY")
title1:SetFont("Fonts\\SKURRI.ttf", 15)
title1:SetText("Achievement Overview")
title1:SetTextColor(1, 1, 0.6) -- Blizzard-Gelb (RGB)
title1:SetShadowOffset(1, -1)
  title1:SetPoint("TOPLEFT", f, "TOPLEFT", 0, y)
  y = y - 16
  table.insert(f.lines, title1)

  local pointLine = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  pointLine:SetPoint("TOPLEFT", f, "TOPLEFT", 4, y)
pointLine:SetText("Total Points: |cffffd700" .. totalPoints .. "|r")

  y = y - 14
  table.insert(f.lines, pointLine)

  local doneLine = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  doneLine:SetPoint("TOPLEFT", f, "TOPLEFT", 4, y)
doneLine:SetText("Completed Achievements: |cff00ff00" .. done .. "|r")

  y = y - 14
  table.insert(f.lines, doneLine)

  local openLine = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  openLine:SetPoint("TOPLEFT", f, "TOPLEFT", 4, y)
openLine:SetText("Incomplete Achievements: |cffff0000" .. open .. "|r")
  y = y - 20
  table.insert(f.lines, openLine)

  -- 🟩 Last completion section
  if lastCompleted then
    local a = lastCompleted.ref
    local data = lastCompleted.meta

local cTitle = f:CreateFontString(nil, "OVERLAY")
cTitle:SetFont("Fonts\\SKURRI.ttf", 15)
cTitle:SetText("Last Completion")
cTitle:SetTextColor(1, 1, 0.6) 
cTitle:SetShadowOffset(1, -1)


    cTitle:SetPoint("TOPLEFT", f, "TOPLEFT", 0, y)
    y = y - 18
    table.insert(f.lines, cTitle)

    local btn = CreateFrame("Button", nil, f)
    btn:SetWidth(370)
    btn:SetHeight(14)
    btn:SetPoint("TOPLEFT", f, "TOPLEFT", 4, y)

    btn.text = btn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    btn.text:SetAllPoints(btn)
    btn.text:SetJustifyH("LEFT")
    btn.text:SetText("|cffdddddd" .. a.name .. "|r")
    btn:SetHitRectInsets(0, 0, 0, 0)

    btn:SetScript("OnClick", function()
      KAMNMainFrame.detailTitle:SetText(a.name or "")
      KAMNMainFrame.detailDesc:SetText(a.description or "")
      local p = (data.progress or 0) .. " / " .. (a.value or 0)
      KAMNMainFrame.detailProgress:SetText("Progress: " .. p)
      KAMNMainFrame.detailMeta:SetText("Completed on: " .. (data.date or "-") .. " by: " .. (data.completedBy or "-"))
      if a.points then
        KAMNMainFrame.detailPoints:SetText("Points: " .. tostring(a.points))
        KAMNMainFrame.detailPoints:Show()
      else
        KAMNMainFrame.detailPoints:SetText("")
        KAMNMainFrame.detailPoints:Hide()
      end
	  
-- 🔗 Meta-Verknüpfung anzeigen (kompakt und inline)
if a.requiredFor and table.getn(a.requiredFor) > 0 then
  if not KAMNMainFrame.metaLinks then
    KAMNMainFrame.metaLinks = {}
  end
  for _, obj in ipairs(KAMNMainFrame.metaLinks) do
    if obj and obj.Hide then obj:Hide() end
  end
  KAMNMainFrame.metaLinks = {}

  -- 🏷️ Label: "Required for:"
  local label = KAMNMainFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  label:SetPoint("TOPLEFT", KAMNMainFrame.detailDesc, "BOTTOMLEFT", 0, -4)
  label:SetText("|cffffffffRequired for:|r")
  table.insert(KAMNMainFrame.metaLinks, label)

  local xOffset = label:GetStringWidth() + 6
  for _, id in ipairs(a.requiredFor) do
    for _, ach in ipairs(KAMN.achievements or {}) do
      if ach.id == id and ach.name then
        local text = KAMNMainFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        text:SetText("|cffffff99" .. ach.name .. "|r")
        text:SetPoint("TOPLEFT", label, "TOPLEFT", xOffset, 0)
        text:SetJustifyH("LEFT")
        table.insert(KAMNMainFrame.metaLinks, text)

        local btn = CreateFrame("Button", nil, KAMNMainFrame)
        btn:SetWidth(text:GetStringWidth())
        btn:SetHeight(12)
        btn:SetPoint("TOPLEFT", text, "TOPLEFT", 0, 0)
        btn:SetScript("OnClick", function()
          KAMNMainFrame.detailTitle:SetText(ach.name or "")
          KAMNMainFrame.detailDesc:SetText(ach.description or "")
          local pdata = KAMN_GetAchievementData(ach.id)
          local p = (pdata.progress or 0) .. " / " .. (ach.value or 0)
          KAMNMainFrame.detailProgress:SetText("Progress: " .. p)
          KAMNMainFrame.detailMeta:SetText("Completed on: " .. (pdata.date or "-") .. " by: " .. (pdata.completedBy or "-"))

          if ach.points then
            KAMNMainFrame.detailPoints:SetText("Points: " .. tostring(ach.points))
            KAMNMainFrame.detailPoints:Show()
          else
            KAMNMainFrame.detailPoints:SetText("")
            KAMNMainFrame.detailPoints:Hide()
          end

          -- Kein rekursives Laden von Meta-Links
          for _, o in ipairs(KAMNMainFrame.metaLinks) do if o.Hide then o:Hide() end end
          KAMNMainFrame.metaLinks = {}
          KAMNMainFrame.detailExtra:Show()
        end)
        table.insert(KAMNMainFrame.metaLinks, btn)

        xOffset = xOffset + text:GetStringWidth() + 10
        break
      end
    end
  end

else
  KAMNMainFrame.detailExtra:SetText("")
  KAMNMainFrame.detailExtra:Hide()
  if KAMNMainFrame.metaLinks then
    for _, obj in ipairs(KAMNMainFrame.metaLinks) do
      if obj and obj.Hide then obj:Hide() end
    end
  end
end

KAMNMainFrame.highlightFrame:SetPoint("TOPLEFT", btn, "TOPLEFT", 0, 0)
KAMNMainFrame.highlightFrame:Show()

-- 🔄 Meta-Helper nach Auswahl updaten (zeigt ?-Button bei Meta)
if type(KAMN_MetaHelper_OnUIUpdated) == "function" then
  KAMN_MetaHelper_OnUIUpdated({ [1] = a }) -- direkter Verweis auf den Meta
  if type(KAMN_MetaHelper_ReanchorToTitle) == "function" then
    KAMN_MetaHelper_ReanchorToTitle()
  end
end

    end)

    y = y - 14
    table.insert(f.lines, btn)

    local dateLine = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    dateLine:SetPoint("TOPLEFT", f, "TOPLEFT", 4, y)
    dateLine:SetText("|cffaaaaaaCompleted on:|r " .. (data.date or "-"))
    y = y - 20
    table.insert(f.lines, dateLine)
  end

  -- 🟨 Recent progress section
  if table.getn(lastProgressList) > 0 then
    table.sort(lastProgressList, function(a, b)
      return a.meta.lastProgressTime > b.meta.lastProgressTime
    end)

local pTitle = f:CreateFontString(nil, "OVERLAY")
pTitle:SetFont("Fonts\\SKURRI.ttf", 15)
pTitle:SetText("Recent Progress")
pTitle:SetTextColor(1, 1, 0.6) -- Blizzard-Gelb (RGB)
pTitle:SetShadowOffset(1, -1)
    pTitle:SetPoint("TOPLEFT", f, "TOPLEFT", 0, y)
    y = y - 18
    table.insert(f.lines, pTitle)

    for i = 1, math.min(5, table.getn(lastProgressList)) do
      local a = lastProgressList[i].ref
      local data = lastProgressList[i].meta

      local btn = CreateFrame("Button", nil, f)
      btn:SetWidth(370)
      btn:SetHeight(14)
      btn:SetPoint("TOPLEFT", f, "TOPLEFT", 4, y)

      btn.text = btn:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
      btn.text:SetAllPoints(btn)
      btn.text:SetJustifyH("LEFT")
      btn.text:SetText(string.format("|cffcccccc%s:|r %d/%d", a.name or "-", data.progress or 0, a.value or 0))
      btn:SetHitRectInsets(0, 0, 0, 0)

      btn:SetScript("OnClick", function()
        KAMNMainFrame.detailTitle:SetText(a.name or "")
        KAMNMainFrame.detailDesc:SetText(a.description or "")
        local p = (data.progress or 0) .. " / " .. (a.value or 0)
        local date = data.date or "-"
        local by = data.completedBy or "-"
        KAMNMainFrame.detailProgress:SetText("Progress: " .. p)
        KAMNMainFrame.detailMeta:SetText("Completed on: " .. date .. " by: " .. by)
        if a.points then
          KAMNMainFrame.detailPoints:SetText("Points: " .. tostring(a.points))
          KAMNMainFrame.detailPoints:Show()
        else
          KAMNMainFrame.detailPoints:SetText("")
          KAMNMainFrame.detailPoints:Hide()
        end
		
-- 🔗 Meta-Verknüpfung anzeigen (kompakt und inline)
if a.requiredFor and table.getn(a.requiredFor) > 0 then
  if not KAMNMainFrame.metaLinks then
    KAMNMainFrame.metaLinks = {}
  end
  for _, obj in ipairs(KAMNMainFrame.metaLinks) do
    if obj and obj.Hide then obj:Hide() end
  end
  KAMNMainFrame.metaLinks = {}

  -- 🏷️ Label: "Required for:"
  local label = KAMNMainFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  label:SetPoint("TOPLEFT", KAMNMainFrame.detailDesc, "BOTTOMLEFT", 0, -4)
  label:SetText("|cffffffffRequired for:|r")
  table.insert(KAMNMainFrame.metaLinks, label)

  local xOffset = label:GetStringWidth() + 6
  for _, id in ipairs(a.requiredFor) do
    for _, ach in ipairs(KAMN.achievements or {}) do
      if ach.id == id and ach.name then
        local text = KAMNMainFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        text:SetText("|cffffff99" .. ach.name .. "|r")
        text:SetPoint("TOPLEFT", label, "TOPLEFT", xOffset, 0)
        text:SetJustifyH("LEFT")
        table.insert(KAMNMainFrame.metaLinks, text)

        local btn = CreateFrame("Button", nil, KAMNMainFrame)
        btn:SetWidth(text:GetStringWidth())
        btn:SetHeight(12)
        btn:SetPoint("TOPLEFT", text, "TOPLEFT", 0, 0)
        btn:SetScript("OnClick", function()
          KAMNMainFrame.detailTitle:SetText(ach.name or "")
          KAMNMainFrame.detailDesc:SetText(ach.description or "")
          local pdata = KAMN_GetAchievementData(ach.id)
          local p = (pdata.progress or 0) .. " / " .. (ach.value or 0)
          KAMNMainFrame.detailProgress:SetText("Progress: " .. p)
          KAMNMainFrame.detailMeta:SetText("Completed on: " .. (pdata.date or "-") .. " by: " .. (pdata.completedBy or "-"))

          if ach.points then
            KAMNMainFrame.detailPoints:SetText("Points: " .. tostring(ach.points))
            KAMNMainFrame.detailPoints:Show()
          else
            KAMNMainFrame.detailPoints:SetText("")
            KAMNMainFrame.detailPoints:Hide()
          end

          -- Kein rekursives Laden von Meta-Links
for _, o in ipairs(KAMNMainFrame.metaLinks) do if o.Hide then o:Hide() end end
KAMNMainFrame.metaLinks = {}
KAMNMainFrame.detailExtra:Show()

-- 🔄 Meta-Helper nach Auswahl updaten (zeigt ?-Button bei Meta)
if type(KAMN_MetaHelper_OnUIUpdated) == "function" then
  local idx = KAMN_SelectedAchievementIndex or 1
  local tempMap = {}
  tempMap[idx] = ach
  KAMN_MetaHelper_OnUIUpdated(tempMap)

  if type(KAMN_MetaHelper_ReanchorToTitle) == "function" then
    KAMN_MetaHelper_ReanchorToTitle()
  end
end


        end)
        table.insert(KAMNMainFrame.metaLinks, btn)

        xOffset = xOffset + text:GetStringWidth() + 10
        break
      end
    end
  end

else
  KAMNMainFrame.detailExtra:SetText("")
  KAMNMainFrame.detailExtra:Hide()
  if KAMNMainFrame.metaLinks then
    for _, obj in ipairs(KAMNMainFrame.metaLinks) do
      if obj and obj.Hide then obj:Hide() end
    end
  end
end

      KAMNMainFrame.highlightFrame:SetPoint("TOPLEFT", btn, "TOPLEFT", 0, 0)
KAMNMainFrame.highlightFrame:Show()

-- 🔄 Meta-Helper nach Auswahl updaten (zeigt ?-Button bei Meta)
if type(KAMN_MetaHelper_OnUIUpdated) == "function" then
  KAMN_MetaHelper_OnUIUpdated(nil)
end

      end)


      y = y - 15
      table.insert(f.lines, btn)
    end
  end

  -- Show only if currentCategory is "summary"
  if currentCategory == "summary" then
    f:Show()
  else
    f:Hide()
  end
end
