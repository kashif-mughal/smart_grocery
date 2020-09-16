-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 16, 2020 at 08:27 AM
-- Server version: 10.3.24-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `saudaexp_live`
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
(15, 11, '2020-08-10', '2020-08-11', 0),
(16, 2, '2020-08-10', '2020-08-11', 1),
(17, 24, '2020-09-05', '2020-09-05', 1);

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
(2, 'Nagori', 'Nagori', 'assets/img/brand/c2ec00c7d3f2513bf045b03e7bb0d2a4.png', '2020-07-15 11:10:00', '2020-07-15 02:10:00', b'0'),
(4, 'Dove', 'dove', 'assets/img/brand.jpg', '2020-09-02 18:09:14', '2020-09-02 14:09:14', b'1'),
(5, 'Unilever', 'unilever', 'assets/img/brand.jpg', '2020-09-02 18:12:22', '2020-09-02 14:12:22', b'0'),
(6, 'Reckitt', 'reckitt', 'assets/img/brand.jpg', '2020-09-02 18:12:36', '2020-09-02 14:12:36', b'1'),
(7, 'National', 'national', 'assets/img/brand.jpg', '2020-09-02 18:12:46', '2020-09-02 14:12:46', b'1'),
(8, 'Nestle', 'nestle', 'assets/img/brand.jpg', '2020-09-02 18:13:00', '2020-09-02 14:13:00', b'1'),
(9, 'Reckitt-Health', 'reckitt-health', 'assets/img/brand.jpg', '2020-09-02 18:13:19', '2020-09-02 14:13:19', b'1'),
(10, 'Peek-Freans', 'peek-freans', 'assets/img/brand.jpg', '2020-09-02 18:13:35', '2020-09-02 14:13:35', b'1'),
(11, 'Mitchell\'s', 'Mitchell\'s', 'assets/img/brand.jpg', '2020-09-02 18:13:56', '2020-09-02 14:13:56', b'1'),
(12, 'Reckitt-RB-Hygiene', 'Reckitt-RB-Hygiene', 'assets/img/brand.jpg', '2020-09-02 18:14:16', '2020-09-02 14:14:16', b'1'),
(13, 'Dawn', 'Dawn', 'assets/img/brand.jpg', '2020-09-02 18:14:37', '2020-09-02 14:14:37', b'0'),
(14, 'Bake-Parlor', 'Bake-Parlor', 'assets/img/brand.jpg', '2020-09-02 18:14:46', '2020-09-02 14:14:46', b'1'),
(15, 'Dettol', 'Dettol', 'assets/img/brand.jpg', '2020-09-02 18:14:55', '2020-09-02 14:14:55', b'1'),
(16, 'K&N\'s', 'K&N\'s', 'assets/img/brand.jpg', '2020-09-02 18:15:04', '2020-09-02 14:15:04', b'1'),
(17, 'Kolson', 'Kolson', 'assets/img/brand.jpg', '2020-09-02 18:15:13', '2020-09-02 14:15:13', b'1'),
(18, 'Shezan', 'Shezan', 'assets/img/brand.jpg', '2020-09-02 18:15:21', '2020-09-02 14:15:21', b'1'),
(19, 'Bunnys', 'Bunnys', 'assets/img/brand.jpg', '2020-09-02 18:15:29', '2020-09-02 14:15:29', b'1'),
(20, 'Shangrila', 'Shangrila', 'assets/img/brand.jpg', '2020-09-02 18:15:38', '2020-09-02 14:15:38', b'1'),
(21, 'Rafhan', 'Rafhan', 'assets/img/brand.jpg', '2020-09-02 18:16:13', '2020-09-02 14:16:13', b'1'),
(22, 'English Biscuit Manufacturers', 'English Biscuit Manufacturers', 'assets/img/brand.jpg', '2020-09-02 18:17:37', '2020-09-02 14:17:37', b'1'),
(23, 'National Foods Limited', 'National Foods Limited', 'assets/img/brand.jpg', '2020-09-02 18:17:48', '2020-09-02 14:17:48', b'1'),
(24, 'Shan Foods', 'Shan Foods', 'assets/img/brand.jpg', '2020-09-02 18:18:07', '2020-09-02 14:18:07', b'1'),
(25, 'Gourmet Foods', 'Gourmet Foods', 'assets/img/brand.jpg', '2020-09-02 18:18:22', '2020-09-02 14:18:22', b'1'),
(26, 'Unilever Pakistan', 'Unilever Pakistan', 'assets/img/brand.jpg', '2020-09-02 18:18:43', '2020-09-02 14:18:43', b'1'),
(27, 'Tapal Tea', 'Tapal Tea', 'assets/img/brand.jpg', '2020-09-02 18:19:58', '2020-09-02 14:19:58', b'1'),
(28, 'SAUDA EXPRESS', '', 'assets/img/brand.jpg', '2020-09-04 12:36:11', '2020-09-04 08:36:11', b'1'),
(29, 'Al Khubz', 'Al Khubz', 'assets/img/brand/7cc4b5eb214b3bfd50dd1294cbd0bc06.jpg', '2020-09-04 14:03:48', '2020-09-04 10:03:48', b'0'),
(30, 'Guard Rice', 'Guard Rice', 'assets/img/brand/e0f330660f4a1dda809fcf74b137791a.jpg', '2020-09-04 14:20:58', '2020-09-04 10:20:58', b'1'),
(31, 'Sufi', 'Sufi', 'assets/img/brand.jpg', '2020-09-05 16:22:00', '2020-09-05 12:22:00', b'1'),
(32, 'Faisal Industries', 'Faisal Industries', 'assets/img/brand.jpg', '2020-09-15 14:02:58', '2020-09-15 10:02:58', b'1'),
(33, 'AA Chaki Atta', 'AA Chaki Atta', 'assets/img/brand.jpg', '2020-09-15 14:08:26', '2020-09-15 10:08:26', b'1'),
(34, 'Bake Parlour', 'Bake Parlour', 'assets/img/brand.jpg', '2020-09-15 14:23:08', '2020-09-15 10:23:08', b'1'),
(35, 'Sadi Foods', 'Sadi Foods', 'assets/img/brand.jpg', '2020-09-15 15:21:35', '2020-09-15 11:21:35', b'1'),
(36, 'Guard Super Basmati Rice', 'Guard Super Basmati Rice', 'assets/img/brand/dc784dd89731f6c08a8a7c73bfdb1e45.jpg', '2020-09-15 15:32:44', '2020-09-15 11:32:44', b'0'),
(37, 'Falakrice', 'Falakrice', 'assets/img/brand.jpg', '2020-09-15 15:42:35', '2020-09-15 11:42:35', b'1');

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
(6, 'Fruits & Vegetables', 'Fresh Fruits and Vegetables', 'assets/img/product.png', 0, '2020-07-13 10:41:12', '2020-07-13 01:41:12', b'0'),
(7, 'Fresh Vegetables', 'Fresh Vegetables', 'assets/img/category/a18cd787626ba579b25dc6e09aae5b20.jpg', 6, '2020-07-13 10:42:38', '2020-07-13 01:42:38', b'0'),
(8, 'Fresh Fruits', 'Fresh Fruits', 'assets/img/category/00a66dc411d3ab95259d0c2d85ee6991.jpg', 6, '2020-07-13 10:43:11', '2020-07-13 01:43:11', b'0'),
(9, 'Snacks & BreakFast', 'Snacks & BreakFast', 'assets/img/product.png', 0, '2020-07-13 10:43:59', '2020-07-13 01:43:59', b'0'),
(10, 'Chips', 'Chips', 'assets/img/category/8d4be779a210886e3f2a46138dc84677.jpg', 9, '2020-07-13 10:44:30', '2020-07-13 01:44:30', b'0'),
(11, 'Biscuits', 'Biscuits', 'assets/img/category/6cfdc904f73383eb352970235d3faafc.jpg', 9, '2020-07-13 10:44:58', '2020-07-13 01:44:58', b'0'),
(12, 'Essential Foods ', 'Essential Foods', 'assets/img/product.png', 0, '2020-07-13 10:45:27', '2020-07-13 01:45:27', b'1'),
(13, 'Atta (Flour)', 'Atta & Flour', 'assets/img/category/868f874b0059a140826161b8a60fe0c2.jpg', 12, '2020-07-13 10:46:11', '2020-07-13 01:46:11', b'0'),
(14, 'Cooking Oil', 'Cooking Oil', 'assets/img/category/43f2a5fd549a616fae43d48345ca2a94.jpg', 12, '2020-07-13 10:46:34', '2020-07-13 01:46:34', b'0'),
(20, 'Fresh Fruits2', 'Fresh Fruits2', 'assets/img/product.png', 6, '2020-07-18 18:45:10', '2020-07-18 21:45:10', b'0'),
(21, 'Fresh Vegetables2', 'Fresh Vegetables2', 'assets/img/product.png', 6, '2020-07-18 18:45:26', '2020-07-18 21:45:26', b'0'),
(22, 'Farm Vegetables', 'Farm Vegetables', 'assets/img/product.png', 7, '2020-08-03 08:13:58', '2020-08-03 11:13:58', b'0'),
(23, 'Haircare', 'haircare', 'assets/img/product.png', 0, '2020-09-02 18:06:17', '2020-09-02 14:06:17', b'0'),
(24, 'Dairy Products', 'DP', 'assets/img/product.png', 0, '2020-09-03 17:46:54', '2020-09-03 13:46:54', b'0'),
(25, 'Milk', 'Milk', 'assets/img/category/0c9e06d12e444965d4df6ba9033c1d4e.png', 24, '2020-09-03 17:47:53', '2020-09-03 13:47:53', b'0'),
(26, 'Aata / Flour', '', 'assets/img/product.png', 12, '2020-09-04 13:12:30', '2020-09-04 09:12:30', b'0'),
(27, 'Fresh Fruits & Vegetables', 'Fresh Fruits & Vegetables', 'assets/img/product.png', 0, '2020-09-04 13:27:11', '2020-09-04 09:27:11', b'0'),
(28, 'Meat & Poultry', 'Meat & Poultry', 'assets/img/product.png', 0, '2020-09-04 13:28:21', '2020-09-04 09:28:21', b'0'),
(29, 'Poultry', 'Poultry', 'assets/img/product.png', 0, '2020-09-04 13:28:41', '2020-09-04 09:28:41', b'0'),
(30, 'Seafood', 'Seafood', 'assets/img/product.png', 0, '2020-09-04 13:29:05', '2020-09-04 09:29:05', b'0'),
(31, 'Bakery & Frozen', 'Bakery & Frozen', 'assets/img/product.png', 0, '2020-09-04 13:29:38', '2020-09-04 09:29:38', b'0'),
(32, 'Snacks & Breakfast', 'Snacks & Breakfast', 'assets/img/product.png', 0, '2020-09-04 13:32:35', '2020-09-04 09:32:35', b'0'),
(33, 'Toiletries', 'Toiletries', 'assets/img/product.png', 0, '2020-09-04 13:33:49', '2020-09-04 09:33:49', b'0'),
(34, 'Personal Hygiene', 'Personal Hygiene', 'assets/img/product.png', 0, '2020-09-04 13:34:29', '2020-09-04 09:34:29', b'0'),
(35, 'Kitchen Accessories ', 'Kitchen Accessories ', 'assets/img/product.png', 0, '2020-09-04 13:34:58', '2020-09-04 09:34:58', b'0'),
(36, 'Household Essentials', 'Household Essentials', 'assets/img/product.png', 0, '2020-09-04 13:35:35', '2020-09-04 09:35:35', b'0'),
(37, 'Pan Shop', 'Pan Shop', 'assets/img/product.png', 0, '2020-09-04 13:37:05', '2020-09-04 09:37:05', b'0'),
(38, 'OTC Healthcare & Wellbeing', 'OTC Healthcare & Wellbeing', 'assets/img/product.png', 0, '2020-09-04 13:37:37', '2020-09-04 09:37:37', b'0'),
(39, 'Beauty & Cosmetics', 'Beauty & Cosmetics', 'assets/img/product.png', 0, '2020-09-04 13:37:58', '2020-09-04 09:37:58', b'0'),
(40, 'Aata / Flour', 'Aata / Flour', 'assets/img/category/d11535803578a42aaf539a78b60f3759.jpg', 12, '2020-09-04 13:38:37', '2020-09-04 09:38:37', b'0'),
(41, 'Cooking Oil', 'Cooking Oil', 'assets/img/category/fea8afce6d58b29c096f5aa18d85466d.jpg', 12, '2020-09-04 13:39:43', '2020-09-04 09:39:43', b'0'),
(42, 'Rice', 'Rice ', 'assets/img/category/b8974732ab5b6e1961aa234400770daa.jpg', 12, '2020-09-04 13:42:19', '2020-09-04 09:42:19', b'0'),
(43, 'Sugar & Sweeteners', 'Sugar & Sweeteners', 'assets/img/category/3b54e3691ec70a6ab0c66507ec109b02.jpg', 12, '2020-09-04 13:52:54', '2020-09-04 09:52:54', b'0'),
(44, 'Banaspati Ghee', 'Banaspati Ghee', 'assets/img/category/03abe1c75e628f05ee41d54087f8bd94.jpg', 12, '2020-09-04 13:54:20', '2020-09-04 09:54:20', b'0'),
(45, 'Asli Ghee', 'Asli Ghee', 'assets/img/category/3ed8fbcb3ada8f985d0f9939da0e1fda.jpg', 12, '2020-09-04 14:15:33', '2020-09-04 10:15:33', b'0'),
(46, 'Daals / Pulses', 'Daals / Pulses', 'assets/img/category/e7bf337ffe3ed35f4b64eacba4bb62f0.jpg', 12, '2020-09-04 18:20:24', '2020-09-04 14:20:24', b'0'),
(47, 'Ketchups & Chutnies', 'Ketchups & Chutnies', 'assets/img/category/54667b5b1951c698e7699d229125708a.jpg', 12, '2020-09-04 18:36:00', '2020-09-04 14:36:00', b'0'),
(48, 'Packed Spices / Masalas', 'Packed Spices / Masalas', 'assets/img/category/0253978520663971fde80ab22b598d93.jpg', 12, '2020-09-04 18:43:12', '2020-09-04 14:43:12', b'0'),
(49, 'Loose Spices / Masalas', 'Loose Spices / Masalas', 'assets/img/category/7e93904013d97a41a7f76b0c03bd9a0e.jpg', 12, '2020-09-04 18:47:21', '2020-09-04 14:47:21', b'0'),
(50, 'Tea & Coffee', 'Tea & Coffee', 'assets/img/category/5574078a37a3407bbc650bbb17c00299.jpg', 12, '2020-09-04 18:51:27', '2020-09-04 14:51:27', b'0'),
(51, 'Milk ', 'Milk ', 'assets/img/category/f51293bc14ff5c32ba6a7cfd58b144a7.jpg', 12, '2020-09-04 18:55:48', '2020-09-04 14:55:48', b'0'),
(52, 'Cereals', 'Cereals', 'assets/img/category/1683dace16388804077d7a94322ceb56.jpg', 32, '2020-09-04 18:58:59', '2020-09-04 14:58:59', b'0'),
(53, 'Biscuits', 'Biscuits', 'assets/img/category/ae2f274b1d8e24985ea95eaf1cc2f4a3.jpg', 32, '2020-09-04 19:02:05', '2020-09-04 15:02:05', b'0'),
(54, 'Chips ', 'Chips ', 'assets/img/category/db9a1651ea69c3d0e40fdb3406c31e85.jpg', 32, '2020-09-04 19:06:06', '2020-09-04 15:06:06', b'0'),
(55, 'Jams, Jellies & Spreads', 'Jams, Jellies & Spreads', 'assets/img/category/b9a9bcb879be831df8e487fabb6c70b6.jpg', 32, '2020-09-09 09:09:47', '2020-09-09 05:09:47', b'0'),
(56, 'Instant Noodles', 'Instant Noodles', 'assets/img/category/49429a21f14fac9a9053f657c102d4d5.jpg', 32, '2020-09-09 09:22:22', '2020-09-09 05:22:22', b'0'),
(57, 'Chocolates & Toffees', 'Chocolates & Toffees', 'assets/img/category/e7c607a9efad100d3ef6a86deaa8a97a.jpg', 32, '2020-09-09 09:25:02', '2020-09-09 05:25:02', b'0'),
(58, 'Beef ', 'Beef ', 'assets/img/category/98e74789f3ec88613459d018967d78f8.jpg', 28, '2020-09-09 09:32:08', '2020-09-09 05:32:08', b'0'),
(59, 'Chicken', 'Chicken', 'assets/img/category/14cc059d957f136067b8118e9376a5fa.jpg', 28, '2020-09-09 09:36:51', '2020-09-09 05:36:51', b'0'),
(60, 'Fish', 'Fish', 'assets/img/category/52bf89be9d15c9cc0bf61747b229e73d.jpg', 30, '2020-09-09 09:52:13', '2020-09-09 05:52:13', b'0'),
(61, 'Mutton', 'Mutton', 'assets/img/category/997ca63890fddb9bc788cd269d38824a.jpg', 28, '2020-09-09 10:24:52', '2020-09-09 06:24:52', b'0'),
(62, 'Prawns', 'Prawns', 'assets/img/category/e484a14dae3b7c6493e53b79e5101755.jpg', 30, '2020-09-09 10:27:58', '2020-09-09 06:27:58', b'0'),
(63, 'Exotics', 'Exotics', 'assets/img/category/029864e6bf9ebb80a2ab5a496fa10c2e.jpg', 30, '2020-09-09 10:32:01', '2020-09-09 06:32:01', b'0'),
(64, 'Banana', 'Banana', 'assets/img/category/81545c6f19fab2da6a1f6d1ea4143690.jpg', 78, '2020-09-09 10:47:29', '2020-09-09 06:47:29', b'0'),
(65, 'Apple', 'Apple', 'assets/img/category/9fde67701051b4bad6ecee8560e5d30f.jpg', 27, '2020-09-09 10:51:37', '2020-09-09 06:51:37', b'0'),
(66, 'Mango', 'Mango', 'assets/img/category/76dc6f6a56a1b950e8e7eee677035c61.jpg', 27, '2020-09-09 11:32:04', '2020-09-09 07:32:04', b'0'),
(67, 'Grapes', 'Grapes', 'assets/img/category/4600c95af6d7d597db6c84122479298a.jpg', 27, '2020-09-09 11:36:28', '2020-09-09 07:36:28', b'0'),
(68, 'Pear', 'Pear', 'assets/img/category/98c83c0d2b072afe3511f3fb016ff4c9.jpg', 27, '2020-09-09 11:43:12', '2020-09-09 07:43:12', b'0'),
(69, 'Plum', 'Plum', 'assets/img/category/0f63ef999c00339995f9761d9b5dd908.jpg', 27, '2020-09-09 11:54:33', '2020-09-09 07:54:33', b'0'),
(70, 'Peach', 'Peach', 'assets/img/category/57908d3baeb29ad13db399e6d624ac35.jpg', 27, '2020-09-09 12:03:23', '2020-09-09 08:03:23', b'0'),
(71, 'Apricot', 'Apricot', 'assets/img/category/c42349196bd059c2be28ab3e2d3c5989.jpg', 27, '2020-09-09 12:06:38', '2020-09-09 08:06:38', b'0'),
(72, 'Watermelon', 'Watermelon', 'assets/img/category/88ab3b02ff42aa83d7434e8d89bf07e3.jpg', 27, '2020-09-09 12:09:58', '2020-09-09 08:09:58', b'0'),
(73, 'Muskmelon / Kharbooz', 'Muskmelon / Kharbooz', 'assets/img/category/98f922e1aa53051f71541ff7e14e7810.jpg', 27, '2020-09-09 12:17:33', '2020-09-09 08:17:33', b'0'),
(74, 'Galia Melon / Sarda', 'Galia Melon / Sarda', 'assets/img/category/7b988ce62dc96230185a69301a1fc03b.jpg', 27, '2020-09-09 12:24:34', '2020-09-09 08:24:34', b'0'),
(75, 'Rock Melon / Garma', 'Rock Melon / Garma', 'assets/img/category/a66eab0a973e11554a7aa4f8d00aa2f4.jpg', 27, '2020-09-09 12:27:59', '2020-09-09 08:27:59', b'0'),
(76, 'Sapodilla / Chikoo', 'Sapodilla / Chikoo', 'assets/img/category/327d2fc2d197ed8fddd0f119ad9887ec.jpg', 27, '2020-09-09 12:31:39', '2020-09-09 08:31:39', b'0'),
(77, 'Kinnow', 'Kinnow', 'assets/img/category/c87139282ea9be046d6d9848172a26a6.jpg', 27, '2020-09-09 12:34:50', '2020-09-09 08:34:50', b'0'),
(78, 'Fresh Fruits ', 'Fresh fruits ', 'assets/img/category/e0a5f4e468ea892c6c14006c0ab31b82.jpg', 27, '2020-09-09 12:52:08', '2020-09-09 08:52:08', b'0'),
(79, 'Fresh Vegetables', 'Fresh Vegetables', 'assets/img/category/b708ac1806b633895774a5f629735f4f.jpg', 27, '2020-09-09 13:56:23', '2020-09-09 09:56:23', b'0'),
(80, 'Bread', 'Bread', 'assets/img/category/9eedbbbfe13b6357b89dba5803ebf96e.jpg', 31, '2020-09-09 19:14:06', '2020-09-09 15:14:06', b'0'),
(81, 'Eggs', 'Eggs', 'assets/img/category/4f129eaacb5a9cb76cfe53f67b2ef8d7.jpg', 31, '2020-09-09 19:16:20', '2020-09-09 15:16:20', b'0'),
(82, 'Patties', 'Patties', 'assets/img/category/b44a5a7d4199f78879a19922e8c547b6.jpg', 31, '2020-09-09 19:18:50', '2020-09-09 15:18:50', b'0'),
(83, 'Butter', 'Butter', 'assets/img/category/15cc9e93ec3bed8cf26f8bbb41853721.jpg', 31, '2020-09-09 19:22:21', '2020-09-09 15:22:21', b'0'),
(84, 'Cheese', 'Cheese', 'assets/img/category/c590401a2b001e0229f98df4b25a5033.jpg', 31, '2020-09-09 19:28:38', '2020-09-09 15:28:38', b'0'),
(85, 'Rusk', 'Rusk', 'assets/img/category/b5705fca33bb3f8724dd4877ca48fee3.jpg', 31, '2020-09-09 19:31:46', '2020-09-09 15:31:46', b'0'),
(86, 'Toothpaste', 'Toothpaste', 'assets/img/category/56112c8536fb6034777e7e8304b2b7eb.jpg', 34, '2020-09-09 19:36:26', '2020-09-09 15:36:26', b'0'),
(87, 'Toothbrush', 'Toothbrush', 'assets/img/category/3c89876427c3218da7876e819fe0328b.jpg', 34, '2020-09-09 19:37:54', '2020-09-09 15:37:54', b'0'),
(88, 'Mouthwash', 'Mouthwash', 'assets/img/category/eebd339f8928ca5dd915f6cc9f8aebf5.jpg', 34, '2020-09-09 19:49:49', '2020-09-09 15:49:49', b'0'),
(89, 'Shaving Creams & Gels', 'Shaving Creams & Gels', 'assets/img/category/170d11f92f3b171a6a9143e0a52b63ae.jpg', 34, '2020-09-09 19:58:31', '2020-09-09 15:58:31', b'0'),
(90, 'Razor', 'Razor', 'assets/img/category/b30be680d05d6bf380e21e9e779dd2d4.jpg', 34, '2020-09-09 20:04:04', '2020-09-09 16:04:04', b'0'),
(91, 'Aftershave Lotion', 'Aftershave Lotion', 'assets/img/category/ddd5f4464385659c2f5e70bc9db0f5bc.jpg', 34, '2020-09-09 20:07:59', '2020-09-09 16:07:59', b'0'),
(92, 'Sanitizer', 'Sanitizer', 'assets/img/category/613ce75a19b466727c1bd41b939593f9.jpg', 34, '2020-09-10 05:48:26', '2020-09-10 01:48:26', b'0'),
(93, 'Deodorant', 'Deodorant', 'assets/img/category/cfce66028f25975cc040e3232fb90667.jpg', 34, '2020-09-10 05:53:00', '2020-09-10 01:53:00', b'0'),
(94, 'Skincare Lotion', 'Skincare Lotion', 'assets/img/category/df57c61d9e6220a13b1d0a71d6a2e6c6.jpg', 34, '2020-09-10 06:40:02', '2020-09-10 02:40:02', b'0'),
(95, 'Facewash', 'Facewash', 'assets/img/category/e05ae9f989c7553086dea122d3d99059.jpg', 34, '2020-09-10 07:13:02', '2020-09-10 03:13:02', b'0'),
(96, 'Hair Removing Products', 'Hair Removing Products', 'assets/img/category/1f203d4ee031fdc899e2a83abcb9cb23.jpg', 34, '2020-09-10 07:36:11', '2020-09-10 03:36:11', b'0'),
(97, 'Cotton Buds', 'Cotton Buds', 'assets/img/category/7111dd038aef7eed159099ba838408ab.jpg', 34, '2020-09-10 07:43:20', '2020-09-10 03:43:20', b'0'),
(98, 'Soap & Handwash', 'Soap & Handwash', 'assets/img/category/5afb949c7373f9d33908c80f7ae60892.jpg', 33, '2020-09-10 10:01:14', '2020-09-10 06:01:14', b'0'),
(99, 'Detergents / Washing Powders', 'Detergents / Washing Powders', 'assets/img/category/3f25b24bc0a991a57012b52338859827.jpg', 33, '2020-09-10 10:15:58', '2020-09-10 06:15:58', b'0'),
(100, 'Disinfectants & Surface Cleaners', 'Disinfectants & Surface Cleaners', 'assets/img/category/a8c26f483276eda65becebb914c10d69.jpg', 33, '2020-09-10 10:26:51', '2020-09-10 06:26:51', b'0'),
(101, 'Toilet Roll', 'Toilet Roll', 'assets/img/category/236c68ebe843d7a30909d786dfee7409.jpg', 33, '2020-09-10 10:34:00', '2020-09-10 06:34:00', b'0'),
(102, 'Drain Opener', 'Drain Opener', 'assets/img/category/fc35499f4504b7e4f003972f812246b4.jpg', 33, '2020-09-10 10:47:17', '2020-09-10 06:47:17', b'0'),
(103, 'Toilet Cleaner', 'Toilet Cleaner', 'assets/img/category/5815b677240630c891db4b418dbdfd8a.jpg', 33, '2020-09-10 11:17:31', '2020-09-10 07:17:31', b'0'),
(104, 'Shampoos & Conditioners', 'Shampoos & Conditioners', 'assets/img/category/2abf805ee9656288f6073215fb473823.jpg', 23, '2020-09-10 11:58:46', '2020-09-10 07:58:46', b'0'),
(105, 'Hair Dye', 'Hair Dye', 'assets/img/category/c52db9760c33badcfbe34b2fc142daff.jpg', 23, '2020-09-10 12:10:15', '2020-09-10 08:10:15', b'0'),
(106, 'Hair Gels', 'Hair Gels', 'assets/img/category/0fdd6c601bac9c9d914dddaf8bd6a2c3.jpg', 23, '2020-09-10 12:13:03', '2020-09-10 08:13:03', b'0'),
(107, 'Hair Oils', 'Hair Oils', 'assets/img/category/445de4512a08e684ea8ace5c9aad8b91.jpg', 23, '2020-09-10 12:21:40', '2020-09-10 08:21:40', b'0'),
(108, 'Anti Lice Shampoos', 'Anti Lice Shampoos', 'assets/img/category/6b8a358f6fbd41ac5e3a6611aab4e438.jpg', 23, '2020-09-10 12:40:11', '2020-09-10 08:40:11', b'0'),
(109, 'Anti hairfall and damage repair products', 'Anti hairfall and damage repair products', 'assets/img/category/24a42868af663f33894a5db3d3b33881.jpg', 23, '2020-09-10 12:47:05', '2020-09-10 08:47:05', b'0'),
(110, 'Dishwashing Soaps & Liquids', 'Dishwashing Soaps & Liquids', 'assets/img/category/6ead3baf0f22b67263a1f586a00b90bf.jpg', 35, '2020-09-10 13:19:56', '2020-09-10 09:19:56', b'0'),
(111, 'Dishwashing Sponge and Steel Wire', 'Dishwashing Sponge and Steel Wire', 'assets/img/category/56afbfca6fe8d28473c856442be893e0.jpg', 35, '2020-09-10 13:24:31', '2020-09-10 09:24:31', b'0'),
(112, 'Kitchen Paper Towels', 'Kitchen Paper Towels', 'assets/img/category/446fe7959b498fbcf4b2fdb2dfe44de1.jpg', 35, '2020-09-10 13:38:38', '2020-09-10 09:38:38', b'0'),
(113, 'Cloth Duster', 'Cloth Duster', 'assets/img/category/45480703dde4695d99276433b945b5ba.jpg', 35, '2020-09-10 13:46:07', '2020-09-10 09:46:07', b'0'),
(114, 'Aluminium Foil & Cling Wrap', 'Aluminium Foil & Cling Wrap', 'assets/img/category/94dc33f906121471a224db1ae1428e4e.jpg', 35, '2020-09-10 14:00:01', '2020-09-10 10:00:01', b'0'),
(115, 'Garbage Bags', 'Garbage Bags', 'assets/img/category/c1114b34ca464f6d293286c543a51f63.jpg', 35, '2020-09-10 14:03:13', '2020-09-10 10:03:13', b'0'),
(116, 'Matchbox', 'Matchbox', 'assets/img/category/2cb757c4eb52021a0156cf426dea63c2.jpg', 35, '2020-09-10 14:18:04', '2020-09-10 10:18:04', b'0'),
(117, 'Insect Killer Sprays', 'Insect Killer Sprays', 'assets/img/category/a25dce2398d4477db4413d78c2914712.jpg', 36, '2020-09-10 14:49:33', '2020-09-10 10:49:33', b'0'),
(118, 'Mosquito Reppelents & Coils ', 'Mosquito Reppelents & Coils ', 'assets/img/category/e6553cee3a76b7ae3aa89fb5a179b6a2.jpg', 36, '2020-09-10 18:26:32', '2020-09-10 14:26:32', b'0'),
(119, 'Glass Cleaners', 'Glass Cleaners', 'assets/img/category/fb5ec99093abedd1e4979a3360979125.jpg', 36, '2020-09-10 19:04:32', '2020-09-10 15:04:32', b'0'),
(120, 'Facial Tissues & Table Napkins', 'Facial Tissues & Table Napkins', 'assets/img/category/e31ac4a2f5cceab851c5a68a90dfecd6.jpg', 36, '2020-09-10 19:39:00', '2020-09-10 15:39:00', b'0'),
(121, 'Wood Polishing & Anti Rust Products', 'Wood Polishing & Anti Rust Products', 'assets/img/category/058a49e7c94fa9dbe8bbfe86bb4d4a13.jpg', 36, '2020-09-10 19:44:28', '2020-09-10 15:44:28', b'0'),
(122, 'Adhesives', 'Adhesives', 'assets/img/category/21ca262a3c81dceb1bbdd815f47346af.jpg', 36, '2020-09-10 19:50:13', '2020-09-10 15:50:13', b'0'),
(123, 'Shoe Care Products', 'Shoe Care Products', 'assets/img/category/07ef1aab18661bec8960907211298ad3.jpg', 36, '2020-09-10 19:52:52', '2020-09-10 15:52:52', b'0'),
(124, 'Broom / Jharoo', 'Broom / Jharoo', 'assets/img/category/5e421e306c3b5dbe681193f30df2d7c9.jpg', 36, '2020-09-10 20:02:13', '2020-09-10 16:02:13', b'0'),
(125, 'Mop / Pocha', 'Mop / Pocha', 'assets/img/category/ce17a729f1537dae9067ec088a06781a.jpg', 36, '2020-09-10 20:06:12', '2020-09-10 16:06:12', b'0'),
(126, 'Floor Wipe', 'Floor Wipe', 'assets/img/category/62a5c22ea9bbfc5943bdc97bd0eafcb1.jpg', 36, '2020-09-10 20:11:11', '2020-09-10 16:11:11', b'0'),
(127, 'Iron Starch Spray', 'Iron Starch Spray', 'assets/img/category/a2adac9070412ecb7b5bb3f2d2241799.jpg', 36, '2020-09-10 20:23:39', '2020-09-10 16:23:39', b'0'),
(128, 'Scotch and Electric Tape', 'Scotch and Electric Tape', 'assets/img/category/f5421e1c4a6b0788663dee2d3cf7a47d.jpg', 36, '2020-09-10 20:31:57', '2020-09-10 16:31:57', b'0'),
(129, 'Baby Care', 'Baby Care', 'assets/img/product.png', 0, '2020-09-10 20:52:16', '2020-09-10 16:52:16', b'0'),
(130, 'Pet Care', 'Pet Care', 'assets/img/product.png', 0, '2020-09-10 20:52:46', '2020-09-10 16:52:46', b'0'),
(131, 'Maida & Baisen', 'Maida & Baisen', 'assets/img/category/e5bc7019befac588f0cfe24d7d15afd2.jpg', 12, '2020-09-10 20:57:34', '2020-09-10 16:57:34', b'0'),
(132, 'Spaghetti, Pasta & Macaroni', 'Spaghetti, Pasta & Macaroni', 'assets/img/category/e7475fa6e28518bc83b213226c704211.jpg', 12, '2020-09-11 07:02:32', '2020-09-11 03:02:32', b'0'),
(133, 'Baking Powder & Baking Soda', 'Baking Powder & Baking Soda', 'assets/img/category/9f91666857784759a915134bddab5527.jpg', 12, '2020-09-11 07:23:17', '2020-09-11 03:23:17', b'0'),
(134, 'Beverages', 'Beverages', 'assets/img/product.png', 0, '2020-09-11 07:56:18', '2020-09-11 03:56:18', b'0'),
(135, 'Sharbats & Squashes', 'Sharbats & Squashes', 'assets/img/category/adadc3f0c90c0ed2745f2760d546867a.jpg', 134, '2020-09-11 08:03:32', '2020-09-11 04:03:32', b'0'),
(136, 'Carbonated Drinks', 'Carbonated Drinks', 'assets/img/category/623bef733242090e2455890994dab631.jpg', 134, '2020-09-11 08:14:29', '2020-09-11 04:14:29', b'0'),
(137, 'Powder Drinks', 'Powder Drinks', 'assets/img/category/4c2e649ec8073af164f89d3cc9a7b216.jpg', 134, '2020-09-11 08:41:43', '2020-09-11 04:41:43', b'0'),
(138, 'Infant Milk Powder', 'Infant Milk Powder', 'assets/img/category/945976b3346d942d472bbd1273435ca1.jpg', 129, '2020-09-11 08:44:38', '2020-09-11 04:44:38', b'0'),
(139, 'Baby Food', 'Baby Food', 'assets/img/category/26299bc700cc989676a0b929faea0687.jpg', 129, '2020-09-11 11:10:26', '2020-09-11 07:10:26', b'0'),
(140, 'Diapers', 'Diapers', 'assets/img/category/d805704afbeb9f2c678ab9ab73334047.jpg', 129, '2020-09-11 11:17:29', '2020-09-11 07:17:29', b'0'),
(141, 'Cat Food', 'Cat Food', 'assets/img/category/d0008b93dc861cebfbe2a1db0130121f.jpg', 130, '2020-09-11 11:20:35', '2020-09-11 07:20:35', b'0'),
(142, 'Dog Food', 'Dog Food', 'assets/img/category/2321960732a26808a84e768460747cbc.jpg', 130, '2020-09-11 11:22:56', '2020-09-11 07:22:56', b'0'),
(143, 'Honey', 'Honey', 'assets/img/category/36bb27b620bef7740ec3200ee998a0aa.jpg', 12, '2020-09-12 08:31:05', '2020-09-12 04:31:05', b'0'),
(144, 'Cake Mixes', 'Cake Mixes', 'assets/img/category/6fa4e7dfce1e184e1085a9f970c2fb46.jpg', 12, '2020-09-12 08:34:03', '2020-09-12 04:34:03', b'0'),
(145, 'Packed Cream', 'Packed Cream', 'assets/img/category/e1eaaecd45639f71432772081af6cde4.jpg', 12, '2020-09-12 08:35:43', '2020-09-12 04:35:43', b'0'),
(146, 'Health Drinks', 'Health Drinks', 'assets/img/category/6345da51ffbfd4691c2a84fa02610bbd.jpg', 134, '2020-09-12 08:53:16', '2020-09-12 04:53:16', b'0'),
(147, 'Coconut Water', 'Coconut Water', 'assets/img/category/ca8afe9f52558c2b044bc2e388b7e888.jpg', 134, '2020-09-12 08:53:53', '2020-09-12 04:53:53', b'0'),
(148, 'Energy Drinks', 'Energy Drinks', 'assets/img/category/2a9d48b9421cb4e43979ce11c0104431.jpg', 0, '2020-09-12 08:54:44', '2020-09-12 04:54:44', b'0'),
(149, 'First Aid', 'First Aid', 'assets/img/category/09ec3a254aae538ed5c1b4f792d2ab51.jpg', 36, '2020-09-12 09:09:38', '2020-09-12 05:09:38', b'0'),
(150, 'Extension Wire', 'Battery CellsExtension Wire', 'assets/img/category/75c1bc0a5c21f8cff7ca9cbcee4a5a83.jpg', 36, '2020-09-12 09:31:43', '2020-09-12 05:31:43', b'0'),
(151, 'Sauces & Vinegars', 'Sauces & Vinegars', 'assets/img/category/a2e9d0b3fd24ffd25cfd49d99ee04eca.jpg', 12, '2020-09-13 08:48:27', '2020-09-13 04:48:27', b'0'),
(152, 'Canned Food', 'Canned Food', 'assets/img/category/e09304d7e95e99f9dfe960ed288c3c85.jpg', 12, '2020-09-13 08:50:15', '2020-09-13 04:50:15', b'0'),
(153, 'Frozen Vegetables', 'Frozen Vegetables', 'assets/img/category/c85b663efb6d9c89a11f9eabca2aa6d8.jpg', 31, '2020-09-13 08:59:17', '2020-09-13 04:59:17', b'0'),
(154, 'Frozen Parathas', 'Frozen Parathas', 'assets/img/category/8711e62cc5f20329670dd5ff6bded922.jpg', 31, '2020-09-13 09:07:53', '2020-09-13 05:07:53', b'0'),
(155, 'Nuggets and Other Ready to Fry Snacks', 'Nuggets and Other Ready to Fry Snacks', 'assets/img/category/e6dc7a1259e8796bbe5d5a7ef656fc48.jpg', 32, '2020-09-13 09:09:59', '2020-09-13 05:09:59', b'0'),
(156, 'Popcorn', 'Popcorn', 'assets/img/category/99422ef3a57895949a26e0a30b4a707d.jpg', 32, '2020-09-13 09:21:12', '2020-09-13 05:21:12', b'0'),
(157, 'Continental & Chinese Cuisine Ingredients', 'Continental & Chinese Cuisine Ingredients', 'assets/img/category/67f2eda3ada665233c3773aafa6bb41b.jpg', 12, '2020-09-13 09:30:50', '2020-09-13 05:30:50', b'0'),
(158, 'Packed Juices', 'Packed Juices', 'assets/img/category/c06acb1972492f5c9100bdf018cb9536.jpg', 134, '2020-09-13 10:07:52', '2020-09-13 06:07:52', b'0'),
(159, 'Baby Shampoos & Soaps', 'Baby Shampoos & Soaps', 'assets/img/category/13d5dba7065bda2e7a82333b34872a5e.jpg', 129, '2020-09-13 10:50:05', '2020-09-13 06:50:05', b'0'),
(160, 'Baby Lotion', 'Baby Lotion', 'assets/img/category/8bf52ddc3d7a22f3d0eaffa5f84b4679.jpg', 129, '2020-09-13 18:06:39', '2020-09-13 14:06:39', b'0'),
(161, 'Baby Wipes', 'Baby Wipes', 'assets/img/category/d12d948d0c2c78aa74ae8e41007b0716.jpg', 129, '2020-09-13 18:14:53', '2020-09-13 14:14:53', b'0'),
(162, 'Fabric Softener ', 'Fabric Softener ', 'assets/img/category/12318a424fd9ed65ec200f8e774642cb.jpg', 36, '2020-09-13 18:19:04', '2020-09-13 14:19:04', b'0'),
(163, 'Packed Yogurt', 'Packed Yogurt', 'assets/img/category/63c9681aa54c0ac3b2a742a738883763.jpg', 31, '2020-09-13 19:42:00', '2020-09-13 15:42:00', b'0'),
(164, 'Body Detox & Weight Management', 'Body Detox & Weight Management', 'assets/img/category/83cda69a616a8db5852a44addf2e0e86.jpg', 38, '2020-09-14 08:05:51', '2020-09-14 04:05:51', b'0'),
(165, 'General Wellbeing & Food Supplements', 'General Wellbeing & Food Supplements', 'assets/img/category/d6f61d3ca83bb6f340c35a0f0b782227.jpg', 38, '2020-09-14 08:11:39', '2020-09-14 04:11:39', b'0'),
(166, 'Muscle Pain Relief Balms', 'Muscle Pain Relief Balms', 'assets/img/category/e5815a38ab501cc8a9786daa8bb05951.jpg', 38, '2020-09-14 08:32:22', '2020-09-14 04:32:22', b'0'),
(167, 'OTC Pain Killer Medicines', 'OTC Pain Killer Medicines', 'assets/img/category/4835c4369c68733a6d8e90764931a759.jpg', 38, '2020-09-14 08:37:02', '2020-09-14 04:37:02', b'0'),
(168, 'Digestion Aid & Medication', 'Digestion Aid & Medication', 'assets/img/category/a37486ac77fcd5f16a24da7deded2f8d.jpg', 38, '2020-09-14 09:00:37', '2020-09-14 05:00:37', b'0'),
(169, 'Tea Whiteners', 'Tea Whiteners', 'assets/img/category/fdb9cbaab301ab397784cefdab52b974.jpg', 12, '2020-09-14 09:25:10', '2020-09-14 05:25:10', b'0'),
(170, 'Vermicelli / Sawayian', 'Vermicelli / Sawayian', 'assets/img/category/4fc1b4bbb81a7de67a6b452e1c70d8b9.jpg', 12, '2020-09-14 09:41:29', '2020-09-14 05:41:29', b'0'),
(171, 'Dessert Mixes', 'Dessert Mixes', 'assets/img/category/aeaf4944fba79c828f108508d659621e.jpg', 12, '2020-09-14 10:18:55', '2020-09-14 06:18:55', b'0'),
(172, 'Dry Fruit', 'Dry Fruit', 'assets/img/product.png', 0, '2020-09-14 10:54:30', '2020-09-14 06:54:30', b'0'),
(173, 'Snacks & Breakfast', 'Snacks & Breakfast', 'assets/img/product.png', 0, '2020-09-14 11:42:33', '2020-09-14 07:42:33', b'0'),
(174, 'Bakery & Frozen', 'Bakery & Frozen', 'assets/img/product.png', 0, '2020-09-14 11:43:05', '2020-09-14 07:43:05', b'0'),
(175, 'Fresh Fruits & Vegetables', 'Fresh Fruits & Vegetables', 'assets/img/product.png', 0, '2020-09-14 11:44:06', '2020-09-14 07:44:06', b'0'),
(176, 'Meat & Poultry', 'Meat & Poultry', 'assets/img/product.png', 0, '2020-09-14 11:44:22', '2020-09-14 07:44:22', b'0'),
(177, 'Snacks & Breakfast', 'Snacks & Breakfast', 'assets/img/product.png', 0, '2020-09-14 12:19:58', '2020-09-14 08:19:58', b'1'),
(178, 'Bakery and Frozen', 'Bakery and Frozen', 'assets/img/product.png', 0, '2020-09-14 12:20:09', '2020-09-14 08:20:09', b'1'),
(179, 'Beverages', 'Beverages', 'assets/img/product.png', 0, '2020-09-14 12:20:18', '2020-09-14 08:20:18', b'1'),
(180, 'Fresh Fruits & Vegetables', 'Fresh Fruits & Vegetables', 'assets/img/product.png', 0, '2020-09-14 12:20:28', '2020-09-14 08:20:28', b'1'),
(181, 'Meat & Poultry', 'Meat & Poultry', 'assets/img/product.png', 0, '2020-09-14 12:20:35', '2020-09-14 08:20:35', b'1'),
(182, 'Seafood', 'Seafood', 'assets/img/product.png', 0, '2020-09-14 12:20:45', '2020-09-14 08:20:45', b'1'),
(183, 'Personal Hygiene ', 'Personal Hygiene ', 'assets/img/product.png', 0, '2020-09-14 12:20:52', '2020-09-14 08:20:52', b'1'),
(184, 'Haircare', 'Haircare', 'assets/img/product.png', 0, '2020-09-14 12:21:01', '2020-09-14 08:21:01', b'1'),
(185, 'Toiletries', 'Toiletries', 'assets/img/product.png', 0, '2020-09-14 12:21:09', '2020-09-14 08:21:09', b'1'),
(186, 'Kitchen Essentials', 'Kitchen Essentials', 'assets/img/product.png', 0, '2020-09-14 12:21:17', '2020-09-14 08:21:17', b'1'),
(187, 'Household Essentials', 'Household Essentials', 'assets/img/product.png', 0, '2020-09-14 12:21:23', '2020-09-14 08:21:23', b'1'),
(188, 'Baby Care', 'Baby Care', 'assets/img/product.png', 0, '2020-09-14 12:21:31', '2020-09-14 08:21:31', b'1'),
(189, 'OTC Healthcare & Wellbeing', 'OTC Healthcare & Wellbeing', 'assets/img/product.png', 0, '2020-09-14 12:21:38', '2020-09-14 08:21:38', b'1'),
(190, 'Pet Care', 'Pet Care', 'assets/img/product.png', 0, '2020-09-14 12:21:45', '2020-09-14 08:21:45', b'1'),
(191, 'Aata / Flour', 'Aata / Flour', 'assets/img/category/44826a59bfe4f35161b0334125cf4eab.jpg', 12, '2020-09-14 12:22:29', '2020-09-14 08:22:29', b'1'),
(192, 'Cereals', 'Cereals', 'assets/img/category/4bd4eee400e881581aaf8046b3f49cef.jpg', 177, '2020-09-14 12:23:15', '2020-09-14 08:23:15', b'1'),
(193, 'Bread', 'Bread', 'assets/img/category/a44d622436028dde31c8e655448fc810.jpg', 178, '2020-09-14 12:23:52', '2020-09-14 08:23:52', b'1'),
(194, 'Sharbats & Squashes', 'Sharbats & Squashes', 'assets/img/category/599ed433ad2183bfe70aff2c0a91d650.jpg', 179, '2020-09-14 12:24:37', '2020-09-14 08:24:37', b'1'),
(195, 'Fresh Fruits', 'Fresh Fruits', 'assets/img/category/350f01f9d3a4aa1294218dcae7c34e13.jpg', 180, '2020-09-14 12:25:25', '2020-09-14 08:25:25', b'1'),
(196, 'Beef', 'Beef', 'assets/img/category/4b83b33b2dc371d5e5acd149101c5bf2.jpg', 181, '2020-09-14 12:26:07', '2020-09-14 08:26:07', b'1'),
(197, 'Fish', 'Fish', 'assets/img/category/08380f63d49dced758c920060694947b.jpg', 182, '2020-09-14 12:26:42', '2020-09-14 08:26:42', b'1'),
(198, 'Toothpaste', 'Toothpaste', 'assets/img/category/9b3ccbc8a4bd02a133ee8025d5d5f321.jpg', 183, '2020-09-14 12:27:08', '2020-09-14 08:27:08', b'1'),
(199, 'Shampoos & Conditioners', 'Shampoos & Conditioners', 'assets/img/category/014c51078014e74ab64f71166dc286bf.jpg', 184, '2020-09-14 12:27:45', '2020-09-14 08:27:45', b'1'),
(200, 'Soap & Handwash', 'Soap & Handwash', 'assets/img/category/e6f2eb28fdecce5360dd9a626b4f1a0c.jpg', 185, '2020-09-14 12:28:28', '2020-09-14 08:28:28', b'1'),
(201, 'Dishwashing Soaps & Liquids', 'Dishwashing Soaps & Liquids', 'assets/img/category/fc0384978eaad629b64b7a7d64aa678a.jpg', 186, '2020-09-14 12:29:47', '2020-09-14 08:29:47', b'1'),
(202, 'Insect Killer Sprays', 'Insect Killer Sprays', 'assets/img/category/692bee9a0e1d4fbfb610858b659c4ea2.jpg', 187, '2020-09-14 12:30:14', '2020-09-14 08:30:14', b'1'),
(203, 'Infant Milk Powder', 'Infant Milk Powder', 'assets/img/category/e9f690550b35de677b425b1a52d2367d.jpg', 188, '2020-09-14 12:31:16', '2020-09-14 08:31:16', b'1'),
(204, 'Body Detox & Weight Management', 'Body Detox & Weight Management', 'assets/img/category/90b0dc03b354777fd172ef7c078cd717.jpg', 189, '2020-09-14 12:31:54', '2020-09-14 08:31:54', b'1'),
(205, 'Cat Food', 'Cat Food', 'assets/img/category/dbd1082e45fc71e2a73eb34ddf3f5b71.jpg', 190, '2020-09-14 12:32:18', '2020-09-14 08:32:18', b'1'),
(206, 'Cooking Oil', 'Cooking Oil', 'assets/img/category/dc20b014b51d3464e483fe43b87f354c.jpg', 12, '2020-09-14 16:17:12', '2020-09-14 12:17:12', b'1'),
(207, 'Rice', 'Rice', 'assets/img/category/8e41dc771b34ec6706975b1537cd1a2c.jpg', 12, '2020-09-14 16:17:51', '2020-09-14 12:17:51', b'1'),
(208, 'Sugar & Sweeteners', 'Sugar & Sweeteners', 'assets/img/category/9110014581edbfdd67cae8fbec384479.jpg', 12, '2020-09-14 16:18:10', '2020-09-14 12:18:10', b'1'),
(209, 'Banaspati Ghee', 'Banaspati Ghee', 'assets/img/category/6cfc27c02002ea6f09fa645bbf17efc9.jpg', 12, '2020-09-14 16:18:32', '2020-09-14 12:18:32', b'1'),
(210, 'Asli Ghee', 'Asli Ghee', 'assets/img/category/62ff5697ebfb8fa202e90c516d5b3cc7.jpg', 12, '2020-09-14 16:19:34', '2020-09-14 12:19:34', b'1'),
(211, 'Daals / Pulses', 'Daals / Pulses', 'assets/img/category/a34d782122df5665bac8f2bc5d3ddb06.jpg', 12, '2020-09-14 16:19:52', '2020-09-14 12:19:52', b'1'),
(212, 'Maida & Baisen', 'Maida & Baisen', 'assets/img/category/967bb202dbfc2abee17c15113007dd06.jpg', 12, '2020-09-14 16:20:29', '2020-09-14 12:20:29', b'1'),
(213, 'Packed Spices / Masalas', 'Packed Spices / Masalas', 'assets/img/category/4aa576917adcab5a34cc06a0079b0863.jpg', 12, '2020-09-14 16:22:10', '2020-09-14 12:22:10', b'1'),
(214, 'Loose Spices / Masalas', 'Loose Spices / Masalas', 'assets/img/category/03fde329125de31d81a493a681ceaece.jpg', 12, '2020-09-14 16:22:25', '2020-09-14 12:22:25', b'1'),
(215, 'Ketchups & Chutnies', 'Ketchups & Chutnies', 'assets/img/category/f67de3552b68f9360ba071ba3c6bd2f6.jpg', 12, '2020-09-14 16:22:46', '2020-09-14 12:22:46', b'1'),
(216, 'Sauces & Vinegars', 'Sauces & Vinegars', 'assets/img/category/fa6fe1c1a43de3d8b876c4856bfd0575.jpg', 12, '2020-09-14 16:23:19', '2020-09-14 12:23:19', b'1'),
(217, 'Tea', 'Tea', 'assets/img/category/dcc5ba333d90548cfb744f0266fa9c8e.jpg', 12, '2020-09-14 16:23:32', '2020-09-14 12:23:32', b'1'),
(218, 'Coffee', 'Coffee', 'assets/img/category/f3e824c8c8a1851797dc2e7ccda56361.jpg', 12, '2020-09-14 16:24:05', '2020-09-14 12:24:05', b'1'),
(219, 'Milk', 'Milk', 'assets/img/category/15dc70086799640f96b999277ae694c3.jpg', 12, '2020-09-14 16:24:40', '2020-09-14 12:24:40', b'1'),
(220, 'Tea Whiteners', 'Tea Whiteners', 'assets/img/category/c38dec1e29832ee0a1c2fa0bce3e0288.jpg', 12, '2020-09-14 16:42:24', '2020-09-14 12:42:24', b'1'),
(221, 'Packed Cream', 'Packed Cream', 'assets/img/category/85f0168715f13cca6bfd2f1f52676462.jpg', 12, '2020-09-14 16:42:40', '2020-09-14 12:42:40', b'1'),
(222, 'Spaghetti, Pasta & Macaroni', 'Spaghetti, Pasta & Macaroni', 'assets/img/category/c67db1cc0e14487775892190be17a520.jpg', 12, '2020-09-14 16:45:30', '2020-09-14 12:45:30', b'1'),
(223, 'Baking Powder & Baking Soda', 'Baking Powder & Baking Soda', 'assets/img/category/51a22510d021906425763c197c3a3515.jpg', 12, '2020-09-14 16:45:46', '2020-09-14 12:45:46', b'1'),
(224, 'Honey', 'Honey', 'assets/img/category/4abbebf254105ca6516a3645250a4e8d.jpg', 12, '2020-09-14 16:46:03', '2020-09-14 12:46:03', b'1'),
(225, 'Cake Mixes', 'Cake Mixes', 'assets/img/category/e89c721fa90730a6d0049d0b616669fd.jpg', 12, '2020-09-14 16:47:00', '2020-09-14 12:47:00', b'1'),
(226, 'Dessert Mixes', 'Dessert Mixes', 'assets/img/category/35cdf3ddd25d720c74f8778ec19cd0cd.jpg', 12, '2020-09-14 16:47:24', '2020-09-14 12:47:24', b'1'),
(227, 'Vermicelli / Sawayian', 'Vermicelli / Sawayian', 'assets/img/category/6856621ceb0915c4e01711e34efd5bc0.jpg', 12, '2020-09-14 16:47:38', '2020-09-14 12:47:38', b'1'),
(228, 'Canned Food', 'Canned Food', 'assets/img/category/3cbefacbd05843c43b130ce503cdc533.jpg', 12, '2020-09-14 16:47:53', '2020-09-14 12:47:53', b'1'),
(229, 'Continental & Chinese Food Ingredients', 'Continental & Chinese Food Ingredients', 'assets/img/category/55171ba38f5e84c81c2d81856f8a617b.jpg', 12, '2020-09-14 16:48:46', '2020-09-14 12:48:46', b'1'),
(230, 'Biscuits', 'Biscuits', 'assets/img/category/5b188413d742394b6b5bc8653f2de5f1.jpg', 177, '2020-09-14 16:49:07', '2020-09-14 12:49:07', b'1'),
(231, 'Chips', 'Chips', 'assets/img/category/f9c0c0e2c971108e5c5722d2a14bb862.jpg', 177, '2020-09-14 16:49:21', '2020-09-14 12:49:21', b'1'),
(232, 'Jams, Jellies & Spreads', 'Jams, Jellies & Spreads', 'assets/img/category/5e6890bbb88664bdbda58c1d66821dc7.jpg', 177, '2020-09-14 16:49:36', '2020-09-14 12:49:36', b'1'),
(233, 'Instant Noodles', 'Instant Noodles', 'assets/img/category/97fd0384d5cae4c72c08e178df1b6074.jpg', 177, '2020-09-14 16:49:50', '2020-09-14 12:49:50', b'1'),
(234, 'Chocolates & Toffees', 'Chocolates & Toffees', 'assets/img/category/00fbe98a76c46faa92cdcc2ee81abb98.jpg', 177, '2020-09-14 16:50:05', '2020-09-14 12:50:05', b'1'),
(235, 'Nuggets and Other Ready to Fry Snacks', 'Nuggets and Other Ready to Fry Snacks', 'assets/img/category/92609928a8e1014eae55fb7555924959.jpg', 177, '2020-09-14 16:50:28', '2020-09-14 12:50:28', b'1'),
(236, 'Popcorn', 'Popcorn', 'assets/img/category/c3b0ed6180a09432ce66cd29351efad6.jpg', 177, '2020-09-14 16:50:40', '2020-09-14 12:50:40', b'1'),
(237, 'Eggs', 'Eggs', 'assets/img/category/2118d2909d48a65bc0317bd069896551.jpg', 178, '2020-09-14 16:51:42', '2020-09-14 12:51:42', b'1'),
(238, 'Butter', 'Butter', 'assets/img/category/c7be94ca7b459ec354c525754feb7628.jpg', 178, '2020-09-14 16:52:01', '2020-09-14 12:52:01', b'1'),
(239, 'Cheese', 'Cheese', 'assets/img/category/b649aed1e9bb19f773641336b87b7b53.jpg', 178, '2020-09-14 16:52:12', '2020-09-14 12:52:12', b'1'),
(240, 'Rusk', 'Rusk', 'assets/img/category/7b6c8fdcbc21f0f4c0c9b1a1edf86fed.jpg', 178, '2020-09-14 16:52:24', '2020-09-14 12:52:24', b'1'),
(241, 'Frozen Vegetables', 'Frozen Vegetables', 'assets/img/category/ea77f2320cb00144f7adee310bf4fc68.jpg', 178, '2020-09-14 16:54:12', '2020-09-14 12:54:12', b'1'),
(242, 'Frozen Parathas', 'Frozen Parathas', 'assets/img/category/b3d2bddbbd43c046d0a603761a4058b7.jpg', 178, '2020-09-14 16:54:29', '2020-09-14 12:54:29', b'1'),
(243, 'Packed Yogurt', 'Packed Yogurt', 'assets/img/category/ac829d3a88c24e76544e653c2e001744.jpg', 178, '2020-09-14 16:54:43', '2020-09-14 12:54:43', b'1'),
(244, 'Carbonated Drinks', 'Carbonated Drinks', 'assets/img/category/d2369ad293be0df6c4b3566b6e5e4d7d.jpg', 179, '2020-09-14 16:56:35', '2020-09-14 12:56:35', b'1'),
(245, 'Powder Drinks', 'Powder Drinks', 'assets/img/category/6b80778f9a3a9b76d0fe81d5622368d8.jpg', 179, '2020-09-14 16:56:50', '2020-09-14 12:56:50', b'1'),
(246, 'Packed Drinks', 'Packed Drinks', 'assets/img/category/e2b8925e1966670056aa7ea49a0eaa9b.jpg', 179, '2020-09-14 16:59:09', '2020-09-14 12:59:09', b'1'),
(247, 'Health Drinks', 'Health Drinks', 'assets/img/category/e69f2c917cc5868bce7aefb02dd43bc6.jpg', 179, '2020-09-14 16:59:25', '2020-09-14 12:59:25', b'1'),
(248, 'Fresh Vegetables', 'Fresh Vegetables', 'assets/img/category/ad5778588ff649116f3156b046722aac.jpg', 180, '2020-09-14 16:59:58', '2020-09-14 12:59:58', b'1'),
(249, 'Mutton', 'Mutton', 'assets/img/category/f18264585a18cffb6763f8005d4eab45.jpg', 181, '2020-09-14 17:00:35', '2020-09-14 13:00:35', b'1'),
(250, 'Chicken', 'Chicken', 'assets/img/category/1b347e556976d490741be29f9f2d9304.jpg', 181, '2020-09-14 17:31:07', '2020-09-14 13:31:07', b'1'),
(251, 'Prawns', 'Prawns', 'assets/img/category/a39ba45d0d6383226e39df6a60dbf391.jpg', 182, '2020-09-14 17:32:26', '2020-09-14 13:32:26', b'1'),
(252, 'Exotics', 'Exotics', 'assets/img/category/3ed5f5944b089b50d2d399b939dee85f.jpg', 182, '2020-09-14 17:32:51', '2020-09-14 13:32:51', b'1'),
(253, 'Toothbrush', 'Toothbrush', 'assets/img/category/296c49a72364f8d490675501924a04e5.jpg', 183, '2020-09-14 17:34:52', '2020-09-14 13:34:52', b'1'),
(254, 'Mouthwash', 'Mouthwash', 'assets/img/category/8723d21135936db8efd08472eed5973b.jpg', 183, '2020-09-14 17:39:43', '2020-09-14 13:39:43', b'1'),
(255, 'Shaving Creams & Gels', 'Shaving Creams & Gels', 'assets/img/category/f619f87a6b65e6eb9e4cb094f59fb97a.jpg', 183, '2020-09-14 17:44:06', '2020-09-14 13:44:06', b'1'),
(256, 'Razor', 'Razor', 'assets/img/category/bc6c624055cecfe80e5919194d0774fd.jpg', 183, '2020-09-14 18:37:35', '2020-09-14 14:37:35', b'1'),
(257, 'Aftershave Lotion', 'Aftershave Lotion', 'assets/img/category/e8b5468354a6bbd8ffe1141430e8d2fa.jpg', 183, '2020-09-14 18:37:54', '2020-09-14 14:37:54', b'1'),
(258, 'Facewash', 'Facewash', 'assets/img/category/56a650f8a626f31fd6a0340b3d09ed47.jpg', 183, '2020-09-14 18:38:08', '2020-09-14 14:38:08', b'0'),
(259, 'Skincare Lotions', 'Skincare Lotions', 'assets/img/category/6a1d571c74b79775f57b0a9ab39154b4.jpg', 183, '2020-09-14 18:38:27', '2020-09-14 14:38:27', b'0'),
(260, 'Deodorants', 'Deodorants', 'assets/img/category/b6a4cd6d1b76698c980ba1f05e2cea1a.jpg', 183, '2020-09-14 18:38:47', '2020-09-14 14:38:47', b'0'),
(261, 'Hair Removing Products', 'Hair Removing Products', 'assets/img/category/3d649290c84c5e23782e2f7bec7d4454.jpg', 183, '2020-09-14 18:39:09', '2020-09-14 14:39:09', b'0'),
(262, 'Cotton Buds', 'Cotton Buds', 'assets/img/category/54b5115b33514ed1f0e1be5fbb9f5158.jpg', 183, '2020-09-14 18:39:26', '2020-09-14 14:39:26', b'0'),
(263, 'Hair Dye', 'Hair Dye', 'assets/img/category/1e50f4d9155ebd155984e17cfb2ada43.jpg', 184, '2020-09-14 18:43:32', '2020-09-14 14:43:32', b'1'),
(264, 'Hair Gels', 'Hair Gels', 'assets/img/category/a5615d3d57a4108b4f0fe6f625ff3e44.jpg', 184, '2020-09-14 18:43:57', '2020-09-14 14:43:57', b'1'),
(265, 'Hair Oils', 'Hair Oils', 'assets/img/category/6bcd847f1a6b7390076a0a5f7aab0dc2.jpg', 184, '2020-09-14 18:44:14', '2020-09-14 14:44:14', b'1'),
(266, 'Anti Lice Shampoos', 'Anti Lice Shampoos', 'assets/img/category/1cb506e72ab5e7c7cdc1ad62dc836a05.jpg', 184, '2020-09-14 18:44:31', '2020-09-14 14:44:31', b'1'),
(267, 'Anti hairfall and damage repair products', 'Anti hairfall and damage repair products', 'assets/img/category/112e7b5b0fa26a54bcb6f39edde6b6f8.jpg', 184, '2020-09-14 18:44:53', '2020-09-14 14:44:53', b'1'),
(268, 'Detergents / Washing Powders', 'Detergents / Washing Powders', 'assets/img/category/8e5e4c1a635131bb6752c0c4346be1c2.jpg', 185, '2020-09-14 18:45:36', '2020-09-14 14:45:36', b'1'),
(269, 'Disinfectants & Surface Cleaners', 'Disinfectants & Surface Cleaners', 'assets/img/category/0a3b507cb4a9e6994c93ad06b42b0329.jpg', 185, '2020-09-14 18:45:55', '2020-09-14 14:45:55', b'1'),
(270, 'Toilet Roll', 'Toilet Roll', 'assets/img/category/626d6ed4add9e1fe89b130037ee9150e.jpg', 185, '2020-09-14 18:46:35', '2020-09-14 14:46:35', b'1'),
(271, 'Drain Opener', 'Drain Opener', 'assets/img/category/788ffa53b8e8f0bd21e35e3bdfa6fbe1.jpg', 185, '2020-09-14 18:46:53', '2020-09-14 14:46:53', b'1'),
(272, 'Toilet Cleaner', 'Toilet Cleaner', 'assets/img/category/7518c4b28ce77928b6cc9feaa079528b.jpg', 185, '2020-09-14 18:47:12', '2020-09-14 14:47:12', b'1'),
(273, 'Dishwashing Sponge and Steel Wire', 'Dishwashing Sponge and Steel Wire', 'assets/img/category/09eb2bdc1e6dd262e4e457a777a6c9dd.jpg', 186, '2020-09-14 18:48:06', '2020-09-14 14:48:06', b'1'),
(274, 'Kitchen Paper Towels', 'Kitchen Paper Towels', 'assets/img/category/083b37e4174ab18d0d62404d2e26b316.jpg', 186, '2020-09-14 18:48:22', '2020-09-14 14:48:22', b'1'),
(275, 'Cloth Duster', 'Cloth Duster', 'assets/img/category/b37ae65ca5f24fb33add397d6b442513.jpg', 186, '2020-09-14 18:48:39', '2020-09-14 14:48:39', b'1'),
(276, 'Aluminium Foil & Cling Wrap', 'Aluminium Foil & Cling Wrap', 'assets/img/category/bc85438f3a2c3ee70ad9df5199b05fbc.jpg', 186, '2020-09-14 18:49:47', '2020-09-14 14:49:47', b'1'),
(277, 'Garbage Bags', 'Garbage Bags', 'assets/img/category/fa154c8c5ac1ce9e22cf7493d9d2c53c.jpg', 186, '2020-09-14 18:50:07', '2020-09-14 14:50:07', b'1'),
(278, 'Matchbox', 'Matchbox', 'assets/img/category/5bb2dd93f0cc120268d6fa9a129afd2f.jpg', 186, '2020-09-14 18:50:24', '2020-09-14 14:50:24', b'1'),
(279, 'Mosquito Reppelents & Coils', 'Mosquito Reppelents & Coils', 'assets/img/category/5ae0d57e4181f895d33cb5babec9d23c.jpg', 187, '2020-09-14 18:51:59', '2020-09-14 14:51:59', b'1'),
(280, 'Glass Cleaners', 'Glass Cleaners', 'assets/img/category/13bc7dbc9b4d308ca557c38257c86f9b.jpg', 187, '2020-09-14 18:52:20', '2020-09-14 14:52:20', b'1'),
(281, 'Facial Tissues & Table Napkins', 'Facial Tissues & Table Napkins', 'assets/img/category/85f8ef5224349ace2537a8aaa195f570.jpg', 187, '2020-09-14 18:52:38', '2020-09-14 14:52:38', b'1'),
(282, 'Wood Polishing', 'Wood Polishing', 'assets/img/category/bb8bcc1b64cca66a7ec3991cae29950d.jpg', 187, '2020-09-14 18:52:57', '2020-09-14 14:52:57', b'1'),
(283, 'Anti Rust Products', 'Anti Rust Products', 'assets/img/category/daa6a8d2146964b21f7d485e1f317c9f.jpg', 187, '2020-09-14 18:54:02', '2020-09-14 14:54:02', b'1'),
(284, 'Adhesives', 'Adhesives', 'assets/img/category/f471300fdd970cfc2bde093c67f43d13.jpg', 187, '2020-09-14 18:54:51', '2020-09-14 14:54:51', b'1'),
(285, 'Shoe Care Products', 'Shoe Care Products', 'assets/img/category/62a8ff52b1080fb131c3d6a5f6b101ff.jpg', 187, '2020-09-14 18:55:09', '2020-09-14 14:55:09', b'1'),
(286, 'Broom / Jharoo', 'Broom / Jharoo', 'assets/img/category/dc4b6b6027d78cab1de54fb8235fe4f1.jpg', 187, '2020-09-14 18:55:24', '2020-09-14 14:55:24', b'1'),
(287, 'Mop / Pocha', 'Mop / Pocha', 'assets/img/category/75e1631552edc8d2dfd929fc9b36166e.jpg', 187, '2020-09-14 18:55:41', '2020-09-14 14:55:41', b'1'),
(288, 'Floor Wipe', 'Floor Wipe', 'assets/img/category/486b0519f1b2bc5bc11f9c9722498c11.jpg', 187, '2020-09-14 18:56:22', '2020-09-14 14:56:22', b'1'),
(289, 'Iron Starch Spray', 'Iron Starch Spray', 'assets/img/category/e20bbd61e270f1ba7da3f9b0299d6956.jpg', 187, '2020-09-14 18:57:06', '2020-09-14 14:57:06', b'1'),
(290, 'Scotch and Electric Tape', 'Scotch and Electric Tape', 'assets/img/category/07786b8cd11fc19b1b4877edba7ee48f.jpg', 187, '2020-09-14 18:57:31', '2020-09-14 14:57:31', b'1'),
(291, 'First Aid', 'First Aid', 'assets/img/category/cf6b5542dbbe554fd008d6b496d7a6ad.jpg', 187, '2020-09-14 18:57:48', '2020-09-14 14:57:48', b'1'),
(292, 'Extension Wire', 'Extension Wire', 'assets/img/category/a65af0103870caefb5e53e6c593b8a15.jpg', 187, '2020-09-14 18:58:29', '2020-09-14 14:58:29', b'1'),
(293, 'Fabric Softener', 'Fabric Softener', 'assets/img/category/3f97a9e83954aab17d4c293bb9b4ae63.jpg', 187, '2020-09-14 18:58:49', '2020-09-14 14:58:49', b'1'),
(294, 'Diapers', 'Diapers', 'assets/img/category/5854718795257846d056e6d472d17d5c.jpg', 188, '2020-09-14 19:00:18', '2020-09-14 15:00:18', b'0'),
(295, 'Baby Shampoos & Soaps', 'Baby Shampoos & Soaps', 'assets/img/category/9da528a7891a3d32f72bfdac9564267d.jpg', 188, '2020-09-14 19:01:33', '2020-09-14 15:01:33', b'0'),
(296, 'Baby Lotion', 'Baby Lotion', 'assets/img/category/675b469660c2c2750ed2f94c03d9f417.jpg', 188, '2020-09-14 19:01:57', '2020-09-14 15:01:57', b'0'),
(297, 'Baby Wipes', 'Baby Wipes', 'assets/img/category/d6c5484a0d3872467f820d01c8c9facc.jpg', 188, '2020-09-14 19:02:14', '2020-09-14 15:02:14', b'0'),
(298, 'Baby Food1', 'Baby Food', 'assets/img/category/7d7d111b7f409c8b1f181da268b5a34c.jpg', 188, '2020-09-14 19:03:30', '2020-09-14 15:03:30', b'0'),
(299, 'Baby Food', 'Baby Food', 'assets/img/category/449bbf2d9b21f75f5642607a45d4c5fc.jpg', 188, '2020-09-14 19:05:09', '2020-09-14 15:05:09', b'1'),
(300, 'Diapers', 'Diapers', 'assets/img/category/df289370fcd265d55fe8e01c38e141ff.jpg', 188, '2020-09-14 19:05:27', '2020-09-14 15:05:27', b'1'),
(301, 'Baby Shampoos & Soaps', 'Baby Shampoos & Soaps', 'assets/img/category/d3a63c813eda40e0de0fbb292d906ff0.jpg', 188, '2020-09-14 19:05:44', '2020-09-14 15:05:44', b'1'),
(302, 'Baby Lotion', 'Baby Lotion', 'assets/img/category/5b15c252123642495d427c2a90db925e.jpg', 188, '2020-09-14 19:06:02', '2020-09-14 15:06:02', b'1'),
(303, 'Baby Wipes', 'Baby Wipes', 'assets/img/category/32e1d57f4b7644c2988c04065367d66a.jpg', 188, '2020-09-14 19:06:18', '2020-09-14 15:06:18', b'1'),
(304, 'General Wellbeing & Food Supplements', 'General Wellbeing & Food Supplements', 'assets/img/category/9ec97391f5229b63f93f7ad22c498fd3.jpg', 189, '2020-09-14 19:07:40', '2020-09-14 15:07:40', b'1'),
(305, 'Muscular Pain Relief Balms', 'Muscular Pain Relief Balms', 'assets/img/category/cdc5765149acff7c1fd45be48945659b.jpg', 189, '2020-09-14 19:07:58', '2020-09-14 15:07:58', b'1'),
(306, 'Pain Killers', 'Pain Killers', 'assets/img/category/0c352922e0365c08a4d6015e04c9773b.jpg', 189, '2020-09-14 19:08:15', '2020-09-14 15:08:15', b'1'),
(307, 'Digestion Aid & Medication', 'Digestion Aid & Medication', 'assets/img/category/6338d473185bc2f82b997d62bce24cb0.jpg', 189, '2020-09-14 19:08:30', '2020-09-14 15:08:30', b'1'),
(308, 'Dog Food', 'Dog Food', 'assets/img/category/d9dcf1abcb24104205ddbf5ba767386d.jpg', 190, '2020-09-14 19:09:00', '2020-09-14 15:09:00', b'1'),
(309, 'Sanitizers', 'Sanitizers', 'assets/img/category/92be3f3f1c1ab7e6d2338505e92ba95b.jpg', 183, '2020-09-15 09:56:22', '2020-09-15 05:56:22', b'1'),
(310, 'Facewash', 'Facewash', 'assets/img/category/ba6cb61f880d78691d1499653d50eb9d.jpg', 183, '2020-09-15 09:56:40', '2020-09-15 05:56:40', b'1'),
(311, 'Skincare Lotions', 'Skincare Lotions', 'assets/img/category/7d2186b79870accdf0c67f11516bfafb.jpg', 183, '2020-09-15 09:57:04', '2020-09-15 05:57:04', b'1'),
(312, 'Deodorants', 'Deodorants', 'assets/img/category/d0cd45431585ab163253ee439df7d6b4.jpg', 183, '2020-09-15 09:57:21', '2020-09-15 05:57:21', b'1'),
(313, 'Hair Removing Products', 'Hair Removing Products', 'assets/img/category/82e969a1cb25a17eacd3b2723ea4ed82.jpg', 183, '2020-09-15 09:57:41', '2020-09-15 05:57:41', b'1'),
(314, 'Cotton Buds', 'Cotton Buds', 'assets/img/category/422a664aa20e6e7a9eef2612c37b44b5.jpg', 183, '2020-09-15 09:58:10', '2020-09-15 05:58:10', b'1'),
(315, 'Coconut Water', 'Coconut Water', 'assets/img/category/0458d8715f842676a7719f992448b00b.jpg', 179, '2020-09-15 10:06:12', '2020-09-15 06:06:12', b'1'),
(316, 'Anti Rust', 'Anti Rust', 'assets/img/category/ae6adb5f5140b4eb75661b8030a75a25.jpg', 187, '2020-09-15 10:09:18', '2020-09-15 06:09:18', b'0');

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
  `PreviousOrderStep` int(11) NOT NULL DEFAULT 0,
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
(34, '4d50106bfd5ab578634e', 708, '0a23f787061ec65df603d69764a420c75d3b8c6b', '2020-09-01', '2020-09-01 10:00:00', '2020-09-01 19:00:00', 16, 1, 1, '2020-09-01 12:33:22', '2020-09-01 15:33:22', b'1'),
(35, '4d50106bfd5ab578634e', 92, '3f24da7888784de88647520497221635d19673e9', '2020-09-01', '2020-09-01 10:00:00', '2020-09-01 19:00:00', 16, 3, 2, '2020-09-01 18:56:40', '2020-09-01 21:56:40', b'1'),
(36, '4d50106bfd5ab578634e', 600, 'e979ed5284ee56e8303998d85162944fb9cfa77a', '2020-09-02', '2020-09-02 10:00:00', '2020-09-02 19:00:00', 16, 4, 3, '2020-09-01 21:16:05', '2020-09-02 00:16:05', b'1'),
(37, '4d50106bfd5ab578634e', 500, 'efb2ff12746494d247097e463a3f050163325064', '2020-09-03', '2020-09-03 10:00:00', '2020-09-03 19:00:00', 16, 1, 0, '2020-09-02 12:46:57', '2020-09-02 15:46:57', b'1'),
(38, 'e4bb14c6c48d39af2132', 320, '0f9512e9760706fe44db8e67902e7238c0df7425', '2020-09-05', '2020-09-05 10:00:00', '2020-09-05 19:00:00', 23, 1, 0, '2020-09-02 14:23:50', '2020-09-02 10:23:50', b'1'),
(39, 'd5ef841eb8bd2f2bf8a2', 55, '97f131661944725160efd32f5d602c0970caeebc', '2020-09-03', '2020-09-03 10:00:00', '2020-09-03 19:00:00', 24, 2, 1, '2020-09-02 16:26:00', '2020-09-02 12:26:00', b'1'),
(40, 'd5ef841eb8bd2f2bf8a2', 217, 'c334f9741bab8a033da9515c2187301c41d30ce8', '2020-09-04', '2020-09-04 10:00:00', '2020-09-04 19:00:00', 24, 1, 0, '2020-09-04 06:07:17', '2020-09-04 02:07:17', b'1'),
(41, '485870e402584d1430da', 400, '48df8e512948665a17b1261acf9eede0ab5a9dbb', '2020-09-04', '2020-09-04 10:00:00', '2020-09-04 19:00:00', 25, 1, 0, '2020-09-04 15:15:16', '2020-09-04 11:15:16', b'1'),
(42, 'd5ef841eb8bd2f2bf8a2', 350, 'cc1208d0e66edbf16509e452a0f9eddef0729c39', '2020-09-06', '2020-09-06 10:00:00', '2020-09-06 19:00:00', 24, 4, 3, '2020-09-04 15:46:20', '2020-09-04 11:46:20', b'1'),
(43, 'd5ef841eb8bd2f2bf8a2', 140, 'd94bc1c59b146f8b2ea066b388ba26ae78caf3de', '2020-06-09', '2020-06-09 10:00:00', '2020-06-09 19:00:00', 24, 1, 0, '2020-09-06 09:16:52', '2020-09-06 05:16:52', b'1'),
(44, 'd5ef841eb8bd2f2bf8a2', 140, '17d0448975a72f842a501b5c8d94fd8e456a9656', '2020-09-11', '2020-09-11 10:00:00', '2020-09-11 19:00:00', 24, 1, 0, '2020-09-09 19:33:55', '2020-09-09 15:33:55', b'1');

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
(120, 34, 7, 1, 200, b'1', '2020-09-01 12:33:22', '2020-09-01 15:33:22'),
(121, 35, 17, 1, 92, b'1', '2020-09-01 18:56:40', '2020-09-01 21:56:40'),
(122, 36, 7, 3, 200, b'1', '2020-09-01 21:16:05', '2020-09-02 00:16:05'),
(123, 37, 7, 2, 250, b'1', '2020-09-02 12:46:57', '2020-09-02 15:46:57'),
(124, 38, 10, 1, 70, b'1', '2020-09-02 14:23:50', '2020-09-02 10:23:50'),
(125, 38, 8, 5, 50, b'1', '2020-09-02 14:23:50', '2020-09-02 10:23:50'),
(126, 39, 16, 1, 55, b'1', '2020-09-02 16:26:00', '2020-09-02 12:26:00'),
(127, 40, 16, 1, 55, b'1', '2020-09-04 06:07:17', '2020-09-04 02:07:17'),
(128, 40, 17, 1, 92, b'1', '2020-09-04 06:07:17', '2020-09-04 02:07:17'),
(129, 40, 10, 1, 70, b'1', '2020-09-04 06:07:17', '2020-09-04 02:07:17'),
(130, 41, 7, 2, 200, b'1', '2020-09-04 15:15:16', '2020-09-04 11:15:16'),
(131, 42, 21, 1, 350, b'1', '2020-09-04 15:46:20', '2020-09-04 11:46:20'),
(132, 43, 25, 1, 140, b'1', '2020-09-06 09:16:52', '2020-09-06 05:16:52'),
(133, 44, 37, 1, 140, b'1', '2020-09-09 19:33:55', '2020-09-09 15:33:55');

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
(13, '2020-08-04 23:02:12', '2020-09-02 16:21:02', '923458113142', 9970, '2020-08-04 20:02:52', b'1'),
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
(42, '2020-08-07 21:58:48', '2020-09-02 16:21:02', '923458113142', 8031, '2020-08-07 18:59:28', b'1'),
(43, '2020-08-07 22:02:42', '2020-09-02 16:21:02', '923458113142', 4245, '2020-08-07 19:03:22', b'1'),
(44, '2020-08-10 14:21:57', '2020-09-02 16:21:02', '923458113142', 8752, '2020-08-10 11:22:37', b'1'),
(45, '2020-08-10 14:22:04', '2020-09-02 16:21:02', '923458113142', 5570, '2020-08-10 11:22:44', b'1'),
(46, '2020-08-10 22:31:25', '2020-08-10 21:07:25', '923460030582', 9053, '2020-08-10 19:32:05', b'1'),
(47, '2020-08-10 22:40:15', '2020-08-10 21:07:25', '923460030582', 3877, '2020-08-10 19:40:55', b'1'),
(48, '2020-08-10 22:41:56', '2020-08-10 21:07:25', '923460030582', 3851, '2020-08-10 19:42:36', b'1'),
(49, '2020-08-10 22:49:24', '2020-08-10 21:07:25', '923460030582', 4699, '2020-08-10 19:50:04', b'1'),
(50, '2020-08-10 22:50:15', '2020-08-10 21:07:25', '923460030582', 6382, '2020-08-10 19:50:55', b'1'),
(51, '2020-08-10 22:53:57', '2020-08-10 21:07:25', '923460030582', 2045, '2020-08-10 19:54:37', b'1'),
(52, '2020-08-10 22:56:10', '2020-08-10 21:07:25', '923460030582', 9287, '2020-08-10 19:56:50', b'1'),
(53, '2020-08-11 00:04:40', '2020-09-02 16:21:02', '923458113142', 7808, '2020-08-10 21:05:20', b'1'),
(54, '2020-08-11 00:07:20', '2020-08-10 21:07:25', '923460030582', 4435, '2020-08-10 21:08:00', b'1'),
(55, '2020-08-26 16:17:32', '2020-08-26 13:17:46', '923460030561', 8197, '2020-08-26 13:18:12', b'1'),
(56, '2020-08-26 16:18:17', '2020-08-26 13:18:23', '923458118142', 5707, '2020-08-26 13:18:57', b'1'),
(57, '2020-08-26 16:18:43', '2020-09-02 16:21:02', '923458113142', 2666, '2020-08-26 13:19:23', b'1'),
(58, '2020-08-26 16:20:01', '2020-08-26 13:20:06', '923458113143', 1397, '2020-08-26 13:20:41', b'1'),
(59, '2020-08-26 17:53:29', '2020-08-26 14:53:34', '923460030584', 7557, '2020-08-26 14:54:09', b'1'),
(60, '2020-08-26 17:53:51', '2020-09-02 16:21:02', '923458113142', 8869, '2020-08-26 14:54:31', b'1'),
(61, '2020-09-01 12:30:49', '2020-09-02 16:21:02', '923458113142', 7633, '2020-09-01 09:31:29', b'1'),
(62, '2020-09-01 15:09:48', '2020-09-02 16:21:02', '923458113142', 3762, '2020-09-01 12:10:28', b'1'),
(63, '2020-09-01 20:35:12', '2020-09-02 16:21:02', '923458113142', 2244, '2020-09-01 17:35:52', b'1'),
(64, '2020-09-01 21:06:00', '2020-09-02 16:21:02', '923458113142', 3533, '2020-09-01 18:06:40', b'1'),
(65, '2020-09-02 00:04:50', '2020-09-02 16:21:02', '923458113142', 7372, '2020-09-01 21:05:30', b'1'),
(66, '2020-09-02 15:34:05', '2020-09-02 16:21:02', '923458113142', 1247, '2020-09-02 12:34:45', b'1'),
(67, '2020-09-02 10:21:35', '2020-09-02 14:21:41', '923332349682', 9106, '2020-09-02 14:22:15', b'1'),
(68, '2020-09-02 12:20:55', '2020-09-02 16:21:02', '923458113142', 8002, '2020-09-02 16:21:35', b'1'),
(69, '2020-09-02 12:20:58', '2020-09-02 16:21:02', '923458113142', 3664, '2020-09-02 16:21:38', b'1'),
(70, '2020-09-02 12:22:36', '2020-09-12 09:52:04', '923093868935', 2618, '2020-09-02 16:23:16', b'1'),
(71, '2020-09-03 07:51:24', '2020-09-12 09:52:04', '923093868935', 4754, '2020-09-03 11:52:04', b'1'),
(72, '2020-09-03 16:58:42', '2020-09-12 09:52:04', '923093868935', 2016, '2020-09-03 20:59:22', b'1'),
(73, '2020-09-03 17:18:23', '2020-09-12 09:52:04', '923093868935', 2363, '2020-09-03 21:19:03', b'1'),
(74, '2020-09-04 02:06:21', '2020-09-12 09:52:04', '923093868935', 8124, '2020-09-04 06:07:01', b'1'),
(75, '2020-09-04 02:16:38', '2020-09-12 09:52:04', '923093868935', 8090, '2020-09-04 06:17:18', b'1'),
(76, '2020-09-04 11:24:09', '2020-09-12 09:52:04', '923093868935', 2865, '2020-09-04 15:24:49', b'1'),
(77, '2020-09-04 11:26:14', '2020-09-12 09:52:04', '923093868935', 1188, '2020-09-04 15:26:54', b'1'),
(78, '2020-09-04 11:27:08', '2020-09-12 09:52:04', '923093868935', 4619, '2020-09-04 15:27:48', b'1'),
(79, '2020-09-04 12:17:51', '2020-09-12 09:52:04', '923093868935', 3912, '2020-09-04 16:18:31', b'1'),
(80, '2020-09-05 07:11:46', '2020-09-12 09:52:04', '923093868935', 9377, '2020-09-05 11:12:26', b'1'),
(81, '2020-09-05 07:13:40', '2020-09-12 09:52:04', '923093868935', 1494, '2020-09-05 11:14:20', b'1'),
(82, '2020-09-05 07:13:58', '2020-09-12 09:52:04', '923093868935', 3151, '2020-09-05 11:14:38', b'1'),
(83, '2020-09-05 07:16:23', '2020-09-12 09:52:04', '923093868935', 9934, '2020-09-05 11:17:03', b'1'),
(84, '2020-09-05 10:53:28', '2020-09-12 09:52:04', '923093868935', 9927, '2020-09-05 14:54:08', b'1'),
(85, '2020-09-05 10:57:03', '2020-09-12 09:52:04', '923093868935', 5596, '2020-09-05 14:57:43', b'1'),
(86, '2020-09-05 10:57:58', '2020-09-12 09:52:04', '923093868935', 7060, '2020-09-05 14:58:38', b'1'),
(87, '2020-09-05 10:59:16', '2020-09-12 09:52:04', '923093868935', 4734, '2020-09-05 14:59:56', b'1'),
(88, '2020-09-06 04:48:42', '2020-09-12 09:52:04', '923093868935', 6445, '2020-09-06 08:49:22', b'1'),
(89, '2020-09-06 05:16:07', '2020-09-12 09:52:04', '923093868935', 8207, '2020-09-06 09:16:47', b'1'),
(90, '2020-09-06 14:51:51', '2020-09-12 09:52:04', '923093868935', 6399, '2020-09-06 18:52:31', b'1'),
(91, '2020-09-07 06:54:44', '2020-09-12 09:52:04', '923093868935', 3085, '2020-09-07 10:55:24', b'1'),
(92, '2020-09-07 07:48:23', '2020-09-12 09:52:04', '923093868935', 2883, '2020-09-07 11:49:03', b'1'),
(93, '2020-09-07 15:03:27', '2020-09-12 09:52:04', '923093868935', 1752, '2020-09-07 19:04:07', b'1'),
(94, '2020-09-09 13:57:04', '2020-09-12 09:52:04', '923093868935', 2151, '2020-09-09 17:57:44', b'1'),
(95, '2020-09-11 13:25:23', '2020-09-12 09:52:04', '923093868935', 8621, '2020-09-11 17:26:03', b'1'),
(96, '2020-09-12 05:51:57', '2020-09-12 09:52:04', '923093868935', 4369, '2020-09-12 09:52:37', b'1');

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
(18, 'Bangon', 7, 1, 1, 75, 85, 80, b'1', 'assets/img/products/44f2be95ba0311d6467df4444594887a.jpg', '2020-08-21 19:02:46', '2020-08-21 22:02:46', b'0', b'1', 0),
(19, 'Bottle Gourd / Loki', 7, 0, 1, 50, 70, 60, b'1', 'assets/img/product.png', '2020-09-04 12:38:18', '2020-09-04 08:38:18', b'1', b'0', 1),
(20, 'Al Khubz', 12, 0, 1, 350, 370, 0, b'0', 'assets/img/product.png', '2020-09-04 13:20:25', '2020-09-04 09:20:25', b'0', b'0', 1),
(21, 'Al Khubz', 40, 1, 1, 350, 370, 350, b'1', 'assets/img/products/305ede41348d6265dc946c3c961e5bf6.jpg', '2020-09-04 14:04:56', '2020-09-04 14:06:41', b'1', b'1', 0),
(22, 'Guard Super Basmati ', 45, 1, 1, 1220, 1245, 1245, b'1', 'assets/img/products/c87ef24857f9ba524bda818850abdb5b.jpg', '2020-09-04 14:23:02', '2020-09-04 14:36:14', b'1', b'1', 30),
(23, 'Dove Shampoo', 23, 1, 1, 480, 510, 510, b'1', 'assets/img/products/c47d5261b52a03d626ce58a7da55172b.png', '2020-09-05 16:00:25', '2020-09-05 12:00:25', b'1', b'0', 1),
(24, 'Sufi Sunflower Cooking Oil 3L', 41, 1, 1, 700, 780, 780, b'1', 'assets/img/products/84ee4414ac9b2d867daa42494482047b.png', '2020-09-05 16:23:39', '2020-09-05 12:23:39', b'1', b'1', 1),
(25, 'National Biryani Masala Mix 90 Grams', 49, 1, 1, 135, 140, 140, b'1', 'assets/img/products/91debf8ced92658af8f86874d7c079d2.png', '2020-09-05 16:38:33', '2020-09-05 16:40:27', b'1', b'1', 0),
(26, 'Banana', 78, 1, 1, 120, 140, 140, b'0', 'assets/img/products/481db9a3d62f267b5f89957644c3f997.jpg', '2020-09-09 14:01:15', '2020-09-09 18:40:31', b'1', b'1', 28),
(27, 'Apple', 78, 1, 1, 120, 140, 140, b'1', 'assets/img/products/f8bee837773af8a23905c8931308f155.jpg', '2020-09-09 14:04:13', '2020-09-09 14:08:48', b'1', b'1', 0),
(28, 'Mango', 78, 1, 1, 120, 140, 140, b'1', 'assets/img/products/4c4785b769bd9a5c081f9dc1aa2259d0.jpg', '2020-09-09 18:19:43', '2020-09-09 19:49:26', b'0', b'0', 28),
(29, 'Muskmelon / Kharbooz', 78, 1, 1, 120, 140, 140, b'1', 'assets/img/products/1a99db59c851fd96e611235edbe1e364.jpg', '2020-09-09 18:32:48', '2020-09-09 14:32:48', b'0', b'0', 1),
(30, 'Galia Melon / Sarda', 78, 1, 1, 120, 140, 140, b'1', 'assets/img/products/fb63dbfa21063ef4244d718f9b3ea10a.jpg', '2020-09-09 18:36:46', '2020-09-09 14:36:46', b'0', b'0', 1),
(31, 'Grapes', 78, 1, 1, 120, 140, 140, b'1', 'assets/img/products/e67e6a9a1a94c910877ce7ead9b86418.jpg', '2020-09-09 18:39:56', '2020-09-09 19:48:50', b'0', b'0', 0),
(32, 'Banana', 78, 1, 1, 120, 140, 140, b'1', 'assets/img/products/ffc5c6d170c9ecaf76ce13eef4b29e36.jpg', '2020-09-09 18:41:42', '2020-09-09 19:49:33', b'1', b'0', 28),
(33, 'Pear', 78, 1, 1, 120, 140, 140, b'1', 'assets/img/products/13c28a787b968c33cb8e47ab79c67c76.jpg', '2020-09-09 18:45:20', '2020-09-09 14:45:20', b'0', b'0', 1),
(34, 'Peach', 78, 1, 1, 120, 140, 140, b'1', 'assets/img/products/969124638b4c11ef753354c67602e5d7.jpg', '2020-09-09 18:46:34', '2020-09-09 14:46:34', b'0', b'0', 1),
(35, 'Plum', 78, 1, 1, 120, 140, 140, b'1', 'assets/img/products/6c53b6d2ce0d4e551686855475fb506c.jpg', '2020-09-09 18:47:50', '2020-09-09 14:47:50', b'0', b'0', 1),
(36, 'Apricot ', 78, 1, 1, 120, 140, 140, b'1', 'assets/img/products/09a86760b83dda2a091b487d16d718a0.jpg', '2020-09-09 18:50:51', '2020-09-09 14:50:51', b'0', b'0', 1),
(37, 'Watermelon', 78, 1, 1, 120, 140, 140, b'1', 'assets/img/products/a0476dcfb2d38e5d195b9a0e3c3b7684.jpg', '2020-09-09 18:53:06', '2020-09-09 14:53:06', b'0', b'0', 1),
(38, 'Banana', 195, 1, 1, 130, 150, 150, b'1', 'assets/img/products/bb3112fc943f1163ad0b1d2f907694f7.jpg', '2020-09-14 12:34:29', '2020-09-14 19:14:25', b'1', b'1', 28),
(39, 'National Biryani Masala 90 Grams', 12, 1, 1, 120, 140, 140, b'1', 'assets/img/products/fd3ce4df30975a4deb785bb8031cb388.png', '2020-09-14 12:56:15', '2020-09-15 18:29:32', b'0', b'0', 23),
(40, 'Apple', 195, 1, 1, 120, 140, 140, b'1', 'assets/img/products/d54b2722de1468692a57feb7f95e1314.jpg', '2020-09-14 19:10:31', '2020-09-14 19:10:43', b'1', b'1', 28),
(41, 'Apricot', 195, 1, 1, 120, 140, 140, b'1', 'assets/img/products/9b2f269e640688bc070ba47a3db86ce5.jpg', '2020-09-14 19:11:49', '2020-09-14 19:12:02', b'1', b'1', 28),
(42, 'Dave Shampoo', 183, 1, 1, 1120, 1140, 1140, b'1', 'assets/img/products/78c7e1a1278e52f68e0ca39f05698384.png', '2020-09-14 19:13:09', '2020-09-14 15:13:09', b'1', b'0', 1),
(43, 'AA Aata', 191, 1, 1, 350, 370, 370, b'1', 'assets/img/products/b52bf4e3bd94c1974ef1ab357381dc63.jpg', '2020-09-15 14:18:34', '2020-09-15 16:02:36', b'0', b'0', 33),
(44, 'Bake Parlour Chakki Aata', 191, 1, 1, 350, 370, 370, b'1', 'assets/img/products/2c8d7044d8857a7b72fc34556a0bea0c.jpg', '2020-09-15 14:24:23', '2020-09-15 10:24:23', b'0', b'0', 1),
(45, 'Sauda Express Chakki Aata', 191, 1, 1, 350, 370, 370, b'1', 'assets/img/products/c1d5f21e2ad6e3929129eef74c992428.jpg', '2020-09-15 14:57:12', '2020-09-15 17:34:58', b'0', b'0', 28),
(46, 'Sadi Chakki Aata', 191, 1, 1, 350, 370, 370, b'1', 'assets/img/products/f782755ac38a73438ad35c96a2661812.png', '2020-09-15 15:24:34', '2020-09-15 18:29:20', b'1', b'1', 35),
(47, 'Falak Supreme', 207, 1, 1, 1215, 1265, 1265, b'1', 'assets/img/products/2f309491ef6f42bfcb618bc8ea75fab7.jpg', '2020-09-15 15:51:44', '2020-09-15 11:51:44', b'0', b'0', 1),
(48, 'Falak Extreme - 5 KG', 207, 1, 1, 1075, 1125, 1125, b'1', 'assets/img/products/173847f4c6094f21d0a95746949e613c.jpg', '2020-09-15 17:37:34', '2020-09-15 17:46:58', b'0', b'0', 37),
(49, 'Falak Extreme - 1KG', 207, 1, 1, 215, 225, 225, b'1', 'assets/img/products/4627bb33d99e92b7e48fd473ed168a26.jpg', '2020-09-15 17:45:30', '2020-09-15 13:45:30', b'0', b'0', 1);

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
(1, 'Order Placed', b'1'),
(2, 'Processing', b'1'),
(3, 'Packed', b'1'),
(4, 'Shipped', b'1'),
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
(1, 'Kg', b'1', '2020-07-16 21:02:55', '2020-07-16 12:02:55'),
(2, 'KG', b'0', '2020-07-16 21:07:05', '2020-07-16 12:07:05'),
(3, 'Gram', b'1', '2020-07-16 21:07:29', '2020-07-16 12:07:29'),
(4, 'Ml', b'1', '2020-09-02 18:07:48', '2020-09-02 14:07:48'),
(5, 'Pound', b'1', '2020-09-02 18:10:35', '2020-09-02 14:10:35'),
(6, 'Oz', b'1', '2020-09-02 18:29:38', '2020-09-02 14:29:38'),
(7, 'Lb', b'1', '2020-09-02 18:40:50', '2020-09-02 14:40:50'),
(8, 'Ton', b'1', '2020-09-02 18:42:26', '2020-09-02 14:42:26'),
(9, 'Dozen', b'1', '2020-09-04 12:28:58', '2020-09-04 08:28:58'),
(10, '500 Grams', b'1', '2020-09-04 12:32:11', '2020-09-04 08:32:11'),
(11, '5 Kg', b'1', '2020-09-04 14:25:46', '2020-09-04 10:25:46'),
(12, '10 Kg', b'1', '2020-09-04 14:26:07', '2020-09-04 10:26:07'),
(13, 'Liter', b'1', '2020-09-04 14:31:29', '2020-09-04 10:31:29');

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
(22, 'kljhasd lkfjhas dklfjh kljashd flkjhasd fkljh', '2e8e151e2435f01acc93', b'1'),
(23, 'House No 30, Area ABC , Karachi Karachi 75160', 'e4bb14c6c48d39af2132', b'1'),
(24, 'Office #6 Rao Arcade Building Gulshan-e-Hadeed Phase II, Ext.', 'd5ef841eb8bd2f2bf8a2', b'1'),
(25, '504, Marine Heights III Block 2, Clifton, Karachi', '485870e402584d1430da', b'1');

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
('485870e402584d1430da', 'Younus', 'Mohammad', 0, '', '', 1, '03460030583', 'ysandeela@yahoo.com', 'Karachi', 'Pakistan', 0, 'house 1131', ';lkasjdf'),
('0aa31209685b637af3ee', NULL, NULL, NULL, NULL, NULL, 1, '923460030582', NULL, NULL, NULL, 0, '', ''),
('feca6d9196533682d359', '', 'Mk 004', 0, '', NULL, 1, '03460030584', 'mkmughal17@gmail.com', 'Karachi', 'Pakistan', 0, 'house 1131', 'lajsdlfkj'),
('69f7be32cb243175e656', '', 'Mughal007', 0, '', NULL, 1, '03460030586', 'mkmughal17@gmail.com', 'Karachi', 'Pakistan', 0, 'house 1131', ';alksdjf'),
('dd85877dfcef5226c9c5', '', 'Muhammad KAshif', 0, '', NULL, 1, '03460030587', 'mkmughal15@gmail.com', 'Karachi', 'Pakistan', 0, 'house 1131', ';lkajsd;flkj'),
('b7b3bde542a1632f7f0d', NULL, NULL, NULL, NULL, NULL, 1, '923460030561', NULL, NULL, NULL, 0, '', ''),
('4d50106bfd5ab578634e', NULL, NULL, NULL, NULL, NULL, 1, '923458113142', NULL, NULL, NULL, 0, '', ''),
('3db0c3a36db1e14ef7c4', NULL, NULL, NULL, NULL, NULL, 1, '923460030451', NULL, NULL, NULL, 0, '', ''),
('0aefb5da0c06ad9fa8d5', NULL, NULL, NULL, NULL, NULL, 1, '923458118142', NULL, NULL, NULL, 0, '', ''),
('2e8e151e2435f01acc93', 'lkajs hf', 'jhasdlfk', NULL, NULL, '', 1, '923458113143', 'mkmughal005@mail.com', NULL, NULL, 0, '', ''),
('0f2f09017b707b0fb704', NULL, NULL, NULL, NULL, NULL, 1, '923460030584', NULL, NULL, NULL, 0, '', ''),
('e4bb14c6c48d39af2132', 'rehman', 'Abdul', NULL, NULL, '', 1, '923332349682', '9arrehman@gmail.com', NULL, NULL, 0, '', ''),
('d5ef841eb8bd2f2bf8a2', 'Aamir', 'Muhammad ', NULL, NULL, '', 1, '923093868935', 'sandilaamir@gmail.com', NULL, NULL, 0, '', '');

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
('485870e402584d1430da', '', 'e10adc3949ba59abbe56e057f20f883e', 1, '', 1),
('ad18b67943cb87181b68', 'mkmughal16@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 2, '', 1),
('feca6d9196533682d359', 'mkmughal17@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 2, '', 1),
('69f7be32cb243175e656', 'mkmughal17@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 2, '', 1),
('dd85877dfcef5226c9c5', 'mkmughal15@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 1, '', 1),
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
('0f2f09017b707b0fb704', NULL, NULL, 1, NULL, 1),
('e4bb14c6c48d39af2132', '', NULL, 1, NULL, 1),
('d5ef841eb8bd2f2bf8a2', '', NULL, 1, NULL, 1);

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
  MODIFY `AssistantId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `grocery_brand`
--
ALTER TABLE `grocery_brand`
  MODIFY `BrandId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `grocery_category`
--
ALTER TABLE `grocery_category`
  MODIFY `CategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=317;

--
-- AUTO_INCREMENT for table `grocery_order`
--
ALTER TABLE `grocery_order`
  MODIFY `OrderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `grocery_order_detail`
--
ALTER TABLE `grocery_order_detail`
  MODIFY `OrderDetailId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `grocery_otp`
--
ALTER TABLE `grocery_otp`
  MODIFY `otp_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `grocery_products`
--
ALTER TABLE `grocery_products`
  MODIFY `ProductId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `grocery_traking_steps`
--
ALTER TABLE `grocery_traking_steps`
  MODIFY `StepId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `grocery_unit`
--
ALTER TABLE `grocery_unit`
  MODIFY `UnitId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `grocery_user_address`
--
ALTER TABLE `grocery_user_address`
  MODIFY `AddressId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
