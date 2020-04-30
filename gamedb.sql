-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: game
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CID` int NOT NULL,
  `first_name` varchar(32) DEFAULT NULL,
  `last_name` varchar(32) NOT NULL,
  `address` varchar(256) NOT NULL,
  `city` varchar(32) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `email` varchar(320) NOT NULL,
  `age` tinyint DEFAULT NULL,
  `over_18` tinyint(1) DEFAULT '0',
  `loyalty` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Dave','Davenport','The Penthouse','Southampton','SO15 2LP','daveybabey@mailotron.com',23,1,1),(2,'Sum','Wan','The house on the corner','Southampton','SO15 2LP','UWanSum@mailroyale.io',46,1,0),(3,'Gary','Escargot','A pineapple under the sea','Bikini Bottom','BB1 1PA','GaryElSnailio@scubamail.co.uk',3,0,0),(4,'Donnie J.','Drumpf','Drumpf Tower','New York City','10022','POTUS@executivebranchmail.com',73,1,0);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OID` int NOT NULL,
  `FK_CID` int NOT NULL,
  `placed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`OID`),
  KEY `FK_CID` (`FK_CID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`FK_CID`) REFERENCES `customers` (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2020-04-29 16:17:42',74.97),(2,2,'2020-04-29 16:25:49',49.99),(3,3,'2020-04-29 16:26:13',19.99);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_products` (
  `FK_OID` int NOT NULL,
  `FK_PID` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  KEY `FK_OID` (`FK_OID`),
  KEY `FK_PID` (`FK_PID`),
  CONSTRAINT `orders_products_ibfk_1` FOREIGN KEY (`FK_OID`) REFERENCES `orders` (`OID`),
  CONSTRAINT `orders_products_ibfk_2` FOREIGN KEY (`FK_PID`) REFERENCES `products` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products`
--

LOCK TABLES `orders_products` WRITE;
/*!40000 ALTER TABLE `orders_products` DISABLE KEYS */;
INSERT INTO `orders_products` VALUES (1,1,1),(1,2,1),(1,3,1),(2,1,1),(3,2,1);
/*!40000 ALTER TABLE `orders_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `PID` int NOT NULL,
  `title` varchar(32) NOT NULL,
  `dev_studio` varchar(32) NOT NULL,
  `publisher` varchar(32) DEFAULT NULL,
  `age_rating` varchar(5) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `release_date` date NOT NULL,
  `availability` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Shooty, shooty, bang, bang','Activision','EA','16',49.99,'2019-11-16',1),(2,'Binman Simulator','indystud2','indystud2','3+',19.99,'2018-07-03',1),(3,'Tonic the Wedgehog','Tonic Team','BODEGA','PG13',4.99,'1991-06-10',1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-30 16:08:58
