﻿#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии общие

Сценарий: Инициализация переменных

	И Я запоминаю значение выражения 'ИдентификацияПродуктаУХКлиентСервер.ЭтоУправлениеХолдингом() И НЕ ИдентификацияПродуктаУХКлиентСервер.ЭтоЕХ()' в переменную "$$ЭтоУХ$$"
	И Я запоминаю значение выражения 'ИдентификацияПродуктаУХКлиентСервер.ЭтоУправлениеХолдингом() И ИдентификацияПродуктаУХКлиентСервер.ЭтоЕХ()' в переменную "$$ЭтоЕРПУХ$$"
	И Я запоминаю значение выражения 'ИдентификацияПродуктаУХКлиентСервер.ВерсияУправлениеХолдингом()' в переменную "$$ВерсияУХ$$"

	И я выполняю код встроенного языка на сервере
	"""bsl
	Объект.ЗначениеНаСервере = Константы.ИспользоватьРасширенныйАлгоритмПересчетаПоказателей.Получить()
	"""	
	И Я запоминаю значение выражения 'Ванесса.Объект.ЗначениеНаСервере' в переменную "$$РасширенныйАлгоритмРасчетаПоказателей$$"


		

		
