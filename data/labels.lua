KAM_LABELS = KAM_LABELS or {}



KAMN.AllCategorySegments = {
  {
    key = "ALL1",
    label = "Generic Progression",
    filter = function(a)
      local t = a.type
      return t == "level" or t == "quest" or t == "kill"
    end
  },
  {
    key = "ALL2",
    label = "Named Quests",
    filter = function(a)
      return a.type == "namedquest"
    end
  },
  {
    key = "ALL3",
    label = "Combat: Named & Boss",
    filter = function(a)
      local t = a.type
      return t == "namedkill" or t == "namedkillgroup" or t == "bosskill"
    end
  },
  -- {
  --   key = "ALL4",
  --   label = "Reserved – Future Use",
  --   filter = function(a)
  --     return false
  --   end
  -- },
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
}
,
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
      return a.type == "legacy"
    end
  }
}

KAM_LABELS.groups = {
  progress = "Achievement Progress",
  combat   = "Combat Challenges",
  reputation  = "Faction Goals",
  other    = "Other Meta Achievements",
  explore  = "World Discovery",
  stat     = "Character Growth",
  quests   = "Quest Milestones",
  kills    = "Combat Progress",
  reputation = "Factions & Standing",
  namedkills = "Unique Targets",
  namedkillgroup = "Hunting Challenges",
  bosskill = "Major Encounters",
  namedquests = "Story Quests",
  skill = "Professions",
  weapon = "Weapon Mastery",
  misc = "Other Achievements",
  legacy = "Legacy Records"

}

