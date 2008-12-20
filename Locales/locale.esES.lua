
-- Spanish localisation by StiviS
local L = LibStub("AceLocale-3.0"):NewLocale("Nauticus", "esES")
if not L then return; end

-- addon description
L["Tracks the precise arrival & departure schedules of boats and Zeppelins around Azeroth and displays them on the Mini-Map and World Map in real-time."] = true

-- slash commands (no spaces!)
L["icons"] = true
L["minishow"] = true
L["worldshow"] = true
L["minisize"] = true
L["worldsize"] = true
L["faction"] = true
L["minibutton"] = true
L["autoselect"] = true
L["filter"] = true
L["alarm"] = true

-- options
L["Options"] = "Opciones"
L["General Settings"] = true
L["Map Icons"] = true
L["Options for displaying transports as icons on the Mini-Map and World Map."] = true
L["Show on Mini-Map"] = true
L["Toggle display of icons on the Mini-Map."] = true
L["Show on World Map"] = true
L["Toggle display of icons on the World Map."] = true
L["Mini-Map icon size"] = true
L["Change the size of the Mini-Map icons."] = true
L["World Map icon size"] = true
L["Change the size of the World Map icons."] = true
L["Faction only"] = true
L["Hide transports of opposite faction from the map, showing only neutral and those of your faction."] = true
L["Auto select transport"] = true
L["Automatically select nearest transport when standing at platform."] = true
L["Crew chat filter"] = true
L["Toggle the filter for removing ship crew talk and Zeppelin Master yells from the chat window."] = true
L["Alarm delay"] = true
L["Change the alarm delay (in seconds)."] = true
L["Mini-Map button"] = true -- to do
L["Toggle the Mini-Map button."] = true -- to do

-- miscellaneous
L["Arrival"] = "Llegada"
L["Departure"] = "Salida"
L["Select Transport"] = "Seleccionar Transporte"
L["Select None"] = "Seleccionar Ninguno"
L["No Transport Selected"] = "Ningun Transporte Seleccionado"
L["Not Available"] = "No Disponible"
L["N/A"] = "N/D" -- abbreviation for Not Available
L["Nauticus Options"] = "Opciones de Nauticus"
L["Alarm is now: "] = true
L["ON"] = true
L["OFF"] = true
L["Daily: "] = true

L["List friendly faction only"] = "Mostrar sólo transportes para su facción" -- re do?
L["Shows only neutral transports and those of your faction."] = "Muestra sólo neutrales y transportes específicos para su facción." -- re do?
L["List relevant to current zone only"] = "Mostrar sólo transportes en su zona actual " -- re do?
L["Shows only transports relevant to your current zone."] = "Muestra sólo transportes en su zona actual." -- re do?
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
L["Captured Zeppelin"] = true -- to do

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
L["Grom'gol"] = "Grom'Gol"
L["Booty Bay"] = "Bahía del Botín"
L["Ratchet"] = "Trinquete"
L["Menethil Harbor"] = "Refugio de Marshal"
L["Auberdine"] = "Auberdine"
L["Theramore"] = "Theramore"
L["Rut'Theran Village"] = "Aldea Rut'Theran"
L["Sardor Isle"] = "Isla de Sardor"
L["Feathermoon"] = "Plumaluna"
L["Forgotten Coast"] = "Costa Olvidada"
L["Warsong Hold"] = "Bastión Grito de Guerra"
L["Vengeance Landing"] = "Campo Venganza"
L["Valiance Keep"] = "Fortaleza Denuedo"
L["Valgarde"] = "Valgarde"
L["Unu'pe"] = "Unu'pe"
L["Moa'ki Harbor"] = "Puerto Moa'ki"
L["Kamagua"] = "Kamagua"
L["Westguard Keep"] = "Fortaleza de la Guardia Oeste"

-- abbreviations
L["Org"] = true -- Orgrimmar
L["UC"]  = true -- Undercity
L["Exo"] = true -- The Exodar
L["SC"]  = true -- Stormwind City

L["GG"]  = true -- Grom'gol
L["BB"]  = true -- Booty Bay
L["Rat"] = true -- Ratchet
L["MH"]  = true -- Menethil Harbor
L["Aub"] = true -- Auberdine
L["Th"]  = true -- Theramore
L["RTV"] = true -- Rut'Theran Village
L["FMS"] = true -- Feathermoon
L["Fer"] = true -- Feralas
L["War"] = true -- Warsong Hold
L["Ven"] = true -- Vengeance Landing
L["VK"]  = true -- Valiance Keep
L["VG"]  = true -- Valgarde
L["Unu"] = true -- Unu'pe
L["Moa"] = true -- Moa'ki Harbor
L["Kam"] = true -- Kamagua
L["WGK"] = true -- Westguard Keep
