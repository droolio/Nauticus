
-- German localisation by Alex6002 & LarryCurse
local L = LibStub("AceLocale-3.0"):NewLocale("Nauticus", "deDE")
if not L then return; end

-- addon description
L["Tracks the precise arrival & departure schedules of boats and Zeppelins around Azeroth and displays them on the Mini-Map and World Map in real-time."] = "Verfolgt die genaue Position sowie Ankunfts- und Abfahrtszeiten von Booten und Zeppelinen in Azeroth an und zeigt sie auf der Minikarte und der Weltkarte in Echtzeit an."

-- slash commands (no spaces!)
L["icons"] = true
L["minishow"] = true
L["worldshow"] = true
L["minisize"] = true
L["worldsize"] = true
L["faction"] = true
L["minibutton"] = true
L["autoselect"] = true
L["filter"] = true
L["alarm"] = true

-- options
L["Options"] = "Optionen"
L["General Settings"] = "Allgemeine Einstellungen"
L["Map Icons"] = "Kartenicons"
L["Options for displaying transports as icons on the Mini-Map and World Map."] = "Optionen für die Darstellung der Transportmittel als Icons auf der Minikarte und der Weltkarte."
L["Show on Mini-Map"] = "Zeige auf der Minikarte"
L["Toggle display of icons on the Mini-Map."] = "Ein-/Ausschalten der Anzeige der Icons auf der Minikarte."
L["Show on World Map"] = "Zeige auf der Weltkarte"
L["Toggle display of icons on the World Map."] = "Ein-/Ausschalten der Anzeige der Icons auf der Weltkarte."
L["Mini-Map icon size"] = "Minikarte Icongröße"
L["Change the size of the Mini-Map icons."] = "Ändert die Größe der Minikarte Icons."
L["World Map icon size"] = "Weltkarte Icongröße"
L["Change the size of the World Map icons."] = "Ändert die Größe der Weltkarte Icons."
L["Faction only"] = "Nur Fraktion"
L["Hide transports of opposite faction from the map, showing only neutral and those of your faction."] = "Verstecke Transportmittel der gegnerischen Fraktion auf der Karte und zeige nur neutrale und die von Deiner Fraktion."
L["Auto select transport"] = "Automatische Transportauswahl"
L["Automatically select nearest transport when standing at platform."] = "Automatisch den nächstgelegenen Transport auswählen, wenn man auf einer Plattform steht."
L["Crew chat filter"] = "Crewgesprächfilter"
L["Toggle the filter for removing ship crew talk and Zeppelin Master yells from the chat window."] = "Ein-/Ausschalten des Filters für die Gespräche der Schiffscrew und der Zeppelinmeister für das Chatfenster."
L["Alarm delay"] = "Alarm Zeit"
L["Change the alarm delay (in seconds)."] = "Ändert die Zeit ab, wann der Alarm vor dem Abflug ertönen soll (in Sekunden)."
L["Mini-Map button"] = "Minikarte Button"
L["Toggle the Mini-Map button."] = "Ein-/Ausschalten des Minimap Button"

-- miscellaneous
L["Arrival"] = "Ankunft"
L["Departure"] = "Abfahrt"
L["Select Transport"] = "Route auswählen"
L["Select None"] = "Nichts auswählen"
L["No Transport Selected"] = "Keine Route ausgewählt"
L["Not Available"] = "Nicht Erreichbar"
L["N/A"] = "N/A" -- abbreviation for Not Available
L["Nauticus Options"] = "Nauticus Optionen"
L["Alarm is now: "] = "Der Alarm ist jetzt: "
L["ON"] = "An"
L["OFF"] = "Aus"

L["List friendly faction only"] = "Zeige nur Transportmittel freundlicher Fraktionen" -- re do?
L["Shows only neutral transports and those of your faction."] = "Zeigt nur neutrale und Transportmittel deiner Fraktion." -- check?
L["List relevant to current zone only"] = "Zeige nur Transportmittel der momentanen Zone" -- re do?
L["Shows only transports relevant to your current zone."] = "Zeigt nur Transportmittel der momentanen Zone." -- check?
L["Hint: Click to cycle transport. Alt-Click to set up alarm"] = "Hinweis: Klick - Reiseroute auswählen. Alt-Klick - Alarm aktivieren."
L["New version available! Visit www.drool.me.uk/naut"] = "Neue Version verfügbar! Schau auf www.drool.me.uk/naut"

