-- KeijinAchievementMonitorNEW – KillGroup Achievements
-- Kategorie: Combat / Typ: namedkillgroup (z. B. "Plainstrider", "Boar")
-- Kompatibel mit KAMN.achievements-Struktur

KAMN = KAMN or {}
KAMN.achievements = KAMN.achievements or {}

----------------------------------------------------------
-- Mulgore: Plainstrider-Gruppe (bereits vorhanden)
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_PLAINSTRIDER",
  name = "Plainstrider Slayer",
  description = "Defeat 25 Plainstriders at The Barrens and Mulgore.",
  type = "namedkillgroup",
  groupMatch = {
    "Plainstrider", "Adult Plainstrider", "Elder Plainstrider",
    "Ornery Plainstrider", "Greater Plainstrider", "Fleeting Plainstrider",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Durotar: Scorpid-Gruppe
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_DUROTAR_SCORPIDS",
  name = "Scorpid Scourge",
  description = "Defeat 25 scorpids and their rare kin in Durotar.",
  type = "namedkillgroup",
  groupMatch = {
    "Scorpid Worker",
    "Clattering Scorpid",
    "Venomtail Scorpid",
    "Corrupted Scorpid",
    "Death Flayer",    -- Rare Elite Scorpid
    "Sarkoth",         -- Quest-NPC, Scorpid-artig
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Elwynn Forest: Wolf-Gruppe
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_ELWYNN_WOLVES",
  name = "Wolf Watcher",
  description = "Hunt 25 wolves like Gray Forest and Timber Wolves in Elwynn Forest.",
  type = "namedkillgroup",
  groupMatch = {
    "Gray Forest Wolf",
    "Mangy Wolf",
    "Timber Wolf",
    "Young Wolf",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Dun Morogh: Wendigo-Gruppe
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_DUNMOROGH_WENDIGOS",
  name = "Wendigo Warning",
  description = "Defeat 25 Wendigo-type creatures in Dun Morogh.",
  type = "namedkillgroup",
  groupMatch = {
    "Wendigo",
    "Ice Claw Bear",         -- stimmungsvoller Zusatz
    "Frostmane Troll Whelp", -- thematisch passender Bonus
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Teldrassil: Nightsaber-Gruppe
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_TELDRASSIL_NIGHTSABER",
  name = "Night Prowlers",
  description = "Hunt 25 nightsaber-type cats in the forests of Teldrassil.",
  type = "namedkillgroup",
  groupMatch = {
    "Young Nightsaber",
    "Mangy Nightsaber",
    "Nightsaber",
    "Nightsaber Stalker",
    "Feral Nightsaber",
    "Elder Nightsaber",
    "Duskstalker", -- Rare Cat
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Tirisfal Glades: Duskbat-Gruppe
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_TIRISFAL_DUSKBATS",
  name = "Duskwing Reaper",
  description = "Defeat 25 duskbat-type creatures in Tirisfal Glades.",
  type = "namedkillgroup",
  groupMatch = {
    "Duskbat",
    "Mangy Duskbat",
    "Greater Duskbat",
    "Vampiric Duskbat",
    "Ressan the Needler", -- Rare
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

-- Boar-Gruppe
table.insert(KAMN.achievements, {
  id = "KILLGROUP_BOARS01",
  name = "Boar Basher",
  description = "Slay 100 wild boars and their kin throughout Azeroth.",
  type = "namedkillgroup",
  groupMatch = {
    "Boar", "Small Crag Boar", "Crag Boar", "Large Crag Boar", "Rockhide Boar",
    "Young Goretusk", "Goretusk", "Great Goretusk",
    "Elder Mountain Boar", "Mountain Boar", "Mangy Mountain Boar",
    "Mesa Boar", "Forest Boar", "Elder Forest Boar", "Hightusk Boar", "Ashmane Boar", "Helboar",
    "Battleboar", "Withered Battle Boar", "Battle Boar Horror",
    "Bellygrub", -- Named Boar
    "Mottled Boar", "Dire Mottled Boar", "Elder Mottled Boar", "Corrupted Mottled Boar",
    "Stonetusk Boar", "Scarred Crag Boar", "Elder Crag Boar",
    "Thistle Boar", "Young Thistle Boar", "Boar Spirit", "Bristleback Battleboar"
  },
  value = 100,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILLGROUP_BOARS02",
  name = "Boar Exterminator",
  description = "Slay 1000 wild boars and their kin throughout Azeroth.",
  type = "namedkillgroup",
  groupMatch = {
    "Boar", "Small Crag Boar", "Crag Boar", "Large Crag Boar", "Rockhide Boar",
    "Young Goretusk", "Goretusk", "Great Goretusk",
    "Elder Mountain Boar", "Mountain Boar", "Mangy Mountain Boar",
    "Mesa Boar", "Forest Boar", "Elder Forest Boar", "Hightusk Boar", "Ashmane Boar", "Helboar",
    "Battleboar", "Withered Battle Boar", "Battle Boar Horror",
    "Bellygrub", -- Named Boar
    "Mottled Boar", "Dire Mottled Boar", "Elder Mottled Boar", "Corrupted Mottled Boar",
    "Stonetusk Boar", "Scarred Crag Boar", "Elder Crag Boar",
    "Thistle Boar", "Young Thistle Boar", "Boar Spirit"
  },
  value = 1000,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 20,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILLGROUP_BOARS03",
  name = "Boaring Adventure",
  description = "They said it would be boring… they were right. Now finish it: slay 10,000 boars.",
  type = "namedkillgroup",
  groupMatch = {
    "Boar", "Small Crag Boar", "Crag Boar", "Large Crag Boar", "Rockhide Boar",
    "Young Goretusk", "Goretusk", "Great Goretusk",
    "Elder Mountain Boar", "Mountain Boar", "Mangy Mountain Boar",
    "Mesa Boar", "Forest Boar", "Elder Forest Boar", "Hightusk Boar", "Ashmane Boar", "Helboar",
    "Battleboar", "Withered Battle Boar", "Battle Boar Horror",
    "Bellygrub", -- Named Boar
    "Mottled Boar", "Dire Mottled Boar", "Elder Mottled Boar", "Corrupted Mottled Boar",
    "Stonetusk Boar", "Scarred Crag Boar", "Elder Crag Boar",
    "Thistle Boar", "Young Thistle Boar", "Boar Spirit"
  },
  value = 10000,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 25,
  requiredFor = {},
})

--  Kobold
table.insert(KAMN.achievements, {
  id = "KILLGROUP_KOBOLDS",
  name = "Kobold Clean-Up",
  description = "Defeat 25 kobold-type enemies in Elwynn and beyond.",
  type = "namedkillgroup",
  groupMatch = { "Kobold Tunneler", "Kobold Geomancer", "Kobold Laborer", "Kobold Miner", "Kobold Digger", "Kobold Worker", "Kobold Vermin" },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})



table.insert(KAMN.achievements, {
  id = "KILL_BRISTLEBACK15",
  name = "Bristleback Invasion",
  description = "Defeat 25 Bristleback Quilboars.",
  type = "namedkillgroup",
  groupMatch = { "Bristleback Quilboar"},
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_MOUNTAINCOUGAR15",
  name = "Less Cats",
  description = "Defeat 25 Mountain Cougar in Red Cloud Mesa.",
  type = "namedkillgroup",
  groupMatch = { "Mountain Cougar", "Flatland Cougar"},
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_BATTLEBOAR15",
  name = "Less Pigs",
  description = "Defeat 25 Battleboar in Red Cloud Mesa.",
  type = "namedkillgroup",
  groupMatch = { "Battleboar"},
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_VileFamiliar15",
  name = "Vile Familiar exitus",
  description = "Defeat 25 Vile Familiar in Durotar.",
  type = "namedkillgroup",
  groupMatch = { "Vile Familiar"},
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})
table.insert(KAMN.achievements, {
  id = "KILL_SARKOTH1",
  name = "Sarkoth Falls",
  description = "Defeat Sarkoth in Durotar.",
  type = "namedkillgroup",
  alttype = "elite",
  groupMatch = {"Sarkoth"},
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 10,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILLGROUP_MULGORE_WOLVES",
  name = "Wolf Hunter",
  description = "Hunt 15 wolves like Prairie Wolf in Mulgore.",
  type = "namedkillgroup",
  groupMatch = {
    "Prairie Wolf",
    "Prairie Wolf Alpha"    
  },
  value = 15,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILLGROUP_MULGORE_PALEMANE",
  name = "Palemane Purge",
  description = "Defeat 15 Palemane foes in Mulgore (Poacher, Tanner, Skinner).",
  type = "namedkillgroup",
  groupMatch = {
    "Palemane Poacher",
    "Palemane Tanner",
    "Palemane Skinner"
  },
  value = 15,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILLGROUP_ELWYNN_MURLOCS",
  name = "Lake Menace",
  description = "Defeat 25 murlocs around the lakes of Elwynn Forest.",
  type = "namedkillgroup",
  groupMatch = {
    "Murloc",             
    "Murloc Lurker",      
    "Murloc Forager",     
    "Murloc Streamrunner" 
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILLGROUP_ELWYNN_DEFIAS",
  name = "Defias Disruption",
  description = "Defeat 25 Defias around Elwynn’s roads and lakes.",
  type = "namedkillgroup",
  groupMatch = {
    
    "Defias Thug",
    "Defias Bandit",
    "Defias Cutpurse",
    "Defias Highwayman",
    
    "Defias Ambusher",    
    "Defias Bodyguard",   
    "Defias Dockmaster",  
    "Defias Dockworker",  
    "Defias Rogue Wizard" 
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILLGROUP_DUNMOROGH_TROGGS",
  name = "Rockjaw Rampage",
  description = "Defeat 15 Rockjaw troggs across Dun Morogh.",
  type = "namedkillgroup",
  groupMatch = {
    "Rockjaw Trogg",        
    "Rockjaw Skullthumper", 
    "Rockjaw Bonesnapper",  
    "Rockjaw Raider",       
    "Rockjaw Ambusher",     
    "Rockjaw Backbreaker"   
  },
  value = 15,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILLGROUP_DUNMOROGH_FROSTMANE",
  name = "Frostmane Fray",
  description = "Defeat 25 Frostmane trolls in Dun Morogh.",
  type = "namedkillgroup",
  groupMatch = {
    "Frostmane Troll Whelp", 
    "Frostmane Novice",      
    "Frostmane Troll",       
    "Frostmane Headhunter",  
    "Frostmane Shadowcaster",
    "Frostmane Seer",        
    "Frostmane Snowstrider", 
    "Frostmane Hideskinner"  
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})
-- 🕷️ Teldrassil – Webwood Spiders
table.insert(KAMN.achievements, {
  id = "KILLGROUP_TELDRASSIL_WEBWOOD",
  name = "Webwood Wipeout",
  description = "Defeat 25 Webwood spiders in Teldrassil.",
  type = "namedkillgroup",
  groupMatch = {
    "Webwood Spider",
    "Webwood Lurker",
    "Webwood Venomfang",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

-- 🧝 Teldrassil – Grells
table.insert(KAMN.achievements, {
  id = "KILLGROUP_TELDRASSIL_GRELLS",
  name = "Grell Cleanup",
  description = "Defeat 25 grells across Teldrassil.",
  type = "namedkillgroup",
  groupMatch = {
    "Grell",
    "Grellkin",
    "Vicious Grell",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

-- 🦉 Teldrassil – Strigid Owls
table.insert(KAMN.achievements, {
  id = "KILLGROUP_TELDRASSIL_OWLS",
  name = "Strigid Silence",
  description = "Defeat 25 strigid owls across Teldrassil.",
  type = "namedkillgroup",
  groupMatch = {
    "Strigid Owl",
    "Strigid Screecher",
    "Strigid Hunter",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

-- 🕸️ Tirisfal – Night Web Spiders
table.insert(KAMN.achievements, {
  id = "KILLGROUP_TIRISFAL_NIGHTWEB",
  name = "Night Web Nemesis",
  description = "Defeat 25 Night Web spiders near Deathknell.",
  type = "namedkillgroup",
  groupMatch = {
    "Young Night Web Spider",
    "Night Web Spider",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

-- 🐺 Tirisfal – Darkhounds
table.insert(KAMN.achievements, {
  id = "KILLGROUP_TIRISFAL_DARKHOUNDS",
  name = "Darkhound Determent",
  description = "Defeat 25 darkhounds across Tirisfal Glades.",
  type = "namedkillgroup",
  groupMatch = {
    "Decrepit Darkhound",
    "Darkhound",
    "Ravenous Darkhound",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

-- ✝️ Tirisfal – Scarlet (Frühvarianten)
table.insert(KAMN.achievements, {
  id = "KILLGROUP_TIRISFAL_SCARLET",
  name = "Scarlet Starter Setback",
  description = "Defeat 25 early Scarlet zealots in Tirisfal.",
  type = "namedkillgroup",
  groupMatch = {
    "Scarlet Convert",
    "Scarlet Initiate",
    "Scarlet Neophyte",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

-- 🐗 Durotar – Razormane (Quilboar)
table.insert(KAMN.achievements, {
  id = "KILLGROUP_DUROTAR_RAZORMANE",
  name = "Razormane Ruckus",
  description = "Defeat 25 Razormane quilboars near Razor Hill.",
  type = "namedkillgroup",
  groupMatch = {
    "Razormane Quilboar",
    "Razormane Scout",
    "Razormane Dustrunner",
    "Razormane Battleguard",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

-- 🏝️ Durotar – Echo Isles Trolls
table.insert(KAMN.achievements, {
  id = "KILLGROUP_DUROTAR_TROLLS",
  name = "Echo Isles Eviction",
  description = "Defeat 25 hostile trolls on the Echo Isles.",
  type = "namedkillgroup",
  groupMatch = {
    "Hexed Troll",
    "Voodoo Troll",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

-- 🦀 Durotar – Makrura (Küste)
table.insert(KAMN.achievements, {
  id = "KILLGROUP_DUROTAR_MAKRURA",
  name = "Makrura Mess",
  description = "Defeat 25 makrura along Durotar’s shores.",
  type = "namedkillgroup",
  groupMatch = {
    "Makrura Clacker",
    "Makrura Shellhide",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

-- 🦅 Mulgore – Swoops
table.insert(KAMN.achievements, {
  id = "KILLGROUP_MULGORE_SWOOPS",
  name = "Swoop Stopper",
  description = "Defeat 25 swoops across Mulgore.",
  type = "namedkillgroup",
  groupMatch = {
    "Swoop",
    "Taloned Swoop",
	"Wiry Swoop",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

-- 🛠️ Mulgore – Venture Co.
table.insert(KAMN.achievements, {
  id = "KILLGROUP_MULGORE_VENTURE",
  name = "Venture Venture",
  description = "Defeat 25 Venture Co. workers in Mulgore.",
  type = "namedkillgroup",
  groupMatch = {
    "Venture Co. Worker",
    "Venture Co. Supervisor",
    "Venture Co. Taskmaster",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})
----------------------------------------------------------
-- Westfall – Defias (fortgeschrittene Varianten)
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_WESTFALL_DEFIAS",
  name = "Defias Disarray",
  description = "Defeat 25 advanced Defias operatives across Westfall.",
  type = "namedkillgroup",
  groupMatch = {
    "Defias Pillager",
    "Defias Knuckleduster",
    "Defias Smuggler",
    "Defias Looter",
    "Defias Trapper",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Loch Modan – Stonesplinter Troggs
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_LOCHMODAN_STONESPLINTER",
  name = "Stonesplinter Sweep",
  description = "Defeat 25 Stonesplinter troggs in Loch Modan.",
  type = "namedkillgroup",
  groupMatch = {
    "Stonesplinter Trogg",
    "Stonesplinter Scout",
    "Stonesplinter Bonesnapper",
    "Stonesplinter Skullthumper",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Loch Modan – Mo'grosh Ogres
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_LOCHMODAN_MOGROSH",
  name = "Mo'grosh Mayhem",
  description = "Defeat 25 Mo'grosh ogres in Loch Modan.",
  type = "namedkillgroup",
  groupMatch = {
    "Mo'grosh Ogre",
    "Mo'grosh Brute",
    "Mo'grosh Enforcer",
    "Mo'grosh Shaman",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Darkshore – Wrathscale Naga
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_DARKSHORE_WRATHSCALE",
  name = "Wrathscale Wipeout",
  description = "Defeat 25 Wrathscale naga along Darkshore's coast.",
  type = "namedkillgroup",
  groupMatch = {
    "Wrathscale Naga",
    "Wrathscale Myrmidon",
    "Wrathscale Sorceress",
    "Wrathscale Guardian",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Darkshore – Greymist Murlocs
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_DARKSHORE_GREYMIST",
  name = "Greymist Grief",
  description = "Defeat 25 Greymist murlocs in Darkshore.",
  type = "namedkillgroup",
  groupMatch = {
    "Greymist Warrior",
    "Greymist Hunter",
    "Greymist Seer",
    "Greymist Oracle",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Silverpine Forest – Dalaran (Ambermill)
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_SILVERPINE_DALARAN",
  name = "Ambermill Antagonists",
  description = "Defeat 25 Dalaran mages and guards around Ambermill.",
  type = "namedkillgroup",
  groupMatch = {
    "Dalaran Apprentice",
    "Dalaran Wizard",
    "Dalaran Shield Guard",
    "Dalaran Protector",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Silverpine Forest – Rot Hide Gnolls
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_SILVERPINE_ROTHIDE",
  name = "Rot Hide Rout",
  description = "Defeat 25 Rot Hide gnolls throughout Silverpine.",
  type = "namedkillgroup",
  groupMatch = {
    "Rot Hide Gnoll",
    "Rot Hide Mongrel",
    "Rot Hide Graverobber",
    "Rot Hide Gladerunner",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- The Barrens – Witchwing Harpies
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_BARRENS_WITCHWING",
  name = "Witchwing Wrecking",
  description = "Defeat 25 Witchwing harpies in the Barrens.",
  type = "namedkillgroup",
  groupMatch = {
    "Witchwing Harpy",
    "Witchwing Roguefeather",
    "Witchwing Windcaller",
    "Witchwing Slayer",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- The Barrens – Sunscale Raptors
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_BARRENS_SUNSCALE",
  name = "Sunscale Suppression",
  description = "Defeat 25 Sunscale raptors in the Barrens.",
  type = "namedkillgroup",
  groupMatch = {
    "Sunscale Raptor",
    "Sunscale Screecher",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})
----------------------------------------------------------
-- Westfall – Riverpaw Gnolls
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_WESTFALL_RIVERPAW",
  name = "Riverpaw Rout",
  description = "Defeat 25 Riverpaw gnolls across Westfall.",
  type = "namedkillgroup",
  groupMatch = {
    "Riverpaw Brute",
    "Riverpaw Bandit",
    "Riverpaw Herbalist",
    "Riverpaw Overseer",
    "Riverpaw Scout",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Westfall – Longshore Murlocs
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_WESTFALL_MURLOCS",
  name = "Longshore Lurkers",
  description = "Defeat 25 murlocs along Westfall’s coast.",
  type = "namedkillgroup",
  groupMatch = {
    "Murloc Coastrunner",
    "Murloc Tidehunter",
    "Murloc Oracle",
    "Murloc Minor Oracle",
    "Murloc Raider",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Redridge Mountains – Redridge Gnolls
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_REDRIDGE_GNOLLS",
  name = "Gnoll Grievance",
  description = "Defeat 25 Redridge gnolls in the canyons and around Lakeshire.",
  type = "namedkillgroup",
  groupMatch = {
    "Redridge Mongrel",
    "Redridge Brute",
    "Redridge Poacher",
    "Redridge Mystic",
    "Redridge Drudger",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Redridge Mountains – Blackrock Orcs
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_REDRIDGE_BLACKROCK",
  name = "Blackrock Breakdown",
  description = "Defeat 25 Blackrock orcs across the Redridge foothills.",
  type = "namedkillgroup",
  groupMatch = {
    "Blackrock Outrunner",
    "Blackrock Renegade",
    "Blackrock Tracker",
    "Blackrock Shadowcaster",
    "Blackrock Hunter",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Duskwood – Venom Web Spiders
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_DUSKWOOD_SPIDERS",
  name = "Webcutter",
  description = "Defeat 25 venom web spiders lurking in Duskwood.",
  type = "namedkillgroup",
  groupMatch = {
    "Pygmy Venom Web Spider",
    "Venom Web Spider",
    "Green Recluse",
    "Carrion Recluse",
    "Black Widow Hatchling",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Duskwood – Nightbane Worgen
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_DUSKWOOD_NIGHTBANE",
  name = "Nightbane Nemesis",
  description = "Defeat 25 Nightbane worgen in Duskwood.",
  type = "namedkillgroup",
  groupMatch = {
    "Nightbane Worgen",
    "Nightbane Dark Runner",
    "Nightbane Shadow Weaver",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Stonetalon Mountains – Venture Co. (Windshear Crag)
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_STONETALON_VENTURE",
  name = "Windshear Wreckers",
  description = "Defeat 25 Venture Co. loggers and operators in Windshear Crag.",
  type = "namedkillgroup",
  groupMatch = {
    "Venture Co. Logger",
    "Venture Co. Deforester",
    "Venture Co. Operator",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Stonetalon Mountains – Bloodfury Harpies (Charred Vale)
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_STONETALON_BLOODFURY",
  name = "Charred Vale Cleansing",
  description = "Defeat 25 Bloodfury harpies in the Charred Vale.",
  type = "namedkillgroup",
  groupMatch = {
    "Bloodfury Harpy",
    "Bloodfury Ambusher",
    "Bloodfury Slayer",
    "Bloodfury Roguefeather",
    "Bloodfury Storm Witch",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})
----------------------------------------------------------
-- Westfall – Harvest Machines
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_WESTFALL_HARVESTERS",
  name = "Harvester Halt",
  description = "Defeat 25 harvest machines in Westfall's fields.",
  type = "namedkillgroup",
  groupMatch = {
    "Harvest Watcher",
    "Harvest Golem",
    "Harvest Reaper",
    "Defective Reaper",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Loch Modan – Tunnel Rat Kobolds
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_LOCHMODAN_TUNNELRATS",
  name = "Tunnel Rat Takedown",
  description = "Defeat 25 Tunnel Rat kobolds in Loch Modan.",
  type = "namedkillgroup",
  groupMatch = {
    "Tunnel Rat Forager",
    "Tunnel Rat Surveyor",
    "Tunnel Rat Digger",
    "Tunnel Rat Geomancer",
    "Tunnel Rat Scout",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Darkshore – Blackwood Furbolgs
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_DARKSHORE_BLACKWOOD",
  name = "Blackwood Breakup",
  description = "Defeat 25 Blackwood furbolgs in Darkshore.",
  type = "namedkillgroup",
  groupMatch = {
    "Blackwood Warrior",
    "Blackwood Pathfinder",
    "Blackwood Shaman",
    "Blackwood Totemic",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Darkshore – Moonstalkers
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_DARKSHORE_MOONSTALKERS",
  name = "Moonstalker Muzzle",
  description = "Defeat 25 Moonstalker cats across Darkshore.",
  type = "namedkillgroup",
  groupMatch = {
    "Moonstalker",
    "Moonstalker Runt",
    "Moonstalker Matriarch",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Silverpine Forest – Moonrage Worgen
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_SILVERPINE_MOONRAGE",
  name = "Moonrage Mending",
  description = "Defeat 25 Moonrage worgen across Silverpine Forest.",
  type = "namedkillgroup",
  groupMatch = {
    "Moonrage Darkrunner",
    "Moonrage Watcher",
    "Moonrage Ravager",
    "Moonrage Howler",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- The Barrens – Kolkar Centaur
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_BARRENS_KOLKAR",
  name = "Kolkar Cleanse",
  description = "Defeat 25 Kolkar centaur across the Barrens.",
  type = "namedkillgroup",
  groupMatch = {
    "Kolkar Drudge",
    "Kolkar Outrunner",
    "Kolkar Wrangler",
    "Kolkar Pack Runner",
    "Kolkar Stormseer",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})
----------------------------------------------------------
-- Wetlands – Dragonmaw Orcs
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_WETLANDS_DRAGONMAW",
  name = "Dragonmaw Disruption",
  description = "Defeat 25 Dragonmaw orcs across the Wetlands.",
  type = "namedkillgroup",
  groupMatch = {
    "Dragonmaw Scout",
    "Dragonmaw Grunt",
    "Dragonmaw Raider",
    "Dragonmaw Shadowwarder",
    "Dragonmaw Bonewarder",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})
----------------------------------------------------------
-- Wetlands – Bluegill Murlocs
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_WETLANDS_BLUEGILL",
  name = "Bluegill Breakup",
  description = "Defeat 25 Bluegill murlocs in the Wetlands.",
  type = "namedkillgroup",
  groupMatch = {
    "Bluegill Murloc",
    "Bluegill Puddlejumper",
    "Bluegill Raider",
    "Bluegill Oracle",
    "Bluegill Muckdweller",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})
----------------------------------------------------------
-- Hillsbrad Foothills – Daggerspine Naga
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_HILLSBRAD_DAGGERSPINE",
  name = "Daggerspine Downfall",
  description = "Defeat 25 Daggerspine naga along the Eastern Strand.",
  type = "namedkillgroup",
  groupMatch = {
    "Daggerspine Shorehunter",
    "Daggerspine Siren",
    "Daggerspine Screamer",
    "Daggerspine Shorestalker",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})
----------------------------------------------------------
-- Hillsbrad Foothills – Syndicate
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_HILLSBRAD_SYNDICATE",
  name = "Syndicate Suppression",
  description = "Defeat 25 Syndicate agents in Hillsbrad Foothills.",
  type = "namedkillgroup",
  groupMatch = {
    "Syndicate Footpad",
    "Syndicate Thief",
    "Syndicate Watchman",
    "Syndicate Shadow Mage",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})
----------------------------------------------------------
-- Alterac Mountains – Crushridge Ogres
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_ALTERAC_CRUSHRIDGE",
  name = "Crushridge Crackdown",
  description = "Defeat 25 Crushridge ogres in the Alterac Mountains.",
  type = "namedkillgroup",
  groupMatch = {
    "Crushridge Mauler",
    "Crushridge Mage",
    "Crushridge Enforcer",
    "Crushridge Warmonger",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})
----------------------------------------------------------
-- Alterac Mountains – Yetis
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_ALTERAC_YETI",
  name = "Yeti Yodeler",
  description = "Defeat 25 yetis in the Alterac Mountains.",
  type = "namedkillgroup",
  groupMatch = {
    "Mountain Yeti",
    "Giant Yeti",
    "Skhowl",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})
----------------------------------------------------------
-- Arathi Highlands – Witherbark Trolls
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_ARATHI_WITHERBARK",
  name = "Witherbark Wipeout",
  description = "Defeat 25 Witherbark trolls in the Arathi Highlands.",
  type = "namedkillgroup",
  groupMatch = {
    "Witherbark Axe Thrower",
    "Witherbark Headhunter",
    "Witherbark Witch Doctor",
    "Witherbark Berserker",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})
----------------------------------------------------------
-- Arathi Highlands – Boulderfist Ogres
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_ARATHI_BOULDERFIST",
  name = "Boulderfist Beatdown",
  description = "Defeat 25 Boulderfist ogres in the Arathi Highlands.",
  type = "namedkillgroup",
  groupMatch = {
    "Boulderfist Enforcer",
    "Boulderfist Brute",
    "Boulderfist Magus",
    "Boulderfist Mauler",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})
----------------------------------------------------------
-- The Hinterlands – Vilebranch Trolls
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_HINTERLANDS_VILEBRANCH",
  name = "Vilebranch Vexation",
  description = "Defeat 25 Vilebranch trolls in the Hinterlands.",
  type = "namedkillgroup",
  groupMatch = {
    "Vilebranch Scalper",
    "Vilebranch Shadowcaster",
    "Vilebranch Berserker",
    "Vilebranch Witch Doctor",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- The Hinterlands – Silvermane Wolves
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_HINTERLANDS_SILVERMANE",
  name = "Silvermane Suppression",
  description = "Defeat 25 Silvermane wolves across the Hinterlands.",
  type = "namedkillgroup",
  groupMatch = {
    "Silvermane Stalker",
    "Silvermane Howler",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Badlands – Dustbelcher Ogres
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_BADLANDS_DUSTBELCHER",
  name = "Dustbelcher Demolition",
  description = "Defeat 25 Dustbelcher ogres in the Badlands.",
  type = "namedkillgroup",
  groupMatch = {
    "Dustbelcher Ogre",
    "Dustbelcher Brute",
    "Dustbelcher Mauler",
    "Dustbelcher Shaman",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Badlands – Stonevault Troggs
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_BADLANDS_STONEVAULT",
  name = "Stonevault Shutdown",
  description = "Defeat 25 Stonevault troggs in the Badlands.",
  type = "namedkillgroup",
  groupMatch = {
    "Stonevault Cave Hunter",
    "Stonevault Rockchewer",
    "Stonevault Oracle",
    "Stonevault Pillager",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Searing Gorge – Dark Iron (Slag Pit)
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_SEARINGGORGE_DARKIRON",
  name = "Slag Pit Sweep",
  description = "Defeat 25 Dark Iron taskmasters and slavers in Searing Gorge.",
  type = "namedkillgroup",
  groupMatch = {
    "Dark Iron Taskmaster",
    "Dark Iron Slaver",
    "Dark Iron Lookout",
    "Dark Iron Watchman",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Searing Gorge – Lava Spiders
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_SEARINGGORGE_LAVASPIDERS",
  name = "Lavaweb Lullaby",
  description = "Defeat 25 lava spiders across Searing Gorge.",
  type = "namedkillgroup",
  groupMatch = {
    "Greater Lava Spider",
    "Scalding Lava Spider",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Burning Steppes – Blackrock Orcs (High Ranks)
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_BURNINGSTEPPES_BLACKROCK",
  name = "Blackrock Blitz",
  description = "Defeat 25 Blackrock orcs in the Burning Steppes.",
  type = "namedkillgroup",
  groupMatch = {
    "Blackrock Soldier",
    "Blackrock Sentry",
    "Blackrock Champion",
    "Blackrock Sorcerer",
    "Blackrock Warlock",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Burning Steppes – Firegut Ogres
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_BURNINGSTEPPES_FIREGUT",
  name = "Firegut Fallout",
  description = "Defeat 25 Firegut ogres in the Burning Steppes.",
  type = "namedkillgroup",
  groupMatch = {
    "Firegut Ogre",
    "Firegut Brute",
    "Firegut Ogre Mage",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})
----------------------------------------------------------
-- Swamp of Sorrows – Lost Ones
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_SOS_LOSTONES",
  name = "Lost One Lament",
  description = "Defeat 25 Lost One foes across the Swamp of Sorrows.",
  type = "namedkillgroup",
  groupMatch = {
    "Lost One Hunter",
    "Lost One Seer",
    "Lost One Riftseeker",
    "Lost One Muckdweller",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Swamp of Sorrows – Green Dragonflight (Sunken Temple area)
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_SOS_GREENDRAGONKIN",
  name = "Dreaming Defier",
  description = "Defeat 25 green dragonkin around the Temple of Atal'Hakkar.",
  type = "namedkillgroup",
  groupMatch = {
    "Dreaming Whelp",
    "Green Wyrmkin",
    "Wyrmkin Dreamwalker",
    "Green Scalebane",
    "Scalebane Captain",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Blasted Lands – Dreadmaul Ogres
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_BL_DREADMAUL",
  name = "Dreadmaul Dispersal",
  description = "Defeat 25 Dreadmaul ogres across the Blasted Lands.",
  type = "namedkillgroup",
  groupMatch = {
    "Dreadmaul Ogre",
    "Dreadmaul Brute",
    "Dreadmaul Mauler",
    "Dreadmaul Ogre Mage",
    "Dreadmaul Warlock",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Blasted Lands – Snickerfang Hyenas
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_BL_SNICKERFANG",
  name = "Snickerfang Skirmish",
  description = "Defeat 25 Snickerfang hyenas prowling the wastes.",
  type = "namedkillgroup",
  groupMatch = {
    "Snickerfang Hyena",
    "Starving Snickerfang",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Western Plaguelands – Scarlet Crusade (Hearthglen & camps)
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_WPL_SCARLET",
  name = "Hearthglen Harriers",
  description = "Defeat 25 Scarlet Crusaders in the Western Plaguelands.",
  type = "namedkillgroup",
  groupMatch = {
    "Scarlet Knight",
    "Scarlet Worker",
    "Scarlet Mage",
    "Scarlet Paladin",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Western Plaguelands – Andorhal Skeletons
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_WPL_SKELETONS",
  name = "Andorhal Bonebreaker",
  description = "Defeat 25 skeletons within and around Andorhal.",
  type = "namedkillgroup",
  groupMatch = {
    "Skeletal Flayer",
    "Skeletal Sorcerer",
    "Skeletal Acolyte",
    "Skeletal Executioner",
    "Skeletal Warlord",
    "Skeletal Terror",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})
----------------------------------------------------------
-- Eastern Plaguelands – Plaguebats
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_EPL_PLAGUEBATS",
  name = "Blood-Tinged Skies",
  description = "Defeat 25 plaguebats across the Eastern Plaguelands.",
  type = "namedkillgroup",
  groupMatch = {
    "Plaguebat",            -- EPL
    "Noxious Plaguebat",    -- EPL
    "Monstrous Plaguebat",  -- EPL
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Eastern Plaguelands – Plaguehounds (Demon Dogs)
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_EPL_PLAGUEHOUNDS",
  name = "Demon Dog Discipline",
  description = "Defeat 25 plaguehounds throughout the Eastern Plaguelands.",
  type = "namedkillgroup",
  groupMatch = {
    "Plaguehound Runt",
    "Plaguehound",
    "Frenzied Plaguehound",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Stranglethorn Vale – Bloodsail Buccaneers
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_STV_BLOODSAIL",
  name = "Bloodsail Bust-Up",
  description = "Defeat 25 Bloodsail pirates along the Wild Shore and Booty Bay waters.",
  type = "namedkillgroup",
  groupMatch = {
    "Bloodsail Raider",
    "Bloodsail Swashbuckler",
    "Bloodsail Sea Dog",
    "Bloodsail Mage",
    "Bloodsail Warlock",
    "Bloodsail Deckhand",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Stranglethorn Vale – Skullsplitter Trolls
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_STV_SKULLSPLITTER",
  name = "Skullsplitter Smackdown",
  description = "Defeat 25 Skullsplitter trolls across northern Stranglethorn.",
  type = "namedkillgroup",
  groupMatch = {
    "Skullsplitter Scout",
    "Skullsplitter Headhunter",
    "Skullsplitter Witch Doctor",
    "Skullsplitter Berserker",
    "Skullsplitter Axe Thrower",
    "Skullsplitter Warrior",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Deadwind Pass – Ogres (Grosh'gok Compound / The Vice)
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_DEADWIND_OGRES",
  name = "Ogre Ousting",
  description = "Defeat 25 ogres of Deadwind Pass near Karazhan.",
  type = "namedkillgroup",
  groupMatch = {
    "Deadwind Brute",
    "Deadwind Mauler",
    "Deadwind Ogre Mage",
    "Deadwind Warlock",
    "Deadwind Enforcer",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- Deadwind Pass – Ghosts & Shades (The Master's Cellar)
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_DEADWIND_GHOSTS",
  name = "Ghostly Grievances",
  description = "Defeat 25 spectral foes haunting Deadwind Pass.",
  type = "namedkillgroup",
  groupMatch = {
    "Restless Shade",
    "Wailing Spectre",
    "Damned Soul",
    "Unliving Resident",
    "Unliving Caretaker",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})
----------------------------------------------------------
-- 🗺️ Thousand Needles – Grimtotem (Darkcloud Pinnacle)
-- Note: Uses ONLY TN-confirmed Grimtotem types (Reaver, Geomancer, Stomper)
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_THOUSANDNEEDLES_GRIMTOTEM",
  name = "Grimtotem Rumble",
  description = "Defeat 25 Grimtotem tauren in Thousand Needles.",
  type = "namedkillgroup",
  -- ✅ TN-confirmed NPC names
  groupMatch = {
    "Grimtotem Reaver",
    "Grimtotem Geomancer",
    "Grimtotem Stomper",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})
----------------------------------------------------------
-- 🗺️ Ashenvale – Thistlefur Furbolgs
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_ASHENVALE_THISTLEFUR",
  name = "Thistlefur Thinning",
  description = "Defeat 25 Thistlefur furbolgs across Ashenvale.",
  type = "namedkillgroup",
  groupMatch = {
    "Thistlefur Warrior",
    "Thistlefur Pathfinder",
    "Thistlefur Shaman",
    "Thistlefur Totemic",
    "Thistlefur Den Watcher",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- 🗺️ Ashenvale – Foulweald Furbolgs
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_ASHENVALE_FOULWEALD",
  name = "Foulweald Foray",
  description = "Defeat 25 Foulweald furbolgs in southern Ashenvale.",
  type = "namedkillgroup",
  groupMatch = {
    "Foulweald Warrior",
    "Foulweald Shaman",
    "Foulweald Totemic",
    "Foulweald Den Watcher",
    "Foulweald Ursa",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- 🗺️ Thousand Needles – Grimtotem Tauren
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_STONETALON_GRIMTOTEM",
  name = "Grimtotem Trouble",
  description = "Defeat 25 Grimtotem.",
  type = "namedkillgroup",
  groupMatch = {
    "Grimtotem Ruffian",
    "Grimtotem Brute",
    "Grimtotem Reaver",
    "Grimtotem Sorcerer",
    "Grimtotem Naturalist",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- 🗺️ Thousand Needles – Galak Centaur
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_THOUSANDNEEDLES_GALAK",
  name = "Galak Grounding",
  description = "Defeat 25 Galak centaur across Thousand Needles.",
  type = "namedkillgroup",
  groupMatch = {
    "Galak Outrunner",
    "Galak Scout",
    "Galak Wrangler",
    "Galak Marauder",
    "Galak Stormer",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- 🗺️ Desolace – Magram Centaur
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_DESOLACE_MAGRAM",
  name = "Magram Malcontents",
  description = "Defeat 25 Magram centaur throughout Desolace.",
  type = "namedkillgroup",
  groupMatch = {
    "Magram Outrunner",
    "Magram Scout",
    "Magram Marauder",
    "Magram Windchaser",
    "Magram Pack Runner",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- 🗺️ Desolace – Gelkis Centaur
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_DESOLACE_GELKIS",
  name = "Gelkis Grudge",
  description = "Defeat 25 Gelkis centaur throughout Desolace.",
  type = "namedkillgroup",
  groupMatch = {
    "Gelkis Outrunner",
    "Gelkis Scout",
    "Gelkis Marauder",
    "Gelkis Windchaser",
    "Gelkis Pack Runner",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- 🗺️ Dustwallow Marsh – Stonemaul Ogres
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_DUSTWALLOW_STONEMAUL",
  name = "Stonemaul Smashers",
  description = "Defeat 25 Stonemaul ogres in the Dustwallow Marsh ruins.",
  type = "namedkillgroup",
  groupMatch = {
    "Stonemaul Ogre",
    "Stonemaul Brute",
    "Stonemaul Magus",
    "Stonemaul Shaman",
    "Stonemaul Enforcer",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- 🗺️ Dustwallow Marsh – Mirefin Murlocs
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_DUSTWALLOW_MIREFIN",
  name = "Mirefin Menace",
  description = "Defeat 25 Mirefin murlocs along the Dustwallow coast.",
  type = "namedkillgroup",
  groupMatch = {
    "Mirefin Coastrunner",
    "Mirefin Muckdweller",
    "Mirefin Oracle",
    "Mirefin Warrior",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})
----------------------------------------------------------
-- 🗺️ Feralas – Gordunni Ogres
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_FERALAS_GORDUNNI",
  name = "Gordunni Grievance",
  description = "Defeat 25 Gordunni ogres in Feralas.",
  type = "namedkillgroup",
  groupMatch = {
    "Gordunni Ogre",
    "Gordunni Brute",
    "Gordunni Warlock",
    "Gordunni Mage-Lord",
    "Gordunni Shaman",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- 🗺️ Feralas – Feral Scar Yetis
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_FERALAS_FERALSCAR",
  name = "Feral Scar Frenzy",
  description = "Defeat 25 Feral Scar yetis in Feralas.",
  type = "namedkillgroup",
  groupMatch = {
    "Feral Scar Yeti",
    "Feral Scar Mauler",
    "Elder Feral Scar Yeti",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- 🗺️ Tanaris – Wastewander Bandits
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_TANARIS_WASTEWANDER",
  name = "Wastewander Wipeout",
  description = "Defeat 25 Wastewander bandits in Tanaris.",
  type = "namedkillgroup",
  groupMatch = {
    "Wastewander Thief",
    "Wastewander Rogue",
    "Wastewander Bandit",
    "Wastewander Shadow Mage",
    "Wastewander Assassin",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- 🗺️ Tanaris – Southsea Pirates (Lost Rigger Cove)
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_TANARIS_SOUTHSEA",
  name = "Lost Rigger Lockdown",
  description = "Defeat 25 Southsea pirates at Lost Rigger Cove in Tanaris.",
  type = "namedkillgroup",
  groupMatch = {
    "Southsea Pirate",
    "Southsea Freebooter",
    "Southsea Swashbuckler",
    "Southsea Dock Worker",
    "Southsea Privateer",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- 🗺️ Azshara – Legashi Satyrs
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_AZSHARA_LEGASHI",
  name = "Legashi Lockdown",
  description = "Defeat 25 Legashi satyrs across Azshara.",
  type = "namedkillgroup",
  groupMatch = {
    "Legashi Satyr",
    "Legashi Rogue",
    "Legashi Hellcaller",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- 🗺️ Azshara – Spitelash Naga
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_AZSHARA_SPITELASH",
  name = "Spitelash Suppression",
  description = "Defeat 25 Spitelash naga in Azshara.",
  type = "namedkillgroup",
  groupMatch = {
    "Spitelash Warrior",
    "Spitelash Myrmidon",
    "Spitelash Siren",
    "Spitelash Enchantress",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- 🗺️ Felwood – Deadwood Furbolgs
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_FELWOOD_DEADWOOD",
  name = "Deadwood Dispersal",
  description = "Defeat 25 Deadwood furbolgs in Felwood.",
  type = "namedkillgroup",
  groupMatch = {
    "Deadwood Warrior",
    "Deadwood Pathfinder",
    "Deadwood Shaman",
    "Deadwood Den Watcher",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

----------------------------------------------------------
-- 🗺️ Felwood – Jadefire Satyrs
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_FELWOOD_JADEFIRE",
  name = "Jadefire Judgment",
  description = "Defeat 25 Jadefire satyrs in Felwood.",
  type = "namedkillgroup",
  groupMatch = {
    "Jadefire Rogue",
    "Jadefire Felsworn",
    "Jadefire Trickster",
    "Jadefire Hellcaller",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})
----------------------------------------------------------
-- 🗺️ Un'Goro Crater – Pterrordax
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_UNGORO_PTERRORDAX",
  name = "Pterrordax Patrol",
  description = "Defeat 25 pterrordax across Un'Goro Crater.",
  type = "namedkillgroup",
  groupMatch = {
    "Pterrordax",
    "Frenzied Pterrordax",
  },
  value = 25, progress = 0, complete = false,
  category = "Combat", points = 5, requiredFor = {},
})

----------------------------------------------------------
-- 🗺️ Un'Goro Crater – Un'Goro Gorillas
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_UNGORO_GORILLAS",
  name = "Gorilla Grounds",
  description = "Defeat 25 gorillas in Un'Goro Crater.",
  type = "namedkillgroup",
  groupMatch = {
    "Un'Goro Gorilla",
    "Un'Goro Stomper",
    "Un'Goro Thunderer",
  },
  value = 25, progress = 0, complete = false,
  category = "Combat", points = 5, requiredFor = {},
})

----------------------------------------------------------
-- 🗺️ Silithus – Twilight's Hammer Cultists
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_SILITHUS_TWILIGHT",
  name = "Twilight Takedown",
  description = "Defeat 25 Twilight's Hammer cultists in Silithus.",
  type = "namedkillgroup",
  groupMatch = {
    "Twilight Cultist",
    "Twilight Avenger",
    "Twilight Geolord",
    "Twilight Stonecaller",
  },
  value = 25, progress = 0, complete = false,
  category = "Combat", points = 5, requiredFor = {},
})

----------------------------------------------------------
-- 🗺️ Silithus – Hive'Ashi Silithids
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_SILITHUS_HIVEASHI",
  name = "Hive'Ashi Harriers",
  description = "Defeat 25 Hive'Ashi silithids in Silithus.",
  type = "namedkillgroup",
  groupMatch = {
    "Hive'Ashi Drone",
    "Hive'Ashi Defender",
    "Hive'Ashi Sandstalker",
    "Hive'Ashi Ambusher",
  },
  value = 25, progress = 0, complete = false,
  category = "Combat", points = 5, requiredFor = {},
})

----------------------------------------------------------
-- 🗺️ Winterspring – Winterfall Furbolgs
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_WINTERSPRING_WINTERFALL",
  name = "Winterfall Wipeout",
  description = "Defeat 25 Winterfall furbolgs in Winterspring.",
  type = "namedkillgroup",
  groupMatch = {
    "Winterfall Pathfinder",
    "Winterfall Runner",
    "Winterfall Totemic",
    "Winterfall Shaman",
    "Winterfall Den Watcher",
  },
  value = 25, progress = 0, complete = false,
  category = "Combat", points = 5, requiredFor = {},
})

----------------------------------------------------------
-- 🗺️ Winterspring – Ice Thistle Yetis
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_WINTERSPRING_ICETHISTLE",
  name = "Ice Thistle Intervention",
  description = "Defeat 25 Ice Thistle yetis in Winterspring.",
  type = "namedkillgroup",
  groupMatch = {
    "Ice Thistle Yeti",
    "Ice Thistle Matriarch",
    "Ice Thistle Patriarch",
  },
  value = 25, progress = 0, complete = false,
  category = "Combat", points = 5, requiredFor = {},
})
----------------------------------------------------------
-- 🗺️ Moonglade – Timbermaw Furbolgs (Tunnel-Zugänge)
----------------------------------------------------------
table.insert(KAMN.achievements, {
  id = "KILLGROUP_MOONGLADE_TIMBERMAW",
  name = "Timbermaw Tunnel Terrors",
  description = "Defeat 25 Timbermaw furbolgs in the tunnels leading into Moonglade.",
  type = "namedkillgroup",
  groupMatch = {
    "Timbermaw Shaman",
    "Timbermaw Pathfinder",
    "Timbermaw Totemic",
    "Timbermaw Den Watcher",
  },
  value = 25,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})
