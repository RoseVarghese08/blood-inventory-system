-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2026 at 03:16 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blood_inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `alerts`
--

CREATE TABLE `alerts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `refrigerator_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `is_resolved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blood_bags`
--

CREATE TABLE `blood_bags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `refrigerator_id` bigint(20) UNSIGNED NOT NULL,
  `bag_number` varchar(255) NOT NULL,
  `blood_group` varchar(255) NOT NULL,
  `donor_name` varchar(255) NOT NULL,
  `collection_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` enum('available','reserved','dispatched','expired') NOT NULL DEFAULT 'available',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blood_bags`
--

INSERT INTO `blood_bags` (`id`, `refrigerator_id`, `bag_number`, `blood_group`, `donor_name`, `collection_date`, `expiry_date`, `quantity`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'BB-57417', 'B+', 'MR. BOYD LITTLE III', '2026-07-03', '2026-07-31', 350, 'available', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(3, 1, 'BB-556666', 'O+', 'ROSEMOL VARGHESE', '2026-07-10', '2026-08-15', 350, 'reserved', '2026-07-10 04:08:43', '2026-07-12 09:22:17'),
(4, 1, 'BB-82913', 'A-', 'LADARIUS BRAKUS', '2026-06-23', '2026-07-25', 450, 'dispatched', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(5, 1, 'BB-64159', 'B+', 'MRS. KRISTINA KOELPIN', '2026-06-23', '2026-07-02', 350, 'expired', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(6, 2, 'BB-82581', 'O-', 'PROF. JOHANN ROGAHN', '2026-07-09', '2026-07-15', 450, 'available', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(7, 2, 'BB-87482', 'B-', 'DR. ELVIS KUPHAL IV', '2026-06-28', '2026-07-09', 250, 'expired', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(8, 2, 'BB-07905', 'B+', 'ELENORA BARTELL I', '2026-06-30', '2026-07-26', 450, 'dispatched', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(9, 2, 'BB-78456', 'AB-', 'MEAGHAN JACOBI', '2026-06-24', '2026-07-02', 350, 'expired', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(10, 2, 'BB-27803', 'A-', 'MADELINE MITCHELL', '2026-07-05', '2026-07-10', 450, 'expired', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(11, 3, 'BB-35287', 'A+', 'ELROY GOODWIN', '2026-07-09', '2026-08-08', 350, 'reserved', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(12, 3, 'BB-76347', 'AB-', 'TREVOR GISLASON V', '2026-07-07', '2026-07-24', 250, 'available', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(13, 3, 'BB-97351', 'O+', 'CATALINA GLOVER', '2026-07-07', '2026-07-07', 250, 'expired', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(14, 3, 'BB-59287', 'A+', 'LANCE REICHEL', '2026-06-26', '2026-07-12', 250, 'available', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(15, 3, 'BB-72845', 'AB+', 'EVAN FRIESEN', '2026-06-26', '2026-07-09', 450, 'expired', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(16, 4, 'BB-84066', 'A+', 'OLE WATERS', '2026-06-30', '2026-08-06', 250, 'available', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(17, 4, 'BB-58375', 'AB-', 'PROF. ANIKA REINGER IV', '2026-07-04', '2026-07-13', 450, 'dispatched', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(18, 4, 'BB-67015', 'A+', 'PROF. PATRICIA HOWE I', '2026-06-23', '2026-07-15', 350, 'reserved', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(19, 4, 'BB-92508', 'A-', 'KIRK STROSIN', '2026-07-01', '2026-07-26', 450, 'available', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(20, 4, 'BB-87315', 'AB+', 'DR. BUD DIBBERT', '2026-06-28', '2026-08-05', 350, 'reserved', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(21, 5, 'BB-27204', 'B+', 'DR. CHARLENE HAMMES V', '2026-06-28', '2026-07-31', 350, 'available', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(22, 5, 'BB-20706', 'B+', 'SID LEUSCHKE', '2026-06-30', '2026-07-22', 450, 'reserved', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(23, 5, 'BB-03724', 'O+', 'KRISTIN GUTKOWSKI', '2026-06-30', '2026-07-09', 350, 'expired', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(24, 5, 'BB-78144', 'O+', 'DAVE BEER', '2026-06-27', '2026-07-17', 350, 'reserved', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(25, 5, 'BB-21070', 'O+', 'MR. GARNETT QUIGLEY', '2026-06-27', '2026-07-01', 350, 'expired', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(26, 6, 'BB-42233', 'AB-', 'MISS KASSANDRA BAUMBACH', '2026-07-08', '2026-07-08', 350, 'expired', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(27, 6, 'BB-88622', 'B+', 'DR. TORREY SCHULIST', '2026-07-01', '2026-07-16', 450, 'dispatched', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(28, 6, 'BB-01190', 'B-', 'NONA FADEL', '2026-06-22', '2026-07-23', 450, 'available', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(29, 6, 'BB-89583', 'B-', 'MAEVE MCCULLOUGH', '2026-07-05', '2026-07-24', 250, 'dispatched', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(30, 6, 'BB-65227', 'AB-', 'ALEXANDRE SANFORD', '2026-07-02', '2026-07-28', 450, 'reserved', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(31, 1, 'BB-50001', 'A+', 'ROSEMOL VARGHESE', '2026-07-10', '2026-08-10', 450, 'available', '2026-07-10 04:39:08', '2026-07-10 04:39:08'),
(32, 1, 'BB-5000555', 'A+', 'ROSE', '2026-07-10', '2026-08-10', 450, 'available', '2026-07-12 09:55:09', '2026-07-12 09:55:09');

-- --------------------------------------------------------

--
-- Table structure for table `blood_banks`
--

CREATE TABLE `blood_banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blood_banks`
--

INSERT INTO `blood_banks` (`id`, `name`, `address`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'Kohler-Streich', '161 Murray Mount\nNorth Reyview, PA 41857', '773-804-6086', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(2, 'Herzog Group', '7284 Viviane Ramp\nNew Soledad, ID 86107', '(445) 572-1488', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(3, 'Reilly-Zboncak', '918 Kiehn Crest\nKubport, NV 96460-4694', '309-452-9257', '2026-07-10 04:08:43', '2026-07-10 04:08:43');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('dashboard-data', 'a:6:{s:11:\"blood_banks\";i:3;s:13:\"refrigerators\";i:6;s:10:\"blood_bags\";i:31;s:20:\"available_blood_bags\";i:10;s:18:\"expired_blood_bags\";i:9;s:15:\"critical_alerts\";i:0;}', 1783872848);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_07_09_160745_create_personal_access_tokens_table', 1),
(5, '2026_07_09_163825_add_role_to_users_table', 1),
(6, '2026_07_09_182801_create_blood_banks_table', 1),
(7, '2026_07_09_182948_create_refrigerators_table', 1),
(8, '2026_07_10_040409_create_blood_bags_table', 1),
(9, '2026_07_10_040500_create_temperature_logs_table', 1),
(10, '2026_07_10_040541_create_alerts_table', 1),
(11, '2026_07_10_090433_create_notifications_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
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
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(5, 'App\\Models\\User', 1, 'auth_token', '2e448fb9fb6a7cb8795a80739327cd623d98cc2167b3cfec4c302442face0945', '[\"*\"]', '2026-07-12 10:42:47', NULL, '2026-07-12 09:16:13', '2026-07-12 10:42:47');

-- --------------------------------------------------------

--
-- Table structure for table `refrigerators`
--

CREATE TABLE `refrigerators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blood_bank_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `status` enum('active','inactive','maintenance') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `refrigerators`
--

INSERT INTO `refrigerators` (`id`, `blood_bank_id`, `name`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Refrigerator 6', 'REF-733', 'maintenance', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(2, 1, 'Refrigerator 1', 'REF-652', 'inactive', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(3, 2, 'Refrigerator 9', 'REF-740', 'active', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(4, 2, 'Refrigerator 16', 'REF-246', 'inactive', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(5, 3, 'Refrigerator 15', 'REF-507', 'inactive', '2026-07-10 04:08:43', '2026-07-10 04:08:43'),
(6, 3, 'Refrigerator 2', 'REF-210', 'inactive', '2026-07-10 04:08:43', '2026-07-10 04:08:43');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('B3dDMTT59JbJjG9gugouPWcAkr4CdPNdgpCKxBGw', NULL, '127.0.0.1', 'PostmanRuntime/7.54.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibVNpUlFDTlJ6dHdjVWdtTkhnQ21OVzk1S216dGlaZmNMM3dJT0xvWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1783869886);

-- --------------------------------------------------------

--
-- Table structure for table `temperature_logs`
--

CREATE TABLE `temperature_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `refrigerator_id` bigint(20) UNSIGNED NOT NULL,
  `temperature` decimal(4,2) NOT NULL,
  `recorded_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `temperature_logs`
--

INSERT INTO `temperature_logs` (`id`, `refrigerator_id`, `temperature`, `recorded_at`, `created_at`, `updated_at`) VALUES
(1, 1, 4.80, '2026-07-10 10:30:00', '2026-07-12 10:23:41', '2026-07-12 10:37:15'),
(2, 1, 4.60, '2026-07-10 06:30:00', '2026-07-12 10:25:38', '2026-07-12 10:25:38');

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
  `role` enum('admin','staff','monitoring') NOT NULL DEFAULT 'staff',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@example.com', NULL, '$2y$12$NRsb/TRMjvkoQ/0S6zcGB.xZYuJbyvNKJqabxossrbrzRs1TI8QnG', 'admin', NULL, '2026-07-10 04:08:40', '2026-07-10 04:08:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alerts`
--
ALTER TABLE `alerts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alerts_refrigerator_id_foreign` (`refrigerator_id`),
  ADD KEY `alerts_type_index` (`type`),
  ADD KEY `alerts_is_resolved_index` (`is_resolved`);

--
-- Indexes for table `blood_bags`
--
ALTER TABLE `blood_bags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blood_bags_bag_number_unique` (`bag_number`),
  ADD KEY `blood_bags_refrigerator_id_foreign` (`refrigerator_id`),
  ADD KEY `blood_bags_blood_group_index` (`blood_group`),
  ADD KEY `blood_bags_expiry_date_index` (`expiry_date`),
  ADD KEY `blood_bags_status_index` (`status`);

--
-- Indexes for table `blood_banks`
--
ALTER TABLE `blood_banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `refrigerators`
--
ALTER TABLE `refrigerators`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `refrigerators_code_unique` (`code`),
  ADD KEY `refrigerators_blood_bank_id_foreign` (`blood_bank_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `temperature_logs`
--
ALTER TABLE `temperature_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `temperature_logs_refrigerator_id_foreign` (`refrigerator_id`),
  ADD KEY `temperature_logs_temperature_index` (`temperature`),
  ADD KEY `temperature_logs_recorded_at_index` (`recorded_at`);

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
-- AUTO_INCREMENT for table `alerts`
--
ALTER TABLE `alerts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blood_bags`
--
ALTER TABLE `blood_bags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `blood_banks`
--
ALTER TABLE `blood_banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `refrigerators`
--
ALTER TABLE `refrigerators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `temperature_logs`
--
ALTER TABLE `temperature_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alerts`
--
ALTER TABLE `alerts`
  ADD CONSTRAINT `alerts_refrigerator_id_foreign` FOREIGN KEY (`refrigerator_id`) REFERENCES `refrigerators` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blood_bags`
--
ALTER TABLE `blood_bags`
  ADD CONSTRAINT `blood_bags_refrigerator_id_foreign` FOREIGN KEY (`refrigerator_id`) REFERENCES `refrigerators` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `refrigerators`
--
ALTER TABLE `refrigerators`
  ADD CONSTRAINT `refrigerators_blood_bank_id_foreign` FOREIGN KEY (`blood_bank_id`) REFERENCES `blood_banks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `temperature_logs`
--
ALTER TABLE `temperature_logs`
  ADD CONSTRAINT `temperature_logs_refrigerator_id_foreign` FOREIGN KEY (`refrigerator_id`) REFERENCES `refrigerators` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

