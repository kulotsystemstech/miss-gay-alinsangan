-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2024 at 11:25 AM
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
-- Database: `miss-gay-alinsangan`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `number` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active_portion` varchar(255) DEFAULT NULL,
  `called_at` timestamp NULL DEFAULT NULL,
  `pinged_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `number`, `name`, `avatar`, `username`, `password`, `active_portion`, `called_at`, `pinged_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'DEVELOPMENT', 'no-avatar.jpg', 'admin', 'admin', NULL, NULL, NULL, '2023-02-19 07:36:32', '2024-05-02 08:43:28');

-- --------------------------------------------------------

--
-- Table structure for table `arrangements`
--

CREATE TABLE `arrangements` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `competition_id` tinyint(3) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `competition_id`, `slug`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'pageant', 'Pageant', '2023-04-06 13:25:10', '2024-04-01 05:06:51');

-- --------------------------------------------------------

--
-- Table structure for table `competitions`
--

CREATE TABLE `competitions` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `competitions`
--

INSERT INTO `competitions` (`id`, `slug`, `title`, `created_at`, `updated_at`) VALUES
(1, 'miss-gay-alinsangan-2024', 'Miss Gay Alinsangan 2024', '2023-04-06 13:24:04', '2024-03-27 11:59:24');

-- --------------------------------------------------------

--
-- Table structure for table `criteria`
--

CREATE TABLE `criteria` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `percentage` float UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `criteria`
--

INSERT INTO `criteria` (`id`, `event_id`, `title`, `percentage`, `created_at`, `updated_at`) VALUES
(1, 1, 'Poise & Bearing', 20, '2024-05-02 08:59:48', '2024-05-02 08:59:48'),
(2, 1, 'Mastery of Steps', 20, '2024-05-02 08:59:56', '2024-05-02 08:59:56'),
(3, 1, 'Self Introduction', 20, '2024-05-02 09:00:05', '2024-05-02 09:00:05'),
(4, 1, 'Stage Presence', 20, '2024-05-02 09:00:14', '2024-05-02 09:00:14'),
(5, 1, 'Overall Look', 20, '2024-05-02 09:00:21', '2024-05-02 09:00:21'),
(6, 2, 'Appropriateness of Attire', 20, '2024-05-02 09:00:48', '2024-05-02 09:00:48'),
(7, 2, 'Originality & Confidence', 20, '2024-05-02 09:00:59', '2024-05-02 09:00:59'),
(8, 2, 'Attention to Details w/ Accessories', 20, '2024-05-02 09:01:11', '2024-05-02 09:01:11'),
(9, 2, 'Stage Presence', 20, '2024-05-02 09:01:20', '2024-05-02 09:01:20'),
(10, 2, 'Overall Look', 20, '2024-05-02 09:01:29', '2024-05-02 09:01:29'),
(11, 3, 'Confidence', 20, '2024-05-02 09:01:45', '2024-05-02 09:01:45'),
(12, 3, 'Personality', 20, '2024-05-02 09:01:54', '2024-05-02 09:01:54'),
(13, 3, 'Sense of Style', 20, '2024-05-02 09:02:07', '2024-05-02 09:02:07'),
(14, 3, 'Stage Presence', 20, '2024-05-02 09:02:20', '2024-05-02 09:02:20'),
(15, 3, 'Overall Look', 20, '2024-05-02 09:02:27', '2024-05-02 09:02:27'),
(16, 4, 'Appropriateness of the Gown', 20, '2024-05-02 09:02:47', '2024-05-02 09:02:47'),
(17, 4, 'Originality & Confidence', 20, '2024-05-02 09:02:57', '2024-05-02 09:02:57'),
(18, 4, 'Attention to Details w/ Accessories', 20, '2024-05-02 09:03:13', '2024-05-02 09:03:13'),
(19, 4, 'Stage Presence', 20, '2024-05-02 09:03:21', '2024-05-02 09:03:21'),
(20, 4, 'Overall Look', 20, '2024-05-02 09:03:30', '2024-05-02 09:03:30'),
(21, 5, 'Answer to the Question', 20, '2024-05-02 09:03:56', '2024-05-02 09:03:56'),
(22, 5, 'Poise', 20, '2024-05-02 09:04:07', '2024-05-02 09:04:07'),
(23, 5, 'Speaking Ability', 20, '2024-05-02 09:04:14', '2024-05-02 09:04:14'),
(24, 5, 'Stage Presence', 20, '2024-05-02 09:04:23', '2024-05-02 09:04:23'),
(25, 5, 'Overall Appearance', 20, '2024-05-02 09:04:34', '2024-05-02 09:04:34'),
(26, 6, 'Wit and Content', 40, '2024-05-02 09:04:46', '2024-05-02 09:04:46'),
(27, 6, 'Projection & Delivery', 30, '2024-05-02 09:04:54', '2024-05-02 09:04:54'),
(28, 6, 'Stage Presence', 20, '2024-05-02 09:05:02', '2024-05-02 09:05:02'),
(29, 6, 'Over-all Impact', 10, '2024-05-02 09:05:09', '2024-05-02 09:05:09');

-- --------------------------------------------------------

--
-- Table structure for table `deductions`
--

CREATE TABLE `deductions` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `technical_id` tinyint(3) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `value` float UNSIGNED NOT NULL DEFAULT 0,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eliminations`
--

