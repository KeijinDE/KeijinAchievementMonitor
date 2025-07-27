-- achievements/achievements_exploration_capitals.lua
---------------------------

KAMN = KAMN or {}
KAMN.achievements = KAMN.achievements or {}

-- Orgrimmar
table.insert(KAMN.achievements, {
  id = "DISCOVER_ORGRIMMAR",
  name = "Orgrimmar Discovered",
  description = "Set foot in Orgrimmar, capital of the Horde.",
  type = "discover",
  zonename = "Orgrimmar",

  value = 1,
  progress = 0,
  complete = false,
  category = "Exploration",
  points = 5,
  requiredFor = {},
    continent = "Azeroth",
  zonegroup = "Capitals",
})

-- Undercity
table.insert(KAMN.achievements, {
  id = "DISCOVER_UNDERCITY",
  name = "Undercity Discovered",
  description = "Set foot in the Undercity, capital of the Forsaken.",
  type = "discover",
  zonename = "Undercity",

  value = 1,
  progress = 0,
  complete = false,
  category = "Exploration",
  points = 5,
  requiredFor = {},
    continent = "Azeroth",
  zonegroup = "Capitals",
})

-- Thunder Bluff
table.insert(KAMN.achievements, {
  id = "DISCOVER_THUNDERBLUFF",
  name = "Thunder Bluff Discovered",
  description = "Set foot in Thunder Bluff, city of the tauren.",
  type = "discover",
  zonename = "Thunder Bluff",
  continent = "Azeroth",
  zonegroup = "Capitals",
  value = 1,
  progress = 0,
  complete = false,
  category = "Exploration",
  points = 5,
  requiredFor = {},
})

-- Stormwind
table.insert(KAMN.achievements, {
  id = "DISCOVER_STORMWIND",
  name = "Stormwind Discovered",
  description = "Set foot in Stormwind, heart of the Alliance.",
  type = "discover",
  zonename = "Stormwind Habor",
  continent = "Azeroth",
  zonegroup = "Capitals",
  value = 1,
  progress = 0,
  complete = false,
  category = "Exploration",
  points = 5,
  requiredFor = {},
})

-- Ironforge
table.insert(KAMN.achievements, {
  id = "DISCOVER_IRONFORGE",
  name = "Ironforge Discovered",
  description = "Set foot in Ironforge, city of dwarves and gnomes.",
  type = "discover",
  zonename = "Ironforge",
  continent = "Azeroth",
  zonegroup = "Capitals",
  value = 1,
  progress = 0,
  complete = false,
  category = "Exploration",
  points = 5,
  requiredFor = {},
})

-- Darnassus
table.insert(KAMN.achievements, {
  id = "DISCOVER_DARNASSUS",
  name = "Darnassus Discovered",
  description = "Set foot in Darnassus, sanctuary of the night elves.",
  type = "discover",
  zonename = "Darnassus",
  continent = "Azeroth",
  zonegroup = "Capitals",
  value = 1,
  progress = 0,
  complete = false,
  category = "Exploration",
  points = 5,
  requiredFor = {},
})


