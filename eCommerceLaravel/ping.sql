-- MySQL Script generated by MySQL Workbench
-- Wed Nov  9 17:21:01 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ping
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ping
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ping` DEFAULT CHARACTER SET utf8mb4 ;
USE `ping` ;

-- -----------------------------------------------------
-- Table `ping`.`aboutus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`aboutus` (
  `id` INT(11) NOT NULL,
  `text` VARCHAR(500) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ping`.`billstates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`billstates` (
  `id` INT(5) NOT NULL AUTO_INCREMENT,
  `state` VARCHAR(10) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ping`.`paymentmethods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`paymentmethods` (
  `id` INT(11) NOT NULL,
  `method` VARCHAR(60) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ping`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`roles` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(20) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ping`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`users` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `lastName` VARCHAR(50) NULL DEFAULT NULL,
  `birthDate` DATE NULL DEFAULT NULL,
  `email` VARCHAR(255) NOT NULL,
  `email_verified_at` TIMESTAMP NULL DEFAULT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `roles_id` INT(11) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `remember_token` VARCHAR(100) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  CONSTRAINT `roles_users`
    FOREIGN KEY (`roles_id`)
    REFERENCES `ping`.`roles` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE UNIQUE INDEX `users_email_unique` ON `ping`.`users` (`email` ASC) VISIBLE;

CREATE INDEX `roles_users` ON `ping`.`users` (`roles_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `ping`.`bills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`bills` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `billStates_id` INT(5) NOT NULL,
  `paymentMethod_id` INT(11) NOT NULL,
  `subTotal` INT(11) NULL DEFAULT NULL,
  `users_id` BIGINT(20) UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `billStates_bills`
    FOREIGN KEY (`billStates_id`)
    REFERENCES `ping`.`billstates` (`id`),
  CONSTRAINT `paymentMethods_bills`
    FOREIGN KEY (`paymentMethod_id`)
    REFERENCES `ping`.`paymentmethods` (`id`),
  CONSTRAINT `users_bills`
    FOREIGN KEY (`users_id`)
    REFERENCES `ping`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX `paymentMethod_id` ON `ping`.`bills` (`paymentMethod_id` ASC) VISIBLE;

CREATE INDEX `users_bills` ON `ping`.`bills` (`users_id` ASC) VISIBLE;

CREATE INDEX `billStates_bills` ON `ping`.`bills` (`billStates_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `ping`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`categories` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ping`.`deliveries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`deliveries` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `direction` VARCHAR(100) NOT NULL,
  `bills_id` INT(11) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `bills_deliveries`
    FOREIGN KEY (`bills_id`)
    REFERENCES `ping`.`bills` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX `bills_id` ON `ping`.`deliveries` (`bills_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `ping`.`descountsettings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`descountsettings` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `descriptionDescount` VARCHAR(45) NOT NULL,
  `descount` FLOAT NOT NULL,
  `applyDate` DATE NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `descount`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ping`.`dimensionprint`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`dimensionprint` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `dimension` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ping`.`failed_jobs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`failed_jobs` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` VARCHAR(255) NOT NULL,
  `connection` TEXT NOT NULL,
  `queue` TEXT NOT NULL,
  `payload` LONGTEXT NOT NULL,
  `exception` LONGTEXT NOT NULL,
  `failed_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE UNIQUE INDEX `failed_jobs_uuid_unique` ON `ping`.`failed_jobs` (`uuid` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `ping`.`typespqrs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`typespqrs` (
  `id` INT(11) NOT NULL,
  `typesPqrs` VARCHAR(50) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ping`.`managementpqrs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`managementpqrs` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(200) NOT NULL,
  `fechaPqrs` DATE NOT NULL,
  `state` VARCHAR(1) NOT NULL,
  `typesPqrs_id` INT(11) NOT NULL,
  `users_id` BIGINT(11) UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `typesPqrs_magagementPqrs`
    FOREIGN KEY (`typesPqrs_id`)
    REFERENCES `ping`.`typespqrs` (`id`),
  CONSTRAINT `users_managementPqrs`
    FOREIGN KEY (`users_id`)
    REFERENCES `ping`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX `users_id` ON `ping`.`managementpqrs` (`users_id` ASC) VISIBLE;

CREATE INDEX `typesPqrs_id` ON `ping`.`managementpqrs` (`typesPqrs_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `ping`.`migrations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`migrations` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` VARCHAR(255) NOT NULL,
  `batch` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `ping`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`products` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `price` INT(11) NOT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  `image` VARCHAR(250) NULL DEFAULT NULL,
  `garanty` INT(11) NULL DEFAULT NULL,
  `QuantityAvailable` INT(11) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ping`.`ordersbase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`ordersbase` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `quantity` INT(11) NOT NULL,
  `bills_id` INT(11) NOT NULL,
  `dimensionPrint_id` INT(11) NOT NULL,
  `products_id` INT(11) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `bills_ordersBase`
    FOREIGN KEY (`bills_id`)
    REFERENCES `ping`.`bills` (`id`),
  CONSTRAINT `dimensionPrint_ordersBase`
    FOREIGN KEY (`dimensionPrint_id`)
    REFERENCES `ping`.`dimensionprint` (`id`),
  CONSTRAINT `products_ordersBase`
    FOREIGN KEY (`products_id`)
    REFERENCES `ping`.`products` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX `bills_id` ON `ping`.`ordersbase` (`bills_id` ASC) VISIBLE;

CREATE INDEX `dimensionPrint_id` ON `ping`.`ordersbase` (`dimensionPrint_id` ASC) VISIBLE;

CREATE INDEX `products_id` ON `ping`.`ordersbase` (`products_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `ping`.`password_resets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`password_resets` (
  `email` VARCHAR(255) NOT NULL,
  `token` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE INDEX `password_resets_email_index` ON `ping`.`password_resets` (`email` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `ping`.`personal_access_tokens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`personal_access_tokens` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_Types` VARCHAR(255) NOT NULL,
  `tokenable_id` BIGINT(20) UNSIGNED NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `token` VARCHAR(64) NOT NULL,
  `abilities` TEXT NULL DEFAULT NULL,
  `last_used_at` TIMESTAMP NULL DEFAULT NULL,
  `expires_at` TIMESTAMP NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE UNIQUE INDEX `personal_access_tokens_token_unique` ON `ping`.`personal_access_tokens` (`token` ASC) VISIBLE;

CREATE INDEX `personal_access_tokens_tokenable_Types_tokenable_id_index` ON `ping`.`personal_access_tokens` (`tokenable_Types` ASC, `tokenable_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `ping`.`productcalification`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`productcalification` (
  `id` INT(11) NOT NULL,
  `calification` INT(11) NULL DEFAULT NULL,
  `users_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
  `products_id` INT(11) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `products_productCalification`
    FOREIGN KEY (`products_id`)
    REFERENCES `ping`.`products` (`id`),
  CONSTRAINT `users_productCalification`
    FOREIGN KEY (`users_id`)
    REFERENCES `ping`.`users` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX `users_id` ON `ping`.`productcalification` (`users_id` ASC) VISIBLE;

CREATE INDEX `products_id` ON `ping`.`productcalification` (`products_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `ping`.`shirtcolors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`shirtcolors` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `color` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ping`.`shirtsizes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`shirtsizes` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Sizes` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ping`.`shirttypes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`shirttypes` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Types` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ping`.`typesprint`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`typesprint` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `typesPrint` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ping`.`uicode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`uicode` (
  `id` INT(11) NOT NULL,
  `file` VARCHAR(200) NOT NULL,
  `roles_id` INT(11) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `rol_UICode`
    FOREIGN KEY (`roles_id`)
    REFERENCES `ping`.`roles` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX `roles_id` ON `ping`.`uicode` (`roles_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `ping`.`products_shirtSizes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`products_shirtSizes` (
  `shirtsizes_id` INT(11) NOT NULL,
  `products_id` INT(11) NOT NULL,
  PRIMARY KEY (`shirtsizes_id`, `products_id`),
  CONSTRAINT `fk_shirtsizes_has_products_shirtsizes1`
    FOREIGN KEY (`shirtsizes_id`)
    REFERENCES `ping`.`shirtsizes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shirtsizes_has_products_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `ping`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX `fk_shirtsizes_has_products_products1_idx` ON `ping`.`products_shirtSizes` (`products_id` ASC) VISIBLE;

CREATE INDEX `fk_shirtsizes_has_products_shirtsizes1_idx` ON `ping`.`products_shirtSizes` (`shirtsizes_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `ping`.`products_shirtcolors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`products_shirtcolors` (
  `products_id` INT(11) NOT NULL,
  `shirtcolors_id` INT(11) NOT NULL,
  PRIMARY KEY (`products_id`, `shirtcolors_id`),
  CONSTRAINT `fk_products_has_shirtcolors_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `ping`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_has_shirtcolors_shirtcolors1`
    FOREIGN KEY (`shirtcolors_id`)
    REFERENCES `ping`.`shirtcolors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX `fk_products_has_shirtcolors_shirtcolors1_idx` ON `ping`.`products_shirtcolors` (`shirtcolors_id` ASC) VISIBLE;

CREATE INDEX `fk_products_has_shirtcolors_products1_idx` ON `ping`.`products_shirtcolors` (`products_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `ping`.`products_shirttypes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`products_shirttypes` (
  `products_id` INT(11) NOT NULL,
  `shirttypes_id` INT(11) NOT NULL,
  PRIMARY KEY (`products_id`, `shirttypes_id`),
  CONSTRAINT `fk_products_has_shirttypes_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `ping`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_has_shirttypes_shirttypes1`
    FOREIGN KEY (`shirttypes_id`)
    REFERENCES `ping`.`shirttypes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX `fk_products_has_shirttypes_shirttypes1_idx` ON `ping`.`products_shirttypes` (`shirttypes_id` ASC) VISIBLE;

CREATE INDEX `fk_products_has_shirttypes_products1_idx` ON `ping`.`products_shirttypes` (`products_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `ping`.`products_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`products_categories` (
  `products_id` INT(11) NOT NULL,
  `categories_id` INT(11) NOT NULL,
  PRIMARY KEY (`products_id`, `categories_id`),
  CONSTRAINT `fk_products_has_categories_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `ping`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_has_categories_categories1`
    FOREIGN KEY (`categories_id`)
    REFERENCES `ping`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX `fk_products_has_categories_categories1_idx` ON `ping`.`products_categories` (`categories_id` ASC) VISIBLE;

CREATE INDEX `fk_products_has_categories_products1_idx` ON `ping`.`products_categories` (`products_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `ping`.`products_settings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`products_settings` (
  `products_id` INT(11) NOT NULL,
  `descountsettings_id` INT(11) NOT NULL,
  `descountsettings_descount` FLOAT NOT NULL,
  PRIMARY KEY (`products_id`, `descountsettings_id`, `descountsettings_descount`),
  CONSTRAINT `fk_products_has_descountsettings_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `ping`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_has_descountsettings_descountsettings1`
    FOREIGN KEY (`descountsettings_id` , `descountsettings_descount`)
    REFERENCES `ping`.`descountsettings` (`id` , `descount`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX `fk_products_has_descountsettings_descountsettings1_idx` ON `ping`.`products_settings` (`descountsettings_id` ASC, `descountsettings_descount` ASC) VISIBLE;

CREATE INDEX `fk_products_has_descountsettings_products1_idx` ON `ping`.`products_settings` (`products_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `ping`.`products_has_typesprint`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ping`.`products_has_typesprint` (
  `products_id` INT(11) NOT NULL,
  `typesprint_id` INT(11) NOT NULL,
  PRIMARY KEY (`products_id`, `typesprint_id`),
  CONSTRAINT `fk_products_has_typesprint_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `ping`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_has_typesprint_typesprint1`
    FOREIGN KEY (`typesprint_id`)
    REFERENCES `ping`.`typesprint` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX `fk_products_has_typesprint_typesprint1_idx` ON `ping`.`products_has_typesprint` (`typesprint_id` ASC) VISIBLE;

CREATE INDEX `fk_products_has_typesprint_products1_idx` ON `ping`.`products_has_typesprint` (`products_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;