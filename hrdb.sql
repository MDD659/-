/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50623
 Source Host           : localhost:3306
 Source Schema         : hrdb

 Target Server Type    : MySQL
 Target Server Version : 50623
 File Encoding         : 65001

 Date: 16/09/2019 09:30:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dept_inf
-- ----------------------------
DROP TABLE IF EXISTS `dept_inf`;
CREATE TABLE `dept_inf`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dept_inf
-- ----------------------------
INSERT INTO `dept_inf` VALUES (1, '财务部', '无');
INSERT INTO `dept_inf` VALUES (2, '学术部', '无');
INSERT INTO `dept_inf` VALUES (3, '公关部', '无');
INSERT INTO `dept_inf` VALUES (4, '教学部', '无');
INSERT INTO `dept_inf` VALUES (5, '技术部', '无');
INSERT INTO `dept_inf` VALUES (6, '人事部', '');

-- ----------------------------
-- Table structure for employee_inf
-- ----------------------------
DROP TABLE IF EXISTS `employee_inf`;
CREATE TABLE `employee_inf`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEPT_ID` int(11) NOT NULL,
  `JOB_ID` int(11) NOT NULL,
  `NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CARD_ID` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ADDRESS` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `POST_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TEL` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PHONE` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `QQ_NUM` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EMAIL` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SEX` int(11) NOT NULL DEFAULT 1,
  `PARTY` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BIRTHDAY` datetime NULL DEFAULT NULL,
  `RACE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EDUCATION` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SPECIALITY` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `HOBBY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_EMP_DEPT`(`DEPT_ID`) USING BTREE,
  INDEX `FK_EMP_JOB`(`JOB_ID`) USING BTREE,
  CONSTRAINT `FK_EMP_DEPT` FOREIGN KEY (`DEPT_ID`) REFERENCES `dept_inf` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_EMP_JOB` FOREIGN KEY (`JOB_ID`) REFERENCES `job_inf` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of employee_inf
-- ----------------------------
INSERT INTO `employee_inf` VALUES (2, 2, 1, '小明', '123456789012345678', '广东省深圳', '234242', '23424333', '13610561160', '324234', '54555@qq.cn', 1, '群众', '1980-07-07 00:00:00', '汉', '本科', '计算机', '无', '无', '2019-02-19 15:32:44');
INSERT INTO `employee_inf` VALUES (3, 1, 1, '旺财', '123456789012345670', '广东省深圳', '23424', '23424333', '13610561161', '324234', 'dsafasfd@dsa.com', 1, '群众', '1980-07-07 00:00:00', '汉', '本科', '计算机', '无', '无', '2019-02-19 15:37:20');

-- ----------------------------
-- Table structure for job_inf
-- ----------------------------
DROP TABLE IF EXISTS `job_inf`;
CREATE TABLE `job_inf`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of job_inf
-- ----------------------------
INSERT INTO `job_inf` VALUES (1, '工程师', '无');
INSERT INTO `job_inf` VALUES (2, '会计师', '无');
INSERT INTO `job_inf` VALUES (3, '普通职员', '无');
INSERT INTO `job_inf` VALUES (4, 'Java程序员', '');

