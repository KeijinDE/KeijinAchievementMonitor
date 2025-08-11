-- events/events_identity.lua
-- Identity achievements (Race/Class) via UnitRace/UnitClass.
-- Classic 1.12 / Lua 5.1 compatible. No OnUpdate/elapsed, no modern Lua features.

-- =========================
-- 🔎 Helpers (Classic-safe)
-- =========================

-- Normalize tokens:
--  - uppercase
--  - remove non-word chars (spaces, hyphens, apostrophes)
--  - map aliases (UNDEAD -> SCOURGE, BLOODELF -> HIGHELF for Turtle High Elves)
local function KAMN_NormalizeToken(s)
  if type(s) ~= "string" then return s end
  local t = string.upper(s)
  t = string.gsub(t, "%W", "") -- remove spaces and punctuation
  -- Aliases / server-specific quirks
  if t == "UNDEAD"   then t = "SCOURGE" end
  if t == "BLOODELF" then t = "HIGHELF" end
  return t
end

-- Return stable class token (e.g. "WARRIOR")
local function KAMN_GetPlayerClassToken()
  local _, classToken = UnitClass("player")
  return KAMN_NormalizeToken(classToken)
end

-- Return stable race token (e.g. "HUMAN","DWARF","NIGHTELF","SCOURGE","HIGHELF","GOBLIN")
-- Classic/Turtle can return only a localized name; fall back to name if token is nil.
local function KAMN_GetPlayerRaceToken()
  local raceName, raceToken = UnitRace("player")
  local raw = raceToken or raceName
  return KAMN_NormalizeToken(raw)
end

-- Read progress from in-memory registry (no SavedVariables touched)
local function KAMN_GetRegistryProgress(id)
  if KAMN_RegistryByID and KAMN_RegistryByID[id] and KAMN_RegistryByID[id].progress then
    return KAMN_RegistryByID[id].progress
  end
  return 0
end

-- =========================
-- ✅ Complete identity once
-- =========================
local function KAMN_HandleIdentityForCharacter()
  if not KAMN or not KAMN.achievements then return end

  local classToken = KAMN_GetPlayerClassToken()
  local raceToken  = KAMN_GetPlayerRaceToken()
  local updated    = false

  -- Complete matching race/class identity (one-shot)
  local i
  for i = 1, (type(KAMN.achievements) == "table" and table.getn(KAMN.achievements) or 0) do
    local a = KAMN.achievements[i]
    if a and a.type == "identity" and (a.active ~= false) and not a.complete then
      -- Race
      if a.subtype == "race" and a.race and type(a.race) == "string" then
        if KAMN_NormalizeToken(a.race) == raceToken then
          local current = KAMN_GetRegistryProgress(a.id)
          if current < 1 and type(KAMN_TriggerProgress) == "function" then
            KAMN_TriggerProgress(a.id, 1, false)
            updated = true
          end
        end
      end
      -- Class
      if a.subtype == "class" and a.class and type(a.class) == "string" then
        if KAMN_NormalizeToken(a.class) == classToken then
          local current = KAMN_GetRegistryProgress(a.id)
          if current < 1 and type(KAMN_TriggerProgress) == "function" then
            KAMN_TriggerProgress(a.id, 1, false)
            updated = true
          end
        end
      end
    end
  end

  -- UI only if something changed
  if updated and KAMNMainFrame and KAMNMainFrame:IsShown() and type(KAMN_UpdateUI) == "function" then
    KAMN_UpdateUI()
  end

end

-- =========================
-- 🎛️ Module Frame
-- =========================
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_ENTERING_WORLD") -- also fires after /reload
frame:RegisterEvent("VARIABLES_LOADED")      -- ensure SavedVariables are there

frame:SetScript("OnEvent", function()
  if event == "PLAYER_LOGIN" or event == "PLAYER_ENTERING_WORLD" or event == "VARIABLES_LOADED" then
    KAMN_HandleIdentityForCharacter()
  end
end)
