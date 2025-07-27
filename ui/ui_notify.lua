-- 📌 Notify-Frame zur Anzeige abgeschlossener Erfolge mit zweizeiligem Layout

-- Lokale Referenz auf gespeicherte Position
local defaultX, defaultY = 0, 200
KAMN_Settings = KAMN_Settings or {}
KAMN_Settings.NotifyPosX = KAMN_Settings.NotifyPosX or defaultX
KAMN_Settings.NotifyPosY = KAMN_Settings.NotifyPosY or defaultY

-- 📦 Warteschlange
local notifyQueue = {}
local notifyActive = false
local notifyTimer = 0
local notifyStartTime = 0
local notifyBatchStarted = false

-- 🧠 Zuletzt angezeigte Erfolge (für Replay)
KAMN_LastNotifyQueue = {}

-- 📘 Hauptframe
local notifyFrame = CreateFrame("Frame", "KAMNNotifyFrame", UIParent)
notifyFrame:SetWidth(320)
notifyFrame:SetHeight(70)
notifyFrame:SetPoint("CENTER", UIParent, "CENTER", KAMN_Settings.NotifyPosX, KAMN_Settings.NotifyPosY)
notifyFrame:SetMovable(true)
notifyFrame:EnableMouse(true)
notifyFrame:RegisterForDrag("LeftButton")
notifyFrame:SetScript("OnDragStart", function()
  this:StartMoving()
end)
notifyFrame:SetScript("OnDragStop", function()
  this:StopMovingOrSizing()
  local posX = math.floor(this:GetLeft() + 0.5)
  local posY = math.floor(this:GetTop() - UIParent:GetTop() + 0.5)
  KAMN_Settings.NotifyPosX = posX
  KAMN_Settings.NotifyPosY = posY
  if KAMN and KAMN.debug then
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Debug]|r Notify moved to: X=" .. posX .. ", Y=" .. posY)

  end
end)
notifyFrame:Hide()

-- Hintergrund mit Innenabstand
notifyFrame.bg = notifyFrame:CreateTexture(nil, "BACKGROUND")
notifyFrame.bg:SetPoint("TOPLEFT", notifyFrame, "TOPLEFT", 4, -4)
notifyFrame.bg:SetPoint("BOTTOMRIGHT", notifyFrame, "BOTTOMRIGHT", -4, 4)
notifyFrame.bg:SetTexture(0, 0, 0)
notifyFrame.bg:SetAlpha(0.6)


-- Rand
notifyFrame.border = CreateFrame("Frame", nil, notifyFrame)
notifyFrame.border:SetAllPoints(true)
notifyFrame.border:SetBackdrop({
  edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
  tile = false, edgeSize = 12,
})
notifyFrame.border:SetBackdropBorderColor(1, 1, 1, 0.8)

-- Obere Zeile
notifyFrame.title = notifyFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
notifyFrame.title:SetPoint("TOP", notifyFrame, "TOP", 0, -10)
--notifyFrame.title:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
notifyFrame.title:SetText("|cffffff00Achievement Completed|r")

-- Untere Zeile
notifyFrame.text = notifyFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
notifyFrame.text:SetPoint("BOTTOM", notifyFrame, "BOTTOM", 0, 10)
notifyFrame.text:SetFont("Fonts\\SKURRI.TTF", 18, "OUTLINE")
notifyFrame.text:SetText("")

-- 📢 Öffentliche Funktion zum Anzeigen
function KAMN_ShowNotify(name)
  if not name or type(name) ~= "string" then return end

  KAMN_Settings = KAMN_Settings or {}
  if KAMN_Settings.NotifyEnabled == false then
    if KAMN and KAMN.debug then
DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Debug]|r Notify is disabled – no display for: " .. name)
    end
    return
  end

  table.insert(notifyQueue, name)

  if KAMN and KAMN.debug then
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Debug]|r Notify-Queued: " .. name)
  end
end

-- 📌 Anzeige-Logik
local notifyController = CreateFrame("Frame")
notifyController:SetScript("OnUpdate", function()
  if notifyActive then
    notifyTimer = GetTime() - notifyStartTime
    if notifyTimer > 5 then
      notifyFrame:Hide()
      notifyActive = false
      notifyTimer = 0
    end
  elseif table.getn(notifyQueue) > 0 then
    if not notifyBatchStarted then
      notifyBatchStarted = true
      KAMN_LastNotifyQueue = {}
    end

    local nextName = table.remove(notifyQueue, 1)
    notifyFrame.text:SetText("|cffffffff" .. nextName .. "|r")
    notifyFrame:Show()
    notifyStartTime = GetTime()
    notifyTimer = 0
    notifyActive = true

    table.insert(KAMN_LastNotifyQueue, nextName)
    KAMN_LastNotify = nextName

    if KAMN and KAMN.debug then
DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Debug]|r Showing notify: " .. nextName)
    end
  else
    notifyBatchStarted = false
  end
end)
