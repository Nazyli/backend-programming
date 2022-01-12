/*
 Navicat Premium Data Transfer

 Source Server         : Local MYSQL DB
 Source Server Type    : MySQL
 Source Server Version : 100418
 Source Host           : 127.0.0.1:3306
 Source Schema         : express_api_covid

 Target Server Type    : MySQL
 Target Server Version : 100418
 File Encoding         : 65001

 Date: 12/01/2022 08:14:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Patients
-- ----------------------------
DROP TABLE IF EXISTS `Patients`;
CREATE TABLE `Patients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `in_date_at` datetime DEFAULT NULL,
  `out_date_at` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of Patients
-- ----------------------------
BEGIN;
INSERT INTO `Patients` VALUES (1, 'Evry Nazyli Ciptanto', '+6285735906111', 'Jakarta', 2, '2022-01-10 00:00:00', '2022-01-12 00:00:00', '2022-01-12 00:03:04', '2022-01-12 00:05:14');
INSERT INTO `Patients` VALUES (2, 'Lintang Rahmawati', '+628500080247', 'Palembang', 1, '2022-01-01 00:00:00', NULL, '2022-01-12 00:08:11', '2022-01-12 00:08:11');
INSERT INTO `Patients` VALUES (3, 'Wahyu Utama', '+628192837826', 'Yogyakarta', 3, '2022-01-07 00:00:00', '2022-01-09 00:00:00', '2022-01-12 00:08:46', '2022-01-12 00:08:46');
INSERT INTO `Patients` VALUES (4, 'Wani Kuswandari', '+6281987797451', 'Sumatra Barat', 2, '2022-01-02 00:00:00', '2022-01-01 00:00:00', '2022-01-12 00:09:28', '2022-01-12 00:09:28');
INSERT INTO `Patients` VALUES (5, 'Bala Kusumo', '+6285876645782', 'Bali', 2, '2022-01-03 00:00:00', '2022-01-05 00:00:00', '2022-01-12 00:10:09', '2022-01-12 00:10:09');
INSERT INTO `Patients` VALUES (6, 'Daniswara Hutasoit', '+6285982748981', 'Lampung', 3, '2022-01-03 00:00:00', '2022-01-06 00:00:00', '2022-01-12 00:10:27', '2022-01-12 00:10:27');
INSERT INTO `Patients` VALUES (7, 'Cemeti Simanjuntak', '+6285873987598', 'Aceh', 1, '2022-01-08 00:00:00', NULL, '2022-01-12 00:10:47', '2022-01-12 00:10:47');
INSERT INTO `Patients` VALUES (8, 'Halima Melani', '+6285132456738', 'Bandung', 1, '2022-01-06 00:00:00', NULL, '2022-01-12 00:10:57', '2022-01-12 00:10:57');
INSERT INTO `Patients` VALUES (9, 'Gading Wijaya', '+6285998765782', 'Jakarta', 2, '2022-01-01 00:00:00', '2022-01-11 00:00:00', '2022-01-12 00:11:21', '2022-01-12 00:11:21');
INSERT INTO `Patients` VALUES (10, 'Usyi Ulva Kusmawati', '+6285999876324', 'Jakarta', 1, '2022-01-05 00:00:00', NULL, '2022-01-12 00:11:31', '2022-01-12 00:11:31');
INSERT INTO `Patients` VALUES (11, 'Ciaobella Yolanda', '+6285735687261', 'Jawa Timur', 3, '2022-01-05 00:00:00', '2022-01-07 00:00:00', '2022-01-12 00:11:57', '2022-01-12 00:11:57');
INSERT INTO `Patients` VALUES (12, 'Jane Maryati', '+6285837189321', 'Bengkulu', 1, '2022-01-11 00:00:00', NULL, '2022-01-12 00:12:16', '2022-01-12 00:12:16');
COMMIT;

-- ----------------------------
-- Table structure for SequelizeMeta
-- ----------------------------
DROP TABLE IF EXISTS `SequelizeMeta`;
CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of SequelizeMeta
-- ----------------------------
BEGIN;
INSERT INTO `SequelizeMeta` VALUES ('20220111000402-create-status.js');
INSERT INTO `SequelizeMeta` VALUES ('20220111001245-create-patients.js');
INSERT INTO `SequelizeMeta` VALUES ('20220111002535-create-users.js');
COMMIT;

-- ----------------------------
-- Table structure for Statuses
-- ----------------------------
DROP TABLE IF EXISTS `Statuses`;
CREATE TABLE `Statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of Statuses
-- ----------------------------
BEGIN;
INSERT INTO `Statuses` VALUES (1, 'POSITIVE', '2022-01-12 00:24:48', '2022-01-12 00:24:48');
INSERT INTO `Statuses` VALUES (2, 'RECOVERED', '2022-01-12 00:24:48', '2022-01-12 00:24:48');
INSERT INTO `Statuses` VALUES (3, 'DEAD', '2022-01-12 00:24:48', '2022-01-12 00:24:48');
COMMIT;

-- ----------------------------
-- Table structure for Users
-- ----------------------------
DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of Users
-- ----------------------------
BEGIN;
INSERT INTO `Users` VALUES (1, 'Evry Nazyli Ciptanto', 'admin@gmail.com', '$2a$08$0Bn/9n6rkEMtiRe.14ZST.36wI5nLumhLCWNPlteVmomLsi79DYou', '2022-01-12 00:24:48', '2022-01-12 00:24:48');
INSERT INTO `Users` VALUES (2, 'user', 'user@gmail.com', '$2a$08$vbxFzKUFE177HwlqyalQnOpO5j/deBf0..kHWcsgRWUbTHsxB90UW', '2022-01-12 00:56:11', '2022-01-12 00:56:11');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
