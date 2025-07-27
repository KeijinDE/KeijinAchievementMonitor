-- achievements_reputation.lua
-- Reputation Achievements (English only, Classic 1.12 compatible)

KAMN = KAMN or {}
KAMN.achievements = KAMN.achievements or {}

-- Argent Dawn (1000)
table.insert(KAMN.achievements, {
  id = "REPUTATION_ARGENTDAWN_1000",
  name = "Initiate of Light",
  description = "Gain 1000 reputation with Argent Dawn. Begin earning favor with the Argent Dawn.",
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

-- Argent Dawn (3000)
table.insert(KAMN.achievements, {
  id = "REPUTATION_ARGENTDAWN_3000",
  name = "Crypt Watcher",
  description = "Gain 3000 reputation with Argent Dawn. Gain recognition as a guardian of the crypts.",
  type = "reputation",
  subtype = "neutral",
  faction = "Argent Dawn",
  value = 3000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})

-- Argent Dawn (6000)
table.insert(KAMN.achievements, {
  id = "REPUTATION_ARGENTDAWN_6000",
  name = "Scourge Breaker",
  description = "Gain 6000 reputation with Argent Dawn. Lead the fight against the Scourge.",
  type = "reputation",
  subtype = "neutral",
  faction = "Argent Dawn",
  value = 6000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})

-- Argent Dawn (10000)
table.insert(KAMN.achievements, {
  id = "REPUTATION_ARGENTDAWN_10000",
  name = "Dawnbringer",
  description = "Gain 10000 reputation with Argent Dawn. Become a beacon of hope for Lordaeron.",
  type = "reputation",
  subtype = "neutral",
  faction = "Argent Dawn",
  value = 10000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})

-- Timbermaw Hold (1000)
table.insert(KAMN.achievements, {
  id = "REPUTATION_TIMBERMAWHOLD_1000",
  name = "Outsider",
  description = "Gain 1000 reputation with Timbermaw Hold. Gain a cautious welcome in Timbermaw tunnels.",
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

-- Timbermaw Hold (3000)
table.insert(KAMN.achievements, {
  id = "REPUTATION_TIMBERMAWHOLD_3000",
  name = "Tunnel Friend",
  description = "Gain 3000 reputation with Timbermaw Hold. Prove yourself as a trusted passer.",
  type = "reputation",
  subtype = "neutral",
  faction = "Timbermaw Hold",
  value = 3000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})

-- Timbermaw Hold (6000)
table.insert(KAMN.achievements, {
  id = "REPUTATION_TIMBERMAWHOLD_6000",
  name = "Furbolg Ally",
  description = "Gain 6000 reputation with Timbermaw Hold. Form strong bonds with the Furbolg tribe.",
  type = "reputation",
  subtype = "neutral",
  faction = "Timbermaw Hold",
  value = 6000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})

-- Timbermaw Hold (10000)
table.insert(KAMN.achievements, {
  id = "REPUTATION_TIMBERMAWHOLD_10000",
  name = "Honorary Timbermaw",
  description = "Gain 10000 reputation with Timbermaw Hold. Earn the full respect of Timbermaw Hold.",
  type = "reputation",
  subtype = "neutral",
  faction = "Timbermaw Hold",
  value = 10000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})

-- Ratchet (1000)
table.insert(KAMN.achievements, {
  id = "REPUTATION_RATCHET_1000",
  name = "Errand Runner",
  description = "Gain 1000 reputation with Ratchet. Get your foot in the door in Ratchet.",
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

-- Ratchet (3000)
table.insert(KAMN.achievements, {
  id = "REPUTATION_RATCHET_3000",
  name = "Frequent Fixer",
  description = "Gain 3000 reputation with Ratchet. Help out with odd jobs and deliveries.",
  type = "reputation",
  subtype = "neutral",
  faction = "Ratchet",
  value = 3000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})

-- Ratchet (6000)
table.insert(KAMN.achievements, {
  id = "REPUTATION_RATCHET_6000",
  name = "Contract Partner",
  description = "Gain 6000 reputation with Ratchet. Become known among Ratchet's traders.",
  type = "reputation",
  subtype = "neutral",
  faction = "Ratchet",
  value = 6000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})

-- Ratchet (10000)
table.insert(KAMN.achievements, {
  id = "REPUTATION_RATCHET_10000",
  name = "Honorary Foreman",
  description = "Gain 10000 reputation with Ratchet. Be treated like one of the cartel's own.",
  type = "reputation",
  subtype = "neutral",
  faction = "Ratchet",
  value = 10000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})

-- Gadgetzan (1000)
table.insert(KAMN.achievements, {
  id = "REPUTATION_GADGETZAN_1000",
  name = "Newcomer",
  description = "Gain 1000 reputation with Gadgetzan. Start building ties in the desert town.",
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

-- Gadgetzan (3000)
table.insert(KAMN.achievements, {
  id = "REPUTATION_GADGETZAN_3000",
  name = "Sand-Savvy",
  description = "Gain 3000 reputation with Gadgetzan. Learn the ropes in Gadgetzan’s dusty trade.",
  type = "reputation",
  subtype = "neutral",
  faction = "Gadgetzan",
  value = 3000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})

-- Gadgetzan (6000)
table.insert(KAMN.achievements, {
  id = "REPUTATION_GADGETZAN_6000",
  name = "Deal Maker",
  description = "Gain 6000 reputation with Gadgetzan. Seal your reputation as a reliable ally.",
  type = "reputation",
  subtype = "neutral",
  faction = "Gadgetzan",
  value = 6000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})

-- Gadgetzan (10000)
table.insert(KAMN.achievements, {
  id = "REPUTATION_GADGETZAN_10000",
  name = "Tanaris Tycoon",
  description = "Gain 10000 reputation with Gadgetzan. Become a big name in desert dealings.",
  type = "reputation",
  subtype = "neutral",
  faction = "Gadgetzan",
  value = 10000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})

-- Everlook (1000)
table.insert(KAMN.achievements, {
  id = "REPUTATION_EVERLOOK_1000",
  name = "Cold Caller",
  description = "Gain 1000 reputation with Everlook. Make your presence known in the frozen north.",
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

-- Everlook (3000)
table.insert(KAMN.achievements, {
  id = "REPUTATION_EVERLOOK_3000",
  name = "Snow Supplier",
  description = "Gain 3000 reputation with Everlook. Deliver goods through snow and ice.",
  type = "reputation",
  subtype = "neutral",
  faction = "Everlook",
  value = 3000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})

-- Everlook (6000)
table.insert(KAMN.achievements, {
  id = "REPUTATION_EVERLOOK_6000",
  name = "Winter Broker",
  description = "Gain 6000 reputation with Everlook. Become a go-to partner in Everlook’s market.",
  type = "reputation",
  subtype = "neutral",
  faction = "Everlook",
  value = 6000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})

-- Everlook (10000)
table.insert(KAMN.achievements, {
  id = "REPUTATION_EVERLOOK_10000",
  name = "Frosthold Friend",
  description = "Gain 10000 reputation with Everlook. Be counted among Everlook’s trusted few.",
  type = "reputation",
  subtype = "neutral",
  faction = "Everlook",
  value = 10000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})

-- Booty Bay (1000)
table.insert(KAMN.achievements, {
  id = "REPUTATION_BOOTYBAY_1000",
  name = "Deck Sweeper",
  description = "Gain 1000 reputation with Booty Bay. Get noticed by the goblins of Booty Bay.",
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

-- Booty Bay (3000)
table.insert(KAMN.achievements, {
  id = "REPUTATION_BOOTYBAY_3000",
  name = "Rum Runner",
  description = "Gain 3000 reputation with Booty Bay. Run errands (and maybe some rum) for the crew.",
  type = "reputation",
  subtype = "neutral",
  faction = "Booty Bay",
  value = 3000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})

-- Booty Bay (6000)
table.insert(KAMN.achievements, {
  id = "REPUTATION_BOOTYBAY_6000",
  name = "Port Agent",
  description = "Gain 6000 reputation with Booty Bay. Oversee dealings along the docks.",
  type = "reputation",
  subtype = "neutral",
  faction = "Booty Bay",
  value = 6000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})

-- Booty Bay (10000)
table.insert(KAMN.achievements, {
  id = "REPUTATION_BOOTYBAY_10000",
  name = "Buccaneer's Bestie",
  description = "Gain 10000 reputation with Booty Bay. Become the pirates’ favorite partner ashore.",
  type = "reputation",
  subtype = "neutral",
  faction = "Booty Bay",
  value = 10000,
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

-- Durotar Labor Union
table.insert(KAMN.achievements, {
  id = "REPUTATION_DUROTAR_1000",
  name = "Durotar Associate",
  description = "Gain 1,000 reputation with the Durotar Labor Union.",
  type = "reputation",
  subtype = "horde",
  faction = "Durotar Labor Union",
  value = 1000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "REPUTATION_DUROTAR_3000",
  name = "Durotar Aide",
  description = "Gain 3,000 reputation with the Durotar Labor Union.",
  type = "reputation",
  subtype = "horde",
  faction = "Durotar Labor Union",
  value = 3000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "REPUTATION_DUROTAR_6000",
  name = "Labor Union Partner",
  description = "Gain 6,000 reputation with the Durotar Labor Union.",
  type = "reputation",
  subtype = "horde",
  faction = "Durotar Labor Union",
  value = 6000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "REPUTATION_DUROTAR_12000",
  name = "Durotar Ally",
  description = "Gain 12,000 reputation with the Durotar Labor Union.",
  type = "reputation",
  subtype = "horde",
  faction = "Durotar Labor Union",
  value = 12000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 10,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "REPUTATION_DUROTAR_21000",
  name = "Champion of the Labor Union",
  description = "Gain 21,000 reputation with the Durotar Labor Union.",
  type = "reputation",
  subtype = "horde",
  faction = "Durotar Labor Union",
  value = 21000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 20,
  requiredFor = {},
})

-- Silvermoon Remnant
table.insert(KAMN.achievements, {
  id = "REPUTATION_SILVERMOON_1000",
  name = "Ally of the Remnant",
  description = "Gain 1,000 reputation with the Silvermoon Remnant.",
  type = "reputation",
  subtype = "alliance",
  faction = "Silvermoon Remnant",
  value = 1000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "REPUTATION_SILVERMOON_3000",
  name = "Respected by the Remnant",
  description = "Gain 3,000 reputation with the Silvermoon Remnant.",
  type = "reputation",
  subtype = "alliance",
  faction = "Silvermoon Remnant",
  value = 3000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "REPUTATION_SILVERMOON_6000",
  name = "Friend of the Silvermoon",
  description = "Gain 6,000 reputation with the Silvermoon Remnant.",
  type = "reputation",
  subtype = "alliance",
  faction = "Silvermoon Remnant",
  value = 6000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 5,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "REPUTATION_SILVERMOON_12000",
  name = "Honorary Sin'dorei",
  description = "Gain 12,000 reputation with the Silvermoon Remnant.",
  type = "reputation",
  subtype = "alliance",
  faction = "Silvermoon Remnant",
  value = 12000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 10,
  requiredFor = {},
})

table.insert(KAMN.achievements, {
  id = "REPUTATION_SILVERMOON_21000",
  name = "Champion of Silvermoon",
  description = "Gain 21,000 reputation with the Silvermoon Remnant.",
  type = "reputation",
  subtype = "alliance",
  faction = "Silvermoon Remnant",
  value = 21000,
  progress = 0,
  complete = false,
  category = "Reputation",
  points = 20,
  requiredFor = {},
})
