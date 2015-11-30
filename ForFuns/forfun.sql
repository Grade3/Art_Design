/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : forfun

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-11-30 09:54:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `c_customer`
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of c_customer
-- ----------------------------

-- ----------------------------
-- Table structure for `f_function`
-- ----------------------------
DROP TABLE IF EXISTS `f_function`;
CREATE TABLE `f_function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(50) DEFAULT NULL,
  `functionlink` varchar(100) DEFAULT NULL,
  `istopmenu` int(11) DEFAULT NULL,
  `topmenu` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_function
-- ----------------------------
INSERT INTO `f_function` VALUES ('1', '系统管理', null, '1', null);
INSERT INTO `f_function` VALUES ('2', '用户管理', './ManageUser.jsp', '0', '1');
INSERT INTO `f_function` VALUES ('3', '角色管理', './ManageRole.jsp', '0', '1');
INSERT INTO `f_function` VALUES ('4', '用户角色管理', './ManageUserRole.jsp', '0', '1');
INSERT INTO `f_function` VALUES ('5', '菜单管理', './ManageFunction.jsp', '0', '1');
INSERT INTO `f_function` VALUES ('6', '权限管理', './ManagePower.jsp', '0', '1');
INSERT INTO `f_function` VALUES ('7', '客户管理', null, '1', null);
INSERT INTO `f_function` VALUES ('8', '客户管理', './ManageCustomer.jsp', '0', '5');
INSERT INTO `f_function` VALUES ('9', '艺术家管理', './ManageArtist.jsp', '0', '5');
INSERT INTO `f_function` VALUES ('10', '资讯发布管理', null, '1', null);
INSERT INTO `f_function` VALUES ('11', '发布资讯', './AddNews.jsp', '0', '8');
INSERT INTO `f_function` VALUES ('12', '查看资讯', './WatchNews.jsp', '0', '8');
INSERT INTO `f_function` VALUES ('13', '资讯管理', '', '1', null);
INSERT INTO `f_function` VALUES ('14', '审核资讯', './ManageNews.jsp', '0', '11');

-- ----------------------------
-- Table structure for `n_news`
-- ----------------------------
DROP TABLE IF EXISTS `n_news`;
CREATE TABLE `n_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `content` text,
  `money` int(50) DEFAULT NULL,
  `ishot` int(10) DEFAULT '0',
  `timestart` date DEFAULT NULL,
  `timeout` date DEFAULT NULL,
  `situation` int(11) DEFAULT '0',
  `suggestion` text,
  `isonline` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `NUSERID` (`userid`),
  KEY `FK_i1gms26iheicj5aollprcpag0` (`id`),
  CONSTRAINT `NUSERID` FOREIGN KEY (`userid`) REFERENCES `u_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of n_news
-- ----------------------------
INSERT INTO `n_news` VALUES ('11', '2', '32', '23', '23', '/forfun/newsupload/1448256725783.png', '232', '23', '0', '2015-11-23', '2015-11-23', '1', '', '0');
INSERT INTO `n_news` VALUES ('13', '1', '123', '123', '231', '/forfun/newsupload/1448264821668.jpg', '', '123', '0', '2015-11-23', '2015-11-23', '2', '', '0');
INSERT INTO `n_news` VALUES ('14', '1', '123', '123', '231', '/forfun/newsupload/1448264864883.png', '', '123', '0', '2015-11-23', '2015-11-23', '1', '', '0');
INSERT INTO `n_news` VALUES ('15', '1', '123', '123', '13', '/forfun/newsupload/1448266473870.jpg', '<img src=\"/forfun/newsupload/1448266449558.jpg\" alt=\"\" />', '23', '0', '2015-11-23', '2015-11-23', '0', '', '0');
INSERT INTO `n_news` VALUES ('16', '1', '12', '123', '13', '/forfun/newsupload/1448326831788.jpg', '123', '123', '0', '2015-11-24', '2015-11-24', '0', '', '0');
INSERT INTO `n_news` VALUES ('17', '1', '21', '12', '12', '/forfun/newsupload/1448327062758.jpg', '12', '12', '0', '2015-11-24', '2015-11-24', '0', '', '0');
INSERT INTO `n_news` VALUES ('18', '1', '12', '12', '12', '/forfun/newsupload/1448328527928.png', '12', '1', '0', '2015-11-24', '2015-11-24', '0', '', '0');
INSERT INTO `n_news` VALUES ('19', '1', '12', '12', '12', '/forfun/newsupload/1448328642257.jpg', '', '12', '0', '2015-11-24', '2015-11-24', '0', '', '0');
INSERT INTO `n_news` VALUES ('20', '1', '12', '12', '12', '/forfun/newsupload/1448328805127.jpg', '123', '12', '0', '2015-11-24', '2015-11-24', '0', '', '0');
INSERT INTO `n_news` VALUES ('21', '1', '12', '12', '12', '/forfun/newsupload/1448328835146.jpg', '123', '12', '0', '2015-11-24', '2015-11-24', '0', '', '0');
INSERT INTO `n_news` VALUES ('22', '1', '12', '12', '12', '/forfun/newsupload/1448328870431.jpg', '123', '12', '0', '2015-11-24', '2015-11-24', '0', '', '0');
INSERT INTO `n_news` VALUES ('23', '1', '12', '12', '12', '/forfun/newsupload/1448328963838.jpg', '1231', '12', '0', '2015-11-24', '2015-11-24', '0', '', '0');
INSERT INTO `n_news` VALUES ('24', '1', '2', '23', '32', '/forfun/newsupload/1448345331387.jpg', '23', '23', '0', '2015-11-24', '2015-11-24', '0', '', '0');
INSERT INTO `n_news` VALUES ('25', '1', '13', '2', '3', '/forfun/newsupload/1448345434818.jpg', '121', '3', '0', '2015-11-18', '2015-11-30', '0', '', '0');
INSERT INTO `n_news` VALUES ('26', '1', '视频', '视频', '视频', '/forfun/newsupload/1448527740212.jpg', '<div style=\"text-align:center;\">\r\n	<embed src=\"/forfun/newsupload/1448527735995.mp4\" type=\"video/x-ms-asf-plugin\" width=\"550\" height=\"400\" autostart=\"false\" loop=\"true\" />\r\n</div>', '12', '0', '2015-11-26', '2015-11-26', '0', '', '0');
INSERT INTO `n_news` VALUES ('27', '1', '哈哈哈哈', '哈哈哈哈', '哈哈哈哈', '/forfun/newsupload/1448631296349.jpg', '<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">啊啊哈哈哈哈哈</span>\r\n</div>', '12', '0', '2015-11-12', '2015-11-25', '0', '', '0');

-- ----------------------------
-- Table structure for `rf_rolefunction`
-- ----------------------------
DROP TABLE IF EXISTS `rf_rolefunction`;
CREATE TABLE `rf_rolefunction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `functionid` int(11) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fcte0m778hpeai9fj8ej6elp3` (`functionid`),
  KEY `FK_p9xah9wl9em3wwf71owqbho0l` (`roleid`),
  CONSTRAINT `FK_fcte0m778hpeai9fj8ej6elp3` FOREIGN KEY (`functionid`) REFERENCES `f_function` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_p9xah9wl9em3wwf71owqbho0l` FOREIGN KEY (`roleid`) REFERENCES `r_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rf_rolefunction
-- ----------------------------
INSERT INTO `rf_rolefunction` VALUES ('1', '2', '1');
INSERT INTO `rf_rolefunction` VALUES ('2', '3', '1');
INSERT INTO `rf_rolefunction` VALUES ('3', '3', '1');
INSERT INTO `rf_rolefunction` VALUES ('4', '4', '1');
INSERT INTO `rf_rolefunction` VALUES ('5', '5', '1');
INSERT INTO `rf_rolefunction` VALUES ('6', '6', '1');

-- ----------------------------
-- Table structure for `r_role`
-- ----------------------------
DROP TABLE IF EXISTS `r_role`;
CREATE TABLE `r_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_role
-- ----------------------------
INSERT INTO `r_role` VALUES ('1', 'admin');
INSERT INTO `r_role` VALUES ('2', 'Christy');

