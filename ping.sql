-- MariaDB dump 10.19  Distrib 10.4.25-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: ping
-- ------------------------------------------------------
-- Server version	10.4.25-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aboutus`
--
DROP DATABASE IF EXISTS `ping`;
CREATE DATABASE `ping`;
USE `ping`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aboutus` (
  `id` int(11) NOT NULL ,
  `aboutus` varchar(500) NOT NULL,
  `mission` varchar(500) NOT NULL,
  `vision` varchar(500) NOT NULL,
  `logo` varchar(500) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aboutus`
--

LOCK TABLES `aboutus` WRITE;
/*!40000 ALTER TABLE `aboutus` DISABLE KEYS */;
INSERT INTO `aboutus` VALUES (1,'Somos una tienda de camisas estampadas',' Ofrecer un servicio eficaz de todo tipo de prendas de buena calidad y en buen estado para satisfacer las necesidades de nuestros clientes.','Convertir mi tienda en una de las más conocidas y poder llevar mis productos a todo el país y al extranjero.','',NULL,NULL);
/*!40000 ALTER TABLE `aboutus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `billState_id` int(5) NOT NULL DEFAULT 1,
  `paymentMethod_id` int(11) NOT NULL DEFAULT 1,
  `subTotal` int(11) DEFAULT NULL,
  `totalQuantity` int(11) DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `billStates_bills` (`billState_id`),
  KEY `paymentMethods_bills` (`paymentMethod_id`),
  KEY `users_bills` (`user_id`),
  CONSTRAINT `billStates_bills` FOREIGN KEY (`billState_id`) REFERENCES `billstates` (`id`),
  CONSTRAINT `paymentMethods_bills` FOREIGN KEY (`paymentMethod_id`) REFERENCES `paymentmethods` (`id`),
  CONSTRAINT `users_bills` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (1,1,1,605000,NULL,6,'2022-12-02 22:35:15','2022-12-03 00:01:36');
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billstates`
--

DROP TABLE IF EXISTS `billstates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billstates` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `state` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billstates`
--

LOCK TABLES `billstates` WRITE;
/*!40000 ALTER TABLE `billstates` DISABLE KEYS */;
INSERT INTO `billstates` VALUES (1,'Carrito',NULL,NULL),(2,'Pago',NULL,NULL),(3,'Entregado',NULL,NULL);
/*!40000 ALTER TABLE `billstates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Mujeres','008.jpg','2022-11-16 12:29:57','2022-11-16 12:29:57'),(2,'Hombres','010.jpg','2022-11-16 12:30:20','2022-11-16 12:30:20'),(3,'niños','003.jpg','2022-11-16 23:10:18','2022-11-16 10:00:00');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveries`
--

DROP TABLE IF EXISTS `deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deliveries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `direction` varchar(100) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bills_deliveries` (`bill_id`),
  CONSTRAINT `bills_deliveries` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveries`
--

LOCK TABLES `deliveries` WRITE;
/*!40000 ALTER TABLE `deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descountsettings`
--

DROP TABLE IF EXISTS `descountsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `descountsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  `descount` float NOT NULL,
  `applyDate` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descountsettings`
--

LOCK TABLES `descountsettings` WRITE;
/*!40000 ALTER TABLE `descountsettings` DISABLE KEYS */;
INSERT INTO `descountsettings` VALUES (5,'Sin descuento',0,'0000-00-00',NULL,NULL),(6,'Por Navidad',10,'2022-11-20',NULL,NULL);
/*!40000 ALTER TABLE `descountsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimensionprint`
--

DROP TABLE IF EXISTS `dimensionprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimensionprint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dimension` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimensionprint`
--

LOCK TABLES `dimensionprint` WRITE;
/*!40000 ALTER TABLE `dimensionprint` DISABLE KEYS */;
/*!40000 ALTER TABLE `dimensionprint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managementpqrs`
--

DROP TABLE IF EXISTS `managementpqrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `managementpqrs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) NOT NULL,
  `state` varchar(1) NOT NULL,
  `typePqrs_id` int(11) NOT NULL,
  `user_id` bigint(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typesPqrs_magagementPqrs` (`typePqrs_id`),
  KEY `users_managementPqrs` (`user_id`),
  CONSTRAINT `typesPqrs_magagementPqrs` FOREIGN KEY (`typePqrs_id`) REFERENCES `typespqrs` (`id`),
  CONSTRAINT `users_managementPqrs` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managementpqrs`
--

LOCK TABLES `managementpqrs` WRITE;
/*!40000 ALTER TABLE `managementpqrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `managementpqrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordersbase`
--

DROP TABLE IF EXISTS `ordersbase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordersbase` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `detail` varchar(800) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `product_id` int(11) NULL,
  `product_price` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bills_ordersBase` (`bill_id`),
  KEY `products_ordersBase` (`product_id`),
  CONSTRAINT `bills_ordersBase` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`),
  CONSTRAINT `products_ordersBase` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordersbase`
--

LOCK TABLES `ordersbase` WRITE;
/*!40000 ALTER TABLE `ordersbase` DISABLE KEYS */;
INSERT INTO `ordersbase` VALUES (8,2,'{\"product_id\":\"2\",\"nameproduct\":\"Goku dragon ball\",\"idColor\":\"6\",\"nameColor\":\"naranja\",\"idSize\":\"1\",\"nameSize\":\"S\",\"product_price\":\"55000\",\"quantity\":\"4\"}',1,2,220000,'2022-12-02 23:50:27','2022-12-02 23:50:27'),(9,10,'{\"product_id\":\"3\",\"nameproduct\":\"Luffy nika five gear one piece\",\"idColor\":\"2\",\"nameColor\":\"negro\",\"idSize\":\"2\",\"nameSize\":\"M\",\"product_price\":\"55000\",\"quantity\":\"7\"}',1,3,385000,'2022-12-03 00:01:36','2022-12-03 00:01:36');
/*!40000 ALTER TABLE `ordersbase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentmethods`
--

DROP TABLE IF EXISTS `paymentmethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentmethods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `method` varchar(60) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmethods`
--

LOCK TABLES `paymentmethods` WRITE;
/*!40000 ALTER TABLE `paymentmethods` DISABLE KEYS */;
INSERT INTO `paymentmethods` VALUES (1,'payPal',NULL,NULL),(2,'PSE',NULL,NULL);
/*!40000 ALTER TABLE `paymentmethods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_Types` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productcalification`
--

DROP TABLE IF EXISTS `productcalification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productcalification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calification` int(11) DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_productCalification` (`product_id`),
  KEY `users_productCalification` (`user_id`),
  CONSTRAINT `products_productCalification` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `users_productCalification` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcalification`
--

LOCK TABLES `productcalification` WRITE;
/*!40000 ALTER TABLE `productcalification` DISABLE KEYS */;
/*!40000 ALTER TABLE `productcalification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `garanty` int(11) DEFAULT NULL,
  `state` int(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
-- INSERT INTO `products` VALUES (1,'Camisa Koro Sensei Assassination Classroom',55000,'Te extrañamos profesor <3',NULL,12,'2022-11-16 11:49:01','2022-11-16 11:49:01'),(2,'Camisa Goku Dragon ball',55000,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,10,'2022-11-16 12:21:52','2022-11-16 12:21:52'),(3,'Camisa Luffy Nika Five Gear One Piece',55000,'',NULL,10,'2022-11-17 00:10:19','2022-11-17 00:10:19'),(4,'Camisa Saitama One Punch Man',55000,'',NULL,10,'2022-11-17 00:11:21','2022-11-17 00:11:21'),(5,'Camisa texto Beach',55000,NULL,NULL,5,'2022-11-17 13:28:12','2022-11-17 13:28:13');
INSERT INTO `products`
(`id`, `name`, `price`, `description`, `garanty`, `state`, `created_at`, `updated_at`) VALUES ('1', 'Camisa Guepardo Tri Sigma', '85000', NULL, NULL, '1', NULL, NULL),('2', 'Camisa LOVE', '85000', NULL, NULL, '1', NULL, NULL),('3', 'Camisa Gato, corazon y mano', '85000', NULL, NULL, '1', NULL, NULL),('4', 'Camisa Cuarto menguante de luna con flor y estrellas', '85000', NULL, NULL, '1', NULL, NULL),('5', 'Camisa Girl Power', '85000', NULL, NULL, '1', NULL, NULL),('6', 'Camisa Hand frutal', '85000', NULL, NULL, '1', NULL, NULL),('7', 'Camisa Mariposa', '85000', NULL, NULL, '1', NULL, NULL),('8', 'Camisa Clash Royale', '85000', NULL, NULL, '1', NULL, NULL),('9', 'Camisa Ovni y Vaca', '85000', NULL, NULL, '1', NULL, NULL),('10', 'Camisa Hombre abstracto', '85000', 'NULL', NULL, '1', NULL, NULL),('11', 'Camisa Iron man', '85000', NULL, NULL, '1', NULL, NULL),('12', 'Camisa Batman Texto', '85000', NULL, NULL, '1', NULL, NULL),('13', 'Camisa I love you Quimica', '85000', NULL, NULL, '1', NULL, NULL),('14', 'Camisa Dragon con katana', '85000', NULL, NULL, '1', NULL, NULL),('15', 'Camisa Gatito con sombrero de Ajolote', '85000', NULL, NULL, '1', NULL, NULL),('16', 'Camisa Self care', '85000', NULL, NULL, '1', NULL, NULL),('17', 'Camisa Merida y sus hermanos osos - Valiente', '85000', NULL, NULL, '1', NULL, NULL),('18', 'Camisa Spider-man', '85000', NULL, NULL, '1', NULL, NULL),('19', 'Camisa Goku niño', '85000', NULL, NULL, '1', NULL, NULL),('20', 'Camisa Chica Zeka', '85000', NULL, NULL, '1', NULL, NULL),('21', 'Camisa Pikachu Electric Feel Style', '85000', NULL, NULL, '1', NULL, NULL),('22', 'Camisa Cat Woman', '85000', NULL, NULL, '1', NULL, NULL),('23', 'Camisa Pikachu', '85000', NULL, NULL, '1', NULL, NULL),('24', 'Camisa Harley Qin', '85000', NULL, NULL, '1', NULL, NULL),('25', 'Camisa Wave Surf', '85000', NULL, NULL, '1', NULL, NULL),('26', 'Camisa Pokemons The Starters', '85000', NULL, NULL, '1', NULL, NULL),('27', 'Camisa Vibe Skeleton on beach', '85000', NULL, NULL, '1', NULL, NULL),('28', 'Camisa Wolverine Logan', '85000', NULL, NULL, '1', NULL, NULL),('29', 'Camisa Escandalosos! Pardo, Panda y Polar', '85000', NULL, NULL, '1', NULL, NULL),('30', 'Camisa buzz lightyear y Zurg estilo comic', '85000', NULL, NULL, '1', NULL, NULL),('31', 'Camisa Batman estilo comic', '85000', NULL, NULL, '1', NULL, NULL),('32', 'Camisa Craneo azul ', '85000', NULL, NULL, '1', NULL, NULL),('33', 'Camisa Deadpool', '85000', NULL, NULL, '1', NULL, NULL),('34', 'Camisa Spider-man estilo comic', '85000', NULL, NULL, '1', NULL, NULL),('35', 'Camisa La mujer maravilla - Wonder Woman', '85000', NULL, NULL, '1', NULL, NULL),('36', 'Camisa Wonder woman insignia', '85000', NULL, NULL, '1', NULL, NULL),('37', 'Camisa Iron Man Stark', '85000', NULL, NULL, '1', NULL, NULL),('38', 'Camisa Rei Neo Genesis Evangelion', '85000', NULL, NULL, '1', NULL, NULL),('39', 'Camisa Batman ', '85000', NULL, NULL, '1', NULL, NULL),('40', 'Camisa Super Man Injustice', '85000', NULL, NULL, '1', NULL, NULL),('41', 'Camisa Sailor Moon Serena Tsukino ', '85000', NULL, NULL, '1', NULL, NULL),('42', 'Camisa Thor Marvel movies', '85000', NULL, NULL, '1', NULL, NULL),('43', 'Camisa Capitan America estilo Comic', '85000', NULL, NULL, '1', NULL, NULL),('44', 'Camisa Lettering azul', '85000', NULL, NULL, '1', NULL, NULL),('45', 'Camisa Frozen Elsa y Anna', '85000', NULL, NULL, '1', NULL, NULL),('46', 'Camisa Hora de Aventura, Gumball y Un Show Mas ', '85000', NULL, NULL, '1', NULL, NULL),('47', 'Camisa Yinx azul', '85000', NULL, NULL, '1', NULL, NULL),('48', 'Camisa Jojer de Joaquin Phoenix ', '85000', NULL, NULL, '1', NULL, NULL),('49', 'Camisa Spider-Man Serie', '85000', NULL, NULL, '1', NULL, NULL),('50', 'Camisa AC DC', '85000', NULL, NULL, '1', NULL, NULL),('51', 'Camisa Batman y sus villanos del comic', '85000', NULL, NULL, '1', NULL, NULL),('52', 'Camisa Monte Fuji', '85000', NULL, NULL, '1', NULL, NULL),('53', 'Camisa Gatito con sueter', '85000', NULL, NULL, '1', NULL, NULL),('54', 'Camisa Spider-Man comics the amazing spider-man', '85000', NULL, NULL, '1', NULL, NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_categories`
--

DROP TABLE IF EXISTS `products_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_categories` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `fk_products_has_categories_categories1` (`category_id`),
  CONSTRAINT `fk_products_has_categories_categories1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_has_categories_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_categories`
--

LOCK TABLES `products_categories` WRITE;
/*!40000 ALTER TABLE `products_categories` DISABLE KEYS */;
-- INSERT INTO `products_categories` VALUES (1,2),(2,2),(3,2),(4,2),(5,1);
INSERT INTO `products_categories`(`product_id`, `category_id`) VALUES (1, 1),(2, 1),(3, 1),(4, 1),(5, 1),(6, 1),(7, 1),(8, 2),(9, 1),(10, 2),(11, 2),(12, 2),(13, 1),(14, 2),(15, 1),(16, 1),(17, 1),(18, 2),(19, 2),(20, 1),(21, 2),(22, 1),(23, 1),(24, 1),(25, 2),(26, 2),(27, 2),(28, 2),(29, 1),(30, 2),(31, 2),(32, 2),(33, 2),(34, 2),(35, 1),(36, 1),(37, 2),(38, 1),(39, 2),(40, 2),(41, 1),(42, 2),(43, 2),(44, 2),(45, 1),(46, 2),(47, 1),(48, 2),(49, 2),(50, 2),(51, 2),(52, 1),(53, 1),(54, 2);
/*!40000 ALTER TABLE `products_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_descountsettings`
--

DROP TABLE IF EXISTS `products_descountsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_descountsettings` (
  `product_id` int(11) NOT NULL,
  `descountsetting_id` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`descountsetting_id`) USING BTREE,
  KEY `fk_products_has_descountsettings_descountsettings1` (`descountsetting_id`) USING BTREE,
  CONSTRAINT `products_descountsettings_descountsettings` FOREIGN KEY (`descountsetting_id`) REFERENCES `descountsettings` (`id`),
  CONSTRAINT `products_descountsettings_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_descountsettings`
--

LOCK TABLES `products_descountsettings` WRITE;
/*!40000 ALTER TABLE `products_descountsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_descountsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_shirtcolors`
--

DROP TABLE IF EXISTS `products_shirtcolors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_shirtcolors` (
  `product_id` int(11) NOT NULL,
  `shirtcolor_id` int(11) NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`,`shirtcolor_id`),
  KEY `fk_products_has_shirtcolors_shirtcolors1` (`shirtcolor_id`),
  CONSTRAINT `products_shirtcolors_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `products_shirtcolors_shirtcolors` FOREIGN KEY (`shirtcolor_id`) REFERENCES `shirtcolors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_shirtcolors`
--

LOCK TABLES `products_shirtcolors` WRITE;
/*!40000 ALTER TABLE `products_shirtcolors` DISABLE KEYS */;
-- INSERT INTO `products_shirtcolors` VALUES (1,3,'1153467002.jpg',NULL,NULL),(2,1,'3057875722.jpg',NULL,NULL),(2,2,'4062048018.jpg',NULL,NULL),(2,6,'3381335575.jpg',NULL,NULL),(3,1,'2003813554.jpg',NULL,NULL),(3,2,'2253497583.jpg',NULL,NULL),(4,2,'2505438710.jpg',NULL,NULL),(5,1,'8407492372.jpg',NULL,NULL);
INSERT INTO `products_shirtcolors` (`product_id`, `shirtcolor_id`, `image`, `created_at`, `updated_at`) VALUES (1, 1, "0000000001.jpg", NULL, NULL),(1, 2, "0000000002.jpg", NULL, NULL),(1, 4, "0000000003.jpg", NULL, NULL),(2, 1, "0000000010.jpg", NULL, NULL),(2, 4, "0000000011.jpg", NULL, NULL),(2, 2, "0000000012.jpg", NULL, NULL),(3, 2, "0000000013.jpg", NULL, NULL),(3, 1, "0000000014.jpg", NULL, NULL),(3, 8, "0000000015.jpg", NULL, NULL),(4, 8, "0000000016.jpg", NULL, NULL),(4, 2, "0000000017.jpg", NULL, NULL),(4, 6, "0000000018.jpg", NULL, NULL),(5, 2, "1000000011.jpg", NULL, NULL),(6, 1, "1085507260.jpg", NULL, NULL),(7, 9, "1433832207.jpg", NULL, NULL),(8, 5, "1664093057.jpg", NULL, NULL),(9, 9, "1928701795.jpg", NULL, NULL),(10, 2, "2019300072.jpg", NULL, NULL),(11, 4, "2079661106.jpg", NULL, NULL),(11, 1, "2079661107.jpg", NULL, NULL),(11, 2, "2079661108.jpg", NULL, NULL),(11, 3, "2079661109.jpg", NULL, NULL),(12, 1, "2089570778.jpg", NULL, NULL),(12, 3, "2089570779.jpg", NULL, NULL),(12, 2, "2089570780.jpg", NULL, NULL),(12, 5, "2089570781.jpg", NULL, NULL),(12, 4, "2089570782.jpg", NULL, NULL),(13, 2, "2195939401.jpg", NULL, NULL),(14, 5, "2401143651.jpg", NULL, NULL),(15, 3, "2745576598.jpg", NULL, NULL),(16, 4, "2766678863.jpg", NULL, NULL),(17, 3, "2838730777.jpg", NULL, NULL),(17, 2, "2838730778.jpg", NULL, NULL),(17, 1, "2838730779.jpg", NULL, NULL),(18, 4, "3219649282.jpg", NULL, NULL),(19, 6, "3248040097.jpg", NULL, NULL),(19, 2, "3248040098.jpg", NULL, NULL),(19, 1, "3248040099.jpg", NULL, NULL),(20, 1, "3339671183.jpg", NULL, NULL),(21, 1, "3434706098.jpg", NULL, NULL),(22, 1, "3534133655.jpg", NULL, NULL),(23, 2, "3853982288.jpg", NULL, NULL),(23, 6, "3853982289.jpg", NULL, NULL),(23, 1, "3853982290.jpg", NULL, NULL),(23, 5, "3853982291.jpg", NULL, NULL),(23, 4, "3853982292.jpg", NULL, NULL),(24, 1, "3880650008.jpg", NULL, NULL),(25, 1, "4122164084.jpg", NULL, NULL),(26, 1, "3957623100.jpg", NULL, NULL),(28, 1, "4168360964.jpg", NULL, NULL),(29, 5, "4435101166.jpg", NULL, NULL),(30, 9, "4629913991.jpg", NULL, NULL),(31, 9, "4629913992.jpg", NULL, NULL),(32, 1, "4650934778.jpg", NULL, NULL),(33, 2, "4659489678.jpg", NULL, NULL),(34, 4, "4922552923.jpg", NULL, NULL),(35, 4, "5399678177.jpg", NULL, NULL),(36, 5, "5525434531.jpg", NULL, NULL),(37, 1, "5576630000.jpg", NULL, NULL),(38, 5, "5576630092.jpg", NULL, NULL),(39, 2, "5953721281.jpg", NULL, NULL),(40, 5, "6015410964.jpg", NULL, NULL),(41, 3, "6046399653.jpg", NULL, NULL),(42, 5, "6096409746.jpg", NULL, NULL),(43, 5, "6096409747.jpg", NULL, NULL),(44, 2, "6386952415.jpg", NULL, NULL),(45, 5, "6478997650.jpg", NULL, NULL),(46, 1, "6515187780.jpg", NULL, NULL),(46, 2, "6515187781.jpg", NULL, NULL),(46, 3, "6515187782.jpg", NULL, NULL),(46, 5, "6515187783.jpg", NULL, NULL),(46, 4, "6515187784.jpg", NULL, NULL),(47, 1, "6550812589.jpg", NULL, NULL),(48, 1, "6745448295.jpg", NULL, NULL),(49, 1, "7008454720.jpg", NULL, NULL),(50, 2, "7242248402.jpg", NULL, NULL),(50, 4, "7242248403.jpg", NULL, NULL),(51, 2, "7857448288.jpg", NULL, NULL),(52, 8, "8393508997.jpg", NULL, NULL),(53, 8, "9265013586.jpg", NULL, NULL),(54, 1, "9921110380.jpg", NULL, NULL)
  ;
/*!40000 ALTER TABLE `products_shirtcolors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_shirtsizes`
--

DROP TABLE IF EXISTS `products_shirtsizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_shirtsizes` (
  `product_id` int(11) NOT NULL,
  `shirtsize_id` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`shirtsize_id`,`product_id`),
  KEY `fk_shirtsizes_products_products1` (`product_id`),
  CONSTRAINT `products_shirtsizes_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `products_shirtsizes_shirtsizes` FOREIGN KEY (`shirtsize_id`) REFERENCES `shirtsizes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_shirtsizes`
--

LOCK TABLES `products_shirtsizes` WRITE;
/*!40000 ALTER TABLE `products_shirtsizes` DISABLE KEYS */;
-- INSERT INTO `products_shirtsizes` VALUES (1,1,12,NULL,NULL),(2,1,5,NULL,NULL),(3,1,15,NULL,NULL),(5,1,15,NULL,NULL),(1,2,15,NULL,NULL),(2,2,0,NULL,NULL),(3,2,15,NULL,NULL),(5,2,15,NULL,NULL),(1,3,15,NULL,NULL),(2,3,6,NULL,NULL),(3,3,8,NULL,NULL),(5,3,15,NULL,NULL),(1,4,15,NULL,NULL),(2,4,10,NULL,NULL),(3,4,15,NULL,NULL),(4,4,15,NULL,NULL),(5,4,15,NULL,NULL);
INSERT INTO `products_shirtsizes`(`product_id`, `shirtsize_id`, `stock`, `created_at`, `updated_at`) VALUES (1,9,12, NULL, NULL ),(1,10,7, NULL, NULL ),(1,11,13, NULL, NULL ),(1,12,6, NULL, NULL ),(1,13,15, NULL, NULL ),(2,9,13, NULL, NULL ),(2,10,5, NULL, NULL ),(2,11,20, NULL, NULL ),(2,12,6, NULL, NULL ),(2,13,16, NULL, NULL ),(3,9,16, NULL, NULL ),(3,10,4, NULL, NULL ),(3,11,8, NULL, NULL ),(3,12,5, NULL, NULL ),(3,13,13, NULL, NULL ),(4,9,13, NULL, NULL ),(4,10,5, NULL, NULL ),(4,11,14, NULL, NULL ),(4,12,19, NULL, NULL ),(4,13,6, NULL, NULL ),(5,9,8, NULL, NULL ),(5,10,18, NULL, NULL ),(5,11,7, NULL, NULL ),(5,12,19, NULL, NULL ),(5,13,10, NULL, NULL ),(6,9,13, NULL, NULL ),(6,10,19, NULL, NULL ),(6,11,18, NULL, NULL ),(6,12,4, NULL, NULL ),(6,13,5, NULL, NULL ),(7,9,13, NULL, NULL ),(7,10,11, NULL, NULL ),(7,11,4, NULL, NULL ),(7,12,17, NULL, NULL ),(7,13,4, NULL, NULL ),(8,9,15, NULL, NULL ),(8,10,12, NULL, NULL ),(8,11,15, NULL, NULL ),(8,12,4, NULL, NULL ),(8,13,11, NULL, NULL ),(9,9,5, NULL, NULL ),(9,10,18, NULL, NULL ),(9,11,4, NULL, NULL ),(9,12,19, NULL, NULL ),(9,13,5, NULL, NULL ),(10,9,1, NULL, NULL ),(10,10,15, NULL, NULL ),(10,11,10, NULL, NULL ),(10,12,9, NULL, NULL ),(10,13,11, NULL, NULL ),(11,9,1, NULL, NULL ),(11,10,7, NULL, NULL ),(11,11,6, NULL, NULL ),(11,12,10, NULL, NULL ),(11,13,17, NULL, NULL ),(12,9,9, NULL, NULL ),(12,10,18, NULL, NULL ),(12,11,3, NULL, NULL ),(12,12,11, NULL, NULL ),(12,13,9, NULL, NULL ),(13,9,2, NULL, NULL ),(13,10,3, NULL, NULL ),(13,11,9, NULL, NULL ),(13,12,7, NULL, NULL ),(13,13,18, NULL, NULL ),(14,9,9, NULL, NULL ),(14,10,2, NULL, NULL ),(14,11,6, NULL, NULL ),(14,12,4, NULL, NULL ),(14,13,15, NULL, NULL ),(15,9,3, NULL, NULL ),(15,10,8, NULL, NULL ),(15,11,7, NULL, NULL ),(15,12,9, NULL, NULL ),(15,13,4, NULL, NULL ),(16,9,6, NULL, NULL ),(16,10,10, NULL, NULL ),(16,11,17, NULL, NULL ),(16,12,7, NULL, NULL ),(16,13,10, NULL, NULL ),(17,9,19, NULL, NULL ),(17,10,11, NULL, NULL ),(17,11,16, NULL, NULL ),(17,12,19, NULL, NULL ),(17,13,9, NULL, NULL ),(18,9,15, NULL, NULL ),(18,10,12, NULL, NULL ),(18,11,11, NULL, NULL ),(18,12,19, NULL, NULL ),(18,13,18, NULL, NULL ),(19,9,14, NULL, NULL ),(19,10,19, NULL, NULL ),(19,11,15, NULL, NULL ),(19,12,5, NULL, NULL ),(19,13,10, NULL, NULL ),(20,9,8, NULL, NULL ),(20,10,10, NULL, NULL ),(20,11,5, NULL, NULL ),(20,12,14, NULL, NULL ),(20,13,5, NULL, NULL ),(21,9,3, NULL, NULL ),(21,10,6, NULL, NULL ),(21,11,20, NULL, NULL ),(21,12,5, NULL, NULL ),(21,13,15, NULL, NULL ),(22,9,12, NULL, NULL ),(22,10,7, NULL, NULL ),(22,11,18, NULL, NULL ),(22,12,19, NULL, NULL ),(22,13,3, NULL, NULL ),(23,9,15, NULL, NULL ),(23,10,3, NULL, NULL ),(23,11,10, NULL, NULL ),(23,12,20, NULL, NULL ),(23,13,18, NULL, NULL ),(24,9,18, NULL, NULL ),(24,10,2, NULL, NULL ),(24,11,2, NULL, NULL ),(24,12,6, NULL, NULL ),(24,13,6, NULL, NULL ),(25,9,8, NULL, NULL ),(25,10,9, NULL, NULL ),(25,11,19, NULL, NULL ),(25,12,8, NULL, NULL ),(25,13,15, NULL, NULL ),(26,9,6, NULL, NULL ),(26,10,6, NULL, NULL ),(26,11,11, NULL, NULL ),(26,12,6, NULL, NULL ),(26,13,10, NULL, NULL ),(27,9,18, NULL, NULL ),(27,10,19, NULL, NULL ),(27,11,10, NULL, NULL ),(27,12,15, NULL, NULL ),(27,13,5, NULL, NULL ),(28,9,16, NULL, NULL ),(28,10,17, NULL, NULL ),(28,11,20, NULL, NULL ),(28,12,6, NULL, NULL ),(28,13,6, NULL, NULL ),(29,9,10, NULL, NULL ),(29,10,6, NULL, NULL ),(29,11,3, NULL, NULL ),(29,12,7, NULL, NULL ),(29,13,18, NULL, NULL ),(30,9,4, NULL, NULL ),(30,10,16, NULL, NULL ),(30,11,15, NULL, NULL ),(30,12,18, NULL, NULL ),(30,13,10, NULL, NULL ),(31,9,6, NULL, NULL ),(31,10,20, NULL, NULL ),(31,11,18, NULL, NULL ),(31,12,3, NULL, NULL ),(31,13,20, NULL, NULL ),(32,9,16, NULL, NULL ),(32,10,10, NULL, NULL ),(32,11,14, NULL, NULL ),(32,12,10, NULL, NULL ),(32,13,18, NULL, NULL ),(33,9,19, NULL, NULL ),(33,10,16, NULL, NULL ),(33,11,8, NULL, NULL ),(33,12,13, NULL, NULL ),(33,13,4, NULL, NULL ),(34,9,20, NULL, NULL ),(34,10,5, NULL, NULL ),(34,11,7, NULL, NULL ),(34,12,18, NULL, NULL ),(34,13,19, NULL, NULL ),(35,9,7, NULL, NULL ),(35,10,16, NULL, NULL ),(35,11,11, NULL, NULL ),(35,12,2, NULL, NULL ),(35,13,9, NULL, NULL ),(36,9,5, NULL, NULL ),(36,10,14, NULL, NULL ),(36,11,10, NULL, NULL ),(36,12,14, NULL, NULL ),(36,13,16, NULL, NULL ),(37,9,12, NULL, NULL ),(37,10,6, NULL, NULL ),(37,11,13, NULL, NULL ),(37,12,2, NULL, NULL ),(37,13,9, NULL, NULL ),(38,9,6, NULL, NULL ),(38,10,2, NULL, NULL ),(38,11,9, NULL, NULL ),(38,12,18, NULL, NULL ),(38,13,11, NULL, NULL ),(39,9,1, NULL, NULL ),(39,10,3, NULL, NULL ),(39,11,1, NULL, NULL ),(39,12,16, NULL, NULL ),(39,13,17, NULL, NULL ),(40,9,9, NULL, NULL ),(40,10,19, NULL, NULL ),(40,11,7, NULL, NULL ),(40,12,18, NULL, NULL ),(40,13,8, NULL, NULL ),(41,9,13, NULL, NULL ),(41,10,1, NULL, NULL ),(41,11,17, NULL, NULL ),(41,12,3, NULL, NULL ),(41,13,3, NULL, NULL ),(42,9,20, NULL, NULL ),(42,10,7, NULL, NULL ),(42,11,17, NULL, NULL ),(42,12,2, NULL, NULL ),(42,13,14, NULL, NULL ),(43,9,19, NULL, NULL ),(43,10,12, NULL, NULL ),(43,11,14, NULL, NULL ),(43,12,20, NULL, NULL ),(43,13,4, NULL, NULL ),(44,9,12, NULL, NULL ),(44,10,15, NULL, NULL ),(44,11,5, NULL, NULL ),(44,12,17, NULL, NULL ),(44,13,5, NULL, NULL ),(45,9,5, NULL, NULL ),(45,10,20, NULL, NULL ),(45,11,17, NULL, NULL ),(45,12,8, NULL, NULL ),(45,13,2, NULL, NULL ),(46,9,10, NULL, NULL ),(46,10,11, NULL, NULL ),(46,11,9, NULL, NULL ),(46,12,9, NULL, NULL ),(46,13,19, NULL, NULL ),(47,9,11, NULL, NULL ),(47,10,8, NULL, NULL ),(47,11,9, NULL, NULL ),(47,12,15, NULL, NULL ),(47,13,13, NULL, NULL ),(48,9,17, NULL, NULL ),(48,10,10, NULL, NULL ),(48,11,9, NULL, NULL ),(48,12,10, NULL, NULL ),(48,13,7, NULL, NULL ),(49,9,11, NULL, NULL ),(49,10,20, NULL, NULL ),(49,11,11, NULL, NULL ),(49,12,15, NULL, NULL ),(49,13,20, NULL, NULL ),(50,9,15, NULL, NULL ),(50,10,20, NULL, NULL ),(50,11,19, NULL, NULL ),(50,12,7, NULL, NULL ),(50,13,10, NULL, NULL ),(51,9,13, NULL, NULL ),(51,10,11, NULL, NULL ),(51,11,8, NULL, NULL ),(51,12,15, NULL, NULL ),(51,13,6, NULL, NULL ),(52,9,14, NULL, NULL ),(52,10,11, NULL, NULL ),(52,11,19, NULL, NULL ),(52,12,2, NULL, NULL ),(52,13,8, NULL, NULL ),(53,9,6, NULL, NULL ),(53,10,17, NULL, NULL ),(53,11,14, NULL, NULL ),(53,12,20, NULL, NULL ),(53,13,16, NULL, NULL ),(54,9,18, NULL, NULL ),(54,10,6, NULL, NULL ),(54,11,18, NULL, NULL ),(54,12,4, NULL, NULL ),(54,13,13, NULL, NULL );
/*!40000 ALTER TABLE `products_shirtsizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_shirttypes`
--

DROP TABLE IF EXISTS `products_shirttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_shirttypes` (
  `product_id` int(11) NOT NULL,
  `shirttype_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`,`shirttype_id`),
  KEY `fk_products_has_shirttypes_shirttypes1` (`shirttype_id`),
  CONSTRAINT `products_shirttypes_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `products_shirttypes_shirttypes` FOREIGN KEY (`shirttype_id`) REFERENCES `shirttypes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_shirttypes`
--

LOCK TABLES `products_shirttypes` WRITE;
/*!40000 ALTER TABLE `products_shirttypes` DISABLE KEYS */;
-- INSERT INTO `products_shirttypes` (`product_id`, `shirttype_id`, `created_at`, `updated_at`) VALUES ('5', '1', '2022-12-14 10:42:59', '2022-12-14 10:42:59'), ('2', '1', '2022-12-14 10:42:59', '2022-12-14 10:42:59'), ('1', '1', '2022-12-14 10:43:29', '2022-12-14 10:43:29'), ('3', '1', '2022-12-14 10:43:42', '2022-12-14 10:43:42'), ('4', '1', '2022-12-14 10:43:58', '2022-12-14 10:43:58');
INSERT INTO `products_shirttypes`(`product_id`, `shirttype_id`, `created_at`, `updated_at`) VALUES (1, 1, NULL, NULL ),(2, 1, NULL, NULL ),(3, 1, NULL, NULL ),(4, 1, NULL, NULL ),(5, 1, NULL, NULL ),(6, 1, NULL, NULL ),(7, 1, NULL, NULL ),(8, 1, NULL, NULL ),(9, 1, NULL, NULL ),(10, 1, NULL, NULL ),(11, 1, NULL, NULL ),(12, 1, NULL, NULL ),(13, 1, NULL, NULL ),(14, 1, NULL, NULL ),(15, 1, NULL, NULL ),(16, 1, NULL, NULL ),(17, 1, NULL, NULL ),(18, 1, NULL, NULL ),(19, 1, NULL, NULL ),(20, 1, NULL, NULL ),(21, 1, NULL, NULL ),(22, 1, NULL, NULL ),(23, 1, NULL, NULL ),(24, 1, NULL, NULL ),(25, 1, NULL, NULL ),(26, 1, NULL, NULL ),(27, 1, NULL, NULL ),(28, 1, NULL, NULL ),(29, 1, NULL, NULL ),(30, 1, NULL, NULL ),(31, 1, NULL, NULL ),(32, 1, NULL, NULL ),(33, 1, NULL, NULL ),(34, 1, NULL, NULL ),(35, 1, NULL, NULL ),(36, 1, NULL, NULL ),(37, 1, NULL, NULL ),(38, 1, NULL, NULL ),(39, 1, NULL, NULL ),(40, 1, NULL, NULL ),(41, 1, NULL, NULL ),(42, 1, NULL, NULL ),(43, 1, NULL, NULL ),(44, 1, NULL, NULL ),(45, 1, NULL, NULL ),(46, 1, NULL, NULL ),(47, 1, NULL, NULL ),(48, 1, NULL, NULL ),(49, 1, NULL, NULL ),(50, 1, NULL, NULL ),(51, 1, NULL, NULL ),(52, 1, NULL, NULL ),(53, 1, NULL, NULL ),(54, 1, NULL, NULL );

/*!40000 ALTER TABLE `products_shirttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_typesprint`
--

DROP TABLE IF EXISTS `products_typesprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_typesprint` (
  `product_id` int(11) NOT NULL,
  `typeprint_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`,`typeprint_id`),
  KEY `fk_products_has_typesprint_typesprint1` (`typeprint_id`),
  CONSTRAINT `products_typesprint_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `products_typesprint_typesprint` FOREIGN KEY (`typeprint_id`) REFERENCES `typesprint` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_typesprint`
--

LOCK TABLES `products_typesprint` WRITE;
/*!40000 ALTER TABLE `products_typesprint` DISABLE KEYS */;
-- INSERT INTO `products_typesprint` (`product_id`, `typeprint_id`, `created_at`, `updated_at`) VALUES (1, 2, '2022-12-14 16:04:27', '2022-12-14 16:04:27'),(2, 1, '2022-12-14 16:04:27', '2022-12-14 16:04:27'),(3, 2, '2022-12-14 16:07:46', '2022-12-14 16:07:46'),(4, 5, '2022-12-14 16:08:34', '2022-12-14 16:08:34'),(5, 2, '2022-12-14 16:14:44', '2022-12-14 16:14:58');
INSERT INTO `products_typesprint`(`product_id`, `typeprint_id`, `created_at`, `updated_at`)  VALUES (1,2, NULL, NULL),(2,2, NULL, NULL),(3,2, NULL, NULL),(4,2, NULL, NULL),(5,2, NULL, NULL),(6,2, NULL, NULL),(7,2, NULL, NULL),(8,2, NULL, NULL),(9,2, NULL, NULL),(10,2, NULL, NULL),(11,2, NULL, NULL),(12,2, NULL, NULL),(13,2, NULL, NULL),(14,2, NULL, NULL),(15,2, NULL, NULL),(16,2, NULL, NULL),(17,2, NULL, NULL),(18,2, NULL, NULL),(19,2, NULL, NULL),(20,2, NULL, NULL),(21,2, NULL, NULL),(22,2, NULL, NULL),(23,2, NULL, NULL),(24,2, NULL, NULL),(25,2, NULL, NULL),(26,2, NULL, NULL),(27,2, NULL, NULL),(28,2, NULL, NULL),(29,2, NULL, NULL),(30,2, NULL, NULL),(31,2, NULL, NULL),(32,2, NULL, NULL),(33,2, NULL, NULL),(34,2, NULL, NULL),(35,2, NULL, NULL),(36,2, NULL, NULL),(37,2, NULL, NULL),(38,2, NULL, NULL),(39,2, NULL, NULL),(40,2, NULL, NULL),(41,2, NULL, NULL),(42,2, NULL, NULL),(43,2, NULL, NULL),(44,2, NULL, NULL),(45,2, NULL, NULL),(46,2, NULL, NULL),(47,2, NULL, NULL),(48,2, NULL, NULL),(49,2, NULL, NULL),(50,2, NULL, NULL),(51,2, NULL, NULL),(52,2, NULL, NULL),(53,2, NULL, NULL),(54,2, NULL, NULL);
/*!40000 ALTER TABLE `products_typesprint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (0,'Restringido',NULL,NULL),(1,'Administrador',NULL,NULL),(2,'Cliente',NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shirtcolors`
--

DROP TABLE IF EXISTS `shirtcolors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shirtcolors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `color` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `color` (`color`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shirtcolors`
--

LOCK TABLES `shirtcolors` WRITE;
/*!40000 ALTER TABLE `shirtcolors` DISABLE KEYS */;
INSERT INTO `shirtcolors` VALUES
  (1,'blanco','#ffffff','2022-11-17 05:18:50','2022-11-17 05:18:50'),
  (2,'negro','#000000','2022-11-17 05:19:33','2022-11-17 05:19:33'),
  (3,'amarillo','#ffff00','2022-11-17 05:20:00','2022-11-17 05:20:00'),
  (4,'rojo','#ff0000','2022-11-17 05:21:00','2022-11-17 05:21:00'),
  (5,'azul','#0000ff','2022-11-17 05:27:53','2022-11-17 05:27:53'),
  (6,'naranja','#ff8000','2022-11-17 12:17:10','2022-11-17 12:17:10'),
  (7,'verde','#00bb2d','2022-11-22 03:26:44','2022-11-22 03:26:44'),
  (8,'Rosa','#ffc0cb','2022-11-22 03:26:44','2022-11-22 03:26:44'),
  (9,'Morado','#a349a4','2022-11-22 03:26:44','2022-11-22 03:26:44')
  ;
/*!40000 ALTER TABLE `shirtcolors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shirtsizes`
--

DROP TABLE IF EXISTS `shirtsizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shirtsizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `size` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `size` (`size`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shirtsizes`
--

LOCK TABLES `shirtsizes` WRITE;
/*!40000 ALTER TABLE `shirtsizes` DISABLE KEYS */;
INSERT INTO `shirtsizes` VALUES
(1,'2','2022-11-22 01:53:57','2022-11-22 01:54:16'),
(2,'4','2022-11-22 01:53:57','2022-11-22 01:54:16'),
(3,'6','2022-11-22 01:53:57','2022-11-22 01:54:16'),
(4,'8','2022-11-22 01:53:57','2022-11-22 01:54:16'),
(5,'10','2022-11-22 01:53:57','2022-11-22 01:54:16'),
(6,'12','2022-11-22 01:53:57','2022-11-22 01:54:16'),
(7,'14','2022-11-22 01:53:57','2022-11-22 01:54:16'),
(8,'16','2022-11-22 01:53:57','2022-11-22 01:54:16'),
(9,'S','2022-11-22 01:53:57','2022-11-22 01:54:16'),
(10,'M','2022-11-22 01:57:42','2022-11-22 01:57:50'),
(11,'L','2022-11-22 01:56:15','2022-11-22 01:56:15'),
(12,'XS','2022-11-22 01:58:16','2022-11-22 01:58:16'),
(13,'XL','2022-11-22 02:01:24','2022-11-22 02:01:24'),
(14,'XXL','2022-11-22 02:01:24','2022-11-22 02:01:24');

/*!40000 ALTER TABLE `shirtsizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shirttypes`
--

DROP TABLE IF EXISTS `shirttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shirttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shirttypes`
--

LOCK TABLES `shirttypes` WRITE;
/*!40000 ALTER TABLE `shirttypes` DISABLE KEYS */;
INSERT INTO `shirttypes` VALUES (1,'Polo cuello redondo',NULL,NULL),(2,'Polo cuello en v',NULL,NULL);
/*!40000 ALTER TABLE `shirttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typespqrs`
--

DROP TABLE IF EXISTS `typespqrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typespqrs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typePqrs` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `typePqrs` (`typePqrs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typespqrs`
--

LOCK TABLES `typespqrs` WRITE;
/*!40000 ALTER TABLE `typespqrs` DISABLE KEYS */;
INSERT INTO `typespqrs` VALUES (1,'Peticion',NULL,NULL),(2,'Queja',NULL,NULL),(3,'Reclamo',NULL,NULL),(4,'Sugerencia',NULL,NULL),(5,'Pregunta',NULL,NULL),(6,'Felicitación',NULL,NULL);
/*!40000 ALTER TABLE `typespqrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typesprint`
--

DROP TABLE IF EXISTS `typesprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typesprint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `print` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `print` (`print`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typesprint`
--

LOCK TABLES `typesprint` WRITE;
/*!40000 ALTER TABLE `typesprint` DISABLE KEYS */;
INSERT INTO `typesprint` (`id`, `print`, `created_at`, `updated_at`) VALUES ('1', 'Vinilo de corte', '2022-12-14 10:52:31', '2022-12-14 10:52:31'), ('2', 'Vinilo impreso', '2022-12-14 10:52:31', '2022-12-14 10:52:31'), ('3', 'Serigrafia textil digital', '2022-12-14 10:53:26', '2022-12-14 10:53:26'), ('4', 'Sublimacion', '2022-12-14 10:53:26', '2022-12-14 10:53:26'), ('5', 'Transfer', '2022-12-14 10:55:04', '2022-12-14 10:55:04'), ('6', 'DTF', '2022-12-14 10:56:10', '2022-12-14 10:56:10');
/*!40000 ALTER TABLE `typesprint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  `avatar` varchar(15) NULL,
  `dni` varchar(20) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rol_id` int(11) NOT NULL DEFAULT 2,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `roles_users` (`rol_id`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','Admin',NULL,NULL,'1231221312' ,'pingestampados@gmail.com', NULL,NULL, 1, '$2a$12$LUfpDN5.QXJcWb6SLJjWXuYIjwO9dH193gT0sctazZgOcX9Tsk8oa',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-02 14:06:20
