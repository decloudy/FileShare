/*
Navicat MySQL Data Transfer

Source Server         : Database
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : fileshare

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-01-07 02:41:42
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '研发部');
INSERT INTO `department` VALUES ('2', '人事部');
INSERT INTO `department` VALUES ('3', '财务部');
INSERT INTO `department` VALUES ('4', '技术部');

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
  PRIMARY KEY (`Id`),
  KEY `file_ibfk_1` (`fileType`),
  KEY `file_ibfk_2` (`uploaderId`),
  CONSTRAINT `file_ibfk_1` FOREIGN KEY (`fileType`) REFERENCES `filetype` (`Id`),
  CONSTRAINT `file_ibfk_2` FOREIGN KEY (`uploaderId`) REFERENCES `user` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file
-- ----------------------------

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
INSERT INTO `filetype` VALUES ('1', '视频');
INSERT INTO `filetype` VALUES ('2', '音乐');
INSERT INTO `filetype` VALUES ('3', '图片');
INSERT INTO `filetype` VALUES ('4', '文档');
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
  `password` varchar(255) DEFAULT NULL,
  `userAccount` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `departId` int(11) DEFAULT NULL,
  `userGender` int(11) DEFAULT NULL,
  `workTime` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `userType` int(11) NOT NULL,
  `userSet` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `newMessage` int(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `user_ibfk_1` (`departId`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`departId`) REFERENCES `department` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '12345', '1150299175', '云歿', '1', '1', '2017-12-06', 'aaa', 'aaa', '2', '1', null, '2');
INSERT INTO `user` VALUES ('2', '12345', '1150299176', '艾尔', '3', '0', '2017-12-05', null, null, '1', '0', null, null);
INSERT INTO `user` VALUES ('3', '888888', '1150299177', '卫宫', '2', '1', '2018-01-02', null, '33333', '0', '0', null, null);
INSERT INTO `user` VALUES ('4', '888888', '1150299178', '贞德', '2', '0', '2018-01-03', null, null, '0', '0', null, null);
INSERT INTO `user` VALUES ('5', '888888', '1150299179', '天草', '2', '0', '2018-01-10', null, null, '0', '0', null, null);
INSERT INTO `user` VALUES ('6', '888888', '1150299180', '呆毛1', '3', '0', '2018-01-04', null, null, '0', '0', null, null);
INSERT INTO `user` VALUES ('7', '888888', '1150299181', '小安', '3', '0', '2018-01-03', null, null, '0', '0', null, null);
INSERT INTO `user` VALUES ('8', '888888', '1150299182', '梅林', '4', '0', '2018-01-05', null, null, '0', '0', null, null);
INSERT INTO `user` VALUES ('9', '888888', '1150299183', '玛修', '3', '0', '2018-01-10', null, null, '0', '0', null, null);
INSERT INTO `user` VALUES ('10', '888888', '1150299184', '拉二', '2', '0', '2018-01-02', null, null, '0', '0', null, null);
INSERT INTO `user` VALUES ('11', '888888', '1150299185', '船长', '1', '0', '2018-01-02', null, null, '0', '0', null, null);
INSERT INTO `user` VALUES ('12', '888888', '1150299186', '孔明', '1', '0', '2018-01-02', null, null, '0', '0', null, null);
INSERT INTO `user` VALUES ('13', '888888', '1150299187', '黑贞', '2', '0', '2018-01-06', null, null, '0', '0', null, null);
INSERT INTO `user` VALUES ('14', '888888', '1150299188', '天空', '2', '0', '2018-01-16', null, null, '0', '0', null, null);
INSERT INTO `user` VALUES ('15', '888888', '1150299189', '艾蕾', '2', '0', '2018-01-06', null, null, '0', '0', null, null);
INSERT INTO `user` VALUES ('16', '888888', '1150299190', '七天', '1', '0', '2018-01-06', null, null, '0', '0', null, null);
INSERT INTO `user` VALUES ('17', '888888', '1150299191', '凉凉', '2', '0', '2018-01-06', null, null, '0', '0', null, null);
INSERT INTO `user` VALUES ('18', '888888', '1150299192', '白霜', '1', '0', '2018-01-06', null, null, '0', '0', null, null);
INSERT INTO `user` VALUES ('19', '888888', '1150299193', '晴朗', '2', '0', '2018-01-06', null, null, '0', '0', null, null);

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
