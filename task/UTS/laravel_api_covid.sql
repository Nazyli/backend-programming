/*
 Navicat Premium Data Transfer

 Source Server         : Local MYSQL DB
 Source Server Type    : MySQL
 Source Server Version : 100418
 Source Host           : 127.0.0.1:3306
 Source Schema         : laravel_api_covid

 Target Server Type    : MySQL
 Target Server Version : 100418
 File Encoding         : 65001

 Date: 19/11/2021 20:23:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2021_11_15_133519_create_statuses_table', 1);
INSERT INTO `migrations` VALUES (6, '2021_11_15_133617_create_patients_table', 1);
COMMIT;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for patients
-- ----------------------------
DROP TABLE IF EXISTS `patients`;
CREATE TABLE `patients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL,
  `in_date_at` date DEFAULT NULL,
  `out_date_at` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patients_status_id_foreign` (`status_id`),
  CONSTRAINT `patients_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of patients
-- ----------------------------
BEGIN;
INSERT INTO `patients` VALUES (1, 'Jenifer Lockman', '972-429-6471', '51157 Nella Well Suite 802\nKleinview, MO 06635', 2, '2021-08-06', '2021-11-19', '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (2, 'Kieran Steuber DDS', '+1 (862) 310-8833', '74346 Paolo Rapids Apt. 481\nEast Matildaside, PA 57106', 2, '2021-10-31', NULL, '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (3, 'Cassandra Koelpin', '+16088880823', '8122 Bailey Valleys Suite 754\nViolaburgh, IL 98209-0944', 1, '2021-08-04', '2021-11-19', '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (4, 'Mr. Kirk Hane Jr.', '+1-847-613-9469', '12467 Altenwerth Fork Suite 406\nNorth Kamryntown, KY 35297', 2, '2020-12-20', '2021-11-19', '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (5, 'Bernice Nader', '1-954-378-7560', '926 McDermott Key\nEmilianoberg, LA 78881', 3, '2021-09-23', NULL, '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (6, 'Dr. Myrl VonRueden MD', '(743) 456-8359', '8573 Pouros Stravenue\nArmstronghaven, MS 59961-1778', 3, '2021-11-02', '2021-11-19', '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (7, 'Mr. London Legros MD', '+1.201.212.0588', '960 Asia Courts\nNorth Edgardoburgh, ME 91074', 2, '2021-01-22', '2021-11-19', '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (8, 'Miss Phyllis Schoen I', '+1 (678) 797-2432', '629 Hassie Lodge Suite 902\nAlfredburgh, WV 37768', 3, '2021-01-14', '2021-11-19', '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (9, 'Grover Fadel', '(973) 746-3256', '65245 Janice Roads Apt. 501\nWest Santina, AL 88883-1083', 3, '2021-01-08', NULL, '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (10, 'Bertrand D\'Amore', '769.420.4838', '23797 Mante Lakes Apt. 535\nLake Sheaville, WA 19960-4765', 2, '2021-07-07', NULL, '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (11, 'Mrs. Susan Ryan III', '1-215-946-5210', '391 Zackary Ports Apt. 492\nShawnashire, NJ 16748', 1, '2020-12-04', '2021-11-19', '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (12, 'Brannon Smith', '475-404-6004', '35880 Leuschke Points Suite 269\nBlazeland, VT 78740', 1, '2021-03-04', NULL, '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (13, 'Zoie Nader II', '+1-775-672-5458', '41301 Emmerich Mews Suite 479\nRetaview, IN 24946-0627', 2, '2021-03-27', NULL, '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (14, 'Ms. Tianna Breitenberg', '+1-276-857-7854', '4069 Simone Route Suite 045\nBalistrerifurt, NM 05257', 2, '2021-04-09', '2021-11-19', '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (15, 'Taylor Kub', '+1-445-907-8649', '1317 Rice Square Suite 537\nNew Alexystown, CT 91519', 2, '2021-10-08', NULL, '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (16, 'Karolann Kohler', '(717) 305-3652', '694 Keegan Circles\nStehrton, MT 15664-1551', 1, '2021-08-13', '2021-11-19', '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (17, 'Kamren Daniel', '1-218-651-4180', '760 Rene Mews\nSauermouth, KS 42075-9623', 1, '2021-03-13', '2021-11-19', '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (18, 'Keeley Auer', '980-627-4334', '63309 Prohaska Viaduct Apt. 051\nNew Maurice, OK 97600-0869', 1, '2021-06-01', NULL, '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (19, 'Aiyana Steuber', '1-813-370-0189', '5321 Marion Flats\nRubiehaven, GA 59510-8130', 2, '2021-05-14', NULL, '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (20, 'Precious Hartmann', '(662) 305-3308', '32328 Deckow Terrace\nDellabury, SD 20557-9797', 2, '2021-01-03', '2021-11-19', '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (21, 'Roberta Sporer', '703-399-5374', '86784 Maci Wall\nNorth Marjolainebury, WI 02881-1357', 1, '2021-10-30', '2021-11-19', '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (22, 'Gail Skiles', '(820) 973-2651', '63769 Wilson Village\nSouth Elinor, MO 41450', 3, '2020-12-07', NULL, '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (23, 'Prof. Dallin Fay Jr.', '952-245-0418', '910 Lemke Ford\nJakubowskiville, NY 42696', 1, '2021-02-20', '2021-11-19', '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (24, 'Lukas Morissette', '+15208748239', '818 Destany Mountain\nLake Name, MI 06717-6280', 3, '2021-03-26', NULL, '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (25, 'Isabel Pacocha', '1-732-979-2808', '5883 Ludwig Key Suite 673\nLake Lonzo, MN 55867-0407', 1, '2021-10-13', NULL, '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (26, 'Cornelius Waelchi III', '283-570-2001', '840 Russel Village Suite 612\nEast Zoie, WY 32830', 1, '2021-11-16', NULL, '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (27, 'Jody Eichmann', '(650) 595-8533', '27332 Block Crescent\nEast Alenemouth, AZ 25094', 2, '2020-12-25', NULL, '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (28, 'Prof. Zack Steuber V', '(408) 984-1638', '2378 Macejkovic Dam Apt. 759\nLake Moisesborough, OK 20947', 3, '2021-04-01', NULL, '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (29, 'Aaliyah Ratke', '828-744-6496', '3353 Blick Walk Apt. 309\nWest Daveton, AR 19711', 2, '2021-02-04', '2021-11-19', '2021-11-19 11:57:46', '2021-11-19 11:57:46');
INSERT INTO `patients` VALUES (30, 'Krystel Wintheiser', '+1-463-458-2355', '903 Enrique Drive\nMoseport, CA 58058-3511', 3, '2020-12-20', NULL, '2021-11-19 11:57:46', '2021-11-19 11:57:46');
COMMIT;

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
BEGIN;
INSERT INTO `personal_access_tokens` VALUES (1, 'App\\Models\\User', 1, 'auth_token', '9d8262c5430d72f7f82e472ebd5f41c09cd0ba4ae886fb36409974535a92a3e1', '[\"*\"]', '2021-11-19 13:17:18', '2021-11-19 12:09:36', '2021-11-19 13:17:18');
INSERT INTO `personal_access_tokens` VALUES (2, 'App\\Models\\User', 2, 'auth_token', 'f5ea6a1758ba5fbb4f0b267a41c99c2c751d1b6d972760feccc91e02ae219fa9', '[\"*\"]', '2021-11-19 13:20:53', '2021-11-19 13:20:41', '2021-11-19 13:20:53');
COMMIT;

-- ----------------------------
-- Table structure for statuses
-- ----------------------------
DROP TABLE IF EXISTS `statuses`;
CREATE TABLE `statuses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of statuses
-- ----------------------------
BEGIN;
INSERT INTO `statuses` VALUES (1, 'POSITIVE', NULL, NULL);
INSERT INTO `statuses` VALUES (2, 'RECOVERED', NULL, NULL);
INSERT INTO `statuses` VALUES (3, 'DEAD', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (2, 'admin', 'admin@gmail.com', NULL, '$2y$10$DVHZZyEedBC9YixNNGFNKewdFYuGNzSkT9N5PLdcCwgngXQB0uTiu', NULL, '2021-11-19 13:20:19', '2021-11-19 13:20:19');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
