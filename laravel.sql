-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 08, 2019 at 06:30 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `films`
--

DROP TABLE IF EXISTS `films`;
CREATE TABLE IF NOT EXISTS `films` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `release_date` date NOT NULL,
  `rating` int(11) NOT NULL,
  `ticket_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genre` json DEFAULT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `films`
--

INSERT INTO `films` (`id`, `name`, `description`, `release_date`, `rating`, `ticket_price`, `country`, `genre`, `photo`, `created_at`, `updated_at`) VALUES
(7, 'Zero', 'A bollywood film.', '2018-07-05', 2, '250', 'India', '\"{\\\"genres\\\":[\\\"Romance\\\",\\\"Drama\\\"]}\"', 'test', '2019-02-08 11:39:51', '2019-02-08 11:39:51'),
(13, 'KGF', 'A Indian film.', '2018-07-05', 4, '250', 'India', '\"{\\\"genres\\\":[\\\"Action\\\",\\\"Drama\\\"]}\"', 'test', '2019-02-08 12:08:07', '2019-02-08 12:08:07');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_02_08_142820_films', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('2f4ee5d86ab9655363c998b93f17506a81ba6d5cd920bcd64f861a214fd9d119143af2ee9f468ea8', 7, 1, 'MyApp', '[]', 0, '2019-02-08 09:52:00', '2019-02-08 09:52:00', '2020-02-08 15:52:00'),
('6528746804a42e72d067b51dd2100575ea062fd590b3163d07afcafd24f54e45e618cb04c7a26e9e', 7, 2, NULL, '[]', 0, '2019-02-08 10:21:28', '2019-02-08 10:21:28', '2020-02-08 16:21:28');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'OzKRyGmFb8iYjTQ5xMu6R2j5unEEy2WuwbyF2Qeu', 'http://localhost', 1, 0, 0, '2019-02-08 07:24:31', '2019-02-08 07:24:31'),
(2, NULL, 'Laravel Password Grant Client', 'wyH7FV0VoaYeawC84ROVE5EXGrtcJzJIGZSD19AU', 'http://localhost', 0, 1, 0, '2019-02-08 07:24:31', '2019-02-08 07:24:31');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-02-08 07:24:31', '2019-02-08 07:24:31');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('ac6f59515d9bc27cddeb9e3c4d30cd2b6105e7fadec9883ab6edea2a56b468a72df1166424732413', '6528746804a42e72d067b51dd2100575ea062fd590b3163d07afcafd24f54e45e618cb04c7a26e9e', 0, '2020-02-08 16:21:28');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '6fxIj8z7', 'LSawFvi9amS5@mail.com', '$2y$10$s2hLH8AwoN5MfRMLKIZ.COIr6wzvIevPV5JqZuZkBeJckkBtli4k2', NULL, '2019-02-08 09:44:29', '2019-02-08 09:44:29'),
(2, 'im5uL4NP', '6r1hDKW6jMB0@mail.com', '$2y$10$GTaYmbVLy6NjGbC8ZROafOgaxRAGUa2RTtni1A9keiGROLSmgwiZm', NULL, '2019-02-08 09:44:29', '2019-02-08 09:44:29'),
(3, 'D1YTRl92', 'suzdtO7a21MI@mail.com', '$2y$10$0Pk7bzjM6VNFdu6I4ICtQ.v8W0QEcdMrarPtsdLEVCqojFu4fFkPq', NULL, '2019-02-08 09:44:29', '2019-02-08 09:44:29'),
(4, 'MbxzS6qI', 'CP96uECUjIbN@mail.com', '$2y$10$9OWiHqSXGYqM8Mkk1XOvAuCL0SlM9oCKcX9wJ9q2z4nm0ZCtvcHji', NULL, '2019-02-08 09:44:36', '2019-02-08 09:44:36'),
(5, 'tqXMS3un', 'WgQMVuTxhpTW@mail.com', '$2y$10$MRP5nA3JyWdtHc8aJib1M.iQKJUtMl8z1fT5yQZPGN.Hkpo0ws/0G', NULL, '2019-02-08 09:44:37', '2019-02-08 09:44:37'),
(6, '1hrNowHh', 'g4Jlkh6HGVZw@mail.com', '$2y$10$uOMfWJHJ8TfUBShSOgqxz.r24tCXB.aYycygn2oADdTrqwuerJ1SK', NULL, '2019-02-08 09:44:37', '2019-02-08 09:44:37'),
(7, 'Saqlain', 'abc@gmail.com', '$2y$10$D9YWDBlIVAhEdYvu.mrkjeH9G39a5hDDY29dNcwqqN1btMYn9QklS', NULL, '2019-02-08 09:52:00', '2019-02-08 09:52:00'),
(8, 'nSN9vMmH', 'NbgexPA4vHT0@mail.com', '$2y$10$JTjF6tQtQZLmHVWhbWmEC.rdeAOLh6t7EG0QlDZ24TVFbAP94qzlW', NULL, '2019-02-08 12:19:19', '2019-02-08 12:19:19'),
(9, '0y1QqBjq', 'TbM70DzPedM6@mail.com', '$2y$10$VpEG3QFzPJFJeK3mxtLdMuZ2vIbsvixysW55NYJNXSSdreBaGV2pW', NULL, '2019-02-08 12:20:18', '2019-02-08 12:20:18'),
(10, '9hIe60Sd', 'rd4FqUwOtPrP@mail.com', '$2y$10$VyF5CkQ4ay9gJGf67FVx/eMdtcA6Zo1l/8ywyfCeqKTq0ikx8r6My', NULL, '2019-02-08 12:20:56', '2019-02-08 12:20:56');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
