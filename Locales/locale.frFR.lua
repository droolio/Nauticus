
-- French localisation by thelys
local L = LibStub("AceLocale-3.0"):NewLocale("Nauticus", "frFR")
if not L then return; end

-- addon description
L["Tracks the precise arrival & departure schedules of boats and Zeppelins around Azeroth and displays them on the Mini-Map and World Map in real-time."] = "Permet de suivre les arrivées et départs des bateaux et zeppelins sur Azeroth et de les afficher en temps réel sur la carte du monde et la minicarte."

-- slash commands (no spaces!)
L["icons"] = "icons"
L["minishow"] = "minishow"
L["worldshow"] = "worldshow"
L["minisize"] = "minisize"
L["worldsize"] = "worldsize"
L["faction"] = "faction"
L["minibutton"] = "minibutton"
L["autoselect"] = "autoselect"
L["filter"] = "filter"
L["alarm"] = "alarm"

-- options
L["Options"] = "Options"
L["General Settings"] = "Paramètres généraux"
L["Map Icons"] = "Icônes de la carte"
L["Options for displaying transports as icons on the Mini-Map and World Map."] = "Afficher les transports en tant qu'icones sur la carte et la minicarte"
L["Show on Mini-Map"] = "Afficher sur la minicarte"
L["Toggle display of icons on the Mini-Map."] = "Afficher les icones sur la minicarte"
L["Show on World Map"] = "Afficher sur la carte du monde"
L["Toggle display of icons on the World Map."] = "Afficher les icones sur la carte du monde"
L["Mini-Map icon size"] = "Taille des icones de minicarte"
L["Change the size of the Mini-Map icons."] = "Changer la taille des icones de la minicarte."
L["World Map icon size"] = "Taille des icones de carte du monde"
L["Change the size of the World Map icons."] = "Changer la taille des icones de la carte du monde."
L["Faction only"] = "Seulement votre faction"
L["Hide transports of opposite faction from the map, showing only neutral and those of your faction."] = "Ne montrer que les transports neutres et ceux de votre faction"
L["Auto select transport"] = "Sélection auto du transport"
L["Automatically select nearest transport when standing at platform."] = "Sélection auto du transport le plus proche quand on est sur un quai."
L["Crew chat filter"] = "Filtrer les discussions de l'équipage"
L["Toggle the filter for removing ship crew talk and Zeppelin Master yells from the chat window."] = "Filtrer les cris et discussions de l'équipage." -- re do?
L["Alarm delay"] = "Délai d'alarme"
L["Change the alarm delay (in seconds)."] = "Changer le délai d'alarme (en secondes)."
L["Mini-Map button"] = "Bouton de la minicarte"
L["Toggle the Mini-Map button."] = "Afficher le bouton de la minicarte"

-- miscellaneous
L["Arrival"] = "Arrivée"
L["Departure"] = "Départ"
L["Select Transport"] = "Transport"
L["Select None"] = "Aucun"
L["No Transport Selected"] = "Aucun Transport"
L["Not Available"] = "Non Disponible"
L["N/A"] = "ND" -- abbreviation for Not Available
L["Nauticus Options"] = "Options de Nauticus"
L["Alarm is now: "] = "L'alarme est maintenant"
L["ON"] = "ACTIVÉE"
L["OFF"] = "DÉSACTIVÉE"

L["List friendly faction only"] = "Ne montrer que les transports de votre faction" -- re do?
L["Shows only neutral transports and those of your faction."] = "Ne montrer que les transports neutres et ceux de votre faction." -- re do?
L["List relevant to current zone only"] = "Ne montrer que les transports de la zone courante" -- re do?
L["Shows only transports relevant to your current zone."] = "Ne montrer que les transports de la zone courante." -- re do?
L["Hint: Click to cycle transport. Alt-Click to set up alarm"] = "Astuce: Cliquez pour changer de transport. Alt-Clic pour créer une alarme"
L["New version available! Visit www.drool.me.uk/naut"] = "Nouvelle version disponible ! Visitez www.drool.me.uk/naut"

-- list of ship crew npc's to filter from chat (*must* strictly match the in-game name)
-- org2uc:
L["Frezza"] = "Frezza"
L["Zapetta"] = "Zapetta"
L["Sky-Captain Cloudkicker"] = "Capitaine des cieux Bottenuage"
L["Chief Officer Coppernut"] = "Second Cuivrécrou"
L["Navigator Fairweather"] = "Navigateur Beautemps"
-- uc2gg:
L["Hin Denburg"] = "Hin Denburg"
L["Navigator Hatch"] = "Navigateur Écoutille"
L["Chief Officer Hammerflange"] = "Second Collemarteau"
L["Sky-Captain Cableclamp"] = "Capitaine des cieux Serrecable"
-- org2gg:
L["Snurk Bucksquick"] = "Snurk Frikfacile"
-- mh2ther:
L["Captain \"Stash\" Torgoley"] = "Capitaine Torgoley \"Le Magot\""
L["First Mate Kowalski"] = "Second Kowalski"
L["Navigator Mehran"] = "Navigateur Mehran"
-- uc2ven
L["Meefi Farthrottle"] = "Meefi Mélégaz"
L["Drenk Spannerspark"] = "Drenk Klétincelle"
-- war2org
L["Greeb Ramrocket"] = "Greeb Fusebélier"
L["Nargo Screwbore"] = "Nargo Creusevisse"
-- wg2wg:
L["Harrowmeiser"] = "Harrowmeiser"
-- tb2org:
L["Krendle Bigpockets"] = true -- to do
L["Zelli Hotnozzle"] = true -- to do
L["Sky-Captain \"Dusty\" Blastnut"] = true -- to do
L["Watcher Tolwe"] = true -- to do

