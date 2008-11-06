
local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

L:RegisterTranslations("enUS", function() return {

-- general
["Save"] = true,
["Close"] = true,
["Minimise"] = true,
["Maximise"] = true,
["Options"] = true,

-- miscellaneous
["Arrival"] = true,
["Departure"] = true,
["Arr"] = true, -- abbreviation for Arrival
["Dep"] = true, -- abbreviation for Departure
["Select Transport"] = true,
["Select None"] = true,
["No Transport Selected"] = true,
["Not Available"] = true,
["N/A"] = true, -- abbreviation for Not Available
["Nauticus Options"] = true,

["Show GUI when zone change contains a transport"] = true,
["Show only transports for your faction"] = true,
["Shows only neutral and transports specific to your faction."] = true,
["Show only transports in your current zone"] = true,
["Shows only transports in your current zone."] = true,
["Hint: Click to cycle transport. Alt-Click to set up alarm"] = true,
["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."] = true,
["Type /nauticus or /naut gui show to show again."] = true,
["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."] = true,
["Thank you for upgrading."] = true,

-- zones
["Orgrimmar"] = true,
["Undercity"] = true,
["The Exodar"] = true,
["Stormwind City"] = true,

["Durotar"] = true,
["Tirisfal Glades"] = true,
["Stranglethorn Vale"] = true,
["The Barrens"] = true,
["Wetlands"] = true,
["Darkshore"] = true,
["Dustwallow Marsh"] = true,
["Teldrassil"] = true,
["Azuremyst Isle"] = true,
["Feralas"] = true,

["The Veiled Sea"] = true,
["Twisting Nether"] = true,

-- subzones
["Grom'gol"] = true,
["Booty Bay"] = true,
["Ratchet"] = true,
["Menethil Harbor"] = true,
["Auberdine"] = true,
["Theramore"] = true,
["Rut'Theran Village"] = true,
["Sardor Isle"] = true,
["Feathermoon"] = true,
["Forgotten Coast"] = true,

-- abbreviations
["Org"]	= true,	-- Orgrimmar
["UC"]	= true,	-- Undercity
["Exo"]	= true,	-- The Exodar
["SC"]	= true,	-- Stormwind City

["GG"]	= true,	-- Grom'gol
["BB"]	= true,	-- Booty Bay
["Ra"]	= true,	-- Ratchet
["MH"]	= true,	-- Menethil Harbor
["Aub"]	= true,	-- Auberdine
["Th"]	= true,	-- Theramore
["RTV"]	= true,	-- Rut'Theran Village
["FMS"]	= true,	-- Feathermoon
["Fer"]	= true,	-- Feralas

} end)
