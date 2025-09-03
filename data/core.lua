-- core.lua
-- Entry point and setup logic for KeijinAchievementMonitorNEW

-- Version (zentral definiert)
KAMN_VERSION = "0.9.1"

-- Check for global corruption (classic safeguard)
if type(string) ~= "table" then
  DEFAULT_CHAT_FRAME:AddMessage("|cffff0000[KAM Debug] WARNING: Global 'string' corrupted (type: " .. type(string) .. ")")
end

--  Global addon namespace
KAMN = KAMN or {}

--  Einheitliche CharKey-Hilfe: Realm-Name + Spielername
function KAMN_GetCharKey()
  local name = UnitName("player") or "Unknown"
  local realm = GetRealmName() or "Realm"
  return realm .. "-" .. name
end

--  SavedVariables (initialized if missing)
KAMN_CharacterDB     = KAMN_CharacterDB or {}
KAMN_AccountProgress = KAMN_AccountProgress or {}
KAMN_PlayerProgress  = KAMN_PlayerProgress or {}
KAMN_UseAccountData  = KAMN_UseAccountData or false

-- 🔧 Init default options
KAMN_Options = KAMN_Options or {}
if KAMN_Options.debug == nil then
  KAMN_Options.debug = false
end
if KAMN_Options.showTooltipInfo == nil then
  KAMN_Options.showTooltipInfo = false
end

-- 🔧 Init KAMN_Settings defaults
KAMN_Settings = KAMN_Settings or {}
if KAMN_Settings.NotifySoundEnabled == nil then
  KAMN_Settings.NotifySoundEnabled = true
end
-- 🆕 Chat-Notify default: ON (nur wenn explizit false -> OFF)
if KAMN_Settings.NotifyChatEnabled == nil then
  KAMN_Settings.NotifyChatEnabled = true
end

--  Startup message
DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinAddons]|r |cffffff88KeijinAchievementMonitor|r v" .. KAMN_VERSION .. " – Use /kam")

--  Slash-Befehle
SLASH_KAM1 = "/kam"
SLASH_KAM2 = "/kamn"
SLASH_KAM3 = "/kca"

SlashCmdList["KAM"] = function(msg)
  msg = string.lower(msg or "")
  local playerName = UnitName("player") or "Unknown"

  if msg == "" then
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinAchievementMonitor]|r Available commands:")
    DEFAULT_CHAT_FRAME:AddMessage("|cffffff00/kam toggle|r – Toggle UI on/off")
    DEFAULT_CHAT_FRAME:AddMessage("|cffffff00/kam config|r – Open settings window")
    DEFAULT_CHAT_FRAME:AddMessage("|cffffff00/kam debug|r – Toggle debug mode")
    DEFAULT_CHAT_FRAME:AddMessage("|cffffff00/kam test|r – Show test Notify")
    DEFAULT_CHAT_FRAME:AddMessage("|cffffff00/kam export|r – Export completed achievements")
    DEFAULT_CHAT_FRAME:AddMessage("|cffffff00/kam export legacy|r – Export only legacy")
    DEFAULT_CHAT_FRAME:AddMessage("|cffffff00/kam export meta|r – Export only meta")
    DEFAULT_CHAT_FRAME:AddMessage("|cffffff00/kam export all|r – Export all completed")
    DEFAULT_CHAT_FRAME:AddMessage("|cffffff00/kam reset|r – Reset character progress")
    DEFAULT_CHAT_FRAME:AddMessage("|cffffff00/kam notifychat on|off|r – Enable/disable chat notifications")
	DEFAULT_CHAT_FRAME:AddMessage("|cffffff00/kam grant <ID>|r - Mark an achievement as completed in the active storage (character/account mode). ID is case-sensitive.")
    DEFAULT_CHAT_FRAME:AddMessage("|cffffff00/kam id <category>|r - List all achievement IDs for a category (one per line). Categories: explore, level, kill, quest, reputation, skills, misc, meta.")
    return

  elseif msg == "toggle" then
    if KAMNMainFrame then
      if KAMNMainFrame:IsShown() then
        KAMNMainFrame:Hide()
      else
        KAMNMainFrame:Show()
        if KAMN_UpdateUI then KAMN_UpdateUI() end
      end
    end

  elseif msg == "config" then
    if type(KAMN_CreateSettingsFrame) == "function" and not KAMNConfigFrame then
      KAMN_CreateSettingsFrame()
    end
    if KAMNConfigFrame then
      if KAMNConfigFrame:IsShown() then
        KAMNConfigFrame:Hide()
      else
        KAMNConfigFrame:Show()
      end
    else
      DEFAULT_CHAT_FRAME:AddMessage("|cffff0000[KAM]|r Config frame not available.")
    end

  elseif msg == "debug" then
    KAMN.debug = not KAMN.debug
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Debug]|r Mode: " .. tostring(KAMN.debug))

  elseif msg == "test" then
    if KAMN_ShowNotify then
      KAMN_ShowNotify("This is a test achievement.")
    end

  elseif msg == "reset" then
    StaticPopup_Show("KAMN_RESET_CONFIRM")

  elseif msg == "wipeall" then
    KAMN_ResetAllProgress()

  -- 🆕 Chat-Notify Toggle
  elseif string.find(msg, "^notifychat") then
    local arg = string.gsub(msg, "^notifychat%s*", "")
    if arg == "on" then
      KAMN_Settings.NotifyChatEnabled = true
      DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Chat notifications: |cffffff00ON|r")
    elseif arg == "off" then
      KAMN_Settings.NotifyChatEnabled = false
      DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Chat notifications: |cffffff00OFF|r")
    else
      local state = (KAMN_Settings.NotifyChatEnabled ~= false) and "ON" or "OFF"
      DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Usage: /kam notifychat on|off (current: " .. state .. ")")
    end

  elseif string.find(msg, "^export") then
    local arg = string.gsub(msg, "^export%s*", "")
    local key = KAMN_GetCharKey()
    local db = KAMN_UseAccountData and KAMN_AccountProgress or KAMN_PlayerProgress
    local list = db[key] or {}

    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Export]|r Completed achievements:")
    for id, data in pairs(list) do
      if data.complete then
        local ach = KAMN_RegistryByID and KAMN_RegistryByID[id]
        local cat = ach and ach.category or "Unknown"
        local typ = ach and ach.type or "unknown"
        local show = false

        if arg == "legacy" and cat == "Legacy" then show = true
        elseif arg == "meta" and typ == "meta" then show = true
        elseif arg == "all" then show = true
        elseif arg == "" and cat ~= "Legacy" and typ ~= "meta" then show = true end

        if show then
          local name = (ach and ach.name) or id
          local dateText = data.date or "?"
          DEFAULT_CHAT_FRAME:AddMessage("- |cffffff00[" .. id .. "]|r " .. name .. " – " .. dateText)
        end
      end
    end
  end
