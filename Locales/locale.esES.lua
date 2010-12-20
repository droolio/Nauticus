
-- Spanish localisation by StiviS
local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("Nauticus", "esES") or AceLocale:NewLocale("Nauticus", "esMX")
if not L then return; end

-- addon description
L["Tracks the precise arrival & departure schedules of boats and Zeppelins around Azeroth and displays them on the Mini-Map and World Map in real-time."] = "Sigue con precisión los horarios de llegada y salida de barcos y zepelines en todo Azeroth y los muestra en el Mini-Mapa y Mapa del Mundo en tiempo real."

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
L["General Settings"] = "Opciones Generales"
L["Map Icons"] = "Iconos del mapa"
L["Options for displaying transports as icons on the Mini-Map and World Map."] = "Opciones de visualización de iconos de transporte en el Mini-Mapa y el Mapa del Mundo."
L["Show on Mini-Map"] = "Mostrar en Mini-Mapa"
L["Toggle display of icons on the Mini-Map."] = "Activar/Desactivar los iconos en el Mini-Mapa."
L["Show on World Map"] = "Mostrar en Mapa del Mundo"
L["Toggle display of icons on the World Map."] = "Activar/Desactivar los iconos en el Mapa del Mundo"
L["Mini-Map icon size"] = "Tamaño del icono del mini-mapa"
L["Change the size of the Mini-Map icons."] = "Cambia el tamaño de los iconos del mini-mapa."
L["World Map icon size"] = "Tamaño de icono del Mapa del Mundo"
L["Change the size of the World Map icons."] = "Cambia el tamaño de los iconos del mapa del mundo."
L["Faction only"] = "Solo facción"
L["Hide transports of opposite faction from the map, showing only neutral and those of your faction."] = "Ocultar transportes de la facción contraria en el mapa, mostrar solo neutrales y los de tu facción."
L["Auto select transport"] = "Auto seleccionar transporte"
L["Automatically select nearest transport when standing at platform."] = "Seleccionar automáticamente el transporte más cercano cuando estés en una plataforma de embarque."
L["Crew chat filter"] = true -- to do
L["Toggle the filter for removing ship crew talk and Zeppelin Master yells from the chat window."] = "Activar/Desactivar el filtro para eliminar los mensajes del chat que dicen los tripulantes y el capitán del transporte."
L["Alarm delay"] = "Retardo de alarma"
L["Change the alarm delay (in seconds)."] = "Cambia el retardo de la alarma (en segundos)."
L["Mini-Map button"] = "Botón del mini-mapa"
L["Toggle the Mini-Map button."] = "Activar/Desactivar el botón del Mini-Mapa."

-- miscellaneous
L["Arrival"] = "Llegada"
L["Departure"] = "Salida"
L["Select Transport"] = "Seleccionar Transporte"
L["Select None"] = "Seleccionar Ninguno"
L["No Transport Selected"] = "Ningun Transporte Seleccionado"
L["Not Available"] = "No Disponible"
L["N/A"] = "N/D" -- abbreviation for Not Available
L["Nauticus Options"] = "Opciones de Nauticus"
L["Alarm is now: "] = "Alarma es ahora:" -- check?
L["ON"] = "Encendido"
L["OFF"] = "Apagado"

L["List friendly faction only"] = "Mostrar sólo transportes para tu facción" -- re do?
L["Shows only neutral transports and those of your faction."] = "Muestra sólo neutrales y transportes específicos para tu facción." -- re do?
L["List relevant to current zone only"] = "Mostrar sólo transportes en tu zona actual " -- re do?
L["Shows only transports relevant to your current zone."] = "Muestra sólo transportes en tu zona actual." -- re do?
L["Hint: Click to cycle transport. Alt-Click to set up alarm"] = "Consejo: Click para rotar transporte. Alt-Click para crear alarma"
L["New version available! Visit www.drool.me.uk/naut"] = true

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
-- tb2org:
L["Krendle Bigpockets"] = true -- to do
L["Zelli Hotnozzle"] = true -- to do
L["Sky-Captain \"Dusty\" Blastnut"] = true -- to do
L["Watcher Tolwe"] = true -- to do

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
L["The Zephyr"] = true -- to do

-- zones (*must* strictly match the in-game name)
L["Orgrimmar"] = "Orgrimmar"
L["Undercity"] = "Entrañas"
L["The Exodar"] = "El Exodar"
L["Stormwind City"] = "Ciudad de Ventormenta"
L["Thunder Bluff"] = true -- to do

L["Durotar"] = "Durotar"
L["Tirisfal Glades"] = "Claros de Tirisfal"
L["Northern Stranglethorn"] = true -- to do
L["The Cape of Stranglethorn"] = true -- to do
L["Northern Barrens"] = true -- to do
L["Southern Barrens"] = true -- to do
L["Wetlands"] = "Los Humedales"
L["Dustwallow Marsh"] = "Marjal Revolcafango"
L["Teldrassil"] = "Teldrassil"
L["Azuremyst Isle"] = "Isla Bruma Azur"
L["Elwynn Forest"] = true -- to do
L["Westfall"] = "Páramos de Poniente"
L["Borean Tundra"] = "Tundra Boreal"
L["Howling Fjord"] = "Fiordo Aquilonal"
L["Dragonblight"] = "Cementerio de Dragones"
L["Mulgore"] = true -- to do

L["The Veiled Sea"] = "Mar de la Bruma"
L["Twisting Nether"] = "El Vacío Abisal"
L["The Frozen Sea"] = "El Mar Gélido"
L["The Great Sea"] = true -- to do

-- subzones
L["Grom'gol"] = "Grom'Gol"
L["Booty Bay"] = "Bahía del Botín"
L["Ratchet"] = "Trinquete"
L["Menethil Harbor"] = "Refugio de Marshal"
L["Theramore"] = "Theramore"
L["Rut'Theran Village"] = "Aldea Rut'Theran"
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
L["TB"]  = true -- to do; Thunder Bluff

L["GG"]  = true -- Grom'gol
L["BB"]  = true -- Booty Bay
L["Rat"] = true -- Ratchet
L["MH"]  = true -- Menethil Harbor
L["Th"]  = true -- Theramore
L["RTV"] = true -- Rut'Theran Village
L["War"] = true -- Warsong Hold
L["Ven"] = true -- Vengeance Landing
L["VK"]  = true -- Valiance Keep
L["VG"]  = true -- Valgarde
L["Unu"] = true -- Unu'pe
L["Moa"] = true -- Moa'ki Harbor
L["Kam"] = true -- Kamagua
L["WGK"] = true -- Westguard Keep
