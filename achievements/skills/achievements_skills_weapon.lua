-- 📄 achievements_skills_weapon.lua
-- All weapon skill achievements with progressive group logic
-- Turtle WoW (1.12) compatible
KAMN = KAMN or {}
KAMN.achievements = KAMN.achievements or {}

local weapons = {
  { id = "UNARMED", name = "Unarmed" },
  { id = "DEFENSE", name = "Defense" },
  { id = "CROSSBOWS", name = "Crossbows" },
  { id = "DAGGERS", name = "Daggers" },
  { id = "GUNS", name = "Guns" },
  { id = "MACES", name = "Maces" },
  { id = "POLEARMS", name = "Polearms" },
  { id = "THROWN", name = "Thrown" },
  { id = "2H_AXES", name = "Two-Handed Axes" },
  { id = "2H_MACES", name = "Two-Handed Maces" },
  { id = "2H_SWORDS", name = "Two-Handed Swords" },
  { id = "WANDS", name = "Wands" },
  { id = "FIST", name = "Fist Weapons" },
  { id = "STAVES", name = "Staves" },
  { id = "SWORDS", name = "Swords" },
  { id = "AXES", name = "Axes" },
}

local steps = {
  { value = 15, title = "Initiate", points = 2 },
  { value = 50, title = "Apprentice", points = 5 },
  { value = 100, title = "Journeyman", points = 10 },
  { value = 200, title = "Expert", points = 15 },
  { value = 300, title = "Master", points = 20 },
}

for _, w in ipairs(weapons) do
  for _, step in ipairs(steps) do
    table.insert(KAMN.achievements, {
      id = "WEAPON_" .. w.id .. "_" .. step.value,
      name = w.name .. " " .. step.title,
      description = "Reach " .. step.value .. " in " .. w.name .. " weapon skill.",
      type = "weapon",
      skillname = w.name,
      value = step.value,
      group = w.name .. "_" .. step.value,
      category = "Skills",
      points = step.points
    })
  end
end
