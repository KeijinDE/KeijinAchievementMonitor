-- achievements/achievements_hardcore.lua
-- Einfache, gut testbare Grundlage: "Töte 1 Gegner im Hardcore-Modus"
-- Hinweis: Aktiv nur, wenn der Charakter Hardcore ist (requiresHC=true, active=false bis Erkennung)

KAMN = KAMN or {}
KAMN.achievements = KAMN.achievements or {}

-- Level 2
table.insert(KAMN.achievements, {
  id = "HC_LEVEL_02",
  name = "Hardcore: Level 02",
  description = "Reach level 2 on a Hardcore character.",
  type = "level",
  level = 2,
  value = 2,
  progress = 0,
  complete = false,
  category = "Hardcore",
  points = 5,
  requiresHC = true,
  active = false,
})

-- Level 5
table.insert(KAMN.achievements, {
  id = "HC_LEVEL_05",
  name = "Hardcore: Level 05",
  description = "Reach level 5 on a Hardcore character.",
  type = "level",
  level = 5,
  value = 5,
  progress = 0,
  complete = false,
  category = "Hardcore",
  points = 5,
  requiresHC = true,
  active = false,
})

-- Level 10
table.insert(KAMN.achievements, {
  id = "HC_LEVEL_10",
  name = "Hardcore: Level 10",
  description = "Reach level 10 on a Hardcore character.",
  type = "level",
  level = 10,
  value = 10,
  progress = 0,
  complete = false,
  category = "Hardcore",
  points = 5,
  requiresHC = true,
  active = false,
})

-- Level 20
table.insert(KAMN.achievements, {
  id = "HC_LEVEL_20",
  name = "Hardcore: Level 20",
  description = "Reach level 20 on a Hardcore character.",
  type = "level",
  level = 20,
  value = 20,
  progress = 0,
  complete = false,
  category = "Hardcore",
  points = 5,
  requiresHC = true,
  active = false,
})

-- Level 30
table.insert(KAMN.achievements, {
  id = "HC_LEVEL_30",
  name = "Hardcore: Level 30",
  description = "Reach level 30 on a Hardcore character.",
  type = "level",
  level = 30,
  value = 30,
  progress = 0,
  complete = false,
  category = "Hardcore",
  points = 5,
  requiresHC = true,
  active = false,
})

-- Level 40
table.insert(KAMN.achievements, {
  id = "HC_LEVEL_40",
  name = "Hardcore: Level 40",
  description = "Reach level 40 on a Hardcore character.",
  type = "level",
  level = 40,
  value = 40,
  progress = 0,
  complete = false,
  category = "Hardcore",
  points = 5,
  requiresHC = true,
  active = false,
})

-- Level 50
table.insert(KAMN.achievements, {
  id = "HC_LEVEL_50",
  name = "Hardcore: Level 50",
  description = "Reach level 50 on a Hardcore character.",
  type = "level",
  level = 50,
  value = 50,
  progress = 0,
  complete = false,
  category = "Hardcore",
  points = 5,
  requiresHC = true,
  active = false,
})

-- Level 60
table.insert(KAMN.achievements, {
  id = "HC_LEVEL_60",
  name = "Hardcore: Level 60",
  description = "Reach level 60 on a Hardcore character.",
  type = "level",
  level = 60,
  value = 60,
  progress = 0,
  complete = false,
  category = "Hardcore",
  points = 10,
  requiresHC = true,
  active = false,
})
