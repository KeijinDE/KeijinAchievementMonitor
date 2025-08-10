-- labels.lua
-- Segment-/Seiten-Definitionen für die "ALL"-Ansicht
-- Classic-kompatibel (Lua 5.1). Fügt eine HC-Seite (ALL13B) hinzu, die nur bei aktivem Hardcore Inhalte anzeigt.

KAM_LABELS = KAM_LABELS or {}
KAMN = KAMN or {}

-- 🔎 Mini-Helper: Hardcore-Status (nutzt API oder Cache)
local function KAMN_HardcoreEnabled()
  -- Bevorzugt die offizielle API
  if type(KAMN_IsHardcore) == "function" then
    local ok = KAMN_IsHardcore()
    if ok ~= nil then return ok == true end
  end
  -- Fallback: gespeicherter Cache
  local name = UnitName and UnitName("player") or "Unknown"
  local realm = GetRealmName and GetRealmName() or "Realm"
  local key = realm .. "-" .. name
  if KAMN_CharacterDB and KAMN_CharacterDB[key] and KAMN_CharacterDB[key].isHardcore ~= nil then
    return KAMN_CharacterDB[key].isHardcore == true
  end
  return false
end

-- ✅ Zentrale Zuordnung von questhub-Namen zu Themenseiten
KAMN.QuestHubSets = {
  -- 🔥 Raids
  raid = {
    ["Onyxia's Lair"]      = true,
    ["Blackwing Lair"]     = true,
    ["Molten Core"]        = true,
    ["Naxxramas"]          = true,
    ["Ruins of Ahn'Qiraj"] = true,
    ["Temple of Ahn'Qiraj"]= true,
    ["Zul'Gurub"]          = true,
  },

  -- 🛠 Professions
  profession = {
    ["Alchemy"]        = true,
    ["Blacksmithing"]  = true,
    ["Cooking"]        = true,
    ["Engineering"]    = true,
    ["First Aid"]      = true,
    ["Fishing"]        = true,
    ["Herbalism"]      = true,
    ["Leatherworking"] = true,
    ["Tailoring"]      = true,
  },

  -- 🧩 Classes
  class = {
    ["Druid"]   = true,
    ["Hunter"]  = true,
    ["Mage"]    = true,
    ["Paladin"] = true,
    ["Priest"]  = true,
    ["Rogue"]   = true,
    ["Shaman"]  = true,
    ["Warlock"] = true,
    ["Warrior"] = true,
  },
}

-- accept both "Raid: X" and "X"
local function KAMN_HubIn(setname, a)
  if not a or a.category ~= "Quests" then return false end
  local hub = a.questhub
  if not hub then return false end
  local sets = KAMN.QuestHubSets and KAMN.QuestHubSets[setname]
  if not sets then return false end
  -- strip optional "Raid: " prefix for matching
  local clean = string.gsub(hub, "^Raid:%s*", "")
  return sets[hub] == true or sets[clean] == true
end

