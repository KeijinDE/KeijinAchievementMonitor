
## 📦 Changelog – Version 0.9.1

### 🛠 Updated
- Dalaran Crater Achievment fixed and removed from meta
- Added Flatland Cougar to **Less Cats**

---


## 📦 Changelog – Version 0.9.0

### ✨ Added
- **Slash command:** `/kam grant <ID>` – Mark an achievement as completed in the active storage (character/account mode). ID is case-sensitive.
- **Slash command:** `/kam id <category>` – List all achievement IDs for a category (one per line). Categories: `explore`, `kill`, `quest`, `reputation`, `skills`, `misc`, `meta`.

### 🛠 Updated
- **Help:** `/kam` help now includes the new commands (`grant`, `id`).
- **Kill – Boars:** Added **Bristleback Battleboar** to the Boar achievement group.
- **Elite/Boss Kill descriptions:** Wording changed from "must kill" to "witness/be present" to match proximity credit (achievements_kill_elite.lua).

---

## 📦 Changelog – Version 0.9.0 (Deutsch)

### ✨ Hinzugefügt
- **Slash-Befehl:** `/kam grant <ID>` – Markiert einen Erfolg im aktiven Speicher (Charakter/Account) als abgeschlossen. Die ID ist **groß/klein-schreibungs**sensitiv.
- **Slash-Befehl:** `/kam id <kategorie>` – Listet alle Achievement-IDs einer Kategorie (je Zeile). Kategorien: `explore`, `kill`, `quest`, `reputation`, `skills`, `misc`, `meta`.

### 🛠 Aktualisiert
- **Hilfe:** Die `/kam`-Hilfe zeigt jetzt die neuen Befehle (`grant`, `id`).
- **Kill – Boars:** **Bristleback Battleboar** zur Boar-Erfolgsgruppe hinzugefügt.
- **Elite-/Boss-Kill Beschreibungen:** Formulierung von „muss töten“ auf „Zeuge/Anwesend sein“ geändert, passend zur Anerkennung bei Anwesenheit (achievements_kill_elite.lua).

---

## 📦 Changelog – Version 0.8.1

### 🛠 Fixed / Updated
- **Meta Helper in Summary**: The "?" button now correctly appears  
  when opening a meta achievement via **Required For** links in the Summary section.  
  → The Meta Helper now receives the clicked achievement object directly instead of relying on title matching, preventing display and detection issues.

### ❗ Known Issues
- **Meta Helper & Last Completion**: The "?" button currently does not appear  
  when opening a meta achievement directly from the Last Completion list.

---

## 📦 Changelog – Version 0.8.1 (Deutsch)

### 🛠 Behoben / Updated
- **Meta-Helper im Summary**: Der „?“-Button wird nun korrekt angezeigt,  
  wenn ein Meta-Erfolg über **Required For**-Links im Summary-Bereich geöffnet wird.  
  → Der Meta-Helper erhält jetzt direkt das angeklickte Achievement-Objekt anstatt über den Titelvergleich zu arbeiten, wodurch Anzeige- und Erkennungsfehler behoben werden.

### ❗ Bekannte Probleme
- **Meta-Helper & Last Completion**: Der „?“-Button erscheint aktuell noch nicht,  
  wenn ein Meta-Erfolg direkt aus der Last-Completion-Liste geöffnet wird.

---

## 📦 Changelog – Version 0.8.0

### ✨ Added
- **Identity Achievements (Race & Class), including Turtle races High Elf & Goblin**  
- **Identity Metas:** *Alliance Ancestry*, *Horde Bloodlines*, *Class Connoisseur*, *Identity Grandmaster*  
- **New Event Module `events_identity.lua`:** detects race/class on login; token normalization; safe triggers on `PLAYER_LOGIN`, `PLAYER_ENTERING_WORLD`, `VARIABLES_LOADED`  
- **Meta Helper:** For meta achievements, a “?” button now appears next to the detail title.  
  Clicking it opens a panel showing all related sub-achievements with current progress.  
- **Meta Criteria Tooltips:** In the Meta Helper window (“?” button), sub-achievements now display a tooltip on mouse-over, showing the name and description.

