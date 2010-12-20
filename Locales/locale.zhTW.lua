
-- Chinese traditional localisation by Juha
local L = LibStub("AceLocale-3.0"):NewLocale("Nauticus", "zhTW")
if not L then return; end

-- addon description
L["Tracks the precise arrival & departure schedules of boats and Zeppelins around Azeroth and displays them on the Mini-Map and World Map in real-time."] = "追蹤環繞艾澤拉斯的飛艇及船隻正確抵達及離開的時間，並即時顯示在世界地圖與小地圖上。"

-- slash commands (no spaces!)
L["icons"] = "icons"
L["minishow"] = "minishow"
L["worldshow"] = "worldshow"
L["minisize"] = "minisize"
L["worldsize"] = "worldsize"
L["faction"] = "faction"
L["minibutton"] = "minibutton"
L["autoselect"] = "autoselect"
L["filter"] = "filter"
L["alarm"] = "alarm"

-- options
L["Options"] = "選項"
L["General Settings"] = "一般設定"
L["Map Icons"] = "地圖圖示"
L["Options for displaying transports as icons on the Mini-Map and World Map."] = "此選項會在小地圖以及世界地圖上顯示運輸船的圖示。"
L["Show on Mini-Map"] = "顯示於小地圖"
L["Toggle display of icons on the Mini-Map."] = "在小地圖上顯示運輸船的圖示。"
L["Show on World Map"] = "顯示於世界地圖"
L["Toggle display of icons on the World Map."] = "在世界地圖上顯示運輸船的圖示。"
L["Mini-Map icon size"] = "小地圖圖示大小"
L["Change the size of the Mini-Map icons."] = "變更小地圖圖示的大小。"
L["World Map icon size"] = "世界地圖圖示大小"
L["Change the size of the World Map icons."] = "變更世界地圖圖示大小。"
L["Faction only"] = "陣營限定"
L["Hide transports of opposite faction from the map, showing only neutral and those of your faction."] = "在地圖上隱藏敵對陣營的運輸船，僅顯示中立與我方陣營的船隻。"
L["Auto select transport"] = "自動選擇運輸船"
L["Automatically select nearest transport when standing at platform."] = "當你站在月台時自動選擇距你最近的運輸船"
L["Crew chat filter"] = "過濾工作人員喊話"
L["Toggle the filter for removing ship crew talk and Zeppelin Master yells from the chat window."] = "開啟/關閉 移除對話視窗內船員以及船主的喊話訊息。" 
L["Alarm delay"] = "警示延遲"
L["Change the alarm delay (in seconds)."] = "變更警示延遲（秒）"
L["Mini-Map button"] = "小地圖按鈕"
L["Toggle the Mini-Map button."] = "開啟小地圖按鈕。"

-- miscellaneous
L["Arrival"] = "抵達"
L["Departure"] = "出發"
L["Select Transport"] = "選擇路線"
L["Select None"] = "選擇-無"
L["No Transport Selected"] = "沒有選擇路線"
L["Not Available"] = "無有效計時"
L["N/A"] = "--" -- abbreviation for Not Available
L["Nauticus Options"] = "Nauticus 選項"
L["Alarm is now: "] = "警示現在"
L["ON"] = "啟用"
L["OFF"] = "關閉"

L["List friendly faction only"] = "僅顯示友方陣營"
L["Shows only neutral transports and those of your faction."] = "僅顯示中立及我方陣營的傳輸船。"
L["List relevant to current zone only"] = "僅顯示目前區域"
L["Shows only transports relevant to your current zone."] = "只顯示你目前區域的傳輸船"
L["Hint: Click to cycle transport. Alt-Click to set up alarm"] = "提示: 左鍵：運輸週期 Alt+左鍵：設定鬧鈴"
L["New version available! Visit www.drool.me.uk/naut"] = true

-- list of ship crew npc's to filter from chat (*must* strictly match the in-game name)
-- org2uc:
L["Frezza"] = "弗雷薩"
L["Zapetta"] = "飛艇管理員薩匹塔"
L["Sky-Captain Cloudkicker"] = "領空隊長踢雲"
L["Chief Officer Coppernut"] = "總指揮銅螺"
L["Navigator Fairweather"] = "領航者費爾威德"
-- uc2gg:
L["Hin Denburg"] = "興登堡"
L["Navigator Hatch"] = "領航員哈奇"
L["Chief Officer Hammerflange"] = "總指揮錘緣"
L["Sky-Captain Cableclamp"] = "領空隊長索鉗"
-- org2gg:
L["Snurk Bucksquick"] = "斯納爾克"
-- mh2ther:
L["Captain \"Stash\" Torgoley"] = "多茍利『小鬍子』船長"
L["First Mate Kowalski"] = "大副可沃斯基"
L["Navigator Mehran"] = "領航員梅朗"
-- uc2ven
L["Meefi Farthrottle"] = "米菲·遙流"
L["Drenk Spannerspark"] = "德然克·扳爍"
-- war2org
L["Greeb Ramrocket"] = "格利伯·瑞姆洛基"
L["Nargo Screwbore"] = "納爾高·螺孔"
-- wg2wg:
L["Harrowmeiser"] = "哈洛梅瑟"
-- tb2org:
L["Krendle Bigpockets"] = true -- to do
L["Zelli Hotnozzle"] = true -- to do
L["Sky-Captain \"Dusty\" Blastnut"] = true -- to do
L["Watcher Tolwe"] = true -- to do

