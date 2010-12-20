
-- Chinese simplified localisation by Juha
local L = LibStub("AceLocale-3.0"):NewLocale("Nauticus", "zhCN")
if not L then return; end

-- addon description
L["Tracks the precise arrival & departure schedules of boats and Zeppelins around Azeroth and displays them on the Mini-Map and World Map in real-time."] = "追踪环绕艾泽拉斯的飞艇及船只正确抵达及离开的时间，并实时显示在世界地图与小地图上。"

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
L["Options"] = "选项"
L["General Settings"] = "常规设置"
L["Map Icons"] = "地图图标"
L["Options for displaying transports as icons on the Mini-Map and World Map."] = "此选项会在小地图以及世界地图上显示运输船的图标。"
L["Show on Mini-Map"] = "显示于小地图"
L["Toggle display of icons on the Mini-Map."] = "在小地图上显示运输船的图标。"
L["Show on World Map"] = "显示于世界地图"
L["Toggle display of icons on the World Map."] = "在世界地图上显示运输船的图标。"
L["Mini-Map icon size"] = "小地图图标大小"
L["Change the size of the Mini-Map icons."] = "变更小地图图标的大小。"
L["World Map icon size"] = "世界地图图标大小"
L["Change the size of the World Map icons."] = "变更世界地图图标大小。"
L["Faction only"] = "阵营限定"
L["Hide transports of opposite faction from the map, showing only neutral and those of your faction."] = "在地图上隐藏敌对阵营的运输船，仅显示中立与我方阵营的船只。"
L["Auto select transport"] = "自动选择运输船"
L["Automatically select nearest transport when standing at platform."] = "当你站在月台时自动选择距你最近的运输船"
L["Crew chat filter"] = "过滤工作人员喊话"
L["Toggle the filter for removing ship crew talk and Zeppelin Master yells from the chat window."] = "开启/关闭 移除对话窗口内船员以及船主的喊话信息。"
L["Alarm delay"] = "警示延迟"
L["Change the alarm delay (in seconds)."] = "变更警示延迟（秒）"
L["Mini-Map button"] = "小地图按钮"
L["Toggle the Mini-Map button."] = "开启小地图按钮。"

-- miscellaneous
L["Arrival"] = "到达"
L["Departure"] = "出发"
L["Select Transport"] = "选择路线"
L["Select None"] = "不选择"
L["No Transport Selected"] = "没有选择路线"
L["Not Available"] = "无有效计时"
L["N/A"] = "--" -- abbreviation for Not Available
L["Nauticus Options"] = "Nauticus 选项"
L["Alarm is now: "] = "警示现在"
L["ON"] = "启用"
L["OFF"] = "关闭"

L["List friendly faction only"] = "仅显示友方阵营"
L["Shows only neutral transports and those of your faction."] = "仅显示中立及我方阵营的传输船。"
L["List relevant to current zone only"] = "仅显示目前区域"
L["Shows only transports relevant to your current zone."] = "只显示你目前区域的传输船"
L["Hint: Click to cycle transport. Alt-Click to set up alarm"] = "提示: 左键：传送周期 Alt+左键：设置报警"
L["New version available! Visit www.drool.me.uk/naut"] = true

-- list of ship crew npc's to filter from chat (*must* strictly match the in-game name)
-- org2uc:
L["Frezza"] = "弗雷萨"
L["Zapetta"] = "飞艇管理员萨匹塔"
L["Sky-Captain Cloudkicker"] = "天空船长克劳基克"
L["Chief Officer Coppernut"] = "运营主管考伯纳特"
L["Navigator Fairweather"] = "领航员菲尔维兹"
-- uc2gg:
L["Hin Denburg"] = "兴登堡"
L["Navigator Hatch"] = "领航员哈奇"
L["Chief Officer Hammerflange"] = "运营主管哈莫弗朗"
L["Sky-Captain Cableclamp"] = "天空船长卡贝克拉"
-- org2gg:
L["Snurk Bucksquick"] = "斯纳尔克"
-- mh2ther:
L["Captain \"Stash\" Torgoley"] = "\“鼠胆船长\”托格雷"
L["First Mate Kowalski"] = "大副科瓦斯基"
L["Navigator Mehran"] = "领航员梅拉"
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
L["The Thundercaller"] = "唤雷号"
L["The Iron Eagle"] = "铁鹰号"
L["The Purple Princess"] = "紫色公主号"
L["The Maiden's Fancy"] = "少女之爱号"
L["The Bravery"] = "勇者号"
L["The Lady Mehley"] = "梅蕾女士号"
L["The Moonspray"] = "月海之浪号"
L["Feathermoon Ferry"] = "羽月渡船"
L["Elune's Blessing"] = "艾露恩的祝福"
L["The Mighty Wind"] = true
L["Cloudkisser"] = true
L["Walker of Waves"] = true
L["Green Island"] = true
L["The Kraken"] = true
L["Northspear"] = true
L["Captured Zeppelin"] = true
L["The Zephyr"] = true

