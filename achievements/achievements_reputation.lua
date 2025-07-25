-- achievements_reputation.lua
-- Reputation Achievements (English only, Classic 1.12 compatible)

KAMN = KAMN or {}
KAMN.achievements = KAMN.achievements or {}

-- Argent Dawn
table.insert(KAMN.achievements, {
  id = "REPUTATION_ARGENTDAWN_1000",
  name = "Silver Crusader",
  description = "Gain 1000 reputation with the Argent Dawn.",
  type = "reputation",
  subtype = "neutral",
  faction = "Argent Dawn",
  value = 1000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})

-- Timbermaw Hold
table.insert(KAMN.achievements, {
  id = "REPUTATION_TIMBERMAW_1000",
  name = "Tunnel Diplomat",
  description = "Gain 1000 reputation with Timbermaw Hold.",
  type = "reputation",
  subtype = "neutral",
  faction = "Timbermaw Hold",
  value = 1000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})

-- Ratchet
table.insert(KAMN.achievements, {
  id = "REPUTATION_RATCHET_1000",
  name = "Ratchet Regular",
  description = "Gain 1000 reputation with Ratchet.",
  type = "reputation",
  subtype = "neutral",
  faction = "Ratchet",
  value = 1000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})

-- Gadgetzan
table.insert(KAMN.achievements, {
  id = "REPUTATION_GADGETZAN_1000",
  name = "Desert Connections",
  description = "Gain 1000 reputation with Gadgetzan.",
  type = "reputation",
  subtype = "neutral",
  faction = "Gadgetzan",
  value = 1000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})

-- Everlook
table.insert(KAMN.achievements, {
  id = "REPUTATION_EVERLOOK_1000",
  name = "Snow Business",
  description = "Gain 1000 reputation with Everlook.",
  type = "reputation",
  subtype = "neutral",
  faction = "Everlook",
  value = 1000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})

-- Booty Bay
table.insert(KAMN.achievements, {
  id = "REPUTATION_BOOTYBAY_1000",
  name = "Baywatcher",
  description = "Gain 1000 reputation with Booty Bay.",
  type = "reputation",
  subtype = "neutral",
  faction = "Booty Bay",
  value = 1000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})



--------------------------------------------------
-- Horde Cities (Orgrimmar, Thunder Bluff, Undercity, Darkspear Trolls)
--------------------------------------------------

-- Orgrimmar
-- 1000
table.insert(KAMN.achievements, {
  id = "REPUTATION_ORGRIMMAR_1000",
  name = "Strength of Orgrimmar",
  description = "Gain 1000 reputation with Orgrimmar.",
  type = "reputation",
  subtype = "horde",
  faction = "Orgrimmar",
  value = 1000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})
-- 3000
table.insert(KAMN.achievements, {
  id = "REPUTATION_ORGRIMMAR_3000",
  name = "Trusted by Orgrimmar",
  description = "Gain 3000 reputation with Orgrimmar.",
  type = "reputation",
  subtype = "horde",
  faction = "Orgrimmar",
  value = 3000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})
-- 6000
table.insert(KAMN.achievements, {
  id = "REPUTATION_ORGRIMMAR_6000",
  name = "Ally of Orgrimmar",
  description = "Gain 6000 reputation with Orgrimmar.",
  type = "reputation",
  subtype = "horde",
  faction = "Orgrimmar",
  value = 6000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 10,
  requiredFor = {},
})
-- 21000
table.insert(KAMN.achievements, {
  id = "REPUTATION_ORGRIMMAR_21000",
  name = "Champion of Orgrimmar",
  description = "Gain 21000 reputation with Orgrimmar.",
  type = "reputation",
  subtype = "horde",
  faction = "Orgrimmar",
  value = 21000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 20,
  requiredFor = {},
})

-- Thunder Bluff
-- 1000
table.insert(KAMN.achievements, {
  id = "REPUTATION_THUNDERBLUFF_1000",
  name = "Horns of Honor",
  description = "Gain 1000 reputation with Thunder Bluff.",
  type = "reputation",
  subtype = "horde",
  faction = "Thunder Bluff",
  value = 1000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})
-- 3000
table.insert(KAMN.achievements, {
  id = "REPUTATION_THUNDERBLUFF_3000",
  name = "Trusted by Thunder Bluff",
  description = "Gain 3000 reputation with Thunder Bluff.",
  type = "reputation",
  subtype = "horde",
  faction = "Thunder Bluff",
  value = 3000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})
