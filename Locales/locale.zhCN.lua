﻿
local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

L:RegisterTranslations("zhCN", function() return {

-- general
["Save"] = "保存",
["Close"] = "关闭",
["Minimise"] = "最小化",
["Maximise"] = "最大化",
["Options"] = "选项",

-- miscellaneous
["Arrival"] = "到达",
["Departure"] = "出发",
["Arr"] = "到达", -- abbreviation for Arrival
["Dep"] = "出发", -- abbreviation for Departure
["Select Transport"] = "选择路线",
["Select None"] = "Select None", -- to do
["No Transport Selected"] = "没有选择路线",
["Not Available"] = "无有效计时",
["N/A"] = "--", -- abbreviation for Not Available
["Nauticus Options"] = "Nauticus 选项",

["Show GUI when zone change contains a transport"] =
	"当转换的区域有传送点时显示图形界面",
["Show only transports for your faction"] =
	"只显示玩家所在阵营可用的传送点",
["Shows only neutral and transports specific to your faction."] =
	"只显示中立以及玩家所在阵营可用的传送点",
["Show only transports in your current zone"] =
	"只显示你目前所在区域可用的传送点",
["Shows only transports in your current zone."] =
	"只显示你目前所在区域可用的传送点",
["Click to cycle transport.|nAlt-Click to set up alarm"] =
	"左键：传送周期 |nAlt+左键：设置报警",
["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."] =
	"有新版本 Nauticus 发布！ 请访问 http://drool.me.uk/naut.",
["Type /nauticus or /naut gui show to show again."] =
	"输入 /nauticus 或 /naut gui show 可重新显示图形介面。",
["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."] =
	"你已使用的是旧版的 Nauticus 超过 10 天了，同步讯息输出现在将会关闭。",
["Thank you for upgrading."] =
	"感谢你更新版本。",

-- zones
["Orgrimmar"] = "奥格瑞玛",
["Undercity"] = "幽暗城",
["The Exodar"] = "埃索达",
["Stormwind City"] = "暴风城",

["Durotar"] = "杜隆塔尔",
["Tirisfal Glades"] = "提瑞斯法林地",
["Stranglethorn Vale"] = "荆棘谷",
["The Barrens"] = "贫瘠之地",
["Wetlands"] = "湿地",
["Darkshore"] = "黑海岸",
["Dustwallow Marsh"] = "尘泥沼泽",
["Teldrassil"] = "泰达希尔",
["Azuremyst Isle"] = "秘蓝岛",
["Feralas"] = "菲拉斯",

["The Veiled Sea"] = "迷雾之海",
["Twisting Nether"] = "扭曲虚空",

-- subzones
["Grom'gol"] = "格罗姆高营地",
["Booty Bay"] = "藏宝海湾",
["Ratchet"] = "棘齿城",
["Menethil Harbor"] = "米奈希尔港",
["Auberdine"] = "奥伯丁",
["Theramore"] = "塞拉摩岛",
["Rut'Theran Village"] = "鲁瑟兰村",
["Sardor Isle"] = "瓦拉船台",
["Feathermoon"] = "羽月要塞",
["Forgotten Coast"] = "被遗忘的海岸",

-- abbreviations
["Org"]	= "奥格",		-- Orgrimmar
["UC"]	= "幽暗",		-- Undercity
["Exo"]	= "埃索达",	-- The Exodar
["SC"]	= "SC",		-- Stormwind City

["GG"]	= "格罗姆高",	-- Grom'gol
["BB"]	= "藏宝",		-- Booty Bay
["Ra"]	= "棘齿",		-- Ratchet
["MH"]	= "米奈希尔",	-- Menethil Harbor
["Aub"]	= "奥伯丁",	-- Auberdine
["Th"]	= "塞拉摩",	-- Theramore
["RTV"]	= "鲁瑟兰",	-- Rut'Theran Village
["FMS"]	= "羽月",		-- Feathermoon
["Fer"]	= "遗忘海岸",	-- Feralas

} end)
