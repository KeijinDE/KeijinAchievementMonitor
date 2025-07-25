-- achievements_legacy.lua
-- Legacy achievements that are no longer obtainable, but preserved for history

KAMN = KAMN or {}
KAMN.achievements = KAMN.achievements or {}

-- 🕰️ Legacy Title from early access

--[[
-- 🏆 Legacy Achievement (Template)
-- Dieser Erfolg ist dauerhaft inaktiv und dient als Andenken an eine besondere Phase oder Aktion.
-- Wichtig: active = false → verhindert Anzeige im "offene Erfolge"-Modus
-- Es wird kein Fortschritt gesammelt – der Erfolg muss manuell oder durch Eventabschluss gesetzt werden

table.insert(KAMN.achievements, {
  id = "LEG_TEMPLATE01",                          -- Eindeutige ID, bei bestehenden Erfolg muss beibehalten werden
  name = "Legacy Tester",                         -- Sichtbarer Name im UI
  description = "Awarded to testers of the early KAM system.",  -- Beschreibung (nur EN aktuell)
  type = "legacy",                                -- Erfolgs-Typ (für UI-Gruppierung)
  oldtype = "combat"                              -- Ursprünglicher Typ vor Archivierung
  category = "Legacy",                            -- Zugehörige Kategorie (für Sortierung/Anzeige)
  active = false,                                 -- 🔒 Kein Fortschritt mehr möglich
  points = 0,                                     -- Kein Einfluss auf Punktesumme
  requiredFor = {}                                -- Optional: leerlassen, systemverwaltet
})
]]

