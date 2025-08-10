-- ✅ Datei: logic_filtering.lua – angepasst für SegmentFilter-Mapping (ALL1–ALL15)
-- Nutzt jetzt KAMN.AllCategorySegmentMap statt direktem Zugriff auf AllCategorySegments-Liste

function KAM_FilterAchievements(category, filter, search)
  local matches = {}
  local lowerSearch = string.lower(search or "")

  -- DEFAULT_CHAT_FRAME:AddMessage("Segment: " .. tostring(category))
  local segmentFilter = KAMN.AllCategorySegmentMap and KAMN.AllCategorySegmentMap[category]
  if not segmentFilter then
    -- DEFAULT_CHAT_FRAME:AddMessage("⚠ Kein SegmentFilter für: " .. tostring(category))
  end

  for _, a in ipairs(KAMN.achievements) do
    local match = true

    -- Segmentfilter anwenden, wenn vorhanden
    if segmentFilter then
      local ok = segmentFilter(a)
      if not ok then
        -- DEBUG: DEFAULT_CHAT_FRAME:AddMessage("Segmentfilter blockiert: " .. tostring(a.id or "?"))
        match = false
      end
    elseif category ~= "ALL" and a.category ~= category then
      match = false
    end

    -- Filter für OPEN / DONE
    if match and filter == "DONE" and not a.complete then
      match = false
    elseif match and filter == "OPEN" and a.complete then
      match = false
    end
    -- Legacy-Kategorie (Dropdown): immer nur Completed
    if match and category == "Legacy" and (not a.complete or a.type ~= "legacy") then
      match = false
    end

    -- Textsuche (Name oder Beschreibung)
    if match and lowerSearch ~= "" then
      local inName = string.find(string.lower(a.name or ""), lowerSearch, 1, true)
      local inDesc = string.find(string.lower(a.description or ""), lowerSearch, 1, true)
      if not inName and not inDesc then
        match = false
      end
    end

    -- Gruppensperre bei ALLx oder summary + offenen/alle Filtern
    local isGlobalView = string.find(category or "", "^ALL") or category == "summary"
    if match and isGlobalView and (filter == "OPEN" or filter == "ALL") then
      if KAMN_ShouldDisplayAchievement and not KAMN_ShouldDisplayAchievement(a) then
        -- DEBUG: DEFAULT_CHAT_FRAME:AddMessage("Blockiert durch Gruppe: " .. tostring(a.id or "?"))
        match = false
      end
    end

    if match then
      table.insert(matches, a)
    end
  end

  return matches
end

KAMN = KAMN or {}
KAMN.KAM_FilterAchievements = KAM_FilterAchievements
