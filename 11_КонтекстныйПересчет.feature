﻿#language: ru

@tree

Функционал: 11. Проверка функционала контекстного пересчета ячеек

Как Администратор я хочу
Проверить создание и работу сводных таблиц

Контекст: 

	И я подключаю TestClient "УХ - Бюджетирование" логин "Администратор" пароль ""
	И я закрыл все окна клиентского приложения	

Сценарий: 11.00 Определение типа приложения

	Пусть Инициализация переменных

Сценарий: 11.01 Создаем вид отчета "ВА - Количество (ФА)"

	И Я создаю группу видов отчетов с именем "ВА - Контектсный пересчет (группа)" и родителем "ВА - Группа отчетов"

	И Я создаю вид отчета с именем "ВА - Количество (ФА)" и родителем "ВА - Контектсный пересчет (группа)"

	И Я открываю вид отчета с именем "ВА - Количество (ФА)"

	* Доработаем вид отчета
		Когда открылось окно 'ВА - Количество (ФА) (Виды отчетов)'
		И я изменяю флаг с именем 'СохранятьИсториюИзменений'
		И я перехожу к закладке с именем "АналитикиОтчета"
		И из выпадающего списка с именем "ВидАналитики1" я выбираю по строке 'ВА0СтатДДС'
		И я перехожу к закладке с именем "Основная"
		И я нажимаю на кнопку с именем 'ФормаКнопкаЗаписать'
		Тогда открылось окно 'Реструктуризация данных'
		И я нажимаю на кнопку с именем 'ФормаОК'
	
	* Настраиваем структуру вида отчета
		Тогда открылось окно 'ВА - Количество (ФА) (Виды отчетов)'
		И я нажимаю на кнопку с именем 'РедактироватьДерево'
		И Я добавляю строку с именем "Итог" в конструкторе отчета
		И Я добавляю строку с именем "Товары" в конструкторе отчета
		И Я добавляю колонку с именем "Количество" в конструкторе отчета
		И Я добавляю колонку с именем "Коэффициент" в конструкторе отчета
		И Я добавляю колонку с именем "Итог" в конструкторе отчета

	* Устанавливаем аналитики
		И Я добавляю аналитику с кодом "ВА0Номенкл" в конструкторе отчета в ячейку "R3C3"

	* Вводим формулы расчета
		Когда открылось окно 'Конструктор отчета'
		И из выпадающего списка с именем "РежимРаботы" я выбираю точное значение 'Формулы расчета показателей'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R2C2"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R3C2"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'
		Тогда открылось окно 'Конструктор отчета'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R2C3"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R3C3"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'
		Тогда открылось окно 'Конструктор отчета'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R2C4"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R2C2"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'КнопкаУмножить'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R2C3"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'
		Тогда открылось окно 'Конструктор отчета'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R3C4"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R3C2"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'КнопкаУмножить'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R3C3"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'
		И Я закрываю окно 'Конструктор отчета'

	Если '$$ВерсияУХ$$ = "3.1"' Тогда	
		И Я создаю бланк экземпляра отчета по умолчанию

	И Я создаю многопериодный бланк по умолчанию
		
	И Я создаю бланк сводной таблицы по умолчанию с отборами "Проект", "Статьи ДДС"

