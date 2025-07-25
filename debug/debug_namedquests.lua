-- 📁 debug_namedquests.lua
-- ➤ Prüft vorhandene "namedquest"-Erfolge gegen gemeldete Chat-Namen

-- Lokale Liste zum Zwischenspeichern erkannter Questnamen aus CHAT_MSG_SYSTEM
KAMN_Debug_SeenQuests = KAMN_Debug_SeenQuests or {}

-- 📌 Hook für CHAT_MSG_SYSTEM zum Zwischenspeichern
local debugFrame = CreateFrame("Frame")
debugFrame:RegisterEvent("CHAT_MSG_SYSTEM")
debugFrame:SetScript("OnEvent", function()
  local msg = arg1 or ""
  local questname = nil

  if string.find(msg, 'Quest "') and string.find(msg, '" completed%.') then
    questname = string.match(msg, 'Quest "(.+)" completed%.')
  elseif string.find(msg, 'Quest "') and string.find(msg, '" abgeschlossen%.') then
    questname = string.match(msg, 'Quest "(.+)" abgeschlossen%.')
  elseif string.find(msg, " completed%.") then
    questname = string.gsub(msg, " completed%." , "")
  elseif string.find(msg, " abgeschlossen%.") then
    questname = string.gsub(msg, " abgeschlossen%." , "")
  end

  if questname then
    table.insert(KAMN_Debug_SeenQuests, questname)
    if KAMN.debug then
      DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAMN Debug]|r Gemerkt: '" .. questname .. "'")
    end
  end
end)

-- 📌 Befehl zur Prüfung von namedquest-Erfolgen
SLASH_KAMDEBUGQUESTS1 = "/kamdebugquests"
SLASH_KAMDEBUGQUESTS2 = "/kam debugquests"
SlashCmdList["KAMDEBUGQUESTS"] = function()
  if not KAMN_Debug_SeenQuests or table.getn(KAMN_Debug_SeenQuests) == 0 then
    DEFAULT_CHAT_FRAME:AddMessage("|cffffff00[KAMN]|r Keine System-Quests in dieser Session erkannt.")
    return
  end

  DEFAULT_CHAT_FRAME:AddMessage("|cffffff00[KAMN]|r Debug-Prüfung erkannter Quests...")

  for i = 1, table.getn(KAMN_Debug_SeenQuests) do
    local seen = KAMN_Debug_SeenQuests[i]
    local matchFound = false

    for _, a in ipairs(KAMN.achievements or {}) do
      if a.type == "namedquest" and a.questname then
        if string.lower(a.questname) == string.lower(seen) then
          matchFound = true
          DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88✔ Erfolg gefunden für:|r " .. seen .. " → ID: " .. a.id)
          break
        end
      end
    end

    if not matchFound then
      DEFAULT_CHAT_FRAME:AddMessage("|cffff5555✖ Kein Erfolgseintrag für:|r " .. seen)
    end
  end
end
