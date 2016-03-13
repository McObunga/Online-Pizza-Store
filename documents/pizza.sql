/*
SQLyog Community v9.63 
MySQL - 5.5.15 : Database - pizza
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pizza` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `pizza`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryType` varchar(255) NOT NULL,
  PRIMARY KEY (`categoryID`),
  UNIQUE KEY `categoryType` (`categoryType`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`categoryID`,`categoryType`) values (3,'crust'),(1,'pizza'),(2,'topping');

/*Table structure for table `coupon` */

DROP TABLE IF EXISTS `coupon`;

CREATE TABLE `coupon` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `couponNo` varchar(255) NOT NULL,
  `endDate` datetime NOT NULL,
  `startDate` datetime NOT NULL,
  `isActive` bit(1) NOT NULL DEFAULT b'1',
  `discount` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `coupon` */

insert  into `coupon`(`ID`,`couponNo`,`endDate`,`startDate`,`isActive`,`discount`) values (2,'cou121212','2014-06-08 00:00:00','2012-01-06 00:00:00','',100),(3,'cou123123','2014-06-08 00:00:00','2012-01-06 00:00:00','\0',100),(4,'cou123412','2014-06-08 00:00:00','2012-01-06 00:00:00','\0',100),(5,'cou122112','2014-06-08 00:00:00','2012-01-06 00:00:00','',50),(17,'cou123456','2014-06-08 00:00:00','2012-01-06 00:00:00','',100);

/*Table structure for table `ingredient` */

DROP TABLE IF EXISTS `ingredient`;

CREATE TABLE `ingredient` (
  `ingredientID` int(11) NOT NULL AUTO_INCREMENT,
  `ingredientName` varchar(255) NOT NULL,
  `plarge` int(11) NOT NULL,
  `pmedium` int(11) NOT NULL,
  `psmall` int(11) NOT NULL,
  `categoryID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ingredientID`),
  UNIQUE KEY `ingredientName` (`ingredientName`),
  KEY `FKF3B271D169BD95B9` (`categoryID`),
  CONSTRAINT `FKF3B271D169BD95B9` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=latin1;

/*Data for the table `ingredient` */

insert  into `ingredient`(`ingredientID`,`ingredientName`,`plarge`,`pmedium`,`psmall`,`categoryID`) values (1,'Deep Dish',80,60,40,3),(2,'Wheat Thin Crust',90,70,50,3),(3,'Cheese Brust',90,70,50,3),(4,'Multigrain',80,60,40,3),(5,'Stuffed Crust',90,70,50,3),(16,'Ham',40,30,20,2),(17,'Pepproni',40,30,20,2),(22,'Mashroom',40,30,20,2),(23,'Fresh Tomato',40,30,20,2),(24,'Olives',40,30,20,2),(25,'Babycorn',40,30,20,2),(26,'Jalapeno',40,30,20,2),(27,'Cheese',40,30,20,2),(28,'Green Chilli',40,30,20,2),(29,'Panner',40,30,20,2),(30,'Golden Corn',40,30,20,2),(33,'Onion',40,30,20,2),(34,'Crisp Capsicum',40,30,20,2),(35,'Paprika',40,30,20,2),(37,'Pasto Sauce',40,30,20,2),(40,'Capsicum',40,30,20,2),(165,'cxzcxz',33,22,11,2),(166,'azxazx',33,22,11,3);

/*Table structure for table `offer` */

DROP TABLE IF EXISTS `offer`;