-- list of ship crew npc's to filter from chat (*must* strictly match the in-game name)
-- org2uc:
L["Frezza"] = "Frezza"
L["Zapetta"] = "Zapetta"
L["Sky-Captain Cloudkicker"] = "Himmelskapitän Wolkenwirbler"
L["Chief Officer Coppernut"] = "Erster Offizier Kupfernuss"
L["Navigator Fairweather"] = "Navigator Schönwetter"
-- uc2gg:
L["Hin Denburg"] = "Hin Denburg"
L["Navigator Hatch"] = "Navigator Bodenluke"
L["Chief Officer Hammerflange"] = "Erster Offizier Hammerflansch"
L["Sky-Captain Cableclamp"] = "Himmelskapitän Kabelspant"
-- org2gg:
L["Snurk Bucksquick"] = "Snurk Zasterwill"
-- mh2ther:
L["Captain \"Stash\" Torgoley"] = "Kapitän \"Schatzsucher\" Torgoley"
L["First Mate Kowalski"] = "Erster Maat Kowalski"
L["Navigator Mehran"] = "Navigationsoffizier Mehran"
-- uc2ven
L["Meefi Farthrottle"] = "Meefi Weitdrossel"
L["Drenk Spannerspark"] = "Drenk Spannfunke"
-- war2org
L["Greeb Ramrocket"] = "Grieb Rammrakete"
L["Nargo Screwbore"] = "Nargo Bohrschraub"
-- wg2wg:
L["Harrowmeiser"] = "Eggenmeiser"
-- tb2org:
L["Krendle Bigpockets"] = true -- to do
L["Zelli Hotnozzle"] = true -- to do
L["Sky-Captain \"Dusty\" Blastnut"] = true -- to do
L["Watcher Tolwe"] = true -- to do

-- ship names
L["The Thundercaller"] = "Die Donnersturm"
L["The Iron Eagle"] = "Der Eiserne Adler"
L["The Purple Princess"] = "Die Prinzessin Violetta"
L["The Maiden's Fancy"] = "Die Launische Minna"
L["The Bravery"] = "Die Bravado"
L["The Lady Mehley"] = "Die Lady Mehley"
L["The Moonspray"] = "Die Mondgischt"
L["Feathermoon Ferry"] = "Mondfederfähre"
L["Elune's Blessing"] = "Elunes Segen"
L["The Mighty Wind"] = "Die Windesmacht"
L["Cloudkisser"] = "Die Wolkenkuss"
L["Walker of Waves"] = "Wellenreiter"
L["Green Island"] = "Grüne Insel"
L["The Kraken"] = "Die Kraken"
L["Northspear"] = "Nordspeer"
L["Captured Zeppelin"] = "Eroberter Zeppelin"
L["The Zephyr"] = true -- to do

-- zones (*must* strictly match the in-game name)
L["Orgrimmar"] = "Orgrimmar"
L["Undercity"] = "Unterstadt"
L["The Exodar"] = "Die Exodar"
L["Stormwind City"] = "Sturmwind"
L["Thunder Bluff"] = true -- to do

L["Durotar"] = "Durotar"
L["Tirisfal Glades"] = "Tirisfal"
L["Northern Stranglethorn"] = true -- to do
L["The Cape of Stranglethorn"] = true -- to do
L["Northern Barrens"] = true -- to do
L["Southern Barrens"] = true -- to do
L["Wetlands"] = "Sumpfland"
L["Dustwallow Marsh"] = "Düstermarschen"
L["Teldrassil"] = "Teldrassil"
L["Azuremyst Isle"] = "Azurmythosinsel"
L["Elwynn Forest"] = true -- to do
L["Westfall"] = "Westfall"
L["Borean Tundra"] = "Boreanische Tundra"
L["Howling Fjord"] = "Der heulende Fjord"
L["Dragonblight"] = "Drachenöde"
L["Mulgore"] = true -- to do

L["The Veiled Sea"] = "Das verhüllte Meer"
L["Twisting Nether"] = "Wirbelnder Nether"
L["The Frozen Sea"] = "Die gefrorene See"
L["The Great Sea"] = true -- to do

-- subzones
L["Grom'gol"] = "Grom'gol"
L["Booty Bay"] = "Beutebucht"
L["Ratchet"] = "Ratschet"
L["Menethil Harbor"] = "Menethil"
L["Theramore"] = "Theramore"
L["Rut'Theran Village"] = "Rut'Theran"
L["Warsong Hold"] = "Kriegshymnenfeste"
L["Vengeance Landing"] = "Hafen der Vergeltung"
L["Valiance Keep"] = "Valianzfeste"
L["Valgarde"] = "Valgarde"
L["Unu'pe"] = "Unu'pe"
L["Moa'ki Harbor"] = "Hafen von Moa'ki"
L["Kamagua"] = "Kamagua"
L["Westguard Keep"] = "Westwache"

-- abbreviations
L["Org"] = "Org"  -- Orgrimmar
L["UC"]  = "Us"   -- Undercity
L["Exo"] = "Exo"  -- The Exodar
L["SC"]  = "Stur" -- Stormwind City
L["TB"]  = true   -- to do; Thunder Bluff

L["GG"]  = "GG"   -- Grom'gol
L["BB"]  = "BB"   -- Booty Bay
L["Rat"] = "Rat"  -- Ratchet
L["MH"]  = "Mene" -- Menethil Harbor
L["Th"]  = "Ther" -- Theramore
L["RTV"] = "Rut"  -- Rut'Theran Village
L["War"] = "Khf"  -- Warsong Hold
L["Ven"] = "HdV"  -- Vengeance Landing
L["VK"]  = "Vf"   -- Valiance Keep
L["VG"]  = "Vg"   -- Valgarde
L["Unu"] = "Unu"  -- Unu'pe
L["Moa"] = "Moa"  -- Moa'ki Harbor
L["Kam"] = "Kam"  -- Kamagua
L["WGK"] = "Ww"   -- Westguard Keep
