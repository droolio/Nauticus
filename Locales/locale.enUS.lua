
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
["None Selected"] = true,
["Select Transport"] = true,
["No Transit Selected"] = true,
["Not Available"] = true,
["N/A"] = true, -- abbreviation for Not Available
["Nauticus Options"] = true,

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

-- yells and comments to filter:
-- note for translators - these are precise in-game chat messages as spoken by the goblin zeppelin masters
["The zeppelin to %s has just arrived! All aboard for %s!"] = true,
["Don't be late, the next ship to %s departs in only a minute!"] = true,
["The zeppelin should have just arrived at %s..."] = true,
["The zeppelin should have just left from %s..."] = true,
["The zeppelin to %s should be arriving here any time now."] = true,
["There goes the zeppelin to %s. I hope there's no explosions this time."] = true,
["I never get to ride to Grom'gol. Its just so unfair. Warm, steamy beaches... Crocolisks, Raptors... hmmm... maybe I don't really want to go there after all."] = true,

-- zones
["Orgrimmar"] = true,
["Undercity"] = true,
["The Exodar"] = true,

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