CREATE TABLE `offer` (
  `offerId` int(11) NOT NULL AUTO_INCREMENT,
  `offerOnAmount` int(11) DEFAULT NULL,
  `discount` int(11) NOT NULL,
  `offerName` varchar(255) NOT NULL,
  `offerOnQuantity` int(11) DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  PRIMARY KEY (`offerId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `offer` */

insert  into `offer`(`offerId`,`offerOnAmount`,`discount`,`offerName`,`offerOnQuantity`,`endDate`,`startDate`) values (14,0,4,'On Quantity',5,'2012-01-08 00:00:00','2012-01-06 00:00:00'),(15,2000,3,'On Amount',0,'2012-01-08 00:00:00','2012-01-07 00:00:00');

/*Table structure for table `orderdetail` */

DROP TABLE IF EXISTS `orderdetail`;

CREATE TABLE `orderdetail` (
  `detailID` int(11) NOT NULL,
  `ingredientID` int(11) NOT NULL,
  KEY `FK7D606D1F6697158D` (`detailID`),
  KEY `FK7D606D1F4E86161F` (`ingredientID`),
  CONSTRAINT `FK7D606D1F4E86161F` FOREIGN KEY (`ingredientID`) REFERENCES `ingredient` (`ingredientID`),
  CONSTRAINT `FK7D606D1F6697158D` FOREIGN KEY (`detailID`) REFERENCES `userorder` (`detailID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `orderdetail` */

insert  into `orderdetail`(`detailID`,`ingredientID`) values (1,27),(1,29),(1,33),(1,5),(2,25),(2,28),(2,3),(3,28),(3,33),(3,3),(4,17),(4,24),(4,27),(4,5),(5,25),(5,28),(5,5),(6,28),(6,33),(6,3),(7,22),(7,25),(7,3),(8,26),(8,29),(8,1),(9,27),(9,28),(9,33),(9,3),(10,24),(10,27),(10,2),(11,27),(11,29),(11,2),(12,22),(12,28),(12,3),(13,26),(13,27),(13,29),(13,5),(14,24),(14,27),(14,2);

/*Table structure for table `preference` */

DROP TABLE IF EXISTS `preference`;

CREATE TABLE `preference` (
  `userID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  KEY `FKA8FCBCDBC87484D7` (`productID`),
  KEY `FKA8FCBCDBD7C5FB41` (`userID`),
  CONSTRAINT `FKA8FCBCDBC87484D7` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`),
  CONSTRAINT `FKA8FCBCDBD7C5FB41` FOREIGN KEY (`userID`) REFERENCES `userinfo` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `preference` */

insert  into `preference`(`userID`,`productID`) values (9,21),(9,22),(29,20),(29,21);

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `plarge` int(11) NOT NULL,
  `pmedium` int(11) NOT NULL,
  `psmall` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`productID`),
  UNIQUE KEY `productName` (`productName`),
  KEY `FKED8DCCEF69BD95B9` (`categoryID`),
  CONSTRAINT `FKED8DCCEF69BD95B9` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

/*Data for the table `product` */

insert  into `product`(`productID`,`description`,`image`,`productName`,`categoryID`,`plarge`,`pmedium`,`psmall`,`price`) values (20,'Pizza with toppings Fresh Tomato, Cheese','resources/images/pizza_images/pizza1.jpg','Margherita',1,150,100,75,NULL),(21,'Pizza with toppings Fresh Tomato, Mashroom','resources/images/pizza_images/pizza2.jpg','FarmHouse',1,200,150,120,NULL),(22,'Pizza with toppings Fresh Tomato, Babycorn, Green Chilli','resources/images/pizza_images/pizza3.jpg','Country Special',1,200,150,120,NULL),(23,'Pizza with toppings Olives, Jalapeno, Cheese, Golden Corn','resources/images/pizza_images/pizza4.jpg','Gourmet',1,250,200,150,NULL),(24,'Pizza with toppings Mashroom, Paneer, Golden Corn','resources/images/pizza_images/pizza5.jpg','Maxican Green wave',1,300,250,200,NULL),(25,'Pizza with toppings Paneer, Green Chilli','resources/images/pizza_images/pizza6.jpg','Peppy Panneer',1,300,250,200,NULL),(26,'Pizza with toppings Fresh Tomato, Olives, Jalapeno, Cheese, Golden Corn','resources/images/pizza_images/pizza7.jpg','Veg Extravaganza',1,300,250,200,NULL),(27,'Pizza with toppings Pepproni, Mashroom, Paneer, Golden Corn','resources/images/pizza_images/pizza8.jpg','Deluxe Veggie',1,300,250,200,NULL),(28,'Pizza with toppings Ham, Pepproni, Mashroom','resources/images/pizza_images/pizza9.jpg','Fresh Veggie',1,200,150,100,NULL),(44,'pizza with toppings mashroom, cheese','resources/images/pizza_images/pizza11.jpg','timepass',1,333,222,111,NULL);

/*Table structure for table `productingredient` */

DROP TABLE IF EXISTS `productingredient`;

CREATE TABLE `productingredient` (
  `productID` int(11) NOT NULL,
  `ingredientID` int(11) NOT NULL,
  KEY `FK54F42000C87484D7` (`productID`),
  KEY `FK54F420004E86161F` (`ingredientID`),
  CONSTRAINT `FK54F420004E86161F` FOREIGN KEY (`ingredientID`) REFERENCES `ingredient` (`ingredientID`),
  CONSTRAINT `FK54F42000C87484D7` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `productingredient` */

insert  into `productingredient`(`productID`,`ingredientID`) values (20,23),(20,27),(21,22),(21,23),(23,24),(23,26),(23,27),(23,30),(24,22),(24,29),(24,30),(25,28),(25,29),(26,23),(26,24),(26,26),(26,27),(26,30),(27,17),(27,22),(27,29),(27,30),(28,16),(28,17),(28,22),(22,23),(22,25),(22,28),(44,17),(44,22),(44,27);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `roleID` int(11) NOT NULL AUTO_INCREMENT,
  `roleType` varchar(255) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `role` */

insert  into `role`(`roleID`,`roleType`) values (1,'ROLE_ADMIN'),(2,'ROLE_BPO'),(3,'ROLE_USER');

/*Table structure for table `userinfo` */

DROP TABLE IF EXISTS `userinfo`;

CREATE TABLE `userinfo` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userAddress` varchar(255) NOT NULL,
  `userMobile` varchar(255) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `userPassword` varchar(255) NOT NULL,
  `roleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userName` (`userName`),
  KEY `FKF02772F949547FA9` (`roleID`),
  CONSTRAINT `FKF02772F949547FA9` FOREIGN KEY (`roleID`) REFERENCES `role` (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

/*Data for the table `userinfo` */

insert  into `userinfo`(`userID`,`userAddress`,`userMobile`,`userName`,`userPassword`,`roleID`) values (1,'Srinagar, indore','9039089187','deepak@gmail.com','12345',1),(2,'Srinagar, indore','9827176769','neeraj@gmail.com','11111',3),(3,'Bangali chowk, indore','9685407058','manpreet@gmail.com','121212',3),(9,'qwertyuiopasdfgh','9039089187','qd@gmail.com','123456',3),(23,'sarda house, indore','9898989898','bpo1@gmail.com','123123',2),(29,'srinagar main, indore','9867756775','abc@gmail.com','123123',3);

/*Table structure for table `userorder` */

DROP TABLE IF EXISTS `userorder`;

CREATE TABLE `userorder` (
  `detailID` int(11) NOT NULL AUTO_INCREMENT,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `size` varchar(255) NOT NULL,
  `productID` int(11) NOT NULL,
  `orderID` int(11) NOT NULL,
  PRIMARY KEY (`detailID`),
  KEY `FK151D42639E5A4E87` (`orderID`),
  KEY `FK151D4263C87484D7` (`productID`),
  CONSTRAINT `FK151D42639E5A4E87` FOREIGN KEY (`orderID`) REFERENCES `userrecord` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK151D4263C87484D7` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `userorder` */

insert  into `userorder`(`detailID`,`price`,`quantity`,`size`,`productID`,`orderID`) values (1,820,2,'plarge',22,3),(2,470,1,'plarge',25,3),(3,190,1,'psmall',28,3),(4,820,2,'plarge',22,4),(5,290,1,'psmall',25,4),(6,470,1,'plarge',25,5),(7,580,2,'psmall',25,6),(8,920,2,'plarge',26,7),(9,920,2,'plarge',23,7),(10,740,2,'plarge',21,8),(11,165,1,'psmall',20,9),(12,740,2,'plarge',22,10),(13,1530,3,'plarge',27,10),(14,560,2,'pmedium',21,11);

/*Table structure for table `userrecord` */

DROP TABLE IF EXISTS `userrecord`;

CREATE TABLE `userrecord` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) NOT NULL,
  `deliveryAddress` varchar(255) DEFAULT NULL,
  `discount` int(11) NOT NULL,
  `grandtotal` int(11) NOT NULL,
  `orderDate` datetime NOT NULL,
  `orderType` varchar(255) NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`orderID`),
  KEY `FK92F213DCD7C5FB41` (`userID`),
  CONSTRAINT `FK92F213DCD7C5FB41` FOREIGN KEY (`userID`) REFERENCES `userinfo` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `userrecord` */

insert  into `userrecord`(`orderID`,`amount`,`deliveryAddress`,`discount`,`grandtotal`,`orderDate`,`orderType`,`userID`) values (3,1480,'mahesh colony, indore.',100,1380,'2012-05-25 16:06:41','home delivery',2),(4,1110,'',50,1060,'2012-05-25 16:16:11','take away',2),(5,470,'Impetus Info-tech Pvt Ltd.',0,470,'2012-05-25 16:34:03','home delivery',1),(6,580,'Onam Plaza',100,480,'2012-05-25 19:04:23','home delivery',1),(7,1840,'Vikas Nagar, Nagpur.',100,1740,'2012-05-26 17:19:14','home delivery',2),(8,740,'',0,740,'2012-05-26 17:25:49','take away',2),(9,165,'',0,165,'2012-05-26 18:06:34','take away',9),(10,2270,'',100,2170,'2012-05-26 18:59:05','take away',9),(11,560,'',0,560,'2012-05-28 18:59:56','take away',29);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
