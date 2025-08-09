-- events/events_hardcore.lua
-- Hardcore-Erkennung über passiven Spell im Zauberbuch + Freischaltung HC-spezifischer Erfolge
-- Kompatibel mit Turtle WoW (1.12), Lua 5.1

local function CharKey()
  if type(KAMN_GetCharKey) == "function" then
    return KAMN_GetCharKey()
  end
  local name = UnitName("player") or "Unknown"
  local realm = GetRealmName() or "Realm"
  return realm .. "-" .. name
end

KAMN_CharacterDB = KAMN_CharacterDB or {}
KAMN_Internal    = KAMN_Internal or {}

local HC_NAMES = {
  "Hardcore", -- EN
  "Hardcore", -- DE
}

local function ScanSpellbookForHardcore()
  local numTabs = GetNumSpellTabs()
  for t = 1, (numTabs or 0) do
    local _, _, offset, numSpells = GetSpellTabInfo(t)
    local startIndex = (offset or 0) + 1
    local endIndex   = (offset or 0) + (numSpells or 0)

    for i = startIndex, endIndex do
      local spellName
      local n, r = GetSpellName(i, "spell")
      if n then spellName = n end

      if spellName and type(spellName) == "string" then
        local lspell = string.lower(spellName)
        for j = 1, table.getn(HC_NAMES) do
          if lspell == string.lower(HC_NAMES[j]) then
            return true
          end
        end
      end
    end
  end
  return false
end

local function SetHardcoreState(isHC)
  local key = CharKey()
  KAMN_CharacterDB[key] = KAMN_CharacterDB[key] or {}
  KAMN_CharacterDB[key].isHardcore = isHC

  if KAMN and KAMN.debug then
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Debug]|r Hardcore-Status: " .. tostring(isHC))
  end

  -- Meldung pro Sitzung einmal ausgeben
  if isHC and not KAMN_Internal.sessionHCShown then
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Hardcore detected.")
    KAMN_Internal.sessionHCShown = true
  end

  if isHC and type(KAMN_OnHardcoreDetected) == "function" then
    KAMN_OnHardcoreDetected()
  end
end

function KAMN_IsHardcore()
  local key = CharKey()
  local cached = KAMN_CharacterDB[key] and KAMN_CharacterDB[key].isHardcore
  if cached ~= nil then
    return cached == true
  end
  local isHC = ScanSpellbookForHardcore()
  SetHardcoreState(isHC)
  return isHC
end

function KAMN_HandleHardcoreStatus()
  local isHC = ScanSpellbookForHardcore()
  SetHardcoreState(isHC)
end

function KAMN_OnHardcoreDetected()
  if not KAMN or not KAMN.achievements then return end
  local changed = false
  for i = 1, table.getn(KAMN.achievements) do
    local a = KAMN.achievements[i]
    if a and a.requiresHC == true and a.active == false then
      a.active = true
      changed = true
    end
  end
  if changed and type(KAMN_UpdateUI) == "function" and KAMNMainFrame and KAMNMainFrame:IsShown() then
    KAMN_UpdateUI()
  end
end

local hcFrame = CreateFrame("Frame")
hcFrame:RegisterEvent("PLAYER_LOGIN")
hcFrame:RegisterEvent("SPELLS_CHANGED")
hcFrame:SetScript("OnEvent", function()
  if event == "PLAYER_LOGIN" or event == "SPELLS_CHANGED" then
    KAMN_HandleHardcoreStatus()
  end
end)
