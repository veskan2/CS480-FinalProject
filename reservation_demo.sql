/*
 Navicat MySQL Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50737
 Source Host           : localhost:3306
 Source Schema         : reservation_demo

 Target Server Type    : MySQL
 Target Server Version : 50737
 File Encoding         : 65001

 Date: 29/10/2023 19:00:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Admin ID',
  `admin_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Name',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Password',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'admin' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', 'Jerry', '111');

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement`  (
  `a_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Announcement ID',
  `a_content` varchar(900) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Announcement Content',
  `a_state` int(11) NULL DEFAULT NULL COMMENT 'Announcement State',
  `a_begin_time` datetime(0) NULL DEFAULT NULL COMMENT 'Announcement Start Time',
  `a_end_time` datetime(0) NULL DEFAULT NULL COMMENT 'Announcement End Time',
  `s_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Publisher ID',
  PRIMARY KEY (`a_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Announcement' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of announcement
-- ----------------------------

-- ----------------------------
-- Table structure for blacklist
-- ----------------------------
DROP TABLE IF EXISTS `blacklist`;
CREATE TABLE `blacklist`  (
  `s_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Student ID',
  `date_begin` date NULL DEFAULT NULL COMMENT 'Start Date',
  `date_end` date NULL DEFAULT NULL COMMENT 'End Date',
  `state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'State',
  `blacker_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Setter ID',
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blacklist' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blacklist
-- ----------------------------

-- ----------------------------
-- Table structure for classroom
-- ----------------------------
DROP TABLE IF EXISTS `classroom`;
CREATE TABLE `classroom`  (
  `room_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Classroom ID',
  `room_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Classroom Name',
  `building_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Building ID',
  `room_floor` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Floor',
  `available_seat` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Available Seats',
  `is_multimedia_room` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Multimedia Room',
  PRIMARY KEY (`room_id`, `building_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Classroom' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Records of classroom
-- ----------------------------
INSERT INTO `classroom` VALUES ('A', 'Room-01', '01', '1', '90', 'No');
INSERT INTO `classroom` VALUES ('B', 'Room-02', '01', '2', '20', 'Yes');
INSERT INTO `classroom` VALUES ('C', 'Room-03', '04', '3', '30', 'Yes');
INSERT INTO `classroom` VALUES ('D', 'Room-04', '05', '3', '40', 'No');

-- ----------------------------
-- Table structure for room_available_time_info
-- ----------------------------
DROP TABLE IF EXISTS `room_available_time_info`;
CREATE TABLE `room_available_time_info`  (
  `time_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Time Slot ID',
  `room_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Classroom ID',
  `building_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Building ID',
  `available_date` date NOT NULL COMMENT 'Date',
  `reservation_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Number of Reservations',
  `available_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Number of Available Reservations',
  PRIMARY KEY (`time_id`, `room_id`, `building_id`, `available_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Classroom Available Time Slots' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Records of room_available_time_info
-- ----------------------------
-- INSERT INTO `room_available_time_info` VALUES ('1', '01', '1', '2023-10-31', '0', '89');
-- INSERT INTO `room_available_time_info` VALUES ('1', '02', '2', '2023-10-31', '0', '18');
-- INSERT INTO `room_available_time_info` VALUES ('10', '02', '2', '2023-10-31', '0', '19');
-- INSERT INTO `room_available_time_info` VALUES ('11', '02', '2', '2023-10-31', '0', '20');
-- INSERT INTO `room_available_time_info` VALUES ('12', '02', '2', '2023-10-31', '0', '18');
-- INSERT INTO `room_available_time_info` VALUES ('2', '01', '1', '2023-10-31', '0', '90');
-- INSERT INTO `room_available_time_info` VALUES ('3', '01', '1', '2023-10-31', '0', '90');
-- INSERT INTO `room_available_time_info` VALUES ('4', '02', '2', '2023-10-31', '0', '19');
-- INSERT INTO `room_available_time_info` VALUES ('5', '02', '2', '2023-10-31', '0', '19');
-- INSERT INTO `room_available_time_info` VALUES ('6', '02', '2', '2023-10-31', '0', '20');
-- INSERT INTO `room_available_time_info` VALUES ('7', '01', '1', '2023-10-31', '0', '89');
-- INSERT INTO `room_available_time_info` VALUES ('8', '01', '1', '2023-10-31', '0', '90');
-- INSERT INTO `room_available_time_info` VALUES ('9', '01', '1', '2023-10-31', '0', '90');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `s_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Student ID',
  `s_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Name',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Password',
  `s_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Class',
  `s_year` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Grade',
  `s_major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Major',
  `s_phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Phone Number',
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Student' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Records of student
-- ----------------------------

INSERT INTO `student` VALUES ('480001', 'James', '123', '2003', '1', 'CS', '202-555-0147');
INSERT INTO `student` VALUES ('480002', 'Emily', '123', '2003', '2', 'EE', '415-555-0198');
INSERT INTO `student` VALUES ('480003', 'Michael', '123', '2003', '3', 'CS', '718-555-0123');
INSERT INTO `student` VALUES ('480004', 'Sarah', '123', '2003', '4', 'ECON', '305-555-0176');
INSERT INTO `student` VALUES ('480005', 'William', '123', '2003', '3', 'CS', '617-555-0189');
INSERT INTO `student` VALUES ('480006', 'Olivia', '123', '2003', '2', 'EE', '310-555-0134');
INSERT INTO `student` VALUES ('480007', 'Benjamin', '123', '2003', '4', 'BA', '469-555-0158');
INSERT INTO `student` VALUES ('480008', 'Sophia', '123', '2003', '4', 'PSY', '847-555-0112');
INSERT INTO `student` VALUES ('480009', 'Alexander', '123', '2003', '2', 'CHE', '858-555-0164');
INSERT INTO `student` VALUES ('480010', 'Isabella', '123', '2003', '1', 'CHE', '925-555-0143');
INSERT INTO `student` VALUES ('admin', 'mango', '111', '', '', '', '');

-- ----------------------------
-- Table structure for student_reservation
-- ----------------------------
DROP TABLE IF EXISTS `student_reservation`;
CREATE TABLE `student_reservation`  (
  `s_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Student ID',
  `time_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Time Slot ID',
  `room_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Classroom ID',
  `building_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Building ID',
  `reservation_date` date NOT NULL COMMENT 'Reservation Date',
  `state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'State',
  `room_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Classroom Name',
  PRIMARY KEY (`s_id`, `time_id`, `room_id`, `building_id`, `reservation_date`) USING BTREE,
  CONSTRAINT `f01` FOREIGN KEY (`s_id`) REFERENCES `student` (`s_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Student Reservation Information' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Records of student_reservation
-- ----------------------------


-- ----------------------------
-- Table structure for t_building
-- ----------------------------
DROP TABLE IF EXISTS `t_building`;
CREATE TABLE `t_building`  (
  `building_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Building ID',
  `building_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Building Name',
  `building_phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Contact Phone Number',
  `building_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Campus Location',
  PRIMARY KEY (`building_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Teaching Building' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_building
-- ----------------------------
INSERT INTO `t_building` VALUES ('01', 'BSB', '213-555-0148', 'Chicago');
INSERT INTO `t_building` VALUES ('02', 'ARC', '512-555-0173', 'Chicago');
INSERT INTO `t_building` VALUES ('03', 'SCE', '718-555-0192', 'Chicago');
INSERT INTO `t_building` VALUES ('04', 'SELE', '404-555-0136', 'Chicago');
INSERT INTO `t_building` VALUES ('05', 'SELW', '858-555-0159', 'Chicago');
INSERT INTO `t_building` VALUES ('06', 'SES', '907-555-0117', 'Chicago');
INSERT INTO `t_building` VALUES ('07', 'TBH', '646-555-0184', 'Chicago');




-- ----------------------------
-- Table structure for time_table
-- ----------------------------
DROP TABLE IF EXISTS `time_table`;
CREATE TABLE `time_table`  (
  `time_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Time Slot ID',
  `time_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Time Slot Name',
  `time_begin` time(0) NULL DEFAULT NULL COMMENT 'Start Time',
  `time_end` time(0) NULL DEFAULT NULL COMMENT 'End Time',
  `room_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Classroom ID',
  `building_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Building ID',
  PRIMARY KEY (`time_id`, `room_id`, `building_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Time Slot Table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of time_table
-- ----------------------------
INSERT INTO `time_table` VALUES ('1', 'T1', '7:00:00', '8:00:00', 'A', '01');
INSERT INTO `time_table` VALUES ('1', 'T1', '7:00:00', '8:00:00', 'A', '02');
INSERT INTO `time_table` VALUES ('1', 'T1', '7:00:00', '8:00:00', 'A', '03');
INSERT INTO `time_table` VALUES ('1', 'T1', '7:00:00', '8:00:00', 'A', '04');
INSERT INTO `time_table` VALUES ('1', 'T1', '7:00:00', '8:00:00', 'B', '01');
INSERT INTO `time_table` VALUES ('1', 'T1', '7:00:00', '8:00:00', 'B', '02');
INSERT INTO `time_table` VALUES ('1', 'T1', '7:00:00', '8:00:00', 'B', '03');
INSERT INTO `time_table` VALUES ('1', 'T1', '7:00:00', '8:00:00', 'B', '04');
INSERT INTO `time_table` VALUES ('1', 'T1', '7:00:00', '8:00:00', 'C', '01');
INSERT INTO `time_table` VALUES ('1', 'T1', '7:00:00', '8:00:00', 'C', '02');
INSERT INTO `time_table` VALUES ('1', 'T1', '7:00:00', '8:00:00', 'C', '03');
INSERT INTO `time_table` VALUES ('1', 'T1', '7:00:00', '8:00:00', 'C', '04');
INSERT INTO `time_table` VALUES ('1', 'T1', '7:00:00', '8:00:00', 'D', '01');
INSERT INTO `time_table` VALUES ('1', 'T1', '7:00:00', '8:00:00', 'D', '02');
INSERT INTO `time_table` VALUES ('1', 'T1', '7:00:00', '8:00:00', 'D', '03');
INSERT INTO `time_table` VALUES ('1', 'T1', '7:00:00', '8:00:00', 'D', '04');
INSERT INTO `time_table` VALUES ('2', 'T2', '8:00:00', '9:00:00', 'A', '01');
INSERT INTO `time_table` VALUES ('2', 'T2', '8:00:00', '9:00:00', 'A', '02');
INSERT INTO `time_table` VALUES ('2', 'T2', '8:00:00', '9:00:00', 'A', '03');
INSERT INTO `time_table` VALUES ('2', 'T2', '8:00:00', '9:00:00', 'A', '04');
INSERT INTO `time_table` VALUES ('2', 'T2', '8:00:00', '9:00:00', 'B', '01');
INSERT INTO `time_table` VALUES ('2', 'T2', '8:00:00', '9:00:00', 'B', '02');
INSERT INTO `time_table` VALUES ('2', 'T2', '8:00:00', '9:00:00', 'B', '03');
INSERT INTO `time_table` VALUES ('2', 'T2', '8:00:00', '9:00:00', 'B', '04');
INSERT INTO `time_table` VALUES ('2', 'T2', '8:00:00', '9:00:00', 'C', '01');
INSERT INTO `time_table` VALUES ('2', 'T2', '8:00:00', '9:00:00', 'C', '02');
INSERT INTO `time_table` VALUES ('2', 'T2', '8:00:00', '9:00:00', 'C', '03');
INSERT INTO `time_table` VALUES ('2', 'T2', '8:00:00', '9:00:00', 'C', '04');
INSERT INTO `time_table` VALUES ('2', 'T2', '8:00:00', '9:00:00', 'D', '01');
INSERT INTO `time_table` VALUES ('2', 'T2', '8:00:00', '9:00:00', 'D', '02');
INSERT INTO `time_table` VALUES ('2', 'T2', '8:00:00', '9:00:00', 'D', '03');
INSERT INTO `time_table` VALUES ('2', 'T2', '8:00:00', '9:00:00', 'D', '04');
INSERT INTO `time_table` VALUES ('3', 'T3', '9:00:00', '10:00:00', 'A', '01');
INSERT INTO `time_table` VALUES ('3', 'T3', '9:00:00', '10:00:00', 'A', '02');
INSERT INTO `time_table` VALUES ('3', 'T3', '9:00:00', '10:00:00', 'A', '03');
INSERT INTO `time_table` VALUES ('3', 'T3', '9:00:00', '10:00:00', 'A', '04');
INSERT INTO `time_table` VALUES ('3', 'T3', '9:00:00', '10:00:00', 'B', '01');
INSERT INTO `time_table` VALUES ('3', 'T3', '9:00:00', '10:00:00', 'B', '02');
INSERT INTO `time_table` VALUES ('3', 'T3', '9:00:00', '10:00:00', 'B', '03');
INSERT INTO `time_table` VALUES ('3', 'T3', '9:00:00', '10:00:00', 'B', '04');
INSERT INTO `time_table` VALUES ('3', 'T3', '9:00:00', '10:00:00', 'C', '01');
INSERT INTO `time_table` VALUES ('3', 'T3', '9:00:00', '10:00:00', 'C', '02');
INSERT INTO `time_table` VALUES ('3', 'T3', '9:00:00', '10:00:00', 'C', '03');
INSERT INTO `time_table` VALUES ('3', 'T3', '9:00:00', '10:00:00', 'C', '04');
INSERT INTO `time_table` VALUES ('3', 'T3', '9:00:00', '10:00:00', 'D', '01');
INSERT INTO `time_table` VALUES ('3', 'T3', '9:00:00', '10:00:00', 'D', '02');
INSERT INTO `time_table` VALUES ('3', 'T3', '9:00:00', '10:00:00', 'D', '03');
INSERT INTO `time_table` VALUES ('3', 'T3', '9:00:00', '10:00:00', 'D', '04');
INSERT INTO `time_table` VALUES ('4', 'T4', '10:00:00', '11:00:00', 'A', '01');
INSERT INTO `time_table` VALUES ('4', 'T4', '10:00:00', '11:00:00', 'A', '02');
INSERT INTO `time_table` VALUES ('4', 'T4', '10:00:00', '11:00:00', 'A', '03');
INSERT INTO `time_table` VALUES ('4', 'T4', '10:00:00', '11:00:00', 'A', '04');
INSERT INTO `time_table` VALUES ('4', 'T4', '10:00:00', '11:00:00', 'B', '01');
INSERT INTO `time_table` VALUES ('4', 'T4', '10:00:00', '11:00:00', 'B', '02');
INSERT INTO `time_table` VALUES ('4', 'T4', '10:00:00', '11:00:00', 'B', '03');
INSERT INTO `time_table` VALUES ('4', 'T4', '10:00:00', '11:00:00', 'B', '04');
INSERT INTO `time_table` VALUES ('4', 'T4', '10:00:00', '11:00:00', 'C', '01');
INSERT INTO `time_table` VALUES ('4', 'T4', '10:00:00', '11:00:00', 'C', '02');
INSERT INTO `time_table` VALUES ('4', 'T4', '10:00:00', '11:00:00', 'C', '03');
INSERT INTO `time_table` VALUES ('4', 'T4', '10:00:00', '11:00:00', 'C', '04');
INSERT INTO `time_table` VALUES ('4', 'T4', '10:00:00', '11:00:00', 'D', '01');
INSERT INTO `time_table` VALUES ('4', 'T4', '10:00:00', '11:00:00', 'D', '02');
INSERT INTO `time_table` VALUES ('4', 'T4', '10:00:00', '11:00:00', 'D', '03');
INSERT INTO `time_table` VALUES ('4', 'T4', '10:00:00', '11:00:00', 'D', '04');
INSERT INTO `time_table` VALUES ('5', 'T5', '11:00:00', '12:00:00', 'A', '01');
INSERT INTO `time_table` VALUES ('5', 'T5', '11:00:00', '12:00:00', 'A', '02');
INSERT INTO `time_table` VALUES ('5', 'T5', '11:00:00', '12:00:00', 'A', '03');
INSERT INTO `time_table` VALUES ('5', 'T5', '11:00:00', '12:00:00', 'A', '04');
INSERT INTO `time_table` VALUES ('5', 'T5', '11:00:00', '12:00:00', 'B', '01');
INSERT INTO `time_table` VALUES ('5', 'T5', '11:00:00', '12:00:00', 'B', '02');
INSERT INTO `time_table` VALUES ('5', 'T5', '11:00:00', '12:00:00', 'B', '03');
INSERT INTO `time_table` VALUES ('5', 'T5', '11:00:00', '12:00:00', 'B', '04');
INSERT INTO `time_table` VALUES ('5', 'T5', '11:00:00', '12:00:00', 'C', '01');
INSERT INTO `time_table` VALUES ('5', 'T5', '11:00:00', '12:00:00', 'C', '02');
INSERT INTO `time_table` VALUES ('5', 'T5', '11:00:00', '12:00:00', 'C', '03');
INSERT INTO `time_table` VALUES ('5', 'T5', '11:00:00', '12:00:00', 'C', '04');
INSERT INTO `time_table` VALUES ('5', 'T5', '11:00:00', '12:00:00', 'D', '01');
INSERT INTO `time_table` VALUES ('5', 'T5', '11:00:00', '12:00:00', 'D', '02');
INSERT INTO `time_table` VALUES ('5', 'T5', '11:00:00', '12:00:00', 'D', '03');
INSERT INTO `time_table` VALUES ('5', 'T5', '11:00:00', '12:00:00', 'D', '04');
INSERT INTO `time_table` VALUES ('6', 'T6', '12:00:00', '13:00:00', 'A', '01');
INSERT INTO `time_table` VALUES ('6', 'T6', '12:00:00', '13:00:00', 'A', '02');
INSERT INTO `time_table` VALUES ('6', 'T6', '12:00:00', '13:00:00', 'A', '03');
INSERT INTO `time_table` VALUES ('6', 'T6', '12:00:00', '13:00:00', 'A', '04');
INSERT INTO `time_table` VALUES ('6', 'T6', '12:00:00', '13:00:00', 'B', '01');
INSERT INTO `time_table` VALUES ('6', 'T6', '12:00:00', '13:00:00', 'B', '02');
INSERT INTO `time_table` VALUES ('6', 'T6', '12:00:00', '13:00:00', 'B', '03');
INSERT INTO `time_table` VALUES ('6', 'T6', '12:00:00', '13:00:00', 'B', '04');
INSERT INTO `time_table` VALUES ('6', 'T6', '12:00:00', '13:00:00', 'C', '01');
INSERT INTO `time_table` VALUES ('6', 'T6', '12:00:00', '13:00:00', 'C', '02');
INSERT INTO `time_table` VALUES ('6', 'T6', '12:00:00', '13:00:00', 'C', '03');
INSERT INTO `time_table` VALUES ('6', 'T6', '12:00:00', '13:00:00', 'C', '04');
INSERT INTO `time_table` VALUES ('6', 'T6', '12:00:00', '13:00:00', 'D', '01');
INSERT INTO `time_table` VALUES ('6', 'T6', '12:00:00', '13:00:00', 'D', '02');
INSERT INTO `time_table` VALUES ('6', 'T6', '12:00:00', '13:00:00', 'D', '03');
INSERT INTO `time_table` VALUES ('6', 'T6', '12:00:00', '13:00:00', 'D', '04');
INSERT INTO `time_table` VALUES ('7', 'T7', '13:00:00', '14:00:00', 'A', '01');
INSERT INTO `time_table` VALUES ('7', 'T7', '13:00:00', '14:00:00', 'A', '02');
INSERT INTO `time_table` VALUES ('7', 'T7', '13:00:00', '14:00:00', 'A', '03');
INSERT INTO `time_table` VALUES ('7', 'T7', '13:00:00', '14:00:00', 'A', '04');
INSERT INTO `time_table` VALUES ('7', 'T7', '13:00:00', '14:00:00', 'B', '01');
INSERT INTO `time_table` VALUES ('7', 'T7', '13:00:00', '14:00:00', 'B', '02');
INSERT INTO `time_table` VALUES ('7', 'T7', '13:00:00', '14:00:00', 'B', '03');
INSERT INTO `time_table` VALUES ('7', 'T7', '13:00:00', '14:00:00', 'B', '04');
INSERT INTO `time_table` VALUES ('7', 'T7', '13:00:00', '14:00:00', 'C', '01');
INSERT INTO `time_table` VALUES ('7', 'T7', '13:00:00', '14:00:00', 'C', '02');
INSERT INTO `time_table` VALUES ('7', 'T7', '13:00:00', '14:00:00', 'C', '03');
INSERT INTO `time_table` VALUES ('7', 'T7', '13:00:00', '14:00:00', 'C', '04');
INSERT INTO `time_table` VALUES ('7', 'T7', '13:00:00', '14:00:00', 'D', '01');
INSERT INTO `time_table` VALUES ('7', 'T7', '13:00:00', '14:00:00', 'D', '02');
INSERT INTO `time_table` VALUES ('7', 'T7', '13:00:00', '14:00:00', 'D', '03');
INSERT INTO `time_table` VALUES ('7', 'T7', '13:00:00', '14:00:00', 'D', '04');
INSERT INTO `time_table` VALUES ('8', 'T8', '14:00:00', '15:00:00', 'A', '01');
INSERT INTO `time_table` VALUES ('8', 'T8', '14:00:00', '15:00:00', 'A', '02');
INSERT INTO `time_table` VALUES ('8', 'T8', '14:00:00', '15:00:00', 'A', '03');
INSERT INTO `time_table` VALUES ('8', 'T8', '14:00:00', '15:00:00', 'A', '04');
INSERT INTO `time_table` VALUES ('8', 'T8', '14:00:00', '15:00:00', 'B', '01');
INSERT INTO `time_table` VALUES ('8', 'T8', '14:00:00', '15:00:00', 'B', '02');
INSERT INTO `time_table` VALUES ('8', 'T8', '14:00:00', '15:00:00', 'B', '03');
INSERT INTO `time_table` VALUES ('8', 'T8', '14:00:00', '15:00:00', 'B', '04');
INSERT INTO `time_table` VALUES ('8', 'T8', '14:00:00', '15:00:00', 'C', '01');
INSERT INTO `time_table` VALUES ('8', 'T8', '14:00:00', '15:00:00', 'C', '02');
INSERT INTO `time_table` VALUES ('8', 'T8', '14:00:00', '15:00:00', 'C', '03');
INSERT INTO `time_table` VALUES ('8', 'T8', '14:00:00', '15:00:00', 'C', '04');
INSERT INTO `time_table` VALUES ('8', 'T8', '14:00:00', '15:00:00', 'D', '01');
INSERT INTO `time_table` VALUES ('8', 'T8', '14:00:00', '15:00:00', 'D', '02');
INSERT INTO `time_table` VALUES ('8', 'T8', '14:00:00', '15:00:00', 'D', '03');
INSERT INTO `time_table` VALUES ('8', 'T8', '14:00:00', '15:00:00', 'D', '04');
INSERT INTO `time_table` VALUES ('9', 'T9', '15:00:00', '16:00:00', 'A', '01');
INSERT INTO `time_table` VALUES ('9', 'T9', '15:00:00', '16:00:00', 'A', '02');
INSERT INTO `time_table` VALUES ('9', 'T9', '15:00:00', '16:00:00', 'A', '03');
INSERT INTO `time_table` VALUES ('9', 'T9', '15:00:00', '16:00:00', 'A', '04');
INSERT INTO `time_table` VALUES ('9', 'T9', '15:00:00', '16:00:00', 'B', '01');
INSERT INTO `time_table` VALUES ('9', 'T9', '15:00:00', '16:00:00', 'B', '02');
INSERT INTO `time_table` VALUES ('9', 'T9', '15:00:00', '16:00:00', 'B', '03');
INSERT INTO `time_table` VALUES ('9', 'T9', '15:00:00', '16:00:00', 'B', '04');
INSERT INTO `time_table` VALUES ('9', 'T9', '15:00:00', '16:00:00', 'C', '01');
INSERT INTO `time_table` VALUES ('9', 'T9', '15:00:00', '16:00:00', 'C', '02');
INSERT INTO `time_table` VALUES ('9', 'T9', '15:00:00', '16:00:00', 'C', '03');
INSERT INTO `time_table` VALUES ('9', 'T9', '15:00:00', '16:00:00', 'C', '04');
INSERT INTO `time_table` VALUES ('9', 'T9', '15:00:00', '16:00:00', 'D', '01');
INSERT INTO `time_table` VALUES ('9', 'T9', '15:00:00', '16:00:00', 'D', '02');
INSERT INTO `time_table` VALUES ('9', 'T9', '15:00:00', '16:00:00', 'D', '03');
INSERT INTO `time_table` VALUES ('9', 'T9', '15:00:00', '16:00:00', 'D', '04');
INSERT INTO `time_table` VALUES ('10', 'T10', '16:00:00', '17:00:00', 'A', '01');
INSERT INTO `time_table` VALUES ('10', 'T10', '16:00:00', '17:00:00', 'A', '02');
INSERT INTO `time_table` VALUES ('10', 'T10', '16:00:00', '17:00:00', 'A', '03');
INSERT INTO `time_table` VALUES ('10', 'T10', '16:00:00', '17:00:00', 'A', '04');
INSERT INTO `time_table` VALUES ('10', 'T10', '16:00:00', '17:00:00', 'B', '01');
INSERT INTO `time_table` VALUES ('10', 'T10', '16:00:00', '17:00:00', 'B', '02');
INSERT INTO `time_table` VALUES ('10', 'T10', '16:00:00', '17:00:00', 'B', '03');
INSERT INTO `time_table` VALUES ('10', 'T10', '16:00:00', '17:00:00', 'B', '04');
INSERT INTO `time_table` VALUES ('10', 'T10', '16:00:00', '17:00:00', 'C', '01');
INSERT INTO `time_table` VALUES ('10', 'T10', '16:00:00', '17:00:00', 'C', '02');
INSERT INTO `time_table` VALUES ('10', 'T10', '16:00:00', '17:00:00', 'C', '03');
INSERT INTO `time_table` VALUES ('10', 'T10', '16:00:00', '17:00:00', 'C', '04');
INSERT INTO `time_table` VALUES ('10', 'T10', '16:00:00', '17:00:00', 'D', '01');
INSERT INTO `time_table` VALUES ('10', 'T10', '16:00:00', '17:00:00', 'D', '02');
INSERT INTO `time_table` VALUES ('10', 'T10', '16:00:00', '17:00:00', 'D', '03');
INSERT INTO `time_table` VALUES ('10', 'T10', '16:00:00', '17:00:00', 'D', '04');
INSERT INTO `time_table` VALUES ('11', 'T11', '17:00:00', '18:00:00', 'A', '01');
INSERT INTO `time_table` VALUES ('11', 'T11', '17:00:00', '18:00:00', 'A', '02');
INSERT INTO `time_table` VALUES ('11', 'T11', '17:00:00', '18:00:00', 'A', '03');
INSERT INTO `time_table` VALUES ('11', 'T11', '17:00:00', '18:00:00', 'A', '04');
INSERT INTO `time_table` VALUES ('11', 'T11', '17:00:00', '18:00:00', 'B', '01');
INSERT INTO `time_table` VALUES ('11', 'T11', '17:00:00', '18:00:00', 'B', '02');
INSERT INTO `time_table` VALUES ('11', 'T11', '17:00:00', '18:00:00', 'B', '03');
INSERT INTO `time_table` VALUES ('11', 'T11', '17:00:00', '18:00:00', 'B', '04');
INSERT INTO `time_table` VALUES ('11', 'T11', '17:00:00', '18:00:00', 'C', '01');
INSERT INTO `time_table` VALUES ('11', 'T11', '17:00:00', '18:00:00', 'C', '02');
INSERT INTO `time_table` VALUES ('11', 'T11', '17:00:00', '18:00:00', 'C', '03');
INSERT INTO `time_table` VALUES ('11', 'T11', '17:00:00', '18:00:00', 'C', '04');
INSERT INTO `time_table` VALUES ('11', 'T11', '17:00:00', '18:00:00', 'D', '01');
INSERT INTO `time_table` VALUES ('11', 'T11', '17:00:00', '18:00:00', 'D', '02');
INSERT INTO `time_table` VALUES ('11', 'T11', '17:00:00', '18:00:00', 'D', '03');
INSERT INTO `time_table` VALUES ('11', 'T11', '17:00:00', '18:00:00', 'D', '04');
INSERT INTO `time_table` VALUES ('12', 'T12', '18:00:00', '19:00:00', 'A', '01');
INSERT INTO `time_table` VALUES ('12', 'T12', '18:00:00', '19:00:00', 'A', '02');
INSERT INTO `time_table` VALUES ('12', 'T12', '18:00:00', '19:00:00', 'A', '03');
INSERT INTO `time_table` VALUES ('12', 'T12', '18:00:00', '19:00:00', 'A', '04');
INSERT INTO `time_table` VALUES ('12', 'T12', '18:00:00', '19:00:00', 'B', '01');
INSERT INTO `time_table` VALUES ('12', 'T12', '18:00:00', '19:00:00', 'B', '02');
INSERT INTO `time_table` VALUES ('12', 'T12', '18:00:00', '19:00:00', 'B', '03');
INSERT INTO `time_table` VALUES ('12', 'T12', '18:00:00', '19:00:00', 'B', '04');
INSERT INTO `time_table` VALUES ('12', 'T12', '18:00:00', '19:00:00', 'C', '01');
INSERT INTO `time_table` VALUES ('12', 'T12', '18:00:00', '19:00:00', 'C', '02');
INSERT INTO `time_table` VALUES ('12', 'T12', '18:00:00', '19:00:00', 'C', '03');
INSERT INTO `time_table` VALUES ('12', 'T12', '18:00:00', '19:00:00', 'C', '04');
INSERT INTO `time_table` VALUES ('12', 'T12', '18:00:00', '19:00:00', 'D', '01');
INSERT INTO `time_table` VALUES ('12', 'T12', '18:00:00', '19:00:00', 'D', '02');
INSERT INTO `time_table` VALUES ('12', 'T12', '18:00:00', '19:00:00', 'D', '03');
INSERT INTO `time_table` VALUES ('12', 'T12', '18:00:00', '19:00:00', 'D', '04');

SET FOREIGN_KEY_CHECKS = 1;
