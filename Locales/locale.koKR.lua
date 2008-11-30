
local L = LibStub("AceLocale-3.0"):NewLocale("Nauticus", "koKR", true)
if not L then return; end

-- options; TO DO:
L["Options"] = "Options"
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
L["Arrival"] = "도착"
L["Departure"] = "출발"
L["Arr"] = "Arr" -- abbreviation for Arrival
L["Dep"] = "Dep" -- abbreviation for Departure
L["Select Transport"] = "이동수단을 선택하세요"
-- TO DO:
L["Select None"] = "Select None" -- to do
L["No Transport Selected"] = "No Transport Selected"
L["Not Available"] = "Not Available"
L["N/A"] = "N/A" -- abbreviation for Not Available
L["Nauticus Options"] = "Nauticus Options"
L["Alarm is now: "] = "Alarm is now: "
L["ON"] = "ON"
L["OFF"] = "OFF"
L["Daily: "] = "Daily: "

-- TO DO:
L["Show only transports for your faction"] =
	"해당 진영의 이동수단만 표시"
L["Shows only neutral and transports specific to your faction."] =
	"Shows only neutral and transports specific to your faction."
L["Show only transports in your current zone"] =
	"현재 지역의 이동수단만 표시"
L["Shows only transports in your current zone."] =
	"Shows only transports in your current zone."
L["Hint: Click to cycle transport. Alt-Click to set up alarm"] =
	"힌트: Click to cycle transport. Alt-Click to set up alarm"
L["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."] =
	"There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."
L["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."] =
	"You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."
L["Thank you for upgrading."] =
	"Thank you for upgrading."

-- list of ship crew npc's to filter from chat (*must* strictly match the in-game name); TO DO:
-- org2uc:
L["Frezza"] = "Frezza"
L["Zapetta"] = "Zapetta"
L["Sky-Captain Cloudkicker"] = "Sky-Captain Cloudkicker"
L["Chief Officer Coppernut"] = "Chief Officer Coppernut"
L["Navigator Fairweather"] = "Navigator Fairweather"
-- uc2gg:
L["Hin Denburg"] = "Hin Denburg"
L["Navigator Hatch"] = "Navigator Hatch"
L["Chief Officer Hammerflange"] = "Chief Officer Hammerflange"
L["Sky-Captain Cableclamp"] = "Sky-Captain Cableclamp"
-- org2gg:
L["Snurk Bucksquick"] = "Snurk Bucksquick"
-- mh2ther:
L["Captain \"Stash\" Torgoley"] = "Captain \"Stash\" Torgoley"
L["First Mate Kowalski"] = "First Mate Kowalski"
L["Navigator Mehran"] = "Navigator Mehran"
-- uc2ven
L["Meefi Farthrottle"] = "Meefi Farthrottle"
L["Drenk Spannerspark"] = "Drenk Spannerspark"
-- war2org
L["Greeb Ramrocket"] = "Greeb Ramrocket"
L["Nargo Screwbore"] = "Nargo Screwbore"
-- wg2wg:
L["Harrowmeiser"] = "Harrowmeiser"

-- ship names; TO DO:
L["The Thundercaller"] = "The Thundercaller"
L["The Iron Eagle"] = "The Iron Eagle"
L["The Purple Princess"] = "The Purple Princess"
L["The Maiden's Fancy"] = "The Maiden's Fancy"
L["The Bravery"] = "The Bravery"
L["The Lady Mehley"] = "The Lady Mehley"
L["The Moonspray"] = "The Moonspray"
L["Feathermoon Ferry"] = "Feathermoon Ferry"
L["Elune's Blessing"] = "Elune's Blessing"
L["The Mighty Wind"] = "The Mighty Wind"
L["Cloudkisser"] = "Cloudkisser"
L["Walker of Waves"] = "Walker of Waves"
L["Green Island"] = "Green Island"
L["The Kraken"] = "The Kraken"
L["Northspear"] = "Northspear"
L["Captured Zeppelin"] = "Captured Zeppelin"

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
L["The Frozen Sea"] = "The Frozen Sea" -- to do

-- subzones
L["Grom'gol"] = "그롬골 주둔지"
L["Booty Bay"] = "무법항"
L["Ratchet"] = "톱니항"
L["Menethil Harbor"] = "메네실 항구"
L["Auberdine"] = "아우버다인"
L["Theramore"] = "테라모어 섬"
L["Rut'Theran Village"] = "루테란 마을"
-- TO DO:
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