CREATE TABLE `eliminations` (
  `id` mediumint(9) NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `eliminations`
--

INSERT INTO `eliminations` (`id`, `event_id`, `team_id`, `created_at`, `updated_at`) VALUES
(1, 6, 1, '2024-05-02 09:24:41', '2024-05-02 09:24:41'),
(2, 6, 2, '2024-05-02 09:24:41', '2024-05-02 09:24:41'),
(3, 6, 3, '2024-05-02 09:24:42', '2024-05-02 09:24:42'),
(4, 6, 4, '2024-05-02 09:24:43', '2024-05-02 09:24:43'),
(5, 6, 5, '2024-05-02 09:24:43', '2024-05-02 09:24:43'),
(6, 6, 6, '2024-05-02 09:24:44', '2024-05-02 09:24:44'),
(7, 6, 7, '2024-05-02 09:24:45', '2024-05-02 09:24:45'),
(8, 6, 8, '2024-05-02 09:24:46', '2024-05-02 09:24:46'),
(9, 6, 9, '2024-05-02 09:24:46', '2024-05-02 09:24:46'),
(10, 6, 10, '2024-05-02 09:24:47', '2024-05-02 09:24:47'),
(11, 6, 11, '2024-05-02 09:24:47', '2024-05-02 09:24:47'),
(12, 6, 12, '2024-05-02 09:24:48', '2024-05-02 09:24:48'),
(13, 6, 13, '2024-05-02 09:24:49', '2024-05-02 09:24:49'),
(14, 6, 14, '2024-05-02 09:24:49', '2024-05-02 09:24:49'),
(15, 6, 15, '2024-05-02 09:24:50', '2024-05-02 09:24:50'),
(16, 6, 16, '2024-05-02 09:24:51', '2024-05-02 09:24:51'),
(17, 6, 17, '2024-05-02 09:24:51', '2024-05-02 09:24:51'),
(18, 6, 18, '2024-05-02 09:24:52', '2024-05-02 09:24:52'),
(19, 6, 19, '2024-05-02 09:24:53', '2024-05-02 09:24:53'),
(20, 6, 20, '2024-05-02 09:24:53', '2024-05-02 09:24:53');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `category_id` tinyint(3) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `category_id`, `slug`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'production', 'Production Number', '2024-05-02 08:56:26', '2024-05-02 08:56:26'),
(2, 1, 'festival-attire', 'Festival Attire', '2024-05-02 08:57:06', '2024-05-02 08:57:06'),
(3, 1, 'swimsuit', 'Swimsuit Competition', '2024-05-02 08:57:25', '2024-05-02 08:57:25'),
(4, 1, 'evening-gown', 'Evening Gown', '2024-05-02 08:58:06', '2024-05-02 08:58:06'),
(5, 1, 'prelim-qa', 'Preliminary Q&A', '2024-05-02 08:58:28', '2024-05-02 08:58:28'),
(6, 1, 'final-qa', 'Final Q&A', '2024-05-02 08:58:50', '2024-05-02 08:58:50');

-- --------------------------------------------------------

--
-- Table structure for table `judges`
--

CREATE TABLE `judges` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `number` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active_portion` varchar(255) DEFAULT NULL,
  `called_at` timestamp NULL DEFAULT NULL,
  `pinged_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `judges`
--

