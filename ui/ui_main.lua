-- ui_main.lua – Hauptfenster für KeijinAchievementMonitorNEW
-- Erweiterung: Scrolllogik (nur 16 sichtbare Buttons), Integration mit ui_scrolllogic.lua | einheitliche Button Optik


-- KAMN_CreateDialogButton: Button im Stil des UI-Fensterrands (Dialogbox-Anmutung)
function KAMN_CreateDialogButton(parent, label, width, height, clickFunc, tooltipText)

  local wrapper = CreateFrame("Frame", nil, parent)
  wrapper:SetWidth(width or 80)
  wrapper:SetHeight(height or 20)

  -- Klassischer Dialog-Rahmen (identisch zum Hauptfenster)
  wrapper:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 12,
    insets = { left = 2, right = 2, top = 2, bottom = 2 }
  })
  wrapper:SetBackdropColor(0.1, 0.2, 0.1, 1.0)  -- dunkles Grün

  -- Button im Vordergrund
  local btn = CreateFrame("Button", nil, wrapper)
  btn:SetAllPoints(wrapper)

  -- Text in Gelb, mittig
  local text = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  text:SetPoint("CENTER", btn, "CENTER", 0, 0)
  text:SetTextColor(1.0, 0.9, 0.4)
  text:SetText(label)
  btn:SetFontString(text)

  -- Hover-Effekt im Classic-Stil (ADD-Modus)
local hl = btn:CreateTexture(nil, "HIGHLIGHT")
hl:SetTexture(1.0, 1.0, 0.6, 0.1) -- leicht goldgelb, halbtransparent
hl:SetPoint("TOPLEFT", btn, "TOPLEFT", 4, -4)
hl:SetPoint("BOTTOMRIGHT", btn, "BOTTOMRIGHT", -4, 4)
btn:SetHighlightTexture(hl)

  -- Klickverhalten setzen
  if type(clickFunc) == "function" then
    btn:SetScript("OnClick", clickFunc)
  end
  
 -- Tooltip-Logik (optional)
  if tooltipText then
    btn:SetScript("OnEnter", function()
      GameTooltip:SetOwner(btn, "ANCHOR_RIGHT")
      GameTooltip:SetText(tooltipText, 1, 1, 1)
      GameTooltip:Show()
    end)
    btn:SetScript("OnLeave", function()
      GameTooltip:Hide()
    end)
  end
  
  return wrapper, btn
end

-- Lokale Steuerungsvariablen
currentFilter = "ALL"
currentCategory = "summary"
KAMN_GlobalCategoryView = false
currentSearch = ""

function KAMN_CreateUI()
  if KAMN.debug then DEFAULT_CHAT_FRAME:AddMessage("[KAM Debug] CreateUI aufgerufen") end
  if KAMNMainFrame then KAMNMainFrame:Hide() end

  local f = CreateFrame("Frame", "KAMNMainFrame", UIParent)
  f:SetWidth(400)
  f:SetHeight(480)
-- Fensterposition laden (SavedVariables)
local posX, posY = 100, -100  -- Standard-Startposition (sichtbar oben links)

if KAMN_CharacterDB and type(KAMN_CharacterDB.MainFrameX) == "number" and type(KAMN_CharacterDB.MainFrameY) == "number" then
  local screenWidth = UIParent:GetWidth()
  local screenHeight = UIParent:GetHeight()
  local savedX = KAMN_CharacterDB.MainFrameX
  local savedY = KAMN_CharacterDB.MainFrameY

  -- Sicherheitsprüfung: Koordinaten müssen im sichtbaren Bereich liegen
  if savedX >= 0 and savedX <= (screenWidth - 50) and
     savedY <= -50 and savedY >= -screenHeight + 50 then

    -- Direkt übernehmen (Koordinaten bereits relativ zu TOPLEFT)
    posX = math.floor(savedX + 0.5)
    posY = math.floor(savedY + 0.5)

    if KAMN.debug then
      DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[PosLoad]|r X=" .. posX .. ", Y=" .. posY)
    end
  else
    if KAMN.debug then
      DEFAULT_CHAT_FRAME:AddMessage("|cffff4444[PosLoad]|r Ungültige gespeicherte Position – Reset auf Standard.")
    end
  end
