--achievements_quests_named_classes.lua

-- achievements\quests\achievements_quests_named_class.lua
-- Class Quest Achievements (namedquest) – questhub = Class

KAMN = KAMN or {}
KAMN.achievements = KAMN.achievements or {}

-- =========================
-- 🌿 Druid
-- =========================
table.insert(KAMN.achievements, {
  id = "QUEST_VERDANT_NOTE_HORDE1",
  name = "Verdant Note",
  description = "Complete the quest 'Verdant Note' by reporting to your druid trainer in the Horde starting lands (Horde).",
  type = "namedquest",
  questname = "Verdant Note",
  questhub = "Druid",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_VERDANT_SIGIL_ALLIANCE1",
  name = "Verdant Sigil",
  description = "Complete the quest 'Verdant Sigil' by visiting the druid trainers in Teldrassil/Darnassus (Alliance).",
  type = "namedquest",
  questname = "Verdant Sigil",
  questhub = "Druid",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_BACK_TO_DARNASSUS_ALLIANCE1",
  name = "Back to Darnassus",
  description = "Complete the quest 'Back to Darnassus' by returning to the Temple of the Moon to consult the Circle (Alliance).",
  type = "namedquest",
  questname = "Back to Darnassus",
  questhub = "Druid",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_BACK_TO_THUNDER_BLUFF_HORDE1",
  name = "Back to Thunder Bluff",
  description = "Complete the quest 'Back to Thunder Bluff' by seeking guidance at Elder Rise (Horde).",
  type = "namedquest",
  questname = "Back to Thunder Bluff",
  questhub = "Druid",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_HEEDING_THE_CALL1",
  name = "Heeding the Call",
  description = "Complete the quest 'Heeding the Call' by answering your druid trainer’s summons in the nearest capital.",
  type = "namedquest",
  questname = "Heeding the Call",
  questhub = "Druid",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_CURING_THE_SICK1",
  name = "Curing the Sick",
  description = "Complete the quest 'Curing the Sick' by gathering antidotes and aiding the afflicted in the wilds.",
  type = "namedquest",
  questname = "Curing the Sick",
  questhub = "Druid",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_A_LESSON_TO_LEARN1",
  name = "A Lesson to Learn",
  description = "Complete the quest 'A Lesson to Learn' by returning to your druid master for further teachings.",
  type = "namedquest",
  questname = "A Lesson to Learn",
  questhub = "Druid",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_AQUATIC_FORM1",
  name = "Aquatic Form",
  description = "Complete the quest 'Aquatic Form' by retrieving sacred items from distant waters to earn your shapeshift.",
  type = "namedquest",
  questname = "Aquatic Form",
  questhub = "Druid",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_POWER_OVER_POISON1",
  name = "Power over Poison",
  description = "Complete the quest 'Power over Poison' by brewing a potent cure under your druid trainer’s guidance.",
  type = "namedquest",
  questname = "Power over Poison",
  questhub = "Druid",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_TOXIC_TEST1",
  name = "Toxic Test",
  description = "Complete the quest 'Toxic Test' by testing antidotes against venomous threats in the field.",
  type = "namedquest",
  questname = "Toxic Test",
  questhub = "Druid",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

-- =========================
-- 🏹 Hunter
-- =========================
table.insert(KAMN.achievements, {
  id = "QUEST_BATSKIN_LETTER_HORDE1",
  name = "Batskin Letter",
  description = "Complete the quest 'Batskin Letter' by reporting to your hunter trainer in the Horde starting lands (Horde).",
  type = "namedquest",
  questname = "Batskin Letter",
  questhub = "Hunter",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_ETCHED_NOTE_HORDE1",
  name = "Etched Note",
  description = "Complete the quest 'Etched Note' by visiting the hunter trainer in your Horde starting zone (Horde).",
  type = "namedquest",
  questname = "Etched Note",
  questhub = "Hunter",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_ETCHED_PARCHMENT_HORDE1",
  name = "Etched Parchment",
  description = "Complete the quest 'Etched Parchment' by seeking guidance from a Horde hunter trainer (Horde).",
  type = "namedquest",
  questname = "Etched Parchment",
  questhub = "Hunter",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

-- (duplicate names consolidated as Alliance variants)
table.insert(KAMN.achievements, {
  id = "QUEST_ETCHED_RUNE_ALLIANCE1",
  name = "Etched Rune",
  description = "Complete the quest 'Etched Rune' by consulting the hunter trainers in Alliance starting zones (Alliance).",
  type = "namedquest",
  questname = "Etched Rune",
  questhub = "Hunter",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_ETCHED_SIGIL_ALLIANCE1",
  name = "Etched Sigil",
  description = "Complete the quest 'Etched Sigil' by meeting your hunter trainer in Alliance territory (Alliance).",
  type = "namedquest",
  questname = "Etched Sigil",
  questhub = "Hunter",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_ETCHED_TABLET_HORDE1",
  name = "Etched Tablet",
  description = "Complete the quest 'Etched Tablet' by reporting to a hunter trainer in Kalimdor’s Horde lands (Horde).",
  type = "namedquest",
  questname = "Etched Tablet",
  questhub = "Hunter",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_TAMING_THE_BEAST1",
  name = "Taming the Beast",
  description = "Complete the quest 'Taming the Beast' by proving dominance over wild creatures under your trainer’s eye.",
  type = "namedquest",
  questname = "Taming the Beast",
  questhub = "Hunter",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_THE_HUNTERS_PATH1",
  name = "The Hunter's Path",
  description = "Complete the quest 'The Hunter's Path' by following training across capitals and frontier outposts.",
  type = "namedquest",
  questname = "The Hunter's Path",
  questhub = "Hunter",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

-- =========================
-- ✨ Mage
-- =========================
table.insert(KAMN.achievements, {
  id = "QUEST_FANCY_LETTER1",
  name = "Fancy Letter",
  description = "Complete the quest 'Fancy Letter' by presenting yourself to the arcane order in your starting city.",
  type = "namedquest",
  questname = "Fancy Letter",
  questhub = "Mage",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_GLYPHIC_LETTER_ALLIANCE1",
  name = "Glyphic Letter",
  description = "Complete the quest 'Glyphic Letter' with the magi of the Alliance, beginning your arcane education (Alliance).",
  type = "namedquest",
  questname = "Glyphic Letter",
  questhub = "Mage",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_GLYPHIC_MEMORANDUM_ALLIANCE1",
  name = "Glyphic Memorandum",
  description = "Complete the quest 'Glyphic Memorandum' by reporting to the mage trainers in Alliance territory (Alliance).",
  type = "namedquest",
  questname = "Glyphic Memorandum",
  questhub = "Mage",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_GLYPHIC_RUNE_ALLIANCE1",
  name = "Glyphic Rune",
  description = "Complete the quest 'Glyphic Rune' under the guidance of Alliance spellcasters (Alliance).",
  type = "namedquest",
  questname = "Glyphic Rune",
  questhub = "Mage",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_GLYPHIC_SCROLL_HORDE1",
  name = "Glyphic Scroll",
  description = "Complete the quest 'Glyphic Scroll' by seeking the mage enclave in Horde capitals (Horde).",
  type = "namedquest",
  questname = "Glyphic Scroll",
  questhub = "Mage",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_GLYPHIC_TABLET_HORDE1",
  name = "Glyphic Tablet",
  description = "Complete the quest 'Glyphic Tablet' with the arcane masters of the Horde (Horde).",
  type = "namedquest",
  questname = "Glyphic Tablet",
  questhub = "Mage",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_REPORT_TO_ANASTASIA_HORDE1",
  name = "Report to Anastasia",
  description = "Complete the quest 'Report to Anastasia' in Undercity’s Magic Quarter (Horde).",
  type = "namedquest",
  questname = "Report to Anastasia",
  questhub = "Mage",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_REPORT_TO_JENNEA_ALLIANCE1",
  name = "Report to Jennea",
  description = "Complete the quest 'Report to Jennea' in Stormwind’s Mage Quarter (Alliance).",
  type = "namedquest",
  questname = "Report to Jennea",
  questhub = "Mage",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_SPELLFIRE_ROBES_HORDE1",
  name = "Spellfire Robes",
  description = "Complete the quest 'Spellfire Robes' for the Kirin Tor’s counterparts among the Horde (Horde).",
  type = "namedquest",
  questname = "Spellfire Robes",
  questhub = "Mage",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_INVESTIGATE_THE_ALCHEMIST_SHOP_HORDE1",
  name = "Investigate the Alchemist Shop",
  description = "Complete the quest 'Investigate the Alchemist Shop' in Undercity’s trade quarters (Horde).",
  type = "namedquest",
  questname = "Investigate the Alchemist Shop",
  questhub = "Mage",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_INVESTIGATE_THE_BLUE_RECLUSE_ALLIANCE1",
  name = "Investigate the Blue Recluse",
  description = "Complete the quest 'Investigate the Blue Recluse' in Stormwind’s Mage Quarter (Alliance).",
  type = "namedquest",
  questname = "Investigate the Blue Recluse",
  questhub = "Mage",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_ASTRAL_KNOT_GARMENT_ALLIANCE1",
  name = "Astral Knot Garment",
  description = "Complete the quest 'Astral Knot Garment' with the mages of the Alliance (Alliance).",
  type = "namedquest",
  questname = "Astral Knot Garment",
  questhub = "Mage",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_HIGH_SORCERER_ANDROMATH_ALLIANCE1",
  name = "High Sorcerer Andromath",
  description = "Complete the quest 'High Sorcerer Andromath' by meeting him in Stormwind’s Mage Tower (Alliance).",
  type = "namedquest",
  questname = "High Sorcerer Andromath",
  questhub = "Mage",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

-- =========================
-- ✝ Paladin
-- =========================
table.insert(KAMN.achievements, {
  id = "QUEST_CONSECRATED_RUNE1",
  name = "Consecrated Rune",
  description = "Complete the quest 'Consecrated Rune' by seeking your paladin trainer in Alliance lands (Alliance).",
  type = "namedquest",
  questname = "Consecrated Rune",
  questhub = "Paladin",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_JUDGMENT_AND_REDEMPTION1",
  name = "Judgment and Redemption",
  description = "Complete the quest 'Judgment and Redemption' by proving your faith in a holy trial.",
  type = "namedquest",
  questname = "Judgment and Redemption",
  questhub = "Paladin",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_DISPELLING_EVIL1",
  name = "Dispelling Evil",
  description = "Complete the quest 'Dispelling Evil' by cleansing a place of darkness under your order’s guidance.",
  type = "namedquest",
  questname = "Dispelling Evil",
  questhub = "Paladin",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_THE_WORK_OF_GRIMAND_ELMORE1",
  name = "The Work of Grimand Elmore",
  description = "Complete the quest 'The Work of Grimand Elmore' in Stormwind’s Dwarven District (Alliance).",
  type = "namedquest",
  questname = "The Work of Grimand Elmore",
  questhub = "Paladin",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_TO_SHOW_DUE_JUDGMENT1",
  name = "To Show Due Judgment",
  description = "Complete the quest 'To Show Due Judgment' by consulting high-ranking paladins in cathedral halls.",
  type = "namedquest",
  questname = "To Show Due Judgment",
  questhub = "Paladin",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_TOME_OF_DIVINITY1",
  name = "Tome of Divinity",
  description = "Complete the quest 'Tome of Divinity' in Stormwind or Ironforge as part of your paladin trials (Alliance).",
  type = "namedquest",
  questname = "Tome of Divinity",
  questhub = "Paladin",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_THE_TOME_OF_VALOR1",
  name = "The Tome of Valor",
  description = "Complete the quest 'The Tome of Valor' by aiding a noble spirit on a righteous path (Alliance).",
  type = "namedquest",
  questname = "The Tome of Valor",
  questhub = "Paladin",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_THE_TEST_OF_RIGHTEOUSNESS1",
  name = "The Test of Righteousness",
  description = "Complete the quest 'The Test of Righteousness' by forging a blessed weapon through trials (Alliance).",
  type = "namedquest",
  questname = "The Test of Righteousness",
  questhub = "Paladin",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

-- =========================
-- ⛪ Priest
-- =========================
table.insert(KAMN.achievements, {
  id = "QUEST_TOUCH_OF_WEAKNESS_HORDE1",
  name = "Touch of Weakness",
  description = "Complete the quest 'Touch of Weakness' by studying the shadow rite with Forsaken priests (Horde).",
  type = "namedquest",
  questname = "Touch of Weakness",
  questhub = "Priest",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_RETURNING_HOME_ALLIANCE1",
  name = "Returning Home",
  description = "Complete the quest 'Returning Home' by visiting your priest trainer in an Alliance capital (Alliance).",
  type = "namedquest",
  questname = "Returning Home",
  questhub = "Priest",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_THE_ICHOR_OF_UNDEATH1",
  name = "The Ichor of Undeath",
  description = "Complete the quest 'The Ichor of Undeath' by gathering tainted essence for sacred study.",
  type = "namedquest",
  questname = "The Ichor of Undeath",
  questhub = "Priest",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_THE_BALANCE_OF_LIGHT_AND_SHADOW1",
  name = "The Balance of Light and Shadow",
  description = "Complete the quest 'The Balance of Light and Shadow' by confronting darkness to reaffirm your faith.",
  type = "namedquest",
  questname = "The Balance of Light and Shadow",
  questhub = "Priest",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_OF_COURSERS_WE_KNOW1",
  name = "Of Coursers We Know",
  description = "Complete the quest 'Of Coursers We Know' by seeking relics in remote sanctums.",
  type = "namedquest",
  questname = "Of Coursers We Know",
  questhub = "Priest",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_DESPERATE_PRAYER_ALLIANCE1",
  name = "Desperate Prayer",
  description = "Complete the quest 'Desperate Prayer' by learning the emergency benediction from an Alliance trainer (Alliance).",
  type = "namedquest",
  questname = "Desperate Prayer",
  questhub = "Priest",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_ARCANE_FEEDBACK_ALLIANCE1",
  name = "Arcane Feedback",
  description = "Complete the quest 'Arcane Feedback' by consulting the Silver Covenant’s allies among the Alliance (Alliance).",
  type = "namedquest",
  questname = "Arcane Feedback",
  questhub = "Priest",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

-- =========================
-- 🗡 Rogue
-- =========================
table.insert(KAMN.achievements, {
  id = "QUEST_ENCRYPTED_PARCHMENT1",
  name = "Encrypted Parchment",
  description = "Complete the quest 'Encrypted Parchment' by visiting a lurking rogue trainer in your starting zone.",
  type = "namedquest",
  questname = "Encrypted Parchment",
  questhub = "Rogue",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_ENCRYPTED_RUNE1",
  name = "Encrypted Rune",
  description = "Complete the quest 'Encrypted Rune' by answering the summons of an Alliance rogue trainer (Alliance).",
  type = "namedquest",
  questname = "Encrypted Rune",
  questhub = "Rogue",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_ENCRYPTED_SIGIL1",
  name = "Encrypted Sigil",
  description = "Complete the quest 'Encrypted Sigil' by meeting your trainer in a hidden corner of the city.",
  type = "namedquest",
  questname = "Encrypted Sigil",
  questhub = "Rogue",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_ENCRYPTED_TABLET1",
  name = "Encrypted Tablet",
  description = "Complete the quest 'Encrypted Tablet' by reporting to the rogue trainers among the Horde (Horde).",
  type = "namedquest",
  questname = "Encrypted Tablet",
  questhub = "Rogue",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_JUNKBOXES_NEEDED1",
  name = "Junkboxes Needed",
  description = "Complete the quest 'Junkboxes Needed' by lifting sealed boxes from unsuspecting pockets across Azeroth.",
  type = "namedquest",
  questname = "Junkboxes Needed",
  questhub = "Rogue",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_PROFESSOR_PAPUCHO1",
  name = "Professor Papucho",
  description = "Complete the quest 'Professor Papucho' by tracking the eccentric scholar through shadowy alleys.",
  type = "namedquest",
  questname = "Professor Papucho",
  questhub = "Rogue",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_PROFESSOR_MALKOVICH1",
  name = "Professor Malkovich",
  description = "Complete the quest 'Professor Malkovich' by relieving a professor of some… burdensome artifacts.",
  type = "namedquest",
  questname = "Professor Malkovich",
  questhub = "Rogue",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_TO_HULFDAN_ALLIANCE1",
  name = "To Hulfdan!",
  description = "Complete the quest 'To Hulfdan!' by reporting to the rogue trainer in Ironforge (Alliance).",
  type = "namedquest",
  questname = "To Hulfdan!",
  questhub = "Rogue",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_TO_ORGRIMMAR_HORDE1",
  name = "To Orgrimmar!",
  description = "Complete the quest 'To Orgrimmar!' by reporting to the rogue trainers within the Cleft of Shadow (Horde).",
  type = "namedquest",
  questname = "To Orgrimmar!",
  questhub = "Rogue",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_A_SIMPLE_REQUEST1",
  name = "A Simple Request",
  description = "Complete the quest 'A Simple Request' by meeting a shadowy contact in a major city.",
  type = "namedquest",
  questname = "A Simple Request",
  questhub = "Rogue",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

-- =========================
-- ⚡ Shaman
-- =========================
table.insert(KAMN.achievements, {
  id = "QUEST_AGAIN_INTO_THE_GREAT_OSSUARY1",
  name = "Again Into the Great Ossuary",
  description = "Complete the quest 'Again Into the Great Ossuary' by confronting spirits within a haunted crypt.",
  type = "namedquest",
  questname = "Again Into the Great Ossuary",
  questhub = "Shaman",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_CALL_OF_AIR1",
  name = "Call of Air",
  description = "Complete the quest 'Call of Air' by honoring the wind totems at remote high places.",
  type = "namedquest",
  questname = "Call of Air",
  questhub = "Shaman",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_CALL_OF_EARTH1",
  name = "Call of Earth",
  description = "Complete the quest 'Call of Earth' by seeking the totem carved from the oldest stone.",
  type = "namedquest",
  questname = "Call of Earth",
  questhub = "Shaman",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_CALL_OF_FIRE1",
  name = "Call of Fire",
  description = "Complete the quest 'Call of Fire' by carrying embers from sacred flames guarded by elementals.",
  type = "namedquest",
  questname = "Call of Fire",
  questhub = "Shaman",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_CALL_OF_WATER1",
  name = "Call of Water",
  description = "Complete the quest 'Call of Water' by collecting the purest waters from distant springs.",
  type = "namedquest",
  questname = "Call of Water",
  questhub = "Shaman",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_DA_VOODOO1",
  name = "Da Voodoo",
  description = "Complete the quest 'Da Voodoo' by trading with witch doctors in troll-ruled lands.",
  type = "namedquest",
  questname = "Da Voodoo",
  questhub = "Shaman",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

-- Saptas & mastery
table.insert(KAMN.achievements, {
  id = "QUEST_EARTH_SAPTA1",
  name = "Earth Sapta",
  description = "Complete the quest 'Earth Sapta' by brewing a vision draught from the bones of the world.",
  type = "namedquest",
  questname = "Earth Sapta",
  questhub = "Shaman",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_ELEMENTAL_MASTERY1",
  name = "Elemental Mastery",
  description = "Complete the quest 'Elemental Mastery' by proving your command over fire, earth, air, and water.",
  type = "namedquest",
  questname = "Elemental Mastery",
  questhub = "Shaman",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_FIRE_SAPTA1",
  name = "Fire Sapta",
  description = "Complete the quest 'Fire Sapta' by crafting a potion that reveals the flame’s spirits.",
  type = "namedquest",
  questname = "Fire Sapta",
  questhub = "Shaman",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_MASTERING_THE_ELEMENTS1",
  name = "Mastering the Elements",
  description = "Complete the quest 'Mastering the Elements' by undertaking trials set by elemental mentors.",
  type = "namedquest",
  questname = "Mastering the Elements",
  questhub = "Shaman",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_MATERIAL_ASSISTANCE1",
  name = "Material Assistance",
  description = "Complete the quest 'Material Assistance' by procuring reagents for the elemental rites.",
  type = "namedquest",
  questname = "Material Assistance",
  questhub = "Shaman",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

-- parchments/tablets
table.insert(KAMN.achievements, {
  id = "QUEST_RUNE_INSCRIBED_PARCHMENT1",
  name = "Rune-Inscribed Parchment",
  description = "Complete the quest 'Rune-Inscribed Parchment' by presenting it to your shaman trainer.",
  type = "namedquest",
  questname = "Rune-Inscribed Parchment",
  questhub = "Shaman",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_RUNE_INSCRIBED_TABLET1",
  name = "Rune-Inscribed Tablet",
  description = "Complete the quest 'Rune-Inscribed Tablet' by visiting a tribal shaman in the Barrens or Durotar.",
  type = "namedquest",
  questname = "Rune-Inscribed Tablet",
  questhub = "Shaman",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

-- totems & spiritwolf
table.insert(KAMN.achievements, {
  id = "QUEST_SPIRIT_TOTEM1",
  name = "Spirit Totem",
  description = "Complete the quest 'Spirit Totem' by crafting a vessel to anchor ancestral spirits.",
  type = "namedquest",
  questname = "Spirit Totem",
  questhub = "Shaman",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
-- (duplicate title kept once)
table.insert(KAMN.achievements, {
  id = "QUEST_THE_DARKREAVER_MENACE1",
  name = "The Darkreaver Menace",
  description = "Complete the quest 'The Darkreaver Menace' by purging the presence haunting a forsaken sanctum.",
  type = "namedquest",
  questname = "The Darkreaver Menace",
  questhub = "Shaman",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_THE_WAY_OF_THE_SPIRITWOLF_I1",
  name = "The Way of the Spiritwolf I",
  description = "Complete 'The Way of the Spiritwolf I' by beginning your path with the ancestors.",
  type = "namedquest",
  questname = "The Way of the Spiritwolf I",
  questhub = "Shaman",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_THE_WAY_OF_THE_SPIRITWOLF_II1",
  name = "The Way of the Spiritwolf II",
  description = "Complete 'The Way of the Spiritwolf II' by enduring trials of the open plains.",
  type = "namedquest",
  questname = "The Way of the Spiritwolf II",
  questhub = "Shaman",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_THE_WAY_OF_THE_SPIRITWOLF_III1",
  name = "The Way of the Spiritwolf III",
  description = "Complete 'The Way of the Spiritwolf III' by hunting alongside spirit guides.",
  type = "namedquest",
  questname = "The Way of the Spiritwolf III",
  questhub = "Shaman",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_THE_WAY_OF_THE_SPIRITWOLF_IV1",
  name = "The Way of the Spiritwolf IV",
  description = "Complete 'The Way of the Spiritwolf IV' by mastering the wolf’s stride.",
  type = "namedquest",
  questname = "The Way of the Spiritwolf IV",
  questhub = "Shaman",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_THE_WAY_OF_THE_SPIRITWOLF_V1",
  name = "The Way of the Spiritwolf V",
  description = "Complete 'The Way of the Spiritwolf V' by earning the blessing of the great pack.",
  type = "namedquest",
  questname = "The Way of the Spiritwolf V",
  questhub = "Shaman",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_WATER_SAPTA1",
  name = "Water Sapta",
  description = "Complete the quest 'Water Sapta' by distilling a draught that unveils the river’s spirits.",
  type = "namedquest",
  questname = "Water Sapta",
  questhub = "Shaman",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

-- =========================
-- 🔥 Warlock
-- =========================
table.insert(KAMN.achievements, {
  id = "QUEST_A_LESSON_TO_TAKE_TO_HEART1",
  name = "A Lesson To Take To Heart",
  description = "Complete the quest 'A Lesson To Take To Heart' by studying fel rites under a warlock mentor.",
  type = "namedquest",
  questname = "A Lesson To Take To Heart",
  questhub = "Warlock",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_AN_IMPS_REQUEST1",
  name = "An Imp's Request",
  description = "Complete the quest 'An Imp's Request' by negotiating with a mischievous familiar.",
  type = "namedquest",
  questname = "An Imp's Request",
  questhub = "Warlock",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_COMPONENTS_FOR_THE_ENCHANTED_GOLD_BLOODROBE1",
  name = "Components for the Enchanted Gold Bloodrobe",
  description = "Complete the quest 'Components for the Enchanted Gold Bloodrobe' by gathering rare fel reagents.",
  type = "namedquest",
  questname = "Components for the Enchanted Gold Bloodrobe",
  questhub = "Warlock",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_CREATURE_OF_THE_VOID1",
  name = "Creature of the Void",
  description = "Complete the quest 'Creature of the Void' by summoning and binding a voidwalker.",
  type = "namedquest",
  questname = "Creature of the Void",
  questhub = "Warlock",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_DRAINING_THE_SOULFLAYER1",
  name = "Draining the Soulflayer",
  description = "Complete the quest 'Draining the Soulflayer' by harvesting essence from a fearsome foe.",
  type = "namedquest",
  questname = "Draining the Soulflayer",
  questhub = "Warlock",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_FINE_GOLD_THREAD1",
  name = "Fine Gold Thread",
  description = "Complete the quest 'Fine Gold Thread' by acquiring a rare thread for demonic garb.",
  type = "namedquest",
  questname = "Fine Gold Thread",
  questhub = "Warlock",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_IN_SEARCH_OF_MENARA_VOIDRENDER1",
  name = "In Search of Menara Voidrender",
  description = "Complete the quest 'In Search of Menara Voidrender' by traveling to a secluded mage’s sanctum.",
  type = "namedquest",
  questname = "In Search of Menara Voidrender",
  questhub = "Warlock",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_KNOWLEDGE_OF_THE_ORB_OF_ORAHIL1",
  name = "Knowledge of the Orb of Orahil",
  description = "Complete the quest 'Knowledge of the Orb of Orahil' by gathering lore from warlock circles.",
  type = "namedquest",
  questname = "Knowledge of the Orb of Orahil",
  questhub = "Warlock",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_MORZUL_BLOODBRINGER1",
  name = "Mor'zul Bloodbringer",
  description = "Complete the quest 'Mor'zul Bloodbringer' by answering a dark summons in the Blasted Lands.",
  type = "namedquest",
  questname = "Mor'zul Bloodbringer",
  questhub = "Warlock",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_SEEKING_STRAHAD1",
  name = "Seeking Strahad",
  description = "Complete the quest 'Seeking Strahad' by visiting the summoner in Ratchet or the Barrens.",
  type = "namedquest",
  questname = "Seeking Strahad",
  questhub = "Warlock",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_SUMMON_FELSTEED1",
  name = "Summon Felsteed",
  description = "Complete the quest 'Summon Felsteed' by performing an infernal rite to bind your steed.",
  type = "namedquest",
  questname = "Summon Felsteed",
  questhub = "Warlock",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_THE_BINDING1",
  name = "The Binding",
  description = "Complete the quest 'The Binding' by subjugating a summoned demon in a ritual circle.",
  type = "namedquest",
  questname = "The Binding",
  questhub = "Warlock",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_TOME_OF_THE_CABAL1",
  name = "Tome of the Cabal",
  description = "Complete the quest 'Tome of the Cabal' by recovering pages from distant ruins.",
  type = "namedquest",
  questname = "Tome of the Cabal",
  questhub = "Warlock",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_VILE_FAMILIARS1",
  name = "Vile Familiars",
  description = "Complete the quest 'Vile Familiars' by culling feral imps near Durotar.",
  type = "namedquest",
  questname = "Vile Familiars",
  questhub = "Warlock",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_THE_STOLEN_TOME1",
  name = "The Stolen Tome",
  description = "Complete the quest 'The Stolen Tome' by retrieving a missing grimoire from nearby cultists.",
  type = "namedquest",
  questname = "The Stolen Tome",
  questhub = "Warlock",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_THE_COMPLETED_ORB_OF_DAR_ORAHIL1",
  name = "The Completed Orb of Dar'Orahil",
  description = "Complete the quest 'The Completed Orb of Dar'Orahil' by assembling the relic’s final components.",
  type = "namedquest",
  questname = "The Completed Orb of Dar'Orahil",
  questhub = "Warlock",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_THE_COMPLETED_ORB_OF_NOH_ORAHIL1",
  name = "The Completed Orb of Noh'Orahil",
  description = "Complete the quest 'The Completed Orb of Noh'Orahil' by restoring the sister relic’s power.",
  type = "namedquest",
  questname = "The Completed Orb of Noh'Orahil",
  questhub = "Warlock",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

-- =========================
-- ⚔ Warrior
-- =========================
table.insert(KAMN.achievements, {
  id = "QUEST_DEAD_TOOTH_JACK1",
  name = "Dead-tooth Jack",
  description = "Complete the quest 'Dead-tooth Jack' by hunting a notorious brigand in the wilds.",
  type = "namedquest",
  questname = "Dead-tooth Jack",
  questhub = "Warrior",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_FORGED_STEEL1",
  name = "Forged Steel",
  description = "Complete the quest 'Forged Steel' by testing your mettle at a master smith’s anvil.",
  type = "namedquest",
  questname = "Forged Steel",
  questhub = "Warrior",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_WEAPONS_OF_ELUNITE1",
  name = "Weapons of Elunite",
  description = "Complete the quest 'Weapons of Elunite' by retrieving moon-touched ore for revered craftsfolk.",
  type = "namedquest",
  questname = "Weapons of Elunite",
  questhub = "Warrior",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_HEIRLOOM_WEAPON1",
  name = "Heirloom Weapon",
  description = "Complete the quest 'Heirloom Weapon' by restoring a storied blade to fighting form.",
  type = "namedquest",
  questname = "Heirloom Weapon",
  questhub = "Warrior",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

-- Berserker/stance chain & whirlwind set
table.insert(KAMN.achievements, {
  id = "QUEST_THE_AFFRAY1",
  name = "The Affray",
  description = "Complete the quest 'The Affray' by proving yourself on Fray Island near Ratchet.",
  type = "namedquest",
  questname = "The Affray",
  questhub = "Warrior",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_THE_ISLANDER1",
  name = "The Islander",
  description = "Complete the quest 'The Islander' by traveling to Fray Island for a warrior’s trial.",
  type = "namedquest",
  questname = "The Islander",
  questhub = "Warrior",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_THE_WINDWATCHER1",
  name = "The Windwatcher",
  description = "Complete the quest 'The Windwatcher' by visiting Bath'rah the Windwatcher in the Alterac Mountains.",
  type = "namedquest",
  questname = "The Windwatcher",
  questhub = "Warrior",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_CYCLONIAN1",
  name = "Cyclonian",
  description = "Complete the quest 'Cyclonian' by forging the whirlwind weapon after trials in Arathi Highlands.",
  type = "namedquest",
  questname = "Cyclonian",
  questhub = "Warrior",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})

table.insert(KAMN.achievements, {
  id = "QUEST_THE_SUMMONING1",
  name = "The Summoning",
  description = "Complete the quest 'The Summoning' by facing a spirit called forth for your final test.",
  type = "namedquest",
  questname = "The Summoning",
  questhub = "Warrior",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
table.insert(KAMN.achievements, {
  id = "QUEST_WAR_ON_THE_SHADOWSWORN1",
  name = "War on the Shadowsworn",
  description = "Complete the quest 'War on the Shadowsworn' by striking at cultists in the Blasted Lands.",
  type = "namedquest",
  questname = "War on the Shadowsworn",
  questhub = "Warrior",
  value = 1, progress = 0, complete = false, category = "Quests", points = 5, requiredFor = {}
})
