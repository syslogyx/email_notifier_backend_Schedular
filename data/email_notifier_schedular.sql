-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 27, 2019 at 10:51 AM
-- Server version: 5.7.21-0ubuntu0.16.04.1
-- PHP Version: 7.2.16-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `email_notifier_schedular`
--

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `machine_id` bigint(20) UNSIGNED DEFAULT NULL,
  `port_1_0_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port_1_0_reason` bigint(20) UNSIGNED NOT NULL,
  `port_1_1_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port_1_1_reason` bigint(20) UNSIGNED NOT NULL,
  `port_2_0_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port_2_0_reason` bigint(20) UNSIGNED NOT NULL,
  `port_2_1_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port_2_1_reason` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `name`, `status`, `machine_id`, `port_1_0_status`, `port_1_0_reason`, `port_1_1_status`, `port_1_1_reason`, `port_2_0_status`, `port_2_0_reason`, `port_2_1_status`, `port_2_1_reason`, `created_at`, `updated_at`) VALUES
(1, 'DID01', 'ENGAGE', 1, 'ON', 2, NULL, 1, NULL, 1, 'OFF', 3, '2019-04-24 12:10:13', '2019-04-24 12:13:12'),
(2, 'DID02', 'ENGAGE', 2, 'ON', 2, 'OFF', 3, NULL, 1, NULL, 1, '2019-04-24 12:10:34', '2019-04-24 12:14:31');

-- --------------------------------------------------------

--
-- Table structure for table `machines`
--

CREATE TABLE `machines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `level_1_email_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `level_2_email_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `level_3_email_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `level_4_email_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `machines`
--

INSERT INTO `machines` (`id`, `name`, `email_ids`, `status`, `created_at`, `updated_at`, `user_id`, `level_1_email_ids`, `level_2_email_ids`, `level_3_email_ids`, `level_4_email_ids`) VALUES
(1, 'M1', 'sonal@syslogyx.com', 'ENGAGE', '2019-04-24 12:13:12', '2019-05-20 09:55:26', 2, 'monica.j@syslogyx.com', 'surbhi@syslogyx.com', 'bhushan@syslogyx.com', 'namrata.k@syslogyx.com'),
(2, 'M2', 'sonal@syslogyx.com', 'ENGAGE', '2019-04-24 12:14:31', '2019-04-24 12:15:54', 3, 'sonal@syslogyx.com', 'sonal@syslogyx.com', 'sonal@syslogyx.com', 'sonal@syslogyx.com');

-- --------------------------------------------------------

--
-- Table structure for table `machine_device_assocs`
--

CREATE TABLE `machine_device_assocs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `device_id` bigint(20) UNSIGNED NOT NULL,
  `machine_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `machine_device_assocs`
--

INSERT INTO `machine_device_assocs` (`id`, `device_id`, `machine_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'ENGAGE', '2019-04-24 12:13:12', '2019-04-24 12:13:12'),
(2, 2, 2, 'ENGAGE', '2019-04-24 12:14:31', '2019-04-24 12:14:31');

-- --------------------------------------------------------

--
-- Table structure for table `machine_email_levels`
--

CREATE TABLE `machine_email_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `level_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_in_minute` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `machine_email_levels`
--

INSERT INTO `machine_email_levels` (`id`, `level_no`, `time_in_minute`, `created_at`, `updated_at`) VALUES
(1, '1', '15', NULL, NULL),
(2, '2', '30', NULL, NULL),
(3, '3', '45', NULL, NULL),
(4, '4', '60', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `machine_statuses`
--

CREATE TABLE `machine_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `machine_id` bigint(20) UNSIGNED NOT NULL,
  `device_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `port` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `on_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `machine_statuses`
--

