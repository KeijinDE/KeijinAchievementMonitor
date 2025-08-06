-- achievements_exploration_turtle_meta.lua



-- 🧭 Meta: Blackstone Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_BLACKSTONE",
  name = "Blackstone Explorer",
  description = "Discover all key locations in Blackstone Isle.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_BLACKASHCOALPITS",
    "DISCOVER_BLACKASHMINE",
    "DISCOVER_GAZZIKWORKSHOP",
    "DISCOVER_RUSTGATELUMBER",
    "DISCOVER_RUSTGATERIDGE",
    "DISCOVER_VENTURESLUMS",
    "DISCOVER_WATERHOLE",
  },
    continent = "Kalimdor",
  zonegroup = "Blackstone Isle",
})


-- 🧭 Meta: Thalassian Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_THALASSIAN",
  name = "Thalassian Explorer",
  description = "Discover all key locations in the Thalassian Highlands.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
   progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_ALAHTHALAS",
    "DISCOVER_ANASTERIANPARK",
    "DISCOVER_BALLADORSCHAPEL",
    "DISCOVER_BRINTHILIEN",
    "DISCOVER_FARSTRIDE",
    "DISCOVER_FELSTRIDERRETREAT",
    "DISCOVER_ETERNALAUTUMN",
    "DISCOVER_LASTRUNESTONE",
    "DISCOVER_NASHALARAN",
    "DISCOVER_SCOURGEDPASS",
    "DISCOVER_SILVERCOVENANT",
    "DISCOVER_SILVERSUNMINE",
    "DISCOVER_THAUMARIUM",
  },
    continent = "Eastern Kingdoms",
  zonegroup = "Thalassian Highlands",
})
-- 🧭 Meta: Balor Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_BALOR",
  name = "Zone: Balor",
  description = "Discover all key locations in Balor.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Eastern Kingdoms",
  zonegroup = "Balor",
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_BILGERATCOMPOUND",
    "DISCOVER_RUINSOFBREEZEHAVEN",
    "DISCOVER_SI7OUTPOST",
    "DISCOVER_SORROWMORELAKE",
    "DISCOVER_STORMBREAKERPOINT",
    "DISCOVER_STORMWROUGHTCASTLE"
  },
})

-- 🧭 Meta: Gilneas Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_GILNEAS",
  name = "Zone: Gilneas",
  description = "Discover all key locations in Gilneas.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Eastern Kingdoms",
  zonegroup = "Gilneas",
  progress = 0,
  complete = false,
  points = 10,
 requires = {
  "DISCOVER_BLACKTHORNSCAMP",
  "DISCOVER_BROLOKMOUND",
  "DISCOVER_DAWNSTONEMINE",
  "DISCOVER_THEDRYROCKMINE",
  "DISCOVER_DRYROCKVALLEY",
  "DISCOVER_EBONMEREFARM",
  "DISCOVER_FREYSHEARKEEP",
  "DISCOVER_GILNEASCITY",
  "DISCOVER_GLAYMORESTEAD",
  "DISCOVER_THEGREYMANEWALL",
  "DISCOVER_GREYMANESWATCH",
  "DISCOVER_HOLLOWWEBCEMETARY",
  "DISCOVER_HOLLOWWEBWOODS",
  "DISCOVER_MOSSGROVEFARM",
  "DISCOVER_NORTHGATETOWER",
  "DISCOVER_OLDROCKPASS",
  "DISCOVER_THEOVERGROWNACRE",
  "DISCOVER_RAVENSHIRE",
  "DISCOVER_RAVENWOODKEEP",
  "DISCOVER_ROSEWICKPLANTATION",
  "DISCOVER_RUINSOFGREYSHIRE",
  "DISCOVER_SHADEMORETAVERN",
  "DISCOVER_SOUTHMIREORCHARD",
  "DISCOVER_STILLWARDCHURCH",
  "DISCOVER_VAGRANTENCAMPMENT",
  "DISCOVER_WESTGATETOWER"
}

})
-- 🧭 Meta: Northwind Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_NORTHWIND",
  name = "Zone: Northwind",
  description = "Discover all key locations in Northwind.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Eastern Kingdoms",
  zonegroup = "Northwind",
  progress = 0,
  complete = false,
  points = 10,
requires = {
  "DISCOVER_ABBEYGARDENS",
  "DISCOVER_AMBERSHIRE",
  "DISCOVER_CRYSTALFALLS",
  "DISCOVER_NORTHWINDLOGGINGCAMP",
  "DISCOVER_RUINSOFBIRKHAVEN",
  "DISCOVER_SHERWOODQUARRY",
  "DISCOVER_STILLHEARTPORT"
}

})
-- 🧭 Meta: Lapidis Isle Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_LAPIDISISLE",
  name = "Zone: Lapidis Isle",
  description = "Discover all key locations in Lapidis Isle.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Eastern Kingdoms",
  zonegroup = "Lapidis Isle",
  progress = 0,
  complete = false,
  points = 10,
