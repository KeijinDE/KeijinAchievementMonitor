-- achievements_char.lua
-- Character Level Achievements (English only, Classic 1.12 compatible)

KAMN = KAMN or {}
KAMN.achievements = KAMN.achievements or {}

-- Level 2 Achievement
table.insert(KAMN.achievements, {
  id = "LEVEL_02",
  name = "Level 02 – The Beginning",
  description = "Reach level 2 with your character. A small step into a greater journey.",
  type = "level",
  level = 2,
  value = 2,
  progress = 0,
  complete = false,
  category = "Character",
  points = 5,
  requiredFor = {}
})

-- Level 5 Achievement
table.insert(KAMN.achievements, {
  id = "LEVEL_05",
  name = "Level 05 – First Steps",
  description = "Reach level 5 with your character. Your adventure starts to take shape.",
  type = "level",
  level = 5,
  value = 5,
  progress = 0,
  complete = false,
  category = "Character",
  points = 5,
  requiredFor = {}
})

-- Level 10 Achievement
table.insert(KAMN.achievements, {
  id = "LEVEL_10",
  name = "Level 10 – A True Adventurer",
  description = "Reach level 10 with your character. A milestone on the path to glory.",
  type = "level",
  level = 10,
  value = 10,
  progress = 0,
  complete = false,
  category = "Character",
  points = 5,
  requiredFor = {}
})

-- Level 20 Achievement
table.insert(KAMN.achievements, {
  id = "LEVEL_20",
  name = "Level 20 – Seasoned Explorer",
  description = "Reach level 20 with your character. Your skills grow stronger each day.",
  type = "level",
  level = 20,
  value = 20,
  progress = 0,
  complete = false,
  category = "Character",
  points = 5,
  requiredFor = {}
})

-- Level 30 Achievement
table.insert(KAMN.achievements, {
  id = "LEVEL_30",
  name = "Level 30 – Veteran of the Road",
  description = "Reach level 30 with your character. You are now a force to be reckoned with.",
  type = "level",
  level = 30,
  value = 30,
  progress = 0,
  complete = false,
  category = "Character",
  points = 5,
  requiredFor = {}
})

-- Level 40 Achievement
table.insert(KAMN.achievements, {
  id = "LEVEL_40",
  name = "Level 40 – Master of Arms",
  description = "Reach level 40 with your character. The peak is in sight, but challenges remain.",
  type = "level",
  level = 40,
  value = 40,
  progress = 0,
  complete = false,
  category = "Character",
  points = 5,
  requiredFor = {}
})

-- Level 50 Achievement
table.insert(KAMN.achievements, {
  id = "LEVEL_50",
  name = "Level 50 – Near the Summit",
  description = "Reach level 50 with your character. Few have come this far—fewer still will finish the climb.",
  type = "level",
  level = 50,
  value = 50,
  progress = 0,
  complete = false,
  category = "Character",
  points = 5,
  requiredFor = {}
})

-- Level 60 Achievement
table.insert(KAMN.achievements, {
  id = "LEVEL_60",
  name = "Level 60 – Champion of Azeroth",
  description = "Reach level 60 with your character. You stand among the champions of Azeroth.",
  type = "level",
  level = 60,
  value = 60,
  progress = 0,
  complete = false,
  category = "Character",
  points = 10,
  requiredFor = {}
})


table.insert(KAMN.achievements, {
  id = "DEATH_FIRST",
  name = "First Fall",
  description = "Suffer your first death.",
  type = "death",
  value = 1,
  progress = 0,
  complete = false,
  category = "Character",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "DEATH_NAKED",
  name = "Bare Bones",
  description = "Die while wearing no armor pieces.",
  type = "death",
  value = 1,
  progress = 0,
  complete = false,
  category = "Character",
  points = 10,
  requiredFor = {}
})

-- ------------------------------------------------
-- Death Count Milestones (kumulativ) – gruppiert
-- ------------------------------------------------
table.insert(KAMN.achievements, {
  id = "DEATH_5",
  name = "Five Times Down",
  description = "Die 5 times with this character.",
  type = "death",
  group = "DEATH_COUNT",
  value = 5,
  progress = 0,
  complete = false,
  category = "Character",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "DEATH_10",
  name = "Tenacious Spirit",
  description = "Die 10 times with this character.",
  type = "death",
  group = "DEATH_COUNT",
  value = 10,
  progress = 0,
  complete = false,
  category = "Character",
  points = 10,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "DEATH_25",
  name = "Quarter Century of Wipes",
  description = "Die 25 times with this character.",
  type = "death",
  group = "DEATH_COUNT",
  value = 25,
  progress = 0,
  complete = false,
  category = "Character",
  points = 15,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "DEATH_50",
  name = "Half to a Hundred",
  description = "Die 50 times with this character.",
  type = "death",
  group = "DEATH_COUNT",
  value = 50,
  progress = 0,
  complete = false,
  category = "Character",
  points = 20,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "DEATH_100",
  name = "Century of Defeats",
  description = "Die 100 times with this character.",
  type = "death",
  group = "DEATH_COUNT",
  value = 100,
  progress = 0,
  complete = false,
  category = "Character",
  points = 25,
  requiredFor = {}
})



-- ================================
-- Character → Identity (Race)
-- ================================
-- One-shot achievements that complete once for the current character if the race token matches.
-- Uses UnitRace("player") tokens: HUMAN, DWARF, NIGHTELF, GNOME, ORC, TROLL, TAUREN, SCOURGE (Undead)

