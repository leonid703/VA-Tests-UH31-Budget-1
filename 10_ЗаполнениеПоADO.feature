﻿#language: ru

@tree

Функционал: 10. Расчет показателей с заполнением по ADO

Как Администратор я хочу
Проверить, что данные по ADO загружаются в экземпляры отчетов

Контекст: 

	И я подключаю TestClient "УХ - Бюджетирование" логин "Администратор" пароль ""
	И я закрыл все окна клиентского приложения

Сценарий: 10.00 Определение типа приложения

	И Я запоминаю значение выражения 'ИдентификацияПродуктаУХКлиентСервер.ЭтоУправлениеХолдингом() И НЕ ИдентификацияПродуктаУХКлиентСервер.ЭтоЕХ()' в переменную "$$ЭтоУХ$$"
	И Я запоминаю значение выражения 'ИдентификацияПродуктаУХКлиентСервер.ЭтоУправлениеХолдингом() И ИдентификацияПродуктаУХКлиентСервер.ЭтоЕХ()' в переменную "$$ЭтоЕРПУХ$$"

Сценарий: 10.01 Загрузка методической модели

	* Определим версию приложения 
		И я запоминаю версию конфигурации "УправлениеХолдингом" как "Версия"	

	* Загрузка модели
		И В командном интерфейсе я выбираю 'Бюджетирование, отчетность и анализ' 'Выгрузка и загрузка методических моделей'
		Тогда открылось окно 'Обмен методическими моделями'
		И я перехожу к закладке с именем "ГруппаЗагрузка"
		Если '$$ЭтоУХ$$' Тогда
			Если 'Лев($Версия$,3) = "3.1"' тогда
				И в поле с именем 'ИмяФайлаЗагрузки' я ввожу текст "$КаталогПроекта$\Макеты\ADO\Model_ADO_УХ31.xml"
			Если 'Лев($Версия$,3) = "3.2"' тогда
				И в поле с именем 'ИмяФайлаЗагрузки' я ввожу текст "$КаталогПроекта$\Макеты\ADO\Model_ADO_УХ32.xml"	
		Если '$$ЭтоЕРПУХ$$' Тогда
			И в поле с именем 'ИмяФайлаЗагрузки' я ввожу текст "$КаталогПроекта$\Макеты\ADO\Model_ADO_ERP.xml"
		И я нажимаю на кнопку с именем 'ЗагрузитьДанные'
		И Пауза 10
		Дано В последнем сообщении TestClient есть строка "Загрузка данных успешно завершена"
		И Я закрываю окно 'Обмен методическими моделями'

	* Ищем отчет с именем "ВА - Тест загрузки по ADO"
		И В командном интерфейсе я выбираю 'Бюджетирование, отчетность и анализ' 'Виды и бланки отчетов'
		Тогда открылось окно 'Виды и бланки отчетов'
		И в таблице "СписокВидовОтчетов" я нажимаю на кнопку с именем 'СписокВидовОтчетовНайти'
		Тогда открылось окно 'Найти'
		И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'Вид отчета'
		И я меняю значение переключателя с именем 'CompareType' на 'По части строки'
		И в поле с именем 'Pattern' я ввожу текст 'ВА - Тест загрузки по ADO'
		И я нажимаю на кнопку с именем 'Find'
		И я жду, что в таблице "СписокВидовОтчетов" количество строк будет "равно" 1 в течение 20 секунд
	
	* Устанавливаем группу отчетов
		И в таблице "СписокВидовОтчетов" я выбираю текущую строку
		Тогда открылось окно 'ВА - Тест загрузки по ADO (Виды отчетов)'
		И из выпадающего списка с именем "Родитель" я выбираю по строке 'ВА - Группа отчетов'
		И я нажимаю на кнопку с именем 'ФормаКнопкаЗаписать'

	* Настроим соответствия имен файлов
		Когда открылось окно 'ВА - Тест загрузки по ADO (Виды отчетов)'
		И я перехожу к закладке с именем "НастройкиПоУмолчанию"
		И я нажимаю на кнопку открытия поля с именем "ПравилоОбработкиПоУмолчанию"
		Тогда открылось окно 'ВА - Тест загрузки по ADO (Правила расчета)'
		И я нажимаю на кнопку открытия поля с именем "ТипБД"
		Тогда открылось окно 'ВА - Таблицы АДО (Тип информационной базы)'
		И я нажимаю на кнопку открытия поля с именем "ВИБПоУмолчанию"
		Тогда открылось окно 'ВА - Таблицы АДО (Внешние информационные базы)'
		И в поле с именем 'ЭталонныйКаталог' я ввожу текст '$КаталогПроекта$\Макеты\ADO'
		И в поле с именем 'НачалоИмени' я ввожу текст '$КаталогПроекта$\Макеты\ADO'
	
		* Добавляем или обновляем запись в РС
			И я нажимаю на кнопку с именем 'ОткрытьНастройкиОбменаФайламиОрганизаций'
			Тогда открылось окно 'Элементы пути к файлам организационных единиц: Форма списка'
			И я перехожу к закладке с именем "Страница_ВидОтчета"
			Когда открылось окно 'Элементы пути к файлам организационных единиц: Форма списка'
			И в таблице "Список_ВидОтчета" я нажимаю на кнопку с именем 'Список_ВидОтчетаНайти'
			Тогда открылось окно 'Найти'
			И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'Объект'						
			И в поле с именем 'Pattern' я ввожу текст 'ВА - Тест загрузки по ADO'
			И я нажимаю на кнопку с именем 'Find'
			Тогда открылось окно 'Элементы пути к файлам организационных единиц: Форма списка'
			Если в таблице "Список_ВидОтчета" количество строк "равно" 0 Тогда
				И в таблице "Список_ВидОтчета" я нажимаю на кнопку с именем 'Список_ВидОтчетаСоздать'
			Иначе
				И в таблице "Список_ВидОтчета" я выбираю текущую строку								
			Тогда открылось окно 'Имена файлов и каталогов*'
			И из выпадающего списка с именем "Объект" я выбираю по строке 'ВА - Тест загрузки по ADO'
			И в поле с именем 'Имя' я ввожу текст 'ВА_ЗагрузкаADO'
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна 'Имена файлов и каталогов*' в течение 20 секунд
		
		* Проверяем подключение
			Когда открылось окно 'Элементы пути к файлам организационных единиц: Форма списка'
			И Я закрываю окно 'Элементы пути к файлам организационных единиц: Форма списка'
			Тогда открылось окно 'ВА - Таблицы АДО (Внешние информационные базы) *'
			И я нажимаю на кнопку с именем 'Записать'
			Тогда открылось окно 'ВА - Таблицы АДО (Внешние информационные базы)'
			И я нажимаю на кнопку с именем 'ПроверитьПодключение'
			Тогда открылось окно '1С:Предприятие'
			И я нажимаю на кнопку с именем 'Button0'
			Тогда открылось окно 'ВА - Таблицы АДО (Внешние информационные базы)'
			И я нажимаю на кнопку с именем 'ЗаписатьИЗакрыть'
			И я жду закрытия окна 'ВА - Таблицы АДО (Внешние информационные базы)' в течение 20 секунд
		
		* Закрываем формы
			Когда открылось окно 'ВА - Таблицы АДО (Тип информационной базы)'
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна 'ВА - Таблицы АДО (Тип информационной базы)' в течение 20 секунд
			Тогда открылось окно 'ВА - Тест загрузки по ADO (Правила расчета)'
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна 'ВА - Тест загрузки по ADO (Правила расчета)' в течение 20 секунд

	* Перезапишем правила трансляции
		* Номенклатура
			Когда открылось окно 'ВА - Тест загрузки по ADO (Виды отчетов)'
			И я нажимаю на кнопку открытия поля с именем "ПравилоОбработкиПоУмолчанию"
			Тогда открылось окно 'ВА - Тест загрузки по ADO (Правила расчета)'
			И я нажимаю на кнопку открытия поля с именем "ТипБД"
			Тогда открылось окно 'ВА - Таблицы АДО (Тип информационной базы)'
			И я нажимаю на кнопку с именем 'ФормаНастроитьСоответствия'
			Тогда открылось окно 'Соответствие внешним ИБ'
			И в таблице "Список" я перехожу к строке:
				| 'Имя файла'           | 'Наименование'                                  |
				| 'ВА_ЗагрузкаADO.xlsx' | 'ВидСубконто.Номенклатура -> ТаблицаADO.Лист1$' |
			И в таблице "Список" я выбираю текущую строку
			Тогда открылось окно 'ВидСубконто.Номенклатура -> ТаблицаADO.Лист1$ (Соответствие внешним ИБ)'
			Если '$$ЭтоУХ$$' Тогда
				И я нажимаю кнопку выбора у поля с именем "КорневойКаталог"
				Тогда открылось окно 'Справочник.Номенклатура'
				И в таблице "Список" я перехожу к строке:
					| 'Ссылка'            |
					| 'ВА - Номенклатура' |
				И в таблице "Список" я нажимаю на кнопку с именем 'СписокВыбрать'
				Тогда открылось окно 'ВидСубконто.Номенклатура -> ТаблицаADO.Лист1*'
			И в таблице "ТаблицаСоответствия" я перехожу к строке:
				| 'Поле'             |
				| 'Вид номенклатуры' |
			И в таблице "ТаблицаСоответствия" я активизирую поле с именем "ТаблицаСоответствияСпособЗаполнения"
			И в таблице "ТаблицаСоответствия" я выбираю текущую строку
			И в таблице "ТаблицаСоответствия" из выпадающего списка с именем "ТаблицаСоответствияСпособЗаполнения" я выбираю точное значение 'Фиксированное значение'
			И в таблице "ТаблицаСоответствия" я завершаю редактирование строки
			И в таблице "ТаблицаСоответствия" я активизирую поле с именем "ТаблицаСоответствияПсевдонимВИБ"
			И в таблице "ТаблицаСоответствия" я выбираю текущую строку
			Тогда открылось окно 'Введите значение'
			И я нажимаю на кнопку с именем 'ФормаНайти'
			Тогда открылось окно 'Найти'
			И в поле с именем 'Pattern' я ввожу текст 'ВА - Номенклатура'
			И я меняю значение переключателя с именем 'CompareType' на 'По точному совпадению'
			И я нажимаю на кнопку с именем 'Find'
			Тогда открылось окно 'Введите значение'
			И в таблице "Список" я выбираю текущую строку
			Тогда открылось окно 'ВидСубконто.Номенклатура -> ТаблицаADO.Лист1*'
			Если '$$ЭтоУХ$$' Тогда
				И в таблице "ТаблицаСоответствия" я перехожу к строке:
					| 'Поле'    |
					| 'Единица' |
			Если '$$ЭтоЕРПУХ$$' Тогда
				И в таблице "ТаблицаСоответствия" я перехожу к строке:
					| 'Поле'             |
					| 'Единица хранения' |		
			И в таблице "ТаблицаСоответствия" я активизирую поле с именем "ТаблицаСоответствияСпособЗаполнения"
			И в таблице "ТаблицаСоответствия" я выбираю текущую строку
			И в таблице "ТаблицаСоответствия" из выпадающего списка с именем "ТаблицаСоответствияСпособЗаполнения" я выбираю точное значение 'Фиксированное значение'
			И в таблице "ТаблицаСоответствия" я завершаю редактирование строки
			И в таблице "ТаблицаСоответствия" я активизирую поле с именем "ТаблицаСоответствияПсевдонимВИБ"
			И в таблице "ТаблицаСоответствия" я выбираю текущую строку
			Тогда открылось окно 'Введите значение'
			И я нажимаю на кнопку с именем 'ФормаНайти'
			Тогда открылось окно 'Найти'
			Если '$$ЭтоУХ$$' Тогда
				И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'Код'
				И в поле с именем 'Pattern' я ввожу текст '796'
				И я меняю значение переключателя с именем 'CompareType' на 'По точному совпадению'
			Если '$$ЭтоЕРПУХ$$' Тогда
				И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'Международное сокращение'
				И в поле с именем 'Pattern' я ввожу текст 'PCE'
				И я меняю значение переключателя с именем 'CompareType' на 'По точному совпадению'	
			И я нажимаю на кнопку с именем 'Find'
			Тогда открылось окно 'Введите значение'
			И в таблице "Список" я выбираю текущую строку	
			Тогда открылось окно 'ВидСубконто.Номенклатура -> ТаблицаADO.Лист1*'	
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна 'ВидСубконто.Номенклатура -> ТаблицаADO.Лист1*' в течение 20 секунд			
		* Статьи ДДС
			// ДОРАБОТАТЬ: Убрать, после исправления ошибки испорта моделей
			Тогда открылось окно 'Соответствие внешним ИБ'
			И в таблице "Список" я перехожу к строке:
				| 'Имя файла'           | 'Наименование'                                |
				| 'ВА_ЗагрузкаADO.xlsx' | 'ВидСубконто.Статьи ДДС -> ТаблицаADO.Лист1$' |
			И в таблице "Список" я выбираю текущую строку
			Тогда открылось окно 'ВидСубконто.Статьи ДДС -> ТаблицаADO.Лист1$ (Соответствие внешним ИБ)'
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна 'ВидСубконто.Статьи ДДС -> ТаблицаADO.Лист1*' в течение 20 секунд

