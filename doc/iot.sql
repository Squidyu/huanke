/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50550
Source Host           : localhost:3306
Source Database       : iot

Target Server Type    : MYSQL
Target Server Version : 50550
File Encoding         : 65001

Date: 2018-05-30 22:59:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userName` varchar(200) DEFAULT NULL COMMENT '用户名',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `saltPassword` varchar(200) DEFAULT NULL COMMENT '加密盐值',
  `insertTime` bigint(20) DEFAULT NULL COMMENT '写入时间',
  `lastUpdateTime` bigint(20) DEFAULT NULL COMMENT '最后修改时间',
  `status` int(11) DEFAULT NULL COMMENT '账号状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'admin', '74cb1c732d55c3aa93bad590ffe1ee8b', '123', '1527522274000', '1527522274000', '1');

-- ----------------------------
-- Table structure for t_app_user
-- ----------------------------
DROP TABLE IF EXISTS `t_app_user`;
CREATE TABLE `t_app_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `openId` varchar(100) DEFAULT NULL COMMENT 'openId',
  `sex` int(11) DEFAULT NULL COMMENT '性别',
  `province` varchar(100) DEFAULT NULL COMMENT '省',
  `city` varchar(100) DEFAULT NULL COMMENT '城市',
  `nickname` varchar(100) DEFAULT NULL COMMENT '昵称',
  `unionid` varchar(100) DEFAULT NULL COMMENT 'unionId',
  `headimgurl` varchar(200) DEFAULT NULL COMMENT '头像',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `lastUpdateTime` bigint(20) DEFAULT NULL COMMENT '最后修改时间',
  `lastVisitTime` bigint(20) DEFAULT NULL COMMENT '最后访问时间',
  `androidMac` varchar(255) DEFAULT NULL COMMENT '安卓mac地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_app_user
-- ----------------------------

-- ----------------------------
-- Table structure for t_device
-- ----------------------------
DROP TABLE IF EXISTS `t_device`;
CREATE TABLE `t_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '设备主键id',
  `mac` varchar(200) DEFAULT '' COMMENT 'mac地址',
  `name` varchar(200) DEFAULT '' COMMENT '项目名称',
  `deviceId` varchar(200) DEFAULT '' COMMENT '微信生成的设备id',
  `devicelicence` varchar(200) DEFAULT '' COMMENT '设备序列号',
  `productId` int(11) DEFAULT NULL COMMENT '产品id',
  `projectId` int(11) DEFAULT NULL COMMENT '项目id',
  `deviceTypeId` int(11) DEFAULT NULL COMMENT '设备类型',
  `bindStatus` int(11) DEFAULT NULL COMMENT '绑定状态1-初始化2-已绑定3-已解绑',
  `createTime` bigint(20) DEFAULT NULL COMMENT '添加时间',
  `lastUpdateTime` bigint(20) DEFAULT NULL COMMENT '最后修改时间',
  `bindTime` bigint(20) DEFAULT NULL COMMENT '绑定和解绑时间',
  `speedConfig` varchar(4096) DEFAULT NULL COMMENT '转速配置',
  `ip` varchar(200) DEFAULT NULL COMMENT '机器Ip',
  PRIMARY KEY (`id`),
  KEY `idxDeviceId` (`deviceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_device
-- ----------------------------

-- ----------------------------
-- Table structure for t_device_data_alarm
-- ----------------------------
DROP TABLE IF EXISTS `t_device_data_alarm`;
CREATE TABLE `t_device_data_alarm` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `deviceId` int(11) DEFAULT NULL COMMENT '设备id',
  `indexVal` int(11) DEFAULT NULL COMMENT '设备下标',
  `type` int(11) DEFAULT NULL COMMENT '报警类型',
  `value` int(11) DEFAULT NULL COMMENT '报警值',
  `dealStatus` int(11) DEFAULT NULL COMMENT '处理状态',
  `dealTime` int(11) DEFAULT NULL COMMENT '处理时间',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_device_data_alarm
-- ----------------------------
INSERT INTO `t_device_data_alarm` VALUES ('1', '1', '0', '1', '2', '1', null, '1527611450652');

-- ----------------------------
-- Table structure for t_device_data_control
-- ----------------------------
DROP TABLE IF EXISTS `t_device_data_control`;
CREATE TABLE `t_device_data_control` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `deviceId` int(11) DEFAULT NULL COMMENT '设备id',
  `funcId` varchar(20) DEFAULT NULL COMMENT '功能id',
  `funcValue` int(11) DEFAULT NULL COMMENT '功能当前值',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_device_data_control
