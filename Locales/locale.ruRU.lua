
-- Russian localisation by Yuris Auzinsh (Zuz666)
local L = LibStub("AceLocale-3.0"):NewLocale("Nauticus", "ruRU")
if not L then return; end

-- addon description
L["Tracks the precise arrival & departure schedules of boats and Zeppelins around Azeroth and displays them on the Mini-Map and World Map in real-time."] = "Следит за прибытием и отправлением кораблей и дирижаблей в Азероте и показывает их на миникарте и карте мира."

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
L["Options"] = "Настройки"
L["General Settings"] = "Основные настройки"
L["Map Icons"] = "Отображение иконок"
L["Options for displaying transports as icons on the Mini-Map and World Map."] = "Настройка отображения транспорта на миникарте и карте мира."
L["Show on Mini-Map"] = "Показать на миникарте"
L["Toggle display of icons on the Mini-Map."] = "Управляет отображением иконок на миникарте."
L["Show on World Map"] = "Показать на карте мира"
L["Toggle display of icons on the World Map."] = "Управляет отображением иконок на карте мира."
L["Mini-Map icon size"] = "Размер иконок на миникарте"
L["Change the size of the Mini-Map icons."] = "Изменение размера иконок на миникарте."
L["World Map icon size"] = "Размер иконок на карте мира"
L["Change the size of the World Map icons."] = "Изменение размера иконок на карте мира."
L["Faction only"] = "Своя фракция"
L["Hide transports of opposite faction from the map, showing only neutral and those of your faction."] = "Скрывает отображение транспорта противоположной фракции с карты и показывает только нейтральный транспорт и твоей фракции."
L["Auto select transport"] = "Автовыбор транспорта"
L["Automatically select nearest transport when standing at platform."] = "Автоматически выбирать транспорт ближайший к платформе, на которой стоишь."
L["Crew chat filter"] = "Фильтр речи экипажа"
L["Toggle the filter for removing ship crew talk and Zeppelin Master yells from the chat window."] = "Управление фильтром убирающим речь экипажа корабля и крики Хозяина дирижабля из окна чата."
L["Alarm delay"] = "Задержка напоминалки"
L["Change the alarm delay (in seconds)."] = "Изменение задержки напоминалки (в секундах)."
L["Mini-Map button"] = "Кнопка миникарты"
L["Toggle the Mini-Map button."] = "Управление кнопкой миникарты"

-- miscellaneous
L["Arrival"] = "Прибытие"
L["Departure"] = "Отправка"
L["Select Transport"] = "Выбрать транспорт"
L["Select None"] = "Снять выделение"
L["No Transport Selected"] = "Не выбран транспорт"
L["Not Available"] = "Не доступно"
L["N/A"] = "Н/Д" -- abbreviation for Not Available
L["Nauticus Options"] = "Настройки Nauticus"
L["Alarm is now: "] = "Напоминалка: "
L["ON"] = "Вкл."
L["OFF"] = "Выкл."

L["List friendly faction only"] = "Список только для дружественных фракций"
L["Shows only neutral transports and those of your faction."] = "Показывать только нейтральный транспорт и своей фракции."
L["List relevant to current zone only"] = "Список релевантный текущей зоне"
L["Shows only transports relevant to your current zone."] = "Показывать только транспорт релевантный текущей зоне."
L["Hint: Click to cycle transport. Alt-Click to set up alarm"] = "Хинт: Левый клик мыши для циклического переключения транспорта. Alt-клик для установки напоминалки."
L["New version available! Visit www.drool.me.uk/naut"] = "Доступна новая версия Nauticus! Забрать можно здесь www.drool.me.uk/naut"

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
L["Captured Zeppelin"] = "Захваченный дирижабль"
L["The Zephyr"] = true -- to do

-- zones (*must* strictly match the in-game name)
L["Orgrimmar"] = "Оргриммар"
L["Undercity"] = "Подгород"
L["The Exodar"] = "Экзодар"
L["Stormwind City"] = "Штормград"
L["Thunder Bluff"] = true -- to do

L["Durotar"] = "Дуротар"
L["Tirisfal Glades"] = "Тирисфальские леса"
L["Northern Stranglethorn"] = true -- to do
L["The Cape of Stranglethorn"] = true -- to do
L["Northern Barrens"] = true -- to do
L["Southern Barrens"] = true -- to do
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
L["Mulgore"] = true -- to do

L["The Veiled Sea"] = "Сокрытое Море"
L["Twisting Nether"] = "Круговерть Пустоты"
L["The Frozen Sea"] = "Ледяное море"
L["The Great Sea"] = true -- to do

-- subzones
L["Grom'gol"] = "Лагерь Гром'гол"
L["Booty Bay"] = "Пиратская Бухта"
L["Ratchet"] = "Кабестан"
L["Menethil Harbor"] = "Гавань Менетил"
L["Theramore"] = "Остров Терамор"
L["Rut'Theran Village"] = "Деревня Рут'теран"
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
L["TB"]  = true  -- to do; Thunder Bluff

L["GG"]  = "ГГ"  -- Grom'gol
L["BB"]  = "ББ"  -- Booty Bay
L["Rat"] = "Каб" -- Ratchet
L["MH"]  = "ГМ"  -- Menethil Harbor
L["Th"]  = "Тр"  -- Theramore
L["RTV"] = "ДРТ" -- Rut'Theran Village
L["War"] = "КПВ" -- Warsong Hold
L["Ven"] = "ЛВ"  -- Vengeance Landing
L["VK"]  = "КО"  -- Valiance Keep
L["VG"]  = "Вал" -- Valgarde
L["Unu"] = "Уну" -- Unu'pe
L["Moa"] = "Моа" -- Moa'ki Harbor
L["Kam"] = "Кам" -- Kamagua
L["WGK"] = "КЗС" -- Westguard Keep
