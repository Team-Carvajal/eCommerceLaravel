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

CREATE TABLE `bill` (
  `idbill` int(11) NOT NULL,
  `expeditiondatebill` date NOT NULL DEFAULT current_timestamp(),
  `billState_id` int(5) NOT NULL,
  `paymentmethod_idpaymentmethod` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bill`
--

INSERT INTO `bill` (`idbill`, `expeditiondatebill`, `billState_id`, `paymentmethod_idpaymentmethod`, `user_id`) VALUES
(1, '2022-11-02', 1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `billstate`
--

CREATE TABLE `billstate` (
  `idBillState` int(5) NOT NULL,
  `state` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `billstate`
--

INSERT INTO `billstate` (`idBillState`, `state`) VALUES
(1, 'Por Enviar'),
(2, 'Completado'),
(3, 'Por Entreg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `idCategory` int(11) NOT NULL,
  `categoryName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`idCategory`, `categoryName`) VALUES
(1, 'Hombres'),
(2, 'Mujeres'),
(3, 'Niños'),
(4, 'Jovenes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `delivery`
--

CREATE TABLE `delivery` (
  `iddelivery` int(11) NOT NULL,
  `direction` varchar(100) NOT NULL,
  `bill_idbill` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descountsettings`
--

CREATE TABLE `descountsettings` (
  `iddescountSettings` int(11) NOT NULL,
  `descriptionDescount` varchar(45) NOT NULL,
  `descount` float NOT NULL,
  `applyDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `descountsettings`
--

INSERT INTO `descountsettings` (`iddescountSettings`, `descriptionDescount`, `descount`, `applyDate`) VALUES
(1, 'sin descuento', 0, '0000-00-00'),
(2, 'descuento por frecuencia', 10, '2022-11-20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dimensionprint`
--

CREATE TABLE `dimensionprint` (
  `iddimensionprint` int(11) NOT NULL,
  `dimension` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dimensionprint`
--

INSERT INTO `dimensionprint` (`iddimensionprint`, `dimension`) VALUES
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
  `typePqrs_idtypePqrs` int(11) NOT NULL,
  `user_iduser` bigint(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `managementpqrs`
--

INSERT INTO `managementpqrs` (`idmanagementPqrs`, `description`, `fechaPqrs`, `state`, `typePqrs_idtypePqrs`, `user_iduser`) VALUES
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
-- Estructura de tabla para la tabla `orderbase`
--

CREATE TABLE `orderbase` (
  `idorder` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `bill_idbill` int(11) NOT NULL,
  `dimensionPrint_idDimensionPrint` int(11) NOT NULL,
  `product_idProduct` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `orderbase`
--

INSERT INTO `orderbase` (`idorder`, `quantity`, `bill_idbill`, `dimensionPrint_idDimensionPrint`, `product_idProduct`) VALUES
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
-- Estructura de tabla para la tabla `paymentmethod`
--

CREATE TABLE `paymentmethod` (
  `idpaymentmethod` int(11) NOT NULL,
  `method` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `paymentmethod`
--

INSERT INTO `paymentmethod` (`idpaymentmethod`, `method`) VALUES
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
-- Estructura de tabla para la tabla `productcalification`
--

CREATE TABLE `productcalification` (
  `idproductcalification` int(11) NOT NULL,
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
  `ShirtType_idShirtType` int(11) NOT NULL,
  `ShirtSize_idShirtSize` int(11) NOT NULL,
  `ShirtColor_idShirtColor` int(11) NOT NULL,
  `TypePrint_idTypePrint` int(11) NOT NULL,
  `descountSettings_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`idproduct`, `nameProduct`, `price`, `descriptionProduct`, `garanty`, `QuantityAvailable`, `ShirtType_idShirtType`, `ShirtSize_idShirtSize`, `ShirtColor_idShirtColor`, `TypePrint_idTypePrint`, `descountSettings_id`, `category_id`) VALUES
(1, 'Camisa Roblox', 80000, 'camisa con personaje de roblox', 5, 10, 1, 2, 2, 1, 1, 4),
(2, 'Fiesta Navideña', 32000, 'Estilo navideño y bonitos colores rojos', 3, 20, 2, 1, 3, 4, 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL,
  `namerol` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `namerol`) VALUES
(1, 'Administrador'),
(2, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shirtcolor`
--

CREATE TABLE `shirtcolor` (
  `idshirtcolor` int(11) NOT NULL,
  `color` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `shirtcolor`
--

INSERT INTO `shirtcolor` (`idshirtcolor`, `color`) VALUES
(1, 'rojo'),
(2, 'azul'),
(3, 'Violeta'),
(4, 'Verde');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shirtsize`
--

CREATE TABLE `shirtsize` (
  `idShirtSize` int(11) NOT NULL,
  `size` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `shirtsize`
--

INSERT INTO `shirtsize` (`idShirtSize`, `size`) VALUES
(1, 'XXL'),
(2, 'M'),
(3, 'L'),
(4, 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shirttype`
--

CREATE TABLE `shirttype` (
  `idShirtType` int(11) NOT NULL,
  `type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `shirttype`
--

INSERT INTO `shirttype` (`idShirtType`, `type`) VALUES
(1, 'playera'),
(2, 'Camisón'),
(3, 'Blusa'),
(4, 'Sudadera');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `typepqrs`
--

CREATE TABLE `typepqrs` (
  `idtypePqrs` int(11) NOT NULL,
  `typepqrs` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `typepqrs`
--

INSERT INTO `typepqrs` (`idtypePqrs`, `typepqrs`) VALUES
(1, 'Pregunta'),
(2, 'Queja'),
(3, 'Reclamo'),
(4, 'Sugerencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `typeprint`
--

CREATE TABLE `typeprint` (
  `idTypePrint` int(11) NOT NULL,
  `TypePrint` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `typeprint`
--

INSERT INTO `typeprint` (`idTypePrint`, `TypePrint`) VALUES
(1, 'prensada'),
(2, 'forjada'),
(3, 'Tejida'),
(4, 'Plasmada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uicode`
--

CREATE TABLE `uicode` (
  `iduicode` int(11) NOT NULL,
  `file` varchar(200) NOT NULL,
  `rol_idrol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `uicode`
--

INSERT INTO `uicode` (`iduicode`, `file`, `rol_idrol`) VALUES
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
  `lastName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Indices de la tabla `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`idbill`),
  ADD KEY `paymentmethod_idpaymentmethod` (`paymentmethod_idpaymentmethod`),
  ADD KEY `users_bill` (`user_id`),
  ADD KEY `billState_bill` (`billState_id`);

--
-- Indices de la tabla `billstate`
--
ALTER TABLE `billstate`
  ADD PRIMARY KEY (`idBillState`);

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`idCategory`);

--
-- Indices de la tabla `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`iddelivery`),
  ADD KEY `bill_idbill` (`bill_idbill`);

--
-- Indices de la tabla `descountsettings`
--
ALTER TABLE `descountsettings`
  ADD PRIMARY KEY (`iddescountSettings`,`descount`);

--
-- Indices de la tabla `dimensionprint`
--
ALTER TABLE `dimensionprint`
  ADD PRIMARY KEY (`iddimensionprint`);

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
  ADD KEY `typePqrs_idtypePqrs` (`typePqrs_idtypePqrs`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orderbase`
--
ALTER TABLE `orderbase`
  ADD PRIMARY KEY (`idorder`),
  ADD KEY `bill_idbill` (`bill_idbill`),
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
ALTER TABLE `paymentmethod`
  ADD PRIMARY KEY (`idpaymentmethod`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `productcalification`
--
ALTER TABLE `productcalification`
  ADD PRIMARY KEY (`idproductcalification`),
  ADD KEY `user_iduser` (`user_iduser`),
  ADD KEY `product_idproduct` (`product_idproduct`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`idproduct`),
  ADD KEY `ShirtType_idShirtType` (`ShirtType_idShirtType`),
  ADD KEY `ShirtSize_idShirtSize` (`ShirtSize_idShirtSize`),
  ADD KEY `ShirtColor_idShirtColor` (`ShirtColor_idShirtColor`),
  ADD KEY `TypePrint_idTypePrint` (`TypePrint_idTypePrint`),
  ADD KEY `descountSettings_products` (`descountSettings_id`),
  ADD KEY `category_products` (`category_id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `shirtcolor`
--
ALTER TABLE `shirtcolor`
  ADD PRIMARY KEY (`idshirtcolor`);

--
-- Indices de la tabla `shirtsize`
--
ALTER TABLE `shirtsize`
  ADD PRIMARY KEY (`idShirtSize`);

--
-- Indices de la tabla `shirttype`
--
ALTER TABLE `shirttype`
  ADD PRIMARY KEY (`idShirtType`);

--
-- Indices de la tabla `typepqrs`
--
ALTER TABLE `typepqrs`
  ADD PRIMARY KEY (`idtypePqrs`);

--
-- Indices de la tabla `typeprint`
--
ALTER TABLE `typeprint`
  ADD PRIMARY KEY (`idTypePrint`);

--
-- Indices de la tabla `uicode`
--
ALTER TABLE `uicode`
  ADD PRIMARY KEY (`iduicode`),
  ADD KEY `rol_idrol` (`rol_idrol`);

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
ALTER TABLE `bill`
  MODIFY `idbill` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `billstate`
--
ALTER TABLE `billstate`
  MODIFY `idBillState` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `idCategory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `delivery`
--
ALTER TABLE `delivery`
  MODIFY `iddelivery` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `descountsettings`
--
ALTER TABLE `descountsettings`
  MODIFY `iddescountSettings` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `dimensionprint`
--
ALTER TABLE `dimensionprint`
  MODIFY `iddimensionprint` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT de la tabla `orderbase`
--
ALTER TABLE `orderbase`
  MODIFY `idorder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- AUTO_INCREMENT de la tabla `shirtcolor`
--
ALTER TABLE `shirtcolor`
  MODIFY `idshirtcolor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `shirtsize`
--
ALTER TABLE `shirtsize`
  MODIFY `idShirtSize` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `shirttype`
--
ALTER TABLE `shirttype`
  MODIFY `idShirtType` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `typeprint`
--
ALTER TABLE `typeprint`
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
ALTER TABLE `bill`
  ADD CONSTRAINT `billState_bill` FOREIGN KEY (`billState_id`) REFERENCES `billstate` (`idBillState`),
  ADD CONSTRAINT `paymentMethod_bill` FOREIGN KEY (`paymentmethod_idpaymentmethod`) REFERENCES `paymentmethod` (`idpaymentmethod`),
  ADD CONSTRAINT `users_bill` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `bill_delivery` FOREIGN KEY (`bill_idbill`) REFERENCES `bill` (`idbill`);

--
-- Filtros para la tabla `managementpqrs`
--
ALTER TABLE `managementpqrs`
  ADD CONSTRAINT `typepqrs_magagementpqrs` FOREIGN KEY (`typePqrs_idtypePqrs`) REFERENCES `typepqrs` (`idtypePqrs`),
  ADD CONSTRAINT `users_managementpqrs` FOREIGN KEY (`user_iduser`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `orderbase`
--
ALTER TABLE `orderbase`
  ADD CONSTRAINT `bill_orderBase` FOREIGN KEY (`bill_idbill`) REFERENCES `bill` (`idbill`),
  ADD CONSTRAINT `dimensionPrint_orderBase` FOREIGN KEY (`dimensionPrint_idDimensionPrint`) REFERENCES `dimensionprint` (`iddimensionprint`),
  ADD CONSTRAINT `product_orderBase` FOREIGN KEY (`product_idProduct`) REFERENCES `products` (`idproduct`);

--
-- Filtros para la tabla `productcalification`
--
ALTER TABLE `productcalification`
  ADD CONSTRAINT `products_productCalification` FOREIGN KEY (`product_idproduct`) REFERENCES `products` (`idproduct`),
  ADD CONSTRAINT `users_productCalification` FOREIGN KEY (`user_iduser`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `ShirtColor_products` FOREIGN KEY (`ShirtColor_idShirtColor`) REFERENCES `shirtcolor` (`idshirtcolor`),
  ADD CONSTRAINT `ShirtSize_products` FOREIGN KEY (`ShirtSize_idShirtSize`) REFERENCES `shirtsize` (`idShirtSize`),
  ADD CONSTRAINT `ShirtType_products` FOREIGN KEY (`ShirtType_idShirtType`) REFERENCES `shirttype` (`idShirtType`),
  ADD CONSTRAINT `TypePrint_products` FOREIGN KEY (`TypePrint_idTypePrint`) REFERENCES `typeprint` (`idTypePrint`),
  ADD CONSTRAINT `category_products` FOREIGN KEY (`category_id`) REFERENCES `category` (`idCategory`),
  ADD CONSTRAINT `descountSettings_products` FOREIGN KEY (`descountSettings_id`) REFERENCES `descountsettings` (`iddescountSettings`);

--
-- Filtros para la tabla `uicode`
--
ALTER TABLE `uicode`
  ADD CONSTRAINT `rol_uicode` FOREIGN KEY (`rol_idrol`) REFERENCES `rol` (`idrol`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `rol_users` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`idrol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
