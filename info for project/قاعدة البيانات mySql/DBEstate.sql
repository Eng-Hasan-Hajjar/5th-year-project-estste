-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2019 at 06:56 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `estate_hub`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `a` ()  NO SQL
    COMMENT 'جميع العقارات التابعة لماكين'
BEGIN
SELECT estate.EStateName,estate.EStateNumber,owner.First_Name
from estate,estate_owner,owner
WHERE estate_owner.EstateId=estate.Id&&
estate_owner.OwnerId=owner.Id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `b` (IN `id` INT)  NO SQL
    COMMENT 'عدد المالكين لعقار معين'
BEGIN
SELECT estate.EStateName,estate.EStateNumber,COUNT(owner.First_Name)
from estate,estate_owner,owner
WHERE estate_owner.EstateId=estate.Id&&
estate_owner.OwnerId=owner.Id&&
estate.Id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `c` ()  NO SQL
BEGIN
SELECT estate.EStateName,estate.EStateNumber,
COUNT(estate.Id)
from estate,estate_owner
WHERE estate_owner.EstateId=estate.Id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EStateTouched` ()  BEGIN
select estate.EStateName from estate ,estate_customer
where estate.id = estate_customer.EstateId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCustomer` ()  BEGIN
SELECT * FROM customer;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCustomerWantBuys` ()  BEGIN
SELECT * FROM customer
WHERE customer.Desire='شراء';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCustomerWantMortgage` ()  BEGIN
SELECT * FROM customer
WHERE customer.Desire='رهن';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCustomerWantRent` ()  BEGIN
SELECT * FROM customer
WHERE customer.Desire='أجار';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllEState` ()  READS SQL DATA
    COMMENT 'ارجاع العقارات'
BEGIN
SELECT *
FROM estate;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllEStateImages` (IN `estate_id` INT)  BEGIN
SELECT * FROM image
WHERE image.EStateId = estate_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllEStateInCity` (IN `city_id` INT)  BEGIN
SELECT * FROM estate , neighborhood
WHERE estate.NeighborhoodId=neighborhood.Id&&neighborhood.CityId=city_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllEStateInCountry` (IN `country_id` INT)  BEGIN
SELECT estate.EStateName FROM estate , neighborhood ,city ,country
WHERE estate.NeighborhoodId=neighborhood.Id&&
neighborhood.CityId=city.Id&&
city.CountryId=country_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetALLEStateInNeighborhood` (IN `neighborhood_id` INT)  BEGIN
SELECT * FROM estate
WHERE estate.NeighborhoodId = neighborhood_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllEStateReviews` (IN `estate_id` INT)  BEGIN
SELECT * FROM review
WHERE review.EstateId=estate_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllEStateWasRented` ()  BEGIN
SELECT * FROM estate , estate_customer
WHERE estate.Id=estate_customer.EstateId&&estate.InvestType='أجار';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllEStateWithDate` (IN `date` DATE)  BEGIN
SELECT * FROM estate
WHERE RegistrationDate = date;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAlllEStateToNamedOwner` (IN `owner_id` INT)  BEGIN
SELECT  * FROM estate
WHERE estate.OwnerId=owner_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllOwner` ()  BEGIN
SELECT * FROM owner;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `Id` int(11) NOT NULL,
  `CountryId` int(11) NOT NULL,
  `CityName` varchar(15) NOT NULL,
  `DeletedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`Id`, `CountryId`, `CityName`, `DeletedAt`) VALUES
