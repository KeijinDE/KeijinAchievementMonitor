-- achievements_meta.lua
-- Test-Metaerfolge für verschachtelte Erfolgslogik

KAMN = KAMN or {}
KAMN.achievements = KAMN.achievements or {}

-- Meta Achievement: Proven Combatant
table.insert(KAMN.achievements, {
  id = "META_SLAYER_001",
  name = "Proven Combatant",
  description = "Complete all Slayer ranks from First Blood to Warmaster.",
  type = "meta",
  requires = {
    "KILL_01",
    "KILL_05",
    "KILL_10",
    "KILL_50",
    "KILL_100",
    "KILL_200",
    "KILL_500",
  },
  category = "Meta",
  subcategory = "combat",
  points = 20,
})
-- Meta Achievement: Massacre Proven
table.insert(KAMN.achievements, {
  id = "META_SLAYER_002",
  name = "Massacre Proven",
  description = "Prove your worth by earning the Massacre Master title.",
  type = "meta",
  subcategory = "combat",
  requires = { "KILL_1000", "KILL_10000" },
  category = "Meta",
  points = 25,
})

-- Meta Achievement: Kill all peaceful Critters
table.insert(KAMN.achievements, {
  id = "META_CRITTER_CONTROL01",
  name = "Sorry, That Wasn't My Intention",
  description = "Defeat friendly critters across Azeroth.",
  type = "meta",
  requires = {
    "KILL_SQUIRREL1",
    "KILL_SHEEP1",
    "KILL_CAT1",
    "KILL_RABBIT1",
    "KILL_FROG1",
    "KILL_SNAKE1",
    "KILL_CHICKEN1",
    "KILL_COW1",
    "KILL_DEER1",
    "KILL_PRAIRIEDOG1",
    "KILL_BLACKRAT1",
    "KILL_ADDER1",
    "KILL_TOAD1",
    "KILL_FAWN1",
	"KILL_Roach1",
	"KILL_Rat1",
  },
  category = "Meta",
  subcategory = "combat",
  points = 20,
})

-- Meta Achievement: Porkpocalypse
table.insert(KAMN.achievements, {
  id = "META_BOAR_GRIND_001",
  name = "Porkpocalypse",
  description = "No boar left alive. You are legend… or a menace.",
  type = "meta",
  requires = {
    "KILLGROUP_BOARS01",
    "KILLGROUP_BOARS02",
    "KILLGROUP_BOARS03",
  },
  category = "Meta",
  subcategory = "combat",
  points = 20,
})

-- Meta Achievement: Starting Zone Slayer
table.insert(KAMN.achievements, {
  id = "META_STARTING_ZONE_SLAYER",
  name = "Starting Zone Slayer",
  description = "Complete all zone-specific kill achievements in the starting regions of Azeroth.",
  type = "meta",
  requires = {
    "KILLGROUP_PLAINSTRIDER",
    "KILLGROUP_DUROTAR_SCORPIDS",
    "KILLGROUP_ELWYNN_WOLVES",
    "KILLGROUP_DUNMOROGH_WENDIGOS",
    "KILLGROUP_TELDRASSIL_NIGHTSABER",
    "KILLGROUP_TIRISFAL_DUSKBATS",
  },
  category = "Meta",
  subcategory = "combat",
  points = 20,
})

-- Meta Achievement: Alliance Envoy
table.insert(KAMN.achievements, {
  id = "META_ALLIANCE_CITIES_1000",
  name = "Alliance Envoy",
  description = "Gain 1000 reputation with all major Alliance cities.",
  type = "meta",
  requires = {
    "REPUTATION_STORMWIND_1000",
    "REPUTATION_IRONFORGE_1000",
    "REPUTATION_DARNASSUS_1000",
    "REPUTATION_GNOMEREGAN_1000",
  },
  category = "Meta",
  subcategory = "reputation",
  points = 20,
})

-- Meta Achievement: Horde Envoy
table.insert(KAMN.achievements, {
  id = "META_HORDE_CITIES_1000",
  name = "Horde Envoy",
  description = "Gain 1000 reputation with all major Horde cities.",
  type = "meta",
  requires = {
    "REPUTATION_ORGRIMMAR_1000",
    "REPUTATION_THUNDERBLUFF_1000",
    "REPUTATION_UNDERCITY_1000",
    "REPUTATION_DARKSPEAR_1000",
  },
  category = "Meta",
  subcategory = "reputation",
  points = 20,
})
-- Horde Exalted Champion

table.insert(KAMN.achievements, {
  id = "META_HORDE_EXALTED_CITIES",
  name = "Champion of the Horde",
  description = "Reach 21000 reputation with all Horde capital cities.",
  type = "meta",
  requires = {
    "REPUTATION_ORGRIMMAR_21000",
    "REPUTATION_THUNDERBLUFF_21000",
    "REPUTATION_UNDERCITY_21000",
    "REPUTATION_DARKSPEAR_21000",
  },
  category = "Meta",
  subcategory = "reputation",
  points = 25,
})

-- Alliance Exalted Champion

table.insert(KAMN.achievements, {
  id = "META_ALLIANCE_EXALTED_CITIES",
  name = "Champion of the Alliance",
  description = "Reach 21000 reputation with all Alliance capital cities.",
  type = "meta",
  requires = {
    "REPUTATION_STORMWIND_21000",
    "REPUTATION_IRONFORGE_21000",
    "REPUTATION_DARNASSUS_21000",
    "REPUTATION_GNOMEREGAN_21000",
  },
  category = "Meta",
  subcategory = "reputation",
  points = 25,
})

-- Slayer of the Old World

table.insert(KAMN.achievements, {
  id = "META_RAIDBOSSES_CLASSIC",
  name = "Echoes of Death",
  description = "Defeat all major raid bosses of Azeroth.",
  type = "meta",
  requires = {
    "KILL_RAGNAROS",
    "KILL_NEFARIAN",
    "KILL_CTHUN",
    "KILL_KELTHUZAD",
    "KILL_ONYXIA",
    "KILL_HAKKAR",
    "KILL_MANDOKIR",
    "KILL_JINDO",
    "KILL_AZUREGOS",
    "KILL_KAZZAK",
  },
  category = "Meta",
  subcategory = "combat",
  points = 25,
})
