-- 📌 Notify-Frame zur Anzeige abgeschlossener Erfolge mit zweizeiligem Layout + optionalem Chat-Notify

-- Lokale Referenz auf gespeicherte Position
local defaultX, defaultY = 0, 200
KAMN_Settings = KAMN_Settings or {}
KAMN_Settings.NotifyPosX = KAMN_Settings.NotifyPosX or defaultX
KAMN_Settings.NotifyPosY = KAMN_Settings.NotifyPosY or defaultY
-- Chat-Notify Default (Standard: EIN, nur wenn explizit false -> aus)
if KAMN_Settings.NotifyChatEnabled == nil then
  KAMN_Settings.NotifyChatEnabled = true
end

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
  if KAMN and KAMN.debug then
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Debug]|r Notify moved to: X=" .. posX .. ", Y=" .. posY)
  end
end)
notifyFrame:Hide()

-- Hintergrund und Rahmen
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

-- 🟡 Titelzeile (statisch)
notifyFrame.title = notifyFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
notifyFrame.title:SetPoint("TOP", notifyFrame, "TOP", 0, -10)
notifyFrame.title:SetText("|cffffff00Achievement Completed|r")

-- 🏆 Erfolgsname (groß)
notifyFrame.text = notifyFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
notifyFrame.text:SetPoint("TOP", notifyFrame.title, "BOTTOM", 0, -18)
notifyFrame.text:SetFont("Fonts\\SKURRI.TTF", 20, "OUTLINE")
notifyFrame.text:SetText("")

-- 📝 Beschreibung (klein, feste Größe; nur Truncate)
notifyFrame.desc = notifyFrame:CreateFontString(nil, "OVERLAY")
notifyFrame.desc:SetFont("Fonts\\FRIZQT__.TTF", 9)
notifyFrame.desc:SetPoint("TOP", notifyFrame.text, "BOTTOM", 0, -2)
notifyFrame.desc:SetTextColor(1, 1, 1)
notifyFrame.desc:SetText("")

-- 💬 Chat-Notify (optional; lokale Helper-Funktion)
local function KAMN_NotifyChat(title, desc)
  if not (KAMN_Settings and KAMN_Settings.NotifyChatEnabled) then return end
  if not title then return end
  local d = desc or ""
  if string.len(d) > 120 then
    d = string.sub(d, 1, 117) .. "..."
  end
  DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Achievement completed: |cffffff00" .. title .. "|r" ..
    (d ~= "" and (" – " .. d) or ""))
end

-- 📢 Öffentliche Funktion zum Anzeigen (wird aus der Logic getriggert)
function KAMN_ShowNotify(name)
  if not name or type(name) ~= "string" then return end

  KAMN_Settings = KAMN_Settings or {}

  -- Beschreibung ermitteln (für Chat/Sound/Frame)
  local desc = ""
  if KAMN and KAMN.achievements then
    local i
    for i = 1, table.getn(KAMN.achievements) do
      local a = KAMN.achievements[i]
      if a and a.name == name and a.description then
        desc = a.description
        break
      end
    end
  end

  -- 💬 Chat immer unabhängig vom Frame
  if KAMN_Settings.NotifyChatEnabled then
    local d = desc
    if string.len(d) > 120 then
      d = string.sub(d, 1, 117) .. "..."
    end
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM]|r Achievement completed: |cffffff00" .. name .. "|r" ..
      (d ~= "" and (" – " .. d) or ""))
  end

  -- 🔊 Sound immer unabhängig vom Frame
  if PlaySoundFile and (KAMN_Settings.NotifySoundEnabled ~= false) then
    PlaySoundFile("Interface\\AddOns\\KeijinAchievementMonitor\\media\\notify.wav")
  end

  -- 🖼 Frame nur, wenn aktiv
  if KAMN_Settings.NotifyEnabled ~= false then
    table.insert(notifyQueue, { title = name, description = desc })
    if KAMN and KAMN.debug then
      DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Debug]|r Notify-Queued: " .. name)
    end
  end
end


-- 📌 Anzeige-Logik mit LEVELUP-Sound
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

    local nextEntry = table.remove(notifyQueue, 1)
    notifyFrame.text:SetText("|cffffffff" .. (nextEntry.title or "?") .. "|r")
    notifyFrame.desc:SetText(nextEntry.description or "")

    -- ✂ Nur Truncate (keine Auto-Font-Verkleinerung)
    local maxWidth = notifyFrame:GetWidth() - 20
    if notifyFrame.desc:GetStringWidth() > maxWidth then
      local text = nextEntry.description or ""
      while notifyFrame.desc:GetStringWidth() > maxWidth and string.len(text) > 4 do
        text = string.sub(text, 1, string.len(text) - 1)
        notifyFrame.desc:SetText(text .. "…")
      end
    end

    notifyFrame:Show()

    -- 🔊 Soundeffekt beim Anzeigen (optional)
    if PlaySoundFile and (KAMN_Settings.NotifySoundEnabled ~= false) then
      PlaySoundFile("Interface\\AddOns\\KeijinAchievementMonitor\\media\\notify.wav")
    end

    -- 💬 Optionaler Chat-Hinweis
    KAMN_NotifyChat(nextEntry.title, nextEntry.description)

    notifyStartTime = GetTime()
    notifyTimer = 0
    notifyActive = true

    table.insert(KAMN_LastNotifyQueue, nextEntry.title)
    KAMN_LastNotify = nextEntry.title

    if KAMN and KAMN.debug then
      DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Debug]|r Showing notify: " .. nextEntry.title)
    end
  else
    notifyBatchStarted = false
  end
end)
