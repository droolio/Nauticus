
-- French localisation by thelys
local L = LibStub("AceLocale-3.0"):NewLocale("Nauticus", "frFR")
if not L then return; end

-- options
L["Options"] = "Options"
L["Icons"] = "Icones"
L["Icon options."] = "Options d'icones."
L["Show icons"] = "Montrer les icones"
L["Toggle on/off map icons."] = "Icones de carte on/off."
L["Mini-Map icon size"] = "Taille des icones de Mini-carte"
L["Change the size of the Mini-Map icons."] = "Changer la taille des icones de Mini-carte."
L["World Map icon size"] = "Taille des icones de Carte du monde"
L["Change the size of the World Map icons."] = "Changer la taille des icones de Carte du monde."
L["Auto select transport"] = "Sélection auto du transport"
L["Automatically select nearest transport when standing at platform."] = "Sélection auto du transport le plus proche quand on est sur un quai."
L["Crew chat filter"] = "Filtrer les discussions de l'équipage"
L["Toggle on/off chat filter for yelling crew spam."] = "Filtrer les cris de l'équipage."
L["Alarm delay"] = "Délai d'alarme"
L["Change the alarm delay (in seconds)."] = "Changer le délai d'alarme (en secondes)."

-- miscellaneous
L["Arrival"] = "Arrivée"
L["Departure"] = "Départ"
L["Arr"] = "Arr" -- abbreviation for Arrival
L["Dep"] = "Dép" -- abbreviation for Departure
L["Select Transport"] = "Transport"
L["Select None"] = "Aucun"
L["No Transport Selected"] = "Aucun Transport"
L["Not Available"] = "Non Disponible"
L["N/A"] = "ND" -- abbreviation for Not Available
L["Nauticus Options"] = "Options de Nauticus"
L["Alarm is now: "] = true -- to do
L["ON"] = true -- to do
L["OFF"] = true -- to do
L["Daily: "] = "Journ.: "

L["Show only transports for your faction"] = "Ne montrer que les transports de votre faction"
L["Shows only neutral and transports specific to your faction."] = "Ne montrer que les transports neutres et ceux de votre faction."
L["Show only transports in your current zone"] = "Ne montrer que les transports de la zone courrante"
L["Shows only transports in your current zone."] = "Ne montrer que les transports de la zone courrante."
L["Hint: Click to cycle transport. Alt-Click to set up alarm"] = "Astuce: Cliquez pour changer de transport. Alt-Clic pour créer une alarme"
L["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."] = "Nouvelle version de Nauticus disponible ! Visitez http://drool.me.uk/naut."
L["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."] = "Vous utilisez une version ancienne de Nauticus depuis plus de 10 jours, les communications externes sont désactivées."
L["Thank you for upgrading."] = "Merci de mettre à jour."

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

-- zones (*must* strictly match the in-game name)
L["Orgrimmar"] = "Orgrimmar"
L["Undercity"] = "Fossoyeuse"
L["The Exodar"] = "L'Exodar"
L["Stormwind City"] = "Hurlevent"

L["Durotar"] = "Durotar"
L["Tirisfal Glades"] = "Clairières de Tirisfal"
L["Stranglethorn Vale"] = "Vallée de Strangleronce"
L["The Barrens"] = "Les Tarides"
L["Wetlands"] = "Les Paluns"
L["Darkshore"] = "Sombrivage"
L["Dustwallow Marsh"] = "Marécage d'Âprefange"
L["Teldrassil"] = "Teldrassil"
L["Azuremyst Isle"] = "Ile de Brume-azur"
L["Feralas"] = "Féralas"
L["Westfall"] = "Marche de l'Ouest"
L["Borean Tundra"] = "Toundra Boréenne"
L["Howling Fjord"] = "Fjord Hurlant"
L["Dragonblight"] = "Désolation des dragons"

L["The Veiled Sea"] = "La Mer voilée"
L["Twisting Nether"] = "Le Néant distordu"
L["The Frozen Sea"] = "La mer Gelée"

-- subzones
L["Grom'gol"] = "Grom'gol"
L["Booty Bay"] = "Baie-du-Butin"
L["Ratchet"] = "Cabestan"
L["Menethil Harbor"] = "Port de Menethil"
L["Auberdine"] = "Auberdine"
L["Theramore"] = "Theramore"
L["Rut'Theran Village"] = "Rut'Theran"
L["Sardor Isle"] = "Ile de Sardor"
L["Feathermoon"] = "Pennelune"
L["Forgotten Coast"] = "Côte oubliée"
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

L["GG"]  = "GrG" -- Grom'gol
L["BB"]  = "BdB" -- Booty Bay
L["Rat"] = "Cab" -- Ratchet
L["MH"]  = "PdM" -- Menethil Harbor
L["Aub"] = "Aub" -- Auberdine
L["Th"]  = "The" -- Theramore
L["RTV"] = "Rut" -- Rut'Theran Village
L["FMS"] = "Pen" -- Feathermoon
L["Fer"] = "Fer" -- Feralas
L["War"] = "BaC" -- Warsong Hold
L["Ven"] = "Ven" -- Vengeance Landing
L["VK"]  = "DjB" -- Valiance Keep
L["VG"]  = "Val" -- Valgarde
L["Unu"] = "Unu" -- Unu'pe
L["Moa"] = "Moa" -- Moa'ki Harbor
L["Kam"] = "Kam" -- Kamagua
L["WGK"] = "DjG" -- Westguard Keep
