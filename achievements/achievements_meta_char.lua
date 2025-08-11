-- achievements_meta_char.lua
-- Identity metas:
-- 1) All Alliance races created
-- 2) All Horde races created
-- 3) All classes created
-- 4) Grand master (requires the three above)
-- All metas are 25 points to match CI.

KAMN = KAMN or {}
KAMN.achievements = KAMN.achievements or {}

-- ------------------------------------------------
-- 🛡 Alliance Identity (All Alliance races created)
-- ------------------------------------------------
table.insert(KAMN.achievements, {
  id = "META_RACES_ALLIANCE",
  name = "Alliance Ancestry",
  description = "Create one character for each Alliance race.",
  type = "meta",
  requires = {
    "RACE_HUMAN_CREATED",
    "RACE_DWARF_CREATED",
    "RACE_NELF_CREATED",
    "RACE_GNOME_CREATED",
    "RACE_HIGHELF_CREATED", -- 🆕 Turtle race
  },
  category = "Meta",
  subcategory = "character",
  points = 25,
})

-- --------------------------------------------
-- 🗡 Horde Identity (All Horde races created)
-- --------------------------------------------
table.insert(KAMN.achievements, {
  id = "META_RACES_HORDE",
  name = "Horde Bloodlines",
  description = "Create one character for each Horde race.",
  type = "meta",
  requires = {
    "RACE_ORC_CREATED",
    "RACE_TROLL_CREATED",
    "RACE_TAUREN_CREATED",
    "RACE_UNDEAD_CREATED",  -- base identity uses race = "SCOURGE"
    "RACE_GOBLIN_CREATED",  -- 🆕 Turtle race
  },
  category = "Meta",
  subcategory = "character",
  points = 25,
})

-- -----------------------------------------
-- 🎓 Class Identity (All classes created)
-- -----------------------------------------
table.insert(KAMN.achievements, {
  id = "META_CLASSES_ALL",
  name = "Class Connoisseur",
  description = "Create one character for every class.",
  type = "meta",
  requires = {
    "CLASS_WARRIOR_CREATED",
    "CLASS_PALADIN_CREATED",
    "CLASS_HUNTER_CREATED",
    "CLASS_ROGUE_CREATED",
    "CLASS_PRIEST_CREATED",
    "CLASS_SHAMAN_CREATED",
    "CLASS_MAGE_CREATED",
    "CLASS_WARLOCK_CREATED",
    "CLASS_DRUID_CREATED",
  },
  category = "Meta",
  subcategory = "character",
  points = 25,
})

-- -------------------------------------------------------
-- 🏆 Grand Master Identity (complete the three metas)
-- -------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "META_IDENTITY_GRANDMASTER",
  name = "Identity Grandmaster",
  description = "Complete Alliance and Horde race identities and all class identities.",
  type = "meta",
  requires = {
    "META_RACES_ALLIANCE",
    "META_RACES_HORDE",
    "META_CLASSES_ALL",
  },
  category = "Meta",
  subcategory = "character",
  points = 25,
})
