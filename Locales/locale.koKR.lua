
local L = LibStub("AceLocale-3.0"):NewLocale("Nauticus", "koKR")
if not L then return; end

-- options; TO DO:
L["Options"] = true
L["Icons"] = true
L["Icon options."] = true
L["Show icons"] = true
L["Toggle on/off map icons."] = true
L["Mini-Map icon size"] = true
L["Change the size of the Mini-Map icons."] = true
L["World Map icon size"] = true
L["Change the size of the World Map icons."] = true
L["Auto select transport"] = true
L["Automatically select nearest transport when standing at platform."] = true
L["Crew chat filter"] = true
L["Toggle on/off chat filter for yelling crew spam."] = true
L["Alarm delay"] = true
L["Change the alarm delay (in seconds)."] = true

-- miscellaneous
L["Arrival"] = "도착"
L["Departure"] = "출발"
L["Arr"] = true -- abbreviation for Arrival
L["Dep"] = true -- abbreviation for Departure
L["Select Transport"] = "이동수단을 선택하세요"
-- TO DO:
L["Select None"] = true
L["No Transport Selected"] = true
L["Not Available"] = true
L["N/A"] = true -- abbreviation for Not Available
L["Nauticus Options"] = true
L["Alarm is now: "] = true
L["ON"] = true
L["OFF"] = true
L["Daily: "] = true

L["Show only transports for your faction"] =
	"해당 진영의 이동수단만 표시"
L["Shows only neutral and transports specific to your faction."] =
	true -- to do
L["Show only transports in your current zone"] =
	"현재 지역의 이동수단만 표시"
L["Shows only transports in your current zone."] =
	true -- to do
L["Hint: Click to cycle transport. Alt-Click to set up alarm"] =
	"힌트: Click to cycle transport. Alt-Click to set up alarm" -- re do
L["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."] =
	true -- to do
L["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."] =
	true -- to do
L["Thank you for upgrading."] =
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

-- ship names; TO DO:
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

-- zones (*must* strictly match the in-game name)
L["Orgrimmar"] = "오그리마"
L["Undercity"] = "언더시티"
L["The Exodar"] = "엑소다르"
L["Stormwind City"] = "스톰윈드"

L["Durotar"] = "듀로타"
L["Tirisfal Glades"] = "티리스팔 숲"
L["Stranglethorn Vale"] = "가시덤불 골짜기"
L["The Barrens"] = "불모의 땅"
L["Wetlands"] = "저습지"
L["Darkshore"] = "어둠의 해안"
L["Dustwallow Marsh"] = "먼지진흙 습지대"
L["Teldrassil"] = "텔드랏실"
L["Azuremyst Isle"] = "하늘안개 섬"
L["Feralas"] = "페랄라스"
L["Westfall"] = "서부 몰락지대"
L["Borean Tundra"] = "북풍의 땅"
L["Howling Fjord"] = "울부짖는 협만"
L["Dragonblight"] = "용의 안식처"

L["The Veiled Sea"] = "장막의 바다"
L["Twisting Nether"] = "뒤틀린 황천"
L["The Frozen Sea"] = true -- to do

-- subzones
L["Grom'gol"] = "그롬골 주둔지"
L["Booty Bay"] = "무법항"
L["Ratchet"] = "톱니항"
L["Menethil Harbor"] = "메네실 항구"
L["Auberdine"] = "아우버다인"
L["Theramore"] = "테라모어 섬"
L["Rut'Theran Village"] = "루테란 마을"
-- TO DO:
L["Sardor Isle"] = true
L["Feathermoon"] = true
L["Forgotten Coast"] = true
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

L["GG"]  = "가덤"  -- Grom'gol
L["BB"]  = "무법"  -- Booty Bay
L["Rat"] = "톱니"  -- Ratchet
L["MH"]  = "메네실" -- Menethil Harbor
L["Aub"] = "아우버" -- Auberdine
L["Th"]  = "테라"  -- Theramore
L["RTV"] = "루테란" -- Rut'Theran Village
-- TO DO:
L["FMS"] = true  -- Feathermoon
L["Fer"] = true  -- Feralas
L["War"] = true  -- Warsong Hold
L["Ven"] = true  -- Vengeance Landing
L["VK"]  = true  -- Valiance Keep
L["VG"]  = true  -- Valgarde
L["Unu"] = true  -- Unu'pe
L["Moa"] = true  -- Moa'ki Harbor
L["Kam"] = true  -- Kamagua
L["WGK"] = true  -- Westguard Keep