INSERT INTO `machine_statuses` (`id`, `machine_id`, `device_id`, `status`, `port`, `on_time`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '0', 'port_1', NULL, '2019-04-24 12:19:41', '2019-04-24 12:19:41'),
(2, 1, 1, '1', 'port_2', '2019-04-25 05:55:52', '2019-04-24 12:20:46', '2019-04-25 05:55:52'),
(3, 2, 2, '1', 'port_1', '2019-04-24 12:21:33', '2019-04-24 12:21:15', '2019-04-24 12:21:33'),
(4, 2, 2, '0', 'port_1', NULL, '2019-04-24 12:21:33', '2019-04-24 12:21:33'),
(5, 2, 2, '1', 'port_1', '2019-04-25 05:55:03', '2019-04-24 13:02:18', '2019-04-25 05:55:03'),
(6, 2, 2, '0', 'port_1', NULL, '2019-04-25 05:55:03', '2019-04-25 05:55:03'),
(7, 2, 2, '1', 'port_1', '2019-04-25 07:11:44', '2019-04-25 05:55:23', '2019-04-25 07:11:44'),
(8, 1, 1, '0', 'port_1', NULL, '2019-04-25 05:55:52', '2019-04-25 05:55:52'),
(9, 1, 1, '1', 'port_2', '2019-04-25 07:10:49', '2019-04-25 05:56:09', '2019-04-25 07:10:49'),
(10, 1, 1, '0', 'port_1', NULL, '2019-04-25 07:10:49', '2019-04-25 07:10:49'),
(11, 1, 1, '1', 'port_2', '2019-05-20 09:11:51', '2019-04-25 07:11:10', '2019-05-20 09:11:51'),
(12, 2, 2, '0', 'port_1', NULL, '2019-04-25 07:11:44', '2019-04-25 07:11:44'),
(13, 2, 2, '1', 'port_1', NULL, '2019-04-25 07:12:01', '2019-04-25 07:12:01'),
(14, 1, 1, '0', 'port_1', NULL, '2019-05-20 09:11:51', '2019-05-20 09:11:51'),
(15, 1, 1, '1', 'port_2', '2019-05-20 09:19:09', '2019-05-20 09:12:59', '2019-05-20 09:19:09'),
(16, 1, 1, '0', 'port_1', NULL, '2019-05-20 09:19:09', '2019-05-20 09:19:09'),
(17, 1, 1, '1', 'port_2', '2019-05-20 09:23:38', '2019-05-20 09:21:45', '2019-05-20 09:23:38'),
(18, 1, 1, '0', 'port_1', NULL, '2019-05-20 09:23:38', '2019-05-20 09:23:38'),
(19, 1, 1, '1', 'port_2', '2019-05-20 09:28:01', '2019-05-20 09:26:39', '2019-05-20 09:28:01'),
(20, 1, 1, '0', 'port_1', NULL, '2019-05-20 09:28:01', '2019-05-20 09:28:01'),
(21, 1, 1, '1', 'port_2', '2019-05-20 09:31:16', '2019-05-20 09:30:40', '2019-05-20 09:31:16'),
(22, 1, 1, '0', 'port_1', NULL, '2019-05-20 09:31:16', '2019-05-20 09:31:16'),
(23, 1, 1, '1', 'port_2', '2019-05-20 09:35:05', '2019-05-20 09:33:40', '2019-05-20 09:35:05'),
(24, 1, 1, '0', 'port_1', NULL, '2019-05-20 09:35:05', '2019-05-20 09:35:05'),
(25, 1, 1, '1', 'port_2', '2019-05-20 09:38:46', '2019-05-20 09:38:02', '2019-05-20 09:38:46'),
(26, 1, 1, '0', 'port_1', NULL, '2019-05-20 09:38:46', '2019-05-20 09:38:46'),
(27, 1, 1, '1', 'port_2', '2019-05-20 09:40:54', '2019-05-20 09:40:05', '2019-05-20 09:40:54'),
(28, 1, 1, '0', 'port_1', NULL, '2019-05-20 09:40:54', '2019-05-20 09:40:54'),
(29, 1, 1, '1', 'port_2', '2019-05-20 09:43:22', '2019-05-20 09:42:30', '2019-05-20 09:43:22'),
(30, 1, 1, '0', 'port_1', NULL, '2019-05-20 09:43:22', '2019-05-20 09:43:22'),
(31, 1, 1, '1', 'port_2', '2019-05-20 09:57:09', '2019-05-20 09:56:09', '2019-05-20 09:57:09'),
(32, 1, 1, '0', 'port_1', NULL, '2019-05-20 09:57:09', '2019-05-20 09:57:09'),
(33, 1, 1, '1', 'port_2', '2019-05-20 10:03:28', '2019-05-20 10:02:43', '2019-05-20 10:03:28'),
(34, 1, 1, '0', 'port_1', NULL, '2019-05-20 10:03:28', '2019-05-20 10:03:28'),
(35, 1, 1, '1', 'port_2', '2019-05-20 10:07:44', '2019-05-20 10:07:08', '2019-05-20 10:07:44'),
(36, 1, 1, '0', 'port_1', NULL, '2019-05-20 10:07:44', '2019-05-20 10:07:44'),
(37, 1, 1, '1', 'port_2', '2019-05-20 10:09:40', '2019-05-20 10:09:06', '2019-05-20 10:09:40'),
(38, 1, 1, '0', 'port_1', NULL, '2019-05-20 10:09:40', '2019-05-20 10:09:40'),
(39, 1, 1, '1', 'port_2', '2019-05-20 10:11:34', '2019-05-20 10:10:06', '2019-05-20 10:11:34'),
(40, 1, 1, '0', 'port_1', NULL, '2019-05-20 10:11:34', '2019-05-20 10:11:34'),
(41, 1, 1, '1', 'port_2', '2019-05-20 10:16:04', '2019-05-20 10:14:52', '2019-05-20 10:16:04'),
(42, 1, 1, '0', 'port_1', NULL, '2019-05-20 10:16:04', '2019-05-20 10:16:04'),
(43, 1, 1, '1', 'port_2', '2019-05-20 10:22:20', '2019-05-20 10:20:16', '2019-05-20 10:22:20'),
(44, 1, 1, '0', 'port_1', NULL, '2019-05-20 10:22:20', '2019-05-20 10:22:20'),
(45, 1, 1, '1', 'port_2', '2019-05-20 10:27:00', '2019-05-20 10:23:57', '2019-05-20 10:27:00'),
(46, 1, 1, '0', 'port_1', NULL, '2019-05-20 10:27:00', '2019-05-20 10:27:00'),
(47, 1, 1, '1', 'port_2', '2019-05-20 10:32:23', '2019-05-20 10:27:18', '2019-05-20 10:32:23'),
(48, 1, 1, '0', 'port_1', NULL, '2019-05-20 10:32:23', '2019-05-20 10:32:23'),
(49, 1, 1, '1', 'port_2', '2019-05-20 10:36:53', '2019-05-20 10:34:58', '2019-05-20 10:36:53'),
(50, 1, 1, '0', 'port_1', NULL, '2019-05-20 10:36:53', '2019-05-20 10:36:53');

