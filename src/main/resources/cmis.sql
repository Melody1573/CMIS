/*
 Navicat Premium Data Transfer

 Source Server         : MySql
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : cmis

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 14/03/2024 15:49:07
*/

CREATE DATABASE cmis;
USE cmis;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, '123', 'MTIz', NULL);
INSERT INTO `admin` VALUES (2, '233', 'MTIz', NULL);

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unit` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(1) NULL DEFAULT NULL,
  `grade` int(1) NULL DEFAULT NULL,
  `estate` int(1) NULL DEFAULT NULL,
  `heating` int(1) NULL DEFAULT NULL,
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code_unique`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 594 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES (566, '444.0', '485811266332847000', '啊实打实大师', 1, 2, 0, 1, NULL);
INSERT INTO `person` VALUES (568, '测试二', '123456789012345678', '测试单位', 1, 1, 1, 1, '测试二');
INSERT INTO `person` VALUES (575, '测试三', '123456789012345672', '测试单位', 1, 2, 1, 1, '');
INSERT INTO `person` VALUES (576, '测试四', '152629200009160000', '测试单位', 2, 2, 1, 0, '');
INSERT INTO `person` VALUES (582, '征信查询自产自销', '152629200009160002', '啊实打实大', 2, 1, 1, 1, '');
INSERT INTO `person` VALUES (585, '萨达撒多', '15262920000916000x', '萨达撒萨达', 1, 1, 1, 1, '');
INSERT INTO `person` VALUES (586, '萨达撒多', '152629200009160001', '萨达撒萨达', 1, 1, 1, 0, '');
INSERT INTO `person` VALUES (587, '萨达撒多', '000000000000000000', '萨达撒萨达', 1, 2, 1, 0, '');
INSERT INTO `person` VALUES (588, '测试四', '150424198010100213', '测试单位', 1, 1, 1, 1, '150424198010100213');
INSERT INTO `person` VALUES (589, '萨达撒多', '152629200009160004', '萨达撒萨达', 1, 1, 1, 0, '');
INSERT INTO `person` VALUES (590, '萨达撒多', '152629200009160023', '萨达撒萨达', 2, 2, 1, 0, '');
INSERT INTO `person` VALUES (591, '撒大大', '152629200009160513', '', 1, 2, 1, 0, '');
INSERT INTO `person` VALUES (592, '测试五', '152801200207173128', '测试单位', 1, 1, 1, 1, '测试五');
INSERT INTO `person` VALUES (593, '测试六', '152801200207173127', '测试单位', 2, 1, 1, 1, '测试六');

