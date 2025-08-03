-- 🔁 ui_scrolllogic.lua – Zentrale Ergebnis-Logik (nur Zusammenführung)
-- Diese Datei verbindet die drei Teilsysteme:
-- 1. Filtering:        logic_filtering.lua (→ KAM_FilterAchievements)
-- 2. Grouping/Sorting: logic_grouping.lua
-- 3. Result Building:  logic_resultbuilder.lua

-- 🔍 Kombiniert alle Schritte zu einer gefilterten, sortierten Ergebnisliste
function KAM_GetFilteredAchievements(category, filter, search)
  local matches = KAMN.KAM_FilterAchievements(category, filter, search)
  local groups, order = KAMN.KAM_GroupAndSortAchievements(matches, category, filter)
  local results = KAMN.KAM_BuildResultList(groups, order, category, filter)
  return results
end

-- 🔁 Export
KAMN = KAMN or {}
KAMN.KAM_GetFilteredAchievements = KAM_GetFilteredAchievements
