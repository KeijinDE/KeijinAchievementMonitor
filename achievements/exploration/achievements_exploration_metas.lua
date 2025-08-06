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
  subcategory = "Exploration",
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
  continent = "Azeroth",
  zonegroup = "Capitals",
})



-- Zone: Mulgore (Meta)
table.insert(KAMN.achievements, {
  id = "DISCOVER_MULGORE",
  name = "Zone: Mulgore",
  description = "Explore all key areas in Mulgore.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
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
  continent = "Kalimdor",
  zonegroup = "Mulgore",
})


-- Meta: Zone: Durotar
table.insert(KAMN.achievements, {
  id = "DISCOVER_DUROTAR",
  name = "Zone: Durotar",
  description = "Explore all key areas in Durotar.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
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
  continent = "Kalimdor",
  zonegroup = "Durotar",
})


-- Meta: Zone: Tirisfal Glades
table.insert(KAMN.achievements, {
  id = "DISCOVER_TIRISFAL",
  name = "Zone: Tirisfal Glades",
  description = "Explore all key areas in Tirisfal Glades.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
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
  continent = "Eastern Kingdoms",
  zonegroup = "Tirisfal Glades",
})


-- Meta: Zone: Elwynn Forest
table.insert(KAMN.achievements, {
  id = "DISCOVER_ELWYNN",
  name = "Zone: Elwynn Forest",
  description = "Explore all key areas in Elwynn Forest.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
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
  continent = "Eastern Kingdoms",
  zonegroup = "Elwynn Forest",
})

-- Meta: Zone: Loch Modan
table.insert(KAMN.achievements, {
  id = "DISCOVER_LOCHMODAN",
  name = "Zone: Loch Modan",
  description = "Explore all key areas in Loch Modan.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
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
  continent = "Eastern Kingdoms",
  zonegroup = "Loch Modan",
})


-- Meta: Zone: Teldrassil
table.insert(KAMN.achievements, {
  id = "DISCOVER_TELDRASSIL",
  name = "Zone: Teldrassil",
  description = "Explore all key areas in Teldrassil.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
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
  continent = "Kalimdor",
  zonegroup = "Teldrassil",
})



-- Meta: Zone: Dun Morogh
table.insert(KAMN.achievements, {
  id = "DISCOVER_DUNMOROGH",
  name = "Zone: Dun Morogh",
  description = "Explore all key areas in Dun Morogh.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
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
  continent = "Eastern Kingdoms",
  zonegroup = "Dun Morogh",
})


-- Meta: Zone: Westfall
table.insert(KAMN.achievements, {
  id = "DISCOVER_WESTFALL",
  name = "Zone: Westfall",
  description = "Explore all key areas in Westfall.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
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
  continent = "Eastern Kingdoms",
  zonegroup = "Westfall",
})

-- Meta: Zone: The Barrens
table.insert(KAMN.achievements, {
  id = "DISCOVER_BARRENS",
  name = "Zone: The Barrens",
  description = "Explore all key areas in The Barrens.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
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
  continent = "Kalimdor",
  zonegroup = "The Barrens",
})


-- Meta: Zone: Darkshore
table.insert(KAMN.achievements, {
  id = "DISCOVER_DARKSHORE",
  name = "Zone: Darkshore",
  description = "Explore all key areas in Darkshore.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
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
  continent = "Kalimdor",
  zonegroup = "Darkshore",
})

-- 🧭 Meta: Ashenvale Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_ASHENVALE",
  name = "Zone: Ashenvale",
  description = "Discover all key locations in Ashenvale.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Kalimdor",
  zonegroup = "Ashenvale",
  
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_ZORAMSTRAND",
    "DISCOVER_SILVERWINDREFUGE",
    "DISCOVER_LAKEFALATHIM",
    "DISCOVER_THISTLEFURVILLAGE",
    "DISCOVER_ASTRANAAR",
    "DISCOVER_HOWLINGVALE",
    "DISCOVER_FALLENSKYSLAKE",
    "DISCOVER_SATYRNAAR",
    "DISCOVER_WARSONGCAMP",
    "DISCOVER_ORENDILSRETREAT",
    "DISCOVER_THUNDERPEAK",
    "DISCOVER_MAESTRASPOST",
    "DISCOVER_SHRINEOFAESSINA",
    "DISCOVER_RUINSOFSTARDUST",
    "DISCOVER_RAYNEWOODRETREAT",
    "DISCOVER_SPLINTERTREEPOST",
    "DISCOVER_BOUGHSHADOW",
    "DISCOVER_FELFIREHILL",
  },
})

