-- 🔧 ui_scrolllogic.lua – Achievement-Scroll-Logik mit zentralisierten Labels (KAMN_LABELS)
-- Kompatibel mit Turtle WoW 1.12 / Lua 5.1

KAM_ScrollOffset = 0
KAM_MaxVisible = 15

function KAM_GetFilteredAchievements(category, filter, search)
  if not KAMN or not KAMN.achievements then return {} end

  local matches = {}

  for _, a in ipairs(KAMN.achievements) do
    local match = true

    if category ~= "ALL" and a.category ~= category then
      match = false
    end

    if filter == "OPEN" and a.complete then
      match = false
    elseif filter == "DONE" and not a.complete then
      match = false
    end

    if search and search ~= "" then
      local lc = string.lower(search)
      local found = false

      if string.find(string.lower(a.name or ""), lc) then found = true end
      local desc = a.description or a.desc
      if not found and desc and string.find(string.lower(desc), lc) then found = true end
      if not found and a.value then
        local p = a.progress or 0
        if string.find(string.format("%d/%d", p, a.value), lc) then found = true end
      end
      if not found and a.skillname and string.find(string.lower(a.skillname), lc) then found = true end
      if not found and a.targetname and string.find(string.lower(a.targetname), lc) then found = true end
      if not found and type(a.targetnames) == "table" then
        for i = 1, table.getn(a.targetnames) do
          if string.find(string.lower(a.targetnames[i]), lc) then
            found = true
            break
          end
        end
      end
      if not found and a.category and string.find(string.lower(a.category), lc) then found = true end
      if not found and a.id and string.find(string.lower(a.id), lc) then found = true end

      if not found then match = false end
    end

    if a.type == "legacy" and not a.complete then
      match = false
    end

if match then
  -- Gruppensperre nur aktivieren bei globalen Kategorien
  local isGlobalView = (category == "ALL" or category == "summary")
  if isGlobalView and (filter == "OPEN" or filter == "ALL") then
    if KAMN_ShouldDisplayAchievement and not KAMN_ShouldDisplayAchievement(a) then
      match = false
    end
  end
end


if match then
  table.insert(matches, a)
end

  end

  local typeMap = {
    kill = "kills",
    namedkill = "namedkills",
    namedkillgroup = "namedkillgroup",
    quest = "quests",
    namedquest = "namedquests",
    level = "stat",
    zone = "explore",
    discover = "explore",
    bosskill = "bosskill",
	meta = "explore"
  }

  local groups = {}
  for _, a in ipairs(matches) do
    local rawType = a.type or "_other"
    local t = typeMap[rawType] or rawType
    if not groups[t] then groups[t] = {} end
    table.insert(groups[t], a)
  end

  local orderMap = {
    Combat = {"kills", "namedkills", "namedkillgroup", "bosskill"},
    Skills = {"skill", "weapon"},
    Reputation = {"reputation"},
    Quests = {"quests", "namedquests"},
    Exploration = {"explore"},
    Character = {"stat"},
  }

  -- 🔁 Spezielle Sortierreihenfolge für "ALL"
  local order = orderMap[category]
  if category == "ALL" or not order then
    order = {
      "stat",       -- Character
      "kills", "namedkills", "namedkillgroup", "bosskill",  -- Combat
      "explore",    -- Exploration
      "quests", "namedquests",  -- Quests
      "reputation", -- Reputation
      "skill", "weapon",  -- Skills
      "_other",     -- Misc
      "meta",       -- Meta
      "legacy",     -- Legacy
    }
  end

  local results = {}
  for _, key in ipairs(order) do
    local list = groups[key]

    local hasVisible = false
    for i = 1, table.getn(list or {}) do
      local a = list[i]
      if (filter == "DONE" and a.complete) or
         (filter == "OPEN" and not a.complete) or
         (filter == "ALL") then
        hasVisible = true
        break
      end
    end

    if hasVisible then
     
      local label