end


  -- Fenster an gespeicherter oder Standardposition setzen
  f:SetPoint("TOPLEFT", UIParent, "TOPLEFT", posX, posY)

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
  f:SetScript("OnDragStop", function()
    this:StopMovingOrSizing()

    -- Korrekte Umrechnung in WoW-Koordinatensystem (Y negativ nach unten!)
    local posX = math.floor(this:GetLeft() + 0.5)
    local posY = math.floor(this:GetTop() - UIParent:GetTop() + 0.5)  -- → wird negativ

    KAMN_CharacterDB = KAMN_CharacterDB or {}
    KAMN_CharacterDB.MainFrameX = posX
    KAMN_CharacterDB.MainFrameY = posY

    if KAMN.debug then
      DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[PosSave]|r X=" .. posX .. ", Y=" .. posY)
    end
  end)

-- 🔖 Versionsanzeige unten links
f.versionLabel = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
f.versionLabel:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 10, 8)
f.versionLabel:SetText("|cff88ff88v" .. (KAMN_VERSION or "?") .. "|r")
  local close = CreateFrame("Button", nil, f, "UIPanelCloseButton")
  close:SetPoint("TOPRIGHT", f, "TOPRIGHT", -4, -4)
  
-- TITEL

f.title = f:CreateFontString(nil, "OVERLAY")
f.title:SetFont("Fonts\\MORPHEUS.ttf", 18) 
f.title:SetPoint("TOP", f, "TOP", -60, -12)  -- zentrierter
f.title:SetText("|cff88ff88Keijin Achievements Monitor|r")

-- 🔳 Globale Filter-Buttons mit dynamischer Anzeige + Tooltip
-- Vorab-Deklaration des Category-Buttons, damit er überall verfügbar ist
local categoryBtn

-- 🔲 Wrapper-Frame für alle drei Buttons
local filterWrapper = CreateFrame("Frame", nil, f)
filterWrapper:SetWidth(270)
filterWrapper:SetHeight(20)
filterWrapper:SetPoint("TOPLEFT", f, "TOPLEFT", 10, -42)

-- 🟡 Button: All
local filterAll, filterAllBtn = KAMN_CreateDialogButton(filterWrapper, "All", 70, 20, function()
  KAMN_State.segmentIndex = 1
  local segment = KAMN.AllCategorySegments[1]
  if segment then
    currentCategory = segment.key
    currentFilter = "ALL"
    KAM_ScrollOffset = 0
    if KAMN_ClearDetailSection then KAMN_ClearDetailSection() end
    if KAMNMainFrame and KAMNMainFrame.categoryBtnLabel then
      KAMNMainFrame.categoryBtnLabel:SetText("" .. segment.label)
    end
    KAMN_UpdateUI()
  end
end, "Show all segmented achievements")


filterAll:SetPoint("LEFT", filterWrapper, "LEFT", 0, 0)

-- Suchfeld
local searchBox = CreateFrame("EditBox", "KAMNSearchBox", f, "InputBoxTemplate")
searchBox:SetWidth(80)
searchBox:SetHeight(18)
searchBox:SetAutoFocus(false)
searchBox:SetPoint("TOPRIGHT", f, "TOPRIGHT", -25, -42)

-- Vorab deklarieren, damit innerhalb der Funktion darauf zugegriffen werden kann
local clearWrapper

clearWrapper = KAMN_CreateDialogButton(f, "X", 20, 18, function()
  searchBox:SetText("")
  currentSearch = ""
  clearWrapper:Hide()
  KAM_ScrollOffset = 0
  KAMN_UpdateUI()
end)