-- 🧭 Meta: Azshara Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_AZSHARA",
  name = "Zone: Azshara",
  description = "Discover all key locations in Azshara.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Kalimdor",
  zonegroup = "Azshara",
  
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_GALLYWIXPALACE",
    "DISCOVER_BILGEWATERHARBOR",
    "DISCOVER_TOWEROFEldara",
    "DISCOVER_DARNASSIANBASECAMP",
    "DISCOVER_BEARSHEAD",
    "DISCOVER_ORGRIMMARREARGATE",
    "DISCOVER_SOUTHRIDGEBEACH",
    "DISCOVER_LAKEMENNAR",
    "DISCOVER_STORMCLIFFS",
    "DISCOVER_SHATTEREDSTRAND",
    "DISCOVER_BITTERREACHES",
    "DISCOVER_ARKKORAN",
    "DISCOVER_SECRETLAB",
    "DISCOVER_BLACKMAWHOLD",
    "DISCOVER_ELDARATH",
    "DISCOVER_RAVENCRESTMONUMENT",
    "DISCOVER_RUINEDREACHES",
  },
})
-- 🧭 Meta: Desolace Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_DESOLACE",
  name = "Zone: Desolace",
  description = "Discover all key locations in Desolace.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Kalimdor",
  zonegroup = "Desolace",
  
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_TETHRISARAN",
    "DISCOVER_NIJELSPOINT",
    "DISCOVER_THUNDERAXE",
    "DISCOVER_MAGRAM",
    "DISCOVER_VALLEYSPEARS",
    "DISCOVER_SHADOWPREY",
    "DISCOVER_MANNOROC",
    "DISCOVER_SHADOWBREAK",
    "DISCOVER_THARGADS",
    "DISCOVER_SARGERON",
    "DISCOVER_CENARIONWILD",
    "DISCOVER_RANAZJARISLE",
    "DISCOVER_KODOGRAVEYARD",
    "DISCOVER_GELKIS",
    "DISCOVER_SHOKTHOKAR",
    "DISCOVER_SLITHERBLADE",
  },
})
-- 🧭 Meta: Dustwallow Marsh Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_DUSTWALLOWMARSH",
  name = "Zone: Dustwallow Marsh",
  description = "Discover all key locations in Dustwallow Marsh.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Kalimdor",
  zonegroup = "Dustwallow Marsh",
  
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_THERAMORE",
    "DISCOVER_DIREHORNPOST",
    "DISCOVER_SHADYRESTINN",
    "DISCOVER_BRACKENWALL",
    "DISCOVER_ALCAZISLAND",
    "DISCOVER_BLACKHOOFVILLAGE",
    "DISCOVER_MUDSPROCKET",
    "DISCOVER_DREADMURKSHORE",
    "DISCOVER_WYRMRBOG",
  },
})


-- 🧭 Meta: Feralas Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_FERALAS",
  name = "Zone: Feralas",
  description = "Discover all key locations in Feralas.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Kalimdor",
  zonegroup = "Feralas",
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_GRIMTOTEMCOMPOUND",
    "DISCOVER_WRITHINGDEEP",
    "DISCOVER_DREAMBOUGH",
    "DISCOVER_ISILDIEN",
    "DISCOVER_LOWERWILDS",
    "DISCOVER_RAVENWIND",
    "DISCOVER_FRAYFEATHER",
    "DISCOVER_SARDORISLE",
    "DISCOVER_DIREMAUL",
    "DISCOVER_FERALSCARVALE",
    "DISCOVER_FORGOTTENCOAST",
    "DISCOVER_ISLEOFDREAD",
    "DISCOVER_CAMPMOJACHE",
    "DISCOVER_ONEIROS",
    "DISCOVER_GORDUNNI",
    "DISCOVER_TWINCOLOSSALS"
  },
})

