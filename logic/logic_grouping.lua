-- 🧩 logic_grouping.lua – Achievement Grouping & Sorting (Turtle WoW 1.12 / Lua 5.1)
-- Änderung: 'death' wird wie Level-Stats gruppiert (→ "stat"), sodass die Anzeige unter "Character" erfolgt.

-- Gruppiert und sortiert Erfolge nach Typ, Subtyp oder Kategorie
function KAM_GroupAndSortAchievements(matches, category, filter)
  local typeMap = {
    kill = "mob",                -- Einzelziele wie "Prairie Dog", "Deer"
    generickill = "kills",       -- Massenkills: "Kill 10", "Kill 100", etc.
    namedkill = "namedkills",
    namedkillgroup = "namedkillgroup",
    quest = "quests",
    namedquest = "namedquests",
    level = "stat",
    -- 🆕 Death-Erfolge wie Level/Stats behandeln, damit sie in "Character" erscheinen
    death = "stat",

    zone = "explore",
    discover = "explore",
    bosskill = "bosskill",
    meta = "meta",
    misc = "misc",
    skill = "skill",
    weapon = "weapon",
  }

  local groups = {}

  for _, a in ipairs(matches) do
    local t

    -- 🧭 Meta-Erfolge (Exploration & allgemeine Meta)
    if a.type == "meta" and a.category == "Exploration" then
      t = "explore"
    elseif a.type == "meta" and a.category == "meta" then
      t = a.subcategory or "other"

    -- 🧱 Standard-Zuweisung
    else
      local rawType = a.type or "_other"
      t = typeMap[rawType] or rawType
    end

    if not groups[t] then groups[t] = {} end
    table.insert(groups[t], a)
  end

  local orderMap = {
    Combat = {"kills", "mob", "namedkills", "namedkillgroup", "bosskill"},
    Skills = {"skill", "weapon"},
    Reputation = {"reputation"},
    Quests = {"quests", "namedquests"},
    Exploration = {"explore"},
    Character = {"stat"}, -- 'death' steckt jetzt in 'stat', daher keine weitere Änderung nötig
    Misc = {"misc"},
  }

  local order
  if category == "meta" then
    local dynamicKeys = {}
    for k, _ in pairs(groups) do
      table.insert(dynamicKeys, k)
    end
    table.sort(dynamicKeys)
    order = dynamicKeys
  else
    order = orderMap[category]
    if category == "ALL" or not order then
      order = {
        "stat", "quests", "kills", "mob", "reputation",
        "namedkills", "namedkillgroup", "bosskill",
        "explore", "namedquests", "skill", "weapon",
        "misc", "meta", "legacy"
      }
    end
  end

  return groups, order
end

-- 🔁 Export
KAMN = KAMN or {}
KAMN.KAM_GroupAndSortAchievements = KAM_GroupAndSortAchievements
