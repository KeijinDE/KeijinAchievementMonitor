-- ui/ui_notify.lua
-- 📌 Notify-Frame zur Anzeige abgeschlossener Erfolge
-- 🐢 Classic-kompatibel (Lua 5.1)

-- ──────────────────────────────────────────────────────────────────────────────
-- 🔧 Persistente Einstellungen / Defaults
-- ──────────────────────────────────────────────────────────────────────────────
local defaultX, defaultY = 0, 200
KAMN_Settings = KAMN_Settings or {}
KAMN_Settings.NotifyPosX = KAMN_Settings.NotifyPosX or defaultX
KAMN_Settings.NotifyPosY = KAMN_Settings.NotifyPosY or defaultY
if KAMN_Settings.NotifyChatEnabled == nil then KAMN_Settings.NotifyChatEnabled = true end
if KAMN_Settings.NotifySoundEnabled == nil then KAMN_Settings.NotifySoundEnabled = true end

-- ──────────────────────────────────────────────────────────────────────────────
-- 📦 Warteschlange / Zustände
-- ──────────────────────────────────────────────────────────────────────────────
local notifyQueue = {}
local notifyActive = false
local notifyTimer = 0
local notifyStartTime = 0
local notifyBatchStarted = false
local lastAnnounceTitle, lastAnnounceTime = nil, 0
local ANNOUNCE_DEBOUNCE = 1.0
KAMN_LastNotifyQueue = {}

-- ──────────────────────────────────────────────────────────────────────────────
-- 🖼️ UI: Hauptframe
-- ──────────────────────────────────────────────────────────────────────────────
local notifyFrame = CreateFrame("Frame", "KAMNNotifyFrame", UIParent)
notifyFrame:SetWidth(320)
notifyFrame:SetHeight(90)
notifyFrame:SetPoint("CENTER", UIParent, "CENTER", KAMN_Settings.NotifyPosX, KAMN_Settings.NotifyPosY)
notifyFrame:SetMovable(true)
notifyFrame:EnableMouse(true)
notifyFrame:RegisterForDrag("LeftButton")
notifyFrame:SetScript("OnDragStart", function() this:StartMoving() end)
notifyFrame:SetScript("OnDragStop", function()
  this:StopMovingOrSizing()
  local posX = math.floor(this:GetLeft() + 0.5)
  local posY = math.floor(this:GetTop() - UIParent:GetTop() + 0.5)
  KAMN_Settings.NotifyPosX = posX
  KAMN_Settings.NotifyPosY = posY
end)
notifyFrame:Hide()

-- Hintergrund & Rahmen
notifyFrame.bg = notifyFrame:CreateTexture(nil, "BACKGROUND")
notifyFrame.bg:SetPoint("TOPLEFT", notifyFrame, "TOPLEFT", 4, -4)
notifyFrame.bg:SetPoint("BOTTOMRIGHT", notifyFrame, "BOTTOMRIGHT", -4, 4)
notifyFrame.bg:SetTexture(0, 0, 0)
notifyFrame.bg:SetAlpha(0.6)

notifyFrame.border = CreateFrame("Frame", nil, notifyFrame)
notifyFrame.border:SetAllPoints(true)
notifyFrame.border:SetBackdrop({
  edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
  tile = false,
  edgeSize = 12,
})
notifyFrame.border:SetBackdropBorderColor(1, 1, 1, 0.8)

-- Titel
notifyFrame.title = notifyFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
notifyFrame.title:SetPoint("TOP", notifyFrame, "TOP", 0, -10)
notifyFrame.title:SetText("|cffffff00Achievement Completed|r")

-- Erfolgsname
notifyFrame.text = notifyFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
notifyFrame.text:SetPoint("TOP", notifyFrame.title, "BOTTOM", 0, -18)
notifyFrame.text:SetFont("Fonts\\SKURRI.TTF", 20, "OUTLINE")
notifyFrame.text:SetText("")

