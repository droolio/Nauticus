
local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

-- Russian localisation by Yuris Auzinsh (Zuz666)
L:RegisterTranslations("ruRU", function() return {

-- options
["Options"] = "Настройки",
-- TO DO:
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
["Arrival"] = "Прибытие",
["Departure"] = "Отправка",
["Arr"] = "Пр.", -- abbreviation for Arrival
["Dep"] = "От.", -- abbreviation for Departure
["Select Transport"] = "Выбрать транспорт",
["Select None"] = "Снять выделение",
["No Transport Selected"] = "Не выбран транспорт",
["Not Available"] = "Не доступно",
["N/A"] = "Н/Д", -- abbreviation for Not Available
["Nauticus Options"] = "Настройки Nauticus",
["Daily: "] = "Ежедневно: ",

["Show only transports for your faction"] = "Показывать транспорт только для своей фракции",
["Shows only neutral and transports specific to your faction."] = "Будет отображаться нейтральный транспорт и своей фракции.",
["Show only transports in your current zone"] = "Показывать транспорт только для текущей зоны",
["Shows only transports in your current zone."] = "Будет отображаеться транспорт только для текущей зоны.",
["Hint: Click to cycle transport. Alt-Click to set up alarm"] = "Хинт: Левый клик для циклического переключения. Alt-клик для включения напоминалки",
["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."] = "Доступна новая версия Nauticus! Обновление здесь http://www.wowace.com/projects/nauticus (http://drool.me.uk/naut.)",
["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."] = "Вы использовали старую версию Nauticus более 10 дней, ваши данные больше не будут передаваться другим пользователям Nauticus",
["Thank you for upgrading."] = "Спасибо, за обновление.",

-- list of ship crew npc's to filter from chat (*must* strictly match the in-game name)
-- org2uc:
["Frezza"] = "Фрезза",
["Zapetta"] = "Запота",
["Sky-Captain Cloudkicker"] = "Небесный капитан Пниоблако",
["Chief Officer Coppernut"] = "Старший офицер Медношайб",
["Navigator Fairweather"] = "Штурман Чистонеббс",
-- uc2gg:
["Hin Denburg"] = "Гин Денбург",
["Navigator Hatch"] = "Штурман Шлюз",
["Chief Officer Hammerflange"] = "Старший офицер Реброфланец",
["Sky-Captain Cableclamp"] = "Небесный капитан Крепитросс",
-- org2gg:
["Snurk Bucksquick"] = "Снорк Следопутка",
-- mh2ther:
["Captain \"Stash\" Torgoley"] = "Капитан Торголи \"Заначка\"",
["First Mate Kowalski"] = "Первый помощник Ковальски",
["Navigator Mehran"] = "Штурман Меран",
-- uc2ven
["Meefi Farthrottle"] = "Мифи \"Поддай газу\"",
["Drenk Spannerspark"] = "Дренк Шестериск",
-- war2org
["Greeb Ramrocket"] = "Гриб Ракетокрыл",
["Nargo Screwbore"] = "Нарго Вертокрут",

-- ship names
["The Thundercaller"] = "Призыватель грома",
["The Iron Eagle"] = "Железный Орел",
["The Purple Princess"] = "Лиловая принцесса",
["The Maiden's Fancy"] = "Девичий каприз",
["The Bravery"] = "Доблесть",
["The Lady Mehley"] = "Леди Мели",
["The Moonspray"] = "Лунная пыль",
["Feathermoon Ferry"] = "Переправа Оперенной Луны",
["Elune's Blessing"] = "Благословение Элуны",
["The Mighty Wind"] = "Ураган",
["Cloudkisser"] = "Поцелуй небес",
["Walker of Waves"] = "Идущая-по-волнам",
["Green Island"] = "Зеленый остров",
["The Kraken"] = "Кракен",
["Northspear"] = "Северное копье",
["Captured Zeppelin"] = true, -- to do

-- zones (*must* strictly match the in-game name)
["Orgrimmar"] = "Оргриммар",
["Undercity"] = "Подгород",
["The Exodar"] = "Экзодар",
["Stormwind City"] = "Штормград",

["Durotar"] = "Дуротар",
["Tirisfal Glades"] = "Тирисфальские леса",
["Stranglethorn Vale"] = "Тернистая долина",
["The Barrens"] = "Степи",
["Wetlands"] = "Болотина",
["Darkshore"] = "Темные берега",
["Dustwallow Marsh"] = "Пылевые топи",
["Teldrassil"] = "Тельдрассил",
["Azuremyst Isle"] = "Остров Лазурной Дымки",
["Feralas"] = "Фералас",
["Westfall"] = "Западный Край",
["Borean Tundra"] = "Борейская тундра",
["Howling Fjord"] = "Ревущий фьорд",
["Dragonblight"] = "Драконий Погост",

["The Veiled Sea"] = "Сокрытое Море",
["Twisting Nether"] = "Круговерть Пустоты",
["The Frozen Sea"] = "Ледяное море",

-- subzones
["Grom'gol"] = "Лагерь Гром'гол",
["Booty Bay"] = "Пиратская Бухта",
["Ratchet"] = "Кабестан",
["Menethil Harbor"] = "Гавань Менетил",
["Auberdine"] = "Аубердин",
["Theramore"] = "Остров Терамор",
["Rut'Theran Village"] = "Деревня Рут'теран",
["Sardor Isle"] = "Остров Сардор",
["Feathermoon"] = "Крепость Оперенной Луны",
["Forgotten Coast"] = "Забытый берег",
["Warsong Hold"] = "Крепость Песни Войны",
["Vengeance Landing"] = "Лагерь Возмездия",
["Valiance Keep"] = "Крепость Отваги",
["Valgarde"] = "Валгард",
["Unu'pe"] = "Уну'пе",
["Moa'ki Harbor"] = "Гавань Моа'ки",
["Kamagua"] = "Камагуа",
["Westguard Keep"] = "Крепость Западной Стражи",

-- abbreviations
["Org"]	= "Орг", -- Orgrimmar
["UC"]	= "ПГ",  -- Undercity
["Exo"]	= "Экз", -- The Exodar
["SC"]	= "Шт",  -- Stormwind City

["GG"]  = "ГГ",  -- Grom'gol
["BB"]  = "ББ",  -- Booty Bay
["Rat"] = "Каб", -- Ratchet
["MH"]  = "ГМ",  -- Menethil Harbor
["Aub"] = "Ауб", -- Auberdine
["Th"]  = "Тр",  -- Theramore
["RTV"] = "ДРТ", -- Rut'Theran Village
["FMS"] = "КОЛ", -- Feathermoon
["Fer"] = "Фер", -- Feralas
["War"] = "КПВ", -- Warsong Hold
["Ven"] = "ЛВ",  -- Vengeance Landing
["VK"]  = "КО",  -- Valiance Keep
["VG"]  = "Вал", -- Valgarde
["Unu"] = "Уну", -- Unu'pe
["Moa"] = "Моа", -- Moa'ki Harbor
["Kam"] = "Кам", -- Kamagua
["WGK"] = "КЗС", -- Westguard Keep

} end)