end

-- Initialisierung beim Login
function KAMN:Initialize()
  self.debug = false
  if not self.achievements or table.getn(self.achievements) == 0 then
    self.achievements = {}
  end

  KAMN_CheckInitialStorageMode()
  if KAMN_CreateSettingsFrame then KAMN_CreateSettingsFrame() end
  if KAMN_CreateUI then KAMN_CreateUI() end

  KAMN_RegistryByID = {}
  local i
  for i = 1, table.getn(KAMN.achievements or {}) do
    local a = KAMN.achievements[i]
    if a and a.id then
      KAMN_RegistryByID[a.id] = a
    end
  end

  if KAMN_LoadSavedProgress then KAMN_LoadSavedProgress() end
  if KAMN_UpdateUI then KAMN_UpdateUI() end

  if KAMN.debug then
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Debug]|r Progress loaded and registry built")
  end
end

-- Login-Trigger
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function() KAMN:Initialize() end)

-- Entwickler-Wipe Popups
StaticPopupDialogs["KAMN_CONFIRM_FULLRESET"] = {
  text = "This will wipe ALL character and account progress.\nAre you sure?",
  button1 = "Yes, continue",
  button2 = "Cancel",
  OnAccept = function() StaticPopup_Show("KAMN_CONFIRM_FULLRESET_REALLY") end,
  timeout = 0, whileDead = true, hideOnEscape = true, preferredIndex = 3,
}
StaticPopupDialogs["KAMN_CONFIRM_FULLRESET_REALLY"] = {
  text = "This cannot be undone!\nDo you really REALLY want to wipe ALL progress?",
  button1 = "Yes, wipe everything",
  button2 = "Cancel",
  OnAccept = function()
    KAMN_AccountProgress = {}
    KAMN_PlayerProgress = {}
    KAMN_CharacterDB = {}
    local key = KAMN_GetCharKey()
    if KAMN_Settings and KAMN_Settings[key] then
      KAMN_Settings[key].mode = nil
    end
    KAMN_UseAccountData = nil
    DEFAULT_CHAT_FRAME:AddMessage("|cffff0000[KAM]|r ALL progress and storage mode wiped.")
    ReloadUI()
  end,
  timeout = 0, whileDead = true, hideOnEscape = true, preferredIndex = 3,
}

StaticPopupDialogs["KAMN_RESET_CONFIRM"] = {
  text = "This will reset your character's progress.\nAre you sure?",
  button1 = "Yes, reset",
  button2 = "Cancel",
  OnAccept = function()
    local key = KAMN_GetCharKey()
    if KAMN_PlayerProgress then KAMN_PlayerProgress[key] = {} end
    if KAMN_CharacterDB then KAMN_CharacterDB[key] = {} end
    DEFAULT_CHAT_FRAME:AddMessage("|cffff0000[KAM]|r Character progress has been reset.")
    ReloadUI()
  end,
  timeout = 0, whileDead = true, hideOnEscape = true, preferredIndex = 3,
}

--  Entwickler: Account & global Reset
function KAMN_ResetAllProgress()
  StaticPopup_Show("KAMN_CONFIRM_FULLRESET")
end

--  Entwickler-Dump-Funktion
SLASH_KAMDUMP1 = "/kamdump"
SlashCmdList["KAMDUMP"] = function()
  if KAMN_DumpProgress then
    KAMN_DumpProgress()
  else
    DEFAULT_CHAT_FRAME:AddMessage("|cffff0000[KAM]|r Dump function not available.")
  end
end

--  Hilfsfunktion: Ist Erfolg abgeschlossen?
function KAMN_IsAchievementComplete(id)
  local data = KAMN_GetAchievementData(id)
  return data and data.complete == true
end
