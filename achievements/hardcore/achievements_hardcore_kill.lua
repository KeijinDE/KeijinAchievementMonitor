-- achievements_hardcore_kill.lua
-- Hardcore variants of Generic Kill achievements (mirror of achievements_kills.lua)
-- Nutzt bestehenden Kill-Flow (COMBAT_TEXT_UPDATE, KILLING_BLOW)

KAMN = KAMN or {}
KAMN.achievements = KAMN.achievements or {}

table.insert(KAMN.achievements, {
  id = "HC_KILL_01",
  name = "Hardcore: First Blood",
  description = "Defeat your first enemy while in Hardcore mode.",
  type = "generickill",
  value = 1,
  progress = 0,
  complete = false,
  category = "Hardcore",
  points = 5,
  requiresHC = true,
  active = false,
})

table.insert(KAMN.achievements, {
  id = "HC_KILL_05",
  name = "Hardcore: Warm-Up Round",
  description = "Defeat 5 enemies while in Hardcore mode.",
  type = "generickill",
  value = 5,
  progress = 0,
  complete = false,
  category = "Hardcore",
  points = 5,
  requiresHC = true,
  active = false,
})

table.insert(KAMN.achievements, {
  id = "HC_KILL_10",
  name = "Hardcore: Seasoned Combatant",
  description = "Defeat 10 enemies while in Hardcore mode.",
  type = "generickill",
  value = 10,
  progress = 0,
  complete = false,
  category = "Hardcore",
  points = 5,
  requiresHC = true,
  active = false,
})

table.insert(KAMN.achievements, {
  id = "HC_KILL_50",
  name = "Hardcore: Azeroth Slayer",
  description = "Defeat 50 enemies across Azeroth while in Hardcore mode.",
  type = "generickill",
  value = 50,
  progress = 0,
  complete = false,
  category = "Hardcore",
  points = 5,
  requiresHC = true,
  active = false,
})

table.insert(KAMN.achievements, {
  id = "HC_KILL_100",
  name = "Hardcore: Endless War",
  description = "Defeat 100 enemies while in Hardcore mode.",
  type = "generickill",
  value = 100,
  progress = 0,
  complete = false,
  category = "Hardcore",
  points = 10,
  requiresHC = true,
  active = false,
})

table.insert(KAMN.achievements, {
  id = "HC_KILL_200",
  name = "Hardcore: Slayer Supreme",
  description = "Defeat 200 enemies while in Hardcore mode.",
  type = "generickill",
  value = 200,
  progress = 0,
  complete = false,
  category = "Hardcore",
  points = 10,
  requiresHC = true,
  active = false,
})

table.insert(KAMN.achievements, {
  id = "HC_KILL_500",
  name = "Hardcore: Warmaster",
  description = "Defeat 500 enemies while in Hardcore mode.",
  type = "generickill",
  value = 500,
  progress = 0,
  complete = false,
  category = "Hardcore",
  points = 20,
  requiresHC = true,
  active = false,
})

table.insert(KAMN.achievements, {
  id = "HC_KILL_1000",
  name = "Hardcore: Massacre Master",
  description = "Defeat 1000 enemies while in Hardcore mode.",
  type = "generickill",
  value = 1000,
  progress = 0,
  complete = false,
  category = "Hardcore",
  points = 25,
  requiresHC = true,
  active = false,
})

table.insert(KAMN.achievements, {
  id = "HC_KILL_10000",
  name = "Hardcore: Unstoppable",
  description = "Defeat 10,000 enemies while in Hardcore mode.",
  type = "generickill",
  value = 10000,
  progress = 0,
  complete = false,
  category = "Hardcore",
  points = 50,
  requiresHC = true,
  active = false,
})