### 🛠 Fixed / Updated
- **UI Notifications (Chat/Sound):**  
  Chat and sound notifications are now only triggered **once** in the display controller, no longer additionally during queueing.  
  → Prevents duplicate or multiple chat messages and sound outputs when achievement popups appear.  
  → Includes a short debounce to block identical notifications in quick succession.  
- **Level Achievements:** Titles and descriptions expanded.  
- **Generic Quest & Kill Achievements:**  
  Updated blocking logic in `logic_scroll.lua` to ignore inactive and Hardcore-inactive entries,  
  and to stop newly completed achievements from blocking the next milestone in the same frame.  
  → Generic quest and kill milestones (e.g., 5 → 10) now appear immediately after completion.  
- **Notify Frame Toggle:**  
  The `NotifyEnabled` setting now only controls the frame’s visibility.  
  Chat and sound notifications are no longer blocked when the frame is disabled.  
- **Replay/Test Button:**  
  Combined “Play Last Achievement” and “Show Notify Test” into a single button.  
  The button replays the last shown notification or shows a test message if none exist.  
  → Prevents multiple triggers and simplifies operation.  
- **Token Normalization:** `UNDEAD → SCOURGE`, `BLOODELF → HIGHELF`; fallback to localized name if no token is available.  
- **Grouping/Sorting:** Added `identity` to `typeMap` and to the order for **ALL** & **Character** → Identity now displays correctly.  
- **Result Builder:** Added **subdividers “Race” / “Class”** in the Identity block.  
- **Labels/UI:** Reactivated **ALL2** as *“Character: Identity (Race & Class)”*; mapped meta subcategory label **`character` → “Identity (Race & Class)”**.  
- **Scroll in Meta Helper Window:** The criteria window now correctly supports scrolling even with a large number of sub-achievements.  
- **Compatibility Fix:** Replaced `string.gmatch` with a Classic-compatible `string.find`-based solution in the skill event handler.  
  → Prevents Lua errors on Turtle WoW (WoW Classic 1.12) when handling skill and weapon progress messages.

---

## 📦 Changelog – Version 0.8.0 (Deutsch)

### ✨ Hinzugefügt
- **Identitäts-Erfolge (Rasse & Klasse), inkl. Turtle-Rassen High Elf & Goblin** 
- **Identity-Metas:** *Alliance Ancestry*, *Horde Bloodlines*, *Class Connoisseur*, *Identity Grandmaster* 
- **Neues Event-Modul `events_identity.lua`:** erkennt Rasse/Klasse beim Login; Token-Normalisierung; sichere Trigger auf `PLAYER_LOGIN`, `PLAYER_ENTERING_WORLD`, `VARIABLES_LOADED`
- **Meta-Hilfe:** Bei Meta-Erfolgen erscheint nun ein „?“-Button neben dem Detail-Titel.  
  Ein Klick öffnet ein Panel mit allen zugehörigen Unter-Erfolgen inkl. aktuellem Fortschritt.
- **Meta-Kriterien-Tooltips:** Im Meta-Hilfefenster („?“-Button) werden Unter-Erfolge jetzt mit einem Tooltip bei Maus-Over angezeigt, der Name und Beschreibung des jeweiligen Erfolges enthält.


### 🛠 Behoben / Aktualisiert
- **UI Notifications (Chat/Sound):**  
  Chat- und Sound-Benachrichtigungen werden jetzt nur noch **einmal** im Anzeige-Controller ausgegeben, nicht mehr zusätzlich beim Queueing.  
  → Verhindert doppelte oder mehrfache Chatmeldungen und Soundausgaben bei Erfolgspopups.  
  → Inklusive kurzer Entprellung, um identische Meldungen in schneller Abfolge zu blockieren.
- **Level Erfolge** Titel und Beschreibung erweitert.
- **Generische Quest- & Kill-Erfolge:**  
  Blockierlogik in `logic_scroll.lua` angepasst, um inaktive und Hardcore-inaktive Einträge zu ignorieren  
  und frisch abgeschlossene Erfolge nicht mehr im selben Frame den nächsten Meilenstein blockieren zu lassen.  
  → Generische Quest- und Kill-Meilensteine (z. B. 5 → 10) erscheinen nun sofort nach dem Abschluss.
