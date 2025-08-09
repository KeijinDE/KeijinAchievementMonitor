-- achievements_hardcore_rep.lua
-- Hardcore variants of Reputation achievements (mirror of achievements_reputation.lua)

KAMN = KAMN or {}
KAMN.achievements = KAMN.achievements or {}

local function addRep(id, name, desc, faction, value, subtype, points)
  table.insert(KAMN.achievements, {
    id = "HC_" .. id,
    name = "Hardcore: " .. name,
    description = desc .. " (Hardcore)",
    type = "reputation",
    subtype = subtype,
    faction = faction,
    value = value,
    progress = 0,
    complete = false,
    category = "Hardcore",
    points = points,
    requiresHC = true,
    active = false,
  })
end

-- Argent Dawn
addRep("REPUTATION_ARGENTDAWN_1000",  "Initiate of Light",
  "Gain 1000 reputation with Argent Dawn. Begin earning favor with the Argent Dawn.",
  "Argent Dawn", 1000, "neutral", 5)
addRep("REPUTATION_ARGENTDAWN_3000",  "Crypt Watcher",
  "Gain 3000 reputation with Argent Dawn. Gain recognition as a guardian of the crypts.",
  "Argent Dawn", 3000, "neutral", 5)
addRep("REPUTATION_ARGENTDAWN_6000",  "Scourge Breaker",
  "Gain 6000 reputation with Argent Dawn. Lead the fight against the Scourge.",
  "Argent Dawn", 6000, "neutral", 5)
addRep("REPUTATION_ARGENTDAWN_10000", "Dawnbringer",
  "Gain 10000 reputation with Argent Dawn. Become a beacon of hope for Lordaeron.",
  "Argent Dawn", 10000, "neutral", 5)

-- Timbermaw Hold
addRep("REPUTATION_TIMBERMAWHOLD_1000",  "Outsider",
  "Gain 1000 reputation with Timbermaw Hold. Gain a cautious welcome in Timbermaw tunnels.",
  "Timbermaw Hold", 1000, "neutral", 5)
addRep("REPUTATION_TIMBERMAWHOLD_3000",  "Tunnel Friend",
  "Gain 3000 reputation with Timbermaw Hold. Prove yourself as a trusted passer.",
  "Timbermaw Hold", 3000, "neutral", 5)
addRep("REPUTATION_TIMBERMAWHOLD_6000",  "Furbolg Ally",
  "Gain 6000 reputation with Timbermaw Hold. Form strong bonds with the Furbolg tribe.",
  "Timbermaw Hold", 6000, "neutral", 5)
addRep("REPUTATION_TIMBERMAWHOLD_10000", "Honorary Timbermaw",
  "Gain 10000 reputation with Timbermaw Hold. Earn the full respect of Timbermaw Hold.",
  "Timbermaw Hold", 10000, "neutral", 5)

-- Ratchet
addRep("REPUTATION_RATCHET_1000",  "Errand Runner",
  "Gain 1000 reputation with Ratchet. Get your foot in the door in Ratchet.",
  "Ratchet", 1000, "neutral", 5)
addRep("REPUTATION_RATCHET_3000",  "Frequent Fixer",
  "Gain 3000 reputation with Ratchet. Help out with odd jobs and deliveries.",
  "Ratchet", 3000, "neutral", 5)
addRep("REPUTATION_RATCHET_6000",  "Contract Partner",
  "Gain 6000 reputation with Ratchet. Become known among Ratchet's traders.",
  "Ratchet", 6000, "neutral", 5)
addRep("REPUTATION_RATCHET_10000", "Honorary Foreman",
  "Gain 10000 reputation with Ratchet. Be treated like one of the cartel's own.",
  "Ratchet", 10000, "neutral", 5)

-- Gadgetzan
addRep("REPUTATION_GADGETZAN_1000",  "Newcomer",
  "Gain 1000 reputation with Gadgetzan. Start building ties in the desert town.",
  "Gadgetzan", 1000, "neutral", 5)
addRep("REPUTATION_GADGETZAN_3000",  "Sand-Savvy",
  "Gain 3000 reputation with Gadgetzan. Learn the ropes in Gadgetzan’s dusty trade.",
  "Gadgetzan", 3000, "neutral", 5)
addRep("REPUTATION_GADGETZAN_6000",  "Deal Maker",
  "Gain 6000 reputation with Gadgetzan. Seal your reputation as a reliable ally.",
  "Gadgetzan", 6000, "neutral", 5)
addRep("REPUTATION_GADGETZAN_10000", "Tanaris Tycoon",
  "Gain 10000 reputation with Gadgetzan. Become a big name in desert dealings.",
  "Gadgetzan", 10000, "neutral", 5)

-- Everlook
addRep("REPUTATION_EVERLOOK_1000",  "Cold Caller",
  "Gain 1000 reputation with Everlook. Make your presence known in the frozen north.",
  "Everlook", 1000, "neutral", 5)
addRep("REPUTATION_EVERLOOK_3000",  "Snow Supplier",
  "Gain 3000 reputation with Everlook. Deliver goods through snow and ice.",
  "Everlook", 3000, "neutral", 5)