-- 🧭 Meta: Stonetalon Mountains Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_STONETALONMOUNTAINS",
  name = "Zone: Stonetalon Mountains",
  description = "Discover all key locations in Stonetalon Mountains.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Kalimdor",
  zonegroup = "Stonetalon Mountains",
  
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_BATTLESCARVALLEY",
    "DISCOVER_ELDRETHAR",
    "DISCOVER_UNEARTHEDGROUNDS",
    "DISCOVER_WINDSHEARHOLD",
    "DISCOVER_MALAKAJIN",
    "DISCOVER_BOULDER",
    "DISCOVER_WINDSHEARCRAG",
    "DISCOVER_CHARREDVALE",
    "DISCOVER_STONETALONPEAK",
    "DISCOVER_KROMGAR",
    "DISCOVER_THALDARAH",
    "DISCOVER_WEBWINDERHOLLOW",
    "DISCOVER_CLIFFWALKER",
    "DISCOVER_WEBWINDERPATH",
    "DISCOVER_GREATWOODVALE",
    "DISCOVER_SUNROCKRETREAT",
    "DISCOVER_MIRKFALLON",
  },
})

-- 🧭 Meta: Tanaris Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_TANARIS",
  name = "Zone: Tanaris",
  description = "Discover all key locations in Tanaris.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Kalimdor",
  zonegroup = "Tanaris",
  
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_GADGETZAN",
    "DISCOVER_VALLEYWATCHERS",
    "DISCOVER_ABYSSALSANDS",
    "DISCOVER_NOXIOUSLAIR",
    "DISCOVER_SOUTHBREAKSHORE",
    "DISCOVER_EASTMOONRUINS",
    "DISCOVER_SOUTHMOONRUINS",
    "DISCOVER_ZULFARRAK",
    "DISCOVER_SANDSORROW",
    "DISCOVER_LOSTRIGGERCOVE",
    "DISCOVER_BROKENPILLAR",
    "DISCOVER_DUNEMAUL",
    "DISCOVER_GAPINGCHASM",
    "DISCOVER_LANDSEND",
    "DISCOVER_THISTLESHRUB",
    "DISCOVER_CAVERNSTIME",
  },
})

-- 🧭 Meta: Thousand Needles Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_THOUSANDNEEDLES",
  name = "Zone: Thousand Needles",
  description = "Discover all key locations in Thousand Needles.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Kalimdor",
  zonegroup = "Thousand Needles",
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_DARKCLOUDPINNACLE",
    "DISCOVER_SPLITHOOFCRAG",
    "DISCOVER_GREATLIFT",
    "DISCOVER_SHIMMERINGFLATS",
    "DISCOVER_FREEWINDPOST",
    "DISCOVER_SCREECHINGCANYON",
    "DISCOVER_HIGHPERCH",
    "DISCOVER_WINDBREAKCANYON",
    "DISCOVER_CAMPETHOK"
  },
})


-- 🧭 Meta: Un'Goro Crater Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_UNGOROCRATER",
  name = "Zone: Un'Goro Crater",
  description = "Discover all key locations in Un'Goro Crater.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Kalimdor",
  zonegroup = "Un'Goro Crater",
  
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_FIREPLUMERIDGE",
    "DISCOVER_MARSHALSSTAND",
    "DISCOVER_ROILINGGARDENS",
    "DISCOVER_GOLAKKAHOTSPRINGS",
    "DISCOVER_SLITHERINGSCAR",
    "DISCOVER_IRONSTONEPLATEAU",
    "DISCOVER_FUNGALROCK",
    "DISCOVER_MOSSYPILE",
    "DISCOVER_SCREAMINGREACHES",
    "DISCOVER_TERRORRUN",
    "DISCOVER_MARSHLANDS",
    "DISCOVER_LAKKARITARPITS",
  },
})

-- 🧭 Meta: Winterspring Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_WINTERSPRING",
  name = "Zone: Winterspring",
  description = "Discover all key locations in Winterspring.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Kalimdor",
  zonegroup = "Winterspring",
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_STARFALLVILLAGE",
    "DISCOVER_ICETHISTLEHILLS",
    "DISCOVER_DARKWHISPERGORGE",
    "DISCOVER_TIMBERMAWPOST",
    "DISCOVER_WINTERFALLVILLAGE",
    "DISCOVER_HIDDENGROVE",
    "DISCOVER_EVERLOOK",
    "DISCOVER_LAKEKELTHERIL",
    "DISCOVER_OWLWINGTHICKET",
    "DISCOVER_FROSTFIREHOTSPRINGS",
    "DISCOVER_FROSTWHISPERGORGE",
    "DISCOVER_FROSTSABERROCK",
    "DISCOVER_MAZTHORIL"
  },
})