table.insert(KAMN.achievements, {
  id = "RACE_HUMAN_CREATED",
  name = "First Steps: Human",
  description = "Create a Human character.",
  category = "Character",
  type = "identity",
  subtype = "race",
  race = "HUMAN",
  value = 1,
  progress = 0,
  complete = false,
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "RACE_DWARF_CREATED",
  name = "Stout Heart: Dwarf",
  description = "Create a Dwarf character.",
  category = "Character",
  type = "identity",
  subtype = "race",
  race = "DWARF",
  value = 1,
  progress = 0,
  complete = false,
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "RACE_NELF_CREATED",
  name = "Shadow of the Woods: Night Elf",
  description = "Create a Night Elf character.",
  category = "Character",
  type = "identity",
  subtype = "race",
  race = "NIGHTELF",
  value = 1,
  progress = 0,
  complete = false,
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "RACE_GNOME_CREATED",
  name = "Tinkerer Born: Gnome",
  description = "Create a Gnome character.",
  category = "Character",
  type = "identity",
  subtype = "race",
  race = "GNOME",
  value = 1,
  progress = 0,
  complete = false,
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "RACE_ORC_CREATED",
  name = "Blood Fury: Orc",
  description = "Create an Orc character.",
  category = "Character",
  type = "identity",
  subtype = "race",
  race = "ORC",
  value = 1,
  progress = 0,
  complete = false,
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "RACE_TROLL_CREATED",
  name = "Jungle Spirit: Troll",
  description = "Create a Troll character.",
  category = "Character",
  type = "identity",
  subtype = "race",
  race = "TROLL",
  value = 1,
  progress = 0,
  complete = false,
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "RACE_TAUREN_CREATED",
  name = "Earth's Ward: Tauren",
  description = "Create a Tauren character.",
  category = "Character",
  type = "identity",
  subtype = "race",
  race = "TAUREN",
  value = 1,
  progress = 0,
  complete = false,
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "RACE_UNDEAD_CREATED",
  name = "Forsaken Path: Undead",
  description = "Create an Undead character.",
  category = "Character",
  type = "identity",
  subtype = "race",
  race = "SCOURGE", -- Undead token in Classic
  value = 1,
  progress = 0,
  complete = false,
  points = 5,
  requiredFor = {}
})
-- 🆕 Turtle Races
table.insert(KAMN.achievements, {
  id = "RACE_HIGHELF_CREATED",
  name = "Silver Bough: High Elf",
  description = "Create a High Elf character.",
  category = "Character",
  type = "identity",
  subtype = "race",
  race = "HIGHELF",
  value = 1,
  progress = 0,
  complete = false,
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "RACE_GOBLIN_CREATED",
  name = "Trade Prince’s Path: Goblin",
  description = "Create a Goblin character.",
  category = "Character",
  type = "identity",
  subtype = "race",
  race = "GOBLIN",
  value = 1,
  progress = 0,
  complete = false,
  points = 5,
  requiredFor = {}
})

-- ================================
-- Character → Identity (Class)
-- ================================
-- Uses UnitClass("player") tokens: WARRIOR, PALADIN, HUNTER, ROGUE, PRIEST, SHAMAN, MAGE, WARLOCK, DRUID

table.insert(KAMN.achievements, {
  id = "CLASS_WARRIOR_CREATED",
  name = "Path of Strength: Warrior",
  description = "Create a Warrior.",
  category = "Character",
  type = "identity",
  subtype = "class",
  class = "WARRIOR",
  value = 1,
  progress = 0,
  complete = false,
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "CLASS_PALADIN_CREATED",
  name = "Light's Initiate: Paladin",
  description = "Create a Paladin.",
  category = "Character",
  type = "identity",
  subtype = "class",
  class = "PALADIN",
  value = 1,
  progress = 0,
  complete = false,
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "CLASS_HUNTER_CREATED",
  name = "Eyes of the Wild: Hunter",
  description = "Create a Hunter.",
  category = "Character",
  type = "identity",
  subtype = "class",
  class = "HUNTER",
  value = 1,
  progress = 0,
  complete = false,
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "CLASS_ROGUE_CREATED",
  name = "Silent Step: Rogue",
  description = "Create a Rogue.",
  category = "Character",
  type = "identity",
  subtype = "class",
  class = "ROGUE",
  value = 1,
  progress = 0,
  complete = false,
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "CLASS_PRIEST_CREATED",
  name = "Faith's Candle: Priest",
  description = "Create a Priest.",
  category = "Character",
  type = "identity",
  subtype = "class",
  class = "PRIEST",
  value = 1,
  progress = 0,
  complete = false,
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "CLASS_SHAMAN_CREATED",
  name = "Voice of Elements: Shaman",
  description = "Create a Shaman.",
  category = "Character",
  type = "identity",
  subtype = "class",
  class = "SHAMAN",
  value = 1,
  progress = 0,
  complete = false,
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "CLASS_MAGE_CREATED",
  name = "First Spark: Mage",
  description = "Create a Mage.",
  category = "Character",
  type = "identity",
  subtype = "class",
  class = "MAGE",
  value = 1,
  progress = 0,
  complete = false,
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "CLASS_WARLOCK_CREATED",
  name = "Pact Signed: Warlock",
  description = "Create a Warlock.",
  category = "Character",
  type = "identity",
  subtype = "class",
  class = "WARLOCK",
  value = 1,
  progress = 0,
  complete = false,
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "CLASS_DRUID_CREATED",
  name = "Circle's Seed: Druid",
  description = "Create a Druid.",
  category = "Character",
  type = "identity",
  subtype = "class",
  class = "DRUID",
  value = 1,
  progress = 0,
  complete = false,
  points = 5,
  requiredFor = {}
})
