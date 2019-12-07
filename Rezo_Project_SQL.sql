-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.14-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for mywebsite
CREATE DATABASE IF NOT EXISTS `mywebsite` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mywebsite`;

-- Dumping structure for table mywebsite.chef
CREATE TABLE IF NOT EXISTS `chef` (
  `chefID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `aboutMe` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`chefID`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8 COMMENT='List of chefs that can be chosen to order food from';

-- Dumping data for table mywebsite.chef: ~10 rows (approximately)
/*!40000 ALTER TABLE `chef` DISABLE KEYS */;
INSERT INTO `chef` (`chefID`, `name`, `aboutMe`) VALUES
	(11, 'Ferdousi Begum(B)', 'Bangali Cuisine'),
	(22, 'Ruksana Akhter(B)', 'Bangali Cuisine'),
	(33, 'Shazia Ali(P)', 'Pakistani Cuisine'),
	(44, 'Samara Khan(P)', 'Pakistani Cuisine'),
	(55, 'Ankita Jha(NI)', 'North Indian Cuisine'),
	(66, 'Navya Swamy(NI)', 'North Indian Cuisine'),
	(77, 'Gunjan Aggarwal(SI)', 'South Indian Cuisine'),
	(88, 'Richa Rattan(SI)', 'South Indian Cuisine'),
	(99, 'Asiya Andrabi(K)', 'Kashmiri Cuisine'),
	(110, 'Bajracharya Bakhrel(N)', 'Nepalese Cuisine');
/*!40000 ALTER TABLE `chef` ENABLE KEYS */;

-- Dumping structure for table mywebsite.food
CREATE TABLE IF NOT EXISTS `food` (
  `foodID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `f_regionID` int(11) DEFAULT NULL,
  `f_chefID` int(11) DEFAULT NULL,
  PRIMARY KEY (`foodID`),
  KEY `FK_food_region` (`f_regionID`),
  KEY `FK_food_chefs` (`f_chefID`),
  CONSTRAINT `FK_food_chefs` FOREIGN KEY (`f_chefID`) REFERENCES `chef` (`chefID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_food_region` FOREIGN KEY (`f_regionID`) REFERENCES `region` (`regionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- Dumping data for table mywebsite.food: ~31 rows (approximately)
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` (`foodID`, `name`, `description`, `price`, `f_regionID`, `f_chefID`) VALUES
	(1, 'Kacchi Biryani', NULL, NULL, 30, 22),
	(2, 'Beef Tehari', NULL, NULL, 30, 88),
	(3, '5-Bhorthas', NULL, NULL, 30, 99),
	(4, 'Kalo Bhuna', NULL, NULL, 30, 11),
	(5, 'Elish Maas', NULL, NULL, 30, 99),
	(6, 'Rui Maas', NULL, NULL, 30, 66),
	(7, 'Khichuri', NULL, NULL, 20, 66),
	(8, 'Idli', NULL, NULL, 20, 110),
	(9, 'Dosa', NULL, NULL, 20, 55),
	(10, 'Pulihora', NULL, NULL, 20, 55),
	(11, 'Ven Pongal', NULL, NULL, 20, NULL),
	(12, 'Pav Bhaji', NULL, NULL, 10, NULL),
	(13, 'Chappati', NULL, NULL, 10, NULL),
	(14, 'Chicken Tikka Masala', NULL, NULL, 10, NULL),
	(15, 'Aloo Paratha', NULL, NULL, 10, NULL),
	(16, 'Rajma Chawal', NULL, NULL, 10, NULL),
	(17, 'Chole Bhatura', NULL, NULL, 10, NULL),
	(18, 'Butter Chicken', NULL, NULL, 10, NULL),
	(19, 'Dhokla ', NULL, NULL, 10, NULL),
	(20, 'Nihari', NULL, NULL, 40, NULL),
	(21, 'Goat Paya', NULL, NULL, 40, NULL),
	(22, 'Naan ', NULL, NULL, 40, NULL),
	(23, 'Chicken Karahi', NULL, NULL, 40, NULL),
	(24, 'Chicken Dum Biryani ', NULL, NULL, 40, NULL),
	(25, 'Mutton Biryani', NULL, NULL, 40, NULL),
	(26, 'Yakhni ', NULL, NULL, 50, NULL),
	(27, 'Rogan Josh', NULL, NULL, 50, NULL),
	(28, 'Modur Pulav', NULL, NULL, 50, NULL),
	(29, 'Beef Momo', NULL, NULL, 60, NULL),
	(30, 'Chicken Momo', NULL, NULL, 60, NULL),
	(31, 'Thukpa', NULL, NULL, 60, NULL);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;

-- Dumping structure for table mywebsite.order
CREATE TABLE IF NOT EXISTS `order` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `price` date DEFAULT NULL,
  `quantity` date DEFAULT NULL,
  `order_userID` int(11) DEFAULT NULL,
  `order_foodID` int(11) DEFAULT NULL,
  `Column 5` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  KEY `FK_orders_users` (`order_userID`),
  KEY `FK_orders_food` (`order_foodID`),
  CONSTRAINT `FK_orders_food` FOREIGN KEY (`order_foodID`) REFERENCES `food` (`foodID`),
  CONSTRAINT `FK_orders_users` FOREIGN KEY (`order_userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table mywebsite.order: ~0 rows (approximately)
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;

-- Dumping structure for table mywebsite.region
CREATE TABLE IF NOT EXISTS `region` (
  `regionID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`regionID`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- Dumping data for table mywebsite.region: ~6 rows (approximately)
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` (`regionID`, `name`) VALUES
	(10, 'North Indian'),
	(20, 'South Indian'),
	(30, 'Bangladeshi'),
	(40, 'Pakistani '),
	(50, 'Kashmiri'),
	(60, 'Nepal');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;

-- Dumping structure for table mywebsite.shoppingcart
CREATE TABLE IF NOT EXISTS `shoppingcart` (
  `shoppingCart_ID` int(11) NOT NULL AUTO_INCREMENT,
  `price` int(11) NOT NULL DEFAULT 0,
  `quantity` int(2) NOT NULL,
  `shp_foodID` int(11) NOT NULL,
  PRIMARY KEY (`shoppingCart_ID`),
  KEY `FK_shoppingCart_food` (`shp_foodID`),
  CONSTRAINT `FK_shoppingCart_food` FOREIGN KEY (`shp_foodID`) REFERENCES `food` (`foodID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table mywebsite.shoppingcart: ~0 rows (approximately)
/*!40000 ALTER TABLE `shoppingcart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart` ENABLE KEYS */;

-- Dumping structure for table mywebsite.userdetails
CREATE TABLE IF NOT EXISTS `userdetails` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table mywebsite.userdetails: ~0 rows (approximately)
/*!40000 ALTER TABLE `userdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `userdetails` ENABLE KEYS */;

-- Dumping structure for table mywebsite.users
CREATE TABLE IF NOT EXISTS `users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `adminFlag` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table mywebsite.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`userID`, `username`, `password`, `firstname`, `lastname`, `email`, `adminFlag`) VALUES
	(7, 'user1', 'pass1', 'Zannatul', 'Rezwana', 'zr@email.com', 0),
	(10, 'admin', 'adminpass', 'admin', 'admin', 'admin@admin.com', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
