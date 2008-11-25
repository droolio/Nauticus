
local L = AceLibrary("AceLocale-2.2"):new("Nauticus")

L:RegisterTranslations("ruRU", function() return {

-- general
["Save"] = "Сохранить",
["Close"] = "Закрыть",
["Minimise"] = "Развернуть",
["Maximise"] = "Свернуть",
["Options"] = "Настройки",

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

["Show GUI when zone change contains a transport"] = "Show GUI when zone change contains a transport", -- rare ???
["Show only transports for your faction"] = "Показывать транспорт только для своей фракции",
["Shows only neutral and transports specific to your faction."] = "Будет отображаться нейтральный транспорт и своей фракции.",
["Show only transports in your current zone"] = "Показывать транспорт только для текущей зоны",
["Shows only transports in your current zone."] = "Будет отображаеться транспорт только для текущей зоны.",
["Hint: Click to cycle transport. Alt-Click to set up alarm"] = "Хинт: Левый клик для циклического переключения. Alt-клик для включения напоминалки",
["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."] = "Доступна новая версия Nauticus! Обновление здесь http://www.wowace.com/projects/nauticus (http://drool.me.uk/naut.)",
["Type /nauticus or /naut gui show to show again."] = "Наберите /nauticus для отображения команд.", -- rare ???
["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."] = "Вы использовали старую версию Nauticus более 10 дней, ваши данные больше не будут передаваться другим пользователям Nauticus",
["Thank you for upgrading."] = "Спасибо, за обновление.",

-- zones
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
["Org"]	= "Орг",	-- Orgrimmar
["UC"]	= "ПГ",		-- Undercity
["Exo"]	= "Экз",	-- The Exodar
["SC"]	= "Шт",		-- Stormwind City

["GG"]  = "ГГ",		-- Grom'gol
["BB"]  = "ББ",		-- Booty Bay
["Rat"] = "Каб",	-- Ratchet
["MH"]  = "ГМ",		-- Menethil Harbor
["Aub"] = "Ауб",	-- Auberdine
["Th"]  = "Тр",		-- Theramore
["RTV"] = "ДРТ",	-- Rut'Theran Village
["FMS"] = "КОЛ",	-- Feathermoon
["Fer"] = "Фер",	-- Feralas
["War"] = "КПВ",	-- Warsong Hold
["Ven"] = "ЛВ", 	-- Vengeance Landing
["VK"]  = "КО", 	-- Valiance Keep
["VG"]  = "Вал",	-- Valgarde
["Unu"] = "Уну",	-- Unu'pe
["Moa"] = "Моа",	-- Moa'ki Harbor
["Kam"] = "Кам",	-- Kamagua
["WGK"] = "КЗС",	-- Westguard Keep

} end)