clearWrapper:SetPoint("LEFT", searchBox, "RIGHT", 0, 0)
clearWrapper:Hide()

  searchBox:SetScript("OnTextChanged", function()
    currentSearch = searchBox:GetText()
    if currentSearch ~= "" then
      clearWrapper:Show()
    else
      clearWrapper:Hide()
    end
	KAM_ScrollOffset = 0
	-- Wenn wir uns im "Summary"-Modus befinden, wechseln wir auf "ALL" für globale Suche
if currentCategory == "summary" and currentSearch ~= "" then
  currentCategory = "ALL"
  currentFilter = "ALL"
  if KAMNMainFrame and KAMNMainFrame.categoryText then
    KAMNMainFrame.categoryText:SetText("Category: All Categories")
  end
end

    KAMN_UpdateUI()
  end)

  local searchLabel = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  searchLabel:SetPoint("BOTTOMLEFT", searchBox, "TOPLEFT", 0, 5)
 searchLabel:SetText("|cffffff88Search:|r")



-- Kategorie-Dropdown (Classic-Stil mit Rahmen & Auto-Close bei externem Klick)
categoryBtn = CreateFrame("Button", nil, f)
categoryBtn:SetWidth(170)
categoryBtn:SetHeight(22)
categoryBtn:SetPoint("LEFT", filterAll, "RIGHT", 18, 0)

categoryBtn:SetFrameStrata("DIALOG")
categoryBtn:SetFrameLevel(20)

-- Rahmen im Dialog-Stil
categoryBtn:SetBackdrop({
  bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
  edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
  tile = true,
  tileSize = 16,
  edgeSize = 12,
  insets = { left = 3, right = 3, top = 3, bottom = 3 }
})
categoryBtn:SetBackdropColor(0, 0, 0, 1)

local categoryLabel = categoryBtn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
categoryLabel:SetPoint("CENTER", categoryBtn, "CENTER", 0, 0)
categoryLabel:SetTextColor(1.0, 0.9, 0.4)
categoryLabel:SetText("Category: Summary")

-- Dropdown-Liste (unsichtbar bis geöffnet)
local categoryList = CreateFrame("Frame", nil, f)
categoryList:SetWidth(170)
categoryList:SetHeight(12 * 18)
categoryList:SetPoint("TOP", categoryBtn, "BOTTOM", 0, 0)
categoryList:SetBackdrop(nil)
categoryList:SetFrameStrata("DIALOG")
categoryList:SetFrameLevel(21)
categoryList:Hide()

-- ClickBlocker zum automatischen Schließen außerhalb
local clickBlocker = CreateFrame("Frame", nil, UIParent)
clickBlocker:SetAllPoints(UIParent)
clickBlocker:EnableMouse(true)
clickBlocker:SetFrameStrata("DIALOG")
clickBlocker:SetFrameLevel(categoryList:GetFrameLevel() - 1)
clickBlocker:SetScript("OnMouseDown", function()
  categoryList:Hide()
  clickBlocker:Hide()
end)
clickBlocker:Hide()

-- Kategorie-Daten aufbauen
local baseCategories = {
  { label = "Summary", value = "summary" },
  { label = "Character", value = "Character" },
  { label = "Combat", value = "Combat" },
  { label = "Exploration", value = "Exploration" },
  { label = "Quests", value = "Quests" },
  { label = "Reputation", value = "Reputation" },
  { label = "Skills", value = "Skills" }
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

-- Kategorie-Einträge mit klassischem Rahmen
for i = 1, table.getn(categories) do
  local cat = categories[i]
  local wrapper = CreateFrame("Frame", nil, categoryList)
  wrapper:SetWidth(150)
  wrapper:SetHeight(18)
  wrapper:SetPoint("TOPLEFT", categoryList, "TOPLEFT", 10, -((i - 1) * 20) - 5)
  wrapper:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true,
    tileSize = 8,
    edgeSize = 8,
    insets = { left = 1, right = 1, top = 1, bottom = 1 }
  })
  wrapper:SetBackdropColor(0.05, 0.05, 0.05, 1.0)

  local b = CreateFrame("Button", nil, wrapper)
  b:SetAllPoints(wrapper)

  local text = b:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  text:SetPoint("CENTER", b, "CENTER", 0, 0)
  text:SetTextColor(1.0, 0.9, 0.4)
  text:SetText(cat.label)
  b:SetFontString(text)

  local hl = b:CreateTexture(nil, "HIGHLIGHT")
  hl:SetTexture(1.0, 1.0, 0.6, 0.2)
  hl:SetPoint("TOPLEFT", b, "TOPLEFT", 2, -2)
  hl:SetPoint("BOTTOMRIGHT", b, "BOTTOMRIGHT", -2, 2)
  b:SetHighlightTexture(hl)

