-- ui_metahelper.lua
-- Meta-Helper: "?"-Button im Detailbereich, zeigt die für einen Meta-Erfolg relevanten Unter-Erfolge als Liste an.
-- Kompatibilität: Turtle WoW (1.12), Lua 5.1

-- 🔧 Utilities ---------------------------------------------------------------

local function StripColors(s)
  if not s then return "" end
  s = string.gsub(s, "|c%x%x%x%x%x%x%x%x", "")
  s = string.gsub(s, "|r", "")
  return s
end

local function KAMN_GetProgressDataByID(id)
  if not id then return { complete = false, progress = 0, goal = 0 } end

  local base = nil
  if KAMN and KAMN.achievements then
    for i = 1, table.getn(KAMN.achievements) do
      local a = KAMN.achievements[i]
      if a and a.id == id then base = a break end
    end
  end

  local data = {}
  if type(KAMN_GetAchievementData) == "function" then
    data = KAMN_GetAchievementData(id) or {}
  end

  local progress = data.progress or 0
  local goal     = (base and (base.value or base.amount)) or (data.goal or 0)
  local complete = data.complete == true
  return { complete = complete, progress = progress, goal = goal, base = base }
end

local function KAMN_FindAchievementByID(id)
  if not (KAMN and KAMN.achievements) then return nil end
  for i = 1, table.getn(KAMN.achievements) do
    local a = KAMN.achievements[i]
    if a and a.id == id then return a end
  end
  return nil
end

local function KAMN_FindAchievementByDetailTitle()
  if not (KAMNMainFrame and KAMNMainFrame.detailTitle) then return nil end
  local title = StripColors(KAMNMainFrame.detailTitle:GetText())
  if title == "" then return nil end
  title = string.lower(title)

  if not (KAMN and KAMN.achievements) then return nil end
  for i = 1, table.getn(KAMN.achievements) do
    local a = KAMN.achievements[i]
    if a and a.name then
      local an = string.lower(StripColors(a.name))
      if an == title then
        return a
      end
    end
  end
  return nil
end
-- 📍 Button immer dynamisch hinter den Titeltext setzen
local function KAMN_MetaHelper_ReanchorToTitle()
  if not (KAMNMainFrame and KAMNMainFrame.metaBtnWrapper and KAMNMainFrame.detailTitle) then return end
  local w = KAMNMainFrame.detailTitle:GetStringWidth() or 0
  KAMNMainFrame.metaBtnWrapper:ClearAllPoints()
  KAMNMainFrame.metaBtnWrapper:SetPoint("LEFT", KAMNMainFrame.detailTitle, "LEFT", w + 8, 0)
end

-- 🧩 Meta-Kinder ermitteln
local function KAMN_MetaHelper_GetChildren(metaAch)
  local out = {}
  if not (metaAch and metaAch.id) then return out end
  local metaId = metaAch.id

  if type(KAMN_GetMetaChildren) == "function" then
    local list = KAMN_GetMetaChildren(metaId)
    if type(list) == "table" then
      for i = 1, table.getn(list) do
        local id = list[i]
        local a = (type(id) == "string") and KAMN_FindAchievementByID(id) or id
        if a and a.id then table.insert(out, a) end
      end
    end
  end

  if table.getn(out) == 0 and KAMN and KAMN.MetaChildrenByMetaId and KAMN.MetaChildrenByMetaId[metaId] then
    local list = KAMN.MetaChildrenByMetaId[metaId]
    if type(list) == "table" then
      for i = 1, table.getn(list) do
        local id = list[i]
        local a = (type(id) == "string") and KAMN_FindAchievementByID(id) or id
        if a and a.id then table.insert(out, a) end
      end
    end
  end

  if table.getn(out) == 0 then
    local fields = {"criteriaIds", "requiredIds", "children", "criteria"}
    for i = 1, table.getn(fields) do
      local key = fields[i]
      local t = metaAch[key]
      if type(t) == "table" then
        for j = 1, table.getn(t) do
          local id = t[j]
          local a = (type(id) == "string") and KAMN_FindAchievementByID(id) or id
          if a and a.id then table.insert(out, a) end
        end
        if table.getn(out) > 0 then break end
      end
    end
  end

  if table.getn(out) == 0 and KAMN and KAMN.achievements then
    for i = 1, table.getn(KAMN.achievements) do
      local a = KAMN.achievements[i]
      if a then
        if a.requiredFor and type(a.requiredFor) == "table" then
          for j = 1, table.getn(a.requiredFor) do
            if a.requiredFor[j] == metaId then table.insert(out, a) break end
          end
        end
        if a.metaParent and a.metaParent == metaId then
          table.insert(out, a)
        end
      end
    end
  end

  return out
