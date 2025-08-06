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
  description = "Defeat 10 Plainstriders at The Barrens and Mulgore.",
  type = "namedkillgroup",
  groupMatch = {
    "Plainstrider", "Adult Plainstrider", "Elder Plainstrider",
    "Ornery Plainstrider", "Greater Plainstrider", "Fleeting Plainstrider",
  },
  value = 10,
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
  description = "Defeat 10 scorpids and their rare kin in Durotar.",
  type = "namedkillgroup",
  groupMatch = {
    "Scorpid Worker",
    "Clattering Scorpid",
    "Venomtail Scorpid",
    "Corrupted Scorpid",
    "Death Flayer",    -- Rare Elite Scorpid
    "Sarkoth",         -- Quest-NPC, Scorpid-artig
  },
  value = 10,
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
  description = "Hunt 10 wolves like Gray Forest and Timber Wolves in Elwynn Forest.",
  type = "namedkillgroup",
  groupMatch = {
    "Gray Forest Wolf",
    "Mangy Wolf",
    "Timber Wolf",
    "Young Wolf",
  },
  value = 10,
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
  description = "Defeat 10 Wendigo-type creatures in Dun Morogh.",
  type = "namedkillgroup",
  groupMatch = {
    "Wendigo",
    "Ice Claw Bear",         -- stimmungsvoller Zusatz
    "Frostmane Troll Whelp", -- thematisch passender Bonus
  },
  value = 10,
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
  description = "Hunt 10 nightsaber-type cats in the forests of Teldrassil.",
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
  value = 10,
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
  description = "Defeat 10 duskbat-type creatures in Tirisfal Glades.",
  type = "namedkillgroup",
  groupMatch = {
    "Duskbat",
    "Mangy Duskbat",
    "Greater Duskbat",
    "Vampiric Duskbat",
    "Ressan the Needler", -- Rare
  },
  value = 10,
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
    "Thistle Boar", "Young Thistle Boar", "Boar Spirit"
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
  description = "Defeat 20 kobold-type enemies in Elwynn and beyond.",
  type = "namedkillgroup",
  groupMatch = { "Kobold Tunneler", "Kobold Geomancer", "Kobold Laborer", "Kobold Miner", "Kobold Digger", "Kobold Worker", "Kobold Vermin" },
  value = 20,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})



table.insert(KAMN.achievements, {
  id = "KILL_BRISTLEBACK15",
  name = "Bristleback Invasion",
  description = "Defeat 15 Bristleback Quilboars.",
  type = "namedkillgroup",
  targetname = "Bristleback Quilboar",
  value = 15,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})