-- ----------------------------

-- ----------------------------
-- Table structure for t_device_data_info
-- ----------------------------
DROP TABLE IF EXISTS `t_device_data_info`;
CREATE TABLE `t_device_data_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `deviceId` int(11) DEFAULT NULL COMMENT '设备id',
  `wxInfo` varchar(200) DEFAULT NULL COMMENT 'wx信息',
  `mac` varchar(200) DEFAULT NULL COMMENT 'mac',
  `imei` varchar(200) DEFAULT NULL COMMENT 'imei',
  `imsi` varchar(200) DEFAULT NULL COMMENT 'imsi',
  `version` varchar(300) DEFAULT NULL COMMENT '版本信息',
  `createTime` bigint(20) DEFAULT NULL COMMENT '写入时间',
  `lastUpdateTime` bigint(20) DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_device_data_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_device_data_location
-- ----------------------------
DROP TABLE IF EXISTS `t_device_data_location`;
CREATE TABLE `t_device_data_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `deviceId` int(11) DEFAULT NULL COMMENT '设备id',
  `wifi` int(11) DEFAULT NULL COMMENT 'wifi',
  `grps` int(11) DEFAULT NULL COMMENT 'grps',
  `gps` int(11) DEFAULT NULL COMMENT 'gps',
  `blutooth` int(11) DEFAULT NULL COMMENT 'blutooth',
  `extFields` int(11) DEFAULT NULL,
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_device_data_location
-- ----------------------------

-- ----------------------------
-- Table structure for t_device_data_sensor
-- ----------------------------
DROP TABLE IF EXISTS `t_device_data_sensor`;
CREATE TABLE `t_device_data_sensor` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `deviceId` int(11) DEFAULT NULL COMMENT '设备id',
  `sensorType` varchar(20) DEFAULT NULL COMMENT '传感器数据类型',
  `sensorValue` int(11) DEFAULT NULL COMMENT '传感器数值',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idxDeviceId` (`deviceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_device_data_sensor
-- ----------------------------

-- ----------------------------
-- Table structure for t_device_func
-- ----------------------------
DROP TABLE IF EXISTS `t_device_func`;
CREATE TABLE `t_device_func` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(512) DEFAULT NULL COMMENT '功能类型',
  `valueRange` varchar(512) DEFAULT NULL COMMENT '值的范围',
  `valueType` varchar(20) DEFAULT NULL COMMENT '值的类型',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备功能表';

-- ----------------------------
-- Records of t_device_func
-- ----------------------------

-- ----------------------------
-- Table structure for t_device_group
-- ----------------------------
DROP TABLE IF EXISTS `t_device_group`;
CREATE TABLE `t_device_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `groupName` varchar(100) DEFAULT NULL COMMENT '设备组名称',
  `userId` int(11) DEFAULT NULL COMMENT '用户id',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `lastUpdateTime` bigint(20) DEFAULT NULL COMMENT '最后修改时间',
  `status` int(11) DEFAULT NULL COMMENT '状态1-正常,2-已删除',
  `icon` varchar(200) DEFAULT NULL COMMENT '分组图标',
  `memo` varchar(2048) DEFAULT NULL COMMENT '分组说明',
  `videoCover` varchar(1024) DEFAULT NULL COMMENT '分组封面',
  `videoUrl` varchar(1024) DEFAULT NULL COMMENT '分组视频链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_device_group
-- ----------------------------

-- ----------------------------
-- Table structure for t_device_group_item
-- ----------------------------
DROP TABLE IF EXISTS `t_device_group_item`;
CREATE TABLE `t_device_group_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `deviceId` int(11) DEFAULT NULL COMMENT '设备id',
  `userId` int(11) DEFAULT NULL COMMENT '用户id',
  `groupId` int(11) DEFAULT NULL COMMENT '设备组id',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `lastUpdateTime` bigint(20) DEFAULT NULL COMMENT '最后修改时间',
  `status` int(11) DEFAULT NULL COMMENT '状态1-绑定,2-已解绑',
  `isMaster` int(11) DEFAULT NULL COMMENT '是否是主拥有人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_device_group_item
-- ----------------------------

