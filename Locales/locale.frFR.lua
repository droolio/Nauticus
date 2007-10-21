
local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

L:RegisterTranslations("frFR", function() return {

-- general
["Save"] = "Garder",
["Close"] = "Fermer",
["Minimise"] = "Minimise",
["Maximise"] = "Maximise",
["Options"] = "Options",

-- miscellaneous
["Arrival"] = "Arriv\195\169e",
["Departure"] = "D\195\169part",
["Arr"] = "Arr", -- abbreviation for Arrival
["Dep"] = "D\195\169p", -- abbreviation for Departure
["None Selected"] = "None Selected",
["Select Transport"] = "Select Transport",
["No Transit Selected"] = "No Transit Selected",
["Not Available"] = "Non Disponible",
["N/A"] = "N/A", -- abbreviation for Not Available
["Nauticus Options"] = "Nauticus Options",

--[[
["Show GUI when zone change contains a transport"] = true,
["Show only transports for your faction"] = true,
["Shows only neutral and transports specific to your faction."] = true,
["Show only transports in your current zone"] = true,
["Shows only transports in your current zone."] = true,
["Display using city aliases"] = true,
["Displays destinations as city aliases instead of zone names (e.g. Undercity instead of Tirisfal Glades)."] = true,
["Click to cycle transport.|nAlt-Click to set up alarm"] = true,
["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."] = true,
["Type /nauticus or /naut gui show to show again."] = true,
["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."] = true,
["Thank you for upgrading."] = true,
]]

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
]]

-- zones
["Orgrimmar"] = "Orgrimmar",
["Undercity"] = "Fossoyeuse",
["The Exodar"] = "L'Exodar",

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
["Booty Bay"] = "Booty Bay",
["Ratchet"] = "Ratchet",
["Menethil Harbour"] = "Menethil Harbour",
["Auberdine"] = "Auberdine",
["Theramore"] = "Theramore",
["Rut'Theran Village"] = "Rut'Theran Village",
["Sardor Isle"] = "Sardor Isle",
["Feathermoon"] = "Feathermoon",
["Forgotten Coast"] = "Forgotten Coast",

-- abbreviations
["Org"]	= "Org",	-- Orgrimmar
["UC"]	= "UC",		-- Undercity
["Exo"]	= "Exo",	-- The Exodar

["GG"]	= "GG",		-- Grom'gol
["BB"]	= "BB",		-- Booty Bay
["Ra"]	= "Ra",		-- Ratchet
["MH"]	= "MH",		-- Menethil Harbour
["Aub"]	= "Aub",	-- Auberdine
["Th"]	= "Th",		-- Theramore
["RTV"]	= "RTV",	-- Rut'Theran Village
["FMS"]	= "FMS",	-- Feathermoon
["Fer"]	= "Fer",	-- Feralas

} end)
