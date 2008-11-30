
-- Russian localisation by Yuris Auzinsh (Zuz666)
local L = LibStub("AceLocale-3.0"):NewLocale("Nauticus", "ruRU", true)
if not L then return; end

-- options
L["Options"] = "Настройки"
L["Icons"] = "Иконки"
L["Icon options."] = "Настройки иконок."
L["Show icons"] = "Показывать иконки"
L["Toggle on/off map icons."] = "Включить/выключить иконки на карте."
L["Mini-Map icon size"] = "Размер иконок на миникарте"
L["Change the size of the Mini-Map icons."] = "Изменение размера иконок на миникарте."
L["World Map icon size"] = "Размер иконок на карте мира"
L["Change the size of the World Map icons."] = "Изменение размера иконок на карте мира."
L["Auto select transport"] = "Автоматически выбирать транспорт"
L["Automatically select nearest transport when standing at platform."] = "Автоматически выбирать ближайший к платформе транспорт."
L["Crew chat filter"] = "Чат фильтр речи экипажа"
L["Toggle on/off chat filter for yelling crew spam."] = "Включить/выключить отображение речи экипажа на транспорте."
L["Alarm delay"] = "Задержка напоминалки"
L["Change the alarm delay (in seconds)."] = "Изменение задержки напоминалки (в секундах)."

-- miscellaneous
L["Arrival"] = "Прибытие"
L["Departure"] = "Отправка"
L["Arr"] = "Пр." -- abbreviation for Arrival
L["Dep"] = "От." -- abbreviation for Departure
L["Select Transport"] = "Выбрать транспорт"
L["Select None"] = "Снять выделение"
L["No Transport Selected"] = "Не выбран транспорт"
L["Not Available"] = "Не доступно"
L["N/A"] = "Н/Д" -- abbreviation for Not Available
L["Nauticus Options"] = "Настройки Nauticus"
L["Alarm is now: "] = "Напоминалка: "
L["ON"] = "Вкл."
L["OFF"] = "Выкл."
L["Daily: "] = "Ежедневно: "

L["Show only transports for your faction"] = "Показывать транспорт только для своей фракции"
L["Shows only neutral and transports specific to your faction."] = "Будет отображаться нейтральный транспорт и своей фракции."
L["Show only transports in your current zone"] = "Показывать транспорт только для текущей зоны"
L["Shows only transports in your current zone."] = "Будет отображаться транспорт только для текущей зоны."
L["Hint: Click to cycle transport. Alt-Click to set up alarm"] = "Хинт: Левый клик для циклического переключения. Alt-клик для включения напоминалки"
L["There is a new version of Nauticus available! Please visit http://drool.me.uk/naut."] = "Доступна новая версия Nauticus! Обновление здесь http://drool.me.uk/naut."
L["You have been using an old version of Nauticus for more than 10 days, outbound communications will now be disabled."] = "Вы использовали старую версию Nauticus более 10 дней, ваши данные больше не будут передаваться другим пользователям Nauticus"
L["Thank you for upgrading."] = "Спасибо, за обновление."

-- list of ship crew npc's to filter from chat (*must* strictly match the in-game name)
-- org2uc:
L["Frezza"] = "Фрезза"
L["Zapetta"] = "Запота"
L["Sky-Captain Cloudkicker"] = "Небесный капитан Пниоблако"
L["Chief Officer Coppernut"] = "Старший офицер Медношайб"
L["Navigator Fairweather"] = "Штурман Чистонеббс"
-- uc2gg:
L["Hin Denburg"] = "Гин Денбург"
L["Navigator Hatch"] = "Штурман Шлюз"
L["Chief Officer Hammerflange"] = "Старший офицер Реброфланец"
L["Sky-Captain Cableclamp"] = "Небесный капитан Крепитросс"
-- org2gg:
L["Snurk Bucksquick"] = "Снорк Следопутка"
-- mh2ther:
L["Captain \"Stash\" Torgoley"] = "Капитан Торголи \"Заначка\""
L["First Mate Kowalski"] = "Первый помощник Ковальски"
L["Navigator Mehran"] = "Штурман Меран"
-- uc2ven
L["Meefi Farthrottle"] = "Мифи \"Поддай газу\""
L["Drenk Spannerspark"] = "Дренк Шестериск"
-- war2org
L["Greeb Ramrocket"] = "Гриб Ракетокрыл"
L["Nargo Screwbore"] = "Нарго Вертокрут"
-- wg2wg:
L["Harrowmeiser"] = "Боронайзер"

