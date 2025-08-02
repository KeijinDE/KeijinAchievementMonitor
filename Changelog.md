## 📦 Changelog – Version 0.4.1

### ✨ Added
- Subcategory-based SubDividers for the Meta category
→ Achievements are now grouped by subcategory (e.g. Combat, Progress, Faction) within the Meta view.
- New milestone achievements for Professions and Weapon Skills (15 / 50 / 100 / 200 / 300)

### 🛠 Fixed / Updated
- Corrected group filtering logic (`KAMN_ShouldDisplayAchievement`) to only apply in **ALL** and **summary** views  
  → Achievements are no longer unintentionally hidden in regular category views like *Combat* or *Character*  
- Skill achievements are now sorted by skill name and progress milestone (e.g. 15 → 300) without additional section headers

---

### 📦 Changelog – Version 0.4.1 (Deutsch)

### ✨ Neu hinzugefügt
- Unterteiler für die Kategorie Meta auf Basis der subcategory
→ Erfolge innerhalb der Meta-Ansicht sind nun thematisch gruppiert (z. B. Kampf, Fortschritt, Fraktionen).
- Neue Meilenstein-Erfolge für Berufe und Waffenfertigkeiten (15 / 50 / 100 / 200 / 300)

### 🛠 Behoben / Überarbeitet
- Gruppensperre (`KAMN_ShouldDisplayAchievement`) greift nun **nur noch in ALL- und Summary-Ansichten**  
  → Erfolge in Kategorien wie *Combat* oder *Character* werden nicht mehr versehentlich ausgeblendet  
- Skill-Erfolge werden korrekt nach Fertigkeitsname und Fortschrittsstufe (z. B. 15 → 300) sortiert – ohne zusätzliche Abschnittsüberschriften  

---

## 📦 Changelog – Version 0.4.0

### ✨ Added
- Segmented ALL view with 15 pages (ALL1–ALL15) for better performance
- New segment navigation buttons << / >>
- Expandable structure via KAMN.AllCategorySegments with centralized filter functions

### 🛠 Fixed / Updated
- Deleted obsolete `ui_buttons.lua`
- Removed deprecated **Completed** and **Incomplete** UI buttons
- Fixed display of Level, Meta, Capitals, and Reputation achievements
- Implemented `subtype`-based filtering for Reputation (neutral, horde, alliance)
- UI label (`categoryBtnLabel`) now updates correctly when switching segments
- Removed unused reference to `categoryHeader`
- Mini-buttons are now shown or hidden reliably depending on the active category

### 🐞 Known Issues
- Tooltip broken with pfui

---

### 📦 Changelog – Version 0.4.0 (Deutsch)

### ✨ Neu hinzugefügt
- Segmentierte „ALLE“-Ansicht mit 15 Seiten (ALL1–ALL15) für bessere Performance
- Neue Segment-Navigationsbuttons << / >>
- Erweiterbare Struktur über KAMN.AllCategorySegments mit zentralen Filterfunktionen

### 🛠 Behoben / Überarbeitet
- Veraltete Datei ui_buttons.lua entfernt
- Veraltete UI-Buttons Abgeschlossen und Offen entfernt
- Anzeige von Level-, Meta-, Hauptstadt- und Ruf-Erfolgen korrigiert
- Filterung von Ruf-Erfolgen jetzt basierend auf subtype (neutral, horde, allianz)
- UI-Label (categoryBtnLabel) wird beim Wechsel der Segmente korrekt aktualisiert
- Nicht verwendete Referenz auf categoryHeader entfernt
- Mini-Buttons werden nun zuverlässig je nach aktiver Kategorie ein- oder ausgeblendet

### 🐞 Bekannte Probleme
- Tooltip-Anzeige fehlerhaft in Kombination mit pfUI

---

## 📦 Changelog – Version 0.3.3