-- ----------------------------
-- Table structure for subsidy
-- ----------------------------
DROP TABLE IF EXISTS `subsidy`;
CREATE TABLE `subsidy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` date NULL DEFAULT NULL,
  `money` decimal(6, 2) NULL DEFAULT NULL,
  `type` int(1) NULL DEFAULT NULL,
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `person_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 303 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subsidy
-- ----------------------------
INSERT INTO `subsidy` VALUES (191, '2023-12-28', 343.00, 1, '1', 25);
INSERT INTO `subsidy` VALUES (192, '2023-12-28', 123.00, 1, '11', 25);
INSERT INTO `subsidy` VALUES (194, '2023-12-28', 3434.00, 1, '1', 27);
INSERT INTO `subsidy` VALUES (195, '2023-12-28', 2222.00, 1, '1111', 25);
INSERT INTO `subsidy` VALUES (196, '2023-12-28', 111.00, 1, '1', 25);
INSERT INTO `subsidy` VALUES (197, '2023-12-28', 222.00, 1, '22', 32);
INSERT INTO `subsidy` VALUES (198, '2023-12-28', 234.00, 1, '物价上涨', 30);
INSERT INTO `subsidy` VALUES (199, '2023-12-28', 343.00, 1, '1', 25);
INSERT INTO `subsidy` VALUES (200, '2023-12-28', 123.00, 1, '11', 25);
INSERT INTO `subsidy` VALUES (201, '2023-12-28', 123.00, 1, '1111', 25);
INSERT INTO `subsidy` VALUES (202, '2023-12-28', 3434.00, 1, '1', 27);
INSERT INTO `subsidy` VALUES (203, '2023-12-28', 2222.00, 1, '1111', 25);
INSERT INTO `subsidy` VALUES (204, '2023-12-28', 111.00, 1, '1', 25);
INSERT INTO `subsidy` VALUES (205, '2023-12-28', 222.00, 1, '22', 32);
INSERT INTO `subsidy` VALUES (207, '2023-12-28', 343.00, 1, '1', 25);
INSERT INTO `subsidy` VALUES (208, '2023-12-28', 123.00, 1, '11', 25);
INSERT INTO `subsidy` VALUES (209, '2023-12-28', 123.00, 1, '1111', 25);
INSERT INTO `subsidy` VALUES (210, '2023-12-28', 3434.00, 1, '1', 27);
INSERT INTO `subsidy` VALUES (211, '2023-12-28', 2222.00, 1, '1111', 25);
INSERT INTO `subsidy` VALUES (212, '2023-12-28', 111.00, 1, '1', 25);
INSERT INTO `subsidy` VALUES (213, '2023-12-28', 222.00, 1, '22', 32);
INSERT INTO `subsidy` VALUES (214, '2023-12-28', 234.00, 1, '物价上涨', 30);
INSERT INTO `subsidy` VALUES (215, '2023-12-28', 343.00, 1, '1', 25);
INSERT INTO `subsidy` VALUES (216, '2023-12-28', 123.00, 1, '11', 25);
INSERT INTO `subsidy` VALUES (217, '2023-12-28', 123.00, 1, '1111', 25);
INSERT INTO `subsidy` VALUES (218, '2023-12-28', 3434.00, 1, '1', 27);
INSERT INTO `subsidy` VALUES (219, '2023-12-28', 2222.00, 1, '1111', 25);
INSERT INTO `subsidy` VALUES (220, '2023-12-28', 111.00, 1, '1', 25);
INSERT INTO `subsidy` VALUES (221, '2023-12-28', 222.00, 1, '22', 32);
INSERT INTO `subsidy` VALUES (222, '2023-12-28', 234.00, 1, '物价上涨', 30);
INSERT INTO `subsidy` VALUES (223, '2023-12-28', 343.00, 1, '1', 25);
INSERT INTO `subsidy` VALUES (224, '2023-12-28', 123.00, 1, '11', 25);
INSERT INTO `subsidy` VALUES (225, '2023-12-28', 123.00, 1, '1111', 25);
INSERT INTO `subsidy` VALUES (226, '2023-12-28', 3434.00, 1, '1', 27);
INSERT INTO `subsidy` VALUES (227, '2023-12-28', 2222.00, 1, '1111', 25);
INSERT INTO `subsidy` VALUES (228, '2023-12-28', 111.00, 1, '1', 25);
INSERT INTO `subsidy` VALUES (229, '2023-12-28', 222.00, 1, '22', 32);
INSERT INTO `subsidy` VALUES (230, '2023-12-28', 234.00, 1, '物价上涨', 30);
INSERT INTO `subsidy` VALUES (231, '2023-12-28', 343.00, 1, '1', 25);
INSERT INTO `subsidy` VALUES (232, '2023-12-28', 123.00, 1, '11', 25);
INSERT INTO `subsidy` VALUES (233, '2023-12-28', 123.00, 1, '1111', 25);
INSERT INTO `subsidy` VALUES (234, '2023-12-28', 3434.00, 1, '1', 27);
INSERT INTO `subsidy` VALUES (235, '2023-12-28', 2222.00, 1, '1111', 25);
INSERT INTO `subsidy` VALUES (236, '2023-12-28', 111.00, 1, '1', 25);
INSERT INTO `subsidy` VALUES (237, '2023-12-28', 222.00, 1, '22', 32);
INSERT INTO `subsidy` VALUES (238, '2023-12-28', 234.00, 1, '物价上涨', 30);
INSERT INTO `subsidy` VALUES (239, '2023-12-28', 343.00, 1, '1', 25);
INSERT INTO `subsidy` VALUES (240, '2023-12-28', 123.00, 1, '11', 25);
INSERT INTO `subsidy` VALUES (241, '2023-12-28', 123.00, 1, '1111', 25);
INSERT INTO `subsidy` VALUES (243, '2023-12-28', 2222.00, 1, '1111', 25);
INSERT INTO `subsidy` VALUES (244, '2023-12-28', 111.00, 1, '1', 25);
INSERT INTO `subsidy` VALUES (245, '2023-12-28', 222.00, 1, '22', 32);
INSERT INTO `subsidy` VALUES (261, '2024-01-02', 456.17, 2, '456.167', 568);
INSERT INTO `subsidy` VALUES (262, '2024-01-02', 1000.06, 2, '1000.056', 568);
INSERT INTO `subsidy` VALUES (263, '2024-01-02', 12.00, 2, '12', 568);
INSERT INTO `subsidy` VALUES (264, '2024-01-02', 2.00, 2, '1', 568);
INSERT INTO `subsidy` VALUES (265, '2024-01-02', 35.00, 2, '34.9999999999999999999999999999999999999999999999999999999999999999', 568);
INSERT INTO `subsidy` VALUES (266, '2024-01-02', 0.00, 2, '0.00', 568);
INSERT INTO `subsidy` VALUES (267, '2024-01-02', 1.00, 2, '1', 568);
INSERT INTO `subsidy` VALUES (268, '2024-01-02', 1.00, 2, '1', 568);
INSERT INTO `subsidy` VALUES (269, '2024-01-02', 1.00, 2, '1', 568);
INSERT INTO `subsidy` VALUES (274, '2023-12-22', 9998.45, 1, '', 568);
INSERT INTO `subsidy` VALUES (275, '2023-12-22', 9999.00, 1, '', 587);
INSERT INTO `subsidy` VALUES (276, '2023-12-22', 50.53, 1, 'Opening JDBC Connection\r\nChecked out connection 9', 553);
INSERT INTO `subsidy` VALUES (277, '2023-12-22', 123.00, 2, '', 557);
INSERT INTO `subsidy` VALUES (278, '2024-01-02', 1.00, 1, '1', 568);
INSERT INTO `subsidy` VALUES (279, '2024-01-02', 1.00, 1, '1', 568);
INSERT INTO `subsidy` VALUES (280, '2024-01-02', 1.00, 1, '1', 568);
INSERT INTO `subsidy` VALUES (281, '2024-01-02', 1.00, 1, '1', 568);
INSERT INTO `subsidy` VALUES (282, '2024-01-02', 1.00, 1, '', 589);
INSERT INTO `subsidy` VALUES (283, '2024-01-02', 1.00, 1, '', 589);
INSERT INTO `subsidy` VALUES (284, '2024-01-02', 1.00, 1, '', 589);
INSERT INTO `subsidy` VALUES (285, '2024-01-02', 1.00, 1, '', 589);
INSERT INTO `subsidy` VALUES (286, '2024-01-02', 1.00, 1, '', 589);
INSERT INTO `subsidy` VALUES (287, '2024-01-02', 1.00, 1, '', 589);
INSERT INTO `subsidy` VALUES (288, '2024-01-02', 2.00, 1, '', 589);
INSERT INTO `subsidy` VALUES (289, '2024-01-02', 3.00, 1, '', 589);
INSERT INTO `subsidy` VALUES (290, '2024-01-02', 4.00, 1, '', 589);
INSERT INTO `subsidy` VALUES (291, '2024-01-02', 33.00, 1, '', 589);
INSERT INTO `subsidy` VALUES (292, '2024-01-03', 9999.99, 1, '', 560);
INSERT INTO `subsidy` VALUES (293, '2024-01-03', 9999.99, 1, '', 568);
INSERT INTO `subsidy` VALUES (294, '2024-01-03', 9999.99, 1, '', 564);
INSERT INTO `subsidy` VALUES (295, '2024-01-03', 9999.99, 1, '', 576);
INSERT INTO `subsidy` VALUES (296, '2024-01-03', 9999.99, 1, '', 576);
INSERT INTO `subsidy` VALUES (297, '2024-01-03', 9999.99, 1, '', 576);
INSERT INTO `subsidy` VALUES (298, '2024-01-03', 9999.99, 1, '9999.999', 593);
INSERT INTO `subsidy` VALUES (299, '2024-01-03', 9999.99, 1, '', 576);
INSERT INTO `subsidy` VALUES (300, '2024-01-03', 9999.99, 1, '', 576);
INSERT INTO `subsidy` VALUES (301, '2024-01-03', 9999.11, 1, '', 585);
INSERT INTO `subsidy` VALUES (302, '2024-01-03', 123.00, 1, '', 585);

SET FOREIGN_KEY_CHECKS = 1;
