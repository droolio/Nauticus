
local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

L:RegisterTranslations("koKR", function() return {

-- options; TO DO:
["Options"] = "Options",
["Icons"] = "Icons",
["Icon options."] = "Icon options.",
["Show icons"] = "Show icons",
["Toggle on/off map icons."] = "Toggle on/off map icons.",
["Mini-Map icon size"] = "Mini-Map icon size",
["Change the size of the Mini-Map icons."] = "Change the size of the Mini-Map icons.",
["World Map icon size"] = "World Map icon size",
["Change the size of the World Map icons."] = "Change the size of the World Map icons.",
["Auto select transport"] = "Auto select transport",
["Automatically select nearest transport when standing at platform."] = "Automatically select nearest transport when standing at platform.",
["Crew chat filter"] = "Crew chat filter",
["Toggle on/off chat filter for yelling crew spam."] = "Toggle on/off chat filter for yelling crew spam.",
["Alarm delay"] = "Alarm delay",
["Change the alarm delay (in seconds)."] = "Change the alarm delay (in seconds).",

-- miscellaneous
["Arrival"] = "도착",
["Departure"] = "출발",
["Arr"] = "Arr", -- abbreviation for Arrival
["Dep"] = "Dep", -- abbreviation for Departure
["Select Transport"] = "이동수단을 선택하세요",
-- TO DO:
["Select None"] = "Select None", -- to do
["No Transport Selected"] = "No Transport Selected",
["Not Available"] = "Not Available",
["N/A"] = "N/A", -- abbreviation for Not Available
["Nauticus Options"] = "Nauticus Options",
["Alarm is now: "] = "Alarm is now: ",
["ON"] = "ON",
["OFF"] = "OFF",
["Daily: "] = "Daily: ",

-- TO DO:
["Show only transports for your faction"] =
	"해당 진영의 이동수단만 표시",
["Shows only neutral and transports specific to your faction."] =
	"Shows only neutral and transports specific to your faction.",
["Show only transports in your current zone"] =
	"현재 지역의 이동수단만 표시",
["Shows only transports in your current zone."] =
	"Shows only transports in your current zone.",
["Hint: Click to cycle transport. Alt-Click to set up alarm"] =
	"힌트: Click to cycle transport. Alt-Click to set up alarm",
["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."] =
	"There is a new version of Nauticus available! Please visit http://drool.me.uk/naut.",
["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."] =
	"You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled.",
["Thank you for upgrading."] =
	"Thank you for upgrading.",

-- list of ship crew npc's to filter from chat (*must* strictly match the in-game name); TO DO:
-- org2uc:
["Frezza"] = "Frezza",
["Zapetta"] = "Zapetta",
["Sky-Captain Cloudkicker"] = "Sky-Captain Cloudkicker",
["Chief Officer Coppernut"] = "Chief Officer Coppernut",
["Navigator Fairweather"] = "Navigator Fairweather",
-- uc2gg:
["Hin Denburg"] = "Hin Denburg",
["Navigator Hatch"] = "Navigator Hatch",
["Chief Officer Hammerflange"] = "Chief Officer Hammerflange",
["Sky-Captain Cableclamp"] = "Sky-Captain Cableclamp",
-- org2gg:
["Snurk Bucksquick"] = "Snurk Bucksquick",
-- mh2ther:
["Captain \"Stash\" Torgoley"] = "Captain \"Stash\" Torgoley",
["First Mate Kowalski"] = "First Mate Kowalski",
["Navigator Mehran"] = "Navigator Mehran",
-- uc2ven
["Meefi Farthrottle"] = "Meefi Farthrottle",
["Drenk Spannerspark"] = "Drenk Spannerspark",
-- war2org
["Greeb Ramrocket"] = "Greeb Ramrocket",
["Nargo Screwbore"] = "Nargo Screwbore",
-- wg2wg:
["Harrowmeiser"] = "Harrowmeiser",

-- ship names; TO DO:
["The Thundercaller"] = "The Thundercaller",
["The Iron Eagle"] = "The Iron Eagle",
["The Purple Princess"] = "The Purple Princess",
["The Maiden's Fancy"] = "The Maiden's Fancy",
["The Bravery"] = "The Bravery",
["The Lady Mehley"] = "The Lady Mehley",
["The Moonspray"] = "The Moonspray",
["Feathermoon Ferry"] = "Feathermoon Ferry",
["Elune's Blessing"] = "Elune's Blessing",
["The Mighty Wind"] = "The Mighty Wind",
["Cloudkisser"] = "Cloudkisser",
["Walker of Waves"] = "Walker of Waves",
["Green Island"] = "Green Island",
["The Kraken"] = "The Kraken",
["Northspear"] = "Northspear",
["Captured Zeppelin"] = "Captured Zeppelin",

-- zones (*must* strictly match the in-game name)
["Orgrimmar"] = "오그리마",
["Undercity"] = "언더시티",
["The Exodar"] = "엑소다르",
["Stormwind City"] = "스톰윈드",

["Durotar"] = "듀로타",
["Tirisfal Glades"] = "티리스팔 숲",
["Stranglethorn Vale"] = "가시덤불 골짜기",
["The Barrens"] = "불모의 땅",
["Wetlands"] = "저습지",
["Darkshore"] = "어둠의 해안",
["Dustwallow Marsh"] = "먼지진흙 습지대",
["Teldrassil"] = "텔드랏실",
["Azuremyst Isle"] = "하늘안개 섬",
["Feralas"] = "페랄라스",
["Westfall"] = "서부 몰락지대",
["Borean Tundra"] = "북풍의 땅",
["Howling Fjord"] = "울부짖는 협만",
["Dragonblight"] = "용의 안식처",

["The Veiled Sea"] = "장막의 바다",
["Twisting Nether"] = "뒤틀린 황천",
["The Frozen Sea"] = "The Frozen Sea", -- to do

-- subzones
["Grom'gol"] = "그롬골 주둔지",
["Booty Bay"] = "무법항",
["Ratchet"] = "톱니항",
["Menethil Harbor"] = "메네실 항구",
["Auberdine"] = "아우버다인",
["Theramore"] = "테라모어 섬",
["Rut'Theran Village"] = "루테란 마을",
-- TO DO:
["Sardor Isle"] = "Sardor Isle",
["Feathermoon"] = "Feathermoon",
["Forgotten Coast"] = "Forgotten Coast",
["Warsong Hold"] = "Warsong Hold",
["Vengeance Landing"] = "Vengeance Landing",
["Valiance Keep"] = "Valiance Keep",
["Valgarde"] = "Valgarde",
["Unu'pe"] = "Unu'pe",
["Moa'ki Harbor"] = "Moa'ki Harbor",
["Kamagua"] = "Kamagua",
["Westguard Keep"] = "Westguard Keep",

-- abbreviations
["Org"] = "오그",  -- Orgrimmar
["UC"]  = "언더",  -- Undercity
["Exo"] = "Exo", -- The Exodar
["SC"]  = "SC",  -- Stormwind City

["GG"]  = "가덤",  -- Grom'gol
["BB"]  = "무법",  -- Booty Bay
["Rat"] = "톱니",  -- Ratchet
["MH"]  = "메네실", -- Menethil Harbor
["Aub"] = "아우버", -- Auberdine
["Th"]  = "테라",  -- Theramore
["RTV"] = "루테란", -- Rut'Theran Village
-- TO DO:
["FMS"] = "FMS", -- Feathermoon
["Fer"] = "Fer", -- Feralas
["War"] = "War", -- Warsong Hold
["Ven"] = "Ven", -- Vengeance Landing
["VK"]  = "VK",  -- Valiance Keep
["VG"]  = "VG",  -- Valgarde
["Unu"] = "Unu", -- Unu'pe
["Moa"] = "Moa", -- Moa'ki Harbor
["Kam"] = "Kam", -- Kamagua
["WGK"] = "WGK", -- Westguard Keep

} end)