Сценарий: 10.02 Создаем экземпляр отчета

	* Ищем существующий экземпляр отчета
		И В командном интерфейсе я выбираю 'Бюджетирование, отчетность и анализ' 'Виды и бланки отчетов'
		Тогда открылось окно 'Виды и бланки отчетов'
		И в таблице "СписокВидовОтчетов" я нажимаю на кнопку с именем 'СписокВидовОтчетовНайти'
		Тогда открылось окно 'Найти'
		И из выпадающего списка с именем "Pattern" я выбираю по строке 'ВА - Тест загрузки по ADO'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно 'Виды и бланки отчетов'
		И в таблице "СписокВидовОтчетов" я нажимаю на кнопку с именем 'СписокВидовОтчетовОткрытьСписокЭкземпляров'
		Когда открылось окно 'Экземпляры отчетов'
		* Отбора по сценарию
			И я устанавливаю флаг с именем 'ИспользоватьСценарий'
			И я нажимаю кнопку выбора у поля с именем "ОтборПоСценарию"
			Тогда открылось окно 'Список значений'
			И в таблице "ValueList" я выбираю текущую строку
			И в таблице "ValueList" из выпадающего списка с именем "Value" я выбираю по строке 'ВА - Основной сценарий'
			И в таблице "ValueList" я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'OK'
		* Отбор по организации
			И я устанавливаю флаг с именем 'ИспользоватьОрганизации'
			И в таблице "Организации" я перехожу к строке:
				| 'Значение'    | 'Использовать' |
				| 'Система ООО' | 'Нет'          |
			И в таблице "Организации" я разворачиваю текущую строку
			И в таблице "Организации" я перехожу к строке:
				| 'Значение'     | 'Использовать' |
				| 'Меркурий ООО' | 'Нет'          |
			И в таблице "Организации" я устанавливаю флаг с именем 'ОрганизацииИспользовать'
			И в таблице "Организации" я завершаю редактирование строки
		Если в таблице "Список" количество строк "равно" 0 Тогда
			* Создаем новый экземпляр отчета
				И я нажимаю на кнопку с именем 'ФормаСоздать'
				Тогда открылось окно 'Укажите ключевые реквизиты документа'
				И из выпадающего списка с именем "ВидОтчета" я выбираю по строке 'ВА - Тест загрузки по ADO'
				И из выпадающего списка с именем "Сценарий" я выбираю по строке 'ВА - Основной сценарий'
				И из выпадающего списка с именем "Периодичность" я выбираю точное значение 'Месяц'
				И я нажимаю на кнопку с именем 'ИзменитьПериод'
				Тогда открылось окно 'Выберите период'
				И в поле с именем 'DateBegin' я ввожу текст '01.01.2021'
				И в поле с именем 'DateEnd' я ввожу текст '31.03.2021'
				И я нажимаю на кнопку с именем 'Select'
				Тогда открылось окно 'Укажите ключевые реквизиты документа'
				И я нажимаю кнопку выбора у поля с именем "Организация"
				* Выбираем организацию
					Если '$$ЭтоУХ$$' Тогда 	
						Когда открылось окно "Организационные единицы"
						И в таблице "Список" я активизирую поле с именем "Наименование"
						И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюНайти' на элементе формы с именем "Список"
						Тогда открылось окно 'Найти'
						И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'Наименование в программе'
						И в поле с именем 'Pattern' я ввожу текст 'Меркурий ООО'
						И я меняю значение переключателя с именем 'CompareType' на 'По точному совпадению'
						И я нажимаю на кнопку с именем 'Find'
						Тогда открылось окно 'Организационные единицы'
						И в таблице "Список" я выбираю текущую строку	
					Если '$$ЭтоЕРПУХ$$' Тогда
						Когда открылось окно 'Организации'
						И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюНайти' на элементе формы с именем "Список"
						Тогда открылось окно 'Найти'
						И я меняю значение переключателя с именем 'CompareType' на 'По точному совпадению'
						И в поле с именем 'Pattern' я ввожу текст 'Меркурий ООО'	
						И я нажимаю на кнопку с именем 'Find'
						Тогда открылось окно 'Организации'
						И в таблице "Список" я выбираю текущую строку
				Когда открылось окно 'Укажите ключевые реквизиты документа'
				И я нажимаю на кнопку с именем 'КнопкаОК'
		Иначе
			И в таблице "Список" я выбираю текущую строку
		
	* Рассчитываем документ по правилу
		Когда открылось окно 'Экземпляр отчета ВА - Тест загрузки по ADO:  Валюта отображения:  RUB <Меркурий ООО> <> <Январь * г. - Март * г. (Периодичность: Месяц) <ВА - Основной сценарий>>*'
		И я нажимаю на кнопку с именем 'ФормаЗаполнитьПоУмолчанию'

	* Сверяем результат
		Тогда табличный документ "ПолеТабличногоДокументаМакет" равен:
			| 'ВА - Тест загрузки по ADO(многопериодный)'                       | ''               | ''           | ''          | ''           | ''                | ''           | ''          | ''           | ''              | ''           | ''          | ''           | ''        | ''           | ''     | ''            |
			| ''                                                                | ''               | ''           | ''          | ''           | ''                | ''           | ''          | ''           | ''              | ''           | ''          | ''           | ''        | ''           | ''     | ''            |
			| ''                                                                | 'Январь 2021 г.' | ''           | ''          | ''           | 'Февраль 2021 г.' | ''           | ''          | ''           | 'Март 2021 г.'  | ''           | ''          | ''           | 'ИТОГО'   | ''           | ''     | ''            |
			| ''                                                                | 'Артикул'        | 'Количество' | 'Цена'      | 'Сумма'      | 'Артикул'         | 'Количество' | 'Цена'      | 'Сумма'      | 'Артикул'       | 'Количество' | 'Цена'      | 'Сумма'      | 'Артикул' | 'Количество' | 'Цена' | 'Сумма'       |
			| 'Строка1'                                                         | ''               | '36'         | '839 627'   | '15 965 000' | ''                | '61'         | '958 752'   | '34 723 000' | ''              | '86'         | '1 072 802' | '58 228 400' | ''        | '183'        | '0'    | '108 916 400' |
			| 'Апгрейд программных продуктов '                                  | '2900001871389'  | '1'          | '625 000'   | '625 000'    | '2900001970198'   | '1'          | '975 000'   | '975 000'    | '2900001871419' | '1'          | '1 025 000' | '1 025 000'  | ''        | '3'          | '0'    | '2 625 000'   |
			| '1С:ERP. Управление холдингом '                                   | ''               | '0'          | '0'         | '0'          | '2900001970198'   | '1'          | '975 000'   | '975 000'    | ''              | '0'          | '0'         | '0'          | ''        | '1'          | '0'    | '975 000'     |
			| '1С:Корпорация '                                                  | ''               | '0'          | '0'         | '0'          | ''                | '0'          | '0'         | '0'          | '2900001871419' | '1'          | '1 025 000' | '1 025 000'  | ''        | '1'          | '0'    | '1 025 000'   |
			| '1С:Управление холдингом 8 '                                      | '2900001871389'  | '1'          | '625 000'   | '625 000'    | ''                | '0'          | '0'         | '0'          | ''              | '0'          | '0'         | '0'          | ''        | '1'          | '0'    | '625 000'     |
			| 'Внедрение программных продуктов '                                | 'КПГУПроф6'      | '20'         | '31 006'    | '0'          | 'КПГУПроф6'       | '30'         | '31 006'    | '0'          | 'КПГУПроф6'     | '40'         | '31 006'    | '0'          | ''        | '90'         | '0'    | '0'           |
			| '1С:КП ГУ ПРОФ на 12 месяцев '                                    | 'КПГУПроф12'     | '10'         | '40 572'    | '0'          | 'КПГУПроф12'      | '15'         | '40 572'    | '0'          | 'КПГУПроф12'    | '20'         | '40 572'    | '0'          | ''        | '45'         | '0'    | '0'           |
			| '1С:КП ГУ ПРОФ на 6 месяцев '                                     | 'КПГУПроф6'      | '10'         | '21 440'    | '0'          | 'КПГУПроф6'       | '15'         | '21 440'    | '0'          | 'КПГУПроф6'     | '20'         | '21 440'    | '0'          | ''        | '45'         | '0'    | '0'           |
			| 'Реализация программных продуктов '                               | '4601546106674'  | '15'         | '1 206 000' | '15 340 000' | '4601546106674'   | '30'         | '1 326 600' | '33 748 000' | '4601546106674' | '45'         | '1 499 080' | '57 203 400' | ''        | '90'         | '0'    | '106 291 400' |
			| '1С:ERP. Управление холдингом '                                   | '2900001970198'  | '3'          | '1 950 000' | '5 850 000'  | '2900001970198'   | '6'          | '2 145 000' | '12 870 000' | '2900001970198' | '9'          | '2 423 900' | '21 815 100' | ''        | '18'         | '0'    | '40 535 100'  |
			| '1С:Корпорация '                                                  | '2900001871419'  | '2'          | '2 050 000' | '4 100 000'  | '2900001871419'   | '4'          | '2 255 000' | '9 020 000'  | '2900001871419' | '6'          | '2 548 200' | '15 289 200' | ''        | '12'         | '0'    | '28 409 200'  |
			| '1С:Предприятие 8 КОРП. Клиентская лицензия на 100 рабочих мест ' | '4601546106674'  | '6'          | '600 000'   | '3 600 000'  | '4601546106674'   | '12'         | '660 000'   | '7 920 000'  | '4601546106674' | '18'         | '745 800'   | '13 424 400' | ''        | '36'         | '0'    | '24 944 400'  |
			| '1С:Предприятие 8.3 КОРП. Лицензия на сервер (x86-64) '           | '2900001916059'  | '3'          | '180 000'   | '540 000'    | '2900001916059'   | '6'          | '198 000'   | '1 188 000'  | '2900001916059' | '9'          | '223 700'   | '2 013 300'  | ''        | '18'         | '0'    | '3 741 300'   |
			| '1С:Управление холдингом 8 '                                      | '2900001871389'  | '1'          | '1 250 000' | '1 250 000'  | '2900001871389'   | '2'          | '1 375 000' | '2 750 000'  | '2900001871389' | '3'          | '1 553 800' | '4 661 400'  | ''        | '6'          | '0'    | '8 661 400'   |

	* Сверим движения
		Когда открылось окно 'Экземпляр отчета ВА - Тест загрузки по ADO:  Валюта отображения:  RUB <Меркурий ООО> <> <Январь * г. - Март * г. (Периодичность: Месяц) <ВА - Основной сценарий>> *'
		И я нажимаю на кнопку с именем 'ФормаОткрытьДвиженияДокументаПлоскаяТаблица'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку с именем 'Button0'
		И Пауза 10
		Тогда открылось окно 'Плоская таблица значений показателей'
		И Пауза 5
		Дано Табличный документ 'ОтчетТабличныйДокумент' равен макету "Макеты\ВА_ТестЗагрузкиПоADO_Движения.mxl" по шаблону
		И Я закрываю окно 'Плоская таблица значений показателей'

	* Рассчитываем документ по правилу еще раз
		Когда открылось окно 'Экземпляр отчета ВА - Тест загрузки по ADO:  Валюта отображения:  RUB <Меркурий ООО> <> <Январь * г. - Март * г. (Периодичность: Месяц) <ВА - Основной сценарий>>*'
		И я нажимаю на кнопку с именем 'ФормаЗаполнитьПоУмолчанию'

	* Сверяем результат еще раз
		Тогда табличный документ "ПолеТабличногоДокументаМакет" равен:
			| 'ВА - Тест загрузки по ADO(многопериодный)'                       | ''               | ''           | ''          | ''           | ''                | ''           | ''          | ''           | ''              | ''           | ''          | ''           | ''        | ''           | ''     | ''            |
			| ''                                                                | ''               | ''           | ''          | ''           | ''                | ''           | ''          | ''           | ''              | ''           | ''          | ''           | ''        | ''           | ''     | ''            |
			| ''                                                                | 'Январь 2021 г.' | ''           | ''          | ''           | 'Февраль 2021 г.' | ''           | ''          | ''           | 'Март 2021 г.'  | ''           | ''          | ''           | 'ИТОГО'   | ''           | ''     | ''            |
			| ''                                                                | 'Артикул'        | 'Количество' | 'Цена'      | 'Сумма'      | 'Артикул'         | 'Количество' | 'Цена'      | 'Сумма'      | 'Артикул'       | 'Количество' | 'Цена'      | 'Сумма'      | 'Артикул' | 'Количество' | 'Цена' | 'Сумма'       |
			| 'Строка1'                                                         | ''               | '36'         | '839 627'   | '15 965 000' | ''                | '61'         | '958 752'   | '34 723 000' | ''              | '86'         | '1 072 802' | '58 228 400' | ''        | '183'        | '0'    | '108 916 400' |
			| 'Апгрейд программных продуктов '                                  | '2900001871389'  | '1'          | '625 000'   | '625 000'    | '2900001970198'   | '1'          | '975 000'   | '975 000'    | '2900001871419' | '1'          | '1 025 000' | '1 025 000'  | ''        | '3'          | '0'    | '2 625 000'   |
			| '1С:ERP. Управление холдингом '                                   | ''               | '0'          | '0'         | '0'          | '2900001970198'   | '1'          | '975 000'   | '975 000'    | ''              | '0'          | '0'         | '0'          | ''        | '1'          | '0'    | '975 000'     |
			| '1С:Корпорация '                                                  | ''               | '0'          | '0'         | '0'          | ''                | '0'          | '0'         | '0'          | '2900001871419' | '1'          | '1 025 000' | '1 025 000'  | ''        | '1'          | '0'    | '1 025 000'   |
			| '1С:Управление холдингом 8 '                                      | '2900001871389'  | '1'          | '625 000'   | '625 000'    | ''                | '0'          | '0'         | '0'          | ''              | '0'          | '0'         | '0'          | ''        | '1'          | '0'    | '625 000'     |
			| 'Внедрение программных продуктов '                                | 'КПГУПроф6'      | '20'         | '31 006'    | '0'          | 'КПГУПроф6'       | '30'         | '31 006'    | '0'          | 'КПГУПроф6'     | '40'         | '31 006'    | '0'          | ''        | '90'         | '0'    | '0'           |
			| '1С:КП ГУ ПРОФ на 12 месяцев '                                    | 'КПГУПроф12'     | '10'         | '40 572'    | '0'          | 'КПГУПроф12'      | '15'         | '40 572'    | '0'          | 'КПГУПроф12'    | '20'         | '40 572'    | '0'          | ''        | '45'         | '0'    | '0'           |
			| '1С:КП ГУ ПРОФ на 6 месяцев '                                     | 'КПГУПроф6'      | '10'         | '21 440'    | '0'          | 'КПГУПроф6'       | '15'         | '21 440'    | '0'          | 'КПГУПроф6'     | '20'         | '21 440'    | '0'          | ''        | '45'         | '0'    | '0'           |
			| 'Реализация программных продуктов '                               | '4601546106674'  | '15'         | '1 206 000' | '15 340 000' | '4601546106674'   | '30'         | '1 326 600' | '33 748 000' | '4601546106674' | '45'         | '1 499 080' | '57 203 400' | ''        | '90'         | '0'    | '106 291 400' |
			| '1С:ERP. Управление холдингом '                                   | '2900001970198'  | '3'          | '1 950 000' | '5 850 000'  | '2900001970198'   | '6'          | '2 145 000' | '12 870 000' | '2900001970198' | '9'          | '2 423 900' | '21 815 100' | ''        | '18'         | '0'    | '40 535 100'  |
			| '1С:Корпорация '                                                  | '2900001871419'  | '2'          | '2 050 000' | '4 100 000'  | '2900001871419'   | '4'          | '2 255 000' | '9 020 000'  | '2900001871419' | '6'          | '2 548 200' | '15 289 200' | ''        | '12'         | '0'    | '28 409 200'  |
			| '1С:Предприятие 8 КОРП. Клиентская лицензия на 100 рабочих мест ' | '4601546106674'  | '6'          | '600 000'   | '3 600 000'  | '4601546106674'   | '12'         | '660 000'   | '7 920 000'  | '4601546106674' | '18'         | '745 800'   | '13 424 400' | ''        | '36'         | '0'    | '24 944 400'  |
			| '1С:Предприятие 8.3 КОРП. Лицензия на сервер (x86-64) '           | '2900001916059'  | '3'          | '180 000'   | '540 000'    | '2900001916059'   | '6'          | '198 000'   | '1 188 000'  | '2900001916059' | '9'          | '223 700'   | '2 013 300'  | ''        | '18'         | '0'    | '3 741 300'   |
			| '1С:Управление холдингом 8 '                                      | '2900001871389'  | '1'          | '1 250 000' | '1 250 000'  | '2900001871389'   | '2'          | '1 375 000' | '2 750 000'  | '2900001871389' | '3'          | '1 553 800' | '4 661 400'  | ''        | '6'          | '0'    | '8 661 400'   |

	* Сверим движения еще раз
		Когда открылось окно 'Экземпляр отчета ВА - Тест загрузки по ADO:  Валюта отображения:  RUB <Меркурий ООО> <> <Январь * г. - Март * г. (Периодичность: Месяц) <ВА - Основной сценарий>> *'
		И я нажимаю на кнопку с именем 'ФормаОткрытьДвиженияДокументаПлоскаяТаблица'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку с именем 'Button0'
		И Пауза 10
		Тогда открылось окно 'Плоская таблица значений показателей'
		И Пауза 5
		Дано Табличный документ 'ОтчетТабличныйДокумент' равен макету "Макеты\ВА_ТестЗагрузкиПоADO_Движения.mxl" по шаблону
		И Я закрываю окно 'Плоская таблица значений показателей'		

