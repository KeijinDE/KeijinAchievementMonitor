
-- clickhandlers.lua
-- Handles click assignments for achievement entries (scroll-safe, highlight-enabled)

KAMN_SelectedAchievementIndex = nil

function KAMN_LinkMetaReferences()
  if not KAMN or not KAMN.achievements then return end

  local lookup = {}
  for i = 1, table.getn(KAMN.achievements) do
    local ach = KAMN.achievements[i]
    if ach and ach.id then
      lookup[ach.id] = ach
      if not ach.requiredFor then
        ach.requiredFor = {}
      end
    end
  end

  for i = 1, table.getn(KAMN.achievements) do
    local ach = KAMN.achievements[i]
    if ach and ach.type == "meta" and ach.requires then
      for _, reqID in ipairs(ach.requires) do
        local ref = lookup[reqID]
        if ref and ref.requiredFor then
          local alreadyListed = false
          for _, existing in ipairs(ref.requiredFor) do
            if existing == ach.id then
              alreadyListed = true
              break
            end
          end
          if not alreadyListed then
            table.insert(ref.requiredFor, ach.id)
          end
        end
      end
    end
  end
end

function KAMN_AssignClickHandlers(frame, achievementMap)
  for index = 1, table.getn(frame.entries) do
    local entry = frame.entries[index]
    local static = achievementMap[index]

    if entry and static then
      entry:EnableMouse(true)
      entry:SetScript("OnMouseUp", function()
        local dynamic = static.id and KAMN_GetAchievementData(static.id)
        if not dynamic or not static then return end

        frame.detailTitle:SetText(static.name or "")
        frame.detailDesc:SetText(static.description or "")

        local progress = (dynamic.progress or 0) .. " / " .. (static.value or 0)
        frame.detailProgress:SetText("Progress: " .. progress)

        local date = dynamic.complete and (dynamic.date or "-") or "-"
        local by   = dynamic.complete and (dynamic.completedBy or "-") or "-"
        frame.detailMeta:SetText("Completed on: " .. date .. " by: " .. by)

       if static.points then
  if dynamic and dynamic.manual then
    -- manuell: keine Punkte
    frame.detailPoints:SetText("")      -- oder: "Points: 0 (manual)"
    frame.detailPoints:Hide()
  else
    frame.detailPoints:SetText("Points: " .. tostring(static.points))
    frame.detailPoints:Show()
  end
else
  frame.detailPoints:SetText("")
  frame.detailPoints:Hide()
end


        -- 🔗 Klickbare "Required for"-Titel als Text mit Button-Overlay
        if frame.metaLinks then
          for _, e in ipairs(frame.metaLinks) do
            if e.Hide then e:Hide() end
          end
        end
        frame.metaLinks = {}

        if static.requiredFor and table.getn(static.requiredFor) > 0 then
          local label = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
          label:SetPoint("TOPLEFT", frame.detailDesc, "BOTTOMLEFT", 0, -4)
          label:SetText("|cffffffffRequired for:|r")
          table.insert(frame.metaLinks, label)

          local xOffset = label:GetStringWidth() + 6
          for _, id in ipairs(static.requiredFor) do
            for _, ach in ipairs(KAMN.achievements) do
              if ach.id == id then
                local text = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
                text:SetText("|cffffff99" .. ach.name .. "|r")
                text:SetPoint("TOPLEFT", label, "TOPLEFT", xOffset, 0)
                text:SetJustifyH("LEFT")
                table.insert(frame.metaLinks, text)

                local btn = CreateFrame("Button", nil, frame)
                btn:SetWidth(text:GetStringWidth())
                btn:SetHeight(12)
                btn:SetPoint("TOPLEFT", text, "TOPLEFT", 0, 0)
                btn:SetScript("OnClick", function()
                  frame.detailTitle:SetText(ach.name or "")
                  frame.detailDesc:SetText(ach.description or "")
                  local dyn = KAMN_GetAchievementData(ach.id)
                  local prog = (dyn.progress or 0) .. " / " .. (ach.value or 0)
                  frame.detailProgress:SetText("Progress: " .. prog)
                  local date = dyn.complete and (dyn.date or "-") or "-"
                  local by   = dyn.complete and (dyn.completedBy or "-") or "-"
                  frame.detailMeta:SetText("Completed on: " .. date .. " by: " .. by)
                  frame.detailPoints:SetText("Points: " .. tostring(ach.points or 0))
                  frame.detailPoints:Show()
                  frame.detailExtra:SetText("")
                  frame.detailExtra:Hide()
                end)
                table.insert(frame.metaLinks, btn)

                xOffset = xOffset + text:GetStringWidth() + 10
                break
              end
            end
          end
        end

        KAMN_SelectedAchievementIndex = KAM_ScrollOffset + index
        if frame.highlightFrame and entry then
          frame.highlightFrame:SetPoint("TOPLEFT", entry, "TOPLEFT", 0, 0)
          frame.highlightFrame:Show()
        end

        KAMN.preventClear = true
        KAMN_UpdateUI()
        KAMN.preventClear = nil
      end)
    elseif entry then
      entry:SetScript("OnMouseUp", nil)
      entry:EnableMouse(false)
    end
  end
end