-- ship names
L["The Thundercaller"] = "Le Mande-tonnerre"
L["The Iron Eagle"] = "L'Aigle de fer"
L["The Purple Princess"] = "La Princesse violette"
L["The Maiden's Fancy"] = "Le Caprice de la vierge"
L["The Bravery"] = "La Bravoure"
L["The Lady Mehley"] = "La Dame Mehley"
L["The Moonspray"] = "L'Écume de lune"
L["Feathermoon Ferry"] = "Bac de Pennelune"
L["Elune's Blessing"] = "La Bénédiction d'Elune"
L["The Mighty Wind"] = "Le Grand vent"
L["Cloudkisser"] = "Le Frôle-nuage"
L["Walker of Waves"] = "Marcheuse des flots"
L["Green Island"] = "L'Île verte"
L["The Kraken"] = "Le Kraken"
L["Northspear"] = "La Lance du Nord"
L["Captured Zeppelin"] = "Zeppelin capturé"
L["The Zephyr"] = true -- to do

-- zones (*must* strictly match the in-game name)
L["Orgrimmar"] = "Orgrimmar"
L["Undercity"] = "Fossoyeuse"
L["The Exodar"] = "L'Exodar"
L["Stormwind City"] = "Hurlevent"
L["Thunder Bluff"] = true -- to do

L["Durotar"] = "Durotar"
L["Tirisfal Glades"] = "Clairières de Tirisfal"
L["Northern Stranglethorn"] = true -- to do
L["The Cape of Stranglethorn"] = true -- to do
L["Northern Barrens"] = true -- to do
L["Southern Barrens"] = true -- to do
L["Wetlands"] = "Les Paluns"
L["Dustwallow Marsh"] = "Marécage d'Âprefange"
L["Teldrassil"] = "Teldrassil"
L["Azuremyst Isle"] = "Ile de Brume-azur"
L["Elwynn Forest"] = true -- to do
L["Westfall"] = "Marche de l'Ouest"
L["Borean Tundra"] = "Toundra Boréenne"
L["Howling Fjord"] = "Fjord Hurlant"
L["Dragonblight"] = "Désolation des dragons"
L["Mulgore"] = true -- to do

L["The Veiled Sea"] = "La Mer voilée"
L["Twisting Nether"] = "Le Néant distordu"
L["The Frozen Sea"] = "La mer Gelée"
L["The Great Sea"] = true -- to do

-- subzones
L["Grom'gol"] = "Grom'gol"
L["Booty Bay"] = "Baie-du-Butin"
L["Ratchet"] = "Cabestan"
L["Menethil Harbor"] = "Port de Menethil"
L["Theramore"] = "Theramore"
L["Rut'Theran Village"] = "Rut'Theran"
L["Warsong Hold"] = "Bastion Chanteguerre"
L["Vengeance Landing"] = "Accostage de la Vengeance"
L["Valiance Keep"] = "Donjon de la Bravoure"
L["Valgarde"] = "Valgarde"
L["Unu'pe"] = "Unu'pe"
L["Moa'ki Harbor"] = "Port-Moa'ki"
L["Kamagua"] = "Kamagua"
L["Westguard Keep"] = "Donjon de la Garde de l'Ouest"

-- abbreviations
L["Org"] = "Org" -- Orgrimmar
L["UC"]  = "Fos" -- Undercity
L["Exo"] = "Exo" -- The Exodar
L["SC"]  = "Hur" -- Stormwind City
L["TB"]  = true  -- to do; Thunder Bluff

L["GG"]  = "GrG" -- Grom'gol
L["BB"]  = "BdB" -- Booty Bay
L["Rat"] = "Cab" -- Ratchet
L["MH"]  = "PdM" -- Menethil Harbor
L["Th"]  = "The" -- Theramore
L["RTV"] = "Rut" -- Rut'Theran Village
L["War"] = "BaC" -- Warsong Hold
L["Ven"] = "Ven" -- Vengeance Landing
L["VK"]  = "DjB" -- Valiance Keep
L["VG"]  = "Val" -- Valgarde
L["Unu"] = "Unu" -- Unu'pe
L["Moa"] = "Moa" -- Moa'ki Harbor
L["Kam"] = "Kam" -- Kamagua
L["WGK"] = "DjG" -- Westguard Keep