-- Beschreibung
notifyFrame.desc = notifyFrame:CreateFontString(nil, "OVERLAY")
notifyFrame.desc:SetFont("Fonts\\FRIZQT__.TTF", 9)
notifyFrame.desc:SetPoint("TOP", notifyFrame.text, "BOTTOM", 0, -2)
notifyFrame.desc:SetTextColor(1, 1, 1)
notifyFrame.desc:SetText("")

-- ──────────────────────────────────────────────────────────────────────────────
-- 💬 Chat-Notify Helper
-- ──────────────────────────────────────────────────────────────────────────────
local function KAMN_NotifyChat(title, desc)
  if not (KAMN_Settings and KAMN_Settings.NotifyChatEnabled) then return end
  if not title then return end
  local d = desc or ""
  if string.len(d) > 120 then d = string.sub(d, 1, 117) .. "..." end
  DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Achievement completed: |cffffff00" .. title .. "|r" ..
    (d ~= "" and (" – " .. d) or ""))
end

-- ──────────────────────────────────────────────────────────────────────────────
-- 🔔 Achievement vormerken (immer Queue, unabhängig vom Frame-Toggle)
-- ──────────────────────────────────────────────────────────────────────────────
function KAMN_ShowNotify(name)
  if not name or type(name) ~= "string" then return end
  local desc = ""
  if KAMN and KAMN.achievements then
    for i = 1, table.getn(KAMN.achievements) do
      local a = KAMN.achievements[i]
      if a and a.name == name and a.description then
        desc = a.description
        break
      end
    end
  end
  table.insert(notifyQueue, { title = name, description = desc })
end

-- ──────────────────────────────────────────────────────────────────────────────
-- 🎬 Anzeige-Controller
-- ──────────────────────────────────────────────────────────────────────────────
local notifyController = CreateFrame("Frame")
notifyController:SetScript("OnUpdate", function()
  if notifyActive then
    if (GetTime() - notifyStartTime) > 5 then
      notifyFrame:Hide()
      notifyActive = false
    end
  elseif table.getn(notifyQueue) > 0 then
    if not notifyBatchStarted then
      notifyBatchStarted = true
      KAMN_LastNotifyQueue = {}
    end

    local nextEntry = table.remove(notifyQueue, 1)
    local title = nextEntry and nextEntry.title or "?"
    local desc  = (nextEntry and nextEntry.description) or ""

    -- Frame nur zeigen, wenn aktiviert
    if KAMN_Settings.NotifyEnabled ~= false then
      notifyFrame.text:SetText("|cffffffff" .. title .. "|r")
      notifyFrame.desc:SetText(desc)

      local maxWidth = notifyFrame:GetWidth() - 20
      if notifyFrame.desc:GetStringWidth() > maxWidth then
        local text = desc
        while notifyFrame.desc:GetStringWidth() > maxWidth and string.len(text) > 4 do
          text = string.sub(text, 1, string.len(text) - 1)
          notifyFrame.desc:SetText(text .. "…")
        end
      end
      notifyFrame:Show()
    else
      notifyFrame:Hide()
    end

    -- Chat & Sound unabhängig vom Frame
    local now = GetTime()
    if not (lastAnnounceTitle == title and (now - lastAnnounceTime) < ANNOUNCE_DEBOUNCE) then
      if PlaySoundFile and (KAMN_Settings.NotifySoundEnabled ~= false) then
        PlaySoundFile("Interface\\AddOns\\KeijinAchievementMonitor\\media\\notify.wav")
      end
      KAMN_NotifyChat(title, desc)
      lastAnnounceTitle = title
      lastAnnounceTime  = now
    end

    notifyStartTime = now
    notifyActive = true
    table.insert(KAMN_LastNotifyQueue, title)
    KAMN_LastNotify = title
  else
    notifyBatchStarted = false
  end
end)