INSERT INTO `judges` (`id`, `number`, `name`, `avatar`, `username`, `password`, `active_portion`, `called_at`, `pinged_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Judge 01', 'no-avatar.jpg', 'judge01', 'judge01', NULL, NULL, NULL, '2023-04-06 13:58:11', '2024-05-02 09:07:01'),
(2, 2, 'Judge 02', 'no-avatar.jpg', 'judge02', 'judge02', NULL, NULL, NULL, '2023-04-06 13:58:28', '2023-04-06 13:58:28'),
(3, 3, 'Judge 03', 'no-avatar.jpg', 'judge03', 'judge03', NULL, NULL, NULL, '2023-04-06 13:58:42', '2023-04-06 13:58:42'),
(4, 4, 'Judge 04', 'no-avatar.jpg', 'judge04', 'judge04', NULL, NULL, NULL, '2023-04-06 13:59:26', '2023-04-06 13:59:26'),
(5, 5, 'Judge 05', 'no-avatar.jpg', 'judge05', 'judge05', NULL, NULL, NULL, '2023-04-06 14:00:00', '2023-04-06 14:00:00'),
(6, 1, 'Costume Judge 01', 'no-avatar.jpg', 'judge06', 'judge06', NULL, NULL, NULL, '2024-05-02 09:09:41', '2024-05-02 09:09:41'),
(7, 2, 'Costume Judge 02', 'no-avatar.jpg', 'judge07', 'judge07', NULL, NULL, NULL, '2024-05-02 09:09:41', '2024-05-02 09:09:41'),
(8, 3, 'Costume Judge 03', 'no-avatar.jpg', 'judge08', 'judge08', NULL, NULL, NULL, '2024-05-02 09:09:41', '2024-05-02 09:09:41'),
(9, 4, 'Costume Judge 04', 'no-avatar.jpg', 'judge09', 'judge09', NULL, NULL, NULL, '2024-05-02 09:09:41', '2024-05-02 09:09:41'),
(10, 5, 'Costume Judge 05', 'no-avatar.jpg', 'judge10', 'judge10', NULL, NULL, NULL, '2024-05-02 09:09:41', '2024-05-02 09:09:41');

-- --------------------------------------------------------

--
-- Table structure for table `judge_event`
--

CREATE TABLE `judge_event` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `judge_id` tinyint(3) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `is_chairman` tinyint(1) NOT NULL DEFAULT 0,
  `active_team_id` tinyint(3) UNSIGNED NOT NULL,
  `has_active_team` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `judge_event`
--

INSERT INTO `judge_event` (`id`, `judge_id`, `event_id`, `is_chairman`, `active_team_id`, `has_active_team`, `created_at`, `updated_at`) VALUES
(3, 6, 2, 0, 1, 0, '2024-05-02 09:10:14', '2024-05-02 09:10:14'),
(4, 7, 2, 0, 1, 0, '2024-05-02 09:10:21', '2024-05-02 09:10:21'),
(5, 8, 2, 0, 1, 0, '2024-05-02 09:10:32', '2024-05-02 09:10:32'),
(6, 9, 2, 0, 1, 0, '2024-05-02 09:10:42', '2024-05-02 09:10:42'),
(7, 10, 2, 0, 1, 0, '2024-05-02 09:10:50', '2024-05-02 09:10:50'),
(8, 1, 1, 0, 1, 0, '2024-05-02 09:11:37', '2024-05-02 09:11:37'),
(9, 1, 3, 0, 1, 0, '2024-05-02 09:11:42', '2024-05-02 09:11:42'),
(10, 1, 4, 0, 1, 0, '2024-05-02 09:11:46', '2024-05-02 09:11:46'),
(11, 1, 5, 0, 1, 0, '2024-05-02 09:11:50', '2024-05-02 09:11:50'),
(12, 1, 6, 0, 1, 0, '2024-05-02 09:11:54', '2024-05-02 09:11:54'),
(13, 2, 1, 0, 1, 0, '2024-05-02 09:12:05', '2024-05-02 09:12:05'),
(14, 2, 3, 0, 1, 0, '2024-05-02 09:12:10', '2024-05-02 09:12:10'),
(15, 2, 4, 0, 1, 0, '2024-05-02 09:12:13', '2024-05-02 09:12:13'),
(16, 2, 5, 0, 1, 0, '2024-05-02 09:12:17', '2024-05-02 09:12:17'),
(17, 2, 6, 0, 1, 0, '2024-05-02 09:12:21', '2024-05-02 09:12:21'),
(18, 3, 1, 0, 1, 0, '2024-05-02 09:12:26', '2024-05-02 09:12:26'),
(19, 3, 3, 0, 1, 0, '2024-05-02 09:12:32', '2024-05-02 09:12:32'),
(20, 3, 4, 0, 1, 0, '2024-05-02 09:12:36', '2024-05-02 09:12:36'),
(21, 3, 5, 0, 1, 0, '2024-05-02 09:12:40', '2024-05-02 09:12:40'),
(22, 3, 6, 0, 1, 0, '2024-05-02 09:12:43', '2024-05-02 09:12:43'),
(23, 4, 1, 0, 1, 0, '2024-05-02 09:12:50', '2024-05-02 09:12:50'),
(24, 4, 3, 0, 1, 0, '2024-05-02 09:12:54', '2024-05-02 09:12:54'),
(25, 4, 4, 0, 1, 0, '2024-05-02 09:12:57', '2024-05-02 09:12:57'),
(26, 4, 5, 0, 1, 0, '2024-05-02 09:13:01', '2024-05-02 09:13:01'),
(27, 4, 6, 0, 1, 0, '2024-05-02 09:13:04', '2024-05-02 09:13:04'),
(28, 5, 1, 0, 1, 0, '2024-05-02 09:13:10', '2024-05-02 09:13:10'),
(29, 5, 3, 0, 1, 0, '2024-05-02 09:13:14', '2024-05-02 09:13:14'),
(30, 5, 4, 0, 1, 0, '2024-05-02 09:13:17', '2024-05-02 09:13:17'),
(31, 5, 5, 0, 1, 0, '2024-05-02 09:13:21', '2024-05-02 09:13:21'),
(32, 5, 6, 0, 1, 0, '2024-05-02 09:13:24', '2024-05-02 09:13:24');

-- --------------------------------------------------------

--
-- Table structure for table `noshows`
--

CREATE TABLE `noshows` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `number` smallint(5) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `points`
--

CREATE TABLE `points` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `rank` tinyint(3) UNSIGNED NOT NULL,
  `value` float UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `judge_id` tinyint(3) UNSIGNED NOT NULL,
  `criteria_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `value` float UNSIGNED NOT NULL DEFAULT 0,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `number` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `location` varchar(32) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `number`, `name`, `location`, `avatar`, `created_at`, `updated_at`) VALUES
