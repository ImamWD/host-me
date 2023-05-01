-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2023 at 10:39 PM
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
  `period` int(11) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `imagesurl` varchar(1024) DEFAULT NULL,
  `sub_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `created` date DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categorycustomer`
--

CREATE TABLE `categorycustomer` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categoryes`
--

CREATE TABLE `categoryes` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `imageurl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categoryproduct`
--

CREATE TABLE `categoryproduct` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categoryshop`
--

CREATE TABLE `categoryshop` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(64, '2023-04-09 21:43:38', '2023-04-09 21:43:38'),
(65, '2023-04-09 21:44:42', '2023-04-09 21:44:42'),
(66, '2023-04-09 21:46:21', '2023-04-09 21:46:21'),
(67, '2023-04-09 21:47:35', '2023-04-09 21:47:35'),
(68, '2023-04-09 21:48:14', '2023-04-09 21:48:14'),
(69, '2023-04-09 22:07:27', '2023-04-09 22:07:27'),
(70, '2023-04-09 22:09:51', '2023-04-09 22:09:51'),
(71, '2023-04-09 22:11:09', '2023-04-09 22:11:09'),
(72, '2023-04-09 22:18:42', '2023-04-09 22:18:42'),
(73, '2023-04-15 21:29:10', '2023-04-15 21:29:10'),
(74, '2023-04-15 23:16:25', '2023-04-15 23:16:25'),
(75, '2023-04-15 23:18:02', '2023-04-15 23:18:02'),
(76, '2023-04-15 23:20:51', '2023-04-15 23:20:51'),
(77, '2023-04-15 23:23:14', '2023-04-15 23:23:14'),
(78, '2023-04-15 23:30:57', '2023-04-15 23:30:57'),
(79, '2023-04-15 23:32:21', '2023-04-15 23:32:21'),
(80, '2023-04-15 23:43:18', '2023-04-15 23:43:18'),
(81, '2023-04-16 00:07:56', '2023-04-16 00:07:56'),
(82, '2023-04-16 00:20:44', '2023-04-16 00:20:44'),
(85, '2023-04-28 19:28:05', '2023-04-28 19:28:05');

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
-- Table structure for table `orderproduct`
--

CREATE TABLE `orderproduct` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `created` date DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `available` tinyint(1) DEFAULT NULL,
  `done` tinyint(1) DEFAULT NULL,
  `cancel` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(71, 1111);

-- --------------------------------------------------------

--
-- Table structure for table `o_employees`
--

