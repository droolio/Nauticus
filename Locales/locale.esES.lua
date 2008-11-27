
local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

-- Spanish localisation by StiviS
L:RegisterTranslations("esES", function() return {

-- options
["Options"] = "Opciones",
-- TO DO:
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
["Arrival"] = "Llegada",
["Departure"] = "Salida",
["Arr"] = "Lle", -- abbreviation for Arrival
["Dep"] = "Sal", -- abbreviation for Departure
["Select Transport"] = "Seleccionar Transporte",
["Select None"] = "Seleccionar Ninguno",
["No Transport Selected"] = "Ningun Transporte Seleccionado",
["Not Available"] = "No Disponible",
["N/A"] = "N/D", -- abbreviation for Not Available
["Nauticus Options"] = "Opciones de Nauticus",
["Alarm is now: "] = "Alarm is now: ",
["ON"] = "ON",
["OFF"] = "OFF",
["Daily: "] = "Daily: ",

["Show only transports for your faction"] = "Mostrar sólo transportes para su facción",
["Shows only neutral and transports specific to your faction."] = "Muestra sólo neutrales y transportes específicos para su facción.",
["Show only transports in your current zone"] = "Mostrar sólo transportes en su zona actual ",
["Shows only transports in your current zone."] = "Muestra sólo transportes en su zona actual.",
["Hint: Click to cycle transport. Alt-Click to set up alarm"] = "Consejo: Click para rotar transporte. Alt-Click para crear alarma",
["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."] = "¡Hay una nueva versión de Nauticus disponible! Por favor, visite http://drool.me.uk/naut.",
["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."] = "Usted ha estado utilizando una versión antigua de Nauticus por más de 10 días, las comunicaciones salientes serán ahora deshabilitadas.",
["Thank you for upgrading."] = "Gracias por actualizar.",

-- list of ship crew npc's to filter from chat (*must* strictly match the in-game name)
-- org2uc:
["Frezza"] = "Frezza",
["Zapetta"] = "Zapetta",
["Sky-Captain Cloudkicker"] = "Capitán del cielo Pateanubes",
["Chief Officer Coppernut"] = "Oficial jefe Tornillos de Cobre",
["Navigator Fairweather"] = "Navegante Buentiempo",
-- uc2gg:
["Hin Denburg"] = "Hin Denburg",
["Navigator Hatch"] = "Navegante Escotilla",
["Chief Officer Hammerflange"] = "Oficial jefe Ala Martillo",
["Sky-Captain Cableclamp"] = "Capitana del cielo Pinza Cable",
-- org2gg:
["Snurk Bucksquick"] = "Esnur Ciervoveloz",
-- mh2ther:
["Captain \"Stash\" Torgoley"] = "Capitán \"Alijo\" Torgoley",
["First Mate Kowalski"] = "Contramaestre Kowalski",
["Navigator Mehran"] = "Navegante Mehran",
-- uc2ven
["Meefi Farthrottle"] = "Meefi Acelerador",
["Drenk Spannerspark"] = "Drenk Llavechispa",
-- war2org
["Greeb Ramrocket"] = "Greeb Carnerocohete",
["Nargo Screwbore"] = "Nargo Pinchazo",
-- wg2wg:
["Harrowmeiser"] = "Harrowmeiser",

-- ship names
["The Thundercaller"] = "El Invocador del Trueno",
["The Iron Eagle"] = "El Águila de Hierro",
["The Purple Princess"] = "La Princesa Púrpura",
["The Maiden's Fancy"] = "La fantasía de la doncella",
["The Bravery"] = "El Valentía",
["The Lady Mehley"] = "El Lady Mehley",
["The Moonspray"] = "Espuma de la Luna",
["Feathermoon Ferry"] = "Ferry Plumaluna",
["Elune's Blessing"] = "La bendición de Elune",
["The Mighty Wind"] = "El viento poderoso",
["Cloudkisser"] = "El Besanubes",
["Walker of Waves"] = "Errante de olas",
["Green Island"] = "Isla verde",
["The Kraken"] = "Los kraken",
["Northspear"] = "Picanorte",
["Captured Zeppelin"] = "Captured Zeppelin", -- to do

-- zones (*must* strictly match the in-game name)
["Orgrimmar"] = "Orgrimmar",
["Undercity"] = "Entrañas",
["The Exodar"] = "El Exodar",
["Stormwind City"] = "Ciudad de Ventormenta",

["Durotar"] = "Durotar",
["Tirisfal Glades"] = "Claros de Tirisfal",
["Stranglethorn Vale"] = "Vega de Tuercespina",
["The Barrens"] = "Los Baldíos",
["Wetlands"] = "Los Humedales",
["Darkshore"] = "Costa Oscura",
["Dustwallow Marsh"] = "Marjal Revolcafango",
["Teldrassil"] = "Teldrassil",
["Azuremyst Isle"] = "Isla Bruma Azur",
["Feralas"] = "Feralas",
["Westfall"] = "Páramos de Poniente",
["Borean Tundra"] = "Tundra Boreal",
["Howling Fjord"] = "Fiordo Aquilonal",
["Dragonblight"] = "Cementerio de Dragones",

["The Veiled Sea"] = "Mar de la Bruma",
["Twisting Nether"] = "El Vacío Abisal",
["The Frozen Sea"] = "El Mar Gélido",

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
["UC"]  = "UC",  -- Undercity
["Exo"] = "Exo", -- The Exodar
["SC"]  = "SC",  -- Stormwind City

["GG"]  = "GG",  -- Grom'gol
["BB"]  = "BB",  -- Booty Bay
["Rat"] = "Rat", -- Ratchet
["MH"]  = "MH",  -- Menethil Harbor
["Aub"] = "Aub", -- Auberdine
["Th"]  = "Th",  -- Theramore
["RTV"] = "RTV", -- Rut'Theran Village
["FMS"] = "FMS", -- Feathermoon
["Fer"] = "Fer", -- Feralas
["War"] = "War", -- Warsong Hold
["Ven"] = "Ven", -- Vengeance Landing
["VK"]  = "VK",  -- Valiance Keep
["VG"]  = "VG",  -- Valgarde
["Unu"] = "Unu", -- Unu'pe
["Moa"] = "Moa", -- Moa'ki Harbor
["Kam"] = "Kam", -- Kamagua
["WGK"] = "WGK", -- Westguard Keep

} end)
