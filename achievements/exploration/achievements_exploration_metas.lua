-- achievements/achievements_exploration_metas.lua
---------------------------

KAMN = KAMN or {}
KAMN.achievements = KAMN.achievements or {}

-- Meta: Major Cities Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_CAPITALS",
  name = "Major Cities Explorer",
  description = "Visit all six major cities of Azeroth.",
  type = "meta",
  category = "Exploration",
  requires = {
    "DISCOVER_ORGRIMMAR",
    "DISCOVER_UNDERCITY",
    "DISCOVER_THUNDERBLUFF",
    "DISCOVER_STORMWIND",
    "DISCOVER_IRONFORGE",
    "DISCOVER_DARNASSUS",
  },
  progress = 0,
  complete = false,
  points = 25,
  requiredFor = {},
})

-- Meta: Blackstone Isle (Goblins)
table.insert(KAMN.achievements, {
  id = "DISCOVER_BLACKSTONE_META",
  name = "Zone: Blackstone Isle",
  description = "Explore all areas of the Goblin start zone on Blackstone Isle.",
  type = "meta",
  category = "Exploration",
  requires = {
    "DISCOVER_SMUGGLERSCOVE", "DISCOVER_GOBLINSLUMS", "DISCOVER_BLACKSTONEMINE",
    "DISCOVER_CRIMSONWATCHTOWER", "DISCOVER_BILGEWATERDOCKS"
  },
  progress = 0,
  complete = false,
  points = 15,
  requiredFor = {},
})

-- Meta: Thalassian Highlands (High Elves)
table.insert(KAMN.achievements, {
  id = "DISCOVER_THALASSIAN_META",
  name = "Zone: Thalassian Highlands",
  description = "Explore all areas of the High Elf start zone in the Thalassian Highlands.",
  type = "meta",
  category = "Exploration",
  requires = {
    "DISCOVER_QUELDANILLODGE", "DISCOVER_SUNFIREPOINT", "DISCOVER_FARONDALE",
    "DISCOVER_RAVENCRESTSCITADEL", "DISCOVER_SANLAYNRUINS"
  },
  progress = 0,
  complete = false,
  points = 15,
  requiredFor = {},
})


-- Zone: Mulgore (Meta)
table.insert(KAMN.achievements, {
  id = "DISCOVER_MULGORE",
  name = "Zone: Mulgore",
  description = "Explore all key areas in Mulgore.",
  type = "meta",
  category = "Exploration",
  requires = {
    "DISCOVER_BAELDUN",
    "DISCOVER_BLOODHOOF",
    "DISCOVER_BRAMBLEBLADE",
    "DISCOVER_CAMPNARACHE",
    "DISCOVER_GOLDENPLAINS",
    "DISCOVER_KODOROCK",
    "DISCOVER_PALEMANEROCK",
    "DISCOVER_CARAVAN",
    "DISCOVER_REDCLOUD",
    "DISCOVER_REDROCKS",
    "DISCOVER_ROLLINGPLAINS",
    "DISCOVER_STONEBULL",
    "DISCOVER_THUNDERHORN",
    "DISCOVER_VENTUREMINE",
    "DISCOVER_WILDMANE",
    "DISCOVER_WINDFURY",
    "DISCOVER_WINTERHOOF",
  },
  progress = 0,
  complete = false,
  points = 15,
  requiredFor = {},
})

-- Meta: Zone: Durotar
table.insert(KAMN.achievements, {
  id = "DISCOVER_DUROTAR",
  name = "Zone: Durotar",
  description = "Explore all key areas in Durotar.",
  type = "meta",
  category = "Exploration",
  requires = {
    "DISCOVER_SKULLROCK",
    "DISCOVER_THUNDERRIDGE",
    "DISCOVER_ECHOISLES",
    "DISCOVER_KOLKARCRAG",
    "DISCOVER_DRYGULCH",
    "DISCOVER_RAZORMANE",
    "DISCOVER_VALLEYOFTRIALS",
    "DISCOVER_TIRAGARDE",
    "DISCOVER_SENJIN",
    "DISCOVER_RAZORHILL",
  },
  progress = 0,
  complete = false,
  points = 15,
  requiredFor = {},
})

