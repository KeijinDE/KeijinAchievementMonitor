-- achievements_quests.lua
-- Quest Achievements (English only – named + generic) + questhub field for sorting

KAMN = KAMN or {}
KAMN.achievements = KAMN.achievements or {}

-- Named Quests
-- 🗺️ Mulgore
table.insert(KAMN.achievements, {
  id = "QUEST_The_Hunts_Begins1",
  name = "The Hunt Begins",
  description = "Complete the quest 'The Hunt Begins' in Mulgore.",
  type = "namedquest",
  questname = "The Hunt Begins",
  questhub = "Mulgore",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_A_Humble_Task1",
  name = "A Humble Task",
  description = "Complete the quest 'A Humble Task' in Mulgore.",
  type = "namedquest",
  questname = "A Humble Task",
  questhub = "Mulgore",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_Rune_Inscribed_Note1",
  name = "Rune-Inscribed Note",
  description = "Complete the quest 'Rune-Inscribed Note' in Mulgore.",
  type = "namedquest",
  questname = "Rune-Inscribed Note",
  questhub = "Shaman",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_DANGERS_OF_THE_WINDFURY1",
  name = "Dangers of the Windfury",
  description = "Face the storms and complete the quest 'Dangers of the Windfury' in Mulgore.",
  type = "namedquest",
  questname = "Dangers of the Windfury",
  questhub = "Mulgore",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_RITE_OF_VISION1",
  name = "Rite of Vision",
  description = "Walk the spirit path and complete the quest 'Rite of Vision' in Mulgore.",
  type = "namedquest",
  questname = "Rite of Vision",
  questhub = "Mulgore",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

-- 🗺️ Elwynn Forest Quests
table.insert(KAMN.achievements, {
  id = "QUEST_A_THREAT_WITHIN1",
  name = "A Threat Within",
  description = "Answer the call and complete the quest 'A Threat Within' in Elwynn Forest.",
  type = "namedquest",
  questname = "A Threat Within",
  questhub = "Elwynn Forest",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_THE_FARGODEEP_MINE1",
  name = "The Fargodeep Mine",
  description = "Investigate the depths and complete the quest 'The Fargodeep Mine' in Elwynn Forest.",
  type = "namedquest",
  questname = "The Fargodeep Mine",
  questhub = "Elwynn Forest",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_THE_JASPERLODE_MINE1",
  name = "The Jasperlode Mine",
  description = "Uncover its secrets and complete the quest 'The Jasperlode Mine' in Elwynn Forest.",
  type = "namedquest",
  questname = "The Jasperlode Mine",
  questhub = "Elwynn Forest",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_PROTECT_THE_FRONTIER1",
  name = "Protect the Frontier",
  description = "Guard Elwynn’s borders and complete the quest 'Protect the Frontier' in Elwynn Forest.",
  type = "namedquest",
  questname = "Protect the Frontier",
  questhub = "Elwynn Forest",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_GOLD_DUST_EXCHANGE1",
  name = "Gold Dust Exchange",
  description = "Trade shiny loot and complete the quest 'Gold Dust Exchange' in Elwynn Forest.",
  type = "namedquest",
  questname = "Gold Dust Exchange",
  questhub = "Elwynn Forest",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

-- 🗺️ Durotar Quests
table.insert(KAMN.achievements, {
  id = "QUEST_VILE_FAMILIARS1",
  name = "Vile Familiars",
  description = "Complete the quest 'Vile Familiars' by kill imps near Durotar.",
  type = "namedquest",
  questname = "Vile Familiars",
  questhub = "Durotar",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_YOUR_PLACE_IN_THE_WORLD1",
  name = "Your Place In The World",
  description = "Prove yourself and complete the quest 'Your Place In The World' in Durotar.",
  type = "namedquest",
  questname = "Your Place In The World",
  questhub = "Durotar",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "Galgars_Cactus_Apple_Surprise1",
  name = "Galgar's Cactus Apple Surprise",
  description = "Prove yourself, stay strong, dont hurt you and complete the quest 'Galgar's Cactus Apple Surprise' in Durotar.",
  type = "namedquest",
  questname = "Galgar's Cactus Apple Surprise",
  questhub = "Durotar",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_VANQUISH_THE_BETRAYERS1",
  name = "Vanquish the Betrayers",
  description = "Strike down the traitors and complete the quest 'Vanquish the Betrayers' in Durotar.",
  type = "namedquest",
  questname = "Vanquish the Betrayers",
  questhub = "Durotar",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_DARK_STORMS1",
  name = "Dark Storms",
  description = "Face the shaman's vision and complete the quest 'Dark Storms' in Durotar.",
  type = "namedquest",
  questname = "Dark Storms",
  questhub = "Durotar",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_A_PEONS_BURDEN1",
  name = "A Peon's Burden",
  description = "Carry the weight and complete the quest 'A Peon's Burden' in Durotar.",
  type = "namedquest",
  questname = "A Peon's Burden",
  questhub = "Durotar",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_THE_ADMIRALS_ORDERS1",
  name = "The Admiral's Orders",
  description = "Uncover the truth and complete the quest 'The Admiral's Orders' in Durotar.",
  type = "namedquest",
  questname = "The Admiral's Orders",
  questhub = "Durotar",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_SARKOTH1",
  name = "Sarkoth",
  description = "Defeat the scuttler and complete the quest 'Sarkoth' in Durotar.",
  type = "namedquest",
  questname = "Sarkoth",
  questhub = "Durotar",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

-- 🗺️ Dun Morogh Quests
table.insert(KAMN.achievements, {
  id = "QUEST_DWARVEN_OUTFITTERS1",
  name = "Dwarven Outfitters",
  description = "Gear up for the journey and complete the quest 'Dwarven Outfitters' in Dun Morogh.",
  type = "namedquest",
  questname = "Dwarven Outfitters",
  questhub = "Dun Morogh",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_COLDRIDGE_VALLEY_MAIL1",
  name = "Coldridge Valley Mail Delivery",
  description = "Deliver the news and complete the quest 'Coldridge Valley Mail Delivery' in Dun Morogh.",
  type = "namedquest",
  questname = "Coldridge Valley Mail Delivery",
  questhub = "Dun Morogh",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_THE_TROLL_CAVE1",
  name = "The Troll Cave",
  description = "Clear the icy den and complete the quest 'The Troll Cave' in Dun Morogh.",
  type = "namedquest",
  questname = "The Troll Cave",
  questhub = "Dun Morogh",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_BEER_BASTED_BOAR_RIBS1",
  name = "Beer Basted Boar Ribs",
  description = "Cook it right and complete the quest 'Beer Basted Boar Ribs' in Dun Morogh.",
  type = "namedquest",
  questname = "Beer Basted Boar Ribs",
  questhub = "Dun Morogh",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_FROSTMANE_HOLD1",
  name = "Frostmane Hold",
  description = "Strike at the trolls and complete the quest 'Frostmane Hold' in Dun Morogh.",
  type = "namedquest",
  questname = "Frostmane Hold",
  questhub = "Dun Morogh",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

-- 🗺️ Teldrassil Quests
table.insert(KAMN.achievements, {
  id = "QUEST_THE_BALANCE_OF_NATURE1",
  name = "The Balance of Nature",
  description = "Restore harmony and complete the quest 'The Balance of Nature' in Teldrassil.",
  type = "namedquest",
  questname = "The Balance of Nature",
  questhub = "Teldrassil",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_THE_WOODLAND_PROTECTOR1",
  name = "The Woodland Protector",
  description = "Answer the call of the forest and complete the quest 'The Woodland Protector' in Teldrassil.",
  type = "namedquest",
  questname = "The Woodland Protector",
  questhub = "Teldrassil",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_CROWN_OF_THE_EARTH1",
  name = "Crown of the Earth",
  description = "Honor the goddess and complete the quest 'Crown of the Earth' in Teldrassil.",
  type = "namedquest",
  questname = "Crown of the Earth",
  questhub = "Teldrassil",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_ZENNS_BIDDING1",
  name = "Zenn's Bidding",
  description = "Aid the eccentric and complete the quest 'Zenn's Bidding' in Teldrassil.",
  type = "namedquest",
  questname = "Zenn's Bidding",
  questhub = "Teldrassil",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_DENALANS_EARTH1",
  name = "Denalan's Earth",
  description = "Help the druid tend the soil and complete the quest 'Denalan's Earth' in Teldrassil.",
  type = "namedquest",
  questname = "Denalan's Earth",
  questhub = "Teldrassil",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})
-- 🗺️ Thalassian Highlands Quests
table.insert(KAMN.achievements, {
  id = "QUEST_THALASSIAN_GOULASH1",
  name = "Thalassian Goulash",
  description = "Cook up a local delicacy and complete the quest 'Thalassian Goulash' in Thalassian Highlands.",
  type = "namedquest",
  questname = "Thalassian Goulash",
  questhub = "Thalassian Highlands",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_FELSTRIDER_RETREAT1",
  name = "Felstrider Retreat",
  description = "Answer the call and complete the quest 'Felstrider Retreat' in Thalassian Highlands.",
  type = "namedquest",
  questname = "Felstrider Retreat",
  questhub = "Thalassian Highlands",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_A_LETTER_FROM_THE_ROYALTY1",
  name = "A Letter from the Royalty",
  description = "Deliver the royal message and complete the quest 'A Letter from the Royalty' in Thalassian Highlands.",
  type = "namedquest",
  questname = "A Letter from the Royalty",
  questhub = "Thalassian Highlands",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_THE_SILVER_COVENANT1",
  name = "The Silver Covenant",
  description = "Earn the trust and complete the quest 'The Silver Covenant' in Thalassian Highlands.",
  type = "namedquest",
  questname = "The Silver Covenant",
  questhub = "Thalassian Highlands",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_ELEGANT_LETTER1",
  name = "Elegant Letter",
  description = "Deliver the elegant letter and complete the quest 'Elegant Letter' in Thalassian Highlands.",
  type = "namedquest",
  questname = "Elegant Letter",
  questhub = "Thalassian Highlands",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_REFUGEES_NO_MORE1",
  name = "Refugees no More",
  description = "Help the displaced and complete the quest 'Refugees no More' in Thalassian Highlands.",
  type = "namedquest",
  questname = "Refugees no More",
  questhub = "Thalassian Highlands",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_PROVISIONS_FOR_REFUGEES1",
  name = "Provisions for Refugees",
  description = "Gather supplies and complete the quest 'Provisions for Refugees' in Thalassian Highlands.",
  type = "namedquest",
  questname = "Provisions for Refugees",
  questhub = "Thalassian Highlands",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_SAFETY_FOR_REFUGEES1",
  name = "Safety for Refugees",
  description = "Ensure protection and complete the quest 'Safety for Refugees' in Thalassian Highlands.",
  type = "namedquest",
  questname = "Safety for Refugees",
  questhub = "Thalassian Highlands",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

-- 🗺️ Mulgore Quest
table.insert(KAMN.achievements, {
  id = "QUEST_BRISTLEBACK_AGGRESSION1",
  name = "Bristleback Aggression",
  description = "Quell the threat and complete the quest 'Bristleback Aggression' in Mulgore.",
  type = "namedquest",
  questname = "Bristleback Aggression",
  questhub = "Mulgore",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

-- 🗺️ Stormwind Quest
table.insert(KAMN.achievements, {
  id = "QUEST_THALASSIAN_DIPLOMACY1",
  name = "Thalassian Diplomacy",
  description = "Negotiate peace and complete the quest 'Thalassian Diplomacy' in Stormwind.",
  type = "namedquest",
  questname = "Thalassian Diplomacy",
  questhub = "Stormwind",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

-- 🗺️ Blackstone Isle Quests
table.insert(KAMN.achievements, {
  id = "QUEST_PIT_IFUL_WORK1",
  name = "Pit-Iful Work",
  description = "Assist with the labor and complete the quest 'Pit-Iful Work' on Blackstone Isle.",
  type = "namedquest",
  questname = "Pit-Iful Work",
  questhub = "Blackstone Isle",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_DEFUNCT_MAINFRAMES1",
  name = "Defunct Mainframes",
  description = "Investigate the machines and complete the quest 'Defunct Mainframes' on Blackstone Isle.",
  type = "namedquest",
  questname = "Defunct Mainframes",
  questhub = "Blackstone Isle",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_FOREMANS_BLUES1",
  name = "Foreman's Blues",
  description = "Aid the foreman and complete the quest 'Foreman's Blues' on Blackstone Isle.",
  type = "namedquest",
  questname = "Foreman's Blues",
  questhub = "Blackstone Isle",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_HAYWIRE_HAVOC1",
  name = "Haywire Havoc",
  description = "Stop the chaos and complete the quest 'Haywire Havoc' on Blackstone Isle.",
  type = "namedquest",
  questname = "Haywire Havoc",
  questhub = "Blackstone Isle",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_DV_5001",
  name = "DV-500",
  description = "Handle the situation and complete the quest 'DV-500' on Blackstone Isle.",
  type = "namedquest",
  questname = "DV-500",
  questhub = "Blackstone Isle",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 5,
  requiredFor = {}
})
-- 🗺️ Blackwing Lair Quests
table.insert(KAMN.achievements, {
  id = "QUEST_NEFARIUSS_CORRUPTION1",
  name = "Nefarius's Corruption",
  description = "Complete the quest 'Nefarius's Corruption' in Blackwing Lair.",
  type = "namedquest",
  questname = "Nefarius's Corruption",
  questhub = "Raid: Blackwing Lair",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 10,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_ONLY_ONE_MAY_RISE1",
  name = "Only One May Rise",
  description = "Complete the quest 'Only One May Rise' in Blackwing Lair.",
  type = "namedquest",
  questname = "Only One May Rise",
  questhub = "Raid: Blackwing Lair",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 10,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_PURPLE_LOTUS_COLLECTION1",
  name = "Purple Lotus Collection",
  description = "Complete the quest 'Purple Lotus Collection' in Blackwing Lair.",
  type = "namedquest",
  questname = "Purple Lotus Collection",
  questhub = "Raid: Blackwing Lair",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 10,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_SCYTHE_OF_THE_GODDESS1",
  name = "Scythe of the Goddess",
  description = "Complete the quest 'Scythe of the Goddess' in Blackwing Lair.",
  type = "namedquest",
  questname = "Scythe of the Goddess",
  questhub = "Raid: Blackwing Lair",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 10,
  requiredFor = {}
})

-- 🗺️ Molten Core Quests
table.insert(KAMN.achievements, {
  id = "QUEST_ATTUNEMENT_TO_THE_CORE1",
  name = "Attunement to the Core",
  description = "Complete the quest 'Attunement to the Core' in Molten Core.",
  type = "namedquest",
  questname = "Attunement to the Core",
  questhub = "Raid: Molten Core",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 10,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_FAVOR_BLOOD_OF_THE_MOUNTAIN1",
  name = "Favor Amongst the Brotherhood, Blood of the Mountain",
  description = "Complete the quest 'Favor Amongst the Brotherhood: Blood of the Mountain' in Molten Core.",
  type = "namedquest",
  questname = "Favor Amongst the Brotherhood, Blood of the Mountain",
  questhub = "Raid: Molten Core",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 10,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_FAVOR_CORE_LEATHER1",
  name = "Favor Amongst the Brotherhood, Core Leather",
  description = "Complete the quest 'Favor Amongst the Brotherhood: Core Leather' in Molten Core.",
  type = "namedquest",
  questname = "Favor Amongst the Brotherhood, Core Leather",
  questhub = "Raid: Molten Core",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 10,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_SCRYING_GOGGLES1",
  name = "Scrying Goggles? No Problem!",
  description = "Complete the quest 'Scrying Goggles? No Problem!' in Molten Core.",
  type = "namedquest",
  questname = "Scrying Goggles? No Problem!",
  questhub = "Raid: Molten Core",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 10,
  requiredFor = {}
})

-- 🗺️ Naxxramas Quests
table.insert(KAMN.achievements, {
  id = "QUEST_THE_FALL_OF_KELTHUZAD1",
  name = "The Fall of Kel'Thuzad",
  description = "Complete the quest 'The Fall of Kel'Thuzad' in Naxxramas.",
  type = "namedquest",
  questname = "The Fall of Kel'Thuzad",
  questhub = "Raid: Naxxramas",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 10,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_THE_FATE_OF_RAMALADNI1",
  name = "The Fate of Ramaladni",
  description = "Complete the quest 'The Fate of Ramaladni' in Naxxramas.",
  type = "namedquest",
  questname = "The Fate of Ramaladni",
  questhub = "Raid: Naxxramas",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 10,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_THE_ONLY_SONG_I_KNOW1",
  name = "The Only Song I Know...",
  description = "Complete the quest 'The Only Song I Know...' in Naxxramas.",
  type = "namedquest",
  questname = "The Only Song I Know...",
  questhub = "Raid: Naxxramas",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 10,
  requiredFor = {}
})

-- 🗺️ Onyxia's Lair Quest
table.insert(KAMN.achievements, {
  id = "QUEST_THE_FORGING_OF_QUELSERRAR1",
  name = "The Forging of Quel'Serrar",
  description = "Complete the quest 'The Forging of Quel'Serrar' in Onyxia's Lair.",
  type = "namedquest",
  questname = "The Forging of Quel'Serrar",
  questhub = "Raid: Onyxia's Lair",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 10,
  requiredFor = {}
})

-- 🗺️ Ruins of Ahn'Qiraj Quest
table.insert(KAMN.achievements, {
  id = "QUEST_THE_FALL_OF_OSSIRIAN1",
  name = "The Fall of Ossirian",
  description = "Complete the quest 'The Fall of Ossirian' in the Ruins of Ahn'Qiraj.",
  type = "namedquest",
  questname = "The Fall of Ossirian",
  questhub = "Raid: Ruins of Ahn'Qiraj",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 10,
  requiredFor = {}
})
-- 🗺️ Temple of Ahn'Qiraj Quests
table.insert(KAMN.achievements, {
  id = "QUEST_SECRETS_OF_THE_QIRAJI1",
  name = "Secrets of the Qiraji",
  description = "Complete the quest 'Secrets of the Qiraji' in the Temple of Ahn'Qiraj.",
  type = "namedquest",
  questname = "Secrets of the Qiraji",
  questhub = "Raid: Temple of Ahn'Qiraj",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 10,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_MORTAL_CHAMPIONS1",
  name = "Mortal Champions",
  description = "Complete the quest 'Mortal Champions' in the Temple of Ahn'Qiraj.",
  type = "namedquest",
  questname = "Mortal Champions",
  questhub = "Raid: Temple of Ahn'Qiraj",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 10,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_CTHUNS_LEGACY1",
  name = "C'Thun's Legacy",
  description = "Complete the quest 'C'Thun's Legacy' in the Temple of Ahn'Qiraj.",
  type = "namedquest",
  questname = "C'Thun's Legacy",
  questhub = "Raid: Temple of Ahn'Qiraj",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 10,
  requiredFor = {}
})

-- 🗺️ Zul'Gurub Quests
table.insert(KAMN.achievements, {
  id = "QUEST_A_BIJOU_FOR_ZANZA1",
  name = "A Bijou for Zanza",
  description = "Complete the quest 'A Bijou for Zanza' in Zul'Gurub.",
  type = "namedquest",
  questname = "A Bijou for Zanza",
  questhub = "Raid: Zul'Gurub",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 10,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_A_COLLECTION_OF_HEADS1",
  name = "A Collection of Heads",
  description = "Complete the quest 'A Collection of Heads' in Zul'Gurub.",
  type = "namedquest",
  questname = "A Collection of Heads",
  questhub = "Raid: Zul'Gurub",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 10,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_CONFRONT_YEHKINYA1",
  name = "Confront Yeh'kinya",
  description = "Complete the quest 'Confront Yeh'kinya' in Zul'Gurub.",
  type = "namedquest",
  questname = "Confront Yeh'kinya",
  questhub = "Raid: Zul'Gurub",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 10,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_ESSENCE_MANGOES1",
  name = "Essence Mangoes",
  description = "Complete the quest 'Essence Mangoes' in Zul'Gurub.",
  type = "namedquest",
  questname = "Essence Mangoes",
  questhub = "Raid: Zul'Gurub",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 10,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_GURUBASHI_VILEBRANCH_WITHERBARK_COINS1",
  name = "Gurubashi, Vilebranch, and Witherbark Coins",
  description = "Complete the quest 'Gurubashi, Vilebranch, and Witherbark Coins' in Zul'Gurub.",
  type = "namedquest",
  questname = "Gurubashi, Vilebranch, and Witherbark Coins",
  questhub = "Raid: Zul'Gurub",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 10,
  requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_NATS_MEASURING_TAPE1",
  name = "Nat's Measuring Tape",
  description = "Complete the quest 'Nat's Measuring Tape' in Zul'Gurub.",
  type = "namedquest",
  questname = "Nat's Measuring Tape",
  questhub = "Raid: Zul'Gurub",
  value = 1,
  progress = 0,
  complete = false,
  category = "Quests",
  points = 10,
  requiredFor = {}
})

-- 🛠 Blackrock Depths – Königliche Questkette (eigener Hub)
table.insert(KAMN.achievements, { id="QUEST_COMMANDER_GORSHAK_BRD1", name="Commander Gor'shak",
  description="Complete the quest 'Commander Gor'shak' in Blackrock Depths.", type="namedquest",
  questname="Commander Gor'shak", questhub="Blackrock Depths", value=1, progress=0, complete=false,
  category="Quests", points=5, requiredFor={} })

table.insert(KAMN.achievements, { id="QUEST_THE_ROYAL_RESCUE_BRD1", name="The Royal Rescue",
  description="Complete the quest 'The Royal Rescue' in Blackrock Depths.", type="namedquest",
  questname="The Royal Rescue", questhub="Blackrock Depths", value=1, progress=0, complete=false,
  category="Quests", points=5, requiredFor={} })

table.insert(KAMN.achievements, { id="QUEST_THE_EASTERN_KINGDOMS_BRD1", name="The Eastern Kingdoms",
  description="Complete the quest 'The Eastern Kingdoms' in Blackrock Depths.", type="namedquest",
  questname="The Eastern Kingdoms", questhub="Blackrock Depths", value=1, progress=0, complete=false,
  category="Quests", points=5, requiredFor={} })

table.insert(KAMN.achievements, { id="QUEST_THE_PRINCESS_SAVED_BRD1", name="The Princess Saved?",
  description="Complete the quest 'The Princess Saved?' in Blackrock Depths.", type="namedquest",
  questname="The Princess Saved?", questhub="Blackrock Depths", value=1, progress=0, complete=false,
  category="Quests", points=5, requiredFor={} })

table.insert(KAMN.achievements, { id="QUEST_KHARAN_MIGHTHHAMMER_BRD1", name="Kharan Mighthammer",
  description="Complete the quest 'Kharan Mighthammer' in Blackrock Depths.", type="namedquest",
  questname="Kharan Mighthammer", questhub="Blackrock Depths", value=1, progress=0, complete=false,
  category="Quests", points=5, requiredFor={} })

table.insert(KAMN.achievements, { id="QUEST_KHARANS_TALE_BRD1", name="Kharan's Tale",
  description="Complete the quest 'Kharan's Tale' in Blackrock Depths.", type="namedquest",
  questname="Kharan's Tale", questhub="Blackrock Depths", value=1, progress=0, complete=false,
  category="Quests", points=5, requiredFor={} })

table.insert(KAMN.achievements, { id="QUEST_BEARER_OF_BAD_NEWS_BRD1", name="The Bearer of Bad News",
  description="Complete the quest 'The Bearer of Bad News' in Blackrock Depths.", type="namedquest",
  questname="The Bearer of Bad News", questhub="Blackrock Depths", value=1, progress=0, complete=false,
  category="Quests", points=5, requiredFor={} })

table.insert(KAMN.achievements, { id="QUEST_FATE_OF_THE_KINGDOM_BRD1", name="The Fate of the Kingdom",
  description="Complete the quest 'The Fate of the Kingdom' in Blackrock Depths.", type="namedquest",
  questname="The Fate of the Kingdom", questhub="Blackrock Depths", value=1, progress=0, complete=false,
  category="Quests", points=5, requiredFor={} })

table.insert(KAMN.achievements, { id="QUEST_PRINCESSS_SURPRISE_BRD1", name="The Princess's Surprise",
  description="Complete the quest 'The Princess's Surprise' in Blackrock Depths.", type="namedquest",
  questname="The Princess's Surprise", questhub="Blackrock Depths", value=1, progress=0, complete=false,
  category="Quests", points=5, requiredFor={} })
-- 🌲 Teldrassil – Iconic Starting Zone Quests
table.insert(KAMN.achievements, {
  id = "QUEST_RELLIAN_GREENSPYRE_TEL1",
  name = "Rellian Greenspyre",
  description = "Aid the druid and complete the quest 'Rellian Greenspyre' in Teldrassil.",
  type = "namedquest",
  questname = "Rellian Greenspyre",
  questhub = "Teldrassil",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_MOONTOUCHED_WILDKIN_TEL1",
  name = "Moontouched Wildkin",
  description = "Protect the sacred and complete the quest 'Moontouched Wildkin' in Teldrassil.",
  type = "namedquest",
  questname = "Moontouched Wildkin",
  questhub = "Teldrassil",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})
