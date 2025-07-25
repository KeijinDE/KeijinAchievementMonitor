-- Minimap-Button für KeijinAchievementMonitorNEW
-- Zeigt das Hauptfenster (Linksklick) oder das Konfigurationsfenster (Rechtsklick)
-- Icon: Standard-WoW-Questionmark, runder Stil, Tooltip vorhanden

-- Erstelle den Button und positioniere ihn auf der Minimap
local f = CreateFrame("Button", "KAMN_MinimapButton", Minimap)
f:SetWidth(18) -- Button-Breite auf 18 Pixel setzen
f:SetHeight(18) -- Button-Höhe auf 18 Pixel setzen
f:SetPoint("TOPLEFT", Minimap, "TOPLEFT") -- Position relativ zur Minimap

-- Erlaube sowohl Linksklick als auch Rechtsklick
f:RegisterForClicks("LeftButtonUp", "RightButtonUp")

-- Setze das Icon des Buttons: WoW-internes Fragezeichen-Symbol
f:SetNormalTexture("Interface\\Icons\\INV_Misc_Book_02")
-- Runde das Icon optisch ab durch Texturkoordinaten
-- (blendet Ecken aus, sodass es wie ein Kreis wirkt)
f:GetNormalTexture():SetTexCoord(0.1, 0.9, 0.1, 0.9)

-- Füge einen klassischen runden Rahmen hinzu (über dem Icon)
local border = f:CreateTexture(nil, "OVERLAY")
border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder") -- Klassischer runder Rahmen
border:SetWidth(54) -- Rahmen ist etwas größer als das Icon
border:SetHeight(54)
border:SetPoint("CENTER", f, "CENTER", 10, -11)


-- Setze visuelle Effekte bei Hover und Klick
f:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square") -- Mouseover-Effekt
f:SetPushedTexture("Interface\\Buttons\\UI-Quickslot-Depress") -- gedrückt-Effekt
f:GetHighlightTexture():SetTexCoord(0.1, 0.9, 0.1, 0.9)
f:GetPushedTexture():SetTexCoord(0.1, 0.9, 0.1, 0.9)

-- Klick-Logik: Linksklick öffnet das Hauptfenster, Rechtsklick das Konfigurationsfenster
f:SetScript("OnClick", function()
  local button = arg1
  if button == "RightButton" then
    if KAMNConfigFrame then
      if KAMNConfigFrame:IsShown() then
        KAMNConfigFrame:Hide()
      else
        KAMNConfigFrame:Show()
      end
    end
  else
    if KAMNMainFrame then
      if KAMNMainFrame:IsShown() then
        KAMNMainFrame:Hide()
      else
        KAMNMainFrame:Show()
      end
    end
  end
end)

-- Tooltip-Frame erstellen (wird beim Mouseover angezeigt)
f.tooltip = CreateFrame("GameTooltip", "KAMNMinimapTooltip", UIParent, "GameTooltipTemplate")
f:SetScript("OnEnter", function()
  f.tooltip:SetOwner(f, "ANCHOR_RIGHT")
  f.tooltip:SetText("KeijinAchievements") -- Titel
  f.tooltip:AddLine("Left-Click: Toggle Overview", 1, 1, 1) -- Weißer Text
  f.tooltip:AddLine("Right-Click: Settings", 0.8, 0.8, 0.8) -- Grauer Text
  f.tooltip:Show()
end)
f:SetScript("OnLeave", function()
  f.tooltip:Hide()
end)
