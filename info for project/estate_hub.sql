-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 09 سبتمبر 2020 الساعة 15:01
-- إصدار الخادم: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `estate_hub`
--

-- --------------------------------------------------------

--
-- بنية الجدول `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `view` tinyint(1) NOT NULL DEFAULT 0,
  `contact_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `contacts`
--

INSERT INTO `contacts` (`id`, `contact_name`, `contact_email`, `contact_subject`, `contact_message`, `view`, `contact_type`, `created_at`, `updated_at`) VALUES
(1, 'refaa', 'rifaajassim.as94@gmail.com', 'gggggggg', 'bbbbbbbbbbbbbbbb', 0, '2', '2020-08-26 20:09:14', '2020-08-26 20:09:14'),
(2, 'refaa', 'ahmadwasim.as94@gmail.com', 'gggggggg', 'nnnnnnnnnnn', 0, '2', '2020-08-26 20:24:59', '2020-08-26 20:24:59');

-- --------------------------------------------------------

--
-- بنية الجدول `estates`
--

CREATE TABLE `estates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `flour` int(11) NOT NULL,
  `roomnumber` int(11) NOT NULL,
  `space` int(11) NOT NULL,
  `price` bigint(20) NOT NULL,
  `investmenttypeid` int(11) NOT NULL,
  `neighbourhoodid` int(11) NOT NULL,
  `directionid` int(11) NOT NULL,
  `estatetypeid` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ownernumber` int(11) NOT NULL,
  `estate_meta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estate_small_dis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `month` int(3) NOT NULL,
  `year` int(5) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `estates`
--

INSERT INTO `estates` (`id`, `latitude`, `longitude`, `flour`, `roomnumber`, `space`, `price`, `investmenttypeid`, `neighbourhoodid`, `directionid`, `estatetypeid`, `description`, `image`, `user_id`, `ownernumber`, `estate_meta`, `estate_small_dis`, `status`, `month`, `year`, `address`, `created_at`, `updated_at`) VALUES
(2, 0, 0, 4, 9, 600000, 300000000, 2, 1, 4, 2, 'you need to first figure out how much rent you can afford per month. Of course, you’ll be limited by your income, and property managers and landlords will account for that when you submit a website.', 'img_6.jpg', 1, 2, 'hello', 'you need to first figure out how much rent you can afford per month. Of course, you’ll be limited by your income, and property managers and landlords will account for that when you submit a website.', 1, 6, 2020, 'Al-Nayrab', '2020-08-20 02:02:54', '2020-09-07 01:47:08'),
(3, 0, 0, 4, 9, 600000, 300000000, 2, 1, 4, 2, 'you need to first figure out how much rent you can afford per month. Of course, you’ll be limited by your income, and property managers and landlords will account for that when you submit a website.', 'hero_bg_1.jpg', 1, 2, 'hello', 'you need to first figure out how much rent you can afford per month. Of course, you’ll be limited by your income, and property managers and landlords will account for that when you submit a website.', 1, 2, 2019, 'Andalus', '2020-08-20 02:03:56', '2020-09-02 22:09:05'),
(4, 0, 0, 4, 9, 600000, 300000000, 3, 1, 4, 4, 'you need to first figure out how much rent you can afford per month. Of course, you’ll be limited by your income, and property managers and landlords will account for that when you submit a website.', 'V7.jpg', 1, 2, 'hello', 'you need to first figure out how much rent you can afford per month. Of course, you’ll be limited by your income, and property managers and landlords will account for that when you submit a website.', 1, 4, 2020, '', '2020-08-20 02:05:45', '2020-09-07 01:47:14'),
(5, 0, 0, 3, 6, 700000000, 4000, 1, 3, 2, 2, 'you need to first figure out how much rent you can afford per month. Of course, you’ll be limited by your income, and property managers and landlords will account for that when you submit a website.', 'img_1.jpg', 1, 2, 'hello', 'you need to first figure out how much rent you can afford per month. Of course, you’ll be limited by your income, and property managers and landlords will account for that when you submit a website.', 1, 8, 2020, '', '2020-08-25 18:32:50', '2020-09-02 22:09:11'),
(6, 0, 0, 1, 7, 600000, 2000000000, 1, 2, 1, 4, 'you need to first figure out how much rent you can afford per month. Of course, you’ll be limited by your income, and property managers and landlords will account for that when you submit a website.', 'C2.jpg', 1, 1, 'hello', 'you need to first figure out how much rent you can afford per month. Of course, you’ll be limited by your income, and property managers and landlords will account for that when you submit a website.', 1, 1, 2020, '', '2020-08-27 15:17:58', '2020-09-02 22:09:17'),
(7, 0, 0, 2, 2, 4000, 80000, 2, 3, 3, 7, 'you need to first figure out how much rent you can afford per month. Of course, you’ll be limited by your income, and property managers and landlords will account for that when you submit a website.', 'hero_bg_4.jpg', 1, 3, 'hello', 'you need to first figure out how much rent you can afford per month. Of course, you’ll be limited by your income, and property managers and landlords will account for that when you submit a website.', 1, 8, 2020, '', '2020-08-27 15:19:07', '2020-09-02 22:09:21'),
(8, 0, 0, 2, 2, 4000, 80000, 2, 3, 3, 7, 'you need to first figure out how much rent you can afford per month. Of course, you’ll be limited by your income, and property managers and landlords will account for that when you submit a website.', 'hero_bg_4.jpg', 1, 3, 'hello', 'you need to first figure out how much rent you can afford per month. Of course, you’ll be limited by your income, and property managers and landlords will account for that when you submit a website.', 1, 8, 2020, '', '2020-08-27 15:19:07', '2020-09-02 22:09:25'),
(9, 0, 0, 4, 7, 600000, 2000000000, 2, 1, 2, 3, '', 'house38-d.jpg', 1, 1, 'hello', 'you need to first figure out how much rent you can afford per month. Of course, you’ll be limited by your income, and property managers and landlords will account for that when you submit a website.', 1, 9, 2020, '', '2020-09-07 01:35:18', '2020-09-07 01:47:18'),
(10, 0, 0, 5, 4, 600000, 4000, 3, 2, 5, 2, '', 'house38-c.jpg', 1, 1, 'hello', 'you need to first figure out how much rent you can afford per month. Of course, you’ll be limited by your income, and property managers and landlords will account for that when you submit a website.', 1, 9, 2020, '', '2020-09-07 01:36:24', '2020-09-07 01:47:22');

-- --------------------------------------------------------

--
-- بنية الجدول `evaluations`
--

CREATE TABLE `evaluations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` int(11) NOT NULL,
  `agentimage` int(11) NOT NULL,
  `estates_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `estates_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- إرجاع أو استيراد بيانات الجدول `images`
--

INSERT INTO `images` (`id`, `image`, `estates_id`, `created_at`, `updated_at`) VALUES
(1, 'upload/893236839.jpg', 5, '2020-08-26 03:23:16', '2020-08-26 03:23:16'),
(2, 'upload/1188537443.jpg', 5, '2020-08-26 03:23:16', '2020-08-26 03:23:16'),
(3, 'upload/758840716.jpg', 5, '2020-08-26 03:23:16', '2020-08-26 03:23:16'),
(4, 'upload/1369019672.jpg', 5, '2020-08-26 03:23:17', '2020-08-26 03:23:17'),
(5, 'upload/597702073.jpg', 5, '2020-08-26 03:23:17', '2020-08-26 03:23:17'),
(6, 'upload/251214428.jpg', 5, '2020-08-26 03:23:17', '2020-08-26 03:23:17'),
(7, 'upload/1125683787.jpg', 5, '2020-08-26 03:23:17', '2020-08-26 03:23:17'),
(8, 'upload/1764495257.jpg', 2, '2020-08-26 03:24:22', '2020-08-26 03:24:22'),
(9, 'upload/523072144.jpg', 2, '2020-08-26 03:24:22', '2020-08-26 03:24:22'),
(10, 'upload/1805042189.jpg', 2, '2020-08-26 03:24:22', '2020-08-26 03:24:22'),
(11, 'upload/532685793.jpg', 2, '2020-08-26 03:24:22', '2020-08-26 03:24:22'),
(12, 'upload/1644077857.jpg', 2, '2020-08-26 03:24:22', '2020-08-26 03:24:22'),
(13, 'upload/2043836518.jpg', 3, '2020-08-26 03:28:26', '2020-08-26 03:28:26'),
(14, 'upload/926569501.jpg', 3, '2020-08-26 03:28:26', '2020-08-26 03:28:26'),
(15, 'upload/668560414.jpg', 3, '2020-08-26 03:28:26', '2020-08-26 03:28:26'),
(16, 'upload/2136102185.jpg', 3, '2020-08-26 03:28:26', '2020-08-26 03:28:26'),
(17, 'upload/1401135648.jpg', 3, '2020-08-26 03:28:27', '2020-08-26 03:28:27'),
(18, 'upload/1174051530.jpg', 3, '2020-08-26 03:30:07', '2020-08-26 03:30:07'),
(19, 'upload/332541193.jpg', 3, '2020-08-26 03:30:07', '2020-08-26 03:30:07'),
(20, 'upload/165680763.jpg', 3, '2020-08-26 03:30:07', '2020-08-26 03:30:07'),
(21, 'upload/1828504567.jpg', 3, '2020-08-26 03:30:07', '2020-08-26 03:30:07'),
(22, 'upload/1453773650.jpg', 3, '2020-08-26 03:30:07', '2020-08-26 03:30:07'),
(23, 'upload/77508382.jpg', 3, '2020-08-26 03:30:08', '2020-08-26 03:30:08'),
(24, 'upload/1561430630.jpg', 3, '2020-08-26 03:31:04', '2020-08-26 03:31:04'),
(25, 'upload/881315553.jpg', 2, '2020-08-26 03:33:05', '2020-08-26 03:33:05'),
(26, 'upload/1661667425.jpg', 2, '2020-08-26 03:33:34', '2020-08-26 03:33:34'),
(27, 'upload/1310258586.jpg', 2, '2020-08-26 03:35:20', '2020-08-26 03:35:20'),
(28, 'upload/1302314128.jpg', 6, '2020-08-27 15:20:23', '2020-08-27 15:20:23'),
(29, 'upload/620228655.jpg', 6, '2020-08-27 15:20:23', '2020-08-27 15:20:23'),
(30, 'upload/1071381940.jpg', 6, '2020-08-27 15:20:23', '2020-08-27 15:20:23'),
(31, 'upload/26763420.jpg', 6, '2020-08-27 15:20:23', '2020-08-27 15:20:23'),
(32, 'upload/793795184.jpg', 6, '2020-08-27 15:20:23', '2020-08-27 15:20:23'),
(33, 'upload/19666265.jpg', 6, '2020-08-27 15:20:23', '2020-08-27 15:20:23'),
(34, 'upload/2012569627.jpg', 7, '2020-08-27 15:24:08', '2020-08-27 15:24:08'),
(35, 'upload/1655285503.jpg', 7, '2020-08-27 15:24:08', '2020-08-27 15:24:08'),
(36, 'upload/327976580.jpg', 7, '2020-08-27 15:24:08', '2020-08-27 15:24:08'),
(37, 'upload/1346941092.jpg', 7, '2020-08-27 15:24:08', '2020-08-27 15:24:08'),
(38, 'upload/1649369602.jpg', 7, '2020-08-27 15:24:08', '2020-08-27 15:24:08'),
(39, 'upload/1078368981.jpg', 7, '2020-08-27 15:24:08', '2020-08-27 15:24:08'),
(40, 'upload/1028363509.jpg', 8, '2020-08-27 15:24:29', '2020-08-27 15:24:29'),
(41, 'upload/1753673453.jpg', 8, '2020-08-27 15:24:29', '2020-08-27 15:24:29'),
(42, 'upload/1187927036.jpg', 8, '2020-08-27 15:24:29', '2020-08-27 15:24:29'),
(43, 'upload/1557922846.jpg', 8, '2020-08-27 15:24:29', '2020-08-27 15:24:29'),
(44, 'upload/2023988366.jpg', 8, '2020-08-27 15:24:29', '2020-08-27 15:24:29'),
(45, 'upload/532654237.jpg', 8, '2020-08-27 15:24:29', '2020-08-27 15:24:29');

-- --------------------------------------------------------

--
-- بنية الجدول `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_08_19_093131_create_estates_table', 1),
(5, '2020_08_19_093455_create_services_table', 1),
(6, '2020_08_19_093712_create_contacts_table', 1),
(7, '2020_08_19_094622_create_images_table', 2),
(8, '2020_08_19_094830_create_evaluations_table', 3),
(9, '2020_08_19_095202_create_servicesestates_table', 3);

