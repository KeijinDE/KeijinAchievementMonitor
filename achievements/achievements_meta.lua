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
	"KILL_HARE1"
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

--- Exploration
-- Eastern Kingdoms
-- 🧭 Meta: Explore the Eastern Kingdoms
table.insert(KAMN.achievements, {
  id = "DISCOVER_EK",
  name = "Explore the Eastern Kingdoms",
  description = "Discover all regions of the Eastern Kingdoms.",
  type = "meta",
  category = "Meta",
  subcategory = "Exploration",
  continent = "Eastern Kingdoms",
  zonegroup = "Eastern Kingdoms",
  progress = 0,
  complete = false,
  points = 25,
  requires = {
    "DISCOVER_ARATHI",
    "DISCOVER_BADLANDS",
    "DISCOVER_BLASTEDLANDS",
    "DISCOVER_BURNINGSTEPPES",
    "DISCOVER_DEADWINDPASS",
    "DISCOVER_DUNMOROGH",
    "DISCOVER_DUSKWOOD",
    "DISCOVER_EASTERNPLAGUELANDS",
    "DISCOVER_ELWYNN",
    "DISCOVER_HILLSBRAD",
    "DISCOVER_HINTERLANDS",
    "DISCOVER_LOCHMODAN",
    "DISCOVER_REDRIDGE",
    "DISCOVER_SEARINGGORGE",
    "DISCOVER_SILVERPINEFOREST",
    "DISCOVER_STRANGLETHORN",
    "DISCOVER_SWAMPOFSORROWS",
    "DISCOVER_TIRISFAL",
    "DISCOVER_WESTERNPLAGUELANDS",
    "DISCOVER_WESTFALL",
    "DISCOVER_WETLANDS",
    -- Eastern Capitals
    "DISCOVER_STORMWIND",
    "DISCOVER_IRONFORGE",
    "DISCOVER_UNDERCITY",
  },
  requiredFor = {},
})

-- Kalimdor
-- 🧭 Meta: Kalimdor Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_KALIMDOR",
  name = "Explore Kalimdor",
  description = "Discover all regions of Kalimdor.",
  type = "meta",
  category = "Meta",
  subcategory = "Exploration",
  continent = "Kalimdor",
  zonegroup = "Kalimdor",
  progress = 0,
  complete = false,
  points = 25,
  requires = {
    "DISCOVER_ASHENVALE",
    "DISCOVER_AZSHARA",
    "DISCOVER_BARRENS",
    "DISCOVER_DARKSHORE",
    "DISCOVER_DESOLACE",
    "DISCOVER_DUROTAR",
    "DISCOVER_DUSTWALLOWMARSH",
    "DISCOVER_FERALAS",
    "DISCOVER_MOONGLADE",
    "DISCOVER_MULGORE",
    "DISCOVER_SILITHUS",
    "DISCOVER_STONETALONMOUNTAINS",
    "DISCOVER_TANARIS",
    "DISCOVER_TELDRASSIL",
    "DISCOVER_THOUSANDNEEDLES",
    "DISCOVER_UNGOROCRATER",
    "DISCOVER_WINTERSPRING",
    -- Capitals
    "DISCOVER_ORGRIMMAR",
    "DISCOVER_THUNDERBLUFF",
    "DISCOVER_DARNASSUS",
  },
  requiredFor = {},
})

-- Azeroth
-- 🧭 Meta: Explore the World
table.insert(KAMN.achievements, {
  id = "DISCOVER_AZEROTH",
  name = "World Explorer",
  description = "Discover all regions and capitals across the Eastern Kingdoms and Kalimdor.",
  type = "meta",
  category = "Meta",
  subcategory = "Exploration",
  continent = "Azeroth",
  zonegroup = "Azeroth",
  progress = 0,
  complete = false,
  points = 25,
  requires = {
    "DISCOVER_EK",
    "DISCOVER_KALIMDOR",
  },
  requiredFor = {},
})

-- 🧭 Meta: Blackwing Lair Quest Reihe
table.insert(KAMN.achievements, {
  id = "META_BWL_QUESTS",
  name = "Blackwing Lair Quest Master",
  description = "Complete the full quest chain within Blackwing Lair.",
  type = "meta",
  requires = {
    "QUEST_NEFARIUSS_CORRUPTION1",
    "QUEST_ONLY_ONE_MAY_RISE1",
    "QUEST_PURPLE_LOTUS_COLLECTION1",
    "QUEST_SCYTHE_OF_THE_GODDESS1",
  },
  category = "Meta",
  subcategory = "quests",
  points = 25,
})
-- 🧭 Meta: Molten Core Quest Reihe
table.insert(KAMN.achievements, {
  id = "META_MC_QUESTS",
  name = "Molten Core Quest Master",
  description = "Complete the full quest chain within Molten Core.",
  type = "meta",
  requires = {
    "QUEST_ATTUNEMENT_TO_THE_CORE1",
    "QUEST_FAVOR_BLOOD_OF_THE_MOUNTAIN1",
    "QUEST_FAVOR_CORE_LEATHER1",
    "QUEST_SCRYING_GOGGLES1",
  },
  category = "Meta",
  subcategory = "quests",
  points = 40,
})
-- 🧭 Meta: Naxxramas Quest Reihe
table.insert(KAMN.achievements, {
  id = "META_NAXX_QUESTS",
  name = "Naxxramas Quest Master",
  description = "Complete the full quest chain within Naxxramas.",
  type = "meta",
  requires = {
    "QUEST_THE_FALL_OF_KELTHUZAD1",
    "QUEST_THE_FATE_OF_RAMALADNI1",
    "QUEST_THE_ONLY_SONG_I_KNOW1",
  },
  category = "Meta",
  subcategory = "quests",
  points = 25,
})
-- 🧭 Meta: Temple of Ahn'Qiraj Quest Reihe
table.insert(KAMN.achievements, {
  id = "META_TAQ_QUESTS",
  name = "Temple of Ahn'Qiraj Quest Master",
  description = "Complete the full quest chain within the Temple of Ahn'Qiraj.",
  type = "meta",
  requires = {
    "QUEST_SECRETS_OF_THE_QIRAJI1",
    "QUEST_MORTAL_CHAMPIONS1",
    "QUEST_CTHUNS_LEGACY1",
  },
  category = "Meta",
  subcategory = "quests",
  points = 25,
})
-- 🧭 Meta: Zul'Gurub Quest Reihe
table.insert(KAMN.achievements, {
  id = "META_ZG_QUESTS",
  name = "Zul'Gurub Quest Master",
  description = "Complete the full quest chain within Zul'Gurub.",
  type = "meta",
  requires = {
    "QUEST_A_BIJOU_FOR_ZANZA1",
    "QUEST_A_COLLECTION_OF_HEADS1",
    "QUEST_CONFRONT_YEHKINYA1",
    "QUEST_ESSENCE_MANGOES1",
    "QUEST_GURUBASHI_VILEBRANCH_WITHERBARK_COINS1",
    "QUEST_NATS_MEASURING_TAPE1",
  },
  category = "Meta",
  subcategory = "quests",
  points = 25,
})