-- 6000
table.insert(KAMN.achievements, {
  id = "REPUTATION_THUNDERBLUFF_6000",
  name = "Ally of Thunder Bluff",
  description = "Gain 6000 reputation with Thunder Bluff.",
  type = "reputation",
  subtype = "horde",
  faction = "Thunder Bluff",
  value = 6000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 10,
  requiredFor = {},
})
-- 21000
table.insert(KAMN.achievements, {
  id = "REPUTATION_THUNDERBLUFF_21000",
  name = "Champion of Thunder Bluff",
  description = "Gain 21000 reputation with Thunder Bluff.",
  type = "reputation",
  subtype = "horde",
  faction = "Thunder Bluff",
  value = 21000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 20,
  requiredFor = {},
})

-- Undercity
-- 1000
table.insert(KAMN.achievements, {
  id = "REPUTATION_UNDERCITY_1000",
  name = "Shadow Ally",
  description = "Gain 1000 reputation with Undercity.",
  type = "reputation",
  subtype = "horde",
  faction = "Undercity",
  value = 1000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})
-- 3000
table.insert(KAMN.achievements, {
  id = "REPUTATION_UNDERCITY_3000",
  name = "Trusted by Undercity",
  description = "Gain 3000 reputation with Undercity.",
  type = "reputation",
  subtype = "horde",
  faction = "Undercity",
  value = 3000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})
-- 6000
table.insert(KAMN.achievements, {
  id = "REPUTATION_UNDERCITY_6000",
  name = "Ally of Undercity",
  description = "Gain 6000 reputation with Undercity.",
  type = "reputation",
  subtype = "horde",
  faction = "Undercity",
  value = 6000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 10,
  requiredFor = {},
})
-- 21000
table.insert(KAMN.achievements, {
  id = "REPUTATION_UNDERCITY_21000",
  name = "Champion of Undercity",
  description = "Gain 21000 reputation with Undercity.",
  type = "reputation",
  subtype = "horde",
  faction = "Undercity",
  value = 21000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 20,
  requiredFor = {},
})

-- Darkspear Trolls
-- 1000
table.insert(KAMN.achievements, {
  id = "REPUTATION_DARKSPEAR_1000",
  name = "Troll Kin",
  description = "Gain 1000 reputation with the Darkspear Trolls.",
  type = "reputation",
  subtype = "horde",
  faction = "Darkspear Trolls",
  value = 1000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})
-- 3000
table.insert(KAMN.achievements, {
  id = "REPUTATION_DARKSPEAR_3000",
  name = "Trusted by the Darkspear Trolls",
  description = "Gain 3000 reputation with the Darkspear Trolls.",
  type = "reputation",
  subtype = "horde",
  faction = "Darkspear Trolls",
  value = 3000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})
-- 6000
table.insert(KAMN.achievements, {
  id = "REPUTATION_DARKSPEAR_6000",
  name = "Ally of the Darkspear Trolls",
  description = "Gain 6000 reputation with the Darkspear Trolls.",
  type = "reputation",
  subtype = "horde",
  faction = "Darkspear Trolls",
  value = 6000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 10,
  requiredFor = {},
})
-- 21000
table.insert(KAMN.achievements, {
  id = "REPUTATION_DARKSPEAR_21000",
  name = "Champion of the Darkspear Trolls",
  description = "Gain 21000 reputation with the Darkspear Trolls.",
  type = "reputation",
  subtype = "horde",
  faction = "Darkspear Trolls",
  value = 21000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 20,
  requiredFor = {},
})


--------------------------------------------------
-- Alliance Cities (Stormwind, Ironforge, Darnassus, Gnomeregan Exiles)
--------------------------------------------------

-- Stormwind
-- 1000
table.insert(KAMN.achievements, {
  id = "REPUTATION_STORMWIND_1000",
  name = "Shield of Stormwind",
  description = "Gain 1000 reputation with Stormwind.",
  type = "reputation",
  subtype = "alliance",
  faction = "Stormwind",
  value = 1000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})
-- 3000
table.insert(KAMN.achievements, {
  id = "REPUTATION_STORMWIND_3000",
  name = "Trusted by Stormwind",
  description = "Gain 3000 reputation with Stormwind.",
  type = "reputation",
  subtype = "alliance",
  faction = "Stormwind",
  value = 3000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})
-- 6000
table.insert(KAMN.achievements, {
  id = "REPUTATION_STORMWIND_6000",
  name = "Ally of Stormwind",
  description = "Gain 6000 reputation with Stormwind.",
  type = "reputation",
  subtype = "alliance",
  faction = "Stormwind",
  value = 6000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 10,
  requiredFor = {},
})
-- 21000
table.insert(KAMN.achievements, {
  id = "REPUTATION_STORMWIND_21000",
  name = "Champion of Stormwind",
  description = "Gain 21000 reputation with Stormwind.",
  type = "reputation",
  subtype = "alliance",
  faction = "Stormwind",
  value = 21000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 20,
  requiredFor = {},
})

