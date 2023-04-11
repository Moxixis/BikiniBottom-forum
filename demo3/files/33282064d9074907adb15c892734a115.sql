/*
 Navicat Premium Data Transfer

 Source Server         : demo03
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 22/08/2022 12:31:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容',
  `user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名称',
  `time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发布时间',
  `enable` tinyint(1) NULL DEFAULT NULL COMMENT '是否启用',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章概述',
  `userid` int NULL DEFAULT NULL COMMENT '作者的id',
  `typeid` int NULL DEFAULT NULL COMMENT '文章类型的id',
  `readnumber` int NULL DEFAULT NULL COMMENT '阅读次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 124 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '轮播图id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '轮播图名称',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '轮播图简介',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '轮播图指向的网页地址',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `enable` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES (8, '微信小程序.png', '微信小程序专题，精品小程序源码合集等你来看。', 'http://localhost:9090/carousel/c758efa5ac694624be3805f9fd00717b.png', NULL, NULL, 'ffb7517915f99914ada91a0e82291780', 1);
INSERT INTO `carousel` VALUES (11, 'ai智能线上讨论会活动宣传科技横版海报__2022-07-28+14_45_30.png', NULL, 'http://localhost:9090/carousel/1135fd1cbe8d44bb894e14a65fdc18fe.png', NULL, NULL, '30b0fa6af19949a902628566ca3de403', 1);

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NULL DEFAULT NULL COMMENT '收藏人的id',
  `articleid` int NULL DEFAULT NULL COMMENT '被收藏的文章的id',
  `authorid` int NULL DEFAULT NULL COMMENT '被收藏的作者的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES (29, 107, 114, 114);
INSERT INTO `collection` VALUES (31, 107, 35, 107);
INSERT INTO `collection` VALUES (32, 107, 117, 107);

-- ----------------------------
-- Table structure for resources
-- ----------------------------
DROP TABLE IF EXISTS `resources`;
CREATE TABLE `resources`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '资源名称',
  `userid` int NULL DEFAULT NULL COMMENT '上传人id',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件类型',
  `size` bigint NULL DEFAULT NULL COMMENT '文件大小',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件MD5',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '下载链接',
  `brief` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '资源描述',
  `downloadnumber` int(10) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '文章下载次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resources
-- ----------------------------

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件类型',
  `size` bigint NULL DEFAULT NULL COMMENT '文件大小(kb)',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '下载链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件md5',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `enable` tinyint(1) NULL DEFAULT 1 COMMENT '是否禁用链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `brief` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '个人简介',
  `birthday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生日',
  `nameOfShcool` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学校名称',
  `education` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学历',
  `major` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '专业',
  `schoolTime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '入学时间',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户身份',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (107, 'admin2', '123456', 'admin', '3123123', '', 'awqdq', '2022-08-22 12:28:53', 'http://localhost:9090/file/5b0583b0411a4f30bbea7f237a0261f4.jpeg', '男', '小黑子，食不食油饼！', '2020.12.03', 'qweqwe', '高中', '软件工程', '2022.9', '管理员');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论内容',
  `user_id` int NULL DEFAULT NULL COMMENT '评论人id',
  `time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论时间',
  `pid` int NULL DEFAULT NULL COMMENT '父id',
  `origin_id` int NULL DEFAULT NULL COMMENT '最上级评论',
  `article_id` int NULL DEFAULT NULL COMMENT '关联文章的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2101407745 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (-2046820351, '撒打算', 107, '2022-07-24 14:28:31', NULL, NULL, 35);
INSERT INTO `t_comment` VALUES (-2017456126, '的', 98, '2022-07-20 14:49:05', 1514205185, 1514205185, 35);
INSERT INTO `t_comment` VALUES (-1967067134, 'sad撒多', 107, '2022-07-19 15:01:53', NULL, NULL, 35);
INSERT INTO `t_comment` VALUES (-1904185342, '444', 98, '2022-07-20 05:16:07', -1967067134, -1967067134, 35);
INSERT INTO `t_comment` VALUES (-1904091134, '阿萨德撒大', 114, '2022-07-21 10:51:48', -1602195454, -1967067134, 35);
INSERT INTO `t_comment` VALUES (-1711206399, 'asd', 107, '2022-07-24 17:54:25', -167649278, -167649278, 35);
INSERT INTO `t_comment` VALUES (-1673523199, '阿斯顿撒多', 107, '2022-07-20 14:52:20', 1501564930, 2101407745, 35);
INSERT INTO `t_comment` VALUES (-1602195454, 'asdsas', 98, '2022-07-20 05:17:04', -1967067134, -1967067134, 35);
INSERT INTO `t_comment` VALUES (-1568657407, 'sad ', 107, '2022-07-24 13:40:00', -398446591, 1744887810, 19);
INSERT INTO `t_comment` VALUES (-1551835135, '按市场', 107, '2022-07-21 00:42:38', 1644224513, 1644224513, 19);
INSERT INTO `t_comment` VALUES (-1438642174, '萨达', 98, '2022-07-20 14:42:33', 1501564930, 2101407745, 35);
INSERT INTO `t_comment` VALUES (-1283457023, '213', 107, '2022-07-24 14:29:01', NULL, NULL, 19);
INSERT INTO `t_comment` VALUES (-1124012030, '姜晨吃屁', 107, '2022-07-19 14:43:55', NULL, NULL, 7);
INSERT INTO `t_comment` VALUES (-1073647614, 'sadasdsad', 98, '2022-07-22 13:57:03', -742297599, -398450686, 33);
INSERT INTO `t_comment` VALUES (-1061154815, 'asdad', 107, '2022-07-25 09:42:04', 356519938, 356519938, 19);
INSERT INTO `t_comment` VALUES (-889184255, 'sad', 107, '2022-07-21 12:23:28', 1119887361, 1119887361, 34);
INSERT INTO `t_comment` VALUES (-865849342, 'asdasdas', 107, '2022-08-09 22:37:38', NULL, NULL, 120);
INSERT INTO `t_comment` VALUES (-851353599, 'asd ', 107, '2022-07-27 20:10:40', NULL, NULL, 115);
INSERT INTO `t_comment` VALUES (-834662398, '单位', 98, '2022-07-20 14:52:05', 1501564930, 2101407745, 35);
INSERT INTO `t_comment` VALUES (-742297599, 'asdsad', 98, '2022-07-22 13:57:00', -398450686, -398450686, 33);
INSERT INTO `t_comment` VALUES (-708833279, 'sad ', 98, '2022-07-20 07:00:30', 2101407745, 2101407745, 35);
INSERT INTO `t_comment` VALUES (-671084542, 'asd', 98, '2022-07-21 09:17:48', -1551835135, 1644224513, 19);
INSERT INTO `t_comment` VALUES (-633270271, 'asd', 107, '2022-07-24 17:54:12', NULL, NULL, 19);
INSERT INTO `t_comment` VALUES (-532668414, '测试', 107, '2022-07-21 16:43:59', 1958797314, 1958797314, 19);
INSERT INTO `t_comment` VALUES (-398450686, 'ass大所', 107, '2022-07-21 12:23:15', NULL, NULL, 33);
INSERT INTO `t_comment` VALUES (-276754431, 'asd', 107, '2022-07-24 17:54:26', NULL, NULL, 35);
INSERT INTO `t_comment` VALUES (-260046847, 'asdasd', 107, '2022-07-24 16:13:30', NULL, NULL, 35);
INSERT INTO `t_comment` VALUES (-222244863, '呈现出', 107, '2022-07-24 20:42:46', -1967067134, -1967067134, 35);
INSERT INTO `t_comment` VALUES (-201322495, 'sadsad', 107, '2022-07-25 10:41:19', 1656754178, 1656754178, 114);
INSERT INTO `t_comment` VALUES (-167649278, '哈哈哈哈哈哈哈哈或或或', 114, '2022-07-21 10:52:31', NULL, NULL, 35);
INSERT INTO `t_comment` VALUES (-138403839, '测试2', 107, '2022-07-21 19:10:51', -532668414, 1958797314, 19);
INSERT INTO `t_comment` VALUES (-73125887, 'sadas', 107, '2022-08-09 22:37:49', 994066434, 637550593, 120);
INSERT INTO `t_comment` VALUES (-16654335, '红红火火恍恍惚惚或或或或或', 114, '2022-07-21 10:52:52', 1124077570, 1644224513, 19);
INSERT INTO `t_comment` VALUES (247525378, '真', 107, '2022-07-19 14:43:45', NULL, NULL, 7);
INSERT INTO `t_comment` VALUES (281141250, '嗷嗷嗷', 114, '2022-07-21 10:51:43', -1967067134, -1967067134, 35);
INSERT INTO `t_comment` VALUES (356519938, '呃呃呃 ', 107, '2022-07-25 09:00:16', NULL, NULL, 19);
INSERT INTO `t_comment` VALUES (448798722, '嘿嘿嘿', 107, '2022-07-21 12:23:04', 1698754561, 1698754561, 32);
INSERT INTO `t_comment` VALUES (453107713, '阿萨德sad撒多撒', 107, '2022-07-19 19:25:47', NULL, NULL, 30);
INSERT INTO `t_comment` VALUES (637550593, '测试', 107, '2022-07-29 09:11:04', NULL, NULL, 120);
INSERT INTO `t_comment` VALUES (645935106, 'sd ', 107, '2022-07-24 13:39:46', 1958797314, 1958797314, 19);
INSERT INTO `t_comment` VALUES (920924161, 'sadcassad', 107, '2022-08-09 22:37:41', NULL, NULL, 120);
INSERT INTO `t_comment` VALUES (994066434, '测试222', 114, '2022-07-29 09:11:29', 406863873, 637550593, 120);
INSERT INTO `t_comment` VALUES (1086332930, '撒大声地', 107, '2022-07-24 17:13:42', NULL, NULL, 29);
INSERT INTO `t_comment` VALUES (1111490561, '213', 107, '2022-07-24 14:28:59', -1568657407, 1744887810, 19);
INSERT INTO `t_comment` VALUES (1119887361, '阿斯顿撒', 107, '2022-07-21 12:23:24', NULL, NULL, 34);
INSERT INTO `t_comment` VALUES (1124077570, '哈哈哈哈', 107, '2022-07-21 09:18:12', -671084542, 1644224513, 19);
INSERT INTO `t_comment` VALUES (1266683906, '阿萨德sad撒', 98, '2022-07-20 14:42:47', 2101407745, 2101407745, 35);
INSERT INTO `t_comment` VALUES (1300238338, 'asdasd', 107, '2022-07-25 10:41:16', NULL, NULL, 114);
INSERT INTO `t_comment` VALUES (1459671041, '阿萨德', 107, '2022-07-24 20:42:54', 281141250, -1967067134, 35);
INSERT INTO `t_comment` VALUES (1501564930, 'sad', 98, '2022-07-20 14:36:32', 2101407745, 2101407745, 35);
INSERT INTO `t_comment` VALUES (1537486849, '奥术大师多', 107, '2022-08-09 22:39:29', NULL, NULL, 123);
INSERT INTO `t_comment` VALUES (1656754178, 'asdsa', 107, '2022-07-25 09:42:43', NULL, NULL, 114);
INSERT INTO `t_comment` VALUES (1698754561, 'sadsadsad', 98, '2022-07-19 14:40:10', NULL, NULL, 32);
INSERT INTO `t_comment` VALUES (1702903809, 'sdsad', 107, '2022-07-29 11:12:20', NULL, NULL, 120);
INSERT INTO `t_comment` VALUES (1744887810, '666', 98, '2022-07-21 01:42:46', NULL, NULL, 19);
INSERT INTO `t_comment` VALUES (1757429762, 'w ', 107, '2022-07-22 17:27:39', -532668414, 1958797314, 19);
INSERT INTO `t_comment` VALUES (2038435841, 'asdsa', 107, '2022-07-25 09:41:53', 1744887810, 1744887810, 19);
INSERT INTO `t_comment` VALUES (2076250114, 'asd', 107, '2022-07-24 17:54:09', NULL, NULL, 19);
INSERT INTO `t_comment` VALUES (2097221633, 'asdasd', 107, '2022-07-24 17:54:14', NULL, NULL, 19);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '文章类型id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章类型名称',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章类型概述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章背景图',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '微信小程序源码合集', '微信小程序，简称小程序，英文名Mini Program，是一种不需要下载安装即可使用的应用，它实现了应用\"触手可及\"的梦想，用户扫一扫或搜一下即可打开应用。', 'http://localhost:9090/file/3e601905633542df99d25b5d879bbd25.png');
INSERT INTO `type` VALUES (3, '\r\n微信小程序商城源码合集', '\r\n微信小程序商城源码合集\r\n微信小程序是一种无需下载安装即可使用的应用，能以最低的成本触达用户。掌握了微信小程序开发技术，等同于打通了手机应用开发蓝海的出海口！ ', 'http://localhost:9090/file/60d64712c1904e2e9b2e25dde95d56d6.png');
INSERT INTO `type` VALUES (4, 'c', '好用厉害', 'http://localhost:9090/file/3e601905633542df99d25b5d879bbd25.png');

SET FOREIGN_KEY_CHECKS = 1;
