-- features/grant.lua
-- Simple grant & ID listing for KAMN (Classic 1.12, Lua 5.1)
-- Minimal-invasiv: nutzt den aktiven Speicher, setzt keinen Progress, keine Sonderflags.
-- /kam grant <ID>  → markiert als abgeschlossen (nutzt aktive Speicherlogik, Punkte bleiben wie im Addon definiert)
-- /kam id <cat>    → listet alle IDs zu einer Kategorie (jede ID in eigener Zeile)

KAMN = KAMN or {}

-- ── Helpers ───────────────────────────────────────────────────────────────────

-- Kleinschreibung + Trim NUR für Kategorien/Tokens (nicht für IDs!)
local function KAMN_StripLower(s)
  if not s then return "" end
  s = string.lower(s)
  s = string.gsub(s, "^%s*", "")
  s = string.gsub(s, "%s*$", "")
  return s
end

-- Kategorie → interner Typ-Match (einfach gehalten)
local function KAMN_MapCategoryToTypes(token)
  token = KAMN_StripLower(token)
  if token == "explore" or token == "exploration" or token == "discover" then
    return { discover = true }
  elseif token == "kill" or token == "combat" then
    return {
      kill = true, generickill = true, namedkill = true, namedkillgroup = true,
      bosskill = true, boss = true, elite = true, mob = true
    }
  elseif token == "quest" or token == "quests" then
    return { quest = true, namedquest = true }
  elseif token == "reputation" or token == "rep" then
    return { reputation = true, neutral = true, horde = true, alliance = true }
  elseif token == "skills" or token == "skill" or token == "weapon" then
    return { skill = true, weapon = true }
  elseif token == "meta" then
    return { meta = true }
  elseif token == "misc" or token == "other" then
    return {
      identity = true, death = true, class = true, race = true,
      level = true, legacy = true, misc = true, combat = true
    }
  end
  -- Fallback: direkter Typname
  local direct = {}
  direct[token] = true
  return direct
end

-- Anzeigename zu ID (falls vorhanden)
local function KAMN_GetNameByID(id)
  if KAMN_RegistryByID and KAMN_RegistryByID[id] and KAMN_RegistryByID[id].name then
    return KAMN_RegistryByID[id].name
  end
  return id
end

-- ── Grant-Logik ────────────────────────────────────────────────────────────────

-- Markiert einen Erfolg im AKTIVEN Speicher als abgeschlossen (kein Progress, keine Flags)
function KAMN_GrantAchievement(id)
  if not id or type(id) ~= "string" then
    DEFAULT_CHAT_FRAME:AddMessage("|cffff0000[KAM]|r Usage: /kam grant <ID>")
    return
  end
  if not KAMN_RegistryByID or not KAMN_RegistryByID[id] then
    DEFAULT_CHAT_FRAME:AddMessage("|cffff0000[KAM]|r Unknown achievement ID: " .. id)
    return
  end

  local db = KAMN_GetActiveProgress()
  if not db then
    DEFAULT_CHAT_FRAME:AddMessage("|cffff0000[KAM]|r No active storage available.")
    return
  end

  db[id] = db[id] or {}
  db[id].complete = true
  -- kein künstlicher Progress
  db[id].completedBy = UnitName and UnitName("player") or "Player"
  db[id].date = date("%Y-%m-%d %H:%M")
  db[id].lastProgressTime = time()
  db[id].timestamp = time()
  -- kein 'manual' oder andere Flags

  local name = KAMN_GetNameByID(id)
  DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Granted: |cffffff00[" .. id .. "]|r " .. name)

  -- UI aktualisieren (falls offen)
  if type(KAMN_LoadSavedProgress) == "function" then KAMN_LoadSavedProgress() end
  if type(KAMN_UpdateUI) == "function" and KAMNMainFrame and KAMNMainFrame:IsShown() then KAMN_UpdateUI() end

  -- Notify respektiert Spieler-Einstellungen (Frame/Sound/Chat)
  if type(KAMN_ShowNotify) == "function" then
    KAMN_ShowNotify(name)
  end
end

-- ── ID-Liste je Kategorie ─────────────────────────────────────────────────────

function KAMN_ListIDsByCategory(token)
  token = KAMN_StripLower(token)
  if token == "" then
    DEFAULT_CHAT_FRAME:AddMessage("|cffff0000[KAM]|r Usage: /kam id <category>")
    return
  end

  local types = KAMN_MapCategoryToTypes(token)
  if not types then
    DEFAULT_CHAT_FRAME:AddMessage("|cffff0000[KAM]|r Unknown category: " .. token)
    return
  end

  local count = 0
  DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r IDs for category: |cffffff00" .. token .. "|r")
  local i
  for i = 1, table.getn(KAMN.achievements or {}) do
    local a = KAMN.achievements[i]
    if a and a.id and a.type and types[a.type] then
      DEFAULT_CHAT_FRAME:AddMessage(a.id)
      count = count + 1
    end
  end
  if count == 0 then
    DEFAULT_CHAT_FRAME:AddMessage("|cffffaa00[KAM]|r No matches.")
  else
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Total: " .. count)
  end
end

-- ── Slash-Wrapper (führt nur neue Subcommands aus, Hilfe bleibt Sache von core.lua) ──

local KAMN_OldSlashHandler = SlashCmdList and SlashCmdList["KAM"]

SLASH_KAM1 = "/kam"
SLASH_KAM2 = "/kamn"
SLASH_KAM3 = "/kca"

SlashCmdList["KAM"] = function(msg)
  local raw = msg or ""
  local lower = KAMN_StripLower(raw)

  -- Neue Subcommands:
  if string.find(lower, "^grant%s+") then
    -- ID im ORIGINAL-String extrahieren (Groß-/Kleinschreibung beachten)
    local id = string.sub(raw, 7)
    id = string.gsub(id, "^%s*", "")
    id = string.gsub(id, "%s*$", "")
    KAMN_GrantAchievement(id)
    return
  elseif string.find(lower, "^id%s+") then
    local token = string.gsub(lower, "^id%s*", "")
    KAMN_ListIDsByCategory(token)
    return
  end

  -- Fallback: bestehender Handler (inkl. Hilfe aus core.lua)
  if KAMN_OldSlashHandler then
    KAMN_OldSlashHandler(raw)
  else
    DEFAULT_CHAT_FRAME:AddMessage("|cffff0000[KAM]|r Command not recognized.")
  end
end
