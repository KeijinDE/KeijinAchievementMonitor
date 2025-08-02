-- achievements_skills.lua
-- Skills & Weapon Achievements (English only, Turtle WoW Classic 1.12)

KAMN = KAMN or {}
KAMN.achievements = KAMN.achievements or {}

local professions = {
  { id = "ALCHEMY", name = "Alchemy" },
  { id = "BLACKSMITHING", name = "Blacksmithing" },
  { id = "COOKING", name = "Cooking" },
  { id = "ENCHANTING", name = "Enchanting" },
  { id = "ENGINEERING", name = "Engineering" },
  { id = "FIRSTAID", name = "First Aid" },
  { id = "FISHING", name = "Fishing" },
  { id = "HERBALISM", name = "Herbalism" },
  { id = "LEATHERWORKING", name = "Leatherworking" },
  { id = "MINING", name = "Mining" },
  { id = "SKINNING", name = "Skinning" },
  { id = "TAILORING", name = "Tailoring" },
  { id = "JEWELCRAFTING", name = "Jewelcrafting" },
}

local steps = {
  { value = 75, title = "Apprentice", points = 5 },
  { value = 150, title = "Journeyman", points = 10 },
  { value = 225, title = "Expert", points = 15 },
  { value = 300, title = "Artisan", points = 20 },
}

for _, p in ipairs(professions) do
  for _, step in ipairs(steps) do
    table.insert(KAMN.achievements, {
      id = "SKILL_" .. p.id .. "_" .. step.value,
      name = p.name .. " " .. step.title,
      description = "Reach " .. step.value .. " skill points in " .. p.name .. ".",
      type = "skill",
      skillname = p.name,
      value = step.value,
      group = p.name .. "_" .. step.value,
      category = "Skills",
      points = step.points
    })
  end
end
