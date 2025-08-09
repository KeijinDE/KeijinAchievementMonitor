--achievements_quests_named_profession.lua

-- achievements\quests\achievements_quests_named_professions.lua
-- Profession Quest Achievements (namedquest) – questhub = Profession

KAMN = KAMN or {}
KAMN.achievements = KAMN.achievements or {}

-- =========================
-- 🔬 Alchemy
-- =========================
table.insert(KAMN.achievements, {
  id = "QUEST_AN_UNCOMMON_REQUEST1",
  name = "An Uncommon Request",
  description = "Complete the quest 'An Uncommon Request'. Seek out alchemists across Azeroth for rare reagents.",
  type = "namedquest",
  questname = "An Uncommon Request",
  questhub = "Alchemy",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_ELIXIRS_FOR_THE_BLADELEAFS_ALLIANCE1",
  name = "Elixirs for the Bladeleafs",
  description = "Complete the quest 'Elixirs for the Bladeleafs' for the Alliance, assisting the Bladeleaf family in night elven lands (Alliance).",
  type = "namedquest",
  questname = "Elixirs for the Bladeleafs",
  questhub = "Alchemy",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})


-- =========================
-- ⚒ Blacksmithing
-- =========================
table.insert(KAMN.achievements, {
  id = "QUEST_SWEET_SERENITY1",
  name = "Sweet Serenity",
  description = "Complete the quest 'Sweet Serenity'. Prove your mettle at the forge and deliver masterwork steel.",
  type = "namedquest",
  questname = "Sweet Serenity",
  questhub = "Blacksmithing",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_BOOTY_BAY_OR_BUST1",
  name = "Booty Bay or Bust!",
  description = "Complete the quest 'Booty Bay or Bust!'. Book passage to Booty Bay in Stranglethorn Vale and see the deal through.",
  type = "namedquest",
  questname = "Booty Bay or Bust!",
  questhub = "Blacksmithing",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_SUPPLYING_THE_FRONT_ALLIANCE1",
  name = "Supplying the Front",
  description = "Complete the quest 'Supplying the Front' (Alliance). Support military efforts with forged supplies for the front lines (Alliance).",
  type = "namedquest",
  questname = "Supplying the Front",
  questhub = "Blacksmithing",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_GEARING_REDRIDGE_ALLIANCE1",
  name = "Gearing Redridge",
  description = "Complete the quest 'Gearing Redridge' in Redridge Mountains, outfitting the locals for defense (Alliance).",
  type = "namedquest",
  questname = "Gearing Redridge",
  questhub = "Blacksmithing",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_HORNS_OF_FRENZY_HORDE1",
  name = "Horns of Frenzy",
  description = "Complete the quest 'Horns of Frenzy'. Hunt for the required trophies and deliver them to the smiths of the Horde (Horde).",
  type = "namedquest",
  questname = "Horns of Frenzy",
  questhub = "Blacksmithing",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_JOYS_OF_OMOSH_HORDE1",
  name = "Joys of Omosh",
  description = "Complete the quest 'Joys of Omosh' in Orgrimmar’s forge quarter, honoring an orcish smithing tradition (Horde).",
  type = "namedquest",
  questname = "Joys of Omosh",
  questhub = "Blacksmithing",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})


-- =========================
-- 🍳 Cooking
-- =========================
table.insert(KAMN.achievements, {
  id = "QUEST_CLAMLETTE_SURPRISE1",
  name = "Clamlette Surprise",
  description = "Complete the quest 'Clamlette Surprise' in Gadgetzan, Tanaris. Impress Dirge Quikcleave with your culinary skill.",
  type = "namedquest",
  questname = "Clamlette Surprise",
  questhub = "Cooking",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_DESERT_RECIPE1",
  name = "Desert Recipe",
  description = "Complete the quest 'Desert Recipe' in Tanaris. Acquire the secrets of dune-born delicacies in Gadgetzan.",
  type = "namedquest",
  questname = "Desert Recipe",
  questhub = "Cooking",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_KITCHEN_ASSISTANCE1",
  name = "Kitchen Assistance",
  description = "Complete the quest 'Kitchen Assistance'. Lend a hand in a bustling city kitchen and learn a chef’s tricks.",
  type = "namedquest",
  questname = "Kitchen Assistance",
  questhub = "Cooking",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_SHARING_THE_KNOWLEDGE1",
  name = "Sharing the Knowledge",
  description = "Complete the quest 'Sharing the Knowledge'. Pass on culinary wisdom gathered from cooks across Azeroth.",
  type = "namedquest",
  questname = "Sharing the Knowledge",
  questhub = "Cooking",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})

