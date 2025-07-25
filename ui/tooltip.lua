-- tooltip.lua – flackerfrei & nur bei aktivierter Option
local lastUnitName = ""
local lastDebugName = ""

local function ShowKillAchievementTooltip(unit)
  if not KAMN_Options or not KAMN_Options.showTooltipInfo then return end
  if not UnitExists(unit) then
    lastUnitName = ""
    lastDebugName = ""
    return
  end

  local name = UnitName(unit)
  if not name or not KAMN or not KAMN.achievements then return end

  local firstDebug = false
  if KAMN.debug and name ~= lastDebugName then
    firstDebug = true
    lastDebugName = name
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Debug]|r RAW Mouseover Name: '" .. name .. "'")
  end

  if name == lastUnitName then return end
  lastUnitName = name

  local lname = string.lower(string.gsub(name, "%s", ""))
  local addedLine = false

  for _, a in ipairs(KAMN.achievements) do
    if (a.type == "kill" or a.type == "namedkill" or a.type == "bosskill") and a.active ~= false then
      local match = false

      if a.targetname then
        local candidate = string.lower(string.gsub(a.targetname, "%s", ""))
        if KAMN.debug and firstDebug then
          DEFAULT_CHAT_FRAME:AddMessage("[KAM Debug] Vergleich targetname: '" .. lname .. "' vs '" .. candidate .. "'")
        end
        if lname == candidate then match = true end
      end

      if not match and a.target then
        local candidate = string.lower(string.gsub(a.target, "%s", ""))
        if KAMN.debug and firstDebug then
          DEFAULT_CHAT_FRAME:AddMessage("[KAM Debug] Vergleich target: '" .. lname .. "' vs '" .. candidate .. "'")
        end
        if lname == candidate then match = true end
      end

      if not match and a.targetnames and type(a.targetnames) == "table" then
        for i = 1, table.getn(a.targetnames) do
          local candidate = string.lower(string.gsub(a.targetnames[i], "%s", ""))
          if KAMN.debug and firstDebug then
            DEFAULT_CHAT_FRAME:AddMessage("[KAM Debug] Vergleich targetnames[" .. i .. "]: '" .. lname .. "' vs '" .. candidate .. "'")
          end
          if lname == candidate then
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
          local line = "|cff88ff88[KAM]|r Kill Achievement: |cffffff00" .. (a.name or a.id) .. " (" .. progress .. "/" .. goal .. ")"
          GameTooltip:AddLine(line)
          addedLine = true
        end
      end
    end
  end

  if addedLine then GameTooltip:Show() end

  if firstDebug then
    local status = addedLine and "Treffer" or "kein Treffer"
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Debug]|r Tooltip: " .. name .. " → " .. status)
  end
end

-- UI Frames: TargetFrame etc.
local f1 = CreateFrame("Frame")
f1:RegisterEvent("PLAYER_LOGIN")
f1:SetScript("OnEvent", function()
  if not GameTooltip or not GameTooltip.SetUnit then return end
  local originalSetUnit = GameTooltip.SetUnit
  GameTooltip.SetUnit = function(self, unit)
    if originalSetUnit then originalSetUnit(self, unit) end
    ShowKillAchievementTooltip(unit)
  end
end)

-- Welt-Mouseover
local f2 = CreateFrame("Frame")
f2:SetScript("OnUpdate", function()
  if not KAMN_Options or not KAMN_Options.showTooltipInfo then return end
  if GameTooltip:IsVisible() and UnitExists("mouseover") then
    ShowKillAchievementTooltip("mouseover")
  elseif not UnitExists("mouseover") then
    lastUnitName = ""
    lastDebugName = ""
  end
end)