-- zones (*must* strictly match the in-game name)
L["Orgrimmar"] = "奥格瑞玛"
L["Undercity"] = "幽暗城"
L["The Exodar"] = "埃索达"
L["Stormwind City"] = "暴风城"
L["Thunder Bluff"] = true -- to do

L["Durotar"] = "杜隆塔尔"
L["Tirisfal Glades"] = "提瑞斯法林地"
L["Northern Stranglethorn"] = true -- to do
L["The Cape of Stranglethorn"] = true -- to do
L["Northern Barrens"] = true -- to do
L["Southern Barrens"] = true -- to do
L["Wetlands"] = "湿地"
L["Dustwallow Marsh"] = "尘泥沼泽"
L["Teldrassil"] = "泰达希尔"
L["Azuremyst Isle"] = "秘蓝岛"
L["Elwynn Forest"] = true -- to do
L["Westfall"] = "西部荒野"
L["Borean Tundra"] = "北风苔原"
L["Howling Fjord"] = "嚎风峡湾"
L["Dragonblight"] = "龙骨荒野"
L["Mulgore"] = true -- to do

L["The Veiled Sea"] = "迷雾之海"
L["Twisting Nether"] = "扭曲虚空"
L["The Frozen Sea"] = "冰冻之海"
L["The Great Sea"] = true -- to do

-- subzones
L["Grom'gol"] = "格罗姆高营地"
L["Booty Bay"] = "藏宝海湾"
L["Ratchet"] = "棘齿城"
L["Menethil Harbor"] = "米奈希尔港"
L["Theramore"] = "塞拉摩岛"
L["Rut'Theran Village"] = "鲁瑟兰村"
L["Warsong Hold"] = "战歌要塞"
L["Vengeance Landing"] = "复仇港"
L["Valiance Keep"] = "无畏要塞"
L["Valgarde"] = "瓦加德"
L["Unu'pe"] = "乌努比"
L["Moa'ki Harbor"] = "莫亚基港口"
L["Kamagua"] = "卡玛古"
L["Westguard Keep"] = "西部卫戍要塞"

-- abbreviations
L["Org"] = "奥格"   -- Orgrimmar
L["UC"]  = "幽暗"   -- Undercity
L["Exo"] = "埃索达"  -- The Exodar
L["SC"]  = "暴风"   -- Stormwind City
L["TB"]  = true     -- to do; Thunder Bluff

L["GG"]  = "格罗姆高" -- Grom'gol
L["BB"]  = "藏宝"   -- Booty Bay
L["Rat"] = "棘齿"   -- Ratchet
L["MH"]  = "米奈希尔" -- Menethil Harbor
L["Th"]  = "塞拉摩"  -- Theramore
L["RTV"] = "鲁瑟兰"  -- Rut'Theran Village
L["War"] = "战歌要塞" -- Warsong Hold
L["Ven"] = "复仇港"  -- Vengeance Landing
L["VK"]  = "无畏要塞" -- Valiance Keep
L["VG"]  = "瓦加德"  -- Valgarde
L["Unu"] = "乌努比"  -- Unu'pe
L["Moa"] = "莫亚基"  -- Moa'ki Harbor
L["Kam"] = "卡玛古"  -- Kamagua
L["WGK"] = "西戍要塞" -- Westguard Keep