- **Notify-Frame-Umschalter:**  
  Die Einstellung `NotifyEnabled` steuert jetzt nur noch die Sichtbarkeit des Frames.  
  Chat- und Soundbenachrichtigungen werden nicht mehr blockiert, wenn der Frame deaktiviert ist.
- **Replay/Test-Button:**  
  „Play Last Achievement“ und „Show Notify Test“ zu einem einzigen Button zusammengefasst.  
  Der Button spielt die letzte angezeigte Benachrichtigung erneut ab oder zeigt eine Testmeldung, falls keine existiert.  
  → Verhindert Mehrfachauslösungen und vereinfacht die Bedienung.
- **Token-Normalisierung:** `UNDEAD → SCOURGE`, `BLOODELF → HIGHELF`; Fallback auf lokalisierten Namen, falls kein Token vorhanden.  
- **Gruppierung/Sortierung:** `identity` in `typeMap` und in die Reihenfolge für **ALL** & **Character** aufgenommen → Identity wird korrekt angezeigt.  
- **Result-Builder:** **Subdivider „Race“ / „Class“** im Identity-Block hinzugefügt.  
- **Labels/UI:** **ALL2** reaktiviert als *„Character: Identity (Race & Class)”*; Meta-Unterkategorie-Label **`character` → „Identity (Race & Class)”** gemappt.
- **Scrollfunktion im Meta-Hilfefenster:** Das Kriterienfenster unterstützt nun korrektes Scrollen auch bei einer großen Anzahl an Unter-Erfolgen.
- **Kompatibilitätsfehler behoben:** Ersetzung von `string.gmatch` durch eine Classic-kompatible `string.find`-basierte Lösung in der Skill-Event-Verarbeitung.  
  → Verhindert Lua-Fehler auf Turtle WoW (WoW Classic 1.12) bei Skill- und Waffenfortschrittsmeldungen.

---

## Changelog - Version 0.7.1

### ✨ Added
- New **kill achievement** for *Vile Familiar*  
- New **quest achievement** for *Galgar's Cactus Apple Surprise*
- **Chat Notifications (optional):** Added an optional chat message when an achievement pops. Toggle via `/kam notifychat on|off` or in Settings → “Toggle Chat Notify”. Saved per character.


### 🛠 Fixed / Updated
- **UI Notifications:** Long achievement descriptions in the notification frame are now automatically truncated with “…” if still too long.
- **Update:** Increased kill group achievement requirement from 10 to 25 kills.
- **Named Quest Tracking:**  
  Added self-contained, Classic-compatible `SafeExtract` / `SafeMatch` functions in `events_quest.lua`.  
  → Fixes an issue where named quest completions were not detected if global helpers were unavailable.  
  → Now works independently of `events.lua` and remains robust against changes in other event modules.

---

## 📦 Changelog – Version 0.7.1 (Deutsch)

### ✨ Hinzugefügt
- Neuer **Kill-Erfolg** für *Vile Familiar*  
- Neuer **Quest-Erfolg** für *Galgar's Kaktusapfel-Überraschung*  
- **Chat-Benachrichtigungen (optional):** Optionale Chatnachricht hinzugefügt, wenn ein Erfolg erscheint.  
  Umschaltbar über `/kam notifychat on|off` oder in den Einstellungen → „Toggle Chat Notify“.  
  Einstellung wird pro Charakter gespeichert.

### 🛠 Behoben / Aktualisiert
- **UI-Benachrichtigungen:** Lange Erfolgsbeschreibungen im Benachrichtigungsfenster werden nun automatisch mit „…“ abgeschnitten, falls sie immer noch zu lang sind.  
- **Update:** Anforderung für Kill-Gruppenerfolge von 10 auf 25 Kills erhöht.  
- **Named-Quest-Tracking:**  
  Eigenständige, Classic-kompatible `SafeExtract`- / `SafeMatch`-Funktionen in `events_quest.lua` hinzugefügt.  
  → Behebt ein Problem, bei dem benannte Questabschlüsse nicht erkannt wurden, wenn globale Helper nicht verfügbar waren.  
  → Funktioniert jetzt unabhängig von `events.lua` und bleibt robust gegenüber Änderungen in anderen Eventmodulen.

