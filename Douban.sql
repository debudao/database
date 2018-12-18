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

 Date: 18/12/2018 21:06:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Actor
-- ----------------------------
DROP TABLE IF EXISTS `Actor`;
CREATE TABLE `Actor` (
  `aid` int(10) NOT NULL,
  `aname` varchar(20) NOT NULL,
  `asex` char(1) DEFAULT NULL,
  `aBirthday` date DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for ActorMovie
-- ----------------------------
DROP TABLE IF EXISTS `ActorMovie`;
CREATE TABLE `ActorMovie` (
  `mid` int(10) NOT NULL,
  `aid` int(10) NOT NULL,
  PRIMARY KEY (`mid`,`aid`),
  KEY `aid` (`aid`),
  CONSTRAINT `actormovie_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `movie` (`mid`),
  CONSTRAINT `actormovie_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `actor` (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for Comment
-- ----------------------------
DROP TABLE IF EXISTS `Comment`;
CREATE TABLE `Comment` (
  `cid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `score` int(2) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `commentDate` date DEFAULT NULL,
  `usefulNumber` int(10) DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  KEY `uid` (`uid`),
  KEY `mid` (`mid`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`mid`) REFERENCES `movie` (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for Director
-- ----------------------------
DROP TABLE IF EXISTS `Director`;
CREATE TABLE `Director` (
  `directorid` int(10) NOT NULL,
  `directorname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`directorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for DirectorMovie
-- ----------------------------
DROP TABLE IF EXISTS `DirectorMovie`;
CREATE TABLE `DirectorMovie` (
  `mid` int(10) NOT NULL,
  `directorid` int(10) NOT NULL,
  PRIMARY KEY (`mid`,`directorid`),
  KEY `directorid` (`directorid`),
  CONSTRAINT `directormovie_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `movie` (`mid`),
  CONSTRAINT `directormovie_ibfk_2` FOREIGN KEY (`directorid`) REFERENCES `director` (`directorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for Movie
-- ----------------------------
DROP TABLE IF EXISTS `Movie`;
CREATE TABLE `Movie` (
  `mid` int(10) NOT NULL AUTO_INCREMENT,
  `mname` varchar(30) DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '电影类型',
  `area` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '地区/国家',
  `mscore` float(2,1) DEFAULT NULL COMMENT '电影评分',
  `alias` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '别名',
  `intro` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '简介',
  `imdbUrl` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'imdb链接',
  `language` varchar(20) DEFAULT NULL,
  `releaseDate` date DEFAULT NULL COMMENT '上映日期',
  `duration` int(4) DEFAULT NULL COMMENT '电影时长',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for Playwright
-- ----------------------------
DROP TABLE IF EXISTS `Playwright`;
CREATE TABLE `Playwright` (
  `playwrightid` int(10) NOT NULL,
  `playwrightname` varchar(30) NOT NULL,
  PRIMARY KEY (`playwrightid`,`playwrightname`),
  KEY `playwrightid` (`playwrightid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for PlaywrightMovie
-- ----------------------------
DROP TABLE IF EXISTS `PlaywrightMovie`;
CREATE TABLE `PlaywrightMovie` (
  `mid` int(10) NOT NULL,
  `playwrightid` int(10) NOT NULL,
  PRIMARY KEY (`mid`,`playwrightid`),
  KEY `playwrightid` (`playwrightid`),
  CONSTRAINT `playwrightmovie_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `movie` (`mid`),
  CONSTRAINT `playwrightmovie_ibfk_2` FOREIGN KEY (`playwrightid`) REFERENCES `playwright` (`playwrightid`)
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
