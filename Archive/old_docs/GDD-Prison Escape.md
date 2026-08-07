# GDD – *Jailbreak*

**Spieleranzahl:** 2–6

---

## 1. High-Concept / Pitch

Du wachst in einer Zelle auf. Du kennst niemanden. Du hast nichts. In 15–20 Minuten
musst du mit ein paar Fremden (deinen Freunden) aus einem Gefängnis fliehen, das nie
zweimal gleich aussieht, bewacht von Wachen, die nie zweimal gleich reagieren. Warum 15-20 Minuten? Weil keine Ahnung dann du/einer aus der Gruppe zum Todestrakt geführt wirst oder so idk. Als incentive oder lore oder so. 

---

## 2. Design-Philosophie

**Die eine Faustregel, die über allem steht:**

> Nie "der Spieler kann X tun" programmieren. Systeme programmieren (Licht, Sound,
> Autorität, Hunger, Aufmerksamkeit, Vertrauen) und sie aufeinander knallen lassen.

Drei harte Design-Gesetze:

1. **Jedes Problem hat mindestens 3 Lösungen.** Wenn ein Playtest zeigt, dass ein
   Raum/Hindernis nur einen Lösungsweg hat, ist das ein Bug, kein Feature.
   (Beispiel: Wachtturm blockiert den Hof → A: Ablenkung, B: Stromausfall,
   C: Verkleidung, D: einfach schnell genug sein.)
2. **Kein Skript ersetzt eine Regel.** Keine "wenn Spieler X tut, dann Cutscene Y" –
   alles läuft über Zustände (State Machines, Werte, Trigger-Schwellen), die für
   Spieler *lesbar* und *ausnutzbar* sind.
3. **Fairness kommt aus Transparenz, nicht aus Balance.** Der Spieler darf verlieren, weil er einen Fehler gemacht hat, den er hätte sehen können – nie weil ein
   Würfelwurf im Hintergrund unsichtbar gegen ihn lief.

---

## 3. Core Pillars

- **Emergenz statt Skript** – jede Runde ist eine neue Geschichte, weil Systeme
  interagieren, nicht weil Content abgespult wird
- **Gear + Skill, nie Klasse** – dein Charakter hat keine Attribute. Was du kannst,
  hängt davon ab, was du in der Runde findest und wie gut du es einsetzt
- **Proximity Voice als Gameplay-Mechanik**, nicht nur Comfort-Feature, auch Items wie Walkie Talkies als common loot, weil den anderen spieler nicht zu hören nervig ist. Oder eine Andere art sich mit der Person abzusprechen.
- **Wiederspielbarkeit durch Prozedural + Persönlichkeit**
- **Clip-Fabrik** – jede Runde soll 1–2 screenrecordbare Momente produzieren

---

## 4. Charakter-Design: "Die Hülle"

### 4.1 Grundprinzip

Dein Häftling ist **keine Klasse, keine Rolle, kein Build**. Er ist eine Hülle:
Körper, Gesicht, Stimme, Nummer auf der Uniform. Zwei Spieler auf Level 1 und
Level 80 sind **mechanisch identisch**, wenn die Zellentür aufgeht. (Nur bildlisch gesagt es wird auch noch andere wege geben dem Gefängnis zu entkommen als einfach nur eine offene Tür)

Sieg/Niederlage entsteht ausschließlich aus:

1. **Gear** – was du in dieser konkreten Runde findest, trägst und kombinierst
2. **Skill** – Timing, Kommunikation, Game-Sense, Entscheidungen unter Druck

### 4.2 Charakter-Erstellung (rein kosmetisch)

- Modularer Avatar-Baukasten: Kopf/Frisur/Bart, Körpertyp (rein visuell),
  Hautfarbe/Tattoos, Uniform-Variante (Farbe, Abnutzung, Patches)
- Stimme: Pitch-Slider + Bark-Sets (Schmerzlaute, Ablenkungsrufe, "Psst"-Callouts) –
  kosmetisch, keine Gameplay-Wirkung. (Schedule 1?)
- Persönliche "Marke": freischaltbares Graffiti-Tag für die Zelle? (siehe 4.4)

### 4.4 Progression – "Das Vorstrafenregister" (Rap Sheet)

Account-weites Meta-System, ARC-Raiders-inspiriert, aber entschärft:

- Jede Runde (auch gescheiterte Fluchten!) gibt XP → Spieler Level (NICHT ALWAYS ONLINE TYPE STUFF MEHR IN RICHTUNG GUNFIRE REBORN ODER SO)
- Pro Level: 1 Punkt für den **Contraband-Baum** – Nodes bewusst *horizontal*:
  - **Kosmetik-Freischaltungen** (Hauptbelohnung): Uniform-Patterns, Tattoos,
    Graffiti-Tags, Emotes, Voice-Bark
  - **Respec jederzeit kostenlos** – Experimentieren fördern, nicht bestrafen
  - **Season Wipe / "Lockdown"-Event** (optional): kosmetische Season-Rewards,
    kein Gameplay-Vorteil über Runden hinaus. Maybe Expeditionen wie in ARC-Raides