if     key == "stat"           then label = "Level"
elseif key == "kills"          then label = "Kills"
elseif key == "namedkills"     then label = "Named Kills"
elseif key == "namedkillgroup" then label = "Kill Groups"
elseif key == "bosskill"       then label = "Boss Kills"
elseif key == "explore"        then label = "Exploration"
elseif key == "quests"         then label = "Quests"
elseif key == "namedquests"    then label = "Named Quests"
elseif key == "reputation"     then label = "Reputation"
elseif key == "skill"          then label = "Skills"
elseif key == "weapon"         then label = "Weapon Skills"
elseif key == "_other"         then label = "Miscellaneous"
elseif key == "meta"           then label = "Meta"
elseif key == "legacy"         then label = "Legacy"
else
  label = string.upper(key)
end

      table.insert(results, { isSubDivider = true, subLabel = label, groupKey = key })

      table.sort(list, function(a, b)
        if key == "kills" or key == "namedkillgroup" then
          return (a.value or 0) < (b.value or 0)
        else
          return string.lower(a.name or "") < string.lower(b.name or "")
        end
      end)

      for _, a in ipairs(list) do
        if (filter == "DONE" and a.complete) or
           (filter == "OPEN" and not a.complete) or
           (filter == "ALL") then
          a.groupKey = key
          table.insert(results, a)
        end
      end
    end
  end

  -- 📦 Spezialfall DONE → keine Gruppen, nur flat + gelber Divider
  if filter == "DONE" then
    local final = {}
    for _, a in ipairs(results) do
      if a.id and a.complete then
        table.insert(final, a)
      end
    end
    if table.getn(final) > 0 then
      table.insert(final, 1, { isDivider = true })
    end
    return final
  end

  -- 🌐 Normale Rückgabe mit optionalem gelbem Divider (OPEN vs DONE)
  local openList, doneList = {}, {}
  for _, a in ipairs(results) do
    if a.id and a.complete then
      table.insert(doneList, a)
    elseif a.id then
      table.insert(openList, a)
    else
      table.insert(openList, a)
    end
  end

  local final = openList
  if table.getn(doneList) > 0 and table.getn(openList) > 0 then
    table.insert(final, { isDivider = true })
  end
  for _, a in ipairs(doneList) do table.insert(final, a) end

  return final
end

function KAM_GetMaxOffset(category)
  local list = KAM_GetFilteredAchievements(category, currentFilter, currentSearch)
  local total = table.getn(list)
  if total <= KAM_MaxVisible then return 0 end
  return total - KAM_MaxVisible
end

function KAM_ScrollAchievements(direction, category)
  local maxOffset = KAM_GetMaxOffset(category)
  if direction == "up" then
    KAM_ScrollOffset = math.max(0, KAM_ScrollOffset - 1)
  elseif direction == "down" then
    KAM_ScrollOffset = math.min(maxOffset, KAM_ScrollOffset + 1)
  end
  if KAMN_UpdateUI then KAMN_UpdateUI() end
end

function KAM_AttachMouseScroll(frame, category)
  frame:EnableMouseWheel(true)
  frame:SetScript("OnMouseWheel", function()
    if arg1 > 0 then
      KAMN.KAM_ScrollAchievements("up", currentCategory)
    else
      KAMN.KAM_ScrollAchievements("down", currentCategory)
    end
  end)
end

function KAM_GetVisibleAchievements(category)
  local filter = currentFilter or "ALL"
  local search = currentSearch or ""
  local fullList = KAM_GetFilteredAchievements(category, filter, search)
  local visible = {}
  for i = 1, KAM_MaxVisible do
    local index = KAM_ScrollOffset + i
    if fullList[index] then
      table.insert(visible, fullList[index])
    end
  end
  return visible
end

-- 🔄 Global export
KAMN = KAMN or {}
KAMN.KAM_AttachMouseScroll = KAM_AttachMouseScroll
KAMN.KAM_GetVisibleAchievements = KAM_GetVisibleAchievements
KAMN.KAM_ScrollAchievements = KAM_ScrollAchievements
KAMN.KAM_GetMaxOffset = KAM_GetMaxOffset
KAMN.KAM_GetFilteredAchievements = KAM_GetFilteredAchievements