-- 🧭 Meta: Arathi Highlands Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_ARATHI",
  name = "Zone: Arathi Highlands",
  description = "Discover all key locations in Arathi Highlands.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Eastern Kingdoms",
  zonegroup = "Arathi Highlands",
  
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_INNERBINDING", "DISCOVER_WITHERBARK", "DISCOVER_DABYRIE", "DISCOVER_THORADINWALL",
    "DISCOVER_BOULDERGOR", "DISCOVER_FALDIR", "DISCOVER_WESTBINDING", "DISCOVER_STROMGARDE",
    "DISCOVER_THANDOLSPAN", "DISCOVER_GOSHEK", "DISCOVER_OUTERBINDING", "DISCOVER_BOULDERFIST",
    "DISCOVER_HAMMERFALL", "DISCOVER_REFUGE", "DISCOVER_NORTHFOLD", "DISCOVER_EASTBINDING"
  },
})

-- 🧭 Meta: Badlands Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_BADLANDS",
  name = "Zone: Badlands",
  description = "Discover all key locations in Badlands.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Eastern Kingdoms",
  zonegroup = "Badlands",
  
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_LETHLOR",
    "DISCOVER_CAMPCAGG",
    "DISCOVER_AGMOND",
    "DISCOVER_DUSTBOWL",
    "DISCOVER_MAKERS",
    "DISCOVER_HAMMERTOE",
    "DISCOVER_KARGATH",
    "DISCOVER_ANGOR",
    "DISCOVER_DUSTWIND",
    "DISCOVER_APOCRYPHAN",
    "DISCOVER_VALLEYOFFANGS",
    "DISCOVER_CAMPKOSH",
    "DISCOVER_CAMPBOFF"
  },
})
-- 🧭 Meta: Blasted Lands Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_BLASTEDLANDS",
  name = "Zone: Blasted Lands",
  description = "Discover all key locations in Blasted Lands.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Eastern Kingdoms",
  zonegroup = "Blasted Lands",
  
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_DEFILERRISE",
    "DISCOVER_NETHERGARDE",
    "DISCOVER_SERPENTSCOIL",
    "DISCOVER_DREADMAULPOST",
    "DISCOVER_TAINTEDSCAR",
    "DISCOVER_ALTAROFSTORMS_BL",
    "DISCOVER_DREADMAULHOLD",
    "DISCOVER_DARKPORTAL",
    "DISCOVER_GARRISON"
  },
})


-- 🧭 Meta: Burning Steppes Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_BURNINGSTEPPES",
  name = "Zone: Burning Steppes",
  description = "Discover all key locations in Burning Steppes.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Eastern Kingdoms",
  zonegroup = "Burning Steppes",
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_DRACODAR", "DISCOVER_PILLAROFASH", "DISCOVER_BLACKROCKMOUNTAIN",
    "DISCOVER_THAURISSAN", "DISCOVER_MORGANSVIGIL", "DISCOVER_BLACKROCKPASS",
    "DISCOVER_ALTARSTORMS", "DISCOVER_TERRORWING", "DISCOVER_DREADMAULROCK",
    "DISCOVER_BLACKROCKSTRONGHOLD"
  },
})


-- 🧭 Meta: Alterac Mountains Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_ALTERAC",
  name = "Zone: Alterac Mountains",
  description = "Discover all key locations in Alterac Mountains.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Eastern Kingdoms",
  zonegroup = "Alterac Mountains",
  
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_RUINSOFALTERAC",
    "DISCOVER_MISTYSHORE",
    "DISCOVER_LORDAMERE",
    "DISCOVER_CRUSHRIDGE",
    "DISCOVER_SOFERAS",
    "DISCOVER_DALARANCRATER",
    "DISCOVER_GAVINS",
    "DISCOVER_UPLANDS",
    "DISCOVER_CHILLWIND",
    "DISCOVER_GALLOWS",
    "DISCOVER_STRAHNBRAD",
    "DISCOVER_GROWLESS",
    "DISCOVER_CORRAHNS",
    "DISCOVER_DANDREDS",
    "DISCOVER_HEADLAND"
  },
})

