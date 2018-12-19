/*
 Navicat Premium Data Transfer

 Source Server         : sql1
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : Douban2

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 19/12/2018 20:18:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for actor
-- ----------------------------
DROP TABLE IF EXISTS `actor`;
CREATE TABLE `actor` (
  `aid` int(10) NOT NULL AUTO_INCREMENT,
  `aname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `asex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `aBirthday` date DEFAULT NULL,
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of actor
-- ----------------------------
BEGIN;
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
COMMIT;

-- ----------------------------
-- Table structure for actormovie
-- ----------------------------
DROP TABLE IF EXISTS `actormovie`;
CREATE TABLE `actormovie` (
  `mid` int(10) NOT NULL,
  `aid` int(10) NOT NULL,
  PRIMARY KEY (`mid`,`aid`) USING BTREE,
  KEY `aid` (`aid`) USING BTREE,
  CONSTRAINT `actormovie_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `movie` (`mid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `actormovie_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `actor` (`aid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of actormovie
-- ----------------------------
BEGIN;
INSERT INTO `actormovie` VALUES (1, 1);
INSERT INTO `actormovie` VALUES (5, 2);
INSERT INTO `actormovie` VALUES (6, 3);
INSERT INTO `actormovie` VALUES (3, 4);
INSERT INTO `actormovie` VALUES (4, 5);
INSERT INTO `actormovie` VALUES (2, 6);
INSERT INTO `actormovie` VALUES (9, 7);
INSERT INTO `actormovie` VALUES (10, 8);
INSERT INTO `actormovie` VALUES (7, 9);
INSERT INTO `actormovie` VALUES (11, 10);
INSERT INTO `actormovie` VALUES (8, 11);
COMMIT;

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `areaid` int(10) NOT NULL,
  `areaname` varchar(30) NOT NULL,
  PRIMARY KEY (`areaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for areamovie
-- ----------------------------
DROP TABLE IF EXISTS `areamovie`;
CREATE TABLE `areamovie` (
  `mid` int(10) NOT NULL,
  `areaid` int(10) NOT NULL,
  PRIMARY KEY (`mid`,`areaid`),
  KEY `areamovie_ibfk_2` (`areaid`),
  CONSTRAINT `areamovie_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `movie` (`mid`) ON UPDATE RESTRICT,
  CONSTRAINT `areamovie_ibfk_2` FOREIGN KEY (`areaid`) REFERENCES `area` (`areaid`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `uid` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `score` int(2) NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `commentDate` date DEFAULT NULL,
  `usefulNumber` int(10) DEFAULT NULL,
  PRIMARY KEY (`uid`,`mid`) USING BTREE,
  KEY `mid` (`mid`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`mid`) REFERENCES `movie` (`mid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for director
-- ----------------------------
DROP TABLE IF EXISTS `director`;
CREATE TABLE `director` (
  `directorid` int(10) NOT NULL AUTO_INCREMENT,
  `directorname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`directorid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of director
-- ----------------------------
BEGIN;
INSERT INTO `director` VALUES (1, '克里斯托弗·诺兰');
INSERT INTO `director` VALUES (2, '徐峥');
INSERT INTO `director` VALUES (4, '张艺谋');
INSERT INTO `director` VALUES (5, '姜文');
INSERT INTO `director` VALUES (6, '吴京');
INSERT INTO `director` VALUES (7, '李芳芳');
INSERT INTO `director` VALUES (8, '戈尔·维宾斯基');
INSERT INTO `director` VALUES (9, '爱德华·兹威克');
INSERT INTO `director` VALUES (10, '拉吉库马尔·希拉尼');
INSERT INTO `director` VALUES (11, '岩井俊二');
INSERT INTO `director` VALUES (12, ' 赵小丁');
INSERT INTO `director` VALUES (13, ' 安东尼·拉默里纳拉');
COMMIT;

-- ----------------------------
-- Table structure for directormovie
-- ----------------------------
DROP TABLE IF EXISTS `directormovie`;
CREATE TABLE `directormovie` (
  `mid` int(10) NOT NULL,
  `directorid` int(10) NOT NULL,
  PRIMARY KEY (`mid`,`directorid`) USING BTREE,
  KEY `directorid` (`directorid`) USING BTREE,
  CONSTRAINT `directormovie_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `movie` (`mid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `directormovie_ibfk_2` FOREIGN KEY (`directorid`) REFERENCES `director` (`directorid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of directormovie
-- ----------------------------
BEGIN;
INSERT INTO `directormovie` VALUES (11, 1);
INSERT INTO `directormovie` VALUES (1, 2);
INSERT INTO `directormovie` VALUES (3, 4);
INSERT INTO `directormovie` VALUES (5, 5);
INSERT INTO `directormovie` VALUES (9, 6);
INSERT INTO `directormovie` VALUES (2, 7);
INSERT INTO `directormovie` VALUES (7, 8);
INSERT INTO `directormovie` VALUES (8, 9);
INSERT INTO `directormovie` VALUES (10, 10);
INSERT INTO `directormovie` VALUES (6, 11);
INSERT INTO `directormovie` VALUES (4, 12);
INSERT INTO `directormovie` VALUES (4, 13);
COMMIT;

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `mid` int(10) NOT NULL AUTO_INCREMENT,
  `mname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `alias` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '别名',
  `intro` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '简介',
  `imdbUrl` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'imdb链接',
  `language` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `releaseDate` date DEFAULT NULL COMMENT '上映日期',
  `duration` int(4) NOT NULL COMMENT '电影时长',
  PRIMARY KEY (`mid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of movie
-- ----------------------------
BEGIN;
INSERT INTO `movie` VALUES (1, '我不是药神', '中国药神/生命之路', '　　本片改编自慢粒白血病患者陆勇代购抗癌药的真实事迹。', 'http://www.imdb.com/title/tt7362036', '普通话 / 英语 /  印地语', '2018-07-05', 117);
INSERT INTO `movie` VALUES (2, '无问西东', 'Forever Young', '如果提前了解了你所要面对的人生，你是否还会有勇气前来？吴岭澜、沈光耀、王敏佳、陈鹏、张果果，几个年轻人满怀诸多渴望，在四个非同凡响的时空中一路前行。 \r\n　　吴岭澜（陈楚生 饰），出发时意气风发，却很快在途中迷失了方向。沈光耀（王力宏 饰），自愿参与了最残酷的战争，他一直在努力去做那些令他害怕，但重要的事。王敏佳（章子怡 饰）最初的错误，只是为了虚荣撒了一个小谎；最初的烦恼，只是在两个优秀的男人中选择一个。但命运，却把她拖入被众人唾骂的深渊。陈鹏（黄晓明 饰）把爱情摆在了理想前面，但爱情却没有把他摆在前面。他说，“我有人要照顾”，纵然这意味着与所有人作对，意味着要和她一起被放逐千里。张果果（张震 饰），身处尔虞我诈的职场，“赢”是他的习惯。为了赢，他总是见招拆招，先发制人。而有一天，他却面临了一个比“赢”更重要的选择。这几个年轻人，在最好的年纪迎来了最残酷的...', 'http://www.imdb.com/title/tt2401825', '普通话', '2018-01-12', 138);
INSERT INTO `movie` VALUES (3, '影', '荆州保卫战', '纷乱时局，群敌环伺。一个从小被秘密囚禁的替身，不甘只做他人手中的武器；但若想冲破枷锁，找回自我，又必将历经千难万险的考验；替身能否寻回自由，他又该如何选择？', 'https://www.imdb.com/title/tt6864046/', '普通话', '2018-09-30', 116);
INSERT INTO `movie` VALUES (4, '三生三世十里桃花', 'Once Upon a Time', '白浅（刘亦菲 饰）失去了上一世的记忆，盘踞在青丘山内，过着与世无争自由自在的生活。在东海盛宴上，白浅遇见了带着天孙阿离（彭子苏 饰）的天族太子夜华（杨洋 饰），实际上，两人之间早就定下了婚约。夜华震惊于白浅拥有的和他死去的妻子素素一模一样的外表，于是开始接近白浅，在此过程中被白浅善良开朗的性格渐渐吸引。 \r\n　　实际上，白浅一直忘不了的是当年为了拯救众生而牺牲了自己的天族战神墨渊（杨洋 饰），他的仙体一直被保存在炎华洞内。夜华的侧妃素锦（李纯 饰）十分嫉妒白浅能够得到夜华的喜爱，于是勾结鬼族王后玄女（顾璇 饰）偷走了墨渊的仙体，得知此消息，白浅失去了理智。', 'http://www.imdb.com/title/tt6138688', '普通话', '2017-08-03', 109);
INSERT INTO `movie` VALUES (5, '邪不压正', '侠隐', '　　本片根据张北海的小说《侠隐》改编。', 'http://www.imdb.com/title/tt8434380', '普通话 / 英语 / 日语 / 法语', '2018-07-13', 137);
INSERT INTO `movie` VALUES (6, '你好，之华', '之华', '　　妹妹之华代替姐姐参加同学会，却意外遇见年少时的倾慕对象尹川。往日的记忆在苏醒，但再次相见，已物是人非。', 'https://www.imdb.com/title/tt9078374/', '普通话', '2018-11-09', 114);
INSERT INTO `movie` VALUES (7, '加勒比海盗', '加勒比海盗1：黑珍珠号的诅咒', '故事发生在17世纪，传说中海盗最为活跃的加勒比海。风趣迷人的杰克·斯伯洛（约翰尼·德普 Johnny Depp 饰），是活跃在加勒比海上的海盗，拥有属于自己的“黑珍珠”号海盗船。对他来说，最惬意的生活就是驾驶着“黑珍珠”号在加勒比海上游荡，自由自在的打劫过往船只。但不幸的是，他的仇敌，老谋深算的巴尔巴罗萨船长(杰弗里·拉什 Geoffrey Rush 饰)偷走了他的“黑珍珠”号。巴伯萨是一个无恶不作的坏蛋，他抢劫了杰克的\"黑珍珠号\"后，更加猖狂，在加勒比海上横行霸道，一时成为整个加勒比海的霸主。 \r\n　　一次，巴伯萨一伙袭击了罗亚尔港小镇，还绑架了总督的女儿伊莉莎白·斯万(凯拉·奈特莉 Keira Knightley 饰)和伊莉莎白青梅竹马的铁匠学徒威尔·特纳（奥兰多·布鲁姆 Orlando Bloom 饰），想方设法救出了狱中的船长杰克，偷来英国皇家舰队最...', 'http://www.imdb.com/title/tt0325980', '英语', '2003-11-21', 143);
INSERT INTO `movie` VALUES (8, '燃情岁月', '秋日传奇 / 真爱一世情(台)', '辽阔的西部草原住着一位父亲和他的三个儿子——父亲是退了休的骑兵上校，三个儿子个性鲜明：大儿子艾尔弗莱德（艾丹•奎因 Aidan Quinn 饰）忠厚老实，二儿子特里斯坦（布拉德•皮特 Brad Pitt 饰）狂放不羁，最小的儿子塞缪尔（亨瑞•托马斯Henry Thomas饰）温文尔雅。 \r\n　　父子在大草原的生活随着塞缪尔未婚妻苏珊娜（朱莉娅•奥蒙德 Julia Ormond 饰）的到来而改变。苏珊娜年轻漂亮，给艾尔弗莱德带来了内心的震动。他暗恋她，然而苏珊娜心里却不由自主的迷恋上豪放粗犷的特里斯坦。出于道德的坚守，他们一直压抑着内心的感情。 \r\n　　直到塞缪尔壮烈牺牲在前线，事情有了变化。特里斯坦非常爱戴哥哥，无法面对已经爱上苏珊娜的现实，于是离家出走。而苏珊娜万念俱灰，答应嫁给了艾尔弗莱德，而特里斯坦在草原之外也已结婚生子。事情好像趋于了平静，但特里斯坦妻子...', 'http://www.imdb.com/title/tt0110322', '英语 / 康沃尔语', '1994-12-16', 133);
INSERT INTO `movie` VALUES (9, '战狼2', '新战狼 / 新战死沙场', '故事发生在非洲附近的大海上，主人公冷锋（吴京 饰）遭遇人生滑铁卢，被“开除军籍”，本想漂泊一生的他，正当他打算这么做的时候，一场突如其来的意外打破了他的计划，突然被卷入了一场非洲国家叛乱，本可以安全撤离，却因无法忘记曾经为军人的使命，孤身犯险冲回沦陷区，带领身陷屠杀中的同胞和难民，展开生死逃亡。随着斗争的持续，体内的狼性逐渐复苏，最终孤身闯入战乱区域，为同胞而战斗。', 'http://www.imdb.com/title/tt7131870', '普通话 / 英语', '2017-07-27', 123);
INSERT INTO `movie` VALUES (10, '三傻大闹宝莱坞', '三个傻瓜(台) / 作死不离3兄弟(港)', '本片根据印度畅销书作家奇坦·巴哈特（Chetan Bhagat）的处女作小说《五点人》（Five Point Someone）改编而成。法兰（马德哈万 R Madhavan 饰）、拉杜（沙曼·乔希 Sharman Joshi 饰）与兰乔（阿米尔·汗 Aamir Khan 饰）是皇家工程学院的学生，三人共居一室，结为好友。在以严格著称的学院里，兰乔是个非常与众不同的学生，他不死记硬背，甚至还公然顶撞校长“病毒”（波曼·伊拉尼 Boman Irani 饰），质疑他的教学方法。他不仅鼓动法兰与拉杜去勇敢追寻理想，还劝说校长的二女儿碧雅（卡琳娜·卡普 Kareena Kapoor 饰）离开满眼铜臭的未婚夫。兰乔的特立独行引起了模范学生“消音器”（奥米·维嘉 Omi Vaidya 饰）的不满，他约定十年后再与兰乔一决高下，看哪种生活方式更能取得成功。 ', 'http://www.imdb.com/title/tt1187043', '印地语 / 乌尔都语 / 英语', '2011-12-08', 171);
INSERT INTO `movie` VALUES (11, '致命魔术', '顶尖对决(台) / 死亡魔法(港)', '19世纪末，人们对科学文明还不是认识得太过清楚，于是，安吉尔（休•杰克曼Hugh Jackman饰）和伯登（克里斯蒂安•贝尔Christian Bale饰）的魔术，成为了伦敦城内的神奇人物。安吉尔出身贵族，魔术手段华丽丰富，是富人圈子里的表演常客。而伯登即使出身平平，争强好胜的心智和充满创造力的魔术技巧，却也令他有了名气。两人自小本是要好的伙伴，然而，现在魔术界二人各有领地，并且都有野心想成为音乐大厅里的顶级魔术师，一番明争暗斗如箭在弦上。 \r\n　　伯登掌握了精彩的分身术，叫座又叫好。而安吉尔见情势不妙，搬来科学家助阵——他发明的交流电有无穷魔力，保证让观众目瞪口呆。二人出招接招，一来一往，争斗在剧烈升级，友谊和道德都被抛诸脑后，一场血案在悄悄酝酿。', 'http://www.imdb.com/title/tt0482571', '英语', '2006-10-20', 130);
COMMIT;

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `picid` int(10) NOT NULL,
  ` piclocation` varchar(80) NOT NULL,
  PRIMARY KEY (`picid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for picturemovie
-- ----------------------------
DROP TABLE IF EXISTS `picturemovie`;
CREATE TABLE `picturemovie` (
  `mid` int(10) NOT NULL,
  `picid` int(10) NOT NULL,
  PRIMARY KEY (`picid`) USING BTREE,
  KEY `mid` (`mid`),
  CONSTRAINT `picturemovie_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `movie` (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for playwright
-- ----------------------------
DROP TABLE IF EXISTS `playwright`;
CREATE TABLE `playwright` (
  `playwrightid` int(10) NOT NULL AUTO_INCREMENT,
  `playwrightname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`playwrightid`) USING BTREE,
  KEY `playwrightid` (`playwrightid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of playwright
-- ----------------------------
BEGIN;
INSERT INTO `playwright` VALUES (1, '李晗');
INSERT INTO `playwright` VALUES (2, '刘晗');
INSERT INTO `playwright` VALUES (3, '麦灵');
INSERT INTO `playwright` VALUES (4, '张亚亮');
INSERT INTO `playwright` VALUES (5, '唐七');
INSERT INTO `playwright` VALUES (6, '威廉·D·威特利夫');
INSERT INTO `playwright` VALUES (7, 'Susan Shilliday');
INSERT INTO `playwright` VALUES (8, '李芳芳');
INSERT INTO `playwright` VALUES (9, '岩井俊二');
INSERT INTO `playwright` VALUES (10, '李威');
INSERT INTO `playwright` VALUES (11, '张艺谋');
INSERT INTO `playwright` VALUES (12, '姜文');
INSERT INTO `playwright` VALUES (13, '何冀平');
INSERT INTO `playwright` VALUES (14, '李非');
INSERT INTO `playwright` VALUES (15, '孙悦');
INSERT INTO `playwright` VALUES (16, '张北海');
INSERT INTO `playwright` VALUES (17, '泰德·艾略特');
INSERT INTO `playwright` VALUES (18, '特里·鲁西奥');
INSERT INTO `playwright` VALUES (19, '斯图尔特·贝亚蒂耶');
INSERT INTO `playwright` VALUES (20, '杰·沃尔伯特');
INSERT INTO `playwright` VALUES (21, '吴京');
INSERT INTO `playwright` VALUES (22, '董群');
INSERT INTO `playwright` VALUES (23, '刘毅');
INSERT INTO `playwright` VALUES (24, '维德胡·维诺德·乔普拉');
INSERT INTO `playwright` VALUES (25, '拉吉库马尔·希拉尼');
INSERT INTO `playwright` VALUES (26, '阿西奇·乔希');
INSERT INTO `playwright` VALUES (27, '乔纳森·诺兰');
INSERT INTO `playwright` VALUES (28, '克里斯托弗·诺兰');
INSERT INTO `playwright` VALUES (29, '克里斯托弗·普瑞丝特');
COMMIT;

-- ----------------------------
-- Table structure for playwrightmovie
-- ----------------------------
DROP TABLE IF EXISTS `playwrightmovie`;
CREATE TABLE `playwrightmovie` (
  `mid` int(10) NOT NULL,
  `playwrightid` int(10) NOT NULL,
  PRIMARY KEY (`mid`,`playwrightid`) USING BTREE,
  KEY `playwrightid` (`playwrightid`) USING BTREE,
  CONSTRAINT `playwrightmovie_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `movie` (`mid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `playwrightmovie_ibfk_2` FOREIGN KEY (`playwrightid`) REFERENCES `playwright` (`playwrightid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of playwrightmovie
-- ----------------------------
BEGIN;
INSERT INTO `playwrightmovie` VALUES (4, 1);
INSERT INTO `playwrightmovie` VALUES (4, 2);
INSERT INTO `playwrightmovie` VALUES (4, 3);
INSERT INTO `playwrightmovie` VALUES (4, 4);
INSERT INTO `playwrightmovie` VALUES (4, 5);
INSERT INTO `playwrightmovie` VALUES (8, 6);
INSERT INTO `playwrightmovie` VALUES (8, 7);
INSERT INTO `playwrightmovie` VALUES (2, 8);
INSERT INTO `playwrightmovie` VALUES (6, 9);
INSERT INTO `playwrightmovie` VALUES (3, 10);
INSERT INTO `playwrightmovie` VALUES (3, 11);
INSERT INTO `playwrightmovie` VALUES (5, 12);
INSERT INTO `playwrightmovie` VALUES (5, 13);
INSERT INTO `playwrightmovie` VALUES (5, 14);
INSERT INTO `playwrightmovie` VALUES (5, 15);
INSERT INTO `playwrightmovie` VALUES (5, 16);
INSERT INTO `playwrightmovie` VALUES (7, 17);
INSERT INTO `playwrightmovie` VALUES (7, 18);
INSERT INTO `playwrightmovie` VALUES (7, 19);
INSERT INTO `playwrightmovie` VALUES (7, 20);
INSERT INTO `playwrightmovie` VALUES (9, 21);
INSERT INTO `playwrightmovie` VALUES (9, 22);
INSERT INTO `playwrightmovie` VALUES (9, 23);
INSERT INTO `playwrightmovie` VALUES (10, 24);
INSERT INTO `playwrightmovie` VALUES (10, 25);
INSERT INTO `playwrightmovie` VALUES (10, 26);
INSERT INTO `playwrightmovie` VALUES (11, 27);
INSERT INTO `playwrightmovie` VALUES (11, 28);
INSERT INTO `playwrightmovie` VALUES (11, 29);
COMMIT;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `mid` int(10) NOT NULL,
  `tagname` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`mid`,`tagname`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tag
-- ----------------------------
BEGIN;
INSERT INTO `tag` VALUES (1, '2018');
INSERT INTO `tag` VALUES (1, '中国大陆');
INSERT INTO `tag` VALUES (1, '人性');
INSERT INTO `tag` VALUES (1, '剧情');
INSERT INTO `tag` VALUES (1, '生命');
INSERT INTO `tag` VALUES (1, '真实事件改编');
INSERT INTO `tag` VALUES (1, '社会');
INSERT INTO `tag` VALUES (1, '黑色幽默');
INSERT INTO `tag` VALUES (2, '人生');
INSERT INTO `tag` VALUES (2, '励志');
INSERT INTO `tag` VALUES (2, '历史');
INSERT INTO `tag` VALUES (2, '国产');
INSERT INTO `tag` VALUES (2, '成长');
INSERT INTO `tag` VALUES (2, '文艺');
INSERT INTO `tag` VALUES (2, '清华');
INSERT INTO `tag` VALUES (2, '青春');
INSERT INTO `tag` VALUES (3, '2018');
INSERT INTO `tag` VALUES (3, '中国大陆');
INSERT INTO `tag` VALUES (3, '人性');
INSERT INTO `tag` VALUES (3, '剧情');
INSERT INTO `tag` VALUES (3, '古装');
INSERT INTO `tag` VALUES (3, '武侠');
INSERT INTO `tag` VALUES (3, '水墨');
INSERT INTO `tag` VALUES (3, '视觉艺术');
INSERT INTO `tag` VALUES (3, '黑白');
INSERT INTO `tag` VALUES (4, '2017');
INSERT INTO `tag` VALUES (4, '仙侠');
INSERT INTO `tag` VALUES (4, '仙神');
INSERT INTO `tag` VALUES (4, '古装');
INSERT INTO `tag` VALUES (4, '小说改编');
INSERT INTO `tag` VALUES (4, '爱情');
INSERT INTO `tag` VALUES (4, '特效');
INSERT INTO `tag` VALUES (4, '玄幻');
INSERT INTO `tag` VALUES (5, '2018');
INSERT INTO `tag` VALUES (5, '中国大陆');
INSERT INTO `tag` VALUES (5, '剧情');
INSERT INTO `tag` VALUES (5, '动作');
INSERT INTO `tag` VALUES (5, '民国');
INSERT INTO `tag` VALUES (5, '黑色幽默');
INSERT INTO `tag` VALUES (6, '2018');
INSERT INTO `tag` VALUES (6, '中国大陆');
INSERT INTO `tag` VALUES (6, '剧情');
INSERT INTO `tag` VALUES (6, '怀旧');
INSERT INTO `tag` VALUES (6, '日本');
INSERT INTO `tag` VALUES (6, '爱情');
INSERT INTO `tag` VALUES (7, '冒险');
INSERT INTO `tag` VALUES (7, '加勒比海盗');
INSERT INTO `tag` VALUES (7, '动作');
INSERT INTO `tag` VALUES (7, '奇幻');
INSERT INTO `tag` VALUES (7, '海盗');
INSERT INTO `tag` VALUES (7, '约翰尼德普');
INSERT INTO `tag` VALUES (7, '美国');
INSERT INTO `tag` VALUES (8, '亲情');
INSERT INTO `tag` VALUES (8, '人生');
INSERT INTO `tag` VALUES (8, '剧情');
INSERT INTO `tag` VALUES (8, '爱情');
INSERT INTO `tag` VALUES (8, '秋日传奇');
INSERT INTO `tag` VALUES (8, '经典');
INSERT INTO `tag` VALUES (8, '美国');
INSERT INTO `tag` VALUES (8, '西部');
INSERT INTO `tag` VALUES (9, '中国大陆');
INSERT INTO `tag` VALUES (9, '军事');
INSERT INTO `tag` VALUES (9, '动作');
INSERT INTO `tag` VALUES (9, '战争');
INSERT INTO `tag` VALUES (9, '爱国');
INSERT INTO `tag` VALUES (10, '人生');
INSERT INTO `tag` VALUES (10, '剧情');
INSERT INTO `tag` VALUES (10, '励志');
INSERT INTO `tag` VALUES (10, '印度');
INSERT INTO `tag` VALUES (10, '喜剧');
INSERT INTO `tag` VALUES (10, '宝莱坞');
INSERT INTO `tag` VALUES (10, '搞笑');
INSERT INTO `tag` VALUES (10, '经典');
INSERT INTO `tag` VALUES (11, '剧情');
INSERT INTO `tag` VALUES (11, '悬疑');
INSERT INTO `tag` VALUES (11, '科幻');
INSERT INTO `tag` VALUES (11, '美国');
INSERT INTO `tag` VALUES (11, '魔术');
COMMIT;

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `typeid` int(10) NOT NULL,
  `typename` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for typemovie
-- ----------------------------
DROP TABLE IF EXISTS `typemovie`;
CREATE TABLE `typemovie` (
  `mid` int(10) NOT NULL,
  `typeid` int(10) NOT NULL,
  PRIMARY KEY (`mid`,`typeid`),
  KEY `typeid` (`typeid`),
  CONSTRAINT `typemovie_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `movie` (`mid`),
  CONSTRAINT `typemovie_ibfk_2` FOREIGN KEY (`typeid`) REFERENCES `type` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `uname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, '100000@qq.com', '1234566', '张三', '13051337666');
INSERT INTO `user` VALUES (2, '111111@qq.com', '124124', '李四', '13176528765');
INSERT INTO `user` VALUES (3, '222222@qq.com', '1234124', '王五', '13276518765');
INSERT INTO `user` VALUES (4, '123hasjg@163.com', '123asfa', '王云', '15126765498');
INSERT INTO `user` VALUES (5, 'qlkas@gmail.com', 'asdafsdfvs', '陈瑞', '17098236798');
INSERT INTO `user` VALUES (6, '1307657@qq.com', 'asdfasfgbcv', '赵子龙', '17376778760');
INSERT INTO `user` VALUES (7, 'Lkasjd@163.com', '12378621', '王芳', '13065789807');
INSERT INTO `user` VALUES (8, 'LM123@bjfu.edu.cn', 'hhhhhh', '李明', '15876809854');
INSERT INTO `user` VALUES (9, '7657896@qq.com', 'xxxxxx', '马超', '18387654017');
INSERT INTO `user` VALUES (10, 'leipeng@gmail.com', '100000', '雷朋', '19012387878');
INSERT INTO `user` VALUES (11, 'huanglin@163.com', 'asjkhdjkasd', '黄琳', '13337862450');
INSERT INTO `user` VALUES (12, 'LMiss@163.com', '12asdasdx', 'LMiss', '18372678760');
INSERT INTO `user` VALUES (13, 'FL5921@163.com', '123456789~', 'FL5921', '18176290876');
INSERT INTO `user` VALUES (14, 'Edison@163.com', '987654321~', 'Edison', '18312378876');
INSERT INTO `user` VALUES (15, 'Debudao@gmail.com', '1789065432', 'Debudao', '13700902241');
INSERT INTO `user` VALUES (16, 'Frake123@163.com', '13051678297', 'Frake', '15567809876');
INSERT INTO `user` VALUES (17, 'Wangxz@gmail.com', 'dasjdfhg', 'Wxz', '17782908765');
INSERT INTO `user` VALUES (18, 'Llei145@163.com', 'adsghgjjhvjk', 'Llei', '19187260987');
INSERT INTO `user` VALUES (19, 'Wusuowei@gmail.com', '123456', 'Wusuowei', '18765309876');
INSERT INTO `user` VALUES (20, '15849076578@qq.com', '6543231', 'Fyc', '13051477289');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
