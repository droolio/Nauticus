
-- Spanish localisation by StiviS
local L = LibStub("AceLocale-3.0"):NewLocale("Nauticus", "esES", true)
if not L then return; end

-- options
L["Options"] = "Opciones"
-- TO DO:
L["Icons"] = "Icons"
L["Icon options."] = "Icon options."
L["Show icons"] = "Show icons"
L["Toggle on/off map icons."] = "Toggle on/off map icons."
L["Mini-Map icon size"] = "Mini-Map icon size"
L["Change the size of the Mini-Map icons."] = "Change the size of the Mini-Map icons."
L["World Map icon size"] = "World Map icon size"
L["Change the size of the World Map icons."] = "Change the size of the World Map icons."
L["Auto select transport"] = "Auto select transport"
L["Automatically select nearest transport when standing at platform."] = "Automatically select nearest transport when standing at platform."
L["Crew chat filter"] = "Crew chat filter"
L["Toggle on/off chat filter for yelling crew spam."] = "Toggle on/off chat filter for yelling crew spam."
L["Alarm delay"] = "Alarm delay"
L["Change the alarm delay (in seconds)."] = "Change the alarm delay (in seconds)."

-- miscellaneous
L["Arrival"] = "Llegada"
L["Departure"] = "Salida"
L["Arr"] = "Lle" -- abbreviation for Arrival
L["Dep"] = "Sal" -- abbreviation for Departure
L["Select Transport"] = "Seleccionar Transporte"
L["Select None"] = "Seleccionar Ninguno"
L["No Transport Selected"] = "Ningun Transporte Seleccionado"
L["Not Available"] = "No Disponible"
L["N/A"] = "N/D" -- abbreviation for Not Available
L["Nauticus Options"] = "Opciones de Nauticus"
L["Alarm is now: "] = "Alarm is now: "
L["ON"] = "ON"
L["OFF"] = "OFF"
L["Daily: "] = "Daily: "

L["Show only transports for your faction"] = "Mostrar sólo transportes para su facción"
L["Shows only neutral and transports specific to your faction."] = "Muestra sólo neutrales y transportes específicos para su facción."
L["Show only transports in your current zone"] = "Mostrar sólo transportes en su zona actual "
L["Shows only transports in your current zone."] = "Muestra sólo transportes en su zona actual."
L["Hint: Click to cycle transport. Alt-Click to set up alarm"] = "Consejo: Click para rotar transporte. Alt-Click para crear alarma"
L["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."] = "¡Hay una nueva versión de Nauticus disponible! Por favor, visite http://drool.me.uk/naut."
L["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."] = "Usted ha estado utilizando una versión antigua de Nauticus por más de 10 días, las comunicaciones salientes serán ahora deshabilitadas."
L["Thank you for upgrading."] = "Gracias por actualizar."

-- list of ship crew npc's to filter from chat (*must* strictly match the in-game name)
-- org2uc:
L["Frezza"] = "Frezza"
L["Zapetta"] = "Zapetta"
L["Sky-Captain Cloudkicker"] = "Capitán del cielo Pateanubes"
L["Chief Officer Coppernut"] = "Oficial jefe Tornillos de Cobre"
L["Navigator Fairweather"] = "Navegante Buentiempo"
-- uc2gg:
L["Hin Denburg"] = "Hin Denburg"
L["Navigator Hatch"] = "Navegante Escotilla"
L["Chief Officer Hammerflange"] = "Oficial jefe Ala Martillo"
L["Sky-Captain Cableclamp"] = "Capitana del cielo Pinza Cable"
-- org2gg:
L["Snurk Bucksquick"] = "Esnur Ciervoveloz"
-- mh2ther:
L["Captain \"Stash\" Torgoley"] = "Capitán \"Alijo\" Torgoley"
L["First Mate Kowalski"] = "Contramaestre Kowalski"
L["Navigator Mehran"] = "Navegante Mehran"
-- uc2ven
L["Meefi Farthrottle"] = "Meefi Acelerador"
L["Drenk Spannerspark"] = "Drenk Llavechispa"
-- war2org
L["Greeb Ramrocket"] = "Greeb Carnerocohete"
L["Nargo Screwbore"] = "Nargo Pinchazo"
-- wg2wg:
L["Harrowmeiser"] = "Harrowmeiser"

