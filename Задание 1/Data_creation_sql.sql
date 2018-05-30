-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.2.14-MariaDB - mariadb.org binary distribution
-- Операционная система:         Win64
-- HeidiSQL Версия:              9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры для таблица reclama_guru.categories_table
CREATE TABLE IF NOT EXISTS `categories_table` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы reclama_guru.categories_table: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `categories_table` DISABLE KEYS */;
INSERT INTO `categories_table` (`id`, `name`) VALUES
	(1, ' Category 1'),
	(2, ' Category 2'),
	(3, ' Category 3');
/*!40000 ALTER TABLE `categories_table` ENABLE KEYS */;

-- Дамп структуры для таблица reclama_guru.items_table
CREATE TABLE IF NOT EXISTS `items_table` (
  `id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Дамп данных таблицы reclama_guru.items_table: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `items_table` DISABLE KEYS */;
INSERT INTO `items_table` (`id`, `category_id`, `name`) VALUES
	(1, 1, 'Item 100001'),
	(2, 1, 'Item 100002'),
	(3, 2, 'Item 100003');
/*!40000 ALTER TABLE `items_table` ENABLE KEYS */;

-- Дамп структуры для таблица reclama_guru.operations_table
CREATE TABLE IF NOT EXISTS `operations_table` (
  `id` int(11) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `revenue` float DEFAULT NULL,
  `profit` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы reclama_guru.operations_table: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `operations_table` DISABLE KEYS */;
INSERT INTO `operations_table` (`id`, `date_time`, `item_id`, `cost`, `revenue`, `profit`) VALUES
	(1, '2018-04-18 00:00:01', 1, 3.5, 10, 6.5),
	(2, '2018-04-18 00:00:02', 1, 3.8, 9.8, 6),
	(3, '2018-04-18 00:00:03', 3, 5, 4.9, -0.1);
/*!40000 ALTER TABLE `operations_table` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