Dass hört sich jetzt hier ja schon alles an wie "ich mache dass nächste life service game" hier müsste nochmal entschärft werden.


**Design-Grenze:** Das Rap Sheet existiert für den Dranbleib-Loop, darf aber nie der
Grund sein, warum ein Team gewinnt. Wenn ein Level-1-Spieler mit gutem Gear und
Timing genauso gut fliehen kann wie ein Level-80-Spieler, funktioniert das System. Ausserdem sollte die progression nie der grund sein warum ein Spieler dass Spiel spielt, er sollte es spielen weil es ihm Spass macht wie in ARC Raiders wo man reinkommt einach nur für den thrill einer Runde.

---

## 5. Game Flow

1. **Lobby** – Host erstellen/IP joinen, Name + Aussehen wählen, Ready-Check (Gefängnis bus Setting?)
2. **Rundenstart** – Gefängnis wird prozedural generiert (Seed),
   Wachen-Persönlichkeiten gewürfelt, 1–2 Random Events aktiv
3. **Playing** – Spawn im Cellblock, Flucht-Requirements unbekannt bis erkundet,
   Loot sammeln, Wachen umgehen/ablenken/austricksen
4. **Flucht-Fenster** – Requirements erfüllt → Exit öffnet, Uhr tickt
5. **Rundenende** – Recap, was getan wurde, und um strategie zu verbessern auch mit routen die man gelaufen ist.
Es gibt kein "halte schlüssel und rohrbombe in der hand um zu escapen" man muss schon richtig physisch escapen auch ohne einfache item requirements. 
---

## 6. Room-System & Prozedurale Generierung

### 6.1 Room-Templates? (12, erweiterbar)

| Raum         | Security | Besonderheit                                |
| ------------ | -------- | ------------------------------------------- |
| Cellblock    | 0        | Startraum, immer da                         |
| Cafeteria    | 0        | Viel Platz, Essensausgabe (Ablenkungs-Hub)  |
| Guard Office | 2        | Alarm-Button, Kameras steuerbar             |
| Yard         | 0        | Offen, freie Sicht, Hund-Event möglich      |
| Infirmary    | 1        | Medkits, Skalpelle                          |
| Storage      | 1        | Zufälliger Loot, dunkel, Verstecken möglich |
| Vent Shaft   | 1        | Geheimgang zwischen Etagen                  |
| Armory       | 2        | Waffen + Keycards, stark bewacht            |
| Laundry      | 0        | Uniformen (Tarnung), Versteck               |
| Shower       | 0        | Offen, wenig Deckung, Dampf blockiert Sicht |
| Library      | 0        | Ruhig, Wachen patrouillieren selten         |
| Exit         | 2        | Flucht-Endpunkt                             |

### 6.2 Generierungslogik

- Graph-basiert, Nodes + `door_points`
- 6 Räume/Etage, einstellige Etagen Standard, seed-basiert
- Required Rooms (Cellblock, Exit), Restricted Rooms (1x pro Map), Weighted Selection
- Extra Vent-Connections als Random-Shortcuts


---

## 7. Emergente Systeme (das Herzstück)

### 7.1 Die vier Kern-Systeme

| System                | Was es tut                                                                         | Wie andere Systeme es nutzen                                         |
| --------------------- | ---------------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| **Sound**             | Viele Aktion erzeugt Lärm-Quelle mit Radius + Lautstärke, durch Wände abgeschwächt | Wachen reagieren, Lärm als Ablenkung, Proximity Voice ist Teil davon |
| **Licht/Strom**       | Stromkreise pro Sektion, überlastbar, abschaltbar                                  | Dunkelheit senkt Wachen-Sichtradius, aber auch Spieler-Sicht         |
| **Autorität/Alarm**   | Globaler Alarm-Meter, steigt bei Verdacht, sinkt mit Zeit                          | Wachen-Verstärkung, Kamera-Aktivierung, Lockdown-Türen               |
| **Vertrauen/Tarnung** | Wärter-Uniform + unauffälliges Verhalten = niedrigere Entdeckungschance            | Kombiniert mit Nähe, Blickwinkel, Wachen-Persönlichkeit              |

### 7.2 Wachen-Verhalten (5 Persönlichkeiten)

| Typ | Vision | Hearing | Alert-Speed | Verhalten |
|-----|--------|---------|-------------|-----------|
| STRICT | 1.2x | 1.2x | schnell | Hört jeden Lärm |
| LAZY | 0.6x | 0.5x | langsam | Ignoriert vieles |
| CORRUPT | 0.8x | 0.7x | sehr langsam | Bestechlich |
| PARANOID | 1.1x | 1.3x | extrem schnell | Schlägt sofort Alarm |
| CARELESS | 0.5x | 0.6x | langsam | Übersieht Spieler leicht |

