-- events_char.lua
-- Handles level-based achievements (PLAYER_LEVEL_UP event)
-- Classic-kompatibel (Lua 5.1), keine modernen Features

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LEVEL_UP")

frame:SetScript("OnEvent", function()
  if event ~= "PLAYER_LEVEL_UP" then return end

  -- Level aus arg1 (Classic-Event) oder Fallback auf Spielerlevel
  local level = arg1 or UnitLevel("player")
  local updated = false

  for _, a in ipairs(KAMN.achievements or {}) do
    -- Nur Level-Erfolge betrachten
    -- 🔒 Neu: (a.active ~= false) respektieren, damit HC-Erfolge vor Aktivierung nicht auslösen
    if a.type == "level" and (a.active ~= false) and not a.complete and a.level and level >= a.level then

      -- 🔒 Zusätzliche Sicherheitsprüfung:
      -- Wenn der Erfolg explizit HC verlangt, nur werten, wenn der Char HC ist
      if a.requiresHC == true and (not KAMN_IsHardcore or not KAMN_IsHardcore()) then
        -- Nicht werten, da kein HC – weiter zum nächsten Erfolg
      else
        -- Erfolg abschließen
        a.progress = a.level
        a.complete = true
        a.completedBy = UnitName("player")
        a.date = date("%d.%m.%Y %H:%M")
        a.timestamp = time()
        KAMN_SaveProgress(a.id, a)
        updated = true

        if KAMN_ShowNotify then
          KAMN_ShowNotify(a.name)
        end

        if KAMN and KAMN.debug then
          DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Debug]|r Level-Achievement abgeschlossen: " .. (a.id or "?"))
        end
      end
    end
  end

  if updated and KAMN_UpdateUI then
    KAMN_UpdateUI()
  end
end)
-- ==============================================================
-- Death Counter Increment (neu)
-- Erhöht bei jedem Tod den Fortschritt für DEATH_5/10/25/50/100.
-- Nutzt KAMN_TriggerProgress(id, 1) – zentrale Kappung/Abschluss
-- erfolgt in der bestehenden Trigger-Logik des Addons.
-- ==============================================================

local KAMN_DeathMilestones = { "DEATH_5", "DEATH_10", "DEATH_25", "DEATH_50", "DEATH_100" }

local function KAMN_IncrementDeathCounters()
  if not KAMN_TriggerProgress then return end

  local i
  for i = 1, table.getn(KAMN_DeathMilestones) do
    local id = KAMN_DeathMilestones[i]
    -- Optionales Vorab-Checken spart Arbeit, vermeidet aber kein Rennen:
    local a = KAMN_RegistryByID and KAMN_RegistryByID[id]
    if a and not a.complete then
      KAMN_TriggerProgress(id, 1)
    end
  end
end

-- Falls du bereits einen PLAYER_DEAD-Handler (z. B. KAMN_DeathFrame) hast,
-- rufe KAMN_IncrementDeathCounters dort einfach mit auf.
-- Beispiel (innerhalb deines bestehenden OnEvent für PLAYER_DEAD):
--   KAMN_IncrementDeathCounters()

-- Wenn du KEINEN bestehenden Death-Frame nutzt, kannst du folgenden
-- minimalen Frame separat ergänzen (keine Änderungen an anderen Events):

if not KAMN_DeathCounterFrame then
  KAMN_DeathCounterFrame = CreateFrame("Frame")
  KAMN_DeathCounterFrame:RegisterEvent("PLAYER_DEAD")
  KAMN_DeathCounterFrame:SetScript("OnEvent", function()
    if event ~= "PLAYER_DEAD" then return end
    KAMN_IncrementDeathCounters()
  end)
end

-- ==============================================================
-- Death Qualifiers (zusätzlicher Handler)
-- Löst "DEATH_FIRST" (immer) und "DEATH_NAKED" (ohne Rüstung) aus.
-- Greift NICHT in bestehende Death-Counter-Logik ein.
-- ==============================================================

if not KAMN_DeathQualifiersFrame then
  KAMN_DeathQualifiersFrame = CreateFrame("Frame")
  KAMN_DeathQualifiersFrame:RegisterEvent("PLAYER_DEAD")

  -- Nur Rüstungsslots prüfen (Waffen/Schmuck/Cloak egal)
  -- Head(1), Shoulder(3), Chest(5), Waist(6), Legs(7), Feet(8), Wrist(9), Hands(10)
  local KAMN_ArmorSlots = { 1, 3, 5, 6, 7, 8, 9, 10 }

  local function KAMN_IsWearingAnyArmor()
    local i
    for i = 1, table.getn(KAMN_ArmorSlots) do
      local slotId = KAMN_ArmorSlots[i]
      local link = GetInventoryItemLink("player", slotId)
      if link ~= nil then
        return true
      end
    end
    return false
  end

  KAMN_DeathQualifiersFrame:SetScript("OnEvent", function()
    if event ~= "PLAYER_DEAD" then return end

    -- First death (einmalig)
    if KAMN_TriggerProgress then
      local aFirst = KAMN_RegistryByID and KAMN_RegistryByID["DEATH_FIRST"]
      if aFirst and not aFirst.complete then
        KAMN_TriggerProgress("DEATH_FIRST", 1)
      end
    end

    -- Naked death (keine Rüstungs-Teile getragen)
    if not KAMN_IsWearingAnyArmor() then
      if KAMN_TriggerProgress then
        local aNaked = KAMN_RegistryByID and KAMN_RegistryByID["DEATH_NAKED"]
        if aNaked and not aNaked.complete then
          KAMN_TriggerProgress("DEATH_NAKED", 1)
        end
      end
    end

    if KAMN and KAMN.debug then
      DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Debug]|r Death qualifiers geprüft (First/Naked).")
    end
  end)
end
