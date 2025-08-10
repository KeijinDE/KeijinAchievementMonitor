-- tooltip.lua – stabile Classic-kompatible Version ohne HookScript
-- Anpassung: Farbschema der Zusatzzeile (ruhig + classic, ohne pfUI-Gelb)

local lastUnitName = ""

-- 🎨 Farbkonstanten (einfach änderbar)
local COLOR_LABEL   = "|cff88bbcc"  -- sanftes Blaugrün (ruhig)
local COLOR_NAME    = "|cffecd9b0"  -- warmes Beige (classic)
local COLOR_COUNTER = "|cffc0c0c0"  -- neutrales Grau
local COLOR_RESET   = "|r"

-- Hilfsfunktion zur Normalisierung
local function NormalizeName(name)
  return string.lower(string.gsub(name or "", "%s", ""))
end

-- Prüft, ob bereits KAM-Zeile im Tooltip ist
local function TooltipHasKAMText()
  local n = GameTooltip:NumLines()
  local i
  for i = 1, n do
    local fs = getglobal("GameTooltipTextLeft" .. i)
    if fs and fs:GetText() and string.find(fs:GetText(), "%Kill Achievement") then
      return true
    end
  end
  return false
end

-- Tooltip-Zeile ergänzen bei Treffer
local function ShowKillAchievementTooltip(unit)
  if not unit or not UnitExists(unit) then return end
  if not KAMN_Options or not KAMN_Options.showTooltipInfo then return end

  local name = UnitName(unit)
  if not name or not KAMN or not KAMN.achievements then return end
  lastUnitName = name

  local lname = NormalizeName(name)
  local i
  for i = 1, table.getn(KAMN.achievements) do
    local a = KAMN.achievements[i]
    if (a.type == "kill" or a.type == "namedkill" or a.type == "bosskill" or a.type == "namedkillgroup") and a.active ~= false then
      local match = false

      if a.targetname and NormalizeName(a.targetname) == lname then
        match = true
      elseif a.target and NormalizeName(a.target) == lname then
        match = true
      elseif a.targetnames and type(a.targetnames) == "table" then
        local j
        for j = 1, table.getn(a.targetnames) do
          if NormalizeName(a.targetnames[j]) == lname then
            match = true
            break
          end
        end
      elseif a.groupMatch and type(a.groupMatch) == "table" then
        local j
        for j = 1, table.getn(a.groupMatch) do
          if NormalizeName(a.groupMatch[j]) == lname then
            match = true
            break
          end
        end
      end

      if match then
        local data = KAMN_GetAchievementData(a.id) or {}
        if not data.complete then
          local progress = data.progress or 0
          local goal = a.value or a.amount or 1

          -- 🌈 Ruhige, classic-freundliche Farbkombi (kein Gelb)
          -- Beispielausgabe: "KAM: Wolf Hunter (3/10)"
          local line = COLOR_LABEL .. "Kill Achievement:" .. COLOR_RESET ..
                       " " .. COLOR_NAME .. (a.name or a.id) .. COLOR_RESET ..
                       " " .. COLOR_COUNTER .. "(" .. progress .. "/" .. goal .. ")" .. COLOR_RESET

          GameTooltip:AddLine(line)
          GameTooltip:Show()
          return
        end
      end
    end
  end
end

-- Dauerprüfung – KillLog-Stil, kein HookScript
local f = CreateFrame("Frame")
f:SetScript("OnUpdate", function()
  if not KAMN_Options or not KAMN_Options.showTooltipInfo then return end

  if GameTooltip:IsVisible() and UnitExists("mouseover") then
    if not TooltipHasKAMText() then
      ShowKillAchievementTooltip("mouseover")
    end
  elseif not UnitExists("mouseover") then
    lastUnitName = ""
  end
end)