end

-- 🔲 UI-Konstruktion ---------------------------------------------------------
local function KAMN_MetaHelper_EnsureUI()
  if not (KAMNMainFrame and KAMNMainFrame.detailTitle and type(KAMN_CreateDialogButton) == "function") then
    return
  end
  if KAMNMainFrame.metaBtnWrapper and KAMNMainFrame.metaBtn then
    return
  end

  local wrapper, btn = KAMN_CreateDialogButton(KAMNMainFrame, "?", 20, 18, nil, "Show criteria for this meta")
  KAMN_MetaHelper_ReanchorToTitle()

  wrapper:Hide()

  local panel = CreateFrame("Frame", nil, KAMNMainFrame)
  panel:SetWidth(260)
  panel:SetHeight(180)
  panel:SetPoint("TOPLEFT", wrapper, "BOTTOMLEFT", 0, -4)
  panel:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true, tileSize = 16, edgeSize = 12,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
  })
  panel:SetBackdropColor(0, 0, 0, 1)
  panel:Hide()

  panel.title = panel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  panel.title:SetPoint("TOPLEFT", panel, "TOPLEFT", 10, -8)
  panel.title:SetText("|cffffff88Meta Criteria|r")

  local scrollName = "KAMNMetaHelperScrollFrame"
  local scroll = CreateFrame("ScrollFrame", scrollName, panel, "UIPanelScrollFrameTemplate")
  scroll:SetPoint("TOPLEFT", panel, "TOPLEFT", 10, -26)
  scroll:SetPoint("BOTTOMRIGHT", panel, "BOTTOMRIGHT", -28, 10)

  local content = CreateFrame("Frame", nil, scroll)
  content:SetWidth(210)
  content:SetHeight(10)
  scroll:SetScrollChild(content)

  panel.scroll = scroll
  panel.content = content
  panel.rows = {}

  for i = 1, 50 do
    local row = CreateFrame("Button", nil, content)
    row:SetPoint("TOPLEFT", content, "TOPLEFT", 0, -((i - 1) * 16))
    row:SetWidth(210)
    row:SetHeight(16)

    local fs = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    fs:SetPoint("LEFT", row, "LEFT", 2, 0)
    fs:SetWidth(208)
    fs:SetJustifyH("LEFT")
    fs:SetText("")

    row.text = fs
    panel.rows[i] = row
  end

  local blocker = CreateFrame("Frame", nil, UIParent)
  blocker:SetAllPoints(UIParent)
  blocker:EnableMouse(true)
  blocker:SetFrameStrata(KAMNMainFrame:GetFrameStrata())
  blocker:SetFrameLevel(KAMNMainFrame:GetFrameLevel() + 1)
  blocker:Hide()
  blocker:SetScript("OnMouseDown", function()
    panel:Hide()
    blocker:Hide()
  end)

  btn:SetScript("OnClick", function()
    if panel:IsShown() then
      panel:Hide()
      blocker:Hide()
    else
      panel:Show()
      blocker:Show()
    end
  end)

  KAMNMainFrame.metaBtnWrapper = wrapper
  KAMNMainFrame.metaBtn = btn
  KAMNMainFrame.metaPanel = panel
  KAMNMainFrame.metaBlocker = blocker
