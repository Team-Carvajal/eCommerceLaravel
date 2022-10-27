-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2022 at 04:18 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

DROP IF EXISTS DATABASE `ping`;
CREATE DATABASE `ping`;
USE `ping`;


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ping`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `idbill` int(11) NOT NULL,
  `expeditiondatebill` date DEFAULT NULL,
  `statebill` int(11) DEFAULT NULL,
  `paymentmethod_idpaymentmethod` int(11) DEFAULT NULL,
  `user_iduser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `idcategory` int(11) NOT NULL,
  `category` varchar(45) DEFAULT NULL,
  `descountSettings_iddescountSettings` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `iddelivery` int(11) NOT NULL,
  `direction` varchar(100) NOT NULL,
  `bill_idbill` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `descountsettings`
--

CREATE TABLE `descountsettings` (
  `iddescountSettings` int(11) NOT NULL,
  `descriptionDescount` varchar(45) NOT NULL,
  `descount` float NOT NULL,
  `applyDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dimensionprint`
--

CREATE TABLE `dimensionprint` (
  `iddimensionprint` int(11) NOT NULL,
  `dimension` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `managementpqrs`
--

CREATE TABLE `managementpqrs` (
  `idmanagementPqrs` int(11) NOT NULL,
  `description` varchar(200) NOT NULL,
  `fechaPqrs` date NOT NULL,
  `state` varchar(1) NOT NULL,
  `typePqrs_idtypePqrs` int(11) NOT NULL,
  `user_iduser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orderbase`
--

CREATE TABLE `orderbase` (
  `idorder` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `bill_idbill` int(11) DEFAULT NULL,
  `dimensionPrint_idDimensionPrint` int(11) DEFAULT NULL,
  `product_idProduct` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `paymentmethod`
--

CREATE TABLE `paymentmethod` (
  `idpaymentmethod` int(11) NOT NULL,
  `method` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `idproduct` int(11) NOT NULL,
  `nameProduct` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `descriptionProduct` varchar(200) DEFAULT NULL,
  `garanty` int(11) DEFAULT NULL,
  `QuantityAvailable` int(11) DEFAULT NULL,
  `ShirtType_idShirtType` int(11) NOT NULL,
  `ShirtSize_idShirtSize` int(11) NOT NULL,
  `ShirtColor_idShirtColor` int(11) NOT NULL,
  `TypePrint_idTypePrint` int(11) NOT NULL,
  `category_idcategory` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `productcalification`
--

CREATE TABLE `productcalification` (
  `idproductcalification` int(11) NOT NULL,
  `calification` int(11) DEFAULT NULL,
  `user_iduser` int(11) DEFAULT NULL,
  `product_idproduct` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL,
  `namerol` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shirtcolor`
--

CREATE TABLE `shirtcolor` (
  `idshirtcolor` int(11) NOT NULL,
  `color` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shirtsize`
--

CREATE TABLE `shirtsize` (
  `idShirtSize` int(11) NOT NULL,
  `size` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shirttype`
--

CREATE TABLE `shirttype` (
  `idShirtType` int(11) NOT NULL,
  `type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `typepqrs`
--

CREATE TABLE `typepqrs` (
  `idtypePqrs` int(11) NOT NULL,
  `typepqrs` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `typeprint`
--

CREATE TABLE `typeprint` (
  `idTypePrint` int(11) NOT NULL,
  `TypePrint` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uicode`
--

CREATE TABLE `uicode` (
  `iduicode` int(11) NOT NULL,
  `file` varchar(200) NOT NULL,
  `rol_idrol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `iduser` int(11) NOT NULL,
  `names` varchar(50) DEFAULT NULL,
  `surnames` varchar(80) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `userpassword` varchar(255) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `rol_idRol` int(11) DEFAULT NULL,
  `registerdate` date DEFAULT NULL,
  `dni` int(15) DEFAULT NULL,
  `phoneNumber` VARCHAR (11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`idbill`),
  ADD KEY `user_iduser` (`user_iduser`),
  ADD KEY `paymentmethod_idpaymentmethod` (`paymentmethod_idpaymentmethod`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`idcategory`),
  ADD KEY `descountSettings_iddescountSettings` (`descountSettings_iddescountSettings`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`iddelivery`),
  ADD KEY `bill_idbill` (`bill_idbill`);

--
-- Indexes for table `descountsettings`
--
ALTER TABLE `descountsettings`
  ADD PRIMARY KEY (`iddescountSettings`,`descount`);

--
-- Indexes for table `dimensionprint`
--
ALTER TABLE `dimensionprint`
  ADD PRIMARY KEY (`iddimensionprint`);

--
-- Indexes for table `managementpqrs`
--
ALTER TABLE `managementpqrs`
  ADD PRIMARY KEY (`idmanagementPqrs`),
  ADD KEY `user_iduser` (`user_iduser`),
  ADD KEY `typePqrs_idtypePqrs` (`typePqrs_idtypePqrs`);

--
-- Indexes for table `orderbase`
--
ALTER TABLE `orderbase`
  ADD PRIMARY KEY (`idorder`),
  ADD KEY `bill_idbill` (`bill_idbill`),
  ADD KEY `dimensionPrint_idDimensionPrint` (`dimensionPrint_idDimensionPrint`),
  ADD KEY `product_idProduct` (`product_idProduct`);

--
-- Indexes for table `paymentmethod`
--
ALTER TABLE `paymentmethod`
  ADD PRIMARY KEY (`idpaymentmethod`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`idproduct`),
  ADD KEY `ShirtType_idShirtType` (`ShirtType_idShirtType`),
  ADD KEY `ShirtSize_idShirtSize` (`ShirtSize_idShirtSize`),
  ADD KEY `ShirtColor_idShirtColor` (`ShirtColor_idShirtColor`),
  ADD KEY `TypePrint_idTypePrint` (`TypePrint_idTypePrint`),
  ADD KEY `category_idcategory` (`category_idcategory`);

--
-- Indexes for table `productcalification`
--
ALTER TABLE `productcalification`
  ADD PRIMARY KEY (`idproductcalification`),
  ADD KEY `user_iduser` (`user_iduser`),
  ADD KEY `product_idproduct` (`product_idproduct`);

--
-- Indexes for table `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- Indexes for table `shirtcolor`
--
ALTER TABLE `shirtcolor`
  ADD PRIMARY KEY (`idshirtcolor`);

--
-- Indexes for table `shirtsize`
--
ALTER TABLE `shirtsize`
  ADD PRIMARY KEY (`idShirtSize`);

--
-- Indexes for table `shirttype`
--
ALTER TABLE `shirttype`
  ADD PRIMARY KEY (`idShirtType`);

--
-- Indexes for table `typepqrs`
--
ALTER TABLE `typepqrs`
  ADD PRIMARY KEY (`idtypePqrs`);

--
-- Indexes for table `typeprint`
--
ALTER TABLE `typeprint`
  ADD PRIMARY KEY (`idTypePrint`);

--
-- Indexes for table `uicode`
--
ALTER TABLE `uicode`
  ADD PRIMARY KEY (`iduicode`),
  ADD KEY `rol_idrol` (`rol_idrol`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`),
  ADD KEY `rol_idRol` (`rol_idRol`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `idbill` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `idcategory` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `iddelivery` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dimensionprint`
--
ALTER TABLE `dimensionprint`
  MODIFY `iddimensionprint` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `managementpqrs`
--
ALTER TABLE `managementpqrs`
  MODIFY `idmanagementPqrs` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderbase`
--
ALTER TABLE `orderbase`
  MODIFY `idorder` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paymentmethod`
--
ALTER TABLE `paymentmethod`
  MODIFY `idpaymentmethod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `idproduct` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productcalification`
--
ALTER TABLE `productcalification`
  MODIFY `idproductcalification` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shirtcolor`
--
ALTER TABLE `shirtcolor`
  MODIFY `idshirtcolor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shirtsize`
--
ALTER TABLE `shirtsize`
  MODIFY `idShirtSize` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shirttype`
--
ALTER TABLE `shirttype`
  MODIFY `idShirtType` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `typepqrs`
--
ALTER TABLE `typepqrs`
  MODIFY `idtypePqrs` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `typeprint`
--
ALTER TABLE `typeprint`
  MODIFY `idTypePrint` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uicode`
--
ALTER TABLE `uicode`
  MODIFY `iduicode` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--1

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`user_iduser`) REFERENCES `user` (`iduser`),
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`paymentmethod_idpaymentmethod`) REFERENCES `paymentmethod` (`idpaymentmethod`);

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`descountSettings_iddescountSettings`) REFERENCES `descountsettings` (`iddescountSettings`);

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`bill_idbill`) REFERENCES `bill` (`idbill`);

--
-- Constraints for table `managementpqrs`
--
ALTER TABLE `managementpqrs`
  ADD CONSTRAINT `managementpqrs_ibfk_1` FOREIGN KEY (`user_iduser`) REFERENCES `user` (`iduser`),
  ADD CONSTRAINT `managementpqrs_ibfk_2` FOREIGN KEY (`typePqrs_idtypePqrs`) REFERENCES `typepqrs` (`idtypePqrs`);

--
-- Constraints for table `orderbase`
--
ALTER TABLE `orderbase`
  ADD CONSTRAINT `orderbase_ibfk_1` FOREIGN KEY (`bill_idbill`) REFERENCES `bill` (`idbill`),
  ADD CONSTRAINT `orderbase_ibfk_2` FOREIGN KEY (`dimensionPrint_idDimensionPrint`) REFERENCES `dimensionprint` (`iddimensionprint`),
  ADD CONSTRAINT `orderbase_ibfk_3` FOREIGN KEY (`product_idProduct`) REFERENCES `product` (`idproduct`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`ShirtType_idShirtType`) REFERENCES `shirttype` (`idShirtType`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`ShirtSize_idShirtSize`) REFERENCES `shirtsize` (`idShirtSize`),
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`ShirtColor_idShirtColor`) REFERENCES `shirtcolor` (`idshirtcolor`),
  ADD CONSTRAINT `product_ibfk_4` FOREIGN KEY (`TypePrint_idTypePrint`) REFERENCES `typeprint` (`idTypePrint`),
  ADD CONSTRAINT `product_ibfk_5` FOREIGN KEY (`category_idcategory`) REFERENCES `category` (`idcategory`);

--
-- Constraints for table `productcalification`
--
ALTER TABLE `productcalification`
  ADD CONSTRAINT `productcalification_ibfk_1` FOREIGN KEY (`user_iduser`) REFERENCES `user` (`iduser`),
  ADD CONSTRAINT `productcalification_ibfk_2` FOREIGN KEY (`product_idproduct`) REFERENCES `product` (`idproduct`);

--
-- Constraints for table `uicode`
--
ALTER TABLE `uicode`
  ADD CONSTRAINT `uicode_ibfk_1` FOREIGN KEY (`rol_idrol`) REFERENCES `rol` (`idrol`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`rol_idRol`) REFERENCES `rol` (`idrol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
