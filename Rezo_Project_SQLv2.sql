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
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 COMMENT='List of chefs that can be chosen to order food from';

-- Data exporting was unselected.
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

-- Data exporting was unselected.
-- Dumping structure for table mywebsite.order
CREATE TABLE IF NOT EXISTS `order` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  `order_userID` int(11) DEFAULT NULL,
  `order_foodID` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  KEY `FK_orders_users` (`order_userID`),
  KEY `FK_orders_food` (`order_foodID`),
  CONSTRAINT `FK_orders_food` FOREIGN KEY (`order_foodID`) REFERENCES `food` (`foodID`),
  CONSTRAINT `FK_orders_users` FOREIGN KEY (`order_userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table mywebsite.region
CREATE TABLE IF NOT EXISTS `region` (
  `regionID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`regionID`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table mywebsite.userdetails
CREATE TABLE IF NOT EXISTS `userdetails` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table mywebsite.users
CREATE TABLE IF NOT EXISTS `users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
