Есть три таблицы:

1. Справочник категорий (id, name). 

	*Тут просто лежат названия категорий и айдишки, ничего сложного.*

2. Справочник сущностей (id, category_id, name). 

	*Сущности, как я понимаю, что-то вроде подкатегорий или типов транзакций, 
 но для нас они просто склейка между таблицами. Внутри одной категории может быть несколько сущностей, 
 а к одной сущности может относиться несколько операций.*

3. Основная таблица записи операций (id, date_time, item_id, cost, revenue, profit).

	*Здесь item_id=id сущности, а profit это cost-revenue. Также сказано, что прибыль функционально зависит 
 от цен покупки и продажи, таблица умышленно денормализована для упрощения выборок 
 (кажется, это просто пояснение колонки profit).*
 
 * * *

**Задача:**

Получить топ-10 по прибыльности операций за текущий день в разрезе категорий.

* * *

**Решение:**
Сначала нужно закрепить названия за таблицами, так как в первичных данных этого нет.

Допустим, что:

-   справочник категорий - **categories_table**,
-   справочник сущностей - **items_table**,
-   таблица записи операций - **operations_table**.

Теперь нам нужна база данных, чтобы проверять на ней наши запросы. 
Я использую **MariaDB**. Insert code:

```sql
CREATE TABLE IF NOT EXISTS `categories_table` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
```

```sql
CREATE TABLE IF NOT EXISTS `operations_table` (
  `id` int(11) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `revenue` float DEFAULT NULL,
  `profit` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
```

```sql
CREATE TABLE IF NOT EXISTS `items_table` (
  `id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
```

```sql
INSERT INTO `categories_table` (`id`, `name`) VALUES
	(1, ' Category 1'),
	(2, ' Category 2'),
	(3, ' Category 3'),
 	(4, ' Category 4');
```

```sql
INSERT INTO `items_table` (`id`, `category_id`, `name`) VALUES
	(1, 1, 'Item 100001'),
	(2, 1, 'Item 100002'),
	(3, 2, 'Item 100003'),
  	(4, 5, 'Item 100004'),
  	(5, 3, 'Item 100005');
```

```sql
INSERT INTO `operations_table` 
(`id`, `date_time`, `item_id`, `cost`, `revenue`, `profit`) VALUES
	(1,'2018-04-18 0:00:01',1,3.5,10,6.5),
	(2,'2018-04-18 0:00:01',1,3.8,9.8,6.0),
  	(3,'2018-04-18 0:00:02',3,5,4.9,-0.1),
  	(4,'2018-04-18 0:00:02',3,8,12,4.0),
  	(5,'2018-04-18 0:00:01',2,2,9.5,7.5),
  	(6,'2018-04-18 0:00:01',2,8,9.2,1.2),
  	(7,'2018-04-18 0:00:02',8,12,4.7,-7.3),
  	(8,'2018-04-18 0:00:04',1,3,3.4,0.4),
  	(9,'2018-04-18 0:00:01',1,0,9,9.0),
  	(10,'2018-04-17 0:00:02',2,4.3,1.2,-3.1),
  	(11,'2018-04-18 0:00:01',2,7.7,4.1,-3.6),
  	(13,'2018-04-18 0:00:02',3,0.3,9,8.7),
  	(14,'2018-04-19 0:00:02',9,5,7,2.0);

```
Далее определимся с итоговой выгрузкой, а именно ее видом. 
Нам точно понадобятся:

-   название и, для перестраховки, айди категории, 
-   прибыльность (profit), 
-   дата и время проведения операции 
-   айди той самой операции, что бы если что восстановить все данные о ней.
    
![Пример выгрузки](https://lh6.googleusercontent.com/bvlJdIA8RxZnflolLlY3ZG2lrBthn8VZVxCwG9jI9Fz4tTT6Pv4LmNZUrkRKj5nXJ1qjyqAzc3G16JghSCmi6GCjeHcZTQiqXMszDC17i6R2fKmdXsiUXHEF7BXA2ck_hseqSr2C)


Подготовка на этом закончена, пора и код писать.

Основа кода здесь это соединение 3х таблиц. Я выбрала inner join для справочников, 
поскольку нам нужны только те категории, в которых прописаны сущности и наоборот. 
Для соединения с таблицей операций я использовала left join, поскольку 
операции без категорий тоже могут быть полезны при анализе. 
В случае если такие появлялись в выборке, они помечались как 'no_catagory' и считались отдельной категорией.

Для выборки топ 10, я использовала функцию row_number() с сортировкой по прибыли и 
выбрала только те строки, где значение было ниже 10.

Вот и все . Никакой магии.

```
select id as transaction_id, 
coalesce(category,'no_catagory') as category_name, item_id, date_time, profit, top
from 
	(select *,
	 row_number() over (partition by category order by profit desc) as top
	 from
	 	(select *
		 from operations_table
		 where date(date_time)=date('2018-04-18'))a
	left join
		(select a.name as category,a.id as category_id, b.id as item_id 
		 from 
		 	(select * from categories_table)a
		 inner join
			(select * from items_table)b
		 on a.id=b.category_id
		 group by a.name,a.id,b.id)b
	using(item_id))a 
where top<=10
group by id,category, item_id, date_time, profit, top
order by category_name, top

```