CREATE TABLE `o_employees` (
  `ssn` int(11) NOT NULL,
  `access_o` varchar(255) DEFAULT NULL,
  `salary` float DEFAULT NULL,
  `access_s` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `o_employees`
--

INSERT INTO `o_employees` (`ssn`, `access_o`, `salary`, `access_s`) VALUES
(64, 'efd', 22, 'gdfgfdfdg'),
(69, 'fdgfgf', 444, 'dfdfbfg'),
(70, 'fgfbvbc', 22, 'sdfdfbvvb'),
(83, 'efsdgdc', 221, 'sdfdsgvfv'),
(84, 'wertgh', 55, 'sdfghn');

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
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
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
-- Table structure for table `productfeedback`
--

CREATE TABLE `productfeedback` (
  `id` int(11) NOT NULL,
  `Evaluation` float DEFAULT NULL,
  `created` date DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `imagesurl` varchar(1024) DEFAULT NULL,
  `type` varchar(1024) DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shopfeedback`
--

CREATE TABLE `shopfeedback` (
  `id` int(11) NOT NULL,
  `Evaluation` float DEFAULT NULL,
  `created` date DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `logourl` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `sub_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `ssn` int(11) NOT NULL,
  `budget` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`ssn`, `budget`) VALUES
(70, 776);

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
(75, 70, 'wefrrgdf');

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
(64, 'asdvc', 0, 'efdsdsf@gmail.com', 'oooo1111', 'GisvHPfrwsFkmWcqb2GnamdCgBblVT3tmtNUknHhCbYhaNb6NESAzxaTeFdekDY3VHayWnzpwj4fxw4u', NULL, NULL, NULL, '2023-04-09 21:43:38', '2023-04-09 21:43:38'),
(65, 'wefdg', 1, 'wd@gmail.com', 'eeee1111', NULL, NULL, NULL, NULL, '2023-04-09 21:44:42', '2023-04-09 21:44:42'),
(66, 'wfdv', 1, 'edfvx@gmail.com', 'qqqq1111', NULL, NULL, NULL, NULL, '2023-04-09 21:46:21', '2023-04-09 21:46:21'),
(67, 'efrgbc', 1, 'dfsgdxc@gmail.com', 'yyyy1111', NULL, NULL, NULL, NULL, '2023-04-09 21:47:35', '2023-04-09 21:47:35'),
(68, 'imam', 1, 'wdsxc@gmail.com', 'wwww1111', NULL, NULL, NULL, NULL, '2023-04-09 21:48:14', '2023-04-09 21:48:14'),
(69, 'dgfb', 1, 'sdfv@gmail.com', 'wwww2222', NULL, NULL, NULL, NULL, '2023-04-09 22:07:27', '2023-04-09 22:07:27'),
(70, 'dgfb', 0, 'imamaa@gmail.com', 'wwww2222', NULL, '0569402015', 'aaaa', NULL, '2023-04-09 22:09:51', '2023-04-09 22:09:51'),
(71, 'Imam Ibrahim', 1, 'Imammosa537@gmail.com', 'imam12345', '8Ku1Uz0wKRtpfPmArwtZWzY1EoIJ1hUbsbNrk6VSqc3dGesRXGYie4QludgtaUYiizqIFdqOIS23VBYM', NULL, NULL, '/storage/userImages/Vd924AAJEpDDAbZ4MZW9X9Gtu8Myv5pGfv727HzU.jpg', '2023-04-09 22:11:09', '2023-04-09 22:11:09'),
(72, 'Imam', 1, 'Imam@gmail.com', 'imam12345', 'UJMyadqrpN4On3XwWtbewSG7X0QH8LTSkCKFSbrDn2chZnuvGHaOUppnfnBaVqEGZ3zufShnqqiCRXG6', '+972569402015', 'Nablus', '/storage/userImages/JjlCpW4ASVOWsoNbNhkGITcdK6pGDkAEhgkuKPcK.jpg', '2023-04-09 22:18:42', '2023-04-09 22:18:42'),
(73, 'Imam', 1, 'Imam223@gmail.com', 'Imam12345', NULL, '0569402015', 'Tulkarm', '/storage/userImages/EVBwj0i0yOloRWuv1uY4j2zY71hLimGN647Y3Bms.png', '2023-04-15 21:29:10', '2023-04-15 21:29:10'),
(74, 'Imam Ibrahim', 1, 'QQQQ@gmail.com', 'imam12345', NULL, NULL, NULL, NULL, '2023-04-15 23:16:25', '2023-04-15 23:16:25'),
(75, 'Imam', 1, 'ImammA@gmail.com', 'Imam12345', NULL, '0569402015', 'Adsas', '/storage/userImages/NDlvpTGF49Yfri296oRJprkov5ZMaG2z0rFCsner.png', '2023-04-15 23:18:02', '2023-04-15 23:18:02'),
(76, 'Imam', 1, 'ergfdv@gmail.com', 'Imam1234', NULL, '0569402015', 'sfdsv', '/storage/userImages/V0A49F4m4SixQ20kCRjR9xcdGsRvR12d6Xnltvnk.png', '2023-04-15 23:20:51', '2023-04-15 23:20:51'),
(77, 'Imam', 1, 'EWQ@gmail.com', 'Imam3333', NULL, '0569402015', NULL, '/storage/userImages/sdh90604Y7P2OqLhTvJfSx1n90bIsHvkRFHMHuJt.png', '2023-04-15 23:23:14', '2023-04-15 23:23:14'),
(78, 'Imam', 1, 'Wqsd@gmail.com', 'Imam12345', NULL, NULL, NULL, NULL, '2023-04-15 23:30:57', '2023-04-15 23:30:57'),
(79, 'Imam', 1, 'Wq11sd@gmail.com', 'Imam12345', NULL, NULL, NULL, '/storage/userImages/NhsiTDxq7Vx41UesXRN7RBMTGxlCQIUd2HUJqd1F.jpg', '2023-04-15 23:32:21', '2023-04-15 23:32:21'),
(80, 'Osaw', 1, 'Osaw@gmail.com', 'Oooo1111', NULL, NULL, NULL, NULL, '2023-04-15 23:43:18', '2023-04-15 23:43:18'),
(81, 'Rawand Aqel', 1, 'Rawand298@gmail.com', 'Rawand12345', '0NiIYDXn4M5uDfsiwX0oKVKP8qY29TNDxaNyWfYlgipXUkigKidzK7ZTpULct7hCCY027BlOgiI90DQb', '0569332214', 'Nablus', '/storage/userImages/FIjngyeSXiRbIAhavi3MjfRERw7UeUOLVKy1AHkG.png', '2023-04-16 00:07:56', '2023-04-16 00:07:56'),
(82, 'Osfvfc', 1, 'Eds@gmail.com', 'Iamm12345', NULL, NULL, NULL, NULL, '2023-04-16 00:20:44', '2023-04-16 00:20:44'),
(83, 'Ahmad', 1, 'Ahmad331@gmail.com', 'Ahmad12345', NULL, '0569333222', 'SSS', '/storage/userImages/1STieoqXj8SMekmMVx8rP3t8bBXwJ0YttBFAER5P.png', '2023-04-24 13:21:07', '2023-04-24 13:21:07'),
(84, 'Allll', 1, 'dsf@gmail.com', 'Qqqq1234', NULL, '0569434343', 'hgbv', '/storage/userImages/RcejQiwR7lnBYcuaTzSLZKlnoTodmoimxHR6wGpR.png', '2023-04-24 20:03:07', '2023-04-24 20:03:07'),
(85, 'ZZZ', 1, 'zzz@gmail.com', 'Zzzz1111', NULL, NULL, NULL, '/storage/userImages/c7v6brEFh1WorqIuJro6if2Kq0EBmonhK2Yvamhy.png', '2023-04-28 19:28:05', '2023-04-28 19:28:05');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `created` date DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_id` (`sub_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `categorycustomer`
--
ALTER TABLE `categorycustomer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `categoryes`
--
ALTER TABLE `categoryes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categoryproduct`
--
ALTER TABLE `categoryproduct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `categoryshop`
--
ALTER TABLE `categoryshop`
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
-- Indexes for table `orderproduct`
--
ALTER TABLE `orderproduct`
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
-- Indexes for table `payment`
--
ALTER TABLE `payment`
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
-- Indexes for table `productfeedback`
--
ALTER TABLE `productfeedback`
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
-- Indexes for table `shopfeedback`
--
ALTER TABLE `shopfeedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_id` (`shop_id`),
  ADD KEY `customer_id` (`customer_id`);

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
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorycustomer`
--
ALTER TABLE `categorycustomer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categoryes`
--
ALTER TABLE `categoryes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categoryproduct`
--
ALTER TABLE `categoryproduct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categoryshop`
--
ALTER TABLE `categoryshop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orderproduct`
--
ALTER TABLE `orderproduct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productfeedback`
--
ALTER TABLE `productfeedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shopfeedback`
--
ALTER TABLE `shopfeedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ssn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD CONSTRAINT `advertisements_ibfk_1` FOREIGN KEY (`sub_id`) REFERENCES `subscribers` (`ssn`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`ssn`);

--
-- Constraints for table `categorycustomer`
--
ALTER TABLE `categorycustomer`
  ADD CONSTRAINT `categorycustomer_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`ssn`),
  ADD CONSTRAINT `categorycustomer_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `categoryes` (`id`);

--
-- Constraints for table `categoryproduct`
--
ALTER TABLE `categoryproduct`
  ADD CONSTRAINT `categoryproduct_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `categoryproduct_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `categoryes` (`id`);

--
-- Constraints for table `categoryshop`
--
ALTER TABLE `categoryshop`
  ADD CONSTRAINT `categoryshop_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`),
  ADD CONSTRAINT `categoryshop_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `categoryes` (`id`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `users` (`ssn`);

--
-- Constraints for table `orderproduct`
--
ALTER TABLE `orderproduct`
  ADD CONSTRAINT `orderproduct_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `orderproduct_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`ssn`);

--
-- Constraints for table `owners`
--
ALTER TABLE `owners`
  ADD CONSTRAINT `owners_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `users` (`ssn`);

--
-- Constraints for table `o_employees`
--
ALTER TABLE `o_employees`
  ADD CONSTRAINT `o_employees_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `users` (`ssn`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`ssn`);

--
-- Constraints for table `productfeedback`
--
ALTER TABLE `productfeedback`
  ADD CONSTRAINT `productfeedback_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `productfeedback_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`ssn`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`);

--
-- Constraints for table `shopfeedback`
--
ALTER TABLE `shopfeedback`
  ADD CONSTRAINT `shopfeedback_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`),
  ADD CONSTRAINT `shopfeedback_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`ssn`);

--
-- Constraints for table `shops`
--
ALTER TABLE `shops`
  ADD CONSTRAINT `shops_ibfk_1` FOREIGN KEY (`sub_id`) REFERENCES `subscribers` (`ssn`);

--
-- Constraints for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD CONSTRAINT `subscribers_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `users` (`ssn`);

--
-- Constraints for table `s_employees`
--
ALTER TABLE `s_employees`
  ADD CONSTRAINT `s_employees_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `users` (`ssn`),
  ADD CONSTRAINT `s_employees_ibfk_2` FOREIGN KEY (`s_ssn`) REFERENCES `subscribers` (`ssn`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`ssn`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
