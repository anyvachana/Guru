# Guru

Три задачки для тестового в рекламное агенство. 

***

## Задача на SQL:

Есть три таблицы:

1. Справочник категорий (id, name). 

  *Тут просто лежат названия категорий и айдишки, ничего сложного.*

2. Справочник сущностей (id, category_id, name). 

  *Сущности, как я понимаю, что-то вроде подкатегорий или типов транзакций, но для нас они просто склейка между таблицами. 
  Внутри одной категории может быть несколько сущностей, а к одной сущности может относиться несколько операций.*

3. Основная таблица записи операций (id, date_time, item_id, cost, revenue, profit). 

  *Здесь item_id=id сущности, а profit это cost-revenue. Также сказано, что прибыль функционально зависит от цен покупки и продажи, таблица умышленно денормализована для упрощения выборок (кажется, это просто пояснение колонки profit).*

![пример данных 3 таблицы](https://lh6.googleusercontent.com/zsGgVW52RSU0yxrR0SNaf9WwGgtOWKbXoExIuYLoQ7NzPwcKVOT-MhS7nGdYvb7w0sXrQ2Dq-iqMdZtATKL7sfrQZT69_8vVjsLT5QK2k0cZfz93nwNEJVvAM5w7oIWKNSvq2_uV)

### Задача:

получить топ-10 по прибыльности операций за текущий день в разрезе категорий.

***

## Задача на статистику:

Представлено 200 измерений (первые 200 строк), каждое содержит 
значение 5 признаков(A,B,C,D,E) и 1 показатель (R).

![пример данных](http://dl4.joxi.net/drive/2018/05/24/0021/3146/1432650/50/b62f95e2c1.png)

### Задача:

1. построить модель зависимости показателя от признаков 
(подсказка: не все из признаков могут влиять на показатель),

2. предсказать значение показателя на основе значений признаков для последних 10 строк.

***

## Задачка на логику:

Василий каждый день приходит на работу в офис. 
Каждый раз когда Василий заходит в свой кабинет в офисе раздаётся звук кукушки, 
оповещающий сотрудников о начале рабочего дня. 

### Задача:

Является ли приход Василия на работу причиной звука кукушки? 
Как можно доказать наличие или отсутствие причинно-следственной связи? 
                

