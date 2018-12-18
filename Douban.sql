/*
 Navicat Premium Data Transfer

 Source Server         : sql1
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : Douban

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 18/12/2018 14:06:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Comment
-- ----------------------------
DROP TABLE IF EXISTS `Comment`;
CREATE TABLE `Comment` (
  `uid` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `score` int(2) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `commentDate` datetime DEFAULT NULL,
  `usefulNumber` int(10) DEFAULT NULL,
  PRIMARY KEY (`uid`,`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for Movie
-- ----------------------------
DROP TABLE IF EXISTS `Movie`;
CREATE TABLE `Movie` (
  `mid` int(10) NOT NULL AUTO_INCREMENT,
  `mname` varchar(30) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `mainActors` varchar(80) DEFAULT NULL,
  `area` varchar(20) DEFAULT NULL,
  `director` varchar(20) DEFAULT NULL,
  `mscore` float(2,1) DEFAULT NULL,
  ` alias` varchar(30) DEFAULT NULL,
  `intro` text,
  `allActors` varchar(255) DEFAULT NULL,
  `allStaff` varchar(255) DEFAULT NULL,
  `imdbUrl` varchar(50) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `releaseDate` datetime DEFAULT NULL,
  `duration` int(4) DEFAULT NULL,
  `palywright` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for Tag
-- ----------------------------
DROP TABLE IF EXISTS `Tag`;
CREATE TABLE `Tag` (
  `mid` int(10) NOT NULL,
  `tagname` varchar(80) NOT NULL,
  PRIMARY KEY (`mid`,`tagname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for User
-- ----------------------------
DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
  `uid` int(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `uname` varchar(30) NOT NULL,
  `phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SET FOREIGN_KEY_CHECKS = 1;
