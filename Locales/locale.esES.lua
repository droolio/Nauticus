
local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

L:RegisterTranslations("esES", function() return {

-- general
["Save"] = "Guardar",
["Close"] = "Cerrar",
["Minimise"] = "Minimizar",
["Maximise"] = "Maximizar",
["Options"] = "Opciones",

-- miscellaneous
["Arrival"] = "Llegada",
["Departure"] = "Salida",
["Arr"] = "Lle", -- abbreviation for Arrival
["Dep"] = "Sal", -- abbreviation for Departure
["Select Transport"] = "Seleccionar Transporte",
["Select None"] = "Seleccionar Ninguno", -- to do
["No Transport Selected"] = "Ningun Transporte Seleccionado",
["Not Available"] = "No Disponible",
["N/A"] = "N/D", -- abbreviation for Not Available
["Nauticus Options"] = "Opciones de Nauticus",
["Daily: "] = "Daily: ",

["Show GUI when zone change contains a transport"] =
	"Mostrar GUI cuando cambio de zona contiene un transporte",
["Show only transports for your faction"] =
	"Mostrar sólo transportes para su facción",
["Shows only neutral and transports specific to your faction."] =
	"Muestra sólo neutrales y transportes específicos para su facción.",
["Show only transports in your current zone"] =
	"Mostrar sólo transportes en su zona actual ",
["Shows only transports in your current zone."] =
	"Muestra sólo transportes en su zona actual.",
["Hint: Click to cycle transport. Alt-Click to set up alarm"] =
	"Consejo: Click para rotar transporte. Alt-Click para crear alarma",
["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."] =
	"¡Hay una nueva versión de Nauticus disponible! Por favor, visite http://drool.me.uk/naut.",
["Type /nauticus or /naut gui show to show again."] =
	"Teclea /nauticus o /naut para mostrar GUI.",
["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."] =
	"Usted ha estado utilizando una versión antigua de Nauticus por más de 10 días, las comunicaciones salientes serán ahora deshabilitadas.",
["Thank you for upgrading."] =
	"Gracias por actualizar.",

-- zones
["Orgrimmar"] = "Orgrimmar",
["Undercity"] = "Entrañas",
["The Exodar"] = "El Exodar",
["Stormwind City"] = "Stormwind City",

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
["Westfall"] = "Westfall",
["Borean Tundra"] = "Borean Tundra",
["Howling Fjord"] = "Howling Fjord",
["Dragonblight"] = "Dragonblight",

["The Veiled Sea"] = "Mar de la Bruma",
["Twisting Nether"] = "El Vacío Abisal",
["The Frozen Sea"] = "The Frozen Sea",

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