-- Meta: Zone: Tirisfal Glades
table.insert(KAMN.achievements, {
  id = "DISCOVER_TIRISFAL",
  name = "Zone: Tirisfal Glades",
  description = "Explore all key areas in Tirisfal Glades.",
  type = "meta",
  category = "Exploration",
  requires = {
    "DISCOVER_DEATHKNELL",
    "DISCOVER_BRILL",
    "DISCOVER_BALNIR",
    "DISCOVER_WHISPERING",
    "DISCOVER_BULWARK",
    "DISCOVER_SOLLIDEN",
    "DISCOVER_SCARLETPOST",
    "DISCOVER_STILLWATER",
    "DISCOVER_AGAMAND",
    "DISCOVER_GARREN",
    "DISCOVER_CRUSADER",
    "DISCOVER_NIGHTMARE",
    "DISCOVER_COLDHEARTH",
    "DISCOVER_BRIGHTWATER",
    "DISCOVER_VENOMWEB",
  },
  progress = 0,
  complete = false,
  points = 15,
  requiredFor = {},
})

-- Meta: Zone: Elwynn Forest
table.insert(KAMN.achievements, {
  id = "DISCOVER_ELWYNN",
  name = "Zone: Elwynn Forest",
  description = "Explore all key areas in Elwynn Forest.",
  type = "meta",
  category = "Exploration",
  requires = {
    "DISCOVER_RIDGEPOINT",
    "DISCOVER_JEROD",
    "DISCOVER_AZORA",
    "DISCOVER_CRYSTAL",
    "DISCOVER_GOLDSHIRE",
    "DISCOVER_EASTVALE",
    "DISCOVER_NORTHSHIRE",
    "DISCOVER_FORESTEDGE",
    "DISCOVER_BRACKWELL",
    "DISCOVER_STONECAIRN",
    "DISCOVER_FARGODEEP",
  },
  progress = 0,
  complete = false,
  points = 15,
  requiredFor = {},
})
-- Meta: Zone: Loch Modan
table.insert(KAMN.achievements, {
  id = "DISCOVER_LOCHMODAN",
  name = "Zone: Loch Modan",
  description = "Explore all key areas in Loch Modan.",
  type = "meta",
  category = "Exploration",
  requires = {
    "DISCOVER_IRONBAND",
    "DISCOVER_NORTHGATE",
    "DISCOVER_FARSTRIDER",
    "DISCOVER_LOCH",
    "DISCOVER_STONESPLINTER",
    "DISCOVER_SILVERSTREAM",
    "DISCOVER_GRIZZLEPAW",
    "DISCOVER_STONEWROUGHT",
    "DISCOVER_MOGROSH",
    "DISCOVER_THELSAMAR",
    "DISCOVER_VALLEYOFKINGS",
  },
  progress = 0,
  complete = false,
  points = 15,
  requiredFor = {},
})

-- Meta: Zone: Teldrassil
table.insert(KAMN.achievements, {
  id = "DISCOVER_TELDRASSIL",
  name = "Zone: Teldrassil",
  description = "Explore all key areas in Teldrassil.",
  type = "meta",
  category = "Exploration",
  requires = {
    "DISCOVER_RUTHERAN",
    "DISCOVER_ALAMETH",
    "DISCOVER_BANETHIL",
    "DISCOVER_STARBREEZE",
    "DISCOVER_WELLSPRING",
    "DISCOVER_GNARLPINE",
    "DISCOVER_ARLITHRIEN",
    "DISCOVER_SHADOWGLEN",
    "DISCOVER_DOLANAAR",
    "DISCOVER_ORACLEGLADE",
  },
  progress = 0,
  complete = false,
  points = 15,
  requiredFor = {},
})


