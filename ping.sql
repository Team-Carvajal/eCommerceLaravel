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

DROP TABLE IF EXISTS `aboutus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aboutus` (
  `id` int(11) NOT NULL,
  `aboutus` varchar(500) NOT NULL,
  `mission` varchar(500) NOT NULL,
  `vision` varchar(500) NOT NULL,
  `logo` varchar(500) NOT NULL,
  `info1` varchar(500),
  `info2` varchar(200),
  `info3` varchar(500),
  `info4` varchar(200),
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
INSERT INTO `aboutus` (`id`, `aboutus`, `mission`, `vision`, `logo`, `created_at`, `updated_at`) VALUES (1, 'Somos una tienda de camisas estampadas', ' Ofrecer un servicio eficaz de todo tipo de prendas de buena calidad y en buen estado para satisfacer las necesidades de nuestros clientes.', 'Convertir mi tienda en una de las más conocidas y poder llevar mis productos a todo el país y al extranjero.', '', NULL, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billstates`
--

LOCK TABLES `billstates` WRITE;
/*!40000 ALTER TABLE `billstates` DISABLE KEYS */;
INSERT INTO `billstates`(`id`, `state`, `created_at`, `updated_at`) VALUES ('1','Carrito',null,null),('2','Pagado',null,null),('3','En espera',null,null);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Mujeres', null ,'2022-11-16 07:29:57','2022-11-16 07:29:57'),(2,'Hombres', null, '2022-11-16 07:30:20','2022-11-16 07:30:20'),(3,'niños', null, '2022-11-16 18:10:18','2022-11-16 05:00:00');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descountsettings`
--

LOCK TABLES `descountsettings` WRITE;
/*!40000 ALTER TABLE `descountsettings` DISABLE KEYS */;
INSERT INTO `descountsettings` (`id`, `description`, `descount`, `applyDate`, `created_at`, `updated_at`) VALUES (5, 'Sin descuento', 0, '0000-00-00', NULL, NULL),(6, 'Por Navidad', 10, '2022-11-20', NULL, NULL);
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
  `fechaPqrs` date NOT NULL,
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
INSERT INTO `managementpqrs` (`id`, `description`, `state`, `typePqrs_id`, `user_id`, `created_at`, `updated_at`) VALUES (2, 'la página funciona re bien :]', '0', 6, 4, NULL, NULL);
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `dimensionPrint_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bills_ordersBase` (`bill_id`),
  KEY `dimensionPrint_ordersBase` (`dimensionPrint_id`),
  KEY `products_ordersBase` (`product_id`),
  CONSTRAINT `bills_ordersBase` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`),
  CONSTRAINT `dimensionPrint_ordersBase` FOREIGN KEY (`dimensionPrint_id`) REFERENCES `dimensionprint` (`id`),
  CONSTRAINT `products_ordersBase` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordersbase`
--

LOCK TABLES `ordersbase` WRITE;
/*!40000 ALTER TABLE `ordersbase` DISABLE KEYS */;
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
  `id` int(11) NOT NULL,
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
INSERT INTO `paymentmethods`(`id`, `method`, `created_at`, `updated_at`) VALUES (1,'Paypal',null,null);
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
  `id` int(11) NOT NULL,
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
  `description` varchar(200) DEFAULT NULL,
  `garanty` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Koro Sensei Assassination Classroom',55000,'Te extrañamos profesor <3',NULL,12,'2022-11-16 06:49:01','2022-11-16 06:49:01'),(2,'Goku Dragon ball',55000,'',NULL,10,'2022-11-16 07:21:52','2022-11-16 07:21:52'),(3,'Luffy Nika Five Gear One Piece',55000,'',NULL,10,'2022-11-16 19:10:19','2022-11-16 19:10:19'),(4,'Saitama One Punch Man',55000,'',NULL,10,'2022-11-16 19:11:21','2022-11-16 19:11:21'),(5,'Camisa texto Beach',55000,NULL,NULL,5,'2022-11-17 08:28:12','2022-11-17 08:28:13');
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
INSERT INTO `products_categories` VALUES (1,2),(2,2),(3,2),(4,2),(5,1);
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
  `image` varchar(200) DEFAULT NULL,
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
INSERT INTO `products_shirtcolors` VALUES (1,3,'1153467002.jpg'),(2,1,'3057875722.jpg'),(2,2,'4062048018.jpg'),(2,6,'3381335575.jpg'),(3,1,'2003813554.jpg'),(3,2,'2253497583.jpg'),(4,2,'2505438710.jpg'),(5,1,'8407492372.jpg');
/*!40000 ALTER TABLE `products_shirtcolors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_shirtsizes`
--

DROP TABLE IF EXISTS `products_shirtsizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_shirtsizes` (
  `shirtsize_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
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
INSERT INTO `products_shirtsizes` VALUES (1, 1),(1, 2),(1, 3),(1, 4),(2, 1),(2, 2),(2, 3),(2, 4),(3, 1),(3, 2),(3, 3),(3, 4),(4, 4),(5, 1),(5, 2),(5, 3),(5, 4);
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
INSERT INTO `products_shirttypes` VALUES (2,1);
/*!40000 ALTER TABLE `products_shirttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
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
INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES (0, 'Restringido', NULL, NULL),(1, 'Administrador', NULL, NULL),(2, 'Cliente', NULL, NULL);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shirtcolors`
--

LOCK TABLES `shirtcolors` WRITE;
/*!40000 ALTER TABLE `shirtcolors` DISABLE KEYS */;
INSERT INTO `shirtcolors` VALUES (1,'blanco','#ffffff','2022-11-17 00:18:50','2022-11-17 00:18:50'),(2,'negro','#000000','2022-11-17 00:19:33','2022-11-17 00:19:33'),(3,'amarillo','#ffff00','2022-11-17 00:20:00','2022-11-17 00:20:00'),(4,'rojo','#ff0000','2022-11-17 00:21:00','2022-11-17 00:21:00'),(5,'azul','#0000ff','2022-11-17 00:27:53','2022-11-17 00:27:53'),(6,'naranja','#ff8000','2022-11-17 07:17:10','2022-11-17 07:17:10'),(7,'verde','#00bb2d','2022-11-21 22:26:44','2022-11-21 22:26:44');
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
  `sizes` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shirtsizes`
--

LOCK TABLES `shirtsizes` WRITE;
/*!40000 ALTER TABLE `shirtsizes` DISABLE KEYS */;
INSERT INTO `shirtsizes` VALUES (1,'S','2022-11-21 20:53:57','2022-11-21 20:54:16'),(2,'M','2022-11-21 20:57:42','2022-11-21 20:57:50'),(3,'L','2022-11-21 20:56:15','2022-11-21 20:56:15'),(4,'XS','2022-11-21 20:58:16','2022-11-21 20:58:16'),(5,'XL','2022-11-21 21:01:24','2022-11-21 21:01:24'),(6,'XXL','2022-11-21 21:01:24','2022-11-21 21:01:24');
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
  `types` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shirttypes`
--

LOCK TABLES `shirttypes` WRITE;
/*!40000 ALTER TABLE `shirttypes` DISABLE KEYS */;
INSERT INTO `shirttypes` VALUES (1,'camiseta cuello redondo','2022-11-21 21:47:03','2022-11-21 21:47:03');
/*!40000 ALTER TABLE `shirttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typespqrs`
--

DROP TABLE IF EXISTS `typespqrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typespqrs` (
  `id` int(11) NOT NULL,
  `typesPqrs` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typespqrs`
--

LOCK TABLES `typespqrs` WRITE;
/*!40000 ALTER TABLE `typespqrs` DISABLE KEYS */;
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
  `typesPrint` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typesprint`
--

LOCK TABLES `typesprint` WRITE;
/*!40000 ALTER TABLE `typesprint` DISABLE KEYS */;
INSERT INTO `typesprint` VALUES (1,'estampado','2022-11-21 21:42:29','2022-11-21 21:42:29'),(2,'sublimado','2022-11-21 21:42:46','2022-11-21 21:42:46');
/*!40000 ALTER TABLE `typesprint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uicode`
--

DROP TABLE IF EXISTS `uicode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uicode` (
  `id` int(11) NOT NULL,
  `file` varchar(200) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rol_UICode` (`rol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uicode`
--

LOCK TABLES `uicode` WRITE;
/*!40000 ALTER TABLE `uicode` DISABLE KEYS */;
/*!40000 ALTER TABLE `uicode` ENABLE KEYS */;
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
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rol_id` int(11) NOT NULL DEFAULT 2,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `roles_users` (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2022-11-25 11:51:15
