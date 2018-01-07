/*
Navicat MySQL Data Transfer

Source Server         : Database
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : fileshare

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-01-07 21:06:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for departfile
-- ----------------------------
DROP TABLE IF EXISTS `departfile`;
CREATE TABLE `departfile` (
  `departId` int(11) DEFAULT NULL,
  `fileId` int(11) DEFAULT NULL,
  KEY `departfile_ibfk_1` (`departId`),
  KEY `departfile_ibfk_2` (`fileId`),
  CONSTRAINT `departfile_ibfk_1` FOREIGN KEY (`departId`) REFERENCES `department` (`Id`),
  CONSTRAINT `departfile_ibfk_2` FOREIGN KEY (`fileId`) REFERENCES `file` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of departfile
-- ----------------------------

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `departName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '管理层');
INSERT INTO `department` VALUES ('2', '财务部');
INSERT INTO `department` VALUES ('3', '人事部');
INSERT INTO `department` VALUES ('4', '财务部');
INSERT INTO `department` VALUES ('5', '产品设计部');
INSERT INTO `department` VALUES ('6', '开发部 ');
INSERT INTO `department` VALUES ('7', '销售部');
INSERT INTO `department` VALUES ('8', '公共');

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(255) DEFAULT NULL,
  `fileFormat` varchar(255) DEFAULT NULL,
  `fileType` int(11) DEFAULT NULL,
  `uploadTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `uploaderId` int(11) DEFAULT NULL,
  `size` double DEFAULT NULL,
  `dwlNum` int(11) DEFAULT NULL,
  `fileAddress` varchar(255) DEFAULT NULL,
  `fileAttibute` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `file_ibfk_1` (`fileType`),
  KEY `file_ibfk_2` (`uploaderId`),
  CONSTRAINT `file_ibfk_1` FOREIGN KEY (`fileType`) REFERENCES `filetype` (`Id`),
  CONSTRAINT `file_ibfk_2` FOREIGN KEY (`uploaderId`) REFERENCES `user` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES ('1', '汉萨将', 'txt', '1', '2018-01-07 16:33:22', '1', '2221', '22', null, '0');
INSERT INTO `file` VALUES ('2', '加速卡', 'mp3', '3', '2018-01-07 17:58:21', '2', '22222', '33', null, '1');
INSERT INTO `file` VALUES ('3', '假大空', 'mp3', '3', '2018-01-07 16:34:04', '3', '3', '44', null, '1');
INSERT INTO `file` VALUES ('4', '顺口溜', 'mp4', '4', '2018-01-07 16:34:13', '4', '5', '55', null, '0');
INSERT INTO `file` VALUES ('5', '深深', 'rar', '5', '2018-01-07 16:34:12', '1', '33333', '33', null, '0');
INSERT INTO `file` VALUES ('6', 'Tuser', 'java', '5', '2018-01-07 16:34:11', '1', '4213', '11', 'D:\\QQ\\qqnews\\929112414\\FileRecv\\j2ee\\example\\SSHSample\\src\\main\\webapp\\files\\2017\\12\\30\\21\\Tuser.java', '0');
INSERT INTO `file` VALUES ('7', 'aaa', 'txt', '1', '2018-01-07 16:33:24', '2', '222', '22', null, '0');
INSERT INTO `file` VALUES ('8', 'bbb', 'txt', '1', '2018-01-07 16:33:24', '8', '1111', '8', null, '0');
INSERT INTO `file` VALUES ('32', '《软件体系结构》实验报告模板 2018_01_07_17_48_18', 'doc', '1', '2018-01-07 17:48:19', '2', '347821', null, 'E:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\FilseShare\\files\\depart2\\文档\\《软件体系结构》实验报告模板 2018_01_07_17_48_18.doc', '1');
INSERT INTO `file` VALUES ('33', '实验 2018_01_07_17_52_06', 'zip', '5', '2018-01-07 17:52:07', '2', '5191441', null, 'E:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\FilseShare\\files\\depart2\\其他\\实验 2018_01_07_17_52_06.zip', '1');
INSERT INTO `file` VALUES ('34', '实验 ', 'zip', '5', '2018-01-07 17:55:06', '2', '5191441', '11', 'E:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\FilseShare\\files\\depart2\\其他\\实验 .zip', '1');

-- ----------------------------
-- Table structure for filetype
-- ----------------------------
DROP TABLE IF EXISTS `filetype`;
CREATE TABLE `filetype` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of filetype
-- ----------------------------
INSERT INTO `filetype` VALUES ('1', '文档');
INSERT INTO `filetype` VALUES ('2', '图片');
INSERT INTO `filetype` VALUES ('3', '音乐');
INSERT INTO `filetype` VALUES ('4', '视频');
INSERT INTO `filetype` VALUES ('5', '其他');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `sendId` int(11) DEFAULT NULL,
  `receiveId` int(11) DEFAULT NULL,
  `msgTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `msgType` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `message_ibfk_1` (`sendId`),
  KEY `message_ibfk_2` (`receiveId`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`sendId`) REFERENCES `user` (`Id`),
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`receiveId`) REFERENCES `user` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `noticeContent` varchar(255) DEFAULT NULL,
  `noticeTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fileId` int(11) DEFAULT NULL,
  `departId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `notice_ibfk_1` (`fileId`),
  KEY `notice_ibfk_2` (`departId`),
  CONSTRAINT `notice_ibfk_1` FOREIGN KEY (`fileId`) REFERENCES `file` (`Id`),
  CONSTRAINT `notice_ibfk_2` FOREIGN KEY (`departId`) REFERENCES `department` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for share
-- ----------------------------
DROP TABLE IF EXISTS `share`;
CREATE TABLE `share` (
  `userId` int(11) DEFAULT NULL,
  `fileId` int(11) DEFAULT NULL,
  `shareTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  KEY `share_ibfk_1` (`userId`),
  KEY `share_ibfk_2` (`fileId`),
  CONSTRAINT `share_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`Id`),
  CONSTRAINT `share_ibfk_2` FOREIGN KEY (`fileId`) REFERENCES `file` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of share
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `userAccount` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `departId` int(11) DEFAULT NULL,
  `userGender` varchar(255) DEFAULT NULL,
  `workTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `userType` int(11) NOT NULL,
  `userSet` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `newMessage` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `user_ibfk_1` (`departId`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`departId`) REFERENCES `department` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '000012', '陈宏子', '1', '1', '2018-01-07 20:57:38', 'zhouxiaobing88@qq.com ', '13732207312', '2', null, '深圳市南山区科技园南区R2-B三楼步步高', '123456', '11');
INSERT INTO `user` VALUES ('2', '000213', '秦婷婷', '2', '2', '2017-12-26 20:11:57', 'cynthia_017@163.com', '13732207312', '1', null, '深圳南山区科技园汇景豪苑海欣阁23F', '213133', '43');
INSERT INTO `user` VALUES ('3', '000314', '折蓉蓉', '3', '2', '2017-12-26 20:11:57', '150939468@qq.com', '18268059998', '1', null, '深圳市南山区白石洲中信红树湾3a2901', '222222', '21');
INSERT INTO `user` VALUES ('4', '000415', '姜钰', '4', '1', '2017-12-26 20:11:57', 'miikii2008@gmail.com', '15858208818', '1', null, '深圳市南山区科技园南区R2-B三楼步步高', '1111111', '1');
INSERT INTO `user` VALUES ('5', '000516', '倪辰曦', '5', '2', '2017-12-26 20:11:57', 'shilibleach@yahoo.cn', '15257143335', '1', null, '深圳南山区科技园汇景豪苑海欣阁23F', '123456', '44');
INSERT INTO `user` VALUES ('6', '000617', '陈墨', '6', '1', '2018-01-07 21:04:34', '503609793@qq.com', '18458243332', '1', null, '深圳市南山区白石洲中信红树湾3a2901', '888888', '12');
INSERT INTO `user` VALUES ('7', '000718', '王官君', '7', '1', '2017-12-26 20:11:57', 'mijaewbv@kmvyhaxe.com', '15958189933', '1', null, '深圳市南山区科技园南区R2-B三楼步步高', '222222', '21');
INSERT INTO `user` VALUES ('8', '000219', '李剑', '2', '2', '2018-01-07 14:49:09', 'syvia_lili@163.com', '13732206825', '0', null, '深圳南山区科技园汇景豪苑海欣阁23F', '1111111', '31');
INSERT INTO `user` VALUES ('9', '000420', '姚志奋', '4', '2', '2017-12-26 20:11:57', '313654879@qq.com', '13732206587', '1', null, '深圳市南山区白石洲中信红树湾3a2901', '123456', '13');
INSERT INTO `user` VALUES ('10', '000621', '孙洪山', '6', '2', '2017-12-26 20:11:57', 'mijobs@126.com', '13732207100', '1', null, '深圳市南山区科技园南区R2-B三楼步步高', '213133', '15');
INSERT INTO `user` VALUES ('11', '000024', '嗯哼', '2', '2', '2018-01-10 14:42:19', '22222@qq。com', '1211332131', '0', null, null, null, null);

-- ----------------------------
-- Table structure for userfile
-- ----------------------------
DROP TABLE IF EXISTS `userfile`;
CREATE TABLE `userfile` (
  `userId` int(11) DEFAULT NULL,
  `fileId` int(11) DEFAULT NULL,
  KEY `userfile_ibfk_1` (`userId`),
  KEY `userfile_ibfk_2` (`fileId`),
  CONSTRAINT `userfile_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`Id`),
  CONSTRAINT `userfile_ibfk_2` FOREIGN KEY (`fileId`) REFERENCES `file` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userfile
-- ----------------------------