### ✨ Added
- Tooltip preference now saved via SavedVariables.
- Added clear `[KeijinAddons]` sender label to the initial storage mode popup for better recognition.
- **Generic quest achievements** (e.g. *Complete 10/50/100 quests*) are now grouped and filtered just like kill and level milestones in the **ALL** category.  
  → Only the next relevant milestone is shown – higher goals remain hidden until the previous one is completed.
- **Quests category** now sorts generic quest achievements by their progress target (`value`) instead of alphabetically.
- **Exploration achievements** are now grouped by **continent** and **zone group**, improving thematic structure and clarity.
- Visual **sub-dividers** added for each continent and zone (e.g. *Kalimdor → Durotar*).
- **Zone-level meta achievements** (e.g. *Zone: Mulgore*) are now listed **first** within their group to highlight progress.
- **Capitals meta achievements** are now sorted by `value` (**descending**), showing the most completed ones first.
- Added detailed reputation achievement progressions for several **neutral factions**:  
  Argent Dawn, Timbermaw Hold, Ratchet, Gadgetzan, Everlook and Booty Bay.  
- Each faction now features **four milestones** (1000 / 3000 / 6000 / 10000 reputation).  
- Every milestone includes a **custom achievement title and immersive description**.

### 🛠 Fixed / Updated
- Minor adjustments to the **Notify Frame UI**.

### 🐞 Known Issues
- Lag when scrolling in the **ALL** tab

---

## 📦 Changelog – Version 0.3.3 (Deutsch)

### ✨ Hinzugefügt
- Tooltip-Einstellung wird nun in den SavedVariables gespeichert.
- Klarer `[KeijinAddons]`-Absender im Speicherwahl-Dialog zur besseren Wiedererkennung.
- **Generische Quest-Erfolge** (z. B. *Complete 10/50/100 quests*) werden jetzt gruppiert und gefiltert wie Kill- und Level-Meilensteine in der **ALLE**-Ansicht.  
  → Es wird nur der jeweils nächste relevante Meilenstein angezeigt – höhere Ziele bleiben verborgen, bis der vorherige abgeschlossen ist.
- Die **Kategorie Quests** sortiert generische Erfolge nun nach Fortschrittsziel (`value`) statt alphabetisch.
- **Erkundungserfolge** sind nun nach **Kontinent** und **Zonengruppe** gruppiert – das verbessert die Struktur und Übersicht.
- Visuelle **Unterteiler** für Kontinent und Zone hinzugefügt (z. B. *Kalimdor → Durotar*).
- **Zonen-Metaerfolge** (z. B. *Zone: Mulgore*) werden nun innerhalb ihrer Gruppe **ganz oben** gelistet, um den Fortschritt hervorzuheben.
- **Hauptstadt-Metas** werden nun nach `value` (**absteigend**) sortiert – die vollständigsten stehen ganz oben.
- Neue detaillierte Ruf-Erfolgsketten für **neutrale Fraktionen** hinzugefügt:  
  Argent Dawn, Timbermaw Hold, Ratchet, Gadgetzan, Everlook und Booty Bay.  
- Jede Fraktion enthält nun **vier Meilensteine** (1000 / 3000 / 6000 / 10000 Ruf).  
- Jeder Erfolg besitzt einen **eigenen Titel** und eine **passende Beschreibung im Spielstil**.

### 🛠 Behoben / Überarbeitet
- Kleine visuelle Anpassungen am **Benachrichtigungsfenster (Notify Frame UI)**.

### 🐞 Bekannte Probleme
- Performance-Verzögerungen beim Scrollen im **ALLE**-Tab

---

## 📦 Changelog – Version 0.3.2

### ✨ Added
- Achievement: *Roach Sniper*
- Achievement: *Rat Controll*
- Reputation progress for **Durotar Labor Union**
- Reputation progress for **Silvermoon Remnant**

### 🛠 Fixed
- Achievement: *Stormwind City Explorer*
- Slash command `/kam reset`
- Slash command `/kam wipeall`
- Slash command `/kam config`
- Additional minor bugs and inconsistencies

### 🐞 Known Issues
- Lag when scrolling in the **ALL** tab