addRep("REPUTATION_EVERLOOK_6000",  "Winter Broker",
  "Gain 6000 reputation with Everlook. Become a go-to partner in Everlook’s market.",
  "Everlook", 6000, "neutral", 5)
addRep("REPUTATION_EVERLOOK_10000", "Frosthold Friend",
  "Gain 10000 reputation with Everlook. Be counted among Everlook’s trusted few.",
  "Everlook", 10000, "neutral", 5)

-- Booty Bay
addRep("REPUTATION_BOOTYBAY_1000",  "Deck Sweeper",
  "Gain 1000 reputation with Booty Bay. Get noticed by the goblins of Booty Bay.",
  "Booty Bay", 1000, "neutral", 5)
addRep("REPUTATION_BOOTYBAY_3000",  "Rum Runner",
  "Gain 3000 reputation with Booty Bay. Run errands (and maybe some rum) for the crew.",
  "Booty Bay", 3000, "neutral", 5)
addRep("REPUTATION_BOOTYBAY_6000",  "Port Agent",
  "Gain 6000 reputation with Booty Bay. Oversee dealings along the docks.",
  "Booty Bay", 6000, "neutral", 5)
addRep("REPUTATION_BOOTYBAY_10000", "Buccaneer's Bestie",
  "Gain 10000 reputation with Booty Bay. Become the pirates’ favorite partner ashore.",
  "Booty Bay", 10000, "neutral", 5)

--------------------------------------------------
-- Horde Cities
--------------------------------------------------
addRep("REPUTATION_ORGRIMMAR_1000",  "Strength of Orgrimmar",     "Gain 1000 reputation with Orgrimmar.", "Orgrimmar",     1000,  "horde",   5)
addRep("REPUTATION_ORGRIMMAR_3000",  "Trusted by Orgrimmar",       "Gain 3000 reputation with Orgrimmar.", "Orgrimmar",     3000,  "horde",   5)
addRep("REPUTATION_ORGRIMMAR_6000",  "Ally of Orgrimmar",          "Gain 6000 reputation with Orgrimmar.", "Orgrimmar",     6000,  "horde",   10)
addRep("REPUTATION_ORGRIMMAR_21000", "Champion of Orgrimmar",      "Gain 21000 reputation with Orgrimmar.","Orgrimmar",     21000, "horde",   20)

addRep("REPUTATION_THUNDERBLUFF_1000",  "Horns of Honor",               "Gain 1000 reputation with Thunder Bluff.", "Thunder Bluff", 1000,  "horde", 5)
addRep("REPUTATION_THUNDERBLUFF_3000",  "Trusted by Thunder Bluff",     "Gain 3000 reputation with Thunder Bluff.", "Thunder Bluff", 3000,  "horde", 5)
addRep("REPUTATION_THUNDERBLUFF_6000",  "Ally of Thunder Bluff",        "Gain 6000 reputation with Thunder Bluff.", "Thunder Bluff", 6000,  "horde", 10)
addRep("REPUTATION_THUNDERBLUFF_21000", "Champion of Thunder Bluff",    "Gain 21000 reputation with Thunder Bluff.","Thunder Bluff", 21000, "horde", 20)

addRep("REPUTATION_UNDERCITY_1000",  "Shadow Ally",                "Gain 1000 reputation with Undercity.", "Undercity", 1000,  "horde", 5)
addRep("REPUTATION_UNDERCITY_3000",  "Trusted by Undercity",       "Gain 3000 reputation with Undercity.", "Undercity", 3000,  "horde", 5)
addRep("REPUTATION_UNDERCITY_6000",  "Ally of Undercity",          "Gain 6000 reputation with Undercity.", "Undercity", 6000,  "horde", 10)
addRep("REPUTATION_UNDERCITY_21000", "Champion of Undercity",      "Gain 21000 reputation with Undercity.","Undercity", 21000, "horde", 20)

addRep("REPUTATION_DARKSPEAR_1000",  "Troll Kin",                              "Gain 1000 reputation with the Darkspear Trolls.", "Darkspear Trolls", 1000,  "horde", 5)
addRep("REPUTATION_DARKSPEAR_3000",  "Trusted by the Darkspear Trolls",        "Gain 3000 reputation with the Darkspear Trolls.", "Darkspear Trolls", 3000,  "horde", 5)
addRep("REPUTATION_DARKSPEAR_6000",  "Ally of the Darkspear Trolls",           "Gain 6000 reputation with the Darkspear Trolls.", "Darkspear Trolls", 6000,  "horde", 10)
addRep("REPUTATION_DARKSPEAR_21000", "Champion of the Darkspear Trolls",       "Gain 21000 reputation with the Darkspear Trolls.","Darkspear Trolls", 21000, "horde", 20)

