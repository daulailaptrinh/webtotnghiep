-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2023 at 11:12 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `113`
--

-- --------------------------------------------------------

--
-- Table structure for table `cms_customers`
--

CREATE TABLE `cms_customers` (
  `ID` int(10) UNSIGNED NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_code` varchar(10) NOT NULL,
  `customer_phone` varchar(20) NOT NULL,
  `customer_email` varchar(150) NOT NULL,
  `customer_addr` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  `customer_birthday` date NOT NULL,
  `customer_gender` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `user_init` int(11) NOT NULL,
  `user_upd` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_discount`
--

CREATE TABLE `cms_discount` (
  `ID` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `percent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cms_discount`
--

INSERT INTO `cms_discount` (`ID`, `product`, `percent`) VALUES
(1, 120, 5),
(9, 121, 0),
(10, 125, 10),
(11, 123, 10);

-- --------------------------------------------------------

--
-- Table structure for table `cms_input`
--

CREATE TABLE `cms_input` (
  `ID` int(10) UNSIGNED NOT NULL,
  `input_code` varchar(9) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `input_date` datetime NOT NULL,
  `notes` varchar(255) NOT NULL,
  `payment_method` tinyint(4) NOT NULL,
  `total_price` int(13) NOT NULL,
  `total_quantity` int(9) NOT NULL,
  `discount` int(11) NOT NULL,
  `total_money` int(13) NOT NULL,
  `payed` int(11) NOT NULL,
  `lack` int(13) NOT NULL,
  `detail_input` text NOT NULL,
  `input_status` tinyint(1) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `user_init` int(11) NOT NULL,
  `user_upd` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `cms_inventory`
--

CREATE TABLE `cms_inventory` (
  `store_id` int(5) NOT NULL,
  `product_id` int(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_init` int(11) NOT NULL,
  `user_upd` int(11) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cms_inventory`
--

INSERT INTO `cms_inventory` (`store_id`, `product_id`, `quantity`, `user_init`, `user_upd`, `created`, `updated`) VALUES
(8, 119, 0, 24, 2, '2023-05-31 10:47:52', '2023-05-31 11:14:31'),
(7, 120, 10, 2, NULL, '2023-05-31 11:02:16', NULL),
(7, 121, 100, 2, NULL, '2023-05-31 11:02:59', NULL),
(1, 120, -15, 2, 26, '2023-05-31 11:17:01', '2023-06-13 14:40:28'),
(1, 121, -2, 2, 26, '2023-05-31 11:25:35', '2023-06-13 14:40:28'),
(1, 122, 20, 2, NULL, '2023-05-31 11:26:23', NULL),
(8, 123, 100, 2, NULL, '2023-06-13 13:52:29', NULL),
(8, 124, 11, 2, 2, '2023-06-13 13:54:39', '2023-06-13 14:34:12'),
(8, 120, -3, 2, 2, '2023-06-13 14:23:17', '2023-06-18 16:01:58'),
(8, 121, -3, 2, 2, '2023-06-13 14:23:17', '2023-06-18 16:01:58'),
(8, 125, 99, 2, 2, '2023-06-13 14:35:09', '2023-06-13 14:39:10'),
(2, 120, -1, 25, NULL, '2023-06-13 14:40:58', NULL),
(2, 121, -1, 25, NULL, '2023-06-13 14:40:58', NULL),
(2, 122, -1, 25, NULL, '2023-06-13 14:40:58', NULL),
(2, 125, -1, 25, NULL, '2023-06-13 14:40:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_orders`
--

CREATE TABLE `cms_orders` (
  `ID` int(10) UNSIGNED NOT NULL,
  `output_code` varchar(9) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `sell_date` datetime NOT NULL,
  `notes` varchar(255) NOT NULL,
  `payment_method` tinyint(4) NOT NULL,
  `total_price` int(13) NOT NULL,
  `total_origin_price` int(11) NOT NULL,
  `coupon` int(11) NOT NULL,
  `customer_pay` int(11) NOT NULL,
  `total_money` int(13) NOT NULL,
  `total_quantity` int(9) NOT NULL,
  `lack` int(13) NOT NULL,
  `detail_order` text NOT NULL,
  `order_status` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `user_init` int(11) NOT NULL,
  `user_upd` int(11) NOT NULL,
  `sale_id` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cms_orders`
--

INSERT INTO `cms_orders` (`ID`, `output_code`, `customer_id`, `store_id`, `sell_date`, `notes`, `payment_method`, `total_price`, `total_origin_price`, `coupon`, `customer_pay`, `total_money`, `total_quantity`, `lack`, `detail_order`, `order_status`, `deleted`, `created`, `updated`, `user_init`, `user_upd`, `sale_id`) VALUES
(250, 'PX0000001', 40, 1, '2023-05-31 11:17:01', '', 1, 20000, 10000, 0, 20000, 20000, 2, 0, '[{\"id\":\"120\",\"quantity\":\"2\",\"price\":\"10000\",\"discount\":\"0\"}]', 1, 0, '2023-05-31 11:17:01', '0000-00-00 00:00:00', 2, 0, 26),
(251, 'PX0000002', 41, 1, '2023-05-31 11:25:35', '', 1, 15000, 7000, 0, 15000, 15000, 1, 0, '[{\"id\":\"121\",\"quantity\":\"1\",\"price\":\"15000\",\"discount\":\"0\"}]', 1, 0, '2023-05-31 11:25:35', '0000-00-00 00:00:00', 2, 0, 26),
(252, 'PX0000003', 42, 1, '2023-06-01 14:19:52', '', 1, 30000, 15000, 0, 30000, 30000, 3, 0, '[{\"id\":\"120\",\"quantity\":\"3\",\"price\":\"10000\",\"discount\":\"0\"}]', 1, 0, '2023-06-01 14:19:52', '0000-00-00 00:00:00', 2, 0, 26),
(253, 'PX0000004', 0, 8, '2023-06-13 14:23:17', '', 1, 25978, 12111, 0, 25977, 25978, 3, 1, '[{\"id\":\"120\",\"quantity\":\"1\",\"price\":10000,\"discount\":\"0\"},{\"id\":\"121\",\"quantity\":\"1\",\"price\":15000,\"discount\":\"0\"},{\"id\":\"124\",\"quantity\":\"1\",\"price\":977.6800000000001,\"discount\":\"0\"}]', 1, 1, '2023-06-13 14:23:17', '2023-06-13 14:34:12', 2, 2, 0),
(254, 'PX0000005', 0, 8, '2023-06-13 14:39:10', '', 1, 51500, 25000, 0, 51500, 51500, 4, 0, '[{\"id\":\"120\",\"quantity\":\"1\",\"price\":9500,\"discount\":\"0\"},{\"id\":\"125\",\"quantity\":\"1\",\"price\":12000,\"discount\":\"0\"},{\"id\":\"121\",\"quantity\":\"2\",\"price\":15000,\"discount\":\"0\"}]', 1, 0, '2023-06-13 14:39:10', '0000-00-00 00:00:00', 2, 0, 0),
(255, 'PX0000006', 0, 1, '2023-06-13 14:40:28', '', 1, 110000, 57000, 0, 110000, 110000, 11, 0, '[{\"id\":\"121\",\"quantity\":\"1\",\"price\":15000,\"discount\":\"0\"},{\"id\":\"120\",\"quantity\":\"10\",\"price\":9500,\"discount\":\"0\"}]', 1, 0, '2023-06-13 14:40:28', '0000-00-00 00:00:00', 26, 0, 0),
(256, 'PX0000007', 0, 2, '2023-06-13 14:40:58', '', 1, 56500, 28000, 0, 56500, 56500, 4, 0, '[{\"id\":\"120\",\"quantity\":\"1\",\"price\":9500,\"discount\":\"0\"},{\"id\":\"121\",\"quantity\":\"1\",\"price\":15000,\"discount\":\"0\"},{\"id\":\"122\",\"quantity\":\"1\",\"price\":20000,\"discount\":\"0\"},{\"id\":\"125\",\"quantity\":\"1\",\"price\":12000,\"discount\":\"0\"}]', 1, 0, '2023-06-13 14:40:58', '0000-00-00 00:00:00', 25, 0, 0),
(257, 'PX0000008', 0, 8, '2023-06-18 14:44:45', '', 1, 9500, 5000, 0, 9500, 9500, 1, 0, '[{\"id\":\"120\",\"quantity\":\"1\",\"price\":9500,\"discount\":\"0\"}]', 1, 0, '2023-06-18 14:44:45', '0000-00-00 00:00:00', 2, 0, 0),
(258, 'PX0000009', 0, 8, '2023-06-18 16:01:58', '', 1, 24500, 12000, 0, 24500, 24500, 2, 0, '[{\"id\":\"120\",\"quantity\":\"1\",\"price\":9500,\"discount\":\"0\"},{\"id\":\"121\",\"quantity\":\"1\",\"price\":15000,\"discount\":\"0\"}]', 1, 0, '2023-06-18 16:01:58', '0000-00-00 00:00:00', 2, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cms_permissions`
--

CREATE TABLE `cms_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_url` varchar(255) NOT NULL,
  `permission_name` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cms_permissions`
--

INSERT INTO `cms_permissions` (`id`, `permission_url`, `permission_name`) VALUES
(1, 'backend/dashboard', 'Báo cáo mỗi ngày'),
(2, 'backend/order', 'Đơn hàng'),
(3, 'backend/product', 'Hàng Hóa'),
(5, 'backend/import', 'Nhập hàng'),
(6, 'backend/inventory', 'Báo cáo tồn kho'),
(10, 'backend/config', 'Thiết lập (Thông tin cửa hàng, nhân viên, thiết lập bán hàng, phân quyền)');

-- --------------------------------------------------------

--
-- Table structure for table `cms_products`
--

CREATE TABLE `cms_products` (
  `ID` int(10) UNSIGNED NOT NULL,
  `prd_code` varchar(15) NOT NULL,
  `prd_name` varchar(255) NOT NULL,
  `prd_sls` int(11) NOT NULL,
  `prd_origin_price` int(11) NOT NULL,
  `prd_sell_price` int(11) NOT NULL,
  `prd_vat` tinyint(4) NOT NULL,
  `prd_status` tinyint(1) NOT NULL DEFAULT 1,
  `prd_inventory` tinyint(1) NOT NULL,
  `prd_allownegative` tinyint(1) NOT NULL,
  `prd_manufacture_id` int(11) NOT NULL,
  `prd_group_id` int(11) NOT NULL,
  `prd_image_url` int(11) NOT NULL,
  `prd_descriptions` text NOT NULL,
  `prd_manuf_id` int(11) NOT NULL,
  `prd_hot` tinyint(1) NOT NULL,
  `prd_new` tinyint(1) NOT NULL,
  `prd_highlight` tinyint(1) NOT NULL,
  `display_website` tinyint(1) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `user_init` int(11) NOT NULL,
  `user_upd` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cms_products`
--

INSERT INTO `cms_products` (`ID`, `prd_code`, `prd_name`, `prd_sls`, `prd_origin_price`, `prd_sell_price`, `prd_vat`, `prd_status`, `prd_inventory`, `prd_allownegative`, `prd_manufacture_id`, `prd_group_id`, `prd_image_url`, `prd_descriptions`, `prd_manuf_id`, `prd_hot`, `prd_new`, `prd_highlight`, `display_website`, `created`, `updated`, `user_init`, `user_upd`, `deleted`) VALUES
(120, 'CF001', 'Cà phê đá', 86, 5000, 10000, 0, 1, 0, 0, 48, 138, 0, '', 0, 0, 0, 0, 0, '2023-05-31 11:02:16', '2023-06-18 16:01:58', 2, 2, 0),
(121, 'CF002', 'Cà phê sữa', 95, 7000, 15000, 0, 1, 0, 0, 48, 138, 0, '', 0, 0, 0, 0, 0, '2023-05-31 11:02:59', '2023-06-18 16:01:58', 2, 2, 0),
(122, 'CF003', 'Trà sữa', 99, 10000, 20000, 0, 1, 0, 0, 48, 138, 0, '', 0, 0, 0, 0, 0, '2023-05-31 11:26:23', '2023-06-13 14:40:58', 2, 2, 0),
(123, 'SP00001', 'Cà phê sữa', 100, 7000, 15000, 0, 1, 0, 0, 48, 138, 0, '', 0, 0, 0, 0, 0, '2023-06-13 13:52:29', '2023-06-13 14:21:15', 2, 2, 0),
(124, 'SP00002', 'Trà đá', 11, 111, 1111, 0, 1, 0, 0, 48, 138, 0, '', 0, 0, 0, 0, 0, '2023-06-13 13:54:39', '2023-06-13 14:34:17', 2, 2, 1),
(125, 'SP00003', 'Bánh mì que', 98, 6000, 15000, 0, 1, 0, 0, 48, 138, 0, '', 0, 0, 0, 0, 0, '2023-06-13 14:35:09', '2023-06-13 14:40:58', 2, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cms_products_group`
--

CREATE TABLE `cms_products_group` (
  `ID` int(10) UNSIGNED NOT NULL,
  `prd_group_name` varchar(255) NOT NULL,
  `parentid` int(11) NOT NULL,
  `level` tinyint(4) NOT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `user_init` tinyint(4) NOT NULL,
  `user_upd` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cms_products_group`
--

INSERT INTO `cms_products_group` (`ID`, `prd_group_name`, `parentid`, `level`, `lft`, `rgt`, `created`, `updated`, `user_init`, `user_upd`) VALUES
(138, 'Đồ uống', -1, 0, 0, 0, '2023-05-31 11:02:04', '0000-00-00 00:00:00', 2, 0),
(139, 'Đồ ăn sáng', -1, 0, 0, 0, '2023-06-13 14:35:06', '0000-00-00 00:00:00', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cms_products_manufacture`
--

CREATE TABLE `cms_products_manufacture` (
  `ID` int(10) UNSIGNED NOT NULL,
  `prd_manuf_name` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `user_init` int(11) NOT NULL,
  `user_upd` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `cms_products_manufacture`
--

INSERT INTO `cms_products_manufacture` (`ID`, `prd_manuf_name`, `created`, `updated`, `user_init`, `user_upd`) VALUES
(48, 'TakeAway', '2023-05-31 11:00:57', '0000-00-00 00:00:00', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cms_report`
--

CREATE TABLE `cms_report` (
  `ID` int(10) UNSIGNED NOT NULL,
  `transaction_code` varchar(9) NOT NULL,
  `transaction_id` int(10) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `store_id` int(5) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `notes` varchar(255) NOT NULL,
  `product_id` int(10) NOT NULL,
  `discount` int(11) NOT NULL,
  `total_money` int(13) NOT NULL,
  `origin_price` int(11) NOT NULL,
  `input` int(11) NOT NULL,
  `output` int(9) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `user_init` int(11) NOT NULL,
  `user_upd` int(11) NOT NULL,
  `sale_id` int(5) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cms_report`
--

INSERT INTO `cms_report` (`ID`, `transaction_code`, `transaction_id`, `customer_id`, `store_id`, `date`, `notes`, `product_id`, `discount`, `total_money`, `origin_price`, `input`, `output`, `price`, `deleted`, `created`, `updated`, `user_init`, `user_upd`, `sale_id`, `supplier_id`, `type`, `stock`) VALUES
(382, 'PX0000006', 248, 34, 8, '2023-05-31 10:47:52', '', 119, 0, 300000, 150000, 0, 1, 300000, 1, '2023-05-31 10:47:52', '2023-05-31 11:14:31', 24, 2, 9, 0, 3, -1),
(383, 'CF001', 0, 0, 7, '2023-05-31 11:02:16', 'Khai báo hàng hóa', 120, 0, 0, 0, 10, 0, 0, 0, '2023-05-31 11:02:16', '0000-00-00 00:00:00', 2, 0, 0, 0, 1, 10),
(384, 'CF002', 0, 0, 7, '2023-05-31 11:02:59', 'Khai báo hàng hóa', 121, 0, 0, 0, 100, 0, 0, 0, '2023-05-31 11:02:59', '0000-00-00 00:00:00', 2, 0, 0, 0, 1, 100),
(385, 'PX0000001', 250, 40, 1, '2023-05-31 11:17:01', '', 120, 0, 20000, 10000, 0, 2, 10000, 0, '2023-05-31 11:17:01', '0000-00-00 00:00:00', 2, 0, 26, 0, 3, -2),
(386, 'PX0000002', 251, 41, 1, '2023-05-31 11:25:35', '', 121, 0, 15000, 7000, 0, 1, 15000, 0, '2023-05-31 11:25:35', '0000-00-00 00:00:00', 2, 0, 26, 0, 3, -1),
(387, 'CF003', 0, 0, 1, '2023-05-31 11:26:23', 'Khai báo hàng hóa', 122, 0, 0, 0, 20, 0, 0, 0, '2023-05-31 11:26:23', '0000-00-00 00:00:00', 2, 0, 0, 0, 1, 20),
(388, 'PX0000003', 252, 42, 1, '2023-06-01 14:19:52', '', 120, 0, 30000, 15000, 0, 3, 10000, 0, '2023-06-01 14:19:52', '0000-00-00 00:00:00', 2, 0, 26, 0, 3, -5),
(389, 'SP00001', 0, 0, 8, '2023-06-13 13:52:29', 'Khai báo hàng hóa', 123, 0, 0, 0, 100, 0, 0, 0, '2023-06-13 13:52:29', '0000-00-00 00:00:00', 2, 0, 0, 0, 1, 100),
(390, 'SP00002', 0, 0, 8, '2023-06-13 13:54:39', 'Khai báo hàng hóa', 124, 0, 0, 0, 11, 0, 0, 0, '2023-06-13 13:54:39', '0000-00-00 00:00:00', 2, 0, 0, 0, 1, 11),
(391, 'PX0000004', 253, 0, 8, '2023-06-13 14:23:17', '', 120, 0, 10000, 5000, 0, 1, 10000, 1, '2023-06-13 14:23:17', '2023-06-13 14:34:12', 2, 2, 0, 0, 3, -1),
(392, 'PX0000004', 253, 0, 8, '2023-06-13 14:23:17', '', 121, 0, 15000, 7000, 0, 1, 15000, 1, '2023-06-13 14:23:17', '2023-06-13 14:34:12', 2, 2, 0, 0, 3, -1),
(393, 'PX0000004', 253, 0, 8, '2023-06-13 14:23:17', '', 124, 0, 1111, 111, 0, 1, 1111, 1, '2023-06-13 14:23:17', '2023-06-13 14:34:12', 2, 2, 0, 0, 3, 10),
(394, 'SP00003', 0, 0, 8, '2023-06-13 14:35:09', 'Khai báo hàng hóa', 125, 0, 0, 0, 100, 0, 0, 0, '2023-06-13 14:35:09', '0000-00-00 00:00:00', 2, 0, 0, 0, 1, 100),
(395, 'PX0000005', 254, 0, 8, '2023-06-13 14:39:10', '', 120, 0, 10000, 5000, 0, 1, 10000, 0, '2023-06-13 14:39:10', '0000-00-00 00:00:00', 2, 0, 0, 0, 3, -1),
(396, 'PX0000005', 254, 0, 8, '2023-06-13 14:39:10', '', 125, 0, 15000, 6000, 0, 1, 15000, 0, '2023-06-13 14:39:10', '0000-00-00 00:00:00', 2, 0, 0, 0, 3, 99),
(397, 'PX0000005', 254, 0, 8, '2023-06-13 14:39:10', '', 121, 0, 30000, 14000, 0, 2, 15000, 0, '2023-06-13 14:39:10', '0000-00-00 00:00:00', 2, 0, 0, 0, 3, -2),
(398, 'PX0000006', 255, 0, 1, '2023-06-13 14:40:28', '', 121, 0, 15000, 7000, 0, 1, 15000, 0, '2023-06-13 14:40:28', '0000-00-00 00:00:00', 26, 0, 0, 0, 3, -2),
(399, 'PX0000006', 255, 0, 1, '2023-06-13 14:40:28', '', 120, 0, 100000, 50000, 0, 10, 10000, 0, '2023-06-13 14:40:28', '0000-00-00 00:00:00', 26, 0, 0, 0, 3, -15),
(400, 'PX0000007', 256, 0, 2, '2023-06-13 14:40:58', '', 120, 0, 10000, 5000, 0, 1, 10000, 0, '2023-06-13 14:40:58', '0000-00-00 00:00:00', 25, 0, 0, 0, 3, -1),
(401, 'PX0000007', 256, 0, 2, '2023-06-13 14:40:58', '', 121, 0, 15000, 7000, 0, 1, 15000, 0, '2023-06-13 14:40:58', '0000-00-00 00:00:00', 25, 0, 0, 0, 3, -1),
(402, 'PX0000007', 256, 0, 2, '2023-06-13 14:40:58', '', 122, 0, 20000, 10000, 0, 1, 20000, 0, '2023-06-13 14:40:58', '0000-00-00 00:00:00', 25, 0, 0, 0, 3, -1),
(403, 'PX0000007', 256, 0, 2, '2023-06-13 14:40:58', '', 125, 0, 15000, 6000, 0, 1, 15000, 0, '2023-06-13 14:40:58', '0000-00-00 00:00:00', 25, 0, 0, 0, 3, -1),
(404, 'PX0000008', 257, 0, 8, '2023-06-18 14:44:45', '', 120, 0, 10000, 5000, 0, 1, 10000, 0, '2023-06-18 14:44:45', '0000-00-00 00:00:00', 2, 0, 0, 0, 3, -2),
(405, 'PX0000009', 258, 0, 8, '2023-06-18 16:01:58', '', 120, 0, 10000, 5000, 0, 1, 10000, 0, '2023-06-18 16:01:58', '0000-00-00 00:00:00', 2, 0, 0, 0, 3, -3),
(406, 'PX0000009', 258, 0, 8, '2023-06-18 16:01:58', '', 121, 0, 15000, 7000, 0, 1, 15000, 0, '2023-06-18 16:01:58', '0000-00-00 00:00:00', 2, 0, 0, 0, 3, -3);

-- --------------------------------------------------------

--
-- Table structure for table `cms_stores`
--

CREATE TABLE `cms_stores` (
  `ID` int(5) UNSIGNED NOT NULL,
  `stock_name` varchar(255) NOT NULL,
  `user_init` int(11) NOT NULL,
  `user_upd` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cms_stores`
--

INSERT INTO `cms_stores` (`ID`, `stock_name`, `user_init`, `user_upd`, `created`, `updated`) VALUES
(1, 'Cửa hàng số 1', 1, 1, '2016-05-11 00:00:00', '2019-06-14 19:59:55'),
(2, 'Cửa hàng số 2', 1, 1, '2016-05-23 00:00:00', '2019-06-14 20:00:03'),
(6, 'Cửa hàng số 3', 2, 0, '2017-10-18 03:54:50', '2019-06-14 20:00:09'),
(7, 'Cửa hàng số 4', 2, 0, '2019-06-14 19:57:44', '2019-06-14 20:00:15'),
(8, 'Cửa hàng số 5', 2, 0, '2019-06-14 19:58:08', '2019-06-14 20:00:22');

-- --------------------------------------------------------

--
-- Table structure for table `cms_suppliers`
--

CREATE TABLE `cms_suppliers` (
  `ID` int(10) UNSIGNED NOT NULL,
  `supplier_code` varchar(10) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `supplier_phone` varchar(30) NOT NULL,
  `supplier_email` varchar(150) NOT NULL,
  `supplier_addr` varchar(255) NOT NULL,
  `tax_code` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `user_init` int(11) NOT NULL,
  `user_upd` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_templates`
--

CREATE TABLE `cms_templates` (
  `id` int(5) NOT NULL,
  `type` int(5) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `user_upd` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cms_templates`
--

INSERT INTO `cms_templates` (`id`, `type`, `name`, `content`, `created`, `updated`, `user_upd`) VALUES
(1, 1, 'Hóa đơn bán hàng (Pos)', '<div style=\"text-align:center\"><strong>H&Oacute;A ĐƠN B&Aacute;N H&Agrave;NG</strong><br />\n<strong>{Ma_Don_Hang}</strong></div>\n\n<div style=\"text-align:center\">&nbsp;</div>\n\n<div>\n<p><strong>Ng&agrave;y b&aacute;n:</strong> {Ngay_Xuat}<br />\n<strong>Kh&aacute;ch h&agrave;ng:</strong> {Khach_Hang}<br />\n<strong>Địa Chỉ:</strong> {DC_Khach_Hang}<br />\n<strong>ĐT: </strong>{DT_Khach_Hang}</p>\n</div>\n\n<div>{Chi_Tiet_San_Pham}</div>\n\n<div>&nbsp;</div>\n\n<table style=\"width:100%\">\n	<tbody>\n		<tr>\n			<td style=\"text-align:right\">Tổng tiền h&agrave;ng:</td>\n			<td style=\"text-align:right\">{Tong_Tien_Hang}</td>\n		</tr>\n		<tr>\n			<td style=\"text-align:right\">Giảm gi&aacute;:</td>\n			<td style=\"text-align:right\">{Chiec_Khau}</td>\n		</tr>\n		<tr>\n			<td style=\"text-align:right\">Đã Thu</td>\n			<td style=\"text-align:right\">{Khach_Dua}</td>\n		</tr>\n		<tr>\n			<td style=\"text-align:right\">Tổng thanh to&aacute;n:</td>\n			<td style=\"text-align:right\"><strong>{Con_No}</strong></td>\n		</tr>\n	</tbody>\n</table>\n\n<p style=\"text-align:center\">Số tiền bằng chữ: {So_Tien_Bang_Chu}&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>\n\n<p style=\"text-align:center\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<strong>NGƯỜI B&Aacute;N H&Agrave;NG</strong></p>\n\n<p>&nbsp;</p>\n\n<p style=\"text-align:right\"><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong></p>\n\n<p style=\"text-align:right\"><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {Ten_Nhan_Vien}&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong></p>\n', NULL, '2017-11-21 09:06:38', 2),
(2, 2, 'Hóa đơn bán hàng (order)', '<div style=\"text-align:center\"><strong>H&Oacute;A ĐƠN B&Aacute;N H&Agrave;NG</strong><br />\n<strong>{Ma_Don_Hang}</strong></div>\n\n<div><strong>Ng&agrave;y b&aacute;n:</strong> {Ngay_Xuat}</div>\n\n<div><strong>Kh&aacute;ch h&agrave;ng:</strong> {Khach_Hang}</div>\n\n<div><strong>Thu ng&acirc;n:</strong> {Thu_Ngan}</div>\n\n<p>&nbsp;</p>\n\n<table style=\"width:100%\">\n	<tbody>\n		<tr>\n			<td style=\"width:35%\"><strong>Đơn gi&aacute;</strong></td>\n			<td style=\"text-align:center; width:30%\"><strong>SL</strong></td>\n			<td style=\"text-align:right\"><strong>TT</strong></td>\n		</tr>\n		<tr>\n			<td colspan=\"3\">{Ten_Hang_Hoa}</td>\n		</tr>\n		<tr>\n			<td>{Don_Gia}</td>\n			<td style=\"text-align:center\">{So_Luong}</td>\n			<td style=\"text-align:right\">{Thanh_Tien}</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>&nbsp;</p>\n\n<table style=\"width:100%\">\n	<tbody>\n		<tr>\n			<td style=\"text-align:right\">Tổng tiền h&agrave;ng:</td>\n			<td style=\"text-align:right\">{Tong_Tien_Hang}</td>\n		</tr>\n		<tr>\n			<td style=\"text-align:right\">Giảm gi&aacute;:</td>\n			<td style=\"text-align:right\">{Chiec_Khau}</td>\n		</tr>\n		<tr>\n			<td style=\"text-align:right\">Th&agrave;nh tiền:</td>\n			<td style=\"text-align:right\">{Tong_Tien}</td>\n		</tr>\n		<tr>\n			<td style=\"text-align:right\">Kh&aacute;ch đưa</td>\n			<td style=\"text-align:right\">{Khach_Dua}</td>\n		</tr>\n		<tr>\n			<td style=\"text-align:right\">Tổng thanh to&aacute;n:</td>\n			<td style=\"text-align:right\"><strong>{Con_No}</strong></td>\n		</tr>\n	</tbody>\n</table>\n\n<p>&nbsp;</p>\n\n<p style=\"text-align:left\">Ghi ch&uacute;: {Ghi_Chu}</p>\n\n<div style=\"text-align:left\">Xin cảm ơn v&agrave; hẹn gặp lại!</div>\n', NULL, '2017-10-26 23:20:44', 2),
(3, 3, 'Hóa đơn phiếu nhập', '<div style=\"text-align:center\"><strong>H&Oacute;A ĐƠN B&Aacute;N H&Agrave;NG</strong><br />\n<strong>{Ma_Don_Hang}</strong></div>\n\n<div style=\"text-align:center\">&nbsp;</div>\n\n<div>\n<p><strong>Ng&agrave;y b&aacute;n:</strong> {Ngay_Xuat}<br />\n<strong>Kh&aacute;ch h&agrave;ng:</strong> {Khach_Hang}<br />\n<strong>Địa Chỉ:</strong> {DC_Khach_Hang}<br />\n<strong>ĐT: </strong>{DT_Khach_Hang}</p>\n</div>\n\n<div>{Chi_Tiet_San_Pham}</div>\n\n<div>&nbsp;</div>\n\n<table style=\"width:100%\">\n	<tbody>\n		<tr>\n			<td style=\"text-align:right\">Tổng tiền h&agrave;ng:</td>\n			<td style=\"text-align:right\">{Tong_Tien_Hang}</td>\n		</tr>\n		<tr>\n			<td style=\"text-align:right\">Giảm gi&aacute;:</td>\n			<td style=\"text-align:right\">{Chiec_Khau}</td>\n		</tr>\n		<tr>\n			<td style=\"text-align:right\">Đã thu</td>\n			<td style=\"text-align:right\">{Khach_Dua}</td>\n		</tr>\n		<tr>\n			<td style=\"text-align:right\">Tổng thanh to&aacute;n:</td>\n			<td style=\"text-align:right\"><strong>{Con_No}</strong></td>\n		</tr>\n	</tbody>\n</table>\n\n<p style=\"text-align:center\">Số tiền bằng chữ: {So_Tien_Bang_Chu}&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>\n\n<p style=\"text-align:right\">&nbsp;<strong>NGƯỜI B&Aacute;N H&Agrave;NG</strong></p>\n\n<p>&nbsp;</p>\n\n<p style=\"text-align:right\"><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong></p>\n\n<p style=\"text-align:right\"><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {Ten_Nhan_Vien}&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong></p>\n', NULL, '2017-11-05 22:07:52', 2);

-- --------------------------------------------------------

--
-- Table structure for table `cms_users`
--

CREATE TABLE `cms_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `email` varchar(120) NOT NULL,
  `display_name` varchar(120) NOT NULL,
  `user_status` tinyint(4) NOT NULL,
  `group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `logined` datetime(1) NOT NULL,
  `ip_logged` varchar(255) NOT NULL,
  `recode` varchar(255) NOT NULL,
  `code_time_out` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cms_users`
--

INSERT INTO `cms_users` (`id`, `username`, `password`, `salt`, `email`, `display_name`, `user_status`, `group_id`, `store_id`, `created`, `updated`, `logined`, `ip_logged`, `recode`, `code_time_out`) VALUES
(2, 'admin', 'b2c11f04424b018932f7df7531e2022e', 'c9eXKhDUw26jCmyYnhVXZLIHcO8KD2KZIMNJYEzk9WFQm6lJabkYQ0aVCwDSFvNiaZWh3', 'admin@admin.com', 'admin', 1, 1, 8, '2017-09-25 23:01:53', '2023-06-18 14:56:44', '2023-06-18 16:01:50.0', '::1', '', ''),
(26, 'trung_ql', '29412291540d5479e789a486b09ea4e5', 'y($&@x)Ie8PClugI%dZECyKwNs%mwPHFd$BWNAjfwqwS8f7AcxNiNM6uMshvEoY5Amc&4', 'trung_ql@gmail.com', 'Đặng Thành Trung', 1, 2, 1, '2023-05-31 10:55:38', '2023-06-13 14:36:00', '2023-06-13 14:39:27.0', '::1', '', ''),
(25, 'trung_nv', '3c124ea54c0d1f996ba21a9c2050cfee', 'KHU%NcK1LqIhLyLQlkHDr*h(k5b*P*4JSLmnjhAEZae!f29s^Cpv0m)br1N@96^RhbTpc', 'trung@gmail.com', 'Đặng Thành Trung', 1, 3, 2, '2023-05-31 10:55:11', '2023-06-01 15:11:32', '2023-06-17 09:35:23.0', '::1', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `cms_users_group`
--

CREATE TABLE `cms_users_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `group_permission` varchar(255) NOT NULL,
  `group_registered` datetime NOT NULL,
  `group_updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cms_users_group`
--

INSERT INTO `cms_users_group` (`id`, `group_name`, `group_permission`, `group_registered`, `group_updated`) VALUES
(3, 'Nhân viên', '[\"1\",\"2\", \"3\"]', '2023-05-30 19:20:45', '0000-00-00 00:00:00'),
(1, 'Admin', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\", \"7\", \"8\", \"9\", \"10\"]', '2023-05-30 19:00:58', '0000-00-00 00:00:00'),
(2, 'Quản lý', '[\"1\",\"2\",\"4\",\"5\",\"6\"]', '2023-05-30 19:30:40', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cms_customers`
--
ALTER TABLE `cms_customers`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `cms_discount`
--
ALTER TABLE `cms_discount`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `cms_input`
--
ALTER TABLE `cms_input`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `cms_inventory`
--
ALTER TABLE `cms_inventory`
  ADD PRIMARY KEY (`store_id`,`product_id`);

--
-- Indexes for table `cms_orders`
--
ALTER TABLE `cms_orders`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `cms_permissions`
--
ALTER TABLE `cms_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_products`
--
ALTER TABLE `cms_products`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `cms_products_group`
--
ALTER TABLE `cms_products_group`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `cms_products_manufacture`
--
ALTER TABLE `cms_products_manufacture`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `cms_report`
--
ALTER TABLE `cms_report`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `cms_stores`
--
ALTER TABLE `cms_stores`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `cms_suppliers`
--
ALTER TABLE `cms_suppliers`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `cms_templates`
--
ALTER TABLE `cms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_users`
--
ALTER TABLE `cms_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_users_group`
--
ALTER TABLE `cms_users_group`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cms_customers`
--
ALTER TABLE `cms_customers`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `cms_discount`
--
ALTER TABLE `cms_discount`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cms_input`
--
ALTER TABLE `cms_input`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `cms_orders`
--
ALTER TABLE `cms_orders`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;

--
-- AUTO_INCREMENT for table `cms_permissions`
--
ALTER TABLE `cms_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cms_products`
--
ALTER TABLE `cms_products`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `cms_products_group`
--
ALTER TABLE `cms_products_group`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `cms_products_manufacture`
--
ALTER TABLE `cms_products_manufacture`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `cms_report`
--
ALTER TABLE `cms_report`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=407;

--
-- AUTO_INCREMENT for table `cms_stores`
--
ALTER TABLE `cms_stores`
  MODIFY `ID` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cms_suppliers`
--
ALTER TABLE `cms_suppliers`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `cms_templates`
--
ALTER TABLE `cms_templates`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cms_users`
--
ALTER TABLE `cms_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `cms_users_group`
--
ALTER TABLE `cms_users_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