-- --------------------------------------------------------

--
-- بنية الجدول `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `services`
--

INSERT INTO `services` (`id`, `service_name`, `created_at`, `updated_at`) VALUES
(1, 'water', '2020-08-27 07:00:00', '2020-08-27 07:00:00'),
(2, 'electricity', '2020-08-27 08:00:51', '2020-08-27 08:00:51'),
(3, 'schools', '2020-08-27 08:01:09', '2020-08-27 08:01:09'),
(4, 'shops', '2020-08-27 08:01:37', '2020-08-27 08:01:37'),
(5, 'public garden', '2020-08-27 08:03:13', '2020-08-27 08:03:13'),
(6, 'bakery', '2020-08-27 08:55:19', '2020-08-27 08:55:19'),
(7, 'ovens', '2020-09-02 12:33:46', '2020-09-02 12:33:46'),
(8, 'churchs', '2020-09-02 12:33:46', '2020-09-02 12:33:46'),
(9, 'mosques', '2020-09-02 12:34:21', '2020-09-02 12:34:21');

-- --------------------------------------------------------

--
-- بنية الجدول `servicesestates`
--

CREATE TABLE `servicesestates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `services` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estates_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `servicesestates`
--

INSERT INTO `servicesestates` (`id`, `services`, `estates_id`, `created_at`, `updated_at`) VALUES
(1, 'services/water.jpg', 2, '2020-09-02 20:12:47', '2020-09-02 20:12:47'),
(2, 'services/electricity.jpg', 2, '2020-09-02 20:13:14', '2020-09-02 20:13:14'),
(3, 'services/mosques.jpg', 2, '2020-09-02 20:13:15', '2020-09-02 20:13:15'),
(4, 'services/amusementpark.jpg', 2, '2020-09-02 22:00:43', '2020-09-02 22:00:43'),
(5, 'services/schools.jpg', 2, '2020-09-02 22:01:19', '2020-09-02 22:01:19'),
(6, 'services/shops.jpg', 2, '2020-09-02 22:01:19', '2020-09-02 22:01:19'),
(7, 'services/bakery.jpg', 2, '2020-09-02 22:01:19', '2020-09-02 22:01:19'),
(8, 'services/water.jpg', 3, '2020-09-02 22:04:52', '2020-09-02 22:04:52'),
(9, 'services/electricity.jpg', 3, '2020-09-02 22:04:52', '2020-09-02 22:04:52'),
(10, 'services/shops.jpg', 3, '2020-09-02 22:05:37', '2020-09-02 22:05:37'),
(11, 'services/churchs.jpg', 3, '2020-09-02 22:05:37', '2020-09-02 22:05:37'),
(12, 'services/water.jpg', 4, '2020-09-02 22:05:59', '2020-09-02 22:05:59'),
(13, 'services/electricity.jpg', 4, '2020-09-02 22:06:00', '2020-09-02 22:06:00'),
(14, 'services/mosques.jpg', 4, '2020-09-02 22:06:00', '2020-09-02 22:06:00'),
(15, 'services/schools.jpg', 4, '2020-09-02 22:06:00', '2020-09-02 22:06:00'),
(16, 'services/water.jpg', 5, '2020-09-02 22:06:18', '2020-09-02 22:06:18'),
(17, 'services/electricity.jpg', 5, '2020-09-02 22:06:18', '2020-09-02 22:06:18'),
(18, 'services/water.jpg', 6, '2020-09-02 22:06:44', '2020-09-02 22:06:44'),
(19, 'services/electricity.jpg', 6, '2020-09-02 22:06:44', '2020-09-02 22:06:44'),
(20, 'services/mosques.jpg', 6, '2020-09-02 22:06:44', '2020-09-02 22:06:44'),
(21, 'services/gardens.jpg', 6, '2020-09-02 22:06:45', '2020-09-02 22:06:45'),
(22, 'services/churchs.jpg', 6, '2020-09-02 22:06:45', '2020-09-02 22:06:45'),
(23, 'services/water.jpg', 7, '2020-09-02 22:07:09', '2020-09-02 22:07:09'),
(24, 'services/electricity.jpg', 7, '2020-09-02 22:07:09', '2020-09-02 22:07:09'),
(25, 'services/gardens.jpg', 7, '2020-09-02 22:07:09', '2020-09-02 22:07:09'),
(26, 'services/churchs.jpg', 7, '2020-09-02 22:07:09', '2020-09-02 22:07:09'),
(27, 'services/water.jpg', 8, '2020-09-02 22:07:30', '2020-09-02 22:07:30'),
(28, 'services/electricity.jpg', 8, '2020-09-02 22:07:30', '2020-09-02 22:07:30'),
(29, 'services/shops.jpg', 8, '2020-09-02 22:07:30', '2020-09-02 22:07:30'),
(30, 'services/bakery.jpg', 8, '2020-09-02 22:07:30', '2020-09-02 22:07:30'),
(31, 'services/gardens.jpg', 4, '2020-09-02 22:58:19', '2020-09-02 22:58:19');

