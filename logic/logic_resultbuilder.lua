-- 📦 logic_resultbuilder.lua – mit Spezialsortierungen für Explore, Reputation, Skill, Meta
-- Neu: eigener 'stat'-Block mit Unterteilern "Level" und "Deaths"

function KAM_BuildResultList(groups, order, category, filter)
  local openList, doneList = {}, {}

  for _, key in ipairs(order) do
    local list = groups[key]
    if not list or table.getn(list) == 0 then
      -- keine Daten

    elseif key == "explore" then
      local zones = {}
      for _, a in ipairs(list) do
        local cont = a.continent or "Unknown"
        local zone = a.zonegroup or "Unsorted"
        zones[cont] = zones[cont] or {}
        zones[cont][zone] = zones[cont][zone] or {}
        table.insert(zones[cont][zone], a)
      end

      local continents = {}
      for cont in pairs(zones) do table.insert(continents, cont) end
      table.sort(continents)

      for _, cont in ipairs(continents) do
        local zoneMap = zones[cont]
        local zoneList = {}
        for z in pairs(zoneMap) do table.insert(zoneList, z) end
        table.sort(zoneList)

        local addedOpen, addedDone = false, false

        for _, zone in ipairs(zoneList) do
          local entries = zoneMap[zone]
          table.sort(entries, function(a, b)
            if a.type == "meta" and b.type ~= "meta" then return true end
            if a.type ~= "meta" and b.type == "meta" then return false end
            return (a.name or "") < (b.name or "")
          end)

          local hasOpen, hasDone = false, false
          for _, a in ipairs(entries) do
            if a.complete then hasDone = true else hasOpen = true end
          end

          if hasOpen and not addedOpen then
            table.insert(openList, { isSubDivider = true, subLabel = cont, groupKey = key })
            addedOpen = true
          end
          if hasOpen then
            table.insert(openList, { isSubDivider = true, subLabel = "  " .. zone, groupKey = key })
            for _, a in ipairs(entries) do
              if not a.complete then
                a.groupKey = key
                table.insert(openList, a)
              end
            end
          end

          if hasDone and not addedDone then
            addedDone = true
          end
          if hasDone then
            for _, a in ipairs(entries) do
              if a.complete then
                a.groupKey = key
                table.insert(doneList, a)
              end
            end
          end
        end
      end

    elseif key == "reputation" then
      -- Spezialfall: Reputation nach subtype + faction
      local reps = {}
      for _, a in ipairs(list) do
        local st = a.subtype or "neutral"
        reps[st] = reps[st] or {}
        reps[st][a.faction or a.name or "?"] = reps[st][a.faction or a.name or "?"] or {}
        table.insert(reps[st][a.faction or a.name or "?"], a)
      end

      local orderMap = { neutral = 1, horde = 2, alliance = 3 }
      local subtypes = {}
      for st in pairs(reps) do table.insert(subtypes, st) end
      table.sort(subtypes, function(a, b)
        return (orderMap[a] or 99) < (orderMap[b] or 99)
      end)

      for _, subtype in ipairs(subtypes) do
        local factions = reps[subtype]
        local facNames = {}
        for f in pairs(factions) do table.insert(facNames, f) end
        table.sort(facNames)

        local hasOpen, hasDone = false, false
        for _, f in ipairs(facNames) do
          for _, a in ipairs(factions[f]) do
            if a.complete then hasDone = true else hasOpen = true end
          end
        end

        if hasOpen then
          table.insert(openList, {
            isSubDivider = true,
            subLabel = (KAM_LABELS and KAM_LABELS.groups and KAM_LABELS.groups["rep_" .. subtype]) or subtype,
            groupKey = key
          })

          for _, f in ipairs(facNames) do
            table.insert(openList, { isSubDivider = true, subLabel = "  " .. f, groupKey = key })
            for _, a in ipairs(factions[f]) do
              if not a.complete then
                a.groupKey = key
                table.insert(openList, a)
              end
            end
          end
        end

        for _, f in ipairs(facNames) do
          for _, a in ipairs(factions[f]) do
            if a.complete then
              a.groupKey = key
              table.insert(doneList, a)
            end
          end
        end
      end

    elseif key == "meta" then
      -- Spezialfall: Meta-Erfolge nach subcategory
      local metas = {}
      for _, a in ipairs(list) do
        local sc = a.subcategory or "misc"
        metas[sc] = metas[sc] or {}
        table.insert(metas[sc], a)
      end

      local names = {}
      for s in pairs(metas) do table.insert(names, s) end
      table.sort(names)

      for _, s in ipairs(names) do
        local hasOpen, hasDone = false, false
        for _, a in ipairs(metas[s]) do
          if a.complete then hasDone = true else hasOpen = true end
        end

        if hasOpen then
          local label = (KAM_LABELS and KAM_LABELS.groups and KAM_LABELS.groups[s]) or s
          table.insert(openList, { isSubDivider = true, subLabel = label, groupKey = key })
          for _, a in ipairs(metas[s]) do
            if not a.complete then
              a.groupKey = key
              table.insert(openList, a)
            end
          end
        end

        for _, a in ipairs(metas[s]) do
          if a.complete then
            a.groupKey = key
            table.insert(doneList, a)
          end
        end
      end

    elseif key == "namedquests" then
      -- Story Quests nach questhub
      local hubs = {}
      for _, a in ipairs(list) do
        local hub = a.questhub or "Other"
        hubs[hub] = hubs[hub] or {}
        table.insert(hubs[hub], a)
      end

      local hubNames = {}
      for hub in pairs(hubs) do table.insert(hubNames, hub) end
      table.sort(hubNames)

      local hasAnyOpen = false
      local i, j
      for i = 1, table.getn(hubNames) do
        local hub = hubNames[i]
        for j = 1, table.getn(hubs[hub]) do
          local a = hubs[hub][j]
          if not a.complete then hasAnyOpen = true break end
        end
        if hasAnyOpen then break end
      end

      local mainLabel = (KAM_LABELS and KAM_LABELS.groups and KAM_LABELS.groups[key]) or key
      if hasAnyOpen then
        table.insert(openList, { isSubDivider = true, subLabel = mainLabel, groupKey = key })
      end

      for _, hub in ipairs(hubNames) do
        local hasOpen, hasDone = false, false
        table.sort(hubs[hub], function(a, b) return (a.name or "") < (b.name or "") end)
        for _, a in ipairs(hubs[hub]) do
          if a.complete then hasDone = true else hasOpen = true end
        end

        if hasOpen then
          table.insert(openList, { isSubDivider = true, subLabel = "  " .. hub, groupKey = key })
          for _, a in ipairs(hubs[hub]) do
            if not a.complete then
              a.groupKey = key
              table.insert(openList, a)
            end
          end
        end

        if hasDone then
          for _, a in ipairs(hubs[hub]) do
            if a.complete then
              a.groupKey = key
              table.insert(doneList, a)
            end
          end
        end
      end

    elseif key == "stat" then
      -- 🆕 Character-Block in zwei Unterabschnitte splitten: Level & Death
      local levels, deaths = {}, {}
      local i
      for i = 1, table.getn(list) do
        local a = list[i]
        if a and a.type == "level" then
          table.insert(levels, a)
        elseif a and a.type == "death" then
          table.insert(deaths, a)
        end
      end

      -- sortierbar nach Name, damit stabil
      table.sort(levels, function(a, b) return (a.value or 0) < (b.value or 0) end)
      table.sort(deaths, function(a, b) return (a.value or 0) < (b.value or 0) end)

      -- Labels
      local levelLabel = (KAM_LABELS and KAM_LABELS.groups and KAM_LABELS.groups.level) or "Level Milestones"
      local deathLabel = (KAM_LABELS and KAM_LABELS.groups and KAM_LABELS.groups.death) or "Deaths"

      -- offene Level
      local hasOpenL = false
      for i = 1, table.getn(levels) do if not levels[i].complete then hasOpenL = true break end end
      if hasOpenL then
        table.insert(openList, { isSubDivider = true, subLabel = levelLabel, groupKey = key })
        for i = 1, table.getn(levels) do
          local a = levels[i]
          if not a.complete then a.groupKey = key table.insert(openList, a) end
        end
      end
      -- abgeschlossene Level
      for i = 1, table.getn(levels) do
        local a = levels[i]
        if a.complete then a.groupKey = key table.insert(doneList, a) end
      end

      -- offene Deaths
      local hasOpenD = false
      for i = 1, table.getn(deaths) do if not deaths[i].complete then hasOpenD = true break end end
      if hasOpenD then
        table.insert(openList, { isSubDivider = true, subLabel = deathLabel, groupKey = key })
        for i = 1, table.getn(deaths) do
          local a = deaths[i]
          if not a.complete then a.groupKey = key table.insert(openList, a) end
        end
      end
      -- abgeschlossene Deaths
      for i = 1, table.getn(deaths) do
        local a = deaths[i]
        if a.complete then a.groupKey = key table.insert(doneList, a) end
      end

    else
      -- Standardfall für alles andere
      local label = KAM_LABELS and KAM_LABELS.groups and KAM_LABELS.groups[key] or key
      local hasOpen, hasDone = false, false
      for _, a in ipairs(list) do
        if a.complete then hasDone = true else hasOpen = true end
      end

      if hasOpen then
        table.insert(openList, { isSubDivider = true, subLabel = label, groupKey = key })
        for _, a in ipairs(list) do
          if not a.complete then
            a.groupKey = key
            table.insert(openList, a)
          end
        end
      end

      for _, a in ipairs(list) do
        if a.complete then
          a.groupKey = key
          table.insert(doneList, a)
        end
      end
    end
  end

  -- DONE-Modus: nur vollständige Erfolge
  if filter == "DONE" then
    local flat = {}
    for _, a in ipairs(doneList) do
      if a.id then table.insert(flat, a) end
    end
    if table.getn(flat) > 0 then table.insert(flat, 1, { isDivider = true }) end
    return flat
  end

  if filter == "OPEN" then return openList end

  local result = {}
  for _, a in ipairs(openList) do table.insert(result, a) end
  if table.getn(doneList) > 0 and table.getn(openList) > 0 then
    table.insert(result, { isDivider = true })
  end
  for _, a in ipairs(doneList) do table.insert(result, a) end

  return result
end

KAMN = KAMN or {}
KAMN.KAM_BuildResultList = KAM_BuildResultList
