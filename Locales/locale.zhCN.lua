
local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

-- Chinese simplified localisation by Juha
L:RegisterTranslations("zhCN", function() return {

-- options
["Options"] = "选项",
["Icons"] = "图标",
["Icon options."] = "图标选项。",
["Show icons"] = "显示图标",
["Toggle on/off map icons."] = "开启/关闭 地图图标。",
["Mini-Map icon size"] = "小地图图标大小",
["Change the size of the Mini-Map icons."] = "变更小地图图标的大小。",
["World Map icon size"] = "世界地图图标大小",
["Change the size of the World Map icons."] = "变更世界地图图标大小。",
["Auto select transport"] = "自动选择传输点",
["Automatically select nearest transport when standing at platform."] = "当你站在月台时自动选择距你最近的传输点",
["Crew chat filter"] = "过滤工作人员喊话",
["Toggle on/off chat filter for yelling crew spam."] = "开启/关闭 过滤工作人员喊话讯息。",
["Alarm delay"] = "警示延迟",
["Change the alarm delay (in seconds)."] = "变更警示延迟（秒）",

-- miscellaneous
["Arrival"] = "到达",
["Departure"] = "出发",
["Arr"] = "到达", -- abbreviation for Arrival
["Dep"] = "出发", -- abbreviation for Departure
["Select Transport"] = "选择路线",
["Select None"] = "不选择",
["No Transport Selected"] = "没有选择路线",
["Not Available"] = "无有效计时",
["N/A"] = "--", -- abbreviation for Not Available
["Nauticus Options"] = "Nauticus 选项",
["Alarm is now: "] = "警示现在",
["ON"] = "启用", 
["OFF"] = "关闭",
["Daily: "] = "日常: ",

["Show only transports for your faction"] = "只显示玩家所在阵营可用的运输站",
["Shows only neutral and transports specific to your faction."] = "只显示中立以及玩家所在阵营可用的运输站",
["Show only transports in your current zone"] = "只显示你目前所在区域可用的运输站",
["Shows only transports in your current zone."] = "只显示你目前所在区域可用的运输站",
["Hint: Click to cycle transport. Alt-Click to set up alarm"] = "提示: 左键：传送周期 Alt+左键：设置报警",
["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."] = "有新版本 Nauticus 发布！ 请访问 http://drool.me.uk/naut.",
["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."] = "你已使用旧版的 Nauticus 超过 10 天了，同步信息输出现在将会关闭。",
["Thank you for upgrading."] = "感谢你更新版本。",

-- list of ship crew npc's to filter from chat (*must* strictly match the in-game name)
-- org2uc:
["Frezza"] = "弗雷萨",
["Zapetta"] = "飞艇管理员萨匹塔",
["Sky-Captain Cloudkicker"] = "天空船长克劳基克",
["Chief Officer Coppernut"] = "运营主管考伯纳特",
["Navigator Fairweather"] = "领航员菲尔维兹",
-- uc2gg:
["Hin Denburg"] = "兴登堡",
["Navigator Hatch"] = "领航员哈奇",
["Chief Officer Hammerflange"] = "运营主管哈莫弗朗",
["Sky-Captain Cableclamp"] = "天空船长卡贝克拉",
-- org2gg:
["Snurk Bucksquick"] = "斯纳尔克",
-- mh2ther:
["Captain \"Stash\" Torgoley"] = "\“鼠胆船长\”托格雷",
["First Mate Kowalski"] = "大副科瓦斯基",
["Navigator Mehran"] = "领航员梅拉",
-- TO DO:
-- uc2ven
["Meefi Farthrottle"] = "Meefi Farthrottle",
["Drenk Spannerspark"] = "Drenk Spannerspark",
-- war2org
["Greeb Ramrocket"] = "Greeb Ramrocket",
["Nargo Screwbore"] = "Nargo Screwbore",
-- wg2wg:
["Harrowmeiser"] = "Harrowmeiser",

-- ship names
["The Thundercaller"] = "唤雷号",
["The Iron Eagle"] = "铁鹰号",
["The Purple Princess"] = "紫色公主号",
["The Maiden's Fancy"] = "少女之爱号",
["The Bravery"] = "勇者号",
["The Lady Mehley"] = "梅蕾女士号",
["The Moonspray"] = "月海之浪号",
["Feathermoon Ferry"] = "羽月渡船",
["Elune's Blessing"] = "艾露恩的祝福",
-- TO DO:
["The Mighty Wind"] = "The Mighty Wind",
["Cloudkisser"] = "Cloudkisser",
["Walker of Waves"] = "Walker of Waves",
["Green Island"] = "Green Island",
["The Kraken"] = "The Kraken",
["Northspear"] = "Northspear",
["Captured Zeppelin"] = "Captured Zeppelin",

-- zones (*must* strictly match the in-game name)
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
["Westfall"] = "西部荒野",
["Borean Tundra"] = "北风苔原",
["Howling Fjord"] = "嚎风峡湾",
["Dragonblight"] = "龙骨荒野",

["The Veiled Sea"] = "迷雾之海",
["Twisting Nether"] = "扭曲虚空",
["The Frozen Sea"] = "冰冻之海",

-- subzones
["Grom'gol"] = "格罗姆高营地",
["Booty Bay"] = "藏宝海湾",
["Ratchet"] = "棘齿城",
["Menethil Harbor"] = "米奈希尔港",
["Auberdine"] = "奥伯丁",
["Theramore"] = "塞拉摩岛",
["Rut'Theran Village"] = "鲁瑟兰村",
["Sardor Isle"] = "萨尔多岛",
["Feathermoon"] = "羽月要塞",
["Forgotten Coast"] = "被遗忘的海岸",
["Warsong Hold"] = "战歌要塞",
["Vengeance Landing"] = "复仇港",
["Valiance Keep"] = "无畏要塞",
["Valgarde"] = "瓦加德",
["Unu'pe"] = "乌努比",
["Moa'ki Harbor"] = "莫亚基港口",
["Kamagua"] = "卡玛古",
["Westguard Keep"] = "西部卫戍要塞",

-- abbreviations
["Org"] = "奥格",   -- Orgrimmar
["UC"]  = "幽暗",   -- Undercity
["Exo"] = "埃索达",  -- The Exodar
["SC"]  = "暴风",   -- Stormwind City

["GG"]  = "格罗姆高", -- Grom'gol
["BB"]  = "藏宝",   -- Booty Bay
["Rat"] = "棘齿",   -- Ratchet
["MH"]  = "米奈希尔", -- Menethil Harbor
["Aub"] = "奥伯丁",  -- Auberdine
["Th"]  = "塞拉摩",  -- Theramore
["RTV"] = "鲁瑟兰",  -- Rut'Theran Village
["FMS"] = "羽月",   -- Feathermoon
["Fer"] = "遗忘海岸", -- Feralas
["War"] = "战歌要塞", -- Warsong Hold
["Ven"] = "复仇港",  -- Vengeance Landing
["VK"]  = "无畏要塞", -- Valiance Keep
["VG"]  = "瓦加德",  -- Valgarde
["Unu"] = "乌努比",  -- Unu'pe
["Moa"] = "莫亚基",  -- Moa'ki Harbor
["Kam"] = "卡玛古",  -- Kamagua
["WGK"] = "西戍要塞", -- Westguard Keep

} end)
