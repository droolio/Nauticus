
local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

L:RegisterTranslations("frFR", function() return {

-- general
["Save"] = "Garder",
["Close"] = "Fermer",
["Minimise"] = "Minimiser",
["Maximise"] = "Maximiser",
["Options"] = "Options",

-- miscellaneous
["Arrival"] = "Arriv\195\169e",
["Departure"] = "D\195\169part",
["Arr"] = "Arr", -- abbreviation for Arrival
["Dep"] = "D\195\169p", -- abbreviation for Departure
["Select Transport"] = "Transport",
["Select None"] = "Aucun",
["No Transport Selected"] = "Aucun Transport",
["Not Available"] = "Non Disponible",
["N/A"] = "ND", -- abbreviation for Not Available
["Nauticus Options"] = "Nauticus Options",

-- TO DO:
["Show GUI when zone change contains a transport"] =
	"Show GUI when zone change contains a transport",
["Show only transports for your faction"] =
	"Show only transports for your faction",
["Shows only neutral and transports specific to your faction."] =
	"Shows only neutral and transports specific to your faction.",
["Show only transports in your current zone"] =
	"Show only transports in your current zone",
["Shows only transports in your current zone."] =
	"Shows only transports in your current zone.",
["Hint: Click to cycle transport. Alt-Click to set up alarm"] =
	"Astuce: Click to cycle transport. Alt-Click to set up alarm",
["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."] =
	"There is a new version of Nauticus available! Please visit http://drool.me.uk/naut.",
["Type /nauticus or /naut gui show to show again."] =
	"Type /nauticus or /naut gui show to show again.",
["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."] =
	"You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled.",
["Thank you for upgrading."] =
	"Thank you for upgrading.",

-- zones
["Orgrimmar"] = "Orgrimmar",
["Undercity"] = "Fossoyeuse",
["The Exodar"] = "L'Exodar",
["Stormwind City"] = "Hurlevent",

["Durotar"] = "Durotar",
["Tirisfal Glades"] = "Clairi\195\168res de Tirisfal",
["Stranglethorn Vale"] = "Vall\195\169e de Strangleronce",
["The Barrens"] = "Les Tarides",
["Wetlands"] = "Les Paluns",
["Darkshore"] = "Sombrivage",
["Dustwallow Marsh"] = "Mar\195\169cage d'\195\130prefange",
["Teldrassil"] = "Teldrassil",
["Azuremyst Isle"] = "Ile de Brume-azur",
["Feralas"] = "F\195\169ralas",

["The Veiled Sea"] = "La Mer voilée",
["Twisting Nether"] = "Le Néant distordu",

-- subzones
["Grom'gol"] = "Grom'gol",
["Booty Bay"] = "Baie-du-Butin",
["Ratchet"] = "Cabestan",
["Menethil Harbor"] = "Port de Menethil",
["Auberdine"] = "Auberdine",
["Theramore"] = "Theramore",
["Rut'Theran Village"] = "Rut'Theran",
["Sardor Isle"] = "Ile de Sardor",
["Feathermoon"] = "Pennelune",
["Forgotten Coast"] = "Cote oubli\195\169e",

-- abbreviations
["Org"] = "Org",	-- Orgrimmar
["UC"] = "Fos",		-- Undercity
["Exo"] = "Exo",	-- The Exodar
["SC"]	= "Hur",	-- Stormwind City

["GG"] = "GrG",		-- Grom'gol
["BB"] = "BdB",		-- Booty Bay
["Ra"] = "Cab",		-- Ratchet
["MH"] = "PdM",		-- Menethil Harbor
["Aub"] = "Aub",	-- Auberdine
["Th"] = "The",		-- Theramore
["RTV"] = "Rut",	-- Rut'Theran Village
["FMS"] = "Pen",	-- Feathermoon
["Fer"] = "Fer",	-- Feralas

} end)