-- Ironforge
-- 1000
table.insert(KAMN.achievements, {
  id = "REPUTATION_IRONFORGE_1000",
  name = "Honor of Ironforge",
  description = "Gain 1000 reputation with Ironforge.",
  type = "reputation",
  subtype = "alliance",
  faction = "Ironforge",
  value = 1000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})
-- 3000
table.insert(KAMN.achievements, {
  id = "REPUTATION_IRONFORGE_3000",
  name = "Trusted by Ironforge",
  description = "Gain 3000 reputation with Ironforge.",
  type = "reputation",
  subtype = "alliance",
  faction = "Ironforge",
  value = 3000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})
-- 6000
table.insert(KAMN.achievements, {
  id = "REPUTATION_IRONFORGE_6000",
  name = "Ally of Ironforge",
  description = "Gain 6000 reputation with Ironforge.",
  type = "reputation",
  subtype = "alliance",
  faction = "Ironforge",
  value = 6000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 10,
  requiredFor = {},
})
-- 21000
table.insert(KAMN.achievements, {
  id = "REPUTATION_IRONFORGE_21000",
  name = "Champion of Ironforge",
  description = "Gain 21000 reputation with Ironforge.",
  type = "reputation",
  subtype = "alliance",
  faction = "Ironforge",
  value = 21000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 20,
  requiredFor = {},
})

-- Darnassus
-- 1000
table.insert(KAMN.achievements, {
  id = "REPUTATION_DARNASSUS_1000",
  name = "Grace of Darnassus",
  description = "Gain 1000 reputation with Darnassus.",
  type = "reputation",
  subtype = "alliance",
  faction = "Darnassus",
  value = 1000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})
-- 3000
table.insert(KAMN.achievements, {
  id = "REPUTATION_DARNASSUS_3000",
  name = "Trusted by Darnassus",
  description = "Gain 3000 reputation with Darnassus.",
  type = "reputation",
  subtype = "alliance",
  faction = "Darnassus",
  value = 3000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})
-- 6000
table.insert(KAMN.achievements, {
  id = "REPUTATION_DARNASSUS_6000",
  name = "Ally of Darnassus",
  description = "Gain 6000 reputation with Darnassus.",
  type = "reputation",
  subtype = "alliance",
  faction = "Darnassus",
  value = 6000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 10,
  requiredFor = {},
})
-- 21000
table.insert(KAMN.achievements, {
  id = "REPUTATION_DARNASSUS_21000",
  name = "Champion of Darnassus",
  description = "Gain 21000 reputation with Darnassus.",
  type = "reputation",
  subtype = "alliance",
  faction = "Darnassus",
  value = 21000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 20,
  requiredFor = {},
})

-- Gnomeregan Exiles
-- 1000
table.insert(KAMN.achievements, {
  id = "REPUTATION_GNOMEREGAN_1000",
  name = "Spark of Gnomeregan",
  description = "Gain 1000 reputation with the Gnomeregan Exiles.",
  type = "reputation",
  subtype = "alliance",
  faction = "Gnomeregan Exiles",
  value = 1000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})
-- 3000
table.insert(KAMN.achievements, {
  id = "REPUTATION_GNOMEREGAN_3000",
  name = "Trusted by the Gnomeregan Exiles",
  description = "Gain 3000 reputation with the Gnomeregan Exiles.",
  type = "reputation",
  subtype = "alliance",
  faction = "Gnomeregan Exiles",
  value = 3000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})
-- 6000
table.insert(KAMN.achievements, {
  id = "REPUTATION_GNOMEREGAN_6000",
  name = "Ally of the Gnomeregan Exiles",
  description = "Gain 6000 reputation with the Gnomeregan Exiles.",
  type = "reputation",
  subtype = "alliance",
  faction = "Gnomeregan Exiles",
  value = 6000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 10,
  requiredFor = {},
})
-- 21000
table.insert(KAMN.achievements, {
  id = "REPUTATION_GNOMEREGAN_21000",
  name = "Champion of the Gnomeregan Exiles",
  description = "Gain 21000 reputation with the Gnomeregan Exiles.",
  type = "reputation",
  subtype = "alliance",
  faction = "Gnomeregan Exiles",
  value = 21000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 20,
  requiredFor = {},
})

