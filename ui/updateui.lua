-- updateui.lua
-- Displays visible achievements and handles category switching (summary vs normal view)

-- 🟢 Globale Funktion: Mini-Buttons ein-/ausblenden
function KAMN_SetMiniButtonVisibility(show)
  if not KAMNMainFrame then return end
  local action = show and "Show" or "Hide"
  if KAMNMainFrame.miniAll and KAMNMainFrame.miniAll[action] then
    KAMNMainFrame.miniAll[action](KAMNMainFrame.miniAll)
  end
  if KAMNMainFrame.miniOpen and KAMNMainFrame.miniOpen[action] then
    KAMNMainFrame.miniOpen[action](KAMNMainFrame.miniOpen)
  end
  if KAMNMainFrame.miniDone and KAMNMainFrame.miniDone[action] then
    KAMNMainFrame.miniDone[action](KAMNMainFrame.miniDone)
  end
  if KAMNMainFrame.miniHome and KAMNMainFrame.miniHome[action] then
    KAMNMainFrame.miniHome[action](KAMNMainFrame.miniHome)
  end
end

function KAMN_UpdateUI()
  local entryAchievementMap = {}

  if not KAMN._metaLinked then
    KAMN_LinkMetaReferences()
    KAMN._metaLinked = true
  end

  -- Summary Frame ein/aus
  if KAMN_SummaryLinesFrame then
    if currentCategory == "summary" then
      KAMN_SummaryLinesFrame:Show()
    else
      KAMN_SummaryLinesFrame:Hide()
    end
  end

  -- 📌 Summary-Ansicht: nur Zusammenfassung, keine Einträge
  if currentCategory == "summary" and not KAMN_GlobalCategoryView and type(KAMN_BuildSummaryLines) == "function" then
    if KAMNMainFrame and KAMNMainFrame.scrollWrapper then
      KAMNMainFrame.scrollWrapper:Hide()
    end
    if KAMNMainFrame.highlightFrame then
      KAMNMainFrame.highlightFrame:Hide()
    end
    KAMN_SelectedAchievementIndex = nil
    KAMNMainFrame.detailTitle:SetText("")
    KAMNMainFrame.detailDesc:SetText("")
    KAMNMainFrame.detailProgress:SetText("")
    KAMNMainFrame.detailMeta:SetText("")
    KAMNMainFrame.detailPoints:SetText("")
    KAMNMainFrame.detailPoints:Hide()
    KAMNMainFrame.detailExtra:SetText("")
    KAMNMainFrame.detailExtra:Hide()
    KAMN_ClearMetaLinks()

    KAMN_BuildSummaryLines()

    KAMN_SetMiniButtonVisibility(false)
    if KAMNMainFrame.miniPrev then KAMNMainFrame.miniPrev:Hide() end
    if KAMNMainFrame.miniNext then KAMNMainFrame.miniNext:Hide() end

    for i = 1, table.getn(KAMNMainFrame.entries) do
      KAMNMainFrame.entries[i]:Hide()
      if KAMNMainFrame.entries[i].text then
        KAMNMainFrame.entries[i].text:SetText("")
      end
    end
    return
  end

  local visible = KAMN.KAM_GetVisibleAchievements(currentCategory)
  local index = 1

  -- 📌 Segmentierte Anzeige – alle Einträge durchgehen
  for i = 1, table.getn(visible) do
    local a = visible[i]
    if KAMNMainFrame.entries[index] then
      local entry = KAMNMainFrame.entries[index]
      entry:Show()
      entry:SetHeight(14)

      if a.isDivider or a.isSubDivider then
        -- Divider-Logik
        local hasVisibleChild = false
        for j = i + 1, table.getn(visible) do
          local nextEntry = visible[j]
          if not (nextEntry.isDivider or nextEntry.isSubDivider) then
            local data = KAMN_GetAchievementData(nextEntry.id) or {}
            local isDone = data.complete
            local show = false
            if currentFilter == "DONE" and isDone then show = true
            elseif currentFilter == "OPEN" and not isDone then show = true
            elseif currentFilter == "ALL" then show = true end
            if show then
              hasVisibleChild = true
              break
            end
          end
        end

        if not hasVisibleChild then
          entry:Hide()
          if entry.text then entry.text:SetText("") end
          if entry.leftLine then entry.leftLine:Hide() end
          if entry.rightLine then entry.rightLine:Hide() end
        else
          if not entry.text then
            entry.text = entry:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            entry.text:SetWidth(370)
            entry.text:SetJustifyH("LEFT")
            entry.text:SetNonSpaceWrap(true)
          end
          entry.text:ClearAllPoints()
          entry.text:SetPoint("TOPLEFT", entry, "TOPLEFT", 35, -2)
          entry.text:SetText(a.subLabel or "Completed")
          entry.text:SetFont("Fonts\\SKURRI.ttf", 13)
          entry.text:SetTextColor(1, 1, 0.6)

          if not entry.leftLine then
            entry.leftLine = entry:CreateTexture(nil, "ARTWORK")
            entry.leftLine:SetTexture(1, 1, 1, 0.2)
            entry.leftLine:SetHeight(1)
            entry.leftLine:SetWidth(30)
          end
          entry.leftLine:ClearAllPoints()
          entry.leftLine:SetPoint("RIGHT", entry.text, "LEFT", -4, -1)
          entry.leftLine:Show()

          if not entry.rightLine then
            entry.rightLine = entry:CreateTexture(nil, "ARTWORK")
            entry.rightLine:SetTexture(1, 1, 1, 0.2)
            entry.rightLine:SetHeight(1)
          end
          entry.rightLine:ClearAllPoints()
          local textWidth = entry.text:GetStringWidth() or 0
          local startX = textWidth + 4
          local maxLineWidth = 300 - startX
          if maxLineWidth < 0 then maxLineWidth = 0 end
          entry.rightLine:SetWidth(maxLineWidth)
          entry.rightLine:SetPoint("LEFT", entry.text, "LEFT", startX, -1)
          entry.rightLine:Show()
        end

        -- Divider: keine Tooltips
        entry:SetScript("OnEnter", nil)
        entry:SetScript("OnLeave", nil)

      else
        -- Normale Zeile
        if entry.leftLine then entry.leftLine:Hide() end
        if entry.rightLine then entry.rightLine:Hide() end

        local data = KAMN_GetAchievementData(a.id) or {}
        local name = string.gsub(a.name or "", "|c%x%x%x%x%x%x%x%x", "")
        name = string.gsub(name, "|r", "")
        local line = ""
        local progress = data.progress or 0
        local goal = a.value or a.amount or 1

        if data.complete then
          line = string.format("(%d/%d) %s", goal, goal, name)
          if data.date then
            line = line .. string.format(" [%s by %s]", data.date, data.completedBy or "")
          end
        else
          line = string.format("(%d/%d) %s", progress, goal, name)
        end

        entry.text:SetFont("Fonts\\FRIZQT__.TTF", 10)
        entry.text:SetText(line)
        entry.text:ClearAllPoints()
        entry.text:SetPoint("LEFT", entry, "LEFT", 10, 0)
        entryAchievementMap[index] = a

        if index == KAMN_SelectedAchievementIndex then
          entry.text:SetTextColor(1, 1, 0)
        elseif data.complete then
          entry.text:SetTextColor(0, 1, 0)
        else
          entry.text:SetTextColor(1, 1, 1)
        end

        -- -- Tooltips setzen (Klick bleibt erhalten!)
        -- local achId   = a.id
        -- local achName = name
        -- local achDesc = a.description or ""
        -- local achType = a.type
        -- local achGoal = goal

        -- entry:SetScript("OnEnter", function()
          -- local d = {}
          -- if type(KAMN_GetAchievementData) == "function" then
            -- d = KAMN_GetAchievementData(achId) or {}
          -- end
          -- local pr = d.progress or 0
          -- local cp = d.complete == true
          -- local dt = d.date
          -- local by = d.completedBy

          -- GameTooltip:SetOwner(entry, "ANCHOR_RIGHT")
          -- GameTooltip:SetText(achName, 1, 1, 0.6)

          -- if achDesc ~= "" then
            -- GameTooltip:AddLine(achDesc, 1, 1, 1, 1)
          -- end

          -- if achGoal and achGoal > 0 then
            -- GameTooltip:AddLine(string.format("Progress: %d / %d", cp and achGoal or pr, achGoal), 0.8, 0.8, 0.8)
          -- end

          -- if cp then
            -- local line = "Completed"
            -- if dt then
              -- line = line .. ": " .. tostring(dt)
              -- if by and by ~= "" then
                -- line = line .. "  (" .. tostring(by) .. ")"
              -- end
            -- end
            -- GameTooltip:AddLine(line, 0.3, 1.0, 0.3)
          -- end

          -- if achType == "meta" and KAMNMainFrame and KAMNMainFrame.metaBtnWrapper then
            -- GameTooltip:AddLine("Tip: Click '?' to view criteria", 0.9, 0.9, 0.9)
          -- end

          -- GameTooltip:Show()
        -- end)
        -- entry:SetScript("OnLeave", function() GameTooltip:Hide() end)
      end

      index = index + 1
    end
  end

  -- Resteinträge verstecken
  for i = index, table.getn(KAMNMainFrame.entries) do
    KAMNMainFrame.entries[i]:Hide()
    if KAMNMainFrame.entries[i].leftLine then
      KAMNMainFrame.entries[i].leftLine:Hide()
    end
    if KAMNMainFrame.entries[i].rightLine then
      KAMNMainFrame.entries[i].rightLine:Hide()
    end
  end

  -- Klickhandler zuweisen
  if KAMN_AssignClickHandlers then
    KAMN_AssignClickHandlers(KAMNMainFrame, entryAchievementMap)
  end

  -- 🧮 Punkteanzeige
  local charPoints = KAMN_CalculateTotalPoints(true)
  local accPoints = KAMN_CalculateTotalPoints(false)
  if KAMNMainFrame and KAMNMainFrame.pointsLabel then
    KAMNMainFrame.pointsLabel:SetText("Char: " .. charPoints .. " / Acc: " .. accPoints)
  end

  -- Mini-Buttons
  local isSummary = currentCategory == "summary"
  local isSegment = string.find(currentCategory or "", "^ALL")
  KAMN_SetMiniButtonVisibility(not isSummary)
  if KAMNMainFrame and KAMNMainFrame.miniPrev and KAMNMainFrame.miniNext then
    if isSegment then
      KAMNMainFrame.miniPrev:Show()
      KAMNMainFrame.miniNext:Show()
    else
      KAMNMainFrame.miniPrev:Hide()
      KAMNMainFrame.miniNext:Hide()
    end
  end

  -- Storage Mode Label
  local currentMode = KAMN_UseAccountData and "Account" or "Character"
  if KAMNMainFrame and KAMNMainFrame.storageModeLabel then
    KAMNMainFrame.storageModeLabel:SetText(currentMode)
  end
  if KAMNConfigFrame and KAMNConfigFrame.storageModeLabel then
    KAMNConfigFrame.storageModeLabel:SetText(currentMode)
  end

  -- Mausrad-Scroll
  if KAMNMainFrame and KAMNMainFrame.scrollWrapper and currentCategory and currentCategory ~= "summary" then
    KAMN.KAM_AttachMouseScroll(KAMNMainFrame.scrollWrapper, currentCategory)
  end

  -- Meta-Button Update
  if type(KAMN_MetaHelper_OnUIUpdated) == "function" then
    KAMN_MetaHelper_OnUIUpdated(entryAchievementMap)
  end
end

function KAMN_ClearDetailSection()
  if not KAMNMainFrame then return end
  KAMNMainFrame.detailTitle:SetText("")
  KAMNMainFrame.detailDesc:SetText("")
  KAMNMainFrame.detailProgress:SetText("")
  KAMNMainFrame.detailMeta:SetText("")
  KAMNMainFrame.detailPoints:SetText("")
  KAMNMainFrame.detailPoints:Hide()
  KAMNMainFrame.detailExtra:SetText("")
  KAMNMainFrame.detailExtra:Hide()
  if KAMNMainFrame.highlightFrame then
    KAMNMainFrame.highlightFrame:Hide()
  end
  KAMN_ClearMetaLinks()
  if type(KAMN_MetaHelper_OnDetailCleared) == "function" then
    KAMN_MetaHelper_OnDetailCleared()
  end
end

function KAMN_ClearMetaLinks()
  if KAMNMainFrame and KAMNMainFrame.metaLinks then
    for _, obj in ipairs(KAMNMainFrame.metaLinks) do
      if obj and obj.Hide then obj:Hide() end
    end
    KAMNMainFrame.metaLinks = {}
  end
end