**Guard States:** PATROL → SUSPICIOUS → ALERT → SEARCHING → CALLING

**Wachen reden mit dem System, nicht mit Spielern direkt:** Eine Wache weiß nicht
"Spieler X ist verdächtig", sie kennt nur Werte (Lärm-Event bei Position Y,
Lautstärke Z). Exploits funktionieren *immer*, weil sie echte Systemregeln nutzen. Guards können miteinander reden.

### 7.3 System-Kombinationen (Beispiele)

- Essensausgabe + Vent = Essen durchs Rohr schieben, Wache verlässt Posten
- Stromkreis überlasten → Sicherung raus → Dunkelheit (wirklich dunkel) → aber auch Kameras tot
- Feueralarm → Chaos-Modus, alle NPCs rennen zum Sammelpunkt, Spieler tauchen unter
- Bestechung (Item an CORRUPT) senkt deren Alert-Radius für X Sekunden

### 7.4 Spieler-Kombinationen

- Spieler A redet laut mit Wache (Proximity Voice als Werkzeug, maybe ein kleines LLM (ganz klein unter 4b)), B schleicht vorbei
- Spieler C löst Stromausfall aus, während A+B im Zielraum warten
- Ein Spieler "opfert" sich, bindet Aufmerksamkeit, kann auch noch gesaved werden. bis keine ahnung was passiert ngl :sob:

**Faustregel:** Neues Feature = nur "E drücken, X passiert"? Abgelehnt, bis es an
mindestens zwei der vier Kern-Systeme angebunden ist.

---

## 8. Items & Loot

### 8.1 Item-Typen

- **Tool** – Crowbar, Keycard, Wire Cutters, Uniform (Flucht-Requirements) (errinert mich an granny ngl)
- **Weapon** – Schraubenschlüssel, Skalpell, Brechstange (Doppelnutzung Werkzeug/Waffe)
- **Food**
- **Key** – spezifische Türen
- **Misc** – Zahnbürste (Waffe/Dietrich/Ablenkung), Spiegelscherbe (um Ecken schauen),
  Seife (Boden glitschig = Ablenkungs-Trap) (holy trailer von Cuffbust lol)
**etwas braucht mindestes 2 usecases um drin zu sein**


### 8.2 Items als einziger Machtfaktor

Da Charaktere keine Stats haben, ist die Item-Ökonomie das gesamte Powergefühl
innerhalb einer Runde. Loot-Tables, Spawn-Raten, Kombinierbarkeit = einzige
Stellschraube für Schwierigkeitskurve.

- **Armory** → Werkzeuge, Waffen, Keycards (hohes Risiko/Ertrag)
- **Infirmary** → Skalpelle, Medkits
- **Cafeteria** → Messer, Essen, Ablenkungspotential
- **Storage** → Zufall
- **Laundry** → Uniform (Tarnung)
- **Guard Office** → Keycards, Funkgerät (Wachen-Funkverkehr mithören!)

### 8.3 Item-System (Resource-basiert, GDScript)

- `ItemData` als `Resource`: `name`, `description`, `type`, `tool_type`, `weight`,
  `stackable`, `effect_value`
- `UseCase`-Tags statt harter Kategorien (Zahnbürste: `WEAPON`, `LOCKPICK`,
  `DISTRACTION`) – mehrere Lösungswege direkt im Datenmodell

---

## 9. Multiplayer & Networking
will probably be Netfox Noray or Tube (although i think its gonna be noray)

---

## 10. UI-Struktur

### Main Menu
- Host/Join + IP-Input, Name, Charakter-Editor, Player List + Ready-Check

### HUD
- Inventar (max. 4 Slots)(default 3), Health, Runden-Timer
- **Alarm-Meter** (sichtbar) – Transparenz-Prinzip aus Kapitel 2
---

## 12. Events & Wiederspielbarkeit

### Random Events (1–2 pro Runde)
- Inspektion heute (mehr Wachen, höhere Alertness)
- Ausgang gesperrt (Route dicht)
- Mitgefangener hilft (extra Item/Info)
- Wache krank (weniger Personal)
- Hund patrouilliert (Gefahr im Hof)
- Stromausfall (Dunkelheit, Fluchtchance)

### Routen-Variation
Item-Platzierung, offene/verschlossene Türen, Hund ja/nein – pro Runde neu gewürfelt.

---

## 14. Monetization

- Launch: $5–8, PC (Steam/Itch.io)
- Kein P2W, keine Mikrotransaktionen – Rap-Sheet rein zeitbasiert/kosmetisch
- Viral-Potential durch Clips, **Friendslop**-Zielgruppe

---

## 15. Namensvorschläge

1. **Cellmates** – warm, funny, Co-op-Fokus im Namen
2. **Jailbreak** – Klassiker


# [[VISUAL BIBLE]]