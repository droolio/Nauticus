
local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

L:RegisterTranslations("deDE", function() return {

-- general
["Save"] = "Speichern",
["Close"] = "Schlie\195\159en",
["Minimise"] = "Minimise",
["Maximise"] = "Maximise",
["Options"] = "Optionen",

-- miscellaneous
["Arrival"] = "Ankunft",
["Departure"] = "Abfahrt",
["Arr"] = "Arr", -- abbreviation for Arrival
["Dep"] = "Dep", -- abbreviation for Departure
["Select Transport"] = "Route w\195\164hlen",
["Select None"] = "Select None", -- to do
["No Transport Selected"] = "No Transport Selected",
["Not Available"] = "Nicht Erreichbar",
["N/A"] = "N/A", -- abbreviation for Not Available
["Nauticus Options"] = "Nauticus Options",
["Daily: "] = "Daily: ",

["Show GUI when zone change contains a transport"] =
	"\195\150ffne Fenster wenn in einer Zone mit Transportmittel",
["Show only transports for your faction"] =
	"Zeige nur Transportmittel deiner Fraktion",
["Shows only neutral and transports specific to your faction."] =
	"Zeigt nur neutrale und Transportmittel deiner Fraktion.",
["Show only transports in your current zone"] =
	"Zeige nur Transportmittel der momentanen Zone",
["Shows only transports in your current zone."] =
	"Zeigt nur Transportmittel der momentanen Zone.",
["Hint: Click to cycle transport. Alt-Click to set up alarm"] =
	"Hinweis: Klick - Reiseroute ausw\195\164hlen. Alt-Klick - Alarm aktivieren.",
["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."] =
	"Neue Versionen findest Du bei http://drool.me.uk/naut.",
["Type /nauticus or /naut gui show to show again."] =
	"Type /nauticus or /naut gui show to show again.", -- to do
["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."] =
	"You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled.", -- to do
["Thank you for upgrading."] =
	"Thank you for upgrading.", -- to do

-- zones
["Orgrimmar"] = "Orgrimmar",
["Undercity"] = "Unterstadt",
["The Exodar"] = "Die Exodar",
["Stormwind City"] = "Stormwind",

["Durotar"] = "Durotar",
["Tirisfal Glades"] = "Tirisfal",
["Stranglethorn Vale"] = "Schlingendorntal",
["The Barrens"] = "Das Brachland",
["Wetlands"] = "Das Sumpfland",
["Darkshore"] = "Dunkelk\195\188ste",
["Dustwallow Marsh"] = "D\195\188stermarschen",
["Teldrassil"] = "Teldrassil",
["Azuremyst Isle"] = "Azurmythosinsel",
["Feralas"] = "Feralas",
["Westfall"] = "Westfall",
["Borean Tundra"] = "Borean Tundra",
["Howling Fjord"] = "Howling Fjord",
["Dragonblight"] = "Dragonblight",

["The Veiled Sea"] = "Das verh\195\188llte Meer",
["Twisting Nether"] = "Wirbelnder Nether",
["The Frozen Sea"] = "The Frozen Sea",

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
["Forgotten Coast"] = "Die vergessene K\195\188ste",
["Warsong Hold"] = "Warsong Hold",
["Vengeance Landing"] = "Vengeance Landing",
["Valiance Keep"] = "Valiance Keep",
["Valgarde"] = "Valgarde",
["Unu'pe"] = "Unu'pe",
["Moa'ki Harbor"] = "Moa'ki Harbor",
["Kamagua"] = "Kamagua",
["Westguard Keep"] = "Westguard Keep",

-- abbreviations
["Org"] = "Org",  -- Orgrimmar
["UC"]  = "Us",   -- Undercity
["Exo"] = "Exo",  -- The Exodar
["SC"]  = "Stor", -- Stormwind City

["GG"]  = "GG",   -- Grom'gol
["BB"]  = "BB",   -- Booty Bay
["Rat"] = "Rat",  -- Ratchet
["MH"]  = "Mene", -- Menethil Harbor
["Aub"] = "Aub",  -- Auberdine
["Th"]  = "Ther", -- Theramore
["RTV"] = "Rut",  -- Rut'Theran Village
["FMS"] = "Mond", -- Feathermoon
["Fer"] = "Fer",  -- Feralas
["War"] = "War",  -- Warsong Hold
["Ven"] = "Ven",  -- Vengeance Landing
["VK"]  = "VK",   -- Valiance Keep
["VG"]  = "VG",   -- Valgarde
["Unu"] = "Unu",  -- Unu'pe
["Moa"] = "Moa",  -- Moa'ki Harbor
["Kam"] = "Kam",  -- Kamagua
["WGK"] = "WGK",  -- Westguard Keep

} end)
