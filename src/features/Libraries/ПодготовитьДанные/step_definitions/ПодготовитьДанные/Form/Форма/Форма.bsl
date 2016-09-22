﻿//начало текста модуля

///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ПодготовитьДанныеИзМакета(Парам01)","ПодготовитьДанныеИзМакета","Когда Подготовить данные из макета ""ТоварДляПоступления""");

	Возврат ВсеТесты;

КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры


///////////////////////////////////////////////////
&НаКлиенте
Функция ПолучитьПутьКФайлуОтносительноКаталогоFeatures(ИмяФайлаСРасширением)
	
	ПутьКФайлу = "";
	СостояниеVanessaBehavior = Ванесса.ПолучитьСостояниеVanessaBehavior();
	ПутьКТекущемуFeatureФайлу = СостояниеVanessaBehavior.ТекущаяФича.ПолныйПуть;
	ПутьКФайлу = Лев(ПутьКТекущемуFeatureФайлу, СтрНайти(ПутьКТекущемуFeatureФайлу, "features") - 1) + ИмяФайлаСРасширением;
	Возврат ПутьКФайлу;
	
КонецФункции

&НаКлиенте
Процедура ЗагрузитьFixtureИзМакета(ИмяМакета)
	
	Ванесса.ЗапретитьВыполнениеШагов();
	НачальноеИмяФайла = ПолучитьПутьКФайлуОтносительноКаталогоFeatures("tools\Выгрузка и загрузка данных XML.epf");
	Адрес = "";
	СтруктураПараметры = Новый Структура();
	СтруктураПараметры.Вставить("ИмяМакета", ИмяМакета);
	МакетОбработкиСвязаннаяСИсполняемойФичей = Ванесса.ОбработкаСвязаннаяСИсполняемойФичей.ПолучитьМакетОбработки(ИмяМакета);
	СтруктураПараметры.Вставить("МакетОбработкиСвязаннаяСИсполняемойФичей", МакетОбработкиСвязаннаяСИсполняемойФичей);
	НачатьПомещениеФайла(
		Новый ОписаниеОповещения("ЗагрузитьFixtureИзМакетаЗавершение", ЭтотОбъект, СтруктураПараметры), 
		Адрес, 
		НачальноеИмяФайла, 
		Ложь);

КонецПроцедуры

&НаКлиенте
Процедура ЗагрузитьFixtureИзМакетаЗавершение(УдалосьПоместитьФайл, Адрес, ВыбранноеИмяФайла, Параметры) Экспорт
	
	ЗагрузитьFixtureИзМакетаЗавершениеНаСервере(Адрес, Параметры.ИмяМакета, Параметры.МакетОбработкиСвязаннаяСИсполняемойФичей);
	Ванесса.ПродолжитьВыполнениеШагов();

КонецПроцедуры

&НаСервере
Процедура ЗагрузитьFixtureИзМакетаЗавершениеНаСервере(Адрес, ИмяМакета, МакетОбработкиСвязаннаяСИсполняемойФичей)
	
	ИмяВременногоФайла = ПолучитьИмяВременногоФайла();
	ДвоичныеДанные = ПолучитьИзВременногоХранилища(Адрес);
	ДвоичныеДанные.Записать(ИмяВременногоФайла);
	
	ВнешняяОбработка = ВнешниеОбработки.Создать(ИмяВременногоФайла, Ложь);
	ИмяВременногоФайла = ПолучитьИмяВременногоФайла();
	
	Текст = МакетОбработкиСвязаннаяСИсполняемойФичей.ПолучитьТекст();
	
	ВременныйДокумент = Новый ТекстовыйДокумент;
	ВременныйДокумент.УстановитьТекст(Текст);
	ВременныйДокумент.Записать(ИмяВременногоФайла, КодировкаТекста.UTF8);
	
	ВнешняяОбработка.ВыполнитьЗагрузку(ИмяВременногоФайла);

КонецПроцедуры

///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//Когда Подготовить данные из макета "ТоварДляПоступления" 
//@ПодготовитьДанныеИзМакета(Парам01)
Процедура ПодготовитьДанныеИзМакета(ИмяМакета) Экспорт
	ЗагрузитьFixtureИзМакета(ИмяМакета);
КонецПроцедуры

