-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2025 at 08:26 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wardrobe_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `clothing`
--

CREATE TABLE `clothing` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clothing`
--

INSERT INTO `clothing` (`id`, `name`, `description`, `category`, `image`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'T-shirt', 'Blue tshirt', 'Vests', 'tshirt1.png\r\n', 1, '2025-02-25 14:58:26', '2025-02-25 14:58:26');

-- --------------------------------------------------------

--
-- Table structure for table `clothings`
--

CREATE TABLE `clothings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clothing_items`
--

CREATE TABLE `clothing_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clothing_items`
--

INSERT INTO `clothing_items` (`id`, `name`, `category`, `color`, `size`, `image`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'T-shirt', 'Vest', 'Blue', 'XXL', NULL, 1, '2025-02-26 05:26:54', '2025-02-26 05:26:54'),
(2, 'Jeans', 'Pants', 'Black', 'L', NULL, 1, '2025-02-26 06:28:38', '2025-02-26 06:28:38'),
(3, 'Jacket', 'Outerwear', 'Red', 'M', NULL, 1, '2025-02-26 06:28:38', '2025-02-26 06:28:38'),
(4, 'Sneakers', 'Shoes', 'White', '42', NULL, 1, '2025-02-26 06:28:38', '2025-02-26 06:28:38'),
(5, 'Hat', 'Accessories', 'Brown', 'One Size', NULL, 1, '2025-02-26 06:28:38', '2025-02-26 06:28:38'),
(6, 'Dress', 'Casual', 'Pink', 'S', NULL, 1, '2025-02-26 06:28:38', '2025-02-26 06:28:38'),
(8, 'T-shirt', 'Tops', 'Blue', 'M', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(9, 'Hoodie', 'Outerwear', 'Black', 'L', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(10, 'Shorts', 'Bottoms', 'Green', 'M', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(11, 'Blazer', 'Outerwear', 'Navy Blue', 'L', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(12, 'Socks', 'Accessories', 'White', 'One Size', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(13, 'Sandals', 'Shoes', 'Brown', '43', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(14, 'Scarf', 'Accessories', 'Red', 'One Size', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(15, 'Gloves', 'Accessories', 'Black', 'M', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(16, 'Skirt', 'Bottoms', 'Yellow', 'S', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(17, 'Sweatpants', 'Bottoms', 'Gray', 'XL', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(18, 'Tank Top', 'Tops', 'White', 'L', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(19, 'Boots', 'Shoes', 'Black', '45', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(20, 'Leggings', 'Bottoms', 'Purple', 'M', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(21, 'Cap', 'Accessories', 'Blue', 'One Size', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(22, 'Coat', 'Outerwear', 'Beige', 'XL', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(23, 'Jeans Jacket', 'Outerwear', 'Denim Blue', 'M', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(24, 'Flip-flops', 'Shoes', 'Red', '41', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(25, 'Cardigan', 'Outerwear', 'Olive Green', 'L', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(26, 'Cargo Pants', 'Bottoms', 'Khaki', 'M', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(27, 'Formal Shirt', 'Tops', 'White', 'L', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(28, 'Vest', 'Tops', 'Black', 'M', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(29, 'Tie', 'Accessories', 'Maroon', 'One Size', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(30, 'Belt', 'Accessories', 'Brown', 'One Size', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(31, 'Tracksuit', 'Outerwear', 'Black', 'L', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(32, 'Loafers', 'Shoes', 'Brown', '42', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(33, 'Polo Shirt', 'Tops', 'Green', 'XL', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(34, 'Denim Shorts', 'Bottoms', 'Blue', 'M', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(35, 'Overcoat', 'Outerwear', 'Black', 'XL', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(36, 'Slippers', 'Shoes', 'Gray', '40', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46'),
(37, 'Suit Jacket', 'Outerwear', 'Black', 'L', NULL, 1, '2025-02-26 06:49:46', '2025-02-26 06:49:46');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(6, '2014_10_12_100000_create_password_resets_table', 2),
(7, '2019_08_19_000000_create_failed_jobs_table', 2),
(8, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(9, '2025_02_26_052005_create_clothing_items_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Maiko Alloys', 'maikoa052@gmail.com', '2025-02-25 14:57:07', '1234', '1234', '2025-02-25 14:57:07', '2025-02-25 14:57:07'),
(2, 'Test User', 'test@example.com', NULL, '$2y$10$z3yzXNsgCroKQUtL2cS6dex4I4k5H6N5wJv5Bcm3T4hgUrF0lG1fG', NULL, '2025-02-26 01:43:00', '2025-02-26 01:43:00'),
(3, 'John Doe', 'johndoe@example.com', NULL, '$2y$10$pdiAll146rJdeRKLCw9mKeUeH5cBVpnMSbpk7hQWz4YsYtjWZDNSO', NULL, '2025-02-26 01:54:10', '2025-02-26 01:54:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clothing`
--
ALTER TABLE `clothing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clothings_user_id_foreign` (`user_id`);

--
-- Indexes for table `clothings`
--
ALTER TABLE `clothings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clothing_items`
--
ALTER TABLE `clothing_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clothing_items_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clothing`
--
ALTER TABLE `clothing`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `clothings`
--
ALTER TABLE `clothings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clothing_items`
--
ALTER TABLE `clothing_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clothing`
--
ALTER TABLE `clothing`
  ADD CONSTRAINT `clothings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `clothing_items`
--
ALTER TABLE `clothing_items`
  ADD CONSTRAINT `clothing_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
