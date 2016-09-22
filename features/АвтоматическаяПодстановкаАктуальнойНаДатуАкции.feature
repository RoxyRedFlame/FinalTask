﻿# encoding: utf-8
# language: ru

@tree

Функционал: АвтоматическаяПодстановкаАктуальнойНаДатуАкции
	Как маркетолог
	Хочу автоматическую Подстановку актуальной Акции
	Чтобы экномить время на заполнении документа


Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий


Сценарий: подстановка текущей акции 
	Допустим я подготавливаю вспомогательные данные для заполнения акций
	Когда я создаю покупку
		Когда Я нажимаю кнопку командного интерфейса "Покупка"
		Тогда открылось окно "Покупка"
		И     я нажимаю на кнопку "Создать"
		Тогда открылось окно "Покупка (создание)"
		
	И я заполняю шапку документа
		Когда открылось окно "Покупка (создание)"
		И     в поле "Дата" я ввожу текст "15.09.2016  0:00:00"
		И     я перехожу к следующему реквизиту
		И     я перехожу к закладке "Расходы на акции"
		И     я перехожу к закладке "Группа страницы"
	Тогда элемент формы с именем "Акция" стал равен "Акция новая"
    И пауза 3


Сценарий: подстановка предыдущей акции 
	Допустим я подготавливаю вспомогательные данные для заполнения акций
	Когда я создаю покупку
		Когда Я нажимаю кнопку командного интерфейса "Покупка"
		Тогда открылось окно "Покупка"
		И     я нажимаю на кнопку "Создать"
		Тогда открылось окно "Покупка (создание)"
		
	И я заполняю шапку документа
		Когда открылось окно "Покупка (создание)"
		И     в поле "Дата" я ввожу текст "10.08.2016  0:00:00"
		И     я перехожу к следующему реквизиту
		И     я перехожу к закладке "Расходы на акции"
		И     я перехожу к закладке "Группа страницы"
	Тогда элемент формы с именем "Акция" стал равен "Акция старая"