-- 🧭 Meta: Deadwind Pass Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_DEADWINDPASS",
  name = "Zone: Deadwind Pass",
  description = "Discover all key locations in Deadwind Pass.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Eastern Kingdoms",
  zonegroup = "Deadwind Pass",
 
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_DEADMANSCROSSING",
    "DISCOVER_KARAZHAN",
    "DISCOVER_THEVICE",
  },
})

-- 🧭 Meta: Duskwood Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_DUSKWOOD",
  name = "Zone: Duskwood",
  description = "Discover all key locations in Duskwood.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Eastern Kingdoms",
  zonegroup = "Duskwood",
  
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_TWILIGHTGROVE",
    "DISCOVER_DARKSHIRE",
    "DISCOVER_VULGOL",
    "DISCOVER_BRIGHTWOOD",
    "DISCOVER_DARKENEDBANK",
    "DISCOVER_RAVENHILL",
    "DISCOVER_ROTTINGORCHARD",
    "DISCOVER_MISTMANTLE",
    "DISCOVER_HUSHEDBANK",
    "DISCOVER_YORGEN",
    "DISCOVER_CEMETERY",
    "DISCOVER_ADDLESSTEAD",
    "DISCOVER_HILLCEMETERY"
  },
})


-- 🧭 Meta: Eastern Plaguelands Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_EPLAGUELANDS",
  name = "Zone: Eastern Plaguelands",
  description = "Discover all key locations in Eastern Plaguelands.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Eastern Kingdoms",
  zonegroup = "Eastern Plaguelands",
  
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_THONDRORILRIVER",
    "DISCOVER_UNDERCROFT",
    "DISCOVER_FUNGALVALE",
    "DISCOVER_PESTILENTSCAR",
    "DISCOVER_LAKEMERELDAR",
    "DISCOVER_LIGHTSHOPE",
    "DISCOVER_NOXIOUSGLADE",
    "DISCOVER_BLACKWOODLAKE",
    "DISCOVER_ZULMASHAR",
    "DISCOVER_QUELLITHIENLODGE",
    "DISCOVER_PLAGUEWOOD",
    "DISCOVER_SCARLETENCLAVE",
    "DISCOVER_MARRISSTEAD",
    "DISCOVER_CROWNGUARDTOWER",
    "DISCOVER_DARROWSHIRE",
    "DISCOVER_CORINSCROSSING",
    "DISCOVER_TYRSHAND",
    "DISCOVER_INFECTISSCAR",
    "DISCOVER_EASTWALLTOWER",
    "DISCOVER_NORTHDALE",
    "DISCOVER_NORTHPASSTOWER",
    "DISCOVER_TERRORDALE",
    "DISCOVER_STRATHOLME",
  },
})

-- 🧭 Meta: Hillsbrad Foothills Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_HILLSBRAD",
  name = "Zone: Hillsbrad Foothills",
  description = "Discover all key locations in Hillsbrad Foothills.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Eastern Kingdoms",
  zonegroup = "Hillsbrad Foothills",
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_SOUTHSHORE", "DISCOVER_FIELDS", "DISCOVER_AZURELODE",
    "DISCOVER_TARRENMILL", "DISCOVER_NETHANDER", "DISCOVER_WESTERNSTRAND",
    "DISCOVER_DUNGAROK", "DISCOVER_PURGATION", "DISCOVER_DARROWHILL",
    "DISCOVER_DURNHOLDE", "DISCOVER_EASTERNSTRAND", "DISCOVER_SOUTHPOINT"
  },
})