--------------------------------------------------
-- Alliance Cities
--------------------------------------------------
addRep("REPUTATION_STORMWIND_1000",  "Shield of Stormwind",   "Gain 1000 reputation with Stormwind.",   "Stormwind",   1000,  "alliance", 5)
addRep("REPUTATION_STORMWIND_3000",  "Trusted by Stormwind",  "Gain 3000 reputation with Stormwind.",    "Stormwind",   3000,  "alliance", 5)
addRep("REPUTATION_STORMWIND_6000",  "Ally of Stormwind",     "Gain 6000 reputation with Stormwind.",    "Stormwind",   6000,  "alliance", 10)
addRep("REPUTATION_STORMWIND_21000", "Champion of Stormwind", "Gain 21000 reputation with Stormwind.",   "Stormwind",   21000, "alliance", 20)

addRep("REPUTATION_IRONFORGE_1000",  "Honor of Ironforge",   "Gain 1000 reputation with Ironforge.",   "Ironforge",   1000,  "alliance", 5)
addRep("REPUTATION_IRONFORGE_3000",  "Trusted by Ironforge", "Gain 3000 reputation with Ironforge.",    "Ironforge",   3000,  "alliance", 5)
addRep("REPUTATION_IRONFORGE_6000",  "Ally of Ironforge",    "Gain 6000 reputation with Ironforge.",    "Ironforge",   6000,  "alliance", 10)
addRep("REPUTATION_IRONFORGE_21000", "Champion of Ironforge","Gain 21000 reputation with Ironforge.",   "Ironforge",   21000, "alliance", 20)

addRep("REPUTATION_DARNASSUS_1000",  "Grace of Darnassus",   "Gain 1000 reputation with Darnassus.",   "Darnassus",   1000,  "alliance", 5)
addRep("REPUTATION_DARNASSUS_3000",  "Trusted by Darnassus", "Gain 3000 reputation with Darnassus.",    "Darnassus",   3000,  "alliance", 5)
addRep("REPUTATION_DARNASSUS_6000",  "Ally of Darnassus",    "Gain 6000 reputation with Darnassus.",    "Darnassus",   6000,  "alliance", 10)
addRep("REPUTATION_DARNASSUS_21000", "Champion of Darnassus","Gain 21000 reputation with Darnassus.",   "Darnassus",   21000, "alliance", 20)

addRep("REPUTATION_GNOMEREGAN_1000",  "Spark of Gnomeregan",                "Gain 1000 reputation with the Gnomeregan Exiles.", "Gnomeregan Exiles", 1000,  "alliance", 5)
addRep("REPUTATION_GNOMEREGAN_3000",  "Trusted by the Gnomeregan Exiles",   "Gain 3000 reputation with the Gnomeregan Exiles.", "Gnomeregan Exiles", 3000,  "alliance", 5)
addRep("REPUTATION_GNOMEREGAN_6000",  "Ally of the Gnomeregan Exiles",      "Gain 6000 reputation with the Gnomeregan Exiles.", "Gnomeregan Exiles", 6000,  "alliance", 10)
addRep("REPUTATION_GNOMEREGAN_21000", "Champion of the Gnomeregan Exiles",  "Gain 21000 reputation with the Gnomeregan Exiles.","Gnomeregan Exiles", 21000, "alliance", 20)

-- Durotar Labor Union (Horde)
addRep("REPUTATION_DUROTAR_1000",  "Durotar Associate",         "Gain 1,000 reputation with the Durotar Labor Union.", "Durotar Labor Union", 1000,  "horde",   5)
addRep("REPUTATION_DUROTAR_3000",  "Durotar Aide",              "Gain 3,000 reputation with the Durotar Labor Union.", "Durotar Labor Union", 3000,  "horde",   5)
addRep("REPUTATION_DUROTAR_6000",  "Labor Union Partner",       "Gain 6,000 reputation with the Durotar Labor Union.", "Durotar Labor Union", 6000,  "horde",   5)
addRep("REPUTATION_DUROTAR_12000", "Durotar Ally",              "Gain 12,000 reputation with the Durotar Labor Union.","Durotar Labor Union", 12000, "horde",   10)
addRep("REPUTATION_DUROTAR_21000", "Champion of the Labor Union","Gain 21,000 reputation with the Durotar Labor Union.","Durotar Labor Union", 21000, "horde",   20)

-- Silvermoon Remnant (Alliance)
addRep("REPUTATION_SILVERMOON_1000",  "Ally of the Remnant",      "Gain 1,000 reputation with the Silvermoon Remnant.", "Silvermoon Remnant", 1000,  "alliance", 5)
addRep("REPUTATION_SILVERMOON_3000",  "Respected by the Remnant", "Gain 3,000 reputation with the Silvermoon Remnant.", "Silvermoon Remnant", 3000,  "alliance", 5)
addRep("REPUTATION_SILVERMOON_6000",  "Friend of the Silvermoon", "Gain 6,000 reputation with the Silvermoon Remnant.", "Silvermoon Remnant", 6000,  "alliance", 5)
addRep("REPUTATION_SILVERMOON_12000", "Honorary Sin'dorei",       "Gain 12,000 reputation with the Silvermoon Remnant.","Silvermoon Remnant", 12000, "alliance", 10)
addRep("REPUTATION_SILVERMOON_21000", "Champion of Silvermoon",   "Gain 21,000 reputation with the Silvermoon Remnant.","Silvermoon Remnant", 21000, "alliance", 20)
