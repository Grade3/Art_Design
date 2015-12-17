/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : forfun

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2015-12-15 22:27:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ai_artistinfo
-- ----------------------------
DROP TABLE IF EXISTS `ai_artistinfo`;
CREATE TABLE `ai_artistinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aritstid` varchar(50) DEFAULT NULL,
  `paymode` varchar(255) DEFAULT NULL,
  `goodat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aritstid` (`aritstid`),
  CONSTRAINT `aritstid` FOREIGN KEY (`aritstid`) REFERENCES `c_customer` (`userid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ea_examineartist
-- ----------------------------
DROP TABLE IF EXISTS `ea_examineartist`;
CREATE TABLE `ea_examineartist` (
  `id` int(11) NOT NULL,
  `userid` varchar(50) DEFAULT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `telphone` varchar(30) DEFAULT NULL,
  `personnumber` varchar(50) DEFAULT NULL,
  `paymode` varchar(255) DEFAULT NULL,
  `goodat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
