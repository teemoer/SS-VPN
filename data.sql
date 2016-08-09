/*
Navicat MySQL Data Transfer

Source Server         : 易佳诊本地数据库
Source Server Version : 50612
Source Host           : 127.0.0.1:3306
Source Database       : info

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2016-07-04 22:32:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(80) NOT NULL,
  `name` varchar(80) NOT NULL,
  `login_name` varchar(80) NOT NULL,
  `login_pwd` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '系统管理员', 'admin1', 'admin1', 'admin1');
INSERT INTO `admin` VALUES ('2', '新闻管理员', 'admin2', 'admin2', 'admin2');
INSERT INTO `admin` VALUES ('3', '会员管理员', 'admin3', 'admin3', 'admin3');
INSERT INTO `admin` VALUES ('4', '评论管理员', 'admin4', 'admin4', 'admin4');
INSERT INTO `admin` VALUES ('5', '测试管理员', 'admin5', 'admin5', 'admin5');

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) DEFAULT NULL,
  `news_id` int(20) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `post_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5xwecwmxkpbpilnngfp0sk3lt` (`news_id`),
  KEY `FK_j3v4l57l24nd1rt1nm8c27l4g` (`user_id`),
  CONSTRAINT `FK_5xwecwmxkpbpilnngfp0sk3lt` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`),
  CONSTRAINT `FK_j3v4l57l24nd1rt1nm8c27l4g` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of messages
-- ----------------------------
INSERT INTO `messages` VALUES ('1', '1', '1', '真假？', '火箭就是垃圾', null);
INSERT INTO `messages` VALUES ('2', '2', '2', '真假？', '火箭垃圾', null);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `author` varchar(80) NOT NULL,
  `content` text NOT NULL,
  `key_words` varchar(100) NOT NULL,
  `submit_date` datetime NOT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `video` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '火箭是大厦u', '小猫', '真实的都是是', 'nba', '2016-06-24 00:00:00', '图片一', 'users/wxt');
INSERT INTO `news` VALUES ('2', '火箭是大厦2', '小猫2', '真实的都是是2', 'nba2', '2016-07-04 22:09:42', '图片一2', null);
INSERT INTO `news` VALUES ('6', '我是标题', '作者哦', '和恶化', 'ggj', '2016-07-04 22:13:15', 'ur', null);
INSERT INTO `news` VALUES ('7', 'sdas标题', 'sd', 'asd', 'asfw', '2016-07-04 22:14:22', 'qwe', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `admin_id` int(20) DEFAULT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `hobby` varchar(100) DEFAULT NULL,
  `adderss` varchar(100) DEFAULT NULL,
  `brithday` date DEFAULT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin` (`admin_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1', 'wxt', '123456', 'teemoer@cntv.cn', '上网', 'cd', '2016-06-25', 'user/wxt/...', '女');
INSERT INTO `user` VALUES ('2', '2', 'zw', '123456', 'teemoer@cntv.cn', '上网', 'cd', '2016-06-25', 'user/wxt/...', '男');
