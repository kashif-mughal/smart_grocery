-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 01, 2020 at 03:57 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Table structure for table `company_information`
--

CREATE TABLE `company_information` (
  `company_id` varchar(250) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `website` varchar(50) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company_information`
--

INSERT INTO `company_information` (`company_id`, `company_name`, `email`, `address`, `mobile`, `website`, `status`) VALUES
('1', 'Grocery', 'grocery@grocer.com', 'Karachi Pakistan', '03451234567', 'https://www.grocery.com/', 1);

-- --------------------------------------------------------

--
-- Table structure for table `grocery_assistant`
--

CREATE TABLE `grocery_assistant` (
  `AssistantId` int(11) NOT NULL,
  `ProductId` int(11) NOT NULL,
  `CreatedOn` date NOT NULL,
  `ModifiedOn` date NOT NULL DEFAULT current_timestamp(),
  `Status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grocery_assistant`
--

INSERT INTO `grocery_assistant` (`AssistantId`, `ProductId`, `CreatedOn`, `ModifiedOn`, `Status`) VALUES
(1, 6, '2020-07-30', '2020-07-30', 0),
(2, 7, '2020-07-30', '2020-07-30', 0),
(3, 1, '2020-07-30', '2020-07-30', 0),
(4, 6, '2020-07-31', '2020-07-31', 0),
(5, 10, '2020-07-31', '2020-07-31', 0),
(6, 16, '2020-07-31', '2020-07-31', 1),
(7, 5, '2020-07-31', '2020-07-31', 1),
(8, 10, '2020-08-04', '2020-08-04', 1),
(9, 2, '2020-08-04', '2020-08-04', 1),
(10, 16, '2020-08-04', '2020-08-04', 1),
(11, 3, '2020-08-04', '2020-08-04', 1),
(12, 1, '2020-08-04', '2020-08-04', 1),
(13, 7, '2020-08-10', '2020-08-11', 1),
(14, 1, '2020-08-10', '2020-08-11', 1),
(15, 11, '2020-08-10', '2020-08-11', 1),
(16, 2, '2020-08-10', '2020-08-11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `grocery_brand`
--

CREATE TABLE `grocery_brand` (
  `BrandId` int(11) NOT NULL,
  `BrandName` varchar(30) NOT NULL,
  `Alias` varchar(30) NOT NULL,
  `Img` varchar(70) NOT NULL DEFAULT 'img/brand/default.jpg	',
  `CreatedOn` datetime NOT NULL,
  `ModifiedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `Status` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grocery_brand`
--

INSERT INTO `grocery_brand` (`BrandId`, `BrandName`, `Alias`, `Img`, `CreatedOn`, `ModifiedOn`, `Status`) VALUES
(2, 'Nagori', 'Nagori', 'assets/img/brand/c2ec00c7d3f2513bf045b03e7bb0d2a4.png', '2020-07-15 11:10:00', '2020-07-15 02:10:00', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `grocery_category`
--

CREATE TABLE `grocery_category` (
  `CategoryId` int(11) NOT NULL,
  `CatName` varchar(50) NOT NULL,
  `Alias` varchar(50) DEFAULT NULL,
  `Img` varchar(70) NOT NULL DEFAULT 'img/category/default.jpg',
  `ParentId` int(11) NOT NULL DEFAULT 0,
  `CreatedOn` datetime DEFAULT NULL,
  `ModifiedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `Status` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grocery_category`
--

INSERT INTO `grocery_category` (`CategoryId`, `CatName`, `Alias`, `Img`, `ParentId`, `CreatedOn`, `ModifiedOn`, `Status`) VALUES
(6, 'Fruits & Vegetables', 'Fresh Fruits and Vegetables', 'assets/img/product.png', 0, '2020-07-13 10:41:12', '2020-07-13 01:41:12', b'1'),
(7, 'Fresh Vegetables', 'Fresh Vegetables', 'assets/img/category/a18cd787626ba579b25dc6e09aae5b20.jpg', 6, '2020-07-13 10:42:38', '2020-07-13 01:42:38', b'1'),
(8, 'Fresh Fruits', 'Fresh Fruits', 'assets/img/category/00a66dc411d3ab95259d0c2d85ee6991.jpg', 6, '2020-07-13 10:43:11', '2020-07-13 01:43:11', b'1'),
(9, 'Snacks & BreakFast', 'Snacks & BreakFast', 'assets/img/product.png', 0, '2020-07-13 10:43:59', '2020-07-13 01:43:59', b'1'),
(10, 'Chips', 'Chips', 'assets/img/category/8d4be779a210886e3f2a46138dc84677.jpg', 9, '2020-07-13 10:44:30', '2020-07-13 01:44:30', b'1'),
(11, 'Biscuits', 'Biscuits', 'assets/img/category/6cfdc904f73383eb352970235d3faafc.jpg', 9, '2020-07-13 10:44:58', '2020-07-13 01:44:58', b'1'),
(12, 'EDIBLES', 'EDIBLES', 'assets/img/product.png', 0, '2020-07-13 10:45:27', '2020-07-13 01:45:27', b'1'),
(13, 'Atta (Flour)', 'Atta & Flour', 'assets/img/category/868f874b0059a140826161b8a60fe0c2.jpg', 12, '2020-07-13 10:46:11', '2020-07-13 01:46:11', b'1'),
(14, 'Cooking Oil', 'Cooking Oil', 'assets/img/category/43f2a5fd549a616fae43d48345ca2a94.jpg', 12, '2020-07-13 10:46:34', '2020-07-13 01:46:34', b'1'),
(20, 'Fresh Fruits2', 'Fresh Fruits2', 'assets/img/product.png', 6, '2020-07-18 18:45:10', '2020-07-18 21:45:10', b'0'),
(21, 'Fresh Vegetables2', 'Fresh Vegetables2', 'assets/img/product.png', 6, '2020-07-18 18:45:26', '2020-07-18 21:45:26', b'0'),
(22, 'Farm Vegetables', 'Farm Vegetables', 'assets/img/product.png', 7, '2020-08-03 08:13:58', '2020-08-03 11:13:58', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `grocery_order`
--

CREATE TABLE `grocery_order` (
  `OrderId` int(11) NOT NULL,
  `CustomerId` varchar(50) NOT NULL,
  `OrderValue` int(11) NOT NULL,
  `Hash` varchar(42) NOT NULL,
  `DeliveryDate` date NOT NULL,
  `DeliveryFrom` datetime NOT NULL,
  `DeliveryUpto` datetime NOT NULL,
  `DeliveryAddress` int(11) NOT NULL,
  `OrderStep` int(11) NOT NULL DEFAULT 1,
  `PreviousOrderStep` int(11) NOT NULL DEFAULT 1,
  `CreatedOn` datetime NOT NULL,
  `ModifiedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `Status` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grocery_order`
--

INSERT INTO `grocery_order` (`OrderId`, `CustomerId`, `OrderValue`, `Hash`, `DeliveryDate`, `DeliveryFrom`, `DeliveryUpto`, `DeliveryAddress`, `OrderStep`, `PreviousOrderStep`, `CreatedOn`, `ModifiedOn`, `Status`) VALUES
(7, '1', 375, '2831b4f50b42502790a0f6d18c8254ab991c7cbd', '2020-08-06', '2020-08-06 17:16:26', '2020-08-06 17:16:26', 1, 1, 1, '2020-07-21 15:48:32', '2020-07-21 18:48:32', b'0'),
(8, '1', 110, '8a021a1904e46b8bca5f504108a89e902d452404', '2020-08-06', '2020-08-06 17:16:26', '2020-08-06 17:16:26', 1, 1, 1, '2020-07-21 16:00:26', '2020-07-21 19:00:26', b'1'),
(9, '1', 180, '4258cbcc07d06841f0b70271bfc15753bae4baa2', '2020-08-06', '2020-08-06 17:16:26', '2020-08-06 17:16:26', 1, 1, 1, '2020-07-27 13:00:13', '2020-07-27 16:00:13', b'1'),
(10, '1', 140, '4271160ac2cf3c92b28ace99baf975dad742126e', '2020-08-06', '2020-08-06 17:16:26', '2020-08-06 17:16:26', 1, 1, 1, '2020-07-28 13:41:38', '2020-07-28 16:41:38', b'1'),
(11, '1', 1200, 'c28f8cf65c5c35c90f29623821b37da4223a572c', '2020-08-06', '2020-08-06 17:16:26', '2020-08-06 17:16:26', 1, 1, 1, '2020-07-28 14:05:49', '2020-07-28 17:05:49', b'0'),
(12, '1', 1410, '5d353480d2c6f6fc83baa8118b6b10c034343dc6', '2020-08-06', '2020-08-06 17:16:26', '2020-08-06 17:16:26', 1, 1, 1, '2020-07-28 14:20:48', '2020-07-28 17:20:48', b'1'),
(13, '1', 360, '631f337a6a0394746e42b4cf9f4a331e458c88c1', '2020-08-06', '2020-08-06 17:16:26', '2020-08-06 17:16:26', 1, 1, 1, '2020-07-28 14:21:59', '2020-07-28 17:21:59', b'1'),
(17, '1', 1200, 'da0b3d37fb35ec432c69462a43d19bfd5081b0bb', '2020-08-06', '2020-08-06 17:16:26', '2020-08-06 17:16:26', 1, 1, 1, '2020-07-29 09:57:55', '2020-07-29 12:57:55', b'1'),
(18, '1', 360, 'c0f90fda2837f0acd65ed0ed058e0c4eda2b9b21', '2020-08-06', '2020-08-06 17:16:26', '2020-08-06 17:16:26', 1, 1, 1, '2020-07-29 10:01:14', '2020-07-29 13:01:14', b'1'),
(19, '1', 290, 'c12c1b2529e1e44887f2984c165c2dc5fc0b2d91', '2020-08-06', '2020-08-06 17:16:26', '2020-08-06 17:16:26', 1, 1, 1, '2020-07-29 10:24:39', '2020-07-29 13:24:39', b'1'),
(20, '1', 155, '26ac832280e2821b2f62c9136557e95043f2463c', '2020-08-06', '2020-08-06 17:16:26', '2020-08-06 17:16:26', 1, 1, 1, '2020-07-30 15:37:26', '2020-07-30 18:37:26', b'1'),
(21, '1', 92, '3f24da7888784de88647520497221635d19673e9', '2020-08-06', '2020-08-06 17:16:26', '2020-08-06 17:16:26', 1, 1, 1, '2020-08-05 11:59:30', '2020-08-05 14:59:30', b'1'),
(22, '1', 184, '9799b0f441aeb9fdac44957a6ef32f89dee7b051', '2020-08-06', '2020-08-06 17:16:26', '2020-08-06 17:16:26', 1, 1, 1, '2020-08-05 12:02:55', '2020-08-05 15:02:55', b'1'),
(23, '1', 155, '26ac832280e2821b2f62c9136557e95043f2463c', '2020-08-06', '2020-08-06 17:16:26', '2020-08-06 17:16:26', 1, 1, 1, '2020-08-05 12:13:22', '2020-08-05 15:13:22', b'1'),
(24, '1', 155, '26ac832280e2821b2f62c9136557e95043f2463c', '2020-08-06', '2020-08-06 17:16:26', '2020-08-06 17:16:26', 1, 1, 1, '2020-08-05 12:14:01', '2020-08-05 15:14:01', b'1'),
(25, '1', 155, '26ac832280e2821b2f62c9136557e95043f2463c', '2020-08-06', '2020-08-06 17:16:26', '2020-08-06 17:16:26', 1, 1, 1, '2020-08-05 12:18:45', '2020-08-05 15:18:45', b'1'),
(26, '1', 460, '572a52155fd93362939e5889ddfbbb3f8b6eb351', '2020-08-06', '2020-08-06 17:16:26', '2020-08-06 17:16:26', 1, 1, 1, '2020-08-05 14:11:37', '2020-08-05 17:11:37', b'1'),
(27, '1', 2114, '8bfd41d60a5c966d1ff585a0d7e5b7970ec6d1ea', '2020-08-08', '2020-08-08 10:08:00', '2020-08-08 07:08:00', 1, 5, 1, '2020-08-06 14:23:42', '2020-08-06 17:23:42', b'1'),
(28, '1', 55, 'f51c639eb27257fff60094ad6b2406ae1da73ff9', '2020-08-09', '2020-08-09 10:00:00', '2020-08-09 07:00:00', 1, 3, 7, '2020-08-06 14:31:42', '2020-08-06 17:31:42', b'1'),
(30, '0aa31209685b637af3ee', 1000, '55a429579b14add3aced548b2cbe90e371cca2f7', '2020-08-08', '2020-08-08 10:00:00', '2020-08-08 19:00:00', 15, 1, 1, '2020-08-07 18:48:38', '2020-08-07 21:48:38', b'0'),
(31, '4d50106bfd5ab578634e', 70, '421ddf356b9dbe8f272099e33fce79332fb21233', '2020-08-07', '2020-08-07 10:00:00', '2020-08-07 19:00:00', 16, 7, 3, '2020-08-07 18:59:28', '2020-08-07 21:59:28', b'0'),
(32, '0aa31209685b637af3ee', 35, '6b70368050b5b4713095293c7c5940093e09b92f', '2020-08-11', '2020-08-11 10:00:00', '2020-08-11 19:00:00', 15, 1, 1, '2020-08-10 20:47:29', '2020-08-10 23:47:29', b'1'),
(33, '4d50106bfd5ab578634e', 165, '9fdf4b0f649c7c00a9f7517fbdaeffe9fd296ab8', '2020-09-01', '2020-09-01 10:00:00', '2020-09-01 19:00:00', 16, 1, 1, '2020-09-01 10:09:10', '2020-09-01 13:09:10', b'1'),
(34, '4d50106bfd5ab578634e', 708, '0a23f787061ec65df603d69764a420c75d3b8c6b', '2020-09-01', '2020-09-01 10:00:00', '2020-09-01 19:00:00', 16, 1, 1, '2020-09-01 12:33:22', '2020-09-01 15:33:22', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `grocery_order_detail`
--

CREATE TABLE `grocery_order_detail` (
  `OrderDetailId` int(11) NOT NULL,
  `OrderId` int(11) NOT NULL,
  `ItemId` int(11) NOT NULL,
  `ItemQuantity` int(11) NOT NULL,
  `SoldPrice` int(11) NOT NULL,
  `Status` bit(1) NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `ModifiedOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grocery_order_detail`
--

INSERT INTO `grocery_order_detail` (`OrderDetailId`, `OrderId`, `ItemId`, `ItemQuantity`, `SoldPrice`, `Status`, `CreatedOn`, `ModifiedOn`) VALUES
(10, 7, 10, 3, 70, b'1', '2020-07-21 15:48:32', '2020-07-21 18:48:32'),
(11, 7, 16, 3, 55, b'1', '2020-07-21 15:48:32', '2020-07-21 18:48:32'),
(12, 8, 16, 2, 55, b'1', '2020-07-21 16:00:26', '2020-07-21 19:00:26'),
(66, 9, 16, 2, 55, b'1', '2020-07-27 13:00:13', '2020-07-27 16:00:13'),
(67, 9, 10, 1, 70, b'1', '2020-07-27 13:00:13', '2020-07-27 16:00:14'),
(68, 0, 10, 2, 70, b'1', '2020-07-27 13:36:02', '2020-07-27 16:36:02'),
(69, 0, 10, 2, 70, b'1', '2020-07-27 13:40:04', '2020-07-27 16:40:04'),
(70, 0, 10, 2, 70, b'1', '2020-07-27 13:48:29', '2020-07-27 16:48:29'),
(71, 0, 10, 2, 70, b'1', '2020-07-27 13:59:00', '2020-07-27 16:59:00'),
(72, 0, 10, 2, 70, b'1', '2020-07-27 14:24:01', '2020-07-27 17:24:01'),
(73, 0, 10, 2, 70, b'1', '2020-07-28 13:41:27', '2020-07-28 16:41:27'),
(74, 10, 10, 2, 70, b'1', '2020-07-28 13:41:38', '2020-07-28 16:41:38'),
(75, 11, 7, 2, 200, b'1', '2020-07-28 14:05:49', '2020-07-28 17:05:49'),
(76, 11, 6, 2, 400, b'1', '2020-07-28 14:05:49', '2020-07-28 17:05:49'),
(77, 12, 7, 2, 200, b'1', '2020-07-28 14:20:48', '2020-07-28 17:20:48'),
(78, 12, 6, 2, 400, b'1', '2020-07-28 14:20:48', '2020-07-28 17:20:48'),
(79, 12, 10, 3, 70, b'1', '2020-07-28 14:20:48', '2020-07-28 17:20:48'),
(80, 13, 16, 4, 55, b'1', '2020-07-28 14:21:59', '2020-07-28 17:21:59'),
(81, 13, 10, 2, 70, b'1', '2020-07-28 14:21:59', '2020-07-28 17:21:59'),
(82, 14, 6, 2, 400, b'1', '2020-07-28 16:52:25', '2020-07-28 19:52:25'),
(83, 15, 6, 3, 400, b'1', '2020-07-28 16:54:22', '2020-07-28 19:54:22'),
(84, 16, 6, 4, 400, b'1', '2020-07-28 17:11:06', '2020-07-28 20:11:06'),
(85, 16, 7, 2, 200, b'1', '2020-07-28 17:11:06', '2020-07-28 20:11:06'),
(86, 16, 10, 2, 70, b'1', '2020-07-28 17:11:06', '2020-07-28 20:11:06'),
(87, 0, 6, 3, 400, b'1', '2020-07-29 09:57:48', '2020-07-29 12:57:48'),
(88, 17, 6, 3, 400, b'1', '2020-07-29 09:57:55', '2020-07-29 12:57:55'),
(89, 18, 10, 2, 70, b'1', '2020-07-29 10:01:14', '2020-07-29 13:01:14'),
(90, 18, 16, 4, 55, b'1', '2020-07-29 10:01:14', '2020-07-29 13:01:14'),
(91, 19, 16, 4, 55, b'1', '2020-07-29 10:24:39', '2020-07-29 13:24:39'),
(92, 19, 10, 1, 70, b'1', '2020-07-29 10:24:39', '2020-07-29 13:24:39'),
(93, 20, 8, 1, 50, b'1', '2020-07-30 15:37:26', '2020-07-30 18:37:26'),
(94, 20, 2, 3, 35, b'1', '2020-07-30 15:37:26', '2020-07-30 18:37:26'),
(95, 21, 17, 1, 92, b'1', '2020-08-05 11:59:30', '2020-08-05 14:59:30'),
(96, 22, 17, 2, 92, b'1', '2020-08-05 12:02:55', '2020-08-05 15:02:55'),
(97, 23, 8, 1, 50, b'1', '2020-08-05 12:13:22', '2020-08-05 15:13:22'),
(98, 23, 2, 3, 35, b'1', '2020-08-05 12:13:22', '2020-08-05 15:13:22'),
(99, 24, 8, 1, 50, b'1', '2020-08-05 12:14:01', '2020-08-05 15:14:01'),
(100, 24, 2, 3, 35, b'1', '2020-08-05 12:14:01', '2020-08-05 15:14:01'),
(101, 25, 8, 1, 50, b'1', '2020-08-05 12:18:45', '2020-08-05 15:18:45'),
(102, 25, 2, 3, 35, b'1', '2020-08-05 12:18:45', '2020-08-05 15:18:45'),
(103, 26, 17, 5, 92, b'1', '2020-08-05 14:11:37', '2020-08-05 17:11:37'),
(104, 27, 7, 4, 200, b'1', '2020-08-06 14:23:43', '2020-08-06 17:23:43'),
(105, 27, 17, 2, 92, b'1', '2020-08-06 14:23:43', '2020-08-06 17:23:43'),
(106, 27, 10, 1, 70, b'1', '2020-08-06 14:23:43', '2020-08-06 17:23:43'),
(107, 27, 8, 2, 50, b'1', '2020-08-06 14:23:43', '2020-08-06 17:23:43'),
(108, 27, 6, 2, 400, b'1', '2020-08-06 14:23:43', '2020-08-06 17:23:43'),
(109, 27, 5, 2, 45, b'1', '2020-08-06 14:23:43', '2020-08-06 17:23:43'),
(110, 27, 2, 2, 35, b'1', '2020-08-06 14:23:43', '2020-08-06 17:23:43'),
(111, 28, 16, 1, 55, b'1', '2020-08-06 14:31:42', '2020-08-06 17:31:42'),
(112, 29, 2, 2, 35, b'1', '2020-08-07 18:29:40', '2020-08-07 21:29:40'),
(113, 29, 7, 4, 200, b'1', '2020-08-07 18:29:40', '2020-08-07 21:29:40'),
(114, 30, 7, 5, 200, b'1', '2020-08-07 18:48:38', '2020-08-07 21:48:38'),
(115, 31, 2, 2, 35, b'1', '2020-08-07 18:59:28', '2020-08-07 21:59:29'),
(116, 32, 2, 1, 35, b'1', '2020-08-10 20:47:29', '2020-08-10 23:47:29'),
(117, 33, 16, 3, 55, b'1', '2020-09-01 10:09:10', '2020-09-01 13:09:10'),
(118, 34, 17, 4, 92, b'1', '2020-09-01 12:33:22', '2020-09-01 15:33:22'),
(119, 34, 10, 2, 70, b'1', '2020-09-01 12:33:22', '2020-09-01 15:33:22'),
(120, 34, 7, 1, 200, b'1', '2020-09-01 12:33:22', '2020-09-01 15:33:22');

-- --------------------------------------------------------

--
-- Table structure for table `grocery_otp`
--

CREATE TABLE `grocery_otp` (
  `otp_id` int(20) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `verified_on` datetime DEFAULT NULL,
  `phone_number` varchar(20) NOT NULL,
  `code` int(4) NOT NULL,
  `expiry_date` datetime NOT NULL,
  `verified` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grocery_otp`
--

INSERT INTO `grocery_otp` (`otp_id`, `created_on`, `verified_on`, `phone_number`, `code`, `expiry_date`, `verified`) VALUES
(1, '2020-08-04 20:36:12', NULL, '03460030581', 9653, '2020-07-28 16:44:49', b'1'),
(2, '2020-08-04 20:36:12', NULL, '03460030582', 4989, '2020-07-27 13:32:44', b'1'),
(3, '2020-08-04 20:36:12', NULL, '03460030583', 8861, '2020-07-28 16:51:29', b'1'),
(4, '2020-08-04 20:36:12', NULL, '03460030584', 4558, '2020-07-28 16:56:03', b'1'),
(5, '2020-08-04 20:36:12', NULL, '03460030586', 9505, '2020-07-28 17:53:16', b'1'),
(6, '2020-08-04 20:36:12', NULL, '03460030587', 7588, '2020-07-28 17:54:27', b'1'),
(7, '2020-08-04 21:29:32', '2020-08-06 19:02:59', '923460030581', 1766, '2020-08-04 18:30:12', b'1'),
(10, '2020-08-04 22:21:17', '2020-08-04 19:21:23', '923460030583', 5798, '2020-08-04 19:21:57', b'1'),
(12, '2020-08-04 23:00:45', '2020-08-04 20:00:53', '923463440293', 6438, '2020-08-04 20:01:25', b'1'),
(13, '2020-08-04 23:02:12', '2020-09-01 12:09:53', '923458113142', 9970, '2020-08-04 20:02:52', b'1'),
(19, '2020-08-05 18:34:49', '2020-08-06 19:02:59', '923460030581', 4193, '2020-08-05 15:35:29', b'1'),
(20, '2020-08-05 18:35:36', '2020-08-06 19:02:59', '923460030581', 6989, '2020-08-05 15:36:16', b'1'),
(21, '2020-08-05 18:56:21', '2020-08-06 19:02:59', '923460030581', 8501, '2020-08-05 15:57:01', b'1'),
(22, '2020-08-05 18:57:43', '2020-08-06 19:02:59', '923460030581', 6844, '2020-08-05 15:58:23', b'1'),
(23, '2020-08-05 18:58:48', '2020-08-06 19:02:59', '923460030581', 1618, '2020-08-05 15:59:28', b'1'),
(24, '2020-08-05 19:00:16', '2020-08-06 19:02:59', '923460030581', 9868, '2020-08-05 16:00:56', b'1'),
(25, '2020-08-05 19:01:23', '2020-08-06 19:02:59', '923460030581', 6960, '2020-08-05 16:02:03', b'1'),
(26, '2020-08-05 19:01:58', '2020-08-06 19:02:59', '923460030581', 4002, '2020-08-05 16:02:38', b'1'),
(27, '2020-08-05 19:10:16', '2020-08-06 19:02:59', '923460030581', 8487, '2020-08-05 16:10:56', b'1'),
(28, '2020-08-05 21:31:19', '2020-08-06 19:02:59', '923460030581', 2756, '2020-08-05 18:31:59', b'1'),
(29, '2020-08-05 21:48:27', '2020-08-06 19:02:59', '923460030581', 4232, '2020-08-05 18:49:07', b'1'),
(30, '2020-08-06 10:26:10', '2020-08-06 19:02:59', '923460030581', 3538, '2020-08-06 07:26:50', b'1'),
(31, '2020-08-06 11:27:48', '2020-08-06 19:02:59', '923460030581', 7304, '2020-08-06 08:28:28', b'1'),
(32, '2020-08-06 11:28:38', '2020-08-06 19:02:59', '923460030581', 4345, '2020-08-06 08:29:18', b'1'),
(33, '2020-08-06 12:13:16', '2020-08-06 19:02:59', '923460030581', 6394, '2020-08-06 09:13:56', b'1'),
(34, '2020-08-06 14:23:37', '2020-08-06 19:02:59', '923460030581', 6812, '2020-08-06 11:24:17', b'1'),
(35, '2020-08-06 20:40:43', '2020-08-06 19:02:59', '923460030581', 7404, '2020-08-06 17:41:23', b'1'),
(36, '2020-08-06 21:30:36', '2020-08-10 21:07:25', '923460030582', 4094, '2020-08-06 18:31:16', b'1'),
(37, '2020-08-06 21:31:48', '2020-08-06 19:02:59', '923460030581', 7015, '2020-08-06 18:32:28', b'1'),
(38, '2020-08-06 22:02:51', '2020-08-06 19:02:59', '923460030581', 2978, '2020-08-06 19:03:31', b'1'),
(39, '2020-08-07 19:47:50', '2020-08-26 13:18:23', '923458118142', 7102, '2020-08-07 16:48:30', b'1'),
(40, '2020-08-07 20:41:29', '2020-08-07 17:41:35', '923460030451', 8951, '2020-08-07 17:42:09', b'1'),
(41, '2020-08-07 21:04:01', '2020-08-10 21:07:25', '923460030582', 8239, '2020-08-07 18:04:41', b'1'),
(42, '2020-08-07 21:58:48', '2020-09-01 12:09:53', '923458113142', 8031, '2020-08-07 18:59:28', b'1'),
(43, '2020-08-07 22:02:42', '2020-09-01 12:09:53', '923458113142', 4245, '2020-08-07 19:03:22', b'1'),
(44, '2020-08-10 14:21:57', '2020-09-01 12:09:53', '923458113142', 8752, '2020-08-10 11:22:37', b'1'),
(45, '2020-08-10 14:22:04', '2020-09-01 12:09:53', '923458113142', 5570, '2020-08-10 11:22:44', b'1'),
(46, '2020-08-10 22:31:25', '2020-08-10 21:07:25', '923460030582', 9053, '2020-08-10 19:32:05', b'1'),
(47, '2020-08-10 22:40:15', '2020-08-10 21:07:25', '923460030582', 3877, '2020-08-10 19:40:55', b'1'),
(48, '2020-08-10 22:41:56', '2020-08-10 21:07:25', '923460030582', 3851, '2020-08-10 19:42:36', b'1'),
(49, '2020-08-10 22:49:24', '2020-08-10 21:07:25', '923460030582', 4699, '2020-08-10 19:50:04', b'1'),
(50, '2020-08-10 22:50:15', '2020-08-10 21:07:25', '923460030582', 6382, '2020-08-10 19:50:55', b'1'),
(51, '2020-08-10 22:53:57', '2020-08-10 21:07:25', '923460030582', 2045, '2020-08-10 19:54:37', b'1'),
(52, '2020-08-10 22:56:10', '2020-08-10 21:07:25', '923460030582', 9287, '2020-08-10 19:56:50', b'1'),
(53, '2020-08-11 00:04:40', '2020-09-01 12:09:53', '923458113142', 7808, '2020-08-10 21:05:20', b'1'),
(54, '2020-08-11 00:07:20', '2020-08-10 21:07:25', '923460030582', 4435, '2020-08-10 21:08:00', b'1'),
(55, '2020-08-26 16:17:32', '2020-08-26 13:17:46', '923460030561', 8197, '2020-08-26 13:18:12', b'1'),
(56, '2020-08-26 16:18:17', '2020-08-26 13:18:23', '923458118142', 5707, '2020-08-26 13:18:57', b'1'),
(57, '2020-08-26 16:18:43', '2020-09-01 12:09:53', '923458113142', 2666, '2020-08-26 13:19:23', b'1'),
(58, '2020-08-26 16:20:01', '2020-08-26 13:20:06', '923458113143', 1397, '2020-08-26 13:20:41', b'1'),
(59, '2020-08-26 17:53:29', '2020-08-26 14:53:34', '923460030584', 7557, '2020-08-26 14:54:09', b'1'),
(60, '2020-08-26 17:53:51', '2020-09-01 12:09:53', '923458113142', 8869, '2020-08-26 14:54:31', b'1'),
(61, '2020-09-01 12:30:49', '2020-09-01 12:09:53', '923458113142', 7633, '2020-09-01 09:31:29', b'1'),
(62, '2020-09-01 15:09:48', '2020-09-01 12:09:53', '923458113142', 3762, '2020-09-01 12:10:28', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `grocery_places`
--

CREATE TABLE `grocery_places` (
  `place_name` varchar(20) NOT NULL,
  `level` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grocery_places`
--

INSERT INTO `grocery_places` (`place_name`, `level`) VALUES
('Pakistan', 0),
('Karachi', 1),
('Lahore', 1),
('Islamabad', 1),
('Peshawar', 1),
('Quetta', 1),
('Faisalabad', 1),
('Rawalpindi', 1),
('Hyderabad', 1),
('Multan', 1),
('Gujranwala', 1);

-- --------------------------------------------------------

--
-- Table structure for table `grocery_products`
--

CREATE TABLE `grocery_products` (
  `ProductId` int(11) NOT NULL,
  `ProductName` varchar(40) NOT NULL,
  `Category` int(3) NOT NULL,
  `Unit` int(3) NOT NULL,
  `UnitId` int(11) NOT NULL DEFAULT 1,
  `OriginalPrice` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `SalePrice` int(11) NOT NULL,
  `Status` bit(1) NOT NULL DEFAULT b'1',
  `ProductImg` varchar(70) NOT NULL,
  `CreatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifiedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `IsFeatured` bit(1) NOT NULL DEFAULT b'0',
  `IsHot` bit(1) NOT NULL DEFAULT b'0',
  `Brand` int(10) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grocery_products`
--

INSERT INTO `grocery_products` (`ProductId`, `ProductName`, `Category`, `Unit`, `UnitId`, `OriginalPrice`, `Price`, `SalePrice`, `Status`, `ProductImg`, `CreatedOn`, `ModifiedOn`, `IsFeatured`, `IsHot`, `Brand`) VALUES
(1, 'Banana', 8, 1, 1, 50, 60, 55, b'1', 'assets/img/products/d160713236ba2f2d94ebd82c500fd051.jpg', '2020-07-14 00:00:00', '2020-07-14 00:00:00', b'1', b'1', 2),
(2, 'Cauliflower', 7, 1, 1, 25, 35, 35, b'1', 'assets/img/products/cauliflower.png', '2020-07-14 21:29:05', '2020-07-14 21:29:05', b'0', b'0', 1),
(3, 'Orange', 8, 1, 1, 190, 200, 150, b'1', 'assets/img/products/orange.png', '2020-07-14 21:30:04', '2020-07-14 21:30:04', b'1', b'0', 1),
(5, 'Tomato', 7, 1, 1, 46, 56, 45, b'1', 'assets/img/products/Tomato.png', '2020-07-14 21:31:52', '2020-07-14 21:31:52', b'1', b'0', 1),
(6, 'Grapes', 8, 1, 1, 390, 400, 400, b'1', 'assets/img/products/grapes.png', '2020-07-14 23:21:22', '2020-07-14 23:21:22', b'1', b'0', 1),
(7, 'Apple', 8, 1, 1, 240, 250, 200, b'1', 'assets/img/products/apple.jpg', '2020-07-14 23:22:12', '2020-07-14 23:22:12', b'1', b'0', 1),
(8, 'Onion', 7, 1, 1, 40, 50, 50, b'1', 'assets/img/products/onion.jpg', '2020-07-14 23:44:31', '2020-07-14 23:44:31', b'0', b'0', 1),
(10, 'Ginger', 7, 1, 1, 70, 80, 70, b'1', 'assets/img/products/ginger.png', '2020-07-15 12:38:57', '2020-07-15 15:38:57', b'1', b'0', 1),
(11, 'Cucumber', 7, 1, 1, 70, 80, 70, b'0', 'assets/img/product/cucumber.jpg', '2020-07-15 12:39:58', '2020-07-15 15:39:58', b'0', b'0', 1),
(16, 'Potato', 7, 1, 1, 42, 50, 55, b'1', 'assets/img/products/2867b5b52ad4b082fae0ee4750924eb5.jpg', '2020-07-16 08:11:55', '2020-08-22 16:34:37', b'1', b'1', 0),
(17, 'Kaddu', 22, 1, 1, 70, 80, 92, b'1', 'assets/img/products/d074c07387a2cfc3f9b0fb2606549028.jpg', '2020-08-03 08:15:27', '2020-08-03 11:15:27', b'1', b'1', 1),
(18, 'Bangon', 7, 1, 1, 75, 85, 80, b'1', 'assets/img/products/44f2be95ba0311d6467df4444594887a.jpg', '2020-08-21 19:02:46', '2020-08-21 22:02:46', b'0', b'1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `grocery_traking_steps`
--

CREATE TABLE `grocery_traking_steps` (
  `StepId` int(11) NOT NULL,
  `StepName` varchar(50) NOT NULL,
  `Status` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grocery_traking_steps`
--

INSERT INTO `grocery_traking_steps` (`StepId`, `StepName`, `Status`) VALUES
(1, 'Requested', b'1'),
(2, 'Confirmed', b'1'),
(3, 'In Transit', b'1'),
(4, 'Item Received', b'1'),
(5, 'Dispatched', b'1'),
(6, 'Received By User', b'1'),
(7, 'Canceled', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `grocery_unit`
--

CREATE TABLE `grocery_unit` (
  `UnitId` int(11) NOT NULL,
  `UnitName` varchar(15) NOT NULL,
  `Status` bit(1) NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `ModifiedOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grocery_unit`
--

INSERT INTO `grocery_unit` (`UnitId`, `UnitName`, `Status`, `CreatedOn`, `ModifiedOn`) VALUES
(1, 'KG', b'1', '2020-07-16 21:02:55', '2020-07-16 12:02:55'),
(2, 'KG', b'0', '2020-07-16 21:07:05', '2020-07-16 12:07:05'),
(3, 'Gram', b'1', '2020-07-16 21:07:29', '2020-07-16 12:07:29');

-- --------------------------------------------------------

--
-- Table structure for table `grocery_user_address`
--

CREATE TABLE `grocery_user_address` (
  `AddressId` int(11) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `UserId` varchar(50) NOT NULL,
  `Status` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grocery_user_address`
--

INSERT INTO `grocery_user_address` (`AddressId`, `Address`, `UserId`, `Status`) VALUES
(1, 'House#1131, street#06, Mehmoodabad, Karachi', '1', b'1'),
(3, 'lkajsd f;lkasjdf ;lksdf;lkjasd;lf kj;laskdf j;lkasdjf ;lkasjdf ;lkasjd;f lkjasd;flk as;lkdfj ;lasdf', '1', b'1'),
(4, 'lkjad ;flksjd f;lksdjf', '1', b'1'),
(5, 'aaaaaaa', '1', b'1'),
(6, 'ccccccccc', '1', b'1'),
(7, 'bbbbbbbb', '1', b'1'),
(8, 'dddddd', '1', b'1'),
(9, 'eeeeeeeee', '1', b'1'),
(10, 'dddddd', '1', b'1'),
(11, 'fffffff', '1', b'1'),
(12, 'gggggggggg', '1', b'1'),
(13, 'hhhhhhhhhhh', '1', b'1'),
(14, 'iiiiiiiii', '1', b'1'),
(15, 'House#1131, manzoor colony', '0aa31209685b637af3ee', b'1'),
(16, 'abc address\r\n', '4d50106bfd5ab578634e', b'1'),
(22, 'kljhasd lkfjhas dklfjh kljashd flkjhasd fkljh', '2e8e151e2435f01acc93', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(11) UNSIGNED NOT NULL,
  `phrase` text NOT NULL,
  `english` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `phrase`, `english`) VALUES
(1, 'user_profile', 'User Profile'),
(2, 'setting', 'Setting'),
(3, 'language', 'Language'),
(4, 'manage_users', 'Manage Users'),
(5, 'add_user', 'Add User'),
(6, 'manage_company', 'Manage Company'),
(7, 'web_settings', 'Software Settings'),
(8, 'manage_accounts', 'Manage Accounts'),
(9, 'create_accounts', 'Create Account'),
(10, 'manage_bank', 'Manage Bank'),
(11, 'add_new_bank', 'Add New Bank'),
(12, 'settings', 'Bank'),
(13, 'closing_report', 'Closing Report'),
(14, 'closing', 'Closing'),
(15, 'cheque_manager', 'Cheque Manager'),
(16, 'accounts_summary', 'Accounts Summary'),
(17, 'expense', 'Expense'),
(18, 'income', 'Income'),
(19, 'accounts', 'Accounts'),
(20, 'stock_report', 'Stock Report'),
(21, 'stock', 'Stock'),
(22, 'pos_invoice', 'POS Invoice'),
(23, 'manage_invoice', 'Manage Invoice '),
(24, 'new_invoice', 'New Invoice'),
(25, 'invoice', 'Invoice'),
(26, 'manage_purchase', 'Manage Purchase'),
(27, 'add_purchase', 'Add Purchase'),
(28, 'purchase', 'Purchase'),
(29, 'paid_customer', 'Paid Customer'),
(30, 'manage_customer', 'Manage Customer'),
(31, 'add_customer', 'Add Customer'),
(32, 'customer', 'Customer'),
(33, 'supplier_payment_actual', 'Supplier Payment Ledger'),
(34, 'supplier_sales_summary', 'Supplier Sales Summary'),
(35, 'supplier_sales_details', 'Supplier Sales Details'),
(36, 'supplier_ledger', 'Supplier Ledger'),
(37, 'manage_supplier', 'Manage Supplier'),
(38, 'add_supplier', 'Add Supplier'),
(39, 'supplier', 'Supplier'),
(40, 'product_statement', 'Product Statement'),
(41, 'manage_product', 'Manage Product'),
(42, 'add_product', 'Add Product'),
(43, 'product', 'Product'),
(44, 'manage_category', 'Manage Category'),
(45, 'add_category', 'Add Category'),
(46, 'category', 'Category'),
(47, 'sales_report_product_wise', 'Sales Report (Product Wise)'),
(48, 'purchase_report', 'Purchase Report'),
(49, 'sales_report', 'Sales Report'),
(50, 'todays_report', 'Todays Report'),
(51, 'report', 'Report'),
(52, 'dashboard', 'Dashboard'),
(53, 'online', 'Online'),
(54, 'logout', 'Logout'),
(55, 'change_password', 'Change Password'),
(56, 'total_purchase', 'Total Purchase'),
(57, 'total_amount', 'Total Amount'),
(58, 'supplier_name', 'Supplier Name'),
(59, 'invoice_no', 'Invoice No'),
(60, 'purchase_date', 'Purchase Date'),
(61, 'todays_purchase_report', 'Todays Purchase Report'),
(62, 'total_sales', 'Total Sales'),
(63, 'customer_name', 'Customer Name'),
(64, 'sales_date', 'Sales Date'),
(65, 'todays_sales_report', 'Todays Sales Report'),
(66, 'home', 'Home'),
(67, 'todays_sales_and_purchase_report', 'Todays sales and purchase report'),
(68, 'total_ammount', 'Total Amount'),
(69, 'rate', 'Rate'),
(70, 'product_model', 'Product Model'),
(71, 'product_name', 'Product Name'),
(72, 'search', 'Search'),
(73, 'end_date', 'End Date'),
(74, 'start_date', 'Start Date'),
(75, 'total_purchase_report', 'Total Purchase Report'),
(76, 'total_sales_report', 'Total Sales Report'),
(77, 'total_seles', 'Total Sales'),
(78, 'all_stock_report', 'All Stock Report'),
(79, 'search_by_product', 'Search By Product'),
(80, 'date', 'Date'),
(81, 'print', 'Print'),
(82, 'stock_date', 'Stock Date'),
(83, 'print_date', 'Print Date'),
(84, 'sales', 'Sales'),
(85, 'price', 'Price'),
(86, 'sl', 'SL.'),
(87, 'add_new_category', 'Add new category'),
(88, 'category_name', 'Category Name'),
(89, 'save', 'Save'),
(90, 'delete', 'Delete'),
(91, 'update', 'Update'),
(92, 'action', 'Action'),
(93, 'manage_your_category', 'Manage your category '),
(94, 'category_edit', 'Category Edit'),
(95, 'status', 'Status'),
(96, 'active', 'Active'),
(97, 'inactive', 'Inactive'),
(98, 'save_changes', 'Save Changes'),
(99, 'save_and_add_another', 'Save And Add Another'),
(100, 'model', 'Model'),
(101, 'supplier_price', 'Supplier Price'),
(102, 'sell_price', 'Sale Price'),
(103, 'image', 'Image'),
(104, 'select_one', 'Select One'),
(105, 'details', 'Details'),
(106, 'new_product', 'New Product'),
(107, 'add_new_product', 'Add new product'),
(108, 'barcode', 'Barcode'),
(109, 'qr_code', 'Qr-Code'),
(110, 'product_details', 'Product Details'),
(111, 'manage_your_product', 'Manage your product'),
(112, 'product_edit', 'Product Edit'),
(113, 'edit_your_product', 'Edit your product'),
(114, 'cancel', 'Cancel'),
(115, 'incl_vat', 'Incl. Vat'),
(116, 'money', 'TK'),
(117, 'grand_total', 'Grand Total'),
(118, 'quantity', 'Qnty'),
(119, 'product_report', 'Product Report'),
(120, 'product_sales_and_purchase_report', 'Product sales and purchase report'),
(121, 'previous_stock', 'Previous Stock'),
(122, 'out', 'Out'),
(123, 'in', 'In'),
(124, 'to', 'To'),
(125, 'previous_balance', 'Previous Credit Balance'),
(126, 'customer_address', 'Customer Address'),
(127, 'customer_mobile', 'Customer Mobile'),
(128, 'customer_email', 'Customer Email'),
(129, 'add_new_customer', 'Add new customer'),
(130, 'balance', 'Balance'),
(131, 'mobile', 'Mobile'),
(132, 'address', 'Address'),
(133, 'manage_your_customer', 'Manage your customer'),
(134, 'customer_edit', 'Customer Edit'),
(135, 'paid_customer_list', 'Paid Customer List'),
(136, 'ammount', 'Amount'),
(137, 'customer_ledger', 'Customer Ledger'),
(138, 'manage_customer_ledger', 'Manage Customer Ledger'),
(139, 'customer_information', 'Customer Information'),
(140, 'debit_ammount', 'Debit Amount'),
(141, 'credit_ammount', 'Credit Amount'),
(142, 'balance_ammount', 'Balance Amount'),
(143, 'receipt_no', 'Receipt NO'),
(144, 'description', 'Description'),
(145, 'debit', 'Debit'),
(146, 'credit', 'Credit'),
(147, 'item_information', 'Item Information'),
(148, 'total', 'Total'),
(149, 'please_select_supplier', 'Please Select Supplier'),
(150, 'submit', 'Submit'),
(151, 'submit_and_add_another', 'Submit And Add Another One'),
(152, 'add_new_item', 'Add New Item'),
(153, 'manage_your_purchase', 'Manage your purchase'),
(154, 'purchase_edit', 'Purchase Edit'),
(155, 'purchase_ledger', 'Purchase Ledger'),
(156, 'invoice_information', 'Invoice Information'),
(157, 'paid_ammount', 'Paid Amount'),
(158, 'discount', 'Dis./Pcs.'),
(159, 'save_and_paid', 'Save And Paid'),
(160, 'payee_name', 'Payee Name'),
(161, 'manage_your_invoice', 'Manage your invoice'),
(162, 'invoice_edit', 'Invoice Edit'),
(163, 'new_pos_invoice', 'New POS invoice'),
(164, 'add_new_pos_invoice', 'Add new pos invoice'),
(165, 'product_id', 'Product ID'),
(166, 'paid_amount', 'Paid Amount'),
(167, 'authorised_by', 'Authorised By'),
(168, 'checked_by', 'Checked By'),
(169, 'received_by', 'Received By'),
(170, 'prepared_by', 'Prepared By'),
(171, 'memo_no', 'Memo No'),
(172, 'website', 'Website'),
(173, 'email', 'Email'),
(174, 'invoice_details', 'Invoice Details'),
(175, 'reset', 'Reset'),
(176, 'payment_account', 'Payment Account'),
(177, 'bank_name', 'Bank Name'),
(178, 'cheque_or_pay_order_no', 'Cheque/Pay Order No'),
(179, 'payment_type', 'Payment Type'),
(180, 'payment_from', 'Payment From'),
(181, 'payment_date', 'Payment Date'),
(182, 'add_income', 'Add Income'),
(183, 'cash', 'Cash'),
(184, 'cheque', 'Cheque'),
(185, 'pay_order', 'Pay Order'),
(186, 'payment_to', 'Payment To'),
(187, 'total_outflow_ammount', 'Total Expense Amount'),
(188, 'transections', 'Transections'),
(189, 'accounts_name', 'Accounts Name'),
(190, 'outflow_report', 'Expense Report'),
(191, 'inflow_report', 'Income Report'),
(192, 'all', 'All'),
(193, 'account', 'Account'),
(194, 'from', 'From'),
(195, 'account_summary_report', 'Account Summary Report'),
(196, 'search_by_date', 'Search By Date'),
(197, 'cheque_no', 'Cheque No'),
(198, 'name', 'Name'),
(199, 'closing_account', 'Closing Account'),
(200, 'close_your_account', 'Close your account'),
(201, 'last_day_closing', 'Last Day Closing'),
(202, 'cash_in', 'Cash In'),
(203, 'cash_out', 'Cash Out'),
(204, 'cash_in_hand', 'Cash In Hand'),
(205, 'add_new_bank', 'Add New Bank'),
(206, 'day_closing', 'Day Closing'),
(207, 'account_closing_report', 'Account Closing Report'),
(208, 'last_day_ammount', 'Last Day Amount'),
(209, 'adjustment', 'Adjustment'),
(210, 'pay_type', 'Pay Type'),
(211, 'customer_or_supplier', 'Customer,Supplier Or Others'),
(212, 'transection_id', 'Transections ID'),
(213, 'accounts_summary_report', 'Accounts Summary Report'),
(214, 'bank_list', 'Bank List'),
(215, 'bank_edit', 'Bank Edit'),
(216, 'debit_plus', 'Debit (+)'),
(217, 'credit_minus', 'Credit (-)'),
(218, 'account_name', 'Account Name'),
(219, 'account_type', 'Account Type'),
(220, 'account_real_name', 'Account Real Name'),
(221, 'manage_account', 'Manage Account'),
(222, 'company_name', 'Niha International'),
(223, 'edit_your_company_information', 'Edit your company information'),
(224, 'company_edit', 'Company Edit'),
(225, 'admin', 'Admin'),
(226, 'user', 'User'),
(227, 'password', 'Password'),
(228, 'last_name', 'Last Name'),
(229, 'first_name', 'First Name'),
(230, 'add_new_user_information', 'Add new user information'),
(231, 'user_type', 'User Type'),
(232, 'user_edit', 'User Edit'),
(233, 'rtr', 'RTR'),
(234, 'ltr', 'LTR'),
(235, 'ltr_or_rtr', 'LTR/RTR'),
(236, 'footer_text', 'Footer Text'),
(237, 'favicon', 'Favicon'),
(238, 'logo', 'Logo'),
(239, 'update_setting', 'Update Setting'),
(240, 'update_your_web_setting', 'Update your web setting'),
(241, 'login', 'Login'),
(242, 'your_strong_password', 'Your strong password'),
(243, 'your_unique_email', 'Your unique email'),
(244, 'please_enter_your_login_information', 'Please enter your login information.'),
(245, 'update_profile', 'Update Profile'),
(246, 'your_profile', 'Your Profile'),
(247, 're_type_password', 'Re-Type Password'),
(248, 'new_password', 'New Password'),
(249, 'old_password', 'Old Password'),
(250, 'new_information', 'New Information'),
(251, 'old_information', 'Old Information'),
(252, 'change_your_information', 'Change your information'),
(253, 'change_your_profile', 'Change your profile'),
(254, 'profile', 'Profile'),
(255, 'wrong_username_or_password', 'Wrong User Name Or Password !'),
(256, 'successfully_updated', 'Successfully Updated.'),
(257, 'blank_field_does_not_accept', 'Blank Field Does Not Accept !'),
(258, 'successfully_changed_password', 'Successfully changed password.'),
(259, 'you_are_not_authorised_person', 'You are not authorised person !'),
(260, 'password_and_repassword_does_not_match', 'Passwor and re-password does not match !'),
(261, 'new_password_at_least_six_character', 'New Password At Least 6 Character.'),
(262, 'you_put_wrong_email_address', 'You put wrong email address !'),
(263, 'cheque_ammount_asjusted', 'Cheque amount adjusted.'),
(264, 'successfully_payment_paid', 'Successfully Payment Paid.'),
(265, 'successfully_added', 'Successfully Added.'),
(266, 'successfully_updated_2_closing_ammount_not_changeale', 'Successfully Updated -2. Note: Closing Amount Not Changeable.'),
(267, 'successfully_payment_received', 'Successfully Payment Received.'),
(268, 'already_inserted', 'Already Inserted !'),
(269, 'successfully_delete', 'Successfully Delete.'),
(270, 'successfully_created', 'Successfully Created.'),
(271, 'logo_not_uploaded', 'Logo not uploaded !'),
(272, 'favicon_not_uploaded', 'Favicon not uploaded !'),
(273, 'supplier_mobile', 'Supplier Mobile'),
(274, 'supplier_address', 'Supplier Address'),
(275, 'supplier_details', 'Supplier Details'),
(276, 'add_new_supplier', 'Add New Supplier'),
(277, 'manage_suppiler', 'Manage Supplier'),
(278, 'manage_your_supplier', 'Manage your supplier'),
(279, 'manage_supplier_ledger', 'Manage supplier ledger'),
(280, 'invoice_id', 'Invoice ID'),
(281, 'deposite_id', 'Deposite ID'),
(282, 'supplier_actual_ledger', 'Supplier Payment Ledger'),
(283, 'supplier_information', 'Supplier Information'),
(284, 'event', 'Event'),
(285, 'add_new_income', 'Add New Income'),
(286, 'add_expese', 'Add Expense'),
(287, 'add_new_expense', 'Add New Expense'),
(288, 'total_inflow_ammount', 'Total Income Amount'),
(289, 'create_new_invoice', 'Create New Invoice'),
(290, 'create_pos_invoice', 'Create POS Invoice'),
(291, 'total_profit', 'Total Profit'),
(292, 'monthly_progress_report', 'Monthly Progress Report'),
(293, 'total_invoice', 'Total Invoice'),
(294, 'account_summary', 'Account Summary'),
(295, 'total_supplier', 'Total Supplier'),
(296, 'total_product', 'Total Product'),
(297, 'total_customer', 'Total Customer'),
(298, 'supplier_edit', 'Supplier Edit'),
(299, 'add_new_invoice', 'Add New Invoice'),
(300, 'add_new_purchase', 'Add new purchase'),
(301, 'currency', 'Currency'),
(302, 'currency_position', 'Currency Position'),
(303, 'left', 'Left'),
(304, 'right', 'Right'),
(305, 'add_tax', 'Add Tax'),
(306, 'manage_tax', 'Manage Tax'),
(307, 'add_new_tax', 'Add new tax'),
(308, 'enter_tax', 'Enter Tax'),
(309, 'already_exists', 'Already Exists !'),
(310, 'successfully_inserted', 'Successfully Inserted.'),
(311, 'tax', 'Tax'),
(312, 'tax_edit', 'Tax Edit'),
(313, 'product_not_added', 'Product not added !'),
(314, 'total_tax', 'Total Tax'),
(315, 'manage_your_supplier_details', 'Manage your supplier details.'),
(316, 'invoice_description', 'Lorem Ipsum is sim ply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is sim ply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy'),
(317, 'thank_you_for_choosing_us', 'Thank you very much for choosing us.'),
(318, 'billing_date', 'Billing Date'),
(319, 'billing_to', 'Billing To'),
(320, 'billing_from', 'Billing From'),
(321, 'you_cant_delete_this_product', 'Sorry !!  You can\'t delete this product.This product already used in calculation system!'),
(322, 'old_customer', 'Old Customer'),
(323, 'new_customer', 'New Customer'),
(324, 'new_supplier', 'New Supplier'),
(325, 'old_supplier', 'Old Supplier'),
(326, 'credit_customer', 'Credit Customer'),
(327, 'account_already_exists', 'This Account Already Exists !'),
(328, 'edit_income', 'Edit Income'),
(329, 'you_are_not_access_this_part', 'You are not authorised person !'),
(330, 'account_edit', 'Account Edit'),
(331, 'due', 'Due'),
(332, 'expense_edit', 'Expense Edit'),
(333, 'please_select_customer', 'Please select customer !'),
(334, 'profit_report', 'Profit Report (Invoice Wise)'),
(335, 'total_profit_report', 'Total profit report'),
(336, 'please_enter_valid_captcha', 'Please enter valid captcha.'),
(337, 'category_not_selected', 'Category not selected.'),
(338, 'supplier_not_selected', 'Supplier not selected.'),
(339, 'please_select_product', 'Please select product.'),
(340, 'product_model_already_exist', 'Product model already exist !'),
(341, 'invoice_logo', 'Invoice Logo'),
(342, 'available_qnty', 'Av. Qnty.'),
(343, 'you_can_not_buy_greater_than_available_cartoon', 'You can not select grater than available cartoon !'),
(344, 'customer_details', 'Customer details'),
(345, 'manage_customer_details', 'Manage customer details.'),
(346, 'site_key', 'Captcha Site Key'),
(347, 'secret_key', 'Captcha Secret Key'),
(348, 'captcha', 'Captcha'),
(349, 'cartoon_quantity', 'Cartoon Quantity'),
(350, 'total_cartoon', 'Total Cartoon'),
(351, 'cartoon', 'Cartoon'),
(352, 'item_cartoon', 'Item/Cartoon'),
(353, 'product_and_supplier_did_not_match', 'Product and supplier did not match !'),
(354, 'if_you_update_purchase_first_select_supplier_then_product_and_then_quantity', 'If you update purchase,first select supplier then product and then update qnty.'),
(355, 'item', 'Item'),
(356, 'manage_your_credit_customer', 'Manage your credit customer'),
(357, 'total_quantity', 'Total Quantity'),
(358, 'quantity_per_cartoon', 'Quantity per cartoon'),
(359, 'barcode_qrcode_scan_here', 'Barcode or QR-code scan here'),
(360, 'synchronizer_setting', 'Synchronizer Setting'),
(361, 'data_synchronizer', 'Data Synchronizer'),
(362, 'hostname', 'Host name'),
(363, 'username', 'User Name'),
(364, 'ftp_port', 'FTP Port'),
(365, 'ftp_debug', 'FTP Debug'),
(366, 'project_root', 'Project Root'),
(367, 'please_try_again', 'Please try again'),
(368, 'save_successfully', 'Save successfully'),
(369, 'synchronize', 'Synchronize'),
(370, 'internet_connection', 'Internet Connection'),
(371, 'outgoing_file', 'Outgoing File'),
(372, 'incoming_file', 'Incoming File'),
(373, 'ok', 'Ok'),
(374, 'not_available', 'Not Available'),
(375, 'available', 'Available'),
(376, 'download_data_from_server', 'Download data from server'),
(377, 'data_import_to_database', 'Data import to database'),
(378, 'data_upload_to_server', 'Data uplod to server'),
(379, 'please_wait', 'Please Wait'),
(380, 'ooops_something_went_wrong', 'Oooops Something went wrong !'),
(381, 'upload_successfully', 'Upload successfully'),
(382, 'unable_to_upload_file_please_check_configuration', 'Unable to upload file please check configuration'),
(383, 'please_configure_synchronizer_settings', 'Please configure synchronizer settings'),
(384, 'download_successfully', 'Download successfully'),
(385, 'unable_to_download_file_please_check_configuration', 'Unable to download file please check configuration'),
(386, 'data_import_first', 'Data import past'),
(387, 'data_import_successfully', 'Data import successfully'),
(388, 'unable_to_import_data_please_check_config_or_sql_file', 'Unable to import data please check config or sql file'),
(389, 'total_sale_ctn', 'Total Sale Ctn'),
(390, 'in_qnty', 'In Qnty.'),
(391, 'out_qnty', 'Out Qnty.'),
(392, 'stock_report_supplier_wise', 'Stock Report (Supplier Wise)'),
(393, 'all_stock_report_supplier_wise', 'Stock Report (Suppler Wise)'),
(394, 'select_supplier', 'Select Supplier'),
(395, 'stock_report_product_wise', 'Stock Report (Product Wise)'),
(396, 'phone', 'Phone'),
(397, 'select_product', 'Select Product'),
(398, 'in_quantity', 'In Qnty.'),
(399, 'out_quantity', 'Out Qnty.'),
(400, 'in_taka', 'In TK.'),
(401, 'out_taka', 'Out TK.'),
(402, 'commission', 'Commission'),
(403, 'generate_commission', 'Generate Commssion'),
(404, 'commission_rate', 'Commission Rate'),
(405, 'total_ctn', 'Total Ctn.'),
(406, 'per_pcs_commission', 'Per PCS Commission'),
(407, 'total_commission', 'Total Commission'),
(408, 'enter', 'Enter'),
(409, 'please_add_walking_customer_for_default_customer', 'Please add \'Walking Customer\' for default customer.'),
(410, 'supplier_ammount', 'Supplier Amount'),
(411, 'my_sale_ammount', 'My Sale Amount'),
(412, 'signature_pic', 'Signature Picture'),
(413, 'branch', 'Branch'),
(414, 'ac_no', 'A/C Number'),
(415, 'ac_name', 'A/C Name'),
(416, 'bank_transaction', 'Bank Transaction'),
(417, 'bank', 'Bank'),
(418, 'withdraw_deposite_id', 'Withdraw / Deposite ID'),
(419, 'bank_ledger', 'Bank Ledger'),
(420, 'note_name', 'Note Name'),
(421, 'pcs', 'Pcs.'),
(422, '1', '1'),
(423, '2', '2'),
(424, '5', '5'),
(425, '10', '10'),
(426, '20', '20'),
(427, '50', '50'),
(428, '100', '100'),
(429, '500', '500'),
(430, '1000', '1000'),
(431, 'total_discount', 'Total Discount'),
(432, 'product_not_found', 'Product not found !'),
(433, 'this_is_not_credit_customer', 'This is not credit customer !'),
(434, 'personal_loan', 'Office Loan'),
(435, 'add_person', 'Add Person'),
(436, 'add_loan', 'Add Loan'),
(437, 'add_payment', 'Add Payment'),
(438, 'manage_person', 'Manage Person'),
(439, 'personal_edit', 'Person Edit'),
(440, 'person_ledger', 'Person Ledger'),
(441, 'backup_restore', 'Backup '),
(442, 'database_backup', 'Database backup'),
(443, 'file_information', 'File information'),
(444, 'filename', 'Filename'),
(445, 'size', 'Size'),
(446, 'backup_date', 'Backup date'),
(447, 'backup_now', 'Backup now'),
(448, 'restore_now', 'Restore now'),
(449, 'are_you_sure', 'Are you sure ?'),
(450, 'download', 'Download'),
(451, 'backup_and_restore', 'Backup'),
(452, 'backup_successfully', 'Backup successfully'),
(453, 'delete_successfully', 'Delete successfully'),
(454, 'stock_ctn', 'Stock/Qnt'),
(455, 'unit', 'Unit'),
(456, 'meter_m', 'Meter (M)'),
(457, 'piece_pc', 'Piece (Pc)'),
(458, 'kilogram_kg', 'Kilogram (Kg)'),
(459, 'stock_cartoon', 'Stock Cartoon'),
(460, 'add_product_csv', 'Add Product (CSV)'),
(461, 'import_product_csv', 'Import product (CSV)'),
(462, 'close', 'Close'),
(463, 'download_example_file', 'Download example file.'),
(464, 'upload_csv_file', 'Upload CSV File'),
(465, 'csv_file_informaion', 'CSV File Information'),
(466, 'out_of_stock', 'Out Of Stock'),
(467, 'others', 'Others'),
(468, 'full_paid', 'Full Paid'),
(469, 'successfully_saved', 'Your Data Successfully Saved'),
(470, 'manage_loan', 'Manage Loan'),
(471, 'receipt', 'Receipt'),
(472, 'payment', 'Payment'),
(473, 'cashflow', 'Daily Cash Flow'),
(474, 'signature', 'Signature'),
(475, 'supplier_reports', 'Supplier Reports'),
(476, 'generate', 'Generate'),
(477, 'todays_overview', 'Todays Overview'),
(478, 'last_sales', 'Last Sales'),
(479, 'manage_transaction', 'Manage Transaction'),
(481, 'daily_summary', 'Daily Summary'),
(482, 'daily_cash_flow', 'Daily Cash Flow'),
(483, 'custom_report', 'Custom Report'),
(484, 'transaction', 'Transaction'),
(485, 'receipt_amount', 'Receipt Amount'),
(486, 'transaction_details_datewise', 'Transaction Details Datewise'),
(487, 'cash_closing', 'Cash Closing'),
(488, 'you_can_not_buy_greater_than_available_qnty', 'You can not buy greater than available qnty.'),
(489, 'supplier_id', 'Supplier ID'),
(490, 'category_id', 'Category ID'),
(491, 'select_report', 'Select Report'),
(492, 'supplier_summary', 'Supplier summary'),
(493, 'sales_payment_actual', 'Sales payment actual'),
(494, 'today_already_closed', 'Today already closed.'),
(495, 'root_account', 'Root Account'),
(496, 'office', 'Office'),
(497, 'loan', 'Loan'),
(498, 'transaction_mood', 'Transaction Mood'),
(499, 'select_account', 'Select Account'),
(500, 'add_receipt', 'Add Receipt'),
(501, 'update_transaction', 'Update Transaction'),
(502, 'no_stock_found', 'No Stock Found !'),
(503, 'admin_login_area', 'Admin Login Area'),
(505, 'print_qr_code', 'Print QR Code'),
(506, 'discount_type', 'Discount Type'),
(507, 'discount_percentage', 'Discount'),
(508, 'fixed_dis', 'Fixed Dis.'),
(509, 'return', 'Return'),
(510, 'stock_return_list', 'Stock Return List'),
(511, 'wastage_return_list', 'Wastage Return List'),
(512, 'return_invoice', 'Invoice Return'),
(513, 'sold_qty', 'Sold Qty'),
(514, 'ret_quantity', 'Return Qty'),
(515, 'deduction', 'Deduction'),
(516, 'check_return', 'Check Return'),
(517, 'reason', 'Reason'),
(518, 'usablilties', 'Usability'),
(519, 'adjs_with_stck', 'Adjust With Stock'),
(520, 'return_to_supplier', 'Return To Supplier'),
(521, 'wastage', 'Wastage'),
(522, 'to_deduction', 'Total Deduction '),
(523, 'nt_return', 'Net Return Amount'),
(524, 'return_list', 'Return List'),
(525, 'add_return', 'Add Return'),
(526, 'per_qty', 'Purchase Qty'),
(527, 'return_supplier', 'Supplier Return'),
(528, 'stock_purchase', 'Stock Purchase Price'),
(529, 'stock_sale', 'Stock Sale Price'),
(530, 'supplier_return', 'Supplier Return'),
(531, 'purchase_id', 'Purchase ID'),
(532, 'return_id', 'Return ID'),
(533, 'supplier_return_list', 'Supplier Return List'),
(534, 'c_r_slist', 'Stock Return Stock'),
(535, 'wastage_list', 'Wastage List'),
(536, 'please_input_correct_invoice_id', 'Please Input a Correct Invoice ID'),
(537, 'please_input_correct_purchase_id', 'Please Input Your Correct  Purchase ID'),
(538, 'add_more', 'Add More'),
(539, 'prouct_details', 'Product Details'),
(540, 'prouct_detail', 'Product Details'),
(541, 'stock_return', 'Stock Return'),
(542, 'choose_transaction', 'Select Transaction'),
(543, 'transection_category', 'Select  Category'),
(544, 'transaction_categry', 'Select Category'),
(545, 'search_supplier', 'Search Supplier'),
(546, 'customer_id', 'Customer ID'),
(547, 'search_customer', 'Search Customer Invoice'),
(548, 'serial_no', 'Serial Number'),
(549, 'item_discount', 'Item Discount'),
(550, 'invoice_discount', 'Invoice Discount'),
(551, 'add_unit', 'Add Unit'),
(552, 'manage_unit', 'Manage Unit'),
(553, 'add_new_unit', 'Add New Unit'),
(554, 'unit_name', 'Unit Name'),
(555, 'payment_amount', 'Payment Amount'),
(556, 'manage_your_unit', 'Manage Your Unit'),
(557, 'unit_id', 'Unit ID'),
(558, 'unit_edit', 'Unit Edit'),
(559, 'multi_payment', 'Multi Payment'),
(560, 'voucher_information', 'Voucher Information'),
(561, 'voucher_no', 'Voucher No'),
(562, 'person_name', 'Contact Name'),
(563, 'manage_voucher', 'Manage Voucher'),
(564, 'credit_limit', 'Credit Limit'),
(565, 'due_date', 'Due Date'),
(566, 'vat', 'Vat'),
(567, 'sales_report_category_wise', 'Sales Report (Category wise)'),
(568, 'purchase_report_category_wise', 'Purchase Report (Category wise)'),
(569, 'category_wise_purchase_report', 'Category wise purchase report'),
(570, 'category_wise_sales_report', 'Category wise sales report'),
(571, 'best_sale_product', 'Best Sale Product'),
(572, 'all_best_sales_product', 'All Best Sales Products'),
(573, 'todays_customer_receipt', 'Todays Customer Receipt'),
(574, 'not_found', 'Record not found'),
(575, 'collection', 'Collection'),
(576, 'sale_order_number', 'Sale Order #');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` varchar(20) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `gender` int(2) DEFAULT NULL,
  `date_of_birth` varchar(255) DEFAULT NULL,
  `logo` varchar(250) DEFAULT NULL,
  `status` int(2) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `AddressId` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `address_details` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `last_name`, `first_name`, `gender`, `date_of_birth`, `logo`, `status`, `phone`, `email`, `city`, `country`, `AddressId`, `address`, `address_details`) VALUES
('1', 'Mughal', 'Kashif', 1, '', 'http://localhost/smart_grocery/assets/dist/img/profile_picture/8eabbc68afd20681ca70fb88d7a67ceb.jpg', 1, '923460030581', 'grocery_admin@grocery.com', '0', '0', 1, 'House#90, st#02, liquatabad, Karachi', ''),
('485870e402584d1430da', '', 'mk021', 0, '', NULL, 1, '03460030583', 'mkmughal15@gmail.com', 'Karachi', 'Pakistan', 0, 'house 1131', ';lkasjdf'),
('0aa31209685b637af3ee', NULL, NULL, NULL, NULL, NULL, 1, '923460030582', NULL, NULL, NULL, 0, '', ''),
('feca6d9196533682d359', '', 'Mk 004', 0, '', NULL, 1, '03460030584', 'mkmughal17@gmail.com', 'Karachi', 'Pakistan', 0, 'house 1131', 'lajsdlfkj'),
('69f7be32cb243175e656', '', 'Mughal007', 0, '', NULL, 1, '03460030586', 'mkmughal17@gmail.com', 'Karachi', 'Pakistan', 0, 'house 1131', ';alksdjf'),
('dd85877dfcef5226c9c5', '', 'Muhammad KAshif', 0, '', NULL, 1, '03460030587', 'mkmughal20@gmail.com', 'Karachi', 'Pakistan', 0, 'house 1131', ';lkajsd;flkj'),
('b7b3bde542a1632f7f0d', NULL, NULL, NULL, NULL, NULL, 1, '923460030561', NULL, NULL, NULL, 0, '', ''),
('4d50106bfd5ab578634e', NULL, NULL, NULL, NULL, NULL, 1, '923458113142', NULL, NULL, NULL, 0, '', ''),
('3db0c3a36db1e14ef7c4', NULL, NULL, NULL, NULL, NULL, 1, '923460030451', NULL, NULL, NULL, 0, '', ''),
('0aefb5da0c06ad9fa8d5', NULL, NULL, NULL, NULL, NULL, 1, '923458118142', NULL, NULL, NULL, 0, '', ''),
('2e8e151e2435f01acc93', 'lkajs hf', 'jhasdlfk', NULL, NULL, '', 1, '923458113143', 'mkmughal005@mail.com', NULL, NULL, 0, '', ''),
('0f2f09017b707b0fb704', NULL, NULL, NULL, NULL, NULL, 1, '923460030584', NULL, NULL, NULL, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

CREATE TABLE `user_login` (
  `user_id` varchar(30) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_type` int(2) NOT NULL,
  `security_code` varchar(255) DEFAULT NULL,
  `status` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_login`
--

INSERT INTO `user_login` (`user_id`, `username`, `password`, `user_type`, `security_code`, `status`) VALUES
('1', 'grocery_admin@grocery.com', '2e44c76375b20f381945bccb735d80f0', 1, '', 1),
('485870e402584d1430da', 'mkmughal15@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 1, '', 1),
('ad18b67943cb87181b68', 'mkmughal16@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 2, '', 1),
('feca6d9196533682d359', 'mkmughal17@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 2, '', 1),
('69f7be32cb243175e656', 'mkmughal17@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 2, '', 1),
('dd85877dfcef5226c9c5', 'mkmughal20@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 2, '', 1),
('0e3bac51945804fa1d03', NULL, NULL, 1, NULL, 1),
('dc01b749b74f58d96516', NULL, NULL, 1, NULL, 1),
('10f11e97a72dcdeca477', NULL, NULL, 1, NULL, 1),
('5f3b1039dfcafae9dd53', NULL, NULL, 1, NULL, 1),
('0aa31209685b637af3ee', NULL, NULL, 1, NULL, 1),
('0aefb5da0c06ad9fa8d5', NULL, NULL, 1, NULL, 1),
('3db0c3a36db1e14ef7c4', NULL, NULL, 1, NULL, 1),
('4d50106bfd5ab578634e', NULL, NULL, 1, NULL, 1),
('b7b3bde542a1632f7f0d', NULL, NULL, 1, NULL, 1),
('2e8e151e2435f01acc93', '', NULL, 1, NULL, 1),
('0f2f09017b707b0fb704', NULL, NULL, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `web_setting`
--

CREATE TABLE `web_setting` (
  `setting_id` int(11) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `invoice_logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `currency_position` varchar(10) DEFAULT NULL,
  `footer_text` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `rtr` varchar(255) DEFAULT NULL,
  `captcha` int(11) DEFAULT 1 COMMENT '0=active,1=inactive',
  `site_key` varchar(250) DEFAULT NULL,
  `secret_key` varchar(250) DEFAULT NULL,
  `discount_type` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `web_setting`
--

INSERT INTO `web_setting` (`setting_id`, `logo`, `invoice_logo`, `favicon`, `currency`, `currency_position`, `footer_text`, `language`, `rtr`, `captcha`, `site_key`, `secret_key`, `discount_type`) VALUES
(1, '#', '#', '#', '₨', '1', '<div class=\"col-md-9\">\r\n							<p>info@saudaexpress.com, 0300 123 45678, Plot No. 30, Sector 26, Korangi Industrial Area, Karachi,<br>PakistanSauda Express &#0174 2020</p>\r\n						</div>\r\n						<div class=\"col-md-3\">\r\n						</div>', 'english', '0', 1, '', '', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `grocery_assistant`
--
ALTER TABLE `grocery_assistant`
  ADD PRIMARY KEY (`AssistantId`),
  ADD KEY `CreatedOn` (`CreatedOn`);

--
-- Indexes for table `grocery_brand`
--
ALTER TABLE `grocery_brand`
  ADD PRIMARY KEY (`BrandId`),
  ADD KEY `BrandName` (`BrandName`),
  ADD KEY `Alias` (`Alias`);

--
-- Indexes for table `grocery_category`
--
ALTER TABLE `grocery_category`
  ADD PRIMARY KEY (`CategoryId`),
  ADD KEY `CatName` (`CatName`);

--
-- Indexes for table `grocery_order`
--
ALTER TABLE `grocery_order`
  ADD PRIMARY KEY (`OrderId`),
  ADD KEY `CustomerId` (`CustomerId`);

--
-- Indexes for table `grocery_order_detail`
--
ALTER TABLE `grocery_order_detail`
  ADD PRIMARY KEY (`OrderDetailId`),
  ADD KEY `OrderId` (`OrderId`);

--
-- Indexes for table `grocery_otp`
--
ALTER TABLE `grocery_otp`
  ADD PRIMARY KEY (`otp_id`);

--
-- Indexes for table `grocery_products`
--
ALTER TABLE `grocery_products`
  ADD PRIMARY KEY (`ProductId`),
  ADD KEY `FK_ProductCategory_GroceryCategoryId` (`Category`);

--
-- Indexes for table `grocery_traking_steps`
--
ALTER TABLE `grocery_traking_steps`
  ADD PRIMARY KEY (`StepId`);

--
-- Indexes for table `grocery_unit`
--
ALTER TABLE `grocery_unit`
  ADD PRIMARY KEY (`UnitId`);

--
-- Indexes for table `grocery_user_address`
--
ALTER TABLE `grocery_user_address`
  ADD PRIMARY KEY (`AddressId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `grocery_assistant`
--
ALTER TABLE `grocery_assistant`
  MODIFY `AssistantId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `grocery_brand`
--
ALTER TABLE `grocery_brand`
  MODIFY `BrandId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `grocery_category`
--
ALTER TABLE `grocery_category`
  MODIFY `CategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `grocery_order`
--
ALTER TABLE `grocery_order`
  MODIFY `OrderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `grocery_order_detail`
--
ALTER TABLE `grocery_order_detail`
  MODIFY `OrderDetailId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `grocery_otp`
--
ALTER TABLE `grocery_otp`
  MODIFY `otp_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `grocery_products`
--
ALTER TABLE `grocery_products`
  MODIFY `ProductId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `grocery_traking_steps`
--
ALTER TABLE `grocery_traking_steps`
  MODIFY `StepId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `grocery_unit`
--
ALTER TABLE `grocery_unit`
  MODIFY `UnitId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `grocery_user_address`
--
ALTER TABLE `grocery_user_address`
  MODIFY `AddressId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=577;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `grocery_products`
--
ALTER TABLE `grocery_products`
  ADD CONSTRAINT `FK_ProductCategory_GroceryCategoryId` FOREIGN KEY (`Category`) REFERENCES `grocery_category` (`CategoryId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
