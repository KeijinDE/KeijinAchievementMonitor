-- achievements_Defeats.lua
-- Combat Achievements: Defeats, Named Defeats, Bosses (English only)

KAMN = KAMN or {}
KAMN.achievements = KAMN.achievements or {}

------------------------------------------------------
-- Named Kills (Common, Starter Zones, Animals, Mobs)
------------------------------------------------------
-- Critter Kills – Einzelziele
table.insert(KAMN.achievements, {
  id = "KILL_SQUIRREL1",
  name = "Squirrel Sniper",
  description = "Kill a Squirrel somewhere in the woods.",
  type = "namedkill",
  targetname = "Squirrel",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = { "" },
})
table.insert(KAMN.achievements, {
  id = "KILL_Rat1",
  name = "Rat Controll",
  description = "Kill a Rat.",
  type = "namedkill",
  targetname = "Rat",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = { "" },
})
table.insert(KAMN.achievements, {
  id = "KILL_Roach1",
  name = "Roach Sniper",
  description = "Kill a Roach.",
  type = "namedkill",
  targetname = "Roach",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = { "" },
})
table.insert(KAMN.achievements, {
  id = "KILL_SHEEP1",
  name = "Woolly Mistake",
  description = "Kill a Sheep somewhere in Azeroth.",
  type = "namedkill",
  targetname = "Sheep",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = { "" },
})

table.insert(KAMN.achievements, {
  id = "KILL_CAT1",
  name = "Nine Lives? Not Today.",
  description = "Kill a Cat in a city or village.",
  type = "namedkill",
  targetname = "Cat",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = { "" },
})

table.insert(KAMN.achievements, {
  id = "KILL_RABBIT1",
  name = "No More Rabbits",
  description = "Kill a Rabbit near Elwynn or Tirisfal.",
  type = "namedkill",
  targetname = "Rabbit",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = { "" },
})

table.insert(KAMN.achievements, {
  id = "KILL_FROG1",
  name = "Slimy Encounter",
  description = "Kill a Frog in the swamps or wetlands.",
  type = "namedkill",
  targetname = "Frog",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = { "" },
})

table.insert(KAMN.achievements, {
  id = "KILL_SNAKE1",
  name = "Hiss Stopper",
  description = "Kill a Snake in the desert or jungle.",
  type = "namedkill",
  targetname = "Snake",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = { "" },
})

table.insert(KAMN.achievements, {
  id = "KILL_CHICKEN1",
  name = "Feathered Fiend",
  description = "Kill a Chicken near a farmhouse.",
  type = "namedkill",
  targetname = "Chicken",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = { "" },
})

table.insert(KAMN.achievements, {
  id = "KILL_COW1",
  name = "Udder Chaos",
  description = "Kill a Cow in the fields of Elwynn or Mulgore.",
  type = "namedkill",
  targetname = "Cow",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = { "" },
})

table.insert(KAMN.achievements, {
  id = "KILL_DEER1",
  name = "Not So Bambi",
  description = "Kill a Deer wandering the forests.",
  type = "namedkill",
  targetname = "Deer",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = { "" },
})

table.insert(KAMN.achievements, {
  id = "KILL_PRAIRIEDOG1",
  name = "Prairie Dog Exterminator",
  description = "Kill a Prairie Dog in Mulgore or Barrens.",
  type = "namedkill",
  targetname = "Prairie Dog",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = { "" },
})