-- --------------------------------------------------------

--
-- Table structure for table `mail_sent_assoc`
--

CREATE TABLE `mail_sent_assoc` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `machine_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `on_time` timestamp NULL DEFAULT NULL,
  `machine_level_id` bigint(20) UNSIGNED DEFAULT NULL,
  `port_status_reason_id` bigint(20) UNSIGNED DEFAULT NULL,
  `last_record_mail_sent_flag` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mail_sent_assoc`
--

INSERT INTO `mail_sent_assoc` (`id`, `machine_id`, `status`, `on_time`, `machine_level_id`, `port_status_reason_id`, `last_record_mail_sent_flag`, `created_at`, `updated_at`) VALUES
(1, 1, 'ON', '2019-04-24 12:19:47', 1, 2, NULL, '2019-04-24 12:19:47', '2019-04-24 12:19:47'),
(2, 1, 'OFF', '2019-04-24 12:20:51', 1, 3, NULL, '2019-04-24 12:20:51', '2019-04-25 05:31:32'),
(3, 2, 'OFF', '2019-04-24 12:21:20', 1, 3, NULL, '2019-04-24 12:21:20', '2019-04-24 12:21:20'),
(4, 2, 'ON', '2019-04-24 12:21:38', 1, 2, 0, '2019-04-24 12:21:38', '2019-04-24 12:21:38'),
(5, 2, 'OFF', '2019-04-24 13:02:22', 1, 3, 0, '2019-04-24 13:02:22', '2019-04-25 05:31:37'),
(6, 2, 'ON', '2019-04-25 05:55:08', 1, 2, 0, '2019-04-25 05:55:08', '2019-04-25 05:55:08'),
(7, 2, 'OFF', '2019-04-25 05:55:28', 2, 3, 0, '2019-04-25 05:55:28', '2019-04-25 07:05:55'),
(8, 1, 'ON', '2019-04-25 05:55:56', 1, 2, 0, '2019-04-25 05:55:57', '2019-04-25 05:55:57'),
(9, 1, 'OFF', '2019-04-25 05:56:14', 2, 3, 0, '2019-04-25 05:56:14', '2019-04-25 07:05:50'),
(10, 1, 'ON', '2019-04-25 07:10:56', 1, 2, 0, '2019-04-25 07:10:56', '2019-04-25 07:10:56'),
(11, 1, 'OFF', '2019-04-25 07:11:15', 4, 3, 1, '2019-04-25 07:11:15', '2019-05-02 06:24:54'),
(12, 2, 'ON', '2019-04-25 07:11:50', 1, 2, 0, '2019-04-25 07:11:50', '2019-04-25 07:11:50'),
(13, 2, 'OFF', '2019-04-25 07:12:05', 4, 3, 1, '2019-04-25 07:12:05', '2019-05-02 06:25:00'),
(14, 1, 'OFF', '2019-05-20 09:13:03', 3, 3, 0, '2019-05-20 09:13:03', '2019-05-20 09:13:03'),
(15, 1, 'ON', '2019-05-20 09:19:14', 1, 2, 0, '2019-05-20 09:19:14', '2019-05-20 09:19:14'),
(16, 1, 'OFF', '2019-05-20 09:21:51', 3, 3, 0, '2019-05-20 09:21:51', '2019-05-20 09:21:51'),
(17, 1, 'OFF', '2019-05-20 09:26:43', 3, 3, 0, '2019-05-20 09:26:43', '2019-05-20 09:26:43'),
(18, 1, 'OFF', '2019-05-20 09:30:46', 3, 3, 0, '2019-05-20 09:30:46', '2019-05-20 09:30:46'),
(19, 1, 'ON', '2019-05-20 09:31:20', 1, 2, 0, '2019-05-20 09:31:20', '2019-05-20 09:31:20'),
(20, 1, 'OFF', '2019-05-20 09:33:46', 3, 3, 0, '2019-05-20 09:33:46', '2019-05-20 09:33:46'),
(21, 1, 'ON', '2019-05-20 09:35:10', 1, 2, 0, '2019-05-20 09:35:10', '2019-05-20 09:35:10'),
(22, 1, 'OFF', '2019-05-20 09:38:09', 3, 3, 0, '2019-05-20 09:38:09', '2019-05-20 09:38:09'),
(23, 1, 'OFF', '2019-05-20 09:40:09', 1, 3, 0, '2019-05-20 09:40:09', '2019-05-20 09:40:09'),
(24, 1, 'ON', '2019-05-20 09:40:58', 1, 2, 0, '2019-05-20 09:40:58', '2019-05-20 09:40:58'),
(25, 1, 'OFF', '2019-05-20 09:42:40', 3, 3, 0, '2019-05-20 09:42:40', '2019-05-20 09:42:40'),
(26, 1, 'OFF', '2019-05-20 09:56:13', 4, 3, 0, '2019-05-20 09:56:13', '2019-05-20 09:56:13'),
(27, 1, 'ON', '2019-05-20 09:57:14', 1, 2, 0, '2019-05-20 09:57:14', '2019-05-20 09:57:14'),
(28, 1, 'OFF', '2019-05-20 10:02:52', 4, 3, 1, '2019-05-20 10:02:52', '2019-05-20 10:02:52'),
(29, 1, 'ON', '2019-05-20 10:03:32', 1, 2, 0, '2019-05-20 10:03:32', '2019-05-20 10:03:32'),
(30, 1, 'OFF', '2019-05-20 10:07:14', 4, 3, 1, '2019-05-20 10:07:14', '2019-05-20 10:07:14'),
(31, 1, 'OFF', '2019-05-20 10:09:11', 4, 3, 1, '2019-05-20 10:09:11', '2019-05-20 10:09:11'),
(32, 1, 'OFF', '2019-05-20 10:10:10', 4, 3, 1, '2019-05-20 10:10:10', '2019-05-20 10:10:10'),
(33, 1, 'ON', '2019-05-20 10:11:42', 1, 2, 0, '2019-05-20 10:11:42', '2019-05-20 10:11:42'),
(34, 1, 'OFF', '2019-05-20 10:14:56', 4, 3, 1, '2019-05-20 10:14:56', '2019-05-20 10:14:56'),
(35, 1, 'OFF', '2019-05-20 10:20:20', 4, 3, 1, '2019-05-20 10:20:20', '2019-05-20 10:20:20'),
(36, 1, 'ON', '2019-05-20 10:22:25', 1, 2, 0, '2019-05-20 10:22:25', '2019-05-20 10:22:25'),
(37, 1, 'OFF', '2019-05-20 10:24:01', 1, 3, 0, '2019-05-20 10:24:01', '2019-05-20 10:24:01'),
(38, 1, 'ON', '2019-05-20 10:27:04', 1, 2, 0, '2019-05-20 10:27:04', '2019-05-20 10:27:04'),
(39, 1, 'OFF', '2019-05-20 10:27:23', 4, 3, 1, '2019-05-20 10:27:23', '2019-05-20 10:27:23'),
(40, 1, 'ON', '2019-05-20 10:32:29', 1, 2, 0, '2019-05-20 10:32:29', '2019-05-20 10:32:29'),
(41, 1, 'OFF', '2019-05-20 10:35:04', 2, 3, 0, '2019-05-20 10:35:04', '2019-05-20 10:35:04'),
(42, 1, 'ON', '2019-05-20 10:36:58', 1, 2, 0, '2019-05-20 10:36:58', '2019-05-20 10:36:58');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2017_05_17_091141_create_users_table', 1),
(2, '2018_07_11_125000_create_roles_table', 1),
(3, '2018_09_18_110907_create_status__reasons_table', 1),
(4, '2018_09_18_110910_create_machines_table', 1),
(5, '2018_09_18_110911_create_devices_table', 1),
(6, '2018_09_18_111726_create_user__machine__assocs_table', 1),
(7, '2018_09_18_112202_create_machine_device_assocs_table', 1),
(8, '2018_09_18_112336_create_machine_statuses_table', 1),
(9, '2018_09_18_113001_create_user_estimations_table', 1),
(10, '2018_10_23_165026_Alter_columns_to_machines', 1),
(11, '2018_10_23_165637_Alter_columns_to_status__reasons', 1),
(12, '2018_12_14_140303_oldDeviceRecord', 1),
(13, '2019_04_24_113513_alter_machines_for_levels_email', 1),
(14, '2019_04_24_140735_create_machine_email_level_table', 1),
(15, '2019_04_24_141132_create_mail_sent_assoc_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `old_device_record_assocs`
--

CREATE TABLE `old_device_record_assocs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `machine_id` bigint(20) UNSIGNED DEFAULT NULL,
  `port_1_0_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port_1_0_reason` bigint(20) UNSIGNED NOT NULL,
  `port_1_1_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port_1_1_reason` bigint(20) UNSIGNED NOT NULL,
  `port_2_0_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port_2_0_reason` bigint(20) UNSIGNED NOT NULL,
  `port_2_1_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port_2_1_reason` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, NULL),
(2, 'Operator', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `status__reasons`
--

CREATE TABLE `status__reasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `device_id` bigint(20) UNSIGNED DEFAULT NULL,
  `port_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `status__reasons`
--

INSERT INTO `status__reasons` (`id`, `reason`, `status`, `created_at`, `updated_at`, `device_id`, `port_no`) VALUES
(1, 'NA', NULL, NULL, NULL, NULL, ''),
(2, 'ON', '0', '2019-04-24 12:10:13', '2019-04-24 12:10:13', NULL, 'port_1'),
(3, 'OFF', '1', '2019-04-24 12:10:13', '2019-04-24 12:10:13', NULL, 'port_2');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` bigint(20) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `mobile`, `email`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '9876543210', 'admin@syslogyx.com', '$2y$10$7qmxS3.5i84bY0RZULpJeOAddYKbj0qGRiYi8OAq1U/fO0EI7XtQS', 1, NULL, NULL, NULL),
(2, 'Operator', '9876543210', 'operator@syslogyx.com', '$2y$10$vFDYWhVStnph.cBXeQuN4uhGCE/zFPt09eaZese46klTvS4b/Q7qO', 2, NULL, NULL, NULL),
(3, 'New Operator', '7896582143', 'newoperator@syslogyx.com', '$2y$10$b/439kvl3A1mRZcanh94A.Ov3bKJ8weokjeUY3aTuO6c9Qfl1HF1.', 2, NULL, '2019-04-24 12:15:29', '2019-04-24 12:15:29');

