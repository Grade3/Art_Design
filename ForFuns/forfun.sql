/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : forfun

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-12-26 20:14:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ad_address`
-- ----------------------------
DROP TABLE IF EXISTS `ad_address`;
CREATE TABLE `ad_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `telephone` varchar(25) DEFAULT NULL,
  `receiver` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_91e4fevv0mvjenxivqj0jf218` (`telephone`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ad_address
-- ----------------------------
INSERT INTO `ad_address` VALUES ('1', 'hhhhhhhhhhh', '1', '12');
INSERT INTO `ad_address` VALUES ('2', '1111', '33', 'ee');
INSERT INTO `ad_address` VALUES ('3', '12441', '1231', '2313');

-- ----------------------------
-- Table structure for `ai_artistinfo`
-- ----------------------------
DROP TABLE IF EXISTS `ai_artistinfo`;
CREATE TABLE `ai_artistinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aritstid` int(11) DEFAULT NULL,
  `paymode` varchar(255) DEFAULT NULL,
  `goodat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aritstid` (`aritstid`),
  CONSTRAINT `ARTIST` FOREIGN KEY (`aritstid`) REFERENCES `c_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ai_artistinfo
-- ----------------------------
INSERT INTO `ai_artistinfo` VALUES ('1', '1', '1', '1');

-- ----------------------------
-- Table structure for `a_advert`
-- ----------------------------
DROP TABLE IF EXISTS `a_advert`;
CREATE TABLE `a_advert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `content` text,
  `money` int(50) DEFAULT NULL,
  `position` int(10) DEFAULT NULL,
  `timestart` date DEFAULT NULL,
  `timeout` date DEFAULT NULL,
  `situation` int(11) DEFAULT NULL,
  `isonline` int(11) DEFAULT NULL,
  `suggestion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ADVERUSERID` (`userid`),
  CONSTRAINT `ADVERUSERID` FOREIGN KEY (`userid`) REFERENCES `u_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_advert
-- ----------------------------
INSERT INTO `a_advert` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '2015-11-11', '2015-12-31', '2', '1', '');
INSERT INTO `a_advert` VALUES ('2', '1', '12', '123', '123', '/forfun/advertupload/1449304402174.jpg', '1231312', '13', '0', '2015-12-06', '2015-12-31', '2', '1', '');
INSERT INTO `a_advert` VALUES ('3', '1', '没钱不买艺术品', '广告', 'kh', '/forfun/advertupload/1450332956000.JPG', 'Just For Fun!', '999', '1', '2015-12-10', '2015-12-24', '1', '1', '');
INSERT INTO `a_advert` VALUES ('4', '1', '有钱也不买艺术品', '没有', 'kh', '/forfun/advertupload/1450333604284.JPG', '反反复复凤飞飞凤飞飞反复', '999', '1', '2015-12-15', '2015-12-18', '1', '1', '');
INSERT INTO `a_advert` VALUES ('5', '1', '抱歉,又被抽到了', 'fsafasf', 'kh', '/forfun/advertupload/1450334009346.JPG', '哈哈哈哈哈哈哈哈哈哈哈哈哈哈', '999999', '1', '2015-12-18', '2015-12-25', '1', '1', '');

-- ----------------------------
-- Table structure for `ca_customeraddress`
-- ----------------------------
DROP TABLE IF EXISTS `ca_customeraddress`;
CREATE TABLE `ca_customeraddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) DEFAULT NULL,
  `addressid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_h0pmehbqpyo6xx8502pxp5dtt` (`addressid`),
  KEY `FK_br5o5lrnj7lipy82cqw31q4iy` (`customerid`),
  CONSTRAINT `FK_br5o5lrnj7lipy82cqw31q4iy` FOREIGN KEY (`customerid`) REFERENCES `c_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_h0pmehbqpyo6xx8502pxp5dtt` FOREIGN KEY (`addressid`) REFERENCES `ad_address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ca_customeraddress
-- ----------------------------
INSERT INTO `ca_customeraddress` VALUES ('1', '1', '1');
INSERT INTO `ca_customeraddress` VALUES ('2', '1', '2');
INSERT INTO `ca_customeraddress` VALUES ('3', '1', '3');

