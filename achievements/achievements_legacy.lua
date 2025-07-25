-- achievements_legacy.lua
-- Legacy achievements that are no longer obtainable, but preserved for history

KAMN = KAMN or {}
KAMN.achievements = KAMN.achievements or {}

-- 🕰️ Legacy Title from early access
table.insert(KAMN.achievements, {
  id = "LEG_001",
  name = "KAM Alpha Hero",
  description = "Awarded to players who participated during the KAM Alpha Phase.",
  type = "legacy",
  category = "Legacy",
  active = false,
  points = 0
})