-- ship names
L["The Thundercaller"] = "喚雷者號"
L["The Iron Eagle"] = "鋼鐵雄鷹號"
L["The Purple Princess"] = "紫色公主號"
L["The Maiden's Fancy"] = "少女之愛號"
L["The Bravery"] = "勇氣號"
L["The Lady Mehley"] = "梅利女士號"
L["The Moonspray"] = "月霧號"
L["Feathermoon Ferry"] = "羽月渡口"
L["Elune's Blessing"] = "伊露恩祝福號"
L["The Mighty Wind"] = "強風號"
L["Cloudkisser"] = "拂雲號"
L["Walker of Waves"] = "波濤行者"
L["Green Island"] = "綠島"
L["The Kraken"] = "海怪號"
L["Northspear"] = "北矛號"
L["Captured Zeppelin"] = "被俘虜的飛艇"
L["The Zephyr"] = true -- to do

-- zones (*must* strictly match the in-game name)
L["Orgrimmar"] = "奧格瑪"
L["Undercity"] = "幽暗城"
L["The Exodar"] = "艾克索達"
L["Stormwind City"] = "暴風城"
L["Thunder Bluff"] = true -- to do

L["Durotar"] = "杜洛塔"
L["Tirisfal Glades"] = "提里斯法林地"
L["Northern Stranglethorn"] = true -- to do
L["The Cape of Stranglethorn"] = true -- to do
L["Northern Barrens"] = true -- to do
L["Southern Barrens"] = true -- to do
L["Wetlands"] = "濕地"
L["Dustwallow Marsh"] = "塵泥沼澤"
L["Teldrassil"] = "泰達希爾"
L["Azuremyst Isle"] = "藍謎島"
L["Elwynn Forest"] = true -- to do
L["Westfall"] = "西部荒野"
L["Borean Tundra"] = "北風凍原"
L["Howling Fjord"] = "凜風峽灣"
L["Dragonblight"] = "龍骨荒野"
L["Mulgore"] = true -- to do

L["The Veiled Sea"] = "迷霧之海"
L["Twisting Nether"] = "扭曲虛空"
L["The Frozen Sea"] = "冰凍之海"
L["The Great Sea"] = true -- to do

-- subzones
L["Grom'gol"] = "格羅姆高營地"
L["Booty Bay"] = "藏寶海灣"
L["Ratchet"] = "棘齒城"
L["Menethil Harbor"] = "米奈希爾港"
L["Theramore"] = "塞拉摩島"
L["Rut'Theran Village"] = "魯瑟蘭村"
L["Warsong Hold"] = "戰歌堡"
L["Vengeance Landing"] = "復仇臺地"
L["Valiance Keep"] = "驍勇要塞"
L["Valgarde"] = "瓦爾加德"
L["Unu'pe"] = "昂紐沛"
L["Moa'ki Harbor"] = "默亞基港"
L["Kamagua"] = "卡瑪廓"
L["Westguard Keep"] = "鎮西要塞"

-- abbreviations
L["Org"] = "奧格"   -- Orgrimmar
L["UC"]  = "幽暗"   -- Undercity
L["Exo"] = "艾克"   -- The Exodar
L["SC"]  = "暴風"   -- Stormwind City
L["TB"]  = true     -- to do; Thunder Bluff

L["GG"]  = "格羅姆高" -- Grom'gol
L["BB"]  = "藏寶"   -- Booty Bay
L["Rat"] = "棘齒"   -- Ratchet
L["MH"]  = "米奈希爾" -- Menethil Harbor
L["Th"]  = "塞拉摩"  -- Theramore
L["RTV"] = "魯瑟蘭"  -- Rut'Theran Village
L["War"] = "戰歌"   -- Warsong Hold
L["Ven"] = "復仇"   -- Vengeance Landing
L["VK"]  = "驍勇"   -- Valiance Keep
L["VG"]  = "瓦爾加德" -- Valgarde
L["Unu"] = "昂紐沛"  -- Unu'pe
L["Moa"] = "默亞基"  -- Moa'ki Harbor
L["Kam"] = "瑪廓"   -- Kamagua
L["WGK"] = "鎮西"   -- Westguard Keep
