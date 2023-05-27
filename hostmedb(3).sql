-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2023 at 09:42 AM
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
-- Table structure for table `categorycustomer`
--

CREATE TABLE `categorycustomer` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL
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
(115, NULL, NULL),
(116, NULL, NULL);

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
  `sub_id` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `Name`, `logourl`, `location`, `created`, `sub_id`, `created_at`, `updated_at`) VALUES
(1, 'KldCompany', NULL, 'Nablus', '2023-05-01', 111, NULL, NULL);

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
(111, 3500);

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
(113, 111, 'advs'),
(114, 111, NULL);

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
(106, 'Rami', 1, 'Rami123@gmail.com', 'Rami12345#', NULL, NULL, 'palestine', '/storage/userImages/QeJab0GHPycIxsRXPQOH13EyuNYPahI4ORksfSL9.jpg', '2023-05-20 14:37:26', '2023-05-20 14:37:26'),
(108, 'Imam Ibrahim', 1, 'imammosa537@gmail.com', 'Imam1234', '5CTk7NTrxdW9iH737eXi0GLqhTnk4PoHOCJ8HBpsuEaeisu7SGySEN4NFF4vJz8Z4VB422GERHzMLAzm', '0569402015', 'Tulkarm', '/storage/userImages/GWD0N6zLNrjMNajHa1QkfjJY10vkE19lkohZsXo9.jpg', '2023-05-20 14:45:04', '2023-05-20 14:45:04'),
(109, 'Sama', 1, 'Sama@gmail.com', 'Sama1234', NULL, '0569443322', 'Nablus', '/storage/userImages/nxqXFYrcKrOnYSkAVNJgwUQ8C5lGwscpcVyq5dMJ.jpg', '2023-05-20 14:47:36', '2023-05-20 14:47:36'),
(110, 'Sami', 1, 'Sami@gmail.com', 'Sami1234', NULL, NULL, 'Nablus', '/storage/userImages/P2sKlDMVmhP9VW5eVLJHciIitNujYGhrcciMzEv2.jpg', '2023-05-20 15:23:06', '2023-05-20 15:23:06'),
(111, 'Khalid', 1, 'Kk@gmail.com', 'Kkkk1111', NULL, NULL, NULL, '/storage/userImages/QGavuz8iFvwhiikdynYZ6x6Ty1vhLNcYDScGCtGT.jpg', '2023-05-20 15:44:56', '2023-05-20 15:44:56'),
(112, 'Empw', 1, 'Ees@gmail.com', 'Eeee1111', NULL, NULL, NULL, '/storage/userImages/lftuIYsqe8GzWdwXoFDEadK7nI36o5VzoZZGZzhf.jpg', '2023-05-20 16:28:39', '2023-05-20 16:28:39'),
(113, 'Qwsa', 1, 'Erw@gmail.com', 'WWww1111', NULL, NULL, NULL, '/storage/userImages/3jdrnLY5UUWhWXuMblO6uagdDJdzjykdnG6RBg81.jpg', '2023-05-20 16:29:36', '2023-05-20 16:29:36'),
(114, 'Yuuu', 1, 'Yy@gmail.com', 'Yyyy1234', NULL, '0569402015', 'nablus', '/storage/userImages/KPgof6rREH4PDebsbAeIYfpYBeVhN1YLCnEeDZrN.jpg', '2023-05-20 16:40:46', '2023-05-20 16:40:46'),
(115, 'Yaser', 1, 'YAs@gmail.com', 'Yyyy1111', NULL, '0569843276', 'nablus', '/storage/userImages/nnJzlEdGfe4VYcrOB7edCfdrotkBz2nRMJ0hfqtD.jpg', '2023-05-20 17:04:26', '2023-05-20 17:04:26'),
(116, 'Sam', 1, 'Sam@gmail.com', 'Sam3333#', NULL, '0569404321', 'DD', '/storage/userImages/IdeGSNjp0DNMek2MTjjukB6vPUlKukFKBBArqvpH.jpg', '2023-05-20 17:07:34', '2023-05-20 17:07:34');

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
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categorycustomer`
--
ALTER TABLE `categorycustomer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `cat_id` (`cat_id`);

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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categorycustomer`
--
ALTER TABLE `categorycustomer`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ssn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

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
  ADD CONSTRAINT `advertisements_ibfk_1` FOREIGN KEY (`sub_id`) REFERENCES `subscribers` (`ssn`) ON DELETE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`ssn`) ON DELETE CASCADE;

--
-- Constraints for table `categorycustomer`
--
ALTER TABLE `categorycustomer`
  ADD CONSTRAINT `categorycustomer_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`ssn`) ON DELETE CASCADE,
  ADD CONSTRAINT `categorycustomer_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categoryproduct`
--
ALTER TABLE `categoryproduct`
  ADD CONSTRAINT `categoryproduct_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categoryproduct_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categoryshop`
--
ALTER TABLE `categoryshop`
  ADD CONSTRAINT `categoryshop_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categoryshop_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `users` (`ssn`) ON DELETE CASCADE;

--
-- Constraints for table `orderproduct`
--
ALTER TABLE `orderproduct`
  ADD CONSTRAINT `orderproduct_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orderproduct_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

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
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`ssn`) ON DELETE CASCADE;

--
-- Constraints for table `productfeedback`
--
ALTER TABLE `productfeedback`
  ADD CONSTRAINT `productfeedback_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `productfeedback_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`ssn`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shopfeedback`
--
ALTER TABLE `shopfeedback`
  ADD CONSTRAINT `shopfeedback_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shopfeedback_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`ssn`) ON DELETE CASCADE;

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
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`ssn`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
