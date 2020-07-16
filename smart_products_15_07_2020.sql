-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2020 at 08:21 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smart_grocery`
--

-- --------------------------------------------------------

--
-- Table structure for table `smart_products`
--

CREATE TABLE `smart_products` (
  `ProductId` int(11) NOT NULL,
  `ProductName` varchar(40) NOT NULL,
  `Category` int(3) NOT NULL,
  `Unit` int(3) NOT NULL,
  `Price` int(11) NOT NULL,
  `SalePrice` int(11) NOT NULL,
  `Status` bit(1) NOT NULL DEFAULT b'1',
  `ProductImg` varchar(70) NOT NULL,
  `CreatedOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifiedOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IsFeatured` bit(1) NOT NULL DEFAULT b'0',
  `IsHot` bit(1) NOT NULL DEFAULT b'0',
  `Brand` int(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `smart_products`
--

INSERT INTO `smart_products` (`ProductId`, `ProductName`, `Category`, `Unit`, `Price`, `SalePrice`, `Status`, `ProductImg`, `CreatedOn`, `ModifiedOn`, `IsFeatured`, `IsHot`, `Brand`) VALUES
(1, 'Banana', 8, 1, 60, 55, b'1', 'assets/img/products/banana.png', '2020-07-14 00:00:00', '2020-07-14 00:00:00', b'1', b'0', 1),
(2, 'Cauliflower', 7, 1, 35, 35, b'1', 'assets/img/products/cauliflower.png', '2020-07-14 21:29:05', '2020-07-14 21:29:05', b'0', b'0', 1),
(3, 'Orange', 8, 1, 200, 150, b'1', 'assets/img/products/orange.png', '2020-07-14 21:30:04', '2020-07-14 21:30:04', b'1', b'0', 1),
(4, 'Potato', 7, 1, 30, 30, b'0', 'assets/img/products/potato.png', '2020-07-14 21:31:03', '2020-07-14 21:31:03', b'1', b'0', 1),
(5, 'Tomato', 7, 1, 56, 45, b'1', 'assets/img/products/Tomato.png', '2020-07-14 21:31:52', '2020-07-14 21:31:52', b'1', b'0', 1),
(6, 'Grapes', 8, 1, 400, 400, b'1', 'assets/img/products/grapes.png', '2020-07-14 23:21:22', '2020-07-14 23:21:22', b'1', b'0', 1),
(7, 'Apple', 8, 1, 250, 200, b'1', 'assets/img/products/apple.jpg', '2020-07-14 23:22:12', '2020-07-14 23:22:12', b'1', b'0', 1),
(8, 'Onion', 7, 1, 50, 50, b'1', 'assets/img/products/onion.jpg', '2020-07-14 23:44:31', '2020-07-14 23:44:31', b'0', b'0', 1),
(9, 'Carrot', 7, 1, 40, 40, b'1', 'assets/img/products/carrot.jpg', '2020-07-15 12:04:35', '2020-07-15 15:04:35', b'1', b'0', 1),
(10, 'Ginger', 7, 1, 80, 70, b'1', 'assets/img/products/ginger.png', '2020-07-15 12:38:57', '2020-07-15 15:38:57', b'1', b'0', 1),
(11, 'Cucumber', 7, 1, 80, 70, b'1', 'assets/img/product/cucumber.jpg', '2020-07-15 12:39:58', '2020-07-15 15:39:58', b'0', b'0', 1),
(12, 'Garlic', 7, 1, 200, 180, b'1', 'assets/img/products/garlic.png', '2020-07-15 12:46:31', '2020-07-15 15:46:31', b'1', b'0', 1),
(14, 'Pea', 7, 1, 220, 210, b'1', 'assets/img/products/pea.png', '2020-07-15 12:47:57', '2020-07-15 15:47:57', b'1', b'0', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `smart_products`
--
ALTER TABLE `smart_products`
  ADD PRIMARY KEY (`ProductId`),
  ADD KEY `FK_ProductCategory_GroceryCategoryId` (`Category`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `smart_products`
--
ALTER TABLE `smart_products`
  MODIFY `ProductId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `smart_products`
--
ALTER TABLE `smart_products`
  ADD CONSTRAINT `FK_ProductCategory_GroceryCategoryId` FOREIGN KEY (`Category`) REFERENCES `grocery_category` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