-- 📚 ALL-Ansicht: Seiten (Segmente)
KAMN.AllCategorySegments = {
  {
    key = "ALL1",
    label = "Generic Progression",
    filter = function(a)
      if not a then return false end
      -- Hardcore-Generics auf non-HC-Char ausblenden,
      -- Vergleich in ALL13B weiterhin möglich
      if a.category == "Hardcore" and not KAMN_HardcoreEnabled() then
        return false
      end

      local t = a.type
      -- Level, generische Quests, generische Kills, Death (inkl. Meilensteine)
      return t == "level" or t == "quest" or t == "generickill" or t == "death"
    end
  },

  -- {
  --   key = "ALL2",
  --   label = "Named Quests",
  --   filter = function(a)
  --     return a.type == "namedquest"
  --   end
  -- },
  {
    key = "ALL3",
    label = "Combat: Named & Boss",
    filter = function(a)
      local t = a.type
      return t == "kill" or t == "namedkill" or t == "namedkillgroup" or t == "bosskill"
    end
  },

  {
    key = "ALL4",
    label = "Quests: Story",
    filter = function(a)
      if a.type ~= "namedquest" then return false end
      local inClass = KAMN_HubIn("class", a)
      local inProf  = KAMN_HubIn("profession", a)
      local inRaid  = KAMN_HubIn("raid", a)
      return not (inClass or inProf or inRaid)
    end
  },
  {
    key = "ALL4b",
    label = "Quests: Professions",
    filter = function(a)
      return KAMN_HubIn("profession", a)
    end
  },
  {
    key = "ALL4c",
    label = "Quests: Raids",
    filter = function(a)
      return KAMN_HubIn("raid", a)
    end
  },
  {
    key = "ALL4d",
    label = "Quests: Class",
    filter = function(a)
      return KAMN_HubIn("class", a)
    end
  },

  {
    key = "ALL5",
    label = "Exploration: Capitals",
    filter = function(a)
      return a.zonegroup == "Capitals"
    end
  },
  {
    key = "ALL6",
    label = "Exploration: Kalimdor",
    filter = function(a)
      return a.continent == "Kalimdor"
    end
  },
  {
    key = "ALL7",
    label = "Exploration: Eastern Kingdoms",
    filter = function(a)
      return a.continent == "Eastern Kingdoms"
    end
  },

  {
    key = "ALL8",
    label = "Reputation: Neutral",
    category = "Reputation",
    filter = function(a)
      return a.type == "reputation" and a.subtype == "neutral"
    end
  },
  {
    key = "ALL9",
    label = "Reputation: Alliance",
    category = "Reputation",
    filter = function(a)
      return a.type == "reputation" and a.subtype == "alliance"
    end
  },
  {
    key = "ALL10",
    label = "Reputation: Horde",
    category = "Reputation",
    filter = function(a)
      return a.type == "reputation" and a.subtype == "horde"
    end
  },

  {
    key = "ALL11",
    label = "Professions",
    filter = function(a)
      return a.type == "skill"
    end
  },
  {
    key = "ALL12",
    label = "Weapon Mastery",
    filter = function(a)
      return a.type == "weapon"
    end
  },

  {
    key = "ALL13",
    label = "Meta Achievements",
    filter = function(a)
      return a.category == "Meta"
    end
  },

   {
    key = "ALL13B",
    label = "Hardcore Achievements",
    filter = function(a)
      if not (a and a.category == "Hardcore") then return false end
      return KAMN_HardcoreEnabled()
    end
  },

  {
    key = "ALL14",
    label = "Miscellaneous",
    filter = function(a)
      return a.type == "misc"
    end
  },
{
  key = "ALL15",
  label = "Legacy Achievements",
  filter = function(a)
    -- Legacy nur anzeigen, wenn abgeschlossen
    return a and a.type == "legacy" and a.complete == true
  end
},
}
-- 🧭 Kompatibilität: Map (key → filter) aus der Liste erzeugen
KAMN.AllCategorySegmentMap = {}
do
  local i
  for i = 1, table.getn(KAMN.AllCategorySegments) do
    local seg = KAMN.AllCategorySegments[i]
    if seg and seg.key and type(seg.filter) == "function" then
      KAMN.AllCategorySegmentMap[seg.key] = seg.filter
    end
  end
end
-- 📛 Gruppenbezeichnungen
KAM_LABELS.groups = {
  progress = "Achievement Progress",
  combat   = "Combat Challenges",
  other    = "Other Meta Achievements",
  explore  = "World Discovery",
  stat     = "Character Growth",
  quests   = "Quest Milestones",
  kills    = "Combat Progress",
  reputation = "Factions & Standing",
  namedkills = "Unique Targets",
  namedkillgroup = "Hunting Challenges",
  bosskill = "Major Encounters",
  namedquests = "Quests",
  skill = "Professions",
  weapon = "Weapon Mastery",
  misc = "Other Achievements",
  legacy = "Legacy Records",
  rep_neutral  = "Neutral Factions",
  rep_horde    = "Horde Factions",
  rep_alliance = "Alliance Factions",
  mob = "Lesser Targets",
  elite = "Elite Enemies",
  boss = "Boss Encounters",
    level = "Level Milestones",
  death = "Deaths",

}