-- ----------------------------
-- Table structure for `c_customer`
-- ----------------------------
DROP TABLE IF EXISTS `c_customer`;
CREATE TABLE `c_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(50) CHARACTER SET utf8 NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 NOT NULL,
  `personnumber` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `telphone` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `realname` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `avator` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `isartist` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of c_customer
-- ----------------------------
INSERT INTO `c_customer` VALUES ('1', 'gy', 'christy', '123456', '3506811111111', '11111', 'gy', '/forfun/avatorupload/1450781848430.jpg', '1');
INSERT INTO `c_customer` VALUES ('2', '2', '1233', '12', '12', '12', '12', '/forfun/avatorupload/1450781848430.jpg', '0');
INSERT INTO `c_customer` VALUES ('3', '12212', '12', '213', '213', '13', '131', '/forfun/avatorupload/1450781848430.jpg', '1');
INSERT INTO `c_customer` VALUES ('4', 'mhzx20', 'kh', '123456', '32108819951117001X', '13666095971', 'kh', '/forfun/avatorupload/1450781848430.jpg', null);

-- ----------------------------
-- Table structure for `ea_examineartist`
-- ----------------------------
DROP TABLE IF EXISTS `ea_examineartist`;
CREATE TABLE `ea_examineartist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(50) NOT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `telphone` varchar(30) DEFAULT NULL,
  `personnumber` varchar(50) DEFAULT NULL,
  `paymode` varchar(255) DEFAULT NULL,
  `goodat` varchar(255) DEFAULT NULL,
  `suggestion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `EXUSERID` (`userid`),
  CONSTRAINT `EXUSERID` FOREIGN KEY (`userid`) REFERENCES `c_customer` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ea_examineartist
-- ----------------------------
INSERT INTO `ea_examineartist` VALUES ('1', 'gy', '1', '1', '1', '1', '1', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

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
-- Table structure for `m_message`
-- ----------------------------
DROP TABLE IF EXISTS `m_message`;
CREATE TABLE `m_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fromid` int(11) DEFAULT NULL,
  `toid` int(11) DEFAULT NULL,
  `message` text,
  `current` datetime DEFAULT NULL,
  `isread` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fdblrv579vjxw47ivyxi57orl` (`fromid`),
  KEY `FK_e355tkrguo7feiycq7xognthk` (`toid`),
  CONSTRAINT `FK_e355tkrguo7feiycq7xognthk` FOREIGN KEY (`toid`) REFERENCES `c_customer` (`id`),
  CONSTRAINT `FK_fdblrv579vjxw47ivyxi57orl` FOREIGN KEY (`fromid`) REFERENCES `c_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_message
-- ----------------------------
INSERT INTO `m_message` VALUES ('25', '2', '1', '<img src=\"/forfun/newsupload/1450447015339.jpg\" alt=\"\" />哈哈哈', '2015-12-18 21:04:47', '1');
INSERT INTO `m_message` VALUES ('26', '3', '1', 'ggg', '2015-12-18 21:52:53', '1');
INSERT INTO `m_message` VALUES ('27', '1', '3', 'jhhh', '2015-12-18 21:53:31', '0');
INSERT INTO `m_message` VALUES ('28', '1', '3', '<img src=\"/forfun/newsupload/1450447015339.jpg\" alt=\"\" />哈哈哈', '2015-12-18 21:56:59', '0');
INSERT INTO `m_message` VALUES ('29', '1', '2', 'asd', '2015-12-22 21:25:02', '1');
INSERT INTO `m_message` VALUES ('30', '1', '2', '护手霜', '2015-12-24 22:02:47', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of n_news
-- ----------------------------
INSERT INTO `n_news` VALUES ('11', '1', '佳士得的香港艺术拍卖展感受到了中国经济寒意', '持续放缓的中国经济，政府的反腐措施以及投机者的撤离令艺术品拍卖市场遇冷。11月28日，香港佳士得举办“亚洲二十世纪及当代艺术”夜场拍卖，但销售业绩不尽理想。', '23', '/forfun/newsupload/1449121374231.jpg', '<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://n.sinaimg.cn/collect/transform/20151201/AVym-fxmaznc5814147.jpg\" alt=\"佳士得拍卖会现场。图片来源：网络\" style=\"border:1px solid #000000;\" /> \r\n</p>\r\n<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:12px;\">佳士得拍卖会现场。图片来源：网络</span> \r\n</p>\r\n<p class=\"p1\" style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	持续放缓的中国经济，政府的反腐措施以及投机者的撤离令艺术品拍卖市场遇冷。11月28日，香港佳士得举办“亚洲二十世纪及当代艺术”夜场拍卖，但销售业绩不尽理想。\r\n</p>\r\n<p class=\"p2\" style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	在“亚洲二十世纪及当代艺术”拍卖会上，佳士得一共售出了价值5.08亿港币（约合 4.19亿元人民币）的藏品，与以往的成交额相比，这个数字显得十分苍白。一年前的香港秋拍，佳士得卖出了价值6.36亿港币（约合5.24亿元人民币） 的艺术品，而在两年前，秋拍的总成交额甚至能够达到9.35亿港币（约合7.71亿元人民币）。在为期六天的香港秋拍马拉松中，周六的销售一向被视为是整 场拍卖会的“重头戏”。\r\n</p>\r\n<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://n.sinaimg.cn/collect/crawl/20151201/Uuvc-fxmaznc5814078.jpg\" alt=\"\" style=\"border:1px solid #E7E7E7;\" /> \r\n</p>\r\n<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:12px;\">佳士得今年的香港秋拍业绩不佳。图片来源：网络</span> \r\n</p>\r\n<p class=\"p2\" style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	对此，香港弗米利恩艺术咨询公司（Vermillion Art Collections）的总监朱沛宗（Jehan Chu）表示：“本季秋拍的业绩有所下降，这是肯定的。艺术品的拍卖具有很大的不确定性，而中国的经济和社会发展前景已经令人们感到忧心忡忡。”\r\n</p>\r\n<p class=\"p2\" style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	经济放缓也反映出了购买模式的转换，富有的中国买家们越来越对西方艺术品“情有独钟”， 纽约和欧洲的拍卖会现场都出现了他们豪掷千金的身影。举例来说，在11月10日的纽约佳士得拍卖会上，来自中国的亿万富翁刘益谦以1.7亿美元（约合 10.8亿元人民币）的价格拍得莫迪利亚尼的名画《斜卧的裸女》，这一数字是香港秋拍总成交额的三倍。\r\n</p>\r\n<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://n.sinaimg.cn/collect/crawl/20151201/7ZS6-fxmcnkr7713384.jpg\" alt=\"\" style=\"border:1px solid #E7E7E7;\" /> \r\n</p>\r\n<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:12px;\">意大利画家莫迪利亚尼的名画《斜卧的裸女》被拍出10.8亿人民币的“天价”。图片来源：网络</span> \r\n</p>\r\n<p class=\"p2\" style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	用美国运通百夫长卡（俗称黑卡）买下该艺术品的刘益谦，获得了能在全世界飞来飞去的免费 里程。据刘的女儿Betty透露，在专为VIP客户而设的香港拍卖会预展上，刘益谦也曾到场观赏，但是否要“出手”还尚未确定。佳士得香港秋拍于11月 27日正式启动，当天所拍卖的物品以高档红酒为主，拍卖会将于12月2日落下帷幕，届时中国艺术品及各式瓷器也将参与拍卖。整个拍卖会将售出包括亚洲艺术 品、当代水墨艺术品、珠宝首饰、钟表、酒、家具和女式手提包在内的诸多藏品。\r\n</p>\r\n<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://n.sinaimg.cn/collect/crawl/20151201/PujG-fxmcnkr7713386.jpg\" alt=\"\" style=\"border:1px solid #E7E7E7;\" /> \r\n</p>\r\n<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:12px;\">亿万富翁刘益谦近来在艺术品拍卖市场上动作频频。图片来源：网络</span> \r\n</p>\r\n<p class=\"p2\" style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	佳士得亚太地区主席高逸龙（François Curiel）表示，尽管中国经济增长放缓，但本月的日内瓦珠宝销售和纽约的现代艺术品销售还是彰显出了中国购买力的强势“回归”。佳士得香港秋拍马拉松 启动之前，高逸龙向媒体透露：“在纽约和日内瓦的艺术市场上，31.8%的销售额来自于亚洲，而其中又有一大部分都来自于中国。”\r\n</p>\r\n<p class=\"p2\" style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	欧美市场的销售数字如此喜人，和这两桩生意的达成不无关联：11月11日，香港富豪刘銮 雄以4860万瑞士法郎（约合3.08亿元人民币）的价格在苏富比拍下了一颗稀世蓝钻，创下了全球珠宝拍卖的价格新高。而仅仅在一天前，他刚刚在佳士得拍 下了一颗价值2870万瑞士法郎（约合1.82亿元人民币）的粉钻。\r\n</p>\r\n<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://n.sinaimg.cn/collect/crawl/20151201/e-2N-fxmcnkr7713388.jpg\" alt=\"\" style=\"border:1px solid #E7E7E7;\" /> \r\n</p>\r\n<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:12px;\">香港富豪刘銮雄。图片来源：网络</span> \r\n</p>\r\n<p class=\"p2\" style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	本次佳士得夜场拍卖的亮点是一幅20世纪的绘画作品，法籍华裔画家常玉的《黄桌上的菊花瓶》以4604万港币（约合3797万元人民币）的价格被出售给了一位电话竞拍者，这个价格比佳士得当初所估计的1500万港币高出了三倍。\r\n</p>\r\n<p class=\"p2\" style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	在11月27日和28日两天，佳士得还售出了价值7100万港币（约合5850万元人民币）的珍稀佳酿，其中的“标王”是一个“名酒12件套”，它包含了1988年的罗曼尼·康帝和勃艮第夜丘的特级葡萄酒。该“12件套”的售出价格为104万港币（约合86万元人民币）。\r\n</p>', '23', '1', '2015-12-02', '2015-12-26', '1', '', '1');
INSERT INTO `n_news` VALUES ('13', '1', '北京经纬艺术馆举办张兴国中国画展', '北京经纬艺术馆举办张兴国中国画展', '231', '/forfun/newsupload/1449121400476.jpg', '<p style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	2015年11月21日北京经纬艺术馆开馆庆典暨“崖壁上的意象”张兴国中国画作品展开展仪式在北京市朝阳区鸿华家园举行。国家画院常务副院长卢禹舜先生，山东艺术学院院长、山东美协主席张志民先生，以及著名画家富中奇先生、郭正英先生、王光明先生等出席了开幕式。出席本次活动的领导和嘉宾有：中央信访总局常务副局长赵晓光先生、定西市人大常务委员会主任马虎成先生、中央办公厅毛泽东纪念堂管理局党组书记宋重冰先生、文化部中数集团董事长、中国音像出版总社社长刘杰先生、卫生部原全国计划生育委员会理事长苗霞先生和甘肃华威集团董事长何维彪先生、甘肃省临洮铝业有限责任公司董事长宋效农先生、临洮新兴集团董事长张存平先生、甘肃省方圆房地产开发有限责任公司董事长张耀林先生以及本次活动的主办方负责人：甘肃经纬实业集团有限责任公司董事长苟永胜先生、经纬艺术机构总经理刘凯宁先生、经纬艺术机构副总经理辛学强先生和本次主展画家张兴国老师。\r\n</p>\r\n<div class=\"img_wrapper\" style=\"margin:20px auto;padding:0px;text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://n.sinaimg.cn/collect/transform/20151202/fbWt-fxmifzc0750131.JPG\" alt=\"卢禹舜院长题词\" style=\"border:1px solid #E7E7E7;\" /><span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:12px;\">卢禹舜院长题词</span> \r\n</div>\r\n<p style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	卢禹舜在开幕式中致辞，对经纬艺术的发展给予了很大的肯定，并寄予厚望。\r\n</p>\r\n<p style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	经纬艺术机构是一所以弘扬中国书画艺术，以提供专业的书画收藏、投资、顾问咨询服务为核心的艺术机构。业务涵盖当代书画家的发掘与推广；近现代、古代中国书画名作的投资、收藏、研究、交流、拍卖等。并擅长专业的展览及拍卖活动的策划与实施。艺术馆隶属于甘肃经纬文化实业发展有限公司，北京经纬正源文化有限公司。\r\n</p>\r\n<div class=\"img_wrapper\" style=\"margin:20px auto;padding:0px;text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://n.sinaimg.cn/collect/transform/20151202/xXVY-fxmcnkr7777343.JPG\" alt=\"现场嘉宾交流\" style=\"border:1px solid #E7E7E7;\" /><span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:12px;\">现场嘉宾交流</span> \r\n</div>\r\n<p style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	艺术馆首展隆重推出了“崖壁上的意象”张兴国中国画作品展，展览作品共50余幅。如何运用现代的创新意识又能在传统模式中走出一条适合自己的图式，也是张兴国多年来一直在苦苦探索的课题。经过多年实践，张兴国认真地汲取多方面的滋养，一边致力于形式语言的拓展延伸，一边从其他姊妹艺术里找寻灵感，力求二者兼容的可行性，这样更凸显了他写意水墨人物画的形式特征和独具力度的笔墨语言。把纯情与至美化作诗情画意，把圣洁与崇高凝成艺术形象，以亦真亦幻的造型手法，求作品的深度、力度和厚度；奇险多变又极为严谨，强劲有力而颇具结构美，旗帜鲜明地表现出了画家的个性特征和审美理想。尤其将敦煌艺术的场面宏大复杂、内容丰富细致表现得淋漓尽致。\r\n</p>\r\n<div class=\"img_wrapper\" style=\"margin:20px auto;padding:0px;text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://n.sinaimg.cn/collect/transform/20151202/kZHj-fxmifzc0750129.JPG\" alt=\"经纬集团董事长苟永胜接受中央数字电视书画频道的采访\" style=\"border:1px solid #E7E7E7;\" /><span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:12px;\">经纬集团董事长苟永胜接受采访</span> \r\n</div>\r\n<p style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	张兴国笑说艺术这东西越是太靠近越是虚无缥缈，有时候分明近在咫尺，却触手不及，就像人世间的有些事是需要用心去做、去体悟的。\r\n</p>\r\n<div class=\"img_wrapper\" style=\"margin:20px auto;padding:0px;text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://n.sinaimg.cn/collect/transform/20151202/sRL--fxmifze7527072.JPG\" alt=\"展览现场\" style=\"border:1px solid #E7E7E7;\" /><span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:12px;\">展览现场</span> \r\n</div>\r\n<p style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	开馆当日，艺术馆还邀请了身着汉服的高级茶艺师以及中国音乐学院的古琴、古筝演奏家助兴。一指空灵，琴声悠扬；一花一叶，暗香浮动；一袭汉服，清新飘逸；一杯香茗，茶韵怡人。\r\n</p>\r\n<div class=\"img_wrapper\" style=\"margin:20px auto;padding:0px;text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://n.sinaimg.cn/collect/transform/20151202/E16J-fxmcnkr7777345.jpg\" alt=\"张兴国 敦煌系列 48cmX68cm\" style=\"border:1px solid #E7E7E7;\" /><span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:12px;\">张兴国 敦煌系列 48cmX68cm</span> \r\n</div>\r\n<p style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	聆听古筝悠扬之音，饱览茶道之精彩绝伦，如此惬意的氛围之中，品一壶清香茗茶，赏一幅水墨佳作，佐以正统中西式茶点，悠享城市中难得的静谧慢生活。\r\n</p>', '123', '1', '2015-12-01', '2015-12-31', '1', '', '1');
INSERT INTO `n_news` VALUES ('14', '1', '视频测试', '视频测试', 'gy', '/forfun/newsupload/1449121416274.jpg', '<div style=\"text-align:center;\">\r\n	<embed src=\"/forfun/newsupload/1449066211886.mp4\" type=\"video/x-ms-asf-plugin\" width=\"550\" height=\"400\" autostart=\"false\" loop=\"true\" /><span style=\"line-height:1.5;\"></span> \r\n</div>', '123', '1', '2015-12-02', '2015-12-31', '1', '', '1');
INSERT INTO `n_news` VALUES ('15', '1', '123', '123', '13', '/forfun/newsupload/1448971290213.jpg', '<div class=\"article article_16\" id=\"artibody\" style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	<p>\r\n		市环保局应急处11月29日曾回应说，27日对空气质量趋势进行了研判，预计29日扩散条件会出现好转，所以启动黄色预警。其后两天还持续污染就升级为橙 色，2日本市空气将彻底好转，因此已不具备升级至红色预警条件。大家只能耐心等待了，据说风已到包头，不过它坐的是绿皮车\r\n	</p>\r\n	<p>\r\n		<strong>新闻回顾：北京雾霾5日不启红色预警 媒体称或因报批麻烦</strong> \r\n	</p>\r\n	<p>\r\n		北京进入“窒息模式”已有几日，天气预报说12月1日下午的雨雪会赶走雾霾。但是，此时此刻正在敲稿的小新，刚刚拉开办公室卷帘，窗外还是灰黄一片。\r\n	</p>\r\n	<p>\r\n		由于能见度太低，行人和车辆都格外谨慎，街头龟速前行的大小车辆堵成一片。对，这样的天气，大人还得上班，孩子还得上学。\r\n	</p>\r\n	<p>\r\n		<strong>霾污染预警到底是什么颜色的？</strong> \r\n	</p>\r\n	<p>\r\n		11月30日6时，中央气象台发布霾橙色预警；30日18时，继续发布霾橙色预警；12月1日6时，继续发布霾橙色预警。\r\n	</p>\r\n	<p>\r\n		30日上午10点，北京市空气重污染应急指挥部宣布将本市空气重污染预警由黄色升级为橙色。这是自今年3月31日《北京市空气重污染应急预案》修订后，首次启动橙色级别的预警，也是今年首个空气重污染橙色预警。\r\n	</p>\r\n	<p>\r\n		《北京市空气重污染应急预案》，由北京市政府2015年3月30日发布。根据相关规定，空气质量指数在200以上为空气重污染。北京已经持续多日空气质量指数为500+。\r\n	</p>\r\n	<p>\r\n		很多小伙伴可能不是很清楚空气污染预警的颜色如何确定，小新给大家简单解释一下。\r\n	</p>\r\n	<p>\r\n		按照《中华人民共和国突发事件应对法》有关规定，依据空气质量预测结果，综合考虑空气污染程度和持续时间，将空气重污染预警分为4个级别，由轻到重依次为蓝色、黄色、橙色和红色预警。\r\n	</p>\r\n	<p>\r\n		而各级预警的发布条件很明确：\r\n	</p>\r\n	<p>\r\n		（一）蓝色预警（预警四级）：预测空气重污染将持续1天（24小时）。\r\n	</p>\r\n	<p>\r\n		（二）黄色预警（预警三级）：预测空气重污染将持续2天（48小时）。\r\n	</p>\r\n	<p>\r\n		（三）橙色预警（预警二级）：预测空气重污染将持续3天（72小时）。\r\n	</p>\r\n	<p>\r\n		（四）红色预警（预警一级）：预测空气重污染将持续3天以上（72小时以上）。\r\n	</p>\r\n	<p>\r\n		从27日到12月1日，北京重污染已持续5日，然而，空气重污染预警仍为橙色。\r\n	</p>\r\n	<p>\r\n		<strong> 红色预警会很“麻烦”？</strong> \r\n	</p>\r\n	<p>\r\n		这几天，各地空气污染指数持续爆表的照片、截图在朋友圈刷屏。有一些PM2.5检测仪器设计数值只有三位，破千的指数已经让它无法正常显示。\r\n	</p>\r\n	<p>\r\n		（11月30日傍晚，北京理想国际大厦楼下的PM2.5空气质量实时监测因为数值破千而无法正常显示，右图118实为1118。）\r\n	</p>\r\n	<p>\r\n		北京市民质疑，北京重霾已经持续远超4日，为何迟迟不启动红色预警？\r\n	</p>\r\n	<p>\r\n		根据《北京市空气重污染应急预案》，一旦达到一级预警“红色预警”，北京市要采取的建议性应急措施有：中小学、幼儿园停课；企事业单位根据空气重污染情况可实行弹性工作制。\r\n	</p>\r\n	<p>\r\n		而需要采取的强制性应急措施包括：全市范围内依法实施机动车单双号行驶（纯电动汽车除外），其中本市公务用车在单双号行驶的基础上，再停驶车辆总数的30%……\r\n	</p>\r\n	<p>\r\n		而“红色预警”必须由北京市应急委主任批准，由市应急办提前24小时组织发布。目前，北京市应急委主任为北京市委副书记、市长王安顺。\r\n	</p>\r\n	<p>\r\n		作为一个普通的北京市民，小新和大家的想法一致：既然无法阻止雾霾侵袭，至少可以躲在家里。\r\n	</p>\r\n	<p>\r\n		然而，霾没走，红色预警也没来。\r\n	</p>\r\n	<p>\r\n		北京市环保局应急处处长此前就此问题回应过媒体，小新梳理了一下：11.27北京空气开始重度污染。“预计29日扩散条件会出现好转”，达不到重污染程度。因此启动黄色预警。\r\n	</p>\r\n	<p>\r\n		11.28空气持续重污染。11.29北京空气质量短暂好转，但全天整体空气质量为中度到重度污染。11.30北京局地pm2.5指数破1000。“预计12月2日会好转”，因此启动橙色预警。12.1空气持续重污染，继续橙色预警。12.2雾霾有望消除。\r\n	</p>\r\n	<p>\r\n		通过这个时间轴，我们可以看出，是否启动红色预警的关键是重污染持续的时间。只有持续72小时以上，才可启动红色预警。\r\n	</p>\r\n	<p>\r\n		从27日-12月1日，持续整整五日的重污染，在11月30日再次研判时，因为预计再过两日“救兵”冷空气就来了，所以，依旧没有启动红色预警。\r\n	</p>\r\n	<p>\r\n		至此，在PM2.5已经爆表致机器无法显示时，大人们还得坚持上班，孩子还要坚持上学。\r\n	</p>\r\n	<p>\r\n		<strong>有章不循那制订了干嘛？</strong> \r\n	</p>\r\n	<p>\r\n		如果此次持续五日的重霾尚不能促成启动红色预警，那么，《北京市空气重污染应急预案》是不是仅为一纸空文？\r\n	</p>\r\n	<p>\r\n		北京市环保局应急处处长表示，事实上，橙色预警已经包括了大量强制性减排措施，包括全市停止土石方、建筑拆除、混凝土浇筑、建筑垃圾和渣土运输、喷涂粉刷等施工作业；有关工业企业实施停产限产措施等，只要认真落实，减排力度一样很大。\r\n	</p>\r\n	<p>\r\n		小新忍不住要问：效果在哪里？\r\n	</p>\r\n	<div id=\"ad_44086\" class=\"otherContent_01\" style=\"margin:10px 20px 10px 0px;padding:4px;border:1px solid #CDCDCD;\">\r\n		<br />\r\n	</div>\r\n	<p>\r\n		北京市环保局应急处处长还表示，相对红色预警，启动时将实施机动车单双号限行、中小学停课，橙色预警对市民日常生活影响更小，“我们希望市民能够在做好自我防护的同时，积极践行绿色生活，减少污染排放，监督环境违法行为，这样预警的目的也就达到了”。\r\n	</p>\r\n	<p>\r\n		可连政府“大量强制性减排措施”都无法阻止雾霾继续肆虐，市民不开车、少做饭，又能起多大作用？\r\n	</p>\r\n	<p>\r\n		中国环境科学研究院副院长柴发合在接受《京华时报》采访时表示：“在红色预警的启动上，还是应该比较审慎的。”\r\n	</p>\r\n	<p>\r\n		但柴发合也表示，既然设立了预案，设置了门槛，那么在预测达到这样的污染水平时，还是应该按规定启动。“当然，这在很大程度上与环保部门对空气质量状况的预报预测能力和水平有关”。\r\n	</p>\r\n	<p>\r\n		北京市有关部门在对11月29日空气污染程度的研判上，是否出现“误判”？这个“误判”该由谁来负责？\r\n	</p>\r\n	<div style=\"font-size:0px;\">\r\n	</div>\r\n</div>\r\n<div id=\"navStopHere\" style=\"font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n</div>\r\n<div class=\"news_weixin_ercode clearfix\" style=\"font-size:16px;text-align:center;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	<p>\r\n		<strong>更多猛料！欢迎扫描下方二维码关注新浪新闻官方微信(xinlang-xinwen)。</strong> \r\n	</p>\r\n	<div class=\"img_wrapper\">\r\n		<img class=\"ercodepic\" alt=\"新浪新闻\" src=\"http://i3.sinaimg.cn/dy/main/other/qrcode_news.jpg\" style=\"border:1px solid #D0D0D0;\" /> \r\n	</div>\r\n</div>', '23', '1', '2015-12-01', '2016-01-29', '0', '', '1');
INSERT INTO `n_news` VALUES ('16', '1', '12', '123', '13', '/forfun/newsupload/1448326831788.jpg', '123', '123', '1', '2015-11-24', '2015-11-24', '0', '', '0');
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
INSERT INTO `n_news` VALUES ('28', '1', '12', '12', '12', '/forfun/newsupload/1448892823762.jpg', '2342424', '12', '0', '2015-11-10', '2015-11-27', '0', '', '0');
INSERT INTO `n_news` VALUES ('29', '1', '121', '1231', '21313', '/forfun/newsupload/1449060110342.jpg', '13123', '1231321', '0', '2015-12-18', '2015-12-30', '0', '', '1');
INSERT INTO `n_news` VALUES ('30', '1', '123', '3123', '123', '/forfun/newsupload/1450444697584.jpg', '313<img src=\"/forfun/newsupload/1450444695966.jpg\" alt=\"\" />', '123', '0', '2015-12-09', '2015-12-31', '0', '', '1');

-- ----------------------------
-- Table structure for `oa_orderaddress`
-- ----------------------------
DROP TABLE IF EXISTS `oa_orderaddress`;
CREATE TABLE `oa_orderaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) DEFAULT NULL,
  `addressid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1bsx742l1k7a1qernbjlpvmpj` (`addressid`),
  KEY `FK_tl65kv2538dp3i5h8ehjmrm1w` (`orderid`),
  CONSTRAINT `FK_1bsx742l1k7a1qernbjlpvmpj` FOREIGN KEY (`addressid`) REFERENCES `ad_address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tl65kv2538dp3i5h8ehjmrm1w` FOREIGN KEY (`orderid`) REFERENCES `o_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_orderaddress
-- ----------------------------
INSERT INTO `oa_orderaddress` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for `o_order`
-- ----------------------------
DROP TABLE IF EXISTS `o_order`;
CREATE TABLE `o_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) DEFAULT NULL,
  `customerid` int(11) DEFAULT NULL,
  `current` date DEFAULT NULL,
  `ispay` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6k0uxsm9w1hjnp1muvkrkfef9` (`customerid`),
  KEY `FK_t89xec3n0adjmtyfww6eow4wc` (`productid`),
  CONSTRAINT `FK_6k0uxsm9w1hjnp1muvkrkfef9` FOREIGN KEY (`customerid`) REFERENCES `c_customer` (`id`),
  CONSTRAINT `FK_t89xec3n0adjmtyfww6eow4wc` FOREIGN KEY (`productid`) REFERENCES `p_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o_order
