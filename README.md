🇬🇧 ENGLISH – GitHub Release Description

# 📦 Keijin Achievement Monitor (KAM)
**Version:** v1.0.1 | 
📦 [View changelog](Changelog.md)

**For:** Turtle WoW (WoW Classic 1.12)  
**Author:** Keijin  

---

## 📘 Description
KAM is a standalone achievement system for Turtle WoW (WoW Classic 1.12). 
It features:
- Custom achievements for exploration, quests, reputation, skills, kills, bosses and more
- Progress tracking on character and account level
- Classic-style user interface with category filters and summary
- Dynamic event system with real-time progress updates
- Minimap button for quick access
- Compact progress and completion display
- Compatible with all Turtle WoW content – including legacy areas

---

## How it works
Keijin Achievement Monitor (KAM) is a fully client-side achievement system for Turtle WoW (WoW Classic 1.12).
It relies on classic Lua events and chat output, tracks your progress locally (per character or account), and displays everything in a custom, minimalist UI.

Limitations:
- No retroactive tracking of previously completed content
- No online sync or server integration
- No modern Lua features – 100% Classic-compatible

---

## 🧰 Installation
1. Download the release ZIP
2. Extract into your `Interface/AddOns` folder  
   → Path: `World of Warcraft\_classic_\Interface\AddOns\KeijinAchievementMonitor`
3. Ensure the folder is named exactly `KeijinAchievementMonitor`
4. Restart WoW or type `/reload` in-game

---

## 🔧 Compatibility
- Game version: Turtle WoW / Classic 1.12 (`## Interface: 11200`)
- No modern WoW APIs, no dependencies – 100% Vanilla-compatible
- Tested in both solo and group settings

---

## 💾 SavedVariables
KAMN_Settings  
KAMN_CharacterDB  
KAMN_PlayerProgress  
KAMN_AccountProgress  
KAMN_UseAccountData


🧠 Developer Notes
This is an evolving system.
More achievements, better grouping, and detailed kill tracking will follow in future updates.
Feedback and bug reports are welcome – please include screenshots or debug output where possible.


---

## 🇩🇪 DEUTSCH – GitHub Release Beschreibung

# 📦 Keijin Achievement Monitor (KAM)
**Version:** v1.0.1 
📦 [Änderungsprotokoll ansehen](Changelog.md)

**Für:** Turtle WoW (WoW Classic 1.12)  
**Autor:** Keijin  

---

## 📘 Beschreibung
KAM ist ein eigenständiges Erfolgssystem für Turtle WoW (WoW Classic 1.12). 
Es bietet:
- Eigene Erfolge für Erkundung, Quests, Ruf, Fähigkeiten, Kills, Bosse und mehr
- Fortschrittsverfolgung auf Charakter- und Account-Ebene
- Benutzeroberfläche im Classic-Stil mit Kategorien und Zusammenfassung
- Dynamisches Eventsystem mit Live-Updates
- Minimap-Button für schnellen Zugriff
- Kompakte Anzeige von Fortschritt und Abschluss
- Kompatibel mit allen Turtle WoW-Inhalten – auch Legacy-Zonen

---
## Funktionsweise
Keijin Achievement Monitor (KAM) ist ein rein clientseitiges Erfolgssystem für Turtle WoW (WoW Classic 1.12).
Es arbeitet mit klassischen Lua-Events und Chatausgaben, speichert deinen Fortschritt lokal (Charakter / Account) und zeigt alles in einem eigenen, minimalistischen UI.

*Einschränkungen*:
- Kein rückwirkendes Tracking bereits erledigter Inhalte
- Kein Online-Sync oder Serverabgleich
- Keine modernen Lua-Funktionen – 100 % Classic-kompatibel
---
## 🧰 Installation
1. ZIP-Datei herunterladen
2. Entpacken in dein `Interface/AddOns` Verzeichnis  
   → Pfad: `World of Warcraft\_classic_\Interface\AddOns\KeijinAchievementMonitor`
3. Ordnername muss exakt `KeijinAchievementMonitor` lauten
4. Spiel neu starten oder `/reload` im Chat eingeben

---

## 🔧 Kompatibilität
- Spielversion: Turtle WoW / Classic 1.12 (`## Interface: 11200`)
- Keine modernen WoW-APIs, keine Abhängigkeiten – vollständig Vanilla-kompatibel
- Getestet in Solo- und Gruppensituationen

---

## 💾 Gespeicherte Variablen
KAMN_Settings  
KAMN_CharacterDB  
KAMN_PlayerProgress  
KAMN_AccountProgress  
KAMN_UseAccountData

🧠 Entwicklerhinweise
Dieses System wird laufend weiterentwickelt.
Weitere Erfolge, feinere Gruppierungen und genauere Killverfolgung folgen mit späteren Updates.
Feedback und Fehlerberichte sind willkommen – Screenshots oder Debug-Ausgaben helfen bei der Analyse.

---
### 🛠 Credits

## KillLog
https://github.com/Road-block/KillLog

## ShaguNotify
https://github.com/shagu/ShaguNotify
