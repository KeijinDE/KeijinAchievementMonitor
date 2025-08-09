-- achievements_hardcore_quest.lua
-- Hardcore variants of Generic Quest achievements (mirror of achievements_quests_generic.lua)

KAMN = KAMN or {}
KAMN.achievements = KAMN.achievements or {}

local function add(id, name, value, points)
  table.insert(KAMN.achievements, {
    id = "HC_" .. id,
    name = "Hardcore: " .. name,
    description = "Complete " .. tostring(value) .. " quests while in Hardcore mode.",
    type = "quest",
    value = value,
    progress = 0,
    complete = false,
    category = "Hardcore",
    points = points,
    requiresHC = true,
    active = false,
  })
end

add("QUEST_01",   "First Steps",           1,     5)
add("QUEST_05",   "Apprentice Adventurer", 5,     5)
add("QUEST_10",   "Reliable Messenger",    10,    5)
add("QUEST_25",   "Seasoned Scout",        25,    5)
add("QUEST_50",   "Village Hero",          50,    5)
add("QUEST_100",  "Tried and True",        100,   5)
add("QUEST_200",  "Champion of the Land",  200,   5)
add("QUEST_500",  "Quest Machine",         500,   5)
add("QUEST_1000", "Master of Scrolls",     1000,  10)
add("QUEST_2000", "Scrollbreaker",         2000,  10)
add("QUEST_3000", "Continental Agent",     3000,  10)
add("QUEST_4000", "Hero of the People",    4000,  10)
add("QUEST_5000", "Legend in Ink",         5000,  15)
add("QUEST_6000", "Tomewalker",            6000,  15)
add("QUEST_7000", "Writkeeper",            7000,  15)
add("QUEST_8000", "Epic Archivist",        8000,  15)
add("QUEST_9000", "Mythmaker",             9000,  15)
add("QUEST_10000","Beyond the Scroll",     10000, 15)
