﻿
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

["Show GUI when zone change contains a transport"] = "Mostrar GUI cuando cambio de zona contiene un transporte",
["Show only transports for your faction"] = "Mostrar sólo transportes para su facción",
["Shows only neutral and transports specific to your faction."] = "Muestra sólo neutrales y transportes específicos para su facción.",
["Show only transports in your current zone"] = "Mostrar sólo transportes en su zona actual ",
["Shows only transports in your current zone."] = "Muestra sólo transportes en su zona actual.",
["Click to cycle transport.|nAlt-Click to set up alarm"] = "Click para rotar transporte.|nAlt-Click para crear alarma",
["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."] = "¡Hay una nueva versión de Nauticus disponible! Por favor, visite http://drool.me.uk/naut.",
["Type /nauticus or /naut gui show to show again."] = "Teclea /nauticus o /naut para mostrar GUI.",
["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."] = "Usted ha estado utilizando una versión antigua de Nauticus por más de 10 días, las comunicaciones salientes serán ahora deshabilitadas.",
["Thank you for upgrading."] = "Gracias por actualizar.",

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

["The Veiled Sea"] = "Mar de la Bruma",
["Twisting Nether"] = "El Vacío Abisal",

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
["SC"]	= "SC",		-- Stormwind City

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