-- ship names
L["The Thundercaller"] = "Призыватель грома"
L["The Iron Eagle"] = "Железный Орел"
L["The Purple Princess"] = "Лиловая принцесса"
L["The Maiden's Fancy"] = "Девичий каприз"
L["The Bravery"] = "Доблесть"
L["The Lady Mehley"] = "Леди Мели"
L["The Moonspray"] = "Лунная пыль"
L["Feathermoon Ferry"] = "Переправа Оперенной Луны"
L["Elune's Blessing"] = "Благословение Элуны"
L["The Mighty Wind"] = "Ураган"
L["Cloudkisser"] = "Поцелуй небес"
L["Walker of Waves"] = "Идущая-по-волнам"
L["Green Island"] = "Зеленый остров"
L["The Kraken"] = "Кракен"
L["Northspear"] = "Северное копье"
L["Captured Zeppelin"] = "Захваченный дирижабль" -- check

-- zones (*must* strictly match the in-game name)
L["Orgrimmar"] = "Оргриммар"
L["Undercity"] = "Подгород"
L["The Exodar"] = "Экзодар"
L["Stormwind City"] = "Штормград"

L["Durotar"] = "Дуротар"
L["Tirisfal Glades"] = "Тирисфальские леса"
L["Stranglethorn Vale"] = "Тернистая долина"
L["The Barrens"] = "Степи"
L["Wetlands"] = "Болотина"
L["Darkshore"] = "Темные берега"
L["Dustwallow Marsh"] = "Пылевые топи"
L["Teldrassil"] = "Тельдрассил"
L["Azuremyst Isle"] = "Остров Лазурной Дымки"
L["Feralas"] = "Фералас"
L["Westfall"] = "Западный Край"
L["Borean Tundra"] = "Борейская тундра"
L["Howling Fjord"] = "Ревущий фьорд"
L["Dragonblight"] = "Драконий Погост"

L["The Veiled Sea"] = "Сокрытое Море"
L["Twisting Nether"] = "Круговерть Пустоты"
L["The Frozen Sea"] = "Ледяное море"

-- subzones
L["Grom'gol"] = "Лагерь Гром'гол"
L["Booty Bay"] = "Пиратская Бухта"
L["Ratchet"] = "Кабестан"
L["Menethil Harbor"] = "Гавань Менетил"
L["Auberdine"] = "Аубердин"
L["Theramore"] = "Остров Терамор"
L["Rut'Theran Village"] = "Деревня Рут'теран"
L["Sardor Isle"] = "Остров Сардор"
L["Feathermoon"] = "Крепость Оперенной Луны"
L["Forgotten Coast"] = "Забытый берег"
L["Warsong Hold"] = "Крепость Песни Войны"
L["Vengeance Landing"] = "Лагерь Возмездия"
L["Valiance Keep"] = "Крепость Отваги"
L["Valgarde"] = "Валгард"
L["Unu'pe"] = "Уну'пе"
L["Moa'ki Harbor"] = "Гавань Моа'ки"
L["Kamagua"] = "Камагуа"
L["Westguard Keep"] = "Крепость Западной Стражи"

-- abbreviations
L["Org"] = "Орг" -- Orgrimmar
L["UC"]  = "ПГ"  -- Undercity
L["Exo"] = "Экз" -- The Exodar
L["SC"]  = "Шт"  -- Stormwind City

L["GG"]  = "ГГ"  -- Grom'gol
L["BB"]  = "ББ"  -- Booty Bay
L["Rat"] = "Каб" -- Ratchet
L["MH"]  = "ГМ"  -- Menethil Harbor
L["Aub"] = "Ауб" -- Auberdine
L["Th"]  = "Тр"  -- Theramore
L["RTV"] = "ДРТ" -- Rut'Theran Village
L["FMS"] = "КОЛ" -- Feathermoon
L["Fer"] = "Фер" -- Feralas
L["War"] = "КПВ" -- Warsong Hold
L["Ven"] = "ЛВ"  -- Vengeance Landing
L["VK"]  = "КО"  -- Valiance Keep
L["VG"]  = "Вал" -- Valgarde
L["Unu"] = "Уну" -- Unu'pe
L["Moa"] = "Моа" -- Moa'ki Harbor
L["Kam"] = "Кам" -- Kamagua
L["WGK"] = "КЗС" -- Westguard Keep