-- 🧭 Meta: The Hinterlands Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_HINTERLANDS",
  name = "Zone: The Hinterlands",
  description = "Discover all key locations in The Hinterlands.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Eastern Kingdoms",
  zonegroup = "The Hinterlands",  
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_AERIEPEAK",
    "DISCOVER_ZUNWATHA",
    "DISCOVER_SHADRAALOR",
    "DISCOVER_AGOLWATHA",
    "DISCOVER_ALTAROZUL",
    "DISCOVER_SKULKROCK",
    "DISCOVER_JINTHAALOR",
    "DISCOVER_PLAGUEMISTRAVINE",
    "DISCOVER_QUELDANILLODGE",
    "DISCOVER_VALORWINDLAKE",
    "DISCOVER_CREEPINGRUIN",
    "DISCOVER_SERADANE",
    "DISCOVER_SHAOLWATHA",
    "DISCOVER_OVERLOOKCLIFFS",
  },
})

-- 🧭 Meta: Redridge Mountains Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_REDRIDGE",
  name = "Zone: Redridge Mountains",
  description = "Discover all key locations in Redridge Mountains.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Eastern Kingdoms",
  zonegroup = "Redridge Mountains",
  
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_LAKEEVERSTILL", "DISCOVER_STONEWATCHFALLS", "DISCOVER_LAKESHIRE",
    "DISCOVER_RENDERSCAMP", "DISCOVER_LAKERIDGE", "DISCOVER_RENDERSVALLEY",
    "DISCOVER_GALARDELL", "DISCOVER_STONEWATCH", "DISCOVER_THREECORNERS",
    "DISCOVER_ALTHERSMILL", "DISCOVER_CANYONS"
  },
})


-- 🧭 Meta: Searing Gorge Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_SEARINGGORGE",
  name = "Zone: Searing Gorge",
  description = "Discover all key locations in Searing Gorge.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Eastern Kingdoms",
  zonegroup = "Searing Gorge",
 
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_FIREWATCHRIDGE",
    "DISCOVER_BLACKCHARCAVE",
    "DISCOVER_GRIMESILTDIGSITE",
    "DISCOVER_THORIUMPOINT",
    "DISCOVER_THECAULDRON",
    "DISCOVER_SEAOFCINDERS",
    "DISCOVER_DUSTFIREVALLEY",
    "DISCOVER_BLACKROCKMOUNTAIN",
  },
})

-- 🧭 Meta: Silverpine Forest Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_SILVERPINEFOREST",
  name = "Zone: Silverpine Forest",
  description = "Discover all key locations in Silverpine Forest.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Eastern Kingdoms",
  zonegroup = "Silverpine Forest",
 
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_NORTHTIDESHOLLOW",
    "DISCOVER_DEEPELEMMINE",
    "DISCOVER_MALDENSORCHARD",
    "DISCOVER_DECREPITFERRY",
    "DISCOVER_OLSENSFARTHING",
    "DISCOVER_PYREWOODVILLAGE",
    "DISCOVER_FENRISISLE",
    "DISCOVER_BERENSPERIL",
    "DISCOVER_DEADFIELD",
    "DISCOVER_GREYMANEWALL",
    "DISCOVER_SHININGSTRAND",
    "DISCOVER_THESEPULCHER",
    "DISCOVER_AMBERMILL",
    "DISCOVER_SKITTERINGDARK",
    "DISCOVER_SHADOWFANGKEEP",
  },
})
-- 🧭 Meta: Swamp of Sorrows Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_SWAMPOFSORROWS",
  name = "Zone: Swamp of Sorrows",
  description = "Discover all key locations in Swamp of Sorrows.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Eastern Kingdoms",
  zonegroup = "Swamp of Sorrows",
  
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_STAGALBOG",
    "DISCOVER_MISTYVALLEY",
    "DISCOVER_SPLINTERSPEARJUNCTION",
    "DISCOVER_FALLOWSANCTUARY",
    "DISCOVER_STONARD",
    "DISCOVER_MISTYREEDSTRAND",
    "DISCOVER_SHIFTINGMIRE",
    "DISCOVER_THEHARBORAGE",
    "DISCOVER_POOLOFTEARS",
    "DISCOVER_ITHARIUSSCAVE",
    "DISCOVER_SORROWMURK",
  },
})
-- 🧭 Meta: Western Plaguelands Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_WESTERNPLAGUELANDS",
  name = "Zone: Western Plaguelands",
  description = "Discover all key locations in Western Plaguelands.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Eastern Kingdoms",
  zonegroup = "Western Plaguelands",
  
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_SORROWHILL",
    "DISCOVER_NORTHRIDGELUMBER",
    "DISCOVER_GAHRRONSWITHERING",
    "DISCOVER_DARROWMERELAKE",
    "DISCOVER_WRITHINGHAUNT",
    "DISCOVER_WEEPINGCAVE",
    "DISCOVER_BULWARK",
    "DISCOVER_THONDRORILRIVER_WPL",
    "DISCOVER_DALSONSTEARS",
    "DISCOVER_ANDORHAL",
    "DISCOVER_CAERDARROW",
    "DISCOVER_FELSTONEFIELD",
    "DISCOVER_HEARTHGLEN",
  },
})