-- ----------------------------
-- Table structure for `ur_userrole`
-- ----------------------------
DROP TABLE IF EXISTS `ur_userrole`;
CREATE TABLE `ur_userrole` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) DEFAULT NULL,
  `roleid` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `USERID` (`userid`),
  KEY `ROLEID` (`roleid`),
  CONSTRAINT `ROLEID` FOREIGN KEY (`roleid`) REFERENCES `r_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `USERID` FOREIGN KEY (`userid`) REFERENCES `u_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ur_userrole
-- ----------------------------
INSERT INTO `ur_userrole` VALUES ('1', '1', '1');
INSERT INTO `ur_userrole` VALUES ('2', '1', '2');

-- ----------------------------
-- Table structure for `u_user`
-- ----------------------------
DROP TABLE IF EXISTS `u_user`;
CREATE TABLE `u_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_user
-- ----------------------------
INSERT INTO `u_user` VALUES ('1', 'admin', 'admin');
INSERT INTO `u_user` VALUES ('2', '428', null);
INSERT INTO `u_user` VALUES ('3', '222', '22');
INSERT INTO `u_user` VALUES ('4', '111', '111');
INSERT INTO `u_user` VALUES ('5', '21', '21');
INSERT INTO `u_user` VALUES ('55', '1231', '23424');
INSERT INTO `u_user` VALUES ('56', '1231', '123131');
INSERT INTO `u_user` VALUES ('57', 'æµè¯', '23');

-- ----------------------------
-- Procedure structure for `TimeOut`
-- ----------------------------
DROP PROCEDURE IF EXISTS `TimeOut`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TimeOut`()
BEGIN
	update n_news set n_news.isonline = 0 where CURDATE() > n_news.timeout;
END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `TimeOutEvent`
-- ----------------------------
DROP EVENT IF EXISTS `TimeOutEvent`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `TimeOutEvent` ON SCHEDULE EVERY 1 SECOND STARTS '2015-11-27 21:43:51' ON COMPLETION NOT PRESERVE ENABLE DO CALL TimeOut
;;
DELIMITER ;
