/*
 Navicat Premium Data Transfer

 Source Server         : paperplaneOld
 Source Server Type    : MySQL
 Source Server Version : 50718 (5.7.18-cynos-2.1.12-log)
 Source Host           : bj-cynosdbmysql-grp-g9kxigho.sql.tencentcdb.com:23531
 Source Schema         : management_db

 Target Server Type    : MySQL
 Target Server Version : 50718 (5.7.18-cynos-2.1.12-log)
 File Encoding         : 65001

 Date: 28/08/2024 23:37:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
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

drop database if exists management_db;
create database management_db;
use management_db;

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
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `auth_permission` VALUES (21, 'Can add submission', 6, 'add_submission');
INSERT INTO `auth_permission` VALUES (22, 'Can change submission', 6, 'change_submission');
INSERT INTO `auth_permission` VALUES (23, 'Can delete submission', 6, 'delete_submission');
INSERT INTO `auth_permission` VALUES (24, 'Can view submission', 6, 'view_submission');
INSERT INTO `auth_permission` VALUES (25, 'Can add survey', 7, 'add_survey');
INSERT INTO `auth_permission` VALUES (26, 'Can change survey', 7, 'change_survey');
INSERT INTO `auth_permission` VALUES (27, 'Can delete survey', 7, 'delete_survey');
INSERT INTO `auth_permission` VALUES (28, 'Can view survey', 7, 'view_survey');
INSERT INTO `auth_permission` VALUES (29, 'Can add reward offering', 8, 'add_rewardoffering');
INSERT INTO `auth_permission` VALUES (30, 'Can change reward offering', 8, 'change_rewardoffering');
INSERT INTO `auth_permission` VALUES (31, 'Can delete reward offering', 8, 'delete_rewardoffering');
INSERT INTO `auth_permission` VALUES (32, 'Can view reward offering', 8, 'view_rewardoffering');

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (2, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (1, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (8, 'management_project', 'rewardoffering');
INSERT INTO `django_content_type` VALUES (6, 'management_project', 'submission');
INSERT INTO `django_content_type` VALUES (7, 'management_project', 'survey');
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
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2024-08-28 14:20:32.749921');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2024-08-28 14:20:32.815430');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2024-08-28 14:20:33.229780');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2024-08-28 14:20:33.262244');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2024-08-28 14:20:33.295446');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2024-08-28 14:20:33.313390');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2024-08-28 14:20:33.344594');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2024-08-28 14:20:33.359391');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2024-08-28 14:20:33.377978');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2024-08-28 14:20:33.409528');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2024-08-28 14:20:33.441801');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2024-08-28 14:20:33.474055');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2024-08-28 14:20:33.512775');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2024-08-28 14:20:33.544979');
INSERT INTO `django_migrations` VALUES (15, 'management_project', '0001_initial', '2024-08-28 14:20:33.718491');
INSERT INTO `django_migrations` VALUES (16, 'management_project', '0002_auto_20240826_0353', '2024-08-28 14:20:33.894462');
INSERT INTO `django_migrations` VALUES (17, 'management_project', '0003_alter_submission_submissiontime', '2024-08-28 14:20:33.922593');
INSERT INTO `django_migrations` VALUES (18, 'management_project', '0004_alter_survey_publishdate', '2024-08-28 14:20:33.952498');
INSERT INTO `django_migrations` VALUES (19, 'management_project', '0005_alter_survey_publishdate', '2024-08-28 14:20:33.982255');
INSERT INTO `django_migrations` VALUES (20, 'sessions', '0001_initial', '2024-08-28 14:20:34.039560');

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
-- Table structure for management_project_rewardoffering
-- ----------------------------
DROP TABLE IF EXISTS `management_project_rewardoffering`;
CREATE TABLE `management_project_rewardoffering`  (
  `RewardID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Zhibi` int(11) NOT NULL,
  `AvailableQuota` int(11) NOT NULL,
  `Survey_id` int(11) NOT NULL,
  PRIMARY KEY (`RewardID`) USING BTREE,
  INDEX `management_project_r_Survey_id_ff30b05b_fk_managemen`(`Survey_id`) USING BTREE,
  CONSTRAINT `management_project_r_Survey_id_ff30b05b_fk_managemen` FOREIGN KEY (`Survey_id`) REFERENCES `management_project_survey` (`SurveyID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of management_project_rewardoffering
-- ----------------------------

-- ----------------------------
-- Table structure for management_project_submission
-- ----------------------------
DROP TABLE IF EXISTS `management_project_submission`;
CREATE TABLE `management_project_submission`  (
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
-- Records of management_project_submission
-- ----------------------------
INSERT INTO `management_project_submission` VALUES (7, 7, 1, '2024-08-28 14:34:27.119727', 'Submitted', 0, 0);
INSERT INTO `management_project_submission` VALUES (8, 14, 1, NULL, 'Deleted', NULL, 0);
INSERT INTO `management_project_submission` VALUES (9, 16, 4, '2024-08-28 15:13:41.996844', 'Graded', 7, 39);
INSERT INTO `management_project_submission` VALUES (10, 16, 4, '2024-08-28 15:16:44.280059', 'Graded', 6, 46);
INSERT INTO `management_project_submission` VALUES (11, 14, 4, '2024-08-28 15:15:24.436799', 'Submitted', 0, 0);
INSERT INTO `management_project_submission` VALUES (12, 17, 1, '2024-08-28 15:23:05.176130', 'Submitted', 0, 0);
INSERT INTO `management_project_submission` VALUES (13, 17, 1, '2024-08-28 15:25:53.504152', 'Unsubmitted', 0, 0);

-- ----------------------------
-- Table structure for management_project_survey
-- ----------------------------
DROP TABLE IF EXISTS `management_project_survey`;
CREATE TABLE `management_project_survey`  (
  `SurveyID` int(11) NOT NULL AUTO_INCREMENT,
  `OwnerID` int(11) NOT NULL,
  `Title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Is_released` tinyint(1) NOT NULL,
  `Is_open` tinyint(1) NOT NULL,
  `Is_deleted` tinyint(1) NOT NULL,
  `PublishDate` datetime(6) NULL DEFAULT NULL,
  `Category` int(11) NOT NULL,
  `TotalScore` int(11) NULL DEFAULT NULL,
  `TimeLimit` int(11) NULL DEFAULT NULL,
  `IsOrder` tinyint(1) NOT NULL,
  PRIMARY KEY (`SurveyID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of management_project_survey
-- ----------------------------
INSERT INTO `management_project_survey` VALUES (8, 3, 'MBTI测试', '这是MBTI测试', 1, 0, 0, '2024-08-28 14:42:14.357412', 0, 0, 1, 1);
INSERT INTO `management_project_survey` VALUES (9, 3, '动物领养调查问卷', '这是动物领养调查问卷', 1, 0, 0, '2024-08-28 14:43:00.467332', 0, 0, 1, 1);
INSERT INTO `management_project_survey` VALUES (10, 3, '市场情况调研问卷', '这是市场情况调研问卷', 1, 0, 0, '2024-08-28 14:43:42.910661', 0, 0, 1, 1);
INSERT INTO `management_project_survey` VALUES (11, 3, '暑期课程学生报名表', '这是暑期课程学生报名表', 1, 0, 0, '2024-08-28 14:44:18.842082', 2, 0, 1, 1);
INSERT INTO `management_project_survey` VALUES (12, 3, '年度社区活动提案投票', '这是年度社区活动提案投票', 1, 0, 0, '2024-08-28 14:44:52.731102', 1, 0, 1, 1);
INSERT INTO `management_project_survey` VALUES (13, 3, '2024年综合知识测试', '这是2024年综合知识测试模板', 1, 0, 0, '2024-08-28 14:45:25.766006', 3, 0, 1, 1);
INSERT INTO `management_project_survey` VALUES (16, 4, '野外生存知识小测', '每年都会有很多露营者和徒步旅行者在荒野中陷入了生存困境。你知道求生的三法则吗？你能找到饮用水吗？如何获取救援？当你完成这个测验时，你的生存技能都将受到检验，你也会尽可能多地了解生存技能。', 1, 1, 0, '2024-08-28 15:12:52.415765', 3, 0, 2, 0);
INSERT INTO `management_project_survey` VALUES (17, 1, '你知道什么是墨菲定律吗？', 'Murphy ~~~', 1, 1, 0, '2024-08-28 15:22:46.947869', 0, 0, 1, 1);

SET FOREIGN_KEY_CHECKS = 1;
