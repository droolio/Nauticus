
local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

L:RegisterTranslations("esES", function() return {

-- general
--[[
["Save"] = "Save",
["Close"] = "Close",
["Minimise"] = "Minimise",
["Maximise"] = "Maximise",
["Options"] = "Options",

-- miscellaneous
["Arrival"] = "Arrival",
["Departure"] = "Departure",
["Arr"] = "Arr", -- abbreviation for Arrival
["Dep"] = "Dep", -- abbreviation for Departure
["Select Transport"] = "Select Transport",
["Select None"] = "Select None", -- to do
["No Transport Selected"] = "No Transport Selected",
["Not Available"] = "Not Available",
["N/A"] = "N/A", -- abbreviation for Not Available
["Nauticus Options"] = "Nauticus Options",
]]

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
["Undercity"] = "Entra\195\177as",
["The Exodar"] = "El Exodar",

["Durotar"] = "Durotar",
["Tirisfal Glades"] = "Claros de Tirisfal",
["Stranglethorn Vale"] = "Vega de Tuercespina",
["The Barrens"] = "Los Bald\195\173os",
["Wetlands"] = "Los Humedales",
["Darkshore"] = "Costa Oscura",
["Dustwallow Marsh"] = "Marjal Revolcafango",
["Teldrassil"] = "Teldrassil",
["Azuremyst Isle"] = "Isla Bruma Azur",
["Feralas"] = "Feralas",

["The Veiled Sea"] = "Mar de la Bruma",
["Twisting Nether"] = "El Vac\195\173o Abisal",

-- subzones
--[[
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
]]

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