-- ----------------------------
INSERT INTO `o_order` VALUES ('1', '1', '1', '2015-12-25', '0');

-- ----------------------------
-- Table structure for `pm_productmoney`
-- ----------------------------
DROP TABLE IF EXISTS `pm_productmoney`;
CREATE TABLE `pm_productmoney` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) DEFAULT NULL,
  `customerid` int(11) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `currenttime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_medowh6ptfyd3ag6j59viq9np` (`customerid`),
  KEY `FK_ner8fgw1gx6osl7b6i6fxvxei` (`productid`),
  CONSTRAINT `FK_medowh6ptfyd3ag6j59viq9np` FOREIGN KEY (`customerid`) REFERENCES `c_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ner8fgw1gx6osl7b6i6fxvxei` FOREIGN KEY (`productid`) REFERENCES `p_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pm_productmoney
-- ----------------------------
INSERT INTO `pm_productmoney` VALUES ('1', '1', '1', '21', '2015-12-24 19:10:38');
INSERT INTO `pm_productmoney` VALUES ('2', '1', '1', '33', '2015-12-24 19:10:51');

-- ----------------------------
-- Table structure for `ps_productsell`
-- ----------------------------
DROP TABLE IF EXISTS `ps_productsell`;
CREATE TABLE `ps_productsell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) DEFAULT NULL,
  `sellmethodid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_b767vrittw9fd943i9hig7yij` (`sellmethodid`),
  KEY `FK_em1wxfqchkn2yluip1xc4krfb` (`productid`),
  CONSTRAINT `FK_b767vrittw9fd943i9hig7yij` FOREIGN KEY (`sellmethodid`) REFERENCES `sm_sellmethod` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_em1wxfqchkn2yluip1xc4krfb` FOREIGN KEY (`productid`) REFERENCES `p_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_productsell