end

-- 🔄 Liste neu rendern -------------------------------------------------------
local function KAMN_MetaHelper_RenderList(metaAch)
  if not (KAMNMainFrame and KAMNMainFrame.metaPanel and KAMNMainFrame.metaPanel.rows) then return end

  local panel = KAMNMainFrame.metaPanel
  local rows  = panel.rows

  local titleText = (metaAch and metaAch.name) and ("|cffffff88Meta Criteria|r – " .. metaAch.name) or "|cffffff88Meta Criteria|r"
  panel.title:SetText(titleText)

  local children = KAMN_MetaHelper_GetChildren(metaAch)

  table.sort(children, function(a, b)
    local da = KAMN_GetProgressDataByID(a.id)
    local db = KAMN_GetProgressDataByID(b.id)
    if da.complete ~= db.complete then
      return (not da.complete) and db.complete
    end
    return (StripColors(a.name or "") or "") < (StripColors(b.name or "") or "")
  end)

  local n = table.getn(children)
  for i = 1, table.getn(rows) do
    local row = rows[i]
    if i <= n then
      local a = children[i]
      local st = KAMN_GetProgressDataByID(a.id)
      local name = StripColors(a.name or "")
      local desc = a.description or ""

      local txt
      if st.complete then
        txt = string.format("|cff55ff55[Done]|r %s", name)
      else
        local goal = st.goal or 0
        local prog = st.progress or 0
        txt = string.format("|cffffffff[%d/%d]|r %s", prog, goal, name)
      end

      row.text:SetText(txt)
      row:Show()

      row:SetScript("OnEnter", function()
        GameTooltip:SetOwner(row, "ANCHOR_CURSOR")
        GameTooltip:SetText(name, 1, 1, 0.6)
        if desc ~= "" then
          GameTooltip:AddLine(desc, 1, 1, 1, 1)
        end
        GameTooltip:Show()
      end)
      row:SetScript("OnLeave", function()
        GameTooltip:Hide()
      end)

    else
      row.text:SetText("")
      row:SetScript("OnEnter", nil)
      row:SetScript("OnLeave", nil)
      row:Hide()
    end
  end

    -- Höhe des Inhalts anpassen für Scrollfunktion
  local visibleHeight = panel.scroll:GetHeight() or 0
  panel.content:SetHeight(math.max(n * 16))

end

-- 🌟 Öffentliche API ---------------------------------------------------------
function KAMN_MetaHelper_OnUIUpdated(entryAchievementMap)
  KAMN_MetaHelper_EnsureUI()
  if not (KAMNMainFrame and KAMNMainFrame.metaBtnWrapper) then return end

  KAMNMainFrame.metaBtnWrapper:Hide()
  if KAMNMainFrame.metaPanel then KAMNMainFrame.metaPanel:Hide() end
  if KAMNMainFrame.metaBlocker then KAMNMainFrame.metaBlocker:Hide() end

  local a = nil
  if entryAchievementMap and KAMN_SelectedAchievementIndex then
    a = entryAchievementMap[KAMN_SelectedAchievementIndex]
  end
  if not a then
    a = KAMN_FindAchievementByDetailTitle()
  end

  if not a then return end
  if a.type == "meta" then
  KAMNMainFrame.metaBtnWrapper:Show()
  KAMN_MetaHelper_ReanchorToTitle() -- <— hier neu
  KAMN_MetaHelper_RenderList(a)
end

end

function KAMN_MetaHelper_OnDetailCleared()
  if not KAMNMainFrame then return end
  if KAMNMainFrame.metaPanel then KAMNMainFrame.metaPanel:Hide() end
  if KAMNMainFrame.metaBtnWrapper then KAMNMainFrame.metaBtnWrapper:Hide() end
  if KAMNMainFrame.metaBlocker then KAMNMainFrame.metaBlocker:Hide() end
end