requires = {
  "DISCOVER_BRIGHTCOAST",
  "DISCOVER_CAELANSREST",
  "DISCOVER_CROWNISLAND",
  "DISCOVER_GORDOSHHEIGHTS",
  "DISCOVER_HAZZURIGLADE",
  "DISCOVER_THEROCK",
  "DISCOVER_SHANKSREEF",
  "DISCOVER_TOWEROFLAPIDIS",
  "DISCOVER_WALLOWINGCOAST",
  "DISCOVER_ZULHAZU"
}

})
-- 🧭 Meta: Gillijim's Isle Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_GILLIJIMSISLE",
  name = "Zone: Gillijim's Isle",
  description = "Discover all key locations in Gillijim's Isle.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Eastern Kingdoms",
  zonegroup = "Gillijim's Isle",
  progress = 0,
  complete = false,
  points = 10,
requires = {
  "DISCOVER_THEBROKENREEF",
  "DISCOVER_DEEPTIDESANCTUM",
  "DISCOVER_DISTILLERYISLAND",
  "DISCOVER_FAELONSFOLLY",
  "DISCOVER_GILLIJIMCANYON",
  "DISCOVER_GILLIJIMSTRAND",
  "DISCOVER_KALKORPOINT",
  "DISCOVER_KAZONISLAND",
  "DISCOVER_MAULOGGPOST",
  "DISCOVER_MAULOGGREFUGE",
  "DISCOVER_RUINSOFZULRAZAR",
  "DISCOVER_THESILVERCOAST",
  "DISCOVER_THESILVERSANDBAR",
  "DISCOVER_SOUTHSEASANDBAR",
  "DISCOVER_THETANGLEDWOOD",
  "DISCOVER_ZULRAZAR"
}

})
-- 🧭 Meta: Scarlet Enclave Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_SCARLETENCLAVE",
  name = "Zone: Scarlet Enclave",
  description = "Discover all key locations in Scarlet Enclave.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Eastern Kingdoms",
  zonegroup = "Scarlet Enclave",
  progress = 0,
  complete = false,
  points = 10,
requires = {
  "DISCOVER_THEFORBIDDINGSEA",
  "DISCOVER_GLOOMHILL",
  "DISCOVER_HAVENSHIRE",
  "DISCOVER_KINGSHARBOR",
  "DISCOVER_LIGHTSPOINT",
  "DISCOVER_NEWAVALON"
}

})
-- 🧭 Meta: Grim Reaches Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_GRIMREACHES",
  name = "Zone: Grim Reaches",
  description = "Discover all key locations in Grim Reaches.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Eastern Kingdoms",
  zonegroup = "Grim Reaches",
  progress = 0,
  complete = false,
  points = 10,
requires = {
  "DISCOVER_DUNKITHAS",
  "DISCOVER_THEGRIMHOLLOW",
  "DISCOVER_RUINSOFSTOLGAZKEEP",
  "DISCOVER_SHATTERBLADEPOST",
  "DISCOVER_ZARMGETHSTRONGHOLD"
}

})
-- 🧭 Meta: Tel'Abim Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_TELABIM",
  name = "Zone: Tel'Abim",
  description = "Discover all key locations in Tel'Abim.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Kalimdor",
  zonegroup = "Tel'Abim",
  progress = 0,
  complete = false,
  points = 10,
requires = {
  "DISCOVER_BIXXLESSTOREHOUSE",
  "DISCOVER_THEDERELICTCAMP",
  "DISCOVER_HIGHVALERISE",
  "DISCOVER_THEJAGGEDISLES",
  "DISCOVER_THESHALLOWSTRAND",
  "DISCOVER_TAZZOSSHACK",
  "DISCOVER_TELCOBASECAMP",
  "DISCOVER_THEWASHINGSHORE"
}

})

-- 🧭 Meta: Hyjal Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_HYJAL",
  name = "Zone: Hyjal",
  description = "Discover all key locations in Hyjal.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Kalimdor",
  zonegroup = "Hyjal",
  progress = 0,
  complete = false,
  points = 10,
requires = {
  "DISCOVER_BARKSKINPLATEAU",
  "DISCOVER_BARKSKINVILLAGE",
  "DISCOVER_BLEAKHOLLOWCRATER",
  "DISCOVER_CIRCLEOFPOWER",
  "DISCOVER_DARKHOLLOWPASS",
  "DISCOVER_THEEMERALDGATEWAY",
  "DISCOVER_NORDANAAR",
  "DISCOVER_NORDRASSILGLADE",
  "DISCOVER_THERUINSOFTELENNAS",
  "DISCOVER_ZULHATHAR"
}

})
-- 🧭 Meta: Icepoint Rock Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_ICEPOINTROCK",
  name = "Zone: Icepoint Rock",
  description = "Discover all key locations in Icepoint Rock.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Kalimdor",
  zonegroup = "Icepoint Rock",
  progress = 0,
  complete = false,
  points = 10,
  requires = {
    "DISCOVER_FLAXWHISKERBASECAMP"
  },
})

