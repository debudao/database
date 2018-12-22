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

 Date: 20/12/2018 20:46:05
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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
-- Records of actormovie
-- ----------------------------
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

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area`  (
  `areaid` int(10) NOT NULL,
  `areaname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`areaid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES (1, '中国大陆');
INSERT INTO `area` VALUES (2, '美国');
INSERT INTO `area` VALUES (3, '中国香港');
INSERT INTO `area` VALUES (4, '印度');
INSERT INTO `area` VALUES (5, '英国');
INSERT INTO `area` VALUES (6, '法国');
INSERT INTO `area` VALUES (7, '中国台湾');
INSERT INTO `area` VALUES (8, '日本');
INSERT INTO `area` VALUES (9, '韩国');

-- ----------------------------
-- Table structure for areamovie
-- ----------------------------
DROP TABLE IF EXISTS `areamovie`;
CREATE TABLE `areamovie`  (
  `mid` int(10) NOT NULL,
  `areaid` int(10) NOT NULL,
  PRIMARY KEY (`mid`, `areaid`) USING BTREE,
  INDEX `areamovie_ibfk_2`(`areaid`) USING BTREE,
  CONSTRAINT `areamovie_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `movie` (`mid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `areamovie_ibfk_2` FOREIGN KEY (`areaid`) REFERENCES `area` (`areaid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of areamovie
-- ----------------------------
INSERT INTO `areamovie` VALUES (1, 1);
INSERT INTO `areamovie` VALUES (2, 1);
INSERT INTO `areamovie` VALUES (3, 1);
INSERT INTO `areamovie` VALUES (4, 1);
INSERT INTO `areamovie` VALUES (5, 1);
INSERT INTO `areamovie` VALUES (6, 1);
INSERT INTO `areamovie` VALUES (9, 1);
INSERT INTO `areamovie` VALUES (7, 2);
INSERT INTO `areamovie` VALUES (8, 2);
INSERT INTO `areamovie` VALUES (11, 2);
INSERT INTO `areamovie` VALUES (3, 3);
INSERT INTO `areamovie` VALUES (10, 4);
INSERT INTO `areamovie` VALUES (11, 5);

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
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 4, 2, '杨洋之后再无如此猥琐油腻之夜华。', '2017-08-03', 1);
INSERT INTO `comment` VALUES (1, 8, 8, '基本可给五星，但纠结的情感使人难受。有两种东西会毁掉家庭：带回家的女人，和政治。', '2012-04-30', 1);
INSERT INTO `comment` VALUES (1, 11, 10, '诺兰是一个伟大的魔术师，谜底都在变小鸟那个魔术里了。。', '2010-03-13', 1);
INSERT INTO `comment` VALUES (2, 2, 8, '孤坟葬着未亡者，枯井跳下活死人。你会一点命理，却摸不透时代脉搏；我懂一些句读，仍划不掉此生灾祸。沙海苍茫，惦念着远方的你治愈情痛；山河破碎，曾记得少年意气胸怀家国。这里有百子争鸣，可静坐听雨，能丈量核变，共天地俊秀。这水木清华见证了百年兴衰，世事变迁。还有无数情深，正在漠漠跋涉。', '2018-01-10', 1);
INSERT INTO `comment` VALUES (3, 2, 8, '做为命题作文，在当下的电影语境，能拍到这个“深度”（尤其是62年戏份），真心佩服导演。', '2018-01-10', 1);
INSERT INTO `comment` VALUES (3, 10, 10, '看了这部电影是我2010年最幸运的一件事 力荐！', '2010-08-07', 1);
INSERT INTO `comment` VALUES (4, 5, 6, '3.5 大概算是姜文电影中直白又平庸的一部，属于导演个人恶趣味的东西反而成了双刃剑，时而灵光闪现，时而尴尬无趣。屋顶和医院戏观感佳，到后半程高潮节奏又莫名拖沓，没有之前作品那种酣畅淋漓的快感。', '2018-07-10', 9);
INSERT INTO `comment` VALUES (4, 10, 10, '可以打6星吗！', '2010-08-03', 1);
INSERT INTO `comment` VALUES (5, 11, 10, '一种叫做牛逼的感脚淋漓尽致。', '2010-03-08', 1);
INSERT INTO `comment` VALUES (6, 7, 8, '蜀黍！！！！！妖娆的我想shi！！！', '2015-06-10', 1);
INSERT INTO `comment` VALUES (6, 9, 8, '凭良心说，好看到不像《战狼1》的续集，完虐《湄公河行动》。PS：我也是醉了，那些说吴京角色打不死的，我想问你们哪部商业动作片没有个人英雄主义的，真为你们感到丢人。', '2017-07-23', 1);
INSERT INTO `comment` VALUES (6, 10, 8, '如果有一天你变成了奇怪的家伙，生活于恐惧和虚假之中，就念重生的咒语“All is well”，狠狠地给这个世界一脚！对鼓励别样人生价值和给人梦想的片子我是举双手赞成，何况从头到尾都拍得这么欢乐。台词：“朋友是男人最大的胸部”、“你这么害怕明天，又怎么能过好今天”。', '2014-06-25', 1);
INSERT INTO `comment` VALUES (7, 2, 4, '白瞎这演员阵容了…这拍的什么？清华宣传片？音乐是直接从公益片里拿出来的？所有主角为什么都要对着镜头露出老母亲般的围笑？大特写也太多了！虚焦镜头好多！镜头无意义的抖动看着也很难受。', '2018-01-11', 1);
INSERT INTO `comment` VALUES (7, 5, 8, '为吃醋做一顿饺子，为贺礼烧一座烟房，饺子没吃到嘴里，鸦片迷醉进鼻腔。为不老打一管针剂，为隐形做一件衣裳，不老却主动求死，隐形却光着皮囊。汉奸跪在地上如狗，侠客飞上屋檐如鸽，谁睡在丧钟里不醒，谁僵在火海里失声。躲得过爱情的子弹，拔不掉仇恨的齿牙，北平本是一座孤岛，海水退去便是江湖。', '2018-07-14', 3);
INSERT INTO `comment` VALUES (7, 6, 4, '1.并不仅仅只是《情书》升级版，而是三代人命脉相连的爱恨罗曼史。2.岩井俊二唯美不失残酷，周公子细微处见真章，能看到他俩合作，真是三生有幸。3.秦昊的痴情，张子枫的懵懂，吴彦殊的夕阳恋，每位演员都各得其所，交织成家族群像。4.光影风格延续了《瑞普·凡·温克尔的新娘》，平实中偶有梦境感。5.人生无常，难免错过；命途中注定有太多物是人非，只愿你活成最好的样子。', '2018-10-30', 1);
INSERT INTO `comment` VALUES (7, 8, 10, '每个画面都是那么温情且壮阔，还有那刺痛到灵魂深处的音乐，众人到位的表演。故事虽然并不那么引人入胜，但要表达的思想却是很容易赢得共鸣的。燃情的岁月，一世的真情。', '2010-07-29', 1);
INSERT INTO `comment` VALUES (8, 10, 10, '这几个月来看过的最好的片——”做自己“，也许才是人生终极的成功。别总嘲笑印度人”阿三“，他们已经追上来了，无论经济、科技还是我们一贯认为只会跳舞唱歌的宝莱坞电影。盛赞！5+1星！', '2015-06-10', 1);
INSERT INTO `comment` VALUES (9, 4, 2, '特效很差，演员演技差到让人尴尬，杨洋的存在就是为了衬托刘亦菲的演技。', '2017-08-03', 1);
INSERT INTO `comment` VALUES (9, 11, 8, '诺兰牛比阿', '2007-07-21', 1);
INSERT INTO `comment` VALUES (10, 2, 6, '看完时有点小激动，竟然被这种拥有抠图海报的电影感动得落泪了，138分钟没分心。冷静下想想，还是一个知音体的公益广告片，我能感动完全是因为张震（连念鸡汤我都愿意喝），章子怡颤抖的嘴角，甚至黄教主掉下的头发、王力宏的本色出演。', '2018-01-19', 1);
INSERT INTO `comment` VALUES (10, 3, 8, '谁能想到，演得最好的竟然是郑恺…', '2018-09-29', 11);
INSERT INTO `comment` VALUES (10, 5, 4, '曾经很欣赏《一步之遥》，当年观感是惊喜的。其尚有迷影之元素，戏中戏之架构，《我这一辈子》之手法，浪漫地肆意妄为。能和《地狱为何恶劣》比一比。而《邪不压正》则让我大失所望，达不到园子温那般癫狂High翻，反倒是抗日神剧、闹剧路线：日本人一定玩阴的，中国少侠躲子弹一打十牛逼。针扎战书手雷互扔，设计低级无聊硬搞笑。以姜文水准不应该如此低智。姜文作品中个人观感最差的一部，不顾逻辑剧情，放飞自我恶趣味。', '2018-07-11', 12);
INSERT INTO `comment` VALUES (11, 1, 10, '文牧野眼睛太毒了，观众的笑点、泪点、痛点被他牢牢抓住，徐峥现在不拼演技开始掏心炸肺放脱自我了，药物在中国绝对是个“不可说”，但这个电影说了它能说的，也不显山不漏水的说了它所不能说的，讲的是现实，但看过电影之后才会明白其实是超现实，2018最佳!', '2018-06-30', 5);
INSERT INTO `comment` VALUES (11, 9, 4, '首映礼看的。太恐怖了这个电影，不讲道理的，完全就是吴京在实现他这个小粉红的英雄梦。各种装备轮番上场，视物理逻辑于不顾，不得不说有钱真好，随意胡闹', '2017-07-23', 1);
INSERT INTO `comment` VALUES (12, 10, 10, '活在当下，不记得失，以无为之心做有为之事，你收获的会是比物质更珍贵永恒的生命体验。', '2013-06-26', 1);
INSERT INTO `comment` VALUES (13, 4, 2, '看到最后一位编剧的名字非常反胃。这几年刘亦菲的电影资源太虐了，能不能有一部像样的电影能让我静静看看颜。', '2017-08-03', 1);
INSERT INTO `comment` VALUES (13, 8, 10, '这颜色，这画面，这岁月，这情怀，这曾经，这男人，这爱情，好痛好痛', '2010-07-27', 1);
INSERT INTO `comment` VALUES (14, 7, 10, '在海岛的时候连看了三部，就记得第一部的剧情，2，3都忘记了', '2009-12-16', 1);
INSERT INTO `comment` VALUES (14, 11, 6, 'The final ten minutes was completely redundant. Would\'ve liked it a lot more if it ended ten minutes earlier. :(', '2006-10-22', 1);
INSERT INTO `comment` VALUES (15, 1, 6, '只要提到价值，中国电影的标准便会坍塌。明眼人都看得出，幕后黑哪是一脸奸相的大药厂，又或者，结尾辩方律师可以再底气不足一些。前后大发感言的两名老太，表演模式有何本质不同。徐峥的转变与倒贴，全是目睹惨相的愧疚觉悟——而在这样一部电影里，最不缺的就是惨。被消灭的，何止是戴口罩的病人', '2018-07-04', 3);
INSERT INTO `comment` VALUES (15, 3, 6, '张艺谋用这个片子满足了自己的造型欲，美术欲，氛围欲，声效欲……故事简单得不能再简单，铺垫以及结尾几次接连的反转都是标准制式的做法。怎么说呢？嗯，从情节上看，这是一部爆米花电影，但从氛围和节奏上又不太适合一边看一边抖着腿吃爆米花。不知道大家能不能get到点。', '2018-09-30', 15);
INSERT INTO `comment` VALUES (15, 4, 4, '塑料质感的特效，颜色爆炸的美术，千人一面的两个主角，尤其猥琐的QJ犯男主，讲点道理，教主是躺枪。', '2017-08-03', 1);
INSERT INTO `comment` VALUES (16, 1, 8, '当然算不上杰作，但放豆瓣语境下，是部时至今日终于拍出来的国产“高分韩国电影”。拿现实题材拍商业类型片，社会意义摆在那，群戏也处理得相当不错。对我们国家而言，这样的电影多一部是一部，走一步是一步。', '2018-06-06', 7);
INSERT INTO `comment` VALUES (16, 8, 8, '又臭又长的电影', '2007-07-02', 1);
INSERT INTO `comment` VALUES (17, 1, 10, '炸裂，哭成狗，从观影体验上看，比达拉斯买家俱乐部好，之间隔了差不多五个《动物世界》，导演处女作就这完成度，只能说剧本实在太好。我爸爸也是药神的受益者之一，否则我应该房子也没了。感谢他们🙏。', '2018-07-03', 6);
INSERT INTO `comment` VALUES (17, 5, 10, '不要再问我邪不压正好不好看了哥哥姐姐们，反正朋友《一步之遥》看了10分钟就离场的这次字幕看完都舍不得走。 药神太猛，我是姜文，我现在慌的一匹 补充：要说现实主义，药神绝对不是真正意义上的现实主义，对于一个已经解决了的事件、一个已经不是问题的问题拿出来说就已经违背了现实主义题材的核心––讨论“真”问题。', '2018-07-13', 4);
INSERT INTO `comment` VALUES (17, 7, 10, '“因为地平线一直在那。你想到达那儿，但你永远到达不了。就是那样，遥不可及难以放弃。”', '2011-02-14', 1);
INSERT INTO `comment` VALUES (18, 3, 6, '这部片最大的败笔也许来自关晓彤和吴磊.....', '2018-09-07', 4);
INSERT INTO `comment` VALUES (18, 6, 6, '飒然暗恋着同桌，但她不愿意说出来； 之华表达了爱慕之心，仍然也没能修成正果。 你说或不说，你都是他故事里的配角，毫不起眼。 尹川和之南是初中同学，大学又再一次相遇，终究是有缘无分； 婆婆想和英语老师再续前缘，可对方却不解风情。 三个时代，四段感情，有过暧昧和相爱，又归于错过和遗憾。 再深的感情，也抵挡不住缘分的交错。 之华被尹川伤了心，尹川又失去了之南。 张超伤害了之南，又得到了另一个人的爱。', '2018-11-09', 1);
INSERT INTO `comment` VALUES (19, 8, 8, '看这片时我有一半时间在哭 哭到虚脱……这是美国片 商业片 心甘情愿的被煽情至此 还有它的配乐 放烂了没错 但实在是好 这么通俗入耳的交响曲 当年的彼特真正性感 如骏马 2003，7', '2005-12-04', 1);
INSERT INTO `comment` VALUES (20, 6, 6, '与其说是“错过”，不如说是“失去”和“遗憾”的故事。在这个依旧以葬礼作为开场的电影里，几乎所有人都处在失去和遗憾的人生历程中，但取代了大雪的是外面灿烂的阳光，有时候你几乎能感觉到之华毛衣的触感。故事有很大部分都在追溯之南的过往，而看完后我一直在想的却是之华，和她写信时涂的天蓝色指甲油一样，沉静而悲伤地覆盖了我对这个故事所有的感触。', '2018-10-30', 1);

