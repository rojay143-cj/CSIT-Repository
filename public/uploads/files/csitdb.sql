-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2025 at 10:23 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `csitdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_logs`
--

CREATE TABLE `access_logs` (
  `log_id` int(11) NOT NULL,
  `file_id` varchar(255) NOT NULL DEFAULT 'NULL',
  `accessed_by` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `access_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `access_logs`
--

INSERT INTO `access_logs` (`log_id`, `file_id`, `accessed_by`, `action`, `access_time`, `created_at`, `updated_at`) VALUES
(1, '0', 6, 'Created folder \'error\' under \'uploads\' - Successful', '2025-04-23 15:15:33', '2025-04-23 23:15:33', '2025-04-23 23:15:33'),
(2, '0', 7, 'Uploaded file - Successful', '2025-04-23 15:35:11', '2025-04-23 23:35:11', '2025-04-23 23:35:11');

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
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `file_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_size` int(11) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `published_by` varchar(255) NOT NULL DEFAULT 'null',
  `year_published` varchar(255) NOT NULL DEFAULT 'null',
  `uploaded_by` int(11) NOT NULL,
  `category` enum('capstone','thesis','faculty_request','accreditation','admin_docs') NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT 'null',
  `status` varchar(225) DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`file_id`, `filename`, `file_path`, `file_size`, `file_type`, `published_by`, `year_published`, `uploaded_by`, `category`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Web_based_Repository_of_Research_Outputs.pdf', 'uploads/error/Web_based_Repository_of_Research_Outputs.pdf', 6327050, 'pdf', 'Sam Sardido', '2012', 7, 'capstone', 'dsds', 'active', '2025-04-23 15:35:11', '2025-04-23 15:43:18');

-- --------------------------------------------------------

--
-- Table structure for table `file_requests`
--

CREATE TABLE `file_requests` (
  `request_id` int(11) NOT NULL,
  `requested_by` int(11) NOT NULL,
  `processed_by` int(11) NOT NULL DEFAULT 0,
  `file_id` int(11) NOT NULL,
  `note` text NOT NULL DEFAULT 'null',
  `request_status` varchar(255) DEFAULT 'pending',
  `request_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `response_date` timestamp NULL DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_time_stamps`
--

CREATE TABLE `file_time_stamps` (
  `timestamp_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `version_id` int(11) DEFAULT NULL,
  `event_type` varchar(255) DEFAULT 'NULL',
  `timestamp` datetime NOT NULL,
  `recorded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `file_time_stamps`
--

INSERT INTO `file_time_stamps` (`timestamp_id`, `file_id`, `version_id`, `event_type`, `timestamp`, `recorded_at`) VALUES
(1, 1, NULL, 'File ID  Archived', '2025-04-23 23:43:12', '2025-04-23 15:43:12'),
(2, 1, NULL, 'File ID  Unarchived', '2025-04-23 23:43:18', '2025-04-23 15:43:18');

-- --------------------------------------------------------

--
-- Table structure for table `file_versions`
--

CREATE TABLE `file_versions` (
  `version_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `version_number` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_size` int(11) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `uploaded_by` int(11) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `folders`
--

CREATE TABLE `folders` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` text NOT NULL,
  `status` varchar(255) DEFAULT 'public',
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `folders`
--

INSERT INTO `folders` (`id`, `name`, `path`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'error', 'uploads/error', 'public', 6, '2025-04-23 15:15:33', '2025-04-23 15:15:51');

-- --------------------------------------------------------

--
-- Table structure for table `folder_access`
--

CREATE TABLE `folder_access` (
  `id` int(11) NOT NULL,
  `folder_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `assigned_by` int(11) DEFAULT NULL,
  `note` text NOT NULL DEFAULT 'null',
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

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
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'NULL',
  `contact_number` varchar(255) NOT NULL DEFAULT 'null',
  `remember_token` varchar(100) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `contact_number`, `remember_token`, `status`, `created_at`, `updated_at`) VALUES
(3, 'admin123', 'admin123@gmail.com', NULL, '$2y$12$LDubJBxUVjWozUh4UDWnhOpOmHBFSTkevqPzXI3vWGoi.wv8OGu.m', 'admin', 'null', NULL, 'active', '2025-03-06 05:10:39', '2025-03-09 16:28:02'),
(4, 'sam', 'sam@gmail.com', NULL, '$2y$12$WVe2ckwq2CT5XANOjr97mO093QWjJ/WZBJwa7EbhgWjvlvni/JZDO', 'admin', 'null', NULL, 'active', '2025-03-07 09:03:05', '2025-03-07 09:16:14'),
(5, 'samsam', 'sam1@gmail.com', NULL, '$2y$12$rl477gWoGsgvme3atC/JieAskz17qwYDmxJvWQ9/erPYtEjGEALj6', 'user', 'null', NULL, 'active', '2025-03-07 09:03:24', '2025-03-07 09:03:24'),
(6, 'admin1234', 'admin@gmail.com', NULL, '$2y$12$Kw47lLTKGxz4qWsk5qVEB.5KHJUJwhxg5UXwgO92MVKkcY3fub7FC', 'admin', 'null', NULL, 'active', '2025-03-09 15:59:37', '2025-03-09 15:59:37'),
(7, 'Sam Sardido', 'staff@gmail.com', NULL, '$2y$12$WCMO.ajGv2g/8osk.A.fveDErx8.V3M5lTPAL1IzhTzLJWi/uVoz2', 'staff', 'null', NULL, 'active', '2025-03-10 10:04:37', '2025-03-10 10:04:37'),
(8, 'staff2', 'staff2@gmail.com', NULL, '$2y$12$VuCl/BAIHwYJycWr.xCHsewooFguIpeokxSu4dixA98rm1Zz.cGIm', 'staff', 'null', NULL, 'active', '2025-03-10 13:42:22', '2025-03-10 13:42:22'),
(9, 'FACULTY', 'faculty@gmail.com', NULL, '$2y$12$BjfBVW43VOkOl2X955AxkuxS7hj.gHrRD1Zg0g8NTroWF27YWX2Uy', 'faculty', 'null', NULL, 'active', '2025-03-12 05:50:21', '2025-03-12 05:50:21'),
(10, 'sam', 'sam12345@gmail.com', NULL, '$2y$12$6FNOLRrQF/rOf6vUKbc1r.HbkPPyxXDbrvqMbFbmhqr9Bukaznopi', 'staff', 'null', NULL, 'active', '2025-03-25 16:02:39', '2025-03-25 16:02:39'),
(11, 'jasmin', 'jasmin@gmail.com', NULL, '$2y$12$yMnpuYpRZidI46wARf9PB.v6K8WV0ZD/Wys/YpiGOf87KY7FFk5fu', 'staff', '09423245842', NULL, 'active', '2025-04-17 03:02:39', '2025-04-17 03:02:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_logs`
--
ALTER TABLE `access_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `file_requests`
--
ALTER TABLE `file_requests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `file_id` (`file_id`),
  ADD KEY `requested_by` (`requested_by`);

--
-- Indexes for table `file_time_stamps`
--
ALTER TABLE `file_time_stamps`
  ADD PRIMARY KEY (`timestamp_id`),
  ADD KEY `file_id` (`file_id`),
  ADD KEY `version_id` (`version_id`);

--
-- Indexes for table `file_versions`
--
ALTER TABLE `file_versions`
  ADD PRIMARY KEY (`version_id`),
  ADD KEY `file_id` (`file_id`);

--
-- Indexes for table `folders`
--
ALTER TABLE `folders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `folder_access`
--
ALTER TABLE `folder_access`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `folder_id` (`folder_id`,`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `access_logs`
--
ALTER TABLE `access_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `file_requests`
--
ALTER TABLE `file_requests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_time_stamps`
--
ALTER TABLE `file_time_stamps`
  MODIFY `timestamp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `file_versions`
--
ALTER TABLE `file_versions`
  MODIFY `version_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `folders`
--
ALTER TABLE `folders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `folder_access`
--
ALTER TABLE `folder_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `file_requests`
--
ALTER TABLE `file_requests`
  ADD CONSTRAINT `file_requests_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`),
  ADD CONSTRAINT `file_requests_ibfk_2` FOREIGN KEY (`requested_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `file_versions`
--
ALTER TABLE `file_versions`
  ADD CONSTRAINT `file_versions_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
