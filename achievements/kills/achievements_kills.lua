-- achievements_Defeats.lua
-- Combat Achievements: Defeats, Named Defeats, Bosses (English only)

KAMN = KAMN or {}
KAMN.achievements = KAMN.achievements or {}

-- Generic Kill Achievements
table.insert(KAMN.achievements, {
  id = "KILL_01",
  name = "First Blood",
  description = "Defeat your first enemy.",
  type = "kill",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_05",
  name = "Warm-Up Round",
  description = "Defeat 5 enemies.",
  type = "kill",
  value = 5,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_10",
  name = "Seasoned Combatant",
  description = "Defeat 10 enemies.",
  type = "kill",
  value = 10,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_50",
  name = "Azeroth Slayer",
  description = "Defeat 50 enemies across Azeroth.",
  type = "kill",
  value = 50,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_100",
  name = "Endless War",
  description = "Defeat 100 enemies – the battle never ends.",
  type = "kill",
  value = 100,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 10,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_200",
  name = "Slayer Supreme",
  description = "Defeat 200 enemies in battle.",
  type = "kill",
  value = 200,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 10,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_500",
  name = "Warmaster",
  description = "Defeat 500 enemies – a true warrior.",
  type = "kill",
  value = 500,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 20,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_1000",
  name = "Massacre Master",
  description = "Defeat 1000 enemies in total.",
  type = "kill",
  value = 1000,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 25,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_10000",
  name = "Unstoppable",
  description = "Defeat 10,000 enemies. Nothing can stop you.",
  type = "kill",
  value = 10000,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 50,
  requiredFor = {},
})
