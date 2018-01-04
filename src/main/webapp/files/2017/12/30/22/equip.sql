/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50637
Source Host           : localhost:3306
Source Database       : equip

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2017-12-02 01:37:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tequipment`
-- ----------------------------
DROP TABLE IF EXISTS `tequipment`;
CREATE TABLE `tequipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `price` float DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tequipment
-- ----------------------------
INSERT INTO `tequipment` VALUES ('1', '联想服务器', '申请人名称：联想系统集成(深圳)有限公司制造商名称：联想(北京)有限公司', '2015012491', '2017-11-11 19:20:36', '20000', 'A2-432', '3');
INSERT INTO `tequipment` VALUES ('2', 'MacBookPro', '申请人名称：联想系统集成(深圳)有限公司制造商名称：联想(北京)有限公司', '2015012492', '2017-11-08 17:37:24', '19000', 'A2-512', '2');
INSERT INTO `tequipment` VALUES ('3', 'Asus', '申请人名称：联想系统集成(深圳)有限公司制造商名称：联想(北京)有限公司', '2015012493', '2017-11-13 18:44:20', '6464', 'A2-332', '2');
INSERT INTO `tequipment` VALUES ('4', '华硕', '申请人名称：联想系统集成(深圳)有限公司制造商名称：联想(北京)有限公司', '20171015', '2017-08-16 08:00:00', '541641', 'A2-213', '4');
INSERT INTO `tequipment` VALUES ('5', '华为', '申请人名称：联想系统集成(深圳)有限公司制造商名称：联想(北京)有限公司', '20171215', '2009-06-24 08:00:00', '541641', 'A2-131', '3');
INSERT INTO `tequipment` VALUES ('6', 'ThinkPad', '申请人名称：联想系统集成(深圳)有限公司制造商名称：联想(北京)有限公司', '20160123', '2017-11-13 21:58:37', '12345', 'A2-123', '1');
INSERT INTO `tequipment` VALUES ('7', '投影', '申请人名称：联想系统集成(深圳)有限公司制造商名称：联想(北京)有限公司', '1325465468', '2017-11-14 14:42:52', '1234', 'A4-211', '4');
INSERT INTO `tequipment` VALUES ('8', '投影', '申请人名称：联想系统集成(深圳)有限公司制造商名称：联想(北京)有限公司', '125874', '2017-11-14 14:52:46', '1256', 'A4-211', '2');
INSERT INTO `tequipment` VALUES ('9', '投影', '申请人名称：联想系统集成(深圳)有限公司制造商名称：联想(北京)有限公司', '123456789', '2017-11-14 14:58:08', '74589', 'A2-123', '1');
INSERT INTO `tequipment` VALUES ('10', 'ThinkPad', '申请人名称：联想系统集成(深圳)有限公司制造商名称：联想(北京)有限公司', '789456', '2017-12-01 14:38:37', '10254', 'A4-321', '2');
INSERT INTO `tequipment` VALUES ('30', '联想服务', '活动顺利返回的路上', '20150', '2017-12-02 01:17:34', '222', 'A2-432', '3');

-- ----------------------------
-- Table structure for `tuser`
-- ----------------------------
DROP TABLE IF EXISTS `tuser`;
CREATE TABLE `tuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tuser
-- ----------------------------
INSERT INTO `tuser` VALUES ('1', 'admin', '王老师', '123123', '12345678956', 'aas@163.com', '0', '2017-12-02 01:14:20');
INSERT INTO `tuser` VALUES ('2', 'qwe', '李老师', '123789', '12447832', 'aas@163.com', '1', '2017-12-02 01:30:51');
INSERT INTO `tuser` VALUES ('3', 'zxc', '张老师', '123456', '4578962', 'aas@163.com', '1', '2017-11-25 19:53:50');
INSERT INTO `tuser` VALUES ('4', 'lily', '陈老师', '15456', '125479522', '445678958@qq.com', '1', '2017-11-14 13:41:11');
INSERT INTO `tuser` VALUES ('5', '111', '111', null, '1234555', '445679589@qq.com', '1', null);
