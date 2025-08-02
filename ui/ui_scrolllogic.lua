-- 🔧 ui_scrolllogic.lua – Achievement-Scroll-Logik mit zentralisierten Labels (KAMN_LABELS)
-- Kompatibel mit Turtle WoW 1.12 / Lua 5.1

KAM_ScrollOffset = 0
KAM_MaxVisible = 15

function KAM_GetFilteredAchievements(category, filter, search)
  if not KAMN or not KAMN.achievements then return {} end

  local matches = {}
local segmentFilter = nil

if string.find(category or "", "^ALL") and KAMN and KAMN.AllCategorySegments then
  for _, segment in ipairs(KAMN.AllCategorySegments) do
    if segment.key == category and type(segment.filter) == "function" then
      segmentFilter = segment.filter
      break
    end
  end
end

  for _, a in ipairs(KAMN.achievements) do
    local match = true

    if segmentFilter then
  if not segmentFilter(a) then
    match = false
  end
elseif category ~= "ALL" and a.category ~= category then
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

-- 🛡 Gruppensperre nur bei segmentierter Ansicht (ALLx oder summary)
if match then
  local isGlobalView = string.find(category or "", "^ALL") or category == "summary"

  -- -- 🔎 Debugausgabe zur Analyse
  -- if KAMN.debug then
    -- DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Debug]|r ID=" .. (a.id or "?") ..
      -- " | Kategorie=" .. (category or "?") ..
      -- " | isGlobalView=" .. tostring(isGlobalView) ..
      -- " | Filter=" .. tostring(filter))
  -- end

  -- 📌 Nur bei globaler Ansicht prüfen wir Gruppenfilter
  if isGlobalView and (filter == "OPEN" or filter == "ALL") then
    if KAMN_ShouldDisplayAchievement and not KAMN_ShouldDisplayAchievement(a) then
      match = false
      -- if KAMN.debug then
        -- DEFAULT_CHAT_FRAME:AddMessage("|cffff8800[KAM Debug]|r → Ausgeblendet durch Gruppenlogik: " .. (a.id or "?"))
      -- end
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
  meta = "meta",
  misc = "misc",
  skill = "skill",
  weapon = "weapon" -- oder "weapon", wenn du trennen willst
}


-- 🔁 Gruppierung der Ergebnisse nach Typ, Subcategory oder logischer Kategorie
local groups = {}

for _, a in ipairs(matches) do
  local t

  -- 🎯 A: Exploration-Metas (type = "meta", category = "Exploration")
  -- → Gehören zur Gruppe "explore"
  if a.type == "meta" and a.category == "Exploration" then
    t = "explore"

  -- 🎯 B: Klassische Meta-Erfolge → gruppiert nach subcategory
  elseif a.type == "meta" and a.category == "meta" then
    -- 🔒 Falls keine subcategory gesetzt ist, nutze "other" als Fallback
    t = a.subcategory or "other"

  -- 🌐 C: Alle anderen Erfolge → via typeMap
  else
    local rawType = a.type or "_other"
    t = typeMap[rawType] or rawType
  end

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
  Misc = {"misc"}
}

-- 🧭 Spezielle Gruppierung für Kategorie "meta" nach subcategory
if category == "meta" then
  local dynamicKeys = {}
  for k, v in pairs(groups) do
    table.insert(dynamicKeys, k)
  end
  table.sort(dynamicKeys)
  order = dynamicKeys
else
  -- 🔁 Standardsortierung
  order = orderMap[category]
  if category == "ALL" or not order then
    order = {
      "stat",       -- Character
      "quests",
      "kills",
      "reputation",
      "namedkills", "namedkillgroup", "bosskill",
      "explore",    -- Exploration (inkl. Metas)
      "namedquests",
      "skill", "weapon",
      "misc",
      "meta",
      "legacy",
    }
  end
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
     
      local label = KAM_LABELS.groups[key] or string.upper(key)


      table.insert(results, { isSubDivider = true, subLabel = label, groupKey = key })

