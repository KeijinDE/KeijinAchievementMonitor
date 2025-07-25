-- achievements_misc.lua
-- Miscellaneous Achievements (English only, inactive example)

KAMN = KAMN or {}
KAMN.achievements = KAMN.achievements or {}

-- Example achievement (inactive, placeholder)
-- Uncomment and define logic in events.lua if you want to use it

--[[
table.insert(KAMN.achievements, {
  id = "MISC_EXAMPLE1",
  name = "Curious Clicker",
  description = "Click a mysterious button somewhere in the world.",
  type = "misc",
  value = 1,
  progress = 0,
  complete = false,
  category = "General"
, points = 0 , requiredFor = {} })
]]

-- 🧪 Beta-Teilnahme-Erfolg (wird beim Einloggen oder durch manuelles Triggern vergeben)
table.insert(KAMN.achievements, {
  id = "MISC_999",
  name = "KAM Beta Tester",
  description = "Thank you for testing the KAM Addon during its Beta development.",
  type = "misc",
  category = "Misc",
  points = 5 , requiredFor = {}
})
