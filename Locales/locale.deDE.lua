
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
["None Selected"] = "Nichts gew\195\164hlt",
["Select Transport"] = "Route w\195\164hlen",
["No Transit Selected"] = "No Transit Selected",
["Not Available"] = "Nicht Erreichbar",
["N/A"] = "N/A", -- abbreviation for Not Available
["Nauticus Options"] = "Nauticus Options",

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
["Display using city aliases"] =
	"Zeige Stadtnamen",
["Displays destinations as city aliases instead of zone names (e.g. Undercity instead of Tirisfal Glades)."] =
	"Zeigt Ziele als Stadtnamen nicht als Zonennamen an (bsp. Understadt <-> Tirisfal).",
["Click to cycle transport.|nAlt-Click to set up alarm"] =
	"Klick - Reiseroute ausw\195\164hlen.|nAlt-Klick - Alarm aktivieren.",
["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."] =
	"Neue Versionen findest Du bei http://drool.me.uk/naut.",
["Type /nauticus or /naut gui show to show again."] =
	"Type /nauticus or /naut gui show to show again.", -- to do
["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."] =
	"You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled.", -- to do
["Thank you for upgrading."] =
	"Thank you for upgrading.", -- to do

-- yells and comments to filter:
-- note for translators - these are precise in-game chat messages as spoken by the goblin zeppelin masters
--[[
["The zeppelin to %s has just arrived! All aboard for %s!"] =
	"The zeppelin to %s has just arrived! All aboard for %s!",
["Don't be late, the next ship to %s departs in only a minute!"] =
	"Don't be late, the next ship to %s departs in only a minute!",
["The zeppelin should have just arrived at %s..."] =
	"The zeppelin should have just arrived at %s...",
["The zeppelin should have just left from %s..."] =
	"The zeppelin should have just left from %s...",
["The zeppelin to %s should be arriving here any time now."] =
	"The zeppelin to %s should be arriving here any time now.",
["There goes the zeppelin to %s. I hope there's no explosions this time."] =
	"There goes the zeppelin to %s. I hope there's no explosions this time.",
["I never get to ride to Grom'gol. Its just so unfair. Warm, steamy beaches... Crocolisks, Raptors... hmmm... maybe I don't really want to go there after all."] =
	"I never get to ride to Grom'gol. Its just so unfair. Warm, steamy beaches... Crocolisks, Raptors... hmmm... maybe I don't really want to go there after all.",
]]

-- zones
["Orgrimmar"] = "Orgrimmar",
["Undercity"] = "Unterstadt",
["The Exodar"] = "Die Exodar",

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

["The Veiled Sea"] = "Das verh\195\188llte Meer",
["Twisting Nether"] = "Wirbelnder Nether",

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

-- abbreviations
["Org"]	= "Org",	-- Orgrimmar
["UC"]	= "Us",		-- Undercity
["Exo"]	= "Exo",	-- The Exodar

["GG"]	= "GG",		-- Grom'gol
["BB"]	= "BB",		-- Booty Bay
["Ra"]	= "Rat",	-- Ratchet
["MH"]	= "Mene",	-- Menethil Harbor
["Aub"]	= "Aub",	-- Auberdine
["Th"]	= "Ther",	-- Theramore
["RTV"]	= "Rut",	-- Rut'Theran Village
["FMS"]	= "Mond",	-- Feathermoon
["Fer"]	= "Fer",	-- Feralas

} end)
