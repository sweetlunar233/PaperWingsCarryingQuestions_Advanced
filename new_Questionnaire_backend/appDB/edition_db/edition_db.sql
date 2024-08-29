/*
 Navicat Premium Data Transfer

 Source Server         : paperplaneOld
 Source Server Type    : MySQL
 Source Server Version : 50718 (5.7.18-cynos-2.1.12-log)
 Source Host           : bj-cynosdbmysql-grp-g9kxigho.sql.tencentcdb.com:23531
 Source Schema         : edition_db

 Target Server Type    : MySQL
 Target Server Version : 50718 (5.7.18-cynos-2.1.12-log)
 File Encoding         : 65001

 Date: 28/08/2024 23:37:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------

drop database if exists edition_db;
create database edition_db;
use edition_db;

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add permission', 1, 'add_permission');
INSERT INTO `auth_permission` VALUES (2, 'Can change permission', 1, 'change_permission');
INSERT INTO `auth_permission` VALUES (3, 'Can delete permission', 1, 'delete_permission');
INSERT INTO `auth_permission` VALUES (4, 'Can view permission', 1, 'view_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can add group', 2, 'add_group');
INSERT INTO `auth_permission` VALUES (6, 'Can change group', 2, 'change_group');
INSERT INTO `auth_permission` VALUES (7, 'Can delete group', 2, 'delete_group');
INSERT INTO `auth_permission` VALUES (8, 'Can view group', 2, 'view_group');
INSERT INTO `auth_permission` VALUES (9, 'Can add user', 3, 'add_user');
INSERT INTO `auth_permission` VALUES (10, 'Can change user', 3, 'change_user');
INSERT INTO `auth_permission` VALUES (11, 'Can delete user', 3, 'delete_user');
INSERT INTO `auth_permission` VALUES (12, 'Can view user', 3, 'view_user');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add blank question', 6, 'add_blankquestion');
INSERT INTO `auth_permission` VALUES (22, 'Can change blank question', 6, 'change_blankquestion');
INSERT INTO `auth_permission` VALUES (23, 'Can delete blank question', 6, 'delete_blankquestion');
INSERT INTO `auth_permission` VALUES (24, 'Can view blank question', 6, 'view_blankquestion');
INSERT INTO `auth_permission` VALUES (25, 'Can add choice question', 7, 'add_choicequestion');
INSERT INTO `auth_permission` VALUES (26, 'Can change choice question', 7, 'change_choicequestion');
INSERT INTO `auth_permission` VALUES (27, 'Can delete choice question', 7, 'delete_choicequestion');
INSERT INTO `auth_permission` VALUES (28, 'Can view choice question', 7, 'view_choicequestion');
INSERT INTO `auth_permission` VALUES (29, 'Can add other option', 8, 'add_otheroption');
INSERT INTO `auth_permission` VALUES (30, 'Can change other option', 8, 'change_otheroption');
INSERT INTO `auth_permission` VALUES (31, 'Can delete other option', 8, 'delete_otheroption');
INSERT INTO `auth_permission` VALUES (32, 'Can view other option', 8, 'view_otheroption');
INSERT INTO `auth_permission` VALUES (33, 'Can add rating question', 9, 'add_ratingquestion');
INSERT INTO `auth_permission` VALUES (34, 'Can change rating question', 9, 'change_ratingquestion');
INSERT INTO `auth_permission` VALUES (35, 'Can delete rating question', 9, 'delete_ratingquestion');
INSERT INTO `auth_permission` VALUES (36, 'Can view rating question', 9, 'view_ratingquestion');
INSERT INTO `auth_permission` VALUES (37, 'Can add submission', 10, 'add_submission');
INSERT INTO `auth_permission` VALUES (38, 'Can change submission', 10, 'change_submission');
INSERT INTO `auth_permission` VALUES (39, 'Can delete submission', 10, 'delete_submission');
INSERT INTO `auth_permission` VALUES (40, 'Can view submission', 10, 'view_submission');
INSERT INTO `auth_permission` VALUES (41, 'Can add rating answer', 11, 'add_ratinganswer');
INSERT INTO `auth_permission` VALUES (42, 'Can change rating answer', 11, 'change_ratinganswer');
INSERT INTO `auth_permission` VALUES (43, 'Can delete rating answer', 11, 'delete_ratinganswer');
INSERT INTO `auth_permission` VALUES (44, 'Can view rating answer', 11, 'view_ratinganswer');
INSERT INTO `auth_permission` VALUES (45, 'Can add choice option', 12, 'add_choiceoption');
INSERT INTO `auth_permission` VALUES (46, 'Can change choice option', 12, 'change_choiceoption');
INSERT INTO `auth_permission` VALUES (47, 'Can delete choice option', 12, 'delete_choiceoption');
INSERT INTO `auth_permission` VALUES (48, 'Can view choice option', 12, 'view_choiceoption');
INSERT INTO `auth_permission` VALUES (49, 'Can add choice answer', 13, 'add_choiceanswer');
INSERT INTO `auth_permission` VALUES (50, 'Can change choice answer', 13, 'change_choiceanswer');
INSERT INTO `auth_permission` VALUES (51, 'Can delete choice answer', 13, 'delete_choiceanswer');
INSERT INTO `auth_permission` VALUES (52, 'Can view choice answer', 13, 'view_choiceanswer');
INSERT INTO `auth_permission` VALUES (53, 'Can add blank answer', 14, 'add_blankanswer');
INSERT INTO `auth_permission` VALUES (54, 'Can change blank answer', 14, 'change_blankanswer');
INSERT INTO `auth_permission` VALUES (55, 'Can delete blank answer', 14, 'delete_blankanswer');
INSERT INTO `auth_permission` VALUES (56, 'Can view blank answer', 14, 'view_blankanswer');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (2, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (1, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (14, 'edition_project', 'blankanswer');
INSERT INTO `django_content_type` VALUES (6, 'edition_project', 'blankquestion');
INSERT INTO `django_content_type` VALUES (13, 'edition_project', 'choiceanswer');
INSERT INTO `django_content_type` VALUES (12, 'edition_project', 'choiceoption');
INSERT INTO `django_content_type` VALUES (7, 'edition_project', 'choicequestion');
INSERT INTO `django_content_type` VALUES (8, 'edition_project', 'otheroption');
INSERT INTO `django_content_type` VALUES (11, 'edition_project', 'ratinganswer');
INSERT INTO `django_content_type` VALUES (9, 'edition_project', 'ratingquestion');
INSERT INTO `django_content_type` VALUES (10, 'edition_project', 'submission');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2024-08-28 14:20:21.736003');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2024-08-28 14:20:21.799590');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2024-08-28 14:20:22.197630');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2024-08-28 14:20:22.229627');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2024-08-28 14:20:22.260395');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2024-08-28 14:20:22.277749');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2024-08-28 14:20:22.307696');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2024-08-28 14:20:22.322169');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2024-08-28 14:20:22.339765');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2024-08-28 14:20:22.370416');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2024-08-28 14:20:22.401487');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2024-08-28 14:20:22.433672');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2024-08-28 14:20:22.470880');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2024-08-28 14:20:22.502047');
INSERT INTO `django_migrations` VALUES (15, 'edition_project', '0001_initial', '2024-08-28 14:20:23.110783');
INSERT INTO `django_migrations` VALUES (16, 'edition_project', '0002_auto_20240826_0356', '2024-08-28 14:20:23.300536');
INSERT INTO `django_migrations` VALUES (17, 'edition_project', '0003_alter_submission_submissiontime', '2024-08-28 14:20:23.329474');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2024-08-28 14:20:23.384955');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for edition_project_blankanswer
-- ----------------------------
DROP TABLE IF EXISTS `edition_project_blankanswer`;
CREATE TABLE `edition_project_blankanswer`  (
  `AnswerID` int(11) NOT NULL AUTO_INCREMENT,
  `Content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Question_id` int(11) NOT NULL,
  `Submission_id` int(11) NOT NULL,
  PRIMARY KEY (`AnswerID`) USING BTREE,
  INDEX `edition_project_blan_Question_id_951d3c6b_fk_edition_p`(`Question_id`) USING BTREE,
  INDEX `edition_project_blan_Submission_id_1fce22a1_fk_edition_p`(`Submission_id`) USING BTREE,
  CONSTRAINT `edition_project_blan_Question_id_951d3c6b_fk_edition_p` FOREIGN KEY (`Question_id`) REFERENCES `edition_project_blankquestion` (`QuestionID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `edition_project_blan_Submission_id_1fce22a1_fk_edition_p` FOREIGN KEY (`Submission_id`) REFERENCES `edition_project_submission` (`SubmissionID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edition_project_blankanswer
-- ----------------------------
INSERT INTO `edition_project_blankanswer` VALUES (2, '111', 1, 1);
INSERT INTO `edition_project_blankanswer` VALUES (4, '1', 2, 2);
INSERT INTO `edition_project_blankanswer` VALUES (6, '1111', 3, 3);
INSERT INTO `edition_project_blankanswer` VALUES (7, '2', 4, 4);
INSERT INTO `edition_project_blankanswer` VALUES (8, '1', 5, 5);
INSERT INTO `edition_project_blankanswer` VALUES (9, '文柳懿', 6, 11);

-- ----------------------------
-- Table structure for edition_project_blankquestion
-- ----------------------------
DROP TABLE IF EXISTS `edition_project_blankquestion`;
CREATE TABLE `edition_project_blankquestion`  (
  `QuestionID` int(11) NOT NULL AUTO_INCREMENT,
  `SurveyID` int(11) NOT NULL,
  `Text` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IsRequired` tinyint(1) NOT NULL,
  `QuestionNumber` int(11) NOT NULL,
  `Score` int(11) NULL DEFAULT NULL,
  `Category` int(11) NOT NULL,
  `CorrectAnswer` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`QuestionID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edition_project_blankquestion
-- ----------------------------
INSERT INTO `edition_project_blankquestion` VALUES (1, 1, '请填空', 1, 4, 0, 3, '');
INSERT INTO `edition_project_blankquestion` VALUES (2, 2, '请填空', 1, 4, 0, 3, '');
INSERT INTO `edition_project_blankquestion` VALUES (3, 3, '请填空', 1, 4, 0, 3, '');
INSERT INTO `edition_project_blankquestion` VALUES (4, 4, '请填空', 1, 3, 4, 3, '1');
INSERT INTO `edition_project_blankquestion` VALUES (5, 5, '请填空', 1, 3, 4, 3, '1');
INSERT INTO `edition_project_blankquestion` VALUES (6, 14, '名字', 1, 1, 0, 3, '');

-- ----------------------------
-- Table structure for edition_project_choiceanswer
-- ----------------------------
DROP TABLE IF EXISTS `edition_project_choiceanswer`;
CREATE TABLE `edition_project_choiceanswer`  (
  `AnswerID` int(11) NOT NULL AUTO_INCREMENT,
  `ChoiceOptions_id` int(11) NOT NULL,
  `Question_id` int(11) NOT NULL,
  `Submission_id` int(11) NOT NULL,
  PRIMARY KEY (`AnswerID`) USING BTREE,
  INDEX `edition_project_choi_ChoiceOptions_id_1d520b29_fk_edition_p`(`ChoiceOptions_id`) USING BTREE,
  INDEX `edition_project_choi_Question_id_9d612cc0_fk_edition_p`(`Question_id`) USING BTREE,
  INDEX `edition_project_choi_Submission_id_77129ffa_fk_edition_p`(`Submission_id`) USING BTREE,
  CONSTRAINT `edition_project_choi_ChoiceOptions_id_1d520b29_fk_edition_p` FOREIGN KEY (`ChoiceOptions_id`) REFERENCES `edition_project_choiceoption` (`OptionID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `edition_project_choi_Question_id_9d612cc0_fk_edition_p` FOREIGN KEY (`Question_id`) REFERENCES `edition_project_choicequestion` (`QuestionID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `edition_project_choi_Submission_id_77129ffa_fk_edition_p` FOREIGN KEY (`Submission_id`) REFERENCES `edition_project_submission` (`SubmissionID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edition_project_choiceanswer
-- ----------------------------
INSERT INTO `edition_project_choiceanswer` VALUES (3, 1, 1, 1);
INSERT INTO `edition_project_choiceanswer` VALUES (4, 2, 2, 1);
INSERT INTO `edition_project_choiceanswer` VALUES (7, 3, 3, 2);
INSERT INTO `edition_project_choiceanswer` VALUES (8, 4, 4, 2);
INSERT INTO `edition_project_choiceanswer` VALUES (11, 5, 5, 3);
INSERT INTO `edition_project_choiceanswer` VALUES (12, 6, 6, 3);
INSERT INTO `edition_project_choiceanswer` VALUES (13, 8, 7, 4);
INSERT INTO `edition_project_choiceanswer` VALUES (14, 12, 8, 4);
INSERT INTO `edition_project_choiceanswer` VALUES (15, 16, 10, 5);
INSERT INTO `edition_project_choiceanswer` VALUES (16, 17, 10, 5);
INSERT INTO `edition_project_choiceanswer` VALUES (17, 13, 9, 5);
INSERT INTO `edition_project_choiceanswer` VALUES (20, 20, 11, 6);
INSERT INTO `edition_project_choiceanswer` VALUES (21, 21, 12, 6);
INSERT INTO `edition_project_choiceanswer` VALUES (22, 23, 14, 7);
INSERT INTO `edition_project_choiceanswer` VALUES (23, 90, 35, 9);
INSERT INTO `edition_project_choiceanswer` VALUES (24, 86, 34, 9);
INSERT INTO `edition_project_choiceanswer` VALUES (25, 102, 38, 9);
INSERT INTO `edition_project_choiceanswer` VALUES (26, 109, 40, 9);
INSERT INTO `edition_project_choiceanswer` VALUES (27, 81, 33, 9);
INSERT INTO `edition_project_choiceanswer` VALUES (28, 94, 36, 9);
INSERT INTO `edition_project_choiceanswer` VALUES (29, 95, 37, 9);
INSERT INTO `edition_project_choiceanswer` VALUES (30, 75, 32, 9);
INSERT INTO `edition_project_choiceanswer` VALUES (31, 106, 39, 9);
INSERT INTO `edition_project_choiceanswer` VALUES (32, 113, 41, 9);
INSERT INTO `edition_project_choiceanswer` VALUES (33, 31, 21, 11);
INSERT INTO `edition_project_choiceanswer` VALUES (34, 33, 21, 11);
INSERT INTO `edition_project_choiceanswer` VALUES (35, 32, 21, 11);
INSERT INTO `edition_project_choiceanswer` VALUES (36, 110, 40, 10);
INSERT INTO `edition_project_choiceanswer` VALUES (37, 96, 37, 10);
INSERT INTO `edition_project_choiceanswer` VALUES (38, 86, 34, 10);
INSERT INTO `edition_project_choiceanswer` VALUES (39, 94, 36, 10);
INSERT INTO `edition_project_choiceanswer` VALUES (40, 90, 35, 10);
INSERT INTO `edition_project_choiceanswer` VALUES (41, 113, 41, 10);
INSERT INTO `edition_project_choiceanswer` VALUES (42, 102, 38, 10);
INSERT INTO `edition_project_choiceanswer` VALUES (43, 105, 39, 10);
INSERT INTO `edition_project_choiceanswer` VALUES (44, 81, 33, 10);
INSERT INTO `edition_project_choiceanswer` VALUES (45, 75, 32, 10);
INSERT INTO `edition_project_choiceanswer` VALUES (46, 116, 42, 12);
INSERT INTO `edition_project_choiceanswer` VALUES (47, 116, 42, 13);

-- ----------------------------
-- Table structure for edition_project_choiceoption
-- ----------------------------
DROP TABLE IF EXISTS `edition_project_choiceoption`;
CREATE TABLE `edition_project_choiceoption`  (
  `OptionID` int(11) NOT NULL AUTO_INCREMENT,
  `Text` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IsCorrect` tinyint(1) NULL DEFAULT NULL,
  `OptionNumber` int(11) NOT NULL,
  `MaxSelectablePeople` int(11) NOT NULL,
  `Question_id` int(11) NOT NULL,
  PRIMARY KEY (`OptionID`) USING BTREE,
  INDEX `edition_project_choi_Question_id_c3613666_fk_edition_p`(`Question_id`) USING BTREE,
  CONSTRAINT `edition_project_choi_Question_id_c3613666_fk_edition_p` FOREIGN KEY (`Question_id`) REFERENCES `edition_project_choicequestion` (`QuestionID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edition_project_choiceoption
-- ----------------------------
INSERT INTO `edition_project_choiceoption` VALUES (1, '选项', 0, 1, -1, 1);
INSERT INTO `edition_project_choiceoption` VALUES (2, '选项', 0, 1, -1, 2);
INSERT INTO `edition_project_choiceoption` VALUES (3, '选项', 0, 1, -1, 3);
INSERT INTO `edition_project_choiceoption` VALUES (4, '选项', 0, 1, -1, 4);
INSERT INTO `edition_project_choiceoption` VALUES (5, '选项', 0, 1, 0, 5);
INSERT INTO `edition_project_choiceoption` VALUES (6, '选项', 0, 1, 0, 6);
INSERT INTO `edition_project_choiceoption` VALUES (7, '选项', 1, 1, -1, 7);
INSERT INTO `edition_project_choiceoption` VALUES (8, '选项', 0, 2, -1, 7);
INSERT INTO `edition_project_choiceoption` VALUES (9, '选项', 0, 3, -1, 7);
INSERT INTO `edition_project_choiceoption` VALUES (10, '选项', 1, 1, -1, 8);
INSERT INTO `edition_project_choiceoption` VALUES (11, '选项', 0, 2, -1, 8);
INSERT INTO `edition_project_choiceoption` VALUES (12, '选项', 0, 3, -1, 8);
INSERT INTO `edition_project_choiceoption` VALUES (13, '1', 1, 1, -1, 9);
INSERT INTO `edition_project_choiceoption` VALUES (14, '2', 0, 2, -1, 9);
INSERT INTO `edition_project_choiceoption` VALUES (15, '3', 0, 3, -1, 9);
INSERT INTO `edition_project_choiceoption` VALUES (16, '1', 1, 1, -1, 10);
INSERT INTO `edition_project_choiceoption` VALUES (17, '2', 1, 2, -1, 10);
INSERT INTO `edition_project_choiceoption` VALUES (18, '3', 0, 3, -1, 10);
INSERT INTO `edition_project_choiceoption` VALUES (19, '4', 0, 4, -1, 10);
INSERT INTO `edition_project_choiceoption` VALUES (20, '选项', 0, 1, -1, 11);
INSERT INTO `edition_project_choiceoption` VALUES (21, '选项', 0, 1, -1, 12);
INSERT INTO `edition_project_choiceoption` VALUES (23, '选项', 0, 1, -1, 14);
INSERT INTO `edition_project_choiceoption` VALUES (24, 'yes', 0, 1, -1, 15);
INSERT INTO `edition_project_choiceoption` VALUES (25, 'yes', 0, 1, -1, 16);
INSERT INTO `edition_project_choiceoption` VALUES (26, 'yes', 0, 1, -1, 17);
INSERT INTO `edition_project_choiceoption` VALUES (27, 'yes', 0, 1, 1, 18);
INSERT INTO `edition_project_choiceoption` VALUES (28, 'yes', 0, 1, -1, 19);
INSERT INTO `edition_project_choiceoption` VALUES (29, 'yes', 0, 1, -1, 20);
INSERT INTO `edition_project_choiceoption` VALUES (30, '山杖', 0, 1, 1, 21);
INSERT INTO `edition_project_choiceoption` VALUES (31, '头灯', 0, 2, 0, 21);
INSERT INTO `edition_project_choiceoption` VALUES (32, '帐篷', 0, 3, 0, 21);
INSERT INTO `edition_project_choiceoption` VALUES (33, '大包', 0, 4, 0, 21);
INSERT INTO `edition_project_choiceoption` VALUES (75, '三片叶子', 1, 1, -1, 32);
INSERT INTO `edition_project_choiceoption` VALUES (76, '四片叶子', 0, 2, -1, 32);
INSERT INTO `edition_project_choiceoption` VALUES (77, '五片叶子', 0, 3, -1, 32);
INSERT INTO `edition_project_choiceoption` VALUES (78, '七片叶子', 0, 4, -1, 32);
INSERT INTO `edition_project_choiceoption` VALUES (79, '拨打110', 0, 1, -1, 33);
INSERT INTO `edition_project_choiceoption` VALUES (80, '寻找庇护所', 0, 2, -1, 33);
INSERT INTO `edition_project_choiceoption` VALUES (81, '立即停止移动', 1, 3, -1, 33);
INSERT INTO `edition_project_choiceoption` VALUES (82, '启动信号火', 0, 4, -1, 33);
INSERT INTO `edition_project_choiceoption` VALUES (83, '3周', 0, 1, -1, 34);
INSERT INTO `edition_project_choiceoption` VALUES (84, '3小时', 0, 2, -1, 34);
INSERT INTO `edition_project_choiceoption` VALUES (85, '3分钟', 0, 3, -1, 34);
INSERT INTO `edition_project_choiceoption` VALUES (86, '3天', 1, 4, -1, 34);
INSERT INTO `edition_project_choiceoption` VALUES (87, '上午', 0, 1, -1, 35);
INSERT INTO `edition_project_choiceoption` VALUES (88, '中午', 0, 2, -1, 35);
INSERT INTO `edition_project_choiceoption` VALUES (89, '下午', 0, 3, -1, 35);
INSERT INTO `edition_project_choiceoption` VALUES (90, '晚上', 1, 4, -1, 35);
INSERT INTO `edition_project_choiceoption` VALUES (91, '反击', 0, 1, -1, 36);
INSERT INTO `edition_project_choiceoption` VALUES (92, '对着熊吼叫', 0, 2, -1, 36);
INSERT INTO `edition_project_choiceoption` VALUES (93, '给它食物', 0, 3, -1, 36);
INSERT INTO `edition_project_choiceoption` VALUES (94, '装死', 1, 4, -1, 36);
INSERT INTO `edition_project_choiceoption` VALUES (95, '保暖', 1, 1, -1, 37);
INSERT INTO `edition_project_choiceoption` VALUES (96, '防晒', 1, 2, -1, 37);
INSERT INTO `edition_project_choiceoption` VALUES (97, '防风沙', 1, 3, -1, 37);
INSERT INTO `edition_project_choiceoption` VALUES (98, '防水', 0, 4, -1, 37);
INSERT INTO `edition_project_choiceoption` VALUES (99, '防冷', 0, 5, -1, 37);
INSERT INTO `edition_project_choiceoption` VALUES (100, '来自瀑布的水', 0, 1, -1, 38);
INSERT INTO `edition_project_choiceoption` VALUES (101, '水坑里的水', 0, 2, -1, 38);
INSERT INTO `edition_project_choiceoption` VALUES (102, '雨水', 1, 3, -1, 38);
INSERT INTO `edition_project_choiceoption` VALUES (103, '来自池塘的水', 0, 4, -1, 38);
INSERT INTO `edition_project_choiceoption` VALUES (104, '背包过重', 0, 1, -1, 39);
INSERT INTO `edition_project_choiceoption` VALUES (105, '冷水泡脚', 0, 2, -1, 39);
INSERT INTO `edition_project_choiceoption` VALUES (106, '穿棉袜', 1, 3, -1, 39);
INSERT INTO `edition_project_choiceoption` VALUES (107, '买大一码鞋', 0, 4, -1, 39);
INSERT INTO `edition_project_choiceoption` VALUES (108, '肥皂水', 0, 1, -1, 40);
INSERT INTO `edition_project_choiceoption` VALUES (109, '酒精', 0, 2, -1, 40);
INSERT INTO `edition_project_choiceoption` VALUES (110, '清水', 0, 3, -1, 40);
INSERT INTO `edition_project_choiceoption` VALUES (111, '盐水', 1, 4, -1, 40);
INSERT INTO `edition_project_choiceoption` VALUES (112, '正方形', 0, 1, -1, 41);
INSERT INTO `edition_project_choiceoption` VALUES (113, '三角形', 0, 2, -1, 41);
INSERT INTO `edition_project_choiceoption` VALUES (114, '圆形', 0, 3, -1, 41);
INSERT INTO `edition_project_choiceoption` VALUES (115, 'X形', 1, 4, -1, 41);
INSERT INTO `edition_project_choiceoption` VALUES (116, '是', 0, 1, -1, 42);
INSERT INTO `edition_project_choiceoption` VALUES (117, '不是', 0, 2, -1, 42);

-- ----------------------------
-- Table structure for edition_project_choicequestion
-- ----------------------------
DROP TABLE IF EXISTS `edition_project_choicequestion`;
CREATE TABLE `edition_project_choicequestion`  (
  `QuestionID` int(11) NOT NULL AUTO_INCREMENT,
  `SurveyID` int(11) NOT NULL,
  `Text` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IsRequired` tinyint(1) NOT NULL,
  `QuestionNumber` int(11) NOT NULL,
  `Score` int(11) NULL DEFAULT NULL,
  `Category` int(11) NOT NULL,
  `MaxSelectable` int(11) NULL DEFAULT NULL,
  `OptionCnt` int(11) NOT NULL,
  PRIMARY KEY (`QuestionID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edition_project_choicequestion
-- ----------------------------
INSERT INTO `edition_project_choicequestion` VALUES (1, 1, '请选择一个选项', 1, 1, 0, 1, 1, 1);
INSERT INTO `edition_project_choicequestion` VALUES (2, 1, '请选择以下选项（多选）', 1, 2, 0, 2, 1, 1);
INSERT INTO `edition_project_choicequestion` VALUES (3, 2, '请选择一个选项', 1, 1, 0, 1, 1, 1);
INSERT INTO `edition_project_choicequestion` VALUES (4, 2, '请选择以下选项（多选）', 1, 2, 0, 2, 1, 1);
INSERT INTO `edition_project_choicequestion` VALUES (5, 3, '请选择一个选项', 1, 1, 0, 1, 1, 1);
INSERT INTO `edition_project_choicequestion` VALUES (6, 3, '请选择以下选项（多选）', 1, 2, 0, 2, 1, 1);
INSERT INTO `edition_project_choicequestion` VALUES (7, 4, '请选择一个选项', 1, 1, 1, 1, 1, 3);
INSERT INTO `edition_project_choicequestion` VALUES (8, 4, '请选择以下选项（多选）', 1, 2, 2, 2, 1, 3);
INSERT INTO `edition_project_choicequestion` VALUES (9, 5, '请选择一个选项', 1, 1, 1, 1, 1, 3);
INSERT INTO `edition_project_choicequestion` VALUES (10, 5, '请选择以下选项（多选）', 1, 2, 2, 2, 2, 4);
INSERT INTO `edition_project_choicequestion` VALUES (11, 6, '请选择一个选项', 1, 1, 0, 1, 1, 1);
INSERT INTO `edition_project_choicequestion` VALUES (12, 6, '请选择一个选项', 1, 2, 0, 1, 1, 1);
INSERT INTO `edition_project_choicequestion` VALUES (14, 7, '请选择一个选项', 1, 1, 0, 1, 1, 1);
INSERT INTO `edition_project_choicequestion` VALUES (15, 8, '这是MBTI测试模板', 1, 1, 0, 1, 1, 1);
INSERT INTO `edition_project_choicequestion` VALUES (16, 9, '这是动物领养调查问卷模板', 1, 1, 0, 1, 1, 1);
INSERT INTO `edition_project_choicequestion` VALUES (17, 10, '这是市场情况调研问卷', 1, 1, 0, 1, 1, 1);
INSERT INTO `edition_project_choicequestion` VALUES (18, 11, '这是暑期课程学生报名表', 1, 1, 0, 1, 1, 1);
INSERT INTO `edition_project_choicequestion` VALUES (19, 12, '这是年度社区活动提案投票', 1, 1, 0, 1, 1, 1);
INSERT INTO `edition_project_choicequestion` VALUES (20, 13, '这是2024年综合知识测试模板', 1, 1, 0, 1, 1, 1);
INSERT INTO `edition_project_choicequestion` VALUES (21, 14, '需要租什么装备', 1, 2, 0, 2, 4, 4);
INSERT INTO `edition_project_choicequestion` VALUES (32, 16, '为了避免接触到独藤，在荒野中你需要远离它，一般毒藤有几片叶子？', 1, 1, 1, 1, 1, 4);
INSERT INTO `edition_project_choicequestion` VALUES (33, 16, '你独自徒步旅行，突然意识到自己迷路了，你应该做的第一件事是什么？', 1, 2, 1, 1, 1, 4);
INSERT INTO `edition_project_choicequestion` VALUES (34, 16, '根据生存三法则，没有水你能活多久？', 1, 3, 1, 1, 1, 4);
INSERT INTO `edition_project_choicequestion` VALUES (35, 16, '当你试图逃离沙漠生存环境时，你应该选择在一天中的什么时间？', 1, 4, 1, 1, 1, 4);
INSERT INTO `edition_project_choicequestion` VALUES (36, 16, '当你正在露营时，一只灰熊决定攻击你，这时你应该怎么做？', 1, 5, 1, 1, 1, 4);
INSERT INTO `edition_project_choicequestion` VALUES (37, 16, '头巾的作用（多选）', 1, 6, 2, 2, 1, 5);
INSERT INTO `edition_project_choicequestion` VALUES (38, 16, '在寻找水的时候，什么水不需要烧开就可以直接饮用？', 1, 7, 1, 1, 1, 4);
INSERT INTO `edition_project_choicequestion` VALUES (39, 16, '哪一件事最容易引起水泡？', 1, 8, 1, 1, 1, 4);
INSERT INTO `edition_project_choicequestion` VALUES (40, 16, '在野外活动被蜈蚣等蠹虫咬伤，应该立即用什么冲洗伤口？', 1, 9, 1, 1, 1, 4);
INSERT INTO `edition_project_choicequestion` VALUES (41, 16, '为了向空中的救援人员发出信号，你应该用岩石、树枝或其他可用材料制作哪个图案？', 1, 10, 1, 1, 1, 4);
INSERT INTO `edition_project_choicequestion` VALUES (42, 17, '请选择', 1, 1, 0, 1, 1, 2);

-- ----------------------------
-- Table structure for edition_project_otheroption
-- ----------------------------
DROP TABLE IF EXISTS `edition_project_otheroption`;
CREATE TABLE `edition_project_otheroption`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `IsRequired` tinyint(1) NOT NULL,
  `Text` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edition_project_otheroption
-- ----------------------------

-- ----------------------------
-- Table structure for edition_project_ratinganswer
-- ----------------------------
DROP TABLE IF EXISTS `edition_project_ratinganswer`;
CREATE TABLE `edition_project_ratinganswer`  (
  `AnswerID` int(11) NOT NULL AUTO_INCREMENT,
  `Rate` int(11) NULL DEFAULT NULL,
  `Question_id` int(11) NOT NULL,
  `Submission_id` int(11) NOT NULL,
  PRIMARY KEY (`AnswerID`) USING BTREE,
  INDEX `edition_project_rati_Question_id_69552d93_fk_edition_p`(`Question_id`) USING BTREE,
  INDEX `edition_project_rati_Submission_id_2e594e09_fk_edition_p`(`Submission_id`) USING BTREE,
  CONSTRAINT `edition_project_rati_Question_id_69552d93_fk_edition_p` FOREIGN KEY (`Question_id`) REFERENCES `edition_project_ratingquestion` (`QuestionID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `edition_project_rati_Submission_id_2e594e09_fk_edition_p` FOREIGN KEY (`Submission_id`) REFERENCES `edition_project_submission` (`SubmissionID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edition_project_ratinganswer
-- ----------------------------
INSERT INTO `edition_project_ratinganswer` VALUES (2, 2, 1, 1);
INSERT INTO `edition_project_ratinganswer` VALUES (4, 3, 2, 2);
INSERT INTO `edition_project_ratinganswer` VALUES (6, 3, 3, 3);
INSERT INTO `edition_project_ratinganswer` VALUES (7, 5, 4, 11);

-- ----------------------------
-- Table structure for edition_project_ratingquestion
-- ----------------------------
DROP TABLE IF EXISTS `edition_project_ratingquestion`;
CREATE TABLE `edition_project_ratingquestion`  (
  `QuestionID` int(11) NOT NULL AUTO_INCREMENT,
  `SurveyID` int(11) NOT NULL,
  `Text` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IsRequired` tinyint(1) NOT NULL,
  `QuestionNumber` int(11) NOT NULL,
  `Score` int(11) NULL DEFAULT NULL,
  `Category` int(11) NOT NULL,
  `MinRating` int(11) NULL DEFAULT NULL,
  `MinText` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `MaxRating` int(11) NULL DEFAULT NULL,
  `MaxText` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`QuestionID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edition_project_ratingquestion
-- ----------------------------
INSERT INTO `edition_project_ratingquestion` VALUES (1, 1, '请评分', 1, 3, 0, 4, 1, NULL, 5, NULL);
INSERT INTO `edition_project_ratingquestion` VALUES (2, 2, '请评分', 1, 3, 0, 4, 1, NULL, 5, NULL);
INSERT INTO `edition_project_ratingquestion` VALUES (3, 3, '请评分', 1, 3, 0, 4, 1, NULL, 5, NULL);
INSERT INTO `edition_project_ratingquestion` VALUES (4, 14, '你喜欢凌峰吗', 1, 3, 0, 4, 1, NULL, 5, NULL);

-- ----------------------------
-- Table structure for edition_project_submission
-- ----------------------------
DROP TABLE IF EXISTS `edition_project_submission`;
CREATE TABLE `edition_project_submission`  (
  `SubmissionID` int(11) NOT NULL AUTO_INCREMENT,
  `SurveyID` int(11) NOT NULL,
  `RespondentID` int(11) NOT NULL,
  `SubmissionTime` datetime(6) NULL DEFAULT NULL,
  `Status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Score` int(11) NULL DEFAULT NULL,
  `Interval` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`SubmissionID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edition_project_submission
-- ----------------------------
INSERT INTO `edition_project_submission` VALUES (1, 1, 1, '2024-08-28 14:23:24.452199', 'Submitted', 0, 0);
INSERT INTO `edition_project_submission` VALUES (2, 2, 1, '2024-08-28 14:26:42.452995', 'Submitted', 0, 0);
INSERT INTO `edition_project_submission` VALUES (3, 3, 1, '2024-08-28 14:27:20.570674', 'Submitted', 0, 0);
INSERT INTO `edition_project_submission` VALUES (4, 4, 1, '2024-08-28 14:28:44.883843', 'Graded', 0, 21);
INSERT INTO `edition_project_submission` VALUES (5, 5, 1, '2024-08-28 14:30:59.468173', 'Graded', 7, 26);
INSERT INTO `edition_project_submission` VALUES (6, 6, 1, '2024-08-28 14:31:41.227350', 'Unsubmitted', 0, 15);
INSERT INTO `edition_project_submission` VALUES (7, 7, 1, '2024-08-28 14:34:26.968468', 'Submitted', 0, 0);
INSERT INTO `edition_project_submission` VALUES (8, 14, 1, NULL, 'Unsubmitted', NULL, 0);
INSERT INTO `edition_project_submission` VALUES (9, 16, 4, '2024-08-28 15:13:41.835717', 'Graded', 7, 39);
INSERT INTO `edition_project_submission` VALUES (10, 16, 4, '2024-08-28 15:16:44.125881', 'Graded', 6, 46);
INSERT INTO `edition_project_submission` VALUES (11, 14, 4, '2024-08-28 15:15:24.279818', 'Submitted', 0, 0);
INSERT INTO `edition_project_submission` VALUES (12, 17, 1, '2024-08-28 15:23:05.021085', 'Submitted', 0, 0);
INSERT INTO `edition_project_submission` VALUES (13, 17, 1, '2024-08-28 15:25:53.353933', 'Unsubmitted', 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