b:SetScript("OnClick", function()
  currentCategory = cat.value
  currentFilter = "ALL"  -- 🟢 Zurücksetzen auf Standardfilter
  currentSearch = ""     -- optional: Suche leeren
  if KAMN_ClearDetailSection then KAMN_ClearDetailSection() end
  KAMN_GlobalCategoryView = false
  categoryLabel:SetText("Category: " .. cat.label)
  categoryList:Hide()
  clickBlocker:Hide()
  KAM_ScrollOffset = 0
  KAMN_UpdateUI()
end)

end

-- Öffnen / Schließen des Dropdown-Menüs
categoryBtn:SetScript("OnClick", function()
  if categoryList:IsShown() then
    categoryList:Hide()
    clickBlocker:Hide()
  else
    categoryList:Show()
    clickBlocker:Show()
  end
end)

KAMNMainFrame.categoryBtnLabel = categoryLabel

-- 🏠 MiniHome-Button
local miniHome, miniHomeBtn = KAMN_CreateDialogButton(f, "|cff88ff88<-|r", 24, 18, function()
  currentCategory = "summary"
  currentFilter = "ALL"
  KAM_ScrollOffset = 0
  if KAMNMainFrame and KAMNMainFrame.categoryBtnLabel then
    KAMNMainFrame.categoryBtnLabel:SetText("Category: Summary")
  end
  if KAMNMainFrame and KAMNMainFrame.categoryText then
    KAMNMainFrame.categoryText:SetText("Category: Summary")
  end
  KAMN_UpdateUI()
end, "Back to Summary View")
miniHome:SetPoint("TOPLEFT", f, "TOPLEFT", 10, -94)
-- ◀ Vorheriger Segment-Button
local miniPrev, miniPrevBtn = KAMN_CreateDialogButton(f, "|cff88ff88<<|r", 24, 18, function()
  KAMN_ChangeSegment(-1)
end, "Previous achievement segment")
miniPrev:SetPoint("LEFT", miniHome, "RIGHT", 6, 0)

-- ▶ Nächster Segment-Button
local miniNext, miniNextBtn = KAMN_CreateDialogButton(f, "|cff88ff88>>|r", 24, 18, function()
  KAMN_ChangeSegment(1)
end, "Next achievement segment")
miniNext:SetPoint("LEFT", miniPrev, "RIGHT", 6, 0)

-- 🅰 MiniAll Button
local miniAll, miniAllBtn = KAMN_CreateDialogButton(f, "|cff88ff88A|r", 24, 18, function()
  currentFilter = "ALL"
  KAM_ScrollOffset = 0
  KAMN_UpdateUI()
end, "Show all achievements in current category")

-- ❌ MiniOpen Button
local miniOpen, miniOpenBtn = KAMN_CreateDialogButton(f, "|cff88ff88X|r", 24, 18, function()
  currentFilter = "OPEN"
  KAM_ScrollOffset = 0
  KAMN_UpdateUI()
end, "Show only incomplete achievements in current category")