---

## 📦 Changelog – Version 0.7.0

### ✨ Added
- **Death Achievements**:
  - *First Fall* – first death of the character.
  - *Bare Bones* – death without wearing any armor.
  - Death milestones: 5 / 10 / 25 / 50 / 100 deaths (`DEATH_COUNT` group, cumulative).
- **Death Tracking**:
  - Separate event handlers for death qualifiers (First/Naked) and death counters.
  - Fully Classic-compatible (Lua 5.1, no modern constructs).
- **UI Integration**:
  - Death achievements now appear under **Character** and on **ALL1** (Generic Progression).
- **Additional Achievements**:
  - Kill achievements for Mulgore.

### 🛠 Fixed / Updated
- **ALL1 Filter**:
  - Now includes Death achievements alongside Level/Quest/Generic Kill.
  - HC filter also applies to Death generics.
  - Hardcore generics in ALL1 are hidden on non-HC characters.
- **Dropdown Categories**:
  - Hardcore category fixed in position after “Skills,” always visible regardless of HC status.
- **Legacy Achievements**:
  - Now only displayed when completed.
- **(Sub)Dividers**:
  - Added new (sub)dividers.
- **Reputation Tracking:** Fixed an issue where a conflict with a global `SafeMatch` variable could cause a Lua error (`bad argument #1 to 'tonumber'`).  
  → Reputation gains are now detected robustly, even when other addons use variables or functions with the same name.
- **Named Kill Group:** Added milestone logic – higher `namedkillgroup` tiers are automatically hidden as long as a lower, unfinished tier for the same mob group exists (also applies to the Summary view).
- **UI Search Field:** Pressing the Enter key now removes focus from the search field, preventing further input until clicked again.
- **Tooltip Styling:** Changed the color scheme of KAM tooltip lines – instead of standard yellow, now uses calm, Classic-friendly colors (blue-green, warm beige, neutral gray) to stand out from pfUI and other addons.

---


## 📦 Changelog – Version 0.7.0 (Deutsch)

### ✨ Added
- **Death Achievements**:
  - *First Fall* – erster Tod des Charakters.
  - *Bare Bones* – Tod ohne jegliche Rüstungsteile.
  - Death-Meilensteine: 5 / 10 / 25 / 50 / 100 Tode (`DEATH_COUNT`-Gruppe, kumulativ).
- **Death Tracking**:
  - Separate Event-Handler für Death-Qualifier (First/Naked) und Death-Counter.
  - Vollständig Classic-kompatibel (Lua 5.1, keine modernen Konstrukte).
- **UI-Integration**:
  - Death-Erfolge erscheinen unter **Character** und auf **ALL1** (Generic Progression).
- **Weitere Erfolge hinzugefügt**:
  - Kill Erfolge für Mulgore 

### 🛠 Fixed / Updated
- **ALL1-Filter**:
  - Enthält jetzt auch Death-Achievements neben Level/Quest/Generic Kill.
  - HC-Filter greift auch bei Death-Generics.
  - Hardcore-Generics in ALL1 werden bei non-HC-Chars ausgeblendet.
- **Dropdown-Kategorien**:
  - Hardcore-Kategorie fest nach „Skills“ einsortiert, unabhängig vom HC-Status sichtbar.
- **Legacy Achievements**: 
  - werden nur als abgeschlossen angezeigt
- **(Sub)Divider**:
  - neue (Sub)Divider hinzugefügt  
- **Reputation Tracking:** Fehler behoben, bei dem ein Konflikt mit einer globalen `SafeMatch`-Variable zu einem Lua-Fehler (`bad argument #1 to 'tonumber'`) führen konnte.  
  → Rufgewinne werden nun robust erkannt, auch wenn externe Addons gleichnamige Funktionen oder Variablen nutzen.
