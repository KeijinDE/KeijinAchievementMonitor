-- events_meta.lua
-- Trigger für Meta-Erfolge basierend auf Abhängigkeiten zu anderen Erfolgen
-- Erweiterung: Live-Fortschritt (x / y) bei Teilerfüllung

function KAMN_HandleMetaCheck()
  for _, a in ipairs(KAMN.achievements or {}) do
    if a.type == "meta" and type(a.requires) == "table" and (a.active ~= false) then
      local total = table.getn(a.requires)
      local done = 0

      for _, requiredID in ipairs(a.requires) do
        if KAMN_IsAchievementComplete(requiredID) then
          done = done + 1
        end
      end

      -- 🧮 Setze Fortschritt immer – unabhängig vom Abschluss
      a.progress = done
      a.value = total

      if done == total and not a.complete then
        -- ✅ Wenn alle abgeschlossen → Erfolg werten
        a.complete = true
        a.completedBy = UnitName("player")
        a.date = date("%d.%m.%Y %H:%M")
        a.timestamp = time()
        KAMN_SaveProgress(a.id, a)

        if KAMN_ShowNotify then
          KAMN_ShowNotify(a.name)
        end

        if KAMN.debug then
          DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KAM Debug]|r Meta-Erfolg abgeschlossen: " .. (a.name or a.id))
        end
      elseif done < total then
        -- 🧩 Nur speichern, falls Fortschritt sichtbar sein soll
        KAMN_SaveProgress(a.id, a)
        if KAMN.debug then
          --DEFAULT_CHAT_FRAME:AddMessage("|cffaaaaaa[KAM Debug]|r Meta: " .. (a.name or a.id) .. " – Fortschritt " .. done .. "/" .. total)
        end
      end
    end
  end
end