-- ✅ MiniDone Button
local miniDone, miniDoneBtn = KAMN_CreateDialogButton(f, "|cff88ff88D|r", 24, 18, function()
  currentFilter = "DONE"
  KAM_ScrollOffset = 0
  KAMN_UpdateUI()
end, "Show only completed achievements in current category")

-- 📍 Positionierung: exakt wie MiniHome, aber zentriert
miniOpen:SetPoint("TOP", f, "TOP", 0, -94)
miniAll:SetPoint("RIGHT", miniOpen, "LEFT", -6, 0)
miniDone:SetPoint("LEFT", miniOpen, "RIGHT", 6, 0)


-- 🔗 Buttons global registrieren
KAMNMainFrame.miniAll = miniAll
KAMNMainFrame.miniOpen = miniOpen
KAMNMainFrame.miniDone = miniDone
KAMNMainFrame.miniHome = miniHome
KAMNMainFrame.miniPrev = miniPrev
KAMNMainFrame.miniNext = miniNext


  -- Einträge vorbereiten (nur so viele wie sichtbar nötig)
f.entries = {}
local maxVisible = KAM_MaxVisible or 15
for i = 1, maxVisible + 2 do
  local btn = CreateFrame("Button", nil, f)
  btn:SetWidth(370)
  btn:SetHeight(14)
  btn:SetPoint("TOPLEFT", f, "TOPLEFT", 12, -120 - (i - 1) * 16)

  btn.text = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  btn.text:SetPoint("LEFT", btn, "LEFT", 10, 0)
  btn.text:SetWidth(370)
  btn.text:SetJustifyH("LEFT")
  btn.text:SetNonSpaceWrap(true)
  btn.text:SetText("")
  btn:Hide()
  table.insert(f.entries, btn)
end


  -- 🔍 Highlight + Details area for selected achievement
  f.highlightFrame = CreateFrame("Frame", nil, f)
  f.highlightFrame:SetWidth(370)
  f.highlightFrame:SetHeight(14)
  f.highlightFrame:SetBackdrop({ bgFile = "Interface\\Tooltips\\UI-Tooltip-Background" })
  f.highlightFrame:SetBackdropColor(1, 1, 0, 0.2)
  f.highlightFrame:Hide()
  
  -- Top divider line
  local line = f:CreateTexture(nil, "ARTWORK")
  line:SetTexture(1, 1, 1, 0.4)
  line:SetHeight(1)
  line:SetWidth(370)
  line:SetPoint("TOPLEFT", f, "TOPLEFT", 15, -85)

  -- Bottom divider line
  local line = f:CreateTexture(nil, "ARTWORK")
  line:SetTexture(1, 1, 1, 0.4)
  line:SetHeight(1)
  line:SetWidth(370)
  line:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 15, 115)
  
-- 🏆 Title of selected achievement
f.detailTitle = f:CreateFontString(nil, "OVERLAY")
f.detailTitle:SetFont("Fonts\\SKURRI.ttf", 16, "OUTLINE")
f.detailTitle:SetTextColor(1, 1, 0.6) 
f.detailTitle:SetPoint("TOPLEFT", line, "BOTTOMLEFT", 0, -10)
f.detailTitle:SetWidth(250)
f.detailTitle:SetJustifyH("LEFT")
f.detailTitle:SetText("Achievement Title")

-- 📈 Progress top-right
f.detailProgress = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
f.detailProgress:SetPoint("TOPRIGHT", line, "BOTTOMRIGHT", -3, -10)
f.detailProgress:SetTextColor(1, 1, 1)
f.detailProgress:SetWidth(120)
f.detailProgress:SetJustifyH("RIGHT")
f.detailProgress:SetText("Progress: 0 / 0")

-- 📜 Beschreibung unter Titel
f.detailDesc = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
f.detailDesc:SetTextColor(1, 1, 1)
f.detailDesc:SetPoint("TOPLEFT", f.detailTitle, "BOTTOMLEFT", 0, -14)
f.detailDesc:SetWidth(360)
f.detailDesc:SetJustifyH("LEFT")
f.detailDesc:SetNonSpaceWrap(true)
f.detailDesc:SetText("Achievement description will appear here.")