-- ----------------------------
-- Table structure for director
-- ----------------------------
DROP TABLE IF EXISTS `director`;
CREATE TABLE `director`  (
  `directorid` int(10) NOT NULL AUTO_INCREMENT,
  `directorname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`directorid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of director
-- ----------------------------
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
-- Records of directormovie
-- ----------------------------
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

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie`  (
  `mid` int(10) NOT NULL AUTO_INCREMENT,
  `mname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `alias` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '别名',
  `intro` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '简介',
  `imdbUrl` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'imdb链接',
  `language` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `releaseDate` date NULL DEFAULT NULL COMMENT '上映日期',
  `duration` int(4) NOT NULL COMMENT '电影时长',
  PRIMARY KEY (`mid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movie
-- ----------------------------
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

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture`  (
  `picid` int(10) NOT NULL,
  `piclocation` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`picid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES (1, 'd:\\database\\img\\1.jpg');
INSERT INTO `picture` VALUES (2, 'd:\\database\\img\\2.jpg');
INSERT INTO `picture` VALUES (3, 'd:\\database\\img\\3.jpg');
INSERT INTO `picture` VALUES (4, 'd:\\database\\img\\4.jpg');
INSERT INTO `picture` VALUES (5, 'd:\\database\\img\\5.jpg');
INSERT INTO `picture` VALUES (6, 'd:\\database\\img\\6.jpg');
INSERT INTO `picture` VALUES (7, 'd:\\database\\img\\7.jpg');
INSERT INTO `picture` VALUES (8, 'd:\\database\\img\\8.jpg');
INSERT INTO `picture` VALUES (9, 'd:\\database\\img\\9.jpg');
INSERT INTO `picture` VALUES (10, 'd:\\database\\img\\10.jpg');
INSERT INTO `picture` VALUES (11, 'd:\\database\\img\\11.jpg');
INSERT INTO `picture` VALUES (12, 'd:\\database\\img\\12.jpg');
INSERT INTO `picture` VALUES (13, 'd:\\database\\img\\13.jpg');
INSERT INTO `picture` VALUES (14, 'd:\\database\\img\\14.jpg');

-- ----------------------------
-- Table structure for picturemovie
-- ----------------------------
DROP TABLE IF EXISTS `picturemovie`;
CREATE TABLE `picturemovie`  (
  `mid` int(10) NOT NULL,
  `picid` int(10) NOT NULL,
  PRIMARY KEY (`picid`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  CONSTRAINT `picturemovie_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `movie` (`mid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of picturemovie
-- ----------------------------
INSERT INTO `picturemovie` VALUES (1, 3);
INSERT INTO `picturemovie` VALUES (2, 2);
INSERT INTO `picturemovie` VALUES (3, 1);
INSERT INTO `picturemovie` VALUES (4, 5);
INSERT INTO `picturemovie` VALUES (4, 9);
INSERT INTO `picturemovie` VALUES (5, 4);
INSERT INTO `picturemovie` VALUES (5, 11);
INSERT INTO `picturemovie` VALUES (5, 14);
INSERT INTO `picturemovie` VALUES (6, 6);
INSERT INTO `picturemovie` VALUES (7, 7);
INSERT INTO `picturemovie` VALUES (8, 8);
INSERT INTO `picturemovie` VALUES (9, 10);
INSERT INTO `picturemovie` VALUES (10, 13);
INSERT INTO `picturemovie` VALUES (11, 12);

-- ----------------------------
-- Table structure for playwright
-- ----------------------------
DROP TABLE IF EXISTS `playwright`;
CREATE TABLE `playwright`  (
  `playwrightid` int(10) NOT NULL AUTO_INCREMENT,
  `playwrightname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`playwrightid`) USING BTREE,
  INDEX `playwrightid`(`playwrightid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of playwright
-- ----------------------------
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
-- Records of playwrightmovie
-- ----------------------------
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
-- Records of tag
-- ----------------------------
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

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `typeid` int(10) NOT NULL,
  `typename` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`typeid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '剧情');
INSERT INTO `type` VALUES (2, '悬疑');
INSERT INTO `type` VALUES (3, '惊悚');
INSERT INTO `type` VALUES (4, '喜剧');
INSERT INTO `type` VALUES (5, '动作');
INSERT INTO `type` VALUES (6, '武侠');
INSERT INTO `type` VALUES (7, '古装');
INSERT INTO `type` VALUES (8, '爱情');
INSERT INTO `type` VALUES (9, '战争');
INSERT INTO `type` VALUES (10, '奇幻');
INSERT INTO `type` VALUES (11, '冒险');
INSERT INTO `type` VALUES (12, '家庭');
INSERT INTO `type` VALUES (13, '西部');
INSERT INTO `type` VALUES (14, '歌舞');

-- ----------------------------
-- Table structure for typemovie
-- ----------------------------
DROP TABLE IF EXISTS `typemovie`;
CREATE TABLE `typemovie`  (
  `mid` int(10) NOT NULL,
  `typeid` int(10) NOT NULL,
  PRIMARY KEY (`mid`, `typeid`) USING BTREE,
  INDEX `typeid`(`typeid`) USING BTREE,
  CONSTRAINT `typemovie_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `movie` (`mid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `typemovie_ibfk_2` FOREIGN KEY (`typeid`) REFERENCES `type` (`typeid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of typemovie
-- ----------------------------
INSERT INTO `typemovie` VALUES (1, 1);
INSERT INTO `typemovie` VALUES (2, 1);
INSERT INTO `typemovie` VALUES (3, 1);
INSERT INTO `typemovie` VALUES (5, 1);
INSERT INTO `typemovie` VALUES (6, 1);
INSERT INTO `typemovie` VALUES (8, 1);
INSERT INTO `typemovie` VALUES (10, 1);
INSERT INTO `typemovie` VALUES (11, 1);
INSERT INTO `typemovie` VALUES (11, 2);
INSERT INTO `typemovie` VALUES (11, 3);
INSERT INTO `typemovie` VALUES (1, 4);
INSERT INTO `typemovie` VALUES (5, 4);
INSERT INTO `typemovie` VALUES (10, 4);
INSERT INTO `typemovie` VALUES (3, 5);
INSERT INTO `typemovie` VALUES (5, 5);
INSERT INTO `typemovie` VALUES (7, 5);
INSERT INTO `typemovie` VALUES (9, 5);
INSERT INTO `typemovie` VALUES (3, 6);
INSERT INTO `typemovie` VALUES (3, 7);
INSERT INTO `typemovie` VALUES (2, 8);
INSERT INTO `typemovie` VALUES (4, 8);
INSERT INTO `typemovie` VALUES (6, 8);
INSERT INTO `typemovie` VALUES (8, 8);
INSERT INTO `typemovie` VALUES (10, 8);
INSERT INTO `typemovie` VALUES (2, 9);
INSERT INTO `typemovie` VALUES (4, 10);
INSERT INTO `typemovie` VALUES (7, 10);
INSERT INTO `typemovie` VALUES (7, 11);
INSERT INTO `typemovie` VALUES (8, 12);
INSERT INTO `typemovie` VALUES (8, 13);
INSERT INTO `typemovie` VALUES (10, 14);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `uname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
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

SET FOREIGN_KEY_CHECKS = 1;
