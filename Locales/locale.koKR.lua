
local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

L:RegisterTranslations("koKR", function() return {

-- general
["SAVE"] = "저장",
["CLOSE"] = "닫기",
["Minimise"] = "Minimise",
["Maximise"] = "Maximise",
["Options"] = "Options",

-- miscellaneous
["Arrival"] = "도착",
["Departure"] = "출발",
["Arr"] = "Arr", -- abbreviation for Arrival
["Dep"] = "Dep", -- abbreviation for Departure
["None Selected"] = "선택하지 않음",
["Select Transport"] = "이동수단을 선택하세요",
["No Transit Selected"] = "No Transit Selected",
["Not Available"] = "Not Available",
["N/A"] = "N/A", -- abbreviation for Not Available
["Nauticus Options"] = "Nauticus Options",

["Show GUI when zone change contains a transport"] =
	"이동수단을 포함하는 지역 변경의 경우 GUI창 표시",
["Show only transports for your faction"] =
	"해당 진영의 이동수단만 표시",
["Shows only neutral and transports specific to your faction."] =
	"Shows only neutral and transports specific to your faction.",
["Show only transports in your current zone"] =
	"현재 지역의 이동수단만 표시",
["Shows only transports in your current zone."] =
	"Shows only transports in your current zone.",
["Display using city aliases"] =
	"도착지의 다른이름 표시",
["Displays destinations as city aliases instead of zone names (e.g. Undercity instead of Tirisfal Glades)."] =
	"Displays destinations as city aliases instead of zone names (예. 티리스팔 숲 -> 언더시티).",
["Click to cycle transport.|nAlt-Click to set up alarm"] =
	"Click to cycle transport.|nAlt-Click to set up alarm",
["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."] =
	"There is a new version of Nauticus available! Please visit http://drool.me.uk/naut.",
["Type /nauticus or /naut gui show to show again."] =
	"Type /nauticus or /naut gui show to show again.",
["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."] =
	"You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled.",
["Thank you for upgrading."] =
	"Thank you for upgrading.",

-- zones
["Orgrimmar"] = "오그리마",
["Undercity"] = "언더시티",
["The Exodar"] = "엑소다르",

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

["The Veiled Sea"] = "장막의 바다",
["Twisting Nether"] = "뒤틀린 황천",

-- subzones
["Grom'gol"] = "그롬골 주둔지",
["Booty Bay"] = "무법항",
["Ratchet"] = "톱니항",
["Menethil Harbor"] = "메네실 항구",
["Auberdine"] = "아우버다인",
["Theramore"] = "테라모어 섬",
["Rut'Theran Village"] = "루테란 마을",
["Sardor Isle"] = "Sardor Isle",
["Feathermoon"] = "Feathermoon",
["Forgotten Coast"] = "Forgotten Coast",

-- abbreviations
["Org"]	= "오그",		-- Orgrimmar
["UC"]	= "언더",		-- Undercity
["Exo"]	= "Exo",	-- The Exodar

["GG"]	= "가덤",		-- Grom'gol
["BB"]	= "무법",		-- Booty Bay
["Ra"]	= "톱니",		-- Ratchet
["MH"]	= "메네실",	-- Menethil Harbor
["Aub"]	= "아우버",	-- Auberdine
["Th"]	= "테라",		-- Theramore
["RTV"]	= "루테란",	-- Rut'Theran Village
["FMS"]	= "FMS",	-- Feathermoon
["Fer"]	= "Fer",	-- Feralas

} end)
