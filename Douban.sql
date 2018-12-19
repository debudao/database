/*
 Navicat MySQL Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : doubanban

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 19/12/2018 16:00:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for actor
-- ----------------------------
DROP TABLE IF EXISTS `actor`;
CREATE TABLE `actor`  (
  `aid` int(10) NOT NULL AUTO_INCREMENT,
  `aname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `asex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `aBirthday` date NULL DEFAULT NULL,
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of actor
-- ----------------------------
INSERT INTO `actor` VALUES (1, '徐峥', '男', '1978-04-18');
INSERT INTO `actor` VALUES (2, '彭于晏', '男', '1982-03-24');
INSERT INTO `actor` VALUES (3, '周迅', '女', '1975-06-11');
INSERT INTO `actor` VALUES (4, '王千源', '男', '1969-02-05');
INSERT INTO `actor` VALUES (5, '刘亦菲', '女', '1989-06-07');
INSERT INTO `actor` VALUES (6, '章子怡', '女', '1970-10-21');
INSERT INTO `actor` VALUES (7, '吴刚', '男', '1969-06-12');
INSERT INTO `actor` VALUES (8, '阿米尔汗', '男', '1969-06-12');
INSERT INTO `actor` VALUES (9, '约翰尼德普', '男', '1976-10-28');
INSERT INTO `actor` VALUES (10, '斯嘉丽约翰逊', '女', '1984-06-13');
INSERT INTO `actor` VALUES (11, '布拉德皮特', '男', '1985-07-24');

-- ----------------------------
-- Table structure for actormovie
-- ----------------------------
DROP TABLE IF EXISTS `actormovie`;
CREATE TABLE `actormovie`  (
  `mid` int(10) NOT NULL,
  `aid` int(10) NOT NULL,
  PRIMARY KEY (`mid`, `aid`) USING BTREE,
  INDEX `aid`(`aid`) USING BTREE,
  CONSTRAINT `actormovie_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `movie` (`mid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `actormovie_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `actor` (`aid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `uid` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `score` int(2) NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `commentDate` date NULL DEFAULT NULL,
  `usefulNumber` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`uid`, `mid`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`mid`) REFERENCES `movie` (`mid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for director
-- ----------------------------
DROP TABLE IF EXISTS `director`;
CREATE TABLE `director`  (
  `directorid` int(10) NOT NULL,
  `directorname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`directorid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for directormovie
-- ----------------------------
DROP TABLE IF EXISTS `directormovie`;
CREATE TABLE `directormovie`  (
  `mid` int(10) NOT NULL,
  `directorid` int(10) NOT NULL,
  PRIMARY KEY (`mid`, `directorid`) USING BTREE,
  INDEX `directorid`(`directorid`) USING BTREE,
  CONSTRAINT `directormovie_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `movie` (`mid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `directormovie_ibfk_2` FOREIGN KEY (`directorid`) REFERENCES `director` (`directorid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie`  (
  `mid` int(10) NOT NULL AUTO_INCREMENT,
  `mname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电影类型',
  `area` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地区/国家',
  `alias` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '别名',
  `intro` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '简介',
  `imdbUrl` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'imdb链接',
  `language` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `releaseDate` date NULL DEFAULT NULL COMMENT '上映日期',
  `duration` int(4) NULL DEFAULT NULL COMMENT '电影时长',
  PRIMARY KEY (`mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for playwright
-- ----------------------------
DROP TABLE IF EXISTS `playwright`;
CREATE TABLE `playwright`  (
  `playwrightid` int(10) NOT NULL,
  `playwrightname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`playwrightid`) USING BTREE,
  INDEX `playwrightid`(`playwrightid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for playwrightmovie
-- ----------------------------
DROP TABLE IF EXISTS `playwrightmovie`;
CREATE TABLE `playwrightmovie`  (
  `mid` int(10) NOT NULL,
  `playwrightid` int(10) NOT NULL,
  PRIMARY KEY (`mid`, `playwrightid`) USING BTREE,
  INDEX `playwrightid`(`playwrightid`) USING BTREE,
  CONSTRAINT `playwrightmovie_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `movie` (`mid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `playwrightmovie_ibfk_2` FOREIGN KEY (`playwrightid`) REFERENCES `playwright` (`playwrightid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `mid` int(10) NOT NULL,
  `tagname` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`mid`, `tagname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(10) NOT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `uname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