(1, 1, 'Queen Hugo', 'Tinambac', 'queen-hugo.jpg', '2024-05-02 08:41:53', '2024-05-02 08:41:53'),
(2, 2, 'Neigel Corporal', 'San Francisco, Iriga City', 'neigel-corporal.jpg', '2024-05-02 08:41:53', '2024-05-02 08:41:53'),
(3, 3, 'Apple Romero', 'San Jose, Nabua', 'apple-romero.jpg', '2024-05-02 08:41:53', '2024-05-02 08:41:53'),
(4, 4, 'Kristine Hermosa', 'Sorsogon City', 'kristine-hermosa.jpg', '2024-05-02 08:41:53', '2024-05-02 08:41:53'),
(5, 5, 'Josel Ramirez', 'San Miguel, Nabua', 'josel-ramirez.jpg', '2024-05-02 08:41:53', '2024-05-02 08:41:53'),
(6, 6, 'Maria Carla Alcantara', 'Sorsogon City', 'maria-carla-alcantara.jpg', '2024-05-02 08:41:53', '2024-05-02 08:41:53'),
(7, 7, 'Winsy Pesebre', 'Lourdes Young, Nabua', 'winsy-pesebre.jpg', '2024-05-02 08:41:53', '2024-05-02 08:41:53'),
(8, 8, 'Elthon Bequio', 'Bacacay, Albay', 'elthon-bequio.jpg', '2024-05-02 08:41:53', '2024-05-02 08:41:53'),
(9, 9, 'Maria Cheska Deyn', 'Pilar, Sorsogon', 'maria-cheska-deyn.jpg', '2024-05-02 08:41:53', '2024-05-02 08:41:53'),
(10, 10, 'Gabrielle Caballero', 'San Isidro Pob., Nabua', 'gabrielle-caballero.jpg', '2024-05-02 08:41:53', '2024-05-02 08:41:53'),
(11, 11, 'Patricia Anne Carina', 'San Jose, Nabua', 'patricia-anne-carina.jpg', '2024-05-02 08:41:53', '2024-05-02 08:41:53'),
(12, 12, 'Shan Losabio', 'Duran, Balatan', 'shan-losabio.jpg', '2024-05-02 08:41:53', '2024-05-02 08:41:53'),
(13, 13, 'Arla', 'La Opinion, Nabua', 'arla.jpg', '2024-05-02 08:41:53', '2024-05-02 08:41:53'),
(14, 14, 'Mia Angela Rañosa', 'Oas, Albay', 'mia-angela-rañosa.jpg', '2024-05-02 08:41:53', '2024-05-02 08:41:53'),
(15, 15, 'Jill Orcine', 'Camaligan', 'jill-orcine.jpg', '2024-05-02 08:41:53', '2024-05-02 08:41:53'),
(16, 16, 'Rona Arevalo', 'Sto. Domingo, Nabua', 'rona-arevalo.jpg', '2024-05-02 08:41:53', '2024-05-02 08:41:53'),
(17, 17, 'Tiktik Morales', 'San Isidro Pob., Nabua', 'tiktik-morales.jpg', '2024-05-02 08:41:53', '2024-05-02 08:41:53'),
(18, 18, 'Solenne Heusaff', 'Bulan, Sorsogon', 'solenne-huesaff.jpg', '2024-05-02 08:41:53', '2024-05-02 08:41:53'),
(19, 19, 'Jewel Olivera', 'Guinobatan, Albay', 'jewel-olivera.jpg', '2024-05-02 08:41:53', '2024-05-02 08:41:53'),
(20, 20, 'Trixie Balbuena', 'Inapatan, Nabua', 'trixie-balbuena.jpg', '2024-05-02 08:41:53', '2024-05-02 08:41:53');