-- 🧭 Meta: Wetlands Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_WETLANDS",
  name = "Zone: Wetlands",
  description = "Discover all key locations in Wetlands.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Eastern Kingdoms",
  zonegroup = "Wetlands",
  
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_SALTSPRAY", "DISCOVER_RAPTORRIDGE", "DISCOVER_BLACKCHANNEL",
    "DISCOVER_DUNMODR", "DISCOVER_GREENBELT", "DISCOVER_BLUEGILL",
    "DISCOVER_GRIMBATOL", "DISCOVER_DIREFORGE", "DISCOVER_IRONBEARDS",
    "DISCOVER_WHELGAR", "DISCOVER_SUNDOWN", "DISCOVER_DUNALGAZ",
    "DISCOVER_MOSSHIDE", "DISCOVER_ANGERFANG", "DISCOVER_MENETHIL"
  },
})

-- 🧭 Meta: Stranglethorn Vale Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_STRANGLETHORN",
  name = "Zone: Stranglethorn Vale",
  description = "Discover all key locations in Stranglethorn Vale.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Eastern Kingdoms",
  zonegroup = "Stranglethorn Vale",
  
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_ZUULDAIA", "DISCOVER_JUBUWAL", "DISCOVER_NEKMANI", "DISCOVER_ZIATAJAI",
    "DISCOVER_ZULKUNDA", "DISCOVER_REBELCAMP", "DISCOVER_CRYSTALVEIN", "DISCOVER_LAKENAZFERITI",
    "DISCOVER_VILEREEF", "DISCOVER_VENTURECO", "DISCOVER_BALIAMAH", "DISCOVER_JAGUERO",
    "DISCOVER_ZULMAMWE", "DISCOVER_BOOTYBAY", "DISCOVER_MOSHOGG", "DISCOVER_MISTVALE",
    "DISCOVER_WILDSHORE", "DISCOVER_GROMGOL", "DISCOVER_GURUBASHI", "DISCOVER_NESINGWARY",
    "DISCOVER_KURZEN", "DISCOVER_ZULGURUB", "DISCOVER_BALLAL", "DISCOVER_MIZJAH",
    "DISCOVER_ABORAZ", "DISCOVER_KALAI", "DISCOVER_BLOODSAIL"
  },
})


-- 🧭 Meta: Felwood Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_FELWOOD",
  name = "Zone: Felwood",
  description = "Discover all key locations in Felwood.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Kalimdor",
  zonegroup = "Felwood",
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_BLOODVENOMFALLS",
    "DISCOVER_JAEDENAR",
    "DISCOVER_DEADWOODVILLAGE",
    "DISCOVER_IRONTREEWOODS",
    "DISCOVER_FELPAWVILLAGE",
    "DISCOVER_SHATTERSCARVALE",
    "DISCOVER_JADEFIRERUN",
    "DISCOVER_EMERALDSANCTUARY",
    "DISCOVER_MORLOSARAN",
    "DISCOVER_CONSTELLAS",
    "DISCOVER_TALONBRANCHGLADE",
    "DISCOVER_JADEFIREGLEN"
  },
})

-- 🧭 Meta: Silithus Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_SILITHUS",
  name = "Zone: Silithus",
  description = "Discover all key locations in Silithus.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Kalimdor",
  zonegroup = "Silithus",
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_CRYSTALVALE",
    "DISCOVER_SCARABWALL",
    "DISCOVER_HIVEZORA",
    "DISCOVER_CENARIONHOLD",
    "DISCOVER_STAGHELMSPOINT",
    "DISCOVER_HIVEREGAL",
    "DISCOVER_VALORSREST"
  },
})