table.sort(list, function(a, b)
  if key == "kills" or key == "namedkillgroup" or key == "quests" then
    return (a.value or 0) < (b.value or 0)

  elseif key == "explore" then
    local cA = string.lower(a.continent or "")
    local cB = string.lower(b.continent or "")
    if cA ~= cB then return cA < cB end

    local zA = string.lower(a.zonegroup or "")
    local zB = string.lower(b.zonegroup or "")
    if zA ~= zB then return zA < zB end

    -- Capitals: nach value absteigend
    if zA == "capitals" then
      return (a.value or 0) > (b.value or 0)
    end

    -- Zone-Metas (Zone: XYZ) zuerst, dann alphabetisch
    local aName = string.lower(a.name or "")
    local bName = string.lower(b.name or "")

    local isZoneA = string.find(aName, "^zone:") ~= nil
    local isZoneB = string.find(bName, "^zone:") ~= nil

    if isZoneA ~= isZoneB then
      return isZoneA
    end

    return aName < bName

elseif key == "reputation" then
  local order = { neutral = 1, horde = 2, alliance = 3 }

  local sa = order[a.subtype or "neutral"] or 99
  local sb = order[b.subtype or "neutral"] or 99
  if sa ~= sb then return sa < sb end

  local fa = string.lower(a.faction or "")
  local fb = string.lower(b.faction or "")
  if fa ~= fb then return fa < fb end

  return (a.value or 0) < (b.value or 0)


  else
    return string.lower(a.name or "") < string.lower(b.name or "")
  end
end)

      if key == "explore" then
  local lastContinent = nil
  local lastZoneGroup = nil

  for _, a in ipairs(list) do
    if (filter == "DONE" and a.complete) or
       (filter == "OPEN" and not a.complete) or
       (filter == "ALL") then

      local continent = a.continent or "Unknown"
      local zonegroup = a.zonegroup or "Miscellaneous"

      if continent ~= lastContinent then
        table.insert(results, {
          isSubDivider = true,
          subLabel = continent,
          groupKey = key
        })
        lastContinent = continent
        lastZoneGroup = nil -- Reset zone when continent changes
      end

      if zonegroup ~= lastZoneGroup then
        table.insert(results, {
          isSubDivider = true,
          subLabel = "  " .. zonegroup,
          groupKey = key
        })
        lastZoneGroup = zonegroup
      end

      a.groupKey = key
      table.insert(results, a)
    end
  end
elseif key == "reputation" then
  local lastSub = nil
local lastFaction = nil


  for _, a in ipairs(list) do
    if (filter == "DONE" and a.complete) or
       (filter == "OPEN" and not a.complete) or
       (filter == "ALL") then

      local sub = string.lower(a.subtype or "neutral")

      if sub ~= lastSub then
        local labelKey = "rep_" .. sub -- z. B. rep_neutral
local label = KAM_LABELS.groups[labelKey] or string.upper(sub)


        table.insert(results, {
          isSubDivider = true,
          subLabel = label,
          groupKey = key
        })

        lastSub = sub
      end

      local faction = a.faction or "Unknown"

if faction ~= lastFaction then
  table.insert(results, {
    isSubDivider = true,
    subLabel = "  " .. faction,
    groupKey = key
  })
  lastFaction = faction
end

a.groupKey = key
table.insert(results, a)

    end
  end
  
elseif key == "skill" then
  -- 🔢 Sortiere Skills nach skillname und innerhalb der Gruppe nach value
  table.sort(list, function(a, b)
    local sa = string.lower(a.skillname or "")
    local sb = string.lower(b.skillname or "")
    if sa ~= sb then return sa < sb end
    return (a.value or 0) < (b.value or 0)
  end)

  -- 📄 Füge nur die Einträge ein, keine SubDivider
  for _, a in ipairs(list) do
    if (filter == "DONE" and a.complete) or
       (filter == "OPEN" and not a.complete) or
       (filter == "ALL") then
      a.groupKey = key
      table.insert(results, a)
    end
  end



elseif key == "meta" then
  local lastSub = nil
  table.sort(list, function(a, b)
    local sa = string.lower(a.subcategory or "")
    local sb = string.lower(b.subcategory or "")
    if sa ~= sb then return sa < sb end
    return string.lower(a.name or "") < string.lower(b.name or "")
  end)

  for _, a in ipairs(list) do
    if (filter == "DONE" and a.complete) or
       (filter == "OPEN" and not a.complete) or
       (filter == "ALL") then

      local sub = a.subcategory or "Other"
      if sub ~= lastSub then
        local label = KAM_LABELS.groups[sub] or sub
        table.insert(results, {
          isSubDivider = true,
          subLabel = label,
          groupKey = key
        })
        lastSub = sub
      end

      a.groupKey = key
      table.insert(results, a)
    end
  end
else
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

-- 🔍 Zeigt nur den jeweils niedrigsten offenen Meilenstein je Gruppe oder Skill/Waffe
function KAMN_ShouldDisplayAchievement(a)
  if a.complete then return true end

  -- 🧩 A: Klassische Meilensteingruppen (Kill, Quest, Level)
  if a.group and a.value then
    for _, b in ipairs(KAMN.achievements) do
      if b.group == a.group and not b.complete and b.value and b.value < a.value then
        return false
      end
    end
  end

  -- 🧪 B: Skill / Weapon Meilensteine (NEU)
  if (a.type == "skill" or a.type == "weapon") and a.skillname and a.value then
    for _, b in ipairs(KAMN.achievements) do
      if b.id ~= a.id and
         b.type == a.type and
         b.skillname == a.skillname and
         not b.complete and
         (b.value or 0) < a.value then
        return false
      end
    end
  end

  return true
end


-- 🔄 Global export
KAMN = KAMN or {}
KAMN.KAM_AttachMouseScroll = KAM_AttachMouseScroll
KAMN.KAM_GetVisibleAchievements = KAM_GetVisibleAchievements
KAMN.KAM_ScrollAchievements = KAM_ScrollAchievements
KAMN.KAM_GetMaxOffset = KAM_GetMaxOffset
KAMN.KAM_GetFilteredAchievements = KAM_GetFilteredAchievements
