-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2020 at 08:58 PM
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
-- Table structure for table `account_2`
--

CREATE TABLE `account_2` (
  `account_id` int(11) NOT NULL,
  `account_name` varchar(40) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `parent_id` int(1) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account_2`
--

INSERT INTO `account_2` (`account_id`, `account_name`, `created_at`, `parent_id`, `status`) VALUES
(1, 'Test', '2018-11-21 20:25:08', 2, 0),
(2, 'CASH ', '2018-12-06 06:46:22', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bank_add`
--

CREATE TABLE `bank_add` (
  `bank_id` varchar(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `ac_name` varchar(250) DEFAULT NULL,
  `ac_number` varchar(250) DEFAULT NULL,
  `branch` varchar(250) DEFAULT NULL,
  `signature_pic` varchar(250) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bank_add`
--

INSERT INTO `bank_add` (`bank_id`, `bank_name`, `ac_name`, `ac_number`, `branch`, `signature_pic`, `status`) VALUES
('ATZ72KSQO9', 'SUPPLIER CHQ ', 'SUPPLIER', '111111', 'mzc', '', 1),
('9YT6HRVM7J', 'MEEZAN', 'ZEESHAN ISHAQ', '99230102212574', '9923 SHAHRAH-E-QUAIDEEN', NULL, 1),
('KSIM6TMFBM', 'BANK AL HABIB LIMITED', 'ZEESHAN ISHAQ', '10500981005838015', 'PIB', '', 1),
('QXUTI6TC88', 'HBL', 'ZEESHAN ISHAQ', '08497900444803', '9923 SHAHRAH-E-QUAIDEEN', NULL, 1),
('D2NYVM2JCO', 'BANK AL FALAH', 'ZEESHAN ISHAQ', '1003755204', 'SHARFAHBAD', NULL, 1),
('R8OUBJK6O8', 'ALLIED BANK', 'ZEESHAN ISHAQ', '000000000', 'ABCD', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bank_summary`
--

CREATE TABLE `bank_summary` (
  `bank_id` varchar(250) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deposite_id` varchar(250) DEFAULT NULL,
  `date` varchar(250) DEFAULT NULL,
  `ac_type` varchar(50) DEFAULT NULL,
  `dr` float DEFAULT NULL,
  `cr` float DEFAULT NULL,
  `ammount` float DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cheque_manger`
--

CREATE TABLE `cheque_manger` (
  `cheque_id` varchar(100) NOT NULL,
  `transection_id` varchar(100) NOT NULL,
  `customer_id` varchar(100) NOT NULL,
  `bank_id` varchar(100) NOT NULL,
  `cheque_no` varchar(100) NOT NULL,
  `date` varchar(250) DEFAULT NULL,
  `transection_type` varchar(100) NOT NULL,
  `cheque_status` int(10) NOT NULL,
  `amount` float NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
('1', 'Crown Paints', 'tabraiz@technidersolutions.com', 'Karachi Pakistan', '0321 229 40 42', 'https://www.technidersolutions.com/', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_information`
--

CREATE TABLE `customer_information` (
  `customer_id` varchar(250) NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_address` varchar(255) NOT NULL,
  `customer_mobile` varchar(100) NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  `area` varchar(100) DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  `route` varchar(35) DEFAULT NULL,
  `discount` varchar(10) DEFAULT NULL,
  `status` int(2) NOT NULL COMMENT '1=paid,2=credit',
  `credit_limit` bigint(10) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_information`
--

INSERT INTO `customer_information` (`customer_id`, `customer_name`, `customer_address`, `customer_mobile`, `customer_email`, `area`, `employee_id`, `route`, `discount`, `status`, `credit_limit`, `create_date`) VALUES
('MV3IHBNXPF7KDK9', 'AGHA PAINT (CROWN)', 'TARIQ ROAD', '', '', 'TARIQ ROAD', 4, 'Monday', '', 2, 0, '2019-07-16 06:14:36'),
('NDBHXHGC4FW6U29', 'ABDUL RAZZAQ PAINT (CROWN)', 'LYARI   ', '', '', 'LYARI', 4, 'Monday', '5', 2, 0, '2019-07-16 06:13:22'),
('49ZR1Z3U5QS3RDA', 'ABDUL HAFIZ PAINT (CROWN) 2019', 'KHANPUR/SHIKAR PUR ', '', '', 'KHANPUR/SHIKAR PUR', 4, 'Monday', '', 2, 0, '2019-07-16 06:11:33'),
('2BKRPZZLIX58KYN', 'TABREZ ANWAR', 'MANZOOR COLONY           ', '03412144890', '', 'Manzoor Colony 2', 11, 'Monday', '10', 2, 0, '2019-07-03 19:36:24'),
('QUJIHVVAIDMHZLL', 'ABBASI PAINT (CROWN)', 'AHSANABAD', '', '', 'AHSANABAD', 6, 'Monday', '', 2, 0, '2019-07-16 06:09:14'),
('11AALYWCVRWVGJ5', 'AHMED JIBRAN PAINT (DECORE)', 'JACOB LINE/LINES AREA ', '', '', 'JACOB LINE/LINES AREA', 4, 'Monday', '', 2, 0, '2019-07-16 06:17:19'),
('3LPAM7JXNIFBOFL', 'AHMED JIBRAN PAINT (CROWN)', 'JACOB LINE/LINES AREA', '', '', 'JACOB LINE/LINES AREA', 4, 'Monday', '', 2, 0, '2019-07-16 06:18:29'),
('BA8FPTKYDR9GQ5U', 'AL HAMMAD PAINT (CROWN)', 'LABOUR SQUARE', '', '', 'LABOUR SQUARE', 5, 'Monday', '', 2, 0, '2019-07-16 06:21:05'),
('4TDEC2NCZ6FO9VL', 'AL HAMZA PAINT (CROWN)', 'SHAIR PAO', '', '', 'SHAIR PAO', 6, 'Monday', '', 2, 0, '2019-07-16 06:24:51'),
('SLBCTENH9D31VDP', 'AL MAKKAH PAINT (DECORE)', 'GHAGAR PHATAK', '', '', 'GHAGAR PHATAK', 6, 'Monday', '', 2, 0, '2019-07-16 06:27:58'),
('BV1RY8EJTTTXDES', 'AL SADAF PAINT (DECORE)', 'ORANGI TOWN', '', '', 'ORANGI TOWN', 5, 'Monday', '', 2, 0, '2019-07-16 06:42:06'),
('77KZSC4KUV9LVIB', 'ANAS PAINT (CROWN)', 'NEELUM COLONY/CLIFTON', '', '', 'NEELUM COLONY/CLIFTON', 6, 'Monday', '', 2, 0, '2019-07-16 06:43:55'),
('DNIVZ3XAKEGCH69', 'ANEES PAINT (CROWN)', 'SHAIR SHAH/PANKHA HOTEL', '', '', 'SHAIR SHAH/PANKHA HOTEL', 6, 'Monday', '', 2, 0, '2019-07-16 06:49:03'),
('V41U18JOCUTDRR1', 'ARSALAN PAINT (CROWN)', 'GULZAR E HIJRI', '', '', 'GULZAR E HIJRI', 5, 'Monday', '', 2, 0, '2019-07-16 06:51:58'),
('UISD4DIRE2FWAOY', 'ASAD PAINT (CROWN)', 'MEHMOODABAD', '', '', 'MEHMOODABAD', 4, 'Monday', '', 2, 0, '2019-07-16 06:53:05'),
('9X22G85YHJSWG33', 'ASAD PAINT (DECORE)', 'MEHMODABAD', '', '', 'MEHMODABAD', 4, 'Monday', '', 2, 0, '2019-07-16 06:59:17'),
('QOW6PDCKN7AUKBO', 'AHSAN (CASH SALE)', '', '', '', '', 4, 'Monday', '', 2, 0, '2019-07-16 07:05:52'),
('MKDO7Y8D6SGSA6Q', 'ASHRAFI PAINT (CROWN)', 'ORANGI TOWN', '', '', 'ORANGI TOWN', 4, 'Monday', '', 2, 0, '2019-07-16 07:07:20'),
('KXWT3TEGX79XAHC', 'ASHRAFI PAINT (DECORE)', 'ORANGI TOWN', '', '', 'ORANGI TOWN', 4, 'Monday', '', 2, 0, '2019-07-16 07:07:41'),
('38MNDYUWUKBK8ET', 'AYAZ PAINT (DECORE)', 'ORANGI TOWN/FAREED COLONY', '', '', 'ORANGI TOWN/FAREED COLONY', 6, 'Monday', '', 2, 0, '2019-07-19 05:33:39'),
('KJUT487G75HQLHP', 'AZAM CONTRACTOR', 'KARACHI', '', '', 'KARACHI', 9, 'Monday', '', 2, 0, '2019-07-19 05:38:09'),
('YS4DFDXSLACIDAE', 'BABA PAINT (DECORE)', 'KORANGI/MEHRAN TOWN', '', '', 'KORANGI/MEHRAN TOWN', 6, 'Monday', '', 2, 0, '2019-07-19 05:39:47'),
('3YK33P8L14S5Y9C', 'BILAL AND NIZAM AGHA H/W STORE (DECORE)', 'MANGO PEER', '', '', 'MANGO PEER', 4, 'Monday', '', 2, 0, '2019-07-19 08:09:19'),
('5IOZZIHQP8FKAFA', 'BISMILLAH ASHER PAINT (DECORE)', 'RASHIDA GOTH', '', '', 'RASHIDA GOTH', 5, 'Monday', '', 2, 0, '2019-07-19 08:10:53'),
('NECGMVBTSOG3UD2', 'COLOR CENTER (DECORE)', 'JACOBABAD', '', '', 'JACOBABAD', 8, 'Monday', '', 2, 0, '2019-07-19 08:12:14'),
('25MNU8PZXKLCZF3', 'COLOR MASTER (DECORE)', 'NAZIMABAD', '', '', 'NAZIMABAD', 6, 'Monday', '', 2, 0, '2019-07-22 07:08:36'),
('NN7CK9C5RFQ7WB1', 'DANISH PAINT (DECORE) 2019', 'SUKKUR', '', '', 'SUKKUR', 8, 'Monday', '', 2, 0, '2019-07-22 07:10:25'),
('RIS8DQP1BOAF8QA', 'DANISH PAINT (CROWN) 2019', 'SUKKUR', '', '', 'SUKKUR', 8, 'Monday', '', 2, 0, '2019-07-22 07:13:02'),
('OQAHEOPY253J814', 'EHTESHAM PAINT HOUSE (DECORE)', 'LANDHI', '', '', 'LANDHI', 6, 'Monday', '', 2, 0, '2019-07-22 07:15:22'),
('3OSP7E8QCZ99TK6', 'EZZY PAINT (CROWN)', 'UP MARKET', '', '', 'UP MARKET', 4, 'Monday', '', 2, 0, '2019-07-22 07:16:52'),
('JHAZEP2H5A2M2K4', 'FAKHRI PAINTS (DECORE)', 'JOHAR', '', '', 'JOHAR', 6, 'Monday', '', 2, 0, '2019-07-22 08:03:27'),
('45C3KYSTQLTUVJ2', 'FAKHRI PAINTS (CROWN)', 'JOHAR', '', '', 'JOHAR', 6, 'Monday', '', 2, 0, '2019-07-22 08:04:00'),
('CVGUN6PWVWSZHIQ', 'FOUJI PAINT HOUSE (CROWN) 2019', 'LIBRARY CHOWK KONKOT', '', '', 'LIBRARY CHOWK KONKOT', 8, 'Monday', '', 2, 0, '2019-07-22 08:05:25'),
('OF3W3CPJTCQCOD2', 'GHAFORI PAINT (DECORE)', 'SAFORA GOTH', '', '', 'SAFORA GOTH', 5, 'Monday', '', 2, 0, '2019-07-22 08:06:48'),
('687OXE5VXUFIXVE', 'GHOSIA PAINT (CROWN)', 'ORANGI TOWN', '', '', 'ORANGI TOWN', 6, 'Monday', '', 2, 0, '2019-07-22 08:08:18'),
('5CWX5XFD8C1V6Q1', 'GHOSIA PAINT (DECORE)', 'ORANGI TOWN', '', '', 'ORANGI TOWN', 6, 'Monday', '', 2, 0, '2019-07-22 08:09:00'),
('SXBHJ5GOJNXW69G', 'HAJI SHAREEF PAINT (DECORE)', 'KORANGI', '', '', 'KORANGI', 6, 'Monday', '', 2, 0, '2019-07-22 08:10:08'),
('4HRMMUP44W8F7X5', 'HAMZA BALOCH (CROWN)', 'BAGHDADI', '', '', 'BAGHDADI', 4, 'Monday', '', 2, 0, '2019-07-22 08:12:13'),
('6UTDSEBIIIIYKX2', 'HARIS PAINT (DEORE)', 'AHSANABAD', '', '', 'AHSANABAD', 6, 'Monday', '', 2, 0, '2019-07-22 08:13:04'),
('QM37RW7NBIF1AF6', 'JHULAY LAAL PAINT HOUSE (CROWN)', 'HYDERABAD', '', '', 'HYDERABAD', 7, 'Monday', '', 2, 0, '2019-07-22 08:16:02'),
('18WKQ3AXSER23YU', 'MAAZ PAINT (DECORE)', 'MALIR', '', '', 'MALIR', 6, 'Monday', '', 2, 0, '2019-07-22 08:16:50'),
('AXUCHMCPJMXWU8H', 'MEMON PAINT (DECORE)', 'BALDIA', '', '', 'BALDIA', 6, 'Monday', '', 2, 0, '2019-07-22 08:17:52'),
('IEP21SHBOHX4KYR', 'MOHSIN NEW QADRI PAINT (CROWN)', 'MALIR/KALA BOARD', '', '', 'MALIR/KALA BOARD', 6, 'Monday', '', 2, 0, '2019-07-22 08:18:57'),
('94Z6VA5GTQG2KI8', 'MUFFADAL PAINT (OLSON)', 'BHORA PEER', '', '', 'BHORA PEER', 4, 'Monday', '', 2, 0, '2019-07-22 08:20:08'),
('2DKPK8R1DK97LHG', 'MUNEER PAINT (CROWN)', 'BALDIA TOWN', '', '', 'BALDIA TOWN', 6, 'Monday', '', 2, 0, '2019-07-22 08:21:43'),
('QPUUMJDCM4TORQO', 'MUNEER PAINT (DECORE)', 'BALDIA TOWN', '', '', 'BALDIA TOWN', 6, 'Monday', '', 2, 0, '2019-07-22 08:22:23'),
('WJZE9AANDSAX6MK', 'MUZAFFER PAINT (CROWN)', 'ORANGI TOWN', '', '', 'ORANGI TOWN', 6, 'Monday', '', 2, 0, '2019-07-22 08:23:31'),
('NNN17ELHRPJQUH4', 'MUZAFFER PAINT (DECORE)', 'ORANGI TOWN', '', '', 'ORANGI TOWN', 6, 'Monday', '', 2, 0, '2019-07-22 08:24:07'),
('Q6OLFBRD23YL6K6', 'MUZAMMIL PAINT (CROWN)', 'NAZIMABAD', '', '', 'NAZIMABAD', 6, 'Monday', '', 2, 0, '2019-07-22 08:25:04'),
('CJRWHZNMEKCV7FY', 'MUZAMMIL PAINT (DECORE)', 'NAZIMABAD', '', '', 'NAZIMABAD', 6, 'Monday', '', 2, 0, '2019-07-22 08:25:28'),
('24FKP81ZSJAKNRQ', 'NEW AL MADINA PAINT (CROWN)', 'MIRPUR MATHELO', '', '', 'MIRPUR MATHELO', 8, 'Monday', '', 2, 0, '2019-07-23 06:41:57'),
('O8723QOYZOKRVIC', 'NEW AL MADINA PAINT (OLSON)', 'MIRPUR MATHELO', '', '', 'MIRPUR MATHELO', 8, 'Monday', '', 2, 0, '2019-07-23 06:43:07'),
('ZLORIXA8XN3SOGO', 'NEW AL NOOR PAINT (CROWN)', 'KORANGI KOST GUARD ', '', '', 'KORANGI KOST GUARD', 4, 'Monday', '', 2, 0, '2019-07-24 06:38:43'),
('M62ARC8IWOBR1U6', 'NEW AL NOOR PAINT (DECORE)', 'KORANGI KOST GUARD', '', '', 'KORANGI KOST GUARD', 6, 'Monday', '', 2, 0, '2019-07-24 06:40:21'),
('C5BQWB3S74YFQ4U', 'NEW HABIB PAINT (CROWN)', 'MEHMODABAD', '', '', 'MEHMODABAD', 5, 'Monday', '', 2, 0, '2019-07-24 06:45:18'),
('JURCVTG4PMF5DJQ', 'NEW JHULAY LAL PAINT (DECORE) LARKANA', 'LARKANA', '', '', 'LARKANA', 8, 'Monday', '', 2, 0, '2019-07-24 06:49:34'),
('VZ7GLPSQ15VGRZ1', 'NEW M.A PAINT (DECORE)', 'GULSHAN E HADID', '', '', 'GULSHAN E HADID', 6, 'Monday', '', 2, 0, '2019-07-24 06:50:38'),
('2SIL6YUGVJWD5D6', 'NEW MEMON PAINT (OLSON)', 'RASHEEDABAD/BALDIA', '', '', 'RASHEEDABAD/BALDIA', 5, 'Monday', '', 2, 0, '2019-07-24 06:52:35'),
('Y55XL2MKTMKJVVI', 'NEW QURESHI PAINT (CROWN) 2019', 'LARKANA', '', '', 'LARKANA', 8, 'Monday', '', 2, 0, '2019-07-24 06:53:51'),
('UJJ1B8334CCOTNR', 'NEW QURESHI PAINT (DECORE) 2019', 'LARKANA', '', '', 'LARKANA', 8, 'Monday', '', 2, 0, '2019-07-24 06:55:53'),
('R7H6ULU41NUEGW7', 'NOOR PAINT (BISMILLAH PAINT) (CROWN)', 'LABOUR SQUARE/BALDIA TOWN', '', '', 'LABOUR SQUARE/BALDIA TOWN', 6, 'Monday', '', 2, 0, '2019-07-24 07:04:35'),
('S5X975BIV59VYYW', 'NOOR PAINT (BISMILLAH PAINT) (DECORE)', 'LABOUR SQUARE/BALDIA TOWN', '', '', 'LABOUR SQUARE/BALDIA TOWN', 5, 'Monday', '', 2, 0, '2019-07-24 07:06:38'),
('G9WWH1EQ3RYVH84', 'PRINCE ADEEL (CROWN)', 'BALDIA', '', '', 'BALDIA', 6, 'Monday', '', 2, 0, '2019-07-24 07:07:24'),
('EJFZQZRESD6SR69', 'PRINCE ADEEL (DECORE)', 'BALDIA', '', '', 'BALDIA', 6, 'Monday', '', 2, 0, '2019-07-24 07:07:56'),
('RXK9MLN36NZ1N61', 'PRINCE PAINT (CROWN) BOHRA PEER', 'BHORA PEER ', '', '', 'BHORA PEER', 4, 'Monday', '', 2, 0, '2019-07-24 07:11:13'),
('MJFELOOHS6Y93CY', 'RAJA PAINT (CROWN)', 'JACOBABAD', '', '', 'JACOBABAD', 8, 'Monday', '', 2, 0, '2019-07-24 07:12:14'),
('PABA6GOWWJ5JX9Q', 'RAJPOOT PAINT ZONE (CROWN)', 'HYDERABAD', '', '', 'HYDERABAD', 7, 'Monday', '', 2, 0, '2019-07-24 07:13:19'),
('WXQRXOAO3OHKZJE', 'RANG CORNER (DECORE)', 'MEHMODABAD  ', '', '', 'MEHMODABAD', 5, 'Wednesday', '', 2, 0, '2019-07-24 07:14:51'),
('63UUGOMUDCO8C86', 'RAO JAVED PAINT (CROWN)', 'SANGHAR', '', '', 'SANGHAR', 7, 'Monday', '', 2, 0, '2019-07-24 07:16:47'),
('J4D8NCCOXC8Q8DM', 'RAO JAVED PAINT (DECORE)', 'SANGHAR', '', '', 'SANGHAR', 7, 'Monday', '', 2, 0, '2019-07-24 07:18:06'),
('7WLOABY35X4F5KC', 'S.A PAINT (CROWN)', 'BHORA PEER ', '', '', 'BHORA PEER', 4, 'Tuesday', '', 2, 0, '2019-07-24 07:48:02'),
('MRWVWCCUGHXLDM3', 'SAAD PAINT (CROWN)', 'LANDHI', '', '', 'LANDHI', 6, 'Monday', '', 2, 0, '2019-07-24 07:49:17'),
('F4WM6D9OS6I82FY', 'SAAD PAINT (DECORE)', 'LANDHI', '', '', 'LANDHI', 6, 'Monday', '', 2, 0, '2019-07-24 07:51:34'),
('MXQI8QRDTWDCWET', 'SADIQ ALI PAINT (CROWN)', 'MALIR', '', '', 'MALIR', 6, 'Monday', '', 2, 0, '2019-07-24 07:52:14'),
('7OZB4AB88WB4K7G', 'SHAH PAINT (CROWN)', 'AZAM BASTI', '', '', 'AZAM BASTI', 4, 'Monday', '', 2, 0, '2019-07-24 07:52:34'),
('4PVK7EQQVCVY5A9', 'SHAH PAINT (DECORE)', 'AZAM BASTI', '', '', 'AZAM BASTI', 4, 'Monday', '', 2, 0, '2019-07-24 07:54:30'),
('SH34QO837TTOW29', 'SHAHEEN PAINT AND HARDWARE (CROWN)', 'LASI GOTH', '', '', 'LASI GOTH', 6, 'Monday', '', 2, 0, '2019-07-24 07:57:12'),
('8GZKU2219V6TNUM', 'SHAUKAT ALI PAINT (DECORE)', 'BALDIA NO 3', '', '', 'BALDIA NO 3', 6, 'Monday', '', 2, 0, '2019-07-24 08:05:53'),
('38ROCMUSH2NG2C1', 'SHEHZAD AL HUSSAINI PAINT (CROWN)', 'MIRPUR MATHELO', '', '', 'MIRPUR MATHELO', 8, 'Monday', '', 2, 0, '2019-07-24 08:07:26'),
('VPT1JJPFLPZ6HYT', 'SHEHZAD AL HUSSAINI PAINT (DECORE)', 'MIRPUR MATHELO', '', '', 'MIRPUR MATHELO', 8, 'Monday', '', 2, 0, '2019-07-24 08:07:56'),
('G7CLP4D7JQHMCEQ', 'SUBHAN A PAINT 2019  (CROWN)', 'HYDERABAD', '', '', 'HYDERABAD', 7, 'Monday', '', 2, 0, '2019-07-24 08:12:13'),
('R7KW3YQQYWOHD99', 'TAHIR PAINT (CROWN)', 'LANDHI NO 5', '', '', 'LANDHI NO 5', 4, 'Monday', '', 2, 0, '2019-07-24 08:15:38'),
('94UW2BWQE76UD2K', 'TAJ MUHAMMAD PAINT (CROWN)', 'MEHMODABAD', '', '', 'MEHMODABAD', 4, 'Monday', '', 2, 0, '2019-07-24 08:25:53'),
('YHUBZZOWOE2KARW', 'WAQAR CASH SALE (CROWN)', 'KARACHI', '', '', 'KARACHI', 9, 'Monday', '', 2, 0, '2019-07-24 08:28:39'),
('AOWILLV4SPO1YQA', 'WAQAR CASH SALE (OLSON)', 'KARACHI', '', '', 'KARACHI', 9, 'Monday', '', 2, 0, '2019-07-24 08:29:47'),
('5JBNA4AG3C7RVSW', 'ZAFFER PAINT (CROWN)', 'RATO DAIRO  ', '', '', 'RATO DAIRO', 8, 'Monday', '', 2, 0, '2019-07-24 08:31:26'),
('ZJPAPBSGSWGX97Y', 'ZAFFER PAINT (DECORE)', 'RATO DAIRO ', '', '', 'RATO DAIRO', 8, 'Monday', '', 2, 0, '2019-07-24 08:33:00'),
('W7GIUB34GGM92OM', 'Tabraiz Software', 'manzoor colony', '923212294042', 'tabraizanwer@yahoo.com', 'manzoor colony', 5, 'Tuesday', '10', 2, 100000, '2019-08-19 19:29:02'),
('B2EGJ7BFGRGQKT2', 'ADNAN PAINT (DECORE) 2019', 'BOHRA PEER', '', '', 'BHORA PEER', 4, 'Monday', '', 2, 0, '2020-01-14 06:46:40'),
('IYYWJWBY6N3WJ8I', 'AFZAL CASH SALE', 'SALESMAN', '', '', 'SALESMAN', 5, 'Monday', '', 2, 0, '2020-01-14 06:50:54'),
('SDPTNQTGYKLEW6O', 'AL HAMMAD PAINT (DECORE) 2020', 'LABOURE SQUARE', '', '', 'LABOUR SQUARE', 5, 'Monday', '', 2, 0, '2020-01-14 06:54:31'),
('KD9CR6RNQ2F1QC6', 'ASAD CASH SALE', 'SALESMAN', '', '', 'SALESMAN', 8, 'Monday', '', 2, 0, '2020-01-14 07:00:18'),
('B9MTWI73Q9JUGWP', 'AZIZ KHAN PAINTS (CROWN)', 'BALDIA/MUHAJIR CAMP', '', '', 'BALDIA/MUHAJIR CAMP', 5, 'Monday', '', 2, 0, '2020-01-14 07:03:06'),
('HNN7CQF1T1HWRZ6', 'BISMILLAH RIDA PAINTS (DECORE)', 'KHOPRA PARK 1 NUMBER', '', '', 'KHOPRA PARK 1 NUMBER', 5, 'Tuesday', '', 2, 0, '2020-01-14 07:06:26'),
('LHWP2PN7GFU6C5R', 'GHAZI PAINT (CR)', 'GOLIMAAR CHORANGI', '', '', 'GOLIMAAR CHORANGI', 6, 'Thursday', '', 2, 0, '2020-01-15 06:31:51'),
('JD5AXXEZZHSWT6T', 'KORANGI BISMILLAH PAINTS (CROWN)', 'KORANGI 4 NUMBER', '', '', 'KORANGI 4 NUMBER', 6, 'Monday', '', 2, 0, '2020-01-15 06:39:20'),
('BLITLVWKL7BJ7IU', 'MEHRAN PAINTS 2019/MUBASHIR', 'HYDERABAD', '', '', 'HYDERABAD', 4, 'Monday', '', 2, 0, '2020-01-15 06:48:24'),
('NCB53KET1U2LYTP', 'MUFFADAL PAINTS (CROWN) 2020', 'BOHRA PEER', '', '', 'BOHRA PEER', 4, 'Tuesday', '', 2, 0, '2020-01-15 06:53:22'),
('LLFUVVAYI6KWZQL', 'MUFFADAL PAINTS (DECORE) 2020', 'BOHRAPEER', '', '', 'BOHRAPEER', 4, 'Tuesday', '', 2, 0, '2020-01-15 06:54:21'),
('BGJKPJ526AR3SVS', 'NEW BITHAI PAINT (DECORE)', 'GULSHAN E HADID', '', '', 'GULSHAN E HADID', 6, 'Tuesday', '', 2, 0, '2020-01-15 07:05:35'),
('OBMAL5H27BFUDIK', 'NEW MAKKAH PAINT (DECORE)', 'MALIR/MODEL COLONY', '', '', 'MALIR/MODEL COLONY', 5, 'Tuesday', '', 2, 0, '2020-01-16 06:19:10'),
('JZS47FHXTASH1F9', 'NEW MEHRAN PAINT', 'HYDERABAD', '', '', 'HYDERABAD', 4, 'Thursday', '', 2, 0, '2020-01-16 06:21:52'),
('89YL59134A6FCZT', 'PANHWAR PAINTS (DECORE)', 'DADU CITY', '', '', 'DADU CITY', 8, 'Monday', '', 2, 0, '2020-01-16 06:25:23'),
('QGL9HSI279VNI51', 'QADRI PAINT (DECORE)', 'SHAH FAISAL', '', '', 'SHAH FAISAL', 6, 'Monday', '', 2, 0, '2020-01-16 06:28:20'),
('YJHRNT3XPAJWVNO', 'RIYAZ PAINT (CROWN)', 'LANDI/BAKRA PERI', '', '', 'LANDI/BAKRA PERI', 6, 'Monday', '', 2, 0, '2020-01-16 06:35:31'),
('BX2O3DUV1SNABAT', 'S.A PAINT WATER PUMP (CROWN)', 'WATER PUMP', '', '', 'WATER PUMP', 4, 'Saturday', '', 2, 0, '2020-01-16 06:41:15'),
('XHRHR5UNYI1JWSS', 'SUBHAN A PAINT (CROWN) 2020', 'HYDERABAD', '', '', 'HYDERABAD', 4, 'Thursday', '', 2, 0, '2020-01-16 06:47:43'),
('WACUGF8WY5P5QHM', 'UBAID PAINT (CROWN) 2019', 'LYARI/SHEER SHAH', '', '', 'LYARI/SHEER SHAH', 6, 'Monday', '', 2, 0, '2020-01-16 06:51:52'),
('SIA6F5CW4NVGUFF', 'UBAID PAINT (DECORE)', 'LYARI SHEER SHAH', '', '', 'LYARI SHEER SHAH', 6, 'Monday', '', 2, 0, '2020-01-16 06:53:16'),
('3381MLJKJIE85JG', 'kashif', 'hhjkhy u uyuyg', '', '', NULL, NULL, NULL, NULL, 2, NULL, '2020-03-13 13:03:04'),
('LNBTUKZBJGECAL8', 'kashif2', 'this is kashif', '', '', NULL, NULL, NULL, NULL, 2, NULL, '2020-03-13 13:15:57'),
('VSXDF4WJD1VLSTI', 'kashif3', 'kashif kashif', '', '', NULL, NULL, NULL, NULL, 2, NULL, '2020-03-13 13:23:04'),
('ECG67OQABQ4TRJG', 'kashif3', 'kashif kashif', '', '', NULL, NULL, NULL, NULL, 2, NULL, '2020-03-13 13:24:28'),
('QW2XEY1AOIER2LD', 'kashif4', 'lkasdjfi', '', '', NULL, NULL, NULL, NULL, 2, NULL, '2020-03-13 13:25:49'),
('CN9VQMXFMPXKTCV', 'kashif5', ';lkajsdf', '', '', NULL, NULL, NULL, NULL, 2, NULL, '2020-03-13 13:32:20'),
('9RTATELXYKP7F2Z', 'kashif6', ';lkajsdf', '', '', NULL, NULL, NULL, NULL, 2, NULL, '2020-03-13 13:32:58'),
('8EZ5LS2FJJTPLPN', 'kashif7', ';lkajsdf', '', '', NULL, NULL, NULL, NULL, 2, NULL, '2020-03-13 13:34:06'),
('5L7BOMHNHWWXJD2', 'kashif6', 'klasdlf', '', '', NULL, NULL, NULL, NULL, 2, NULL, '2020-03-13 13:48:07'),
('35NIPXVWF8V3FZ7', 'kashif7', 'klasdlf', '', '', NULL, NULL, NULL, NULL, 2, NULL, '2020-03-13 13:50:30'),
('MSO8E2UENBW1DBB', 'kashif8', 'klasdlf', '', '', NULL, NULL, NULL, NULL, 2, NULL, '2020-03-13 13:53:30'),
('FQPHAMGUCBU6YTM', 'kashif9', 'klasdlf', '', '', NULL, NULL, NULL, NULL, 2, NULL, '2020-03-13 13:55:20'),
('DRRU18WKK1TLTSX', 'kashif10', 'klasdlf', '', '', NULL, NULL, NULL, NULL, 2, NULL, '2020-03-13 14:00:18'),
('HJ5TITHTCLHKO9V', 'kashif11', 'klasdlf', '', '', NULL, NULL, NULL, NULL, 2, NULL, '2020-03-13 14:01:37'),
('Q5YUCTJY2US7DYQ', 'kashif12', 'lklkjasdf', '', '', NULL, NULL, NULL, NULL, 2, NULL, '2020-03-13 15:18:33'),
('2VW4OCW6GJOFX1F', 'kashif13', 'klasdlf', '', '', NULL, NULL, NULL, NULL, 2, NULL, '2020-03-13 15:57:29'),
('UDXCDI4X3Q8EA22', 'kashif14', 'klasdlf', '', '', NULL, NULL, NULL, NULL, 2, NULL, '2020-03-13 16:00:55'),
('XXZ64ZOPOX8QRBR', 'kashif15', ';lkajsf', '', '', NULL, NULL, NULL, NULL, 2, NULL, '2020-03-13 16:01:52');

-- --------------------------------------------------------

--
-- Table structure for table `customer_ledger`
--

CREATE TABLE `customer_ledger` (
  `transaction_id` varchar(100) NOT NULL,
  `customer_id` varchar(100) NOT NULL,
  `invoice_no` varchar(100) DEFAULT NULL,
  `receipt_no` varchar(50) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `cheque_no` varchar(255) NOT NULL,
  `date` varchar(250) DEFAULT NULL,
  `receipt_from` varchar(50) DEFAULT NULL,
  `status` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_ledger`
--

INSERT INTO `customer_ledger` (`transaction_id`, `customer_id`, `invoice_no`, `receipt_no`, `amount`, `description`, `payment_type`, `cheque_no`, `date`, `receipt_from`, `status`) VALUES
('283449663794519', '', '7191515983', NULL, 750, '', '', '', '2018-11-06', NULL, 1),
('43OG5QFZA2', 'NDBHXHGC4FW6U29', 'NA', NULL, 0, 'Previous adjustment of ABDUL RAZZAQ PAINT (CROWN) with software', 'NA', 'NA', '2019-07-16', NULL, 1),
('KQN3FLTDDX', 'MV3IHBNXPF7KDK9', 'NA', NULL, 0, 'Previous adjustment of AGHA PAINT (CROWN) with software', 'NA', 'NA', '2019-07-16', NULL, 1),
('AO5UYBDFRB', '49ZR1Z3U5QS3RDA', 'NA', NULL, 0, 'Previous adjustment of ABDUL HAFIZ (CROWN) 2019 with software', 'NA', 'NA', '2019-07-16', NULL, 1),
('8UKQGH47DA', '5HTAS9I5MTUDM5T', 'NA', NULL, 1000, 'Previous adjustment of Kashi with software', 'NA', 'NA', '2019-07-08', NULL, 1),
('BZBBF33MZU', 'QUJIHVVAIDMHZLL', 'NA', NULL, 0, 'Previous adjustment of ABBASI PAINT (CROWN) with software', 'NA', 'NA', '2019-07-16', NULL, 1),
('D242JXW87T', '11AALYWCVRWVGJ5', 'NA', NULL, 0, 'Previous adjustment of AHMED JIBRAN (DECORE) with software', 'NA', 'NA', '2019-07-16', NULL, 1),
('KYARBD7MA8', '3LPAM7JXNIFBOFL', 'NA', NULL, 0, 'Previous adjustment of AHMED JIBRAN PAINT (CROWN) with software', 'NA', 'NA', '2019-07-16', NULL, 1),
('KIVL1LX3HY', 'BA8FPTKYDR9GQ5U', 'NA', NULL, 0, 'Previous adjustment of AL HAMMAD PAINT (CROWN) with software', 'NA', 'NA', '2019-07-16', NULL, 1),
('JOLPPEFPDZ', '4TDEC2NCZ6FO9VL', 'NA', NULL, 0, 'Previous adjustment of AL HAMZA PAINT (CROWN) with software', 'NA', 'NA', '2019-07-16', NULL, 1),
('A1QG5S3ECY', 'SLBCTENH9D31VDP', 'NA', NULL, 0, 'Previous adjustment of AL MAKKAH PAINT (DECORE) with software', 'NA', 'NA', '2019-07-16', NULL, 1),
('ULKFXNN1J3', 'BV1RY8EJTTTXDES', 'NA', NULL, 0, 'Previous adjustment of AL SADAF PAINT (DECORE) with software', 'NA', 'NA', '2019-07-16', NULL, 1),
('GO91CF6R6R', '77KZSC4KUV9LVIB', 'NA', NULL, 0, 'Previous adjustment of ANAS PAINT (CROWN) with software', 'NA', 'NA', '2019-07-16', NULL, 1),
('B72ODZUUM4', 'DNIVZ3XAKEGCH69', 'NA', NULL, 0, 'Previous adjustment of ANEES PAINT (CROWN) with software', 'NA', 'NA', '2019-07-16', NULL, 1),
('CBM6ZRODIG', 'V41U18JOCUTDRR1', 'NA', NULL, 0, 'Previous adjustment of ARSALAN PAINT (CROWN) with software', 'NA', 'NA', '2019-07-16', NULL, 1),
('7ADF5TZ22Z', 'UISD4DIRE2FWAOY', 'NA', NULL, 0, 'Previous adjustment of ASAD PAINT (CROWN) with software', 'NA', 'NA', '2019-07-16', NULL, 1),
('QGZ1EK3EEN', '9X22G85YHJSWG33', 'NA', NULL, 0, 'Previous adjustment of ASAD PAINT (DECORE) with software', 'NA', 'NA', '2019-07-16', NULL, 1),
('JFYOMN8HKS', 'QOW6PDCKN7AUKBO', 'NA', NULL, 0, 'Previous adjustment of AHSAN (CASH SALE) with software', 'NA', 'NA', '2019-07-16', NULL, 1),
('JE36BF4LZP', 'MKDO7Y8D6SGSA6Q', 'NA', NULL, 0, 'Previous adjustment of ASHRAFI PAINT (CROWN) with software', 'NA', 'NA', '2019-07-16', NULL, 1),
('W969QRPWFE', 'KXWT3TEGX79XAHC', 'NA', NULL, 0, 'Previous adjustment of ASHRAFI PAINT (DECORE) with software', 'NA', 'NA', '2019-07-16', NULL, 1),
('688539142738543', 'MV3IHBNXPF7KDK9', '7324454159', NULL, 0, '', '', '', '2019-07-18', NULL, 1),
('JS8A39MZE7', '38MNDYUWUKBK8ET', 'NA', NULL, 0, 'Previous adjustment of AYAZ PAINT (DECORE) with software', 'NA', 'NA', '2019-07-19', NULL, 1),
('IHIECM46D7', 'KJUT487G75HQLHP', 'NA', NULL, 0, 'Previous adjustment of AZAM CONTRACTOR with software', 'NA', 'NA', '2019-07-19', NULL, 1),
('1WH4WMSH3N', 'YS4DFDXSLACIDAE', 'NA', NULL, 0, 'Previous adjustment of BABA PAINT (DECORE) with software', 'NA', 'NA', '2019-07-19', NULL, 1),
('UL9POO27F4', '3YK33P8L14S5Y9C', 'NA', NULL, 0, 'Previous adjustment of BILAL AND NIZAM AGHA H/W STORE (DECORE) with software', 'NA', 'NA', '2019-07-19', NULL, 1),
('3B4YE2VK3O', '5IOZZIHQP8FKAFA', 'NA', NULL, 0, 'Previous adjustment of BISMILLAH ASHER PAINT (DECORE) with software', 'NA', 'NA', '2019-07-19', NULL, 1),
('KR7MW4J4EI', 'NECGMVBTSOG3UD2', 'NA', NULL, 0, 'Previous adjustment of COLOR CENTER (DECORE) with software', 'NA', 'NA', '2019-07-19', NULL, 1),
('XV1KNN5JDQ', '25MNU8PZXKLCZF3', 'NA', NULL, 0, 'Previous adjustment of COLOR MASTER (DECORE) with software', 'NA', 'NA', '2019-07-22', NULL, 1),
('G599Q9TH3X', 'NN7CK9C5RFQ7WB1', 'NA', NULL, 0, 'Previous adjustment of DANISH PAINT (DECORE) 2019 with software', 'NA', 'NA', '2019-07-22', NULL, 1),
('3UQB2VU4DU', 'RIS8DQP1BOAF8QA', 'NA', NULL, 0, 'Previous adjustment of DANISH PAINT (CROWN) 2019 with software', 'NA', 'NA', '2019-07-22', NULL, 1),
('3C7DQXCUQK', 'OQAHEOPY253J814', 'NA', NULL, 0, 'Previous adjustment of EHTESHAM PAINT HOUSE (DECORE) with software', 'NA', 'NA', '2019-07-22', NULL, 1),
('BCXP8IMI7B', '3OSP7E8QCZ99TK6', 'NA', NULL, 0, 'Previous adjustment of EZZY PAINT (CROWN) with software', 'NA', 'NA', '2019-07-22', NULL, 1),
('JQ7T1YTS57', 'JHAZEP2H5A2M2K4', 'NA', NULL, 0, 'Previous adjustment of FAKHRI PAINTS (DECORE) with software', 'NA', 'NA', '2019-07-22', NULL, 1),
('WAOOH75ECU', '45C3KYSTQLTUVJ2', 'NA', NULL, 0, 'Previous adjustment of FAKHRI PAINTS (CROWN) with software', 'NA', 'NA', '2019-07-22', NULL, 1),
('A9I1EWLR2Q', 'CVGUN6PWVWSZHIQ', 'NA', NULL, 0, 'Previous adjustment of FOUJI PAINT HOUSE (CROWN) 2019 with software', 'NA', 'NA', '2019-07-22', NULL, 1),
('NPZKSJ8FHO', 'OF3W3CPJTCQCOD2', 'NA', NULL, 0, 'Previous adjustment of GHAFORI PAINT (DECORE) with software', 'NA', 'NA', '2019-07-22', NULL, 1),
('NU8U7BLNTG', '687OXE5VXUFIXVE', 'NA', NULL, 0, 'Previous adjustment of GHOSIA PAINT (CROWN) with software', 'NA', 'NA', '2019-07-22', NULL, 1),
('8HLNOU4JKE', '5CWX5XFD8C1V6Q1', 'NA', NULL, 0, 'Previous adjustment of GHOSIA PAINT (DECORE) with software', 'NA', 'NA', '2019-07-22', NULL, 1),
('QS9Z2FNL4E', 'SXBHJ5GOJNXW69G', 'NA', NULL, 0, 'Previous adjustment of HAJI SHAREEF PAINT (DECORE) with software', 'NA', 'NA', '2019-07-22', NULL, 1),
('KMDUGKWJC1', '4HRMMUP44W8F7X5', 'NA', NULL, 0, 'Previous adjustment of HAMZA BALOCH (CROWN) with software', 'NA', 'NA', '2019-07-22', NULL, 1),
('W55NLFTQOF', '6UTDSEBIIIIYKX2', 'NA', NULL, 0, 'Previous adjustment of HARIS PAINT (DEORE) with software', 'NA', 'NA', '2019-07-22', NULL, 1),
('K64I5WEJNN', 'QM37RW7NBIF1AF6', 'NA', NULL, 0, 'Previous adjustment of JHULAY LAAL PAINT HOUSE (CROWN) with software', 'NA', 'NA', '2019-07-22', NULL, 1),
('Q1XEXIG66F', '18WKQ3AXSER23YU', 'NA', NULL, 0, 'Previous adjustment of MAAZ PAINT (DECORE) with software', 'NA', 'NA', '2019-07-22', NULL, 1),
('4GDAOVGFLM', 'AXUCHMCPJMXWU8H', 'NA', NULL, 0, 'Previous adjustment of MEMON PAINT (DECORE) with software', 'NA', 'NA', '2019-07-22', NULL, 1),
('ESYCFDEWWK', 'IEP21SHBOHX4KYR', 'NA', NULL, 0, 'Previous adjustment of MOHSIN NEW QADRI PAINT (CROWN) with software', 'NA', 'NA', '2019-07-22', NULL, 1),
('G6Q74V1BOO', '94Z6VA5GTQG2KI8', 'NA', NULL, 0, 'Previous adjustment of MUFFADAL PAINT (OLSON) with software', 'NA', 'NA', '2019-07-22', NULL, 1),
('4MJNEILJSK', '2DKPK8R1DK97LHG', 'NA', NULL, 0, 'Previous adjustment of MUNEER PAINT (CROWN) with software', 'NA', 'NA', '2019-07-22', NULL, 1),
('FMXX2JZ5YN', 'QPUUMJDCM4TORQO', 'NA', NULL, 0, 'Previous adjustment of MUNEER PAINT (DECORE) with software', 'NA', 'NA', '2019-07-22', NULL, 1),
('7L8MAO1I1E', 'WJZE9AANDSAX6MK', 'NA', NULL, 0, 'Previous adjustment of MUZAFFER PAINT (CROWN) with software', 'NA', 'NA', '2019-07-22', NULL, 1),
('OC54TDDN4E', 'NNN17ELHRPJQUH4', 'NA', NULL, 0, 'Previous adjustment of MUZAFFER PAINT (DECORE) with software', 'NA', 'NA', '2019-07-22', NULL, 1),
('14C45PYLHR', 'Q6OLFBRD23YL6K6', 'NA', NULL, 0, 'Previous adjustment of MUZAMMIL PAINT (CROWN) with software', 'NA', 'NA', '2019-07-22', NULL, 1),
('ZUI82HCY5G', 'CJRWHZNMEKCV7FY', 'NA', NULL, 0, 'Previous adjustment of MUZAMMIL PAINT (DECORE) with software', 'NA', 'NA', '2019-07-22', NULL, 1),
('HCRCPIKVJC', '24FKP81ZSJAKNRQ', 'NA', NULL, 0, 'Previous adjustment of NEW AL MADINA PAINT (CROWN) with software', 'NA', 'NA', '2019-07-23', NULL, 1),
('9BYSP86PDJ', 'O8723QOYZOKRVIC', 'NA', NULL, 0, 'Previous adjustment of NEW AL MADINA PAINT (OLSON) with software', 'NA', 'NA', '2019-07-23', NULL, 1),
('V7DN6HE6CA', 'ZLORIXA8XN3SOGO', 'NA', NULL, 0, 'Previous adjustment of NEW AL NOOR PAINT (CR) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('9QILJZLDFG', 'M62ARC8IWOBR1U6', 'NA', NULL, 0, 'Previous adjustment of NEW AL NOOR PAINT (DECORE) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('LPZD7U8KGR', 'C5BQWB3S74YFQ4U', 'NA', NULL, 0, 'Previous adjustment of NEW HABIB PAINT (CROWN) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('Q39VE3BLV1', 'JURCVTG4PMF5DJQ', 'NA', NULL, 0, 'Previous adjustment of NEW JHULAY LAL PAINT (DECORE) LARKANA with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('9UER5CJ63K', 'VZ7GLPSQ15VGRZ1', 'NA', NULL, 0, 'Previous adjustment of NEW M.A PAINT (DECORE) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('AXIPIKXDFZ', '2SIL6YUGVJWD5D6', 'NA', NULL, 0, 'Previous adjustment of NEW MEMON PAINT (OLSON) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('748OYIIRLB', 'Y55XL2MKTMKJVVI', 'NA', NULL, 0, 'Previous adjustment of NEW QURESHI PAINT (CROWN) 2019 with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('7E5LGE1IYX', 'UJJ1B8334CCOTNR', 'NA', NULL, 0, 'Previous adjustment of NEW QURESHI PAINT (DECORE) 2019 with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('CEB6IH2T3E', 'R7H6ULU41NUEGW7', 'NA', NULL, 0, 'Previous adjustment of NOOR PAINT (BISMILLAH PAINT) (CROWN) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('GGJNKHW1E2', 'S5X975BIV59VYYW', 'NA', NULL, 0, 'Previous adjustment of NOOR PAINT (BISMILLAH PAINT) (DECORE) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('NGMOC21WB6', 'G9WWH1EQ3RYVH84', 'NA', NULL, 0, 'Previous adjustment of PRINCE ADEEL (CROWN) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('COOJI8ZNAL', 'EJFZQZRESD6SR69', 'NA', NULL, 0, 'Previous adjustment of PRINCE ADEEL (DECORE) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('BFEW7QS2Q5', 'RXK9MLN36NZ1N61', 'NA', NULL, 0, 'Previous adjustment of PRINCE PAINT (BHORA PEER) (CROWN) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('IJ22LYF5BS', 'MJFELOOHS6Y93CY', 'NA', NULL, 0, 'Previous adjustment of RAJA PAINT (CROWN) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('Y7JILYCBU2', 'PABA6GOWWJ5JX9Q', 'NA', NULL, 0, 'Previous adjustment of RAJPOOT PAINT ZONE (CROWN) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('5MVR33K4RI', 'WXQRXOAO3OHKZJE', 'NA', NULL, 0, 'Previous adjustment of RANG CORNER (DECORE) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('AK6SKC27A2', '63UUGOMUDCO8C86', 'NA', NULL, 0, 'Previous adjustment of RAO JAVED PAINT (CROWN) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('NCJWS1G4MD', 'J4D8NCCOXC8Q8DM', 'NA', NULL, 0, 'Previous adjustment of RAO JAVED PAINT (DECORE) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('2GSKHF74YZ', '7WLOABY35X4F5KC', 'NA', NULL, 0, 'Previous adjustment of S.A PAINT (CROWN) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('2Y47KMQKIX', 'MRWVWCCUGHXLDM3', 'NA', NULL, 0, 'Previous adjustment of SAAD PAINT (CROWN) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('JY91CWAYOT', 'F4WM6D9OS6I82FY', 'NA', NULL, 0, 'Previous adjustment of SAAD PAINT (DECORE) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('Q6J8UZEUOL', 'MXQI8QRDTWDCWET', 'NA', NULL, 0, 'Previous adjustment of SADIQ ALI PAINT (CROWN) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('YQYNC5X3ZO', '7OZB4AB88WB4K7G', 'NA', NULL, 0, 'Previous adjustment of SHAH PAINT (CROWN with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('VE79T1NPR8', '4PVK7EQQVCVY5A9', 'NA', NULL, 0, 'Previous adjustment of SHAH PAINT (DECORE) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('92MQH2Y5P1', 'SH34QO837TTOW29', 'NA', NULL, 0, 'Previous adjustment of SHAHEEN PAINT AND HARDWARE (CROWN) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('X3D4H499RV', '8GZKU2219V6TNUM', 'NA', NULL, 0, 'Previous adjustment of SHAUKAT ALI PAINT (DECORE) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('Y2A9ZZ6BXL', '38ROCMUSH2NG2C1', 'NA', NULL, 0, 'Previous adjustment of SHEHZAD AL HUSSAINI PAINT (CROWN) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('X4CI7RBZVG', 'VPT1JJPFLPZ6HYT', 'NA', NULL, 0, 'Previous adjustment of SHEHZAD AL HUSSAINI PAINT (DECORE) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('9ALWXZ4QPP', 'G7CLP4D7JQHMCEQ', 'NA', NULL, 0, 'Previous adjustment of SUBHAN A PAINT 2019  (CROWN) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('DJ5G8YXZ9H', 'R7KW3YQQYWOHD99', 'NA', NULL, 0, 'Previous adjustment of TAHIR PAINT (CROWN) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('L9OOM8MSA3', '94UW2BWQE76UD2K', 'NA', NULL, 0, 'Previous adjustment of TAJ MUHAMMAD PAINT (CROWN) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('7D8JVT6CUM', 'YHUBZZOWOE2KARW', 'NA', NULL, 0, 'Previous adjustment of WAQAR CASH SALE (CROWN) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('IB4FNAJ4VV', 'AOWILLV4SPO1YQA', 'NA', NULL, 0, 'Previous adjustment of WAQAR CASH SALE (OLSON) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('OLJD1VZQ4T', '5JBNA4AG3C7RVSW', 'NA', NULL, 0, 'Previous adjustment of ZAFEER PAINT (CROWN) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('MKW5DCIN7G', 'ZJPAPBSGSWGX97Y', 'NA', NULL, 0, 'Previous adjustment of ZAFFER PAINT (DECORE) with software', 'NA', 'NA', '2019-07-24', NULL, 1),
('IUCHLFL3XD', 'W7GIUB34GGM92OM', 'NA', NULL, 500, 'Previous adjustment of Tabraiz Software with software', 'NA', 'NA', '2019-08-19', NULL, 1),
('ITV7UJ83HB', 'B2EGJ7BFGRGQKT2', 'NA', NULL, 0, 'Previous adjustment of ADNAN PAINT (DECORE) 2019 with software', 'NA', 'NA', '2020-01-14', NULL, 1),
('LMEUOIOGFC', 'IYYWJWBY6N3WJ8I', 'NA', NULL, 0, 'Previous adjustment of AFZAL CASH SALE with software', 'NA', 'NA', '2020-01-14', NULL, 1),
('T776YKKHZ9', 'SDPTNQTGYKLEW6O', 'NA', NULL, 0, 'Previous adjustment of AL HAMMAD PAINT (DECORE) 2020 with software', 'NA', 'NA', '2020-01-14', NULL, 1),
('6KB33N86HF', 'KD9CR6RNQ2F1QC6', 'NA', NULL, 0, 'Previous adjustment of ASAD CASH SALE with software', 'NA', 'NA', '2020-01-14', NULL, 1),
('WW3XERXOOJ', 'B9MTWI73Q9JUGWP', 'NA', NULL, 0, 'Previous adjustment of AZIZ KHAN PAINTS (CROWN) with software', 'NA', 'NA', '2020-01-14', NULL, 1),
('JM2L6DW3BP', 'HNN7CQF1T1HWRZ6', 'NA', NULL, 0, 'Previous adjustment of BISMILLAH RIDA PAINTS (DECORE) with software', 'NA', 'NA', '2020-01-14', NULL, 1),
('L77BKR7YAB', 'LHWP2PN7GFU6C5R', 'NA', NULL, 0, 'Previous adjustment of GHAZI PAINT (CR) with software', 'NA', 'NA', '2020-01-15', NULL, 1),
('X8OTET6DJS', 'JD5AXXEZZHSWT6T', 'NA', NULL, 0, 'Previous adjustment of KORANGI BISMILLAH PAINTS (CROWN) with software', 'NA', 'NA', '2020-01-15', NULL, 1),
('9ORB55LWNF', 'BLITLVWKL7BJ7IU', 'NA', NULL, 0, 'Previous adjustment of MEHRAN PAINTS 2019/MUBASHIR with software', 'NA', 'NA', '2020-01-15', NULL, 1),
('B58KN4E9F5', 'NCB53KET1U2LYTP', 'NA', NULL, 0, 'Previous adjustment of MUFFADAL PAINTS (CROWN) 2020 with software', 'NA', 'NA', '2020-01-15', NULL, 1),
('MNYGRO31DW', 'LLFUVVAYI6KWZQL', 'NA', NULL, 0, 'Previous adjustment of MUFFADAL PAINTS (DECORE) 2020 with software', 'NA', 'NA', '2020-01-15', NULL, 1),
('1AL1KBWQTI', 'BGJKPJ526AR3SVS', 'NA', NULL, 0, 'Previous adjustment of NEW BITHAI PAINT (DECORE) with software', 'NA', 'NA', '2020-01-15', NULL, 1),
('PDZUPLTJV9', 'OBMAL5H27BFUDIK', 'NA', NULL, 0, 'Previous adjustment of NEW MAKKAH PAINT (DECORE) with software', 'NA', 'NA', '2020-01-16', NULL, 1),
('1QP68IP36X', 'JZS47FHXTASH1F9', 'NA', NULL, 0, 'Previous adjustment of NEW MEHRAN PAINT with software', 'NA', 'NA', '2020-01-16', NULL, 1),
('HWGB9K4Q3Y', '89YL59134A6FCZT', 'NA', NULL, 0, 'Previous adjustment of PANHWAR PAINTS (DECORE) with software', 'NA', 'NA', '2020-01-16', NULL, 1),
('O326KW2MZ8', 'QGL9HSI279VNI51', 'NA', NULL, 0, 'Previous adjustment of QADRI PAINT (DECORE) with software', 'NA', 'NA', '2020-01-16', NULL, 1),
('WBMEK1ZQIG', 'YJHRNT3XPAJWVNO', 'NA', NULL, 0, 'Previous adjustment of RIYAZ PAINT (CROWN) with software', 'NA', 'NA', '2020-01-16', NULL, 1),
('BGY9YV35XU', 'BX2O3DUV1SNABAT', 'NA', NULL, 0, 'Previous adjustment of S.A PAINT WATER PUMP (CROWN) with software', 'NA', 'NA', '2020-01-16', NULL, 1),
('TV6L5ULHEE', 'XHRHR5UNYI1JWSS', 'NA', NULL, 0, 'Previous adjustment of SUBHAN A PAINT (CROWN) 2020 with software', 'NA', 'NA', '2020-01-16', NULL, 1),
('POV1HER7Z5', 'WACUGF8WY5P5QHM', 'NA', NULL, 0, 'Previous adjustment of UBAID PAINT (CROWN) 2019 with software', 'NA', 'NA', '2020-01-16', NULL, 1),
('KJ75FZR6M2', 'SIA6F5CW4NVGUFF', 'NA', NULL, 0, 'Previous adjustment of UBAID PAINT (DECORE) with software', 'NA', 'NA', '2020-01-16', NULL, 1),
('849893311939785', '2BKRPZZLIX58KYN', '9156986164', NULL, 105, '', '', '', '2020-01-17', NULL, 1),
('732687769922761', '2BKRPZZLIX58KYN', '6769829588', NULL, 9693, '', '', '', '2020-01-31', NULL, 1),
('365772638253256', '2BKRPZZLIX58KYN', '4316319688', NULL, 25348.5, '', '', '', '2020-01-31', NULL, 1),
('574527338724739', '2BKRPZZLIX58KYN', '5489757732', NULL, 25348.5, '', '', '', '2020-01-31', NULL, 1),
('123751333792678', '2BKRPZZLIX58KYN', '1819951499', NULL, 25348.5, '', '', '', '2020-01-31', NULL, 1),
('672641424652235', '2BKRPZZLIX58KYN', '9962175281', NULL, 21551.4, '', '', '', '2020-01-31', NULL, 1),
('187672355848377', 'NDBHXHGC4FW6U29', '2688578928', NULL, 47710, '', '', '', '2020-02-04', NULL, 1),
('988163446926658', '2BKRPZZLIX58KYN', NULL, 'RFTEZL4384', 0, 'ITP', '1', '', '2020-02-05', NULL, 1),
('988163446926658', '2BKRPZZLIX58KYN', '3466495376', NULL, 2870.4, 'ITP', '1', '', '2020-02-05', NULL, 1),
('963318631993472', '2BKRPZZLIX58KYN', '7331852177', NULL, 4212, '', '', '', '2020-02-05', NULL, 1),
('187188558552568', '2BKRPZZLIX58KYN', '6481135464', NULL, 43485, 'ITP', '1', '', '2020-02-05', NULL, 1),
('187188558552568', '2BKRPZZLIX58KYN', NULL, 'A1CAOQ9K9Q', 0, 'ITP', '1', '', '2020-02-05', NULL, 1),
('925856287344835', '2BKRPZZLIX58KYN', NULL, 'ANFT3BAEWP', 0, 'ITP', '1', '', '2020-02-06', NULL, 1),
('224482227633184', 'MV3IHBNXPF7KDK9', '1431479999', NULL, 92445, '', '', '', '2020-02-06', NULL, 1),
('925856287344835', '2BKRPZZLIX58KYN', '1879621226', NULL, 214620, 'ITP', '1', '', '2020-02-06', NULL, 1),
('837711888186149', '2BKRPZZLIX58KYN', '4713463189', NULL, 384462, '', '', '', '2020-02-10', NULL, 1),
('548776199879346', '11AALYWCVRWVGJ5', '3157147418', NULL, 565020, '', '', '', '2020-02-10', NULL, 1),
('819939311953136', '2BKRPZZLIX58KYN', '1849276687', NULL, 35100, '', '', '', '2020-02-10', NULL, 1),
('851983626564121', '2BKRPZZLIX58KYN', '7865496583', NULL, 5220, '', '', '', '2020-02-10', NULL, 1),
('351232587525322', '2BKRPZZLIX58KYN', '3931374975', NULL, 3420, '', '', '', '2020-02-12', NULL, 1),
('483454281267664', '2BKRPZZLIX58KYN', '9264823623', NULL, 297495, '', '', '', '2020-02-21', NULL, 1),
('192289846353231', 'MV3IHBNXPF7KDK9', '3881723118', NULL, 16700, '', '', '', '2020-02-21', NULL, 1),
('284343843419635', 'MV3IHBNXPF7KDK9', '2984248326', NULL, 45000, '', '', '', '2020-02-22', NULL, 1),
('377721664695559', '2BKRPZZLIX58KYN', '9645315796', NULL, 88632, '', '', '', '2020-02-22', NULL, 1),
('197214266699211', 'MV3IHBNXPF7KDK9', '5693787472', NULL, 29200, '', '', '', '2020-02-22', NULL, 1),
('968252451421228', 'W7GIUB34GGM92OM', '5197693418', NULL, 26280, '', '', '', '2020-02-22', NULL, 1),
('869663719653996', 'MV3IHBNXPF7KDK9', '9196782973', NULL, 60250, '', '', '', '2020-03-12', NULL, 1),
('471771411379561', '2BKRPZZLIX58KYN', '3972884526', NULL, 23805, '', '', '', '2020-03-12', NULL, 1),
('957615996871745', 'MV3IHBNXPF7KDK9', '3619329385', NULL, 1392780, '', '', '', '2020-02-25', NULL, 1),
('977862691336684', 'MV3IHBNXPF7KDK9', '2412847742', NULL, 390, '', '', '', '2020-03-13', NULL, 1),
('284555281387959', '2BKRPZZLIX58KYN', '3971622897', NULL, 493344, '', '', '', '2020-02-28', NULL, 1),
('341423559289791', 'MV3IHBNXPF7KDK9', '3763251228', NULL, 425975, '', '', '', '2020-03-03', NULL, 1),
('723923364563494', 'NDBHXHGC4FW6U29', '6733864599', NULL, 50369, '', '', '', '2020-03-03', NULL, 1),
('753511886533287', '3381MLJKJIE85JG', '6466498531', NULL, 2900, '', '', '', '2020-03-13', NULL, 1),
('468399697897782', 'CN9VQMXFMPXKTCV', '7896534773', NULL, 0, '', '', '', '2020-03-13', NULL, 1),
('6YPSLVVELQ', 'UDXCDI4X3Q8EA22', 'NA', NULL, 0, 'Previous adjustment of  with software', 'NA', 'NA', '2020-03-13', NULL, 1),
('551264463334677', 'UDXCDI4X3Q8EA22', '5952829765', NULL, 0, '', '', '', '2020-03-13', NULL, 1),
('PK8M526WYN', 'XXZ64ZOPOX8QRBR', 'NA', NULL, 0, 'Previous adjustment of  with software', 'NA', 'NA', '2020-03-13', NULL, 1),
('718714367611732', 'XXZ64ZOPOX8QRBR', '3429359412', NULL, 40, '', '', '', '2020-03-13', NULL, 1),
('853162917948722', '49ZR1Z3U5QS3RDA', '3399711645', NULL, 59110, '', '', '', '2020-03-14', NULL, 1),
('718714367611732', 'XXZ64ZOPOX8QRBR', '3429359412', NULL, -18, 'Return', '', '', '2020-03-14', NULL, 1),
('592544212632546', 'BV1RY8EJTTTXDES', '9748329123', NULL, NULL, '', '', '', '2020-03-17', NULL, 1),
('432535661639566', 'QUJIHVVAIDMHZLL', '4912685443', NULL, 523540, '', '', '', '2020-03-17', NULL, 1),
('437324851869621', '2BKRPZZLIX58KYN', '8748689664', NULL, 9720, '', '', '', '2020-03-19', NULL, 1),
('578527763332235', '2BKRPZZLIX58KYN', '8427626115', NULL, 9720, '', '', '', '2020-03-20', NULL, 1),
('849663951529396', '2BKRPZZLIX58KYN', '1541217674', NULL, 9720, '', '', '', '2020-03-20', NULL, 1),
('635451725469924', '2BKRPZZLIX58KYN', '5293966896', NULL, 9720, '', '', '', '2020-03-20', NULL, 1),
('829576132432586', '2BKRPZZLIX58KYN', '4596957939', NULL, 14580, '', '', '', '2020-03-20', NULL, 1),
('978577999688639', '2BKRPZZLIX58KYN', '7617134952', NULL, 270, '', '', '', '2020-03-21', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_transection_history`
--

CREATE TABLE `customer_transection_history` (
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_id` varchar(100) DEFAULT NULL,
  `type` varchar(6) DEFAULT NULL,
  `amount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer_transection_summary`
--

CREATE TABLE `customer_transection_summary` (
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_id` varchar(100) DEFAULT NULL,
  `type` varchar(6) DEFAULT NULL,
  `amount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `daily_banking_add`
--

CREATE TABLE `daily_banking_add` (
  `banking_id` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `bank_id` varchar(100) NOT NULL,
  `deposit_type` varchar(255) NOT NULL,
  `transaction_type` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `amount` int(11) NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `daily_closing`
--

CREATE TABLE `daily_closing` (
  `closing_id` varchar(255) NOT NULL,
  `last_day_closing` float NOT NULL,
  `cash_in` float NOT NULL,
  `cash_out` float NOT NULL,
  `date` varchar(250) NOT NULL,
  `amount` float NOT NULL,
  `adjustment` float DEFAULT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employee_information`
--

CREATE TABLE `employee_information` (
  `employee_id` bigint(250) NOT NULL,
  `employee_name` varchar(255) DEFAULT NULL,
  `employee_address` varchar(255) NOT NULL,
  `employee_mobile` varchar(100) NOT NULL,
  `employee_vehicle` varchar(20) NOT NULL,
  `employee_email` varchar(100) NOT NULL,
  `status` int(2) NOT NULL COMMENT '1=active,0=inactive',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_information`
--

INSERT INTO `employee_information` (`employee_id`, `employee_name`, `employee_address`, `employee_mobile`, `employee_vehicle`, `employee_email`, `status`, `create_date`) VALUES
(3, 'SHAKIR RATHORE', '', '', '', '', -1, '2019-04-18 11:16:29'),
(4, 'AHSAN SHAH', '', '03000602283', '', '', 1, '2019-04-19 05:18:24'),
(5, 'AFZAAL', '', '03000602285', '', '', 1, '2019-04-19 05:21:20'),
(6, 'SHAKIR RATHORE', '', '03000602284', '', '', 1, '2019-04-19 05:23:05'),
(7, 'IMRAN KHALID', '', '03000602241', '', '', 1, '2019-04-19 05:23:32'),
(8, 'ASAD KHAN', '', '03000602286', '', '', 1, '2019-04-19 05:25:06'),
(9, 'ZEESHAN', '.', '03000602280', '', '.', 1, '2019-07-19 05:35:29'),
(10, 'SHAHEEN BHAI', '', '03000602282', '', '', 1, '2020-01-14 06:05:27'),
(11, 'kashif', 'house#11, st#22, meh, karachi', '03142031414', 'suzuki', 'mkmughal15@gmail.com', 1, '2020-01-30 19:54:47');

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
(21, 'Fresh Vegetables2', 'Fresh Vegetables2', 'assets/img/product.png', 6, '2020-07-18 18:45:26', '2020-07-18 21:45:26', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `grocery_order`
--

CREATE TABLE `grocery_order` (
  `OrderId` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `OrderValue` int(11) NOT NULL,
  `Hash` varchar(42) NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `ModifiedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `Status` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grocery_order`
--

INSERT INTO `grocery_order` (`OrderId`, `CustomerId`, `OrderValue`, `Hash`, `CreatedOn`, `ModifiedOn`, `Status`) VALUES
(7, 1, 375, '2831b4f50b42502790a0f6d18c8254ab991c7cbd', '2020-07-21 15:48:32', '2020-07-21 18:48:32', b'1'),
(8, 1, 110, '8a021a1904e46b8bca5f504108a89e902d452404', '2020-07-21 16:00:26', '2020-07-21 19:00:26', b'1');

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
(13, 0, 7, 2, 200, b'1', '2020-07-23 20:11:21', '2020-07-23 23:11:21'),
(14, 0, 7, 2, 200, b'1', '2020-07-23 20:13:19', '2020-07-23 23:13:19'),
(15, 0, 7, 2, 200, b'1', '2020-07-23 20:13:29', '2020-07-23 23:13:29'),
(16, 0, 7, 2, 200, b'1', '2020-07-23 20:13:42', '2020-07-23 23:13:42'),
(17, 0, 7, 2, 200, b'1', '2020-07-23 20:14:42', '2020-07-23 23:14:42'),
(18, 0, 7, 2, 200, b'1', '2020-07-23 20:16:12', '2020-07-23 23:16:12'),
(19, 0, 7, 2, 200, b'1', '2020-07-23 20:16:21', '2020-07-23 23:16:21'),
(20, 0, 7, 2, 200, b'1', '2020-07-23 20:20:18', '2020-07-23 23:20:18'),
(21, 0, 7, 2, 200, b'1', '2020-07-23 20:20:22', '2020-07-23 23:20:22'),
(22, 0, 7, 2, 200, b'1', '2020-07-23 20:20:37', '2020-07-23 23:20:37'),
(23, 0, 7, 2, 200, b'1', '2020-07-23 20:21:26', '2020-07-23 23:21:26'),
(24, 0, 7, 2, 200, b'1', '2020-07-23 20:21:33', '2020-07-23 23:21:33'),
(25, 0, 7, 2, 200, b'1', '2020-07-23 20:21:39', '2020-07-23 23:21:39'),
(26, 0, 7, 2, 200, b'1', '2020-07-23 20:21:43', '2020-07-23 23:21:43'),
(27, 0, 7, 2, 200, b'1', '2020-07-23 20:22:27', '2020-07-23 23:22:27'),
(28, 0, 7, 2, 200, b'1', '2020-07-23 20:22:31', '2020-07-23 23:22:31'),
(29, 0, 7, 2, 200, b'1', '2020-07-23 20:22:36', '2020-07-23 23:22:36'),
(30, 0, 7, 2, 200, b'1', '2020-07-23 20:22:43', '2020-07-23 23:22:43'),
(31, 0, 7, 2, 200, b'1', '2020-07-23 20:22:50', '2020-07-23 23:22:50'),
(32, 0, 7, 2, 200, b'1', '2020-07-23 20:22:57', '2020-07-23 23:22:57'),
(33, 0, 7, 2, 200, b'1', '2020-07-23 20:23:36', '2020-07-23 23:23:36'),
(34, 0, 7, 2, 200, b'1', '2020-07-23 20:24:12', '2020-07-23 23:24:12'),
(35, 0, 7, 2, 200, b'1', '2020-07-23 20:24:32', '2020-07-23 23:24:32'),
(36, 0, 7, 2, 200, b'1', '2020-07-23 20:25:22', '2020-07-23 23:25:22'),
(37, 0, 7, 2, 200, b'1', '2020-07-23 20:25:25', '2020-07-23 23:25:25'),
(38, 0, 7, 2, 200, b'1', '2020-07-23 20:26:31', '2020-07-23 23:26:31'),
(39, 0, 7, 2, 200, b'1', '2020-07-23 20:27:01', '2020-07-23 23:27:01'),
(40, 0, 7, 2, 200, b'1', '2020-07-23 20:27:21', '2020-07-23 23:27:21'),
(41, 0, 7, 2, 200, b'1', '2020-07-23 20:27:45', '2020-07-23 23:27:45'),
(42, 0, 7, 2, 200, b'1', '2020-07-23 20:28:04', '2020-07-23 23:28:04'),
(43, 0, 7, 2, 200, b'1', '2020-07-23 20:28:22', '2020-07-23 23:28:22'),
(44, 0, 7, 2, 200, b'1', '2020-07-23 20:28:54', '2020-07-23 23:28:54'),
(45, 0, 7, 2, 200, b'1', '2020-07-23 20:29:20', '2020-07-23 23:29:20'),
(46, 0, 7, 2, 200, b'1', '2020-07-23 20:29:43', '2020-07-23 23:29:43'),
(47, 0, 7, 2, 200, b'1', '2020-07-23 20:30:09', '2020-07-23 23:30:09'),
(48, 0, 7, 2, 200, b'1', '2020-07-23 20:32:04', '2020-07-23 23:32:04'),
(49, 0, 7, 2, 200, b'1', '2020-07-23 20:32:23', '2020-07-23 23:32:23'),
(50, 0, 7, 2, 200, b'1', '2020-07-23 20:32:34', '2020-07-23 23:32:34'),
(51, 0, 7, 2, 200, b'1', '2020-07-23 20:34:07', '2020-07-23 23:34:07'),
(52, 0, 7, 2, 200, b'1', '2020-07-23 20:35:19', '2020-07-23 23:35:19'),
(53, 0, 7, 2, 200, b'1', '2020-07-23 20:37:01', '2020-07-23 23:37:01'),
(54, 0, 7, 2, 200, b'1', '2020-07-23 20:39:48', '2020-07-23 23:39:48'),
(55, 0, 7, 2, 200, b'1', '2020-07-23 20:41:22', '2020-07-23 23:41:22'),
(56, 0, 7, 2, 200, b'1', '2020-07-23 20:44:57', '2020-07-23 23:44:57'),
(57, 0, 7, 2, 200, b'1', '2020-07-23 20:45:16', '2020-07-23 23:45:16'),
(58, 0, 7, 2, 200, b'1', '2020-07-23 20:48:06', '2020-07-23 23:48:06'),
(59, 0, 7, 2, 200, b'1', '2020-07-23 20:49:27', '2020-07-23 23:49:27'),
(60, 0, 3, 2, 150, b'1', '2020-07-23 20:50:11', '2020-07-23 23:50:11'),
(61, 0, 5, 1, 45, b'1', '2020-07-23 20:50:11', '2020-07-23 23:50:11'),
(62, 0, 3, 2, 150, b'1', '2020-07-23 20:52:00', '2020-07-23 23:52:00'),
(63, 0, 5, 1, 45, b'1', '2020-07-23 20:52:00', '2020-07-23 23:52:00'),
(64, 0, 3, 2, 150, b'1', '2020-07-23 20:53:07', '2020-07-23 23:53:07'),
(65, 0, 5, 1, 45, b'1', '2020-07-23 20:53:07', '2020-07-23 23:53:07');

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

INSERT INTO `grocery_products` (`ProductId`, `ProductName`, `Category`, `Unit`, `UnitId`, `Price`, `SalePrice`, `Status`, `ProductImg`, `CreatedOn`, `ModifiedOn`, `IsFeatured`, `IsHot`, `Brand`) VALUES
(1, 'Banana', 8, 1, 1, 60, 55, b'1', 'assets/img/products/banana.png', '2020-07-14 00:00:00', '2020-07-14 00:00:00', b'1', b'0', 1),
(2, 'Cauliflower', 7, 1, 1, 35, 35, b'1', 'assets/img/products/cauliflower.png', '2020-07-14 21:29:05', '2020-07-14 21:29:05', b'0', b'0', 1),
(3, 'Orange', 8, 1, 1, 200, 150, b'1', 'assets/img/products/orange.png', '2020-07-14 21:30:04', '2020-07-14 21:30:04', b'1', b'0', 1),
(5, 'Tomato', 7, 1, 1, 56, 45, b'1', 'assets/img/products/Tomato.png', '2020-07-14 21:31:52', '2020-07-14 21:31:52', b'1', b'0', 1),
(6, 'Grapes', 8, 1, 1, 400, 400, b'1', 'assets/img/products/grapes.png', '2020-07-14 23:21:22', '2020-07-14 23:21:22', b'1', b'0', 1),
(7, 'Apple', 8, 1, 1, 250, 200, b'1', 'assets/img/products/apple.jpg', '2020-07-14 23:22:12', '2020-07-14 23:22:12', b'1', b'0', 1),
(8, 'Onion', 7, 1, 1, 50, 50, b'1', 'assets/img/products/onion.jpg', '2020-07-14 23:44:31', '2020-07-14 23:44:31', b'0', b'0', 1),
(10, 'Ginger', 7, 1, 1, 80, 70, b'1', 'assets/img/products/ginger.png', '2020-07-15 12:38:57', '2020-07-15 15:38:57', b'1', b'0', 1),
(11, 'Cucumber', 7, 1, 1, 80, 70, b'0', 'assets/img/product/cucumber.jpg', '2020-07-15 12:39:58', '2020-07-15 15:39:58', b'0', b'0', 1),
(16, 'Potato', 7, 1, 1, 50, 55, b'1', 'assets/img/products/2867b5b52ad4b082fae0ee4750924eb5.jpg', '2020-07-16 08:11:55', '2020-07-15 23:11:55', b'1', b'1', 1);

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
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` varchar(100) NOT NULL,
  `customer_id` varchar(100) NOT NULL,
  `date` varchar(50) DEFAULT NULL,
  `total_amount` float NOT NULL,
  `invoice` varchar(255) NOT NULL,
  `invoice_discount` float DEFAULT NULL COMMENT 'invoice discount',
  `total_discount` float DEFAULT NULL COMMENT 'total invoice discount',
  `total_tax` float DEFAULT NULL,
  `invoice_details` text NOT NULL,
  `vehicle` varchar(10) NOT NULL DEFAULT 'Bike',
  `delivery_challan` varchar(50) NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `customer_id`, `date`, `total_amount`, `invoice`, `invoice_discount`, `total_discount`, `total_tax`, `invoice_details`, `vehicle`, `delivery_challan`, `status`) VALUES
('7191515983', '', '2018-11-06', 750, '1000', 0, 0, 0, '', 'Bike', '', 1),
('4596957939', '2BKRPZZLIX58KYN', '2020-03-20', 14580, '1006', 0, 1620, 0, '', 'Bike', '22', 0),
('7617134952', '2BKRPZZLIX58KYN', '2020-03-21', 270, '1007', 0, 30, 0, '', 'Bike', '123', 1),
('7212258431', '49ZR1Z3U5QS3RDA', '2020-03-14', 3054150, '1005', 0, 0, 0, '', 'Bike', '1561', 1),
('6899965874', '2BKRPZZLIX58KYN', '2020-03-21', 269549, '1008', 0, 29921, 0, '', 'Bike', '123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

CREATE TABLE `invoice_details` (
  `invoice_details_id` varchar(100) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `product_uuid` int(11) NOT NULL DEFAULT -1,
  `quantity` float NOT NULL,
  `rate` float NOT NULL,
  `supplier_rate` float DEFAULT NULL,
  `total_price` float NOT NULL,
  `discount` float DEFAULT NULL,
  `discount_per` varchar(15) DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `paid_amount` float DEFAULT 0,
  `due_amount` float NOT NULL DEFAULT 0,
  `status` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice_details`
--

INSERT INTO `invoice_details` (`invoice_details_id`, `invoice_id`, `product_id`, `product_uuid`, `quantity`, `rate`, `supplier_rate`, `total_price`, `discount`, `discount_per`, `tax`, `paid_amount`, `due_amount`, `status`) VALUES
('444746717894487', '7191515983', '19266228', 1, 5, 150, 140, 750, 0, '', 0, 250, 500, 1),
('978175383351449', '6899965874', 'Q826', 80, 1, 390, NULL, 390, 39, '10', 0, 0, 269549, 0),
('172118766848323', '6899965874', 'G823', 3982, 3, 5400, NULL, 16200, 1620, '10', 0, 0, 269549, 0),
('947432746769435', '6899965874', 'Q823', 3981, 2, 375, NULL, 750, 75, '10', 0, 0, 269549, 0),
('656736483656777', '6899965874', 'G823', 3980, 1, 1390, NULL, 1390, 139, '10', 0, 0, 269549, 0),
('672828687988677', '6899965874', 'G822', 3965, 3, 1390, NULL, 1390, 139, '10', 0, 0, 269549, 0),
('652468522963191', '6899965874', 'Q822', 3966, 1, 375, NULL, 375, 37.5, '10', 0, 0, 269549, 0),
('592179236237992', '6899965874', 'D821', 3983, 1, 1390, NULL, 1390, 139, '10', 0, 0, 269549, 0),
('412616227877133', '6899965874', 'Q821', 3984, 2, 375, NULL, 750, 75, '10', 0, 0, 269549, 0),
('894753821877658', '6899965874', 'D821', 3985, 1, 5400, NULL, 5400, 540, '10', 0, 0, 269549, 0),
('131952328449445', '6899965874', 'D822', 3967, 3, 5400, NULL, 16200, 1620, '10', 0, 0, 269549, 0),
('141211529712148', '6899965874', 'D820', 3970, 1, 5400, NULL, 5400, 540, '10', 0, 0, 269549, 0),
('423134392478355', '6899965874', 'G820', 3968, 2, 1390, NULL, 2780, 278, '10', 0, 0, 269549, 0),
('129924997926683', '7212258431', 'G3033', 4187, -4, 2600, NULL, -8800, 0, NULL, 0, -40980, 0, 1),
('286154344881853', '7212258431', 'G800', 3995, -2, 1390, NULL, -2780, 0, NULL, 0, -40980, 0, 1),
('981479726715653', '7212258431', 'Q850', 1851, -3, 300, NULL, -900, 0, NULL, 0, -40980, 0, 1),
('989765638571973', '7212258431', 'Q854', 3921, -4, 375, NULL, -1500, 0, NULL, 0, -40980, 0, 1),
('226315125489611', '7212258431', 'D800', 3997, -5, 5400, NULL, -27000, 0, NULL, 0, -40980, 0, 1),
('824929489316716', '6899965874', 'Q820', 3969, 3, 375, NULL, 375, 37.5, '10', 0, 0, 269549, 0),
('897125176899445', '6899965874', 'G818', 3974, 2, 375, NULL, 4170, 417, '10', 0, 0, 269549, 0),
('942341536153286', '6899965874', 'D818', 3975, 1, 375, NULL, 375, 37.5, '10', 0, 0, 269549, 0),
('343789742286762', '6899965874', 'Q819', 3972, 1, 375, NULL, 375, 37.5, '10', 0, 0, 269549, 0),
('766585724541223', '6899965874', 'G819', 3971, 1, 375, NULL, 1390, 139, '10', 0, 0, 269549, 0),
('496414475354537', '6899965874', 'D819', 3973, 3, 5400, NULL, 16200, 1620, '10', 0, 0, 269549, 0),
('484163767968981', '6899965874', 'D807', 4021, 1, 375, NULL, 5400, 540, '10', 0, 0, 269549, 0),
('112553797398737', '6899965874', 'G817', 3989, 3, 1390, NULL, 4170, 417, '10', 0, 0, 269549, 0),
('349355656817243', '6899965874', 'D818', 3976, 2, 1390, NULL, 10800, 1080, '10', 0, 0, 269549, 0),
('432629748344338', '6899965874', 'Q807', 4020, 2, 1390, NULL, 1125, 112.5, '10', 0, 0, 269549, 0),
('294568368662969', '6899965874', 'G807', 4019, 1, 5400, NULL, 2780, 278, '10', 0, 0, 269549, 0),
('391824254432678', '6899965874', 'G806', 4016, 2, 375, NULL, 1390, 139, '10', 0, 0, 269549, 0),
('194576181887711', '6899965874', 'Q806', 4017, 5, 1390, NULL, 750, 75, '10', 0, 0, 269549, 0),
('219652554984869', '6899965874', 'G805', 4028, 3, 375, NULL, 1390, 139, '10', 0, 0, 269549, 0),
('151924495131671', '6899965874', 'D806', 4018, 2, 5400, NULL, 5400, 540, '10', 0, 0, 269549, 0),
('359386847988282', '6899965874', 'Q805', 4029, 1, 1390, NULL, 750, 75, '10', 0, 0, 269549, 0),
('371364187516182', '6899965874', 'Gkey02', 4556, 3, 1390, NULL, 260, 0.01, '10', 0, 0, 269549, 0),
('456861489791268', '6899965874', 'D805', 4030, 2, 5400, NULL, 5400, 540, '10', 0, 0, 269549, 0),
('867259234898677', '6899965874', 'G815', 3998, 1, 375, NULL, 5560, 556, '10', 0, 0, 269549, 0),
('232476413481648', '6899965874', 'Q814', 3987, 2, 1450, NULL, 750, 75, '10', 0, 0, 269549, 0),
('174332169373453', '6899965874', 'D801', 4012, 3, 0, NULL, 5400, 540, '10', 0, 0, 269549, 0),
('648544646296322', '6899965874', 'G801', 4010, 4, 390, NULL, 1390, 139, '10', 0, 0, 269549, 0),
('145974392964817', '6899965874', 'D813', 3994, 3, 0, NULL, 21600, 2160, '10', 0, 0, 269549, 0),
('925146157788156', '6899965874', 'D811', 237, 2, 0, NULL, 0, 0, '10', 0, 0, 269549, 0),
('889813135174511', '6899965874', 'Q801', 4011, 3, 0, NULL, 375, 37.5, '10', 0, 0, 269549, 0),
('839811839841736', '6899965874', 'G816', 70, 2, 1500, NULL, 4350, 435, '10', 0, 0, 269549, 0),
('441112992978619', '6899965874', 'Q816', 4080, 3, 1500, NULL, 820, 82, '10', 0, 0, 269549, 0),
('743434186831332', '6899965874', 'D816', 4081, 2, 5400, NULL, 0, 0, '10', 0, 0, 269549, 0),
('552536187929893', '6899965874', 'D816', 58, 3, 0, NULL, 0, 0, '10', 0, 0, 269549, 0),
('128625185583917', '6899965874', 'Q816', 69, 1, 410, NULL, 780, 78, '10', 0, 0, 269549, 0),
('587781368933138', '6899965874', 'D814', 3988, 4, 1450, NULL, 5400, 540, '10', 0, 0, 269549, 0),
('925265725721434', '6899965874', 'D815', 4000, 1, 390, NULL, 10800, 1080, '10', 0, 0, 269549, 0),
('214852522385341', '6899965874', 'Q815', 3999, 4, 0, NULL, 375, 37.5, '10', 0, 0, 269549, 0),
('813629536751231', '7617134952', 'Gkashif005a', 4587, 2, 150, NULL, 300, 0.01, '10', 0, 0, 270, 1),
('464999952219833', '7212258431', 'Q3030', 4182, 2, 700, NULL, 1400, 0, '', 0, 0, 3054150, 0),
('314327912462772', '7212258431', 'Q3008', 4104, 2, 690, NULL, 1380, 0, '', 0, 0, 3054150, 0),
('585237452231459', '6899965874', 'G814', 3986, 4, 390, NULL, 2780, 278, '10', 0, 0, 269549, 0),
('791181168116779', '6899965874', 'G816', 4079, 1, 410, NULL, 3000, 300, '10', 0, 0, 269549, 0),
('693665961429644', '6899965874', 'G813', 3992, 2, 1450, NULL, 2780, 278, '10', 0, 0, 269549, 0),
('179856714781538', '6899965874', 'G812', 4004, 3, 0, NULL, 1390, 139, '10', 0, 0, 269549, 0),
('592728726358267', '6899965874', 'Q813', 3993, 4, 1390, NULL, 375, 37.5, '10', 0, 0, 269549, 0),
('866945995851248', '6899965874', 'Q811', 236, 1, 0, NULL, 390, 39, '10', 0, 0, 269549, 0),
('681346559787846', '6899965874', 'D811', 3928, 3, 1450, NULL, 0, 0, '10', 0, 0, 269549, 0),
('779172363714711', '6899965874', 'D812', 4006, 2, 5400, NULL, 10800, 1080, '10', 0, 0, 269549, 0),
('186978358343656', '6899965874', 'Q811', 3927, 2, 375, NULL, 410, 41, '10', 0, 0, 269549, 0),
('362589672258549', '6899965874', 'Q812', 4005, 3, 5400, NULL, 1125, 112.5, '10', 0, 0, 269549, 0),
('749724595395365', '6899965874', 'Q802', 4008, 2, 375, NULL, 1125, 112.5, '10', 0, 0, 269549, 0),
('423766871419787', '6899965874', 'G803', 4022, 3, 375, NULL, 1390, 139, '10', 0, 0, 269549, 0),
('769656825954223', '6899965874', 'G811', 3926, 2, 390, NULL, 3000, 300, '10', 0, 0, 269549, 0),
('131698519155489', '6899965874', 'G802', 4009, 1, 5400, NULL, 5400, 540, '10', 0, 0, 269549, 0),
('768588912663827', '6899965874', 'D803', 4024, 2, 1500, NULL, 5400, 540, '10', 0, 0, 269549, 0),
('491492641513192', '6899965874', 'Q802', 4007, 2, 410, NULL, 2780, 278, '10', 0, 0, 269549, 0),
('956677773757673', '6899965874', 'Q804', 4026, 1, 1390, NULL, 1125, 112.5, '10', 0, 0, 269549, 0),
('942622595216794', '6899965874', 'G811', 235, 1, 1390, NULL, 5800, 580, '10', 0, 0, 269549, 0),
('738276425293757', '6899965874', 'D804', 4027, 4, 5400, NULL, 5400, 540, '10', 0, 0, 269549, 0),
('246397849635934', '6899965874', 'Q803', 4023, 2, 375, NULL, 375, 37.5, '10', 0, 0, 269549, 0),
('361484946746877', '6899965874', 'D810', 4003, 2, 375, NULL, 5400, 540, '10', 0, 0, 269549, 0),
('982819796452138', '6899965874', 'Q811', 84, 1, 5400, NULL, 1560, 156, '10', 0, 0, 269549, 0),
('717676695634426', '6899965874', 'G811', 85, 2, 375, NULL, 1450, 145, '10', 0, 0, 269549, 0),
('341936878372328', '6899965874', 'D811', 83, 3, 1390, NULL, 0, 0, '10', 0, 0, 269549, 0),
('968712142951227', '6899965874', 'Q810', 4002, 1, 5400, NULL, 1125, 112.5, '10', 0, 0, 269549, 0),
('138794282455986', '6899965874', 'Q809', 4032, 2, 0, NULL, 1125, 112.5, '10', 0, 0, 269549, 0),
('468282449723133', '6899965874', 'G809', 4031, 3, 1450, NULL, 1390, 139, '10', 0, 0, 269549, 0),
('239538617293155', '6899965874', 'G808', 4013, 1, 0, NULL, 6950, 695, '10', 0, 0, 269549, 0),
('112717745261691', '6899965874', 'G810', 4001, 1, 1390, NULL, 4170, 417, '10', 0, 0, 269549, 0),
('783281728245334', '6899965874', 'Q808', 4014, 3, 410, NULL, 375, 37.5, '10', 0, 0, 269549, 0),
('721998297836241', '6899965874', 'D809', 4033, 2, 390, NULL, 5400, 540, '10', 0, 0, 269549, 0),
('289465635896258', '6899965874', 'Q817', 3990, 2, 375, NULL, 750, 75, '10', 0, 0, 269549, 0),
('495237143265357', '6899965874', 'D808', 4015, 2, 1500, NULL, 5400, 540, '10', 0, 0, 269549, 0),
('924339655375575', '6899965874', 'D817', 3991, 1, 5400, NULL, 5400, 540, '10', 0, 0, 269549, 0),
('447389675591898', '6899965874', 'D824', 3964, 2, 5400, NULL, 10800, 1080, '10', 0, 0, 269549, 0),
('147856832711729', '6899965874', 'G824', 3962, 1, 1390, NULL, 1390, 139, '10', 0, 0, 269549, 0),
('579341749546383', '6899965874', 'Q824', 3963, 1, 375, NULL, 375, 37.5, '10', 0, 0, 269549, 0),
('223127445873775', '6899965874', 'D825', 74, 1, 0, NULL, 0, 0, '10', 0, 0, 269549, 0),
('993565897844471', '6899965874', 'Q825', 4065, 3, 410, NULL, 1230, 123, '10', 0, 0, 269549, 0),
('556232394215869', '6899965874', 'Q825', 78, 3, 390, NULL, 1170, 117, '10', 0, 0, 269549, 0),
('233812653261849', '6899965874', 'D825', 4066, 1, 0, NULL, 0, 0, '10', 0, 0, 269549, 0),
('367994569533346', '6899965874', 'G825', 82, 1, 1450, NULL, 1450, 145, '10', 0, 0, 269549, 0),
('632338869315952', '6899965874', 'G825', 4064, 1, 1500, NULL, 1500, 150, '10', 0, 0, 269549, 0),
('679339491337613', '6899965874', 'G826', 79, 2, 1450, NULL, 2900, 290, '10', 0, 0, 269549, 0),
('928515885627814', '6899965874', 'D827', 3979, 2, 5400, NULL, 10800, 1080, '10', 0, 0, 269549, 0);

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
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `note_id` int(11) NOT NULL,
  `cash_date` varchar(20) NOT NULL,
  `1000n` varchar(11) NOT NULL,
  `500n` varchar(11) NOT NULL,
  `100n` varchar(11) NOT NULL,
  `50n` varchar(11) NOT NULL,
  `20n` varchar(11) NOT NULL,
  `10n` varchar(11) NOT NULL,
  `5n` varchar(11) NOT NULL,
  `2n` varchar(11) NOT NULL,
  `1n` varchar(30) NOT NULL,
  `grandtotal` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_trans`
--

CREATE TABLE `payment_trans` (
  `transection_id` varchar(200) NOT NULL,
  `tracing_id` varchar(200) NOT NULL,
  `payment_type` varchar(10) NOT NULL,
  `date` varchar(50) DEFAULT NULL,
  `amount` float NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `personal_loan`
--

CREATE TABLE `personal_loan` (
  `per_loan_id` int(11) NOT NULL,
  `transaction_id` varchar(30) NOT NULL,
  `person_id` varchar(30) NOT NULL,
  `debit` int(11) NOT NULL,
  `credit` float NOT NULL,
  `date` varchar(30) NOT NULL,
  `details` varchar(100) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1=no paid,2=paid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `personal_loan`
--

INSERT INTO `personal_loan` (`per_loan_id`, `transaction_id`, `person_id`, `debit`, `credit`, `date`, `details`, `status`) VALUES
(0, 'BQBYGWTV1P', '{person_id}', 4444, 0, '2020-03-14', '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `person_information`
--

CREATE TABLE `person_information` (
  `person_id` varchar(50) NOT NULL,
  `person_name` varchar(50) NOT NULL,
  `person_phone` varchar(50) NOT NULL,
  `person_address` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `person_ledger`
--

CREATE TABLE `person_ledger` (
  `transaction_id` varchar(50) NOT NULL,
  `person_id` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  `debit` float NOT NULL,
  `credit` float NOT NULL,
  `details` text NOT NULL,
  `status` int(11) NOT NULL COMMENT '1=no paid,2=paid',
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pesonal_loan_information`
--

CREATE TABLE `pesonal_loan_information` (
  `person_id` varchar(50) NOT NULL,
  `person_name` varchar(50) NOT NULL,
  `person_phone` varchar(30) NOT NULL,
  `person_address` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `category_id` varchar(255) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`category_id`, `category_name`, `status`) VALUES
('8UJRS1QV2L4WL6F', 'RAW MATERIAL', 1),
('87L3N3GXJ3FJLS9', 'FInish Good', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_information`
--

CREATE TABLE `product_information` (
  `product_uuid` int(11) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `special` bit(1) NOT NULL DEFAULT b'0',
  `tax` float DEFAULT NULL COMMENT 'Tax in %',
  `serial_no` varchar(50) DEFAULT NULL,
  `product_model` varchar(100) NOT NULL,
  `product_details` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sub_product` varchar(255) DEFAULT '0',
  `status` int(2) NOT NULL,
  `available_quantity` bigint(255) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_price_history`
--

CREATE TABLE `product_price_history` (
  `product_pr_his_id` int(11) NOT NULL,
  `product_id` varchar(30) CHARACTER SET latin1 NOT NULL,
  `supplier_id` varchar(30) CHARACTER SET latin1 NOT NULL,
  `supplier_price` double NOT NULL,
  `date_of_price_buy` varchar(30) CHARACTER SET latin1 NOT NULL,
  `affect_time_pc` varchar(30) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_purchase`
--

CREATE TABLE `product_purchase` (
  `purchase_id` varchar(100) NOT NULL,
  `chalan_no` varchar(100) NOT NULL,
  `supplier_id` varchar(100) NOT NULL,
  `grand_total_amount` float NOT NULL,
  `total_discount` float DEFAULT NULL,
  `po_total_amount` float DEFAULT NULL,
  `po_discount` float DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `purchase_date` varchar(50) NOT NULL,
  `purchase_details` text NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_purchase`
--

INSERT INTO `product_purchase` (`purchase_id`, `chalan_no`, `supplier_id`, `grand_total_amount`, `total_discount`, `po_total_amount`, `po_discount`, `due_date`, `purchase_date`, `purchase_details`, `status`) VALUES
('20181114092459', '1566', 'OGXZWFUZJQGQR8KPCUQF', 23750, NULL, 23750, NULL, '2018-12-25', '2018-10-25', '', 1),
('20181128051509', '18100107', '2RTL88CE6CZON8A48Q7H', 108000, NULL, 107730, NULL, '2019-01-17', '2018-10-17', '', 1),
('20181114094349', '1537', 'OGXZWFUZJQGQR8KPCUQF', 11500, NULL, 11500, NULL, '2018-12-17', '2018-10-17', '', 1),
('20181114095933', '1624', 'OGXZWFUZJQGQR8KPCUQF', 138750, NULL, 30750, NULL, '2019-01-08', '2018-11-08', '', 1),
('20181128073451', '18100185', '2RTL88CE6CZON8A48Q7H', 111000, NULL, 110580, NULL, '2019-01-30', '2018-10-30', '', 1),
('20181128111944', '1557', '38G8VAYQUTANT6T7P6NK', 16500, NULL, 14000, NULL, '2019-01-03', '2018-11-03', '', 1),
('20181129064904', '70', 'Q7FR2XS4JI3PV48ANWE2', 13600, NULL, 13600, NULL, '2019-01-20', '2018-11-20', '', 1),
('20181129112124', '16724K', '73841H2DMU823SWSFEI3', 75000, NULL, 75000, NULL, '2019-01-10', '2018-11-10', '', 1),
('20181204102127', '2368', 'IP9TWAG6VSVG6NTYP6RF', 13750, NULL, 13750, NULL, '2019-02-04', '2018-12-04', '', 1),
('20181204102451', '2386', 'IP9TWAG6VSVG6NTYP6RF', 29625, NULL, 29625, NULL, '2019-02-03', '2018-12-04', '', 1),
('20181204102541', '2411', 'IP9TWAG6VSVG6NTYP6RF', 13750, NULL, 13750, NULL, '2019-02-20', '2018-12-04', '', 1),
('20181206053800', '41', 'HMITTMTF6JUD4XSUKFWZ', 73800, NULL, 73800, NULL, '2019-02-28', '2018-11-29', '', 1),
('20181206063910', '10650', 'FYYUDE5ZMRGGXLPD4PZL', 303750, NULL, 290625, NULL, '2019-01-05', '2018-12-05', '', 1),
('20181206065133', '202', 'LPVTSAL9Y8RG1UDH4MP9', 63000, NULL, 63000, NULL, '2018-11-28', '2018-11-28', '', 1),
('20181206101139', '29', 'HMITTMTF6JUD4XSUKFWZ', 44940, NULL, 44940, NULL, '2019-02-27', '2018-10-27', '', 1),
('20181206101407', '26', 'HMITTMTF6JUD4XSUKFWZ', 60900, NULL, 60900, NULL, '2019-01-26', '2018-10-26', '', 1),
('20181212061218', '20', '445UCO1K5GSE7I98STAM', 8750, NULL, 8750, NULL, '2018-12-09', '2018-11-09', '', 1),
('20181212063010', '241', '17ZBKYN9I1UHC9AYDKFA', 66240, NULL, 66240, NULL, '2019-01-29', '2018-11-30', '', 1),
('20181220053434', '433', '17ZBKYN9I1UHC9AYDKFA', 47600, NULL, 47600, NULL, '2019-02-06', '2018-12-08', '', 1),
('20181220054240', '164', 'YZPXOYFITHGLI1M1SV7F', 181001, NULL, 181001, NULL, '2019-03-08', '2018-12-08', '', 1),
('20181220063400', '44783', 'OIP8LT8QNBS1EXRILD5M', 42000, NULL, 42000, NULL, '2019-03-15', '2018-11-15', '', 1),
('20181224074246', '16796K', '73841H2DMU823SWSFEI3', 51250, NULL, 51250, NULL, '2019-02-22', '2018-11-22', '', 1),
('20181224093613', '16870K', '73841H2DMU823SWSFEI3', 52000, NULL, 52000, NULL, '2019-02-10', '2018-12-10', '', 1),
('20181224105854', '44040', 'OIP8LT8QNBS1EXRILD5M', 123600, NULL, 123600, NULL, '2019-01-15', '2018-10-15', '', 1),
('20181227053853', '13', 'HMITTMTF6JUD4XSUKFWZ', 63470, NULL, 63470, NULL, '2019-02-19', '2018-12-19', '', 1),
('20181227092254', '18110158', '2RTL88CE6CZON8A48Q7H', 222000, NULL, 222000, NULL, '2019-02-28', '2018-11-28', '', 1),
('20181227092439', '18120104', '2RTL88CE6CZON8A48Q7H', 114000, NULL, 114000, NULL, '2019-02-17', '2018-12-17', '', 1),
('20181229101639', '31502', 'GPL2UPO3UP5JPQ1M6DBX', 24375, NULL, 24375, NULL, '2019-03-26', '2018-12-26', '', 1),
('20190102051013', '164', '17ZBKYN9I1UHC9AYDKFA', 66240, NULL, 66240, NULL, '2019-01-19', '2018-11-19', '', 1),
('20190102051938', '43735', 'OIP8LT8QNBS1EXRILD5M', 191600, NULL, 184000, NULL, '2019-04-01', '2019-01-01', '', 1),
('20190104070256', '00', '8EM2GUI7NF8JLN7BK56L', 74100, NULL, 74100, NULL, '2019-02-21', '2018-12-21', '', 1),
('20190104072436', '170', 'LPVTSAL9Y8RG1UDH4MP9', 63600, NULL, 63600, NULL, '2018-11-15', '2018-11-15', '', 1),
('20190107093208', '105636', '8EM2GUI7NF8JLN7BK56L', 111150, NULL, 111150, NULL, '2019-03-05', '2019-01-05', '', 1),
('20190107095408', '535', 'FYYUDE5ZMRGGXLPD4PZL', 295000, NULL, 295000, NULL, '2019-01-31', '2019-01-05', 'R298', 1),
('20190108103438', '1532', 'D23F97RKV572XU63L93E', 55625, NULL, 55625, NULL, '2019-03-07', '2019-01-07', '', 1),
('20190110085137', '29', 'D23F97RKV572XU63L93E', 54375, NULL, 54375, NULL, '2019-02-06', '2018-12-06', '', 1),
('20190110085911', '1244', 'D23F97RKV572XU63L93E', 54375, NULL, 54375, NULL, '2019-01-14', '2018-11-14', '', 1),
('20190121053012', '45595', 'OIP8LT8QNBS1EXRILD5M', 100000, NULL, 100000, NULL, '2019-01-21', '2018-12-18', '', 1),
('20190121075816', '325', 'LPVTSAL9Y8RG1UDH4MP9', 62400, NULL, 62400, NULL, '2019-01-18', '2019-01-18', '', 1),
('20190121080222', '6157', 'AU5YU8HI5RK3ME4ZRSGE', 8000, NULL, 8000, NULL, '2019-03-16', '2019-01-16', '', 1),
('20190213080352', '69', 'Q7FR2XS4JI3PV48ANWE2', 22000, NULL, 22000, NULL, '2019-05-12', '2019-02-12', '', 1),
('20190121080751', '1911', 'LPVTSAL9Y8RG1UDH4MP9', 20400, NULL, 20400, NULL, '2019-01-12', '2019-01-12', '', 1),
('20190121081522', '479', 'Q849P2OLCS1QYZVYV1K7', 35875, NULL, 35875, NULL, '2019-03-10', '2019-01-10', '', 1),
('20190121081759', '35', 'Q7FR2XS4JI3PV48ANWE2', 19600, NULL, 19600, NULL, '2019-04-14', '2019-01-14', '', 1),
('20190121093008', '62', '38G8VAYQUTANT6T7P6NK', 51500, NULL, 51500, NULL, '2019-03-15', '2019-01-15', '', 1),
('20190121101146', '92', 'HMITTMTF6JUD4XSUKFWZ', 72300, NULL, 72300, NULL, '2019-03-12', '2019-01-12', '', 1),
('20190121102656', '10', 'Q7FR2XS4JI3PV48ANWE2', 22000, NULL, 22000, NULL, '2019-01-21', '2019-01-21', '', 1),
('20190124061854', '17086K', '73841H2DMU823SWSFEI3', 32325, NULL, 32325, NULL, '2019-04-19', '2019-01-19', '', 1),
('20190124062122', '1594', 'D23F97RKV572XU63L93E', 44500, NULL, 44500, NULL, '2019-03-21', '2019-01-21', '', 1),
('20190124062414', '1921', 'OIP8LT8QNBS1EXRILD5M', 87000, NULL, 87000, NULL, '2019-01-24', '2019-01-24', '', 1),
('20190131053458', '57190', 'GPL2UPO3UP5JPQ1M6DBX', 118750, NULL, 118750, NULL, '2019-02-23', '2019-01-23', '', 1),
('20190205062239', '492', 'Q849P2OLCS1QYZVYV1K7', 27750, NULL, 27750, NULL, '2019-03-30', '2019-01-30', '', 1),
('20190205074216', '8250', 'KVHAGIB239PCDIU1IFOL', 65000, NULL, 65000, NULL, '2019-03-04', '2019-02-04', '', 1),
('20190205074606', '57381', 'GPL2UPO3UP5JPQ1M6DBX', 178125, NULL, 178125, NULL, '2019-03-01', '2019-02-01', '', 1),
('20190205075734', '31921', 'GPL2UPO3UP5JPQ1M6DBX', 57500, NULL, 57500, NULL, '2019-02-05', '2019-02-05', '', 1),
('20190205075955', '1641', 'D23F97RKV572XU63L93E', 33375, NULL, 33375, NULL, '2019-04-01', '2019-02-01', '', 1),
('20190205080601', '00000', 'OIP8LT8QNBS1EXRILD5M', 104600, NULL, 104600, NULL, '2019-05-04', '2019-02-04', '', 1),
('20190205080804', '17132', '73841H2DMU823SWSFEI3', 14500, NULL, 14500, NULL, '2019-04-02', '2019-02-02', '', 1),
('20190206070300', '27', 'HMITTMTF6JUD4XSUKFWZ', 73620, NULL, 73620, NULL, '2019-04-05', '2019-02-05', '', 1),
('20190209103203', '19010130', '2RTL88CE6CZON8A48Q7H', 190000, NULL, 190000, NULL, '2019-04-30', '2019-01-30', '', 1),
('20190209103252', '19010145', '2RTL88CE6CZON8A48Q7H', 190000, NULL, 190000, NULL, '2019-04-30', '2019-01-31', '', 1),
('20190213092833', '00000', 'OIP8LT8QNBS1EXRILD5M', 104600, NULL, 104600, NULL, '2019-05-11', '2019-02-11', '', 1),
('20190213094550', '18120151', '2RTL88CE6CZON8A48Q7H', 114000, NULL, 114000, NULL, '2019-02-26', '2018-12-26', '', 1),
('20190213095654', '2170', '2RTL88CE6CZON8A48Q7H', 190000, NULL, 190000, NULL, '2019-05-09', '2019-02-09', '', 1),
('20190213100037', '105794', '8EM2GUI7NF8JLN7BK56L', 76000, NULL, 76000, NULL, '2019-05-09', '2019-02-09', '', 1),
('20190213111438', '17', 'Q7FR2XS4JI3PV48ANWE2', 11375, NULL, 11375, NULL, '2019-04-29', '2019-01-29', '', 1),
('20190221110543', '17178', '73841H2DMU823SWSFEI3', 23250, NULL, 23250, NULL, '2019-05-13', '2019-02-13', '', 1),
('20190223072426', '32088', 'GPL2UPO3UP5JPQ1M6DBX', 178125, NULL, 178125, NULL, '2019-03-13', '2019-02-13', '', 1),
('20190225131949', '809', 'FYYUDE5ZMRGGXLPD4PZL', 345000, NULL, 345000, NULL, '2019-03-25', '2019-02-25', '', 1),
('20190227111532', '811', 'ZZDE8VQ5MFPC9MZRNP7T', 34050, NULL, 34050, NULL, '2019-03-25', '2019-01-25', '', 1),
('20190228094705', '1931', '2RTL88CE6CZON8A48Q7H', 114000, NULL, 114000, NULL, '2019-03-23', '2019-02-23', '', 1),
('20190228095640', '404', 'LPVTSAL9Y8RG1UDH4MP9', 61800, NULL, 61800, NULL, '2019-02-28', '2019-02-28', '', 1),
('20190228095740', '433', 'LPVTSAL9Y8RG1UDH4MP9', 61200, NULL, 61200, NULL, '2019-02-23', '2019-02-23', '', 1),
('20190228095834', '20', 'LPVTSAL9Y8RG1UDH4MP9', 61800, NULL, 61800, NULL, '2019-02-09', '2019-02-09', '', 1),
('20190228120257', '2432', 'IP9TWAG6VSVG6NTYP6RF', 13750, NULL, 13750, NULL, '2019-03-07', '2018-12-07', '', 1),
('20190228120341', '2483', 'IP9TWAG6VSVG6NTYP6RF', 13750, NULL, 13750, NULL, '2019-03-03', '2019-01-03', '', 1),
('20190228120441', '2505', 'IP9TWAG6VSVG6NTYP6RF', 13750, NULL, 13750, NULL, '2019-04-22', '2019-01-22', '', 1),
('20190228120528', '2539', 'IP9TWAG6VSVG6NTYP6RF', 6875, NULL, 6875, NULL, '2019-04-14', '2019-02-14', '', 1),
('20190302063515', '1762', 'D23F97RKV572XU63L93E', 33375, NULL, 33375, NULL, '2019-05-01', '2019-03-01', '', 1),
('20190302063803', '1935', '38G8VAYQUTANT6T7P6NK', 14000, NULL, 14000, NULL, '2019-05-01', '2019-03-01', '', 1),
('20190302063926', '1938', 'Q849P2OLCS1QYZVYV1K7', 23125, NULL, 23125, NULL, '2019-06-01', '2019-03-01', '', 1),
('20190409080456', '81', 'Q7FR2XS4JI3PV48ANWE2', 26000, NULL, 26000, NULL, '2019-06-02', '2019-04-02', '', 1),
('20190302070356', '000000', 'OIP8LT8QNBS1EXRILD5M', 100000, NULL, 100000, NULL, '2019-06-01', '2019-03-01', '', 1),
('20190302070842', '2560', 'IP9TWAG6VSVG6NTYP6RF', 6875, NULL, 6875, NULL, '2019-05-01', '2019-03-01', '', 1),
('20190302093938', '43', 'Q7FR2XS4JI3PV48ANWE2', 33800, NULL, 33800, NULL, '2019-05-28', '2019-02-28', '', 1),
('20190305102802', 's13282', 'KVHAGIB239PCDIU1IFOL', 251000, NULL, 251000, NULL, '2019-04-01', '2019-03-01', '', 1),
('20190306113130', '005', 'HMITTMTF6JUD4XSUKFWZ', 75640, NULL, 72340, NULL, '2019-05-05', '2019-03-05', '', 1),
('20190309065251', '854', 'ZZDE8VQ5MFPC9MZRNP7T', 60300, NULL, 60300, NULL, '2019-05-07', '2019-03-07', '', 1),
('20190311065907', '2574', 'IP9TWAG6VSVG6NTYP6RF', 13750, NULL, 13750, NULL, '2019-03-11', '2019-03-11', '', 1),
('20190312063526', '000000', 'OIP8LT8QNBS1EXRILD5M', 100000, NULL, 100000, NULL, '2019-07-11', '2019-03-11', '', 1),
('20190313075417', '2574', 'IP9TWAG6VSVG6NTYP6RF', 13750, NULL, 13750, NULL, '2019-06-11', '2019-03-11', '', 1),
('20190313054236', '59', 'Q7FR2XS4JI3PV48ANWE2', 49600, NULL, 49600, NULL, '2019-06-13', '2019-03-12', '', 1),
('20190313062300', '2902', '2RTL88CE6CZON8A48Q7H', 175750, NULL, 175750, NULL, '2019-06-12', '2019-03-12', '', 1),
('20190325062537', '1883', 'D23F97RKV572XU63L93E', 55625, NULL, 55625, NULL, '2019-05-22', '2019-03-22', '', 1),
('20190325070552', '27', '38G8VAYQUTANT6T7P6NK', 70250, NULL, 70250, NULL, '2019-05-21', '2019-03-21', '', 1),
('20190325072020', '6414', 'AU5YU8HI5RK3ME4ZRSGE', 10000, NULL, 10000, NULL, '2019-05-15', '2019-03-15', '', 1),
('20190325115633', '2911', 'OIP8LT8QNBS1EXRILD5M', 142000, NULL, 142000, NULL, '2019-05-22', '2019-03-22', '', 1),
('20190327060903', '2528', 'ZZDE8VQ5MFPC9MZRNP7T', 52500, NULL, 52500, NULL, '2019-06-26', '2019-03-26', '', 1),
('20190411055950', '106103', '8EM2GUI7NF8JLN7BK56L', 37050, NULL, 37050, NULL, '2019-07-09', '2019-04-09', '', 1),
('20190403071050', '1923', 'D23F97RKV572XU63L93E', 33375, NULL, 33375, NULL, '2019-06-02', '2019-04-02', '', 1),
('20190403071358', '2606', 'IP9TWAG6VSVG6NTYP6RF', 13750, NULL, 13750, NULL, '2019-07-01', '2019-04-01', '', 1),
('20190403073705', '000012', 'UOG71LV2MZUSTC69H2Y2', 84800, NULL, 84800, NULL, '2019-06-21', '2019-03-21', '', 1),
('20190404062527', '639', '445UCO1K5GSE7I98STAM', 8750, NULL, 8750, NULL, '2019-06-01', '2019-03-01', '', 1),
('20190411060930', '2921', 'OIP8LT8QNBS1EXRILD5M', 133600, NULL, 133600, NULL, '2019-07-10', '2019-04-10', '', 1),
('20190416061951', '92', 'Q7FR2XS4JI3PV48ANWE2', 20375, NULL, 20375, NULL, '2019-06-15', '2019-04-15', '', 1),
('20190416074632', '326', 'PN6D6ZWHZOE6GNNVVE8E', 43000, NULL, 43000, NULL, '2019-04-16', '2019-04-13', '', 1),
('20190416075643', '10', 'WH74CL4U9NF73DU6SHHP', 19750, NULL, 19750, NULL, '2019-06-09', '2019-04-09', '', 1),
('20190420070124', '2930', 'OIP8LT8QNBS1EXRILD5M', 91600, NULL, 91600, NULL, '2019-07-18', '2019-04-18', '', 1),
('20190420072020', '229', 'FYYUDE5ZMRGGXLPD4PZL', 348750, NULL, 348750, NULL, '2019-07-17', '2019-04-17', '', 1),
('20190420073430', '17493K', '73841H2DMU823SWSFEI3', 14250, NULL, 14250, NULL, '2019-08-15', '2019-04-15', '', 1),
('20190430073533', '04', 'Q7FR2XS4JI3PV48ANWE2', 13750, NULL, 9750, NULL, '2019-07-23', '2019-04-23', '', 1),
('20190422062015', '9207', 'KVHAGIB239PCDIU1IFOL', 249900, NULL, 249900, NULL, '2019-06-18', '2019-04-18', '', 1),
('20190502072126', '2641', 'IP9TWAG6VSVG6NTYP6RF', 13750, NULL, 13750, NULL, '2019-06-24', '2019-04-24', '', 1),
('20190502074118', '09', 'Q7FR2XS4JI3PV48ANWE2', 36000, NULL, 36000, NULL, '2019-07-26', '2019-04-26', '', 1),
('20190511101950', '106293/10001', '2RTL88CE6CZON8A48Q7H', 105450, NULL, 105450, NULL, '2019-05-11', '2019-05-10', '', 1),
('20190511102505', '32', 'Q7FR2XS4JI3PV48ANWE2', 20375, NULL, 20375, NULL, '2019-05-11', '2019-05-08', '', 1),
('20190511102808', '2666', 'IP9TWAG6VSVG6NTYP6RF', 13750, NULL, 13750, NULL, '2019-05-11', '2019-05-09', '', 1),
('20190511103116', '2105', 'D23F97RKV572XU63L93E', 66750, NULL, 66750, NULL, '2019-05-11', '2019-05-04', '', 1),
('20190511103917', '2593', 'ZZDE8VQ5MFPC9MZRNP7T', 52500, NULL, 52500, NULL, '2019-08-30', '2019-04-30', '', 1),
('20190511104635', '2938', 'OIP8LT8QNBS1EXRILD5M', 104600, NULL, 104600, NULL, '2019-08-08', '2019-05-08', '', 1),
('20190521052604', '362', 'Q849P2OLCS1QYZVYV1K7', 46250, NULL, 46250, NULL, '2019-05-21', '2019-04-23', '', 1),
('20190523091122', '10001', '8EM2GUI7NF8JLN7BK56L', 74100, NULL, 74100, NULL, '2019-05-23', '2019-05-16', '', 1),
('20190528095451', '33334', 'GPL2UPO3UP5JPQ1M6DBX', 57500, NULL, 57500, NULL, '2019-07-18', '2019-05-18', '', 1),
('20190530092301', '50', 'Q7FR2XS4JI3PV48ANWE2', 20375, NULL, 20375, NULL, '2019-07-29', '2019-05-29', '', 1),
('20190530093241', '2953', 'OIP8LT8QNBS1EXRILD5M', 96200, NULL, 96200, NULL, '2019-08-29', '2019-05-29', '', 1),
('20190603100258', '09', 'VU49HVTLNZGLY8DJFOXN', 15500, NULL, 15500, NULL, '2019-06-28', '2019-03-28', '', 1),
('20190620053118', '72', 'Q7FR2XS4JI3PV48ANWE2', 20375, NULL, 20375, NULL, '2019-06-20', '2019-06-18', '', 1),
('20190620053441', '488', 'FYYUDE5ZMRGGXLPD4PZL', 232500, NULL, 232500, NULL, '2019-06-20', '2019-06-19', '', 1),
('20190620060158', '2956', 'UOG71LV2MZUSTC69H2Y2', 45000, NULL, 45000, NULL, '2019-06-20', '2019-06-16', '', 1),
('20190620062638', '2957', '8EM2GUI7NF8JLN7BK56L', 74100, NULL, 74100, NULL, '2019-06-20', '2019-06-17', '', 1),
('20190620063206', '2958', 'OIP8LT8QNBS1EXRILD5M', 87000, NULL, 87000, NULL, '2019-11-18', '2019-06-17', '', 1),
('20190625061753', '2966', '2RTL88CE6CZON8A48Q7H', 70300, NULL, 70300, NULL, '2019-09-24', '2019-06-24', '', 1),
('20190625073133', '46', '38G8VAYQUTANT6T7P6NK', 51500, NULL, 51500, NULL, '2019-09-22', '2019-06-22', '', 1),
('20190629064723', '00000', 'PN6D6ZWHZOE6GNNVVE8E', 40000, NULL, 40000, NULL, '2019-06-29', '2019-06-29', '', 1),
('20190701060240', '81', 'Q7FR2XS4JI3PV48ANWE2', 32375, NULL, 32375, NULL, '2019-10-27', '2019-06-27', '', 1),
('20190701061353', '2971', 'ZZDE8VQ5MFPC9MZRNP7T', 26250, NULL, 26250, NULL, '2019-09-29', '2019-06-29', '', 1),
('20190703061251', '9615', 'KVHAGIB239PCDIU1IFOL', 84900, NULL, 40900, NULL, '2019-10-01', '2019-07-01', '', 1),
('20190706051822', '745', '445UCO1K5GSE7I98STAM', 8750, NULL, 6250, NULL, '2019-10-03', '2019-07-03', '', 1),
('20190712065429', '391', 'Q849P2OLCS1QYZVYV1K7', 70625, NULL, 70625, NULL, '2019-10-09', '2019-07-09', '', 1),
('20190715072325', '0367', 'PN6D6ZWHZOE6GNNVVE8E', 54000, NULL, 54000, NULL, '2019-10-12', '2019-07-15', '', 1),
('20190715111635', '9666', 'KVHAGIB239PCDIU1IFOL', 55000, NULL, 55000, NULL, '2019-09-12', '2019-07-12', '', 1),
('20190715114237', '80', '38G8VAYQUTANT6T7P6NK', 14000, NULL, 14000, NULL, '2019-10-10', '2019-07-10', '', 1),
('20190715120927', '2983', '73841H2DMU823SWSFEI3', 14250, NULL, 14250, NULL, '2019-12-15', '2019-07-15', '', 1),
('20190715122302', '44', 'WH74CL4U9NF73DU6SHHP', 88500, NULL, 63000, NULL, '2019-10-12', '2019-07-12', '', 1),
('20190716053647', '0364', 'PN6D6ZWHZOE6GNNVVE8E', 48000, NULL, 48000, NULL, '2019-10-10', '2019-07-10', '', 1),
('20190722061430', '2417', 'D23F97RKV572XU63L93E', 77875, NULL, 77875, NULL, '2019-10-20', '2019-07-20', '', 1),
('20190725071139', '9701', 'KVHAGIB239PCDIU1IFOL', 147000, NULL, 147000, NULL, '2019-10-20', '2019-07-20', '', 1),
('20190725073412', '51', 'WH74CL4U9NF73DU6SHHP', 16000, NULL, 16000, NULL, '2019-10-22', '2019-07-22', '', 1),
('20190727081714', '2984', 'OIP8LT8QNBS1EXRILD5M', 87000, NULL, 87000, NULL, '2019-11-16', '2019-07-16', '', 1),
('20190727082055', '2754', 'IP9TWAG6VSVG6NTYP6RF', 6875, NULL, 6875, NULL, '2019-10-20', '2019-07-20', '', 1),
('20190801061957', '11', 'Q7FR2XS4JI3PV48ANWE2', 20375, NULL, 20375, NULL, '2019-10-27', '2019-07-27', '', 1),
('20190801062653', '2763', 'IP9TWAG6VSVG6NTYP6RF', 6875, NULL, 6875, NULL, '2019-10-29', '2019-07-29', '', 1),
('20190801063652', '002101', '3URSQ9XJAVQPLR2YT7HL', 77200, NULL, 77200, NULL, '2019-10-19', '2019-07-19', '', 1),
('20190802075956', '2987', 'UOG71LV2MZUSTC69H2Y2', 43300, NULL, 43300, NULL, '2019-10-15', '2019-07-15', '', 1),
('20190802075626', '2986', 'UOG71LV2MZUSTC69H2Y2', 71750, NULL, 71750, NULL, '2019-10-22', '2019-07-22', '', 1),
('20190815063529', '4539', 'KVHAGIB239PCDIU1IFOL', 110000, NULL, 220000, NULL, '2019-11-08', '2019-08-08', '', 1),
('20190819063212', '56', 'WH74CL4U9NF73DU6SHHP', 49000, NULL, 49000, NULL, '2019-11-05', '2019-08-05', '', 1),
('20190823064543', '2770', 'IP9TWAG6VSVG6NTYP6RF', 13750, NULL, 13750, NULL, '2019-11-21', '2019-08-21', '', 1),
('20190828061534', '33', 'Q7FR2XS4JI3PV48ANWE2', 13000, NULL, 13000, NULL, '2019-11-23', '2019-08-23', '', 1),
('20190906103658', '901', '43KY3DUFCY7NQ8R3GWW7', 131250, NULL, 131250, NULL, '2019-12-04', '2019-09-04', '', 1),
('20190906104133', '902', 'OIP8LT8QNBS1EXRILD5M', 58000, NULL, 58000, NULL, '2019-12-04', '2019-09-04', '', 1),
('20190916052618', '9910', 'KVHAGIB239PCDIU1IFOL', 88000, NULL, 88000, NULL, '2019-12-16', '2019-09-16', '', 1),
('20191003063215', '67', 'Q7FR2XS4JI3PV48ANWE2', 23625, NULL, 23625, NULL, '2019-10-03', '2019-09-23', '', 1),
('20191003064919', '2632', 'D23F97RKV572XU63L93E', 33375, NULL, 33375, NULL, '2019-12-19', '2019-09-19', '', 1),
('20191003065235', '2627', 'D23F97RKV572XU63L93E', 22250, NULL, 22250, NULL, '2019-12-18', '2019-09-18', '', 1),
('20191003065500', '2896', 'IP9TWAG6VSVG6NTYP6RF', 6875, NULL, 6875, NULL, '2019-12-23', '2019-09-23', '', 1),
('20191003065942', '00', 'OIP8LT8QNBS1EXRILD5M', 58000, NULL, 58000, NULL, '2019-12-19', '2019-09-19', '', 1),
('20191003071121', '000', 'UOG71LV2MZUSTC69H2Y2', 20000, NULL, 20000, NULL, '2019-12-20', '2019-09-20', '', 1),
('20191023113229', '000', 'OIP8LT8QNBS1EXRILD5M', 100000, NULL, 100000, NULL, '2019-10-23', '2019-10-19', '', 1),
('20191023113512', '2770', 'D23F97RKV572XU63L93E', 55625, NULL, 55625, NULL, '2019-12-17', '2019-10-17', '', 1),
('20191023113934', '607', 'PN6D6ZWHZOE6GNNVVE8E', 54000, NULL, 54000, NULL, '2019-12-18', '2019-10-18', '', 1),
('20191023114148', '000', 'IP9TWAG6VSVG6NTYP6RF', 13750, NULL, 13750, NULL, '2019-12-16', '2019-10-16', '', 1),
('20191023114545', '2811', 'ZZDE8VQ5MFPC9MZRNP7T', 52500, NULL, 52500, NULL, '2019-12-19', '2019-10-19', '', 1),
('20191025114107', '02', 'Q7FR2XS4JI3PV48ANWE2', 32600, NULL, 32600, NULL, '2019-12-14', '2019-10-14', '', 1),
('20191025114358', '68', 'Q7FR2XS4JI3PV48ANWE2', 10625, NULL, 10625, NULL, '2019-12-22', '2019-10-22', '', 1),
('20191113105725', '27', 'Q7FR2XS4JI3PV48ANWE2', 22000, NULL, 22000, NULL, '2020-01-11', '2019-11-11', '', 1),
('20191113110108', '911', '2RTL88CE6CZON8A48Q7H', 105450, NULL, 105450, NULL, '2020-02-08', '2019-11-08', '', 1),
('20191113111002', '63864', 'GPL2UPO3UP5JPQ1M6DBX', 118750, NULL, 118750, NULL, '2020-02-11', '2019-11-11', '', 1),
('20191113112019', '0371', 'PN6D6ZWHZOE6GNNVVE8E', 43000, NULL, 43000, NULL, '2020-02-29', '2019-10-29', '', 1),
('20191113112617', '907', 'OIP8LT8QNBS1EXRILD5M', 58000, NULL, 58000, NULL, '2019-11-13', '2019-11-04', '', 1),
('20191113135849', '1225', 'AT9YQ8RYRMLR7M8P4JIA', 25500, NULL, 25500, NULL, '2020-01-28', '2019-10-28', '', 1),
('20191113141140', '904', '43KY3DUFCY7NQ8R3GWW7', 105000, NULL, 105000, NULL, '2020-01-30', '2019-10-30', '', 1),
('20191119110530', '2954', 'IP9TWAG6VSVG6NTYP6RF', 13750, NULL, 13750, NULL, '2020-02-14', '2019-11-14', '', 1),
('20191119110923', '916', 'OIP8LT8QNBS1EXRILD5M', 58000, NULL, 58000, NULL, '2020-02-14', '2019-11-14', '', 1),
('20191126064630', '84', 'ZSPRL6NCIQHI9SCRYKDH', 69000, NULL, 69000, NULL, '2019-12-20', '2019-09-20', '', 1),
('20191126070423', '51', 'ZSPRL6NCIQHI9SCRYKDH', 12500, NULL, 12500, NULL, '2020-02-05', '2019-11-05', '', 1),
('20191126070744', '67', 'ZSPRL6NCIQHI9SCRYKDH', 79000, NULL, 79000, NULL, '2020-02-07', '2019-11-07', '', 1),
('20191127062946', '05', 'ZSPRL6NCIQHI9SCRYKDH', 82000, NULL, 66000, NULL, '2020-02-26', '2019-11-26', '', 1),
('20191129115946', '925', 'OIP8LT8QNBS1EXRILD5M', 58000, NULL, 58000, NULL, '2020-02-29', '2019-11-29', '', 1),
('20191204060144', '49', 'Q7FR2XS4JI3PV48ANWE2', 22000, NULL, 22000, NULL, '2020-02-29', '2019-11-30', '', 1),
('20191214055053', '2919', 'ZZDE8VQ5MFPC9MZRNP7T', 26250, NULL, 26250, NULL, '2020-03-11', '2019-12-11', '', 1),
('20191214055444', '1510', '73841H2DMU823SWSFEI3', 14250, NULL, 14250, NULL, '2020-03-12', '2019-12-12', '', 1),
('20191216061342', '40', 'IP9TWAG6VSVG6NTYP6RF', 13750, NULL, 13750, NULL, '2020-03-14', '2019-12-14', '', 1),
('20191216071117', '054', 'HMITTMTF6JUD4XSUKFWZ', 5000, NULL, 5000, NULL, '2019-07-08', '2019-04-08', '', 1),
('20191216071842', '090', 'HMITTMTF6JUD4XSUKFWZ', 84580, NULL, 84580, NULL, '2019-07-17', '2019-04-17', '', 1),
('20191216073931', '020', 'HMITTMTF6JUD4XSUKFWZ', 65110, NULL, 65110, NULL, '2019-09-21', '2019-06-21', '', 1),
('20191216074502', '047', 'HMITTMTF6JUD4XSUKFWZ', 64680, NULL, 64680, NULL, '2019-10-03', '2019-07-03', '', 1),
('20191216075517', '061', 'HMITTMTF6JUD4XSUKFWZ', 76260, NULL, 76260, NULL, '2019-10-06', '2019-07-06', '', 1),
('20191217082527', '057', 'HMITTMTF6JUD4XSUKFWZ', 50000, NULL, 50000, NULL, '2020-02-21', '2019-11-21', '', 1),
('20191218061354', '068', 'HMITTMTF6JUD4XSUKFWZ', 55420, NULL, 55420, NULL, '2020-01-25', '2019-10-25', '', 1),
('20191218064929', '037', 'HMITTMTF6JUD4XSUKFWZ', 52460, NULL, 52460, NULL, '2020-03-13', '2019-12-13', '', 1),
('20191218124419', '68', 'Q7FR2XS4JI3PV48ANWE2', 10625, NULL, 10625, NULL, '2020-03-18', '2019-12-18', '', 1),
('20191218125321', '18', '38G8VAYQUTANT6T7P6NK', 42125, NULL, 42125, NULL, '2020-03-18', '2019-12-18', '', 1),
('20191230081915', '3151', 'D23F97RKV572XU63L93E', 55625, NULL, 55625, NULL, '2020-03-28', '2019-12-28', '', 1),
('20191230082138', '937', 'OIP8LT8QNBS1EXRILD5M', 58000, NULL, 58000, NULL, '2020-03-24', '2019-12-24', '', 1),
('20200106062636', '83', 'Q7FR2XS4JI3PV48ANWE2', 22000, NULL, 22000, NULL, '2020-04-02', '2020-01-02', '', 1),
('20200108055154', '59', 'ZSPRL6NCIQHI9SCRYKDH', 77000, NULL, 77000, NULL, '2020-04-07', '2020-01-07', '', 1),
('20200108055442', '941', 'OIP8LT8QNBS1EXRILD5M', 42000, NULL, 42000, NULL, '2020-04-07', '2020-01-07', '', 1),
('20200114061307', '020', 'HMITTMTF6JUD4XSUKFWZ', 59180, NULL, 57580, NULL, '2020-04-13', '2020-01-13', '', 1),
('20200114062523', '942', '2RTL88CE6CZON8A48Q7H', 140600, NULL, 140600, NULL, '2020-04-09', '2020-01-09', '', 1),
('20200114062801', '73', 'IP9TWAG6VSVG6NTYP6RF', 13750, NULL, 13750, NULL, '2020-04-13', '2020-01-13', '', 1),
('20200114063520', '991', '445UCO1K5GSE7I98STAM', 8250, NULL, 8250, NULL, '2020-04-13', '2020-01-13', '', 1),
('20200214113832', '946', '8EM2GUI7NF8JLN7BK56L', 136800, NULL, 136800, NULL, '2020-05-07', '2020-02-07', '', 1),
('20200214112129', '32', 'Q7FR2XS4JI3PV48ANWE2', 22000, NULL, 22000, NULL, '2020-05-14', '2020-02-14', '', 1),
('20200309074242', '82', '38G8VAYQUTANT6T7P6NK', 44500, NULL, 44500, NULL, '2020-06-02', '2020-03-02', '', 1),
('20200127055101', '950', 'OIP8LT8QNBS1EXRILD5M', 58000, NULL, 58000, NULL, '2020-04-27', '2020-01-24', '', 1),
('20200217070225', '959', 'OIP8LT8QNBS1EXRILD5M', 71000, NULL, 71000, NULL, '2020-05-10', '2020-02-10', '', 1),
('20200217070843', '3041', 'ZZDE8VQ5MFPC9MZRNP7T', 62500, NULL, 62500, NULL, '2020-05-04', '2020-02-04', '', 1),
('20200217071458', '914', '8EM2GUI7NF8JLN7BK56L', 91200, NULL, 91200, NULL, '2020-04-30', '2020-01-31', '', 1),
('20200217072831', '091', 'HMITTMTF6JUD4XSUKFWZ', 64800, NULL, 64800, NULL, '2020-05-03', '2020-02-03', '', 1),
('20200217073227', '86', 'IP9TWAG6VSVG6NTYP6RF', 6875, NULL, 6875, NULL, '2020-05-07', '2020-02-07', '', 1),
('20200217074035', '51', 'ZSPRL6NCIQHI9SCRYKDH', 76000, NULL, 76000, NULL, '2020-05-10', '2020-02-10', '', 1),
('20200225103400', '965', 'OIP8LT8QNBS1EXRILD5M', 58000, NULL, 58000, NULL, '2020-05-19', '2020-02-19', '', 1),
('20200309073202', '47', 'Q7FR2XS4JI3PV48ANWE2', 22000, NULL, 22000, NULL, '2020-05-27', '2020-02-27', '', 1),
('20200309073325', '1906', 'OIP8LT8QNBS1EXRILD5M', 43500, NULL, 43500, NULL, '2020-06-05', '2020-03-05', '', 1),
('20200309075026', '1902', '3URSQ9XJAVQPLR2YT7HL', 77200, NULL, 77200, NULL, '2020-05-27', '2020-02-27', '', 1),
('20200309080950', '1314', 'AT9YQ8RYRMLR7M8P4JIA', 73500, NULL, 73500, NULL, '2020-05-24', '2020-02-24', '', 1),
('20200310112100', '951', '2RTL88CE6CZON8A48Q7H', 67750, NULL, 67750, NULL, '2020-04-27', '2020-01-27', '', 1),
('20200312065310', '1908', '2RTL88CE6CZON8A48Q7H', 105450, NULL, 105450, NULL, '2020-06-13', '2020-03-13', '', 1),
('20200312070242', '203', 'IP9TWAG6VSVG6NTYP6RF', 13750, NULL, 13750, NULL, '2020-06-09', '2020-03-09', '', 1),
('20200314075027', '1909', 'FYYUDE5ZMRGGXLPD4PZL', 240000, NULL, 240000, NULL, '2020-03-14', '2020-03-14', '', 1),
('20200317063326', '1910', 'GPL2UPO3UP5JPQ1M6DBX', 24000, NULL, 24000, NULL, '2020-06-11', '2020-03-11', '', 1),
('20200317064220', '1912', 'II437GDPEFR1U28E7JQG', 46000, NULL, 46000, NULL, '2020-03-13', '2020-03-13', '', 1),
('20200317064415', '1913', 'OIP8LT8QNBS1EXRILD5M', 75600, NULL, 75600, NULL, '2020-06-16', '2020-03-16', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_purchase_details`
--

CREATE TABLE `product_purchase_details` (
  `purchase_detail_id` varchar(100) NOT NULL,
  `purchase_id` varchar(100) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `quantity` float NOT NULL,
  `rate` float NOT NULL,
  `total_amount` float NOT NULL,
  `discount` float DEFAULT NULL,
  `po_quantity` float DEFAULT NULL,
  `po_rate` float DEFAULT NULL,
  `po_amount` float DEFAULT NULL,
  `po_discount` float DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_purchase_details`
--

INSERT INTO `product_purchase_details` (`purchase_detail_id`, `purchase_id`, `product_id`, `quantity`, `rate`, `total_amount`, `discount`, `po_quantity`, `po_rate`, `po_amount`, `po_discount`, `status`) VALUES
('kJYZjTW8gH1voZW', '20181114094349', '63285764', 500, 14, 7000, NULL, NULL, NULL, NULL, NULL, 0),
('ywrsQVc3F9L7oNU', '20181114092459', '17545938', 1250, 19, 23750, NULL, NULL, NULL, NULL, NULL, 0),
('S3yeQ6M0QkMBGGH', '20181128051509', '66935657', 570, 189.474, 108000, NULL, NULL, NULL, NULL, NULL, 0),
('6186jOINnKCtgFz', '20181114094349', '73648854', 500, 9, 4500, NULL, NULL, NULL, NULL, NULL, 0),
('ul2eMmQbPTkcEMx', '20181114095933', '17545938', 1250, 19, 23750, NULL, NULL, NULL, NULL, NULL, 0),
('rVYBLo4yNxE8Pfd', '20181114095933', '63285764', 5000, 14, 70000, NULL, NULL, NULL, NULL, NULL, 0),
('aCS22JXdqFhbepp', '20181114095933', '73648854', 5000, 9, 45000, NULL, NULL, NULL, NULL, NULL, 0),
('3V8iE7ZCUfwqiB', '20181128073451', '66935657', 570, 194.737, 111000, NULL, NULL, NULL, NULL, NULL, 0),
('RrIUKdX1KV3RNV4', '20181128111944', '64714882', 50, 330, 16500, NULL, NULL, NULL, NULL, NULL, 0),
('qIKlULuvmyPvzxe', '20181129064904', '17625274', 2, 5800, 11600, NULL, 2, 5800, 11600, NULL, 1),
('hS0ZUyRm0K5tZPu', '20181129064904', '75839298', 1, 2000, 2000, NULL, 1, 2000, 2000, NULL, 1),
('VTT1yMBIXTvdoxq', '20181129112124', '54748182', 60, 850, 51000, NULL, NULL, NULL, NULL, NULL, 0),
('XOA7IHR863IpLkG', '20181129112124', '64953658', 60, 400, 24000, NULL, NULL, NULL, NULL, NULL, 0),
('4ZWtAzAnwoYVnDn', '20181204102127', '11682266', 50, 275, 13750, NULL, 50, 275, 13750, NULL, 1),
('Y9SGIwSN3r5Tyso', '20181204102451', '11682266', 25, 275, 6875, NULL, 25, 275, 6875, NULL, 1),
('PFpHrs4C0kXSp5e', '20181204102451', '54731653', 50, 455, 22750, NULL, 50, 455, 22750, NULL, 1),
('DCWLpadureFA6os', '20181204102541', '11682266', 50, 275, 13750, NULL, 50, 275, 13750, NULL, 1),
('3gaG2VaemQwDMJN', '20181206053800', '54199768', 400, 88, 35200, NULL, 400, 88, 35200, NULL, 1),
('z1LW99fSQnty4Jo', '20181206053800', '15423736', 300, 82, 24600, NULL, 300, 82, 24600, NULL, 1),
('hfpfFINjkffjqyX', '20181206053800', '14613855', 200, 33, 6600, NULL, 200, 33, 6600, NULL, 1),
('AvP5IawJHQtxrCe', '20181206053800', '84291986', 200, 37, 7400, NULL, 200, 37, 7400, NULL, 1),
('JM2gDSSqMzUtCb8', '20181206063910', '19478381', 625, 486, 303750, NULL, NULL, NULL, NULL, NULL, 0),
('fQkocayQuyqfOo0', '20181206065133', '78552617', 600, 105, 63000, NULL, 600, 105, 63000, NULL, 1),
('ifFiDpct4evamlA', '20181206101139', '84291986', 600, 32, 19200, NULL, NULL, NULL, NULL, NULL, 0),
('CbV7GDvJqy2NxNm', '20181206101139', '15423736', 330, 78, 25740, NULL, NULL, NULL, NULL, NULL, 0),
('pPDJYcSSCQFjM8z', '20181206101407', '15423736', 150, 78, 11700, NULL, NULL, NULL, NULL, NULL, 0),
('iZUi7hgamj3559x', '20181206101407', '54199768', 600, 82, 49200, NULL, NULL, NULL, NULL, NULL, 0),
('ICmaHvQBpFuui1X', '20181212061218', '94553414', 175, 50, 8750, NULL, 175, 50, 8750, NULL, 1),
('xkeFcKOW4LL44uG', '20181212063010', '73813469', 400, 165.6, 66240, NULL, 400, 165.6, 66240, NULL, 1),
('mObBMiOUETK2EJi', '20181220053434', '73813469', 400, 119, 47600, NULL, 400, 119, 47600, NULL, 1),
('51oqMDSksAXfGDR', '20181220054240', '73648854', 26000, 4.197, 109122, NULL, 26000, 4.197, 109122, NULL, 1),
('9Q6E5t3YL3jJoBG', '20181220054240', '17545938', 2000, 16.697, 33394, NULL, 2000, 16.697, 33394, NULL, 1),
('27U8ACKPV5cFZar', '20181220054240', '63285764', 5000, 7.697, 38485, NULL, 5000, 7.697, 38485, NULL, 1),
('quT7fVOZBF4qseQ', '20181220063400', '34555833', 200, 210, 42000, NULL, 200, 210, 42000, NULL, 1),
('smGTBcBTZpROzFZ', '20181224074246', '95317485', 10, 1450, 14500, NULL, 10, 1450, 14500, NULL, 1),
('jPoxiVe5kkZ4RYq', '20181224074246', '97416238', 25, 900, 22500, NULL, 25, 900, 22500, NULL, 1),
('3U4rgt2BwyXSzCh', '20181224074246', '12917627', 50, 285, 14250, NULL, 50, 285, 14250, NULL, 1),
('TV34mFfO1uX40jN', '20181224093613', '12735643', 20, 700, 14000, NULL, 20, 700, 14000, NULL, 1),
('JlAmTB5RrbxWKQ6', '20181224093613', '28284394', 20, 1900, 38000, NULL, 20, 1900, 38000, NULL, 1),
('kDFB8sh1ps5fdk8', '20181224105854', '94196468', 600, 150, 90000, NULL, 600, 150, 90000, NULL, 1),
('cH65uOzqtuU94Qv', '20181224105854', '34555833', 200, 168, 33600, NULL, 200, 168, 33600, NULL, 1),
('MlYyGkSdAZC8zcG', '20181227053853', '84291986', 300, 37, 11100, NULL, NULL, NULL, NULL, NULL, 0),
('eKkFLoDurm8uvp4', '20181227053853', '54199768', 300, 88, 26400, NULL, NULL, NULL, NULL, NULL, 0),
('PCUFdHQMiILXvk5', '20181227053853', '14613855', 290, 33, 9570, NULL, NULL, NULL, NULL, NULL, 0),
('TmaYkCs5r27HLUG', '20181227053853', '15423736', 200, 82, 16400, NULL, NULL, NULL, NULL, NULL, 0),
('mJxXPdWJr7kVCUo', '20181227092254', '66935657', 1140, 194.737, 222000, NULL, 1140, 194.737, 222000, NULL, 1),
('8KyxUPWR32Z0BIw', '20181227092439', '66935657', 570, 200, 114000, NULL, 570, 200, 114000, NULL, 1),
('Ugnem9tsqt6xboQ', '20181229101639', '54748182', 25, 550, 13750, NULL, 25, 550, 13750, NULL, 1),
('DGp06v7OG0zwr9l', '20181229101639', '64953658', 25, 425, 10625, NULL, 25, 425, 10625, NULL, 1),
('LFm6BcN0YUO6bVy', '20190102051013', '73813469', 400, 165.6, 66240, NULL, 400, 165.6, 66240, NULL, 1),
('mCQGMHfoV9HgYId', '20190102051938', '94196468', 800, 150, 116000, NULL, NULL, NULL, NULL, NULL, 0),
('pqZ39PIORPtprZg', '20190102051938', '39155997', 200, 168, 33600, NULL, NULL, NULL, NULL, NULL, 0),
('YxVvcN3phHO2nb6', '20190102051938', '34555833', 200, 210, 42000, NULL, NULL, NULL, NULL, NULL, 0),
('9set38VuMTam7WG', '20190104070256', '19266228', 380, 195, 74100, NULL, 380, 195, 74100, NULL, 1),
('aFTZbwukbKdiYSJ', '20190104072436', '78552617', 600, 106, 63600, NULL, 600, 106, 63600, NULL, 1),
('DZwRxiQXN5hpR3M', '20190107093208', '19266228', 570, 195, 111150, NULL, 570, 195, 111150, NULL, 1),
('xw8bx5iVELyWx7g', '20190107095408', '19478381', 625, 472, 295000, NULL, 625, 472, 295000, NULL, 1),
('OJ4eDYsbDOzAeT7', '20190108103438', '93669648', 25, 1335, 33375, NULL, 25, 1335, 33375, NULL, 1),
('TsCJ9WJt72OjWA5', '20190108103438', '72976928', 25, 890, 22250, NULL, 25, 890, 22250, NULL, 1),
('BsJ6dUYWlHQqate', '20190110085137', '93669648', 25, 1325, 33125, NULL, 25, 1325, 33125, NULL, 1),
('3MWtYWxF8l2V7wK', '20190110085137', '72976928', 25, 850, 21250, NULL, 25, 850, 21250, NULL, 1),
('WNYSjcAzk8VuJ8A', '20190110085911', '93669648', 25, 1325, 33125, NULL, 25, 1325, 33125, NULL, 1),
('xG67VOdtps5qRTP', '20190110085911', '72976928', 25, 850, 21250, NULL, 25, 850, 21250, NULL, 1),
('PD2Y2dIsVCJVMnw', '20190121053012', '94196468', 400, 145, 58000, NULL, NULL, NULL, NULL, NULL, 0),
('NmWtY5Z978FjyUq', '20190121053012', '34555833', 200, 210, 42000, NULL, NULL, NULL, NULL, NULL, 0),
('GkUqWedCZopv3fX', '20190121075816', '78552617', 600, 104, 62400, NULL, 600, 104, 62400, NULL, 1),
('OrXewMWNZED2aEj', '20190121080222', '83138325', 1000, 8, 8000, NULL, 1000, 8, 8000, NULL, 1),
('vDSe7iyvhwxHk46', '20190213080352', '51776169', 25, 425, 10625, NULL, 25, 425, 10625, NULL, 1),
('zCuREeC8hHVkllz', '20190121080751', '38571343', 850, 24, 20400, NULL, 850, 24, 20400, NULL, 1),
('ran2SRtmmtMgqE4', '20190121081522', '59778963', 100, 185, 18500, NULL, 100, 185, 18500, NULL, 1),
('WRCcwq9ZHMRqsSK', '20190121081522', '49112765', 50, 185, 9250, NULL, 50, 185, 9250, NULL, 1),
('hCFtODqpBV5Vhsk', '20190121081522', '24548719', 25, 325, 8125, NULL, 25, 325, 8125, NULL, 1),
('TbcINyNfRsPBLHd', '20190121081759', '17625274', 2, 5800, 11600, NULL, 2, 5800, 11600, NULL, 1),
('FRdLlbTqQsuCRy3', '20190121081759', '75839298', 4, 2000, 8000, NULL, 4, 2000, 8000, NULL, 1),
('pSe7RHgJgGrDo97', '20190121093008', '64714882', 40, 350, 14000, NULL, 40, 350, 14000, NULL, 1),
('G2wMtFzYGktSHf5', '20190121093008', '44621867', 500, 75, 37500, NULL, 500, 75, 37500, NULL, 1),
('L2nRBBNWJ2oso0M', '20190121101146', '54199768', 600, 86, 51600, NULL, 600, 86, 51600, NULL, 1),
('9ALxFQmcv26xDTx', '20190121101146', '84291986', 300, 36, 10800, NULL, 300, 36, 10800, NULL, 1),
('hilNhdSp1wtHv84', '20190121101146', '14613855', 300, 33, 9900, NULL, 300, 33, 9900, NULL, 1),
('dO3Axse7ZQg12iD', '20190121102656', '94828254', 35, 325, 11375, NULL, 35, 325, 11375, NULL, 1),
('659a7L6ouzUqnoE', '20190121102656', '51776169', 25, 425, 10625, NULL, 25, 425, 10625, NULL, 1),
('i8N8Qe8EVUBFqzZ', '20190124061854', '64953658', 60, 420, 25200, NULL, 60, 420, 25200, NULL, 1),
('UNQj4M0jslRzjqe', '20190124061854', '12917627', 25, 285, 7125, NULL, 25, 285, 7125, NULL, 1),
('r6T6GGeGhr7nDbs', '20190124062122', '72976928', 50, 890, 44500, NULL, 50, 890, 44500, NULL, 1),
('bopCglEa7n1OFVr', '20190124062414', '94196468', 600, 145, 87000, NULL, 600, 145, 87000, NULL, 1),
('oYa3BKubxDSLKgg', '20190131053458', '36962713', 250, 475, 118750, NULL, 250, 475, 118750, NULL, 1),
('viw4BZhcPhMMnIw', '20190205062239', '59778963', 125, 185, 23125, NULL, 125, 185, 23125, NULL, 1),
('1ZRJcLES9X5KnpS', '20190205062239', '49112765', 25, 185, 4625, NULL, 25, 185, 4625, NULL, 1),
('uIQhTLjvTAexCOE', '20190205074216', '32716139', 200, 325, 65000, NULL, 200, 325, 65000, NULL, 1),
('gjExW1VI20Vp0Ta', '20190205074606', '36962713', 375, 475, 178125, NULL, 375, 475, 178125, NULL, 1),
('Zjy2vuCBpkr7QcR', '20190205075734', '92651552', 25, 2300, 57500, NULL, 25, 2300, 57500, NULL, 1),
('judJPgEDL7u0g0y', '20190205075955', '93669648', 25, 1335, 33375, NULL, 25, 1335, 33375, NULL, 1),
('9DwVCcyvYG8PsQB', '20190205080601', '94196468', 200, 145, 29000, NULL, 200, 145, 29000, NULL, 1),
('lOkf1thSOQLXTqC', '20190205080601', '39155997', 200, 168, 33600, NULL, 200, 168, 33600, NULL, 1),
('CWuGyExTclqVXwn', '20190205080601', '34555833', 200, 210, 42000, NULL, 200, 210, 42000, NULL, 1),
('WHAa91sANyqyiXz', '20190205080804', '99129686', 50, 290, 14500, NULL, 50, 290, 14500, NULL, 1),
('F5QNl2WIRgs4wtN', '20190206070300', '54199768', 440, 88, 38720, NULL, 440, 88, 38720, NULL, 1),
('eQwxavYNCFFCKjV', '20190206070300', '15423736', 200, 82, 16400, NULL, 200, 82, 16400, NULL, 1),
('EkPc9GaSO0m1i0M', '20190206070300', '84291986', 500, 37, 18500, NULL, 500, 37, 18500, NULL, 1),
('4P1HyCTKBYXBJIk', '20190209103203', '66935657', 950, 200, 190000, NULL, 950, 200, 190000, NULL, 1),
('VCJeJVxwaUJA7Xr', '20190209103252', '66935657', 950, 200, 190000, NULL, 950, 200, 190000, NULL, 1),
('sYBTFGXAwqzF7GB', '20190213080352', '94828254', 35, 325, 11375, NULL, 35, 325, 11375, NULL, 1),
('5OGCjv8aSi8GYbt', '20190213092833', '39155997', 200, 168, 33600, NULL, 200, 168, 33600, NULL, 1),
('Wn2JHgj45kqQzrc', '20190213092833', '94196468', 200, 145, 29000, NULL, 200, 145, 29000, NULL, 1),
('vX81v5PspyZ16dw', '20190213092833', '34555833', 200, 210, 42000, NULL, 200, 210, 42000, NULL, 1),
('YG4UIp5VCCFoqbc', '20190213094550', '66935657', 570, 200, 114000, NULL, 570, 200, 114000, NULL, 1),
('9gp1Zx4fEzaWHEu', '20190213095654', '66935657', 950, 200, 190000, NULL, 950, 200, 190000, NULL, 1),
('b5y8WZ9NltB72aq', '20190213100037', '19266228', 380, 200, 76000, NULL, 380, 200, 76000, NULL, 1),
('a06BlkEHE48LEC8', '20190213111438', '94828254', 35, 325, 11375, NULL, 35, 325, 11375, NULL, 1),
('ka14Gora1tz4ImY', '20190221110543', '11115486', 1, 9000, 9000, NULL, 1, 9000, 9000, NULL, 1),
('LyPcYmGUKKTTzPa', '20190221110543', '12917627', 50, 285, 14250, NULL, 50, 285, 14250, NULL, 1),
('ITkTABacgqXJC9d', '20190223072426', '36962713', 375, 475, 178125, NULL, 375, 475, 178125, NULL, 1),
('6NbzVB4ncE7EqJW', '20190225131949', '19478381', 750, 460, 345000, NULL, 750, 460, 345000, NULL, 1),
('T57LK0rhKUBX3tM', '20190227111532', '63838615', 25, 1050, 26250, NULL, 25, 1050, 26250, NULL, 1),
('w3UPYs6OPF5LiCH', '20190227111532', '35314534', 30, 260, 7800, NULL, 30, 260, 7800, NULL, 1),
('fzzbhpbRLBkxQym', '20190228094705', '66935657', 570, 200, 114000, NULL, 570, 200, 114000, NULL, 1),
('PHt60nWOF3XMizG', '20190228095640', '78552617', 600, 103, 61800, NULL, 600, 103, 61800, NULL, 1),
('JcNiPuPFUg2ZrnY', '20190228095740', '78552617', 600, 102, 61200, NULL, 600, 102, 61200, NULL, 1),
('TbTp39UL4O3iVrq', '20190228095834', '78552617', 600, 103, 61800, NULL, 600, 103, 61800, NULL, 1),
('sYP0BvgglvP1GY2', '20190228120257', '11682266', 50, 275, 13750, NULL, 50, 275, 13750, NULL, 1),
('6zSFqH3hpNxZjkb', '20190228120341', '11682266', 50, 275, 13750, NULL, 50, 275, 13750, NULL, 1),
('6H0a3FCdNM2y0ww', '20190228120441', '11682266', 50, 275, 13750, NULL, 50, 275, 13750, NULL, 1),
('4McZQMJ7jIh2MqK', '20190228120528', '11682266', 25, 275, 6875, NULL, 25, 275, 6875, NULL, 1),
('GOh4DQcFW7s8KFX', '20190302063515', '93669648', 25, 1335, 33375, NULL, 25, 1335, 33375, NULL, 1),
('97ZnH1MLiUbgeZy', '20190302063803', '64714882', 40, 350, 14000, NULL, 40, 350, 14000, NULL, 1),
('yZ6cVpu8aRU3Abw', '20190302063926', '59778963', 100, 185, 18500, NULL, 100, 185, 18500, NULL, 1),
('QTsblQbaAIxiUkd', '20190302063926', '49112765', 25, 185, 4625, NULL, 25, 185, 4625, NULL, 1),
('n7ckvgfP3lAvB0f', '20190409080456', '94828254', 35, 325, 11375, NULL, 35, 325, 11375, NULL, 1),
('tiQlum3b2XoSJOU', '20190302070356', '34555833', 200, 210, 42000, NULL, 200, 210, 42000, NULL, 1),
('nD1LOYjNMofY31B', '20190302070356', '94196468', 400, 145, 58000, NULL, 400, 145, 58000, NULL, 1),
('LiIkC8kOJHeRqu3', '20190302070842', '11682266', 25, 275, 6875, NULL, NULL, NULL, NULL, NULL, 0),
('O9zjuhwiD38HD6J', '20190302093938', '94828254', 35, 325, 11375, NULL, 35, 325, 11375, NULL, 1),
('iSZt4gVBJiQf7hp', '20190302093938', '51776169', 25, 425, 10625, NULL, 25, 425, 10625, NULL, 1),
('IKVrkRtMFcETCxj', '20190302093938', '24514611', 1, 6000, 6000, NULL, 1, 6000, 6000, NULL, 1),
('upEInP2FwVODWiO', '20190302093938', '17625274', 1, 5800, 5800, NULL, 1, 5800, 5800, NULL, 1),
('jGhuUxlIx0orBGg', '20190305102802', '18217271', 375, 440, 165000, NULL, 375, 440, 165000, NULL, 1),
('fH4WgVbPpTp9JQn', '20190305102802', '64953658', 200, 430, 86000, NULL, 200, 430, 86000, NULL, 1),
('G2v8gyz9IVV8BjV', '20190306113130', '15423736', 120, 82, 9840, NULL, NULL, NULL, NULL, NULL, 0),
('fiP8Ce9rKq10hlR', '20190306113130', '84291986', 500, 37, 18500, NULL, NULL, NULL, NULL, NULL, 0),
('MA2uYXws3XKjtYB', '20190306113130', '54199768', 500, 88, 44000, NULL, NULL, NULL, NULL, NULL, 0),
('IEVtTumSkYWKS7g', '20190306113130', '14613855', 100, 33, 3300, NULL, NULL, NULL, NULL, NULL, 0),
('670G5d16uL8223r', '20190309065251', '63838615', 50, 1050, 52500, NULL, 50, 1050, 52500, NULL, 1),
('L1ZtOfmtdj1JcPf', '20190309065251', '35314534', 30, 260, 7800, NULL, 30, 260, 7800, NULL, 1),
('wqlqKF6yAGCEhJI', '20190311065907', '11682266', 0, 275, 13750, NULL, 0, 275, 13750, NULL, 1),
('TkW8VYFVQn6aHm6', '20190312063526', '34555833', 200, 210, 42000, NULL, NULL, NULL, NULL, NULL, 0),
('ibnOpLWSJHmnDEn', '20190312063526', '94196468', 400, 145, 58000, NULL, NULL, NULL, NULL, NULL, 0),
('9lrSJI9M18oApwE', '20190313075417', '11682266', 50, 275, 13750, NULL, 50, 275, 13750, NULL, 1),
('9mKEaBgn5Ca1Otp', '20190313054236', '94828254', 35, 325, 11375, NULL, 35, 325, 11375, NULL, 1),
('Y9U6C8SnNHhbdlr', '20190313054236', '51776169', 25, 425, 10625, NULL, 25, 425, 10625, NULL, 1),
('Zol3dKwp5z5re5P', '20190313054236', '24514611', 2, 6000, 12000, NULL, 2, 6000, 12000, NULL, 1),
('b2sI18zNdyqRSJV', '20190313054236', '75839298', 2, 2000, 4000, NULL, 2, 2000, 4000, NULL, 1),
('OB0cuSNiYasxHZG', '20190313054236', '17625274', 2, 5800, 11600, NULL, 2, 5800, 11600, NULL, 1),
('e71R4xUwCahFnlr', '20190313062300', '66935657', 950, 185, 175750, NULL, 950, 185, 175750, NULL, 1),
('8OtB65lx9kgLSG5', '20190325062537', '93669648', 25, 1335, 33375, NULL, 25, 1335, 33375, NULL, 1),
('6madbYAg9Chgwj1', '20190325062537', '72976928', 25, 890, 22250, NULL, 25, 890, 22250, NULL, 1),
('tI2dhBXnuxUacBg', '20190325070552', '44621867', 750, 75, 56250, NULL, 750, 75, 56250, NULL, 1),
('GToT2uWPERPYVXl', '20190325070552', '64714882', 40, 350, 14000, NULL, 40, 350, 14000, NULL, 1),
('4PmHn9vQuV5mMGP', '20190325072020', '83138325', 1250, 8, 10000, NULL, 1250, 8, 10000, NULL, 1),
('khtrIVEVKSLMSgE', '20190325115633', '34555833', 400, 210, 84000, NULL, 400, 210, 84000, NULL, 1),
('iNz4CxklVr3qoNY', '20190325115633', '94196468', 400, 145, 58000, NULL, 400, 145, 58000, NULL, 1),
('EEL9k5skJz7trx6', '20190327060903', '63838615', 50, 1050, 52500, NULL, 50, 1050, 52500, NULL, 1),
('fj30X9c5dKASijD', '20190411060930', '34555833', 200, 210, 42000, NULL, 200, 210, 42000, NULL, 1),
('fAYPe3avB7ZnHtb', '20190411060930', '94196468', 400, 145, 58000, NULL, 400, 145, 58000, NULL, 1),
('cYH9I4FFGUXJsaT', '20190411055950', '19266228', 190, 195, 37050, NULL, 190, 195, 37050, NULL, 1),
('QghUTHa8DOxWCA4', '20190403071050', '93669648', 25, 1335, 33375, NULL, 25, 1335, 33375, NULL, 1),
('RwxMSGqKTBAgg9a', '20190403071358', '11682266', 50, 275, 13750, NULL, 50, 275, 13750, NULL, 1),
('A6KMFMGvArMmfaA', '20190403073705', '33896832', 0, 8, 30800, NULL, NULL, NULL, NULL, NULL, 0),
('v7CUMh8znq31Rib', '20190403073705', '51584313', 0, 9, 54000, NULL, NULL, NULL, NULL, NULL, 0),
('Mwqzgm9HLLUUnE7', '20190404062527', '94553414', 175, 50, 8750, NULL, 175, 50, 8750, NULL, 1),
('DWft3XOpT1vhe0t', '20190409080456', '51776169', 25, 425, 10625, NULL, 25, 425, 10625, NULL, 1),
('r6yqjR88rTISECa', '20190409080456', '75839298', 2, 2000, 4000, NULL, 2, 2000, 4000, NULL, 1),
('1sUiRNXwM8WlhcQ', '20190411060930', '39155997', 200, 168, 33600, NULL, 200, 168, 33600, NULL, 1),
('ifNmYBycQ4rx69N', '20190416061951', '94828254', 30, 325, 9750, NULL, 30, 325, 9750, NULL, 1),
('E4FyjyNQP8mUzaY', '20190416061951', '51776169', 25, 425, 10625, NULL, 25, 425, 10625, NULL, 1),
('6mGesdT2HGWb5US', '20190416074632', '96762451', 4000, 7, 28000, NULL, 4000, 7, 28000, NULL, 1),
('MvWBSzxhISCVzcv', '20190416074632', '64696422', 5000, 3, 15000, NULL, 5000, 3, 15000, NULL, 1),
('qVmL73glw7NYmWS', '20190416075643', '89198234', 50, 235, 11750, NULL, 50, 235, 11750, NULL, 1),
('SYM77hvCGFhWEcD', '20190416075643', '43432834', 50, 160, 8000, NULL, 50, 160, 8000, NULL, 1),
('CCFqPCkPQ5eG6wp', '20190420070124', '94196468', 400, 145, 58000, NULL, 400, 145, 58000, NULL, 1),
('uqy7850OtO4sd4B', '20190420070124', '39155997', 200, 168, 33600, NULL, 200, 168, 33600, NULL, 1),
('vYWH2lPcuJ1A3i7', '20190420072020', '19478381', 750, 465, 348750, NULL, 750, 465, 348750, NULL, 1),
('eTPWoc7H0O5EcNY', '20190420073430', '12917627', 50, 285, 14250, NULL, 50, 285, 14250, NULL, 1),
('VvBeDTaekyZEJKa', '20190430073533', '94828254', 0, 325, 9750, NULL, NULL, NULL, NULL, NULL, 0),
('L9CgEN6Ax0sEdHc', '20190422062015', '61826276', 230, 130, 29900, NULL, 230, 130, 29900, NULL, 1),
('zjTjOsjmTG7CP8l', '20190422062015', '18217271', 500, 440, 220000, NULL, 500, 440, 220000, NULL, 1),
('vojeeFtGA5i6r1P', '20190430073533', '94814935', 2, 2000, 4000, NULL, NULL, NULL, NULL, NULL, 0),
('Cu4DIZzWQn8LTUT', '20190502072126', '11682266', 50, 275, 13750, NULL, 50, 275, 13750, NULL, 1),
('nNLojXTJUC0NI7E', '20190502074118', '94814935', 12, 2000, 24000, NULL, 12, 2000, 24000, NULL, 1),
('6ApLm72JivHedmC', '20190502074118', '75839298', 6, 2000, 12000, NULL, 6, 2000, 12000, NULL, 1),
('C6ynB9YvAFHVNYZ', '20190511101950', '66935657', 570, 185, 105450, NULL, 570, 185, 105450, NULL, 1),
('drA1wv3iNKLSOEh', '20190511102505', '94828254', 30, 325, 9750, NULL, 30, 325, 9750, NULL, 1),
('6TBGqr24DqBeQcW', '20190511102505', '51776169', 25, 425, 10625, NULL, 25, 425, 10625, NULL, 1),
('wOloBgK9TwWyovy', '20190511102808', '11682266', 50, 275, 13750, NULL, 50, 275, 13750, NULL, 1),
('UOlyMFrcWQAYhZp', '20190511103116', '93669648', 50, 1335, 66750, NULL, 50, 1335, 66750, NULL, 1),
('izYxhR37fOx8KHL', '20190511103917', '63838615', 50, 1050, 52500, NULL, 50, 1050, 52500, NULL, 1),
('GsBpgzaK5MtJ0d4', '20190511104635', '39155997', 200, 168, 33600, NULL, 200, 168, 33600, NULL, 1),
('bvxDM4qSKRLQzpp', '20190511104635', '94196468', 200, 145, 29000, NULL, 200, 145, 29000, NULL, 1),
('XPIRdnIHSMwjZdd', '20190511104635', '34555833', 200, 210, 42000, NULL, 200, 210, 42000, NULL, 1),
('QLjg8kn7KfX1h7L', '20190521052604', '49112765', 50, 185, 9250, NULL, 50, 185, 9250, NULL, 1),
('lYJeHaAlecwJAr8', '20190521052604', '59778963', 200, 185, 37000, NULL, 200, 185, 37000, NULL, 1),
('h66B3JyR0LDV1wl', '20190523091122', '19266228', 380, 195, 74100, NULL, 380, 195, 74100, NULL, 1),
('2iyLO7Zcds9gOMg', '20190528095451', '92651552', 25, 2300, 57500, NULL, 25, 2300, 57500, NULL, 1),
('49P27xkYbsZIYD8', '20190530092301', '94828254', 30, 325, 9750, NULL, 30, 325, 9750, NULL, 1),
('hKN9Y950xi6akjN', '20190530092301', '51776169', 25, 425, 10625, NULL, 25, 425, 10625, NULL, 1),
('BMxfvSyepKsBzFv', '20190530093241', '94196468', 200, 145, 29000, NULL, 200, 145, 29000, NULL, 1),
('EhSZR1Kg4YiYvjX', '20190530093241', '34555833', 200, 210, 42000, NULL, 200, 210, 42000, NULL, 1),
('1q3RFovzUu07VQ8', '20190530093241', '39155997', 150, 168, 25200, NULL, 150, 168, 25200, NULL, 1),
('FxdmT0oe59F4KGP', '20190603100258', '69354628', 500, 24, 12000, NULL, 500, 24, 12000, NULL, 1),
('Pzb6aDEGaFu30xc', '20190603100258', '62191632', 500, 7, 3500, NULL, 500, 7, 3500, NULL, 1),
('ofKTadywjgcyuyW', '20190620053118', '94828254', 30, 325, 9750, NULL, 30, 325, 9750, NULL, 1),
('h0OIJXBzp3YBRO4', '20190620053118', '51776169', 25, 425, 10625, NULL, 25, 425, 10625, NULL, 1),
('Z0lM6IuMlFolfa2', '20190620053441', '19478381', 500, 465, 232500, NULL, 500, 465, 232500, NULL, 1),
('leSBdFTzNTQwZVz', '20190620060158', '51584313', 5000, 9, 45000, NULL, 5000, 9, 45000, NULL, 1),
('R7mfF7BlVFVC3W1', '20190620062638', '19266228', 380, 195, 74100, NULL, 380, 195, 74100, NULL, 1),
('cTVH56m9AbumMvO', '20190620063206', '94196468', 600, 145, 87000, NULL, NULL, NULL, NULL, NULL, 0),
('858WlltorEn965w', '20190625061753', '66935657', 380, 185, 70300, NULL, 380, 185, 70300, NULL, 1),
('yHOhZ5OGXz57ov8', '20190625073133', '44621867', 500, 75, 37500, NULL, 500, 75, 37500, NULL, 1),
('HoJlwSX4pPd3H6X', '20190625073133', '64714882', 40, 350, 14000, NULL, 40, 350, 14000, NULL, 1),
('G5ySgL5EUx4IEmA', '20190629064723', '96762451', 4000, 7, 28000, NULL, 4000, 7, 28000, NULL, 1),
('mwzUH850bm711R8', '20190629064723', '64696422', 4000, 3, 12000, NULL, 4000, 3, 12000, NULL, 1),
('xaCKji3tfBFnvwW', '20190701060240', '94828254', 0, 325, 9750, NULL, 0, 325, 9750, NULL, 1),
('2vav0XcP5jR4p89', '20190701060240', '51776169', 0, 425, 10625, NULL, 0, 425, 10625, NULL, 1),
('PKXAzCpcijj3pjt', '20190701060240', '94814935', 0, 2000, 12000, NULL, 0, 2000, 12000, NULL, 1),
('MRmNQJhbwKHIebQ', '20190701061353', '63838615', 25, 1050, 26250, NULL, 25, 1050, 26250, NULL, 1),
('Csslf1YDhzd40Ih', '20190703061251', '61826276', 230, 130, 29900, NULL, NULL, NULL, NULL, NULL, 0),
('w79D89RHQH0vHDH', '20190703061251', '18217271', 125, 440, 55000, NULL, NULL, NULL, NULL, NULL, 0),
('N3aIFOYPLg16bT9', '20190706051822', '94553414', 175, 50, 8750, NULL, NULL, NULL, NULL, NULL, 0),
('5T19fGbOxrgGkK2', '20190712065429', '59778963', 250, 185, 46250, NULL, 250, 185, 46250, NULL, 1),
('u6B52DkzQAj1nKy', '20190712065429', '24548719', 75, 325, 24375, NULL, 75, 325, 24375, NULL, 1),
('oGRupZjkaHg2qqP', '20190715072325', '78337678', 3000, 18, 54000, NULL, NULL, NULL, NULL, NULL, 0),
('SqEKhyt0SP95o9q', '20190715111635', '18217271', 125, 440, 55000, NULL, 125, 440, 55000, NULL, 1),
('2GTTORJbThwU59M', '20190715114237', '64714882', 40, 350, 14000, NULL, NULL, NULL, NULL, NULL, 0),
('Nzai2Lnk5w9MbuZ', '20190715120927', '12917627', 50, 285, 14250, NULL, NULL, NULL, NULL, NULL, 0),
('vIawUrgn82v0rFT', '20190715122302', '43432834', 100, 160, 16000, NULL, NULL, NULL, NULL, NULL, 0),
('gG7ISOXNghtb1ET', '20190715122302', '89198234', 200, 235, 47000, NULL, NULL, NULL, NULL, NULL, 0),
('mokEjlzKE7ACoy5', '20190715122302', '33997446', 300, 85, 25500, NULL, NULL, NULL, NULL, NULL, 0),
('qnQ8n6KenaP2wdq', '20190716053647', '41364337', 4000, 8, 32000, NULL, 4000, 8, 32000, NULL, 1),
('qYWs4wOCN72Inda', '20190716053647', '29781619', 4000, 4, 16000, NULL, 4000, 4, 16000, NULL, 1),
('5VnIezdDyiO6zIW', '20190722061430', '93669648', 25, 1335, 33375, NULL, 25, 1335, 33375, NULL, 1),
('K6hP8s2danwCEo6', '20190722061430', '72976928', 50, 890, 44500, NULL, 50, 890, 44500, NULL, 1),
('kEHunb8KDGyisSc', '20190725071139', '18217271', 250, 440, 110000, NULL, 250, 440, 110000, NULL, 1),
('nxyf9CPGrzayZXl', '20190725071139', '26436961', 25, 1480, 37000, NULL, 25, 1480, 37000, NULL, 1),
('6hjrgN3mel8rIoh', '20190725073412', '43432834', 100, 160, 16000, NULL, 100, 160, 16000, NULL, 1),
('6OnlfAz5jxCLYUB', '20190727081714', '94196468', 600, 145, 87000, NULL, 600, 145, 87000, NULL, 1),
('DqyNGNGPwJ0vyzB', '20190727082055', '11682266', 25, 275, 6875, NULL, 25, 275, 6875, NULL, 1),
('B8UC7kTSmYRkmos', '20190801061957', '94828254', 30, 325, 9750, NULL, 30, 325, 9750, NULL, 1),
('HHBxwOSWAmKbHNk', '20190801061957', '51776169', 25, 425, 10625, NULL, 25, 425, 10625, NULL, 1),
('U9iX77GIoelQHw0', '20190801062653', '11682266', 25, 275, 6875, NULL, 25, 275, 6875, NULL, 1),
('yn2xiR87UjRdCDt', '20190801063652', '66575412', 200, 386, 77200, NULL, 200, 386, 77200, NULL, 1),
('RHznmioJ182PmMi', '20190802075956', '51584313', 1700, 9, 15300, NULL, 1700, 9, 15300, NULL, 1),
('dL3rAhLtMLCwwvn', '20190802075626', '51584313', 3000, 9, 27000, NULL, 3000, 9, 27000, NULL, 1),
('dEKPBrbo0ygjnHS', '20190802075626', '17831699', 2000, 13, 26000, NULL, 2000, 13, 26000, NULL, 1),
('axN9LtVRlYKRzMX', '20190802075626', '42392732', 625, 30, 18750, NULL, 625, 30, 18750, NULL, 1),
('yFFBZAsim00QvrE', '20190802075956', '33896832', 3500, 8, 28000, NULL, 3500, 8, 28000, NULL, 1),
('MXBXWdT5q278wuo', '20190815063529', '18217271', 250, 440, 110000, NULL, NULL, NULL, NULL, NULL, 0),
('QqwRFbv9y1tZWf5', '20190819063212', '33997446', 300, 85, 25500, NULL, 300, 85, 25500, NULL, 1),
('PI4cysy7gSULE2L', '20190819063212', '59369644', 100, 235, 23500, NULL, 100, 235, 23500, NULL, 1),
('qCq0LcDlhWUYGeW', '20190823064543', '11682266', 50, 275, 13750, NULL, 50, 275, 13750, NULL, 1),
('jOg6vW57jWf3ris', '20190828061534', '94828254', 40, 325, 13000, NULL, 40, 325, 13000, NULL, 1),
('y1Z2IVED6wKaVKm', '20190906103658', '45265761', 0, 525, 131250, NULL, 0, 525, 131250, NULL, 1),
('IFeH2Hb1b19ZXkZ', '20190906104133', '94196468', 400, 145, 58000, NULL, 400, 145, 58000, NULL, 1),
('rJzZwTQc6LgdFx7', '20190916052618', '18217271', 200, 440, 88000, NULL, 200, 440, 88000, NULL, 1),
('kDRxcNidRzAt6Mt', '20191003063215', '94828254', 40, 325, 13000, NULL, 40, 325, 13000, NULL, 1),
('kexeSx1zRvBU9q', '20191003063215', '51776169', 25, 425, 10625, NULL, 25, 425, 10625, NULL, 1),
('VjK2a8SSG0DJz9P', '20191003064919', '93669648', 25, 1335, 33375, NULL, 25, 1335, 33375, NULL, 1),
('VDdnNyEEdJU7k0p', '20191003065235', '72976928', 25, 890, 22250, NULL, 25, 890, 22250, NULL, 1),
('MRTYD13mYAu3zIU', '20191003065500', '11682266', 25, 275, 6875, NULL, 25, 275, 6875, NULL, 1),
('vcMKYh4hg96U0tF', '20191003065942', '94196468', 400, 145, 58000, NULL, 400, 145, 58000, NULL, 1),
('g3S2fzxlDFjNOLz', '20191003071121', '33896832', 2500, 8, 20000, NULL, 2500, 8, 20000, NULL, 1),
('WQA3qopeprJ3x0C', '20191023113229', '94196468', 400, 145, 58000, NULL, 400, 145, 58000, NULL, 1),
('WZgyrxmtZSEdpVg', '20191023113229', '34555833', 200, 210, 42000, NULL, 200, 210, 42000, NULL, 1),
('iqWz7xFUfz7NVuE', '20191023113512', '93669648', 25, 1335, 33375, NULL, 25, 1335, 33375, NULL, 1),
('ELl7yKWKJoyRU9Y', '20191023113512', '72976928', 25, 890, 22250, NULL, 25, 890, 22250, NULL, 1),
('6gbVsfTaK8ItYBR', '20191023113934', '78337678', 3000, 18, 54000, NULL, 3000, 18, 54000, NULL, 1),
('XMb9ip0vgTBPqW9', '20191023114148', '11682266', 50, 275, 13750, NULL, 50, 275, 13750, NULL, 1),
('TUWlEwumE3ZYbJY', '20191023114545', '63838615', 50, 1050, 52500, NULL, 50, 1050, 52500, NULL, 1),
('Cws0q7keNk1Y8Zz', '20191025114107', '94828254', 40, 325, 13000, NULL, 40, 325, 13000, NULL, 1),
('fnZ9z2UVqYc6t91', '20191025114107', '17625274', 2, 5800, 11600, NULL, 2, 5800, 11600, NULL, 1),
('H9EJ9thyuPXbBsi', '20191025114107', '94814935', 2, 2000, 4000, NULL, 2, 2000, 4000, NULL, 1),
('RkjpbTelF6ij873', '20191025114107', '75839298', 2, 2000, 4000, NULL, 2, 2000, 4000, NULL, 1),
('GgOGBCBKl6yfDHP', '20191025114358', '51776169', 25, 425, 10625, NULL, 25, 425, 10625, NULL, 1),
('nslEedAhMUt28cu', '20191113105725', '94828254', 35, 325, 11375, NULL, 35, 325, 11375, NULL, 1),
('T63VIDQmKZCDqsI', '20191113105725', '51776169', 25, 425, 10625, NULL, 25, 425, 10625, NULL, 1),
('GflTId3CdXBYjqQ', '20191113110108', '66935657', 570, 185, 105450, NULL, 570, 185, 105450, NULL, 1),
('92XNWoGhodKGmdD', '20191113111002', '36962713', 250, 475, 118750, NULL, 250, 475, 118750, NULL, 1),
('R55SWCE4mwCMAJQ', '20191113112019', '96762451', 4000, 7, 28000, NULL, 4000, 7, 28000, NULL, 1),
('wOqjavacqlRlIoM', '20191113112019', '64696422', 5000, 3, 15000, NULL, 5000, 3, 15000, NULL, 1),
('uE7J8MhzvhhcdSF', '20191113112617', '94196468', 400, 145, 58000, NULL, 400, 145, 58000, NULL, 1),
('KWuYynkKbTgAYN5', '20191113135849', '95949111', 30, 850, 25500, NULL, 30, 850, 25500, NULL, 1),
('QG7aAKSGNmyZOOk', '20191113141140', '45265761', 200, 525, 105000, NULL, 200, 525, 105000, NULL, 1),
('ZzzkayoVKnI3Vhk', '20191119110530', '11682266', 50, 275, 13750, NULL, 50, 275, 13750, NULL, 1),
('3GJAUIeNvT39tMC', '20191119110923', '94196468', 400, 145, 58000, NULL, 400, 145, 58000, NULL, 1),
('LKWKds2MgU1aekH', '20191126064630', '26249861', 3000, 9, 27000, NULL, 3000, 9, 27000, NULL, 1),
('upxQ2iBiDewmhsG', '20191126064630', '93766577', 3000, 10, 30000, NULL, 3000, 10, 30000, NULL, 1),
('dcS7QaL8QOH3uie', '20191126064630', '57446521', 500, 24, 12000, NULL, 500, 24, 12000, NULL, 1),
('LGnYqBJePmk6zkO', '20191126070423', '93766577', 1250, 10, 12500, NULL, 1250, 10, 12500, NULL, 1),
('MukLck5sM7AEjbQ', '20191126070744', '57446521', 250, 24, 6000, NULL, NULL, NULL, NULL, NULL, 0),
('FClnXAxv7N6rzNk', '20191126070744', '97394291', 2000, 8, 16000, NULL, NULL, NULL, NULL, NULL, 0),
('pQCUdnECS2H8o2I', '20191126070744', '93766577', 3000, 10, 30000, NULL, NULL, NULL, NULL, NULL, 0),
('jGsQO0ITLnjsAnF', '20191126070744', '26249861', 3000, 9, 27000, NULL, NULL, NULL, NULL, NULL, 0),
('Nj7prNTXWuBaTee', '20191127062946', '93766577', 3000, 10, 30000, NULL, NULL, NULL, NULL, NULL, 0),
('grrVWkLC4pZ0C6u', '20191127062946', '26249861', 4000, 9, 36000, NULL, NULL, NULL, NULL, NULL, 0),
('eMzryvuehxIFsrw', '20191127062946', '88776688', 1000, 16, 16000, NULL, NULL, NULL, NULL, NULL, 0),
('XfikciBP05sZa7C', '20191129115946', '94196468', 400, 145, 58000, NULL, 400, 145, 58000, NULL, 1),
('7ZlKYhmjCW1n2rY', '20191204060144', '94828254', 35, 325, 11375, NULL, 35, 325, 11375, NULL, 1),
('OFeNYnELyCq2Drr', '20191204060144', '51776169', 25, 425, 10625, NULL, 25, 425, 10625, NULL, 1),
('WfgqM8bBzkLdnDs', '20191214055053', '63838615', 25, 1050, 26250, NULL, 25, 1050, 26250, NULL, 1),
('QNcb0BPiymt130p', '20191214055444', '12917627', 50, 285, 14250, NULL, 50, 285, 14250, NULL, 1),
('MlpAAqx4zAdulj7', '20191216061342', '11682266', 50, 275, 13750, NULL, 50, 275, 13750, NULL, 1),
('MYtBSPzvkqcR03Q', '20191216071117', '82696283', 20, 250, 5000, NULL, 20, 250, 5000, NULL, 1),
('ES8Aonmz9BZxbHb', '20191216071842', '54199768', 400, 88, 35200, NULL, 400, 88, 35200, NULL, 1),
('ZDnRoW93VlAmuEE', '20191216071842', '15423736', 300, 82, 24600, NULL, 300, 82, 24600, NULL, 1),
('rsqCbvcvUl0K9Xk', '20191216071842', '84291986', 420, 37, 15540, NULL, 420, 37, 15540, NULL, 1),
('apcJ5iCJysasToD', '20191216071842', '14613855', 280, 33, 9240, NULL, 280, 33, 9240, NULL, 1),
('UHeseV2garWf9Qd', '20191216073931', '15423736', 95, 82, 7790, NULL, 95, 82, 7790, NULL, 1),
('woZnaujlEpGQvxN', '20191216073931', '54199768', 365, 88, 32120, NULL, 365, 88, 32120, NULL, 1),
('3kdqMARbLeg2zq1', '20191216073931', '84291986', 300, 37, 11100, NULL, 300, 37, 11100, NULL, 1),
('szmbJnJJaRcTnO5', '20191216073931', '82696283', 30, 250, 7500, NULL, 30, 250, 7500, NULL, 1),
('UIjO4cy49AmYvog', '20191216073931', '14613855', 200, 33, 6600, NULL, 200, 33, 6600, NULL, 1),
('8PtPmvuri1Tu1qO', '20191216074502', '54199768', 530, 88, 46640, NULL, 530, 88, 46640, NULL, 1),
('ZIHMrD7NWIKwPEe', '20191216074502', '15423736', 220, 82, 18040, NULL, 220, 82, 18040, NULL, 1),
('qfphMDNuUJ9P28F', '20191216075517', '54199768', 300, 88, 26400, NULL, 300, 88, 26400, NULL, 1),
('sFgJz6LOgJA5b3K', '20191216075517', '84291986', 890, 37, 32930, NULL, 890, 37, 32930, NULL, 1),
('98ZG8THBNEZJxHp', '20191216075517', '14613855', 300, 33, 9900, NULL, 300, 33, 9900, NULL, 1),
('TLxBWgOXqWmaJ66', '20191216075517', '84291986', 190, 37, 7030, NULL, 190, 37, 7030, NULL, 1),
('doY5lk0mEQTejjJ', '20191217082527', '15423736', 100, 82, 8200, NULL, 100, 82, 8200, NULL, 1),
('9cSr1Vtvf8i8qjJ', '20191217082527', '14613855', 200, 33, 6600, NULL, 200, 33, 6600, NULL, 1),
('hysfdYfeMkv9WqG', '20191217082527', '54199768', 300, 88, 26400, NULL, 300, 88, 26400, NULL, 1),
('4e7CkObTHuS6IJS', '20191217082527', '54199768', 100, 88, 8800, NULL, 100, 88, 8800, NULL, 1),
('XDz9oEMEJHOFobL', '20191218061354', '84291986', 200, 37, 7400, NULL, 200, 37, 7400, NULL, 1),
('IgmAXTs6mpGVaT0', '20191218061354', '14613855', 100, 33, 3300, NULL, 100, 33, 3300, NULL, 1),
('XlLqrBkJNwHB2Tx', '20191218061354', '54199768', 170, 88, 14960, NULL, 170, 88, 14960, NULL, 1),
('PWTIJrQKEQk8MJA', '20191218061354', '82696283', 60, 250, 15000, NULL, 60, 250, 15000, NULL, 1),
('AbGRQGey91EAQ7r', '20191218061354', '15423736', 180, 82, 14760, NULL, 180, 82, 14760, NULL, 1),
('tmRSFLTZE5soWuW', '20191218064929', '54199768', 400, 88, 35200, NULL, 400, 88, 35200, NULL, 1),
('VthXXTGUwVrtQef', '20191218064929', '15423736', 80, 82, 6560, NULL, 80, 82, 6560, NULL, 1),
('46fhjOmNHwd0nc2', '20191218064929', '14613855', 100, 33, 3300, NULL, 100, 33, 3300, NULL, 1),
('etw8naRHU5QUOoJ', '20191218064929', '84291986', 200, 37, 7400, NULL, 200, 37, 7400, NULL, 1),
('On6IdWUfYMlsOQp', '20191218124419', '51776169', 25, 425, 10625, NULL, 25, 425, 10625, NULL, 1),
('ey0ZAPGufPNtGGC', '20191218125321', '44621867', 375, 75, 28125, NULL, 375, 75, 28125, NULL, 1),
('Rcr6Rb0Z0p3doBR', '20191218125321', '64714882', 40, 350, 14000, NULL, 40, 350, 14000, NULL, 1),
('m63ZHVe1gN2sTKn', '20191230081915', '93669648', 25, 1335, 33375, NULL, 25, 1335, 33375, NULL, 1),
('lmyQPztntEcwLvZ', '20191230081915', '72976928', 25, 890, 22250, NULL, 25, 890, 22250, NULL, 1),
('UyiukNCHJXw2T88', '20191230082138', '94196468', 400, 145, 58000, NULL, 400, 145, 58000, NULL, 1),
('IyrjjnUpftUrsLz', '20200106062636', '94828254', 35, 325, 11375, NULL, 35, 325, 11375, NULL, 1),
('r6pUwH7vyvb2TrW', '20200106062636', '51776169', 25, 425, 10625, NULL, 25, 425, 10625, NULL, 1),
('etmUG2HHw1CfcH', '20200108055154', '26249861', 3000, 9, 27000, NULL, 3000, 9, 27000, NULL, 1),
('iKHj2DoUrgA6eEY', '20200108055154', '93766577', 5000, 10, 50000, NULL, 5000, 10, 50000, NULL, 1),
('y57E98JWxjEYqI9', '20200108055442', '34555833', 200, 210, 42000, NULL, 200, 210, 42000, NULL, 1),
('GVMmGs76eHr4fb4', '20200114061307', '84291986', 100, 37, 3700, NULL, NULL, NULL, NULL, NULL, 0),
('5gTYkaIUvi0A8OT', '20200114061307', '14613855', 300, 33, 9900, NULL, NULL, NULL, NULL, NULL, 0),
('MZXjoKpF2DgDGAT', '20200114061307', '15423736', 150, 82, 12300, NULL, NULL, NULL, NULL, NULL, 0),
('C3eNjOUphGXnvBT', '20200114061307', '54199768', 360, 88, 31680, NULL, NULL, NULL, NULL, NULL, 0),
('hqO5gghjiahp7Lx', '20200114061307', '58283532', 100, 16, 1600, NULL, NULL, NULL, NULL, NULL, 0),
('K1tTkZwucYwgRhW', '20200114062523', '66935657', 760, 185, 140600, NULL, 760, 185, 140600, NULL, 1),
('Xwfom5Jjnj69A6p', '20200114062801', '11682266', 50, 275, 13750, NULL, 50, 275, 13750, NULL, 1),
('YgvKz0MenhTxesN', '20200114063520', '94553414', 165, 50, 8250, NULL, 165, 50, 8250, NULL, 1),
('byf2HnGS59OgXNv', '20200127055101', '94196468', 400, 145, 58000, NULL, NULL, NULL, NULL, NULL, 0),
('vrUcKmYbjyPQhHJ', '20200214112129', '94828254', 35, 325, 11375, NULL, 35, 325, 11375, NULL, 1),
('hnIhjklodAHBCQf', '20200309074242', '44621867', 500, 75, 37500, NULL, 500, 75, 37500, NULL, 1),
('y2QVBvQbwzAhgDb', '20200214112129', '51776169', 25, 425, 10625, NULL, 25, 425, 10625, NULL, 1),
('qHuvlpt12sDxasC', '20200214113832', '63444867', 570, 240, 136800, NULL, 570, 240, 136800, NULL, 1),
('DL1OMYZOePC2TF3', '20200217070225', '94196468', 200, 145, 29000, NULL, 200, 145, 29000, NULL, 1),
('RIuO2kgsEz1Sfgj', '20200217070225', '34555833', 200, 210, 42000, NULL, 200, 210, 42000, NULL, 1),
('AJsl9lFtSQpwvxV', '20200217070843', '17593768', 50, 1250, 62500, NULL, 50, 1250, 62500, NULL, 1),
('omJDNWvAN7LYvZB', '20200217071458', '63444867', 380, 240, 91200, NULL, 380, 240, 91200, NULL, 1),
('2FIr0xB81Abq3tb', '20200217072831', '54199768', 550, 88, 48400, NULL, 550, 88, 48400, NULL, 1),
('cfN3abenIxmZ5IM', '20200217072831', '15423736', 200, 82, 16400, NULL, 200, 82, 16400, NULL, 1),
('DbxQeQyGnUjFwVA', '20200217073227', '11682266', 25, 275, 6875, NULL, 25, 275, 6875, NULL, 1),
('K5VaTseDcaP6vEc', '20200217074035', '26249861', 4000, 9, 36000, NULL, 4000, 9, 36000, NULL, 1),
('1gMkuHAmDUh3ea2', '20200217074035', '93766577', 4000, 10, 40000, NULL, 4000, 10, 40000, NULL, 1),
('C6vQcZ4Z6gXDrPJ', '20200225103400', '94196468', 400, 145, 58000, NULL, 400, 145, 58000, NULL, 1),
('RqY2iG0Eg2RmQuJ', '20200309073202', '94828254', 35, 325, 11375, NULL, 35, 325, 11375, NULL, 1),
('UsBQbn2D8b8djFP', '20200309073202', '51776169', 25, 425, 10625, NULL, 25, 425, 10625, NULL, 1),
('KYabFKRnxve4ZRq', '20200309073325', '94196468', 300, 145, 43500, NULL, 300, 145, 43500, NULL, 1),
('yb5lMFoGXV6EJop', '20200309074242', '64714882', 20, 350, 7000, NULL, 20, 350, 7000, NULL, 1),
('SXSnLkZnoyx1MWW', '20200309075026', '66575412', 200, 386, 77200, NULL, 200, 386, 77200, NULL, 1),
('RiPl9jq8w3hjTA4', '20200309080950', '25538276', 30, 550, 16500, NULL, 30, 550, 16500, NULL, 1),
('UUB1JgNLLLuPrz7', '20200309080950', '95949111', 30, 850, 25500, NULL, 30, 850, 25500, NULL, 1),
('iLhsa1V2F5e4UwB', '20200309080950', '12583444', 10, 2300, 23000, NULL, 10, 2300, 23000, NULL, 1),
('NLIqkTmGfbM5GQW', '20200309080950', '28899367', 100, 85, 8500, NULL, 100, 85, 8500, NULL, 1),
('PS0bXKdFWBZX5DR', '20200310112100', '94954496', 20, 1300, 26000, NULL, 20, 1300, 26000, NULL, 1),
('GnnSsfZSm2dFShH', '20200310112100', '29993596', 20, 1300, 26000, NULL, 20, 1300, 26000, NULL, 1),
('sewSqhm4QifzeZz', '20200310112100', '83812165', 25, 630, 15750, NULL, 25, 630, 15750, NULL, 1),
('HVNCXnHBqFyAmXO', '20200312065310', '66935657', 570, 185, 105450, NULL, 570, 185, 105450, NULL, 1),
('9l9jyNfGYbRpEwC', '20200312070242', '11682266', 50, 275, 13750, NULL, 50, 275, 13750, NULL, 1),
('vLyRBzIIvmkhWyc', '20200314075027', '77415412', 500, 480, 240000, NULL, 500, 480, 240000, NULL, 1),
('W3oU15iwmxyWS47', '20200317063326', '57611555', 50, 240, 12000, NULL, 50, 240, 12000, NULL, 1),
('gWLAaxs1oREn2kz', '20200317063326', '92354743', 50, 240, 12000, NULL, 50, 240, 12000, NULL, 1),
('IuVslY3qicboB4b', '20200317064220', '65929814', 400, 115, 46000, NULL, 400, 115, 46000, NULL, 1),
('SmWYWHhpr93bYoh', '20200317064415', '39155997', 200, 168, 33600, NULL, 200, 168, 33600, NULL, 1),
('XvnHUyZc8iXencR', '20200317064415', '34555833', 200, 210, 42000, NULL, 200, 210, 42000, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_report`
--

CREATE TABLE `product_report` (
  `date` varchar(50) DEFAULT NULL,
  `product_id` varchar(100) DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `account` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_return`
--

CREATE TABLE `product_return` (
  `return_id` varchar(30) CHARACTER SET latin1 NOT NULL,
  `product_id` varchar(20) CHARACTER SET latin1 NOT NULL,
  `product_uuid` int(11) NOT NULL DEFAULT -1,
  `invoice_id` varchar(20) CHARACTER SET latin1 NOT NULL,
  `purchase_id` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `date_purchase` varchar(20) CHARACTER SET latin1 NOT NULL,
  `date_return` varchar(30) CHARACTER SET latin1 NOT NULL,
  `byy_qty` float NOT NULL,
  `ret_qty` float NOT NULL,
  `customer_id` varchar(20) CHARACTER SET latin1 NOT NULL,
  `supplier_id` varchar(30) CHARACTER SET latin1 NOT NULL,
  `product_rate` float NOT NULL,
  `deduction` float NOT NULL,
  `total_deduct` float NOT NULL,
  `total_tax` float NOT NULL,
  `total_ret_amount` float NOT NULL,
  `net_total_amount` float NOT NULL,
  `reason` text CHARACTER SET latin1 NOT NULL,
  `usablity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_return`
--

INSERT INTO `product_return` (`return_id`, `product_id`, `product_uuid`, `invoice_id`, `purchase_id`, `date_purchase`, `date_return`, `byy_qty`, `ret_qty`, `customer_id`, `supplier_id`, `product_rate`, `deduction`, `total_deduct`, `total_tax`, `total_ret_amount`, `net_total_amount`, `reason`, `usablity`) VALUES
('419992582782673', 'D844', 57, '3429359412', NULL, '2020-03-13', '2020-03-14', 2, 1, 'XXZ64ZOPOX8QRBR', '', 20, 0, 0, 0, 18, 18, '', 1),
('478214763986957', 'D800', 3997, '7212258431', NULL, '2020-03-14', '2020-03-17', 550, 5, '49ZR1Z3U5QS3RDA', '', 5400, 0, 0, 0, 27000, 40980, '', 1),
('653957978343256', 'Q854', 3921, '7212258431', NULL, '2020-03-14', '2020-03-17', 12, 4, '49ZR1Z3U5QS3RDA', '', 375, 0, 0, 0, 1500, 40980, '', 1),
('571526837998719', 'Q850', 1851, '7212258431', NULL, '2020-03-14', '2020-03-17', 3, 3, '49ZR1Z3U5QS3RDA', '', 300, 0, 0, 0, 900, 40980, '', 1),
('886357244712426', 'G800', 3995, '7212258431', NULL, '2020-03-14', '2020-03-17', 5, 2, '49ZR1Z3U5QS3RDA', '', 1390, 0, 0, 0, 2780, 40980, '', 1),
('817319365974542', 'G3033', 4187, '7212258431', NULL, '2020-03-14', '2020-03-17', 2, 4, '49ZR1Z3U5QS3RDA', '', 2600, 0, 0, 0, 8800, 40980, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_stock`
--

CREATE TABLE `product_stock` (
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_supplier`
--

CREATE TABLE `product_supplier` (
  `product_id` varchar(100) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_model` varchar(100) DEFAULT NULL,
  `supplier_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_report`
--

CREATE TABLE `purchase_report` (
  `purchase_date` varchar(50) DEFAULT NULL,
  `chalan_no` varchar(100) DEFAULT NULL,
  `supplier_id` varchar(100) DEFAULT NULL,
  `purchase_detail_id` varchar(100) DEFAULT NULL,
  `purchase_id` varchar(100) DEFAULT NULL,
  `product_id` varchar(100) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `total_amount` float DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sales_actual`
--

CREATE TABLE `sales_actual` (
  `DATE` varchar(50) DEFAULT NULL,
  `supplier_id` varchar(100) DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `no_transection` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sales_report`
--

CREATE TABLE `sales_report` (
  `date` varchar(50) DEFAULT NULL,
  `invoice_id` varchar(100) DEFAULT NULL,
  `invoice_details_id` varchar(100) DEFAULT NULL,
  `customer_id` varchar(100) DEFAULT NULL,
  `supplier_id` varchar(100) DEFAULT NULL,
  `product_id` varchar(100) DEFAULT NULL,
  `product_model` varchar(100) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `sell_rate` float DEFAULT NULL,
  `supplier_rate` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sale_order`
--

CREATE TABLE `sale_order` (
  `invoice_id` varchar(100) NOT NULL,
  `customer_id` varchar(100) NOT NULL,
  `date` varchar(50) DEFAULT NULL,
  `total_amount` float NOT NULL,
  `invoice` varchar(255) NOT NULL,
  `invoice_discount` float DEFAULT NULL COMMENT 'invoice discount',
  `total_discount` float DEFAULT NULL COMMENT 'total invoice discount',
  `total_tax` float DEFAULT NULL,
  `invoice_details` text NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sale_order`
--

INSERT INTO `sale_order` (`invoice_id`, `customer_id`, `date`, `total_amount`, `invoice`, `invoice_discount`, `total_discount`, `total_tax`, `invoice_details`, `status`) VALUES
('5779123499', '2BKRPZZLIX58KYN', '2019-07-04', 14920, '1002', 0, 0, 0, '', 1),
('9447424184', '{customer_id}', '2019-04-24', 13600, '1001', 0, 0, 0, '', 1),
('6322533774', 'MV3IHBNXPF7KDK9', '2019-07-18', 3380, '1003', 0, 0, 0, '', 1),
('5286928415', 'W7GIUB34GGM92OM', '2019-08-20', 12510, '1004', 0, 1390, 0, '', 1),
('6825458722', '2BKRPZZLIX58KYN', '2019-09-04', 4140, '1005', 0, 460, 0, '', 1),
('5644695188', 'W7GIUB34GGM92OM', '2019-11-09', 742.5, '1006', 0, 82.5, 0, '', 1),
('6766744715', '2BKRPZZLIX58KYN', '2020-01-17', 105, '1007', 0, 0, 0, '', 1),
('9662825694', '2BKRPZZLIX58KYN', '2020-01-17', 210, '1008', 0, 0, 0, '', 1),
('8171742125', 'MV3IHBNXPF7KDK9', '2020-02-06', 44150, '1009', 0, 0, 0, '', 1),
('8362367423', 'NDBHXHGC4FW6U29', '2020-03-16', 732303, '1010', 0, 38542, 0, '', 1),
('5271732972', 'MV3IHBNXPF7KDK9', '2020-03-19', 240, '1011', 0, 0, 0, '', 0),
('3168711688', 'MV3IHBNXPF7KDK9', '2020-03-19', 240, '1012', 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sale_order_details`
--

CREATE TABLE `sale_order_details` (
  `invoice_details_id` varchar(100) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `product_uuid` int(11) NOT NULL DEFAULT -1,
  `quantity` float NOT NULL,
  `remaining_quantity` float DEFAULT NULL,
  `rate` float NOT NULL,
  `supplier_rate` float DEFAULT NULL,
  `total_price` float NOT NULL,
  `discount` float DEFAULT NULL,
  `discount_per` varchar(15) DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `paid_amount` float DEFAULT 0,
  `due_amount` float NOT NULL DEFAULT 0,
  `status` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sale_order_details`
--

INSERT INTO `sale_order_details` (`invoice_details_id`, `invoice_id`, `product_id`, `product_uuid`, `quantity`, `remaining_quantity`, `rate`, `supplier_rate`, `total_price`, `discount`, `discount_per`, `tax`, `paid_amount`, `due_amount`, `status`) VALUES
('637682664262867', '5779123499', 'G1939', 643, 0, NULL, 2300, 0, 2300, 0, '', 0, 0, 14920, 1),
('365376798398774', '9447424184', 'G800', 3479, 0, NULL, 1350, 0, 1350, 0, '', 0, 0, 13600, 1),
('154186255214652', '9447424184', 'G801', 3494, 0, NULL, 1350, 0, 1350, 0, '', 0, 0, 13600, 1),
('189864481166496', '9447424184', 'G802', 3491, 0, NULL, 1350, 0, 1350, 0, '', 0, 0, 13600, 1),
('588296587443363', '9447424184', 'G803', 3506, 0, NULL, 1350, 0, 1350, 0, '', 0, 0, 13600, 1),
('596459289845941', '9447424184', 'G804', 3509, 0, NULL, 1350, 0, 1350, 0, '', 0, 0, 13600, 1),
('395386233322398', '9447424184', 'G805', 3512, 0, NULL, 1350, 0, 1350, 0, '', 0, 0, 13600, 1),
('343752367928278', '9447424184', 'G806', 3500, 0, NULL, 1350, 0, 1350, 0, '', 0, 0, 13600, 1),
('255767273172319', '9447424184', 'G807', 3503, 0, NULL, 1350, 0, 1350, 0, '', 0, 0, 13600, 1),
('736955215481528', '9447424184', 'G808', 3497, 0, NULL, 1350, 0, 1350, 0, '', 0, 0, 13600, 1),
('523454248911875', '9447424184', 'G825', 82, 0, NULL, 1450, 0, 1450, 0, '', 0, 0, 13600, 1),
('399251784223537', '5779123499', 'Q1939', 642, 0, NULL, 600, 0, 600, 0, '', 0, 0, 14920, 1),
('991532781424491', '5779123499', 'G1939', 643, 0, NULL, 2300, 0, 2300, 0, '', 0, 0, 14920, 1),
('646185968266351', '5779123499', 'Q1939', 642, 0, NULL, 600, 0, 600, 0, '', 0, 0, 14920, 1),
('356424685667792', '5779123499', 'D1939', 641, 0, NULL, 9120, 0, 9120, 0, '', 0, 0, 14920, 1),
('756183728753775', '1003', '54731653', 17, 13, 10, 260, 0, 3380, 0, '', 0, 0, 3380, 1),
('169713736311267', '1003', '75684458', 16, 10, 9, 290, 0, 0, 0, '', 0, 0, 3380, 1),
('356499459836819', '1004', 'G1939', 643, 5, 5, 2300, 0, 11500, 0.01, '10', 0, 0, 12510, 1),
('446273796411427', '1004', 'Q1939', 642, 4, 4, 600, 0, 2400, 0.01, '10', 0, 0, 12510, 1),
('341912372663557', '1005', 'G1939', 643, 2, 2, 2300, 0, 4600, 0.01, '10', 0, 0, 4140, 1),
('163286418436278', '1006', '11682266', 15, 3, 3, 275, 0, 825, 0.01, '10', 0, 0, 742.5, 1),
('544424194274518', '1007', '78552617', 2, 1, 0, 105, 0, 105, 0, '', 0, 0, 105, 1),
('772682835423898', '1008', '78552617', 2, 2, 0, 105, 0, 210, 0, '', 0, 0, 210, 1),
('876434792452768', '1009', 'G2022', 2183, 4, 4, 2350, 0, 9400, 0, '', 0, 0, 44150, 1),
('342258781149249', '1009', 'G816', 70, 15, 15, 1450, 0, 21750, 0, '', 0, 0, 44150, 1),
('371685563122452', '1009', 'D826', 81, 4, 4, 3250, 0, 13000, 0, '', 0, 0, 44150, 1),
('736886614485715', '1010', 'D800', 3481, 50, 50, 5400, 0, 270000, 0.01, '10', 0, 0, 367362, 1),
('585178688231198', '1010', 'D850', 1852, 6, 6, 3550, 0, 21300, 0.01, '10', 0, 0, 367362, 1),
('315578779137112', '1010', 'D2000', 2107, 12, 12, 9740, 0, 116880, 0.01, '10', 0, 0, 367362, 1),
('972343293195195', '1011', 'D800', 3481, 2, 2, 5400, 0, 10800, 0.01, '10', 0, 0, 87417, 1),
('447353527657644', '1011', 'G800', 3479, 3, 3, 1390, 0, 4170, 0.01, '10', 0, 0, 87417, 1),
('288222873772278', '1011', 'Q800', 3480, 5, 5, 375, 0, 1875, 0.01, '10', 0, 0, 87417, 1),
('437587546859138', '1011', 'G825', 3548, 6, 6, 1500, 0, 9000, 0.01, '10', 0, 0, 87417, 1),
('621568229131488', '1011', 'Q811', 3411, 2, 2, 410, 0, 820, 0.01, '10', 0, 0, 87417, 1),
('397946341939795', '1011', 'G811', 3410, 5, 5, 0, 0, 0, 0.01, '10', 0, 0, 87417, 1),
('341575566155299', '1011', 'G850', 1850, 3, 3, 960, 0, 2880, 0.01, '10', 0, 0, 87417, 1),
('677236572561193', '1011', 'G850', 3569, 6, 6, 1390, 0, 8340, 0.01, '10', 0, 0, 87417, 1),
('495479776745797', '1011', 'D850', 1852, 2, 2, 3550, 0, 7100, 0.01, '10', 0, 0, 87417, 1),
('316326563558449', '1011', 'D850', 3571, 3, 3, 5400, 0, 16200, 0.01, '10', 0, 0, 87417, 1),
('252912811249685', '1011', 'Q850', 1851, 2, 2, 300, 0, 600, 0.01, '10', 0, 0, 87417, 1),
('584494969428327', '1011', 'Q850', 3570, 6, 6, 375, 0, 2250, 0.01, '10', 0, 0, 87417, 1),
('919693561198956', '1011', 'G816', 3563, 3, 3, 1500, 0, 4500, 0.01, '10', 0, 0, 87417, 1),
('455286636562439', '1011', 'G855', 3407, 2, 2, 1390, 0, 2780, 0.01, '10', 0, 0, 87417, 1),
('721878379379777', '1011', 'Q855', 3408, 3, 3, 375, 0, 1125, 0.01, '10', 0, 0, 87417, 1),
('661129783254191', '1011', 'G826', 3542, 5, 5, 1500, 0, 7500, 0.01, '10', 0, 0, 87417, 1),
('439667943898339', '1011', 'G831', 3551, 3, 3, 1500, 0, 4500, 0.01, '10', 0, 0, 87417, 1),
('133856447227169', '1011', 'G853', 3560, 6, 6, 1500, 0, 9000, 0.01, '10', 0, 0, 87417, 1),
('597782154182825', '1011', 'Q844', 3555, 3, 3, 410, 0, 1230, 0.01, '10', 0, 0, 87417, 1),
('898949228734372', '1011', 'Q828', 3558, 6, 6, 410, 0, 2460, 0.01, '10', 0, 0, 87417, 1),
('378924918345617', '1012', 'G811', 3926, 3, 3, 1500, 0, 4500, 0.01, '10', 0, 0, 292126, 0),
('865745676714856', '1012', 'G826', 4058, 2, 2, 1500, 0, 3000, 0.01, '10', 0, 0, 292126, 0),
('192494183352418', '1012', 'G825', 4064, 3, 3, 1500, 0, 4500, 0.01, '10', 0, 0, 292126, 0),
('959214123785632', '1012', 'G831', 4067, 4, 4, 1500, 0, 6000, 0.01, '10', 0, 0, 292126, 0),
('945482378772451', '1012', 'G853', 4076, 6, 6, 1500, 0, 9000, 0.01, '10', 0, 0, 292126, 0),
('686471784672968', '1012', 'G816', 4079, 2, 2, 1500, 0, 3000, 0.01, '10', 0, 0, 292126, 0),
('747273946617698', '1012', 'G844', 4070, 5, 5, 1500, 0, 7500, 0.01, '10', 0, 0, 292126, 0),
('263138723527928', '1012', 'Q855', 3924, 2, 2, 375, 0, 750, 0.01, '10', 0, 0, 292126, 0),
('474259114412166', '1012', 'Q850', 4086, 3, 3, 375, 0, 1125, 0.01, '10', 0, 0, 292126, 0),
('411351659426114', '1012', 'Q800', 3996, 5, 5, 375, 0, 1875, 0.01, '10', 0, 0, 292126, 0),
('322421436359566', '1012', 'G800', 3995, 6, 6, 1390, 0, 8340, 0.01, '10', 0, 0, 292126, 0),
('586764884851216', '1012', 'D800', 3997, 6, 6, 5400, 0, 32400, 0.01, '10', 0, 0, 292126, 0),
('418138773965148', '1012', 'D849', 4084, 3, 3, 5400, 0, 16200, 0.01, '10', 0, 0, 292126, 0),
('121188921856956', '1012', 'Q811', 3927, 4, 4, 410, 0, 1640, 0.01, '10', 0, 0, 292126, 0),
('283418552214141', '1012', 'Q852', 3933, 3, 3, 375, 0, 1125, 0.01, '10', 0, 0, 292126, 0),
('679993246858998', '1012', 'D2032', 1846, 5, 5, 6300, 0, 31500, 0.01, '10', 0, 0, 292126, 0),
('832312369944698', '1012', 'D2032', 2239, 3, 3, 9740, 0, 29220, 0.01, '10', 0, 0, 292126, 0),
('237195487223957', '1012', 'D2033', 67, 2, 2, 7500, 0, 15000, 0.01, '10', 0, 0, 292126, 0),
('612289397496125', '1012', 'D2033', 3745, 6, 6, 7100, 0, 42600, 0.01, '10', 0, 0, 292126, 0),
('648733144482383', '1012', 'D2033', 2137, 4, 4, 9740, 0, 38960, 0.01, '10', 0, 0, 292126, 0),
('333259718315866', '1012', 'G2032', 1844, 3, 3, 1600, 0, 4800, 0.01, '10', 0, 0, 292126, 0),
('815277997944564', '1012', 'G2032', 2237, 4, 4, 2450, 0, 9800, 0.01, '10', 0, 0, 292126, 0),
('611372425265124', '1012', 'G2033', 66, 6, 6, 1900, 0, 11400, 0.01, '10', 0, 0, 292126, 0),
('251875524993563', '1012', 'G2033', 3743, 2, 2, 1800, 0, 3600, 0.01, '10', 0, 0, 292126, 0),
('518991989818424', '1012', 'G2033', 2135, 3, 3, 2450, 0, 7350, 0.01, '10', 0, 0, 292126, 0),
('796223637642227', '1012', 'G2000', 2105, 6, 6, 2450, 0, 14700, 0.01, '10', 0, 0, 292126, 0),
('537652779123674', '1012', 'G2003', 2138, 2, 2, 2450, 0, 4900, 0.01, '10', 0, 0, 292126, 0),
('469562112594827', '1012', 'G2044', 2123, 4, 4, 2450, 0, 9800, 0.01, '10', 0, 0, 292126, 0),
('932138849614618', '1010', 'G811', 3926, 3, 3, 1500, 0, 4500, 0, '', 0, 0, 33045, 1),
('695793634641631', '1010', 'G816', 4079, 2, 2, 1500, 0, 3000, 0, '', 0, 0, 33045, 1),
('315789528149818', '1010', 'G800', 3995, 2, 2, 1390, 0, 2780, 0, '', 0, 0, 33045, 1),
('298733143799911', '1010', 'G802', 4007, 6, 6, 1390, 0, 8340, 0, '', 0, 0, 33045, 1),
('126344282922591', '1010', 'G844', 4070, 6, 6, 1500, 0, 9000, 0, '', 0, 0, 33045, 1),
('792992738782417', '1010', 'Q853', 4077, 2, 2, 410, 0, 820, 0, '', 0, 0, 33045, 1),
('298436761942327', '1010', 'Q824', 3963, 3, 3, 375, 0, 1125, 0, '', 0, 0, 33045, 1),
('347464769665751', '1010', 'Q812', 4005, 6, 6, 375, 0, 2250, 0, '', 0, 0, 33045, 1),
('522936741894611', '1010', 'Q826', 4059, 3, 3, 410, 0, 1230, 0, '', 0, 0, 33045, 1),
('419326121852453', '1011', 'D800', 3997, 2, 2, 5400, 0, 10800, 0.01, '10', 0, 0, 83587, 1),
('145868288928623', '1011', 'G811', 3926, 3, 3, 1500, 0, 4500, 0.01, '10', 0, 0, 83587, 1),
('793485583319493', '1011', 'G826', 4058, 4, 4, 1500, 0, 6000, 0.01, '10', 0, 0, 83587, 1),
('589793991841548', '1011', 'Q823', 3981, 2, 2, 375, 0, 750, 0.01, '10', 0, 0, 83587, 1),
('735625293895987', '1011', 'G802', 4007, 3, 3, 1390, 0, 4170, 0.01, '10', 0, 0, 83587, 1),
('129591463812397', '1011', 'Q853', 4077, 2, 2, 410, 0, 820, 0.01, '10', 0, 0, 83587, 1),
('387617651826642', '1011', 'Q822', 3966, 3, 3, 375, 0, 1125, 0.01, '10', 0, 0, 83587, 1),
('742178338624494', '1011', 'G809', 4031, 4, 4, 1390, 0, 5560, 0.01, '10', 0, 0, 83587, 1),
('363731569577446', '1011', 'D823', 3982, 6, 6, 5400, 0, 32400, 0.01, '10', 0, 0, 83587, 1),
('569454287999233', '1011', 'G815', 3998, 2, 2, 1390, 0, 2780, 0.01, '10', 0, 0, 83587, 1),
('374362573779986', '1011', 'G849', 4082, 3, 3, 1390, 0, 4170, 0.01, '10', 0, 0, 83587, 1),
('197726244961297', '1011', 'Q826', 4059, 2, 2, 410, 0, 820, 0.01, '10', 0, 0, 83587, 1),
('626112629244782', '1011', 'D855', 3925, 3, 3, 5400, 0, 16200, 0.01, '10', 0, 0, 83587, 1),
('968881577998251', '1011', 'G819', 3971, 2, 2, 1390, 0, 2780, 0.01, '10', 0, 0, 83587, 1),
('699286994844384', '1012', 'D800', 3997, 2, 2, 5400, 0, 10800, 0.01, '10', 0, 0, 77868, 0),
('712291255382966', '1012', 'D812', 4006, 3, 3, 5400, 0, 16200, 0.01, '10', 0, 0, 77868, 0),
('237327666961425', '1012', 'D854', 3922, 2, 2, 5400, 0, 10800, 0.01, '10', 0, 0, 77868, 0),
('972993362674129', '1012', 'D855', 3925, 3, 3, 5400, 0, 16200, 0.01, '10', 0, 0, 77868, 0),
('455384149691553', '1012', 'G811', 3926, 2, 2, 1500, 0, 3000, 0.01, '10', 0, 0, 77868, 0),
('578599473795968', '1012', 'G854', 3920, 3, 3, 1390, 0, 4170, 0.01, '10', 0, 0, 77868, 0),
('737291855223715', '1012', 'G800', 3995, 2, 2, 1390, 0, 2780, 0.01, '10', 0, 0, 77868, 0),
('454472755781663', '1012', 'Q854', 3921, 3, 3, 375, 0, 1125, 0.01, '10', 0, 0, 77868, 0),
('672173221991957', '1012', 'G824', 3962, 2, 2, 1390, 0, 2780, 0.01, '10', 0, 0, 77868, 0),
('452456945773664', '1012', 'Q852', 3933, 3, 3, 375, 0, 1125, 0.01, '10', 0, 0, 77868, 0),
('373192423152528', '1012', 'G827', 3977, 2, 2, 1390, 0, 2780, 0.01, '10', 0, 0, 77868, 0),
('844622328328839', '1012', 'G802', 4007, 3, 3, 1390, 0, 4170, 0.01, '10', 0, 0, 77868, 0),
('567364949822254', '1012', 'Q823', 3981, 2, 2, 375, 0, 750, 0.01, '10', 0, 0, 77868, 0),
('714188965311427', '1012', 'G819', 3971, 3, 3, 1390, 0, 4170, 0.01, '10', 0, 0, 77868, 0),
('966764672574451', '1012', 'G853', 4076, 1, 1, 1500, 0, 1500, 0.01, '10', 0, 0, 77868, 0),
('288541573488655', '1012', 'G843', 4052, 3, 3, 1390, 0, 4170, 0.01, '10', 0, 0, 77868, 0),
('346199911294342', '1010', 'D800', 3997, 2, 2, 5400, 0, 10800, 0, '', 0, 0, 58395, 1),
('722362984632436', '1010', 'D802', 4009, 3, 3, 5400, 0, 16200, 0, '', 0, 0, 58395, 1),
('764378758831388', '1010', 'G816', 4079, 3, 3, 1500, 0, 4500, 0, '', 0, 0, 58395, 1),
('645995357955935', '1010', 'G811', 3926, 2, 2, 1500, 0, 3000, 0, '', 0, 0, 58395, 1),
('222357288299973', '1010', 'G853', 4076, 3, 3, 1500, 0, 4500, 0, '', 0, 0, 58395, 1),
('725233388243743', '1010', 'G844', 4070, 1, 1, 1500, 0, 1500, 0, '', 0, 0, 58395, 1),
('172485264567578', '1010', 'G800', 3995, 3, 3, 1390, 0, 4170, 0, '', 0, 0, 58395, 1),
('173838916249221', '1010', 'G809', 4031, 4, 4, 1390, 0, 5560, 0, '', 0, 0, 58395, 1),
('525991684125767', '1010', 'G812', 4004, 3, 3, 1390, 0, 4170, 0, '', 0, 0, 58395, 1),
('653649817712754', '1010', 'Q816', 4080, 2, 2, 410, 0, 820, 0, '', 0, 0, 58395, 1),
('591363189528262', '1010', 'Q811', 3927, 3, 3, 410, 0, 1230, 0, '', 0, 0, 58395, 1),
('768872346713754', '1010', 'Q853', 4077, 2, 2, 410, 0, 820, 0, '', 0, 0, 58395, 1),
('422716759156833', '1010', 'Q802', 4008, 3, 3, 375, 0, 1125, 0, '', 0, 0, 58395, 1),
('983698263557396', '1010', 'D800', 3997, 3, 3, 5400, 0, 16200, 0.01, '5', 0, 0, 732303, 1),
('475141797462343', '1010', 'G815', 3998, 2, 2, 1390, 0, 2780, 0.01, '5', 0, 0, 732303, 1),
('164661971783984', '1010', 'G823', 3980, 2, 2, 1390, 0, 2780, 0.01, '5', 0, 0, 732303, 1),
('838713698712196', '1010', 'Q819', 3972, 3, 3, 375, 0, 1125, 0.01, '5', 0, 0, 732303, 1),
('824589969283621', '1010', 'Q800', 3996, 2, 2, 375, 0, 750, 0.01, '5', 0, 0, 732303, 1),
('977558584437229', '1010', 'Q816', 4080, 3, 3, 410, 0, 1230, 0.01, '5', 0, 0, 732303, 1),
('554955623633664', '1010', 'Q844', 4071, 2, 2, 410, 0, 820, 0.01, '5', 0, 0, 732303, 1),
('441411253128871', '1010', 'G844', 4070, 4, 4, 1500, 0, 6000, 0.01, '5', 0, 0, 732303, 1),
('963327984493392', '1010', 'G819', 3971, 2, 2, 1390, 0, 2780, 0.01, '5', 0, 0, 732303, 1),
('272575439573388', '1010', 'G811', 3926, 2, 2, 1500, 0, 3000, 0.01, '5', 0, 0, 732303, 1),
('334594555323579', '1010', 'Q833', 3957, 5, 5, 375, 0, 1875, 0.01, '5', 0, 0, 732303, 1),
('777373962345492', '1010', 'Q826', 4059, 3, 3, 410, 0, 1230, 0.01, '5', 0, 0, 732303, 1),
('978393183623358', '1010', 'Q825', 4065, 4, 4, 410, 0, 1640, 0.01, '5', 0, 0, 732303, 1),
('453939981714327', '1010', 'Q831', 4068, 2, 2, 410, 0, 820, 0.01, '5', 0, 0, 732303, 1),
('329526972162383', '1010', 'G831', 4067, 5, 5, 1500, 0, 7500, 0.01, '5', 0, 0, 732303, 1),
('938253438531852', '1010', 'G825', 4064, 3, 3, 1500, 0, 4500, 0.01, '5', 0, 0, 732303, 1),
('196665832854513', '1010', 'G824', 3962, 2, 2, 1390, 0, 2780, 0.01, '5', 0, 0, 732303, 1),
('342294252667661', '1010', 'G826', 4058, 6, 6, 1500, 0, 9000, 0.01, '5', 0, 0, 732303, 1),
('363995116263945', '1010', 'G853', 4076, 2, 2, 1500, 0, 3000, 0.01, '5', 0, 0, 732303, 1),
('881313393645898', '1010', 'G828', 4073, 5, 5, 1500, 0, 7500, 0.01, '5', 0, 0, 732303, 1),
('248331711182752', '1010', 'Q828', 4074, 2, 2, 410, 0, 820, 0.01, '5', 0, 0, 732303, 1),
('834457547934431', '1010', 'Q853', 4077, 5, 5, 410, 0, 2050, 0.01, '5', 0, 0, 732303, 1),
('621751983574832', '1010', 'D2000', 2107, 2, 2, 9740, 0, 19480, 0.01, '5', 0, 0, 732303, 1),
('713883326439853', '1010', 'D2003', 2140, 5, 5, 9740, 0, 48700, 0.01, '5', 0, 0, 732303, 1),
('277268534873972', '1010', 'D1900', 575, 6, 6, 9720, 0, 58320, 0.01, '5', 0, 0, 732303, 1),
('248314463239269', '1010', 'D1906', 557, 2, 2, 9720, 0, 19440, 0.01, '5', 0, 0, 732303, 1),
('515256759252349', '1010', 'D1932', 618, 6, 6, 9720, 0, 58320, 0.01, '5', 0, 0, 732303, 1),
('731333463835731', '1010', 'Q1932', 617, 6, 6, 650, 0, 3900, 0.01, '5', 0, 0, 732303, 1),
('263555454777149', '1010', 'D1941', 519, 2, 2, 9720, 0, 19440, 0.01, '5', 0, 0, 732303, 1),
('887924549365125', '1010', 'G1926', 600, 6, 6, 2450, 0, 14700, 0.01, '5', 0, 0, 732303, 1),
('353497284735393', '1010', 'G1934', 624, 2, 2, 2450, 0, 4900, 0.01, '5', 0, 0, 732303, 1),
('154538692278771', '1010', 'G1915', 532, 4, 4, 2450, 0, 9800, 0.01, '5', 0, 0, 732303, 1),
('822481792136667', '1010', 'Q1926', 601, 2, 2, 650, 0, 1300, 0.01, '5', 0, 0, 732303, 1),
('166824429861289', '1010', 'Q1906', 558, 3, 3, 650, 0, 1950, 0.01, '5', 0, 0, 732303, 1),
('713477532332931', '1010', 'Q1915', 530, 2, 2, 650, 0, 1300, 0.01, '5', 0, 0, 732303, 1),
('597152764422934', '1010', 'Q1934', 625, 5, 5, 650, 0, 3250, 0.01, '5', 0, 0, 732303, 1),
('885283565766115', '1010', 'D2033', 2137, 2, 2, 9740, 0, 19480, 0.01, '5', 0, 0, 732303, 1),
('537518284634864', '1010', 'D2033', 67, 4, 4, 7500, 0, 30000, 0.01, '5', 0, 0, 732303, 1),
('638149958384629', '1010', 'D2033', 4297, 4, 4, 7100, 0, 28400, 0.01, '5', 0, 0, 732303, 1),
('143295581631657', '1010', 'G2032', 1844, 5, 5, 1600, 0, 8000, 0.01, '5', 0, 0, 732303, 1),
('322516783844627', '1010', 'G2033', 66, 2, 2, 1900, 0, 3800, 0.01, '5', 0, 0, 732303, 1),
('791397295233931', '1010', 'G2033', 4295, 3, 3, 1800, 0, 5400, 0.01, '5', 0, 0, 732303, 1),
('335572929652841', '1010', 'G2033', 2135, 4, 4, 2450, 0, 9800, 0.01, '5', 0, 0, 732303, 1),
('874466547146496', '1010', 'Q2032', 1845, 2, 2, 450, 0, 900, 0.01, '5', 0, 0, 732303, 1),
('481493145721554', '1010', 'Q2032', 2238, 2, 2, 650, 0, 1300, 0.01, '5', 0, 0, 732303, 1),
('229662618177463', '1010', 'Q2033', 87, 3, 3, 550, 0, 1650, 0.01, '5', 0, 0, 732303, 1),
('814811875522645', '1010', 'Q2033', 4296, 3, 3, 475, 0, 1425, 0.01, '5', 0, 0, 732303, 1),
('631534662894597', '1010', 'Q2033', 2136, 3, 3, 650, 0, 1950, 0.01, '5', 0, 0, 732303, 1),
('238528828468178', '1010', 'G2032', 2237, 2, 2, 2450, 0, 4900, 0.01, '5', 0, 0, 732303, 1),
('141199423522797', '1010', 'D2032', 2239, 5, 5, 9740, 0, 48700, 0.01, '5', 0, 0, 732303, 1),
('812122551421998', '1010', 'D850', 1852, 2, 2, 3550, 0, 7100, 0.01, '5', 0, 0, 732303, 1),
('172619533794179', '1010', 'D850', 4087, 2, 2, 5400, 0, 10800, 0.01, '5', 0, 0, 732303, 1),
('532624317221126', '1010', 'G850', 1850, 2, 2, 960, 0, 1920, 0.01, '5', 0, 0, 732303, 1),
('436873777478418', '1010', 'G850', 4085, 2, 2, 1390, 0, 2780, 0.01, '5', 0, 0, 732303, 1),
('459591975798639', '1010', 'Q850', 1851, 2, 2, 300, 0, 600, 0.01, '5', 0, 0, 732303, 1),
('935674977648336', '1010', 'Q850', 4086, 2, 2, 375, 0, 750, 0.01, '5', 0, 0, 732303, 1),
('789136118972938', '1010', 'D3000', 4210, 3, 3, 9440, 0, 28320, 0.01, '5', 0, 0, 732303, 1),
('814818642878162', '1010', 'G3000', 4208, 2, 2, 2540, 0, 5080, 0.01, '5', 0, 0, 732303, 1),
('556625799492823', '1010', 'Q3000', 4209, 3, 3, 690, 0, 2070, 0.01, '5', 0, 0, 732303, 1),
('121737728687764', '1010', 'D3032', 4150, 5, 5, 9440, 0, 47200, 0.01, '5', 0, 0, 732303, 1),
('822274635187524', '1010', 'D3015', 4123, 2, 2, 9440, 0, 18880, 0.01, '5', 0, 0, 732303, 1),
('938858484334575', '1010', 'G3006', 4097, 4, 4, 2540, 0, 10160, 0.01, '5', 0, 0, 732303, 1),
('869428888738772', '1010', 'G3021', 4178, 4, 4, 2600, 0, 10400, 0.01, '5', 0, 0, 732303, 1),
('523427364236163', '1010', 'G3028', 4172, 5, 5, 2600, 0, 13000, 0.01, '5', 0, 0, 732303, 1),
('393671497453217', '1010', 'G3008', 4103, 5, 5, 2540, 0, 12700, 0.01, '5', 0, 0, 732303, 1),
('778737966377167', '1010', 'G3039', 4196, 2, 2, 2600, 0, 5200, 0.01, '5', 0, 0, 732303, 1),
('245534387947838', '1010', 'G3036', 4193, 4, 4, 2600, 0, 10400, 0.01, '5', 0, 0, 732303, 1),
('717333289733937', '1010', 'G3030', 4181, 2, 2, 2600, 0, 5200, 0.01, '5', 0, 0, 732303, 1),
('133732965986888', '1010', 'G3033', 4187, 4, 4, 2600, 0, 10400, 0.01, '5', 0, 0, 732303, 1),
('767559289414128', '1010', 'G3029', 4175, 4, 4, 2600, 0, 10400, 0.01, '5', 0, 0, 732303, 1),
('859338721872541', '1010', 'G3023', 4166, 2, 2, 2600, 0, 5200, 0.01, '5', 0, 0, 732303, 1),
('115576735988349', '1010', 'G3009', 4169, 1, 1, 2600, 0, 2600, 0.01, '5', 0, 0, 732303, 1),
('929723389446669', '1010', 'D3019', 4132, 2, 2, 9440, 0, 18880, 0.01, '5', 0, 0, 732303, 1),
('841977755894729', '1010', 'Q3015', 4122, 2, 2, 690, 0, 1380, 0.01, '5', 0, 0, 732303, 1),
('163824475972123', '1010', 'Q3028', 4173, 3, 3, 700, 0, 2100, 0.01, '5', 0, 0, 732303, 1),
('797414378844473', '1010', 'Q3039', 4197, 2, 2, 700, 0, 1400, 0.01, '5', 0, 0, 732303, 1),
('939519153416635', '1010', 'Q3012', 4113, 2, 2, 690, 0, 1380, 0.01, '5', 0, 0, 732303, 1),
('299545841953443', '1010', 'Q3018', 4200, 4, 4, 700, 0, 2800, 0.01, '5', 0, 0, 732303, 1),
('579773365152672', '1010', 'Q3002', 4089, 2, 2, 690, 0, 1380, 0.01, '5', 0, 0, 732303, 1),
('527136537931644', '1010', 'Q3003', 4203, 3, 3, 690, 0, 2070, 0.01, '5', 0, 0, 732303, 1),
('435562439193173', '1010', 'Q3004', 4092, 2, 2, 690, 0, 1380, 0.01, '5', 0, 0, 732303, 1),
('263439252618226', '1010', 'Q3005', 4095, 5, 5, 690, 0, 3450, 0.01, '5', 0, 0, 732303, 1),
('951217224553561', '1010', 'Q3006', 4098, 2, 2, 690, 0, 1380, 0.01, '5', 0, 0, 732303, 1),
('269676332346595', '1010', 'Q3033', 4188, 2, 2, 700, 0, 1400, 0.01, '5', 0, 0, 732303, 1),
('375722115983418', '1011', 'D800', 3997, 3, 3, 5400, 0, 16200, 0, '', 0, 0, 98000, 1),
('834779789727528', '1011', 'D850', 1852, 2, 2, 3550, 0, 7100, 0, '', 0, 0, 98000, 1),
('858774382377699', '1011', 'D803', 4024, 3, 3, 5400, 0, 16200, 0, '', 0, 0, 98000, 1),
('855364929662954', '1011', 'D2000', 2107, 5, 5, 9740, 0, 48700, 0, '', 0, 0, 98000, 1),
('941277556778378', '1011', 'G2003', 2138, 1, 1, 2450, 0, 2450, 0, '', 0, 0, 98000, 1),
('629822837941952', '1011', 'G2005', 2120, 3, 3, 2450, 0, 7350, 0, '', 0, 0, 98000, 1),
('423115743765691', '1012', 'D850', 1852, 4, 4, 3550, 0, 14200, 0, '', 0, 0, 60880, 0),
('218879332429884', '1012', 'Q850', 1851, 2, 2, 300, 0, 600, 0, '', 0, 0, 60880, 0),
('242563875496699', '1012', 'G850', 1850, 3, 3, 960, 0, 2880, 0, '', 0, 0, 60880, 0),
('319736677581259', '1012', 'D800', 3997, 2, 2, 5400, 0, 10800, 0, '', 0, 0, 60880, 0),
('187872886337695', '1012', 'D823', 3982, 6, 6, 5400, 0, 32400, 0, '', 0, 0, 60880, 0),
('172246683631343', '1013', 'D850', 1852, 2, 2, 3550, 0, 7100, 0.01, '10', 0, 0, 77562, 1),
('254645262381364', '1013', 'G850', 1850, 3, 3, 960, 0, 2880, 0.01, '10', 0, 0, 77562, 1),
('435742684488391', '1013', 'Q850', 1851, 2, 2, 300, 0, 600, 0.01, '10', 0, 0, 77562, 1),
('543285388161681', '1013', 'D800', 3997, 2, 2, 5400, 0, 10800, 0.01, '10', 0, 0, 77562, 1),
('582347991158817', '1013', 'D823', 3982, 6, 6, 5400, 0, 32400, 0.01, '10', 0, 0, 77562, 1),
('724822381558122', '1013', 'D855', 3925, 3, 3, 5400, 0, 16200, 0.01, '10', 0, 0, 77562, 1),
('988241659791122', '1013', 'D803', 4024, 3, 3, 5400, 0, 16200, 0.01, '10', 0, 0, 77562, 1),
('769137645539822', '1014', 'D800', 3997, 3, 3, 5400, 0, 16200, 0, '', 0, 0, 16200, 1),
('579646531364593', '1015', 'D800', 3997, 2, 2, 5400, 0, 10800, 0, '', 0, 0, 10800, 1),
('824873473525687', '1012', 'D850', 1852, 2, 2, 3550, 0, 7100, 0, '', 0, 0, 69980, 0),
('856482539418521', '1012', 'G850', 1850, 3, 3, 960, 0, 2880, 0, '', 0, 0, 69980, 0),
('185843427365615', '1012', 'Q850', 1851, 2, 2, 300, 0, 600, 0, '', 0, 0, 69980, 0),
('691683432672732', '1012', 'D800', 3997, 2, 2, 5400, 0, 10800, 0, '', 0, 0, 69980, 0),
('553318219583988', '1012', 'D823', 3982, 6, 6, 5400, 0, 32400, 0, '', 0, 0, 69980, 0),
('937166614327987', '1012', 'D855', 3925, 3, 3, 5400, 0, 16200, 0, '', 0, 0, 69980, 0),
('329616128325567', '1013', 'D800', 3997, 2, 2, 5400, 0, 10800, 0, '', 0, 0, 10800, 1),
('568668527173297', '1014', 'D800', 3997, 2, 2, 5400, 0, 10800, 0, '', 0, 0, 10800, 1),
('862841618421821', '1015', 'D800', 3997, 2, 2, 5400, 0, 10800, 0, '', 0, 0, 10800, 1),
('722791887665929', '1016', 'D800', 3997, 2, 2, 5400, 0, 10800, 0, '', 0, 0, 10800, 1),
('263382452987318', '1011', 'D800', 3997, 2, 2, 5400, 0, 10800, 0.01, '10', 0, 0, 9720, 1),
('566645443459426', '1011', 'D800', 3997, 2, 2, 5400, 0, 10800, 0.01, '10', 0, 0, 9720, 1),
('316486527674779', '1011', 'D800', 3997, 2, 2, 5400, 0, 10800, 0, '', 0, 0, 10800, 1),
('832183777599896', '1012', 'D800', 3997, 3, 3, 5400, 0, 16200, 0, '', 0, 0, 16200, 0),
('752412892714924', '1013', 'D800', 3997, 2, 2, 5400, 0, 10800, 0, '', 0, 0, 10800, 1),
('997368875563538', '1014', 'D800', 3997, 4, 4, 5400, 0, 21600, 0, '', 0, 0, 21600, 1),
('534416444619199', '1015', 'D800', 3997, 2, 2, 5400, 0, 10800, 0, '', 0, 0, 10800, 1),
('257884738761977', '1016', 'D800', 3997, 3, 3, 5400, 0, 16200, 0, '', 0, 0, 16200, 1),
('755637931189788', '1017', 'D800', 3997, 2, 2, 5400, 0, 10800, 0, '', 0, 0, 10800, 1),
('384154121767484', '1011', 'Gtestprod', 4552, 2, 2, 120, 0, 240, 0, '', 0, 0, 240, 1),
('242824386284524', '1012', 'Gtestprod', 4552, 2, 2, 120, 0, 240, 0, '', 0, 0, 240, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `id` int(10) NOT NULL,
  `product_code` varchar(255) DEFAULT NULL,
  `inserted_at` datetime DEFAULT NULL,
  `qty` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`id`, `product_code`, `inserted_at`, `qty`) VALUES
(1, 'G800', '2019-04-03 00:00:00', 10),
(2, 'Q800', '2019-04-03 00:00:00', 15),
(3, 'D800', '2019-04-03 00:00:00', 20),
(4, '84995431', '2020-01-21 00:00:00', 490);

-- --------------------------------------------------------

--
-- Table structure for table `stock_history`
--

CREATE TABLE `stock_history` (
  `vdate` varchar(50) DEFAULT NULL,
  `product_id` varchar(100) DEFAULT NULL,
  `sell` double DEFAULT NULL,
  `Purchase` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_information`
--

CREATE TABLE `supplier_information` (
  `supplier_id` varchar(100) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `details` varchar(255) NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supplier_information`
--

INSERT INTO `supplier_information` (`supplier_id`, `supplier_name`, `address`, `mobile`, `details`, `status`) VALUES
('Z6D8ETUQSYEOBK7QQL78', 'TALHA CHALK', '', '03212228108', '', 1),
('IP9TWAG6VSVG6NTYP6RF', 'KUKDA ENTERPRISES ', 'B-190/1 KHUDADAD COLONY ', '', '', 1),
('ZZDE8VQ5MFPC9MZRNP7T', 'BAROONI TRADERS', '', '03332198460', '', 1),
('OIP8LT8QNBS1EXRILD5M', 'MULTI RESIN INDUSTRIES ', '', '', '', 1),
('WYU7GK7FHY1AFSA8DAHK', 'AMIR CHALK', '', '03332145403', '', 1),
('D68TC2VDP9CL8M6165T1', 'D.S ENTERPRISES ', '', '03020444088', '', 1),
('PN6D6ZWHZOE6GNNVVE8E', 'AYESHA PROCESS ', '', '', '', 1),
('3URSQ9XJAVQPLR2YT7HL', 'ARFEEN', '', '', 'TEXNOL', 1),
('GPL2UPO3UP5JPQ1M6DBX', 'MB DYES ', 'KARACHI', '03332182339', '', 1),
('2RTL88CE6CZON8A48Q7H', 'SHALIMAR RESIN', '', '', '', 1),
('Q7FR2XS4JI3PV48ANWE2', 'ASI TRADING ', '', '', '', 1),
('FYYUDE5ZMRGGXLPD4PZL', 'KOHINOOR PAINT FACTORY (SHABBIR )', 'PLOT SB-13, SECTOR 4, STREET NO.10 QASBA COLONY ', '', 'TIO2 R-996', 1),
('8EC45YB7SSBDHR45SUYQ', 'ERUM PLASTIC ', '', '', '', 1),
('OGXZWFUZJQGQR8KPCUQF', 'CAPRICORN ASSOCIATES ', '23/2, SECTOR 20, KORANGI', '02135066464', '', 1),
('8EM2GUI7NF8JLN7BK56L', 'KASAK RESIN', 'SITE', '03332139439', '', 1),
('17ZBKYN9I1UHC9AYDKFA', 'ARCHROMA PAKISTAN LIMITED', 'KORANGI INDUSTRIAL AREA ', '', 'PVA', 1),
('D23F97RKV572XU63L93E', 'GUIDES CORPORATION', '', '03422286665', '', 1),
('QYPZRIH3F9G3WGCQD1IS', 'HAMZA SIGN', 'G57/3 MALIR HALT KARACHI -43', '03002212184', '', 1),
('38G8VAYQUTANT6T7P6NK', 'YASIR ENTERPRISES', '', '03333436269', '', 1),
('73841H2DMU823SWSFEI3', 'DYECHEM ENTERPRISES', '', '03332199215', '', 1),
('HMITTMTF6JUD4XSUKFWZ', 'NS TIN', '', '', '', 1),
('LPVTSAL9Y8RG1UDH4MP9', 'CASH', '', '', '', 1),
('445UCO1K5GSE7I98STAM', 'SOHAIL AMONIA GAS', 'KORANGI INDUSTRIAL AREA KARACHI', '03333743017', 'AMONIA GAS', 1),
('YZPXOYFITHGLI1M1SV7F', 'AL MUMTAZ CHEMICAL INDUSTRY ', 'INDUSTRIAL ESTATE GADOON AMAZAI', '03009354901', '', 1),
('2DMS8EDL11ISWULICZDE', 'KANSAI BILAL', '', '', '', 1),
('AU5YU8HI5RK3ME4ZRSGE', 'STANDARD PAINT IND', '', '', '', 1),
('Q849P2OLCS1QYZVYV1K7', 'ORIENT ENTERPRISE', '', '03072160369', '', 1),
('KVHAGIB239PCDIU1IFOL', 'EVER BRIGHT TRADERS ', '', '03212419195', '', 1),
('4JKPQ6ZVNQABMLAHRJNS', 'ZODIC ENTERPRISES ', '', '', '', 1),
('UOG71LV2MZUSTC69H2Y2', 'RAJA MARBEL', '', '', 'CHALK', 1),
('1GD2IMOWSFWPSCZD35DQ', 'WAJID CHALK', '', '', 'CHALK', 1),
('WH74CL4U9NF73DU6SHHP', 'PREMIER PRODUCT (ZUBAIR)', '', '0000000000000', 'PLASTIC PRODUCTS', 1),
('XOLLVIVKD7CEEFLQEPQN', 'ZULFIQAR GIFT', '', '', 'GIFTS', 1),
('VU49HVTLNZGLY8DJFOXN', 'WAQAS CHALK', '', '03370365984', 'CHALK', 1),
('43KY3DUFCY7NQ8R3GWW7', 'IMTIAZ (titanium)', '', '', '(Tio2)', 1),
('3FLZFNER3T3SNGUVQKQ1', 'M.KABEER/SIGN BOARD', '', '', '', 1),
('AT9YQ8RYRMLR7M8P4JIA', 'KINGDOM CHEMICALS', '', '', 'DRYERS', 1),
('ZSPRL6NCIQHI9SCRYKDH', 'RAHEEL/PARAMOUNT CHALK', '', '', 'CHALK.', 1),
('2BG6T26IG9TYKSLKLMWL', 'tabraiz', '', '', '', 1),
('II437GDPEFR1U28E7JQG', 'ASIF SMT', '', '', 'KEROSIN OIL(MTT)', 1);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_ledger`
--

CREATE TABLE `supplier_ledger` (
  `transaction_id` varchar(100) NOT NULL,
  `supplier_id` varchar(100) NOT NULL,
  `chalan_no` varchar(100) DEFAULT NULL,
  `deposit_no` varchar(50) DEFAULT NULL,
  `amount` float NOT NULL,
  `description` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `cheque_no` varchar(255) NOT NULL,
  `date` varchar(50) NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supplier_ledger`
--

INSERT INTO `supplier_ledger` (`transaction_id`, `supplier_id`, `chalan_no`, `deposit_no`, `amount`, `description`, `payment_type`, `cheque_no`, `date`, `status`) VALUES
('M6GZI5MYJP', 'WYU7GK7FHY1AFSA8DAHK', 'Adjustment ', NULL, 378962, 'Previous adjustment of AMIR CHALK with software', 'NA', 'NA', '2018-11-10', 1),
('UTUL3RL5BA', 'ZZDE8VQ5MFPC9MZRNP7T', 'Adjustment ', NULL, 198510, 'Previous adjustment of BAROONI TRADERS with software', 'NA', 'NA', '2018-11-10', 1),
('FCP2XFZXAF', 'Z6D8ETUQSYEOBK7QQL78', 'Adjustment ', NULL, 309700, 'Previous adjustment of TALHA CHALK with software', 'NA', 'NA', '2018-11-07', 1),
('7MUD94HN9P', 'D68TC2VDP9CL8M6165T1', 'Adjustment ', NULL, 90250, 'Previous adjustment of D.S ENTERPRISES with software', 'NA', 'NA', '2018-11-10', 1),
('NOKX3JVDJE', 'PN6D6ZWHZOE6GNNVVE8E', 'Adjustment ', NULL, 31400, 'Previous adjustment of AYESHA PROCESS with software', 'NA', 'NA', '2018-11-10', 1),
('20190706051822', '445UCO1K5GSE7I98STAM', '745', NULL, 8750, '', '', '', '2019-07-03', 1),
('M8WQAE6XEU', 'IP9TWAG6VSVG6NTYP6RF', 'Adjustment ', NULL, 69325, 'Previous adjustment of KUKDA ENTERPRISES  with software ', 'NA', 'NA', '2018-12-04', 1),
('EHGSDE6JLE', 'OIP8LT8QNBS1EXRILD5M', 'Adjustment ', NULL, 341040, 'Previous adjustment of MULTI RESIN INDUSTRIES  with software ', 'NA', 'NA', '2018-11-19', 1),
('CTGUBNVTZK', 'GPL2UPO3UP5JPQ1M6DBX', 'Adjustment ', NULL, 773100, 'Previous adjustment of MB DYES  with software ', 'NA', 'NA', '2018-11-10', 1),
('EEP8N5LUNV', '2RTL88CE6CZON8A48Q7H', 'Adjustment ', NULL, 1032400, 'Previous adjustment of SHALIMAR RESIN with software ', 'NA', 'NA', '2018-11-12', 1),
('20181129064904', 'Q7FR2XS4JI3PV48ANWE2', '70', NULL, 13600, '', '', '', '2018-11-20', 1),
('WZVN9TIEC9KSWKB', 'Z6D8ETUQSYEOBK7QQL78', NULL, '7299243681', 50000, 'CHQ # 50326668, CHQ Date: 2018-11-30 ( test bank ) ; PAID CHQ OF MEHRAN PAINT', '2', '50326668', '2018-11-12', 1),
('EO5TIIPCBZ', 'Q7FR2XS4JI3PV48ANWE2', 'Adjustment ', NULL, 574850, 'Previous adjustment of ASI TRADING  with software ', 'NA', 'NA', '2018-11-12', 1),
('7AQ6YDTB8S', 'FYYUDE5ZMRGGXLPD4PZL', 'Adjustment ', NULL, 300000, 'Previous adjustment of KOHINOOR PAINT FACTORY (SHABBIR ) with software ', 'NA', 'NA', '2018-11-12', 1),
('6Z7DDWDN38EB4VI', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '6341926672', 50000, 'CHQ # 887, CHQ Date: 2018-11-20 ( test bank ) ; HBL BILAL BROTHER TAHIR PAINT LANDHI 887 ', '2', '887', '2018-11-12', 1),
('4CD81PX5H4', '8EC45YB7SSBDHR45SUYQ', 'Adjustment ', NULL, 1108380, 'Previous adjustment of ERUM PLASTIC  with software ', 'NA', 'NA', '2018-11-13', 1),
('IKL9XMQ8HQ', 'OGXZWFUZJQGQR8KPCUQF', 'Adjustment ', NULL, 0, 'Previous adjustment of CAPRICORN ASSOCIATES  with software ', 'NA', 'NA', '2018-11-14', 1),
('20181114092459', 'OGXZWFUZJQGQR8KPCUQF', '1566', NULL, 23750, '', '', '', '2018-10-25', 1),
('20181114094349', 'OGXZWFUZJQGQR8KPCUQF', '1537', NULL, 11500, '', '', '', '2018-10-17', 1),
('20181114095933', 'OGXZWFUZJQGQR8KPCUQF', '1624', NULL, 138750, '', '', '', '2018-11-08', 1),
('U9EKV9PN414E3DK', 'IP9TWAG6VSVG6NTYP6RF', NULL, '9494778978', 25000, 'CHQ # 10486010, CHQ Date: 2018-12-27 ( test bank ) ; CHQ OF MUFFADIL ', '2', '10486010', '2018-12-03', 1),
('20181204102127', 'IP9TWAG6VSVG6NTYP6RF', '2368', NULL, 13750, '', '', '', '2018-12-04', 1),
('R2KGNWO248KOBG9', '2RTL88CE6CZON8A48Q7H', NULL, '8313673328', 23000, 'CHQ # 0101667695, CHQ Date: 2018-11-24 ( test bank ) ; SAAD PAINT FAYSAL BANK', '2', '0101667695', '2018-11-24', 1),
('20181128051509', '2RTL88CE6CZON8A48Q7H', '18100107', NULL, 108000, '', '', '', '2018-10-17', 1),
('20181128073451', '2RTL88CE6CZON8A48Q7H', '18100185', NULL, 111000, '', '', '', '2018-10-30', 1),
('7NQNNLFVZCBB8J5', 'ZZDE8VQ5MFPC9MZRNP7T', NULL, '4897229399', 6000, 'CHQ # 5571150, CHQ Date: 2018-11-23 ( test bank ) ; SUMMIT BANK ANEES PAINT', '2', '5571150', '2018-11-17', 0),
('GR3XBTVCR6UO7QC', 'ZZDE8VQ5MFPC9MZRNP7T', NULL, '1577883867', 20000, 'CHQ # 101667690, CHQ Date: 2018-11-16 ( test bank ) ; FAYSAL BANK SAAD PAINT', '2', '101667690', '2018-11-17', 0),
('LK48CKRF3WXC1NH', 'OIP8LT8QNBS1EXRILD5M', NULL, '4523576349', 22000, 'CHQ # 75936580, CHQ Date: 2018-11-17 ( test bank ) ; NBP ', '2', '75936580', '2018-11-17', 1),
('R1485ONYFMYF9FT', 'OIP8LT8QNBS1EXRILD5M', NULL, '6281232529', 50000, 'CHQ # 16210310, CHQ Date: 2018-11-25 ( test bank ) ; MEEZAN BANK OF MR ZEESHAN', '2', '16210310', '2018-11-17', 1),
('JL45Y6AAJ9UZNX1', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '9629464851', 78500, 'CHQ # 21038611, CHQ Date: 2018-12-10 ( test bank ) ; CHQ OF NEW AGHA PAINT MANGOO PEER AL BAQRA', '2', '21038611', '2018-11-17', 1),
('YGCJB7JXRMHJ4P4', '8EC45YB7SSBDHR45SUYQ', NULL, '3617545486', 33700, 'CHQ # 16210312, CHQ Date: 2018-12-12 ( MEEZAN ) ; ', '2', '16210312', '2018-11-19', 1),
('LHDMFCXD1NK37OM', '8EC45YB7SSBDHR45SUYQ', NULL, '7555677366', 33700, 'CHQ # 16210313, CHQ Date: 2018-12-16 ( MEEZAN ) ; ', '2', '16210313', '2018-11-19', 1),
('ULRC3E6JCVQG4R4', '8EC45YB7SSBDHR45SUYQ', NULL, '5946636712', 33700, 'CHQ # 16210314, CHQ Date: 2018-12-25 ( MEEZAN ) ; ', '2', '16210314', '2018-11-19', 1),
('WAJOIG44IH3RKBO', '8EC45YB7SSBDHR45SUYQ', NULL, '6346351139', 67840, 'CHQ # 16210315, CHQ Date: 2018-12-30 ( MEEZAN ) ; ', '2', '16210315', '2018-11-19', 1),
('27CM81W4X76OS7V', 'PN6D6ZWHZOE6GNNVVE8E', NULL, '2361274543', 5000, ' ', '1', '', '2018-11-20', 1),
('1ZBRU93D5T', '8EM2GUI7NF8JLN7BK56L', 'Adjustment ', NULL, 909820, 'Previous adjustment of KASAK RESIN with software ', 'NA', 'NA', '2018-11-20', 1),
('S4RZAHLHFBDODHH', '8EM2GUI7NF8JLN7BK56L', NULL, '7771926574', 50000, 'CHQ # 10570766, CHQ Date: 2018-11-20 ( BANK AL HABIB LIMITED ) ; PAID CASH CHQ AGAINST CHQ TO MR. ARSLAN ', '2', '10570766', '2018-11-20', 1),
('1A72QJSTT2', '17ZBKYN9I1UHC9AYDKFA', 'Adjustment ', NULL, 155080, 'Previous adjustment of ARCHROMA PAKISTAN LIMITED with software ', 'NA', 'NA', '2018-11-26', 1),
('RS26J9HPZS49I7L', '17ZBKYN9I1UHC9AYDKFA', NULL, '2148786956', 31680, 'CHQ # 0041, CHQ Date: 2018-12-13 ( HBL ) ; PAID AGAINST # EL441800148', '2', '0041', '2018-11-26', 1),
('2SUBEJ938NIK3A9', '17ZBKYN9I1UHC9AYDKFA', NULL, '1849755672', 31680, 'CHQ # 0042, CHQ Date: 2018-12-26 ( HBL ) ; PAID AGAINST # EL4418001574', '2', '0042', '2018-11-26', 1),
('PSK74F61FL', 'D23F97RKV572XU63L93E', 'Adjustment ', NULL, 258000, 'Previous adjustment of GUIDES CORPORATION with software ', 'NA', 'NA', '2018-11-27', 1),
('OWO8EJM9F4GJR9L', 'D23F97RKV572XU63L93E', NULL, '6595599554', 6000, 'CHQ # 5571149, CHQ Date: 2018-11-16 ( test bank ) ; ANEES PAINT , SUMMIT BANK ', '2', '5571149', '2018-11-13', 1),
('JQHYID4BU1LEUKY', 'D23F97RKV572XU63L93E', NULL, '6729242285', 20000, 'CHQ # 7099738, CHQ Date: 2018-11-20 ( test bank ) ; NEW AL NOOR , MEEZAN ', '2', '7099738', '2018-11-13', 1),
('SZZ8NAJT4P', 'QYPZRIH3F9G3WGCQD1IS', 'Adjustment ', NULL, 30000, 'Previous adjustment of HAMZA SIGN with software ', 'NA', 'NA', '2018-11-27', 1),
('LVF94MM73QQ8RP7', 'QYPZRIH3F9G3WGCQD1IS', NULL, '6586949995', 30000, 'CHQ # 46, CHQ Date: 2018-12-02 ( test bank ) ; PAID CHQ OF NEW AL NOOR ', '2', '46', '2018-11-27', 1),
('5U1DBM5UX1', '38G8VAYQUTANT6T7P6NK', 'Adjustment ', NULL, 177450, 'Previous adjustment of YASIR ENTERPRISES with software ', 'NA', 'NA', '2018-11-27', 1),
('NUN8P8AT11B6WQI', '38G8VAYQUTANT6T7P6NK', NULL, '5446631439', 25000, 'CHQ # 16210318, CHQ Date: 2018-12-10 ( MEEZAN ) ; PAID CHQ ', '2', '16210318', '2018-11-24', 1),
('TOQG6VJ57P4WFPZ', '38G8VAYQUTANT6T7P6NK', NULL, '8421952529', 20000, 'CHQ # 10602328, CHQ Date: 2018-12-07 ( test bank ) ; GHOSIA PAINT BANK AL HABIB', '2', '10602328', '2018-11-24', 1),
('6GD6EIY4DMTX46A', '2RTL88CE6CZON8A48Q7H', NULL, '5357568816', 50000, 'CHQ # 10570770, CHQ Date: 2018-11-30 ( BANK AL HABIB LIMITED ) ; ', '2', '10570770', '2018-11-24', 1),
('P4RLEKQ7KUFLU9R', '2RTL88CE6CZON8A48Q7H', NULL, '7275736572', 50000, 'CHQ # 10570771, CHQ Date: 2018-12-12 ( BANK AL HABIB LIMITED ) ; ', '2', '10570771', '2018-11-24', 1),
('5XC7PY7I3RYCAOE', '2RTL88CE6CZON8A48Q7H', NULL, '5362613718', 50000, 'CHQ # 10570772, CHQ Date: 2018-12-16 ( BANK AL HABIB LIMITED ) ; ', '2', '10570772', '2018-11-24', 1),
('IK8VPHXX2XAVF9V', '2RTL88CE6CZON8A48Q7H', NULL, '3423239686', 50000, 'CHQ # 10570773, CHQ Date: 2018-12-26 ( BANK AL HABIB LIMITED ) ; ', '2', '10570773', '2018-11-24', 1),
('20181128111944', '38G8VAYQUTANT6T7P6NK', '1557', NULL, 16500, '', '', '', '2018-11-03', 1),
('BWLE23TEGVLA34A', 'Q7FR2XS4JI3PV48ANWE2', NULL, '8938928414', 50000, 'CHQ # 7477466, CHQ Date: 2018-12-02 ( test bank ) ; PAID CHQ OF FDK IMRAN KUKDA ', '2', '7477466', '2018-11-29', 1),
('9UTM6789I1', '73841H2DMU823SWSFEI3', 'Adjustment ', NULL, 697055, 'Previous adjustment of DYECHEM ENTERPRISES with software ', 'NA', 'NA', '2018-11-29', 1),
('ECOKHEXMZW6A842', '73841H2DMU823SWSFEI3', NULL, '9682835329', 50000, 'CHQ # 135032667, CHQ Date: 2018-11-17 ( test bank ) ; CHQ OF MEHRAN PAINT', '2', '135032667', '2018-11-10', 1),
('GG3325JNPXFIUCE', '73841H2DMU823SWSFEI3', NULL, '2531682356', 20000, 'CHQ # 10363655, CHQ Date: 2018-11-21 ( BANK AL HABIB LIMITED ) ; ', '2', '10363655', '2018-11-10', 1),
('PESOB9JGZ3LUZKY', '73841H2DMU823SWSFEI3', NULL, '3712999317', 10000, 'CHQ # 1666865742, CHQ Date: 2018-11-12 ( test bank ) ; MFFADIL ', '2', '1666865742', '2018-11-10', 1),
('472F12UCW4I6YD8', '73841H2DMU823SWSFEI3', NULL, '4754541827', 50000, 'CHQ # 1350326668, CHQ Date: 2018-11-30 ( MEEZAN ) ; ', '2', '1350326668', '2018-11-22', 1),
('20181129112124', '73841H2DMU823SWSFEI3', '16724K', NULL, 75000, '', '', '', '2018-11-10', 1),
('20181227092254', '2RTL88CE6CZON8A48Q7H', '18110158', NULL, 222000, '', '', '', '2018-11-28', 1),
('20181227092439', '2RTL88CE6CZON8A48Q7H', '18120104', NULL, 114000, '', '', '', '2018-12-17', 1),
('20181204102451', 'IP9TWAG6VSVG6NTYP6RF', '2386', NULL, 29625, '', '', '', '2018-12-04', 1),
('BI93J6Q4MKK6H1H', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '9589325647', 50000, 'CHQ # 36, CHQ Date: 2018-12-15 ( HBL ) ; HBL ', '2', '36', '2018-11-12', 1),
('YRAO47KJJJH5EHC', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '9325392835', 50000, 'CHQ # 37, CHQ Date: 2018-12-21 ( HBL ) ; HBL ', '2', '37', '2018-11-12', 1),
('84ZBQ6UDLCADK9P', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '6483755724', 50000, 'CHQ # 38, CHQ Date: 2018-12-24 ( HBL ) ; HBL ', '2', '38', '2018-11-12', 1),
('7MTPOX75B4MTPS5', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '6445639562', 50000, 'CHQ # 39, CHQ Date: 2018-12-28 ( HBL ) ; HBL ', '2', '39', '2018-11-12', 1),
('F5SDAYY2YB7DZ6S', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '7349914317', 50000, 'CHQ # 40, CHQ Date: 2018-12-31 ( HBL ) ; HBL ', '2', '40', '2018-11-12', 1),
('OOJU2HKZNS', 'HMITTMTF6JUD4XSUKFWZ', 'Adjustment ', NULL, 0, 'Previous adjustment of NS TIN with software ', 'NA', 'NA', '2018-12-04', 1),
('OZCZP9V5JUFWHYV', 'HMITTMTF6JUD4XSUKFWZ', NULL, '5765933924', 39150, 'CHQ # 10570767, CHQ Date: 2018-11-28 ( BANK AL HABIB LIMITED ) ; FOR THE MONTH OF JULY AND AUG 2018', '2', '10570767', '2018-11-22', 1),
('8X9ZXAMKU3PNCTG', 'HMITTMTF6JUD4XSUKFWZ', NULL, '7156396573', 39150, 'CHQ # 10570768, CHQ Date: 2018-12-15 ( BANK AL HABIB LIMITED ) ; FOR THE MONTH OF JULY AND AUG 2018', '2', '10570768', '2018-11-22', 1),
('S417KIWZZPLJ12V', 'HMITTMTF6JUD4XSUKFWZ', NULL, '1161437172', 39150, 'CHQ # 10570769, CHQ Date: 2018-12-30 ( BANK AL HABIB LIMITED ) ; FOR THE MONTH OF JULY AND AUG 2018', '2', '10570769', '2018-11-22', 1),
('20181204102541', 'IP9TWAG6VSVG6NTYP6RF', '2411', NULL, 13750, '', '', '', '2018-12-04', 1),
('OYL58DCDUMK6VAC', '8EC45YB7SSBDHR45SUYQ', NULL, '9728932813', 50000, 'CHQ # 42382177, CHQ Date: 2018-12-07 ( test bank ) ; UNION PAINT CLIENT ', '2', '42382177', '2018-12-04', 1),
('20181206053800', 'HMITTMTF6JUD4XSUKFWZ', '41', NULL, 73800, '', '', '', '2018-11-29', 1),
('20181206063910', 'FYYUDE5ZMRGGXLPD4PZL', '10650', NULL, 303750, '', '', '', '2018-12-05', 1),
('MMUTIZWZIC', 'LPVTSAL9Y8RG1UDH4MP9', 'Adjustment ', NULL, 0, 'Previous adjustment of CASH with software ', 'NA', 'NA', '2018-12-06', 1),
('20181206065133', 'LPVTSAL9Y8RG1UDH4MP9', '202', NULL, 63000, '', '', '', '2018-11-28', 1),
('LI3BCN2SDGBUI25', 'LPVTSAL9Y8RG1UDH4MP9', NULL, '7453947761', 63000, ' ', '1', '', '2018-11-28', 1),
('20181206101139', 'HMITTMTF6JUD4XSUKFWZ', '29', NULL, 44940, '', '', '', '2018-10-27', 1),
('20181206101407', 'HMITTMTF6JUD4XSUKFWZ', '26', NULL, 60900, '', '', '', '2018-10-26', 1),
('TKE82AGD845EDH2', 'KVHAGIB239PCDIU1IFOL', NULL, '6383341538', 25000, 'CHQ # 000000, CHQ Date: 2019-07-27 ( SUPPLIER CHQ ) ; ZEESHAN/MEEZAN BANK', '2', '000000', '2019-07-04', 1),
('V2WOG32ZYQ5ZI3E', 'KVHAGIB239PCDIU1IFOL', NULL, '6484951293', 25000, 'CHQ # 000000, CHQ Date: 2019-07-20 ( SUPPLIER CHQ ) ; ZEESHAN/MEEZAN BANK', '2', '000000', '2019-07-04', 1),
('Y793MN96AGQUJCW', 'KVHAGIB239PCDIU1IFOL', NULL, '6463841928', 20000, 'CHQ # 000000, CHQ Date: 2019-07-13 ( SUPPLIER CHQ ) ; ZEESHAN/MEEZAN BANK', '2', '000000', '2019-07-04', 1),
('2B7YL1UYSP', '445UCO1K5GSE7I98STAM', 'Adjustment ', NULL, 0, 'Previous adjustment of SOHAIL AMONIA GAS with software ', 'NA', 'NA', '2018-12-08', 1),
('XD2K11AQ3DOSS63', '445UCO1K5GSE7I98STAM', NULL, '5867177374', 8750, ' ', '1', '', '2018-12-08', 1),
('20181212061218', '445UCO1K5GSE7I98STAM', '20', NULL, 8750, '', '', '', '2018-11-09', 1),
('20181212063010', '17ZBKYN9I1UHC9AYDKFA', '241', NULL, 66240, '', '', '', '2018-11-30', 1),
('OPP5U3LAAYS5J5B', '2RTL88CE6CZON8A48Q7H', NULL, '1521739623', 20000, 'CHQ # 7099744, CHQ Date: 2018-12-20 ( SUPPLIER CHQ ) ; NEW al NOOR', '2', '7099744', '2018-12-12', 1),
('1DVHFO2TNL42LWW', '2RTL88CE6CZON8A48Q7H', NULL, '2333145171', 30000, 'Update Transection', '2', '114897763', '2018-12-12', 1),
('8BIG2NJUITAGDRU', '17ZBKYN9I1UHC9AYDKFA', NULL, '3413434558', 20000, 'CHQ # 5639053, CHQ Date: 2018-12-20 ( SUPPLIER CHQ ) ; SUBRANG IMRAN', '2', '5639053', '2018-12-13', 1),
('RH2U1BOYMGA5XGU', '17ZBKYN9I1UHC9AYDKFA', NULL, '8474745975', 10000, 'CHQ # 14614724, CHQ Date: 2018-12-20 ( SUPPLIER CHQ ) ; MAAZ PAINT', '2', '14614724', '2018-12-13', 1),
('1ZR2OKIEP2', 'YZPXOYFITHGLI1M1SV7F', 'Adjustment ', NULL, 0, 'Previous adjustment of AL MUMTAZ CHEMICAL INDUSTRY  with software ', 'NA', 'NA', '2018-12-17', 1),
('VYD5TJL5FLS2G3J', '8EM2GUI7NF8JLN7BK56L', NULL, '8478245831', 30000, 'CHQ # 16210323, CHQ Date: 2018-12-24 ( MEEZAN ) ; ', '2', '16210323', '2018-12-17', 1),
('2V7B6M96VU4DECJ', '8EM2GUI7NF8JLN7BK56L', NULL, '1113358585', 30000, 'CHQ # 16210324, CHQ Date: 2018-12-30 ( MEEZAN ) ; ', '2', '16210324', '2018-12-17', 1),
('P5NSHNT51IQ27XK', '8EM2GUI7NF8JLN7BK56L', NULL, '7397163313', 20000, 'CHQ # 184, CHQ Date: 2019-01-11 ( SUPPLIER CHQ ) ; ESSA HBL', '2', '184', '2018-12-17', 1),
('I42PIHFKPGA4REF', '8EM2GUI7NF8JLN7BK56L', NULL, '8246138951', 20000, 'CHQ # 183, CHQ Date: 2019-01-04 ( SUPPLIER CHQ ) ; ESSA HBL', '2', '183', '2018-12-17', 1),
('BE8QHJAGUBFCJD2', '8EC45YB7SSBDHR45SUYQ', NULL, '5689988967', 50000, 'CHQ # 16203725, CHQ Date: 2018-12-22 ( SUPPLIER CHQ ) ; SUBRANG', '2', '16203725', '2018-12-17', 1),
('BJIBFW65JK89VQZ', '8EC45YB7SSBDHR45SUYQ', NULL, '8363933441', 25000, 'CHQ # 1063667, CHQ Date: 2018-12-25 ( SUPPLIER CHQ ) ; SUB A PAINT ', '2', '1063667', '2018-12-17', 1),
('WMC7F461OBITV5C', '8EC45YB7SSBDHR45SUYQ', NULL, '8871864637', 20000, 'CHQ # 181, CHQ Date: 2018-12-21 ( SUPPLIER CHQ ) ; ESSA', '2', '181', '2018-12-17', 1),
('WX176MNBKYD1ODD', '8EC45YB7SSBDHR45SUYQ', NULL, '9349169483', 20000, 'CHQ # 182, CHQ Date: 2018-12-28 ( SUPPLIER CHQ ) ; ESSA', '2', '182', '2018-12-17', 1),
('AWJH1U3ZHWFALTS', '8EC45YB7SSBDHR45SUYQ', NULL, '3241545366', 44000, 'CHQ # 16210327, CHQ Date: 2019-01-31 ( MEEZAN ) ; ', '2', '16210327', '2018-12-17', 1),
('K7J4TTOA9HOVU5N', '8EC45YB7SSBDHR45SUYQ', NULL, '3879791554', 44000, 'CHQ # 16210325, CHQ Date: 2019-01-19 ( MEEZAN ) ; ZEESHAN ISHAQ', '2', '16210325', '2018-12-17', 1),
('5X4ASHR63JYXZX3', '8EC45YB7SSBDHR45SUYQ', NULL, '9614268886', 44000, 'CHQ # 16210326, CHQ Date: 2019-01-26 ( MEEZAN ) ; ZEESHAN ISHAQ', '2', '16210326', '2018-12-17', 1),
('QFXMCKMFKJIUKEC', 'LPVTSAL9Y8RG1UDH4MP9', NULL, '9653329295', 5000, ' PAID CASH TO MR.IMRAN BY MR. SHEHZAAD ', '1', '', '2018-12-17', 1),
('RJQUFWLLR7FZ1LH', 'OGXZWFUZJQGQR8KPCUQF', NULL, '2594112579', 10000, 'CHQ # 18247186, CHQ Date: 2018-12-29 ( MEEZAN ) ; ', '2', '18247186', '2018-12-19', 1),
('WPOOEG6A61D2QVZ', 'OGXZWFUZJQGQR8KPCUQF', NULL, '9173613948', 22250, 'CHQ # 16210328, CHQ Date: 2019-01-12 ( MEEZAN ) ; ', '2', '16210328', '2018-12-19', 1),
('4W3JDKWJBPGQWVL', 'OIP8LT8QNBS1EXRILD5M', NULL, '2452355235', 50000, 'CHQ # 49663696, CHQ Date: 2018-12-15 ( SUPPLIER CHQ ) ; rao javed', '2', '49663696', '2018-12-19', 1),
('AAFU5UEWEVOTW2M', 'Z6D8ETUQSYEOBK7QQL78', NULL, '1893665536', 20000, 'CHQ # 15901545, CHQ Date: 2018-12-19 ( SUPPLIER CHQ ) ; UBL MUHAMMAD ARSLAN', '2', '15901545', '2018-12-18', 1),
('973R5YJWGD', '2DMS8EDL11ISWULICZDE', 'Adjustment ', NULL, 0, 'Previous adjustment of KANSAI BILAL with software ', 'NA', 'NA', '2018-12-20', 1),
('YXUTJ4VM8K51LPU', '2DMS8EDL11ISWULICZDE', NULL, '6247999968', 50000, 'CHQ # 16203724, CHQ Date: 2018-12-20 ( SUPPLIER CHQ ) ; AGAINST NC PAINT OF PRISM TO MR KHRUM ( SUBRANG)', '2', '16203724', '2018-12-19', 1),
('20181220053434', '17ZBKYN9I1UHC9AYDKFA', '433', NULL, 47600, '', '', '', '2018-12-08', 1),
('20181220054240', 'YZPXOYFITHGLI1M1SV7F', '164', NULL, 181001, '', '', '', '2018-12-08', 1),
('20181220063400', 'OIP8LT8QNBS1EXRILD5M', '44783', NULL, 42000, '', '', '', '2018-11-15', 1),
('20181224074246', '73841H2DMU823SWSFEI3', '16796K', NULL, 51250, '', '', '', '2018-11-22', 1),
('20181224093613', '73841H2DMU823SWSFEI3', '16870K', NULL, 52000, '', '', '', '2018-12-10', 1),
('W5HG99VGGUXWTMH', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '1933639212', 750, ' ', '1', '', '2018-12-24', 1),
('TR6WDR1T2XETED8', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '6761367293', 53000, 'CHQ # 16210333, CHQ Date: 2019-01-30 ( MEEZAN ) ; ', '2', '16210333', '2018-12-24', 1),
('2Y88VF8R5I8PZTP', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '9298422462', 50000, 'CHQ # 16210332, CHQ Date: 2019-01-27 ( MEEZAN ) ; ', '2', '16210332', '2018-12-24', 1),
('K42I52PC8SFYL2F', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '3384896239', 50000, 'CHQ # 16210331, CHQ Date: 2019-01-24 ( MEEZAN ) ; ', '2', '16210331', '2018-12-24', 1),
('JQ8IAPC6QAMBAIN', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '1874436751', 50000, 'CHQ # 16210330, CHQ Date: 2019-01-21 ( MEEZAN ) ; ', '2', '16210330', '2018-12-24', 1),
('AAJDP914K7XOIVH', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '5337882449', 50000, 'CHQ # 16210329, CHQ Date: 2019-01-13 ( MEEZAN ) ; ', '2', '16210329', '2018-12-24', 1),
('5DRYZWBRQQIHRD6', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '7392998178', 50000, 'CHQ # 16210334, CHQ Date: 2019-02-12 ( MEEZAN ) ; ', '2', '16210334', '2018-12-24', 1),
('20181224105854', 'OIP8LT8QNBS1EXRILD5M', '44040', NULL, 123600, '', '', '', '2018-10-15', 1),
('OPO9QBT1UJ7VG4N', 'D68TC2VDP9CL8M6165T1', NULL, '2379113544', 25000, 'CHQ # 7099747, CHQ Date: 2018-12-31 ( SUPPLIER CHQ ) ; NEW AL NOOR', '2', '7099747', '2018-12-26', 1),
('HVQDS4B9BELWXY9', 'HMITTMTF6JUD4XSUKFWZ', NULL, '9673113727', 38000, 'CHQ # 10578451, CHQ Date: 2019-01-14 ( BANK AL HABIB LIMITED ) ; ', '2', '10578451', '2018-12-26', 1),
('JC8MAGM3PM1BZYB', 'HMITTMTF6JUD4XSUKFWZ', NULL, '5713561277', 38000, 'CHQ # 10578452, CHQ Date: 2019-01-20 ( BANK AL HABIB LIMITED ) ; ', '2', '10578452', '2018-12-26', 1),
('3QECJ1KQ8COMUX2', 'HMITTMTF6JUD4XSUKFWZ', NULL, '8916122861', 38000, 'CHQ # 10578452, CHQ Date: 2019-01-28 ( BANK AL HABIB LIMITED ) ; ', '2', '10578452', '2018-12-26', 1),
('KNCMVYE1V873Y9F', '17ZBKYN9I1UHC9AYDKFA', NULL, '1845559177', 28360, 'CHQ # 10578454, CHQ Date: 2018-12-26 ( BANK AL HABIB LIMITED ) ; ', '2', '10578454', '2018-12-26', 1),
('20181227053853', 'HMITTMTF6JUD4XSUKFWZ', '13', NULL, 63470, '', '', '', '2018-12-19', 1),
('54CMUEZIUM1HVPQ', '2RTL88CE6CZON8A48Q7H', NULL, '7135241477', 50000, 'CHQ # 10578455, CHQ Date: 2019-01-24 ( BANK AL HABIB LIMITED ) ; ', '2', '10578455', '2018-12-27', 1),
('4CE4YPWJRM7G2IH', '2RTL88CE6CZON8A48Q7H', NULL, '3541446634', 50000, 'CHQ # 10570780, CHQ Date: 2019-01-16 ( BANK AL HABIB LIMITED ) ; ', '2', '10570780', '2018-12-27', 1),
('PSMWEWXPVNWJALC', '2RTL88CE6CZON8A48Q7H', NULL, '6513999256', 50000, 'CHQ # 10578456, CHQ Date: 2019-01-27 ( BANK AL HABIB LIMITED ) ; ', '2', '10578456', '2018-12-27', 1),
('3WLHM3GITJLT79N', '2RTL88CE6CZON8A48Q7H', NULL, '3568977812', 50000, 'CHQ # 10578457, CHQ Date: 2019-01-31 ( BANK AL HABIB LIMITED ) ; ', '2', '10578457', '2018-12-27', 1),
('98OTFOBNO9JHA1Q', 'OIP8LT8QNBS1EXRILD5M', NULL, '9134491875', 100000, 'CHQ # 10321569, CHQ Date: 2019-01-07 ( SUPPLIER CHQ ) ; foji kunkot', '2', '10321569', '2018-12-29', 1),
('CN57JWNRK68Z9YO', 'OIP8LT8QNBS1EXRILD5M', NULL, '9973363325', 15040, ' foji kunkot', '1', '', '2018-12-29', 1),
('20181229101639', 'GPL2UPO3UP5JPQ1M6DBX', '31502', NULL, 24375, '', '', '', '2018-12-26', 1),
('ZU4M2D2IQAKJ22H', 'ZZDE8VQ5MFPC9MZRNP7T', NULL, '9774361126', 19000, 'CHQ # , CHQ Date: 2018-12-31 ( SUPPLIER CHQ ) ; saven ali gul', '2', '', '2018-12-29', 1),
('20190102051013', '17ZBKYN9I1UHC9AYDKFA', '164', NULL, 66240, '', '', '', '2018-11-19', 1),
('20190102051938', 'OIP8LT8QNBS1EXRILD5M', '43735', NULL, 191600, '', '', '', '2019-01-01', 1),
('2TLIZVVDSDXOW81', 'KVHAGIB239PCDIU1IFOL', NULL, '8368796613', 10000, 'CHQ # 000000, CHQ Date: 2019-07-10 ( SUPPLIER CHQ ) ; MAAZ PAINT/MEEZAN BANK', '2', '000000', '2019-07-04', 1),
('8WHEULT6GE7WN25', 'KVHAGIB239PCDIU1IFOL', NULL, '9878611757', 20000, 'CHQ # 19071283, CHQ Date: 2019-07-10 ( SUPPLIER CHQ ) ; NEW AL NOOR PAINT/SILK BANK', '2', '19071283', '2019-07-04', 1),
('20190703061251', 'KVHAGIB239PCDIU1IFOL', '9615', NULL, 84900, '', '', '', '2019-07-01', 1),
('20190104070256', '8EM2GUI7NF8JLN7BK56L', '00', NULL, 74100, '', '', '', '2018-12-21', 1),
('20190104072436', 'LPVTSAL9Y8RG1UDH4MP9', '170', NULL, 63600, '', '', '', '2018-11-15', 1),
('YGGW48UNR1JHR48', '8EM2GUI7NF8JLN7BK56L', NULL, '7918489282', 50000, 'CHQ # 15110309, CHQ Date: 2019-01-20 ( SUPPLIER CHQ ) ; SAAD', '2', '15110309', '2019-01-04', 1),
('ATGN1ZNGETKI5V1', '8EM2GUI7NF8JLN7BK56L', NULL, '2816949168', 25000, 'CHQ # 10578460, CHQ Date: 2019-01-30 ( BANK AL HABIB LIMITED ) ; ', '2', '10578460', '2019-01-04', 1),
('I8X3UZHM1ZOHG5D', '8EM2GUI7NF8JLN7BK56L', NULL, '3525841484', 25000, 'CHQ # 10578459, CHQ Date: 2019-01-21 ( BANK AL HABIB LIMITED ) ; ', '2', '10578459', '2019-01-04', 1),
('20190107093208', '8EM2GUI7NF8JLN7BK56L', '105636', NULL, 111150, '', '', '', '2019-01-05', 1),
('20190107095408', 'FYYUDE5ZMRGGXLPD4PZL', '535', NULL, 295000, 'R298', '', '', '2019-01-05', 1),
('20190108103438', 'D23F97RKV572XU63L93E', '1532', NULL, 55625, '', '', '', '2019-01-07', 1),
('TBW6QIT7BUONUJP', 'LPVTSAL9Y8RG1UDH4MP9', NULL, '6957356387', 63600, ' ', '1', '', '2018-11-15', 1),
('IL5RY9PC7OZKDEU', 'Z6D8ETUQSYEOBK7QQL78', NULL, '4718147778', 20000, 'CHQ # 7099749, CHQ Date: 2019-01-15 ( SUPPLIER CHQ ) ; NEW AL NOOR', '2', '7099749', '2019-01-10', 1),
('20190110085137', 'D23F97RKV572XU63L93E', '29', NULL, 54375, '', '', '', '2018-12-06', 1),
('20190110085911', 'D23F97RKV572XU63L93E', '1244', NULL, 54375, '', '', '', '2018-11-14', 1),
('LWUQOBGV9YRLTPG', 'D23F97RKV572XU63L93E', NULL, '1217366215', 30000, 'CHQ # 7099748, CHQ Date: 2019-01-10 ( SUPPLIER CHQ ) ; new al noor', '2', '7099748', '2019-01-10', 1),
('NBGA5R5GB18SHFD', 'D23F97RKV572XU63L93E', NULL, '5289239319', 15000, 'CHQ # 5571164, CHQ Date: 2019-01-19 ( SUPPLIER CHQ ) ; anees paint', '2', '5571164', '2019-01-10', 1),
('Z7SQ8TX5KQ5Z42N', '2RTL88CE6CZON8A48Q7H', NULL, '4438499138', 50000, 'CHQ # 117752630, CHQ Date: 2019-01-10 ( SUPPLIER CHQ ) ; saad paint', '2', '117752630', '2019-01-10', 1),
('1BECJ2B3WPJWOYW', '2RTL88CE6CZON8A48Q7H', NULL, '8183555182', 24000, 'CHQ # 41026863, CHQ Date: 2019-01-08 ( SUPPLIER CHQ ) ; FABRO', '2', '41026863', '2019-01-10', 1),
('A7SO8MBSOY2AE42', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '1346217112', 100000, 'CHQ # 10321572, CHQ Date: 2019-01-25 ( SUPPLIER CHQ ) ; FOJI BANK AL HABIB', '2', '10321572', '2019-01-12', 1),
('RZX61LXCJZ', 'AU5YU8HI5RK3ME4ZRSGE', 'Adjustment ', NULL, 10000, 'Previous adjustment of STANDARD PAINT IND with software ', 'NA', 'NA', '2019-01-14', 1),
('93FIYER6K1GWQW7', 'AU5YU8HI5RK3ME4ZRSGE', NULL, '8425863127', 10000, 'CHQ # 18854426, CHQ Date: 2019-01-12 ( SUPPLIER CHQ ) ; MAAZ', '2', '18854426', '2019-01-14', 1),
('ZTXHFX2UELIU9JW', 'Q7FR2XS4JI3PV48ANWE2', NULL, '1969739485', 30000, 'CHQ # 45, CHQ Date: 2019-01-20 ( HBL ) ; ', '2', '45', '2019-01-14', 1),
('ZXBCEWT8KSAFTFC', 'Q7FR2XS4JI3PV48ANWE2', NULL, '6463824494', 30000, 'CHQ # 46, CHQ Date: 2019-01-27 ( HBL ) ; ', '2', '46', '2019-01-14', 1),
('GAD8CO423V42S2H', '8EC45YB7SSBDHR45SUYQ', NULL, '3844468442', 50000, 'CHQ # 10578464, CHQ Date: 2019-02-12 ( BANK AL HABIB LIMITED ) ; ', '2', '10578464', '2019-01-16', 1),
('RED33MIDAV8P4NC', '8EC45YB7SSBDHR45SUYQ', NULL, '5979338155', 50000, 'CHQ # 10578465, CHQ Date: 2019-02-17 ( BANK AL HABIB LIMITED ) ; ', '2', '10578465', '2019-01-16', 1),
('JT7PHHWTC651T6W', '8EC45YB7SSBDHR45SUYQ', NULL, '3539863924', 50000, 'CHQ # 10578466, CHQ Date: 2019-02-21 ( BANK AL HABIB LIMITED ) ; ', '2', '10578466', '2019-01-16', 1),
('WFVS1CDTJAC9SZO', '8EC45YB7SSBDHR45SUYQ', NULL, '6381755234', 50000, 'CHQ # 10578468, CHQ Date: 2019-02-28 ( BANK AL HABIB LIMITED ) ; ', '2', '10578468', '2019-01-16', 1),
('8XXQGN1CRD1P38Z', '8EC45YB7SSBDHR45SUYQ', NULL, '9865845897', 50000, 'CHQ # 10578467, CHQ Date: 2019-02-24 ( BANK AL HABIB LIMITED ) ; ', '2', '10578467', '2019-01-16', 1),
('HI96EEHHFSM7963', '8EC45YB7SSBDHR45SUYQ', NULL, '9985199753', 30000, ' ', '1', '', '2019-01-16', 1),
('LWFHENIYQ6', 'Q849P2OLCS1QYZVYV1K7', 'Adjustment ', NULL, 152000, 'Previous adjustment of ORIENT ENTERPRISE with software ', 'NA', 'NA', '2019-01-17', 1),
('RSD3D6B1PW64RD2', 'Q849P2OLCS1QYZVYV1K7', NULL, '5746175136', 92800, ' ADJUST WITH PRISM BILL ', '1', '', '2019-01-28', 1),
('VR787WYX19UC2Z7', 'IP9TWAG6VSVG6NTYP6RF', NULL, '5432362328', 25000, ' ', '1', '', '2019-01-19', 1),
('KTNG1AAX1LHT9DE', 'D23F97RKV572XU63L93E', NULL, '9227997352', 50000, 'CHQ # 10578469, CHQ Date: 2019-01-19 ( BANK AL HABIB LIMITED ) ; ', '2', '10578469', '2019-01-19', 1),
('20190121053012', 'OIP8LT8QNBS1EXRILD5M', '45595', NULL, 100000, '', '', '', '2018-12-18', 1),
('LFASCTWLVQNEA7L', '73841H2DMU823SWSFEI3', NULL, '2963684561', 50000, 'CHQ # 0000, CHQ Date: 2019-01-30 ( SUPPLIER CHQ ) ; UNION PAINT', '2', '0000', '2019-01-19', 1),
('QCKCSY3T296KQUS', 'WYU7GK7FHY1AFSA8DAHK', NULL, '7851113799', 25000, 'CHQ # 00000, CHQ Date: 2019-01-30 ( SUPPLIER CHQ ) ; FABRO', '2', '00000', '2019-01-19', 1),
('20190121075816', 'LPVTSAL9Y8RG1UDH4MP9', '325', NULL, 62400, '', '', '', '2019-01-18', 1),
('TMKLG49OZT4MNJ4', 'LPVTSAL9Y8RG1UDH4MP9', NULL, '2434594653', 62400, ' ', '1', '', '2019-01-18', 1),
('20190121080222', 'AU5YU8HI5RK3ME4ZRSGE', '6157', NULL, 8000, '', '', '', '2019-01-16', 1),
('ZK7U2AX7F8UHS3G', '2RTL88CE6CZON8A48Q7H', NULL, '1776677442', 50000, 'CHQ # 19250554, CHQ Date: 2019-03-12 ( MEEZAN ) ; ', '2', '19250554', '2019-02-09', 1),
('20190121080751', 'LPVTSAL9Y8RG1UDH4MP9', '1911', NULL, 20400, '', '', '', '2019-01-12', 1),
('63LSRZHDTPTN8F8', 'LPVTSAL9Y8RG1UDH4MP9', NULL, '8768478697', 20400, ' PAID CASH TO MR. ABDUL MAJEED ', '1', '', '2019-01-12', 1),
('20190121081522', 'Q849P2OLCS1QYZVYV1K7', '479', NULL, 35875, '', '', '', '2019-01-10', 1),
('20190121081759', 'Q7FR2XS4JI3PV48ANWE2', '35', NULL, 19600, '', '', '', '2019-01-14', 1),
('20190121093008', '38G8VAYQUTANT6T7P6NK', '62', NULL, 51500, '', '', '', '2019-01-15', 1),
('20190121101146', 'HMITTMTF6JUD4XSUKFWZ', '92', NULL, 72300, '', '', '', '2019-01-12', 1),
('20190121102656', 'Q7FR2XS4JI3PV48ANWE2', '10', NULL, 22000, '', '', '', '2019-01-21', 1),
('MI97HQLI5I68Y4Q', 'Z6D8ETUQSYEOBK7QQL78', NULL, '7661749894', 15000, 'CHQ # 0000, CHQ Date: 2019-01-27 ( SUPPLIER CHQ ) ; NEW AL NOOR', '2', '0000', '2019-01-22', 1),
('DQ4SUDHAEPWBLJG', '8EC45YB7SSBDHR45SUYQ', NULL, '6528353772', 50000, 'CHQ # 10578470, CHQ Date: 2019-02-23 ( BANK AL HABIB LIMITED ) ; ', '2', '10578470', '2019-01-22', 1),
('APORM9YTP1D5VCH', 'Q849P2OLCS1QYZVYV1K7', NULL, '7123211514', 20000, 'CHQ # 5579498, CHQ Date: 2019-02-04 ( SUPPLIER CHQ ) ; anees paint', '2', '5579498', '2019-01-23', 1),
('D9VKJMRILR778GS', 'ZZDE8VQ5MFPC9MZRNP7T', NULL, '8997943321', 10000, 'CHQ # 18854430, CHQ Date: 2019-01-28 ( SUPPLIER CHQ ) ; maaz', '2', '18854430', '2019-01-23', 1),
('RRHJAS436FJHCTW', 'ZZDE8VQ5MFPC9MZRNP7T', NULL, '8426643672', 10000, ' maaz', '1', '', '2019-01-23', 1),
('FQGZSJQ752T7A9T', 'OIP8LT8QNBS1EXRILD5M', NULL, '7417819253', 50000, 'CHQ # 00000047, CHQ Date: 2019-02-17 ( HBL ) ; ', '2', '00000047', '2019-01-23', 1),
('8G1IAM55NKA6HIX', 'OIP8LT8QNBS1EXRILD5M', NULL, '7324254358', 50000, 'CHQ # 00000048, CHQ Date: 2019-02-26 ( HBL ) ; ', '2', '00000048', '2019-01-23', 1),
('20190124061854', '73841H2DMU823SWSFEI3', '17086K', NULL, 32325, '', '', '', '2019-01-19', 1),
('20190124062122', 'D23F97RKV572XU63L93E', '1594', NULL, 44500, '', '', '', '2019-01-21', 1),
('20190124062414', 'OIP8LT8QNBS1EXRILD5M', '1921', NULL, 87000, '', '', '', '2019-01-24', 1),
('52ZBEZE7R1RGZ52', 'YZPXOYFITHGLI1M1SV7F', NULL, '1571347565', 50000, ' ONLINE IN BANK BY AFZAAL \r\nUBL ACCOUNT TITLE ZAHOOR HUSSAIN ACCOUNT NO.1470-24793982\r\nMOB.03439836700', '1', '', '2019-01-24', 1),
('3PJ2GSW9DB7W56Q', 'OGXZWFUZJQGQR8KPCUQF', NULL, '1445672914', 22000, 'CHQ # 10053581, CHQ Date: 2019-01-25 ( SUPPLIER CHQ ) ; QUITA FALCON', '2', '10053581', '2019-01-26', 1),
('RRHOVA2CLJHFZCX', 'OGXZWFUZJQGQR8KPCUQF', NULL, '5686591827', 10000, 'CHQ # 97188654, CHQ Date: 2019-02-13 ( SUPPLIER CHQ ) ; ASHARFI PAINT O/T', '2', '97188654', '2019-01-26', 1),
('ZBONKYWWRZGCX5K', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '8414642277', 38750, 'CHQ # 16210338, CHQ Date: 2019-02-28 ( MEEZAN ) ; ', '2', '16210338', '2019-01-30', 1),
('EJK9IRTONPER34X', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '5557659792', 40000, 'CHQ # 16210337, CHQ Date: 2019-02-22 ( MEEZAN ) ; ', '2', '16210337', '2019-01-30', 1),
('M2VXHKANM8I1ALH', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '4931134223', 40000, 'CHQ # 16210336, CHQ Date: 2019-02-17 ( MEEZAN ) ; ', '2', '16210336', '2019-01-30', 1),
('20190131053458', 'GPL2UPO3UP5JPQ1M6DBX', '57190', NULL, 118750, '', '', '', '2019-01-23', 1),
('RDV19J1P5JPXEYQ', 'HMITTMTF6JUD4XSUKFWZ', NULL, '2913594352', 30000, 'CHQ # 15110320, CHQ Date: 2019-02-21 ( SUPPLIER CHQ ) ; saad', '2', '15110320', '2019-02-01', 1),
('G7CDIV9S2QUBD45', 'HMITTMTF6JUD4XSUKFWZ', NULL, '7873342424', 20000, 'CHQ # 10713566, CHQ Date: 2019-02-01 ( SUPPLIER CHQ ) ; ghosia ', '2', '10713566', '2019-02-01', 1),
('9DD3PUS11E6WSDF', 'HMITTMTF6JUD4XSUKFWZ', NULL, '2331827133', 20000, 'CHQ # 0061, CHQ Date: 2019-02-07 ( SUPPLIER CHQ ) ; new al noor', '2', '0061', '2019-02-01', 1),
('ZSYLUTT7Z4LBQVE', '73841H2DMU823SWSFEI3', NULL, '3723331934', 15000, 'CHQ # 5579501, CHQ Date: 2019-02-11 ( SUPPLIER CHQ ) ; anees', '2', '5579501', '2019-02-02', 1),
('20190205062239', 'Q849P2OLCS1QYZVYV1K7', '492', NULL, 27750, '', '', '', '2019-01-30', 1),
('FJ7DPFQDS4', 'KVHAGIB239PCDIU1IFOL', 'Adjustment ', NULL, 0, 'Previous adjustment of EVER BRIGHT TRADERS  with software ', 'NA', 'NA', '2019-02-05', 1),
('20190205074216', 'KVHAGIB239PCDIU1IFOL', '8250', NULL, 65000, '', '', '', '2019-02-04', 1),
('20190205074606', 'GPL2UPO3UP5JPQ1M6DBX', '57381', NULL, 178125, '', '', '', '2019-02-01', 1),
('20190205075734', 'GPL2UPO3UP5JPQ1M6DBX', '31921', NULL, 57500, '', '', '', '2019-02-05', 1),
('20190205075955', 'D23F97RKV572XU63L93E', '1641', NULL, 33375, '', '', '', '2019-02-01', 1),
('20190205080601', 'OIP8LT8QNBS1EXRILD5M', '00000', NULL, 104600, '', '', '', '2019-02-04', 1),
('20190205080804', '73841H2DMU823SWSFEI3', '17132', NULL, 14500, '', '', '', '2019-02-02', 1),
('20190206070300', 'HMITTMTF6JUD4XSUKFWZ', '27', NULL, 73620, '', '', '', '2019-02-05', 1),
('3U51G71O7PVM1I8', '8EM2GUI7NF8JLN7BK56L', NULL, '1686767533', 10000, 'CHQ # 18854436, CHQ Date: 2019-02-16 ( SUPPLIER CHQ ) ; maaz', '2', '18854436', '2019-02-06', 1),
('T3OWUW9LQVYVEQB', '8EM2GUI7NF8JLN7BK56L', NULL, '4478241498', 10000, 'CHQ # 19179601, CHQ Date: 2019-02-16 ( SUPPLIER CHQ ) ; arslan paint', '2', '19179601', '2019-02-06', 1),
('UZZ5X392DCFHWHA', '8EM2GUI7NF8JLN7BK56L', NULL, '4866999395', 10000, 'CHQ # 22240308, CHQ Date: 2019-02-20 ( SUPPLIER CHQ ) ; atta ullah abbasi electric store', '2', '22240308', '2019-02-06', 1),
('KBZLFFASX3NNDJ5', '8EM2GUI7NF8JLN7BK56L', NULL, '4475391524', 25000, 'CHQ # 5492655, CHQ Date: 2019-02-20 ( SUPPLIER CHQ ) ; rao javed ', '2', '5492655', '2019-02-06', 1),
('CF1DPUUIUTUA85S', '8EM2GUI7NF8JLN7BK56L', NULL, '2874895179', 50000, 'CHQ # 050, CHQ Date: 2019-02-26 ( HBL ) ; ', '2', '050', '2019-02-06', 1),
('TH3YAENA2TRL7WU', 'IP9TWAG6VSVG6NTYP6RF', NULL, '6314277121', 20000, 'CHQ # 5579504, CHQ Date: 2019-02-18 ( SUPPLIER CHQ ) ; ANEES', '2', '5579504', '2019-02-07', 1),
('RT2E7QTAOC', '4JKPQ6ZVNQABMLAHRJNS', 'Adjustment ', NULL, 0, 'Previous adjustment of ZODIC ENTERPRISES  with software ', 'NA', 'NA', '2019-02-07', 1),
('Z7BPP1ETKBP4H5J', '4JKPQ6ZVNQABMLAHRJNS', NULL, '2442375614', 10000, 'CHQ # 5562028, CHQ Date: 2019-02-13 ( SUPPLIER CHQ ) ; ANEES PAINT', '2', '5562028', '2019-02-07', 1),
('V9PFH4TZWYWKFRQ', '4JKPQ6ZVNQABMLAHRJNS', NULL, '2144445996', 15000, ' CASH', '1', '', '2019-02-07', 1),
('20190209103203', '2RTL88CE6CZON8A48Q7H', '19010130', NULL, 190000, '', '', '', '2019-01-30', 1),
('20190209103252', '2RTL88CE6CZON8A48Q7H', '19010145', NULL, 190000, '', '', '', '2019-01-31', 1),
('3PKNPAOF4LOSW2Z', '2RTL88CE6CZON8A48Q7H', NULL, '8116454719', 50000, 'CHQ # 19250553, CHQ Date: 2019-02-28 ( MEEZAN ) ; ', '2', '19250553', '2019-02-09', 1),
('NHRKUAJUMR62S32', '2RTL88CE6CZON8A48Q7H', NULL, '5959784374', 50000, 'CHQ # 19250552, CHQ Date: 2019-02-24 ( MEEZAN ) ; ', '2', '19250552', '2019-02-09', 1),
('9G2ERQIT6XUIMFD', '2RTL88CE6CZON8A48Q7H', NULL, '4495435812', 50000, 'CHQ # 19250551, CHQ Date: 2019-02-16 ( MEEZAN ) ; ', '2', '19250551', '2019-02-09', 1),
('OXG62R5CF9SDJMU', '2RTL88CE6CZON8A48Q7H', NULL, '4793275223', 100000, 'CHQ # 10321570, CHQ Date: 2019-02-24 ( SUPPLIER CHQ ) ; foji', '2', '10321570', '2019-02-09', 1),
('HVANZ55VIAVP42W', '2RTL88CE6CZON8A48Q7H', NULL, '1128868986', 100000, 'CHQ # 10321571, CHQ Date: 2019-02-24 ( SUPPLIER CHQ ) ; foji', '2', '10321571', '2019-02-09', 1),
('WK56HAQ7IVGMGJD', '2RTL88CE6CZON8A48Q7H', NULL, '9574699991', 50000, ' CASH', '1', '', '2019-02-09', 1),
('VCKXP4TYJ4563OP', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '2695442896', 25000, 'CHQ # 10497633, CHQ Date: 2019-03-05 ( SUPPLIER CHQ ) ; MUFADDIL', '2', '10497633', '2019-02-09', 1),
('7YN5MKMUKBBHRKQ', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '7262735766', 25000, 'CHQ # 10497632, CHQ Date: 2019-02-28 ( SUPPLIER CHQ ) ; MUFADDIL', '2', '10497632', '2019-02-09', 1),
('82FWIIN5C393PQZ', 'Z6D8ETUQSYEOBK7QQL78', NULL, '8326831811', 15000, 'CHQ # 62, CHQ Date: 2019-02-12 ( SUPPLIER CHQ ) ; new al noor', '2', '62', '2019-02-12', 1),
('62PQ3D8KG4ADHPA', 'Z6D8ETUQSYEOBK7QQL78', NULL, '4885358438', 10000, 'CHQ # 19450921, CHQ Date: 2019-02-12 ( SUPPLIER CHQ ) ; sun bright', '2', '19450921', '2019-02-12', 1),
('U31C7HQZPMFMN2S', '73841H2DMU823SWSFEI3', NULL, '6482654942', 25000, 'CHQ # 89085, CHQ Date: 2019-02-20 ( SUPPLIER CHQ ) ; sun bright', '2', '89085', '2019-02-12', 1),
('LKDHG5XEPCRLSRI', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '6657618946', 50000, 'CHQ # 19250555, CHQ Date: 2019-02-24 ( MEEZAN ) ; zeeshan ishaq', '2', '19250555', '2019-02-12', 1),
('91NF52WM8OOOLA5', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '9624938794', 25000, 'CHQ # 89084, CHQ Date: 2019-02-15 ( SUPPLIER CHQ ) ; sunbright', '2', '89084', '2019-02-12', 1),
('Q67KZZMBFWO1VIQ', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '3487975496', 20000, 'CHQ # 63, CHQ Date: 2019-02-20 ( SUPPLIER CHQ ) ; new al noor', '2', '63', '2019-02-12', 1),
('16ITV67Y4UQSJEV', '17ZBKYN9I1UHC9AYDKFA', NULL, '5399862541', 50000, 'CHQ # , CHQ Date: 2019-02-27 ( MEEZAN ) ; ', '2', '', '2019-02-12', 1),
('20190213080352', 'Q7FR2XS4JI3PV48ANWE2', '69', NULL, 22000, '', '', '', '2019-02-12', 1),
('20190213092833', 'OIP8LT8QNBS1EXRILD5M', '00000', NULL, 104600, '', '', '', '2019-02-11', 1),
('20190213094550', '2RTL88CE6CZON8A48Q7H', '18120151', NULL, 114000, '', '', '', '2018-12-26', 1),
('20190213095654', '2RTL88CE6CZON8A48Q7H', '2170', NULL, 190000, '', '', '', '2019-02-09', 1),
('20190213100037', '8EM2GUI7NF8JLN7BK56L', '105794', NULL, 76000, '', '', '', '2019-02-09', 1),
('20190213111438', 'Q7FR2XS4JI3PV48ANWE2', '17', NULL, 11375, '', '', '', '2019-01-29', 1),
('DUIUWA6VXY3TOND', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '8483869592', 100000, ' ADVANCE FORM SHADE CARD ', '1', '', '2019-02-16', 1),
('ICWM3F5YCLRV7AO', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '8485663729', 40000, 'CHQ # 00000, CHQ Date: 2019-02-18 ( SUPPLIER CHQ ) ; MUNEER PAINT', '2', '00000', '2019-02-16', 1),
('9JO6HMLNBBEQTC5', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '2675718917', 15000, 'CHQ # 00000, CHQ Date: 2019-02-23 ( SUPPLIER CHQ ) ; ANUS', '2', '00000', '2019-02-16', 1),
('IRIZ3KLKW1JKUJX', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '1327551992', 40000, 'CHQ # 00000, CHQ Date: 2019-02-27 ( SUPPLIER CHQ ) ; SAAD', '2', '00000', '2019-02-16', 1),
('VYFJ8FJK9VEZVD6', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '5268229999', 50000, 'CHQ # 000, CHQ Date: 2019-02-27 ( HBL ) ; ', '2', '000', '2019-02-16', 1),
('P8BDGCD9GPE4J92', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '5315869728', 50000, 'CHQ # 000, CHQ Date: 2019-03-14 ( HBL ) ; ', '2', '000', '2019-02-16', 1),
('6QYSIX6CIYYULKS', 'Q7FR2XS4JI3PV48ANWE2', NULL, '2549627913', 35000, 'CHQ # 77190713, CHQ Date: 2019-02-21 ( SUPPLIER CHQ ) ; EZZY ', '2', '77190713', '2019-02-16', 1),
('SA87PEO8AS5O6CD', 'Q7FR2XS4JI3PV48ANWE2', NULL, '7395822764', 15000, 'CHQ # 111225, CHQ Date: 2019-03-07 ( SUPPLIER CHQ ) ; BANK ISLAMIC', '2', '111225', '2019-02-16', 1),
('2F5QJ6Y5JFQ7GBC', 'OIP8LT8QNBS1EXRILD5M', NULL, '2929378698', 25000, 'CHQ # 115999249, CHQ Date: 2019-02-16 ( SUPPLIER CHQ ) ; ezzy', '2', '115999249', '2019-02-18', 1),
('5T71V5CIH86WODK', 'OIP8LT8QNBS1EXRILD5M', NULL, '3583456582', 32600, 'CHQ # 53, CHQ Date: 2019-03-17 ( HBL ) ; ', '2', '53', '2019-02-18', 1),
('K1W9V3NEOLW3EX7', 'OIP8LT8QNBS1EXRILD5M', NULL, '2126452634', 32600, 'CHQ # 54, CHQ Date: 2019-03-21 ( HBL ) ; ', '2', '54', '2019-02-18', 1),
('E9K9CFUT4QT36FX', 'OIP8LT8QNBS1EXRILD5M', NULL, '4859943442', 37400, 'CHQ # 55, CHQ Date: 2019-03-27 ( HBL ) ; ', '2', '55', '2019-02-18', 1),
('TX731FKILSLVJB1', 'D23F97RKV572XU63L93E', NULL, '4731749226', 15000, 'CHQ # 111204, CHQ Date: 2019-02-26 ( SUPPLIER CHQ ) ; AL MAKKAH PAINT GAGAR PHATAK', '2', '111204', '2019-02-19', 1),
('A63IES9TPVKOTD7', 'D23F97RKV572XU63L93E', NULL, '4796934977', 35000, 'CHQ # 19250557, CHQ Date: 2019-03-15 ( MEEZAN ) ; ', '2', '19250557', '2019-02-19', 1),
('20190221110543', '73841H2DMU823SWSFEI3', '17178', NULL, 23250, '', '', '', '2019-02-13', 1),
('4HA6MXGWB8ZL7B2', 'Q849P2OLCS1QYZVYV1K7', NULL, '6968535133', 15000, 'CHQ # 4675661, CHQ Date: 2019-03-02 ( SUPPLIER CHQ ) ; HARIS SABIR', '2', '4675661', '2019-02-21', 1),
('YK6KEA6J52VBRZU', 'Q849P2OLCS1QYZVYV1K7', NULL, '1552463123', 7000, 'CHQ # 9287072, CHQ Date: 2019-01-22 ( SUPPLIER CHQ ) ; MA PAINT GUL HADID', '2', '9287072', '2019-02-21', 1),
('20190223072426', 'GPL2UPO3UP5JPQ1M6DBX', '32088', NULL, 178125, '', '', '', '2019-02-13', 1),
('F2OBKQ1SHK48NC1', '8EC45YB7SSBDHR45SUYQ', NULL, '2268943745', 50000, 'CHQ # 19250558, CHQ Date: 2019-03-20 ( MEEZAN ) ; ', '2', '19250558', '2019-02-23', 1),
('V8ITPXCSHL9KOSJ', '8EC45YB7SSBDHR45SUYQ', NULL, '3166618172', 50000, 'CHQ # 19250559, CHQ Date: 2019-03-25 ( MEEZAN ) ; ', '2', '19250559', '2019-02-23', 1),
('24ECJMQYVNTL6RR', '8EC45YB7SSBDHR45SUYQ', NULL, '8435797154', 50000, 'CHQ # 19250560, CHQ Date: 2019-03-30 ( MEEZAN ) ; ', '2', '19250560', '2019-02-23', 1),
('AHEWN6XYC57OB9A', '8EC45YB7SSBDHR45SUYQ', NULL, '2424938237', 2500, ' ', '1', '', '2019-02-23', 1),
('20190225131949', 'FYYUDE5ZMRGGXLPD4PZL', '809', NULL, 345000, '', '', '', '2019-02-25', 1),
('7GK91A2USBEG2LH', '2RTL88CE6CZON8A48Q7H', NULL, '7674449922', 25000, 'CHQ # 192, CHQ Date: 2019-03-03 ( SUPPLIER CHQ ) ; ESSA', '2', '192', '2019-02-26', 1),
('NSM2BWP1G592PDJ', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '6741262854', 25000, 'CHQ # 10713571, CHQ Date: 2019-03-07 ( SUPPLIER CHQ ) ; SHAFIQ AHMED BANK AL HABIB', '2', '10713571', '2019-02-26', 1),
('ZR8AZC5OWJ8TAX9', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '6834356377', 25000, 'CHQ # 195, CHQ Date: 2019-03-24 ( SUPPLIER CHQ ) ; ESSA', '2', '195', '2019-02-26', 1),
('IASCF1IYML7WWLQ', 'WYU7GK7FHY1AFSA8DAHK', NULL, '2857464589', 25000, 'CHQ # 193, CHQ Date: 2019-03-10 ( SUPPLIER CHQ ) ; NEW ESSA', '2', '193', '2019-02-26', 1),
('VIVOWW9K1YRIIN4', 'ZZDE8VQ5MFPC9MZRNP7T', NULL, '4455846941', 10000, 'CHQ # 9287076, CHQ Date: 2019-03-02 ( SUPPLIER CHQ ) ; MA PAINT ', '2', '9287076', '2019-02-27', 1),
('B7SHB66LEICPYUF', 'ZZDE8VQ5MFPC9MZRNP7T', NULL, '7124674811', 15000, 'CHQ # 19179625, CHQ Date: 2019-03-09 ( SUPPLIER CHQ ) ; ARSLAN PAINT', '2', '19179625', '2019-02-27', 1),
('20190227111532', 'ZZDE8VQ5MFPC9MZRNP7T', '811', NULL, 34050, '', '', '', '2019-01-25', 1),
('20190228094705', '2RTL88CE6CZON8A48Q7H', '1931', NULL, 114000, '', '', '', '2019-02-23', 1),
('20190228095640', 'LPVTSAL9Y8RG1UDH4MP9', '404', NULL, 61800, '', '', '', '2019-02-28', 1),
('20190228095740', 'LPVTSAL9Y8RG1UDH4MP9', '433', NULL, 61200, '', '', '', '2019-02-23', 1),
('20190228095834', 'LPVTSAL9Y8RG1UDH4MP9', '20', NULL, 61800, '', '', '', '2019-02-09', 1),
('EE68D9PPUCNROYU', 'LPVTSAL9Y8RG1UDH4MP9', NULL, '6262481691', 179800, ' ', '1', '', '2019-02-28', 1),
('G3AMBLRCWPXMTVV', 'KVHAGIB239PCDIU1IFOL', NULL, '1513222833', 45000, ' ', '1', '', '2019-02-28', 1),
('T8VNJRXX8QS5UIT', 'KVHAGIB239PCDIU1IFOL', NULL, '8948721476', 20000, 'CHQ # 67, CHQ Date: 2019-03-06 ( SUPPLIER CHQ ) ; new al noor', '2', '67', '2019-02-28', 1),
('20190228120257', 'IP9TWAG6VSVG6NTYP6RF', '2432', NULL, 13750, '', '', '', '2018-12-07', 1),
('20190228120341', 'IP9TWAG6VSVG6NTYP6RF', '2483', NULL, 13750, '', '', '', '2019-01-03', 1),
('20190228120441', 'IP9TWAG6VSVG6NTYP6RF', '2505', NULL, 13750, '', '', '', '2019-01-22', 1),
('20190228120528', 'IP9TWAG6VSVG6NTYP6RF', '2539', NULL, 6875, '', '', '', '2019-02-14', 1),
('432HNM6JI64Q8KA', 'IP9TWAG6VSVG6NTYP6RF', NULL, '5118365313', 20000, 'CHQ # 10256142, CHQ Date: 2019-03-06 ( SUPPLIER CHQ ) ; ezzy paint', '2', '10256142', '2019-02-28', 1),
('MJ9A4JNAI3KYHFU', 'IP9TWAG6VSVG6NTYP6RF', NULL, '3276285497', 20500, 'CHQ # 41026872, CHQ Date: 2019-02-28 ( SUPPLIER CHQ ) ; sumair', '2', '41026872', '2019-02-28', 1),
('20190302063515', 'D23F97RKV572XU63L93E', '1762', NULL, 33375, '', '', '', '2019-03-01', 1),
('20190302063803', '38G8VAYQUTANT6T7P6NK', '1935', NULL, 14000, '', '', '', '2019-03-01', 1),
('20190302063926', 'Q849P2OLCS1QYZVYV1K7', '1938', NULL, 23125, '', '', '', '2019-03-01', 1),
('H3AEVJGZG3OMGAI', 'UOG71LV2MZUSTC69H2Y2', NULL, '6521651874', 10000, 'CHQ # 0000, CHQ Date: 2019-04-28 ( SUPPLIER CHQ ) ; RUNG CORNER', '2', '0000', '2019-04-18', 1),
('ZN7IB9XIB9XAKJQ', 'D68TC2VDP9CL8M6165T1', NULL, '8185666824', 5000, ' CASH', '1', '', '2019-03-02', 1),
('5AU9IR4A5466FDS', 'D68TC2VDP9CL8M6165T1', NULL, '6847692282', 15000, 'CHQ # 5579512, CHQ Date: 2019-03-11 ( SUPPLIER CHQ ) ; ANEES SHER SHAH', '2', '5579512', '2019-03-02', 1),
('20190302070356', 'OIP8LT8QNBS1EXRILD5M', '000000', NULL, 100000, '', '', '', '2019-03-01', 1),
('20190302070842', 'IP9TWAG6VSVG6NTYP6RF', '2560', NULL, 6875, '', '', '', '2019-03-01', 1),
('20190302093938', 'Q7FR2XS4JI3PV48ANWE2', '43', NULL, 33800, '', '', '', '2019-02-28', 1),
('20190305102802', 'KVHAGIB239PCDIU1IFOL', 's13282', NULL, 251000, '', '', '', '2019-03-01', 1),
('BR43AA8K1P2CCQ3', 'QYPZRIH3F9G3WGCQD1IS', NULL, '1755345748', 20000, 'CHQ # 68, CHQ Date: 2019-03-12 ( SUPPLIER CHQ ) ; HBL NEW AL NOOR', '2', '68', '2019-03-05', 1),
('ZI6DDSBP1JRHR2S', '8EC45YB7SSBDHR45SUYQ', NULL, '6964671872', 50000, 'CHQ # 1063670, CHQ Date: 2019-03-25 ( SUPPLIER CHQ ) ; SUB A PAINT', '2', '1063670', '2019-03-06', 1),
('SG2ILX5X9NF5QXB', '8EC45YB7SSBDHR45SUYQ', NULL, '7291996247', 50000, 'CHQ # 56, CHQ Date: 2019-04-14 ( HBL ) ; ', '2', '56', '2019-03-06', 1),
('VGPI93RNMXZEHU5', '8EC45YB7SSBDHR45SUYQ', NULL, '1159812122', 50000, 'CHQ # 57, CHQ Date: 2019-04-21 ( HBL ) ; ', '2', '57', '2019-03-06', 1),
('GE52X6RW7ESCL25', '8EC45YB7SSBDHR45SUYQ', NULL, '6926218748', 50000, 'CHQ # 57, CHQ Date: 2019-04-28 ( HBL ) ; ', '2', '57', '2019-03-06', 1),
('20190306113130', 'HMITTMTF6JUD4XSUKFWZ', '005', NULL, 75640, '', '', '', '2019-03-05', 1),
('20190309065251', 'ZZDE8VQ5MFPC9MZRNP7T', '854', NULL, 60300, '', '', '', '2019-03-07', 1),
('2VK5L2C2QNQEWQI', 'OIP8LT8QNBS1EXRILD5M', NULL, '3398695964', 2000, ' CASH PAID', '1', '', '2019-03-09', 1),
('9WELNS23AH7KSLL', 'OIP8LT8QNBS1EXRILD5M', NULL, '5988281971', 15000, 'CHQ # 19, CHQ Date: 2019-03-15 ( SUPPLIER CHQ ) ; ANEES PAINT', '2', '19', '2019-03-09', 1),
('K4YROBKJPYCY96H', 'OIP8LT8QNBS1EXRILD5M', NULL, '2798945756', 25000, 'CHQ # 194, CHQ Date: 2019-03-17 ( SUPPLIER CHQ ) ; ESSA', '2', '194', '2019-03-09', 1),
('E9LV9A582F2CZ9G', 'Z6D8ETUQSYEOBK7QQL78', NULL, '6752367817', 10000, 'CHQ # 97188662, CHQ Date: 2019-03-17 ( SUPPLIER CHQ ) ; ashrafi', '2', '97188662', '2019-03-16', 1),
('20190312063526', 'OIP8LT8QNBS1EXRILD5M', '000000', NULL, 100000, '', '', '', '2019-03-11', 1),
('20190312133426', '2RTL88CE6CZON8A48Q7H', '2902', NULL, 0, '', '', '', '2019-03-12', 1),
('20190313054236', 'Q7FR2XS4JI3PV48ANWE2', '59', NULL, 49600, '', '', '', '2019-03-12', 1),
('20190313075417', 'IP9TWAG6VSVG6NTYP6RF', '2574', NULL, 13750, '', '', '', '2019-03-11', 1),
('UIVQAJNKQORXULV', 'Z6D8ETUQSYEOBK7QQL78', NULL, '3914694656', 10000, 'CHQ # 19179641, CHQ Date: 2019-03-25 ( SUPPLIER CHQ ) ; arsalan', '2', '19179641', '2019-03-16', 1),
('SDKZ12JZRX9CDN7', 'HMITTMTF6JUD4XSUKFWZ', NULL, '3982164434', 15000, 'CHQ # 0000, CHQ Date: 2019-03-26 ( SUPPLIER CHQ ) ; al makkah', '2', '0000', '2019-03-14', 1),
('CVTLRO7R83H4YHL', 'HMITTMTF6JUD4XSUKFWZ', NULL, '3494325284', 15000, 'CHQ # 0000, CHQ Date: 2019-04-08 ( SUPPLIER CHQ ) ; al makkah', '2', '0000', '2019-03-14', 1),
('ZJ4H5LGSJWHR9F6', 'HMITTMTF6JUD4XSUKFWZ', NULL, '9639869772', 25000, 'CHQ # 0000059, CHQ Date: 2019-03-26 ( HBL ) ; zeshan', '2', '0000059', '2019-03-14', 1),
('6K3Z4J2NRPMNCLH', 'HMITTMTF6JUD4XSUKFWZ', NULL, '1785785679', 25000, 'CHQ # 0000060, CHQ Date: 2019-03-31 ( HBL ) ; zeshan', '2', '0000060', '2019-03-14', 1),
('SDODUOTII6KPB47', 'HMITTMTF6JUD4XSUKFWZ', NULL, '1573512921', 25000, 'CHQ # 0000061, CHQ Date: 2019-04-14 ( HBL ) ; zeshan', '2', '0000061', '2019-03-14', 1),
('TQS4V1PB5L7QXDP', 'OGXZWFUZJQGQR8KPCUQF', NULL, '3379327473', 15000, 'CHQ # 0000, CHQ Date: 2019-03-16 ( SUPPLIER CHQ ) ; ezzy paint', '2', '0000', '2019-03-16', 1),
('NCVTCTTGXAUL3FR', 'OGXZWFUZJQGQR8KPCUQF', NULL, '7414947445', 15000, 'CHQ # 0000, CHQ Date: 2019-03-25 ( SUPPLIER CHQ ) ; anees paint', '2', '0000', '2019-03-16', 1),
('CRMO517HVFEA5S4', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '2248796669', 45000, 'CHQ # 10578487, CHQ Date: 2019-04-21 ( HBL ) ; ZESHAN', '2', '', '2019-03-25', 1),
('NRKWJTZKGNAZFC8', 'Q7FR2XS4JI3PV48ANWE2', NULL, '6581863468', 40000, 'CHQ # 00000062, CHQ Date: 2019-04-17 ( HBL ) ; zeeshan', '2', '00000062', '2019-03-18', 1),
('NP26GHKV1M6YSF6', 'Q7FR2XS4JI3PV48ANWE2', NULL, '3937286122', 40000, 'CHQ # 16210340, CHQ Date: 2019-03-28 ( MEEZAN ) ; zeeshan', '2', '16210340', '2019-03-18', 1),
('20190325115633', 'OIP8LT8QNBS1EXRILD5M', '2911', NULL, 142000, '', '', '', '2019-03-22', 1),
('HQ4P9YLOW7Y1TP5', '38G8VAYQUTANT6T7P6NK', NULL, '2638872736', 25000, 'CHQ # 119460453, CHQ Date: 2019-03-24 ( SUPPLIER CHQ ) ; ezzy paints', '2', '119460453', '2019-03-20', 1),
('UAFCAM1173SKVM2', 'AU5YU8HI5RK3ME4ZRSGE', NULL, '2377828361', 8000, ' CASH', '1', '', '2019-01-16', 1),
('S437IRXCDFNOJDW', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '5978469857', 5000, ' ZESHAN', '1', '', '2019-03-25', 1),
('Z1TNRCKWLARQ44Q', '38G8VAYQUTANT6T7P6NK', NULL, '8726419487', 25000, 'CHQ # 00000077, CHQ Date: 2019-03-27 ( SUPPLIER CHQ ) ; new al noor', '2', '00000077', '2019-03-20', 1),
('K6S4TW8FB13AXT8', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '3991198374', 45000, 'CHQ # 10578489, CHQ Date: 2019-04-30 ( HBL ) ; ZESHAN', '2', '', '2019-03-25', 1),
('F25VG52SIW9KOMF', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '5316653868', 45000, 'CHQ # 10578488, CHQ Date: 2019-04-24 ( HBL ) ; ZESHAN', '2', '', '2019-03-25', 1),
('TU7YCRK8BYFLDA2', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '8536995964', 45000, 'CHQ # 10578486, CHQ Date: 2019-04-18 ( HBL ) ; ZESHAN', '2', '', '2019-03-25', 1),
('34VY2R721P73I48', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '6253679559', 45000, 'CHQ # 10578485, CHQ Date: 2019-04-12 ( HBL ) ; ZESHAN', '2', '', '2019-03-25', 1),
('20190325062537', 'D23F97RKV572XU63L93E', '1883', NULL, 55625, '', '', '', '2019-03-22', 1),
('20190325070552', '38G8VAYQUTANT6T7P6NK', '27', NULL, 70250, '', '', '', '2019-03-21', 1),
('20190325072020', 'AU5YU8HI5RK3ME4ZRSGE', '6414', NULL, 10000, '', '', '', '2019-03-15', 1),
('ILNGQ7FCVEUSDP4', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '2842453864', 45000, 'CHQ # 10578484, CHQ Date: 2019-03-27 ( HBL ) ; ZESHAN', '2', '', '2019-03-25', 1),
('VV32CS8D6E7XCYJ', 'ZZDE8VQ5MFPC9MZRNP7T', NULL, '3483464838', 0, ' ', '1', '', '2019-03-28', 1),
('148RY6GRWS6OAWB', 'ZZDE8VQ5MFPC9MZRNP7T', NULL, '8815977263', 10000, ' zeeshan', '1', '', '2019-03-28', 1),
('20190327060903', 'ZZDE8VQ5MFPC9MZRNP7T', '2528', NULL, 52500, '', '', '', '2019-03-26', 1),
('LLD72SG699BEXMI', '38G8VAYQUTANT6T7P6NK', NULL, '7942784387', 50000, 'CHQ # 19250561, CHQ Date: 2019-04-16 ( MEEZAN ) ; ', '2', '19250561', '2019-03-20', 1),
('EP69WI8Y7725NHR', 'ZZDE8VQ5MFPC9MZRNP7T', NULL, '2596614361', 15000, 'CHQ # 05579520, CHQ Date: 2019-04-03 ( SUPPLIER CHQ ) ; anees paint', '2', '', '2019-03-28', 1),
('M41ISMMUC1DUDJ7', 'ZZDE8VQ5MFPC9MZRNP7T', NULL, '5197887719', 9000, 'CHQ # 00054393, CHQ Date: 2019-04-05 ( SUPPLIER CHQ ) ; shareeq rang mahal', '2', '', '2019-03-28', 1),
('I6OMK1P7NT9YB1G', '8EC45YB7SSBDHR45SUYQ', NULL, '5249787427', 36000, 'CHQ # 10578490, CHQ Date: 2019-05-12 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10578490', '2019-03-25', 1),
('W9Z1GETA9W8NKLU', '8EC45YB7SSBDHR45SUYQ', NULL, '9631277666', 36000, 'CHQ # 10578491, CHQ Date: 2019-05-17 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10578491', '2019-03-25', 1),
('BM3KT85AN2FGS9Y', '8EC45YB7SSBDHR45SUYQ', NULL, '7251586677', 36000, 'CHQ # 10578492, CHQ Date: 2019-05-24 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10578492', '2019-03-25', 1),
('BYIB6EFZX3F54AA', '8EC45YB7SSBDHR45SUYQ', NULL, '5448784351', 36000, 'CHQ # 10578493, CHQ Date: 2019-05-31 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10578493', '2019-03-25', 1);
INSERT INTO `supplier_ledger` (`transaction_id`, `supplier_id`, `chalan_no`, `deposit_no`, `amount`, `description`, `payment_type`, `cheque_no`, `date`, `status`) VALUES
('DYQDCLX3JO3YPEI', '17ZBKYN9I1UHC9AYDKFA', NULL, '3861927616', 60000, 'CHQ # 00001043, CHQ Date: 2019-04-06 ( SUPPLIER CHQ ) ; tahir paint', '2', '00001043', '2019-03-27', 1),
('FC19YW2VML3GATP', 'Q849P2OLCS1QYZVYV1K7', NULL, '7214322935', 20000, 'CHQ # 119460454, CHQ Date: 2019-04-01 ( SUPPLIER CHQ ) ; ezzy paints', '2', '119460454', '2019-03-28', 1),
('613N5N3915FHRVX', 'OIP8LT8QNBS1EXRILD5M', NULL, '5564475266', 35000, 'CHQ # 19250564, CHQ Date: 2019-04-07 ( MEEZAN ) ; zeeshan', '2', '19250564', '2019-03-25', 1),
('E2CGXMMT2VOKDAP', 'OIP8LT8QNBS1EXRILD5M', NULL, '7495852683', 35000, 'CHQ # 19250562, CHQ Date: 2019-04-18 ( MEEZAN ) ; zeeshan', '2', '19250562', '2019-03-25', 1),
('38SSM5TN8RGQW7U', 'OIP8LT8QNBS1EXRILD5M', NULL, '7265646458', 35000, 'CHQ # 19250563, CHQ Date: 2019-04-22 ( MEEZAN ) ; zeeshan', '2', '19250563', '2019-03-25', 1),
('O9RFL85ASE9997K', 'OIP8LT8QNBS1EXRILD5M', NULL, '1625475222', 35000, 'CHQ # 19250565, CHQ Date: 2019-05-10 ( MEEZAN ) ; zeeshan', '2', '19250565', '2019-03-25', 1),
('4QD69VY77GUZBEI', 'D23F97RKV572XU63L93E', NULL, '8914998174', 20000, 'CHQ # 10666465, CHQ Date: 2019-04-03 ( SUPPLIER CHQ ) ; subrang', '2', '10666465', '2019-03-30', 1),
('SCROXA8LU519YD9', 'D23F97RKV572XU63L93E', NULL, '5229971868', 50000, 'CHQ # 20019712, CHQ Date: 2019-04-20 ( SUPPLIER CHQ ) ; saadb paint', '2', '20019712', '2019-03-30', 1),
('EPMFTM88TK9H1F2', '2RTL88CE6CZON8A48Q7H', NULL, '8378383934', 50000, 'CHQ # 19250567, CHQ Date: 2019-04-12 ( MEEZAN ) ; ZEESHAN', '2', '19250567', '2019-04-01', 1),
('UVC64LZTFQSW1Z4', '2RTL88CE6CZON8A48Q7H', NULL, '1939167171', 50000, 'CHQ # 19250568, CHQ Date: 2019-04-20 ( MEEZAN ) ; ZEESHAN', '2', '19250568', '2019-04-01', 1),
('4TUGYGFUC7FR23Z', '2RTL88CE6CZON8A48Q7H', NULL, '5355269436', 50000, 'CHQ # 19250569, CHQ Date: 2019-04-28 ( MEEZAN ) ; ZEESHAN', '2', '19250569', '2019-04-01', 1),
('E4OQE4WIS5S6FFW', '2RTL88CE6CZON8A48Q7H', NULL, '5749671889', 50000, 'CHQ # 10578495, CHQ Date: 2019-04-15 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10578495', '2019-04-01', 1),
('EJNX1SVI3SL5VEH', '2RTL88CE6CZON8A48Q7H', NULL, '3584851943', 50000, 'CHQ # 10578496, CHQ Date: 2019-04-28 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10578496', '2019-04-01', 1),
('NTZC18I4172XC6V', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '7899214452', 20000, 'CHQ # 0000078, CHQ Date: 2019-04-05 ( SUPPLIER CHQ ) ; new al noor', '2', '0000078', '2019-04-01', 1),
('HSX42W1QDJ8WT4T', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '8269683179', 15000, 'CHQ # 05579527, CHQ Date: 2019-04-15 ( SUPPLIER CHQ ) ; anees paint', '2', '05579527', '2019-04-01', 1),
('ACF29B4Z77', 'UOG71LV2MZUSTC69H2Y2', 'Adjustment ', NULL, 0, 'Previous adjustment of RAJA MARBEL with software ', 'NA', 'NA', '2019-04-03', 1),
('20190411055950', '8EM2GUI7NF8JLN7BK56L', '106103', NULL, 37050, '', '', '', '2019-04-09', 1),
('20190403071050', 'D23F97RKV572XU63L93E', '1923', NULL, 33375, '', '', '', '2019-04-02', 1),
('20190403071358', 'IP9TWAG6VSVG6NTYP6RF', '2606', NULL, 13750, '', '', '', '2019-04-01', 1),
('20190403073705', 'UOG71LV2MZUSTC69H2Y2', '000012', NULL, 84800, '', '', '', '2019-03-21', 1),
('20190416061951', 'Q7FR2XS4JI3PV48ANWE2', '92', NULL, 20375, '', '', '', '2019-04-15', 1),
('20190416074632', 'PN6D6ZWHZOE6GNNVVE8E', '326', NULL, 43000, '', '', '', '2019-04-13', 1),
('XLTEXFIOS6O67EF', 'IP9TWAG6VSVG6NTYP6RF', NULL, '5444174697', 10000, ' CASH', '1', '', '2019-04-17', 1),
('P9SIVDJ5YWK1Y7T', 'KVHAGIB239PCDIU1IFOL', NULL, '6167388157', 11000, 'CHQ # 10994047, CHQ Date: 2019-12-12 ( SUPPLIER CHQ ) ; KORANGI B.S.M PAINT', '2', '10994047', '2019-12-11', 1),
('6VVTPGCY1U4BGEK', 'IP9TWAG6VSVG6NTYP6RF', NULL, '1397123622', 10000, 'CHQ # 19756269, CHQ Date: 2019-05-28 ( MEEZAN ) ; RUNG CORNER', '2', '19756269', '2019-04-17', 1),
('20190409080456', 'Q7FR2XS4JI3PV48ANWE2', '81', NULL, 26000, '', '', '', '2019-04-02', 1),
('20190411060930', 'OIP8LT8QNBS1EXRILD5M', '2921', NULL, 133600, '', '', '', '2019-04-10', 1),
('MO2MVNB1L9', '1GD2IMOWSFWPSCZD35DQ', 'Adjustment ', NULL, 0, 'Previous adjustment of WAJID CHALK with software ', 'NA', 'NA', '2019-04-16', 1),
('O5DMHZVK2JMF1L6', 'KVHAGIB239PCDIU1IFOL', NULL, '1192788295', 10000, 'CHQ # 29623720, CHQ Date: 2019-12-16 ( SUPPLIER CHQ ) ; MASHALLAH/GULSHAN  E HADID', '2', '29623720', '2019-12-11', 1),
('PL7UFQ6TZ2', 'WH74CL4U9NF73DU6SHHP', 'Adjustment ', NULL, 0, 'Previous adjustment of PREMIER PRODUCT with software ', 'NA', 'NA', '2019-04-16', 1),
('20190416075643', 'WH74CL4U9NF73DU6SHHP', '10', NULL, 19750, '', '', '', '2019-04-09', 1),
('20191214055444', '73841H2DMU823SWSFEI3', '1510', NULL, 14250, '', '', '', '2019-12-12', 1),
('T7H9L5HNT28IWOW', 'KVHAGIB239PCDIU1IFOL', NULL, '5782341422', 4000, ' CASH', '1', '', '2019-12-11', 1),
('20191214055053', 'ZZDE8VQ5MFPC9MZRNP7T', '2919', NULL, 26250, '', '', '', '2019-12-11', 1),
('7CUXMU4VBNM2LTL', 'UOG71LV2MZUSTC69H2Y2', NULL, '6426184649', 10000, ' CASH', '1', '', '2019-04-18', 1),
('KYXZNRQVOE57B1K', 'OIP8LT8QNBS1EXRILD5M', NULL, '9276563625', 50000, 'CHQ # 000000, CHQ Date: 2019-05-17 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '000000', '2019-04-16', 1),
('AWWNFFYFIMFC98E', 'OIP8LT8QNBS1EXRILD5M', NULL, '2446238582', 50000, 'CHQ # 000000, CHQ Date: 2019-05-30 ( SUPPLIER CHQ ) ; ADNAN PAINT', '2', '000000', '2019-04-16', 1),
('ROHC6CIFOYTBMHM', 'KVHAGIB239PCDIU1IFOL', NULL, '8181164631', 20000, 'CHQ # 0000000, CHQ Date: 2019-04-23 ( SUPPLIER CHQ ) ; NEW AL NOOR', '2', '0000000', '2019-04-16', 1),
('84AK3CVV869PDS1', 'KVHAGIB239PCDIU1IFOL', NULL, '2459896945', 27750, 'CHQ # 0000000, CHQ Date: 2019-05-01 ( SUPPLIER CHQ ) ; HI FI', '2', '0000000', '2019-04-16', 1),
('TLGZPTQWY7T6VOA', 'KVHAGIB239PCDIU1IFOL', NULL, '5776182644', 2250, ' CASH', '1', '', '2019-04-16', 1),
('RHLX9FP1TGLRA6Y', '73841H2DMU823SWSFEI3', NULL, '1943426119', 15000, 'CHQ # 0000000, CHQ Date: 2019-04-19 ( SUPPLIER CHQ ) ; HI FI', '2', '0000000', '2019-04-15', 1),
('WHG5E6IQ2MSUG5H', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '5349815477', 25000, 'CHQ # 0000200, CHQ Date: 2019-04-20 ( HBL ) ; ZEESHAN', '2', '0000200', '2019-04-15', 1),
('VT82GKY7XYTIHIU', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '1115478155', 25000, 'CHQ # 0000201, CHQ Date: 2019-04-27 ( HBL ) ; ZEESHAN', '2', '0000201', '2019-04-15', 1),
('99IB3FGOYTS628G', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '7279239939', 33250, 'CHQ # 0000202, CHQ Date: 2019-05-12 ( HBL ) ; ZEESHAN', '2', '0000202', '2019-04-15', 1),
('Q1MIZMR445JO3RB', '1GD2IMOWSFWPSCZD35DQ', NULL, '7891926238', 30000, 'CHQ # 000000, CHQ Date: 2019-05-03 ( SUPPLIER CHQ ) ; WALL STAR', '2', '000000', '2019-04-15', 1),
('BNHX55J9PWHBMN8', '1GD2IMOWSFWPSCZD35DQ', NULL, '6114346351', 20000, ' CASH', '1', '', '2019-04-15', 1),
('20190420070124', 'OIP8LT8QNBS1EXRILD5M', '2930', NULL, 91600, '', '', '', '2019-04-18', 1),
('20190420072020', 'FYYUDE5ZMRGGXLPD4PZL', '229', NULL, 348750, '', '', '', '2019-04-17', 1),
('GTP5NOR1JKVHCLG', 'Q7FR2XS4JI3PV48ANWE2', NULL, '1436467797', 40000, 'CHQ # 10266448, CHQ Date: 2019-04-28 ( SUPPLIER CHQ ) ; EZZY PAINT', '2', '10266448', '2019-04-20', 1),
('H768BNMY69C7KY2', 'Q7FR2XS4JI3PV48ANWE2', NULL, '8228531432', 12600, 'CHQ # 00221662, CHQ Date: 2019-04-25 ( SUPPLIER CHQ ) ; ADNAN GULZAR E HIJRI', '2', '00221662', '2019-04-20', 1),
('20190420073430', '73841H2DMU823SWSFEI3', '17493K', NULL, 14250, '', '', '', '2019-04-15', 1),
('LAZDEC29UB6B3D5', 'Q849P2OLCS1QYZVYV1K7', NULL, '5511584611', 40000, 'CHQ # 10266449, CHQ Date: 2019-05-09 ( SUPPLIER CHQ ) ; EZZY PAINT', '2', '10266449', '2019-04-23', 1),
('20190422062015', 'KVHAGIB239PCDIU1IFOL', '9207', NULL, 249900, '', '', '', '2019-04-18', 1),
('2W59J43KBAEBHNJ', 'HMITTMTF6JUD4XSUKFWZ', NULL, '9154838291', 25000, 'CHQ # 000000, CHQ Date: 2019-04-18 ( SUPPLIER CHQ ) ; AGHA PAINT', '2', '000000', '2019-04-16', 1),
('4NXXGFEJ5F8LFL9', 'HMITTMTF6JUD4XSUKFWZ', NULL, '1789189258', 25000, 'CHQ # 000000, CHQ Date: 2019-04-30 ( SUPPLIER CHQ ) ; AGHA PAINT', '2', '000000', '2019-04-16', 1),
('1KUKD76LW96LYFY', 'HMITTMTF6JUD4XSUKFWZ', NULL, '6268257265', 23800, 'CHQ # 000000, CHQ Date: 2019-05-12 ( MEEZAN ) ; ZEESHAN', '2', '000000', '2019-04-16', 1),
('9RWA5DPA5JXO1L6', 'HMITTMTF6JUD4XSUKFWZ', NULL, '3447469559', 26000, 'CHQ # 000000, CHQ Date: 2019-05-13 ( SUPPLIER CHQ ) ; AL MAKKAH PAINT (GP)', '2', '000000', '2019-04-16', 1),
('KXZYVQQC92RRPX8', 'XOLLVIVKD7CEEFLQEPQN', NULL, '3467386711', 20000, 'CHQ # 05579533, CHQ Date: 2019-04-26 ( SUPPLIER CHQ ) ; ANEES PAINT', '2', '05579533', '2019-04-15', 1),
('U2ENTB7I4W', 'XOLLVIVKD7CEEFLQEPQN', 'Adjustment ', NULL, 47200, 'Previous adjustment of ZULFIQAR GIFT with software ', 'NA', 'NA', '2019-04-25', 1),
('ND6MCFGUEEAMNF4', '8EM2GUI7NF8JLN7BK56L', NULL, '3764738993', 36760, 'CHQ # 36535205, CHQ Date: 2019-06-30 ( BANK AL FALAH ) ; ZEESHAN', '2', '36535205', '2019-04-27', 1),
('ICH7MW9XQESQWXF', '8EM2GUI7NF8JLN7BK56L', NULL, '5285567199', 40000, 'CHQ # 10266449, CHQ Date: 2019-05-20 ( SUPPLIER CHQ ) ; EZZY PAINT (BAH)', '2', '10266449', '2019-04-27', 1),
('79JQXY81E2CC49C', 'WYU7GK7FHY1AFSA8DAHK', NULL, '2524342372', 20000, 'CHQ # 10602330, CHQ Date: 2019-05-08 ( SUPPLIER CHQ ) ; GHOSIA PAINT', '2', '10602330', '2019-04-25', 1),
('EKAFLGJOBMN8ZMQ', 'OGXZWFUZJQGQR8KPCUQF', NULL, '4734183843', 40000, 'CHQ # 10266450, CHQ Date: 2019-05-30 ( SUPPLIER CHQ ) ; EZZY PAINTS', '2', '10266450', '2019-04-29', 1),
('CFWC56MO49DPOA1', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '5692322824', 40000, 'CHQ # 10266451, CHQ Date: 2019-06-10 ( SUPPLIER CHQ ) ; EZZY PAINTS', '2', '10266451', '2019-04-29', 1),
('VX3B8V4FUZYTUAE', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '4785997719', 40000, 'CHQ # 10266452, CHQ Date: 2019-06-20 ( SUPPLIER CHQ ) ; EZZY PAINTS', '2', '10266452', '2019-04-29', 1),
('20190430073533', 'Q7FR2XS4JI3PV48ANWE2', '04', NULL, 13750, '', '', '', '2019-04-23', 1),
('IDUECLK9FZIZHCE', 'PN6D6ZWHZOE6GNNVVE8E', NULL, '6976457985', 20000, 'CHQ # 000000, CHQ Date: 2019-04-10 ( SUPPLIER CHQ ) ; MUNEER PAINT', '2', '000000', '2019-04-08', 1),
('20190502072126', 'IP9TWAG6VSVG6NTYP6RF', '2641', NULL, 13750, '', '', '', '2019-04-24', 1),
('OD2RQMX9EVD9CHT', '8EC45YB7SSBDHR45SUYQ', NULL, '9317333441', 50000, 'CHQ # 11878550, CHQ Date: 2019-04-27 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '11878550', '2019-04-18', 1),
('EY589KPLQO3BY1H', '8EC45YB7SSBDHR45SUYQ', NULL, '2338553663', 50000, 'CHQ # 36535204, CHQ Date: 2019-05-31 ( BANK AL FALAH ) ; ZEESHAN', '2', '36535204', '2019-04-18', 1),
('F92AUIMLJ37AHN7', '8EC45YB7SSBDHR45SUYQ', NULL, '2392669728', 50000, 'CHQ # 36535203, CHQ Date: 2019-05-26 ( BANK AL FALAH ) ; ZEESHAN', '2', '36535203', '2019-04-18', 1),
('JNWJ86ZU9LYCR2H', '8EC45YB7SSBDHR45SUYQ', NULL, '1477885312', 50000, 'CHQ # 36535202, CHQ Date: 2019-05-19 ( BANK AL FALAH ) ; ZEESHAN', '2', '36535202', '2019-04-18', 1),
('XCPYJPLQQML8D16', '8EC45YB7SSBDHR45SUYQ', NULL, '8234733972', 50000, 'CHQ # 36535201, CHQ Date: 2019-05-14 ( BANK AL FALAH ) ; ZEESHAN', '2', '36535201', '2019-04-18', 1),
('20190502074118', 'Q7FR2XS4JI3PV48ANWE2', '09', NULL, 36000, '', '', '', '2019-04-26', 1),
('OFN3NBF5SNT44J4', '8EC45YB7SSBDHR45SUYQ', NULL, '8661361278', 50000, 'CHQ # 00000, CHQ Date: 2019-06-30 ( SUPPLIER CHQ ) ; ADNAN PAINT', '2', '00000', '2019-05-02', 1),
('SDUXNI8JR1R56OK', '8EC45YB7SSBDHR45SUYQ', NULL, '5732289913', 40000, 'CHQ # 00000, CHQ Date: 2019-06-30 ( SUPPLIER CHQ ) ; EZZY PAINT', '2', '00000', '2019-05-02', 1),
('8PDG8JMUKDJZLTI', '8EC45YB7SSBDHR45SUYQ', NULL, '3672617243', 20000, 'CHQ # 00000, CHQ Date: 2019-05-07 ( SUPPLIER CHQ ) ; NEW AL NOOR PAINT', '2', '00000', '2019-05-02', 1),
('TOLOR4AR6Q8HGN4', '8EC45YB7SSBDHR45SUYQ', NULL, '3684348117', 25000, 'CHQ # 00000, CHQ Date: 2019-05-13 ( SUPPLIER CHQ ) ; SAAD PAINT', '2', '00000', '2019-05-02', 1),
('T3PXZN8ZN3P8ZXH', 'D23F97RKV572XU63L93E', NULL, '6689586561', 35000, 'CHQ # 19250572, CHQ Date: 2019-05-18 ( MEEZAN ) ; ZEESHAN', '2', '19250572', '2019-05-03', 1),
('Z9QW6H5GJFFOAAJ', 'D23F97RKV572XU63L93E', NULL, '2819634533', 35000, 'CHQ # 19250573, CHQ Date: 2019-05-31 ( MEEZAN ) ; ZEESHAN', '2', '19250573', '2019-05-03', 1),
('20190511101950', '2RTL88CE6CZON8A48Q7H', '106293/10001', NULL, 105450, '', '', '', '2019-05-10', 1),
('20190511102505', 'Q7FR2XS4JI3PV48ANWE2', '32', NULL, 20375, '', '', '', '2019-05-08', 1),
('20190511102808', 'IP9TWAG6VSVG6NTYP6RF', '2666', NULL, 13750, '', '', '', '2019-05-09', 1),
('20190511103116', 'D23F97RKV572XU63L93E', '2105', NULL, 66750, '', '', '', '2019-05-04', 1),
('20190511103917', 'ZZDE8VQ5MFPC9MZRNP7T', '2593', NULL, 52500, '', '', '', '2019-04-30', 1),
('20190511104635', 'OIP8LT8QNBS1EXRILD5M', '2938', NULL, 104600, '', '', '', '2019-05-08', 1),
('6M7T6U2WWWX848S', 'UOG71LV2MZUSTC69H2Y2', NULL, '1662731182', 13275, 'CHQ # A-22272082, CHQ Date: 2019-05-25 ( MEEZAN ) ; ZEESHAN', '2', 'A-22272082', '2019-05-10', 1),
('E5ZXDXNB2J1AKWX', 'UOG71LV2MZUSTC69H2Y2', NULL, '7166846558', 10000, 'CHQ # 10022752, CHQ Date: 2019-05-30 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10022752', '2019-05-10', 1),
('9BSMNPD2SKY7RU7', 'UOG71LV2MZUSTC69H2Y2', NULL, '4559289942', 10000, 'CHQ # 06813283, CHQ Date: 2019-05-20 ( SUPPLIER CHQ ) ; KUSHAL BANK/RATO DAIRO', '2', '06813283', '2019-05-10', 1),
('4ITSV82S3B63H8Y', '8EM2GUI7NF8JLN7BK56L', NULL, '1788349738', 30000, 'CHQ # 19071273, CHQ Date: 2019-05-15 ( SUPPLIER CHQ ) ; NEW AL NOOR/SILK BANK', '2', '19071273', '2019-05-09', 1),
('6CECKJISMRHV5W5', '8EM2GUI7NF8JLN7BK56L', NULL, '2254275249', 15000, 'CHQ # 00122443, CHQ Date: 2019-05-28 ( SUPPLIER CHQ ) ; AL-MAKKAH/BANK ISLAMI', '2', '00122443', '2019-05-09', 1),
('7UTHENLK2P14GMC', '8EM2GUI7NF8JLN7BK56L', NULL, '7569522798', 15000, 'CHQ # 000122442, CHQ Date: 2019-05-18 ( SUPPLIER CHQ ) ; AL-MADINA PAINT/BANK ISLAMI', '2', '000122442', '2019-05-09', 1),
('YD8V6JPVJODWLHX', '8EM2GUI7NF8JLN7BK56L', NULL, '6971915815', 50000, 'CHQ # 02515035, CHQ Date: 2019-05-23 ( SUPPLIER CHQ ) ; JHULAY LAL/KHUSHALL BANK', '2', '02515035', '2019-05-09', 1),
('KLY7XIVHQJK34YS', '8EM2GUI7NF8JLN7BK56L', NULL, '3125473187', 50000, 'CHQ # A-19250574, CHQ Date: 2019-05-23 ( MEEZAN ) ; ZEESHAN', '2', 'A-19250574', '2019-05-09', 1),
('2IS2TOZKFL4VROV', '8EM2GUI7NF8JLN7BK56L', NULL, '4355248768', 50000, 'CHQ # A-19250575, CHQ Date: 2019-05-15 ( MEEZAN ) ; ZEESHAN', '2', 'A-19250575', '2019-05-09', 1),
('WZP6B4SXHEELQ76', '17ZBKYN9I1UHC9AYDKFA', NULL, '2797674653', 60000, 'CHQ # 53495451, CHQ Date: 2019-05-28 ( SUPPLIER CHQ ) ; shehzad al hussaini MPM', '2', '53495451', '2019-05-13', 1),
('20190521052604', 'Q849P2OLCS1QYZVYV1K7', '362', NULL, 46250, '', '', '', '2019-04-23', 1),
('K3LR1SD8JN24JEE', 'ZZDE8VQ5MFPC9MZRNP7T', NULL, '6215726653', 42000, 'CHQ # 000000, CHQ Date: 2019-06-18 ( MEEZAN ) ; ZEESHAN', '2', '000000', '2019-05-14', 1),
('12CPJ1UDMPCA3R6', 'PN6D6ZWHZOE6GNNVVE8E', NULL, '7651213682', 15000, 'CHQ # 10022757, CHQ Date: 2019-05-26 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10022757', '2019-05-15', 1),
('IY5XM9KEXA5XY8O', 'PN6D6ZWHZOE6GNNVVE8E', NULL, '3463166272', 8000, 'CHQ # 000000, CHQ Date: 2019-05-26 ( SUPPLIER CHQ ) ; ARSALAN PAINT', '2', '000000', '2019-05-15', 1),
('US5MPJZX42QFI7L', 'HMITTMTF6JUD4XSUKFWZ', NULL, '5357421534', 50000, 'CHQ # 19250578, CHQ Date: 2019-06-16 ( MEEZAN ) ; ZEESHAN', '2', '', '2019-05-21', 1),
('KJHHIQY6Z2NXRH7', 'HMITTMTF6JUD4XSUKFWZ', NULL, '5527272861', 17000, 'CHQ # 10022891, CHQ Date: 2019-05-30 ( SUPPLIER CHQ ) ; ASHRAFI PAINT (BAHL)', '2', '', '2019-05-21', 1),
('9WO79KMFKW1Z95E', 'HMITTMTF6JUD4XSUKFWZ', NULL, '2336762777', 4350, ' CASH', '1', '', '2019-05-21', 1),
('WXIIUDK8QACAD4T', 'HMITTMTF6JUD4XSUKFWZ', NULL, '5113386559', 40000, 'CHQ # 10266451, CHQ Date: 2019-06-19 ( SUPPLIER CHQ ) ; EZZY PAINT', '2', '10266451', '2019-05-21', 1),
('XJ6OBQZUL676AC2', 'Q7FR2XS4JI3PV48ANWE2', NULL, '3747775868', 40000, 'CHQ # 0000065, CHQ Date: 2019-05-25 ( HBL ) ; ZEESHAN', '2', '0000065', '2019-05-20', 1),
('JMKJB3Z5V6DARTB', 'Q7FR2XS4JI3PV48ANWE2', NULL, '6773819518', 10000, ' CASH', '1', '', '2019-05-20', 1),
('MEON7DSOR5MJU8B', 'OIP8LT8QNBS1EXRILD5M', NULL, '2855571833', 100000, 'CHQ # 5492658, CHQ Date: 2019-06-10 ( SUPPLIER CHQ ) ; RAO JAVEED/SANGHAR', '2', '5492658', '2019-05-20', 1),
('F6DKZPH7N44JLMX', 'OIP8LT8QNBS1EXRILD5M', NULL, '5213477376', 40400, 'CHQ # A-19250580, CHQ Date: 2019-06-23 ( MEEZAN ) ; ZEESHAN', '2', 'A-19250580', '2019-05-20', 1),
('20190523091122', '8EM2GUI7NF8JLN7BK56L', '10001', NULL, 74100, '', '', '', '2019-05-16', 1),
('7DOKTTX3LGALSPX', 'AU5YU8HI5RK3ME4ZRSGE', NULL, '5935762341', 5000, ' CASH', '1', '', '2019-05-22', 1),
('6X5NCCP3S49AEHH', 'AU5YU8HI5RK3ME4ZRSGE', NULL, '4162551184', 5000, 'CHQ # 00000, CHQ Date: 2019-06-04 ( SUPPLIER CHQ ) ; QADRI PAINT', '2', '00000', '2019-05-22', 1),
('1BNDKDIU1R8AA5J', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '9713827739', 20000, 'CHQ # 000000, CHQ Date: 2019-05-30 ( SUPPLIER CHQ ) ; NEW AL NOOR (SILK BANK)', '2', '000000', '2019-05-23', 1),
('94VMP1RL4D5NB9B', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '1383589861', 15000, 'CHQ # 00000693, CHQ Date: 2019-05-21 ( SUPPLIER CHQ ) ; SUBHAN.A PAINT (HBL)', '2', '00000693', '2019-05-23', 1),
('CYG2T3GRMFS9MZW', 'UOG71LV2MZUSTC69H2Y2', NULL, '4353755874', 20000, 'CHQ # 0000004, CHQ Date: 2019-05-28 ( SUPPLIER CHQ ) ; SAAD PAINT', '2', '0000004', '2019-05-28', 1),
('20190528095451', 'GPL2UPO3UP5JPQ1M6DBX', '33334', NULL, 57500, '', '', '', '2019-05-18', 1),
('T7Q3SZBV196X1D6', 'IP9TWAG6VSVG6NTYP6RF', NULL, '4886397862', 10000, 'CHQ # 06813282, CHQ Date: 2019-06-05 ( SUPPLIER CHQ ) ; KUSHAL BANK', '2', '06813282', '2019-05-24', 1),
('PLQPO6PXI44XJVB', 'IP9TWAG6VSVG6NTYP6RF', NULL, '4569297951', 15000, ' CASH', '1', '', '2019-05-24', 1),
('20190530092301', 'Q7FR2XS4JI3PV48ANWE2', '50', NULL, 20375, '', '', '', '2019-05-29', 1),
('20190530093241', 'OIP8LT8QNBS1EXRILD5M', '2953', NULL, 96200, '', '', '', '2019-05-29', 1),
('UPXBPGXIDY8FEKR', 'KVHAGIB239PCDIU1IFOL', NULL, '7944154844', 30900, 'CHQ # 85645374, CHQ Date: 2019-06-07 ( SUPPLIER CHQ ) ; HUSSIANABAD FARHAN', '2', '85645374', '2019-05-29', 1),
('TF3VMQS8IR', 'VU49HVTLNZGLY8DJFOXN', 'Adjustment ', NULL, 0, 'Previous adjustment of WAQAS CHALK with software ', 'NA', 'NA', '2019-06-03', 1),
('L1VHKY7U6E54DI8', 'VU49HVTLNZGLY8DJFOXN', NULL, '8587164146', 15000, ' CASH', '1', '', '2019-06-03', 1),
('20190603100258', 'VU49HVTLNZGLY8DJFOXN', '09', NULL, 15500, '', '', '', '2019-03-28', 1),
('X3JW4LI18EAYJ6P', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '5675381157', 40000, 'CHQ # 10266454, CHQ Date: 2019-07-10 ( SUPPLIER CHQ ) ; BAHL/EZZY PAINT', '2', '', '2019-06-11', 1),
('8ZB6WI7OKC85FHL', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '9212987239', 50000, 'CHQ # 19250582, CHQ Date: 2019-06-27 ( MEEZAN ) ; ZEESHAN', '2', '', '2019-06-11', 1),
('Z5EJ7GLOHOREXTN', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '1949192645', 50000, 'CHQ # 19250583, CHQ Date: 2019-06-30 ( MEEZAN ) ; ZEESHAN', '2', '', '2019-06-11', 1),
('HIDT91EVNBGIHIW', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '3242285376', 50000, 'CHQ # 19250581, CHQ Date: 2019-06-23 ( MEEZAN ) ; ZEESHAN', '2', '', '2019-06-11', 1),
('4YZMM9E9Z1CGJ4M', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '9493127141', 49000, 'CHQ # 19250584, CHQ Date: 2019-07-14 ( MEEZAN ) ; ZEESHAN', '2', '', '2019-06-11', 1),
('XDYM5JJ81PMM6JP', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '8851363191', 75000, 'CHQ # 1350326620, CHQ Date: 2019-06-30 ( SUPPLIER CHQ ) ; MEHRAN PAINTS', '2', '1350326620', '2019-06-11', 1),
('U3LRRDK7N355Y3B', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '9546752279', 40000, 'CHQ # 10266456, CHQ Date: 2019-07-30 ( SUPPLIER CHQ ) ; BAHL/EZZY PAINT', '2', '', '2019-06-11', 1),
('U9EJG4E82XD3Z4J', 'WYU7GK7FHY1AFSA8DAHK', NULL, '5717834663', 25000, 'CHQ # 000000, CHQ Date: 2019-07-24 ( SUPPLIER CHQ ) ; ALLIED BANK/MEHRAN PAINT', '2', '000000', '2019-06-10', 1),
('FOTYEQ2UXA8UANA', '8EM2GUI7NF8JLN7BK56L', NULL, '7891319872', 20000, 'CHQ # 120986256, CHQ Date: 2019-06-24 ( SUPPLIER CHQ ) ; SAAD PAINT/HABIB METRO BANK', '2', '120986256', '2019-06-12', 1),
('7L8EBC52OTPDILH', '8EM2GUI7NF8JLN7BK56L', NULL, '2691217932', 150000, 'CHQ # 52800334, CHQ Date: 2019-06-24 ( SUPPLIER CHQ ) ; NEW AL NOOR PAINT/ALLIED BANK', '2', '52800334', '2019-06-12', 1),
('20190620053118', 'Q7FR2XS4JI3PV48ANWE2', '72', NULL, 20375, '', '', '', '2019-06-18', 1),
('20190620053441', 'FYYUDE5ZMRGGXLPD4PZL', '488', NULL, 232500, '', '', '', '2019-06-19', 1),
('20190620060158', 'UOG71LV2MZUSTC69H2Y2', '2956', NULL, 45000, '', '', '', '2019-06-16', 1),
('20190620062638', '8EM2GUI7NF8JLN7BK56L', '2957', NULL, 74100, '', '', '', '2019-06-17', 1),
('20190620063206', 'OIP8LT8QNBS1EXRILD5M', '2958', NULL, 87000, '', '', '', '2019-06-17', 1),
('4GWC3EQGU61YL5S', 'HMITTMTF6JUD4XSUKFWZ', NULL, '5392514219', 30000, 'CHQ # 10614534, CHQ Date: 2019-06-25 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614534', '2019-06-19', 1),
('P2QWB95OM421GRO', 'HMITTMTF6JUD4XSUKFWZ', NULL, '8122723689', 30000, 'CHQ # 10614533, CHQ Date: 2019-06-20 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614533', '2019-06-19', 1),
('FQAGZLDA9IPEOY7', 'HMITTMTF6JUD4XSUKFWZ', NULL, '9498321422', 30000, 'CHQ # 10614535, CHQ Date: 2019-06-30 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614535', '2019-06-19', 1),
('G1HLRQAZ7OB616X', 'HMITTMTF6JUD4XSUKFWZ', NULL, '7577986162', 10000, ' ZEESHAN', '1', '', '2019-06-19', 1),
('LYZOBEO9BXTP1G9', '17ZBKYN9I1UHC9AYDKFA', NULL, '4864166742', 42750, 'CHQ # 19250586, CHQ Date: 2019-06-28 ( MEEZAN ) ; ZEESHAN', '2', '19250586', '2019-06-17', 1),
('13IFV2HK3CQEZL1', '17ZBKYN9I1UHC9AYDKFA', NULL, '3381659392', 60000, 'CHQ # 19250587, CHQ Date: 2019-06-18 ( MEEZAN ) ; ZEESHAN', '2', '19250587', '2019-06-17', 1),
('XJFGIMTATYRNVLN', '17ZBKYN9I1UHC9AYDKFA', NULL, '1944242673', 25510, 'CHQ # 19250588, CHQ Date: 2019-07-10 ( MEEZAN ) ; ZEESHAN', '2', '19250588', '2019-06-17', 1),
('MG4GN3BYXIVGB3N', 'KVHAGIB239PCDIU1IFOL', NULL, '6232357875', 12000, 'CHQ # 067252, CHQ Date: 2019-06-22 ( SUPPLIER CHQ ) ; SUB RANG/ASKARI', '2', '067252', '2019-06-21', 1),
('SROWOU3SRCD9CVQ', 'KVHAGIB239PCDIU1IFOL', NULL, '3811998991', 15000, 'CHQ # 1721753855, CHQ Date: 2019-06-20 ( SUPPLIER CHQ ) ; SUB RANG/MCB', '2', '1721753855', '2019-06-21', 1),
('R3513EEC8QQ6F2Y', 'KVHAGIB239PCDIU1IFOL', NULL, '7759667316', 9000, 'CHQ # 10232677, CHQ Date: 2019-06-22 ( SUPPLIER CHQ ) ; SUB RANG/BAHL', '2', '10232677', '2019-06-21', 1),
('RKWX3WEV4YULMKQ', '2DMS8EDL11ISWULICZDE', NULL, '9651518821', 25000, 'CHQ # 00122444, CHQ Date: 2019-06-25 ( SUPPLIER CHQ ) ; ', '2', '00122444', '2019-06-17', 1),
('U6GXK4V8KYAFMA7', '2DMS8EDL11ISWULICZDE', NULL, '4427148557', 20000, 'CHQ # 19071284, CHQ Date: 2019-06-25 ( SUPPLIER CHQ ) ; NEW AL NOOR', '2', '19071284', '2019-06-17', 1),
('YTVSV8ZMIQYNXM6', '2DMS8EDL11ISWULICZDE', NULL, '1953725713', 34377, 'CHQ # 19250585, CHQ Date: 2019-06-28 ( SUPPLIER CHQ ) ; ZEESHAN', '2', '19250585', '2019-06-17', 1),
('8EG4KGFUZDAUSMC', 'UOG71LV2MZUSTC69H2Y2', NULL, '6414644362', 7000, 'CHQ # 80585671, CHQ Date: 2019-06-16 ( SUPPLIER CHQ ) ; SUBRANG', '2', '80585671', '2019-06-24', 1),
('81ZENKHN6YTXQ2B', 'UOG71LV2MZUSTC69H2Y2', NULL, '1523225975', 5000, 'CHQ # 19128588, CHQ Date: 2019-06-18 ( SUPPLIER CHQ ) ; SUBRANG', '2', '19128588', '2019-06-24', 1),
('S1ZRZ8UIOQGEMZR', 'UOG71LV2MZUSTC69H2Y2', NULL, '2295197588', 5000, 'CHQ # 10900469, CHQ Date: 2019-06-29 ( SUPPLIER CHQ ) ; QADRI PAINT/SHAH FAISAL', '2', '10900469', '2019-06-24', 1),
('A847OPA1I4V7Q63', 'UOG71LV2MZUSTC69H2Y2', NULL, '4453194632', 3000, ' QADRI PAINT/SHAH FAISAL', '1', '', '2019-06-24', 1),
('20190625061753', '2RTL88CE6CZON8A48Q7H', '2966', NULL, 70300, '', '', '', '2019-06-24', 1),
('57WHG6VCOOFR967', 'AU5YU8HI5RK3ME4ZRSGE', NULL, '5181279842', 20000, 'CHQ # 19071285, CHQ Date: 2019-07-02 ( SUPPLIER CHQ ) ; NEW AL NOOR PAINT', '2', '19071285', '2019-06-25', 1),
('SQWEIXCZ7VBSDHM', '8EC45YB7SSBDHR45SUYQ', NULL, '4443364794', 50000, 'CHQ # 10614541, CHQ Date: 2019-07-13 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614541', '2019-06-24', 1),
('J6M7GHYD6TLCK48', '8EC45YB7SSBDHR45SUYQ', NULL, '3717395127', 50000, 'CHQ # 10614542, CHQ Date: 2019-07-18 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614542', '2019-06-24', 1),
('PEMCFQDRKLZV2W1', '8EC45YB7SSBDHR45SUYQ', NULL, '9214545394', 50000, 'CHQ # 10614543, CHQ Date: 2019-07-23 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614543', '2019-06-24', 1),
('1EZLJ8XYUR8IOER', '8EC45YB7SSBDHR45SUYQ', NULL, '5552875416', 50000, 'CHQ # 10614544, CHQ Date: 2019-07-31 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614544', '2019-06-24', 1),
('20190625073133', '38G8VAYQUTANT6T7P6NK', '46', NULL, 51500, '', '', '', '2019-06-22', 1),
('W65FVKQBL6TP68V', 'WH74CL4U9NF73DU6SHHP', NULL, '2944975957', 19750, ' CASH', '1', '', '2019-06-25', 1),
('RKO4YMWMQ39WIC3', 'Q849P2OLCS1QYZVYV1K7', NULL, '4363124886', 10000, 'CHQ # 24205915, CHQ Date: 2019-06-26 ( SUPPLIER CHQ ) ; SUBRANG (MCB)', '2', '24205915', '2019-06-22', 1),
('U4R5FNVF2N6TNF5', 'Q849P2OLCS1QYZVYV1K7', NULL, '5567953881', 20000, 'CHQ # 00000208, CHQ Date: 2019-06-11 ( SUPPLIER CHQ ) ; HBL (ESSA PAINT)', '2', '00000208', '2019-06-22', 1),
('TL1DKNOMIFBIA3P', 'Q849P2OLCS1QYZVYV1K7', NULL, '3171627699', 12875, 'CHQ # 22272086, CHQ Date: 2019-06-30 ( SUPPLIER CHQ ) ; MEEZAN (SHAKEEL)', '2', '22272086', '2019-06-22', 1),
('J8CDC4OGNHC1NE5', 'Q849P2OLCS1QYZVYV1K7', NULL, '8468169448', 1075, ' CASH', '1', '', '2019-06-22', 1),
('WBVIYGKP4MZRSSO', 'Q7FR2XS4JI3PV48ANWE2', NULL, '3161576252', 35000, 'CHQ # 10614545, CHQ Date: 2019-07-10 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614545', '2019-06-26', 1),
('6ZF1G4JSPX7D3XM', 'Q7FR2XS4JI3PV48ANWE2', NULL, '5195434153', 20000, 'CHQ # 120986265, CHQ Date: 2019-07-09 ( SUPPLIER CHQ ) ; SAAD PAINT/HABIB METRO BANK', '2', '120986265', '2019-06-26', 1),
('U7X65HISQFYDAWZ', 'PN6D6ZWHZOE6GNNVVE8E', NULL, '8339372671', 20000, 'CHQ # 000000, CHQ Date: 2019-07-29 ( SUPPLIER CHQ ) ; GHOSIA PAINTS', '2', '000000', '2019-06-27', 1),
('20190629064723', 'PN6D6ZWHZOE6GNNVVE8E', '00000', NULL, 40000, '', '', '', '2019-06-29', 1),
('S5AK4LX7XES5M2V', 'OIP8LT8QNBS1EXRILD5M', NULL, '7438919355', 50000, 'CHQ # 10614546, CHQ Date: 2019-07-01 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614546', '2019-06-27', 1),
('N4GASALD8XCKXGL', 'OIP8LT8QNBS1EXRILD5M', NULL, '7127751294', 50000, 'CHQ # 00000042, CHQ Date: 2019-07-01 ( SUPPLIER CHQ ) ; HBL/ADNAN', '2', '00000042', '2019-06-27', 1),
('FY6DE2C8ME75QHA', 'OIP8LT8QNBS1EXRILD5M', NULL, '9642744894', 2000, ' CASH', '1', '', '2019-06-27', 1),
('Y1DH9HAXUKV1XAG', 'D68TC2VDP9CL8M6165T1', NULL, '4756812876', 9000, 'CHQ # 21947414, CHQ Date: 2019-07-09 ( SUPPLIER CHQ ) ; ALLIED BANK/M.A PAINTS G.H)', '2', '21947414', '2019-06-28', 1),
('GUWT4CXZHDT7P93', 'D68TC2VDP9CL8M6165T1', NULL, '7282125499', 5000, 'CHQ # 10900473, CHQ Date: 2019-07-11 ( SUPPLIER CHQ ) ; BAHL/QADRI PAINTS', '2', '10900473', '2019-06-28', 1),
('6W6P98L232A5RDX', 'D68TC2VDP9CL8M6165T1', NULL, '6166873329', 15000, 'CHQ # 0105160, CHQ Date: 2019-07-13 ( SUPPLIER CHQ ) ; ASKARI BANK/ARSALAN PAINTS', '2', '0105160', '2019-06-28', 1),
('GY5BHXXNXEFLE1N', 'D68TC2VDP9CL8M6165T1', NULL, '6456498259', 1000, ' CASH', '1', '', '2019-06-28', 1),
('20190701060240', 'Q7FR2XS4JI3PV48ANWE2', '81', NULL, 0, '', '', '', '2019-06-27', 1),
('20190701061353', 'ZZDE8VQ5MFPC9MZRNP7T', '2971', NULL, 26250, '', '', '', '2019-06-29', 1),
('BN6WU29VZYN1M6R', 'HMITTMTF6JUD4XSUKFWZ', NULL, '5158826877', 20000, 'CHQ # 00074810, CHQ Date: 2019-07-27 ( SUPPLIER CHQ ) ; NEW AL MAKKI PAINTS/SUMMIT BANK', '2', '00074810', '2019-07-05', 1),
('JKL9O175XD71OY6', 'HMITTMTF6JUD4XSUKFWZ', NULL, '8494945186', 30000, 'CHQ # 19250592, CHQ Date: 2019-07-16 ( MEEZAN ) ; ZEESHAN', '2', '19250592', '2019-07-05', 1),
('1RLA9Y7USLXSL2P', 'HMITTMTF6JUD4XSUKFWZ', NULL, '5659286421', 25000, 'CHQ # 19250593, CHQ Date: 2019-07-23 ( MEEZAN ) ; ZEESHAN', '2', '19250593', '2019-07-05', 1),
('QVA3E8LC4LUC7ID', 'HMITTMTF6JUD4XSUKFWZ', NULL, '1971462514', 25000, 'CHQ # 19250594, CHQ Date: 2019-07-31 ( MEEZAN ) ; ZEESHAN', '2', '19250594', '2019-07-05', 1),
('22YXCC1PTCM88LT', '2RTL88CE6CZON8A48Q7H', NULL, '2769936681', 50000, 'CHQ # 10614547, CHQ Date: 2019-07-09 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614547', '2019-07-08', 1),
('UXSPE6OB2I6MHXL', '2RTL88CE6CZON8A48Q7H', NULL, '6894738192', 50000, 'CHQ # 10614548, CHQ Date: 2019-07-10 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614548', '2019-07-08', 1),
('A9UVGG4WGW51PX7', '2RTL88CE6CZON8A48Q7H', NULL, '9258486875', 50000, 'CHQ # 10614549, CHQ Date: 2019-07-20 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614549', '2019-07-08', 1),
('C4BZEV347NRHZNV', '2RTL88CE6CZON8A48Q7H', NULL, '1111442641', 50000, 'CHQ # 10614550, CHQ Date: 2019-07-29 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614550', '2019-07-08', 1),
('2X5FIETBGF6EH4T', '2RTL88CE6CZON8A48Q7H', NULL, '8173991147', 100000, 'CHQ # 225280328, CHQ Date: 2019-08-10 ( SUPPLIER CHQ ) ; SHEHZAD AL HUSSAINI/ALLIED BANK', '2', '225280328', '2019-07-08', 1),
('VYSZA4H47RJWGPQ', 'UOG71LV2MZUSTC69H2Y2', NULL, '3983229521', 25000, 'CHQ # 19071281, CHQ Date: 2019-07-24 ( SUPPLIER CHQ ) ; NEW AL NOOR PAINTS', '2', '19071281', '2019-07-09', 1),
('2VR8ZUY56Q2TX53', '73841H2DMU823SWSFEI3', NULL, '4876397694', 5000, 'CHQ # 000000, CHQ Date: 2019-07-25 ( SUPPLIER CHQ ) ; QADRI PAINTS', '2', '000000', '2019-07-08', 1),
('7XYJFGKIZ6WSNPH', '73841H2DMU823SWSFEI3', NULL, '8549252258', 15000, ' CASH', '1', '', '2019-07-08', 1),
('20190712065429', 'Q849P2OLCS1QYZVYV1K7', '391', NULL, 70625, '', '', '', '2019-07-09', 1),
('N3N6NIWM9Q4ITGL', '38G8VAYQUTANT6T7P6NK', NULL, '2953463723', 35000, 'CHQ # 10614557, CHQ Date: 2019-07-25 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614557', '2019-07-15', 1),
('RBQQIMS9PPB6AT4', '38G8VAYQUTANT6T7P6NK', NULL, '4923182899', 35000, 'CHQ # 10614558, CHQ Date: 2019-08-10 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614558', '2019-07-15', 1),
('8QQLHTL2S8', '3URSQ9XJAVQPLR2YT7HL', 'Adjustment ', NULL, 0, 'Previous adjustment of ARFEEN with software ', 'NA', 'NA', '2019-07-15', 1),
('ZXBC28V3WL859WS', '3URSQ9XJAVQPLR2YT7HL', NULL, '5219219494', 77200, 'CHQ # 10614556, CHQ Date: 2019-08-15 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614556', '2019-07-12', 1),
('2DJ56QAZRWO9KVD', 'PN6D6ZWHZOE6GNNVVE8E', NULL, '4457648731', 10000, ' CASH', '1', '', '2019-07-12', 1),
('20190715072325', 'PN6D6ZWHZOE6GNNVVE8E', '0367', NULL, 54000, '', '', '', '2019-07-15', 1),
('AM5UOHHKT1Q47WP', 'OIP8LT8QNBS1EXRILD5M', NULL, '1397952999', 99000, 'CHQ # 19250595, CHQ Date: 2019-08-15 ( MEEZAN ) ; ZEESHAN', '2', '19250595', '2019-07-15', 1),
('20190715111635', 'KVHAGIB239PCDIU1IFOL', '9666', NULL, 55000, '', '', '', '2019-07-12', 1),
('20190715114237', '38G8VAYQUTANT6T7P6NK', '80', NULL, 14000, '', '', '', '2019-07-10', 1),
('20190715120927', '73841H2DMU823SWSFEI3', '2983', NULL, 14250, '', '', '', '2019-07-15', 1),
('20190715122302', 'WH74CL4U9NF73DU6SHHP', '44', NULL, 88500, '', '', '', '2019-07-12', 1),
('20190716053647', 'PN6D6ZWHZOE6GNNVVE8E', '0364', NULL, 48000, '', '', '', '2019-07-10', 1),
('LEE9F1PEJUJW32P', 'KVHAGIB239PCDIU1IFOL', NULL, '7822592848', 50000, 'CHQ # 46781370, CHQ Date: 2019-07-22 ( SUPPLIER CHQ ) ; UNION', '2', '', '2019-07-19', 1),
('TKWY5JMHKG86YO5', 'KVHAGIB239PCDIU1IFOL', NULL, '3449333719', 25000, 'CHQ # 67781214, CHQ Date: 2019-07-20 ( SUPPLIER CHQ ) ; MEMON PAINT', '2', '67781214', '2019-07-19', 1),
('KFTEXM2NAHXKIBT', 'UOG71LV2MZUSTC69H2Y2', NULL, '9338325814', 25000, ' CASH', '1', '', '2019-07-20', 1),
('20190722061430', 'D23F97RKV572XU63L93E', '2417', NULL, 77875, '', '', '', '2019-07-20', 1),
('9TIYJXI2U244L2E', 'D23F97RKV572XU63L93E', NULL, '9392385329', 35000, 'CHQ # 36535208, CHQ Date: 2019-08-14 ( BANK AL FALAH ) ; ZEESHAN', '2', '', '2019-07-22', 1),
('5XPZ5S49OUHX5OK', 'D23F97RKV572XU63L93E', NULL, '1529111955', 35000, 'CHQ # 36535209, CHQ Date: 2019-08-25 ( BANK AL FALAH ) ; ZEESHAN', '2', '36535209', '2019-07-22', 1),
('ARQ863GZ3RXHISG', 'D23F97RKV572XU63L93E', NULL, '7712628245', 35000, 'CHQ # 36535207, CHQ Date: 2019-07-25 ( BANK AL FALAH ) ; ZEESHAN', '2', '', '2019-07-22', 1),
('A7EMTWI33LJ6Z1V', 'AU5YU8HI5RK3ME4ZRSGE', NULL, '8564197332', 10000, 'CHQ # 10900477, CHQ Date: 2019-07-31 ( SUPPLIER CHQ ) ; QADRI PAINT/SHAH FAISAL/BANK AL HABIB', '2', '10900477', '2019-07-24', 1),
('NWXEKFSOLXWEK1I', 'AU5YU8HI5RK3ME4ZRSGE', NULL, '4821522429', 10000, 'CHQ # 12550376, CHQ Date: 2019-08-03 ( SUPPLIER CHQ ) ; GILANI PAINT', '2', '12550376', '2019-07-24', 1),
('XJ6FPH5FZDQ1OLR', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '5362331198', 30000, 'CHQ # 36535210, CHQ Date: 2019-07-27 ( BANK AL FALAH ) ; ZEESHAN', '2', '36535210', '2019-07-22', 1),
('AE4KI3OMFYZG7M4', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '1915453841', 30000, 'CHQ # 36535211, CHQ Date: 2019-08-17 ( BANK AL FALAH ) ; ZEESHAN', '2', '36535211', '2019-07-22', 1),
('NNCFHA97FJHX3J8', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '2464694211', 10000, ' CASH', '1', '', '2019-07-22', 1),
('20190725071139', 'KVHAGIB239PCDIU1IFOL', '9701', NULL, 147000, '', '', '', '2019-07-20', 1),
('YE673KSPAWQVLI6', 'OIP8LT8QNBS1EXRILD5M', NULL, '3224219774', 100000, ' CASH', '1', '', '2019-07-22', 1),
('20190725073412', 'WH74CL4U9NF73DU6SHHP', '51', NULL, 16000, '', '', '', '2019-07-22', 1),
('OS25SIS3BTK5OYU', 'IP9TWAG6VSVG6NTYP6RF', NULL, '5523355182', 25000, 'CHQ # 36535212, CHQ Date: 2019-08-16 ( BANK AL FALAH ) ; ZEESHAN', '2', '36535212', '2019-07-25', 1),
('WNKFPH7K8GV7RNV', 'IP9TWAG6VSVG6NTYP6RF', NULL, '7474222491', 15000, ' CASH', '1', '', '2019-07-25', 1),
('3GK16MPZN6YEGWM', '8EC45YB7SSBDHR45SUYQ', NULL, '4722631784', 50000, 'CHQ # 00000066, CHQ Date: 2019-08-14 ( HBL ) ; ZEESHAN', '2', '00000066', '2019-07-25', 1),
('RQF3LM36CF9F6M3', '8EC45YB7SSBDHR45SUYQ', NULL, '2952994622', 50000, 'CHQ # 00000067, CHQ Date: 2019-08-20 ( HBL ) ; ZEESHAN', '2', '00000067', '2019-07-25', 1),
('GE3EL9GA3TXP347', '8EC45YB7SSBDHR45SUYQ', NULL, '3525831369', 50000, 'CHQ # 00000068, CHQ Date: 2019-08-25 ( HBL ) ; ZEESHAN', '2', '00000068', '2019-07-25', 1),
('6O945BDAZSBNLZR', '8EC45YB7SSBDHR45SUYQ', NULL, '3769991758', 50000, 'CHQ # 00000069, CHQ Date: 2019-09-13 ( HBL ) ; ZEESHAN', '2', '00000069', '2019-07-25', 1),
('20190727081714', 'OIP8LT8QNBS1EXRILD5M', '2984', NULL, 87000, '', '', '', '2019-07-16', 1),
('20190727082055', 'IP9TWAG6VSVG6NTYP6RF', '2754', NULL, 6875, '', '', '', '2019-07-20', 1),
('LS5R13I1O8TYXRN', '2RTL88CE6CZON8A48Q7H', NULL, '1973192384', 20000, 'CHQ # 10713581, CHQ Date: 2019-07-27 ( SUPPLIER CHQ ) ; GHOSIA/BANK AL HABIB', '2', '10713581', '2019-07-25', 1),
('AB154AACGBEGOR7', '2RTL88CE6CZON8A48Q7H', NULL, '6626475875', 30000, 'CHQ # 19071241, CHQ Date: 2019-07-27 ( SUPPLIER CHQ ) ; NEW AL NOOR/SILK BANK', '2', '19071241', '2019-07-25', 1),
('I28ISWA6D5UX8ZR', '2RTL88CE6CZON8A48Q7H', NULL, '5667487482', 50000, ' CASH', '1', '', '2019-07-25', 1),
('2GINJNFLTK7OSHW', 'Q7FR2XS4JI3PV48ANWE2', NULL, '5798819161', 30000, 'CHQ # 0000070, CHQ Date: 2019-08-21 ( HBL ) ; ZEESHAN', '2', '0000070', '2019-07-31', 1),
('4AI6SCPCR89W7YM', 'Q7FR2XS4JI3PV48ANWE2', NULL, '2558813263', 30000, 'CHQ # 0000071, CHQ Date: 2019-08-21 ( HBL ) ; ZEESHAN', '2', '0000071', '2019-07-31', 1),
('20190801061957', 'Q7FR2XS4JI3PV48ANWE2', '11', NULL, 20375, '', '', '', '2019-07-27', 1),
('20190801062653', 'IP9TWAG6VSVG6NTYP6RF', '2763', NULL, 6875, '', '', '', '2019-07-29', 1),
('20190801063652', '3URSQ9XJAVQPLR2YT7HL', '002101', NULL, 77200, '', '', '', '2019-07-19', 1),
('20190802075626', 'UOG71LV2MZUSTC69H2Y2', '2986', NULL, 71750, '', '', '', '2019-07-22', 1),
('20190802075956', 'UOG71LV2MZUSTC69H2Y2', '2987', NULL, 43300, '', '', '', '2019-07-15', 1),
('XCAEUENK9JJ6UMC', '2RTL88CE6CZON8A48Q7H', NULL, '7634355456', 50000, 'CHQ # 19250596, CHQ Date: 2019-08-11 ( MEEZAN ) ; ZEESHAN', '2', '19250596', '2019-08-01', 1),
('BZFYLTOS1DZMF55', '2RTL88CE6CZON8A48Q7H', NULL, '3432961869', 50000, 'CHQ # 19250597, CHQ Date: 2019-08-18 ( MEEZAN ) ; ZEESHAN', '2', '19250597', '2019-08-01', 1),
('X8EYG1ZQSTXWG9E', '2RTL88CE6CZON8A48Q7H', NULL, '4577491332', 50000, 'CHQ # 19250598, CHQ Date: 2019-08-25 ( MEEZAN ) ; ZEESHAN', '2', '19250598', '2019-08-01', 1),
('74ZYUYGDHNWCU4T', '2RTL88CE6CZON8A48Q7H', NULL, '4936831587', 50000, 'CHQ # 19250599, CHQ Date: 2019-08-31 ( MEEZAN ) ; ZEESHAN', '2', '19250599', '2019-08-01', 1),
('IJBE7TMHHGTVGKA', 'KVHAGIB239PCDIU1IFOL', NULL, '4454997346', 30000, 'CHQ # 19071300, CHQ Date: 2019-08-17 ( SUPPLIER CHQ ) ; NOT MENTIONED', '2', '19071300', '2019-08-08', 1),
('XLHEC7DA4MM6QKF', 'KVHAGIB239PCDIU1IFOL', NULL, '1831168799', 50000, 'CHQ # 00000043, CHQ Date: 2019-08-30 ( SUPPLIER CHQ ) ; NOT MENTIONED', '2', '00000043', '2019-08-08', 1),
('20190815063529', 'KVHAGIB239PCDIU1IFOL', '4539', NULL, 110000, '', '', '', '2019-08-08', 1),
('20190819063212', 'WH74CL4U9NF73DU6SHHP', '56', NULL, 49000, '', '', '', '2019-08-05', 1),
('20190823064543', 'IP9TWAG6VSVG6NTYP6RF', '2770', NULL, 13750, '', '', '', '2019-08-21', 1),
('W1ON595YTPP22PL', 'PN6D6ZWHZOE6GNNVVE8E', NULL, '5422454348', 30000, 'CHQ # 0000, CHQ Date: 2019-08-30 ( SUPPLIER CHQ ) ; NEW AL NOOR PAINT', '2', '0000', '2019-08-23', 1),
('20190828061534', 'Q7FR2XS4JI3PV48ANWE2', '33', NULL, 13000, '', '', '', '2019-08-23', 1),
('E3BBMH5TTO482CI', 'Q7FR2XS4JI3PV48ANWE2', NULL, '4242239532', 20000, 'CHQ # 19071307, CHQ Date: 2019-09-08 ( SUPPLIER CHQ ) ; NEW AL NOOR/SILK BANK', '2', '19071307', '2019-08-27', 1),
('EL5L6EYIZMK13QB', 'Q7FR2XS4JI3PV48ANWE2', NULL, '5149879336', 30000, 'CHQ # 00000073, CHQ Date: 2019-09-21 ( HBL ) ; ZEESHAN', '2', '00000073', '2019-08-27', 1),
('5HNR32ONVZ', '43KY3DUFCY7NQ8R3GWW7', 'Adjustment ', NULL, 0, 'Previous adjustment of IMTIAZ (titanium) with software ', 'NA', 'NA', '2019-09-04', 1),
('Q5WAOVX86O2PNX6', '43KY3DUFCY7NQ8R3GWW7', NULL, '2247146668', 50000, 'CHQ # 000000, CHQ Date: 2019-10-05 ( BANK AL FALAH ) ; ZEESHAN', '2', '000000', '2019-09-03', 1),
('GENC6A7YOE8I3RW', '43KY3DUFCY7NQ8R3GWW7', NULL, '3679683662', 50000, 'CHQ # 000000, CHQ Date: 2019-10-11 ( BANK AL FALAH ) ; ZEESHAN', '2', '000000', '2019-09-03', 1),
('GMS7C8AHCYWK9WW', '43KY3DUFCY7NQ8R3GWW7', NULL, '2844135514', 31000, 'CHQ # 000000, CHQ Date: 2019-10-16 ( BANK AL FALAH ) ; ZEESHAN', '2', '000000', '2019-09-03', 1),
('ZJCQRJ7T5CU8ANK', '43KY3DUFCY7NQ8R3GWW7', NULL, '3314991261', 250, ' CASH', '1', '', '2019-09-03', 1),
('AHCVBZAMQ8SJDG5', 'UOG71LV2MZUSTC69H2Y2', NULL, '2652923232', 7000, 'CHQ # 05585672, CHQ Date: 2019-09-04 ( SUPPLIER CHQ ) ; ', '2', '05585672', '2019-09-02', 1),
('JJ7R2G6LB6V6Y9M', 'UOG71LV2MZUSTC69H2Y2', NULL, '2317968511', 8000, ' CASH', '1', '', '2019-09-02', 1),
('20190906103658', '43KY3DUFCY7NQ8R3GWW7', '901', NULL, 0, '', '', '', '2019-09-04', 1),
('20190906104133', 'OIP8LT8QNBS1EXRILD5M', '902', NULL, 58000, '', '', '', '2019-09-04', 1),
('JG2YZMY4INERYV9', 'AU5YU8HI5RK3ME4ZRSGE', NULL, '6118759241', 5000, 'CHQ # 10823549, CHQ Date: 2019-09-10 ( SUPPLIER CHQ ) ; QADRI PAINTS', '2', '10823549', '2019-09-03', 1),
('2NS5N5SP8YTWZT4', 'AU5YU8HI5RK3ME4ZRSGE', NULL, '5198734748', 5000, ' CASH', '1', '', '2019-09-03', 1),
('WGMO5OI5K7IU7OH', 'WYU7GK7FHY1AFSA8DAHK', NULL, '3576595567', 30000, 'CHQ # 0000074, CHQ Date: 2019-09-22 ( HBL ) ; ZEESHAN', '2', '0000074', '2019-09-04', 1),
('3LXT6IFTJH1ZCSQ', 'WYU7GK7FHY1AFSA8DAHK', NULL, '3164776256', 20000, 'CHQ # 000000, CHQ Date: 2019-09-10 ( SUPPLIER CHQ ) ; SADIQ ALI/HBL', '2', '000000', '2019-09-04', 1),
('IVKXS6TN5K3TIQM', 'KVHAGIB239PCDIU1IFOL', NULL, '6225865355', 50000, 'CHQ # 00000039, CHQ Date: 2019-10-02 ( HBL ) ; ZEESHAN', '2', '00000039', '2019-09-05', 1),
('3NM95J48S2', '3FLZFNER3T3SNGUVQKQ1', 'Adjustment ', NULL, 0, 'Previous adjustment of M.KABEER/SIGN BOARD with software ', 'NA', 'NA', '2019-09-11', 1),
('SUFIO47T8CGJ5IC', '3FLZFNER3T3SNGUVQKQ1', NULL, '5167621464', 8000, ' CASH', '1', '', '2019-09-06', 1),
('20190916052618', 'KVHAGIB239PCDIU1IFOL', '9910', NULL, 88000, '', '', '', '2019-09-16', 1),
('5TD1U6RKWL4BRCE', 'OIP8LT8QNBS1EXRILD5M', NULL, '6145365899', 35000, 'CHQ # 10614560, CHQ Date: 2019-10-12 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614560', '2019-09-17', 1),
('POI3KJNNOCS2MH4', 'OIP8LT8QNBS1EXRILD5M', NULL, '9364233315', 25000, 'CHQ # 19071315, CHQ Date: 2019-09-25 ( SUPPLIER CHQ ) ; NEW AL NOOR/SILK BANK', '2', '19071315', '2019-09-17', 1),
('76ILRJOJO1AYXPY', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '4136143375', 50000, 'CHQ # 000000, CHQ Date: 2019-10-28 ( SUPPLIER CHQ ) ; M.A PAINTS/GHAGAR PHATAK', '2', '000000', '2019-10-02', 1),
('Y5YWVNEHJVQH2YC', 'UOG71LV2MZUSTC69H2Y2', NULL, '8261782282', 30000, 'CHQ # 10614564, CHQ Date: 2019-10-08 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614564', '2019-09-24', 1),
('2KABJBLAHHWLJXM', 'OIP8LT8QNBS1EXRILD5M', NULL, '5254595778', 20000, 'CHQ # 0000009, CHQ Date: 2019-10-03 ( SUPPLIER CHQ ) ; HBL', '2', '0000009', '2019-09-24', 1),
('3FKXAXP4P71TKHJ', 'OIP8LT8QNBS1EXRILD5M', NULL, '4542265832', 30000, 'CHQ # 01063677, CHQ Date: 2019-10-05 ( SUPPLIER CHQ ) ; MEEZAN', '2', '01063677', '2019-09-24', 1),
('5WHAWACITJ7P5JZ', 'HMITTMTF6JUD4XSUKFWZ', NULL, '4353525281', 30000, 'CHQ # A-25161180, CHQ Date: 2019-09-29 ( MEEZAN ) ; ZEESHAN', '2', 'A-25161180', '2019-09-19', 1),
('3JKNVGXMN4CJH1T', 'HMITTMTF6JUD4XSUKFWZ', NULL, '3378988679', 43900, 'CHQ # A-25161181, CHQ Date: 2019-09-29 ( MEEZAN ) ; ZEESHAN', '2', 'A-25161181', '2019-09-19', 1),
('5MM3JY79BHCDEPU', 'IP9TWAG6VSVG6NTYP6RF', NULL, '5899217121', 20000, ' CASH', '1', '', '2019-09-18', 1),
('1G95PUKGAQAOGQW', 'D23F97RKV572XU63L93E', NULL, '6458429579', 30000, 'CHQ # 25161177, CHQ Date: 2019-10-20 ( MEEZAN ) ; ZEESHAN', '2', '25161177', '2019-09-18', 1),
('COSM33E7BELD8PN', 'D23F97RKV572XU63L93E', NULL, '2572573154', 30000, 'CHQ # 25161178, CHQ Date: 2019-10-27 ( MEEZAN ) ; ZEESHAN', '2', '25161178', '2019-09-18', 1),
('1AJBLIAQY6H45ZQ', 'D23F97RKV572XU63L93E', NULL, '9474115914', 25000, 'CHQ # 25161179, CHQ Date: 2019-11-10 ( MEEZAN ) ; ZEESHAN', '2', '25161179', '2019-09-18', 1),
('7JCOAH5XN1', 'AT9YQ8RYRMLR7M8P4JIA', 'Adjustment ', NULL, 0, 'Previous adjustment of KINGDOM CHEMICALS with software ', 'NA', 'NA', '2019-10-03', 1),
('TMZ5LOTH7REZLUG', 'AT9YQ8RYRMLR7M8P4JIA', NULL, '1718988568', 25000, 'CHQ # 10614561, CHQ Date: 2019-10-12 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614561', '2019-09-08', 1),
('GZZVUAEDP5C3SBQ', 'AT9YQ8RYRMLR7M8P4JIA', NULL, '2728329645', 25000, 'CHQ # 10614562, CHQ Date: 2019-10-19 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614562', '2019-09-08', 1),
('20191003063215', 'Q7FR2XS4JI3PV48ANWE2', '67', NULL, 23625, '', '', '', '2019-09-23', 1),
('20191003064919', 'D23F97RKV572XU63L93E', '2632', NULL, 33375, '', '', '', '2019-09-19', 1),
('20191003065235', 'D23F97RKV572XU63L93E', '2627', NULL, 22250, '', '', '', '2019-09-18', 1),
('20191003065500', 'IP9TWAG6VSVG6NTYP6RF', '2896', NULL, 6875, '', '', '', '2019-09-23', 1),
('20191003065942', 'OIP8LT8QNBS1EXRILD5M', '00', NULL, 58000, '', '', '', '2019-09-19', 1),
('20191003071121', 'UOG71LV2MZUSTC69H2Y2', '000', NULL, 20000, '', '', '', '2019-09-20', 1),
('YSUWAHWXBMDEEVD', 'AT9YQ8RYRMLR7M8P4JIA', NULL, '3695419167', 30000, 'CHQ # 10614570, CHQ Date: 2019-11-16 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614570', '2019-10-23', 1),
('7EH8BTLMP2GSUJV', 'AT9YQ8RYRMLR7M8P4JIA', NULL, '2981834187', 30000, 'CHQ # 10614571, CHQ Date: 2019-11-16 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614571', '2019-10-23', 1),
('PIAMDLDHP2IA32V', 'AT9YQ8RYRMLR7M8P4JIA', NULL, '5587264534', 2200, ' CASH', '1', '', '2019-10-23', 1),
('TMD4E1Q3TIPK7B3', 'OIP8LT8QNBS1EXRILD5M', NULL, '2643721936', 40000, 'CHQ # 10614568, CHQ Date: 2019-10-18 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614568', '2019-10-17', 1),
('6R44B7K77JGVRU5', 'OIP8LT8QNBS1EXRILD5M', NULL, '3388287578', 40000, 'CHQ # 10614569, CHQ Date: 2019-10-24 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614569', '2019-10-17', 1),
('TKE16TYQOFALYJN', 'OIP8LT8QNBS1EXRILD5M', NULL, '3417265237', 20000, ' CASH', '1', '', '2019-10-17', 1),
('MUUHJZDN3RRL9VV', '2RTL88CE6CZON8A48Q7H', NULL, '1331567357', 50000, 'CHQ # 251611184, CHQ Date: 2019-10-28 ( MEEZAN ) ; ZEESHAN', '2', '251611184', '2019-10-21', 1),
('B4YCTQ3SNXOCTIL', '2RTL88CE6CZON8A48Q7H', NULL, '7735448188', 50000, 'CHQ # 251611185, CHQ Date: 2019-11-12 ( MEEZAN ) ; ZEESHAN', '2', '251611185', '2019-10-21', 1),
('K2M8QDNZ9QJ4CLL', '2RTL88CE6CZON8A48Q7H', NULL, '3773525788', 50000, 'CHQ # 251611186, CHQ Date: 2019-11-18 ( MEEZAN ) ; ZEESHAN', '2', '251611186', '2019-10-21', 1),
('HY6AMOHHVINP9WA', '2RTL88CE6CZON8A48Q7H', NULL, '2446625921', 50000, 'CHQ # 251611187, CHQ Date: 2019-11-24 ( MEEZAN ) ; ZEESHAN', '2', '251611187', '2019-10-21', 1),
('8HNKNZMBDL54TQL', '8EC45YB7SSBDHR45SUYQ', NULL, '9653984462', 30000, 'CHQ # 10614567, CHQ Date: 2019-10-16 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614567', '2019-10-16', 1),
('NAFCQKIP5LSLEL1', '8EC45YB7SSBDHR45SUYQ', NULL, '4212325117', 20000, ' CASH', '1', '', '2019-10-16', 1),
('P1W7U2AYP3OPSD7', 'ZZDE8VQ5MFPC9MZRNP7T', NULL, '3485536331', 30000, 'CHQ # 00000, CHQ Date: 2019-10-23 ( SUPPLIER CHQ ) ; AL MAKKAH PAINT', '2', '00000', '2019-10-14', 1),
('PDY1JLVDCB3QXTE', 'ZZDE8VQ5MFPC9MZRNP7T', NULL, '4644883431', 30000, 'CHQ # 0000000, CHQ Date: 2019-10-23 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '0000000', '2019-10-14', 1),
('BAJWO233J42KO7I', 'WYU7GK7FHY1AFSA8DAHK', NULL, '7478368957', 10000, 'CHQ # 00000, CHQ Date: 2019-10-23 ( SUPPLIER CHQ ) ; NEW AL NOOR', '2', '00000', '2019-10-14', 1),
('AWX9UOI9XULLEP9', 'Q7FR2XS4JI3PV48ANWE2', NULL, '8728821469', 20000, 'CHQ # 19999345, CHQ Date: 2019-10-30 ( SUPPLIER CHQ ) ; NEW AL NOOR', '2', '19999345', '2019-10-20', 1),
('LGA8NIXO9CPWLX8', 'Q7FR2XS4JI3PV48ANWE2', NULL, '6695958863', 8000, 'CHQ # 109314176, CHQ Date: 2019-10-30 ( SUPPLIER CHQ ) ; QADRI PAINT', '2', '109314176', '2019-10-20', 1),
('OAXY2EZ6MK1FX52', 'Q7FR2XS4JI3PV48ANWE2', NULL, '1355974696', 20000, ' CASH', '1', '', '2019-10-20', 1),
('DURU3ZRB5FJEUA2', 'D23F97RKV572XU63L93E', NULL, '5816648297', 30000, 'CHQ # 251611182, CHQ Date: 2019-10-18 ( MEEZAN ) ; ZEESHAN', '2', '251611182', '2019-10-14', 1),
('NN7YHEQNDPPGJH4', 'D23F97RKV572XU63L93E', NULL, '1692977767', 30000, 'CHQ # 251611183, CHQ Date: 2019-11-28 ( MEEZAN ) ; ZEESHAN', '2', '251611183', '2019-10-14', 1),
('D7ELIKVVPF4Y1UI', '8EM2GUI7NF8JLN7BK56L', NULL, '2687556555', 50000, 'CHQ # 16672736, CHQ Date: 2019-10-28 ( SUPPLIER CHQ ) ; EZZY PAINTS', '2', '16672736', '2019-10-11', 1),
('PEGBTWAR6SPO8E4', 'PN6D6ZWHZOE6GNNVVE8E', NULL, '4555896247', 20000, 'CHQ # 000000, CHQ Date: 2019-10-15 ( SUPPLIER CHQ ) ; NEW AL NOOR', '2', '000000', '2019-10-07', 1),
('UPPO1Z6J9RBMW5H', '73841H2DMU823SWSFEI3', NULL, '1314555191', 15000, 'CHQ # 11397783, CHQ Date: 2019-10-23 ( SUPPLIER CHQ ) ; ///////////', '2', '11397783', '2019-10-21', 1),
('G41KUSHUT69ZGG7', '73841H2DMU823SWSFEI3', NULL, '8363227786', 10000, ' CASH', '1', '', '2019-10-21', 1),
('20191023113229', 'OIP8LT8QNBS1EXRILD5M', '000', NULL, 100000, '', '', '', '2019-10-19', 1),
('20191023113512', 'D23F97RKV572XU63L93E', '2770', NULL, 55625, '', '', '', '2019-10-17', 1),
('20191023113934', 'PN6D6ZWHZOE6GNNVVE8E', '607', NULL, 54000, '', '', '', '2019-10-18', 1),
('20191023114148', 'IP9TWAG6VSVG6NTYP6RF', '000', NULL, 13750, '', '', '', '2019-10-16', 1),
('20191023114545', 'ZZDE8VQ5MFPC9MZRNP7T', '2811', NULL, 52500, '', '', '', '2019-10-19', 1),
('20191025114107', 'Q7FR2XS4JI3PV48ANWE2', '02', NULL, 32600, '', '', '', '2019-10-14', 1),
('20191025114358', 'Q7FR2XS4JI3PV48ANWE2', '68', NULL, 10625, '', '', '', '2019-10-22', 1),
('Q2GNLO8E4SYXGK8', '8EC45YB7SSBDHR45SUYQ', NULL, '1613869576', 47700, 'CHQ # 10614572, CHQ Date: 2019-11-10 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614572', '2019-10-25', 1),
('OHAMLS4OMHTHPZE', '8EC45YB7SSBDHR45SUYQ', NULL, '4795492693', 47700, 'CHQ # 10614573, CHQ Date: 2019-11-17 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614573', '2019-10-25', 1),
('W6TCADSHODYT68U', '8EC45YB7SSBDHR45SUYQ', NULL, '9173884733', 47700, 'CHQ # 10614574, CHQ Date: 2019-11-20 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614574', '2019-10-25', 1),
('WVQQ4912E179OQA', '8EC45YB7SSBDHR45SUYQ', NULL, '3299154749', 47700, 'CHQ # 10614575, CHQ Date: 2019-11-26 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614575', '2019-10-25', 1),
('NPDFWWHD6UBZOF2', '8EC45YB7SSBDHR45SUYQ', NULL, '1981133761', 47700, 'CHQ # 10614576, CHQ Date: 2019-11-30 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614576', '2019-10-25', 1),
('DTTKQBBGR9X2ZCU', '2RTL88CE6CZON8A48Q7H', NULL, '1176984652', 25000, ' CASH', '1', '', '2019-10-25', 1),
('20191113105725', 'Q7FR2XS4JI3PV48ANWE2', '27', NULL, 22000, '', '', '', '2019-11-11', 1),
('20191113110108', '2RTL88CE6CZON8A48Q7H', '911', NULL, 105450, '', '', '', '2019-11-08', 1),
('20191113111002', 'GPL2UPO3UP5JPQ1M6DBX', '63864', NULL, 118750, '', '', '', '2019-11-11', 1),
('20191113112019', 'PN6D6ZWHZOE6GNNVVE8E', '0371', NULL, 43000, '', '', '', '2019-10-29', 1),
('20191113112617', 'OIP8LT8QNBS1EXRILD5M', '907', NULL, 58000, '', '', '', '2019-11-04', 1),
('KWPRVJW7A6O7ZTD', '2RTL88CE6CZON8A48Q7H', NULL, '4935271197', 50000, 'CHQ # 00000077, CHQ Date: 2019-12-23 ( HBL ) ; ZEESHAN', '2', '', '2019-11-13', 1),
('6HW675WVSW9XSSD', '2RTL88CE6CZON8A48Q7H', NULL, '9299422915', 50000, 'CHQ # 00000076, CHQ Date: 2019-12-15 ( HBL ) ; ZEESHAN', '2', '', '2019-11-13', 1),
('N5VVFBPTSC4N2QE', '2RTL88CE6CZON8A48Q7H', NULL, '2945846583', 50000, 'CHQ # 00000075, CHQ Date: 2019-12-10 ( HBL ) ; ZEESHAN', '2', '', '2019-11-13', 1),
('TJSCZUTQOSY9QDO', '2RTL88CE6CZON8A48Q7H', NULL, '7694272424', 50000, 'CHQ # 2429623690, CHQ Date: 2019-12-30 ( SUPPLIER CHQ ) ; ALLIED BANK/MASHALLAH PAINT/GULSHAN E HADID', '2', '2429623690', '2019-11-13', 1),
('WL4CLAZ2VDUB8BZ', 'KVHAGIB239PCDIU1IFOL', NULL, '2723774454', 80000, 'CHQ # 000000, CHQ Date: 2019-11-12 ( SUPPLIER CHQ ) ; SUBHAN A PAINT', '2', '000000', '2019-10-28', 1),
('77WTNIXCVWL43IT', '8EC45YB7SSBDHR45SUYQ', NULL, '5417947216', 50000, 'CHQ # 10614578, CHQ Date: 2019-10-29 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10614578', '2019-10-29', 1),
('ES9DML8J4X2Z8HH', 'PN6D6ZWHZOE6GNNVVE8E', NULL, '7586325948', 20000, 'CHQ # 29623703, CHQ Date: 2019-11-08 ( SUPPLIER CHQ ) ; NEW MASHALLAH PAINT/GULSHAN E HADID', '2', '29623703', '2019-11-09', 1),
('YE57ZSREHWA2AWT', 'UOG71LV2MZUSTC69H2Y2', NULL, '2443524292', 20000, 'CHQ # 19999355, CHQ Date: 2019-11-20 ( SUPPLIER CHQ ) ; NEW AL NOOR', '2', '19999355', '2019-11-12', 1),
('OUK2986DTO', 'ZSPRL6NCIQHI9SCRYKDH', 'Adjustment ', NULL, 0, 'Previous adjustment of RAHEEL/PARAMOUNT CHALK with software ', 'NA', 'NA', '2019-11-13', 1);
INSERT INTO `supplier_ledger` (`transaction_id`, `supplier_id`, `chalan_no`, `deposit_no`, `amount`, `description`, `payment_type`, `cheque_no`, `date`, `status`) VALUES
('U88TWFMQ8PUSWX2', 'ZSPRL6NCIQHI9SCRYKDH', NULL, '1554937457', 39000, 'CHQ # 25161188, CHQ Date: 2019-11-13 ( MEEZAN ) ; ZEESHAN', '2', '25161188', '2019-10-28', 1),
('E6DTIRGBLID57YB', 'ZSPRL6NCIQHI9SCRYKDH', NULL, '1852842877', 10000, ' CASH', '1', '', '2019-10-28', 1),
('X3GFZ6NX5W6OZ3N', '43KY3DUFCY7NQ8R3GWW7', NULL, '8145384433', 36000, 'CHQ # 36535223, CHQ Date: 2019-12-14 ( BANK AL FALAH ) ; ZEESHAN', '2', '36535223', '2019-10-30', 1),
('CGV2ZV58LRYD9OP', '43KY3DUFCY7NQ8R3GWW7', NULL, '4494917812', 36000, 'CHQ # 36535222, CHQ Date: 2019-12-10 ( BANK AL FALAH ) ; ZEESHAN', '2', '36535222', '2019-10-30', 1),
('ISGRQMOHJ41TV7N', '43KY3DUFCY7NQ8R3GWW7', NULL, '9916666193', 36000, 'CHQ # 36535221, CHQ Date: 2019-11-29 ( BANK AL FALAH ) ; ZEESHAN', '2', '36535221', '2019-10-30', 1),
('39H79WDPYHMBB6Z', 'OIP8LT8QNBS1EXRILD5M', NULL, '2745549271', 64000, ' CASH', '1', '', '2019-11-01', 1),
('1AYPQVH9WJQMB7P', '38G8VAYQUTANT6T7P6NK', NULL, '9975895755', 50000, 'CHQ # 25161191, CHQ Date: 2019-11-22 ( MEEZAN ) ; ZEESHAN', '2', '25161191', '2019-11-05', 1),
('9J2BXHBRC6BPJAM', '38G8VAYQUTANT6T7P6NK', NULL, '3292375516', 20000, 'CHQ # 19999348, CHQ Date: 2019-11-16 ( SUPPLIER CHQ ) ; SILK BANK/NEW AL NOOR', '2', '19999348', '2019-11-05', 1),
('E6EKA5DQHZHAJYK', '38G8VAYQUTANT6T7P6NK', NULL, '3577215635', 10000, ' CASH', '1', '', '2019-11-05', 1),
('20191113135849', 'AT9YQ8RYRMLR7M8P4JIA', '1225', NULL, 25500, '', '', '', '2019-10-28', 1),
('20191113141140', '43KY3DUFCY7NQ8R3GWW7', '904', NULL, 105000, '', '', '', '2019-10-30', 1),
('WAUN9K6RDIEKVDD', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '7229652254', 30000, 'CHQ # 10973896, CHQ Date: 2019-11-20 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10973896', '2019-11-11', 1),
('INVKIS6Y5TEWZZT', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '8727255478', 80000, 'CHQ # 23540876, CHQ Date: 2019-11-20 ( SUPPLIER CHQ ) ; .....', '2', '23540876', '2019-11-11', 1),
('T8LUY6HNGK1N12X', 'OIP8LT8QNBS1EXRILD5M', NULL, '3435949928', 40000, 'CHQ # 00000078, CHQ Date: 2019-11-22 ( HBL ) ; ZEESHAN', '2', '00000078', '2019-11-18', 1),
('5BK2RVP4AK2J7R7', 'OIP8LT8QNBS1EXRILD5M', NULL, '8968381497', 40000, 'CHQ # 25161193, CHQ Date: 2019-11-28 ( MEEZAN ) ; ZEESHAN', '2', '25161193', '2019-11-18', 1),
('ZR1JON663E9XB4Z', 'OIP8LT8QNBS1EXRILD5M', NULL, '5328112597', 30000, 'CHQ # 10994017, CHQ Date: 2019-11-30 ( SUPPLIER CHQ ) ; (BAH) KORANGI BISMILLAH PAINT', '2', '10994017', '2019-11-18', 1),
('ZZOOM9KR8BNQQYZ', 'OIP8LT8QNBS1EXRILD5M', NULL, '9695647448', 30000, ' CASH', '1', '', '2019-11-18', 1),
('20191119110530', 'IP9TWAG6VSVG6NTYP6RF', '2954', NULL, 13750, '', '', '', '2019-11-14', 1),
('20191119110923', 'OIP8LT8QNBS1EXRILD5M', '916', NULL, 58000, '', '', '', '2019-11-14', 1),
('1L1V3EI9SIBGV2B', 'HMITTMTF6JUD4XSUKFWZ', NULL, '9763291218', 25000, 'CHQ # 25161196, CHQ Date: 2019-11-28 ( MEEZAN ) ; ZEESHAN', '2', '25161196', '2019-11-21', 1),
('9DTWC848MMC1YJE', 'HMITTMTF6JUD4XSUKFWZ', NULL, '9372458347', 25000, 'CHQ # 25161197, CHQ Date: 2019-12-13 ( MEEZAN ) ; ZEESHAN', '2', '25161197', '2019-11-21', 1),
('ZJ2YAECSO3G35M2', 'HMITTMTF6JUD4XSUKFWZ', NULL, '5555352897', 24000, 'CHQ # 25161198, CHQ Date: 2019-12-16 ( MEEZAN ) ; ZEESHAN', '2', '25161198', '2019-11-21', 1),
('VWNYZ8LEW5BQTI7', 'ZSPRL6NCIQHI9SCRYKDH', NULL, '5777975385', 20000, 'CHQ # 10713586, CHQ Date: 2019-11-30 ( SUPPLIER CHQ ) ; GOSIA PAINT', '2', '10713586', '2019-11-23', 1),
('T4WQ8JG24BKWQ4E', 'ZSPRL6NCIQHI9SCRYKDH', NULL, '2316779325', 10000, 'CHQ # 11441411, CHQ Date: 2019-12-05 ( SUPPLIER CHQ ) ; BITHAI PAINT', '2', '11441411', '2019-11-23', 1),
('20191126064630', 'ZSPRL6NCIQHI9SCRYKDH', '84', NULL, 69000, '', '', '', '2019-09-20', 1),
('20191126070423', 'ZSPRL6NCIQHI9SCRYKDH', '51', NULL, 12500, '', '', '', '2019-11-05', 1),
('20191126070744', 'ZSPRL6NCIQHI9SCRYKDH', '67', NULL, 79000, '', '', '', '2019-11-07', 1),
('S45I8V5NQ8FDAV9', 'Q7FR2XS4JI3PV48ANWE2', NULL, '1133992527', 29000, 'CHQ # 41469232, CHQ Date: 2019-11-25 ( SUPPLIER CHQ ) ; ASIF CASH SALE', '2', '41469232', '2019-11-25', 1),
('87WCN7KSWL79HYT', 'Q7FR2XS4JI3PV48ANWE2', NULL, '3316119516', 25000, 'CHQ # 25161199, CHQ Date: 2019-11-25 ( MEEZAN ) ; ZEESHAN', '2', '25161199', '2019-11-25', 1),
('20191127062946', 'ZSPRL6NCIQHI9SCRYKDH', '05', NULL, 82000, '', '', '', '2019-11-26', 1),
('3BK63DI1RNANR98', 'ZZDE8VQ5MFPC9MZRNP7T', NULL, '8665165265', 25000, 'CHQ # 25161200, CHQ Date: 2019-11-29 ( MEEZAN ) ; ZEESHAN', '2', '25161200', '2019-11-27', 1),
('7VFQJFCTIA29ASN', 'ZZDE8VQ5MFPC9MZRNP7T', NULL, '2967297891', 25000, 'CHQ # 25161201, CHQ Date: 2019-11-29 ( MEEZAN ) ; ZEESHAN', '2', '25161201', '2019-11-27', 1),
('X99UX1XEMDEBYLR', 'OIP8LT8QNBS1EXRILD5M', NULL, '9416727477', 32000, 'CHQ # 00000079, CHQ Date: 2019-12-05 ( HBL ) ; ZEESHAN', '2', '00000079', '2019-11-28', 1),
('ST5NE1A32UPCRTV', 'OIP8LT8QNBS1EXRILD5M', NULL, '8221898239', 32000, ' CASH', '1', '', '2019-11-28', 1),
('20191129115946', 'OIP8LT8QNBS1EXRILD5M', '925', NULL, 58000, '', '', '', '2019-11-29', 1),
('20191204060144', 'Q7FR2XS4JI3PV48ANWE2', '49', NULL, 22000, '', '', '', '2019-11-30', 1),
('20191216061342', 'IP9TWAG6VSVG6NTYP6RF', '40', NULL, 13750, '', '', '', '2019-12-14', 1),
('20191216071117', 'HMITTMTF6JUD4XSUKFWZ', '054', NULL, 5000, '', '', '', '2019-04-08', 1),
('20191216071842', 'HMITTMTF6JUD4XSUKFWZ', '090', NULL, 84580, '', '', '', '2019-04-17', 1),
('20191216073931', 'HMITTMTF6JUD4XSUKFWZ', '020', NULL, 65110, '', '', '', '2019-06-21', 1),
('20191216074502', 'HMITTMTF6JUD4XSUKFWZ', '047', NULL, 64680, '', '', '', '2019-07-03', 1),
('20191216075517', 'HMITTMTF6JUD4XSUKFWZ', '061', NULL, 76260, '', '', '', '2019-07-06', 1),
('XK7NU6TS3REYG7R', '8EC45YB7SSBDHR45SUYQ', NULL, '5781958678', 116500, 'CHQ # 47463846, CHQ Date: 2019-12-25 ( SUPPLIER CHQ ) ; KARACHI PAINT(SHAHID BHAI)', '2', '47463846', '2019-12-16', 1),
('F3OJU554XAVV5IT', '8EC45YB7SSBDHR45SUYQ', NULL, '5395789653', 50000, 'CHQ # 25161202, CHQ Date: 2020-01-15 ( MEEZAN ) ; ZEESHAN', '2', '25161202', '2019-12-16', 1),
('IU11DITYSNU5N7X', '8EC45YB7SSBDHR45SUYQ', NULL, '5583238127', 50000, 'CHQ # 25161203, CHQ Date: 2020-01-22 ( MEEZAN ) ; ZEESHAN', '2', '25161203', '2019-12-16', 1),
('MHGJ9KUA7367Q8V', '2RTL88CE6CZON8A48Q7H', NULL, '5473836684', 45000, 'CHQ # 25161204, CHQ Date: 2020-01-10 ( MEEZAN ) ; ZEESHAN', '2', '25161204', '2019-12-17', 1),
('GIYF62TAQWAH2RP', '2RTL88CE6CZON8A48Q7H', NULL, '6561774577', 45000, 'CHQ # 25161205, CHQ Date: 2020-01-20 ( MEEZAN ) ; ZEESHAN', '2', '25161205', '2019-12-17', 1),
('HN6DT5YLQ8ZY7IF', '2RTL88CE6CZON8A48Q7H', NULL, '6831142962', 45000, 'CHQ # 25161206, CHQ Date: 2020-01-25 ( MEEZAN ) ; ZEESHAN', '2', '25161206', '2019-12-17', 1),
('IBS1HYXV7JXMX1O', '2RTL88CE6CZON8A48Q7H', NULL, '4537892624', 45000, 'CHQ # 25161207, CHQ Date: 2020-01-31 ( MEEZAN ) ; ZEESHAN', '2', '25161207', '2019-12-17', 1),
('5HOKK16XT1PCOQC', '2RTL88CE6CZON8A48Q7H', NULL, '6691922488', 20000, 'CHQ # 19999367, CHQ Date: 2020-01-31 ( SUPPLIER CHQ ) ; NEW AL NOOR/SILK BANK', '2', '19999367', '2019-12-17', 1),
('20191217082527', 'HMITTMTF6JUD4XSUKFWZ', '057', NULL, 50000, '', '', '', '2019-11-21', 1),
('20191218061354', 'HMITTMTF6JUD4XSUKFWZ', '068', NULL, 55420, '', '', '', '2019-10-25', 1),
('P9QQLKKYTGH9E5W', 'PN6D6ZWHZOE6GNNVVE8E', NULL, '8611319173', 12500, 'CHQ # 23540897, CHQ Date: 2019-12-28 ( SUPPLIER CHQ ) ; ABBASI/AHSANABAD/DUBAI ISLAMIC BANK', '2', '23540897', '2019-12-18', 1),
('XIPSVE7OOW2DP3I', 'PN6D6ZWHZOE6GNNVVE8E', NULL, '4352637199', 20000, 'CHQ # 10994058, CHQ Date: 2019-12-30 ( SUPPLIER CHQ ) ; KORANGI B.S.M/BAHL', '2', '10994058', '2019-12-18', 1),
('20191218064929', 'HMITTMTF6JUD4XSUKFWZ', '037', NULL, 52460, '', '', '', '2019-12-13', 1),
('20191218124419', 'Q7FR2XS4JI3PV48ANWE2', '68', NULL, 10625, '', '', '', '2019-12-18', 1),
('20191218125321', '38G8VAYQUTANT6T7P6NK', '18', NULL, 42125, '', '', '', '2019-12-18', 1),
('WN1JY3GWJ1U7ZLI', 'OIP8LT8QNBS1EXRILD5M', NULL, '5777743872', 35000, 'CHQ # 25161208, CHQ Date: 2019-12-23 ( MEEZAN ) ; ZEESHAN', '2', '25161208', '2019-12-20', 1),
('TO3ADWSNA25KU4Z', 'OIP8LT8QNBS1EXRILD5M', NULL, '4637158428', 35000, 'CHQ # 25161209, CHQ Date: 2019-12-27 ( MEEZAN ) ; ZEESHAN', '2', '25161209', '2019-12-20', 1),
('ZNTDJXB5G9SHHWU', 'Q849P2OLCS1QYZVYV1K7', NULL, '4226412249', 12000, 'CHQ # 00000784, CHQ Date: 2019-12-28 ( SUPPLIER CHQ ) ; OSAMA\'S FRIEND', '2', '00000784', '2019-12-20', 1),
('JJHMHFB1M1DKQFP', 'Q849P2OLCS1QYZVYV1K7', NULL, '9997895667', 12000, 'CHQ # 00000787, CHQ Date: 2020-01-10 ( SUPPLIER CHQ ) ; OSAMA\'S FRIEND', '2', '00000787', '2019-12-20', 1),
('20191230081915', 'D23F97RKV572XU63L93E', '3151', NULL, 55625, '', '', '', '2019-12-28', 1),
('20191230082138', 'OIP8LT8QNBS1EXRILD5M', '937', NULL, 58000, '', '', '', '2019-12-24', 1),
('REKV8LNPRZ54Z1C', 'D23F97RKV572XU63L93E', NULL, '1291866346', 30000, 'CHQ # 00000081, CHQ Date: 2020-01-18 ( HBL ) ; ZEESHAN', '2', '00000081', '2019-12-26', 1),
('F2U5K9B5325IMDQ', 'D23F97RKV572XU63L93E', NULL, '3776319814', 30000, 'CHQ # 00000082, CHQ Date: 2020-01-25 ( HBL ) ; ZEESHAN', '2', '00000082', '2019-12-26', 1),
('8HHVGRDAYVOMSBY', 'D23F97RKV572XU63L93E', NULL, '2533833639', 25000, 'CHQ # 00000083, CHQ Date: 2020-01-31 ( HBL ) ; ZEESHAN', '2', '00000083', '2019-12-26', 1),
('TBHISIBBF4IMTNG', 'IP9TWAG6VSVG6NTYP6RF', NULL, '4952858511', 25000, 'CHQ # 000000, CHQ Date: 2019-12-31 ( SUPPLIER CHQ ) ; NEW AL NOOR/SILK BANK', '2', '000000', '2019-12-24', 1),
('3E9P64NUU1WNO79', '73841H2DMU823SWSFEI3', NULL, '6522597197', 10000, 'CHQ # 28509250, CHQ Date: 2020-01-08 ( SUPPLIER CHQ ) ; KORANGI B.S.M/MEEZAN', '2', '28509250', '2019-12-26', 1),
('4QIIJGM3CKNC4EJ', '73841H2DMU823SWSFEI3', NULL, '5925776735', 5000, 'CHQ # 000000, CHQ Date: 2019-12-28 ( SUPPLIER CHQ ) ; QADRI PAINT/BANK AL HABIB', '2', '000000', '2019-12-26', 1),
('6U7AWM2SSE1ZM3L', 'ZZDE8VQ5MFPC9MZRNP7T', NULL, '2584219894', 12500, 'CHQ # 23540896, CHQ Date: 2019-12-30 ( SUPPLIER CHQ ) ; ABBASI PAINT', '2', '23540896', '2019-12-24', 1),
('EJQIQONIYP6CRFV', 'ZZDE8VQ5MFPC9MZRNP7T', NULL, '2375262966', 10000, 'CHQ # 242963724, CHQ Date: 2019-12-30 ( SUPPLIER CHQ ) ; M.A PAINT/GULSHAN E HADID/ALLIED BANK', '2', '242963724', '2019-12-24', 1),
('A6SHYMQZGZTQ9TS', 'ZZDE8VQ5MFPC9MZRNP7T', NULL, '5828147971', 12000, 'CHQ # 00000786, CHQ Date: 2019-12-30 ( SUPPLIER CHQ ) ; OSAMA\'S FRIEND/HBL', '2', '00000786', '2019-12-24', 1),
('VRTQKWKPN2UEHU8', 'ZZDE8VQ5MFPC9MZRNP7T', NULL, '6722169888', 500, ' CASH', '1', '', '2019-12-24', 1),
('W7EQGGP695G4H9O', 'ZSPRL6NCIQHI9SCRYKDH', NULL, '8894997417', 30000, 'CHQ # 25161211, CHQ Date: 2020-01-12 ( MEEZAN ) ; ZEESHAN', '2', '25161211', '2019-12-30', 1),
('A5HAIIJ5XU4V4KZ', 'ZSPRL6NCIQHI9SCRYKDH', NULL, '7821753892', 20000, ' CASH', '1', '', '2019-12-30', 1),
('20200106062636', 'Q7FR2XS4JI3PV48ANWE2', '83', NULL, 22000, '', '', '', '2020-01-02', 1),
('20200108055154', 'ZSPRL6NCIQHI9SCRYKDH', '59', NULL, 77000, '', '', '', '2020-01-07', 1),
('20200108055442', 'OIP8LT8QNBS1EXRILD5M', '941', NULL, 42000, '', '', '', '2020-01-07', 1),
('1WHEZV9ERCX26QD', '2RTL88CE6CZON8A48Q7H', NULL, '1393263478', 30000, 'CHQ # 42847009, CHQ Date: 2020-01-25 ( SUPPLIER CHQ ) ; S.A PAINT/J.S BANK', '2', '42847009', '2020-01-10', 1),
('HQL9FNTECKRDD66', '2RTL88CE6CZON8A48Q7H', NULL, '4667818112', 30000, 'CHQ # 25342837, CHQ Date: 2020-01-18 ( SUPPLIER CHQ ) ; AL HAMMAD/LABOUR SQUARE/MEEZAN', '2', '25342837', '2020-01-10', 1),
('ETNG6MFF758TCHH', '2RTL88CE6CZON8A48Q7H', NULL, '9539731117', 50000, 'CHQ # 25161212, CHQ Date: 2020-02-15 ( MEEZAN ) ; ZEESHAN', '2', '25161212', '2020-01-10', 1),
('QBR1SF54FOEYUS1', '2RTL88CE6CZON8A48Q7H', NULL, '5524617641', 50000, 'CHQ # 25161213, CHQ Date: 2020-02-22 ( MEEZAN ) ; ZEESHAN', '2', '25161213', '2020-01-10', 1),
('93TH26G2BCB8CDH', '2RTL88CE6CZON8A48Q7H', NULL, '3823895935', 50000, 'CHQ # 25161214, CHQ Date: 2020-02-29 ( MEEZAN ) ; ZEESHAN', '2', '25161214', '2020-01-10', 1),
('KQVXBVND15BZX6A', 'Q7FR2XS4JI3PV48ANWE2', NULL, '6768714926', 30000, 'CHQ # 25161215, CHQ Date: 2020-01-26 ( MEEZAN ) ; ZEESHAN', '2', '25161215', '2020-01-13', 1),
('FH4P2ESWVC94DOM', 'Q7FR2XS4JI3PV48ANWE2', NULL, '5654612347', 30000, 'CHQ # 25161216, CHQ Date: 2020-01-23 ( MEEZAN ) ; ZEESHAN', '2', '25161216', '2020-01-13', 1),
('20200114061307', 'HMITTMTF6JUD4XSUKFWZ', '020', NULL, 59180, '', '', '', '2020-01-13', 1),
('GSTVZ9PZM12HZL4', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '7734745662', 25000, 'CHQ # 1746271248, CHQ Date: 2020-01-20 ( SUPPLIER CHQ ) ; FAKHRI PAINT', '2', '1746271248', '2020-01-13', 1),
('MKCIIYG3UWWE8M5', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '4799449475', 20000, 'CHQ # 00059908, CHQ Date: 2020-02-25 ( SUPPLIER CHQ ) ; BABA PAINT', '2', '00059908', '2020-01-13', 1),
('20200114062523', '2RTL88CE6CZON8A48Q7H', '942', NULL, 140600, '', '', '', '2020-01-09', 1),
('20200114062801', 'IP9TWAG6VSVG6NTYP6RF', '73', NULL, 13750, '', '', '', '2020-01-13', 1),
('20200114063520', '445UCO1K5GSE7I98STAM', '991', NULL, 8250, '', '', '', '2020-01-13', 1),
('HZQAJNWWMMZ67RE', 'OIP8LT8QNBS1EXRILD5M', NULL, '9111523977', 50000, 'CHQ # 19999372, CHQ Date: 2020-01-20 ( SUPPLIER CHQ ) ; NOT MENTION', '2', '19999372', '2020-01-06', 1),
('KSEAZKME4Y4R7IS', '8EC45YB7SSBDHR45SUYQ', NULL, '5436494697', 25900, 'CHQ # 10713588, CHQ Date: 2019-12-31 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10713588', '2019-12-23', 1),
('W9ZV69FXBE4YLZW', '8EC45YB7SSBDHR45SUYQ', NULL, '5522994853', 20000, 'CHQ # 10713589, CHQ Date: 2020-01-07 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10713589', '2019-12-23', 1),
('DBG7S28R8X8WJZG', '8EC45YB7SSBDHR45SUYQ', NULL, '1156231685', 50000, 'CHQ # 25161210, CHQ Date: 2020-01-25 ( MEEZAN ) ; ZEESHAN', '2', '25161210', '2019-12-23', 1),
('VFRYTNPTPZLVIPQ', '8EC45YB7SSBDHR45SUYQ', NULL, '7452468317', 4100, ' CASH', '1', '', '2019-12-23', 1),
('6QO4O6AWI4MAK4Y', 'OIP8LT8QNBS1EXRILD5M', NULL, '3459228358', 25000, 'CHQ # 10557207, CHQ Date: 2020-01-27 ( SUPPLIER CHQ ) ; MUFFADIL PAINT/BOHRA PEER', '2', '10557207', '2020-01-17', 1),
('F2SXKVDJNBTFBLB', 'OIP8LT8QNBS1EXRILD5M', NULL, '4787316656', 15000, 'CHQ # 1754925432, CHQ Date: 2020-01-26 ( SUPPLIER CHQ ) ; NEW MAKKAH PAINT/MODEL COLONY', '2', '1754925432', '2020-01-17', 1),
('GYIB1BXPXK', '2BG6T26IG9TYKSLKLMWL', 'Adjustment ', NULL, 0, 'Previous adjustment of tabraiz with software ', 'NA', 'NA', '2020-01-21', 1),
('20200121191450', '2BG6T26IG9TYKSLKLMWL', '123', NULL, 0, '', '', '', '2020-01-21', 1),
('20200121191527', '2BG6T26IG9TYKSLKLMWL', '124', NULL, 0, '', '', '', '2020-01-21', 1),
('20200121192437', '2BG6T26IG9TYKSLKLMWL', '1122', NULL, 0, 'something', '', '', '2020-01-21', 1),
('20200121192715', '2BG6T26IG9TYKSLKLMWL', '12', NULL, 0, 'something2', '', '', '2020-01-21', 1),
('20200309074242', '38G8VAYQUTANT6T7P6NK', '82', NULL, 44500, '', '', '', '2020-03-02', 1),
('2L1HY8ZH5IFG7EM', 'KVHAGIB239PCDIU1IFOL', NULL, '1274488416', 20000, 'CHQ # 19999377, CHQ Date: 2020-01-23 ( SUPPLIER CHQ ) ; NEW AL NOOR PAINT', '2', '19999377', '2020-01-14', 1),
('12TJZKP4EO39WP7', 'KVHAGIB239PCDIU1IFOL', NULL, '9337769829', 39500, ' CASH', '1', '', '2020-01-14', 1),
('Z6DPZAFDAAAIC61', 'OIP8LT8QNBS1EXRILD5M', NULL, '9435472153', 25000, 'CHQ # 0000000115, CHQ Date: 2020-01-24 ( SUPPLIER CHQ ) ; SHADE CARD/PAINT MASTER', '2', '0000000115', '2020-01-22', 1),
('KEHDDYEPWAZD51A', 'OIP8LT8QNBS1EXRILD5M', NULL, '7274186411', 40000, ' CASH', '1', '', '2020-01-22', 1),
('1QRBEW6RR8Z51TA', 'IP9TWAG6VSVG6NTYP6RF', NULL, '7273276833', 25000, 'CHQ # 19999378, CHQ Date: 2020-02-01 ( SUPPLIER CHQ ) ; NEW AL NOOR PAINT/SILK BANK', '2', '19999378', '2020-01-23', 1),
('20200127055101', 'OIP8LT8QNBS1EXRILD5M', '950', NULL, 58000, '', '', '', '2020-01-24', 1),
('3S86YCZPYVL456J', 'UOG71LV2MZUSTC69H2Y2', NULL, '3868664491', 25000, 'CHQ # 10557215, CHQ Date: 2020-01-30 ( SUPPLIER CHQ ) ; BANK AL HABIB/MUFFADIL PAINTS', '2', '10557215', '2020-01-25', 1),
('AHCAF76JQ33LJ89', 'UOG71LV2MZUSTC69H2Y2', NULL, '8311881572', 15000, ' CASH', '1', '', '2020-01-25', 1),
('R55L9HELRN9IELX', '8EM2GUI7NF8JLN7BK56L', NULL, '9597491536', 34500, 'CHQ # 000000, CHQ Date: 2020-01-27 ( HBL ) ; ZEESHAN', '2', '000000', '2020-01-25', 1),
('65PE2FCTWB4499I', '8EM2GUI7NF8JLN7BK56L', NULL, '3764883565', 34500, 'CHQ # 000000, CHQ Date: 2020-01-31 ( HBL ) ; ZEESHAN', '2', '000000', '2020-01-25', 1),
('MAAHIPN2A5TJ4TZ', '8EM2GUI7NF8JLN7BK56L', NULL, '4955726459', 34500, 'CHQ # 000000, CHQ Date: 2020-02-14 ( HBL ) ; ZEESHAN', '2', '000000', '2020-01-25', 1),
('VIDAYBDMXW2TQRA', '8EM2GUI7NF8JLN7BK56L', NULL, '7938833539', 75000, 'CHQ # 000000, CHQ Date: 2020-02-14 ( SUPPLIER CHQ ) ; FOJI PAINT/KUNKOT', '2', '000000', '2020-01-25', 1),
('M5MKDRS3NVPI1NI', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '6836313234', 50000, 'CHQ # 12367149, CHQ Date: 2020-02-15 ( SUPPLIER CHQ ) ; ANAS(OSAMA\'S BROTHER)', '2', '12367149', '2020-01-29', 1),
('TW3FYAI5AGBMZ57', '73841H2DMU823SWSFEI3', NULL, '6375727315', 14000, 'CHQ # 0000000, CHQ Date: 2020-01-29 ( SUPPLIER CHQ ) ; S.A PAINTS/BOHRAPEER', '2', '0000000', '2020-01-29', 1),
('AQYYX9WTGETBIGY', '73841H2DMU823SWSFEI3', NULL, '1496492184', 11000, ' CASH', '1', '', '2020-01-29', 1),
('BQG6RE9N5EXBOWD', 'HMITTMTF6JUD4XSUKFWZ', NULL, '6282411643', 30000, 'CHQ # 25161218, CHQ Date: 2020-02-15 ( MEEZAN ) ; ZEESHAN', '2', '25161218', '2020-02-03', 1),
('DVCP75CID63255R', 'HMITTMTF6JUD4XSUKFWZ', NULL, '8598581439', 30000, 'CHQ # 25161219, CHQ Date: 2020-02-27 ( MEEZAN ) ; ZEESHAN', '2', '25161219', '2020-02-03', 1),
('TEBF8Y2SND8BNSY', 'HMITTMTF6JUD4XSUKFWZ', NULL, '4798983111', 30000, 'CHQ # 25161220, CHQ Date: 2020-03-12 ( MEEZAN ) ; ZEESHAN', '2', '25161220', '2020-02-03', 1),
('FCYKO6WR71VJO5L', '8EC45YB7SSBDHR45SUYQ', NULL, '9817769671', 48000, 'CHQ # 00000094, CHQ Date: 2020-02-17 ( HBL ) ; ZEESHAN', '2', '00000094', '2020-02-04', 1),
('IOFDVEC1HEHLE4E', '8EC45YB7SSBDHR45SUYQ', NULL, '1488728623', 48000, 'CHQ # 00000095, CHQ Date: 2020-02-24 ( HBL ) ; ZEESHAN', '2', '00000095', '2020-02-04', 1),
('69RBTK5BIOH2QTV', '8EC45YB7SSBDHR45SUYQ', NULL, '9589424419', 48000, 'CHQ # 00000096, CHQ Date: 2020-03-08 ( HBL ) ; ZEESHAN', '2', '00000096', '2020-02-04', 1),
('6SQZ7UVW516YDRK', '8EC45YB7SSBDHR45SUYQ', NULL, '5868975791', 48000, 'CHQ # 00000097, CHQ Date: 2020-03-15 ( HBL ) ; ZEESHAN', '2', '00000097', '2020-02-04', 1),
('7LR5QRCVGMLIV4B', '8EC45YB7SSBDHR45SUYQ', NULL, '3672898523', 50000, 'CHQ # 5492674, CHQ Date: 2020-03-05 ( SUPPLIER CHQ ) ; RAO JAVEED/SANGHAR/UBL', '2', '5492674', '2020-02-04', 1),
('4KRC1K7YDGRLGZI', '8EC45YB7SSBDHR45SUYQ', NULL, '9765418955', 50000, 'CHQ # 25161221, CHQ Date: 2020-03-14 ( MEEZAN ) ; ZEESHAN', '2', '25161221', '2020-02-07', 1),
('XCQ8KMHEZRV6NNR', '8EC45YB7SSBDHR45SUYQ', NULL, '8926451229', 50000, 'CHQ # 25161222, CHQ Date: 2020-03-24 ( MEEZAN ) ; ZEESHAN', '2', '25161222', '2020-02-07', 1),
('5EN8ZEDA8AUAYEX', '8EC45YB7SSBDHR45SUYQ', NULL, '9141521644', 50000, 'CHQ # 25161223, CHQ Date: 2020-03-30 ( MEEZAN ) ; ZEESHAN', '2', '25161223', '2020-02-07', 1),
('R29AN6OW1KTM4BT', '2DMS8EDL11ISWULICZDE', NULL, '9921135225', 61000, ' CASH', '1', '', '2020-02-08', 1),
('MNVLKILBG15DQ43', 'ZSPRL6NCIQHI9SCRYKDH', NULL, '2997393859', 10000, 'CHQ # 11008550, CHQ Date: 2020-02-12 ( SUPPLIER CHQ ) ; KORANGI BISMILLAH PAINT/BAHL', '2', '11008550', '2020-02-12', 1),
('IF5H8N2IAHCGBZ7', 'ZSPRL6NCIQHI9SCRYKDH', NULL, '9568549796', 15000, 'CHQ # 1754925433, CHQ Date: 2020-02-26 ( SUPPLIER CHQ ) ; FAKHRI PAINTS/MCB', '2', '1754925433', '2020-02-12', 1),
('S4TXI3HM13MGQIX', 'ZSPRL6NCIQHI9SCRYKDH', NULL, '6755673712', 35000, 'CHQ # 25161225, CHQ Date: 2020-02-28 ( MEEZAN ) ; ZEESHAN', '2', '25161225', '2020-02-12', 1),
('5V9CNGYE2BMA4SW', 'Q7FR2XS4JI3PV48ANWE2', NULL, '4544326683', 25000, 'CHQ # 30408313, CHQ Date: 2020-02-16 ( MEEZAN ) ; ZEESHAN', '2', '30408313', '2020-02-14', 1),
('4U8QE9D7F35IQFU', 'Q7FR2XS4JI3PV48ANWE2', NULL, '2519983363', 25000, 'CHQ # 30408314, CHQ Date: 2020-03-08 ( MEEZAN ) ; ZEESHAN', '2', '30408314', '2020-02-14', 1),
('L1P7TKSTUO7APFE', 'Q849P2OLCS1QYZVYV1K7', NULL, '1323176513', 25000, 'CHQ # 1726231247, CHQ Date: 2020-02-15 ( SUPPLIER CHQ ) ; FAKHRI PAINT/JOHAR', '2', '1726231247', '2020-02-14', 1),
('20200214112129', 'Q7FR2XS4JI3PV48ANWE2', '32', NULL, 22000, '', '', '', '2020-02-14', 1),
('WQTDIBE2BUDZYJG', '8EM2GUI7NF8JLN7BK56L', NULL, '2481889427', 70000, ' CASH', '1', '', '2020-02-07', 1),
('20200214113832', '8EM2GUI7NF8JLN7BK56L', '946', NULL, 136800, '', '', '', '2020-02-07', 1),
('20200217070225', 'OIP8LT8QNBS1EXRILD5M', '959', NULL, 71000, '', '', '', '2020-02-10', 1),
('20200217070843', 'ZZDE8VQ5MFPC9MZRNP7T', '3041', NULL, 62500, '', '', '', '2020-02-04', 1),
('20200217071458', '8EM2GUI7NF8JLN7BK56L', '914', NULL, 91200, '', '', '', '2020-01-31', 1),
('20200217072831', 'HMITTMTF6JUD4XSUKFWZ', '091', NULL, 64800, '', '', '', '2020-02-03', 1),
('20200217073227', 'IP9TWAG6VSVG6NTYP6RF', '86', NULL, 6875, '', '', '', '2020-02-07', 1),
('20200217074035', 'ZSPRL6NCIQHI9SCRYKDH', '51', NULL, 76000, '', '', '', '2020-02-10', 1),
('J6W9S2Z64V8CS7B', '3URSQ9XJAVQPLR2YT7HL', NULL, '3535745363', 73000, 'CHQ # 30408315, CHQ Date: 2020-02-18 ( MEEZAN ) ; ZEESHAN', '2', '30408315', '2020-02-17', 1),
('B3A5ID67PLLZ8PG', 'OIP8LT8QNBS1EXRILD5M', NULL, '1731875159', 64000, 'CHQ # 00000099, CHQ Date: 2020-02-26 ( HBL ) ; ZEESHAN', '2', '00000099', '2020-02-18', 1),
('APUGXW8DX9VYAXC', 'AT9YQ8RYRMLR7M8P4JIA', NULL, '5981915772', 11400, 'CHQ # 11021584, CHQ Date: 2020-02-19 ( SUPPLIER CHQ ) ; BAHL/KORANGI BISMILLAH PAINT/KORANGI', '2', '11021584', '2020-02-17', 1),
('X2J949IIC32TDP3', 'AT9YQ8RYRMLR7M8P4JIA', NULL, '2416152225', 14100, ' CASH SALE', '1', '', '2020-02-17', 1),
('CB5P11SYDIXSUO6', 'ZZDE8VQ5MFPC9MZRNP7T', NULL, '7184152669', 50000, 'CHQ # 6492675, CHQ Date: 2020-03-12 ( SUPPLIER CHQ ) ; ZEESHAN', '2', '6492675', '2020-02-17', 1),
('65LL253UNTRPGYB', 'KVHAGIB239PCDIU1IFOL', NULL, '5984156153', 30000, 'CHQ # 30408316, CHQ Date: 2020-03-13 ( MEEZAN ) ; ZEESHAN', '2', '30408316', '2020-02-19', 1),
('KRJ6MGMOEBOFACU', 'XOLLVIVKD7CEEFLQEPQN', NULL, '1727179717', 20000, ' CASH', '1', '', '2020-02-20', 1),
('U6QWCY7QTNJ38J1', 'D23F97RKV572XU63L93E', NULL, '8763119162', 23000, 'CHQ # 42847019, CHQ Date: 2020-03-06 ( SUPPLIER CHQ ) ; S.A PAINT/BOHRAPEER', '2', '42847019', '2020-02-22', 1),
('X8DJAV7PLPWRFRR', 'D23F97RKV572XU63L93E', NULL, '8371683641', 50000, 'CHQ # 0095079328, CHQ Date: 2020-03-10 ( SUPPLIER CHQ ) ; NEW MEHRAN PAINT', '2', '0095079328', '2020-02-22', 1),
('20200225103400', 'OIP8LT8QNBS1EXRILD5M', '965', NULL, 58000, '', '', '', '2020-02-19', 1),
('ON3IQ4HE4TT2MLR', 'OIP8LT8QNBS1EXRILD5M', NULL, '9816344921', 38500, 'CHQ # 30408312, CHQ Date: 2020-02-28 ( MEEZAN ) ; ZEESHAN', '2', '', '2020-03-03', 1),
('1JWCATYFD325TG4', 'OIP8LT8QNBS1EXRILD5M', NULL, '1444751285', 38500, 'CHQ # 30408311, CHQ Date: 2020-02-20 ( MEEZAN ) ; ZEESHAN', '2', '', '2020-03-03', 1),
('DSS4VA16LUAVVKI', 'OIP8LT8QNBS1EXRILD5M', NULL, '2459553231', 50000, 'CHQ # 00095077322, CHQ Date: 2020-03-22 ( SUPPLIER CHQ ) ; MEHRAN PAINT', '2', '00095077322', '2020-03-03', 1),
('UCI4Y38VK3UKIYQ', 'OIP8LT8QNBS1EXRILD5M', NULL, '6411869749', 20000, 'CHQ # 0000009, CHQ Date: 2020-03-05 ( SUPPLIER CHQ ) ; NOT MENTIONED', '2', '0000009', '2020-03-03', 1),
('1YCOZ5JD65SG666', 'HMITTMTF6JUD4XSUKFWZ', NULL, '6496981819', 10000, 'CHQ # 000000, CHQ Date: 2020-03-07 ( SUPPLIER CHQ ) ; KORANGI B.S.M/BAHL', '2', '000000', '2020-03-04', 1),
('4PNM7WNEUBSN5NM', 'HMITTMTF6JUD4XSUKFWZ', NULL, '5355841768', 10000, 'CHQ # 000000, CHQ Date: 2020-03-16 ( SUPPLIER CHQ ) ; KORANGI B.S.M/BAHL', '2', '000000', '2020-03-04', 1),
('ZL1H57ZKUJ1FXWR', 'HMITTMTF6JUD4XSUKFWZ', NULL, '4415575447', 40000, 'CHQ # 000000, CHQ Date: 2020-03-24 ( MEEZAN ) ; ZEESHAN', '2', '000000', '2020-03-04', 1),
('20200309073202', 'Q7FR2XS4JI3PV48ANWE2', '47', NULL, 22000, '', '', '', '2020-02-27', 1),
('20200309073325', 'OIP8LT8QNBS1EXRILD5M', '1906', NULL, 43500, '', '', '', '2020-03-05', 1),
('20200309075026', '3URSQ9XJAVQPLR2YT7HL', '1902', NULL, 77200, '', '', '', '2020-02-27', 1),
('20200309080950', 'AT9YQ8RYRMLR7M8P4JIA', '1314', NULL, 73500, '', '', '', '2020-02-24', 1),
('I8JWJV4Z1WF9RFW', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '5772144329', 48000, 'CHQ # 10655853, CHQ Date: 2020-03-21 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10655853', '2020-03-10', 1),
('H5JJBODTF4VO3KU', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '5785888469', 48000, 'CHQ # 10655854, CHQ Date: 2020-03-25 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10655854', '2020-03-10', 1),
('NZGWEHJGFOV5J5D', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '2717463252', 48000, 'CHQ # 10655855, CHQ Date: 2020-03-31 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10655855', '2020-03-10', 1),
('L22U6B1VKE791Y9', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '6971923772', 48000, 'CHQ # 10655856, CHQ Date: 2020-04-10 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10655856', '2020-03-10', 1),
('GQGPB5245K9CVUZ', 'FYYUDE5ZMRGGXLPD4PZL', NULL, '8537337482', 48000, 'CHQ # 10655857, CHQ Date: 2020-04-14 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10655857', '2020-03-10', 1),
('20200310112100', '2RTL88CE6CZON8A48Q7H', '951', NULL, 67750, '', '', '', '2020-01-27', 1),
('U2IX4JDLUJ57QLJ', '2RTL88CE6CZON8A48Q7H', NULL, '9393777276', 40000, 'CHQ # 30408319, CHQ Date: 2020-04-10 ( MEEZAN ) ; ZEESHAN', '2', '30408319', '2020-03-10', 1),
('RBC3JUPUB35DSWL', '2RTL88CE6CZON8A48Q7H', NULL, '6885871871', 40000, 'CHQ # 30408320, CHQ Date: 2020-04-15 ( MEEZAN ) ; ZEESHAN', '2', '30408320', '2020-03-10', 1),
('BVKLDMNE3538CMV', '2RTL88CE6CZON8A48Q7H', NULL, '7949839844', 40000, 'CHQ # 30408321, CHQ Date: 2020-04-21 ( MEEZAN ) ; ZEESHAN', '2', '30408321', '2020-03-10', 1),
('BW1LDXT7D5Q95KP', '2RTL88CE6CZON8A48Q7H', NULL, '1648962885', 40000, 'CHQ # 30408322, CHQ Date: 2020-04-26 ( MEEZAN ) ; ZEESHAN', '2', '30408322', '2020-03-10', 1),
('J98UV6FZSTSZ8QD', '2RTL88CE6CZON8A48Q7H', NULL, '2742763752', 40000, 'CHQ # 30408323, CHQ Date: 2020-03-30 ( MEEZAN ) ; ZEESHAN', '2', '30408323', '2020-03-10', 1),
('IQCO1RYLJNQOF2K', '73841H2DMU823SWSFEI3', NULL, '1698242438', 15000, 'CHQ # 71021623, CHQ Date: 2020-03-28 ( SUPPLIER CHQ ) ; KORANGI BISMILLAH PAINT/KORANGI', '2', '71021623', '2020-03-11', 1),
('7GVC8BCEHR7A9MI', '73841H2DMU823SWSFEI3', NULL, '7665127896', 10000, ' CASH', '1', '', '2020-03-11', 1),
('20200312065310', '2RTL88CE6CZON8A48Q7H', '1908', NULL, 105450, '', '', '', '2020-03-13', 1),
('20200312070242', 'IP9TWAG6VSVG6NTYP6RF', '203', NULL, 13750, '', '', '', '2020-03-09', 1),
('QQ3EGOPG418YDZF', 'GPL2UPO3UP5JPQ1M6DBX', NULL, '1458366264', 25000, ' CASH', '1', '', '2020-03-12', 1),
('QPC1ZTA35U149IS', 'OIP8LT8QNBS1EXRILD5M', NULL, '4124255269', 50000, 'CHQ # 10655860, CHQ Date: 2020-03-30 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10655860', '2020-03-14', 1),
('20200314075027', 'FYYUDE5ZMRGGXLPD4PZL', '1909', NULL, 240000, '', '', '', '2020-03-14', 1),
('G9QAWZ2I9TE9CGI', 'ZSPRL6NCIQHI9SCRYKDH', '3638614477', NULL, 2222, '', '1', '', '2020-03-15', 1),
('20200317063326', 'GPL2UPO3UP5JPQ1M6DBX', '1910', NULL, 24000, '', '', '', '2020-03-11', 1),
('KTTOMEDT7L', 'II437GDPEFR1U28E7JQG', 'Adjustment ', NULL, 0, 'Previous adjustment of ASIF SMT with software ', 'NA', 'NA', '2020-03-17', 1),
('20200317064220', 'II437GDPEFR1U28E7JQG', '1912', NULL, 46000, '', '', '', '2020-03-13', 1),
('20200317064415', 'OIP8LT8QNBS1EXRILD5M', '1913', NULL, 75600, '', '', '', '2020-03-16', 1),
('XYDCH6T3HLYCK4V', 'PN6D6ZWHZOE6GNNVVE8E', NULL, '5232342175', 15000, 'CHQ # 00000091, CHQ Date: 2020-03-25 ( SUPPLIER CHQ ) ; NEW AL NOOR/HBL', '2', '00000091', '2020-03-17', 1),
('83HYUVNFAL9KW61', 'ZZDE8VQ5MFPC9MZRNP7T', NULL, '4262777918', 20000, ' CASH', '1', '', '2020-03-17', 1),
('6UA2JX4TK2PP92U', 'ZZDE8VQ5MFPC9MZRNP7T', NULL, '1727222468', 30000, 'CHQ # 10655861, CHQ Date: 2020-03-25 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2', '10655861', '2020-03-17', 1),
('8RMRIZ58Z4WNHAJ', 'D23F97RKV572XU63L93E', NULL, '4975183679', 25000, 'CHQ # 30408324, CHQ Date: 2020-03-28 ( MEEZAN ) ; ZEESHAN', '2', '30408324', '2020-03-17', 1),
('85D7M1OW81WYHWP', 'D23F97RKV572XU63L93E', NULL, '4385695453', 25000, ' CASH', '1', '', '2020-03-17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_product`
--

CREATE TABLE `supplier_product` (
  `supplier_pr_id` int(11) NOT NULL,
  `product_id` varchar(30) CHARACTER SET latin1 NOT NULL,
  `products_model` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `supplier_id` varchar(30) CHARACTER SET latin1 NOT NULL,
  `supplier_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `supplier_product`
--

INSERT INTO `supplier_product` (`supplier_pr_id`, `product_id`, `products_model`, `supplier_id`, `supplier_price`) VALUES
(7, '66935657', '6170', '2RTL88CE6CZON8A48Q7H', 185),
(8, '66935491', 'R996', 'FYYUDE5ZMRGGXLPD4PZL', 480),
(15, '75839298', 'R', 'Q7FR2XS4JI3PV48ANWE2', 2000),
(16, '17625274', NULL, 'Q7FR2XS4JI3PV48ANWE2', 5800),
(19, '11682266', 'SPX', 'IP9TWAG6VSVG6NTYP6RF', 275),
(20, '75684458', 'HF', 'IP9TWAG6VSVG6NTYP6RF', 260),
(21, '54731653', 'R1 100', 'IP9TWAG6VSVG6NTYP6RF', 455),
(22, '54199768', 'CROWN', 'HMITTMTF6JUD4XSUKFWZ', 88),
(23, '15423736', 'DECORE', 'HMITTMTF6JUD4XSUKFWZ', 82),
(24, '26974942', 'CROWN', 'HMITTMTF6JUD4XSUKFWZ', 37),
(25, '69542453', 'DECORE', 'HMITTMTF6JUD4XSUKFWZ', 33),
(26, '53124158', 'DECORE', 'HMITTMTF6JUD4XSUKFWZ', 33),
(27, '63447511', 'DECORE', 'HMITTMTF6JUD4XSUKFWZ', 33),
(28, '92397129', 'DECORE', 'HMITTMTF6JUD4XSUKFWZ', 33),
(29, '14613855', 'DECORE TIN', 'HMITTMTF6JUD4XSUKFWZ', 33),
(30, '84291986', 'CROWN QTR', 'HMITTMTF6JUD4XSUKFWZ', 37),
(31, '19478381', 'R2295', 'FYYUDE5ZMRGGXLPD4PZL', 465),
(32, '82523714', 'MTT', 'LPVTSAL9Y8RG1UDH4MP9', 105),
(36, '94553414', 'GAS', '445UCO1K5GSE7I98STAM', 50),
(37, '73813469', 'DM5193', '17ZBKYN9I1UHC9AYDKFA', 165.6),
(38, '63378973', '625 MESH', 'YZPXOYFITHGLI1M1SV7F', 4.197),
(39, '73648854', NULL, 'OGXZWFUZJQGQR8KPCUQF', 9),
(40, '73648854', NULL, 'YZPXOYFITHGLI1M1SV7F', 4.197),
(43, '63285764', NULL, 'OGXZWFUZJQGQR8KPCUQF', 14),
(44, '63285764', NULL, 'YZPXOYFITHGLI1M1SV7F', 7.697),
(45, '17545938', NULL, 'OGXZWFUZJQGQR8KPCUQF', 19),
(46, '17545938', NULL, 'YZPXOYFITHGLI1M1SV7F', 16.697),
(47, '34555833', 'AC65', 'OIP8LT8QNBS1EXRILD5M', 210),
(48, '95317485', '4382', '73841H2DMU823SWSFEI3', 1450),
(49, '97416238', '4730', '73841H2DMU823SWSFEI3', 900),
(50, '25996585', '313', '73841H2DMU823SWSFEI3', 1400),
(51, '12917627', 'CHINA', '73841H2DMU823SWSFEI3', 285),
(52, '12735643', '43/77', '73841H2DMU823SWSFEI3', 700),
(53, '28284394', 'C7', '73841H2DMU823SWSFEI3', 1900),
(56, '54748182', NULL, '73841H2DMU823SWSFEI3', 850),
(57, '54748182', NULL, 'GPL2UPO3UP5JPQ1M6DBX', 550),
(60, '19266228', NULL, '2RTL88CE6CZON8A48Q7H', 195),
(61, '19266228', NULL, '8EM2GUI7NF8JLN7BK56L', 195),
(62, '93669648', 'HBR-C', 'D23F97RKV572XU63L93E', 1335),
(63, '72976928', '100', 'D23F97RKV572XU63L93E', 890),
(64, '83138325', 'YELLOW', 'AU5YU8HI5RK3ME4ZRSGE', 8),
(65, '38571343', 'GALLON', 'LPVTSAL9Y8RG1UDH4MP9', 24),
(66, '59778963', 'ORIENT ', 'Q849P2OLCS1QYZVYV1K7', 185),
(67, '13332495', 'ORIENT ', 'Q849P2OLCS1QYZVYV1K7', 185),
(68, '49112765', 'OXIDE', 'Q849P2OLCS1QYZVYV1K7', 185),
(69, '24548719', 'HB', 'Q849P2OLCS1QYZVYV1K7', 325),
(70, '44621867', 'T2', '38G8VAYQUTANT6T7P6NK', 75),
(71, '94196468', NULL, 'OIP8LT8QNBS1EXRILD5M', 145),
(73, '64714882', NULL, '38G8VAYQUTANT6T7P6NK', 350),
(74, '39155997', NULL, 'OIP8LT8QNBS1EXRILD5M', 168),
(75, '94828254', 'P90', 'Q7FR2XS4JI3PV48ANWE2', 325),
(76, '51776169', '730', 'Q7FR2XS4JI3PV48ANWE2', 425),
(77, '36962713', 'PNR626', 'GPL2UPO3UP5JPQ1M6DBX', 475),
(78, '25866835', 'CHINA', 'KVHAGIB239PCDIU1IFOL', 325),
(79, '25866835', 'CHINA', '', 0),
(80, '32716139', 'CHINA 1', 'KVHAGIB239PCDIU1IFOL', 325),
(82, '99129686', 'C9', '73841H2DMU823SWSFEI3', 290),
(83, '78691717', 'CHINA', '73841H2DMU823SWSFEI3', 9000),
(84, '11115486', 'TONNER', '73841H2DMU823SWSFEI3', 9000),
(85, '63838615', '45000B', 'ZZDE8VQ5MFPC9MZRNP7T', 1050),
(86, '35314534', 'THAIROX', 'ZZDE8VQ5MFPC9MZRNP7T', 260),
(87, '24514611', 'ASI', 'Q7FR2XS4JI3PV48ANWE2', 6000),
(88, '18217271', '6618', 'KVHAGIB239PCDIU1IFOL', 440),
(89, '64953658', NULL, '73841H2DMU823SWSFEI3', 400),
(90, '64953658', NULL, 'GPL2UPO3UP5JPQ1M6DBX', 425),
(91, '64953658', NULL, 'KVHAGIB239PCDIU1IFOL', 430),
(92, '75482766', 'IBAAD', 'QYPZRIH3F9G3WGCQD1IS', 2000),
(95, '51584313', '(CHALK)', 'UOG71LV2MZUSTC69H2Y2', 9),
(96, '81721345', '(CHALK)', 'UOG71LV2MZUSTC69H2Y2', 8),
(97, '33896832', '((CHALK))', 'UOG71LV2MZUSTC69H2Y2', 8),
(98, '96762451', 'LABELS', 'PN6D6ZWHZOE6GNNVVE8E', 7),
(99, '43384316', 'LABELS', 'PN6D6ZWHZOE6GNNVVE8E', 3),
(100, '64696422', 'LABELS.', 'PN6D6ZWHZOE6GNNVVE8E', 3),
(101, '89198234', 'PLASTIC', 'WH74CL4U9NF73DU6SHHP', 235),
(102, '43432834', 'PLASTIC.', 'WH74CL4U9NF73DU6SHHP', 160),
(103, '61826276', 'meg', 'KVHAGIB239PCDIU1IFOL', 130),
(104, '94814935', 'FGR', 'Q7FR2XS4JI3PV48ANWE2', 2000),
(105, '69354628', 'TIO R', 'VU49HVTLNZGLY8DJFOXN', 24),
(106, '62191632', 'CHALK', 'VU49HVTLNZGLY8DJFOXN', 7),
(107, '59369644', '..', 'WH74CL4U9NF73DU6SHHP', 235),
(108, '96274825', '....', 'WH74CL4U9NF73DU6SHHP', 160),
(109, '66575412', 'TA', '3URSQ9XJAVQPLR2YT7HL', 386),
(110, '46926715', 'LABELS.', 'PN6D6ZWHZOE6GNNVVE8E', 18),
(111, '78337678', 'LABELS......', 'PN6D6ZWHZOE6GNNVVE8E', 18),
(112, '45441865', '..', 'WH74CL4U9NF73DU6SHHP', 85),
(113, '33997446', 'PWG', 'WH74CL4U9NF73DU6SHHP', 85),
(114, '41364337', 'LBS', 'PN6D6ZWHZOE6GNNVVE8E', 8),
(115, '29781619', 'LBSS', 'PN6D6ZWHZOE6GNNVVE8E', 4),
(116, '26436961', 'HBR', 'KVHAGIB239PCDIU1IFOL', 1480),
(117, '18657736', '( SUPER SNOW TALE )', 'OWD3XIR2BNDRUTZIQZDM', 30),
(118, '93143414', '( SUPER SNOW TALE )', 'OWD3XIR2BNDRUTZIQZDM', 13),
(119, '86439361', 'SUPER SNOW TALE', 'OWD3XIR2BNDRUTZIQZDM', 13),
(120, '84331594', '( SUPER SNOW TALE', 'OWD3XIR2BNDRUTZIQZDM', 9),
(121, '17831699', 'CHALK)', 'UOG71LV2MZUSTC69H2Y2', 13),
(122, '42392732', 'TIO', 'UOG71LV2MZUSTC69H2Y2', 30),
(123, '45265761', 'tio2', '43KY3DUFCY7NQ8R3GWW7', 525),
(124, '95949111', 'Z', 'AT9YQ8RYRMLR7M8P4JIA', 850),
(125, '26249861', 'SW C', 'ZSPRL6NCIQHI9SCRYKDH', 9),
(126, '93766577', 'SW CH', 'ZSPRL6NCIQHI9SCRYKDH', 10),
(127, '97394291', 'SW CH YELLOW', 'ZSPRL6NCIQHI9SCRYKDH', 8),
(128, '57446521', 'SW T', 'ZSPRL6NCIQHI9SCRYKDH', 24),
(129, '88776688', 'SW CHA', 'ZSPRL6NCIQHI9SCRYKDH', 16),
(130, '82696283', 'WPS (D)', 'HMITTMTF6JUD4XSUKFWZ', 250),
(131, '58283532', 'TSD', 'HMITTMTF6JUD4XSUKFWZ', 16),
(132, '78552617', NULL, 'LPVTSAL9Y8RG1UDH4MP9', 104),
(136, '84995431', NULL, '2BG6T26IG9TYKSLKLMWL', 200),
(137, '63444867', 'R556', '8EM2GUI7NF8JLN7BK56L', 240),
(138, '17593768', 'K', 'ZZDE8VQ5MFPC9MZRNP7T', 1250),
(139, '92651552', NULL, 'GPL2UPO3UP5JPQ1M6DBX', 2300),
(140, '12583444', '(KC)', 'AT9YQ8RYRMLR7M8P4JIA', 2300),
(141, '28426654', '(KC)', 'AT9YQ8RYRMLR7M8P4JIA', 550),
(142, '25538276', '(KC.)', 'AT9YQ8RYRMLR7M8P4JIA', 550),
(143, '28899367', '(KC))', 'AT9YQ8RYRMLR7M8P4JIA', 85),
(144, '94954496', '(SR)', '2RTL88CE6CZON8A48Q7H', 1300),
(145, '29993596', '(SR))', '2RTL88CE6CZON8A48Q7H', 1300),
(146, '83812165', '((SR)', '2RTL88CE6CZON8A48Q7H', 630),
(148, '77415412', NULL, 'FYYUDE5ZMRGGXLPD4PZL', 480),
(149, '92354743', '(MB DYES)', 'GPL2UPO3UP5JPQ1M6DBX', 240),
(150, '57611555', '(MB DYES))', 'GPL2UPO3UP5JPQ1M6DBX', 240),
(151, '45833999', 'MTT', 'II437GDPEFR1U28E7JQG', 115),
(152, '65929814', 'MTT.', 'II437GDPEFR1U28E7JQG', 115);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_transaction_summary`
--

CREATE TABLE `supplier_transaction_summary` (
  `supplier_name` varchar(255) DEFAULT NULL,
  `supplier_id` varchar(100) DEFAULT NULL,
  `type` varchar(6) DEFAULT NULL,
  `amount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `synchronizer_setting`
--

CREATE TABLE `synchronizer_setting` (
  `id` int(11) NOT NULL,
  `hostname` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `port` varchar(10) NOT NULL,
  `debug` varchar(10) NOT NULL,
  `project_root` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tax_information`
--

CREATE TABLE `tax_information` (
  `tax_id` varchar(15) NOT NULL,
  `tax` float DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tax_information`
--

INSERT INTO `tax_information` (`tax_id`, `tax`, `status`) VALUES
('Y9KWTEPKLL', 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `transection`
--

CREATE TABLE `transection` (
  `transaction_id` varchar(30) NOT NULL,
  `date_of_transection` varchar(30) NOT NULL,
  `transection_type` varchar(30) NOT NULL,
  `transection_category` varchar(30) NOT NULL,
  `transection_mood` varchar(25) NOT NULL,
  `amount` varchar(20) NOT NULL,
  `pay_amount` int(30) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `relation_id` varchar(30) NOT NULL,
  `voucher_id` bigint(30) DEFAULT NULL,
  `cheque_no` varchar(200) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transection`
--

INSERT INTO `transection` (`transaction_id`, `date_of_transection`, `transection_type`, `transection_category`, `transection_mood`, `amount`, `pay_amount`, `description`, `relation_id`, `voucher_id`, `cheque_no`, `cheque_date`, `bank_name`) VALUES
('LK48CKRF3WXC1NH', '2018-11-17', '1', '1', '2', '0', 22000, 'CHQ # 75936580, CHQ Date: 2018-11-17 ( test bank ) ; NBP ', 'OIP8LT8QNBS1EXRILD5M', 1007, '75936580', '2018-11-17', 'test bank'),
('R1485ONYFMYF9FT', '2018-11-17', '1', '1', '2', '0', 50000, 'CHQ # 16210310, CHQ Date: 2018-11-25 ( test bank ) ; MEEZAN BANK OF MR ZEESHAN', 'OIP8LT8QNBS1EXRILD5M', 1007, '16210310', '2018-11-25', 'test bank'),
('JL45Y6AAJ9UZNX1', '2018-11-17', '1', '1', '2', '0', 78500, 'CHQ # 21038611, CHQ Date: 2018-12-10 ( test bank ) ; CHQ OF NEW AGHA PAINT MANGOO PEER AL BAQRA', 'GPL2UPO3UP5JPQ1M6DBX', 1006, '21038611', '2018-12-10', 'test bank'),
('GR3XBTVCR6UO7QC', '2018-11-17', '1', '1', '2', '0', 20000, 'CHQ # 101667690, CHQ Date: 2018-11-16 ( test bank ) ; FAYSAL BANK SAAD PAINT', 'ZZDE8VQ5MFPC9MZRNP7T', 1005, '101667690', '2018-11-16', 'test bank'),
('7NQNNLFVZCBB8J5', '2018-11-17', '1', '1', '2', '0', 6000, 'CHQ # 5571150, CHQ Date: 2018-11-23 ( test bank ) ; SUMMIT BANK ANEES PAINT', 'ZZDE8VQ5MFPC9MZRNP7T', 1005, '5571150', '2018-11-23', 'test bank'),
('YGCJB7JXRMHJ4P4', '2018-11-19', '1', '1', '2', '0', 33700, 'CHQ # 16210312, CHQ Date: 2018-12-12 ( MEEZAN ) ; ', '8EC45YB7SSBDHR45SUYQ', 1008, '16210312', '2018-12-12', 'MEEZAN'),
('LHDMFCXD1NK37OM', '2018-11-19', '1', '1', '2', '0', 33700, 'CHQ # 16210313, CHQ Date: 2018-12-16 ( MEEZAN ) ; ', '8EC45YB7SSBDHR45SUYQ', 1008, '16210313', '2018-12-16', 'MEEZAN'),
('ULRC3E6JCVQG4R4', '2018-11-19', '1', '1', '2', '0', 33700, 'CHQ # 16210314, CHQ Date: 2018-12-25 ( MEEZAN ) ; ', '8EC45YB7SSBDHR45SUYQ', 1008, '16210314', '2018-12-25', 'MEEZAN'),
('WAJOIG44IH3RKBO', '2018-11-19', '1', '1', '2', '0', 67840, 'CHQ # 16210315, CHQ Date: 2018-12-30 ( MEEZAN ) ; ', '8EC45YB7SSBDHR45SUYQ', 1008, '16210315', '2018-12-30', 'MEEZAN'),
('27CM81W4X76OS7V', '2018-11-20', '1', '1', '1', '0', 5000, ' ', 'PN6D6ZWHZOE6GNNVVE8E', 1010, NULL, NULL, NULL),
('S4RZAHLHFBDODHH', '2018-11-20', '1', '1', '2', '0', 50000, 'CHQ # 10570766, CHQ Date: 2018-11-20 ( BANK AL HABIB LIMITED ) ; PAID CASH CHQ AGAINST CHQ TO MR. ARSLAN ', '8EM2GUI7NF8JLN7BK56L', 1009, '10570766', '2018-11-20', 'BANK AL HABIB LIMITED'),
('RS26J9HPZS49I7L', '2018-11-26', '1', '1', '2', '0', 31680, 'CHQ # 0041, CHQ Date: 2018-12-13 ( HBL ) ; PAID AGAINST # EL441800148', '17ZBKYN9I1UHC9AYDKFA', 1015, '0041', '2018-12-13', 'HBL'),
('2SUBEJ938NIK3A9', '2018-11-26', '1', '1', '2', '0', 31680, 'CHQ # 0042, CHQ Date: 2018-12-26 ( HBL ) ; PAID AGAINST # EL4418001574', '17ZBKYN9I1UHC9AYDKFA', 1015, '0042', '2018-12-26', 'HBL'),
('OWO8EJM9F4GJR9L', '2018-11-13', '1', '1', '2', '0', 6000, 'CHQ # 5571149, CHQ Date: 2018-11-16 ( test bank ) ; ANEES PAINT , SUMMIT BANK ', 'D23F97RKV572XU63L93E', 1003, '5571149', '2018-11-16', 'test bank'),
('JQHYID4BU1LEUKY', '2018-11-13', '1', '1', '2', '0', 20000, 'CHQ # 7099738, CHQ Date: 2018-11-20 ( test bank ) ; NEW AL NOOR , MEEZAN ', 'D23F97RKV572XU63L93E', 1003, '7099738', '2018-11-20', 'test bank'),
('LVF94MM73QQ8RP7', '2018-11-27', '1', '1', '2', '0', 30000, 'CHQ # 46, CHQ Date: 2018-12-02 ( test bank ) ; PAID CHQ OF NEW AL NOOR ', 'QYPZRIH3F9G3WGCQD1IS', 1016, '46', '2018-12-02', 'test bank'),
('NUN8P8AT11B6WQI', '2018-11-24', '1', '1', '2', '0', 25000, 'CHQ # 16210318, CHQ Date: 2018-12-10 ( MEEZAN ) ; PAID CHQ ', '38G8VAYQUTANT6T7P6NK', 1014, '16210318', '2018-12-10', 'MEEZAN'),
('TOQG6VJ57P4WFPZ', '2018-11-24', '1', '1', '2', '0', 20000, 'CHQ # 10602328, CHQ Date: 2018-12-07 ( test bank ) ; GHOSIA PAINT BANK AL HABIB', '38G8VAYQUTANT6T7P6NK', 1014, '10602328', '2018-12-07', 'test bank'),
('R2KGNWO248KOBG9', '2018-11-24', '1', '1', '2', '0', 23000, 'CHQ # 0101667695, CHQ Date: 2018-11-24 ( test bank ) ; SAAD PAINT FAYSAL BANK', '2RTL88CE6CZON8A48Q7H', 1013, '0101667695', '2018-11-24', 'test bank'),
('6GD6EIY4DMTX46A', '2018-11-24', '1', '1', '2', '0', 50000, 'CHQ # 10570770, CHQ Date: 2018-11-30 ( BANK AL HABIB LIMITED ) ; ', '2RTL88CE6CZON8A48Q7H', 1013, '10570770', '2018-11-30', 'BANK AL HABIB LIMITED'),
('P4RLEKQ7KUFLU9R', '2018-11-24', '1', '1', '2', '0', 50000, 'CHQ # 10570771, CHQ Date: 2018-12-12 ( BANK AL HABIB LIMITED ) ; ', '2RTL88CE6CZON8A48Q7H', 1013, '10570771', '2018-12-12', 'BANK AL HABIB LIMITED'),
('5XC7PY7I3RYCAOE', '2018-11-24', '1', '1', '2', '0', 50000, 'CHQ # 10570772, CHQ Date: 2018-12-16 ( BANK AL HABIB LIMITED ) ; ', '2RTL88CE6CZON8A48Q7H', 1013, NULL, '0000-00-00', 'BANK AL HABIB LIMITED'),
('IK8VPHXX2XAVF9V', '2018-11-24', '1', '1', '2', '0', 50000, 'CHQ # 10570773, CHQ Date: 2018-12-26 ( BANK AL HABIB LIMITED ) ; ', '2RTL88CE6CZON8A48Q7H', 1013, '10570773', '2018-12-26', 'BANK AL HABIB LIMITED'),
('BWLE23TEGVLA34A', '2018-11-29', '1', '1', '2', '0', 50000, 'CHQ # 7477466, CHQ Date: 2018-12-02 ( test bank ) ; PAID CHQ OF FDK IMRAN KUKDA ', 'Q7FR2XS4JI3PV48ANWE2', 1018, '7477466', '2018-12-02', 'test bank'),
('472F12UCW4I6YD8', '2018-11-22', '1', '1', '2', '0', 50000, 'CHQ # 1350326668, CHQ Date: 2018-11-30 ( MEEZAN ) ; ', '73841H2DMU823SWSFEI3', 1012, '1350326668', '2018-11-30', 'MEEZAN'),
('6Z7DDWDN38EB4VI', '2018-11-12', '1', '1', '2', '0', 50000, 'CHQ # 887, CHQ Date: 2018-11-20 ( test bank ) ; HBL BILAL BROTHER TAHIR PAINT LANDHI 887 ', 'FYYUDE5ZMRGGXLPD4PZL', 1002, '887', '2018-11-20', 'test bank'),
('BI93J6Q4MKK6H1H', '2018-11-12', '1', '1', '2', '0', 50000, 'CHQ # 36, CHQ Date: 2018-12-15 ( HBL ) ; HBL ', 'FYYUDE5ZMRGGXLPD4PZL', 1002, '36', '2018-12-15', 'HBL'),
('YRAO47KJJJH5EHC', '2018-11-12', '1', '1', '2', '0', 50000, 'CHQ # 37, CHQ Date: 2018-12-21 ( HBL ) ; HBL ', 'FYYUDE5ZMRGGXLPD4PZL', 1002, '37', '2018-12-21', 'HBL'),
('84ZBQ6UDLCADK9P', '2018-11-12', '1', '1', '2', '0', 50000, 'CHQ # 38, CHQ Date: 2018-12-24 ( HBL ) ; HBL ', 'FYYUDE5ZMRGGXLPD4PZL', 1002, '38', '2018-12-24', 'HBL'),
('7MTPOX75B4MTPS5', '2018-11-12', '1', '1', '2', '0', 50000, 'CHQ # 39, CHQ Date: 2018-12-28 ( HBL ) ; HBL ', 'FYYUDE5ZMRGGXLPD4PZL', 1002, '39', '2018-12-28', 'HBL'),
('F5SDAYY2YB7DZ6S', '2018-11-12', '1', '1', '2', '0', 50000, 'CHQ # 40, CHQ Date: 2018-12-31 ( HBL ) ; HBL ', 'FYYUDE5ZMRGGXLPD4PZL', 1002, '40', '2018-12-31', 'HBL'),
('OZCZP9V5JUFWHYV', '2018-11-22', '1', '1', '2', '0', 39150, 'CHQ # 10570767, CHQ Date: 2018-11-28 ( BANK AL HABIB LIMITED ) ; FOR THE MONTH OF JULY AND AUG 2018', 'HMITTMTF6JUD4XSUKFWZ', 1011, '10570767', '2018-11-28', 'BANK AL HABIB LIMITED'),
('8X9ZXAMKU3PNCTG', '2018-11-22', '1', '1', '2', '0', 39150, 'CHQ # 10570768, CHQ Date: 2018-12-15 ( BANK AL HABIB LIMITED ) ; FOR THE MONTH OF JULY AND AUG 2018', 'HMITTMTF6JUD4XSUKFWZ', 1011, '10570768', '2018-12-15', 'BANK AL HABIB LIMITED'),
('S417KIWZZPLJ12V', '2018-11-22', '1', '1', '2', '0', 39150, 'CHQ # 10570769, CHQ Date: 2018-12-30 ( BANK AL HABIB LIMITED ) ; FOR THE MONTH OF JULY AND AUG 2018', 'HMITTMTF6JUD4XSUKFWZ', 1011, '10570769', '2018-12-30', 'BANK AL HABIB LIMITED'),
('ECOKHEXMZW6A842', '2018-11-10', '1', '1', '2', '0', 50000, 'CHQ # 135032667, CHQ Date: 2018-11-17 ( test bank ) ; CHQ OF MEHRAN PAINT', '73841H2DMU823SWSFEI3', 1000, '135032667', '2018-11-17', 'test bank'),
('GG3325JNPXFIUCE', '2018-11-10', '1', '1', '2', '0', 20000, 'CHQ # 10363655, CHQ Date: 2018-11-21 ( BANK AL HABIB LIMITED ) ; ', '73841H2DMU823SWSFEI3', 1000, '10363655', '2018-11-21', 'BANK AL HABIB LIMITED'),
('PESOB9JGZ3LUZKY', '2018-11-10', '1', '1', '2', '0', 10000, 'CHQ # 1666865742, CHQ Date: 2018-11-12 ( test bank ) ; MFFADIL ', '73841H2DMU823SWSFEI3', 1000, '1666865742', '2018-11-12', 'test bank'),
('WZVN9TIEC9KSWKB', '2018-11-12', '1', '1', '2', '0', 50000, 'CHQ # 50326668, CHQ Date: 2018-11-30 ( test bank ) ; PAID CHQ OF MEHRAN PAINT', 'Z6D8ETUQSYEOBK7QQL78', 1001, '50326668', '2018-11-30', 'test bank'),
('U9EKV9PN414E3DK', '2018-12-03', '1', '1', '2', '0', 25000, 'CHQ # 10486010, CHQ Date: 2018-12-27 ( test bank ) ; CHQ OF MUFFADIL ', 'IP9TWAG6VSVG6NTYP6RF', 1019, '10486010', '2018-12-07', 'test bank'),
('OYL58DCDUMK6VAC', '2018-12-04', '1', '1', '2', '0', 50000, 'CHQ # 42382177, CHQ Date: 2018-12-07 ( test bank ) ; UNION PAINT CLIENT ', '8EC45YB7SSBDHR45SUYQ', 1020, '42382177', '2018-12-07', 'test bank'),
('LI3BCN2SDGBUI25', '2018-11-28', '1', '1', '1', '0', 63000, ' ', 'LPVTSAL9Y8RG1UDH4MP9', 1017, NULL, NULL, NULL),
('XD2K11AQ3DOSS63', '2018-12-08', '1', '1', '1', '0', 8750, ' ', '445UCO1K5GSE7I98STAM', 1022, NULL, NULL, NULL),
('OPP5U3LAAYS5J5B', '2018-12-12', '1', '1', '2', '0', 20000, 'CHQ # 7099744, CHQ Date: 2018-12-20 ( SUPPLIER CHQ ) ; NEW al NOOR', '2RTL88CE6CZON8A48Q7H', 1023, '7099744', '2018-12-20', 'SUPPLIER CHQ'),
('1DVHFO2TNL42LWW', '2018-12-12', '1', '2', '2', '0', 30000, 'CHQ # 114897763, CHQ Date: 2018-12-23 ( SUPPLIER CHQ ) ; SAAD PAINT', '2RTL88CE6CZON8A48Q7H', 1023, '114897763', '2018-12-23', 'SUPPLIER CHQ'),
('8BIG2NJUITAGDRU', '2018-12-13', '1', '1', '2', '0', 20000, 'CHQ # 5639053, CHQ Date: 2018-12-20 ( SUPPLIER CHQ ) ; SUBRANG IMRAN', '17ZBKYN9I1UHC9AYDKFA', 1024, '5639053', '2018-12-20', 'SUPPLIER CHQ'),
('RH2U1BOYMGA5XGU', '2018-12-13', '1', '1', '2', '0', 10000, 'CHQ # 14614724, CHQ Date: 2018-12-20 ( SUPPLIER CHQ ) ; MAAZ PAINT', '17ZBKYN9I1UHC9AYDKFA', 1024, '14614724', '2018-12-20', 'SUPPLIER CHQ'),
('VYD5TJL5FLS2G3J', '2018-12-17', '1', '1', '2', '0', 30000, 'CHQ # 16210323, CHQ Date: 2018-12-24 ( MEEZAN ) ; ', '8EM2GUI7NF8JLN7BK56L', 1025, '16210323', '2018-12-24', 'MEEZAN'),
('2V7B6M96VU4DECJ', '2018-12-17', '1', '1', '2', '0', 30000, 'CHQ # 16210324, CHQ Date: 2018-12-30 ( MEEZAN ) ; ', '8EM2GUI7NF8JLN7BK56L', 1025, '16210324', '2018-12-30', 'MEEZAN'),
('P5NSHNT51IQ27XK', '2018-12-17', '1', '1', '2', '0', 20000, 'CHQ # 184, CHQ Date: 2019-01-11 ( SUPPLIER CHQ ) ; ESSA HBL', '8EM2GUI7NF8JLN7BK56L', 1025, '184', '2019-01-11', 'SUPPLIER CHQ'),
('I42PIHFKPGA4REF', '2018-12-17', '1', '1', '2', '0', 20000, 'CHQ # 183, CHQ Date: 2019-01-04 ( SUPPLIER CHQ ) ; ESSA HBL', '8EM2GUI7NF8JLN7BK56L', 1025, '183', '2019-01-04', 'SUPPLIER CHQ'),
('BE8QHJAGUBFCJD2', '2018-12-17', '1', '1', '2', '0', 50000, 'CHQ # 16203725, CHQ Date: 2018-12-22 ( SUPPLIER CHQ ) ; SUBRANG', '8EC45YB7SSBDHR45SUYQ', 1026, '16203725', '2018-12-22', 'SUPPLIER CHQ'),
('BJIBFW65JK89VQZ', '2018-12-17', '1', '1', '2', '0', 25000, 'CHQ # 1063667, CHQ Date: 2018-12-25 ( SUPPLIER CHQ ) ; SUB A PAINT ', '8EC45YB7SSBDHR45SUYQ', 1026, '1063667', '2018-12-25', 'SUPPLIER CHQ'),
('WMC7F461OBITV5C', '2018-12-17', '1', '1', '2', '0', 20000, 'CHQ # 181, CHQ Date: 2018-12-21 ( SUPPLIER CHQ ) ; ESSA', '8EC45YB7SSBDHR45SUYQ', 1026, '181', '2018-12-21', 'SUPPLIER CHQ'),
('WX176MNBKYD1ODD', '2018-12-17', '1', '1', '2', '0', 20000, 'CHQ # 182, CHQ Date: 2018-12-28 ( SUPPLIER CHQ ) ; ESSA', '8EC45YB7SSBDHR45SUYQ', 1026, '182', '2018-12-28', 'SUPPLIER CHQ'),
('AWJH1U3ZHWFALTS', '2018-12-17', '1', '1', '2', '0', 44000, 'CHQ # 16210327, CHQ Date: 2019-01-31 ( MEEZAN ) ; ', '8EC45YB7SSBDHR45SUYQ', 1026, '16210327', '2019-01-31', 'MEEZAN'),
('K7J4TTOA9HOVU5N', '2018-12-17', '1', '1', '2', '0', 44000, 'CHQ # 16210325, CHQ Date: 2019-01-19 ( MEEZAN ) ; ZEESHAN ISHAQ', '8EC45YB7SSBDHR45SUYQ', 1026, '16210325', '2019-01-19', 'MEEZAN'),
('5X4ASHR63JYXZX3', '2018-12-17', '1', '1', '2', '0', 44000, 'CHQ # 16210326, CHQ Date: 2019-01-26 ( MEEZAN ) ; ZEESHAN ISHAQ', '8EC45YB7SSBDHR45SUYQ', 1026, '16210326', '2019-01-26', 'MEEZAN'),
('QFXMCKMFKJIUKEC', '2018-12-17', '1', '1', '1', '0', 5000, ' PAID CASH TO MR.IMRAN BY MR. SHEHZAAD ', 'LPVTSAL9Y8RG1UDH4MP9', 1027, '', '0000-00-00', ''),
('RJQUFWLLR7FZ1LH', '2018-12-19', '1', '2', '2', '0', 10000, 'CHQ # 18247186, CHQ Date: 2018-12-29 ( MEEZAN ) ; ', 'OGXZWFUZJQGQR8KPCUQF', 1028, '18247186', '2018-12-19', 'SUPPLIER CHQ '),
('WPOOEG6A61D2QVZ', '2018-12-19', '1', '1', '2', '0', 22250, 'CHQ # 16210328, CHQ Date: 2019-01-12 ( MEEZAN ) ; ', 'OGXZWFUZJQGQR8KPCUQF', 1028, '16210328', '2019-01-12', 'MEEZAN'),
('4W3JDKWJBPGQWVL', '2018-12-19', '1', '1', '2', '0', 50000, 'CHQ # 49663696, CHQ Date: 2018-12-15 ( SUPPLIER CHQ ) ; rao javed', 'OIP8LT8QNBS1EXRILD5M', 1029, '49663696', '2018-12-15', 'SUPPLIER CHQ'),
('AAFU5UEWEVOTW2M', '2018-12-18', '1', '1', '2', '0', 20000, 'CHQ # 15901545, CHQ Date: 2018-12-19 ( SUPPLIER CHQ ) ; UBL MUHAMMAD ARSLAN', 'Z6D8ETUQSYEOBK7QQL78', 1030, '15901545', '2018-12-19', 'SUPPLIER CHQ'),
('YXUTJ4VM8K51LPU', '2018-12-19', '1', '1', '2', '0', 50000, 'CHQ # 16203724, CHQ Date: 2018-12-20 ( SUPPLIER CHQ ) ; AGAINST NC PAINT OF PRISM TO MR KHRUM ( SUBRANG)', '2DMS8EDL11ISWULICZDE', 1031, '16203724', '2018-12-20', 'SUPPLIER CHQ'),
('W5HG99VGGUXWTMH', '2018-12-24', '1', '1', '1', '0', 750, ' ', 'FYYUDE5ZMRGGXLPD4PZL', 1032, '', '0000-00-00', ''),
('TR6WDR1T2XETED8', '2018-12-24', '1', '2', '2', '0', 53000, 'CHQ # 16210333, CHQ Date: 2019-01-30 ( MEEZAN ) ; ', 'FYYUDE5ZMRGGXLPD4PZL', 1032, '16210333', '2018-12-24', 'MEEZAN'),
('2Y88VF8R5I8PZTP', '2018-12-24', '1', '1', '2', '0', 50000, 'CHQ # 16210332, CHQ Date: 2019-01-27 ( MEEZAN ) ; ', 'FYYUDE5ZMRGGXLPD4PZL', 1032, '16210332', '2019-01-27', 'MEEZAN'),
('K42I52PC8SFYL2F', '2018-12-24', '1', '1', '2', '0', 50000, 'CHQ # 16210331, CHQ Date: 2019-01-24 ( MEEZAN ) ; ', 'FYYUDE5ZMRGGXLPD4PZL', 1032, '16210331', '2019-01-24', 'MEEZAN'),
('JQ8IAPC6QAMBAIN', '2018-12-24', '1', '1', '2', '0', 50000, 'CHQ # 16210330, CHQ Date: 2019-01-21 ( MEEZAN ) ; ', 'FYYUDE5ZMRGGXLPD4PZL', 1032, '16210330', '2019-01-21', 'MEEZAN'),
('AAJDP914K7XOIVH', '2018-12-24', '1', '1', '2', '0', 50000, 'CHQ # 16210329, CHQ Date: 2019-01-13 ( MEEZAN ) ; ', 'FYYUDE5ZMRGGXLPD4PZL', 1032, '16210329', '2019-01-13', 'MEEZAN'),
('5DRYZWBRQQIHRD6', '2018-12-24', '1', '1', '2', '0', 50000, 'CHQ # 16210334, CHQ Date: 2019-02-12 ( MEEZAN ) ; ', 'FYYUDE5ZMRGGXLPD4PZL', 1032, '16210334', '2019-02-12', 'MEEZAN'),
('OPO9QBT1UJ7VG4N', '2018-12-26', '1', '1', '2', '0', 25000, 'CHQ # 7099747, CHQ Date: 2018-12-31 ( SUPPLIER CHQ ) ; NEW AL NOOR', 'D68TC2VDP9CL8M6165T1', 1033, '7099747', '2018-12-31', 'SUPPLIER CHQ'),
('HVQDS4B9BELWXY9', '2018-12-26', '1', '1', '2', '0', 38000, 'CHQ # 10578451, CHQ Date: 2019-01-14 ( BANK AL HABIB LIMITED ) ; ', 'HMITTMTF6JUD4XSUKFWZ', 1034, '10578451', '2019-01-14', 'BANK AL HABIB LIMITED'),
('JC8MAGM3PM1BZYB', '2018-12-26', '1', '1', '2', '0', 38000, 'CHQ # 10578452, CHQ Date: 2019-01-20 ( BANK AL HABIB LIMITED ) ; ', 'HMITTMTF6JUD4XSUKFWZ', 1034, '10578452', '2019-01-20', 'BANK AL HABIB LIMITED'),
('3QECJ1KQ8COMUX2', '2018-12-26', '1', '1', '2', '0', 38000, 'CHQ # 10578452, CHQ Date: 2019-01-28 ( BANK AL HABIB LIMITED ) ; ', 'HMITTMTF6JUD4XSUKFWZ', 1034, '10578452', '2019-01-28', 'BANK AL HABIB LIMITED'),
('KNCMVYE1V873Y9F', '2018-12-26', '1', '1', '2', '0', 28360, 'CHQ # 10578454, CHQ Date: 2018-12-26 ( BANK AL HABIB LIMITED ) ; ', '17ZBKYN9I1UHC9AYDKFA', 1035, '10578454', '2018-12-26', 'BANK AL HABIB LIMITED'),
('54CMUEZIUM1HVPQ', '2018-12-27', '1', '1', '2', '0', 50000, 'CHQ # 10578455, CHQ Date: 2019-01-24 ( BANK AL HABIB LIMITED ) ; ', '2RTL88CE6CZON8A48Q7H', 1036, '10578455', '2019-01-24', 'BANK AL HABIB LIMITED'),
('4CE4YPWJRM7G2IH', '2018-12-27', '1', '1', '2', '0', 50000, 'CHQ # 10570780, CHQ Date: 2019-01-16 ( BANK AL HABIB LIMITED ) ; ', '2RTL88CE6CZON8A48Q7H', 1036, '10570780', '2019-01-16', 'BANK AL HABIB LIMITED'),
('PSMWEWXPVNWJALC', '2018-12-27', '1', '1', '2', '0', 50000, 'CHQ # 10578456, CHQ Date: 2019-01-27 ( BANK AL HABIB LIMITED ) ; ', '2RTL88CE6CZON8A48Q7H', 1036, '10578456', '2019-01-27', 'BANK AL HABIB LIMITED'),
('3WLHM3GITJLT79N', '2018-12-27', '1', '1', '2', '0', 50000, 'CHQ # 10578457, CHQ Date: 2019-01-31 ( BANK AL HABIB LIMITED ) ; ', '2RTL88CE6CZON8A48Q7H', 1036, '10578457', '2019-01-31', 'BANK AL HABIB LIMITED'),
('98OTFOBNO9JHA1Q', '2018-12-29', '1', '1', '2', '0', 100000, 'CHQ # 10321569, CHQ Date: 2019-01-07 ( SUPPLIER CHQ ) ; foji kunkot', 'OIP8LT8QNBS1EXRILD5M', 1037, '10321569', '2019-01-07', 'SUPPLIER CHQ'),
('CN57JWNRK68Z9YO', '2018-12-29', '1', '1', '1', '0', 15040, ' foji kunkot', 'OIP8LT8QNBS1EXRILD5M', 1037, '', '0000-00-00', ''),
('ZU4M2D2IQAKJ22H', '2018-12-29', '1', '2', '2', '0', 19000, 'CHQ # , CHQ Date: 2018-12-31 ( SUPPLIER CHQ ) ; saven ali gul', 'ZZDE8VQ5MFPC9MZRNP7T', 1038, '20060797', '2019-01-01', 'MEEZAN'),
('YGGW48UNR1JHR48', '2019-01-04', '1', '1', '2', '0', 50000, 'CHQ # 15110309, CHQ Date: 2019-01-20 ( SUPPLIER CHQ ) ; SAAD', '8EM2GUI7NF8JLN7BK56L', 1043, '15110309', '2019-01-20', 'SUPPLIER CHQ'),
('ATGN1ZNGETKI5V1', '2019-01-04', '1', '1', '2', '0', 25000, 'CHQ # 10578460, CHQ Date: 2019-01-30 ( BANK AL HABIB LIMITED ) ; ', '8EM2GUI7NF8JLN7BK56L', 1043, '10578460', '2019-01-30', 'BANK AL HABIB LIMITED'),
('I8X3UZHM1ZOHG5D', '2019-01-04', '1', '1', '2', '0', 25000, 'CHQ # 10578459, CHQ Date: 2019-01-21 ( BANK AL HABIB LIMITED ) ; ', '8EM2GUI7NF8JLN7BK56L', 1043, '10578459', '2019-01-21', 'BANK AL HABIB LIMITED'),
('TBW6QIT7BUONUJP', '2018-11-15', '1', '1', '1', '0', 63600, ' ', 'LPVTSAL9Y8RG1UDH4MP9', 1044, '', '0000-00-00', ''),
('IL5RY9PC7OZKDEU', '2019-01-10', '1', '1', '2', '0', 20000, 'CHQ # 7099749, CHQ Date: 2019-01-15 ( SUPPLIER CHQ ) ; NEW AL NOOR', 'Z6D8ETUQSYEOBK7QQL78', 1045, '7099749', '2019-01-15', 'SUPPLIER CHQ'),
('LWUQOBGV9YRLTPG', '2019-01-10', '1', '1', '2', '0', 30000, 'CHQ # 7099748, CHQ Date: 2019-01-10 ( SUPPLIER CHQ ) ; new al noor', 'D23F97RKV572XU63L93E', 1046, '7099748', '2019-01-10', 'SUPPLIER CHQ'),
('NBGA5R5GB18SHFD', '2019-01-10', '1', '1', '2', '0', 15000, 'CHQ # 5571164, CHQ Date: 2019-01-19 ( SUPPLIER CHQ ) ; anees paint', 'D23F97RKV572XU63L93E', 1046, '5571164', '2019-01-19', 'SUPPLIER CHQ'),
('Z7SQ8TX5KQ5Z42N', '2019-01-10', '1', '1', '2', '0', 50000, 'CHQ # 117752630, CHQ Date: 2019-01-10 ( SUPPLIER CHQ ) ; saad paint', '2RTL88CE6CZON8A48Q7H', 1047, '117752630', '2019-01-10', 'SUPPLIER CHQ'),
('1BECJ2B3WPJWOYW', '2019-01-10', '1', '1', '2', '0', 24000, 'CHQ # 41026863, CHQ Date: 2019-01-08 ( SUPPLIER CHQ ) ; FABRO', '2RTL88CE6CZON8A48Q7H', 1047, '41026863', '2019-01-08', 'SUPPLIER CHQ'),
('A7SO8MBSOY2AE42', '2019-01-12', '1', '1', '2', '0', 100000, 'CHQ # 10321572, CHQ Date: 2019-01-25 ( SUPPLIER CHQ ) ; FOJI BANK AL HABIB', 'GPL2UPO3UP5JPQ1M6DBX', 1048, '10321572', '2019-01-25', 'SUPPLIER CHQ'),
('93FIYER6K1GWQW7', '2019-01-14', '1', '1', '2', '0', 10000, 'CHQ # 18854426, CHQ Date: 2019-01-12 ( SUPPLIER CHQ ) ; MAAZ', 'AU5YU8HI5RK3ME4ZRSGE', 1049, '18854426', '2019-01-12', 'SUPPLIER CHQ'),
('ZTXHFX2UELIU9JW', '2019-01-14', '1', '1', '2', '0', 30000, 'CHQ # 45, CHQ Date: 2019-01-20 ( HBL ) ; ', 'Q7FR2XS4JI3PV48ANWE2', 1050, '45', '2019-01-20', 'HBL'),
('ZXBCEWT8KSAFTFC', '2019-01-14', '1', '1', '2', '0', 30000, 'CHQ # 46, CHQ Date: 2019-01-27 ( HBL ) ; ', 'Q7FR2XS4JI3PV48ANWE2', 1050, '46', '2019-01-27', 'HBL'),
('GAD8CO423V42S2H', '2019-01-16', '1', '1', '2', '0', 50000, 'CHQ # 10578464, CHQ Date: 2019-02-12 ( BANK AL HABIB LIMITED ) ; ', '8EC45YB7SSBDHR45SUYQ', 1051, '10578464', '2019-02-12', 'BANK AL HABIB LIMITED'),
('RED33MIDAV8P4NC', '2019-01-16', '1', '1', '2', '0', 50000, 'CHQ # 10578465, CHQ Date: 2019-02-17 ( BANK AL HABIB LIMITED ) ; ', '8EC45YB7SSBDHR45SUYQ', 1051, '10578465', '2019-02-17', 'BANK AL HABIB LIMITED'),
('JT7PHHWTC651T6W', '2019-01-16', '1', '1', '2', '0', 50000, 'CHQ # 10578466, CHQ Date: 2019-02-21 ( BANK AL HABIB LIMITED ) ; ', '8EC45YB7SSBDHR45SUYQ', 1051, '10578466', '2019-02-21', 'BANK AL HABIB LIMITED'),
('WFVS1CDTJAC9SZO', '2019-01-16', '1', '1', '2', '0', 50000, 'CHQ # 10578468, CHQ Date: 2019-02-28 ( BANK AL HABIB LIMITED ) ; ', '8EC45YB7SSBDHR45SUYQ', 1051, '10578468', '2019-02-28', 'BANK AL HABIB LIMITED'),
('8XXQGN1CRD1P38Z', '2019-01-16', '1', '1', '2', '0', 50000, 'CHQ # 10578467, CHQ Date: 2019-02-24 ( BANK AL HABIB LIMITED ) ; ', '8EC45YB7SSBDHR45SUYQ', 1051, '10578467', '2019-02-24', 'BANK AL HABIB LIMITED'),
('HI96EEHHFSM7963', '2019-01-16', '1', '1', '1', '0', 30000, ' ', '8EC45YB7SSBDHR45SUYQ', 1051, '', '0000-00-00', ''),
('RSD3D6B1PW64RD2', '2019-01-28', '1', '1', '1', '0', 92800, ' ADJUST WITH PRISM BILL ', 'Q849P2OLCS1QYZVYV1K7', 1052, '', '0000-00-00', ''),
('VR787WYX19UC2Z7', '2019-01-19', '1', '1', '1', '0', 25000, ' ', 'IP9TWAG6VSVG6NTYP6RF', 1053, '', '0000-00-00', ''),
('KTNG1AAX1LHT9DE', '2019-01-19', '1', '1', '2', '0', 50000, 'CHQ # 10578469, CHQ Date: 2019-01-19 ( BANK AL HABIB LIMITED ) ; ', 'D23F97RKV572XU63L93E', 1054, '10578469', '2019-01-19', 'BANK AL HABIB LIMITED'),
('LFASCTWLVQNEA7L', '2019-01-19', '1', '1', '2', '0', 50000, 'CHQ # 0000, CHQ Date: 2019-01-30 ( SUPPLIER CHQ ) ; UNION PAINT', '73841H2DMU823SWSFEI3', 1055, '0000', '2019-01-30', 'SUPPLIER CHQ'),
('QCKCSY3T296KQUS', '2019-01-19', '1', '1', '2', '0', 25000, 'CHQ # 00000, CHQ Date: 2019-01-30 ( SUPPLIER CHQ ) ; FABRO', 'WYU7GK7FHY1AFSA8DAHK', 1056, '00000', '2019-01-30', 'SUPPLIER CHQ'),
('TMKLG49OZT4MNJ4', '2019-01-18', '1', '1', '1', '0', 62400, ' ', 'LPVTSAL9Y8RG1UDH4MP9', 1057, '', '0000-00-00', ''),
('63LSRZHDTPTN8F8', '2019-01-12', '1', '1', '1', '0', 20400, ' PAID CASH TO MR. ABDUL MAJEED ', 'LPVTSAL9Y8RG1UDH4MP9', 1058, '', '0000-00-00', ''),
('MI97HQLI5I68Y4Q', '2019-01-22', '1', '1', '2', '0', 15000, 'CHQ # 0000, CHQ Date: 2019-01-27 ( SUPPLIER CHQ ) ; NEW AL NOOR', 'Z6D8ETUQSYEOBK7QQL78', 1059, '0000', '2019-01-27', 'SUPPLIER CHQ'),
('DQ4SUDHAEPWBLJG', '2019-01-22', '1', '1', '2', '0', 50000, 'CHQ # 10578470, CHQ Date: 2019-02-23 ( BANK AL HABIB LIMITED ) ; ', '8EC45YB7SSBDHR45SUYQ', 1061, '10578470', '2019-02-23', 'BANK AL HABIB LIMITED'),
('APORM9YTP1D5VCH', '2019-01-23', '1', '1', '2', '0', 20000, 'CHQ # 5579498, CHQ Date: 2019-02-04 ( SUPPLIER CHQ ) ; anees paint', 'Q849P2OLCS1QYZVYV1K7', 1060, '5579498', '2019-02-04', 'SUPPLIER CHQ'),
('D9VKJMRILR778GS', '2019-01-23', '1', '1', '2', '0', 10000, 'CHQ # 18854430, CHQ Date: 2019-01-28 ( SUPPLIER CHQ ) ; maaz', 'ZZDE8VQ5MFPC9MZRNP7T', 1062, '18854430', '2019-01-28', 'SUPPLIER CHQ'),
('RRHJAS436FJHCTW', '2019-01-23', '1', '1', '1', '0', 10000, ' maaz', 'ZZDE8VQ5MFPC9MZRNP7T', 1062, '', '0000-00-00', ''),
('FQGZSJQ752T7A9T', '2019-01-23', '1', '1', '2', '0', 50000, 'CHQ # 00000047, CHQ Date: 2019-02-17 ( HBL ) ; ', 'OIP8LT8QNBS1EXRILD5M', 1063, '00000047', '2019-02-17', 'HBL'),
('8G1IAM55NKA6HIX', '2019-01-23', '1', '1', '2', '0', 50000, 'CHQ # 00000048, CHQ Date: 2019-02-26 ( HBL ) ; ', 'OIP8LT8QNBS1EXRILD5M', 1063, '00000048', '2019-02-26', 'HBL'),
('52ZBEZE7R1RGZ52', '2019-01-24', '1', '1', '1', '0', 50000, ' ONLINE IN BANK BY AFZAAL \r\nUBL ACCOUNT TITLE ZAHOOR HUSSAIN ACCOUNT NO.1470-24793982\r\nMOB.03439836700', 'YZPXOYFITHGLI1M1SV7F', 1064, '', '0000-00-00', ''),
('3PJ2GSW9DB7W56Q', '2019-01-26', '1', '1', '2', '0', 22000, 'CHQ # 10053581, CHQ Date: 2019-01-25 ( SUPPLIER CHQ ) ; QUITA FALCON', 'OGXZWFUZJQGQR8KPCUQF', 1065, '10053581', '2019-01-25', 'SUPPLIER CHQ'),
('RRHOVA2CLJHFZCX', '2019-01-26', '1', '1', '2', '0', 10000, 'CHQ # 97188654, CHQ Date: 2019-02-13 ( SUPPLIER CHQ ) ; ASHARFI PAINT O/T', 'OGXZWFUZJQGQR8KPCUQF', 1065, '97188654', '2019-02-13', 'SUPPLIER CHQ'),
('ZBONKYWWRZGCX5K', '2019-01-30', '1', '1', '2', '0', 38750, 'CHQ # 16210338, CHQ Date: 2019-02-28 ( MEEZAN ) ; ', 'GPL2UPO3UP5JPQ1M6DBX', 1066, '16210338', '2019-02-28', 'MEEZAN'),
('EJK9IRTONPER34X', '2019-01-30', '1', '1', '2', '0', 40000, 'CHQ # 16210337, CHQ Date: 2019-02-22 ( MEEZAN ) ; ', 'GPL2UPO3UP5JPQ1M6DBX', 1066, '16210337', '2019-02-22', 'MEEZAN'),
('M2VXHKANM8I1ALH', '2019-01-30', '1', '1', '2', '0', 40000, 'CHQ # 16210336, CHQ Date: 2019-02-17 ( MEEZAN ) ; ', 'GPL2UPO3UP5JPQ1M6DBX', 1066, '16210336', '2019-02-17', 'MEEZAN'),
('RDV19J1P5JPXEYQ', '2019-02-01', '1', '1', '2', '0', 30000, 'CHQ # 15110320, CHQ Date: 2019-02-21 ( SUPPLIER CHQ ) ; saad', 'HMITTMTF6JUD4XSUKFWZ', 1067, '15110320', '2019-02-21', 'SUPPLIER CHQ'),
('G7CDIV9S2QUBD45', '2019-02-01', '1', '1', '2', '0', 20000, 'CHQ # 10713566, CHQ Date: 2019-02-01 ( SUPPLIER CHQ ) ; ghosia ', 'HMITTMTF6JUD4XSUKFWZ', 1067, '10713566', '2019-02-01', 'SUPPLIER CHQ'),
('9DD3PUS11E6WSDF', '2019-02-01', '1', '1', '2', '0', 20000, 'CHQ # 0061, CHQ Date: 2019-02-07 ( SUPPLIER CHQ ) ; new al noor', 'HMITTMTF6JUD4XSUKFWZ', 1067, '0061', '2019-02-07', 'SUPPLIER CHQ'),
('ZSYLUTT7Z4LBQVE', '2019-02-02', '1', '1', '2', '0', 15000, 'CHQ # 5579501, CHQ Date: 2019-02-11 ( SUPPLIER CHQ ) ; anees', '73841H2DMU823SWSFEI3', 1068, '5579501', '2019-02-11', 'SUPPLIER CHQ'),
('3U51G71O7PVM1I8', '2019-02-06', '1', '1', '2', '0', 10000, 'CHQ # 18854436, CHQ Date: 2019-02-16 ( SUPPLIER CHQ ) ; maaz', '8EM2GUI7NF8JLN7BK56L', 1069, '18854436', '2019-02-16', 'SUPPLIER CHQ'),
('T3OWUW9LQVYVEQB', '2019-02-06', '1', '1', '2', '0', 10000, 'CHQ # 19179601, CHQ Date: 2019-02-16 ( SUPPLIER CHQ ) ; arslan paint', '8EM2GUI7NF8JLN7BK56L', 1069, '19179601', '2019-02-16', 'SUPPLIER CHQ'),
('UZZ5X392DCFHWHA', '2019-02-06', '1', '1', '2', '0', 10000, 'CHQ # 22240308, CHQ Date: 2019-02-20 ( SUPPLIER CHQ ) ; atta ullah abbasi electric store', '8EM2GUI7NF8JLN7BK56L', 1069, '22240308', '2019-02-20', 'SUPPLIER CHQ'),
('KBZLFFASX3NNDJ5', '2019-02-06', '1', '1', '2', '0', 25000, 'CHQ # 5492655, CHQ Date: 2019-02-20 ( SUPPLIER CHQ ) ; rao javed ', '8EM2GUI7NF8JLN7BK56L', 1069, '5492655', '2019-02-20', 'SUPPLIER CHQ'),
('CF1DPUUIUTUA85S', '2019-02-06', '1', '1', '2', '0', 50000, 'CHQ # 050, CHQ Date: 2019-02-26 ( HBL ) ; ', '8EM2GUI7NF8JLN7BK56L', 1069, '050', '2019-02-26', 'HBL'),
('TH3YAENA2TRL7WU', '2019-02-07', '1', '1', '2', '0', 20000, 'CHQ # 5579504, CHQ Date: 2019-02-18 ( SUPPLIER CHQ ) ; ANEES', 'IP9TWAG6VSVG6NTYP6RF', 1070, '5579504', '2019-02-18', 'SUPPLIER CHQ'),
('Z7BPP1ETKBP4H5J', '2019-02-07', '1', '1', '2', '0', 10000, 'CHQ # 5562028, CHQ Date: 2019-02-13 ( SUPPLIER CHQ ) ; ANEES PAINT', '4JKPQ6ZVNQABMLAHRJNS', 1071, '5562028', '2019-02-13', 'SUPPLIER CHQ'),
('V9PFH4TZWYWKFRQ', '2019-02-07', '1', '1', '1', '0', 15000, ' CASH', '4JKPQ6ZVNQABMLAHRJNS', 1071, '', '0000-00-00', ''),
('ZK7U2AX7F8UHS3G', '2019-02-09', '1', '2', '2', '0', 50000, 'CHQ # 19250554, CHQ Date: 2019-03-12 ( MEEZAN ) ; ', '2RTL88CE6CZON8A48Q7H', 1072, '19250554', '2019-02-13', 'MEEZAN'),
('3PKNPAOF4LOSW2Z', '2019-02-09', '1', '2', '2', '0', 50000, 'CHQ # 19250553, CHQ Date: 2019-02-28 ( MEEZAN ) ; ', '2RTL88CE6CZON8A48Q7H', 1072, '19250553', '2019-02-13', 'MEEZAN'),
('NHRKUAJUMR62S32', '2019-02-09', '1', '2', '2', '0', 50000, 'CHQ # 19250552, CHQ Date: 2019-02-24 ( MEEZAN ) ; ', '2RTL88CE6CZON8A48Q7H', 1072, '19250552', '2019-02-13', 'MEEZAN'),
('9G2ERQIT6XUIMFD', '2019-02-09', '1', '2', '2', '0', 50000, 'CHQ # 19250551, CHQ Date: 2019-02-16 ( MEEZAN ) ; ', '2RTL88CE6CZON8A48Q7H', 1072, '19250551', '2019-02-13', 'MEEZAN'),
('OXG62R5CF9SDJMU', '2019-02-09', '1', '2', '2', '0', 100000, 'CHQ # 10321570, CHQ Date: 2019-02-24 ( SUPPLIER CHQ ) ; foji', '2RTL88CE6CZON8A48Q7H', 1072, '10321570', '2019-02-13', 'MEEZAN'),
('HVANZ55VIAVP42W', '2019-02-09', '1', '2', '2', '0', 100000, 'CHQ # 10321571, CHQ Date: 2019-02-24 ( SUPPLIER CHQ ) ; foji', '2RTL88CE6CZON8A48Q7H', 1072, '10321571', '2019-02-13', 'MEEZAN'),
('WK56HAQ7IVGMGJD', '2019-02-09', '1', '2', '1', '0', 50000, ' CASH', '2RTL88CE6CZON8A48Q7H', 1072, '', '2019-02-13', 'MEEZAN'),
('VCKXP4TYJ4563OP', '2019-02-09', '1', '1', '2', '0', 25000, 'CHQ # 10497633, CHQ Date: 2019-03-05 ( SUPPLIER CHQ ) ; MUFADDIL', 'GPL2UPO3UP5JPQ1M6DBX', 1073, '10497633', '2019-03-05', 'SUPPLIER CHQ'),
('7YN5MKMUKBBHRKQ', '2019-02-09', '1', '1', '2', '0', 25000, 'CHQ # 10497632, CHQ Date: 2019-02-28 ( SUPPLIER CHQ ) ; MUFADDIL', 'GPL2UPO3UP5JPQ1M6DBX', 1073, '10497632', '2019-02-28', 'SUPPLIER CHQ'),
('82FWIIN5C393PQZ', '2019-02-12', '1', '1', '2', '0', 15000, 'CHQ # 62, CHQ Date: 2019-02-12 ( SUPPLIER CHQ ) ; new al noor', 'Z6D8ETUQSYEOBK7QQL78', 1074, '62', '2019-02-12', 'SUPPLIER CHQ'),
('62PQ3D8KG4ADHPA', '2019-02-12', '1', '1', '2', '0', 10000, 'CHQ # 19450921, CHQ Date: 2019-02-12 ( SUPPLIER CHQ ) ; sun bright', 'Z6D8ETUQSYEOBK7QQL78', 1074, '19450921', '2019-02-12', 'SUPPLIER CHQ'),
('U31C7HQZPMFMN2S', '2019-02-12', '1', '1', '2', '0', 25000, 'CHQ # 89085, CHQ Date: 2019-02-20 ( SUPPLIER CHQ ) ; sun bright', '73841H2DMU823SWSFEI3', 1075, '89085', '2019-02-20', 'SUPPLIER CHQ'),
('LKDHG5XEPCRLSRI', '2019-02-12', '1', '2', '2', '0', 50000, 'CHQ # 19250555, CHQ Date: 2019-02-24 ( MEEZAN ) ; zeeshan ishaq', 'GPL2UPO3UP5JPQ1M6DBX', 1076, '19250555', '2019-02-13', 'MEEZAN'),
('91NF52WM8OOOLA5', '2019-02-12', '1', '2', '2', '0', 25000, 'CHQ # 89084, CHQ Date: 2019-02-15 ( SUPPLIER CHQ ) ; sunbright', 'GPL2UPO3UP5JPQ1M6DBX', 1076, '89084', '2019-02-13', 'MEEZAN'),
('Q67KZZMBFWO1VIQ', '2019-02-12', '1', '2', '2', '0', 20000, 'CHQ # 63, CHQ Date: 2019-02-20 ( SUPPLIER CHQ ) ; new al noor', 'GPL2UPO3UP5JPQ1M6DBX', 1076, '63', '2019-02-13', 'MEEZAN'),
('16ITV67Y4UQSJEV', '2019-02-12', '1', '1', '2', '0', 50000, 'CHQ # , CHQ Date: 2019-02-27 ( MEEZAN ) ; ', '17ZBKYN9I1UHC9AYDKFA', 1077, '', '2019-02-27', 'MEEZAN'),
('DUIUWA6VXY3TOND', '2019-02-16', '1', '1', '1', '0', 100000, ' ADVANCE FORM SHADE CARD ', 'FYYUDE5ZMRGGXLPD4PZL', 1078, '', '0000-00-00', ''),
('ICWM3F5YCLRV7AO', '2019-02-16', '1', '1', '2', '0', 40000, 'CHQ # 00000, CHQ Date: 2019-02-18 ( SUPPLIER CHQ ) ; MUNEER PAINT', 'FYYUDE5ZMRGGXLPD4PZL', 1078, '00000', '2019-02-18', 'SUPPLIER CHQ'),
('9JO6HMLNBBEQTC5', '2019-02-16', '1', '1', '2', '0', 15000, 'CHQ # 00000, CHQ Date: 2019-02-23 ( SUPPLIER CHQ ) ; ANUS', 'FYYUDE5ZMRGGXLPD4PZL', 1078, '00000', '2019-02-23', 'SUPPLIER CHQ'),
('IRIZ3KLKW1JKUJX', '2019-02-16', '1', '1', '2', '0', 40000, 'CHQ # 00000, CHQ Date: 2019-02-27 ( SUPPLIER CHQ ) ; SAAD', 'FYYUDE5ZMRGGXLPD4PZL', 1078, '00000', '2019-02-27', 'SUPPLIER CHQ'),
('VYFJ8FJK9VEZVD6', '2019-02-16', '1', '1', '2', '0', 50000, 'CHQ # 000, CHQ Date: 2019-02-27 ( HBL ) ; ', 'FYYUDE5ZMRGGXLPD4PZL', 1079, '000', '2019-02-27', 'HBL'),
('P8BDGCD9GPE4J92', '2019-02-16', '1', '1', '2', '0', 50000, 'CHQ # 000, CHQ Date: 2019-03-14 ( HBL ) ; ', 'FYYUDE5ZMRGGXLPD4PZL', 1079, '000', '2019-03-14', 'HBL'),
('6QYSIX6CIYYULKS', '2019-02-16', '1', '1', '2', '0', 35000, 'CHQ # 77190713, CHQ Date: 2019-02-21 ( SUPPLIER CHQ ) ; EZZY ', 'Q7FR2XS4JI3PV48ANWE2', 1080, '77190713', '2019-02-21', 'SUPPLIER CHQ'),
('SA87PEO8AS5O6CD', '2019-02-16', '1', '1', '2', '0', 15000, 'CHQ # 111225, CHQ Date: 2019-03-07 ( SUPPLIER CHQ ) ; BANK ISLAMIC', 'Q7FR2XS4JI3PV48ANWE2', 1080, '111225', '2019-03-07', 'SUPPLIER CHQ'),
('2F5QJ6Y5JFQ7GBC', '2019-02-18', '1', '1', '2', '0', 25000, 'CHQ # 115999249, CHQ Date: 2019-02-16 ( SUPPLIER CHQ ) ; ezzy', 'OIP8LT8QNBS1EXRILD5M', 1081, '115999249', '2019-02-16', 'SUPPLIER CHQ'),
('5T71V5CIH86WODK', '2019-02-18', '1', '1', '2', '0', 32600, 'CHQ # 53, CHQ Date: 2019-03-17 ( HBL ) ; ', 'OIP8LT8QNBS1EXRILD5M', 1081, '53', '2019-03-17', 'HBL'),
('K1W9V3NEOLW3EX7', '2019-02-18', '1', '1', '2', '0', 32600, 'CHQ # 54, CHQ Date: 2019-03-21 ( HBL ) ; ', 'OIP8LT8QNBS1EXRILD5M', 1081, '54', '2019-03-21', 'HBL'),
('E9K9CFUT4QT36FX', '2019-02-18', '1', '1', '2', '0', 37400, 'CHQ # 55, CHQ Date: 2019-03-27 ( HBL ) ; ', 'OIP8LT8QNBS1EXRILD5M', 1081, '55', '2019-03-27', 'HBL'),
('TX731FKILSLVJB1', '2019-02-19', '1', '1', '2', '0', 15000, 'CHQ # 111204, CHQ Date: 2019-02-26 ( SUPPLIER CHQ ) ; AL MAKKAH PAINT GAGAR PHATAK', 'D23F97RKV572XU63L93E', 1082, '111204', '2019-02-26', 'SUPPLIER CHQ'),
('A63IES9TPVKOTD7', '2019-02-19', '1', '1', '2', '0', 35000, 'CHQ # 19250557, CHQ Date: 2019-03-15 ( MEEZAN ) ; ', 'D23F97RKV572XU63L93E', 1082, '19250557', '2019-03-15', 'MEEZAN'),
('4HA6MXGWB8ZL7B2', '2019-02-21', '1', '1', '2', '0', 15000, 'CHQ # 4675661, CHQ Date: 2019-03-02 ( SUPPLIER CHQ ) ; HARIS SABIR', 'Q849P2OLCS1QYZVYV1K7', 1083, '4675661', '2019-03-02', 'SUPPLIER CHQ'),
('YK6KEA6J52VBRZU', '2019-02-21', '1', '1', '2', '0', 7000, 'CHQ # 9287072, CHQ Date: 2019-01-22 ( SUPPLIER CHQ ) ; MA PAINT GUL HADID', 'Q849P2OLCS1QYZVYV1K7', 1083, '9287072', '2019-01-22', 'SUPPLIER CHQ'),
('F2OBKQ1SHK48NC1', '2019-02-23', '1', '1', '2', '0', 50000, 'CHQ # 19250558, CHQ Date: 2019-03-20 ( MEEZAN ) ; ', '8EC45YB7SSBDHR45SUYQ', 1084, '19250558', '2019-03-20', 'MEEZAN'),
('V8ITPXCSHL9KOSJ', '2019-02-23', '1', '1', '2', '0', 50000, 'CHQ # 19250559, CHQ Date: 2019-03-25 ( MEEZAN ) ; ', '8EC45YB7SSBDHR45SUYQ', 1084, '19250559', '2019-03-25', 'MEEZAN'),
('24ECJMQYVNTL6RR', '2019-02-23', '1', '1', '2', '0', 50000, 'CHQ # 19250560, CHQ Date: 2019-03-30 ( MEEZAN ) ; ', '8EC45YB7SSBDHR45SUYQ', 1084, '19250560', '2019-03-30', 'MEEZAN'),
('AHEWN6XYC57OB9A', '2019-02-23', '1', '1', '1', '0', 2500, ' ', '8EC45YB7SSBDHR45SUYQ', 1084, '', '0000-00-00', ''),
('7GK91A2USBEG2LH', '2019-02-26', '1', '1', '2', '0', 25000, 'CHQ # 192, CHQ Date: 2019-03-03 ( SUPPLIER CHQ ) ; ESSA', '2RTL88CE6CZON8A48Q7H', 1085, '192', '2019-03-03', 'SUPPLIER CHQ'),
('NSM2BWP1G592PDJ', '2019-02-26', '1', '1', '2', '0', 25000, 'CHQ # 10713571, CHQ Date: 2019-03-07 ( SUPPLIER CHQ ) ; SHAFIQ AHMED BANK AL HABIB', 'GPL2UPO3UP5JPQ1M6DBX', 1086, '10713571', '2019-03-07', 'SUPPLIER CHQ'),
('ZR8AZC5OWJ8TAX9', '2019-02-26', '1', '1', '2', '0', 25000, 'CHQ # 195, CHQ Date: 2019-03-24 ( SUPPLIER CHQ ) ; ESSA', 'GPL2UPO3UP5JPQ1M6DBX', 1086, '195', '2019-03-24', 'SUPPLIER CHQ'),
('IASCF1IYML7WWLQ', '2019-02-26', '1', '1', '2', '0', 25000, 'CHQ # 193, CHQ Date: 2019-03-10 ( SUPPLIER CHQ ) ; NEW ESSA', 'WYU7GK7FHY1AFSA8DAHK', 1087, '193', '2019-03-10', 'SUPPLIER CHQ'),
('VIVOWW9K1YRIIN4', '2019-02-27', '1', '1', '2', '0', 10000, 'CHQ # 9287076, CHQ Date: 2019-03-02 ( SUPPLIER CHQ ) ; MA PAINT ', 'ZZDE8VQ5MFPC9MZRNP7T', 1088, '9287076', '2019-03-02', 'SUPPLIER CHQ'),
('B7SHB66LEICPYUF', '2019-02-27', '1', '1', '2', '0', 15000, 'CHQ # 19179625, CHQ Date: 2019-03-09 ( SUPPLIER CHQ ) ; ARSLAN PAINT', 'ZZDE8VQ5MFPC9MZRNP7T', 1088, '19179625', '2019-03-09', 'SUPPLIER CHQ'),
('EE68D9PPUCNROYU', '2019-02-28', '1', '1', '1', '0', 179800, ' ', 'LPVTSAL9Y8RG1UDH4MP9', 1089, '', '0000-00-00', ''),
('G3AMBLRCWPXMTVV', '2019-02-28', '1', '1', '1', '0', 45000, ' ', 'KVHAGIB239PCDIU1IFOL', 1090, '', '0000-00-00', ''),
('T8VNJRXX8QS5UIT', '2019-02-28', '1', '1', '2', '0', 20000, 'CHQ # 67, CHQ Date: 2019-03-06 ( SUPPLIER CHQ ) ; new al noor', 'KVHAGIB239PCDIU1IFOL', 1090, '67', '2019-03-06', 'SUPPLIER CHQ'),
('432HNM6JI64Q8KA', '2019-02-28', '1', '1', '2', '0', 20000, 'CHQ # 10256142, CHQ Date: 2019-03-06 ( SUPPLIER CHQ ) ; ezzy paint', 'IP9TWAG6VSVG6NTYP6RF', 1091, '10256142', '2019-03-06', 'SUPPLIER CHQ'),
('MJ9A4JNAI3KYHFU', '2019-02-28', '1', '1', '2', '0', 20500, 'CHQ # 41026872, CHQ Date: 2019-02-28 ( SUPPLIER CHQ ) ; sumair', 'IP9TWAG6VSVG6NTYP6RF', 1091, '41026872', '2019-02-28', 'SUPPLIER CHQ'),
('ZN7IB9XIB9XAKJQ', '2019-03-02', '1', '1', '1', '0', 5000, ' CASH', 'D68TC2VDP9CL8M6165T1', 1092, '', '0000-00-00', ''),
('5AU9IR4A5466FDS', '2019-03-02', '1', '1', '2', '0', 15000, 'CHQ # 5579512, CHQ Date: 2019-03-11 ( SUPPLIER CHQ ) ; ANEES SHER SHAH', 'D68TC2VDP9CL8M6165T1', 1092, '5579512', '2019-03-11', 'SUPPLIER CHQ'),
('BR43AA8K1P2CCQ3', '2019-03-05', '1', '1', '2', '0', 20000, 'CHQ # 68, CHQ Date: 2019-03-12 ( SUPPLIER CHQ ) ; HBL NEW AL NOOR', 'QYPZRIH3F9G3WGCQD1IS', 1093, '68', '2019-03-12', 'SUPPLIER CHQ'),
('ZI6DDSBP1JRHR2S', '2019-03-06', '1', '1', '2', '0', 50000, 'CHQ # 1063670, CHQ Date: 2019-03-25 ( SUPPLIER CHQ ) ; SUB A PAINT', '8EC45YB7SSBDHR45SUYQ', 1094, '1063670', '2019-03-25', 'SUPPLIER CHQ'),
('SG2ILX5X9NF5QXB', '2019-03-06', '1', '1', '2', '0', 50000, 'CHQ # 56, CHQ Date: 2019-04-14 ( HBL ) ; ', '8EC45YB7SSBDHR45SUYQ', 1094, '56', '2019-04-14', 'HBL'),
('VGPI93RNMXZEHU5', '2019-03-06', '1', '1', '2', '0', 50000, 'CHQ # 57, CHQ Date: 2019-04-21 ( HBL ) ; ', '8EC45YB7SSBDHR45SUYQ', 1094, '57', '2019-04-21', 'HBL'),
('GE52X6RW7ESCL25', '2019-03-06', '1', '1', '2', '0', 50000, 'CHQ # 57, CHQ Date: 2019-04-28 ( HBL ) ; ', '8EC45YB7SSBDHR45SUYQ', 1094, '57', '2019-04-28', 'HBL'),
('2VK5L2C2QNQEWQI', '2019-03-09', '1', '1', '1', '0', 2000, ' CASH PAID', 'OIP8LT8QNBS1EXRILD5M', 1095, '', '0000-00-00', ''),
('9WELNS23AH7KSLL', '2019-03-09', '1', '1', '2', '0', 15000, 'CHQ # 19, CHQ Date: 2019-03-15 ( SUPPLIER CHQ ) ; ANEES PAINT', 'OIP8LT8QNBS1EXRILD5M', 1095, '19', '2019-03-15', 'SUPPLIER CHQ'),
('K4YROBKJPYCY96H', '2019-03-09', '1', '1', '2', '0', 25000, 'CHQ # 194, CHQ Date: 2019-03-17 ( SUPPLIER CHQ ) ; ESSA', 'OIP8LT8QNBS1EXRILD5M', 1095, '194', '2019-03-17', 'SUPPLIER CHQ'),
('E9LV9A582F2CZ9G', '2019-03-16', '1', '1', '2', '0', 10000, 'CHQ # 97188662, CHQ Date: 2019-03-17 ( SUPPLIER CHQ ) ; ashrafi', 'Z6D8ETUQSYEOBK7QQL78', 1096, '97188662', '2019-03-17', 'SUPPLIER CHQ'),
('UIVQAJNKQORXULV', '2019-03-16', '1', '1', '2', '0', 10000, 'CHQ # 19179641, CHQ Date: 2019-03-25 ( SUPPLIER CHQ ) ; arsalan', 'Z6D8ETUQSYEOBK7QQL78', 1096, '19179641', '2019-03-25', 'SUPPLIER CHQ'),
('SDKZ12JZRX9CDN7', '2019-03-14', '1', '1', '2', '0', 15000, 'CHQ # 0000, CHQ Date: 2019-03-26 ( SUPPLIER CHQ ) ; al makkah', 'HMITTMTF6JUD4XSUKFWZ', 1097, '0000', '2019-03-26', 'SUPPLIER CHQ'),
('CVTLRO7R83H4YHL', '2019-03-14', '1', '1', '2', '0', 15000, 'CHQ # 0000, CHQ Date: 2019-04-08 ( SUPPLIER CHQ ) ; al makkah', 'HMITTMTF6JUD4XSUKFWZ', 1097, '0000', '2019-04-08', 'SUPPLIER CHQ'),
('ZJ4H5LGSJWHR9F6', '2019-03-14', '1', '1', '2', '0', 25000, 'CHQ # 0000059, CHQ Date: 2019-03-26 ( HBL ) ; zeshan', 'HMITTMTF6JUD4XSUKFWZ', 1097, '0000059', '2019-03-26', 'HBL'),
('6K3Z4J2NRPMNCLH', '2019-03-14', '1', '1', '2', '0', 25000, 'CHQ # 0000060, CHQ Date: 2019-03-31 ( HBL ) ; zeshan', 'HMITTMTF6JUD4XSUKFWZ', 1097, '0000060', '2019-03-31', 'HBL'),
('SDODUOTII6KPB47', '2019-03-14', '1', '1', '2', '0', 25000, 'CHQ # 0000061, CHQ Date: 2019-04-14 ( HBL ) ; zeshan', 'HMITTMTF6JUD4XSUKFWZ', 1097, '0000061', '2019-04-14', 'HBL'),
('TQS4V1PB5L7QXDP', '2019-03-16', '1', '1', '2', '0', 15000, 'CHQ # 0000, CHQ Date: 2019-03-16 ( SUPPLIER CHQ ) ; ezzy paint', 'OGXZWFUZJQGQR8KPCUQF', 1098, '0000', '2019-03-16', 'SUPPLIER CHQ'),
('NCVTCTTGXAUL3FR', '2019-03-16', '1', '1', '2', '0', 15000, 'CHQ # 0000, CHQ Date: 2019-03-25 ( SUPPLIER CHQ ) ; anees paint', 'OGXZWFUZJQGQR8KPCUQF', 1098, '0000', '2019-03-25', 'SUPPLIER CHQ'),
('NRKWJTZKGNAZFC8', '2019-03-18', '1', '1', '2', '0', 40000, 'CHQ # 00000062, CHQ Date: 2019-04-17 ( HBL ) ; zeeshan', 'Q7FR2XS4JI3PV48ANWE2', 1100, '00000062', '2019-04-17', 'HBL'),
('NP26GHKV1M6YSF6', '2019-03-18', '1', '1', '2', '0', 40000, 'CHQ # 16210340, CHQ Date: 2019-03-28 ( MEEZAN ) ; zeeshan', 'Q7FR2XS4JI3PV48ANWE2', 1100, '16210340', '2019-03-28', 'MEEZAN'),
('ILNGQ7FCVEUSDP4', '2019-03-25', '1', '1', '2', '0', 45000, 'CHQ # 10578484, CHQ Date: 2019-03-27 ( HBL ) ; ZESHAN', 'FYYUDE5ZMRGGXLPD4PZL', 1101, '', '0000-00-00', ''),
('34VY2R721P73I48', '2019-03-25', '1', '1', '2', '0', 45000, 'CHQ # 10578485, CHQ Date: 2019-04-12 ( HBL ) ; ZESHAN', 'FYYUDE5ZMRGGXLPD4PZL', 1101, '', '0000-00-00', ''),
('TU7YCRK8BYFLDA2', '2019-03-25', '1', '1', '2', '0', 45000, 'CHQ # 10578486, CHQ Date: 2019-04-18 ( HBL ) ; ZESHAN', 'FYYUDE5ZMRGGXLPD4PZL', 1101, '', '0000-00-00', ''),
('CRMO517HVFEA5S4', '2019-03-25', '1', '1', '2', '0', 45000, 'CHQ # 10578487, CHQ Date: 2019-04-21 ( HBL ) ; ZESHAN', 'FYYUDE5ZMRGGXLPD4PZL', 1101, '', '0000-00-00', ''),
('F25VG52SIW9KOMF', '2019-03-25', '1', '1', '2', '0', 45000, 'CHQ # 10578488, CHQ Date: 2019-04-24 ( HBL ) ; ZESHAN', 'FYYUDE5ZMRGGXLPD4PZL', 1101, '', '0000-00-00', ''),
('K6S4TW8FB13AXT8', '2019-03-25', '1', '1', '2', '0', 45000, 'CHQ # 10578489, CHQ Date: 2019-04-30 ( HBL ) ; ZESHAN', 'FYYUDE5ZMRGGXLPD4PZL', 1101, '', '0000-00-00', ''),
('S437IRXCDFNOJDW', '2019-03-25', '1', '1', '1', '0', 5000, ' ZESHAN', 'FYYUDE5ZMRGGXLPD4PZL', 1101, '', '0000-00-00', ''),
('UAFCAM1173SKVM2', '2019-01-16', '1', '1', '1', '0', 8000, ' CASH', 'AU5YU8HI5RK3ME4ZRSGE', 1103, '', '0000-00-00', ''),
('148RY6GRWS6OAWB', '2019-03-28', '1', '1', '1', '0', 10000, ' zeeshan', 'ZZDE8VQ5MFPC9MZRNP7T', 1104, '', '0000-00-00', ''),
('M41ISMMUC1DUDJ7', '2019-03-28', '1', '1', '2', '0', 9000, 'CHQ # 00054393, CHQ Date: 2019-04-05 ( SUPPLIER CHQ ) ; shareeq rang mahal', 'ZZDE8VQ5MFPC9MZRNP7T', 1104, '', '0000-00-00', ''),
('EP69WI8Y7725NHR', '2019-03-28', '1', '1', '2', '0', 15000, 'CHQ # 05579520, CHQ Date: 2019-04-03 ( SUPPLIER CHQ ) ; anees paint', 'ZZDE8VQ5MFPC9MZRNP7T', 1104, '', '0000-00-00', ''),
('LLD72SG699BEXMI', '2019-03-20', '1', '1', '2', '0', 50000, 'CHQ # 19250561, CHQ Date: 2019-04-16 ( MEEZAN ) ; ', '38G8VAYQUTANT6T7P6NK', 2105, '19250561', '2019-04-16', 'MEEZAN'),
('HQ4P9YLOW7Y1TP5', '2019-03-20', '1', '1', '2', '0', 25000, 'CHQ # 119460453, CHQ Date: 2019-03-24 ( SUPPLIER CHQ ) ; ezzy paints', '38G8VAYQUTANT6T7P6NK', 2105, '119460453', '2019-03-24', 'SUPPLIER CHQ'),
('Z1TNRCKWLARQ44Q', '2019-03-20', '1', '1', '2', '0', 25000, 'CHQ # 00000077, CHQ Date: 2019-03-27 ( SUPPLIER CHQ ) ; new al noor', '38G8VAYQUTANT6T7P6NK', 2105, '00000077', '2019-03-27', 'SUPPLIER CHQ'),
('I6OMK1P7NT9YB1G', '2019-03-25', '1', '1', '2', '0', 36000, 'CHQ # 10578490, CHQ Date: 2019-05-12 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 3106, '10578490', '2019-05-12', 'BANK AL HABIB LIMITED'),
('W9Z1GETA9W8NKLU', '2019-03-25', '1', '1', '2', '0', 36000, 'CHQ # 10578491, CHQ Date: 2019-05-17 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 3106, '10578491', '2019-05-17', 'BANK AL HABIB LIMITED'),
('BM3KT85AN2FGS9Y', '2019-03-25', '1', '1', '2', '0', 36000, 'CHQ # 10578492, CHQ Date: 2019-05-24 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 3106, '10578492', '2019-05-24', 'BANK AL HABIB LIMITED'),
('BYIB6EFZX3F54AA', '2019-03-25', '1', '1', '2', '0', 36000, 'CHQ # 10578493, CHQ Date: 2019-05-31 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 3106, '10578493', '2019-05-31', 'BANK AL HABIB LIMITED'),
('DYQDCLX3JO3YPEI', '2019-03-27', '1', '1', '2', '0', 60000, 'CHQ # 00001043, CHQ Date: 2019-04-06 ( SUPPLIER CHQ ) ; tahir paint', '17ZBKYN9I1UHC9AYDKFA', 4107, '00001043', '2019-04-06', 'SUPPLIER CHQ'),
('FC19YW2VML3GATP', '2019-03-28', '1', '1', '2', '0', 20000, 'CHQ # 119460454, CHQ Date: 2019-04-01 ( SUPPLIER CHQ ) ; ezzy paints', 'Q849P2OLCS1QYZVYV1K7', 5108, '119460454', '2019-04-01', 'SUPPLIER CHQ'),
('613N5N3915FHRVX', '2019-03-25', '1', '1', '2', '0', 35000, 'CHQ # 19250564, CHQ Date: 2019-04-07 ( MEEZAN ) ; zeeshan', 'OIP8LT8QNBS1EXRILD5M', 6109, '19250564', '2019-04-07', 'MEEZAN'),
('E2CGXMMT2VOKDAP', '2019-03-25', '1', '1', '2', '0', 35000, 'CHQ # 19250562, CHQ Date: 2019-04-18 ( MEEZAN ) ; zeeshan', 'OIP8LT8QNBS1EXRILD5M', 6109, '19250562', '2019-04-18', 'MEEZAN'),
('38SSM5TN8RGQW7U', '2019-03-25', '1', '1', '2', '0', 35000, 'CHQ # 19250563, CHQ Date: 2019-04-22 ( MEEZAN ) ; zeeshan', 'OIP8LT8QNBS1EXRILD5M', 6109, '19250563', '2019-04-22', 'MEEZAN'),
('O9RFL85ASE9997K', '2019-03-25', '1', '1', '2', '0', 35000, 'CHQ # 19250565, CHQ Date: 2019-05-10 ( MEEZAN ) ; zeeshan', 'OIP8LT8QNBS1EXRILD5M', 6109, '19250565', '2019-05-10', 'MEEZAN'),
('4QD69VY77GUZBEI', '2019-03-30', '1', '1', '2', '0', 20000, 'CHQ # 10666465, CHQ Date: 2019-04-03 ( SUPPLIER CHQ ) ; subrang', 'D23F97RKV572XU63L93E', 7110, '10666465', '2019-04-03', 'SUPPLIER CHQ'),
('SCROXA8LU519YD9', '2019-03-30', '1', '1', '2', '0', 50000, 'CHQ # 20019712, CHQ Date: 2019-04-20 ( SUPPLIER CHQ ) ; saadb paint', 'D23F97RKV572XU63L93E', 7110, '20019712', '2019-04-20', 'SUPPLIER CHQ'),
('EPMFTM88TK9H1F2', '2019-04-01', '1', '1', '2', '0', 50000, 'CHQ # 19250567, CHQ Date: 2019-04-12 ( MEEZAN ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 8111, '19250567', '2019-04-12', 'MEEZAN'),
('UVC64LZTFQSW1Z4', '2019-04-01', '1', '1', '2', '0', 50000, 'CHQ # 19250568, CHQ Date: 2019-04-20 ( MEEZAN ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 8111, '19250568', '2019-04-20', 'MEEZAN'),
('4TUGYGFUC7FR23Z', '2019-04-01', '1', '1', '2', '0', 50000, 'CHQ # 19250569, CHQ Date: 2019-04-28 ( MEEZAN ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 8111, '19250569', '2019-04-28', 'MEEZAN'),
('E4OQE4WIS5S6FFW', '2019-04-01', '1', '1', '2', '0', 50000, 'CHQ # 10578495, CHQ Date: 2019-04-15 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 8111, '10578495', '2019-04-15', 'BANK AL HABIB LIMITED'),
('EJNX1SVI3SL5VEH', '2019-04-01', '1', '1', '2', '0', 50000, 'CHQ # 10578496, CHQ Date: 2019-04-28 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 8111, '10578496', '2019-04-28', 'BANK AL HABIB LIMITED'),
('NTZC18I4172XC6V', '2019-04-01', '1', '1', '2', '0', 20000, 'CHQ # 0000078, CHQ Date: 2019-04-05 ( SUPPLIER CHQ ) ; new al noor', 'GPL2UPO3UP5JPQ1M6DBX', 9112, '0000078', '2019-04-05', 'SUPPLIER CHQ'),
('HSX42W1QDJ8WT4T', '2019-04-01', '1', '1', '2', '0', 15000, 'CHQ # 05579527, CHQ Date: 2019-04-15 ( SUPPLIER CHQ ) ; anees paint', 'GPL2UPO3UP5JPQ1M6DBX', 9112, '05579527', '2019-04-15', 'SUPPLIER CHQ'),
('XLTEXFIOS6O67EF', '2019-04-17', '1', '1', '1', '0', 10000, ' CASH', 'IP9TWAG6VSVG6NTYP6RF', 9115, '', '0000-00-00', ''),
('6VVTPGCY1U4BGEK', '2019-04-17', '1', '1', '2', '0', 10000, 'CHQ # 19756269, CHQ Date: 2019-05-28 ( MEEZAN ) ; RUNG CORNER', 'IP9TWAG6VSVG6NTYP6RF', 9115, '19756269', '2019-05-28', 'MEEZAN'),
('7CUXMU4VBNM2LTL', '2019-04-18', '1', '1', '1', '0', 10000, ' CASH', 'UOG71LV2MZUSTC69H2Y2', 9116, '', '0000-00-00', ''),
('H3AEVJGZG3OMGAI', '2019-04-18', '1', '1', '2', '0', 10000, 'CHQ # 0000, CHQ Date: 2019-04-28 ( SUPPLIER CHQ ) ; RUNG CORNER', 'UOG71LV2MZUSTC69H2Y2', 9116, '0000', '2019-04-28', 'SUPPLIER CHQ'),
('KYXZNRQVOE57B1K', '2019-04-16', '1', '1', '2', '0', 50000, 'CHQ # 000000, CHQ Date: 2019-05-17 ( BANK AL HABIB LIMITED ) ; ZEESHAN', 'OIP8LT8QNBS1EXRILD5M', 9117, '000000', '2019-05-17', 'BANK AL HABIB LIMITED'),
('AWWNFFYFIMFC98E', '2019-04-16', '1', '1', '2', '0', 50000, 'CHQ # 000000, CHQ Date: 2019-05-30 ( SUPPLIER CHQ ) ; ADNAN PAINT', 'OIP8LT8QNBS1EXRILD5M', 9117, '000000', '2019-05-30', 'SUPPLIER CHQ'),
('ROHC6CIFOYTBMHM', '2019-04-16', '1', '1', '2', '0', 20000, 'CHQ # 0000000, CHQ Date: 2019-04-23 ( SUPPLIER CHQ ) ; NEW AL NOOR', 'KVHAGIB239PCDIU1IFOL', 9118, '0000000', '2019-04-23', 'SUPPLIER CHQ'),
('84AK3CVV869PDS1', '2019-04-16', '1', '1', '2', '0', 27750, 'CHQ # 0000000, CHQ Date: 2019-05-01 ( SUPPLIER CHQ ) ; HI FI', 'KVHAGIB239PCDIU1IFOL', 9118, '0000000', '2019-05-01', 'SUPPLIER CHQ'),
('TLGZPTQWY7T6VOA', '2019-04-16', '1', '1', '1', '0', 2250, ' CASH', 'KVHAGIB239PCDIU1IFOL', 9118, '', '0000-00-00', ''),
('RHLX9FP1TGLRA6Y', '2019-04-15', '1', '1', '2', '0', 15000, 'CHQ # 0000000, CHQ Date: 2019-04-19 ( SUPPLIER CHQ ) ; HI FI', '73841H2DMU823SWSFEI3', 9119, '0000000', '2019-04-19', 'SUPPLIER CHQ'),
('WHG5E6IQ2MSUG5H', '2019-04-15', '1', '1', '2', '0', 25000, 'CHQ # 0000200, CHQ Date: 2019-04-20 ( HBL ) ; ZEESHAN', 'GPL2UPO3UP5JPQ1M6DBX', 9120, '0000200', '2019-04-20', 'HBL'),
('VT82GKY7XYTIHIU', '2019-04-15', '1', '1', '2', '0', 25000, 'CHQ # 0000201, CHQ Date: 2019-04-27 ( HBL ) ; ZEESHAN', 'GPL2UPO3UP5JPQ1M6DBX', 9120, '0000201', '2019-04-27', 'HBL'),
('99IB3FGOYTS628G', '2019-04-15', '1', '1', '2', '0', 33250, 'CHQ # 0000202, CHQ Date: 2019-05-12 ( HBL ) ; ZEESHAN', 'GPL2UPO3UP5JPQ1M6DBX', 9120, '0000202', '2019-05-12', 'HBL'),
('Q1MIZMR445JO3RB', '2019-04-15', '1', '1', '2', '0', 30000, 'CHQ # 000000, CHQ Date: 2019-05-03 ( SUPPLIER CHQ ) ; WALL STAR', '1GD2IMOWSFWPSCZD35DQ', 9121, '000000', '2019-05-03', 'SUPPLIER CHQ'),
('BNHX55J9PWHBMN8', '2019-04-15', '1', '1', '1', '0', 20000, ' CASH', '1GD2IMOWSFWPSCZD35DQ', 9121, '', '0000-00-00', ''),
('GTP5NOR1JKVHCLG', '2019-04-20', '1', '1', '2', '0', 40000, 'CHQ # 10266448, CHQ Date: 2019-04-28 ( SUPPLIER CHQ ) ; EZZY PAINT', 'Q7FR2XS4JI3PV48ANWE2', 9122, '10266448', '2019-04-28', 'SUPPLIER CHQ'),
('H768BNMY69C7KY2', '2019-04-20', '1', '1', '2', '0', 12600, 'CHQ # 00221662, CHQ Date: 2019-04-25 ( SUPPLIER CHQ ) ; ADNAN GULZAR E HIJRI', 'Q7FR2XS4JI3PV48ANWE2', 9122, '00221662', '2019-04-25', 'SUPPLIER CHQ'),
('LAZDEC29UB6B3D5', '2019-04-23', '1', '1', '2', '0', 40000, 'CHQ # 10266449, CHQ Date: 2019-05-09 ( SUPPLIER CHQ ) ; EZZY PAINT', 'Q849P2OLCS1QYZVYV1K7', 9123, '10266449', '2019-05-09', 'SUPPLIER CHQ'),
('2W59J43KBAEBHNJ', '2019-04-16', '1', '1', '2', '0', 25000, 'CHQ # 000000, CHQ Date: 2019-04-18 ( SUPPLIER CHQ ) ; AGHA PAINT', 'HMITTMTF6JUD4XSUKFWZ', 9124, '000000', '2019-04-18', 'SUPPLIER CHQ'),
('4NXXGFEJ5F8LFL9', '2019-04-16', '1', '1', '2', '0', 25000, 'CHQ # 000000, CHQ Date: 2019-04-30 ( SUPPLIER CHQ ) ; AGHA PAINT', 'HMITTMTF6JUD4XSUKFWZ', 9124, '000000', '2019-04-30', 'SUPPLIER CHQ'),
('1KUKD76LW96LYFY', '2019-04-16', '1', '1', '2', '0', 23800, 'CHQ # 000000, CHQ Date: 2019-05-12 ( MEEZAN ) ; ZEESHAN', 'HMITTMTF6JUD4XSUKFWZ', 9124, '000000', '2019-05-12', 'MEEZAN'),
('9RWA5DPA5JXO1L6', '2019-04-16', '1', '1', '2', '0', 26000, 'CHQ # 000000, CHQ Date: 2019-05-13 ( SUPPLIER CHQ ) ; AL MAKKAH PAINT (GP)', 'HMITTMTF6JUD4XSUKFWZ', 9124, '000000', '2019-05-13', 'SUPPLIER CHQ'),
('KXZYVQQC92RRPX8', '2019-04-15', '1', '1', '2', '0', 20000, 'CHQ # 05579533, CHQ Date: 2019-04-26 ( SUPPLIER CHQ ) ; ANEES PAINT', 'XOLLVIVKD7CEEFLQEPQN', 9125, '05579533', '2019-04-26', 'SUPPLIER CHQ'),
('ND6MCFGUEEAMNF4', '2019-04-27', '1', '1', '2', '0', 36760, 'CHQ # 36535205, CHQ Date: 2019-06-30 ( BANK AL FALAH ) ; ZEESHAN', '8EM2GUI7NF8JLN7BK56L', 9126, '36535205', '2019-06-30', 'BANK AL FALAH'),
('ICH7MW9XQESQWXF', '2019-04-27', '1', '1', '2', '0', 40000, 'CHQ # 10266449, CHQ Date: 2019-05-20 ( SUPPLIER CHQ ) ; EZZY PAINT (BAH)', '8EM2GUI7NF8JLN7BK56L', 9126, '10266449', '2019-05-20', 'SUPPLIER CHQ'),
('79JQXY81E2CC49C', '2019-04-25', '1', '1', '2', '0', 20000, 'CHQ # 10602330, CHQ Date: 2019-05-08 ( SUPPLIER CHQ ) ; GHOSIA PAINT', 'WYU7GK7FHY1AFSA8DAHK', 9127, '10602330', '2019-05-08', 'SUPPLIER CHQ'),
('EKAFLGJOBMN8ZMQ', '2019-04-29', '1', '1', '2', '0', 40000, 'CHQ # 10266450, CHQ Date: 2019-05-30 ( SUPPLIER CHQ ) ; EZZY PAINTS', 'OGXZWFUZJQGQR8KPCUQF', 9128, '10266450', '2019-05-30', 'SUPPLIER CHQ'),
('CFWC56MO49DPOA1', '2019-04-29', '1', '1', '2', '0', 40000, 'CHQ # 10266451, CHQ Date: 2019-06-10 ( SUPPLIER CHQ ) ; EZZY PAINTS', 'GPL2UPO3UP5JPQ1M6DBX', 9129, '10266451', '2019-06-10', 'SUPPLIER CHQ'),
('VX3B8V4FUZYTUAE', '2019-04-29', '1', '1', '2', '0', 40000, 'CHQ # 10266452, CHQ Date: 2019-06-20 ( SUPPLIER CHQ ) ; EZZY PAINTS', 'GPL2UPO3UP5JPQ1M6DBX', 9129, '10266452', '2019-06-20', 'SUPPLIER CHQ'),
('IDUECLK9FZIZHCE', '2019-04-08', '1', '1', '2', '0', 20000, 'CHQ # 000000, CHQ Date: 2019-04-10 ( SUPPLIER CHQ ) ; MUNEER PAINT', 'PN6D6ZWHZOE6GNNVVE8E', 9130, '000000', '2019-04-10', 'SUPPLIER CHQ'),
('OD2RQMX9EVD9CHT', '2019-04-18', '1', '1', '2', '0', 50000, 'CHQ # 11878550, CHQ Date: 2019-04-27 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9131, '11878550', '2019-04-27', 'BANK AL HABIB LIMITED');
INSERT INTO `transection` (`transaction_id`, `date_of_transection`, `transection_type`, `transection_category`, `transection_mood`, `amount`, `pay_amount`, `description`, `relation_id`, `voucher_id`, `cheque_no`, `cheque_date`, `bank_name`) VALUES
('EY589KPLQO3BY1H', '2019-04-18', '1', '1', '2', '0', 50000, 'CHQ # 36535204, CHQ Date: 2019-05-31 ( BANK AL FALAH ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9131, '36535204', '2019-05-31', 'BANK AL FALAH'),
('F92AUIMLJ37AHN7', '2019-04-18', '1', '1', '2', '0', 50000, 'CHQ # 36535203, CHQ Date: 2019-05-26 ( BANK AL FALAH ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9131, '36535203', '2019-05-26', 'BANK AL FALAH'),
('JNWJ86ZU9LYCR2H', '2019-04-18', '1', '1', '2', '0', 50000, 'CHQ # 36535202, CHQ Date: 2019-05-19 ( BANK AL FALAH ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9131, '36535202', '2019-05-19', 'BANK AL FALAH'),
('XCPYJPLQQML8D16', '2019-04-18', '1', '1', '2', '0', 50000, 'CHQ # 36535201, CHQ Date: 2019-05-14 ( BANK AL FALAH ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9131, '36535201', '2019-05-14', 'BANK AL FALAH'),
('OFN3NBF5SNT44J4', '2019-05-02', '1', '1', '2', '0', 50000, 'CHQ # 00000, CHQ Date: 2019-06-30 ( SUPPLIER CHQ ) ; ADNAN PAINT', '8EC45YB7SSBDHR45SUYQ', 9132, '00000', '2019-06-30', 'SUPPLIER CHQ'),
('SDUXNI8JR1R56OK', '2019-05-02', '1', '1', '2', '0', 40000, 'CHQ # 00000, CHQ Date: 2019-06-30 ( SUPPLIER CHQ ) ; EZZY PAINT', '8EC45YB7SSBDHR45SUYQ', 9132, '00000', '2019-06-30', 'SUPPLIER CHQ'),
('8PDG8JMUKDJZLTI', '2019-05-02', '1', '1', '2', '0', 20000, 'CHQ # 00000, CHQ Date: 2019-05-07 ( SUPPLIER CHQ ) ; NEW AL NOOR PAINT', '8EC45YB7SSBDHR45SUYQ', 9132, '00000', '2019-05-07', 'SUPPLIER CHQ'),
('TOLOR4AR6Q8HGN4', '2019-05-02', '1', '1', '2', '0', 25000, 'CHQ # 00000, CHQ Date: 2019-05-13 ( SUPPLIER CHQ ) ; SAAD PAINT', '8EC45YB7SSBDHR45SUYQ', 9132, '00000', '2019-05-13', 'SUPPLIER CHQ'),
('T3PXZN8ZN3P8ZXH', '2019-05-03', '1', '1', '2', '0', 35000, 'CHQ # 19250572, CHQ Date: 2019-05-18 ( MEEZAN ) ; ZEESHAN', 'D23F97RKV572XU63L93E', 9133, '19250572', '2019-05-18', 'MEEZAN'),
('Z9QW6H5GJFFOAAJ', '2019-05-03', '1', '1', '2', '0', 35000, 'CHQ # 19250573, CHQ Date: 2019-05-31 ( MEEZAN ) ; ZEESHAN', 'D23F97RKV572XU63L93E', 9133, '19250573', '2019-05-31', 'MEEZAN'),
('6M7T6U2WWWX848S', '2019-05-10', '1', '1', '2', '0', 13275, 'CHQ # A-22272082, CHQ Date: 2019-05-25 ( MEEZAN ) ; ZEESHAN', 'UOG71LV2MZUSTC69H2Y2', 9134, 'A-22272082', '2019-05-25', 'MEEZAN'),
('E5ZXDXNB2J1AKWX', '2019-05-10', '1', '1', '2', '0', 10000, 'CHQ # 10022752, CHQ Date: 2019-05-30 ( BANK AL HABIB LIMITED ) ; ZEESHAN', 'UOG71LV2MZUSTC69H2Y2', 9134, '10022752', '2019-05-30', 'BANK AL HABIB LIMITED'),
('9BSMNPD2SKY7RU7', '2019-05-10', '1', '1', '2', '0', 10000, 'CHQ # 06813283, CHQ Date: 2019-05-20 ( SUPPLIER CHQ ) ; KUSHAL BANK/RATO DAIRO', 'UOG71LV2MZUSTC69H2Y2', 9134, '06813283', '2019-05-20', 'SUPPLIER CHQ'),
('4ITSV82S3B63H8Y', '2019-05-09', '1', '1', '2', '0', 30000, 'CHQ # 19071273, CHQ Date: 2019-05-15 ( SUPPLIER CHQ ) ; NEW AL NOOR/SILK BANK', '8EM2GUI7NF8JLN7BK56L', 9135, '19071273', '2019-05-15', 'SUPPLIER CHQ'),
('6CECKJISMRHV5W5', '2019-05-09', '1', '1', '2', '0', 15000, 'CHQ # 00122443, CHQ Date: 2019-05-28 ( SUPPLIER CHQ ) ; AL-MAKKAH/BANK ISLAMI', '8EM2GUI7NF8JLN7BK56L', 9135, '00122443', '2019-05-28', 'SUPPLIER CHQ'),
('7UTHENLK2P14GMC', '2019-05-09', '1', '1', '2', '0', 15000, 'CHQ # 000122442, CHQ Date: 2019-05-18 ( SUPPLIER CHQ ) ; AL-MADINA PAINT/BANK ISLAMI', '8EM2GUI7NF8JLN7BK56L', 9135, '000122442', '2019-05-18', 'SUPPLIER CHQ'),
('YD8V6JPVJODWLHX', '2019-05-09', '1', '1', '2', '0', 50000, 'CHQ # 02515035, CHQ Date: 2019-05-23 ( SUPPLIER CHQ ) ; JHULAY LAL/KHUSHALL BANK', '8EM2GUI7NF8JLN7BK56L', 9135, '02515035', '2019-05-23', 'SUPPLIER CHQ'),
('KLY7XIVHQJK34YS', '2019-05-09', '1', '1', '2', '0', 50000, 'CHQ # A-19250574, CHQ Date: 2019-05-23 ( MEEZAN ) ; ZEESHAN', '8EM2GUI7NF8JLN7BK56L', 9135, 'A-19250574', '2019-05-23', 'MEEZAN'),
('2IS2TOZKFL4VROV', '2019-05-09', '1', '1', '2', '0', 50000, 'CHQ # A-19250575, CHQ Date: 2019-05-15 ( MEEZAN ) ; ZEESHAN', '8EM2GUI7NF8JLN7BK56L', 9135, 'A-19250575', '2019-05-15', 'MEEZAN'),
('WZP6B4SXHEELQ76', '2019-05-13', '1', '1', '2', '0', 60000, 'CHQ # 53495451, CHQ Date: 2019-05-28 ( SUPPLIER CHQ ) ; shehzad al hussaini MPM', '17ZBKYN9I1UHC9AYDKFA', 9136, '53495451', '2019-05-28', 'SUPPLIER CHQ'),
('K3LR1SD8JN24JEE', '2019-05-14', '1', '1', '2', '0', 42000, 'CHQ # 000000, CHQ Date: 2019-06-18 ( MEEZAN ) ; ZEESHAN', 'ZZDE8VQ5MFPC9MZRNP7T', 9137, '000000', '2019-06-18', 'MEEZAN'),
('12CPJ1UDMPCA3R6', '2019-05-15', '1', '1', '2', '0', 15000, 'CHQ # 10022757, CHQ Date: 2019-05-26 ( BANK AL HABIB LIMITED ) ; ZEESHAN', 'PN6D6ZWHZOE6GNNVVE8E', 9138, '10022757', '2019-05-26', 'BANK AL HABIB LIMITED'),
('IY5XM9KEXA5XY8O', '2019-05-15', '1', '1', '2', '0', 8000, 'CHQ # 000000, CHQ Date: 2019-05-26 ( SUPPLIER CHQ ) ; ARSALAN PAINT', 'PN6D6ZWHZOE6GNNVVE8E', 9138, '000000', '2019-05-26', 'SUPPLIER CHQ'),
('WXIIUDK8QACAD4T', '2019-05-21', '1', '1', '2', '0', 40000, 'CHQ # 10266451, CHQ Date: 2019-06-19 ( SUPPLIER CHQ ) ; EZZY PAINT', 'HMITTMTF6JUD4XSUKFWZ', 9139, '10266451', '2019-06-19', 'SUPPLIER CHQ'),
('9WO79KMFKW1Z95E', '2019-05-21', '1', '1', '1', '0', 4350, ' CASH', 'HMITTMTF6JUD4XSUKFWZ', 9139, '', '0000-00-00', ''),
('KJHHIQY6Z2NXRH7', '2019-05-21', '1', '1', '2', '0', 17000, 'CHQ # 10022891, CHQ Date: 2019-05-30 ( SUPPLIER CHQ ) ; ASHRAFI PAINT (BAHL)', 'HMITTMTF6JUD4XSUKFWZ', 9139, '', '0000-00-00', ''),
('US5MPJZX42QFI7L', '2019-05-21', '1', '1', '2', '0', 50000, 'CHQ # 19250578, CHQ Date: 2019-06-16 ( MEEZAN ) ; ZEESHAN', 'HMITTMTF6JUD4XSUKFWZ', 9139, '', '0000-00-00', ''),
('XJ6OBQZUL676AC2', '2019-05-20', '1', '1', '2', '0', 40000, 'CHQ # 0000065, CHQ Date: 2019-05-25 ( HBL ) ; ZEESHAN', 'Q7FR2XS4JI3PV48ANWE2', 9140, '0000065', '2019-05-25', 'HBL'),
('JMKJB3Z5V6DARTB', '2019-05-20', '1', '1', '1', '0', 10000, ' CASH', 'Q7FR2XS4JI3PV48ANWE2', 9140, '', '0000-00-00', ''),
('MEON7DSOR5MJU8B', '2019-05-20', '1', '1', '2', '0', 100000, 'CHQ # 5492658, CHQ Date: 2019-06-10 ( SUPPLIER CHQ ) ; RAO JAVEED/SANGHAR', 'OIP8LT8QNBS1EXRILD5M', 9141, '5492658', '2019-06-10', 'SUPPLIER CHQ'),
('F6DKZPH7N44JLMX', '2019-05-20', '1', '1', '2', '0', 40400, 'CHQ # A-19250580, CHQ Date: 2019-06-23 ( MEEZAN ) ; ZEESHAN', 'OIP8LT8QNBS1EXRILD5M', 9141, 'A-19250580', '2019-06-23', 'MEEZAN'),
('7DOKTTX3LGALSPX', '2019-05-22', '1', '1', '1', '0', 5000, ' CASH', 'AU5YU8HI5RK3ME4ZRSGE', 9142, '', '0000-00-00', ''),
('6X5NCCP3S49AEHH', '2019-05-22', '1', '1', '2', '0', 5000, 'CHQ # 00000, CHQ Date: 2019-06-04 ( SUPPLIER CHQ ) ; QADRI PAINT', 'AU5YU8HI5RK3ME4ZRSGE', 9142, '00000', '2019-06-04', 'SUPPLIER CHQ'),
('1BNDKDIU1R8AA5J', '2019-05-23', '1', '1', '2', '0', 20000, 'CHQ # 000000, CHQ Date: 2019-05-30 ( SUPPLIER CHQ ) ; NEW AL NOOR (SILK BANK)', 'GPL2UPO3UP5JPQ1M6DBX', 9143, '000000', '2019-05-30', 'SUPPLIER CHQ'),
('94VMP1RL4D5NB9B', '2019-05-23', '1', '1', '2', '0', 15000, 'CHQ # 00000693, CHQ Date: 2019-05-21 ( SUPPLIER CHQ ) ; SUBHAN.A PAINT (HBL)', 'GPL2UPO3UP5JPQ1M6DBX', 9143, '00000693', '2019-05-21', 'SUPPLIER CHQ'),
('CYG2T3GRMFS9MZW', '2019-05-28', '1', '1', '2', '0', 20000, 'CHQ # 0000004, CHQ Date: 2019-05-28 ( SUPPLIER CHQ ) ; SAAD PAINT', 'UOG71LV2MZUSTC69H2Y2', 9144, '0000004', '2019-05-28', 'SUPPLIER CHQ'),
('T7Q3SZBV196X1D6', '2019-05-24', '1', '1', '2', '0', 10000, 'CHQ # 06813282, CHQ Date: 2019-06-05 ( SUPPLIER CHQ ) ; KUSHAL BANK', 'IP9TWAG6VSVG6NTYP6RF', 9145, '06813282', '2019-06-05', 'SUPPLIER CHQ'),
('PLQPO6PXI44XJVB', '2019-05-24', '1', '1', '1', '0', 15000, ' CASH', 'IP9TWAG6VSVG6NTYP6RF', 9145, '', '0000-00-00', ''),
('UPXBPGXIDY8FEKR', '2019-05-29', '1', '1', '2', '0', 30900, 'CHQ # 85645374, CHQ Date: 2019-06-07 ( SUPPLIER CHQ ) ; HUSSIANABAD FARHAN', 'KVHAGIB239PCDIU1IFOL', 9146, '85645374', '2019-06-07', 'SUPPLIER CHQ'),
('L1VHKY7U6E54DI8', '2019-06-03', '1', '1', '1', '0', 15000, ' CASH', 'VU49HVTLNZGLY8DJFOXN', 9147, '', '0000-00-00', ''),
('XDYM5JJ81PMM6JP', '2019-06-11', '1', '1', '2', '0', 75000, 'CHQ # 1350326620, CHQ Date: 2019-06-30 ( SUPPLIER CHQ ) ; MEHRAN PAINTS', 'FYYUDE5ZMRGGXLPD4PZL', 9148, '1350326620', '2019-06-30', 'SUPPLIER CHQ'),
('4YZMM9E9Z1CGJ4M', '2019-06-11', '1', '1', '2', '0', 49000, 'CHQ # 19250584, CHQ Date: 2019-07-14 ( MEEZAN ) ; ZEESHAN', 'FYYUDE5ZMRGGXLPD4PZL', 9148, '', '0000-00-00', ''),
('HIDT91EVNBGIHIW', '2019-06-11', '1', '1', '2', '0', 50000, 'CHQ # 19250581, CHQ Date: 2019-06-23 ( MEEZAN ) ; ZEESHAN', 'FYYUDE5ZMRGGXLPD4PZL', 9148, '', '0000-00-00', ''),
('Z5EJ7GLOHOREXTN', '2019-06-11', '1', '1', '2', '0', 50000, 'CHQ # 19250583, CHQ Date: 2019-06-30 ( MEEZAN ) ; ZEESHAN', 'FYYUDE5ZMRGGXLPD4PZL', 9148, '', '0000-00-00', ''),
('8ZB6WI7OKC85FHL', '2019-06-11', '1', '1', '2', '0', 50000, 'CHQ # 19250582, CHQ Date: 2019-06-27 ( MEEZAN ) ; ZEESHAN', 'FYYUDE5ZMRGGXLPD4PZL', 9148, '', '0000-00-00', ''),
('X3JW4LI18EAYJ6P', '2019-06-11', '1', '1', '2', '0', 40000, 'CHQ # 10266454, CHQ Date: 2019-07-10 ( SUPPLIER CHQ ) ; BAHL/EZZY PAINT', 'FYYUDE5ZMRGGXLPD4PZL', 9148, '', '0000-00-00', ''),
('U3LRRDK7N355Y3B', '2019-06-11', '1', '1', '2', '0', 40000, 'CHQ # 10266456, CHQ Date: 2019-07-30 ( SUPPLIER CHQ ) ; BAHL/EZZY PAINT', 'FYYUDE5ZMRGGXLPD4PZL', 9148, '', '0000-00-00', ''),
('U9EJG4E82XD3Z4J', '2019-06-10', '1', '1', '2', '0', 25000, 'CHQ # 000000, CHQ Date: 2019-07-24 ( SUPPLIER CHQ ) ; ALLIED BANK/MEHRAN PAINT', 'WYU7GK7FHY1AFSA8DAHK', 9149, '000000', '2019-07-24', 'SUPPLIER CHQ'),
('FOTYEQ2UXA8UANA', '2019-06-12', '1', '1', '2', '0', 20000, 'CHQ # 120986256, CHQ Date: 2019-06-24 ( SUPPLIER CHQ ) ; SAAD PAINT/HABIB METRO BANK', '8EM2GUI7NF8JLN7BK56L', 9150, '120986256', '2019-06-24', 'SUPPLIER CHQ'),
('7L8EBC52OTPDILH', '2019-06-12', '1', '1', '2', '0', 150000, 'CHQ # 52800334, CHQ Date: 2019-06-24 ( SUPPLIER CHQ ) ; NEW AL NOOR PAINT/ALLIED BANK', '8EM2GUI7NF8JLN7BK56L', 9150, '52800334', '2019-06-24', 'SUPPLIER CHQ'),
('4GWC3EQGU61YL5S', '2019-06-19', '1', '1', '2', '0', 30000, 'CHQ # 10614534, CHQ Date: 2019-06-25 ( BANK AL HABIB LIMITED ) ; ZEESHAN', 'HMITTMTF6JUD4XSUKFWZ', 9151, '10614534', '2019-06-25', 'BANK AL HABIB LIMITED'),
('P2QWB95OM421GRO', '2019-06-19', '1', '1', '2', '0', 30000, 'CHQ # 10614533, CHQ Date: 2019-06-20 ( BANK AL HABIB LIMITED ) ; ZEESHAN', 'HMITTMTF6JUD4XSUKFWZ', 9151, '10614533', '2019-06-20', 'BANK AL HABIB LIMITED'),
('FQAGZLDA9IPEOY7', '2019-06-19', '1', '1', '2', '0', 30000, 'CHQ # 10614535, CHQ Date: 2019-06-30 ( BANK AL HABIB LIMITED ) ; ZEESHAN', 'HMITTMTF6JUD4XSUKFWZ', 9151, '10614535', '2019-06-30', 'BANK AL HABIB LIMITED'),
('G1HLRQAZ7OB616X', '2019-06-19', '1', '1', '1', '0', 10000, ' ZEESHAN', 'HMITTMTF6JUD4XSUKFWZ', 9151, '', '0000-00-00', ''),
('LYZOBEO9BXTP1G9', '2019-06-17', '1', '1', '2', '0', 42750, 'CHQ # 19250586, CHQ Date: 2019-06-28 ( MEEZAN ) ; ZEESHAN', '17ZBKYN9I1UHC9AYDKFA', 9152, '19250586', '2019-06-28', 'MEEZAN'),
('13IFV2HK3CQEZL1', '2019-06-17', '1', '1', '2', '0', 60000, 'CHQ # 19250587, CHQ Date: 2019-06-18 ( MEEZAN ) ; ZEESHAN', '17ZBKYN9I1UHC9AYDKFA', 9152, '19250587', '2019-06-18', 'MEEZAN'),
('XJFGIMTATYRNVLN', '2019-06-17', '1', '1', '2', '0', 25510, 'CHQ # 19250588, CHQ Date: 2019-07-10 ( MEEZAN ) ; ZEESHAN', '17ZBKYN9I1UHC9AYDKFA', 9152, '19250588', '2019-07-10', 'MEEZAN'),
('MG4GN3BYXIVGB3N', '2019-06-21', '1', '1', '2', '0', 12000, 'CHQ # 067252, CHQ Date: 2019-06-22 ( SUPPLIER CHQ ) ; SUB RANG/ASKARI', 'KVHAGIB239PCDIU1IFOL', 9153, '067252', '2019-06-22', 'SUPPLIER CHQ'),
('SROWOU3SRCD9CVQ', '2019-06-21', '1', '1', '2', '0', 15000, 'CHQ # 1721753855, CHQ Date: 2019-06-20 ( SUPPLIER CHQ ) ; SUB RANG/MCB', 'KVHAGIB239PCDIU1IFOL', 9153, '1721753855', '2019-06-20', 'SUPPLIER CHQ'),
('R3513EEC8QQ6F2Y', '2019-06-21', '1', '1', '2', '0', 9000, 'CHQ # 10232677, CHQ Date: 2019-06-22 ( SUPPLIER CHQ ) ; SUB RANG/BAHL', 'KVHAGIB239PCDIU1IFOL', 9153, '10232677', '2019-06-22', 'SUPPLIER CHQ'),
('RKWX3WEV4YULMKQ', '2019-06-17', '1', '1', '2', '0', 25000, 'CHQ # 00122444, CHQ Date: 2019-06-25 ( SUPPLIER CHQ ) ; ', '2DMS8EDL11ISWULICZDE', 9154, '00122444', '2019-06-25', 'SUPPLIER CHQ'),
('U6GXK4V8KYAFMA7', '2019-06-17', '1', '1', '2', '0', 20000, 'CHQ # 19071284, CHQ Date: 2019-06-25 ( SUPPLIER CHQ ) ; NEW AL NOOR', '2DMS8EDL11ISWULICZDE', 9154, '19071284', '2019-06-25', 'SUPPLIER CHQ'),
('YTVSV8ZMIQYNXM6', '2019-06-17', '1', '1', '2', '0', 34377, 'CHQ # 19250585, CHQ Date: 2019-06-28 ( SUPPLIER CHQ ) ; ZEESHAN', '2DMS8EDL11ISWULICZDE', 9154, '19250585', '2019-06-28', 'SUPPLIER CHQ'),
('8EG4KGFUZDAUSMC', '2019-06-24', '1', '1', '2', '0', 7000, 'CHQ # 80585671, CHQ Date: 2019-06-16 ( SUPPLIER CHQ ) ; SUBRANG', 'UOG71LV2MZUSTC69H2Y2', 9155, '80585671', '2019-06-16', 'SUPPLIER CHQ'),
('81ZENKHN6YTXQ2B', '2019-06-24', '1', '1', '2', '0', 5000, 'CHQ # 19128588, CHQ Date: 2019-06-18 ( SUPPLIER CHQ ) ; SUBRANG', 'UOG71LV2MZUSTC69H2Y2', 9155, '19128588', '2019-06-18', 'SUPPLIER CHQ'),
('S1ZRZ8UIOQGEMZR', '2019-06-24', '1', '1', '2', '0', 5000, 'CHQ # 10900469, CHQ Date: 2019-06-29 ( SUPPLIER CHQ ) ; QADRI PAINT/SHAH FAISAL', 'UOG71LV2MZUSTC69H2Y2', 9155, '10900469', '2019-06-29', 'SUPPLIER CHQ'),
('A847OPA1I4V7Q63', '2019-06-24', '1', '1', '1', '0', 3000, ' QADRI PAINT/SHAH FAISAL', 'UOG71LV2MZUSTC69H2Y2', 9155, '', '0000-00-00', ''),
('57WHG6VCOOFR967', '2019-06-25', '1', '1', '2', '0', 20000, 'CHQ # 19071285, CHQ Date: 2019-07-02 ( SUPPLIER CHQ ) ; NEW AL NOOR PAINT', 'AU5YU8HI5RK3ME4ZRSGE', 9156, '19071285', '2019-07-02', 'SUPPLIER CHQ'),
('SQWEIXCZ7VBSDHM', '2019-06-24', '1', '1', '2', '0', 50000, 'CHQ # 10614541, CHQ Date: 2019-07-13 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9157, '10614541', '2019-07-13', 'BANK AL HABIB LIMITED'),
('J6M7GHYD6TLCK48', '2019-06-24', '1', '1', '2', '0', 50000, 'CHQ # 10614542, CHQ Date: 2019-07-18 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9157, '10614542', '2019-07-18', 'BANK AL HABIB LIMITED'),
('PEMCFQDRKLZV2W1', '2019-06-24', '1', '1', '2', '0', 50000, 'CHQ # 10614543, CHQ Date: 2019-07-23 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9157, '10614543', '2019-07-23', 'BANK AL HABIB LIMITED'),
('1EZLJ8XYUR8IOER', '2019-06-24', '1', '1', '2', '0', 50000, 'CHQ # 10614544, CHQ Date: 2019-07-31 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9157, '10614544', '2019-07-31', 'BANK AL HABIB LIMITED'),
('W65FVKQBL6TP68V', '2019-06-25', '1', '1', '1', '0', 19750, ' CASH', 'WH74CL4U9NF73DU6SHHP', 9158, '', '0000-00-00', ''),
('RKO4YMWMQ39WIC3', '2019-06-22', '1', '1', '2', '0', 10000, 'CHQ # 24205915, CHQ Date: 2019-06-26 ( SUPPLIER CHQ ) ; SUBRANG (MCB)', 'Q849P2OLCS1QYZVYV1K7', 9159, '24205915', '2019-06-26', 'SUPPLIER CHQ'),
('U4R5FNVF2N6TNF5', '2019-06-22', '1', '1', '2', '0', 20000, 'CHQ # 00000208, CHQ Date: 2019-06-11 ( SUPPLIER CHQ ) ; HBL (ESSA PAINT)', 'Q849P2OLCS1QYZVYV1K7', 9159, '00000208', '2019-06-11', 'SUPPLIER CHQ'),
('TL1DKNOMIFBIA3P', '2019-06-22', '1', '1', '2', '0', 12875, 'CHQ # 22272086, CHQ Date: 2019-06-30 ( SUPPLIER CHQ ) ; MEEZAN (SHAKEEL)', 'Q849P2OLCS1QYZVYV1K7', 9159, '22272086', '2019-06-30', 'SUPPLIER CHQ'),
('J8CDC4OGNHC1NE5', '2019-06-22', '1', '1', '1', '0', 1075, ' CASH', 'Q849P2OLCS1QYZVYV1K7', 9159, '', '0000-00-00', ''),
('WBVIYGKP4MZRSSO', '2019-06-26', '1', '1', '2', '0', 35000, 'CHQ # 10614545, CHQ Date: 2019-07-10 ( BANK AL HABIB LIMITED ) ; ZEESHAN', 'Q7FR2XS4JI3PV48ANWE2', 9160, '10614545', '2019-07-10', 'BANK AL HABIB LIMITED'),
('6ZF1G4JSPX7D3XM', '2019-06-26', '1', '1', '2', '0', 20000, 'CHQ # 120986265, CHQ Date: 2019-07-09 ( SUPPLIER CHQ ) ; SAAD PAINT/HABIB METRO BANK', 'Q7FR2XS4JI3PV48ANWE2', 9160, '120986265', '2019-07-09', 'SUPPLIER CHQ'),
('U7X65HISQFYDAWZ', '2019-06-27', '1', '1', '2', '0', 20000, 'CHQ # 000000, CHQ Date: 2019-07-29 ( SUPPLIER CHQ ) ; GHOSIA PAINTS', 'PN6D6ZWHZOE6GNNVVE8E', 9161, '000000', '2019-07-29', 'SUPPLIER CHQ'),
('S5AK4LX7XES5M2V', '2019-06-27', '1', '1', '2', '0', 50000, 'CHQ # 10614546, CHQ Date: 2019-07-01 ( BANK AL HABIB LIMITED ) ; ZEESHAN', 'OIP8LT8QNBS1EXRILD5M', 9162, '10614546', '2019-07-01', 'BANK AL HABIB LIMITED'),
('N4GASALD8XCKXGL', '2019-06-27', '1', '1', '2', '0', 50000, 'CHQ # 00000042, CHQ Date: 2019-07-01 ( SUPPLIER CHQ ) ; HBL/ADNAN', 'OIP8LT8QNBS1EXRILD5M', 9162, '00000042', '2019-07-01', 'SUPPLIER CHQ'),
('FY6DE2C8ME75QHA', '2019-06-27', '1', '1', '1', '0', 2000, ' CASH', 'OIP8LT8QNBS1EXRILD5M', 9162, '', '0000-00-00', ''),
('Y1DH9HAXUKV1XAG', '2019-06-28', '1', '1', '2', '0', 9000, 'CHQ # 21947414, CHQ Date: 2019-07-09 ( SUPPLIER CHQ ) ; ALLIED BANK/M.A PAINTS G.H)', 'D68TC2VDP9CL8M6165T1', 9163, '21947414', '2019-07-09', 'SUPPLIER CHQ'),
('GUWT4CXZHDT7P93', '2019-06-28', '1', '1', '2', '0', 5000, 'CHQ # 10900473, CHQ Date: 2019-07-11 ( SUPPLIER CHQ ) ; BAHL/QADRI PAINTS', 'D68TC2VDP9CL8M6165T1', 9163, '10900473', '2019-07-11', 'SUPPLIER CHQ'),
('6W6P98L232A5RDX', '2019-06-28', '1', '1', '2', '0', 15000, 'CHQ # 0105160, CHQ Date: 2019-07-13 ( SUPPLIER CHQ ) ; ASKARI BANK/ARSALAN PAINTS', 'D68TC2VDP9CL8M6165T1', 9163, '0105160', '2019-07-13', 'SUPPLIER CHQ'),
('GY5BHXXNXEFLE1N', '2019-06-28', '1', '1', '1', '0', 1000, ' CASH', 'D68TC2VDP9CL8M6165T1', 9163, '', '0000-00-00', ''),
('8WHEULT6GE7WN25', '2019-07-04', '1', '1', '2', '0', 20000, 'CHQ # 19071283, CHQ Date: 2019-07-10 ( SUPPLIER CHQ ) ; NEW AL NOOR PAINT/SILK BANK', 'KVHAGIB239PCDIU1IFOL', 9164, '19071283', '2019-07-10', 'SUPPLIER CHQ'),
('2TLIZVVDSDXOW81', '2019-07-04', '1', '1', '2', '0', 10000, 'CHQ # 000000, CHQ Date: 2019-07-10 ( SUPPLIER CHQ ) ; MAAZ PAINT/MEEZAN BANK', 'KVHAGIB239PCDIU1IFOL', 9164, '000000', '2019-07-10', 'SUPPLIER CHQ'),
('Y793MN96AGQUJCW', '2019-07-04', '1', '1', '2', '0', 20000, 'CHQ # 000000, CHQ Date: 2019-07-13 ( SUPPLIER CHQ ) ; ZEESHAN/MEEZAN BANK', 'KVHAGIB239PCDIU1IFOL', 9164, '000000', '2019-07-13', 'SUPPLIER CHQ'),
('V2WOG32ZYQ5ZI3E', '2019-07-04', '1', '1', '2', '0', 25000, 'CHQ # 000000, CHQ Date: 2019-07-20 ( SUPPLIER CHQ ) ; ZEESHAN/MEEZAN BANK', 'KVHAGIB239PCDIU1IFOL', 9164, '000000', '2019-07-20', 'SUPPLIER CHQ'),
('TKE82AGD845EDH2', '2019-07-04', '1', '1', '2', '0', 25000, 'CHQ # 000000, CHQ Date: 2019-07-27 ( SUPPLIER CHQ ) ; ZEESHAN/MEEZAN BANK', 'KVHAGIB239PCDIU1IFOL', 9164, '000000', '2019-07-27', 'SUPPLIER CHQ'),
('BN6WU29VZYN1M6R', '2019-07-05', '1', '1', '2', '0', 20000, 'CHQ # 00074810, CHQ Date: 2019-07-27 ( SUPPLIER CHQ ) ; NEW AL MAKKI PAINTS/SUMMIT BANK', 'HMITTMTF6JUD4XSUKFWZ', 9165, '00074810', '2019-07-27', 'SUPPLIER CHQ'),
('JKL9O175XD71OY6', '2019-07-05', '1', '1', '2', '0', 30000, 'CHQ # 19250592, CHQ Date: 2019-07-16 ( MEEZAN ) ; ZEESHAN', 'HMITTMTF6JUD4XSUKFWZ', 9165, '19250592', '2019-07-16', 'MEEZAN'),
('1RLA9Y7USLXSL2P', '2019-07-05', '1', '1', '2', '0', 25000, 'CHQ # 19250593, CHQ Date: 2019-07-23 ( MEEZAN ) ; ZEESHAN', 'HMITTMTF6JUD4XSUKFWZ', 9165, '19250593', '2019-07-23', 'MEEZAN'),
('QVA3E8LC4LUC7ID', '2019-07-05', '1', '1', '2', '0', 25000, 'CHQ # 19250594, CHQ Date: 2019-07-31 ( MEEZAN ) ; ZEESHAN', 'HMITTMTF6JUD4XSUKFWZ', 9165, '19250594', '2019-07-31', 'MEEZAN'),
('22YXCC1PTCM88LT', '2019-07-08', '1', '1', '2', '0', 50000, 'CHQ # 10614547, CHQ Date: 2019-07-09 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 9166, '10614547', '2019-07-09', 'BANK AL HABIB LIMITED'),
('UXSPE6OB2I6MHXL', '2019-07-08', '1', '1', '2', '0', 50000, 'CHQ # 10614548, CHQ Date: 2019-07-10 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 9166, '10614548', '2019-07-10', 'BANK AL HABIB LIMITED'),
('A9UVGG4WGW51PX7', '2019-07-08', '1', '1', '2', '0', 50000, 'CHQ # 10614549, CHQ Date: 2019-07-20 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 9166, '10614549', '2019-07-20', 'BANK AL HABIB LIMITED'),
('C4BZEV347NRHZNV', '2019-07-08', '1', '1', '2', '0', 50000, 'CHQ # 10614550, CHQ Date: 2019-07-29 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 9166, '10614550', '2019-07-29', 'BANK AL HABIB LIMITED'),
('2X5FIETBGF6EH4T', '2019-07-08', '1', '1', '2', '0', 100000, 'CHQ # 225280328, CHQ Date: 2019-08-10 ( SUPPLIER CHQ ) ; SHEHZAD AL HUSSAINI/ALLIED BANK', '2RTL88CE6CZON8A48Q7H', 9166, '225280328', '2019-08-10', 'SUPPLIER CHQ'),
('VYSZA4H47RJWGPQ', '2019-07-09', '1', '1', '2', '0', 25000, 'CHQ # 19071281, CHQ Date: 2019-07-24 ( SUPPLIER CHQ ) ; NEW AL NOOR PAINTS', 'UOG71LV2MZUSTC69H2Y2', 9167, '19071281', '2019-07-24', 'SUPPLIER CHQ'),
('2VR8ZUY56Q2TX53', '2019-07-08', '1', '1', '2', '0', 5000, 'CHQ # 000000, CHQ Date: 2019-07-25 ( SUPPLIER CHQ ) ; QADRI PAINTS', '73841H2DMU823SWSFEI3', 9168, '000000', '2019-07-25', 'SUPPLIER CHQ'),
('7XYJFGKIZ6WSNPH', '2019-07-08', '1', '1', '1', '0', 15000, ' CASH', '73841H2DMU823SWSFEI3', 9168, '', '0000-00-00', ''),
('N3N6NIWM9Q4ITGL', '2019-07-15', '1', '1', '2', '0', 35000, 'CHQ # 10614557, CHQ Date: 2019-07-25 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '38G8VAYQUTANT6T7P6NK', 9169, '10614557', '2019-07-25', 'BANK AL HABIB LIMITED'),
('RBQQIMS9PPB6AT4', '2019-07-15', '1', '1', '2', '0', 35000, 'CHQ # 10614558, CHQ Date: 2019-08-10 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '38G8VAYQUTANT6T7P6NK', 9169, '10614558', '2019-08-10', 'BANK AL HABIB LIMITED'),
('ZXBC28V3WL859WS', '2019-07-12', '1', '1', '2', '0', 77200, 'CHQ # 10614556, CHQ Date: 2019-08-15 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '3URSQ9XJAVQPLR2YT7HL', 9170, '10614556', '2019-08-15', 'BANK AL HABIB LIMITED'),
('2DJ56QAZRWO9KVD', '2019-07-12', '1', '1', '1', '0', 10000, ' CASH', 'PN6D6ZWHZOE6GNNVVE8E', 9171, '', '0000-00-00', ''),
('AM5UOHHKT1Q47WP', '2019-07-15', '1', '1', '2', '0', 99000, 'CHQ # 19250595, CHQ Date: 2019-08-15 ( MEEZAN ) ; ZEESHAN', 'OIP8LT8QNBS1EXRILD5M', 9172, '19250595', '2019-08-15', 'MEEZAN'),
('TKWY5JMHKG86YO5', '2019-07-19', '1', '1', '2', '0', 25000, 'CHQ # 67781214, CHQ Date: 2019-07-20 ( SUPPLIER CHQ ) ; MEMON PAINT', 'KVHAGIB239PCDIU1IFOL', 9173, '67781214', '2019-07-20', 'SUPPLIER CHQ'),
('LEE9F1PEJUJW32P', '2019-07-19', '1', '1', '2', '0', 50000, 'CHQ # 46781370, CHQ Date: 2019-07-22 ( SUPPLIER CHQ ) ; UNION', 'KVHAGIB239PCDIU1IFOL', 9173, '', '0000-00-00', ''),
('KFTEXM2NAHXKIBT', '2019-07-20', '1', '1', '1', '0', 25000, ' CASH', 'UOG71LV2MZUSTC69H2Y2', 9174, '', '0000-00-00', ''),
('5XPZ5S49OUHX5OK', '2019-07-22', '1', '1', '2', '0', 35000, 'CHQ # 36535209, CHQ Date: 2019-08-25 ( BANK AL FALAH ) ; ZEESHAN', 'D23F97RKV572XU63L93E', 9175, '36535209', '2019-08-25', 'BANK AL FALAH'),
('9TIYJXI2U244L2E', '2019-07-22', '1', '1', '2', '0', 35000, 'CHQ # 36535208, CHQ Date: 2019-08-14 ( BANK AL FALAH ) ; ZEESHAN', 'D23F97RKV572XU63L93E', 9175, '', '0000-00-00', ''),
('ARQ863GZ3RXHISG', '2019-07-22', '1', '1', '2', '0', 35000, 'CHQ # 36535207, CHQ Date: 2019-07-25 ( BANK AL FALAH ) ; ZEESHAN', 'D23F97RKV572XU63L93E', 9175, '', '0000-00-00', ''),
('A7EMTWI33LJ6Z1V', '2019-07-24', '1', '1', '2', '0', 10000, 'CHQ # 10900477, CHQ Date: 2019-07-31 ( SUPPLIER CHQ ) ; QADRI PAINT/SHAH FAISAL/BANK AL HABIB', 'AU5YU8HI5RK3ME4ZRSGE', 9176, '10900477', '2019-07-31', 'SUPPLIER CHQ'),
('NWXEKFSOLXWEK1I', '2019-07-24', '1', '1', '2', '0', 10000, 'CHQ # 12550376, CHQ Date: 2019-08-03 ( SUPPLIER CHQ ) ; GILANI PAINT', 'AU5YU8HI5RK3ME4ZRSGE', 9176, '12550376', '2019-08-03', 'SUPPLIER CHQ'),
('XJ6FPH5FZDQ1OLR', '2019-07-22', '1', '1', '2', '0', 30000, 'CHQ # 36535210, CHQ Date: 2019-07-27 ( BANK AL FALAH ) ; ZEESHAN', 'GPL2UPO3UP5JPQ1M6DBX', 9177, '36535210', '2019-07-27', 'BANK AL FALAH'),
('AE4KI3OMFYZG7M4', '2019-07-22', '1', '1', '2', '0', 30000, 'CHQ # 36535211, CHQ Date: 2019-08-17 ( BANK AL FALAH ) ; ZEESHAN', 'GPL2UPO3UP5JPQ1M6DBX', 9177, '36535211', '2019-08-17', 'BANK AL FALAH'),
('NNCFHA97FJHX3J8', '2019-07-22', '1', '1', '1', '0', 10000, ' CASH', 'GPL2UPO3UP5JPQ1M6DBX', 9177, '', '0000-00-00', ''),
('YE673KSPAWQVLI6', '2019-07-22', '1', '1', '1', '0', 100000, ' CASH', 'OIP8LT8QNBS1EXRILD5M', 9178, '', '0000-00-00', ''),
('OS25SIS3BTK5OYU', '2019-07-25', '1', '1', '2', '0', 25000, 'CHQ # 36535212, CHQ Date: 2019-08-16 ( BANK AL FALAH ) ; ZEESHAN', 'IP9TWAG6VSVG6NTYP6RF', 9179, '36535212', '2019-08-16', 'BANK AL FALAH'),
('WNKFPH7K8GV7RNV', '2019-07-25', '1', '1', '1', '0', 15000, ' CASH', 'IP9TWAG6VSVG6NTYP6RF', 9179, '', '0000-00-00', ''),
('3GK16MPZN6YEGWM', '2019-07-25', '1', '1', '2', '0', 50000, 'CHQ # 00000066, CHQ Date: 2019-08-14 ( HBL ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9180, '00000066', '2019-08-14', 'HBL'),
('RQF3LM36CF9F6M3', '2019-07-25', '1', '1', '2', '0', 50000, 'CHQ # 00000067, CHQ Date: 2019-08-20 ( HBL ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9180, '00000067', '2019-08-20', 'HBL'),
('GE3EL9GA3TXP347', '2019-07-25', '1', '1', '2', '0', 50000, 'CHQ # 00000068, CHQ Date: 2019-08-25 ( HBL ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9180, '00000068', '2019-08-25', 'HBL'),
('6O945BDAZSBNLZR', '2019-07-25', '1', '1', '2', '0', 50000, 'CHQ # 00000069, CHQ Date: 2019-09-13 ( HBL ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9180, '00000069', '2019-09-13', 'HBL'),
('LS5R13I1O8TYXRN', '2019-07-25', '1', '1', '2', '0', 20000, 'CHQ # 10713581, CHQ Date: 2019-07-27 ( SUPPLIER CHQ ) ; GHOSIA/BANK AL HABIB', '2RTL88CE6CZON8A48Q7H', 9181, '10713581', '2019-07-27', 'SUPPLIER CHQ'),
('AB154AACGBEGOR7', '2019-07-25', '1', '1', '2', '0', 30000, 'CHQ # 19071241, CHQ Date: 2019-07-27 ( SUPPLIER CHQ ) ; NEW AL NOOR/SILK BANK', '2RTL88CE6CZON8A48Q7H', 9181, '19071241', '2019-07-27', 'SUPPLIER CHQ'),
('I28ISWA6D5UX8ZR', '2019-07-25', '1', '1', '1', '0', 50000, ' CASH', '2RTL88CE6CZON8A48Q7H', 9181, '', '0000-00-00', ''),
('2GINJNFLTK7OSHW', '2019-07-31', '1', '1', '2', '0', 30000, 'CHQ # 0000070, CHQ Date: 2019-08-21 ( HBL ) ; ZEESHAN', 'Q7FR2XS4JI3PV48ANWE2', 9182, '0000070', '2019-08-21', 'HBL'),
('4AI6SCPCR89W7YM', '2019-07-31', '1', '1', '2', '0', 30000, 'CHQ # 0000071, CHQ Date: 2019-08-21 ( HBL ) ; ZEESHAN', 'Q7FR2XS4JI3PV48ANWE2', 9182, '0000071', '2019-08-21', 'HBL'),
('XCAEUENK9JJ6UMC', '2019-08-01', '1', '1', '2', '0', 50000, 'CHQ # 19250596, CHQ Date: 2019-08-11 ( MEEZAN ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 9183, '19250596', '2019-08-11', 'MEEZAN'),
('BZFYLTOS1DZMF55', '2019-08-01', '1', '1', '2', '0', 50000, 'CHQ # 19250597, CHQ Date: 2019-08-18 ( MEEZAN ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 9183, '19250597', '2019-08-18', 'MEEZAN'),
('X8EYG1ZQSTXWG9E', '2019-08-01', '1', '1', '2', '0', 50000, 'CHQ # 19250598, CHQ Date: 2019-08-25 ( MEEZAN ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 9183, '19250598', '2019-08-25', 'MEEZAN'),
('74ZYUYGDHNWCU4T', '2019-08-01', '1', '1', '2', '0', 50000, 'CHQ # 19250599, CHQ Date: 2019-08-31 ( MEEZAN ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 9183, '19250599', '2019-08-31', 'MEEZAN'),
('IJBE7TMHHGTVGKA', '2019-08-08', '1', '1', '2', '0', 30000, 'CHQ # 19071300, CHQ Date: 2019-08-17 ( SUPPLIER CHQ ) ; NOT MENTIONED', 'KVHAGIB239PCDIU1IFOL', 9184, '19071300', '2019-08-17', 'SUPPLIER CHQ'),
('XLHEC7DA4MM6QKF', '2019-08-08', '1', '1', '2', '0', 50000, 'CHQ # 00000043, CHQ Date: 2019-08-30 ( SUPPLIER CHQ ) ; NOT MENTIONED', 'KVHAGIB239PCDIU1IFOL', 9184, '00000043', '2019-08-30', 'SUPPLIER CHQ'),
('W1ON595YTPP22PL', '2019-08-23', '1', '1', '2', '0', 30000, 'CHQ # 0000, CHQ Date: 2019-08-30 ( SUPPLIER CHQ ) ; NEW AL NOOR PAINT', 'PN6D6ZWHZOE6GNNVVE8E', 9185, '0000', '2019-08-30', 'SUPPLIER CHQ'),
('E3BBMH5TTO482CI', '2019-08-27', '1', '1', '2', '0', 20000, 'CHQ # 19071307, CHQ Date: 2019-09-08 ( SUPPLIER CHQ ) ; NEW AL NOOR/SILK BANK', 'Q7FR2XS4JI3PV48ANWE2', 9186, '19071307', '2019-09-08', 'SUPPLIER CHQ'),
('EL5L6EYIZMK13QB', '2019-08-27', '1', '1', '2', '0', 30000, 'CHQ # 00000073, CHQ Date: 2019-09-21 ( HBL ) ; ZEESHAN', 'Q7FR2XS4JI3PV48ANWE2', 9186, '00000073', '2019-09-21', 'HBL'),
('Q5WAOVX86O2PNX6', '2019-09-03', '1', '1', '2', '0', 50000, 'CHQ # 000000, CHQ Date: 2019-10-05 ( BANK AL FALAH ) ; ZEESHAN', '43KY3DUFCY7NQ8R3GWW7', 9187, '000000', '2019-10-05', 'BANK AL FALAH'),
('GENC6A7YOE8I3RW', '2019-09-03', '1', '1', '2', '0', 50000, 'CHQ # 000000, CHQ Date: 2019-10-11 ( BANK AL FALAH ) ; ZEESHAN', '43KY3DUFCY7NQ8R3GWW7', 9187, '000000', '2019-10-11', 'BANK AL FALAH'),
('GMS7C8AHCYWK9WW', '2019-09-03', '1', '1', '2', '0', 31000, 'CHQ # 000000, CHQ Date: 2019-10-16 ( BANK AL FALAH ) ; ZEESHAN', '43KY3DUFCY7NQ8R3GWW7', 9187, '000000', '2019-10-16', 'BANK AL FALAH'),
('ZJCQRJ7T5CU8ANK', '2019-09-03', '1', '1', '1', '0', 250, ' CASH', '43KY3DUFCY7NQ8R3GWW7', 9187, '', '0000-00-00', ''),
('AHCVBZAMQ8SJDG5', '2019-09-02', '1', '1', '2', '0', 7000, 'CHQ # 05585672, CHQ Date: 2019-09-04 ( SUPPLIER CHQ ) ; ', 'UOG71LV2MZUSTC69H2Y2', 9188, '05585672', '2019-09-04', 'SUPPLIER CHQ'),
('JJ7R2G6LB6V6Y9M', '2019-09-02', '1', '1', '1', '0', 8000, ' CASH', 'UOG71LV2MZUSTC69H2Y2', 9188, '', '0000-00-00', ''),
('JG2YZMY4INERYV9', '2019-09-03', '1', '1', '2', '0', 5000, 'CHQ # 10823549, CHQ Date: 2019-09-10 ( SUPPLIER CHQ ) ; QADRI PAINTS', 'AU5YU8HI5RK3ME4ZRSGE', 9189, '10823549', '2019-09-10', 'SUPPLIER CHQ'),
('2NS5N5SP8YTWZT4', '2019-09-03', '1', '1', '1', '0', 5000, ' CASH', 'AU5YU8HI5RK3ME4ZRSGE', 9189, '', '0000-00-00', ''),
('WGMO5OI5K7IU7OH', '2019-09-04', '1', '1', '2', '0', 30000, 'CHQ # 0000074, CHQ Date: 2019-09-22 ( HBL ) ; ZEESHAN', 'WYU7GK7FHY1AFSA8DAHK', 9190, '0000074', '2019-09-22', 'HBL'),
('3LXT6IFTJH1ZCSQ', '2019-09-04', '1', '1', '2', '0', 20000, 'CHQ # 000000, CHQ Date: 2019-09-10 ( SUPPLIER CHQ ) ; SADIQ ALI/HBL', 'WYU7GK7FHY1AFSA8DAHK', 9190, '000000', '2019-09-10', 'SUPPLIER CHQ'),
('IVKXS6TN5K3TIQM', '2019-09-05', '1', '1', '2', '0', 50000, 'CHQ # 00000039, CHQ Date: 2019-10-02 ( HBL ) ; ZEESHAN', 'KVHAGIB239PCDIU1IFOL', 9191, '00000039', '2019-10-02', 'HBL'),
('SUFIO47T8CGJ5IC', '2019-09-06', '1', '1', '1', '0', 8000, ' CASH', '3FLZFNER3T3SNGUVQKQ1', 9192, '', '0000-00-00', ''),
('5TD1U6RKWL4BRCE', '2019-09-17', '1', '1', '2', '0', 35000, 'CHQ # 10614560, CHQ Date: 2019-10-12 ( BANK AL HABIB LIMITED ) ; ZEESHAN', 'OIP8LT8QNBS1EXRILD5M', 9193, '10614560', '2019-10-12', 'BANK AL HABIB LIMITED'),
('POI3KJNNOCS2MH4', '2019-09-17', '1', '1', '2', '0', 25000, 'CHQ # 19071315, CHQ Date: 2019-09-25 ( SUPPLIER CHQ ) ; NEW AL NOOR/SILK BANK', 'OIP8LT8QNBS1EXRILD5M', 9193, '19071315', '2019-09-25', 'SUPPLIER CHQ'),
('76ILRJOJO1AYXPY', '2019-10-02', '1', '1', '2', '0', 50000, 'CHQ # 000000, CHQ Date: 2019-10-28 ( SUPPLIER CHQ ) ; M.A PAINTS/GHAGAR PHATAK', 'GPL2UPO3UP5JPQ1M6DBX', 9194, '000000', '2019-10-28', 'SUPPLIER CHQ'),
('Y5YWVNEHJVQH2YC', '2019-09-24', '1', '1', '2', '0', 30000, 'CHQ # 10614564, CHQ Date: 2019-10-08 ( BANK AL HABIB LIMITED ) ; ZEESHAN', 'UOG71LV2MZUSTC69H2Y2', 9195, '10614564', '2019-10-08', 'BANK AL HABIB LIMITED'),
('2KABJBLAHHWLJXM', '2019-09-24', '1', '1', '2', '0', 20000, 'CHQ # 0000009, CHQ Date: 2019-10-03 ( SUPPLIER CHQ ) ; HBL', 'OIP8LT8QNBS1EXRILD5M', 9196, '0000009', '2019-10-03', 'SUPPLIER CHQ'),
('3FKXAXP4P71TKHJ', '2019-09-24', '1', '1', '2', '0', 30000, 'CHQ # 01063677, CHQ Date: 2019-10-05 ( SUPPLIER CHQ ) ; MEEZAN', 'OIP8LT8QNBS1EXRILD5M', 9196, '01063677', '2019-10-05', 'SUPPLIER CHQ'),
('5WHAWACITJ7P5JZ', '2019-09-19', '1', '1', '2', '0', 30000, 'CHQ # A-25161180, CHQ Date: 2019-09-29 ( MEEZAN ) ; ZEESHAN', 'HMITTMTF6JUD4XSUKFWZ', 9197, 'A-25161180', '2019-09-29', 'MEEZAN'),
('3JKNVGXMN4CJH1T', '2019-09-19', '1', '1', '2', '0', 43900, 'CHQ # A-25161181, CHQ Date: 2019-09-29 ( MEEZAN ) ; ZEESHAN', 'HMITTMTF6JUD4XSUKFWZ', 9197, 'A-25161181', '2019-09-29', 'MEEZAN'),
('5MM3JY79BHCDEPU', '2019-09-18', '1', '1', '1', '0', 20000, ' CASH', 'IP9TWAG6VSVG6NTYP6RF', 9198, '', '0000-00-00', ''),
('1G95PUKGAQAOGQW', '2019-09-18', '1', '1', '2', '0', 30000, 'CHQ # 25161177, CHQ Date: 2019-10-20 ( MEEZAN ) ; ZEESHAN', 'D23F97RKV572XU63L93E', 9199, '25161177', '2019-10-20', 'MEEZAN'),
('COSM33E7BELD8PN', '2019-09-18', '1', '1', '2', '0', 30000, 'CHQ # 25161178, CHQ Date: 2019-10-27 ( MEEZAN ) ; ZEESHAN', 'D23F97RKV572XU63L93E', 9199, '25161178', '2019-10-27', 'MEEZAN'),
('1AJBLIAQY6H45ZQ', '2019-09-18', '1', '1', '2', '0', 25000, 'CHQ # 25161179, CHQ Date: 2019-11-10 ( MEEZAN ) ; ZEESHAN', 'D23F97RKV572XU63L93E', 9199, '25161179', '2019-11-10', 'MEEZAN'),
('TMZ5LOTH7REZLUG', '2019-09-08', '1', '1', '2', '0', 25000, 'CHQ # 10614561, CHQ Date: 2019-10-12 ( BANK AL HABIB LIMITED ) ; ZEESHAN', 'AT9YQ8RYRMLR7M8P4JIA', 9200, '10614561', '2019-10-12', 'BANK AL HABIB LIMITED'),
('GZZVUAEDP5C3SBQ', '2019-09-08', '1', '1', '2', '0', 25000, 'CHQ # 10614562, CHQ Date: 2019-10-19 ( BANK AL HABIB LIMITED ) ; ZEESHAN', 'AT9YQ8RYRMLR7M8P4JIA', 9200, '10614562', '2019-10-19', 'BANK AL HABIB LIMITED'),
('YSUWAHWXBMDEEVD', '2019-10-23', '1', '1', '2', '0', 30000, 'CHQ # 10614570, CHQ Date: 2019-11-16 ( BANK AL HABIB LIMITED ) ; ZEESHAN', 'AT9YQ8RYRMLR7M8P4JIA', 9201, '10614570', '2019-11-16', 'BANK AL HABIB LIMITED'),
('7EH8BTLMP2GSUJV', '2019-10-23', '1', '1', '2', '0', 30000, 'CHQ # 10614571, CHQ Date: 2019-11-16 ( BANK AL HABIB LIMITED ) ; ZEESHAN', 'AT9YQ8RYRMLR7M8P4JIA', 9201, '10614571', '2019-11-16', 'BANK AL HABIB LIMITED'),
('PIAMDLDHP2IA32V', '2019-10-23', '1', '1', '1', '0', 2200, ' CASH', 'AT9YQ8RYRMLR7M8P4JIA', 9201, '', '0000-00-00', ''),
('TMD4E1Q3TIPK7B3', '2019-10-17', '1', '1', '2', '0', 40000, 'CHQ # 10614568, CHQ Date: 2019-10-18 ( BANK AL HABIB LIMITED ) ; ZEESHAN', 'OIP8LT8QNBS1EXRILD5M', 9202, '10614568', '2019-10-18', 'BANK AL HABIB LIMITED'),
('6R44B7K77JGVRU5', '2019-10-17', '1', '1', '2', '0', 40000, 'CHQ # 10614569, CHQ Date: 2019-10-24 ( BANK AL HABIB LIMITED ) ; ZEESHAN', 'OIP8LT8QNBS1EXRILD5M', 9202, '10614569', '2019-10-24', 'BANK AL HABIB LIMITED'),
('TKE16TYQOFALYJN', '2019-10-17', '1', '1', '1', '0', 20000, ' CASH', 'OIP8LT8QNBS1EXRILD5M', 9202, '', '0000-00-00', ''),
('MUUHJZDN3RRL9VV', '2019-10-21', '1', '1', '2', '0', 50000, 'CHQ # 251611184, CHQ Date: 2019-10-28 ( MEEZAN ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 9203, '251611184', '2019-10-28', 'MEEZAN'),
('B4YCTQ3SNXOCTIL', '2019-10-21', '1', '1', '2', '0', 50000, 'CHQ # 251611185, CHQ Date: 2019-11-12 ( MEEZAN ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 9203, '251611185', '2019-11-12', 'MEEZAN'),
('K2M8QDNZ9QJ4CLL', '2019-10-21', '1', '1', '2', '0', 50000, 'CHQ # 251611186, CHQ Date: 2019-11-18 ( MEEZAN ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 9203, '251611186', '2019-11-18', 'MEEZAN'),
('HY6AMOHHVINP9WA', '2019-10-21', '1', '1', '2', '0', 50000, 'CHQ # 251611187, CHQ Date: 2019-11-24 ( MEEZAN ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 9203, '251611187', '2019-11-24', 'MEEZAN'),
('8HNKNZMBDL54TQL', '2019-10-16', '1', '1', '2', '0', 30000, 'CHQ # 10614567, CHQ Date: 2019-10-16 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9204, '10614567', '2019-10-16', 'BANK AL HABIB LIMITED'),
('NAFCQKIP5LSLEL1', '2019-10-16', '1', '1', '1', '0', 20000, ' CASH', '8EC45YB7SSBDHR45SUYQ', 9204, '', '0000-00-00', ''),
('P1W7U2AYP3OPSD7', '2019-10-14', '1', '1', '2', '0', 30000, 'CHQ # 00000, CHQ Date: 2019-10-23 ( SUPPLIER CHQ ) ; AL MAKKAH PAINT', 'ZZDE8VQ5MFPC9MZRNP7T', 9205, '00000', '2019-10-23', 'SUPPLIER CHQ'),
('PDY1JLVDCB3QXTE', '2019-10-14', '1', '1', '2', '0', 30000, 'CHQ # 0000000, CHQ Date: 2019-10-23 ( BANK AL HABIB LIMITED ) ; ZEESHAN', 'ZZDE8VQ5MFPC9MZRNP7T', 9205, '0000000', '2019-10-23', 'BANK AL HABIB LIMITED'),
('BAJWO233J42KO7I', '2019-10-14', '1', '1', '2', '0', 10000, 'CHQ # 00000, CHQ Date: 2019-10-23 ( SUPPLIER CHQ ) ; NEW AL NOOR', 'WYU7GK7FHY1AFSA8DAHK', 9206, '00000', '2019-10-23', 'SUPPLIER CHQ'),
('AWX9UOI9XULLEP9', '2019-10-20', '1', '1', '2', '0', 20000, 'CHQ # 19999345, CHQ Date: 2019-10-30 ( SUPPLIER CHQ ) ; NEW AL NOOR', 'Q7FR2XS4JI3PV48ANWE2', 9207, '19999345', '2019-10-30', 'SUPPLIER CHQ'),
('LGA8NIXO9CPWLX8', '2019-10-20', '1', '1', '2', '0', 8000, 'CHQ # 109314176, CHQ Date: 2019-10-30 ( SUPPLIER CHQ ) ; QADRI PAINT', 'Q7FR2XS4JI3PV48ANWE2', 9207, '109314176', '2019-10-30', 'SUPPLIER CHQ'),
('OAXY2EZ6MK1FX52', '2019-10-20', '1', '1', '1', '0', 20000, ' CASH', 'Q7FR2XS4JI3PV48ANWE2', 9207, '', '0000-00-00', ''),
('DURU3ZRB5FJEUA2', '2019-10-14', '1', '1', '2', '0', 30000, 'CHQ # 251611182, CHQ Date: 2019-10-18 ( MEEZAN ) ; ZEESHAN', 'D23F97RKV572XU63L93E', 9208, '251611182', '2019-10-18', 'MEEZAN'),
('NN7YHEQNDPPGJH4', '2019-10-14', '1', '1', '2', '0', 30000, 'CHQ # 251611183, CHQ Date: 2019-11-28 ( MEEZAN ) ; ZEESHAN', 'D23F97RKV572XU63L93E', 9208, '251611183', '2019-11-28', 'MEEZAN'),
('D7ELIKVVPF4Y1UI', '2019-10-11', '1', '1', '2', '0', 50000, 'CHQ # 16672736, CHQ Date: 2019-10-28 ( SUPPLIER CHQ ) ; EZZY PAINTS', '8EM2GUI7NF8JLN7BK56L', 9209, '16672736', '2019-10-28', 'SUPPLIER CHQ'),
('PEGBTWAR6SPO8E4', '2019-10-07', '1', '1', '2', '0', 20000, 'CHQ # 000000, CHQ Date: 2019-10-15 ( SUPPLIER CHQ ) ; NEW AL NOOR', 'PN6D6ZWHZOE6GNNVVE8E', 9210, '000000', '2019-10-15', 'SUPPLIER CHQ'),
('UPPO1Z6J9RBMW5H', '2019-10-21', '1', '1', '2', '0', 15000, 'CHQ # 11397783, CHQ Date: 2019-10-23 ( SUPPLIER CHQ ) ; ///////////', '73841H2DMU823SWSFEI3', 9211, '11397783', '2019-10-23', 'SUPPLIER CHQ'),
('G41KUSHUT69ZGG7', '2019-10-21', '1', '1', '1', '0', 10000, ' CASH', '73841H2DMU823SWSFEI3', 9211, '', '0000-00-00', ''),
('Q2GNLO8E4SYXGK8', '2019-10-25', '1', '1', '2', '0', 47700, 'CHQ # 10614572, CHQ Date: 2019-11-10 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9212, '10614572', '2019-11-10', 'BANK AL HABIB LIMITED'),
('OHAMLS4OMHTHPZE', '2019-10-25', '1', '1', '2', '0', 47700, 'CHQ # 10614573, CHQ Date: 2019-11-17 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9212, '10614573', '2019-11-17', 'BANK AL HABIB LIMITED'),
('W6TCADSHODYT68U', '2019-10-25', '1', '1', '2', '0', 47700, 'CHQ # 10614574, CHQ Date: 2019-11-20 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9212, '10614574', '2019-11-20', 'BANK AL HABIB LIMITED'),
('WVQQ4912E179OQA', '2019-10-25', '1', '1', '2', '0', 47700, 'CHQ # 10614575, CHQ Date: 2019-11-26 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9212, '10614575', '2019-11-26', 'BANK AL HABIB LIMITED'),
('NPDFWWHD6UBZOF2', '2019-10-25', '1', '1', '2', '0', 47700, 'CHQ # 10614576, CHQ Date: 2019-11-30 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9212, '10614576', '2019-11-30', 'BANK AL HABIB LIMITED'),
('DTTKQBBGR9X2ZCU', '2019-10-25', '1', '1', '1', '0', 25000, ' CASH', '2RTL88CE6CZON8A48Q7H', 9213, '', '0000-00-00', ''),
('WL4CLAZ2VDUB8BZ', '2019-10-28', '1', '1', '2', '0', 80000, 'CHQ # 000000, CHQ Date: 2019-11-12 ( SUPPLIER CHQ ) ; SUBHAN A PAINT', 'KVHAGIB239PCDIU1IFOL', 9215, '000000', '2019-11-12', 'SUPPLIER CHQ'),
('77WTNIXCVWL43IT', '2019-10-29', '1', '1', '2', '0', 50000, 'CHQ # 10614578, CHQ Date: 2019-10-29 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9216, '10614578', '2019-10-29', 'BANK AL HABIB LIMITED'),
('ES9DML8J4X2Z8HH', '2019-11-09', '1', '1', '2', '0', 20000, 'CHQ # 29623703, CHQ Date: 2019-11-08 ( SUPPLIER CHQ ) ; NEW MASHALLAH PAINT/GULSHAN E HADID', 'PN6D6ZWHZOE6GNNVVE8E', 9217, '29623703', '2019-11-08', 'SUPPLIER CHQ'),
('TJSCZUTQOSY9QDO', '2019-11-13', '1', '1', '2', '0', 50000, 'CHQ # 2429623690, CHQ Date: 2019-12-30 ( SUPPLIER CHQ ) ; ALLIED BANK/MASHALLAH PAINT/GULSHAN E HADID', '2RTL88CE6CZON8A48Q7H', 9214, '2429623690', '2019-12-30', 'SUPPLIER CHQ'),
('N5VVFBPTSC4N2QE', '2019-11-13', '1', '1', '2', '0', 50000, 'CHQ # 00000075, CHQ Date: 2019-12-10 ( HBL ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 9214, '', '0000-00-00', ''),
('6HW675WVSW9XSSD', '2019-11-13', '1', '1', '2', '0', 50000, 'CHQ # 00000076, CHQ Date: 2019-12-15 ( HBL ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 9214, '', '0000-00-00', ''),
('KWPRVJW7A6O7ZTD', '2019-11-13', '1', '1', '2', '0', 50000, 'CHQ # 00000077, CHQ Date: 2019-12-23 ( HBL ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 9214, '', '0000-00-00', ''),
('YE57ZSREHWA2AWT', '2019-11-12', '1', '1', '2', '0', 20000, 'CHQ # 19999355, CHQ Date: 2019-11-20 ( SUPPLIER CHQ ) ; NEW AL NOOR', 'UOG71LV2MZUSTC69H2Y2', 9218, '19999355', '2019-11-20', 'SUPPLIER CHQ'),
('U88TWFMQ8PUSWX2', '2019-10-28', '1', '1', '2', '0', 39000, 'CHQ # 25161188, CHQ Date: 2019-11-13 ( MEEZAN ) ; ZEESHAN', 'ZSPRL6NCIQHI9SCRYKDH', 9219, '25161188', '2019-11-13', 'MEEZAN'),
('E6DTIRGBLID57YB', '2019-10-28', '1', '1', '1', '0', 10000, ' CASH', 'ZSPRL6NCIQHI9SCRYKDH', 9219, '', '0000-00-00', ''),
('X3GFZ6NX5W6OZ3N', '2019-10-30', '1', '1', '2', '0', 36000, 'CHQ # 36535223, CHQ Date: 2019-12-14 ( BANK AL FALAH ) ; ZEESHAN', '43KY3DUFCY7NQ8R3GWW7', 9220, '36535223', '2019-12-14', 'BANK AL FALAH'),
('CGV2ZV58LRYD9OP', '2019-10-30', '1', '1', '2', '0', 36000, 'CHQ # 36535222, CHQ Date: 2019-12-10 ( BANK AL FALAH ) ; ZEESHAN', '43KY3DUFCY7NQ8R3GWW7', 9220, '36535222', '2019-12-10', 'BANK AL FALAH'),
('ISGRQMOHJ41TV7N', '2019-10-30', '1', '1', '2', '0', 36000, 'CHQ # 36535221, CHQ Date: 2019-11-29 ( BANK AL FALAH ) ; ZEESHAN', '43KY3DUFCY7NQ8R3GWW7', 9220, '36535221', '2019-11-29', 'BANK AL FALAH'),
('39H79WDPYHMBB6Z', '2019-11-01', '1', '1', '1', '0', 64000, ' CASH', 'OIP8LT8QNBS1EXRILD5M', 9221, '', '0000-00-00', ''),
('1AYPQVH9WJQMB7P', '2019-11-05', '1', '1', '2', '0', 50000, 'CHQ # 25161191, CHQ Date: 2019-11-22 ( MEEZAN ) ; ZEESHAN', '38G8VAYQUTANT6T7P6NK', 9222, '25161191', '2019-11-22', 'MEEZAN'),
('9J2BXHBRC6BPJAM', '2019-11-05', '1', '1', '2', '0', 20000, 'CHQ # 19999348, CHQ Date: 2019-11-16 ( SUPPLIER CHQ ) ; SILK BANK/NEW AL NOOR', '38G8VAYQUTANT6T7P6NK', 9222, '19999348', '2019-11-16', 'SUPPLIER CHQ'),
('E6EKA5DQHZHAJYK', '2019-11-05', '1', '1', '1', '0', 10000, ' CASH', '38G8VAYQUTANT6T7P6NK', 9222, '', '0000-00-00', ''),
('WAUN9K6RDIEKVDD', '2019-11-11', '1', '1', '2', '0', 30000, 'CHQ # 10973896, CHQ Date: 2019-11-20 ( BANK AL HABIB LIMITED ) ; ZEESHAN', 'GPL2UPO3UP5JPQ1M6DBX', 9223, '10973896', '2019-11-20', 'BANK AL HABIB LIMITED'),
('INVKIS6Y5TEWZZT', '2019-11-11', '1', '1', '2', '0', 80000, 'CHQ # 23540876, CHQ Date: 2019-11-20 ( SUPPLIER CHQ ) ; .....', 'GPL2UPO3UP5JPQ1M6DBX', 9223, '23540876', '2019-11-20', 'SUPPLIER CHQ'),
('T8LUY6HNGK1N12X', '2019-11-18', '1', '1', '2', '0', 40000, 'CHQ # 00000078, CHQ Date: 2019-11-22 ( HBL ) ; ZEESHAN', 'OIP8LT8QNBS1EXRILD5M', 9224, '00000078', '2019-11-22', 'HBL'),
('5BK2RVP4AK2J7R7', '2019-11-18', '1', '1', '2', '0', 40000, 'CHQ # 25161193, CHQ Date: 2019-11-28 ( MEEZAN ) ; ZEESHAN', 'OIP8LT8QNBS1EXRILD5M', 9224, '25161193', '2019-11-28', 'MEEZAN'),
('ZR1JON663E9XB4Z', '2019-11-18', '1', '1', '2', '0', 30000, 'CHQ # 10994017, CHQ Date: 2019-11-30 ( SUPPLIER CHQ ) ; (BAH) KORANGI BISMILLAH PAINT', 'OIP8LT8QNBS1EXRILD5M', 9224, '10994017', '2019-11-30', 'SUPPLIER CHQ'),
('ZZOOM9KR8BNQQYZ', '2019-11-18', '1', '1', '1', '0', 30000, ' CASH', 'OIP8LT8QNBS1EXRILD5M', 9224, '', '0000-00-00', ''),
('1L1V3EI9SIBGV2B', '2019-11-21', '1', '1', '2', '0', 25000, 'CHQ # 25161196, CHQ Date: 2019-11-28 ( MEEZAN ) ; ZEESHAN', 'HMITTMTF6JUD4XSUKFWZ', 9225, '25161196', '2019-11-28', 'MEEZAN'),
('9DTWC848MMC1YJE', '2019-11-21', '1', '1', '2', '0', 25000, 'CHQ # 25161197, CHQ Date: 2019-12-13 ( MEEZAN ) ; ZEESHAN', 'HMITTMTF6JUD4XSUKFWZ', 9225, '25161197', '2019-12-13', 'MEEZAN'),
('ZJ2YAECSO3G35M2', '2019-11-21', '1', '1', '2', '0', 24000, 'CHQ # 25161198, CHQ Date: 2019-12-16 ( MEEZAN ) ; ZEESHAN', 'HMITTMTF6JUD4XSUKFWZ', 9225, '25161198', '2019-12-16', 'MEEZAN'),
('VWNYZ8LEW5BQTI7', '2019-11-23', '1', '1', '2', '0', 20000, 'CHQ # 10713586, CHQ Date: 2019-11-30 ( SUPPLIER CHQ ) ; GOSIA PAINT', 'ZSPRL6NCIQHI9SCRYKDH', 9226, '10713586', '2019-11-30', 'SUPPLIER CHQ'),
('T4WQ8JG24BKWQ4E', '2019-11-23', '1', '1', '2', '0', 10000, 'CHQ # 11441411, CHQ Date: 2019-12-05 ( SUPPLIER CHQ ) ; BITHAI PAINT', 'ZSPRL6NCIQHI9SCRYKDH', 9226, '11441411', '2019-12-05', 'SUPPLIER CHQ'),
('S45I8V5NQ8FDAV9', '2019-11-25', '1', '1', '2', '0', 29000, 'CHQ # 41469232, CHQ Date: 2019-11-25 ( SUPPLIER CHQ ) ; ASIF CASH SALE', 'Q7FR2XS4JI3PV48ANWE2', 9227, '41469232', '2019-11-25', 'SUPPLIER CHQ'),
('87WCN7KSWL79HYT', '2019-11-25', '1', '1', '2', '0', 25000, 'CHQ # 25161199, CHQ Date: 2019-11-25 ( MEEZAN ) ; ZEESHAN', 'Q7FR2XS4JI3PV48ANWE2', 9227, '25161199', '2019-11-25', 'MEEZAN'),
('3BK63DI1RNANR98', '2019-11-27', '1', '1', '2', '0', 25000, 'CHQ # 25161200, CHQ Date: 2019-11-29 ( MEEZAN ) ; ZEESHAN', 'ZZDE8VQ5MFPC9MZRNP7T', 9228, '25161200', '2019-11-29', 'MEEZAN'),
('7VFQJFCTIA29ASN', '2019-11-27', '1', '1', '2', '0', 25000, 'CHQ # 25161201, CHQ Date: 2019-11-29 ( MEEZAN ) ; ZEESHAN', 'ZZDE8VQ5MFPC9MZRNP7T', 9228, '25161201', '2019-11-29', 'MEEZAN'),
('X99UX1XEMDEBYLR', '2019-11-28', '1', '1', '2', '0', 32000, 'CHQ # 00000079, CHQ Date: 2019-12-05 ( HBL ) ; ZEESHAN', 'OIP8LT8QNBS1EXRILD5M', 9229, '00000079', '2019-12-05', 'HBL'),
('ST5NE1A32UPCRTV', '2019-11-28', '1', '1', '1', '0', 32000, ' CASH', 'OIP8LT8QNBS1EXRILD5M', 9229, '', '0000-00-00', ''),
('P9SIVDJ5YWK1Y7T', '2019-12-11', '1', '1', '2', '0', 11000, 'CHQ # 10994047, CHQ Date: 2019-12-12 ( SUPPLIER CHQ ) ; KORANGI B.S.M PAINT', 'KVHAGIB239PCDIU1IFOL', 9230, '10994047', '2019-12-12', 'SUPPLIER CHQ'),
('O5DMHZVK2JMF1L6', '2019-12-11', '1', '1', '2', '0', 10000, 'CHQ # 29623720, CHQ Date: 2019-12-16 ( SUPPLIER CHQ ) ; MASHALLAH/GULSHAN  E HADID', 'KVHAGIB239PCDIU1IFOL', 9230, '29623720', '2019-12-16', 'SUPPLIER CHQ'),
('T7H9L5HNT28IWOW', '2019-12-11', '1', '1', '1', '0', 4000, ' CASH', 'KVHAGIB239PCDIU1IFOL', 9230, '', '0000-00-00', ''),
('XK7NU6TS3REYG7R', '2019-12-16', '1', '1', '2', '0', 116500, 'CHQ # 47463846, CHQ Date: 2019-12-25 ( SUPPLIER CHQ ) ; KARACHI PAINT(SHAHID BHAI)', '8EC45YB7SSBDHR45SUYQ', 9231, '47463846', '2019-12-25', 'SUPPLIER CHQ'),
('F3OJU554XAVV5IT', '2019-12-16', '1', '1', '2', '0', 50000, 'CHQ # 25161202, CHQ Date: 2020-01-15 ( MEEZAN ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9231, '25161202', '2020-01-15', 'MEEZAN'),
('IU11DITYSNU5N7X', '2019-12-16', '1', '1', '2', '0', 50000, 'CHQ # 25161203, CHQ Date: 2020-01-22 ( MEEZAN ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9231, '25161203', '2020-01-22', 'MEEZAN'),
('MHGJ9KUA7367Q8V', '2019-12-17', '1', '1', '2', '0', 45000, 'CHQ # 25161204, CHQ Date: 2020-01-10 ( MEEZAN ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 9232, '25161204', '2020-01-10', 'MEEZAN'),
('GIYF62TAQWAH2RP', '2019-12-17', '1', '1', '2', '0', 45000, 'CHQ # 25161205, CHQ Date: 2020-01-20 ( MEEZAN ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 9232, '25161205', '2020-01-20', 'MEEZAN'),
('HN6DT5YLQ8ZY7IF', '2019-12-17', '1', '1', '2', '0', 45000, 'CHQ # 25161206, CHQ Date: 2020-01-25 ( MEEZAN ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 9232, '25161206', '2020-01-25', 'MEEZAN'),
('IBS1HYXV7JXMX1O', '2019-12-17', '1', '1', '2', '0', 45000, 'CHQ # 25161207, CHQ Date: 2020-01-31 ( MEEZAN ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 9232, '25161207', '2020-01-31', 'MEEZAN'),
('5HOKK16XT1PCOQC', '2019-12-17', '1', '1', '2', '0', 20000, 'CHQ # 19999367, CHQ Date: 2020-01-31 ( SUPPLIER CHQ ) ; NEW AL NOOR/SILK BANK', '2RTL88CE6CZON8A48Q7H', 9232, '19999367', '2020-01-31', 'SUPPLIER CHQ'),
('P9QQLKKYTGH9E5W', '2019-12-18', '1', '1', '2', '0', 12500, 'CHQ # 23540897, CHQ Date: 2019-12-28 ( SUPPLIER CHQ ) ; ABBASI/AHSANABAD/DUBAI ISLAMIC BANK', 'PN6D6ZWHZOE6GNNVVE8E', 9233, '23540897', '2019-12-28', 'SUPPLIER CHQ'),
('XIPSVE7OOW2DP3I', '2019-12-18', '1', '1', '2', '0', 20000, 'CHQ # 10994058, CHQ Date: 2019-12-30 ( SUPPLIER CHQ ) ; KORANGI B.S.M/BAHL', 'PN6D6ZWHZOE6GNNVVE8E', 9233, '10994058', '2019-12-30', 'SUPPLIER CHQ'),
('WN1JY3GWJ1U7ZLI', '2019-12-20', '1', '1', '2', '0', 35000, 'CHQ # 25161208, CHQ Date: 2019-12-23 ( MEEZAN ) ; ZEESHAN', 'OIP8LT8QNBS1EXRILD5M', 9234, '25161208', '2019-12-23', 'MEEZAN'),
('TO3ADWSNA25KU4Z', '2019-12-20', '1', '1', '2', '0', 35000, 'CHQ # 25161209, CHQ Date: 2019-12-27 ( MEEZAN ) ; ZEESHAN', 'OIP8LT8QNBS1EXRILD5M', 9234, '25161209', '2019-12-27', 'MEEZAN'),
('ZNTDJXB5G9SHHWU', '2019-12-20', '1', '1', '2', '0', 12000, 'CHQ # 00000784, CHQ Date: 2019-12-28 ( SUPPLIER CHQ ) ; OSAMA\'S FRIEND', 'Q849P2OLCS1QYZVYV1K7', 9235, '00000784', '2019-12-28', 'SUPPLIER CHQ'),
('JJHMHFB1M1DKQFP', '2019-12-20', '1', '1', '2', '0', 12000, 'CHQ # 00000787, CHQ Date: 2020-01-10 ( SUPPLIER CHQ ) ; OSAMA\'S FRIEND', 'Q849P2OLCS1QYZVYV1K7', 9235, '00000787', '2020-01-10', 'SUPPLIER CHQ'),
('REKV8LNPRZ54Z1C', '2019-12-26', '1', '1', '2', '0', 30000, 'CHQ # 00000081, CHQ Date: 2020-01-18 ( HBL ) ; ZEESHAN', 'D23F97RKV572XU63L93E', 9236, '00000081', '2020-01-18', 'HBL'),
('F2U5K9B5325IMDQ', '2019-12-26', '1', '1', '2', '0', 30000, 'CHQ # 00000082, CHQ Date: 2020-01-25 ( HBL ) ; ZEESHAN', 'D23F97RKV572XU63L93E', 9236, '00000082', '2020-01-25', 'HBL'),
('8HHVGRDAYVOMSBY', '2019-12-26', '1', '1', '2', '0', 25000, 'CHQ # 00000083, CHQ Date: 2020-01-31 ( HBL ) ; ZEESHAN', 'D23F97RKV572XU63L93E', 9236, '00000083', '2020-01-31', 'HBL'),
('TBHISIBBF4IMTNG', '2019-12-24', '1', '1', '2', '0', 25000, 'CHQ # 000000, CHQ Date: 2019-12-31 ( SUPPLIER CHQ ) ; NEW AL NOOR/SILK BANK', 'IP9TWAG6VSVG6NTYP6RF', 9237, '000000', '2019-12-31', 'SUPPLIER CHQ'),
('3E9P64NUU1WNO79', '2019-12-26', '1', '1', '2', '0', 10000, 'CHQ # 28509250, CHQ Date: 2020-01-08 ( SUPPLIER CHQ ) ; KORANGI B.S.M/MEEZAN', '73841H2DMU823SWSFEI3', 9238, '28509250', '2020-01-08', 'SUPPLIER CHQ'),
('4QIIJGM3CKNC4EJ', '2019-12-26', '1', '1', '2', '0', 5000, 'CHQ # 000000, CHQ Date: 2019-12-28 ( SUPPLIER CHQ ) ; QADRI PAINT/BANK AL HABIB', '73841H2DMU823SWSFEI3', 9238, '000000', '2019-12-28', 'SUPPLIER CHQ'),
('6U7AWM2SSE1ZM3L', '2019-12-24', '1', '1', '2', '0', 12500, 'CHQ # 23540896, CHQ Date: 2019-12-30 ( SUPPLIER CHQ ) ; ABBASI PAINT', 'ZZDE8VQ5MFPC9MZRNP7T', 9239, '23540896', '2019-12-30', 'SUPPLIER CHQ'),
('EJQIQONIYP6CRFV', '2019-12-24', '1', '1', '2', '0', 10000, 'CHQ # 242963724, CHQ Date: 2019-12-30 ( SUPPLIER CHQ ) ; M.A PAINT/GULSHAN E HADID/ALLIED BANK', 'ZZDE8VQ5MFPC9MZRNP7T', 9239, '242963724', '2019-12-30', 'SUPPLIER CHQ'),
('A6SHYMQZGZTQ9TS', '2019-12-24', '1', '1', '2', '0', 12000, 'CHQ # 00000786, CHQ Date: 2019-12-30 ( SUPPLIER CHQ ) ; OSAMA\'S FRIEND/HBL', 'ZZDE8VQ5MFPC9MZRNP7T', 9239, '00000786', '2019-12-30', 'SUPPLIER CHQ'),
('VRTQKWKPN2UEHU8', '2019-12-24', '1', '1', '1', '0', 500, ' CASH', 'ZZDE8VQ5MFPC9MZRNP7T', 9239, '', '0000-00-00', ''),
('W7EQGGP695G4H9O', '2019-12-30', '1', '1', '2', '0', 30000, 'CHQ # 25161211, CHQ Date: 2020-01-12 ( MEEZAN ) ; ZEESHAN', 'ZSPRL6NCIQHI9SCRYKDH', 9240, '25161211', '2020-01-12', 'MEEZAN'),
('A5HAIIJ5XU4V4KZ', '2019-12-30', '1', '1', '1', '0', 20000, ' CASH', 'ZSPRL6NCIQHI9SCRYKDH', 9240, '', '0000-00-00', ''),
('1WHEZV9ERCX26QD', '2020-01-10', '1', '1', '2', '0', 30000, 'CHQ # 42847009, CHQ Date: 2020-01-25 ( SUPPLIER CHQ ) ; S.A PAINT/J.S BANK', '2RTL88CE6CZON8A48Q7H', 9241, '42847009', '2020-01-25', 'SUPPLIER CHQ'),
('HQL9FNTECKRDD66', '2020-01-10', '1', '1', '2', '0', 30000, 'CHQ # 25342837, CHQ Date: 2020-01-18 ( SUPPLIER CHQ ) ; AL HAMMAD/LABOUR SQUARE/MEEZAN', '2RTL88CE6CZON8A48Q7H', 9241, '25342837', '2020-01-18', 'SUPPLIER CHQ');
INSERT INTO `transection` (`transaction_id`, `date_of_transection`, `transection_type`, `transection_category`, `transection_mood`, `amount`, `pay_amount`, `description`, `relation_id`, `voucher_id`, `cheque_no`, `cheque_date`, `bank_name`) VALUES
('ETNG6MFF758TCHH', '2020-01-10', '1', '1', '2', '0', 50000, 'CHQ # 25161212, CHQ Date: 2020-02-15 ( MEEZAN ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 9241, '25161212', '2020-02-15', 'MEEZAN'),
('QBR1SF54FOEYUS1', '2020-01-10', '1', '1', '2', '0', 50000, 'CHQ # 25161213, CHQ Date: 2020-02-22 ( MEEZAN ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 9241, '25161213', '2020-02-22', 'MEEZAN'),
('93TH26G2BCB8CDH', '2020-01-10', '1', '1', '2', '0', 50000, 'CHQ # 25161214, CHQ Date: 2020-02-29 ( MEEZAN ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 9241, '25161214', '2020-02-29', 'MEEZAN'),
('KQVXBVND15BZX6A', '2020-01-13', '1', '1', '2', '0', 30000, 'CHQ # 25161215, CHQ Date: 2020-01-26 ( MEEZAN ) ; ZEESHAN', 'Q7FR2XS4JI3PV48ANWE2', 9242, '25161215', '2020-01-26', 'MEEZAN'),
('FH4P2ESWVC94DOM', '2020-01-13', '1', '1', '2', '0', 30000, 'CHQ # 25161216, CHQ Date: 2020-01-23 ( MEEZAN ) ; ZEESHAN', 'Q7FR2XS4JI3PV48ANWE2', 9242, '25161216', '2020-01-23', 'MEEZAN'),
('GSTVZ9PZM12HZL4', '2020-01-13', '1', '1', '2', '0', 25000, 'CHQ # 1746271248, CHQ Date: 2020-01-20 ( SUPPLIER CHQ ) ; FAKHRI PAINT', 'GPL2UPO3UP5JPQ1M6DBX', 9243, '1746271248', '2020-01-20', 'SUPPLIER CHQ'),
('MKCIIYG3UWWE8M5', '2020-01-13', '1', '1', '2', '0', 20000, 'CHQ # 00059908, CHQ Date: 2020-02-25 ( SUPPLIER CHQ ) ; BABA PAINT', 'GPL2UPO3UP5JPQ1M6DBX', 9243, '00059908', '2020-02-25', 'SUPPLIER CHQ'),
('HZQAJNWWMMZ67RE', '2020-01-06', '1', '1', '2', '0', 50000, 'CHQ # 19999372, CHQ Date: 2020-01-20 ( SUPPLIER CHQ ) ; NOT MENTION', 'OIP8LT8QNBS1EXRILD5M', 9244, '19999372', '2020-01-20', 'SUPPLIER CHQ'),
('KSEAZKME4Y4R7IS', '2019-12-23', '1', '1', '2', '0', 25900, 'CHQ # 10713588, CHQ Date: 2019-12-31 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9245, '10713588', '2019-12-31', 'BANK AL HABIB LIMITED'),
('W9ZV69FXBE4YLZW', '2019-12-23', '1', '1', '2', '0', 20000, 'CHQ # 10713589, CHQ Date: 2020-01-07 ( BANK AL HABIB LIMITED ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9245, '10713589', '2020-01-07', 'BANK AL HABIB LIMITED'),
('DBG7S28R8X8WJZG', '2019-12-23', '1', '1', '2', '0', 50000, 'CHQ # 25161210, CHQ Date: 2020-01-25 ( MEEZAN ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9245, '25161210', '2020-01-25', 'MEEZAN'),
('VFRYTNPTPZLVIPQ', '2019-12-23', '1', '1', '1', '0', 4100, ' CASH', '8EC45YB7SSBDHR45SUYQ', 9245, '', '0000-00-00', ''),
('6QO4O6AWI4MAK4Y', '2020-01-17', '1', '1', '2', '0', 25000, 'CHQ # 10557207, CHQ Date: 2020-01-27 ( SUPPLIER CHQ ) ; MUFFADIL PAINT/BOHRA PEER', 'OIP8LT8QNBS1EXRILD5M', 9246, '10557207', '2020-01-27', 'SUPPLIER CHQ'),
('F2SXKVDJNBTFBLB', '2020-01-17', '1', '1', '2', '0', 15000, 'CHQ # 1754925432, CHQ Date: 2020-01-26 ( SUPPLIER CHQ ) ; NEW MAKKAH PAINT/MODEL COLONY', 'OIP8LT8QNBS1EXRILD5M', 9246, '1754925432', '2020-01-26', 'SUPPLIER CHQ'),
('2L1HY8ZH5IFG7EM', '2020-01-14', '1', '1', '2', '0', 20000, 'CHQ # 19999377, CHQ Date: 2020-01-23 ( SUPPLIER CHQ ) ; NEW AL NOOR PAINT', 'KVHAGIB239PCDIU1IFOL', 9247, '19999377', '2020-01-23', 'SUPPLIER CHQ'),
('12TJZKP4EO39WP7', '2020-01-14', '1', '1', '1', '0', 39500, ' CASH', 'KVHAGIB239PCDIU1IFOL', 9247, '', '0000-00-00', ''),
('Z6DPZAFDAAAIC61', '2020-01-22', '1', '1', '2', '0', 25000, 'CHQ # 0000000115, CHQ Date: 2020-01-24 ( SUPPLIER CHQ ) ; SHADE CARD/PAINT MASTER', 'OIP8LT8QNBS1EXRILD5M', 9248, '0000000115', '2020-01-24', 'SUPPLIER CHQ'),
('KEHDDYEPWAZD51A', '2020-01-22', '1', '1', '1', '0', 40000, ' CASH', 'OIP8LT8QNBS1EXRILD5M', 9248, '', '0000-00-00', ''),
('1QRBEW6RR8Z51TA', '2020-01-23', '1', '1', '2', '0', 25000, 'CHQ # 19999378, CHQ Date: 2020-02-01 ( SUPPLIER CHQ ) ; NEW AL NOOR PAINT/SILK BANK', 'IP9TWAG6VSVG6NTYP6RF', 9249, '19999378', '2020-02-01', 'SUPPLIER CHQ'),
('3S86YCZPYVL456J', '2020-01-25', '1', '1', '2', '0', 25000, 'CHQ # 10557215, CHQ Date: 2020-01-30 ( SUPPLIER CHQ ) ; BANK AL HABIB/MUFFADIL PAINTS', 'UOG71LV2MZUSTC69H2Y2', 9250, '10557215', '2020-01-30', 'SUPPLIER CHQ'),
('AHCAF76JQ33LJ89', '2020-01-25', '1', '1', '1', '0', 15000, ' CASH', 'UOG71LV2MZUSTC69H2Y2', 9250, '', '0000-00-00', ''),
('R55L9HELRN9IELX', '2020-01-25', '1', '1', '2', '0', 34500, 'CHQ # 000000, CHQ Date: 2020-01-27 ( HBL ) ; ZEESHAN', '8EM2GUI7NF8JLN7BK56L', 9251, '000000', '2020-01-27', 'HBL'),
('65PE2FCTWB4499I', '2020-01-25', '1', '1', '2', '0', 34500, 'CHQ # 000000, CHQ Date: 2020-01-31 ( HBL ) ; ZEESHAN', '8EM2GUI7NF8JLN7BK56L', 9251, '000000', '2020-01-31', 'HBL'),
('MAAHIPN2A5TJ4TZ', '2020-01-25', '1', '1', '2', '0', 34500, 'CHQ # 000000, CHQ Date: 2020-02-14 ( HBL ) ; ZEESHAN', '8EM2GUI7NF8JLN7BK56L', 9251, '000000', '2020-02-14', 'HBL'),
('VIDAYBDMXW2TQRA', '2020-01-25', '1', '1', '2', '0', 75000, 'CHQ # 000000, CHQ Date: 2020-02-14 ( SUPPLIER CHQ ) ; FOJI PAINT/KUNKOT', '8EM2GUI7NF8JLN7BK56L', 9251, '000000', '2020-02-14', 'SUPPLIER CHQ'),
('M5MKDRS3NVPI1NI', '2020-01-29', '1', '1', '2', '0', 50000, 'CHQ # 12367149, CHQ Date: 2020-02-15 ( SUPPLIER CHQ ) ; ANAS(OSAMA\'S BROTHER)', 'GPL2UPO3UP5JPQ1M6DBX', 9252, '12367149', '2020-02-15', 'SUPPLIER CHQ'),
('TW3FYAI5AGBMZ57', '2020-01-29', '1', '1', '2', '0', 14000, 'CHQ # 0000000, CHQ Date: 2020-01-29 ( SUPPLIER CHQ ) ; S.A PAINTS/BOHRAPEER', '73841H2DMU823SWSFEI3', 9253, '0000000', '2020-01-29', 'SUPPLIER CHQ'),
('AQYYX9WTGETBIGY', '2020-01-29', '1', '1', '1', '0', 11000, ' CASH', '73841H2DMU823SWSFEI3', 9253, '', '0000-00-00', ''),
('BQG6RE9N5EXBOWD', '2020-02-03', '1', '1', '2', '0', 30000, 'CHQ # 25161218, CHQ Date: 2020-02-15 ( MEEZAN ) ; ZEESHAN', 'HMITTMTF6JUD4XSUKFWZ', 9254, '25161218', '2020-02-15', 'MEEZAN'),
('DVCP75CID63255R', '2020-02-03', '1', '1', '2', '0', 30000, 'CHQ # 25161219, CHQ Date: 2020-02-27 ( MEEZAN ) ; ZEESHAN', 'HMITTMTF6JUD4XSUKFWZ', 9254, '25161219', '2020-02-27', 'MEEZAN'),
('TEBF8Y2SND8BNSY', '2020-02-03', '1', '1', '2', '0', 30000, 'CHQ # 25161220, CHQ Date: 2020-03-12 ( MEEZAN ) ; ZEESHAN', 'HMITTMTF6JUD4XSUKFWZ', 9254, '25161220', '2020-03-12', 'MEEZAN'),
('FCYKO6WR71VJO5L', '2020-02-04', '1', '1', '2', '0', 48000, 'CHQ # 00000094, CHQ Date: 2020-02-17 ( HBL ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9255, '00000094', '2020-02-17', 'HBL'),
('IOFDVEC1HEHLE4E', '2020-02-04', '1', '1', '2', '0', 48000, 'CHQ # 00000095, CHQ Date: 2020-02-24 ( HBL ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9255, '00000095', '2020-02-24', 'HBL'),
('69RBTK5BIOH2QTV', '2020-02-04', '1', '1', '2', '0', 48000, 'CHQ # 00000096, CHQ Date: 2020-03-08 ( HBL ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9255, '00000096', '2020-03-08', 'HBL'),
('6SQZ7UVW516YDRK', '2020-02-04', '1', '1', '2', '0', 48000, 'CHQ # 00000097, CHQ Date: 2020-03-15 ( HBL ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9255, '00000097', '2020-03-15', 'HBL'),
('7LR5QRCVGMLIV4B', '2020-02-04', '1', '1', '2', '0', 50000, 'CHQ # 5492674, CHQ Date: 2020-03-05 ( SUPPLIER CHQ ) ; RAO JAVEED/SANGHAR/UBL', '8EC45YB7SSBDHR45SUYQ', 9255, '5492674', '2020-03-05', 'SUPPLIER CHQ'),
('988163446926658', '2020-02-05', '2', '2', '1', '0', NULL, 'ITP', '2BKRPZZLIX58KYN', NULL, NULL, NULL, NULL),
('187188558552568', '2020-02-05', '2', '2', '1', '0', NULL, 'ITP', '2BKRPZZLIX58KYN', NULL, NULL, NULL, NULL),
('925856287344835', '2020-02-06', '2', '2', '1', '0', NULL, 'ITP', '2BKRPZZLIX58KYN', NULL, NULL, NULL, NULL),
('4KRC1K7YDGRLGZI', '2020-02-07', '1', '1', '2', '0', 50000, 'CHQ # 25161221, CHQ Date: 2020-03-14 ( MEEZAN ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9256, '25161221', '2020-03-14', 'MEEZAN'),
('XCQ8KMHEZRV6NNR', '2020-02-07', '1', '1', '2', '0', 50000, 'CHQ # 25161222, CHQ Date: 2020-03-24 ( MEEZAN ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9256, '25161222', '2020-03-24', 'MEEZAN'),
('5EN8ZEDA8AUAYEX', '2020-02-07', '1', '1', '2', '0', 50000, 'CHQ # 25161223, CHQ Date: 2020-03-30 ( MEEZAN ) ; ZEESHAN', '8EC45YB7SSBDHR45SUYQ', 9256, '25161223', '2020-03-30', 'MEEZAN'),
('R29AN6OW1KTM4BT', '2020-02-08', '1', '1', '1', '0', 61000, ' CASH', '2DMS8EDL11ISWULICZDE', 9257, '', '0000-00-00', ''),
('MNVLKILBG15DQ43', '2020-02-12', '1', '1', '2', '0', 10000, 'CHQ # 11008550, CHQ Date: 2020-02-12 ( SUPPLIER CHQ ) ; KORANGI BISMILLAH PAINT/BAHL', 'ZSPRL6NCIQHI9SCRYKDH', 9258, '11008550', '2020-02-12', 'SUPPLIER CHQ'),
('IF5H8N2IAHCGBZ7', '2020-02-12', '1', '1', '2', '0', 15000, 'CHQ # 1754925433, CHQ Date: 2020-02-26 ( SUPPLIER CHQ ) ; FAKHRI PAINTS/MCB', 'ZSPRL6NCIQHI9SCRYKDH', 9258, '1754925433', '2020-02-26', 'SUPPLIER CHQ'),
('S4TXI3HM13MGQIX', '2020-02-12', '1', '1', '2', '0', 35000, 'CHQ # 25161225, CHQ Date: 2020-02-28 ( MEEZAN ) ; ZEESHAN', 'ZSPRL6NCIQHI9SCRYKDH', 9258, '25161225', '2020-02-28', 'MEEZAN'),
('5V9CNGYE2BMA4SW', '2020-02-14', '1', '1', '2', '0', 25000, 'CHQ # 30408313, CHQ Date: 2020-02-16 ( MEEZAN ) ; ZEESHAN', 'Q7FR2XS4JI3PV48ANWE2', 9259, '30408313', '2020-02-16', 'MEEZAN'),
('4U8QE9D7F35IQFU', '2020-02-14', '1', '1', '2', '0', 25000, 'CHQ # 30408314, CHQ Date: 2020-03-08 ( MEEZAN ) ; ZEESHAN', 'Q7FR2XS4JI3PV48ANWE2', 9259, '30408314', '2020-03-08', 'MEEZAN'),
('L1P7TKSTUO7APFE', '2020-02-14', '1', '1', '2', '0', 25000, 'CHQ # 1726231247, CHQ Date: 2020-02-15 ( SUPPLIER CHQ ) ; FAKHRI PAINT/JOHAR', 'Q849P2OLCS1QYZVYV1K7', 9260, '1726231247', '2020-02-15', 'SUPPLIER CHQ'),
('WQTDIBE2BUDZYJG', '2020-02-07', '1', '1', '1', '0', 70000, ' CASH', '8EM2GUI7NF8JLN7BK56L', 9261, '', '0000-00-00', ''),
('J6W9S2Z64V8CS7B', '2020-02-17', '1', '1', '2', '0', 73000, 'CHQ # 30408315, CHQ Date: 2020-02-18 ( MEEZAN ) ; ZEESHAN', '3URSQ9XJAVQPLR2YT7HL', 9262, '30408315', '2020-02-18', 'MEEZAN'),
('B3A5ID67PLLZ8PG', '2020-02-18', '1', '1', '2', '0', 64000, 'CHQ # 00000099, CHQ Date: 2020-02-26 ( HBL ) ; ZEESHAN', 'OIP8LT8QNBS1EXRILD5M', 9263, '00000099', '2020-02-26', 'HBL'),
('APUGXW8DX9VYAXC', '2020-02-17', '1', '1', '2', '0', 11400, 'CHQ # 11021584, CHQ Date: 2020-02-19 ( SUPPLIER CHQ ) ; BAHL/KORANGI BISMILLAH PAINT/KORANGI', 'AT9YQ8RYRMLR7M8P4JIA', 9264, '11021584', '2020-02-19', 'SUPPLIER CHQ'),
('X2J949IIC32TDP3', '2020-02-17', '1', '1', '1', '0', 14100, ' CASH SALE', 'AT9YQ8RYRMLR7M8P4JIA', 9264, '', '0000-00-00', ''),
('CB5P11SYDIXSUO6', '2020-02-17', '1', '1', '2', '0', 50000, 'CHQ # 6492675, CHQ Date: 2020-03-12 ( SUPPLIER CHQ ) ; ZEESHAN', 'ZZDE8VQ5MFPC9MZRNP7T', 9265, '6492675', '2020-03-12', 'SUPPLIER CHQ'),
('65LL253UNTRPGYB', '2020-02-19', '1', '1', '2', '0', 30000, 'CHQ # 30408316, CHQ Date: 2020-03-13 ( MEEZAN ) ; ZEESHAN', 'KVHAGIB239PCDIU1IFOL', 9266, '30408316', '2020-03-13', 'MEEZAN'),
('KRJ6MGMOEBOFACU', '2020-02-20', '1', '1', '1', '0', 20000, ' CASH', 'XOLLVIVKD7CEEFLQEPQN', 9267, '', '0000-00-00', ''),
('U6QWCY7QTNJ38J1', '2020-02-22', '1', '1', '2', '0', 23000, 'CHQ # 42847019, CHQ Date: 2020-03-06 ( SUPPLIER CHQ ) ; S.A PAINT/BOHRAPEER', 'D23F97RKV572XU63L93E', 9268, '42847019', '2020-03-06', 'SUPPLIER CHQ'),
('X8DJAV7PLPWRFRR', '2020-02-22', '1', '1', '2', '0', 50000, 'CHQ # 0095079328, CHQ Date: 2020-03-10 ( SUPPLIER CHQ ) ; NEW MEHRAN PAINT', 'D23F97RKV572XU63L93E', 9268, '0095079328', '2020-03-10', 'SUPPLIER CHQ'),
('1JWCATYFD325TG4', '2020-03-03', '1', '1', '2', '0', 38500, 'CHQ # 30408311, CHQ Date: 2020-02-20 ( MEEZAN ) ; ZEESHAN', 'OIP8LT8QNBS1EXRILD5M', 9269, '', '0000-00-00', ''),
('ON3IQ4HE4TT2MLR', '2020-03-03', '1', '1', '2', '0', 38500, 'CHQ # 30408312, CHQ Date: 2020-02-28 ( MEEZAN ) ; ZEESHAN', 'OIP8LT8QNBS1EXRILD5M', 9269, '', '0000-00-00', ''),
('DSS4VA16LUAVVKI', '2020-03-03', '1', '1', '2', '0', 50000, 'CHQ # 00095077322, CHQ Date: 2020-03-22 ( SUPPLIER CHQ ) ; MEHRAN PAINT', 'OIP8LT8QNBS1EXRILD5M', 9270, '00095077322', '2020-03-22', 'SUPPLIER CHQ'),
('UCI4Y38VK3UKIYQ', '2020-03-03', '1', '1', '2', '0', 20000, 'CHQ # 0000009, CHQ Date: 2020-03-05 ( SUPPLIER CHQ ) ; NOT MENTIONED', 'OIP8LT8QNBS1EXRILD5M', 9270, '0000009', '2020-03-05', 'SUPPLIER CHQ'),
('1YCOZ5JD65SG666', '2020-03-04', '1', '1', '2', '0', 10000, 'CHQ # 000000, CHQ Date: 2020-03-07 ( SUPPLIER CHQ ) ; KORANGI B.S.M/BAHL', 'HMITTMTF6JUD4XSUKFWZ', 9271, '000000', '2020-03-07', 'SUPPLIER CHQ'),
('4PNM7WNEUBSN5NM', '2020-03-04', '1', '1', '2', '0', 10000, 'CHQ # 000000, CHQ Date: 2020-03-16 ( SUPPLIER CHQ ) ; KORANGI B.S.M/BAHL', 'HMITTMTF6JUD4XSUKFWZ', 9271, '000000', '2020-03-16', 'SUPPLIER CHQ'),
('ZL1H57ZKUJ1FXWR', '2020-03-04', '1', '1', '2', '0', 40000, 'CHQ # 000000, CHQ Date: 2020-03-24 ( MEEZAN ) ; ZEESHAN', 'HMITTMTF6JUD4XSUKFWZ', 9271, '000000', '2020-03-24', 'MEEZAN'),
('I8JWJV4Z1WF9RFW', '2020-03-10', '1', '1', '2', '0', 48000, 'CHQ # 10655853, CHQ Date: 2020-03-21 ( BANK AL HABIB LIMITED ) ; ZEESHAN', 'FYYUDE5ZMRGGXLPD4PZL', 9272, '10655853', '2020-03-21', 'BANK AL HABIB LIMITED'),
('H5JJBODTF4VO3KU', '2020-03-10', '1', '1', '2', '0', 48000, 'CHQ # 10655854, CHQ Date: 2020-03-25 ( BANK AL HABIB LIMITED ) ; ZEESHAN', 'FYYUDE5ZMRGGXLPD4PZL', 9272, '10655854', '2020-03-25', 'BANK AL HABIB LIMITED'),
('NZGWEHJGFOV5J5D', '2020-03-10', '1', '1', '2', '0', 48000, 'CHQ # 10655855, CHQ Date: 2020-03-31 ( BANK AL HABIB LIMITED ) ; ZEESHAN', 'FYYUDE5ZMRGGXLPD4PZL', 9272, '10655855', '2020-03-31', 'BANK AL HABIB LIMITED'),
('L22U6B1VKE791Y9', '2020-03-10', '1', '1', '2', '0', 48000, 'CHQ # 10655856, CHQ Date: 2020-04-10 ( BANK AL HABIB LIMITED ) ; ZEESHAN', 'FYYUDE5ZMRGGXLPD4PZL', 9272, '10655856', '2020-04-10', 'BANK AL HABIB LIMITED'),
('GQGPB5245K9CVUZ', '2020-03-10', '1', '1', '2', '0', 48000, 'CHQ # 10655857, CHQ Date: 2020-04-14 ( BANK AL HABIB LIMITED ) ; ZEESHAN', 'FYYUDE5ZMRGGXLPD4PZL', 9272, '10655857', '2020-04-14', 'BANK AL HABIB LIMITED'),
('U2IX4JDLUJ57QLJ', '2020-03-10', '1', '1', '2', '0', 40000, 'CHQ # 30408319, CHQ Date: 2020-04-10 ( MEEZAN ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 9273, '30408319', '2020-04-10', 'MEEZAN'),
('RBC3JUPUB35DSWL', '2020-03-10', '1', '1', '2', '0', 40000, 'CHQ # 30408320, CHQ Date: 2020-04-15 ( MEEZAN ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 9273, '30408320', '2020-04-15', 'MEEZAN'),
('BVKLDMNE3538CMV', '2020-03-10', '1', '1', '2', '0', 40000, 'CHQ # 30408321, CHQ Date: 2020-04-21 ( MEEZAN ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 9273, '30408321', '2020-04-21', 'MEEZAN'),
('BW1LDXT7D5Q95KP', '2020-03-10', '1', '1', '2', '0', 40000, 'CHQ # 30408322, CHQ Date: 2020-04-26 ( MEEZAN ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 9273, '30408322', '2020-04-26', 'MEEZAN'),
('J98UV6FZSTSZ8QD', '2020-03-10', '1', '1', '2', '0', 40000, 'CHQ # 30408323, CHQ Date: 2020-03-30 ( MEEZAN ) ; ZEESHAN', '2RTL88CE6CZON8A48Q7H', 9273, '30408323', '2020-03-30', 'MEEZAN'),
('IQCO1RYLJNQOF2K', '2020-03-11', '1', '1', '2', '0', 15000, 'CHQ # 71021623, CHQ Date: 2020-03-28 ( SUPPLIER CHQ ) ; KORANGI BISMILLAH PAINT/KORANGI', '73841H2DMU823SWSFEI3', 9274, '71021623', '2020-03-28', 'SUPPLIER CHQ'),
('7GVC8BCEHR7A9MI', '2020-03-11', '1', '1', '1', '0', 10000, ' CASH', '73841H2DMU823SWSFEI3', 9274, '', '0000-00-00', ''),
('QQ3EGOPG418YDZF', '2020-03-12', '1', '1', '1', '0', 25000, ' CASH', 'GPL2UPO3UP5JPQ1M6DBX', 9275, '', '0000-00-00', ''),
('QPC1ZTA35U149IS', '2020-03-14', '1', '1', '2', '0', 50000, 'CHQ # 10655860, CHQ Date: 2020-03-30 ( BANK AL HABIB LIMITED ) ; ZEESHAN', 'OIP8LT8QNBS1EXRILD5M', 9276, '10655860', '2020-03-30', 'BANK AL HABIB LIMITED'),
('G9QAWZ2I9TE9CGI', '2020-03-15', '2', '1', '1', '2222', 0, '', 'ZSPRL6NCIQHI9SCRYKDH', NULL, NULL, NULL, NULL),
('XYDCH6T3HLYCK4V', '2020-03-17', '1', '1', '2', '0', 15000, 'CHQ # 00000091, CHQ Date: 2020-03-25 ( SUPPLIER CHQ ) ; NEW AL NOOR/HBL', 'PN6D6ZWHZOE6GNNVVE8E', 9277, '00000091', '2020-03-25', 'SUPPLIER CHQ'),
('83HYUVNFAL9KW61', '2020-03-17', '1', '1', '1', '0', 20000, ' CASH', 'ZZDE8VQ5MFPC9MZRNP7T', 9278, '', '0000-00-00', ''),
('6UA2JX4TK2PP92U', '2020-03-17', '1', '1', '2', '0', 30000, 'CHQ # 10655861, CHQ Date: 2020-03-25 ( BANK AL HABIB LIMITED ) ; ZEESHAN', 'ZZDE8VQ5MFPC9MZRNP7T', 9278, '10655861', '2020-03-25', 'BANK AL HABIB LIMITED'),
('8RMRIZ58Z4WNHAJ', '2020-03-17', '1', '1', '2', '0', 25000, 'CHQ # 30408324, CHQ Date: 2020-03-28 ( MEEZAN ) ; ZEESHAN', 'D23F97RKV572XU63L93E', 9279, '30408324', '2020-03-28', 'MEEZAN'),
('85D7M1OW81WYHWP', '2020-03-17', '1', '1', '1', '0', 25000, ' CASH', 'D23F97RKV572XU63L93E', 9279, '', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `unit_id` varchar(255) CHARACTER SET latin1 NOT NULL,
  `unit_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`unit_id`, `unit_name`, `status`) VALUES
('I3QT1TR3VJIYAZX', 'Piece', 1),
('W9YUY1HJQM9IEFT', 'KG', 1),
('XM4H48345SO6M94', 'test', 1),
('FH37LXW3DJNI4UX', 'Litre', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` varchar(15) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `gender` int(2) NOT NULL,
  `date_of_birth` varchar(255) NOT NULL,
  `logo` varchar(250) DEFAULT NULL,
  `status` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `last_name`, `first_name`, `gender`, `date_of_birth`, `logo`, `status`) VALUES
('1', 'Mughal', 'Kashif', 1, '', 'http://localhost/smart_grocery/assets/dist/img/profile_picture/e47382e50e13ea6b7b1ab44be0439ffa.jpg', 1),
('oZTpXAmq4itvJmY', 'khan', 'Sourav', 0, '', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

CREATE TABLE `user_login` (
  `user_id` varchar(15) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` int(2) NOT NULL,
  `security_code` varchar(255) NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_login`
--

INSERT INTO `user_login` (`user_id`, `username`, `password`, `user_type`, `security_code`, `status`) VALUES
('1', 'test@test.com', '41d99b369894eb1ec3f461135132d8bb', 1, '', 1),
('oZTpXAmq4itvJmY', 's@demo.com', 'e10adc3949ba59abbe56e057f20f883e', 2, '41d99b369894eb1ec3f461135132d8bb', 1);

-- --------------------------------------------------------

--
-- Table structure for table `view_customer_transection`
--

CREATE TABLE `view_customer_transection` (
  `transaction_id` varchar(30) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `invoice_no` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `view_person_transection`
--

CREATE TABLE `view_person_transection` (
  `transaction_id` varchar(30) DEFAULT NULL,
  `person_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `view_supplier_transection`
--

CREATE TABLE `view_supplier_transection` (
  `transaction_id` varchar(30) DEFAULT NULL,
  `supplier_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `view_transection`
--

CREATE TABLE `view_transection` (
  `transaction_id` varchar(30) DEFAULT NULL,
  `date_of_transection` varchar(30) DEFAULT NULL,
  `amount` varchar(20) DEFAULT NULL,
  `pay_amount` int(30) DEFAULT NULL,
  `invoice_no` varchar(100) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `supplier_name` varchar(255) DEFAULT NULL,
  `person_name` varchar(50) DEFAULT NULL,
  `transection_category` varchar(30) DEFAULT NULL,
  `transection_type` varchar(30) DEFAULT NULL,
  `transection_mood` varchar(25) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `relation_id` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Indexes for table `account_2`
--
ALTER TABLE `account_2`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `employee_information`
--
ALTER TABLE `employee_information`
  ADD PRIMARY KEY (`employee_id`);

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
-- Indexes for table `grocery_products`
--
ALTER TABLE `grocery_products`
  ADD PRIMARY KEY (`ProductId`),
  ADD KEY `FK_ProductCategory_GroceryCategoryId` (`Category`);

--
-- Indexes for table `grocery_unit`
--
ALTER TABLE `grocery_unit`
  ADD PRIMARY KEY (`UnitId`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`note_id`);

--
-- Indexes for table `product_information`
--
ALTER TABLE `product_information`
  ADD PRIMARY KEY (`product_uuid`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_product`
--
ALTER TABLE `supplier_product`
  ADD PRIMARY KEY (`supplier_pr_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_2`
--
ALTER TABLE `account_2`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employee_information`
--
ALTER TABLE `employee_information`
  MODIFY `employee_id` bigint(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `grocery_brand`
--
ALTER TABLE `grocery_brand`
  MODIFY `BrandId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `grocery_category`
--
ALTER TABLE `grocery_category`
  MODIFY `CategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `grocery_order`
--
ALTER TABLE `grocery_order`
  MODIFY `OrderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `grocery_order_detail`
--
ALTER TABLE `grocery_order_detail`
  MODIFY `OrderDetailId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `grocery_products`
--
ALTER TABLE `grocery_products`
  MODIFY `ProductId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `grocery_unit`
--
ALTER TABLE `grocery_unit`
  MODIFY `UnitId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=577;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `note_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_information`
--
ALTER TABLE `product_information`
  MODIFY `product_uuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4590;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `supplier_product`
--
ALTER TABLE `supplier_product`
  MODIFY `supplier_pr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

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
