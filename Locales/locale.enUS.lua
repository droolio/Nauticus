
local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

L:RegisterTranslations("enUS", function() return {

-- options
["Options"] = true,
["Icons"] = true,
["Icon options."] = true,
["Show icons"] = true,
["Toggle on/off map icons."] = true,
["Mini-Map icon size"] = true,
["Change the size of the Mini-Map icons."] = true,
["World Map icon size"] = true,
["Change the size of the World Map icons."] = true,
["Auto select transport"] = true,
["Automatically select nearest transport when standing at platform."] = true,
["Crew chat filter"] = true,
["Toggle on/off chat filter for yelling crew spam."] = true,
["Alarm delay"] = true,
["Change the alarm delay (in seconds)."] = true,

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
["Alarm is now: "] = true,
["ON"] = true,
["OFF"] = true,
["Daily: "] = true,

["Show only transports for your faction"] = true,
["Shows only neutral and transports specific to your faction."] = true,
["Show only transports in your current zone"] = true,
["Shows only transports in your current zone."] = true,
["Hint: Click to cycle transport. Alt-Click to set up alarm"] = true,
["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."] = true,
["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."] = true,
["Thank you for upgrading."] = true,

-- list of ship crew npc's to filter from chat (*must* strictly match the in-game name)
-- org2uc:
["Frezza"] = true,
["Zapetta"] = true,
["Sky-Captain Cloudkicker"] = true,
["Chief Officer Coppernut"] = true,
["Navigator Fairweather"] = true,
-- uc2gg:
["Hin Denburg"] = true,
["Navigator Hatch"] = true,
["Chief Officer Hammerflange"] = true,
["Sky-Captain Cableclamp"] = true,
-- org2gg:
["Snurk Bucksquick"] = true,
-- mh2ther:
["Captain \"Stash\" Torgoley"] = true,
["First Mate Kowalski"] = true,
["Navigator Mehran"] = true,
-- uc2ven
["Meefi Farthrottle"] = true,
["Drenk Spannerspark"] = true,
-- war2org
["Greeb Ramrocket"] = true,
["Nargo Screwbore"] = true,
-- wg2wg:
["Harrowmeiser"] = true,

-- ship names
["The Thundercaller"] = true,
["The Iron Eagle"] = true,
["The Purple Princess"] = true,
["The Maiden's Fancy"] = true,
["The Bravery"] = true,
["The Lady Mehley"] = true,
["The Moonspray"] = true,
["Feathermoon Ferry"] = true,
["Elune's Blessing"] = true,
["The Mighty Wind"] = true,
["Cloudkisser"] = true,
["Walker of Waves"] = true,
["Green Island"] = true,
["The Kraken"] = true,
["Northspear"] = true,
["Captured Zeppelin"] = true,

-- zones (*must* strictly match the in-game name)
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
["Westfall"] = true,
["Borean Tundra"] = true,
["Howling Fjord"] = true,
["Dragonblight"] = true,

["The Veiled Sea"] = true,
["Twisting Nether"] = true,
["The Frozen Sea"] = true,

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
["Warsong Hold"] = true,
["Vengeance Landing"] = true,
["Valiance Keep"] = true,
["Valgarde"] = true,
["Unu'pe"] = true,
["Moa'ki Harbor"] = true,
["Kamagua"] = true,
["Westguard Keep"] = true,

-- abbreviations
["Org"]	= true,	-- Orgrimmar
["UC"]	= true,	-- Undercity
["Exo"]	= true,	-- The Exodar
["SC"]	= true,	-- Stormwind City

["GG"]  = true,	-- Grom'gol
["BB"]  = true,	-- Booty Bay
["Rat"] = true,	-- Ratchet
["MH"]  = true,	-- Menethil Harbor
["Aub"] = true,	-- Auberdine
["Th"]  = true,	-- Theramore
["RTV"] = true,	-- Rut'Theran Village
["FMS"] = true,	-- Feathermoon
["Fer"] = true,	-- Feralas
["War"] = true, -- Warsong Hold
["Ven"] = true, -- Vengeance Landing
["VK"]  = true, -- Valiance Keep
["VG"]  = true, -- Valgarde
["Unu"] = true, -- Unu'pe
["Moa"] = true, -- Moa'ki Harbor
["Kam"] = true, -- Kamagua
["WGK"] = true, -- Westguard Keep

} end)
