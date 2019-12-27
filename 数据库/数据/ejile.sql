/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : 120.27.243.204:3306
 Source Schema         : ejile

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 27/12/2019 09:53:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `aId` int(11) NOT NULL AUTO_INCREMENT,
  `aName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `aPassword` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`aId`) USING BTREE,
  UNIQUE INDEX `table_name_aName_uindex`(`aName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'mai', 'f341f0baada9024a9b2b47118f6bac0f');

-- ----------------------------
-- Table structure for commentary
-- ----------------------------
DROP TABLE IF EXISTS `commentary`;
CREATE TABLE `commentary`  (
  `CoID` int(11) NOT NULL AUTO_INCREMENT,
  `CoTime` datetime(0) NOT NULL,
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `stars` int(11) NULL DEFAULT NULL,
  `Cid` int(11) NOT NULL,
  `SID` int(11) NOT NULL,
  PRIMARY KEY (`CoID`) USING BTREE,
  INDEX `Cid`(`Cid`) USING BTREE,
  INDEX `SID`(`SID`) USING BTREE,
  CONSTRAINT `commentary_ibfk_1` FOREIGN KEY (`Cid`) REFERENCES `consumer` (`cId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `commentary_ibfk_2` FOREIGN KEY (`SID`) REFERENCES `shop` (`sId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commentary
-- ----------------------------
INSERT INTO `commentary` VALUES (2, '2019-11-24 23:47:01', 'Just so so', 3, 2, 1);
INSERT INTO `commentary` VALUES (3, '2019-11-24 12:33:17', 'Bad!', 1, 2, 1);
INSERT INTO `commentary` VALUES (4, '2019-11-24 00:00:00', 'dada', 5, 2, 2);
INSERT INTO `commentary` VALUES (5, '2019-11-24 23:46:17', 'dada', 5, 2, 2);
INSERT INTO `commentary` VALUES (6, '2019-11-24 23:47:01', 'dada', 5, 2, 2);
INSERT INTO `commentary` VALUES (7, '2019-11-12 16:18:00', 'woc', 5, 1, 1);
INSERT INTO `commentary` VALUES (8, '2019-11-16 09:57:51', 'kfannajgnanjnnnn', 5, 1, 1);
INSERT INTO `commentary` VALUES (9, '2019-11-16 10:01:55', 'jsglsjgls', 5, 1, 1);
INSERT INTO `commentary` VALUES (10, '2019-11-16 11:14:05', 'haoyayayayayaa', 5, 1, 1);
INSERT INTO `commentary` VALUES (11, '2019-11-16 11:14:39', 'niganma', 5, 1, 1);
INSERT INTO `commentary` VALUES (12, '2019-11-16 11:15:51', 'gjhvgjvj', 5, 1, 1);
INSERT INTO `commentary` VALUES (13, '2019-11-16 11:30:54', 'nihaoya', 5, 1, 1);

-- ----------------------------
-- Table structure for consumer
-- ----------------------------
DROP TABLE IF EXISTS `consumer`;
CREATE TABLE `consumer`  (
  `cId` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cSex` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cAge` smallint(6) NULL DEFAULT NULL,
  `cTel` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cEmail` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cAddress` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cPassword` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cBalance` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`cId`) USING BTREE,
  UNIQUE INDEX `cName`(`cName`) USING BTREE,
  UNIQUE INDEX `consumer_cTel_uindex`(`cTel`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of consumer
-- ----------------------------
INSERT INTO `consumer` VALUES (1, 'Zhang San', '男', 1, '13959257650', '1@2', 'haiyun', '597c6007a594a848199f14766cd74cb8', 2.34);
INSERT INTO `consumer` VALUES (2, '李四', '男', 18, '13306325913', NULL, '厦门市思明区', '654321', NULL);
INSERT INTO `consumer` VALUES (3, '王少', NULL, NULL, '18765467678', '465321687@qq.com', NULL, '987456', NULL);
INSERT INTO `consumer` VALUES (4, 'ajfakjf', '男', NULL, '18308909098', NULL, NULL, '123456', NULL);
INSERT INTO `consumer` VALUES (5, '王五', '男', 18, '18976543567', '', NULL, '123', 100.00);
INSERT INTO `consumer` VALUES (10, 'hyttyh', NULL, 13, '14567432786', NULL, NULL, '18888', 0.00);
INSERT INTO `consumer` VALUES (17, 'lizn', NULL, NULL, '12345678908', NULL, NULL, 'haode', 0.00);
INSERT INTO `consumer` VALUES (20, 'atom', '男', 1, '15396277909', '123@mail', '465664', '4c9d7078a7be0f6fb30c1128210cc01e', 0.00);
INSERT INTO `consumer` VALUES (21, 'test', NULL, NULL, '13826539608', NULL, NULL, '3e4b7f2e79bbb0fc5528c2ca5110a887', 0.00);
INSERT INTO `consumer` VALUES (22, '123456', NULL, NULL, '13433647567', NULL, NULL, 'bf4274fff97184978871696abce1935a', 0.00);
INSERT INTO `consumer` VALUES (24, 'smile', NULL, NULL, '15625853354', NULL, NULL, 'de1bec463d167c056fbfdd35f114ae09', 0.00);

-- ----------------------------
-- Table structure for consumerreply
-- ----------------------------
DROP TABLE IF EXISTS `consumerreply`;
CREATE TABLE `consumerreply`  (
  `CID` int(11) NOT NULL,
  `CoID` int(11) NOT NULL,
  `CoTime` datetime(0) NOT NULL,
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`CID`, `CoID`, `CoTime`) USING BTREE,
  INDEX `consumerreply_ibfk_2`(`CoID`) USING BTREE,
  CONSTRAINT `consumerreply_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `consumer` (`cId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `consumerreply_ibfk_2` FOREIGN KEY (`CoID`) REFERENCES `commentary` (`CoID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of consumerreply
-- ----------------------------
INSERT INTO `consumerreply` VALUES (1, 2, '2019-11-26 22:36:43', '爱你三千遍！');
INSERT INTO `consumerreply` VALUES (1, 2, '2019-11-27 16:48:57', 'hgfgfjhg');
INSERT INTO `consumerreply` VALUES (1, 3, '2019-11-26 22:38:46', '上面的Thank you做什么？');
INSERT INTO `consumerreply` VALUES (2, 3, '2019-11-24 12:33:17', 'Just so so');
INSERT INTO `consumerreply` VALUES (20, 3, '2019-11-20 11:23:17', '可恶');

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `c_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sid` int(11) NOT NULL,
  `s_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `c_time` datetime(0) NOT NULL,
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `c_state` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_read` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `SID`(`sid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contact
-- ----------------------------
INSERT INTO `contact` VALUES (1, 21, 'test', 1, 'mai', '2019-11-15 15:44:11', 'test', '0', '1');
INSERT INTO `contact` VALUES (2, 21, 'test', 1, 'mai', '2019-11-15 16:37:20', '1111', '0', '1');
INSERT INTO `contact` VALUES (3, 21, 'test', 1, 'mai', '2019-11-15 16:38:47', '11111', '0', '1');
INSERT INTO `contact` VALUES (4, 21, 'test', 1, 'mai', '2019-11-16 10:30:11', 'a', '0', '1');
INSERT INTO `contact` VALUES (5, 21, 'test', 1, 'mai', '2019-11-16 10:30:14', 'sdads', '0', '1');
INSERT INTO `contact` VALUES (6, 21, 'test', 1, 'mai', '2019-11-16 10:30:18', 'dsad', '0', '1');
INSERT INTO `contact` VALUES (7, 21, 'test', 1, 'mai', '2019-11-16 10:30:51', 'd', '0', '1');
INSERT INTO `contact` VALUES (8, 21, 'test', 1, 'mai', '2019-11-26 15:05:48', '111', '0', '1');
INSERT INTO `contact` VALUES (9, 21, 'test', 1, 'mai', '2019-11-26 15:36:45', '2', '0', '1');
INSERT INTO `contact` VALUES (10, 21, 'test', 1, 'mai', '2019-11-28 15:56:41', '3', '0', '1');
INSERT INTO `contact` VALUES (11, 21, 'test', 1, 'mai', '2019-11-28 15:56:42', '2', '0', '1');
INSERT INTO `contact` VALUES (12, 21, 'test', 1, 'mai', '2019-11-28 15:56:46', '3', '0', '1');
INSERT INTO `contact` VALUES (13, 21, 'test', 2, '益合堂', '2019-11-28 16:01:32', 'DSADA', '0', '0');
INSERT INTO `contact` VALUES (14, 21, 'test', 4, '东北饺子馆', '2019-11-29 09:19:55', '1231', '0', '0');
INSERT INTO `contact` VALUES (15, 21, 'test', 1, 'mai', '2019-12-06 10:39:06', '111', '0', '1');
INSERT INTO `contact` VALUES (16, 21, 'test', 1, 'mai', '2019-12-06 10:46:37', 'dasda111111', '0', '1');
INSERT INTO `contact` VALUES (17, 21, 'test', 1, 'mai', '2019-12-06 10:48:15', '1231231321', '0', '1');
INSERT INTO `contact` VALUES (18, 21, 'test', 1, 'mai', '2019-12-06 10:49:48', '1', '1', '1');
INSERT INTO `contact` VALUES (19, 21, 'test', 1, 'mai', '2019-12-06 10:49:52', '111', '0', '1');
INSERT INTO `contact` VALUES (20, 21, 'test', 1, 'mai', '2019-12-07 09:04:34', '111', '1', '1');
INSERT INTO `contact` VALUES (21, 21, 'test', 1, 'mai', '2019-12-07 09:04:52', '1111', '1', '1');
INSERT INTO `contact` VALUES (22, 21, 'test', 1, 'mai', '2019-12-07 09:05:59', '123', '1', '1');
INSERT INTO `contact` VALUES (23, 21, 'test', 1, 'mai', '2019-12-07 09:08:52', '12312', '1', '1');
INSERT INTO `contact` VALUES (24, 21, 'test', 1, 'mai', '2019-12-07 09:09:01', '11111111', '1', '1');
INSERT INTO `contact` VALUES (25, 21, 'test', 1, 'mai', '2019-12-26 15:35:05', '111', '0', '1');
INSERT INTO `contact` VALUES (26, 21, 'test', 1, 'mai', '2019-12-26 15:36:05', '111', '0', '1');
INSERT INTO `contact` VALUES (27, 21, 'test', 1, 'mai', '2019-12-26 15:44:45', '11', '0', '1');
INSERT INTO `contact` VALUES (28, 21, 'test', 1, 'mai', '2019-12-26 15:47:13', '111', '0', '1');
INSERT INTO `contact` VALUES (29, 21, 'test', 1, 'mai', '2019-12-26 15:49:10', 'test', '0', '1');
INSERT INTO `contact` VALUES (30, 21, 'test', 1, 'mai', '2019-12-26 15:49:14', 'test', '0', '1');
INSERT INTO `contact` VALUES (31, 21, 'test', 1, 'mai', '2019-12-26 15:51:29', 'test', '0', '1');
INSERT INTO `contact` VALUES (32, 21, 'test', 1, 'mai', '2019-12-26 15:51:47', 'test', '0', '1');
INSERT INTO `contact` VALUES (33, 21, 'test', 1, 'mai', '2019-12-26 15:53:04', 'test', '0', '1');
INSERT INTO `contact` VALUES (34, 21, 'test', 1, 'mai', '2019-12-26 15:55:10', 'test', '0', '1');
INSERT INTO `contact` VALUES (35, 21, 'test', 1, 'mai', '2019-12-26 16:03:39', 'test', '0', '1');
INSERT INTO `contact` VALUES (36, 21, 'test', 1, 'mai', '2019-12-26 16:03:57', 'ok', '1', '1');
INSERT INTO `contact` VALUES (37, 21, 'test', 1, 'mai', '2019-12-26 16:35:05', '213', '1', '1');
INSERT INTO `contact` VALUES (38, 21, 'test', 1, 'mai', '2019-12-26 16:50:22', 'test', '1', '1');
INSERT INTO `contact` VALUES (39, 21, 'test', 1, 'mai', '2019-12-26 16:51:19', 'TEST', '1', '1');
INSERT INTO `contact` VALUES (40, 21, 'test', 1, 'mai', '2019-12-26 16:52:31', '111', '0', '1');
INSERT INTO `contact` VALUES (41, 21, 'test', 1, 'mai', '2019-12-26 16:53:16', 'HI', '1', '1');
INSERT INTO `contact` VALUES (42, 21, 'test', 1, 'mai', '2019-12-26 16:53:54', '1111', '1', '1');
INSERT INTO `contact` VALUES (43, 21, 'test', 1, 'mai', '2019-12-26 16:54:24', 'test', '1', '1');
INSERT INTO `contact` VALUES (44, 21, 'test', 1, 'mai', '2019-12-26 16:54:39', 'test', '1', '1');
INSERT INTO `contact` VALUES (45, 21, 'test', 1, 'mai', '2019-12-26 16:55:19', 'test', '1', '1');
INSERT INTO `contact` VALUES (46, 21, 'test', 1, 'mai', '2019-12-26 16:56:04', '111', '1', '1');
INSERT INTO `contact` VALUES (47, 21, 'test', 1, 'mai', '2019-12-26 16:56:31', 'HI', '1', '1');
INSERT INTO `contact` VALUES (48, 21, 'test', 1, 'mai', '2019-12-26 16:57:12', 'wqeqw', '1', '1');
INSERT INTO `contact` VALUES (49, 21, 'test', 1, 'mai', '2019-12-26 16:57:32', 'asda', '1', '1');
INSERT INTO `contact` VALUES (50, 21, 'test', 1, 'mai', '2019-12-26 16:59:13', 'asda', '0', '1');
INSERT INTO `contact` VALUES (51, 21, 'test', 1, 'mai', '2019-12-26 16:59:18', 'ddd', '1', '0');
INSERT INTO `contact` VALUES (52, 21, 'test', 1, 'mai', '2019-12-26 17:00:44', 'sadas', '1', '0');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `gId` int(11) NOT NULL AUTO_INCREMENT,
  `gName` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `gPrice` decimal(10, 2) NOT NULL,
  `stock` int(11) NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `buyCount` int(11) NOT NULL DEFAULT 0,
  `gPictureUrl` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gPraise` decimal(2, 2) NULL DEFAULT NULL,
  `sId` int(11) NOT NULL,
  `desc` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`gId`) USING BTREE,
  INDEX `sId`(`sId`) USING BTREE,
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`sId`) REFERENCES `shop` (`sId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (3, '炒面', 200.00, 0, '主食', 332, 'http://localhost:8080/ejile/upload/201907160921343.jpg', 0.00, 1, '好康的，也是好吃的');
INSERT INTO `goods` VALUES (5, '薄荷', 200.00, 9982, '小吃', 19, 'http://localhost:8080/ejile/upload/201907022119344.jpg', 0.85, 1, '很贵哟，慎重购买');
INSERT INTO `goods` VALUES (6, '千叶豆腐', 22.00, 13, '主食', 9, 'http://localhost:8080/ejile/upload/201907141207575.jpg', 0.00, 1, 'HYT经常吃');
INSERT INTO `goods` VALUES (17, '水果捞', 20.00, 11, '小吃', 2, 'http://localhost:8080/ejile/upload/201907022119591.jpg', 0.00, 1, '一会他们就要去买了');
INSERT INTO `goods` VALUES (22, '烤鲈鱼', 120.00, 25, '主食', 659, 'http://localhost:8080/ejile/upload/201907022120098.jpg', 0.00, 1, '谁脱单谁请客！');
INSERT INTO `goods` VALUES (23, '口水鸡', 30.00, 19, '小吃', 6, 'http://localhost:8080/ejile/upload/201907022120527.jpg', 0.00, 1, '真的好吃');
INSERT INTO `goods` VALUES (24, '辣子鸡', 20.00, 18, '小吃', 76, 'http://localhost:8080/ejile/upload/201907022121279.jpg', 0.00, 1, '触动你火辣的心！');
INSERT INTO `goods` VALUES (25, '炒饭', 19.00, 84, '主食', 10, 'http://localhost:8080/ejile/upload/201907022122326.jpg', 0.00, 1, '有坤的最爱！');
INSERT INTO `goods` VALUES (26, '干锅包菜', 15.00, 14, '主食', 537, 'http://localhost:8080/ejile/upload/2019070221230510.jpg', 0.00, 1, '锅会干，但你的心不会！');
INSERT INTO `goods` VALUES (27, '可口可乐', 5.00, 900, '饮料', 53, 'http://localhost:8080/ejile/upload/2019070221263112.jpg', 0.00, 1, '一个肥宅简简单单的快落');
INSERT INTO `goods` VALUES (28, '农夫山泉', 3.00, 900, '饮料', 64, 'http://localhost:8080/ejile/upload/2019070221272613.jpg', 0.00, 1, '农夫三拳，有点疼！');
INSERT INTO `goods` VALUES (29, '海南牌椰汁', 5.00, 199, '小吃', 75, 'http://localhost:8080/ejile/upload/2019070221280314.jpg', 0.00, 1, '我从小喝到大！');
INSERT INTO `goods` VALUES (30, '薄荷汁', 6.00, 100, '饮料', 8, 'http://localhost:8080/ejile/upload/2019070221284411.jpg', 0.00, 1, '凉透你的心扉！');
INSERT INTO `goods` VALUES (31, 'fan', 10.00, 9, '主食', 76, 'http://localhost:8080/ejile/upload/201907031009226.jpg', 0.00, 1, '好吃');
INSERT INTO `goods` VALUES (32, '加滑稽', 12.00, 13, '小吃', 34, 'http://localhost:8080/ejile/upload/201907141439312.jpg', 0.00, 1, '好吃的');
INSERT INTO `goods` VALUES (33, '千叶豆腐', 22.00, 20, '主食', 86, 'http://localhost:8080/ejile/upload/201907141208245.jpg', 0.00, 1, 'HYT经常吃');

-- ----------------------------
-- Table structure for message_contact
-- ----------------------------
DROP TABLE IF EXISTS `message_contact`;
CREATE TABLE `message_contact`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_id` bigint(20) NULL DEFAULT NULL,
  `from_user` int(10) NULL DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `message_type` int(1) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `to_id` bigint(20) NULL DEFAULT NULL,
  `to_user` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for orderhistory
-- ----------------------------
DROP TABLE IF EXISTS `orderhistory`;
CREATE TABLE `orderhistory`  (
  `oId` int(11) NOT NULL AUTO_INCREMENT,
  `oState` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `oTime` datetime(0) NOT NULL,
  `oNum` int(11) NOT NULL,
  `cost` decimal(10, 2) NOT NULL,
  `CID` int(11) NOT NULL,
  `GID` int(11) NOT NULL,
  PRIMARY KEY (`oId`) USING BTREE,
  INDEX `orderhistory_goods__fk`(`GID`) USING BTREE,
  INDEX `orderhistory_ibfk_1`(`CID`) USING BTREE,
  CONSTRAINT `orderhistory_goods__fk` FOREIGN KEY (`GID`) REFERENCES `goods` (`gId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderhistory_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `consumer` (`cId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderhistory
-- ----------------------------
INSERT INTO `orderhistory` VALUES (4, '已完成', '2019-11-01 02:03:21', 12, 100.00, 1, 3);
INSERT INTO `orderhistory` VALUES (5, '待评价', '2019-11-12 00:00:00', 1, 200.00, 1, 5);
INSERT INTO `orderhistory` VALUES (6, '已完成', '2019-11-12 00:00:00', 1, 200.00, 1, 3);
INSERT INTO `orderhistory` VALUES (7, '已取消', '2019-11-12 00:00:00', 2, 200.00, 1, 3);
INSERT INTO `orderhistory` VALUES (8, '已取消', '2019-11-12 00:00:00', 2, 3.00, 1, 28);
INSERT INTO `orderhistory` VALUES (9, '已取消', '2019-11-12 00:00:00', 8, 200.00, 1, 3);
INSERT INTO `orderhistory` VALUES (10, '未完成', '2019-11-12 00:00:00', 10, 200.00, 1, 3);
INSERT INTO `orderhistory` VALUES (11, '未完成', '2019-11-12 00:00:00', 2, 200.00, 1, 3);
INSERT INTO `orderhistory` VALUES (12, '未完成', '2019-11-12 00:00:00', 2, 200.00, 1, 3);
INSERT INTO `orderhistory` VALUES (13, '未完成', '2019-11-13 00:00:00', 1, 6.00, 1, 30);
INSERT INTO `orderhistory` VALUES (14, '待评价', '2019-11-14 20:50:34', 1, 200.00, 1, 3);
INSERT INTO `orderhistory` VALUES (15, '待评价', '2019-11-15 11:01:57', 1, 22.00, 1, 6);
INSERT INTO `orderhistory` VALUES (16, '未完成', '2019-11-15 17:04:16', 1, 22.00, 1, 33);
INSERT INTO `orderhistory` VALUES (17, '未完成', '2019-11-17 11:39:12', 1, 200.00, 1, 3);
INSERT INTO `orderhistory` VALUES (18, '未完成', '2019-11-17 16:45:16', 3, 120.00, 1, 22);
INSERT INTO `orderhistory` VALUES (19, '未完成', '2019-11-19 19:38:15', 1, 30.00, 1, 23);
INSERT INTO `orderhistory` VALUES (20, '未完成', '2019-11-19 19:41:28', 1, 200.00, 1, 3);
INSERT INTO `orderhistory` VALUES (21, '待评价', '2019-11-20 11:15:18', 3, 19.00, 20, 25);
INSERT INTO `orderhistory` VALUES (22, '已取消', '2019-11-22 09:53:34', 1, 200.00, 1, 3);
INSERT INTO `orderhistory` VALUES (23, '已取消', '2019-11-22 14:48:41', 1, 200.00, 1, 3);
INSERT INTO `orderhistory` VALUES (24, '未完成', '2019-11-22 18:50:18', 1, 200.00, 1, 5);
INSERT INTO `orderhistory` VALUES (25, '未完成', '2019-11-22 18:51:39', 1, 200.00, 1, 5);
INSERT INTO `orderhistory` VALUES (26, '未完成', '2019-11-22 19:15:41', 1, 200.00, 1, 5);
INSERT INTO `orderhistory` VALUES (27, '未完成', '2019-11-22 19:15:41', 1, 120.00, 1, 22);
INSERT INTO `orderhistory` VALUES (28, '未完成', '2019-11-22 19:18:24', 1, 200.00, 1, 3);
INSERT INTO `orderhistory` VALUES (29, '未完成', '2019-11-22 19:18:24', 1, 200.00, 1, 5);
INSERT INTO `orderhistory` VALUES (30, '未完成', '2019-11-22 19:18:24', 1, 120.00, 1, 22);
INSERT INTO `orderhistory` VALUES (31, '待评价', '2019-11-23 16:55:47', 2, 22.00, 1, 6);
INSERT INTO `orderhistory` VALUES (32, '未完成', '2019-11-23 16:55:47', 2, 20.00, 1, 24);
INSERT INTO `orderhistory` VALUES (33, '待评价', '2019-11-23 18:22:12', 2, 22.00, 1, 6);
INSERT INTO `orderhistory` VALUES (34, '未完成', '2019-11-24 13:22:16', 1, 200.00, 1, 5);
INSERT INTO `orderhistory` VALUES (35, '待评价', '2019-11-24 13:22:16', 1, 22.00, 1, 6);
INSERT INTO `orderhistory` VALUES (36, '待评价', '2019-11-24 13:22:16', 1, 120.00, 1, 22);
INSERT INTO `orderhistory` VALUES (37, '待评价', '2019-11-24 13:22:16', 1, 20.00, 1, 24);
INSERT INTO `orderhistory` VALUES (38, '待评价', '2019-11-24 13:22:16', 1, 5.00, 1, 29);
INSERT INTO `orderhistory` VALUES (39, '待评价', '2019-11-24 13:22:16', 1, 10.00, 1, 31);
INSERT INTO `orderhistory` VALUES (40, '待评价', '2019-11-24 20:45:57', 3, 200.00, 1, 5);
INSERT INTO `orderhistory` VALUES (41, '未完成', '2019-11-24 20:51:00', 1, 200.00, 1, 3);
INSERT INTO `orderhistory` VALUES (42, '待评价', '2019-11-24 20:51:17', 1, 200.00, 1, 5);
INSERT INTO `orderhistory` VALUES (43, '未完成', '2019-11-24 20:51:52', 1, 200.00, 1, 5);
INSERT INTO `orderhistory` VALUES (44, '未完成', '2019-11-24 20:52:03', 1, 200.00, 1, 5);
INSERT INTO `orderhistory` VALUES (45, '待评价', '2019-11-24 20:52:53', 1, 200.00, 1, 5);
INSERT INTO `orderhistory` VALUES (46, '待评价', '2019-11-24 20:53:40', 1, 200.00, 1, 5);
INSERT INTO `orderhistory` VALUES (47, '待评价', '2019-11-24 20:55:28', 1, 200.00, 1, 5);
INSERT INTO `orderhistory` VALUES (48, '待评价', '2019-11-24 20:55:49', 1, 200.00, 1, 5);
INSERT INTO `orderhistory` VALUES (49, '待评价', '2019-11-24 20:57:14', 1, 200.00, 1, 5);
INSERT INTO `orderhistory` VALUES (50, '已完成', '2019-11-24 20:57:26', 1, 200.00, 1, 5);
INSERT INTO `orderhistory` VALUES (51, '待评价', '2019-11-24 21:02:35', 1, 200.00, 1, 5);
INSERT INTO `orderhistory` VALUES (52, '待评价', '2019-11-24 21:02:54', 1, 22.00, 1, 6);
INSERT INTO `orderhistory` VALUES (53, '已完成', '2019-11-25 08:30:09', 1, 200.00, 1, 5);
INSERT INTO `orderhistory` VALUES (54, '已完成', '2019-11-25 08:45:21', 3, 200.00, 1, 5);
INSERT INTO `orderhistory` VALUES (55, '已完成', '2019-11-25 08:45:21', 1, 120.00, 1, 22);
INSERT INTO `orderhistory` VALUES (56, '已完成', '2019-11-25 17:29:00', 1, 200.00, 1, 5);
INSERT INTO `orderhistory` VALUES (57, '已完成', '2019-11-25 17:29:00', 1, 120.00, 1, 22);
INSERT INTO `orderhistory` VALUES (58, '已完成', '2019-11-25 17:29:00', 2, 19.00, 1, 25);
INSERT INTO `orderhistory` VALUES (59, '待评价', '2019-11-25 23:43:15', 1, 200.00, 1, 5);
INSERT INTO `orderhistory` VALUES (60, '待评价', '2019-11-25 23:43:15', 1, 22.00, 1, 6);
INSERT INTO `orderhistory` VALUES (61, '待评价', '2019-11-25 23:43:15', 2, 120.00, 1, 22);
INSERT INTO `orderhistory` VALUES (62, '待评价', '2019-11-25 23:43:15', 1, 30.00, 1, 23);
INSERT INTO `orderhistory` VALUES (63, '已完成', '2019-11-25 23:43:15', 1, 19.00, 1, 25);
INSERT INTO `orderhistory` VALUES (64, '待评价', '2019-11-25 23:43:15', 1, 15.00, 1, 26);
INSERT INTO `orderhistory` VALUES (65, '未完成', '2019-12-26 16:32:57', 1, 200.00, 21, 3);
INSERT INTO `orderhistory` VALUES (66, '待评价', '2019-12-26 16:34:18', 1, 200.00, 21, 3);

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop`  (
  `sId` int(11) NOT NULL AUTO_INCREMENT,
  `sName` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sPassword` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sTel` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sAddress` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `managerName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `managerEmail` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sPictureUrl` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `score` decimal(2, 1) NULL DEFAULT NULL,
  PRIMARY KEY (`sId`) USING BTREE,
  UNIQUE INDEX `sName`(`sName`) USING BTREE,
  UNIQUE INDEX `shop_sTel_uindex`(`sTel`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES (1, 'mai', 'f341f0baada9024a9b2b47118f6bac0f', '18308958589', '海韵一条街', '花展枝', 'mlfaf', NULL, 4.5);
INSERT INTO `shop` VALUES (2, '益合堂', '789954', '11111111111', '海韵一条街', 'hzoaixn', NULL, NULL, NULL);
INSERT INTO `shop` VALUES (3, '黄焖鸡', '444451', '10989786543', '海韵一条街', 'llll', NULL, NULL, 4.2);
INSERT INTO `shop` VALUES (4, '东北饺子馆', '3131093', '13959687541', '海韵下坡路', 'wangzi', '22@33', NULL, 1.0);
INSERT INTO `shop` VALUES (8, 'kaige', '18976', '17865453789', 'beijings', 'kaige', NULL, NULL, NULL);
INSERT INTO `shop` VALUES (9, 'bgjakgjjhk', '3131093', '12345654348', 'fahuajfj', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart`  (
  `CID` int(11) NOT NULL,
  `GID` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `total` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`CID`, `GID`) USING BTREE,
  INDEX `shoppingcart_ibfk_2`(`GID`) USING BTREE,
  CONSTRAINT `shoppingcart_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `consumer` (`cId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shoppingcart_ibfk_2` FOREIGN KEY (`GID`) REFERENCES `goods` (`gId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------
INSERT INTO `shoppingcart` VALUES (1, 3, 1, 200.00);
INSERT INTO `shoppingcart` VALUES (1, 5, 3, 600.00);
INSERT INTO `shoppingcart` VALUES (20, 3, 1, 200.00);
INSERT INTO `shoppingcart` VALUES (20, 22, 18, 2160.00);

-- ----------------------------
-- Table structure for shopreply
-- ----------------------------
DROP TABLE IF EXISTS `shopreply`;
CREATE TABLE `shopreply`  (
  `SID` int(11) NOT NULL,
  `CoID` int(11) NOT NULL,
  `CoTime` datetime(0) NOT NULL,
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`SID`, `CoID`, `CoTime`) USING BTREE,
  INDEX `shopreply_ibfk_2`(`CoID`) USING BTREE,
  CONSTRAINT `shopreply_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `shop` (`sId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shopreply_ibfk_2` FOREIGN KEY (`CoID`) REFERENCES `commentary` (`CoID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopreply
-- ----------------------------
INSERT INTO `shopreply` VALUES (1, 2, '2019-11-17 16:41:56', 'haoya');
INSERT INTO `shopreply` VALUES (1, 2, '2019-11-22 08:40:59', '无敌是多么寂寞');
INSERT INTO `shopreply` VALUES (1, 3, '2019-11-14 21:10:20', 'Thank you');
INSERT INTO `shopreply` VALUES (1, 3, '2019-11-17 11:27:27', '你好');
INSERT INTO `shopreply` VALUES (1, 7, '2019-11-24 13:07:11', '干什么腻？');
INSERT INTO `shopreply` VALUES (1, 7, '2019-11-25 17:27:53', 'gjg');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `operation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `use_time` int(11) NULL DEFAULT NULL,
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `params` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 262 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (2, '', '用户登录', 28, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-15 10:59:37');
INSERT INTO `sys_log` VALUES (3, '', '用户购买', 327, 'com.qtztlink.ejile.system.controller.BuyController.confirmItem()', '  CID: 1  GID: 6', '127.0.0.1', '2019-11-15 11:01:57');
INSERT INTO `sys_log` VALUES (4, '', '用户购买', 290, 'com.qtztlink.ejile.system.controller.BuyController.confirmItem()', '  CID: 1  GID: 33', '127.0.0.1', '2019-11-15 17:04:17');
INSERT INTO `sys_log` VALUES (5, '', '用户通过手机验证码登录', 11, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  username: ZhangSan', '127.0.0.1', '2019-11-15 17:48:11');
INSERT INTO `sys_log` VALUES (6, '', '用户通过手机验证码登录', 90, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  username: ZhangSan', '127.0.0.1', '2019-11-15 17:50:01');
INSERT INTO `sys_log` VALUES (7, '', '用户通过手机验证码登录', 33, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  username: Zhang San', '127.0.0.1', '2019-11-15 17:50:30');
INSERT INTO `sys_log` VALUES (8, '', '用户通过手机验证码登录', 30, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  username: Zhang San', '127.0.0.1', '2019-11-15 17:53:04');
INSERT INTO `sys_log` VALUES (9, '', '用户通过手机验证码登录', 40, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  telephone: 13959257650', '127.0.0.1', '2019-11-15 18:01:30');
INSERT INTO `sys_log` VALUES (10, '', '商家通过手机验证码登录', 30, 'com.qtztlink.ejile.system.controller.LoginController.shopLoginWithoutPass()', '  telephone: 18308958589', '127.0.0.1', '2019-11-15 18:05:35');
INSERT INTO `sys_log` VALUES (11, '', '用户通过手机验证码登录', 144, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  telephone: 13959257650', '127.0.0.1', '2019-11-15 18:24:11');
INSERT INTO `sys_log` VALUES (12, '', '商家通过手机验证码登录', 2, 'com.qtztlink.ejile.system.controller.LoginController.shopLoginWithoutPass()', '  telephone: 18308958589', '127.0.0.1', '2019-11-15 18:26:34');
INSERT INTO `sys_log` VALUES (13, '', '用户通过密码登录', 33, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-15 18:27:53');
INSERT INTO `sys_log` VALUES (14, '', '用户通过密码登录', 37, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-16 16:21:43');
INSERT INTO `sys_log` VALUES (15, '', '用户通过密码登录', 4, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-16 16:23:24');
INSERT INTO `sys_log` VALUES (16, '', '用户通过密码登录', 3, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-16 16:48:10');
INSERT INTO `sys_log` VALUES (17, '', '商家通过密码登录', 16, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-17 08:53:26');
INSERT INTO `sys_log` VALUES (18, '', '商家通过密码登录', 5, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-17 08:55:03');
INSERT INTO `sys_log` VALUES (19, '', '商家通过密码登录', 3, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-17 08:55:33');
INSERT INTO `sys_log` VALUES (20, '', '商家通过密码登录', 5, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-17 08:55:43');
INSERT INTO `sys_log` VALUES (21, '', '商家通过密码登录', 38, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-17 08:57:36');
INSERT INTO `sys_log` VALUES (22, '', '管理员通过密码登录', 69, 'com.qtztlink.ejile.system.controller.LoginController.adminLogin()', '  username: mai  password: 123', '127.0.0.1', '2019-11-17 09:05:13');
INSERT INTO `sys_log` VALUES (23, '', '管理员通过密码登录', 32, 'com.qtztlink.ejile.system.controller.LoginController.adminLogin()', '  username: mai  password: 123', '127.0.0.1', '2019-11-17 09:08:11');
INSERT INTO `sys_log` VALUES (24, '', '用户通过密码登录', 143, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-17 11:38:11');
INSERT INTO `sys_log` VALUES (25, '', '用户购买', 184, 'com.qtztlink.ejile.system.controller.BuyController.confirmItem()', '  CID: 1  GID: 3', '127.0.0.1', '2019-11-17 11:39:12');
INSERT INTO `sys_log` VALUES (26, '', '商家通过密码登录', 119, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-17 11:39:31');
INSERT INTO `sys_log` VALUES (27, '', '用户通过手机验证码登录', 109, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  telephone: 18308958589', '127.0.0.1', '2019-11-17 16:42:44');
INSERT INTO `sys_log` VALUES (28, '', '用户通过手机验证码登录', 2, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  telephone: 18308958589', '127.0.0.1', '2019-11-17 16:42:55');
INSERT INTO `sys_log` VALUES (29, '', '用户通过手机验证码登录', 79, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  telephone: 13959257650', '127.0.0.1', '2019-11-17 16:43:51');
INSERT INTO `sys_log` VALUES (30, '', '用户购买', 193, 'com.qtztlink.ejile.system.controller.BuyController.confirmItem()', '  CID: 1  GID: 22', '127.0.0.1', '2019-11-17 16:45:17');
INSERT INTO `sys_log` VALUES (31, '', '商家通过密码登录', 140, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-17 16:50:43');
INSERT INTO `sys_log` VALUES (32, '', '用户通过密码登录', 1377, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-17 20:55:56');
INSERT INTO `sys_log` VALUES (33, '', '用户购买', 293, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 3  now: Tue Jul 09 19:41:28 CST 2019', '127.0.0.1', '2019-11-19 19:41:29');
INSERT INTO `sys_log` VALUES (34, '', '管理员通过密码登录', 54, 'com.qtztlink.ejile.system.controller.LoginController.adminLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-20 09:10:01');
INSERT INTO `sys_log` VALUES (35, '', '管理员通过密码登录', 4, 'com.qtztlink.ejile.system.controller.LoginController.adminLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-20 09:10:08');
INSERT INTO `sys_log` VALUES (36, '', '管理员通过密码登录', 22, 'com.qtztlink.ejile.system.controller.LoginController.adminLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-20 09:11:03');
INSERT INTO `sys_log` VALUES (37, '', '管理员通过密码登录', 11, 'com.qtztlink.ejile.system.controller.LoginController.adminLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-20 10:02:32');
INSERT INTO `sys_log` VALUES (38, '', '用户通过密码登录', 138, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-20 10:58:04');
INSERT INTO `sys_log` VALUES (39, '', '用户注册', 149, 'com.qtztlink.ejile.system.controller.SignInController.addAConsumer()', '  name: atom  password: 1234  telephone: 15396277909', '127.0.0.1', '2019-11-20 11:13:14');
INSERT INTO `sys_log` VALUES (40, '', '用户通过手机验证码登录', 3, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  telephone: 15396277909', '127.0.0.1', '2019-11-20 11:14:12');
INSERT INTO `sys_log` VALUES (41, '', '用户购买', 408, 'com.qtztlink.ejile.system.controller.BuyController.confirmItem()', '  CID: 20  GID: 25', '127.0.0.1', '2019-11-20 11:15:19');
INSERT INTO `sys_log` VALUES (42, '', '用户通过密码登录', 30, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-20 17:39:06');
INSERT INTO `sys_log` VALUES (43, '', '商家接单', 767, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 21', '127.0.0.1', '2019-11-20 17:48:41');
INSERT INTO `sys_log` VALUES (44, '', '用户通过密码登录', 124, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-20 18:28:08');
INSERT INTO `sys_log` VALUES (45, '', '商家通过密码登录', 126, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-20 20:53:14');
INSERT INTO `sys_log` VALUES (46, '', '用户通过密码登录', 2, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-20 20:54:23');
INSERT INTO `sys_log` VALUES (47, '', '用户通过密码登录', 2, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: atom  password: 1234', '127.0.0.1', '2019-11-20 20:54:33');
INSERT INTO `sys_log` VALUES (48, '', '商家通过密码登录', 16, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-21 11:21:41');
INSERT INTO `sys_log` VALUES (49, '', '商家通过密码登录', 4, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-21 11:21:41');
INSERT INTO `sys_log` VALUES (50, '', '商家通过密码登录', 5, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-21 11:21:41');
INSERT INTO `sys_log` VALUES (51, '', '商家通过密码登录', 793, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-21 11:21:40');
INSERT INTO `sys_log` VALUES (52, '', '商家通过密码登录', 433, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-21 11:21:40');
INSERT INTO `sys_log` VALUES (53, '', '商家通过密码登录', 3, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-21 11:21:40');
INSERT INTO `sys_log` VALUES (54, '', '商家通过密码登录', 9, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-21 11:46:44');
INSERT INTO `sys_log` VALUES (55, '', '用户通过密码登录', 64, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-21 11:55:55');
INSERT INTO `sys_log` VALUES (56, '', '用户通过密码登录', 321, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-21 17:07:07');
INSERT INTO `sys_log` VALUES (57, '', '用户通过密码登录', 3, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-21 17:45:10');
INSERT INTO `sys_log` VALUES (58, '', '商家通过密码登录', 124, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-22 08:35:45');
INSERT INTO `sys_log` VALUES (59, '', '管理员通过密码登录', 383, 'com.qtztlink.ejile.system.controller.LoginController.adminLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-22 08:56:15');
INSERT INTO `sys_log` VALUES (60, '', '用户通过手机验证码登录', 7, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  telephone: 13959257650', '127.0.0.1', '2019-11-22 09:45:36');
INSERT INTO `sys_log` VALUES (61, '', '用户通过密码登录', 112, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 123456', '127.0.0.1', '2019-11-22 09:46:46');
INSERT INTO `sys_log` VALUES (62, '', '用户通过手机验证码登录', 3, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  telephone: 13959257650', '127.0.0.1', '2019-11-22 09:48:05');
INSERT INTO `sys_log` VALUES (63, '', '商家通过密码登录', 5, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-22 09:50:35');
INSERT INTO `sys_log` VALUES (64, '', '用户通过密码登录', 3, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-22 09:51:17');
INSERT INTO `sys_log` VALUES (65, '', '用户购买', 302, 'com.qtztlink.ejile.system.controller.BuyController.confirmItem()', '  CID: 1  GID: 3', '127.0.0.1', '2019-11-22 09:53:35');
INSERT INTO `sys_log` VALUES (66, '', '商家通过密码登录', 4, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-22 09:54:28');
INSERT INTO `sys_log` VALUES (67, '', '用户通过密码登录', 31, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-22 10:01:53');
INSERT INTO `sys_log` VALUES (68, '', '商家通过密码登录', 95, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-22 11:05:16');
INSERT INTO `sys_log` VALUES (69, '', '用户购买', 366, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 3  now: Fri Jul 12 14:48:41 CST 2019', '127.0.0.1', '2019-11-22 14:48:44');
INSERT INTO `sys_log` VALUES (70, '', '用户取消订单', 140, 'com.qtztlink.ejile.system.controller.ConsumerController.cancelOrder()', '  OID: 22', '127.0.0.1', '2019-11-22 16:16:42');
INSERT INTO `sys_log` VALUES (71, '', '用户评论', 143, 'com.qtztlink.ejile.system.controller.ConsumerController.commentTo()', '  CID: 1  SID: 1  content: woc  stars: 5  date: Fri Jul 12 16:18:00 CST 2019', '127.0.0.1', '2019-11-22 16:18:13');
INSERT INTO `sys_log` VALUES (72, '', '用户购买', 432, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 5  now: Fri Jul 12 18:50:18 CST 2019', '127.0.0.1', '2019-11-22 18:50:19');
INSERT INTO `sys_log` VALUES (73, '', '用户购买', 147, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 5  now: Fri Jul 12 18:51:39 CST 2019', '127.0.0.1', '2019-11-22 18:51:40');
INSERT INTO `sys_log` VALUES (74, '', '用户购买', 154, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 5  now: Fri Jul 12 19:15:41 CST 2019', '127.0.0.1', '2019-11-22 19:15:42');
INSERT INTO `sys_log` VALUES (75, '', '用户购买', 188, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 22  now: Fri Jul 12 19:15:41 CST 2019', '127.0.0.1', '2019-11-22 19:15:42');
INSERT INTO `sys_log` VALUES (76, '', '用户购买', 200, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 3  now: Fri Jul 12 19:18:24 CST 2019', '127.0.0.1', '2019-11-22 19:18:25');
INSERT INTO `sys_log` VALUES (77, '', '用户购买', 294, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 5  now: Fri Jul 12 19:18:24 CST 2019', '127.0.0.1', '2019-11-22 19:18:25');
INSERT INTO `sys_log` VALUES (78, '', '用户购买', 103, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 22  now: Fri Jul 12 19:18:24 CST 2019', '127.0.0.1', '2019-11-22 19:18:26');
INSERT INTO `sys_log` VALUES (79, '', '管理员通过密码登录', 229, 'com.qtztlink.ejile.system.controller.LoginController.adminLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-23 13:20:52');
INSERT INTO `sys_log` VALUES (80, '', '用户通过密码登录', 60, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-23 13:21:19');
INSERT INTO `sys_log` VALUES (81, '', '用户购买', 403, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 6  now: Sat Jul 13 16:55:47 CST 2019', '127.0.0.1', '2019-11-23 16:55:48');
INSERT INTO `sys_log` VALUES (82, '', '用户购买', 111, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 24  now: Sat Jul 13 16:55:47 CST 2019', '127.0.0.1', '2019-11-23 16:55:48');
INSERT INTO `sys_log` VALUES (83, '', '用户购买', 491, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 6  now: Sat Jul 13 18:22:12 CST 2019', '127.0.0.1', '2019-11-23 18:22:14');
INSERT INTO `sys_log` VALUES (84, '', '用户通过密码登录', 92, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-24 12:02:05');
INSERT INTO `sys_log` VALUES (85, '', '商家通过密码登录', 17, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-24 12:02:44');
INSERT INTO `sys_log` VALUES (86, '', '商家接单', 232, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 33', '127.0.0.1', '2019-11-24 12:20:43');
INSERT INTO `sys_log` VALUES (87, '', '商家接单', 129, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 31', '127.0.0.1', '2019-11-24 13:06:26');
INSERT INTO `sys_log` VALUES (88, '', '用户通过密码登录', 3, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-24 13:12:13');
INSERT INTO `sys_log` VALUES (89, '', '商家通过密码登录', 3, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-24 13:22:01');
INSERT INTO `sys_log` VALUES (90, '', '用户购买', 260, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 5  now: Sun Jul 14 13:22:16 CST 2019', '127.0.0.1', '2019-11-24 13:22:17');
INSERT INTO `sys_log` VALUES (91, '', '用户购买', 113, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 6  now: Sun Jul 14 13:22:16 CST 2019', '127.0.0.1', '2019-11-24 13:22:17');
INSERT INTO `sys_log` VALUES (92, '', '用户购买', 113, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 22  now: Sun Jul 14 13:22:16 CST 2019', '127.0.0.1', '2019-11-24 13:22:17');
INSERT INTO `sys_log` VALUES (93, '', '用户购买', 149, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 24  now: Sun Jul 14 13:22:16 CST 2019', '127.0.0.1', '2019-11-24 13:22:18');
INSERT INTO `sys_log` VALUES (94, '', '用户购买', 129, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 29  now: Sun Jul 14 13:22:16 CST 2019', '127.0.0.1', '2019-11-24 13:22:18');
INSERT INTO `sys_log` VALUES (95, '', '用户购买', 113, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 31  now: Sun Jul 14 13:22:16 CST 2019', '127.0.0.1', '2019-11-24 13:22:18');
INSERT INTO `sys_log` VALUES (96, '', '商家接单', 155, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 39', '127.0.0.1', '2019-11-24 13:24:20');
INSERT INTO `sys_log` VALUES (97, '', '商家接单', 153, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 38', '127.0.0.1', '2019-11-24 13:25:06');
INSERT INTO `sys_log` VALUES (98, '', '管理员通过密码登录', 496, 'com.qtztlink.ejile.system.controller.LoginController.adminLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-24 14:41:48');
INSERT INTO `sys_log` VALUES (99, '', '管理员通过密码登录', 2, 'com.qtztlink.ejile.system.controller.LoginController.adminLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-24 15:09:34');
INSERT INTO `sys_log` VALUES (100, '', '管理员通过密码登录', 22, 'com.qtztlink.ejile.system.controller.LoginController.adminLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-24 15:10:40');
INSERT INTO `sys_log` VALUES (101, '', '管理员通过密码登录', 20, 'com.qtztlink.ejile.system.controller.LoginController.adminLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-24 15:11:39');
INSERT INTO `sys_log` VALUES (102, '', '商家接单', 301, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 37', '127.0.0.1', '2019-11-24 16:58:04');
INSERT INTO `sys_log` VALUES (103, '', '用户购买', 787, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 5  now: Sun Jul 14 20:45:57 CST 2019', '127.0.0.1', '2019-11-24 20:46:00');
INSERT INTO `sys_log` VALUES (104, '', '用户购买', 230, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 3  now: Sun Jul 14 20:51:00 CST 2019', '127.0.0.1', '2019-11-24 20:51:02');
INSERT INTO `sys_log` VALUES (105, '', '用户购买', 134, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 5  now: Sun Jul 14 20:51:17 CST 2019', '127.0.0.1', '2019-11-24 20:51:18');
INSERT INTO `sys_log` VALUES (106, '', '用户购买', 112, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 5  now: Sun Jul 14 20:51:52 CST 2019', '127.0.0.1', '2019-11-24 20:51:53');
INSERT INTO `sys_log` VALUES (107, '', '用户购买', 206, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 5  now: Sun Jul 14 20:52:03 CST 2019', '127.0.0.1', '2019-11-24 20:52:04');
INSERT INTO `sys_log` VALUES (108, '', '用户购买', 146, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 5  now: Sun Jul 14 20:52:53 CST 2019', '127.0.0.1', '2019-11-24 20:52:54');
INSERT INTO `sys_log` VALUES (109, '', '用户购买', 267, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 5  now: Sun Jul 14 20:53:40 CST 2019', '127.0.0.1', '2019-11-24 20:53:42');
INSERT INTO `sys_log` VALUES (110, '', '用户购买', 201, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 5  now: Sun Jul 14 20:55:28 CST 2019', '127.0.0.1', '2019-11-24 20:55:30');
INSERT INTO `sys_log` VALUES (111, '', '用户购买', 243, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 5  now: Sun Jul 14 20:55:49 CST 2019', '127.0.0.1', '2019-11-24 20:55:51');
INSERT INTO `sys_log` VALUES (112, '', '用户购买', 119, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 5  now: Sun Jul 14 20:57:14 CST 2019', '127.0.0.1', '2019-11-24 20:57:16');
INSERT INTO `sys_log` VALUES (113, '', '用户购买', 180, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 5  now: Sun Jul 14 20:57:26 CST 2019', '127.0.0.1', '2019-11-24 20:57:28');
INSERT INTO `sys_log` VALUES (114, '', '用户购买', 129, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 5  now: Sun Jul 14 21:02:35 CST 2019', '127.0.0.1', '2019-11-24 21:02:36');
INSERT INTO `sys_log` VALUES (115, '', '用户购买', 140, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 6  now: Sun Jul 14 21:02:54 CST 2019', '127.0.0.1', '2019-11-24 21:02:55');
INSERT INTO `sys_log` VALUES (116, '', '用户购买', 219, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 5  now: Mon Jul 15 08:30:09 CST 2019', '127.0.0.1', '2019-11-25 08:30:10');
INSERT INTO `sys_log` VALUES (117, '', '用户购买', 312, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 5  now: Mon Jul 15 08:45:21 CST 2019', '127.0.0.1', '2019-11-25 08:45:21');
INSERT INTO `sys_log` VALUES (118, '', '用户购买', 112, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 22  now: Mon Jul 15 08:45:21 CST 2019', '127.0.0.1', '2019-11-25 08:45:22');
INSERT INTO `sys_log` VALUES (119, '', '用户通过密码登录', 354, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-25 09:14:29');
INSERT INTO `sys_log` VALUES (120, '', '用户通过手机验证码登录', 22, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  telephone: 139', '127.0.0.1', '2019-11-25 09:58:09');
INSERT INTO `sys_log` VALUES (121, '', '用户通过手机验证码登录', 83, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  telephone: 139', '127.0.0.1', '2019-11-25 09:59:52');
INSERT INTO `sys_log` VALUES (122, '', '用户通过手机验证码登录', 76, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  telephone: 139', '127.0.0.1', '2019-11-25 10:07:30');
INSERT INTO `sys_log` VALUES (123, '', '用户通过手机验证码登录', 69, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  telephone: 139', '127.0.0.1', '2019-11-25 10:10:58');
INSERT INTO `sys_log` VALUES (124, '', '用户通过手机验证码登录', 64, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  telephone: 139', '127.0.0.1', '2019-11-25 10:15:27');
INSERT INTO `sys_log` VALUES (125, '', '用户通过手机验证码登录', 75, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  telephone: 139', '127.0.0.1', '2019-11-25 10:16:41');
INSERT INTO `sys_log` VALUES (126, '', '用户通过手机验证码登录', 67, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  telephone: 139', '127.0.0.1', '2019-11-25 10:18:11');
INSERT INTO `sys_log` VALUES (127, '', '用户通过手机验证码登录', 11, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  telephone: 13959257655', '127.0.0.1', '2019-11-25 10:18:58');
INSERT INTO `sys_log` VALUES (128, '', '用户通过手机验证码登录', 3, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  telephone: 18308958586', '127.0.0.1', '2019-11-25 10:19:18');
INSERT INTO `sys_log` VALUES (129, '', '用户通过手机验证码登录', 56, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  telephone: 18308958586', '127.0.0.1', '2019-11-25 10:21:10');
INSERT INTO `sys_log` VALUES (130, '', '用户通过手机验证码登录', 54, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  telephone: 18308958586', '127.0.0.1', '2019-11-25 10:22:55');
INSERT INTO `sys_log` VALUES (131, '', '用户通过手机验证码登录', 4, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  telephone: 18308958586', '127.0.0.1', '2019-11-25 10:23:39');
INSERT INTO `sys_log` VALUES (132, '', '用户通过手机验证码登录', 8, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  telephone: 18308958586', '127.0.0.1', '2019-11-25 10:24:03');
INSERT INTO `sys_log` VALUES (133, '', '用户通过手机验证码登录', 65, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  telephone: 18308958586', '127.0.0.1', '2019-11-25 10:25:09');
INSERT INTO `sys_log` VALUES (134, '', '用户通过手机验证码登录', 75, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  telephone: 18308958586', '127.0.0.1', '2019-11-25 10:25:45');
INSERT INTO `sys_log` VALUES (135, '', '用户通过手机验证码登录', 3, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  telephone: 18308958586', '127.0.0.1', '2019-11-25 10:25:50');
INSERT INTO `sys_log` VALUES (136, '', '用户通过手机验证码登录', 108, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  telephone: 18308958586', '127.0.0.1', '2019-11-25 10:27:34');
INSERT INTO `sys_log` VALUES (137, '', '商家通过手机验证码登录', 99, 'com.qtztlink.ejile.system.controller.LoginController.shopLoginWithoutPass()', '  telephone: 18308958589', '127.0.0.1', '2019-11-25 11:03:32');
INSERT INTO `sys_log` VALUES (138, '', '用户通过手机验证码登录', 33, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  telephone: 18308958586', '127.0.0.1', '2019-11-25 11:03:45');
INSERT INTO `sys_log` VALUES (139, '', '用户通过手机验证码登录', 2, 'com.qtztlink.ejile.system.controller.LoginController.consumerLoginWithoutPass()', '  telephone: 1830895858', '127.0.0.1', '2019-11-25 11:04:18');
INSERT INTO `sys_log` VALUES (140, '', '商家通过密码登录', 151, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-25 17:27:43');
INSERT INTO `sys_log` VALUES (141, '', '商家接单', 248, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 54', '127.0.0.1', '2019-11-25 17:28:46');
INSERT INTO `sys_log` VALUES (142, '', '用户购买', 190, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 5  now: Mon Jul 15 17:29:00 CST 2019', '127.0.0.1', '2019-11-25 17:29:01');
INSERT INTO `sys_log` VALUES (143, '', '用户购买', 227, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 22  now: Mon Jul 15 17:29:00 CST 2019', '127.0.0.1', '2019-11-25 17:29:01');
INSERT INTO `sys_log` VALUES (144, '', '用户购买', 148, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 25  now: Mon Jul 15 17:29:00 CST 2019', '127.0.0.1', '2019-11-25 17:29:01');
INSERT INTO `sys_log` VALUES (145, '', '管理员通过密码登录', 86, 'com.qtztlink.ejile.system.controller.LoginController.adminLogin()', '  username: mai  password: 12345', '127.0.0.1', '2019-11-25 17:35:21');
INSERT INTO `sys_log` VALUES (146, '', '商家通过密码登录', 43, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-25 21:22:58');
INSERT INTO `sys_log` VALUES (147, '', '商家接单', 258, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 56', '127.0.0.1', '2019-11-25 21:55:21');
INSERT INTO `sys_log` VALUES (148, '', '商家接单', 175, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 58', '127.0.0.1', '2019-11-25 21:59:42');
INSERT INTO `sys_log` VALUES (149, '', '商家接单', 147, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 57', '127.0.0.1', '2019-11-25 21:59:43');
INSERT INTO `sys_log` VALUES (150, '', '商家接单', 228, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 55', '127.0.0.1', '2019-11-25 22:06:29');
INSERT INTO `sys_log` VALUES (151, '', '用户通过密码登录', 106, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-25 22:57:13');
INSERT INTO `sys_log` VALUES (152, '', '商家通过密码登录', 3, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-25 22:58:30');
INSERT INTO `sys_log` VALUES (153, '', '用户通过密码登录', 3, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-25 23:04:43');
INSERT INTO `sys_log` VALUES (154, '', '商家通过密码登录', 3, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-25 23:06:43');
INSERT INTO `sys_log` VALUES (155, '', '商家接单', 357, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 53', '127.0.0.1', '2019-11-25 23:41:56');
INSERT INTO `sys_log` VALUES (156, '', '用户通过密码登录', 4, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-25 23:42:42');
INSERT INTO `sys_log` VALUES (157, '', '用户购买', 208, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 5  now: Mon Jul 15 23:43:15 CST 2019', '127.0.0.1', '2019-11-25 23:43:15');
INSERT INTO `sys_log` VALUES (158, '', '用户购买', 142, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 6  now: Mon Jul 15 23:43:15 CST 2019', '127.0.0.1', '2019-11-25 23:43:16');
INSERT INTO `sys_log` VALUES (159, '', '用户购买', 140, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 22  now: Mon Jul 15 23:43:15 CST 2019', '127.0.0.1', '2019-11-25 23:43:16');
INSERT INTO `sys_log` VALUES (160, '', '用户购买', 119, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 23  now: Mon Jul 15 23:43:15 CST 2019', '127.0.0.1', '2019-11-25 23:43:16');
INSERT INTO `sys_log` VALUES (161, '', '用户购买', 117, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 25  now: Mon Jul 15 23:43:15 CST 2019', '127.0.0.1', '2019-11-25 23:43:16');
INSERT INTO `sys_log` VALUES (162, '', '用户购买', 142, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 1  GID: 26  now: Mon Jul 15 23:43:15 CST 2019', '127.0.0.1', '2019-11-25 23:43:17');
INSERT INTO `sys_log` VALUES (163, '', '商家接单', 258, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 63', '127.0.0.1', '2019-11-25 23:44:08');
INSERT INTO `sys_log` VALUES (164, '', '商家接单', 100, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 62', '127.0.0.1', '2019-11-25 23:44:10');
INSERT INTO `sys_log` VALUES (165, '', '商家接单', 275, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 61', '127.0.0.1', '2019-11-25 23:44:44');
INSERT INTO `sys_log` VALUES (166, '', '商家接单', 135, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 60', '127.0.0.1', '2019-11-25 23:44:46');
INSERT INTO `sys_log` VALUES (167, '', '商家接单', 135, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 59', '127.0.0.1', '2019-11-25 23:44:47');
INSERT INTO `sys_log` VALUES (168, '', '商家接单', 246, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 64', '127.0.0.1', '2019-11-25 23:44:49');
INSERT INTO `sys_log` VALUES (169, '', '商家接单', 310, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 42', '127.0.0.1', '2019-11-25 23:53:19');
INSERT INTO `sys_log` VALUES (170, '', '用户通过密码登录', 3, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-25 23:56:18');
INSERT INTO `sys_log` VALUES (171, '', '商家通过密码登录', 3, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-25 23:56:58');
INSERT INTO `sys_log` VALUES (172, '', '用户通过密码登录', 158, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-26 08:29:31');
INSERT INTO `sys_log` VALUES (173, '', '商家通过密码登录', 21, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-26 08:33:52');
INSERT INTO `sys_log` VALUES (174, '', '商家接单', 188, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 51', '127.0.0.1', '2019-11-26 08:49:46');
INSERT INTO `sys_log` VALUES (175, '', '商家接单', 141, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 49', '127.0.0.1', '2019-11-26 08:50:33');
INSERT INTO `sys_log` VALUES (176, '', '商家接单', 150, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 48', '127.0.0.1', '2019-11-26 08:50:54');
INSERT INTO `sys_log` VALUES (177, '', '商家接单', 154, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 45', '127.0.0.1', '2019-11-26 08:51:06');
INSERT INTO `sys_log` VALUES (178, '', '商家接单', 407, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 52', '127.0.0.1', '2019-11-26 08:51:18');
INSERT INTO `sys_log` VALUES (179, '', '商家接单', 168, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 50', '127.0.0.1', '2019-11-26 08:52:13');
INSERT INTO `sys_log` VALUES (180, '', '商家接单', 230, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 47', '127.0.0.1', '2019-11-26 08:54:29');
INSERT INTO `sys_log` VALUES (181, '', '商家接单', 209, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 46', '127.0.0.1', '2019-11-26 08:54:38');
INSERT INTO `sys_log` VALUES (182, '', '商家接单', 204, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 35', '127.0.0.1', '2019-11-26 08:54:59');
INSERT INTO `sys_log` VALUES (183, '', '商家接单', 151, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 9', '127.0.0.1', '2019-11-26 08:55:17');
INSERT INTO `sys_log` VALUES (184, '', '商家接单', 5, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 10', '127.0.0.1', '2019-11-26 08:55:27');
INSERT INTO `sys_log` VALUES (185, '', '商家接单', 16, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 7', '127.0.0.1', '2019-11-26 08:56:08');
INSERT INTO `sys_log` VALUES (186, '', '商家接单', 103, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 5', '127.0.0.1', '2019-11-26 08:56:13');
INSERT INTO `sys_log` VALUES (187, '', '商家接单', 5, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 7', '127.0.0.1', '2019-11-26 08:56:19');
INSERT INTO `sys_log` VALUES (188, '', '商家接单', 32, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 7', '127.0.0.1', '2019-11-26 08:59:59');
INSERT INTO `sys_log` VALUES (189, '', '商家接单', 5, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 10', '127.0.0.1', '2019-11-26 09:00:22');
INSERT INTO `sys_log` VALUES (190, '', '用户通过密码登录', 24, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-26 09:01:17');
INSERT INTO `sys_log` VALUES (191, '', '用户通过密码登录', 4, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-26 09:01:36');
INSERT INTO `sys_log` VALUES (192, '', '商家通过密码登录', 3, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-26 09:01:59');
INSERT INTO `sys_log` VALUES (193, '', '商家接单', 7, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 9', '127.0.0.1', '2019-11-26 09:02:25');
INSERT INTO `sys_log` VALUES (194, '', '商家接单', 209, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 40', '127.0.0.1', '2019-11-26 09:10:53');
INSERT INTO `sys_log` VALUES (195, '', '商家接单', 209, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 36', '127.0.0.1', '2019-11-26 09:11:12');
INSERT INTO `sys_log` VALUES (196, '', '用户通过密码登录', 184, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-26 09:54:21');
INSERT INTO `sys_log` VALUES (197, '', '用户取消订单', 103, 'com.qtztlink.ejile.system.controller.ConsumerController.cancelOrder()', '  OID: 8', '127.0.0.1', '2019-11-26 09:54:38');
INSERT INTO `sys_log` VALUES (198, '', '用户取消订单', 224, 'com.qtztlink.ejile.system.controller.ConsumerController.cancelOrder()', '  OID: 9', '127.0.0.1', '2019-11-26 09:56:19');
INSERT INTO `sys_log` VALUES (199, '', '商家通过密码登录', 5, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-26 10:09:25');
INSERT INTO `sys_log` VALUES (200, '', '用户通过密码登录', 4, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-26 10:10:30');
INSERT INTO `sys_log` VALUES (201, '', '商家通过密码登录', 4, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 1234', '127.0.0.1', '2019-11-26 10:16:48');
INSERT INTO `sys_log` VALUES (202, '', '用户通过密码登录', 4, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: Zhang San  password: 1234', '127.0.0.1', '2019-11-26 10:35:04');
INSERT INTO `sys_log` VALUES (203, '', '用户取消订单', 67, 'com.qtztlink.ejile.system.controller.ConsumerController.cancelOrder()', '  OID: 7', '127.0.0.1', '2019-11-26 10:52:35');
INSERT INTO `sys_log` VALUES (204, '', '用户注册', 141, 'com.qtztlink.ejile.system.controller.SignInController.addAConsumer()', '  name: test  password: 123456  telephone: 13826539608', '127.0.0.1', '2019-11-15 08:51:16');
INSERT INTO `sys_log` VALUES (205, '', '用户通过密码登录', 213, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-15 08:51:35');
INSERT INTO `sys_log` VALUES (206, '', '用户通过密码登录', 275, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: test', '127.0.0.1', '2019-11-15 15:38:09');
INSERT INTO `sys_log` VALUES (207, '', '用户通过密码登录', 219, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-15 15:40:04');
INSERT INTO `sys_log` VALUES (208, '', '管理员通过密码登录', 327, 'com.qtztlink.ejile.system.controller.LoginController.adminLogin()', '  username: mai  password: 123456', '127.0.0.1', '2019-11-15 19:42:45');
INSERT INTO `sys_log` VALUES (209, '', '管理员通过密码登录', 355, 'com.qtztlink.ejile.system.controller.LoginController.adminLogin()', '  username: mai  password: 123456', '127.0.0.1', '2019-11-15 19:51:10');
INSERT INTO `sys_log` VALUES (210, '', '用户通过密码登录', 237, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-16 08:46:16');
INSERT INTO `sys_log` VALUES (211, '', '商家通过密码登录', 128, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 123456', '127.0.0.1', '2019-11-16 08:46:35');
INSERT INTO `sys_log` VALUES (212, '', '商家通过密码登录', 125, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 123456', '127.0.0.1', '2019-11-16 08:47:43');
INSERT INTO `sys_log` VALUES (213, '', '管理员通过密码登录', 129, 'com.qtztlink.ejile.system.controller.LoginController.adminLogin()', '  username: mai  password: 123456', '127.0.0.1', '2019-11-16 09:25:50');
INSERT INTO `sys_log` VALUES (214, '', '用户通过密码登录', 5150, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-16 14:39:37');
INSERT INTO `sys_log` VALUES (215, '', '用户通过密码登录', 37375, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-16 14:40:08');
INSERT INTO `sys_log` VALUES (216, '', '用户通过密码登录', 35664, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-16 14:40:08');
INSERT INTO `sys_log` VALUES (217, '', '用户通过密码登录', 36229, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-16 14:40:08');
INSERT INTO `sys_log` VALUES (218, '', '用户通过密码登录', 43722, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-16 14:40:08');
INSERT INTO `sys_log` VALUES (219, '', '用户通过密码登录', 35866, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-16 14:40:08');
INSERT INTO `sys_log` VALUES (220, '', '用户通过密码登录', 4417, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-16 14:40:13');
INSERT INTO `sys_log` VALUES (221, '', '用户通过密码登录', 108, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: mai  password: 123456', '127.0.0.1', '2019-11-26 09:03:14');
INSERT INTO `sys_log` VALUES (222, '', '用户通过密码登录', 55, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: mai  password: mai', '127.0.0.1', '2019-11-26 09:03:21');
INSERT INTO `sys_log` VALUES (223, '', '用户通过密码登录', 129, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: test', '127.0.0.1', '2019-11-26 09:04:37');
INSERT INTO `sys_log` VALUES (224, '', '用户通过密码登录', 153, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-26 09:04:40');
INSERT INTO `sys_log` VALUES (225, '', '商家入驻', 129, 'com.qtztlink.ejile.system.controller.SignInController.addAShop()', '  name: test  managerName: 1  telephone: 13826539608  address: dsa  password: 123456', '127.0.0.1', '2019-11-26 09:05:12');
INSERT INTO `sys_log` VALUES (226, '', '商家通过密码登录', 83, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: test  password: test', '127.0.0.1', '2019-11-26 09:05:17');
INSERT INTO `sys_log` VALUES (227, '', '商家通过密码登录', 84, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-26 09:05:23');
INSERT INTO `sys_log` VALUES (228, '', '用户通过密码登录', 25238, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-26 15:05:22');
INSERT INTO `sys_log` VALUES (229, '', '用户通过密码登录', 25097, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-26 15:05:26');
INSERT INTO `sys_log` VALUES (230, '', '用户通过密码登录', 212, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-27 10:17:04');
INSERT INTO `sys_log` VALUES (231, '', '用户通过密码登录', 95, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-27 10:20:42');
INSERT INTO `sys_log` VALUES (232, '', '用户通过密码登录', 93, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-27 10:24:03');
INSERT INTO `sys_log` VALUES (233, '', '用户通过密码登录', 5087, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-27 10:32:29');
INSERT INTO `sys_log` VALUES (234, '', '用户通过密码登录', 5058, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-27 10:32:29');
INSERT INTO `sys_log` VALUES (235, '', '用户通过密码登录', 5059, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-27 10:32:30');
INSERT INTO `sys_log` VALUES (236, '', '用户通过密码登录', 15089, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-27 10:32:31');
INSERT INTO `sys_log` VALUES (237, '', '用户通过密码登录', 82, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-27 10:32:32');
INSERT INTO `sys_log` VALUES (238, '', '用户通过密码登录', 20072, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-27 10:32:32');
INSERT INTO `sys_log` VALUES (239, '', '用户通过密码登录', 82, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-27 10:36:02');
INSERT INTO `sys_log` VALUES (240, '', '用户通过密码登录', 30064, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-27 10:41:49');
INSERT INTO `sys_log` VALUES (241, '', '用户通过密码登录', 82, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-27 10:42:15');
INSERT INTO `sys_log` VALUES (242, '', '用户通过密码登录', 8875, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-27 13:49:24');
INSERT INTO `sys_log` VALUES (243, '', '用户通过密码登录', 166, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-28 15:34:46');
INSERT INTO `sys_log` VALUES (244, '', '商家通过密码登录', 15097, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 123456', '127.0.0.1', '2019-11-28 15:56:02');
INSERT INTO `sys_log` VALUES (245, '', '商家通过密码登录', 15074, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 123456', '127.0.0.1', '2019-11-28 15:56:03');
INSERT INTO `sys_log` VALUES (246, '', '商家通过密码登录', 20147, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 123456', '127.0.0.1', '2019-11-28 15:56:05');
INSERT INTO `sys_log` VALUES (247, '', '用户通过密码登录', 87, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-11-28 15:56:35');
INSERT INTO `sys_log` VALUES (248, '', '用户通过密码登录', 167, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-12-04 17:01:41');
INSERT INTO `sys_log` VALUES (254, '', '管理员通过密码登录', 251, 'com.qtztlink.ejile.system.controller.LoginController.adminLogin()', '  username: mai  password: 123456', '127.0.0.1', '2019-12-05 14:40:21');
INSERT INTO `sys_log` VALUES (255, '', '用户通过密码登录', 179, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-12-06 08:41:42');
INSERT INTO `sys_log` VALUES (256, '', '商家通过密码登录', 115, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 123456', '127.0.0.1', '2019-12-06 09:29:21');
INSERT INTO `sys_log` VALUES (257, '', '用户通过密码登录', 254, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-12-06 10:37:04');
INSERT INTO `sys_log` VALUES (258, '', '商家通过密码登录', 291, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 123456', '127.0.0.1', '2019-12-06 10:48:55');
INSERT INTO `sys_log` VALUES (259, '', '用户通过密码登录', 215, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-12-07 08:53:59');
INSERT INTO `sys_log` VALUES (260, '', '商家通过密码登录', 130, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 123456', '127.0.0.1', '2019-12-07 09:03:33');
INSERT INTO `sys_log` VALUES (261, '', '用户通过密码登录', 1020, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: test  password: 123456', '127.0.0.1', '2019-12-26 15:34:47');
INSERT INTO `sys_log` VALUES (262, '', '商家通过密码登录', 523, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 123456', '127.0.0.1', '2019-12-26 16:00:48');
INSERT INTO `sys_log` VALUES (263, '', '商家通过密码登录', 181, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 123456', '127.0.0.1', '2019-12-26 16:03:03');
INSERT INTO `sys_log` VALUES (264, '', '商家通过密码登录', 275, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 123456', '127.0.0.1', '2019-12-26 16:04:46');
INSERT INTO `sys_log` VALUES (265, '', '管理员通过密码登录', 292, 'com.qtztlink.ejile.system.controller.LoginController.adminLogin()', '  username: mai  password: 123456', '127.0.0.1', '2019-12-26 16:07:26');
INSERT INTO `sys_log` VALUES (266, '', '管理员通过密码登录', 250, 'com.qtztlink.ejile.system.controller.LoginController.adminLogin()', '  username: mai  password: 123456', '127.0.0.1', '2019-12-26 16:17:10');
INSERT INTO `sys_log` VALUES (267, '', '用户注册', 90, 'com.qtztlink.ejile.system.controller.SignInController.addAConsumer()', '  name: 123456  password: 123456  telephone: 13433647567', '127.0.0.1', '2019-12-26 16:23:36');
INSERT INTO `sys_log` VALUES (268, '', '用户通过密码登录', 91, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: 123456  password: 123456', '127.0.0.1', '2019-12-26 16:23:46');
INSERT INTO `sys_log` VALUES (269, '', '用户购买', 436, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 21  GID: 3  now: Thu Dec 26 16:32:57 GMT+08:00 2019', '127.0.0.1', '2019-12-26 16:32:58');
INSERT INTO `sys_log` VALUES (270, '', '用户购买', 231, 'com.qtztlink.ejile.system.controller.BuyController.confirmItemWithDate()', '  CID: 21  GID: 3  now: Thu Dec 26 16:34:18 GMT+08:00 2019', '127.0.0.1', '2019-12-26 16:34:20');
INSERT INTO `sys_log` VALUES (271, '', '商家接单', 350, 'com.qtztlink.ejile.system.controller.ShopController.confirmOrder()', '  OID: 66', '127.0.0.1', '2019-12-26 16:34:57');
INSERT INTO `sys_log` VALUES (272, '', '商家通过密码登录', 322, 'com.qtztlink.ejile.system.controller.LoginController.shopLogin()', '  username: mai  password: 123456', '127.0.0.1', '2019-12-26 16:50:00');
INSERT INTO `sys_log` VALUES (273, '', '用户注册', 206, 'com.qtztlink.ejile.system.controller.SignInController.addAConsumer()', '  name: smile  password: 123456  telephone: 13433647567', '127.0.0.1', '2019-12-27 09:45:41');
INSERT INTO `sys_log` VALUES (274, '', '用户注册', 94, 'com.qtztlink.ejile.system.controller.SignInController.addAConsumer()', '  name: smile  password: 123456  telephone: 15625853354', '127.0.0.1', '2019-12-27 09:46:06');
INSERT INTO `sys_log` VALUES (275, '', '用户通过密码登录', 236, 'com.qtztlink.ejile.system.controller.LoginController.consumerLogin()', '  username: smile  password: 123456', '127.0.0.1', '2019-12-27 09:46:15');

-- ----------------------------
-- View structure for commentary_view
-- ----------------------------
DROP VIEW IF EXISTS `commentary_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `commentary_view` AS select `commentary`.`CoID` AS `id`,`consumer`.`cId` AS `cid`,`shop`.`sId` AS `sid`,`consumer`.`cName` AS `cname`,`shop`.`sName` AS `sname`,`commentary`.`CoTime` AS `ctime`,`commentary`.`content` AS `content`,`commentary`.`stars` AS `stars` from ((`commentary` join `consumer`) join `shop`) where ((`commentary`.`SID` = `shop`.`sId`) and (`commentary`.`Cid` = `consumer`.`cId`));

-- ----------------------------
-- View structure for consumerreply_view
-- ----------------------------
DROP VIEW IF EXISTS `consumerreply_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `consumerreply_view` AS select `consumer`.`cId` AS `cid`,`consumerreply`.`CoID` AS `coid`,`consumer`.`cName` AS `cname`,`consumerreply`.`CoTime` AS `cotime`,`consumerreply`.`content` AS `content` from (`consumerreply` join `consumer`) where (`consumerreply`.`CID` = `consumer`.`cId`);

-- ----------------------------
-- View structure for contact_view
-- ----------------------------
DROP VIEW IF EXISTS `contact_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `contact_view` AS select `consumer`.`cId` AS `cid`,`shop`.`sId` AS `sid`,`consumer`.`cName` AS `cname`,`shop`.`sName` AS `sname`,`contact`.`CTime` AS `ctime`,`contact`.`CState` AS `state`,`contact`.`content` AS `content`,`contact`.`isRead` AS `isRead` from ((`contact` join `consumer`) join `shop`) where ((`contact`.`SID` = `shop`.`sId`) and (`contact`.`CID` = `consumer`.`cId`));

-- ----------------------------
-- View structure for orderhistory_view
-- ----------------------------
DROP VIEW IF EXISTS `orderhistory_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `orderhistory_view` AS select `orderhistory`.`oId` AS `id`,`shop`.`sId` AS `sid`,`orderhistory`.`CID` AS `cid`,`orderhistory`.`GID` AS `gid`,`shop`.`sName` AS `shopName`,`goods`.`gName` AS `goodsName`,`orderhistory`.`oTime` AS `buyTime`,`goods`.`gPictureUrl` AS `picture`,`orderhistory`.`oNum` AS `num`,`goods`.`gPrice` AS `price`,`orderhistory`.`cost` AS `total`,`orderhistory`.`oState` AS `state`,`consumer`.`cName` AS `consumerName` from (((`shop` join `orderhistory`) join `goods`) join `consumer`) where ((`shop`.`sId` = `goods`.`sId`) and (`goods`.`gId` = `orderhistory`.`GID`) and (`consumer`.`cId` = `orderhistory`.`CID`));

-- ----------------------------
-- View structure for shoppingcart_view
-- ----------------------------
DROP VIEW IF EXISTS `shoppingcart_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `shoppingcart_view` AS select `shoppingcart`.`CID` AS `cid`,`goods`.`sId` AS `sid`,`shoppingcart`.`GID` AS `gid`,`shop`.`sName` AS `shopName`,`goods`.`gName` AS `goodsName`,`goods`.`gPictureUrl` AS `picture`,`shoppingcart`.`num` AS `num`,`goods`.`gPrice` AS `price`,`shoppingcart`.`total` AS `total` from ((`shop` join `shoppingcart`) join `goods`) where ((`shop`.`sId` = `goods`.`sId`) and (`goods`.`gId` = `shoppingcart`.`GID`));

-- ----------------------------
-- View structure for shopreply_view
-- ----------------------------
DROP VIEW IF EXISTS `shopreply_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `shopreply_view` AS select `shop`.`sId` AS `sid`,`shopreply`.`CoID` AS `coid`,`shop`.`sName` AS `sname`,`shopreply`.`CoTime` AS `cotime`,`shopreply`.`content` AS `content` from (`shopreply` join `shop`) where (`shopreply`.`SID` = `shop`.`sId`);

SET FOREIGN_KEY_CHECKS = 1;
