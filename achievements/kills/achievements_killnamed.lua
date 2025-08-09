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
  type = "kill",
  alttype = "mob",
  targetname = "Squirrel",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = { "" },
})
table.insert(KAMN.achievements, {
  id = "KILL_HARE1",
  name = "Hare, no more! ",
  description = "Kill a Hare.",
  type = "kill",
  alttype = "mob",
  targetname = "Hare",
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
  type = "kill",
  alttype = "mob",
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
  type = "kill",
  alttype = "mob",
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
  type = "kill",
  alttype = "mob",
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
  type = "kill",
  alttype = "mob",
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
  type = "kill",
  alttype = "mob",
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
  type = "kill",
  alttype = "mob",
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
  type = "kill",
  alttype = "mob",
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
  type = "kill",
  alttype = "mob",
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
  type = "kill",
  alttype = "mob",
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
  type = "kill",
  alttype = "mob",
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
  type = "kill",
  alttype = "mob",
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
  type = "kill",
  alttype = "mob",
  targetname = "Plainstrider",
  value = 1,
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
  type = "kill",
  alttype = "mob",
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
  type = "kill",
  alttype = "mob",
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
  type = "kill",
  alttype = "mob",
  targetname = "Bristleback Quilboar",
  value = 1,
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
  type = "kill",
  alttype = "mob",
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
  type = "kill",
  alttype = "mob",
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
  type = "kill",
  alttype = "mob",
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
  type = "kill",
  alttype = "mob",
  targetname = "Fawn",
  value = 1,
  progress = 0,
  complete = false,
  category = "Combat",
  points = 5,
  requiredFor = {},
})
