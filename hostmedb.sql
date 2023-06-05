-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2023 at 05:33 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hostmedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `id` int(11) NOT NULL,
  `Ended` date DEFAULT NULL,
  `imageurl` varchar(1024) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `active` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, 6, 115, '2023-06-05', '2023-06-05'),
(2, 7, 115, '2023-06-05', '2023-06-05'),
(3, 7, 116, '2023-06-05', '2023-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `imageurl` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `imageurl`, `created_at`, `updated_at`) VALUES
(6, 'Clothes', '/storage/categoryImages/i4THUP8Uz4VVTJrKRfWmo1RMMUYFydPnLSo5NQIC.png', '2023-05-26', '2023-05-26'),
(7, 'Foods', '/storage/categoryImages/NVwfNJdiJ3zyJjxlRihy7NGaLQjXJZPz8y8wMRC1.png', '2023-05-26', '2023-05-26'),
(8, 'Shoes', '/storage/categoryImages/0se2oYZKWle562CJYdJ3uqjnq2KdcNQ5mxqWH1Gf.png', '2023-05-26', '2023-05-26'),
(10, 'Kitchen', '/storage/categoryImages/kQVXaE65CrszdDSLh1OEmCPCecjaKKZ9k5E7qYQZ.png', '2023-05-26', '2023-05-26'),
(11, 'Accessories', '/storage/categoryImages/7kMM1I1tLF1uLTdp4Ngc2MpUww9iNBPNmkBvdlI0.png', '2023-05-26', '2023-05-26');

-- --------------------------------------------------------

--
-- Table structure for table `categoryproducts`
--

CREATE TABLE `categoryproducts` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categoryproducts`
--

INSERT INTO `categoryproducts` (`id`, `product_id`, `cat_id`, `created_at`, `updated_at`) VALUES
(6, 6, 6, '2023-06-05', '2023-06-05'),
(7, 7, 6, '2023-06-05', '2023-06-05'),
(8, 8, 7, '2023-06-05', '2023-06-05'),
(9, 9, 7, '2023-06-05', '2023-06-05'),
(10, 10, 7, '2023-06-05', '2023-06-05'),
(11, 11, 6, '2023-06-05', '2023-06-05'),
(12, 12, 6, '2023-06-05', '2023-06-05'),
(13, 13, 6, '2023-06-05', '2023-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `categoryshops`
--

CREATE TABLE `categoryshops` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categoryshops`
--

INSERT INTO `categoryshops` (`id`, `shop_id`, `cat_id`, `created_at`, `updated_at`) VALUES
(1, 11, 11, NULL, NULL),
(2, 13, 6, NULL, NULL),
(3, 12, 8, NULL, NULL),
(4, 10, 8, NULL, NULL),
(5, 14, 7, '2023-05-29', '2023-05-29'),
(6, 15, 10, '2023-05-31', '2023-05-31');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `ssn` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`ssn`, `updated_at`, `created_at`) VALUES
(115, NULL, NULL),
(116, NULL, NULL),
(117, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orderproducts`
--

CREATE TABLE `orderproducts` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderproducts`
--

INSERT INTO `orderproducts` (`id`, `order_id`, `product_id`, `created_at`, `updated_at`) VALUES
(3, 6, 6, '2023-06-05', '2023-06-05'),
(4, 6, 7, '2023-06-05', '2023-06-05'),
(5, 6, 8, '2023-06-05', '2023-06-05'),
(6, 9, 6, '2023-06-05', '2023-06-05'),
(7, 9, 9, '2023-06-05', '2023-06-05'),
(8, 9, 10, '2023-06-05', '2023-06-05'),
(9, 9, 12, '2023-06-05', '2023-06-05'),
(10, 7, 6, '2023-06-05', '2023-06-05'),
(11, 7, 8, '2023-06-05', '2023-06-05'),
(12, 8, 8, '2023-06-05', '2023-06-05'),
(13, 8, 13, '2023-06-05', '2023-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `available` tinyint(1) DEFAULT NULL,
  `done` tinyint(1) DEFAULT NULL,
  `cancel` tinyint(1) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `customer_id`, `available`, `done`, `cancel`, `created_at`, `updated_at`) VALUES
(6, 'Yaser Order hh2n', 115, 1, 1, 0, '2023-06-05', '2023-06-05'),
(7, 'Sam Order g5gkn', 116, 1, 1, 0, '2023-06-05', '2023-06-05'),
(8, 'Dani Order epr5V', 117, 1, 1, 0, '2023-06-05', '2023-06-05'),
(9, 'Yaser Order u', 115, 1, 1, 0, '2023-06-05', '2023-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `owners`
--

CREATE TABLE `owners` (
  `ssn` int(11) NOT NULL,
  `KeyOwner` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `owners`
--

INSERT INTO `owners` (`ssn`, `KeyOwner`) VALUES
(108, 0);

-- --------------------------------------------------------

--
-- Table structure for table `o_employees`
--

CREATE TABLE `o_employees` (
  `ssn` int(11) NOT NULL,
  `access_o` varchar(255) DEFAULT NULL,
  `salary` float DEFAULT NULL,
  `access_s` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `o_employees`
--

INSERT INTO `o_employees` (`ssn`, `access_o`, `salary`, `access_s`, `created_at`, `updated_at`) VALUES
(106, 'shop,category,', 500, 'oemployee,subscriber,', '2023-05-20 14:37:26', '2023-05-20 14:37:26'),
(109, 'shop,adv,', 1200, NULL, '2023-05-20 14:47:36', '2023-05-20 14:47:36'),
(110, 'shop,category,', 500, 'oemployee,subscriber,', '2023-05-20 15:23:06', '2023-05-20 15:23:06'),
(112, 'shop,', 44, NULL, '2023-05-20 16:28:39', '2023-05-20 16:28:39');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `created` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
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
-- Table structure for table `productfeedbacks`
--

CREATE TABLE `productfeedbacks` (
  `id` int(11) NOT NULL,
  `Evaluation` float DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productfeedbacks`
--

INSERT INTO `productfeedbacks` (`id`, `Evaluation`, `product_id`, `customer_id`, `created_at`, `updated_at`) VALUES
(7, 0, 6, 117, NULL, NULL),
(8, 0, 13, 117, '2023-06-05', '2023-06-05'),
(9, 0, 7, 117, NULL, NULL),
(10, 0, 8, 117, NULL, NULL),
(11, 0, 9, 117, NULL, NULL),
(12, 0, 10, 117, NULL, NULL),
(13, 0, 11, 117, NULL, NULL),
(14, 0, 12, 117, NULL, NULL),
(15, 4, 13, 115, '2023-06-05', '2023-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `imageurl` varchar(1024) DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `imageurl`, `discount`, `description`, `shop_id`, `created_at`, `updated_at`) VALUES
(6, 'Prod1', 100, '/storage/productsImages/mlC6SKoQeYi3W4X1tm9Yz8DO8hGerP10pMGWqQdm.png', 30, 'Wesdfgbvsafgdfhvdfbvcvfdbcewtyth', 10, '2023-06-05', '2023-06-05'),
(7, 'Prod2', 76.5, '/storage/productsImages/t5rGC4TDGwUu9b5Wulvrcdh1Bhgw0hTUkOvsOxmq.png', 20, 'FFFFFFDSDSD', 10, '2023-06-05', '2023-06-05'),
(8, 'Prod3', 120, '/storage/productsImages/5uLOBDDXogGOFLRud11QFWOQLoasUqzTHE5wyJe0.png', 55, 'Adfsregdf', 10, '2023-06-05', '2023-06-05'),
(9, 'Prod4', 150, '/storage/productsImages/hvP4gcqjUKXi5vt8SoA7BvF5yFKx7Frnmg5kIBja.png', 30, 'AdfsregdfDdfgd', 10, '2023-06-05', '2023-06-05'),
(10, 'Prod5', 60, '/storage/productsImages/WuUC0o6NDLZOSFsnAFOFMfvLW1jFB8jlJm6fEOPk.png', 0, 'Wsdfsd', 10, '2023-06-05', '2023-06-05'),
(11, 'Prod6', 50, '/storage/productsImages/UrrPJcQefARndbTlNyvXch46xa0uoj3UDf6E8FME.png', 18, 'Dsfgfdgrsdf', 11, '2023-06-05', '2023-06-05'),
(12, 'Prod7', 80, '/storage/productsImages/js5lrZ3FPl3TLtVvVpsb5fhUITI46AGHW6REPQR4.png', 60, 'Dsfgfdgrsdf', 11, '2023-06-05', '2023-06-05'),
(13, 'Prod8', 13, '/storage/productsImages/RvGQkbMCUDFbMCsj8tP7nH9U5jMrqCBKPvcZUueK.png', 20, 'Dsfgfdgrsdf', 11, '2023-06-05', '2023-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `shopfeedbacks`
--

CREATE TABLE `shopfeedbacks` (
  `id` int(11) NOT NULL,
  `Evaluation` float DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `shop_id` int(11) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shopfeedbacks`
--

INSERT INTO `shopfeedbacks` (`id`, `Evaluation`, `customer_id`, `shop_id`, `created_at`, `updated_at`) VALUES
(6, 3, 115, 10, '2023-06-05', '2023-06-05'),
(9, 1, 116, 11, '2023-06-05', '2023-06-05'),
(10, 2, 115, 11, '2023-06-05', '2023-06-05'),
(12, 5, 116, 10, '2023-06-05', '2023-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `logourl` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `sub_id` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `Name`, `logourl`, `location`, `sub_id`, `created_at`, `updated_at`) VALUES
(10, 'Pen Tool', '/storage/shopImages/CagK1RUhJAY1Fg5y1AIG5CRI5I3RLq2ADe5WzFGa.png', 'Nablus', 111, '2023-05-27', '2023-05-27'),
(11, 'Brand', '/storage/shopImages/sMSGuWp9CbAaLJzQc0klvEecrKEuKlmITIqOj7Wy.jpg', 'Tulkarm', 111, '2023-05-27', '2023-05-27'),
(12, 'Lunch Time', '/storage/shopImages/q5iEtbvAnTEB4ua6iq2OjtUWNTql0YHkUm97lyTu.jpg', 'Nablus', 113, '2023-05-27', '2023-05-27'),
(13, 'Elctronic', '/storage/shopImages/3qB40LDIt1a9hkFzvhxBHos8BdyTzh9ySk8ccuDP.jpg', 'Tulkarm', 113, '2023-05-27', '2023-05-27'),
(14, 'Jjj', '/storage/shopImages/mjJMYsCVLKpVfDkF5eAFHEicup5aU3vnVzUwPd8T.jpg', 'Ewds', 111, '2023-05-29', '2023-05-29'),
(15, 'Yee', '/storage/shopImages/Jjo9TeEt3BxLQREy3m3CDJ9HOVkFnqUO2Q4WAnGu.png', 'Dgfd', 111, '2023-05-31', '2023-05-31');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `ssn` int(11) NOT NULL,
  `budget` float DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`ssn`, `budget`, `created_at`, `updated_at`) VALUES
(111, 3500, NULL, NULL),
(113, 0, NULL, NULL),
(120, 5000, '2023-06-03', '2023-06-03');

-- --------------------------------------------------------

--
-- Table structure for table `s_employees`
--

CREATE TABLE `s_employees` (
  `ssn` int(11) NOT NULL,
  `s_ssn` int(11) NOT NULL,
  `access_s` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `s_employees`
--

INSERT INTO `s_employees` (`ssn`, `s_ssn`, `access_s`) VALUES
(117, 111, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ssn` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `active` tinyint(1) DEFAULT 1,
  `Email` varchar(255) NOT NULL,
  `passW` varchar(30) NOT NULL,
  `api_token` varchar(80) DEFAULT NULL,
  `Phone` varchar(13) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `imageurl` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ssn`, `Name`, `active`, `Email`, `passW`, `api_token`, `Phone`, `Location`, `imageurl`, `updated_at`, `created_at`) VALUES
(106, 'Rami', 0, 'Rami123@gmail.com', 'Rami12345#', NULL, NULL, 'palestine', '/storage/userImages/QeJab0GHPycIxsRXPQOH13EyuNYPahI4ORksfSL9.jpg', '2023-05-20 14:37:26', '2023-05-20 14:37:26'),
(108, 'Imam Ibrahim', 1, 'imammosa537@gmail.com', 'Imam1234', 'fMVtVws5DnXEIEl6CQTWHcfuqqIm8vyqtSGhqScUrWAiVDeT7CsQTM5yEzHWCKHy8WXNcauQNViRas5p', '0569402015', 'Tulkarm', '/storage/userImages/GWD0N6zLNrjMNajHa1QkfjJY10vkE19lkohZsXo9.jpg', '2023-05-20 14:45:04', '2023-05-20 14:45:04'),
(109, 'Sama', 0, 'Sama@gmail.com', 'Sama1234', NULL, '0569443322', 'Nablus', '/storage/userImages/nxqXFYrcKrOnYSkAVNJgwUQ8C5lGwscpcVyq5dMJ.jpg', '2023-05-20 14:47:36', '2023-05-20 14:47:36'),
(110, 'Sami', 1, 'Sami@gmail.com', 'Sami1234', 'AAAAAAAAAAAAAAAAAAAAA', NULL, 'Nablus', '/storage/userImages/P2sKlDMVmhP9VW5eVLJHciIitNujYGhrcciMzEv2.jpg', '2023-05-20 15:23:06', '2023-05-20 15:23:06'),
(111, 'Khalid', 1, 'Kk@gmail.com', 'Kkkk1111', NULL, NULL, NULL, '/storage/userImages/QGavuz8iFvwhiikdynYZ6x6Ty1vhLNcYDScGCtGT.jpg', '2023-05-20 15:44:56', '2023-05-20 15:44:56'),
(112, 'Empw', 1, 'Ees@gmail.com', 'Eeee1111', NULL, NULL, NULL, '/storage/userImages/lftuIYsqe8GzWdwXoFDEadK7nI36o5VzoZZGZzhf.jpg', '2023-05-20 16:28:39', '2023-05-20 16:28:39'),
(113, 'Qwsa', 1, 'Erw@gmail.com', 'WWww1111', NULL, NULL, NULL, '/storage/userImages/3jdrnLY5UUWhWXuMblO6uagdDJdzjykdnG6RBg81.jpg', '2023-05-20 16:29:36', '2023-05-20 16:29:36'),
(114, 'Yuuu', 1, 'Yy@gmail.com', 'Yyyy1234', NULL, '0569402015', 'nablus', '/storage/userImages/KPgof6rREH4PDebsbAeIYfpYBeVhN1YLCnEeDZrN.jpg', '2023-05-20 16:40:46', '2023-05-20 16:40:46'),
(115, 'Yaser', 1, 'YAs@gmail.com', 'Yyyy1111', NULL, '0569843276', 'nablus', '/storage/userImages/nnJzlEdGfe4VYcrOB7edCfdrotkBz2nRMJ0hfqtD.jpg', '2023-05-20 17:04:26', '2023-05-20 17:04:26'),
(116, 'Sam', 1, 'Sam@gmail.com', 'Sam3333#', NULL, '0569404321', 'DD', '/storage/userImages/IdeGSNjp0DNMek2MTjjukB6vPUlKukFKBBArqvpH.jpg', '2023-05-20 17:07:34', '2023-05-20 17:07:34'),
(117, 'Dani', 1, 'D1d@gmail.com', 'Dddd123456#', NULL, NULL, NULL, '/storage/userImages/3mQ4uJEoBhBFViL0YIppBEE4CXwYvh5fUcW9pERn.jpg', '2023-05-27 12:01:56', '2023-05-27 12:01:56'),
(120, 'Imam Ibrahim', 1, 'jjA@gmail.com', 'Imam1234', NULL, '0569402015', 'sdfghfn', '/storage/userImages/0p3I7sYECUDWh30kPA2sqJ3d2s1FbmdQsLCpZ76l.png', '2023-06-03 14:13:09', '2023-06-03 14:13:09');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `product_id`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, 6, 115, '2023-06-05', '2023-06-05'),
(2, 7, 115, '2023-06-05', '2023-06-05'),
(3, 8, 115, '2023-06-05', '2023-06-05'),
(4, 9, 116, '2023-06-05', '2023-06-05'),
(5, 11, 116, '2023-06-05', '2023-06-05'),
(6, 6, 116, '2023-06-05', '2023-06-05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ADV_KF1` (`shop_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categoryproducts`
--
ALTER TABLE `categoryproducts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `categoryshops`
--
ALTER TABLE `categoryshops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_id` (`shop_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`ssn`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderproducts`
--
ALTER TABLE `orderproducts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`ssn`);

--
-- Indexes for table `o_employees`
--
ALTER TABLE `o_employees`
  ADD PRIMARY KEY (`ssn`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `productfeedbacks`
--
ALTER TABLE `productfeedbacks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_id` (`shop_id`);

--
-- Indexes for table `shopfeedbacks`
--
ALTER TABLE `shopfeedbacks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `shop_FK1` (`shop_id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_id` (`sub_id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`ssn`);

--
-- Indexes for table `s_employees`
--
ALTER TABLE `s_employees`
  ADD PRIMARY KEY (`ssn`),
  ADD KEY `foreign_key_name` (`s_ssn`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ssn`),
  ADD UNIQUE KEY `api_token` (`api_token`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categoryproducts`
--
ALTER TABLE `categoryproducts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `categoryshops`
--
ALTER TABLE `categoryshops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orderproducts`
--
ALTER TABLE `orderproducts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productfeedbacks`
--
ALTER TABLE `productfeedbacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `shopfeedbacks`
--
ALTER TABLE `shopfeedbacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ssn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD CONSTRAINT `ADV_KF1` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`);

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`ssn`) ON DELETE CASCADE;

--
-- Constraints for table `categoryproducts`
--
ALTER TABLE `categoryproducts`
  ADD CONSTRAINT `categoryproducts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categoryproducts_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categoryshops`
--
ALTER TABLE `categoryshops`
  ADD CONSTRAINT `categoryshops_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categoryshops_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `users` (`ssn`) ON DELETE CASCADE;

--
-- Constraints for table `orderproducts`
--
ALTER TABLE `orderproducts`
  ADD CONSTRAINT `orderproducts_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orderproducts_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`ssn`) ON DELETE CASCADE;

--
-- Constraints for table `owners`
--
ALTER TABLE `owners`
  ADD CONSTRAINT `owners_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `users` (`ssn`) ON DELETE CASCADE;

--
-- Constraints for table `o_employees`
--
ALTER TABLE `o_employees`
  ADD CONSTRAINT `o_employees_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `users` (`ssn`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`ssn`) ON DELETE CASCADE;

--
-- Constraints for table `productfeedbacks`
--
ALTER TABLE `productfeedbacks`
  ADD CONSTRAINT `productfeedbacks_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `productfeedbacks_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`ssn`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shopfeedbacks`
--
ALTER TABLE `shopfeedbacks`
  ADD CONSTRAINT `shop_FK1` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shopfeedbacks_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`ssn`) ON DELETE CASCADE;

--
-- Constraints for table `shops`
--
ALTER TABLE `shops`
  ADD CONSTRAINT `shops_ibfk_1` FOREIGN KEY (`sub_id`) REFERENCES `subscribers` (`ssn`) ON DELETE CASCADE;

--
-- Constraints for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD CONSTRAINT `subscribers_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `users` (`ssn`) ON DELETE CASCADE;

--
-- Constraints for table `s_employees`
--
ALTER TABLE `s_employees`
  ADD CONSTRAINT `s_employees_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `users` (`ssn`) ON DELETE CASCADE,
  ADD CONSTRAINT `s_employees_ibfk_2` FOREIGN KEY (`s_ssn`) REFERENCES `subscribers` (`ssn`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`ssn`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
