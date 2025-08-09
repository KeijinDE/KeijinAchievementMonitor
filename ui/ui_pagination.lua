-- 📁 ui_pagination.lua
-- 🔄 Pagination für die "ALL"-Ansicht mit Auto-Skip leerer Segmente
-- Classic-kompatibel (Lua 5.1), keine modernen Lua-Features

KAMN_State = KAMN_State or {}
if not KAMN_State.segmentIndex then
  KAMN_State.segmentIndex = 1
end

-- 🧰 Liste für ein Segment aufbauen: nutzt den in labels.lua definierten Filter
local function KAMN_BuildSegmentList(segment)
  local result = {}
  if not segment or type(segment.filter) ~= "function" then
    return result
  end

  -- Durch alle Achievements laufen und Segment-Filter anwenden
  for i = 1, table.getn(KAMN.achievements or {}) do
    local a = KAMN.achievements[i]
    if a and segment.filter(a) then
      -- Zusätzlicher Sichtbarkeitsfilter (z. B. Gruppendeckel)
      if not KAMN_ShouldDisplayAchievement or KAMN_ShouldDisplayAchievement(a) then
        table.insert(result, a)
      end
    end
  end

  return result
end

-- 🔁 Interner Helfer: springt ab STARTindex in RICHTUNG zur nächsten nicht-leeren Seite
local function KAMN_FindNextNonEmptyIndex(startIndex, direction)
  local max = table.getn(KAMN.AllCategorySegments or {})
  if max == 0 then return startIndex end

  local attempts = 0
  local idx = startIndex

  while attempts < max do
    -- bei Versuchen > 0: eins weiter
    if attempts > 0 then
      idx = idx + direction
      if idx > max then
        idx = 1
      elseif idx < 1 then
        idx = max
      end
    end

    local segment = KAMN.AllCategorySegments[idx]
    local list = KAMN_BuildSegmentList(segment)
    if table.getn(list) > 0 then
      return idx, list
    end

    attempts = attempts + 1
  end

  -- Nichts gefunden → gib den Start zurück (leer)
  return startIndex, KAMN_BuildSegmentList(KAMN.AllCategorySegments[startIndex])
end

-- 🔁 Öffentliche API: Segment wechseln (direction = -1, 0, +1)
-- direction = 0 ⇒ nur neu bewerten/überspringen falls leer
function KAMN_ChangeSegment(direction)
  local max = table.getn(KAMN.AllCategorySegments or {})
  if max == 0 then return end

  local targetIndex = KAMN_State.segmentIndex

  if direction ~= 0 then
    targetIndex = targetIndex + direction
    if targetIndex > max then
      targetIndex = 1
    elseif targetIndex < 1 then
      targetIndex = max
    end
  end

  -- Suche nächste nicht-leere Seite ab targetIndex in gewünschter Richtung
  local finalIndex, finalList = KAMN_FindNextNonEmptyIndex(targetIndex, (direction == 0 and 1) or direction or 1)

  KAMN_State.segmentIndex = finalIndex

  local segment = KAMN.AllCategorySegments[finalIndex]
  if segment then
    -- aktuelle Seite/Filter setzen
    currentCategory = segment.key
    currentFilter = "ALL"
    KAM_ScrollOffset = 0
    if KAMN_ClearDetailSection then KAMN_ClearDetailSection() end

    -- Titel aktualisieren
    if KAMNMainFrame and KAMNMainFrame.categoryBtnLabel and segment.label then
      KAMNMainFrame.categoryBtnLabel:SetText("" .. segment.label)
    end

    -- Liste für Scroll-/UI-Logik speichern
    KAMN_SegmentAchievements = finalList or {}

    -- UI updaten
    if KAMN_UpdateUI then
      KAMN_UpdateUI()
    end
  end
end

-- 🚀 Beim ersten Öffnen: springe direkt auf die erste nicht-leere Seite
function KAMN_InitPaginationOnShow()
  -- direction = 0 ⇒ bleibt auf aktueller Seite, überspringt sie aber, falls leer
  KAMN_ChangeSegment(0)
end

-- 🖼 Buttons erstellen (links/rechts)
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

-- 🗺 Mapping für logic_filtering.lua (falls benötigt)
KAMN.AllCategorySegmentMap = {}
for i = 1, table.getn(KAMN.AllCategorySegments or {}) do
  local segment = KAMN.AllCategorySegments[i]
  if segment and segment.key and segment.filter then
    KAMN_AllCategorySegments = KAMN_AllCategorySegments or {}
    KAMN_AllCategorySegments[i] = segment
    KAMN.AllCategorySegmentMap[segment.key] = segment.filter
  end
end