-- ----------------------------
INSERT INTO `ps_productsell` VALUES ('1', '1', '1');
INSERT INTO `ps_productsell` VALUES ('2', '2', '1');
INSERT INTO `ps_productsell` VALUES ('3', '3', '1');
INSERT INTO `ps_productsell` VALUES ('4', '4', '1');
INSERT INTO `ps_productsell` VALUES ('6', '6', '1');

-- ----------------------------
-- Table structure for `pt_producttype`
-- ----------------------------
DROP TABLE IF EXISTS `pt_producttype`;
CREATE TABLE `pt_producttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pt_producttype
-- ----------------------------
INSERT INTO `pt_producttype` VALUES ('1', '字画');
INSERT INTO `pt_producttype` VALUES ('2', '古董');

-- ----------------------------
-- Table structure for `p_product`
-- ----------------------------
DROP TABLE IF EXISTS `p_product`;
CREATE TABLE `p_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `artistid` int(11) NOT NULL,
  `money` int(11) DEFAULT NULL,
  `timestart` date DEFAULT NULL,
  `timeout` date DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  `content` text,
  `imgone` varchar(255) DEFAULT NULL,
  `imgtwo` varchar(255) DEFAULT NULL,
  `imgthree` varchar(255) DEFAULT NULL,
  `situation` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3a2286hejr4r95bofseli5r42` (`artistid`),
  KEY `FK_b3oo9oqhednel04ew5ix08gxa` (`typeid`),
  CONSTRAINT `FK_3a2286hejr4r95bofseli5r42` FOREIGN KEY (`artistid`) REFERENCES `c_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_b3oo9oqhednel04ew5ix08gxa` FOREIGN KEY (`typeid`) REFERENCES `pt_producttype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_product