- **Named Kill Group:** Staffel-Logik hinzugefügt – höhere `namedkillgroup`-Stufen werden automatisch ausgeblendet, solange eine niedrigere, noch offene Stufe derselben Mob-Gruppe existiert (gilt auch für die Summary-Ansicht).
- **UI Search Field:** Drücken der Enter-Taste entfernt nun den Fokus aus dem Suchfeld, sodass keine weitere Eingabe möglich ist, bis es erneut angeklickt wird.
- **Tooltip Styling:** Farbschema der KAM-Zusatzzeilen geändert – statt dem Standard-Gelb nun ruhige, classic-freundliche Farben (Blaugrün, warmes Beige, neutrales Grau), um sich klar von pfUI und anderen Addons abzuheben.


## 📦 Changelog – Version 0.6.0

### ✨ Added
- **Hardcore Mode Detection** via passive spell in spellbook.  
  → Once detected, all HC-specific achievements are unlocked and progress can be tracked.
- **New Achievement Category:** `Hardcore Achievements` (page `ALL13B`), visible only when Hardcore mode is active.
- **Hardcore Versions** of kill, quest, reputation, and level achievements added alongside normal ones.
- **New Quest Achievements** for starting zones and capital cities:  
  → Elwynn Forest, Durotar, Dun Morogh, Teldrassil, Mulgore, Thalassian Highlands, Blackstone Isle.  
  → Stormwind, Orgrimmar, Darnassus, Ironforge, Undercity, Thunder Bluff.
- **Raid and Dungeon Questlines** added as achievements:  
  → Blackrock Depths (Royal Rescue), Blackwing Lair, Molten Core, Naxxramas, Onyxia, Ruins/Temple of Ahn’Qiraj, Zul’Gurub.
- **Segmented Quest Pages** for Story, Professions, Raids, and Class quests in the ALL view.
- **Questhub Sub-Dividers** in the Quests category:  
  → Achievements with the same questhub value are now automatically grouped.  
  → Supports starting zones, capital cities, dungeons, and raids.

### 🛠 Fixed / Updated
- Normal achievements now continue to progress when Hardcore mode is active.
- Corrected filters and category handling so that Hardcore and normal achievements can both be tracked simultaneously.
- Labels system updated to support dynamic visibility for the Hardcore page.
- **`generickill` Tracking** extended to `HOSTILE_DEATH` events for more reliable counting (works with and without Floating Combat Text).
- **Account-wide Skill Achievements** now only track the highest value ever reached (no longer accumulate lower character values).
- **UI Main Frame:** Reworked for a cleaner layout and consistent button design.
- **UI Config Frame:** Completely redesigned for improved layout, cleaner structure, and unified button design.
- **Category Dropdown:** Adjusted frame level to correctly sit below game windows.
- **Result Builder:** Added questhub-based divider logic.
- Updated existing quest achievements with questhub values to enable future sorting.
- Updated quest descriptions for clearer zone references.
- **Elite and Boss Kill Descriptions** updated to clarify that presence at the kill is sufficient.

---

## 📦 Changelog – Version 0.6.0 (Deutsch)

### ✨ Hinzugefügt
- **Hardcore-Modus-Erkennung** über passiven Zauber im Zauberbuch.  
  → Sobald erkannt, werden alle HC-spezifischen Erfolge freigeschaltet und Fortschritt kann erfasst werden.
- **Neue Erfolgskategorie:** `Hardcore Achievements` (Seite `ALL13B`), sichtbar nur, wenn der Hardcore-Modus aktiv ist.
- **Hardcore-Versionen** von Kill-, Quest-, Ruf- und Level-Erfolgen zusätzlich zu den normalen hinzugefügt.
- **Neue Quest-Erfolge** für Startgebiete und Hauptstädte:  
  → Elwynn Forest, Durotar, Dun Morogh, Teldrassil, Mulgore, Thalassian Highlands, Blackstone Isle.  
  → Stormwind, Orgrimmar, Darnassus, Ironforge, Undercity, Thunder Bluff.
