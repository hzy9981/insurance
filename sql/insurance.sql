/*
 Navicat MySQL Data Transfer

 Source Server         : ouyang
 Source Server Type    : MySQL
 Source Server Version : 50641
 Source Host           : localhost:3306
 Source Schema         : insurance

 Target Server Type    : MySQL
 Target Server Version : 50641
 File Encoding         : 65001

 Date: 13/09/2018 10:22:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `answer` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'young', '202CB962AC59075B964B07152D234B70', '123@163.com', '18717859002', 'question', 'answer', '2018-09-05 20:46:25', '2018-09-05 20:46:25');

-- ----------------------------
-- Table structure for user_order
-- ----------------------------
DROP TABLE IF EXISTS `user_order`;
CREATE TABLE `user_order`  (
  `ORDER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ORDER_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FINISH_DATE` datetime(0) NULL DEFAULT NULL,
  `SUM_PREMIUM` decimal(16, 0) NULL DEFAULT NULL,
  `BI_PREMIUM` decimal(16, 0) NULL DEFAULT NULL,
  `CI_PREMIUM` decimal(16, 0) NULL DEFAULT NULL,
  `ORDER_CITY` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `USER_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CAR_OWNER` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ENGINER_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FRAME_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LICENCE_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_order
-- ----------------------------
INSERT INTO `user_order` VALUES (2, '44557359102', '2018-09-06 20:49:59', 279081, 157081, 122000, '140200', 'young', '欧阳', '1234567', '12345678901234567', '晋B12345');
INSERT INTO `user_order` VALUES (3, '43946773424', '2018-09-06 20:55:00', 279081, 157081, 122000, '130400', 'young', '欧阳', '1234567', '12345678901234567', '冀D12345');
INSERT INTO `user_order` VALUES (4, '17031372222', '2018-09-07 15:47:08', 279081, 157081, 122000, '140500', 'young', '欧阳', '1234567', '12345678901234567', '晋E12345');

SET FOREIGN_KEY_CHECKS = 1;
