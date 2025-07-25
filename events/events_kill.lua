-- events/events_kill.lua
-- Kill, NamedKill und BossKill Triggerlogik
-- Kompatibles string.match für Lua 5.1 (Classic)
local function SafeMatch(str, pattern)
  if type(str) ~= "string" or type(pattern) ~= "string" then return nil end
  if string and type(string.match) == "function" then
    return string.match(str, pattern)
  end
  local s, e = string.find(str, pattern)
  if s and e then
    return string.sub(str, s, e)
  end
  return nil
end

local function GetRegistryProgress(id)
  return (KAMN_RegistryByID and KAMN_RegistryByID[id] and KAMN_RegistryByID[id].progress) or 0
end

function KAMN_HandleCombatTextUpdate(event, arg1)
  if arg1 ~= "KILLING_BLOW" then return false end

  local updated = false
  for _, a in ipairs(KAMN.achievements or {}) do
    if a.type == "kill" and (a.active ~= false) and not a.complete then
      local current = GetRegistryProgress(a.id)
      local newProgress = KAMN_TriggerProgress(a.id, current + 1, false)
      updated = true
      if KAMN.debug then
        DEFAULT_CHAT_FRAME:AddMessage("[KAM Debug] Kill matched: " .. a.name .. " (" .. a.id .. ") progress = " .. newProgress)
      end
    end
  end

  return updated
end

function KAMN_HandleHostileDeath(event, arg1)
  local msg = arg1 or ""
  if not (string.find(msg, "^You have slain") or string.find(msg, "^Du hast")) then return false end

  local updated = false
  for _, a in ipairs(KAMN.achievements or {}) do
    if a.type == "kill" and (a.active ~= false) and not a.complete then
      local current = GetRegistryProgress(a.id)
      local newProgress = KAMN_TriggerProgress(a.id, current + 1, false)
      updated = true
      if KAMN.debug then
        DEFAULT_CHAT_FRAME:AddMessage("[KAM Debug] Kill matched: " .. a.name .. " (" .. a.id .. ") progress = " .. newProgress)
      end

    elseif (a.type == "namedkill" or a.type == "bosskill") and (a.active ~= false) and not a.complete then
      local matched = false
      if a.targetname and string.find(string.lower(msg), string.lower(a.targetname)) then
        matched = true
      elseif type(a.targetnames) == "table" then
        for i = 1, table.getn(a.targetnames) do
          if string.find(string.lower(msg), string.lower(a.targetnames[i])) then
            matched = true
            break
          end
        end
      end

      if matched then
        local current = GetRegistryProgress(a.id)
        local newProgress = KAMN_TriggerProgress(a.id, current + 1, false)
        updated = true
        if KAMN.debug then
          DEFAULT_CHAT_FRAME:AddMessage("[KAM Debug] Kill matched: " .. a.name .. " (" .. a.id .. ") progress = " .. newProgress)
        end
      end
    end
  end

  return updated
end

function KAMN_HandleNamedKillGroup(event, msg)
  if not msg then return false end
  local name = SafeMatch(msg, "^You have slain (.+)!") or SafeMatch(msg, "^Du hast (.+) getötet!")
  if not name then return false end

  local lname = string.lower(name)
  local updated = false

  for i = 1, table.getn(KAMN.achievements) do
    local a = KAMN.achievements[i]
    if a.type == "namedkillgroup" and a.groupMatch then
      for j = 1, table.getn(a.groupMatch) do
        local match = string.lower(a.groupMatch[j] or "")
if match ~= "" and (lname == match or string.find(lname, match)) then
  local current = GetRegistryProgress(a.id)
  local newProgress = KAMN_TriggerProgress(a.id, current + 1, false)
  updated = true
  if KAMN.debug then
    DEFAULT_CHAT_FRAME:AddMessage("[KAM Debug] NamedKillGroup: " .. name .. " → " .. a.name .. " (" .. a.id .. ") progress = " .. newProgress)
  end
  break
end
      end
    end
  end

  return updated
end