-- 🧭 Meta: Tirisfal Uplands Explorer
table.insert(KAMN.achievements, {
  id = "DISCOVER_TIRISFALUPLANDS",
  name = "Zone: Tirisfal Uplands",
  description = "Discover all key locations in Tirisfal Uplands.",
  type = "meta",
  category = "Exploration",
  subcategory = "Exploration",
  continent = "Eastern Kingdoms",
  zonegroup = "Tirisfal Uplands",
  progress = 0,
  complete = false,
  points = 10,
requires = {
  "DISCOVER_THEBLACKTOWERINN",
  "DISCOVER_THECORINTHFARMSTEAD",
  "DISCOVER_CRUMBLEPOINTTOWER",
  "DISCOVER_GLENSHIRE",
  "DISCOVER_GRACESTONEMINE",
  "DISCOVER_ISHNUDANIL",
  "DISCOVER_THEJAGGEDHILLS",
  "DISCOVER_THELAFFORDHOUSE",
  "DISCOVER_THEREMNANTSCAMP",
  "DISCOVER_THEROGUEHEIGHTS",
  "DISCOVER_SHALLAARAN",
  "DISCOVER_STEEPCLIFFPORT",
  "DISCOVER_SHATTERIDGETOWER",
  "DISCOVER_THEWHISPERINGFOREST"
}

})
-- 🧭 Meta: New & Revamped Locations
table.insert(KAMN.achievements, {
  id = "DISCOVER_TURTLE_REWORKED",
  name = "Explore TurtleWoW",
  description = "Discover the new and reimagined subzones introduced on Turtle WoW.",
  type = "meta",
  category = "Meta",
  subcategory = "Exploration",
  continent = "Azeroth",
  zonegroup = "Azeroth",
  progress = 0,
  complete = false,
  points = 10,
requires = {
  -- Dun Morogh
  "DISCOVER_GNOMEREGANRECLAMATIONFACILITY",
  "DISCOVER_IRONFORGEAIRFIELD",

  -- Durotar
  "DISCOVER_SPARKKWATERPORT",

  -- Mulgore
  "DISCOVER_REDCLOUDROOST",
  "DISCOVER_SUNTAILPASS",

  -- Stormwind
  "DISCOVER_LITTLESILVERMOON",
  "DISCOVER_DAVENBURG",

  -- The Barrens
  "DISCOVER_ANCHORSEDGE",

  -- Stonetalon Mountains
  "DISCOVER_AMANIALOR",
  "DISCOVER_BRAMBLETHORNPASS",
  "DISCOVER_POWDERTOWN",
  "DISCOVER_BLACKSANDOILFIELDS",
  "DISCOVER_BAELHARDUL",
  "DISCOVER_VENTURECAMP",
  "DISCOVER_BROKENCLIFFMINE",

  -- Ashenvale
  "DISCOVER_FORESTSONG",
  "DISCOVER_THALANAAR",
  "DISCOVER_TALONBRANCHGLADE",
  "DISCOVER_DEMONFALLRIDGE",
  "DISCOVER_WARSONGLUMBERCAMP",

  -- Wetlands
  "DISCOVER_DUNAGRATH",
  "DISCOVER_HAWKSVIGIL",
  "DISCOVER_GREENBELTGNOLLCAMP",

  -- Arathi Highlands
  "DISCOVER_WILDTUSKVILLAGE",
  "DISCOVER_RUINSOFZULRASAZ",
  "DISCOVER_FARWELLSTEAD",
  "DISCOVER_GALLANTSQUARE",
  "DISCOVER_LIVINGSTONECROFT",

  -- Swamp of Sorrows
  "DISCOVER_SORROWGUARDKEEP",

  -- Badlands
  "DISCOVER_RUINSOFCORTHAN",
  "DISCOVER_SCALEBANERIDGE",
  "DISCOVER_CRYSTALLINEOASIS",
  "DISCOVER_CRYSTALLINEPINNACLE",
  "DISCOVER_REDBRANDSDIGSITE",
  "DISCOVER_ANGORDIGSITE",
  "DISCOVER_RUINSOFZETH",

  -- Dustwallow Marsh
  "DISCOVER_WESTHAVENHOLLOW",
  "DISCOVER_BLACKHORNVILLAGE",
  "DISCOVER_DESERTERSHIDEOUT",
  "DISCOVER_HERMITOFTHEEASTCOAST",

  -- Tanaris
  "DISCOVER_SANDMOONVILLAGE",

  -- Feralas
  "DISCOVER_RONAETHALAS",
  "DISCOVER_CHIMAERAROOSTVALE",

  -- Azshara
  "DISCOVER_FLAXWHISKERFRONT",
  "DISCOVER_BLOODFISTPOINT",
  "DISCOVER_RETHRESSSANCTUM",

  -- Felwood
  "DISCOVER_BLOODVENOMPOST",
  "DISCOVER_SHRINEOFTHEBETRAYER",

  -- Burning Steppes
  "DISCOVER_KARFANGHOLD",

  -- Eastern Plaguelands
  "DISCOVER_FORLORNSUMMIT"
}

})
