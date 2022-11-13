-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-11-2022 a las 02:49:22
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
-- Base de datos: `ping`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aboutus`
--

CREATE TABLE `aboutus` (
  `id` int(11) NOT NULL,
  `aboutus` varchar(500) NOT NULL,
  `mission` varchar(500) NOT NULL,
  `vision` varchar(500) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bills`
--

CREATE TABLE `bills` (
  `id` int(11) NOT NULL,
  `billState_id` int(5) NOT NULL DEFAULT 1,
  `paymentMethod_id` int(11) NOT NULL DEFAULT 1,
  `subTotal` int(11) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bills`
--

INSERT INTO `bills` (`id`, `billState_id`, `paymentMethod_id`, `subTotal`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 1, 1, NULL, 5, NULL, NULL),
(3, 1, 1, NULL, 4, NULL, NULL),
(4, 4, 1, NULL, 3, NULL, NULL),
(5, 3, 1, 100000, 4, NULL, NULL),
(6, 1, 1, 27000, 3, NULL, NULL),
(7, 3, 1, 25000, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `billstates`
--

CREATE TABLE `billstates` (
  `id` int(5) NOT NULL,
  `state` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `billstates`
--

INSERT INTO `billstates` (`id`, `state`, `created_at`, `updated_at`) VALUES
(1, 'Carrito', NULL, NULL),
(3, 'Entregado', NULL, NULL),
(4, 'En espera', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(5, 'Mujeres', NULL, NULL),
(6, 'Hombres', NULL, NULL),
(7, 'Jovenes', NULL, NULL),
(8, 'Niños', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deliveries`
--

CREATE TABLE `deliveries` (
  `id` int(11) NOT NULL,
  `direction` varchar(100) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `deliveries`
--

INSERT INTO `deliveries` (`id`, `direction`, `bill_id`, `created_at`, `updated_at`) VALUES
(1, 'calle 40 $ 32 - 15 norte', 7, NULL, NULL),
(2, 'Carrera 16 # 23-89 sur', 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descountsettings`
--

CREATE TABLE `descountsettings` (
  `id` int(11) NOT NULL,
  `descriptionDescount` varchar(45) NOT NULL,
  `descount` float NOT NULL,
  `applyDate` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `descountsettings`
--

INSERT INTO `descountsettings` (`id`, `descriptionDescount`, `descount`, `applyDate`, `created_at`, `updated_at`) VALUES
(5, 'Sin descuento', 0, '0000-00-00', NULL, NULL),
(6, 'Por Navidad', 10, '2022-11-20', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dimensionprint`
--

CREATE TABLE `dimensionprint` (
  `id` int(11) NOT NULL,
  `dimension` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `id` int(11) NOT NULL,
  `description` varchar(200) NOT NULL,
  `fechaPqrs` date NOT NULL,
  `state` varchar(1) NOT NULL,
  `typePqrs_id` int(11) NOT NULL,
  `user_id` bigint(11) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `managementpqrs`
--

INSERT INTO `managementpqrs` (`id`, `description`, `fechaPqrs`, `state`, `typePqrs_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 'la página funciona re bien :]', '2022-11-12', '0', 6, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordersbase`
--

CREATE TABLE `ordersbase` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `dimensionPrint_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ordersbase`
--

INSERT INTO `ordersbase` (`id`, `quantity`, `bill_id`, `dimensionPrint_id`, `product_id`, `created_at`, `updated_at`) VALUES
(9, 9, 4, NULL, 4, NULL, NULL),
(10, 10, 2, NULL, 4, NULL, NULL),
(11, 3, 6, NULL, 3, NULL, NULL),
(12, 2, 3, NULL, 4, NULL, NULL),
(13, 2, 3, NULL, 3, NULL, NULL);

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
-- Estructura de tabla para la tabla `paymentmethods`
--

CREATE TABLE `paymentmethods` (
  `id` int(11) NOT NULL,
  `method` varchar(60) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `paymentmethods`
--

INSERT INTO `paymentmethods` (`id`, `method`, `created_at`, `updated_at`) VALUES
(1, 'payPal', NULL, NULL),
(2, 'PSE', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_Types` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` int(11) NOT NULL,
  `calification` int(11) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `garanty` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `description`, `garanty`, `quantity`, `created_at`, `updated_at`) VALUES
(3, 'camisa roblox', 15000, 'camisa con personajes de roblox', NULL, 15, NULL, NULL),
(4, 'Subway Surfers', 15000, 'camisa con personajes de subway surfers y sus escenarios', 15, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products_categories`
--

CREATE TABLE `products_categories` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products_categories`
--

INSERT INTO `products_categories` (`product_id`, `category_id`) VALUES
(3, 6),
(3, 7),
(3, 8),
(4, 7),
(4, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products_descountsettings`
--

CREATE TABLE `products_descountsettings` (
  `product_id` int(11) NOT NULL,
  `descountsetting_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products_descountsettings`
--

INSERT INTO `products_descountsettings` (`product_id`, `descountsetting_id`) VALUES
(3, 5),
(4, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products_shirtcolors`
--

CREATE TABLE `products_shirtcolors` (
  `product_id` int(11) NOT NULL,
  `shirtcolor_id` int(11) NOT NULL,
  `image` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products_shirtcolors`
--

INSERT INTO `products_shirtcolors` (`product_id`, `shirtcolor_id`, `image`) VALUES
(3, 5, NULL),
(3, 6, NULL),
(4, 6, NULL),
(4, 7, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products_shirtsizes`
--

CREATE TABLE `products_shirtsizes` (
  `shirtsize_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products_shirtsizes`
--

INSERT INTO `products_shirtsizes` (`shirtsize_id`, `product_id`) VALUES
(5, 4),
(7, 3),
(8, 3),
(8, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products_shirttypes`
--

CREATE TABLE `products_shirttypes` (
  `product_id` int(11) NOT NULL,
  `shirttype_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products_shirttypes`
--

INSERT INTO `products_shirttypes` (`product_id`, `shirttype_id`) VALUES
(3, 5),
(3, 7),
(4, 5),
(4, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Aministrador', NULL, NULL),
(2, 'Cliente', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shirtcolors`
--

CREATE TABLE `shirtcolors` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `color` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `shirtcolors`
--

INSERT INTO `shirtcolors` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(5, 'Azul', '#0000ff', NULL, NULL),
(6, 'Rojo', '#ff0000', NULL, NULL),
(7, 'Verde', '#00ff00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shirtsizes`
--

CREATE TABLE `shirtsizes` (
  `id` int(11) NOT NULL,
  `sizes` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `shirtsizes`
--

INSERT INTO `shirtsizes` (`id`, `sizes`, `created_at`, `updated_at`) VALUES
(5, 'XXL', NULL, NULL),
(6, 'L', NULL, NULL),
(7, 'M', NULL, NULL),
(8, 'S', NULL, NULL),
(9, 'XL', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shirttypes`
--

CREATE TABLE `shirttypes` (
  `id` int(11) NOT NULL,
  `types` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `shirttypes`
--

INSERT INTO `shirttypes` (`id`, `types`, `created_at`, `updated_at`) VALUES
(5, 'Algodon', NULL, NULL),
(6, 'Licra', NULL, NULL),
(7, 'Seda', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `typespqrs`
--

CREATE TABLE `typespqrs` (
  `id` int(11) NOT NULL,
  `typesPqrs` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `typespqrs`
--

INSERT INTO `typespqrs` (`id`, `typesPqrs`, `created_at`, `updated_at`) VALUES
(1, 'Peticion', NULL, NULL),
(2, 'Queja', NULL, NULL),
(3, 'Reclamo', NULL, NULL),
(4, 'Sugerencia', NULL, NULL),
(5, 'Pregunta', NULL, NULL),
(6, 'Felicitación', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `typesprint`
--

CREATE TABLE `typesprint` (
  `id` int(11) NOT NULL,
  `typesPrint` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `typesprint`
--

INSERT INTO `typesprint` (`id`, `typesPrint`, `created_at`, `updated_at`) VALUES
(1, 'Sublimación', NULL, NULL),
(2, 'Vinilo Impreso', NULL, NULL),
(3, 'Serigrafia', NULL, NULL),
(4, 'Transfer', NULL, NULL),
(5, 'Laser (DTF)', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uicode`
--

CREATE TABLE `uicode` (
  `id` int(11) NOT NULL,
  `file` varchar(200) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `lastName`, `birthDate`, `email`, `email_verified_at`, `phone`, `rol_id`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'Daniel Mauricio', NULL, NULL, 'damn-man@yahoo.es', NULL, NULL, 2, '$2y$10$vnPqYVtdqZTV3E1Wflr7luqjxv4UFmBZySVtU1w7H91jTKof.eSoq', NULL, '2022-11-13 04:23:51', '2022-11-13 04:23:51'),
(4, 'Gerardo', 'Gonzales', '2011-09-16', 'gerardo15@gmail.com', NULL, '3189234589', 2, '$2a$12$UVUbt0NThImIF4gXD7RLJehGW1wS8fEs.4O7xeepeJmanTM3RvI/e', NULL, '2022-11-13 01:09:43', '2022-11-13 01:09:43'),
(5, 'María Alejandra', 'Castillo Sierra', '2000-05-28', 'mariale@hotmail.com', NULL, '3224838312', 1, '$2a$12$V8wa9NoPLiRyrplGM.gRmOsZaE6givcQRZ.zw8I0ITg1FefV/1UKK', NULL, '2022-11-13 01:09:43', '2022-11-13 01:09:43');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aboutus`
--
ALTER TABLE `aboutus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `billStates_bills` (`billState_id`),
  ADD KEY `paymentMethods_bills` (`paymentMethod_id`),
  ADD KEY `users_bills` (`user_id`);

--
-- Indices de la tabla `billstates`
--
ALTER TABLE `billstates`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_deliveries` (`bill_id`);

--
-- Indices de la tabla `descountsettings`
--
ALTER TABLE `descountsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dimensionprint`
--
ALTER TABLE `dimensionprint`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `managementpqrs`
--
ALTER TABLE `managementpqrs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `typesPqrs_magagementPqrs` (`typePqrs_id`),
  ADD KEY `users_managementPqrs` (`user_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordersbase`
--
ALTER TABLE `ordersbase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_ordersBase` (`bill_id`),
  ADD KEY `dimensionPrint_ordersBase` (`dimensionPrint_id`),
  ADD KEY `products_ordersBase` (`product_id`);

--
-- Indices de la tabla `paymentmethods`
--
ALTER TABLE `paymentmethods`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productcalification`
--
ALTER TABLE `productcalification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_productCalification` (`product_id`),
  ADD KEY `users_productCalification` (`user_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products_categories`
--
ALTER TABLE `products_categories`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `fk_products_has_categories_categories1` (`category_id`);

--
-- Indices de la tabla `products_descountsettings`
--
ALTER TABLE `products_descountsettings`
  ADD PRIMARY KEY (`product_id`,`descountsetting_id`) USING BTREE,
  ADD KEY `fk_products_has_descountsettings_descountsettings1` (`descountsetting_id`) USING BTREE;

--
-- Indices de la tabla `products_shirtcolors`
--
ALTER TABLE `products_shirtcolors`
  ADD PRIMARY KEY (`product_id`,`shirtcolor_id`),
  ADD KEY `fk_products_has_shirtcolors_shirtcolors1` (`shirtcolor_id`);

--
-- Indices de la tabla `products_shirtsizes`
--
ALTER TABLE `products_shirtsizes`
  ADD PRIMARY KEY (`shirtsize_id`,`product_id`),
  ADD KEY `fk_shirtsizes_products_products1` (`product_id`);

--
-- Indices de la tabla `products_shirttypes`
--
ALTER TABLE `products_shirttypes`
  ADD PRIMARY KEY (`product_id`,`shirttype_id`),
  ADD KEY `fk_products_has_shirttypes_shirttypes1` (`shirttype_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `shirtcolors`
--
ALTER TABLE `shirtcolors`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `shirtsizes`
--
ALTER TABLE `shirtsizes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `shirttypes`
--
ALTER TABLE `shirttypes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `typespqrs`
--
ALTER TABLE `typespqrs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `typesprint`
--
ALTER TABLE `typesprint`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `uicode`
--
ALTER TABLE `uicode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rol_UICode` (`rol_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_users` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `billstates`
--
ALTER TABLE `billstates`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `descountsettings`
--
ALTER TABLE `descountsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `dimensionprint`
--
ALTER TABLE `dimensionprint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `managementpqrs`
--
ALTER TABLE `managementpqrs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ordersbase`
--
ALTER TABLE `ordersbase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `shirtcolors`
--
ALTER TABLE `shirtcolors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `shirtsizes`
--
ALTER TABLE `shirtsizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `shirttypes`
--
ALTER TABLE `shirttypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `typesprint`
--
ALTER TABLE `typesprint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `billStates_bills` FOREIGN KEY (`billState_id`) REFERENCES `billstates` (`id`),
  ADD CONSTRAINT `paymentMethods_bills` FOREIGN KEY (`paymentMethod_id`) REFERENCES `paymentmethods` (`id`),
  ADD CONSTRAINT `users_bills` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `deliveries`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `bills_deliveries` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`);

--
-- Filtros para la tabla `managementpqrs`
--
ALTER TABLE `managementpqrs`
  ADD CONSTRAINT `typesPqrs_magagementPqrs` FOREIGN KEY (`typePqrs_id`) REFERENCES `typespqrs` (`id`),
  ADD CONSTRAINT `users_managementPqrs` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `ordersbase`
--
ALTER TABLE `ordersbase`
  ADD CONSTRAINT `bills_ordersBase` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`),
  ADD CONSTRAINT `dimensionPrint_ordersBase` FOREIGN KEY (`dimensionPrint_id`) REFERENCES `dimensionprint` (`id`),
  ADD CONSTRAINT `products_ordersBase` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Filtros para la tabla `productcalification`
--
ALTER TABLE `productcalification`
  ADD CONSTRAINT `products_productCalification` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `users_productCalification` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `products_categories`
--
ALTER TABLE `products_categories`
  ADD CONSTRAINT `fk_products_has_categories_categories1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_products_has_categories_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `products_descountsettings`
--
ALTER TABLE `products_descountsettings`
  ADD CONSTRAINT `products_descountsettings_descountsettings` FOREIGN KEY (`descountsetting_id`) REFERENCES `descountsettings` (`id`),
  ADD CONSTRAINT `products_descountsettings_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Filtros para la tabla `products_shirtcolors`
--
ALTER TABLE `products_shirtcolors`
  ADD CONSTRAINT `products_shirtcolors_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `products_shirtcolors_shirtcolors` FOREIGN KEY (`shirtcolor_id`) REFERENCES `shirtcolors` (`id`);

--
-- Filtros para la tabla `products_shirtsizes`
--
ALTER TABLE `products_shirtsizes`
  ADD CONSTRAINT `products_shirtsizes_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `products_shirtsizes_shirtsizes` FOREIGN KEY (`shirtsize_id`) REFERENCES `shirtsizes` (`id`);

--
-- Filtros para la tabla `products_shirttypes`
--
ALTER TABLE `products_shirttypes`
  ADD CONSTRAINT `products_shirttypes_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `products_shirttypes_shirttypes` FOREIGN KEY (`shirttype_id`) REFERENCES `shirttypes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
