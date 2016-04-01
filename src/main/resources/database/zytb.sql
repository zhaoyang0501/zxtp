/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50087
Source Host           : localhost:3306
Source Database       : zytb

Target Server Type    : MYSQL
Target Server Version : 50087
File Encoding         : 65001

Date: 2015-11-02 22:29:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_adminuser
-- ----------------------------
DROP TABLE IF EXISTS `t_adminuser`;
CREATE TABLE `t_adminuser` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `remark` varchar(255) default NULL,
  `role1` varchar(255) default NULL,
  `role2` varchar(255) default NULL,
  `role3` varchar(255) default NULL,
  `role4` varchar(255) default NULL,
  `role5` varchar(255) default NULL,
  `role6` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_adminuser
-- ----------------------------
INSERT INTO `t_adminuser` VALUES ('1', 'admin', '123456', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for t_area
-- ----------------------------
DROP TABLE IF EXISTS `t_area`;
CREATE TABLE `t_area` (
  `code` int(11) NOT NULL,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_area
-- ----------------------------
INSERT INTO `t_area` VALUES ('11', '北京市');
INSERT INTO `t_area` VALUES ('12', '天津市');
INSERT INTO `t_area` VALUES ('13', '河北省');
INSERT INTO `t_area` VALUES ('14', '山西省');
INSERT INTO `t_area` VALUES ('15', '内蒙古自治区');
INSERT INTO `t_area` VALUES ('21', '辽宁省');
INSERT INTO `t_area` VALUES ('22', '吉林省');
INSERT INTO `t_area` VALUES ('23', '黑龙江省');
INSERT INTO `t_area` VALUES ('31', '上海市');
INSERT INTO `t_area` VALUES ('32', '江苏省');
INSERT INTO `t_area` VALUES ('33', '浙江省');
INSERT INTO `t_area` VALUES ('34', '安徽省');
INSERT INTO `t_area` VALUES ('35', '福建省');
INSERT INTO `t_area` VALUES ('36', '江西省');
INSERT INTO `t_area` VALUES ('37', '山东省');
INSERT INTO `t_area` VALUES ('41', '河南省');
INSERT INTO `t_area` VALUES ('42', '湖北省');
INSERT INTO `t_area` VALUES ('43', '湖南省');
INSERT INTO `t_area` VALUES ('44', '广东省');
INSERT INTO `t_area` VALUES ('45', '广西壮族自治区');
INSERT INTO `t_area` VALUES ('46', '海南省');
INSERT INTO `t_area` VALUES ('50', '重庆市');
INSERT INTO `t_area` VALUES ('51', '四川省');
INSERT INTO `t_area` VALUES ('52', '贵州省');
INSERT INTO `t_area` VALUES ('53', '云南省');
INSERT INTO `t_area` VALUES ('54', '西藏自治区');
INSERT INTO `t_area` VALUES ('61', '陕西省');
INSERT INTO `t_area` VALUES ('62', '甘肃省');
INSERT INTO `t_area` VALUES ('63', '青海省');
INSERT INTO `t_area` VALUES ('64', '宁夏回族自治区');
INSERT INTO `t_area` VALUES ('65', '新疆维吾尔自治区');
INSERT INTO `t_area` VALUES ('71', '台湾省');
INSERT INTO `t_area` VALUES ('81', '香港特别行政区');
INSERT INTO `t_area` VALUES ('82', '澳门特别行政区');

-- ----------------------------
-- Table structure for t_bigtype
-- ----------------------------
DROP TABLE IF EXISTS `t_bigtype`;
CREATE TABLE `t_bigtype` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bigtype
-- ----------------------------
INSERT INTO `t_bigtype` VALUES ('1', '哲学');
INSERT INTO `t_bigtype` VALUES ('2', '经济学');
INSERT INTO `t_bigtype` VALUES ('3', '法学');
INSERT INTO `t_bigtype` VALUES ('4', '教育学');
INSERT INTO `t_bigtype` VALUES ('5', '文学');
INSERT INTO `t_bigtype` VALUES ('6', '历史学');
INSERT INTO `t_bigtype` VALUES ('7', '理学');
INSERT INTO `t_bigtype` VALUES ('8', '工学');
INSERT INTO `t_bigtype` VALUES ('9', '农学');
INSERT INTO `t_bigtype` VALUES ('10', '医学');
INSERT INTO `t_bigtype` VALUES ('11', '管理学');
INSERT INTO `t_bigtype` VALUES ('12', '艺术学');

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `name` varchar(255) default NULL,
  `remark` varchar(255) default NULL,
  `big_type` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_df4et7t3aeujrv7t6ygd7pr5v` (`big_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('1', '2015-10-19 21:33:42', '计算机科学', '计算机科学							', null);
INSERT INTO `t_category` VALUES ('2', '2015-10-19 21:34:00', '土木工程', '土木工程					', null);
INSERT INTO `t_category` VALUES ('3', '2015-10-19 21:34:17', '水利工程', '	666								', '6');

-- ----------------------------
-- Table structure for t_history_major
-- ----------------------------
DROP TABLE IF EXISTS `t_history_major`;
CREATE TABLE `t_history_major` (
  `id` bigint(20) NOT NULL auto_increment,
  `avg_order` int(11) default NULL,
  `avg_score` double default NULL,
  `max_order` int(11) default NULL,
  `max_score` double default NULL,
  `min_order` int(11) default NULL,
  `min_score` double default NULL,
  `total_man` int(11) default NULL,
  `type` int(11) default NULL,
  `year` varchar(255) default NULL,
  `area` int(11) default NULL,
  `category` bigint(20) default NULL,
  `school` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_or2a6bsdcfi1rjb4rkcjkvoas` (`area`),
  KEY `FK_ndcp3r6nsta2dqqhkgu3e0pg1` (`category`),
  KEY `FK_530qbu7b5qd1y7uejnh2mbowg` (`school`),
  CONSTRAINT `FK_530qbu7b5qd1y7uejnh2mbowg` FOREIGN KEY (`school`) REFERENCES `t_school` (`id`),
  CONSTRAINT `FK_ndcp3r6nsta2dqqhkgu3e0pg1` FOREIGN KEY (`category`) REFERENCES `t_category` (`id`),
  CONSTRAINT `FK_or2a6bsdcfi1rjb4rkcjkvoas` FOREIGN KEY (`area`) REFERENCES `t_area` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_history_major
-- ----------------------------
INSERT INTO `t_history_major` VALUES ('1', '45', '45', '45', '45', '45', '45', '45', '10', '2014', '11', '2', '2');
INSERT INTO `t_history_major` VALUES ('2', '8', '7', '3', '2', '6', '5', '1', '10', '2014', '11', '1', '2');

-- ----------------------------
-- Table structure for t_history_score
-- ----------------------------
DROP TABLE IF EXISTS `t_history_score`;
CREATE TABLE `t_history_score` (
  `id` bigint(20) NOT NULL auto_increment,
  `avg_order` int(11) default NULL,
  `avg_score` double default NULL,
  `max_order` int(11) default NULL,
  `max_score` double default NULL,
  `min_order` int(11) default NULL,
  `min_score` double default NULL,
  `total_man` int(11) default NULL,
  `type` int(11) default NULL,
  `year` varchar(255) default NULL,
  `area` int(11) default NULL,
  `school` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_anq4t68vrvs7u82rp9d13qovx` (`area`),
  KEY `FK_4pp65u9kdena04lmr2t89d9ol` (`school`),
  CONSTRAINT `FK_4pp65u9kdena04lmr2t89d9ol` FOREIGN KEY (`school`) REFERENCES `t_school` (`id`),
  CONSTRAINT `FK_anq4t68vrvs7u82rp9d13qovx` FOREIGN KEY (`area`) REFERENCES `t_area` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_history_score
-- ----------------------------
INSERT INTO `t_history_score` VALUES ('1', '7000', '550', '5000', '700', '10000', '600', '400', '10', '2014', '11', '2');
INSERT INTO `t_history_score` VALUES ('2', '8000', '556', '6000', '700', '12000', '512', '400', '10', '2014', '11', '4');
INSERT INTO `t_history_score` VALUES ('3', '67', '67', '67', '67', '67', '67', '67', '10', '2014', '11', '8');

-- ----------------------------
-- Table structure for t_item
-- ----------------------------
DROP TABLE IF EXISTS `t_item`;
CREATE TABLE `t_item` (
  `id` bigint(20) NOT NULL auto_increment,
  `count` int(11) default NULL,
  `create_date` datetime default NULL,
  `img_path` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `price` double default NULL,
  `remark` varchar(255) default NULL,
  `score` double default NULL,
  `category` bigint(20) default NULL,
  `seller` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_r6xjwkq1ksnr9kabgcjeuuj3g` (`category`),
  KEY `FK_8rvg9jrvtoyq8c8q9810vblk` (`seller`),
  CONSTRAINT `FK_8rvg9jrvtoyq8c8q9810vblk` FOREIGN KEY (`seller`) REFERENCES `t_seller` (`id`),
  CONSTRAINT `FK_r6xjwkq1ksnr9kabgcjeuuj3g` FOREIGN KEY (`category`) REFERENCES `t_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_item
-- ----------------------------

-- ----------------------------
-- Table structure for t_myplan
-- ----------------------------
DROP TABLE IF EXISTS `t_myplan`;
CREATE TABLE `t_myplan` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `category` bigint(20) default NULL,
  `school` bigint(20) default NULL,
  `user` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_ku5inft25ie7nor1i5qvpmtc2` (`category`),
  KEY `FK_3hf1ygbx8npdml3k9uw8thyi5` (`school`),
  KEY `FK_3nixev2jdks4anevrai3pwk5t` (`user`),
  CONSTRAINT `FK_3nixev2jdks4anevrai3pwk5t` FOREIGN KEY (`user`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_3hf1ygbx8npdml3k9uw8thyi5` FOREIGN KEY (`school`) REFERENCES `t_school` (`id`),
  CONSTRAINT `FK_ku5inft25ie7nor1i5qvpmtc2` FOREIGN KEY (`category`) REFERENCES `t_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_myplan
-- ----------------------------
INSERT INTO `t_myplan` VALUES ('1', '2015-11-02 22:08:25', '2', '2', '1');
INSERT INTO `t_myplan` VALUES ('2', '2015-11-02 22:08:47', '1', '2', '1');

-- ----------------------------
-- Table structure for t_news
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `id` bigint(20) NOT NULL auto_increment,
  `comefrom` varchar(255) default NULL,
  `context` text,
  `create_date` datetime default NULL,
  `title` varchar(255) default NULL,
  `type` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES ('3', '', '<p style=\"text-align:justify;padding: 6px 0px; margin: 0px auto; border: 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\"><strong style=\"padding: 0px; margin: 0px;\">中国教育在线讯</strong>&nbsp;北京市2016年普通高等学校招生报名工作于2015年11月进行。报名有关事项说明如下：</p><p style=\"text-align:justify;padding: 6px 0px; margin: 0px auto; border: 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\">　　(一)报考考试类型分全国统一招生考试(以下简称“统考”)及单独招生考试(以下简称“单考”)两种，普通高中应届毕业生只能报考统考，其他考生可任选一种。</p><p style=\"text-align:justify;padding: 6px 0px; margin: 0px auto; border: 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\">　　统考分文史类和理工类，考试科目分别为：</p><p style=\"text-align:justify;padding: 6px 0px; margin: 0px auto; border: 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\">　　文史类考生，考语文、数学(文)、外语、文科综合;</p><p style=\"text-align:justify;padding: 6px 0px; margin: 0px auto; border: 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\">　　理工类考生，考语文、数学(理)、外语、理科综合。</p><p style=\"text-align:justify;padding: 6px 0px; margin: 0px auto; border: 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\">　　拟参加本科录取的考生应选择“参加所有科目考试”，如本科未被录取可以填报专科志愿，以语文、数学、外语三科总分参加高职(专科)录取;不参加本科录取直接参加高职(专科)录取的考生可以选择“只参加语文、数学、外语三个科目的考试”。</p><p style=\"text-align:justify;padding: 6px 0px; margin: 0px auto; border: 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\">　　单考考试科目的设置采取“3+X”的模式。“3”指语文、数学、外语三科公共文化课;“X”指招生学校根据不同专业要求设定的综合专业课一科或专业基础课、职业技能课两科，考试内容和考试方法由招生学校自主确定，并根据专业特点及培养要求组织命题、考试和评卷。</p><p><br/></p>', '2015-11-02 20:18:43', '北京2016年高考网上报名注意事项', null);
INSERT INTO `t_news` VALUES ('4', '', '<p style=\"text-align:justify;padding: 6px 0px; margin: 0px auto; border: 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\">　<strong style=\"padding: 0px; margin: 0px;\">中国教育在线讯</strong>&nbsp;北京市2016年普通高等学校招生报名工作于2015年11月进行，2016年北京高考报名分为三个阶段：网上提交报名申请、网上填报个人信息并缴费和报名资格现场确认。</p><p style=\"text-align:justify;padding: 6px 0px; margin: 0px auto; border: 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\"><strong style=\"padding: 0px; margin: 0px;\">　　第一阶段：网上提交报名申请</strong></p><p style=\"text-align:justify;padding: 6px 0px; margin: 0px auto; border: 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\">　　时间：2015年11月9日8时至12日20时(进城务工人员随迁子女申请时间为10月11日8时至14日20时)</p><p style=\"text-align:justify;padding: 6px 0px; margin: 0px auto; border: 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\">　　网址： www.bjeea.edu.cn或www.bjeea.cn</p><p style=\"text-align:justify;padding: 6px 0px; margin: 0px auto; border: 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\">　<strong style=\"padding: 0px; margin: 0px;\">　第二阶段：通过报名资格初审的考生网上填报个人信息并缴费</strong></p><p style=\"text-align:justify;padding: 6px 0px; margin: 0px auto; border: 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\">　　时间：2015年11月17日8时至20日20时</p><p style=\"text-align:justify;padding: 6px 0px; margin: 0px auto; border: 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\">　　网址： www.bjeea.edu.cn或www.bjeea.cn</p><p style=\"text-align:justify;padding: 6px 0px; margin: 0px auto; border: 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\">　　缴费标准及网上缴费系统支持的银行见附件1。</p><p style=\"text-align:justify;padding: 6px 0px; margin: 0px auto; border: 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\"><strong style=\"padding: 0px; margin: 0px;\">　　第三阶段：报名资格现场确认</strong></p><p style=\"text-align:justify;padding: 6px 0px; margin: 0px auto; border: 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\">　　时间：由各区县高校招生办公室在11月30日前自行安排。</p><p style=\"text-align:justify;padding: 6px 0px; margin: 0px auto; border: 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\">　　地点：应届毕业生到学校所在区(县)高招办指定的地点，具体地点由学校通知;社会青年原则上在户口所在街道(乡、镇);在职职工在本单位所在地的区(县)高招办。</p><p style=\"text-align:justify;padding: 6px 0px; margin: 0px auto; border: 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\">　　确认要求：完成网上个人信息填报并缴费的考生本人持户口簿、身份证原件(在职职工还须持单位介绍信)在规定时间和地点办理报名资格确认手续。报名资格确认期间将采集考生电子照片。</p><p style=\"text-align:justify;padding: 6px 0px; margin: 0px auto; border: 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\">　　考生必须完成上述三个阶段且通过报名资格现场确认后，方能参加北京市2016年普通高等学校招生考试。</p><p style=\"text-align:justify;padding: 6px 0px; margin: 0px auto; border: 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\">　　考生报名信息是考生电子档案的重要组成部分，考生被高校录取后其学籍数据有关信息来源于考生高考报名信息，请考生确保本人高考报名信息准确无误。高考报名信息在报名资格确认后不再改动。</p><p><br/></p>', '2015-11-02 20:19:07', '北京2016年高考报名流程', null);
INSERT INTO `t_news` VALUES ('5', '', '<p style=\"text-align:justify;padding: 6px 0px; margin: 0px auto; border: 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\">《国务院关于深化考试招生制度改革的实施意见》已发布一周年，记者从教育部获悉，包括北京市在内，全国各省均已形成相关实施方案，本市考试招生制度改革实施方案已在区县传达。</p><p style=\"text-align:justify;padding: 6px 0px; margin: 0px auto; border: 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\">　　2014年9月，被誉为1977年恢复高考以来最全面最系统的考试制度改革——《国务院关于深化考试招生制度改革的实施意见》发布，未来高考统考将只考语文、数学、外语三科，不再区分文理科。</p><p style=\"text-align:justify;padding: 6px 0px; margin: 0px auto; border: 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\">　　教育部日前举行深化考试招生制度改革工作推进会，相关负责人透露，2015年高考录取率最低省份与全国平均水平差距进一步缩小。全国性高考加分项目已按要求全部调减到位，地方性加分项目2014年高考有95个，2018年高考时将只剩35个，减幅63%。高校自主招生进行了新的制度设计，保证了选拔学科特长和创新潜质的学生，实现了招生公平公正。2015年高招专项计划录取的贫困地区农村学生较2014年增长10.5%。全国通过高职分类考试录取的学生占到高职院校招生总数的50%。</p><p style=\"text-align:justify;padding: 6px 0px; margin: 0px auto; border: 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\">　　教育部有关负责人表示，目前，上海、浙江已发布考试招生制度改革实施方案，其余29个省、区、市也均已形成相关实施方案。记者从区县教委获悉，本市考试招生制度改革实施方案已经完成，并已开始向学校传达。</p><p style=\"text-align:justify;padding: 6px 0px; margin: 0px auto; border: 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\">　　教育部要求各地各校要按照中央的决策部署，要按时出台改革实施方案，并做好政策的权威发布和解读。(记者 任敏)</p><p><br/></p>', '2015-11-02 20:19:38', '北京市完成考试招生改革实施方案', null);
INSERT INTO `t_news` VALUES ('6', '', '<p style=\"text-align:justify;padding: 6px 0px; margin: 0px auto; border: 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\"><strong style=\"padding: 0px; margin: 0px;\">中国教育在线讯</strong>&nbsp;2016年高考报名陆续开始，<a target=\"_blank\" href=\"http://gaokao.eol.cn/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\">中国教育在线高考频道</a>整理出全国各省市2016高考报名时间及报名网址汇总，供广大考生参考！特别提醒，逾期将不再办理高考报名手续。（更多报名信息不断添加中，敬请关注……）</p><p style=\"text-align:justify;padding: 6px 0px; margin: 0px auto; border: 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\"><br/></p><table cellspacing=\"0\" bordercolorlight=\"#030303\" bordercolordark=\"#030303\" cellpadding=\"3\" align=\"center\"><tbody style=\"padding: 0px; margin: 0px;\"><tr style=\"padding: 0px; margin: 0px;\" class=\"firstRow\"><td colspan=\"4\" style=\"padding: 0px; margin: 0px;\"><p style=\"text-align:center;padding-top: 6px; padding-bottom: 6px; margin-right: auto; margin-left: auto; border: 0px;\"><strong style=\"padding: 0px; margin: 0px;\">全国各省市2016高考报名时间及报名网址汇总</strong>&nbsp;</p></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><strong style=\"padding: 0px; margin: 0px;\"><span style=\"color:#000000;padding: 0px; margin: 0px;\">地区</span></strong></td><td style=\"padding: 0px; margin: 0px;\"><strong style=\"padding: 0px; margin: 0px;\">2016年高考报名时间</strong></td><td style=\"padding: 0px; margin: 0px;\"><strong style=\"padding: 0px; margin: 0px;\">2016年高考报名</strong><strong style=\"padding: 0px; margin: 0px;\">网址</strong></td><td style=\"padding: 0px; margin: 0px;\"><strong style=\"padding: 0px; margin: 0px;\">查看详情</strong></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/shang_hai/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">上海</strong></a></td><td style=\"padding: 0px; margin: 0px;\">即将公布</td><td style=\"padding: 0px; margin: 0px;\">http://www.shmeea.com.cn/node2/index.html</td><td style=\"padding: 0px; margin: 0px;\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/zhe_jiang/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">浙江</strong></a></td><td style=\"padding: 0px; margin: 0px;\">即将公布</td><td style=\"padding: 0px; margin: 0px;\"><br/></td><td style=\"padding: 0px; margin: 0px;\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/bei_jing/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">北京</strong></a></td><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/bei_jing/dongtai/201510/t20151008_1323422.shtml\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><span style=\"color:#ff0000;padding: 0px; margin: 0px;\">11月9日8时至12日20时</span></a></td><td style=\"padding: 0px; margin: 0px;\">www.bjeea.edu.cn或www.bjeea.cn</td><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/bei_jing/dongtai/201510/t20151008_1323422.shtml\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><span style=\"color:#ff0000;padding: 0px; margin: 0px;\">&gt;&gt;查看</span></a></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/shan_dong/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">山东</strong></a></td><td style=\"padding: 0px; margin: 0px;\">即将公布</td><td style=\"padding: 0px; margin: 0px;\">http://www.sdzs.gov.cn/</td><td style=\"padding: 0px; margin: 0px;\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/shan_xi/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">山西</strong></a></td><td style=\"padding: 0px; margin: 0px;\">即将公布</td><td style=\"padding: 0px; margin: 0px;\">http://www.sxkszx.cn/index.html</td><td style=\"padding: 0px; margin: 0px;\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/he_bei/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">河北</strong></a></td><td style=\"padding: 0px; margin: 0px;\">即将公布</td><td style=\"padding: 0px; margin: 0px;\">http://www.hebeea.edu.cn</td><td style=\"padding: 0px; margin: 0px;\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/he_nan/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">河南</strong></a></td><td style=\"padding: 0px; margin: 0px;\">即将公布</td><td style=\"padding: 0px; margin: 0px;\">http//:www.heao.gov.cn</td><td style=\"padding: 0px; margin: 0px;\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/hei_long_jiang/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">黑龙江</strong></a></td><td style=\"padding: 0px; margin: 0px;\"><span style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/hei_long_jiang/dongtai/201510/t20151027_1331337.shtml\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><span style=\"color:#ff0000;padding: 0px; margin: 0px;\">10月28日开始至11月15日</span></a></span></td><td style=\"padding: 0px; margin: 0px;\">http://www.lzk.hl.cn/lzk/index.htm</td><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/hei_long_jiang/dongtai/201510/t20151027_1331337.shtml\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><span style=\"color:#ff0000;padding: 0px; margin: 0px;\">&gt;&gt;查看</span></a></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/liao_ning/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">辽宁</strong></a></td><td style=\"padding: 0px; margin: 0px;\"><span style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/liao_ning/dongtai/201510/t20151010_1324522.shtml\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><span style=\"color:#ff0000;padding: 0px; margin: 0px;\">11月6日</span></a></span></td><td style=\"padding: 0px; margin: 0px;\"><br/></td><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/liao_ning/dongtai/201510/t20151010_1324522.shtml\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><span style=\"color:#ff0000;padding: 0px; margin: 0px;\">&gt;&gt;查看</span></a></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/ji_lin/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">吉林</strong></a></td><td style=\"padding: 0px; margin: 0px;\">即将公布</td><td style=\"padding: 0px; margin: 0px;\">http://zsb.jledu.gov.cn</td><td style=\"padding: 0px; margin: 0px;\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/guang_dong/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">广东</strong></a></td><td style=\"padding: 0px; margin: 0px;\">即将公布</td><td style=\"padding: 0px; margin: 0px;\">http://www.eeagd.edu.cn</td><td style=\"padding: 0px; margin: 0px;\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/guang_xi/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">广西</strong></a></td><td style=\"padding: 0px; margin: 0px;\"><span style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/guang_xi/dongtai/201510/t20151022_1329240.shtml\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><span style=\"color:#ff0000;padding: 0px; margin: 0px;\">10月下旬启动</span></a></span></td><td style=\"padding: 0px; margin: 0px;\">http://www.gxeea.cn/</td><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/guang_xi/dongtai/201510/t20151022_1329240.shtml\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><span style=\"color:#ff0000;padding: 0px; margin: 0px;\">&gt;&gt;查看</span></a></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/jiang_su/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">江苏</strong></a></td><td style=\"padding: 0px; margin: 0px;\"><span style=\"padding: 0px; margin: 0px;\"><a href=\"http://gaokao.eol.cn/jiang_su/dongtai/201510/t20151020_1328147.shtml\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><span style=\"color:#ff0000;padding: 0px; margin: 0px;\">11月1日-4日</span></a></span></td><td style=\"padding: 0px; margin: 0px;\">http://pgbm.jseea.cn</td><td style=\"padding: 0px; margin: 0px;\"><a href=\"http://gaokao.eol.cn/jiang_su/dongtai/201510/t20151020_1328147.shtml\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><span style=\"color:#ff0000;padding: 0px; margin: 0px;\">&gt;&gt;查看</span></a>&nbsp;</td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/gan_su/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">甘肃</strong></a></td><td style=\"padding: 0px; margin: 0px;\">即将公布</td><td style=\"padding: 0px; margin: 0px;\">考生到户籍所在地的县(区)招生办或县(区)招生办指定地点报名</td><td style=\"padding: 0px; margin: 0px;\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/ning_xia/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">宁夏</strong></a></td><td style=\"padding: 0px; margin: 0px;\">即将公布</td><td style=\"padding: 0px; margin: 0px;\">http://www.nxjyks.cn</td><td style=\"padding: 0px; margin: 0px;\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/tian_jin/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">天津</strong></a></td><td style=\"padding: 0px; margin: 0px;\">即将公布</td><td style=\"padding: 0px; margin: 0px;\">http://www.zhaokao.net/</td><td style=\"padding: 0px; margin: 0px;\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/chong_qing/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">重庆</strong></a></td><td style=\"padding: 0px; margin: 0px;\">即将公布</td><td style=\"padding: 0px; margin: 0px;\"><br/></td><td style=\"padding: 0px; margin: 0px;\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/si_chuan/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">四川</strong></a></td><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/si_chuan/dongtai/201510/t20151009_1323877.shtml\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><span style=\"color:#ff0000;padding: 0px; margin: 0px;\">艺体类考生10月9日起报名</span></a></td><td style=\"padding: 0px; margin: 0px;\"><br/></td><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/si_chuan/dongtai/201510/t20151009_1323877.shtml\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><span style=\"color:#ff0000;padding: 0px; margin: 0px;\">&gt;&gt;查看</span></a></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/jiang_xi/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">江西</strong></a></td><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/jiang_xi/dongtai/201510/t20151008_1323850.shtml\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><span style=\"color:#ff0000;padding: 0px; margin: 0px;\">2015年11月11-20日</span></a></td><td style=\"padding: 0px; margin: 0px;\">http://www.jxedu.gov.cn 或 http://www.jxeea.cn</td><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/jiang_xi/dongtai/201510/t20151008_1323850.shtml\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><span style=\"color:#ff0000;padding: 0px; margin: 0px;\">&gt;&gt;查看</span></a></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/hai_nan/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">海南</strong></a></td><td style=\"padding: 0px; margin: 0px;\">即将公布</td><td style=\"padding: 0px; margin: 0px;\"><br/></td><td style=\"padding: 0px; margin: 0px;\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/xin_jiang/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">新疆</strong></a></td><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/xin_jiang/dongtai/201510/t20151009_1323869.shtml\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><span style=\"color:#ff0000;padding: 0px; margin: 0px;\">12月10日截止</span></a></td><td style=\"padding: 0px; margin: 0px;\">http://www.xjzk.gov.cn</td><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/xin_jiang/dongtai/201510/t20151009_1323869.shtml\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><span style=\"color:#ff0000;padding: 0px; margin: 0px;\">&gt;&gt;查看</span></a></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/nei_meng/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">内蒙古</strong></a></td><td style=\"padding: 0px; margin: 0px;\">即将公布</td><td style=\"padding: 0px; margin: 0px;\">http://www.nm.zsks.cn</td><td style=\"padding: 0px; margin: 0px;\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/an_hui/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">安徽</strong></a></td><td style=\"padding: 0px; margin: 0px;\"><span style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/an_hui/dongtai/201511/t20151102_1333721.shtml\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><span style=\"color:#ff0000;padding: 0px; margin: 0px;\">11月15日至17日</span></a></span></td><td style=\"padding: 0px; margin: 0px;\">http://www.ahzsks.cn/</td><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/an_hui/dongtai/201511/t20151102_1333721.shtml\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><span style=\"color:#ff0000;padding: 0px; margin: 0px;\">&gt;&gt;查看</span></a></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a href=\"http://gaokao.eol.cn/hu_bei/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">湖北</strong></a></td><td style=\"padding: 0px; margin: 0px;\">即将公布</td><td style=\"padding: 0px; margin: 0px;\">www.hbea.edu.cn或www.hbee.edu.cn</td><td style=\"padding: 0px; margin: 0px;\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/hu_nan/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">湖南</strong></a></td><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/hu_nan/dongtai/201510/t20151010_1324521.shtml\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><span style=\"color:#ff0000;padding: 0px; margin: 0px;\">11月1日-10日</span></a></td><td style=\"padding: 0px; margin: 0px;\">http://www.hneao.edu.cn/</td><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/hu_nan/dongtai/201510/t20151010_1324521.shtml\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><span style=\"color:#ff0000;padding: 0px; margin: 0px;\">&gt;&gt;查看</span></a></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/gui_zhou/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">贵州</strong></a></td><td style=\"padding: 0px; margin: 0px;\">即将公布</td><td style=\"padding: 0px; margin: 0px;\"><br/></td><td style=\"padding: 0px; margin: 0px;\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/shan_xi_sheng/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">陕西</strong></a></td><td style=\"padding: 0px; margin: 0px;\">即将公布</td><td style=\"padding: 0px; margin: 0px;\">http://www.sneac.com/</td><td style=\"padding: 0px; margin: 0px;\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/yun_nan/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">云南</strong></a></td><td style=\"padding: 0px; margin: 0px;\">即将公布</td><td style=\"padding: 0px; margin: 0px;\">www.ynzk.cn</td><td style=\"padding: 0px; margin: 0px;\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/qing_hai/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">青海</strong></a></td><td style=\"padding: 0px; margin: 0px;\">即将公布</td><td style=\"padding: 0px; margin: 0px;\"><br/></td><td style=\"padding: 0px; margin: 0px;\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/fu_jian/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">福建</strong></a></td><td style=\"padding: 0px; margin: 0px;\">即将公布</td><td style=\"padding: 0px; margin: 0px;\">www.eeafj.cn</td><td style=\"padding: 0px; margin: 0px;\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td style=\"padding: 0px; margin: 0px;\"><a target=\"_blank\" href=\"http://gaokao.eol.cn/xi_zang/\" style=\"padding: 0px; margin: 0px; color: rgb(2, 94, 185);\"><strong style=\"padding: 0px; margin: 0px;\">西藏</strong></a></td><td style=\"padding: 0px; margin: 0px;\">即将公布</td><td style=\"padding: 0px; margin: 0px;\"><br/></td><td style=\"padding: 0px; margin: 0px;\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px;\"><td colspan=\"4\" style=\"padding: 0px; margin: 0px;\"><p style=\"text-align:center;padding-top: 6px; padding-bottom: 6px; margin-right: auto; margin-left: auto; border: 0px;\">　持续更新，敬请关注！</p></td></tr></tbody></table><p><span style=\"color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px;\">&nbsp;</span></p><p><br/></p>', '2015-11-02 20:20:15', '全国各省市2016高考报名时间及报名网址汇总', null);
INSERT INTO `t_news` VALUES ('7', '', '<p style=\"text-align:justify;margin: 0px auto; border: 0px; padding: 6px 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\">北京市2016年普通高等学校招生相关测试安排</p><p style=\"text-align:justify;margin: 0px auto; border: 0px; padding: 6px 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\">&nbsp;</p><p style=\"text-align:justify;margin: 0px auto; border: 0px; padding: 6px 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\">&nbsp;</p><p style=\"text-align:center;margin: 0px auto; border: 0px; padding: 6px 0px; color: rgb(51, 51, 51); font-family: Arial, Geneva, Helvetica, sans-serif, 宋体; font-size: 14px; line-height: 24px; white-space: normal;\"><img width=\"615\" height=\"385\" title=\"北京2016年普通高等学校招生相关测试安排\" alt=\"北京2016年普通高等学校招生相关测试安排\" src=\"http://gaozhong.eol.cn/beijing/bj/201510/W020151009325676888889.jpg\" oldsrc=\"W020151009325676888889.jpg\" style=\"margin: 0px auto; border: 0px;\"/></p><p><br/></p>', '2015-11-02 20:21:25', '北京2016年普通高等学校招生相关测试安排', null);

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` bigint(20) NOT NULL auto_increment,
  `total_price` double default NULL,
  `addr` varchar(255) default NULL,
  `count` int(11) default NULL,
  `create_date` date default NULL,
  `pay_type` varchar(255) default NULL,
  `state` varchar(255) default NULL,
  `item` bigint(20) default NULL,
  `user` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_85yet1dbbrsprqfsttdcm701` (`item`),
  KEY `FK_1isv5n8ndeuw5y3mwianl1j94` (`user`),
  CONSTRAINT `FK_1isv5n8ndeuw5y3mwianl1j94` FOREIGN KEY (`user`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_85yet1dbbrsprqfsttdcm701` FOREIGN KEY (`item`) REFERENCES `t_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_plan
-- ----------------------------
DROP TABLE IF EXISTS `t_plan`;
CREATE TABLE `t_plan` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `num` varchar(255) default NULL,
  `remark` text,
  `score` varchar(255) default NULL,
  `year` varchar(255) default NULL,
  `user` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_c42488egx2oe9t07na3qd8gjr` (`user`),
  CONSTRAINT `FK_c42488egx2oe9t07na3qd8gjr` FOREIGN KEY (`user`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_plan
-- ----------------------------
INSERT INTO `t_plan` VALUES ('1', '56', '56756', '56', '5657', '2015', null);
INSERT INTO `t_plan` VALUES ('2', '56', '5656', '56767', '56', '2015', '1');
INSERT INTO `t_plan` VALUES ('3', '56', '5656', '56767', '56', '2015', '1');
INSERT INTO `t_plan` VALUES ('4', '56', '5656', '56767', '56', '2015', '1');
INSERT INTO `t_plan` VALUES ('5', '56', '5656', '56767', '56', '2015', '1');
INSERT INTO `t_plan` VALUES ('6', '56', '5656', '56767', '56', '2015', '1');
INSERT INTO `t_plan` VALUES ('7', '56', '5656', '56767', '56', '2015', '1');

-- ----------------------------
-- Table structure for t_school
-- ----------------------------
DROP TABLE IF EXISTS `t_school`;
CREATE TABLE `t_school` (
  `id` bigint(20) NOT NULL auto_increment,
  `addr` varchar(255) default NULL,
  `context` text,
  `email` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `site` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `dxsl` text,
  `zsjh` text,
  `zszc` text,
  `sfbz` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_school
-- ----------------------------
INSERT INTO `t_school` VALUES ('2', '北京', '<p>ceshi&nbsp;</p>', 'zhaoyang@sina.com', '北京大学', 'www.baidu.com', '123', '教育部直属', null, null, null, null);
INSERT INTO `t_school` VALUES ('3', '北京市海淀区颐和园路5号', '<p><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height: 24px; text-indent: 32px; background-color: rgb(255, 255, 255);\">北京大学创于1898年，初名京师大学堂，是第一所国立综合性大学，也是当时中国的最高教育行政机关。辛亥革命后，于1912年改为现名。</span><br style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height: 24px; text-indent: 32px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height: 24px; text-indent: 32px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height: 24px; text-indent: 32px; background-color: rgb(255, 255, 255);\">作为新文化运动的中心和“五四”运动的策源地，作为中国最早传播马克思主义和民主科学思想的发祥地，作为中国共产党最早的活动基地，北京大学为民族的振兴和解放、国家的建设和发展、社会的文明和进步做出了不可代替的贡献，在中国走向现代化的进程中起到了重要的先锋作用。爱国、进步、民主、科学的传统精神和勤奋、严谨、求实、创新的学风在这里生生不息、代代相传。</span><br style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height: 24px; text-indent: 32px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height: 24px; text-indent: 32px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height: 24px; text-indent: 32px; background-color: rgb(255, 255, 255);\">1917年，著名教育和民主主义革命家蔡元培出任北京大学校长，他“循思想自由原则、取兼容并包之义“，对北京大学进行了思想解放和学术繁荣，北京大学从此日新月异。陈独秀、李大钊、毛泽东以及鲁迅、胡适等一批杰出人才都曾在北京大学任职或任教。</span><br style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height: 24px; text-indent: 32px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height: 24px; text-indent: 32px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height: 24px; text-indent: 32px; background-color: rgb(255, 255, 255);\">1937年卢沟桥事变后，北京大学与清华大学、南开大学南迁长沙，共同组成长沙临时大学&nbsp;。1938年初，临时大学迁往昆明，改称国立西南联合大学。西南联大汇聚三校菁华，以刚毅坚卓精神，维系中华教育命脉。抗战胜利后，北京大学返回故园，于1946年10月正式复学。</span><br style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height: 24px; text-indent: 32px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height: 24px; text-indent: 32px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height: 24px; text-indent: 32px; background-color: rgb(255, 255, 255);\">中华人民共和国成立后，全国高校于1952年进行院系调整，北京大学成为一所以文理基础教学和研究为主的综合性大学，为国家培养了大批人才。据不完全统计，北京大学的校友和教师有近400位两院院士，中国人文社科界有影响的人士相当多也出自北京大学，并且产生了一批重大研究成果。</span><br style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height: 24px; text-indent: 32px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height: 24px; text-indent: 32px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height: 24px; text-indent: 32px; background-color: rgb(255, 255, 255);\">改革开放以来，北京大学进入了一个前所未有的大发展、大建设的新时期，并成为国家“211工程”重点建设的两所大学之一。</span><br style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height: 24px; text-indent: 32px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height: 24px; text-indent: 32px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height: 24px; text-indent: 32px; background-color: rgb(255, 255, 255);\">1998年5月4日，北京大学百年校庆之际，国家主席江泽民题词：“发扬北京大学爱国进步民主科学的优良传统为振兴中华做出更大贡献”，并在庆祝北京大学建校一百周年大会上发表讲话，发出了“为了实现现代化，我国要有若干所具有世界先进水平的一流大学”的号召。在国家的支持下，北京大学适时启动“创建世界一流大学计划”，从此，北京大学的历史又翻开了新的一页。</span><br style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height: 24px; text-indent: 32px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height: 24px; text-indent: 32px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height: 24px; text-indent: 32px; background-color: rgb(255, 255, 255);\">2000年4月3日，北京大学与原北京医科大学合并，组建了新的北京大学。原北京医科大学的前身是国立北京医学专科学校，创建于1912年10月26日。20世纪三、四十年代，学校一度名为北平大学医学院，并于1946年7月并入北京大学。1952年在全国高校院系调整中，北京大学医学院脱离北京大学，独立为北京医学院。1985年成为国家首批“211工程”重点支持的医科大学。</span><br style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height: 24px; text-indent: 32px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height: 24px; text-indent: 32px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height: 24px; text-indent: 32px; background-color: rgb(255, 255, 255);\">北京大学位于京城西郊，占地2661581平方米（3992.277亩）。学校现教职工16073人，29617名各类在校学生。现有199个博士点、221个硕士点、100个本科专业，以及覆盖139个专业的35个博士后流动站。北京大学拥有的教授、博士生导师、中科院院士及国家重点学科和国家重点实验室的数量均居全国高校之首。现任校党委书记闵维方教授、校长许智宏院士。</span></p>', 'bdzsb@pku.edu.cn', '北京大学', 'http://www.pku.edu.cn', ' 010-62751407', '985高校', null, '<ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p><a title=\"北京大学2015年专业招生计划（网页版）\" href=\"http://gkcx.eol.cn/schoolhtm/schoolInfo/31/10128/436413.htm\" target=\"_blank\" style=\"outline: none; color: rgb(51, 51, 51); text-decoration: none; font-size: 16px; float: left;\"><br/></a></p></li></ul>', '', null);
INSERT INTO `t_school` VALUES ('4', '北京市海淀区颐和园路5号', '<p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">清华大学(Tsinghua University)是中国著名高等学府，坐落于北京西北郊风景秀丽的清华园。是中国高层次人才培养和科学技术研究的重要基地之一。</p><p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">清华大学的前身是清华学堂，成立于1911年，当初是清政府建立的留美预备学校。1912 年更名为清华学校，为尝试人才的本地培养，1925 年设立大学部，同年开办研究院(国学门)，1928年更名为“国立清华大学”，并于1929年秋开办研究院，各系设研究所。1937年抗日战争爆发后，南迁长沙，与北京大学、南开大学联合办学，组建国立长沙临时大学，1938年迁至昆明，改名为国立西南联合大学。1946年，清华大学迁回清华园原址复校，设有文、法、理、工、农等5 个学院，26 个系。</p><p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1952年，全国高校院系调整后，清华大学成为一所多科性工业大学，重点为国家培养工程技术人才，被誉为“工程师的摇篮”。1978年以来，清华大学进入了一个蓬勃发展的新时期，逐步恢复了理科、经济、管理和文科类学科，并成立了研究生院和继续教育学院。1999 年，原中央工艺美术学院并入，成立清华大学美术学院。在国家和教育部的大力支持下，经过“211工程”建设和“985计划”的实施，清华大学在学科建设、人才培养、师资队伍、科学研究以及整体办学条件等方面均跃上了一个新的台阶。目前，清华大学设有13 个学院，54个系，已成为一所具有理学、工学、文学、艺术学、历史学、哲学、经济学、管理学、法学、教育学和医学等学科的综合性、研究型大学。</p><p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">清芬挺秀，华夏增辉。今天的清华大学面临前所未有的历史机遇，清华人继承“爱国、奉献”的优良传统，秉承“自强不息、厚德载物”的校训、“行胜于言”的校风以及“严谨、勤奋、求实、创新”的学风，为使清华大学跻身世界一流大学行列，为中华民族的伟大复兴而努力奋斗。</p><p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1911年 建立“清华学堂”后更名为“清华学校”(留美预备学校)</p><p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1925年 设立大学部，同年开办研究院(国学门)</p><p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1928年 更名为国立清华大学，有文、法、理、工4个学院，16个系</p><p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1937年 南迁长沙与北京大学、南开大学联合组成国立长沙临时大学</p><p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1938年 长沙临时大学迁到昆明，更名国立西南联合大学</p><p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1946年 迁回北京清华园复校，有文、法、理、工、农5个学院，26个系</p><p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1952年 经全国高校院系调整，成为多科性工业大学</p><p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1978年 恢复全国高等教育招生考试</p><p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1984年 设立国内高校中第一个研究生院</p><p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">在管理工程系基础上建立经济管理学院</p><p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">在已有理学科系基础上恢复理学院</p><p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1985年 建立国内第一个继续教育学院</p><p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1988年 在建筑系基础上建立建筑学院</p><p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1993年 在已有人文社会科学学科系、所基础上建立人文社会科学学院</p><p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1994年 在已有信息学科系、所基础上建立信息科学技术学院</p><p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1996年 在已有机械类学科系、所基础上建立机械工程学院</p><p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1999年 恢复建立法学</p><p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">原中央工艺美术学院并入，成为清华大学美术学院</p><p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2000年 在已有土木水利类学科系、所基础上建立土木水利学院</p><p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">在公共管理系的基础上建立公共管理学院</p><p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2001年 建立医学院</p><p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2002年 在传播系基础上建立新闻与传播学院</p><p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2003年 原隶属信息产业部的华信医院(原酒仙桥医院)和玉泉医院正式并入</p><p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2004年4月正式挂牌，分别成为清华大学第一附属医院和第二附属医院</p><p style=\"margin: 24px auto 0px; border: 0px; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2004年 在工程力学系、宇航技术研究中心等基础上建立航天航空学院</p><p><br/></p>', 'bdzsb@pku.edu.cn', '清华大学', 'http://www.pku.edu.cn', ' 010-62751407', '综合类', null, '', '', '');
INSERT INTO `t_school` VALUES ('5', '北京市海淀区颐和园路5号', '<p><a target=\"_blank\" href=\"http://gkcx.eol.cn/schoolhtm/schoolTemple/school46.htm\" style=\"padding: 0px; outline: none; color: rgb(51, 51, 51); text-decoration: none; font-family: &#39;Microsoft YaHei&#39;, 微软雅黑, 宋体, Tahoma, Helvetica, Arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">中国人民大学</a></p>', 'bdzsb@pku.edu.cn', '中国人民大学', 'http://www.pku.edu.cn', ' 010-62751407', '综合类', null, '', '', '');
INSERT INTO `t_school` VALUES ('6', '', '', '', '中央财经大学', '', '', '综合类', null, '', '', '');
INSERT INTO `t_school` VALUES ('7', '', '', '', '北京航空航天大学', '', '', '综合类', null, '', '', '');
INSERT INTO `t_school` VALUES ('8', '', '', '', '中国传媒大学', '', '', '综合类', null, '', '', '');
INSERT INTO `t_school` VALUES ('9', '', '', '', '北京科技大学', '', '', '综合类', null, '', '', '');
INSERT INTO `t_school` VALUES ('10', '', '', '', '北京工业大学', '', '', '综合类', null, '', '', '');
INSERT INTO `t_school` VALUES ('11', '', '', '', '中国农业大学', '', '', '综合类', null, '', '', '');
INSERT INTO `t_school` VALUES ('12', '', '', '', '北京外国语大学', '', '', '综合类', null, '', '', '');
INSERT INTO `t_school` VALUES ('13', '', '', '', '北京联合大学', '', '', '综合类', null, '', '', '');
INSERT INTO `t_school` VALUES ('14', '', '', '', '北京林业大学', '', '', '综合类', null, '', '', '');
INSERT INTO `t_school` VALUES ('15', '', '', '', '中国人民公安大学', '', '', '综合类', null, '', '', '');
INSERT INTO `t_school` VALUES ('16', '', '', '', '北京工商大学', '', '', '综合类', null, '', '', '');
INSERT INTO `t_school` VALUES ('17', '', '', '', '北京城市学院', '', '', '综合类', null, '', '', '');
INSERT INTO `t_school` VALUES ('18', '', '', '', '北京信息科技大学', '', '', '综合类', null, '', '', '');
INSERT INTO `t_school` VALUES ('19', '', '', '', ' 北方工业大学', '', '', '综合类', null, '', '', '');
INSERT INTO `t_school` VALUES ('20', '', '', '', '中国青年政治学院', '', '', '综合类', null, '', '', '');
INSERT INTO `t_school` VALUES ('21', '', '', '', '北京卫生职业学院', '', '', '综合类', null, '', '', '');
INSERT INTO `t_school` VALUES ('22', '', '', '', '首都师范大学继续教育学院', '', '', '综合类', null, '', '', '');
INSERT INTO `t_school` VALUES ('23', '', '', '', '中国音乐学院', '', '', '综合类', null, '', '', '');
INSERT INTO `t_school` VALUES ('24', '', '', '', '北京舞蹈学院', '', '', '综合类', null, '', '', '');
INSERT INTO `t_school` VALUES ('25', '', '', '', ' 北京交通运输职业学院', '', '', '综合类', null, '', '', '');
INSERT INTO `t_school` VALUES ('26', '', '', '', '北京培黎职业学院', '', '', '综合类', null, '', '', '');
INSERT INTO `t_school` VALUES ('27', '', '', '', '北京经济管理职业学院', '', '', '综合类', null, '', '', '');

-- ----------------------------
-- Table structure for t_score_line
-- ----------------------------
DROP TABLE IF EXISTS `t_score_line`;
CREATE TABLE `t_score_line` (
  `id` bigint(20) NOT NULL auto_increment,
  `score1` double default NULL,
  `score2` double default NULL,
  `score3` double default NULL,
  `score4` double default NULL,
  `year` varchar(255) default NULL,
  `area` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_bmc95b663myvfrrw6ple0lp98` (`area`),
  CONSTRAINT `FK_bmc95b663myvfrrw6ple0lp98` FOREIGN KEY (`area`) REFERENCES `t_area` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_score_line
-- ----------------------------
INSERT INTO `t_score_line` VALUES ('4', '34', '34', '34534', null, '2015', '15');
INSERT INTO `t_score_line` VALUES ('5', '45', '45', '45', '45', '2014', '11');

-- ----------------------------
-- Table structure for t_seller
-- ----------------------------
DROP TABLE IF EXISTS `t_seller`;
CREATE TABLE `t_seller` (
  `id` bigint(20) NOT NULL auto_increment,
  `addr` varchar(255) default NULL,
  `detail` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `user_name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_seller
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL auto_increment,
  `address` varchar(255) default NULL,
  `area` varchar(255) default NULL,
  `birthday` datetime default NULL,
  `city` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `nickname` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `sex` varchar(255) default NULL,
  `cardid` varchar(255) default NULL,
  `school` varchar(255) default NULL,
  `score` double default NULL,
  `type` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '', '北京', null, '', 'asd', '2', '1ads', '1', '男', '', '', null, '理科');
INSERT INTO `t_user` VALUES ('2', '', '北京', null, '11', '222', '2', '11', '', '男', '2212', '123', '212', '理科');