-- Tel'Abim Series (Turtle content)
table.insert(KAMN.achievements, {
  id = "QUEST_DANONZOS_TELABIM_DELIGHT1",
  name = "Danonzo's Tel'Abim Delight",
  description = "Complete the quest 'Danonzo's Tel'Abim Delight'. Travel to Tel'Abim and craft a fruity feast.",
  type = "namedquest",
  questname = "Danonzo's Tel'Abim Delight",
  questhub = "Cooking",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_DANONZOS_TELABIM_MEDLEY1",
  name = "Danonzo's Tel'Abim Medley",
  description = "Complete the quest 'Danonzo's Tel'Abim Medley' on Tel'Abim, blending island flavors into a rich medley.",
  type = "namedquest",
  questname = "Danonzo's Tel'Abim Medley",
  questhub = "Cooking",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_DANONZOS_TELABIM_SURPRISE1",
  name = "Danonzo's Tel'Abim Surprise",
  description = "Complete the quest 'Danonzo's Tel'Abim Surprise' on Tel'Abim. Sweet, sticky, and absolutely unforgettable.",
  type = "namedquest",
  questname = "Danonzo's Tel'Abim Surprise",
  questhub = "Cooking",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})


-- =========================
-- ⚙ Engineering
-- =========================
table.insert(KAMN.achievements, {
  id = "QUEST_FLASH_BOMB_RECIPE1",
  name = "Flash Bomb Recipe",
  description = "Complete the quest 'Flash Bomb Recipe'. Consult engineering circles in major cities for the schematics.",
  type = "namedquest",
  questname = "Flash Bomb Recipe",
  questhub = "Engineering",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_GOBLIN_ENGINEERING1",
  name = "Goblin Engineering",
  description = "Complete the quest 'Goblin Engineering' in Gadgetzan, Tanaris. Swear fealty to explosive innovation.",
  type = "namedquest",
  questname = "Goblin Engineering",
  questhub = "Engineering",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_SHOW_YOUR_WORK1",
  name = "Show Your Work",
  description = "Complete the quest 'Show Your Work'. Present your crafted gizmos to specialization masters in Gadgetzan or Booty Bay.",
  type = "namedquest",
  questname = "Show Your Work",
  questhub = "Engineering",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_THE_PLEDGE_OF_SECRECY1",
  name = "The Pledge of Secrecy",
  description = "Complete the quest 'The Pledge of Secrecy'. Take the oath before goblin or gnomish engineers in neutral ports.",
  type = "namedquest",
  questname = "The Pledge of Secrecy",
  questhub = "Engineering",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})


-- =========================
-- 🩹 First Aid
-- =========================
table.insert(KAMN.achievements, {
  id = "QUEST_TRIAGE1",
  name = "Triage",
  description = "Complete the quest 'Triage'. Report to field medics at Theramore (Alliance) or Hammerfall (Horde) for emergency training.",
  type = "namedquest",
  questname = "Triage",
  questhub = "First Aid",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_HORDE_TRAUMA_HORDE1",
  name = "Horde Trauma",
  description = "Complete the quest 'Horde Trauma' (Horde). Begin your medical certification under Horde physicians.",
  type = "namedquest",
  questname = "Horde Trauma",
  questhub = "First Aid",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_ALLIANCE_TRAUMA_ALLIANCE1",
  name = "Alliance Trauma",
  description = "Complete the quest 'Alliance Trauma' (Alliance). Begin your medical certification under Alliance surgeons.",
  type = "namedquest",
  questname = "Alliance Trauma",
  questhub = "First Aid",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})


-- =========================
-- 🎣 Fishing
-- =========================
table.insert(KAMN.achievements, {
  id = "QUEST_APPRENTICE_ANGLER1",
  name = "Apprentice Angler",
  description = "Complete the quest 'Apprentice Angler'. Visit fishing trainers along the coasts and lakes of Azeroth.",
  type = "namedquest",
  questname = "Apprentice Angler",
  questhub = "Fishing",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_COULD_I_GET_A_FISHING_FLIER1",
  name = "Could I get a Fishing Flier?",
  description = "Complete the quest 'Could I get a Fishing Flier?'. Promote the joy of angling in bustling Alliance hubs (Alliance).",
  type = "namedquest",
  questname = "Could I get a Fishing Flier?",
  questhub = "Fishing",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})

