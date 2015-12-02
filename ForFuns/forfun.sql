/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : forfun

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-12-01 23:38:38
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_advert
-- ----------------------------
INSERT INTO `a_advert` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '2015-11-11', '2015-11-26', '1', '1', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of c_customer
-- ----------------------------
INSERT INTO `c_customer` VALUES ('1', '1', 'christy', '123456', '3506811111111', '11111', 'gy', '/forfun/newsupload/1448256725783.png', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of n_news
-- ----------------------------
INSERT INTO `n_news` VALUES ('11', '1', '佳士得的香港艺术拍卖展感受到了中国经济寒意', '持续放缓的中国经济，政府的反腐措施以及投机者的撤离令艺术品拍卖市场遇冷。11月28日，香港佳士得举办“亚洲二十世纪及当代艺术”夜场拍卖，但销售业绩不尽理想。', '23', '/forfun/newsupload/1448971642645.jpg', '<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://n.sinaimg.cn/collect/transform/20151201/AVym-fxmaznc5814147.jpg\" alt=\"佳士得拍卖会现场。图片来源：网络\" style=\"border:1px solid #000000;\" />\r\n</p>\r\n<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:12px;\">佳士得拍卖会现场。图片来源：网络</span>\r\n</p>\r\n<p class=\"p1\" style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	持续放缓的中国经济，政府的反腐措施以及投机者的撤离令艺术品拍卖市场遇冷。11月28日，香港佳士得举办“亚洲二十世纪及当代艺术”夜场拍卖，但销售业绩不尽理想。\r\n</p>\r\n<p class=\"p2\" style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	在“亚洲二十世纪及当代艺术”拍卖会上，佳士得一共售出了价值5.08亿港币（约合 4.19亿元人民币）的藏品，与以往的成交额相比，这个数字显得十分苍白。一年前的香港秋拍，佳士得卖出了价值6.36亿港币（约合5.24亿元人民币） 的艺术品，而在两年前，秋拍的总成交额甚至能够达到9.35亿港币（约合7.71亿元人民币）。在为期六天的香港秋拍马拉松中，周六的销售一向被视为是整 场拍卖会的“重头戏”。\r\n</p>\r\n<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://n.sinaimg.cn/collect/crawl/20151201/Uuvc-fxmaznc5814078.jpg\" alt=\"\" style=\"border:1px solid #E7E7E7;\" />\r\n</p>\r\n<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:12px;\">佳士得今年的香港秋拍业绩不佳。图片来源：网络</span>\r\n</p>\r\n<p class=\"p2\" style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	对此，香港弗米利恩艺术咨询公司（Vermillion Art Collections）的总监朱沛宗（Jehan Chu）表示：“本季秋拍的业绩有所下降，这是肯定的。艺术品的拍卖具有很大的不确定性，而中国的经济和社会发展前景已经令人们感到忧心忡忡。”\r\n</p>\r\n<p class=\"p2\" style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	经济放缓也反映出了购买模式的转换，富有的中国买家们越来越对西方艺术品“情有独钟”， 纽约和欧洲的拍卖会现场都出现了他们豪掷千金的身影。举例来说，在11月10日的纽约佳士得拍卖会上，来自中国的亿万富翁刘益谦以1.7亿美元（约合 10.8亿元人民币）的价格拍得莫迪利亚尼的名画《斜卧的裸女》，这一数字是香港秋拍总成交额的三倍。\r\n</p>\r\n<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://n.sinaimg.cn/collect/crawl/20151201/7ZS6-fxmcnkr7713384.jpg\" alt=\"\" style=\"border:1px solid #E7E7E7;\" />\r\n</p>\r\n<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:12px;\">意大利画家莫迪利亚尼的名画《斜卧的裸女》被拍出10.8亿人民币的“天价”。图片来源：网络</span>\r\n</p>\r\n<p class=\"p2\" style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	用美国运通百夫长卡（俗称黑卡）买下该艺术品的刘益谦，获得了能在全世界飞来飞去的免费 里程。据刘的女儿Betty透露，在专为VIP客户而设的香港拍卖会预展上，刘益谦也曾到场观赏，但是否要“出手”还尚未确定。佳士得香港秋拍于11月 27日正式启动，当天所拍卖的物品以高档红酒为主，拍卖会将于12月2日落下帷幕，届时中国艺术品及各式瓷器也将参与拍卖。整个拍卖会将售出包括亚洲艺术 品、当代水墨艺术品、珠宝首饰、钟表、酒、家具和女式手提包在内的诸多藏品。\r\n</p>\r\n<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://n.sinaimg.cn/collect/crawl/20151201/PujG-fxmcnkr7713386.jpg\" alt=\"\" style=\"border:1px solid #E7E7E7;\" />\r\n</p>\r\n<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:12px;\">亿万富翁刘益谦近来在艺术品拍卖市场上动作频频。图片来源：网络</span>\r\n</p>\r\n<p class=\"p2\" style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	佳士得亚太地区主席高逸龙（François Curiel）表示，尽管中国经济增长放缓，但本月的日内瓦珠宝销售和纽约的现代艺术品销售还是彰显出了中国购买力的强势“回归”。佳士得香港秋拍马拉松 启动之前，高逸龙向媒体透露：“在纽约和日内瓦的艺术市场上，31.8%的销售额来自于亚洲，而其中又有一大部分都来自于中国。”\r\n</p>\r\n<p class=\"p2\" style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	欧美市场的销售数字如此喜人，和这两桩生意的达成不无关联：11月11日，香港富豪刘銮 雄以4860万瑞士法郎（约合3.08亿元人民币）的价格在苏富比拍下了一颗稀世蓝钻，创下了全球珠宝拍卖的价格新高。而仅仅在一天前，他刚刚在佳士得拍 下了一颗价值2870万瑞士法郎（约合1.82亿元人民币）的粉钻。\r\n</p>\r\n<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://n.sinaimg.cn/collect/crawl/20151201/e-2N-fxmcnkr7713388.jpg\" alt=\"\" style=\"border:1px solid #E7E7E7;\" />\r\n</p>\r\n<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:12px;\">香港富豪刘銮雄。图片来源：网络</span>\r\n</p>\r\n<p class=\"p2\" style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	本次佳士得夜场拍卖的亮点是一幅20世纪的绘画作品，法籍华裔画家常玉的《黄桌上的菊花瓶》以4604万港币（约合3797万元人民币）的价格被出售给了一位电话竞拍者，这个价格比佳士得当初所估计的1500万港币高出了三倍。\r\n</p>\r\n<p class=\"p2\" style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	在11月27日和28日两天，佳士得还售出了价值7100万港币（约合5850万元人民币）的珍稀佳酿，其中的“标王”是一个“名酒12件套”，它包含了1988年的罗曼尼·康帝和勃艮第夜丘的特级葡萄酒。该“12件套”的售出价格为104万港币（约合86万元人民币）。\r\n</p>', '23', '1', '2015-12-01', '2015-12-01', '0', '', '1');
INSERT INTO `n_news` VALUES ('13', '1', '123', '123', '231', '/forfun/newsupload/1448969618194.jpg', '', '123', '1', '2015-12-01', '2015-12-19', '0', '', '1');
INSERT INTO `n_news` VALUES ('14', '1', '123', '123', '231', '/forfun/newsupload/1448971273725.jpg', '', '123', '1', '2015-12-01', '2015-12-01', '0', '', '1');
INSERT INTO `n_news` VALUES ('15', '1', '123', '123', '13', '/forfun/newsupload/1448971290213.jpg', '<div class=\"article article_16\" id=\"artibody\" style=\"font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	<p>\r\n		市环保局应急处11月29日曾回应说，27日对空气质量趋势进行了研判，预计29日扩散条件会出现好转，所以启动黄色预警。其后两天还持续污染就升级为橙 色，2日本市空气将彻底好转，因此已不具备升级至红色预警条件。大家只能耐心等待了，据说风已到包头，不过它坐的是绿皮车\r\n	</p>\r\n	<p>\r\n		<strong>新闻回顾：北京雾霾5日不启红色预警 媒体称或因报批麻烦</strong> \r\n	</p>\r\n	<p>\r\n		北京进入“窒息模式”已有几日，天气预报说12月1日下午的雨雪会赶走雾霾。但是，此时此刻正在敲稿的小新，刚刚拉开办公室卷帘，窗外还是灰黄一片。\r\n	</p>\r\n	<p>\r\n		由于能见度太低，行人和车辆都格外谨慎，街头龟速前行的大小车辆堵成一片。对，这样的天气，大人还得上班，孩子还得上学。\r\n	</p>\r\n	<p>\r\n		<strong>霾污染预警到底是什么颜色的？</strong> \r\n	</p>\r\n	<p>\r\n		11月30日6时，中央气象台发布霾橙色预警；30日18时，继续发布霾橙色预警；12月1日6时，继续发布霾橙色预警。\r\n	</p>\r\n	<p>\r\n		30日上午10点，北京市空气重污染应急指挥部宣布将本市空气重污染预警由黄色升级为橙色。这是自今年3月31日《北京市空气重污染应急预案》修订后，首次启动橙色级别的预警，也是今年首个空气重污染橙色预警。\r\n	</p>\r\n	<p>\r\n		《北京市空气重污染应急预案》，由北京市政府2015年3月30日发布。根据相关规定，空气质量指数在200以上为空气重污染。北京已经持续多日空气质量指数为500+。\r\n	</p>\r\n	<p>\r\n		很多小伙伴可能不是很清楚空气污染预警的颜色如何确定，小新给大家简单解释一下。\r\n	</p>\r\n	<p>\r\n		按照《中华人民共和国突发事件应对法》有关规定，依据空气质量预测结果，综合考虑空气污染程度和持续时间，将空气重污染预警分为4个级别，由轻到重依次为蓝色、黄色、橙色和红色预警。\r\n	</p>\r\n	<p>\r\n		而各级预警的发布条件很明确：\r\n	</p>\r\n	<p>\r\n		（一）蓝色预警（预警四级）：预测空气重污染将持续1天（24小时）。\r\n	</p>\r\n	<p>\r\n		（二）黄色预警（预警三级）：预测空气重污染将持续2天（48小时）。\r\n	</p>\r\n	<p>\r\n		（三）橙色预警（预警二级）：预测空气重污染将持续3天（72小时）。\r\n	</p>\r\n	<p>\r\n		（四）红色预警（预警一级）：预测空气重污染将持续3天以上（72小时以上）。\r\n	</p>\r\n	<p>\r\n		从27日到12月1日，北京重污染已持续5日，然而，空气重污染预警仍为橙色。\r\n	</p>\r\n	<p>\r\n		<strong> 红色预警会很“麻烦”？</strong> \r\n	</p>\r\n	<p>\r\n		这几天，各地空气污染指数持续爆表的照片、截图在朋友圈刷屏。有一些PM2.5检测仪器设计数值只有三位，破千的指数已经让它无法正常显示。\r\n	</p>\r\n	<p>\r\n		（11月30日傍晚，北京理想国际大厦楼下的PM2.5空气质量实时监测因为数值破千而无法正常显示，右图118实为1118。）\r\n	</p>\r\n	<p>\r\n		北京市民质疑，北京重霾已经持续远超4日，为何迟迟不启动红色预警？\r\n	</p>\r\n	<p>\r\n		根据《北京市空气重污染应急预案》，一旦达到一级预警“红色预警”，北京市要采取的建议性应急措施有：中小学、幼儿园停课；企事业单位根据空气重污染情况可实行弹性工作制。\r\n	</p>\r\n	<p>\r\n		而需要采取的强制性应急措施包括：全市范围内依法实施机动车单双号行驶（纯电动汽车除外），其中本市公务用车在单双号行驶的基础上，再停驶车辆总数的30%……\r\n	</p>\r\n	<p>\r\n		而“红色预警”必须由北京市应急委主任批准，由市应急办提前24小时组织发布。目前，北京市应急委主任为北京市委副书记、市长王安顺。\r\n	</p>\r\n	<p>\r\n		作为一个普通的北京市民，小新和大家的想法一致：既然无法阻止雾霾侵袭，至少可以躲在家里。\r\n	</p>\r\n	<p>\r\n		然而，霾没走，红色预警也没来。\r\n	</p>\r\n	<p>\r\n		北京市环保局应急处处长此前就此问题回应过媒体，小新梳理了一下：11.27北京空气开始重度污染。“预计29日扩散条件会出现好转”，达不到重污染程度。因此启动黄色预警。\r\n	</p>\r\n	<p>\r\n		11.28空气持续重污染。11.29北京空气质量短暂好转，但全天整体空气质量为中度到重度污染。11.30北京局地pm2.5指数破1000。“预计12月2日会好转”，因此启动橙色预警。12.1空气持续重污染，继续橙色预警。12.2雾霾有望消除。\r\n	</p>\r\n	<p>\r\n		通过这个时间轴，我们可以看出，是否启动红色预警的关键是重污染持续的时间。只有持续72小时以上，才可启动红色预警。\r\n	</p>\r\n	<p>\r\n		从27日-12月1日，持续整整五日的重污染，在11月30日再次研判时，因为预计再过两日“救兵”冷空气就来了，所以，依旧没有启动红色预警。\r\n	</p>\r\n	<p>\r\n		至此，在PM2.5已经爆表致机器无法显示时，大人们还得坚持上班，孩子还要坚持上学。\r\n	</p>\r\n	<p>\r\n		<strong>有章不循那制订了干嘛？</strong> \r\n	</p>\r\n	<p>\r\n		如果此次持续五日的重霾尚不能促成启动红色预警，那么，《北京市空气重污染应急预案》是不是仅为一纸空文？\r\n	</p>\r\n	<p>\r\n		北京市环保局应急处处长表示，事实上，橙色预警已经包括了大量强制性减排措施，包括全市停止土石方、建筑拆除、混凝土浇筑、建筑垃圾和渣土运输、喷涂粉刷等施工作业；有关工业企业实施停产限产措施等，只要认真落实，减排力度一样很大。\r\n	</p>\r\n	<p>\r\n		小新忍不住要问：效果在哪里？\r\n	</p>\r\n	<div id=\"ad_44086\" class=\"otherContent_01\" style=\"margin:10px 20px 10px 0px;padding:4px;border:1px solid #CDCDCD;\">\r\n		<br />\r\n	</div>\r\n	<p>\r\n		北京市环保局应急处处长还表示，相对红色预警，启动时将实施机动车单双号限行、中小学停课，橙色预警对市民日常生活影响更小，“我们希望市民能够在做好自我防护的同时，积极践行绿色生活，减少污染排放，监督环境违法行为，这样预警的目的也就达到了”。\r\n	</p>\r\n	<p>\r\n		可连政府“大量强制性减排措施”都无法阻止雾霾继续肆虐，市民不开车、少做饭，又能起多大作用？\r\n	</p>\r\n	<p>\r\n		中国环境科学研究院副院长柴发合在接受《京华时报》采访时表示：“在红色预警的启动上，还是应该比较审慎的。”\r\n	</p>\r\n	<p>\r\n		但柴发合也表示，既然设立了预案，设置了门槛，那么在预测达到这样的污染水平时，还是应该按规定启动。“当然，这在很大程度上与环保部门对空气质量状况的预报预测能力和水平有关”。\r\n	</p>\r\n	<p>\r\n		北京市有关部门在对11月29日空气污染程度的研判上，是否出现“误判”？这个“误判”该由谁来负责？\r\n	</p>\r\n	<div style=\"font-size:0px;\">\r\n	</div>\r\n</div>\r\n<div id=\"navStopHere\" style=\"font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n</div>\r\n<div class=\"news_weixin_ercode clearfix\" style=\"font-size:16px;text-align:center;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;\">\r\n	<p>\r\n		<strong>更多猛料！欢迎扫描下方二维码关注新浪新闻官方微信(xinlang-xinwen)。</strong> \r\n	</p>\r\n	<div class=\"img_wrapper\">\r\n		<img class=\"ercodepic\" alt=\"新浪新闻\" src=\"http://i3.sinaimg.cn/dy/main/other/qrcode_news.jpg\" style=\"border:1px solid #D0D0D0;\" /> \r\n	</div>\r\n</div>', '23', '1', '2015-12-01', '2015-12-01', '0', '', '1');
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