-- 🔗 Required for
f.detailExtra = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
f.detailExtra:SetPoint("TOPLEFT", f.detailDesc, "BOTTOMLEFT", 0, -4)
f.detailExtra:SetWidth(370)
f.detailExtra:SetTextColor(1, 1, 0.6) 
f.detailExtra:SetJustifyH("LEFT")
f.detailExtra:SetText("")
f.detailExtra:Hide()

-- 🪙 Punkte (zentriert über Meta-Info)
f.detailPoints = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
f.detailPoints:SetTextColor(0.7, 0.7, 0.7)
f.detailPoints:SetPoint("BOTTOM", f, "BOTTOM", 0, 20)
f.detailPoints:SetWidth(250)
f.detailPoints:SetJustifyH("CENTER")
f.detailPoints:SetText("")
f.detailPoints:Hide()

-- 🕓 Meta info (unterhalb von Punkten)
f.detailMeta = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
f.detailMeta:SetTextColor(0.7, 0.7, 0.7)
f.detailMeta:SetPoint("TOP", f.detailPoints, "BOTTOM", 0, -2)
f.detailMeta:SetWidth(370)
f.detailMeta:SetJustifyH("CENTER")
f.detailMeta:SetText("Completed on: – by: –")


  -- Scroll per Mausrad aktivieren
  KAMN.KAM_AttachMouseScroll(f, currentCategory)

-- 🖼️ Scrollbar-Rahmen – klassischer Dialogstil
local scrollWrapper = CreateFrame("Frame", nil, f)
KAMNMainFrame.scrollWrapper = scrollWrapper
scrollWrapper:SetWidth(24)

-- Dynamisch berechnet:
local entryHeight = 16
local buttonHeight = 16
local padding = 6
local visibleEntries = KAM_MaxVisible or 15
local scrollHeight = (visibleEntries - 0) * entryHeight --0 - 4 um entrys auszublenden

local wrapperHeight = scrollHeight + (2 * buttonHeight) + padding

scrollWrapper:SetHeight(wrapperHeight)
scrollWrapper:SetPoint("TOPRIGHT", f, "TOPRIGHT", -4, -86)

scrollWrapper:SetBackdrop({
  --bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
  --edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
  tile = true,
  tileSize = 16,
  edgeSize = 12,
  insets = { left = 2, right = 2, top = 2, bottom = 2 }
})
scrollWrapper:SetBackdropColor(0.1, 0.1, 0.1, 0.8)

scrollWrapper:Hide()
-- 🔼 Up-Button
local scrollUp = CreateFrame("Button", nil, scrollWrapper, "UIPanelScrollUpButtonTemplate")
scrollUp:SetPoint("TOP", scrollWrapper, "TOP", 0, -4)
scrollUp:SetScript("OnClick", function()
  KAMN.KAM_ScrollAchievements("up", currentCategory)
end)

-- 🔽 Down-Button
local scrollDown = CreateFrame("Button", nil, scrollWrapper, "UIPanelScrollDownButtonTemplate")
scrollDown:SetPoint("BOTTOM", scrollWrapper, "BOTTOM", 0, 3)
scrollDown:SetScript("OnClick", function()
  KAMN.KAM_ScrollAchievements("down", currentCategory)
end)

-- 🟩 Scrollbar selbst (Slider)
f.scrollbar = CreateFrame("Slider", "KAMNScrollSlider", scrollWrapper)
f.scrollbar:SetOrientation("VERTICAL")
f.scrollbar:SetWidth(10)
f.scrollbar:SetPoint("TOP", scrollUp, "BOTTOM", 0, -3)
f.scrollbar:SetMinMaxValues(0, 1)
f.scrollbar:SetValueStep(1)
f.scrollbar:SetHeight(scrollHeight)