-- STV / Booty Bay themed (Alliance-marked where specified)
table.insert(KAMN.achievements, {
  id = "QUEST_ELECTROPELLERS_ALLIANCE1",
  name = "Electropellers",
  description = "Complete the quest 'Electropellers' in Booty Bay, Stranglethorn Vale (Alliance). Deliver the gadgetry for the angling event.",
  type = "namedquest",
  questname = "Electropellers",
  questhub = "Fishing",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_GAFFER_JACKS_ALLIANCE1",
  name = "Gaffer Jacks",
  description = "Complete the quest 'Gaffer Jacks' in Booty Bay, Stranglethorn Vale (Alliance). Fetch specialized hooks for eager anglers.",
  type = "namedquest",
  questname = "Gaffer Jacks",
  questhub = "Fishing",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_I_GOT_NOTHIN_LEFT_ALLIANCE1",
  name = "I Got Nothin' Left!",
  description = "Complete the quest 'I Got Nothin' Left!' in Booty Bay, Stranglethorn Vale (Alliance). Help a burnt‑out fisherman start over.",
  type = "namedquest",
  questname = "I Got Nothin' Left!",
  questhub = "Fishing",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})

-- Tournament / High-profile
table.insert(KAMN.achievements, {
  id = "QUEST_MASTER_ANGLER1",
  name = "Master Angler",
  description = "Complete the quest 'Master Angler' by claiming victory in the Stranglethorn Fishing Extravaganza in Booty Bay.",
  type = "namedquest",
  questname = "Master Angler",
  questhub = "Fishing",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_NAT_PAGLE_ANGLER_EXTREME1",
  name = "Nat Pagle, Angler Extreme",
  description = "Complete the quest 'Nat Pagle, Angler Extreme' on the coast of Dustwallow Marsh. Earn the blessing of Azeroth’s most famous angler.",
  type = "namedquest",
  questname = "Nat Pagle, Angler Extreme",
  questhub = "Fishing",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})

-- Rare Fish (STV Derby)
table.insert(KAMN.achievements, {
  id = "QUEST_RARE_FISH_BROWNELLS_BLUE_STRIPED_RACER1",
  name = "Rare Fish - Brownell's Blue Striped Racer",
  description = "Complete the quest 'Rare Fish - Brownell's Blue Striped Racer' during the Stranglethorn Fishing Extravaganza in Booty Bay.",
  type = "namedquest",
  questname = "Rare Fish - Brownell's Blue Striped Racer",
  questhub = "Fishing",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_RARE_FISH_DEZIAN_QUEENFISH1",
  name = "Rare Fish - Dezian Queenfish",
  description = "Complete the quest 'Rare Fish - Dezian Queenfish' during the Stranglethorn Fishing Extravaganza in Booty Bay.",
  type = "namedquest",
  questname = "Rare Fish - Dezian Queenfish",
  questhub = "Fishing",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_RARE_FISH_KEEFERS_ANGELFISH1",
  name = "Rare Fish - Keefer's Angelfish",
  description = "Complete the quest 'Rare Fish - Keefer's Angelfish' during the Stranglethorn Fishing Extravaganza in Booty Bay.",
  type = "namedquest",
  questname = "Rare Fish - Keefer's Angelfish",
  questhub = "Fishing",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_YOU_TOO_GOOD_HORDE1",
  name = "You Too Good.",
  description = "Complete the quest 'You Too Good.' for the Horde. Prove your worth to grizzled anglers of the Horde (Horde).",
  type = "namedquest",
  questname = "You Too Good.",
  questhub = "Fishing",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})


-- =========================
-- 🌿 Herbalism
-- =========================
table.insert(KAMN.achievements, {
  id = "QUEST_ROOT_SAMPLES1",
  name = "Root Samples",
  description = "Complete the quest 'Root Samples'. Assist herbalists by gathering specimens from the wilds of Azeroth.",
  type = "namedquest",
  questname = "Root Samples",
  questhub = "Herbalism",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})


