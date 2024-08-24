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

 Date: 24/08/2024 15:34:56
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
INSERT INTO `auth_permission` VALUES (21, 'Can add other option', 6, 'add_otheroption');
INSERT INTO `auth_permission` VALUES (22, 'Can change other option', 6, 'change_otheroption');
INSERT INTO `auth_permission` VALUES (23, 'Can delete other option', 6, 'delete_otheroption');
INSERT INTO `auth_permission` VALUES (24, 'Can view other option', 6, 'view_otheroption');
INSERT INTO `auth_permission` VALUES (25, 'Can add submission', 7, 'add_submission');
INSERT INTO `auth_permission` VALUES (26, 'Can change submission', 7, 'change_submission');
INSERT INTO `auth_permission` VALUES (27, 'Can delete submission', 7, 'delete_submission');
INSERT INTO `auth_permission` VALUES (28, 'Can view submission', 7, 'view_submission');
INSERT INTO `auth_permission` VALUES (29, 'Can add rating question', 8, 'add_ratingquestion');
INSERT INTO `auth_permission` VALUES (30, 'Can change rating question', 8, 'change_ratingquestion');
INSERT INTO `auth_permission` VALUES (31, 'Can delete rating question', 8, 'delete_ratingquestion');
INSERT INTO `auth_permission` VALUES (32, 'Can view rating question', 8, 'view_ratingquestion');
INSERT INTO `auth_permission` VALUES (33, 'Can add choice option', 9, 'add_choiceoption');
INSERT INTO `auth_permission` VALUES (34, 'Can change choice option', 9, 'change_choiceoption');
INSERT INTO `auth_permission` VALUES (35, 'Can delete choice option', 9, 'delete_choiceoption');
INSERT INTO `auth_permission` VALUES (36, 'Can view choice option', 9, 'view_choiceoption');
INSERT INTO `auth_permission` VALUES (37, 'Can add blank answer', 10, 'add_blankanswer');
INSERT INTO `auth_permission` VALUES (38, 'Can change blank answer', 10, 'change_blankanswer');
INSERT INTO `auth_permission` VALUES (39, 'Can delete blank answer', 10, 'delete_blankanswer');
INSERT INTO `auth_permission` VALUES (40, 'Can view blank answer', 10, 'view_blankanswer');
INSERT INTO `auth_permission` VALUES (41, 'Can add rating answer', 11, 'add_ratinganswer');
INSERT INTO `auth_permission` VALUES (42, 'Can change rating answer', 11, 'change_ratinganswer');
INSERT INTO `auth_permission` VALUES (43, 'Can delete rating answer', 11, 'delete_ratinganswer');
INSERT INTO `auth_permission` VALUES (44, 'Can view rating answer', 11, 'view_ratinganswer');
INSERT INTO `auth_permission` VALUES (45, 'Can add choice question', 12, 'add_choicequestion');
INSERT INTO `auth_permission` VALUES (46, 'Can change choice question', 12, 'change_choicequestion');
INSERT INTO `auth_permission` VALUES (47, 'Can delete choice question', 12, 'delete_choicequestion');
INSERT INTO `auth_permission` VALUES (48, 'Can view choice question', 12, 'view_choicequestion');
INSERT INTO `auth_permission` VALUES (49, 'Can add choice answer', 13, 'add_choiceanswer');
INSERT INTO `auth_permission` VALUES (50, 'Can change choice answer', 13, 'change_choiceanswer');
INSERT INTO `auth_permission` VALUES (51, 'Can delete choice answer', 13, 'delete_choiceanswer');
INSERT INTO `auth_permission` VALUES (52, 'Can view choice answer', 13, 'view_choiceanswer');
INSERT INTO `auth_permission` VALUES (53, 'Can add blank question', 14, 'add_blankquestion');
INSERT INTO `auth_permission` VALUES (54, 'Can change blank question', 14, 'change_blankquestion');
INSERT INTO `auth_permission` VALUES (55, 'Can delete blank question', 14, 'delete_blankquestion');
INSERT INTO `auth_permission` VALUES (56, 'Can view blank question', 14, 'view_blankquestion');

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
INSERT INTO `django_content_type` VALUES (10, 'edition_project', 'blankanswer');
INSERT INTO `django_content_type` VALUES (14, 'edition_project', 'blankquestion');
INSERT INTO `django_content_type` VALUES (13, 'edition_project', 'choiceanswer');
INSERT INTO `django_content_type` VALUES (9, 'edition_project', 'choiceoption');
INSERT INTO `django_content_type` VALUES (12, 'edition_project', 'choicequestion');
INSERT INTO `django_content_type` VALUES (6, 'edition_project', 'otheroption');
INSERT INTO `django_content_type` VALUES (11, 'edition_project', 'ratinganswer');
INSERT INTO `django_content_type` VALUES (8, 'edition_project', 'ratingquestion');
INSERT INTO `django_content_type` VALUES (7, 'edition_project', 'submission');
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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2024-08-20 11:18:31.118677');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2024-08-20 11:18:31.243284');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2024-08-20 11:18:32.039870');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2024-08-20 11:18:32.103716');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2024-08-20 11:18:32.167456');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2024-08-20 11:18:32.205399');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2024-08-20 11:18:32.259406');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2024-08-20 11:18:32.289242');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2024-08-20 11:18:32.325371');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2024-08-20 11:18:32.384568');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2024-08-20 11:18:32.442366');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2024-08-20 11:18:32.502392');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2024-08-20 11:18:32.586761');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2024-08-20 11:18:32.648366');
INSERT INTO `django_migrations` VALUES (15, 'sessions', '0001_initial', '2024-08-20 11:18:32.772872');
INSERT INTO `django_migrations` VALUES (16, 'edition_project', '0001_initial', '2024-08-21 04:10:07.924274');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edition_project_blankanswer
-- ----------------------------

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
  PRIMARY KEY (`QuestionID`) USING BTREE,
  UNIQUE INDEX `SurveyID`(`SurveyID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edition_project_blankquestion
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edition_project_choiceanswer
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edition_project_choiceoption
-- ----------------------------

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
  PRIMARY KEY (`QuestionID`) USING BTREE,
  UNIQUE INDEX `SurveyID`(`SurveyID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edition_project_choicequestion
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edition_project_ratinganswer
-- ----------------------------

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
  PRIMARY KEY (`QuestionID`) USING BTREE,
  UNIQUE INDEX `SurveyID`(`SurveyID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edition_project_ratingquestion
-- ----------------------------

-- ----------------------------
-- Table structure for edition_project_submission
-- ----------------------------
DROP TABLE IF EXISTS `edition_project_submission`;
CREATE TABLE `edition_project_submission`  (
  `SubmissionID` int(11) NOT NULL AUTO_INCREMENT,
  `SurveyID` int(11) NOT NULL,
  `RespondentID` int(11) NOT NULL,
  `SubmissionTime` datetime(6) NOT NULL,
  `Status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Score` int(11) NULL DEFAULT NULL,
  `Interval` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`SubmissionID`) USING BTREE,
  UNIQUE INDEX `SurveyID`(`SurveyID`) USING BTREE,
  UNIQUE INDEX `RespondentID`(`RespondentID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edition_project_submission
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