Сценарий: 11.02 Редактируем сводную таблицу "ВА - Количество (ФА)"

	И Я открываю вид отчета с именем "ВА - Количество (ФА)"

	* Открываем сводную таблицу
		Когда открылось окно 'ВА - Количество (ФА) (Виды отчетов)'
		И В текущем окне я нажимаю кнопку командного интерфейса 'Бланки отчетов'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'                          |
			| 'ВА - Количество (ФА)(cводная таблица)' |
		И в таблице "Список" я активизирую поле с именем "Ссылка"
		И я нажимаю на кнопку с именем 'ПерейтиВРежимОтображенияДанных'

	И Я устанавливаю отборы сводной таблицы: дата начала "01.01.2021", дата конца "31.03.2021", валюта "RUB", сценарий "ВА - Основной сценарий", организация "Меркурий ООО"		

	И Я устанавливаю отбор сводной таблицы "Элемент_ВА0СтатДДС" со значением "Реализация программных продуктов"

	* Установим режим обновления показателей
		И Пауза 2
		Когда открылось окно 'Сводная таблица: ВА - Количество (ФА)(cводная таблица)( Основной) *'
		И я нажимаю на кнопку с именем 'ВычислятьАвтоматически'

	* Заполняем сводную таблицу
		* Количество
			Когда открылось окно 'Сводная таблица: ВА - Количество (ФА)(cводная таблица)( Основной)*'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R5C2"
			И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
			Тогда открылось окно 'Раскрытие показателей: Период=Январь 2021 г. | Организация=Меркурий ООО | Сценарий=ВА - Основной сценарий | Статьи движения денежных средств=Реализация программных продуктов | Валюты=RUB'
			И в таблице "РаскрытиеПоказателей" я нажимаю на кнопку с именем 'РаскрытиеПоказателейДобавить'
			И в таблице "РаскрытиеПоказателей" из выпадающего списка с именем "ВА0Номенкл" я выбираю по строке '1С:ERP. Управление холдингом'
			И в таблице "РаскрытиеПоказателей" в поле с именем 'Значение' я ввожу текст '10,00000'
			И в таблице "РаскрытиеПоказателей" я нажимаю на кнопку с именем 'РаскрытиеПоказателейДобавить'
			И в таблице "РаскрытиеПоказателей" из выпадающего списка с именем "ВА0Номенкл" я выбираю по строке '1С:Корпорация'
			И в таблице "РаскрытиеПоказателей" в поле с именем 'Значение' я ввожу текст '20,00000'
			И в таблице "РаскрытиеПоказателей" я нажимаю на кнопку с именем 'РаскрытиеПоказателейДобавить'
			И в таблице "РаскрытиеПоказателей" из выпадающего списка с именем "ВА0Номенкл" я выбираю по строке '1С:Предприятие 8 КОРП. Клиентская лицензия на 100 рабочих мест'
			И в таблице "РаскрытиеПоказателей" я активизирую поле с именем "Значение"
			И в таблице "РаскрытиеПоказателей" в поле с именем 'Значение' я ввожу текст '30,00000'
			И в таблице "РаскрытиеПоказателей" я нажимаю на кнопку с именем 'РаскрытиеПоказателейДобавить'
			И в таблице "РаскрытиеПоказателей" из выпадающего списка с именем "ВА0Номенкл" я выбираю по строке '1С:Предприятие 8.3 КОРП. Лицензия на сервер (x86-64)'
			И в таблице "РаскрытиеПоказателей" я активизирую поле с именем "Значение"
			И в таблице "РаскрытиеПоказателей" в поле с именем 'Значение' я ввожу текст '40,00000'
			И в таблице "РаскрытиеПоказателей" я нажимаю на кнопку с именем 'РаскрытиеПоказателейДобавить'
			И в таблице "РаскрытиеПоказателей" из выпадающего списка с именем "ВА0Номенкл" я выбираю по строке '1С:Управление холдингом 8'
			И в таблице "РаскрытиеПоказателей" я активизирую поле с именем "Значение"
			И в таблице "РаскрытиеПоказателей" в поле с именем 'Значение' я ввожу текст '50,00000'
			И я нажимаю на кнопку с именем 'ФормаКнопкаОК'
		* Коэффициент
			Когда открылось окно 'Сводная таблица: ВА - Количество (ФА)(cводная таблица)( Основной)*'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R6C3"
			И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
			И в табличный документ "ПолеТабличногоДокументаМакет" я ввожу текст '2,00000'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R6C3"
			И я нажимаю на кнопку с именем 'СкопироватьДанныеПоКолонке'
		* Копируем значения
			Когда открылось окно 'Сводная таблица: ВА - Количество (ФА)(cводная таблица)( Основной) *'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R6C2:R10C2"
			И я нажимаю на кнопку с именем 'СкопироватьДанныеПоСтроке'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R4C3:R10C3"
			И я нажимаю на кнопку с именем 'СкопироватьДанныеПоСтроке'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R6C5:R10C6"
			И я нажимаю на кнопку с именем 'ИзменитьПоказатели'
			Тогда открылось окно 'Изменение значений'
			И я меняю значение переключателя с именем 'ВидКорректировки' на 'Процент'
			И в поле с именем 'ЗначениеКорректировки' я ввожу текст '100,00000'
			И я нажимаю на кнопку с именем 'Применить'
			Тогда открылось окно 'Сводная таблица: ВА - Количество (ФА)(cводная таблица)( Основной) *'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R6C8:R10C8"
			И я нажимаю на кнопку с именем 'ИзменитьПоказатели'
			Тогда открылось окно 'Изменение значений'
			И я меняю значение переключателя с именем 'ВидКорректировки' на 'Процент'
			И в поле с именем 'ЗначениеКорректировки' я ввожу текст '200,00000'
			И я нажимаю на кнопку с именем 'Применить'
			Тогда открылось окно 'Сводная таблица: ВА - Количество (ФА)(cводная таблица)( Основной) *'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R6C9:R10C9"
			И я нажимаю на кнопку с именем 'ИзменитьПоказатели'
			Тогда открылось окно 'Изменение значений'
			И в поле с именем 'ЗначениеКорректировки' я ввожу текст '4,00000'
			И я нажимаю на кнопку с именем 'Применить'
		* Установим комментарий
			Когда открылось окно 'Сводная таблица: ВА - Количество (ФА)(cводная таблица)( Основной) *'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R6C2"
			И я нажимаю на кнопку с именем 'ВставитьПримечание'
			Тогда открылось окно 'Комментарии '
			И в поле с именем 'НовыйКомментарий' я ввожу текст 'Первая ячейка'
			И я нажимаю на кнопку с именем 'ЗаписатьКомментарий'
			Тогда открылось окно 'Сводная таблица: ВА - Количество (ФА)(cводная таблица)( Основной) *'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R10C10"
			И я нажимаю на кнопку с именем 'ВставитьПримечание'
			Тогда открылось окно 'Комментарии '
			И в поле с именем 'НовыйКомментарий' я ввожу текст 'Последняя ячейка'
			И я нажимаю на кнопку с именем 'ЗаписатьКомментарий'
			Тогда открылось окно 'Сводная таблица: ВА - Количество (ФА)(cводная таблица)( Основной) *'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R6C2"
			И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'ВставитьПримечание'
			Тогда открылось окно 'Комментарии '
			И в поле с именем 'НовыйКомментарий' я ввожу текст 'Первая ячейка 2'
			И я нажимаю на кнопку с именем 'ЗаписатьКомментарий'
			Тогда открылось окно 'Сводная таблица: ВА - Количество (ФА)(cводная таблица)( Основной) *'
			И я нажимаю на кнопку с именем 'ВставитьПримечание'
			Тогда элемент формы с именем "ИсторияКомментариев" стал равен по шаблону
				|'* (*): '      |
				|'Первая ячейка'|
				|'* (*): '        |
				|'Первая ячейка 2'|
			И элемент формы с именем "НовыйКомментарий" стал равен ''
			Когда открылось окно 'Комментарии '
			И я нажимаю на кнопку с именем 'Отмена'
			Тогда открылось окно 'Сводная таблица: ВА - Количество (ФА)(cводная таблица)( Основной) *'
			И я нажимаю на кнопку с именем 'ОтменитьДействие'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R6C2"
			И я нажимаю на кнопку с именем 'ВставитьПримечание'
			Тогда открылось окно 'Комментарии '
			И я нажимаю на кнопку с именем 'Отмена'
			// ДОДЕЛАТЬ: Кнопки "Отмена" и "Повторить действие" для комментариев

	* Очистка показателей
		Когда открылось окно 'Сводная таблица: ВА - Количество (ФА)(cводная таблица)( Основной) *'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R4C2:R10C13"
		И я нажимаю на кнопку с именем 'ОчиститьДиапазон'
		И я нажимаю на кнопку с именем 'ОбновитьДанныеТаблицы'				
		И табличный документ "ПолеТабличногоДокументаМакет" равен:
			| 'ВА - Количество (ФА)(cводная таблица)' | 'Январь 2021 г.' | ''            | ''     | 'Февраль 2021 г.' | ''            | ''     | 'Март 2021 г.' | ''            | ''     | 'Итого'      | ''            | ''     |
			| 'ВА - Количество (ФА)(cводная таблица)' | 'Количество'     | 'Коэффициент' | 'Итог' | 'Количество'      | 'Коэффициент' | 'Итог' | 'Количество'   | 'Коэффициент' | 'Итог' | 'Количество' | 'Коэффициент' | 'Итог' |
			| 'Итог'                                  | '0'              | '0'           | '0'    | '0'               | '0'           | '0'    | '0'            | '0'           | '0'    | '0'          | '0'           | '0'    |
			| 'Товары'                                | '0'              | '0'           | '0'    | '0'               | '0'           | '0'    | '0'            | '0'           | '0'    | '0'          | '0'           | '0'    |
		И табличный документ формы с именем "МакетСтрок" стал пустым
		И табличный документ формы с именем "МакетТаблиц" стал пустым													

	* Проверимк кнопки "Отменить действие" и "Повторить действие"				
		Когда открылось окно 'Сводная таблица: ВА - Количество (ФА)(cводная таблица)( Основной) *'
		И я нажимаю на кнопку с именем 'ОтменитьДействие'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R6C2"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И в табличный документ "ПолеТабличногоДокументаМакет" я ввожу текст '100,00000'
		И я нажимаю на кнопку с именем 'СкопироватьДанныеПоСтроке'
		И я нажимаю на кнопку с именем 'СкопироватьДанныеПоКолонке'
		И я нажимаю на кнопку с именем 'ОтменитьДействие'
		И я нажимаю на кнопку с именем 'ОтменитьДействие'
		И я нажимаю на кнопку с именем 'ОтменитьДействие'
		И я нажимаю на кнопку с именем 'ПовторитьДействие'
		//++ ДОДЕЛАТЬ: Сейчас не работает измение после отмены действия
		//И я нажимаю на кнопку с именем 'ИзменитьПоказатели'
		//Тогда открылось окно 'Изменение значений'
		//И в поле с именем 'ЗначениеКорректировки' я ввожу текст '-90,00000'
		//И я нажимаю на кнопку с именем 'Применить'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R6C2"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И в табличный документ "ПолеТабличногоДокументаМакет" я ввожу текст '10,00000'
		//--

	* Записываем значения покзателей
		Когда открылось окно 'Сводная таблица: ВА - Количество (ФА)(cводная таблица)( Основной) *'
		И я нажимаю на кнопку с именем 'Применить'

	* Сравниваем результат
		Тогда табличный документ "ПолеТабличногоДокументаМакет" равен:
			| 'ВА - Количество (ФА)(cводная таблица)'                          | 'Январь 2021 г.' | ''            | ''      | 'Февраль 2021 г.' | ''            | ''      | 'Март 2021 г.' | ''            | ''       | 'Итого'      | ''            | ''       |
			| 'ВА - Количество (ФА)(cводная таблица)'                          | 'Количество'     | 'Коэффициент' | 'Итог'  | 'Количество'      | 'Коэффициент' | 'Итог'  | 'Количество'   | 'Коэффициент' | 'Итог'   | 'Количество' | 'Коэффициент' | 'Итог'   |
			| 'Итог'                                                           | '150'            | '10'          | '1 500' | '300'             | '20'          | '6 000' | '450'          | '30'          | '13 500' | '900'        | '60'          | '21 000' |
			| 'Товары'                                                         | '150'            | '10'          | '300'   | '300'             | '20'          | '1 200' | '450'          | '30'          | '2 700'  | '900'        | '60'          | '4 200'  |
			| '1С:ERP. Управление холдингом'                                   | '10'             | '2'           | '20'    | '20'              | '4'           | '80'    | '30'           | '6'           | '180'    | '60'         | '12'          | '280'    |
			| '1С:Корпорация'                                                  | '20'             | '2'           | '40'    | '40'              | '4'           | '160'   | '60'           | '6'           | '360'    | '120'        | '12'          | '560'    |
			| '1С:Предприятие 8 КОРП. Клиентская лицензия на 100 рабочих мест' | '30'             | '2'           | '60'    | '60'              | '4'           | '240'   | '90'           | '6'           | '540'    | '180'        | '12'          | '840'    |
			| '1С:Предприятие 8.3 КОРП. Лицензия на сервер (x86-64)'           | '40'             | '2'           | '80'    | '80'              | '4'           | '320'   | '120'          | '6'           | '720'    | '240'        | '12'          | '1 120'  |
			| '1С:Управление холдингом 8'                                      | '50'             | '2'           | '100'   | '100'             | '4'           | '400'   | '150'          | '6'           | '900'    | '300'        | '12'          | '1 400'  |
		
	* Меняем вид таблицы
		Когда открылось окно 'Сводная таблица: ВА - Количество (ФА)(cводная таблица)( Основной)'
		И я нажимаю на гиперссылку с именем "ОтборыЗаголовок"
		И из выпадающего списка с именем "ВалютаОтображения" я выбираю точное значение 'USD'
		И в поле с именем 'Точность' я ввожу текст '5'
		И из выпадающего списка с именем "Делитель" я выбираю точное значение 'тысячах'
		И я нажимаю на кнопку с именем 'ПоказатьНастройкиПериодов'
		И я изменяю флаг с именем 'ВыводитьИтогКвартал'
		И я нажимаю на кнопку с именем 'ФормаПрименить'
		Тогда открылось окно 'Сводная таблица: ВА - Количество (ФА)(cводная таблица)( Основной) *'
		И я нажимаю на кнопку с именем 'ПоказатьНастройкиТаблицыПоОсям'
		Тогда открылось окно 'Настройка расположения полей'
		И я нажимаю на кнопку с именем 'ВаринатРасположенияАналитик'
		И в меню формы я выбираю 'Аналитики рядом'
		И я нажимаю на кнопку с именем 'КнопкаПрименить'
		Тогда открылось окно 'Сводная таблица: ВА - Количество (ФА)(cводная таблица)( Основной) *'
		И я нажимаю на кнопку с именем 'ПоказатьДополнительныеОтборы'
		И в таблице "НастройкиОтборов" я перехожу к строке:
			| 'Вид сравнения' | 'Использовать' | 'Поле'         |
			| 'Равно'         | 'Нет'          | 'Номенклатура' |
		И в таблице "НастройкиОтборов" я устанавливаю флаг с именем 'НастройкиОтборовИспользовать'
		И в таблице "НастройкиОтборов" я активизирую поле с именем "НастройкиОтборовВидСравнения"
		И в таблице "НастройкиОтборов" я выбираю текущую строку
		И в таблице "НастройкиОтборов" из выпадающего списка с именем "НастройкиОтборовВидСравнения" я выбираю точное значение 'В списке'
		И в таблице "НастройкиОтборов" я активизирую поле с именем "НастройкиОтборовЗначениеОтбора"
		И в таблице "НастройкиОтборов" я нажимаю кнопку выбора у реквизита с именем "НастройкиОтборовЗначениеОтбора"
		Тогда открылось окно 'Список значений'
		И я нажимаю на кнопку с именем 'Add'
		И в таблице "ValueList" из выпадающего списка с именем "Value" я выбираю точное значение '1С:ERP. Управление холдингом'
		И я нажимаю на кнопку с именем 'Add'
		И в таблице "ValueList" из выпадающего списка с именем "Value" я выбираю точное значение '1С:Управление холдингом 8'
		И я нажимаю на кнопку с именем 'OK'
		Тогда открылось окно 'Сводная таблица: ВА - Количество (ФА)(cводная таблица)( Основной) *'
		И в таблице "НастройкиОтборов" я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'ОбновитьДанныеТаблицы'
		
	* Сравниваем результат
		Тогда табличный документ "ПолеТабличногоДокументаМакет" равен по шаблону:
			| 'ВА - Количество (ФА)(cводная таблица)' | 'Номенклатура'                 | 'Январь 2021 г.' | ''            | ''        | 'Февраль 2021 г.' | ''            | ''        | 'Март 2021 г.' | ''            | ''        | '1 квартал 2021 г.' | ''            | ''        | 'Итого'      | ''            | ''        |
			| 'ВА - Количество (ФА)(cводная таблица)' | ''                             | 'Количество'     | 'Коэффициент' | 'Итог'    | 'Количество'      | 'Коэффициент' | 'Итог'    | 'Количество'   | 'Коэффициент' | 'Итог'    | 'Количество'        | 'Коэффициент' | 'Итог'    | 'Количество' | 'Коэффициент' | 'Итог'    |
			| 'Итог'                                  | ''                             | '0'              | '0'           | '0'       | '0'               | '0'           | '0'       | '0'            | '0'           | '0'       | '0'                 | '0'           | '0'       | '0'          | '0'           | '0'       |
			| 'Товары'                                | ''                             | '0,00081'        | '0,00005'     | '0,00162' | '0,00161'         | '0,00011'     | '0,00645' | '0,00242'      | '0,00016'     | '0,01452' | '0,00484'           | '0,00032'     | '0,02259' | '0,00484'    | '0,00032'     | '0,02259' |
			| ''                                      | '1С:ERP. Управление холдингом' | '0,00013'        | '0,00003'     | '0,00027' | '0,00027'         | '0,00005'     | '0,00108' | '0,00040'      | '0,00008'     | '0,00242' | '0,00081'           | '0,00016'     | '0,00376' | '0,00081'    | '0,00016'     | '0,00376' |
			| ''                                      | '1С:Управление холдингом 8'    | '0,00067'        | '0,00003'     | '0,00135' | '0,00134'         | '0,00005'     | '0,00538' | '0,00202'      | '0,00008'     | '0,01210' | '0,00403'           | '0,00016'     | '0,01882' | '0,00403'    | '0,00016'     | '0,01882' |

	* Закрываем сводную таблицу
		И Я закрываю окно 'Сводная таблица: ВА - Количество (ФА)(cводная таблица)( Основной) *'
