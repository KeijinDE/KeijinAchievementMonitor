-- storage_mode.lua
-- Initial storage mode selector for KeijinAchievementMonitorNEW
-- Fragt beim ersten Login eines Chars ab, ob Account- oder Charakterdaten verwendet werden sollen

function KAMN_CheckInitialStorageMode()
  local key = KAMN_GetCharKey()
  KAMN_Settings = KAMN_Settings or {}
  KAMN_Settings[key] = KAMN_Settings[key] or {}

  -- Wenn bereits ein Modus gespeichert wurde, nichts tun
  if KAMN_Settings[key].mode then
    KAMN_UseAccountData = (KAMN_Settings[key].mode == "account")
    return
  end

  -- Zeige Auswahl-Popup zur initialen Festlegung
  StaticPopupDialogs["KAMN_SELECT_STORAGE_MODE"] = {
    text = "Which storage mode do you want to use for this character?\n\n|cff88ff88Account-wide|r (shared across characters)\n|cffffff88or|r\n|cff88ff88Character-specific|r (per character)?",
    button1 = "Account-wide",
    button2 = "Character-specific",
    OnAccept = function()
      KAMN_Settings[key].mode = "account"
      KAMN_UseAccountData = true
      DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Storage mode set to: |cffffff00Account-wide|r")
      ReloadUI()
    end,
    OnCancel = function()
      KAMN_Settings[key].mode = "character"
      KAMN_UseAccountData = false
      DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Storage mode set to: |cffffff00Character-specific|r")
      ReloadUI()
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = false,
    showAlert = true,
  }

  StaticPopup_Show("KAMN_SELECT_STORAGE_MODE")
end
-- 🔄 Manuelles Umschalten des Speichermodus (mit Neuladung)
function KAMN_ToggleStorageMode()
  local key = KAMN_GetCharKey()
  KAMN_Settings = KAMN_Settings or {}
  KAMN_Settings[key] = KAMN_Settings[key] or {}

  -- Umschalten im Settings-Storage
  local newMode
  if KAMN_Settings[key].mode == "account" then
    newMode = "character"
  else
    newMode = "account"
  end
  KAMN_Settings[key].mode = newMode

  -- Wichtig: Hier explizit setzen!
  KAMN_UseAccountData = (newMode == "account")

  DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Storage mode set to: |cffffff88" .. string.upper(newMode))

-- 🧠 Fortschrittsdaten neu laden
if KAMN_LoadSavedProgress then
  KAMN_LoadSavedProgress()
end

-- ✅ Erzwinge UI-Aktualisierung – auch bei geschlossenem Fenster
if KAMNMainFrame then
  if not KAMNMainFrame:IsShown() then
    -- UI geschlossen → Labels trotzdem updaten
    local currentMode = KAMN_UseAccountData and "Account" or "Character"
    if KAMNMainFrame.storageModeLabel then
      KAMNMainFrame.storageModeLabel:SetText("Storage: " .. currentMode)
    end
  end
end

-- 🔁 Normales UI-Update
if KAMN_UpdateUI then
  KAMN_UpdateUI()
end
-- 🔃 Immer aktualisieren – unabhängig vom Fensterzustand
if KAMNMainFrame and KAMNMainFrame.storageModeLabel then
  local currentMode = KAMN_UseAccountData and "Account" or "Character"
  KAMNMainFrame.storageModeLabel:SetText("Storage: " .. currentMode)
end

end