-- ----------------------------
-- Table structure for t_device_operlog
-- ----------------------------
DROP TABLE IF EXISTS `t_device_operlog`;
CREATE TABLE `t_device_operlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `deviceId` int(11) DEFAULT NULL COMMENT '设备id',
  `funcId` int(11) DEFAULT NULL,
  `funcValue` varchar(255) DEFAULT NULL,
  `requestId` varchar(33) DEFAULT NULL COMMENT '请求id',
  `dealRet` int(11) DEFAULT NULL COMMENT '处理结果',
  `responseTime` bigint(20) DEFAULT NULL COMMENT '响应时间',
  `retMsg` varchar(255) DEFAULT NULL COMMENT '处理结果',
  `createTime` bigint(20) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_device_operlog
-- ----------------------------

-- ----------------------------
-- Table structure for t_device_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_device_relation`;
CREATE TABLE `t_device_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `deviceId` int(11) DEFAULT NULL COMMENT '设备id',
  `masterUserId` int(11) DEFAULT NULL COMMENT '分享人userId',
  `joinUserId` int(11) DEFAULT NULL COMMENT '加入人userId',
  `createTime` bigint(20) DEFAULT NULL COMMENT '时间',
  `status` int(11) DEFAULT NULL COMMENT '关系状态',
  `lastUpdateTime` bigint(20) DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_device_relation
-- ----------------------------

-- ----------------------------
-- Table structure for t_device_timer
-- ----------------------------
DROP TABLE IF EXISTS `t_device_timer`;
CREATE TABLE `t_device_timer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deviceId` int(11) DEFAULT NULL COMMENT '设备id',
  `userId` int(11) DEFAULT NULL COMMENT '用户id',
  `name` varchar(255) DEFAULT NULL COMMENT '定时器设备',
  `timerType` int(11) DEFAULT NULL COMMENT '类型',
  `executeTime` bigint(20) DEFAULT NULL COMMENT '执行时间',
  `status` int(11) DEFAULT NULL COMMENT '1-正常,2-已取消,3-已失效',
  `executeRet` int(11) DEFAULT NULL COMMENT '执行结果',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `lastUpdateTime` bigint(20) DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_device_timer
-- ----------------------------

-- ----------------------------
-- Table structure for t_device_type
-- ----------------------------
DROP TABLE IF EXISTS `t_device_type`;
CREATE TABLE `t_device_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型主键',
  `name` varchar(200) DEFAULT '' COMMENT '类型名称',
  `icon` varchar(200) DEFAULT '' COMMENT '类型图标',
  `funcList` varchar(2048) DEFAULT NULL COMMENT '功能列表',
  `sensorList` varchar(2048) DEFAULT NULL COMMENT '传感器列表',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `lastUpdateTime` bigint(20) DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_device_type
-- ----------------------------
INSERT INTO `t_device_type` VALUES ('3', '净化设备', 'http://huanke.bcard.vip/deviceimg/xinfeng.png', '210,220,230,240,250,270,280,2A0,310,320,330,340,350', '110,120,130,140,150,160', null, null);
INSERT INTO `t_device_type` VALUES ('4', '新风设备', 'http://huanke.bcard.vip/deviceimg/xinfeng.png', '210,220,230,240,250,270,280,281,290,310,320,330,340,350', '110,111,120,121,130,131,140,141,150,160', null, null);

-- ----------------------------
-- Table structure for t_device_upgrade
-- ----------------------------
DROP TABLE IF EXISTS `t_device_upgrade`;
CREATE TABLE `t_device_upgrade` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `deviceId` int(11) DEFAULT NULL COMMENT '设备Id',
  `fileName` varchar(1024) DEFAULT NULL COMMENT '文件名',
  `fileSize` int(11) DEFAULT NULL COMMENT '文件大小',
  `md5` int(11) DEFAULT NULL COMMENT '文件md5',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `lastUpdateTime` bigint(20) DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_device_upgrade
-- ----------------------------

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `id` int(11) NOT NULL COMMENT '主键id',
  `productKey` varchar(33) DEFAULT NULL COMMENT 'PK',
  `productName` varchar(64) DEFAULT NULL COMMENT '产品名称',
  `insertTime` bigint(20) DEFAULT NULL COMMENT '写入时间',
  `lastUpdateTime` bigint(20) DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product
-- ----------------------------

-- ----------------------------
-- Table structure for t_project
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project` (
  `id` int(11) NOT NULL COMMENT '主键id',
  `projectSn` varchar(33) DEFAULT NULL COMMENT '项目序列号',
  `projectName` varchar(64) DEFAULT NULL COMMENT '项目名称',
  `insertTime` bigint(20) DEFAULT NULL COMMENT '写入时间',
  `lastUpdateTime` bigint(20) DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_project
-- ----------------------------

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `roleName` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `lastUpdateTime` bigint(20) DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userName` varchar(100) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `realName` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `createTime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `lastUpdateTime` bigint(20) DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
