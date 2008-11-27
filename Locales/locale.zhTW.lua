
local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

-- Chinese traditional localisation by Juha
L:RegisterTranslations("zhTW", function() return {

-- options
["Options"] = "選項",
["Icons"] = "圖示",
["Icon options."] = "圖示選項。",
["Show icons"] = "顯示圖示",
["Toggle on/off map icons."] = "開啟/關閉 地圖圖示。",
["Mini-Map icon size"] = "小地圖圖示大小",
["Change the size of the Mini-Map icons."] = "變更小地圖圖示的大小。",
["World Map icon size"] = "世界地圖圖示大小",
["Change the size of the World Map icons."] = "變更世界地圖圖示大小。",
["Auto select transport"] = "自動選擇傳輸點",
["Automatically select nearest transport when standing at platform."] = "當你站在月台時自動選擇距你最近的傳輸點",
["Crew chat filter"] = "過濾工作人員喊話",
["Toggle on/off chat filter for yelling crew spam."] = "開啟/關閉 過濾工作人員喊話訊息。",
["Alarm delay"] = "警示延遲",
["Change the alarm delay (in seconds)."] = "變更警示延遲（秒）",

-- miscellaneous
["Arrival"] = "抵達",
["Departure"] = "出發",
["Arr"] = "抵達", -- abbreviation for Arrival
["Dep"] = "出發", -- abbreviation for Departure
["Select Transport"] = "選擇路線",
["Select None"] = "選擇-無",
["No Transport Selected"] = "沒有選擇路線",
["Not Available"] = "無有效計時",
["N/A"] = "--", -- abbreviation for Not Available
["Nauticus Options"] = "Nauticus 選項",
["Alarm is now: "] = "警示現在",
["ON"] = "ON", -- to do
["OFF"] = "OFF", -- to do
["Daily: "] = "每日: ",

["Show only transports for your faction"] = "只顯示玩家陣營可用的運輸點",
["Shows only neutral and transports specific to your faction."] = "只顯示中立以及玩家陣營可用的傳輸點",
["Show only transports in your current zone"] = "只顯示你目前區域可用的傳輸點",
["Shows only transports in your current zone."] = "只顯示你目前區域可用的傳輸點",
["Hint: Click to cycle transport. Alt-Click to set up alarm"] = "提示: 左鍵：運輸週期 Alt+左鍵：設定鬧鈴",
["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."] = "有新版的 Nauticus 釋出！ 請訪問 http://drool.me.uk/naut.",
["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."] = "你已使用的是舊版的 Nauticus 超過 10 天了，同步訊息輸出現在將會關閉。",
["Thank you for upgrading."] = "感謝你更新版本。",

-- list of ship crew npc's to filter from chat (*must* strictly match the in-game name)
-- org2uc:
["Frezza"] = "弗雷薩",
["Zapetta"] = "飛艇管理員薩匹塔",
["Sky-Captain Cloudkicker"] = "領空隊長踢雲",
["Chief Officer Coppernut"] = "總指揮銅螺",
["Navigator Fairweather"] = "領航者費爾威德",
-- uc2gg:
["Hin Denburg"] = "興登堡",
["Navigator Hatch"] = "領航員哈奇",
["Chief Officer Hammerflange"] = "總指揮錘緣",
["Sky-Captain Cableclamp"] = "領空隊長索鉗",
-- org2gg:
["Snurk Bucksquick"] = "斯納爾克",
-- mh2ther:
["Captain \"Stash\" Torgoley"] = "多茍利『小鬍子』船長",
["First Mate Kowalski"] = "大副可沃斯基",
["Navigator Mehran"] = "領航員梅朗",
-- uc2ven
["Meefi Farthrottle"] = "米菲·遙流",
["Drenk Spannerspark"] = "德然克·扳爍",
-- war2org
["Greeb Ramrocket"] = "格利伯·瑞姆洛基",
["Nargo Screwbore"] = "納爾高·螺孔",
-- wg2wg:
["Harrowmeiser"] = "哈洛梅瑟",

-- ship names
["The Thundercaller"] = "喚雷者號",
["The Iron Eagle"] = "鋼鐵雄鷹號",
["The Purple Princess"] = "紫色公主號",
["The Maiden's Fancy"] = "少女之愛號",
["The Bravery"] = "勇氣號",
["The Lady Mehley"] = "梅利女士號",
["The Moonspray"] = "月霧號",
["Feathermoon Ferry"] = "羽月渡口",
["Elune's Blessing"] = "伊露恩祝福號",
["The Mighty Wind"] = "強風號",
["Cloudkisser"] = "拂雲號",
["Walker of Waves"] = "波濤行者", 
["Green Island"] = "綠島",
["The Kraken"] = "海怪號",
["Northspear"] = "北矛號",
["Captured Zeppelin"] = "Captured Zeppelin", -- to do

-- zones (*must* strictly match the in-game name)
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
["Westfall"] = "西部荒野",
["Borean Tundra"] = "北風凍原",
["Howling Fjord"] = "凜風峽灣",
["Dragonblight"] = "龍骨荒野",

["The Veiled Sea"] = "迷霧之海",
["Twisting Nether"] = "扭曲虛空",
["The Frozen Sea"] = "冰凍之海",

-- subzones
["Grom'gol"] = "格羅姆高營地",
["Booty Bay"] = "藏寶海灣",
["Ratchet"] = "棘齒城",
["Menethil Harbor"] = "米奈希爾港",
["Auberdine"] = "奧伯丁",
["Theramore"] = "塞拉摩島",
["Rut'Theran Village"] = "魯瑟蘭村",
["Sardor Isle"] = "薩爾多島",
["Feathermoon"] = "羽月要塞",
["Forgotten Coast"] = "被遺忘的海岸",
["Warsong Hold"] = "戰歌堡",
["Vengeance Landing"] = "復仇臺地",
["Valiance Keep"] = "驍勇要塞",
["Valgarde"] = "瓦爾加德",
["Unu'pe"] = "昂紐沛",
["Moa'ki Harbor"] = "默亞基港",
["Kamagua"] = "卡瑪廓",
["Westguard Keep"] = "鎮西要塞",

-- abbreviations
["Org"]	= "奧格",   -- Orgrimmar
["UC"]  = "幽暗",   -- Undercity
["Exo"] = "艾克",   -- The Exodar
["SC"]  = "暴風",   -- Stormwind City

["GG"]  = "格羅姆高", -- Grom'gol
["BB"]  = "藏寶",   -- Booty Bay
["Rat"] = "棘齒",   -- Ratchet
["MH"]  = "米奈希爾", -- Menethil Harbor
["Aub"] = "奧伯丁",  -- Auberdine
["Th"]  = "塞拉摩",  -- Theramore
["RTV"] = "魯瑟蘭",  -- Rut'Theran Village
["FMS"] = "羽月",   -- Feathermoon
["Fer"] = "遺忘海岸", -- Feralas
["War"] = "戰歌",   -- Warsong Hold
["Ven"] = "復仇",   -- Vengeance Landing
["VK"]  = "驍勇",   -- Valiance Keep
["VG"]  = "瓦爾加德", -- Valgarde
["Unu"] = "昂紐沛",  -- Unu'pe
["Moa"] = "默亞基",  -- Moa'ki Harbor
["Kam"] = "瑪廓",   -- Kamagua
["WGK"] = "鎮西",   -- Westguard Keep

} end)
