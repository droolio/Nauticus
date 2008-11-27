
local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

-- French localisation by thelys
L:RegisterTranslations("frFR", function() return {

-- options; TO DO:
["Options"] = "Options",
["Icons"] = "Icones",
["Icon options."] = "Options d'icones.",
["Show icons"] = "Montrer les icones",
["Toggle on/off map icons."] = "Icones de carte on/off.",
["Mini-Map icon size"] = "Taille des icones de Mini-carte",
["Change the size of the Mini-Map icons."] = "Changer la taille des icones de Mini-carte.",
["World Map icon size"] = "Taille des icones de Carte du monde",
["Change the size of the World Map icons."] = "Changer la taille des icones de Carte du monde.",
["Auto select transport"] = "Sélection auto du transport",
["Automatically select nearest transport when standing at platform."] = "Sélection auto du transport le plus proche quand on est sur un quai.",
["Crew chat filter"] = "Filtrer les discussions de l'équipage",
["Toggle on/off chat filter for yelling crew spam."] = "Filtrer les cris de l'équipage.",
["Alarm delay"] = "Délai d'alarme",
["Change the alarm delay (in seconds)."] = "Changer le délai d'alarme (en secondes).",

-- miscellaneous
["Arrival"] = "Arrivée",
["Departure"] = "Départ",
["Arr"] = "Arr", -- abbreviation for Arrival
["Dep"] = "Dép", -- abbreviation for Departure
["Select Transport"] = "Transport",
["Select None"] = "Aucun",
["No Transport Selected"] = "Aucun Transport",
["Not Available"] = "Non Disponible",
["N/A"] = "ND", -- abbreviation for Not Available
["Nauticus Options"] = "Options de Nauticus",
["Alarm is now: "] = "Alarm is now: ", -- to do
["ON"] = "ON", -- to do
["OFF"] = "OFF", -- to do
["Daily: "] = "Journ.: ",

-- TO DO:
["Show only transports for your faction"] = "Ne montrer que les transports de votre faction",
["Shows only neutral and transports specific to your faction."] = "Ne montrer que les transports neutres et ceux de votre faction.",
["Show only transports in your current zone"] = "Ne montrer que les transports de la zone courrante",
["Shows only transports in your current zone."] = "Ne montrer que les transports de la zone courrante.",
["Hint: Click to cycle transport. Alt-Click to set up alarm"] = "Astuce: Cliquez pour changer de transport. Alt-Clic pour créer une alarme",
["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."] = "Nouvelle version de Nauticus disponible ! Visitez http://drool.me.uk/naut.",
["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."] = "Vous utilisez une version ancienne de Nauticus depuis plus de 10 jours, les communications externes sont désactivées.",
["Thank you for upgrading."] = "Merci de mettre à jour.",

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
-- wg2wg:
["Harrowmeiser"] = "Harrowmeiser",

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
["Captured Zeppelin"] = "Zeppelin capturé",

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
["Forgotten Coast"] = "Côte oubliée",
["Warsong Hold"] = "Bastion Chanteguerre",
["Vengeance Landing"] = "Accostage de la Vengeance",
["Valiance Keep"] = "Donjon de la Bravoure",
["Valgarde"] = "Valgarde",
["Unu'pe"] = "Unu'pe",
["Moa'ki Harbor"] = "Port-Moa'ki",
["Kamagua"] = "Kamagua",
["Westguard Keep"] = "Donjon de la Garde de l'Ouest",

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
["War"] = "BaC", -- Warsong Hold
["Ven"] = "Ven", -- Vengeance Landing
["VK"]  = "DjB", -- Valiance Keep
["VG"]  = "Val", -- Valgarde
["Unu"] = "Unu", -- Unu'pe
["Moa"] = "Moa", -- Moa'ki Harbor
["Kam"] = "Kam", -- Kamagua
["WGK"] = "DjG", -- Westguard Keep

} end)
