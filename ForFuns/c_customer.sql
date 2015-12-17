/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : forfun

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2015-12-13 18:28:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for c_customer
-- ----------------------------
DROP TABLE IF EXISTS `c_customer`;
CREATE TABLE `c_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `personnumber` varchar(50) DEFAULT NULL,
  `telphone` varchar(30) DEFAULT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `avator` varchar(100) DEFAULT NULL,
  `isartist` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of c_customer
-- ----------------------------
INSERT INTO `c_customer` VALUES ('1', '1', 'christy', '123456', '3506811111111', '11111', 'gy', '/forfun/newsupload/1448256725783.png', '1');
INSERT INTO `c_customer` VALUES ('2', '2', '1233', '12', '12', '12', '12', '323', '0');
INSERT INTO `c_customer` VALUES ('3', '12212', '12', '213', '213', '13', '131', '121', '1');