-- --------------------------------------------------------

--
-- Table structure for table `technicals`
--

CREATE TABLE `technicals` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `number` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active_portion` varchar(255) DEFAULT NULL,
  `called_at` timestamp NULL DEFAULT NULL,
  `pinged_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `technicals`
--

INSERT INTO `technicals` (`id`, `number`, `name`, `avatar`, `username`, `password`, `active_portion`, `called_at`, `pinged_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Technical 01', 'no-avatar.jpg', 'technical01', 'technical01', NULL, NULL, NULL, '2023-02-19 08:58:58', '2023-04-06 14:00:12');

-- --------------------------------------------------------

--
-- Table structure for table `technical_event`
--

CREATE TABLE `technical_event` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `technical_id` tinyint(3) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `active_team_id` tinyint(3) UNSIGNED NOT NULL,
  `has_active_team` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

CREATE TABLE `titles` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `rank` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `titles`
--

INSERT INTO `titles` (`id`, `event_id`, `rank`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Best in Production Number', '2024-05-02 09:16:10', '2024-05-02 09:17:18'),
(2, 2, 1, 'Best in Festival Attire', '2024-05-02 09:16:44', '2024-05-02 09:17:21'),
(3, 3, 1, 'Best in Swimsuit', '2024-05-02 09:17:49', '2024-05-02 09:17:49'),
(4, 4, 1, 'Best in Evening Gown', '2024-05-02 09:18:04', '2024-05-02 09:18:04'),
(10, 6, 1, 'Miss Gay Alinsangan 2024', '2024-05-02 09:20:24', '2024-05-02 09:20:24'),
(11, 6, 2, 'Miss Gay Bowa-Bowaan 2024', '2024-05-02 09:20:24', '2024-05-02 09:20:24'),
(12, 6, 3, '1st Runner Up', '2024-05-02 09:20:24', '2024-05-02 09:20:24'),
(13, 6, 4, '2nd Runner Up', '2024-05-02 09:20:24', '2024-05-02 09:20:24'),
(14, 6, 5, '3rd Runner Up', '2024-05-02 09:20:24', '2024-05-02 09:20:24'),
(15, 1, 2, '', '2024-05-02 09:23:30', '2024-05-02 09:23:30'),
(16, 1, 3, '', '2024-05-02 09:23:30', '2024-05-02 09:23:30'),
(17, 1, 4, '', '2024-05-02 09:23:30', '2024-05-02 09:23:30'),
(18, 1, 5, '', '2024-05-02 09:23:30', '2024-05-02 09:23:30'),
(19, 1, 6, '', '2024-05-02 09:23:30', '2024-05-02 09:23:30'),
(20, 1, 7, '', '2024-05-02 09:23:30', '2024-05-02 09:23:30'),
(21, 1, 8, '', '2024-05-02 09:23:30', '2024-05-02 09:23:30'),
(22, 1, 9, '', '2024-05-02 09:23:30', '2024-05-02 09:23:30'),
(23, 1, 10, '', '2024-05-02 09:23:30', '2024-05-02 09:23:30'),
(24, 1, 11, '', '2024-05-02 09:23:30', '2024-05-02 09:23:30'),
(25, 1, 12, '', '2024-05-02 09:23:30', '2024-05-02 09:23:30'),
(26, 1, 13, '', '2024-05-02 09:23:30', '2024-05-02 09:23:30'),
(27, 1, 14, '', '2024-05-02 09:23:30', '2024-05-02 09:23:30'),
(28, 1, 15, '', '2024-05-02 09:23:30', '2024-05-02 09:23:30'),
(29, 1, 16, '', '2024-05-02 09:23:30', '2024-05-02 09:23:30'),
(30, 1, 17, '', '2024-05-02 09:23:30', '2024-05-02 09:23:30'),
(31, 1, 18, '', '2024-05-02 09:23:30', '2024-05-02 09:23:30'),
(32, 1, 19, '', '2024-05-02 09:23:30', '2024-05-02 09:23:30'),
(33, 1, 20, '', '2024-05-02 09:23:30', '2024-05-02 09:23:30'),
(34, 2, 2, '', '2024-05-02 09:23:40', '2024-05-02 09:23:40'),
(35, 2, 3, '', '2024-05-02 09:23:40', '2024-05-02 09:23:40'),
(36, 2, 4, '', '2024-05-02 09:23:40', '2024-05-02 09:23:40'),
(37, 2, 5, '', '2024-05-02 09:23:40', '2024-05-02 09:23:40'),
(38, 2, 6, '', '2024-05-02 09:23:40', '2024-05-02 09:23:40'),
(39, 2, 7, '', '2024-05-02 09:23:40', '2024-05-02 09:23:40'),
(40, 2, 8, '', '2024-05-02 09:23:40', '2024-05-02 09:23:40'),
(41, 2, 9, '', '2024-05-02 09:23:40', '2024-05-02 09:23:40'),
(42, 2, 10, '', '2024-05-02 09:23:40', '2024-05-02 09:23:40'),
(43, 2, 11, '', '2024-05-02 09:23:40', '2024-05-02 09:23:40'),
(44, 2, 12, '', '2024-05-02 09:23:40', '2024-05-02 09:23:40'),
(45, 2, 13, '', '2024-05-02 09:23:40', '2024-05-02 09:23:40'),
(46, 2, 14, '', '2024-05-02 09:23:40', '2024-05-02 09:23:40'),
(47, 2, 15, '', '2024-05-02 09:23:40', '2024-05-02 09:23:40'),
(48, 2, 16, '', '2024-05-02 09:23:40', '2024-05-02 09:23:40'),
(49, 2, 17, '', '2024-05-02 09:23:40', '2024-05-02 09:23:40'),
(50, 2, 18, '', '2024-05-02 09:23:40', '2024-05-02 09:23:40'),
(51, 2, 19, '', '2024-05-02 09:23:40', '2024-05-02 09:23:40'),
(52, 2, 20, '', '2024-05-02 09:23:40', '2024-05-02 09:23:40'),
(53, 3, 2, '', '2024-05-02 09:23:53', '2024-05-02 09:23:53'),
(54, 3, 3, '', '2024-05-02 09:23:53', '2024-05-02 09:23:53'),
(55, 3, 4, '', '2024-05-02 09:23:53', '2024-05-02 09:23:53'),
(56, 3, 5, '', '2024-05-02 09:23:53', '2024-05-02 09:23:53'),
(57, 3, 6, '', '2024-05-02 09:23:53', '2024-05-02 09:23:53'),
(58, 3, 7, '', '2024-05-02 09:23:53', '2024-05-02 09:23:53'),
(59, 3, 8, '', '2024-05-02 09:23:53', '2024-05-02 09:23:53'),
(60, 3, 9, '', '2024-05-02 09:23:53', '2024-05-02 09:23:53'),
(61, 3, 10, '', '2024-05-02 09:23:53', '2024-05-02 09:23:53'),
(62, 3, 11, '', '2024-05-02 09:23:54', '2024-05-02 09:23:54'),
(63, 3, 12, '', '2024-05-02 09:23:54', '2024-05-02 09:23:54'),
(64, 3, 13, '', '2024-05-02 09:23:54', '2024-05-02 09:23:54'),
(65, 3, 14, '', '2024-05-02 09:23:54', '2024-05-02 09:23:54'),
(66, 3, 15, '', '2024-05-02 09:23:54', '2024-05-02 09:23:54'),
(67, 3, 16, '', '2024-05-02 09:23:54', '2024-05-02 09:23:54'),
(68, 3, 17, '', '2024-05-02 09:23:54', '2024-05-02 09:23:54'),
(69, 3, 18, '', '2024-05-02 09:23:54', '2024-05-02 09:23:54'),
(70, 3, 19, '', '2024-05-02 09:23:54', '2024-05-02 09:23:54'),
(71, 3, 20, '', '2024-05-02 09:23:54', '2024-05-02 09:23:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `arrangements`
--
ALTER TABLE `arrangements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `competition_id` (`competition_id`);

--
-- Indexes for table `competitions`
--
ALTER TABLE `competitions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `criteria`
--
ALTER TABLE `criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `deductions`
--
ALTER TABLE `deductions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judge_id` (`technical_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `eliminations`
--
ALTER TABLE `eliminations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `area_id` (`category_id`);

--
-- Indexes for table `judges`
--
ALTER TABLE `judges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `judge_event`
--
ALTER TABLE `judge_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judge_id` (`judge_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `active_team_id` (`active_team_id`);

--
-- Indexes for table `noshows`
--
ALTER TABLE `noshows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judge_id` (`judge_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `criteria_id` (`criteria_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `technicals`
--
ALTER TABLE `technicals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `technical_event`
--
ALTER TABLE `technical_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judge_id` (`technical_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `active_team_id` (`active_team_id`);

--
-- Indexes for table `titles`
--
ALTER TABLE `titles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `arrangements`
--
ALTER TABLE `arrangements`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `competitions`
--
ALTER TABLE `competitions`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `criteria`
--
ALTER TABLE `criteria`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `deductions`
--
ALTER TABLE `deductions`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eliminations`
--
ALTER TABLE `eliminations`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `judges`
--
ALTER TABLE `judges`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `judge_event`
--
ALTER TABLE `judge_event`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `noshows`
--
ALTER TABLE `noshows`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `points`
--
ALTER TABLE `points`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `technicals`
--
ALTER TABLE `technicals`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `technical_event`
--
ALTER TABLE `technical_event`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `titles`
--
ALTER TABLE `titles`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `arrangements`
--
ALTER TABLE `arrangements`
  ADD CONSTRAINT `arrangements_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `arrangements_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `criteria`
--
ALTER TABLE `criteria`
  ADD CONSTRAINT `criteria_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `deductions`
--
ALTER TABLE `deductions`
  ADD CONSTRAINT `deductions_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deductions_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deductions_ibfk_3` FOREIGN KEY (`technical_id`) REFERENCES `technicals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eliminations`
--
ALTER TABLE `eliminations`
  ADD CONSTRAINT `eliminations_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `eliminations_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `judge_event`
--
ALTER TABLE `judge_event`
  ADD CONSTRAINT `judge_event_ibfk_1` FOREIGN KEY (`judge_id`) REFERENCES `judges` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `judge_event_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `judge_event_ibfk_3` FOREIGN KEY (`active_team_id`) REFERENCES `teams` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `noshows`
--
ALTER TABLE `noshows`
  ADD CONSTRAINT `noshows_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `noshows_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `participants`
--
ALTER TABLE `participants`
  ADD CONSTRAINT `participants_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participants_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `points`
--
ALTER TABLE `points`
  ADD CONSTRAINT `points_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`criteria_id`) REFERENCES `criteria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_3` FOREIGN KEY (`judge_id`) REFERENCES `judges` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `technical_event`
--
ALTER TABLE `technical_event`
  ADD CONSTRAINT `technical_event_ibfk_2` FOREIGN KEY (`technical_id`) REFERENCES `technicals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `technical_event_ibfk_3` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `technical_event_ibfk_4` FOREIGN KEY (`active_team_id`) REFERENCES `teams` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `titles`
--
ALTER TABLE `titles`
  ADD CONSTRAINT `titles_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
