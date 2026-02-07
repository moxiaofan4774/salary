/*
 Navicat Premium Dump SQL

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : salary

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 27/01/2026 10:39:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pic` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `create_date` datetime(6) NOT NULL,
  `out_link` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_check` tinyint(1) NOT NULL,
  `is_top` tinyint(1) NOT NULL,
  `is_hot` tinyint(1) NOT NULL,
  `hits` int NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `author_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `category_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Article_author_id_5b4dfd9f_fk_UserInfo_id`(`author_id` ASC) USING BTREE,
  INDEX `Article_category_id_914e6c46_fk_Category_uuid`(`category_id` ASC) USING BTREE,
  CONSTRAINT `Article_author_id_5b4dfd9f_fk_UserInfo_id` FOREIGN KEY (`author_id`) REFERENCES `userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Article_category_id_914e6c46_fk_Category_uuid` FOREIGN KEY (`category_id`) REFERENCES `category` (`uuid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (2, '1111', '/media/upload/5b30ed1e91ad4c20b9d35adc4e00ac3a.png', '<p>1111<img src=\"http://127.0.0.1:8000/media/upload/0d5284fa01854da880fcb53ce4807ff6.png\" alt=\"\" data-href=\"\" style=\"\"/></p>', '2025-11-14 02:23:54.857673', '', 1, 0, 0, 2, 0, '46d6dc2bfdbf4c2abab1195bb9d7031c', NULL);
INSERT INTO `article` VALUES (4, '打算的撒', '/media/upload/4dc82b0bd4b14f5ead2e7fc44237c0a1.png', '<p>电萨单撒多</p>', '2025-11-16 06:56:27.700302', '', 1, 0, 0, 0, 0, '46d6dc2bfdbf4c2abab1195bb9d7031c', NULL);

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `auth_permission` VALUES (21, 'Can add user info', 6, 'add_userinfo');
INSERT INTO `auth_permission` VALUES (22, 'Can change user info', 6, 'change_userinfo');
INSERT INTO `auth_permission` VALUES (23, 'Can delete user info', 6, 'delete_userinfo');
INSERT INTO `auth_permission` VALUES (24, 'Can view user info', 6, 'view_userinfo');
INSERT INTO `auth_permission` VALUES (25, 'Can add banner', 7, 'add_banner');
INSERT INTO `auth_permission` VALUES (26, 'Can change banner', 7, 'change_banner');
INSERT INTO `auth_permission` VALUES (27, 'Can delete banner', 7, 'delete_banner');
INSERT INTO `auth_permission` VALUES (28, 'Can view banner', 7, 'view_banner');
INSERT INTO `auth_permission` VALUES (29, 'Can add article', 8, 'add_article');
INSERT INTO `auth_permission` VALUES (30, 'Can change article', 8, 'change_article');
INSERT INTO `auth_permission` VALUES (31, 'Can delete article', 8, 'delete_article');
INSERT INTO `auth_permission` VALUES (32, 'Can view article', 8, 'view_article');
INSERT INTO `auth_permission` VALUES (33, 'Can add category', 9, 'add_category');
INSERT INTO `auth_permission` VALUES (34, 'Can change category', 9, 'change_category');
INSERT INTO `auth_permission` VALUES (35, 'Can delete category', 9, 'delete_category');
INSERT INTO `auth_permission` VALUES (36, 'Can view category', 9, 'view_category');
INSERT INTO `auth_permission` VALUES (37, 'Can add scan url', 10, 'add_scanurl');
INSERT INTO `auth_permission` VALUES (38, 'Can change scan url', 10, 'change_scanurl');
INSERT INTO `auth_permission` VALUES (39, 'Can delete scan url', 10, 'delete_scanurl');
INSERT INTO `auth_permission` VALUES (40, 'Can view scan url', 10, 'view_scanurl');
INSERT INTO `auth_permission` VALUES (41, 'Can add scan result', 11, 'add_scanresult');
INSERT INTO `auth_permission` VALUES (42, 'Can change scan result', 11, 'change_scanresult');
INSERT INTO `auth_permission` VALUES (43, 'Can delete scan result', 11, 'delete_scanresult');
INSERT INTO `auth_permission` VALUES (44, 'Can view scan result', 11, 'view_scanresult');
INSERT INTO `auth_permission` VALUES (45, 'Can add scan task', 12, 'add_scantask');
INSERT INTO `auth_permission` VALUES (46, 'Can change scan task', 12, 'change_scantask');
INSERT INTO `auth_permission` VALUES (47, 'Can delete scan task', 12, 'delete_scantask');
INSERT INTO `auth_permission` VALUES (48, 'Can view scan task', 12, 'view_scantask');
INSERT INTO `auth_permission` VALUES (49, 'Can add scan result keyword', 13, 'add_scanresultkeyword');
INSERT INTO `auth_permission` VALUES (50, 'Can change scan result keyword', 13, 'change_scanresultkeyword');
INSERT INTO `auth_permission` VALUES (51, 'Can delete scan result keyword', 13, 'delete_scanresultkeyword');
INSERT INTO `auth_permission` VALUES (52, 'Can view scan result keyword', 13, 'view_scanresultkeyword');
INSERT INTO `auth_permission` VALUES (53, 'Can add 敏感词', 14, 'add_sensitivekeyword');
INSERT INTO `auth_permission` VALUES (54, 'Can change 敏感词', 14, 'change_sensitivekeyword');
INSERT INTO `auth_permission` VALUES (55, 'Can delete 敏感词', 14, 'delete_sensitivekeyword');
INSERT INTO `auth_permission` VALUES (56, 'Can view 敏感词', 14, 'view_sensitivekeyword');
INSERT INTO `auth_permission` VALUES (57, 'Can add category group', 15, 'add_categorygroup');
INSERT INTO `auth_permission` VALUES (58, 'Can change category group', 15, 'change_categorygroup');
INSERT INTO `auth_permission` VALUES (59, 'Can delete category group', 15, 'delete_categorygroup');
INSERT INTO `auth_permission` VALUES (60, 'Can view category group', 15, 'view_categorygroup');
INSERT INTO `auth_permission` VALUES (61, 'Can add scores', 16, 'add_scores');
INSERT INTO `auth_permission` VALUES (62, 'Can change scores', 16, 'change_scores');
INSERT INTO `auth_permission` VALUES (63, 'Can delete scores', 16, 'delete_scores');
INSERT INTO `auth_permission` VALUES (64, 'Can view scores', 16, 'view_scores');
INSERT INTO `auth_permission` VALUES (65, 'Can add subject category', 17, 'add_subjectcategory');
INSERT INTO `auth_permission` VALUES (66, 'Can change subject category', 17, 'change_subjectcategory');
INSERT INTO `auth_permission` VALUES (67, 'Can delete subject category', 17, 'delete_subjectcategory');
INSERT INTO `auth_permission` VALUES (68, 'Can view subject category', 17, 'view_subjectcategory');
INSERT INTO `auth_permission` VALUES (69, 'Can add years', 18, 'add_years');
INSERT INTO `auth_permission` VALUES (70, 'Can change years', 18, 'change_years');
INSERT INTO `auth_permission` VALUES (71, 'Can delete years', 18, 'delete_years');
INSERT INTO `auth_permission` VALUES (72, 'Can view years', 18, 'view_years');
INSERT INTO `auth_permission` VALUES (73, 'Can add batch', 19, 'add_batch');
INSERT INTO `auth_permission` VALUES (74, 'Can change batch', 19, 'change_batch');
INSERT INTO `auth_permission` VALUES (75, 'Can delete batch', 19, 'delete_batch');
INSERT INTO `auth_permission` VALUES (76, 'Can view batch', 19, 'view_batch');
INSERT INTO `auth_permission` VALUES (77, 'Can add provinces', 20, 'add_provinces');
INSERT INTO `auth_permission` VALUES (78, 'Can change provinces', 20, 'change_provinces');
INSERT INTO `auth_permission` VALUES (79, 'Can delete provinces', 20, 'delete_provinces');
INSERT INTO `auth_permission` VALUES (80, 'Can view provinces', 20, 'view_provinces');
INSERT INTO `auth_permission` VALUES (81, 'Can add menu', 21, 'add_menu');
INSERT INTO `auth_permission` VALUES (82, 'Can change menu', 21, 'change_menu');
INSERT INTO `auth_permission` VALUES (83, 'Can delete menu', 21, 'delete_menu');
INSERT INTO `auth_permission` VALUES (84, 'Can view menu', 21, 'view_menu');
INSERT INTO `auth_permission` VALUES (85, 'Can add role', 22, 'add_role');
INSERT INTO `auth_permission` VALUES (86, 'Can change role', 22, 'change_role');
INSERT INTO `auth_permission` VALUES (87, 'Can delete role', 22, 'delete_role');
INSERT INTO `auth_permission` VALUES (88, 'Can view role', 22, 'view_role');
INSERT INTO `auth_permission` VALUES (89, 'Can add partys', 23, 'add_partys');
INSERT INTO `auth_permission` VALUES (90, 'Can change partys', 23, 'change_partys');
INSERT INTO `auth_permission` VALUES (91, 'Can delete partys', 23, 'delete_partys');
INSERT INTO `auth_permission` VALUES (92, 'Can view partys', 23, 'view_partys');
INSERT INTO `auth_permission` VALUES (93, 'Can add party rank', 24, 'add_partyrank');
INSERT INTO `auth_permission` VALUES (94, 'Can change party rank', 24, 'change_partyrank');
INSERT INTO `auth_permission` VALUES (95, 'Can delete party rank', 24, 'delete_partyrank');
INSERT INTO `auth_permission` VALUES (96, 'Can view party rank', 24, 'view_partyrank');
INSERT INTO `auth_permission` VALUES (97, 'Can add domain', 25, 'add_domain');
INSERT INTO `auth_permission` VALUES (98, 'Can change domain', 25, 'change_domain');
INSERT INTO `auth_permission` VALUES (99, 'Can delete domain', 25, 'delete_domain');
INSERT INTO `auth_permission` VALUES (100, 'Can view domain', 25, 'view_domain');
INSERT INTO `auth_permission` VALUES (101, 'Can add year and month', 26, 'add_yearandmonth');
INSERT INTO `auth_permission` VALUES (102, 'Can change year and month', 26, 'change_yearandmonth');
INSERT INTO `auth_permission` VALUES (103, 'Can delete year and month', 26, 'delete_yearandmonth');
INSERT INTO `auth_permission` VALUES (104, 'Can view year and month', 26, 'view_yearandmonth');
INSERT INTO `auth_permission` VALUES (105, 'Can add salary kou kuan', 27, 'add_salarykoukuan');
INSERT INTO `auth_permission` VALUES (106, 'Can change salary kou kuan', 27, 'change_salarykoukuan');
INSERT INTO `auth_permission` VALUES (107, 'Can delete salary kou kuan', 27, 'delete_salarykoukuan');
INSERT INTO `auth_permission` VALUES (108, 'Can view salary kou kuan', 27, 'view_salarykoukuan');
INSERT INTO `auth_permission` VALUES (109, 'Can add salary ying fa', 28, 'add_salaryyingfa');
INSERT INTO `auth_permission` VALUES (110, 'Can change salary ying fa', 28, 'change_salaryyingfa');
INSERT INTO `auth_permission` VALUES (111, 'Can delete salary ying fa', 28, 'delete_salaryyingfa');
INSERT INTO `auth_permission` VALUES (112, 'Can view salary ying fa', 28, 'view_salaryyingfa');
INSERT INTO `auth_permission` VALUES (113, 'Can add proxy granting ticket', 29, 'add_proxygrantingticket');
INSERT INTO `auth_permission` VALUES (114, 'Can change proxy granting ticket', 29, 'change_proxygrantingticket');
INSERT INTO `auth_permission` VALUES (115, 'Can delete proxy granting ticket', 29, 'delete_proxygrantingticket');
INSERT INTO `auth_permission` VALUES (116, 'Can view proxy granting ticket', 29, 'view_proxygrantingticket');
INSERT INTO `auth_permission` VALUES (117, 'Can add session ticket', 30, 'add_sessionticket');
INSERT INTO `auth_permission` VALUES (118, 'Can change session ticket', 30, 'change_sessionticket');
INSERT INTO `auth_permission` VALUES (119, 'Can delete session ticket', 30, 'delete_sessionticket');
INSERT INTO `auth_permission` VALUES (120, 'Can view session ticket', 30, 'view_sessionticket');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$1000000$IR7cPzGBOJzYqxfUYt54BB$P+LsLYUJdKlGUeIjZ02JvEBiLUCm1GrRRu/uKPuuAMU=', NULL, 1, 'admin', '', '', 'zhangyuanyuan@tyu.edu.cn', 1, 1, '2025-11-10 12:14:33.517421');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `order` int NULL DEFAULT NULL,
  `pic` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_show` tinyint(1) NULL DEFAULT NULL,
  `link_url` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `desc` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES (2, 'ceshi', 4, '/media/upload/9a5249abe410412cbe02825592c74389.png', 1, '#', '');

-- ----------------------------
-- Table structure for batch
-- ----------------------------
DROP TABLE IF EXISTS `batch`;
CREATE TABLE `batch`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `batch` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of batch
-- ----------------------------
INSERT INTO `batch` VALUES (3, '本科批');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `uuid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `order` int NOT NULL,
  `desc` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `parent_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `group_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE,
  INDEX `Category_parent_id_79e60df4_fk_Category_uuid`(`parent_id` ASC) USING BTREE,
  INDEX `Category_group_id_8f7b4939_fk_CategoryGroup_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `Category_group_id_8f7b4939_fk_CategoryGroup_id` FOREIGN KEY (`group_id`) REFERENCES `categorygroup` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Category_parent_id_79e60df4_fk_Category_uuid` FOREIGN KEY (`parent_id`) REFERENCES `category` (`uuid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('4269ecb61e2c4efbaf511b9fc1070147', '学校简介', 100, '', '4f41fd9c37e4445fadfd7f18a3663f28', NULL);
INSERT INTO `category` VALUES ('4e0bbf063a8247eabb319f6bc94fe72a', '校园动态', 55, '', NULL, NULL);
INSERT INTO `category` VALUES ('4f41fd9c37e4445fadfd7f18a3663f28', '学校概况', 90, '', NULL, '93f61addfc5843638ea08a91a14ba3a3');
INSERT INTO `category` VALUES ('6296e75adcb44048afa9cb3e7b65c95c', '教学部门', 70, '', NULL, NULL);
INSERT INTO `category` VALUES ('6abfdd22848f4001a2ecb4e51267e5fe', '校园生活', 40, '', NULL, NULL);
INSERT INTO `category` VALUES ('6fcf52af3ea34738ba0fcdac6571c9e8', '科学研究', 50, '', NULL, NULL);
INSERT INTO `category` VALUES ('7f4047c0e4de445d88b66e88fcd901cc', '招生就业', 65, '', NULL, NULL);
INSERT INTO `category` VALUES ('9d6610b4b44a4a76948c67bb4e4cd1b9', '管理机构', 80, '', NULL, '93f61addfc5843638ea08a91a14ba3a3');
INSERT INTO `category` VALUES ('bcd36ab533c446b199d60c9f58cbc4de', '组织机构', 90, '', '4f41fd9c37e4445fadfd7f18a3663f28', NULL);
INSERT INTO `category` VALUES ('e0679bed693745378f41ee4aa7982c40', '国际交流', 45, '', NULL, NULL);
INSERT INTO `category` VALUES ('f27d39a5306f45b8b6ed9fc530a3512d', '教育教学', 60, '', NULL, NULL);
INSERT INTO `category` VALUES ('f7edbf322a2a42e4a761109f1785711a', '首页', 100, '', NULL, '93f61addfc5843638ea08a91a14ba3a3');

-- ----------------------------
-- Table structure for categorygroup
-- ----------------------------
DROP TABLE IF EXISTS `categorygroup`;
CREATE TABLE `categorygroup`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categorygroup
-- ----------------------------
INSERT INTO `categorygroup` VALUES ('1e90eb3b7aa843e2bc467548d3685207', '首页顶部导航小字');
INSERT INTO `categorygroup` VALUES ('3de90b874f4e482685fba2f589abb06f', '临时存放组');
INSERT INTO `categorygroup` VALUES ('93f61addfc5843638ea08a91a14ba3a3', '首页栏目导航');

-- ----------------------------
-- Table structure for django_cas_ng_proxygrantingticket
-- ----------------------------
DROP TABLE IF EXISTS `django_cas_ng_proxygrantingticket`;
CREATE TABLE `django_cas_ng_proxygrantingticket`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_key` varchar(736) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pgtiou` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pgt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `user_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_cas_ng_proxygrant_session_key_user_id_4cd2ea19_uniq`(`session_key` ASC, `user_id` ASC) USING BTREE,
  INDEX `django_cas_ng_proxyg_user_id_f833edd2_fk_UserInfo_`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_cas_ng_proxyg_user_id_f833edd2_fk_UserInfo_` FOREIGN KEY (`user_id`) REFERENCES `userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_cas_ng_proxygrantingticket
-- ----------------------------

-- ----------------------------
-- Table structure for django_cas_ng_sessionticket
-- ----------------------------
DROP TABLE IF EXISTS `django_cas_ng_sessionticket`;
CREATE TABLE `django_cas_ng_sessionticket`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_key` varchar(736) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ticket` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_cas_ng_sessionticket
-- ----------------------------
INSERT INTO `django_cas_ng_sessionticket` VALUES (10, 'cjnrftaju1k0fcr6084ye1nemh25pzgp', 'ST-1923851-vkKAle36gApUc3561TSmaVbVRF0ciapserver1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (2, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (1, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (29, 'django_cas_ng', 'proxygrantingticket');
INSERT INTO `django_content_type` VALUES (30, 'django_cas_ng', 'sessionticket');
INSERT INTO `django_content_type` VALUES (19, 'excelfilter', 'batch');
INSERT INTO `django_content_type` VALUES (20, 'excelfilter', 'provinces');
INSERT INTO `django_content_type` VALUES (16, 'excelfilter', 'scores');
INSERT INTO `django_content_type` VALUES (17, 'excelfilter', 'subjectcategory');
INSERT INTO `django_content_type` VALUES (18, 'excelfilter', 'years');
INSERT INTO `django_content_type` VALUES (25, 'linkscanner', 'domain');
INSERT INTO `django_content_type` VALUES (21, 'menu', 'menu');
INSERT INTO `django_content_type` VALUES (8, 'news', 'article');
INSERT INTO `django_content_type` VALUES (7, 'news', 'banner');
INSERT INTO `django_content_type` VALUES (9, 'news', 'category');
INSERT INTO `django_content_type` VALUES (15, 'news', 'categorygroup');
INSERT INTO `django_content_type` VALUES (24, 'party', 'partyrank');
INSERT INTO `django_content_type` VALUES (23, 'party', 'partys');
INSERT INTO `django_content_type` VALUES (27, 'salary', 'salarykoukuan');
INSERT INTO `django_content_type` VALUES (28, 'salary', 'salaryyingfa');
INSERT INTO `django_content_type` VALUES (26, 'salary', 'yearandmonth');
INSERT INTO `django_content_type` VALUES (11, 'scan', 'scanresult');
INSERT INTO `django_content_type` VALUES (13, 'scan', 'scanresultkeyword');
INSERT INTO `django_content_type` VALUES (12, 'scan', 'scantask');
INSERT INTO `django_content_type` VALUES (10, 'scan', 'scanurl');
INSERT INTO `django_content_type` VALUES (14, 'scan', 'sensitivekeyword');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (22, 'user', 'role');
INSERT INTO `django_content_type` VALUES (6, 'user', 'userinfo');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2025-11-03 12:53:32.599898');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2025-11-03 12:53:32.629105');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2025-11-03 12:53:32.881463');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2025-11-03 12:53:32.908263');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2025-11-03 12:53:32.921400');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2025-11-03 12:53:32.926475');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2025-11-03 12:53:32.949859');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2025-11-03 12:53:32.952909');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2025-11-03 12:53:32.960651');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2025-11-03 12:53:32.989795');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2025-11-03 12:53:33.013927');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2025-11-03 12:53:33.025096');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2025-11-03 12:53:33.030136');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2025-11-03 12:53:33.061666');
INSERT INTO `django_migrations` VALUES (15, 'sessions', '0001_initial', '2025-11-03 12:53:33.086665');
INSERT INTO `django_migrations` VALUES (16, 'user', '0001_initial', '2025-11-10 12:13:49.127633');
INSERT INTO `django_migrations` VALUES (17, 'news', '0001_initial', '2025-11-11 11:46:40.486613');
INSERT INTO `django_migrations` VALUES (18, 'news', '0002_category_article', '2025-11-13 06:31:17.627209');
INSERT INTO `django_migrations` VALUES (19, 'scan', '0001_initial', '2025-11-14 02:48:02.768677');
INSERT INTO `django_migrations` VALUES (20, 'scan', '0002_scanresultkeyword', '2025-11-14 03:13:43.285425');
INSERT INTO `django_migrations` VALUES (21, 'scan', '0003_sensitivekeyword', '2025-11-14 08:01:38.359720');
INSERT INTO `django_migrations` VALUES (22, 'scan', '0004_scanresult_ctime', '2025-11-14 13:19:18.905644');
INSERT INTO `django_migrations` VALUES (23, 'news', '0003_categorygroup_category_group', '2025-11-16 14:12:22.835398');
INSERT INTO `django_migrations` VALUES (24, 'excelfilter', '0001_initial', '2025-11-21 02:18:05.604217');
INSERT INTO `django_migrations` VALUES (25, 'excelfilter', '0002_alter_scores_average_score_alter_scores_high_score_and_more', '2025-11-21 02:20:36.909999');
INSERT INTO `django_migrations` VALUES (26, 'excelfilter', '0003_remove_scores_province_line_scores_province_score_and_more', '2025-11-21 02:20:37.019647');
INSERT INTO `django_migrations` VALUES (27, 'menu', '0001_initial', '2025-11-23 00:42:19.591991');
INSERT INTO `django_migrations` VALUES (28, 'user', '0002_role', '2025-11-23 00:47:50.392581');
INSERT INTO `django_migrations` VALUES (29, 'user', '0003_role_extra_fields', '2025-11-23 12:54:25.668194');
INSERT INTO `django_migrations` VALUES (30, 'party', '0001_initial', '2025-11-30 06:27:18.770857');
INSERT INTO `django_migrations` VALUES (31, 'party', '0002_partyrank', '2025-11-30 07:14:31.081980');
INSERT INTO `django_migrations` VALUES (32, 'linkscanner', '0001_initial', '2026-01-15 07:02:13.189728');
INSERT INTO `django_migrations` VALUES (33, 'party', '0003_alter_partyrank_options_alter_partys_options', '2026-01-15 07:02:13.196677');
INSERT INTO `django_migrations` VALUES (34, 'user', '0004_userinfo_employeeid', '2026-01-16 07:57:48.264311');
INSERT INTO `django_migrations` VALUES (35, 'user', '0005_userinfo_idcard', '2026-01-16 13:34:08.378277');
INSERT INTO `django_migrations` VALUES (36, 'salary', '0001_initial', '2026-01-17 01:15:27.844838');
INSERT INTO `django_migrations` VALUES (37, 'salary', '0002_salarykoukuan_salaryyingfa_yearandmonth_beizhu', '2026-01-17 02:09:52.310936');
INSERT INTO `django_migrations` VALUES (38, 'salary', '0003_alter_salarykoukuan_table', '2026-01-17 02:10:39.532442');
INSERT INTO `django_migrations` VALUES (39, 'salary', '0004_salarykoukuan_shenfenzhenghao_salarykoukuan_xingming_and_more', '2026-01-17 03:05:54.064036');
INSERT INTO `django_migrations` VALUES (40, 'salary', '0005_salarykoukuan_year_month_salaryyingfa_year_month_and_more', '2026-01-17 06:01:43.310027');
INSERT INTO `django_migrations` VALUES (41, 'salary', '0006_salarykoukuan_heji', '2026-01-17 07:26:59.125769');
INSERT INTO `django_migrations` VALUES (42, 'django_cas_ng', '0001_initial', '2026-01-21 03:37:37.655072');
INSERT INTO `django_migrations` VALUES (43, 'django_cas_ng', '0002_auto_20201023_1400', '2026-01-21 03:37:37.672414');
INSERT INTO `django_migrations` VALUES (44, 'django_cas_ng', '0003_auto_20210813_1226', '2026-01-21 03:37:37.679813');
INSERT INTO `django_migrations` VALUES (45, 'news', '0004_alter_article_table_alter_banner_table_and_more', '2026-01-21 03:37:37.691677');
INSERT INTO `django_migrations` VALUES (46, 'salary', '0007_alter_salarykoukuan_table_alter_salaryyingfa_table_and_more', '2026-01-21 03:37:37.698266');
INSERT INTO `django_migrations` VALUES (47, 'user', '0006_alter_role_table_alter_userinfo_table', '2026-01-21 03:37:37.706679');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('1i7hslv4x03sjsgzadobg1q82lniionh', '.eJylU11v2jAU_StWnlqNBieElLnaA6Ks7UoYglTVtE2VSW7AwrEz2xHrqv73XZePrtvj8mDZ995zzv3KU8CdM2LZOrABewqE_Wh0PYXtRK-ECljgTAtBJ-CtW4NyouBOaHXJHaAvpnF6RqOzOMmjPovPWT8N46j3jg4YpV-vsnx3-4546enyx8bDInzbtijA2qqVwzfM11yVEgzmEhS6DrfCQtmGtVDahoVWlViFL1ThHGqol2AyuLNgFK9hxq3dalPuKVBENF6NhjR8j3mh4W4xnj9MPl_dTB8uh_kYvQvuyCeuSJyQQwnkmDjxBSKsRYUpKmD8t7ZfxRTPKOntTu_n6Mn0LyEl7_ZDSk7uhSr11pJpTrz-BUFDmlyQn2lySoZNI-EelrfCdfu987CXkpPb6zybdIgUGyBXUGz0KRmtcRLQjXqD0JdAyYJX3IgDZFyuXn2-o7z-q5cLh2Oq8e3NGbi1LjHP1iimuRWW-aZZ5gq2GGYTFoWU8Zq1yjZQiEpAiaSFgdITcrmfXfb42vgRb1yx5qNjjG-FKF8Wgw5oklIa_7M6xzz-f7xSq1UOpn5b9Rx-tGBdrjegEOulKi6tX2JUcFwoMDfeqtsPEfVf1MHrDDROxQdJ6Xyb9jPf_QedoNyZV4BwLg_WPxYq_zLzCxUHz8-_ATVnFB8:1vjY3m:6STrOGJAUZlZRnHjErwBLU7mTu1xBYPleZgAOgD1Xfk', '2026-02-07 07:27:54.538243');
INSERT INTO `django_session` VALUES ('20wsj8x4icftdo10yhdi1dxx235ask4w', '.eJylU11v2jAU_StWnlqNGieEjLraA6KMdiUMQapq2qbKJDdg4dgsdkS7qv991-Wj7fa4PFj2vfecc7_yFAjnarloHNiAPwXSfq5NNYHt2CylDnhQCmUhaAWicSvQTubCSaMvhQN0RixKzlh4FsVZ2OHdcx7GlCXRB9bjjH0fpdnu9hPxyvNljxsPC_FtmzwHa8tG9d8xXwldKKgxmSA3Fd1KC0VDK6mNpbnRpVzSFyo6gwqqBdQp3FqotahgKqzdmrrYU6CI3Hg1Rhk9p5FXvZ0PZ_fjr6Pryf1lPxuidy4c-SI0iWJyKIEcEye-QIQ1qDBBBYz_0XTLiOEZxp3d6f0CPan5LZUS7S5l5ORO6sJsLZlkxOtfEDQk8QV5SOJT0t9sFNzB4ka6drfzkXYScnJzlaXjFlFyDWQE-dqcksEKRwHtsNOjvgRG5qIUtTxAhsXy1ec7Kqq_ejl3OKYK396cgluZAvNsas2NsNJy3zTLXc7n_XTMQ8q4qHij7QZyWUookDSvofCEQu1nlz6-Nn4gNi5ficExxrdCFi-LwXosThiL_lmdYx7_P15l9DKDunpf9Qx-NWBdZtagEVu8WWJUcEJqqK-91TSfQua_sIXXKRicig9Syvk27We--xFaQbEzLwHhQh2sbxYq-zb1CxUFz89_ACg_FGY:1vjXVc:doxOV5OHOkYCYyJh3iwBo05iqQwwk5DOafBaEUe_CB8', '2026-02-07 06:52:36.758289');
INSERT INTO `django_session` VALUES ('2qim64sfzki6iayitcr5d71aaqk0kesf', '.eJylU1tv2jAU_itWnlqNGicECq72gChruxKGIFU1bVNlkhOwcOzMF9Gu6n-fXS5dt8flwbLP7Tvn-06eI2at5ktnwUT0OeLmk1b1FLYTteIyopHVDqJWxJxdg7S8YJYreckseF9Ckt4Zic-SNI-7NCGUDPCgf_6B9Ckh366yfHf74fNFKJc_NSEt9m_jigKMqZwYvqt8zWQpQPteokLVeMsNlA7XXCqDCyUrvsKvpfAcaqiXoDO4M6Alq2HGjNkqXe5LeBDeBDSCCR7gJKDeLcbzh8mXq5vpw-UwH3vvgln0mUmUpOgwAjo2jsKAPs15hKlH8PHfXbdKiD_jtLM7g595T6Z-cSFYu4sJOrnnslRbg6Y5CvgXyBt66QV67KWnaNg0Au5hecttu9s5x50eOrm9zrNJCwm-AXQFxUadotHaKwHtuNPHYQSCFqximh9SxuXqzRcYZfVfXC6sl6n272DOwK5V6ft0WlLFDDc0kGaoLehimE1ojAllNXXSNFDwikPpixYaylCQib122dMb8SPW2GLNRseYQAUvXxeD9EnaIyT5Z3WOffy_vELJVQ66fj_1HH46MDZXG5A-N0BVTJiwxB7BMi5B3wSrch9jEr645a8zUF6VECSEDTTtNd_9B62o3JlX4NOZOFj_WKj86ywsVBK9vPwGO9sUHw:1vjXwG:KFL69GGMgVgYfd1GbHUvPP4lDoisD-klmSdeKpg3zC4', '2026-02-07 07:20:08.310602');
INSERT INTO `django_session` VALUES ('3jd51l5whtj73oic3p97f50x5ptffbyt', '.eJylU11v2jAU_StWnlqNGicEylztAVFGuxKGIFU1bVNlkhuwcOwsdkS7qv991-Wj7fa4PFj2vfecc7_yFAjnarlsHNiAPwXSfq5NOYXtxKykDnhQCGUhaAWicWvQTmbCSaMvhQN0RizqnbHwLIrTMObdPo9CGsXnH1ifM_Z9nKS720_EK8-XPlYeFuLbNlkG1haNGrxjvhI6V1BjMkFmSrqVFvKGllIbSzOjC7miL1R0DiWUS6gTuLVQa1HCTFi7NXW-p0ARWXk1Rhn9SCOversYze8nX8fX0_vLQTpC70I48kVoEsXkUAI5Jk58gQhrUGGKChj_o-kWEcMzjDu70_sFehLzWyol2l3KyMmd1LnZWjJNide_IGjoxRfkoRefkkFVKbiD5Y107W7nnHZ65OTmKk0mLaLkBsgYso05JcM1jgLaYadPfQmMLEQhanmAjPLVq893VJR_9XLhcEwlvr05Abc2OebZ1JobYaXlvmmWu4wvBsmEh5RxUfJG2woyWUjIkTSrIfeEQu1nlzy-Nn4oKpetxfAY41sh85fFYH0W9xiL_lmdYx7_P15l9CqFunxf9Rx-NWBdajagEZu_WWJUcEJqqK-91TSfQua_sIXXGRicig9Syvk27We--xFaQb4zrwDhQh2sbxYq_TbzCxUFz89_ACzBFGc:1vjXbe:_la6I1W2h1DOFtfDOfU31qNoX1NAvD5cF1jC9A08nuk', '2026-02-07 06:58:50.873819');
INSERT INTO `django_session` VALUES ('55ymou60rvbun41mfg5rpzzljklbus1l', 'eyJDQVNORVhUIjoiLyJ9:1viB3R:xjslFDEy45ZRWKFWdR691XmHIhPGG0TtLynzfECCHZg', '2026-02-03 12:41:53.940589');
INSERT INTO `django_session` VALUES ('7pq1uans4bu15fhh77ldlwea2lkpn54q', '.eJylU1tv2jAU_itWnlqNGicESl3tAVFGuxKGIFU1bVNlkhOwcOzMF7Gu6n-fXS5tt8flwbLP7Tvn-06eImat5ktnwUT0KeLmk1b1FLYTteIyopHVDqJWxJxdg7S8YJYrecUseF9Ckt4Zic-SNI-7NE1oN8Hn_fgD6VNCvo2zfHf74fNFKJc_NiEt9m_jigKMqZwYvKt8zWQpQPteokLVeMsNlA7XXCqDCyUrvsIvpfAcaqiXoDO4M6Alq2HGjNkqXe5LeBDeBDSCCb7ASUC9W4zmD5Mv45vpw9UgH3nvgln0mUmUpOgwAjo2jsKAPs15hKlH8PHfXbdKiD_jtLM7g595T6Z-cyFYu4sJOrnnslRbg6Y5CviXyBt66SX61UtP0aBpBNzD8pbbdrdzjjs9dHJ7nWeTFhJ8A2gMxUadouHaKwHtuNPHYQSCFqximh9SRuXq1RcYZfVfXC6sl6n272DOwK5V6ft0WlLFDDc0kGaoLehikE1ojAllNXXSNFDwikPpixYaylCQib122eMr8UPW2GLNhseYQAUvXxaD9EnaIyT5Z3WOffy_vELJVQ66fj_1HH46MDZXG5A-N0BVTJiwxB7BMi5B3wSrch9jEr645a8zUF6VECSEDTTtNd_9B62o3JlX4NOZOFjfLFT-dRYWKomen_8ALn8UGw:1vjYIE:ANIuL4qnuxlIA1D9A23DRmdx4__Hks4pGRp7SyPE_6E', '2026-02-07 07:42:50.918493');
INSERT INTO `django_session` VALUES ('8uboa31gctrciof49acp2mfse7finjr2', '.eJylU11v2jAU_StWnlqNGieEjLraA6KMdiUMQapq2qbKJDdg4dgsdkS7qv991-Wj7fa4PFj2vfecc7_yFAjnarloHNiAPwXSfq5NNYHt2CylDnhQCmUhaAWicSvQTubCSaMvhQN0RixKzlh4FsVZ2OHdcx7GlCXRB9bjjH0fpdnu9hPxyvNljxsPC_FtmzwHa8tG9d8xXwldKKgxmSA3Fd1KC0VDK6mNpbnRpVzSFyo6gwqqBdQp3FqotahgKqzdmrrYU6CI3Hg1Rhk9p5FXvZ0PZ_fjr6Pryf1lPxuidy4c-SI0iWJyKIEcEye-QIQ1qDBBBYz_0XTLiOEZxp3d6f0CPan5LZUS7S5l5ORO6sJsLZlkxOtfEDQk8QV5SOJT0t9sFNzB4ka6drfzkXYScnJzlaXjFlFyDWQE-dqcksEKRwHtsNOjvgRG5qIUtTxAhsXy1ec7Kqq_ejl3OKYK396cgluZAvNsas2NsNJy3zTLXc7n_XTMQ8q4qHij7QZyWUookDSvofCEQu1nlz6-Nn4gNi5ficExxrdCFi-LwXosThiL_lmdYx7_P15l9DKDunpf9Qx-NWBdZtagEVu8WWJUcEJqqK-91TSfQua_sIXXKRicig9Syvk27We--xFaQbEzLwHhQh2sbxYq-zb1CxUFz89_ACg_FGY:1vjXCK:JZ2U_EvCpzP-0psSJCb8CEZrsilVnSNSstvbiBCr2zk', '2026-02-07 06:32:40.182371');
INSERT INTO `django_session` VALUES ('94ltdvcmy8x6yg9vtc7jbt0q718fcjtu', '.eJylU11v2jAU_StWnlqNGieEjLnaA6Ks7UoYglTVtE2VSW7AwrGz2BHrqv73XZePttvj8mDZ995zzv3KYyCca-SydWAD_hhI-6kx1RS2E7OSOuBBKZSFoBOI1q1BO5kLJ42-EA7QGbEoOWPhWRRnYZ-zhLM-DePoHRtwxr5dptnu9gPxyvNlD7WHhfi2bZ6DtWWrhm-Yr4QuFDSYTJCbim6lhaKlldTG0tzoUq7oMxWdQwXVEpoUbi00WlQwE9ZuTVPsKVBE1l6NUUY_0Mir3i7G8_vJl8vr6f3FMBujdyEc-Sw0iWJyKIEcEye-QIS1qDBFBYz_3vbLiOEZxr3d6f0CPan5LZUS3T5l5ORO6sJsLZlmxOufEzQk8Tn5lcSnZFjXCu5geSNdt997T3sJObm5ytJJhyi5AXIJ-cacktEaRwHdsDegvgRGFqIUjTxAxsXqxec7Kqq_erlwOKYK396cglubAvNsG82NsNJy3zTLXc4Xw3TCQ8q4qHirbQ25LCUUSJo3UHhCofazSx9eGj8StcvXYnSM8a2QxfNisAGLE8aif1bnmMf_j1cZvcqgqd5WPYefLViXmQ1oxBavlhgVnJAammtvNe3HkPkv7OB1Bgan4oOUcr5N-5nvfoROUOzMK0C4UAfrq4XKvs78QkXB09MfBWMUWQ:1vjXio:xESqcLmaLxbnlr1NTM29RHE3unfocKvqOPhlAD0FN0o', '2026-02-07 07:06:14.978555');
INSERT INTO `django_session` VALUES ('bscxki4293wlo2lk3x30a72269i6usg4', '.eJylU1tv2jAU_itWnlqNGicERl3tAVFGuxKGIFU1bVNlkhOwcOzMF9Gu6n-fXS5tt8flwbLP7Tvn-06eImat5ktnwUT0KeLms1b1FLYTteIyopHVDqJWxJxdg7S8YJYreckseF9Ckt4Zic-SNI9T2k1oN8VpknwgfUrI93GW724_fb4I5fLHJqTF_m1cUYAxlRODd5WvmCwFaN9LVKgab7mB0uGaS2VwoWTFV_ilFJ5DDfUSdAa3BrRkNcyYMVuly30JD8KbgEYwwec4Cai3i9H8fvJ1fD29vxzkI-9dMIu-MImSFB1GQMfGURjQpzmPMPUIPv6H61YJ8WecdnZn8DPvydRvLgRrdzFBJ3dclmpr0DRHAf8CeUMvvUAPvfQUDZpGwB0sb7htdzsfcaeHTm6u8mzSQoJvAI2h2KhTNFx7JaAdd_o4jEDQglVM80PKqFy9-gKjrP6Ly4X1MtX-HcwZ2LUqfZ9OS6qY4YYG0gy1BV0MsgmNMaGspk6aBgpecSh90UJDGQoysdcue3wlfsgaW6zZ8BgTqODly2KQPkl7hCT_rM6xj_-XVyi5ykHX76eewy8HxuZqA9LnBqiKCROW2CNYxiXo62BV7lNMwhe3_HUGyqsSgoSwgaa95rv_oBWVO_MKfDoTB-ubhcq_zcJCJdHz8x8g8RQX:1vjXVt:ToOCujgBPGuuZ1lXk65EyCOma_tDVhYixp9rLwjwe1k', '2026-02-07 06:52:53.406632');
INSERT INTO `django_session` VALUES ('cjnrftaju1k0fcr6084ye1nemh25pzgp', '.eJylU9tu2zAM_RXBTyuWuPIljuNiD1maXtYkKxoX3bANAS3RiVZbyiwZWVf03yclabtsj_ODYJE8h-Qh9eiNhvPZ-FPuZbKtqo4HxjSiaA1qL3v0hD5rVD3DzUQthfQyzzQtejaqNSuURjAwQslTMGh9IQ2TLg26YZTTQRb2siD0g370lqYZpV_Op_nu75vFV44uf1g7WGDvumUMtS7banjAfAGSV9jYWjyman8jNPLWr4VU2mdKlmLpb6n8G6yxLrCZ4q3GRkKN16D1RjV8T2GTiLXLRn3qu7r61nI7H98sJh_PL2eL02E-tu6zRpAPIEkYkeceyEvlxHVoYa1NMbMpbPzXtleG1J5BHO1O5wfrmapfoqrguOdT8uZOSK42msxy4go4IdaQxCfkZxIfkeF6XeEdFlfCHPeivh8l5M3VRT6ddEgl7pGcI7tXR2S0sqPA4yBKfdcDJXMooRHPkDFfvvqcpFD_Jebc2DnV9u7MUzQrxW2dbSMzBVrozKmmM8Oy-XA6yQKfZlBnrdRrZKIUyC0pa5A7Qqj2w5s-vCo_grVhKxi9xDgpBN9uBk1pnFAa_rM7L3X8_3wrJZc5NvVh1zf4o0VtcnWP0mJdqhIq7bbYZjAgJDaXzqradwF1X9Cxv9eo7FRcUFUZJ9N-5ruH0PH4zrxEC4fq2frHQuWfr91Chd5Tx1u4nheOYrHVg1s5BmHKu2VRQDdOkqg74HG_mw6CMCj6UYgUvANYAczWv8V-B7lUCwZ6IZf-3q59-4zf72MOgCvQK4vq95MCkQHlCcRBmKTpIOpFZVAUNCmLtEhgEIdx0eMFY2mZRCXQeFDGQRTyAesF4D39BsxPVbU:1vj5vF:-1PNEghs05o77AGAymg2qx5g463UtedIPPmKsB-N7Xg', '2026-02-06 01:25:13.410572');
INSERT INTO `django_session` VALUES ('e6a0uh13dfejowwb7fpv5z75zcsvdhqx', '.eJylU11v2jAU_StWnlqNGieEjLraA6KMdiUMQapq2qbKJDdg4dgsdkS7qv991-Wj7fa4PFj2vfecc7_yFAjnarloHNiAPwXSfq5NNYHt2CylDnhQCmUhaAWicSvQTubCSaMvhQN0RixKzlh4FsVZ2OHdcx7GlCXRB9bjjH0fpdnu9hPxyvNljxsPC_FtmzwHa8tG9d8xXwldKKgxmSA3Fd1KC0VDK6mNpbnRpVzSFyo6gwqqBdQp3FqotahgKqzdmrrYU6CI3Hg1Rhk9p5FXvZ0PZ_fjr6Pryf1lPxuidy4c-SI0iWJyKIEcEye-QIQ1qDBBBYz_0XTLiOEZxp3d6f0CPan5LZUS7S5l5ORO6sJsLZlkxOtfEDQk8QV5SOJT0t9sFNzB4ka6drfzkXYScnJzlaXjFlFyDWQE-dqcksEKRwHtsNOjvgRG5qIUtTxAhsXy1ec7Kqq_ejl3OKYK396cgluZAvNsas2NsNJy3zTLXc7n_XTMQ8q4qHij7QZyWUookDSvofCEQu1nlz6-Nn4gNi5ficExxrdCFi-LwXosThiL_lmdYx7_P15l9DKDunpf9Qx-NWBdZtagEVu8WWJUcEJqqK-91TSfQua_sIXXKRicig9Syvk27We--xFaQbEzLwHhQh2sbxYq-zb1CxUFz89_ACg_FGY:1vjXUB:Mi5Sv4f7IkVnRA1KwJLmmC3ROY2eWRSrBlv5VRMWlwI', '2026-02-07 06:51:07.403162');
INSERT INTO `django_session` VALUES ('ey6fksorzo39x9tji7rma9tc5go5cugd', '.eJylU11v2jAU_StWnlqNGieEjLraA6KMdiUMQapq2qbKJDdg4dgsdkS7qv991-Wj7fa4PFj2vfecc7_yFAjnarloHNiAPwXSfq5NNYHt2CylDnhQCmUhaAWicSvQTubCSaMvhQN0RixKzlh4FsVZ2OHdcx7GlCXRB9bjjH0fpdnu9hPxyvNljxsPC_FtmzwHa8tG9d8xXwldKKgxmSA3Fd1KC0VDK6mNpbnRpVzSFyo6gwqqBdQp3FqotahgKqzdmrrYU6CI3Hg1Rhk9p5FXvZ0PZ_fjr6Pryf1lPxuidy4c-SI0iWJyKIEcEye-QIQ1qDBBBYz_0XTLiOEZxp3d6f0CPan5LZUS7S5l5ORO6sJsLZlkxOtfEDQk8QV5SOJT0t9sFNzB4ka6drfzkXYScnJzlaXjFlFyDWQE-dqcksEKRwHtsNOjvgRG5qIUtTxAhsXy1ec7Kqq_ejl3OKYK396cgluZAvNsas2NsNJy3zTLXc7n_XTMQ8q4qHij7QZyWUookDSvofCEQu1nlz6-Nn4gNi5ficExxrdCFi-LwXosThiL_lmdYx7_P15l9DKDunpf9Qx-NWBdZtagEVu8WWJUcEJqqK-91TSfQua_sIXXKRicig9Syvk27We--xFaQbEzLwHhQh2sbxYq-zb1CxUFz89_ACg_FGY:1vjXEO:ZGQ1jUILFkahOrrotvQWqrHHOhoCJMgUltac6yvywfA', '2026-02-07 06:34:48.909003');
INSERT INTO `django_session` VALUES ('f0vamivp2axv088npq8f8nximj533bf9', '.eJylU11v2jAU_StWnlqNGieBDLnaA6KMdiUMQSo2bVNlkhuwcGwWO2Jd1f--6_LRdntcHiz73nvuxzk3j8GgP58Mv2QB141SrUA4V8tl48AG_DGQ9mNtqgnsxmYldcCDUigLAYY1bg3ayVw4afSVcIDOiEXJBQsvojALQx71eDehSY-9Yz3O2LdRmu1vPxCvfL7sYethIb5tk-dgbdmo_pvM10IXCmpsJshNRXfSQtHQSmpjaW50KVf0ORWdQQXVEuoU7izUWlQwFdbuTF0cUmARufXVGGW0G9OYoeVuPpzdjz-Pbib3V_1siO4FFOST0CQKyXEGcuqc-AkR1mCJCZbA-O9Nt4wYnmEn3p_eL9CTmt9SKdHuUkbOFlIXZmfJJCO-gUuChqRzSX4lnXPS324VLGB5K127G7-ncULObq-zdNwiSm6AjCDfmHMyWKMW0A7jHvUzMDIXpajlETIsVi8-T6mo_iJz7lCnCt_enIJbmwL7bGrNjbDScs-a5S7n83465iFlXFS80XYLuSwlFJg0r6HwCYU6iJc-vDA_EFuXr8XgFOOpkMXzZrAe6ySMRf_szqmP_9dXGb3KoK7eTj2Dnw1Yl5kNaMQWr7YYKzghNdQ33mqaDyHzX9jC6xQMquKDlHKepoPm-z-hFRR78woQLtTR-mqhsq9Tv1BR8PT0B_LTGQg:1viP1Q:PECBE_9n6fhUz2lcix30njvSgv9XzpU5szveNicom08', '2026-02-04 03:36:44.670141');
INSERT INTO `django_session` VALUES ('gh38ohvoay6l1n05ou2vx7bhig73fid5', '.eJylU11v2jAU_StWnlqNGieEjLraA6KMdiUMQapq2qbKJDdg4dgsdkS7qv991-Wj7fa4PFj2vfecc7_yFAjnarloHNiAPwXSfq5NNYHt2CylDnhQCmUhaAWicSvQTubCSaMvhQN0RixKzlh4FsVZ2OHdcx7GlCXRB9bjjH0fpdnu9hPxyvNljxsPC_FtmzwHa8tG9d8xXwldKKgxmSA3Fd1KC0VDK6mNpbnRpVzSFyo6gwqqBdQp3FqotahgKqzdmrrYU6CI3Hg1Rhk9p5FXvZ0PZ_fjr6Pryf1lPxuidy4c-SI0iWJyKIEcEye-QIQ1qDBBBYz_0XTLiOEZxp3d6f0CPan5LZUS7S5l5ORO6sJsLZlkxOtfEDQk8QV5SOJT0t9sFNzB4ka6drfzkXYScnJzlaXjFlFyDWQE-dqcksEKRwHtsNOjvgRG5qIUtTxAhsXy1ec7Kqq_ejl3OKYK396cgluZAvNsas2NsNJy3zTLXc7n_XTMQ8q4qHij7QZyWUookDSvofCEQu1nlz6-Nn4gNi5ficExxrdCFi-LwXosThiL_lmdYx7_P15l9DKDunpf9Qx-NWBdZtagEVu8WWJUcEJqqK-91TSfQua_sIXXKRicig9Syvk27We--xFaQbEzLwHhQh2sbxYq-zb1CxUFz89_ACg_FGY:1vjX81:e8GrfNvMI8MHRrPGSw5JaZqEf4n8PozJYeOMr7B7ITE', '2026-02-07 06:28:13.149225');
INSERT INTO `django_session` VALUES ('jaxejo1xsy63peaamxzcded6zl3q9ddc', '.eJylU1tv2jAU_itWnlqNGicESl3tAVFGuxKGIFU1bVNlkhOwcOzMF7Gu6n-fXS5tt8flwbLP7Tvn-06eImat5ktnwUT0KeLmk1b1FLYTteIyopHVDqJWxJxdg7S8YJYrecUseF9Ckt4Zic-SNI9T2u3TJMZJev6B9Ckh38ZZvrv98PkilMsfm5AW-7dxRQHGVE4M3lW-ZrIUoH0vUaFqvOUGSodrLpXBhZIVX-GXUngONdRL0BncGdCS1TBjxmyVLvclPAhvAhrBBF_gJKDeLUbzh8mX8c304WqQj7x3wSz6zCRKUnQYAR0bR2FAn-Y8wtQj-PjvrlslxJ9x2tmdwc-8J1O_uRCs3cUEndxzWaqtQdMcBfxL5A299BL96qWnaNA0Au5hecttu9s5x50eOrm9zrNJCwm-ATSGYqNO0XDtlYB23OnjMAJBC1YxzQ8po3L16guMsvovLhfWy1T7dzBnYNeq9H06LalihhsaSDPUFnQxyCY0xoSymjppGih4xaH0RQsNZSjIxF677PGV-CFrbLFmw2NMoIKXL4tB-iTtEZL8szrHPv5fXqHkKgddv596Dj8dGJurDUifG6AqJkxYYo9gGZegb4JVuY8xCV_c8tcZKK9KCBLCBpr2mu_-g1ZU7swr8OlMHKxvFir_OgsLlUTPz38AMBcUHA:1vjXbA:88t4-RcOAbb87sbyNgZad9NylyU-CWIjlETnP5RlJDk', '2026-02-07 06:58:20.243434');
INSERT INTO `django_session` VALUES ('k8ln8sodjkyrlrkblmxfk061h219zke2', '.eJylU1tv2jAU_itWnlqNGieElLraA6KMdiUMQapq2qbKJCdg4djMF9Gu6n-fXS5dt8flwbLP7Tvn-06eI2at5gtnwUT0OeLmk1bNBLZjteQyopHVDqJWxJxdgbS8ZJYrecUseF9CkuyMxGdJWsRd2o0pucDnvewD6VFCvo3yYnf74fNFKFc8bUJa7N_GlSUYUzvRf1f5mslKgPa9RKVq8JYbqBxuuFQGl0rWfIlfS-EZNNAsQOdwZ0BL1sCUGbNVutqX8CB8E9AIJvgCJwH1bj6cPYy_jG4mD1f9Yui9c2bRZyZRkqLDCOjYOAoD-jTnESYewcd_d906If6M087uDH7mPbn6xYVg7S4m6OSey0ptDZoUKOBfIm_I0kv0mKWnqL_ZCLiHxS237W7nHHcydHJ7XeTjFhJ8DWgE5VqdosHKKwHtuNPDYQSC5qxmmh9ShtXyzRcYZc1fXM6tl6nx72DOwa5U5ft0WlLFDDc0kGaoLem8n49pjAllDXXSbKDkNYfKFy01VKEgE3vt8qc34gdsY8sVGxxjAhW8el0M0iNpRkjyz-oc-_h_eYWSywJ0837qGfx0YGyh1iB9boCqmTBhiT2CZVyCvglW5T7GJHxxy1-noLwqIUgIG2jaa777D1pRtTMvwaczcbD-sVDF12lYqCR6efkNSBMUJA:1vjYQF:W1zPsIId-dlOqn3SrrORFMwtksdlBzdb-VdIIK3aOFo', '2026-02-07 07:51:07.959455');
INSERT INTO `django_session` VALUES ('kl644gqn7ss8ufeeape8csjyxg8qm5pp', '.eJylU99v2jAQ_lesPLUaDU6AlLnaA6KUdiUMQapq2qbKJBewcOzMdsS6qv_7zuVH2-1xebDsu_vuu_vu8hRw54xYNg5swJ4CYa-MrqawneiVUAELSi4tBK2AN24NyomcO6HVJXeAzpjGyRmNzuJOFp0zmrBOP-x1ex9on1H6bZxmu9sPxEufL3usPSzCt23yHKwtGzl4l_maq0KCwWKCXFfhVlgomrASStsw16oUq_AlVTiHCqolmBTuLBjFK5hxa7faFPsUSCJqz0ZDGn4MY896txjNHyZfxjfTh8tBNkLvlRHkM1ck7pBDC-RYOPENIqxBhikyYPz3plfGFM-o29md3s_Rk-rfQkre7oWUnNwLVeitJdOMeP4Lgoake0F-Jd1TMqhrCfewvBWu3euch52EnNxeZ-mkRaTYABlDvtGnZLjGUUA7QlF9C5QseMmNOEBGxerV5xXl1V9aLhyOqcK3N6fg1rrAOhujmOZWWOZFs8zlbDFIJywKKeMVa5StIRelgAKT5gYKn5DL_ezSx1fhh7x2-ZoPjzFeClG8LAbt025CafzP6hzr-P_xSq1WGZjqfddz-NmAdZnegEJs8WaJkcFxocDceKtuPkXUf1ELrzPQOBUfJKXzMu1nvvsRWkGxM68A4VwerG8WKvs68wsVB8_PfwAvNhRn:1vjDQJ:XZo6srNTVIoZXVKwnXIpebSMgokqOdnJj8Go2G3CA6k', '2026-02-06 09:25:47.690184');
INSERT INTO `django_session` VALUES ('kmwqy9890abfnt3dgo28797gjl7gzzat', '.eJylU1tv2jAU_itWnlqNGieElLraA6KMdiUMQapq2qbKJCdg4djMF9Gu6n-fXS5dt8flwbLP7Tvn-06eI2at5gtnwUT0OeLmk1bNBLZjteQyopHVDqJWxJxdgbS8ZJYrecUseF9CkuyMxGdJWsRdml5Q0sFxdv6B9Cgh30Z5sbv98PkilCueNiEt9m_jyhKMqZ3ov6t8zWQlQPteolI1eMsNVA43XCqDSyVrvsSvpfAMGmgWoHO4M6Ala2DKjNkqXe1LeBC-CWgEE3yBk4B6Nx_OHsZfRjeTh6t-MfTeObPoM5MoSdFhBHRsHIUBfZrzCBOP4OO_u26dEH_GaWd3Bj_znlz94kKwdhcTdHLPZaW2Bk0KFPAvkTdk6SV6zNJT1N9sBNzD4pbbdrdzjjsZOrm9LvJxCwm-BjSCcq1O0WDllYB23OnhMAJBc1YzzQ8pw2r55guMsuYvLufWy9T4dzDnYFeq8n06LalihhsaSDPUlnTez8c0xoSyhjppNlDymkPli5YaqlCQib12-dMb8QO2seWKDY4xgQpevS4G6ZE0IyT5Z3WOffy_vELJZQG6eT_1DH46MLZQa5A-N0DVTJiwxB7BMi5B3wSrch9jEr645a9TUF6VECSEDTTtNd_9B62o2pmX4NOZOFj_WKji6zQsVBK9vPwGOGgUHw:1vjYOD:e630X943wFmgc_TuNOET2unyc5j0NF3jLlI9VAwxJGs', '2026-02-07 07:49:01.957523');
INSERT INTO `django_session` VALUES ('kqt70xxpa5n2s2jh7kkxkfhzytazs7oq', '.eJylU11v2jAU_StWnlqNGieEjLraA6KMdiUMQapq2qbKJDdg4dgsdkS7qv991-Wj7fa4PFj2vfecc7_yFAjnarloHNiAPwXSfq5NNYHt2CylDnhQCmUhaAWicSvQTubCSaMvhQN0RixKzlh4FsVZ2OHdcx7GlCXRB9bjjH0fpdnu9hPxyvNljxsPC_FtmzwHa8tG9d8xXwldKKgxmSA3Fd1KC0VDK6mNpbnRpVzSFyo6gwqqBdQp3FqotahgKqzdmrrYU6CI3Hg1Rhk9p5FXvZ0PZ_fjr6Pryf1lPxuidy4c-SI0iWJyKIEcEye-QIQ1qDBBBYz_0XTLiOEZxp3d6f0CPan5LZUS7S5l5ORO6sJsLZlkxOtfEDQk8QV5SOJT0t9sFNzB4ka6drfzkXYScnJzlaXjFlFyDWQE-dqcksEKRwHtsNOjvgRG5qIUtTxAhsXy1ec7Kqq_ejl3OKYK396cgluZAvNsas2NsNJy3zTLXc7n_XTMQ8q4qHij7QZyWUookDSvofCEQu1nlz6-Nn4gNi5ficExxrdCFi-LwXosThiL_lmdYx7_P15l9DKDunpf9Qx-NWBdZtagEVu8WWJUcEJqqK-91TSfQua_sIXXKRicig9Syvk27We--xFaQbEzLwHhQh2sbxYq-zb1CxUFz89_ACg_FGY:1vjXL4:HVRc2IJeoPaZ57cR41Qwq3lh8grTooG9NJxN3_vtmA0', '2026-02-07 06:41:42.311252');
INSERT INTO `django_session` VALUES ('lcg9dgdyhssjiu0vysv00m37fews13sl', '.eJylU11v2jAU_StWnlqNGicERl3tAVFGuxKGIFU1bVNlkhuwcOwsdsS6qv-91-Wj7fa4PFj2vfecc7_yGAjnarlsHNiAPwbSfq5NOYXtxKykDnhQCGUhaAWicWvQTmbCSaMvhQN0RizqnbHwLIrTMObdiHdjGkfRB9bnjH0fJ-nu9hPxyvOlD5WHhfi2TZaBtUWjBu-Yr4TOFdSYTJCZkm6lhbyhpdTG0szoQq7oCxWdQwnlEuoEbi3UWpQwE9ZuTZ3vKVBEVl6NUUbPaeRVbxej-f3k6_h6en85SEfoXQhHvghNopgcSiDHxIkvEGENKkxRAeN_NN0iYniGcWd3er9AT2L-SKVEu0sZObmTOjdbS6Yp8foXBA29-IL87sWnZFBVCu5geSNdu9v5SDs9cnJzlSaTFlFyA2QM2cackuEaRwHtsNOnvgRGFqIQtTxARvnq1ec7Ksq_erlwOKYS396cgFubHPNsas2NsNJy3zTLXcYXg2TCQ8q4KHmjbQWZLCTkSJrVkHtCofazSx5eGz8UlcvWYniM8a2Q-ctisD6Le4xF_6zOMY__H68yepVCXb6veg6_GrAuNRvQiM3fLDEqOCE11NfeappPIfNf2MLrDAxOxQcp5Xyb9jPf_QitIN-ZV4BwoQ7WNwuVfpv5hYqCp6dnHZsUYg:1vjXY0:IroQQM4O7VoMsKJHSPOE5_7uzIG5a18rj4h1eFiK4hI', '2026-02-07 06:55:04.654481');
INSERT INTO `django_session` VALUES ('m0xv4vvkzcri6wp3h7usr0i44dsb7xnx', '.eJylU11v2jAU_StWnlqNGieEjLraA6KMdiUMQapq2qbKJDdg4dgsdkS7qv991-Wj7fa4PFj2vfecc7_yFAjnarloHNiAPwXSfq5NNYHt2CylDnhQCmUhaAWicSvQTubCSaMvhQN0RixKzlh4FsVZ2OHdcx7GlCXRB9bjjH0fpdnu9hPxyvNljxsPC_FtmzwHa8tG9d8xXwldKKgxmSA3Fd1KC0VDK6mNpbnRpVzSFyo6gwqqBdQp3FqotahgKqzdmrrYU6CI3Hg1Rhk9p5FXvZ0PZ_fjr6Pryf1lPxuidy4c-SI0iWJyKIEcEye-QIQ1qDBBBYz_0XTLiOEZxp3d6f0CPan5LZUS7S5l5ORO6sJsLZlkxOtfEDQk8QV5SOJT0t9sFNzB4ka6drfzkXYScnJzlaXjFlFyDWQE-dqcksEKRwHtsNOjvgRG5qIUtTxAhsXy1ec7Kqq_ejl3OKYK396cgluZAvNsas2NsNJy3zTLXc7n_XTMQ8q4qHij7QZyWUookDSvofCEQu1nlz6-Nn4gNi5ficExxrdCFi-LwXosThiL_lmdYx7_P15l9DKDunpf9Qx-NWBdZtagEVu8WWJUcEJqqK-91TSfQua_sIXXKRicig9Syvk27We--xFaQbEzLwHhQh2sbxYq-zb1CxUFz89_ACg_FGY:1vjXOH:afFEOR1yn3YcEud_CK8iRJR59GatRMUiazI_IR9koGo', '2026-02-07 06:45:01.200324');
INSERT INTO `django_session` VALUES ('mccjfy4bdn6dpw4l214okwwz3kibs2go', '.eJylU1tv2jAU_itWnlqNGicEylLtAVHWdiUMQapq2qbKJCdg4djMF7Gu6n_fcbl03R6XB8s-t--c7zt5irhzRiy8AxtlT5GwH41uJrAd66VQURY54yFqRdy7FSgnSu6EVpfcAfoSlvTOWHyWpEXczVg_S1Iap-fv8MbY16u82N2-Y74M5YrHTUiL8W19WYK1tZeDN5WvuaokGOwlKnVDt8JC5WkjlLa01KoWS_pSis6ggWYBJoc7C0bxBqbc2q021b4EgohNQGOU0fc0Cah389HsYfz56mbycDkoRuidc0c-cUWSlBxGIMfGSRgQ0zwiTBAB47_5bp0wPOO0szuDn6Mn17-ElLzdpYyc3AtV6a0lk4IE_AuChl56QX720lMy2Gwk3MPiVrh2t3NOOz1ycntd5OMWkWIN5ArKtT4lwxUqAe2406dhBEbmvOZGHFJG1fLVFxjlzV9czh3K1OA7mHNwK11hn96oTHMrbBZIs5krs_kgH2cxZRlvMq_sBkpRC6iwaGmgCgW53GuXP74SP-QbV6748BgTqBDVy2KwPkt7jCX_rM6xj_-XV2q1LMA0b6eewQ8P1hV6DQpzA1TNpQ1LjAiOCwXmJli1_xCz8MUtvE5BoyohSEoXaNprvvsPWlG1My8B07k8WP9YqOLLNCxUEj0__wYnrhQZ:1vjXks:0ZWZp_KvblzXK9jNTnPhe25uDhwCpJ6L8maSWDNQ7GI', '2026-02-07 07:08:22.431150');
INSERT INTO `django_session` VALUES ('njblgeuiqg76pz7ybc60hjhd8i4thxck', '.eJylU11v2jAU_StWnlqNGieEjLraA6KMdiUMQapq2qbKJDdg4dgsdkS7qv991-Wj7fa4PFj2vfecc7_yFAjnarloHNiAPwXSfq5NNYHt2CylDnhQCmUhaAWicSvQTubCSaMvhQN0RixKzlh4FsVZ2OHdcx7GlCXRB9bjjH0fpdnu9hPxyvNljxsPC_FtmzwHa8tG9d8xXwldKKgxmSA3Fd1KC0VDK6mNpbnRpVzSFyo6gwqqBdQp3FqotahgKqzdmrrYU6CI3Hg1Rhk9p5FXvZ0PZ_fjr6Pryf1lPxuidy4c-SI0iWJyKIEcEye-QIQ1qDBBBYz_0XTLiOEZxp3d6f0CPan5LZUS7S5l5ORO6sJsLZlkxOtfEDQk8QV5SOJT0t9sFNzB4ka6drfzkXYScnJzlaXjFlFyDWQE-dqcksEKRwHtsNOjvgRG5qIUtTxAhsXy1ec7Kqq_ejl3OKYK396cgluZAvNsas2NsNJy3zTLXc7n_XTMQ8q4qHij7QZyWUookDSvofCEQu1nlz6-Nn4gNi5ficExxrdCFi-LwXosThiL_lmdYx7_P15l9DKDunpf9Qx-NWBdZtagEVu8WWJUcEJqqK-91TSfQua_sIXXKRicig9Syvk27We--xFaQbEzLwHhQh2sbxYq-zb1CxUFz89_ACg_FGY:1vjXU8:yLAsENetNeJONBGNQ2iYTewt9yAqXV7D-1cQADJ1w3A', '2026-02-07 06:51:04.865373');
INSERT INTO `django_session` VALUES ('oeysyis0e6eukwsvbs3xv48rp9rno1ul', '.eJylU11v2jAU_StWnlqNGieEjLraA6KMdiUMQapq2qbKJDdg4dgsdkS7qv991-Wj7fa4PFj2vfecc7_yFAjnarloHNiAPwXSfq5NNYHt2CylDnhQCmUhaAWicSvQTubCSaMvhQN0RixKzlh4FsVZ2OHdcx7GlCXRB9bjjH0fpdnu9hPxyvNljxsPC_FtmzwHa8tG9d8xXwldKKgxmSA3Fd1KC0VDK6mNpbnRpVzSFyo6gwqqBdQp3FqotahgKqzdmrrYU6CI3Hg1Rhk9p5FXvZ0PZ_fjr6Pryf1lPxuidy4c-SI0iWJyKIEcEye-QIQ1qDBBBYz_0XTLiOEZxp3d6f0CPan5LZUS7S5l5ORO6sJsLZlkxOtfEDQk8QV5SOJT0t9sFNzB4ka6drfzkXYScnJzlaXjFlFyDWQE-dqcksEKRwHtsNOjvgRG5qIUtTxAhsXy1ec7Kqq_ejl3OKYK396cgluZAvNsas2NsNJy3zTLXc7n_XTMQ8q4qHij7QZyWUookDSvofCEQu1nlz6-Nn4gNi5ficExxrdCFi-LwXosThiL_lmdYx7_P15l9DKDunpf9Qx-NWBdZtagEVu8WWJUcEJqqK-91TSfQua_sIXXKRicig9Syvk27We--xFaQbEzLwHhQh2sbxYq-zb1CxUFz89_ACg_FGY:1vjXD6:FNlLdke4bjjFZjCSHcegOigiK93z3RF1FnDW2xN2p6U', '2026-02-07 06:33:28.713303');
INSERT INTO `django_session` VALUES ('oi08d38use9ro9fykcm8nfsvrqnzd34o', '.eJylU11v2jAU_StWnlqNGieEjLraA6KMdiUMQapq2qbKJDdg4dgsdkS7qv991-Wj7fa4PFj2vfecc7_yFAjnarloHNiAPwXSfq5NNYHt2CylDnhQCmUhaAWicSvQTubCSaMvhQN0RixKzlh4FsVZ2OHdcx7GlCXRB9bjjH0fpdnu9hPxyvNljxsPC_FtmzwHa8tG9d8xXwldKKgxmSA3Fd1KC0VDK6mNpbnRpVzSFyo6gwqqBdQp3FqotahgKqzdmrrYU6CI3Hg1Rhk9p5FXvZ0PZ_fjr6Pryf1lPxuidy4c-SI0iWJyKIEcEye-QIQ1qDBBBYz_0XTLiOEZxp3d6f0CPan5LZUS7S5l5ORO6sJsLZlkxOtfEDQk8QV5SOJT0t9sFNzB4ka6drfzkXYScnJzlaXjFlFyDWQE-dqcksEKRwHtsNOjvgRG5qIUtTxAhsXy1ec7Kqq_ejl3OKYK396cgluZAvNsas2NsNJy3zTLXc7n_XTMQ8q4qHij7QZyWUookDSvofCEQu1nlz6-Nn4gNi5ficExxrdCFi-LwXosThiL_lmdYx7_P15l9DKDunpf9Qx-NWBdZtagEVu8WWJUcEJqqK-91TSfQua_sIXXKRicig9Syvk27We--xFaQbEzLwHhQh2sbxYq-zb1CxUFz89_ACg_FGY:1vjXVG:4yIuqiQE2frChqn6pby-NhGShdds79Nastur88NiyLc', '2026-02-07 06:52:14.866582');
INSERT INTO `django_session` VALUES ('q2k1xe0nagz9ay1ag31oeq8gn3qgn6e9', '.eJylU11v2jAU_StWnlqNGieEjLraA6KMdiUMQapq2qbKJDdg4dgsdkS7qv991-Wj7fa4PFj2vfecc7_yFAjnarloHNiAPwXSfq5NNYHt2CylDnhQCmUhaAWicSvQTubCSaMvhQN0RixKzlh4FsVZ2OXsnMchjZLoA-txxr6P0mx3-4l45fmyx42Hhfi2TZ6DtWWj-u-Yr4QuFNSYTJCbim6lhaKhldTG0tzoUi7pCxWdQQXVAuoUbi3UWlQwFdZuTV3sKVBEbrwao4ye08ir3s6Hs_vx19H15P6ynw3ROxeOfBGaRDE5lECOiRNfIMIaVJigAsb_aLplxPAM487u9H6BntT8lkqJdpcycnIndWG2lkwy4vUvCBqS-II8JPEp6W82Cu5gcSNdu9v5SDsJObm5ytJxiyi5BjKCfG1OyWCFo4B22OlRXwIjc1GKWh4gw2L56vMdFdVfvZw7HFOFb29Owa1MgXk2teZGWGm5b5rlLufzfjrmIWVcVLzRdgO5LCUUSJrXUHhCofazSx9fGz8QG5evxOAY41shi5fFYD0WJ4xF_6zOMY__H68yeplBXb2vega_GrAuM2vQiC3eLDEqOCE11NfeappPIfNf2MLrFAxOxQcp5Xyb9jPf_QitoNiZl4BwoQ7WNwuVfZv6hYqC5-c_HmIUYg:1vjXu5:RMy5qOu75_GWM2KmdoPMB04YlhYXt6ThYxjZvS174jg', '2026-02-07 07:17:53.467699');
INSERT INTO `django_session` VALUES ('r3hm0wga4pa4xp8jzebkis3vmjz6u747', '.eJylU11v2jAU_StWnlqNGieEjLraA6KMdiUMQapq2qbKJDdg4dgsdkS7qv991-Wj7fa4PFj2vfecc7_yFAjnarloHNiAPwXSfq5NNYHt2CylDnhQCmUhaAWicSvQTubCSaMvhQN0RixKzlh4FsVZ2OHdcx7GlCXRB9bjjH0fpdnu9hPxyvNljxsPC_FtmzwHa8tG9d8xXwldKKgxmSA3Fd1KC0VDK6mNpbnRpVzSFyo6gwqqBdQp3FqotahgKqzdmrrYU6CI3Hg1Rhk9p5FXvZ0PZ_fjr6Pryf1lPxuidy4c-SI0iWJyKIEcEye-QIQ1qDBBBYz_0XTLiOEZxp3d6f0CPan5LZUS7S5l5ORO6sJsLZlkxOtfEDQk8QV5SOJT0t9sFNzB4ka6drfzkXYScnJzlaXjFlFyDWQE-dqcksEKRwHtsNOjvgRG5qIUtTxAhsXy1ec7Kqq_ejl3OKYK396cgluZAvNsas2NsNJy3zTLXc7n_XTMQ8q4qHij7QZyWUookDSvofCEQu1nlz6-Nn4gNi5ficExxrdCFi-LwXosThiL_lmdYx7_P15l9DKDunpf9Qx-NWBdZtagEVu8WWJUcEJqqK-91TSfQua_sIXXKRicig9Syvk27We--xFaQbEzLwHhQh2sbxYq-zb1CxUFz89_ACg_FGY:1vjXKl:CJvjqZ0QfilufXdavBHzHMatcVB6h9XDIw0H3CllqD8', '2026-02-07 06:41:23.018409');
INSERT INTO `django_session` VALUES ('rb7tnyxbt5swnzmcua8vpcqyxtq9c35l', '.eJylU1tv2jAU_itWnlqNGieEy1ztAVFGuxKGIFU1bVNlkhOwcOzMF7Gu6n-fXS5dt8flwbLP7Tvn-06eImat5itnwUT0KeLmo1b1DHZTteYyopHVDqJWxJzdgLS8YJYrecUseF9Ckt4FiS-SNI-7tJPSNMZpv_-ODCghXydZvr999_kilMsfm5AW-7dxRQHGVE4M31S-ZrIUoH0vUaFqvOMGSodrLpXBhZIVX-OXUngBNdQr0BncGdCS1TBnxuyULg8lPAhvAhrBBL_HSUC9W44XD9PPk5vZw9UwH3vvkln0iUmUpOg4Ajo1jsKAPs15hJlH8PHfXLdKiD_jtLM_g595T6Z-cSFYu4sJOrvnslQ7g2Y5CviXyBt66SX62UvP0bBpBNzD6pbbdrfTx50eOru9zrNpCwm-BTSBYqvO0WjjlYB23BngMAJBS1YxzY8p43L96guMsvovLpfWy1T7dzBnYDeq9H06LalihhsaSDPUFnQ5zKY0xoSymjppGih4xaH0RQsNZSjIxEG77PGV-BFrbLFho1NMoIKXL4tBBiTtEZL8szqnPv5fXqHkOgddv516AT8cGJurLUifG6AqJkxYYo9gGZegb4JVuQ8xCV_c8tc5KK9KCBLCBpoOmu__g1ZU7s1r8OlMHK1_LFT-ZR4WKomen38DLzUUGw:1vjYAJ:xrjhAkH9kotl6sXFj9JpyKIL64z6x3ZVRuTnp2ejLcg', '2026-02-07 07:34:39.711283');
INSERT INTO `django_session` VALUES ('rbeu1rktq9dfpqi3ub98v7jyceiv6vxb', '.eJylU11v2jAU_StWnlqNGieEjLraA6KMdiUMQapq2qbKJDdg4dgsdkS7qv991-Wj7fa4PFj2vfecc7_yFAjnarloHNiAPwXSfq5NNYHt2CylDnhQCmUhaAWicSvQTubCSaMvhQN0RixKzlh4FsVZ2OHdcx7GlCXRB9bjjH0fpdnu9hPxyvNljxsPC_FtmzwHa8tG9d8xXwldKKgxmSA3Fd1KC0VDK6mNpbnRpVzSFyo6gwqqBdQp3FqotahgKqzdmrrYU6CI3Hg1Rhk9p5FXvZ0PZ_fjr6Pryf1lPxuidy4c-SI0iWJyKIEcEye-QIQ1qDBBBYz_0XTLiOEZxp3d6f0CPan5LZUS7S5l5ORO6sJsLZlkxOtfEDQk8QV5SOJT0t9sFNzB4ka6drfzkXYScnJzlaXjFlFyDWQE-dqcksEKRwHtsNOjvgRG5qIUtTxAhsXy1ec7Kqq_ejl3OKYK396cgluZAvNsas2NsNJy3zTLXc7n_XTMQ8q4qHij7QZyWUookDSvofCEQu1nlz6-Nn4gNi5ficExxrdCFi-LwXosThiL_lmdYx7_P15l9DKDunpf9Qx-NWBdZtagEVu8WWJUcEJqqK-91TSfQua_sIXXKRicig9Syvk27We--xFaQbEzLwHhQh2sbxYq-zb1CxUFz89_ACg_FGY:1vjXJg:DfWmN4kHy_QKdk2oZugl3j_tgNRQGM6PO9csgOiS210', '2026-02-07 06:40:16.025126');
INSERT INTO `django_session` VALUES ('ulzvvpmof4ejxbn3ztigiv9rb8qorqi3', '.eJylU11v2jAU_StWnlqNGieEjLraA6KMdiUMQapq2qbKJDdg4dgsdkS7qv991-Wj7fa4PFj2vfecc7_yFAjnarloHNiAPwXSfq5NNYHt2CylDnhQCmUhaAWicSvQTubCSaMvhQN0RixKzlh4FsVZ2OHdcx7GlCXRB9bjjH0fpdnu9hPxyvNljxsPC_FtmzwHa8tG9d8xXwldKKgxmSA3Fd1KC0VDK6mNpbnRpVzSFyo6gwqqBdQp3FqotahgKqzdmrrYU6CI3Hg1Rhk9p5FXvZ0PZ_fjr6Pryf1lPxuidy4c-SI0iWJyKIEcEye-QIQ1qDBBBYz_0XTLiOEZxp3d6f0CPan5LZUS7S5l5ORO6sJsLZlkxOtfEDQk8QV5SOJT0t9sFNzB4ka6drfzkXYScnJzlaXjFlFyDWQE-dqcksEKRwHtsNOjvgRG5qIUtTxAhsXy1ec7Kqq_ejl3OKYK396cgluZAvNsas2NsNJy3zTLXc7n_XTMQ8q4qHij7QZyWUookDSvofCEQu1nlz6-Nn4gNi5ficExxrdCFi-LwXosThiL_lmdYx7_P15l9DKDunpf9Qx-NWBdZtagEVu8WWJUcEJqqK-91TSfQua_sIXXKRicig9Syvk27We--xFaQbEzLwHhQh2sbxYq-zb1CxUFz89_ACg_FGY:1vjX25:S-SIJ2B9DLydDzBxfRn7a1lXFczH0parjpGB_QXKJAg', '2026-02-07 06:22:05.188345');
INSERT INTO `django_session` VALUES ('wcf582g4j8jptwxe40jf77bgj3vicqhp', '.eJylU11v2jAU_StWnlqNGieEjLraA6KMdiUMQapq2qbKJDdg4dgsdkS7qv991-Wj7fa4PFj2vfecc7_yFAjnarloHNiAPwXSfq5NNYHt2CylDnhQCmUhaAWicSvQTubCSaMvhQN0RixKzlh4FsVZ2OHdcx7GlCXRB9bjjH0fpdnu9hPxyvNljxsPC_FtmzwHa8tG9d8xXwldKKgxmSA3Fd1KC0VDK6mNpbnRpVzSFyo6gwqqBdQp3FqotahgKqzdmrrYU6CI3Hg1Rhk9p5FXvZ0PZ_fjr6Pryf1lPxuidy4c-SI0iWJyKIEcEye-QIQ1qDBBBYz_0XTLiOEZxp3d6f0CPan5LZUS7S5l5ORO6sJsLZlkxOtfEDQk8QV5SOJT0t9sFNzB4ka6drfzkXYScnJzlaXjFlFyDWQE-dqcksEKRwHtsNOjvgRG5qIUtTxAhsXy1ec7Kqq_ejl3OKYK396cgluZAvNsas2NsNJy3zTLXc7n_XTMQ8q4qHij7QZyWUookDSvofCEQu1nlz6-Nn4gNi5ficExxrdCFi-LwXosThiL_lmdYx7_P15l9DKDunpf9Qx-NWBdZtagEVu8WWJUcEJqqK-91TSfQua_sIXXKRicig9Syvk27We--xFaQbEzLwHhQh2sbxYq-zb1CxUFz89_ACg_FGY:1vjXCZ:JTUZNAwLcWWZ9RLRUfINjHIo60M9wdM3fBnSwsLfzDs', '2026-02-07 06:32:55.106847');
INSERT INTO `django_session` VALUES ('xxnbcvql2kvxub2a2xnmlq9e9pa9m9rc', '.eJylU11v2jAU_StWnlqNGicERl3tAVFGuxKGIFU1bVNlkhuwcOwsdsS6qv-91-Wj7fa4PFj2vfecc7_yGAjnarlsHNiAPwbSfq5NOYXtxKykDnhQCGUhaAWicWvQTmbCSaMvhQN0RizqnbHwLIrTMObdiHdjGkfRB9bnjH0fJ-nu9hPxyvOlD5WHhfi2TZaBtUWjBu-Yr4TOFdSYTJCZkm6lhbyhpdTG0szoQq7oCxWdQwnlEuoEbi3UWpQwE9ZuTZ3vKVBEVl6NUUbPaeRVbxej-f3k6_h6en85SEfoXQhHvghNopgcSiDHxIkvEGENKkxRAeN_NN0iYniGcWd3er9AT2L-SKVEu0sZObmTOjdbS6Yp8foXBA29-IL87sWnZFBVCu5geSNdu9v5SDs9cnJzlSaTFlFyA2QM2cackuEaRwHtsNOnvgRGFqIQtTxARvnq1ec7Ksq_erlwOKYS396cgFubHPNsas2NsNJy3zTLXcYXg2TCQ8q4KHmjbQWZLCTkSJrVkHtCofazSx5eGz8UlcvWYniM8a2Q-ctisD6Le4xF_6zOMY__H68yepVCXb6veg6_GrAuNRvQiM3fLDEqOCE11NfeappPIfNf2MLrDAxOxQcp5Xyb9jPf_QitIN-ZV4BwoQ7WNwuVfpv5hYqCp6dnHZsUYg:1vjXWK:Drj6HqOiCCPV-LUhrK-5QVGX3o_csH-e0xQxxwTBhCc', '2026-02-07 06:53:20.025941');
INSERT INTO `django_session` VALUES ('yn2r735l3fh3v1lmlecbeyg33icgql8w', '.eJylU11v2jAU_StWnlqNGieEjLraA6KMdiUMQapq2qbKJDdg4dgsdkS7qv991-Wj7fa4PFj2vfecc7_yFAjnarloHNiAPwXSfq5NNYHt2CylDnhQCmUhaAWicSvQTubCSaMvhQN0RixKzlh4FsVZ2OHdcx7GlCXRB9bjjH0fpdnu9hPxyvNljxsPC_FtmzwHa8tG9d8xXwldKKgxmSA3Fd1KC0VDK6mNpbnRpVzSFyo6gwqqBdQp3FqotahgKqzdmrrYU6CI3Hg1Rhk9p5FXvZ0PZ_fjr6Pryf1lPxuidy4c-SI0iWJyKIEcEye-QIQ1qDBBBYz_0XTLiOEZxp3d6f0CPan5LZUS7S5l5ORO6sJsLZlkxOtfEDQk8QV5SOJT0t9sFNzB4ka6drfzkXYScnJzlaXjFlFyDWQE-dqcksEKRwHtsNOjvgRG5qIUtTxAhsXy1ec7Kqq_ejl3OKYK396cgluZAvNsas2NsNJy3zTLXc7n_XTMQ8q4qHij7QZyWUookDSvofCEQu1nlz6-Nn4gNi5ficExxrdCFi-LwXosThiL_lmdYx7_P15l9DKDunpf9Qx-NWBdZtagEVu8WWJUcEJqqK-91TSfQua_sIXXKRicig9Syvk27We--xFaQbEzLwHhQh2sbxYq-zb1CxUFz89_ACg_FGY:1vjXLT:MPl1lIEfbRlvudxxzi_g0iDcEMjQ_nnZNVzwULPNleI', '2026-02-07 06:42:07.616778');
INSERT INTO `django_session` VALUES ('z5m5v4p1usvr6p7avf1mp2mdarhwpz67', 'eyJDQVNORVhUIjoiL2FwaS91c2VyL2Nhcy9sb2dpbiJ9:1viB7k:TvlXA657wwoH88fhDDgurp5tkwZuxEzUhI1rW43DnUc', '2026-02-03 12:46:20.661834');
INSERT INTO `django_session` VALUES ('zu84i6j6emuurwmw7i6iehu8uwyp3pfv', '.eJylU1tv2jAU_itWnlqNGieEjLnaA6KMdiUMlVTVtE2VSU7AwrEzX0S7qv99drl03R6XB8s-t--c7zt5ipi1mi-dBRPRp4ibT1o1M9hO1YrLiEZWO4g6EXN2DdLyklmu5AWz4H0JSbIzEp8laRH3Kcko6eM4Td6RASXk2yQvdrcfPl-EcsVjG9Ji_zauLMGY2onhm8qXTFYCtO8lKlWDt9xA5XDDpTK4VLLmK_xSCt9AA80SdA63BrRkDcyZMVulq30JD8LbgEYwwR9wElBvF-Ob--mXydXs_mJYjL13wSz6zCRKUnQYAR0bR2FAn-Y8wswj-Pjvrl8nxJ9x2tudwc-8J1e_uBCs28cEndxxWamtQbMCBfxz5A1Zeo4esvQUDdtWwB0sr7nt9nvvcS9DJ9eXRT7tIME3gCZQbtQpGq29EtCNewMcRiBowWqm-SFlXK1efYFR1vzF5cJ6mRr_DuYc7FpVvk-nJVXMcEMDaYbaki6G-ZTGmFDWUCdNCyWvOVS-aKmhCgWZ2GuXP74SP2KtLddsdIwJVPDqZTHIgKQZIck_q3Ps4__lFUquCtDN26lv4KcDYwu1AelzA1TNhAlL7BEs4xL0VbAq9zEm4Ys7_joH5VUJQULYQNNe891_0ImqnXkFPp2Jg_WPhSq-zsNCJdHz828IuRQO:1vjXie:PTg2oxSKo2LZh7CwmstQUL-7b7Keyb6p6tb-6b0_-k0', '2026-02-07 07:06:04.053786');

-- ----------------------------
-- Table structure for linkscanner_domain
-- ----------------------------
DROP TABLE IF EXISTS `linkscanner_domain`;
CREATE TABLE `linkscanner_domain`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `ctime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of linkscanner_domain
-- ----------------------------

-- ----------------------------
-- Table structure for menu_menu
-- ----------------------------
DROP TABLE IF EXISTS `menu_menu`;
CREATE TABLE `menu_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `closable` tinyint(1) NOT NULL,
  `meta_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `path` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `order` int NOT NULL,
  `describe` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `parent_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `menu_menu_parent_id_a0981d51_fk_menu_menu_id`(`parent_id` ASC) USING BTREE,
  CONSTRAINT `menu_menu_parent_id_a0981d51_fk_menu_menu_id` FOREIGN KEY (`parent_id`) REFERENCES `menu_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_menu
-- ----------------------------
INSERT INTO `menu_menu` VALUES (1, '资讯管理', 1, '1', 'HomeFilled', '/articleAdmin', 90, '资讯管理', NULL);
INSERT INTO `menu_menu` VALUES (2, '栏目组管理', 1, '3', 'Document', '/categoryGroupAdmin', 3, '栏目组管理', 1);
INSERT INTO `menu_menu` VALUES (4, '轮播图管理', 1, '1', 'Document', '/bannersAdmin', 4, '轮播图管理', 1);
INSERT INTO `menu_menu` VALUES (5, '分类管理', 1, '2', 'Document', '/categoryAdmin', 2, '分类管理', 1);
INSERT INTO `menu_menu` VALUES (6, '文章管理', 1, '4', 'Document', '/articlesAdmin', 1, '文章管理', 1);
INSERT INTO `menu_menu` VALUES (12, '用户管理', 1, '1', 'User', '/userAdmin', 20, '用户管理', NULL);
INSERT INTO `menu_menu` VALUES (13, '修改密码', 1, '2', 'Lock', '/changePassword', 5, '修改密码', 12);
INSERT INTO `menu_menu` VALUES (14, '用户管理', 1, '2', 'UserFilled', '/userAdmin', 10, '用户管理', 12);
INSERT INTO `menu_menu` VALUES (24, '权限管理', 1, '1', 'Avatar', '/roleAdmin', 20, '', NULL);
INSERT INTO `menu_menu` VALUES (25, '菜单管理', 1, '1', 'Menu', '/menuAdmin', 30, '', 24);
INSERT INTO `menu_menu` VALUES (26, '角色管理', 1, '2', 'Lollipop', '/roleAdmin', 20, '', 24);
INSERT INTO `menu_menu` VALUES (30, '薪资管理', 1, '2', 'Briefcase', '/Salary', 80, '薪资管理', NULL);
INSERT INTO `menu_menu` VALUES (31, '月份管理', 1, '1', 'Calendar', '/yearAndMonthAdmin', 90, '月份管理', 30);
INSERT INTO `menu_menu` VALUES (32, '应发管理', 1, '3', 'Memo', '/salaryYingFaAdmin', 80, '应发管理', 30);
INSERT INTO `menu_menu` VALUES (33, '扣款明细管理', 1, '1', 'CircleCloseFilled', '/salaryKouKuanAdmin', 70, '扣款明细管理', 30);

-- ----------------------------
-- Table structure for partyrank
-- ----------------------------
DROP TABLE IF EXISTS `partyrank`;
CREATE TABLE `partyrank`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sort` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of partyrank
-- ----------------------------
INSERT INTO `partyrank` VALUES (2, '党支部书记', 2);
INSERT INTO `partyrank` VALUES (3, '党总支书记', 5);

-- ----------------------------
-- Table structure for partys
-- ----------------------------
DROP TABLE IF EXISTS `partys`;
CREATE TABLE `partys`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sort` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `parent_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Partys_parent_id_76ca5643_fk_Partys_id`(`parent_id` ASC) USING BTREE,
  CONSTRAINT `Partys_parent_id_76ca5643_fk_Partys_id` FOREIGN KEY (`parent_id`) REFERENCES `partys` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of partys
-- ----------------------------
INSERT INTO `partys` VALUES ('5d1c561a3e8d4df3b01d80372726e333', '财经系党总支', 1, 1, '财经系党总支', NULL);
INSERT INTO `partys` VALUES ('a3a561e66acc48a595fcd33c38c755cb', '图书馆党支部', 2, 1, '', 'aba44dc448c84603b3a80cd9a49544bc');
INSERT INTO `partys` VALUES ('aba44dc448c84603b3a80cd9a49544bc', '教辅党总支', 2, 1, '', NULL);
INSERT INTO `partys` VALUES ('f1cb186603b447248f4ecb9e66faf61c', '信息网络中心党支部', 1, 1, '', 'aba44dc448c84603b3a80cd9a49544bc');

-- ----------------------------
-- Table structure for provinces
-- ----------------------------
DROP TABLE IF EXISTS `provinces`;
CREATE TABLE `provinces`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `province` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of provinces
-- ----------------------------
INSERT INTO `provinces` VALUES (3, '山西');
INSERT INTO `provinces` VALUES (4, '安徽');
INSERT INTO `provinces` VALUES (5, '福建');
INSERT INTO `provinces` VALUES (6, '江苏');
INSERT INTO `provinces` VALUES (7, '甘肃');
INSERT INTO `provinces` VALUES (8, '广东');
INSERT INTO `provinces` VALUES (9, '广西');
INSERT INTO `provinces` VALUES (10, '贵州');
INSERT INTO `provinces` VALUES (11, '海南');
INSERT INTO `provinces` VALUES (12, '黑龙江');
INSERT INTO `provinces` VALUES (13, '湖北');
INSERT INTO `provinces` VALUES (14, '湖南');
INSERT INTO `provinces` VALUES (15, '吉林');
INSERT INTO `provinces` VALUES (16, '河北');
INSERT INTO `provinces` VALUES (17, '江西');
INSERT INTO `provinces` VALUES (18, '辽宁');
INSERT INTO `provinces` VALUES (19, '内蒙古');
INSERT INTO `provinces` VALUES (20, '宁夏');
INSERT INTO `provinces` VALUES (21, '青海');
INSERT INTO `provinces` VALUES (22, '山东');
INSERT INTO `provinces` VALUES (23, '陕西');
INSERT INTO `provinces` VALUES (24, '天津');
INSERT INTO `provinces` VALUES (25, '重庆');
INSERT INTO `provinces` VALUES (26, '河南');
INSERT INTO `provinces` VALUES (27, '四川');
INSERT INTO `provinces` VALUES (28, '云南');
INSERT INTO `provinces` VALUES (29, '浙江');
INSERT INTO `provinces` VALUES (30, '上海');
INSERT INTO `provinces` VALUES (31, '北京');
INSERT INTO `provinces` VALUES (32, '新疆');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `describe` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (2, '数据过滤管理员', '数据过滤管理员', '2', 1);
INSERT INTO `role` VALUES (3, '文章资讯管理员', '文章资讯管理员', '1', 1);

-- ----------------------------
-- Table structure for role_menus
-- ----------------------------
DROP TABLE IF EXISTS `role_menus`;
CREATE TABLE `role_menus`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL,
  `menu_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `Role_menus_role_id_menu_id_aba55671_uniq`(`role_id` ASC, `menu_id` ASC) USING BTREE,
  INDEX `Role_menus_menu_id_9ed49c6e_fk_menu_menu_id`(`menu_id` ASC) USING BTREE,
  CONSTRAINT `Role_menus_menu_id_9ed49c6e_fk_menu_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `menu_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Role_menus_role_id_531ec4f0_fk_Role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_menus
-- ----------------------------
INSERT INTO `role_menus` VALUES (4, 3, 1);
INSERT INTO `role_menus` VALUES (5, 3, 2);
INSERT INTO `role_menus` VALUES (13, 3, 4);
INSERT INTO `role_menus` VALUES (14, 3, 5);
INSERT INTO `role_menus` VALUES (15, 3, 6);

-- ----------------------------
-- Table structure for salarykoukuan
-- ----------------------------
DROP TABLE IF EXISTS `salarykoukuan`;
CREATE TABLE `salarykoukuan`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `daikouzhufanggongjijin` double NOT NULL,
  `yiliaobaoxian` double NOT NULL,
  `bujiaoyiliaobaoxian` double NOT NULL,
  `yanglaobaoxian` double NOT NULL,
  `bujiaoyanglao` double NOT NULL,
  `zhiyenianjin` double NOT NULL,
  `bujiaonianjin` double NOT NULL,
  `shiyebaoxian` double NOT NULL,
  `bujiaoshiye` double NOT NULL,
  `gerensuodeshui` double NOT NULL,
  `shenfenzhenghao` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `xingming` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `year_month_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `heji` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `SalaryKouKuan_year_month_id_eb3a9357_fk_YearAndMonth_id`(`year_month_id` ASC) USING BTREE,
  CONSTRAINT `SalaryKouKuan_year_month_id_eb3a9357_fk_YearAndMonth_id` FOREIGN KEY (`year_month_id`) REFERENCES `yearandmonth` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of salarykoukuan
-- ----------------------------
INSERT INTO `salarykoukuan` VALUES ('0037a46b9ff44e0ca1c09408af328974', 625, 158.46, 0, 633.84, 0, 316.92, 0, 23.77, 0, 8.61, '140107198711020620', '闫如玉', 'f3150ee848504816b854a43c92cacdbe', 1766.6);
INSERT INTO `salarykoukuan` VALUES ('0043d7f99697481b94d94d57377bcece', 670, 166.76, 0, 667.04, 0, 333.52, 0, 25.01, 0, 111.32, '140122198410230126', '吴海丽', 'f3150ee848504816b854a43c92cacdbe', 1973.65);
INSERT INTO `salarykoukuan` VALUES ('005a5c7e0fab4127a494f1546fc0f8d0', 510, 138.78, 0, 555.12, 0, 277.56, 0, 20.82, 0, 89, '140602198711296016', '段海栋', 'f3150ee848504816b854a43c92cacdbe', 1591.28);
INSERT INTO `salarykoukuan` VALUES ('00bfed3dae0748c1967897c09c5da054', 693, 177.08, 0, 708.32, 0, 354.16, 0, 26.56, 0, 282.62, '412824197609063533', '陈磊刚', 'f3150ee848504816b854a43c92cacdbe', 2241.74);
INSERT INTO `salarykoukuan` VALUES ('0106023efffb441db06d09d0a508ea6e', 631, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 101.66, '140106198507121823', '赵佳', 'f3150ee848504816b854a43c92cacdbe', 1876.23);
INSERT INTO `salarykoukuan` VALUES ('012b800578e347c28ac2a573ff032be4', 541, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 29.86, '142226199603221223', '韩雪文', 'f3150ee848504816b854a43c92cacdbe', 1545.26);
INSERT INTO `salarykoukuan` VALUES ('014a9cd954ed47c4a32b99256fccc2c9', 832, 217.08, 0, 868.32, 0, 434.16, 0, 32.56, 0, 614.59, '140104196810111335', '姚念武', 'f3150ee848504816b854a43c92cacdbe', 2998.71);
INSERT INTO `salarykoukuan` VALUES ('01d85c93230645479c73ac2850d23a42', 731, 187.64, 0, 750.56, 0, 375.28, 0, 28.15, 0, 66.76, '140103197409075727', '吕嵘', 'f3150ee848504816b854a43c92cacdbe', 2139.39);
INSERT INTO `salarykoukuan` VALUES ('0222e0701996485b9445f08da4d5f81a', 793, 206.28, 0, 825.12, 0, 412.56, 0, 30.94, 0, 412.01, '140113197112291616', '王茵东', 'f3150ee848504816b854a43c92cacdbe', 2679.91);
INSERT INTO `salarykoukuan` VALUES ('023994454580436dab3d427b1dd8f069', 842, 219.32, 0, 877.28, 0, 438.64, 0, 32.9, 0, 477.94, '142429197201290841', '李燕', 'f3150ee848504816b854a43c92cacdbe', 2888.08);
INSERT INTO `salarykoukuan` VALUES ('025b677089854988afcb827a95034ffa', 880, 193.18, 0, 772.72, 0, 386.36, 0, 28.98, 0, 267.14, '142727198003230037', '黄泽军', 'f3150ee848504816b854a43c92cacdbe', 2528.38);
INSERT INTO `salarykoukuan` VALUES ('026b15060ae540d5b0c7ddca0cbe0378', 832, 218.72, 0, 874.88, 0, 437.44, 0, 32.81, 0, 631.61, '412931197301235537', '王小明', 'f3150ee848504816b854a43c92cacdbe', 3027.46);
INSERT INTO `salarykoukuan` VALUES ('02cd046c53da4fea81b97347caca57d5', 625, 158.46, 0, 633.84, 0, 316.92, 0, 23.77, 0, 8.61, '421002198112051469', '刘静', 'f3150ee848504816b854a43c92cacdbe', 1766.6);
INSERT INTO `salarykoukuan` VALUES ('02db8971f3bd4c73be8d0a4ab0ca22ec', 468, 142.11, 0, 568.43, 0, 284.22, 0, 21.32, 0, 60.66, '140581199409260025', '陈思思', 'f3150ee848504816b854a43c92cacdbe', 1544.74);
INSERT INTO `salarykoukuan` VALUES ('02edd8b3ed2a48b8bbf40ddf4b4aade3', 726, 166.76, 0, 667.04, 0, 333.52, 0, 25.01, 0, 271.47, '140105198411120547', '庞培婕', 'f3150ee848504816b854a43c92cacdbe', 2189.8);
INSERT INTO `salarykoukuan` VALUES ('0355c60295a04718bb017fe4b6667652', 681, 173.48, 0, 693.92, 0, 346.96, 0, 26.02, 0, 122.39, '140102197806146529', '张海燕', 'f3150ee848504816b854a43c92cacdbe', 2043.77);
INSERT INTO `salarykoukuan` VALUES ('03fa112ff07249ab8bcfeb6367b1703a', 717, 181.04, 0, 724.16, 0, 362.08, 0, 27.16, 0, 593.86, '140121198611110642', '张静', 'f3150ee848504816b854a43c92cacdbe', 2605.3);
INSERT INTO `salarykoukuan` VALUES ('03fed912a16346b68c902f2877990faf', 636, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 103.94, '140106198412260660', '高君', 'f3150ee848504816b854a43c92cacdbe', 1894.09);
INSERT INTO `salarykoukuan` VALUES ('0405e5a9fd174d18b289597f31b6b80c', 654, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 0, '140103198202221541', '牛原', 'f3150ee848504816b854a43c92cacdbe', 1842.62);
INSERT INTO `salarykoukuan` VALUES ('045966801be1415c89d17522548eeecc', 544, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 0, '140107199206202612', '伦默如', 'f3150ee848504816b854a43c92cacdbe', 1526.55);
INSERT INTO `salarykoukuan` VALUES ('046617f3705b4417b3b0ab72b949450c', 681, 173.48, 0, 693.92, 0, 346.96, 0, 26.02, 0, 122.39, '330106197804290069', '渠改萍', 'f3150ee848504816b854a43c92cacdbe', 2043.77);
INSERT INTO `salarykoukuan` VALUES ('048fd89451c04f9696de19577a070b92', 858, 223.94, 0, 895.76, 0, 447.88, 0, 33.59, 0, 658.37, '140102196812060727', '尚青', 'f3150ee848504816b854a43c92cacdbe', 3117.54);
INSERT INTO `salarykoukuan` VALUES ('04b2b48e5bcd44c5a42b3be3da5bb67c', 464, 138.98, 0, 555.92, 0, 277.96, 0, 20.85, 0, 68.53, '142402199501285429', '张璐璐', 'f3150ee848504816b854a43c92cacdbe', 1526.24);
INSERT INTO `salarykoukuan` VALUES ('04fa27e3b03a438a8106ba19c646850d', 590, 148.12, 0, 592.48, 0, 296.24, 0, 22.22, 0, 82.67, '140402198302100421', '张敏', 'f3150ee848504816b854a43c92cacdbe', 1731.73);
INSERT INTO `salarykoukuan` VALUES ('0527914bcaa9468a8e3f50d67379900f', 659, 167.88, 0, 671.52, 0, 335.76, 0, 25.18, 0, 0, '140102197808301414', '李波', 'f3150ee848504816b854a43c92cacdbe', 1859.34);
INSERT INTO `salarykoukuan` VALUES ('05976e951e7c4da68f22f1e482823740', 654, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 22, '140103198203161245', '黄美娜', 'f3150ee848504816b854a43c92cacdbe', 1864.62);
INSERT INTO `salarykoukuan` VALUES ('0599c466cd034f48b5d11eafc4f53f4b', 772, 195.96, 0, 783.84, 0, 391.92, 0, 29.39, 0, 515.86, '140102197002084035', '李伟', 'f3150ee848504816b854a43c92cacdbe', 2688.97);
INSERT INTO `salarykoukuan` VALUES ('05a05baf7f1d4a74a4531205e9d464bc', 642, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 16.22, '140109198603033021', '王娜', 'f3150ee848504816b854a43c92cacdbe', 1823.38);
INSERT INTO `salarykoukuan` VALUES ('06575d46a9924498aed91a4aac1045bb', 598, 151.86, 0, 607.44, 0, 303.72, 0, 22.78, 0, 86.92, '140121199306203521', '高瑞娟', 'f3150ee848504816b854a43c92cacdbe', 1770.72);
INSERT INTO `salarykoukuan` VALUES ('065f15cfdde743ff91a642d9a0f6498f', 669, 170.04, 0, 680.16, 0, 340.08, 0, 25.51, 0, 99.52, '140105198311071928', '王晓炜', 'f3150ee848504816b854a43c92cacdbe', 1984.31);
INSERT INTO `salarykoukuan` VALUES ('06b2563535774a0094d61392f9ca43be', 596, 151.86, 0, 607.44, 0, 303.72, 0, 22.78, 0, 110.08, '140427199405118095', '和晨阳', 'f3150ee848504816b854a43c92cacdbe', 1791.88);
INSERT INTO `salarykoukuan` VALUES ('06b7b8a44555494995cd390b17e05573', 921, 240.48, 0, 961.92, 0, 480.96, 0, 36.07, 0, 737.43, '140103196512205740', '马红梅', 'f3150ee848504816b854a43c92cacdbe', 3377.86);
INSERT INTO `salarykoukuan` VALUES ('06d07d91e35f465f86bd4a2c82340ef1', 1088, 0, 0, 1140.96, 0, 570.48, 0, 42.79, 0, 936.07, '142601196506291933', '柴达', 'f3150ee848504816b854a43c92cacdbe', 3778.3);
INSERT INTO `salarykoukuan` VALUES ('0775effa6a9a4b018ca34118ccba20c7', 676, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 24.42, '140107198312080626', '孙睿', 'f3150ee848504816b854a43c92cacdbe', 1877.31);
INSERT INTO `salarykoukuan` VALUES ('07aee7a1bcbe4f54ab622a61c4c9c171', 702, 175.28, 0, 701.12, 0, 350.56, 0, 26.29, 0, 79.41, '142222197810020024', '齐红霞', 'f3150ee848504816b854a43c92cacdbe', 2034.66);
INSERT INTO `salarykoukuan` VALUES ('081d6d28265d4d63a00c0a8412d90b28', 553, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 0, '14262919910207107X', '严豪', 'f3150ee848504816b854a43c92cacdbe', 1527.4);
INSERT INTO `salarykoukuan` VALUES ('08485d7f3af04144ba73f63ebfe85d1e', 943, 0, 0, 1037.81, 0, 518.91, 0, 38.92, 0, 381.54, '14240119780707141X', '蔡江辉', 'f3150ee848504816b854a43c92cacdbe', 2920.18);
INSERT INTO `salarykoukuan` VALUES ('0856e9d588f04d99bf16aa6fad794daf', 644, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 101.24, '140511198710172389', '张珍珍', 'f3150ee848504816b854a43c92cacdbe', 1888.81);
INSERT INTO `salarykoukuan` VALUES ('0863204f60a14fa2a04e637bacfa1d0e', 750, 193.78, 0, 775.12, 0, 387.56, 0, 29.07, 0, 501.64, '140402197302243217', '张金辉', 'f3150ee848504816b854a43c92cacdbe', 2637.17);
INSERT INTO `salarykoukuan` VALUES ('089827d3fb7e48e2885666d12b0256a1', 668, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 66.61, '142726198206260029', '杨旭丽', 'f3150ee848504816b854a43c92cacdbe', 1923.23);
INSERT INTO `salarykoukuan` VALUES ('08d3328d8180425c8cda5b4cb28d4bd4', 733, 188.98, 0, 755.92, 0, 377.96, 0, 28.35, 0, 98.36, '140103198003203922', '张珺', 'f3150ee848504816b854a43c92cacdbe', 2182.57);
INSERT INTO `salarykoukuan` VALUES ('0901762bddb84b7386bd9cf2661b72ae', 631, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 101.66, '140107198710131249', '王雨晗', 'f3150ee848504816b854a43c92cacdbe', 1876.23);
INSERT INTO `salarykoukuan` VALUES ('0938d38f1bc64a0dada623c09240692c', 714, 184.06, 0, 736.24, 0, 368.12, 0, 27.61, 0, 447.59, '140402198204280019', '程亮', 'f3150ee848504816b854a43c92cacdbe', 2477.62);
INSERT INTO `salarykoukuan` VALUES ('0973e34533e74c2ba439bccce9805f13', 733, 188.98, 0, 755.92, 0, 377.96, 0, 28.35, 0, 257.79, '140102198201256527', '徐杨', 'f3150ee848504816b854a43c92cacdbe', 2342);
INSERT INTO `salarykoukuan` VALUES ('0a19b6f805b44abfa61c91bfbf65bcbe', 717, 183.68, 0, 734.72, 0, 367.36, 0, 27.55, 0, 136.61, '142429197809140024', '张玲', 'f3150ee848504816b854a43c92cacdbe', 2166.92);
INSERT INTO `salarykoukuan` VALUES ('0a2b0e0b576c44f7836e571b86e3bc84', 640, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 60.39, '142601198410161914', '韩帅', 'f3150ee848504816b854a43c92cacdbe', 1865.55);
INSERT INTO `salarykoukuan` VALUES ('0a34f02926ec4128866d00e698fd096c', 610, 153.34, 0, 613.36, 0, 306.68, 0, 23, 0, 91.37, '142623198101120826', '胡筱瑜', 'f3150ee848504816b854a43c92cacdbe', 1797.75);
INSERT INTO `salarykoukuan` VALUES ('0aab25d7a63143cba8ce99723726b783', 667, 169.4, 0, 677.6, 0, 338.8, 0, 25.41, 0, 25.61, '421002198106232423', '张霞', 'f3150ee848504816b854a43c92cacdbe', 1903.82);
INSERT INTO `salarykoukuan` VALUES ('0ad25809d2f94cc099b1455a0eafe9ca', 701, 181.04, 0, 724.16, 0, 362.08, 0, 27.16, 0, 85.07, '150204198109270115', '毛斌', 'f3150ee848504816b854a43c92cacdbe', 2080.51);
INSERT INTO `salarykoukuan` VALUES ('0b03e0455d6d4e46bd5992c47cee457f', 473, 133.58, 0, 534.32, 0, 267.16, 0, 20.04, 0, 56.43, '142429199706282125', '成家慧', 'f3150ee848504816b854a43c92cacdbe', 1484.53);
INSERT INTO `salarykoukuan` VALUES ('0b6bce6b59b14208a07c6c70a4b63dea', 694, 176.9, 0, 707.6, 0, 353.8, 0, 26.54, 0, 398.02, '140103196806270652', '王建华', 'f3150ee848504816b854a43c92cacdbe', 2356.86);
INSERT INTO `salarykoukuan` VALUES ('0b70857ff9b94908b8fad9bd2881402d', 634, 159.8, 0, 639.2, 0, 319.6, 0, 23.97, 0, 54.92, '140102197907111421', '翟璐璐', 'f3150ee848504816b854a43c92cacdbe', 1831.49);
INSERT INTO `salarykoukuan` VALUES ('0b7f172ca7414574879320a4f8d8d91b', 633, 157.02, 0, 628.08, 0, 314.04, 0, 23.55, 0, 96.04, '141102198812220049', '马潇', 'f3150ee848504816b854a43c92cacdbe', 1851.73);
INSERT INTO `salarykoukuan` VALUES ('0b8d8e9d82224cca9fb872805e70e06f', 794, 202.12, 0, 808.48, 0, 404.24, 0, 30.32, 0, 28.07, '142431197602170025', '严芳芳', 'f3150ee848504816b854a43c92cacdbe', 2267.23);
INSERT INTO `salarykoukuan` VALUES ('0be219a95d9047d3a233935b00856899', 610, 153.34, 0, 613.36, 0, 306.68, 0, 23, 0, 16.37, '140311198006140622', '郑丽文', 'f3150ee848504816b854a43c92cacdbe', 1722.75);
INSERT INTO `salarykoukuan` VALUES ('0c281fd5f9534350a01945e7a4738c6e', 675, 171.68, 0, 686.72, 0, 343.36, 0, 25.75, 0, 119.96, '140311198109163325', '郭燕燕', 'f3150ee848504816b854a43c92cacdbe', 2022.47);
INSERT INTO `salarykoukuan` VALUES ('0c388ec59f784f44a59a30e5ee6673f6', 632, 159.8, 0, 639.2, 0, 319.6, 0, 23.97, 0, 99.05, '140103197706270676', '王江浩', 'f3150ee848504816b854a43c92cacdbe', 1873.62);
INSERT INTO `salarykoukuan` VALUES ('0cd8290fdf07430fb80a1dcb70baddea', 738, 190.78, 0, 763.12, 0, 381.56, 0, 28.62, 0, 520.31, '142202197708062476', '付树林', 'f3150ee848504816b854a43c92cacdbe', 2622.39);
INSERT INTO `salarykoukuan` VALUES ('0d17feba4a07483595e593c8ff89bca4', 471, 133.58, 0, 534.32, 0, 267.16, 0, 20.04, 0, 55.59, '140411199403040457', '刘洋', 'f3150ee848504816b854a43c92cacdbe', 1481.69);
INSERT INTO `salarykoukuan` VALUES ('0d1b9b71c4604bf8849523ebcef91190', 803, 208.46, 0, 833.84, 0, 416.92, 0, 31.27, 0, 345.75, '140102197005312048', '马俊文', 'f3150ee848504816b854a43c92cacdbe', 2639.24);
INSERT INTO `salarykoukuan` VALUES ('0d1dc7bcafe44bca893cc64fde45871e', 766, 198.16, 0, 792.64, 0, 396.32, 0, 29.72, 0, 111.88, '142323197611280167', '薛慧芳', 'f3150ee848504816b854a43c92cacdbe', 2294.72);
INSERT INTO `salarykoukuan` VALUES ('0d7857df6c284dcd82ed96cf98966c94', 598, 151.86, 0, 607.44, 0, 303.72, 0, 22.78, 0, 258.22, '140522199011079760', '马凯莉', 'f3150ee848504816b854a43c92cacdbe', 1942.02);
INSERT INTO `salarykoukuan` VALUES ('0dbdceeda5da42feb434292d0bdbb7bc', 567, 142.28, 0, 569.12, 0, 284.56, 0, 21.34, 0, 72.86, '142333199105271825', '卫丽琴', 'f3150ee848504816b854a43c92cacdbe', 1657.16);
INSERT INTO `salarykoukuan` VALUES ('0de285b372084c68bea8503e99e08abb', 907, 233.34, 0, 933.36, 0, 466.68, 0, 35, 0, 348.9, '140102196801223420', '梁晓琴', 'f3150ee848504816b854a43c92cacdbe', 2924.28);
INSERT INTO `salarykoukuan` VALUES ('0e1c517b41724ed6ad2b56a97e388f67', 729, 167.88, 0, 671.52, 0, 335.76, 0, 25.18, 0, 73.01, '140122197910070021', '张臻', 'f3150ee848504816b854a43c92cacdbe', 2002.35);
INSERT INTO `salarykoukuan` VALUES ('0e214e6a544745238adcd9321d53c294', 517, 138.78, 0, 555.12, 0, 277.56, 0, 20.82, 0, 88.76, '130526199407024612', '谷金朋', 'f3150ee848504816b854a43c92cacdbe', 1598.04);
INSERT INTO `salarykoukuan` VALUES ('0e2eecc103314c979e2f9887f6c49da7', 661, 167.88, 0, 671.52, 0, 335.76, 0, 25.18, 0, 24.47, '140102198107251420', '李陶琳', 'f3150ee848504816b854a43c92cacdbe', 1885.81);
INSERT INTO `salarykoukuan` VALUES ('0e8fcb45a846404b9e310ea675b1a260', 733, 188.98, 0, 755.92, 0, 377.96, 0, 28.35, 0, 332.2, '140102197907171440', '侯乐旻', 'f3150ee848504816b854a43c92cacdbe', 2416.41);
INSERT INTO `salarykoukuan` VALUES ('0ed6f942c0c14961bb14476fdadfb034', 462, 138.98, 0, 555.92, 0, 277.96, 0, 20.85, 0, 67.69, '370612199503050038', '赵春全', 'f3150ee848504816b854a43c92cacdbe', 1523.4);
INSERT INTO `salarykoukuan` VALUES ('0edfe888767f41c0928818e70d7e58d5', 563, 138.56, 0, 554.24, 0, 277.12, 0, 20.78, 0, 64.42, '140423199201032016', '赵晋', 'f3150ee848504816b854a43c92cacdbe', 1618.12);
INSERT INTO `salarykoukuan` VALUES ('0f3562fcd66a4279ad2ada66cd67357c', 608, 154.34, 0, 617.36, 0, 308.68, 0, 23.15, 0, 92.08, '140107198604031228', '成坤', 'f3150ee848504816b854a43c92cacdbe', 1803.61);
INSERT INTO `salarykoukuan` VALUES ('0f59b1b125b1429494c2d8544540b733', 856, 210.48, 0, 841.92, 0, 420.96, 0, 31.57, 0, 632.3, '14223019710627002X', '郝强', 'f3150ee848504816b854a43c92cacdbe', 2993.23);
INSERT INTO `salarykoukuan` VALUES ('0fb73d44ebbe4c00b5f5fc86721f7bc0', 818, 212.66, 0, 850.64, 0, 425.32, 0, 31.9, 0, 89.27, '140202197007251029', '邢彦琴', 'f3150ee848504816b854a43c92cacdbe', 2427.79);
INSERT INTO `salarykoukuan` VALUES ('0fbee3ab197849f9bd59f419ed1556be', 601, 153.1, 0, 612.4, 0, 306.2, 0, 22.97, 0, 0, '14010619930607181X', '郭宇晨', 'f3150ee848504816b854a43c92cacdbe', 1695.67);
INSERT INTO `salarykoukuan` VALUES ('0fc2c3781dda41d6852b3455d0d451f2', 659, 167.88, 0, 671.52, 0, 335.76, 0, 25.18, 0, 113.63, '140105198302030016', '张超', 'f3150ee848504816b854a43c92cacdbe', 1972.97);
INSERT INTO `salarykoukuan` VALUES ('101569306c1a414d900adaa7080b9c49', 756, 191.78, 0, 767.12, 0, 383.56, 0, 28.77, 0, 487.47, '142431197606271536', '雷恒平', 'f3150ee848504816b854a43c92cacdbe', 2614.7);
INSERT INTO `salarykoukuan` VALUES ('10beb4934770495fa60119930e933201', 718, 188.98, 0, 755.92, 0, 377.96, 0, 28.35, 0, 97.91, '142430197908101210', '韩栋梁', 'f3150ee848504816b854a43c92cacdbe', 2167.12);
INSERT INTO `salarykoukuan` VALUES ('112e5614db2e45c9b706c38ffdfe5c7d', 541, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 59.86, '142725199511040063', '贾玉茹', 'f3150ee848504816b854a43c92cacdbe', 1575.26);
INSERT INTO `salarykoukuan` VALUES ('119b31fbccb34999982221c0fdead374', 742, 191.78, 0, 767.12, 0, 383.56, 0, 28.77, 0, 312.79, '140104198107294511', '杨树军', 'f3150ee848504816b854a43c92cacdbe', 2426.02);
INSERT INTO `salarykoukuan` VALUES ('119b42a1201e4b01a429fea9419cdb57', 663, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 109.88, '142431198610127523', '李莉', 'f3150ee848504816b854a43c92cacdbe', 1927.03);
INSERT INTO `salarykoukuan` VALUES ('11b464ec46c3450ab1572c91c50a243f', 540, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 59.03, '142630199404271013', '杨沐霖', 'f3150ee848504816b854a43c92cacdbe', 1573.43);
INSERT INTO `salarykoukuan` VALUES ('11bafdb337f04b57a8e8848b83e2ae4a', 590, 148.12, 0, 592.48, 0, 296.24, 0, 22.22, 0, 37.68, '430682198210071063', '刘琼', 'f3150ee848504816b854a43c92cacdbe', 1686.74);
INSERT INTO `salarykoukuan` VALUES ('11beb740d2c54bba83f486f61e7be453', 608, 154.34, 0, 617.36, 0, 308.68, 0, 23.15, 0, 92.08, '140624199209221521', '郑文清', 'f3150ee848504816b854a43c92cacdbe', 1803.61);
INSERT INTO `salarykoukuan` VALUES ('11c47578a69448c08772e74261251970', 658, 167.76, 0, 671.04, 0, 335.52, 0, 25.16, 0, 6.31, '14010719860320481X', '张秀峰', 'f3150ee848504816b854a43c92cacdbe', 1863.79);
INSERT INTO `salarykoukuan` VALUES ('11c818ceb1f64878b6f0d508066fcd13', 596, 149.66, 0, 598.64, 0, 299.32, 0, 22.45, 0, 84.99, '140107198403273925', '任燕', 'f3150ee848504816b854a43c92cacdbe', 1751.06);
INSERT INTO `salarykoukuan` VALUES ('11d5c00dda3f4de295163ea097b7b936', 873, 229.48, 0, 917.92, 0, 458.96, 0, 34.42, 0, 688.72, '14010319670211214X', '张文梅', 'f3150ee848504816b854a43c92cacdbe', 3202.5);
INSERT INTO `salarykoukuan` VALUES ('122ac08d279a4894b854ddc6e4e387c1', 853, 220.7, 0, 882.8, 0, 441.4, 0, 33.11, 0, 539.59, '140102197602270050', '姚海彬', 'f3150ee848504816b854a43c92cacdbe', 2970.6);
INSERT INTO `salarykoukuan` VALUES ('1234bb8142684e15ad811bda8c3e0452', 741, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 42.73, '140113198103152328', '王秀卿', 'f3150ee848504816b854a43c92cacdbe', 2123.21);
INSERT INTO `salarykoukuan` VALUES ('12873c6aea7a481189719649b029204f', 631, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 0, '142225198105100524', '白利霞', 'f3150ee848504816b854a43c92cacdbe', 1774.57);
INSERT INTO `salarykoukuan` VALUES ('12c8d6f8276047368faae2e0bbbdd684', 727, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 50.89, '140102198103125224', '赵敏', 'f3150ee848504816b854a43c92cacdbe', 2117.37);
INSERT INTO `salarykoukuan` VALUES ('12f1d74eca484355851cd8148bc05cad', 892, 223.94, 0, 895.76, 0, 447.88, 0, 33.59, 0, 740.83, '510102197001208541', '郭东玲', 'f3150ee848504816b854a43c92cacdbe', 3234);
INSERT INTO `salarykoukuan` VALUES ('13096fc05a884cbdb26021477af25f4c', 733, 188.98, 0, 755.92, 0, 377.96, 0, 28.35, 0, 133.55, '142223198204213329', '张婧', 'f3150ee848504816b854a43c92cacdbe', 2217.76);
INSERT INTO `salarykoukuan` VALUES ('131fee0600c2498486a0674971efac79', 754, 190.78, 0, 763.12, 0, 381.56, 0, 28.62, 0, 55.38, '142402198010090024', '刘虹', 'f3150ee848504816b854a43c92cacdbe', 2173.46);
INSERT INTO `salarykoukuan` VALUES ('135e13d142414a2589d78978c6ff13d1', 631, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 0, '140105198712020582', '张晨昕', 'f3150ee848504816b854a43c92cacdbe', 1774.57);
INSERT INTO `salarykoukuan` VALUES ('13a9abe36c0a4697a4ce19d864b9fe68', 623, 156.78, 0, 627.12, 0, 313.56, 0, 23.52, 0, 0, '140103198003231229', '岳莉', 'f3150ee848504816b854a43c92cacdbe', 1743.98);
INSERT INTO `salarykoukuan` VALUES ('1407bc305ad84b6ca1ef1376b6dd7ffb', 657, 166.76, 0, 667.04, 0, 333.52, 0, 25.01, 0, 66.74, '142301198410193127', '王兴华', 'f3150ee848504816b854a43c92cacdbe', 1916.07);
INSERT INTO `salarykoukuan` VALUES ('140c516b982b40c497e84250ebb776ce', 648, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 18.49, '140102198211183421', '张慧敏', 'f3150ee848504816b854a43c92cacdbe', 1843.38);
INSERT INTO `salarykoukuan` VALUES ('140e5c4a822b4fa7ba27e0af2b5abfa2', 550, 135.24, 0, 540.96, 0, 270.48, 0, 20.29, 0, 57.7, '14262119960902292X', '郑亚莹', 'f3150ee848504816b854a43c92cacdbe', 1574.67);
INSERT INTO `salarykoukuan` VALUES ('143079887e6540f488990ec3343e0803', 723, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 100.54, '142726198205260027', '李俊彦', 'f3150ee848504816b854a43c92cacdbe', 2012.16);
INSERT INTO `salarykoukuan` VALUES ('143b8a4065574658b2134befee0c96e6', 656, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 105.83, '142601198607082128', '张月', 'f3150ee848504816b854a43c92cacdbe', 1926.99);
INSERT INTO `salarykoukuan` VALUES ('14bdf996f6534bb18eb2509bdeccb0cc', 601, 139.8, 0, 559.2, 0, 279.6, 0, 20.97, 0, 91.84, '140481199309116581', '李琳', 'f3150ee848504816b854a43c92cacdbe', 1692.41);
INSERT INTO `salarykoukuan` VALUES ('14f99cd590d242229837e630939de537', 733, 188.98, 0, 755.92, 0, 377.96, 0, 28.35, 0, 98.36, '142701198303201349', '王研', 'f3150ee848504816b854a43c92cacdbe', 2182.57);
INSERT INTO `salarykoukuan` VALUES ('1519d0a8dd3540ba9e022e71db7a38db', 745, 191.6, 0, 766.4, 0, 383.2, 0, 28.74, 0, 103.56, '140123197301020025', '郭建平', 'f3150ee848504816b854a43c92cacdbe', 2218.5);
INSERT INTO `salarykoukuan` VALUES ('1528dc56ec284c49ab75a8f29c44ccec', 608, 154.34, 0, 617.36, 0, 308.68, 0, 23.15, 0, 2.08, '140721199105310083', '李圆圆', 'f3150ee848504816b854a43c92cacdbe', 1713.61);
INSERT INTO `salarykoukuan` VALUES ('154acd76d06c467dbf245e6f427d8e38', 764, 198.16, 0, 792.64, 0, 396.32, 0, 29.72, 0, 103.74, '142733197603130331', '黄起才', 'f3150ee848504816b854a43c92cacdbe', 2284.58);
INSERT INTO `salarykoukuan` VALUES ('159bbfd614a6497baa2c5357c2081026', 667, 169.68, 0, 678.72, 0, 339.36, 0, 25.45, 0, 116.87, '140102197910265165', '杜芸', 'f3150ee848504816b854a43c92cacdbe', 1997.08);
INSERT INTO `salarykoukuan` VALUES ('15c9db2827ff45e28c5f50afe3d9645b', 636, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 103.94, '140121198411108046', '杨晓云', 'f3150ee848504816b854a43c92cacdbe', 1894.09);
INSERT INTO `salarykoukuan` VALUES ('15da81da9ab744e9910010b4c128cd87', 671, 171.04, 0, 684.16, 0, 342.08, 0, 25.66, 0, 73.29, '142433198104031652', '张新生', 'f3150ee848504816b854a43c92cacdbe', 1967.23);
INSERT INTO `salarykoukuan` VALUES ('160088ff643e4502b63dde97cc3149ac', 648, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 0, '142226198209194920', '智艳丽', 'f3150ee848504816b854a43c92cacdbe', 1824.89);
INSERT INTO `salarykoukuan` VALUES ('163e58271c2d492691fa9b9127fa614f', 727, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 50.89, '140303198209060040', '陈丫丫', 'f3150ee848504816b854a43c92cacdbe', 2117.37);
INSERT INTO `salarykoukuan` VALUES ('1696e273f17745dca8f39fe83c715df9', 677, 154.34, 0, 617.36, 0, 308.68, 0, 23.15, 0, 0, '142731199108205726', '安燕燕', 'f3150ee848504816b854a43c92cacdbe', 1780.53);
INSERT INTO `salarykoukuan` VALUES ('1698e58e754b4a03b2b7694001afbc5d', 653, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 66.16, '140112198111042835', '刘焕', 'f3150ee848504816b854a43c92cacdbe', 1907.78);
INSERT INTO `salarykoukuan` VALUES ('16b34149453f42a7a342a082b945002c', 608, 154.34, 0, 617.36, 0, 308.68, 0, 23.15, 0, 92.09, '140109199110120025', '苏蕾', 'f3150ee848504816b854a43c92cacdbe', 1803.62);
INSERT INTO `salarykoukuan` VALUES ('16e7068af51d4d3f8d2674470c1518d4', 780, 194.38, 0, 777.52, 0, 388.76, 0, 29.16, 0, 422.42, '140102197603052362', '郭银芳', 'f3150ee848504816b854a43c92cacdbe', 2592.24);
INSERT INTO `salarykoukuan` VALUES ('17161de85b0f4be7b3ab8f54b4df5db4', 792, 201.5, 0, 806, 0, 403, 0, 30.23, 0, 542.78, '140103196911152121', '罗玉萍', 'f3150ee848504816b854a43c92cacdbe', 2775.51);
INSERT INTO `salarykoukuan` VALUES ('1718fe06db04402cbe39476cecbe1c07', 561, 157.02, 0, 628.08, 0, 314.04, 0, 23.55, 0, 95.53, '141182198807130083', '王礼霄', 'f3150ee848504816b854a43c92cacdbe', 1779.22);
INSERT INTO `salarykoukuan` VALUES ('17a19a9f61bc410ca9fd80fb626ed074', 717, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 0, '140106198301160624', '李芸屹', 'f3150ee848504816b854a43c92cacdbe', 1893.89);
INSERT INTO `salarykoukuan` VALUES ('17b8ea2f84da4393b52cf5ad9d5e5fa4', 683, 174.48, 0, 697.92, 0, 348.96, 0, 26.17, 0, 78.16, '14010419771224223X', '李琦', 'f3150ee848504816b854a43c92cacdbe', 2008.69);
INSERT INTO `salarykoukuan` VALUES ('17bf695a590540118e4d1e13febe2b74', 546, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 63.58, '14260119950909404X', '邢力元', 'f3150ee848504816b854a43c92cacdbe', 1592.13);
INSERT INTO `salarykoukuan` VALUES ('19165511b7714b57af8aa0bf55cdaac4', 681, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 0, '140107198301071724', '邢娜', 'f3150ee848504816b854a43c92cacdbe', 1869.62);
INSERT INTO `salarykoukuan` VALUES ('19ad7b248b024c95b3f7d1d5e0ff124b', 750, 193.78, 0, 775.12, 0, 387.56, 0, 29.07, 0, 209.75, '140102197009181233', '多刚', 'f3150ee848504816b854a43c92cacdbe', 2345.28);
INSERT INTO `salarykoukuan` VALUES ('19af2858a6b04a2ba7b6823cf4e75fd3', 793, 205.86, 0, 823.44, 0, 411.72, 0, 30.88, 0, 568.21, '142224197110080029', '邢淑芳', 'f3150ee848504816b854a43c92cacdbe', 2833.11);
INSERT INTO `salarykoukuan` VALUES ('19d00445e3704b56a1fef4678be13130', 672, 171.04, 0, 684.16, 0, 342.08, 0, 25.66, 0, 278.48, '140311198212111726', '郑荣', 'f3150ee848504816b854a43c92cacdbe', 2173.42);
INSERT INTO `salarykoukuan` VALUES ('19ffd253135049b99f069131dcec52df', 774, 200.38, 0, 801.52, 0, 400.76, 0, 30.06, 0, 468.4, '320113196802024856', '赵登科', 'f3150ee848504816b854a43c92cacdbe', 2675.12);
INSERT INTO `salarykoukuan` VALUES ('1a5d1aaa34f849d0aff0ebe9f61c77e1', 654, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 104.99, '142635198201191213', '秦勇', 'f3150ee848504816b854a43c92cacdbe', 1924.15);
INSERT INTO `salarykoukuan` VALUES ('1aadd65b39c941ddae425cdf5193569e', 740, 190.78, 0, 763.12, 0, 381.56, 0, 28.62, 0, 85.77, '140102198102276522', '张琰', 'f3150ee848504816b854a43c92cacdbe', 2189.85);
INSERT INTO `salarykoukuan` VALUES ('1aba7e5320eb443ca4c07784fd375811', 473, 133.58, 0, 534.32, 0, 267.16, 0, 20.04, 0, 56.42, '142601199509062822', '张圻宁', 'f3150ee848504816b854a43c92cacdbe', 1484.52);
INSERT INTO `salarykoukuan` VALUES ('1aef8aaa581642e5aeb0ed9baf8f67ec', 694, 169.68, 0, 678.72, 0, 339.36, 0, 25.45, 0, 32.85, '14010219820125402X', '李芙蓉', 'f3150ee848504816b854a43c92cacdbe', 1940.06);
INSERT INTO `salarykoukuan` VALUES ('1b66fa8169a84fd7a3cca9fa1787cac1', 715, 184.06, 0, 736.24, 0, 368.12, 0, 27.61, 0, 450.39, '140121198210260527', '王宾彦', 'f3150ee848504816b854a43c92cacdbe', 2481.42);
INSERT INTO `salarykoukuan` VALUES ('1b794ef76fab479db972c0819cc08690', 626, 147.82, 0, 591.28, 0, 295.64, 0, 22.17, 0, 99.13, '140104197803094180', '畅旭莉', 'f3150ee848504816b854a43c92cacdbe', 1782.04);
INSERT INTO `salarykoukuan` VALUES ('1be5b3e7adb04ce5a1bb21c8129376e7', 625, 158.46, 0, 633.84, 0, 316.92, 0, 23.77, 0, 8.61, '142431198610032727', '王筱依', 'f3150ee848504816b854a43c92cacdbe', 1766.6);
INSERT INTO `salarykoukuan` VALUES ('1c0b00cb23254440a255a2cd7d4e955c', 616, 154.98, 0, 619.92, 0, 309.96, 0, 23.25, 0, 52.17, '140102197910035167', '韩洁', 'f3150ee848504816b854a43c92cacdbe', 1776.28);
INSERT INTO `salarykoukuan` VALUES ('1c56aefc53c2458ba49e434de02f485c', 635, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 13.11, '140104198207011734', '田永刚', 'f3150ee848504816b854a43c92cacdbe', 1802.26);
INSERT INTO `salarykoukuan` VALUES ('1cb6e02ad69a402380bec4936f47feeb', 526, 138.78, 0, 555.12, 0, 277.56, 0, 20.82, 0, 89.42, '142723199506050029', '温新奇', 'f3150ee848504816b854a43c92cacdbe', 1607.7);
INSERT INTO `salarykoukuan` VALUES ('1d0b7a820d214dc9a30b52063abf9d67', 641, 163.34, 0, 653.36, 0, 326.68, 0, 24.5, 0, 57.72, '140426197708234434', '江志强', 'f3150ee848504816b854a43c92cacdbe', 1866.6);
INSERT INTO `salarykoukuan` VALUES ('1d38044dd32d4cfdbb6b59ddc2eecd77', 462, 138.98, 0, 555.92, 0, 277.96, 0, 20.85, 0, 67.69, '142202199312010337', '黄小东', 'f3150ee848504816b854a43c92cacdbe', 1523.4);
INSERT INTO `salarykoukuan` VALUES ('1d90eefc9a844339bd6f79c79e76ea7d', 768, 194.98, 0, 779.92, 0, 389.96, 0, 29.25, 0, 224.6, '140203197907153922', '王建梅', 'f3150ee848504816b854a43c92cacdbe', 2386.71);
INSERT INTO `salarykoukuan` VALUES ('1ddfed42d91e498b900187478f1b236d', 640, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 0.39, '142623198501213036', '史俊冰', 'f3150ee848504816b854a43c92cacdbe', 1805.55);
INSERT INTO `salarykoukuan` VALUES ('1de5507b518c49ffacd1ef185f426b28', 721, 185.7, 0, 742.8, 0, 371.4, 0, 27.86, 0, 0, '140109198303291520', '冯慧瑛', 'f3150ee848504816b854a43c92cacdbe', 2048.76);
INSERT INTO `salarykoukuan` VALUES ('1ec0852bd1e54443a6796953c98a261d', 780, 194.38, 0, 777.52, 0, 388.76, 0, 29.16, 0, 523.62, '140103197812070627', '苗壮', 'f3150ee848504816b854a43c92cacdbe', 2693.44);
INSERT INTO `salarykoukuan` VALUES ('1ec27cfba034405f86f34de33d33e4f9', 727, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 0, '140103198009153321', '杜娟', 'f3150ee848504816b854a43c92cacdbe', 2066.48);
INSERT INTO `salarykoukuan` VALUES ('1ece188fa2a64df0b8caf67df9c355ed', 551, 138.56, 0, 554.24, 0, 277.12, 0, 20.78, 0, 65.65, '142433199111140026', '许雅萌', 'f3150ee848504816b854a43c92cacdbe', 1607.35);
INSERT INTO `salarykoukuan` VALUES ('1ed6fa316a444b1f8399f8b940934661', 676, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 114.42, '142303198601064566', '任晶晶', 'f3150ee848504816b854a43c92cacdbe', 1967.31);
INSERT INTO `salarykoukuan` VALUES ('1edc0967a7104ddb823a35ec7c908efe', 650, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 110.3, '142303198511140123', '苏静', 'f3150ee848504816b854a43c92cacdbe', 1914.45);
INSERT INTO `salarykoukuan` VALUES ('1eed33fb62734aa38c51d683330d3cf4', 629, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 70.82, '140321197812011516', '药宏慧', 'f3150ee848504816b854a43c92cacdbe', 1843.39);
INSERT INTO `salarykoukuan` VALUES ('1f8d3412972e4dd58737bf6b31ab3066', 591, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 87.73, '140202199511045020', '姜楠', 'f3150ee848504816b854a43c92cacdbe', 1661.28);
INSERT INTO `salarykoukuan` VALUES ('1fd9ca8d0f8244c3946edc3ec232698f', 800, 200.14, 0, 800.56, 0, 400.28, 0, 30.02, 0, 306.74, '14052219760721002X', '孙艳平', 'f3150ee848504816b854a43c92cacdbe', 2537.74);
INSERT INTO `salarykoukuan` VALUES ('1ffce826564245dab8b226b088c3a1db', 726, 183, 0, 732, 0, 366, 0, 27.45, 0, 91.12, '140108196912285534', '王琴琴', 'f3150ee848504816b854a43c92cacdbe', 2125.57);
INSERT INTO `salarykoukuan` VALUES ('2012852971644e648974a244a9f92de7', 656, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 60.83, '14022119860116006X', '张霞', 'f3150ee848504816b854a43c92cacdbe', 1881.99);
INSERT INTO `salarykoukuan` VALUES ('20364ab99d1e46eab8a4a0687c7b51fd', 650, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 0, '140122198505281129', '潘晓霞', 'f3150ee848504816b854a43c92cacdbe', 1804.15);
INSERT INTO `salarykoukuan` VALUES ('20471581487b4f679d17bce788be789c', 756, 191.54, 0, 766.16, 0, 383.08, 0, 28.73, 0, 567.64, '142726198109240026', '翟婷婷', 'f3150ee848504816b854a43c92cacdbe', 2693.15);
INSERT INTO `salarykoukuan` VALUES ('209c964f146a49a9896964b5222f8a78', 611, 151.86, 0, 607.44, 0, 303.72, 0, 22.78, 0, 86.5, '142326199303042720', '李新花', 'f3150ee848504816b854a43c92cacdbe', 1783.3);
INSERT INTO `salarykoukuan` VALUES ('20cb42080a0145e9af8d8dbe90326d91', 801, 209.18, 0, 836.72, 0, 418.36, 0, 31.38, 0, 25.06, '140103198110030027', '杨欣', 'f3150ee848504816b854a43c92cacdbe', 2321.7);
INSERT INTO `salarykoukuan` VALUES ('20e0a648f627417595ab2144f447fc7a', 669, 170.04, 0, 680.16, 0, 340.08, 0, 25.51, 0, 27.52, '142323198104271025', '荀欢欢', 'f3150ee848504816b854a43c92cacdbe', 1912.31);
INSERT INTO `salarykoukuan` VALUES ('20e0b0bef8e44569a3d028fe8bcac8dc', 724, 181.88, 0, 727.52, 0, 363.76, 0, 27.28, 0, 87.53, '140103197610034222', '苏敏静', 'f3150ee848504816b854a43c92cacdbe', 2111.97);
INSERT INTO `salarykoukuan` VALUES ('21c88d04317d4542a648b10f90bb9b8e', 780, 202.12, 0, 808.48, 0, 404.24, 0, 30.32, 0, 823.68, '140121197302178040', '杨翠峰', 'f3150ee848504816b854a43c92cacdbe', 3048.84);
INSERT INTO `salarykoukuan` VALUES ('22080ef0b3ba4de5bfa2090a3ea0ded0', 629, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 100.82, '130121198811123817', '陈志贤', 'f3150ee848504816b854a43c92cacdbe', 1873.39);
INSERT INTO `salarykoukuan` VALUES ('2213096db2a040d889a1a3d4fa38f509', 715, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 141.18, '142232198402080017', '吕文渊', 'f3150ee848504816b854a43c92cacdbe', 2033.07);
INSERT INTO `salarykoukuan` VALUES ('2246536304994b989f1397ba417db781', 745, 191.6, 0, 766.4, 0, 383.2, 0, 28.74, 0, 43.67, '14010219740220514X', '王艳花', 'f3150ee848504816b854a43c92cacdbe', 2158.61);
INSERT INTO `salarykoukuan` VALUES ('2261594c936f47c1ab1a24f341082f75', 625, 158.46, 0, 633.84, 0, 316.92, 0, 23.77, 0, 98.61, '14260119890820132X', '党旗', 'f3150ee848504816b854a43c92cacdbe', 1856.6);
INSERT INTO `salarykoukuan` VALUES ('22aaff1372774d8e98d3eaaaf27f6a0b', 636, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 58.94, '142603198205303023', '张会会', 'f3150ee848504816b854a43c92cacdbe', 1849.09);
INSERT INTO `salarykoukuan` VALUES ('22f9c5285e714e318978c2584cc74574', 738, 190.78, 0, 763.12, 0, 381.56, 0, 28.62, 0, 0, '140103198207173913', '齐晋', 'f3150ee848504816b854a43c92cacdbe', 2102.08);
INSERT INTO `salarykoukuan` VALUES ('23a2e09159914a79bb9ad2c0bc73e114', 670, 166.76, 0, 667.04, 0, 333.52, 0, 25.01, 0, 111.32, '140105198307170042', '吴晓燕', 'f3150ee848504816b854a43c92cacdbe', 1973.65);
INSERT INTO `salarykoukuan` VALUES ('23cd2d215e064e51aa09272dc21f760a', 818, 212.88, 0, 851.52, 0, 425.76, 0, 31.93, 0, 448.89, '140102196803175127', '张晋华', 'f3150ee848504816b854a43c92cacdbe', 2788.98);
INSERT INTO `salarykoukuan` VALUES ('23de414df3634aadb8490ffd96bc294f', 610, 153.66, 0, 614.64, 0, 307.32, 0, 23.05, 0, 0.01, '142401198906281425', '杜竹', 'f3150ee848504816b854a43c92cacdbe', 1708.68);
INSERT INTO `salarykoukuan` VALUES ('23fda62364ae42ef987a73041cdd641f', 737, 189.62, 0, 758.48, 0, 379.24, 0, 28.44, 0, 100.77, '140102197502186521', '李旭琴', 'f3150ee848504816b854a43c92cacdbe', 2193.55);
INSERT INTO `salarykoukuan` VALUES ('2415e0d5b348406a884550e2f8ff4fc8', 537, 141.58, 0, 566.32, 0, 283.16, 0, 21.24, 0, 87.59, '140302199304120812', '李博睿', 'f3150ee848504816b854a43c92cacdbe', 1636.89);
INSERT INTO `salarykoukuan` VALUES ('2475d0e940f54ee580280480fcf5718c', 688, 175.28, 0, 701.12, 0, 350.56, 0, 26.29, 0, 34.8, '140102198009096527', '许鸿', 'f3150ee848504816b854a43c92cacdbe', 1976.05);
INSERT INTO `salarykoukuan` VALUES ('24c40d462ed84433b8e1798b497c8bde', 590, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 41.89, '130435199010031516', '谷志朋', 'f3150ee848504816b854a43c92cacdbe', 1614.44);
INSERT INTO `salarykoukuan` VALUES ('24c70e77dd45453abf2edb93cd558723', 799, 209.18, 0, 836.72, 0, 418.36, 0, 31.38, 0, 330.74, '140103197903015738', '赵雨竹', 'f3150ee848504816b854a43c92cacdbe', 2625.38);
INSERT INTO `salarykoukuan` VALUES ('24d026ef53084286a0b231c8b0519f75', 1014, 0, 0, 1064.4, 0, 532.2, 0, 39.92, 0, 602.67, '140103196612151313', '王坚', 'f3150ee848504816b854a43c92cacdbe', 3253.19);
INSERT INTO `salarykoukuan` VALUES ('250455c0b1444b7cbd6b0c7b84366797', 747, 188.98, 0, 755.92, 0, 377.96, 0, 28.35, 0, 499.47, '140303197912050026', '冯晓媛', 'f3150ee848504816b854a43c92cacdbe', 2597.68);
INSERT INTO `salarykoukuan` VALUES ('2546b82e778840f6b363b57b000df5da', 839, 219.32, 0, 877.28, 0, 438.64, 0, 32.9, 0, 655.49, '140102197002122310', '张武', 'f3150ee848504816b854a43c92cacdbe', 3062.63);
INSERT INTO `salarykoukuan` VALUES ('256a3169e7b74e6da9c590117b709639', 541, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 59.86, '130625199107110825', '司丽超', 'f3150ee848504816b854a43c92cacdbe', 1575.26);
INSERT INTO `salarykoukuan` VALUES ('25a5d3d007644ca192a4e295d4d04d01', 608, 154.34, 0, 617.36, 0, 308.68, 0, 23.15, 0, 92.08, '410521199406303527', '张晶晶', 'f3150ee848504816b854a43c92cacdbe', 1803.61);
INSERT INTO `salarykoukuan` VALUES ('2612c168e5b04dc38e22adf5cbcf96e9', 733, 188.98, 0, 755.92, 0, 377.96, 0, 28.35, 0, 385.4, '14263119800715742X', '陈耀玲', 'f3150ee848504816b854a43c92cacdbe', 2469.61);
INSERT INTO `salarykoukuan` VALUES ('264de91b9de74b84b9ade6f7fe03bad1', 535, 135.24, 0, 540.96, 0, 270.48, 0, 20.29, 0, 0, '371522199412057216', '董鹤', 'f3150ee848504816b854a43c92cacdbe', 1501.97);
INSERT INTO `salarykoukuan` VALUES ('2677a8b64e894e7d8afe58d2ee972aa0', 739, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 0, '142701198209071250', '程明', 'f3150ee848504816b854a43c92cacdbe', 2078.48);
INSERT INTO `salarykoukuan` VALUES ('2699dee03f3f4723bfc16ca9739d5f7d', 648, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 63.48, '14030219820829042X', '鲍芳', 'f3150ee848504816b854a43c92cacdbe', 1888.37);
INSERT INTO `salarykoukuan` VALUES ('272da94d9c7347bf99997c4c6a3f3e5b', 766, 194.38, 0, 777.52, 0, 388.76, 0, 29.16, 0, 67.1, '142333197808130026', '高红霞', 'f3150ee848504816b854a43c92cacdbe', 2222.92);
INSERT INTO `salarykoukuan` VALUES ('27c46436e5634aaf989cbc47071bb1be', 603, 153.1, 0, 612.4, 0, 306.2, 0, 22.97, 0, 28.96, '140603199404031027', '苏丽君', 'f3150ee848504816b854a43c92cacdbe', 1726.63);
INSERT INTO `salarykoukuan` VALUES ('280bf229f9b54b869d171356cc095cab', 555, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 59.48, '140108199410063222', '张哲琪', 'f3150ee848504816b854a43c92cacdbe', 1588.88);
INSERT INTO `salarykoukuan` VALUES ('281fe9f9b69e46a086a886d7787e2123', 698, 179.56, 0, 718.24, 0, 359.12, 0, 26.93, 0, 127.87, '140321198807170947', '岳娜', 'f3150ee848504816b854a43c92cacdbe', 2109.72);
INSERT INTO `salarykoukuan` VALUES ('28af4d8aab9a4c7ea64825eccbcee7d9', 777, 201.5, 0, 806, 0, 403, 0, 30.23, 0, 441.03, '140102197308202030', '董新平', 'f3150ee848504816b854a43c92cacdbe', 2658.76);
INSERT INTO `salarykoukuan` VALUES ('292f5348456a4649a35f8788f37503f7', 688, 175.28, 0, 701.12, 0, 350.56, 0, 26.29, 0, 34.8, '140202198012031025', '孙丽娟', 'f3150ee848504816b854a43c92cacdbe', 1976.05);
INSERT INTO `salarykoukuan` VALUES ('293c930d14b941fb9c7cfaf0a9e70a18', 900, 198.58, 0, 794.32, 0, 397.16, 0, 29.79, 0, 745.61, '142329197509230022', '张梅英', 'f3150ee848504816b854a43c92cacdbe', 3065.46);
INSERT INTO `salarykoukuan` VALUES ('295705f7ac894dc09f0c0be614cb92ed', 562, 141.04, 0, 564.16, 0, 282.08, 0, 21.16, 0, 0, '140122199008101742', '董国珍', 'f3150ee848504816b854a43c92cacdbe', 1570.44);
INSERT INTO `salarykoukuan` VALUES ('2971ffa71f4b456c9d4030c2a9a8fe3a', 537, 135.24, 0, 540.96, 0, 270.48, 0, 20.29, 0, 58.12, '140105199703210047', '郝丽璋', 'f3150ee848504816b854a43c92cacdbe', 1562.09);
INSERT INTO `salarykoukuan` VALUES ('29b40651c1f94e4b84339fe327dd4b43', 744, 191.16, 0, 764.64, 0, 382.32, 0, 28.67, 0, 105.19, '142701197101101222', '高军', 'f3150ee848504816b854a43c92cacdbe', 2215.98);
INSERT INTO `salarykoukuan` VALUES ('29b9e83273004b8dae8e7d9846409adf', 625, 158.46, 0, 633.84, 0, 316.92, 0, 23.77, 0, 98.61, '142623198912055546', '张博', 'f3150ee848504816b854a43c92cacdbe', 1856.6);
INSERT INTO `salarykoukuan` VALUES ('29e97547b36042d48fffcc35b9dbb003', 680, 173.28, 0, 693.12, 0, 346.56, 0, 25.99, 0, 76.71, '142323197810290229', '张文娟', 'f3150ee848504816b854a43c92cacdbe', 1995.66);
INSERT INTO `salarykoukuan` VALUES ('2a17e024c99242088350de3a4fc614bd', 692, 176.28, 0, 705.12, 0, 352.56, 0, 26.44, 0, 36.44, '14010219811118702X', '武哲敏', 'f3150ee848504816b854a43c92cacdbe', 1988.84);
INSERT INTO `salarykoukuan` VALUES ('2ac0af9fd2ae48d3ab2b4c97d19a7956', 737, 173.48, 0, 693.92, 0, 346.96, 0, 26.02, 0, 244.76, '412728198211122526', '杨翠平', 'f3150ee848504816b854a43c92cacdbe', 2222.14);
INSERT INTO `salarykoukuan` VALUES ('2ae6d312dd1a483ba312f764f5be4b0c', 875, 219.32, 0, 877.28, 0, 438.64, 0, 32.9, 0, 680.81, '140106196901311220', '卢青', 'f3150ee848504816b854a43c92cacdbe', 3123.95);
INSERT INTO `salarykoukuan` VALUES ('2b49e35f8b5643a78345ea4d6119ac38', 681, 173.48, 0, 693.92, 0, 346.96, 0, 26.02, 0, 77.39, '140104198108060389', '任彦卿', 'f3150ee848504816b854a43c92cacdbe', 1998.77);
INSERT INTO `salarykoukuan` VALUES ('2b6bd12da41c4ed6b030fdf2ed6b8eab', 771, 199.52, 0, 798.08, 0, 399.04, 0, 29.93, 0, 384.44, '140121197407090029', '韩俊秦', 'f3150ee848504816b854a43c92cacdbe', 2582.01);
INSERT INTO `salarykoukuan` VALUES ('2b9677adb61c4beaa108fcfa774f2de9', 834, 218.72, 0, 874.88, 0, 437.44, 0, 32.81, 0, 484.41, '140102197711051420', '阎翔宇', 'f3150ee848504816b854a43c92cacdbe', 2882.26);
INSERT INTO `salarykoukuan` VALUES ('2bd2a91f51044fbfa7009f5a2472472e', 780, 194.38, 0, 777.52, 0, 388.76, 0, 29.16, 0, 6.73, '140102198004223443', '杨丽娟', 'f3150ee848504816b854a43c92cacdbe', 2176.55);
INSERT INTO `salarykoukuan` VALUES ('2c88dce0e6744a408903785bc369dbc6', 869, 226.48, 0, 905.92, 0, 452.96, 0, 33.97, 0, 512.16, '142324197202030024', '李彩兰', 'f3150ee848504816b854a43c92cacdbe', 3000.49);
INSERT INTO `salarykoukuan` VALUES ('2cd5e4f4bf2c4e82a10972af0bffd9fe', 848, 221.56, 0, 886.24, 0, 443.12, 0, 33.23, 0, 547.02, '140102196604140212', '乔智', 'f3150ee848504816b854a43c92cacdbe', 2979.17);
INSERT INTO `salarykoukuan` VALUES ('2cfa842354fd4f958a243b72d2df0655', 737, 189.62, 0, 758.48, 0, 379.24, 0, 28.44, 0, 331.51, '140102197407051426', '陈琍', 'f3150ee848504816b854a43c92cacdbe', 2424.29);
INSERT INTO `salarykoukuan` VALUES ('2d02315a83154c7b877b9b827b5c7aa2', 487, 138.56, 0, 554.24, 0, 277.12, 0, 20.78, 0, 65.13, '140121199406302586', '董佳榕', 'f3150ee848504816b854a43c92cacdbe', 1542.83);
INSERT INTO `salarykoukuan` VALUES ('2d0c52f60610428a8df478127c82453b', 754, 190.78, 0, 763.12, 0, 381.56, 0, 28.62, 0, 85.38, '140226198111137045', '李晓卿', 'f3150ee848504816b854a43c92cacdbe', 2203.46);
INSERT INTO `salarykoukuan` VALUES ('2d1f2eee1c004ec384e10b7d67bf37f5', 546, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 87.58, '140202199001072520', '赵然', 'f3150ee848504816b854a43c92cacdbe', 1616.13);
INSERT INTO `salarykoukuan` VALUES ('2d77dfb188134b9eb44a2a6e908bd13e', 900, 0, 0, 936.72, 0, 468.36, 0, 35.13, 0, 583.67, '140603198012090525', '王晓燕', 'f3150ee848504816b854a43c92cacdbe', 2923.88);
INSERT INTO `salarykoukuan` VALUES ('2ec781ae08dd43d5b6a17447c69a417e', 591, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 87.73, '142301199311010027', '王虹霞', 'f3150ee848504816b854a43c92cacdbe', 1661.28);
INSERT INTO `salarykoukuan` VALUES ('2f19657c317a46bba54dd053f357912e', 573, 143.62, 0, 574.48, 0, 287.24, 0, 21.54, 0, 0, '140121198301197228', '杨亚玲', 'f3150ee848504816b854a43c92cacdbe', 1599.88);
INSERT INTO `salarykoukuan` VALUES ('2f277f3793ee4196b88720a7b9a15234', 555, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 59.48, '140109199608190565', '张子怡', 'f3150ee848504816b854a43c92cacdbe', 1588.88);
INSERT INTO `salarykoukuan` VALUES ('2f738c7dd91a4acc9f907b209ebdc074', 654, 165.64, 0, 662.56, 0, 331.28, 0, 24.85, 0, 109.19, '140104197203092245', '米峮', 'f3150ee848504816b854a43c92cacdbe', 1947.52);
INSERT INTO `salarykoukuan` VALUES ('2f98fbf3feef4ae1af2df59340dec6d2', 603, 153.1, 0, 612.4, 0, 306.2, 0, 22.97, 0, 88.96, '140110199005071028', '赵翠玉', 'f3150ee848504816b854a43c92cacdbe', 1786.63);
INSERT INTO `salarykoukuan` VALUES ('2fd4e4c5f3f844979436cafda39287b7', 629, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 100.82, '440981198410086173', '钟宝', 'f3150ee848504816b854a43c92cacdbe', 1873.39);
INSERT INTO `salarykoukuan` VALUES ('301569e49f804eada673042475e872e0', 539, 141.58, 0, 566.32, 0, 283.16, 0, 21.24, 0, 88.43, '14260119870731132X', '刘彦君', 'f3150ee848504816b854a43c92cacdbe', 1639.73);
INSERT INTO `salarykoukuan` VALUES ('30ec135c60d44813b5e4aed893042b3e', 645, 159.88, 0, 639.52, 0, 319.76, 0, 23.98, 0, 54.08, '140102197609036558', '武小勇', 'f3150ee848504816b854a43c92cacdbe', 1842.22);
INSERT INTO `salarykoukuan` VALUES ('30fce2c1b8384affb97f0026d96c745c', 675, 171.68, 0, 686.72, 0, 343.36, 0, 25.75, 0, 74.96, '140103197806030661', '张旭', 'f3150ee848504816b854a43c92cacdbe', 1977.47);
INSERT INTO `salarykoukuan` VALUES ('312fef04093b42b590b5f8ddb10e65c6', 808, 210.48, 0, 841.92, 0, 420.96, 0, 31.57, 0, 579.1, '140104197404152259', '赵刚', 'f3150ee848504816b854a43c92cacdbe', 2892.03);
INSERT INTO `salarykoukuan` VALUES ('316cad93c81c4669ba4f755fc91548d3', 695, 177.08, 0, 708.32, 0, 354.16, 0, 26.56, 0, 97.23, '142625197602224621', '张颖娟', 'f3150ee848504816b854a43c92cacdbe', 2058.35);
INSERT INTO `salarykoukuan` VALUES ('31b3a9ea392e47248b7010a956d14bf7', 802, 208.46, 0, 833.84, 0, 416.92, 0, 31.27, 0, 128.95, '140102197108040620', '李文璇', 'f3150ee848504816b854a43c92cacdbe', 2421.44);
INSERT INTO `salarykoukuan` VALUES ('31df0912921a4864ac125833f77d5f8a', 582, 146.54, 0, 586.16, 0, 293.08, 0, 21.98, 0, 0, '140106198312251214', '杜炜', 'f3150ee848504816b854a43c92cacdbe', 1629.76);
INSERT INTO `salarykoukuan` VALUES ('31f36a1f80644f0097a43630d24be811', 717, 183.68, 0, 734.72, 0, 367.36, 0, 27.55, 0, 31.61, '140502197607200520', '徐妮妮', 'f3150ee848504816b854a43c92cacdbe', 2061.92);
INSERT INTO `salarykoukuan` VALUES ('321b11bfaf104dd5a5bf083a0902c3df', 694, 173.48, 0, 693.92, 0, 346.96, 0, 26.02, 0, 83.3, '142723197911203317', '李建军', 'f3150ee848504816b854a43c92cacdbe', 2017.68);
INSERT INTO `salarykoukuan` VALUES ('32a4df07e6b54dcb9ace4b254d105b8b', 727, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 326.93, '21032319800421226X', '李娜', 'f3150ee848504816b854a43c92cacdbe', 2393.41);
INSERT INTO `salarykoukuan` VALUES ('32f886f008214f388284bf628dce5842', 729, 188.18, 0, 752.72, 0, 376.36, 0, 28.23, 0, 232.28, '140311197803090934', '张勤杰', 'f3150ee848504816b854a43c92cacdbe', 2306.77);
INSERT INTO `salarykoukuan` VALUES ('32faeba5ed814ded84aa700ebe97cc21', 731, 188.98, 0, 755.92, 0, 377.96, 0, 28.35, 0, 0, '140102198008072312', '苏亮', 'f3150ee848504816b854a43c92cacdbe', 2082.21);
INSERT INTO `salarykoukuan` VALUES ('33850469b3254cb0abc2d492616f9a48', 733, 185.7, 0, 742.8, 0, 371.4, 0, 27.86, 0, 91.14, '142402198008243319', '赵承勇', 'f3150ee848504816b854a43c92cacdbe', 2151.9);
INSERT INTO `salarykoukuan` VALUES ('33e838ac0d0e4efbbdcc6374678453e8', 739, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 488.45, '140302198001160556', '傅斌', 'f3150ee848504816b854a43c92cacdbe', 2566.93);
INSERT INTO `salarykoukuan` VALUES ('3402abeb7ba549cd9519c6554a1d2873', 721, 181.02, 0, 724.08, 0, 362.04, 0, 27.15, 0, 110.93, '140108197311071981', '黄岩梅', 'f3150ee848504816b854a43c92cacdbe', 2126.22);
INSERT INTO `salarykoukuan` VALUES ('3414f0d198544bb88a8c308fa3783c41', 584, 146.54, 0, 586.16, 0, 293.08, 0, 21.98, 0, 0, '140102198208161440', '段婷', 'f3150ee848504816b854a43c92cacdbe', 1631.76);
INSERT INTO `salarykoukuan` VALUES ('3436948dc26f4433b794afe6c28a065e', 745, 188.98, 0, 755.92, 0, 377.96, 0, 28.35, 0, 473.77, '140102198003033410', '张晓鹏', 'f3150ee848504816b854a43c92cacdbe', 2569.98);
INSERT INTO `salarykoukuan` VALUES ('34a136fa25534b95841aee583c7e3f17', 717, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 361.52, '130406198211140368', '何江', 'f3150ee848504816b854a43c92cacdbe', 2255.41);
INSERT INTO `salarykoukuan` VALUES ('357769a232a044bea42f641b87118619', 635, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 343.68, '140107198210191739', '崔阳', 'f3150ee848504816b854a43c92cacdbe', 2132.83);
INSERT INTO `salarykoukuan` VALUES ('358ceb5ea83144c49e14207a28ab72e7', 681, 173.48, 0, 693.92, 0, 346.96, 0, 26.02, 0, 104.39, '142322197808146547', '潘艳花', 'f3150ee848504816b854a43c92cacdbe', 2025.77);
INSERT INTO `salarykoukuan` VALUES ('35c39d18f73b495c87cba31c27d0452f', 714, 184.06, 0, 736.24, 0, 368.12, 0, 27.61, 0, 29.27, '142325198009050016', '臧国栋', 'f3150ee848504816b854a43c92cacdbe', 2059.3);
INSERT INTO `salarykoukuan` VALUES ('35d360286eb94f0ba2662fb716ef3a84', 546, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 63.58, '140622199302110102', '任丹丹', 'f3150ee848504816b854a43c92cacdbe', 1592.13);
INSERT INTO `salarykoukuan` VALUES ('35ee081eae6f45008bbfe4b9acc2e2a1', 727, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 95.89, '140102198012040022', '王辉', 'f3150ee848504816b854a43c92cacdbe', 2162.37);
INSERT INTO `salarykoukuan` VALUES ('35f46f3960ef4ed69c144c8ad025a84e', 743, 191.6, 0, 766.4, 0, 383.2, 0, 28.74, 0, 102.72, '140102197204132314', '王永强', 'f3150ee848504816b854a43c92cacdbe', 2215.66);
INSERT INTO `salarykoukuan` VALUES ('3622bc1727d94f9f82aeef371c76d1bc', 724, 170.04, 0, 680.16, 0, 340.08, 0, 25.51, 0, 54.73, '140103198002271229', '马建英', 'f3150ee848504816b854a43c92cacdbe', 1994.52);
INSERT INTO `salarykoukuan` VALUES ('3660b88a20ef43f99378affee4c3822c', 675, 171.68, 0, 686.72, 0, 343.36, 0, 25.75, 0, 119.96, '140123198312240220', '王晓鑫', 'f3150ee848504816b854a43c92cacdbe', 2022.47);
INSERT INTO `salarykoukuan` VALUES ('367bd73992ff48b993d5206bf7c79ca3', 746, 192.58, 0, 770.32, 0, 385.16, 0, 28.89, 0, 58.2, '140102198002032328', '贾娟', 'f3150ee848504816b854a43c92cacdbe', 2181.15);
INSERT INTO `salarykoukuan` VALUES ('36a60acee57b48ea9b7c7088083e4399', 725, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 95.05, '142726198204061579', '权英杰', 'f3150ee848504816b854a43c92cacdbe', 2159.53);
INSERT INTO `salarykoukuan` VALUES ('36ad6f2cb48a42b393a7693cbdba8462', 610, 138.56, 0, 554.24, 0, 277.12, 0, 20.78, 0, 89.4, '140212199209233365', '王彩凤', 'f3150ee848504816b854a43c92cacdbe', 1690.1);
INSERT INTO `salarykoukuan` VALUES ('36d17502235b45c08b956610f43319de', 667, 169.68, 0, 678.72, 0, 339.36, 0, 25.45, 0, 71.87, '140221198011230048', '周杰宇', 'f3150ee848504816b854a43c92cacdbe', 1952.08);
INSERT INTO `salarykoukuan` VALUES ('37000ae3309c40bbadbd0a2493fcdca1', 602, 151.7, 0, 606.8, 0, 303.4, 0, 22.76, 0, 57.01, '140102198106232332', '崔欣', 'f3150ee848504816b854a43c92cacdbe', 1743.67);
INSERT INTO `salarykoukuan` VALUES ('3703ea111c454c42aeb589efa24d5dbd', 608, 154.34, 0, 617.36, 0, 308.68, 0, 23.15, 0, 306.94, '140121199109130829', '王茹', 'f3150ee848504816b854a43c92cacdbe', 2018.47);
INSERT INTO `salarykoukuan` VALUES ('371660e6bd604812a12925383c5e38eb', 680, 169.68, 0, 678.72, 0, 339.36, 0, 25.45, 0, 78.23, '142432197702221228', '郭红霞', 'f3150ee848504816b854a43c92cacdbe', 1971.44);
INSERT INTO `salarykoukuan` VALUES ('371843346a964202a596f0fac71a75cc', 810, 210.48, 0, 841.92, 0, 420.96, 0, 31.57, 0, 129.6, '140102197209134829', '李琦', 'f3150ee848504816b854a43c92cacdbe', 2444.53);
INSERT INTO `salarykoukuan` VALUES ('374b4f16fcfa4cdd9de30b3108767ce5', 779, 198.58, 0, 794.32, 0, 397.16, 0, 29.79, 0, 516.41, '140322197907140018', '王培军', 'f3150ee848504816b854a43c92cacdbe', 2715.26);
INSERT INTO `salarykoukuan` VALUES ('37e8f1b94245432eadbbd547940c8ebe', 780, 198.16, 0, 792.64, 0, 396.32, 0, 29.72, 0, 544.62, '140102197507052346', '王莉', 'f3150ee848504816b854a43c92cacdbe', 2741.46);
INSERT INTO `salarykoukuan` VALUES ('38310086194248f9946c9d67ad540b78', 609, 151.86, 0, 607.44, 0, 303.72, 0, 22.78, 0, 85.66, '130406199210270616', '张鑫', 'f3150ee848504816b854a43c92cacdbe', 1780.46);
INSERT INTO `salarykoukuan` VALUES ('3855123ef3be4624bbde079b088f5e2c', 816, 212.52, 0, 850.08, 0, 425.04, 0, 31.88, 0, 596.04, '140103196708150657', '杨烽', 'f3150ee848504816b854a43c92cacdbe', 2931.56);
INSERT INTO `salarykoukuan` VALUES ('38849b5a719047e28b4ff548c7efb5e1', 738, 189.62, 0, 758.48, 0, 379.24, 0, 28.44, 0, 439.3, '140103197503060628', '李敏', 'f3150ee848504816b854a43c92cacdbe', 2533.08);
INSERT INTO `salarykoukuan` VALUES ('38fcb08c2d5843d788eb3cbcd0b669f2', 764, 197.54, 0, 790.16, 0, 395.08, 0, 29.63, 0, 371.05, '142732197207263224', '员丽霞', 'f3150ee848504816b854a43c92cacdbe', 2547.46);
INSERT INTO `salarykoukuan` VALUES ('393d071d47e144b68409bfb295335de0', 598, 151.86, 0, 607.44, 0, 303.72, 0, 22.78, 0, 86.92, '142301199506130061', '张照琳', 'f3150ee848504816b854a43c92cacdbe', 1770.72);
INSERT INTO `salarykoukuan` VALUES ('39a1322ce3d44399b2c18286dc325c1a', 613, 142.38, 0, 569.52, 0, 284.76, 0, 21.36, 0, 97.14, '140424199006294842', '李泽琳', 'f3150ee848504816b854a43c92cacdbe', 1728.16);
INSERT INTO `salarykoukuan` VALUES ('39bd22f8863f427185ebff599745c88a', 760, 195.96, 0, 783.84, 0, 391.92, 0, 29.39, 0, 155.91, '140104197006140324', '闫京清', 'f3150ee848504816b854a43c92cacdbe', 2317.02);
INSERT INTO `salarykoukuan` VALUES ('39e572e42b384166a1059c51811eedb9', 721, 185.7, 0, 742.8, 0, 371.4, 0, 27.86, 0, 457.92, '142636198308270022', '樊华', 'f3150ee848504816b854a43c92cacdbe', 2506.68);
INSERT INTO `salarykoukuan` VALUES ('3a0e45aacd18424bbaabe66e872d214b', 731, 176.48, 0, 705.92, 0, 352.96, 0, 26.47, 0, 41.1, '142431198003246029', '武林芝', 'f3150ee848504816b854a43c92cacdbe', 2033.93);
INSERT INTO `salarykoukuan` VALUES ('3ace807044e14594b1f4e281a26ec5ea', 537, 135.24, 0, 540.96, 0, 270.48, 0, 20.29, 0, 58.12, '140107199408260626', '孙宇璇', 'f3150ee848504816b854a43c92cacdbe', 1562.09);
INSERT INTO `salarykoukuan` VALUES ('3ad13656c1644527856e76c0569710e3', 540, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 59.03, '140105199512222918', '马腾飞', 'f3150ee848504816b854a43c92cacdbe', 1573.43);
INSERT INTO `salarykoukuan` VALUES ('3ad42eb32f9c49c29300a9f09720ac61', 636, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 58.94, '140108198403290844', '杨青', 'f3150ee848504816b854a43c92cacdbe', 1849.09);
INSERT INTO `salarykoukuan` VALUES ('3afd854764aa4f9797d40cc11e7b4084', 648, 164.74, 0, 658.96, 0, 329.48, 0, 24.71, 0, 62.58, '140311198511141829', '张雅平', 'f3150ee848504816b854a43c92cacdbe', 1888.47);
INSERT INTO `salarykoukuan` VALUES ('3b49bb1b8bb5489394436a9cb5441f92', 711, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 465.88, '142228198605270027', '张晶晶', 'f3150ee848504816b854a43c92cacdbe', 2342.04);
INSERT INTO `salarykoukuan` VALUES ('3b6ce05cc2d441cd84fd0b1c58d3dbf5', 861, 222.88, 0, 891.52, 0, 445.76, 0, 33.43, 0, 498.74, '140102197303235159', '翟四团', 'f3150ee848504816b854a43c92cacdbe', 2953.33);
INSERT INTO `salarykoukuan` VALUES ('3b887cfe7b8b402cad72d9bbf199f7df', 657, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 89.59, '142703198511170367', '周琳', 'f3150ee848504816b854a43c92cacdbe', 1890.16);
INSERT INTO `salarykoukuan` VALUES ('3b911f617acc401fa79632511c81b801', 658, 167.56, 0, 670.24, 0, 335.12, 0, 25.13, 0, 65.34, '140103197506040657', '唐嘉尧', 'f3150ee848504816b854a43c92cacdbe', 1921.39);
INSERT INTO `salarykoukuan` VALUES ('3ba154c0df4c44fd9eca1050562a2d2f', 680, 173.28, 0, 693.12, 0, 346.56, 0, 25.99, 0, 161.32, '140402198002191624', '散利迪', 'f3150ee848504816b854a43c92cacdbe', 2080.27);
INSERT INTO `salarykoukuan` VALUES ('3bb1538a1de64c3fbe802a699660aecd', 690, 176.28, 0, 705.12, 0, 352.56, 0, 26.44, 0, 50.57, '142223197712306113', '王宇峰', 'f3150ee848504816b854a43c92cacdbe', 2000.97);
INSERT INTO `salarykoukuan` VALUES ('3c2dbc60732b4e17a9fb799111a2c094', 767, 198.58, 0, 794.32, 0, 397.16, 0, 29.79, 0, 51.18, '140102197712201486', '赵钦', 'f3150ee848504816b854a43c92cacdbe', 2238.03);
INSERT INTO `salarykoukuan` VALUES ('3cc81e33c2504867aeec6945e37db416', 895, 231.72, 0, 926.88, 0, 463.44, 0, 34.76, 0, 697.52, '140102196908032069', '常静', 'f3150ee848504816b854a43c92cacdbe', 3249.32);
INSERT INTO `salarykoukuan` VALUES ('3d53809de63a4e278b61c48dd3a889ce', 631, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 101.66, '140107198505281723', '王晶', 'f3150ee848504816b854a43c92cacdbe', 1876.23);
INSERT INTO `salarykoukuan` VALUES ('3d62fd008fb14376b8ccb5e6bd12482a', 628, 158.16, 0, 632.64, 0, 316.32, 0, 23.72, 0, 52.66, '140521198206023627', '王远芳', 'f3150ee848504816b854a43c92cacdbe', 1811.5);
INSERT INTO `salarykoukuan` VALUES ('3db8a9ea0adc4eee9863aa52b458aff4', 773, 195.96, 0, 783.84, 0, 391.92, 0, 29.39, 0, 368.28, '14220119711104456X', '张红梅', 'f3150ee848504816b854a43c92cacdbe', 2542.39);
INSERT INTO `salarykoukuan` VALUES ('3dc8d8ba52e94ca5b864b9581703ac82', 591, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 87.74, '140427199402158147', '秦雪洁', 'f3150ee848504816b854a43c92cacdbe', 1661.29);
INSERT INTO `salarykoukuan` VALUES ('3de74d5018eb47ecac72ed12d8fa90ee', 741, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 319.55, '140225198104123749', '郭丽丽', 'f3150ee848504816b854a43c92cacdbe', 2400.03);
INSERT INTO `salarykoukuan` VALUES ('3e17960ecc7d4b91a53ada320fbbb06b', 709, 182.52, 0, 730.08, 0, 365.04, 0, 27.38, 0, 42.84, '140106198305052524', '张媛', 'f3150ee848504816b854a43c92cacdbe', 2056.86);
INSERT INTO `salarykoukuan` VALUES ('3e49d062e006403894c189f1895c0700', 780, 202.12, 0, 808.48, 0, 404.24, 0, 30.32, 0, 118.46, '140102197306244827', '李莉', 'f3150ee848504816b854a43c92cacdbe', 2343.62);
INSERT INTO `salarykoukuan` VALUES ('3e521423ccde4b888e932f89beb36178', 693, 177.08, 0, 708.32, 0, 354.16, 0, 26.56, 0, 81.39, '460001197701040712', '陈作行', 'f3150ee848504816b854a43c92cacdbe', 2040.51);
INSERT INTO `salarykoukuan` VALUES ('3ea7977d358c40558ec81854d841164a', 539, 141.58, 0, 566.32, 0, 283.16, 0, 21.24, 0, 88.43, '130603199202152160', '杜洋洋', 'f3150ee848504816b854a43c92cacdbe', 1639.73);
INSERT INTO `salarykoukuan` VALUES ('3f2b136207054f9b878e8ee2882b3e11', 710, 178.08, 0, 712.32, 0, 356.16, 0, 26.71, 0, 0, '142622197908124210', '李峰', 'f3150ee848504816b854a43c92cacdbe', 1983.27);
INSERT INTO `salarykoukuan` VALUES ('3f54095cb3204209b4b28708eb1f5134', 631, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 56.66, '140121198309307225', '代芳芳', 'f3150ee848504816b854a43c92cacdbe', 1831.23);
INSERT INTO `salarykoukuan` VALUES ('3f5f613ec2424f35abc6d5b3f591a7cd', 681, 173.48, 0, 693.92, 0, 346.96, 0, 26.02, 0, 47.39, '142625197804221664', '史云青', 'f3150ee848504816b854a43c92cacdbe', 1968.77);
INSERT INTO `salarykoukuan` VALUES ('3f725360942c4a648ee0f07cbc47385d', 541, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 59.87, '140603199709219987', '孙泽利', 'f3150ee848504816b854a43c92cacdbe', 1575.27);
INSERT INTO `salarykoukuan` VALUES ('3f975f995d564c3f906e24eb222d5acf', 473, 133.58, 0, 534.32, 0, 267.16, 0, 20.04, 0, 56.42, '142402199707016646', '董颖虹', 'f3150ee848504816b854a43c92cacdbe', 1484.52);
INSERT INTO `salarykoukuan` VALUES ('3f9fe12e7ddb48fbaf69378f080e2045', 654, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 0, '140103198210024222', '乔虹', 'f3150ee848504816b854a43c92cacdbe', 1842.62);
INSERT INTO `salarykoukuan` VALUES ('40182ffc48d74c3d87e257539c8cbfba', 866, 217.08, 0, 868.32, 0, 434.16, 0, 32.56, 0, 519.09, '140103197108184225', '张芳', 'f3150ee848504816b854a43c92cacdbe', 2937.21);
INSERT INTO `salarykoukuan` VALUES ('4040b79a0f1e4cc698a924709532e4a9', 650, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 13.55, '140109198403110029', '张焱', 'f3150ee848504816b854a43c92cacdbe', 1817.7);
INSERT INTO `salarykoukuan` VALUES ('407796d3c3024e3ead854a9f1daa7e93', 625, 155.68, 0, 622.72, 0, 311.36, 0, 23.35, 0, 93, '141124198909260192', '刘伟', 'f3150ee848504816b854a43c92cacdbe', 1831.11);
INSERT INTO `salarykoukuan` VALUES ('407e5bdac48f435d9b68ea9ab8d70269', 654, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 67, '140104198110100028', '王卓蓉', 'f3150ee848504816b854a43c92cacdbe', 1909.62);
INSERT INTO `salarykoukuan` VALUES ('40b727c9ee4d41d1b1e618ec0d3312c5', 594, 149.66, 0, 598.64, 0, 299.32, 0, 22.45, 0, 84.12, '140104198109033710', '高磊', 'f3150ee848504816b854a43c92cacdbe', 1748.19);
INSERT INTO `salarykoukuan` VALUES ('40bfb24528f84f67b5030ddafb32f9c8', 277, 83.86, 0, 335.46, 0, 167.73, 0, 12.58, 0, 0, '140103196807161239', '王曦华', 'f3150ee848504816b854a43c92cacdbe', 876.63);
INSERT INTO `salarykoukuan` VALUES ('40cda1558d5d42fba5d8aa3dc5b5da8e', 590, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 86.89, '142302199102160017', '高思远', 'f3150ee848504816b854a43c92cacdbe', 1659.44);
INSERT INTO `salarykoukuan` VALUES ('411a880f269842599c73d7d7d8ba2475', 635, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 0, '140123198504073914', '程少华', 'f3150ee848504816b854a43c92cacdbe', 1789.15);
INSERT INTO `salarykoukuan` VALUES ('411dd25104194e638e9af30dce0897e4', 614, 154.98, 0, 619.92, 0, 309.96, 0, 23.25, 0, 2.97, '140102197912225191', '司远', 'f3150ee848504816b854a43c92cacdbe', 1725.08);
INSERT INTO `salarykoukuan` VALUES ('415454b9d676417d84722b7d792349c9', 682, 173.62, 0, 694.48, 0, 347.24, 0, 26.04, 0, 400.32, '14011219670819041X', '张立群', 'f3150ee848504816b854a43c92cacdbe', 2323.7);
INSERT INTO `salarykoukuan` VALUES ('415c385bc0c34fbaa12265d55b8f4656', 827, 215.12, 0, 860.48, 0, 430.24, 0, 32.27, 0, 608.98, '220104196604212661', '周璠', 'f3150ee848504816b854a43c92cacdbe', 2974.09);
INSERT INTO `salarykoukuan` VALUES ('41791bad670541778d3d3579907af14b', 602, 148.12, 0, 592.48, 0, 296.24, 0, 22.22, 0, 0, '140106198310100615', '梁勇', 'f3150ee848504816b854a43c92cacdbe', 1661.06);
INSERT INTO `salarykoukuan` VALUES ('41a373376dbb45e58b05c8639ada2962', 721, 182.52, 0, 730.08, 0, 365.04, 0, 27.38, 0, 0, '142630198508173018', '白国庆', 'f3150ee848504816b854a43c92cacdbe', 2026.02);
INSERT INTO `salarykoukuan` VALUES ('41cc72f41bd34e82ad07070ea602c875', 699, 174.24, 0, 696.96, 0, 348.48, 0, 26.14, 0, 76.56, '14010219701209232X', '代素文', 'f3150ee848504816b854a43c92cacdbe', 2021.38);
INSERT INTO `salarykoukuan` VALUES ('41fc56c5c2ff423592da6ea07b28a528', 733, 188.98, 0, 755.92, 0, 377.96, 0, 28.35, 0, 23.36, '140102198201121462', '王鹭', 'f3150ee848504816b854a43c92cacdbe', 2107.57);
INSERT INTO `salarykoukuan` VALUES ('4217d8892a5b49b6a7740389fc9c317b', 753, 194.98, 0, 779.92, 0, 389.96, 0, 29.25, 0, 457.48, '142702197911295512', '忽江华', 'f3150ee848504816b854a43c92cacdbe', 2604.59);
INSERT INTO `salarykoukuan` VALUES ('42545d82a98e42ce84e8f28f6e0b02f8', 921, 240.48, 0, 961.92, 0, 480.96, 0, 36.07, 0, 737.37, '140102196510040827', '王玉兰', 'f3150ee848504816b854a43c92cacdbe', 3377.8);
INSERT INTO `salarykoukuan` VALUES ('42b6241f0e2044999dfb338afdf65a49', 539, 141.58, 0, 566.32, 0, 283.16, 0, 21.24, 0, 88.43, '450305199010200042', '解伊瑞雯', 'f3150ee848504816b854a43c92cacdbe', 1639.73);
INSERT INTO `salarykoukuan` VALUES ('42fc1945fdb64dac8e30e73252eb1352', 616, 154.98, 0, 619.92, 0, 309.96, 0, 23.25, 0, 0, '142701198006180924', '许琴', 'f3150ee848504816b854a43c92cacdbe', 1724.11);
INSERT INTO `salarykoukuan` VALUES ('4335540f0a8c499ebfba1437f3987ad9', 537, 135.24, 0, 540.96, 0, 270.48, 0, 20.29, 0, 58.12, '14012119941108152X', '贾洁', 'f3150ee848504816b854a43c92cacdbe', 1562.09);
INSERT INTO `salarykoukuan` VALUES ('433b6d19d15e49f8b364263fe87aeae7', 571, 144, 0, 576, 0, 288, 0, 21.6, 0, 69.4, '372925197703216515', '时维教', 'f3150ee848504816b854a43c92cacdbe', 1670);
INSERT INTO `salarykoukuan` VALUES ('438a042824d64eed84233a6996557ca9', 761, 196.78, 0, 787.12, 0, 393.56, 0, 29.52, 0, 512.5, '142701198102183623', '霍霄妮', 'f3150ee848504816b854a43c92cacdbe', 2680.48);
INSERT INTO `salarykoukuan` VALUES ('44169c35449f497ba83e3ea42f601083', 714, 184.06, 0, 736.24, 0, 368.12, 0, 27.61, 0, 447.59, '140103197809261211', '王占君', 'f3150ee848504816b854a43c92cacdbe', 2477.62);
INSERT INTO `salarykoukuan` VALUES ('449994d9deab4050866d99f4ced7b1c2', 878, 232.38, 0, 929.52, 0, 464.76, 0, 34.86, 0, 700.65, '142301198003266018', '温明军', 'f3150ee848504816b854a43c92cacdbe', 3240.17);
INSERT INTO `salarykoukuan` VALUES ('44a74b94a8cc444e886335c32b954df4', 724, 181.88, 0, 727.52, 0, 363.76, 0, 27.28, 0, 87.53, '142729198008290023', '吉丽娟', 'f3150ee848504816b854a43c92cacdbe', 2111.97);
INSERT INTO `salarykoukuan` VALUES ('45c83c71b81c4679907370c4ba1caf46', 781, 202.36, 0, 809.44, 0, 404.72, 0, 30.35, 0, 273.44, '142321197502070029', '刘柯', 'f3150ee848504816b854a43c92cacdbe', 2501.31);
INSERT INTO `salarykoukuan` VALUES ('45ef31013f1744e2802ee18ee8db15fc', 625, 158.46, 0, 633.84, 0, 316.92, 0, 23.77, 0, 98.61, '140109199007021029', '杨凡', 'f3150ee848504816b854a43c92cacdbe', 1856.6);
INSERT INTO `salarykoukuan` VALUES ('4629cfe9c86e4f91bdec5163fa9255a6', 610, 153.34, 0, 613.36, 0, 306.68, 0, 23, 0, 1.37, '142401198301302422', '樊永晔', 'f3150ee848504816b854a43c92cacdbe', 1707.75);
INSERT INTO `salarykoukuan` VALUES ('46a8c56692174fd290ddc92dbdc02ae3', 641, 163.34, 0, 653.36, 0, 326.68, 0, 24.5, 0, 102.72, '14010219750325061X', '吴辉', 'f3150ee848504816b854a43c92cacdbe', 1911.6);
INSERT INTO `salarykoukuan` VALUES ('46cd371994044567b1cd0bb68f4a7c98', 816, 212.66, 0, 850.64, 0, 425.32, 0, 31.9, 0, 594.35, '140105196908140819', '范智华', 'f3150ee848504816b854a43c92cacdbe', 2930.87);
INSERT INTO `salarykoukuan` VALUES ('47503be9a6c940e3a9f814f1e0049c59', 646, 164.68, 0, 658.72, 0, 329.36, 0, 24.7, 0, 105.47, '142726197503163052', '张晓民', 'f3150ee848504816b854a43c92cacdbe', 1928.93);
INSERT INTO `salarykoukuan` VALUES ('47b213ff3554457aae32d15e0d24f2ed', 794, 202.12, 0, 808.48, 0, 404.24, 0, 30.32, 0, 259.02, '140104197402160845', '郭峥春', 'f3150ee848504816b854a43c92cacdbe', 2498.18);
INSERT INTO `salarykoukuan` VALUES ('483f51fd51fb432cb5ad21d26166bd55', 539, 141.58, 0, 566.32, 0, 283.16, 0, 21.24, 0, 88.43, '142228199402154522', '张蔚', 'f3150ee848504816b854a43c92cacdbe', 1639.73);
INSERT INTO `salarykoukuan` VALUES ('4843e4e8731e447b818c68ca99dda7f8', 680, 169.68, 0, 678.72, 0, 339.36, 0, 25.45, 0, 78.23, '14062419780128002X', '郭红梅', 'f3150ee848504816b854a43c92cacdbe', 1971.44);
INSERT INTO `salarykoukuan` VALUES ('48560b3c95684b75bce6f7c52a5d523a', 680, 169.68, 0, 678.72, 0, 339.36, 0, 25.45, 0, 78.23, '142321197810040622', '高新艳', 'f3150ee848504816b854a43c92cacdbe', 1971.44);
INSERT INTO `salarykoukuan` VALUES ('48a47651689f40bca4d71d15497b187d', 769, 199.52, 0, 798.08, 0, 399.04, 0, 29.93, 0, 531.64, '140105197501303713', '施新彬', 'f3150ee848504816b854a43c92cacdbe', 2727.21);
INSERT INTO `salarykoukuan` VALUES ('48bd64f2ebcf468fbc8c1988fd442a95', 715, 184.06, 0, 736.24, 0, 368.12, 0, 27.61, 0, 0, '142601198609262843', '王昕光', 'f3150ee848504816b854a43c92cacdbe', 2031.03);
INSERT INTO `salarykoukuan` VALUES ('48debeb7abe14e44b6a8168b253f88d9', 811, 210.64, 0, 842.56, 0, 421.28, 0, 31.6, 0, 439.21, '140102196911262367', '李雪琴', 'f3150ee848504816b854a43c92cacdbe', 2756.29);
INSERT INTO `salarykoukuan` VALUES ('48f328f8477a4062b4e8180da108c626', 810, 210.48, 0, 841.92, 0, 420.96, 0, 31.57, 0, 582.01, '14230219720911058X', '薛晓蓉', 'f3150ee848504816b854a43c92cacdbe', 2896.94);
INSERT INTO `salarykoukuan` VALUES ('48f708debf444d76ab4d9b77a99e0688', 663, 168.4, 0, 673.6, 0, 336.8, 0, 25.26, 0, 23.99, '140107198407061268', '宋欣', 'f3150ee848504816b854a43c92cacdbe', 1891.05);
INSERT INTO `salarykoukuan` VALUES ('48fd5668bb69408983bb5b71cdf871ea', 609, 151.86, 0, 607.44, 0, 303.72, 0, 22.78, 0, 0, '142402198202030018', '赵亢', 'f3150ee848504816b854a43c92cacdbe', 1694.8);
INSERT INTO `salarykoukuan` VALUES ('49d4e2140b3b47758ad98c526b950bca', 635, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 58.11, '370832198509062314', '马成乡', 'f3150ee848504816b854a43c92cacdbe', 1847.26);
INSERT INTO `salarykoukuan` VALUES ('4a03cdefece9442db653f799e97b0d55', 537, 141.58, 0, 566.32, 0, 283.16, 0, 21.24, 0, 87.59, '142625199301273314', '陈文兵', 'f3150ee848504816b854a43c92cacdbe', 1636.89);
INSERT INTO `salarykoukuan` VALUES ('4a17a3ba7b4349b5a7f9b0415fc0db62', 898, 236.34, 0, 945.36, 0, 472.68, 0, 35.45, 0, 729.37, '140102197104234022', '周方', 'f3150ee848504816b854a43c92cacdbe', 3317.2);
INSERT INTO `salarykoukuan` VALUES ('4a3bc7161d8c48d7b241f24965fd6115', 614, 155.68, 0, 622.72, 0, 311.36, 0, 23.35, 0, 94.26, '140106199001223069', '王天', 'f3150ee848504816b854a43c92cacdbe', 1821.37);
INSERT INTO `salarykoukuan` VALUES ('4a3c253906b84038adbca00c5ad0afa0', 748, 193.58, 0, 774.32, 0, 387.16, 0, 29.04, 0, 45.32, '140103197512050632', '黄凌', 'f3150ee848504816b854a43c92cacdbe', 2177.42);
INSERT INTO `salarykoukuan` VALUES ('4a639969e03a4215b5f143d49d0d64eb', 654, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 22, '140107198202111225', '张红玉', 'f3150ee848504816b854a43c92cacdbe', 1864.62);
INSERT INTO `salarykoukuan` VALUES ('4a753a23784f47efa1353860f4fd9c74', 802, 208.3, 0, 833.2, 0, 416.6, 0, 31.25, 0, 572.76, '140102197201295169', '张安琪', 'f3150ee848504816b854a43c92cacdbe', 2864.11);
INSERT INTO `salarykoukuan` VALUES ('4ac21094e49a47e49878c4ee885abc36', 1035, 0, 0, 1091.76, 0, 545.88, 0, 40.94, 0, 779.39, '140102196511282326', '刘媛媛', 'f3150ee848504816b854a43c92cacdbe', 3492.97);
INSERT INTO `salarykoukuan` VALUES ('4ad2f0b3a598491ab1d3fbb90e5b2e98', 654, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 112, '140103198110251524', '杨佳', 'f3150ee848504816b854a43c92cacdbe', 1954.62);
INSERT INTO `salarykoukuan` VALUES ('4adc7fee794f4f1ca3d9f8d112f15a44', 648, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 63.48, '140181198406034720', '韩雪', 'f3150ee848504816b854a43c92cacdbe', 1888.37);
INSERT INTO `salarykoukuan` VALUES ('4b093b8a644543eba4540829b413b888', 673, 171.48, 0, 685.92, 0, 342.96, 0, 25.72, 0, 139.52, '15262619800101332X', '杨素宜', 'f3150ee848504816b854a43c92cacdbe', 2038.6);
INSERT INTO `salarykoukuan` VALUES ('4b2df3a2865d4352a47d3106cc9e741a', 708, 181.88, 0, 727.52, 0, 363.76, 0, 27.28, 0, 0, '142222197812100335', '李向军', 'f3150ee848504816b854a43c92cacdbe', 2008.44);
INSERT INTO `salarykoukuan` VALUES ('4b304e937c65411a82844cbc04294fc7', 629, 155.14, 0, 620.56, 0, 310.28, 0, 23.27, 0, 47.67, '14040219840908322X', '李洁琼', 'f3150ee848504816b854a43c92cacdbe', 1785.92);
INSERT INTO `salarykoukuan` VALUES ('4ba6b3df01e1421b811be1a0a8abc2ec', 863, 227.24, 0, 908.96, 0, 454.48, 0, 34.09, 0, 525.84, '140102196904285173', '卢旺堂', 'f3150ee848504816b854a43c92cacdbe', 3013.61);
INSERT INTO `salarykoukuan` VALUES ('4bbfda36984f463c865cd22d5aa9821b', 653, 161.44, 0, 645.76, 0, 322.88, 0, 24.22, 0, 58.01, '142729198008171243', '张亚丽', 'f3150ee848504816b854a43c92cacdbe', 1865.31);
INSERT INTO `salarykoukuan` VALUES ('4bc4697808dc486e880aa664f7f04a3b', 669, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 0, '140105198803241866', '王晓林', 'f3150ee848504816b854a43c92cacdbe', 1834.16);
INSERT INTO `salarykoukuan` VALUES ('4c0ba2db38a74c66804ade54a7c51d12', 787, 196.18, 0, 784.72, 0, 392.36, 0, 29.43, 0, 384.63, '140121197708078023', '陈慧茹', 'f3150ee848504816b854a43c92cacdbe', 2574.32);
INSERT INTO `salarykoukuan` VALUES ('4c5d91b3ab594456977d9ca9bd5f7097', 619, 157.02, 0, 628.08, 0, 314.04, 0, 23.55, 0, 51.43, '142401198901291448', '侯莉芳', 'f3150ee848504816b854a43c92cacdbe', 1793.12);
INSERT INTO `salarykoukuan` VALUES ('4c70bdbfc82149a88873e3075fd91a9b', 696, 179.56, 0, 718.24, 0, 359.12, 0, 26.93, 0, 423.41, '220106198603110219', '张光华', 'f3150ee848504816b854a43c92cacdbe', 2403.26);
INSERT INTO `salarykoukuan` VALUES ('4ce1a1eaa1494186aeab451ea827f93f', 752, 190.78, 0, 763.12, 0, 381.56, 0, 28.62, 0, 16.43, '140103197802274212', '张凯', 'f3150ee848504816b854a43c92cacdbe', 2132.51);
INSERT INTO `salarykoukuan` VALUES ('4d19dbe4dec14f14938af31a49bdb9b4', 692, 177.06, 0, 708.24, 0, 354.12, 0, 26.56, 0, 78.54, '142223197607243915', '韩云伟', 'f3150ee848504816b854a43c92cacdbe', 2036.52);
INSERT INTO `salarykoukuan` VALUES ('4d4077665c054cdb8983ee92500b8efa', 823, 210.48, 0, 841.92, 0, 420.96, 0, 31.57, 0, 580.6, '140104197209100824', '李瑾', 'f3150ee848504816b854a43c92cacdbe', 2908.53);
INSERT INTO `salarykoukuan` VALUES ('4d80386037294fdcb91dc2ac0f9d5048', 718, 168.4, 0, 673.6, 0, 336.8, 0, 25.26, 0, 75.18, '220105198402111243', '李文欢', 'f3150ee848504816b854a43c92cacdbe', 1997.24);
INSERT INTO `salarykoukuan` VALUES ('4de4f1bfa529434bbf5f56a54d6c93fe', 1012, 0, 0, 1059.36, 0, 529.68, 0, 39.73, 0, 833.92, '142401196808130325', '刘月红', 'f3150ee848504816b854a43c92cacdbe', 3474.69);
INSERT INTO `salarykoukuan` VALUES ('4de885890f2543ce8ef40fb517919d84', 741, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 50.5, '140102198008195224', '张科星', 'f3150ee848504816b854a43c92cacdbe', 2130.98);
INSERT INTO `salarykoukuan` VALUES ('4e47646a460343558a583b987153be5d', 567, 142.28, 0, 569.12, 0, 284.56, 0, 21.34, 0, 0, '140122198401090125', '李娜', 'f3150ee848504816b854a43c92cacdbe', 1584.3);
INSERT INTO `salarykoukuan` VALUES ('4e9e0a5f139d4b019a1bd5471bc4a551', 614, 155.68, 0, 622.72, 0, 311.36, 0, 23.35, 0, 94.26, '230505199003270528', '郭宇朦', 'f3150ee848504816b854a43c92cacdbe', 1821.37);
INSERT INTO `salarykoukuan` VALUES ('4eac9ad16f8541f3907fc7f1b9e4a609', 707, 180.18, 0, 720.72, 0, 360.36, 0, 27.03, 0, 433.72, '140103196511110037', '郝清义', 'f3150ee848504816b854a43c92cacdbe', 2429.01);
INSERT INTO `salarykoukuan` VALUES ('4ed5b37e6b3848c085d3810708a86810', 625, 158.46, 0, 633.84, 0, 316.92, 0, 23.77, 0, 98.61, '142222198809110027', '徐睿', 'f3150ee848504816b854a43c92cacdbe', 1856.6);
INSERT INTO `salarykoukuan` VALUES ('4edb8091176a4036b7c78a77ee10f662', 636, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 58.94, '14233019851228622X', '岳彦青', 'f3150ee848504816b854a43c92cacdbe', 1849.09);
INSERT INTO `salarykoukuan` VALUES ('4ef4961bdd0e42b4b252be1b9ed3b724', 537, 141.58, 0, 566.32, 0, 283.16, 0, 21.24, 0, 87.59, '140481199303083213', '成宇飞', 'f3150ee848504816b854a43c92cacdbe', 1636.89);
INSERT INTO `salarykoukuan` VALUES ('4f527e310afc4a8bbd6cfd840bc4073c', 642, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 0, '140105198312210547', '刘旭峰', 'f3150ee848504816b854a43c92cacdbe', 1807.16);
INSERT INTO `salarykoukuan` VALUES ('4fa3af8ee1e54b50ba4f11bd8bfbe8bc', 745, 188.98, 0, 755.92, 0, 377.96, 0, 28.35, 0, 473.77, '140511198107181918', '李小广', 'f3150ee848504816b854a43c92cacdbe', 2569.98);
INSERT INTO `salarykoukuan` VALUES ('4fbaa9e5d3734903acb5fedc167ccc9d', 702, 175.28, 0, 701.12, 0, 350.56, 0, 26.29, 0, 19.41, '140102197912204024', '张欣', 'f3150ee848504816b854a43c92cacdbe', 1974.66);
INSERT INTO `salarykoukuan` VALUES ('506023bdea5f4befae1e435e906abb33', 591, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 87.73, '140481199502086820', '甄家琪', 'f3150ee848504816b854a43c92cacdbe', 1661.28);
INSERT INTO `salarykoukuan` VALUES ('5095e79ba69d43329257ea2e99a62f17', 631, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 101.66, '142325198606210022', '李楠', 'f3150ee848504816b854a43c92cacdbe', 1876.23);
INSERT INTO `salarykoukuan` VALUES ('50bd93fa627341af8bae871a8c56285d', 788, 204.1, 0, 816.4, 0, 408.2, 0, 30.62, 0, 404.27, '140104197310110322', '刘永红', 'f3150ee848504816b854a43c92cacdbe', 2651.59);
INSERT INTO `salarykoukuan` VALUES ('50cdd3f3d08946a6a2c246a9233d1fba', 733, 188.98, 0, 755.92, 0, 377.96, 0, 28.35, 0, 53.36, '140511198209292360', '魏丽芳', 'f3150ee848504816b854a43c92cacdbe', 2137.57);
INSERT INTO `salarykoukuan` VALUES ('50d4fd8bf3714a909c76dba5842658c1', 681, 173.48, 0, 693.92, 0, 346.96, 0, 26.02, 0, 0, '140522198211172324', '栗文敏', 'f3150ee848504816b854a43c92cacdbe', 1921.38);
INSERT INTO `salarykoukuan` VALUES ('50f35c51b5e64ea0bee757a9f8991a23', 715, 184.06, 0, 736.24, 0, 368.12, 0, 27.61, 0, 135.11, '140110198307071547', '韩婷婷', 'f3150ee848504816b854a43c92cacdbe', 2166.14);
INSERT INTO `salarykoukuan` VALUES ('51a1594c20774e75b66d2e6deb1f52ea', 642, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 55.39, '142601198605089713', '王鹏', 'f3150ee848504816b854a43c92cacdbe', 1840.96);
INSERT INTO `salarykoukuan` VALUES ('51d6bbdd04f54c85becc48e1b029c6bf', 832, 217.08, 0, 868.32, 0, 434.16, 0, 32.56, 0, 614.59, '142224196810090012', '张永清', 'f3150ee848504816b854a43c92cacdbe', 2998.71);
INSERT INTO `salarykoukuan` VALUES ('51dcc295c0ff428db9ed10c6058dbdbd', 788, 204.34, 0, 817.36, 0, 408.68, 0, 30.65, 0, 550.09, '140103197402170027', '谭丽燕', 'f3150ee848504816b854a43c92cacdbe', 2799.12);
INSERT INTO `salarykoukuan` VALUES ('5212eeb052fd416c84754ea3c24c565a', 642, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 16.22, '14010219820518062X', '李江雯', 'f3150ee848504816b854a43c92cacdbe', 1823.38);
INSERT INTO `salarykoukuan` VALUES ('5222b8abc7324ae1a506742ff8ff9281', 623, 156.78, 0, 627.12, 0, 313.56, 0, 23.52, 0, 0, '140302197902010569', '田扬', 'f3150ee848504816b854a43c92cacdbe', 1743.98);
INSERT INTO `salarykoukuan` VALUES ('52ca724a0ede4b6796542806f3409820', 654, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 22, '140107198203061223', '李美意', 'f3150ee848504816b854a43c92cacdbe', 1864.62);
INSERT INTO `salarykoukuan` VALUES ('52fb756e94574bac8409a2782dec3198', 787, 200.14, 0, 800.56, 0, 400.28, 0, 30.02, 0, 60.96, '142422197506111520', '张彩霞', 'f3150ee848504816b854a43c92cacdbe', 2278.96);
INSERT INTO `salarykoukuan` VALUES ('53e8e3ead5084027b637021c95f375ce', 767, 198.58, 0, 794.32, 0, 397.16, 0, 29.79, 0, 253.91, '140430197605140026', '田大惠', 'f3150ee848504816b854a43c92cacdbe', 2440.76);
INSERT INTO `salarykoukuan` VALUES ('53fc113581de421fb3f512c10ed6d72b', 768, 194.98, 0, 779.92, 0, 389.96, 0, 29.25, 0, 325.57, '140311197803183620', '侯海霞', 'f3150ee848504816b854a43c92cacdbe', 2487.68);
INSERT INTO `salarykoukuan` VALUES ('545f3294f1f94de89da08d8465176d80', 679, 168.48, 0, 673.92, 0, 336.96, 0, 25.27, 0, 257.56, '140104197605161725', '郑峰', 'f3150ee848504816b854a43c92cacdbe', 2141.19);
INSERT INTO `salarykoukuan` VALUES ('546e0f12bcb842bbba7d5fe3672e863c', 785, 200.14, 0, 800.56, 0, 400.28, 0, 30.02, 0, 378.6, '140102197510206510', '王东亮', 'f3150ee848504816b854a43c92cacdbe', 2594.6);
INSERT INTO `salarykoukuan` VALUES ('55052ac8103842c29f5b750869bfba2d', 919, 0, 0, 959.04, 0, 479.52, 0, 35.96, 0, 763.15, '140102197608312346', '刘荷花', 'f3150ee848504816b854a43c92cacdbe', 3156.67);
INSERT INTO `salarykoukuan` VALUES ('550ff54fb8b940888c6ead225a87f486', 879, 231.72, 0, 926.88, 0, 463.44, 0, 34.76, 0, 596.01, '140105196911275036', '吴永胜', 'f3150ee848504816b854a43c92cacdbe', 3131.81);
INSERT INTO `salarykoukuan` VALUES ('55207f1936e6484aad045b2bd7abb801', 614, 154.98, 0, 619.92, 0, 309.96, 0, 23.25, 0, 0, '140104198009280378', '刘乐澄', 'f3150ee848504816b854a43c92cacdbe', 1722.11);
INSERT INTO `salarykoukuan` VALUES ('55367ef57a08477797ac868126254a44', 614, 155.68, 0, 622.72, 0, 311.36, 0, 23.35, 0, 49.26, '140108199106241223', '黄莺', 'f3150ee848504816b854a43c92cacdbe', 1776.37);
INSERT INTO `salarykoukuan` VALUES ('55938fff96734fde9ece9f83c022656d', 464, 138.98, 0, 555.92, 0, 277.96, 0, 20.85, 0, 4.12, '142726199602213325', '郝爽', 'f3150ee848504816b854a43c92cacdbe', 1461.83);
INSERT INTO `salarykoukuan` VALUES ('55c0a17108124fd98cecd9133cbd7c7d', 845, 219.88, 0, 879.52, 0, 439.76, 0, 32.98, 0, 626.79, '140103197305110647', '张彤华', 'f3150ee848504816b854a43c92cacdbe', 3043.93);
INSERT INTO `salarykoukuan` VALUES ('560167f4b2db41a3b3c47912e80c9e3e', 722, 181.88, 0, 727.52, 0, 363.76, 0, 27.28, 0, 136.8, '142424197709156510', '申世明', 'f3150ee848504816b854a43c92cacdbe', 2159.24);
INSERT INTO `salarykoukuan` VALUES ('5634c6a0fec6425f836c4869831a9ed9', 725, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 50.06, '140102198207313414', '胡轶', 'f3150ee848504816b854a43c92cacdbe', 2114.54);
INSERT INTO `salarykoukuan` VALUES ('563803a060754046a7932b52f61479d1', 769, 199.52, 0, 798.08, 0, 399.04, 0, 29.93, 0, 531.64, '140102197204022318', '何炜', 'f3150ee848504816b854a43c92cacdbe', 2727.21);
INSERT INTO `salarykoukuan` VALUES ('5682000100d54fed97d2bc4ed82ca610', 727, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 65.89, '142601198211181920', '张新华', 'f3150ee848504816b854a43c92cacdbe', 2132.37);
INSERT INTO `salarykoukuan` VALUES ('56960092703d4be48be712ebe35830cc', 778, 202.12, 0, 808.48, 0, 404.24, 0, 30.32, 0, 117.62, '14112419730127011X', '闫震普', 'f3150ee848504816b854a43c92cacdbe', 2340.78);
INSERT INTO `salarykoukuan` VALUES ('56f8918c542240d98808b69e37d16639', 671, 167.56, 0, 670.24, 0, 335.12, 0, 25.13, 0, 4.8, '140112197405153210', '薛寅虎', 'f3150ee848504816b854a43c92cacdbe', 1873.85);
INSERT INTO `salarykoukuan` VALUES ('56f90e46071b45609df33993e301754f', 539, 141.58, 0, 566.32, 0, 283.16, 0, 21.24, 0, 88.43, '150421199211051228', '李晓楠', 'f3150ee848504816b854a43c92cacdbe', 1639.73);
INSERT INTO `salarykoukuan` VALUES ('57369d9c45584224bb8892b18b49c8eb', 695, 177.08, 0, 708.32, 0, 354.16, 0, 26.56, 0, 22.23, '142431197904270021', '邵海林', 'f3150ee848504816b854a43c92cacdbe', 1983.35);
INSERT INTO `salarykoukuan` VALUES ('573c886423ad44d8959cbb2c38039937', 646, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 0, '140102198209106515', '潘琛', 'f3150ee848504816b854a43c92cacdbe', 1822.89);
INSERT INTO `salarykoukuan` VALUES ('5742720311504e558485e1fdf60c261a', 563, 138.56, 0, 554.24, 0, 277.12, 0, 20.78, 0, 0, '140105199210122233', '杨浩宇', 'f3150ee848504816b854a43c92cacdbe', 1553.7);
INSERT INTO `salarykoukuan` VALUES ('57509ddaa6aa4087abb4e1a6baead558', 695, 173.48, 0, 693.92, 0, 346.96, 0, 26.02, 0, 122, '140102198207113420', '李宁宁', 'f3150ee848504816b854a43c92cacdbe', 2057.38);
INSERT INTO `salarykoukuan` VALUES ('5755f6e06e83420c9e401a68325a5a0e', 487, 138.56, 0, 554.24, 0, 277.12, 0, 20.78, 0, 65.13, '142301199306154149', '张茹', 'f3150ee848504816b854a43c92cacdbe', 1542.83);
INSERT INTO `salarykoukuan` VALUES ('57f4dd5842164668a7e313fe1768d3d9', 832, 217.08, 0, 868.32, 0, 434.16, 0, 32.56, 0, 615.01, '61011319691114045X', '巩利平', 'f3150ee848504816b854a43c92cacdbe', 2999.13);
INSERT INTO `salarykoukuan` VALUES ('587dde4399494bfb8193039d543336f1', 729, 186.8, 0, 747.2, 0, 373.6, 0, 28.02, 0, 179.25, '14223319720528002X', '续珍', 'f3150ee848504816b854a43c92cacdbe', 2243.87);
INSERT INTO `salarykoukuan` VALUES ('58bd158772f5450b9b1d313452f3a97f', 557, 139.8, 0, 559.2, 0, 279.6, 0, 20.97, 0, 67.69, '330424199211280066', '周博雅', 'f3150ee848504816b854a43c92cacdbe', 1624.26);
INSERT INTO `salarykoukuan` VALUES ('58e7419e03944d3685e812cb7b6f31e0', 642, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 16.22, '140107198202034522', '李楠', 'f3150ee848504816b854a43c92cacdbe', 1823.38);
INSERT INTO `salarykoukuan` VALUES ('591694d315df406d99bbfa5ded61d2f8', 537, 135.24, 0, 540.96, 0, 270.48, 0, 20.29, 0, 58.12, '140106199511131842', '高佳玲', 'f3150ee848504816b854a43c92cacdbe', 1562.09);
INSERT INTO `salarykoukuan` VALUES ('59a03a1b1a1a48a38168f80d1a73a29c', 681, 173.48, 0, 693.92, 0, 346.96, 0, 26.02, 0, 2.38, '140105198005141326', '郑慧敏', 'f3150ee848504816b854a43c92cacdbe', 1923.76);
INSERT INTO `salarykoukuan` VALUES ('59a7bbed4290428bb458ffeac1bee9d1', 802, 208.3, 0, 833.2, 0, 416.6, 0, 31.25, 0, 66.92, '140102197208312320', '任雪娟', 'f3150ee848504816b854a43c92cacdbe', 2358.27);
INSERT INTO `salarykoukuan` VALUES ('59ba5d09b25e4f26a4f894d6510ce982', 898, 0, 0, 936.72, 0, 468.36, 0, 35.13, 0, 580.87, '140602197909058617', '常浩', 'f3150ee848504816b854a43c92cacdbe', 2919.08);
INSERT INTO `salarykoukuan` VALUES ('59ba868bc1624b88ba2158ee12890a67', 480, 151.86, 0, 607.44, 0, 303.72, 0, 22.78, 0, 73.24, '652826199104140042', '李俊毅', 'f3150ee848504816b854a43c92cacdbe', 1639.04);
INSERT INTO `salarykoukuan` VALUES ('59ee348b02d847d8921842e125d9f8b2', 768, 198.14, 0, 792.56, 0, 396.28, 0, 29.72, 0, 68.94, '140202197001014022', '周晓燕', 'f3150ee848504816b854a43c92cacdbe', 2253.64);
INSERT INTO `salarykoukuan` VALUES ('59fd1f5f29744919aac849276959eb51', 598, 151.86, 0, 607.44, 0, 303.72, 0, 22.78, 0, 86.92, '141124199204080209', '郭玉婷', 'f3150ee848504816b854a43c92cacdbe', 1770.72);
INSERT INTO `salarykoukuan` VALUES ('5a26a61d102d4727910fb04c9558793f', 839, 219.32, 0, 877.28, 0, 438.64, 0, 32.9, 0, 624.69, '142325197105030010', '张晋军', 'f3150ee848504816b854a43c92cacdbe', 3031.83);
INSERT INTO `salarykoukuan` VALUES ('5a92d0a5033b44c2a946f2a8c5094bb8', 610, 153.34, 0, 613.36, 0, 306.68, 0, 23, 0, 91.37, '14031119810920182X', '张瑞芳', 'f3150ee848504816b854a43c92cacdbe', 1797.75);
INSERT INTO `salarykoukuan` VALUES ('5ada7254e1374f9684e5c9c9e35e7c3f', 471, 133.58, 0, 534.32, 0, 267.16, 0, 20.04, 0, 55.58, '140424199705030010', '王旭', 'f3150ee848504816b854a43c92cacdbe', 1481.68);
INSERT INTO `salarykoukuan` VALUES ('5af30ac0ff944a2eaf200a39907de25d', 539, 141.58, 0, 566.32, 0, 283.16, 0, 21.24, 0, 88.43, '140202199509104028', '刘晓燕', 'f3150ee848504816b854a43c92cacdbe', 1639.73);
INSERT INTO `salarykoukuan` VALUES ('5b17571001f34db2951307ae4e63003a', 635, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 13.1, '140107198206021219', '徐斌', 'f3150ee848504816b854a43c92cacdbe', 1802.25);
INSERT INTO `salarykoukuan` VALUES ('5b33982d26e94efcb193836ee55426dd', 693, 177.08, 0, 708.32, 0, 354.16, 0, 26.56, 0, 51.39, '142429197704103817', '韩瑞刚', 'f3150ee848504816b854a43c92cacdbe', 2010.51);
INSERT INTO `salarykoukuan` VALUES ('5b8b56c43e87444eb923044094d7bee7', 826, 216.74, 0, 866.96, 0, 433.48, 0, 32.51, 0, 618.23, '140102197010300690', '王建军', 'f3150ee848504816b854a43c92cacdbe', 2993.92);
INSERT INTO `salarykoukuan` VALUES ('5bb1f9cdded74deca27b5508278f9119', 640, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 15.38, '140107198506153918', '刘刚', 'f3150ee848504816b854a43c92cacdbe', 1820.54);
INSERT INTO `salarykoukuan` VALUES ('5c439b3a829b4df6a954f7ef934970c1', 598, 151.86, 0, 607.44, 0, 303.72, 0, 22.78, 0, 86.92, '142623199408194322', '杨惠惠', 'f3150ee848504816b854a43c92cacdbe', 1770.72);
INSERT INTO `salarykoukuan` VALUES ('5c6187af6f6245cf923019004cb13f55', 578, 145.16, 0, 580.64, 0, 290.32, 0, 21.77, 0, 77.34, '140511198706236044', '常星星', 'f3150ee848504816b854a43c92cacdbe', 1693.23);
INSERT INTO `salarykoukuan` VALUES ('5c805c7771c9495f9ecd1546eef4bea0', 721, 185.7, 0, 742.8, 0, 371.4, 0, 27.86, 0, 92.37, '142430198205290021', '任金妮', 'f3150ee848504816b854a43c92cacdbe', 2141.13);
INSERT INTO `salarykoukuan` VALUES ('5ca3584710ad47b9ab55a047afc747bb', 644, 163.08, 0, 652.32, 0, 326.16, 0, 24.46, 0, 105.03, '140112197909131277', '张海鹏', 'f3150ee848504816b854a43c92cacdbe', 1915.05);
INSERT INTO `salarykoukuan` VALUES ('5cd2390dae644295a41194d38e5076a9', 539, 141.58, 0, 566.32, 0, 283.16, 0, 21.24, 0, 88.43, '140721199109070080', '杨静', 'f3150ee848504816b854a43c92cacdbe', 1639.73);
INSERT INTO `salarykoukuan` VALUES ('5d049e0f4a6a49169ded10cfa3305fc3', 767, 198.58, 0, 794.32, 0, 397.16, 0, 29.79, 0, 521.82, '140102197706281440', '昝红宇', 'f3150ee848504816b854a43c92cacdbe', 2708.67);
INSERT INTO `salarykoukuan` VALUES ('5d0dff7f6f6f41f486a591d63d2019e5', 682, 170.04, 0, 680.16, 0, 340.08, 0, 25.51, 0, 117.1, '140105198201180023', '王贇', 'f3150ee848504816b854a43c92cacdbe', 2014.89);
INSERT INTO `salarykoukuan` VALUES ('5d2fe4bb036d4458818b5a3d4311876d', 598, 150.06, 0, 600.24, 0, 300.12, 0, 22.51, 0, 55.59, '142703197811053328', '周荣霞', 'f3150ee848504816b854a43c92cacdbe', 1726.52);
INSERT INTO `salarykoukuan` VALUES ('5d309db34062478cac4b13f1c7cab0a2', 540, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 59.03, '140421199309231217', '史彦鑫', 'f3150ee848504816b854a43c92cacdbe', 1573.43);
INSERT INTO `salarykoukuan` VALUES ('5d723d18c7be45c9a7ee0253b09ee34c', 462, 138.98, 0, 555.92, 0, 277.96, 0, 20.85, 0, 67.69, '320322199103104452', '张恩', 'f3150ee848504816b854a43c92cacdbe', 1523.4);
INSERT INTO `salarykoukuan` VALUES ('5d9d65a6634e42c79fb9b9a2971934b2', 596, 149.66, 0, 598.64, 0, 299.32, 0, 22.45, 0, 84.99, '140121198402290624', '张智娟', 'f3150ee848504816b854a43c92cacdbe', 1751.06);
INSERT INTO `salarykoukuan` VALUES ('5dc8874c65fd460d831ab2ab55b8f978', 810, 210.28, 0, 841.12, 0, 420.56, 0, 31.54, 0, 438.85, '140102196710024047', '钱蓉', 'f3150ee848504816b854a43c92cacdbe', 2752.35);
INSERT INTO `salarykoukuan` VALUES ('5df9ffa164ad4aedac3a34770743bfdf', 648, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 3.48, '142726198402283922', '吴静', 'f3150ee848504816b854a43c92cacdbe', 1828.37);
INSERT INTO `salarykoukuan` VALUES ('5e172a649b43432890e321484e8c5b48', 549, 135.24, 0, 540.96, 0, 270.48, 0, 20.29, 0, 56.85, '371325199610100519', '汪龙飞', 'f3150ee848504816b854a43c92cacdbe', 1572.82);
INSERT INTO `salarykoukuan` VALUES ('5e1c20173c744305959fc7525d3bc96f', 553, 155.68, 0, 622.72, 0, 311.36, 0, 23.35, 0, 92.52, '140603198810264913', '魏宏', 'f3150ee848504816b854a43c92cacdbe', 1758.63);
INSERT INTO `salarykoukuan` VALUES ('5e3b6fdcd88144d0b29bd3199aeb96ca', 606, 152.94, 0, 611.76, 0, 305.88, 0, 22.94, 0, 0, '140102198006141417', '郭巍', 'f3150ee848504816b854a43c92cacdbe', 1699.52);
INSERT INTO `salarykoukuan` VALUES ('5e4ca1b1d27d4ea5b00418365a73edd3', 654, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 0, '140121198204019024', '张芝秀', 'f3150ee848504816b854a43c92cacdbe', 1842.62);
INSERT INTO `salarykoukuan` VALUES ('5e7a22cf8b194e68881bcd394f1d8d07', 610, 153.34, 0, 613.36, 0, 306.68, 0, 23, 0, 91.37, '140105198209200543', '王赟', 'f3150ee848504816b854a43c92cacdbe', 1797.75);
INSERT INTO `salarykoukuan` VALUES ('5ec610f765db4fe09bd031d17678ce3a', 620, 154.34, 0, 617.36, 0, 308.68, 0, 23.15, 0, 45.82, '140581199007153913', '杨航', 'f3150ee848504816b854a43c92cacdbe', 1769.35);
INSERT INTO `salarykoukuan` VALUES ('5ee7af68278e4f8b9ea3e695660b69aa', 808, 207.38, 0, 829.52, 0, 414.76, 0, 31.11, 0, 274.12, '142231197904040102', '曹剑', 'f3150ee848504816b854a43c92cacdbe', 2564.89);
INSERT INTO `salarykoukuan` VALUES ('5f21348d38b04b9bb6f61c10464d1c8c', 903, 235.72, 0, 942.88, 0, 471.44, 0, 35.36, 0, 639.52, '140112196512081289', '闫晓平', 'f3150ee848504816b854a43c92cacdbe', 3227.92);
INSERT INTO `salarykoukuan` VALUES ('5f274487287e4045849801f834a99f3b', 1002, 0, 0, 1040.88, 0, 520.44, 0, 39.03, 0, 660.36, '510102196610276123', '康晓红', 'f3150ee848504816b854a43c92cacdbe', 3262.71);
INSERT INTO `salarykoukuan` VALUES ('5fa87e0400ee49cc9befaea9701d5c16', 546, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 63.59, '140105199409200024', '张羽翔', 'f3150ee848504816b854a43c92cacdbe', 1592.14);
INSERT INTO `salarykoukuan` VALUES ('5fb1125f41404451a296a0bb22081a58', 663, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 4.88, '140105198201051846', '张金萍', 'f3150ee848504816b854a43c92cacdbe', 1822.03);
INSERT INTO `salarykoukuan` VALUES ('6028d5c433234f1d82d67e3de920476a', 695, 177.08, 0, 708.32, 0, 354.16, 0, 26.56, 0, 22.33, '140104197311092226', '王爱芬', 'f3150ee848504816b854a43c92cacdbe', 1983.45);
INSERT INTO `salarykoukuan` VALUES ('602c87809630414687dd9e1e2ac24c03', 788, 204.34, 0, 817.36, 0, 408.68, 0, 30.65, 0, 198.27, '142222197504200027', '韩峰', 'f3150ee848504816b854a43c92cacdbe', 2447.3);
INSERT INTO `salarykoukuan` VALUES ('6056bf891ad74091b29ecb2995334169', 551, 138.56, 0, 554.24, 0, 277.12, 0, 20.78, 0, 65.64, '141102199312070122', '郝书帆', 'f3150ee848504816b854a43c92cacdbe', 1607.34);
INSERT INTO `salarykoukuan` VALUES ('605b79dbf8254b88a3789a1eea3e8b3a', 623, 158.46, 0, 633.84, 0, 316.92, 0, 23.77, 0, 154.9, '140402198507310414', '周扬', 'f3150ee848504816b854a43c92cacdbe', 1910.89);
INSERT INTO `salarykoukuan` VALUES ('60c478c51b9a4bb99b200665b0a7dac1', 721, 185.7, 0, 742.8, 0, 371.4, 0, 27.86, 0, 457.92, '140481198306063627', '陈荷花', 'f3150ee848504816b854a43c92cacdbe', 2506.68);
INSERT INTO `salarykoukuan` VALUES ('6101f71f1f4b44e7b59285ad46911aa7', 631, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 56.66, '142732198611210428', '董慧芳', 'f3150ee848504816b854a43c92cacdbe', 1831.23);
INSERT INTO `salarykoukuan` VALUES ('6164979345004805aee0ab0ba12ac09f', 690, 171.68, 0, 686.72, 0, 343.36, 0, 25.75, 0, 36.74, '140109198106211560', '张融', 'f3150ee848504816b854a43c92cacdbe', 1954.25);
INSERT INTO `salarykoukuan` VALUES ('6169acd1208344fb92b3c118241a5268', 786, 203.68, 0, 814.72, 0, 407.36, 0, 30.55, 0, 403.38, '140103197303304827', '侯春柳', 'f3150ee848504816b854a43c92cacdbe', 2645.69);
INSERT INTO `salarykoukuan` VALUES ('6190f2f54fa5456ebf186eddcd93f727', 521, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 0, '140106198511250628', '薛愈洁', 'f3150ee848504816b854a43c92cacdbe', 1675.15);
INSERT INTO `salarykoukuan` VALUES ('61a603891bbe4de897a5e72205465b4c', 962, 247.88, 0, 991.52, 0, 495.76, 0, 37.18, 0, 778.37, '140103197303070688', '李文洁', 'f3150ee848504816b854a43c92cacdbe', 3512.71);
INSERT INTO `salarykoukuan` VALUES ('624c4cdaa8094f9db5d7c13527ded553', 738, 190.78, 0, 763.12, 0, 381.56, 0, 28.62, 0, 39.93, '410323198204160553', '吕振伟', 'f3150ee848504816b854a43c92cacdbe', 2142.01);
INSERT INTO `salarykoukuan` VALUES ('62517513a94c4227b44200984239a985', 679, 172.68, 0, 690.72, 0, 345.36, 0, 25.9, 0, 405.33, '140102198006076547', '苏文丽', 'f3150ee848504816b854a43c92cacdbe', 2318.99);
INSERT INTO `salarykoukuan` VALUES ('626624976e714320a093840491a16789', 473, 133.58, 0, 534.32, 0, 267.16, 0, 20.04, 0, 56.42, '140302199612260825', '刘玥', 'f3150ee848504816b854a43c92cacdbe', 1484.52);
INSERT INTO `salarykoukuan` VALUES ('62b4903009224c7a942faa5681a57bc4', 607, 141.04, 0, 564.16, 0, 282.08, 0, 21.16, 0, 19.97, '142702199302281245', '相蕾', 'f3150ee848504816b854a43c92cacdbe', 1635.41);
INSERT INTO `salarykoukuan` VALUES ('62e69b6531554d54af5709f84c3ae6da', 892, 233.34, 0, 933.36, 0, 466.68, 0, 35, 0, 550.25, '140102196510140633', '兰贵亭', 'f3150ee848504816b854a43c92cacdbe', 3110.63);
INSERT INTO `salarykoukuan` VALUES ('62fa2cc34fd94c9ab967fc879200f78e', 592, 148.52, 0, 594.08, 0, 297.04, 0, 22.28, 0, 24.93, '140105198302010066', '叶丹青', 'f3150ee848504816b854a43c92cacdbe', 1678.85);
INSERT INTO `salarykoukuan` VALUES ('638989af61fe4ecea3e98d5568647543', 537, 141.58, 0, 566.32, 0, 283.16, 0, 21.24, 0, 87.59, '142303199004288339', '张伟', 'f3150ee848504816b854a43c92cacdbe', 1636.89);
INSERT INTO `salarykoukuan` VALUES ('640d23fee12f475a9268003564718b04', 928, 243.06, 0, 972.24, 0, 486.12, 0, 36.46, 0, 595.81, '14010319651116211X', '李海林', 'f3150ee848504816b854a43c92cacdbe', 3261.69);
INSERT INTO `salarykoukuan` VALUES ('642f83fac3284c89aa0d4fdd68bb9742', 807, 206.28, 0, 825.12, 0, 412.56, 0, 30.94, 0, 559.66, '140106197201311814', '王国胜', 'f3150ee848504816b854a43c92cacdbe', 2841.56);
INSERT INTO `salarykoukuan` VALUES ('64f9e8ae089a49bb8abb8bda7e673056', 677, 154.34, 0, 617.36, 0, 308.68, 0, 23.15, 0, 418.74, '14270219920929552X', '尚珍珍', 'f3150ee848504816b854a43c92cacdbe', 2199.27);
INSERT INTO `salarykoukuan` VALUES ('658bbc8e5dce427e97da6d42b3ca2016', 718, 184.74, 0, 738.96, 0, 369.48, 0, 27.71, 0, 17.76, '140302198010170828', '杜芳', 'f3150ee848504816b854a43c92cacdbe', 2056.65);
INSERT INTO `salarykoukuan` VALUES ('6626407cb61944f3a05c3f0c77108e4f', 516, 142.38, 0, 569.52, 0, 284.76, 0, 21.36, 0, 71.91, '140107198704141221', '王喆', 'f3150ee848504816b854a43c92cacdbe', 1605.93);
INSERT INTO `salarykoukuan` VALUES ('66658234284346a7bf2eb724bdfcb5c8', 635, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 13.1, '140106198507243011', '闫钊', 'f3150ee848504816b854a43c92cacdbe', 1802.25);
INSERT INTO `salarykoukuan` VALUES ('6665cb76921841a49aa47b3e6f4eb948', 556, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 0, '140106198109201924', '郭妍琼', 'f3150ee848504816b854a43c92cacdbe', 1721.16);
INSERT INTO `salarykoukuan` VALUES ('666abb91523e4d0a9654532e6fcb78b5', 662, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 64.04, '41058119831013605X', '郭元伟', 'f3150ee848504816b854a43c92cacdbe', 1880.19);
INSERT INTO `salarykoukuan` VALUES ('6676fa07cd944d6384f6d29b834909de', 654, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 22, '140102198106042344', '刘譞', 'f3150ee848504816b854a43c92cacdbe', 1864.62);
INSERT INTO `salarykoukuan` VALUES ('66af39f27ddb4b4ab5922b5568c9228d', 708, 181.88, 0, 727.52, 0, 363.76, 0, 27.28, 0, 87.08, '142731197810186319', '高文艳', 'f3150ee848504816b854a43c92cacdbe', 2095.52);
INSERT INTO `salarykoukuan` VALUES ('66b0b7efd81649ee8b182feee273062d', 675, 171.68, 0, 686.72, 0, 343.36, 0, 25.75, 0, 74.96, '140113198010051229', '李瑞', 'f3150ee848504816b854a43c92cacdbe', 1977.47);
INSERT INTO `salarykoukuan` VALUES ('66b3f854adf94d2ba952dd6b622c9cda', 570, 139.8, 0, 559.2, 0, 279.6, 0, 20.97, 0, 67.28, '140107198808081729', '祁洁', 'f3150ee848504816b854a43c92cacdbe', 1636.85);
INSERT INTO `salarykoukuan` VALUES ('66f49465715143639acfa4251f755055', 709, 182.52, 0, 730.08, 0, 365.04, 0, 27.38, 0, 0, '14263319860111226X', '任姣丽', 'f3150ee848504816b854a43c92cacdbe', 2014.02);
INSERT INTO `salarykoukuan` VALUES ('67144b9fcc25482da1b76784ec4ac258', 793, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 0, '140411198202074816', '田冰', 'f3150ee848504816b854a43c92cacdbe', 2132.48);
INSERT INTO `salarykoukuan` VALUES ('674463798f37420b802350818ad207d0', 462, 145.58, 0, 582.32, 0, 291.16, 0, 21.84, 0, 436.42, '140622198810043319', '曹世楠', 'f3150ee848504816b854a43c92cacdbe', 1939.32);
INSERT INTO `salarykoukuan` VALUES ('678366397d8140809c7c5f792a315a3e', 729, 187.64, 0, 750.56, 0, 375.28, 0, 28.15, 0, 140.92, '142601197504221311', '霍海涛', 'f3150ee848504816b854a43c92cacdbe', 2211.55);
INSERT INTO `salarykoukuan` VALUES ('67afc32bb422452cb7c598a30451bca0', 773, 195.96, 0, 783.84, 0, 391.92, 0, 29.39, 0, 110.49, '14010519700610504X', '李小利', 'f3150ee848504816b854a43c92cacdbe', 2284.6);
INSERT INTO `salarykoukuan` VALUES ('68bdc7aa81814c0cb766004998afad1f', 622, 153.34, 0, 613.36, 0, 306.68, 0, 23, 0, 90.11, '140321197805010056', '郝振华', 'f3150ee848504816b854a43c92cacdbe', 1808.49);
INSERT INTO `salarykoukuan` VALUES ('68ff7cad7408488087cab976481da356', 689, 154.34, 0, 617.36, 0, 308.68, 0, 23.15, 0, 49.36, '140110199302112017', '杜丽勇', 'f3150ee848504816b854a43c92cacdbe', 1841.89);
INSERT INTO `salarykoukuan` VALUES ('690f0b44716d45bbb0ca2a1560ce93c5', 645, 163.66, 0, 654.64, 0, 327.32, 0, 24.55, 0, 105.83, '140104197103073717', '马福君', 'f3150ee848504816b854a43c92cacdbe', 1921);
INSERT INTO `salarykoukuan` VALUES ('69556cc02e28486595512e7ff1eeb68d', 672, 171.04, 0, 684.16, 0, 342.08, 0, 25.66, 0, 14.13, '140302198111050024', '范菲', 'f3150ee848504816b854a43c92cacdbe', 1909.07);
INSERT INTO `salarykoukuan` VALUES ('69d4fec9dc6743e1884fc0e8e806b20c', 700, 163.74, 0, 654.96, 0, 327.48, 0, 24.56, 0, 59.38, '142201197902029120', '刘会峰', 'f3150ee848504816b854a43c92cacdbe', 1930.12);
INSERT INTO `salarykoukuan` VALUES ('69f318d9d9da416e849956013cfa3c74', 598, 146.64, 0, 586.56, 0, 293.28, 0, 22, 0, 79.99, '140106198406221841', '张敏', 'f3150ee848504816b854a43c92cacdbe', 1726.47);
INSERT INTO `salarykoukuan` VALUES ('6a5a8f4d10cb4c8aafb95ce9d1e2e37c', 484, 153.1, 0, 612.4, 0, 306.2, 0, 22.97, 0, 75.28, '142422199407212421', '程升彦', 'f3150ee848504816b854a43c92cacdbe', 1653.95);
INSERT INTO `salarykoukuan` VALUES ('6a714527a66b4b5d8ffa29086699f863', 591, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 128.83, '140427199405308040', '贾楠', 'f3150ee848504816b854a43c92cacdbe', 1702.38);
INSERT INTO `salarykoukuan` VALUES ('6ac7054a20a04f15afe91db342de434e', 604, 151.7, 0, 606.8, 0, 303.4, 0, 22.76, 0, 0, '140107198212270641', '李雅', 'f3150ee848504816b854a43c92cacdbe', 1688.66);
INSERT INTO `salarykoukuan` VALUES ('6ac83b5cc722464fbc01a864a1cbdb35', 856, 210.48, 0, 841.92, 0, 420.96, 0, 31.57, 0, 632.3, '140102197109084828', '李瑞军', 'f3150ee848504816b854a43c92cacdbe', 2993.23);
INSERT INTO `salarykoukuan` VALUES ('6b054ce2416e473499338eadca026901', 608, 154.34, 0, 617.36, 0, 308.68, 0, 23.15, 0, 92.09, '140121199102220645', '孟洁', 'f3150ee848504816b854a43c92cacdbe', 1803.62);
INSERT INTO `salarykoukuan` VALUES ('6b2d13ee97af4f47952a5ece8397baa4', 714, 184.06, 0, 736.24, 0, 368.12, 0, 27.61, 0, 0, '140106198511121236', '曹翔宇', 'f3150ee848504816b854a43c92cacdbe', 2030.03);
INSERT INTO `salarykoukuan` VALUES ('6bc70d9f1f1d4a838eb20bc92c14e138', 546, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 63.58, '140202199507011522', '张跃坤', 'f3150ee848504816b854a43c92cacdbe', 1592.13);
INSERT INTO `salarykoukuan` VALUES ('6bd1e5cae55c4a9c911bd588e9aa8fea', 719, 185.7, 0, 742.8, 0, 371.4, 0, 27.86, 0, 91.53, '142725198212090015', '畅鹏', 'f3150ee848504816b854a43c92cacdbe', 2138.29);
INSERT INTO `salarykoukuan` VALUES ('6be7ccd7c40844148dbbb9ad68dc30d4', 636, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 58.95, '142431198811217541', '张静', 'f3150ee848504816b854a43c92cacdbe', 1849.1);
INSERT INTO `salarykoukuan` VALUES ('6bec64f934884825a8460f53fe977318', 540, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 59.03, '142325199610017510', '张玮', 'f3150ee848504816b854a43c92cacdbe', 1573.43);
INSERT INTO `salarykoukuan` VALUES ('6c332d5038134a83aac76a989dc55ee7', 628, 158.16, 0, 632.64, 0, 316.32, 0, 23.72, 0, 7.66, '140109198412260520', '闫堃', 'f3150ee848504816b854a43c92cacdbe', 1766.5);
INSERT INTO `salarykoukuan` VALUES ('6c90cab77bdc4591b2e8e7e92fbe8a62', 462, 138.98, 0, 555.92, 0, 277.96, 0, 20.85, 0, 67.69, '140109199401120017', '许宸嘉', 'f3150ee848504816b854a43c92cacdbe', 1523.4);
INSERT INTO `salarykoukuan` VALUES ('6ccfa81dde0d465487db04999dd4a6ce', 471, 133.58, 0, 534.32, 0, 267.16, 0, 20.04, 0, 55.58, '142328199508200019', '薛驹', 'f3150ee848504816b854a43c92cacdbe', 1481.68);
INSERT INTO `salarykoukuan` VALUES ('6d0387f4c116495682aeda1047eaad26', 542, 135.96, 0, 543.84, 0, 271.92, 0, 20.39, 0, 55.98, '120102198410314128', '朱玲', 'f3150ee848504816b854a43c92cacdbe', 1570.09);
INSERT INTO `salarykoukuan` VALUES ('6d23075773e0452689d50578db0ebfca', 849, 222.88, 0, 891.52, 0, 445.76, 0, 33.43, 0, 652.94, '142401197402096280', '胡晋梅', 'f3150ee848504816b854a43c92cacdbe', 3095.53);
INSERT INTO `salarykoukuan` VALUES ('6d26edc5b2384e42b1a0806e4094ea8a', 802, 208.3, 0, 833.2, 0, 416.6, 0, 31.25, 0, 572.76, '140102197210236021', '丁玮', 'f3150ee848504816b854a43c92cacdbe', 2864.11);
INSERT INTO `salarykoukuan` VALUES ('6d3675b017cf4f138741387f7c8f962f', 668, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 73.36, '142201198405250742', '王丽君', 'f3150ee848504816b854a43c92cacdbe', 1929.98);
INSERT INTO `salarykoukuan` VALUES ('6d6edb83fa27480eb1bcb80b5b7ee348', 901, 226.32, 0, 905.28, 0, 452.64, 0, 33.95, 0, 721.08, '140103196701191544', '王树红', 'f3150ee848504816b854a43c92cacdbe', 3240.27);
INSERT INTO `salarykoukuan` VALUES ('6da2189419574a82b400bfffdb0482d4', 768, 194.98, 0, 779.92, 0, 389.96, 0, 29.25, 0, 453.08, '140624197803201022', '刘慧琴', 'f3150ee848504816b854a43c92cacdbe', 2615.19);
INSERT INTO `salarykoukuan` VALUES ('6daf5c43ebd14db59be03923f59d6dd8', 910, 238.1, 0, 952.4, 0, 476.2, 0, 35.72, 0, 603.92, '140102196609231914', '闫永红', 'f3150ee848504816b854a43c92cacdbe', 3216.34);
INSERT INTO `salarykoukuan` VALUES ('6dd14062438f49a0864e446f5f6d8f49', 546, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 63.59, '14010819891003161X', '张烜', 'f3150ee848504816b854a43c92cacdbe', 1592.14);
INSERT INTO `salarykoukuan` VALUES ('6dfc2e82f2dd4b43ab8791784c573833', 610, 144, 0, 576, 0, 288, 0, 21.6, 0, 85.33, '142603198207101046', '李敏', 'f3150ee848504816b854a43c92cacdbe', 1724.93);
INSERT INTO `salarykoukuan` VALUES ('6e16360c570149aeada894b1125cf18e', 742, 187.64, 0, 750.56, 0, 375.28, 0, 28.15, 0, 5.5, '140121197601042514', '郭小杰', 'f3150ee848504816b854a43c92cacdbe', 2089.13);
INSERT INTO `salarykoukuan` VALUES ('6e75ac5a7f7840bab9b3363ba532073b', 721, 185.7, 0, 742.8, 0, 371.4, 0, 27.86, 0, 107.37, '140103198211104822', '葛坤', 'f3150ee848504816b854a43c92cacdbe', 2156.13);
INSERT INTO `salarykoukuan` VALUES ('6e787130b86045c68f6fc3c895535fdb', 471, 133.58, 0, 534.32, 0, 267.16, 0, 20.04, 0, 55.58, '142327199403161715', '杨健', 'f3150ee848504816b854a43c92cacdbe', 1481.68);
INSERT INTO `salarykoukuan` VALUES ('6e816dd9961e4347ac157a80001e60db', 623, 158.46, 0, 633.84, 0, 316.92, 0, 23.77, 0, 7.77, '140108198501284819', '李新龙', 'f3150ee848504816b854a43c92cacdbe', 1763.76);
INSERT INTO `salarykoukuan` VALUES ('6ef3f825723d406da2acbac25f704082', 654, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 112, '140102198205276525', '贾娟', 'f3150ee848504816b854a43c92cacdbe', 1954.62);
INSERT INTO `salarykoukuan` VALUES ('6f1b64b23f9c4bd39531d1c24eecf533', 541, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 59.87, '140602199606209042', '贾倩楠', 'f3150ee848504816b854a43c92cacdbe', 1575.27);
INSERT INTO `salarykoukuan` VALUES ('6f67caa34062410e9122a3816daa3abc', 715, 184.06, 0, 736.24, 0, 368.12, 0, 27.61, 0, 45.11, '140202198412255589', '杜萱', 'f3150ee848504816b854a43c92cacdbe', 2076.14);
INSERT INTO `salarykoukuan` VALUES ('6f7fd175ec7d47d8b0a9edec2b0b2383', 541, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 59.87, '140581199606231629', '张茹杰', 'f3150ee848504816b854a43c92cacdbe', 1575.27);
INSERT INTO `salarykoukuan` VALUES ('6f8ec638bb224efab89bdd95eb67a762', 644, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 101.24, '142603198804082023', '徐璐', 'f3150ee848504816b854a43c92cacdbe', 1888.81);
INSERT INTO `salarykoukuan` VALUES ('6fab55ac05e04bb1a7ef1c2f5b0f9a1e', 621, 154.34, 0, 617.36, 0, 308.68, 0, 23.15, 0, 91.66, '140105199207071842', '原敏', 'f3150ee848504816b854a43c92cacdbe', 1816.19);
INSERT INTO `salarykoukuan` VALUES ('6fbc41fce28943c18373b32358d3cb78', 654, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 0, '140102198212190658', '赵朗朗', 'f3150ee848504816b854a43c92cacdbe', 1819.16);
INSERT INTO `salarykoukuan` VALUES ('6fdd5878076a49dfa272fe649f386a6a', 653, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 36.16, '140103198205071534', '李潼', 'f3150ee848504816b854a43c92cacdbe', 1877.78);
INSERT INTO `salarykoukuan` VALUES ('7032c00f753d450e85a4aa1ebb780d58', 751, 194.38, 0, 777.52, 0, 388.76, 0, 29.16, 0, 499.22, '142431197712294854', '侯培文', 'f3150ee848504816b854a43c92cacdbe', 2640.04);
INSERT INTO `salarykoukuan` VALUES ('70532d12bfe34f6286a6125376ab1c1b', 800, 208.3, 0, 833.2, 0, 416.6, 0, 31.25, 0, 520.76, '140103197307200611', '张煜', 'f3150ee848504816b854a43c92cacdbe', 2810.11);
INSERT INTO `salarykoukuan` VALUES ('71219c9557cd4720bba9393ebc1c2b68', 464, 138.98, 0, 555.92, 0, 277.96, 0, 20.85, 0, 68.53, '140107199308234527', '白雪赟', 'f3150ee848504816b854a43c92cacdbe', 1526.24);
INSERT INTO `salarykoukuan` VALUES ('7127ce2cf4ed442db36818e60f684adc', 689, 171.68, 0, 686.72, 0, 343.36, 0, 25.75, 0, 219.73, '140321198009070060', '王岚', 'f3150ee848504816b854a43c92cacdbe', 2136.24);
INSERT INTO `salarykoukuan` VALUES ('7128da22201b42a2b8ed00da68a2e1df', 863, 221.56, 0, 886.24, 0, 443.12, 0, 33.23, 0, 645.57, '142601196810211926', '周月红', 'f3150ee848504816b854a43c92cacdbe', 3092.72);
INSERT INTO `salarykoukuan` VALUES ('713016bfd0214dd1aef8a07686e9d53c', 629, 155.14, 0, 620.56, 0, 310.28, 0, 23.27, 0, 92.67, '411402198607064042', '刘俊庆', 'f3150ee848504816b854a43c92cacdbe', 1830.92);
INSERT INTO `salarykoukuan` VALUES ('71779ace92a04283bc0277aec9996784', 540, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 59.03, '140402199603160430', '赵严', 'f3150ee848504816b854a43c92cacdbe', 1573.43);
INSERT INTO `salarykoukuan` VALUES ('719dd137750042a9bc934202cc4a155a', 740, 190.78, 0, 763.12, 0, 381.56, 0, 28.62, 0, 335.89, '140103197902220043', '胡盾', 'f3150ee848504816b854a43c92cacdbe', 2439.97);
INSERT INTO `salarykoukuan` VALUES ('71dcc872491a4112acb344690c66e04b', 669, 170.04, 0, 680.16, 0, 340.08, 0, 25.51, 0, 27.52, '140109198310110521', '贾云洁', 'f3150ee848504816b854a43c92cacdbe', 1912.31);
INSERT INTO `salarykoukuan` VALUES ('71e1bebb127047b1af05f2dba9b6b61f', 666, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 162.49, '140303198009021231', '邹翔斐', 'f3150ee848504816b854a43c92cacdbe', 2017.11);
INSERT INTO `salarykoukuan` VALUES ('728bbf42416246ed86898ac28cdaa8d5', 654, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 66.74, '23108419781220001X', '包全磊', 'f3150ee848504816b854a43c92cacdbe', 1885.9);
INSERT INTO `salarykoukuan` VALUES ('72b5ddd81f844e348503d1c86fc79cc9', 855, 225.06, 0, 900.24, 0, 450.12, 0, 33.76, 0, 665.28, '632801197006160533', '吴康', 'f3150ee848504816b854a43c92cacdbe', 3129.46);
INSERT INTO `salarykoukuan` VALUES ('72c0a5ee9cec4af5a2dfd5b44e248bc0', 654, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 112, '142301198002132325', '武亮英', 'f3150ee848504816b854a43c92cacdbe', 1954.62);
INSERT INTO `salarykoukuan` VALUES ('72c46c67f71848658df23cc54bc40532', 739, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 666.75, '140103198206133311', '赵荣', 'f3150ee848504816b854a43c92cacdbe', 2745.23);
INSERT INTO `salarykoukuan` VALUES ('72c5222c48834d96b5ae56dd5e918117', 591, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 87.73, '140108199305114227', '杜苗雨阳', 'f3150ee848504816b854a43c92cacdbe', 1661.28);
INSERT INTO `salarykoukuan` VALUES ('72d7a2cace704c9dacc5008617bdf53e', 900, 0, 0, 936.72, 0, 468.36, 0, 35.13, 0, 483.67, '140103197812082441', '赵婕', 'f3150ee848504816b854a43c92cacdbe', 2823.88);
INSERT INTO `salarykoukuan` VALUES ('731826a779f64e9cb2e7ea3859d7b74b', 614, 155.68, 0, 622.72, 0, 311.36, 0, 23.35, 0, 314.18, '500222199001164620', '樊艳', 'f3150ee848504816b854a43c92cacdbe', 2041.29);
INSERT INTO `salarykoukuan` VALUES ('732c18eb80d84a1da19205fecca79fd4', 669, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 22.17, '140106198505021845', '傅锦', 'f3150ee848504816b854a43c92cacdbe', 1856.33);
INSERT INTO `salarykoukuan` VALUES ('73ab4ffdfe424493a0464ed896717864', 654, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 67, '142202198010040966', '丁会', 'f3150ee848504816b854a43c92cacdbe', 1909.62);
INSERT INTO `salarykoukuan` VALUES ('73fd4565461c4d3db0f3091d89ee3d0f', 780, 194.38, 0, 777.52, 0, 388.76, 0, 29.16, 0, 111.72, '142123197811060520', '温成荣', 'f3150ee848504816b854a43c92cacdbe', 2281.54);
INSERT INTO `salarykoukuan` VALUES ('744dd2f5a18a4463b6c18941cfbb7cdb', 715, 181.04, 0, 724.16, 0, 362.08, 0, 27.16, 0, 84.32, '142228198712060017', '刘正', 'f3150ee848504816b854a43c92cacdbe', 2093.76);
INSERT INTO `salarykoukuan` VALUES ('7456a5b7e805448a97d1f1329e78f8f6', 627, 158.08, 0, 632.32, 0, 316.16, 0, 23.71, 0, 0, '149001197307272826', '谢玉华', 'f3150ee848504816b854a43c92cacdbe', 1757.27);
INSERT INTO `salarykoukuan` VALUES ('74921eb82a404ff39092c5012c76b812', 584, 146.54, 0, 586.16, 0, 293.08, 0, 21.98, 0, 0, '320324198206184481', '张晓艳', 'f3150ee848504816b854a43c92cacdbe', 1631.76);
INSERT INTO `salarykoukuan` VALUES ('74b7d888c8b24cc289652cfc3fae6945', 688, 175.28, 0, 701.12, 0, 350.56, 0, 26.29, 0, 49.05, '140102197807204049', '雷丽', 'f3150ee848504816b854a43c92cacdbe', 1990.3);
INSERT INTO `salarykoukuan` VALUES ('74d1e59391734dc18bb73867832618e2', 871, 229.48, 0, 917.92, 0, 458.96, 0, 34.42, 0, 535.52, '140102196601091216', '袁忍强', 'f3150ee848504816b854a43c92cacdbe', 3047.3);
INSERT INTO `salarykoukuan` VALUES ('74d6b6cdc4f14be8834a3f59c2381f0a', 755, 195.56, 0, 782.24, 0, 391.12, 0, 29.33, 0, 359.67, '140103197111071213', '段炳胜', 'f3150ee848504816b854a43c92cacdbe', 2512.92);
INSERT INTO `salarykoukuan` VALUES ('74ed8b02e66049f8be3dba922458ab91', 724, 181.88, 0, 727.52, 0, 363.76, 0, 27.28, 0, 27.53, '142225197601200028', '王改凤', 'f3150ee848504816b854a43c92cacdbe', 2051.97);
INSERT INTO `salarykoukuan` VALUES ('75095b395d7044be848da90c37b8b2a4', 603, 153.1, 0, 612.4, 0, 306.2, 0, 22.97, 0, 88.96, '140621199103086123', '王永丽', 'f3150ee848504816b854a43c92cacdbe', 1786.63);
INSERT INTO `salarykoukuan` VALUES ('7616edcaecb94403a98ba9f2cd65afff', 541, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 59.87, '142202199512144567', '付国霞', 'f3150ee848504816b854a43c92cacdbe', 1575.27);
INSERT INTO `salarykoukuan` VALUES ('7685e1b46dfc47879b74606a5ad20137', 724, 170.04, 0, 680.16, 0, 340.08, 0, 25.51, 0, 69.73, '142424198107223522', '李雪梅', 'f3150ee848504816b854a43c92cacdbe', 2009.52);
INSERT INTO `salarykoukuan` VALUES ('76c28e84a4ee44b0b8e987ba4b5d283b', 251, 82.26, 0, 329.04, 0, 164.52, 0, 12.34, 0, 0, '140102197201202313', '邸冬生', 'f3150ee848504816b854a43c92cacdbe', 839.16);
INSERT INTO `salarykoukuan` VALUES ('76c9efdafbcc4336af6badc17a5fd849', 623, 158.46, 0, 633.84, 0, 316.92, 0, 23.77, 0, 0, '140181198408240210', '鲁维维', 'f3150ee848504816b854a43c92cacdbe', 1755.99);
INSERT INTO `salarykoukuan` VALUES ('7735939902534d6794511214c47cb42d', 793, 207.38, 0, 829.52, 0, 414.76, 0, 31.11, 0, 572.62, '140102197806096533', '赵俊峰', 'f3150ee848504816b854a43c92cacdbe', 2848.39);
INSERT INTO `salarykoukuan` VALUES ('774801fde7f14eb8983e2902a343f6ef', 546, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 63.58, '370882199302234228', '白雅雯', 'f3150ee848504816b854a43c92cacdbe', 1592.13);
INSERT INTO `salarykoukuan` VALUES ('7749f63ea2d34c39bb99a73678fc9622', 546, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 63.59, '140106199506081828', '郝晴', 'f3150ee848504816b854a43c92cacdbe', 1592.14);
INSERT INTO `salarykoukuan` VALUES ('776e1b6e39114f5aa5fdec23aa70a10f', 652, 166.12, 0, 664.48, 0, 332.24, 0, 24.92, 0, 107.01, '140104197210292712', '朱道宏', 'f3150ee848504816b854a43c92cacdbe', 1946.77);
INSERT INTO `salarykoukuan` VALUES ('7787421a5d0d4db8af7f9067d744f6fc', 625, 158.46, 0, 633.84, 0, 316.92, 0, 23.77, 0, 77.61, '142729198905110643', '温月', 'f3150ee848504816b854a43c92cacdbe', 1835.6);
INSERT INTO `salarykoukuan` VALUES ('77ca386e36624c34a5f5656009a9e8b1', 733, 185.7, 0, 742.8, 0, 371.4, 0, 27.86, 0, 103.28, '140621198001133115', '杨宝军', 'f3150ee848504816b854a43c92cacdbe', 2164.04);
INSERT INTO `salarykoukuan` VALUES ('77cd0c897cd74babb59b5b25179f2e2e', 727, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 50.89, '140303198201200424', '马丽', 'f3150ee848504816b854a43c92cacdbe', 2117.37);
INSERT INTO `salarykoukuan` VALUES ('77d899b1620147fa9ed5a4a10bdc632f', 822, 210.48, 0, 841.92, 0, 420.96, 0, 31.57, 0, 578.22, '140103197108190035', '黄国卫', 'f3150ee848504816b854a43c92cacdbe', 2905.15);
INSERT INTO `salarykoukuan` VALUES ('7868c7cad2124f108529ce8ee4d7be60', 640, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 351.28, '140112198206030415', '刘旭中', 'f3150ee848504816b854a43c92cacdbe', 2156.44);
INSERT INTO `salarykoukuan` VALUES ('78ca3cb96c314bbcb42acbbcebb207c3', 730, 171.68, 0, 686.72, 0, 343.36, 0, 25.75, 0, 72.17, '142301198109134128', '朱建华', 'f3150ee848504816b854a43c92cacdbe', 2029.68);
INSERT INTO `salarykoukuan` VALUES ('78fb9ede265a4ee2aeb47ed569cbd089', 769, 199.52, 0, 798.08, 0, 399.04, 0, 29.93, 0, 531.64, '140102197602031412', '海滨', 'f3150ee848504816b854a43c92cacdbe', 2727.21);
INSERT INTO `salarykoukuan` VALUES ('79243503aa414131b5779b847f7a8e03', 594, 149.66, 0, 598.64, 0, 299.32, 0, 22.45, 0, 42.48, '140102198211230013', '郭涛', 'f3150ee848504816b854a43c92cacdbe', 1706.55);
INSERT INTO `salarykoukuan` VALUES ('79380a589d124a3e8b9652689a319a39', 640, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 0.38, '432503198305215016', '王玉华', 'f3150ee848504816b854a43c92cacdbe', 1805.54);
INSERT INTO `salarykoukuan` VALUES ('794986d4460346c592f8680f2b1d4644', 603, 153.1, 0, 612.4, 0, 306.2, 0, 22.97, 0, 43.96, '140429199411275620', '韩静', 'f3150ee848504816b854a43c92cacdbe', 1741.63);
INSERT INTO `salarykoukuan` VALUES ('79645fefb1ae4759b2960eb44bb3814a', 629, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 10.82, '140106198306260018', '王子健', 'f3150ee848504816b854a43c92cacdbe', 1783.39);
INSERT INTO `salarykoukuan` VALUES ('7995121e9cdc4979800fe5af3ea3ddb3', 663, 168.12, 0, 672.48, 0, 336.24, 0, 25.22, 0, 114.06, '140104197108071761', '赵利荣', 'f3150ee848504816b854a43c92cacdbe', 1979.12);
INSERT INTO `salarykoukuan` VALUES ('79a92bfbc9b74181a7a82be18a4e8b41', 535, 135.24, 0, 540.96, 0, 270.48, 0, 20.29, 0, 57.24, '140107199511240017', '郑孟曜', 'f3150ee848504816b854a43c92cacdbe', 1559.21);
INSERT INTO `salarykoukuan` VALUES ('79b170b34ed3469b87f05f68d9ff222c', 510, 151.86, 0, 607.44, 0, 303.72, 0, 22.78, 0, 86.17, '140107199208050616', '杨非凡', 'f3150ee848504816b854a43c92cacdbe', 1681.97);
INSERT INTO `salarykoukuan` VALUES ('79f06d73cc594e038f5a0a25fcf0ef1f', 647, 164.68, 0, 658.72, 0, 329.36, 0, 24.7, 0, 59.97, '140102197503276510', '张义强', 'f3150ee848504816b854a43c92cacdbe', 1884.43);
INSERT INTO `salarykoukuan` VALUES ('7a3f39895f4348399815d024a70c8db9', 550, 135.24, 0, 540.96, 0, 270.48, 0, 20.29, 0, 57.7, '140402199611160422', '王卓然', 'f3150ee848504816b854a43c92cacdbe', 1574.67);
INSERT INTO `salarykoukuan` VALUES ('7a753dd712bd4c3a837aa38fba26cc9d', 633, 157.02, 0, 628.08, 0, 314.04, 0, 23.55, 0, 96.04, '14010719901228332X', '冀莎', 'f3150ee848504816b854a43c92cacdbe', 1851.73);
INSERT INTO `salarykoukuan` VALUES ('7ab812c7005a40dfa143885012c5eaaf', 485, 155.88, 0, 623.52, 0, 311.76, 0, 23.38, 0, 0, '140102197107212021', '杨晓慧', 'f3150ee848504816b854a43c92cacdbe', 1599.54);
INSERT INTO `salarykoukuan` VALUES ('7ac7297b06e24378b15e4ce2396d0d3e', 1086, 0, 0, 1130.08, 0, 565.04, 0, 42.38, 0, 923.95, '120225197210292070', '桂志国', 'f3150ee848504816b854a43c92cacdbe', 3747.45);
INSERT INTO `salarykoukuan` VALUES ('7b109e82dee442cc918e5755d6d5b9c7', 535, 135.24, 0, 540.96, 0, 270.48, 0, 20.29, 0, 57.25, '140109199803091511', '宁瑞', 'f3150ee848504816b854a43c92cacdbe', 1559.22);
INSERT INTO `salarykoukuan` VALUES ('7b8d123fcd1a43d490b03ff430b303a8', 571, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 103.1, '140525198505186325', '王妮妮', 'f3150ee848504816b854a43c92cacdbe', 1828.25);
INSERT INTO `salarykoukuan` VALUES ('7b9e2ed2156a43d4b35c0ccf7643f858', 631, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 101.66, '142401198409081422', '孟洪玉', 'f3150ee848504816b854a43c92cacdbe', 1876.23);
INSERT INTO `salarykoukuan` VALUES ('7bd04f5bb5cb42079d4077bdf2d37386', 635, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 1046.52, '142423198501270611', '张元元', 'f3150ee848504816b854a43c92cacdbe', 2841.67);
INSERT INTO `salarykoukuan` VALUES ('7be1398b7f644025a0b6bd7836939a64', 788, 204.34, 0, 817.36, 0, 408.68, 0, 30.65, 0, 430.89, '142401197604055524', '赵俊萍', 'f3150ee848504816b854a43c92cacdbe', 2679.92);
INSERT INTO `salarykoukuan` VALUES ('7c552498cd024c6f9ee127caa15c5ec2', 667, 169.68, 0, 678.72, 0, 339.36, 0, 25.45, 0, 26.87, '140102197511150643', '李晓妹', 'f3150ee848504816b854a43c92cacdbe', 1907.08);
INSERT INTO `salarykoukuan` VALUES ('7c82e35b080c4420b47eae2abf67be5b', 707, 182.52, 0, 730.08, 0, 365.04, 0, 27.38, 0, 282.56, '140108198410010812', '胡建功', 'f3150ee848504816b854a43c92cacdbe', 2294.58);
INSERT INTO `salarykoukuan` VALUES ('7c83a742c3bf461a845a6546a5f9b738', 555, 155.68, 0, 622.72, 0, 311.36, 0, 23.35, 0, 18.36, '140623198905150025', '祁极冰', 'f3150ee848504816b854a43c92cacdbe', 1686.47);
INSERT INTO `salarykoukuan` VALUES ('7c89d81712874d46af8c759b457eeff9', 654, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 112, '14012219821207082X', '赵海霞', 'f3150ee848504816b854a43c92cacdbe', 1954.62);
INSERT INTO `salarykoukuan` VALUES ('7c9334c7bbef4176803e66be32992e54', 546, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 0, '142431199207074841', '阴怀芬', 'f3150ee848504816b854a43c92cacdbe', 1528.55);
INSERT INTO `salarykoukuan` VALUES ('7cc99816615645f991a5e379d6569755', 725, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 133.45, '130402198103181538', '王卫涛', 'f3150ee848504816b854a43c92cacdbe', 2197.93);
INSERT INTO `salarykoukuan` VALUES ('7d5ba8cfaae24b44a7cd3c308a6d521a', 649, 164.76, 0, 659.04, 0, 329.52, 0, 24.71, 0, 119.28, '140107198506113641', '王静', 'f3150ee848504816b854a43c92cacdbe', 1946.31);
INSERT INTO `salarykoukuan` VALUES ('7db4b6d9de554988a3333573dea099c8', 707, 173.28, 0, 693.12, 0, 346.56, 0, 25.99, 0, 82.65, '140113198007122321', '王晓霞', 'f3150ee848504816b854a43c92cacdbe', 2028.6);
INSERT INTO `salarykoukuan` VALUES ('7de134a7c7db47229826a509d1e39705', 616, 155.14, 0, 620.56, 0, 310.28, 0, 23.27, 0, 0, '142723198409043025', '任芬', 'f3150ee848504816b854a43c92cacdbe', 1725.25);
INSERT INTO `salarykoukuan` VALUES ('7deda27dbed248dcb4c7a639e77f74ab', 557, 139.8, 0, 559.2, 0, 279.6, 0, 20.97, 0, 67.7, '140603198909175726', '张志平', 'f3150ee848504816b854a43c92cacdbe', 1624.27);
INSERT INTO `salarykoukuan` VALUES ('7eaf55090d004dde8c59e5247909b0c8', 640, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 105.38, '140302198106161352', '陈亮', 'f3150ee848504816b854a43c92cacdbe', 1910.54);
INSERT INTO `salarykoukuan` VALUES ('7f0b70fa82984ade8585951699e5c1dc', 669, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 0, '142402198409224522', '赵军芳', 'f3150ee848504816b854a43c92cacdbe', 1834.16);
INSERT INTO `salarykoukuan` VALUES ('7f61a9783d824e948e61272553dfd35c', 642, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 61.22, '13012319851212154X', '张硕', 'f3150ee848504816b854a43c92cacdbe', 1868.38);
INSERT INTO `salarykoukuan` VALUES ('80340eecb6fd4694a64134d66b387d0c', 767, 198.58, 0, 794.32, 0, 397.16, 0, 29.79, 0, 520.61, '142202197609020764', '武子英', 'f3150ee848504816b854a43c92cacdbe', 2707.46);
INSERT INTO `salarykoukuan` VALUES ('804889b750214ff7ad59012a803c77ec', 754, 190.78, 0, 763.12, 0, 381.56, 0, 28.62, 0, 55.38, '140112198110101303', '梁丽娜', 'f3150ee848504816b854a43c92cacdbe', 2173.46);
INSERT INTO `salarykoukuan` VALUES ('805ee64921cf46939b776e8c55a3f633', 752, 190.78, 0, 763.12, 0, 381.56, 0, 28.62, 0, 482.99, '142223197809182735', '徐彦峰', 'f3150ee848504816b854a43c92cacdbe', 2599.07);
INSERT INTO `salarykoukuan` VALUES ('807f1ae10e534aedabcffd30fa342d9d', 773, 200.14, 0, 800.56, 0, 400.28, 0, 30.02, 0, 531.5, '140104197404051327', '王凯', 'f3150ee848504816b854a43c92cacdbe', 2735.5);
INSERT INTO `salarykoukuan` VALUES ('808cd365e64545bc8655c966314cc44a', 541, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 59.86, '140429199301034826', '赵红飞', 'f3150ee848504816b854a43c92cacdbe', 1575.26);
INSERT INTO `salarykoukuan` VALUES ('80c55b5d30a84a06bbba551b2356a994', 635, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 103.1, '140108198609192510', '代欣', 'f3150ee848504816b854a43c92cacdbe', 1892.25);
INSERT INTO `salarykoukuan` VALUES ('8106a1ded7874706a8d1572a41249d21', 473, 133.58, 0, 534.32, 0, 267.16, 0, 20.04, 0, 56.43, '140702199701317100', '霍冰融', 'f3150ee848504816b854a43c92cacdbe', 1484.53);
INSERT INTO `salarykoukuan` VALUES ('81a8ae79ef084039ac277a7858515a82', 631, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 101.66, '142401198108204222', '边建红', 'f3150ee848504816b854a43c92cacdbe', 1876.23);
INSERT INTO `salarykoukuan` VALUES ('81b4ee3c20d742aaa11e137ac7d1e637', 675, 171.68, 0, 686.72, 0, 343.36, 0, 25.75, 0, 29.96, '140102198106106520', '霍芳', 'f3150ee848504816b854a43c92cacdbe', 1932.47);
INSERT INTO `salarykoukuan` VALUES ('820f25f833ae45f099b129737cba7f0d', 604, 148.12, 0, 592.48, 0, 296.24, 0, 22.22, 0, 82.29, '140106198504062522', '沙荣', 'f3150ee848504816b854a43c92cacdbe', 1745.35);
INSERT INTO `salarykoukuan` VALUES ('827c263ec967452e8b083b4e29464ae1', 654, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 0, '142302198107230542', '杨艳', 'f3150ee848504816b854a43c92cacdbe', 1842.62);
INSERT INTO `salarykoukuan` VALUES ('82a3fc9f2519451ba586d6765304cae0', 642, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 106.22, '140102198211270621', '王烨', 'f3150ee848504816b854a43c92cacdbe', 1913.38);
INSERT INTO `salarykoukuan` VALUES ('82b3835b95024c26926bdad40dd15bfb', 661, 167.88, 0, 671.52, 0, 335.76, 0, 25.18, 0, 24.47, '140103198012130622', '刘昕', 'f3150ee848504816b854a43c92cacdbe', 1885.81);
INSERT INTO `salarykoukuan` VALUES ('82cb25346151410894c24aa2224abc33', 596, 138.56, 0, 554.24, 0, 277.12, 0, 20.78, 0, 89.8, '142303199301284529', '郝秀萍', 'f3150ee848504816b854a43c92cacdbe', 1676.5);
INSERT INTO `salarykoukuan` VALUES ('8313933e916a448095b30a0fe5fec35f', 669, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 22.17, '152104198304170626', '董宏', 'f3150ee848504816b854a43c92cacdbe', 1856.33);
INSERT INTO `salarykoukuan` VALUES ('831b6850ff3f4d8c8b9f9c46404047fb', 573, 143.72, 0, 574.88, 0, 287.44, 0, 21.56, 0, 0, '14112119890731002X', '师帅', 'f3150ee848504816b854a43c92cacdbe', 1600.6);
INSERT INTO `salarykoukuan` VALUES ('8326a7cf57b743369c45014760ca2e75', 918, 235.98, 0, 943.92, 0, 471.96, 0, 35.4, 0, 414.17, '140102197810240016', '傅晔', 'f3150ee848504816b854a43c92cacdbe', 3019.43);
INSERT INTO `salarykoukuan` VALUES ('8338d3150b96468c9fced48b7dbd2a5e', 627, 155.14, 0, 620.56, 0, 310.28, 0, 23.27, 0, 0, '140107198712062216', '王宁', 'f3150ee848504816b854a43c92cacdbe', 1736.25);
INSERT INTO `salarykoukuan` VALUES ('83afdabf398d49218ccdc4885ac4f8cb', 636, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 58.94, '142332198803090027', '陈雅茜', 'f3150ee848504816b854a43c92cacdbe', 1849.09);
INSERT INTO `salarykoukuan` VALUES ('83e053ec28024585ab22c0d445dd5263', 740, 190.78, 0, 763.12, 0, 381.56, 0, 28.62, 0, 25.76, '652322198010020528', '王蓉', 'f3150ee848504816b854a43c92cacdbe', 2129.84);
INSERT INTO `salarykoukuan` VALUES ('84561f1f05804434a9d193edc9a8fd40', 825, 214.84, 0, 859.36, 0, 429.68, 0, 32.23, 0, 457.66, '140103197005150663', '王宝红', 'f3150ee848504816b854a43c92cacdbe', 2818.77);
INSERT INTO `salarykoukuan` VALUES ('8484baeb21334ed9982cc864fed761c2', 802, 208.3, 0, 833.2, 0, 416.6, 0, 31.25, 0, 572.76, '142322197303280521', '刘娟', 'f3150ee848504816b854a43c92cacdbe', 2864.11);
INSERT INTO `salarykoukuan` VALUES ('84ba85f92d86434487974340b81fb64c', 489, 162.56, 0, 650.24, 0, 325.12, 0, 24.38, 0, 496.77, '14010719911012172X', '杨洋', 'f3150ee848504816b854a43c92cacdbe', 2148.07);
INSERT INTO `salarykoukuan` VALUES ('84e084369dcc4876a0be53e91caa81fa', 486, 138.98, 0, 555.92, 0, 277.96, 0, 20.85, 0, 407.17, '140203199507201234', '董小乐', 'f3150ee848504816b854a43c92cacdbe', 1886.88);
INSERT INTO `salarykoukuan` VALUES ('85116172ca194efea577521a6a92a9b1', 537, 135.24, 0, 540.96, 0, 270.48, 0, 20.29, 0, 58.12, '140109199905255521', '刘聪', 'f3150ee848504816b854a43c92cacdbe', 1562.09);
INSERT INTO `salarykoukuan` VALUES ('858cbc331f384cb5911395daf76108f4', 669, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 67.16, '410823198104276222', '田丽', 'f3150ee848504816b854a43c92cacdbe', 1901.32);
INSERT INTO `salarykoukuan` VALUES ('8598115fff0d4a4c8d3d481ca147e9e5', 1089, 300.96, 0, 1203.84, 0, 601.92, 0, 45.14, 0, 824.71, '142601196805241936', '郝勇东', 'f3150ee848504816b854a43c92cacdbe', 4065.57);
INSERT INTO `salarykoukuan` VALUES ('859c0bd85d0247cabffd72ed5d1bfa47', 540, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 0, '140427199502048033', '王茜渊', 'f3150ee848504816b854a43c92cacdbe', 1514.4);
INSERT INTO `salarykoukuan` VALUES ('863f34d7c3944215a1f791f8ed5c0f5f', 680, 173.48, 0, 693.92, 0, 346.96, 0, 26.02, 0, 121.55, '140225197901234914', '白文江', 'f3150ee848504816b854a43c92cacdbe', 2041.93);
INSERT INTO `salarykoukuan` VALUES ('8681794c9d7a4e759f874f7974add793', 537, 135.24, 0, 540.96, 0, 270.48, 0, 20.29, 0, 58.12, '142401199511171445', '张雯', 'f3150ee848504816b854a43c92cacdbe', 1562.09);
INSERT INTO `salarykoukuan` VALUES ('86ee0f83b9e74fdd8b7f000cba538337', 679, 169.68, 0, 678.72, 0, 339.36, 0, 25.45, 0, 229.37, '140424197708300013', '黄海波', 'f3150ee848504816b854a43c92cacdbe', 2121.58);
INSERT INTO `salarykoukuan` VALUES ('876f05a6dc214bbdbf6830994325d68d', 590, 148.02, 0, 592.08, 0, 296.04, 0, 22.2, 0, 0, '140107198402281720', '于宏飞', 'f3150ee848504816b854a43c92cacdbe', 1648.34);
INSERT INTO `salarykoukuan` VALUES ('879817426a6b40ab99ed7ed56bedd4e2', 749, 173.28, 0, 693.12, 0, 346.56, 0, 25.99, 0, 367.61, '140102197408103224', '杨晋华', 'f3150ee848504816b854a43c92cacdbe', 2355.56);
INSERT INTO `salarykoukuan` VALUES ('87ba586c7a504a21a727185176fbc78c', 555, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 59.47, '142431199512280668', '郭晓婷', 'f3150ee848504816b854a43c92cacdbe', 1588.87);
INSERT INTO `salarykoukuan` VALUES ('87de0993a1494482b6c96c889b8d2871', 0, 206.28, 0, 825.12, 0, 412.56, 0, 30.94, 0, 0, '140112197104011737', '韩伟', 'f3150ee848504816b854a43c92cacdbe', 1474.9);
INSERT INTO `salarykoukuan` VALUES ('892591d671c149a5ab644f9b3d7c0378', 641, 146.64, 0, 586.56, 0, 293.28, 0, 22, 0, 0, '14060219860705851X', '徐少卿', 'f3150ee848504816b854a43c92cacdbe', 1689.48);
INSERT INTO `salarykoukuan` VALUES ('892a78db70124c7c8f6af0b1ece4387e', 746, 192.58, 0, 770.32, 0, 385.16, 0, 28.89, 0, 494, '140105197605125042', '王丽平', 'f3150ee848504816b854a43c92cacdbe', 2616.95);
INSERT INTO `salarykoukuan` VALUES ('8960dcbb568045d99c7c47a4c792828b', 721, 185.7, 0, 742.8, 0, 371.4, 0, 27.86, 0, 71.37, '370983198509231822', '李慧', 'f3150ee848504816b854a43c92cacdbe', 2120.13);
INSERT INTO `salarykoukuan` VALUES ('899d945b4d5249229c8ce9c6bdcd3569', 765, 194.38, 0, 777.52, 0, 388.76, 0, 29.16, 0, 349.12, '142322197707211012', '张鹏飞', 'f3150ee848504816b854a43c92cacdbe', 2503.94);
INSERT INTO `salarykoukuan` VALUES ('89a84cdd845548259676734f937e1cf4', 598, 151.86, 0, 607.44, 0, 303.72, 0, 22.78, 0, 86.92, '140603199101111046', '李婧', 'f3150ee848504816b854a43c92cacdbe', 1770.72);
INSERT INTO `salarykoukuan` VALUES ('89afff2314fb47a5a300c39000d7d77f', 715, 184.06, 0, 736.24, 0, 368.12, 0, 27.61, 0, 350.39, '140411197809113629', '苏银', 'f3150ee848504816b854a43c92cacdbe', 2381.42);
INSERT INTO `salarykoukuan` VALUES ('89bb5b3da3104abf8ddee1b6d66c4631', 680, 173.28, 0, 693.12, 0, 346.56, 0, 25.99, 0, 76.71, '142601198107272822', '陈艳花', 'f3150ee848504816b854a43c92cacdbe', 1995.66);
INSERT INTO `salarykoukuan` VALUES ('89c5c777af864e37b39346dfad608329', 675, 172.08, 0, 688.32, 0, 344.16, 0, 25.81, 0, 72.62, '140109196707270014', '王文斌', 'f3150ee848504816b854a43c92cacdbe', 1977.99);
INSERT INTO `salarykoukuan` VALUES ('89c7a245ecdd42efbd73a0b50772ece2', 810, 210.48, 0, 841.92, 0, 420.96, 0, 31.57, 0, 317.93, '140103197201100620', '孙芳芳', 'f3150ee848504816b854a43c92cacdbe', 2632.86);
INSERT INTO `salarykoukuan` VALUES ('8a3c8f537cba47138151813b8b4ce31f', 816, 208.46, 0, 833.84, 0, 416.92, 0, 31.27, 0, 600.25, '140102196901182128', '潘韧', 'f3150ee848504816b854a43c92cacdbe', 2906.74);
INSERT INTO `salarykoukuan` VALUES ('8a72c453f9e24adcb0e86904f420f4bb', 621, 154.34, 0, 617.36, 0, 308.68, 0, 23.15, 0, 91.66, '140109199006251527', '张驰', 'f3150ee848504816b854a43c92cacdbe', 1816.19);
INSERT INTO `salarykoukuan` VALUES ('8a75b229b18d4c31918f773195603ba0', 740, 190.78, 0, 763.12, 0, 381.56, 0, 28.62, 0, 100.77, '142628197910220023', '李晓茹', 'f3150ee848504816b854a43c92cacdbe', 2204.85);
INSERT INTO `salarykoukuan` VALUES ('8a8b8cbc4bb545d6b666f34370417bad', 590, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 86.9, '142601199408118516', '李锋锋', 'f3150ee848504816b854a43c92cacdbe', 1659.45);
INSERT INTO `salarykoukuan` VALUES ('8a9df714ddbe4b77b994a77d9488bc58', 709, 182.52, 0, 730.08, 0, 365.04, 0, 27.38, 0, 382.38, '140624198605020524', '谷晓霞', 'f3150ee848504816b854a43c92cacdbe', 2396.4);
INSERT INTO `salarykoukuan` VALUES ('8abd22dba3fe44fa983958525af9d7e1', 733, 188.98, 0, 755.92, 0, 377.96, 0, 28.35, 0, 240.48, '140102198007081428', '赵霞', 'f3150ee848504816b854a43c92cacdbe', 2324.69);
INSERT INTO `salarykoukuan` VALUES ('8ae32beecece4ea1907794ca17e77b1a', 774, 200.38, 0, 801.52, 0, 400.76, 0, 30.06, 0, 69.85, '140102197704222340', '郝丽珍', 'f3150ee848504816b854a43c92cacdbe', 2276.57);
INSERT INTO `salarykoukuan` VALUES ('8b0ae999b6ac47e5b92772f11b78d2db', 682, 170.04, 0, 680.16, 0, 340.08, 0, 25.51, 0, 247.95, '140102197901235167', '弓艳', 'f3150ee848504816b854a43c92cacdbe', 2145.74);
INSERT INTO `salarykoukuan` VALUES ('8b32225c73e140448a4c205d5a5bb105', 0, 156.38, 0, 625.52, 0, 312.76, 0, 23.46, 0, 0, '140102198103226527', '毕涛', 'f3150ee848504816b854a43c92cacdbe', 1118.12);
INSERT INTO `salarykoukuan` VALUES ('8b39fa250cc54a56a241719707790eb0', 668, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 0, '140502198410142288', '张丽娜', 'f3150ee848504816b854a43c92cacdbe', 1856.62);
INSERT INTO `salarykoukuan` VALUES ('8b3c08a089d241ea97954d100676444d', 616, 155.14, 0, 620.56, 0, 310.28, 0, 23.27, 0, 3.09, '142231198309240825', '章培英', 'f3150ee848504816b854a43c92cacdbe', 1728.34);
INSERT INTO `salarykoukuan` VALUES ('8bd11467cc764aba8c706ea4e7685fd0', 682, 170.04, 0, 680.16, 0, 340.08, 0, 25.51, 0, 0, '140103198202184840', '要丽娟', 'f3150ee848504816b854a43c92cacdbe', 1897.79);
INSERT INTO `salarykoukuan` VALUES ('8be48cf364074809b309af7f85710e46', 893, 232.38, 0, 929.52, 0, 464.76, 0, 34.86, 0, 200.15, '130102198109272426', '孙月红', 'f3150ee848504816b854a43c92cacdbe', 2754.67);
INSERT INTO `salarykoukuan` VALUES ('8bfeea0693014cb8a517e9869f023531', 686, 157.02, 0, 628.08, 0, 314.04, 0, 23.55, 0, 129.13, '142623198902045213', '张毅', 'f3150ee848504816b854a43c92cacdbe', 1937.82);
INSERT INTO `salarykoukuan` VALUES ('8c05018f64b0490784cb66537c3222e1', 777, 201.5, 0, 806, 0, 403, 0, 30.23, 0, 541.31, '140104197209211735', '贾尚武', 'f3150ee848504816b854a43c92cacdbe', 2759.04);
INSERT INTO `salarykoukuan` VALUES ('8c1625ad52f44c3bba690e2278040f79', 715, 184.06, 0, 736.24, 0, 368.12, 0, 27.61, 0, 45.11, '140105198312291885', '王雅馨', 'f3150ee848504816b854a43c92cacdbe', 2076.14);
INSERT INTO `salarykoukuan` VALUES ('8c8e405f5b8c44589b085b2f2cba2cc8', 662, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 69.81, '142232198201260468', '钟丽霞', 'f3150ee848504816b854a43c92cacdbe', 1908.7);
INSERT INTO `salarykoukuan` VALUES ('8c8f0bf5d4af4f34846171d7219d745d', 954, 250.06, 0, 1000.24, 0, 500.12, 0, 37.51, 0, 692, '140102197104015110', '高伟', 'f3150ee848504816b854a43c92cacdbe', 3433.93);
INSERT INTO `salarykoukuan` VALUES ('8cace83e10cb47879887b7ac1c7b1abe', 736, 186.38, 0, 745.52, 0, 372.76, 0, 27.96, 0, 33.97, '142429197907130014', '王利国', 'f3150ee848504816b854a43c92cacdbe', 2102.59);
INSERT INTO `salarykoukuan` VALUES ('8cb3b50a01ad4012b18df9783b06fa36', 768, 194.98, 0, 779.92, 0, 389.96, 0, 29.25, 0, 333.74, '14222719781004102X', '刘小英', 'f3150ee848504816b854a43c92cacdbe', 2495.85);
INSERT INTO `salarykoukuan` VALUES ('8d12d8bc0f5c4ef38594c94e15fc9c2f', 938, 241.74, 0, 966.96, 0, 483.48, 0, 36.26, 0, 343.66, '140103197506235710', '刘彬', 'f3150ee848504816b854a43c92cacdbe', 3010.1);
INSERT INTO `salarykoukuan` VALUES ('8d1d010ce75343dd8af0801452d6593b', 746, 188.98, 0, 755.92, 0, 377.96, 0, 28.35, 0, 0, '140103198008293373', '李渊', 'f3150ee848504816b854a43c92cacdbe', 2097.21);
INSERT INTO `salarykoukuan` VALUES ('8d26193ba3904f46922977f3102f072b', 636, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 103.95, '140108198411144222', '于晓君', 'f3150ee848504816b854a43c92cacdbe', 1894.1);
INSERT INTO `salarykoukuan` VALUES ('8d84e23c8c584fb4bb50ce575b876930', 455, 125.18, 0, 500.72, 0, 250.36, 0, 18.78, 0, 48.6, '652926200004151714', '阿布都外力·阿布里克木', 'f3150ee848504816b854a43c92cacdbe', 1398.64);
INSERT INTO `salarykoukuan` VALUES ('8dadcf4a01704c0f915ff61114509e77', 853, 219.32, 0, 877.28, 0, 438.64, 0, 32.9, 0, 623.85, '140103196507110616', '王晔', 'f3150ee848504816b854a43c92cacdbe', 3044.99);
INSERT INTO `salarykoukuan` VALUES ('8dd49a8924ed4902899d8ecd51f9a78a', 546, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 63.58, '140121199503078029', '张赵芝', 'f3150ee848504816b854a43c92cacdbe', 1592.13);
INSERT INTO `salarykoukuan` VALUES ('8de0ed7b69f64499b540e7f531418d3a', 636, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 103.94, '142329198510202322', '牛亚群', 'f3150ee848504816b854a43c92cacdbe', 1894.09);
INSERT INTO `salarykoukuan` VALUES ('8e02645b55e74da0b9b6577b1305ebf4', 858, 223.94, 0, 895.76, 0, 447.88, 0, 33.59, 0, 658.4, '120103196603067028', '孙晋兰', 'f3150ee848504816b854a43c92cacdbe', 3117.57);
INSERT INTO `salarykoukuan` VALUES ('8e4e4bc1597d4531aae6e4e12f01d4b9', 760, 195.96, 0, 783.84, 0, 391.92, 0, 29.39, 0, 80.9, '140112197203050029', '董丽丽', 'f3150ee848504816b854a43c92cacdbe', 2242.01);
INSERT INTO `salarykoukuan` VALUES ('8e54078f576249ba9e11776d95a85fb7', 695, 177.08, 0, 708.32, 0, 354.16, 0, 26.56, 0, 37.23, '142424197609202321', '李海珍', 'f3150ee848504816b854a43c92cacdbe', 1998.35);
INSERT INTO `salarykoukuan` VALUES ('8e60276b2ef8407fa3027c469eff9370', 544, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 62.74, '142301199306100036', '张城瑞', 'f3150ee848504816b854a43c92cacdbe', 1589.29);
INSERT INTO `salarykoukuan` VALUES ('8eb38e5372414ada942c6bae2998e190', 550, 135.24, 0, 540.96, 0, 270.48, 0, 20.29, 0, 57.7, '141122199604080061', '闫芷毓', 'f3150ee848504816b854a43c92cacdbe', 1574.67);
INSERT INTO `salarykoukuan` VALUES ('8ec1a82b53cb47cda4197081a5682b2a', 631, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 0, '142303198704170062', '殷志鹃', 'f3150ee848504816b854a43c92cacdbe', 1774.57);
INSERT INTO `salarykoukuan` VALUES ('8ee2d5e81ecb41f6802d69dc6aef5585', 724, 170.04, 0, 680.16, 0, 340.08, 0, 25.51, 0, 332.42, '140311198011260944', '余瑞霞', 'f3150ee848504816b854a43c92cacdbe', 2272.21);
INSERT INTO `salarykoukuan` VALUES ('8efff5e018884570ab92560d7a5625b1', 771, 199.52, 0, 798.08, 0, 399.04, 0, 29.93, 0, 534.44, '140102197601024026', '谢鹏', 'f3150ee848504816b854a43c92cacdbe', 2732.01);
INSERT INTO `salarykoukuan` VALUES ('8f230900d98c41e79e3f8cfa6b8b344c', 919, 0, 0, 959.04, 0, 479.52, 0, 35.96, 0, 613.15, '142323197311181386', '闫娟枝', 'f3150ee848504816b854a43c92cacdbe', 3006.67);
INSERT INTO `salarykoukuan` VALUES ('8f380be2a4734aa5a73cb41904308e6d', 687, 171.68, 0, 686.72, 0, 343.36, 0, 25.75, 0, 118.72, '14042919781115321X', '郁建军', 'f3150ee848504816b854a43c92cacdbe', 2033.23);
INSERT INTO `salarykoukuan` VALUES ('8fcaf178f7a94678995caa635eb39291', 560, 141.04, 0, 564.16, 0, 282.08, 0, 21.16, 0, 0, '140106199010091811', '李权峰', 'f3150ee848504816b854a43c92cacdbe', 1568.44);
INSERT INTO `salarykoukuan` VALUES ('8feb09ecffcb43ca89022678590f88c4', 666, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 12.49, '140603198008161618', '刘巧', 'f3150ee848504816b854a43c92cacdbe', 1867.11);
INSERT INTO `salarykoukuan` VALUES ('90668d7be9994326bd70305bf7041a7b', 634, 160.38, 0, 641.52, 0, 320.76, 0, 24.06, 0, 100.24, '140104197606190333', '董亮', 'f3150ee848504816b854a43c92cacdbe', 1880.96);
INSERT INTO `salarykoukuan` VALUES ('90768b380db84594b8d21dae3a701589', 659, 167.88, 0, 671.52, 0, 335.76, 0, 25.18, 0, 23.62, '140103198004050614', '曹兴亮', 'f3150ee848504816b854a43c92cacdbe', 1882.96);
INSERT INTO `salarykoukuan` VALUES ('907bb42efcf7492381aed09355e787bd', 540, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 59.02, '142431199308077515', '崔晓珂', 'f3150ee848504816b854a43c92cacdbe', 1573.42);
INSERT INTO `salarykoukuan` VALUES ('9080b136d3f64c2c9984e51e2f87743d', 0, 0, 0, 0, 0, 0, 0, 0, 0, 629.34, '140103196505060627', '武昭晖', 'f3150ee848504816b854a43c92cacdbe', 629.34);
INSERT INTO `salarykoukuan` VALUES ('90958d8e952a48959a524ea4bd0dd3a7', 629, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 10.82, '140107198311252238', '聂瑞涛', 'f3150ee848504816b854a43c92cacdbe', 1783.39);
INSERT INTO `salarykoukuan` VALUES ('90a3050678ba4fb6ab0179c45bafc28a', 552, 139.8, 0, 559.2, 0, 279.6, 0, 20.97, 0, 20.39, '140829198803190025', '张秀丽', 'f3150ee848504816b854a43c92cacdbe', 1571.96);
INSERT INTO `salarykoukuan` VALUES ('90bff381642346cc88cd772d42a5df0a', 617, 151.7, 0, 606.8, 0, 303.4, 0, 22.76, 0, 87.43, '140110198305030020', '刘馨', 'f3150ee848504816b854a43c92cacdbe', 1789.09);
INSERT INTO `salarykoukuan` VALUES ('911f199f6d574cf294cda3fbfe5d3572', 673, 171.68, 0, 686.72, 0, 343.36, 0, 25.75, 0, 74.12, '142622198212307515', '席作宏', 'f3150ee848504816b854a43c92cacdbe', 1974.63);
INSERT INTO `salarykoukuan` VALUES ('9123c5250cee4d4085eb35b11ca032fe', 673, 171.68, 0, 686.72, 0, 343.36, 0, 25.75, 0, 29.11, '140107197903053916', '王浚波', 'f3150ee848504816b854a43c92cacdbe', 1929.62);
INSERT INTO `salarykoukuan` VALUES ('918749d7e7f441c78502ecf689a8a3cd', 748, 193.18, 0, 772.72, 0, 386.36, 0, 28.98, 0, 347.58, '142431198010103042', '郝兴娥', 'f3150ee848504816b854a43c92cacdbe', 2476.82);
INSERT INTO `salarykoukuan` VALUES ('91f7a424e4584d7290794dbd2ad5dc37', 670, 166.76, 0, 667.04, 0, 333.52, 0, 25.01, 0, 66.32, '511028198401275149', '李吉艳', 'f3150ee848504816b854a43c92cacdbe', 1928.65);
INSERT INTO `salarykoukuan` VALUES ('91fc4bb66b4c443a8172971a00b6cf4e', 610, 153.66, 0, 614.64, 0, 307.32, 0, 23.05, 0, 4.33, '140106198512132543', '马小清', 'f3150ee848504816b854a43c92cacdbe', 1713);
INSERT INTO `salarykoukuan` VALUES ('920425829f414e86aeefa818a675633d', 641, 163.34, 0, 653.36, 0, 326.68, 0, 24.5, 0, 0, '140103197505181239', '李伟', 'f3150ee848504816b854a43c92cacdbe', 1808.88);
INSERT INTO `salarykoukuan` VALUES ('9226b2b2315c46df856de81c59257cb7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 113.94, '140104197005041367', '张妍', 'f3150ee848504816b854a43c92cacdbe', 113.94);
INSERT INTO `salarykoukuan` VALUES ('926bb78f3f8743368ec747da2ded98e5', 640, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 15.38, '140103198006114212', '班波', 'f3150ee848504816b854a43c92cacdbe', 1820.54);
INSERT INTO `salarykoukuan` VALUES ('9291cfade2af4ddf8ce2825086899245', 0, 0, 0, 0, 0, 0, 0, 0, 0, 738, '14010219650515191X', '张美德', 'f3150ee848504816b854a43c92cacdbe', 738);
INSERT INTO `salarykoukuan` VALUES ('92ade7eecdcd4fa3bea1b220e6e289f5', 695, 177.08, 0, 708.32, 0, 354.16, 0, 26.56, 0, 82.23, '140121197707139525', '张慧玲', 'f3150ee848504816b854a43c92cacdbe', 2043.35);
INSERT INTO `salarykoukuan` VALUES ('92c6ea0c4db94c4f82af1ef21cec8b9f', 614, 155.14, 0, 620.56, 0, 310.28, 0, 23.27, 0, 92.25, '142603198409045812', '赵晓华', 'f3150ee848504816b854a43c92cacdbe', 1815.5);
INSERT INTO `salarykoukuan` VALUES ('9448279626904e529315ae6ab6095b99', 740, 190.78, 0, 763.12, 0, 381.56, 0, 28.62, 0, 100.77, '142423197903040021', '赵佼', 'f3150ee848504816b854a43c92cacdbe', 2204.85);
INSERT INTO `salarykoukuan` VALUES ('945a773f05ea44bb80fc753479ccee66', 941, 245.7, 0, 982.8, 0, 491.4, 0, 36.86, 0, 400.52, '140102197611082342', '金波', 'f3150ee848504816b854a43c92cacdbe', 3098.28);
INSERT INTO `salarykoukuan` VALUES ('9563412343e4419d98f88ddfdb8189f3', 573, 143.72, 0, 574.88, 0, 287.44, 0, 21.56, 0, 75.16, '140106198809113028', '武洁', 'f3150ee848504816b854a43c92cacdbe', 1675.76);
INSERT INTO `salarykoukuan` VALUES ('95dc09bd72c346db95ba81bfca98f5f2', 616, 153.1, 0, 612.4, 0, 306.2, 0, 22.97, 0, 88.54, '140107198908211228', '张文静', 'f3150ee848504816b854a43c92cacdbe', 1799.21);
INSERT INTO `salarykoukuan` VALUES ('96320e5e2cc14937926f34b26d377d8a', 649, 164.16, 0, 656.64, 0, 328.32, 0, 24.62, 0, 32.35, '140102197508045164', '尹艳芬', 'f3150ee848504816b854a43c92cacdbe', 1855.09);
INSERT INTO `salarykoukuan` VALUES ('966398593ca9497a8ae8ad5de78b040d', 634, 160.38, 0, 641.52, 0, 320.76, 0, 24.06, 0, 100.24, '140203197801155911', '张洋', 'f3150ee848504816b854a43c92cacdbe', 1880.96);
INSERT INTO `salarykoukuan` VALUES ('96826b92c6684d9aaa32ffc5745c7959', 1080, 0, 0, 1139.04, 0, 569.52, 0, 42.71, 0, 838.07, '140104197010141346', '董春娟', 'f3150ee848504816b854a43c92cacdbe', 3669.34);
INSERT INTO `salarykoukuan` VALUES ('96feff3f0d874e4e9c24ee8dce6cdfc9', 817, 212.66, 0, 850.64, 0, 425.32, 0, 31.9, 0, 522.15, '14010219700620492X', '郝慧颖', 'f3150ee848504816b854a43c92cacdbe', 2859.67);
INSERT INTO `salarykoukuan` VALUES ('975c2646fa594539b8f7cfef91c9ec8c', 653, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 0, '140103198205144211', '金烨', 'f3150ee848504816b854a43c92cacdbe', 1841.62);
INSERT INTO `salarykoukuan` VALUES ('975d17b8f20d465c92acd2f9867ec7cc', 471, 133.58, 0, 534.32, 0, 267.16, 0, 20.04, 0, 55.58, '140931199607030050', '袁祥', 'f3150ee848504816b854a43c92cacdbe', 1481.68);
INSERT INTO `salarykoukuan` VALUES ('97961bca83e343b4904ce836ca04f357', 462, 138.98, 0, 555.92, 0, 277.96, 0, 20.85, 0, 168.19, '140581199503270035', '王雨嘉', 'f3150ee848504816b854a43c92cacdbe', 1623.9);
INSERT INTO `salarykoukuan` VALUES ('97b0a082d9144d66a6304161fd745b10', 892, 223.94, 0, 895.76, 0, 447.88, 0, 33.59, 0, 710.07, '142601197002051922', '郝妍琴', 'f3150ee848504816b854a43c92cacdbe', 3203.24);
INSERT INTO `salarykoukuan` VALUES ('97ce9ca9c3504ddfa881d24402b71f22', 636, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 13.94, '140102198211022329', '温静', 'f3150ee848504816b854a43c92cacdbe', 1804.09);
INSERT INTO `salarykoukuan` VALUES ('98403493c52042ef93961ef11579ad06', 741, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 185.5, '140104198102202227', '陈黎', 'f3150ee848504816b854a43c92cacdbe', 2265.98);
INSERT INTO `salarykoukuan` VALUES ('99090771ba074a09a4aaa6b9301df19a', 755, 195.56, 0, 782.24, 0, 391.12, 0, 29.33, 0, 409.67, '140121197803165512', '秦永刚', 'f3150ee848504816b854a43c92cacdbe', 2562.92);
INSERT INTO `salarykoukuan` VALUES ('993ca4bb323f4a99866a58c3e4a1feb7', 925, 0, 0, 951.12, 0, 475.56, 0, 35.67, 0, 750.16, '140102197906082315', '杨立波', 'f3150ee848504816b854a43c92cacdbe', 3137.51);
INSERT INTO `salarykoukuan` VALUES ('999d36787e8749e2a176fbee86d1daae', 519, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 0, '142422198506152159', '赵志毅', 'f3150ee848504816b854a43c92cacdbe', 1673.15);
INSERT INTO `salarykoukuan` VALUES ('99a62b68c77147388443faad9099faa5', 758, 195.96, 0, 783.84, 0, 391.92, 0, 29.39, 0, 382.6, '142401196909142413', '乔国峰', 'f3150ee848504816b854a43c92cacdbe', 2541.71);
INSERT INTO `salarykoukuan` VALUES ('99af0971887f45e680769605b4cf0c12', 657, 166.76, 0, 667.04, 0, 333.52, 0, 25.01, 0, 111.74, '140107198401041223', '赵雯', 'f3150ee848504816b854a43c92cacdbe', 1961.07);
INSERT INTO `salarykoukuan` VALUES ('99c4ea801d7c43d59908d0fe324513a4', 727, 184.06, 0, 736.24, 0, 368.12, 0, 27.61, 0, 29.21, '140108198206043211', '张小勇', 'f3150ee848504816b854a43c92cacdbe', 2072.24);
INSERT INTO `salarykoukuan` VALUES ('99f3b34230944ab4bfb8ab19afed7a12', 636, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 346.48, '142322198612220586', '孟超', 'f3150ee848504816b854a43c92cacdbe', 2136.63);
INSERT INTO `salarykoukuan` VALUES ('9a48ad2eaf6a42a89effccecab461e7f', 648, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 18.48, '140106198305250627', '张守锐', 'f3150ee848504816b854a43c92cacdbe', 1843.37);
INSERT INTO `salarykoukuan` VALUES ('9a4a059c97424ec5a37e4c1759786d65', 760, 206.28, 0, 825.12, 0, 412.56, 0, 30.94, 0, 559.01, '220323197303106018', '陈显久', 'f3150ee848504816b854a43c92cacdbe', 2793.91);
INSERT INTO `salarykoukuan` VALUES ('9a6603fb61404e1d85e5f5672208dcd9', 727, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 50.89, '142401198310160921', '郄瑞丽', 'f3150ee848504816b854a43c92cacdbe', 2117.37);
INSERT INTO `salarykoukuan` VALUES ('9ade2dd597284e40b51d2578dfa6a247', 687, 171.48, 0, 685.92, 0, 342.96, 0, 25.72, 0, 80.64, '140203197812106226', '陈素云', 'f3150ee848504816b854a43c92cacdbe', 1993.72);
INSERT INTO `salarykoukuan` VALUES ('9afbc3b7a48045cabd718692a6d45928', 717, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 97.02, '140103198008125425', '孙丽', 'f3150ee848504816b854a43c92cacdbe', 1990.91);
INSERT INTO `salarykoukuan` VALUES ('9b46ec9395b44296a17e029162c50034', 726, 183.1, 0, 732.4, 0, 366.2, 0, 27.47, 0, 43.86, '140102198005135226', '赵甜甜', 'f3150ee848504816b854a43c92cacdbe', 2079.03);
INSERT INTO `salarykoukuan` VALUES ('9b614da4e2624969916ad34d91f5979d', 661, 167.62, 0, 670.48, 0, 335.24, 0, 25.14, 0, 113.2, '140103197010141542', '魏峻伟', 'f3150ee848504816b854a43c92cacdbe', 1972.68);
INSERT INTO `salarykoukuan` VALUES ('9b84fc00a82840dabcb0823c45058faa', 563, 138.56, 0, 554.24, 0, 277.12, 0, 20.78, 0, 0, '14010719920306121X', '刘振超', 'f3150ee848504816b854a43c92cacdbe', 1553.7);
INSERT INTO `salarykoukuan` VALUES ('9bfca76bcbbd4cd3ac66a82462415b2f', 642, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 61.22, '140430198401290027', '何莉', 'f3150ee848504816b854a43c92cacdbe', 1868.38);
INSERT INTO `salarykoukuan` VALUES ('9c068ae6cb0d45a9a1428531734d80b0', 640, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 105.38, '140106198409170015', '李烨东', 'f3150ee848504816b854a43c92cacdbe', 1910.54);
INSERT INTO `salarykoukuan` VALUES ('9c10154e316c4d978a4d0c43ac14208e', 773, 196.18, 0, 784.72, 0, 392.36, 0, 29.43, 0, 163.23, '140303197605040047', '张云志', 'f3150ee848504816b854a43c92cacdbe', 2338.92);
INSERT INTO `salarykoukuan` VALUES ('9c189af868d94cbe98583295dc5e7ec6', 760, 195.96, 0, 783.84, 0, 391.92, 0, 29.39, 0, 519.68, '142602197110281027', '刘俊', 'f3150ee848504816b854a43c92cacdbe', 2680.79);
INSERT INTO `salarykoukuan` VALUES ('9c67239f120a4bf98d5abdf46c6eabeb', 540, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 29.03, '140108199709291617', '曹胜', 'f3150ee848504816b854a43c92cacdbe', 1543.43);
INSERT INTO `salarykoukuan` VALUES ('9c754319d1244363843ee7487d2d592f', 553, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 58.61, '142225199704087012', '籍明慧', 'f3150ee848504816b854a43c92cacdbe', 1586.01);
INSERT INTO `salarykoukuan` VALUES ('9cb519659452490ea5555d2f1069d71a', 631, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 0, '140109198511290020', '陈婧', 'f3150ee848504816b854a43c92cacdbe', 1774.57);
INSERT INTO `salarykoukuan` VALUES ('9cd370d7ac9a4f48bf6d2584d1fa94d1', 753, 194.38, 0, 777.52, 0, 388.76, 0, 29.16, 0, 159.68, '142601198003051929', '李晓华', 'f3150ee848504816b854a43c92cacdbe', 2302.5);
INSERT INTO `salarykoukuan` VALUES ('9d6601e512ca4ebfa9716019b5cfd670', 462, 138.98, 0, 555.92, 0, 277.96, 0, 20.85, 0, 67.69, '140522199507150014', '李志玲', 'f3150ee848504816b854a43c92cacdbe', 1523.4);
INSERT INTO `salarykoukuan` VALUES ('9d831fc5a7d845a59b79b111f7267698', 602, 151.2, 0, 604.8, 0, 302.4, 0, 22.68, 0, 87.09, '14010319811109572X', '单荣芳', 'f3150ee848504816b854a43c92cacdbe', 1770.17);
INSERT INTO `salarykoukuan` VALUES ('9de24775bcd84687a9b7b4a2e338b8c2', 782, 202.62, 0, 810.48, 0, 405.24, 0, 30.39, 0, 547.55, '140102196607170636', '马洪洁', 'f3150ee848504816b854a43c92cacdbe', 2778.28);
INSERT INTO `salarykoukuan` VALUES ('9e16d35c92134ff98c28c511312b5e14', 736, 189.62, 0, 758.48, 0, 379.24, 0, 28.44, 0, 99.94, '140102197211290038', '冉志钢', 'f3150ee848504816b854a43c92cacdbe', 2191.72);
INSERT INTO `salarykoukuan` VALUES ('9e1b748829fb4af6a5ec1cd69111a7be', 816, 208.46, 0, 833.84, 0, 416.92, 0, 31.27, 0, 600.25, '14010219700703204X', '秦小娟', 'f3150ee848504816b854a43c92cacdbe', 2906.74);
INSERT INTO `salarykoukuan` VALUES ('9e3a110fa9944bb28d6c310060fec8fb', 712, 166.76, 0, 667.04, 0, 333.52, 0, 25.01, 0, 0, '140122198710301125', '张慧玲', 'f3150ee848504816b854a43c92cacdbe', 1904.33);
INSERT INTO `salarykoukuan` VALUES ('9e3f5282860e4f2f86eecee945d11f78', 771, 200.14, 0, 800.56, 0, 400.28, 0, 30.02, 0, 528.7, '142701197712011277', '贾安民', 'f3150ee848504816b854a43c92cacdbe', 2730.7);
INSERT INTO `salarykoukuan` VALUES ('9e463ba423d64f29ab29c3360f0695fc', 647, 151.3, 0, 605.2, 0, 302.6, 0, 22.7, 0, 0, '140402198308251247', '申羽佳', 'f3150ee848504816b854a43c92cacdbe', 1728.8);
INSERT INTO `salarykoukuan` VALUES ('9ea40ff121704ca1a5575a52592fd675', 646, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 17.64, '140105198301060037', '蔡仲博', 'f3150ee848504816b854a43c92cacdbe', 1840.53);
INSERT INTO `salarykoukuan` VALUES ('9eb8990edd6e4dc3837e39f99e746dc9', 490, 139.8, 0, 559.2, 0, 279.6, 0, 20.97, 0, 66.32, '370782199206170839', '管国祥', 'f3150ee848504816b854a43c92cacdbe', 1555.89);
INSERT INTO `salarykoukuan` VALUES ('9ed97a932eb34cff9ccd065bf3e28719', 590, 158.46, 0, 633.84, 0, 316.92, 0, 23.77, 0, 0, '14112219881010009X', '郭巍', 'f3150ee848504816b854a43c92cacdbe', 1722.99);
INSERT INTO `salarykoukuan` VALUES ('9ee1f92424bd49b2adf2a60e4b4f0cb2', 766, 198.16, 0, 792.64, 0, 396.32, 0, 29.72, 0, 522.92, '140103197609140722', '常京霞', 'f3150ee848504816b854a43c92cacdbe', 2705.76);
INSERT INTO `salarykoukuan` VALUES ('9eff91bb74f741259722456b8a3575b3', 617, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 102.04, '41082119870809454X', '樊亚男', 'f3150ee848504816b854a43c92cacdbe', 1862.61);
INSERT INTO `salarykoukuan` VALUES ('9f142ef13849438093d1e094c344dbb6', 620, 154.34, 0, 617.36, 0, 308.68, 0, 23.15, 0, 90.83, '14020319900812561X', '刘凯', 'f3150ee848504816b854a43c92cacdbe', 1814.36);
INSERT INTO `salarykoukuan` VALUES ('9f1a023a14764cb6a51294d565996332', 662, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 114.81, '142331198112250523', '温鑫', 'f3150ee848504816b854a43c92cacdbe', 1953.7);
INSERT INTO `salarykoukuan` VALUES ('9f356bbdbd9c4cadb36e1fbc9b9cf215', 665, 169.4, 0, 677.6, 0, 338.8, 0, 25.41, 0, 23.57, '14012219820915001X', '冯晓文', 'f3150ee848504816b854a43c92cacdbe', 1899.78);
INSERT INTO `salarykoukuan` VALUES ('9f73b05cf7244b1da0b4dd61585aa240', 727, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 0, '142631198009154927', '王燕丽', 'f3150ee848504816b854a43c92cacdbe', 2066.48);
INSERT INTO `salarykoukuan` VALUES ('9f86f20dbc274631bca2d8befae1e730', 546, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 63.58, '140429199504015625', '牛瑜霞', 'f3150ee848504816b854a43c92cacdbe', 1592.13);
INSERT INTO `salarykoukuan` VALUES ('9fa53dd03ad34d89ab03caa77194d09c', 766, 194.38, 0, 777.52, 0, 388.76, 0, 29.16, 0, 500.72, '14043019791118844X', '王飞宇', 'f3150ee848504816b854a43c92cacdbe', 2656.54);
INSERT INTO `salarykoukuan` VALUES ('9fd01bb69c1d44628c1fc32c0e5e2297', 636, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 0, '140107198209200626', '罗静', 'f3150ee848504816b854a43c92cacdbe', 1790.15);
INSERT INTO `salarykoukuan` VALUES ('a08127fe6fc54b45a1f3ea3cc8d60d42', 708, 180.86, 0, 723.44, 0, 361.72, 0, 27.13, 0, 444.98, '140112197409121726', '杨冰', 'f3150ee848504816b854a43c92cacdbe', 2446.13);
INSERT INTO `salarykoukuan` VALUES ('a0880ae76e364083ac8429362b495db5', 609, 151.86, 0, 607.44, 0, 303.72, 0, 22.78, 0, 85.66, '142703199408111232', '王国庆', 'f3150ee848504816b854a43c92cacdbe', 1780.46);
INSERT INTO `salarykoukuan` VALUES ('a0a1a23cc84d45a18daec3d05f9e476d', 648, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 108.48, '140106198406212523', '程晓洁', 'f3150ee848504816b854a43c92cacdbe', 1933.37);
INSERT INTO `salarykoukuan` VALUES ('a1051569b4c64a1e86daf566035b7e09', 733, 188.98, 0, 755.92, 0, 377.96, 0, 28.35, 0, 417.87, '142321197902160023', '梁丽', 'f3150ee848504816b854a43c92cacdbe', 2502.08);
INSERT INTO `salarykoukuan` VALUES ('a2708ae4ca274c9cb238bdadbb020a4a', 601, 139.8, 0, 559.2, 0, 279.6, 0, 20.97, 0, 91.85, '140423199404120024', '李可欣', 'f3150ee848504816b854a43c92cacdbe', 1692.42);
INSERT INTO `salarykoukuan` VALUES ('a2ae4c5ad53f43b486f0785701d2fe0c', 795, 206.28, 0, 825.12, 0, 412.56, 0, 30.94, 0, 563.51, '140104197310161760', '李英华', 'f3150ee848504816b854a43c92cacdbe', 2833.41);
INSERT INTO `salarykoukuan` VALUES ('a2b2cdeda8a9492a953eafc4ce049058', 800, 200.14, 0, 800.56, 0, 400.28, 0, 30.02, 0, 551.8, '140511197203166342', '王红梅', 'f3150ee848504816b854a43c92cacdbe', 2782.8);
INSERT INTO `salarykoukuan` VALUES ('a38130d899d04a3493669263692709f8', 610, 153.34, 0, 613.36, 0, 306.68, 0, 23, 0, 91.37, '140107198207233926', '王志桃', 'f3150ee848504816b854a43c92cacdbe', 1797.75);
INSERT INTO `salarykoukuan` VALUES ('a399e243b07b4137b773e7806b9fb6a9', 695, 177.08, 0, 708.32, 0, 354.16, 0, 26.56, 0, 82.23, '142430197812080064', '高晓燕', 'f3150ee848504816b854a43c92cacdbe', 2043.35);
INSERT INTO `salarykoukuan` VALUES ('a47868d1fb7d4b3c892a52df9db3894f', 907, 238.72, 0, 954.88, 0, 477.44, 0, 35.81, 0, 640.71, '140104196711090823', '李冬英', 'f3150ee848504816b854a43c92cacdbe', 3254.56);
INSERT INTO `salarykoukuan` VALUES ('a4c9f84442c24b49b58956e37af09dcd', 873, 229.48, 0, 917.92, 0, 458.96, 0, 34.42, 0, 538.71, '140102196910023225', '魏晓红', 'f3150ee848504816b854a43c92cacdbe', 3052.49);
INSERT INTO `salarykoukuan` VALUES ('a4d7a136ec4e4bd2ba32d2a1f3c3c0e6', 552, 138.96, 0, 555.84, 0, 277.92, 0, 20.84, 0, 63.19, '140105198805071821', '王荣', 'f3150ee848504816b854a43c92cacdbe', 1608.75);
INSERT INTO `salarykoukuan` VALUES ('a4e5297c6dd443a6af028288b8656acd', 715, 184.06, 0, 736.24, 0, 368.12, 0, 27.61, 0, 450.39, '522101198603070422', '潘婧', 'f3150ee848504816b854a43c92cacdbe', 2481.42);
INSERT INTO `salarykoukuan` VALUES ('a52c9b2d55bb4088b832f3956d6306d6', 821, 204.34, 0, 817.36, 0, 408.68, 0, 30.65, 0, 632.59, '142223197408142724', '徐国华', 'f3150ee848504816b854a43c92cacdbe', 2914.62);
INSERT INTO `salarykoukuan` VALUES ('a53645c0c0824772a5f7b1b8afe68990', 544, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 62.75, '141125199203025431', '刘亮亮', 'f3150ee848504816b854a43c92cacdbe', 1589.3);
INSERT INTO `salarykoukuan` VALUES ('a5656759b9d44b70a6edadf86da66721', 619, 157.02, 0, 628.08, 0, 314.04, 0, 23.55, 0, 51.43, '142702198901182420', '赵娆', 'f3150ee848504816b854a43c92cacdbe', 1793.12);
INSERT INTO `salarykoukuan` VALUES ('a604b68ae92d42f89685f05d1c81d415', 537, 135.24, 0, 540.96, 0, 270.48, 0, 20.29, 0, 58.11, '140110199701172041', '吴晓莉', 'f3150ee848504816b854a43c92cacdbe', 1562.08);
INSERT INTO `salarykoukuan` VALUES ('a61544e8b2be46b9bfec8c67b6e07171', 0, 0, 0, 0, 0, 0, 0, 0, 0, 737.37, '140108196505092268', '吴秀丽', 'f3150ee848504816b854a43c92cacdbe', 737.37);
INSERT INTO `salarykoukuan` VALUES ('a629cc0b5d09470faa242583b9b8aba9', 540, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 59.02, '140322199411280016', '贾亦非', 'f3150ee848504816b854a43c92cacdbe', 1573.42);
INSERT INTO `salarykoukuan` VALUES ('a65f0b6055534c55b89589305e454dbf', 642, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 106.22, '142429198507130028', '武潇', 'f3150ee848504816b854a43c92cacdbe', 1913.38);
INSERT INTO `salarykoukuan` VALUES ('a66948b6136543248136d2d4c8da29c0', 548, 165.34, 0, 661.36, 0, 330.68, 0, 24.8, 0, 37.83, '140102196803162019', '张文虎', 'f3150ee848504816b854a43c92cacdbe', 1768.01);
INSERT INTO `salarykoukuan` VALUES ('a70c2bcb3be04ad2b44932203da42f86', 667, 169.68, 0, 678.72, 0, 339.36, 0, 25.45, 0, 221.97, '140102197711282341', '张琳', 'f3150ee848504816b854a43c92cacdbe', 2102.18);
INSERT INTO `salarykoukuan` VALUES ('a75367ad9c5a496abf3b973b73a26a79', 553, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 28.6, '141181199411090052', '李奇泽', 'f3150ee848504816b854a43c92cacdbe', 1556);
INSERT INTO `salarykoukuan` VALUES ('a754a1a59a884359ab716856ccc31ba4', 625, 158.46, 0, 633.84, 0, 316.92, 0, 23.77, 0, 0, '14010719890205222X', '张怡', 'f3150ee848504816b854a43c92cacdbe', 1757.99);
INSERT INTO `salarykoukuan` VALUES ('a7607c6ac0b84fa19a28da5c41d8f1e2', 786, 204.1, 0, 816.4, 0, 408.2, 0, 30.62, 0, 551.47, '140105197205073714', '赵克昌', 'f3150ee848504816b854a43c92cacdbe', 2796.79);
INSERT INTO `salarykoukuan` VALUES ('a7bf00899ec14416b99ad37196f88bff', 831, 212.66, 0, 850.64, 0, 425.32, 0, 31.9, 0, 525.85, '142430197001182729', '翟其红', 'f3150ee848504816b854a43c92cacdbe', 2877.37);
INSERT INTO `salarykoukuan` VALUES ('a7e392c675714fe1acbbead882ae7ac3', 672, 167.76, 0, 671.04, 0, 335.52, 0, 25.16, 0, 65.92, '140108197808270038', '王飞', 'f3150ee848504816b854a43c92cacdbe', 1937.4);
INSERT INTO `salarykoukuan` VALUES ('a8b3ee71deae47398b06f35be728ed2a', 766, 194.38, 0, 777.52, 0, 388.76, 0, 29.16, 0, 373.72, '140104197708152223', '任洁', 'f3150ee848504816b854a43c92cacdbe', 2529.54);
INSERT INTO `salarykoukuan` VALUES ('a8b5d42e8ece4dc1b32bbe2303895b63', 669, 170.04, 0, 680.16, 0, 340.08, 0, 25.51, 0, 0, '140103198211041526', '王玉', 'f3150ee848504816b854a43c92cacdbe', 1884.79);
INSERT INTO `salarykoukuan` VALUES ('a8b96e1b3aac4fe7ac62995671146968', 731, 187.8, 0, 751.2, 0, 375.6, 0, 28.17, 0, 474.82, '14010319710116001X', '段卫民', 'f3150ee848504816b854a43c92cacdbe', 2548.59);
INSERT INTO `salarykoukuan` VALUES ('a91440fbecc14b819c54101d2100b73c', 741, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 143.04, '14010219801222514X', '张舒婷', 'f3150ee848504816b854a43c92cacdbe', 2223.52);
INSERT INTO `salarykoukuan` VALUES ('a917aeaf4ce84119a618d42174852b82', 711, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 315.88, '140181198609022826', '武宇红', 'f3150ee848504816b854a43c92cacdbe', 2192.04);
INSERT INTO `salarykoukuan` VALUES ('a92048013ee04f75a9612d3fa29aa3a8', 634, 159.8, 0, 639.2, 0, 319.6, 0, 23.97, 0, 54.92, '140181198204112823', '王越英', 'f3150ee848504816b854a43c92cacdbe', 1831.49);
INSERT INTO `salarykoukuan` VALUES ('a94c0bea47714eb8aad6b8fa5f954168', 477, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 59.65, '140322199503214227', '侯宁宁', 'f3150ee848504816b854a43c92cacdbe', 1511.05);
INSERT INTO `salarykoukuan` VALUES ('a95b3d8ca95e400e9895739686292b83', 677, 154.34, 0, 617.36, 0, 308.68, 0, 23.15, 0, 285.28, '14022319930903002X', '张秀玲', 'f3150ee848504816b854a43c92cacdbe', 2065.81);
INSERT INTO `salarykoukuan` VALUES ('a96b97ef3c4c44e9bc6051e545c48b05', 714, 184.06, 0, 736.24, 0, 368.12, 0, 27.61, 0, 0, '140107198407254836', '魏鹏', 'f3150ee848504816b854a43c92cacdbe', 2030.03);
INSERT INTO `salarykoukuan` VALUES ('a96cdbda4ef546ca86833cd44bddb0f1', 629, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 100.81, '140109198702060017', '李之光', 'f3150ee848504816b854a43c92cacdbe', 1873.38);
INSERT INTO `salarykoukuan` VALUES ('aa49b9cb55304f03ab1f01223eb1578b', 676, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 114.43, '140121198403273527', '陈瑞婷', 'f3150ee848504816b854a43c92cacdbe', 1967.32);
INSERT INTO `salarykoukuan` VALUES ('aa68e2e5c3a04e6089b0c1c575f4007f', 608, 154.34, 0, 617.36, 0, 308.68, 0, 23.15, 0, 92.08, '142322199009184028', '郝丽萍', 'f3150ee848504816b854a43c92cacdbe', 1803.61);
INSERT INTO `salarykoukuan` VALUES ('aa6afcca60d842f6ad80f951bd2f4c45', 706, 181.46, 0, 725.84, 0, 362.92, 0, 27.22, 0, 42.02, '140103197908220669', '郭慧辉', 'f3150ee848504816b854a43c92cacdbe', 2045.46);
INSERT INTO `salarykoukuan` VALUES ('ab6245c22af945df81eb5566d4405390', 614, 154.98, 0, 619.92, 0, 309.96, 0, 23.25, 0, 47.97, '142727198001231511', '王志洋', 'f3150ee848504816b854a43c92cacdbe', 1770.08);
INSERT INTO `salarykoukuan` VALUES ('ab8244b59f5c4453b4bf5a4555a95ffd', 642, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 0, '142629198403071044', '陕倩倩', 'f3150ee848504816b854a43c92cacdbe', 1807.16);
INSERT INTO `salarykoukuan` VALUES ('ab9e29a9627a4c0babdd5f7ce56ff736', 629, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 0, '150421198810211815', '牟志然', 'f3150ee848504816b854a43c92cacdbe', 1772.57);
INSERT INTO `salarykoukuan` VALUES ('abb6eb52d349457a8ff725016a35067a', 766, 194.38, 0, 777.52, 0, 388.76, 0, 29.16, 0, 500.72, '140123197910140022', '曹宏宏', 'f3150ee848504816b854a43c92cacdbe', 2656.54);
INSERT INTO `salarykoukuan` VALUES ('abbb3aa864e947ee97534785256cd0a7', 695, 178.28, 0, 713.12, 0, 356.56, 0, 26.74, 0, 253.7, '142424197705276515', '张乃江', 'f3150ee848504816b854a43c92cacdbe', 2223.4);
INSERT INTO `salarykoukuan` VALUES ('abc0e15ee2344e958c7c910cbfacce52', 601, 153.1, 0, 612.4, 0, 306.2, 0, 22.97, 0, 293.73, '142431198908014812', '郭建忠', 'f3150ee848504816b854a43c92cacdbe', 1989.4);
INSERT INTO `salarykoukuan` VALUES ('abc387c9467e4d3e86c8214cda7c99a5', 634, 160.38, 0, 641.52, 0, 320.76, 0, 24.06, 0, 100.24, '140102197604250619', '王峰龙', 'f3150ee848504816b854a43c92cacdbe', 1880.96);
INSERT INTO `salarykoukuan` VALUES ('abdfe881262a4bcbb805b684a92ae956', 758, 195.96, 0, 783.84, 0, 391.92, 0, 29.39, 0, 516.88, '140102196908135172', '李建军', 'f3150ee848504816b854a43c92cacdbe', 2675.99);
INSERT INTO `salarykoukuan` VALUES ('abfeb92ebf8f4394bdec1087bb172d5a', 733, 188.98, 0, 755.92, 0, 377.96, 0, 28.35, 0, 192.53, '142429198112043827', '游秀芬', 'f3150ee848504816b854a43c92cacdbe', 2276.74);
INSERT INTO `salarykoukuan` VALUES ('ac88be78c93749eba4bf2e490cfcf435', 0, 0, 0, 0, 0, 0, 0, 0, 0, 598.61, '610103196504111624', '任凤琴', 'f3150ee848504816b854a43c92cacdbe', 598.61);
INSERT INTO `salarykoukuan` VALUES ('acba37444f1b464da46a91570f4f245d', 614, 153.1, 0, 612.4, 0, 306.2, 0, 22.97, 0, 87.7, '140106199008131212', '张云飞', 'f3150ee848504816b854a43c92cacdbe', 1796.37);
INSERT INTO `salarykoukuan` VALUES ('acd5a3aeb17d4662b82600d7461eea44', 825, 214.84, 0, 859.36, 0, 429.68, 0, 32.23, 0, 607.78, '140102197309035166', '郭振红', 'f3150ee848504816b854a43c92cacdbe', 2968.89);
INSERT INTO `salarykoukuan` VALUES ('ad1b77b7309248d6b48d394f3f526f32', 695, 177.08, 0, 708.32, 0, 354.16, 0, 26.56, 0, 82.23, '142629197712231027', '周雅娟', 'f3150ee848504816b854a43c92cacdbe', 2043.35);
INSERT INTO `salarykoukuan` VALUES ('ad28ec55d61d40e9b1209fed4d715022', 806, 206.28, 0, 825.12, 0, 412.56, 0, 30.94, 0, 560.51, '140102197102200013', '刘晋涛', 'f3150ee848504816b854a43c92cacdbe', 2841.41);
INSERT INTO `salarykoukuan` VALUES ('ad86fdbf9e034b7e938903d08f6186c9', 642, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 61.22, '140106198309013047', '贾莉婷', 'f3150ee848504816b854a43c92cacdbe', 1868.38);
INSERT INTO `salarykoukuan` VALUES ('adacabc38068478bb8c17d8032051eb1', 653, 166.22, 0, 664.88, 0, 332.44, 0, 24.93, 0, 20.24, '142401198609210911', '翟璠', 'f3150ee848504816b854a43c92cacdbe', 1861.71);
INSERT INTO `salarykoukuan` VALUES ('adb3d0dd3d304cadb1a6639424e063aa', 879, 231.72, 0, 926.88, 0, 463.44, 0, 34.76, 0, 345.94, '140102197105086519', '张永平', 'f3150ee848504816b854a43c92cacdbe', 2881.74);
INSERT INTO `salarykoukuan` VALUES ('adf1ff2c07b145b8bbd7b035a1d45ac1', 706, 181.46, 0, 725.84, 0, 362.92, 0, 27.22, 0, 0, '140105198405090521', '刘洁', 'f3150ee848504816b854a43c92cacdbe', 2003.44);
INSERT INTO `salarykoukuan` VALUES ('adf6276d61bd4ae38671a4547e79d626', 758, 192.58, 0, 770.32, 0, 385.16, 0, 28.89, 0, 341, '14011219770818281X', '肖永强', 'f3150ee848504816b854a43c92cacdbe', 2475.95);
INSERT INTO `salarykoukuan` VALUES ('ae19574b050c4423a1b6f4f79263cfe5', 873, 184.06, 0, 736.24, 0, 368.12, 0, 27.61, 0, 72.86, '140623198108077013', '段永红', 'f3150ee848504816b854a43c92cacdbe', 2261.89);
INSERT INTO `salarykoukuan` VALUES ('ae6bcaee48134fe3adebaba1b1a79b6d', 722, 181.88, 0, 727.52, 0, 363.76, 0, 27.28, 0, 0, '14032119771229271X', '董海瑞', 'f3150ee848504816b854a43c92cacdbe', 2022.44);
INSERT INTO `salarykoukuan` VALUES ('ae6f5367fb15487f9eb7e3d4258ba6cc', 478, 159.28, 0, 637.12, 0, 318.56, 0, 23.89, 0, 830.31, '220721199212152017', '梁喜龙', 'f3150ee848504816b854a43c92cacdbe', 2447.16);
INSERT INTO `salarykoukuan` VALUES ('aeab7bc6de494ea0a8f1af5ca1070ccb', 741, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 82.36, '140108198204031946', '史晓芳', 'f3150ee848504816b854a43c92cacdbe', 2162.84);
INSERT INTO `salarykoukuan` VALUES ('af147bb12f6f4ed4996292eba4d60692', 765, 194.38, 0, 777.52, 0, 388.76, 0, 29.16, 0, 347.92, '142702197604243018', '徐东亮', 'f3150ee848504816b854a43c92cacdbe', 2502.74);
INSERT INTO `salarykoukuan` VALUES ('af160c9875314783aa11b9a1af9b2642', 725, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 0, '140102198108172310', '赵鸿博', 'f3150ee848504816b854a43c92cacdbe', 2064.48);
INSERT INTO `salarykoukuan` VALUES ('af38a63660d340d59bd63b0da99f93ab', 711, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 465.88, '142724198603071421', '杨天敏', 'f3150ee848504816b854a43c92cacdbe', 2342.04);
INSERT INTO `salarykoukuan` VALUES ('afa925eadaea4329b2d648743fffdd4b', 641, 149.66, 0, 598.64, 0, 299.32, 0, 22.45, 0, 19.11, '140109198503180526', '张璇', 'f3150ee848504816b854a43c92cacdbe', 1730.18);
INSERT INTO `salarykoukuan` VALUES ('afa9f976457b4740a7b825c78bb90d58', 729, 186.8, 0, 747.2, 0, 373.6, 0, 28.02, 0, 28.57, '412826197008050326', '殷颖颖', 'f3150ee848504816b854a43c92cacdbe', 2093.19);
INSERT INTO `salarykoukuan` VALUES ('afdfc7c3fd8a4f2780466697c703a775', 573, 143.72, 0, 574.88, 0, 287.44, 0, 21.56, 0, 30.16, '140424198606234822', '李静森', 'f3150ee848504816b854a43c92cacdbe', 1630.76);
INSERT INTO `salarykoukuan` VALUES ('b02d125c5b074b87a5472278a6641480', 800, 200.14, 0, 800.56, 0, 400.28, 0, 30.02, 0, 0, '142601197710031922', '赵平', 'f3150ee848504816b854a43c92cacdbe', 2231);
INSERT INTO `salarykoukuan` VALUES ('b02d60e8b6c34858bdf011cc980b43b9', 648, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 18.48, '14010719831113002X', '郭家雁', 'f3150ee848504816b854a43c92cacdbe', 1843.37);
INSERT INTO `salarykoukuan` VALUES ('b09014b919d64d04a45f94414ca88389', 758, 195.96, 0, 783.84, 0, 391.92, 0, 29.39, 0, 517.16, '140103196910070036', '田安谷', 'f3150ee848504816b854a43c92cacdbe', 2676.27);
INSERT INTO `salarykoukuan` VALUES ('b109f1cd2e4d4cc1ba638258bef12710', 737, 170.04, 0, 680.16, 0, 340.08, 0, 25.51, 0, 481.02, '140181198101044741', '刘芳', 'f3150ee848504816b854a43c92cacdbe', 2433.81);
INSERT INTO `salarykoukuan` VALUES ('b15e4728569e4b9ab52e1ef21e3c6c3f', 667, 169.68, 0, 678.72, 0, 339.36, 0, 25.45, 0, 116.87, '140102197810230627', '智建丽', 'f3150ee848504816b854a43c92cacdbe', 1997.08);
INSERT INTO `salarykoukuan` VALUES ('b1d1f54609bc43908826c87de11fc6f8', 539, 141.58, 0, 566.32, 0, 283.16, 0, 21.24, 0, 88.43, '14112219940820010X', '杨阳', 'f3150ee848504816b854a43c92cacdbe', 1639.73);
INSERT INTO `salarykoukuan` VALUES ('b1e0792750634b5ca8280d7b8129b78e', 619, 157.02, 0, 628.08, 0, 314.04, 0, 23.55, 0, 21.43, '140107198809294523', '任超', 'f3150ee848504816b854a43c92cacdbe', 1763.12);
INSERT INTO `salarykoukuan` VALUES ('b1f7d3c4ac9945d184c6356e8359149f', 648, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 108.48, '140102198103231422', '李薇', 'f3150ee848504816b854a43c92cacdbe', 1933.37);
INSERT INTO `salarykoukuan` VALUES ('b222e8f41a734fafaf7ca933fce2e42c', 473, 133.58, 0, 534.32, 0, 267.16, 0, 20.04, 0, 56.42, '140525199709188722', '刘慧泽', 'f3150ee848504816b854a43c92cacdbe', 1484.52);
INSERT INTO `salarykoukuan` VALUES ('b27a4f73cbd74f119884130034b93d6f', 793, 202.36, 0, 809.44, 0, 404.72, 0, 30.35, 0, 537.31, '140102197604156518', '江河', 'f3150ee848504816b854a43c92cacdbe', 2777.18);
INSERT INTO `salarykoukuan` VALUES ('b2af831d08fa44af8a952a6c10b4b463', 759, 196.18, 0, 784.72, 0, 392.36, 0, 29.43, 0, 514.33, '14012219770621282X', '张文仙', 'f3150ee848504816b854a43c92cacdbe', 2676.02);
INSERT INTO `salarykoukuan` VALUES ('b304f2e04fd34b7e9baa43c6bdf5d73a', 700, 175.08, 0, 700.32, 0, 350.16, 0, 26.26, 0, 50.09, '140102197211126529', '王志欣', 'f3150ee848504816b854a43c92cacdbe', 2001.91);
INSERT INTO `salarykoukuan` VALUES ('b349c1133d664055af43143b338b650a', 669, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 176.55, '142732198207170022', '王迎敏', 'f3150ee848504816b854a43c92cacdbe', 2010.71);
INSERT INTO `salarykoukuan` VALUES ('b37b2a5360c44e3b92b55380342faa6e', 735, 188.98, 0, 755.92, 0, 377.96, 0, 28.35, 0, 465.76, '142402197206120032', '王启军', 'f3150ee848504816b854a43c92cacdbe', 2551.97);
INSERT INTO `salarykoukuan` VALUES ('b37e1c1088f1446c82faf08633344b73', 464, 138.98, 0, 555.92, 0, 277.96, 0, 20.85, 0, 68.53, '14260319960923302X', '杨慧芳', 'f3150ee848504816b854a43c92cacdbe', 1526.24);
INSERT INTO `salarykoukuan` VALUES ('b396c015455a49a5b9c84cd786da24aa', 681, 173.48, 0, 693.92, 0, 346.96, 0, 26.02, 0, 47.39, '142331198107090529', '张颖', 'f3150ee848504816b854a43c92cacdbe', 1968.77);
INSERT INTO `salarykoukuan` VALUES ('b3b8dc6e96a2431782def7bc2242958a', 826, 216.74, 0, 866.96, 0, 433.48, 0, 32.51, 0, 468.23, '142225197606075510', '祖珑', 'f3150ee848504816b854a43c92cacdbe', 2843.92);
INSERT INTO `salarykoukuan` VALUES ('b3b9ee22170a402594cf2659f7e19a04', 471, 133.58, 0, 534.32, 0, 267.16, 0, 20.04, 0, 55.58, '142332199605230011', '乔剑', 'f3150ee848504816b854a43c92cacdbe', 1481.68);
INSERT INTO `salarykoukuan` VALUES ('b3fa44ae59b541f6b6775ae51bf2f76d', 912, 238.1, 0, 952.4, 0, 476.2, 0, 35.72, 0, 725.98, '140103196511274269', '李俊萍', 'f3150ee848504816b854a43c92cacdbe', 3340.4);
INSERT INTO `salarykoukuan` VALUES ('b45469b26c9c438d85575557ed0815ff', 648, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 33.48, '140302198008211029', '吴瑕', 'f3150ee848504816b854a43c92cacdbe', 1858.37);
INSERT INTO `salarykoukuan` VALUES ('b4594a51d1e145f19fdd4592b431dd1e', 667, 169.68, 0, 678.72, 0, 339.36, 0, 25.45, 0, 71.87, '140103197602150645', '续冰', 'f3150ee848504816b854a43c92cacdbe', 1952.08);
INSERT INTO `salarykoukuan` VALUES ('b45b32f17c024bf1a6195c33c5c1417f', 818, 212.88, 0, 851.52, 0, 425.76, 0, 31.93, 0, 598.89, '210203196908075261', '任永珍', 'f3150ee848504816b854a43c92cacdbe', 2938.98);
INSERT INTO `salarykoukuan` VALUES ('b468e9df30b4425d849837e41577757c', 644, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 101.24, '142603198908181149', '米娟', 'f3150ee848504816b854a43c92cacdbe', 1888.81);
INSERT INTO `salarykoukuan` VALUES ('b4acba87843944aab909a886c2475854', 848, 222.88, 0, 891.52, 0, 445.76, 0, 33.43, 0, 650.14, '142724197203181256', '姚晓黎', 'f3150ee848504816b854a43c92cacdbe', 3091.73);
INSERT INTO `salarykoukuan` VALUES ('b4d4ff339c7c4aa19e66a7c28836a6c3', 672, 167.88, 0, 671.52, 0, 335.76, 0, 25.18, 0, 74.96, '140123198306300215', '段兆忠', 'f3150ee848504816b854a43c92cacdbe', 1947.3);
INSERT INTO `salarykoukuan` VALUES ('b5401792110a400db025b23c825d4324', 698, 179.56, 0, 718.24, 0, 359.12, 0, 26.93, 0, 425.01, '140430198410060047', '郝佳瑞', 'f3150ee848504816b854a43c92cacdbe', 2406.86);
INSERT INTO `salarykoukuan` VALUES ('b571626e59dc4a65a5f35ed27f89b420', 591, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 87.73, '140203199411092328', '王安琪', 'f3150ee848504816b854a43c92cacdbe', 1661.28);
INSERT INTO `salarykoukuan` VALUES ('b57533fb5b3b4c239eeb63c97e678ffd', 711, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 0, '142325198208065528', '陶燕贞', 'f3150ee848504816b854a43c92cacdbe', 1876.16);
INSERT INTO `salarykoukuan` VALUES ('b5a43ffbebce4d3c98fa1d5565ff0b09', 891, 223.94, 0, 895.76, 0, 447.88, 0, 33.59, 0, 559.68, '140103196807060622', '李京焱', 'f3150ee848504816b854a43c92cacdbe', 3051.85);
INSERT INTO `salarykoukuan` VALUES ('b5af207114a2443aa8fc506129ccf0d9', 742, 191.78, 0, 767.12, 0, 383.56, 0, 28.77, 0, 312.79, '140102197812056511', '赵永刚', 'f3150ee848504816b854a43c92cacdbe', 2426.02);
INSERT INTO `salarykoukuan` VALUES ('b63306b3f9e14c9791b5ababa9fc312a', 537, 135.24, 0, 540.96, 0, 270.48, 0, 20.29, 0, 58.11, '142401199401104225', '康晓婷', 'f3150ee848504816b854a43c92cacdbe', 1562.08);
INSERT INTO `salarykoukuan` VALUES ('b6be902dbf5947e2bc2da67c13abf82d', 677, 172.68, 0, 690.72, 0, 345.36, 0, 25.9, 0, 0, '140103197804024217', '杜杰', 'f3150ee848504816b854a43c92cacdbe', 1911.66);
INSERT INTO `salarykoukuan` VALUES ('b6c2185a2ac446b49a7820f8845db13e', 462, 138.98, 0, 555.92, 0, 277.96, 0, 20.85, 0, 67.69, '14112819930614001X', '刘勇', 'f3150ee848504816b854a43c92cacdbe', 1523.4);
INSERT INTO `salarykoukuan` VALUES ('b6c74cb80445447c89ffbf6cf815ec45', 766, 194.38, 0, 777.52, 0, 388.76, 0, 29.16, 0, 271.26, '142724197809061945', '汪艳霞', 'f3150ee848504816b854a43c92cacdbe', 2427.08);
INSERT INTO `salarykoukuan` VALUES ('b73229fff83849d69d24bb25f67cb7e0', 608, 154.34, 0, 617.36, 0, 308.68, 0, 23.15, 0, 0, '140107199208100046', '关欣', 'f3150ee848504816b854a43c92cacdbe', 1711.53);
INSERT INTO `salarykoukuan` VALUES ('b78abf2a086f4de9b1604fcd9fb112c6', 537, 135.24, 0, 540.96, 0, 270.48, 0, 20.29, 0, 58.12, '140423199611060829', '郭宇晴', 'f3150ee848504816b854a43c92cacdbe', 1562.09);
INSERT INTO `salarykoukuan` VALUES ('b8b50144edbc49229a65793a854476fa', 727, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 469.65, '142625197903120025', '李慧慧', 'f3150ee848504816b854a43c92cacdbe', 2536.13);
INSERT INTO `salarykoukuan` VALUES ('b9a8c28da63e4d8088e997c2c41dfdf3', 722, 185.66, 0, 742.64, 0, 371.32, 0, 27.85, 0, 93.35, '14010219750120517X', '孙刚平', 'f3150ee848504816b854a43c92cacdbe', 2142.82);
INSERT INTO `salarykoukuan` VALUES ('b9adff224bcf4f4badd3d5883d8dcb51', 636, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 103.94, '140110198601230027', '袁菁菁', 'f3150ee848504816b854a43c92cacdbe', 1894.09);
INSERT INTO `salarykoukuan` VALUES ('b9cdaca1f2ac42cfada0a0c39ec91777', 651, 165.22, 0, 660.88, 0, 330.44, 0, 24.78, 0, 109.46, '142621198807120040', '王鑫', 'f3150ee848504816b854a43c92cacdbe', 1941.78);
INSERT INTO `salarykoukuan` VALUES ('ba54232854a34dbb90745ceb796896df', 655, 166.76, 0, 667.04, 0, 333.52, 0, 25.01, 0, 65.9, '140121198112195514', '梁安国', 'f3150ee848504816b854a43c92cacdbe', 1913.23);
INSERT INTO `salarykoukuan` VALUES ('bab6fb6a0b76425d8f4ce85faecfb386', 606, 154.34, 0, 617.36, 0, 308.68, 0, 23.15, 0, 0, '370882199011054710', '滕宇帆', 'f3150ee848504816b854a43c92cacdbe', 1709.53);
INSERT INTO `salarykoukuan` VALUES ('bbb6763de2d04726b15857e4310496d3', 759, 196.78, 0, 787.12, 0, 393.56, 0, 29.52, 0, 47.91, '142601197908051910', '张永刚', 'f3150ee848504816b854a43c92cacdbe', 2213.89);
INSERT INTO `salarykoukuan` VALUES ('bbcb43b861b44be98c87d906f8e119a2', 752, 190.78, 0, 763.12, 0, 381.56, 0, 28.62, 0, 327.56, '140226197906176019', '李建利', 'f3150ee848504816b854a43c92cacdbe', 2443.64);
INSERT INTO `salarykoukuan` VALUES ('bc00b0b47d594ae7930e9511d97b372a', 773, 195.96, 0, 783.84, 0, 391.92, 0, 29.39, 0, 518.28, '142322197007261529', '孟秀珍', 'f3150ee848504816b854a43c92cacdbe', 2692.39);
INSERT INTO `salarykoukuan` VALUES ('bc14ced36c6e408eafd111098e9fb192', 647, 164.68, 0, 658.72, 0, 329.36, 0, 24.7, 0, 59.97, '140102197106240012', '连原海', 'f3150ee848504816b854a43c92cacdbe', 1884.43);
INSERT INTO `salarykoukuan` VALUES ('bc959fe56427414fa1c1ec2a2b84688f', 696, 173.48, 0, 693.92, 0, 346.96, 0, 26.02, 0, 0, '142430198102110024', '杨婷婷', 'f3150ee848504816b854a43c92cacdbe', 1936.38);
INSERT INTO `salarykoukuan` VALUES ('bc9f7479fe2b4c7e90b41bc138af4d41', 695, 177.08, 0, 708.32, 0, 354.16, 0, 26.56, 0, 82.23, '142623197811044325', '刘艳丽', 'f3150ee848504816b854a43c92cacdbe', 2043.35);
INSERT INTO `salarykoukuan` VALUES ('bd34e06e5b2047f0af06dbed25e06d9c', 696, 173.48, 0, 693.92, 0, 346.96, 0, 26.02, 0, 187.67, '142623198011256121', '韩英', 'f3150ee848504816b854a43c92cacdbe', 2124.05);
INSERT INTO `salarykoukuan` VALUES ('be5b4489b09b4f8997dc8909f0c65f42', 674, 167.88, 0, 671.52, 0, 335.76, 0, 25.18, 0, 75.8, '142323198204080226', '何源', 'f3150ee848504816b854a43c92cacdbe', 1950.14);
INSERT INTO `salarykoukuan` VALUES ('bebcbde2ad284997b3b65ddabbbd5b99', 692, 158.46, 0, 633.84, 0, 316.92, 0, 23.77, 0, 0, '14270119881025121X', '葛启隆', 'f3150ee848504816b854a43c92cacdbe', 1824.99);
INSERT INTO `salarykoukuan` VALUES ('bf0eb87f03bf419193aed90f012de051', 709, 182.52, 0, 730.08, 0, 365.04, 0, 27.38, 0, 0, '430482198308250026', '李芳萍', 'f3150ee848504816b854a43c92cacdbe', 2014.02);
INSERT INTO `salarykoukuan` VALUES ('bf45e643dc84477baa592097ed79294a', 540, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 59.03, '141122199408250094', '毋伟', 'f3150ee848504816b854a43c92cacdbe', 1573.43);
INSERT INTO `salarykoukuan` VALUES ('bf6c496cebc34e84842a2199cd665593', 681, 173.48, 0, 693.92, 0, 346.96, 0, 26.02, 0, 86.39, '140624197611204026', '李利芳', 'f3150ee848504816b854a43c92cacdbe', 2007.77);
INSERT INTO `salarykoukuan` VALUES ('bf9a8ecbcbfb4a32bf311912df3dfa55', 656, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 67.58, '142603198509202029', '武婧', 'f3150ee848504816b854a43c92cacdbe', 1888.74);
INSERT INTO `salarykoukuan` VALUES ('bfc2f6a690ae412ab88fa3c3cb06585c', 745, 188.98, 0, 755.92, 0, 377.96, 0, 28.35, 0, 157.1, '140122198210220011', '方向明', 'f3150ee848504816b854a43c92cacdbe', 2253.31);
INSERT INTO `salarykoukuan` VALUES ('bfd25e9eec9b4e4b88392271a702ceb0', 815, 204.1, 0, 816.4, 0, 408.2, 0, 30.62, 0, 424.57, '142302197112031025', '白淑珍', 'f3150ee848504816b854a43c92cacdbe', 2698.89);
INSERT INTO `salarykoukuan` VALUES ('bffd3e791ddc43cda69990404e98731d', 648, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 19.43, '140202198501182035', '马涛', 'f3150ee848504816b854a43c92cacdbe', 1821.58);
INSERT INTO `salarykoukuan` VALUES ('c01f642fee764504a48c04eb107b749e', 598, 151.86, 0, 607.44, 0, 303.72, 0, 22.78, 0, 86.92, '140105199303051825', '白宇星', 'f3150ee848504816b854a43c92cacdbe', 1770.72);
INSERT INTO `salarykoukuan` VALUES ('c02452c4a0c54b8e9e0d913f8c216ee0', 581, 147.06, 0, 588.24, 0, 294.12, 0, 22.06, 0, 77.5, '140522199302051039', '于晋伟', 'f3150ee848504816b854a43c92cacdbe', 1709.98);
INSERT INTO `salarykoukuan` VALUES ('c078745c6ddd4a01b9a414e6303fed96', 0, 188.98, 0, 755.92, 0, 377.96, 0, 28.35, 0, 0, '140112198109023010', '李强', 'f3150ee848504816b854a43c92cacdbe', 1351.21);
INSERT INTO `salarykoukuan` VALUES ('c0864d3cd56641dab48d8aba9a51b390', 727, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 0, '140107198307222626', '张婷', 'f3150ee848504816b854a43c92cacdbe', 2066.48);
INSERT INTO `salarykoukuan` VALUES ('c0d6a9a55c39445a900806107efe4fa3', 708, 181.88, 0, 727.52, 0, 363.76, 0, 27.28, 0, 87.08, '140103197411080672', '应立冬', 'f3150ee848504816b854a43c92cacdbe', 2095.52);
INSERT INTO `salarykoukuan` VALUES ('c13b7d70232f44018aa8f3a61c215a8d', 695, 162.26, 0, 649.04, 0, 324.52, 0, 24.34, 0, 77.9, '140107198511090042', '白宁', 'f3150ee848504816b854a43c92cacdbe', 1933.06);
INSERT INTO `salarykoukuan` VALUES ('c16e3deefaea493fa55da32b5aeac5c9', 519, 155.68, 0, 622.72, 0, 311.36, 0, 23.35, 0, 1053.49, '14232519900515252X', '裴婷', 'f3150ee848504816b854a43c92cacdbe', 2685.6);
INSERT INTO `salarykoukuan` VALUES ('c1d2816b8b6d437aa6ffff91e2e51d10', 817, 212.66, 0, 850.64, 0, 425.32, 0, 31.9, 0, 497.15, '140104197003160821', '张彬', 'f3150ee848504816b854a43c92cacdbe', 2834.67);
INSERT INTO `salarykoukuan` VALUES ('c1db2d559f614b0a9337bd4fb05b4beb', 625, 158.46, 0, 633.84, 0, 316.92, 0, 23.77, 0, 98.61, '142623198804060022', '梁荣', 'f3150ee848504816b854a43c92cacdbe', 1856.6);
INSERT INTO `salarykoukuan` VALUES ('c26002883cfb415b8c2570a4f477f71c', 753, 194.38, 0, 777.52, 0, 388.76, 0, 29.16, 0, 280.78, '142326197803064820', '白颉', 'f3150ee848504816b854a43c92cacdbe', 2423.6);
INSERT INTO `salarykoukuan` VALUES ('c2e6ff5d82ce487caa40419d43cafad0', 738, 190.78, 0, 763.12, 0, 381.56, 0, 28.62, 0, 69.93, '142332198305120019', '刘宏伟', 'f3150ee848504816b854a43c92cacdbe', 2172.01);
INSERT INTO `salarykoukuan` VALUES ('c2ed4310413743e39900fb267fe01d5d', 598, 146.64, 0, 586.56, 0, 293.28, 0, 22, 0, 0, '140102198008075142', '陈炜', 'f3150ee848504816b854a43c92cacdbe', 1646.48);
INSERT INTO `salarykoukuan` VALUES ('c3190e3c85b04330a7abf8b4b02e71a8', 551, 138.56, 0, 554.24, 0, 277.12, 0, 20.78, 0, 65.64, '140430199407080025', '梁泽', 'f3150ee848504816b854a43c92cacdbe', 1607.34);
INSERT INTO `salarykoukuan` VALUES ('c32cf3a85a2c446cba8d0f53a35d1f2c', 591, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 87.73, '141102199408300041', '冯叶', 'f3150ee848504816b854a43c92cacdbe', 1661.28);
INSERT INTO `salarykoukuan` VALUES ('c3ad4822ed614f2abe9d24afe8c9a92c', 720, 180.86, 0, 723.44, 0, 361.72, 0, 27.13, 0, 401.53, '142202197511200337', '谢中柱', 'f3150ee848504816b854a43c92cacdbe', 2414.68);
INSERT INTO `salarykoukuan` VALUES ('c445cfab36154c8aab231bdd39843c1f', 601, 151.3, 0, 605.2, 0, 302.6, 0, 22.7, 0, 0, '371121198001010015', '郑鹏', 'f3150ee848504816b854a43c92cacdbe', 1682.8);
INSERT INTO `salarykoukuan` VALUES ('c465b38f51514efcb896e9b5a52df876', 654, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 22, '140103198201270640', '王蕾', 'f3150ee848504816b854a43c92cacdbe', 1864.62);
INSERT INTO `salarykoukuan` VALUES ('c470d353c7924392b3b163037706e5de', 883, 221.56, 0, 886.24, 0, 443.12, 0, 33.23, 0, 698.28, '142601196810021946', '赵晓梅', 'f3150ee848504816b854a43c92cacdbe', 3165.43);
INSERT INTO `salarykoukuan` VALUES ('c4a09760545b4d61ad2f0e08c7b80d03', 642, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 0, '140108198302024846', '李宗瑾', 'f3150ee848504816b854a43c92cacdbe', 1807.16);
INSERT INTO `salarykoukuan` VALUES ('c4c927bc0ce9439db5c00ad7d16b20ee', 591, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 87.73, '140109199401100585', '司凡', 'f3150ee848504816b854a43c92cacdbe', 1661.28);
INSERT INTO `salarykoukuan` VALUES ('c51222b48ce542dc82567c970d0f1d1b', 874, 227.3, 0, 909.2, 0, 454.6, 0, 34.1, 0, 674.18, '140624198209042043', '魏玲', 'f3150ee848504816b854a43c92cacdbe', 3173.38);
INSERT INTO `salarykoukuan` VALUES ('c53f39e66fa8476da60bd28b92f09a02', 1023, 0, 0, 1064.32, 0, 532.16, 0, 39.91, 0, 736.26, '140202197204204029', '梁红梅', 'f3150ee848504816b854a43c92cacdbe', 3395.65);
INSERT INTO `salarykoukuan` VALUES ('c55e1d82b2c14970ba2913854bf0c6e2', 619, 157.02, 0, 628.08, 0, 314.04, 0, 23.55, 0, 6.43, '14010619870722128X', '彭翀', 'f3150ee848504816b854a43c92cacdbe', 1748.12);
INSERT INTO `salarykoukuan` VALUES ('c565d3d025b6413f8a1b08b6184ff2ba', 553, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 58.61, '140402199510220414', '张圣都', 'f3150ee848504816b854a43c92cacdbe', 1586.01);
INSERT INTO `salarykoukuan` VALUES ('c56992309ddf471c8a18a098d01f9dea', 620, 156.62, 0, 626.48, 0, 313.24, 0, 23.49, 0, 49.53, '140622198612190019', '俞晓峰', 'f3150ee848504816b854a43c92cacdbe', 1789.36);
INSERT INTO `salarykoukuan` VALUES ('c5a5c61a998c4ea2a71ec310be52b767', 715, 184.06, 0, 736.24, 0, 368.12, 0, 27.61, 0, 0, '140108198709041920', '尹婷婷', 'f3150ee848504816b854a43c92cacdbe', 2031.03);
INSERT INTO `salarykoukuan` VALUES ('c5c0248628564b9590809d09af749faa', 688, 171.68, 0, 686.72, 0, 343.36, 0, 25.75, 0, 80.9, '142601198007011932', '王勇', 'f3150ee848504816b854a43c92cacdbe', 1996.41);
INSERT INTO `salarykoukuan` VALUES ('c625dcb9c9dc4fb2bc8ea0c2c60850e3', 631, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 56.66, '140107198310080024', '孙静', 'f3150ee848504816b854a43c92cacdbe', 1831.23);
INSERT INTO `salarykoukuan` VALUES ('c63e864f10744540b918724ce7d2d3fc', 648, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 63.48, '14010219771001322X', '赵慧', 'f3150ee848504816b854a43c92cacdbe', 1888.37);
INSERT INTO `salarykoukuan` VALUES ('c64b15d8c61248e3bc6186164927b54f', 708, 181.88, 0, 727.52, 0, 363.76, 0, 27.28, 0, 102.07, '140102197904141430', '朱震峰', 'f3150ee848504816b854a43c92cacdbe', 2110.51);
INSERT INTO `salarykoukuan` VALUES ('c6a4308722774be4b70a42182155d8f1', 473, 133.58, 0, 534.32, 0, 267.16, 0, 20.04, 0, 56.43, '130184199901091521', '王若蓝', 'f3150ee848504816b854a43c92cacdbe', 1484.53);
INSERT INTO `salarykoukuan` VALUES ('c6fcba5042a148f2871c5cb91534d632', 892, 223.94, 0, 895.76, 0, 447.88, 0, 33.59, 0, 711.3, '140102196810100641', '何瑞芳', 'f3150ee848504816b854a43c92cacdbe', 3204.47);
INSERT INTO `salarykoukuan` VALUES ('c72da4e752fe48a6be3463cce3c11c5e', 747, 188.98, 0, 755.92, 0, 377.96, 0, 28.35, 0, 109.85, '142202198207140522', '贾晓霞', 'f3150ee848504816b854a43c92cacdbe', 2208.06);
INSERT INTO `salarykoukuan` VALUES ('c7374d7a953342f0911ce4124f907cbd', 659, 167.88, 0, 671.52, 0, 335.76, 0, 25.18, 0, 113.63, '140103197903211210', '李泰', 'f3150ee848504816b854a43c92cacdbe', 1972.97);
INSERT INTO `salarykoukuan` VALUES ('c79ec7ce15d242109cec5b737044ff1d', 801, 204.34, 0, 817.36, 0, 408.68, 0, 30.65, 0, 398.69, '142429197603210023', '王岩', 'f3150ee848504816b854a43c92cacdbe', 2660.72);
INSERT INTO `salarykoukuan` VALUES ('c7aee49391394f32b8b564a969f314ca', 788, 200.38, 0, 801.52, 0, 400.76, 0, 30.06, 0, 222.63, '140105196610193731', '孙长有', 'f3150ee848504816b854a43c92cacdbe', 2443.35);
INSERT INTO `salarykoukuan` VALUES ('c7bd6d2ec99443f38e27a5365e7a228c', 463, 145.58, 0, 582.32, 0, 291.16, 0, 21.84, 0, 441.13, '13080219930107166X', '袁烁', 'f3150ee848504816b854a43c92cacdbe', 1945.03);
INSERT INTO `salarykoukuan` VALUES ('c7ce54b7d6214438824f5229b697cc04', 676, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 24.42, '140106198310193081', '韩菊', 'f3150ee848504816b854a43c92cacdbe', 1877.31);
INSERT INTO `salarykoukuan` VALUES ('c7e17484834546328945185a4dbc0b89', 596, 153.1, 0, 612.4, 0, 306.2, 0, 22.97, 0, 89.17, '140423199305230826', '姚倬云', 'f3150ee848504816b854a43c92cacdbe', 1779.84);
INSERT INTO `salarykoukuan` VALUES ('c8279d4b9f4d454f91f6d95422d0ac42', 537, 141.58, 0, 566.32, 0, 283.16, 0, 21.24, 0, 57.59, '14112819930526001X', '白锦科', 'f3150ee848504816b854a43c92cacdbe', 1606.89);
INSERT INTO `salarykoukuan` VALUES ('c8300f051fc941de8e41dab8353770a5', 758, 192.58, 0, 770.32, 0, 385.16, 0, 28.89, 0, 489.8, '140103197910300617', '李毅华', 'f3150ee848504816b854a43c92cacdbe', 2624.75);
INSERT INTO `salarykoukuan` VALUES ('c849049528a541019d446a8ab803ceeb', 603, 153.1, 0, 612.4, 0, 306.2, 0, 22.97, 0, 88.96, '140423199012262824', '王会芝', 'f3150ee848504816b854a43c92cacdbe', 1786.63);
INSERT INTO `salarykoukuan` VALUES ('c87a3dc4cf5645668bbb0359d1e9a931', 767, 198.58, 0, 794.32, 0, 397.16, 0, 29.79, 0, 51.19, '140426197704040026', '张艳永', 'f3150ee848504816b854a43c92cacdbe', 2238.04);
INSERT INTO `salarykoukuan` VALUES ('ca381923757c43cd98092e0b8247d315', 541, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 59.86, '140224199512159343', '康玲瑞', 'f3150ee848504816b854a43c92cacdbe', 1575.26);
INSERT INTO `salarykoukuan` VALUES ('ca476fac79f8492291f18cd524f227be', 558, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 62.35, '14010819930825193X', '张玉杰', 'f3150ee848504816b854a43c92cacdbe', 1602.9);
INSERT INTO `salarykoukuan` VALUES ('ca68fe02448a400facf91ec6349a0e40', 550, 135.24, 0, 540.96, 0, 270.48, 0, 20.29, 0, 57.69, '140108199606194224', '李星儒', 'f3150ee848504816b854a43c92cacdbe', 1574.66);
INSERT INTO `salarykoukuan` VALUES ('ca70c135309a4eac98daa7af93a790f0', 622, 156.62, 0, 626.48, 0, 313.24, 0, 23.49, 0, 5.37, '140106198503101841', '郝艳', 'f3150ee848504816b854a43c92cacdbe', 1747.2);
INSERT INTO `salarykoukuan` VALUES ('cab52cf781e14278bba58196d17e2ebd', 715, 184.06, 0, 736.24, 0, 368.12, 0, 27.61, 0, 451.59, '14010719850328172X', '李金菁', 'f3150ee848504816b854a43c92cacdbe', 2482.62);
INSERT INTO `salarykoukuan` VALUES ('cadf18a1766041e5af0c5dfd8d1c21c7', 567, 142.38, 0, 569.52, 0, 284.76, 0, 21.36, 0, 72.99, '142725198811012422', '杨君薇', 'f3150ee848504816b854a43c92cacdbe', 1658.01);
INSERT INTO `salarykoukuan` VALUES ('cb39b1cd65934bfda31edaf6d3589807', 644, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 56.24, '140121198402072520', '郝宇丽', 'f3150ee848504816b854a43c92cacdbe', 1843.81);
INSERT INTO `salarykoukuan` VALUES ('cb414fe5407d46d09a48ff4ad038d5bf', 863, 227.24, 0, 908.96, 0, 454.48, 0, 34.09, 0, 525.52, '140102196911124810', '陈晖', 'f3150ee848504816b854a43c92cacdbe', 3013.29);
INSERT INTO `salarykoukuan` VALUES ('cb42b629fc824afb9aa6082d3265696f', 650, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 103.55, '142302198211241065', '郭建秀', 'f3150ee848504816b854a43c92cacdbe', 1907.7);
INSERT INTO `salarykoukuan` VALUES ('cbd069627c3345bd833f415da77df635', 703, 181.04, 0, 724.16, 0, 362.08, 0, 27.16, 0, 0, '130503198707201220', '古玉', 'f3150ee848504816b854a43c92cacdbe', 1997.44);
INSERT INTO `salarykoukuan` VALUES ('cc17ae4abf18408bb4dbed2683efdc66', 724, 170.04, 0, 680.16, 0, 340.08, 0, 25.51, 0, 24.73, '140102198202112349', '袁芳芳', 'f3150ee848504816b854a43c92cacdbe', 1964.52);
INSERT INTO `salarykoukuan` VALUES ('cc448cba29fb4f81b65221e17c975765', 721, 185.7, 0, 742.8, 0, 371.4, 0, 27.86, 0, 0, '140108198303244226', '赵欣', 'f3150ee848504816b854a43c92cacdbe', 2048.76);
INSERT INTO `salarykoukuan` VALUES ('cc88da0210364557858f3349faf96f47', 690, 154.34, 0, 617.36, 0, 308.68, 0, 23.15, 0, 417.34, '142625199301181727', '郭婷婷', 'f3150ee848504816b854a43c92cacdbe', 2210.87);
INSERT INTO `salarykoukuan` VALUES ('cca390730b2b411caad3355a9c790797', 912, 238.1, 0, 952.4, 0, 476.2, 0, 35.72, 0, 756.82, '140102196605134842', '刘云芳', 'f3150ee848504816b854a43c92cacdbe', 3371.24);
INSERT INTO `salarykoukuan` VALUES ('cca703662d5f4617a5757c54095a5cf2', 539, 141.58, 0, 566.32, 0, 283.16, 0, 21.24, 0, 88.43, '420116198902094562', '解欢', 'f3150ee848504816b854a43c92cacdbe', 1639.73);
INSERT INTO `salarykoukuan` VALUES ('ccc64d6bafb148c2ae4ea6eb9a27c641', 553, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 58.61, '140107199407040015', '赵子瑞', 'f3150ee848504816b854a43c92cacdbe', 1586.01);
INSERT INTO `salarykoukuan` VALUES ('ccee7409cddf430f90157194d254d410', 739, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 466.75, '140102198207251436', '常靖', 'f3150ee848504816b854a43c92cacdbe', 2545.23);
INSERT INTO `salarykoukuan` VALUES ('cd01c32f3f1a4b10a86def375dcdc861', 602, 152.16, 0, 608.64, 0, 304.32, 0, 22.82, 0, 85.92, '142131197112195514', '马树国', 'f3150ee848504816b854a43c92cacdbe', 1775.86);
INSERT INTO `salarykoukuan` VALUES ('cd04059d955941a98445894440d7efab', 716, 175.28, 0, 701.12, 0, 350.56, 0, 26.29, 0, 86.16, '142603197807163027', '杨雪琴', 'f3150ee848504816b854a43c92cacdbe', 2055.41);
INSERT INTO `salarykoukuan` VALUES ('cd2cdc35e8b947ba997837feb454d987', 866, 222.06, 0, 888.24, 0, 444.12, 0, 33.31, 0, 640.62, '140102197009174842', '张静', 'f3150ee848504816b854a43c92cacdbe', 3094.35);
INSERT INTO `salarykoukuan` VALUES ('cd3d04eaf9d84244a5d64fedc7609dd1', 666, 166.22, 0, 664.88, 0, 332.44, 0, 24.93, 0, 351.26, '14010519861212291X', '肖利龙', 'f3150ee848504816b854a43c92cacdbe', 2205.73);
INSERT INTO `salarykoukuan` VALUES ('cd6cc89b0010428390f3bbe21b5052df', 623, 158.46, 0, 633.84, 0, 316.92, 0, 23.77, 0, 31.77, '140105198706030530', '张帅', 'f3150ee848504816b854a43c92cacdbe', 1787.76);
INSERT INTO `salarykoukuan` VALUES ('cda70be691144324b72179a789ff0485', 621, 154.34, 0, 617.36, 0, 308.68, 0, 23.15, 0, 218, '14042319930207002X', '李林', 'f3150ee848504816b854a43c92cacdbe', 1942.53);
INSERT INTO `salarykoukuan` VALUES ('cde65c8937694c068c44bd8c5012a1b2', 604, 151.7, 0, 606.8, 0, 303.4, 0, 22.76, 0, 65.35, '142322198205254041', '刘建芳', 'f3150ee848504816b854a43c92cacdbe', 1754.01);
INSERT INTO `salarykoukuan` VALUES ('ce1a4676c47a44efbdbf5f7a8d0eee29', 668, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 73.36, '140202198109302549', '刘晶', 'f3150ee848504816b854a43c92cacdbe', 1929.98);
INSERT INTO `salarykoukuan` VALUES ('cef41da4decb44e085e027c28932f0f2', 731, 188.98, 0, 755.92, 0, 377.96, 0, 28.35, 0, 319.65, '140110198209191019', '师永强', 'f3150ee848504816b854a43c92cacdbe', 2401.86);
INSERT INTO `salarykoukuan` VALUES ('cf0bde8308084654a9f34f71256840c9', 616, 153.1, 0, 612.4, 0, 306.2, 0, 22.97, 0, 88.54, '142402199307030625', '雷晓丹', 'f3150ee848504816b854a43c92cacdbe', 1799.21);
INSERT INTO `salarykoukuan` VALUES ('cf2aa4b27c8545d0a4fa83c638dd202b', 467, 149.5, 0, 598, 0, 299, 0, 22.43, 0, 6.36, '142432197303030029', '范玉芳', 'f3150ee848504816b854a43c92cacdbe', 1542.29);
INSERT INTO `salarykoukuan` VALUES ('cf69fe06ee614a34a78856dd2ce4a827', 688, 175.28, 0, 701.12, 0, 350.56, 0, 26.29, 0, 79.79, '140103197907122725', '张静', 'f3150ee848504816b854a43c92cacdbe', 2021.04);
INSERT INTO `salarykoukuan` VALUES ('cf98812c72f1414c9a52959b6ebde4b1', 742, 191.78, 0, 767.12, 0, 383.56, 0, 28.77, 0, 100.37, '142321197603155013', '刘立新', 'f3150ee848504816b854a43c92cacdbe', 2213.6);
INSERT INTO `salarykoukuan` VALUES ('cfae5d5a809443509dfdfad48e50dd17', 627, 155.68, 0, 622.72, 0, 311.36, 0, 23.35, 0, 93.84, '140107199007263324', '韩宝珠', 'f3150ee848504816b854a43c92cacdbe', 1833.95);
INSERT INTO `salarykoukuan` VALUES ('cffcf03331694f1ea26a43b5fe9da6e1', 560, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 3.19, '140431199405303623', '雷丹玉', 'f3150ee848504816b854a43c92cacdbe', 1545.74);
INSERT INTO `salarykoukuan` VALUES ('d06192ed6daf4006a16b4130047b340a', 636, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 103.94, '140107198411120662', '赵丽莎', 'f3150ee848504816b854a43c92cacdbe', 1894.09);
INSERT INTO `salarykoukuan` VALUES ('d0af814125234e62a963386c5368fd32', 613, 154.58, 0, 618.32, 0, 309.16, 0, 23.19, 0, 2.37, '140102197602235116', '王磊', 'f3150ee848504816b854a43c92cacdbe', 1720.62);
INSERT INTO `salarykoukuan` VALUES ('d0ea3a3eb7f3466590c76b4163116332', 590, 148.12, 0, 592.48, 0, 296.24, 0, 22.22, 0, 82.68, '130124198401014529', '李朔', 'f3150ee848504816b854a43c92cacdbe', 1731.74);
INSERT INTO `salarykoukuan` VALUES ('d0fd1063f08a4a5ba119b1c2e3e6da38', 642, 163.34, 0, 653.36, 0, 326.68, 0, 24.5, 0, 58.56, '140110197608072063', '白英娟', 'f3150ee848504816b854a43c92cacdbe', 1868.44);
INSERT INTO `salarykoukuan` VALUES ('d1801a6d9670443692eec4a7c302c089', 540, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 59.03, '142629199207182518', '薛欣', 'f3150ee848504816b854a43c92cacdbe', 1573.43);
INSERT INTO `salarykoukuan` VALUES ('d1bde236df1b4079a1131cdd4a56c4e9', 753, 194.38, 0, 777.52, 0, 388.76, 0, 29.16, 0, 60.63, '140103197808303387', '邵红红', 'f3150ee848504816b854a43c92cacdbe', 2203.45);
INSERT INTO `salarykoukuan` VALUES ('d1db8488a87146b59eb70cc2717f28e0', 724, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 711.98, '140622198003174718', '王振国', 'f3150ee848504816b854a43c92cacdbe', 2775.46);
INSERT INTO `salarykoukuan` VALUES ('d1f39f7038ff4ce49a2045e00620b125', 709, 177.08, 0, 708.32, 0, 354.16, 0, 26.56, 0, 88.98, '14272419770113054X', '李霞', 'f3150ee848504816b854a43c92cacdbe', 2064.1);
INSERT INTO `salarykoukuan` VALUES ('d20f7aa05c004f27a15a518ae96a74aa', 710, 181.88, 0, 727.52, 0, 363.76, 0, 27.28, 0, 132.92, '142427197802283329', '李小芳', 'f3150ee848504816b854a43c92cacdbe', 2143.36);
INSERT INTO `salarykoukuan` VALUES ('d213512863ed49fc84eb87992ca9db81', 740, 190.78, 0, 763.12, 0, 381.56, 0, 28.62, 0, 100.77, '130225197909203723', '李娟娟', 'f3150ee848504816b854a43c92cacdbe', 2204.85);
INSERT INTO `salarykoukuan` VALUES ('d2225f9b462647eda8c32f294e8ec777', 767, 197.82, 0, 791.28, 0, 395.64, 0, 29.67, 0, 528.54, '140105196606033719', '王作印', 'f3150ee848504816b854a43c92cacdbe', 2709.95);
INSERT INTO `salarykoukuan` VALUES ('d2266db2f7b240f29a7682c9da82ac75', 905, 238.72, 0, 954.88, 0, 477.44, 0, 35.81, 0, 737.93, '620102196707155390', '崔宪宏', 'f3150ee848504816b854a43c92cacdbe', 3349.78);
INSERT INTO `salarykoukuan` VALUES ('d263e01046d44ac7b958f86c736ea176', 696, 173.48, 0, 693.92, 0, 346.96, 0, 26.02, 0, 84.17, '140522198009080020', '吴晨辉', 'f3150ee848504816b854a43c92cacdbe', 2020.55);
INSERT INTO `salarykoukuan` VALUES ('d2ae62b4ec904593a5c0185ec2694a17', 654, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 15, '140106198301200614', '南昊', 'f3150ee848504816b854a43c92cacdbe', 1834.16);
INSERT INTO `salarykoukuan` VALUES ('d2c947f0261a40439af633e27983c417', 473, 133.58, 0, 534.32, 0, 267.16, 0, 20.04, 0, 56.42, '142732199509211621', '温瑶', 'f3150ee848504816b854a43c92cacdbe', 1484.52);
INSERT INTO `salarykoukuan` VALUES ('d2f2372c9a384591b3dfd7603e780c8d', 608, 154.34, 0, 617.36, 0, 308.68, 0, 23.15, 0, 92.08, '14021219920930272X', '张抗萍', 'f3150ee848504816b854a43c92cacdbe', 1803.61);
INSERT INTO `salarykoukuan` VALUES ('d30a57bf71674ced9f45bbb80d7895d0', 598, 151.86, 0, 607.44, 0, 303.72, 0, 22.78, 0, 86.92, '14060319941222542X', '苏慧娟', 'f3150ee848504816b854a43c92cacdbe', 1770.72);
INSERT INTO `salarykoukuan` VALUES ('d31f8cb683424edc98756ffbffcb9d7b', 725, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 50.05, '420623198209054053', '田川', 'f3150ee848504816b854a43c92cacdbe', 2114.53);
INSERT INTO `salarykoukuan` VALUES ('d3779704c4264d2780b057d5a11fdae1', 682, 174.48, 0, 697.92, 0, 348.96, 0, 26.17, 0, 78.22, '140102197702160019', '蔡治国', 'f3150ee848504816b854a43c92cacdbe', 2007.75);
INSERT INTO `salarykoukuan` VALUES ('d3782247edb1477eb5913967a44ed50d', 668, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 118.36, '140104198112170847', '胥洋', 'f3150ee848504816b854a43c92cacdbe', 1974.98);
INSERT INTO `salarykoukuan` VALUES ('d399f292ae4d4cebbdbaace1abf5cfa8', 615, 139.8, 0, 559.2, 0, 279.6, 0, 20.97, 0, 91.46, '142332199108243620', '许改云', 'f3150ee848504816b854a43c92cacdbe', 1706.03);
INSERT INTO `salarykoukuan` VALUES ('d3a1d127fec043df9c6bbdeaac0c3a1e', 676, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 69.42, '140121198204123526', '刘二娟', 'f3150ee848504816b854a43c92cacdbe', 1922.31);
INSERT INTO `salarykoukuan` VALUES ('d3a7bab3ea904fe7a4fa97bfbcfaad43', 555, 139.8, 0, 559.2, 0, 279.6, 0, 20.97, 0, 66.85, '140702199210207134', '智东敏', 'f3150ee848504816b854a43c92cacdbe', 1621.42);
INSERT INTO `salarykoukuan` VALUES ('d3b05c0bcac544ec955cfab6ef08df23', 740, 190.78, 0, 763.12, 0, 381.56, 0, 28.62, 0, 203.21, '142429198209172828', '张雅清', 'f3150ee848504816b854a43c92cacdbe', 2307.29);
INSERT INTO `salarykoukuan` VALUES ('d3f79b6df3894652b3d928c1ede37074', 736, 189.98, 0, 759.92, 0, 379.96, 0, 28.5, 0, 480.76, '142430197605180417', '雷明峰', 'f3150ee848504816b854a43c92cacdbe', 2575.12);
INSERT INTO `salarykoukuan` VALUES ('d4164c3e8c924e7ba3ea0b53df43d4aa', 893, 232.38, 0, 929.52, 0, 464.76, 0, 34.86, 0, 552.15, '130622198012072420', '代红艳', 'f3150ee848504816b854a43c92cacdbe', 3106.67);
INSERT INTO `salarykoukuan` VALUES ('d46a785c26ee43b8b70d574cd2a2b141', 669, 170.04, 0, 680.16, 0, 340.08, 0, 25.51, 0, 0, '140104198107255029', '杨婷', 'f3150ee848504816b854a43c92cacdbe', 1884.79);
INSERT INTO `salarykoukuan` VALUES ('d49f1d5987ec44cca19480b73a5ffab8', 690, 154.34, 0, 617.36, 0, 308.68, 0, 23.15, 0, 417.34, '140702199108227147', '寇海荣', 'f3150ee848504816b854a43c92cacdbe', 2210.87);
INSERT INTO `salarykoukuan` VALUES ('d4a24727edc4438fbdeb21e0d781797c', 694, 155.68, 0, 622.72, 0, 311.36, 0, 23.35, 0, 421.88, '130726198706141014', '王兴', 'f3150ee848504816b854a43c92cacdbe', 2228.99);
INSERT INTO `salarykoukuan` VALUES ('d551f5a1e468429ea12321c5647779da', 662, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 24.81, '140102198110235165', '钱晓燕', 'f3150ee848504816b854a43c92cacdbe', 1863.7);
INSERT INTO `salarykoukuan` VALUES ('d5777b134f5e4b9fa58f4a4019625efe', 924, 241.74, 0, 966.96, 0, 483.48, 0, 36.26, 0, 744.96, '142431197104140034', '王欲进', 'f3150ee848504816b854a43c92cacdbe', 3397.4);
INSERT INTO `salarykoukuan` VALUES ('d5966137cd2544d0be8f5d32fdcdce69', 535, 135.24, 0, 540.96, 0, 270.48, 0, 20.29, 0, 57.24, '140602199111079039', '郝则好', 'f3150ee848504816b854a43c92cacdbe', 1559.21);
INSERT INTO `salarykoukuan` VALUES ('d5c21aca15714f788fb1eec23a51debb', 638, 158.46, 0, 633.84, 0, 316.92, 0, 23.77, 0, 8.19, '140106198701210029', '郝婧翔', 'f3150ee848504816b854a43c92cacdbe', 1779.18);
INSERT INTO `salarykoukuan` VALUES ('d61f82359cd34903a55b186472492b1a', 755, 194.98, 0, 779.92, 0, 389.96, 0, 29.25, 0, 85.35, '140103198001190021', '高丽霞', 'f3150ee848504816b854a43c92cacdbe', 2234.46);
INSERT INTO `salarykoukuan` VALUES ('d629146c91594dd4a8893560104fe436', 562, 141.04, 0, 564.16, 0, 282.08, 0, 21.16, 0, 0, '142731199010270327', '刘洋', 'f3150ee848504816b854a43c92cacdbe', 1570.44);
INSERT INTO `salarykoukuan` VALUES ('d636ef34afe64ae486e9d8ba103f2bd3', 546, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 63.58, '140109199412301040', '王晶', 'f3150ee848504816b854a43c92cacdbe', 1592.13);
INSERT INTO `salarykoukuan` VALUES ('d642cc219f324799802a2b9e12a0200a', 738, 178.28, 0, 713.12, 0, 356.56, 0, 26.74, 0, 495.03, '410184197910162561', '武冬莲', 'f3150ee848504816b854a43c92cacdbe', 2507.73);
INSERT INTO `salarykoukuan` VALUES ('d644fcae20b84e878d3237f4cbd648bf', 541, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 59.86, '140107199509124527', '段珮华', 'f3150ee848504816b854a43c92cacdbe', 1575.26);
INSERT INTO `salarykoukuan` VALUES ('d658c60f4e5747bf88f2916b1518193e', 1016, 0, 0, 1073.28, 0, 536.64, 0, 40.25, 0, 745.18, '142222197102090910', '张卫东', 'f3150ee848504816b854a43c92cacdbe', 3411.35);
INSERT INTO `salarykoukuan` VALUES ('d68989b62437405b9b733395723afdcf', 560, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 63.19, '140105199404171869', '张曦', 'f3150ee848504816b854a43c92cacdbe', 1605.74);
INSERT INTO `salarykoukuan` VALUES ('d6a8d67bade3425691735f056cf4e1f4', 681, 173.48, 0, 693.92, 0, 346.96, 0, 26.02, 0, 77.39, '142202197811070968', '苑丽英', 'f3150ee848504816b854a43c92cacdbe', 1998.77);
INSERT INTO `salarykoukuan` VALUES ('d71745ecc2d24c7faea46264360ae8cd', 614, 154.98, 0, 619.92, 0, 309.96, 0, 23.25, 0, 2.97, '140102198007151414', '赵军', 'f3150ee848504816b854a43c92cacdbe', 1725.08);
INSERT INTO `salarykoukuan` VALUES ('d75b5ea86eb34af08ae775fc3fe1dd34', 986, 258.96, 0, 1035.84, 0, 517.92, 0, 38.84, 0, 841.44, '140104197001062216', '贾文强', 'f3150ee848504816b854a43c92cacdbe', 3679);
INSERT INTO `salarykoukuan` VALUES ('d7b9c1f3c8e94f9cb7a7547acbbdcca1', 565, 142.28, 0, 569.12, 0, 284.56, 0, 21.34, 0, 12.02, '140107198911043317', '张斌', 'f3150ee848504816b854a43c92cacdbe', 1594.32);
INSERT INTO `salarykoukuan` VALUES ('d7edd6300df045e880ee4e5485486470', 725, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 0, '140103198205130653', '石峰', 'f3150ee848504816b854a43c92cacdbe', 2064.48);
INSERT INTO `salarykoukuan` VALUES ('d80611a96fb347b3a6cba60352b4fb46', 603, 153.1, 0, 612.4, 0, 306.2, 0, 22.97, 0, 88.96, '140109199308033023', '周姝航', 'f3150ee848504816b854a43c92cacdbe', 1786.63);
INSERT INTO `salarykoukuan` VALUES ('d82dfb751ad04a55adda42d29a5f2712', 457, 125.18, 0, 500.72, 0, 250.36, 0, 18.78, 0, 49.47, '652723200006070723', '欧冬其米格', 'f3150ee848504816b854a43c92cacdbe', 1401.51);
INSERT INTO `salarykoukuan` VALUES ('d83c68ed073d4d2a9a2f645dca4508a7', 755, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 168.06, '140102198111271440', '尹一帆', 'f3150ee848504816b854a43c92cacdbe', 2262.54);
INSERT INTO `salarykoukuan` VALUES ('d8a461f10c5c4ec99bd3f1b2b6d4116b', 640, 161.44, 0, 645.76, 0, 322.88, 0, 24.22, 0, 13.43, '14010719830608222X', '王胜利', 'f3150ee848504816b854a43c92cacdbe', 1807.73);
INSERT INTO `salarykoukuan` VALUES ('d8ad62fc00e0403d85ded3d690b65218', 654, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 67, '210782198204173420', '李秋玲', 'f3150ee848504816b854a43c92cacdbe', 1909.62);
INSERT INTO `salarykoukuan` VALUES ('d8e85e76a189438b8a2753a212c2974a', 689, 171.68, 0, 686.72, 0, 343.36, 0, 25.75, 0, 208.53, '140102198201143426', '陈婷', 'f3150ee848504816b854a43c92cacdbe', 2125.04);
INSERT INTO `salarykoukuan` VALUES ('d904deb547ed4305b99ac6e58cf6c362', 881, 231.72, 0, 926.88, 0, 463.44, 0, 34.76, 0, 492.05, '140102196706176523', '贺红梅', 'f3150ee848504816b854a43c92cacdbe', 3029.85);
INSERT INTO `salarykoukuan` VALUES ('d92700bc5a9547adbf4778d8a62c9e18', 550, 135.24, 0, 540.96, 0, 270.48, 0, 20.29, 0, 57.69, '140105199408070029', '郭凡琦', 'f3150ee848504816b854a43c92cacdbe', 1574.66);
INSERT INTO `salarykoukuan` VALUES ('d94360bd9fa140699d5a124bcefe3c59', 767, 190.78, 0, 763.12, 0, 381.56, 0, 28.62, 0, 0, '140522198005140049', '孙雅妮', 'f3150ee848504816b854a43c92cacdbe', 2131.08);
INSERT INTO `salarykoukuan` VALUES ('d9508d7fda0b4d59b0d70f9ef7e8d67a', 725, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 468.05, '140602198110041739', '张晓明', 'f3150ee848504816b854a43c92cacdbe', 2532.53);
INSERT INTO `salarykoukuan` VALUES ('d9c83c6b3f7741d7ae7239683cd19081', 675, 171.68, 0, 686.72, 0, 343.36, 0, 25.75, 0, 74.96, '140311198004040628', '郑文芳', 'f3150ee848504816b854a43c92cacdbe', 1977.47);
INSERT INTO `salarykoukuan` VALUES ('d9c8c5b32bed4dde83947a0b01d22030', 636, 158.46, 0, 633.84, 0, 316.92, 0, 23.77, 0, 97.35, '61012319820410331X', '韩凯', 'f3150ee848504816b854a43c92cacdbe', 1866.34);
INSERT INTO `salarykoukuan` VALUES ('da3df8c047fe4050995f4b4d9d341afd', 757, 195.56, 0, 782.24, 0, 391.12, 0, 29.33, 0, 512.47, '140103197309204261', '吴慧玲', 'f3150ee848504816b854a43c92cacdbe', 2667.72);
INSERT INTO `salarykoukuan` VALUES ('dacd7df38d444717986968fb9f95f3d1', 713, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 44.81, '140106198610272566', '闫旭', 'f3150ee848504816b854a43c92cacdbe', 1901.38);
INSERT INTO `salarykoukuan` VALUES ('dacfaebf41494ff9ad524f16ed295e43', 457, 125.18, 0, 500.72, 0, 250.36, 0, 18.78, 0, 49.47, '654028199911040807', '马晓琴', 'f3150ee848504816b854a43c92cacdbe', 1401.51);
INSERT INTO `salarykoukuan` VALUES ('db01ec941b4f4a4381f0d23fca3aa7e0', 654, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 22, '140108198606024220', '范宏宇', 'f3150ee848504816b854a43c92cacdbe', 1864.62);
INSERT INTO `salarykoukuan` VALUES ('db045b39c60c491f9d1cab43fb138174', 727, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 469.65, '140106198203171928', '张枫', 'f3150ee848504816b854a43c92cacdbe', 2536.13);
INSERT INTO `salarykoukuan` VALUES ('db5f5262a2f740d6915f3ab425657580', 721, 185.7, 0, 742.8, 0, 371.4, 0, 27.86, 0, 47.37, '140102198208316529', '赵晶', 'f3150ee848504816b854a43c92cacdbe', 2096.13);
INSERT INTO `salarykoukuan` VALUES ('db66bd294fc942f1947103c9cf8f37db', 662, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 24.81, '140102198212132327', '邓懿', 'f3150ee848504816b854a43c92cacdbe', 1863.7);
INSERT INTO `salarykoukuan` VALUES ('dc2f14ff14664c6ca02b3ea323811aa0', 633, 157.02, 0, 628.08, 0, 314.04, 0, 23.55, 0, 75.04, '142326198410042123', '常星花', 'f3150ee848504816b854a43c92cacdbe', 1830.73);
INSERT INTO `salarykoukuan` VALUES ('dc3e2494c7e34317bfcbec58e85ec817', 487, 138.56, 0, 554.24, 0, 277.12, 0, 20.78, 0, 0, '141181199405270268', '王雁', 'f3150ee848504816b854a43c92cacdbe', 1477.7);
INSERT INTO `salarykoukuan` VALUES ('dc5b265b65314dccbcb4dad151ad61d5', 856, 217.36, 0, 869.44, 0, 434.72, 0, 32.6, 0, 671.17, '140102196604132335', '薛斌', 'f3150ee848504816b854a43c92cacdbe', 3081.29);
INSERT INTO `salarykoukuan` VALUES ('dc667de0009f45d6a4782a77062d891e', 680, 173.28, 0, 693.12, 0, 346.56, 0, 25.99, 0, 319.27, '14010319780701062X', '于光', 'f3150ee848504816b854a43c92cacdbe', 2238.22);
INSERT INTO `salarykoukuan` VALUES ('dcc7bb3d333c4d9e8b69b73bd56da038', 670, 166.76, 0, 667.04, 0, 333.52, 0, 25.01, 0, 111.32, '142729198212241827', '温东辉', 'f3150ee848504816b854a43c92cacdbe', 1973.65);
INSERT INTO `salarykoukuan` VALUES ('dce9d49b35ed4f809e44399b98bbc7b1', 764, 198.16, 0, 792.64, 0, 396.32, 0, 29.72, 0, 520.12, '142401197602057219', '郑红勇', 'f3150ee848504816b854a43c92cacdbe', 2700.96);
INSERT INTO `salarykoukuan` VALUES ('dd081ba37d234c0faf8f0b02b199359e', 928, 243.06, 0, 972.24, 0, 486.12, 0, 36.46, 0, 595.31, '140103196510302731', '王建伟', 'f3150ee848504816b854a43c92cacdbe', 3261.19);
INSERT INTO `salarykoukuan` VALUES ('dd1d193323d8465b942ff9f670d67df1', 787, 200.14, 0, 800.56, 0, 400.28, 0, 30.02, 0, 553.2, '142327197402043785', '薛生娥', 'f3150ee848504816b854a43c92cacdbe', 2771.2);
INSERT INTO `salarykoukuan` VALUES ('dd4de771c03140f38cceb3a69a57256c', 699, 178.88, 0, 715.52, 0, 357.76, 0, 26.83, 0, 348.7, '142228197807110019', '张献军', 'f3150ee848504816b854a43c92cacdbe', 2326.69);
INSERT INTO `salarykoukuan` VALUES ('dd7c09a49eca4b46a356d72a28e47643', 596, 151.86, 0, 607.44, 0, 303.72, 0, 22.78, 0, 86.08, '140202199202295018', '康圆圆', 'f3150ee848504816b854a43c92cacdbe', 1767.88);
INSERT INTO `salarykoukuan` VALUES ('de188d7644a24e55b77aff0d1d0a9992', 673, 171.68, 0, 686.72, 0, 343.36, 0, 25.75, 0, 14.11, '142601197906084014', '赵振国', 'f3150ee848504816b854a43c92cacdbe', 1914.62);
INSERT INTO `salarykoukuan` VALUES ('de4b7a7895cf423a87c167ee9a9cf844', 649, 160.38, 0, 641.52, 0, 320.76, 0, 24.06, 0, 10.69, '142401197708202728', '张芸', 'f3150ee848504816b854a43c92cacdbe', 1806.41);
INSERT INTO `salarykoukuan` VALUES ('de8097a4a2a6422db7e0b8b3bbcbde2c', 663, 168.4, 0, 673.6, 0, 336.8, 0, 25.26, 0, 56.99, '430922198305160042', '昌秦湘', 'f3150ee848504816b854a43c92cacdbe', 1924.05);
INSERT INTO `salarykoukuan` VALUES ('df328ae16e5a46c0b781ec41d9751ff2', 677, 154.34, 0, 617.36, 0, 308.68, 0, 23.15, 0, 80.62, '140226199206103045', '王军丽', 'f3150ee848504816b854a43c92cacdbe', 1861.15);
INSERT INTO `salarykoukuan` VALUES ('df7b0e3b47794a859778bf01e145ae5d', 672, 167.76, 0, 671.04, 0, 335.52, 0, 25.16, 0, 52.12, '140121198409205533', '吴晓杰', 'f3150ee848504816b854a43c92cacdbe', 1923.6);
INSERT INTO `salarykoukuan` VALUES ('df81af4760b048edb0cd75bee0197f26', 582, 151.86, 0, 607.44, 0, 303.72, 0, 22.78, 0, 288.22, '142623199209066416', '孙萌', 'f3150ee848504816b854a43c92cacdbe', 1956.02);
INSERT INTO `salarykoukuan` VALUES ('dfc18e5318df45ecbba4194e9e531454', 669, 170.04, 0, 680.16, 0, 340.08, 0, 25.51, 0, 72.52, '14011019811027106X', '黄丹丹', 'f3150ee848504816b854a43c92cacdbe', 1957.31);
INSERT INTO `salarykoukuan` VALUES ('dfc24fe7c8f8446a80dbe58a7b3cb4b7', 624, 145.16, 0, 580.64, 0, 290.32, 0, 21.77, 0, 56.49, '140108198208252527', '张瑶', 'f3150ee848504816b854a43c92cacdbe', 1718.38);
INSERT INTO `salarykoukuan` VALUES ('e0b0d1157c4c44658cc14d961199c825', 635, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 0, '142228198410130016', '樊星男', 'f3150ee848504816b854a43c92cacdbe', 1789.15);
INSERT INTO `salarykoukuan` VALUES ('e0d5e89decb54f7d9a093f5055a7cec4', 774, 200.38, 0, 801.52, 0, 400.76, 0, 30.06, 0, 337.39, '140102196807055157', '郭守敬', 'f3150ee848504816b854a43c92cacdbe', 2544.11);
INSERT INTO `salarykoukuan` VALUES ('e0f91235a1d44bdfa322f14054bea8d3', 655, 149.66, 0, 598.64, 0, 299.32, 0, 22.45, 0, 63.72, '14010219790304652X', '王婷', 'f3150ee848504816b854a43c92cacdbe', 1788.79);
INSERT INTO `salarykoukuan` VALUES ('e11c8066e8464dab969a90d55196735a', 582, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 104.33, '230404198509100239', '朱秀栋', 'f3150ee848504816b854a43c92cacdbe', 1851.49);
INSERT INTO `salarykoukuan` VALUES ('e133bbc6b87f4df9bc1c7d4c178e4255', 537, 135.24, 0, 540.96, 0, 270.48, 0, 20.29, 0, 58.12, '360681199608012629', '汤秀佳', 'f3150ee848504816b854a43c92cacdbe', 1562.09);
INSERT INTO `salarykoukuan` VALUES ('e19944a0346c4e31bec0e370ee592a4f', 747, 188.98, 0, 755.92, 0, 377.96, 0, 28.35, 0, 476.57, '142725198108025627', '贾哲', 'f3150ee848504816b854a43c92cacdbe', 2574.78);
INSERT INTO `salarykoukuan` VALUES ('e21dc0bef50846f892e53092cf2708ed', 755, 194.98, 0, 779.92, 0, 389.96, 0, 29.25, 0, 1.35, '14010219810904402X', '董锦', 'f3150ee848504816b854a43c92cacdbe', 2150.46);
INSERT INTO `salarykoukuan` VALUES ('e232650e5f1649d8976ff25b17f5ad22', 596, 149.66, 0, 598.64, 0, 299.32, 0, 22.45, 0, 84.99, '140106198405100028', '徐敏', 'f3150ee848504816b854a43c92cacdbe', 1751.06);
INSERT INTO `salarykoukuan` VALUES ('e310229bf9db45bc8bcf7ecf0a4a1e8c', 628, 146.64, 0, 586.56, 0, 293.28, 0, 22, 0, 103.7, '142228198309198518', '杨春龙', 'f3150ee848504816b854a43c92cacdbe', 1780.18);
INSERT INTO `salarykoukuan` VALUES ('e3191e35dbc64ffd80186c0ae318639a', 695, 177.08, 0, 708.32, 0, 354.16, 0, 26.56, 0, 127.22, '140121197804180028', '刘晓红', 'f3150ee848504816b854a43c92cacdbe', 2088.34);
INSERT INTO `salarykoukuan` VALUES ('e3229a4b6c714d3695a22d34df5eecf8', 665, 169.68, 0, 678.72, 0, 339.36, 0, 25.45, 0, 11.03, '142429197905012831', '岳林海', 'f3150ee848504816b854a43c92cacdbe', 1889.24);
INSERT INTO `salarykoukuan` VALUES ('e386c33f2d404efb906817c89b32c149', 708, 177.08, 0, 708.32, 0, 354.16, 0, 26.56, 0, 126.81, '142622197807160028', '裴嵘军', 'f3150ee848504816b854a43c92cacdbe', 2100.93);
INSERT INTO `salarykoukuan` VALUES ('e3b66a5e10304b5dbd2eed9702974e9b', 816, 212.66, 0, 850.64, 0, 425.32, 0, 31.9, 0, 88.31, '140102196902245151', '武岿', 'f3150ee848504816b854a43c92cacdbe', 2424.83);
INSERT INTO `salarykoukuan` VALUES ('e3e9f8d79b2e4baab78f2675a7c632a8', 781, 202.36, 0, 809.44, 0, 404.72, 0, 30.35, 0, 150.45, '142703197212200023', '温红霞', 'f3150ee848504816b854a43c92cacdbe', 2378.32);
INSERT INTO `salarykoukuan` VALUES ('e413e5c167d54cb686725d73feca6be1', 914, 226.32, 0, 905.28, 0, 452.64, 0, 33.95, 0, 720.13, '142601196703151921', '张代会', 'f3150ee848504816b854a43c92cacdbe', 3252.32);
INSERT INTO `salarykoukuan` VALUES ('e42eaafa2a454b98861f236e3c4468a2', 610, 153.34, 0, 613.36, 0, 306.68, 0, 23, 0, 46.37, '140224198012100084', '杜慧芳', 'f3150ee848504816b854a43c92cacdbe', 1752.75);
INSERT INTO `salarykoukuan` VALUES ('e438356153fd442ab080bb31e55beece', 809, 206.28, 0, 825.12, 0, 412.56, 0, 30.94, 0, 85.53, '140104197311241762', '陈晋萍', 'f3150ee848504816b854a43c92cacdbe', 2369.43);
INSERT INTO `salarykoukuan` VALUES ('e515e570de42451d96f0e1c37150d430', 541, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 59.87, '140411199512115243', '平思亮', 'f3150ee848504816b854a43c92cacdbe', 1575.27);
INSERT INTO `salarykoukuan` VALUES ('e5198a4a1a7b46a88abe246e32cfece2', 591, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 87.73, '142623199406064049', '崔国华', 'f3150ee848504816b854a43c92cacdbe', 1661.28);
INSERT INTO `salarykoukuan` VALUES ('e548619ad7444321ad5f89bda28f617e', 636, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 103.94, '142431198610120081', '赵娟', 'f3150ee848504816b854a43c92cacdbe', 1894.09);
INSERT INTO `salarykoukuan` VALUES ('e6269c2449194cd792e9a42539cc7416', 869, 226.48, 0, 905.92, 0, 452.96, 0, 33.97, 0, 512.16, '140102197108110641', '康丽军', 'f3150ee848504816b854a43c92cacdbe', 3000.49);
INSERT INTO `salarykoukuan` VALUES ('e68215900af84be4b06244f1a1ceec4a', 541, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 59.86, '140524199602133020', '宋月宇', 'f3150ee848504816b854a43c92cacdbe', 1575.26);
INSERT INTO `salarykoukuan` VALUES ('e691f8f701684235b0d78d82989c580d', 582, 146.64, 0, 586.56, 0, 293.28, 0, 22, 0, 79.54, '140106198406063038', '李鹏飞', 'f3150ee848504816b854a43c92cacdbe', 1710.02);
INSERT INTO `salarykoukuan` VALUES ('e6ffe59781144834aee19ea378e97413', 731, 187.64, 0, 750.56, 0, 375.28, 0, 28.15, 0, 141.76, '140202197505124022', '孙红', 'f3150ee848504816b854a43c92cacdbe', 2214.39);
INSERT INTO `salarykoukuan` VALUES ('e772fab95f3b4747822754b83977c7a4', 731, 188.98, 0, 755.92, 0, 377.96, 0, 28.35, 0, 102.05, '142601198007241914', '支鹏伟', 'f3150ee848504816b854a43c92cacdbe', 2184.26);
INSERT INTO `salarykoukuan` VALUES ('e7a0fb9f2b2a42e58c69ba0b36f12a91', 785, 186.8, 0, 747.2, 0, 373.6, 0, 28.02, 0, 566.94, '140431197303233629', '段鹏莉', 'f3150ee848504816b854a43c92cacdbe', 2687.56);
INSERT INTO `salarykoukuan` VALUES ('e7c5f9a201774bc3b73764582c0d2f55', 747, 188.98, 0, 755.92, 0, 377.96, 0, 28.35, 0, 326.57, '140112198211211421', '任婷婷', 'f3150ee848504816b854a43c92cacdbe', 2424.78);
INSERT INTO `salarykoukuan` VALUES ('e7e5cc076045404b9bf6f788af47cb5b', 754, 178.88, 0, 715.52, 0, 357.76, 0, 26.83, 0, 374.2, '14010219760413233X', '成伟', 'f3150ee848504816b854a43c92cacdbe', 2407.19);
INSERT INTO `salarykoukuan` VALUES ('e821a3460620452d908d03fb3ae271c2', 695, 177.08, 0, 708.32, 0, 354.16, 0, 26.56, 0, 37.23, '140202197709080527', '张娜', 'f3150ee848504816b854a43c92cacdbe', 1998.35);
INSERT INTO `salarykoukuan` VALUES ('e86af801566e48c78c7204ff9931443f', 596, 149.66, 0, 598.64, 0, 299.32, 0, 22.45, 0, 84.99, '14010719820818066X', '苗青', 'f3150ee848504816b854a43c92cacdbe', 1751.06);
INSERT INTO `salarykoukuan` VALUES ('e8c5c9bc7c77468d8ee4cce04e312e30', 687, 171.48, 0, 685.92, 0, 342.96, 0, 25.72, 0, 13.92, '140103197801095722', '赵红梅', 'f3150ee848504816b854a43c92cacdbe', 1927);
INSERT INTO `salarykoukuan` VALUES ('e8d2b8c7305945a0aeec12ef7b7dad6e', 678, 173.28, 0, 693.12, 0, 346.56, 0, 25.99, 0, 75.87, '140104197402281735', '李晓峰', 'f3150ee848504816b854a43c92cacdbe', 1992.82);
INSERT INTO `salarykoukuan` VALUES ('e8d3490841744b398e6ccae402ccf602', 540, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 59.02, '140105199511050552', '刘琪', 'f3150ee848504816b854a43c92cacdbe', 1573.42);
INSERT INTO `salarykoukuan` VALUES ('e9026870cdf6480db886ea7f6cf25983', 654, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 22, '140107198302120663', '沈卓', 'f3150ee848504816b854a43c92cacdbe', 1864.62);
INSERT INTO `salarykoukuan` VALUES ('e956d309b8bc411f905d43f325897054', 674, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 113.58, '140202198105264514', '申森', 'f3150ee848504816b854a43c92cacdbe', 1964.47);
INSERT INTO `salarykoukuan` VALUES ('e9f6ba1a7a714de8b20489d86634d41b', 808, 210.48, 0, 841.92, 0, 420.96, 0, 31.57, 0, 429.1, '14260119711129283X', '王建平', 'f3150ee848504816b854a43c92cacdbe', 2742.03);
INSERT INTO `salarykoukuan` VALUES ('eab08a96b6cf433b83be1c3ca522f667', 706, 180.86, 0, 723.44, 0, 361.72, 0, 27.13, 0, 110.12, '140121197405015519', '吴瑞勇', 'f3150ee848504816b854a43c92cacdbe', 2109.27);
INSERT INTO `salarykoukuan` VALUES ('ead09a2cab4a410fbfa083c58638e0b2', 795, 206.28, 0, 825.12, 0, 412.56, 0, 30.94, 0, 563.51, '142622197411162027', '王宏', 'f3150ee848504816b854a43c92cacdbe', 2833.41);
INSERT INTO `salarykoukuan` VALUES ('eb63de8598a24e60b3104b217fc992b3', 596, 149.66, 0, 598.64, 0, 299.32, 0, 22.45, 0, 84.99, '140107198210201220', '杨雅琴', 'f3150ee848504816b854a43c92cacdbe', 1751.06);
INSERT INTO `salarykoukuan` VALUES ('eb640569221541738e1d578100fa6379', 711, 179.56, 0, 718.24, 0, 359.12, 0, 26.93, 0, 423.61, '412723198711212948', '程凤伟', 'f3150ee848504816b854a43c92cacdbe', 2418.46);
INSERT INTO `salarykoukuan` VALUES ('eb6e28ea259d48579eff8b2f758bc629', 539, 141.58, 0, 566.32, 0, 283.16, 0, 21.24, 0, 43.43, '142226199202252221', '姚江燕', 'f3150ee848504816b854a43c92cacdbe', 1594.73);
INSERT INTO `salarykoukuan` VALUES ('eb8f9ce429864d4b871191b571829543', 800, 208.04, 0, 832.16, 0, 416.08, 0, 31.21, 0, 575.9, '150104196508251355', '赵利民', 'f3150ee848504816b854a43c92cacdbe', 2863.39);
INSERT INTO `salarykoukuan` VALUES ('eb91607ceed149949af4f82afcea5393', 755, 195.56, 0, 782.24, 0, 391.12, 0, 29.33, 0, 509.67, '140102197710246517', '郑志国', 'f3150ee848504816b854a43c92cacdbe', 2662.92);
INSERT INTO `salarykoukuan` VALUES ('eb978b4a6cc441f099ecd70872566c5d', 623, 158.46, 0, 633.84, 0, 316.92, 0, 23.77, 0, 97.77, '140211198204263310', '乔永胜', 'f3150ee848504816b854a43c92cacdbe', 1853.76);
INSERT INTO `salarykoukuan` VALUES ('ec13f2cd212b4f4d9c557c5d38acbe16', 473, 133.58, 0, 534.32, 0, 267.16, 0, 20.04, 0, 56.42, '142429199809122829', '张晓薇', 'f3150ee848504816b854a43c92cacdbe', 1484.52);
INSERT INTO `salarykoukuan` VALUES ('ec2204f2e1ce4ed699298ffa2dd0ef93', 968, 0, 0, 974.88, 0, 487.44, 0, 36.56, 0, 840.01, '142226197204137420', '张先平', 'f3150ee848504816b854a43c92cacdbe', 3306.89);
INSERT INTO `salarykoukuan` VALUES ('ec60b9e93d0749ae90f4216b2ab61139', 883, 230.96, 0, 923.84, 0, 461.92, 0, 34.64, 0, 719.65, '140103196802053335', '殷国刚', 'f3150ee848504816b854a43c92cacdbe', 3254.01);
INSERT INTO `salarykoukuan` VALUES ('ec6b98b8e4cb41689b28cf516e277ac4', 572, 144, 0, 576, 0, 288, 0, 21.6, 0, 70.24, '140123198102170025', '尤帼云', 'f3150ee848504816b854a43c92cacdbe', 1671.84);
INSERT INTO `salarykoukuan` VALUES ('ec9844fc5f2b4a13bc956a4854d55129', 645, 159.88, 0, 639.52, 0, 319.76, 0, 23.98, 0, 99.08, '140102197609096534', '曲江', 'f3150ee848504816b854a43c92cacdbe', 1887.22);
INSERT INTO `salarykoukuan` VALUES ('eccefbda283242c182488d69de3d4892', 632, 160.86, 0, 643.44, 0, 321.72, 0, 24.13, 0, 100.86, '140104196905310011', '王强', 'f3150ee848504816b854a43c92cacdbe', 1883.01);
INSERT INTO `salarykoukuan` VALUES ('ed3925bded564b019aada99fe6b4ef97', 567, 142.38, 0, 569.52, 0, 284.76, 0, 21.36, 0, 72.99, '140109199003144224', '张阳', 'f3150ee848504816b854a43c92cacdbe', 1658.01);
INSERT INTO `salarykoukuan` VALUES ('edbe932c3ce04f5a8a3afb89b05c0bcf', 598, 151.86, 0, 607.44, 0, 303.72, 0, 22.78, 0, 86.92, '140624199309200066', '苗丽娟', 'f3150ee848504816b854a43c92cacdbe', 1770.72);
INSERT INTO `salarykoukuan` VALUES ('ee6c238f469e4b878fc8649e98c18f7d', 802, 208.3, 0, 833.2, 0, 416.6, 0, 31.25, 0, 572.76, '14010219730218488X', '侯志红', 'f3150ee848504816b854a43c92cacdbe', 2864.11);
INSERT INTO `salarykoukuan` VALUES ('eeac70f1f93d4d72b9afd40bdfdd8654', 919, 239.76, 0, 959.04, 0, 479.52, 0, 35.96, 0, 739.17, '140102197610225161', '薛文艳', 'f3150ee848504816b854a43c92cacdbe', 3372.45);
INSERT INTO `salarykoukuan` VALUES ('ef5536d9fd1a4e9398d4e3a30145dee7', 818, 212.66, 0, 850.64, 0, 425.32, 0, 31.9, 0, 447.55, '140102197101176541', '牛月秀', 'f3150ee848504816b854a43c92cacdbe', 2786.07);
INSERT INTO `salarykoukuan` VALUES ('ef8e24906c7248498d90d2bf966a57ae', 719, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 456.98, '142625198606053326', '王霞', 'f3150ee848504816b854a43c92cacdbe', 2330.13);
INSERT INTO `salarykoukuan` VALUES ('f099e6c31d204f089b0aa2788f969865', 721, 182.52, 0, 730.08, 0, 365.04, 0, 27.38, 0, 41.61, '140107198503180013', '杨鹏', 'f3150ee848504816b854a43c92cacdbe', 2067.63);
INSERT INTO `salarykoukuan` VALUES ('f0b00337bd5c4cd897e656863aedd63f', 588, 148.12, 0, 592.48, 0, 296.24, 0, 22.22, 0, 81.84, '140122198409090138', '赵晖', 'f3150ee848504816b854a43c92cacdbe', 1728.9);
INSERT INTO `salarykoukuan` VALUES ('f0c42ef83859484882b9d8f45f8a891c', 603, 153.1, 0, 612.4, 0, 306.2, 0, 22.97, 0, 88.96, '142301199007200264', '张钰', 'f3150ee848504816b854a43c92cacdbe', 1786.63);
INSERT INTO `salarykoukuan` VALUES ('f0d5261215944b00aa4a05448cbd75a5', 675, 171.68, 0, 686.72, 0, 343.36, 0, 25.75, 0, 0, '140105198102120041', '张薇', 'f3150ee848504816b854a43c92cacdbe', 1902.51);
INSERT INTO `salarykoukuan` VALUES ('f0d95e0bfc0b47a09966c9b41d101caa', 674, 167.88, 0, 671.52, 0, 335.76, 0, 25.18, 0, 292.55, '142323197909190244', '王丽桃', 'f3150ee848504816b854a43c92cacdbe', 2166.89);
INSERT INTO `salarykoukuan` VALUES ('f0f97a9cfe3d4f859502da21b91cbc03', 753, 194.38, 0, 777.52, 0, 388.76, 0, 29.16, 0, 502.12, '140431197704184821', '郭慧', 'f3150ee848504816b854a43c92cacdbe', 2644.94);
INSERT INTO `salarykoukuan` VALUES ('f0fa1e141da14916a755a8f375335381', 753, 194.38, 0, 777.52, 0, 388.76, 0, 29.16, 0, 502.12, '14010219800406514X', '梁彦', 'f3150ee848504816b854a43c92cacdbe', 2644.94);
INSERT INTO `salarykoukuan` VALUES ('f12367fb12064756a158e70e857a07d6', 722, 185.66, 0, 742.64, 0, 371.32, 0, 27.85, 0, 93.35, '149001197611281217', '张为锋', 'f3150ee848504816b854a43c92cacdbe', 2142.82);
INSERT INTO `salarykoukuan` VALUES ('f18cf4877ee94561ae92ba9469432fe0', 653, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 144.22, '140122198312100010', '白月星', 'f3150ee848504816b854a43c92cacdbe', 1985.84);
INSERT INTO `salarykoukuan` VALUES ('f1aa680bd42344049791840b75f47d55', 848, 221.56, 0, 886.24, 0, 443.12, 0, 33.23, 0, 644.21, '140102196701162317', '武旭锦', 'f3150ee848504816b854a43c92cacdbe', 3076.36);
INSERT INTO `salarykoukuan` VALUES ('f1db86daeaaf46fa96a5ef4ffe445cd7', 912, 238.1, 0, 952.4, 0, 476.2, 0, 35.72, 0, 625.56, '142231196802250104', '任红兵', 'f3150ee848504816b854a43c92cacdbe', 3239.98);
INSERT INTO `salarykoukuan` VALUES ('f20adaf0e8cd42ccbbb03cc3b0c4c0ee', 850, 212.66, 0, 850.64, 0, 425.32, 0, 31.9, 0, 648.85, '142701197005151262', '靳丽华', 'f3150ee848504816b854a43c92cacdbe', 3019.37);
INSERT INTO `salarykoukuan` VALUES ('f24de901b6714163a3c3a63a9062d5ef', 517, 138.78, 0, 555.12, 0, 277.56, 0, 20.82, 0, 0, '140108199011202811', '赵博', 'f3150ee848504816b854a43c92cacdbe', 1509.28);
INSERT INTO `salarykoukuan` VALUES ('f2596e39f40d458aa198d337765f1d7e', 727, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 44.89, '140107198208180627', '柴晓星', 'f3150ee848504816b854a43c92cacdbe', 2111.37);
INSERT INTO `salarykoukuan` VALUES ('f26afe78831548808344694cd1f7d535', 669, 169.7, 0, 678.8, 0, 339.4, 0, 25.46, 0, 116.12, '140103197112230087', '常玉萍', 'f3150ee848504816b854a43c92cacdbe', 1998.48);
INSERT INTO `salarykoukuan` VALUES ('f2a0267843b74e9b8a99c4ea49cbf232', 668, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 73.36, '142723198107200021', '王娟', 'f3150ee848504816b854a43c92cacdbe', 1929.98);
INSERT INTO `salarykoukuan` VALUES ('f2a7310b1b2147539790a2472060eaf0', 644, 163.08, 0, 652.32, 0, 326.16, 0, 24.46, 0, 30.03, '142702198106140010', '冯冲', 'f3150ee848504816b854a43c92cacdbe', 1840.05);
INSERT INTO `salarykoukuan` VALUES ('f2b158f73bc64cd991f5ac0662a30d4b', 688, 175.28, 0, 701.12, 0, 350.56, 0, 26.29, 0, 79.8, '140102197909165124', '李新艺', 'f3150ee848504816b854a43c92cacdbe', 2021.05);
INSERT INTO `salarykoukuan` VALUES ('f3866bee7d5b44628beb1757d31db461', 540, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 59.03, '140303199402081614', '张梁', 'f3150ee848504816b854a43c92cacdbe', 1573.43);
INSERT INTO `salarykoukuan` VALUES ('f401bd3fead045d8add07562281beab2', 700, 175.08, 0, 700.32, 0, 350.16, 0, 26.26, 0, 0, '140102197712140628', '杨海丽', 'f3150ee848504816b854a43c92cacdbe', 1951.82);
INSERT INTO `salarykoukuan` VALUES ('f4cda3948ffb4656a5e3ea4d84b74ba7', 766, 198.16, 0, 792.64, 0, 396.32, 0, 29.72, 0, 672.92, '140502197602013080', '张俊霞', 'f3150ee848504816b854a43c92cacdbe', 2855.76);
INSERT INTO `salarykoukuan` VALUES ('f4e7bdbbf9be42bb83936deddb6e6876', 606, 154.34, 0, 617.36, 0, 308.68, 0, 23.15, 0, 304.04, '140105199006190036', '于诚', 'f3150ee848504816b854a43c92cacdbe', 2013.57);
INSERT INTO `salarykoukuan` VALUES ('f51f9e668de742ecaae4c9d3c6142e21', 631, 159.94, 0, 639.76, 0, 319.88, 0, 23.99, 0, 11.66, '140202198705202528', '冯琨', 'f3150ee848504816b854a43c92cacdbe', 1786.23);
INSERT INTO `salarykoukuan` VALUES ('f520115c426145548e2c3118f78fbdbe', 947, 0, 0, 974.88, 0, 487.44, 0, 36.56, 0, 634.21, '140123197510260025', '朱清华', 'f3150ee848504816b854a43c92cacdbe', 3080.09);
INSERT INTO `salarykoukuan` VALUES ('f531862e229e492f96c423b1722aea2d', 582, 151.86, 0, 607.44, 0, 303.72, 0, 22.78, 0, 86.47, '370112198701185150', '吴立明', 'f3150ee848504816b854a43c92cacdbe', 1754.27);
INSERT INTO `salarykoukuan` VALUES ('f559ceaebbe24247a782f978c4d1542f', 550, 135.24, 0, 540.96, 0, 270.48, 0, 20.29, 0, 57.7, '142201199508229027', '白雪莲', 'f3150ee848504816b854a43c92cacdbe', 1574.67);
INSERT INTO `salarykoukuan` VALUES ('f5ab6021dc7d4d6e977ec15229a80858', 725, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 466.85, '140102198009250635', '白宝平', 'f3150ee848504816b854a43c92cacdbe', 2531.33);
INSERT INTO `salarykoukuan` VALUES ('f5af24e469f34215aede66ce6780cfa6', 646, 164.68, 0, 658.72, 0, 329.36, 0, 24.7, 0, 104.87, '140106197504045138', '郭满生', 'f3150ee848504816b854a43c92cacdbe', 1928.33);
INSERT INTO `salarykoukuan` VALUES ('f5cad698eb204b188d53278b6a5b90f1', 809, 210.64, 0, 842.56, 0, 421.28, 0, 31.6, 0, 586.34, '142223196712246718', '王利军', 'f3150ee848504816b854a43c92cacdbe', 2901.42);
INSERT INTO `salarykoukuan` VALUES ('f5f2561c942e499cba74fc852911093e', 857, 219.74, 0, 878.96, 0, 439.48, 0, 32.96, 0, 86.57, '140104196508221728', '孙晋红', 'f3150ee848504816b854a43c92cacdbe', 2514.71);
INSERT INTO `salarykoukuan` VALUES ('f64cfded942e4137939099da020159db', 618, 157.02, 0, 628.08, 0, 314.04, 0, 23.55, 0, 152.21, '140624198208170115', '邢向阳', 'f3150ee848504816b854a43c92cacdbe', 1892.9);
INSERT INTO `salarykoukuan` VALUES ('f65c56e148124d49a4c7cfcc456ccbf6', 688, 171.68, 0, 686.72, 0, 343.36, 0, 25.75, 0, 50.9, '140102198101274015', '张帆', 'f3150ee848504816b854a43c92cacdbe', 1966.41);
INSERT INTO `salarykoukuan` VALUES ('f66acb765776499ba2dbfb0f61082068', 603, 153.1, 0, 612.4, 0, 306.2, 0, 22.97, 0, 88.96, '14020219920828554X', '刘若男', 'f3150ee848504816b854a43c92cacdbe', 1786.63);
INSERT INTO `salarykoukuan` VALUES ('f6aeaa5aec0341ef84cf4b3d130e11b7', 686, 171.04, 0, 684.16, 0, 342.08, 0, 25.66, 0, 73.74, '140107198205143927', '王晋娟', 'f3150ee848504816b854a43c92cacdbe', 1982.68);
INSERT INTO `salarykoukuan` VALUES ('f6c0ff1bee4441dfb7b0ca84ee9d39f8', 541, 136.28, 0, 545.12, 0, 272.56, 0, 20.44, 0, 59.87, '41152819950622002X', '文丽', 'f3150ee848504816b854a43c92cacdbe', 1575.27);
INSERT INTO `salarykoukuan` VALUES ('f6e5ee9f3c634ae48e0f136166f0466b', 590, 145.06, 0, 580.24, 0, 290.12, 0, 21.76, 0, 0.99, '140107198703194815', '董晓飞', 'f3150ee848504816b854a43c92cacdbe', 1628.17);
INSERT INTO `salarykoukuan` VALUES ('f70cec9fb28f4ba1995546f1317245ff', 949, 0, 0, 997.52, 0, 498.76, 0, 37.41, 0, 248.63, '142702197501035814', '郑济孝', 'f3150ee848504816b854a43c92cacdbe', 2731.32);
INSERT INTO `salarykoukuan` VALUES ('f7101bf2f92143aea72f9d05bd620a6f', 437, 132.74, 0, 530.96, 0, 265.48, 0, 19.91, 0, 51.9, '140429198903252017', '崔树鹏', 'f3150ee848504816b854a43c92cacdbe', 1437.99);
INSERT INTO `salarykoukuan` VALUES ('f71125634df44f21b6adb65185c5aaa3', 715, 182.84, 0, 731.36, 0, 365.68, 0, 27.43, 0, 91.07, '140102197401062386', '孙桂芸', 'f3150ee848504816b854a43c92cacdbe', 2113.38);
INSERT INTO `salarykoukuan` VALUES ('f75e2fa14f3b4b738d44fea8a43d5264', 550, 135.24, 0, 540.96, 0, 270.48, 0, 20.29, 0, 57.7, '140223199506226267', '王宏荣', 'f3150ee848504816b854a43c92cacdbe', 1574.67);
INSERT INTO `salarykoukuan` VALUES ('f761fb473a07421f914ed24721adedf5', 656, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 112.58, '140106198410110626', '田琳', 'f3150ee848504816b854a43c92cacdbe', 1933.74);
INSERT INTO `salarykoukuan` VALUES ('f79a1ac265c748578cb73535385aad59', 788, 204.34, 0, 817.36, 0, 408.68, 0, 30.65, 0, 332.81, '142427197512241227', '王丽花', 'f3150ee848504816b854a43c92cacdbe', 2581.84);
INSERT INTO `salarykoukuan` VALUES ('f7bd3ff286214da6a0a66f0dea910313', 738, 190.78, 0, 763.12, 0, 381.56, 0, 28.62, 0, 0, '140103198005221518', '杜宾', 'f3150ee848504816b854a43c92cacdbe', 2102.08);
INSERT INTO `salarykoukuan` VALUES ('f7dbb9cf34e14bf4a592782a6a20cf5a', 831, 212.66, 0, 850.64, 0, 425.32, 0, 31.9, 0, 595.85, '140102197004152089', '王左艳', 'f3150ee848504816b854a43c92cacdbe', 2947.37);
INSERT INTO `salarykoukuan` VALUES ('f830dbf0af0647638e104a8c891a3dd8', 596, 149.66, 0, 598.64, 0, 299.32, 0, 22.45, 0, 0, '140102198007256523', '崔静', 'f3150ee848504816b854a43c92cacdbe', 1666.07);
INSERT INTO `salarykoukuan` VALUES ('f872b0a3aa564f05bb663a912628573b', 672, 167.88, 0, 671.52, 0, 335.76, 0, 25.18, 0, 130.08, '142601198108241710', '靳悦振', 'f3150ee848504816b854a43c92cacdbe', 2002.42);
INSERT INTO `salarykoukuan` VALUES ('f87d59685f21452ab6e9109c61b4bb4d', 654, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 22, '140103198108201528', '陈曦', 'f3150ee848504816b854a43c92cacdbe', 1864.62);
INSERT INTO `salarykoukuan` VALUES ('f88e64a3e2e74a80b97df6f21795a146', 858, 223.94, 0, 895.76, 0, 447.88, 0, 33.59, 0, 659.28, '140102196701114825', '牛智红', 'f3150ee848504816b854a43c92cacdbe', 3118.45);
INSERT INTO `salarykoukuan` VALUES ('f8943d15eb924e76a41f45b617f0b7b2', 567, 142.38, 0, 569.52, 0, 284.76, 0, 21.36, 0, 27.99, '130982198809061123', '丁立杰', 'f3150ee848504816b854a43c92cacdbe', 1613.01);
INSERT INTO `salarykoukuan` VALUES ('f895f2ac3cab4ce69ddabe694bedb8f6', 665, 169.68, 0, 678.72, 0, 339.36, 0, 25.45, 0, 26.03, '140104198207070013', '高鹏', 'f3150ee848504816b854a43c92cacdbe', 1904.24);
INSERT INTO `salarykoukuan` VALUES ('f8ced3fb74374c268d446bf2e970222d', 644, 163.08, 0, 652.32, 0, 326.16, 0, 24.46, 0, 60.03, '140122197805040015', '杨俊卿', 'f3150ee848504816b854a43c92cacdbe', 1870.05);
INSERT INTO `salarykoukuan` VALUES ('f8d3a340d62947268b1924f8ea754e82', 631, 155.14, 0, 620.56, 0, 310.28, 0, 23.27, 0, 57.69, '140109198609095127', '李婷婷', 'f3150ee848504816b854a43c92cacdbe', 1797.94);
INSERT INTO `salarykoukuan` VALUES ('f8f37663d2e346b5a7fdd6a9b68a51c9', 650, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 20.3, '140109198704295522', '孙婧', 'f3150ee848504816b854a43c92cacdbe', 1824.45);
INSERT INTO `salarykoukuan` VALUES ('f9466448e4124896ba51fc7ac53a4584', 646, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 107.64, '140104198101112211', '封俊', 'f3150ee848504816b854a43c92cacdbe', 1930.53);
INSERT INTO `salarykoukuan` VALUES ('f95f825893ad4ff397f2f56d1dfc2db0', 919, 239.76, 0, 959.04, 0, 479.52, 0, 35.96, 0, 26.75, '140103197710206327', '李影', 'f3150ee848504816b854a43c92cacdbe', 2660.03);
INSERT INTO `salarykoukuan` VALUES ('f99dd3decb394aa78cddca9ff5eb1fed', 640, 158.16, 0, 632.64, 0, 316.32, 0, 23.72, 0, 96.4, '140106198305272519', '牛晓亮', 'f3150ee848504816b854a43c92cacdbe', 1867.24);
INSERT INTO `salarykoukuan` VALUES ('f9bd1553e4f3491a8fcc559ba9d3eb64', 751, 189.98, 0, 759.92, 0, 379.96, 0, 28.5, 0, 278.83, '140103198002160641', '赵霞', 'f3150ee848504816b854a43c92cacdbe', 2388.19);
INSERT INTO `salarykoukuan` VALUES ('f9f1caf447cf43ceb32b7a59d510e0d1', 849, 222.88, 0, 891.52, 0, 445.76, 0, 33.43, 0, 652.94, '142326197304061246', '高春娟', 'f3150ee848504816b854a43c92cacdbe', 3095.53);
INSERT INTO `salarykoukuan` VALUES ('fa171e4ce70b4aab81fe2252ba69e056', 648, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 108.48, '142401197810031443', '任艳慧', 'f3150ee848504816b854a43c92cacdbe', 1933.37);
INSERT INTO `salarykoukuan` VALUES ('fa4b984a035849c1b6416dcecea604c1', 591, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 87.73, '140109199309160024', '刘阳', 'f3150ee848504816b854a43c92cacdbe', 1661.28);
INSERT INTO `salarykoukuan` VALUES ('fa52415503ab4af1bcb305093fb65f38', 616, 153.1, 0, 612.4, 0, 306.2, 0, 22.97, 0, 112.54, '142301199204240046', '程丽媛', 'f3150ee848504816b854a43c92cacdbe', 1823.21);
INSERT INTO `salarykoukuan` VALUES ('fa80cffc087347889a8f19a4f06fa6c0', 640, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 15.38, '140102198207230010', '李翔', 'f3150ee848504816b854a43c92cacdbe', 1820.54);
INSERT INTO `salarykoukuan` VALUES ('fa88104f7af94fcab34a05302e7dc480', 585, 143.72, 0, 574.88, 0, 287.44, 0, 21.56, 0, 0, '140106198407171217', '董哲宇', 'f3150ee848504816b854a43c92cacdbe', 1612.6);
INSERT INTO `salarykoukuan` VALUES ('fa8e506e7d824b04a5c3d003eda0bedb', 715, 184.06, 0, 736.24, 0, 368.12, 0, 27.61, 0, 45.11, '142223198503062428', '赵丹', 'f3150ee848504816b854a43c92cacdbe', 2076.14);
INSERT INTO `salarykoukuan` VALUES ('fac503c9770344b7b4e3aabb436145a4', 733, 188.98, 0, 755.92, 0, 377.96, 0, 28.35, 0, 53.36, '142401198110021425', '彭薇', 'f3150ee848504816b854a43c92cacdbe', 2137.57);
INSERT INTO `salarykoukuan` VALUES ('fad21d3ee2764bce993dbde345081ace', 623, 156.78, 0, 627.12, 0, 313.56, 0, 23.52, 0, 6.24, '140103198008044828', '李方琪', 'f3150ee848504816b854a43c92cacdbe', 1750.22);
INSERT INTO `salarykoukuan` VALUES ('fb5fbfbf8ea340898632ef5e29e51f21', 706, 180.86, 0, 723.44, 0, 361.72, 0, 27.13, 0, 57.62, '14010219731220061X', '张巍', 'f3150ee848504816b854a43c92cacdbe', 2056.77);
INSERT INTO `salarykoukuan` VALUES ('fba63ae7a8574c9994e88ceba4edb64d', 753, 194.38, 0, 777.52, 0, 388.76, 0, 29.16, 0, 502.12, '140103197810311220', '郑敏', 'f3150ee848504816b854a43c92cacdbe', 2644.94);
INSERT INTO `salarykoukuan` VALUES ('fbc112752cef4e6891a53c2abe418e88', 623, 153.34, 0, 613.36, 0, 306.68, 0, 23, 0, 0, '140103198005114245', '聂永乐', 'f3150ee848504816b854a43c92cacdbe', 1719.38);
INSERT INTO `salarykoukuan` VALUES ('fbdd05267e2549d0a5520260df5c6ab7', 557, 139.8, 0, 559.2, 0, 279.6, 0, 20.97, 0, 67.7, '140402199111280444', '张迪', 'f3150ee848504816b854a43c92cacdbe', 1624.27);
INSERT INTO `salarykoukuan` VALUES ('fbfac18bdb5d481b923c87381780b1c1', 590, 148.12, 0, 592.48, 0, 296.24, 0, 22.22, 0, 0, '14010619850703122X', '宋璐', 'f3150ee848504816b854a43c92cacdbe', 1649.06);
INSERT INTO `salarykoukuan` VALUES ('fc39370e02584ce7a381a7b84ed37902', 681, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 72.94, '142232198106240469', '韩乐', 'f3150ee848504816b854a43c92cacdbe', 1942.56);
INSERT INTO `salarykoukuan` VALUES ('fcc06672e5c440a6afdfadc42dcab071', 598, 151.86, 0, 607.44, 0, 303.72, 0, 22.78, 0, 124.72, '140121199112200621', '刘洋', 'f3150ee848504816b854a43c92cacdbe', 1808.52);
INSERT INTO `salarykoukuan` VALUES ('fcd612dd5c4742689dfff29e8fc14350', 881, 231.72, 0, 926.88, 0, 463.44, 0, 34.76, 0, 448.52, '140104196708251323', '武健', 'f3150ee848504816b854a43c92cacdbe', 2986.32);
INSERT INTO `salarykoukuan` VALUES ('fcd625ca8a3f421f9aa90db7ca8498ff', 648, 164.6, 0, 658.4, 0, 329.2, 0, 24.69, 0, 3.48, '14232219840619054X', '游翔', 'f3150ee848504816b854a43c92cacdbe', 1828.37);
INSERT INTO `salarykoukuan` VALUES ('fd6a43571e5d4dd6b68fc10301806eb7', 590, 137.42, 0, 549.68, 0, 274.84, 0, 20.61, 0, 86.89, '14042819940608601X', '王志辉', 'f3150ee848504816b854a43c92cacdbe', 1659.44);
INSERT INTO `salarykoukuan` VALUES ('fd704b7c26924452a5198f9632443f2a', 654, 162.96, 0, 651.84, 0, 325.92, 0, 24.44, 0, 60, '142601198410101938', '杨锐', 'f3150ee848504816b854a43c92cacdbe', 1879.16);
INSERT INTO `salarykoukuan` VALUES ('fd8a88e1dd5f47b38f7239a9ba11aac4', 641, 149.66, 0, 598.64, 0, 299.32, 0, 22.45, 0, 64.11, '142702198304270326', '李婷', 'f3150ee848504816b854a43c92cacdbe', 1775.18);
INSERT INTO `salarykoukuan` VALUES ('fd9d1c28b24e43d8800b3616de9da513', 818, 212.66, 0, 850.64, 0, 425.32, 0, 31.9, 0, 597.54, '14010219691215232X', '崔玉兰', 'f3150ee848504816b854a43c92cacdbe', 2936.06);
INSERT INTO `salarykoukuan` VALUES ('fdd67a64ca874fb6a1a89dbac2157dc6', 674, 167.88, 0, 671.52, 0, 335.76, 0, 25.18, 0, 30.8, '140102198112296527', '汤淑红', 'f3150ee848504816b854a43c92cacdbe', 1905.14);
INSERT INTO `salarykoukuan` VALUES ('fdf7248a995f488182bc7168aadb543f', 657, 166.76, 0, 667.04, 0, 333.52, 0, 25.01, 0, 21.74, '140109198311100528', '周玮', 'f3150ee848504816b854a43c92cacdbe', 1871.07);
INSERT INTO `salarykoukuan` VALUES ('fe4176f4790a48a8b79780eb0dcd9760', 640, 161.44, 0, 645.76, 0, 322.88, 0, 24.22, 0, 103.43, '411102198103205669', '任淑婷', 'f3150ee848504816b854a43c92cacdbe', 1897.73);
INSERT INTO `salarykoukuan` VALUES ('fe4f807ed0a0422d83c484b4d257c867', 549, 138.56, 0, 554.24, 0, 277.12, 0, 20.78, 0, 64.81, '142333199112191815', '马驰洋', 'f3150ee848504816b854a43c92cacdbe', 1604.51);
INSERT INTO `salarykoukuan` VALUES ('fed2d7670032443991239b2dc7d2e71f', 674, 167.76, 0, 671.04, 0, 335.52, 0, 25.16, 0, 191.44, '142322198605060529', '裴夏璇', 'f3150ee848504816b854a43c92cacdbe', 2064.92);
INSERT INTO `salarykoukuan` VALUES ('fefe00597c5e482a900f3612529e1724', 653, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 66.16, '140202198002146013', '李海', 'f3150ee848504816b854a43c92cacdbe', 1907.78);
INSERT INTO `salarykoukuan` VALUES ('fefeaa3cdb084f008285a3c5a20acec6', 727, 187.34, 0, 749.36, 0, 374.68, 0, 28.1, 0, 65.89, '140103198012060628', '赵志星', 'f3150ee848504816b854a43c92cacdbe', 2132.37);
INSERT INTO `salarykoukuan` VALUES ('ff04d16330bf40b7b8211e6f477a2e8a', 668, 166.24, 0, 664.96, 0, 332.48, 0, 24.94, 0, 66.61, '142724198308210011', '王晓锋', 'f3150ee848504816b854a43c92cacdbe', 1923.23);
INSERT INTO `salarykoukuan` VALUES ('ff053d06217542c98b83d12613632327', 636, 161.42, 0, 645.68, 0, 322.84, 0, 24.21, 0, 103.94, '14270219870202274X', '明小菊', 'f3150ee848504816b854a43c92cacdbe', 1894.09);
INSERT INTO `salarykoukuan` VALUES ('ff7572dcfe03412fbda8959e6dd4ac49', 714, 175.08, 0, 700.32, 0, 350.16, 0, 26.26, 0, 86.34, '140122197712081125', '张俊芳', 'f3150ee848504816b854a43c92cacdbe', 2052.16);
INSERT INTO `salarykoukuan` VALUES ('ff88b591db434bddbcc8945c78e7c843', 602, 151.84, 0, 607.36, 0, 303.68, 0, 22.78, 0, 83.77, '14010219700426403X', '秦建军', 'f3150ee848504816b854a43c92cacdbe', 1771.43);
INSERT INTO `salarykoukuan` VALUES ('ffa29e372e484313845922933b81d27c', 674, 167.88, 0, 671.52, 0, 335.76, 0, 25.18, 0, 114.05, '140108198210112523', '马莎', 'f3150ee848504816b854a43c92cacdbe', 1988.39);
INSERT INTO `salarykoukuan` VALUES ('ffa3be811267492994b68b3c281d1eba', 632, 159.8, 0, 639.2, 0, 319.6, 0, 23.97, 0, 9.05, '140103198110185715', '郭锐', 'f3150ee848504816b854a43c92cacdbe', 1783.62);

-- ----------------------------
-- Table structure for salaryyingfa
-- ----------------------------
DROP TABLE IF EXISTS `salaryyingfa`;
CREATE TABLE `salaryyingfa`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `baoliujintie` double NOT NULL,
  `zhufangbutie` double NOT NULL,
  `zhufanggongjijin` double NOT NULL,
  `dushengfei` double NOT NULL,
  `weishengfei` double NOT NULL,
  `gangweigongzi` double NOT NULL,
  `jiaohulingjintie` double NOT NULL,
  `xinjigongzi` double NOT NULL,
  `jichujixiaojiang` double NOT NULL,
  `jichuxingjixiaogongzi` double NOT NULL,
  `dongjiqunuanfei` double NOT NULL,
  `qitabufagongzi` double NOT NULL,
  `linshigongzi` double NOT NULL,
  `nianzhongjikaoheyouxiujiang` double NOT NULL,
  `daikouzhufanggongjijin` double NOT NULL,
  `bufagongzi` double NOT NULL,
  `bufadushengfei` double NOT NULL,
  `danweimingcheng` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `renyuanzhuangkuang` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `daifayinhang` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `yingfagongzi` double NOT NULL,
  `danweidaima` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `zhixingshijian` date NULL DEFAULT NULL,
  `shifagongzhi` double NOT NULL,
  `shenfenzhenghao` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `xingming` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `year_month_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `SalaryYingFa_year_month_id_bf1a7a3a_fk_YearAndMonth_id`(`year_month_id` ASC) USING BTREE,
  CONSTRAINT `SalaryYingFa_year_month_id_bf1a7a3a_fk_YearAndMonth_id` FOREIGN KEY (`year_month_id`) REFERENCES `yearandmonth` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of salaryyingfa
-- ----------------------------
INSERT INTO `salaryyingfa` VALUES ('0027f072246b4786b709152a37b52ddd', 99, 0, 1516, 0, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2274, 0, 0, '太原学院', '事业', '01', 11120, '074001', NULL, 8846, '140112198211211421', '任婷婷', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('003904bde15c4a30b996c904177d733f', 89, 0, 1201, 0, 0, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1802, 0, 0, '太原学院', '事业', '01', 8722, '074001', NULL, 6920, '370112198701185150', '吴立明', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('00748550239944368b041fb8dfea0941', 99, 0, 1431, 0, 30, 3030, 0, 1789, 2730, 1540, 0, 0, 0, 0, 2147, 0, 0, '太原学院', '事业', '01', 10649, '074001', NULL, 8502, '140624198605020524', '谷晓霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('0106e4dcdd1b4db9a2b8be70e2e57ac1', 89, 0, 1391, 0, 30, 2410, 0, 2375, 2660, 1418, 0, 0, 0, 0, 2087, 0, 0, '太原学院', '事业', '01', 10373, '074001', NULL, 8286, '140102197912204024', '张欣', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('014c20c69e3749cdaa730f70b8591f8d', 99, 0, 1437, 0, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2156, 0, 0, '太原学院', '事业', '01', 10748, '074001', NULL, 8592, '140105198803241866', '王晓林', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('01542b66058a4915b7d7b39e33c8bcaf', 69, 0, 1303, 0, 0, 2260, 0, 1954, 2590, 1365, 0, 0, 0, 0, 1955, 0, 0, '太原学院', '事业', '01', 9541, '074001', NULL, 7586, '140103197505181239', '李伟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('0160e7997d0e406c8224c2ef789d80ed', 89, 0, 1392, 50, 0, 2650, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2088, 0, 0, '太原学院', '事业', '01', 10434, '074001', NULL, 8346, '140102198101274015', '张帆', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('016249d4d779474da8734f6d5584863b', 89, 0, 1327, 0, 30, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1991, 0, 0, '太原学院', '事业', '01', 9816, '074001', NULL, 7825, '140109198311100528', '周玮', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('01631762110d4822bc8d4c738788f8a8', 74, 0, 1112, 0, 0, 1925, 0, 1005, 2520, 1215, 0, 0, 0, 0, 1668, 0, 0, '太原学院', '事业', '01', 7851, '074001', NULL, 6183, '140105199512222918', '马腾飞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('01ee98a0e5214e35b924838087af5003', 99, 0, 1369, 0, 0, 3030, 0, 1339, 2730, 1540, 0, 0, 0, 0, 2054, 0, 0, '太原学院', '事业', '01', 10107, '074001', NULL, 8053, '140110199302112017', '杜丽勇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('02514757e4f546719472662033393166', 89, 0, 1285, 0, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1928, 0, 0, '太原学院', '事业', '01', 9456, '074001', NULL, 7528, '142431198811217541', '张静', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('02fd0ac3902545d2989f4dfdbb441633', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '140108199305114227', '杜苗雨阳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('037e8a32d8d04fa59d6c71299ffb8e77', 74, 0, 1112, 0, 30, 1925, 0, 1087, 2520, 1215, 0, 0, 0, 0, 1668, 0, 0, '太原学院', '事业', '01', 7963, '074001', NULL, 6295, '142301199306154149', '张茹', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('040f8f2916204e4c90d55fcf2bc17dd4', 89, 0, 1205, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1808, 0, 0, '太原学院', '事业', '01', 8756, '074001', NULL, 6948, '141124199204080209', '郭玉婷', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('043437d698aa43daa36534809e141a88', 99, 0, 1637, 0, 30, 3260, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2456, 0, 0, '太原学院', '事业', '01', 12437, '074001', NULL, 9981, '140103197201100620', '孙芳芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('0446442226b84782b8eba35ab5788e98', 79, 0, 1242, 0, 30, 2200, 0, 1603, 2590, 1292, 0, 0, 0, 0, 1863, 0, 0, '太原学院', '事业', '01', 9036, '074001', NULL, 7173, '140106198512132543', '马小清', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('04f053826ba145c0abf8f794a42598ef', 104, 0, 1826, 0, 0, 4640, 0, 2475, 2940, 1908, 0, 0, 0, 0, 2739, 0, 0, '太原学院', '事业', '01', 13893, '074001', NULL, 11154, '140102197810240016', '傅晔', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('0556f7c316184a19a61f6df4a0c7e403', 89, 0, 1391, 50, 30, 2410, 0, 2375, 2660, 1418, 0, 0, 0, 0, 2087, 0, 0, '太原学院', '事业', '01', 10423, '074001', NULL, 8336, '140203197812106226', '陈素云', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('05911db9d427461bb4d97feffd81a3ac', 64, 0, 994, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1491, 0, 0, '太原学院', '事业', '01', 8116, '074001', NULL, 6625, '13080219930107166X', '袁烁', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('059140fec5a04ed5b3c75ee1ca558856', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '142703199611023625', '原睿楠', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('05f26f69cfe342d294f55f3f12d65e0c', 94, 4, 1812, 0, 30, 3455, 0, 3641, 2800, 1810, 0, 0, 0, 0, 2718, 0, 0, '太原学院', '事业', '01', 13646, '074001', NULL, 10928, '140102196908032069', '常静', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('060323a713f04987aeb56bedc0085556', 74, 0, 1117, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1676, 0, 0, '太原学院', '事业', '01', 7815, '074001', NULL, 6139, '142401199401104225', '康晓婷', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('065f874abb6e41aa8b5063f073f37e8b', 99, 0, 1653, 0, 30, 3260, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2480, 0, 0, '太原学院', '事业', '01', 12578, '074001', NULL, 10098, '140104197003160821', '张彬', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('06ec2d7d1a6d4ccdba157333ae70a274', 74, 0, 1201, 0, 0, 1925, 0, 1882, 2520, 1215, 0, 0, 0, 0, 1802, 0, 0, '太原学院', '事业', '01', 8817, '074001', NULL, 7015, '140104198109033710', '高磊', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('074b334429c448558806a71723c2c6d4', 74, 0, 1229, 50, 0, 1950, 0, 2075, 2520, 1215, 0, 0, 0, 0, 1844, 0, 0, '太原学院', '事业', '01', 9113, '074001', NULL, 7269, '140321197805010056', '郝振华', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('075bf7666f844f6ab8e7e7033a7c324c', 94, 0, 1747, 0, 0, 3455, 0, 3141, 2800, 1810, 0, 0, 0, 0, 2621, 0, 0, '太原学院', '事业', '01', 13047, '074001', NULL, 10426, '140102197303235159', '翟四团', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('0808c123780341ddbacf17da2bdc0761', 99, 0, 1477, 0, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2216, 0, 0, '太原学院', '事业', '01', 10981, '074001', NULL, 8765, '142726198205260027', '李俊彦', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('081fffd1a09549d089ed8287c42db3e2', 99, 0, 1653, 0, 30, 3260, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2480, 0, 0, '太原学院', '事业', '01', 12578, '074001', NULL, 10098, '14010219700620492X', '郝慧颖', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('0849cc38e2684f50bb091f0403ed0db1', 89, 0, 1378, 0, 30, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2067, 0, 0, '太原学院', '事业', '01', 10260, '074001', NULL, 8193, '140102197806146529', '张海燕', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('086618281e5c4e8d8797b480c87783cf', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '140721199109070080', '杨静', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('087d073132a44864a136719f498af818', 99, 0, 1574, 0, 0, 3260, 0, 2689, 2730, 1540, 0, 0, 0, 0, 2361, 0, 0, '太原学院', '事业', '01', 11892, '074001', NULL, 9531, '140102197604156518', '江河', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('089a9dcd223b4348bbf2b8da31f56e38', 74, 0, 1306, 0, 0, 1950, 0, 2475, 2520, 1215, 0, 0, 0, 0, 1959, 0, 0, '太原学院', '事业', '01', 9540, '074001', NULL, 7581, '140102197604250619', '王峰龙', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('08e01700dfeb405ba338972529b068c7', 99, 0, 1512, 0, 30, 3260, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2268, 0, 0, '太原学院', '事业', '01', 11246, '074001', NULL, 8978, '140113198103152328', '王秀卿', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('08fe9a1ca83143a79b47b1581fd408ba', 79, 0, 1254, 50, 30, 2200, 0, 1696, 2590, 1292, 0, 0, 0, 0, 1881, 0, 0, '太原学院', '事业', '01', 9191, '074001', NULL, 7310, '14040219840908322X', '李洁琼', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('09470140a3d5498486a105c9edf9f6ee', 89, 0, 1205, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1808, 0, 0, '太原学院', '事业', '01', 8756, '074001', NULL, 6948, '142303199301284529', '郝秀萍', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('09682e36f92d49308da5aca876469b3b', 99, 0, 1490, 0, 0, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2235, 0, 0, '太原学院', '事业', '01', 10964, '074001', NULL, 8729, '130402198103181538', '王卫涛', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('09a6fd382ec34bcaab2462a2f87eb5e5', 99, 0, 1504, 50, 0, 3030, 0, 2375, 2730, 1540, 0, 0, 0, 0, 2256, 0, 0, '太原学院', '事业', '01', 11328, '074001', NULL, 9072, '140103197910300617', '李毅华', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('09b8be4a0af84e518abc66bc95ea2a82', 74, 0, 1134, 0, 30, 1925, 0, 1339, 2520, 1215, 0, 0, 0, 0, 1701, 0, 0, '太原学院', '事业', '01', 8237, '074001', NULL, 6536, '140107198704141221', '王喆', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('09b9f524c2384f3183f627f7382d1a14', 89, 0, 1219, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1829, 0, 0, '太原学院', '事业', '01', 8688, '074001', NULL, 6859, '150421199211051228', '李晓楠', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('09dcd94d32934533b81b8f2342a7d7f2', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '420116198902094562', '解欢', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('0a2c9a6b7d6a4c80bc83c4bd2de56af4', 94, 4.3, 1781, 0, 30, 3455, 0, 3641, 2800, 1810, 0, 0, 0, 0, 2672, 0, 0, '太原学院', '事业', '01', 13615.3, '074001', NULL, 10943.3, '140102196706176523', '贺红梅', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('0a8143e5624f48eb89a73ee376a4d619', 99, 0, 1796, 0, 30, 3810, 0, 3516, 2730, 1540, 0, 0, 0, 0, 2694, 0, 0, '太原学院', '事业', '01', 13521, '074001', NULL, 10827, '142324197202030024', '李彩兰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('0b26fbbe6633426eacf8846041325df4', 94, 3.9, 1650, 0, 0, 2880, 0, 3641, 2730, 1551, 0, 0, 0, 0, 2475, 0, 0, '太原学院', '事业', '01', 12549.9, '074001', NULL, 10074.9, '140103196708150657', '杨烽', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('0b4e6f41decb4c038b6dc453d542a661', 69, 0, 1137, 50, 30, 1830, 0, 1383, 2450, 1176, 0, 0, 0, 0, 1706, 0, 0, '太原学院', '事业', '01', 8125, '074001', NULL, 6419, '140105198805071821', '王荣', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('0b53c104259d4dfca2585cb39a9ad50c', 89, 0, 1273, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1910, 0, 0, '太原学院', '事业', '01', 9351, '074001', NULL, 7441, '140121198309307225', '代芳芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('0b966e3ca14a4370b4fb91c1661abce9', 74, 0, 1259, 0, 30, 1950, 0, 2275, 2520, 1215, 0, 0, 0, 0, 1889, 0, 0, '太原学院', '事业', '01', 9323, '074001', NULL, 7434, '140103198003231229', '岳莉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('0bf72256a15b42d7a721714a51054a83', 74, 0, 1106, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1659, 0, 0, '太原学院', '事业', '01', 7804, '074001', NULL, 6145, '360681199608012629', '汤秀佳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('0c0c0961c79d4bdeac6f1a132f6a7e87', 89, 0, 1346, 0, 30, 2185, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2019, 0, 0, '太原学院', '事业', '01', 10003, '074001', NULL, 7984, '140103198008044828', '李方琪', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('0c1177edc21244a9a4f8c32c444d1806', 94, 0, 1505, 50, 0, 2880, 0, 2475, 2730, 1551, 0, 0, 0, 0, 2258, 0, 0, '太原学院', '事业', '01', 11285, '074001', NULL, 9027, '140104198107294511', '杨树军', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('0c39c5cb158840b4a1518e0f6b6d4998', 99, 0, 1549, 50, 30, 3260, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2324, 0, 0, '太原学院', '事业', '01', 11533, '074001', NULL, 9209, '140103198001190021', '高丽霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('0c4e7f3c234a4abfaf366bf14bae4bd3', 59, 0, 1093, 0, 30, 1730, 0, 1383, 2450, 1148, 0, 0, 0, 0, 1640, 0, 0, '太原学院', '事业', '01', 7893, '074001', NULL, 6253, '120102198410314128', '朱玲', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('0c5659e8b9b442148d30e29a55cd9385', 74, 0, 1072, 0, 30, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1608, 0, 0, '太原学院', '事业', '01', 7699, '074001', NULL, 6091, '142732199509211621', '温瑶', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('0c84bc1f45e4468dbb595c20150dd894', 89, 0, 1347, 50, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2021, 0, 0, '太原学院', '事业', '01', 9854, '074001', NULL, 7833, '140121198204019024', '张芝秀', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('0cc16193c6ed44eda89a87917c987292', 99, 0, 1520, 0, 30, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2280, 0, 0, '太原学院', '事业', '01', 11424, '074001', NULL, 9144, '142724197809061945', '汪艳霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('0cdd1b60c1284b5391336bd2ca3ed39b', 89, 0, 1503, 0, 0, 2650, 0, 2796, 2660, 1418, 0, 0, 0, 0, 2255, 0, 0, '太原学院', '事业', '01', 11116, '074001', NULL, 8861, '142601197504221311', '霍海涛', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('0d2fdae06f044e988c80282cba3c655a', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '140106199109100626', '曹楚楚', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('0d39a80fa6d249fe94b15e01cf7e5c19', 94, 0, 1605, 0, 0, 2880, 0, 3026, 2730, 1551, 0, 0, 0, 0, 2408, 0, 0, '太原学院', '事业', '01', 11886, '074001', NULL, 9478, '140102197308202030', '董新平', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('0db039f4504041d0938363da8f44ec82', 74, 0, 1157, 0, 30, 1925, 0, 1515, 2520, 1215, 0, 0, 0, 0, 1736, 0, 0, '太原学院', '事业', '01', 8436, '074001', NULL, 6700, '14112119890731002X', '师帅', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('0e8e0c1419424b4d89cd7d9caf558643', 74, 0, 1078, 0, 0, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1617, 0, 0, '太原学院', '事业', '01', 7746, '074001', NULL, 6129, '140109199803091511', '宁瑞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('0ea4223601444f98a0d107496c1da99d', 89, 0, 1298, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1947, 0, 0, '太原学院', '事业', '01', 9376, '074001', NULL, 7429, '41082119870809454X', '樊亚男', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('0f08903f0f7c41e89d430d9ffab2a124', 99, 4.2, 1643, 0, 0, 3260, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2465, 0, 0, '太原学院', '事业', '01', 12417.2, '074001', NULL, 9952.2, '140103197108190035', '黄国卫', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('0fe02247dc504ffc978ffcd9431a878d', 79, 0, 1345, 0, 30, 2200, 0, 2475, 2590, 1292, 0, 0, 0, 0, 2018, 0, 0, '太原学院', '事业', '01', 10011, '074001', NULL, 7993, '140104197605161725', '郑峰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1018e617133c4565ad93d38d6a51d717', 74, 0, 1078, 0, 0, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1617, 0, 0, '太原学院', '事业', '01', 7746, '074001', NULL, 6129, '140602199111079039', '郝则好', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('106f343d4c304c22bf2d36570e9024f9', 89, 0, 1390, 50, 30, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2085, 0, 0, '太原学院', '事业', '01', 10222, '074001', NULL, 8137, '140113198010051229', '李瑞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('10adf0efded44861a7c2cd06d98075fb', 99, 0, 1545, 0, 0, 3030, 0, 2689, 2730, 1540, 0, 0, 0, 0, 2318, 0, 0, '太原学院', '事业', '01', 11633, '074001', NULL, 9315, '142401197602057219', '郑红勇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('10d39a52e2e64fc491ce9dbceccb13e3', 74, 0, 1098, 0, 0, 1925, 0, 1087, 2520, 1215, 0, 0, 0, 0, 1647, 0, 0, '太原学院', '事业', '01', 7919, '074001', NULL, 6272, '14010819930825193X', '张玉杰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('10eeb8d22da74bdb8888a86c41bc1a86', 89, 0, 1322, 0, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1983, 0, 0, '太原学院', '事业', '01', 9586, '074001', NULL, 7603, '140109198503180526', '张璇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1187e4d003ae4868baf06688136dad03', 89, 0, 1181, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1772, 0, 0, '太原学院', '事业', '01', 8568, '074001', NULL, 6796, '140429199301034826', '赵红飞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('11ac5c38bedb4b589c84d25aed0922d8', 99, 0, 1521, 0, 0, 3260, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2282, 0, 0, '太原学院', '事业', '01', 11425, '074001', NULL, 9143, '142702197911295512', '忽江华', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('11e68c6c8d364e0a85d7940c31edeb71', 69, 0, 1373, 0, 0, 2260, 0, 2503, 2590, 1365, 0, 0, 0, 0, 2060, 0, 0, '太原学院', '事业', '01', 10160, '074001', NULL, 8100, '140109196707270014', '王文斌', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('11e79576768d4837841f0dc24620f659', 74, 0, 1101, 0, 30, 1925, 0, 1087, 2520, 1215, 0, 0, 0, 0, 1652, 0, 0, '太原学院', '事业', '01', 7952, '074001', NULL, 6300, '140202199001072520', '赵然', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('11f4fe9ad3d34acf8c00e6ab7bc2aff7', 79, 0, 1244, 50, 30, 2200, 0, 1696, 2590, 1292, 0, 0, 0, 0, 1866, 0, 0, '太原学院', '事业', '01', 9181, '074001', NULL, 7315, '142723198409043025', '任芬', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('12471dd4b60149ae992342476d764ff1', 89, 0, 1415, 0, 0, 2650, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2123, 0, 0, '太原学院', '事业', '01', 10507, '074001', NULL, 8384, '142424197705276515', '张乃江', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1251b4c74ff14c3fabc8c4246654e9d6', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '140109199309160024', '刘阳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('125d230265244a0d8afa19936100a1f8', 74, 0, 1180, 50, 30, 1925, 0, 1696, 2520, 1215, 0, 0, 0, 0, 1770, 0, 0, '太原学院', '事业', '01', 8690, '074001', NULL, 6920, '140106198406221841', '张敏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('128479aa03ec48e6b86a558ae01ebb47', 89, 0, 1310, 0, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1965, 0, 0, '太原学院', '事业', '01', 9481, '074001', NULL, 7516, '140110198601230027', '袁菁菁', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('12d9b63e9c044ff5b3387459981f83c4', 99, 0, 1315, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 1973, 0, 0, '太原学院', '事业', '01', 10869, '074001', NULL, 8896, '142321197902160023', '梁丽', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1316271cf427474098aceaa67a7addfe', 94, 0, 1416, 0, 30, 2880, 0, 1882, 2730, 1551, 0, 0, 0, 0, 2124, 0, 0, '太原学院', '事业', '01', 10583, '074001', NULL, 8459, '142322198605060529', '裴夏璇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1322d0f283644334b0193ded094eb0ab', 89, 0, 1345, 0, 0, 2185, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2018, 0, 0, '太原学院', '事业', '01', 9972, '074001', NULL, 7954, '140104198207070013', '高鹏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('139fcc763888410396d8681b8ec613ce', 99, 0, 1419, 0, 0, 3030, 0, 1789, 2730, 1540, 0, 0, 0, 0, 2129, 0, 0, '太原学院', '事业', '01', 10607, '074001', NULL, 8478, '142228198410130016', '樊星男', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('13a4cc0798f54418a5a1b56753d36168', 74, 0, 1087, 0, 0, 1925, 0, 1005, 2520, 1215, 0, 0, 0, 0, 1631, 0, 0, '太原学院', '事业', '01', 7826, '074001', NULL, 6195, '140421199309231217', '史彦鑫', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('13a81e9bce664f4cab7523d187060631', 99, 3.8, 1670, 0, 30, 3260, 0, 3391, 2730, 1540, 0, 0, 0, 0, 2505, 0, 0, '太原学院', '事业', '01', 12723.8, '074001', NULL, 10218.8, '140103197005150663', '王宝红', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('13bce441d7ac47c28f5fd46e1b67e569', 94, 0, 1680, 0, 30, 3455, 0, 2911, 2800, 1810, 0, 0, 0, 0, 2520, 0, 0, '太原学院', '事业', '01', 12780, '074001', NULL, 10260, '140102197601024026', '谢鹏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1489010d473a4a428e347d8929743cfe', 99, 0, 1470, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2205, 0, 0, '太原学院', '事业', '01', 11024, '074001', NULL, 8819, '142323198104271025', '荀欢欢', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('159e4f7ca00345aa86f39e3b41b3fb2c', 89, 0, 1322, 0, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1983, 0, 0, '太原学院', '事业', '01', 9779, '074001', NULL, 7796, '140103198210024222', '乔虹', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('15a3e1ec636146e8a29462ca205dda3a', 69, 0, 1056, 0, 30, 1925, 0, 639, 2520, 1215, 0, 0, 0, 0, 1584, 0, 0, '太原学院', '事业', '01', 7454, '074001', NULL, 5870, '652723200006070723', '欧冬其米格', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('15bea1dd2a574a6a82a2583dab1c2d6b', 89, 0, 1041, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1562, 0, 0, '太原学院', '事业', '01', 8428, '074001', NULL, 6866, '142402199501285429', '张璐璐', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('15cf77845e8447809937c12472172d80', 89, 0, 1257, 50, 0, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1886, 0, 0, '太原学院', '事业', '01', 9262, '074001', NULL, 7376, '61012319820410331X', '韩凯', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('15dbc8b8a5e34ce0b3071e62fc19d85c', 89, 0, 1459, 50, 0, 2650, 0, 2689, 2660, 1418, 0, 0, 0, 0, 2189, 0, 0, '太原学院', '事业', '01', 11015, '074001', NULL, 8826, '149001197611281217', '张为锋', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('164ed9fad2ad480eaeb87a38b7f76041', 89, 0, 1327, 0, 30, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1991, 0, 0, '太原学院', '事业', '01', 9816, '074001', NULL, 7825, '140122198410230126', '吴海丽', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('16ed36c71d2b4f2ab34a4b319e356f0a', 74, 0, 1111, 0, 30, 1925, 0, 1087, 2520, 1215, 0, 0, 0, 0, 1667, 0, 0, '太原学院', '事业', '01', 7962, '074001', NULL, 6295, '140622199302110102', '任丹丹', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('171038922c5a401d9ffe6e844430e8b7', 64, 0, 975, 0, 0, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1463, 0, 0, '太原学院', '事业', '01', 8067, '074001', NULL, 6604, '142301199606120338', '许泽海', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('175d2d6a333f49dfaa0f28148ff35b1e', 89, 0, 1348, 0, 30, 2410, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2022, 0, 0, '太原学院', '事业', '01', 9930, '074001', NULL, 7908, '142331198112250523', '温鑫', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('179779c4056545b0aad76c6d1b33637b', 74, 0, 1101, 0, 30, 1925, 0, 1087, 2520, 1215, 0, 0, 0, 0, 1652, 0, 0, '太原学院', '事业', '01', 7952, '074001', NULL, 6300, '142431199207074841', '阴怀芬', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1801bdf6b54e4f1b925ffbaa04748081', 64, 0, 975, 0, 0, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1463, 0, 0, '太原学院', '事业', '01', 8067, '074001', NULL, 6604, '142222199412260339', '史俊杰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('189b68ec46da4e65b3cf1053dae34fb3', 99, 0, 1622, 0, 30, 3260, 0, 3026, 2730, 1540, 0, 0, 0, 0, 2433, 0, 0, '太原学院', '事业', '01', 12307, '074001', NULL, 9874, '142322197303280521', '刘娟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('18b26db90fc84e9e8c8b01b4a109c721', 89, 0, 1331, 50, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1997, 0, 0, '太原学院', '事业', '01', 9838, '074001', NULL, 7841, '140107198202111225', '张红玉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('18b972562e1a42e5a79945d03d5659bc', 99, 0, 1478, 50, 0, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2217, 0, 0, '太原学院', '事业', '01', 11102, '074001', NULL, 8885, '142601198007241914', '支鹏伟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('19346e055bfb4e5490a559b6d3c75301', 99, 0, 1452, 50, 0, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2178, 0, 0, '太原学院', '事业', '01', 10876, '074001', NULL, 8698, '142232198402080017', '吕文渊', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('193a3a9ba1d440bca39a58289eaf78d1', 74, 0, 1081, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1622, 0, 0, '太原学院', '事业', '01', 7779, '074001', NULL, 6157, '141122199604080061', '闫芷毓', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1946013a08344bad96aeed2d32769eea', 89, 0, 1177, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1766, 0, 0, '太原学院', '事业', '01', 8534, '074001', NULL, 6768, '140427199502048033', '王茜渊', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('195b5729c63946aaa41b83688c0f5e44', 74, 0, 1208, 0, 30, 1950, 0, 1882, 2520, 1215, 0, 0, 0, 0, 1812, 0, 0, '太原学院', '事业', '01', 8879, '074001', NULL, 7067, '142703197811053328', '周荣霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1962f7a68f6e40ef849b3758272d6ab2', 74, 0, 1103, 0, 0, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1655, 0, 0, '太原学院', '事业', '01', 7700, '074001', NULL, 6045, '142332199605230011', '乔剑', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('19994a4c760f40fc80be48704c8e51c3', 89, 0, 1042, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1563, 0, 0, '太原学院', '事业', '01', 8399, '074001', NULL, 6836, '142202199312010337', '黄小东', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('19c88be5c0cc432f9d043bf1c6351bb3', 89, 0, 1347, 0, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2021, 0, 0, '太原学院', '事业', '01', 9804, '074001', NULL, 7783, '140102198106042344', '刘譞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1a037b43967547fd8a1362201077d131', 89, 0, 1250, 0, 30, 2185, 0, 1515, 2660, 1418, 0, 0, 0, 0, 1875, 0, 0, '太原学院', '事业', '01', 9147, '074001', NULL, 7272, '14010619870722128X', '彭翀', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1abd668c9e4c4912a2f89cb7f4136b80', 99, 0, 1465, 0, 0, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2198, 0, 0, '太原学院', '事业', '01', 10746, '074001', NULL, 8548, '142325198009050016', '臧国栋', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1adac5d140fd4a3a8bb14a126ea9442d', 99, 4.6, 1843, 0, 0, 3810, 0, 4201, 2730, 1540, 0, 0, 0, 0, 2765, 0, 0, '太原学院', '事业', '01', 14227.6, '074001', NULL, 11462.6, '140102196609231914', '闫永红', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1af0e61b32ed49f78cb8e33b1e77151c', 89, 0, 1273, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1910, 0, 0, '太原学院', '事业', '01', 9351, '074001', NULL, 7441, '142325198606210022', '李楠', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1aff62ded61c4cb5ac77f60af57a87d0', 89, 0, 1177, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1766, 0, 0, '太原学院', '事业', '01', 8534, '074001', NULL, 6768, '140105199511050552', '刘琪', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1b592418ee6548898f6f7a513f84d99d', 89, 0, 1285, 0, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1928, 0, 0, '太原学院', '事业', '01', 9456, '074001', NULL, 7528, '140102198211022329', '温静', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1b9e62530b7143439eb5a9d45da58d50', 94, 0, 1614, 0, 30, 2880, 0, 3266, 2730, 1551, 0, 0, 0, 0, 2421, 0, 0, '太原学院', '事业', '01', 12165, '074001', NULL, 9744, '142224197110080029', '邢淑芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1be443e0e77f4fe5b66e5c918c04a519', 99, 0, 1592, 0, 30, 3260, 0, 2796, 2730, 1540, 0, 0, 0, 0, 2388, 0, 0, '太原学院', '事业', '01', 12047, '074001', NULL, 9659, '142327197402043785', '薛生娥', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1c265f508aa843d9a2c794052cf06d35', 89, 0, 1211, 0, 0, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1817, 0, 0, '太原学院', '事业', '01', 8732, '074001', NULL, 6915, '142402198202030018', '赵亢', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1c551c3faae5464e842d9ae2a50620ee', 89, 0, 1215, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1823, 0, 0, '太原学院', '事业', '01', 8654, '074001', NULL, 6831, '140481199303083213', '成宇飞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1c5e7200b9084b079c31fa8d628a009d', 94, 0, 1738, 0, 0, 3455, 0, 3266, 2800, 1810, 0, 0, 0, 0, 2607, 0, 0, '太原学院', '事业', '01', 13163, '074001', NULL, 10556, '632801197006160533', '吴康', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1c6f342ba892448885539bd6d22e0a00', 99, 0, 1474, 50, 0, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2211, 0, 0, '太原学院', '事业', '01', 10998, '074001', NULL, 8787, '140102198108172310', '赵鸿博', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1ccde1e15845470fa9e60cd437a8ae13', 99, 5, 1888, 0, 0, 3810, 0, 4481, 2730, 1540, 0, 0, 0, 0, 2832, 0, 0, '太原学院', '事业', '01', 14553, '074001', NULL, 11721, '14010319651116211X', '李海林', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1ce7b68a10714526bdcf25d1a53b256d', 89, 0, 1270, 0, 0, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1905, 0, 0, '太原学院', '事业', '01', 9318, '074001', NULL, 7413, '130121198811123817', '陈志贤', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1d1c77ccb291486a996b17c0e149ae6e', 69, 0, 1176, 0, 0, 1925, 0, 1696, 2520, 1215, 0, 0, 0, 0, 1764, 0, 0, '太原学院', '事业', '01', 8601, '074001', NULL, 6837, '140106198312251214', '杜炜', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1d39d60a59d142e2a95c53b4e53c1f98', 99, 0, 1520, 50, 30, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2280, 0, 0, '太原学院', '事业', '01', 11474, '074001', NULL, 9194, '14043019791118844X', '王飞宇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1d3bc24486b6495ca9cf0fc0ea9caedb', 94, 4.2, 1832, 0, 0, 3455, 0, 4061, 2800, 1810, 0, 0, 0, 0, 2748, 0, 0, '太原学院', '事业', '01', 14056.2, '074001', NULL, 11308.2, '620102196707155390', '崔宪宏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1d77a18197c644beab86c9fd55af75bc', 99, 0, 1453, 0, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2180, 0, 0, '太原学院', '事业', '01', 10764, '074001', NULL, 8584, '140108198709041920', '尹婷婷', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1dddfd4ff05f41029ea26842429d4d35', 99, 0, 1592, 0, 30, 3260, 0, 2796, 2730, 1540, 0, 0, 0, 0, 2388, 0, 0, '太原学院', '事业', '01', 12047, '074001', NULL, 9659, '142601197710031922', '赵平', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1e3e0232a39a404db6389ac5681fe364', 99, 0, 1478, 0, 0, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2217, 0, 0, '太原学院', '事业', '01', 11052, '074001', NULL, 8835, '140102198008072312', '苏亮', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1e605673c5f24b1fb98368b3c6e7f24f', 99, 4.2, 1846, 0, 30, 3810, 0, 4201, 2730, 1540, 0, 0, 0, 0, 2769, 0, 0, '太原学院', '事业', '01', 14260.2, '074001', NULL, 11491.2, '140103196511274269', '李俊萍', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1e999b76ab644ac28dac779f04f46a26', 89, 0, 1177, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1766, 0, 0, '太原学院', '事业', '01', 8534, '074001', NULL, 6768, '141181199411090052', '李奇泽', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1ed1e3e052804954b6bd22277f6d88b7', 99, 0, 1517, 0, 0, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2276, 0, 0, '太原学院', '事业', '01', 11391, '074001', NULL, 9115, '142431197712294854', '侯培文', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1ef06029acc4489592bb10542cfee908', 89, 0, 1332, 50, 0, 2185, 0, 2175, 2660, 1418, 0, 0, 0, 0, 1998, 0, 0, '太原学院', '事业', '01', 9909, '074001', NULL, 7911, '140103198004050614', '曹兴亮', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1f30504eeaa14a7285bb1bf11322fbb0', 89, 0, 1361, 50, 0, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2042, 0, 0, '太原学院', '事业', '01', 10163, '074001', NULL, 8121, '142622198212307515', '席作宏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1f681db04607422d89039ca99375f9ac', 89, 0, 1250, 50, 30, 2185, 0, 1515, 2660, 1418, 0, 0, 0, 0, 1875, 0, 0, '太原学院', '事业', '01', 9197, '074001', NULL, 7322, '14010719901228332X', '冀莎', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1fb537c1e9a24535a31caf029f3f4e01', 89, 0, 1046, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1569, 0, 0, '太原学院', '事业', '01', 8433, '074001', NULL, 6864, '14260319960923302X', '杨慧芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1fcfda2ca38e4284b3c7f9a04f9990e6', 89, 0, 1374, 0, 30, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2061, 0, 0, '太原学院', '事业', '01', 10156, '074001', NULL, 8095, '142323197909190244', '王丽桃', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('1fef15914cb3471c889b09634055dc62', 74, 0, 1087, 0, 0, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1631, 0, 0, '太原学院', '事业', '01', 7755, '074001', NULL, 6124, '371325199610100519', '汪龙飞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('20710b58ee2945998d75e9d018bc8d29', 79, 0, 1327, 50, 0, 2200, 0, 2175, 2590, 1292, 0, 0, 0, 0, 1991, 0, 0, '太原学院', '事业', '01', 9713, '074001', NULL, 7722, '142702198106140010', '冯冲', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('20eef8de26ea4e11a698bf4d8c86fe28', 69, 0, 1268, 0, 30, 1925, 0, 2375, 2520, 1215, 0, 0, 0, 0, 1902, 0, 0, '太原学院', '事业', '01', 9402, '074001', NULL, 7500, '149001197307272826', '谢玉华', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('211afbe98082473795bceaadfe8691fd', 79, 0, 1280, 0, 30, 2200, 0, 1975, 2590, 1292, 0, 0, 0, 0, 1920, 0, 0, '太原学院', '事业', '01', 9446, '074001', NULL, 7526, '140181198204112823', '王越英', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2120ba631d9d4bb9919cdc63ec29d2c7', 94, 0, 1511, 50, 0, 2880, 0, 2375, 2730, 1551, 0, 0, 0, 0, 2267, 0, 0, '太原学院', '事业', '01', 11191, '074001', NULL, 8924, '142223197712306113', '王宇峰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('212113f714c1472b9ec9a56bc65bf458', 104, 0, 1896, 0, 30, 4640, 0, 2911, 2940, 1908, 0, 0, 0, 0, 2844, 0, 0, '太原学院', '事业', '01', 14429, '074001', NULL, 11585, '140123197510260025', '朱清华', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('212f5d5ec78e45cb80c5efa33c422980', 89, 0, 1227, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1841, 0, 0, '太原学院', '事业', '01', 8948, '074001', NULL, 7107, '140623198905150025', '祁极冰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('21394edbde2f443088c7449943c3ee2e', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '142228199402154522', '张蔚', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2157719de05845ce95cd4e82775a8022', 94, 3.8, 1729, 0, 0, 3455, 0, 3266, 2800, 1810, 0, 0, 0, 0, 2594, 0, 0, '太原学院', '事业', '01', 13157.8, '074001', NULL, 10563.8, '140102196604132335', '薛斌', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2219b16da33c4b969108c22e5caf7b68', 74, 0, 1180, 0, 30, 1925, 0, 1696, 2520, 1215, 0, 0, 0, 0, 1770, 0, 0, '太原学院', '事业', '01', 8640, '074001', NULL, 6870, '140102198008075142', '陈炜', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2253d190a88844a3b1031e5c5e1ce4f8', 74, 0, 1079, 0, 0, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1619, 0, 0, '太原学院', '事业', '01', 7676, '074001', NULL, 6057, '140411199403040457', '刘洋', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2257b7a14fe44e9482c4c4d8cc3c6a33', 99, 0, 1520, 50, 30, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2280, 0, 0, '太原学院', '事业', '01', 11474, '074001', NULL, 9194, '142326197803064820', '白颉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2272ef1ae08d48d1b3d97b3e8884cf39', 89, 0, 1291, 0, 0, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1937, 0, 0, '太原学院', '事业', '01', 9432, '074001', NULL, 7495, '140107198210191739', '崔阳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('228d8bbc6d3d421a89d95681a1fcb26b', 99, 0, 1550, 0, 30, 3260, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2325, 0, 0, '太原学院', '事业', '01', 11684, '074001', NULL, 9359, '140102197712201486', '赵钦', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('22df40d6804f4f57810497c64cd82b50', 89, 0, 1261, 0, 30, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1892, 0, 0, '太原学院', '事业', '01', 9246, '074001', NULL, 7354, '140106198701210029', '郝婧翔', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('231da08891c84b298d47bddd0e9b7868', 89, 0, 1279, 0, 0, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1919, 0, 0, '太原学院', '事业', '01', 9327, '074001', NULL, 7408, '140321197812011516', '药宏慧', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('236248e9fa8e4ab5bdc479a5e952f9d3', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '152627199506050020', '郭晓樱', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('236450bcbd5d4026a546fe8a49ffaf9f', 74, 0, 1078, 0, 0, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1617, 0, 0, '太原学院', '事业', '01', 7675, '074001', NULL, 6058, '142328199508200019', '薛驹', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2370a44d8f2d4990be1623921f52ba98', 89, 3.9, 1587, 0, 0, 2410, 0, 3641, 2660, 1418, 0, 0, 0, 0, 2381, 0, 0, '太原学院', '事业', '01', 11808.9, '074001', NULL, 9427.9, '140105196606033719', '王作印', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('237868f71afe4cc8b39bfaab7c6f7939', 69, 4, 1223, 0, 0, 1940, 0, 1954, 2520, 1194, 0, 0, 0, 0, 1835, 0, 0, '太原学院', '事业', '01', 8904, '074001', NULL, 7069, '14010219700426403X', '秦建军', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('23c083edc9e84c69b2aa22347838809e', 79, 0, 1299, 0, 30, 2200, 0, 1882, 2590, 1292, 0, 0, 0, 0, 1949, 0, 0, '太原学院', '事业', '01', 9372, '074001', NULL, 7423, '140109198412260520', '闫堃', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('245501c96214459f814aa6f18f2f4635', 89, 0, 1374, 0, 30, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2061, 0, 0, '太原学院', '事业', '01', 10156, '074001', NULL, 8095, '140102198106106520', '霍芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('245d409a718940519ab5507480c7b0e9', 74, 0, 1074, 0, 0, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1611, 0, 0, '太原学院', '事业', '01', 7671, '074001', NULL, 6060, '142327199403161715', '杨健', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('24a69003fb8f4611963104c67be85c0c', 89, 0, 1191, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1787, 0, 0, '太原学院', '事业', '01', 8660, '074001', NULL, 6873, '140429199504015625', '牛瑜霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('24c236f85ce84046ac516d8d7a66896c', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '140109199401100585', '司凡', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('24fd7c903ab74a209e4761bb4df70d3e', 104, 6, 2011, 0, 30, 4345, 0, 3781, 3080, 2100, 0, 0, 0, 0, 3017, 0, 0, '太原学院', '事业', '01', 15457, '074001', NULL, 12440, '510102196610276123', '康晓红', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('25495783fbe94055a163a4e63b317d4e', 99, 0, 1432, 0, 30, 3030, 0, 1603, 2730, 1540, 0, 0, 0, 0, 2148, 0, 0, '太原学院', '事业', '01', 10464, '074001', NULL, 8316, '140430198410060047', '郝佳瑞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('254ebc0efcfe4ba5876b1355cc592b61', 89, 0, 1298, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1947, 0, 0, '太原学院', '事业', '01', 9376, '074001', NULL, 7429, '140525198505186325', '王妮妮', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('255f697b0d5f4b439d0db1edee7bbdcb', 94, 3.6, 1599, 0, 30, 2880, 0, 3026, 2730, 1551, 0, 0, 0, 0, 2399, 0, 0, '太原学院', '事业', '01', 11913.6, '074001', NULL, 9514.6, '140103196911152121', '罗玉萍', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('25be00dc236545518fa40cb07a61d3c1', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '450305199010200042', '解伊瑞雯', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('25d4d94f2f384d3e902d4d2c931a7dbb', 89, 0, 1361, 0, 0, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2042, 0, 0, '太原学院', '事业', '01', 10113, '074001', NULL, 8071, '142601197906084014', '赵振国', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('261068faa2f8428fb5ceb587b3489548', 99, 0, 1495, 50, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2243, 0, 0, '太原学院', '事业', '01', 11149, '074001', NULL, 8906, '140102198007081428', '赵霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('26530eb228574322b75e5bbe31f6ef2f', 74, 0, 1081, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1622, 0, 0, '太原学院', '事业', '01', 7779, '074001', NULL, 6157, '140322199503214227', '侯宁宁', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('26784c3c1e214ef38e9803f53742183a', 89, 0, 1374, 0, 30, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2061, 0, 0, '太原学院', '事业', '01', 10156, '074001', NULL, 8095, '140311198004040628', '郑文芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('267e077e8c99457d9dd20c687da81248', 74, 0, 1216, 0, 0, 1950, 0, 1975, 2520, 1215, 0, 0, 0, 0, 1824, 0, 0, '太原学院', '事业', '01', 8950, '074001', NULL, 7126, '140102198106232332', '崔欣', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('269efab2d29b4648956c075b92656a0b', 89, 0, 1282, 0, 0, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1923, 0, 0, '太原学院', '事业', '01', 9237, '074001', NULL, 7314, '14112219881010009X', '郭巍', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('26f2da61c76440f8a2d6af6d77a04a5a', 74, 0, 1186, 0, 0, 1925, 0, 1696, 2520, 1215, 0, 0, 0, 0, 1779, 0, 0, '太原学院', '事业', '01', 8616, '074001', NULL, 6837, '140106198406063038', '李鹏飞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2785ad7c375948ec9f0f532135783674', 99, 0, 1648, 0, 30, 3260, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2472, 0, 0, '太原学院', '事业', '01', 12448, '074001', NULL, 9976, '140104197209100824', '李瑾', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('28198cdd483c467291111b68cbfe2681', 104, 0, 1868, 0, 0, 4640, 0, 2796, 2940, 1908, 0, 0, 0, 0, 2802, 0, 0, '太原学院', '事业', '01', 14256, '074001', NULL, 11454, '142431197104140034', '王欲进', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2850899f8d5346a19a50333dcded5aaf', 94, 0, 1555, 0, 0, 2880, 0, 2911, 2730, 1551, 0, 0, 0, 0, 2333, 0, 0, '太原学院', '事业', '01', 11721, '074001', NULL, 9388, '140105197501303713', '施新彬', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('28d30eb88ca74ca5911df50180607c1c', 79, 0, 1186, 0, 0, 2200, 0, 1169, 2590, 1292, 0, 0, 0, 0, 1779, 0, 0, '太原学院', '事业', '01', 8516, '074001', NULL, 6737, '140522199302051039', '于晋伟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('290a481a0fd640e0bf2efb4ef6267769', 74, 0, 1027, 50, 30, 1925, 0, 2175, 2520, 1215, 0, 9004, 0, 0, 1541, 0, 0, '太原学院', '事业', '01', 18020, '074001', NULL, 16479, '140102198103226527', '毕涛', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('29917d059c7948f688a731b51b56364c', 89, 0, 1412, 0, 30, 2410, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2118, 0, 0, '太原学院', '事业', '01', 10494, '074001', NULL, 8376, '140113198007122321', '王晓霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('29949727aecb44c385821130cfdcfad0', 89, 0, 1339, 0, 30, 2410, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2009, 0, 0, '太原学院', '事业', '01', 9921, '074001', NULL, 7912, '140107198312080626', '孙睿', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2994a4411c2b44ef845a4a8c746eda88', 89, 0, 1459, 0, 0, 2650, 0, 2689, 2660, 1418, 0, 0, 0, 0, 2189, 0, 0, '太原学院', '事业', '01', 10965, '074001', NULL, 8776, '14010219750120517X', '孙刚平', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2a30aeee7ed44e7f8e03695445f1b16e', 89, 0, 1322, 0, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1983, 0, 0, '太原学院', '事业', '01', 9586, '074001', NULL, 7603, '142429198507130028', '武潇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2a3fb03d1be8477a95570213b9b2e3a2', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '342427199502065545', '张亚', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2a54c175abb24805a5e8a7932e8713da', 104, 0, 1875, 0, 0, 4640, 0, 2582, 2940, 1908, 0, 0, 0, 0, 2813, 0, 0, '太原学院', '事业', '01', 14049, '074001', NULL, 11236, '140102197906082315', '杨立波', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2a932db64a8f42d38afaa4d71623dce8', 89, 0, 1506, 0, 30, 2650, 0, 3026, 2660, 1418, 0, 0, 0, 0, 2259, 0, 0, '太原学院', '事业', '01', 11379, '074001', NULL, 9120, '140123197301020025', '郭建平', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2a992bedf838475ca7ec857deebd61ef', 74, 0, 1145, 0, 30, 1925, 0, 1427, 2520, 1215, 0, 0, 0, 0, 1718, 0, 0, '太原学院', '事业', '01', 8336, '074001', NULL, 6618, '140109199003144224', '张阳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2ae9f882d8424d39b0c79bd2bdfc2065', 99, 0, 1481, 50, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2222, 0, 0, '太原学院', '事业', '01', 11135, '074001', NULL, 8913, '142725198108025627', '贾哲', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2b68005dd2914ede82d2a66499aa133e', 89, 0, 1400, 50, 30, 2410, 0, 2375, 2660, 1418, 0, 0, 0, 0, 2100, 0, 0, '太原学院', '事业', '01', 10432, '074001', NULL, 8332, '140103197907122725', '张静', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2bd5d83bb9eb4937b09ef241f40cc59a', 89, 4.3, 1567, 0, 0, 2650, 0, 3516, 2660, 1418, 0, 0, 0, 0, 2351, 0, 0, '太原学院', '事业', '01', 11904.3, '074001', NULL, 9553.3, '140102196807055157', '郭守敬', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2c2ca3557b654e71a3579cba31225740', 89, 0, 1257, 0, 0, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1886, 0, 0, '太原学院', '事业', '01', 9212, '074001', NULL, 7326, '140402198507310414', '周扬', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2c75f7ce25ac4040b5d76da0d954527a', 89, 0, 1332, 0, 0, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1998, 0, 0, '太原学院', '事业', '01', 9791, '074001', NULL, 7793, '140102198212190658', '赵朗朗', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2c799152625845d3a3e23e3f4f95195e', 59.2, 0, 773, 50, 30, 1560, 0, 1740, 0, 972, 0, -3000, 0, 0, 1160, 0, 0, '太原学院', '事业', '01', 2184.2, '074001', NULL, 1024.2, '140102197910035167', '韩洁', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2cac7424ff85459dab5bab5c462073e6', 89, 0, 1445, 0, 30, 2410, 0, 2796, 2660, 1418, 0, 0, 0, 0, 2168, 0, 0, '太原学院', '事业', '01', 10848, '074001', NULL, 8680, '140102197401062386', '孙桂芸', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2cd5db2042fe4d1c9b58c3cce3318993', 99, 0, 1455, 0, 30, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2183, 0, 0, '太原学院', '事业', '01', 10859, '074001', NULL, 8676, '142636198308270022', '樊华', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2d1a42e9f1c54a789f4383f262d07303', 89, 0, 1191, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1787, 0, 0, '太原学院', '事业', '01', 8660, '074001', NULL, 6873, '140121199503078029', '张赵芝', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2d5639a40ab54a94b210ca8d33f648ed', 79, 0, 1327, 50, 0, 2200, 0, 2175, 2590, 1292, 0, 0, 0, 0, 1991, 0, 0, '太原学院', '事业', '01', 9713, '074001', NULL, 7722, '140122197805040015', '杨俊卿', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2dee4c720fa34b1a9a6324b22aee6ec3', 99, 0, 1587, 0, 30, 3030, 0, 2911, 2730, 1540, 0, 0, 0, 0, 2381, 0, 0, '太原学院', '事业', '01', 11927, '074001', NULL, 9546, '140102197306244827', '李莉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2dff692f44ab4254815426996fc45897', 99, 0, 1499, 50, 0, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2249, 0, 0, '太原学院', '事业', '01', 11023, '074001', NULL, 8774, '140103198206133311', '赵荣', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2dff6f261c5d482b9cb419b1986fa088', 99, 0, 1708, 0, 30, 3810, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2562, 0, 0, '太原学院', '事业', '01', 13058, '074001', NULL, 10496, '140102197109084828', '李瑞军', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2eceab8071404abc96c0a03c5b72032a', 79, 0, 1330, 0, 0, 2520, 0, 1882, 2660, 1383, 0, 0, 0, 0, 1995, 0, 0, '太原学院', '事业', '01', 9854, '074001', NULL, 7859, '140121198409205533', '吴晓杰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2ed625b46c094a388012819a9b5402d7', 79, 0, 1293, 50, 30, 2200, 0, 2075, 2590, 1292, 0, 0, 0, 0, 1940, 0, 0, '太原学院', '事业', '01', 9609, '074001', NULL, 7669, '14010719830608222X', '王胜利', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2f1111095e344bd6b36654a72e1bd355', 104, 0, 1915, 0, 0, 5220, 0, 2582, 2940, 1908, 0, 0, 0, 0, 2873, 0, 0, '太原学院', '事业', '01', 14669, '074001', NULL, 11796, '142702197501035814', '郑济孝', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2f5ba5b19fa843a6847a7449058f1b37', 74, 0, 1108, 0, 0, 1925, 0, 1169, 2520, 1215, 0, 0, 0, 0, 1662, 0, 0, '太原学院', '事业', '01', 8011, '074001', NULL, 6349, '142333199112191815', '马驰洋', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2f6a76cd67384f129515c18ecd544ffa', 94, 0, 1716, 0, 30, 3455, 0, 3141, 2800, 1810, 0, 0, 0, 0, 2574, 0, 0, '太原学院', '事业', '01', 13046, '074001', NULL, 10472, '142326197304061246', '高春娟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('2f7c161d6dd04a7da0cae780a32bee3f', 99, 0, 1431, 50, 30, 3030, 0, 1789, 2730, 1540, 0, 0, 0, 0, 2147, 0, 0, '太原学院', '事业', '01', 10699, '074001', NULL, 8552, '140106198305052524', '张媛', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3003a410f519422889ceefbaf9e447da', 104, 0, 1855, 0, 30, 4640, 0, 2475, 2940, 1908, 0, 0, 0, 0, 2783, 0, 0, '太原学院', '事业', '01', 13952, '074001', NULL, 11169, '142329197509230022', '张梅英', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('30286e5e906449a4a94ce6891c8efcc8', 89, 0, 1223, 0, 0, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1835, 0, 0, '太原学院', '事业', '01', 8914, '074001', NULL, 7079, '140603198810264913', '魏宏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('302b08bc96df4278baa30b465c9bff55', 89, 0, 1261, 0, 30, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1892, 0, 0, '太原学院', '事业', '01', 9246, '074001', NULL, 7354, '142623198804060022', '梁荣', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('302e01ac02d94c38bbc5498a66577760', 94, 0, 1781, 0, 30, 3455, 0, 3641, 2800, 1810, 0, 0, 0, 0, 2672, 0, 0, '太原学院', '事业', '01', 13611, '074001', NULL, 10939, '140104196708251323', '武健', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('302efa1b0c32485e928929d25b2453e8', 99, 0, 1592, 0, 30, 3260, 0, 2796, 2730, 1540, 0, 0, 0, 0, 2388, 0, 0, '太原学院', '事业', '01', 12047, '074001', NULL, 9659, '14052219760721002X', '孙艳平', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('303daf4f259646268e7b15a13697342b', 89, 0, 1177, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1766, 0, 0, '太原学院', '事业', '01', 8534, '074001', NULL, 6768, '141122199408250094', '毋伟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3079d2e1b54a4fe1a7d3b2db583722c6', 89, 0, 1319, 50, 0, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1979, 0, 0, '太原学院', '事业', '01', 9796, '074001', NULL, 7817, '140112198111042835', '刘焕', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('30a6f2666b0645aabba819664dd76c8b', 99, 0, 1517, 50, 0, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2276, 0, 0, '太原学院', '事业', '01', 11441, '074001', NULL, 9165, '142322197707211012', '张鹏飞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('30ada795ccd44c9cbb2597be70e28ccd', 89, 0, 1262, 0, 0, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1893, 0, 0, '太原学院', '事业', '01', 8953, '074001', NULL, 7060, '14020319900812561X', '刘凯', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('30ae6382d8ed477e8806e863a9f3faf0', 89, 0, 1162, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1743, 0, 0, '太原学院', '事业', '01', 8601, '074001', NULL, 6858, '140203199507201234', '董小乐', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('313cd05b02124d8eaafa563974da6e41', 99, 0, 1481, 0, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2222, 0, 0, '太原学院', '事业', '01', 11085, '074001', NULL, 8863, '142431198003246029', '武林芝', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('31912e377ce444d887e7fadc6d80b52c', 89, 0, 1391, 50, 30, 2410, 0, 2375, 2660, 1418, 0, 0, 0, 0, 2087, 0, 0, '太原学院', '事业', '01', 10423, '074001', NULL, 8336, '140102197807204049', '雷丽', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('32805258c9c1407496d3e1f30816504b', 89, 0, 1378, 0, 30, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2067, 0, 0, '太原学院', '事业', '01', 10260, '074001', NULL, 8193, '330106197804290069', '渠改萍', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('328cc629a8384438b8af4ad1721945bc', 79, 0, 1335, 50, 0, 2200, 0, 2175, 2590, 1292, 0, 0, 0, 0, 2003, 0, 0, '太原学院', '事业', '01', 9721, '074001', NULL, 7718, '140112197909131277', '张海鹏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('32942b384d3148d1a1bed41a39a61b54', 89, 0, 1417, 0, 30, 2410, 0, 2582, 2660, 1418, 0, 0, 0, 0, 2126, 0, 0, '太原学院', '事业', '01', 10606, '074001', NULL, 8480, '140102197712140628', '杨海丽', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('32aaea8ff3fc4573b75ce2a1fa14bcb4', 94, 0, 1613, 50, 0, 3455, 0, 2375, 2800, 1810, 0, 0, 0, 0, 2420, 0, 0, '太原学院', '事业', '01', 12197, '074001', NULL, 9777, '140103197903015738', '赵雨竹', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('32d8e0e4dc8041cc872920e30b8d70f5', 89, 0, 1361, 50, 30, 2185, 0, 2375, 2660, 1418, 0, 0, 0, 0, 2042, 0, 0, '太原学院', '事业', '01', 10168, '074001', NULL, 8126, '15262619800101332X', '杨素宜', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('33d10068d469455c82cf0b686cbaeafe', 89, 0, 1351, 0, 30, 2410, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2027, 0, 0, '太原学院', '事业', '01', 9933, '074001', NULL, 7906, '140121198204123526', '刘二娟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('33d57ecabcd24328a13defaf4d85149e', 89, 0, 1414, 50, 0, 2410, 0, 2582, 2660, 1418, 0, 0, 0, 0, 2121, 0, 0, '太原学院', '事业', '01', 10623, '074001', NULL, 8502, '142228197807110019', '张献军', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('33fbb7b0188b46cba7b0bc877e6cd507', 99, 0, 1503, 0, 30, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2255, 0, 0, '太原学院', '事业', '01', 11207, '074001', NULL, 8952, '140112198110101303', '梁丽娜', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('346995483a8344d08b120e0aeeaabd38', 89, 0, 1352, 0, 30, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2028, 0, 0, '太原学院', '事业', '01', 10034, '074001', NULL, 8006, '140102197901235167', '弓艳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3496fcaabf944cbeba8685b9d7dd73ef', 74, 0, 1137, 0, 30, 1925, 0, 1169, 2520, 1215, 0, 0, 0, 0, 1706, 0, 0, '太原学院', '事业', '01', 8070, '074001', NULL, 6364, '141102199312070122', '郝书帆', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('34c95af2dee54252a298249bc6f88633', 89, 0, 1443, 0, 0, 2410, 0, 2689, 2660, 1418, 0, 0, 0, 0, 2165, 0, 0, '太原学院', '事业', '01', 10709, '074001', NULL, 8544, '142202197511200337', '谢中柱', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('34cf0b4edf9646bdbf4b3ff49e450d0e', 89, 0, 1396, 0, 30, 2650, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2094, 0, 0, '太原学院', '事业', '01', 10418, '074001', NULL, 8324, '140109198106211560', '张融', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('34eb84a49fb842f98ee8431bc6944a7b', 89, 0, 1297, 0, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1946, 0, 0, '太原学院', '事业', '01', 9561, '074001', NULL, 7615, '140105198312210547', '刘旭峰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('34f481513859476189679c159623fcd4', 74, 0, 1078, 0, 0, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1617, 0, 0, '太原学院', '事业', '01', 7746, '074001', NULL, 6129, '140107199511240017', '郑孟曜', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('354132b82c404f1f95ff790b844e9832', 99, 0, 1458, 0, 0, 3030, 0, 1789, 2730, 1540, 0, 0, 0, 0, 2187, 0, 0, '太原学院', '事业', '01', 10646, '074001', NULL, 8459, '140107198503180013', '杨鹏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('356cd0a3c8e44799870eaa6f405da2ee', 89, 0, 1309, 50, 30, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 1964, 0, 0, '太原学院', '事业', '01', 9716, '074001', NULL, 7752, '140106198406212523', '程晓洁', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('35da80467b36444abed4fb564779f464', 99, 0, 1562, 50, 30, 3260, 0, 2375, 2730, 1540, 0, 0, 0, 0, 2343, 0, 0, '太原学院', '事业', '01', 11646, '074001', NULL, 9303, '142701198102183623', '霍霄妮', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('35f6f6f781684c208eefd8f6c4292567', 89, 0, 1333, 50, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2000, 0, 0, '太原学院', '事业', '01', 9840, '074001', NULL, 7840, '140103198201270640', '王蕾', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3624516a23784dfb86e64519405a8c5e', 99, 0, 1508, 0, 0, 3260, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2262, 0, 0, '太原学院', '事业', '01', 11312, '074001', NULL, 9050, '140103198008293373', '李渊', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('36400576ed594f24bdb5fe35201ec0a4', 89, 0, 971, 0, 30, 2934, 0, 2620, 0, 1386, 0, 0, 0, 0, 1457, 0, 0, '太原学院', '事业', '01', 8030, '074001', NULL, 6573, '140102197107212021', '杨晓慧', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('36477595cdb24a6898277cd6b39226f6', 89, 0, 1320, 0, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1980, 0, 0, '太原学院', '事业', '01', 9777, '074001', NULL, 7797, '142401198301302422', '樊永晔', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('369a3eae22d54fbbad2f112df77b495c', 99, 0, 1465, 50, 0, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2198, 0, 0, '太原学院', '事业', '01', 10989, '074001', NULL, 8791, '140602198110041739', '张晓明', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('371f896ee6674cfca10bf84609660968', 69, 3.5, 1339, 0, 0, 2260, 0, 2041, 2590, 1365, 0, 0, 0, 0, 2009, 0, 0, '太原学院', '事业', '01', 9667.5, '074001', NULL, 7658.5, '140102197503276510', '张义强', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('37707a5fc3cf469bb21b05f9fb45391f', 89, 0, 1387, 0, 30, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2081, 0, 0, '太原学院', '事业', '01', 10269, '074001', NULL, 8188, '142432197702221228', '郭红霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('37a7b3aefe554a4ab7c55789736dbc92', 74, 0, 1134, 0, 30, 1925, 0, 1339, 2520, 1215, 0, 0, 0, 0, 1701, 0, 0, '太原学院', '事业', '01', 8237, '074001', NULL, 6536, '142731199010270327', '刘洋', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('37f50246fc464e6d97050d3af9ec0ef0', 74, 0, 1132, 0, 30, 1925, 0, 1251, 2520, 1215, 0, 0, 0, 0, 1698, 0, 0, '太原学院', '事业', '01', 8147, '074001', NULL, 6449, '140402199111280444', '张迪', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3805cb614d54467a906ff90b657210ba', 89, 0, 1339, 0, 30, 2410, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2009, 0, 0, '太原学院', '事业', '01', 9921, '074001', NULL, 7912, '140121198403273527', '陈瑞婷', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3832d95842bc4116aa6859dbc6ddfaea', 89, 0, 1233, 0, 0, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1850, 0, 0, '太原学院', '事业', '01', 8924, '074001', NULL, 7074, '370882199011054710', '滕宇帆', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('388513bf1d4449e1b199128f08d894bf', 89, 0, 1238, 0, 30, 2185, 0, 1427, 2660, 1418, 0, 0, 0, 0, 1857, 0, 0, '太原学院', '事业', '01', 9047, '074001', NULL, 7190, '140424199006294842', '李泽琳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('39a7af06d7864f4f8fa27628ded631dc', 89, 0, 1267, 0, 0, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1901, 0, 0, '太原学院', '事业', '01', 9222, '074001', NULL, 7321, '140211198204263310', '乔永胜', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('39c14b5b90d4494094fd475be053e64b', 89, 0, 1314, 0, 30, 2410, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1971, 0, 0, '太原学院', '事业', '01', 9710, '074001', NULL, 7739, '140105198201051846', '张金萍', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('39c7b39f481345568dd4e22bf4673db2', 74, 0, 1077, 0, 30, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1616, 0, 0, '太原学院', '事业', '01', 7704, '074001', NULL, 6088, '142429199809122829', '张晓薇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('39fbd39f946542b5aab3c3b2732e605c', 99, 0, 1481, 0, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2222, 0, 0, '太原学院', '事业', '01', 11085, '074001', NULL, 8863, '140511198209292360', '魏丽芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3a25cf1538634d60992ae30148b58cd5', 89, 0, 1298, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1947, 0, 0, '太原学院', '事业', '01', 9376, '074001', NULL, 7429, '140107198505281723', '王晶', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3a70f10f9cb542b689ce0de93fec1be7', 99, 0, 1413, 0, 30, 3030, 0, 1696, 2730, 1540, 0, 0, 0, 0, 2120, 0, 0, '太原学院', '事业', '01', 10538, '074001', NULL, 8418, '142703198511170367', '周琳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3a7d6b512dee47459d611b7fd1a1520e', 99, 0, 1550, 0, 30, 3260, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2325, 0, 0, '太原学院', '事业', '01', 11684, '074001', NULL, 9359, '140104197708152223', '任洁', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3a818d994e06453a83de12229661ea02', 99, 0, 1724, 0, 30, 3810, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2586, 0, 0, '太原学院', '事业', '01', 13199, '074001', NULL, 10613, '142701197005151262', '靳丽华', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3abaf124feef47ed8107f210120b6b2f', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '太原学院', '事业', '01', 105413, '074001', NULL, 105413, '140110198307071547', '韩婷婷', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3bc16209d1c542a8bdf13bbd08cc6c31', 89, 0, 1188, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1782, 0, 0, '太原学院', '事业', '01', 8627, '074001', NULL, 6845, '141125199203025431', '刘亮亮', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3bd8ed85dddd48b99451db2d51abc57c', 89, 0, 1298, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1947, 0, 0, '太原学院', '事业', '01', 9376, '074001', NULL, 7429, '142603198804082023', '徐璐', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3bec2927d5f8450582ee030bfac81e38', 89, 0, 1205, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1808, 0, 0, '太原学院', '事业', '01', 8756, '074001', NULL, 6948, '140121199112200621', '刘洋', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3c1f15a844f44f8db407af5a083aea48', 89, 0, 1307, 50, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1961, 0, 0, '太原学院', '事业', '01', 9621, '074001', NULL, 7660, '142601198607082128', '张月', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3c59c1b6fac84cdaab383107550df4fe', 104, 0, 1804, 0, 30, 4640, 0, 2275, 2940, 1908, 0, 0, 0, 0, 2706, 0, 0, '太原学院', '事业', '01', 13701, '074001', NULL, 10995, '130622198012072420', '代红艳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3c73daa4ca054c319274397571d3dff9', 89, 0, 1322, 50, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1983, 0, 0, '太原学院', '事业', '01', 9829, '074001', NULL, 7846, '142302198107230542', '杨艳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3ca22fc8a9264a5cb3abe9cb97152b10', 104, 0, 2020, 0, 0, 4640, 0, 3781, 2940, 1908, 0, 0, 0, 0, 3030, 0, 0, '太原学院', '事业', '01', 15393, '074001', NULL, 12363, '140104197001062216', '贾文强', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3cb932f161144426a01ba91c3d50e0b2', 89, 0, 1252, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1878, 0, 0, '太原学院', '事业', '01', 8973, '074001', NULL, 7095, '140121199109130829', '王茹', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3cc990a4c0dc4505b05a2b45b0071337', 74, 0, 1205, 0, 30, 1925, 0, 1882, 2520, 1215, 0, 0, 0, 0, 1808, 0, 0, '太原学院', '事业', '01', 8851, '074001', NULL, 7043, '140102198007256523', '崔静', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3cdbefb4f7b5486e89e21041ab34abbf', 89, 0, 1188, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1782, 0, 0, '太原学院', '事业', '01', 8627, '074001', NULL, 6845, '142301199306100036', '张城瑞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3cf554b565064900bfaba1cd3eef9973', 89, 0, 1309, 50, 30, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 1964, 0, 0, '太原学院', '事业', '01', 9716, '074001', NULL, 7752, '140102198211183421', '张慧敏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3d851936fde34549a09835edb9b81280', 74, 0, 1258, 0, 30, 1950, 0, 2075, 2520, 1215, 0, 0, 0, 0, 1887, 0, 0, '太原学院', '事业', '01', 9122, '074001', NULL, 7235, '14031119810920182X', '张瑞芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3d9edf1265564bf2bf3409dd2fa7f9a3', 89, 0, 1205, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1808, 0, 0, '太原学院', '事业', '01', 8756, '074001', NULL, 6948, '142326199303042720', '李新花', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3de2a3d65fb445218e9705959926ed9f', 99, 0, 1440, 0, 0, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2160, 0, 0, '太原学院', '事业', '01', 10721, '074001', NULL, 8561, '140106198511121236', '曹翔宇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3e2c22f5acf64a73ade61f67def8600d', 89, 0, 1252, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1878, 0, 0, '太原学院', '事业', '01', 8973, '074001', NULL, 7095, '142322199009184028', '郝丽萍', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3e2f685f268e4a11bfdb5cce81eaf707', 99, 0, 1488, 50, 30, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2232, 0, 0, '太原学院', '事业', '01', 11242, '074001', NULL, 9010, '140102198207113420', '李宁宁', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3e388f1413eb4f439429d711cd6f98d1', 69, 0, 1165, 0, 30, 1925, 0, 1515, 2520, 1215, 0, 0, 0, 0, 1748, 0, 0, '太原学院', '事业', '01', 8439, '074001', NULL, 6691, '140121198301197228', '杨亚玲', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3e38bdf5e9f049cfad3615160531682f', 89, 0, 1214, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1821, 0, 0, '太原学院', '事业', '01', 8765, '074001', NULL, 6944, '140522199011079760', '马凯莉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3e6fecef39b8491db8010c3099fd56fd', 74, 0, 1205, 0, 30, 1925, 0, 1882, 2520, 1215, 0, 0, 0, 0, 1808, 0, 0, '太原学院', '事业', '01', 8851, '074001', NULL, 7043, '140121198402290624', '张智娟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3e93cc1f61a94016afafcc1f35b6c6e1', 74, 0, 1082, 0, 30, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1623, 0, 0, '太原学院', '事业', '01', 7709, '074001', NULL, 6086, '140525199709188722', '刘慧泽', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3e95b853f82c4875bfc269b8763bb20a', 89, 0, 1309, 0, 30, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 1964, 0, 0, '太原学院', '事业', '01', 9666, '074001', NULL, 7702, '142726198402283922', '吴静', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3ec894fea63e431aa38b2abb0f033a73', 94, 0, 1475, 50, 0, 2880, 0, 2175, 2730, 1551, 0, 0, 0, 0, 2213, 0, 0, '太原学院', '事业', '01', 10955, '074001', NULL, 8742, '140103197804024217', '杜杰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3ee56889940447838524f4e9fcf7b9f7', 89, 0, 1215, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1823, 0, 0, '太原学院', '事业', '01', 8654, '074001', NULL, 6831, '142601199408118516', '李锋锋', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3f0694c31785476dba847414191b220e', 94, 0, 1712, 0, 0, 3455, 0, 3141, 2800, 1810, 0, 0, 0, 0, 2568, 0, 0, '太原学院', '事业', '01', 13012, '074001', NULL, 10444, '142724197203181256', '姚晓黎', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3f3fe57578bc4c4fb47084b66a55cf2a', 99, 0, 1601, 0, 30, 3260, 0, 2796, 2730, 1540, 0, 0, 0, 0, 2402, 0, 0, '太原学院', '事业', '01', 12056, '074001', NULL, 9654, '140103197402170027', '谭丽燕', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3f49447daff144908403ee3d733fd4ad', 89, 0, 1205, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1808, 0, 0, '太原学院', '事业', '01', 8756, '074001', NULL, 6948, '140212199209233365', '王彩凤', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3f5b096cda8c4f7d9ba7c78792919540', 74, 0, 1095, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1643, 0, 0, '太原学院', '事业', '01', 7793, '074001', NULL, 6150, '140402199611160422', '王卓然', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3f8382feb5f64c2cbfcf7bae0c1bffa2', 79, 0, 1240, 0, 0, 2200, 0, 1696, 2590, 1292, 0, 0, 0, 0, 1860, 0, 0, '太原学院', '事业', '01', 9097, '074001', NULL, 7237, '140107198712062216', '王宁', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('3fb2550ba1f74f8481fb729f5db6b2df', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '142727199408295028', '马恩娟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('411e044b69cc4aa6a91ba080c8273fdc', 99, 0, 1524, 0, 30, 3260, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2286, 0, 0, '太原学院', '事业', '01', 11458, '074001', NULL, 9172, '14222719781004102X', '刘小英', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('414dcb5a10f14c26a9a83752dad13acb', 89, 0, 1362, 0, 30, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2043, 0, 0, '太原学院', '事业', '01', 10044, '074001', NULL, 8001, '140502198410142288', '张丽娜', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4174b9ce73a0492cae11f79473f5733b', 89, 0, 1392, 50, 0, 2650, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2088, 0, 0, '太原学院', '事业', '01', 10434, '074001', NULL, 8346, '142601198007011932', '王勇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('41848ed672c04e958148cf388602eb2c', 99, 0, 1497, 0, 30, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2246, 0, 0, '太原学院', '事业', '01', 11201, '074001', NULL, 8955, '14010219820125402X', '李芙蓉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4187f35e55d14c9ab3121324c0f43e13', 89, 0, 1273, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1910, 0, 0, '太原学院', '事业', '01', 9351, '074001', NULL, 7441, '142732198611210428', '董慧芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4189473320f7499192c61e907efab2bc', 99, 4.8, 1874, 0, 30, 3810, 0, 4341, 2730, 1540, 0, 0, 0, 0, 2811, 0, 0, '太原学院', '事业', '01', 14428.8, '074001', NULL, 11617.8, '140103196512205740', '马红梅', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('41956127f918489d87b7cc8c04251d2e', 99, 0, 1649, 0, 0, 3260, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2474, 0, 0, '太原学院', '事业', '01', 12544, '074001', NULL, 10070, '140102196902245151', '武岿', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('41c17636acc642cea2d20f6ec46cafe1', 99, 0, 1468, 0, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2202, 0, 0, '太原学院', '事业', '01', 10972, '074001', NULL, 8770, '142401198310160921', '郄瑞丽', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('420c4b6bb16644b6b90342562843d256', 89, 0, 1365, 50, 30, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2048, 0, 0, '太原学院', '事业', '01', 10197, '074001', NULL, 8149, '140311198109163325', '郭燕燕', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('421b4477473a460a81c7c167520a54d3', 89, 0, 1441, 0, 0, 2650, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2162, 0, 0, '太原学院', '事业', '01', 10733, '074001', NULL, 8571, '140102197904141430', '朱震峰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('42991a9a33b84c7fb3ab2bd908ba3488', 69, 0, 1049, 0, 0, 1925, 0, 639, 2520, 1215, 0, 0, 0, 0, 1574, 0, 0, '太原学院', '事业', '01', 7417, '074001', NULL, 5843, '652926200004151714', '阿布都外力·阿布里克木', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('42ea1c7ef11848be89209c6c1d3d2086', 89, 0, 1282, 50, 0, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1923, 0, 0, '太原学院', '事业', '01', 9473, '074001', NULL, 7550, '142423198501270611', '张元元', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('435400c99401419586580f87e1f39062', 99, 0, 1545, 0, 0, 3030, 0, 2689, 2730, 1540, 0, 0, 0, 0, 2318, 0, 0, '太原学院', '事业', '01', 11633, '074001', NULL, 9315, '142733197603130331', '黄起才', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4371d32d719a47819b931ee68c4b4e07', 104, 0, 1815, 0, 30, 4640, 0, 2275, 2940, 1908, 0, 0, 0, 0, 2723, 0, 0, '太原学院', '事业', '01', 13712, '074001', NULL, 10989, '130102198109272426', '孙月红', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('437b3e3c1d1d4cfb8ed4347708b31eda', 69, 0, 1338, 0, 0, 2260, 0, 2221, 2590, 1365, 0, 0, 0, 0, 2007, 0, 0, '太原学院', '事业', '01', 9843, '074001', NULL, 7836, '140112197405153210', '薛寅虎', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('439bb761dd3947e2934f8745bac36fd0', 89, 0, 1327, 50, 30, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1991, 0, 0, '太原学院', '事业', '01', 9866, '074001', NULL, 7875, '152104198304170626', '董宏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('43a981bc19094b37b6be166a102303e1', 99, 0, 1767, 0, 30, 3810, 0, 3516, 2730, 1540, 0, 0, 0, 0, 2651, 0, 0, '太原学院', '事业', '01', 13492, '074001', NULL, 10841, '140102197108110641', '康丽军', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('43c1e5c053ef4cbebb7ce81066f3c6d2', 89, 0, 1400, 0, 0, 2410, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2100, 0, 0, '太原学院', '事业', '01', 10452, '074001', NULL, 8352, '412824197609063533', '陈磊刚', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('43d5d2fe155c4254a433af1fb06f798d', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '130603199202152160', '杜洋洋', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('43e647f746f84c71b2a4f9a2b4500697', 74, 0, 1081, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1622, 0, 0, '太原学院', '事业', '01', 7779, '074001', NULL, 6157, '142401199511171445', '张雯', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('443228a1f2294b07b05515c0d965d086', 89, 0, 1294, 0, 0, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1941, 0, 0, '太原学院', '事业', '01', 9528, '074001', NULL, 7587, '140302198106161352', '陈亮', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4461ce4bdb5e4614ae823c49a91be623', 99, 0, 1878, 0, 0, 3810, 0, 4481, 2730, 1540, 0, 0, 0, 0, 2817, 0, 0, '太原学院', '事业', '01', 14538, '074001', NULL, 11721, '140103196510302731', '王建伟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('44c3bccde5b7478ba9ba67fff25afce2', 99, 0, 1530, 0, 30, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2295, 0, 0, '太原学院', '事业', '01', 11434, '074001', NULL, 9139, '140123197910140022', '曹宏宏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4504f9c3da394c9ea47440db1f0f86a4', 89, 0, 1037, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1556, 0, 0, '太原学院', '事业', '01', 8394, '074001', NULL, 6838, '370612199503050038', '赵春全', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4515c915221b4712a4c3883fd48f6013', 89, 0, 1310, 0, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1965, 0, 0, '太原学院', '事业', '01', 9481, '074001', NULL, 7516, '142329198510202322', '牛亚群', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('455292114f924ea083dd95e720212b58', 99, 0, 1455, 0, 30, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2183, 0, 0, '太原学院', '事业', '01', 10859, '074001', NULL, 8676, '140109198303291520', '冯慧瑛', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('45773009ee44484b9f6252f8cfaf362a', 74, 0, 1203, 50, 30, 1925, 0, 1789, 2520, 1215, 0, 0, 0, 0, 1805, 0, 0, '太原学院', '事业', '01', 8806, '074001', NULL, 7001, '140106198504062522', '沙荣', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4597d04c1ec64592ab9706b6eca5d996', 99, 0, 1516, 0, 0, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2274, 0, 0, '太原学院', '事业', '01', 11190, '074001', NULL, 8916, '142223197809182735', '徐彦峰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('45bc5b00f0e044c7af47bdaaf73f47ad', 89, 0, 1378, 0, 30, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2067, 0, 0, '太原学院', '事业', '01', 10260, '074001', NULL, 8193, '142625197804221664', '史云青', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4630ae1e030a44c393f754ded7a83d14', 89, 0, 1309, 50, 30, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 1964, 0, 0, '太原学院', '事业', '01', 9716, '074001', NULL, 7752, '140402198308251247', '申羽佳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('465354427ac2453883f1897f3c812a44', 89, 0, 1352, 50, 30, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 2028, 0, 0, '太原学院', '事业', '01', 9891, '074001', NULL, 7863, '142603198509202029', '武婧', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('472fef8b0b4d4cf2a5c197ef4a5c1d13', 89, 0, 1295, 0, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1943, 0, 0, '太原学院', '事业', '01', 9466, '074001', NULL, 7523, '14270219870202274X', '明小菊', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4754638608fe4b729bc067d7c6e3528d', 89, 0, 1215, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1823, 0, 0, '太原学院', '事业', '01', 8848, '074001', NULL, 7025, '140107198908211228', '张文静', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('47add52c87274e68a9c1512866e70386', 89, 0, 1320, 50, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1980, 0, 0, '太原学院', '事业', '01', 9634, '074001', NULL, 7654, '140107198210201220', '杨雅琴', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('47d81f2cf7f0490c94e2305442e67700', 89, 0, 1273, 50, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1910, 0, 0, '太原学院', '事业', '01', 9401, '074001', NULL, 7491, '140109198609095127', '李婷婷', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('480b948d5d7c456eb687a5a07980d853', 99, 0, 1468, 0, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2202, 0, 0, '太原学院', '事业', '01', 10972, '074001', NULL, 8770, '140104198102202227', '陈黎', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('480d158f66ea47089d05aad935c79d93', 99, 0, 1443, 0, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2165, 0, 0, '太原学院', '事业', '01', 10754, '074001', NULL, 8589, '142325198208065528', '陶燕贞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('48421e8ab31d474db9a532e3ee99eb45', 99, 0, 1445, 0, 30, 3030, 0, 1696, 2730, 1540, 0, 0, 0, 0, 2168, 0, 0, '太原学院', '事业', '01', 10570, '074001', NULL, 8402, '140105198712020582', '张晨昕', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4890c0afd34b48d889fe5780f3cd4b33', 89, 0, 1165, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1748, 0, 0, '太原学院', '事业', '01', 8604, '074001', NULL, 6856, '140602198711296016', '段海栋', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('48cfdde253934d7c9d1796d189e18956', 99, 0, 1493, 0, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2240, 0, 0, '太原学院', '事业', '01', 10997, '074001', NULL, 8757, '142631198009154927', '王燕丽', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('48e2583c22934c74b0e9293e710e6ad8', 89, 0, 1158, 0, 0, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1737, 0, 0, '太原学院', '事业', '01', 9299, '074001', NULL, 7562, '142422198506152159', '赵志毅', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('48eab6155a4e43ad9d58fbab966cf24b', 89, 0, 1319, 0, 0, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1979, 0, 0, '太原学院', '事业', '01', 9746, '074001', NULL, 7767, '140103198205071534', '李潼', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4907e002af2a4ff182f2fcb9cfdd426e', 99, 0, 1632, 50, 30, 3030, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2448, 0, 0, '太原学院', '事业', '01', 12252, '074001', NULL, 9804, '142622197411162027', '王宏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('491d2b4291f04ae9987f864971ed45dd', 94, 0, 1602, 0, 0, 3455, 0, 2275, 2800, 1810, 0, 0, 0, 0, 2403, 0, 0, '太原学院', '事业', '01', 12036, '074001', NULL, 9633, '140311197803090934', '张勤杰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4944e4da36b943afb6c099744a91d2e0', 89, 0, 1334, 50, 30, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2001, 0, 0, '太原学院', '事业', '01', 9741, '074001', NULL, 7740, '14232219840619054X', '游翔', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('49606557e5a64f8eb5ae1180093c3a1f', 89, 0, 1250, 0, 30, 2185, 0, 1515, 2660, 1418, 0, 0, 0, 0, 1875, 0, 0, '太原学院', '事业', '01', 9147, '074001', NULL, 7272, '140107198809294523', '任超', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('498c05c066674184a7baf27ce4bb1fde', 69, 0, 1200, 0, 30, 1925, 0, 1789, 2520, 1215, 0, 0, 0, 0, 1800, 0, 0, '太原学院', '事业', '01', 8748, '074001', NULL, 6948, '140107198402281720', '于宏飞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4990d7823d0b4309be637a4754379c0d', 89, 0, 1037, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1556, 0, 0, '太原学院', '事业', '01', 8394, '074001', NULL, 6838, '14112819930614001X', '刘勇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('49b0728e754c4ac78495291d35b632ee', 89, 0, 1309, 50, 30, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 1964, 0, 0, '太原学院', '事业', '01', 9716, '074001', NULL, 7752, '14030219820829042X', '鲍芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('49b1eb9aa1c4409cb53fd2dc4e58f354', 99, 0, 1490, 0, 0, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2235, 0, 0, '太原学院', '事业', '01', 10964, '074001', NULL, 8729, '140103198205130653', '石峰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4a22a48ba802419598c530ac92a7ef43', 99, 0, 1628, 0, 0, 3030, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2442, 0, 0, '太原学院', '事业', '01', 12168, '074001', NULL, 9726, '140102197102200013', '刘晋涛', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4a5a753927bc4c12abd84e0c0fc78d8c', 89, 0, 1283, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1925, 0, 0, '太原学院', '事业', '01', 9361, '074001', NULL, 7436, '140109198511290020', '陈婧', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4a5ace9a8dff4667be624fdcfe4d37a3', 79, 0, 1330, 0, 0, 2520, 0, 1882, 2660, 1383, 0, 0, 0, 0, 1995, 0, 0, '太原学院', '事业', '01', 9854, '074001', NULL, 7859, '14010719860320481X', '张秀峰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4a66e66e70f441d995e99aa75b78b9e2', 74, 0, 1091, 0, 30, 1925, 0, 1005, 2520, 1215, 0, 0, 0, 0, 1637, 0, 0, '太原学院', '事业', '01', 7860, '074001', NULL, 6223, '140524199602133020', '宋月宇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4a7739961e7e436f85c6567cdbfe8422', 99, 0, 1455, 50, 30, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2183, 0, 0, '太原学院', '事业', '01', 10909, '074001', NULL, 8726, '220105198402111243', '李文欢', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4a8091c4c11f4ca59bbe40443c81b1fe', 99, 0, 1618, 0, 0, 3260, 0, 3026, 2730, 1540, 0, 0, 0, 0, 2427, 0, 0, '太原学院', '事业', '01', 12273, '074001', NULL, 9846, '140103197307200611', '张煜', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4b15ecc2e46c4188949b5af8b4326668', 99, 0, 1464, 50, 30, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2196, 0, 0, '太原学院', '事业', '01', 10918, '074001', NULL, 8722, '142430198205290021', '任金妮', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4b200da0fa35493d851a6bd93d8859b6', 89, 0, 1198, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1797, 0, 0, '太原学院', '事业', '01', 8637, '074001', NULL, 6840, '140107199206202612', '伦默如', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4b6193b0408f43a4b38ab942c09353c0', 89, 0, 1335, 0, 30, 2185, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2003, 0, 0, '太原学院', '事业', '01', 9892, '074001', NULL, 7889, '140102198107251420', '李陶琳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4bbda8997f46470b84565b137cfb574d', 89, 0, 1332, 50, 0, 2185, 0, 2175, 2660, 1418, 0, 0, 0, 0, 1998, 0, 0, '太原学院', '事业', '01', 9909, '074001', NULL, 7911, '140103197903211210', '李泰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4bc260a3a64447af9ea589f7048814c5', 74, 0, 1081, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1622, 0, 0, '太原学院', '事业', '01', 7779, '074001', NULL, 6157, '140105199408070029', '郭凡琦', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4c6286c3edcb4e1da54fd631396ce001', 99, 0, 1526, 0, 0, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2289, 0, 0, '太原学院', '事业', '01', 11400, '074001', NULL, 9111, '142702197604243018', '徐东亮', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4d7c400131ba4efda2f633a121c23887', 94, 4, 1667, 0, 30, 2880, 0, 3516, 2730, 1551, 0, 0, 0, 0, 2501, 0, 0, '太原学院', '事业', '01', 12472, '074001', NULL, 9971, '140102196710024047', '钱蓉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4db6b652d3e5453fa9532892364e2de0', 94, 0, 1652, 0, 30, 3455, 0, 2689, 2800, 1810, 0, 0, 0, 0, 2478, 0, 0, '太原学院', '事业', '01', 12530, '074001', NULL, 10052, '140103197309204261', '吴慧玲', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4dbe71122a414229a4e3e9be9e1b21a9', 89, 0, 1374, 0, 30, 2185, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2061, 0, 0, '太原学院', '事业', '01', 10231, '074001', NULL, 8170, '140402198002191624', '散利迪', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4dc61267077d430e9917f796f089a908', 74, 0, 1137, 0, 30, 1925, 0, 1169, 2520, 1215, 0, 0, 0, 0, 1706, 0, 0, '太原学院', '事业', '01', 8070, '074001', NULL, 6364, '142433199111140026', '许雅萌', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4dc6d82b05cc4565aeb50b91401f86b7', 89, 0, 1188, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1782, 0, 0, '太原学院', '事业', '01', 8545, '074001', NULL, 6763, '140303199402081614', '张梁', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4dead5b33093475c92392b9c349926a9', 89, 0, 1203, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1805, 0, 0, '太原学院', '事业', '01', 8672, '074001', NULL, 6867, '140481199502086820', '甄家琪', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4dec42497906457c90ac43deeeea4983', 99, 0, 1480, 0, 30, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2220, 0, 0, '太原学院', '事业', '01', 10884, '074001', NULL, 8664, '140103198211104822', '葛坤', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4ded06d25c354a30abd01fc8b4328765', 99, 0, 1587, 0, 30, 3030, 0, 2911, 2730, 1540, 0, 0, 0, 0, 2381, 0, 0, '太原学院', '事业', '01', 11927, '074001', NULL, 9546, '142431197602170025', '严芳芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4df22fb47c4b4c5cbbbe51cd399ec318', 99, 0, 1477, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2216, 0, 0, '太原学院', '事业', '01', 11031, '074001', NULL, 8815, '140181198101044741', '刘芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4e02a07cbb48409f9840e058084b7ffa', 89, 0, 1213, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1820, 0, 0, '太原学院', '事业', '01', 8570, '074001', NULL, 6750, '140108199709291617', '曹胜', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4e2409464983442b859f7b63b38b73a2', 74, 0, 1088, 0, 0, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1632, 0, 0, '太原学院', '事业', '01', 7756, '074001', NULL, 6124, '371522199412057216', '董鹤', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4ec24d0bbbdc4482acc3f66162ecb8ee', 89, 0, 1506, 0, 30, 2410, 0, 3266, 2660, 1418, 0, 0, 0, 0, 2259, 0, 0, '太原学院', '事业', '01', 11379, '074001', NULL, 9120, '142701197101101222', '高军', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4ec4936aa2b94ca386ad886a59898b26', 89, 0, 1246, 0, 0, 2185, 0, 1515, 2660, 1418, 0, 0, 0, 0, 1869, 0, 0, '太原学院', '事业', '01', 9113, '074001', NULL, 7244, '140624198208170115', '邢向阳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4ec4a03bb8df47088b6c58a643ba0fd6', 89, 0, 1215, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1823, 0, 0, '太原学院', '事业', '01', 8848, '074001', NULL, 7025, '142301199204240046', '程丽媛', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4ecf610790984020be312efe5ea674fe', 89, 0, 1331, 0, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1997, 0, 0, '太原学院', '事业', '01', 9788, '074001', NULL, 7791, '140103198110251524', '杨佳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4ed0d11568fe4534ba29969b1f5d56ba', 89, 0, 1309, 0, 30, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 1964, 0, 0, '太原学院', '事业', '01', 9666, '074001', NULL, 7702, '14010719831113002X', '郭家雁', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4ed6991dbac74cbd98f86beb68e9381f', 89, 0, 1043, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1565, 0, 0, '太原学院', '事业', '01', 8430, '074001', NULL, 6865, '652826199104140042', '李俊毅', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4f25da38c47b4eaeb5c9035ed339d25f', 99, 0, 1480, 0, 0, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2220, 0, 0, '太原学院', '事业', '01', 10954, '074001', NULL, 8734, '140102198207251436', '常靖', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4f352d4dd09b43709688e0c870466e0c', 89, 0, 1177, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1766, 0, 0, '太原学院', '事业', '01', 8534, '074001', NULL, 6768, '140107199407040015', '赵子瑞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4f415dd7a189443eaa63113b595ff5e4', 94, 0, 1435, 0, 30, 2880, 0, 1975, 2730, 1551, 0, 0, 0, 0, 2153, 0, 0, '太原学院', '事业', '01', 10695, '074001', NULL, 8542, '421002198106232423', '张霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('4f7bdfadd16c4359b688e4cf629da6eb', 89, 0, 1322, 0, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1983, 0, 0, '太原学院', '事业', '01', 9586, '074001', NULL, 7603, '13012319851212154X', '张硕', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('50113bb2fa104b39aa7da4f0f49fa03d', 69, 0, 1090, 0, 30, 1925, 0, 1005, 2520, 1215, 0, 0, 0, 0, 1635, 0, 0, '太原学院', '事业', '01', 7854, '074001', NULL, 6219, '140581199409260025', '陈思思', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('501fe4793591475e8a7d9c397d47c6d7', 99, 0, 1496, 0, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2244, 0, 0, '太原学院', '事业', '01', 11000, '074001', NULL, 8756, '140105198201180023', '王贇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('504e8db90f5f474790d3eca0e1791679', 89, 0, 1191, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1787, 0, 0, '太原学院', '事业', '01', 8660, '074001', NULL, 6873, '370882199302234228', '白雅雯', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('50851e3240d84df096467a90348373d6', 89, 0, 1431, 0, 30, 2410, 0, 2689, 2660, 1418, 0, 0, 0, 0, 2147, 0, 0, '太原学院', '事业', '01', 10727, '074001', NULL, 8580, '140112197409121726', '杨冰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('50be9041ff24441b83273a993aeefb07', 89, 3.8, 1549, 0, 0, 2650, 0, 3266, 2660, 1418, 0, 0, 0, 0, 2324, 0, 0, '太原学院', '事业', '01', 11635.8, '074001', NULL, 9311.8, '140103196910070036', '田安谷', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('50eb1225749144a0ab51e76520664b69', 99, 0, 1547, 0, 0, 3260, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2321, 0, 0, '太原学院', '事业', '01', 11651, '074001', NULL, 9330, '140322197907140018', '王培军', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('51055eb8c5604a1682c5087dc0fdf4c1', 99, 0, 1524, 0, 30, 3260, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2286, 0, 0, '太原学院', '事业', '01', 11458, '074001', NULL, 9172, '140522198005140049', '孙雅妮', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('51b1714b42cc4231b93006c355b346fc', 79, 0, 1302, 0, 0, 2200, 0, 1975, 2590, 1292, 0, 0, 0, 0, 1953, 0, 0, '太原学院', '事业', '01', 9438, '074001', NULL, 7485, '140103197706270676', '王江浩', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('51b81237686d4d3fa622d7bfcb8a1faf', 89, 0, 1552, 50, 0, 2650, 0, 3141, 2660, 1418, 0, 0, 0, 0, 2328, 0, 0, '太原学院', '事业', '01', 11560, '074001', NULL, 9232, '140402197302243217', '张金辉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('51e9d08365e94b59bd97a7f418e0cd45', 99, 0, 1443, 0, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2165, 0, 0, '太原学院', '事业', '01', 10754, '074001', NULL, 8589, '142724198603071421', '杨天敏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('52244fbf7e11476a8136073935297eeb', 69, 0, 1228, 50, 30, 1925, 0, 1975, 2520, 1215, 0, 0, 0, 0, 1842, 0, 0, '太原学院', '事业', '01', 9012, '074001', NULL, 7170, '14010319811109572X', '单荣芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('52369db1c9c44c1d980d5f15516fd69d', 99, 4.3, 1726, 0, 0, 3260, 0, 3781, 2730, 1540, 0, 0, 0, 0, 2589, 0, 0, '太原学院', '事业', '01', 13140.3, '074001', NULL, 10551.3, '140102196701162317', '武旭锦', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('52408628eb2d499ebd8841dcbfe1121c', 89, 0, 1261, 50, 30, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1892, 0, 0, '太原学院', '事业', '01', 9296, '074001', NULL, 7404, '14010719890205222X', '张怡', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5246cef024d64f228c089f77920a8357', 99, 0, 1520, 50, 30, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2280, 0, 0, '太原学院', '事业', '01', 11474, '074001', NULL, 9194, '142601198003051929', '李晓华', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('525203d7e4a14592a97630c9a9fcde85', 69, 4, 1328, 0, 0, 2260, 0, 2221, 2590, 1365, 0, 0, 0, 0, 1992, 0, 0, '太原学院', '事业', '01', 9837, '074001', NULL, 7845, '140103197506040657', '唐嘉尧', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5318a94fd9d84a42878cac9e8e8f4ee4', 89, 0, 1054, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1581, 0, 0, '太原学院', '事业', '01', 8523, '074001', NULL, 6942, '142422199407212421', '程升彦', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('533ccb9670674db2b4b63b07571e5d76', 99, 0, 1550, 0, 30, 3260, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2325, 0, 0, '太原学院', '事业', '01', 11684, '074001', NULL, 9359, '142123197811060520', '温成荣', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('538cf4b05b954a4198430bf890e4f7e7', 89, 0, 1399, 0, 0, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2099, 0, 0, '太原学院', '事业', '01', 10251, '074001', NULL, 8152, '140424197708300013', '黄海波', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('53cad6b0fe27482e81f4021f96b5a010', 89, 0, 1327, 0, 30, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1991, 0, 0, '太原学院', '事业', '01', 9816, '074001', NULL, 7825, '142402198409224522', '赵军芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5407a0c9fb92484cb793e284fe134cce', 74, 0, 1213, 0, 0, 1925, 0, 1975, 2520, 1215, 0, 0, 0, 0, 1820, 0, 0, '太原学院', '事业', '01', 8922, '074001', NULL, 7102, '371121198001010015', '郑鹏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('541ed11a87de4a1a8d0c0863b822678b', 99, 0, 1491, 0, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2237, 0, 0, '太原学院', '事业', '01', 11095, '074001', NULL, 8858, '140102198201256527', '徐杨', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5461835d2acc41b88659e64c6ae35063', 89, 0, 1377, 0, 30, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2066, 0, 0, '太原学院', '事业', '01', 10059, '074001', NULL, 7993, '140202198109302549', '刘晶', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('54b187c35f72405e8b33bcead297ecb6', 94, 0, 1446, 0, 30, 2880, 0, 1975, 2730, 1551, 0, 0, 0, 0, 2169, 0, 0, '太原学院', '事业', '01', 10706, '074001', NULL, 8537, '140102198005135226', '赵甜甜', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('55286dd9ff1343a8b07f62befd21f691', 89, 0, 1227, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1841, 0, 0, '太原学院', '事业', '01', 8948, '074001', NULL, 7107, '410521199406303527', '张晶晶', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('554079f64d0a4a5fbcd1952d0eebc26b', 89, 0, 1334, 50, 30, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2001, 0, 0, '太原学院', '事业', '01', 9741, '074001', NULL, 7740, '142226198209194920', '智艳丽', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('55520a0e2f1848c29ef77c5828e8ab25', 99, 0, 1658, 0, 0, 3260, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2487, 0, 0, '太原学院', '事业', '01', 12428, '074001', NULL, 9941, '140104197404152259', '赵刚', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('557ab8d66cbd4d72be05591fa9e9a55e', 94, 4, 1798, 0, 30, 3455, 0, 3516, 2800, 1810, 0, 0, 0, 0, 2697, 0, 0, '太原学院', '事业', '01', 13507, '074001', NULL, 10810, '14010319670211214X', '张文梅', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5581288fd0754d0c92e90a908e93f23c', 89, 0, 1050, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1575, 0, 0, '太原学院', '事业', '01', 8437, '074001', NULL, 6862, '140107199308234527', '白雪赟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5582b63161b04ff89a49c878c8fa172c', 79, 0, 1385, 50, 30, 2520, 0, 2175, 2660, 1383, 0, 0, 0, 0, 2078, 0, 0, '太原学院', '事业', '01', 10282, '074001', NULL, 8204, '140102198006076547', '苏文丽', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('55d9d073c8264454887d7498b98bbbc9', 99, 0, 1585, 0, 30, 3260, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2378, 0, 0, '太原学院', '事业', '01', 11719, '074001', NULL, 9341, '140426197704040026', '张艳永', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('55dbc23f6a2e4a0994e4fc5aa049ab35', 99, 4.5, 1828, 0, 30, 3810, 0, 4061, 2730, 1540, 0, 0, 0, 0, 2742, 0, 0, '太原学院', '事业', '01', 14102.5, '074001', NULL, 11360.5, '142601196703151921', '张代会', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('55f3b890ed8c4c7593614682eec12816', 89, 0, 1438, 0, 30, 2410, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2157, 0, 0, '太原学院', '事业', '01', 10520, '074001', NULL, 8363, '142430197812080064', '高晓燕', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('55fbb54306d648c7bb97afeacad792e4', 74, 0, 1093, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1640, 0, 0, '太原学院', '事业', '01', 7791, '074001', NULL, 6151, '140106199511131842', '高佳玲', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('55febaf410724b76b511af739a7127f9', 89, 0, 1181, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1772, 0, 0, '太原学院', '事业', '01', 8568, '074001', NULL, 6796, '142202199512144567', '付国霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('56084e9d1f4f4b6182ef65723b7cb6c2', 89, 0, 1191, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1787, 0, 0, '太原学院', '事业', '01', 8630, '074001', NULL, 6843, '130435199010031516', '谷志朋', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('56b6c27498374a93adf95ae7548b500e', 89, 0, 1201, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1802, 0, 0, '太原学院', '事业', '01', 8922, '074001', NULL, 7120, '14232519900515252X', '裴婷', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('56c7690aacef46f588d8c3931148c3e8', 99, 0, 1477, 0, 0, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2216, 0, 0, '太原学院', '事业', '01', 10851, '074001', NULL, 8635, '140621198001133115', '杨宝军', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('56f44f91ba4f4a3e8b344b3ac97cd421', 89, 0, 1324, 50, 30, 2410, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1986, 0, 0, '太原学院', '事业', '01', 9770, '074001', NULL, 7784, '140122198505281129', '潘晓霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('574cbf30623c4146a64496cb3f5e5da2', 104, 0, 1962, 0, 30, 5220, 0, 2911, 2940, 1908, 0, 0, 0, 0, 2943, 0, 0, '太原学院', '事业', '01', 15075, '074001', NULL, 12132, '142226197204137420', '张先平', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('576bd28ee9f24457b1c1234f70adc7f5', 79, 0, 1276, 50, 0, 2200, 0, 1882, 2590, 1292, 0, 0, 0, 0, 1914, 0, 0, '太原学院', '事业', '01', 9369, '074001', NULL, 7455, '140106198305272519', '牛晓亮', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('57b9cc5f996d47ad957590f2d96f2ee2', 69, 0, 1316, 0, 0, 2260, 0, 2128, 2590, 1365, 0, 0, 0, 0, 1974, 0, 0, '太原学院', '事业', '01', 9728, '074001', NULL, 7754, '140104197210292712', '朱道宏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('58527f55b19e419c9ce5d4a302676b1f', 89, 0, 1213, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1820, 0, 0, '太原学院', '事业', '01', 8570, '074001', NULL, 6750, '142629199207182518', '薛欣', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5856d1ca962d4853ada34ac08a6966d0', 89, 0, 1389, 50, 30, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2084, 0, 0, '太原学院', '事业', '01', 10321, '074001', NULL, 8237, '142202197811070968', '苑丽英', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('589968a624c44172b1c365b1ccaa9789', 89, 0, 1238, 0, 30, 2185, 0, 1427, 2660, 1418, 0, 0, 0, 0, 1857, 0, 0, '太原学院', '事业', '01', 9047, '074001', NULL, 7190, '140106199001223069', '王天', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('58fd1b4d110f4ea2a0c7bc414772014b', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '140108199807293923', '张睿芝', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5955d53288fb465b8a23492e115f2e26', 94, 0, 1526, 50, 0, 2880, 0, 2689, 2730, 1551, 0, 0, 0, 0, 2289, 0, 0, '太原学院', '事业', '01', 11520, '074001', NULL, 9231, '140121197803165512', '秦永刚', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('597cf45ca167412a8091d92b797b69f8', 89, 0, 1216, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1824, 0, 0, '太原学院', '事业', '01', 8603, '074001', NULL, 6779, '140602199606209042', '贾倩楠', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('59894035aa4747feb95acdcd16915a07', 89, 0, 1361, 0, 30, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2042, 0, 0, '太原学院', '事业', '01', 10043, '074001', NULL, 8001, '140103198211041526', '王玉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5997ce198c0347eab036e5d44a8a60d2', 74, 0, 1106, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1659, 0, 0, '太原学院', '事业', '01', 7804, '074001', NULL, 6145, '14012119941108152X', '贾洁', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('59e60dc75d444cf19cdbdeba1bfbbc2e', 89, 0, 1473, 0, 0, 2650, 0, 2796, 2660, 1418, 0, 0, 0, 0, 2210, 0, 0, '太原学院', '事业', '01', 11086, '074001', NULL, 8876, '140121197601042514', '郭小杰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5a0f2591b4344a0f9e5ab5a321ce2d94', 89, 0, 1414, 0, 0, 2650, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2121, 0, 0, '太原学院', '事业', '01', 10506, '074001', NULL, 8385, '142723197911203317', '李建军', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5a6659e03e2b4edc9f2bfe9e53aa9560', 89, 0, 1518, 0, 0, 2650, 0, 3141, 2660, 1418, 0, 0, 0, 0, 2277, 0, 0, '太原学院', '事业', '01', 11476, '074001', NULL, 9199, '140102197009181233', '多刚', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5a9655447d6b4b6ea59a8477fdaa8db1', 89, 0, 1417, 0, 30, 2410, 0, 2582, 2660, 1418, 0, 0, 0, 0, 2126, 0, 0, '太原学院', '事业', '01', 10606, '074001', NULL, 8480, '140122197712081125', '张俊芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5aa3df788f8b4522813d4c34ea9b91a6', 99, 0, 1481, 50, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2222, 0, 0, '太原学院', '事业', '01', 11135, '074001', NULL, 8913, '142701198303201349', '王研', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5ada6686c43a44dfa041f0f95edfa614', 79, 0, 1394, 50, 30, 2520, 0, 2075, 2660, 1383, 0, 0, 0, 0, 2091, 0, 0, '太原学院', '事业', '01', 10191, '074001', NULL, 8100, '140107198205143927', '王晋娟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5b40bc2f8dca41f9a29529ef2165bf95', 69, 0, 1180, 50, 30, 1925, 0, 1696, 2520, 1215, 0, 0, 0, 0, 1770, 0, 0, '太原学院', '事业', '01', 8685, '074001', NULL, 6915, '140102198208161440', '段婷', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5b40f40eaaa3467f9c2a85a25f9b2fec', 99, 0, 1478, 0, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2217, 0, 0, '太原学院', '事业', '01', 10982, '074001', NULL, 8765, '21032319800421226X', '李娜', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5b91d536c20347b1896dc3070afb0422', 89, 0, 1441, 0, 0, 2650, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2162, 0, 0, '太原学院', '事业', '01', 10733, '074001', NULL, 8571, '142424197709156510', '申世明', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5b97e474a674401fb1210e31df4316c8', 89, 0, 1278, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1917, 0, 0, '太原学院', '事业', '01', 9356, '074001', NULL, 7439, '142225198105100524', '白利霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5be3a5a3ba804a70b593a5fc2ede694b', 99, 0, 1575, 0, 30, 3260, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2363, 0, 0, '太原学院', '事业', '01', 11709, '074001', NULL, 9346, '140102197706281440', '昝红宇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5cd6a1ba3b42446d849a01a79a7bee1d', 99, 0, 1478, 0, 0, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2217, 0, 0, '太原学院', '事业', '01', 11052, '074001', NULL, 8835, '140102198003033410', '张晓鹏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5d0d86ee0ec44a06918ad40d403ef5e9', 104, 0, 1901, 0, 0, 4640, 0, 2796, 2940, 1908, 0, 0, 0, 0, 2852, 0, 0, '太原学院', '事业', '01', 14289, '074001', NULL, 11437, '140103197506235710', '刘彬', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5d390baaa3aa4f9a947ced6e335e003e', 89, 0, 1215, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1823, 0, 0, '太原学院', '事业', '01', 8848, '074001', NULL, 7025, '142332199108243620', '许改云', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5d5d96c10d7442f0a39c88b9eb63dbde', 89, 0, 1332, 0, 0, 2185, 0, 2175, 2660, 1418, 0, 0, 0, 0, 1998, 0, 0, '太原学院', '事业', '01', 9859, '074001', NULL, 7861, '140105198302030016', '张超', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5d793d5d966a4fb9b3a7cb298fb4957b', 89, 0, 1177, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1766, 0, 0, '太原学院', '事业', '01', 8534, '074001', NULL, 6768, '140322199411280016', '贾亦非', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5d9dbfd1dc91454fad5e46fdf90a2000', 89, 0, 1191, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1787, 0, 0, '太原学院', '事业', '01', 8660, '074001', NULL, 6873, '140105199404171869', '张曦', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5dc97b8798f54b5a83237964d283615c', 89, 0, 1319, 50, 0, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1979, 0, 0, '太原学院', '事业', '01', 9796, '074001', NULL, 7817, '140103198205144211', '金烨', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5df78302309947b7a3055118dd6d2b7f', 74, 0, 1081, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1622, 0, 0, '太原学院', '事业', '01', 7779, '074001', NULL, 6157, '140108199606194224', '李星儒', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5e1752abd8cd46ff808168b1ee6df3b3', 89, 0, 1191, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1787, 0, 0, '太原学院', '事业', '01', 8630, '074001', NULL, 6843, '142625199301273314', '陈文兵', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5e20051e73c44dee8bf810d355a9519e', 89, 0, 1205, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1808, 0, 0, '太原学院', '事业', '01', 8756, '074001', NULL, 6948, '140603199101111046', '李婧', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5e286a10f769456aa5b7e43f0b3b6558', 74, 0, 1192, 0, 30, 1925, 0, 1789, 2520, 1215, 0, 0, 0, 0, 1788, 0, 0, '太原学院', '事业', '01', 8745, '074001', NULL, 6957, '140402198302100421', '张敏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5ebb09ba4c9f499085e75a710313cfb0', 104, 0, 1777, 0, 30, 4640, 0, 2075, 2940, 1908, 0, 0, 0, 0, 2666, 0, 0, '太原学院', '事业', '01', 13474, '074001', NULL, 10808, '140624198209042043', '魏玲', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5ed123f1ff4b4420a9ef91b864ef40f3', 74, 0, 1233, 50, 30, 1950, 0, 2075, 2520, 1215, 0, 0, 0, 0, 1850, 0, 0, '太原学院', '事业', '01', 9147, '074001', NULL, 7297, '140311198006140622', '郑丽文', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5f28ca33079d466f97be898f844b310d', 89, 0, 1201, 0, 0, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1802, 0, 0, '太原学院', '事业', '01', 8722, '074001', NULL, 6920, '140427199405118095', '和晨阳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('5f4a1de4d484475cad06381bcfd6e5b2', 89, 0, 1322, 0, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1983, 0, 0, '太原学院', '事业', '01', 9779, '074001', NULL, 7796, '140102198205276525', '贾娟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6017e02fd98845528dc06c082f8b48c6', 69, 0, 1141, 0, 0, 1925, 0, 1427, 2520, 1215, 0, 0, 0, 0, 1712, 0, 0, '太原学院', '事业', '01', 8297, '074001', NULL, 6585, '140107198911043317', '张斌', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6045e0398daf486a9e2ad02ee3512370', 99, 4.2, 1640, 0, 30, 3030, 0, 3391, 2730, 1540, 0, 0, 0, 0, 2460, 0, 0, '太原学院', '事业', '01', 12464.2, '074001', NULL, 10004.2, '140102196911262367', '李雪琴', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('607efb4f4e6d47ab8bfc350cf1b17cd1', 89, 0, 1404, 0, 30, 2410, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2106, 0, 0, '太原学院', '事业', '01', 10486, '074001', NULL, 8380, '140121197707139525', '张慧玲', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6091caa248da46a386da5bf3f46bdc52', 99, 0, 1520, 50, 30, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2280, 0, 0, '太原学院', '事业', '01', 11474, '074001', NULL, 9194, '140103197808303387', '邵红红', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6091dcfa234b48b298b4fb462efbb075', 89, 0, 1270, 0, 0, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1905, 0, 0, '太原学院', '事业', '01', 9318, '074001', NULL, 7413, '140109198702060017', '李之光', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('60935e465ac647728de6457a0006bd42', 89, 0, 1537, 0, 30, 2650, 0, 3266, 2660, 1418, 0, 0, 0, 0, 2306, 0, 0, '太原学院', '事业', '01', 11650, '074001', NULL, 9344, '142602197110281027', '刘俊', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('609a3978447d443e8c0c5e7824e97b40', 89, 0, 1191, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1787, 0, 0, '太原学院', '事业', '01', 8660, '074001', NULL, 6873, '140106199506081828', '郝晴', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('60beb7a32dcb4d0781938b45f64c35ad', 99, 0, 1478, 0, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2217, 0, 0, '太原学院', '事业', '01', 10982, '074001', NULL, 8765, '140311198011260944', '余瑞霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('60d933204e674f65b449834a3e09ea2d', 99, 0, 1607, 0, 30, 3030, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2411, 0, 0, '太原学院', '事业', '01', 12177, '074001', NULL, 9766, '140104197310161760', '李英华', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('61098ba09ae14281968cd8b278351a2c', 99, 0, 1455, 0, 30, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2183, 0, 0, '太原学院', '事业', '01', 10859, '074001', NULL, 8676, '140106198301160624', '李芸屹', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('613b291f5040489485e93a5a0368d5ef', 69, 0, 1302, 0, 0, 1925, 0, 2475, 2520, 1215, 0, 0, 0, 0, 1953, 0, 0, '太原学院', '事业', '01', 9506, '074001', NULL, 7553, '140102197609096534', '曲江', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('615cb0503b5641f8ae26f7c03755e63b', 74, 4, 1342, 0, 30, 1950, 0, 2911, 2520, 1215, 0, 0, 0, 0, 2013, 0, 0, '太原学院', '事业', '01', 10046, '074001', NULL, 8033, '140104197108071761', '赵利荣', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('62257e053b27456f8a7707486853e153', 89, 0, 1391, 0, 30, 2410, 0, 2375, 2660, 1418, 0, 0, 0, 0, 2087, 0, 0, '太原学院', '事业', '01', 10373, '074001', NULL, 8286, '140202198012031025', '孙丽娟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6258b0aedda74985ace555bdb75ea56e', 89, 0, 1331, 0, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1997, 0, 0, '太原学院', '事业', '01', 9788, '074001', NULL, 7791, '140103198202221541', '牛原', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('631336c97a414eb289e9720e39859464', 89, 0, 1272, 0, 30, 2185, 0, 1515, 2660, 1418, 0, 0, 0, 0, 1908, 0, 0, '太原学院', '事业', '01', 9169, '074001', NULL, 7261, '140106198809113028', '武洁', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6325fc05bb04424a9c09e10a8bd505c4', 94, 3.2, 1589, 0, 30, 2880, 0, 3141, 2730, 1551, 0, 0, 0, 0, 2384, 0, 0, '太原学院', '事业', '01', 12018.2, '074001', NULL, 9634.2, '140103197303304827', '侯春柳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6349a92b45c44a09b96ddc73d6d32fbe', 89, 0, 1327, 50, 30, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1991, 0, 0, '太原学院', '事业', '01', 9866, '074001', NULL, 7875, '142301198410193127', '王兴华', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('63514bc536174c6b8ce9984a2b15f6ed', 104, 4.2, 2051, 0, 0, 4640, 0, 4201, 2940, 1908, 0, 0, 0, 0, 3077, 0, 0, '太原学院', '事业', '01', 15848.2, '074001', NULL, 12771.2, '140103196612151313', '王坚', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('638979c3086845678e11d0ff073d4bba', 89, 0, 1316, 0, 0, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 1974, 0, 0, '太原学院', '事业', '01', 9643, '074001', NULL, 7669, '140104198101112211', '封俊', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6393a2da344d4f6f8b8196fac99a6e0c', 99, 0, 1468, 0, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2202, 0, 0, '太原学院', '事业', '01', 10972, '074001', NULL, 8770, '140102198202112349', '袁芳芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('63988075a65943d98daf744b57a1bad2', 89, 0, 1345, 0, 0, 2185, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2018, 0, 0, '太原学院', '事业', '01', 9972, '074001', NULL, 7954, '142429197905012831', '岳林海', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('63f4af02b11341079490cace4d6be245', 99, 0, 1449, 0, 30, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2174, 0, 0, '太原学院', '事业', '01', 10853, '074001', NULL, 8679, '430922198305160042', '昌秦湘', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('640c8fd6a54743b298bca7bbc0b072d8', 89, 0, 1294, 50, 0, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1941, 0, 0, '太原学院', '事业', '01', 9578, '074001', NULL, 7637, '140106198409170015', '李烨东', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('64b432b2ee0b42e196d4f40ace9e987c', 89, 0, 1215, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1823, 0, 0, '太原学院', '事业', '01', 8848, '074001', NULL, 7025, '140109199308033023', '周姝航', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('65032c5c70a64395b70a77d55999a96f', 104, 0, 1857, 0, 30, 4640, 0, 2689, 2940, 1908, 0, 0, 0, 0, 2786, 0, 0, '太原学院', '事业', '01', 14168, '074001', NULL, 11382, '140102197610225161', '薛文艳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6503e4d4c21c49babd00795eb3f78ab2', 89, 0, 1190, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1785, 0, 0, '太原学院', '事业', '01', 8577, '074001', NULL, 6792, '140107199509124527', '段珮华', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('654d7ef0d7b84d9d942bc64eb7dba29f', 89, 0, 1310, 0, 30, 2404, 7, 1764, 2660, 1418, 0, 0, 0, 0, 1965, 0, 0, '太原学院', '事业', '01', 9682, '074001', NULL, 7717, '140107198506113641', '王静', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6594113504aa4562aec2e771a570ffab', 89, 0, 1215, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1823, 0, 0, '太原学院', '事业', '01', 8848, '074001', NULL, 7025, '140110199005071028', '赵翠玉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('65ab94ef55c54c03afe3c338f9fa1521', 94, 0, 1732, 50, 0, 3455, 0, 3026, 2800, 1810, 0, 0, 0, 0, 2598, 0, 0, '太原学院', '事业', '01', 12967, '074001', NULL, 10369, '140102197602270050', '姚海彬', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('66454b410bfa4018acb5dbbb2d1d0787', 89, 0, 1261, 0, 30, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1892, 0, 0, '太原学院', '事业', '01', 9246, '074001', NULL, 7354, '142431198610032727', '王筱依', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('66639740bebd4f469d278d473fa20170', 99, 0, 1465, 0, 30, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2198, 0, 0, '太原学院', '事业', '01', 10869, '074001', NULL, 8671, '140102198208316529', '赵晶', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('666e2040a43f4b688fe6f56330f08029', 94, 0, 1716, 50, 30, 3455, 0, 3141, 2800, 1810, 0, 0, 0, 0, 2574, 0, 0, '太原学院', '事业', '01', 13096, '074001', NULL, 10522, '142401197402096280', '胡晋梅', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('667a03b810714a1c8c853ad3784388b8', 89, 0, 1322, 0, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1983, 0, 0, '太原学院', '事业', '01', 9779, '074001', NULL, 7796, '210782198204173420', '李秋玲', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('66cfba36539440cb9f59e9f62ba79825', 69, 0, 1273, 0, 30, 2260, 0, 1703, 2590, 1365, 0, 0, 0, 0, 1910, 0, 0, '太原学院', '事业', '01', 9290, '074001', NULL, 7380, '140104197803094180', '畅旭莉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('66f6421ccf1f4e5a9440edbdbf3553b3', 89, 0, 1120, 0, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1680, 0, 0, '太原学院', '事业', '01', 9384, '074001', NULL, 7704, '140106198109201924', '郭妍琼', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('67272461bf2d41bd83e627132503a7bf', 74, 0, 1189, 0, 0, 1925, 0, 1789, 2520, 1215, 0, 0, 0, 0, 1784, 0, 0, '太原学院', '事业', '01', 8712, '074001', NULL, 6928, '140106198310100615', '梁勇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('672f310b69d04871b8b4d2f179fd922c', 99, 0, 1503, 50, 30, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2255, 0, 0, '太原学院', '事业', '01', 11257, '074001', NULL, 9002, '142423197903040021', '赵佼', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('673253b3d3344d29beebc8cb69669822', 99, 0, 1550, 0, 30, 3260, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2325, 0, 0, '太原学院', '事业', '01', 11684, '074001', NULL, 9359, '140103197812070627', '苗壮', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6792bd0841df486aade6faba2f3807a4', 89, 0, 1041, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1562, 0, 0, '太原学院', '事业', '01', 8428, '074001', NULL, 6866, '142726199602213325', '郝爽', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('67c5fd6bde1f4237b51eca11955c55fe', 89, 0, 1335, 50, 0, 2410, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2003, 0, 0, '太原学院', '事业', '01', 9937, '074001', NULL, 7934, '140202198105264514', '申森', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('67ecca87cc31402fb855fa05a189613f', 74, 0, 1133, 0, 0, 1925, 0, 1169, 2520, 1215, 0, 0, 0, 0, 1700, 0, 0, '太原学院', '事业', '01', 8036, '074001', NULL, 6336, '140423199201032016', '赵晋', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('683dd0cb81a74db380915f8cbe1474d6', 89, 0, 1447, 0, 30, 2650, 0, 2375, 2660, 1418, 0, 0, 0, 0, 2171, 0, 0, '太原学院', '事业', '01', 10669, '074001', NULL, 8498, '142603197807163027', '杨雪琴', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('68d51e219d174377bff224ec5eb2db6e', 74, 0, 1226, 50, 0, 1925, 0, 2075, 2520, 1215, 0, 0, 0, 0, 1839, 0, 0, '太原学院', '事业', '01', 9085, '074001', NULL, 7246, '140102198006141417', '郭巍', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6914cdaef9064e66976b0e9ab66ce3b0', 89, 0, 1387, 50, 30, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2081, 0, 0, '太原学院', '事业', '01', 10319, '074001', NULL, 8238, '140104198108060389', '任彦卿', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6919eccf352245a7b95acc46d85c625e', 99, 0, 1491, 50, 0, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2237, 0, 0, '太原学院', '事业', '01', 11215, '074001', NULL, 8978, '142202197708062476', '付树林', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('692dbd6979844d59beb45d3d5ab1189b', 89, 0, 1387, 0, 30, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2081, 0, 0, '太原学院', '事业', '01', 10269, '074001', NULL, 8188, '14062419780128002X', '郭红梅', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('69753ca1f46b419fa446ee686fb0536a', 64, 0, 975, 0, 0, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1463, 0, 0, '太原学院', '事业', '01', 8067, '074001', NULL, 6604, '141127199701010091', '邸文奇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6988fbd5ad4248c2a785cc6943a16950', 99, 0, 1495, 0, 0, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2243, 0, 0, '太原学院', '事业', '01', 10969, '074001', NULL, 8726, '420623198209054053', '田川', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('69ef98d9c20547359b1394e1d54a7d04', 74, 0, 1281, 50, 0, 1950, 0, 2475, 2520, 1215, 0, 0, 0, 0, 1922, 0, 0, '太原学院', '事业', '01', 9565, '074001', NULL, 7643, '140203197801155911', '张洋', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6a11f9e8ef1741c7852df38983b6cbce', 99, 0, 1564, 50, 30, 3260, 0, 2582, 2730, 1540, 0, 0, 0, 0, 2346, 0, 0, '太原学院', '事业', '01', 11855, '074001', NULL, 9509, '140303197605040047', '张云志', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6a231be1f2464c84bcabf8a78498a49e', 89, 0, 1215, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1823, 0, 0, '太原学院', '事业', '01', 8848, '074001', NULL, 7025, '140423199404120024', '李可欣', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6a38c5c049d44dd19dbeb7b46735f845', 99, 0, 1491, 50, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2237, 0, 0, '太原学院', '事业', '01', 11145, '074001', NULL, 8908, '140102198201121462', '王鹭', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6a8ea02d37fa4675aa58667b76d59108', 74, 0, 1313, 0, 30, 1950, 0, 2689, 2520, 1215, 0, 0, 0, 0, 1970, 0, 0, '太原学院', '事业', '01', 9791, '074001', NULL, 7821, '140102197508045164', '尹艳芬', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6ad508dd3ce747daa6b476cf75f2ebd4', 89, 0, 1416, 0, 30, 2410, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2124, 0, 0, '太原学院', '事业', '01', 10498, '074001', NULL, 8374, '140202197709080527', '张娜', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6aff606381784ae9a79de2409861e131', 89, 0, 1201, 0, 0, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1802, 0, 0, '太原学院', '事业', '01', 8722, '074001', NULL, 6920, '142703199408111232', '王国庆', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6b130e5eb92541d88db3046170f901b6', 89, 0, 1334, 50, 30, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2001, 0, 0, '太原学院', '事业', '01', 9741, '074001', NULL, 7740, '140102198103231422', '李薇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6b1bee17c6c24f67bfa08ed64969be68', 89, 0, 1227, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1841, 0, 0, '太原学院', '事业', '01', 8948, '074001', NULL, 7107, '140121199102220645', '孟洁', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6b29497309764ccd8c4163e2fdbf8bfb', 89, 0, 1283, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1925, 0, 0, '太原学院', '事业', '01', 9361, '074001', NULL, 7436, '142303198704170062', '殷志鹃', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6b8885f296ab4d9c8c4055d52fced4ba', 94, 4, 1836, 0, 30, 3455, 0, 4061, 2800, 1810, 0, 0, 0, 0, 2754, 0, 0, '太原学院', '事业', '01', 14090, '074001', NULL, 11336, '140104196711090823', '李冬英', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6b9527f3508a4b63a71b9d9f8952d92b', 89, 0, 1261, 0, 30, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1892, 0, 0, '太原学院', '事业', '01', 9246, '074001', NULL, 7354, '142729198905110643', '温月', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6bbb82d1420f424ba4f1ae61c0a24aca', 99, 0, 1489, 0, 0, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2234, 0, 0, '太原学院', '事业', '01', 11063, '074001', NULL, 8829, '140511198107181918', '李小广', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6bea741faaa7442fbc9c13941db60bed', 89, 0, 1307, 0, 0, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1961, 0, 0, '太原学院', '事业', '01', 9448, '074001', NULL, 7487, '370832198509062314', '马成乡', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6c021b32b1844bc8a593caa00bd03531', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '140202199511045020', '姜楠', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6c03a10d70f34494b1121cf48108a228', 99, 0, 1481, 0, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2222, 0, 0, '太原学院', '事业', '01', 11085, '074001', NULL, 8863, '14263119800715742X', '陈耀玲', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6c74ae4fe6b74b71bd146b6b7d0e39d9', 89, 0, 1339, 0, 30, 2410, 0, 1789, 2660, 1418, 0, 0, 0, 0, 2009, 0, 0, '太原学院', '事业', '01', 9735, '074001', NULL, 7726, '142621198807120040', '王鑫', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6c8083dd9b174d4589d1004fef9a9561', 89, 0, 1307, 0, 0, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1961, 0, 0, '太原学院', '事业', '01', 9448, '074001', NULL, 7487, '140107198206021219', '徐斌', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6c8c7a62b1924989b67efe60947c91e7', 94, 0, 1485, 0, 0, 2880, 0, 2375, 2730, 1551, 0, 0, 0, 0, 2228, 0, 0, '太原学院', '事业', '01', 11115, '074001', NULL, 8887, '142430197605180417', '雷明峰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6c92b8bb71fe4ce1b813d17422ec519f', 99, 0, 1478, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2217, 0, 0, '太原学院', '事业', '01', 11032, '074001', NULL, 8815, '140103198012060628', '赵志星', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6ceb94dc00344067bace597496f81d5a', 89, 0, 1042, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1563, 0, 0, '太原学院', '事业', '01', 8399, '074001', NULL, 6836, '140522199507150014', '李志玲', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6d56546316f1411dbc3d75f9a24187c2', 99, 0, 1490, 50, 0, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2235, 0, 0, '太原学院', '事业', '01', 11014, '074001', NULL, 8779, '140102198009250635', '白宝平', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6d5c6756ef2d48e0bce7627f8d9074f7', 89, 0, 1318, 0, 30, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 1977, 0, 0, '太原学院', '事业', '01', 9675, '074001', NULL, 7698, '140106198305250627', '张守锐', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6d73eb59121a4b0a8638d80acddda856', 99, 0, 1428, 0, 0, 3030, 0, 1789, 2730, 1540, 0, 0, 0, 0, 2142, 0, 0, '太原学院', '事业', '01', 10616, '074001', NULL, 8474, '140108198410010812', '胡建功', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6e0c22dae060446f9e4657f748e686ae', 94, 2.9, 1584, 50, 0, 2880, 0, 3026, 2730, 1551, 0, 0, 0, 0, 2376, 0, 0, '太原学院', '事业', '01', 11917.9, '074001', NULL, 9541.9, '140104197209211735', '贾尚武', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6e6eb4e2a91a4c08be9e3e314ce137fa', 89, 0, 1270, 0, 0, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1905, 0, 0, '太原学院', '事业', '01', 9318, '074001', NULL, 7413, '142601198605089713', '王鹏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6e7b738882c04288b74cea0c378d5a44', 94, 0, 1635, 0, 30, 3455, 0, 2275, 2800, 1810, 0, 0, 0, 0, 2453, 0, 0, '太原学院', '事业', '01', 12099, '074001', NULL, 9646, '142231197904040102', '曹剑', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6f137477fa7246148c7665feb603f215', 89, 0, 1224, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1836, 0, 0, '太原学院', '事业', '01', 8693, '074001', NULL, 6857, '142623199406064049', '崔国华', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6f7b89a84a054635a3d7e0b837405219', 89, 0, 1348, 50, 30, 2185, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2022, 0, 0, '太原学院', '事业', '01', 10055, '074001', NULL, 8033, '140102197511150643', '李晓妹', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6fe5a6e342c946c5bfbb9ece58090442', 89, 0, 1267, 0, 0, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1901, 0, 0, '太原学院', '事业', '01', 9222, '074001', NULL, 7321, '140108198501284819', '李新龙', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('6ff3fd82f5ea4f5eb80283ccefd55c4d', 89, 0, 1413, 0, 30, 2410, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2120, 0, 0, '太原学院', '事业', '01', 10495, '074001', NULL, 8375, '142623197811044325', '刘艳丽', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7002fff2a084420f802e7a8701068ffc', 89, 0, 1181, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1772, 0, 0, '太原学院', '事业', '01', 8568, '074001', NULL, 6796, '140108199410063222', '张哲琪', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('70520d6124fc4850a281e22c3a7f1d57', 89, 0, 1389, 0, 30, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2084, 0, 0, '太原学院', '事业', '01', 10271, '074001', NULL, 8187, '140624197611204026', '李利芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7056b5ddbf184f9a960a008f31dc270a', 99, 0, 1683, 0, 30, 3260, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2525, 0, 0, '太原学院', '事业', '01', 12608, '074001', NULL, 10083, '140102196901182128', '潘韧', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('70940ddcbad04ae09f9b43276378d2c4', 104, 0, 1813, 0, 0, 4640, 0, 2375, 2940, 1908, 0, 0, 0, 0, 2720, 0, 0, '太原学院', '事业', '01', 13780, '074001', NULL, 11060, '140602197909058617', '常浩', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('70dac7a0ff06417c90705a8ec9f902fc', 99, 0, 1680, 0, 30, 3030, 0, 3516, 2730, 1540, 0, 0, 0, 0, 2520, 0, 0, '太原学院', '事业', '01', 12625, '074001', NULL, 10105, '140102196803175127', '张晋华', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('70f457b267c74d7c986661756b9cb850', 89, 0, 1248, 0, 0, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1872, 0, 0, '太原学院', '事业', '01', 8939, '074001', NULL, 7067, '140581199007153913', '杨航', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('712859765f7a48ed8bf3935610cbb6a3', 99, 0, 1455, 0, 30, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2183, 0, 0, '太原学院', '事业', '01', 10859, '074001', NULL, 8676, '140481198306063627', '陈荷花', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('713e9c83346b497ea5a9079b2ddbf73b', 99, 3.9, 1729, 0, 30, 3260, 0, 3781, 2730, 1540, 0, 0, 0, 0, 2594, 0, 0, '太原学院', '事业', '01', 13172.9, '074001', NULL, 10578.9, '142601196810211926', '周月红', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('71af7d21c4ed4519ab2eacd7a6979d88', 89, 0, 1377, 50, 30, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2066, 0, 0, '太原学院', '事业', '01', 10109, '074001', NULL, 8043, '142201198405250742', '王丽君', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('71c8be8e54a4478298aca72ea09fef35', 74, 0, 1072, 0, 30, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1608, 0, 0, '太原学院', '事业', '01', 7699, '074001', NULL, 6091, '142402199707016646', '董颖虹', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('71e627ccfe95434293343c6b568bd785', 99, 0, 1381, 0, 0, 3030, 0, 1427, 2730, 1540, 0, 0, 0, 0, 2072, 0, 0, '太原学院', '事业', '01', 10207, '074001', NULL, 8135, '130726198706141014', '王兴', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7228adc9479846d88e92fed10c1c8ff3', 89, 0, 1341, 0, 30, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 2012, 0, 0, '太原学院', '事业', '01', 9830, '074001', NULL, 7818, '511028198401275149', '李吉艳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('723bcf898fa34cda97a4987f5e7869f6', 89, 0, 1378, 0, 30, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2067, 0, 0, '太原学院', '事业', '01', 10260, '074001', NULL, 8193, '142331198107090529', '张颖', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7244e14352ca4ecb8ba755858d4540a6', 94, 0, 1434, 0, 30, 2880, 0, 1882, 2730, 1551, 0, 0, 0, 0, 2151, 0, 0, '太原学院', '事业', '01', 10601, '074001', NULL, 8450, '140105198405090521', '刘洁', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('724747666bb445a9ae6abb4f14f946ac', 89, 0, 1384, 50, 0, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2076, 0, 0, '太原学院', '事业', '01', 10286, '074001', NULL, 8210, '140225197901234914', '白文江', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7298a06a045f4edd8804e08e091f333e', 89, 0, 1250, 0, 30, 2185, 0, 1515, 2660, 1418, 0, 0, 0, 0, 1875, 0, 0, '太原学院', '事业', '01', 9147, '074001', NULL, 7272, '142326198410042123', '常星花', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('72c5d290736e4517a24264e3aa41b3be', 89, 0, 1348, 0, 30, 2185, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2022, 0, 0, '太原学院', '事业', '01', 10005, '074001', NULL, 7983, '140103197602150645', '续冰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7318f436220b440a96e3fad4be75141c', 99, 4.5, 1727, 0, 30, 3260, 0, 3641, 2730, 1540, 0, 0, 0, 0, 2591, 0, 0, '太原学院', '事业', '01', 13031.5, '074001', NULL, 10440.5, '142429197201290841', '李燕', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7360ef967101475eaca30ad7c0bc58ac', 99, 0, 1529, 0, 30, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2294, 0, 0, '太原学院', '事业', '01', 11433, '074001', NULL, 9139, '140102197408103224', '杨晋华', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7373d5af77654d16b5bd10a2120cb565', 89, 0, 1322, 0, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1983, 0, 0, '太原学院', '事业', '01', 9779, '074001', NULL, 7796, '142202198010040966', '丁会', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7374122dfd60414fb9ef4c7977eb8b21', 99, 3.9, 1633, 0, 30, 3030, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2450, 0, 0, '太原学院', '事业', '01', 12331.9, '074001', NULL, 9881.9, '140102197005312048', '马俊文', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('73b0c15fd89f4cf59b92c8785260efd1', 99, 0, 1603, 0, 0, 3030, 13, 3141, 2730, 1540, 0, 0, 0, 0, 2405, 0, 0, '太原学院', '事业', '01', 12156, '074001', NULL, 9751, '140113197112291616', '王茵东', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('73e76a010d9f41b99f0e3973e082e581', 94, 3.9, 1778, 0, 0, 3455, 0, 3641, 2800, 1810, 0, 0, 0, 0, 2667, 0, 0, '太原学院', '事业', '01', 13581.9, '074001', NULL, 10914.9, '140105196911275036', '吴永胜', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('74c734c090d3455b81873b10ba49ca3a', 89, 0, 1037, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1556, 0, 0, '太原学院', '事业', '01', 8394, '074001', NULL, 6838, '320322199103104452', '张恩', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('74e026b7b19a4711a28ba22f37f4c452', 79, 0, 1268, 50, 30, 2200, 0, 1882, 2590, 1292, 0, 0, 0, 0, 1902, 0, 0, '太原学院', '事业', '01', 9391, '074001', NULL, 7489, '140521198206023627', '王远芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('74f31c819b00433db129be4d72218137', 99, 0, 1468, 0, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2202, 0, 0, '太原学院', '事业', '01', 10779, '074001', NULL, 8577, '140105198411120547', '庞培婕', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('74fb90efcd254ca0a833da6ce51c52c3', 89, 0, 1213, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1820, 0, 0, '太原学院', '事业', '01', 8846, '074001', NULL, 7026, '140107198808081729', '祁洁', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7546844d70aa45b885330dc1a5f58ec2', 99, 4.2, 1748, 0, 30, 3260, 0, 3921, 2730, 1540, 0, 0, 0, 0, 2622, 0, 0, '太原学院', '事业', '01', 13332.2, '074001', NULL, 10710.2, '120103196603067028', '孙晋兰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7547d1b613fb4fed850e32586282c59d', 89, 0, 1206, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1809, 0, 0, '太原学院', '事业', '01', 8593, '074001', NULL, 6784, '41152819950622002X', '文丽', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7570b1510b65419ea7c9991e6b79b815', 99, 0, 1637, 0, 30, 3260, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2456, 0, 0, '太原学院', '事业', '01', 12437, '074001', NULL, 9981, '14230219720911058X', '薛晓蓉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('75ace9f4e9ed44c790ef3a8ae043028c', 94, 0, 1492, 0, 0, 2880, 0, 2175, 2730, 1551, 0, 0, 0, 0, 2238, 0, 0, '太原学院', '事业', '01', 10922, '074001', NULL, 8684, '142429197907130014', '王利国', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('75e6a953f4a84666a2a099c59fcb2d9b', 99, 0, 1468, 0, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2202, 0, 0, '太原学院', '事业', '01', 10972, '074001', NULL, 8770, '140102198012040022', '王辉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7601cf4c2f8c45c8b168486224e0f539', 99, 0, 1643, 0, 0, 3260, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2465, 0, 0, '太原学院', '事业', '01', 12413, '074001', NULL, 9948, '14260119711129283X', '王建平', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7618ac0a67f64e269ee19487ab2973f2', 99, 0, 1649, 50, 0, 3260, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2474, 0, 0, '太原学院', '事业', '01', 12594, '074001', NULL, 10120, '140105196908140819', '范智华', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('767587c3b35045b082e56c052015f4f4', 89, 0, 1261, 0, 30, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1892, 0, 0, '太原学院', '事业', '01', 9246, '074001', NULL, 7354, '142623198912055546', '张博', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('767e86389b934e9db553a92512682009', 89, 0, 1215, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1823, 0, 0, '太原学院', '事业', '01', 8654, '074001', NULL, 6831, '14112819930526001X', '白锦科', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('76ac55e379764c979ef355520cad32f9', 99, 0, 1592, 0, 30, 3260, 0, 2796, 2730, 1540, 0, 0, 0, 0, 2388, 0, 0, '太原学院', '事业', '01', 12047, '074001', NULL, 9659, '142401197604055524', '赵俊萍', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('76d69e5678124b07a805439ab1db4778', 89, 0, 1391, 50, 30, 2410, 0, 2375, 2660, 1418, 0, 0, 0, 0, 2087, 0, 0, '太原学院', '事业', '01', 10423, '074001', NULL, 8336, '140102197909165124', '李新艺', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('770e84daf4d44fac9b052610f4737b4c', 89, 0, 1348, 50, 30, 2185, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2022, 0, 0, '太原学院', '事业', '01', 10055, '074001', NULL, 8033, '140102197711282341', '张琳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('77303bee0dce45e1a0c635b51b983b3d', 99, 0, 1575, 0, 30, 3260, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2363, 0, 0, '太原学院', '事业', '01', 11709, '074001', NULL, 9346, '140102197603052362', '郭银芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7739c18b99cc4b5793c081b2d6d99dd6', 99, 0, 1443, 0, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2165, 0, 0, '太原学院', '事业', '01', 10754, '074001', NULL, 8589, '142228198605270027', '张晶晶', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('77b4ed55003c43de998c094004fb8097', 89, 0, 1240, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1860, 0, 0, '太原学院', '事业', '01', 8873, '074001', NULL, 7013, '140423199305230826', '姚倬云', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('77b960f882334275ba8d70e9f5823bdf', 89, 0, 1338, 0, 30, 2410, 0, 1789, 2660, 1418, 0, 0, 0, 0, 2007, 0, 0, '太原学院', '事业', '01', 9734, '074001', NULL, 7727, '142431198610127523', '李莉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('77d7e4512c27479bbd691def3169f2ae', 89, 0, 1435, 50, 30, 2650, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2153, 0, 0, '太原学院', '事业', '01', 10807, '074001', NULL, 8654, '140103197610034222', '苏敏静', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('77e2732f1a6e48a49f2653f21638d8af', 89, 0, 1282, 0, 0, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1923, 0, 0, '太原学院', '事业', '01', 9423, '074001', NULL, 7500, '140106198507243011', '闫钊', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('783ce9e1e8fc4d58b73e03ef3e9a3af7', 89, 0, 1181, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1772, 0, 0, '太原学院', '事业', '01', 8568, '074001', NULL, 6796, '130625199107110825', '司丽超', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7a22e0248c03400a9f0e5347b07d964c', 74, 0, 1254, 50, 0, 1950, 0, 2175, 2520, 1215, 0, 0, 0, 0, 1881, 0, 0, '太原学院', '事业', '01', 9238, '074001', NULL, 7357, '140102198007151414', '赵军', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7a3a4e7412154b3ebaa24b1c6877b122', 94, 0, 1403, 50, 30, 2880, 0, 1696, 2730, 1551, 0, 0, 0, 0, 2105, 0, 0, '太原学院', '事业', '01', 10434, '074001', NULL, 8329, '140311198511141829', '张雅平', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7b02e8f5ccb84acc844a971573a7336b', 99, 0, 1490, 0, 0, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2235, 0, 0, '太原学院', '事业', '01', 10964, '074001', NULL, 8729, '140622198003174718', '王振国', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7b048bbb51914c4f8dcf39b8dd3513ec', 74, 0, 1281, 0, 0, 1950, 0, 2475, 2520, 1215, 0, 0, 0, 0, 1922, 0, 0, '太原学院', '事业', '01', 9515, '074001', NULL, 7593, '140104197606190333', '董亮', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7b08c9c085f54da0b3f4ea91f51192c7', 99, 0, 1404, 0, 0, 3030, 0, 1603, 2730, 1540, 0, 0, 0, 0, 2106, 0, 0, '太原学院', '事业', '01', 10406, '074001', NULL, 8300, '220106198603110219', '张光华', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7b0bbb87645c4455ac82283043987468', 104, 0, 1822, 0, 30, 4640, 0, 2275, 2940, 1908, 0, 0, 0, 0, 2733, 0, 0, '太原学院', '事业', '01', 13719, '074001', NULL, 10986, '140103197902220043', '胡盾', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7b0c6a9ec75a4c45877fe6bc9d1ee94e', 74, 0, 1078, 0, 0, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1617, 0, 0, '太原学院', '事业', '01', 7675, '074001', NULL, 6058, '140931199607030050', '袁祥', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7b22df9856f944b78e62245ecd1097a1', 85, 4.2, 1097, 0, 0, 3110, 0, 3164, 0, 1629, 0, 0, 0, 0, 1646, 0, 0, '太原学院', '事业', '01', 9089.2, '074001', NULL, 7443.2, '140102196803162019', '张文虎', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7b25ef4949a946a6b1ecf767127c356d', 99, 4, 1653, 0, 30, 3260, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2480, 0, 0, '太原学院', '事业', '01', 12582, '074001', NULL, 10102, '140202197007251029', '邢彦琴', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7b2955bb0eac40098c0242f2edf97b0a', 99, 0, 1428, 0, 0, 3030, 0, 1789, 2730, 1540, 0, 0, 0, 0, 2142, 0, 0, '太原学院', '事业', '01', 10616, '074001', NULL, 8474, '142630198508173018', '白国庆', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7b5dd05529364c799f3e06d200c360d1', 79, 0, 1252, 0, 0, 2200, 0, 1696, 2590, 1292, 0, 0, 0, 0, 1878, 0, 0, '太原学院', '事业', '01', 9109, '074001', NULL, 7231, '142603198409045812', '赵晓华', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7b737c0281714a37bb41dd51fa72d76a', 89, 0, 1374, 50, 30, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2061, 0, 0, '太原学院', '事业', '01', 10206, '074001', NULL, 8145, '140102198112296527', '汤淑红', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7b785606ac4649ad9653fa8015ca0c99', 89, 0, 1227, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1841, 0, 0, '太原学院', '事业', '01', 8948, '074001', NULL, 7107, '14042319930207002X', '李林', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7bc995d6a7a24c35baa9912684e710f8', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '140481199502066440', '郭睿婕', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7be31f1d3d684ca7982ad8cf8dd42d68', 89, 0, 1282, 50, 0, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1923, 0, 0, '太原学院', '事业', '01', 9473, '074001', NULL, 7550, '140104198207011734', '田永刚', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7bf2121fc5b44dee9818f10bd28ec582', 89, 0, 1361, 0, 0, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2042, 0, 0, '太原学院', '事业', '01', 10113, '074001', NULL, 8071, '140107197903053916', '王浚波', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7c066e21f57e4280b035826610583487', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '140202199509104028', '刘晓燕', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7c4412722a784473a6f80cd463a8b78b', 89, 0, 1475, 0, 30, 2410, 0, 3026, 2660, 1418, 0, 0, 0, 0, 2213, 0, 0, '太原学院', '事业', '01', 11108, '074001', NULL, 8895, '14223319720528002X', '续珍', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7cb0627c5abc40d887c46338fcc3f87a', 89, 0, 1320, 50, 30, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 1980, 0, 0, '太原学院', '事业', '01', 9727, '074001', NULL, 7747, '140181198406034720', '韩雪', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7cd0eec0e6e1454e85509fc7570b3302', 99, 0, 1373, 0, 30, 3030, 0, 1339, 2730, 1540, 0, 0, 0, 0, 2060, 0, 0, '太原学院', '事业', '01', 10141, '074001', NULL, 8081, '14022319930903002X', '张秀玲', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7d0642edbbc4480a97f2a46a96540600', 94, 3.9, 1765, 0, 30, 3455, 0, 3516, 2800, 1810, 0, 0, 0, 0, 2648, 0, 0, '太原学院', '事业', '01', 13473.9, '074001', NULL, 10825.9, '140102196910023225', '魏晓红', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7d33898f009649c8b41892ea77b6458b', 99, 0, 1468, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2202, 0, 0, '太原学院', '事业', '01', 11022, '074001', NULL, 8820, '140107198208180627', '柴晓星', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7da7c4dee08b4d048de87729842b4539', 99, 0, 1416, 0, 0, 3030, 0, 1696, 2730, 1540, 0, 0, 0, 0, 2124, 0, 0, '太原学院', '事业', '01', 10511, '074001', NULL, 8387, '150204198109270115', '毛斌', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7dc7f8bd8ba94a3e852ccc27d0868caa', 94, 3.6, 1818, 0, 30, 3455, 0, 3921, 2800, 1810, 0, 0, 0, 0, 2727, 0, 0, '太原学院', '事业', '01', 13931.6, '074001', NULL, 11204.6, '140102197104234022', '周方', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7dcdd62b709f43f99c0710cb2c7c2b2d', 104, 4.5, 2093, 0, 30, 5220, 0, 3921, 2940, 1908, 0, 0, 0, 0, 3140, 0, 0, '太原学院', '事业', '01', 16220.5, '074001', NULL, 13080.5, '140102196511282326', '刘媛媛', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7e0a09bbbee84051bc05f82fe8b8fd45', 99, 0, 1494, 50, 30, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2241, 0, 0, '太原学院', '事业', '01', 11248, '074001', NULL, 9007, '140226198111137045', '李晓卿', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7e29d79d20bb4af987fb918b08960e6b', 69, 0, 1164, 0, 0, 1925, 0, 1603, 2520, 1215, 0, 0, 0, 0, 1746, 0, 0, '太原学院', '事业', '01', 8496, '074001', NULL, 6750, '140107198703194815', '董晓飞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7e855337075249c99379aac12ef1e080', 94, 0, 1683, 0, 0, 3455, 0, 2911, 2800, 1810, 0, 0, 0, 0, 2525, 0, 0, '太原学院', '事业', '01', 12753, '074001', NULL, 10228, '412931197301235537', '王小明', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7e8b798970c447dcb2208fffefc37b08', 74, 0, 1081, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1622, 0, 0, '太原学院', '事业', '01', 7779, '074001', NULL, 6157, '140223199506226267', '王宏荣', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7ea322ad463c448f9cce27b97288eb66', 89, 0, 1546, 0, 30, 2650, 0, 3266, 2660, 1418, 0, 0, 0, 0, 2319, 0, 0, '太原学院', '事业', '01', 11659, '074001', NULL, 9340, '140112197203050029', '董丽丽', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7eab1d808b324533bf6577a5ca8067b5', 89, 0, 1267, 0, 0, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1901, 0, 0, '太原学院', '事业', '01', 9222, '074001', NULL, 7321, '140181198408240210', '鲁维维', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7f168e7a3b7b4200979294d3b096c4ef', 99, 0, 1558, 0, 30, 3260, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2337, 0, 0, '太原学院', '事业', '01', 11492, '074001', NULL, 9155, '140203197907153922', '王建梅', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7f43feff78074ae3a9f3c2547ef0b5f6', 99, 0, 1491, 50, 0, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2237, 0, 0, '太原学院', '事业', '01', 11215, '074001', NULL, 8978, '142332198305120019', '刘宏伟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7f67d37cdc684c299c43d735982420e9', 89, 0, 1238, 0, 30, 2185, 0, 1427, 2660, 1418, 0, 0, 0, 0, 1857, 0, 0, '太原学院', '事业', '01', 9047, '074001', NULL, 7190, '140108199106241223', '黄莺', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7fbcf97581d8444eac47b8c02ee0be75', 99, 0, 1431, 50, 30, 3030, 0, 1789, 2730, 1540, 0, 0, 0, 0, 2147, 0, 0, '太原学院', '事业', '01', 10699, '074001', NULL, 8552, '430482198308250026', '李芳萍', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('7fd6ee78f3ac402ca4ce62ea005350b0', 89, 0, 1227, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1841, 0, 0, '太原学院', '事业', '01', 8948, '074001', NULL, 7107, '140109199110120025', '苏蕾', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8058bb781a2e4b6ab0f0043c287569f1', 89, 0, 1261, 50, 30, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1892, 0, 0, '太原学院', '事业', '01', 9296, '074001', NULL, 7404, '140108198208252527', '张瑶', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('80804b3f3a9d4fca9c0b65c2adff722e', 89, 0, 1365, 0, 30, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2048, 0, 0, '太原学院', '事业', '01', 10147, '074001', NULL, 8099, '140102198201143426', '陈婷', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('808c4ff2a69c4c1b80a2620314ee934b', 94, 0, 1565, 0, 0, 2880, 0, 2911, 2730, 1551, 0, 0, 0, 0, 2348, 0, 0, '太原学院', '事业', '01', 11731, '074001', NULL, 9383, '140102197204022318', '何炜', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('80a36e6419974ffbb18f722f046fa5f5', 89, 0, 1181, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1772, 0, 0, '太原学院', '事业', '01', 8568, '074001', NULL, 6796, '142226199603221223', '韩雪文', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('80fdead3cb7e49ed889bbf8eb1778e46', 89, 0, 1236, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1854, 0, 0, '太原学院', '事业', '01', 8957, '074001', NULL, 7103, '140105199207071842', '原敏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('811c64b982074664bff6f10349f214b2', 99, 0, 1465, 0, 0, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2198, 0, 0, '太原学院', '事业', '01', 10746, '074001', NULL, 8548, '142635198201191213', '秦勇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('81cdf892f7f94ff8831924953e3b7f78', 89, 0, 1240, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1860, 0, 0, '太原学院', '事业', '01', 8873, '074001', NULL, 7013, '14020219920828554X', '刘若男', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8276d726b842473ca2f1cd26e63980f4', 89, 0, 1265, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1898, 0, 0, '太原学院', '事业', '01', 8986, '074001', NULL, 7088, '142702199302281245', '相蕾', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8287a0bfb1e14d7887daf4680285d9a7', 89, 0, 1331, 50, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1997, 0, 0, '太原学院', '事业', '01', 9838, '074001', NULL, 7841, '140103198203161245', '黄美娜', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('82c652646aca47b797cb3b71990654c5', 89, 0, 1294, 0, 0, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1941, 0, 0, '太原学院', '事业', '01', 9528, '074001', NULL, 7587, '140102198207230010', '李翔', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('82d87f1e87c245ddba742ee87bfc7da2', 99, 0, 1623, 0, 30, 3030, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2435, 0, 0, '太原学院', '事业', '01', 12318, '074001', NULL, 9883, '140102197108040620', '李文璇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('82dc85e001574197a97619156626980d', 89, 0, 1335, 0, 30, 2185, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2003, 0, 0, '太原学院', '事业', '01', 9892, '074001', NULL, 7889, '140108198210112523', '马莎', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('82e4febecba74df3b49f264ee37844b6', 99, 0, 1662, 0, 30, 3260, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2493, 0, 0, '太原学院', '事业', '01', 12462, '074001', NULL, 9969, '140104197311241762', '陈晋萍', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('837f3532292547879769294e3b971738', 99, 4.2, 1810, 0, 30, 3810, 0, 3921, 2730, 1540, 0, 0, 0, 0, 2715, 0, 0, '太原学院', '事业', '01', 13944.2, '074001', NULL, 11229.2, '140102196810100641', '何瑞芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('83862f0b897147989079e542bf0c6007', 99, 0, 1466, 50, 30, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2199, 0, 0, '太原学院', '事业', '01', 10920, '074001', NULL, 8721, '140103198008125425', '孙丽', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('842c8c4c375b4624b63ac987b9c383c7', 89, 0, 1201, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1802, 0, 0, '太原学院', '事业', '01', 8640, '074001', NULL, 6838, '142303199004288339', '张伟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('844163d2915f4670a5322d0b568916db', 89, 0, 1238, 0, 30, 2185, 0, 1427, 2660, 1418, 0, 0, 0, 0, 1857, 0, 0, '太原学院', '事业', '01', 9047, '074001', NULL, 7190, '141182198807130083', '王礼霄', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('84925f701f3a4bf5b62103c0255df08e', 89, 0, 1400, 0, 0, 2410, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2100, 0, 0, '太原学院', '事业', '01', 10452, '074001', NULL, 8352, '460001197701040712', '陈作行', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('84adf5420bc44f0981984c98f78693d9', 89, 0, 1378, 50, 30, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2067, 0, 0, '太原学院', '事业', '01', 10310, '074001', NULL, 8243, '140105198005141326', '郑慧敏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('84b8c975d29d43ae8dc914a43bb619bb', 94, 0, 1501, 0, 0, 2880, 0, 2275, 2730, 1551, 0, 0, 0, 0, 2252, 0, 0, '太原学院', '事业', '01', 11031, '074001', NULL, 8779, '14010419771224223X', '李琦', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('84c4183b54f746828f45c592478b2413', 74, 0, 1101, 0, 30, 1925, 0, 1087, 2520, 1215, 0, 0, 0, 0, 1652, 0, 0, '太原学院', '事业', '01', 7952, '074001', NULL, 6300, '140121199406302586', '董佳榕', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('84cdf5deef77451d878f82a84c01a6aa', 99, 0, 1631, 0, 30, 3260, 0, 3026, 2730, 1540, 0, 0, 0, 0, 2447, 0, 0, '太原学院', '事业', '01', 12316, '074001', NULL, 9869, '142302197112031025', '白淑珍', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8504dcbfa3cb40ff8eff819c47256911', 99, 4.6, 1837, 0, 30, 3810, 0, 4061, 2730, 1540, 0, 0, 0, 0, 2756, 0, 0, '太原学院', '事业', '01', 14111.6, '074001', NULL, 11355.6, '140112196512081289', '闫晓平', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8588eaed0ad344499bf134119e1b49cf', 104, 0, 1950, 0, 30, 4640, 0, 3141, 2940, 1908, 0, 0, 0, 0, 2925, 0, 0, '太原学院', '事业', '01', 14713, '074001', NULL, 11788, '140103197303070688', '李文洁', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('858c64af61c44e688b47cb1031708b31', 104, 0, 1785, 50, 0, 4640, 0, 1975, 2940, 1908, 0, 0, 0, 0, 2678, 0, 0, '太原学院', '事业', '01', 13402, '074001', NULL, 10724, '140623198108077013', '段永红', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('85be9322ba7740898665b1691bd15ebf', 89, 0, 1486, 0, 0, 2410, 0, 3141, 2660, 1418, 0, 0, 0, 0, 2229, 0, 0, '太原学院', '事业', '01', 11204, '074001', NULL, 8975, '142402197206120032', '王启军', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('85c6a251e12b439b8c8c6d5b3b0a2f31', 89, 0, 1361, 50, 30, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2042, 0, 0, '太原学院', '事业', '01', 10093, '074001', NULL, 8051, '14011019811027106X', '黄丹丹', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8691ec2fca2f4663a62a395f50e470e5', 64, 3.2, 1278, 0, 0, 1765, 0, 2689, 2520, 1180, 0, 0, 0, 0, 1917, 0, 0, '太原学院', '事业', '01', 9499.2, '074001', NULL, 7582.2, '140104196905310011', '王强', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('869aedb3823d4549b0f1f2bdfcf3b645', 99, 0, 1468, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2202, 0, 0, '太原学院', '事业', '01', 11022, '074001', NULL, 8820, '140303198209060040', '陈丫丫', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('869b37196e484d6bb3972322b25a40a4', 89, 0, 1240, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1860, 0, 0, '太原学院', '事业', '01', 8873, '074001', NULL, 7013, '142301199007200264', '张钰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('86f1897871b249b8a64af61cf5cdef15', 89, 3.5, 1404, 0, 30, 2410, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2106, 0, 0, '太原学院', '事业', '01', 10489.5, '074001', NULL, 8383.5, '140104197311092226', '王爱芬', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('872847d9153e4c9b98d2dc6ce91658d7', 89, 0, 1181, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1772, 0, 0, '太原学院', '事业', '01', 8568, '074001', NULL, 6796, '140581199606231629', '张茹杰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('877c56c4272d430d8b5002cf832b68c5', 89, 0, 1261, 0, 30, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1892, 0, 0, '太原学院', '事业', '01', 9246, '074001', NULL, 7354, '142222198809110027', '徐睿', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('87a00ef5485b454eb1aef0457a4a3ce9', 89, 0, 1199, 50, 30, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1799, 0, 0, '太原学院', '事业', '01', 9931, '074001', NULL, 8132, '140105198102120041', '张薇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('87e31647a8a445799add02b9b1addc6e', 74, 0, 1072, 0, 30, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1608, 0, 0, '太原学院', '事业', '01', 7699, '074001', NULL, 6091, '140702199701317100', '霍冰融', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('88788d615f864b079c26f9411c4c6993', 89, 0, 934, 0, 30, 2727, 0, 2516, 0, 1386, 0, 0, 0, 0, 1401, 0, 0, '太原学院', '事业', '01', 7682, '074001', NULL, 6281, '142432197303030029', '范玉芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('88d6a3e70cc643b9b81e2f3828eab7d5', 89, 0, 1046, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1569, 0, 0, '太原学院', '事业', '01', 8597, '074001', NULL, 7028, '14010719911012172X', '杨洋', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('88d7aee8abe44bfe9671b2996eea9a86', 89, 0, 1212, 0, 0, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1818, 0, 0, '太原学院', '事业', '01', 8815, '074001', NULL, 6997, '140106199008131212', '张云飞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('88e6e471b22d45b1a618dd1308d5185c', 79, 0, 1342, 50, 0, 2520, 0, 1975, 2660, 1383, 0, 0, 0, 0, 2013, 0, 0, '太原学院', '事业', '01', 10009, '074001', NULL, 7996, '14012219820915001X', '冯晓文', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('88f234be68bc40e7bac6fbbcf1ed369f', 99, 0, 1546, 50, 30, 3260, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2319, 0, 0, '太原学院', '事业', '01', 11430, '074001', NULL, 9111, '142431198010103042', '郝兴娥', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('88f320741c564cb18e9693d2a1da2250', 89, 0, 1227, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1841, 0, 0, '太原学院', '事业', '01', 8948, '074001', NULL, 7107, '140107198604031228', '成坤', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8949ee268b754a4f97561b054855d176', 89, 0, 1037, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1556, 0, 0, '太原学院', '事业', '01', 8394, '074001', NULL, 6838, '140581199503270035', '王雨嘉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8991583273394585ba563f813920035e', 104, 0, 1929, 0, 0, 4640, 0, 3266, 2940, 1908, 0, 0, 0, 0, 2894, 0, 0, '太原学院', '事业', '01', 14787, '074001', NULL, 11893, '140102197104015110', '高伟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('89a162ed2a1f4d4ab9203f29ff529edd', 99, 0, 1481, 50, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2222, 0, 0, '太原学院', '事业', '01', 11135, '074001', NULL, 8913, '142401198110021425', '彭薇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('89b4da0621da4e73b5564749bff0b89c', 99, 0, 1421, 50, 0, 3030, 0, 1789, 2730, 1540, 0, 0, 0, 0, 2132, 0, 0, '太原学院', '事业', '01', 10659, '074001', NULL, 8527, '41058119831013605X', '郭元伟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8a49b48c03e64e2fa9ed9f644d6dca5c', 74, 0, 1249, 0, 0, 1925, 0, 2175, 2520, 1215, 0, 0, 0, 0, 1874, 0, 0, '太原学院', '事业', '01', 9158, '074001', NULL, 7284, '140102197602235116', '王磊', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8a6b5961492548f984c7bab8dd546cfd', 99, 0, 1587, 0, 30, 3260, 0, 2689, 2730, 1540, 0, 0, 0, 0, 2381, 0, 0, '太原学院', '事业', '01', 11935, '074001', NULL, 9554, '142703197212200023', '温红霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8b3c9b1a38b74b719216abb36ba368c2', 89, 0, 1285, 50, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1928, 0, 0, '太原学院', '事业', '01', 9506, '074001', NULL, 7578, '140106198412260660', '高君', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8b9ecbd450924d819e0112dfe111984d', 79, 0, 1256, 0, 30, 2200, 0, 1789, 2590, 1292, 0, 0, 0, 0, 1884, 0, 0, '太原学院', '事业', '01', 9236, '074001', NULL, 7352, '140106198503101841', '郝艳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8ba28e13ff7b457ab1d8925816e85309', 94, 0, 1668, 0, 0, 3455, 0, 2796, 2800, 1810, 0, 0, 0, 0, 2502, 0, 0, '太原学院', '事业', '01', 12623, '074001', NULL, 10121, '142225197606075510', '祖珑', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8c08f2cd85cc43cdb6da3a8f9272ebdf', 89, 0, 1191, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1787, 0, 0, '太原学院', '事业', '01', 8630, '074001', NULL, 6843, '130526199407024612', '谷金朋', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8c4ca93c2517451ea89ef267862fdf30', 74, 0, 1081, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1622, 0, 0, '太原学院', '事业', '01', 7779, '074001', NULL, 6157, '142201199508229027', '白雪莲', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8c77a595634146909403ccc634c59040', 99, 0, 1373, 0, 30, 3030, 0, 1339, 2730, 1540, 0, 0, 0, 0, 2060, 0, 0, '太原学院', '事业', '01', 10141, '074001', NULL, 8081, '140226199206103045', '王军丽', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8c8aab4e5478482d8ff78e4ffe2574a5', 99, 0, 1758, 50, 30, 3810, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2637, 0, 0, '太原学院', '事业', '01', 13283, '074001', NULL, 10646, '140102197009174842', '张静', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8decd158aa4d497e87708d6bc8ca1c85', 99, 0, 1449, 0, 0, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2174, 0, 0, '太原学院', '事业', '01', 10730, '074001', NULL, 8556, '140402198204280019', '程亮', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8dfc7e67ac444c20a6afb35c30ddfa33', 99, 0, 1468, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2202, 0, 0, '太原学院', '事业', '01', 11022, '074001', NULL, 8820, '142424198107223522', '李雪梅', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8dfc85d9039d4e20bb4d42d399a4aad4', 94, 0, 1544, 0, 30, 2880, 0, 2796, 2730, 1551, 0, 0, 0, 0, 2316, 0, 0, '太原学院', '事业', '01', 11625, '074001', NULL, 9309, '142732197207263224', '员丽霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8e09afdfb9774e4b8ea1867aaf148dfc', 69, 3.5, 1305, 0, 0, 2260, 0, 2041, 2590, 1365, 0, 0, 0, 0, 1958, 0, 0, '太原学院', '事业', '01', 9633.5, '074001', NULL, 7675.5, '140102197106240012', '连原海', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8e49b409d8604456ac16b6d0791b81c6', 99, 0, 1631, 0, 30, 3260, 0, 3026, 2730, 1540, 0, 0, 0, 0, 2447, 0, 0, '太原学院', '事业', '01', 12316, '074001', NULL, 9869, '14010219730218488X', '侯志红', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8e50d1d9421849b6bf20aefe7ac957d5', 99, 0, 1479, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2219, 0, 0, '太原学院', '事业', '01', 11033, '074001', NULL, 8814, '14010219801222514X', '张舒婷', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8e969462742b4db5a318af4e57cb0a22', 89, 0, 1296, 50, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1944, 0, 0, '太原学院', '事业', '01', 9517, '074001', NULL, 7573, '142603198205303023', '张会会', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8eb18f4bc95749c0851868ebeb03adfb', 99, 0, 1491, 50, 0, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2237, 0, 0, '太原学院', '事业', '01', 11215, '074001', NULL, 8978, '140103198207173913', '齐晋', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8ecd5d6966744bc5aa9722c3c2ef7fc8', 99, 0, 1458, 0, 0, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2187, 0, 0, '太原学院', '事业', '01', 10739, '074001', NULL, 8552, '140121198112195514', '梁安国', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8f087b1ca5954ddd95f764a0e7a5e2fe', 89, 0, 1285, 0, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1928, 0, 0, '太原学院', '事业', '01', 9456, '074001', NULL, 7528, '142332198803090027', '陈雅茜', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8f5865cf81f942e286fb80711acd1201', 89, 0, 1314, 0, 30, 2410, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1971, 0, 0, '太原学院', '事业', '01', 9710, '074001', NULL, 7739, '142303198511140123', '苏静', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('8fd4197be84841fd8c23ed32f0e7bf6c', 74, 0, 1193, 0, 30, 1925, 0, 1603, 2520, 1215, 0, 0, 0, 0, 1790, 0, 0, '太原学院', '事业', '01', 8560, '074001', NULL, 6770, '140511198706236044', '常星星', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('90801067c032407f983ce9a441682b12', 99, 0, 1466, 0, 30, 3030, 0, 1789, 2730, 1540, 0, 0, 0, 0, 2199, 0, 0, '太原学院', '事业', '01', 10684, '074001', NULL, 8485, '14263319860111226X', '任姣丽', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('90827e27b3b9408896678a34be4493fb', 99, 0, 1383, 0, 30, 3030, 0, 1339, 2730, 1540, 0, 0, 0, 0, 2075, 0, 0, '太原学院', '事业', '01', 10151, '074001', NULL, 8076, '14270219920929552X', '尚珍珍', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9096e0598da74f5491523243c4b2030d', 94, 0, 1496, 0, 0, 2880, 0, 2275, 2730, 1551, 0, 0, 0, 0, 2244, 0, 0, '太原学院', '事业', '01', 11026, '074001', NULL, 8782, '140102197702160019', '蔡治国', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('90bb621749354fca8178b9e6acb7a9af', 79, 0, 1398, 0, 30, 2520, 0, 2375, 2660, 1383, 0, 0, 0, 0, 2097, 0, 0, '太原学院', '事业', '01', 10445, '074001', NULL, 8348, '14010219811118702X', '武哲敏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('90dfdf572a6a4e61a79a1df41f38dd85', 89, 0, 1361, 0, 30, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 2042, 0, 0, '太原学院', '事业', '01', 9850, '074001', NULL, 7808, '140106198410110626', '田琳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('917724f76291422290e4cbb812a3ed23', 74, 0, 1083, 0, 30, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1625, 0, 0, '太原学院', '事业', '01', 7710, '074001', NULL, 6085, '140302199612260825', '刘玥', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('91afa607c01b4dad818a0a7a65fc9e2e', 99, 0, 1530, 0, 0, 3260, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2295, 0, 0, '太原学院', '事业', '01', 11434, '074001', NULL, 9139, '140103197802274212', '张凯', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('91c236b5ee3a48ce9348895c83863bfd', 89, 0, 1215, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1823, 0, 0, '太原学院', '事业', '01', 8848, '074001', NULL, 7025, '140429199411275620', '韩静', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('91df79e5233a4611bd9975443a48caee', 89, 0, 1273, 50, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1910, 0, 0, '太原学院', '事业', '01', 9401, '074001', NULL, 7491, '140107198310080024', '孙静', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('91f8cc6c45f94ab6af4023974bba65c9', 94, 0, 1450, 0, 30, 2880, 0, 2075, 2730, 1551, 0, 0, 0, 0, 2175, 0, 0, '太原学院', '事业', '01', 10810, '074001', NULL, 8635, '140302198010170828', '杜芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('924b8b6026cd4c55a255d1edb366dc42', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '140602199609101520', '焦霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('924c34ff46b94143ad37de6408a2860b', 74, 0, 1242, 0, 0, 1950, 0, 2175, 2520, 1215, 0, 0, 0, 0, 1863, 0, 0, '太原学院', '事业', '01', 9176, '074001', NULL, 7313, '142727198001231511', '王志洋', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('92722d28b92047fa9bfeb34e67fdd10d', 99, 0, 1560, 50, 30, 3260, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2340, 0, 0, '太原学院', '事业', '01', 11744, '074001', NULL, 9404, '140102198004223443', '杨丽娟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('929051a6c2cc4338b53eba7dab6b92c7', 89, 0, 1348, 50, 30, 2410, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2022, 0, 0, '太原学院', '事业', '01', 9980, '074001', NULL, 7958, '140107198407061268', '宋欣', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('92a27e48fdf0449997c620839af44abb', 99, 0, 1520, 0, 30, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2280, 0, 0, '太原学院', '事业', '01', 11424, '074001', NULL, 9144, '140103197810311220', '郑敏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('92d0a8c907a649fdaa1ef0df2055741d', 89, 0, 1215, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1823, 0, 0, '太原学院', '事业', '01', 8848, '074001', NULL, 7025, '140481199309116581', '李琳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('92dd0d4df51a4695b2682c5f79b930e7', 89, 0, 1174, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1761, 0, 0, '太原学院', '事业', '01', 8613, '074001', NULL, 6852, '140107199208050616', '杨非凡', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9301914aabae4ee281b5bf37bb7770d2', 89, 0, 1404, 0, 30, 2410, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2106, 0, 0, '太原学院', '事业', '01', 10486, '074001', NULL, 8380, '142622197807160028', '裴嵘军', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('934b279ad0184bcba6661bc9a974a2e0', 89, 0, 1365, 0, 30, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2048, 0, 0, '太原学院', '事业', '01', 10147, '074001', NULL, 8099, '140321198009070060', '王岚', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9382df4992f543b58a920c152e12a089', 99, 0, 1468, 0, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2202, 0, 0, '太原学院', '事业', '01', 10779, '074001', NULL, 8577, '142223198503062428', '赵丹', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('939920f8720d4b58ae6962489e92c19f', 89, 0, 1191, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1787, 0, 0, '太原学院', '事业', '01', 8660, '074001', NULL, 6873, '140105199409200024', '张羽翔', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('93bf016433f04914b971dc4831b918fa', 89, 4.6, 1567, 0, 0, 2650, 0, 3516, 2660, 1418, 0, 0, 0, 0, 2351, 0, 0, '太原学院', '事业', '01', 11904.6, '074001', NULL, 9553.6, '140105196610193731', '孙长有', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('93de44a0cd05425f92ac60d249633da8', 89, 0, 1547, 0, 30, 2650, 0, 3266, 2660, 1418, 0, 0, 0, 0, 2321, 0, 0, '太原学院', '事业', '01', 11660, '074001', NULL, 9339, '14010519700610504X', '李小利', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('94065e8201de4c0580b605b75351573b', 89, 0, 1230, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1845, 0, 0, '太原学院', '事业', '01', 8781, '074001', NULL, 6936, '14060319941222542X', '苏慧娟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('940e618a10b4440e943eed75510f98de', 89, 0, 1347, 0, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2021, 0, 0, '太原学院', '事业', '01', 9804, '074001', NULL, 7783, '140107198302120663', '沈卓', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('94130f91aacc45e6aa7c0c90c9377a06', 89, 0, 1219, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1829, 0, 0, '太原学院', '事业', '01', 8688, '074001', NULL, 6859, '142723199506050029', '温新奇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9480e567a16c4bd5a46ccea4e242a2ca', 89, 0, 1378, 50, 30, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2067, 0, 0, '太原学院', '事业', '01', 10310, '074001', NULL, 8243, '142321197810040622', '高新艳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9481b19cd02d44f580bab581930ab703', 74, 0, 1233, 50, 30, 1950, 0, 2075, 2520, 1215, 0, 0, 0, 0, 1850, 0, 0, '太原学院', '事业', '01', 9147, '074001', NULL, 7297, '140107198207233926', '王志桃', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('949ebc4b68be4e3b931ebf7887f5569b', 94, 0, 1555, 0, 0, 2880, 0, 2911, 2730, 1551, 0, 0, 0, 0, 2333, 0, 0, '太原学院', '事业', '01', 11721, '074001', NULL, 9388, '140102197602031412', '海滨', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('94a02dfe9f2240608da089e53d5d7547', 89, 0, 1177, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1766, 0, 0, '太原学院', '事业', '01', 8534, '074001', NULL, 6768, '142431199308077515', '崔晓珂', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('94a15909f16b44c09412cbac60922643', 99, 0, 1557, 0, 30, 3030, 0, 2689, 2730, 1540, 0, 0, 0, 0, 2336, 0, 0, '太原学院', '事业', '01', 11675, '074001', NULL, 9339, '142323197611280167', '薛慧芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('94f50017cb6f47c2a8719c940c60c629', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '140427199405308040', '贾楠', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9519cb0dba3f4da48a744a043e40cf9a', 99, 0, 1443, 50, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2165, 0, 0, '太原学院', '事业', '01', 10804, '074001', NULL, 8639, '140121198210260527', '王宾彦', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9520e5b03c394fc8995fdc3f41ee332c', 104, 0, 1857, 0, 30, 4640, 0, 2689, 2940, 1908, 0, 0, 0, 0, 2786, 0, 0, '太原学院', '事业', '01', 14168, '074001', NULL, 11382, '140103197710206327', '李影', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('95b6346405e14eefbd3e2f8379c0882b', 99, 0, 1468, 0, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2202, 0, 0, '太原学院', '事业', '01', 10972, '074001', NULL, 8770, '140102198008195224', '张科星', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('95b78c64a80144e5ab8a32d5909da14a', 99, 0, 1592, 0, 30, 3260, 0, 2796, 2730, 1540, 0, 0, 0, 0, 2388, 0, 0, '太原学院', '事业', '01', 12047, '074001', NULL, 9659, '142427197512241227', '王丽花', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('95beb6cd77a740b9baee8aecb13b5d8a', 99, 0, 1445, 0, 30, 3030, 0, 1789, 2730, 1540, 0, 0, 0, 0, 2168, 0, 0, '太原学院', '事业', '01', 10663, '074001', NULL, 8495, '142625198606053326', '王霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('964c0d43d2b147bfa886734f0e3065e5', 74, 0, 1137, 0, 30, 1925, 0, 1169, 2520, 1215, 0, 0, 0, 0, 1706, 0, 0, '太原学院', '事业', '01', 8070, '074001', NULL, 6364, '140829198803190025', '张秀丽', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('96843d799f9f4fc89a6fba0f79a6edd9', 89, 0, 1177, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1766, 0, 0, '太原学院', '事业', '01', 8534, '074001', NULL, 6768, '140402199603160430', '赵严', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('96902afeab754f2fae865b4d158565f5', 99, 0, 1494, 50, 30, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2241, 0, 0, '太原学院', '事业', '01', 11248, '074001', NULL, 9007, '142402198010090024', '刘虹', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('96934ba6d37c476c9723a52f379d3c81', 89, 0, 1270, 0, 0, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1905, 0, 0, '太原学院', '事业', '01', 9318, '074001', NULL, 7413, '14060219860705851X', '徐少卿', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('970f63a3c9b34056907f15aa7d78196e', 94, 0, 1683, 0, 0, 3455, 0, 2689, 2800, 1810, 0, 0, 0, 0, 2525, 0, 0, '太原学院', '事业', '01', 12531, '074001', NULL, 10006, '140102197710246517', '郑志国', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9721dc447b964cef955be2fc57b38130', 99, 0, 1478, 50, 0, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2217, 0, 0, '太原学院', '事业', '01', 11102, '074001', NULL, 8885, '140122198210220011', '方向明', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('974a130c994d47c7aedb05d2712ada75', 89, 0, 1283, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1925, 0, 0, '太原学院', '事业', '01', 9361, '074001', NULL, 7436, '140107198710131249', '王雨晗', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9754a3e72b3348a3b50b38b8c2da5f76', 89, 0, 1403, 50, 30, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2105, 0, 0, '太原学院', '事业', '01', 10335, '074001', NULL, 8230, '142322197808146547', '潘艳花', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('97600373886c419391f0fd1613cca87e', 99, 0, 1507, 50, 30, 3030, 0, 2375, 2730, 1540, 0, 0, 0, 0, 2261, 0, 0, '太原学院', '事业', '01', 11361, '074001', NULL, 9100, '140105197605125042', '王丽平', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('978f5a36382f4a0cb8bfded505d8d660', 89, 0, 1435, 0, 30, 2650, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2153, 0, 0, '太原学院', '事业', '01', 10757, '074001', NULL, 8604, '14272419770113054X', '李霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('97a4a4a844074714954abd912de346b4', 74, 0, 1081, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1622, 0, 0, '太原学院', '事业', '01', 7779, '074001', NULL, 6157, '140423199611060829', '郭宇晴', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('97ba358a209846e3a651c5a809fa353f', 89, 0, 1431, 50, 0, 2650, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2147, 0, 0, '太原学院', '事业', '01', 10773, '074001', NULL, 8626, '140103197411080672', '应立冬', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('97e6256756f840bf959a62282cd6ac07', 99, 0, 1443, 0, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2165, 0, 0, '太原学院', '事业', '01', 10754, '074001', NULL, 8589, '522101198603070422', '潘婧', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9837e929d4e241b18cde427a0a0898ed', 89, 0, 1377, 50, 30, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2066, 0, 0, '太原学院', '事业', '01', 10109, '074001', NULL, 8043, '140104198107255029', '杨婷', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('983a90b14ccb4c9abb2a1987e6ccf48c', 79, 0, 1255, 0, 30, 2200, 0, 1696, 2590, 1292, 0, 0, 0, 0, 1883, 0, 0, '太原学院', '事业', '01', 9142, '074001', NULL, 7259, '411402198607064042', '刘俊庆', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('987a5ae1df5d4dda8775c320326b9f6b', 89, 0, 1294, 50, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1941, 0, 0, '太原学院', '事业', '01', 9515, '074001', NULL, 7574, '140109198403110029', '张焱', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9884ffcc38054a61940f28edfbc17e71', 74, 0, 1126, 0, 30, 1925, 0, 1087, 2520, 1215, 0, 0, 0, 0, 1689, 0, 0, '太原学院', '事业', '01', 7977, '074001', NULL, 6288, '14010819891003161X', '张烜', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('989feac43e99455889dec9cde8f8705a', 74, 0, 1117, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1676, 0, 0, '太原学院', '事业', '01', 7815, '074001', NULL, 6139, '140109199905255521', '刘聪', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('98c32ec7b1c74a15bff679d09dc61b50', 104, 0, 2011, 50, 0, 6070, 0, 3026, 2940, 1908, 0, 0, 0, 0, 3017, 0, 0, '太原学院', '事业', '01', 16109, '074001', NULL, 13092, '14240119780707141X', '蔡江辉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('98e8e9ac80294d34a474949209168c37', 89, 0, 1200, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1800, 0, 0, '太原学院', '事业', '01', 8639, '074001', NULL, 6839, '140302199304120812', '李博睿', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9907cac6029841d3b3f9fcbf49ad6779', 79, 0, 1277, 50, 0, 2200, 0, 1975, 2590, 1292, 0, 0, 0, 0, 1916, 0, 0, '太原学院', '事业', '01', 9463, '074001', NULL, 7547, '140103198110185715', '郭锐', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9923c4e0d44f4516b70e331cf457cee8', 89, 4.3, 1583, 0, 0, 2650, 0, 3641, 2660, 1418, 0, 0, 0, 0, 2375, 0, 0, '太原学院', '事业', '01', 12045.3, '074001', NULL, 9670.3, '140102196607170636', '马洪洁', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('992532bc58704f8e8c7cc6d83c44e2b2', 94, 0, 1441, 0, 30, 2880, 0, 2075, 2730, 1551, 0, 0, 0, 0, 2162, 0, 0, '太原学院', '事业', '01', 10801, '074001', NULL, 8639, '140311198212111726', '郑荣', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9a19b2783b8d488ea7bd31e4ee098fb4', 89, 0, 1297, 0, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1946, 0, 0, '太原学院', '事业', '01', 9561, '074001', NULL, 7615, '140107198202034522', '李楠', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9a1c0554d39a434bb582a0b31f598a6e', 94, 4.2, 1745, 0, 0, 3455, 0, 3391, 2800, 1810, 0, 0, 0, 0, 2618, 0, 0, '太原学院', '事业', '01', 13299.2, '074001', NULL, 10681.2, '140102196904285173', '卢旺堂', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9a7bd1a8831b43169a9765daba3a2148', 99, 0, 1507, 50, 30, 3030, 0, 2375, 2730, 1540, 0, 0, 0, 0, 2261, 0, 0, '太原学院', '事业', '01', 11361, '074001', NULL, 9100, '140102198002032328', '贾娟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9aaf38c609004798ae7db4fd1b8ba14a', 89, 0, 1543, 0, 0, 2650, 0, 3266, 2660, 1418, 0, 0, 0, 0, 2315, 0, 0, '太原学院', '事业', '01', 11626, '074001', NULL, 9311, '140102196908135172', '李建军', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9b22b55e78124e5683ded133b97582ed', 69, 0, 1158, 0, 0, 1940, 0, 1457, 2520, 1194, 0, 0, 0, 0, 1737, 0, 0, '太原学院', '事业', '01', 8338, '074001', NULL, 6601, '372925197703216515', '时维教', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9b38e7b029114fcdba1e96793084b4ce', 89, 0, 1332, 0, 0, 2185, 0, 2175, 2660, 1418, 0, 0, 0, 0, 1998, 0, 0, '太原学院', '事业', '01', 9859, '074001', NULL, 7861, '140102197808301414', '李波', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9bbeeae6e05e46889d769d1c7d5ebb80', 89, 0, 1306, 0, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1959, 0, 0, '太原学院', '事业', '01', 9570, '074001', NULL, 7611, '14010219820518062X', '李江雯', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9bf782fd66484903b3b15a72bd3a7a7e', 89, 0, 1442, 0, 0, 2185, 0, 3026, 2660, 1418, 0, 0, 0, 0, 2163, 0, 0, '太原学院', '事业', '01', 10820, '074001', NULL, 8657, '140108196912285534', '王琴琴', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9c0f05b99e1847be8c1548a50689fb8c', 89, 0, 1322, 0, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1983, 0, 0, '太原学院', '事业', '01', 9779, '074001', NULL, 7796, '140103198108201528', '陈曦', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9c39a18480a34b409eb120e2894a0a0e', 69, 0, 1337, 0, 30, 1925, 0, 2911, 2520, 1215, 0, 0, 0, 0, 2006, 0, 0, '太原学院', '事业', '01', 10007, '074001', NULL, 8001, '140103197010141542', '魏峻伟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9c3bf51343284d3886a29ca67abe2948', 99, 3.9, 1806, 0, 0, 3810, 0, 3921, 2730, 1540, 0, 0, 0, 0, 2709, 0, 0, '太原学院', '事业', '01', 13909.9, '074001', NULL, 11200.9, '140102196510140633', '兰贵亭', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9c471b4a9f014845b30a776f85d1fdaa', 89, 0, 1215, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1823, 0, 0, '太原学院', '事业', '01', 8848, '074001', NULL, 7025, '140603199404031027', '苏丽君', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9c6bc950c27143409e105b2814ffc347', 89, 0, 1294, 0, 0, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1941, 0, 0, '太原学院', '事业', '01', 9528, '074001', NULL, 7587, '142601198410161914', '韩帅', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9c9ba80a2f894390b0ab565946ef2ab1', 74, 0, 1119, 0, 0, 1925, 0, 1251, 2520, 1215, 0, 0, 0, 0, 1679, 0, 0, '太原学院', '事业', '01', 8104, '074001', NULL, 6425, '140702199210207134', '智东敏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9cb8ecbf5aef4b0f8515e4d153c192ab', 89, 0, 1297, 50, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1946, 0, 0, '太原学院', '事业', '01', 9611, '074001', NULL, 7665, '142702198304270326', '李婷', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9ce39c1a302f4439a9321cca13198ef9', 99, 0, 1382, 50, 0, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2073, 0, 0, '太原学院', '事业', '01', 11006, '074001', NULL, 8933, '140112198109023010', '李强', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9cffcc01919745b58638654cc7cf9217', 89, 0, 1270, 0, 0, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1905, 0, 0, '太原学院', '事业', '01', 9318, '074001', NULL, 7413, '440981198410086173', '钟宝', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9d5d06bcf4fe40528eafb67448155388', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '142603199307182028', '李旋', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9d9f41d24f2f498db5eb1c765cd82b23', 89, 0, 1204, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1806, 0, 0, '太原学院', '事业', '01', 8643, '074001', NULL, 6837, '142302199102160017', '高思远', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9da42171146e41d89271e6f3812ee051', 89, 0, 1285, 0, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1928, 0, 0, '太原学院', '事业', '01', 9456, '074001', NULL, 7528, '140107198411120662', '赵丽莎', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9db2ff502f7a42f5bca299faa61cd805', 89, 0, 1322, 50, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1983, 0, 0, '太原学院', '事业', '01', 9829, '074001', NULL, 7846, '142726198206260029', '杨旭丽', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9dece21a5d2642dbb355ac61cf569ea7', 89, 0, 1329, 0, 0, 2185, 0, 2175, 2660, 1418, 0, 0, 0, 0, 1994, 0, 0, '太原学院', '事业', '01', 9856, '074001', NULL, 7862, '140104198009280378', '刘乐澄', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9e0c6ce2c1244205979124bc7a03fc36', 99, 0, 1478, 0, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2217, 0, 0, '太原学院', '事业', '01', 10789, '074001', NULL, 8572, '140181198609022826', '武宇红', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9e305e99cd2046c3b01344bd70cefcd8', 74, 0, 1230, 0, 30, 1925, 0, 1882, 2520, 1215, 0, 0, 0, 0, 1845, 0, 0, '太原学院', '事业', '01', 8876, '074001', NULL, 7031, '140106198405100028', '徐敏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9e44c25c764246269be96fba4e66dc43', 89, 0, 1320, 0, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1980, 0, 0, '太原学院', '事业', '01', 9491, '074001', NULL, 7511, '142322198612220586', '孟超', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9e7ff2b92e7c47a3a7e81b591539bd58', 99, 0, 1603, 0, 0, 3030, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2405, 0, 0, '太原学院', '事业', '01', 12143, '074001', NULL, 9738, '220323197303106018', '陈显久', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9ec97b0d72a0450082f5d12847ef2c84', 89, 0, 1491, 0, 30, 2650, 0, 2911, 2660, 1418, 0, 0, 0, 0, 2237, 0, 0, '太原学院', '事业', '01', 11249, '074001', NULL, 9012, '140102197502186521', '李旭琴', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9f025fd39c0b4210b57154704e458b35', 89, 0, 1327, 50, 30, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1991, 0, 0, '太原学院', '事业', '01', 9866, '074001', NULL, 7875, '410823198104276222', '田丽', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9f52008ce3b045408ce09b3f68d3e747', 59, 0, 930, 0, 0, 1730, 0, 1117, 2450, 1148, 0, 0, 0, 0, 1395, 0, 0, '太原学院', '事业', '01', 7434, '074001', NULL, 6039, '140429198903252017', '崔树鹏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9f9656392b6d4397ba2260479819d650', 104, 0, 1887, 0, 30, 4640, 0, 2689, 2940, 1908, 0, 0, 0, 0, 2831, 0, 0, '太原学院', '事业', '01', 14198, '074001', NULL, 11367, '140102197608312346', '刘荷花', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9f97828b4ffa467db591ddf676bcb75d', 89, 0, 1352, 50, 30, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2028, 0, 0, '太原学院', '事业', '01', 10084, '074001', NULL, 8056, '140103198202184840', '要丽娟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('9fab2d61d4624a46ba08becd7955f8ce', 74, 0, 1229, 50, 30, 1925, 0, 1789, 2520, 1215, 0, 0, 0, 0, 1844, 0, 0, '太原学院', '事业', '01', 8832, '074001', NULL, 6988, '130124198401014529', '李朔', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a038ae183f664cec829de62c8988f52b', 69, 0, 1170, 0, 30, 1925, 0, 1427, 2520, 1215, 0, 0, 0, 0, 1755, 0, 0, '太原学院', '事业', '01', 8356, '074001', NULL, 6601, '142333199105271825', '卫丽琴', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a0423d5a463644658bb272a78650338f', 94, 0, 1686, 0, 30, 3455, 0, 2911, 2800, 1810, 0, 0, 0, 0, 2529, 0, 0, '太原学院', '事业', '01', 12786, '074001', NULL, 10257, '140102197711051420', '阎翔宇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a0af25bb4ae340b09adaa91d756f434a', 89, 0, 1291, 0, 0, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1937, 0, 0, '太原学院', '事业', '01', 9432, '074001', NULL, 7495, '140108198609192510', '代欣', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a0c7ee56c6b24130a2bd46754c130012', 99, 0, 1392, 0, 0, 3030, 0, 1515, 2730, 1540, 0, 0, 0, 0, 2088, 0, 0, '太原学院', '事业', '01', 10306, '074001', NULL, 8218, '142623198902045213', '张毅', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a0d171f2ca7946978b71383dc731ff87', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '140203199411092328', '王安琪', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a0f9c48130c842ac948b3d64357fc72f', 69, 0, 1293, 0, 0, 2260, 0, 1954, 2590, 1365, 0, 0, 0, 0, 1940, 0, 0, '太原学院', '事业', '01', 9531, '074001', NULL, 7591, '140426197708234434', '江志强', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a17d6503acf44249a9eb2f8e48a016c9', 99, 0, 1491, 0, 0, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2237, 0, 0, '太原学院', '事业', '01', 11165, '074001', NULL, 8928, '410323198204160553', '吕振伟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a189b563ca984da59a0bb2f52c937f9e', 74, 0, 1205, 0, 30, 1925, 0, 1882, 2520, 1215, 0, 0, 0, 0, 1808, 0, 0, '太原学院', '事业', '01', 8851, '074001', NULL, 7043, '140107198403273925', '任燕', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a1ab2af938e54c86a3ce0a7becdd5fdf', 89, 0, 1257, 0, 30, 2185, 0, 1515, 2660, 1418, 0, 0, 0, 0, 1886, 0, 0, '太原学院', '事业', '01', 9154, '074001', NULL, 7268, '140424198606234822', '李静森', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a1b28e2972d343ed9f7d352c600f48f4', 99, 0, 1551, 50, 30, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2327, 0, 0, '太原学院', '事业', '01', 11505, '074001', NULL, 9178, '142427197802283329', '李小芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a1bdb9d91d7c4df2a47d7456075a8061', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '142226199202252221', '姚江燕', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a1d46903b0504ce2a4188114abd2c6cd', 74, 0, 1189, 0, 0, 1925, 0, 1789, 2520, 1215, 0, 0, 0, 0, 1784, 0, 0, '太原学院', '事业', '01', 8712, '074001', NULL, 6928, '140122198409090138', '赵晖', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a1f75d803c24497abd0780a8b37edb2a', 89, 0, 1404, 0, 30, 2410, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2106, 0, 0, '太原学院', '事业', '01', 10486, '074001', NULL, 8380, '142629197712231027', '周雅娟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a2287c03902a41a29822cdbf2471afde', 94, 0, 1425, 0, 30, 2880, 0, 1882, 2730, 1551, 0, 0, 0, 0, 2138, 0, 0, '太原学院', '事业', '01', 10592, '074001', NULL, 8454, '140103197908220669', '郭慧辉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a272fbade7dc4d0bb4cf7d013f0e5c10', 74, 0, 1108, 0, 0, 1925, 0, 1169, 2520, 1215, 0, 0, 0, 0, 1662, 0, 0, '太原学院', '事业', '01', 8011, '074001', NULL, 6349, '140105199210122233', '杨浩宇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a31932e518704435b071434ea0a288fe', 89, 0, 1294, 0, 0, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1941, 0, 0, '太原学院', '事业', '01', 9528, '074001', NULL, 7587, '142601198410101938', '杨锐', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a34c991704614c7e84a9716fb4a0ab67', 89, 0, 1337, 50, 30, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 2006, 0, 0, '太原学院', '事业', '01', 9876, '074001', NULL, 7870, '142732198207170022', '王迎敏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a3d8669293974e88a5c2ecac31262c13', 99, 0, 1592, 50, 30, 3260, 0, 2796, 2730, 1540, 0, 0, 0, 0, 2388, 0, 0, '太原学院', '事业', '01', 12097, '074001', NULL, 9709, '142429197603210023', '王岩', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a4354e79e1684ae1a8a469654b2944fb', 74, 0, 1209, 0, 30, 1950, 0, 1882, 2520, 1215, 0, 0, 0, 0, 1814, 0, 0, '太原学院', '事业', '01', 8880, '074001', NULL, 7066, '140107198212270641', '李雅', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a4363cc7a2df4a2986d7f068a7d93ff8', 69, 4, 1402, 0, 0, 2260, 0, 2791, 2590, 1365, 0, 0, 0, 0, 2103, 0, 0, '太原学院', '事业', '01', 10481, '074001', NULL, 8378, '140103196806270652', '王建华', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a46ce9426a184faba80d78021a7c2221', 99, 0, 1524, 50, 30, 3260, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2286, 0, 0, '太原学院', '事业', '01', 11508, '074001', NULL, 9222, '14010219810904402X', '董锦', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a4d5a695a7c648418791091e0d26a322', 94, 0, 1645, 0, 0, 3455, 0, 2475, 2800, 1810, 0, 0, 0, 0, 2468, 0, 0, '太原学院', '事业', '01', 12279, '074001', NULL, 9811, '142431197606271536', '雷恒平', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a4f0699ffd284cc39c5f235d24a05e81', 69, 2.9, 1305, 0, 0, 1925, 0, 2689, 2520, 1215, 0, 0, 0, 0, 1958, 0, 0, '太原学院', '事业', '01', 9725.9, '074001', NULL, 7767.9, '140104197103073717', '马福君', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a515cce7c2084faa9c9eec81f211fff2', 89, 0, 1240, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1860, 0, 0, '太原学院', '事业', '01', 8791, '074001', NULL, 6931, '140624199309200066', '苗丽娟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a53d4c209ee54390a3179ae7948d373d', 99, 0, 1577, 0, 30, 3030, 0, 2911, 2730, 1540, 0, 0, 0, 0, 2366, 0, 0, '太原学院', '事业', '01', 11917, '074001', NULL, 9551, '140121197302178040', '杨翠峰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a568ff9ce90a449289eef9960d3b7898', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '140427199402158147', '秦雪洁', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a5d76da2529c41d69d00c92b806c9771', 99, 0, 1622, 0, 30, 3260, 0, 3026, 2730, 1540, 0, 0, 0, 0, 2433, 0, 0, '太原学院', '事业', '01', 12307, '074001', NULL, 9874, '140102197210236021', '丁玮', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a5db419dd8b149a6be0d480331943fd2', 99, 0, 1481, 0, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2222, 0, 0, '太原学院', '事业', '01', 11085, '074001', NULL, 8863, '142429198112043827', '游秀芬', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a64faa7c6cfe4ccc933a4370d0db36a4', 89, 0, 1270, 50, 0, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1905, 0, 0, '太原学院', '事业', '01', 9368, '074001', NULL, 7463, '140107198311252238', '聂瑞涛', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a650067d63f34ecbabd13d30d5b6d77c', 99, 0, 1468, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2202, 0, 0, '太原学院', '事业', '01', 11022, '074001', NULL, 8820, '140107198307222626', '张婷', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a6f4090626b940369c67180406a219fb', 94, 0, 1437, 0, 0, 2880, 0, 2075, 2730, 1551, 0, 0, 0, 0, 2156, 0, 0, '太原学院', '事业', '01', 10767, '074001', NULL, 8611, '142433198104031652', '张新生', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a70e573fc74c4d9bb111a3075359ba50', 79, 0, 1252, 0, 0, 2200, 0, 1789, 2590, 1292, 0, 0, 0, 0, 1878, 0, 0, '太原学院', '事业', '01', 9202, '074001', NULL, 7324, '140622198612190019', '俞晓峰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a7153ca9cec447d6b138632f3ffdfcef', 104, 0, 1798, 0, 30, 4640, 0, 2075, 2940, 1908, 0, 0, 0, 0, 2697, 0, 0, '太原学院', '事业', '01', 13495, '074001', NULL, 10798, '142726198109240026', '翟婷婷', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a7226da448ea4934a65d64fa2cd6617a', 99, 0, 1682, 0, 0, 3260, 0, 3516, 2730, 1540, 0, 0, 0, 0, 2523, 0, 0, '太原学院', '事业', '01', 12827, '074001', NULL, 10304, '142224196810090012', '张永清', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a7b1ca174105425c80f9d3954394e874', 99, 0, 1558, 50, 30, 3260, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2337, 0, 0, '太原学院', '事业', '01', 11542, '074001', NULL, 9205, '140624197803201022', '刘慧琴', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a7bb0e9ef41649dea814d086a4a2a20e', 99, 0, 1481, 0, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2222, 0, 0, '太原学院', '事业', '01', 11085, '074001', NULL, 8863, '140102197907171440', '侯乐旻', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a7f27d0728224c64a2e7b8dda0d7164c', 99, 0, 1373, 0, 30, 3030, 0, 1339, 2730, 1540, 0, 0, 0, 0, 2060, 0, 0, '太原学院', '事业', '01', 10141, '074001', NULL, 8081, '142625199301181727', '郭婷婷', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a7fbf53b743c437c9571758a0066a66e', 89, 0, 1297, 50, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1946, 0, 0, '太原学院', '事业', '01', 9611, '074001', NULL, 7665, '140106198309013047', '贾莉婷', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a8115c6a4067479a9934b2670c9335eb', 99, 0, 1504, 0, 0, 3260, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2256, 0, 0, '太原学院', '事业', '01', 11208, '074001', NULL, 8952, '140302198001160556', '傅斌', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a815cbb0553f491b94677b49d17e3d31', 89, 0, 1215, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1823, 0, 0, '太原学院', '事业', '01', 8848, '074001', NULL, 7025, '140423199012262824', '王会芝', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a896c6bf0bad482b9c8865105a7b8a3e', 89, 0, 1431, 50, 0, 2650, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2147, 0, 0, '太原学院', '事业', '01', 10773, '074001', NULL, 8626, '14032119771229271X', '董海瑞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a8a5f118dfba467ba514a23f3d59cb74', 89, 0, 1304, 0, 0, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1956, 0, 0, '太原学院', '事业', '01', 9538, '074001', NULL, 7582, '142623198501213036', '史俊冰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a9240260202940ffae0e7bb89f68fde4', 69, 0, 1043, 0, 30, 1925, 0, 639, 2520, 1215, 0, 0, 0, 0, 1565, 0, 0, '太原学院', '事业', '01', 7441, '074001', NULL, 5876, '654028199911040807', '马晓琴', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a929c769e31146fb903e7b1c18bb3849', 99, 0, 1506, 0, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2259, 0, 0, '太原学院', '事业', '01', 11110, '074001', NULL, 8851, '142202198207140522', '贾晓霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a98ae55e6cd7428da9d90dd8026ea97c', 89, 0, 1261, 0, 30, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1892, 0, 0, '太原学院', '事业', '01', 9246, '074001', NULL, 7354, '140107198711020620', '闫如玉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a98f1b96114a408d858eaf4847144161', 99, 3.5, 1636, 0, 0, 3030, 0, 3391, 2730, 1540, 0, 0, 0, 0, 2454, 0, 0, '太原学院', '事业', '01', 12429.5, '074001', NULL, 9975.5, '142223196712246718', '王利军', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a990bd6fac354f079a82ccc65985a285', 74, 0, 1271, 0, 30, 1950, 0, 2175, 2520, 1215, 0, 0, 0, 0, 1907, 0, 0, '太原学院', '事业', '01', 9235, '074001', NULL, 7328, '142701198006180924', '许琴', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('a9a317a9968c41349c08ffbd6d5f76b8', 89, 0, 1460, 0, 30, 2410, 0, 2911, 2660, 1418, 0, 0, 0, 0, 2190, 0, 0, '太原学院', '事业', '01', 10978, '074001', NULL, 8788, '140108197311071981', '黄岩梅', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('aa63be79dabd4c5e9bdb879c96f473b1', 99, 0, 1478, 0, 0, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2217, 0, 0, '太原学院', '事业', '01', 11052, '074001', NULL, 8835, '140110198209191019', '师永强', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('aab4d512cb434a4e89170dcba916b020', 89, 0, 1250, 0, 30, 2185, 0, 1515, 2660, 1418, 0, 0, 0, 0, 1875, 0, 0, '太原学院', '事业', '01', 9147, '074001', NULL, 7272, '141102198812220049', '马潇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('aac7106214ad4b7bb537693da0340c26', 99, 4, 1653, 0, 30, 3260, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2480, 0, 0, '太原学院', '事业', '01', 12582, '074001', NULL, 10102, '140102197101176541', '牛月秀', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('aac97782086040dca4252ee9a10b630a', 99, 0, 1573, 0, 0, 3030, 0, 2911, 2730, 1540, 0, 0, 0, 0, 2360, 0, 0, '太原学院', '事业', '01', 11883, '074001', NULL, 9523, '14112419730127011X', '闫震普', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ab560df0608c449fb5fa693a6333adac', 74, 0, 1116, 0, 30, 1925, 0, 1005, 2520, 1215, 0, 0, 0, 0, 1674, 0, 0, '太原学院', '事业', '01', 7885, '074001', NULL, 6211, '140603199709219987', '孙泽利', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ab8f4348f29f4d92ac7bed495ce8a662', 74, 0, 1192, 0, 30, 1925, 0, 1789, 2520, 1215, 0, 0, 0, 0, 1788, 0, 0, '太原学院', '事业', '01', 8745, '074001', NULL, 6957, '14010619850703122X', '宋璐', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('aba82b58146c41179ab5a02cfd1bcd78', 99, 0, 1791, 0, 30, 3810, 0, 3781, 2730, 1540, 0, 0, 0, 0, 2687, 0, 0, '太原学院', '事业', '01', 13781, '074001', NULL, 11094, '142601196810021946', '赵晓梅', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('abbc36972b954ccc82faa96f33afae5c', 89, 0, 1287, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1931, 0, 0, '太原学院', '事业', '01', 9365, '074001', NULL, 7434, '142603198908181149', '米娟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('abca3f376bf04e908808e1e8435b369f', 69, 0, 1302, 0, 0, 2260, 0, 1954, 2590, 1365, 0, 0, 0, 0, 1953, 0, 0, '太原学院', '事业', '01', 9540, '074001', NULL, 7587, '14010219750325061X', '吴辉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('abd96fa98d87481895f2a3db02799bb3', 99, 0, 1653, 0, 30, 3260, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2480, 0, 0, '太原学院', '事业', '01', 12578, '074001', NULL, 10098, '140102197004152089', '王左艳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ac0fd679723f4e08849a97c8cee3a0e2', 99, 4.2, 1874, 0, 30, 3810, 0, 4341, 2730, 1540, 0, 0, 0, 0, 2811, 0, 0, '太原学院', '事业', '01', 14428.2, '074001', NULL, 11617.2, '140102196510040827', '王玉兰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('acd4338d0a0746949bc45e36e27978ca', 99, 0, 1407, 0, 30, 3030, 0, 1603, 2730, 1540, 0, 0, 0, 0, 2111, 0, 0, '太原学院', '事业', '01', 10439, '074001', NULL, 8328, '140321198807170947', '岳娜', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('acf0e58d4f13400fb2f1fc25cf1e476c', 99, 4.6, 1846, 0, 30, 3810, 0, 4201, 2730, 1540, 0, 0, 0, 0, 2769, 0, 0, '太原学院', '事业', '01', 14260.6, '074001', NULL, 11491.6, '140102196605134842', '刘云芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ad9664d51b054f718c008a1d2226e4a6', 99, 0, 1681, 0, 30, 3030, 0, 3641, 2730, 1540, 0, 0, 0, 0, 2522, 0, 0, '太原学院', '事业', '01', 12751, '074001', NULL, 10229, '220104196604212661', '周璠', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ad9c6252781b4a24987ce57e87608f6d', 89, 4.2, 1567, 0, 0, 2650, 0, 3516, 2660, 1418, 0, 0, 0, 0, 2351, 0, 0, '太原学院', '事业', '01', 11904.2, '074001', NULL, 9553.2, '320113196802024856', '赵登科', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('add2908327b147359f131f9b07c9375d', 89, 0, 1431, 0, 0, 2650, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2147, 0, 0, '太原学院', '事业', '01', 10723, '074001', NULL, 8576, '142222197812100335', '李向军', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ae4f4c546a064942863a55445bacb0fe', 55.2, 0, 550, 0, 0, 1540, 0, 1212, 0, 972, 0, 0, 0, 0, 825, 0, 0, '太原学院', '事业', '01', 4329.2, '074001', NULL, 3504.2, '140103196807161239', '王曦华', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ae7b7949774e46edb358be9da2510b5b', 89, 0, 1391, 50, 30, 2410, 0, 2375, 2660, 1418, 0, 0, 0, 0, 2087, 0, 0, '太原学院', '事业', '01', 10423, '074001', NULL, 8336, '142222197810020024', '齐红霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ae8955b96b32452091f26b3f6dccbc9c', 89, 0, 1352, 0, 30, 2410, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2028, 0, 0, '太原学院', '事业', '01', 9934, '074001', NULL, 7906, '140102198110235165', '钱晓燕', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('aeae668cc0d148bfbe4212d0d6ee78b6', 64, 0, 991, 0, 0, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1487, 0, 0, '太原学院', '事业', '01', 8083, '074001', NULL, 6596, '140622198810043319', '曹世楠', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('aebc535ce502435cb9b3a9e699dcd177', 99, 3.5, 1810, 0, 30, 3810, 0, 3921, 2730, 1540, 0, 0, 0, 0, 2715, 0, 0, '太原学院', '事业', '01', 13943.5, '074001', NULL, 11228.5, '510102197001208541', '郭东玲', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('af1b56660c7a49a1ad7dac8b3df7030d', 94, 0, 1705, 50, 30, 3455, 0, 2911, 2800, 1810, 0, 0, 0, 0, 2558, 0, 0, '太原学院', '事业', '01', 12855, '074001', NULL, 10297, '140121197407090029', '韩俊秦', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('af6eed8ed628481499a48c6b524dead1', 89, 0, 1428, 0, 0, 2410, 0, 2689, 2660, 1418, 0, 0, 0, 0, 2142, 0, 0, '太原学院', '事业', '01', 10694, '074001', NULL, 8552, '14010219731220061X', '张巍', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('afe573ee68e94556a9c966047e30eb8f', 99, 0, 1592, 0, 30, 3260, 0, 2796, 2730, 1540, 0, 0, 0, 0, 2388, 0, 0, '太原学院', '事业', '01', 12047, '074001', NULL, 9659, '142422197506111520', '张彩霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('afeabbb64f4c42daba59ac64390fa4ad', 89, 0, 1522, 0, 0, 2650, 0, 2911, 2660, 1418, 0, 0, 0, 0, 2283, 0, 0, '太原学院', '事业', '01', 11250, '074001', NULL, 8967, '140102197211290038', '冉志钢', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('affb1e66124e455dbfdb95ff37f9b6d0', 89, 0, 1211, 0, 0, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1817, 0, 0, '太原学院', '事业', '01', 8732, '074001', NULL, 6915, '142623199209066416', '孙萌', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b039b561a72e4b44ac305b827b25fbdf', 94, 0, 1450, 0, 30, 2880, 0, 2075, 2730, 1551, 0, 0, 0, 0, 2175, 0, 0, '太原学院', '事业', '01', 10810, '074001', NULL, 8635, '140302198111050024', '范菲', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b07bfc305a5945cab33b9fd61026a4d1', 74, 0, 1081, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1622, 0, 0, '太原学院', '事业', '01', 7779, '074001', NULL, 6157, '140107199408260626', '孙宇璇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b0c4a499333b4dbaa1a5bf87ebe4d5ab', 79, 0, 1387, 0, 30, 2200, 0, 2796, 2590, 1292, 0, 0, 0, 0, 2081, 0, 0, '太原学院', '事业', '01', 10374, '074001', NULL, 8293, '14010219701209232X', '代素文', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b11971b4de064e6180033eeeadbe3580', 99, 0, 1425, 0, 0, 3030, 0, 1696, 2730, 1540, 0, 0, 0, 0, 2138, 0, 0, '太原学院', '事业', '01', 10520, '074001', NULL, 8382, '142228198712060017', '刘正', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b132b6e7332948fea63a9ed2c30a179f', 99, 0, 1516, 50, 0, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2274, 0, 0, '太原学院', '事业', '01', 11240, '074001', NULL, 8966, '140226197906176019', '李建利', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b138361c0b7c4dc5a78165b4fdedb312', 89, 0, 1310, 50, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1965, 0, 0, '太原学院', '事业', '01', 9531, '074001', NULL, 7566, '140108198403290844', '杨青', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b166e15e93674d9f8b950f71281da3e7', 94, 0, 1498, 0, 0, 2880, 0, 2475, 2730, 1551, 0, 0, 0, 0, 2247, 0, 0, '太原学院', '事业', '01', 11228, '074001', NULL, 8981, '142321197603155013', '刘立新', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b1baeb72abc64303a8a9634bb60b51a4', 104, 0, 2272, 0, 0, 5125, 0, 4481, 3220, 2426, 0, 0, 0, 0, 3408, 0, 0, '太原学院', '事业', '01', 17628, '074001', NULL, 14220, '142601196805241936', '郝勇东', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b1cde7e9f82b42fe8535d9ed4d839a73', 99, 0, 1478, 0, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2217, 0, 0, '太原学院', '事业', '01', 10982, '074001', NULL, 8765, '140106198203171928', '张枫', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b20794bccb314b2b8dfd791c8e68c8f3', 99, 0, 1420, 0, 0, 3030, 0, 1603, 2730, 1540, 0, 0, 0, 0, 2130, 0, 0, '太原学院', '事业', '01', 10422, '074001', NULL, 8292, '140105198706030530', '张帅', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b23c90de9fd942d68529032666063df0', 99, 0, 1480, 0, 30, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2220, 0, 0, '太原学院', '事业', '01', 10884, '074001', NULL, 8664, '370983198509231822', '李慧', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b2e809a8a02a49ae884b3517bfee1292', 89, 0, 1534, 0, 0, 2650, 0, 3266, 2660, 1418, 0, 0, 0, 0, 2301, 0, 0, '太原学院', '事业', '01', 11617, '074001', NULL, 9316, '142401196909142413', '乔国峰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b353b71307b347898ad7aa3d8f1ff916', 99, 0, 1738, 0, 30, 3260, 13, 3921, 2730, 1540, 0, 0, 0, 0, 2607, 0, 0, '太原学院', '事业', '01', 13331, '074001', NULL, 10724, '140102196701114825', '牛智红', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b37a1198ea4e41d7b3ad6bea0d82109e', 89, 0, 1358, 50, 30, 2185, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2037, 0, 0, '太原学院', '事业', '01', 10065, '074001', NULL, 8028, '140102197810230627', '智建丽', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b3a58b8383da4210a8f278fa28c8a286', 89, 0, 1188, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1782, 0, 0, '太原学院', '事业', '01', 8545, '074001', NULL, 6763, '142225199704087012', '籍明慧', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b3d64d099f814bef83f1589d344c4799', 74, 0, 1233, 0, 30, 1950, 0, 2075, 2520, 1215, 0, 0, 0, 0, 1850, 0, 0, '太原学院', '事业', '01', 9097, '074001', NULL, 7247, '142623198101120826', '胡筱瑜', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b3f1cd9fff384d50bcc0e5e39b029087', 89, 0, 1181, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1772, 0, 0, '太原学院', '事业', '01', 8568, '074001', NULL, 6796, '142431199512280668', '郭晓婷', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b4662ce081ba4d389473173fde9c608a', 74, 0, 1155, 0, 0, 1925, 0, 1339, 2520, 1215, 0, 0, 0, 0, 1733, 0, 0, '太原学院', '事业', '01', 8228, '074001', NULL, 6495, '140106199010091811', '李权峰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b51eea0490024ef880f6472a4d6cfb77', 89, 0, 1309, 0, 30, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 1964, 0, 0, '太原学院', '事业', '01', 9666, '074001', NULL, 7702, '140302198008211029', '吴瑕', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b540f8b75bae43699f64fa22c62c38a8', 99, 0, 1490, 0, 0, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2235, 0, 0, '太原学院', '事业', '01', 10964, '074001', NULL, 8729, '142701198209071250', '程明', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b55e1dfae982459eb5e82d013ff085b4', 99, 0, 1440, 50, 0, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2160, 0, 0, '太原学院', '事业', '01', 10771, '074001', NULL, 8611, '140103197809261211', '王占君', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b5d50f9f53694c5092a3e8842ba22e88', 89, 0, 1404, 50, 30, 2410, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2106, 0, 0, '太原学院', '事业', '01', 10536, '074001', NULL, 8430, '142625197602224621', '张颖娟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b5e95db699e94ae9aadf6f42416710c1', 99, 0, 1592, 0, 30, 3260, 0, 2796, 2730, 1540, 0, 0, 0, 0, 2388, 0, 0, '太原学院', '事业', '01', 12047, '074001', NULL, 9659, '140511197203166342', '王红梅', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b61be2604f2540b69e274d153bec9610', 69, 0, 1226, 0, 0, 1830, 0, 2221, 2450, 1176, 0, 0, 0, 0, 1839, 0, 0, '太原学院', '事业', '01', 8972, '074001', NULL, 7133, '142131197112195514', '马树国', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b71565aa40404deab55fcb65a2cf741b', 89, 0, 1404, 0, 30, 2410, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2106, 0, 0, '太原学院', '事业', '01', 10486, '074001', NULL, 8380, '142424197609202321', '李海珍', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b778f628006641da888fb9e179265177', 99, 0, 1404, 0, 0, 3030, 0, 1603, 2730, 1540, 0, 0, 0, 0, 2106, 0, 0, '太原学院', '事业', '01', 10406, '074001', NULL, 8300, '14270119881025121X', '葛启隆', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b7898b800cab41e48f5740ce895ee55a', 99, 0, 1432, 0, 30, 3030, 0, 1603, 2730, 1540, 0, 0, 0, 0, 2148, 0, 0, '太原学院', '事业', '01', 10464, '074001', NULL, 8316, '412723198711212948', '程凤伟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b7b38e34b74c4e449aaacd09bef35876', 89, 0, 1294, 50, 0, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1941, 0, 0, '太原学院', '事业', '01', 9578, '074001', NULL, 7637, '432503198305215016', '王玉华', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b8a2ad31aea34159a44f7b36b1659be9', 89, 0, 1238, 0, 30, 2185, 0, 1427, 2660, 1418, 0, 0, 0, 0, 1857, 0, 0, '太原学院', '事业', '01', 9047, '074001', NULL, 7190, '230505199003270528', '郭宇朦', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b8d3f5215e6049aebef6b10c62d6a61e', 89, 0, 1386, 50, 30, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2079, 0, 0, '太原学院', '事业', '01', 10118, '074001', NULL, 8039, '142232198106240469', '韩乐', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b97a0a7273c04b2cb270623f920b8f41', 94, 0, 1512, 0, 0, 2880, 0, 2582, 2730, 1551, 0, 0, 0, 0, 2268, 0, 0, '太原学院', '事业', '01', 11349, '074001', NULL, 9081, '140103197512050632', '黄凌', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b99f3b52fab34054b2e8440fbfc97901', 99, 0, 1558, 0, 0, 3030, 0, 2796, 2730, 1540, 0, 0, 0, 0, 2337, 0, 0, '太原学院', '事业', '01', 11753, '074001', NULL, 9416, '140102197510206510', '王东亮', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('b9bb805d392e4a40afad85e204d988d8', 99, 0, 1498, 50, 30, 3260, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2247, 0, 0, '太原学院', '事业', '01', 11282, '074001', NULL, 9035, '140102198111271440', '尹一帆', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ba2894d72cef44db9544e49e4d338442', 99, 0, 1428, 0, 30, 3030, 0, 1696, 2730, 1540, 0, 0, 0, 0, 2142, 0, 0, '太原学院', '事业', '01', 10553, '074001', NULL, 8411, '140106198610272566', '闫旭', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ba6aa78ce3b146079713fcbbaf622702', 74, 0, 1116, 0, 30, 1925, 0, 1005, 2520, 1215, 0, 0, 0, 0, 1674, 0, 0, '太原学院', '事业', '01', 7885, '074001', NULL, 6211, '140411199512115243', '平思亮', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ba978f856e134659af41144a0a4a6f60', 99, 0, 1519, 0, 30, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2279, 0, 0, '太原学院', '事业', '01', 11223, '074001', NULL, 8944, '142628197910220023', '李晓茹', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('bafcd6b81db342c8a86b3a2e51bb041a', 74, 0, 1230, 50, 30, 1925, 0, 1882, 2520, 1215, 0, 0, 0, 0, 1845, 0, 0, '太原学院', '事业', '01', 8926, '074001', NULL, 7081, '14010719820818066X', '苗青', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('bb6c537eeada4882ae2c66655e694729', 89, 0, 1361, 0, 30, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2042, 0, 0, '太原学院', '事业', '01', 10043, '074001', NULL, 8001, '142723198107200021', '王娟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('bbe7e3208470404caa2881d545057eb8', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '14012119960125468X', '郝俊雪', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('bbf63ea72cf04557a84103b147fff10d', 89, 0, 1199, 0, 0, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1799, 0, 0, '太原学院', '事业', '01', 8720, '074001', NULL, 6921, '14010719920306121X', '刘振超', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('bc21956719f6403585584dda8743470e', 89, 0, 1319, 0, 0, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1979, 0, 0, '太原学院', '事业', '01', 9553, '074001', NULL, 7574, '140103198006114212', '班波', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('bc2d13a21d6a4a5ebcfa4f6cef892a79', 89, 0, 1349, 0, 30, 2410, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2024, 0, 0, '太原学院', '事业', '01', 9931, '074001', NULL, 7907, '142303198601064566', '任晶晶', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('bc5f100b2a25438dbd2978800084ce31', 69, 0, 1304, 0, 0, 2260, 0, 2041, 2590, 1365, 0, 0, 0, 0, 1956, 0, 0, '太原学院', '事业', '01', 9629, '074001', NULL, 7673, '140106197504045138', '郭满生', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('bc687c98b40e4fc5866ee216a67b0ecc', 79, 0, 1328, 0, 0, 2520, 0, 1789, 2660, 1383, 0, 0, 0, 0, 1992, 0, 0, '太原学院', '事业', '01', 9759, '074001', NULL, 7767, '142401198609210911', '翟璠', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('bc9224c868ba4cdc80c0123390c16244', 89, 0, 1273, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1910, 0, 0, '太原学院', '事业', '01', 9351, '074001', NULL, 7441, '140511198710172389', '张珍珍', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('bcaa5841f1af40caa070850a50fd8ccc', 79, 0, 1275, 0, 30, 2200, 0, 1696, 2590, 1292, 0, 0, 0, 0, 1913, 0, 0, '太原学院', '事业', '01', 9162, '074001', NULL, 7249, '142231198309240825', '章培英', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('bd03667f604c4537b35aa91382d04aec', 89, 0, 1398, 50, 0, 2185, 0, 2689, 2660, 1418, 0, 0, 0, 0, 2097, 0, 0, '太原学院', '事业', '01', 10489, '074001', NULL, 8392, '142223197607243915', '韩云伟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('bd3042230be94350bf195ab9ce8f27e6', 99, 0, 1423, 0, 30, 3030, 0, 1789, 2730, 1540, 0, 0, 0, 0, 2135, 0, 0, '太原学院', '事业', '01', 10641, '074001', NULL, 8506, '142302198211241065', '郭建秀', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('bd7271b6872644ada073f11f371f1dec', 89, 0, 1213, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1820, 0, 0, '太原学院', '事业', '01', 8570, '074001', NULL, 6750, '142630199404271013', '杨沐霖', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('bdb1f896c4734a3f9bdfb874d6f6bec5', 69, 0, 1323, 0, 30, 1925, 0, 2796, 2520, 1215, 0, 0, 0, 0, 1985, 0, 0, '太原学院', '事业', '01', 9878, '074001', NULL, 7893, '140104197203092245', '米峮', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('bdd055ac3b11414489bb3bd6f8fda4b2', 69, 0, 1257, 50, 30, 2260, 0, 1457, 2590, 1365, 0, 0, 0, 0, 1886, 0, 0, '太原学院', '事业', '01', 9078, '074001', NULL, 7192, '142603198207101046', '李敏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('bdd1dfa6b61742f88ea26ead7ce5a485', 89, 0, 1361, 0, 0, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2042, 0, 0, '太原学院', '事业', '01', 10113, '074001', NULL, 8071, '14042919781115321X', '郁建军', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('bdde82373f35456ebc13f41bcf8551d8', 89, 0, 1294, 50, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1941, 0, 0, '太原学院', '事业', '01', 9515, '074001', NULL, 7574, '14233019851228622X', '岳彦青', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('be17d48c136a4ce783d4ec928f41ec69', 89, 0, 1297, 0, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1946, 0, 0, '太原学院', '事业', '01', 9561, '074001', NULL, 7615, '14010219790304652X', '王婷', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('be1c83a5cad14ba2840800fc1aafe427', 89, 0, 1485, 0, 30, 2650, 0, 2796, 2660, 1418, 0, 0, 0, 0, 2228, 0, 0, '太原学院', '事业', '01', 11128, '074001', NULL, 8900, '140202197505124022', '孙红', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('be1cd23de75b48d9b070b42ef2dc2621', 89, 0, 1285, 0, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1928, 0, 0, '太原学院', '事业', '01', 9456, '074001', NULL, 7528, '140121198411108046', '杨晓云', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('be3807bcf8ac4a1da02293f64231011c', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -12251.5, 0, 0, 0, 0, 30000, '太原学院', '事业', '01', 17748.5, '074001', NULL, 17748.5, '150104196508251355', '赵利民', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('be4dbc6579264eee8559f6a2fbcb65d7', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '140212199612032483', '赵登婕', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('be8ed24838614301998ae2f072b0a9a0', 74, 0, 1170, 0, 30, 1925, 0, 1427, 2520, 1215, 0, 0, 0, 0, 1755, 0, 0, '太原学院', '事业', '01', 8361, '074001', NULL, 6606, '130982198809061123', '丁立杰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('bf0b3932492745b7a3052668568a6395', 99, 0, 1465, 0, 0, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2198, 0, 0, '太原学院', '事业', '01', 10939, '074001', NULL, 8741, '140102198207313414', '胡轶', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('bf14b96a16af4f0a80e4708440fad758', 89, 0, 1205, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1808, 0, 0, '太原学院', '事业', '01', 8756, '074001', NULL, 6948, '140121199306203521', '高瑞娟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('bf306ce8a1574cfe99092bb1ac8c942a', 74, 0, 1108, 0, 0, 1925, 0, 1169, 2520, 1215, 0, 0, 0, 0, 1662, 0, 0, '太原学院', '事业', '01', 8011, '074001', NULL, 6349, '370782199206170839', '管国祥', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('bf99822b470742578913bd8a634f372f', 89, 0, 1226, 0, 0, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1839, 0, 0, '太原学院', '事业', '01', 8747, '074001', NULL, 6908, '130406199210270616', '张鑫', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('bf9d616349414311a152530a4f4655b5', 89, 0, 1383, 0, 30, 2185, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2075, 0, 0, '太原学院', '事业', '01', 10240, '074001', NULL, 8165, '142323197810290229', '张文娟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('bfce2efcfc994ce482dc69ead513b320', 69, 0, 1180, 0, 30, 1925, 0, 1696, 2520, 1215, 0, 0, 0, 0, 1770, 0, 0, '太原学院', '事业', '01', 8635, '074001', NULL, 6865, '320324198206184481', '张晓艳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('bffb8e005c0c42efa937303146395b7c', 89, 0, 1213, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1820, 0, 0, '太原学院', '事业', '01', 8846, '074001', NULL, 7026, '140603198909175726', '张志平', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c0010d84f9bd4efaba1bdd4614fe7826', 104, 0, 2075, 0, 30, 5220, 0, 3516, 2940, 1908, 0, 0, 0, 0, 3113, 0, 0, '太原学院', '事业', '01', 15793, '074001', NULL, 12680, '140202197204204029', '梁红梅', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c03efeb88b0a454584f835ba27fea5a6', 99, 0, 1452, 50, 0, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2178, 0, 0, '太原学院', '事业', '01', 10876, '074001', NULL, 8698, '142725198212090015', '畅鹏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c0b7b6de147041c8a3bd78183d3a0036', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '140109199611122547', '刘嘉乐', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c0c8e392926f43b89a33432f7706725e', 99, 3.2, 1622, 0, 30, 3260, 0, 3026, 2730, 1540, 0, 0, 0, 0, 2433, 0, 0, '太原学院', '事业', '01', 12310.2, '074001', NULL, 9877.2, '140102197208312320', '任雪娟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c0eed96bcd9e4c8db0270989f15268bb', 74, 0, 1192, 0, 30, 1925, 0, 1789, 2520, 1215, 0, 0, 0, 0, 1788, 0, 0, '太原学院', '事业', '01', 8745, '074001', NULL, 6957, '430682198210071063', '刘琼', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c157a00705a54af9afbdfe3d8ed8a26b', 69, 0, 1307, 0, 30, 2260, 0, 1954, 2590, 1365, 0, 0, 0, 0, 1961, 0, 0, '太原学院', '事业', '01', 9575, '074001', NULL, 7614, '140110197608072063', '白英娟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c1a0b2633fd8450795305bc0b352b0b2', 104, 0, 2181, 0, 0, 6070, 0, 3781, 2940, 1908, 0, 0, 0, 0, 3272, 0, 0, '太原学院', '事业', '01', 16984, '074001', NULL, 13712, '120225197210292070', '桂志国', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c26093a4562b469aa78eb0347fc5d990', 89, 0, 1322, 0, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1983, 0, 0, '太原学院', '事业', '01', 9779, '074001', NULL, 7796, '142724198308210011', '王晓锋', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c38a8c352d4948bdba3be3105a732dde', 99, 0, 1838, 0, 30, 3810, 0, 4061, 2730, 1540, 0, 0, 0, 0, 2757, 0, 0, '太原学院', '事业', '01', 14108, '074001', NULL, 11351, '140103196701191544', '王树红', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c3b709ed3ac44b99b01f96bb7a698ac3', 89, 0, 1435, 0, 30, 2650, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2153, 0, 0, '太原学院', '事业', '01', 10757, '074001', NULL, 8604, '142225197601200028', '王改凤', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c3eb6231679949db8e60ad0cc460c698', 94, 0, 1489, 0, 0, 2880, 0, 2475, 2730, 1551, 0, 0, 0, 0, 2234, 0, 0, '太原学院', '事业', '01', 11219, '074001', NULL, 8985, '142622197908124210', '李峰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c4253c422b464d15a85c7b0faea966c9', 89, 0, 1306, 50, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1959, 0, 0, '太原学院', '事业', '01', 9620, '074001', NULL, 7661, '140108198302024846', '李宗瑾', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c48db8582d714bf08a0a4e21a3566570', 104, 0, 1754, 0, 0, 4640, 0, 1975, 2940, 1908, 0, 0, 0, 0, 2631, 0, 0, '太原学院', '事业', '01', 13321, '074001', NULL, 10690, '140108198206043211', '张小勇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c4b273cc944643a582b5a30519bb9331', 89, 0, 1340, 0, 30, 2410, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2010, 0, 0, '太原学院', '事业', '01', 9922, '074001', NULL, 7912, '140105198311071928', '王晓炜', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c4b3332498ed4ad9a232d24dd9c49e8d', 89, 0, 1404, 50, 30, 2410, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2106, 0, 0, '太原学院', '事业', '01', 10536, '074001', NULL, 8430, '142431197904270021', '邵海林', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c4bb5ed1254e4a3189bb9d30c6b599ba', 99, 0, 1481, 0, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2222, 0, 0, '太原学院', '事业', '01', 11085, '074001', NULL, 8863, '142223198204213329', '张婧', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c4be8301595a40a7b43a051bb977671e', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '141102199408300041', '冯叶', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c5add7f02a7a4977863f73bf8fb7157c', 99, 4.1, 1844, 50, 30, 3810, 8, 3921, 2730, 1540, 0, 0, 0, 0, 2766, 0, 0, '太原学院', '事业', '01', 14036.1, '074001', NULL, 11270.1, '140102196801223420', '梁晓琴', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c5c9aeaf61f8491c8db2e258c7ffa9cb', 89, 0, 1378, 50, 30, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2067, 0, 0, '太原学院', '事业', '01', 10310, '074001', NULL, 8243, '140522198211172324', '栗文敏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c6b39084563043dab2dd5edee03c3ffc', 89, 0, 1227, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1841, 0, 0, '太原学院', '事业', '01', 8948, '074001', NULL, 7107, '140109199006251527', '张驰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c6e9c489b5e34a33b9f2fd6998b38f44', 94, 0, 1761, 0, 0, 3455, 0, 3516, 2800, 1810, 0, 0, 0, 0, 2642, 0, 0, '太原学院', '事业', '01', 13436, '074001', NULL, 10794, '140102196601091216', '袁忍强', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c7b9b00abdbf49ab92fe923bb8ed27ee', 99, 0, 1545, 50, 30, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2318, 0, 0, '太原学院', '事业', '01', 11499, '074001', NULL, 9181, '14010219800406514X', '梁彦', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c7c7cc38f32e42b98f7849fb11febb4c', 89, 0, 1286, 0, 30, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1929, 0, 0, '太原学院', '事业', '01', 9271, '074001', NULL, 7342, '421002198112051469', '刘静', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c7f1c19eec0a4897b01ec39d4a0bcdbb', 94, 0, 1648, 0, 30, 3455, 0, 2375, 2800, 1810, 0, 0, 0, 0, 2472, 0, 0, '太原学院', '事业', '01', 12212, '074001', NULL, 9740, '140103198110030027', '杨欣', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c83cde013ebb4e85a41aa423e1c299dd', 99, 0, 1443, 0, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2165, 0, 0, '太原学院', '事业', '01', 10754, '074001', NULL, 8589, '140122198710301125', '张慧玲', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c8bc6e5014af4a6c9295997e64b9c19d', 94, 0, 1632, 0, 0, 3455, 0, 2475, 2800, 1810, 0, 0, 0, 0, 2448, 0, 0, '太原学院', '事业', '01', 12266, '074001', NULL, 9818, '140102197812056511', '赵永刚', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c98e920f5e1043d8a4cae099c88c877a', 79, 0, 1243, 0, 30, 2200, 0, 1603, 2590, 1292, 0, 0, 0, 0, 1865, 0, 0, '太原学院', '事业', '01', 9037, '074001', NULL, 7172, '142401198906281425', '杜竹', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c9b7bdf94b164462a129530a7a83412c', 94, 0, 1668, 0, 0, 3455, 0, 2796, 2800, 1810, 0, 0, 0, 0, 2502, 0, 0, '太原学院', '事业', '01', 12623, '074001', NULL, 10121, '140102197010300690', '王建军', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c9c0dac4986f407b907139a59563d084', 99, 0, 1468, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2202, 0, 0, '太原学院', '事业', '01', 11022, '074001', NULL, 8820, '140108198204031946', '史晓芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c9d5d39d593e4f17b27b27268fda50b8', 89, 0, 1319, 0, 0, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1979, 0, 0, '太原学院', '事业', '01', 9553, '074001', NULL, 7574, '140107198506153918', '刘刚', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('c9edbf1e781a42a296403b21812b40a3', 89, 0, 1386, 0, 30, 2185, 0, 2375, 2660, 1418, 0, 0, 0, 0, 2079, 0, 0, '太原学院', '事业', '01', 10143, '074001', NULL, 8064, '140103197801095722', '赵红梅', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ca29eead9b274f66bcb22802c86e1f31', 89, 0, 1386, 50, 30, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2079, 0, 0, '太原学院', '事业', '01', 10118, '074001', NULL, 8039, '140109198310110521', '贾云洁', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('caa38649e4d540e7ad4e1c626786346c', 89, 0, 1235, 0, 0, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1853, 0, 0, '太原学院', '事业', '01', 8756, '074001', NULL, 6903, '140202199202295018', '康圆圆', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('cb18d2f2b01a47a49c438ed87c72c4d6', 99, 0, 1524, 0, 30, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2286, 0, 0, '太原学院', '事业', '01', 11228, '074001', NULL, 8942, '410184197910162561', '武冬莲', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('cb1a0083b83f41caa720649a76a6f3ec', 104, 0, 1926, 0, 30, 4640, 0, 3026, 2940, 1908, 0, 0, 0, 0, 2889, 0, 0, '太原学院', '事业', '01', 14574, '074001', NULL, 11685, '140102197611082342', '金波', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('cb287346174b4e609e93503b2096ee4d', 89, 0, 1399, 0, 30, 2410, 0, 2375, 2660, 1418, 0, 0, 0, 0, 2099, 0, 0, '太原学院', '事业', '01', 10381, '074001', NULL, 8282, '140102198009096527', '许鸿', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('cb37f4adcb8143868b3ad642333798d8', 89, 0, 1348, 0, 0, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2022, 0, 0, '太原学院', '事业', '01', 10000, '074001', NULL, 7978, '140303198009021231', '邹翔斐', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('cb4b3171812c42428027ee22c2962f33', 89, 0, 1259, 0, 30, 2185, 0, 1515, 2660, 1418, 0, 0, 0, 0, 1889, 0, 0, '太原学院', '事业', '01', 9156, '074001', NULL, 7267, '142702198901182420', '赵娆', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('cbbb09edee714837824b5d5dbd1ee44e', 89, 0, 1275, 0, 30, 2185, 0, 1515, 2660, 1418, 0, 0, 0, 0, 1913, 0, 0, '太原学院', '事业', '01', 9172, '074001', NULL, 7259, '142401198901291448', '侯莉芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('cbeeac18228845c19e2468ebe549c00e', 89, 0, 1335, 0, 30, 2185, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2003, 0, 0, '太原学院', '事业', '01', 9892, '074001', NULL, 7889, '140103198012130622', '刘昕', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('cc2b2fecc6d44c2a9d29c8ff12f11117', 99, 0, 1592, 0, 30, 3260, 0, 2796, 2730, 1540, 0, 0, 0, 0, 2388, 0, 0, '太原学院', '事业', '01', 12047, '074001', NULL, 9659, '142222197504200027', '韩峰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('cc2d03b39f084dc8b66a5f5618abc422', 89, 0, 1418, 50, 30, 2650, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2127, 0, 0, '太原学院', '事业', '01', 10590, '074001', NULL, 8463, '142430198102110024', '杨婷婷', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('cc9964a585c44d0ba7e06f3faf58fa00', 89, 0, 1318, 0, 30, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 1977, 0, 0, '太原学院', '事业', '01', 9675, '074001', NULL, 7698, '142401197810031443', '任艳慧', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('cce2df61a44148fc8600e99b129e04a7', 89, 3.5, 1507, 0, 30, 2650, 0, 3026, 2660, 1418, 0, 0, 0, 0, 2261, 0, 0, '太原学院', '事业', '01', 11383.5, '074001', NULL, 9122.5, '14010219740220514X', '王艳花', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('cceb95a6aef1403b8dea78a6be8bbddc', 89, 0, 1396, 50, 0, 2185, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2094, 0, 0, '太原学院', '事业', '01', 10273, '074001', NULL, 8179, '140104197402281735', '李晓峰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('cd28036f7f3e475996df211d601cbf75', 89, 0, 1319, 0, 0, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1979, 0, 0, '太原学院', '事业', '01', 9553, '074001', NULL, 7574, '140106198301200614', '南昊', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('cd3b9afd001c4d12a230bf10b6534005', 89, 0, 1308, 0, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1962, 0, 0, '太原学院', '事业', '01', 9572, '074001', NULL, 7610, '142629198403071044', '陕倩倩', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('cd49246964b24209adee2618a43a48ea', 89, 3.8, 1544, 0, 0, 2650, 0, 3266, 2660, 1418, 0, 0, 0, 0, 2316, 0, 0, '太原学院', '事业', '01', 11630.8, '074001', NULL, 9314.8, '140102197002084035', '李伟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('cd634e90e0994baa868c5f2cd2f25838', 89, 0, 1309, 50, 30, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 1964, 0, 0, '太原学院', '事业', '01', 9716, '074001', NULL, 7752, '14010219771001322X', '赵慧', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ce5f3b82f1254c8a8eb2fcb42e501459', 99, 0, 1491, 50, 0, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2237, 0, 0, '太原学院', '事业', '01', 11215, '074001', NULL, 8978, '140103198005221518', '杜宾', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ce6612ba3c984270a5a6303587945773', 89, 0, 1548, 0, 30, 2650, 0, 3266, 2660, 1418, 0, 0, 0, 0, 2322, 0, 0, '太原学院', '事业', '01', 11661, '074001', NULL, 9339, '14220119711104456X', '张红梅', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ce796f99d0d9428fa00389e4e83a5666', 89, 0, 1177, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1766, 0, 0, '太原学院', '事业', '01', 8534, '074001', NULL, 6768, '14262919910207107X', '严豪', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ce87c58c74ac42888cd49a657da4bccc', 89, 0, 1418, 0, 30, 2650, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2127, 0, 0, '太原学院', '事业', '01', 10540, '074001', NULL, 8413, '140522198009080020', '吴晨辉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ce8dc28b2e53461f8ef0657f7ec354ff', 89, 0, 1273, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1910, 0, 0, '太原学院', '事业', '01', 9351, '074001', NULL, 7441, '140121198402072520', '郝宇丽', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ceacc7a3883743829285d49d88489a9a', 99, 0, 1616, 0, 30, 3260, 0, 2911, 2730, 1540, 0, 0, 0, 0, 2424, 0, 0, '太原学院', '事业', '01', 12186, '074001', NULL, 9762, '140104197402160845', '郭峥春', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ceae9c06be754979b1d6493448af4284', 99, 0, 1536, 50, 30, 3260, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2304, 0, 0, '太原学院', '事业', '01', 11420, '074001', NULL, 9116, '140303197912050026', '冯晓媛', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('cf52b36b813c4e589606d8ec76d3ed60', 99, 0, 1694, 0, 30, 3260, 5, 3391, 2730, 1540, 0, 0, 0, 0, 2541, 0, 0, '太原学院', '事业', '01', 12749, '074001', NULL, 10208, '140102197309035166', '郭振红', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('cfb682391bb1477e95e8824ffc01b611', 74, 0, 1220, 0, 30, 1950, 0, 1975, 2520, 1215, 0, 0, 0, 0, 1830, 0, 0, '太原学院', '事业', '01', 8984, '074001', NULL, 7154, '142322198205254041', '刘建芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('cfb9651eb4fd4107bcac19ae0897d80e', 99, 0, 1428, 0, 30, 3030, 0, 1696, 2730, 1540, 0, 0, 0, 0, 2142, 0, 0, '太原学院', '事业', '01', 10553, '074001', NULL, 8411, '140121198611110642', '张静', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('cfcf3089e96f4917acada07e69f9c742', 89, 0, 1282, 50, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1923, 0, 0, '太原学院', '事业', '01', 9410, '074001', NULL, 7487, '142401198409081422', '孟洪玉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('cfd3b8c67f2c47ba9d387e5a4b2da50e', 89, 0, 1191, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1787, 0, 0, '太原学院', '事业', '01', 8630, '074001', NULL, 6843, '14042819940608601X', '王志辉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d03899c32c78498397e71d24c5a58efc', 74, 0, 1185, 0, 30, 1950, 0, 1696, 2520, 1215, 0, 0, 0, 0, 1778, 0, 0, '太原学院', '事业', '01', 8670, '074001', NULL, 6892, '140105198302010066', '叶丹青', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d05e4d7ddfdc4a83ba987f70b16ccdaa', 99, 0, 1498, 0, 0, 3030, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2247, 0, 0, '太原学院', '事业', '01', 12038, '074001', NULL, 9791, '140112197104011737', '韩伟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d12c0e019ec94813b6df8270bb5eca4d', 99, 0, 1708, 0, 30, 3810, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2562, 0, 0, '太原学院', '事业', '01', 13058, '074001', NULL, 10496, '140103197305110647', '张彤华', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d15acada04194cd1a8ef4c07cdb293b4', 99, 0, 1481, 50, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2222, 0, 0, '太原学院', '事业', '01', 11135, '074001', NULL, 8913, '142301198109134128', '朱建华', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d17e32c6d8c24072912116dafe28de4c', 74, 0, 1363, 0, 30, 1925, 0, 3026, 2520, 1215, 0, 0, 0, 0, 2045, 0, 0, '太原学院', '事业', '01', 10153, '074001', NULL, 8108, '140103197112230087', '常玉萍', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d1a2f58bc9394723abd981fef629c5fa', 99, 0, 1571, 0, 30, 3030, 0, 2796, 2730, 1540, 0, 0, 0, 0, 2357, 0, 0, '太原学院', '事业', '01', 11796, '074001', NULL, 9439, '140104197404051327', '王凯', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d2178856c94e4b2e9269c3d440e7faf8', 89, 4, 1492, 50, 30, 2650, 0, 2911, 2660, 1418, 0, 0, 0, 0, 2238, 0, 0, '太原学院', '事业', '01', 11304, '074001', NULL, 9066, '140103197503060628', '李敏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d2236eb854a64b75bfafb9fd3695e2c6', 74, 0, 1220, 0, 30, 1950, 0, 1975, 2520, 1215, 0, 0, 0, 0, 1830, 0, 0, '太原学院', '事业', '01', 8984, '074001', NULL, 7154, '140110198305030020', '刘馨', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d2321a8a010c4ce39d32b78b88d3507f', 69, 3.6, 1377, 0, 0, 2260, 0, 2599, 2590, 1365, 0, 0, 0, 0, 2066, 0, 0, '太原学院', '事业', '01', 10263.6, '074001', NULL, 8197.6, '14011219670819041X', '张立群', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d28bcf0e05a3458dbd95f1f74c8aa74a', 89, 0, 1294, 50, 0, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1941, 0, 0, '太原学院', '事业', '01', 9578, '074001', NULL, 7637, '140112198206030415', '刘旭中', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d2b59d69c75543bf827b7bc6d1ad086c', 74, 0, 1094, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1641, 0, 0, '太原学院', '事业', '01', 7792, '074001', NULL, 6151, '14262119960902292X', '郑亚莹', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d33426b2b2de4089bf77cc921706e056', 99, 0, 1575, 0, 30, 3260, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2363, 0, 0, '太原学院', '事业', '01', 11709, '074001', NULL, 9346, '140430197605140026', '田大惠', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d3b9aea37ebd451d8a2618fa19fae974', 99, 0, 1682, 0, 0, 3260, 0, 3516, 2730, 1540, 0, 0, 0, 0, 2523, 0, 0, '太原学院', '事业', '01', 12827, '074001', NULL, 10304, '140104196810111335', '姚念武', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d3d6ada7df69470cb42675ecbafaffee', 69, 0, 1153, 0, 30, 1940, 0, 1457, 2520, 1194, 0, 0, 0, 0, 1730, 0, 0, '太原学院', '事业', '01', 8363, '074001', NULL, 6633, '140123198102170025', '尤帼云', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d3fd67acd33a48fbb74c79665022b4a9', 99, 0, 1859, 0, 30, 3810, 0, 4201, 2730, 1540, 0, 0, 0, 0, 2789, 0, 0, '太原学院', '事业', '01', 14269, '074001', NULL, 11480, '142231196802250104', '任红兵', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d439b34950724d6b93bd4a5966496fd4', 99, 0, 1511, 50, 0, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2267, 0, 0, '太原学院', '事业', '01', 11435, '074001', NULL, 9168, '142429197704103817', '韩瑞刚', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d44b5c1fa51a42309c399252c97fd5b3', 94, 0, 1642, 0, 30, 3455, 0, 2375, 2800, 1810, 0, 0, 0, 0, 2463, 0, 0, '太原学院', '事业', '01', 12206, '074001', NULL, 9743, '140103198002160641', '赵霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d491e111348b41478b227fe3301a27fc', 104, 0, 2185, 0, 30, 6070, 0, 3781, 2940, 1908, 0, 0, 0, 0, 3278, 0, 0, '太原学院', '事业', '01', 17018, '074001', NULL, 13740, '140104197010141346', '董春娟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d4e71d024f664758bfd2bf2dfd417fb6', 89, 0, 1333, 0, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 2000, 0, 0, '太原学院', '事业', '01', 9597, '074001', NULL, 7597, '140430198401290027', '何莉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d5d6f28eb30a4d13a891eb2ff6e4c15c', 89, 0, 1348, 0, 30, 2410, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2022, 0, 0, '太原学院', '事业', '01', 9930, '074001', NULL, 7908, '142232198201260468', '钟丽霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d620582b31ea4ceba6a35b4f55e1972d', 99, 3.9, 1653, 0, 30, 3260, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2480, 0, 0, '太原学院', '事业', '01', 12581.9, '074001', NULL, 10101.9, '14010219691215232X', '崔玉兰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d6bc26c9fe964951b5bcc229a6247472', 99, 0, 1653, 0, 30, 3260, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2480, 0, 0, '太原学院', '事业', '01', 12578, '074001', NULL, 10098, '142430197001182729', '翟其红', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d6c543c9ab3a4272a1e60063d3dc67af', 89, 0, 1404, 50, 30, 2410, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2106, 0, 0, '太原学院', '事业', '01', 10536, '074001', NULL, 8430, '140121197804180028', '刘晓红', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d6e78dda56524401a2c7fcf400494a03', 99, 0, 1737, 0, 0, 3260, 0, 3641, 2730, 1540, 0, 0, 0, 0, 2606, 0, 0, '太原学院', '事业', '01', 13007, '074001', NULL, 10401, '140102197002122310', '张武', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d6f2f5c18a7b484b9df5b47d7ac47b63', 89, 0, 1333, 50, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2000, 0, 0, '太原学院', '事业', '01', 9840, '074001', NULL, 7840, '14012219821207082X', '赵海霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d72204e5339b4481878e26c2af81a102', 89, 0, 1328, 0, 0, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1992, 0, 0, '太原学院', '事业', '01', 9755, '074001', NULL, 7763, '140202198002146013', '李海', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d775ae7fdef64ac9bd80f337071ef525', 79, 0, 1280, 0, 30, 2200, 0, 1975, 2590, 1292, 0, 0, 0, 0, 1920, 0, 0, '太原学院', '事业', '01', 9446, '074001', NULL, 7526, '140102197907111421', '翟璐璐', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d776a35a92d94e889d95a61057d7040d', 89, 0, 1339, 50, 30, 2410, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2009, 0, 0, '太原学院', '事业', '01', 9971, '074001', NULL, 7962, '140106198310193081', '韩菊', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d7c1983723214a5bbb7c8edf85e74dd7', 89, 0, 1384, 0, 30, 2185, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2076, 0, 0, '太原学院', '事业', '01', 10241, '074001', NULL, 8165, '142601198107272822', '陈艳花', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d7e31d17a6af447888938d662354b359', 89, 0, 1297, 0, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1946, 0, 0, '太原学院', '事业', '01', 9561, '074001', NULL, 7615, '14022119860116006X', '张霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d82114b3b4ea45daa9bcc024c4c0eb06', 74, 0, 1285, 0, 30, 1950, 0, 2475, 2520, 1215, 0, 0, 0, 0, 1928, 0, 0, '太原学院', '事业', '01', 9549, '074001', NULL, 7621, '142401197708202728', '张芸', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d85506be33724ca6a196da4086126c0a', 99, 0, 1598, 0, 0, 3030, 0, 3026, 2730, 1540, 0, 0, 0, 0, 2397, 0, 0, '太原学院', '事业', '01', 12023, '074001', NULL, 9626, '140105197205073714', '赵克昌', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d857183f91e54b22b145e9d193ca70de', 89, 0, 1248, 0, 0, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1872, 0, 0, '太原学院', '事业', '01', 8939, '074001', NULL, 7067, '140105199006190036', '于诚', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d96a2607e0874b3fa0d1f13287ae86de', 89, 0, 1348, 50, 30, 2185, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2022, 0, 0, '太原学院', '事业', '01', 10055, '074001', NULL, 8033, '140221198011230048', '周杰宇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d99de6096dda4d8f9e902165c73944c0', 89, 0, 1322, 50, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1983, 0, 0, '太原学院', '事业', '01', 9829, '074001', NULL, 7846, '140107198203061223', '李美意', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d9aa6e9556c043d4a2120e0b43d9b726', 99, 0, 1493, 0, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2240, 0, 0, '太原学院', '事业', '01', 10997, '074001', NULL, 8757, '140103198002271229', '马建英', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('d9f1e6784e7549db885531a2acc56bfc', 89, 0, 1307, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1961, 0, 0, '太原学院', '事业', '01', 9385, '074001', NULL, 7424, '140202198705202528', '冯琨', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('da6bed9841c442b799b09825ff282c10', 89, 0, 1235, 0, 0, 2185, 0, 1427, 2660, 1418, 0, 0, 0, 0, 1853, 0, 0, '太原学院', '事业', '01', 9014, '074001', NULL, 7161, '141124198909260192', '刘伟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('da93e300fead4fe9b7eed0331026facb', 89, 0, 1214, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1821, 0, 0, '太原学院', '事业', '01', 8765, '074001', NULL, 6944, '142623199408194322', '杨惠惠', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('dac5517e236041388f6b13e59bd31097', 99, 0, 1542, 0, 0, 3030, 0, 2582, 2730, 1540, 0, 0, 0, 0, 2313, 0, 0, '太原学院', '事业', '01', 11523, '074001', NULL, 9210, '14010219760413233X', '成伟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('dad5e525b05f47bcbb75371fca4f1f48', 94, 0, 1604, 0, 0, 3455, 0, 2075, 2800, 1810, 0, 0, 0, 0, 2406, 0, 0, '太原学院', '事业', '01', 11838, '074001', NULL, 9432, '140411198202074816', '田冰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('dae3eb4c6c704515a1974adf97ef3f38', 99, 0, 1491, 50, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2237, 0, 0, '太原学院', '事业', '01', 11145, '074001', NULL, 8908, '140122197910070021', '张臻', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('daf0c12a2349458fae2a2c5e3733a00c', 99, 0, 1529, 0, 0, 3030, 0, 2375, 2730, 1540, 0, 0, 0, 0, 2294, 0, 0, '太原学院', '事业', '01', 11303, '074001', NULL, 9009, '14011219770818281X', '肖永强', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('db06744d63324471a6d40b0ea897544f', 89, 0, 1374, 0, 30, 2185, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2061, 0, 0, '太原学院', '事业', '01', 10231, '074001', NULL, 8170, '14010319780701062X', '于光', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('db5bef62d093462b804e9e356d5b48c9', 89, 0, 1449, 0, 30, 2650, 0, 2582, 2660, 1418, 0, 0, 0, 0, 2174, 0, 0, '太原学院', '事业', '01', 10878, '074001', NULL, 8704, '140502197607200520', '徐妮妮', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('db62d807ec064c30a701b7856e9c7890', 89, 0, 1327, 0, 30, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1991, 0, 0, '太原学院', '事业', '01', 9816, '074001', NULL, 7825, '140106198505021845', '傅锦', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('db6755437c2b464d9cad2b278915ddc4', 89, 0, 1361, 50, 0, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2042, 0, 0, '太原学院', '事业', '01', 10163, '074001', NULL, 8121, '142601198108241710', '靳悦振', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('dba25aa2346a4f1fb83a479ce75cc05c', 89, 0, 1205, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1808, 0, 0, '太原学院', '事业', '01', 8674, '074001', NULL, 6866, '140431199405303623', '雷丹玉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('dc12de87d08041cf82d4110343830942', 99, 4.4, 1717, 0, 0, 3260, 16, 3781, 2730, 1540, 0, 0, 0, 0, 2576, 0, 0, '太原学院', '事业', '01', 13147.4, '074001', NULL, 10571.4, '140102196604140212', '乔智', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('dc56f1fd8fd74080b50a4bb3754c5fc2', 99, 0, 1592, 0, 30, 3030, 0, 3026, 2730, 1540, 0, 0, 0, 0, 2388, 0, 0, '太原学院', '事业', '01', 12047, '074001', NULL, 9659, '140104197310110322', '刘永红', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('dcad513b4f514734a563f056a8b30af1', 99, 0, 1408, 0, 30, 3030, 0, 1339, 2730, 1540, 0, 0, 0, 0, 2112, 0, 0, '太原学院', '事业', '01', 10176, '074001', NULL, 8064, '140702199108227147', '寇海荣', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('dcc70c4b75204135b2bbd37186fa4279', 89, 0, 1390, 0, 30, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2085, 0, 0, '太原学院', '事业', '01', 10172, '074001', NULL, 8087, '140103197806030661', '张旭', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('dcf570e61af0497f94cca9975494f8b2', 89, 0, 1344, 0, 0, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2016, 0, 0, '太原学院', '事业', '01', 9771, '074001', NULL, 7755, '140122198312100010', '白月星', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('dd42f9e978c54dce9d37eb59dcea2dac', 99, 0, 1647, 0, 30, 3260, 0, 3026, 2730, 1540, 0, 0, 0, 0, 2471, 0, 0, '太原学院', '事业', '01', 12332, '074001', NULL, 9861, '140102197201295169', '张安琪', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('dd6fbc84f2e04ce09575ac0ee2956b16', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '142333199709290023', '高彩月', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('dd8fa54a1f134b9ea2c488f34fd5e805', 74, 0, 1083, 0, 30, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1625, 0, 0, '太原学院', '事业', '01', 7710, '074001', NULL, 6085, '130184199901091521', '王若蓝', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('dd910d668efa468eb8b693ef71d1416c', 89, 0, 1191, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1787, 0, 0, '太原学院', '事业', '01', 8660, '074001', NULL, 6873, '140202199507011522', '张跃坤', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('de0eba5c4d46442982f4b58442d3b087', 74, 0, 1243, 50, 30, 1950, 0, 2075, 2520, 1215, 0, 0, 0, 0, 1865, 0, 0, '太原学院', '事业', '01', 9157, '074001', NULL, 7292, '140103198005114245', '聂永乐', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('dede96b542654c00a3f558324662c43e', 99, 0, 1504, 50, 30, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2256, 0, 0, '太原学院', '事业', '01', 11258, '074001', NULL, 9002, '130225197909203723', '李娟娟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('deec5e291d494a0f95ca9c036629a44e', 69, 0, 1170, 0, 30, 1925, 0, 1427, 2520, 1215, 0, 0, 0, 0, 1755, 0, 0, '太原学院', '事业', '01', 8356, '074001', NULL, 6601, '140122198401090125', '李娜', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('df00327f7bb4471b854baa6eb260edf0', 89, 0, 1361, 50, 0, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2042, 0, 0, '太原学院', '事业', '01', 10163, '074001', NULL, 8121, '140123198306300215', '段兆忠', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('df1035d7c1194a8189819a19fb7934e1', 89, 0, 1237, 0, 0, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1856, 0, 0, '太原学院', '事业', '01', 8840, '074001', NULL, 6984, '142431198908014812', '郭建忠', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('df26b16b474c4980baa5b154f34c5ccf', 89, 0, 1270, 0, 0, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1905, 0, 0, '太原学院', '事业', '01', 9318, '074001', NULL, 7413, '150421198810211815', '牟志然', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('df6ee1c89b2344979c83f362d1eef765', 89, 0, 1201, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1802, 0, 0, '太原学院', '事业', '01', 8670, '074001', NULL, 6868, '14260119950909404X', '邢力元', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('df94142fac1d4b6f955f4b9a73270e37', 99, 0, 1478, 0, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2217, 0, 0, '太原学院', '事业', '01', 10982, '074001', NULL, 8765, '140103198009153321', '杜娟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('dfd1acb11b1f4582927a96494abcfc69', 89, 0, 1327, 0, 30, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1991, 0, 0, '太原学院', '事业', '01', 9816, '074001', NULL, 7825, '140105198307170042', '吴晓燕', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e04f468bcbe44262a3d84de1a8a4a41a', 99, 0, 1478, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2217, 0, 0, '太原学院', '事业', '01', 11032, '074001', NULL, 8815, '140303198201200424', '马丽', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e07fd358ac934a27b0901cb9233a9bf2', 89, 0, 1331, 0, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1997, 0, 0, '太原学院', '事业', '01', 9788, '074001', NULL, 7791, '140104198110100028', '王卓蓉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e08d9b5da4334ac6b1d52ac47b8a737f', 89, 0, 1252, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1878, 0, 0, '太原学院', '事业', '01', 8973, '074001', NULL, 7095, '140721199105310083', '李圆圆', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e0a0d6654b924e59bc5893b3b99beab8', 104, 0, 2047, 0, 30, 4345, 0, 4061, 3080, 2100, 0, 0, 0, 0, 3071, 0, 0, '太原学院', '事业', '01', 15767, '074001', NULL, 12696, '142401196808130325', '刘月红', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e0bf3daaba524e7ab533767268c5bc14', 99, 0, 1653, 0, 30, 3260, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2480, 0, 0, '太原学院', '事业', '01', 12578, '074001', NULL, 10098, '14010219700703204X', '秦小娟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e141ab3e343846c6946ecf7fc1ac813f', 89, 0, 1238, 0, 30, 2185, 0, 1427, 2660, 1418, 0, 0, 0, 0, 1857, 0, 0, '太原学院', '事业', '01', 9047, '074001', NULL, 7190, '140107199007263324', '韩宝珠', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e190d880a33b4768a4e1f5a3e796284a', 89, 0, 1364, 50, 30, 2410, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2046, 0, 0, '太原学院', '事业', '01', 9996, '074001', NULL, 7950, '140102198212132327', '邓懿', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e1e4f946945d4597ae1a95d9acdb9d62', 99, 0, 1468, 0, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2202, 0, 0, '太原学院', '事业', '01', 10972, '074001', NULL, 8770, '140102198103125224', '赵敏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e200a7b2276e4947ad7a9158ae1d8a96', 79, 0, 1479, 0, 0, 2520, 0, 3026, 2660, 1383, 0, 0, 0, 0, 2219, 0, 0, '太原学院', '事业', '01', 11147, '074001', NULL, 8928, '14010319710116001X', '段卫民', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e215d0a8f4d94e2d84b986490a5cba78', 94, 0, 1526, 0, 0, 2880, 0, 2689, 2730, 1551, 0, 0, 0, 0, 2289, 0, 0, '太原学院', '事业', '01', 11470, '074001', NULL, 9181, '140103197111071213', '段炳胜', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e26637a1df6642d6859a566dd6e4ca66', 89, 0, 1357, 50, 30, 2185, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2036, 0, 0, '太原学院', '事业', '01', 10064, '074001', NULL, 8028, '140102197910265165', '杜芸', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e2879b462bef4655a5cbc776cdb3af2b', 74, 0, 1081, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1622, 0, 0, '太原学院', '事业', '01', 7779, '074001', NULL, 6157, '140105199703210047', '郝丽璋', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e2961c4fec954af781a17143555e5c4f', 89, 0, 1177, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1766, 0, 0, '太原学院', '事业', '01', 8534, '074001', NULL, 6768, '140402199510220414', '张圣都', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e2b11b65fa17408cb73fe5bc206c1a02', 74, 0, 1121, 0, 30, 1925, 0, 1005, 2520, 1215, 0, 0, 0, 0, 1682, 0, 0, '太原学院', '事业', '01', 7890, '074001', NULL, 6208, '140224199512159343', '康玲瑞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e2c2346884ae4fdb9203165136c489b9', 74, 0, 1242, 0, 0, 1950, 0, 2175, 2520, 1215, 0, 0, 0, 0, 1863, 0, 0, '太原学院', '事业', '01', 9176, '074001', NULL, 7313, '140102197912225191', '司远', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e2ce18baf5df48c9a7b0b06c2dc5f82d', 74, 0, 1268, 0, 30, 1950, 0, 2275, 2520, 1215, 0, 0, 0, 0, 1902, 0, 0, '太原学院', '事业', '01', 9332, '074001', NULL, 7430, '140302197902010569', '田扬', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e2d1e9cd09f4497d977e6cd95ad0416a', 99, 0, 1373, 0, 30, 3030, 0, 1339, 2730, 1540, 0, 0, 0, 0, 2060, 0, 0, '太原学院', '事业', '01', 10141, '074001', NULL, 8081, '142731199108205726', '安燕燕', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e2d550d9e3fd490c959ad00803beb668', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '142301199408240048', '苏旭洁', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e32c8de6ed0a4647922d665c351e083d', 74, 0, 1106, 0, 30, 1925, 0, 1087, 2520, 1215, 0, 0, 0, 0, 1659, 0, 0, '太原学院', '事业', '01', 7957, '074001', NULL, 6298, '141181199405270268', '王雁', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e33e0b7e9e684f58a3139f1d7fdd3bb6', 99, 0, 1399, 0, 30, 3030, 0, 1603, 2730, 1540, 0, 0, 0, 0, 2099, 0, 0, '太原学院', '事业', '01', 10431, '074001', NULL, 8332, '140109199007021029', '杨凡', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e353f9f4a97d4acfbf9177b20aaf6191', 79, 0, 1340, 0, 0, 2520, 0, 1882, 2660, 1383, 0, 0, 0, 0, 2010, 0, 0, '太原学院', '事业', '01', 9864, '074001', NULL, 7854, '140108197808270038', '王飞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e35b0afe228e4e37abc0d79d55ca85c0', 89, 0, 1270, 50, 0, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1905, 0, 0, '太原学院', '事业', '01', 9368, '074001', NULL, 7463, '142228198309198518', '杨春龙', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e3949ec5120d47358f746e20f70f1c0e', 99, 0, 1493, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2240, 0, 0, '太原学院', '事业', '01', 11047, '074001', NULL, 8807, '140225198104123749', '郭丽丽', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e39f8539cbfe42688b9a5d8bc4d2d83c', 104, 0, 1842, 50, 30, 4640, 0, 2375, 2940, 1908, 0, 0, 0, 0, 2763, 0, 0, '太原学院', '事业', '01', 13889, '074001', NULL, 11126, '140603198012090525', '王晓燕', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e3ade327f8b8413585d59120c5b65b1f', 99, 0, 1564, 0, 30, 3260, 0, 2582, 2730, 1540, 0, 0, 0, 0, 2346, 0, 0, '太原学院', '事业', '01', 11805, '074001', NULL, 9459, '140102197704222340', '郝丽珍', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e3f8e0c7b804495a9fda14608c747fde', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '142322199510167547', '周郅壹', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e3fdd70271ab4341a6ebe4e0bd65b314', 99, 0, 1637, 0, 30, 3260, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2456, 0, 0, '太原学院', '事业', '01', 12437, '074001', NULL, 9981, '140102197209134829', '李琦', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e4500c8f3333428a85b37a370dfa66c9', 99, 0, 1549, 50, 30, 3260, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2324, 0, 0, '太原学院', '事业', '01', 11533, '074001', NULL, 9209, '140311197803183620', '侯海霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e479096951184fa9b5778948c0f1e39c', 89, 0, 1373, 0, 30, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2060, 0, 0, '太原学院', '事业', '01', 10155, '074001', NULL, 8095, '142323198204080226', '何源', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e4b611bd1c154c39b337e3dbe9c4c090', 99, 0, 1583, 0, 30, 3030, 0, 2689, 2730, 1540, 0, 0, 0, 0, 2375, 0, 0, '太原学院', '事业', '01', 11701, '074001', NULL, 9326, '140502197602013080', '张俊霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e4bb6f8bcdf64dec85c439bad56056bf', 89, 0, 1027, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1541, 0, 0, '太原学院', '事业', '01', 8384, '074001', NULL, 6843, '220721199212152017', '梁喜龙', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e5056a95e96843a0810ab47e221704ca', 89, 0, 1344, 0, 30, 2410, 0, 1789, 2660, 1418, 0, 0, 0, 0, 2016, 0, 0, '太原学院', '事业', '01', 9740, '074001', NULL, 7724, '140109198704295522', '孙婧', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e539683347be4cd1a1ed29c985c6f537', 74, 0, 1029, 0, 30, 1925, 0, 1882, 2520, 1215, 0, 0, 0, 0, 1544, 0, 0, '太原学院', '事业', '01', 8675, '074001', NULL, 7131, '230421198312162627', '焦颖', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e577c50445a8403cae6bb3f53aaf8369', 89, 0, 1316, 0, 0, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 1974, 0, 0, '太原学院', '事业', '01', 9643, '074001', NULL, 7669, '140105198301060037', '蔡仲博', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e5af8200b0cb4381856d32d24d998063', 89, 0, 1311, 0, 0, 2410, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1967, 0, 0, '太原学院', '事业', '01', 9677, '074001', NULL, 7710, '140202198501182035', '马涛', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e5c1f9d066ec4bab815a07a256c1720e', 89, 0, 1352, 50, 30, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2028, 0, 0, '太原学院', '事业', '01', 10084, '074001', NULL, 8056, '140104198112170847', '胥洋', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e5c2d39cdc374737ab363f7f394654a5', 89, 0, 1458, 0, 30, 2650, 0, 2582, 2660, 1418, 0, 0, 0, 0, 2187, 0, 0, '太原学院', '事业', '01', 10887, '074001', NULL, 8700, '142429197809140024', '张玲', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e611f64a2a624906aff5ef20734fe095', 99, 0, 1453, 0, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2180, 0, 0, '太原学院', '事业', '01', 10764, '074001', NULL, 8584, '140202198412255589', '杜萱', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e61e79ec368940c2a90321d54bc371a3', 99, 0, 1490, 50, 0, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2235, 0, 0, '太原学院', '事业', '01', 11014, '074001', NULL, 8779, '142726198204061579', '权英杰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e636fdc37d3e47b0b7027d5a7dd3310d', 89, 0, 1331, 50, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1997, 0, 0, '太原学院', '事业', '01', 9838, '074001', NULL, 7841, '140108198606024220', '范宏宇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e67cf2e72763462598665850138cb676', 104, 0, 2067, 0, 0, 5220, 0, 3641, 2940, 1908, 0, 0, 0, 0, 3101, 0, 0, '太原学院', '事业', '01', 15880, '074001', NULL, 12779, '142222197102090910', '张卫东', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e69a6bfb2be14013aa34cafe49cd4560', 99, 0, 1486, 0, 0, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2229, 0, 0, '太原学院', '事业', '01', 11060, '074001', NULL, 8831, '142430197908101210', '韩栋梁', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e6ab9c28e6e646a5921e8b77ca681238', 89, 0, 1297, 50, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1946, 0, 0, '太原学院', '事业', '01', 9611, '074001', NULL, 7665, '140102198211270621', '王烨', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e6f2fdfd062e4946a0d2fc17e1db11c5', 89, 0, 1322, 0, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1983, 0, 0, '太原学院', '事业', '01', 9779, '074001', NULL, 7796, '142301198002132325', '武亮英', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e73a52efde2545808ded227cfc41827a', 89, 0, 1212, 0, 0, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1818, 0, 0, '太原学院', '事业', '01', 8815, '074001', NULL, 6997, '14010619930607181X', '郭宇晨', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e73ab481dbe8487081caef2f1f2479fb', 104, 0, 1800, 0, 0, 4640, 0, 2275, 2940, 1908, 0, 0, 0, 0, 2700, 0, 0, '太原学院', '事业', '01', 13667, '074001', NULL, 10967, '142301198003266018', '温明军', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e7fedccd758e427dbfc723473e853be6', 74, 0, 1210, 0, 0, 1925, 0, 1882, 2520, 1215, 0, 0, 0, 0, 1815, 0, 0, '太原学院', '事业', '01', 8826, '074001', NULL, 7011, '140102198211230013', '郭涛', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e81511486fbe44b3ba15cee275c4886e', 104, 0, 1812, 50, 0, 4640, 0, 2175, 2940, 1908, 0, 0, 0, 0, 2718, 0, 0, '太原学院', '事业', '01', 13629, '074001', NULL, 10911, '142727198003230037', '黄泽军', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e81820a22a7b451eacf7cfc7a0cabd47', 89, 0, 1212, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1818, 0, 0, '太原学院', '事业', '01', 8763, '074001', NULL, 6945, '140430199407080025', '梁泽', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e81cb9b815e144c8a39491a9e57d1d44', 89, 0, 1491, 0, 30, 2650, 0, 2911, 2660, 1418, 0, 0, 0, 0, 2237, 0, 0, '太原学院', '事业', '01', 11249, '074001', NULL, 9012, '140102197407051426', '陈琍', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e856a06b2dc043f0a5406f1642edae76', 74, 0, 1126, 0, 30, 1925, 0, 1087, 2520, 1215, 0, 0, 0, 0, 1689, 0, 0, '太原学院', '事业', '01', 7977, '074001', NULL, 6288, '140109199412301040', '王晶', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e88e72f7d4ce4f6eae231a19b3afc557', 89, 0, 1270, 0, 30, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1905, 0, 0, '太原学院', '事业', '01', 9255, '074001', NULL, 7350, '14260119890820132X', '党旗', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e8918dcc8a1849c08b7dff849863fdcd', 99, 0, 1766, 0, 30, 3810, 0, 3516, 2730, 1540, 0, 0, 0, 0, 2649, 0, 0, '太原学院', '事业', '01', 13491, '074001', NULL, 10842, '140103197108184225', '张芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e8f00bddc2394c6d9273148cc9f65b8a', 89, 0, 1224, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1836, 0, 0, '太原学院', '事业', '01', 8693, '074001', NULL, 6857, '14260119870731132X', '刘彦君', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e8f1f8a8c1974f88927cf65f08e944c2', 79, 0, 1293, 50, 30, 2200, 0, 2075, 2590, 1292, 0, 0, 0, 0, 1940, 0, 0, '太原学院', '事业', '01', 9609, '074001', NULL, 7669, '142729198008171243', '张亚丽', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e98e4c27c3384a0ebdcea53d4d6c447b', 89, 0, 1352, 50, 30, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 2028, 0, 0, '太原学院', '事业', '01', 9891, '074001', NULL, 7863, '140107198401041223', '赵雯', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('e9d9e9f288e043a1a51b0cc8e0401636', 94, 0, 1600, 50, 0, 3455, 0, 2275, 2800, 1810, 0, 0, 0, 0, 2400, 0, 0, '太原学院', '事业', '01', 12084, '074001', NULL, 9684, '140102197806096533', '赵俊峰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ea0d53f215534b4cae79b506605c6794', 89, 0, 1331, 0, 0, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 1997, 0, 0, '太原学院', '事业', '01', 9658, '074001', NULL, 7661, '140102198209106515', '潘琛', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ea3011263a4a4ed8a570ec2300116438', 74, 0, 1072, 0, 30, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1608, 0, 0, '太原学院', '事业', '01', 7699, '074001', NULL, 6091, '142601199509062822', '张圻宁', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ea948ad732d94ac980c72a1e9de015e0', 89, 0, 1296, 50, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1944, 0, 0, '太原学院', '事业', '01', 9517, '074001', NULL, 7573, '140108198411144222', '于晓君', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('eb5e9da7eda442a5a47b3c956ad0df87', 89, 0, 1225, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1838, 0, 0, '太原学院', '事业', '01', 8858, '074001', NULL, 7020, '140621199103086123', '王永丽', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ebee5462b74748e595ff92b286465f88', 99, 0, 1698, 0, 0, 3260, 0, 3641, 2730, 1540, 0, 0, 0, 0, 2547, 0, 0, '太原学院', '事业', '01', 12968, '074001', NULL, 10421, '142325197105030010', '张晋军', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ec3cff74eb914b1a8050df9df9762cc4', 89, 0, 1431, 0, 0, 2650, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2147, 0, 0, '太原学院', '事业', '01', 10723, '074001', NULL, 8576, '142731197810186319', '高文艳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ec6ba2e8aa624bcbb5693f2183dae5ec', 104, 0, 1857, 0, 30, 4640, 0, 2689, 2940, 1908, 0, 0, 0, 0, 2786, 0, 0, '太原学院', '事业', '01', 14168, '074001', NULL, 11382, '142323197311181386', '闫娟枝', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ec7585bdd97b41dfa1b6eebe41246e66', 89, 0, 1282, 0, 0, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1923, 0, 0, '太原学院', '事业', '01', 9423, '074001', NULL, 7500, '140123198504073914', '程少华', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ec91510f9f2c4620bb52d3b09cefc990', 99, 3.5, 1604, 0, 0, 3030, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2406, 0, 0, '太原学院', '事业', '01', 12147.5, '074001', NULL, 9741.5, '140106197201311814', '王国胜', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ec9c25ef926748f98da3c12e6785dbad', 99, 0, 1665, 0, 30, 3030, 0, 3516, 2730, 1540, 0, 0, 0, 0, 2498, 0, 0, '太原学院', '事业', '01', 12610, '074001', NULL, 10112, '210203196908075261', '任永珍', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ed0dc821d22e4bf5bcef34a5e4bf1320', 99, 3.9, 1738, 0, 30, 3260, 0, 3921, 2730, 1540, 0, 0, 0, 0, 2607, 0, 0, '太原学院', '事业', '01', 13321.9, '074001', NULL, 10714.9, '140102196812060727', '尚青', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ed0f2f2d16ef4bb689fc6a94b2ef57a1', 89, 0, 1249, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1874, 0, 0, '太原学院', '事业', '01', 8970, '074001', NULL, 7096, '140122199008101742', '董国珍', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ed62e56fa8a44a3ba726e6c963ff39e6', 99, 0, 1529, 0, 30, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2294, 0, 0, '太原学院', '事业', '01', 11433, '074001', NULL, 9139, '140431197704184821', '郭慧', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ed6340d2d9ad4bf5b07344d46c224172', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '14112219940820010X', '杨阳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ed71b50b1bc14081b45fd0aa9c67e14f', 99, 0, 1504, 0, 30, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2256, 0, 0, '太原学院', '事业', '01', 11208, '074001', NULL, 8952, '652322198010020528', '王蓉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ee1fc49944ea441b9338f7ed57923dd5', 99, 0, 1481, 50, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2222, 0, 0, '太原学院', '事业', '01', 11135, '074001', NULL, 8913, '140103198003203922', '张珺', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ee204753114f430eacffcfd139dd45de', 79, 0, 1328, 0, 0, 2520, 0, 1789, 2660, 1383, 0, 0, 0, 0, 1992, 0, 0, '太原学院', '事业', '01', 9759, '074001', NULL, 7767, '14010519861212291X', '肖利龙', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ee5c871563994b7da81b82e792bda9cb', 89, 0, 1297, 0, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1946, 0, 0, '太原学院', '事业', '01', 9561, '074001', NULL, 7615, '140109198603033021', '王娜', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ee91afa6f6d94885aa20074e673ff774', 94, 3.2, 1778, 0, 0, 3455, 0, 3641, 2800, 1810, 0, 0, 0, 0, 2667, 0, 0, '太原学院', '事业', '01', 13581.2, '074001', NULL, 10914.2, '140102197105086519', '张永平', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ef79367073304c26a7bc1618f9f68544', 89, 0, 1307, 0, 0, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1961, 0, 0, '太原学院', '事业', '01', 9448, '074001', NULL, 7487, '230404198509100239', '朱秀栋', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ef8ed94d2a554c59a189cec35a6e4a7b', 99, 0, 1453, 50, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2180, 0, 0, '太原学院', '事业', '01', 10814, '074001', NULL, 8634, '142601198609262843', '王昕光', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('efda3d2f26824a269d4a61ce8ac54611', 89, 0, 1359, 50, 0, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2039, 0, 0, '太原学院', '事业', '01', 10061, '074001', NULL, 8022, '140603198008161618', '刘巧', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('efdad1fae392428f96c219fa8f37c3f1', 99, 0, 1515, 0, 30, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2273, 0, 0, '太原学院', '事业', '01', 11219, '074001', NULL, 8946, '142623198011256121', '韩英', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f00d4e0c171046a78232156ae28e15ce', 89, 0, 1285, 50, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1928, 0, 0, '太原学院', '事业', '01', 9506, '074001', NULL, 7578, '140107198209200626', '罗静', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f062b802ec76418abdfbe23556caa944', 89, 0, 1053, 50, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1580, 0, 0, '太原学院', '事业', '01', 9274, '074001', NULL, 7694, '140106198511250628', '薛愈洁', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f0ccfbcbe01346cc980d18412b3df354', 99, 4.2, 1682, 0, 0, 3260, 0, 3516, 2730, 1540, 0, 0, 0, 0, 2523, 0, 0, '太原学院', '事业', '01', 12831.2, '074001', NULL, 10308.2, '61011319691114045X', '巩利平', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f10c96c38fc147468b7e32ea83ccd59c', 104, 0, 1827, 50, 30, 4640, 0, 2375, 2940, 1908, 0, 0, 0, 0, 2741, 0, 0, '太原学院', '事业', '01', 13874, '074001', NULL, 11133, '140103197812082441', '赵婕', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f15171c6ad474c81a0d683d0cc9e466b', 74, 0, 1097, 0, 30, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1646, 0, 0, '太原学院', '事业', '01', 7724, '074001', NULL, 6078, '142429199706282125', '成家慧', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f17bcc47275c405da7a142e6c2feaeef', 99, 3.9, 1810, 0, 30, 3810, 0, 3921, 2730, 1540, 0, 0, 0, 0, 2715, 0, 0, '太原学院', '事业', '01', 13943.9, '074001', NULL, 11228.9, '142601197002051922', '郝妍琴', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f1982f141d0b4a7ba04f4895279ee895', 89, 0, 1227, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1841, 0, 0, '太原学院', '事业', '01', 8948, '074001', NULL, 7107, '14021219920930272X', '张抗萍', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f1c5e1c270b840e49aded744d9e0875b', 74, 0, 1244, 0, 30, 1950, 0, 2075, 2520, 1215, 0, 0, 0, 0, 1866, 0, 0, '太原学院', '事业', '01', 9108, '074001', NULL, 7242, '140224198012100084', '杜慧芳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f245256fa4524a1287d336e111bbaa10', 99, 0, 1497, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2246, 0, 0, '太原学院', '事业', '01', 11051, '074001', NULL, 8805, '140107198301071724', '邢娜', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f251b709d675429e85cbb7137be248d9', 99, 4.2, 1799, 0, 30, 3810, 0, 3641, 2730, 1540, 0, 0, 0, 0, 2699, 0, 0, '太原学院', '事业', '01', 13653.2, '074001', NULL, 10954.2, '140106196901311220', '卢青', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f254c3850faf49fc9385602eca762e5d', 99, 0, 1592, 0, 30, 3030, 0, 3026, 2730, 1540, 0, 0, 0, 0, 2388, 0, 0, '太原学院', '事业', '01', 12047, '074001', NULL, 9659, '140431197303233629', '段鹏莉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f293261222e541209efac1cef523b449', 89, 0, 1243, 0, 0, 2185, 0, 1515, 2660, 1418, 0, 0, 0, 0, 1865, 0, 0, '太原学院', '事业', '01', 9110, '074001', NULL, 7245, '140106198407171217', '董哲宇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f29a2e328ef845199d8750eb5b4dc134', 99, 0, 1719, 0, 30, 3810, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2579, 0, 0, '太原学院', '事业', '01', 13069, '074001', NULL, 10490, '14223019710627002X', '郝强', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f29f3f0c43004dcea3fb18e529948bdb', 99, 0, 1407, 0, 30, 3030, 0, 1603, 2730, 1540, 0, 0, 0, 0, 2111, 0, 0, '太原学院', '事业', '01', 10439, '074001', NULL, 8328, '140107198511090042', '白宁', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f2ac5d96fd0c4a2dadb83143c9ec828a', 89, 0, 1365, 50, 30, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2048, 0, 0, '太原学院', '事业', '01', 10197, '074001', NULL, 8149, '140123198312240220', '王晓鑫', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f2d488efcc8b469d9339329159879134', 89, 0, 1503, 50, 0, 2650, 0, 3026, 2660, 1418, 0, 0, 0, 0, 2255, 0, 0, '太原学院', '事业', '01', 11396, '074001', NULL, 9141, '140102197204132314', '王永强', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f2dddb3394064816a866cbd7e5529bb7', 74, 0, 1112, 0, 0, 1925, 0, 1005, 2520, 1215, 0, 0, 0, 0, 1668, 0, 0, '太原学院', '事业', '01', 7851, '074001', NULL, 6183, '142325199610017510', '张玮', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f31fd6b815b848da80760825ef6b403d', 99, 0, 1411, 0, 30, 3030, 0, 1696, 2730, 1540, 0, 0, 0, 0, 2117, 0, 0, '太原学院', '事业', '01', 10536, '074001', NULL, 8419, '142401198108204222', '边建红', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f3928696c66c4acead34736dde67877c', 99, 0, 1419, 50, 30, 3030, 0, 1696, 2730, 1540, 0, 0, 0, 0, 2129, 0, 0, '太原学院', '事业', '01', 10594, '074001', NULL, 8465, '142201197902029120', '刘会峰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f3b9b90153294645b362c7d0f40c61fb', 89, 0, 1428, 0, 0, 2410, 0, 2689, 2660, 1418, 0, 0, 0, 0, 2142, 0, 0, '太原学院', '事业', '01', 10694, '074001', NULL, 8552, '140121197405015519', '吴瑞勇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f3d7c15a634741fea63d0320d89ffdd7', 99, 0, 1494, 0, 30, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2241, 0, 0, '太原学院', '事业', '01', 11198, '074001', NULL, 8957, '142429198209172828', '张雅清', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f410146b771f4738ae9e74ac30bfa99e', 89, 0, 1041, 0, 30, 2185, 0, 1251, 2660, 1418, 3920, -989, 0, 0, 1562, 25866, 0, '太原学院', '事业', '01', 37471, '074001', NULL, 35909, '142225199304251020', '周婧', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f440df4adc0b4794bbd96b6a268419f9', 99, 0, 1558, 0, 0, 3030, 0, 2796, 2730, 1540, 0, 0, 0, 0, 2337, 0, 0, '太原学院', '事业', '01', 11753, '074001', NULL, 9416, '142701197712011277', '贾安民', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f45e5d412e784078b8cca56bce5e3cae', 99, 0, 1612, 0, 30, 3260, 0, 2689, 2730, 1540, 0, 0, 0, 0, 2418, 0, 0, '太原学院', '事业', '01', 11960, '074001', NULL, 9542, '140102197507052346', '王莉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f4c9ca89b0c048bdb59e7650c7704d02', 99, 0, 1586, 0, 30, 3260, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2379, 0, 0, '太原学院', '事业', '01', 11720, '074001', NULL, 9341, '142333197808130026', '高红霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f4ff572d22d045668449763bbf9d7041', 99, 0, 1809, 0, 30, 3810, 0, 3921, 2730, 1540, 0, 0, 0, 0, 2714, 0, 0, '太原学院', '事业', '01', 13939, '074001', NULL, 11225, '140103196807060622', '李京焱', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f51a5553bfbc44569d575207d0741ebd', 89, 0, 1285, 0, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1928, 0, 0, '太原学院', '事业', '01', 9456, '074001', NULL, 7528, '142431198610120081', '赵娟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f533cbc42e83448a8f097bfdcc387365', 89, 0, 1435, 0, 30, 2650, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2153, 0, 0, '太原学院', '事业', '01', 10757, '074001', NULL, 8604, '142729198008290023', '吉丽娟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f56985339bd94f059b78f55e7ee4f131', 94, 0, 1745, 0, 0, 3455, 0, 3391, 2800, 1810, 0, 0, 0, 0, 2618, 0, 0, '太原学院', '事业', '01', 13295, '074001', NULL, 10677, '140102196911124810', '陈晖', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f58200142fd94e959712c3426ba2abd3', 89, 3.5, 1414, 0, 30, 2185, 0, 2582, 2660, 1418, 0, 0, 0, 0, 2121, 0, 0, '太原学院', '事业', '01', 10381.5, '074001', NULL, 8260.5, '140102197211126529', '王志欣', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f597734b03a340708c08a3909dd4ef34', 99, 0, 1443, 50, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2165, 0, 0, '太原学院', '事业', '01', 10804, '074001', NULL, 8639, '14010719850328172X', '李金菁', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f60429e10956429d8ed0653f0ff124f4', 99, 0, 1479, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2219, 0, 0, '太原学院', '事业', '01', 11033, '074001', NULL, 8814, '142625197903120025', '李慧慧', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f605273b36d546b8b001b393d05ce7ba', 99, 0, 1468, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2202, 0, 0, '太原学院', '事业', '01', 11022, '074001', NULL, 8820, '142601198211181920', '张新华', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f66b588af8ab4c2b906d95ff01c5a6e1', 89, 0, 1037, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1556, 0, 0, '太原学院', '事业', '01', 8394, '074001', NULL, 6838, '140109199401120017', '许宸嘉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f699732b5e924da58a7be1145d1266f7', 69, 4.5, 1453, 0, 0, 2260, 0, 2989, 2590, 1365, 0, 0, 0, 0, 2180, 0, 0, '太原学院', '事业', '01', 10730.5, '074001', NULL, 8550.5, '140103196511110037', '郝清义', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f6b657d9ee55468d9652a903050c96e3', 99, 0, 1548, 0, 30, 3030, 0, 2689, 2730, 1540, 0, 0, 0, 0, 2322, 0, 0, '太原学院', '事业', '01', 11666, '074001', NULL, 9344, '140103197609140722', '常京霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f6eb321bd27e47c2bd7f54b66a4ed926', 89, 0, 1215, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1823, 0, 0, '太原学院', '事业', '01', 8848, '074001', NULL, 7025, '142402199307030625', '雷晓丹', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f6ed7142d24e4319af576e63560db975', 74, 0, 1081, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1622, 0, 0, '太原学院', '事业', '01', 7779, '074001', NULL, 6157, '140110199701172041', '吴晓莉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f7018a4aca184f29955ebfecaa01ce00', 74, 0, 1094, 0, 0, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1641, 0, 0, '太原学院', '事业', '01', 7691, '074001', NULL, 6050, '140424199705030010', '王旭', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f713616c835a40f2861aa42e88526248', 99, 0, 1455, 50, 30, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2183, 0, 0, '太原学院', '事业', '01', 10909, '074001', NULL, 8726, '140108198303244226', '赵欣', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f7283184f761426f9981a64f87eb13cb', 99, 0, 1663, 0, 30, 3810, 0, 2796, 2730, 1540, 0, 0, 0, 0, 2495, 0, 0, '太原学院', '事业', '01', 12668, '074001', NULL, 10173, '142223197408142724', '徐国华', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f73ad0cdf90848f498c24cd0a3e1b578', 89, 0, 1273, 0, 30, 2185, 0, 1427, 2660, 1418, 0, 0, 0, 0, 1910, 0, 0, '太原学院', '事业', '01', 9082, '074001', NULL, 7172, '500222199001164620', '樊艳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f756f66cdbc6476b87ab20bb506ff906', 89, 0, 1206, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1809, 0, 0, '太原学院', '事业', '01', 8593, '074001', NULL, 6784, '140109199608190565', '张子怡', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f75c5500a49e45cf89b589e37005684a', 64, 0, 975, 0, 0, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1463, 0, 0, '太原学院', '事业', '01', 8067, '074001', NULL, 6604, '140107199408263317', '靖秉翰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f8168abd60fc488e8c33033f66a4846f', 99, 0, 1453, 50, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2180, 0, 0, '太原学院', '事业', '01', 10814, '074001', NULL, 8634, '140105198312291885', '王雅馨', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f8713999a75c4d1da555bdbab6842869', 99, 0, 1519, 50, 30, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2279, 0, 0, '太原学院', '事业', '01', 11273, '074001', NULL, 8994, '412728198211122526', '杨翠平', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f88424ae474b473a9e95770661c934cf', 89, 0, 1230, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1845, 0, 0, '太原学院', '事业', '01', 8781, '074001', NULL, 6936, '142301199506130061', '张照琳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f887f6183c1c4684af1eda9c18677874', 89, 0, 1191, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1787, 0, 0, '太原学院', '事业', '01', 8630, '074001', NULL, 6843, '140108199011202811', '赵博', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f9190429ad204ce7b945d7f2555722a4', 99, 0, 1578, 0, 30, 3260, 0, 2689, 2730, 1540, 0, 0, 0, 0, 2367, 0, 0, '太原学院', '事业', '01', 11926, '074001', NULL, 9559, '142321197502070029', '刘柯', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f93db0cc7f8a4423b4fd2cd83b6afd32', 99, 0, 1437, 0, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2156, 0, 0, '太原学院', '事业', '01', 10748, '074001', NULL, 8592, '142729198212241827', '温东辉', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f94fc7f04af0403db589b32be0457b5c', 89, 0, 1476, 0, 30, 2650, 0, 2796, 2660, 1418, 0, 0, 0, 0, 2214, 0, 0, '太原学院', '事业', '01', 11119, '074001', NULL, 8905, '140103197409075727', '吕嵘', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f950287c0dc145bcb44f03c5bae95d42', 89, 0, 1323, 0, 0, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1985, 0, 0, '太原学院', '事业', '01', 9782, '074001', NULL, 7797, '23108419781220001X', '包全磊', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f96344a2e54e463fa8c44ca6861333d9', 74, 0, 1133, 0, 30, 1925, 0, 1251, 2520, 1215, 0, 0, 0, 0, 1700, 0, 0, '太原学院', '事业', '01', 8148, '074001', NULL, 6448, '330424199211280066', '周博雅', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('f97dc7314a554fbab1c47394e8d488e3', 89, 0, 1230, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1845, 0, 0, '太原学院', '事业', '01', 8781, '074001', NULL, 6936, '140105199303051825', '白宇星', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('fa12e98b13404131bb650285fc8ca658', 89, 0, 1227, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1841, 0, 0, '太原学院', '事业', '01', 8948, '074001', NULL, 7107, '140624199209221521', '郑文清', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('fa6796b4fb9d42b2809e5f4bc8755cc3', 89, 0, 1227, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1841, 0, 0, '太原学院', '事业', '01', 8948, '074001', NULL, 7107, '140107199208100046', '关欣', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('faa04109b8c84f63a2e2914dbdace5c3', 99, 0, 1550, 50, 30, 3260, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2325, 0, 0, '太原学院', '事业', '01', 11734, '074001', NULL, 9409, '142202197609020764', '武子英', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('fac4e050e86240f4aaf5ab63949f0075', 104, 0, 1799, 50, 0, 4640, 0, 2375, 2940, 1908, 0, 0, 0, 0, 2699, 0, 0, '太原学院', '事业', '01', 13816, '074001', NULL, 11117, '142601197908051910', '张永刚', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('fbe7f51799204bd39b68e494ece21829', 99, 0, 1443, 0, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2165, 0, 0, '太原学院', '事业', '01', 10754, '074001', NULL, 8589, '140411197809113629', '苏银', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('fd1dcd63abac45e5820fb6561aac2bba', 74, 0, 1242, 0, 30, 1950, 0, 2075, 2520, 1215, 0, 0, 0, 0, 1863, 0, 0, '太原学院', '事业', '01', 9106, '074001', NULL, 7243, '140105198209200543', '王赟', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('fd571554528540aca02bb889c3331de6', 89, 0, 1295, 50, 0, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1943, 0, 0, '太原学院', '事业', '01', 9393, '074001', NULL, 7450, '140106198306260018', '王子健', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('fdac7aed18ea4b6f84a6e1b3b3a5d396', 74, 0, 1145, 0, 30, 1925, 0, 1427, 2520, 1215, 0, 0, 0, 0, 1718, 0, 0, '太原学院', '事业', '01', 8336, '074001', NULL, 6618, '142725198811012422', '杨君薇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('fdc16d35f91f4ae2a6fd2d5c50ad2962', 99, 0, 1455, 50, 30, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2183, 0, 0, '太原学院', '事业', '01', 10909, '074001', NULL, 8726, '130406198211140368', '何江', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('fdc723e87c7140fb8f5fd924a3f182b3', 99, 0, 1461, 50, 0, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2192, 0, 0, '太原学院', '事业', '01', 10885, '074001', NULL, 8693, '142402198008243319', '赵承勇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('fddf92b87ea8407fa8e9ebe7cded6d31', 89, 0, 1273, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1910, 0, 0, '太原学院', '事业', '01', 9351, '074001', NULL, 7441, '140106198507121823', '赵佳', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('fde2d838392b44b2940d066ac8ea78bd', 69, 0, 1304, 0, 0, 2260, 0, 2041, 2590, 1365, 0, 0, 0, 0, 1956, 0, 0, '太原学院', '事业', '01', 9629, '074001', NULL, 7673, '142726197503163052', '张晓民', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('fde5cb873fec405a8036ca05abca60bf', 99, 0, 1564, 0, 30, 3260, 0, 2582, 2730, 1540, 0, 0, 0, 0, 2346, 0, 0, '太原学院', '事业', '01', 11805, '074001', NULL, 9459, '140121197708078023', '陈慧茹', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('fe3c71113fea4a828a0506b4cefbf416', 55.2, 3.1, 503, 0, 0, 1464, 0, 942, 0, 940.8, 0, 0, 0, 0, 755, 0, 0, '太原学院', '事业', '01', 3908.1, '074001', NULL, 3153.1, '140102197201202313', '邸冬生', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('fe56ea57e4f84bee98a2b496c8230b8d', 74, 0, 1277, 50, 0, 1925, 0, 2375, 2520, 1215, 0, 0, 0, 0, 1916, 0, 0, '太原学院', '事业', '01', 9436, '074001', NULL, 7520, '140102197609036558', '武小勇', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('fe9110467a1a4746a0bb55ce310642d1', 64, 0, 975, 0, 0, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1463, 0, 0, '太原学院', '事业', '01', 8067, '074001', NULL, 6604, '142327199612106632', '王栋', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('fe99116d862944ab8388e56dff8ae103', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '142301199311010027', '王虹霞', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('fed5a8b1613f49fdbec74e2ea43317ea', 99, 0, 1494, 50, 30, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2241, 0, 0, '太原学院', '事业', '01', 11248, '074001', NULL, 9007, '140102198102276522', '张琰', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('fedaf8b59e274af7b5198af7074b2c3a', 99, 3.9, 1788, 0, 0, 3810, 0, 3781, 2730, 1540, 0, 0, 0, 0, 2682, 0, 0, '太原学院', '事业', '01', 13751.9, '074001', NULL, 11069.9, '140103196802053335', '殷国刚', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('fef1d17380b14a75864ab4654b55e0d0', 99, 0, 1544, 0, 30, 3030, 0, 2582, 2730, 1540, 0, 0, 0, 0, 2316, 0, 0, '太原学院', '事业', '01', 11555, '074001', NULL, 9239, '14012219770621282X', '张文仙', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ff2cfcc9bc474233a7cd1270af7cc5a6', 99, 0, 1440, 0, 0, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2160, 0, 0, '太原学院', '事业', '01', 10721, '074001', NULL, 8561, '140107198407254836', '魏鹏', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ff481738ded94cd38187393047cc04f3', 79, 0, 1293, 0, 30, 2200, 0, 2075, 2590, 1292, 0, 0, 0, 0, 1940, 0, 0, '太原学院', '事业', '01', 9559, '074001', NULL, 7619, '411102198103205669', '任淑婷', 'f3150ee848504816b854a43c92cacdbe');
INSERT INTO `salaryyingfa` VALUES ('ff48cb2067d346218967fa1bb0eb8220', 89, 0, 1181, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1772, 0, 0, '太原学院', '事业', '01', 8568, '074001', NULL, 6796, '142725199511040063', '贾玉茹', 'f3150ee848504816b854a43c92cacdbe');

-- ----------------------------
-- Table structure for scan_scanresult
-- ----------------------------
DROP TABLE IF EXISTS `scan_scanresult`;
CREATE TABLE `scan_scanresult`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `scanResultText` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `scantask_id` bigint NOT NULL,
  `ctime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `scan_scanresult_scantask_id_6dd007fc_fk_scan_scantask_id`(`scantask_id` ASC) USING BTREE,
  CONSTRAINT `scan_scanresult_scantask_id_6dd007fc_fk_scan_scantask_id` FOREIGN KEY (`scantask_id`) REFERENCES `scan_scantask` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 492 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scan_scanresult
-- ----------------------------

-- ----------------------------
-- Table structure for scan_scanresultkeyword
-- ----------------------------
DROP TABLE IF EXISTS `scan_scanresultkeyword`;
CREATE TABLE `scan_scanresultkeyword`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `keyword` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `score` int NOT NULL,
  `suggestion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `scanResult_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `scan_scanresultkeywo_scanResult_id_2a3adad1_fk_scan_scan`(`scanResult_id` ASC) USING BTREE,
  CONSTRAINT `scan_scanresultkeywo_scanResult_id_2a3adad1_fk_scan_scan` FOREIGN KEY (`scanResult_id`) REFERENCES `scan_scanresult` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scan_scanresultkeyword
-- ----------------------------

-- ----------------------------
-- Table structure for scan_scantask
-- ----------------------------
DROP TABLE IF EXISTS `scan_scantask`;
CREATE TABLE `scan_scantask`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `word` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ctime` datetime(6) NOT NULL,
  `countInfo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `is_scan` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scan_scantask
-- ----------------------------

-- ----------------------------
-- Table structure for scan_scanurl
-- ----------------------------
DROP TABLE IF EXISTS `scan_scanurl`;
CREATE TABLE `scan_scanurl`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scan_scanurl
-- ----------------------------
INSERT INTO `scan_scanurl` VALUES (3, 'https://nic.tyu.edu.cn', '信息网络中心', '');
INSERT INTO `scan_scanurl` VALUES (5, 'https://sxx.tyu.edu.cn', '数学系', '');

-- ----------------------------
-- Table structure for scan_sensitive_keyword
-- ----------------------------
DROP TABLE IF EXISTS `scan_sensitive_keyword`;
CREATE TABLE `scan_sensitive_keyword`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `keyword` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `suggestion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `score` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `ctime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `keyword`(`keyword` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scan_sensitive_keyword
-- ----------------------------

-- ----------------------------
-- Table structure for scores
-- ----------------------------
DROP TABLE IF EXISTS `scores`;
CREATE TABLE `scores`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `major` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `high_score` int NULL DEFAULT NULL,
  `low_score` int NULL DEFAULT NULL,
  `average_score` int NULL DEFAULT NULL,
  `batch_id` bigint NOT NULL,
  `province_id` bigint NOT NULL,
  `subject_category_id` bigint NOT NULL,
  `year_id` bigint NOT NULL,
  `province_score` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Scores_batch_id_8f25ff4b_fk_Batch_id`(`batch_id` ASC) USING BTREE,
  INDEX `Scores_province_id_72e096b5_fk_Provinces_id`(`province_id` ASC) USING BTREE,
  INDEX `Scores_subject_category_id_f2928af9_fk_SubjectCategory_id`(`subject_category_id` ASC) USING BTREE,
  INDEX `Scores_year_id_03c9634b_fk_Years_id`(`year_id` ASC) USING BTREE,
  CONSTRAINT `Scores_batch_id_8f25ff4b_fk_Batch_id` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Scores_province_id_72e096b5_fk_Provinces_id` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Scores_subject_category_id_f2928af9_fk_SubjectCategory_id` FOREIGN KEY (`subject_category_id`) REFERENCES `subjectcategory` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Scores_year_id_03c9634b_fk_Years_id` FOREIGN KEY (`year_id`) REFERENCES `years` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1237 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scores
-- ----------------------------
INSERT INTO `scores` VALUES (384, '建筑环境与能源应用工程', 382, 379, 381, 3, 21, 3, 6, 350);
INSERT INTO `scores` VALUES (385, '园林', 373, 371, 372, 3, 21, 3, 6, 350);
INSERT INTO `scores` VALUES (386, '边防军人子女预科班', 390, 390, 390, 3, 21, 3, 6, 350);
INSERT INTO `scores` VALUES (387, '酒店管理', 429, 429, 429, 3, 21, 4, 6, 405);
INSERT INTO `scores` VALUES (388, '跨境电子商务', 435, 435, 435, 3, 21, 4, 6, 405);
INSERT INTO `scores` VALUES (389, '旅游管理与服务教育', 435, 435, 435, 3, 21, 4, 6, 405);
INSERT INTO `scores` VALUES (390, '边防军人子女预科班', 355, 355, 355, 3, 21, 4, 6, 405);
INSERT INTO `scores` VALUES (391, '翻译', 508, 506, 507, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (392, '汽车服务工程', 477, 475, 476, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (393, '土木工程', 486, 466, 475, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (394, '建筑环境与能源应用工程', 477, 474, 475, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (395, '给排水科学与工程', 474, 472, 473, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (396, '道路桥梁与渡河工程', 475, 473, 474, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (397, '化学工程与工业生物工程', 509, 474, 486, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (398, '建筑学', 506, 504, 505, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (399, '风景园林', 506, 505, 506, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (400, '园林', 506, 505, 506, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (401, '市场营销', 509, 506, 508, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (402, '人力资源管理', 515, 508, 510, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (403, '物流工程', 492, 483, 488, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (404, '跨境电子商务', 508, 506, 507, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (405, '酒店管理', 505, 505, 505, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (406, '旅游管理与服务教育', 503, 503, 503, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (407, '边防军人子女预科班', 464, 446, 463, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (408, '汽车服务工程', 464, 464, 464, 3, 23, 3, 6, 394);
INSERT INTO `scores` VALUES (409, '建筑环境与能源应用工程', 462, 461, 461, 3, 23, 3, 6, 394);
INSERT INTO `scores` VALUES (410, '给排水科学与工程', 468, 462, 465, 3, 23, 3, 6, 394);
INSERT INTO `scores` VALUES (411, '道路桥梁与渡河工程', 464, 463, 464, 3, 23, 3, 6, 394);
INSERT INTO `scores` VALUES (412, '化学工程与工业生物工程', 464, 462, 463, 3, 23, 3, 6, 394);
INSERT INTO `scores` VALUES (413, '风景园林', 455, 455, 455, 3, 23, 3, 6, 394);
INSERT INTO `scores` VALUES (414, '旅游管理与服务教育', 460, 460, 460, 3, 23, 3, 6, 394);
INSERT INTO `scores` VALUES (415, '园林', 453, 452, 453, 3, 23, 3, 6, 394);
INSERT INTO `scores` VALUES (416, '物流工程', 468, 463, 466, 3, 23, 3, 6, 394);
INSERT INTO `scores` VALUES (417, '边防军人子女预科班', 448, 402, 418, 3, 23, 3, 6, 394);
INSERT INTO `scores` VALUES (418, '风景园林', 478, 478, 478, 3, 23, 4, 6, 414);
INSERT INTO `scores` VALUES (419, '旅游管理与服务教育', 478, 478, 478, 3, 23, 4, 6, 414);
INSERT INTO `scores` VALUES (420, '边防军人子女预科班', 421, 412, 417, 3, 23, 4, 6, 414);
INSERT INTO `scores` VALUES (421, '建筑环境与能源应用工程', 513, 510, 512, 3, 24, 3, 6, 475);
INSERT INTO `scores` VALUES (422, '给排水科学与工程', 509, 508, 509, 3, 24, 3, 6, 475);
INSERT INTO `scores` VALUES (423, '化学工程与工业生物工程', 507, 506, 506, 3, 24, 3, 6, 475);
INSERT INTO `scores` VALUES (424, '道路桥梁与渡河工程', 506, 506, 506, 3, 24, 3, 6, 475);
INSERT INTO `scores` VALUES (425, '酒店管理', 519, 519, 519, 3, 24, 3, 6, 475);
INSERT INTO `scores` VALUES (426, '风景园林', 519, 519, 519, 3, 24, 3, 6, 475);
INSERT INTO `scores` VALUES (427, '建筑学', 519, 519, 519, 3, 24, 3, 6, 475);
INSERT INTO `scores` VALUES (428, '人力资源管理', 517, 516, 517, 3, 24, 3, 6, 475);
INSERT INTO `scores` VALUES (429, '园林', 516, 515, 516, 3, 24, 3, 6, 475);
INSERT INTO `scores` VALUES (430, '物流工程', 518, 516, 517, 3, 24, 3, 6, 475);
INSERT INTO `scores` VALUES (431, '边防军人子女预科班', 472, 417, 472, 3, 24, 3, 6, 475);
INSERT INTO `scores` VALUES (432, '风景园林', 486, 486, 486, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (433, '市场营销', 500, 500, 500, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (434, '翻译', 487, 487, 487, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (435, '跨境电子商务', 493, 493, 493, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (436, '酒店管理', 487, 487, 487, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (437, '汽车服务工程', 496, 495, 496, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (438, '建筑环境与能源应用工程', 491, 490, 491, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (439, '给排水科学与工程', 494, 490, 492, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (440, '道路桥梁与渡河工程', 497, 494, 496, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (441, '化学工程与工业生物工程', 510, 493, 502, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (442, '建筑学', 508, 489, 499, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (443, '园林', 487, 485, 486, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (444, '物流工程', 499, 494, 496, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (445, '人力资源管理', 487, 487, 487, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (446, '边防军人子女预科班', 431, 431, 431, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (447, '风景园林', 504, 504, 504, 3, 25, 4, 6, 438);
INSERT INTO `scores` VALUES (448, '市场营销', 506, 506, 506, 3, 25, 4, 6, 438);
INSERT INTO `scores` VALUES (449, '翻译', 506, 506, 506, 3, 25, 4, 6, 438);
INSERT INTO `scores` VALUES (450, '跨境电子商务', 504, 504, 504, 3, 25, 4, 6, 438);
INSERT INTO `scores` VALUES (451, '酒店管理', 513, 513, 513, 3, 25, 4, 6, 438);
INSERT INTO `scores` VALUES (452, '人力资源管理', 505, 505, 505, 3, 25, 4, 6, 438);
INSERT INTO `scores` VALUES (453, '汽车服务工程', 515, 500, 505, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (454, '土木工程', 502, 500, 501, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (455, '建筑环境与能源应用工程', 509, 499, 502, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (456, '给排水科学与工程', 500, 499, 500, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (457, '道路桥梁与渡河工程', 499, 498, 499, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (458, '化学工程与工业生物工程', 503, 502, 503, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (459, '应用心理学', 497, 497, 497, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (460, '建筑学', 507, 507, 507, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (461, '风景园林', 501, 501, 501, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (462, '市场营销', 496, 496, 496, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (463, '人力资源管理', 495, 495, 495, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (464, '跨境电子商务', 496, 496, 496, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (465, '酒店管理', 494, 494, 494, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (466, '旅游管理与服务教育', 496, 496, 496, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (467, '园林', 499, 497, 498, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (468, '物流工程', 518, 509, 514, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (469, '边防军人子女预科班', 443, 441, 435, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (470, '应用心理学', 523, 523, 523, 3, 26, 4, 6, 471);
INSERT INTO `scores` VALUES (471, '风景园林', 532, 532, 532, 3, 26, 4, 6, 471);
INSERT INTO `scores` VALUES (472, '市场营销', 524, 524, 524, 3, 26, 4, 6, 471);
INSERT INTO `scores` VALUES (473, '人力资源管理', 524, 524, 542, 3, 26, 4, 6, 471);
INSERT INTO `scores` VALUES (474, '跨境电子商务', 539, 539, 539, 3, 26, 4, 6, 471);
INSERT INTO `scores` VALUES (475, '酒店管理', 525, 525, 525, 3, 26, 4, 6, 471);
INSERT INTO `scores` VALUES (476, '旅游管理与服务教育', 523, 523, 523, 3, 26, 4, 6, 471);
INSERT INTO `scores` VALUES (477, '建筑学', 492, 492, 492, 3, 27, 3, 6, 438);
INSERT INTO `scores` VALUES (478, '风景园林', 491, 491, 491, 3, 27, 3, 6, 438);
INSERT INTO `scores` VALUES (479, '酒店管理', 493, 493, 493, 3, 27, 3, 6, 438);
INSERT INTO `scores` VALUES (480, '物流工程', 500, 495, 498, 3, 27, 3, 6, 438);
INSERT INTO `scores` VALUES (481, '汽车服务工程', 503, 498, 501, 3, 27, 3, 6, 438);
INSERT INTO `scores` VALUES (482, '建筑环境与能源应用工程', 501, 498, 500, 3, 27, 3, 6, 438);
INSERT INTO `scores` VALUES (483, '给排水科学与工程', 505, 498, 502, 3, 27, 3, 6, 438);
INSERT INTO `scores` VALUES (484, '道路桥梁与渡河工程', 502, 497, 499, 3, 27, 3, 6, 438);
INSERT INTO `scores` VALUES (485, '化学工程与工业生物工程', 514, 500, 507, 3, 27, 3, 6, 438);
INSERT INTO `scores` VALUES (486, '园林', 493, 493, 493, 3, 27, 3, 6, 438);
INSERT INTO `scores` VALUES (487, '边防军人子女预科班', 409, 390, 400, 3, 27, 3, 6, 438);
INSERT INTO `scores` VALUES (488, '风景园林', 525, 525, 525, 3, 27, 4, 6, 402);
INSERT INTO `scores` VALUES (489, '酒店管理', 525, 525, 524, 3, 27, 4, 6, 402);
INSERT INTO `scores` VALUES (490, '边防军人子女预科班', 449, 449, 449, 3, 27, 4, 6, 402);
INSERT INTO `scores` VALUES (491, '建筑学', 477, 477, 477, 3, 28, 3, 6, 430);
INSERT INTO `scores` VALUES (492, '人力资源管理', 465, 465, 465, 3, 28, 3, 6, 430);
INSERT INTO `scores` VALUES (493, '跨境电子商务', 476, 476, 476, 3, 28, 3, 6, 430);
INSERT INTO `scores` VALUES (494, '酒店管理', 464, 464, 464, 3, 28, 3, 6, 430);
INSERT INTO `scores` VALUES (495, '旅游管理与服务教育', 465, 465, 465, 3, 28, 3, 6, 430);
INSERT INTO `scores` VALUES (496, '物流工程', 477, 474, 476, 3, 28, 3, 6, 430);
INSERT INTO `scores` VALUES (497, '汽车服务工程', 480, 476, 478, 3, 28, 3, 6, 430);
INSERT INTO `scores` VALUES (498, '建筑环境与能源应用工程', 486, 475, 479, 3, 28, 3, 6, 430);
INSERT INTO `scores` VALUES (499, '给排水科学与工程', 479, 475, 476, 3, 28, 3, 6, 430);
INSERT INTO `scores` VALUES (500, '道路桥梁与渡河工程', 480, 474, 477, 3, 28, 3, 6, 430);
INSERT INTO `scores` VALUES (501, '化学工程与工业生物工程', 475, 475, 475, 3, 28, 3, 6, 430);
INSERT INTO `scores` VALUES (502, '园林（农林类）', 473, 470, 472, 3, 28, 3, 6, 430);
INSERT INTO `scores` VALUES (503, '人力资源管理', 502, 502, 502, 3, 28, 4, 6, 430);
INSERT INTO `scores` VALUES (504, '跨境电子商务', 508, 508, 508, 3, 28, 4, 6, 430);
INSERT INTO `scores` VALUES (505, '酒店管理', 503, 503, 503, 3, 28, 4, 6, 430);
INSERT INTO `scores` VALUES (506, '旅游管理与服务教育', 500, 500, 500, 3, 28, 4, 6, 430);
INSERT INTO `scores` VALUES (507, '边防军人子女预科班', 453, 453, 453, 3, 28, 4, 6, 430);
INSERT INTO `scores` VALUES (508, '边防军人子女预科班', 498, 480, 0, 3, 29, 3, 6, 490);
INSERT INTO `scores` VALUES (509, '边防军人子女预科班', 362, 360, 0, 3, 30, 3, 6, 402);
INSERT INTO `scores` VALUES (510, '边防军人子女预科班', 429, 378, 0, 3, 31, 3, 6, 430);
INSERT INTO `scores` VALUES (511, '投资学', 345, 345, 345, 3, 32, 3, 6, 319);
INSERT INTO `scores` VALUES (512, '学前教育', 341, 341, 341, 3, 32, 3, 6, 319);
INSERT INTO `scores` VALUES (513, '风景园林', 379, 379, 379, 3, 32, 3, 6, 319);
INSERT INTO `scores` VALUES (514, '园林', 340, 340, 340, 3, 32, 3, 6, 319);
INSERT INTO `scores` VALUES (515, '市场营销', 343, 343, 343, 3, 32, 3, 6, 319);
INSERT INTO `scores` VALUES (516, '财务管理', 351, 351, 351, 3, 32, 3, 6, 319);
INSERT INTO `scores` VALUES (517, '人力资源管理', 342, 342, 342, 3, 32, 3, 6, 319);
INSERT INTO `scores` VALUES (518, '物流工程', 339, 339, 339, 3, 32, 3, 6, 319);
INSERT INTO `scores` VALUES (519, '跨境电子商务', 343, 343, 343, 3, 32, 3, 6, 319);
INSERT INTO `scores` VALUES (520, '酒店管理', 345, 345, 345, 3, 32, 3, 6, 319);
INSERT INTO `scores` VALUES (521, '旅游管理与服务教育', 342, 342, 342, 3, 32, 3, 6, 319);
INSERT INTO `scores` VALUES (522, '边防军人子女预科班', 318, 281, 300, 3, 32, 3, 6, 319);
INSERT INTO `scores` VALUES (523, '边防军人子女预科班', 468, 425, 448, 3, 6, 3, 6, 463);
INSERT INTO `scores` VALUES (524, '土木工程', 489, 489, 489, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (525, '建筑环境与能源应用工程', 497, 486, 490, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (526, '给排水科学与工程', 498, 486, 492, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (527, '园林', 483, 483, 483, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (528, '翻译', 490, 490, 490, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (529, '应用心理学', 495, 495, 495, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (530, '建筑学', 492, 490, 491, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (531, '酒店管理', 488, 488, 488, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (532, '旅游管理与服务教育', 489, 489, 489, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (533, '翻译', 488, 488, 488, 3, 5, 4, 6, 450);
INSERT INTO `scores` VALUES (534, '应用心理学', 488, 488, 488, 3, 5, 4, 6, 450);
INSERT INTO `scores` VALUES (535, '酒店管理', 520, 520, 520, 3, 5, 4, 6, 450);
INSERT INTO `scores` VALUES (536, '旅游管理与服务教育', 487, 487, 487, 3, 5, 4, 6, 450);
INSERT INTO `scores` VALUES (537, '酒店管理', 431, 431, 431, 3, 7, 3, 6, 374);
INSERT INTO `scores` VALUES (538, '人力资源管理', 427, 427, 427, 3, 7, 3, 6, 374);
INSERT INTO `scores` VALUES (539, '化学工程与工业生物工程', 458, 438, 446, 3, 7, 3, 6, 374);
INSERT INTO `scores` VALUES (540, '园林', 426, 426, 426, 3, 7, 3, 6, 374);
INSERT INTO `scores` VALUES (541, '边防军人子女预科班', 405, 340, 375, 3, 7, 3, 6, 374);
INSERT INTO `scores` VALUES (542, '风景园林', 458, 458, 458, 3, 7, 4, 6, 412);
INSERT INTO `scores` VALUES (543, '酒店管理', 456, 456, 456, 3, 7, 4, 6, 412);
INSERT INTO `scores` VALUES (544, '人力资源管理', 456, 456, 456, 3, 7, 4, 6, 412);
INSERT INTO `scores` VALUES (545, '边防军人子女预科班', 426, 426, 426, 3, 7, 4, 6, 412);
INSERT INTO `scores` VALUES (546, '酒店管理', 493, 493, 493, 3, 8, 3, 6, 436);
INSERT INTO `scores` VALUES (547, '建筑环境与能源应用工程', 495, 495, 495, 3, 8, 3, 6, 436);
INSERT INTO `scores` VALUES (548, '给排水科学与工程', 502, 502, 502, 3, 8, 3, 6, 436);
INSERT INTO `scores` VALUES (549, '化学工程与工业生物工程', 502, 502, 502, 3, 8, 3, 6, 436);
INSERT INTO `scores` VALUES (550, '园林', 492, 492, 492, 3, 8, 3, 6, 436);
INSERT INTO `scores` VALUES (551, '酒店管理', 519, 519, 519, 3, 8, 4, 6, 464);
INSERT INTO `scores` VALUES (552, '汽车服务工程', 434, 426, 430, 3, 9, 3, 6, 370);
INSERT INTO `scores` VALUES (553, '给排水科学与工程', 458, 430, 444, 3, 9, 3, 6, 370);
INSERT INTO `scores` VALUES (554, '化学工程与工业生物工程', 432, 430, 431, 3, 9, 3, 6, 370);
INSERT INTO `scores` VALUES (555, '园林', 421, 421, 421, 3, 9, 3, 6, 370);
INSERT INTO `scores` VALUES (556, '人力资源管理', 425, 425, 425, 3, 9, 3, 6, 370);
INSERT INTO `scores` VALUES (557, '旅游管理与服务教育', 430, 430, 430, 3, 9, 3, 6, 370);
INSERT INTO `scores` VALUES (558, '人力资源管理', 449, 449, 449, 3, 9, 4, 6, 467);
INSERT INTO `scores` VALUES (559, '旅游管理与服务教育', 449, 449, 449, 3, 9, 4, 6, 467);
INSERT INTO `scores` VALUES (560, '市场营销', 459, 459, 459, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (561, '酒店管理', 442, 442, 442, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (562, '跨境电子商务', 447, 447, 447, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (563, '旅游管理与服务教育', 444, 444, 444, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (564, '建筑学', 450, 450, 450, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (565, '给排水科学与工程', 450, 448, 449, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (566, '道路桥梁与渡河工程', 447, 445, 446, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (567, '汽车服务工程', 458, 453, 455, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (568, '建筑环境与能源应用工程', 448, 445, 446, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (569, '市场营销', 516, 516, 516, 3, 10, 4, 6, 458);
INSERT INTO `scores` VALUES (570, '酒店管理', 502, 502, 502, 3, 10, 4, 6, 458);
INSERT INTO `scores` VALUES (571, '跨境电子商务', 499, 499, 499, 3, 10, 4, 6, 458);
INSERT INTO `scores` VALUES (572, '旅游管理与服务教育', 499, 499, 499, 3, 10, 4, 6, 458);
INSERT INTO `scores` VALUES (573, '酒店管理', 561, 559, 460, 3, 11, 3, 6, 483);
INSERT INTO `scores` VALUES (574, '汽车服务工程', 520, 520, 520, 3, 11, 3, 6, 483);
INSERT INTO `scores` VALUES (575, '化学工程与工业生物工程', 522, 520, 521, 3, 11, 3, 6, 483);
INSERT INTO `scores` VALUES (576, '建筑环境与能源应用工程', 522, 520, 521, 3, 11, 3, 6, 483);
INSERT INTO `scores` VALUES (577, '边防军人子女预科班', 442, 442, 442, 3, 11, 3, 6, 483);
INSERT INTO `scores` VALUES (578, '建筑学', 419, 419, 419, 3, 12, 3, 6, 360);
INSERT INTO `scores` VALUES (579, '物流工程', 420, 418, 419, 3, 12, 3, 6, 360);
INSERT INTO `scores` VALUES (580, '给排水科学与工程', 414, 412, 413, 3, 12, 3, 6, 360);
INSERT INTO `scores` VALUES (581, '道路桥梁与渡河工程', 411, 411, 411, 3, 12, 3, 6, 360);
INSERT INTO `scores` VALUES (582, '化学工程与工业生物工程', 412, 412, 412, 3, 12, 3, 6, 360);
INSERT INTO `scores` VALUES (583, '边防军人子女预科班', 370, 370, 370, 3, 12, 3, 6, 360);
INSERT INTO `scores` VALUES (584, '边防军人子女预科班', 404, 404, 404, 3, 12, 4, 6, 405);
INSERT INTO `scores` VALUES (585, '建筑学', 474, 474, 474, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (586, '风景园林', 479, 475, 477, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (587, '跨境电子商务', 489, 489, 489, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (588, '酒店管理', 474, 474, 474, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (589, '旅游管理与服务教育', 477, 477, 477, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (590, '物流工程', 488, 488, 488, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (591, '汽车服务工程', 481, 479, 480, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (592, '给排水科学与工程', 477, 477, 477, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (593, '化学工程与工业生物工程', 477, 477, 477, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (594, '园林', 491, 483, 487, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (595, '跨境电子商务', 513, 513, 513, 3, 13, 4, 6, 442);
INSERT INTO `scores` VALUES (596, '酒店管理', 510, 510, 510, 3, 13, 4, 6, 442);
INSERT INTO `scores` VALUES (597, '旅游管理与服务教育', 510, 510, 510, 3, 13, 4, 6, 442);
INSERT INTO `scores` VALUES (598, '边防军人子女预科班', 428, 406, 417, 3, 13, 4, 6, 442);
INSERT INTO `scores` VALUES (599, '风景园林', 468, 468, 468, 3, 14, 3, 6, 405);
INSERT INTO `scores` VALUES (600, '物流工程', 465, 465, 465, 3, 14, 3, 6, 405);
INSERT INTO `scores` VALUES (601, '汽车服务工程', 453, 453, 453, 3, 14, 3, 6, 405);
INSERT INTO `scores` VALUES (602, '边防军人子女预科班', 360, 360, 360, 3, 14, 3, 6, 405);
INSERT INTO `scores` VALUES (603, '风景园林', 489, 489, 489, 3, 14, 4, 6, 446);
INSERT INTO `scores` VALUES (604, '边防军人子女预科班', 428, 428, 428, 3, 14, 4, 6, 446);
INSERT INTO `scores` VALUES (605, '建筑学', 416, 416, 416, 3, 15, 3, 6, 340);
INSERT INTO `scores` VALUES (606, '酒店管理', 413, 413, 413, 3, 15, 3, 6, 340);
INSERT INTO `scores` VALUES (607, '建筑环境与能源应用工程', 411, 411, 411, 3, 15, 3, 6, 340);
INSERT INTO `scores` VALUES (608, '给排水科学与工程', 413, 411, 412, 3, 15, 3, 6, 340);
INSERT INTO `scores` VALUES (609, '道路桥梁与渡河工程', 422, 411, 415, 3, 15, 3, 6, 340);
INSERT INTO `scores` VALUES (610, '化学工程与工业生物工程', 421, 415, 418, 3, 15, 3, 6, 340);
INSERT INTO `scores` VALUES (611, '酒店管理', 466, 466, 466, 3, 15, 4, 6, 384);
INSERT INTO `scores` VALUES (612, '边防军人子女预科班', 370, 370, 370, 3, 15, 4, 6, 384);
INSERT INTO `scores` VALUES (613, '翻译', 530, 530, 530, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (614, '应用心理学', 523, 523, 523, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (615, '土木工程', 511, 511, 511, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (616, '道路桥梁与渡河工程', 524, 516, 520, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (617, '化学工程与工业生物工程', 520, 518, 519, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (618, '风景园林', 521, 521, 521, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (619, '市场营销', 520, 520, 520, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (620, '人力资源管理', 523, 523, 523, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (621, '跨境电子商务', 518, 518, 518, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (622, '酒店管理', 511, 511, 511, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (623, '旅游管理与服务教育', 565, 565, 565, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (624, '翻译', 543, 543, 543, 3, 16, 4, 6, 477);
INSERT INTO `scores` VALUES (625, '应用心理学', 544, 544, 544, 3, 16, 4, 6, 477);
INSERT INTO `scores` VALUES (626, '风景园林', 550, 550, 550, 3, 16, 4, 6, 477);
INSERT INTO `scores` VALUES (627, '市场营销', 539, 539, 539, 3, 16, 4, 6, 477);
INSERT INTO `scores` VALUES (628, '人力资源管理', 551, 551, 551, 3, 16, 4, 6, 477);
INSERT INTO `scores` VALUES (629, '跨境电子商务', 546, 546, 546, 3, 16, 4, 6, 477);
INSERT INTO `scores` VALUES (630, '酒店管理', 541, 541, 541, 3, 16, 4, 6, 477);
INSERT INTO `scores` VALUES (631, '旅游管理与服务教育', 533, 533, 533, 3, 16, 4, 6, 477);
INSERT INTO `scores` VALUES (632, '边防军人子女预科班', 474, 474, 474, 3, 16, 4, 6, 477);
INSERT INTO `scores` VALUES (633, '汽车服务工程', 467, 467, 467, 3, 18, 3, 6, 367);
INSERT INTO `scores` VALUES (634, '道路桥梁与渡河工程', 467, 467, 467, 3, 18, 3, 6, 367);
INSERT INTO `scores` VALUES (635, '建筑学', 460, 460, 460, 3, 18, 3, 6, 367);
INSERT INTO `scores` VALUES (636, '风景园林', 466, 466, 466, 3, 18, 3, 6, 367);
INSERT INTO `scores` VALUES (637, '酒店管理', 465, 465, 465, 3, 18, 3, 6, 367);
INSERT INTO `scores` VALUES (638, '旅游管理与服务教育', 464, 464, 464, 3, 18, 3, 6, 367);
INSERT INTO `scores` VALUES (639, '风景园林', 494, 494, 494, 3, 18, 4, 6, 437);
INSERT INTO `scores` VALUES (640, '酒店管理', 482, 482, 482, 3, 18, 4, 6, 437);
INSERT INTO `scores` VALUES (641, '旅游管理与服务教育', 486, 486, 486, 3, 18, 4, 6, 437);
INSERT INTO `scores` VALUES (642, '边防军人子女预科班', 433, 429, 431, 3, 18, 4, 6, 437);
INSERT INTO `scores` VALUES (643, '汽车服务工程', 395, 395, 437, 3, 19, 3, 6, 375);
INSERT INTO `scores` VALUES (644, '建筑环境与能源应用工程', 407, 407, 438, 3, 19, 3, 6, 375);
INSERT INTO `scores` VALUES (645, '给排水科学与工程', 440, 428, 430, 3, 19, 3, 6, 375);
INSERT INTO `scores` VALUES (646, '风景园林', 442, 433, 428, 3, 19, 3, 6, 375);
INSERT INTO `scores` VALUES (647, '跨境电子商务', 415, 398, 427, 3, 19, 3, 6, 375);
INSERT INTO `scores` VALUES (648, '酒店管理', 391, 388, 423, 3, 19, 3, 6, 375);
INSERT INTO `scores` VALUES (649, '旅游管理与服务教育', 411, 381, 423, 3, 19, 3, 6, 375);
INSERT INTO `scores` VALUES (650, '园林', 417, 387, 437, 3, 19, 3, 6, 375);
INSERT INTO `scores` VALUES (651, '人力资源管理', 403, 395, 458, 3, 19, 3, 6, 375);
INSERT INTO `scores` VALUES (652, '边防军人子女预科班', 387, 387, 393, 3, 19, 3, 6, 375);
INSERT INTO `scores` VALUES (653, '风景园林', 477, 477, 477, 3, 19, 4, 6, 418);
INSERT INTO `scores` VALUES (654, '人力资源管理', 481, 481, 481, 3, 19, 4, 6, 418);
INSERT INTO `scores` VALUES (655, '跨境电子商务', 480, 480, 480, 3, 19, 4, 6, 418);
INSERT INTO `scores` VALUES (656, '酒店管理', 478, 478, 478, 3, 19, 4, 6, 418);
INSERT INTO `scores` VALUES (657, '旅游管理与服务教育', 502, 502, 502, 3, 19, 4, 6, 418);
INSERT INTO `scores` VALUES (658, '边防军人子女预科班', 417, 417, 417, 3, 19, 4, 6, 418);
INSERT INTO `scores` VALUES (659, '酒店管理', 420, 420, 420, 3, 20, 3, 6, 372);
INSERT INTO `scores` VALUES (660, '旅游管理与服务教育', 426, 426, 426, 3, 20, 3, 6, 372);
INSERT INTO `scores` VALUES (661, '跨境电子商务', 421, 421, 421, 3, 20, 3, 6, 372);
INSERT INTO `scores` VALUES (662, '风景园林', 422, 422, 422, 3, 20, 3, 6, 372);
INSERT INTO `scores` VALUES (663, '会展经济与管理', 421, 421, 421, 3, 20, 3, 6, 372);
INSERT INTO `scores` VALUES (664, '物流工程', 431, 424, 427, 3, 20, 3, 6, 372);
INSERT INTO `scores` VALUES (665, '给排水科学与工程', 431, 426, 428, 3, 20, 3, 6, 372);
INSERT INTO `scores` VALUES (666, '道路桥梁与渡河工程', 426, 426, 426, 3, 20, 3, 6, 372);
INSERT INTO `scores` VALUES (667, '汽车服务工程', 426, 426, 426, 3, 20, 3, 6, 372);
INSERT INTO `scores` VALUES (668, '园林', 423, 423, 423, 3, 20, 3, 6, 372);
INSERT INTO `scores` VALUES (669, '边防军人子女预科班', 395, 395, 395, 3, 20, 3, 6, 372);
INSERT INTO `scores` VALUES (670, '酒店管理', 456, 456, 456, 3, 20, 4, 6, 404);
INSERT INTO `scores` VALUES (671, '风景园林', 455, 455, 455, 3, 20, 4, 6, 404);
INSERT INTO `scores` VALUES (672, '跨境电子商务', 455, 455, 455, 3, 20, 4, 6, 404);
INSERT INTO `scores` VALUES (673, '旅游管理与服务教育', 455, 455, 455, 3, 20, 4, 6, 404);
INSERT INTO `scores` VALUES (674, '会展经济与管理', 454, 454, 454, 3, 20, 4, 6, 404);
INSERT INTO `scores` VALUES (675, '翻译', 508, 506, 507, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (676, '建筑环境与能源应用工程', 477, 474, 475, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (677, '化学工程与工业生物工程', 509, 474, 486, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (678, '跨境电子商务', 508, 506, 507, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (679, '酒店管理', 505, 505, 505, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (680, '旅游管理与服务教育', 503, 503, 503, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (681, '汽车服务工程', 464, 464, 464, 3, 23, 3, 6, 394);
INSERT INTO `scores` VALUES (682, '给排水科学与工程', 468, 462, 465, 3, 23, 3, 6, 394);
INSERT INTO `scores` VALUES (683, '化学工程与工业生物工程', 464, 462, 463, 3, 23, 3, 6, 394);
INSERT INTO `scores` VALUES (684, '风景园林', 455, 455, 455, 3, 23, 3, 6, 394);
INSERT INTO `scores` VALUES (685, '旅游管理与服务教育', 460, 460, 460, 3, 23, 3, 6, 394);
INSERT INTO `scores` VALUES (686, '风景园林', 478, 478, 478, 3, 23, 4, 6, 414);
INSERT INTO `scores` VALUES (687, '旅游管理与服务教育', 478, 478, 478, 3, 23, 4, 6, 414);
INSERT INTO `scores` VALUES (688, '土木工程', 489, 489, 489, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (689, '建筑环境与能源应用工程', 497, 486, 490, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (690, '给排水科学与工程', 498, 486, 492, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (691, '园林', 483, 483, 483, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (692, '翻译', 490, 490, 490, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (693, '应用心理学', 495, 495, 495, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (694, '建筑学', 492, 490, 491, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (695, '酒店管理', 488, 488, 488, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (696, '旅游管理与服务教育', 489, 489, 489, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (697, '翻译', 488, 488, 488, 3, 5, 4, 6, 450);
INSERT INTO `scores` VALUES (698, '应用心理学', 488, 488, 488, 3, 5, 4, 6, 450);
INSERT INTO `scores` VALUES (699, '酒店管理', 520, 520, 520, 3, 5, 4, 6, 450);
INSERT INTO `scores` VALUES (700, '旅游管理与服务教育', 487, 487, 487, 3, 5, 4, 6, 450);
INSERT INTO `scores` VALUES (701, '酒店管理', 431, 431, 431, 3, 7, 3, 6, 374);
INSERT INTO `scores` VALUES (702, '人力资源管理', 427, 427, 427, 3, 7, 3, 6, 374);
INSERT INTO `scores` VALUES (703, '化学工程与工业生物工程', 458, 438, 446, 3, 7, 3, 6, 374);
INSERT INTO `scores` VALUES (704, '园林', 426, 426, 426, 3, 7, 3, 6, 374);
INSERT INTO `scores` VALUES (705, '边防军人子女预科班', 405, 340, 375, 3, 7, 3, 6, 374);
INSERT INTO `scores` VALUES (706, '风景园林', 458, 458, 458, 3, 7, 4, 6, 412);
INSERT INTO `scores` VALUES (707, '酒店管理', 456, 456, 456, 3, 7, 4, 6, 412);
INSERT INTO `scores` VALUES (708, '人力资源管理', 456, 456, 456, 3, 7, 4, 6, 412);
INSERT INTO `scores` VALUES (709, '边防军人子女预科班', 426, 426, 426, 3, 7, 4, 6, 412);
INSERT INTO `scores` VALUES (710, '酒店管理', 493, 493, 493, 3, 8, 3, 6, 436);
INSERT INTO `scores` VALUES (711, '建筑环境与能源应用工程', 495, 495, 495, 3, 8, 3, 6, 436);
INSERT INTO `scores` VALUES (712, '给排水科学与工程', 502, 502, 502, 3, 8, 3, 6, 436);
INSERT INTO `scores` VALUES (713, '化学工程与工业生物工程', 502, 502, 502, 3, 8, 3, 6, 436);
INSERT INTO `scores` VALUES (714, '园林', 492, 492, 492, 3, 8, 3, 6, 436);
INSERT INTO `scores` VALUES (715, '酒店管理', 519, 519, 519, 3, 8, 4, 6, 464);
INSERT INTO `scores` VALUES (716, '汽车服务工程', 434, 426, 430, 3, 9, 3, 6, 370);
INSERT INTO `scores` VALUES (717, '给排水科学与工程', 458, 430, 444, 3, 9, 3, 6, 370);
INSERT INTO `scores` VALUES (718, '化学工程与工业生物工程', 432, 430, 431, 3, 9, 3, 6, 370);
INSERT INTO `scores` VALUES (719, '园林', 421, 421, 421, 3, 9, 3, 6, 370);
INSERT INTO `scores` VALUES (720, '人力资源管理', 425, 425, 425, 3, 9, 3, 6, 370);
INSERT INTO `scores` VALUES (721, '旅游管理与服务教育', 430, 430, 430, 3, 9, 3, 6, 370);
INSERT INTO `scores` VALUES (722, '人力资源管理', 449, 449, 449, 3, 9, 4, 6, 467);
INSERT INTO `scores` VALUES (723, '旅游管理与服务教育', 449, 449, 449, 3, 9, 4, 6, 467);
INSERT INTO `scores` VALUES (724, '市场营销', 459, 459, 459, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (725, '酒店管理', 442, 442, 442, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (726, '跨境电子商务', 447, 447, 447, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (727, '旅游管理与服务教育', 444, 444, 444, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (728, '建筑学', 450, 450, 450, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (729, '给排水科学与工程', 450, 448, 449, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (730, '道路桥梁与渡河工程', 447, 445, 446, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (731, '汽车服务工程', 458, 453, 455, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (732, '建筑环境与能源应用工程', 448, 445, 446, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (733, '市场营销', 516, 516, 516, 3, 10, 4, 6, 458);
INSERT INTO `scores` VALUES (734, '酒店管理', 502, 502, 502, 3, 10, 4, 6, 458);
INSERT INTO `scores` VALUES (735, '跨境电子商务', 499, 499, 499, 3, 10, 4, 6, 458);
INSERT INTO `scores` VALUES (736, '旅游管理与服务教育', 499, 499, 499, 3, 10, 4, 6, 458);
INSERT INTO `scores` VALUES (737, '酒店管理', 561, 559, 460, 3, 11, 3, 6, 483);
INSERT INTO `scores` VALUES (738, '汽车服务工程', 520, 520, 520, 3, 11, 3, 6, 483);
INSERT INTO `scores` VALUES (739, '化学工程与工业生物工程', 522, 520, 521, 3, 11, 3, 6, 483);
INSERT INTO `scores` VALUES (740, '建筑环境与能源应用工程', 522, 520, 521, 3, 11, 3, 6, 483);
INSERT INTO `scores` VALUES (741, '边防军人子女预科班', 442, 442, 442, 3, 11, 3, 6, 483);
INSERT INTO `scores` VALUES (742, '建筑学', 419, 419, 419, 3, 12, 3, 6, 360);
INSERT INTO `scores` VALUES (743, '物流工程', 420, 418, 419, 3, 12, 3, 6, 360);
INSERT INTO `scores` VALUES (744, '给排水科学与工程', 414, 412, 413, 3, 12, 3, 6, 360);
INSERT INTO `scores` VALUES (745, '道路桥梁与渡河工程', 411, 411, 411, 3, 12, 3, 6, 360);
INSERT INTO `scores` VALUES (746, '化学工程与工业生物工程', 412, 412, 412, 3, 12, 3, 6, 360);
INSERT INTO `scores` VALUES (747, '边防军人子女预科班', 370, 370, 370, 3, 12, 3, 6, 360);
INSERT INTO `scores` VALUES (748, '边防军人子女预科班', 404, 404, 404, 3, 12, 4, 6, 405);
INSERT INTO `scores` VALUES (749, '建筑学', 474, 474, 474, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (750, '风景园林', 479, 475, 477, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (751, '跨境电子商务', 489, 489, 489, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (752, '酒店管理', 474, 474, 474, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (753, '旅游管理与服务教育', 477, 477, 477, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (754, '物流工程', 488, 488, 488, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (755, '汽车服务工程', 481, 479, 480, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (756, '给排水科学与工程', 477, 477, 477, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (757, '化学工程与工业生物工程', 477, 477, 477, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (758, '园林', 491, 483, 487, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (759, '跨境电子商务', 513, 513, 513, 3, 13, 4, 6, 442);
INSERT INTO `scores` VALUES (760, '酒店管理', 510, 510, 510, 3, 13, 4, 6, 442);
INSERT INTO `scores` VALUES (761, '旅游管理与服务教育', 510, 510, 510, 3, 13, 4, 6, 442);
INSERT INTO `scores` VALUES (762, '边防军人子女预科班', 428, 406, 417, 3, 13, 4, 6, 442);
INSERT INTO `scores` VALUES (763, '风景园林', 468, 468, 468, 3, 14, 3, 6, 405);
INSERT INTO `scores` VALUES (764, '物流工程', 465, 465, 465, 3, 14, 3, 6, 405);
INSERT INTO `scores` VALUES (765, '汽车服务工程', 453, 453, 453, 3, 14, 3, 6, 405);
INSERT INTO `scores` VALUES (766, '边防军人子女预科班', 360, 360, 360, 3, 14, 3, 6, 405);
INSERT INTO `scores` VALUES (767, '风景园林', 489, 489, 489, 3, 14, 4, 6, 446);
INSERT INTO `scores` VALUES (768, '边防军人子女预科班', 428, 428, 428, 3, 14, 4, 6, 446);
INSERT INTO `scores` VALUES (769, '建筑学', 416, 416, 416, 3, 15, 3, 6, 340);
INSERT INTO `scores` VALUES (770, '酒店管理', 413, 413, 413, 3, 15, 3, 6, 340);
INSERT INTO `scores` VALUES (771, '建筑环境与能源应用工程', 411, 411, 411, 3, 15, 3, 6, 340);
INSERT INTO `scores` VALUES (772, '给排水科学与工程', 413, 411, 412, 3, 15, 3, 6, 340);
INSERT INTO `scores` VALUES (773, '道路桥梁与渡河工程', 422, 411, 415, 3, 15, 3, 6, 340);
INSERT INTO `scores` VALUES (774, '化学工程与工业生物工程', 421, 415, 418, 3, 15, 3, 6, 340);
INSERT INTO `scores` VALUES (775, '酒店管理', 466, 466, 466, 3, 15, 4, 6, 384);
INSERT INTO `scores` VALUES (776, '边防军人子女预科班', 370, 370, 370, 3, 15, 4, 6, 384);
INSERT INTO `scores` VALUES (777, '翻译', 530, 530, 530, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (778, '应用心理学', 523, 523, 523, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (779, '土木工程', 511, 511, 511, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (780, '道路桥梁与渡河工程', 524, 516, 520, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (781, '化学工程与工业生物工程', 520, 518, 519, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (782, '风景园林', 521, 521, 521, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (783, '市场营销', 520, 520, 520, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (784, '人力资源管理', 523, 523, 523, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (785, '跨境电子商务', 518, 518, 518, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (786, '酒店管理', 511, 511, 511, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (787, '旅游管理与服务教育', 565, 565, 565, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (788, '翻译', 543, 543, 543, 3, 16, 4, 6, 477);
INSERT INTO `scores` VALUES (789, '应用心理学', 544, 544, 544, 3, 16, 4, 6, 477);
INSERT INTO `scores` VALUES (790, '风景园林', 550, 550, 550, 3, 16, 4, 6, 477);
INSERT INTO `scores` VALUES (791, '市场营销', 539, 539, 539, 3, 16, 4, 6, 477);
INSERT INTO `scores` VALUES (792, '人力资源管理', 551, 551, 551, 3, 16, 4, 6, 477);
INSERT INTO `scores` VALUES (793, '跨境电子商务', 546, 546, 546, 3, 16, 4, 6, 477);
INSERT INTO `scores` VALUES (794, '酒店管理', 541, 541, 541, 3, 16, 4, 6, 477);
INSERT INTO `scores` VALUES (795, '旅游管理与服务教育', 533, 533, 533, 3, 16, 4, 6, 477);
INSERT INTO `scores` VALUES (796, '边防军人子女预科班', 474, 474, 474, 3, 16, 4, 6, 477);
INSERT INTO `scores` VALUES (797, '机械工程', 499, 477, 482, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (798, '汽车服务工程', 482, 462, 469, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (799, '计算机科学与技术（大数据方向）', 508, 487, 493, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (800, '计算机科学与技术（智能移动端开发方向）', 510, 482, 486, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (801, '网络工程（网络安全方向）', 496, 475, 480, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (802, '网络工程（网络设计与运维方向）', 484, 471, 476, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (803, '土木工程', 474, 462, 467, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (804, '给排水科学与工程', 478, 461, 466, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (805, '财务管理', 500, 498, 499, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (806, '审计学', 515, 501, 505, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (807, '物流工程', 488, 474, 479, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (808, '投资学', 497, 487, 492, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (809, '翻译', 496, 483, 488, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (810, '数学与应用数学', 496, 461, 468, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (811, '新能源材料与器件', 494, 464, 471, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (812, '电气工程与智能控制', 502, 483, 488, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (813, '智能测控工程', 489, 465, 471, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (814, '物联网工程', 500, 472, 476, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (815, '智能科学与技术', 485, 466, 472, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (816, '建筑环境与能源应用工程', 477, 462, 466, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (817, '道路桥梁与渡河工程', 472, 462, 464, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (818, '化学工程与工业生物工程', 481, 462, 465, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (819, '建筑学', 502, 481, 487, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (820, '风景园林', 483, 481, 482, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (821, '园林', 471, 465, 468, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (822, '市场营销', 490, 485, 488, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (823, '会计学', 508, 506, 507, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (824, '人力资源管理', 496, 491, 494, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (825, '会展经济与管理', 497, 488, 493, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (826, '学前教育', 488, 485, 487, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (827, '应用心理学', 489, 486, 488, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (828, '数据计算及应用', 551, 462, 474, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (829, '智能制造工程', 493, 472, 477, 3, 3, 3, 6, 419);
INSERT INTO `scores` VALUES (830, '汉语言文学', 539, 504, 515, 3, 3, 4, 6, 443);
INSERT INTO `scores` VALUES (831, '财务管理', 540, 500, 511, 3, 3, 4, 6, 443);
INSERT INTO `scores` VALUES (832, '审计学', 541, 505, 520, 3, 3, 4, 6, 443);
INSERT INTO `scores` VALUES (833, '酒店管理', 516, 494, 503, 3, 3, 4, 6, 443);
INSERT INTO `scores` VALUES (834, '投资学', 519, 491, 496, 3, 3, 4, 6, 443);
INSERT INTO `scores` VALUES (835, '秘书学', 510, 499, 502, 3, 3, 4, 6, 443);
INSERT INTO `scores` VALUES (836, '翻译', 525, 489, 495, 3, 3, 4, 6, 443);
INSERT INTO `scores` VALUES (837, '市场营销', 501, 489, 494, 3, 3, 4, 6, 443);
INSERT INTO `scores` VALUES (838, '会计学', 556, 522, 531, 3, 3, 4, 6, 443);
INSERT INTO `scores` VALUES (839, '人力资源管理', 509, 490, 496, 3, 3, 4, 6, 443);
INSERT INTO `scores` VALUES (840, '风景园林', 513, 489, 493, 3, 3, 4, 6, 443);
INSERT INTO `scores` VALUES (841, '跨境电子商务', 512, 489, 495, 3, 3, 4, 6, 443);
INSERT INTO `scores` VALUES (842, '会展经济与管理', 503, 489, 492, 3, 3, 4, 6, 443);
INSERT INTO `scores` VALUES (843, '旅游管理与服务教育', 500, 490, 494, 3, 3, 4, 6, 443);
INSERT INTO `scores` VALUES (844, '学前教育', 503, 489, 494, 3, 3, 4, 6, 443);
INSERT INTO `scores` VALUES (845, '应用心理学', 512, 489, 495, 3, 3, 4, 6, 443);
INSERT INTO `scores` VALUES (846, '酒店管理', 492, 492, 492, 3, 4, 3, 6, 461);
INSERT INTO `scores` VALUES (847, '会展经济与管理', 491, 491, 491, 3, 4, 3, 6, 461);
INSERT INTO `scores` VALUES (848, '人力资源管理', 495, 495, 495, 3, 4, 3, 6, 461);
INSERT INTO `scores` VALUES (849, '市场营销', 496, 496, 496, 3, 4, 3, 6, 461);
INSERT INTO `scores` VALUES (850, '跨境电子商务', 491, 491, 491, 3, 4, 3, 6, 461);
INSERT INTO `scores` VALUES (851, '翻译', 492, 492, 492, 3, 4, 3, 6, 461);
INSERT INTO `scores` VALUES (852, '应用心理学', 491, 491, 491, 3, 4, 3, 6, 461);
INSERT INTO `scores` VALUES (853, '旅游管理与服务教育', 492, 492, 492, 3, 4, 3, 6, 461);
INSERT INTO `scores` VALUES (854, '建筑学', 497, 492, 494, 3, 4, 3, 6, 461);
INSERT INTO `scores` VALUES (855, '物流工程', 506, 495, 500, 3, 4, 3, 6, 461);
INSERT INTO `scores` VALUES (856, '给排水科学与工程', 496, 494, 495, 3, 4, 3, 6, 461);
INSERT INTO `scores` VALUES (857, '建筑环境与能源应用工程', 501, 493, 496, 3, 4, 3, 6, 461);
INSERT INTO `scores` VALUES (858, '化学工程与工业生物工程', 503, 497, 499, 3, 4, 3, 6, 461);
INSERT INTO `scores` VALUES (859, '道路桥梁与渡河工程', 495, 493, 494, 3, 4, 3, 6, 461);
INSERT INTO `scores` VALUES (860, '汽车服务工程', 498, 494, 496, 3, 4, 3, 6, 461);
INSERT INTO `scores` VALUES (861, '园林', 493, 492, 492, 3, 4, 3, 6, 461);
INSERT INTO `scores` VALUES (862, '边防军人子女预科班', 402, 402, 402, 3, 4, 3, 6, 461);
INSERT INTO `scores` VALUES (863, '酒店管理', 505, 505, 505, 3, 4, 4, 6, 477);
INSERT INTO `scores` VALUES (864, '会展经济与管理', 504, 504, 504, 3, 4, 4, 6, 477);
INSERT INTO `scores` VALUES (865, '人力资源管理', 507, 507, 507, 3, 4, 4, 6, 477);
INSERT INTO `scores` VALUES (866, '市场营销', 505, 505, 505, 3, 4, 4, 6, 477);
INSERT INTO `scores` VALUES (867, '跨境电子商务', 506, 506, 506, 3, 4, 4, 6, 477);
INSERT INTO `scores` VALUES (868, '翻译', 504, 504, 504, 3, 4, 4, 6, 477);
INSERT INTO `scores` VALUES (869, '应用心理学', 510, 510, 510, 3, 4, 4, 6, 477);
INSERT INTO `scores` VALUES (870, '旅游管理与服务教育', 504, 504, 504, 3, 4, 4, 6, 477);
INSERT INTO `scores` VALUES (871, '汽车服务工程', 493, 491, 492, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (872, '土木工程', 489, 489, 489, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (873, '建筑环境与能源应用工程', 497, 486, 490, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (874, '给排水科学与工程', 498, 486, 492, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (875, '道路桥梁与渡河工程', 499, 484, 490, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (876, '化学工程与工业生物工程', 496, 488, 491, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (877, '园林', 483, 483, 483, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (878, '翻译', 490, 490, 490, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (879, '应用心理学', 495, 495, 495, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (880, '建筑学', 492, 490, 491, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (881, '物流工程', 498, 488, 491, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (882, '酒店管理', 488, 488, 488, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (883, '旅游管理与服务教育', 489, 489, 489, 3, 5, 3, 6, 441);
INSERT INTO `scores` VALUES (884, '翻译', 488, 488, 488, 3, 5, 4, 6, 450);
INSERT INTO `scores` VALUES (885, '应用心理学', 488, 488, 488, 3, 5, 4, 6, 450);
INSERT INTO `scores` VALUES (886, '酒店管理', 520, 520, 520, 3, 5, 4, 6, 450);
INSERT INTO `scores` VALUES (887, '旅游管理与服务教育', 487, 487, 487, 3, 5, 4, 6, 450);
INSERT INTO `scores` VALUES (888, '酒店管理', 431, 431, 431, 3, 7, 3, 6, 374);
INSERT INTO `scores` VALUES (889, '人力资源管理', 427, 427, 427, 3, 7, 3, 6, 374);
INSERT INTO `scores` VALUES (890, '物流工程', 449, 444, 447, 3, 7, 3, 6, 374);
INSERT INTO `scores` VALUES (891, '道路桥梁与渡河工程', 442, 436, 439, 3, 7, 3, 6, 374);
INSERT INTO `scores` VALUES (892, '给排水科学与工程', 446, 442, 444, 3, 7, 3, 6, 374);
INSERT INTO `scores` VALUES (893, '建筑环境与能源应用工程', 448, 445, 447, 3, 7, 3, 6, 374);
INSERT INTO `scores` VALUES (894, '化学工程与工业生物工程', 458, 438, 446, 3, 7, 3, 6, 374);
INSERT INTO `scores` VALUES (895, '汽车服务工程', 455, 448, 452, 3, 7, 3, 6, 374);
INSERT INTO `scores` VALUES (896, '土木工程', 448, 445, 447, 3, 7, 3, 6, 374);
INSERT INTO `scores` VALUES (897, '园林', 426, 426, 426, 3, 7, 3, 6, 374);
INSERT INTO `scores` VALUES (898, '边防军人子女预科班', 405, 340, 375, 3, 7, 3, 6, 374);
INSERT INTO `scores` VALUES (899, '风景园林', 458, 458, 458, 3, 7, 4, 6, 412);
INSERT INTO `scores` VALUES (900, '酒店管理', 456, 456, 456, 3, 7, 4, 6, 412);
INSERT INTO `scores` VALUES (901, '人力资源管理', 456, 456, 456, 3, 7, 4, 6, 412);
INSERT INTO `scores` VALUES (902, '边防军人子女预科班', 426, 426, 426, 3, 7, 4, 6, 412);
INSERT INTO `scores` VALUES (903, '物流工程', 494, 493, 494, 3, 8, 3, 6, 436);
INSERT INTO `scores` VALUES (904, '酒店管理', 493, 493, 493, 3, 8, 3, 6, 436);
INSERT INTO `scores` VALUES (905, '建筑环境与能源应用工程', 495, 495, 495, 3, 8, 3, 6, 436);
INSERT INTO `scores` VALUES (906, '给排水科学与工程', 502, 502, 502, 3, 8, 3, 6, 436);
INSERT INTO `scores` VALUES (907, '化学工程与工业生物工程', 502, 502, 502, 3, 8, 3, 6, 436);
INSERT INTO `scores` VALUES (908, '园林', 492, 492, 492, 3, 8, 3, 6, 436);
INSERT INTO `scores` VALUES (909, '边防军人子女预科班', 480, 443, 456, 3, 8, 3, 6, 436);
INSERT INTO `scores` VALUES (910, '酒店管理', 519, 519, 519, 3, 8, 4, 6, 464);
INSERT INTO `scores` VALUES (911, '边防军人子女预科班', 505, 448, 477, 3, 8, 4, 6, 464);
INSERT INTO `scores` VALUES (912, '汽车服务工程', 434, 426, 430, 3, 9, 3, 6, 370);
INSERT INTO `scores` VALUES (913, '给排水科学与工程', 458, 430, 444, 3, 9, 3, 6, 370);
INSERT INTO `scores` VALUES (914, '道路桥梁与渡河工程', 428, 425, 427, 3, 9, 3, 6, 370);
INSERT INTO `scores` VALUES (915, '化学工程与工业生物工程', 432, 430, 431, 3, 9, 3, 6, 370);
INSERT INTO `scores` VALUES (916, '物流工程', 429, 426, 428, 3, 9, 3, 6, 370);
INSERT INTO `scores` VALUES (917, '园林', 421, 421, 421, 3, 9, 3, 6, 370);
INSERT INTO `scores` VALUES (918, '人力资源管理', 425, 425, 425, 3, 9, 3, 6, 370);
INSERT INTO `scores` VALUES (919, '旅游管理与服务教育', 430, 430, 430, 3, 9, 3, 6, 370);
INSERT INTO `scores` VALUES (920, '人力资源管理', 449, 449, 449, 3, 9, 4, 6, 467);
INSERT INTO `scores` VALUES (921, '旅游管理与服务教育', 449, 449, 449, 3, 9, 4, 6, 467);
INSERT INTO `scores` VALUES (922, '市场营销', 459, 459, 459, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (923, '物流工程', 462, 452, 455, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (924, '酒店管理', 442, 442, 442, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (925, '跨境电子商务', 447, 447, 447, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (926, '旅游管理与服务教育', 444, 444, 444, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (927, '建筑学', 450, 450, 450, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (928, '给排水科学与工程', 450, 448, 449, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (929, '道路桥梁与渡河工程', 447, 445, 446, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (930, '汽车服务工程', 458, 453, 455, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (931, '化学工程与工业生物工程', 450, 445, 447, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (932, '建筑环境与能源应用工程', 448, 445, 446, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (933, '园林', 450, 449, 450, 3, 10, 3, 6, 387);
INSERT INTO `scores` VALUES (934, '市场营销', 516, 516, 516, 3, 10, 4, 6, 458);
INSERT INTO `scores` VALUES (935, '酒店管理', 502, 502, 502, 3, 10, 4, 6, 458);
INSERT INTO `scores` VALUES (936, '跨境电子商务', 499, 499, 499, 3, 10, 4, 6, 458);
INSERT INTO `scores` VALUES (937, '旅游管理与服务教育', 499, 499, 499, 3, 10, 4, 6, 458);
INSERT INTO `scores` VALUES (938, '酒店管理', 561, 559, 460, 3, 11, 3, 6, 483);
INSERT INTO `scores` VALUES (939, '旅游管理与服务教育', 558, 557, 558, 3, 11, 3, 6, 483);
INSERT INTO `scores` VALUES (940, '风景园林', 559, 558, 559, 3, 11, 3, 6, 483);
INSERT INTO `scores` VALUES (941, '物流工程', 559, 552, 555, 3, 11, 3, 6, 483);
INSERT INTO `scores` VALUES (942, '道路桥梁与渡河工程', 523, 520, 522, 3, 11, 3, 6, 483);
INSERT INTO `scores` VALUES (943, '汽车服务工程', 520, 520, 520, 3, 11, 3, 6, 483);
INSERT INTO `scores` VALUES (944, '化学工程与工业生物工程', 522, 520, 521, 3, 11, 3, 6, 483);
INSERT INTO `scores` VALUES (945, '建筑环境与能源应用工程', 522, 520, 521, 3, 11, 3, 6, 483);
INSERT INTO `scores` VALUES (946, '园林', 558, 557, 558, 3, 11, 3, 6, 483);
INSERT INTO `scores` VALUES (947, '边防军人子女预科班', 442, 442, 442, 3, 11, 3, 6, 483);
INSERT INTO `scores` VALUES (948, '建筑学', 419, 419, 419, 3, 12, 3, 6, 360);
INSERT INTO `scores` VALUES (949, '物流工程', 420, 418, 419, 3, 12, 3, 6, 360);
INSERT INTO `scores` VALUES (950, '汽车服务工程', 417, 412, 415, 3, 12, 3, 6, 360);
INSERT INTO `scores` VALUES (951, '给排水科学与工程', 414, 412, 413, 3, 12, 3, 6, 360);
INSERT INTO `scores` VALUES (952, '道路桥梁与渡河工程', 411, 411, 411, 3, 12, 3, 6, 360);
INSERT INTO `scores` VALUES (953, '化学工程与工业生物工程', 412, 412, 412, 3, 12, 3, 6, 360);
INSERT INTO `scores` VALUES (954, '边防军人子女预科班', 370, 370, 370, 3, 12, 3, 6, 360);
INSERT INTO `scores` VALUES (955, '边防军人子女预科班', 404, 404, 404, 3, 12, 4, 6, 405);
INSERT INTO `scores` VALUES (956, '建筑学', 474, 474, 474, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (957, '风景园林', 479, 475, 477, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (958, '跨境电子商务', 489, 489, 489, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (959, '酒店管理', 474, 474, 474, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (960, '旅游管理与服务教育', 477, 477, 477, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (961, '物流工程', 488, 488, 488, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (962, '汽车服务工程', 481, 479, 480, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (963, '给排水科学与工程', 477, 477, 477, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (964, '道路桥梁与渡河工程', 479, 478, 479, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (965, '化学工程与工业生物工程', 477, 477, 477, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (966, '园林', 491, 483, 487, 3, 13, 3, 6, 426);
INSERT INTO `scores` VALUES (967, '跨境电子商务', 513, 513, 513, 3, 13, 4, 6, 442);
INSERT INTO `scores` VALUES (968, '酒店管理', 510, 510, 510, 3, 13, 4, 6, 442);
INSERT INTO `scores` VALUES (969, '旅游管理与服务教育', 510, 510, 510, 3, 13, 4, 6, 442);
INSERT INTO `scores` VALUES (970, '边防军人子女预科班', 428, 406, 417, 3, 13, 4, 6, 442);
INSERT INTO `scores` VALUES (971, '风景园林', 468, 468, 468, 3, 14, 3, 6, 405);
INSERT INTO `scores` VALUES (972, '物流工程', 465, 465, 465, 3, 14, 3, 6, 405);
INSERT INTO `scores` VALUES (973, '汽车服务工程', 453, 453, 453, 3, 14, 3, 6, 405);
INSERT INTO `scores` VALUES (974, '建筑环境与能源应用工程', 452, 449, 451, 3, 14, 3, 6, 405);
INSERT INTO `scores` VALUES (975, '道路桥梁与渡河工程', 449, 448, 449, 3, 14, 3, 6, 405);
INSERT INTO `scores` VALUES (976, '化学工程与工业生物工程', 463, 458, 461, 3, 14, 3, 6, 405);
INSERT INTO `scores` VALUES (977, '边防军人子女预科班', 360, 360, 360, 3, 14, 3, 6, 405);
INSERT INTO `scores` VALUES (978, '风景园林', 489, 489, 489, 3, 14, 4, 6, 446);
INSERT INTO `scores` VALUES (979, '边防军人子女预科班', 428, 428, 428, 3, 14, 4, 6, 446);
INSERT INTO `scores` VALUES (980, '建筑学', 416, 416, 416, 3, 15, 3, 6, 340);
INSERT INTO `scores` VALUES (981, '酒店管理', 413, 413, 413, 3, 15, 3, 6, 340);
INSERT INTO `scores` VALUES (982, '物流管理', 432, 423, 428, 3, 15, 3, 6, 340);
INSERT INTO `scores` VALUES (983, '边防军人子女预科班', 368, 316, 350, 3, 15, 3, 6, 340);
INSERT INTO `scores` VALUES (984, '汽车服务工程', 429, 424, 427, 3, 15, 3, 6, 340);
INSERT INTO `scores` VALUES (985, '建筑环境与能源应用工程', 411, 411, 411, 3, 15, 3, 6, 340);
INSERT INTO `scores` VALUES (986, '给排水科学与工程', 413, 411, 412, 3, 15, 3, 6, 340);
INSERT INTO `scores` VALUES (987, '道路桥梁与渡河工程', 422, 411, 415, 3, 15, 3, 6, 340);
INSERT INTO `scores` VALUES (988, '化学工程与工业生物工程', 421, 415, 418, 3, 15, 3, 6, 340);
INSERT INTO `scores` VALUES (989, '园林', 425, 408, 417, 3, 15, 3, 6, 340);
INSERT INTO `scores` VALUES (990, '酒店管理', 466, 466, 466, 3, 15, 4, 6, 384);
INSERT INTO `scores` VALUES (991, '边防军人子女预科班', 370, 370, 370, 3, 15, 4, 6, 384);
INSERT INTO `scores` VALUES (992, '翻译', 530, 530, 530, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (993, '应用心理学', 523, 523, 523, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (994, '汽车服务工程', 525, 523, 524, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (995, '土木工程', 511, 511, 511, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (996, '建筑环境与能源应用工程', 521, 515, 517, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (997, '给排水科学与工程', 517, 516, 517, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (998, '道路桥梁与渡河工程', 524, 516, 520, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (999, '化学工程与工业生物工程', 520, 518, 519, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (1000, '建筑学', 517, 516, 517, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (1001, '风景园林', 521, 521, 521, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (1002, '园林', 516, 511, 514, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (1003, '市场营销', 520, 520, 520, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (1004, '人力资源管理', 523, 523, 523, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (1005, '物流工程', 523, 522, 523, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (1006, '跨境电子商务', 518, 518, 518, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (1007, '酒店管理', 511, 511, 511, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (1008, '旅游管理与服务教育', 565, 565, 565, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (1009, '边防军人子女预科班', 464, 459, 462, 3, 16, 3, 6, 459);
INSERT INTO `scores` VALUES (1010, '翻译', 543, 543, 543, 3, 16, 4, 6, 477);
INSERT INTO `scores` VALUES (1011, '应用心理学', 544, 544, 544, 3, 16, 4, 6, 477);
INSERT INTO `scores` VALUES (1012, '风景园林', 550, 550, 550, 3, 16, 4, 6, 477);
INSERT INTO `scores` VALUES (1013, '市场营销', 539, 539, 539, 3, 16, 4, 6, 477);
INSERT INTO `scores` VALUES (1014, '人力资源管理', 551, 551, 551, 3, 16, 4, 6, 477);
INSERT INTO `scores` VALUES (1015, '跨境电子商务', 546, 546, 546, 3, 16, 4, 6, 477);
INSERT INTO `scores` VALUES (1016, '酒店管理', 541, 541, 541, 3, 16, 4, 6, 477);
INSERT INTO `scores` VALUES (1017, '旅游管理与服务教育', 533, 533, 533, 3, 16, 4, 6, 477);
INSERT INTO `scores` VALUES (1018, '边防军人子女预科班', 474, 474, 474, 3, 16, 4, 6, 477);
INSERT INTO `scores` VALUES (1019, '应用心理学', 479, 479, 479, 3, 17, 3, 6, 429);
INSERT INTO `scores` VALUES (1020, '建筑学（五年）', 479, 473, 476, 3, 17, 3, 6, 429);
INSERT INTO `scores` VALUES (1021, '跨境电子商务', 474, 474, 474, 3, 17, 3, 6, 429);
INSERT INTO `scores` VALUES (1022, '酒店管理', 474, 474, 474, 3, 17, 3, 6, 429);
INSERT INTO `scores` VALUES (1023, '旅游管理与服务教育', 482, 482, 482, 3, 17, 3, 6, 429);
INSERT INTO `scores` VALUES (1024, '物流工程', 485, 474, 478, 3, 17, 3, 6, 429);
INSERT INTO `scores` VALUES (1025, '汽车服务工程', 475, 474, 474, 3, 17, 3, 6, 429);
INSERT INTO `scores` VALUES (1026, '建筑环境与能源应用工程', 483, 473, 478, 3, 17, 3, 6, 429);
INSERT INTO `scores` VALUES (1027, '给排水科学与工程', 475, 473, 474, 3, 17, 3, 6, 429);
INSERT INTO `scores` VALUES (1028, '道路桥梁与渡河工程', 479, 473, 475, 3, 17, 3, 6, 429);
INSERT INTO `scores` VALUES (1029, '化学工程与工业生物工程', 475, 472, 473, 3, 17, 3, 6, 429);
INSERT INTO `scores` VALUES (1030, '园林', 470, 469, 469, 3, 17, 3, 6, 429);
INSERT INTO `scores` VALUES (1031, '边防军人子女预科班', 418, 418, 418, 3, 17, 3, 6, 429);
INSERT INTO `scores` VALUES (1032, '应用心理学', 519, 519, 519, 3, 17, 4, 6, 486);
INSERT INTO `scores` VALUES (1033, '跨境电子商务', 519, 519, 519, 3, 17, 4, 6, 486);
INSERT INTO `scores` VALUES (1034, '酒店管理', 518, 518, 518, 3, 17, 4, 6, 486);
INSERT INTO `scores` VALUES (1035, '旅游管理与服务教育', 519, 519, 519, 3, 17, 4, 6, 486);
INSERT INTO `scores` VALUES (1036, '汽车服务工程', 467, 467, 467, 3, 18, 3, 6, 367);
INSERT INTO `scores` VALUES (1037, '建筑环境与能源应用工程', 467, 464, 466, 3, 18, 3, 6, 367);
INSERT INTO `scores` VALUES (1038, '给排水科学与工程', 469, 468, 469, 3, 18, 3, 6, 367);
INSERT INTO `scores` VALUES (1039, '道路桥梁与渡河工程', 467, 467, 467, 3, 18, 3, 6, 367);
INSERT INTO `scores` VALUES (1040, '化学工程与工业生物工程', 471, 470, 471, 3, 18, 3, 6, 367);
INSERT INTO `scores` VALUES (1041, '建筑学', 460, 460, 460, 3, 18, 3, 6, 367);
INSERT INTO `scores` VALUES (1042, '风景园林', 466, 466, 466, 3, 18, 3, 6, 367);
INSERT INTO `scores` VALUES (1043, '园林', 467, 466, 467, 3, 18, 3, 6, 367);
INSERT INTO `scores` VALUES (1044, '物流工程', 474, 471, 473, 3, 18, 3, 6, 367);
INSERT INTO `scores` VALUES (1045, '酒店管理', 465, 465, 465, 3, 18, 3, 6, 367);
INSERT INTO `scores` VALUES (1046, '旅游管理与服务教育', 464, 464, 464, 3, 18, 3, 6, 367);
INSERT INTO `scores` VALUES (1047, '边防军人子女预科班', 450, 385, 417, 3, 18, 3, 6, 367);
INSERT INTO `scores` VALUES (1048, '风景园林', 494, 494, 494, 3, 18, 4, 6, 437);
INSERT INTO `scores` VALUES (1049, '酒店管理', 482, 482, 482, 3, 18, 4, 6, 437);
INSERT INTO `scores` VALUES (1050, '旅游管理与服务教育', 486, 486, 486, 3, 18, 4, 6, 437);
INSERT INTO `scores` VALUES (1051, '边防军人子女预科班', 433, 429, 431, 3, 18, 4, 6, 437);
INSERT INTO `scores` VALUES (1052, '汽车服务工程', 395, 395, 437, 3, 19, 3, 6, 375);
INSERT INTO `scores` VALUES (1053, '建筑环境与能源应用工程', 407, 407, 438, 3, 19, 3, 6, 375);
INSERT INTO `scores` VALUES (1054, '给排水科学与工程', 440, 428, 430, 3, 19, 3, 6, 375);
INSERT INTO `scores` VALUES (1055, '道路桥梁与渡河工程', 413, 398, 432, 3, 19, 3, 6, 375);
INSERT INTO `scores` VALUES (1056, '化学工程与工业生物工程', 431, 413, 435, 3, 19, 3, 6, 375);
INSERT INTO `scores` VALUES (1057, '风景园林', 442, 433, 428, 3, 19, 3, 6, 375);
INSERT INTO `scores` VALUES (1058, '跨境电子商务', 415, 398, 427, 3, 19, 3, 6, 375);
INSERT INTO `scores` VALUES (1059, '酒店管理', 391, 388, 423, 3, 19, 3, 6, 375);
INSERT INTO `scores` VALUES (1060, '旅游管理与服务教育', 411, 381, 423, 3, 19, 3, 6, 375);
INSERT INTO `scores` VALUES (1061, '园林', 417, 387, 437, 3, 19, 3, 6, 375);
INSERT INTO `scores` VALUES (1062, '物流工程', 396, 396, 444, 3, 19, 3, 6, 375);
INSERT INTO `scores` VALUES (1063, '人力资源管理', 403, 395, 458, 3, 19, 3, 6, 375);
INSERT INTO `scores` VALUES (1064, '边防军人子女预科班', 387, 387, 393, 3, 19, 3, 6, 375);
INSERT INTO `scores` VALUES (1065, '风景园林', 477, 477, 477, 3, 19, 4, 6, 418);
INSERT INTO `scores` VALUES (1066, '人力资源管理', 481, 481, 481, 3, 19, 4, 6, 418);
INSERT INTO `scores` VALUES (1067, '跨境电子商务', 480, 480, 480, 3, 19, 4, 6, 418);
INSERT INTO `scores` VALUES (1068, '酒店管理', 478, 478, 478, 3, 19, 4, 6, 418);
INSERT INTO `scores` VALUES (1069, '旅游管理与服务教育', 502, 502, 502, 3, 19, 4, 6, 418);
INSERT INTO `scores` VALUES (1070, '边防军人子女预科班', 417, 417, 417, 3, 19, 4, 6, 418);
INSERT INTO `scores` VALUES (1071, '酒店管理', 420, 420, 420, 3, 20, 3, 6, 372);
INSERT INTO `scores` VALUES (1072, '旅游管理与服务教育', 426, 426, 426, 3, 20, 3, 6, 372);
INSERT INTO `scores` VALUES (1073, '跨境电子商务', 421, 421, 421, 3, 20, 3, 6, 372);
INSERT INTO `scores` VALUES (1074, '风景园林', 422, 422, 422, 3, 20, 3, 6, 372);
INSERT INTO `scores` VALUES (1075, '会展经济与管理', 421, 421, 421, 3, 20, 3, 6, 372);
INSERT INTO `scores` VALUES (1076, '物流工程', 431, 424, 427, 3, 20, 3, 6, 372);
INSERT INTO `scores` VALUES (1077, '给排水科学与工程', 431, 426, 428, 3, 20, 3, 6, 372);
INSERT INTO `scores` VALUES (1078, '化学工程与工业生物工程', 432, 428, 430, 3, 20, 3, 6, 372);
INSERT INTO `scores` VALUES (1079, '道路桥梁与渡河工程', 426, 426, 426, 3, 20, 3, 6, 372);
INSERT INTO `scores` VALUES (1080, '建筑环境与能源应用工程', 429, 425, 427, 3, 20, 3, 6, 372);
INSERT INTO `scores` VALUES (1081, '汽车服务工程', 426, 426, 426, 3, 20, 3, 6, 372);
INSERT INTO `scores` VALUES (1082, '园林', 423, 423, 423, 3, 20, 3, 6, 372);
INSERT INTO `scores` VALUES (1083, '边防军人子女预科班', 395, 395, 395, 3, 20, 3, 6, 372);
INSERT INTO `scores` VALUES (1084, '酒店管理', 456, 456, 456, 3, 20, 4, 6, 404);
INSERT INTO `scores` VALUES (1085, '风景园林', 455, 455, 455, 3, 20, 4, 6, 404);
INSERT INTO `scores` VALUES (1086, '跨境电子商务', 455, 455, 455, 3, 20, 4, 6, 404);
INSERT INTO `scores` VALUES (1087, '旅游管理与服务教育', 455, 455, 455, 3, 20, 4, 6, 404);
INSERT INTO `scores` VALUES (1088, '会展经济与管理', 454, 454, 454, 3, 20, 4, 6, 404);
INSERT INTO `scores` VALUES (1089, '物流工程', 374, 374, 374, 3, 21, 3, 6, 350);
INSERT INTO `scores` VALUES (1090, '酒店管理', 364, 364, 364, 3, 21, 3, 6, 350);
INSERT INTO `scores` VALUES (1091, '跨境电子商务', 379, 379, 379, 3, 21, 3, 6, 350);
INSERT INTO `scores` VALUES (1092, '旅游管理与服务教育', 378, 378, 378, 3, 21, 3, 6, 350);
INSERT INTO `scores` VALUES (1093, '给排水科学与工程', 388, 381, 385, 3, 21, 3, 6, 350);
INSERT INTO `scores` VALUES (1094, '道路桥梁与渡河工程', 377, 376, 376, 3, 21, 3, 6, 350);
INSERT INTO `scores` VALUES (1095, '汽车服务工程', 384, 383, 384, 3, 21, 3, 6, 350);
INSERT INTO `scores` VALUES (1096, '化学工程与工业生物工程', 422, 381, 402, 3, 21, 3, 6, 350);
INSERT INTO `scores` VALUES (1097, '建筑环境与能源应用工程', 382, 379, 381, 3, 21, 3, 6, 350);
INSERT INTO `scores` VALUES (1098, '园林', 373, 371, 372, 3, 21, 3, 6, 350);
INSERT INTO `scores` VALUES (1099, '边防军人子女预科班', 390, 390, 390, 3, 21, 3, 6, 350);
INSERT INTO `scores` VALUES (1100, '酒店管理', 429, 429, 429, 3, 21, 4, 6, 405);
INSERT INTO `scores` VALUES (1101, '跨境电子商务', 435, 435, 435, 3, 21, 4, 6, 405);
INSERT INTO `scores` VALUES (1102, '旅游管理与服务教育', 435, 435, 435, 3, 21, 4, 6, 405);
INSERT INTO `scores` VALUES (1103, '边防军人子女预科班', 355, 355, 355, 3, 21, 4, 6, 405);
INSERT INTO `scores` VALUES (1104, '翻译', 508, 506, 507, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (1105, '汽车服务工程', 477, 475, 476, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (1106, '土木工程', 486, 466, 475, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (1107, '建筑环境与能源应用工程', 477, 474, 475, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (1108, '给排水科学与工程', 474, 472, 473, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (1109, '道路桥梁与渡河工程', 475, 473, 474, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (1110, '化学工程与工业生物工程', 509, 474, 486, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (1111, '建筑学', 506, 504, 505, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (1112, '风景园林', 506, 505, 506, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (1113, '园林', 506, 505, 506, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (1114, '市场营销', 509, 506, 508, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (1115, '人力资源管理', 515, 508, 510, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (1116, '物流工程', 492, 483, 488, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (1117, '跨境电子商务', 508, 506, 507, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (1118, '酒店管理', 505, 505, 505, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (1119, '旅游管理与服务教育', 503, 503, 503, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (1120, '边防军人子女预科班', 464, 446, 463, 3, 22, 3, 6, 444);
INSERT INTO `scores` VALUES (1121, '汽车服务工程', 464, 464, 464, 3, 23, 3, 6, 394);
INSERT INTO `scores` VALUES (1122, '建筑环境与能源应用工程', 462, 461, 461, 3, 23, 3, 6, 394);
INSERT INTO `scores` VALUES (1123, '给排水科学与工程', 468, 462, 465, 3, 23, 3, 6, 394);
INSERT INTO `scores` VALUES (1124, '道路桥梁与渡河工程', 464, 463, 464, 3, 23, 3, 6, 394);
INSERT INTO `scores` VALUES (1125, '化学工程与工业生物工程', 464, 462, 463, 3, 23, 3, 6, 394);
INSERT INTO `scores` VALUES (1126, '风景园林', 455, 455, 455, 3, 23, 3, 6, 394);
INSERT INTO `scores` VALUES (1127, '旅游管理与服务教育', 460, 460, 460, 3, 23, 3, 6, 394);
INSERT INTO `scores` VALUES (1128, '园林', 453, 452, 453, 3, 23, 3, 6, 394);
INSERT INTO `scores` VALUES (1129, '物流工程', 468, 463, 466, 3, 23, 3, 6, 394);
INSERT INTO `scores` VALUES (1130, '边防军人子女预科班', 448, 402, 418, 3, 23, 3, 6, 394);
INSERT INTO `scores` VALUES (1131, '风景园林', 478, 478, 478, 3, 23, 4, 6, 414);
INSERT INTO `scores` VALUES (1132, '旅游管理与服务教育', 478, 478, 478, 3, 23, 4, 6, 414);
INSERT INTO `scores` VALUES (1133, '边防军人子女预科班', 421, 412, 417, 3, 23, 4, 6, 414);
INSERT INTO `scores` VALUES (1134, '建筑环境与能源应用工程', 513, 510, 512, 3, 24, 3, 6, 475);
INSERT INTO `scores` VALUES (1135, '给排水科学与工程', 509, 508, 509, 3, 24, 3, 6, 475);
INSERT INTO `scores` VALUES (1136, '化学工程与工业生物工程', 507, 506, 506, 3, 24, 3, 6, 475);
INSERT INTO `scores` VALUES (1137, '道路桥梁与渡河工程', 506, 506, 506, 3, 24, 3, 6, 475);
INSERT INTO `scores` VALUES (1138, '酒店管理', 519, 519, 519, 3, 24, 3, 6, 475);
INSERT INTO `scores` VALUES (1139, '风景园林', 519, 519, 519, 3, 24, 3, 6, 475);
INSERT INTO `scores` VALUES (1140, '建筑学', 519, 519, 519, 3, 24, 3, 6, 475);
INSERT INTO `scores` VALUES (1141, '人力资源管理', 517, 516, 517, 3, 24, 3, 6, 475);
INSERT INTO `scores` VALUES (1142, '园林', 516, 515, 516, 3, 24, 3, 6, 475);
INSERT INTO `scores` VALUES (1143, '物流工程', 518, 516, 517, 3, 24, 3, 6, 475);
INSERT INTO `scores` VALUES (1144, '边防军人子女预科班', 472, 417, 472, 3, 24, 3, 6, 475);
INSERT INTO `scores` VALUES (1145, '风景园林', 486, 486, 486, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (1146, '市场营销', 500, 500, 500, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (1147, '翻译', 487, 487, 487, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (1148, '跨境电子商务', 493, 493, 493, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (1149, '酒店管理', 487, 487, 487, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (1150, '汽车服务工程', 496, 495, 496, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (1151, '建筑环境与能源应用工程', 491, 490, 491, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (1152, '给排水科学与工程', 494, 490, 492, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (1153, '道路桥梁与渡河工程', 497, 494, 496, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (1154, '化学工程与工业生物工程', 510, 493, 502, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (1155, '建筑学', 508, 489, 499, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (1156, '园林', 487, 485, 486, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (1157, '物流工程', 499, 494, 496, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (1158, '人力资源管理', 487, 487, 487, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (1159, '边防军人子女预科班', 431, 431, 431, 3, 25, 3, 6, 425);
INSERT INTO `scores` VALUES (1160, '风景园林', 504, 504, 504, 3, 25, 4, 6, 438);
INSERT INTO `scores` VALUES (1161, '市场营销', 506, 506, 506, 3, 25, 4, 6, 438);
INSERT INTO `scores` VALUES (1162, '翻译', 506, 506, 506, 3, 25, 4, 6, 438);
INSERT INTO `scores` VALUES (1163, '跨境电子商务', 504, 504, 504, 3, 25, 4, 6, 438);
INSERT INTO `scores` VALUES (1164, '酒店管理', 513, 513, 513, 3, 25, 4, 6, 438);
INSERT INTO `scores` VALUES (1165, '人力资源管理', 505, 505, 505, 3, 25, 4, 6, 438);
INSERT INTO `scores` VALUES (1166, '汽车服务工程', 515, 500, 505, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (1167, '土木工程', 502, 500, 501, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (1168, '建筑环境与能源应用工程', 509, 499, 502, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (1169, '给排水科学与工程', 500, 499, 500, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (1170, '道路桥梁与渡河工程', 499, 498, 499, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (1171, '化学工程与工业生物工程', 503, 502, 503, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (1172, '应用心理学', 497, 497, 497, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (1173, '建筑学', 507, 507, 507, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (1174, '风景园林', 501, 501, 501, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (1175, '市场营销', 496, 496, 496, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (1176, '人力资源管理', 495, 495, 495, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (1177, '跨境电子商务', 496, 496, 496, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (1178, '酒店管理', 494, 494, 494, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (1179, '旅游管理与服务教育', 496, 496, 496, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (1180, '园林', 499, 497, 498, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (1181, '物流工程', 518, 509, 514, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (1182, '边防军人子女预科班', 443, 441, 435, 3, 26, 3, 6, 427);
INSERT INTO `scores` VALUES (1183, '应用心理学', 523, 523, 523, 3, 26, 4, 6, 471);
INSERT INTO `scores` VALUES (1184, '风景园林', 532, 532, 532, 3, 26, 4, 6, 471);
INSERT INTO `scores` VALUES (1185, '市场营销', 524, 524, 524, 3, 26, 4, 6, 471);
INSERT INTO `scores` VALUES (1186, '人力资源管理', 524, 524, 542, 3, 26, 4, 6, 471);
INSERT INTO `scores` VALUES (1187, '跨境电子商务', 539, 539, 539, 3, 26, 4, 6, 471);
INSERT INTO `scores` VALUES (1188, '酒店管理', 525, 525, 525, 3, 26, 4, 6, 471);
INSERT INTO `scores` VALUES (1189, '旅游管理与服务教育', 523, 523, 523, 3, 26, 4, 6, 471);
INSERT INTO `scores` VALUES (1190, '建筑学', 492, 492, 492, 3, 27, 3, 6, 438);
INSERT INTO `scores` VALUES (1191, '风景园林', 491, 491, 491, 3, 27, 3, 6, 438);
INSERT INTO `scores` VALUES (1192, '酒店管理', 493, 493, 493, 3, 27, 3, 6, 438);
INSERT INTO `scores` VALUES (1193, '物流工程', 500, 495, 498, 3, 27, 3, 6, 438);
INSERT INTO `scores` VALUES (1194, '汽车服务工程', 503, 498, 501, 3, 27, 3, 6, 438);
INSERT INTO `scores` VALUES (1195, '建筑环境与能源应用工程', 501, 498, 500, 3, 27, 3, 6, 438);
INSERT INTO `scores` VALUES (1196, '给排水科学与工程', 505, 498, 502, 3, 27, 3, 6, 438);
INSERT INTO `scores` VALUES (1197, '道路桥梁与渡河工程', 502, 497, 499, 3, 27, 3, 6, 438);
INSERT INTO `scores` VALUES (1198, '化学工程与工业生物工程', 514, 500, 507, 3, 27, 3, 6, 438);
INSERT INTO `scores` VALUES (1199, '园林', 493, 493, 493, 3, 27, 3, 6, 438);
INSERT INTO `scores` VALUES (1200, '边防军人子女预科班', 409, 390, 400, 3, 27, 3, 6, 438);
INSERT INTO `scores` VALUES (1201, '风景园林', 525, 525, 525, 3, 27, 4, 6, 402);
INSERT INTO `scores` VALUES (1202, '酒店管理', 525, 525, 524, 3, 27, 4, 6, 402);
INSERT INTO `scores` VALUES (1203, '边防军人子女预科班', 449, 449, 449, 3, 27, 4, 6, 402);
INSERT INTO `scores` VALUES (1204, '建筑学', 477, 477, 477, 3, 28, 3, 6, 430);
INSERT INTO `scores` VALUES (1205, '人力资源管理', 465, 465, 465, 3, 28, 3, 6, 430);
INSERT INTO `scores` VALUES (1206, '跨境电子商务', 476, 476, 476, 3, 28, 3, 6, 430);
INSERT INTO `scores` VALUES (1207, '酒店管理', 464, 464, 464, 3, 28, 3, 6, 430);
INSERT INTO `scores` VALUES (1208, '旅游管理与服务教育', 465, 465, 465, 3, 28, 3, 6, 430);
INSERT INTO `scores` VALUES (1209, '物流工程', 477, 474, 476, 3, 28, 3, 6, 430);
INSERT INTO `scores` VALUES (1210, '汽车服务工程', 480, 476, 478, 3, 28, 3, 6, 430);
INSERT INTO `scores` VALUES (1211, '建筑环境与能源应用工程', 486, 475, 479, 3, 28, 3, 6, 430);
INSERT INTO `scores` VALUES (1212, '给排水科学与工程', 479, 475, 476, 3, 28, 3, 6, 430);
INSERT INTO `scores` VALUES (1213, '道路桥梁与渡河工程', 480, 474, 477, 3, 28, 3, 6, 430);
INSERT INTO `scores` VALUES (1214, '化学工程与工业生物工程', 475, 475, 475, 3, 28, 3, 6, 430);
INSERT INTO `scores` VALUES (1215, '园林（农林类）', 473, 470, 472, 3, 28, 3, 6, 430);
INSERT INTO `scores` VALUES (1216, '人力资源管理', 502, 502, 502, 3, 28, 4, 6, 430);
INSERT INTO `scores` VALUES (1217, '跨境电子商务', 508, 508, 508, 3, 28, 4, 6, 430);
INSERT INTO `scores` VALUES (1218, '酒店管理', 503, 503, 503, 3, 28, 4, 6, 430);
INSERT INTO `scores` VALUES (1219, '旅游管理与服务教育', 500, 500, 500, 3, 28, 4, 6, 430);
INSERT INTO `scores` VALUES (1220, '边防军人子女预科班', 453, 453, 453, 3, 28, 4, 6, 430);
INSERT INTO `scores` VALUES (1221, '边防军人子女预科班', 498, 480, 0, 3, 29, 3, 6, 490);
INSERT INTO `scores` VALUES (1222, '边防军人子女预科班', 362, 360, 0, 3, 30, 3, 6, 402);
INSERT INTO `scores` VALUES (1223, '边防军人子女预科班', 429, 378, 0, 3, 31, 3, 6, 430);
INSERT INTO `scores` VALUES (1224, '投资学', 345, 345, 345, 3, 32, 3, 6, 319);
INSERT INTO `scores` VALUES (1225, '学前教育', 341, 341, 341, 3, 32, 3, 6, 319);
INSERT INTO `scores` VALUES (1226, '风景园林', 379, 379, 379, 3, 32, 3, 6, 319);
INSERT INTO `scores` VALUES (1227, '园林', 340, 340, 340, 3, 32, 3, 6, 319);
INSERT INTO `scores` VALUES (1228, '市场营销', 343, 343, 343, 3, 32, 3, 6, 319);
INSERT INTO `scores` VALUES (1229, '财务管理', 351, 351, 351, 3, 32, 3, 6, 319);
INSERT INTO `scores` VALUES (1230, '人力资源管理', 342, 342, 342, 3, 32, 3, 6, 319);
INSERT INTO `scores` VALUES (1231, '物流工程', 339, 339, 339, 3, 32, 3, 6, 319);
INSERT INTO `scores` VALUES (1232, '跨境电子商务', 343, 343, 343, 3, 32, 3, 6, 319);
INSERT INTO `scores` VALUES (1233, '酒店管理', 345, 345, 345, 3, 32, 3, 6, 319);
INSERT INTO `scores` VALUES (1234, '旅游管理与服务教育', 342, 342, 342, 3, 32, 3, 6, 319);
INSERT INTO `scores` VALUES (1235, '边防军人子女预科班', 318, 281, 300, 3, 32, 3, 6, 319);
INSERT INTO `scores` VALUES (1236, '边防军人子女预科班', 468, 425, 448, 3, 6, 3, 6, 463);

-- ----------------------------
-- Table structure for subjectcategory
-- ----------------------------
DROP TABLE IF EXISTS `subjectcategory`;
CREATE TABLE `subjectcategory`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subjectcategory
-- ----------------------------
INSERT INTO `subjectcategory` VALUES (3, '物理类');
INSERT INTO `subjectcategory` VALUES (4, '历史类');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `telephone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `perm` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `employeeId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `idCard` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$6QLAOwB4CwOoPchHHVQc9b$0BBf24vY4gYKUgUq4LLHFylXk8d6Z4zEgTB+Nra3Heo=', NULL, '46d6dc2bfdbf4c2abab1195bb9d7031c', '', 'admin', NULL, 1, 1, 1, '2025-11-10 12:19:38.247572', NULL, '2008046001', '142423198501270611');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$jHznlLudPokf2EUzrc2hTi$8egIhKaoeGopKHm/RP0znYh82n5M8WEv1q4D8irpB6Y=', NULL, '559091ace958461fa16b24571dfcad18', '13453424774', 'admin123', '117656431@qq.com', 1, 1, 0, '2025-11-15 01:56:18.958545', NULL, '2008046000', '142423198501270611');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$LdFnwgIEsn3BLXZz5r1r7G$HZWqbOn2zCTCNJtO3l7ISd8XSpWU4Akr8x6dFccfHpM=', NULL, 'd5b39fc95d144b4ea6704e9ba9e6cbe5', '13100001112', '2008046002', 'zyy@qq.com', 1, 0, 0, '2026-01-17 08:07:53.238050', NULL, '2008046002', '142423198501270611');

-- ----------------------------
-- Table structure for userinfo_groups
-- ----------------------------
DROP TABLE IF EXISTS `userinfo_groups`;
CREATE TABLE `userinfo_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UserInfo_groups_userinfo_id_group_id_e48c9e0b_uniq`(`userinfo_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `UserInfo_groups_group_id_8c6f20ce_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `UserInfo_groups_group_id_8c6f20ce_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `UserInfo_groups_userinfo_id_cce2b064_fk_UserInfo_id` FOREIGN KEY (`userinfo_id`) REFERENCES `userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userinfo_groups
-- ----------------------------

-- ----------------------------
-- Table structure for userinfo_roles
-- ----------------------------
DROP TABLE IF EXISTS `userinfo_roles`;
CREATE TABLE `userinfo_roles`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UserInfo_roles_userinfo_id_role_id_63c17ff2_uniq`(`userinfo_id` ASC, `role_id` ASC) USING BTREE,
  INDEX `UserInfo_roles_role_id_08c60e00_fk_Role_id`(`role_id` ASC) USING BTREE,
  CONSTRAINT `UserInfo_roles_role_id_08c60e00_fk_Role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `UserInfo_roles_userinfo_id_311a043d_fk_UserInfo_id` FOREIGN KEY (`userinfo_id`) REFERENCES `userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userinfo_roles
-- ----------------------------

-- ----------------------------
-- Table structure for userinfo_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `userinfo_user_permissions`;
CREATE TABLE `userinfo_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UserInfo_user_permission_userinfo_id_permission_i_66942a42_uniq`(`userinfo_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `UserInfo_user_permis_permission_id_c7ea8d38_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `UserInfo_user_permis_permission_id_c7ea8d38_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `UserInfo_user_permissions_userinfo_id_d4fb0c61_fk_UserInfo_id` FOREIGN KEY (`userinfo_id`) REFERENCES `userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userinfo_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for yearandmonth
-- ----------------------------
DROP TABLE IF EXISTS `yearandmonth`;
CREATE TABLE `yearandmonth`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `year` int NOT NULL,
  `month` int NOT NULL,
  `beizhu` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `year_month` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yearandmonth
-- ----------------------------
INSERT INTO `yearandmonth` VALUES ('873d2a22ad3d493db37f8329397181fc', 2025, 11, '', '2025-11');
INSERT INTO `yearandmonth` VALUES ('89baaa2627474bfdb3fcde6e7912b764', 2025, 12, '', '2025-12');
INSERT INTO `yearandmonth` VALUES ('f3150ee848504816b854a43c92cacdbe', 2026, 1, '代扣2026年1月医疗保险、养老保险、职业年金、失业保险、1月住房公积金个人6%、2025年11月个税及全年一次性奖金个税', '2026-01');

-- ----------------------------
-- Table structure for years
-- ----------------------------
DROP TABLE IF EXISTS `years`;
CREATE TABLE `years`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `year` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of years
-- ----------------------------
INSERT INTO `years` VALUES (6, '2025');

SET FOREIGN_KEY_CHECKS = 1;