- **Raid- und Dungeon-Questreihen** als Erfolge hinzugefügt:  
  → Blackrocktiefen (Königliche Rettung), Pechschwingenhort, Geschmolzener Kern, Naxxramas, Onyxia, Ruinen/Tempel von Ahn’Qiraj, Zul’Gurub.
- **Segmentierte Quest-Seiten** für Story-, Berufs-, Raid- und Klassen-Quests in der ALL-Ansicht.
- **Questhub-Unterteiler** in der Kategorie Quests:  
  → Erfolge mit gleichem questhub werden automatisch zusammengefasst.  
  → Unterstützt Startgebiete, Hauptstädte, Dungeons und Raids.

### 🛠 Behoben / Geändert
- Normale Erfolge zählen nun auch weiter, wenn der Hardcore-Modus aktiv ist.
- Filter- und Kategorienlogik angepasst, sodass Hardcore- und normale Erfolge gleichzeitig erfasst werden.
- Labels-System aktualisiert, um die Hardcore-Seite dynamisch ein-/auszublenden.
- **`generickill`-Zählung** auf `HOSTILE_DEATH`-Events erweitert, um zuverlässiger zu zählen (funktioniert mit und ohne Floating Combat Text).
- **Accountweite Skill-Erfolge** erfassen nur noch den höchsten jemals erreichten Wert (niedrigere Werte von anderen Charakteren werden nicht mehr addiert).
- **UI-Hauptfenster:** Überarbeitet für ein aufgeräumteres Layout und einheitliches Button-Design.
- **UI-Konfigurationsfenster:** Komplett überarbeitet für ein aufgeräumteres Layout, klarere Struktur und einheitliche Buttons.
- **Kategorie-Dropdown:** Ebenenpriorität korrigiert, überdeckt keine Spielfenster mehr.
- **Resultbuilder:** Neue questhub-Logik für Unterteiler eingebaut.
- Vorhandene Quest-Erfolge mit questhub-Werten ergänzt, um spätere Sortierung zu ermöglichen.
- Quest-Beschreibungen um klare Gebietsangaben erweitert.
- **Beschreibungen für Elite- und Boss-Kill-Erfolge** überarbeitet, Klarstellung, dass Anwesenheit beim Tod ausreichend ist.

## Changelog - Version 0.5.2

### 🛠 Fixed / Updated
- Description of Kill Achievement adjust. 

## 📦 Changelog – Version 0.5.2 (Deutsch)

- Beschreibung von Kill Erfolgen justiert. 
## Changelog - Version 0.5.1

### 🛠 Fixed / Updated
- Tooltip now stable with pfui
- Correct Layer for Dropdown

## 📦 Changelog – Version 0.5.1 (Deutsch)

### 🛠 Behoben / Überarbeitet
- Tooltip funktioniert nun auch mit pfUI
- Layer korrigiert für Dropdown


## 📦 Changelog – Version 0.5.0

### ✨ Added
- Preparation for Patch 1.18: New zones added for future exploration
→ Preloaded subzones for upcoming Turtle WoW expansion
- All remaining zones in Eastern Kingdoms and Kalimdor have been added
→ Includes zone-based achievements and full meta achievements for both continents
→ New overarching meta for "Azeroth Explorer"
- Notification popup now plays a sound when shown 
- Option to toggle the notification sound in the settings panel
- Notify frame now displays the achievement description along with the title
→ Title and description are shown together when available

### 🛠 Fixed / Updated
- Alpha achievement has been marked as a Legacy achievement
→ No longer obtainable, but remains visible for those who earned it

- UI: The search field is now aligned with the "All" button
→ Improved visual consistency across the top section of the main frame
- Improved stability when loading exploration achievements
→ Achievements without continent or zonegroup are now automatically placed into "Unknown" / "Unsorted" sections to avoid UI errors
→ Prevents crashes caused by malformed or incomplete data
- Kill mechanics expanded and refined
→ Elite and Raid bosses now only require proximity at the time of death
→ Critters and group targets still require personal kill credit (self-kill)
→ Introduced new kill type groups for proper sorting and UI clarity
- Meta category now shows proper labels for subgroups like "Combat" and "Reputation"
- Generic Kill progression now respects milestone filtering (only next tier shown in ALL1)
- Achievement "Bristleback Invasion" moved to "namedkillgroup" Type

