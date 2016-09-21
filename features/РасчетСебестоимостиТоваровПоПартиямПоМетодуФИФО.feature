﻿# encoding: utf-8
# language: ru

@tree

Функционал: Расчет себестоимости товаров по партиям по методу ФИФО
	Как бухгалтер
	Хочу обработку расчета себестоимости товаров по партиям по методу ФИФО
	Чтобы в конце отчетного периода считать валовую прибыль


Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий


Сценарий: расчета себестоимости товаров
	Допустим я подготавливаю вспомогательные данные для себестоимости
	Когда я создаю покупку
		Когда Я нажимаю кнопку командного интерфейса "Покупка"
		Тогда открылось окно "Покупка"
		И     я нажимаю на кнопку "Создать"

	И я заполняю шапку документа
		Когда открылось окно "Покупка (создание)"
		И     в поле "Дата" я ввожу текст "01.09.2016  0:00:00"
		И     я перехожу к следующему реквизиту

	И я выбираю товары
		Когда открылось окно "Покупка (создание) *"
		И     в ТЧ "СписокНоменклатуры" я нажимаю на кнопку "Добавить"
		И     в ТЧ "СписокНоменклатуры" я выбираю значение реквизита "Номенклатура" из формы списка
		Тогда открылось окно "Номенклатура"
		И     В форме "Номенклатура" в таблице "Список" я перехожу к строке:
		| 'Наименование'      |
		| 'Товар для расчета себестоимости' |
		И     я нажимаю на кнопку "Выбрать"
		Тогда открылось окно "Покупка (создание) *"
		И     в ТЧ "СписокНоменклатуры" я активизирую поле "Количество"
		И     в ТЧ "СписокНоменклатуры" в поле "Количество" я ввожу текст "10"
		И     в ТЧ "СписокНоменклатуры" я активизирую поле "Цена"
		И     в ТЧ "СписокНоменклатуры" в поле "Цена" я ввожу текст "10,00"
		И     В форме "Покупка (создание) *" в ТЧ "СписокНоменклатуры" я завершаю редактирование строки
			
	И я провожу документ
		Когда открылось окно "Покупка (создание) *"
		И     я нажимаю на кнопку "Провести"
		И Пауза 3

	Когда я создаю покупку
		Когда Я нажимаю кнопку командного интерфейса "Покупка"
		Тогда открылось окно "Покупка"
		И     я нажимаю на кнопку "Создать"

	И я заполняю шапку документа
		Когда открылось окно "Покупка (создание)"
		И     в поле "Дата" я ввожу текст "03.09.2016  0:00:00"
		И     я перехожу к следующему реквизиту

	И я выбираю товары
		Когда открылось окно "Покупка (создание) *"
		И     в ТЧ "СписокНоменклатуры" я нажимаю на кнопку "Добавить"
		И     в ТЧ "СписокНоменклатуры" я выбираю значение реквизита "Номенклатура" из формы списка
		Тогда открылось окно "Номенклатура"
		И     В форме "Номенклатура" в таблице "Список" я перехожу к строке:
		| 'Наименование'      |
		| 'Товар для расчета себестоимости' |
		И     я нажимаю на кнопку "Выбрать"
		Тогда открылось окно "Покупка (создание) *"
		И     в ТЧ "СписокНоменклатуры" я активизирую поле "Количество"
		И     в ТЧ "СписокНоменклатуры" в поле "Количество" я ввожу текст "20"
		И     в ТЧ "СписокНоменклатуры" я активизирую поле "Цена"
		И     в ТЧ "СписокНоменклатуры" в поле "Цена" я ввожу текст "15,00"
		И     В форме "Покупка (создание) *" в ТЧ "СписокНоменклатуры" я завершаю редактирование строки
			
	И я провожу документ
		Когда открылось окно "Покупка (создание) *"
		И     я нажимаю на кнопку "Провести"
		И Пауза 3
	
	И я создаю продажу
		Когда Я нажимаю кнопку командного интерфейса "Продажа"
		Тогда открылось окно "Продажа"
		И     я нажимаю на кнопку "Создать"
    
	И я заполняю шапку документа
		Когда открылось окно "Продажа (создание)"
		И     в поле "Дата" я ввожу текст "10.09.2016  0:00:00"
		И     я перехожу к следующему реквизиту

	И я выбираю товары
		Когда открылось окно "Продажа (создание) *"
		И     в ТЧ "СписокНоменклатуры" я нажимаю на кнопку "Добавить"
		И     в ТЧ "СписокНоменклатуры" я выбираю значение реквизита "Номенклатура" из формы списка
		Тогда открылось окно "Номенклатура"
		И     В форме "Номенклатура" в таблице "Список" я перехожу к строке:
		| 'Наименование'                        |
		| 'Товар для расчета себестоимости' |
		И     В форме "Номенклатура" в ТЧ "Список" я выбираю текущую строку
		Тогда открылось окно "Продажа (создание) *"
		И     в ТЧ "СписокНоменклатуры" я активизирую поле "Количество"
		И     в ТЧ "СписокНоменклатуры" в поле "Количество" я ввожу текст "24"
		И     в ТЧ "СписокНоменклатуры" я активизирую поле "Цена"
		И     в ТЧ "СписокНоменклатуры" в поле "Цена" я ввожу текст "100,00"
		И     В форме "Продажа (создание) *" в ТЧ "СписокНоменклатуры" я завершаю редактирование строки
		
	И я провожу документ
		Когда открылось окно "Продажа (создание) *"
		И     я нажимаю на кнопку "Провести"
		И пауза 3

	И я открываю расчет себестоимости
		Когда Я нажимаю кнопку командного интерфейса "Обработка расчета себестоимости"
	
	И я заполняю реквизиты
		Когда открылось окно "Обработка расчета себестоимости"
		И     в поле "Дата начала" я ввожу текст "01.09.2016"
		И     в поле "Дата конца" я ввожу текст "30.09.2016"
		И     я выбираю значение реквизита "Номенклатура" из формы списка
		Тогда открылось окно "Номенклатура"
		И     В форме "Номенклатура" в таблице "Список" я перехожу к строке:
		| 'Наименование'                    |
		| 'Товар для расчета себестоимости' |
		И     В форме "Номенклатура" в ТЧ "Список" я выбираю текущую строку
		Тогда открылось окно "Обработка расчета себестоимости"
		И     я нажимаю на кнопку "Заполнить количество продано"

	И я нажимаю кнопку расчет
		Когда открылось окно "Обработка расчета себестоимости"
		И     я нажимаю на кнопку "Рассчитать себестоимость"

	Тогда результат расчета корректен
		И     таблица формы с именем "ТабличнаяЧастьПриходПартий" стала равной:
		| 'N' | 'Номенклатура'                    | 'Себестоимость' | 'Партия'                                   | 'Количество' |
		| '1' | 'Товар для расчета себестоимости' | '100,00'        | * | '10,000'     |
		| '2' | 'Товар для расчета себестоимости' | '210,00'        | * | '14,000'     |