-- --------------------------------------------------------

--
-- بنية الجدول `sitesetting`
--

CREATE TABLE `sitesetting` (
  `id` int(11) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `sitename` varchar(50) NOT NULL,
  `value` varchar(100) NOT NULL,
  `type` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- إرجاع أو استيراد بيانات الجدول `sitesetting`
--

INSERT INTO `sitesetting` (`id`, `slug`, `sitename`, `value`, `type`, `created_at`, `updated_at`) VALUES
(1, 'site_name', 'EStateInvestmentGate', 'EState Investment Gate', 0, '2020-08-19 13:47:37', '2020-08-19 13:47:37'),
(2, 'facebook', 'facebook', 'https://www.facebook.com', 0, '2020-08-19 18:23:18', '2020-08-19 18:23:18'),
(3, 'twitter', 'twitter', 'https://www.twitter.com', 0, '2020-08-19 18:23:18', '2020-08-19 18:23:18'),
(4, 'telegram', 'telegram', 'https://www.telegram.com', 0, '2020-08-19 18:24:23', '2020-08-19 18:24:23'),
(5, 'instagram', 'instagram', 'https://www.instagram.com', 0, '2020-08-19 18:24:23', '2020-08-19 18:24:23'),
(6, 'linkedin', 'linkedin', 'https://www.linkedin.com', 0, '2020-08-19 18:25:06', '2020-08-19 18:25:06'),
(7, 'footer', 'footer', 'Rifaaaljassim', 0, '2020-08-19 18:26:32', '2020-08-19 18:26:32'),
(8, 'address', 'address', 'Syria', 0, '2020-08-26 13:05:34', '2020-08-26 13:05:34'),
(9, 'mobile', 'mobile', '0998180248', 0, '2020-08-26 13:05:34', '2020-08-26 13:05:34'),
(10, 'email', 'email', 'Refaajassim.as94@gmail.com', 0, '2020-08-26 13:06:08', '2020-08-26 13:06:08'),
(11, 'mainimage', 'image', 'about.jpg', 3, '2020-08-26 14:57:59', '2020-08-26 14:57:59');

-- --------------------------------------------------------

--
-- بنية الجدول `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `admin`, `created_at`, `updated_at`) VALUES
(1, 'RifaaJassim', 'rifaajassim.as94@gmail.com', NULL, '$2y$10$G9mJCzRri1B7eB5yvzz9sO1ap1H5N/5TlRd16GXkN21mHuwgADy0a', NULL, 1, '2020-08-19 20:38:24', '2020-08-19 20:38:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contacts_contact_email_unique` (`contact_email`);

--
-- Indexes for table `estates`
--
ALTER TABLE `estates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `evaluations`
--
ALTER TABLE `evaluations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluations_estates_id_foreign` (`estates_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estate-image` (`estates_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `servicesestates`
--
ALTER TABLE `servicesestates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `servicesestates_estates_id_foreign` (`estates_id`);

--
-- Indexes for table `sitesetting`
--
ALTER TABLE `sitesetting`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `estates`
--
ALTER TABLE `estates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `evaluations`
--
ALTER TABLE `evaluations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `servicesestates`
--
ALTER TABLE `servicesestates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `sitesetting`
--
ALTER TABLE `sitesetting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- قيود الجداول المحفوظة
--

--
-- القيود للجدول `evaluations`
--
ALTER TABLE `evaluations`
  ADD CONSTRAINT `evaluations_estates_id_foreign` FOREIGN KEY (`estates_id`) REFERENCES `estates` (`id`);

--
-- القيود للجدول `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `estate-image` FOREIGN KEY (`estates_id`) REFERENCES `estates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `servicesestates`
--
ALTER TABLE `servicesestates`
  ADD CONSTRAINT `servicesestates_estates_id_foreign` FOREIGN KEY (`estates_id`) REFERENCES `estates` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