### 🔥 Removed: 
- Plainstrider kill achievements (10/20) removed
- Duskbat Slayer kill achievement removed
---

## 📦 Changelog – Version 0.5.0 (Deutsch)

### ✨ Hinzugefügt
- Vorbereitung auf Patch 1.18: Neue Gebiete für zukünftige Erkundungserfolge integriert
→ Vorab eingebundene Unterzonen für das kommende Turtle WoW-Update
- Alle verbleibenden Gebiete in den Östlichen Königreichen und Kalimdor wurden ergänzt
→ Enthält Gebietserfolge und vollständige Meta-Erfolge für beide Kontinente
→ Zusätzlich ein übergreifender Erfolg: „Entdecker von Azeroth“
- Benachrichtigungen spielen jetzt einen Sound beim Aufpoppen ab
- Benachrichtigungssound kann jetzt im Einstellungsmenü ein- oder ausgeschaltet werden
- Notify-Fenster zeigt zusätzlich zur Erfolgsüberschrift nun auch die **Beschreibung** an  
→ Titel und Beschreibung werden gemeinsam angezeigt, wenn vorhanden

### 🛠 Behoben / Überarbeitet
- Alpha-Erfolg wurde als Legacy-Erfolg markiert
→ Nicht mehr erspielbar, bleibt aber sichtbar für alle, die ihn erreicht haben

- UI: Das Suchfeld ist jetzt **bündig mit dem „All“-Button** ausgerichtet  
→ Optisch saubere Ausrichtung im oberen Bereich des Hauptfensters
- Stabilitätsverbesserung bei Erkundungserfolgen
→ Erfolge ohne continent oder zonegroup werden nun automatisch unter "Unknown" / "Unsorted" gruppiert
→ Verhindert UI-Fehler durch unvollständige oder fehlerhafte Daten
- Kill-Logik erweitert und überarbeitet
→ Elite- und Raidbosse benötigen nur noch Anwesenheit beim Tod
→ Critter und Gruppenziele setzen weiterhin einen eigenen Killblow voraus
→ Neue Killgruppen eingeführt für eine saubere Trennung und Sortierung im UI
- Meta-Kategorie zeigt nun korrekte Labels für Untergruppen wie „Kampf“ und „Ruf“
- Generische Kill-Meilensteine zeigen in ALL1 nur die nächste noch offene Stufe an
- Achievement "Bristleback Invasion" verschoben in "namedkillgroup" Type

### 🔥 Entfernt: 
- Plainstrider Kill Erfolge (10/20) wurden entfernt
- Duskbat Slayer Kill Erfolg wurde entfernt

---
## 📦 Changelog – Version 0.4.3

### 🛠 Fixed / Updated
- Modularized former `ui_scrolllogic.lua` into clean logic files  
→ Structural reorganization without altering visible functionality

---

## 📦 Changelog – Version 0.4.3 (Deutsch)

### 🛠 Behoben / Überarbeitet
- Ehemalige `ui_scrolllogic.lua` strukturell modularisiert  
→ Technische Umstellung ohne sichtbare Funktionsänderung

---

## 📦 Changelog – Version 0.4.2

### ✨ Added
- New sorting logic for weapon and profession skills
→ Skill groups are now displayed in descending order of progress, with each step sorted by goal.

### 🛠 Fixed / Updated
- Cleaned up internal grouping and skill block processing

- Improved logic separation for weapon vs. profession achievements

## 📦 Changelog – Version 0.4.2 (Deutsch)

### ✨ Neu hinzugefügt
- Neue Sortierlogik für Waffen- und Berufs-Fertigkeiten
→ Skillgruppen werden nun in absteigender Reihenfolge ihres Fortschritts angezeigt, jeder Fortschritt innerhalb der Gruppe ist nach Zielwert sortiert.

### 🛠 Behoben / Überarbeitet
- Interne Gruppierung und Verarbeitung von Skills überarbeitet

- Logik für Waffen- und Berufs-Erfolge sauber getrennt

---

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