Сценарий: 10.03 Изменим вид номенклатуры

	Если '$$ЭтоУХ$$' Тогда 
		И В командном интерфейсе я выбираю 'Справочники' 'Номенклатура'
		Тогда открылось окно 'Номенклатура'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'      |
			| 'ВА - Номенклатура' |
		И в таблице  "Список" я перехожу на один уровень вниз

		* 1С:КП ГУ ПРОФ на 12 месяцев		
			И в таблице "Список" я перехожу к строке:
				| 'Артикул'    | 'Единица' | 'Наименование'                |
				| 'КПГУПроф12' | 'шт'      | '1С:КП ГУ ПРОФ на 12 месяцев' |
			И в таблице "Список" я выбираю текущую строку
			Тогда открылось окно '1С:КП ГУ ПРОФ на 12 месяцев (Номенклатура)'
			И из выпадающего списка с именем "ВидНоменклатуры" я выбираю по строке 'ВА - Прочее'
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна '1С:КП ГУ ПРОФ на 12 месяцев (Номенклатура) *' в течение 20 секунд

		* 1С:КП ГУ ПРОФ на 6 месяцев
			И в таблице "Список" я перехожу к строке:
				| 'Артикул'   | 'Единица' | 'Наименование'                |
				| 'КПГУПроф6' | 'шт'      | '1С:КП ГУ ПРОФ на 6 месяцев' |
			И в таблице "Список" я выбираю текущую строку
			Тогда открылось окно '1С:КП ГУ ПРОФ на 6 месяцев (Номенклатура)'
			И из выпадающего списка с именем "ВидНоменклатуры" я выбираю по строке 'ВА - Прочее'
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна '1С:КП ГУ ПРОФ на 6 месяцев (Номенклатура) *' в течение 20 секунд	
		
	Если '$$ЭтоЕРПУХ$$' Тогда
		И В командном интерфейсе я выбираю 'Главное' 'Номенклатура'
		Тогда открылось окно 'Номенклатура'
		
		* 1С:КП ГУ ПРОФ на 6 месяцев
			И в таблице "ВидыНоменклатуры" я перехожу к строке:
				| 'Наименование'      |
				| 'ВА - Номенклатура' |
			Если в таблице "СписокРасширенныйПоискНоменклатура" есть строка Тогда
				| 'Артикул '  | 'Наименование'               |
				| 'КПГУПроф6' | '1С:КП ГУ ПРОФ на 6 месяцев' |
				И в таблице "СписокРасширенныйПоискНоменклатура" я перехожу к строке:
					| 'Артикул '  | 'Наименование'               |
					| 'КПГУПроф6' | '1С:КП ГУ ПРОФ на 6 месяцев' |
				И в таблице "СписокРасширенныйПоискНоменклатура" я выбираю текущую строку
				Тогда открылось окно '1С:КП ГУ ПРОФ на 6 месяцев (Номенклатура)'
				И я перехожу к закладке с именем "СтраницаРеквизитыНоменклатуры"
				Если открылось окно 'Полезный совет' Тогда
					И я нажимаю на кнопку с именем 'Button0'
				Тогда открылось окно '1С:КП ГУ ПРОФ на 6 месяцев (Номенклатура)'
				И я разворачиваю группу с именем "СворачиваемаяГруппаОсновныеПараметрыУчета"
				И из выпадающего списка с именем "ВидНоменклатуры" я выбираю по строке 'ВА - Прочее'
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'				
				Если открылось окно 'Ставка НДС применяется с:' Тогда
					И в поле с именем 'InputFld' я ввожу текст '01.01.2021'
					И я нажимаю на кнопку с именем 'OK'
					Тогда открылось окно '1С:КП ГУ ПРОФ на * месяцев (Номенклатура)'
					И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна '1С:КП ГУ ПРОФ на 6 месяцев (Номенклатура) *' в течение 20 секунд
		
		* 1С:КП ГУ ПРОФ на 12 месяцев
			И в таблице "ВидыНоменклатуры" я перехожу к строке:
				| 'Наименование'      |
				| 'ВА - Номенклатура' |
			Если в таблице "СписокРасширенныйПоискНоменклатура" есть строка Тогда
				| 'Артикул '   | 'Наименование'                |
				| 'КПГУПроф12' | '1С:КП ГУ ПРОФ на 12 месяцев' |
				И в таблице "СписокРасширенныйПоискНоменклатура" я перехожу к строке:
					| 'Артикул '   | 'Наименование'                |
					| 'КПГУПроф12' | '1С:КП ГУ ПРОФ на 12 месяцев' |
				И в таблице "СписокРасширенныйПоискНоменклатура" я выбираю текущую строку
				Тогда открылось окно '1С:КП ГУ ПРОФ на 12 месяцев (Номенклатура)'
				И я перехожу к закладке с именем "СтраницаРеквизитыНоменклатуры"
				Тогда открылось окно '1С:КП ГУ ПРОФ на 12 месяцев (Номенклатура)'
				И я разворачиваю группу с именем "СворачиваемаяГруппаОсновныеПараметрыУчета"
				И из выпадающего списка с именем "ВидНоменклатуры" я выбираю по строке 'ВА - Прочее'
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				Если открылось окно 'Ставка НДС применяется с:' Тогда
					И в поле с именем 'InputFld' я ввожу текст '01.01.2021'
					И я нажимаю на кнопку с именем 'OK'
					Тогда открылось окно '1С:КП ГУ ПРОФ на * месяцев (Номенклатура)'
					И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна '1С:КП ГУ ПРОФ на 12 месяцев (Номенклатура) *' в течение 20 секунд