-- ----------------------------
-- Table structure for user_inf
-- ----------------------------
DROP TABLE IF EXISTS `user_inf`;
CREATE TABLE `user_inf`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PASSWORD` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STATUS` int(11) NOT NULL DEFAULT 1,
  `createdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_inf
-- ----------------------------
INSERT INTO `user_inf` VALUES (1, 'mike', '888888', 1, '2019-05-09 11:19:49', '乔峰');
INSERT INTO `user_inf` VALUES (2, 'zhang', '999', 0, '2019-04-27 17:01:05', '段誉');
INSERT INTO `user_inf` VALUES (3, 'jackk', '999', 1, '2019-05-09 11:19:59', '王语嫣');
INSERT INTO `user_inf` VALUES (4, 'jason', '000000', 1, '2019-05-09 11:19:55', '草地僧');
INSERT INTO `user_inf` VALUES (5, 'lishi', '000000', 1, '2018-12-05 21:20:22', '李四');
INSERT INTO `user_inf` VALUES (6, 'aaa', '111', 0, '2019-04-27 17:13:15', '东方不败');
INSERT INTO `user_inf` VALUES (7, 'jack', '111', 0, '2019-04-28 11:35:14', '令狐冲');
INSERT INTO `user_inf` VALUES (8, 'ss', '123', 1, '2019-05-06 14:21:53', 'ç');
INSERT INTO `user_inf` VALUES (9, 'test', '123', 1, '2019-05-25 08:42:22', '张三');
INSERT INTO `user_inf` VALUES (10, 'test1', '111', 1, '2019-05-25 08:47:21', '慕容复');
INSERT INTO `user_inf` VALUES (11, 'test2', '123', 1, '2019-05-25 10:24:51', '张三2');
INSERT INTO `user_inf` VALUES (12, 'test3', '123', 1, '2019-05-25 10:29:33', '李四');
INSERT INTO `user_inf` VALUES (13, 'zhenghongwu', '111111', 2, '2019-06-01 09:38:54', '吴正洪');
INSERT INTO `user_inf` VALUES (14, 'wuzhenghong', 'aaaaaa', 0, '2019-06-01 09:42:17', '吴正洪');
INSERT INTO `user_inf` VALUES (15, 'fanbb', 'aaaaaa', 0, '2019-06-01 09:46:49', '范冰冰');
INSERT INTO `user_inf` VALUES (16, 'yangyin', 'aaaaaa', 0, '2019-06-01 09:48:46', '杨颖');
INSERT INTO `user_inf` VALUES (17, 'zhangzhiyi', 'aaaaaa', 0, '2019-06-01 11:30:13', '章子怡');
INSERT INTO `user_inf` VALUES (18, 'zly', 'aaaaaa', 0, '2019-06-01 11:36:35', '赵丽颖');
INSERT INTO `user_inf` VALUES (19, 'wwwwww', 'wwwwww', 0, '2019-06-01 11:39:06', 'wwww');
INSERT INTO `user_inf` VALUES (20, 'hxm', 'wwwwww', 0, '2019-06-01 11:39:45', '黄小明');
INSERT INTO `user_inf` VALUES (21, 'laoqigai', 'aaaaaa', 2, '2019-06-01 11:41:10', '洪七公');
INSERT INTO `user_inf` VALUES (22, 'aaaaaaaaaa', '111111', 0, '2019-06-13 14:54:43', 'aaaaaa');
INSERT INTO `user_inf` VALUES (23, 'aaaaaaaaaa', '111111', 0, '2019-06-13 14:54:50', 'aaaaaa');
INSERT INTO `user_inf` VALUES (24, 'aaaaaaaaaa', '111111', 0, '2019-06-13 14:54:57', 'aaaaaaq');
INSERT INTO `user_inf` VALUES (25, 'bbbbbb', 'bbbbbb', 0, '2019-06-13 14:55:46', 'bbbbbb');
INSERT INTO `user_inf` VALUES (26, 'cccccc', 'cccccc', 0, '2019-06-13 14:57:07', 'cccccc');
INSERT INTO `user_inf` VALUES (27, 'cccccc', 'cccccc', 0, '2019-06-13 14:57:27', 'dddddd');
INSERT INTO `user_inf` VALUES (28, 'mmmmmm', 'mmmmmm', 0, '2019-06-13 17:14:47', 'mmmmm');
INSERT INTO `user_inf` VALUES (29, 'xiaozhou', '123456', 0, '2019-06-15 09:27:41', 'xiaozhou');
INSERT INTO `user_inf` VALUES (30, '小洪洪', '123456', 2, '2019-06-15 09:28:33', '洪老师');
INSERT INTO `user_inf` VALUES (31, '小洪洪', '123456', 0, '2019-06-15 09:28:43', '洪老师');
INSERT INTO `user_inf` VALUES (32, 'zzh', '666666', 1, '2019-06-15 09:28:46', '渣渣辉');
INSERT INTO `user_inf` VALUES (33, '小洪洪', '123456', 1, '2019-06-15 09:28:48', '洪老师');
INSERT INTO `user_inf` VALUES (34, '小洪洪', '123456', 2, '2019-06-15 09:28:52', '洪老师');
INSERT INTO `user_inf` VALUES (35, '小洪洪', '123456', 2, '2019-06-15 09:28:54', '洪老师');
INSERT INTO `user_inf` VALUES (36, '小洪洪', '123456', 2, '2019-06-15 09:28:56', '洪老师');
INSERT INTO `user_inf` VALUES (37, '小洪洪', '123456', 2, '2019-06-15 09:29:05', '洪老师');
INSERT INTO `user_inf` VALUES (38, '小洪洪', '123456', 2, '2019-06-15 09:29:06', '洪老师');
INSERT INTO `user_inf` VALUES (39, '小洪洪', '123456', 2, '2019-06-15 09:29:09', '洪老师');
INSERT INTO `user_inf` VALUES (40, '小洪洪', '123456', 2, '2019-06-15 09:29:15', '洪老师');
INSERT INTO `user_inf` VALUES (41, '小洪洪', '123456', 2, '2019-06-15 09:29:17', '洪老师');
INSERT INTO `user_inf` VALUES (42, '小洪洪', '123456', 2, '2019-06-15 09:29:21', '洪老师');
INSERT INTO `user_inf` VALUES (43, '小洪洪', '123456', 2, '2019-06-15 09:29:23', '洪老师');
INSERT INTO `user_inf` VALUES (44, '小洪洪', '123456', 2, '2019-06-15 09:29:25', '洪老师');
INSERT INTO `user_inf` VALUES (45, '小洪洪', '123456', 2, '2019-06-15 09:29:27', '洪老师');
INSERT INTO `user_inf` VALUES (46, '小洪洪', '123456', 2, '2019-06-15 09:29:28', '洪老师');
INSERT INTO `user_inf` VALUES (47, '小洪洪', '123456', 2, '2019-06-15 09:29:43', '洪老师');
INSERT INTO `user_inf` VALUES (48, '小洪洪', '123456', 2, '2019-06-15 09:29:46', '洪老师');
INSERT INTO `user_inf` VALUES (49, '小洪洪', '123456', 2, '2019-06-15 09:29:47', '洪老师');
INSERT INTO `user_inf` VALUES (50, '小洪洪', '123456', 2, '2019-06-15 09:29:47', '洪老师');
INSERT INTO `user_inf` VALUES (51, '小洪洪', '123456', 2, '2019-06-15 09:29:48', '洪老师');
INSERT INTO `user_inf` VALUES (52, '小洪洪', '123456', 2, '2019-06-15 09:29:49', '洪老师');
INSERT INTO `user_inf` VALUES (53, '小洪洪', '123456', 2, '2019-06-15 09:29:49', '洪老师');
INSERT INTO `user_inf` VALUES (54, '小洪洪', '123456', 2, '2019-06-15 09:29:50', '洪老师');
INSERT INTO `user_inf` VALUES (55, '小洪洪', '123456', 2, '2019-06-15 09:29:50', '洪老师');
INSERT INTO `user_inf` VALUES (56, '小洪洪', '123456', 2, '2019-06-15 09:29:51', '洪老师');
INSERT INTO `user_inf` VALUES (57, '小洪洪', '123456', 2, '2019-06-15 09:29:51', '洪老师');
INSERT INTO `user_inf` VALUES (58, '小洪洪', '123456', 2, '2019-06-15 09:29:52', '洪老师');
INSERT INTO `user_inf` VALUES (59, 'EeeNnn', '123456', 2, '2019-06-15 09:30:25', 'EeeNnn');
INSERT INTO `user_inf` VALUES (60, '砍我一刀', '123456', 2, '2019-06-15 09:31:15', '渣渣辉');
INSERT INTO `user_inf` VALUES (61, '砍我一刀', '123456', 2, '2019-06-15 09:31:16', '渣渣辉');
INSERT INTO `user_inf` VALUES (62, '砍我一刀', '123456', 2, '2019-06-15 09:31:17', '渣渣辉');
INSERT INTO `user_inf` VALUES (63, '砍我一刀', '123456', 2, '2019-06-15 09:31:17', '渣渣辉');
INSERT INTO `user_inf` VALUES (64, '砍我一刀', '123456', 2, '2019-06-15 09:31:18', '渣渣辉');
INSERT INTO `user_inf` VALUES (65, '砍我一刀', '123456', 2, '2019-06-15 09:31:18', '渣渣辉');
INSERT INTO `user_inf` VALUES (66, '砍我一刀', '123456', 2, '2019-06-15 09:31:19', '渣渣辉');
INSERT INTO `user_inf` VALUES (67, '砍我一刀', '123456', 2, '2019-06-15 09:31:19', '渣渣辉');
INSERT INTO `user_inf` VALUES (68, '砍我一刀', '123456', 2, '2019-06-15 09:31:20', '渣渣辉');
INSERT INTO `user_inf` VALUES (69, '砍我一刀', '123456', 2, '2019-06-15 09:31:20', '渣渣辉');
INSERT INTO `user_inf` VALUES (70, '砍我一刀', '123456', 2, '2019-06-15 09:31:21', '渣渣辉');
INSERT INTO `user_inf` VALUES (71, '砍我一刀', '123456', 2, '2019-06-15 09:31:21', '渣渣辉');
INSERT INTO `user_inf` VALUES (72, '砍我一刀', '123456', 2, '2019-06-15 09:31:22', '渣渣辉');
INSERT INTO `user_inf` VALUES (73, '砍我一刀', '123456', 2, '2019-06-15 09:31:23', '渣渣辉');
INSERT INTO `user_inf` VALUES (74, '砍我一刀', '123456', 2, '2019-06-15 09:31:23', '渣渣辉');
INSERT INTO `user_inf` VALUES (75, '砍我一刀', '123456', 2, '2019-06-15 09:31:24', '渣渣辉');
INSERT INTO `user_inf` VALUES (76, '砍我一刀', '123456', 2, '2019-06-15 09:31:24', '渣渣辉');
INSERT INTO `user_inf` VALUES (77, '砍我一刀', '123456', 2, '2019-06-15 09:31:25', '渣渣辉');
INSERT INTO `user_inf` VALUES (78, '砍我一刀', '123456', 2, '2019-06-15 09:31:25', '渣渣辉');
INSERT INTO `user_inf` VALUES (79, '砍我一刀', '123456', 2, '2019-06-15 09:31:26', '渣渣辉');
INSERT INTO `user_inf` VALUES (80, '砍我一刀', '123456', 2, '2019-06-15 09:31:26', '渣渣辉');
INSERT INTO `user_inf` VALUES (81, '砍我一刀', '123456', 2, '2019-06-15 09:31:27', '渣渣辉');
INSERT INTO `user_inf` VALUES (82, '砍我一刀', '123456', 2, '2019-06-15 09:31:27', '渣渣辉');
INSERT INTO `user_inf` VALUES (83, '砍我一刀', '123456', 0, '2019-06-15 09:31:31', '渣渣辉');
INSERT INTO `user_inf` VALUES (84, '砍我一刀', '123456', 0, '2019-06-15 09:31:31', '渣渣辉');
INSERT INTO `user_inf` VALUES (85, '砍我一刀', '123456', 0, '2019-06-15 09:31:32', '渣渣辉');
INSERT INTO `user_inf` VALUES (86, '砍我一刀', '123456', 0, '2019-06-15 09:31:32', '渣渣辉');
INSERT INTO `user_inf` VALUES (87, '砍我一刀', '123456', 0, '2019-06-15 09:31:33', '渣渣辉');
INSERT INTO `user_inf` VALUES (88, '砍我一刀', '123456', 0, '2019-06-15 09:31:33', '渣渣辉');
INSERT INTO `user_inf` VALUES (89, '砍我一刀', '123456', 0, '2019-06-15 09:31:33', '渣渣辉');
INSERT INTO `user_inf` VALUES (90, '砍我一刀', '123456', 0, '2019-06-15 09:31:34', '渣渣辉');
INSERT INTO `user_inf` VALUES (91, '砍我一刀', '123456', 0, '2019-06-15 09:31:34', '渣渣辉');
INSERT INTO `user_inf` VALUES (92, '砍我一刀', '123456', 0, '2019-06-15 09:31:35', '渣渣辉');
INSERT INTO `user_inf` VALUES (93, '砍我一刀', '123456', 0, '2019-06-15 09:31:35', '渣渣辉');
INSERT INTO `user_inf` VALUES (94, '砍我一刀', '123456', 0, '2019-06-15 09:31:36', '渣渣辉');
INSERT INTO `user_inf` VALUES (95, '全新版本', '666666', 0, '2019-06-15 09:39:31', '贪玩蓝月');
INSERT INTO `user_inf` VALUES (96, '李大仁', '123456789', 2, '2019-06-15 15:49:00', '李大仁');
INSERT INTO `user_inf` VALUES (97, 'add', '123456', 1, '2019-06-15 17:34:33', 'ujsj');
INSERT INTO `user_inf` VALUES (98, 'aas', '9999', 1, '2019-06-20 15:48:57', 'nn');
INSERT INTO `user_inf` VALUES (99, 'mybatis', 'admin', 1, '2019-06-20 15:56:09', '小李');
INSERT INTO `user_inf` VALUES (100, 'aaaaa', 'aaaaaa', 0, '2019-06-22 23:59:49', 'aaaaa');
INSERT INTO `user_inf` VALUES (101, 'aaaaaaa', 'aaaaaaa', 0, '2019-06-24 17:23:47', 'aaaaaaa');
INSERT INTO `user_inf` VALUES (102, 'aaaaaaa', 'aaaaaaa', 0, '2019-06-24 17:23:52', 'aaaaaaa');
INSERT INTO `user_inf` VALUES (103, 'aaaaaaa', 'aaaaaaa', 0, '2019-06-24 17:23:55', 'aaaaaaa');
INSERT INTO `user_inf` VALUES (104, 'aaaaaaaaaaa', 'aaaaaa', 0, '2019-06-24 17:25:17', 'aaaaaaaaaaa');
INSERT INTO `user_inf` VALUES (105, 'aaaaaa', 'aaaaaa', 0, '2019-06-24 17:26:53', 'aaaaaa');
INSERT INTO `user_inf` VALUES (106, 'aaaaaa', 'aaaaaa', 0, '2019-06-24 17:34:37', 'aaaaaa');
INSERT INTO `user_inf` VALUES (107, 'yisen', 'xiaopi666', 2, '2019-07-08 11:05:43', 'yisen');
INSERT INTO `user_inf` VALUES (108, 'ERIC', '111111', 2, '2019-07-08 11:06:42', '丽桑卓');
INSERT INTO `user_inf` VALUES (109, 'caicai', '111111', 0, '2019-07-08 11:06:43', '蔡徐坤');
INSERT INTO `user_inf` VALUES (110, '123', '123456', 0, '2019-07-08 11:06:43', '蔡徐坤');
INSERT INTO `user_inf` VALUES (111, 'GANGWA', 'GANGWA', 0, '2019-07-08 11:07:39', '刚娃');
INSERT INTO `user_inf` VALUES (112, 'GANGWA', 'GANGWA', 0, '2019-07-08 11:07:40', '刚娃');
INSERT INTO `user_inf` VALUES (113, 'GANGWA', 'GANGWA', 0, '2019-07-08 11:07:42', '刚娃');
INSERT INTO `user_inf` VALUES (114, 'make', '12345678', 2, '2019-07-08 11:08:16', '深白');
INSERT INTO `user_inf` VALUES (115, 'make', '12345678', 2, '2019-07-08 11:08:22', '深白');
INSERT INTO `user_inf` VALUES (116, 'liurui', '111111', 2, '2019-07-08 11:19:45', '刘瑞');
INSERT INTO `user_inf` VALUES (118, '王五', '111', 1, '2019-09-09 15:48:39', '小王');
INSERT INTO `user_inf` VALUES (119, '麻溜', '8888888', 1, '2019-09-09 15:50:24', '麻溜');

SET FOREIGN_KEY_CHECKS = 1;