(1, 1, 'Aleppo', NULL),
(2, 1, 'Homs', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `Id` int(11) NOT NULL,
  `CountryName` varchar(15) NOT NULL,
  `CurrencyCode` varchar(10) NOT NULL,
  `DeletedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`Id`, `CountryName`, `CurrencyCode`, `DeletedAt`) VALUES
(1, 'Syria', 'syr', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Id` int(11) NOT NULL,
  `First_Name` varchar(15) NOT NULL,
  `Last_Name` varchar(15) NOT NULL,
  `Phone` bigint(12) NOT NULL,
  `Registration_Date` date NOT NULL,
  `Desire` enum('شراء','أجار','رهن') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DeletedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Id`, `First_Name`, `Last_Name`, `Phone`, `Registration_Date`, `Desire`, `DeletedAt`) VALUES
(1, 'رفعة', 'الجاسم', 998543346, '2019-01-01', 'شراء', NULL),
(2, 'gada', 'ali', 987625678, '2019-01-01', 'أجار', NULL),
(3, 'حسن', 'حجار', 987625678, '2019-01-01', 'شراء', NULL),
(4, 'كمال', 'حمدي', 937628718, '2019-01-01', 'رهن', NULL),
(5, 'سامر', 'علي', 937628718, '2019-01-01', 'أجار', NULL),
(6, 'بيان', 'مسلاتي', 398272626, '2019-01-01', 'شراء', NULL),
(7, 'ربا', 'سطو', 987656778, '2019-01-01', 'أجار', NULL),
(8, 'هديل', 'الجاسم', 398272626, '2019-01-01', 'شراء', NULL),
(9, 'علي', 'العلي', 937638276, '2019-01-01', 'أجار', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `estate`
--

CREATE TABLE `estate` (
  `Id` int(11) NOT NULL,
  `EStateName` varchar(15) NOT NULL,
  `EStateNumber` int(11) NOT NULL,
  `Space` double NOT NULL,
  `RoomNumber` int(11) NOT NULL,
  `Flour` enum('-3','-2','-1','0','1','2','3','4','5') DEFAULT '0',
  `Direction` set('شرقي','جنوبي','شمالي','غربي') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `InvestType` enum('رهن','أجار','بيع') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Price` double NOT NULL,
  `RegistrationDate` date NOT NULL,
  `NeighborhoodId` int(11) NOT NULL,
  `Latitude` varchar(20) NOT NULL,
  `Longitude` varchar(20) NOT NULL,
  `Description` text NOT NULL,
  `Views` int(11) NOT NULL,
  `DeletedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `estate`
--

INSERT INTO `estate` (`Id`, `EStateName`, `EStateNumber`, `Space`, `RoomNumber`, `Flour`, `Direction`, `InvestType`, `Price`, `RegistrationDate`, `NeighborhoodId`, `Latitude`, `Longitude`, `Description`, `Views`, `DeletedAt`) VALUES
(1, 'شقة', 111, 100, 2, '1', 'شمالي', 'رهن', 100000, '2019-01-01', 2, '', '', 'جديد', 0, NULL),
(2, 'بيت عربي', 112, 200, 3, '0', '', 'أجار', 2000000, '2019-01-01', 3, '', '', 'جديد', 0, NULL),
(3, 'محل', 113, 10, 1, '0', 'جنوبي', 'أجار', 10000000, '2019-01-01', 5, '', '', 'محل جيد', 0, NULL),
(4, 'أرض', 114, 300, 0, '0', 'شمالي', 'بيع', 1000000, '2019-01-02', 8, '', '', 'أرض خصبة', 0, NULL),
(5, 'معمل', 115, 500, 15, '0', 'جنوبي', 'بيع', 40000000, '2019-02-05', 4, '', '', 'معمل حنطة', 0, NULL),
(6, 'فرن', 116, 100, 3, '0', 'شمالي', 'رهن', 400000000, '2019-04-05', 5, '', '', 'فرن زاسع', 0, NULL),
(7, 'غرفة', 117, 5, 1, '2', 'شمالي', 'أجار', 15000, '2019-05-06', 8, '', '', 'غرفة مفروشة', 0, NULL),
(8, 'مزرعة', 118, 500, 0, '0', 'جنوبي', 'رهن', 40000000000, '2019-06-06', 1, '', '', 'مزرعة تفاح', 0, NULL),
(9, 'شركة', 119, 900, 25, '1', 'شمالي', 'أجار', 2000000000, '2019-01-01', 2, '', '', 'شركة تجارية', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `estate_customer`
--

CREATE TABLE `estate_customer` (
  `Id` int(11) NOT NULL,
  `EstateId` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `DeletedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `estate_customer`
--

INSERT INTO `estate_customer` (`Id`, `EstateId`, `CustomerId`, `StartDate`, `EndDate`, `DeletedAt`) VALUES
(1, 9, 1, '2019-02-03', '2019-02-03', NULL),
(2, 2, 3, '2019-02-03', '2019-02-07', NULL),
(3, 4, 2, '2019-04-05', '2019-04-05', NULL),
(4, 5, 5, '2019-02-06', '2019-02-06', NULL),
(5, 6, 4, '2019-04-06', '2019-04-06', NULL),
(6, 9, 7, '2019-01-03', '2019-01-10', NULL),
(7, 7, 9, '2019-05-10', '2019-05-10', NULL),
(8, 1, 8, '2019-01-03', '2019-01-03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `estate_owner`
--

CREATE TABLE `estate_owner` (
  `Id` int(11) NOT NULL,
  `EstateId` int(11) NOT NULL,
  `OwnerId` int(11) NOT NULL,
  `OwnerShipDate` date NOT NULL,
  `OwnerShipPhoto` varchar(300) NOT NULL,
  `DeletedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `estate_owner`
--

INSERT INTO `estate_owner` (`Id`, `EstateId`, `OwnerId`, `OwnerShipDate`, `OwnerShipPhoto`, `DeletedAt`) VALUES
(1, 2, 1, '2019-12-10', 'qqqqqqqqqqqqq', NULL),
(2, 2, 2, '2019-12-10', 'dddddddddddddddd', NULL),
(3, 9, 6, '2019-12-16', 'gggggggggggggggggggggg', NULL),
(4, 3, 11, '2019-12-11', 'kkkkkkkkkkkkkkkkkk', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `estate_service`
--

CREATE TABLE `estate_service` (
  `Id` int(11) NOT NULL,
  `EstateId` int(11) NOT NULL,
  `ServiceId` int(11) NOT NULL,
  `IsAvailable` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `estate_service`
--

INSERT INTO `estate_service` (`Id`, `EstateId`, `ServiceId`, `IsAvailable`) VALUES
(1, 2, 6, 1),
(2, 8, 1, 1),
(3, 8, 5, 1),
(4, 1, 2, 1),
(5, 5, 2, 1),
(6, 3, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `Id` int(11) NOT NULL,
  `EStateId` int(11) NOT NULL,
  `ContentType` varchar(7) NOT NULL,
  `Path` varchar(150) NOT NULL,
  `DeletedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`Id`, `EStateId`, `ContentType`, `Path`, `DeletedAt`) VALUES
(1, 1, 'jpg', 'vvvvvvvvvvvvvvvvvv', NULL),
(2, 3, 'jpg', 'jgfjfyf', NULL),
(3, 4, 'jpg', 'jgfjfyf', NULL),
(4, 5, 'jpg', 'jgfjfyf', NULL),
(5, 6, 'jpg', 'jgfjfyf', NULL),
(6, 7, 'jpg', 'jgfjfyf', NULL),
(7, 8, 'jpg', 'vvvvvvvvvvvvvvvvvv', NULL),
(8, 9, 'jpg', 'vvvvvvvvvvvvvvvvvv', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `neighborhood`
--

CREATE TABLE `neighborhood` (
  `Id` int(11) NOT NULL,
  `CityId` int(11) NOT NULL,
  `NeighborhoodName` varchar(15) NOT NULL,
  `Description` text NOT NULL,
  `DeletedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `neighborhood`
--

INSERT INTO `neighborhood` (`Id`, `CityId`, `NeighborhoodName`, `Description`, `DeletedAt`) VALUES
(1, 1, 'jamelia', 'new', NULL),
(2, 1, 'newalepp', 'new', NULL),
(3, 1, 'feed', 'new', NULL),
(4, 1, 'esmaeeli', 'new', NULL),
(5, 1, 'shahba', 'new', NULL),
(6, 1, 'seefadwla', 'new', NULL),
(7, 1, 'hamra', 'new', NULL),
(8, 1, 'adonees', 'dd', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `Id` int(11) NOT NULL,
  `First_Name` varchar(15) NOT NULL,
  `Last_Name` varchar(15) NOT NULL,
  `Phone` bigint(12) NOT NULL,
  `Registration_Date` date NOT NULL,
  `DeletedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`Id`, `First_Name`, `Last_Name`, `Phone`, `Registration_Date`, `DeletedAt`) VALUES
(1, 'احمد', 'العلي', 998543346, '2019-01-01', NULL),
(2, 'خالد', 'المزة', 987625678, '2019-01-01', NULL),
(3, 'عمر', 'الاحمدي', 937628718, '2019-01-01', NULL),
(4, 'كريم', 'ساروني', 398272626, '2019-01-01', NULL),
(5, 'كريم', 'دادا', 937638276, '2019-01-01', NULL),
(6, 'عماد', 'سبسبي', 388276154, '2019-01-01', NULL),
(7, 'يزن', 'هسروني', 987653332, '2019-01-01', NULL),
(8, 'سبال', 'الجاسم', 9487876543, '2019-01-01', NULL),
(9, 'كارلا', 'احمد', 836789465, '2019-01-01', NULL),
(10, 'يارا', 'علي', 765432876, '2019-01-01', NULL),
(11, 'سارة', 'ادريس', 876543217, '2019-01-01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `Id` int(11) NOT NULL,
  `EstateId` int(11) NOT NULL,
  `First_Name` varchar(15) NOT NULL,
  `Last_Name` varchar(15) NOT NULL,
  `Rate` enum('0','1','2','3','4','5') DEFAULT '0',
  `Comment` varchar(50) NOT NULL,
  `DeletedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`Id`, `EstateId`, `First_Name`, `Last_Name`, `Rate`, `Comment`, `DeletedAt`) VALUES
(1, 1, 'أحمد', 'علي', '0', 'جيد', NULL),
(2, 2, 'خالد', 'ملا', '1', 'جيد جدا', NULL),
(3, 1, 'سامر', 'علي', '2', 'جيد جدا', NULL),
(4, 3, 'ناصر', 'جاسم', '3', 'ممتاز', NULL),
(5, 1, 'كريم', 'خالد', '4', 'جميل', NULL),
(6, 9, 'سامر', 'علي', '3', 'جيد جدا', NULL),
(7, 2, 'رفعة', 'الجاسم', '1', 'جيد', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `Id` int(11) NOT NULL,
  `ServiceName` varchar(50) NOT NULL,
  `DeletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`Id`, `ServiceName`, `DeletedAt`) VALUES
(1, 'ماء', NULL),
(2, 'كهرباء', NULL),
(3, 'مدارس', NULL),
(4, 'حدائق', NULL),
(5, 'أفران', NULL),
(6, 'مصانع', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`Id`) USING BTREE,
  ADD KEY `CountryId` (`CountryId`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `estate`
--
ALTER TABLE `estate`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `NeighborhoodId` (`NeighborhoodId`);

--
-- Indexes for table `estate_customer`
--
ALTER TABLE `estate_customer`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `EstateId` (`EstateId`),
  ADD KEY `CustomerId` (`CustomerId`);

--
-- Indexes for table `estate_owner`
--
ALTER TABLE `estate_owner`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `EstateId` (`EstateId`),
  ADD KEY `OwnerId` (`OwnerId`);

--
-- Indexes for table `estate_service`
--
ALTER TABLE `estate_service`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `EstateId` (`EstateId`),
  ADD KEY `ServiceId` (`ServiceId`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `EStateId` (`EStateId`);

--
-- Indexes for table `neighborhood`
--
ALTER TABLE `neighborhood`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `CityId` (`CityId`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `EstateId` (`EstateId`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `estate`
--
ALTER TABLE `estate`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `estate_customer`
--
ALTER TABLE `estate_customer`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `estate_owner`
--
ALTER TABLE `estate_owner`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `estate_service`
--
ALTER TABLE `estate_service`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `neighborhood`
--
ALTER TABLE `neighborhood`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`CountryId`) REFERENCES `country` (`Id`);

--
-- Constraints for table `estate`
--
ALTER TABLE `estate`
  ADD CONSTRAINT `estate_ibfk_2` FOREIGN KEY (`NeighborhoodId`) REFERENCES `neighborhood` (`Id`);

--
-- Constraints for table `estate_customer`
--
ALTER TABLE `estate_customer`
  ADD CONSTRAINT `estate_customer_ibfk_1` FOREIGN KEY (`EstateId`) REFERENCES `estate` (`Id`),
  ADD CONSTRAINT `estate_customer_ibfk_2` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`Id`);

--
-- Constraints for table `estate_owner`
--
ALTER TABLE `estate_owner`
  ADD CONSTRAINT `estate_owner_ibfk_1` FOREIGN KEY (`EstateId`) REFERENCES `estate` (`Id`),
  ADD CONSTRAINT `estate_owner_ibfk_2` FOREIGN KEY (`OwnerId`) REFERENCES `owner` (`Id`);

--
-- Constraints for table `estate_service`
--
ALTER TABLE `estate_service`
  ADD CONSTRAINT `estate_service_ibfk_1` FOREIGN KEY (`EstateId`) REFERENCES `estate` (`Id`),
  ADD CONSTRAINT `estate_service_ibfk_2` FOREIGN KEY (`ServiceId`) REFERENCES `service` (`Id`);

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`EStateId`) REFERENCES `estate` (`Id`);

--
-- Constraints for table `neighborhood`
--
ALTER TABLE `neighborhood`
  ADD CONSTRAINT `neighborhood_ibfk_1` FOREIGN KEY (`CityId`) REFERENCES `city` (`Id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`EstateId`) REFERENCES `estate` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