-- =========================
-- 🐺 Leatherworking
-- =========================
table.insert(KAMN.achievements, {
  id = "QUEST_DRAGONSCALE_LEATHERWORKING1",
  name = "Dragonscale Leatherworking",
  description = "Complete the quest 'Dragonscale Leatherworking'. Seek specialization masters in places like Azshara or the Badlands.",
  type = "namedquest",
  questname = "Dragonscale Leatherworking",
  questhub = "Leatherworking",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_ELEMENTAL_LEATHERWORKING1",
  name = "Elemental Leatherworking",
  description = "Complete the quest 'Elemental Leatherworking'. Pledge to the elemental way under expert tutelage in the wilds.",
  type = "namedquest",
  questname = "Elemental Leatherworking",
  questhub = "Leatherworking",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_MASTER_OF_THE_WILD_LEATHER1",
  name = "Master of the Wild Leather",
  description = "Complete the quest 'Master of the Wild Leather' in Feralas. Prove mastery to renowned leatherworkers in Feathermoon or Camp Mojache.",
  type = "namedquest",
  questname = "Master of the Wild Leather",
  questhub = "Leatherworking",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_TRIBAL_LEATHERWORKING1",
  name = "Tribal Leatherworking",
  description = "Complete the quest 'Tribal Leatherworking'. Learn ancestral methods from tribal mentors in Azeroth’s jungles.",
  type = "namedquest",
  questname = "Tribal Leatherworking",
  questhub = "Leatherworking",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})

-- Wild Leather Set (Feralas chain – both factions)
table.insert(KAMN.achievements, {
  id = "QUEST_WILD_LEATHER_ARMOR1",
  name = "Wild Leather Armor",
  description = "Complete the quest 'Wild Leather Armor' in Feralas. Craft set pieces for famed artisans.",
  type = "namedquest",
  questname = "Wild Leather Armor",
  questhub = "Leatherworking",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_WILD_LEATHER_BOOTS1",
  name = "Wild Leather Boots",
  description = "Complete the quest 'Wild Leather Boots' in Feralas, aiding either Feathermoon or Camp Mojache craftsmen.",
  type = "namedquest",
  questname = "Wild Leather Boots",
  questhub = "Leatherworking",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_WILD_LEATHER_HELMET1",
  name = "Wild Leather Helmet",
  description = "Complete the quest 'Wild Leather Helmet' in Feralas. Shape sturdy helms from prime hides.",
  type = "namedquest",
  questname = "Wild Leather Helmet",
  questhub = "Leatherworking",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_WILD_LEATHER_LEGGINGS1",
  name = "Wild Leather Leggings",
  description = "Complete the quest 'Wild Leather Leggings' in Feralas. Stitch agile legwear for the Wild Leather set.",
  type = "namedquest",
  questname = "Wild Leather Leggings",
  questhub = "Leatherworking",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_WILD_LEATHER_SHOULDERS1",
  name = "Wild Leather Shoulders",
  description = "Complete the quest 'Wild Leather Shoulders' in Feralas, perfecting weighted pauldrons from resilient leather.",
  type = "namedquest",
  questname = "Wild Leather Shoulders",
  questhub = "Leatherworking",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_WILD_LEATHER_VEST1",
  name = "Wild Leather Vest",
  description = "Complete the quest 'Wild Leather Vest' in Feralas. Deliver a finely‑stitched core piece for the set.",
  type = "namedquest",
  questname = "Wild Leather Vest",
  questhub = "Leatherworking",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})


-- =========================
-- 🧵 Tailoring
-- =========================
table.insert(KAMN.achievements, {
  id = "QUEST_SHADOWEAVER1",
  name = "Shadoweaver",
  description = "Complete the quest 'Shadoweaver'. Consult tailors versed in shadowy weaves in Azeroth’s great cities.",
  type = "namedquest",
  questname = "Shadoweaver",
  questhub = "Tailoring",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_THE_UNDERMARKET1",
  name = "The Undermarket",
  description = "Complete the quest 'The Undermarket'. Track elusive cloth traders in hidden markets beneath the streets.",
  type = "namedquest",
  questname = "The Undermarket",
  questhub = "Tailoring",
  value = 1, progress = 0, complete = false,
  category = "Quests", points = 5, requiredFor = {}
})
