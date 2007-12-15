
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
["Select Transport"] = "Select Transport",
["Select None"] = "Select None", -- to do
["No Transport Selected"] = "No Transport Selected",
["Not Available"] = "Non Disponible",
["N/A"] = "N/A", -- abbreviation for Not Available
["Nauticus Options"] = "Nauticus Options",

--[[
["Show GUI when zone change contains a transport"] = true,
["Show only transports for your faction"] = true,
["Shows only neutral and transports specific to your faction."] = true,
["Show only transports in your current zone"] = true,
["Shows only transports in your current zone."] = true,
["Click to cycle transport.|nAlt-Click to set up alarm"] = true,
["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."] = true,
["Type /nauticus or /naut gui show to show again."] = true,
["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."] = true,
["Thank you for upgrading."] = true,
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
["Menethil Harbor"] = "Menethil Harbor",
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
["MH"]	= "MH",		-- Menethil Harbor
["Aub"]	= "Aub",	-- Auberdine
["Th"]	= "Th",		-- Theramore
["RTV"]	= "RTV",	-- Rut'Theran Village
["FMS"]	= "FMS",	-- Feathermoon
["Fer"]	= "Fer",	-- Feralas

} end)
