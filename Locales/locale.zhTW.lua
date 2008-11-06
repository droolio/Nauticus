
local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

L:RegisterTranslations("zhTW", function() return {

-- general
["Save"] = "儲存",
["Close"] = "關閉",
["Minimise"] = "最小化",
["Maximise"] = "最大化",
["Options"] = "選項",

-- miscellaneous
["Arrival"] = "抵達",
["Departure"] = "出發",
["Arr"] = "抵達", -- abbreviation for Arrival
["Dep"] = "出發", -- abbreviation for Departure
["Select Transport"] = "選擇路線",
["Select None"] = "Select None", -- to do
["No Transport Selected"] = "沒有選擇路線",
["Not Available"] = "無有效計時",
["N/A"] = "--", -- abbreviation for Not Available
["Nauticus Options"] = "Nauticus 選項",

["Show GUI when zone change contains a transport"] =
	"當轉換的區域有運輸點時顯示圖形介面",
["Show only transports for your faction"] =
	"只顯示玩家陣營可用的運輸點",
["Shows only neutral and transports specific to your faction."] =
	"只顯示中立以及玩家陣營可用的傳輸點",
["Show only transports in your current zone"] =
	"只顯示你目前區域可用的傳輸點",
["Shows only transports in your current zone."] =
	"只顯示你目前區域可用的傳輸點",
["Hint: Click to cycle transport. Alt-Click to set up alarm"] =
	"提示: 左鍵：運輸週期 Alt+左鍵：設定鬧鈴",
["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."] =
	"有新版的 Nauticus 釋出！ 請訪問 http://drool.me.uk/naut.",
["Type /nauticus or /naut gui show to show again."] =
	"輸入 /nauticus 或 /naut gui show 重新顯示圖形介面。",
["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."] =
	"你已使用的是舊版的 Nauticus 超過 10 天了，同步訊息輸出現在將會關閉。",
["Thank you for upgrading."] =
	"感謝你更新版本。",

-- zones
["Orgrimmar"] = "奧格瑪",
["Undercity"] = "幽暗城",
["The Exodar"] = "艾克索達",
["Stormwind City"] = "暴風城",

["Durotar"] = "杜洛塔",
["Tirisfal Glades"] = "提里斯法林地",
["Stranglethorn Vale"] = "荊棘谷",
["The Barrens"] = "貧瘠之地",
["Wetlands"] = "濕地",
["Darkshore"] = "黑海岸",
["Dustwallow Marsh"] = "塵泥沼澤",
["Teldrassil"] = "泰達希爾",
["Azuremyst Isle"] = "藍謎島",
["Feralas"] = "菲拉斯",

["The Veiled Sea"] = "迷霧之海",
["Twisting Nether"] = "扭曲虛空",

-- subzones
["Grom'gol"] = "格羅姆高營地",
["Booty Bay"] = "藏寶海灣",
["Ratchet"] = "棘齒城",
["Menethil Harbor"] = "米奈希爾港",
["Auberdine"] = "奧伯丁",
["Theramore"] = "塞拉摩島",
["Rut'Theran Village"] = "魯瑟蘭村",
["Sardor Isle"] = "瓦拉船台",
["Feathermoon"] = "羽月要塞",
["Forgotten Coast"] = "被遺忘的海岸",

-- abbreviations
["Org"]	= "奧格",		-- Orgrimmar
["UC"]	= "幽暗",		-- Undercity
["Exo"]	= "艾克",		-- The Exodar
["SC"]	= "SC",		-- Stormwind City

["GG"]	= "格羅姆高",	-- Grom'gol
["BB"]	= "藏寶",		-- Booty Bay
["Ra"]	= "棘齒",		-- Ratchet
["MH"]	= "米奈希爾",	-- Menethil Harbor
["Aub"]	= "奧伯丁",	-- Auberdine
["Th"]	= "塞拉摩",	-- Theramore
["RTV"]	= "魯瑟蘭",	-- Rut'Theran Village
["FMS"]	= "羽月",		-- Feathermoon
["Fer"]	= "遺忘海岸",	-- Feralas

} end)