-- ----------------------------
INSERT INTO `p_product` VALUES ('1', 'kh', '/forfun/newsupload/1449304402174.JPG', '1', '1', '2015-12-06', '2015-12-31', '1', '非卖品', '/forfun/newsupload/IMG_0269.JPG', '/forfun/newsupload/IMG_0271.JPG', '/forfun/newsupload/IMG_0272.JPG', '3');
INSERT INTO `p_product` VALUES ('2', 'lxn', '/forfun/newsupload/1449304402174.JPG', '1', '1', '2015-12-05', '2015-12-29', '1', '1', '/forfun/newsupload/IMG_0269.JPG', '/forfun/newsupload/IMG_0271.JPG', '/forfun/newsupload/IMG_0272.JPG', '1');
INSERT INTO `p_product` VALUES ('3', 'gy', '/forfun/newsupload/1449304402174.JPG', '2', '1', '2015-12-13', '2015-12-31', '1', '1', '/forfun/newsupload/IMG_0269.JPG', '/forfun/newsupload/IMG_0271.JPG', '/forfun/newsupload/IMG_0272.JPG', '1');
INSERT INTO `p_product` VALUES ('4', 'wlx', '/forfun/newsupload/1449304402174.JPG', '2', '1', '2015-12-07', '2015-12-31', '1', '1', '/forfun/newsupload/IMG_0269.JPG', '/forfun/newsupload/IMG_0271.JPG', '/forfun/newsupload/IMG_0272.JPG', '1');
INSERT INTO `p_product` VALUES ('6', '123', '/forfun/avatorupload/1450804600085.jpg', '2', '123', '2015-12-23', '2015-12-25', '1', '132141', '/forfun/avatorupload/1450804600085.jpg1450804600086.jpg', '/forfun/avatorupload/1450804600085.jpg1450804600086.jpg1450804600087.png', '/forfun/avatorupload/1450804600085.jpg1450804600086.jpg1450804600087.png1450804600087.png', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

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
-- Table structure for `sm_sellmethod`
-- ----------------------------
DROP TABLE IF EXISTS `sm_sellmethod`;
CREATE TABLE `sm_sellmethod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_sellmethod
-- ----------------------------
INSERT INTO `sm_sellmethod` VALUES ('1', '一口价');
INSERT INTO `sm_sellmethod` VALUES ('2', '拍卖');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ur_userrole
-- ----------------------------
INSERT INTO `ur_userrole` VALUES ('3', '1', '2');

-- ----------------------------
-- Table structure for `u_user`
-- ----------------------------
DROP TABLE IF EXISTS `u_user`;
CREATE TABLE `u_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

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

-- ----------------------------
-- Procedure structure for `TimeOut`
-- ----------------------------
DROP PROCEDURE IF EXISTS `TimeOut`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TimeOut`()
BEGIN
	update n_news set n_news.isonline = 0 where CURDATE() > n_news.timeout or CURDATE() < n_news.timestart;
	update n_news set n_news.isonline = 1 where CURDATE() < n_news.timeout and CURDATE() > n_news.timestart;
	update p_product set p_product.situation = 2 where CURDATE() > p_product.timeout and p_product.situation = 1;
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
DROP TRIGGER IF EXISTS `ALERTSTUATION`;
DELIMITER ;;
CREATE TRIGGER `ALERTSTUATION` AFTER INSERT ON `o_order` FOR EACH ROW begin
update p_product pp set situation=3 where pp.id = new.productid;
end
;;
DELIMITER ;
