
local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

-- French localisation by thelys
L:RegisterTranslations("frFR", function() return {

-- options; TO DO:
["Options"] = "Options",
["Icons"] = "Icons",
["Icon options."] = "Icon options.",
["Show icons"] = "Show icons",
["Toggle on/off map icons."] = "Toggle on/off map icons.",
["Mini-Map icon size"] = "Mini-Map icon size",
["Change the size of the Mini-Map icons."] = "Change the size of the Mini-Map icons.",
["World Map icon size"] = "World Map icon size",
["Change the size of the World Map icons."] = "Change the size of the World Map icons.",
["Auto select transport"] = "Auto select transport",
["Automatically select nearest transport when standing at platform."] = "Automatically select nearest transport when standing at platform.",
["Crew chat filter"] = "Crew chat filter",
["Toggle on/off chat filter for yelling crew spam."] = "Toggle on/off chat filter for yelling crew spam.",
["Alarm delay"] = "Alarm delay",
["Change the alarm delay (in seconds)."] = "Change the alarm delay (in seconds).",

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
["Nauticus Options"] = "Nauticus Options", -- to do?
["Daily: "] = "Daily: ", -- to do

-- TO DO:
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
["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."] =
	"You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled.",
["Thank you for upgrading."] =
	"Thank you for upgrading.",

-- list of ship crew npc's to filter from chat (*must* strictly match the in-game name)
-- org2uc:
["Frezza"] = "Frezza",
["Zapetta"] = "Zapetta",
["Sky-Captain Cloudkicker"] = "Capitaine des cieux Bottenuage",
["Chief Officer Coppernut"] = "Second Cuivrécrou",
["Navigator Fairweather"] = "Navigateur Beautemps",
-- uc2gg:
["Hin Denburg"] = "Hin Denburg",
["Navigator Hatch"] = "Navigateur Écoutille",
["Chief Officer Hammerflange"] = "Second Collemarteau",
["Sky-Captain Cableclamp"] = "Capitaine des cieux Serrecable",
-- org2gg:
["Snurk Bucksquick"] = "Snurk Frikfacile",
-- mh2ther:
["Captain \"Stash\" Torgoley"] = "Capitaine Torgoley \"Le Magot\"",
["First Mate Kowalski"] = "Second Kowalski",
["Navigator Mehran"] = "Navigateur Mehran",
-- uc2ven
["Meefi Farthrottle"] = "Meefi Mélégaz",
["Drenk Spannerspark"] = "Drenk Klétincelle",
-- war2org
["Greeb Ramrocket"] = "Greeb Fusebélier",
["Nargo Screwbore"] = "Nargo Creusevisse",

-- ship names
["The Thundercaller"] = "Le Mande-tonnerre",
["The Iron Eagle"] = "L'Aigle de fer",
["The Purple Princess"] = "La Princesse violette",
["The Maiden's Fancy"] = "Le Caprice de la vierge",
["The Bravery"] = "La Bravoure",
["The Lady Mehley"] = "La Dame Mehley",
["The Moonspray"] = "L'Écume de lune",
["Feathermoon Ferry"] = "Bac de Pennelune",
["Elune's Blessing"] = "La Bénédiction d'Elune",
["The Mighty Wind"] = "Le Grand vent",
["Cloudkisser"] = "Le Frôle-nuage",
["Walker of Waves"] = "Marcheuse des flots",
["Green Island"] = "L'Île verte",
["The Kraken"] = "Le Kraken",
["Northspear"] = "La Lance du Nord",
["Captured Zeppelin"] = "Captured Zeppelin",

-- zones (*must* strictly match the in-game name)
["Orgrimmar"] = "Orgrimmar",
["Undercity"] = "Fossoyeuse",
["The Exodar"] = "L'Exodar",
["Stormwind City"] = "Hurlevent",

["Durotar"] = "Durotar",
["Tirisfal Glades"] = "Clairières de Tirisfal",
["Stranglethorn Vale"] = "Vallée de Strangleronce",
["The Barrens"] = "Les Tarides",
["Wetlands"] = "Les Paluns",
["Darkshore"] = "Sombrivage",
["Dustwallow Marsh"] = "Marécage d'Âprefange",
["Teldrassil"] = "Teldrassil",
["Azuremyst Isle"] = "Ile de Brume-azur",
["Feralas"] = "Féralas",
["Westfall"] = "Marche de l'Ouest",
["Borean Tundra"] = "Toundra Boréenne",
["Howling Fjord"] = "Fjord Hurlant",
["Dragonblight"] = "Désolation des dragons",

["The Veiled Sea"] = "La Mer voilée",
["Twisting Nether"] = "Le Néant distordu",
["The Frozen Sea"] = "La mer Gelée",

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
-- TO DO:
["Warsong Hold"] = "Warsong Hold",
["Vengeance Landing"] = "Vengeance Landing",
["Valiance Keep"] = "Valiance Keep",
["Valgarde"] = "Valgarde",
["Unu'pe"] = "Unu'pe",
["Moa'ki Harbor"] = "Moa'ki Harbor",
["Kamagua"] = "Kamagua",
["Westguard Keep"] = "Westguard Keep",

-- abbreviations
["Org"] = "Org", -- Orgrimmar
["UC"]  = "Fos", -- Undercity
["Exo"] = "Exo", -- The Exodar
["SC"]  = "Hur", -- Stormwind City

["GG"]  = "GrG", -- Grom'gol
["BB"]  = "BdB", -- Booty Bay
["Rat"] = "Cab", -- Ratchet
["MH"]  = "PdM", -- Menethil Harbor
["Aub"] = "Aub", -- Auberdine
["Th"]  = "The", -- Theramore
["RTV"] = "Rut", -- Rut'Theran Village
["FMS"] = "Pen", -- Feathermoon
["Fer"] = "Fer", -- Feralas
-- TO DO:
["War"] = "War", -- Warsong Hold
["Ven"] = "Ven", -- Vengeance Landing
["VK"]  = "VK",  -- Valiance Keep
["VG"]  = "VG",  -- Valgarde
["Unu"] = "Unu", -- Unu'pe
["Moa"] = "Moa", -- Moa'ki Harbor
["Kam"] = "Kam", -- Kamagua
["WGK"] = "WGK", -- Westguard Keep

} end)
