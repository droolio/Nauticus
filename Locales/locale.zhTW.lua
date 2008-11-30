
-- Chinese traditional localisation by Juha
local L = LibStub("AceLocale-3.0"):NewLocale("Nauticus", "zhTW", true)
if not L then return; end

-- options
L["Options"] = "選項"
L["Icons"] = "圖示"
L["Icon options."] = "圖示選項。"
L["Show icons"] = "顯示圖示"
L["Toggle on/off map icons."] = "開啟/關閉 地圖圖示。"
L["Mini-Map icon size"] = "小地圖圖示大小"
L["Change the size of the Mini-Map icons."] = "變更小地圖圖示的大小。"
L["World Map icon size"] = "世界地圖圖示大小"
L["Change the size of the World Map icons."] = "變更世界地圖圖示大小。"
L["Auto select transport"] = "自動選擇傳輸點"
L["Automatically select nearest transport when standing at platform."] = "當你站在月台時自動選擇距你最近的傳輸點"
L["Crew chat filter"] = "過濾工作人員喊話"
L["Toggle on/off chat filter for yelling crew spam."] = "開啟/關閉 過濾工作人員喊話訊息。"
L["Alarm delay"] = "警示延遲"
L["Change the alarm delay (in seconds)."] = "變更警示延遲（秒）"

-- miscellaneous
L["Arrival"] = "抵達"
L["Departure"] = "出發"
L["Arr"] = "抵達" -- abbreviation for Arrival
L["Dep"] = "出發" -- abbreviation for Departure
L["Select Transport"] = "選擇路線"
L["Select None"] = "選擇-無"
L["No Transport Selected"] = "沒有選擇路線"
L["Not Available"] = "無有效計時"
L["N/A"] = "--" -- abbreviation for Not Available
L["Nauticus Options"] = "Nauticus 選項"
L["Alarm is now: "] = "警示現在"
L["ON"] = "啟用"
L["OFF"] = "關閉"
L["Daily: "] = "每日: "

L["Show only transports for your faction"] = "只顯示玩家陣營可用的運輸點"
L["Shows only neutral and transports specific to your faction."] = "只顯示中立以及玩家陣營可用的傳輸點"
L["Show only transports in your current zone"] = "只顯示你目前區域可用的傳輸點"
L["Shows only transports in your current zone."] = "只顯示你目前區域可用的傳輸點"
L["Hint: Click to cycle transport. Alt-Click to set up alarm"] = "提示: 左鍵：運輸週期 Alt+左鍵：設定鬧鈴"
L["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."] = "有新版的 Nauticus 釋出！ 請訪問 http://drool.me.uk/naut."
L["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."] = "你已使用的是舊版的 Nauticus 超過 10 天了，同步訊息輸出現在將會關閉。"
L["Thank you for upgrading."] = "感謝你更新版本。"

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

-- zones (*must* strictly match the in-game name)
L["Orgrimmar"] = "奧格瑪"
L["Undercity"] = "幽暗城"
L["The Exodar"] = "艾克索達"
L["Stormwind City"] = "暴風城"

L["Durotar"] = "杜洛塔"
L["Tirisfal Glades"] = "提里斯法林地"
L["Stranglethorn Vale"] = "荊棘谷"
L["The Barrens"] = "貧瘠之地"
L["Wetlands"] = "濕地"
L["Darkshore"] = "黑海岸"
L["Dustwallow Marsh"] = "塵泥沼澤"
L["Teldrassil"] = "泰達希爾"
L["Azuremyst Isle"] = "藍謎島"
L["Feralas"] = "菲拉斯"
L["Westfall"] = "西部荒野"
L["Borean Tundra"] = "北風凍原"
L["Howling Fjord"] = "凜風峽灣"
L["Dragonblight"] = "龍骨荒野"

L["The Veiled Sea"] = "迷霧之海"
L["Twisting Nether"] = "扭曲虛空"
L["The Frozen Sea"] = "冰凍之海"

-- subzones
L["Grom'gol"] = "格羅姆高營地"
L["Booty Bay"] = "藏寶海灣"
L["Ratchet"] = "棘齒城"
L["Menethil Harbor"] = "米奈希爾港"
L["Auberdine"] = "奧伯丁"
L["Theramore"] = "塞拉摩島"
L["Rut'Theran Village"] = "魯瑟蘭村"
L["Sardor Isle"] = "薩爾多島"
L["Feathermoon"] = "羽月要塞"
L["Forgotten Coast"] = "被遺忘的海岸"
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

L["GG"]  = "格羅姆高" -- Grom'gol
L["BB"]  = "藏寶"   -- Booty Bay
L["Rat"] = "棘齒"   -- Ratchet
L["MH"]  = "米奈希爾" -- Menethil Harbor
L["Aub"] = "奧伯丁"  -- Auberdine
L["Th"]  = "塞拉摩"  -- Theramore
L["RTV"] = "魯瑟蘭"  -- Rut'Theran Village
L["FMS"] = "羽月"   -- Feathermoon
L["Fer"] = "遺忘海岸" -- Feralas
L["War"] = "戰歌"   -- Warsong Hold
L["Ven"] = "復仇"   -- Vengeance Landing
L["VK"]  = "驍勇"   -- Valiance Keep
L["VG"]  = "瓦爾加德" -- Valgarde
L["Unu"] = "昂紐沛"  -- Unu'pe
L["Moa"] = "默亞基"  -- Moa'ki Harbor
L["Kam"] = "瑪廓"   -- Kamagua
L["WGK"] = "鎮西"   -- Westguard Keep