-- ship names
L["The Thundercaller"] = "El Invocador del Trueno"
L["The Iron Eagle"] = "El Águila de Hierro"
L["The Purple Princess"] = "La Princesa Púrpura"
L["The Maiden's Fancy"] = "La fantasía de la doncella"
L["The Bravery"] = "El Valentía"
L["The Lady Mehley"] = "El Lady Mehley"
L["The Moonspray"] = "Espuma de la Luna"
L["Feathermoon Ferry"] = "Ferry Plumaluna"
L["Elune's Blessing"] = "La bendición de Elune"
L["The Mighty Wind"] = "El viento poderoso"
L["Cloudkisser"] = "El Besanubes"
L["Walker of Waves"] = "Errante de olas"
L["Green Island"] = "Isla verde"
L["The Kraken"] = "Los kraken"
L["Northspear"] = "Picanorte"
L["Captured Zeppelin"] = "Captured Zeppelin" -- to do

-- zones (*must* strictly match the in-game name)
L["Orgrimmar"] = "Orgrimmar"
L["Undercity"] = "Entrañas"
L["The Exodar"] = "El Exodar"
L["Stormwind City"] = "Ciudad de Ventormenta"

L["Durotar"] = "Durotar"
L["Tirisfal Glades"] = "Claros de Tirisfal"
L["Stranglethorn Vale"] = "Vega de Tuercespina"
L["The Barrens"] = "Los Baldíos"
L["Wetlands"] = "Los Humedales"
L["Darkshore"] = "Costa Oscura"
L["Dustwallow Marsh"] = "Marjal Revolcafango"
L["Teldrassil"] = "Teldrassil"
L["Azuremyst Isle"] = "Isla Bruma Azur"
L["Feralas"] = "Feralas"
L["Westfall"] = "Páramos de Poniente"
L["Borean Tundra"] = "Tundra Boreal"
L["Howling Fjord"] = "Fiordo Aquilonal"
L["Dragonblight"] = "Cementerio de Dragones"

L["The Veiled Sea"] = "Mar de la Bruma"
L["Twisting Nether"] = "El Vacío Abisal"
L["The Frozen Sea"] = "El Mar Gélido"

-- subzones
L["Grom'gol"] = "Grom'gol"
L["Booty Bay"] = "Booty Bay"
L["Ratchet"] = "Ratchet"
L["Menethil Harbor"] = "Menethil Harbor"
L["Auberdine"] = "Auberdine"
L["Theramore"] = "Theramore"
L["Rut'Theran Village"] = "Rut'Theran Village"
L["Sardor Isle"] = "Sardor Isle"
L["Feathermoon"] = "Feathermoon"
L["Forgotten Coast"] = "Forgotten Coast"
L["Warsong Hold"] = "Warsong Hold"
L["Vengeance Landing"] = "Vengeance Landing"
L["Valiance Keep"] = "Valiance Keep"
L["Valgarde"] = "Valgarde"
L["Unu'pe"] = "Unu'pe"
L["Moa'ki Harbor"] = "Moa'ki Harbor"
L["Kamagua"] = "Kamagua"
L["Westguard Keep"] = "Westguard Keep"

-- abbreviations
L["Org"] = "Org" -- Orgrimmar
L["UC"]  = "UC"  -- Undercity
L["Exo"] = "Exo" -- The Exodar
L["SC"]  = "SC"  -- Stormwind City

L["GG"]  = "GG"  -- Grom'gol
L["BB"]  = "BB"  -- Booty Bay
L["Rat"] = "Rat" -- Ratchet
L["MH"]  = "MH"  -- Menethil Harbor
L["Aub"] = "Aub" -- Auberdine
L["Th"]  = "Th"  -- Theramore
L["RTV"] = "RTV" -- Rut'Theran Village
L["FMS"] = "FMS" -- Feathermoon
L["Fer"] = "Fer" -- Feralas
L["War"] = "War" -- Warsong Hold
L["Ven"] = "Ven" -- Vengeance Landing
L["VK"]  = "VK"  -- Valiance Keep
L["VG"]  = "VG"  -- Valgarde
L["Unu"] = "Unu" -- Unu'pe
L["Moa"] = "Moa" -- Moa'ki Harbor
L["Kam"] = "Kam" -- Kamagua
L["WGK"] = "WGK" -- Westguard Keep
