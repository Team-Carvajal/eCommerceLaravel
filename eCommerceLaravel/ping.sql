-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-11-2022 a las 20:05:12
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DROP DATABASE IF EXISTS `ping`;
CREATE DATABASE `ping`;
USE `ping`;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ping2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bill`
--

CREATE TABLE `aboutus` (
  `idAboutUs` int(11) NOT NULL,
  `text` varchar(500) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `aboutus`
--

INSERT INTO `aboutus` (`idAboutUs`, `text`) VALUES
(1, 'Somos una marca colombiana especializada en el estampado de camisetas siuu');

CREATE TABLE `bills` (
  `idBill` int(11) NOT NULL,
  `billStates_id` int(5) NOT NULL,
  `paymentMethod_idPaymentMethod` int(11) NOT NULL,
  `subTotal` int(11) NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bill`
--

INSERT INTO `bills` (`idBill`, `billStates_id`, `paymentMethod_idPaymentMethod`,`subTotal` ,`user_id`) VALUES
(1, 1, 1,15000 ,2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `billStates`
--

CREATE TABLE `billStates` (
  `idBillStates` int(5) NOT NULL,
  `state` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `billStates`
--

INSERT INTO `billStates` (`idBillStates`, `state`) VALUES
(1, 'Por Enviar'),
(2, 'Completado'),
(3, 'Por Entreg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `categories` (
  `idCategory` int(11) NOT NULL,
  `categoryName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `categories` (`idCategory`, `categoryName`) VALUES
(1, 'Hombres'),
(2, 'Mujeres'),
(3, 'Niños'),
(4, 'Jovenes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deliveries`
--

CREATE TABLE `deliveries` (
  `idDelivery` int(11) NOT NULL,
  `direction` varchar(100) NOT NULL,
  `bill_idBill` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descountsettings`
--

CREATE TABLE `descountSettings` (
  `idDescountSettings` int(11) NOT NULL,
  `descriptionDescount` varchar(45) NOT NULL,
  `descount` float NOT NULL,
  `applyDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `descountsettings`
--

INSERT INTO `descountSettings` (`idDescountSettings`, `descriptionDescount`, `descount`, `applyDate`) VALUES
(1, 'sin descuento', 0, '0000-00-00'),
(2, 'descuento por frecuencia', 10, '2022-11-20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dimensionPrint`
--

CREATE TABLE `dimensionPrint` (
  `idDimensionPrint` int(11) NOT NULL,
  `dimension` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dimensionPrint`
--

INSERT INTO `dimensionPrint` (`idDimensionPrint`, `dimension`) VALUES
(1, 'Grande'),
(2, 'Mediano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `managementpqrs`
--

CREATE TABLE `managementpqrs` (
  `idmanagementPqrs` int(11) NOT NULL,
  `description` varchar(200) NOT NULL,
  `fechaPqrs` date NOT NULL,
  `state` varchar(1) NOT NULL,
  `typePqrs_idTypePqrs` int(11) NOT NULL,
  `user_iduser` bigint(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `managementpqrs`
--

INSERT INTO `managementpqrs` (`idmanagementPqrs`, `description`, `fechaPqrs`, `state`, `typePqrs_idTypePqrs`, `user_iduser`) VALUES
(1, '¿cómo funciona la página web?', '2022-11-02', '1', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordersBase`
--

CREATE TABLE `ordersBase` (
  `idOrder` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `bill_idBill` int(11) NOT NULL,
  `dimensionPrint_idDimensionPrint` int(11) NOT NULL,
  `product_idProduct` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ordersBase`
--

INSERT INTO `ordersBase` (`idOrder`, `quantity`, `bill_idBill`, `dimensionPrint_idDimensionPrint`, `product_idProduct`) VALUES
(1, 2, 1, 1, 1),
(2, 10, 1, 2, 1),
(3, 3, 1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paymentMethods`
--

CREATE TABLE `paymentMethods` (
  `idPaymentMethod` int(11) NOT NULL,
  `method` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `paymentMethods`
--

INSERT INTO `paymentMethods` (`idPaymentMethod`, `method`) VALUES
(1, 'payPal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productCalification`
--

CREATE TABLE `productCalification` (
  `idProductCalification` int(11) NOT NULL,
  `calification` int(11) DEFAULT NULL,
  `user_iduser` bigint(20) UNSIGNED DEFAULT NULL,
  `product_idproduct` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `idproduct` int(11) NOT NULL,
  `nameProduct` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `descriptionProduct` varchar(200) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `garanty` int(11) DEFAULT NULL,
  `QuantityAvailable` int(11) DEFAULT NULL,
  `shirtType_idShirtType` int(11) NOT NULL,
  `shirtSize_idShirtSize` int(11) NOT NULL,
  `shirtColors_idShirtColor` int(11) NOT NULL,
  `typePrint_idTypePrint` int(11) NOT NULL,
  `descountSettings_id` int(11) NOT NULL,
  `category_idCategory` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`idproduct`, `nameProduct`, `price`, `descriptionProduct`, `garanty`, `QuantityAvailable`, `shirtType_idShirtType`, `shirtSize_idShirtSize`, `shirtColors_idShirtColor`, `typePrint_idTypePrint`, `descountSettings_id`, `category_idCategory`) VALUES
(1, 'Camisa Roblox', 80000, 'camisa con personaje de roblox', 5, 10, 1, 2, 2, 1, 1, 4),
(2, 'Fiesta Navideña', 32000, 'Estilo navideño y bonitos colores rojos', 3, 20, 2, 1, 3, 4, 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `roles` (
  `idRol` int(11) NOT NULL,
  `namerol` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `roles` (`idRol`, `namerol`) VALUES
(1, 'Administrador'),
(2, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shirtColors`
--

CREATE TABLE `shirtColors` (
  `idShirtColor` int(11) NOT NULL,
  `color` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `shirtColors`
--

INSERT INTO `shirtColors` (`idShirtColor`, `color`) VALUES
(1, 'rojo'),
(2, 'azul'),
(3, 'Violeta'),
(4, 'Verde');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shirtSize`
--

CREATE TABLE `shirtSize` (
  `idShirtSize` int(11) NOT NULL,
  `size` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `shirtSize`
--

INSERT INTO `shirtSize` (`idShirtSize`, `size`) VALUES
(1, 'XXL'),
(2, 'M'),
(3, 'L'),
(4, 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shirtType`
--

CREATE TABLE `shirtType` (
  `idShirtType` int(11) NOT NULL,
  `type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `shirtType`
--

INSERT INTO `shirtType` (`idShirtType`, `type`) VALUES
(1, 'playera'),
(2, 'Camisón'),
(3, 'Blusa'),
(4, 'Sudadera');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `typepqrs`
--

CREATE TABLE `typepqrs` (
  `idTypePqrs` int(11) NOT NULL,
  `typepqrs` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `typepqrs`
--

INSERT INTO `typepqrs` (`idTypePqrs`, `typepqrs`) VALUES
(1, 'Pregunta'),
(2, 'Queja'),
(3, 'Reclamo'),
(4, 'Sugerencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `typePrint`
--

CREATE TABLE `typePrint` (
  `idTypePrint` int(11) NOT NULL,
  `typePrint` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `typePrint`
--

INSERT INTO `typePrint` (`idTypePrint`, `typePrint`) VALUES
(1, 'prensada'),
(2, 'forjada'),
(3, 'Tejida'),
(4, 'Plasmada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `UICode`
--

CREATE TABLE `UICode` (
  `idUICode` int(11) NOT NULL,
  `file` varchar(200) NOT NULL,
  `rol_idRol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `UICode`
--

INSERT INTO `UICode` (`idUICode`, `file`, `rol_idRol`) VALUES
(1, 'ieunfiuwenwiupc pqeiufndncuiqerbviajdcnerpbapieucnierbvediu', 1),
(2, 'owijvnpiqeb9upefoifcjeuhntiuerhncifeqhnoifuerhaiofhneldnheiourghfoeihgfnuojdifwrnhuofhnqeipjmqgneonhfmjqpoierhnouaehnfpioqermhiguoehmpiofxherniuocfmjwEOIGCHNOURIEJFOIERHNOUIAEJMPFWNHOFJWIOGNHEWUIFJIPO', 1),
(3, '2eufehwiuebfiuwbediunweifunwiejwqeoediwejfoiwecweufweiucneiufbeiucnwefi weoifhweoifoejweoifhoweneofhjeofhqwiudh2fhwoenp2efn24ufhe98cnweipfnweu9n4mf34', 1),
(4, '9uwehf9hec9uhfuenc2e9fh29x82ef89ehdoqefh9e8xj29u2fhweoijwefwe', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(50) COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `birthDate` DATE COLLATE utf8mb4_unicode_ci NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol_id` int(11) NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `lastName`, `email`, `email_verified_at`, `phone`, `rol_id`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'María del Pilar', 'Sánchez Gómez Ariza', 'mapisago@píng.com', NULL, '301838193', 1, 'secret2', NULL, '2022-11-02 17:34:23', '2022-11-02 17:34:23'),
(2, 'Fernando', 'Borrero', 'feborrero@ping.com', NULL, '3029392925', 2, 'secret3', NULL, '2022-11-02 17:34:59', '2022-11-02 17:34:59');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aboutus`
--
ALTER TABLE `aboutus`
  ADD PRIMARY KEY (`idAboutUs`);

--
-- Indices de la tabla `bill`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`idBill`),
  ADD KEY `paymentMethod_idPaymentMethod` (`paymentMethod_idPaymentMethod`),
  ADD KEY `users_bill` (`user_id`),
  ADD KEY `billStates_bill` (`billStates_id`);

--
-- Indices de la tabla `billStates`
--
ALTER TABLE `billStates`
  ADD PRIMARY KEY (`idBillStates`);

--
-- Indices de la tabla `category`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`idCategory`);

--
-- Indices de la tabla `delivery`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`idDelivery`),
  ADD KEY `bill_idBill` (`bill_idBill`);

--
-- Indices de la tabla `descountsettings`
--
ALTER TABLE `descountSettings`
  ADD PRIMARY KEY (`idDescountSettings`,`descount`);

--
-- Indices de la tabla `dimensionPrint`
--
ALTER TABLE `dimensionPrint`
  ADD PRIMARY KEY (`idDimensionPrint`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `managementpqrs`
--
ALTER TABLE `managementpqrs`
  ADD PRIMARY KEY (`idmanagementPqrs`),
  ADD KEY `user_iduser` (`user_iduser`),
  ADD KEY `typePqrs_idTypePqrs` (`typePqrs_idTypePqrs`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordersBase`
--
ALTER TABLE `ordersBase`
  ADD PRIMARY KEY (`idOrder`),
  ADD KEY `bill_idBill` (`bill_idBill`),
  ADD KEY `dimensionPrint_idDimensionPrint` (`dimensionPrint_idDimensionPrint`),
  ADD KEY `product_idProduct` (`product_idProduct`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `paymentmethod`
--
ALTER TABLE `paymentMethods`
  ADD PRIMARY KEY (`idPaymentMethod`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `productCalification`
--
ALTER TABLE `productCalification`
  ADD PRIMARY KEY (`idProductCalification`),
  ADD KEY `user_iduser` (`user_iduser`),
  ADD KEY `product_idproduct` (`product_idproduct`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`idproduct`),
  ADD KEY `shirtType_idShirtType` (`shirtType_idShirtType`),
  ADD KEY `shirtSize_idShirtSize` (`shirtSize_idShirtSize`),
  ADD KEY `shirtColors_idShirtColor` (`shirtColors_idShirtColor`),
  ADD KEY `typePrint_idTypePrint` (`typePrint_idTypePrint`),
  ADD KEY `descountSettings_products` (`descountSettings_id`),
  ADD KEY `category_products` (`category_idCategory`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `shirtColors`
--
ALTER TABLE `shirtColors`
  ADD PRIMARY KEY (`idShirtColor`);

--
-- Indices de la tabla `shirtSize`
--
ALTER TABLE `shirtSize`
  ADD PRIMARY KEY (`idShirtSize`);

--
-- Indices de la tabla `shirtType`
--
ALTER TABLE `shirtType`
  ADD PRIMARY KEY (`idShirtType`);

--
-- Indices de la tabla `typepqrs`
--
ALTER TABLE `typepqrs`
  ADD PRIMARY KEY (`idTypePqrs`);

--
-- Indices de la tabla `typePrint`
--
ALTER TABLE `typePrint`
  ADD PRIMARY KEY (`idTypePrint`);

--
-- Indices de la tabla `UICode`
--
ALTER TABLE `UICode`
  ADD PRIMARY KEY (`idUICode`),
  ADD KEY `rol_idRol` (`rol_idRol`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `rol_users` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bill`
--
ALTER TABLE `bills`
  MODIFY `idBill` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `billStates`
--
ALTER TABLE `billStates`
  MODIFY `idBillStates` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `categories`
  MODIFY `idCategory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `delivery`
--
ALTER TABLE `deliveries`
  MODIFY `idDelivery` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `descountsettings`
--
ALTER TABLE `descountSettings`
  MODIFY `idDescountSettings` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `dimensionPrint`
--
ALTER TABLE `dimensionPrint`
  MODIFY `idDimensionPrint` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `managementpqrs`
--
ALTER TABLE `managementpqrs`
  MODIFY `idmanagementPqrs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ordersBase`
--
ALTER TABLE `ordersBase`
  MODIFY `idOrder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `idproduct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `shirtColors`
--
ALTER TABLE `shirtColors`
  MODIFY `idShirtColor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `shirtSize`
--
ALTER TABLE `shirtSize`
  MODIFY `idShirtSize` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `shirtType`
--
ALTER TABLE `shirtType`
  MODIFY `idShirtType` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `typePrint`
--
ALTER TABLE `typePrint`
  MODIFY `idTypePrint` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bill`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `billStates_bill` FOREIGN KEY (`billStates_id`) REFERENCES `billStates` (`idBillStates`),
  ADD CONSTRAINT `paymentMethod_bill` FOREIGN KEY (`paymentMethod_idPaymentMethod`) REFERENCES `paymentMethods` (`idPaymentMethod`),
  ADD CONSTRAINT `users_bill` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `delivery`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `bill_delivery` FOREIGN KEY (`bill_idBill`) REFERENCES `bills` (`idBill`);

--
-- Filtros para la tabla `managementpqrs`
--
ALTER TABLE `managementpqrs`
  ADD CONSTRAINT `typepqrs_magagementpqrs` FOREIGN KEY (`typePqrs_idTypePqrs`) REFERENCES `typepqrs` (`idTypePqrs`),
  ADD CONSTRAINT `users_managementpqrs` FOREIGN KEY (`user_iduser`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `ordersBase`
--
ALTER TABLE `ordersBase`
  ADD CONSTRAINT `bill_ordersBase` FOREIGN KEY (`bill_idBill`) REFERENCES `bills` (`idBill`),
  ADD CONSTRAINT `dimensionPrint_ordersBase` FOREIGN KEY (`dimensionPrint_idDimensionPrint`) REFERENCES `dimensionPrint` (`idDimensionPrint`),
  ADD CONSTRAINT `product_ordersBase` FOREIGN KEY (`product_idProduct`) REFERENCES `products` (`idproduct`);

--
-- Filtros para la tabla `productCalification`
--
ALTER TABLE `productCalification`
  ADD CONSTRAINT `products_productCalification` FOREIGN KEY (`product_idproduct`) REFERENCES `products` (`idproduct`),
  ADD CONSTRAINT `users_productCalification` FOREIGN KEY (`user_iduser`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `shirtColors_products` FOREIGN KEY (`shirtColors_idShirtColor`) REFERENCES `shirtColors` (`idShirtColor`),
  ADD CONSTRAINT `shirtSize_products` FOREIGN KEY (`shirtSize_idShirtSize`) REFERENCES `shirtSize` (`idShirtSize`),
  ADD CONSTRAINT `shirtType_products` FOREIGN KEY (`shirtType_idShirtType`) REFERENCES `shirtType` (`idShirtType`),
  ADD CONSTRAINT `typePrint_products` FOREIGN KEY (`typePrint_idTypePrint`) REFERENCES `typePrint` (`idTypePrint`),
  ADD CONSTRAINT `category_products` FOREIGN KEY (`category_idCategory`) REFERENCES `categories` (`idCategory`),
  ADD CONSTRAINT `descountSettings_products` FOREIGN KEY (`descountSettings_id`) REFERENCES `descountSettings` (`idDescountSettings`);

--
-- Filtros para la tabla `UICode`
--
ALTER TABLE `UICode`
  ADD CONSTRAINT `rol_UICode` FOREIGN KEY (`rol_idRol`) REFERENCES `roles` (`idRol`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `rol_users` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`idRol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
