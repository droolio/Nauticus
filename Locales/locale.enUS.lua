
local L = LibStub("AceLocale-3.0"):NewLocale("Nauticus", "enUS", true)
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
L["Options"] = true
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
L["Mini-Map button"] = true
L["Toggle the Mini-Map button."] = true

-- miscellaneous
L["Arrival"] = true
L["Departure"] = true
L["Select Transport"] = true
L["Select None"] = true
L["No Transport Selected"] = true
L["Not Available"] = true
L["N/A"] = true -- abbreviation for Not Available
L["Nauticus Options"] = true
L["Alarm is now: "] = true
L["ON"] = true
L["OFF"] = true

L["List friendly faction only"] = true
L["Shows only neutral transports and those of your faction."] = true
L["List relevant to current zone only"] = true
L["Shows only transports relevant to your current zone."] = true
L["Hint: Click to cycle transport. Alt-Click to set up alarm"] = true
L["New version available! Visit www.drool.me.uk/naut"] = true

-- list of ship crew npc's to filter from chat (*must* strictly match the in-game name)
-- org2uc:
L["Frezza"] = true
L["Zapetta"] = true
L["Sky-Captain Cloudkicker"] = true
L["Chief Officer Coppernut"] = true
L["Navigator Fairweather"] = true
-- uc2gg:
L["Hin Denburg"] = true
L["Navigator Hatch"] = true
L["Chief Officer Hammerflange"] = true
L["Sky-Captain Cableclamp"] = true
-- org2gg:
L["Snurk Bucksquick"] = true
-- mh2ther:
L["Captain \"Stash\" Torgoley"] = true
L["First Mate Kowalski"] = true
L["Navigator Mehran"] = true
-- uc2ven
L["Meefi Farthrottle"] = true
L["Drenk Spannerspark"] = true
-- war2org
L["Greeb Ramrocket"] = true
L["Nargo Screwbore"] = true
-- wg2wg:
L["Harrowmeiser"] = true
-- tb2org:
L["Krendle Bigpockets"] = true
L["Zelli Hotnozzle"] = true
L["Sky-Captain \"Dusty\" Blastnut"] = true
L["Watcher Tolwe"] = true

-- ship names
L["The Thundercaller"] = true
L["The Iron Eagle"] = true
L["The Purple Princess"] = true
L["The Maiden's Fancy"] = true
L["The Bravery"] = true
L["The Lady Mehley"] = true
L["The Moonspray"] = true
L["Feathermoon Ferry"] = true
L["Elune's Blessing"] = true
L["The Mighty Wind"] = true
L["Cloudkisser"] = true
L["Walker of Waves"] = true
L["Green Island"] = true
L["The Kraken"] = true
L["Northspear"] = true
L["Captured Zeppelin"] = true
L["The Zephyr"] = true

-- zones (*must* strictly match the in-game name)
L["Orgrimmar"] = true
L["Undercity"] = true
L["The Exodar"] = true
L["Stormwind City"] = true
L["Thunder Bluff"] = true

L["Durotar"] = true
L["Tirisfal Glades"] = true
L["Northern Stranglethorn"] = true
L["The Cape of Stranglethorn"] = true
L["Northern Barrens"] = true
L["Southern Barrens"] = true
L["Wetlands"] = true
L["Dustwallow Marsh"] = true
L["Teldrassil"] = true
L["Azuremyst Isle"] = true
L["Elwynn Forest"] = true
L["Westfall"] = true
L["Borean Tundra"] = true
L["Howling Fjord"] = true
L["Dragonblight"] = true
L["Mulgore"] = true

L["The Veiled Sea"] = true
L["Twisting Nether"] = true
L["The Frozen Sea"] = true
L["The Great Sea"] = true

-- subzones
L["Grom'gol"] = true
L["Booty Bay"] = true
L["Ratchet"] = true
L["Menethil Harbor"] = true
L["Theramore"] = true
L["Rut'Theran Village"] = true
L["Warsong Hold"] = true
L["Vengeance Landing"] = true
L["Valiance Keep"] = true
L["Valgarde"] = true
L["Unu'pe"] = true
L["Moa'ki Harbor"] = true
L["Kamagua"] = true
L["Westguard Keep"] = true

-- abbreviations
L["Org"] = true -- Orgrimmar
L["UC"]  = true -- Undercity
L["Exo"] = true -- The Exodar
L["SC"]  = true -- Stormwind City
L["TB"]  = true -- Thunder Bluff

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
