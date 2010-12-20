
local L = LibStub("AceLocale-3.0"):NewLocale("Nauticus", "koKR")
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
L["Mini-Map button"] = true -- to do
L["Toggle the Mini-Map button."] = true -- to do

-- miscellaneous
L["Arrival"] = "도착"
L["Departure"] = "출발"
L["Select Transport"] = "이동수단을 선택하세요"
L["Select None"] = true
L["No Transport Selected"] = true
L["Not Available"] = true
L["N/A"] = true -- abbreviation for Not Available
L["Nauticus Options"] = true
L["Alarm is now: "] = true
L["ON"] = true
L["OFF"] = true

L["List friendly faction only"] =
	"해당 진영의 이동수단만 표시" -- re do?
L["Shows only neutral transports and those of your faction."] =
	true -- to do
L["List relevant to current zone only"] =
	"현재 지역의 이동수단만 표시" -- re do?
L["Shows only transports relevant to your current zone."] =
	true -- to do
L["Hint: Click to cycle transport. Alt-Click to set up alarm"] =
	"힌트: Click to cycle transport. Alt-Click to set up alarm" -- re do
L["New version available! Visit www.drool.me.uk/naut"] =
	true -- to do

-- list of ship crew npc's to filter from chat (*must* strictly match the in-game name); TO DO:
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
L["Krendle Bigpockets"] = true -- to do
L["Zelli Hotnozzle"] = true -- to do
L["Sky-Captain \"Dusty\" Blastnut"] = true -- to do
L["Watcher Tolwe"] = true -- to do

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
L["Orgrimmar"] = "오그리마"
L["Undercity"] = "언더시티"
L["The Exodar"] = "엑소다르"
L["Stormwind City"] = "스톰윈드"
L["Thunder Bluff"] = true -- to do

L["Durotar"] = "듀로타"
L["Tirisfal Glades"] = "티리스팔 숲"
L["Northern Stranglethorn"] = true -- to do
L["The Cape of Stranglethorn"] = true -- to do
L["Northern Barrens"] = true -- to do
L["Southern Barrens"] = true -- to do
L["Wetlands"] = "저습지"
L["Dustwallow Marsh"] = "먼지진흙 습지대"
L["Teldrassil"] = "텔드랏실"
L["Azuremyst Isle"] = "하늘안개 섬"
L["Elwynn Forest"] = true -- to do
L["Westfall"] = "서부 몰락지대"
L["Borean Tundra"] = "북풍의 땅"
L["Howling Fjord"] = "울부짖는 협만"
L["Dragonblight"] = "용의 안식처"
L["Mulgore"] = true -- to do

L["The Veiled Sea"] = "장막의 바다"
L["Twisting Nether"] = "뒤틀린 황천"
L["The Frozen Sea"] = true -- to do
L["The Great Sea"] = true -- to do

-- subzones
L["Grom'gol"] = "그롬골 주둔지"
L["Booty Bay"] = "무법항"
L["Ratchet"] = "톱니항"
L["Menethil Harbor"] = "메네실 항구"
L["Theramore"] = "테라모어 섬"
L["Rut'Theran Village"] = "루테란 마을"
L["Warsong Hold"] = true
L["Vengeance Landing"] = true
L["Valiance Keep"] = true
L["Valgarde"] = true
L["Unu'pe"] = true
L["Moa'ki Harbor"] = true
L["Kamagua"] = true
L["Westguard Keep"] = true

-- abbreviations
L["Org"] = "오그"  -- Orgrimmar
L["UC"]  = "언더"  -- Undercity
L["Exo"] = "Exo" -- The Exodar
L["SC"]  = "SC"  -- Stormwind City
L["TB"]  = true  -- to do; Thunder Bluff

L["GG"]  = "가덤"  -- Grom'gol
L["BB"]  = "무법"  -- Booty Bay
L["Rat"] = "톱니"  -- Ratchet
L["MH"]  = "메네실" -- Menethil Harbor
L["Th"]  = "테라"  -- Theramore
L["RTV"] = "루테란" -- Rut'Theran Village
L["War"] = true  -- Warsong Hold
L["Ven"] = true  -- Vengeance Landing
L["VK"]  = true  -- Valiance Keep
L["VG"]  = true  -- Valgarde
L["Unu"] = true  -- Unu'pe
L["Moa"] = true  -- Moa'ki Harbor
L["Kam"] = true  -- Kamagua
L["WGK"] = true  -- Westguard Keep