table.insert(KAMN.achievements, {
  id = "KILL_PLAINSTRIDER1",
  name = "Bird Breakfast",
  description = "Defeat 1 Plainstrider in Red Cloud Mesa.",
  type = "namedkill",
  targetname = "Plainstrider",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_PLAINSTRIDER10",
  name = "Bird Lunch",
  description = "Defeat 10 Plainstriders in Red Cloud Mesa.",
  type = "namedkill",
  targetname = "Plainstrider",
  value = 10,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_PLAINSTRIDER20",
  name = "Bird Dinner",
  description = "Defeat 20 Plainstriders in Red Cloud Mesa.",
  type = "namedkill",
  targetname = "Plainstrider",
  value = 20,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_DUSKBAT10",
  name = "Duskbat Slayer",
  description = "Defeat 10 Duskbats.",
  type = "namedkill",
  targetname = "Duskbat",
  value = 10,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_MURLOCNIGHT",
  name = "Fishy Business",
  description = "Defeat a Murloc Nightcrawler near the coasts of Westfall.",
  type = "namedkill",
  targetname = "Murloc Nightcrawler",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_LURKINGSHADOW",
  name = "Shadow Unseen",
  description = "Defeat a Lurking Shadow in Tirisfal Glades.",
  type = "namedkill",
  targetname = "Lurking Shadow",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_BRISTLEBACK1",
  name = "Bristleback Trouble",
  description = "Defeat 1 Bristleback Quilboar.",
  type = "namedkill",
  targetname = "Bristleback Quilboar",
  value = 1,
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
  type = "namedkill",
  targetname = "Bristleback Quilboar",
  value = 15,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_BLACKRAT1",
  name = "Pest Controll",
  description = "Kill a Black Rat deep inside a dungeon.",
  type = "namedkill",
  targetname = "Black Rat",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 10,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_ADDER1",
  name = "Adder Annihilator",
  description = "Kill an Adder somewhere in the wild.",
  type = "namedkill",
  targetname = "Adder",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_TOAD1",
  name = "No Time for Toads",
  description = "Kill a Toad near the water's edge.",
  type = "namedkill",
  targetname = "Toad",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_FAWN1",
  name = "Forest Heartbreaker",
  description = "Kill a Fawn wandering the woods.",
  type = "namedkill",
  targetname = "Fawn",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})
------------------------------------------------------
-- Named Kill Bosses / Elites
------------------------------------------------------

table.insert(KAMN.achievements, {
  id = "KILL_HOGGER",
  name = "Justice for Elwynn",
  description = "Defeat Hogger, the terror of Elwynn Forest.",
  type = "namedkill",
  targetname = "Hogger",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 10,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_BELLYGRUB",
  name = "Boarbecue",
  description = "Defeat Bellygrub, the infamous gluttonous boar.",
  type = "namedkill",
  targetname = "Bellygrub",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_VANCLEEF",
  name = "Brotherhood Broken",
  description = "Defeat Edwin VanCleef, leader of the Defias Brotherhood.",
  type = "namedkill",
  targetname = "Edwin VanCleef",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 10,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "BOSS_SHARPTUSK",
  name = "Sharptusk Falls",
  description = "Defeat Chief Sharptusk Thornmantle.",
  type = "namedkill",
  targetname = "Chief Sharptusk Thornmantle",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 10,
  requiredFor = {},
})

------------------------------------------------------
-- Named Kill Bosses – Classic Raid Targets
------------------------------------------------------

table.insert(KAMN.achievements, {
  id = "KILL_RAGNAROS",
  name = "The Firelord Falls",
  description = "Defeat Ragnaros, the Firelord of Molten Core.",
  type = "bosskill",
  targetname = "Ragnaros",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 20,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_NEFARIAN",
  name = "End of the Blackwing",
  description = "Defeat Nefarian in Blackwing Lair.",
  type = "bosskill",
  targetname = "Nefarian",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 20,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_CTHUN",
  name = "Eye for an Eye",
  description = "Defeat C'Thun in the Temple of Ahn'Qiraj.",
  type = "bosskill",
  targetname = "C'Thun",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 25,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_KELTHUZAD",
  name = "The Lich's End",
  description = "Defeat Kel'Thuzad in Naxxramas.",
  type = "bosskill",
  targetname = "Kel'Thuzad",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 25,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_ONYXIA",
  name = "Onyxia's Head Delivered",
  description = "Defeat Onyxia in her lair.",
  type = "bosskill",
  targetname = "Onyxia",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 15,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_HAKKAR",
  name = "The Soulflayer's Doom",
  description = "Defeat Hakkar the Soulflayer in Zul'Gurub.",
  type = "bosskill",
  targetname = "Hakkar",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 15,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_MANDOKIR",
  name = "Heads Will Roll",
  description = "Defeat Bloodlord Mandokir in Zul'Gurub.",
  type = "bosskill",
  targetname = "Bloodlord Mandokir",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 10,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_JINDO",
  name = "Hex Breaker",
  description = "Defeat Jin'do the Hexxer in Zul'Gurub.",
  type = "bosskill",
  targetname = "Jin'do the Hexxer",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 10,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_AZUREGOS",
  name = "Blue Dragon Down",
  description = "Defeat the world boss Azuregos in Azshara.",
  type = "bosskill",
  targetname = "Azuregos",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 15,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "KILL_KAZZAK",
  name = "Lord of Doom",
  description = "Defeat Lord Kazzak in the Blasted Lands.",
  type = "bosskill",
  targetname = "Lord Kazzak",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 15,
  requiredFor = {},
})