-- Thumb (Classic-Stil)
local thumb = f.scrollbar:CreateTexture(nil, "OVERLAY")
thumb:SetTexture("Interface\\Buttons\\UI-ScrollBar-Knob")
thumb:SetWidth(12)
thumb:SetHeight(32)  -- initial, wird später angepasst
f.scrollbar:SetThumbTexture(thumb)



-- Drag-Skript
f.scrollbar:SetScript("OnValueChanged", function()
  local maxOffset = KAMN.KAM_GetMaxOffset(currentCategory)
  local newOffset = math.floor(f.scrollbar:GetValue() + 0.5)
  if newOffset > maxOffset then newOffset = maxOffset end
  if newOffset ~= KAM_ScrollOffset then
    KAM_ScrollOffset = newOffset
    if KAMN_UpdateUI then KAMN_UpdateUI() end
  end
end)

-- 🔁 Dynamisches Update bei UI-Änderung
function KAMN_UpdateScrollbar()
  local wrapper = KAMNMainFrame and KAMNMainFrame.scrollWrapper
  if currentCategory == "summary" then
    if wrapper then wrapper:Hide() end
    return
  end

  local filtered = KAMN.KAM_GetFilteredAchievements(currentCategory, currentFilter, currentSearch) or {}
  local total = table.getn(filtered)
  local max = KAM_MaxVisible

  if total <= max then
    if wrapper then wrapper:Hide() end
  else
    if wrapper then wrapper:Show() end
    local range = total - max
    local height = math.max(16, (max / total) * 224)

    f.scrollbar:SetMinMaxValues(0, range)
    f.scrollbar:SetValue(KAM_ScrollOffset)

local thumb = f.scrollbar:GetThumbTexture()
if thumb then
  thumb:SetHeight(math.max(16, height - 4))
  thumb:ClearAllPoints()
  thumb:SetPoint("TOP", f.scrollbar, "TOP", 0, 1)
end

  end
end


-- 🌀 Hook für Scrollbewegung: nach jedem Scroll aktualisieren
KAMN.KAM_ScrollAchievements = function(direction, category)
  if direction == "up" then
    KAM_ScrollOffset = math.max(0, KAM_ScrollOffset - 1)
  elseif direction == "down" then
    local maxOffset = KAMN.KAM_GetMaxOffset(category)
    KAM_ScrollOffset = math.min(maxOffset, KAM_ScrollOffset + 1)
  end
  if KAMN_UpdateUI then KAMN_UpdateUI() end
  if KAMN_UpdateScrollbar then KAMN_UpdateScrollbar() end
end

-- 🧾 Summary Frame vorbereiten
local summaryFrame = CreateFrame("Frame", nil, f)
summaryFrame:SetWidth(370)
summaryFrame:SetHeight(210)
summaryFrame:SetPoint("TOPLEFT", f, "TOPLEFT", 25, -125)
summaryFrame:Hide()
summaryFrame.lines = {} -- Tabelle für dynamische Textzeilen
KAMN_SummaryLinesFrame = summaryFrame -- Globale Referenz speichern

-- 🔍 Anzeige des aktuellen Speicherstatus (Account / Character)
f.storageModeLabel = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
f.storageModeLabel:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -10, 8)
f.storageModeLabel:SetTextColor(0.53, 1, 0.53)
f.storageModeLabel:SetText("pending") -- wird durch UpdateUI ersetzt

-- Fallback-Text sofort setzen (für erste Anzeige)
local modeInit = KAMN_UseAccountData and "Account" or "Character"
f.storageModeLabel:SetText("" .. modeInit .. "")

-- Sichtbarkeit des Fensters initial deaktivieren
f:Hide()

-- Globale Referenz verfügbar machen
KAMNMainFrame = f
KAMNMainFrame.categoryBtn = categoryBtn
KAMNMainFrame.storageModeLabel = f.storageModeLabel
if KAMN_UpdateUI then KAMN_UpdateUI() end

end