-- --------------------------------------------------------

--
-- Table structure for table `user_estimations`
--

CREATE TABLE `user_estimations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `machine_status_id` bigint(20) UNSIGNED NOT NULL,
  `reason` bigint(20) UNSIGNED NOT NULL,
  `msg` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `hour` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user__machine__assocs`
--

CREATE TABLE `user__machine__assocs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `machine_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user__machine__assocs`
--

INSERT INTO `user__machine__assocs` (`id`, `user_id`, `machine_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'ENGAGE', '2019-04-24 12:14:37', '2019-04-24 12:14:37'),
(2, 3, 2, 'ENGAGE', '2019-04-24 12:15:54', '2019-04-24 12:15:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `devices_name_unique` (`name`),
  ADD KEY `devices_machine_id_foreign` (`machine_id`),
  ADD KEY `devices_port_1_0_reason_foreign` (`port_1_0_reason`),
  ADD KEY `devices_port_1_1_reason_foreign` (`port_1_1_reason`),
  ADD KEY `devices_port_2_0_reason_foreign` (`port_2_0_reason`),
  ADD KEY `devices_port_2_1_reason_foreign` (`port_2_1_reason`);

--
-- Indexes for table `machines`
--
ALTER TABLE `machines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `machines_user_id_foreign` (`user_id`);

--
-- Indexes for table `machine_device_assocs`
--
ALTER TABLE `machine_device_assocs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `machine_device_assocs_device_id_foreign` (`device_id`),
  ADD KEY `machine_device_assocs_machine_id_foreign` (`machine_id`);

--
-- Indexes for table `machine_email_levels`
--
ALTER TABLE `machine_email_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `machine_statuses`
--
ALTER TABLE `machine_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `machine_statuses_machine_id_foreign` (`machine_id`),
  ADD KEY `machine_statuses_device_id_foreign` (`device_id`);

--
-- Indexes for table `mail_sent_assoc`
--
ALTER TABLE `mail_sent_assoc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mail_sent_assoc_machine_id_foreign` (`machine_id`),
  ADD KEY `mail_sent_assoc_machine_level_id_foreign` (`machine_level_id`),
  ADD KEY `mail_sent_assoc_port_status_reason_id_foreign` (`port_status_reason_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `old_device_record_assocs`
--
ALTER TABLE `old_device_record_assocs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `old_device_record_assocs_machine_id_foreign` (`machine_id`),
  ADD KEY `old_device_record_assocs_port_1_0_reason_foreign` (`port_1_0_reason`),
  ADD KEY `old_device_record_assocs_port_1_1_reason_foreign` (`port_1_1_reason`),
  ADD KEY `old_device_record_assocs_port_2_0_reason_foreign` (`port_2_0_reason`),
  ADD KEY `old_device_record_assocs_port_2_1_reason_foreign` (`port_2_1_reason`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status__reasons`
--
ALTER TABLE `status__reasons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status__reasons_device_id_foreign` (`device_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_estimations`
--
ALTER TABLE `user_estimations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_estimations_user_id_foreign` (`user_id`),
  ADD KEY `user_estimations_machine_status_id_foreign` (`machine_status_id`),
  ADD KEY `user_estimations_reason_foreign` (`reason`);

--
-- Indexes for table `user__machine__assocs`
--
ALTER TABLE `user__machine__assocs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user__machine__assocs_user_id_foreign` (`user_id`),
  ADD KEY `user__machine__assocs_machine_id_foreign` (`machine_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `machines`
--
ALTER TABLE `machines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `machine_device_assocs`
--
ALTER TABLE `machine_device_assocs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `machine_email_levels`
--
ALTER TABLE `machine_email_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `machine_statuses`
--
ALTER TABLE `machine_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `mail_sent_assoc`
--
ALTER TABLE `mail_sent_assoc`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `old_device_record_assocs`
--
ALTER TABLE `old_device_record_assocs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `status__reasons`
--
ALTER TABLE `status__reasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user_estimations`
--
ALTER TABLE `user_estimations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user__machine__assocs`
--
ALTER TABLE `user__machine__assocs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `devices`
--
ALTER TABLE `devices`
  ADD CONSTRAINT `devices_machine_id_foreign` FOREIGN KEY (`machine_id`) REFERENCES `machines` (`id`),
  ADD CONSTRAINT `devices_port_1_0_reason_foreign` FOREIGN KEY (`port_1_0_reason`) REFERENCES `status__reasons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `devices_port_1_1_reason_foreign` FOREIGN KEY (`port_1_1_reason`) REFERENCES `status__reasons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `devices_port_2_0_reason_foreign` FOREIGN KEY (`port_2_0_reason`) REFERENCES `status__reasons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `devices_port_2_1_reason_foreign` FOREIGN KEY (`port_2_1_reason`) REFERENCES `status__reasons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `machines`
--
ALTER TABLE `machines`
  ADD CONSTRAINT `machines_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `machine_device_assocs`
--
ALTER TABLE `machine_device_assocs`
  ADD CONSTRAINT `machine_device_assocs_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `machine_device_assocs_machine_id_foreign` FOREIGN KEY (`machine_id`) REFERENCES `machines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `machine_statuses`
--
ALTER TABLE `machine_statuses`
  ADD CONSTRAINT `machine_statuses_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `machine_statuses_machine_id_foreign` FOREIGN KEY (`machine_id`) REFERENCES `machines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mail_sent_assoc`
--
ALTER TABLE `mail_sent_assoc`
  ADD CONSTRAINT `mail_sent_assoc_machine_id_foreign` FOREIGN KEY (`machine_id`) REFERENCES `machines` (`id`),
  ADD CONSTRAINT `mail_sent_assoc_machine_level_id_foreign` FOREIGN KEY (`machine_level_id`) REFERENCES `machine_email_levels` (`id`),
  ADD CONSTRAINT `mail_sent_assoc_port_status_reason_id_foreign` FOREIGN KEY (`port_status_reason_id`) REFERENCES `status__reasons` (`id`);

--
-- Constraints for table `old_device_record_assocs`
--
ALTER TABLE `old_device_record_assocs`
  ADD CONSTRAINT `old_device_record_assocs_machine_id_foreign` FOREIGN KEY (`machine_id`) REFERENCES `machines` (`id`),
  ADD CONSTRAINT `old_device_record_assocs_port_1_0_reason_foreign` FOREIGN KEY (`port_1_0_reason`) REFERENCES `status__reasons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `old_device_record_assocs_port_1_1_reason_foreign` FOREIGN KEY (`port_1_1_reason`) REFERENCES `status__reasons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `old_device_record_assocs_port_2_0_reason_foreign` FOREIGN KEY (`port_2_0_reason`) REFERENCES `status__reasons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `old_device_record_assocs_port_2_1_reason_foreign` FOREIGN KEY (`port_2_1_reason`) REFERENCES `status__reasons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `status__reasons`
--
ALTER TABLE `status__reasons`
  ADD CONSTRAINT `status__reasons_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`);

--
-- Constraints for table `user_estimations`
--
ALTER TABLE `user_estimations`
  ADD CONSTRAINT `user_estimations_machine_status_id_foreign` FOREIGN KEY (`machine_status_id`) REFERENCES `machine_statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_estimations_reason_foreign` FOREIGN KEY (`reason`) REFERENCES `status__reasons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_estimations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user__machine__assocs`
--
ALTER TABLE `user__machine__assocs`
  ADD CONSTRAINT `user__machine__assocs_machine_id_foreign` FOREIGN KEY (`machine_id`) REFERENCES `machines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user__machine__assocs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