-- Meta: Zone: Dun Morogh
table.insert(KAMN.achievements, {
  id = "DISCOVER_DUNMOROGH",
  name = "Zone: Dun Morogh",
  description = "Explore all key areas in Dun Morogh.",
  type = "meta",
  category = "Exploration",
  requires = {
    "DISCOVER_COLDRIDGEPASS",
    "DISCOVER_IRONGATES",
    "DISCOVER_GRIZZLED",
    "DISCOVER_FROSTMANEHOLD",
    "DISCOVER_GOLBOLAR",
    "DISCOVER_AMBERSTILL",
    "DISCOVER_KHARANOS",
    "DISCOVER_ANVILMAR",
    "DISCOVER_HELMSBED",
    "DISCOVER_SOUTHGATE",
    "DISCOVER_GNOMEREGAN",
    "DISCOVER_BREWNALL",
    "DISCOVER_NORTHGATEOUT",
    "DISCOVER_MISTYPINE",
    "DISCOVER_TUNDRID",
    "DISCOVER_CHILLBREEZE",
    "DISCOVER_SHIMMER",
    "DISCOVER_ICEFLOW",
  },
  progress = 0,
  complete = false,
  points = 15,
  requiredFor = {},
})

-- Meta: Zone: Westfall
table.insert(KAMN.achievements, {
  id = "DISCOVER_WESTFALL",
  name = "Zone: Westfall",
  description = "Explore all key areas in Westfall.",
  type = "meta",
  category = "Exploration",
  requires = {
    "DISCOVER_MOONBROOK",
    "DISCOVER_GOLDCOAST",
    "DISCOVER_JANSEN",
    "DISCOVER_LIGHTHOUSE",
    "DISCOVER_ALEXSTON",
    "DISCOVER_DEADACRE",
    "DISCOVER_DEMONTS",
    "DISCOVER_MOLSEN",
    "DISCOVER_SENTINELHILL",
    "DISCOVER_JANGOLODE",
    "DISCOVER_DUSTPLAINS",
    "DISCOVER_SALDEAN",
    "DISCOVER_DAGGERHILLS",
    "DISCOVER_FURLBROW",
  },
  progress = 0,
  complete = false,
  points = 15,
  requiredFor = {},
})
-- Meta: Zone: The Barrens
table.insert(KAMN.achievements, {
  id = "DISCOVER_BARRENS",
  name = "Zone: The Barrens",
  description = "Explore all key areas in The Barrens.",
  type = "meta",
  category = "Exploration",
  requires = {
    "DISCOVER_MORSHAN", "DISCOVER_THORNHILL", "DISCOVER_RFK", "DISCOVER_MERCHANT",
    "DISCOVER_HONORSSTAND", "DISCOVER_LUSHWATER", "DISCOVER_DREADMIST", "DISCOVER_SLUDGEFEN",
    "DISCOVER_RATCHET", "DISCOVER_FORGOTTENPOOLS", "DISCOVER_BRAMBLESCAR", "DISCOVER_TAURAJO",
    "DISCOVER_BOULDERLODE", "DISCOVER_RAPTORGROUNDS", "DISCOVER_RFD", "DISCOVER_BAELMODAN",
    "DISCOVER_STAGNANTOASIS", "DISCOVER_AGAMAGOR", "DISCOVER_CROSSROADS", "DISCOVER_GROLDOM",
    "DISCOVER_BLACKTHORN", "DISCOVER_NORTHWATCH", "DISCOVER_DRYHILLS", "DISCOVER_FARWATCH",
    "DISCOVER_GIANTS"
  },
  progress = 0,
  complete = false,
  points = 15,
  requiredFor = {},
})

-- Meta: Zone: Darkshore
table.insert(KAMN.achievements, {
  id = "DISCOVER_DARKSHORE",
  name = "Zone: Darkshore",
  description = "Explore all key areas in Darkshore.",
  type = "meta",
  category = "Exploration",
  requires = {
    "DISCOVER_BASHALARAN",
    "DISCOVER_REMTRAVEL",
    "DISCOVER_ALTHALAXX",
    "DISCOVER_GLAIVE",
    "DISCOVER_GROVE",
    "DISCOVER_MATHYSTRA",
    "DISCOVER_AUBERDINE",
    "DISCOVER_AMETHARAN",
    "DISCOVER_CLIFFSPRING",
  },
  progress = 0,
  complete = false,
  points = 15,
  requiredFor = {},
})