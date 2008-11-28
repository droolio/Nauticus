
local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

-- German localisation by Alex6002 & LarryCurse
L:RegisterTranslations("deDE", function() return {

-- options
["Options"] = "Optionen",
["Icons"] = "Icons",
["Icon options."] = "Icon Optionen.",
["Show icons"] = "Zeige Icons",
["Toggle on/off map icons."] = "Kartenicons ein-/ausschalten.",
["Mini-Map icon size"] = "Minikarte Icongröße",
["Change the size of the Mini-Map icons."] = "Ändert die Größe der Minikarte Icons.",
["World Map icon size"] = "Weltkarte Icongröße",
["Change the size of the World Map icons."] = "Ändert die Größe der Weltkarte Icons.",
["Auto select transport"] = "Automatische Transportauswahl",
["Automatically select nearest transport when standing at platform."] = "Automatisch den nächstgelegenen Transport auswählen, wenn man auf einer Plattform steht.",
["Crew chat filter"] = "Crewgesprächfilter",
["Toggle on/off chat filter for yelling crew spam."] = "Ein-/Ausschalten des Filters für die Gespräche der Crew.",
["Alarm delay"] = "Alarm Zeit",
["Change the alarm delay (in seconds)."] = "Ändert die Zeit ab, wann der Alarm vor dem Abflug ertönen soll (in Sekunden).",

-- miscellaneous
["Arrival"] = "Ankunft",
["Departure"] = "Abfahrt",
["Arr"] = "Arr", -- abbreviation for Arrival
["Dep"] = "Dep", -- abbreviation for Departure
["Select Transport"] = "Route auswählen",
["Select None"] = "Nichts auswählen",
["No Transport Selected"] = "Keine Route ausgewählt",
["Not Available"] = "Nicht Erreichbar",
["N/A"] = "N/A", -- abbreviation for Not Available
["Nauticus Options"] = "Nauticus Optionen",
["Alarm is now: "] = "Der Alarm ist jetzt: ",
["ON"] = "An",
["OFF"] = "Aus",
["Daily: "] = "Täglich: ",

["Show only transports for your faction"] = "Zeige nur Transportmittel deiner Fraktion",
["Shows only neutral and transports specific to your faction."] = "Zeigt nur neutrale und Transportmittel deiner Fraktion.",
["Show only transports in your current zone"] = "Zeige nur Transportmittel der momentanen Zone",
["Shows only transports in your current zone."] = "Zeigt nur Transportmittel der momentanen Zone.",
["Hint: Click to cycle transport. Alt-Click to set up alarm"] = "Hinweis: Klick - Reiseroute auswählen. Alt-Klick - Alarm aktivieren.",
["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."] = "Neue Versionen findest Du bei http://drool.me.uk/naut.",
["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."] = "Sie haben eine veraltete Version von Nauticus mehr als 10 Tage verwendet, ausgehende Kommunikation wird deaktiviert.",
["Thank you for upgrading."] = "Danke für das Upgraden.",

-- list of ship crew npc's to filter from chat (*must* strictly match the in-game name)
-- org2uc:
["Frezza"] = "Frezza",
["Zapetta"] = "Zapetta",
["Sky-Captain Cloudkicker"] = "Himmelskapitän Wolkenwirbler",
["Chief Officer Coppernut"] = "Erster Offizier Kupfernuss",
["Navigator Fairweather"] = "Navigator Schönwetter",
-- uc2gg:
["Hin Denburg"] = "Hin Denburg",
["Navigator Hatch"] = "Navigator Bodenluke",
["Chief Officer Hammerflange"] = "Erster Offizier Hammerflansch",
["Sky-Captain Cableclamp"] = "Himmelskapitän Kabelspant",
-- org2gg:
["Snurk Bucksquick"] = "Snurk Zasterwill",
-- mh2ther:
["Captain \"Stash\" Torgoley"] = "Kapitän \"Schatzsucher\" Torgoley",
["First Mate Kowalski"] = "Erster Maat Kowalski",
["Navigator Mehran"] = "Navigationsoffizier Mehran",
-- uc2ven
["Meefi Farthrottle"] = "Meefi Weitdrossel",
["Drenk Spannerspark"] = "Drenk Spannfunke",
-- war2org
["Greeb Ramrocket"] = "Grieb Rammrakete",
["Nargo Screwbore"] = "Nargo Bohrschraub",
-- wg2wg:
["Harrowmeiser"] = "Eggenmeiser",

-- ship names
["The Thundercaller"] = "Die Donnersturm",
["The Iron Eagle"] = "Der Eiserne Adler",
["The Purple Princess"] = "Die Prinzessin Violetta",
["The Maiden's Fancy"] = "Die Launische Minna",
["The Bravery"] = "Die Bravado",
["The Lady Mehley"] = "Die Lady Mehley",
["The Moonspray"] = "Die Mondgischt",
["Feathermoon Ferry"] = "Mondfederfähre",
["Elune's Blessing"] = "Elunes Segen",
["The Mighty Wind"] = "Die Windesmacht",
["Cloudkisser"] = "Die Wolkenkuss",
["Walker of Waves"] = "Wellenreiter",
["Green Island"] = "Grüne Insel",
["The Kraken"] = "Die Kraken",
["Northspear"] = "Nordspeer",
["Captured Zeppelin"] = "Captured Zeppelin",

-- zones (*must* strictly match the in-game name)
["Orgrimmar"] = "Orgrimmar",
["Undercity"] = "Unterstadt",
["The Exodar"] = "Die Exodar",
["Stormwind City"] = "Sturmwind",

["Durotar"] = "Durotar",
["Tirisfal Glades"] = "Tirisfal",
["Stranglethorn Vale"] = "Schlingendorntal",
["The Barrens"] = "Das Brachland",
["Wetlands"] = "Sumpfland",
["Darkshore"] = "Dunkelküste",
["Dustwallow Marsh"] = "Düstermarschen",
["Teldrassil"] = "Teldrassil",
["Azuremyst Isle"] = "Azurmythosinsel",
["Feralas"] = "Feralas",
["Westfall"] = "Westfall",
["Borean Tundra"] = "Boreanische Tundra",
["Howling Fjord"] = "Der heulende Fjord",
["Dragonblight"] = "Drachenöde",

["The Veiled Sea"] = "Das verhüllte Meer",
["Twisting Nether"] = "Wirbelnder Nether",
["The Frozen Sea"] = "Die gefrorene See",

-- subzones
["Grom'gol"] = "Grom'gol",
["Booty Bay"] = "Beutebucht",
["Ratchet"] = "Ratschet",
["Menethil Harbor"] = "Menethil",
["Auberdine"] = "Auberdine",
["Theramore"] = "Theramore",
["Rut'Theran Village"] = "Rut'Theran",
["Sardor Isle"] = "Insel Sardor",
["Feathermoon"] = "Mondfederfeste",
["Forgotten Coast"] = "Die vergessene Küste",
["Warsong Hold"] = "Kriegshymnenfeste",
["Vengeance Landing"] = "Hafen der Vergeltung",
["Valiance Keep"] = "Valianzfeste",
["Valgarde"] = "Valgarde",
["Unu'pe"] = "Unu'pe",
["Moa'ki Harbor"] = "Hafen von Moa'ki",
["Kamagua"] = "Kamagua",
["Westguard Keep"] = "Westwache",

-- abbreviations
["Org"] = "Org",  -- Orgrimmar
["UC"]  = "Us",   -- Undercity
["Exo"] = "Exo",  -- The Exodar
["SC"]  = "Stur", -- Stormwind City

["GG"]  = "GG",   -- Grom'gol
["BB"]  = "BB",   -- Booty Bay
["Rat"] = "Rat",  -- Ratchet
["MH"]  = "Mene", -- Menethil Harbor
["Aub"] = "Aub",  -- Auberdine
["Th"]  = "Ther", -- Theramore
["RTV"] = "Rut",  -- Rut'Theran Village
["FMS"] = "Mond", -- Feathermoon
["Fer"] = "Fer",  -- Feralas
["War"] = "Khf",  -- Warsong Hold
["Ven"] = "HdV",  -- Vengeance Landing
["VK"]  = "Vf",   -- Valiance Keep
["VG"]  = "Vg",   -- Valgarde
["Unu"] = "Unu",  -- Unu'pe
["Moa"] = "Moa",  -- Moa'ki Harbor
["Kam"] = "Kam",  -- Kamagua
["WGK"] = "Ww",   -- Westguard Keep

} end)
