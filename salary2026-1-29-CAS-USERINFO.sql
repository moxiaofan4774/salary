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

 Date: 29/01/2026 09:37:36
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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of salarykoukuan
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of salaryyingfa
-- ----------------------------
INSERT INTO `salaryyingfa` VALUES ('001460c1b82a4a9095a5527be644d077', 89, 0, 1310, 0, 30, 2404, 7, 1764, 2660, 1418, 0, 0, 0, 0, 1965, 0, 0, '太原学院', '事业', '01', 9682, '074001', NULL, 7717, '140107198506113641', '王静', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('00643dad161e42969a16acc9390511fd', 99, 0, 1445, 0, 30, 3030, 0, 1789, 2730, 1540, 0, 0, 0, 0, 2168, 0, 0, '太原学院', '事业', '01', 10663, '074001', NULL, 8495, '142625198606053326', '王霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('007fbb2665ea480f91805bc635a724d2', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '140109199401100585', '司凡', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('00c4e2987ece4f4dacb5857a60611adb', 79, 0, 1394, 50, 30, 2520, 0, 2075, 2660, 1383, 0, 0, 0, 0, 2091, 0, 0, '太原学院', '事业', '01', 10191, '074001', NULL, 8100, '140107198205143927', '王晋娟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('00d58a0738fc4245821919e42398a595', 99, 4, 1653, 0, 30, 3260, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2480, 0, 0, '太原学院', '事业', '01', 12582, '074001', NULL, 10102, '140102197101176541', '牛月秀', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('00ee406c866842e7bd0f650ad0f0b017', 89, 0, 1298, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1947, 0, 0, '太原学院', '事业', '01', 9376, '074001', NULL, 7429, '140525198505186325', '王妮妮', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('0113163f375e4f578ae7320d228f77a5', 99, 3.9, 1788, 0, 0, 3810, 0, 3781, 2730, 1540, 0, 0, 0, 0, 2682, 0, 0, '太原学院', '事业', '01', 13751.9, '074001', NULL, 11069.9, '140103196802053335', '殷国刚', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('0197dcea8b9f49d8bcdd52b59b77b58b', 69, 0, 1302, 0, 0, 1925, 0, 2475, 2520, 1215, 0, 0, 0, 0, 1953, 0, 0, '太原学院', '事业', '01', 9506, '074001', NULL, 7553, '140102197609096534', '曲江', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('01b771d1138d4dc6bf05955dab6086f6', 99, 0, 1683, 0, 30, 3260, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2525, 0, 0, '太原学院', '事业', '01', 12608, '074001', NULL, 10083, '140102196901182128', '潘韧', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('01bc345dfc804f828295cb0b3ac69d34', 99, 0, 1468, 0, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2202, 0, 0, '太原学院', '事业', '01', 10972, '074001', NULL, 8770, '142401198310160921', '郄瑞丽', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('029470e29c204899aa0145a749a67749', 89, 0, 1219, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1829, 0, 0, '太原学院', '事业', '01', 8688, '074001', NULL, 6859, '142723199506050029', '温新奇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('02e50947c1a840f7af3a71950465f6af', 104, 0, 1842, 50, 30, 4640, 0, 2375, 2940, 1908, 0, 0, 0, 0, 2763, 0, 0, '太原学院', '事业', '01', 13889, '074001', NULL, 11126, '140603198012090525', '王晓燕', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('034b09e10c174f4597c0cf12e6a1dd08', 69, 3.6, 1377, 0, 0, 2260, 0, 2599, 2590, 1365, 0, 0, 0, 0, 2066, 0, 0, '太原学院', '事业', '01', 10263.6, '074001', NULL, 8197.6, '14011219670819041X', '张立群', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('03ab5e7aa4c0447fa713239eff16956d', 99, 3.9, 1810, 0, 30, 3810, 0, 3921, 2730, 1540, 0, 0, 0, 0, 2715, 0, 0, '太原学院', '事业', '01', 13943.9, '074001', NULL, 11228.9, '142601197002051922', '郝妍琴', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('03ed7909b0a04753a3790bd2f40932dc', 94, 0, 1505, 50, 0, 2880, 0, 2475, 2730, 1551, 0, 0, 0, 0, 2258, 0, 0, '太原学院', '事业', '01', 11285, '074001', NULL, 9027, '140104198107294511', '杨树军', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('0447ecfabd2548c885f3034a8fe8c1a3', 69, 0, 1164, 0, 0, 1925, 0, 1603, 2520, 1215, 0, 0, 0, 0, 1746, 0, 0, '太原学院', '事业', '01', 8496, '074001', NULL, 6750, '140107198703194815', '董晓飞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('04a3f066957e474f8ccf8eb240f91341', 99, 0, 1480, 0, 0, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2220, 0, 0, '太原学院', '事业', '01', 10954, '074001', NULL, 8734, '140102198207251436', '常靖', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('04c125dca84a4718af5b1e125f991309', 89, 0, 1389, 0, 30, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2084, 0, 0, '太原学院', '事业', '01', 10271, '074001', NULL, 8187, '140624197611204026', '李利芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('04d5c9b0cd84416a895c1764f792322d', 89, 0, 1211, 0, 0, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1817, 0, 0, '太原学院', '事业', '01', 8732, '074001', NULL, 6915, '142623199209066416', '孙萌', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('05bd044c4f074cbaa49799667084c4bd', 74, 0, 1106, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1659, 0, 0, '太原学院', '事业', '01', 7804, '074001', NULL, 6145, '14012119941108152X', '贾洁', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('0616e8608b154312a0af7e138e0ee843', 104, 0, 1896, 0, 30, 4640, 0, 2911, 2940, 1908, 0, 0, 0, 0, 2844, 0, 0, '太原学院', '事业', '01', 14429, '074001', NULL, 11585, '140123197510260025', '朱清华', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('06833ffe3931478383a20f958ca42eab', 89, 0, 1230, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1845, 0, 0, '太原学院', '事业', '01', 8781, '074001', NULL, 6936, '142301199506130061', '张照琳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('069b820de22c4f13914ec508dac2b4fb', 99, 0, 1665, 0, 30, 3030, 0, 3516, 2730, 1540, 0, 0, 0, 0, 2498, 0, 0, '太原学院', '事业', '01', 12610, '074001', NULL, 10112, '210203196908075261', '任永珍', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('06e8cb666f02442696ad0e03c6dad55a', 89, 0, 1352, 50, 30, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 2028, 0, 0, '太原学院', '事业', '01', 9891, '074001', NULL, 7863, '140107198401041223', '赵雯', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('074ed32ea77d4bf2a94f8c521f625c89', 89, 0, 1201, 0, 0, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1802, 0, 0, '太原学院', '事业', '01', 8722, '074001', NULL, 6920, '140427199405118095', '和晨阳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('07a731fdb44e43079c0a0ef7cfc6784c', 89, 0, 1361, 0, 30, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2042, 0, 0, '太原学院', '事业', '01', 10043, '074001', NULL, 8001, '142723198107200021', '王娟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('07a7b427533f401bbb0767dda0c0906d', 104, 0, 1813, 0, 0, 4640, 0, 2375, 2940, 1908, 0, 0, 0, 0, 2720, 0, 0, '太原学院', '事业', '01', 13780, '074001', NULL, 11060, '140602197909058617', '常浩', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('083ee66bd13b413193d9751023d5ca3e', 99, 0, 1623, 0, 30, 3030, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2435, 0, 0, '太原学院', '事业', '01', 12318, '074001', NULL, 9883, '140102197108040620', '李文璇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('08b781554ed04fbf8d33eb20802223fb', 74, 0, 1078, 0, 0, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1617, 0, 0, '太原学院', '事业', '01', 7746, '074001', NULL, 6129, '140602199111079039', '郝则好', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('08c30a8f08244bd6bf316edfdb84ef69', 89, 0, 1257, 50, 0, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1886, 0, 0, '太原学院', '事业', '01', 9262, '074001', NULL, 7376, '61012319820410331X', '韩凯', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('0919dce330834ab39347a9211b4ece30', 94, 0, 1501, 0, 0, 2880, 0, 2275, 2730, 1551, 0, 0, 0, 0, 2252, 0, 0, '太原学院', '事业', '01', 11031, '074001', NULL, 8779, '14010419771224223X', '李琦', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('092cf521844e472c8971265b120c0eb0', 74, 0, 1281, 50, 0, 1950, 0, 2475, 2520, 1215, 0, 0, 0, 0, 1922, 0, 0, '太原学院', '事业', '01', 9565, '074001', NULL, 7643, '140203197801155911', '张洋', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('0944c0fd967242efa2bac788bb3f6af9', 99, 3.5, 1604, 0, 0, 3030, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2406, 0, 0, '太原学院', '事业', '01', 12147.5, '074001', NULL, 9741.5, '140106197201311814', '王国胜', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('0976a49c513c44eea73a1da5330db869', 74, 0, 1306, 0, 0, 1950, 0, 2475, 2520, 1215, 0, 0, 0, 0, 1959, 0, 0, '太原学院', '事业', '01', 9540, '074001', NULL, 7581, '140102197604250619', '王峰龙', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('09b752e706d845e9a58d49608cd4409c', 99, 0, 1592, 50, 30, 3260, 0, 2796, 2730, 1540, 0, 0, 0, 0, 2388, 0, 0, '太原学院', '事业', '01', 12097, '074001', NULL, 9709, '142429197603210023', '王岩', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('09d31fdc23a54ea187f9ca7d258f44d5', 94, 3.2, 1778, 0, 0, 3455, 0, 3641, 2800, 1810, 0, 0, 0, 0, 2667, 0, 0, '太原学院', '事业', '01', 13581.2, '074001', NULL, 10914.2, '140102197105086519', '张永平', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('0a2e2c564620477692b8ef2b2a8e11e8', 89, 0, 1213, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1820, 0, 0, '太原学院', '事业', '01', 8846, '074001', NULL, 7026, '140107198808081729', '祁洁', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('0a34d875e65d4c69bf25d7535384dd07', 104, 0, 1815, 0, 30, 4640, 0, 2275, 2940, 1908, 0, 0, 0, 0, 2723, 0, 0, '太原学院', '事业', '01', 13712, '074001', NULL, 10989, '130102198109272426', '孙月红', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('0a61dacea14e4d3eb45e3e17521a4d38', 89, 0, 1294, 0, 0, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1941, 0, 0, '太原学院', '事业', '01', 9528, '074001', NULL, 7587, '140102198207230010', '李翔', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('0a75c2679f0147bd991e071b07dec770', 99, 0, 1440, 0, 0, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2160, 0, 0, '太原学院', '事业', '01', 10721, '074001', NULL, 8561, '140106198511121236', '曹翔宇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('0ae0c363627742e989a3f892e55e3a15', 89, 0, 1230, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1845, 0, 0, '太原学院', '事业', '01', 8781, '074001', NULL, 6936, '140105199303051825', '白宇星', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('0af0365154c54c1a85769c14dc4ddcaa', 89, 0, 1307, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1961, 0, 0, '太原学院', '事业', '01', 9385, '074001', NULL, 7424, '140202198705202528', '冯琨', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('0b7021214f5e45e3b5939335b0ab4c4f', 99, 0, 1465, 0, 0, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2198, 0, 0, '太原学院', '事业', '01', 10746, '074001', NULL, 8548, '142635198201191213', '秦勇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('0b7b2e635b4841699882929ed72266af', 89, 0, 1215, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1823, 0, 0, '太原学院', '事业', '01', 8848, '074001', NULL, 7025, '140429199411275620', '韩静', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('0c56284e87dd477484b17ebeedf02cd5', 89, 0, 1181, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1772, 0, 0, '太原学院', '事业', '01', 8568, '074001', NULL, 6796, '142202199512144567', '付国霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('0c680accfdc84d179712822e229cf73f', 99, 0, 1592, 0, 30, 3260, 0, 2796, 2730, 1540, 0, 0, 0, 0, 2388, 0, 0, '太原学院', '事业', '01', 12047, '074001', NULL, 9659, '142327197402043785', '薛生娥', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('0c914ab4d3ec4363b25ef5c89bed6593', 99, 0, 1478, 0, 0, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2217, 0, 0, '太原学院', '事业', '01', 11052, '074001', NULL, 8835, '140102198008072312', '苏亮', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('0caab28eebba4737a6585c54276abdb3', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '140108199305114227', '杜苗雨阳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('0cf45ef8a44b42c18f50962e904a2da4', 89, 0, 1399, 0, 30, 2410, 0, 2375, 2660, 1418, 0, 0, 0, 0, 2099, 0, 0, '太原学院', '事业', '01', 10381, '074001', NULL, 8282, '140102198009096527', '许鸿', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('0f3c583c8d044dbc99ffe4fa69593a02', 89, 0, 1322, 0, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1983, 0, 0, '太原学院', '事业', '01', 9779, '074001', NULL, 7796, '140102198205276525', '贾娟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('0f450dc315f5425ca16b322e8ad99f67', 89, 0, 1386, 0, 30, 2185, 0, 2375, 2660, 1418, 0, 0, 0, 0, 2079, 0, 0, '太原学院', '事业', '01', 10143, '074001', NULL, 8064, '140103197801095722', '赵红梅', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('0f60bec07c0341188d7d2f0175631cb8', 99, 0, 1583, 0, 30, 3030, 0, 2689, 2730, 1540, 0, 0, 0, 0, 2375, 0, 0, '太原学院', '事业', '01', 11701, '074001', NULL, 9326, '140502197602013080', '张俊霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('0f811ea6c13b43ab88278b9d1b8f5401', 89, 0, 1374, 0, 30, 2185, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2061, 0, 0, '太原学院', '事业', '01', 10231, '074001', NULL, 8170, '14010319780701062X', '于光', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('0fc4f7b5ad474221a884d984dfe517ee', 89, 0, 1445, 0, 30, 2410, 0, 2796, 2660, 1418, 0, 0, 0, 0, 2168, 0, 0, '太原学院', '事业', '01', 10848, '074001', NULL, 8680, '140102197401062386', '孙桂芸', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1000198dc7604a20bb75d04c16b535f8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 35000, '太原学院', '事业', '01', 35000, '074001', NULL, 35000, '140103197010141542', '魏峻伟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('10d4cfd1e67d4338aeb30718f72030c9', 99, 0, 1542, 0, 0, 3030, 0, 2582, 2730, 1540, 0, 0, 0, 0, 2313, 0, 0, '太原学院', '事业', '01', 11523, '074001', NULL, 9210, '14010219760413233X', '成伟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('10f661affc5a412ab6b2f8407c6fb0d4', 94, 0, 1712, 0, 0, 3455, 0, 3141, 2800, 1810, 0, 0, 0, 0, 2568, 0, 0, '太原学院', '事业', '01', 13012, '074001', NULL, 10444, '142724197203181256', '姚晓黎', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('114c22643c344390b39f80d12b2430a0', 89, 4.3, 1567, 0, 0, 2650, 0, 3516, 2660, 1418, 0, 0, 0, 0, 2351, 0, 0, '太原学院', '事业', '01', 11904.3, '074001', NULL, 9553.3, '140102196807055157', '郭守敬', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('11732d41b1654aa390fc1ef3caf37633', 89, 0, 1431, 0, 30, 2410, 0, 2689, 2660, 1418, 0, 0, 0, 0, 2147, 0, 0, '太原学院', '事业', '01', 10727, '074001', NULL, 8580, '140112197409121726', '杨冰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('11dfb8f9245342ddb326aad2a28e8240', 69, 0, 1316, 0, 0, 2260, 0, 2128, 2590, 1365, 0, 0, 0, 0, 1974, 0, 0, '太原学院', '事业', '01', 9728, '074001', NULL, 7754, '140104197210292712', '朱道宏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('11e4bbb093924fefa4d38b848dea728e', 69, 0, 1307, 0, 30, 2260, 0, 1954, 2590, 1365, 0, 0, 0, 0, 1961, 0, 0, '太原学院', '事业', '01', 9575, '074001', NULL, 7614, '140110197608072063', '白英娟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('11ebaa2be74a42fcac174accb7af7462', 74, 0, 1112, 0, 30, 1925, 0, 1087, 2520, 1215, 0, 0, 0, 0, 1668, 0, 0, '太原学院', '事业', '01', 7963, '074001', NULL, 6295, '142301199306154149', '张茹', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('12086380f8ba48e68ac65f59ae0d6cff', 89, 0, 1335, 50, 0, 2410, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2003, 0, 0, '太原学院', '事业', '01', 9937, '074001', NULL, 7934, '140202198105264514', '申森', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1217d4e812094a2d9e7067858df6d386', 89, 0, 1352, 50, 30, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2028, 0, 0, '太原学院', '事业', '01', 10084, '074001', NULL, 8056, '140103198202184840', '要丽娟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('123185099e694cb88502eb2667460716', 89, 0, 1348, 0, 30, 2410, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2022, 0, 0, '太原学院', '事业', '01', 9930, '074001', NULL, 7908, '142232198201260468', '钟丽霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('123531e8c06e4fc58de05b62ded8e32c', 89, 0, 1174, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1761, 0, 0, '太原学院', '事业', '01', 8613, '074001', NULL, 6852, '140107199208050616', '杨非凡', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('12f04872f77648c988013267e18a82c7', 74, 0, 1083, 0, 30, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1625, 0, 0, '太原学院', '事业', '01', 7710, '074001', NULL, 6085, '140302199612260825', '刘玥', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('12f19259a372493c8647d9968da5ab1b', 74, 0, 1094, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1641, 0, 0, '太原学院', '事业', '01', 7792, '074001', NULL, 6151, '14262119960902292X', '郑亚莹', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('13101d14bd59484d8d8e487ce5ab168b', 74, 0, 1108, 0, 0, 1925, 0, 1169, 2520, 1215, 0, 0, 0, 0, 1662, 0, 0, '太原学院', '事业', '01', 8011, '074001', NULL, 6349, '140105199210122233', '杨浩宇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('135c469fe8ea41558af7bbb29e7d0ae1', 69, 0, 1268, 0, 30, 1925, 0, 2375, 2520, 1215, 0, 0, 0, 0, 1902, 0, 0, '太原学院', '事业', '01', 9402, '074001', NULL, 7500, '149001197307272826', '谢玉华', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('13637446cae1409680e6b6648b1fdb7d', 99, 0, 1758, 50, 30, 3810, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2637, 0, 0, '太原学院', '事业', '01', 13283, '074001', NULL, 10646, '140102197009174842', '张静', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('13a0c72aa1a343fea5c804b1f3486ff1', 89, 0, 1333, 50, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2000, 0, 0, '太原学院', '事业', '01', 9840, '074001', NULL, 7840, '14012219821207082X', '赵海霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('13e1ba02437f4c95b942e36ee36c7c50', 89, 0, 1476, 0, 30, 2650, 0, 2796, 2660, 1418, 0, 0, 0, 0, 2214, 0, 0, '太原学院', '事业', '01', 11119, '074001', NULL, 8905, '140103197409075727', '吕嵘', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('13ec3b2d9bc3422caf018c288d284787', 99, 0, 1738, 0, 30, 3260, 13, 3921, 2730, 1540, 0, 0, 0, 0, 2607, 0, 0, '太原学院', '事业', '01', 13331, '074001', NULL, 10724, '140102196701114825', '牛智红', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('14518be4634e454d9229a23bf4b1c33f', 89, 0, 1177, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1766, 0, 0, '太原学院', '事业', '01', 8534, '074001', NULL, 6768, '140107199407040015', '赵子瑞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1459186690ac4fa58b10d44c056fefe4', 99, 0, 1547, 0, 0, 3260, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2321, 0, 0, '太原学院', '事业', '01', 11651, '074001', NULL, 9330, '140322197907140018', '王培军', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1475d77bfed2418b9792e562b39ff572', 99, 4.2, 1640, 0, 30, 3030, 0, 3391, 2730, 1540, 0, 0, 0, 0, 2460, 0, 0, '太原学院', '事业', '01', 12464.2, '074001', NULL, 10004.2, '140102196911262367', '李雪琴', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('148ea6d61229480a82133a9a3b6110b8', 99, 0, 1497, 0, 30, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2246, 0, 0, '太原学院', '事业', '01', 11201, '074001', NULL, 8955, '14010219820125402X', '李芙蓉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('14a1b80350e24bc8809e534ed12fb9c9', 89, 0, 1223, 0, 0, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1835, 0, 0, '太原学院', '事业', '01', 8914, '074001', NULL, 7079, '140603198810264913', '魏宏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('14b7271643f24617a5e36590522a289a', 74, 0, 1254, 50, 0, 1950, 0, 2175, 2520, 1215, 0, 0, 0, 0, 1881, 0, 0, '太原学院', '事业', '01', 9238, '074001', NULL, 7357, '140102198007151414', '赵军', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('14cf45fbd6784daab71f002496807560', 89, 0, 1309, 0, 30, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 1964, 0, 0, '太原学院', '事业', '01', 9666, '074001', NULL, 7702, '140302198008211029', '吴瑕', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('14fbab50cdec47ccb05ed53d94797ca5', 89, 0, 1361, 0, 0, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2042, 0, 0, '太原学院', '事业', '01', 10113, '074001', NULL, 8071, '142601197906084014', '赵振国', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('15e087bc145a4c9bbcdaa510218a7d29', 79, 0, 1280, 0, 30, 2200, 0, 1975, 2590, 1292, 0, 0, 0, 0, 1920, 0, 0, '太原学院', '事业', '01', 9446, '074001', NULL, 7526, '140102197907111421', '翟璐璐', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('15f3f412162e4bd1ba3dbcb1700a2bb8', 99, 0, 1468, 0, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2202, 0, 0, '太原学院', '事业', '01', 10972, '074001', NULL, 8770, '140102198012040022', '王辉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('163ada492e2d4fb796bd4247443c272f', 99, 0, 1587, 0, 30, 3260, 0, 2689, 2730, 1540, 0, 0, 0, 0, 2381, 0, 0, '太原学院', '事业', '01', 11935, '074001', NULL, 9554, '142703197212200023', '温红霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('16900bf9d6aa4254a9335dc71e4e36ee', 89, 0, 1357, 50, 30, 2185, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2036, 0, 0, '太原学院', '事业', '01', 10064, '074001', NULL, 8028, '140102197910265165', '杜芸', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('16bcecabc18d4e1fb313fca2acd35fb4', 99, 0, 1511, 50, 0, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2267, 0, 0, '太原学院', '事业', '01', 11435, '074001', NULL, 9168, '142429197704103817', '韩瑞刚', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('16c18116fadc410780ed2af533c443a4', 89, 0, 1318, 0, 30, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 1977, 0, 0, '太原学院', '事业', '01', 9675, '074001', NULL, 7698, '140106198305250627', '张守锐', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('16f3e75d0c254ad9ab06445dce51b61a', 99, 0, 1458, 0, 0, 3030, 0, 1789, 2730, 1540, 0, 0, 0, 0, 2187, 0, 0, '太原学院', '事业', '01', 10646, '074001', NULL, 8459, '140107198503180013', '杨鹏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('17072ff6d3604749baa1a37d4c7d01cc', 99, 0, 1468, 0, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2202, 0, 0, '太原学院', '事业', '01', 10972, '074001', NULL, 8770, '140102198202112349', '袁芳芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('17257b4e97f04c068dc109e7e926c91d', 99, 0, 1468, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2202, 0, 0, '太原学院', '事业', '01', 11022, '074001', NULL, 8820, '142424198107223522', '李雪梅', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1733363d891145d9b0f5c0ad7eac70fb', 89, 0, 1215, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1823, 0, 0, '太原学院', '事业', '01', 8848, '074001', NULL, 7025, '140423199404120024', '李可欣', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1781594f9d154444971065103f44e1b9', 99, 0, 1490, 0, 0, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2235, 0, 0, '太原学院', '事业', '01', 10964, '074001', NULL, 8729, '140622198003174718', '王振国', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1791b5ecb48345ce861beeff94c73693', 94, 0, 1680, 0, 30, 3455, 0, 2911, 2800, 1810, 0, 0, 0, 0, 2520, 0, 0, '太原学院', '事业', '01', 12780, '074001', NULL, 10260, '140102197601024026', '谢鹏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('179beee290554769bd152fbd9b826afe', 89, 0, 1215, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1823, 0, 0, '太原学院', '事业', '01', 8654, '074001', NULL, 6831, '140481199303083213', '成宇飞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('17ae1694d3c64d11aa4cf6c920f577b8', 89, 0, 1378, 0, 30, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2067, 0, 0, '太原学院', '事业', '01', 10260, '074001', NULL, 8193, '330106197804290069', '渠改萍', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('17b5517410d64d429c69ba6b409c810c', 64, 0, 975, 0, 0, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1463, 0, 0, '太原学院', '事业', '01', 8067, '074001', NULL, 6604, '141127199701010091', '邸文奇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('17c1459d744d4681b919a76ef831c560', 94, 0, 1511, 50, 0, 2880, 0, 2375, 2730, 1551, 0, 0, 0, 0, 2267, 0, 0, '太原学院', '事业', '01', 11191, '074001', NULL, 8924, '142223197712306113', '王宇峰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('17c912a0f998451aa0ef3e79d91b66a1', 89, 0, 1267, 0, 0, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1901, 0, 0, '太原学院', '事业', '01', 9222, '074001', NULL, 7321, '140181198408240210', '鲁维维', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('17cd211f2d39420f85bf578e5af4dcf7', 89, 0, 1050, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1575, 0, 0, '太原学院', '事业', '01', 8437, '074001', NULL, 6862, '140107199308234527', '白雪赟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('17d83cb0d90342249ea3feedae5d3b24', 74, 4, 1342, 0, 30, 1950, 0, 2911, 2520, 1215, 0, 0, 0, 0, 2013, 0, 0, '太原学院', '事业', '01', 10046, '074001', NULL, 8033, '140104197108071761', '赵利荣', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('18199e1a90614d85803daf9c88d02b86', 99, 0, 1466, 50, 30, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2199, 0, 0, '太原学院', '事业', '01', 10920, '074001', NULL, 8721, '140103198008125425', '孙丽', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('18398c8460f14de7bf8a192b1552b46e', 74, 0, 1081, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1622, 0, 0, '太原学院', '事业', '01', 7779, '074001', NULL, 6157, '140423199611060829', '郭宇晴', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('18e1036ef0a748d5acc4fb355309d131', 89, 0, 1473, 0, 0, 2650, 0, 2796, 2660, 1418, 0, 0, 0, 0, 2210, 0, 0, '太原学院', '事业', '01', 11086, '074001', NULL, 8876, '140121197601042514', '郭小杰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('19a97ef2386b439f840e5aa614489341', 104, 4.5, 2093, 0, 30, 5220, 0, 3921, 2940, 1908, 0, 0, 0, 0, 3140, 0, 0, '太原学院', '事业', '01', 16220.5, '074001', NULL, 13080.5, '140102196511282326', '刘媛媛', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1a037598284741a0b26a758c2a4de59a', 89, 0, 1323, 0, 0, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1985, 0, 0, '太原学院', '事业', '01', 9782, '074001', NULL, 7797, '23108419781220001X', '包全磊', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1a06eeaa2e4243aa9c69623e54e46d3f', 89, 0, 1212, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1818, 0, 0, '太原学院', '事业', '01', 8763, '074001', NULL, 6945, '140430199407080025', '梁泽', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1b246d48766040f4bd59319575b814ba', 99, 0, 1452, 50, 0, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2178, 0, 0, '太原学院', '事业', '01', 10876, '074001', NULL, 8698, '142232198402080017', '吕文渊', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1b497d97e58647ba9e86c52974f0e962', 89, 3.5, 1507, 0, 30, 2650, 0, 3026, 2660, 1418, 0, 0, 0, 0, 2261, 0, 0, '太原学院', '事业', '01', 11383.5, '074001', NULL, 9122.5, '14010219740220514X', '王艳花', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1b78c6ea3e7a4128ad05c5dad5a25a1b', 89, 0, 1252, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1878, 0, 0, '太原学院', '事业', '01', 8973, '074001', NULL, 7095, '142322199009184028', '郝丽萍', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1b89a62432994e4ebd435d2b57f369f4', 99, 0, 1468, 0, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2202, 0, 0, '太原学院', '事业', '01', 10972, '074001', NULL, 8770, '140102198103125224', '赵敏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1b8d42738d464061a2af089087f20966', 99, 0, 1524, 0, 30, 3260, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2286, 0, 0, '太原学院', '事业', '01', 11458, '074001', NULL, 9172, '140522198005140049', '孙雅妮', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1b9808a2b4644da182fe801fcc69d2c8', 99, 0, 1478, 0, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2217, 0, 0, '太原学院', '事业', '01', 10982, '074001', NULL, 8765, '140103198009153321', '杜娟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1c15870e392e4c859976c6c9048dc2bd', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '140602199609101520', '焦霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1c9919ffe016495d997ca6ba76b67805', 94, 3.9, 1650, 0, 0, 2880, 0, 3641, 2730, 1551, 0, 0, 0, 0, 2475, 0, 0, '太原学院', '事业', '01', 12549.9, '074001', NULL, 10074.9, '140103196708150657', '杨烽', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1cc05f5592a447799b9e71f1d12ea4b1', 99, 0, 1622, 0, 30, 3260, 0, 3026, 2730, 1540, 0, 0, 0, 0, 2433, 0, 0, '太原学院', '事业', '01', 12307, '074001', NULL, 9874, '140102197210236021', '丁玮', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1cd8215340a74a0e9a29f051c93814b8', 89, 0, 1361, 50, 0, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2042, 0, 0, '太原学院', '事业', '01', 10163, '074001', NULL, 8121, '142622198212307515', '席作宏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1cea25e57cb245e9bf76a8250c1223b9', 79, 0, 1328, 0, 0, 2520, 0, 1789, 2660, 1383, 0, 0, 0, 0, 1992, 0, 0, '太原学院', '事业', '01', 9759, '074001', NULL, 7767, '14010519861212291X', '肖利龙', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1d68fcef2f124e8292ff7cfd26902541', 104, 0, 1822, 0, 30, 4640, 0, 2275, 2940, 1908, 0, 0, 0, 0, 2733, 0, 0, '太原学院', '事业', '01', 13719, '074001', NULL, 10986, '140103197902220043', '胡盾', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1df534ed9517496b9a4dda2417ed5e3b', 99, 0, 1443, 0, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2165, 0, 0, '太原学院', '事业', '01', 10754, '074001', NULL, 8589, '142228198605270027', '张晶晶', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1e01e10b202348f5916964ae8c719aca', 99, 0, 1544, 0, 30, 3030, 0, 2582, 2730, 1540, 0, 0, 0, 0, 2316, 0, 0, '太原学院', '事业', '01', 11555, '074001', NULL, 9239, '14012219770621282X', '张文仙', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1e0bbc5f560b4fea8bcf1f4a32219de7', 74, 0, 1112, 0, 0, 1925, 0, 1005, 2520, 1215, 0, 0, 0, 0, 1668, 0, 0, '太原学院', '事业', '01', 7851, '074001', NULL, 6183, '140105199512222918', '马腾飞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1e3076e3c2f44b14a8b04f2ae0ea73e0', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '142301199408240048', '苏旭洁', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1e5b60e41ce64f27a9099502f0d9921c', 89, 0, 1259, 0, 30, 2185, 0, 1515, 2660, 1418, 0, 0, 0, 0, 1889, 0, 0, '太原学院', '事业', '01', 9156, '074001', NULL, 7267, '142702198901182420', '赵娆', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1e60bacc15e64c3180d3d093d5ca4d8b', 74, 0, 1192, 0, 30, 1925, 0, 1789, 2520, 1215, 0, 0, 0, 0, 1788, 0, 0, '太原学院', '事业', '01', 8745, '074001', NULL, 6957, '430682198210071063', '刘琼', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1e6d08360ed9453ea701e4bccf842df1', 89, 0, 1361, 0, 0, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2042, 0, 0, '太原学院', '事业', '01', 10113, '074001', NULL, 8071, '140107197903053916', '王浚波', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1e892b304adf4cabb82186febf16c931', 99, 0, 1592, 0, 30, 3260, 0, 2796, 2730, 1540, 0, 0, 0, 0, 2388, 0, 0, '太原学院', '事业', '01', 12047, '074001', NULL, 9659, '142422197506111520', '张彩霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1e9c9c38db20411580523f78efb8bd18', 94, 0, 1434, 0, 30, 2880, 0, 1882, 2730, 1551, 0, 0, 0, 0, 2151, 0, 0, '太原学院', '事业', '01', 10601, '074001', NULL, 8450, '140105198405090521', '刘洁', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1eb78d0de3c84c6c85c39d887075c2b0', 89, 0, 1215, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1823, 0, 0, '太原学院', '事业', '01', 8848, '074001', NULL, 7025, '140110199005071028', '赵翠玉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1eca4fbb16b14b038d2bd123fd62a3db', 99, 0, 1598, 0, 0, 3030, 0, 3026, 2730, 1540, 0, 0, 0, 0, 2397, 0, 0, '太原学院', '事业', '01', 12023, '074001', NULL, 9626, '140105197205073714', '赵克昌', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1f2e3770eb9747fdaa7294eee5fe5a9b', 79, 0, 1186, 0, 0, 2200, 0, 1169, 2590, 1292, 0, 0, 0, 0, 1779, 0, 0, '太原学院', '事业', '01', 8516, '074001', NULL, 6737, '140522199302051039', '于晋伟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1f4ef7bb54114957837504345c4914ce', 89, 0, 1335, 0, 30, 2185, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2003, 0, 0, '太原学院', '事业', '01', 9892, '074001', NULL, 7889, '140108198210112523', '马莎', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1f5360bd3f7d43f2825c15beaf1a4b46', 99, 0, 1428, 0, 0, 3030, 0, 1789, 2730, 1540, 0, 0, 0, 0, 2142, 0, 0, '太原学院', '事业', '01', 10616, '074001', NULL, 8474, '142630198508173018', '白国庆', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1f9226b73b8f45848d79ecfb9b275941', 89, 0, 1361, 50, 0, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2042, 0, 0, '太原学院', '事业', '01', 10163, '074001', NULL, 8121, '142601198108241710', '靳悦振', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1fc5669799f74cddaa5ad58c325831d6', 89, 0, 1319, 50, 0, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1979, 0, 0, '太原学院', '事业', '01', 9796, '074001', NULL, 7817, '140112198111042835', '刘焕', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('1fd2bbb8cf7f44dfb3dd6e746c20c31b', 89, 0, 1339, 0, 30, 2410, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2009, 0, 0, '太原学院', '事业', '01', 9921, '074001', NULL, 7912, '140121198403273527', '陈瑞婷', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2004d380640848aa9ef120eaf557e155', 89, 0, 1191, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1787, 0, 0, '太原学院', '事业', '01', 8630, '074001', NULL, 6843, '142625199301273314', '陈文兵', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('20623bcc38c34dd7842dbe7dae856a18', 94, 0, 1512, 0, 0, 2880, 0, 2582, 2730, 1551, 0, 0, 0, 0, 2268, 0, 0, '太原学院', '事业', '01', 11349, '074001', NULL, 9081, '140103197512050632', '黄凌', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2064d66260e34bbc982e4e50b69df08f', 89, 0, 1428, 0, 0, 2410, 0, 2689, 2660, 1418, 0, 0, 0, 0, 2142, 0, 0, '太原学院', '事业', '01', 10694, '074001', NULL, 8552, '14010219731220061X', '张巍', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('20738d223eec4a43b8d6207c582ecdfb', 99, 0, 1647, 0, 30, 3260, 0, 3026, 2730, 1540, 0, 0, 0, 0, 2471, 0, 0, '太原学院', '事业', '01', 12332, '074001', NULL, 9861, '140102197201295169', '张安琪', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2077bed949964dc88ac3dae2c1b51c11', 94, 0, 1716, 0, 30, 3455, 0, 3141, 2800, 1810, 0, 0, 0, 0, 2574, 0, 0, '太原学院', '事业', '01', 13046, '074001', NULL, 10472, '142326197304061246', '高春娟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('20936eefdfe14e0d843e6a8b6b275ae8', 89, 0, 1267, 0, 0, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1901, 0, 0, '太原学院', '事业', '01', 9222, '074001', NULL, 7321, '140108198501284819', '李新龙', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('20eb1bf307fd4208ace2997c8fee0367', 94, 4, 1798, 0, 30, 3455, 0, 3516, 2800, 1810, 0, 0, 0, 0, 2697, 0, 0, '太原学院', '事业', '01', 13507, '074001', NULL, 10810, '14010319670211214X', '张文梅', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2129a0951bab41b0a0550e51ac73cb19', 104, 0, 2075, 0, 30, 5220, 0, 3516, 2940, 1908, 0, 0, 0, 0, 3113, 0, 0, '太原学院', '事业', '01', 15793, '074001', NULL, 12680, '140202197204204029', '梁红梅', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('21626aaf500f4cf899f3351b780562ca', 79, 0, 1330, 0, 0, 2520, 0, 1882, 2660, 1383, 0, 0, 0, 0, 1995, 0, 0, '太原学院', '事业', '01', 9854, '074001', NULL, 7859, '140121198409205533', '吴晓杰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('217e2359c25a4023b62e915f28a8a27b', 74, 0, 1243, 50, 30, 1950, 0, 2075, 2520, 1215, 0, 0, 0, 0, 1865, 0, 0, '太原学院', '事业', '01', 9157, '074001', NULL, 7292, '140103198005114245', '聂永乐', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('21b271e00c73485abe664a7a14bd013f', 99, 0, 1649, 0, 0, 3260, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2474, 0, 0, '太原学院', '事业', '01', 12544, '074001', NULL, 10070, '140102196902245151', '武岿', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('21d83c921ec94358823d4ff7b63d5262', 89, 0, 1177, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1766, 0, 0, '太原学院', '事业', '01', 8534, '074001', NULL, 6768, '142431199308077515', '崔晓珂', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('21da179352784b6881e028331603e519', 99, 0, 1550, 50, 30, 3260, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2325, 0, 0, '太原学院', '事业', '01', 11734, '074001', NULL, 9409, '142202197609020764', '武子英', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('21e5df64ee4d47b59d0dcb852bbc7d48', 89, 0, 1418, 50, 30, 2650, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2127, 0, 0, '太原学院', '事业', '01', 10590, '074001', NULL, 8463, '142430198102110024', '杨婷婷', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('221f2e4a46e24be18d0dd2d88568f1e7', 99, 0, 1478, 0, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2217, 0, 0, '太原学院', '事业', '01', 10982, '074001', NULL, 8765, '21032319800421226X', '李娜', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2233036110be49d68e3ff9e992ea3763', 99, 0, 1603, 0, 0, 3030, 13, 3141, 2730, 1540, 0, 0, 0, 0, 2405, 0, 0, '太原学院', '事业', '01', 12156, '074001', NULL, 9751, '140113197112291616', '王茵东', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('226c2eb626dd413eb68feaedd69553be', 99, 0, 1512, 0, 30, 3260, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2268, 0, 0, '太原学院', '事业', '01', 11246, '074001', NULL, 8978, '140113198103152328', '王秀卿', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('226c5892c47e457a9d13ec5a4d35344a', 99, 4.5, 1828, 0, 30, 3810, 0, 4061, 2730, 1540, 0, 0, 0, 0, 2742, 0, 0, '太原学院', '事业', '01', 14102.5, '074001', NULL, 11360.5, '142601196703151921', '张代会', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('22d69afcd20e4071b02aea7a5914d98d', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '太原学院', '事业', '01', 0, '074001', NULL, 0, '150104196508251355', '赵利民', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('230db6caea5144a6b1896aadfab03986', 89, 0, 1282, 0, 0, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1923, 0, 0, '太原学院', '事业', '01', 9423, '074001', NULL, 7500, '140123198504073914', '程少华', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('231b3c7789cc4b74bbf94fd052d8b140', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 35000, '太原学院', '事业', '01', 35000, '074001', NULL, 35000, '140102196510040827', '王玉兰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('23943b47bf0c4aa8bd823c63eeb4f1b9', 99, 0, 1520, 50, 30, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2280, 0, 0, '太原学院', '事业', '01', 11474, '074001', NULL, 9194, '142326197803064820', '白颉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('23d8b981ff174f159acad8f78fd7de91', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '142226199202252221', '姚江燕', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('243036c5c90240138eaa30bca2846055', 99, 0, 1452, 50, 0, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2178, 0, 0, '太原学院', '事业', '01', 10876, '074001', NULL, 8698, '142725198212090015', '畅鹏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2463c5a4cda34cfd893547962d5208b5', 99, 0, 1464, 50, 30, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2196, 0, 0, '太原学院', '事业', '01', 10918, '074001', NULL, 8722, '142430198205290021', '任金妮', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('247584232c814715bc4e33b856b396bb', 74, 0, 1201, 0, 0, 1925, 0, 1882, 2520, 1215, 0, 0, 0, 0, 1802, 0, 0, '太原学院', '事业', '01', 8817, '074001', NULL, 7015, '140104198109033710', '高磊', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('24b116a57ba04f37ae53ce3785bdee3d', 89, 0, 1046, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1569, 0, 0, '太原学院', '事业', '01', 8597, '074001', NULL, 7028, '14010719911012172X', '杨洋', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('24e9c7a475864ba4b9832a760c0283d5', 74, 0, 1126, 0, 30, 1925, 0, 1087, 2520, 1215, 0, 0, 0, 0, 1689, 0, 0, '太原学院', '事业', '01', 7977, '074001', NULL, 6288, '14010819891003161X', '张烜', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('24fd7e49bf0247a1a2e2fc2287a87b8b', 89, 0, 1215, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1823, 0, 0, '太原学院', '事业', '01', 8848, '074001', NULL, 7025, '142301199204240046', '程丽媛', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('25204b8563a44a68ba87508b3d1fb77a', 89, 0, 1327, 0, 30, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1991, 0, 0, '太原学院', '事业', '01', 9816, '074001', NULL, 7825, '140109198311100528', '周玮', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('252a4d3521624363b2eebca12c28100d', 89, 0, 1165, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1748, 0, 0, '太原学院', '事业', '01', 8604, '074001', NULL, 6856, '140602198711296016', '段海栋', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('25700f1bf4c947819b2ba1faaf3308bd', 89, 0, 1273, 0, 30, 2185, 0, 1427, 2660, 1418, 0, 0, 0, 0, 1910, 0, 0, '太原学院', '事业', '01', 9082, '074001', NULL, 7172, '500222199001164620', '樊艳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('25d8ef8157504975bb370c3fe671de6b', 89, 0, 1339, 0, 30, 2410, 0, 1789, 2660, 1418, 0, 0, 0, 0, 2009, 0, 0, '太原学院', '事业', '01', 9735, '074001', NULL, 7726, '142621198807120040', '王鑫', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('262e7f32ea0e459194f716e90de2d739', 99, 0, 1545, 0, 0, 3030, 0, 2689, 2730, 1540, 0, 0, 0, 0, 2318, 0, 0, '太原学院', '事业', '01', 11633, '074001', NULL, 9315, '142401197602057219', '郑红勇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('26568cbcc03b4be8a9b2a6a9d0fd8ea0', 89, 0, 1459, 0, 0, 2650, 0, 2689, 2660, 1418, 0, 0, 0, 0, 2189, 0, 0, '太原学院', '事业', '01', 10965, '074001', NULL, 8776, '14010219750120517X', '孙刚平', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('26c9e5a698404906b2d41f769d5ffe01', 99, 0, 1558, 50, 30, 3260, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2337, 0, 0, '太原学院', '事业', '01', 11542, '074001', NULL, 9205, '140624197803201022', '刘慧琴', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('26f08f6f8e7544cf8c5ba31fb0ab55a0', 89, 0, 1250, 0, 30, 2185, 0, 1515, 2660, 1418, 0, 0, 0, 0, 1875, 0, 0, '太原学院', '事业', '01', 9147, '074001', NULL, 7272, '140107198809294523', '任超', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('26fd57b328034114810c41fe483f9797', 74, 0, 1108, 0, 0, 1925, 0, 1169, 2520, 1215, 0, 0, 0, 0, 1662, 0, 0, '太原学院', '事业', '01', 8011, '074001', NULL, 6349, '142333199112191815', '马驰洋', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('26ffdd9742c4458788b6518a7268e6e4', 99, 0, 1592, 0, 30, 3260, 0, 2796, 2730, 1540, 0, 0, 0, 0, 2388, 0, 0, '太原学院', '事业', '01', 12047, '074001', NULL, 9659, '14052219760721002X', '孙艳平', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2707414eb92c4871a4e6e260bb0256ef', 99, 0, 1495, 0, 0, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2243, 0, 0, '太原学院', '事业', '01', 10969, '074001', NULL, 8726, '420623198209054053', '田川', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('273f7c6320be4108843a8cd6b8f9f3eb', 69, 0, 1293, 0, 0, 2260, 0, 1954, 2590, 1365, 0, 0, 0, 0, 1940, 0, 0, '太原学院', '事业', '01', 9531, '074001', NULL, 7591, '140426197708234434', '江志强', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('279dba4b7a854aadba840ccfc32697c9', 69, 4, 1223, 0, 0, 1940, 0, 1954, 2520, 1194, 0, 0, 0, 0, 1835, 0, 0, '太原学院', '事业', '01', 8904, '074001', NULL, 7069, '14010219700426403X', '秦建军', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('27d6a4a651c844bf81debaf4921752ba', 99, 0, 1698, 0, 0, 3260, 0, 3641, 2730, 1540, 0, 0, 0, 0, 2547, 0, 0, '太原学院', '事业', '01', 12968, '074001', NULL, 10421, '142325197105030010', '张晋军', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('27f199aac0604889975a53e81a716522', 94, 0, 1642, 0, 30, 3455, 0, 2375, 2800, 1810, 0, 0, 0, 0, 2463, 0, 0, '太原学院', '事业', '01', 12206, '074001', NULL, 9743, '140103198002160641', '赵霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('282034f3190a48c7b27038d0db4bb1f2', 89, 0, 1215, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1823, 0, 0, '太原学院', '事业', '01', 8654, '074001', NULL, 6831, '142601199408118516', '李锋锋', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('287f8ae9597642d4a5bee951e4c12172', 99, 0, 1622, 0, 30, 3260, 0, 3026, 2730, 1540, 0, 0, 0, 0, 2433, 0, 0, '太原学院', '事业', '01', 12307, '074001', NULL, 9874, '142322197303280521', '刘娟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('288524fc80a745bd88ab0df753925d60', 74, 0, 1081, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1622, 0, 0, '太原学院', '事业', '01', 7779, '074001', NULL, 6157, '140105199703210047', '郝丽璋', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('288bfd792d9b4c948f7595f160b56672', 99, 0, 1481, 50, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2222, 0, 0, '太原学院', '事业', '01', 11135, '074001', NULL, 8913, '142725198108025627', '贾哲', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('289dad74db1d43edaa9874cd11fd2d21', 99, 0, 1443, 0, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2165, 0, 0, '太原学院', '事业', '01', 10754, '074001', NULL, 8589, '140411197809113629', '苏银', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('28ac147127a44bc7b5a19450e0f15ff3', 99, 0, 1648, 0, 30, 3260, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2472, 0, 0, '太原学院', '事业', '01', 12448, '074001', NULL, 9976, '140104197209100824', '李瑾', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('28cd704e27f24d788adaaf308e414a58', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '140109199611122547', '刘嘉乐', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('28ec05a4418f4873bf7a1664d5a56458', 89, 0, 1227, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1841, 0, 0, '太原学院', '事业', '01', 8948, '074001', NULL, 7107, '14042319930207002X', '李林', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('290f49b0412545a0b7c7784f2e03e6a5', 79, 0, 1244, 50, 30, 2200, 0, 1696, 2590, 1292, 0, 0, 0, 0, 1866, 0, 0, '太原学院', '事业', '01', 9181, '074001', NULL, 7315, '142723198409043025', '任芬', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('291f8bb9af424922b7d9ccd30b7dadf3', 99, 0, 1503, 0, 30, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2255, 0, 0, '太原学院', '事业', '01', 11207, '074001', NULL, 8952, '140112198110101303', '梁丽娜', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('29302934119d48d1a62f85e5344e7bc2', 104, 0, 1800, 0, 0, 4640, 0, 2275, 2940, 1908, 0, 0, 0, 0, 2700, 0, 0, '太原学院', '事业', '01', 13667, '074001', NULL, 10967, '142301198003266018', '温明军', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2967a7b41965400c88142692895a4e1b', 89, 0, 1177, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1766, 0, 0, '太原学院', '事业', '01', 8534, '074001', NULL, 6768, '140402199603160430', '赵严', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('29c6156e27fb4f95aa430f4b66850848', 89, 0, 1458, 0, 30, 2650, 0, 2582, 2660, 1418, 0, 0, 0, 0, 2187, 0, 0, '太原学院', '事业', '01', 10887, '074001', NULL, 8700, '142429197809140024', '张玲', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('29da296e7a914b0184f430b922e0ec64', 74, 0, 1081, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1622, 0, 0, '太原学院', '事业', '01', 7779, '074001', NULL, 6157, '142201199508229027', '白雪莲', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('29dc3a767391485390c8483d8788c2dd', 99, 0, 1632, 50, 30, 3030, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2448, 0, 0, '太原学院', '事业', '01', 12252, '074001', NULL, 9804, '142622197411162027', '王宏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('29ef58bf8ab14bb498d621b3a159cf42', 99, 0, 1551, 50, 30, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2327, 0, 0, '太原学院', '事业', '01', 11505, '074001', NULL, 9178, '142427197802283329', '李小芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2a55685ccb41440a992277d0476ebb44', 89, 0, 1261, 0, 30, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1892, 0, 0, '太原学院', '事业', '01', 9246, '074001', NULL, 7354, '142729198905110643', '温月', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2a73eeadae9948a48f6f484477b58666', 99, 0, 1504, 50, 0, 3030, 0, 2375, 2730, 1540, 0, 0, 0, 0, 2256, 0, 0, '太原学院', '事业', '01', 11328, '074001', NULL, 9072, '140103197910300617', '李毅华', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2a860afa446442b6bfe75b1701f65734', 89, 0, 1391, 50, 30, 2410, 0, 2375, 2660, 1418, 0, 0, 0, 0, 2087, 0, 0, '太原学院', '事业', '01', 10423, '074001', NULL, 8336, '140102197909165124', '李新艺', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2ab8d6e2b8144a9e879b09bff5e63296', 99, 0, 1767, 0, 30, 3810, 0, 3516, 2730, 1540, 0, 0, 0, 0, 2651, 0, 0, '太原学院', '事业', '01', 13492, '074001', NULL, 10841, '140102197108110641', '康丽军', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2ad84727ea744b508ed9544c4e89482e', 89, 0, 1396, 50, 0, 2185, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2094, 0, 0, '太原学院', '事业', '01', 10273, '074001', NULL, 8179, '140104197402281735', '李晓峰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2b08869b5755486ba732a0058396f23e', 89, 0, 1054, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1581, 0, 0, '太原学院', '事业', '01', 8523, '074001', NULL, 6942, '142422199407212421', '程升彦', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2b319a70c8bb4ebe9e3a9d33f393421b', 89, 0, 1250, 0, 30, 2185, 0, 1515, 2660, 1418, 0, 0, 0, 0, 1875, 0, 0, '太原学院', '事业', '01', 9147, '074001', NULL, 7272, '141102198812220049', '马潇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2b61ec06612c4686b52d4773e3345b6e', 74, 0, 1121, 0, 30, 1925, 0, 1005, 2520, 1215, 0, 0, 0, 0, 1682, 0, 0, '太原学院', '事业', '01', 7890, '074001', NULL, 6208, '140224199512159343', '康玲瑞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2b7ad41101c74d729d8b30a53876ae9a', 89, 0, 1404, 0, 30, 2410, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2106, 0, 0, '太原学院', '事业', '01', 10486, '074001', NULL, 8380, '142622197807160028', '裴嵘军', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2ba25d58f5e8481492b612972ba14c2a', 89, 0, 1177, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1766, 0, 0, '太原学院', '事业', '01', 8534, '074001', NULL, 6768, '141181199411090052', '李奇泽', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2c421dcf099146d4975fd54092f15454', 99, 5, 1888, 0, 0, 3810, 0, 4481, 2730, 1540, 0, 0, 0, 0, 2832, 0, 0, '太原学院', '事业', '01', 14553, '074001', NULL, 11721, '14010319651116211X', '李海林', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2d0df7b585e546f48fa311f642faaab8', 89, 0, 1404, 0, 30, 2410, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2106, 0, 0, '太原学院', '事业', '01', 10486, '074001', NULL, 8380, '140121197707139525', '张慧玲', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2d1671767a2947f99c4499d21b09d0c4', 89, 0, 1308, 0, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1962, 0, 0, '太原学院', '事业', '01', 9572, '074001', NULL, 7610, '142629198403071044', '陕倩倩', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2d3f5c72986f4958a9b032d9ccc1cbec', 74, 0, 1087, 0, 0, 1925, 0, 1005, 2520, 1215, 0, 0, 0, 0, 1631, 0, 0, '太原学院', '事业', '01', 7826, '074001', NULL, 6195, '140421199309231217', '史彦鑫', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2d63e26227fb4018ad4e8b70b006ecfe', 89, 0, 1294, 0, 0, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1941, 0, 0, '太原学院', '事业', '01', 9528, '074001', NULL, 7587, '142601198410101938', '杨锐', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2d63e7741c7245e182b63bb173023f90', 89, 0, 1270, 0, 0, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1905, 0, 0, '太原学院', '事业', '01', 9318, '074001', NULL, 7413, '140109198702060017', '李之光', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2dcb866f9001419fac0019b4ced1b17c', 89, 0, 1441, 0, 0, 2650, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2162, 0, 0, '太原学院', '事业', '01', 10733, '074001', NULL, 8571, '140102197904141430', '朱震峰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2e16234b325443cbba6eb5bedfd02bae', 89, 0, 1314, 0, 30, 2410, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1971, 0, 0, '太原学院', '事业', '01', 9710, '074001', NULL, 7739, '140105198201051846', '张金萍', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2e1873bf0d944c8ab018edc1faf3513f', 89, 0, 1365, 50, 30, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2048, 0, 0, '太原学院', '事业', '01', 10197, '074001', NULL, 8149, '140311198109163325', '郭燕燕', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2e601cf300c840caa335c1d7afcadc8d', 89, 0, 1233, 0, 0, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1850, 0, 0, '太原学院', '事业', '01', 8924, '074001', NULL, 7074, '370882199011054710', '滕宇帆', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2e660411a36f43b386e4481cdfb4a3d7', 89, 0, 1404, 50, 30, 2410, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2106, 0, 0, '太原学院', '事业', '01', 10536, '074001', NULL, 8430, '142625197602224621', '张颖娟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2eb6af86c7e54f7c8aded764a6800900', 69, 0, 1180, 0, 30, 1925, 0, 1696, 2520, 1215, 0, 0, 0, 0, 1770, 0, 0, '太原学院', '事业', '01', 8635, '074001', NULL, 6865, '320324198206184481', '张晓艳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2ef821fd08e64a5eae9cbc3cc314d5b4', 89, 0, 1374, 0, 30, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2061, 0, 0, '太原学院', '事业', '01', 10156, '074001', NULL, 8095, '142323197909190244', '王丽桃', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('2f42c52662c64a2c8d9991a2924b1269', 99, 0, 1585, 0, 30, 3260, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2378, 0, 0, '太原学院', '事业', '01', 11719, '074001', NULL, 9341, '140426197704040026', '张艳永', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('302613fdef7a48e7ab7baf1c8eea9445', 89, 3.9, 1587, 0, 0, 2410, 0, 3641, 2660, 1418, 0, 0, 0, 0, 2381, 0, 0, '太原学院', '事业', '01', 11808.9, '074001', NULL, 9427.9, '140105196606033719', '王作印', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3056005c5f134f829db0e6cc088e3c53', 99, 0, 1578, 0, 30, 3260, 0, 2689, 2730, 1540, 0, 0, 0, 0, 2367, 0, 0, '太原学院', '事业', '01', 11926, '074001', NULL, 9559, '142321197502070029', '刘柯', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('30712fbd57de4bf9a3438e5d507146e5', 89, 0, 1285, 0, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1928, 0, 0, '太原学院', '事业', '01', 9456, '074001', NULL, 7528, '142431198610120081', '赵娟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3098d785945a4f9c963484517e3c4250', 69, 0, 1257, 50, 30, 2260, 0, 1457, 2590, 1365, 0, 0, 0, 0, 1886, 0, 0, '太原学院', '事业', '01', 9078, '074001', NULL, 7192, '142603198207101046', '李敏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('309e18ced903489ba12eae64c0542c6d', 99, 0, 1373, 0, 30, 3030, 0, 1339, 2730, 1540, 0, 0, 0, 0, 2060, 0, 0, '太原学院', '事业', '01', 10141, '074001', NULL, 8081, '142731199108205726', '安燕燕', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('30a14aa7c6df488bb8e5aff1c07082d0', 99, 0, 1315, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 1973, 0, 0, '太原学院', '事业', '01', 10869, '074001', NULL, 8896, '142321197902160023', '梁丽', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('30e1f8e6fe0a4fd29b07a0aaee1dd4f8', 89, 0, 1335, 0, 30, 2185, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2003, 0, 0, '太原学院', '事业', '01', 9892, '074001', NULL, 7889, '140102198107251420', '李陶琳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('30ff5e4a758d418ebd568f68c2691c07', 99, 3.8, 1670, 0, 30, 3260, 0, 3391, 2730, 1540, 0, 0, 0, 0, 2505, 0, 0, '太原学院', '事业', '01', 12723.8, '074001', NULL, 10218.8, '140103197005150663', '王宝红', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('310589f6b42346dd8d405254d42b42a2', 99, 0, 1521, 0, 0, 3260, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2282, 0, 0, '太原学院', '事业', '01', 11425, '074001', NULL, 9143, '142702197911295512', '忽江华', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3122c39a71144cb9aebbcb35b98a7311', 99, 3.9, 1633, 0, 30, 3030, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2450, 0, 0, '太原学院', '事业', '01', 12331.9, '074001', NULL, 9881.9, '140102197005312048', '马俊文', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('318742cf8fa2481d8c9d5dbcf2272a30', 89, 0, 1486, 0, 0, 2410, 0, 3141, 2660, 1418, 0, 0, 0, 0, 2229, 0, 0, '太原学院', '事业', '01', 11204, '074001', NULL, 8975, '142402197206120032', '王启军', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('31ae8280417a4088a4b74bf1997aadb0', 89, 0, 1188, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1782, 0, 0, '太原学院', '事业', '01', 8545, '074001', NULL, 6763, '140303199402081614', '张梁', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('323eb836f2684096b819956bb656e092', 89, 0, 1327, 0, 30, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1991, 0, 0, '太原学院', '事业', '01', 9816, '074001', NULL, 7825, '140122198410230126', '吴海丽', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('324c17da21c047bd95152aa2ad88c028', 99, 0, 1859, 0, 30, 3810, 0, 4201, 2730, 1540, 0, 0, 0, 0, 2789, 0, 0, '太原学院', '事业', '01', 14269, '074001', NULL, 11480, '142231196802250104', '任红兵', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('324c4f6ea5d54265a83dc21b23eb7d41', 64, 0, 991, 0, 0, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1487, 0, 0, '太原学院', '事业', '01', 8083, '074001', NULL, 6596, '140622198810043319', '曹世楠', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('32a03c34bb8b4ad6aad0ce942c8192ff', 89, 0, 1491, 0, 30, 2650, 0, 2911, 2660, 1418, 0, 0, 0, 0, 2237, 0, 0, '太原学院', '事业', '01', 11249, '074001', NULL, 9012, '140102197407051426', '陈琍', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('33538bba1f6f4c54a9112940009eac46', 89, 0, 1191, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1787, 0, 0, '太原学院', '事业', '01', 8660, '074001', NULL, 6873, '140106199506081828', '郝晴', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('339cbef15916405ba54ba4668c350c16', 74, 0, 1271, 0, 30, 1950, 0, 2175, 2520, 1215, 0, 0, 0, 0, 1907, 0, 0, '太原学院', '事业', '01', 9235, '074001', NULL, 7328, '142701198006180924', '许琴', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('33ba7d0bc57f4a418ab8380fd8bbea9c', 74, 0, 1133, 0, 0, 1925, 0, 1169, 2520, 1215, 0, 0, 0, 0, 1700, 0, 0, '太原学院', '事业', '01', 8036, '074001', NULL, 6336, '140423199201032016', '赵晋', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('33ce2c22be25461f9a9bbb2578107465', 74, 0, 1101, 0, 30, 1925, 0, 1087, 2520, 1215, 0, 0, 0, 0, 1652, 0, 0, '太原学院', '事业', '01', 7952, '074001', NULL, 6300, '140121199406302586', '董佳榕', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('33e67dcc971f4fc0a492c3bd321ab144', 89, 0, 1447, 0, 30, 2650, 0, 2375, 2660, 1418, 0, 0, 0, 0, 2171, 0, 0, '太原学院', '事业', '01', 10669, '074001', NULL, 8498, '142603197807163027', '杨雪琴', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('33ea456ada80478d974177ab1a18e653', 99, 0, 1517, 0, 0, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2276, 0, 0, '太原学院', '事业', '01', 11391, '074001', NULL, 9115, '142431197712294854', '侯培文', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('340a14ea337c473bb5fe70878e1a18f1', 89, 0, 1252, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1878, 0, 0, '太原学院', '事业', '01', 8973, '074001', NULL, 7095, '140121199109130829', '王茹', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3421a678a68349bfa4003dfd5fc5c7b3', 89, 0, 1485, 0, 30, 2650, 0, 2796, 2660, 1418, 0, 0, 0, 0, 2228, 0, 0, '太原学院', '事业', '01', 11128, '074001', NULL, 8900, '140202197505124022', '孙红', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('349c0920b5ae4b459f4749c049f4448f', 99, 0, 1662, 0, 30, 3260, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2493, 0, 0, '太原学院', '事业', '01', 12462, '074001', NULL, 9969, '140104197311241762', '陈晋萍', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('34c152345e374d4f932ff2b90f363aa5', 74, 0, 1244, 0, 30, 1950, 0, 2075, 2520, 1215, 0, 0, 0, 0, 1866, 0, 0, '太原学院', '事业', '01', 9108, '074001', NULL, 7242, '140224198012100084', '杜慧芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('352d7df6a11e4716a0c4d3db4aa3ccb9', 69, 0, 1226, 0, 0, 1830, 0, 2221, 2450, 1176, 0, 0, 0, 0, 1839, 0, 0, '太原学院', '事业', '01', 8972, '074001', NULL, 7133, '142131197112195514', '马树国', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('362aa730effa44bab660c8b0fe70b531', 89, 0, 1215, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1823, 0, 0, '太原学院', '事业', '01', 8848, '074001', NULL, 7025, '142332199108243620', '许改云', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('36849495bd674e6194a4c4508f00b663', 89, 0, 1309, 50, 30, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 1964, 0, 0, '太原学院', '事业', '01', 9716, '074001', NULL, 7752, '14030219820829042X', '鲍芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('36916c2b0edc403f8a86d718a5d054d6', 79, 0, 1340, 0, 0, 2520, 0, 1882, 2660, 1383, 0, 0, 0, 0, 2010, 0, 0, '太原学院', '事业', '01', 9864, '074001', NULL, 7854, '140108197808270038', '王飞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('36c2227f11854c128903edff4b5fc0d8', 99, 0, 1490, 50, 0, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2235, 0, 0, '太原学院', '事业', '01', 11014, '074001', NULL, 8779, '142726198204061579', '权英杰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('374e9656560947d4bfd6198a1448986c', 99, 0, 1592, 0, 30, 3260, 0, 2796, 2730, 1540, 0, 0, 0, 0, 2388, 0, 0, '太原学院', '事业', '01', 12047, '074001', NULL, 9659, '142401197604055524', '赵俊萍', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('374efa7984874cbfa024f8d5cacf8ec7', 64, 0, 975, 0, 0, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1463, 0, 0, '太原学院', '事业', '01', 8067, '074001', NULL, 6604, '140107199408263317', '靖秉翰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('37648a59dd62441886c86450265d8bf9', 99, 0, 1550, 0, 30, 3260, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2325, 0, 0, '太原学院', '事业', '01', 11684, '074001', NULL, 9359, '140104197708152223', '任洁', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3787e3ce1c5544228079dea7511cddcc', 94, 0, 1645, 0, 0, 3455, 0, 2475, 2800, 1810, 0, 0, 0, 0, 2468, 0, 0, '太原学院', '事业', '01', 12279, '074001', NULL, 9811, '142431197606271536', '雷恒平', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('37aeba8b259b4500885e433f615f6ad9', 89, 0, 1214, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1821, 0, 0, '太原学院', '事业', '01', 8765, '074001', NULL, 6944, '142623199408194322', '杨惠惠', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('37d9d72262ee40a09dd8db631f2a3eec', 99, 0, 1468, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2202, 0, 0, '太原学院', '事业', '01', 11022, '074001', NULL, 8820, '140107198208180627', '柴晓星', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('380895e723804ef5a02881715ecf9895', 89, 0, 1329, 0, 0, 2185, 0, 2175, 2660, 1418, 0, 0, 0, 0, 1994, 0, 0, '太原学院', '事业', '01', 9856, '074001', NULL, 7862, '140104198009280378', '刘乐澄', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3846c1a378b740a0ba3a3121bfe8df50', 99, 0, 1491, 0, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2237, 0, 0, '太原学院', '事业', '01', 11095, '074001', NULL, 8858, '140102198201256527', '徐杨', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3846e67dc951449c9083a2ab98e971af', 89, 0, 1428, 0, 0, 2410, 0, 2689, 2660, 1418, 0, 0, 0, 0, 2142, 0, 0, '太原学院', '事业', '01', 10694, '074001', NULL, 8552, '140121197405015519', '吴瑞勇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('38d4a137c78c4392824e3f17418c0884', 74, 0, 1072, 0, 30, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1608, 0, 0, '太原学院', '事业', '01', 7699, '074001', NULL, 6091, '142601199509062822', '张圻宁', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('38dc22974e284081abf17e80c61ae163', 79, 0, 1268, 50, 30, 2200, 0, 1882, 2590, 1292, 0, 0, 0, 0, 1902, 0, 0, '太原学院', '事业', '01', 9391, '074001', NULL, 7489, '140521198206023627', '王远芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('38e10d9b85234a63921753539c6ca16a', 89, 0, 1227, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1841, 0, 0, '太原学院', '事业', '01', 8948, '074001', NULL, 7107, '140107199208100046', '关欣', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('391ed33d0af044b79a2c3412fa797e28', 89, 0, 1273, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1910, 0, 0, '太原学院', '事业', '01', 9351, '074001', NULL, 7441, '142325198606210022', '李楠', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('398d2ac95c654b2b9c409050489eed2e', 74, 0, 1192, 0, 30, 1925, 0, 1789, 2520, 1215, 0, 0, 0, 0, 1788, 0, 0, '太原学院', '事业', '01', 8745, '074001', NULL, 6957, '140402198302100421', '张敏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('39bc240eb82f468eb5b76f0561c2b9c1', 79, 0, 1293, 50, 30, 2200, 0, 2075, 2590, 1292, 0, 0, 0, 0, 1940, 0, 0, '太原学院', '事业', '01', 9609, '074001', NULL, 7669, '142729198008171243', '张亚丽', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('39ce19c8477b4dc0acb984c465354dfa', 99, 0, 1526, 0, 0, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2289, 0, 0, '太原学院', '事业', '01', 11400, '074001', NULL, 9111, '142702197604243018', '徐东亮', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('39d00af5b5b148fb823cd86e60bd09b1', 79, 0, 1302, 0, 0, 2200, 0, 1975, 2590, 1292, 0, 0, 0, 0, 1953, 0, 0, '太原学院', '事业', '01', 9438, '074001', NULL, 7485, '140103197706270676', '王江浩', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('39eb2af4fd994f5ca4532978359e72f0', 99, 0, 1592, 0, 30, 3260, 0, 2796, 2730, 1540, 0, 0, 0, 0, 2388, 0, 0, '太原学院', '事业', '01', 12047, '074001', NULL, 9659, '140511197203166342', '王红梅', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3a2a824ec98d43d889c7682a7b50b3ca', 99, 0, 1373, 0, 30, 3030, 0, 1339, 2730, 1540, 0, 0, 0, 0, 2060, 0, 0, '太原学院', '事业', '01', 10141, '074001', NULL, 8081, '140226199206103045', '王军丽', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3a5ff2e8f7ca41eba38d61097a8d271e', 99, 0, 1592, 0, 30, 3260, 0, 2796, 2730, 1540, 0, 0, 0, 0, 2388, 0, 0, '太原学院', '事业', '01', 12047, '074001', NULL, 9659, '142601197710031922', '赵平', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3a7f4b39c17a4c70a484e00ec458cc92', 89, 0, 1359, 50, 0, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2039, 0, 0, '太原学院', '事业', '01', 10061, '074001', NULL, 8022, '140603198008161618', '刘巧', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3a92d0b30f9942f58b80f24ede2aacad', 74, 0, 1081, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1622, 0, 0, '太原学院', '事业', '01', 7779, '074001', NULL, 6157, '140110199701172041', '吴晓莉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3a9726bd6f7c4babb1356a1b20255620', 89, 0, 1332, 0, 0, 2185, 0, 2175, 2660, 1418, 0, 0, 0, 0, 1998, 0, 0, '太原学院', '事业', '01', 9859, '074001', NULL, 7861, '140102197808301414', '李波', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3abf777694c44953803414e7bc0e3cd7', 69, 0, 1158, 0, 0, 1940, 0, 1457, 2520, 1194, 0, 0, 0, 0, 1737, 0, 0, '太原学院', '事业', '01', 8338, '074001', NULL, 6601, '372925197703216515', '时维教', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3ad241d8e325419c97895fad99b4e2b0', 89, 0, 1270, 0, 0, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1905, 0, 0, '太原学院', '事业', '01', 9318, '074001', NULL, 7413, '440981198410086173', '钟宝', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3ad464527a5d4d1495394023e75adb74', 99, 0, 1491, 50, 0, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2237, 0, 0, '太原学院', '事业', '01', 11215, '074001', NULL, 8978, '140103198005221518', '杜宾', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3ae82b28381543eeaa1463a97a0417b8', 99, 0, 1428, 0, 30, 3030, 0, 1696, 2730, 1540, 0, 0, 0, 0, 2142, 0, 0, '太原学院', '事业', '01', 10553, '074001', NULL, 8411, '140121198611110642', '张静', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3af5aa74032240049ab86c45f7d7991b', 99, 0, 1420, 0, 0, 3030, 0, 1603, 2730, 1540, 0, 0, 0, 0, 2130, 0, 0, '太原学院', '事业', '01', 10422, '074001', NULL, 8292, '140105198706030530', '张帅', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3affe9fd7da84f34a15df4f992c8a9f3', 89, 0, 1328, 0, 0, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1992, 0, 0, '太原学院', '事业', '01', 9755, '074001', NULL, 7763, '140202198002146013', '李海', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3b02c8e245c64dd98f562d01dce14e77', 89, 0, 1377, 50, 30, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2066, 0, 0, '太原学院', '事业', '01', 10109, '074001', NULL, 8043, '140104198107255029', '杨婷', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3b3c010edf6844f5bfa54afb2f8e266d', 89, 0, 1340, 0, 30, 2410, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2010, 0, 0, '太原学院', '事业', '01', 9922, '074001', NULL, 7912, '140105198311071928', '王晓炜', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3ba19cef65f541ff9919abc58f5be611', 99, 0, 1468, 0, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2202, 0, 0, '太原学院', '事业', '01', 10972, '074001', NULL, 8770, '140104198102202227', '陈黎', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3bbe9bbc58614fa2955d9c048c480a7e', 89, 0, 1417, 0, 30, 2410, 0, 2582, 2660, 1418, 0, 0, 0, 0, 2126, 0, 0, '太原学院', '事业', '01', 10606, '074001', NULL, 8480, '140102197712140628', '杨海丽', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3bd215b077654d8bb537184850671ba3', 99, 0, 1478, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2217, 0, 0, '太原学院', '事业', '01', 11032, '074001', NULL, 8815, '140103198012060628', '赵志星', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3c3a1d802beb4f318aab31be006a0fda', 89, 0, 1522, 0, 0, 2650, 0, 2911, 2660, 1418, 0, 0, 0, 0, 2283, 0, 0, '太原学院', '事业', '01', 11250, '074001', NULL, 8967, '140102197211290038', '冉志钢', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3c650065f82b493fae1d3c27a853738a', 94, 3.6, 1599, 0, 30, 2880, 0, 3026, 2730, 1551, 0, 0, 0, 0, 2399, 0, 0, '太原学院', '事业', '01', 11913.6, '074001', NULL, 9514.6, '140103196911152121', '罗玉萍', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3ce5068185ea4185a82e4604cc320a5d', 74, 0, 1258, 0, 30, 1950, 0, 2075, 2520, 1215, 0, 0, 0, 0, 1887, 0, 0, '太原学院', '事业', '01', 9122, '074001', NULL, 7235, '14031119810920182X', '张瑞芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3e3d46ae09834699985adbb888da71b3', 89, 0, 1191, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1787, 0, 0, '太原学院', '事业', '01', 8660, '074001', NULL, 6873, '140105199409200024', '张羽翔', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3e5677b155bb42bcbb0195cc3d5a6da8', 89, 0, 1378, 0, 30, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2067, 0, 0, '太原学院', '事业', '01', 10260, '074001', NULL, 8193, '142625197804221664', '史云青', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3e9709c07feb48ff8639b05c109ef637', 89, 0, 1243, 0, 0, 2185, 0, 1515, 2660, 1418, 0, 0, 0, 0, 1865, 0, 0, '太原学院', '事业', '01', 9110, '074001', NULL, 7245, '140106198407171217', '董哲宇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3eebd5fcfd7e4bcb8d7d1565a14c5bb3', 89, 0, 1386, 50, 30, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2079, 0, 0, '太原学院', '事业', '01', 10118, '074001', NULL, 8039, '140109198310110521', '贾云洁', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3ef498653fee42e2a9214b6ce7808aeb', 89, 0, 1282, 50, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1923, 0, 0, '太原学院', '事业', '01', 9410, '074001', NULL, 7487, '142401198409081422', '孟洪玉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3f05ede473fe4ea58e1f00bf0bf69e1b', 99, 0, 1421, 50, 0, 3030, 0, 1789, 2730, 1540, 0, 0, 0, 0, 2132, 0, 0, '太原学院', '事业', '01', 10659, '074001', NULL, 8527, '41058119831013605X', '郭元伟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3f319499b43f44b7aec58575f57dc83a', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '140212199612032483', '赵登婕', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3f5ab92b7c904633af860f46fc8fef8a', 74, 0, 1259, 0, 30, 1950, 0, 2275, 2520, 1215, 0, 0, 0, 0, 1889, 0, 0, '太原学院', '事业', '01', 9323, '074001', NULL, 7434, '140103198003231229', '岳莉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3f6acf984a6c41699fac1865317aec5b', 74, 0, 1103, 0, 0, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1655, 0, 0, '太原学院', '事业', '01', 7700, '074001', NULL, 6045, '142332199605230011', '乔剑', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('3fdce79dd76246c0bdd5f54e02e983e4', 99, 0, 1549, 50, 30, 3260, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2324, 0, 0, '太原学院', '事业', '01', 11533, '074001', NULL, 9209, '140311197803183620', '侯海霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('4040ecc58ffb4541987f2808b3cea578', 99, 0, 1495, 50, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2243, 0, 0, '太原学院', '事业', '01', 11149, '074001', NULL, 8906, '140102198007081428', '赵霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('409a1b24ca0e416fb36cd6ae9e80ec54', 89, 0, 1198, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1797, 0, 0, '太原学院', '事业', '01', 8637, '074001', NULL, 6840, '140107199206202612', '伦默如', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('40c931966bb04a4b9065ae349ffe0cf0', 74, 0, 1079, 0, 0, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1619, 0, 0, '太原学院', '事业', '01', 7676, '074001', NULL, 6057, '140411199403040457', '刘洋', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('410ea9e1330a40ba9b3b1e003df34bbc', 89, 0, 1307, 0, 0, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1961, 0, 0, '太原学院', '事业', '01', 9448, '074001', NULL, 7487, '370832198509062314', '马成乡', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('413538b0c218459986e57f7c294f04dc', 89, 0, 1362, 0, 30, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2043, 0, 0, '太原学院', '事业', '01', 10044, '074001', NULL, 8001, '140502198410142288', '张丽娜', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('41ae629bb74c4769937d564a5d2bd2ab', 85, 4.2, 1097, 0, 0, 3110, 0, 3164, 0, 1629, 0, 0, 0, 0, 1646, 0, 0, '太原学院', '事业', '01', 9089.2, '074001', NULL, 7443.2, '140102196803162019', '张文虎', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('41af8a8794a249648fe5f338e1f01a83', 104, 0, 2181, 0, 0, 6070, 0, 3781, 2940, 1908, 0, 0, 0, 0, 3272, 0, 0, '太原学院', '事业', '01', 16984, '074001', NULL, 13712, '120225197210292070', '桂志国', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('41b8ae2aebe34364a3e96c51dfc0f407', 89, 0, 1391, 50, 30, 2410, 0, 2375, 2660, 1418, 0, 0, 0, 0, 2087, 0, 0, '太原学院', '事业', '01', 10423, '074001', NULL, 8336, '142222197810020024', '齐红霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('41d35834568d4c3fa55dc22e4b18f718', 89, 0, 1037, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1556, 0, 0, '太原学院', '事业', '01', 8394, '074001', NULL, 6838, '14112819930614001X', '刘勇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('420ab9f9c5b14cce9c3866eace893b9a', 89, 0, 1191, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1787, 0, 0, '太原学院', '事业', '01', 8660, '074001', NULL, 6873, '140202199507011522', '张跃坤', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('42222e7cdc134d9f83540c436f1194e7', 89, 0, 1205, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1808, 0, 0, '太原学院', '事业', '01', 8674, '074001', NULL, 6866, '140431199405303623', '雷丹玉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('422b4bb441db4872927239c221d800f7', 94, 0, 1441, 0, 30, 2880, 0, 2075, 2730, 1551, 0, 0, 0, 0, 2162, 0, 0, '太原学院', '事业', '01', 10801, '074001', NULL, 8639, '140311198212111726', '郑荣', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('42a02626d8a34f4b86502d222a10417d', 89, 0, 1286, 0, 30, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1929, 0, 0, '太原学院', '事业', '01', 9271, '074001', NULL, 7342, '421002198112051469', '刘静', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('42e75782976646f0aa54803109794a84', 99, 0, 1490, 0, 0, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2235, 0, 0, '太原学院', '事业', '01', 10964, '074001', NULL, 8729, '130402198103181538', '王卫涛', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('430d85e41d524396b5ab3442740d4f05', 89, 0, 1261, 0, 30, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1892, 0, 0, '太原学院', '事业', '01', 9246, '074001', NULL, 7354, '140107198711020620', '闫如玉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('434605aa05cd4a53b91a19a1222ef810', 99, 0, 1481, 0, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2222, 0, 0, '太原学院', '事业', '01', 11085, '074001', NULL, 8863, '142431198003246029', '武林芝', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('43e4e813aa7f46bbb72554ed7e99b2c6', 89, 0, 1285, 50, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1928, 0, 0, '太原学院', '事业', '01', 9506, '074001', NULL, 7578, '140106198412260660', '高君', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('442b0241b2a34697ab105bbb771a2f67', 99, 0, 1449, 0, 30, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2174, 0, 0, '太原学院', '事业', '01', 10853, '074001', NULL, 8679, '430922198305160042', '昌秦湘', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('4491d5dd9142473097ae7a0c1b8c648f', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '140106199109100626', '曹楚楚', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('44b03ef9123948b0adbe8518db112f65', 89, 0, 1435, 50, 30, 2650, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2153, 0, 0, '太原学院', '事业', '01', 10807, '074001', NULL, 8654, '140103197610034222', '苏敏静', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('44b26bae61fe44489f69747d34a778f5', 74, 0, 1116, 0, 30, 1925, 0, 1005, 2520, 1215, 0, 0, 0, 0, 1674, 0, 0, '太原学院', '事业', '01', 7885, '074001', NULL, 6211, '140411199512115243', '平思亮', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('44c70e0a682440278e621a3a3c42efe1', 99, 0, 1549, 50, 30, 3260, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2324, 0, 0, '太原学院', '事业', '01', 11533, '074001', NULL, 9209, '140103198001190021', '高丽霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('44e5419de2834bb183c219041297bcbd', 89, 0, 1537, 0, 30, 2650, 0, 3266, 2660, 1418, 0, 0, 0, 0, 2306, 0, 0, '太原学院', '事业', '01', 11650, '074001', NULL, 9344, '142602197110281027', '刘俊', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('4546d99cc38941938f7d78c55de07d61', 89, 0, 1309, 50, 30, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 1964, 0, 0, '太原学院', '事业', '01', 9716, '074001', NULL, 7752, '140402198308251247', '申羽佳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('458dfe4fd61f453a86a3756d214bbeaf', 99, 0, 1443, 0, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2165, 0, 0, '太原学院', '事业', '01', 10754, '074001', NULL, 8589, '522101198603070422', '潘婧', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('45a48f164fb34157901be5f1845c2a2d', 89, 0, 1345, 0, 0, 2185, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2018, 0, 0, '太原学院', '事业', '01', 9972, '074001', NULL, 7954, '142429197905012831', '岳林海', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('45ae964ad0604b52bcf2c41ed78fe9f5', 99, 0, 1493, 0, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2240, 0, 0, '太原学院', '事业', '01', 10997, '074001', NULL, 8757, '142631198009154927', '王燕丽', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('45cafb86b3834660b2166267b2c3037c', 89, 0, 1240, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1860, 0, 0, '太原学院', '事业', '01', 8873, '074001', NULL, 7013, '140423199305230826', '姚倬云', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('465df63f394d47969113f9230a4d9428', 89, 0, 1188, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1782, 0, 0, '太原学院', '事业', '01', 8545, '074001', NULL, 6763, '142225199704087012', '籍明慧', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('469db0d7aff94a0ebf3b5f83ed4e0c45', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '太原学院', '事业', '01', 0, '074001', NULL, 0, '140110198307071547', '韩婷婷', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('46e64e7e28d242f6bf1241f71d9c13a8', 89, 0, 1311, 0, 0, 2410, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1967, 0, 0, '太原学院', '事业', '01', 9677, '074001', NULL, 7710, '140202198501182035', '马涛', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('471806b1a112433696813d6bac175402', 89, 0, 1237, 0, 0, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1856, 0, 0, '太原学院', '事业', '01', 8840, '074001', NULL, 6984, '142431198908014812', '郭建忠', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('472a3a8c61a141869bbc9d92b4779b74', 69, 0, 1373, 0, 0, 2260, 0, 2503, 2590, 1365, 0, 0, 0, 0, 2060, 0, 0, '太原学院', '事业', '01', 10160, '074001', NULL, 8100, '140109196707270014', '王文斌', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('478de4a8291141339d98af85691478e4', 94, 0, 1761, 0, 0, 3455, 0, 3516, 2800, 1810, 0, 0, 0, 0, 2642, 0, 0, '太原学院', '事业', '01', 13436, '074001', NULL, 10794, '140102196601091216', '袁忍强', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('47a719d4f98d4232a067d8f9fe899296', 99, 0, 1468, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2202, 0, 0, '太原学院', '事业', '01', 11022, '074001', NULL, 8820, '140108198204031946', '史晓芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('47b548c9f2d14077ad82416bbfa70b43', 89, 0, 1205, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1808, 0, 0, '太原学院', '事业', '01', 8756, '074001', NULL, 6948, '140121199306203521', '高瑞娟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('47e2c4b51d7a4c11a8b1bd8e8a9665c7', 89, 0, 1285, 0, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1928, 0, 0, '太原学院', '事业', '01', 9456, '074001', NULL, 7528, '142431198811217541', '张静', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('47f35ba9f60d46a0a8fa3fa0ac7dd493', 74, 0, 1189, 0, 0, 1925, 0, 1789, 2520, 1215, 0, 0, 0, 0, 1784, 0, 0, '太原学院', '事业', '01', 8712, '074001', NULL, 6928, '140122198409090138', '赵晖', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('47fd263d2d924027acd6eed3b5daa60a', 74, 0, 1081, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1622, 0, 0, '太原学院', '事业', '01', 7779, '074001', NULL, 6157, '141122199604080061', '闫芷毓', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('48b49dcf33684165984311cae76db924', 99, 0, 1520, 50, 30, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2280, 0, 0, '太原学院', '事业', '01', 11474, '074001', NULL, 9194, '140103197808303387', '邵红红', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('48bf555cc95b46d181999dfafbc28355', 89, 0, 1297, 0, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1946, 0, 0, '太原学院', '事业', '01', 9561, '074001', NULL, 7615, '14022119860116006X', '张霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('48caf2434bae4f75bf7ff534f35e5ba6', 89, 0, 1213, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1820, 0, 0, '太原学院', '事业', '01', 8846, '074001', NULL, 7026, '140603198909175726', '张志平', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('48fa64f57ccd44b09da7825864b8e984', 99, 0, 1519, 50, 30, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2279, 0, 0, '太原学院', '事业', '01', 11273, '074001', NULL, 8994, '412728198211122526', '杨翠平', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('495cf262428d4eb5a679261bafd55739', 94, 0, 1565, 0, 0, 2880, 0, 2911, 2730, 1551, 0, 0, 0, 0, 2348, 0, 0, '太原学院', '事业', '01', 11731, '074001', NULL, 9383, '140102197204022318', '何炜', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('495e8293c28a4e019210ac184abeed23', 89, 0, 1322, 0, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1983, 0, 0, '太原学院', '事业', '01', 9779, '074001', NULL, 7796, '140103198108201528', '陈曦', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('498b045bed624b46aa65f3d8d1fd93af', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '142301199311010027', '王虹霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('49addea9c5d644e99374066f31c6dff2', 99, 3.9, 1738, 0, 30, 3260, 0, 3921, 2730, 1540, 0, 0, 0, 0, 2607, 0, 0, '太原学院', '事业', '01', 13321.9, '074001', NULL, 10714.9, '140102196812060727', '尚青', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('4a61472a764341388a6bb6d17297d6f9', 99, 0, 1536, 50, 30, 3260, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2304, 0, 0, '太原学院', '事业', '01', 11420, '074001', NULL, 9116, '140303197912050026', '冯晓媛', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('4a66887875a44ece9289ffb5a12cc741', 99, 4.6, 1846, 0, 30, 3810, 0, 4201, 2730, 1540, 0, 0, 0, 0, 2769, 0, 0, '太原学院', '事业', '01', 14260.6, '074001', NULL, 11491.6, '140102196605134842', '刘云芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('4aa3da4a7a17428197c168516c0bfc5e', 74, 0, 1145, 0, 30, 1925, 0, 1427, 2520, 1215, 0, 0, 0, 0, 1718, 0, 0, '太原学院', '事业', '01', 8336, '074001', NULL, 6618, '140109199003144224', '张阳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('4ad16eb6bfda4d2a927c07fafaf2038c', 74, 0, 1072, 0, 30, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1608, 0, 0, '太原学院', '事业', '01', 7699, '074001', NULL, 6091, '142732199509211621', '温瑶', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('4af8d2d9ce29419786df820919588b3f', 89, 0, 1297, 0, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1946, 0, 0, '太原学院', '事业', '01', 9561, '074001', NULL, 7615, '140109198603033021', '王娜', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('4b52b9b96cad49f796b0b97dc90770e9', 89, 0, 1319, 0, 0, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1979, 0, 0, '太原学院', '事业', '01', 9553, '074001', NULL, 7574, '140107198506153918', '刘刚', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('4b864d31a4cc4175ad553df8f851bfff', 74, 0, 1205, 0, 30, 1925, 0, 1882, 2520, 1215, 0, 0, 0, 0, 1808, 0, 0, '太原学院', '事业', '01', 8851, '074001', NULL, 7043, '140121198402290624', '张智娟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('4bca208b439a4827bb8f77cacce4bae2', 99, 0, 1637, 0, 30, 3260, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2456, 0, 0, '太原学院', '事业', '01', 12437, '074001', NULL, 9981, '14230219720911058X', '薛晓蓉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('4bd936cabfef45918a5ed2e00d28bf2c', 89, 0, 1205, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1808, 0, 0, '太原学院', '事业', '01', 8756, '074001', NULL, 6948, '140603199101111046', '李婧', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('4bfe8117a3264a56a7da0294336ef750', 89, 0, 1238, 0, 30, 2185, 0, 1427, 2660, 1418, 0, 0, 0, 0, 1857, 0, 0, '太原学院', '事业', '01', 9047, '074001', NULL, 7190, '141182198807130083', '王礼霄', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('4c403ff2675841419ba026f56c13f08d', 89, 0, 1334, 50, 30, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2001, 0, 0, '太原学院', '事业', '01', 9741, '074001', NULL, 7740, '14232219840619054X', '游翔', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('4cabbacd0ba94ed98ec44d113b54c03c', 99, 4, 1653, 0, 30, 3260, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2480, 0, 0, '太原学院', '事业', '01', 12582, '074001', NULL, 10102, '140202197007251029', '邢彦琴', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('4cbc54bca0ec4a3db5c01d740491f7ec', 89, 0, 1361, 0, 30, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 2042, 0, 0, '太原学院', '事业', '01', 9850, '074001', NULL, 7808, '140106198410110626', '田琳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('4d1721bea3064dc19f03671f52aaf5b3', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '14012119960125468X', '郝俊雪', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('4d9e2f47dabd44debe4a79817a35198b', 74, 0, 1157, 0, 30, 1925, 0, 1515, 2520, 1215, 0, 0, 0, 0, 1736, 0, 0, '太原学院', '事业', '01', 8436, '074001', NULL, 6700, '14112119890731002X', '师帅', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('4dd6b6d182f144faad79783c168c2132', 94, 0, 1600, 50, 0, 3455, 0, 2275, 2800, 1810, 0, 0, 0, 0, 2400, 0, 0, '太原学院', '事业', '01', 12084, '074001', NULL, 9684, '140102197806096533', '赵俊峰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('4e6a716b605d4f7a855e2c298c84e8d1', 99, 0, 1592, 0, 30, 3260, 0, 2796, 2730, 1540, 0, 0, 0, 0, 2388, 0, 0, '太原学院', '事业', '01', 12047, '074001', NULL, 9659, '142427197512241227', '王丽花', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('4e709f943eb34d2ca37407ce2c5aa358', 99, 0, 1592, 0, 30, 3030, 0, 3026, 2730, 1540, 0, 0, 0, 0, 2388, 0, 0, '太原学院', '事业', '01', 12047, '074001', NULL, 9659, '140431197303233629', '段鹏莉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('4f14b35a6d6b4b689fd11e47990d4b7e', 89, 0, 1027, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1541, 0, 0, '太原学院', '事业', '01', 8384, '074001', NULL, 6843, '220721199212152017', '梁喜龙', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('4f3acfb67f8e4629b03afe472e128c57', 89, 0, 1332, 0, 0, 2185, 0, 2175, 2660, 1418, 0, 0, 0, 0, 1998, 0, 0, '太原学院', '事业', '01', 9859, '074001', NULL, 7861, '140105198302030016', '张超', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('4f9d363b6c194983b3f332fbeaa0e767', 89, 0, 1383, 0, 30, 2185, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2075, 0, 0, '太原学院', '事业', '01', 10240, '074001', NULL, 8165, '142323197810290229', '张文娟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('4fb6cb23e09d4b499d8799f6dcd6e683', 99, 0, 1515, 0, 30, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2273, 0, 0, '太原学院', '事业', '01', 11219, '074001', NULL, 8946, '142623198011256121', '韩英', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('4fc6cd7cb9574d31bfb5e057265cd630', 89, 0, 1282, 50, 0, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1923, 0, 0, '太原学院', '事业', '01', 9473, '074001', NULL, 7550, '142423198501270611', '张元元', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('4fd9689ef88e43958aeb49d76f442f39', 79, 0, 1254, 50, 30, 2200, 0, 1696, 2590, 1292, 0, 0, 0, 0, 1881, 0, 0, '太原学院', '事业', '01', 9191, '074001', NULL, 7310, '14040219840908322X', '李洁琼', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('50201ba4ddb848618e8cb4aee64d06ec', 99, 3.5, 1636, 0, 0, 3030, 0, 3391, 2730, 1540, 0, 0, 0, 0, 2454, 0, 0, '太原学院', '事业', '01', 12429.5, '074001', NULL, 9975.5, '142223196712246718', '王利军', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5023c189f7ff4712afc32e739bd4ffa2', 89, 0, 1327, 50, 30, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1991, 0, 0, '太原学院', '事业', '01', 9866, '074001', NULL, 7875, '142301198410193127', '王兴华', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5064c71868fc4fc099f371cd0e5e2a22', 89, 0, 1339, 50, 30, 2410, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2009, 0, 0, '太原学院', '事业', '01', 9971, '074001', NULL, 7962, '140106198310193081', '韩菊', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5090ac59fd824500ac35cf2e684ac4ce', 89, 0, 1335, 0, 30, 2185, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2003, 0, 0, '太原学院', '事业', '01', 9892, '074001', NULL, 7889, '140103198012130622', '刘昕', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('50aa79286cda4af3a6dfb8db4d5d947f', 89, 0, 1235, 0, 0, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1853, 0, 0, '太原学院', '事业', '01', 8756, '074001', NULL, 6903, '140202199202295018', '康圆圆', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('50e9f04e1f1940b88c563f90e6b2ccf4', 99, 0, 1592, 0, 30, 3030, 0, 3026, 2730, 1540, 0, 0, 0, 0, 2388, 0, 0, '太原学院', '事业', '01', 12047, '074001', NULL, 9659, '140104197310110322', '刘永红', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('50f70eead118442c852760e165877c47', 99, 0, 1404, 0, 0, 3030, 0, 1603, 2730, 1540, 0, 0, 0, 0, 2106, 0, 0, '太原学院', '事业', '01', 10406, '074001', NULL, 8300, '14270119881025121X', '葛启隆', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('513ec05b48924410889e753096f3d7f2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 35000, '太原学院', '事业', '01', 35000, '074001', NULL, 35000, '140102196510140633', '兰贵亭', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('51497e647b56462f809a12d648dd23a4', 99, 0, 1498, 0, 0, 3030, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2247, 0, 0, '太原学院', '事业', '01', 12038, '074001', NULL, 9791, '140112197104011737', '韩伟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('517fbcd4a4f649489f00ffef6771f91b', 104, 0, 1857, 0, 30, 4640, 0, 2689, 2940, 1908, 0, 0, 0, 0, 2786, 0, 0, '太原学院', '事业', '01', 14168, '074001', NULL, 11382, '140102197610225161', '薛文艳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('51a406b1500b4119ab86d3db5ab3c94e', 89, 0, 1177, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1766, 0, 0, '太原学院', '事业', '01', 8534, '074001', NULL, 6768, '140402199510220414', '张圣都', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('51e54721bd32437e8d1269f0965919c1', 89, 0, 1334, 50, 30, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2001, 0, 0, '太原学院', '事业', '01', 9741, '074001', NULL, 7740, '140102198103231422', '李薇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5254e21464b44471bb4b2d259d0a2f8d', 89, 0, 1386, 50, 30, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2079, 0, 0, '太原学院', '事业', '01', 10118, '074001', NULL, 8039, '142232198106240469', '韩乐', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('52b23eec4cda40d08f7640eccf9fb708', 94, 0, 1686, 0, 30, 3455, 0, 2911, 2800, 1810, 0, 0, 0, 0, 2529, 0, 0, '太原学院', '事业', '01', 12786, '074001', NULL, 10257, '140102197711051420', '阎翔宇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('52c85f49605544fb9bda88a0940310ef', 89, 0, 1322, 0, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1983, 0, 0, '太原学院', '事业', '01', 9779, '074001', NULL, 7796, '142202198010040966', '丁会', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('52d940ba7ca041dea5309feffd98cecd', 79, 0, 1256, 0, 30, 2200, 0, 1789, 2590, 1292, 0, 0, 0, 0, 1884, 0, 0, '太原学院', '事业', '01', 9236, '074001', NULL, 7352, '140106198503101841', '郝艳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('530061a08f3a441e8810c0e55a6521ac', 94, 0, 1485, 0, 0, 2880, 0, 2375, 2730, 1551, 0, 0, 0, 0, 2228, 0, 0, '太原学院', '事业', '01', 11115, '074001', NULL, 8887, '142430197605180417', '雷明峰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5300a6bffe3945e98b9958f51430e495', 89, 0, 1037, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1556, 0, 0, '太原学院', '事业', '01', 8394, '074001', NULL, 6838, '320322199103104452', '张恩', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5317ff2341f34f679f1a50a57bd29f9d', 89, 0, 1384, 50, 0, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2076, 0, 0, '太原学院', '事业', '01', 10286, '074001', NULL, 8210, '140225197901234914', '白文江', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('532f1e939ec14cdf985b90442fc78707', 89, 0, 1322, 50, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1983, 0, 0, '太原学院', '事业', '01', 9829, '074001', NULL, 7846, '140107198203061223', '李美意', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5344e44e1ab140ab9645e82fc9279bcf', 94, 0, 1490, 0, 0, 3455, 0, 2075, 2800, 1810, 0, 0, 0, 0, 2235, 5320, 0, '太原学院', '事业', '01', 17044, '074001', '2025-07-01', 14809, '142701198209071250', '程明', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5478ab388d974f4096476559025a9034', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '152627199506050020', '郭晓樱', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('54b428f6798c453196770d0f50593be6', 64, 0, 975, 0, 0, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1463, 0, 0, '太原学院', '事业', '01', 8067, '074001', NULL, 6604, '142301199606120338', '许泽海', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('552ae1f8f4064e32b6ff44f2e77d29b1', 89, 0, 1285, 0, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1928, 0, 0, '太原学院', '事业', '01', 9456, '074001', NULL, 7528, '140102198211022329', '温静', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5587117316794803aa809f5a3eb1266d', 89, 0, 1191, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1787, 0, 0, '太原学院', '事业', '01', 8630, '074001', NULL, 6843, '140108199011202811', '赵博', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('558b5c851cb14610a5f846b6ceab20a1', 74, 0, 1116, 0, 30, 1925, 0, 1005, 2520, 1215, 0, 0, 0, 0, 1674, 0, 0, '太原学院', '事业', '01', 7885, '074001', NULL, 6211, '140603199709219987', '孙泽利', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('55a016345a8f429d9b119e4d2b952c73', 94, 3.9, 1765, 0, 30, 3455, 0, 3516, 2800, 1810, 0, 0, 0, 0, 2648, 0, 0, '太原学院', '事业', '01', 13473.9, '074001', NULL, 10825.9, '140102196910023225', '魏晓红', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5606f2256b9d47408957c127d51d4e81', 99, 0, 1455, 0, 30, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2183, 0, 0, '太原学院', '事业', '01', 10859, '074001', NULL, 8676, '142636198308270022', '樊华', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('563ac73ef8c04c3c8f0158fc97d075aa', 74, 0, 1229, 50, 0, 1950, 0, 2075, 2520, 1215, 0, 0, 0, 0, 1844, 0, 0, '太原学院', '事业', '01', 9113, '074001', NULL, 7269, '140321197805010056', '郝振华', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('567242b30adb4cb98fc9426f833621fe', 99, 0, 1419, 50, 30, 3030, 0, 1696, 2730, 1540, 0, 0, 0, 0, 2129, 0, 0, '太原学院', '事业', '01', 10594, '074001', NULL, 8465, '142201197902029120', '刘会峰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('567a7556c2054b1aa62a89c56c04f80c', 89, 0, 1188, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1782, 0, 0, '太原学院', '事业', '01', 8627, '074001', NULL, 6845, '142301199306100036', '张城瑞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('56a4b4ff13344fcd893b5cb23e4a933e', 89, 3.5, 1404, 0, 30, 2410, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2106, 0, 0, '太原学院', '事业', '01', 10489.5, '074001', NULL, 8383.5, '140104197311092226', '王爱芬', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('56e1aaba8686470c9ca2f842d9d414f0', 89, 0, 1322, 0, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1983, 0, 0, '太原学院', '事业', '01', 9779, '074001', NULL, 7796, '210782198204173420', '李秋玲', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5704b6e78d74465cb26d7e0f082ee4d4', 99, 0, 1381, 0, 0, 3030, 0, 1427, 2730, 1540, 0, 0, 0, 0, 2072, 0, 0, '太原学院', '事业', '01', 10207, '074001', NULL, 8135, '130726198706141014', '王兴', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('570df11acdd540a7a3af64a6e4c7a957', 74, 0, 1082, 0, 30, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1623, 0, 0, '太原学院', '事业', '01', 7709, '074001', NULL, 6086, '140525199709188722', '刘慧泽', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('575811565c0a4e2383ceec7d3caa28f4', 99, 0, 1481, 50, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2222, 0, 0, '太原学院', '事业', '01', 11135, '074001', NULL, 8913, '142701198303201349', '王研', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('57813d4033ff4e129ef2bfa65610e99d', 99, 3.9, 1729, 0, 30, 3260, 0, 3781, 2730, 1540, 0, 0, 0, 0, 2594, 0, 0, '太原学院', '事业', '01', 13172.9, '074001', NULL, 10578.9, '142601196810211926', '周月红', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('579b41551e1e452ebed555202dadb375', 89, 0, 1298, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1947, 0, 0, '太原学院', '事业', '01', 9376, '074001', NULL, 7429, '140107198505281723', '王晶', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('57d6015e02c54a1cbaffc1910104f094', 89, 0, 1416, 0, 30, 2410, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2124, 0, 0, '太原学院', '事业', '01', 10498, '074001', NULL, 8374, '140202197709080527', '张娜', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('58800a5df9a148749b9442db4ed9eb07', 89, 0, 1346, 0, 30, 2185, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2019, 0, 0, '太原学院', '事业', '01', 10003, '074001', NULL, 7984, '140103198008044828', '李方琪', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('58a0882d2bc043f394130fb55840a4d2', 99, 0, 1440, 50, 0, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2160, 0, 0, '太原学院', '事业', '01', 10771, '074001', NULL, 8611, '140103197809261211', '王占君', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('58ae52123a4c44e6bd3538ebcfa74b0e', 89, 0, 1177, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1766, 0, 0, '太原学院', '事业', '01', 8534, '074001', NULL, 6768, '140105199511050552', '刘琪', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('58af2c1631d942a390592fc1e402f90b', 99, 0, 1437, 0, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2156, 0, 0, '太原学院', '事业', '01', 10748, '074001', NULL, 8592, '142729198212241827', '温东辉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('590020e1442848d6aca5c1b8e8c0755a', 74, 0, 1137, 0, 30, 1925, 0, 1169, 2520, 1215, 0, 0, 0, 0, 1706, 0, 0, '太原学院', '事业', '01', 8070, '074001', NULL, 6364, '142433199111140026', '许雅萌', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('59211b7737ac42b1ba494ea50b561549', 94, 0, 1465, 0, 0, 2880, 0, 1882, 2730, 1551, 0, 0, 0, 0, 2198, -576, 0, '太原学院', '事业', '01', 10026, '074001', '2025-10-01', 7828, '142325198009050016', '臧国栋', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('593ebfe9ac3c4d4bb073fb54b6ce3df8', 89, 0, 1377, 50, 30, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2066, 0, 0, '太原学院', '事业', '01', 10109, '074001', NULL, 8043, '142201198405250742', '王丽君', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('597e1e0839d24cd0a185a6c682e2af10', 89, 0, 1248, 0, 0, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1872, 0, 0, '太原学院', '事业', '01', 8939, '074001', NULL, 7067, '140105199006190036', '于诚', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5a4c3f9043be40fea8bf9b8ef886c20e', 89, 0, 1227, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1841, 0, 0, '太原学院', '事业', '01', 8948, '074001', NULL, 7107, '140624199209221521', '郑文清', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5a8295b9f9b44467982ae2d643e11253', 74, 0, 1203, 50, 30, 1925, 0, 1789, 2520, 1215, 0, 0, 0, 0, 1805, 0, 0, '太原学院', '事业', '01', 8806, '074001', NULL, 7001, '140106198504062522', '沙荣', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5ad3738d165c4e0a96f19f948a59503c', 89, 0, 1240, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1860, 0, 0, '太原学院', '事业', '01', 8873, '074001', NULL, 7013, '14020219920828554X', '刘若男', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5adf8494bb1143e5a611fe58bb985021', 99, 0, 1520, 50, 30, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2280, 0, 0, '太原学院', '事业', '01', 11474, '074001', NULL, 9194, '14043019791118844X', '王飞宇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5af18d26ab3a44a698a0b8f847fb4923', 99, 4.4, 1717, 0, 0, 3260, 16, 3781, 2730, 1540, 0, 0, 0, 0, 2576, 0, 0, '太原学院', '事业', '01', 13147.4, '074001', NULL, 10571.4, '140102196604140212', '乔智', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5b25ced4c64e4c8589557671359b1a2c', 89, 0, 1322, 0, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1983, 0, 0, '太原学院', '事业', '01', 9586, '074001', NULL, 7603, '142429198507130028', '武潇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5b5880433b6541ad9b1c8cf066bb752f', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '140481199502066440', '郭睿婕', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5b7dee29896d49caa7bbbd07a461d52f', 89, 0, 1309, 50, 30, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 1964, 0, 0, '太原学院', '事业', '01', 9716, '074001', NULL, 7752, '140102198211183421', '张慧敏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5bf72cf863ff4fae98bae86fdbeb37c7', 99, 0, 1431, 50, 30, 3030, 0, 1789, 2730, 1540, 0, 0, 0, 0, 2147, 0, 0, '太原学院', '事业', '01', 10699, '074001', NULL, 8552, '140106198305052524', '张媛', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5c0afe2654154097b61fce3863874eb0', 89, 0, 1310, 50, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1965, 0, 0, '太原学院', '事业', '01', 9531, '074001', NULL, 7566, '140108198403290844', '杨青', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5c2d95ca175e4f9f82c38a3e31afc3f0', 74, 0, 1137, 0, 30, 1925, 0, 1169, 2520, 1215, 0, 0, 0, 0, 1706, 0, 0, '太原学院', '事业', '01', 8070, '074001', NULL, 6364, '141102199312070122', '郝书帆', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5c56a4b648dd4905afef8b2356d17de8', 89, 0, 1548, 0, 30, 2650, 0, 3266, 2660, 1418, 0, 0, 0, 0, 2322, 0, 0, '太原学院', '事业', '01', 11661, '074001', NULL, 9339, '14220119711104456X', '张红梅', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5c673a69502941d795010f123ad58040', 99, 0, 1520, 0, 30, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2280, 0, 0, '太原学院', '事业', '01', 11424, '074001', NULL, 9144, '140103197810311220', '郑敏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5cd9b91ae23a4378bed771b79a89c034', 104, 0, 1812, 50, 0, 4640, 0, 2175, 2940, 1908, 0, 0, 0, 0, 2718, 0, 0, '太原学院', '事业', '01', 13629, '074001', NULL, 10911, '142727198003230037', '黄泽军', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5d79e70fa67c4025ae9f88602f23f503', 94, 4, 1667, 0, 30, 2880, 0, 3516, 2730, 1551, 0, 0, 0, 0, 2501, 0, 0, '太原学院', '事业', '01', 12472, '074001', NULL, 9971, '140102196710024047', '钱蓉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5d7b838d769a4d5987f650224625c0da', 89, 0, 934, 0, 30, 2727, 0, 2516, 0, 1386, 0, 0, 0, 0, 1401, 0, 0, '太原学院', '事业', '01', 7682, '074001', NULL, 6281, '142432197303030029', '范玉芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5da73397e82540fcaadb4312cf14a041', 99, 0, 1404, 0, 0, 3030, 0, 1603, 2730, 1540, 0, 0, 0, 0, 2106, 0, 0, '太原学院', '事业', '01', 10406, '074001', NULL, 8300, '220106198603110219', '张光华', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5dda850b92144a3e8fbb1cbd7c157fc1', 89, 0, 1199, 0, 0, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1799, 0, 0, '太原学院', '事业', '01', 8720, '074001', NULL, 6921, '14010719920306121X', '刘振超', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5de9c79dc3bc4013aa6a0e0e568e02b0', 74, 0, 1078, 0, 0, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1617, 0, 0, '太原学院', '事业', '01', 7675, '074001', NULL, 6058, '140931199607030050', '袁祥', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5e2f948e647b4de7a0a600cc3fda1acd', 99, 0, 1574, 0, 0, 3260, 0, 2689, 2730, 1540, 0, 0, 0, 0, 2361, 0, 0, '太原学院', '事业', '01', 11892, '074001', NULL, 9531, '140102197604156518', '江河', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5e63b37efda94847ac7e3a02d2b99c69', 89, 0, 1294, 50, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1941, 0, 0, '太原学院', '事业', '01', 9515, '074001', NULL, 7574, '140109198403110029', '张焱', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5e8bf917a2a447b082acc4ae0a279c25', 99, 0, 1587, 0, 30, 3030, 0, 2911, 2730, 1540, 0, 0, 0, 0, 2381, 0, 0, '太原学院', '事业', '01', 11927, '074001', NULL, 9546, '140102197306244827', '李莉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5f4a0529c34a42a49ed44a9d0e9d2fa3', 69, 0, 1049, 0, 0, 1925, 0, 639, 2520, 1215, 0, 0, 0, 0, 1574, 0, 0, '太原学院', '事业', '01', 7417, '074001', NULL, 5843, '652926200004151714', '阿布都外力·阿布里克木', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5f4fcf60a6e84f1e9b77eecc6c4c3af0', 99, 0, 1571, 0, 30, 3030, 0, 2796, 2730, 1540, 0, 0, 0, 0, 2357, 0, 0, '太原学院', '事业', '01', 11796, '074001', NULL, 9439, '140104197404051327', '王凯', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('5f9059aef4cf47e390b55e61bedb97a8', 89, 0, 1387, 0, 30, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2081, 0, 0, '太原学院', '事业', '01', 10269, '074001', NULL, 8188, '14062419780128002X', '郭红梅', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('60a4406795e047b49dadfee804d6c1a2', 89, 0, 1322, 0, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1983, 0, 0, '太原学院', '事业', '01', 9586, '074001', NULL, 7603, '140109198503180526', '张璇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('60b37cd0f06f4d059ef41c61c81ed4fb', 99, 0, 1558, 0, 30, 3260, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2337, 0, 0, '太原学院', '事业', '01', 11492, '074001', NULL, 9155, '140203197907153922', '王建梅', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('60f14462eb3c4d3e83226388483f377b', 94, 3.2, 1589, 0, 30, 2880, 0, 3141, 2730, 1551, 0, 0, 0, 0, 2384, 0, 0, '太原学院', '事业', '01', 12018.2, '074001', NULL, 9634.2, '140103197303304827', '侯春柳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('61db482e271a4c6b847ca5b9dd16c63d', 79, 0, 1479, 0, 0, 2520, 0, 3026, 2660, 1383, 0, 0, 0, 0, 2219, 0, 0, '太原学院', '事业', '01', 11147, '074001', NULL, 8928, '14010319710116001X', '段卫民', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('61ec0d0ae56c4c8cb5253f193b8cb9c7', 89, 0, 1215, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1823, 0, 0, '太原学院', '事业', '01', 8654, '074001', NULL, 6831, '14112819930526001X', '白锦科', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('61f6715b59864ce6a82a140018142f90', 99, 0, 1478, 50, 0, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2217, 0, 0, '太原学院', '事业', '01', 11102, '074001', NULL, 8885, '142601198007241914', '支鹏伟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('62dd9a65a7434c8ebae6b97e2bfda0e0', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '142322199510167547', '周郅壹', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('62f73ca7f643432c8b3d20d0032667da', 89, 0, 1306, 50, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1959, 0, 0, '太原学院', '事业', '01', 9620, '074001', NULL, 7661, '140108198302024846', '李宗瑾', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6332f220d0234e61a3a66c1e046d5795', 79, 0, 1275, 0, 30, 2200, 0, 1696, 2590, 1292, 0, 0, 0, 0, 1913, 0, 0, '太原学院', '事业', '01', 9162, '074001', NULL, 7249, '142231198309240825', '章培英', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('635b912fadac4c26be64f23b028dd459', 89, 4.2, 1567, 0, 0, 2650, 0, 3516, 2660, 1418, 0, 0, 0, 0, 2351, 0, 0, '太原学院', '事业', '01', 11904.2, '074001', NULL, 9553.2, '320113196802024856', '赵登科', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('63647e70987f42e38498c79811c9d7f7', 94, 0, 1431, 50, 0, 2880, 0, 2275, 2730, 1551, 560, 0, 0, 0, 2147, 0, 0, '太原学院', '事业', '01', 11571, '074001', '2025-10-01', 9424, '140103197411080672', '应立冬', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6379734f53954a6480607925bd1e2cb4', 89, 0, 1270, 0, 30, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1905, 0, 0, '太原学院', '事业', '01', 9255, '074001', NULL, 7350, '14260119890820132X', '党旗', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('638c1c1876004db18982cec14da79573', 99, 0, 1838, 0, 30, 3810, 0, 4061, 2730, 1540, 0, 0, 0, 0, 2757, 0, 0, '太原学院', '事业', '01', 14108, '074001', NULL, 11351, '140103196701191544', '王树红', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('63a8e7eb57844d56b92746e8bcb7c9d5', 89, 0, 1261, 50, 30, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1892, 0, 0, '太原学院', '事业', '01', 9296, '074001', NULL, 7404, '14010719890205222X', '张怡', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('63c792c354aa46f49007acf262cf92bb', 104, 0, 1799, 50, 0, 4640, 0, 2375, 2940, 1908, 0, 0, 0, 0, 2699, 0, 0, '太原学院', '事业', '01', 13816, '074001', NULL, 11117, '142601197908051910', '张永刚', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('63ce88be4d6642ada5e5238d195c4de1', 89, 0, 1294, 50, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1941, 0, 0, '太原学院', '事业', '01', 9515, '074001', NULL, 7574, '14233019851228622X', '岳彦青', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('643a712546344efdbe02aeab1e95f505', 74, 0, 1213, 0, 0, 1925, 0, 1975, 2520, 1215, 0, 0, 0, 0, 1820, 0, 0, '太原学院', '事业', '01', 8922, '074001', NULL, 7102, '371121198001010015', '郑鹏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6452d0693558484fa4c1aaeb261164e2', 89, 0, 1279, 0, 0, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1919, 0, 0, '太原学院', '事业', '01', 9327, '074001', NULL, 7408, '140321197812011516', '药宏慧', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6479459292ce42b7b5613754a0952abb', 89, 0, 1240, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1860, 0, 0, '太原学院', '事业', '01', 8791, '074001', NULL, 6931, '140624199309200066', '苗丽娟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('64ce63569d474380836b4de3733c5541', 99, 0, 1791, 0, 30, 3810, 0, 3781, 2730, 1540, 0, 0, 0, 0, 2687, 0, 0, '太原学院', '事业', '01', 13781, '074001', NULL, 11094, '142601196810021946', '赵晓梅', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('64de1d97d40242e8a03dc6e8bd73bf2e', 74, 0, 1101, 0, 30, 1925, 0, 1087, 2520, 1215, 0, 0, 0, 0, 1652, 0, 0, '太原学院', '事业', '01', 7952, '074001', NULL, 6300, '140202199001072520', '赵然', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6542f518a9764ef39b2ed9123fe8f19a', 89, 0, 1211, 0, 0, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1817, 0, 0, '太原学院', '事业', '01', 8732, '074001', NULL, 6915, '142402198202030018', '赵亢', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6567702bb01d46a180863c9bf18b4fe7', 99, 0, 1478, 0, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2217, 0, 0, '太原学院', '事业', '01', 10982, '074001', NULL, 8765, '140106198203171928', '张枫', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('658095d170d24300ae480ee1a906c0be', 74, 0, 1242, 0, 0, 1950, 0, 2175, 2520, 1215, 0, 0, 0, 0, 1863, 0, 0, '太原学院', '事业', '01', 9176, '074001', NULL, 7313, '140102197912225191', '司远', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('658b89d53c8e4f1a8d9271edc9178a2d', 89, 0, 1361, 50, 30, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2042, 0, 0, '太原学院', '事业', '01', 10093, '074001', NULL, 8051, '14011019811027106X', '黄丹丹', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('65c7ccb255da4e5396ecb5359b07d53a', 89, 0, 1246, 0, 0, 2185, 0, 1515, 2660, 1418, 0, 0, 0, 0, 1869, 0, 0, '太原学院', '事业', '01', 9113, '074001', NULL, 7244, '140624198208170115', '邢向阳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('65e2a6202a4c4ec68b07b3559c075ef9', 89, 0, 1547, 0, 30, 2650, 0, 3266, 2660, 1418, 0, 0, 0, 0, 2321, 0, 0, '太原学院', '事业', '01', 11660, '074001', NULL, 9339, '14010519700610504X', '李小利', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('65f22ead30a7458b9741b0e596cb7229', 74, 0, 1193, 0, 30, 1925, 0, 1603, 2520, 1215, 0, 0, 0, 0, 1790, 0, 0, '太原学院', '事业', '01', 8560, '074001', NULL, 6770, '140511198706236044', '常星星', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6666b73f3bdc4a88a6a08151c3f36b81', 89, 4.6, 1567, 0, 0, 2650, 0, 3516, 2660, 1418, 0, 0, 0, 0, 2351, 0, 0, '太原学院', '事业', '01', 11904.6, '074001', NULL, 9553.6, '140105196610193731', '孙长有', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6669d17012484e95b5d1f07182f6c1a9', 89, 0, 1361, 0, 30, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2042, 0, 0, '太原学院', '事业', '01', 10043, '074001', NULL, 8001, '140103198211041526', '王玉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('670a575a131042d09706fb4ccb12544c', 89, 0, 1378, 50, 30, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2067, 0, 0, '太原学院', '事业', '01', 10310, '074001', NULL, 8243, '140105198005141326', '郑慧敏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('672808b0df484c9e989bca93e032635b', 104, 0, 1777, 0, 30, 4640, 0, 2075, 2940, 1908, 0, 0, 0, 0, 2666, 0, 0, '太原学院', '事业', '01', 13474, '074001', NULL, 10808, '140624198209042043', '魏玲', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6761f77000524d33b870132a0c2c09be', 99, 0, 1653, 0, 30, 3260, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2480, 0, 0, '太原学院', '事业', '01', 12578, '074001', NULL, 10098, '14010219700620492X', '郝慧颖', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('677b5752ba9d4dd1b896c3ae65249db0', 89, 0, 1283, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1925, 0, 0, '太原学院', '事业', '01', 9361, '074001', NULL, 7436, '142303198704170062', '殷志鹃', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('67ff597bc30a4186bde1a40713e9d82b', 89, 0, 1215, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1823, 0, 0, '太原学院', '事业', '01', 8848, '074001', NULL, 7025, '140107198908211228', '张文静', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('686e7956616745f8918225751267d2e8', 89, 0, 1460, 0, 30, 2410, 0, 2911, 2660, 1418, 0, 0, 0, 0, 2190, 0, 0, '太原学院', '事业', '01', 10978, '074001', NULL, 8788, '140108197311071981', '黄岩梅', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('68724b1ba6d9409794780185b1d817e8', 89, 0, 1177, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1766, 0, 0, '太原学院', '事业', '01', 8534, '074001', NULL, 6768, '140322199411280016', '贾亦非', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('689c3d7cc9f5464b979f114fee5b2835', 79, 0, 1277, 50, 0, 2200, 0, 1975, 2590, 1292, 0, 0, 0, 0, 1916, 0, 0, '太原学院', '事业', '01', 9463, '074001', NULL, 7547, '140103198110185715', '郭锐', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('68cbefc4f8284e939ec1ae13214a139f', 89, 0, 1348, 50, 30, 2185, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2022, 0, 0, '太原学院', '事业', '01', 10055, '074001', NULL, 8033, '140102197711282341', '张琳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('68d1aec313e94375b6bd4502e64c644e', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '420116198902094562', '解欢', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('69559128f4cd405f99ea8f9caa12b7cb', 99, 0, 1643, 0, 0, 3260, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2465, 0, 0, '太原学院', '事业', '01', 12413, '074001', NULL, 9948, '14260119711129283X', '王建平', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('697717b67ed941cb9bcd438a1fb0a650', 89, 0, 1344, 0, 30, 2410, 0, 1789, 2660, 1418, 0, 0, 0, 0, 2016, 0, 0, '太原学院', '事业', '01', 9740, '074001', NULL, 7724, '140109198704295522', '孙婧', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6992ae7b14bc47c892e85bc9e35b41ab', 89, 0, 1309, 0, 30, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 1964, 0, 0, '太原学院', '事业', '01', 9666, '074001', NULL, 7702, '142726198402283922', '吴静', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('69a1a0f047d149798367d321fcfbc01d', 99, 0, 1455, 50, 30, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2183, 0, 0, '太原学院', '事业', '01', 10909, '074001', NULL, 8726, '140108198303244226', '赵欣', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('69b9f468e2414b169c6a6c2b212aea32', 89, 0, 1213, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1820, 0, 0, '太原学院', '事业', '01', 8570, '074001', NULL, 6750, '142630199404271013', '杨沐霖', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('69bf38c8095047dca0770edbf0ba3d99', 94, 0, 1781, 0, 30, 3455, 0, 3641, 2800, 1810, 0, 0, 0, 0, 2672, 0, 0, '太原学院', '事业', '01', 13611, '074001', NULL, 10939, '140104196708251323', '武健', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6a590ea0c576431c93c0c38eeeb97723', 104, 0, 1857, 0, 30, 4640, 0, 2689, 2940, 1908, 0, 0, 0, 0, 2786, 0, 0, '太原学院', '事业', '01', 14168, '074001', NULL, 11382, '142323197311181386', '闫娟枝', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6a5b96ab358c42c88d176815a3a1a70f', 94, 0, 1652, 0, 30, 3455, 0, 2689, 2800, 1810, 0, 0, 0, 0, 2478, 0, 0, '太原学院', '事业', '01', 12530, '074001', NULL, 10052, '140103197309204261', '吴慧玲', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6ab6f8485a574b15a777fe3ec9abfd20', 89, 0, 1320, 0, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1980, 0, 0, '太原学院', '事业', '01', 9777, '074001', NULL, 7797, '142401198301302422', '樊永晔', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6ab7317733194467b3d0b50d919a3c2b', 89, 0, 1270, 0, 0, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1905, 0, 0, '太原学院', '事业', '01', 9318, '074001', NULL, 7413, '150421198810211815', '牟志然', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6ac9f6dbbe234f0eab488cb1c65d7cb8', 74, 0, 957, 0, 0, 1925, 0, 1339, 2520, 1215, 3360, 0, 0, 0, 1436, 31982, 0, '太原学院', '事业', '01', 43372, '074001', NULL, 41936, '141082198806200013', '邢云山', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6ae400f520384f0db1afa1fed457aa8c', 94, 0, 1555, 0, 0, 2880, 0, 2911, 2730, 1551, 0, 0, 0, 0, 2333, 0, 0, '太原学院', '事业', '01', 11721, '074001', NULL, 9388, '140102197602031412', '海滨', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6af4491f620240539135a13c3a1c8c1c', 94, 0, 1705, 50, 30, 3455, 0, 2911, 2800, 1810, 0, 0, 0, 0, 2558, -1500, 0, '太原学院', '事业', '01', 11355, '074001', NULL, 8797, '140121197407090029', '韩俊秦', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6b2ae39cd1ad4b8ea7012167a31db152', 99, 0, 1560, 50, 30, 3260, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2340, 0, 0, '太原学院', '事业', '01', 11744, '074001', NULL, 9404, '140102198004223443', '杨丽娟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6b75d36b4c264547b0428082d89d4cd7', 74, 0, 1233, 50, 30, 1950, 0, 2075, 2520, 1215, 0, 0, 0, 0, 1850, 0, 0, '太原学院', '事业', '01', 9147, '074001', NULL, 7297, '140311198006140622', '郑丽文', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6ba3a57429a2490c8af12802741f7b3e', 69, 0, 1304, 0, 0, 2260, 0, 2041, 2590, 1365, 0, 0, 0, 0, 1956, 0, 0, '太原学院', '事业', '01', 9629, '074001', NULL, 7673, '142726197503163052', '张晓民', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6bb9fb67807a43e3a412e9092c92f9a8', 94, 0, 1529, 0, 0, 3455, 0, 2375, 2800, 1810, 0, 0, 0, 0, 2294, 5320, 0, '太原学院', '事业', '01', 17383, '074001', '2025-07-01', 15089, '14011219770818281X', '肖永强', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6bf4e30fc8154ce79183fe6da5e115c3', 89, 0, 1177, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1766, 0, 0, '太原学院', '事业', '01', 8534, '074001', NULL, 6768, '140427199502048033', '王茜渊', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6c84f48fdb8b4278959f7bd681e8c469', 89, 0, 1344, 0, 0, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2016, 0, 0, '太原学院', '事业', '01', 9771, '074001', NULL, 7755, '140122198312100010', '白月星', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6c8f673cc1a148c8aab4e27abd2b6ca8', 99, 0, 1550, 0, 30, 3260, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2325, 0, 0, '太原学院', '事业', '01', 11684, '074001', NULL, 9359, '142123197811060520', '温成荣', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6c9976eb559449558756300cad8b1639', 104, 0, 1826, 0, 0, 4640, 0, 2475, 2940, 1908, 0, 0, 0, 0, 2739, 0, 0, '太原学院', '事业', '01', 13893, '074001', NULL, 11154, '140102197810240016', '傅晔', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6cc111c4026f4835a4ed3b7b7b7cf706', 89, 0, 1285, 0, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1928, 0, 0, '太原学院', '事业', '01', 9456, '074001', NULL, 7528, '140121198411108046', '杨晓云', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6cc9d571fe4f4e2890e8c4199e80f197', 69, 0, 1153, 0, 30, 1940, 0, 1457, 2520, 1194, 0, 0, 0, 0, 1730, 0, 0, '太原学院', '事业', '01', 8363, '074001', NULL, 6633, '140123198102170025', '尤帼云', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6d16fbada6944cab82fb934baf477d68', 89, 0, 1392, 50, 0, 2650, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2088, 0, 0, '太原学院', '事业', '01', 10434, '074001', NULL, 8346, '142601198007011932', '王勇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6dc69fd7fa1f447185f2a9f78e4b9719', 79, 0, 1327, 50, 0, 2200, 0, 2175, 2590, 1292, 0, 0, 0, 0, 1991, 0, 0, '太原学院', '事业', '01', 9713, '074001', NULL, 7722, '142702198106140010', '冯冲', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6e0372e2f7074360b8d08dae427ee0f0', 89, 0, 1378, 50, 30, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2067, 0, 0, '太原学院', '事业', '01', 10310, '074001', NULL, 8243, '140522198211172324', '栗文敏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6e072d33fcda473dabc3531c2a911ab1', 99, 0, 1496, 0, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2244, 0, 0, '太原学院', '事业', '01', 11000, '074001', NULL, 8756, '140105198201180023', '王贇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6e7d3d892442428b84a9b23909c11fe6', 89, 0, 1037, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1556, 0, 0, '太原学院', '事业', '01', 8394, '074001', NULL, 6838, '140581199503270035', '王雨嘉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6f549c8d67c946dabc07ebef3e136114', 99, 0, 1658, 0, 0, 3260, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2487, 0, 0, '太原学院', '事业', '01', 12428, '074001', NULL, 9941, '140104197404152259', '赵刚', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6f7be1b91c97488c8be9c9a8d0a6759d', 99, 0, 1550, 0, 30, 3260, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2325, 0, 0, '太原学院', '事业', '01', 11684, '074001', NULL, 9359, '140103197812070627', '苗壮', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6f92305f34c24f62addd0aa17a88130e', 89, 0, 1332, 50, 0, 2185, 0, 2175, 2660, 1418, 0, 0, 0, 0, 1998, 0, 0, '太原学院', '事业', '01', 9909, '074001', NULL, 7911, '140103197903211210', '李泰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6f96333f45cc4d39b47059966bc78d56', 89, 0, 1327, 0, 30, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1991, 0, 0, '太原学院', '事业', '01', 9816, '074001', NULL, 7825, '142402198409224522', '赵军芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6fd265d6385c4d13a9b63702cfa74cdb', 74, 0, 1106, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1659, 0, 0, '太原学院', '事业', '01', 7804, '074001', NULL, 6145, '360681199608012629', '汤秀佳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('6ffeec9ced8c4b4abbcd1d6302a08a9a', 89, 0, 1215, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1823, 0, 0, '太原学院', '事业', '01', 8848, '074001', NULL, 7025, '140481199309116581', '李琳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('707b83cf540a416eae3b5acd7e7ea621', 89, 0, 1435, 0, 30, 2650, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2153, 0, 0, '太原学院', '事业', '01', 10757, '074001', NULL, 8604, '142729198008290023', '吉丽娟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('70860fa3540343818fe874374df6e9d4', 69, 0, 1323, 0, 30, 1925, 0, 2796, 2520, 1215, 0, 0, 0, 0, 1985, 0, 0, '太原学院', '事业', '01', 9878, '074001', NULL, 7893, '140104197203092245', '米峮', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('70df4edb91224ceebcf9a2b191d9edb4', 89, 0, 1297, 0, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1946, 0, 0, '太原学院', '事业', '01', 9561, '074001', NULL, 7615, '140107198202034522', '李楠', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('710ac4b5bdc64dc8b6568c8afc3494fc', 59, 0, 1093, 0, 30, 1730, 0, 1383, 2450, 1148, 0, 0, 0, 0, 1640, 0, 0, '太原学院', '事业', '01', 7893, '074001', NULL, 6253, '120102198410314128', '朱玲', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('711a6a480c4a4f049722344d570c2927', 74, 0, 1189, 0, 0, 1925, 0, 1789, 2520, 1215, 0, 0, 0, 0, 1784, 0, 0, '太原学院', '事业', '01', 8712, '074001', NULL, 6928, '140106198310100615', '梁勇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('71346d627d3140c09849bce12ebced64', 74, 0, 1186, 0, 0, 1925, 0, 1696, 2520, 1215, 0, 0, 0, 0, 1779, 0, 0, '太原学院', '事业', '01', 8616, '074001', NULL, 6837, '140106198406063038', '李鹏飞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7142a8931ddf4a5ba1a2b9a9142c1ff5', 89, 0, 1205, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1808, 0, 0, '太原学院', '事业', '01', 8756, '074001', NULL, 6948, '141124199204080209', '郭玉婷', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7160845a8df94543b6524e3d125464bc', 74, 0, 1081, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1622, 0, 0, '太原学院', '事业', '01', 7779, '074001', NULL, 6157, '140322199503214227', '侯宁宁', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7161cbe0b9124d7faaefe1dd42ae971b', 99, 0, 1491, 50, 0, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2237, 0, 0, '太原学院', '事业', '01', 11215, '074001', NULL, 8978, '142332198305120019', '刘宏伟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('718dc5c941504353b8ee6761e66dae3e', 99, 0, 1445, 0, 30, 3030, 0, 1696, 2730, 1540, 0, 0, 0, 0, 2168, 0, 0, '太原学院', '事业', '01', 10570, '074001', NULL, 8402, '140105198712020582', '张晨昕', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('71984c20f60949218e58d14079c93ffc', 99, 0, 1694, 0, 30, 3260, 5, 3391, 2730, 1540, 0, 0, 0, 0, 2541, 0, 0, '太原学院', '事业', '01', 12749, '074001', NULL, 10208, '140102197309035166', '郭振红', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('71a2d743e0eb4b0eae989a89935e964c', 89, 0, 1310, 0, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1965, 0, 0, '太原学院', '事业', '01', 9481, '074001', NULL, 7516, '140110198601230027', '袁菁菁', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('71e1e8df130e4ee88754e54d95ed1221', 89, 0, 1348, 50, 30, 2185, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2022, 0, 0, '太原学院', '事业', '01', 10055, '074001', NULL, 8033, '140102197511150643', '李晓妹', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('71ecead34fb249bca3a6e010d4a4b528', 89, 0, 1307, 0, 0, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1961, 0, 0, '太原学院', '事业', '01', 9448, '074001', NULL, 7487, '230404198509100239', '朱秀栋', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('72040e82335e44e98c23d37440c203c1', 99, 0, 1481, 50, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2222, 0, 0, '太原学院', '事业', '01', 11135, '074001', NULL, 8913, '142401198110021425', '彭薇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('728d209c803642d6b36d1a87a27aa333', 94, 0, 1458, 0, 0, 2880, 0, 1882, 2730, 1551, 0, 0, 0, 0, 2187, -576, 0, '太原学院', '事业', '01', 10019, '074001', '2025-10-01', 7832, '140121198112195514', '梁安国', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('73042408c0534f159aa422c63d5563ff', 89, 0, 1205, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1808, 0, 0, '太原学院', '事业', '01', 8756, '074001', NULL, 6948, '142303199301284529', '郝秀萍', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('735f31cb67844c3eabf04c819969b87c', 69, 0, 1228, 50, 30, 1925, 0, 1975, 2520, 1215, 0, 0, 0, 0, 1842, 0, 0, '太原学院', '事业', '01', 9012, '074001', NULL, 7170, '14010319811109572X', '单荣芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('73649f23469e4f11a5cb55015a27ef8f', 69, 0, 1176, 0, 0, 1925, 0, 1696, 2520, 1215, 0, 0, 0, 0, 1764, 0, 0, '太原学院', '事业', '01', 8601, '074001', NULL, 6837, '140106198312251214', '杜炜', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('73790df8538f44df897115bc97c48060', 89, 0, 1349, 0, 30, 2410, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2024, 0, 0, '太原学院', '事业', '01', 9931, '074001', NULL, 7907, '142303198601064566', '任晶晶', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('737f0f21d978403e9b147669b7d44445', 89, 0, 1261, 0, 30, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1892, 0, 0, '太原学院', '事业', '01', 9246, '074001', NULL, 7354, '142222198809110027', '徐睿', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('743a1ca3ad1c4898a44af1eee0405cd8', 99, 4.2, 1643, 0, 0, 3260, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2465, 0, 0, '太原学院', '事业', '01', 12417.2, '074001', NULL, 9952.2, '140103197108190035', '黄国卫', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('74858619a5c342b0ae36a5c0ebf3e8e5', 99, 0, 1724, 0, 30, 3810, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2586, 0, 0, '太原学院', '事业', '01', 13199, '074001', NULL, 10613, '142701197005151262', '靳丽华', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('749481c514d646879eacc53f9c84160c', 89, 0, 1227, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1841, 0, 0, '太原学院', '事业', '01', 8948, '074001', NULL, 7107, '140623198905150025', '祁极冰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('74a92b47bdb64a54a79982dfce648f86', 94, 0, 1526, 0, 0, 2880, 0, 2689, 2730, 1551, 0, 0, 0, 0, 2289, 0, 0, '太原学院', '事业', '01', 11470, '074001', NULL, 9181, '140103197111071213', '段炳胜', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('74bb4c4379aa429ca93278bd2553ebf6', 89, 0, 1431, 0, 0, 2650, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2147, 0, 0, '太原学院', '事业', '01', 10723, '074001', NULL, 8576, '142222197812100335', '李向军', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7525cd93010d42e4bb299b4cb7850319', 74, 0, 1285, 0, 30, 1950, 0, 2475, 2520, 1215, 0, 0, 0, 0, 1928, 0, 0, '太原学院', '事业', '01', 9549, '074001', NULL, 7621, '142401197708202728', '张芸', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('758214f164c4420184c38dbf884d1875', 104, 0, 1785, 50, 0, 4640, 0, 1975, 2940, 1908, 0, 0, 0, 0, 2678, 0, 0, '太原学院', '事业', '01', 13402, '074001', NULL, 10724, '140623198108077013', '段永红', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('75b2f6e7524f40609942b0ebdc60c8ef', 69, 0, 1304, 0, 0, 2260, 0, 2041, 2590, 1365, 0, 0, 0, 0, 1956, 0, 0, '太原学院', '事业', '01', 9629, '074001', NULL, 7673, '140106197504045138', '郭满生', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('76634f3ed42a422e88092441a1febfad', 89, 0, 1273, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1910, 0, 0, '太原学院', '事业', '01', 9351, '074001', NULL, 7441, '140121198309307225', '代芳芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('76af1ed4dc0d4d00b09d4f44905ead36', 99, 0, 1468, 0, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2202, 0, 0, '太原学院', '事业', '01', 10779, '074001', NULL, 8577, '140105198411120547', '庞培婕', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('76b70fca875b4cf3a5aa228dcea01fb8', 94, 0, 1683, 0, 0, 3455, 0, 2911, 2800, 1810, 0, 0, 0, 0, 2525, 0, 0, '太原学院', '事业', '01', 12753, '074001', NULL, 10228, '412931197301235537', '王小明', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('77846042f73f47d69e84bd81ca34e0ad', 89, 0, 1219, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1829, 0, 0, '太原学院', '事业', '01', 8688, '074001', NULL, 6859, '150421199211051228', '李晓楠', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7785ec3a5a284daa9016d9aaf9b25020', 99, 0, 1681, 0, 30, 3030, 0, 3641, 2730, 1540, 0, 0, 0, 0, 2522, 0, 0, '太原学院', '事业', '01', 12751, '074001', NULL, 10229, '220104196604212661', '周璠', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7796bc8811cb495ba2e2bd1cea41ca03', 89, 0, 1298, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1947, 0, 0, '太原学院', '事业', '01', 9376, '074001', NULL, 7429, '142603198804082023', '徐璐', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('77b6ab31078645fc9c0141d88cf20c69', 89, 0, 1199, 50, 30, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1799, 0, 0, '太原学院', '事业', '01', 9931, '074001', NULL, 8132, '140105198102120041', '张薇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('77c38bede1e9422da23093f8de330842', 104, 0, 1754, 0, 0, 4640, 0, 1975, 2940, 1908, 0, 0, 0, 0, 2631, 0, 0, '太原学院', '事业', '01', 13321, '074001', NULL, 10690, '140108198206043211', '张小勇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7873e9a51bcd40019971b5f6cd601795', 104, 0, 2011, 50, 0, 6070, 0, 3026, 2940, 1908, 0, 0, 0, 0, 3017, 0, 0, '太原学院', '事业', '01', 16109, '074001', NULL, 13092, '14240119780707141X', '蔡江辉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('78b4771670a343029abadf67ea1ffc59', 89, 0, 1177, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1766, 0, 0, '太原学院', '事业', '01', 8534, '074001', NULL, 6768, '14262919910207107X', '严豪', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('78cd24bc856244fdbf1d69c9f32afa97', 89, 0, 1309, 0, 30, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 1964, 0, 0, '太原学院', '事业', '01', 9666, '074001', NULL, 7702, '14010719831113002X', '郭家雁', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('78d4238d969543f69ec33aafdb2f5db8', 94, 0, 1425, 0, 0, 2880, 0, 1696, 2730, 1551, 0, 0, 0, 0, 2138, -576, 0, '太原学院', '事业', '01', 9800, '074001', '2025-10-01', 7662, '142228198712060017', '刘正', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('79035f25498e4ed5bd1b1b6237f202fe', 99, 0, 1383, 0, 30, 3030, 0, 1339, 2730, 1540, 0, 0, 0, 0, 2075, 0, 0, '太原学院', '事业', '01', 10151, '074001', NULL, 8076, '14270219920929552X', '尚珍珍', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7904a51e3d1f414a9d748d7a10c4736f', 89, 0, 1200, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1800, 0, 0, '太原学院', '事业', '01', 8639, '074001', NULL, 6839, '140302199304120812', '李博睿', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7958cf16cb094f92b3a3f25ebc4fb842', 74, 0, 1220, 0, 30, 1950, 0, 1975, 2520, 1215, 0, 0, 0, 0, 1830, 0, 0, '太原学院', '事业', '01', 8984, '074001', NULL, 7154, '140110198305030020', '刘馨', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7969207c6c3f4affa158783e1bffb953', 89, 0, 1387, 0, 30, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2081, 0, 0, '太原学院', '事业', '01', 10269, '074001', NULL, 8188, '142432197702221228', '郭红霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('797a5a06159f4abfb37af1f2337f742f', 89, 0, 1201, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1802, 0, 0, '太原学院', '事业', '01', 8640, '074001', NULL, 6838, '142303199004288339', '张伟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('79d121a77d534eb1bdd7da51e8aa9f2b', 89, 0, 1181, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1772, 0, 0, '太原学院', '事业', '01', 8568, '074001', NULL, 6796, '142431199512280668', '郭晓婷', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('79e4abf77af74300a10a951ff5b2f08a', 94, 4.3, 1781, 0, 30, 3455, 0, 3641, 2800, 1810, 0, 0, 0, 0, 2672, 0, 0, '太原学院', '事业', '01', 13615.3, '074001', NULL, 10943.3, '140102196706176523', '贺红梅', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7b06867434c84479a6945a1929a39a0b', 99, 0, 1491, 0, 0, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2237, 0, 0, '太原学院', '事业', '01', 11165, '074001', NULL, 8928, '410323198204160553', '吕振伟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7b1cb6973a7348e5a5fe670b25a202db', 99, 0, 1428, 0, 30, 3030, 0, 1696, 2730, 1540, 0, 0, 0, 0, 2142, 0, 0, '太原学院', '事业', '01', 10553, '074001', NULL, 8411, '140106198610272566', '闫旭', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7b261a2ad7964b57bac8b48720966844', 89, 0, 1391, 0, 30, 2410, 0, 2375, 2660, 1418, 0, 0, 0, 0, 2087, 0, 0, '太原学院', '事业', '01', 10373, '074001', NULL, 8286, '140202198012031025', '孙丽娟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7b2b0609a0e545c5804011ad8b612eda', 99, 0, 1494, 50, 30, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2241, 0, 0, '太原学院', '事业', '01', 11248, '074001', NULL, 9007, '142402198010090024', '刘虹', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7bcaed5053474de5bfd78bca414720e4', 99, 0, 1373, 0, 30, 3030, 0, 1339, 2730, 1540, 0, 0, 0, 0, 2060, 0, 0, '太原学院', '事业', '01', 10141, '074001', NULL, 8081, '142625199301181727', '郭婷婷', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7be10d9d53cc433d879fdaa04fd8810e', 89, 0, 1296, 50, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1944, 0, 0, '太原学院', '事业', '01', 9517, '074001', NULL, 7573, '140108198411144222', '于晓君', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7c1940ec11a54acab7caf244decff63a', 89, 0, 1491, 0, 30, 2650, 0, 2911, 2660, 1418, 0, 0, 0, 0, 2237, 0, 0, '太原学院', '事业', '01', 11249, '074001', NULL, 9012, '140102197502186521', '李旭琴', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7c83dd03aadd4de3bb83b1fd091a73cd', 99, 0, 1481, 50, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2222, 0, 0, '太原学院', '事业', '01', 11135, '074001', NULL, 8913, '140103198003203922', '张珺', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7cb87c7ea8a5450699406d766c0e0b18', 89, 0, 1506, 0, 30, 2410, 0, 3266, 2660, 1418, 0, 0, 0, 0, 2259, 0, 0, '太原学院', '事业', '01', 11379, '074001', NULL, 9120, '142701197101101222', '高军', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7d3e1b2fa39b44a2b7287cc18e95ea6a', 74, 0, 1108, 0, 0, 1925, 0, 1169, 2520, 1215, 0, 0, 0, 0, 1662, 0, 0, '太原学院', '事业', '01', 8011, '074001', NULL, 6349, '370782199206170839', '管国祥', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7d40420dfa4f48f88b50687d2de56cb2', 104, 0, 1868, 0, 0, 4640, 0, 2796, 2940, 1908, 0, 0, 0, 0, 2802, 0, 0, '太原学院', '事业', '01', 14256, '074001', NULL, 11454, '142431197104140034', '王欲进', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7d7192931f6046f2821f52ab0f8528f1', 74, 0, 1242, 0, 0, 1950, 0, 2175, 2520, 1215, 0, 0, 0, 0, 1863, 0, 0, '太原学院', '事业', '01', 9176, '074001', NULL, 7313, '142727198001231511', '王志洋', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7dcdf74026884ddfb364ebff91df51d8', 89, 0, 1345, 0, 0, 2185, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2018, 0, 0, '太原学院', '事业', '01', 9972, '074001', NULL, 7954, '140104198207070013', '高鹏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7e2625de0dad4904a6e6da1e8c8846db', 74, 0, 1098, 0, 0, 1925, 0, 1087, 2520, 1215, 0, 0, 0, 0, 1647, 0, 0, '太原学院', '事业', '01', 7919, '074001', NULL, 6272, '14010819930825193X', '张玉杰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7e4af6b03ef04e98946cbcf81d498d67', 89, 0, 1503, 0, 0, 2650, 0, 2796, 2660, 1418, 0, 0, 0, 0, 2255, 0, 0, '太原学院', '事业', '01', 11116, '074001', NULL, 8861, '142601197504221311', '霍海涛', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7e77c54f336142468215ff9e8e1bcd10', 99, 0, 1407, 0, 30, 3030, 0, 1603, 2730, 1540, 0, 0, 0, 0, 2111, 0, 0, '太原学院', '事业', '01', 10439, '074001', NULL, 8328, '140107198511090042', '白宁', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7e94e3e576864a20a8a87e146d592a26', 89, 0, 1348, 0, 30, 2410, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2022, 0, 0, '太原学院', '事业', '01', 9930, '074001', NULL, 7908, '142331198112250523', '温鑫', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7eaa3b94e46b448785256dde47f8127c', 99, 0, 1592, 0, 30, 3260, 0, 2796, 2730, 1540, 0, 0, 0, 0, 2388, 0, 0, '太原学院', '事业', '01', 12047, '074001', NULL, 9659, '142222197504200027', '韩峰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7ec986c60a634bd4bd41f7268228518a', 99, 0, 1618, 0, 0, 3260, 0, 3026, 2730, 1540, 0, 0, 0, 0, 2427, 0, 0, '太原学院', '事业', '01', 12273, '074001', NULL, 9846, '140103197307200611', '张煜', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7f1cb81e03f54a28aa4388c62951ac47', 99, 0, 1468, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2202, 0, 0, '太原学院', '事业', '01', 11022, '074001', NULL, 8820, '140303198209060040', '陈丫丫', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7f22960e0c9148088172226d674ea57c', 89, 0, 1378, 50, 30, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2067, 0, 0, '太原学院', '事业', '01', 10310, '074001', NULL, 8243, '142321197810040622', '高新艳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7f33b90e8c6040fca8e5a94d03413131', 89, 0, 1037, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1556, 0, 0, '太原学院', '事业', '01', 8394, '074001', NULL, 6838, '140109199401120017', '许宸嘉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7f3e9227d2f246d7b2e29e9aa091ce1a', 99, 0, 1481, 0, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2222, 0, 0, '太原学院', '事业', '01', 11085, '074001', NULL, 8863, '14263119800715742X', '陈耀玲', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7f5fdc5d1b804950b9b2909e3266e3ce', 89, 0, 1248, 0, 0, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1872, 0, 0, '太原学院', '事业', '01', 8939, '074001', NULL, 7067, '140581199007153913', '杨航', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7f671e07bca24d0c991bf4ce72e34348', 69, 0, 1170, 0, 30, 1925, 0, 1427, 2520, 1215, 0, 0, 0, 0, 1755, 0, 0, '太原学院', '事业', '01', 8356, '074001', NULL, 6601, '142333199105271825', '卫丽琴', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7faf295e702943e49bf627256a572c82', 89, 0, 1322, 0, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1983, 0, 0, '太原学院', '事业', '01', 9779, '074001', NULL, 7796, '142724198308210011', '王晓锋', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('7fe9ff02569e4575b529bbd623e82958', 94, 0, 1602, 0, 0, 3455, 0, 2275, 2800, 1810, 0, 0, 0, 0, 2403, 0, 0, '太原学院', '事业', '01', 12036, '074001', NULL, 9633, '140311197803090934', '张勤杰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('80830a747d53404b89e71d100631c10b', 89, 0, 1320, 50, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1980, 0, 0, '太原学院', '事业', '01', 9634, '074001', NULL, 7654, '140107198210201220', '杨雅琴', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('809686e208b54972b16a2566cb136580', 89, 0, 1297, 50, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1946, 0, 0, '太原学院', '事业', '01', 9611, '074001', NULL, 7665, '140102198211270621', '王烨', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('80b7deb8e2df49b3ab309669fa4468a5', 99, 0, 1437, 0, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2156, 0, 0, '太原学院', '事业', '01', 10748, '074001', NULL, 8592, '140105198803241866', '王晓林', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('80b931e6f04042a1a8a6d84ef3163599', 89, 0, 1270, 0, 0, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1905, 0, 0, '太原学院', '事业', '01', 9318, '074001', NULL, 7413, '14060219860705851X', '徐少卿', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('80d9b9e4ecf4482986841ed7a2a1b3e9', 89, 0, 1238, 0, 30, 2185, 0, 1427, 2660, 1418, 0, 0, 0, 0, 1857, 0, 0, '太原学院', '事业', '01', 9047, '074001', NULL, 7190, '140107199007263324', '韩宝珠', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('80e2230df6554bb7884faaf94b3ac6fb', 69, 0, 1180, 50, 30, 1925, 0, 1696, 2520, 1215, 0, 0, 0, 0, 1770, 0, 0, '太原学院', '事业', '01', 8685, '074001', NULL, 6915, '140102198208161440', '段婷', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8131393f6e8f45e59b8b1f235aa15b36', 89, 0, 1205, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1808, 0, 0, '太原学院', '事业', '01', 8756, '074001', NULL, 6948, '140212199209233365', '王彩凤', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('817cbc8c9d3249e0be06e3a88900038c', 104, 0, 2020, 0, 0, 4640, 0, 3781, 2940, 1908, 0, 0, 0, 0, 3030, 0, 0, '太原学院', '事业', '01', 15393, '074001', NULL, 12363, '140104197001062216', '贾文强', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8190549c809d4a438b8ea4c5fa7d54ac', 69, 4, 1402, 0, 0, 2260, 0, 2791, 2590, 1365, 0, 0, 0, 0, 2103, 0, 0, '太原学院', '事业', '01', 10481, '074001', NULL, 8378, '140103196806270652', '王建华', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('81d900c2d43d40e49dd4a7d9e230e2fe', 89, 0, 1257, 0, 30, 2185, 0, 1515, 2660, 1418, 0, 0, 0, 0, 1886, 0, 0, '太原学院', '事业', '01', 9154, '074001', NULL, 7268, '140424198606234822', '李静森', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8227e80c3acc48f58d2d21453f8aedc5', 104, 0, 1798, 0, 30, 4640, 0, 2075, 2940, 1908, 0, 0, 0, 0, 2697, 0, 0, '太原学院', '事业', '01', 13495, '074001', NULL, 10798, '142726198109240026', '翟婷婷', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('827f9e0c5cea49b7a9db8e4e7dab36e6', 89, 3.8, 1544, 0, 0, 2650, 0, 3266, 2660, 1418, 0, 0, 0, 0, 2316, 0, 0, '太原学院', '事业', '01', 11630.8, '074001', NULL, 9314.8, '140102197002084035', '李伟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8298fa07832b40b59d1055093343ec78', 89, 0, 1181, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1772, 0, 0, '太原学院', '事业', '01', 8568, '074001', NULL, 6796, '140429199301034826', '赵红飞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('82a0997f03174a73a87f91d4d9f9e22a', 99, 0, 1481, 50, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2222, 0, 0, '太原学院', '事业', '01', 11135, '074001', NULL, 8913, '142301198109134128', '朱建华', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('82d589f57d0b4f0daabb1aa7946e82a8', 69, 0, 1090, 0, 30, 1925, 0, 1005, 2520, 1215, 0, 0, 0, 0, 1635, 0, 0, '太原学院', '事业', '01', 7854, '074001', NULL, 6219, '140581199409260025', '陈思思', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8316e95fb9884918b29720ad4ff55cee', 89, 0, 1230, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1845, 0, 0, '太原学院', '事业', '01', 8781, '074001', NULL, 6936, '14060319941222542X', '苏慧娟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('832ae60e325d434c858814d83da92071', 89, 0, 1224, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1836, 0, 0, '太原学院', '事业', '01', 8693, '074001', NULL, 6857, '14260119870731132X', '刘彦君', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('833457eea3e7437e99f0f6d9e9c54f3e', 104, 0, 1929, 0, 0, 4640, 0, 3266, 2940, 1908, 0, 0, 0, 0, 2894, 0, 0, '太原学院', '事业', '01', 14787, '074001', NULL, 11893, '140102197104015110', '高伟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('840318703ab6437a85439ba537c332cb', 99, 0, 1524, 50, 30, 3260, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2286, 0, 0, '太原学院', '事业', '01', 11508, '074001', NULL, 9222, '14010219810904402X', '董锦', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('840c2310393d4e25a2ac18b306ba93b1', 74, 0, 1220, 0, 30, 1950, 0, 1975, 2520, 1215, 0, 0, 0, 0, 1830, 0, 0, '太原学院', '事业', '01', 8984, '074001', NULL, 7154, '142322198205254041', '刘建芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('84265d6b168b4680afa5956c0bd12fbe', 74, 0, 1093, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1640, 0, 0, '太原学院', '事业', '01', 7791, '074001', NULL, 6151, '140106199511131842', '高佳玲', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('842863c9c18248b2a94f8a4846c8c35f', 99, 0, 1470, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2205, 0, 0, '太原学院', '事业', '01', 11024, '074001', NULL, 8819, '142323198104271025', '荀欢欢', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('844739fff6b548388335d48be62bec60', 99, 0, 1548, 0, 30, 3030, 0, 2689, 2730, 1540, 0, 0, 0, 0, 2322, 0, 0, '太原学院', '事业', '01', 11666, '074001', NULL, 9344, '140103197609140722', '常京霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('845108c1cac34b1189c292df92eda605', 89, 0, 1361, 50, 0, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2042, 0, 0, '太原学院', '事业', '01', 10163, '074001', NULL, 8121, '140123198306300215', '段兆忠', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('849ef87eb8fc409391e5c06e97fd822b', 89, 0, 1216, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1824, 0, 0, '太原学院', '事业', '01', 8603, '074001', NULL, 6779, '140602199606209042', '贾倩楠', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('84bc79db8d534126b706e13fdf1206ee', 89, 0, 1442, 0, 0, 2185, 0, 3026, 2660, 1418, 0, 0, 0, 0, 2163, 0, 0, '太原学院', '事业', '01', 10820, '074001', NULL, 8657, '140108196912285534', '王琴琴', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('84cc1f99742f4546addc738ba8432134', 94, 4.2, 1745, 0, 0, 3455, 0, 3391, 2800, 1810, 0, 0, 0, 0, 2618, 0, 0, '太原学院', '事业', '01', 13299.2, '074001', NULL, 10681.2, '140102196904285173', '卢旺堂', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('84fb064a5ac4406d9fe368ff39037689', 89, 0, 1287, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1931, 0, 0, '太原学院', '事业', '01', 9365, '074001', NULL, 7434, '142603198908181149', '米娟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('85af5f5203cd4c009d47746087f5a0ed', 69, 3.5, 1305, 0, 0, 2260, 0, 2041, 2590, 1365, 0, 0, 0, 0, 1958, 0, 0, '太原学院', '事业', '01', 9633.5, '074001', NULL, 7675.5, '140102197106240012', '连原海', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('85b8c2ab0fff49f382d29a6d6beb3900', 94, 0, 1614, 0, 30, 2880, 0, 3266, 2730, 1551, 0, 0, 0, 0, 2421, 0, 0, '太原学院', '事业', '01', 12165, '074001', NULL, 9744, '142224197110080029', '邢淑芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('85cb886470d441478302489a58c30e35', 89, 0, 1443, 0, 0, 2410, 0, 2689, 2660, 1418, 0, 0, 0, 0, 2165, 0, 0, '太原学院', '事业', '01', 10709, '074001', NULL, 8544, '142202197511200337', '谢中柱', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('85f2a4705fcb411d9bb2472735721d8b', 99, 0, 1431, 0, 30, 3030, 0, 1789, 2730, 1540, 0, 0, 0, 0, 2147, 0, 0, '太原学院', '事业', '01', 10649, '074001', NULL, 8502, '140624198605020524', '谷晓霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8647185c153e4c84ae203acc8a4034b1', 99, 0, 1392, 0, 0, 3030, 0, 1515, 2730, 1540, 0, 0, 0, 0, 2088, 0, 0, '太原学院', '事业', '01', 10306, '074001', NULL, 8218, '142623198902045213', '张毅', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('865c5eebc3694f1ca8d845b3ee9a63bc', 89, 0, 1282, 50, 0, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1923, 0, 0, '太原学院', '事业', '01', 9473, '074001', NULL, 7550, '140104198207011734', '田永刚', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('86654a6ddeb34934846ccec8323e3a6a', 99, 0, 1637, 0, 30, 3260, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2456, 0, 0, '太原学院', '事业', '01', 12437, '074001', NULL, 9981, '140103197201100620', '孙芳芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8672bd61f21541bbb4ad7dfedfbff1e1', 89, 0, 1384, 0, 30, 2185, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2076, 0, 0, '太原学院', '事业', '01', 10241, '074001', NULL, 8165, '142601198107272822', '陈艳花', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('867b377956b840f297c392e546462344', 89, 0, 1331, 0, 0, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 1997, 0, 0, '太原学院', '事业', '01', 9658, '074001', NULL, 7661, '140102198209106515', '潘琛', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('86e9ab552c054d94a1f7aa688f358084', 69, 0, 1056, 0, 30, 1925, 0, 639, 2520, 1215, 0, 0, 0, 0, 1584, 0, 0, '太原学院', '事业', '01', 7454, '074001', NULL, 5870, '652723200006070723', '欧冬其米格', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('86f891549f2849e2a296bf61bb3089d3', 79, 0, 1385, 50, 30, 2520, 0, 2175, 2660, 1383, 0, 0, 0, 0, 2078, 0, 0, '太原学院', '事业', '01', 10282, '074001', NULL, 8204, '140102198006076547', '苏文丽', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('874cf483b2bd4ec185e7fc91be3e37ab', 74, 0, 1230, 50, 30, 1925, 0, 1882, 2520, 1215, 0, 0, 0, 0, 1845, 0, 0, '太原学院', '事业', '01', 8926, '074001', NULL, 7081, '14010719820818066X', '苗青', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8756dfb292154deb966cb58b3fcec0c3', 99, 0, 1478, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2217, 0, 0, '太原学院', '事业', '01', 11032, '074001', NULL, 8815, '140303198201200424', '马丽', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('881925c09f4b4973b0dd31a81e8618bf', 99, 0, 1465, 0, 30, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2198, 0, 0, '太原学院', '事业', '01', 10869, '074001', NULL, 8671, '140102198208316529', '赵晶', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8823e1c1586b4eb381f0ad4d4c004b6c', 94, 0, 1683, 0, 0, 3455, 0, 2689, 2800, 1810, 0, 0, 0, 0, 2525, -1500, 0, '太原学院', '事业', '01', 11031, '074001', NULL, 8506, '140102197710246517', '郑志国', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('885cda0b940d4cd697aabc86592a16dc', 89, 0, 1042, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1563, 0, 0, '太原学院', '事业', '01', 8399, '074001', NULL, 6836, '142202199312010337', '黄小东', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('886b3ae1911c4695a6b334421c656bf9', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '142228199402154522', '张蔚', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('886d2916a7cd489f956d5ce1939b2aa6', 79, 0, 1342, 50, 0, 2520, 0, 1882, 2660, 1383, 0, 0, 0, 0, 2013, -1209, 0, '太原学院', '事业', '01', 3973, '074001', '2025-01-01', 1960, '14012219820915001X', '冯晓文', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('88781c3bcf684201bd2ef036f81fd411', 89, 0, 1374, 50, 30, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2061, 0, 0, '太原学院', '事业', '01', 10206, '074001', NULL, 8145, '140102198112296527', '汤淑红', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('88a211a0fa7c4c979993fbf9144dfc22', 89, 0, 1191, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1787, 0, 0, '太原学院', '事业', '01', 8630, '074001', NULL, 6843, '130526199407024612', '谷金朋', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('88b4397d90f14d17a3354f589f7569c5', 64, 0, 975, 0, 0, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1463, 0, 0, '太原学院', '事业', '01', 8067, '074001', NULL, 6604, '142327199612106632', '王栋', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('88d056bc47764f72a60e409a059433cd', 89, 0, 1273, 50, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1910, 0, 0, '太原学院', '事业', '01', 9401, '074001', NULL, 7491, '140107198310080024', '孙静', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('88d76e04b197402993d5a634a210ebe9', 74, 0, 1081, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1622, 0, 0, '太原学院', '事业', '01', 7779, '074001', NULL, 6157, '140105199408070029', '郭凡琦', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8937e15359fc47d5b4db19a52dfdfcf6', 99, 0, 1504, 0, 30, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2256, 0, 0, '太原学院', '事业', '01', 11208, '074001', NULL, 8952, '652322198010020528', '王蓉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8943606c264c4738ba0aa27c0115ecd2', 74, 0, 1268, 0, 30, 1950, 0, 2275, 2520, 1215, 0, 0, 0, 0, 1902, 0, 0, '太原学院', '事业', '01', 9332, '074001', NULL, 7430, '140302197902010569', '田扬', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8982244dace64ffe97f3fa0351472340', 89, 0, 1282, 0, 0, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1923, 0, 0, '太原学院', '事业', '01', 9237, '074001', NULL, 7314, '14112219881010009X', '郭巍', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8982b7a2abc843219272f46fc1f0e012', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '141102199408300041', '冯叶', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('899595c1c2b54bd8820e06939a3217ca', 89, 0, 1204, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1806, 0, 0, '太原学院', '事业', '01', 8643, '074001', NULL, 6837, '142302199102160017', '高思远', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8a181c1bee7a4c45a536910e69202ff3', 89, 0, 1227, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1841, 0, 0, '太原学院', '事业', '01', 8948, '074001', NULL, 7107, '14021219920930272X', '张抗萍', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8a47e44c1eac45b6b0a82fabc0d72219', 89, 0, 1390, 50, 30, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2085, 0, 0, '太原学院', '事业', '01', 10222, '074001', NULL, 8137, '140113198010051229', '李瑞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8a516bb357a24bbca66ea96c3bc78b57', 89, 0, 1327, 0, 30, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1991, 0, 0, '太原学院', '事业', '01', 9816, '074001', NULL, 7825, '140105198307170042', '吴晓燕', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8a6d131b3c1844a5b68134a7f1f3188f', 89, 0, 1191, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1787, 0, 0, '太原学院', '事业', '01', 8660, '074001', NULL, 6873, '140105199404171869', '张曦', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8aebdcf040234f7d9611d399fb149b24', 74, 0, 1134, 0, 30, 1925, 0, 1339, 2520, 1215, 0, 0, 0, 0, 1701, 0, 0, '太原学院', '事业', '01', 8237, '074001', NULL, 6536, '142731199010270327', '刘洋', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8b090415099c451b94b4b6d035ae45dc', 89, 0, 1332, 50, 0, 2185, 0, 2175, 2660, 1418, 0, 0, 0, 0, 1998, 0, 0, '太原学院', '事业', '01', 9909, '074001', NULL, 7911, '140103198004050614', '曹兴亮', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8b2ffea8dd1d4ea5abfd0417461c9510', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '142333199709290023', '高彩月', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8b6a6262c56a4a798a403ae277307b9d', 89, 0, 1213, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1820, 0, 0, '太原学院', '事业', '01', 8570, '074001', NULL, 6750, '140108199709291617', '曹胜', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8bcdf3368a684393bb3a3cbce9a95b42', 99, 0, 1478, 0, 0, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2217, 0, 0, '太原学院', '事业', '01', 11052, '074001', NULL, 8835, '140102198003033410', '张晓鹏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8c4b3649d8c24771be94097091d13441', 89, 0, 1441, 0, 0, 2650, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2162, 0, 0, '太原学院', '事业', '01', 10733, '074001', NULL, 8571, '142424197709156510', '申世明', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8c81a5b78ef44dfb891379c880865a76', 89, 0, 1201, 0, 0, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1802, 0, 0, '太原学院', '事业', '01', 8722, '074001', NULL, 6920, '142703199408111232', '王国庆', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8cd225280a654f1aa300e153a6eb417f', 99, 0, 1682, 0, 0, 3260, 0, 3516, 2730, 1540, 0, 0, 0, 0, 2523, 0, 0, '太原学院', '事业', '01', 12827, '074001', NULL, 10304, '142224196810090012', '张永清', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8cecef53398c4ed78b0ad5fa9b2cc744', 94, 0, 1605, 0, 0, 2880, 0, 3026, 2730, 1551, 0, 0, 0, 0, 2408, 0, 0, '太原学院', '事业', '01', 11886, '074001', NULL, 9478, '140102197308202030', '董新平', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8cf5feb5365d4a2096ff4795646a3e85', 89, 0, 1348, 50, 30, 2410, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2022, 0, 0, '太原学院', '事业', '01', 9980, '074001', NULL, 7958, '140107198407061268', '宋欣', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8d078d308f2e4c9eac429106b0c322b4', 99, 0, 1411, 0, 30, 3030, 0, 1696, 2730, 1540, 0, 0, 0, 0, 2117, 0, 0, '太原学院', '事业', '01', 10536, '074001', NULL, 8419, '142401198108204222', '边建红', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8d25fce8bb274141ac702ed2cf3dffe1', 69, 0, 1338, 0, 0, 2260, 0, 2221, 2590, 1365, 0, 0, 0, 0, 2007, 0, 0, '太原学院', '事业', '01', 9843, '074001', NULL, 7836, '140112197405153210', '薛寅虎', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8d74e54017ee44a498c96b14c8e3c540', 89, 0, 1348, 0, 0, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2022, 0, 0, '太原学院', '事业', '01', 10000, '074001', NULL, 7978, '140303198009021231', '邹翔斐', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8da07e89fe784c57b2ad3a35e888760e', 89, 0, 971, 0, 30, 2934, 0, 2620, 0, 1386, 0, 0, 0, 0, 1457, 0, 0, '太原学院', '事业', '01', 8030, '074001', NULL, 6573, '140102197107212021', '杨晓慧', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8dafb31718214f18a8810983df878b75', 99, 4.2, 1748, 0, 30, 3260, 0, 3921, 2730, 1540, 0, 0, 0, 0, 2622, 0, 0, '太原学院', '事业', '01', 13332.2, '074001', NULL, 10710.2, '120103196603067028', '孙晋兰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8de026b81be1411bb8c0fc5a71ffc255', 94, 0, 1745, 0, 0, 3455, 0, 3391, 2800, 1810, 0, 0, 0, 0, 2618, 0, 0, '太原学院', '事业', '01', 13295, '074001', NULL, 10677, '140102196911124810', '陈晖', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8df409e1f3b04363a646282d44fa508b', 99, 0, 1428, 0, 0, 3030, 0, 1789, 2730, 1540, 0, 0, 0, 0, 2142, 0, 0, '太原学院', '事业', '01', 10616, '074001', NULL, 8474, '140108198410010812', '胡建功', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8e3e3eb896ed4653ac105bd69421e963', 99, 0, 1550, 0, 30, 3260, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2325, 0, 0, '太原学院', '事业', '01', 11684, '074001', NULL, 9359, '140102197712201486', '赵钦', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8e763ce1bc624822a76e9a9906952d75', 89, 0, 1261, 0, 30, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1892, 0, 0, '太原学院', '事业', '01', 9246, '074001', NULL, 7354, '142431198610032727', '王筱依', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8e9d6e316cad402a860b4b53067b7154', 89, 0, 1322, 50, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1983, 0, 0, '太原学院', '事业', '01', 9829, '074001', NULL, 7846, '142302198107230542', '杨艳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8ee90b09d5104a42a01446fc1cdd42bb', 89, 0, 1272, 0, 30, 2185, 0, 1515, 2660, 1418, 0, 0, 0, 0, 1908, 0, 0, '太原学院', '事业', '01', 9169, '074001', NULL, 7261, '140106198809113028', '武洁', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8f5f95bd8f3a4edaa0f1c8f9c3d81576', 104, 0, 2185, 0, 30, 6070, 0, 3781, 2940, 1908, 0, 0, 0, 0, 3278, 0, 0, '太原学院', '事业', '01', 17018, '074001', NULL, 13740, '140104197010141346', '董春娟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8fad8408be184a068abc8d897f5b49f0', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '450305199010200042', '解伊瑞雯', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8fb7ca5583cd4c779f688ae8e176bb26', 89, 0, 1053, 50, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1580, 0, 0, '太原学院', '事业', '01', 9274, '074001', NULL, 7694, '140106198511250628', '薛愈洁', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8fb80df7f3744f70abd6e3ae61783128', 99, 4.2, 1682, 0, 0, 3260, 0, 3516, 2730, 1540, 0, 0, 0, 0, 2523, 0, 0, '太原学院', '事业', '01', 12831.2, '074001', NULL, 10308.2, '61011319691114045X', '巩利平', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('8fba12522a434ba3b682b9350cf14f2d', 89, 0, 1414, 50, 0, 2410, 0, 2582, 2660, 1418, 0, 0, 0, 0, 2121, 0, 0, '太原学院', '事业', '01', 10623, '074001', NULL, 8502, '142228197807110019', '张献军', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('90132f664c8f4559ad446e1ff428abf8', 89, 0, 1331, 50, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1997, 0, 0, '太原学院', '事业', '01', 9838, '074001', NULL, 7841, '140103198203161245', '黄美娜', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9068cf0038414ec9a5c7a7118e7085f2', 94, 0, 1403, 50, 30, 2880, 0, 1696, 2730, 1551, 0, 0, 0, 0, 2105, 0, 0, '太原学院', '事业', '01', 10434, '074001', NULL, 8329, '140311198511141829', '张雅平', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9083e1605fb341159b0c3fa68201f733', 89, 0, 1307, 50, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1961, 0, 0, '太原学院', '事业', '01', 9621, '074001', NULL, 7660, '142601198607082128', '张月', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('909b6399aac84177927525a297f78d4b', 89, 0, 1435, 0, 30, 2650, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2153, 0, 0, '太原学院', '事业', '01', 10757, '074001', NULL, 8604, '14272419770113054X', '李霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('91441e99697f4a0897657ea654d9da43', 89, 0, 1227, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1841, 0, 0, '太原学院', '事业', '01', 8948, '074001', NULL, 7107, '140107198604031228', '成坤', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9158b7a248e0412abb85fa76122c60c0', 99, 0, 1524, 0, 30, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2286, 0, 0, '太原学院', '事业', '01', 11228, '074001', NULL, 8942, '410184197910162561', '武冬莲', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('91634cbf852446ebb4c3df80b62e38ab', 89, 0, 1431, 50, 0, 2650, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2147, 0, 0, '太原学院', '事业', '01', 10773, '074001', NULL, 8626, '14032119771229271X', '董海瑞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9209a65349674b51b7ec3864c2d341b3', 99, 0, 1493, 0, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2240, 0, 0, '太原学院', '事业', '01', 10997, '074001', NULL, 8757, '140103198002271229', '马建英', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('928d4217c5104752a522edd110e0bb46', 89, 0, 1238, 0, 30, 2185, 0, 1427, 2660, 1418, 0, 0, 0, 0, 1857, 0, 0, '太原学院', '事业', '01', 9047, '074001', NULL, 7190, '140424199006294842', '李泽琳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('92e4abb5ac244c44a1c5e9610043f413', 89, 0, 1518, 0, 0, 2650, 0, 3141, 2660, 1418, 0, 0, 0, 0, 2277, 0, 0, '太原学院', '事业', '01', 11476, '074001', NULL, 9199, '140102197009181233', '多刚', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('93d42686c17f44b8b4a04d5b9585a45b', 89, 0, 1319, 0, 0, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1979, 0, 0, '太原学院', '事业', '01', 9553, '074001', NULL, 7574, '140103198006114212', '班波', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('944b7c4515ce40779833fbb707781aba', 99, 0, 1478, 50, 0, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2217, 0, 0, '太原学院', '事业', '01', 11102, '074001', NULL, 8885, '140122198210220011', '方向明', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('944c5a6bc16546bc966a4024d6bc26b7', 89, 0, 1215, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1823, 0, 0, '太原学院', '事业', '01', 8848, '074001', NULL, 7025, '142402199307030625', '雷晓丹', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('946a3b89926f43f28e9e5ac8c0bd3d1b', 89, 0, 1262, 0, 0, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1893, 0, 0, '太原学院', '事业', '01', 8953, '074001', NULL, 7060, '14020319900812561X', '刘凯', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('948919ac78e541369955c17a16581d8a', 104, 0, 2047, 0, 30, 4345, 0, 4061, 3080, 2100, 0, 0, 0, 0, 3071, 0, 0, '太原学院', '事业', '01', 15767, '074001', NULL, 12696, '142401196808130325', '刘月红', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('94cc60ac8a2d471ea5b073626f1afe37', 99, 0, 1478, 0, 0, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2217, 0, 0, '太原学院', '事业', '01', 11052, '074001', NULL, 8835, '140110198209191019', '师永强', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('94fe3ef9b6b34e719cb5d55e31b37237', 99, 4.1, 1844, 50, 30, 3810, 8, 3921, 2730, 1540, 0, 0, 0, 0, 2766, 0, 0, '太原学院', '事业', '01', 14036.1, '074001', NULL, 11270.1, '140102196801223420', '梁晓琴', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('94ff3e3ffb954e7a88f45b23f07f28a4', 89, 0, 1392, 50, 0, 2650, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2088, 0, 0, '太原学院', '事业', '01', 10434, '074001', NULL, 8346, '140102198101274015', '张帆', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('955cbdb107374211bfa1e696532e0dba', 89, 0, 1240, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1860, 0, 0, '太原学院', '事业', '01', 8873, '074001', NULL, 7013, '142301199007200264', '张钰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9593206aa6e94e378e95756bc0e6a8ee', 89, 0, 1297, 50, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1946, 0, 0, '太原学院', '事业', '01', 9611, '074001', NULL, 7665, '142702198304270326', '李婷', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('96e0da00fc7c4f9db7fd56abcadeb088', 89, 0, 1390, 0, 30, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2085, 0, 0, '太原学院', '事业', '01', 10172, '074001', NULL, 8087, '140103197806030661', '张旭', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('96ee9683cc9243ec8716201cc7f249f3', 94, 0, 1628, 0, 0, 3455, 0, 3141, 2800, 1810, 0, 0, 0, 0, 2442, 5320, 0, '太原学院', '事业', '01', 18248, '074001', '2025-07-01', 15806, '140102197102200013', '刘晋涛', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9700e230076d41b099557dddce64ecef', 89, 0, 1324, 50, 30, 2410, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1986, 0, 0, '太原学院', '事业', '01', 9770, '074001', NULL, 7784, '140122198505281129', '潘晓霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9713a6053b1f44fa80fb9c450c293b80', 69, 0, 1165, 0, 30, 1925, 0, 1515, 2520, 1215, 0, 0, 0, 0, 1748, 0, 0, '太原学院', '事业', '01', 8439, '074001', NULL, 6691, '140121198301197228', '杨亚玲', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('978fb874aef64d37a27ae20068288338', 89, 0, 1270, 50, 0, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1905, 0, 0, '太原学院', '事业', '01', 9368, '074001', NULL, 7463, '140107198311252238', '聂瑞涛', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('97c1fa9baf8847c98e73c984a7a7f9a7', 99, 0, 1478, 0, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2217, 0, 0, '太原学院', '事业', '01', 10982, '074001', NULL, 8765, '140311198011260944', '余瑞霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('97cccecd586647648b9e90290df3f9f8', 89, 0, 1331, 0, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1997, 0, 0, '太原学院', '事业', '01', 9788, '074001', NULL, 7791, '140103198202221541', '牛原', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('97e1e734dd6f441fb0f0c57e4e36ce33', 89, 0, 1181, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1772, 0, 0, '太原学院', '事业', '01', 8568, '074001', NULL, 6796, '130625199107110825', '司丽超', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('97fb50c45b154081ad8910091b62f0d9', 99, 4.6, 1843, 0, 0, 3810, 0, 4201, 2730, 1540, 0, 0, 0, 0, 2765, 0, 0, '太原学院', '事业', '01', 14227.6, '074001', NULL, 11462.6, '140102196609231914', '闫永红', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9804863390074cf0973363a5224cd84d', 99, 0, 1466, 0, 30, 3030, 0, 1789, 2730, 1540, 0, 0, 0, 0, 2199, 0, 0, '太原学院', '事业', '01', 10684, '074001', NULL, 8485, '14263319860111226X', '任姣丽', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('981f723764254cb4a1edd70d05715eb4', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '142703199611023625', '原睿楠', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('982820129f824cb1ac6a9722647ef30a', 99, 0, 1708, 0, 30, 3810, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2562, 0, 0, '太原学院', '事业', '01', 13058, '074001', NULL, 10496, '140102197109084828', '李瑞军', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9886727c8bf544398b2f9b84a95006b7', 69, 0, 1141, 0, 0, 1925, 0, 1427, 2520, 1215, 0, 0, 0, 0, 1712, 0, 0, '太原学院', '事业', '01', 8297, '074001', NULL, 6585, '140107198911043317', '张斌', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('98a445c1f25a4a24acf9d8901b6aef2c', 89, 0, 1361, 0, 0, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2042, 0, 0, '太原学院', '事业', '01', 10113, '074001', NULL, 8071, '14042919781115321X', '郁建军', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('990b90e6b7ac4ef3ad58c0e5363e08c6', 74, 0, 1242, 0, 30, 1950, 0, 2075, 2520, 1215, 0, 0, 0, 0, 1863, 0, 0, '太原学院', '事业', '01', 9106, '074001', NULL, 7243, '140105198209200543', '王赟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9956407acb604df98c9c37664564df4f', 89, 0, 1378, 0, 30, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2067, 0, 0, '太原学院', '事业', '01', 10260, '074001', NULL, 8193, '142331198107090529', '张颖', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('99793a194fd9419da12d8c96fb3c2ed2', 89, 0, 1347, 0, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2021, 0, 0, '太原学院', '事业', '01', 9804, '074001', NULL, 7783, '140102198106042344', '刘譞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9a69bb2574664af4bd15bd3beab8a168', 89, 0, 1306, 0, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1959, 0, 0, '太原学院', '事业', '01', 9570, '074001', NULL, 7611, '14010219820518062X', '李江雯', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9a6e80dcb8874843b46b974b4767e0c6', 99, 0, 1504, 0, 0, 3260, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2256, 0, 0, '太原学院', '事业', '01', 11208, '074001', NULL, 8952, '140302198001160556', '傅斌', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9a8dc16241044ab389fc82f9ddee611e', 69, 0, 1170, 0, 30, 1925, 0, 1427, 2520, 1215, 0, 0, 0, 0, 1755, 0, 0, '太原学院', '事业', '01', 8356, '074001', NULL, 6601, '140122198401090125', '李娜', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9aa9cbc81cb840058e831529246a3b3b', 89, 0, 1188, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1782, 0, 0, '太原学院', '事业', '01', 8627, '074001', NULL, 6845, '141125199203025431', '刘亮亮', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9b240edff6f04f8c9ff4baa0bbb5105e', 89, 0, 1042, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1563, 0, 0, '太原学院', '事业', '01', 8399, '074001', NULL, 6836, '140522199507150014', '李志玲', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9bbb12ee34b4409f96acd1f451bd61fb', 89, 0, 1213, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1820, 0, 0, '太原学院', '事业', '01', 8570, '074001', NULL, 6750, '142629199207182518', '薛欣', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9bd968da5e884196af1cf9d970da66bb', 94, 3.6, 1818, 0, 30, 3455, 0, 3921, 2800, 1810, 0, 0, 0, 0, 2727, 0, 0, '太原学院', '事业', '01', 13931.6, '074001', NULL, 11204.6, '140102197104234022', '周方', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9c549b3c278e4810bc18d6cda7a39736', 99, 0, 1480, 0, 30, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2220, 0, 0, '太原学院', '事业', '01', 10884, '074001', NULL, 8664, '370983198509231822', '李慧', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9c85e9d9f1274c35bed6056dfa215895', 99, 0, 1490, 0, 0, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2235, 0, 0, '太原学院', '事业', '01', 10964, '074001', NULL, 8729, '140103198205130653', '石峰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9cf68e83ea804e44824585a41e7c59ff', 99, 0, 1478, 0, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2217, 0, 0, '太原学院', '事业', '01', 10789, '074001', NULL, 8572, '140181198609022826', '武宇红', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9d11876de7dc4af09d573889cd781da2', 89, 0, 1327, 50, 30, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1991, 0, 0, '太原学院', '事业', '01', 9866, '074001', NULL, 7875, '410823198104276222', '田丽', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9d1424ef0e3f445a975515cfcf752ae9', 89, 0, 1236, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1854, 0, 0, '太原学院', '事业', '01', 8957, '074001', NULL, 7103, '140105199207071842', '原敏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9d49d485386f48558bff3af893379764', 99, 0, 1653, 0, 30, 3260, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2480, 0, 0, '太原学院', '事业', '01', 12578, '074001', NULL, 10098, '140102197004152089', '王左艳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9d51afb38e2244b8b1e3660284d88c02', 104, 0, 1926, 0, 30, 4640, 0, 3026, 2940, 1908, 0, 0, 0, 0, 2889, 0, 0, '太原学院', '事业', '01', 14574, '074001', NULL, 11685, '140102197611082342', '金波', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9d5ff2f38d574f29a473b1fde07cc59b', 89, 0, 1295, 0, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1943, 0, 0, '太原学院', '事业', '01', 9466, '074001', NULL, 7523, '14270219870202274X', '明小菊', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9d85733990f04186953890160bca878d', 94, 0, 1558, 0, 0, 3455, 0, 2475, 2800, 1810, 0, 0, 0, 0, 2337, 3073, 0, '太原学院', '事业', '01', 15265, '074001', '2025-07-01', 12928, '140102197510206510', '王东亮', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9d9e389f7a324d89a1345fbcdb09cb9a', 89, 0, 1201, 0, 0, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1802, 0, 0, '太原学院', '事业', '01', 8722, '074001', NULL, 6920, '370112198701185150', '吴立明', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9dbd0ed401ee42f7950a906e6356dde4', 99, 0, 1494, 50, 30, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2241, 0, 0, '太原学院', '事业', '01', 11248, '074001', NULL, 9007, '140226198111137045', '李晓卿', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9dd15f522dba4590b2c5b852620941db', 94, 2.9, 1584, 50, 0, 2880, 0, 3026, 2730, 1551, 0, 0, 0, 0, 2376, 0, 0, '太原学院', '事业', '01', 11917.9, '074001', NULL, 9541.9, '140104197209211735', '贾尚武', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9de3ef1dba51415b9a51b1068d1677ea', 89, 0, 1285, 0, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1928, 0, 0, '太原学院', '事业', '01', 9456, '074001', NULL, 7528, '140107198411120662', '赵丽莎', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9e1d1eb55191468995bfc68d13445f4a', 89, 0, 1534, 0, 0, 2650, 0, 3266, 2660, 1418, 0, 0, 0, 0, 2301, 0, 0, '太原学院', '事业', '01', 11617, '074001', NULL, 9316, '142401196909142413', '乔国峰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9e66c763c69046ad8f2da256264e8496', 99, 0, 1497, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2246, 0, 0, '太原学院', '事业', '01', 11051, '074001', NULL, 8805, '140107198301071724', '邢娜', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9e7e1040ec564f62924c4a0ae42e6200', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '130603199202152160', '杜洋洋', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9f03da8d6890466f8fd21a6ffdf843c2', 89, 0, 1316, 0, 0, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 1974, 0, 0, '太原学院', '事业', '01', 9643, '074001', NULL, 7669, '140105198301060037', '蔡仲博', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9f5d0781c4b0490d82651c304f70e885', 89, 0, 1374, 0, 30, 2185, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2061, 0, 0, '太原学院', '事业', '01', 10231, '074001', NULL, 8170, '140402198002191624', '散利迪', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9fbfc5c9d45442c193884b891c85168e', 89, 0, 1291, 0, 0, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1937, 0, 0, '太原学院', '事业', '01', 9432, '074001', NULL, 7495, '140107198210191739', '崔阳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('9ff469bdf3354a30a844b70d7726adaa', 74, 0, 1111, 0, 30, 1925, 0, 1087, 2520, 1215, 0, 0, 0, 0, 1667, 0, 0, '太原学院', '事业', '01', 7962, '074001', NULL, 6295, '140622199302110102', '任丹丹', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a0194067fcdb45da8cfbb4d4e2d5e280', 99, 0, 1507, 50, 30, 3030, 0, 2375, 2730, 1540, 0, 0, 0, 0, 2261, 0, 0, '太原学院', '事业', '01', 11361, '074001', NULL, 9100, '140102198002032328', '贾娟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a05115a4536440d5946e73297679c08d', 55.2, 0, 550, 0, 0, 1540, 0, 1212, 0, 972, 0, 0, 0, 0, 825, 0, 0, '太原学院', '事业', '01', 4329.2, '074001', NULL, 3504.2, '140103196807161239', '王曦华', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a0641a8538a0493a845c7c70a671360b', 99, 4.2, 1810, 0, 30, 3810, 0, 3921, 2730, 1540, 0, 0, 0, 0, 2715, 0, 0, '太原学院', '事业', '01', 13944.2, '074001', NULL, 11229.2, '140102196810100641', '何瑞芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a0e47b1f397c4a12b61ead5b1fec6e16', 89, 0, 1374, 0, 30, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2061, 0, 0, '太原学院', '事业', '01', 10156, '074001', NULL, 8095, '140311198004040628', '郑文芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a129dcd619384d6ab24e782e5cb89c03', 99, 0, 1545, 0, 0, 3030, 0, 2689, 2730, 1540, 0, 0, 0, 0, 2318, 0, 0, '太原学院', '事业', '01', 11633, '074001', NULL, 9315, '142733197603130331', '黄起才', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a13922349aa6449e9d2f27ca6172a661', 74, 0, 1081, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1622, 0, 0, '太原学院', '事业', '01', 7779, '074001', NULL, 6157, '140107199408260626', '孙宇璇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a1464394c3ba4e268929bb49a34dc573', 89, 0, 1322, 0, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1983, 0, 0, '太原学院', '事业', '01', 9586, '074001', NULL, 7603, '13012319851212154X', '张硕', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a1a205db3d6144349ff70b00f9e37ead', 89, 0, 1278, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1917, 0, 0, '太原学院', '事业', '01', 9356, '074001', NULL, 7439, '142225198105100524', '白利霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a1add060bc9b43e9a835822e0ac9a8da', 94, 4, 1836, 0, 30, 3455, 0, 4061, 2800, 1810, 0, 0, 0, 0, 2754, 0, 0, '太原学院', '事业', '01', 14090, '074001', NULL, 11336, '140104196711090823', '李冬英', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a1aed160dc1b48e1929f901296d8bd60', 99, 0, 1416, 0, 0, 3030, 0, 1696, 2730, 1540, 0, 0, 0, 0, 2124, 0, 0, '太原学院', '事业', '01', 10511, '074001', NULL, 8387, '150204198109270115', '毛斌', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a1b6f779382a4b25b284778a6479dc54', 99, 0, 1491, 50, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2237, 0, 0, '太原学院', '事业', '01', 11145, '074001', NULL, 8908, '140122197910070021', '张臻', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a212e3dffb584d5a98c8544490bfe818', 89, 0, 1331, 0, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1997, 0, 0, '太原学院', '事业', '01', 9788, '074001', NULL, 7791, '140104198110100028', '王卓蓉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a27e21679fe143a39c17ba579664b3e6', 89, 0, 1041, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1562, 0, 0, '太原学院', '事业', '01', 8428, '074001', NULL, 6866, '142726199602213325', '郝爽', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a2ae360f64a94025bd573576cc1a5bba', 94, 0, 1732, 50, 0, 3455, 0, 3026, 2800, 1810, 0, 0, 0, 0, 2598, 0, 0, '太原学院', '事业', '01', 12967, '074001', NULL, 10369, '140102197602270050', '姚海彬', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a2b5b5a5a39a461cb4972c67ccffc7fa', 89, 0, 1352, 50, 30, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 2028, 0, 0, '太原学院', '事业', '01', 9891, '074001', NULL, 7863, '142603198509202029', '武婧', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a2d0ca2ca07b494cb6d1130acda0ab86', 69, 2.9, 1305, 0, 0, 1925, 0, 2689, 2520, 1215, 0, 0, 0, 0, 1958, 0, 0, '太原学院', '事业', '01', 9725.9, '074001', NULL, 7767.9, '140104197103073717', '马福君', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a2dac449dfb14853bc46a6feddc772ac', 89, 0, 1338, 0, 30, 2410, 0, 1789, 2660, 1418, 0, 0, 0, 0, 2007, 0, 0, '太原学院', '事业', '01', 9734, '074001', NULL, 7727, '142431198610127523', '李莉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a3160abd757340af940fc134111538a9', 79, 0, 1327, 50, 0, 2200, 0, 2175, 2590, 1292, 0, 0, 0, 0, 1991, 0, 0, '太原学院', '事业', '01', 9713, '074001', NULL, 7722, '140122197805040015', '杨俊卿', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a316c8cf2e3f41aa9ddf1512ebfe0350', 69, 0, 1273, 0, 30, 2260, 0, 1703, 2590, 1365, 0, 0, 0, 0, 1910, 0, 0, '太原学院', '事业', '01', 9290, '074001', NULL, 7380, '140104197803094180', '畅旭莉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a333054c83b643468d3874b111828901', 74, 0, 1249, 0, 0, 1925, 0, 2175, 2520, 1215, 0, 0, 0, 0, 1874, 0, 0, '太原学院', '事业', '01', 9158, '074001', NULL, 7284, '140102197602235116', '王磊', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a34125514b6b4b4cad0c3c851c4bac85', 89, 0, 1191, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1787, 0, 0, '太原学院', '事业', '01', 8660, '074001', NULL, 6873, '370882199302234228', '白雅雯', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a37101fa7eb941fe9a94828bd5ec67f7', 99, 0, 1455, 0, 30, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2183, 0, 0, '太原学院', '事业', '01', 10859, '074001', NULL, 8676, '140106198301160624', '李芸屹', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a3927b2bbf054783a120773efeb778ba', 99, 0, 1504, 50, 30, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2256, 0, 0, '太原学院', '事业', '01', 11258, '074001', NULL, 9002, '130225197909203723', '李娟娟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a3ab9c4e07dc4fd79077c5e21517407a', 74, 0, 968, 0, 0, 1925, 0, 1427, 2520, 1215, 3360, 0, 0, 0, 1452, 32378, 0, '太原学院', '事业', '01', 43867, '074001', NULL, 42415, '140225198803292218', '麻廷平', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a3f4dfdc571542e2b0a17dc266fec5a0', 89, 0, 1314, 0, 30, 2410, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1971, 0, 0, '太原学院', '事业', '01', 9710, '074001', NULL, 7739, '142303198511140123', '苏静', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a421d0f6de1440ac9d5e6f2c5ec1b144', 74, 0, 1097, 0, 30, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1646, 0, 0, '太原学院', '事业', '01', 7724, '074001', NULL, 6078, '142429199706282125', '成家慧', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a4b72a18f20e452d9ccc6886001e8ac8', 74, 0, 1134, 0, 30, 1925, 0, 1339, 2520, 1215, 0, 0, 0, 0, 1701, 0, 0, '太原学院', '事业', '01', 8237, '074001', NULL, 6536, '140107198704141221', '王喆', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a4cad17d83d1431a82bf1f440a608eb5', 89, 0, 1041, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1562, 0, 0, '太原学院', '事业', '01', 8674, '074001', NULL, 7112, '142225199304251020', '周婧', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a4e58b9c0a434db59c96121a30392eaf', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '140108199807293923', '张睿芝', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a585975a520f4c8f88b5c2693eff6e8a', 89, 0, 1037, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1556, 0, 0, '太原学院', '事业', '01', 8394, '074001', NULL, 6838, '370612199503050038', '赵春全', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a5f6404f57464ce4a1bd4c3ffdec8f89', 99, 0, 1575, 0, 30, 3260, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2363, 0, 0, '太原学院', '事业', '01', 11709, '074001', NULL, 9346, '140102197706281440', '昝红宇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a61ccfc376524eb6bdadee43e26c0f50', 99, 0, 1490, 50, 0, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2235, 0, 0, '太原学院', '事业', '01', 11014, '074001', NULL, 8779, '140102198009250635', '白宝平', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a64bbc6f9ee74ecc96a97f283d459387', 79, 0, 1252, 0, 0, 2200, 0, 1789, 2590, 1292, 0, 0, 0, 0, 1878, 0, 0, '太原学院', '事业', '01', 9202, '074001', NULL, 7324, '140622198612190019', '俞晓峰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a675c4c6e9654f9cb9207836d4446415', 89, 0, 1205, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1808, 0, 0, '太原学院', '事业', '01', 8756, '074001', NULL, 6948, '142326199303042720', '李新花', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a6d84ec00f2f4fbc9a3650e919df006d', 89, 0, 1414, 0, 0, 2650, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2121, 0, 0, '太原学院', '事业', '01', 10506, '074001', NULL, 8385, '142723197911203317', '李建军', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a6f60fffaa2b4c74ade56d584e71043d', 94, 0, 1635, 0, 30, 3455, 0, 2275, 2800, 1810, 0, 0, 0, 0, 2453, 0, 0, '太原学院', '事业', '01', 12099, '074001', NULL, 9646, '142231197904040102', '曹剑', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a76a35ebbb494a6d9d977fec69a40ad8', 69, 4.5, 1453, 0, 0, 2260, 0, 2989, 2590, 1365, 0, 0, 0, 0, 2180, 0, 0, '太原学院', '事业', '01', 10730.5, '074001', NULL, 8550.5, '140103196511110037', '郝清义', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a7721d52d54d42e3a51107d7d71d2493', 89, 0, 1387, 50, 30, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2081, 0, 0, '太原学院', '事业', '01', 10319, '074001', NULL, 8238, '140104198108060389', '任彦卿', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a7767e6d8b3b48fd971fcfccf6e10396', 89, 0, 1224, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1836, 0, 0, '太原学院', '事业', '01', 8693, '074001', NULL, 6857, '142623199406064049', '崔国华', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a7ce40fd008147ed96d55a7a118f083a', 89, 0, 1341, 0, 30, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 2012, 0, 0, '太原学院', '事业', '01', 9830, '074001', NULL, 7818, '511028198401275149', '李吉艳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a8147f32a4cf45f9b16ba753e40def7b', 99, 0, 1545, 50, 30, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2318, 0, 0, '太原学院', '事业', '01', 11499, '074001', NULL, 9181, '14010219800406514X', '梁彦', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a83b741865054bcf8467e4f063bb82b9', 99, 0, 1413, 0, 30, 3030, 0, 1696, 2730, 1540, 0, 0, 0, 0, 2120, 0, 0, '太原学院', '事业', '01', 10538, '074001', NULL, 8418, '142703198511170367', '周琳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a83d183af02d49f18edf62d6773f308d', 74, 0, 1226, 50, 0, 1925, 0, 2075, 2520, 1215, 0, 0, 0, 0, 1839, 0, 0, '太原学院', '事业', '01', 9085, '074001', NULL, 7246, '140102198006141417', '郭巍', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a86ad728120745219567b9e53bc48e1a', 89, 0, 1373, 0, 30, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2060, 0, 0, '太原学院', '事业', '01', 10155, '074001', NULL, 8095, '142323198204080226', '何源', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a8937c6300ec41d6860c61332c7c9685', 99, 0, 1577, 0, 30, 3030, 0, 2911, 2730, 1540, 0, 0, 0, 0, 2366, 0, 0, '太原学院', '事业', '01', 11917, '074001', NULL, 9551, '140121197302178040', '杨翠峰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a8a0f688c6d24c148759a9fa9a762d21', 89, 0, 1294, 50, 0, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1941, 0, 0, '太原学院', '事业', '01', 9578, '074001', NULL, 7637, '140106198409170015', '李烨东', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a8d6170aff0d4b15b6093c52ad31ee15', 99, 0, 1465, 50, 0, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2198, 0, 0, '太原学院', '事业', '01', 10989, '074001', NULL, 8791, '140602198110041739', '张晓明', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a8e5d2b933c449f8bc764282fdc03bd1', 74, 0, 1117, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1676, 0, 0, '太原学院', '事业', '01', 7815, '074001', NULL, 6139, '142401199401104225', '康晓婷', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a8efa8b8f48a490caa3a35e6a1712321', 99, 0, 1407, 0, 30, 3030, 0, 1603, 2730, 1540, 0, 0, 0, 0, 2111, 0, 0, '太原学院', '事业', '01', 10439, '074001', NULL, 8328, '140321198807170947', '岳娜', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a9165c0623964a9fb8a09d1e6513ced6', 99, 0, 1573, 0, 0, 3030, 0, 2911, 2730, 1540, 0, 0, 0, 0, 2360, 0, 0, '太原学院', '事业', '01', 11883, '074001', NULL, 9523, '14112419730127011X', '闫震普', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a92772fe17ab4fb8a91f56811c91939a', 89, 0, 1238, 0, 30, 2185, 0, 1427, 2660, 1418, 0, 0, 0, 0, 1857, 0, 0, '太原学院', '事业', '01', 9047, '074001', NULL, 7190, '230505199003270528', '郭宇朦', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a962f2318d8347819c07dbe01a7d1b0e', 99, 0, 1529, 0, 30, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2294, 0, 0, '太原学院', '事业', '01', 11433, '074001', NULL, 9139, '140431197704184821', '郭慧', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a983e2104387485caa8bc322e3cc9ad2', 69, 0, 1043, 0, 30, 1925, 0, 639, 2520, 1215, 0, 0, 0, 0, 1565, 0, 0, '太原学院', '事业', '01', 7441, '074001', NULL, 5876, '654028199911040807', '马晓琴', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a98db65a358d4b41adb05921db60a0b8', 79, 0, 1242, 0, 30, 2200, 0, 1603, 2590, 1292, 0, 0, 0, 0, 1863, 0, 0, '太原学院', '事业', '01', 9036, '074001', NULL, 7173, '140106198512132543', '马小清', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a9cbc0b010e24a52850ac1e5a32c892c', 89, 0, 1365, 50, 30, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2048, 0, 0, '太原学院', '事业', '01', 10197, '074001', NULL, 8149, '140123198312240220', '王晓鑫', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('a9e24c26f51b4918912b13389c29db9e', 74, 0, 1126, 0, 30, 1925, 0, 1087, 2520, 1215, 0, 0, 0, 0, 1689, 0, 0, '太原学院', '事业', '01', 7977, '074001', NULL, 6288, '140109199412301040', '王晶', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('aa38d4809897425ab9961e012730c8af', 89, 0, 1294, 50, 0, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1941, 0, 0, '太原学院', '事业', '01', 9578, '074001', NULL, 7637, '432503198305215016', '王玉华', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ab0f0e94bf62450e8de12d09e6141410', 99, 0, 1373, 0, 30, 3030, 0, 1339, 2730, 1540, 0, 0, 0, 0, 2060, 0, 0, '太原学院', '事业', '01', 10141, '074001', NULL, 8081, '14022319930903002X', '张秀玲', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ab8bce77c6b14f52ab75a76e329f0937', 94, 0, 1437, 0, 0, 2880, 0, 2075, 2730, 1551, 0, 0, 0, 0, 2156, 0, 0, '太原学院', '事业', '01', 10767, '074001', NULL, 8611, '142433198104031652', '张新生', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('aba9462aceba49978d3f62b346ee77ec', 74, 0, 1205, 0, 30, 1925, 0, 1882, 2520, 1215, 0, 0, 0, 0, 1808, 0, 0, '太原学院', '事业', '01', 8851, '074001', NULL, 7043, '140102198007256523', '崔静', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ac46a5f6127f46c09e9bb6db7220b192', 99, 0, 1481, 0, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2222, 0, 0, '太原学院', '事业', '01', 11085, '074001', NULL, 8863, '142429198112043827', '游秀芬', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ac55462c28ee4baba01506c097e7d69a', 99, 0, 1479, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2219, 0, 0, '太原学院', '事业', '01', 11033, '074001', NULL, 8814, '14010219801222514X', '张舒婷', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ac6bc1ec3b9249df95245a0c477ec407', 74, 0, 1081, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1622, 0, 0, '太原学院', '事业', '01', 7779, '074001', NULL, 6157, '140223199506226267', '王宏荣', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ac80255ef15f42939c57e89b2d6b6115', 99, 3.2, 1622, 0, 30, 3260, 0, 3026, 2730, 1540, 0, 0, 0, 0, 2433, 0, 0, '太原学院', '事业', '01', 12310.2, '074001', NULL, 9877.2, '140102197208312320', '任雪娟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ac9a261ec9bf4c6abbb9e541a9940f08', 99, 0, 1562, 50, 30, 3260, 0, 2375, 2730, 1540, 0, 0, 0, 0, 2343, 0, 0, '太原学院', '事业', '01', 11646, '074001', NULL, 9303, '142701198102183623', '霍霄妮', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('acc1a0b7e72542759af3b370f5c60055', 89, 0, 1391, 50, 30, 2410, 0, 2375, 2660, 1418, 0, 0, 0, 0, 2087, 0, 0, '太原学院', '事业', '01', 10423, '074001', NULL, 8336, '140203197812106226', '陈素云', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ad3dc46d9f264694a2f08627846f73e4', 99, 0, 1477, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2216, 0, 0, '太原学院', '事业', '01', 11031, '074001', NULL, 8815, '140181198101044741', '刘芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('adeae040866f41c185b1ccce3d5f3854', 89, 0, 1352, 0, 30, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2028, 0, 0, '太原学院', '事业', '01', 10034, '074001', NULL, 8006, '140102197901235167', '弓艳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ae01a8766b1f4e4aa33eb6d9f8783e22', 74, 0, 1180, 50, 30, 1925, 0, 1696, 2520, 1215, 0, 0, 0, 0, 1770, 0, 0, '太原学院', '事业', '01', 8690, '074001', NULL, 6920, '140106198406221841', '张敏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ae406d4bcc1f4e178929fad05bcf65c6', 99, 0, 1477, 0, 0, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2216, 0, 0, '太原学院', '事业', '01', 10851, '074001', NULL, 8635, '140621198001133115', '杨宝军', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ae60c946d40e4d39b201d1d329c4b678', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '142727199408295028', '马恩娟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('aed9d1eee2424905a70d89cac0ce8cbf', 89, 0, 1227, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1841, 0, 0, '太原学院', '事业', '01', 8948, '074001', NULL, 7107, '140109199110120025', '苏蕾', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('af34870b5cf2477eb6258115fa855155', 64, 3.2, 1278, 0, 0, 1765, 0, 2689, 2520, 1180, 0, 0, 0, 0, 1917, 0, 0, '太原学院', '事业', '01', 9499.2, '074001', NULL, 7582.2, '140104196905310011', '王强', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('afb95bf0de944a228fd761d7ec8c2452', 89, 0, 1282, 0, 0, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1923, 0, 0, '太原学院', '事业', '01', 9423, '074001', NULL, 7500, '140106198507243011', '闫钊', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('afd8569ebeec49d48e9affb5f904ca43', 89, 0, 1399, 0, 0, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2099, 0, 0, '太原学院', '事业', '01', 10251, '074001', NULL, 8152, '140424197708300013', '黄海波', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b0468277379e44db91fcac0fa321ae95', 89, 0, 1041, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1562, 0, 0, '太原学院', '事业', '01', 8428, '074001', NULL, 6866, '142402199501285429', '张璐璐', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b0cc85bc844b4bd794c913448f65035c', 99, 0, 1719, 0, 30, 3810, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2579, 0, 0, '太原学院', '事业', '01', 13069, '074001', NULL, 10490, '14223019710627002X', '郝强', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b0f5ae6b2dbb47b08a40db88c1edfa7e', 99, 0, 1369, 0, 0, 3030, 0, 1339, 2730, 1540, 0, 0, 0, 0, 2054, 0, 0, '太原学院', '事业', '01', 10107, '074001', NULL, 8053, '140110199302112017', '杜丽勇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b13d28d1ffc248d8a0988878b1d145d6', 99, 0, 1557, 0, 30, 3030, 0, 2689, 2730, 1540, 0, 0, 0, 0, 2336, 0, 0, '太原学院', '事业', '01', 11675, '074001', NULL, 9339, '142323197611280167', '薛慧芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b16dc77298db488fb8c84fd8ef91dc61', 79, 0, 1387, 0, 30, 2200, 0, 2796, 2590, 1292, 0, 0, 0, 0, 2081, 0, 0, '太原学院', '事业', '01', 10374, '074001', NULL, 8293, '14010219701209232X', '代素文', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b1fb89452db9454a94fce4252cf1287e', 89, 0, 1413, 0, 30, 2410, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2120, 0, 0, '太原学院', '事业', '01', 10495, '074001', NULL, 8375, '142623197811044325', '刘艳丽', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b20f0301059a4599939f159e92770ef9', 99, 0, 1481, 0, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2222, 0, 0, '太原学院', '事业', '01', 11085, '074001', NULL, 8863, '140511198209292360', '魏丽芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b2228829fea94766ab0cdcf3d98c468b', 55.2, 3.1, 503, 0, 0, 1464, 0, 942, 0, 940.8, 0, 0, 0, 0, 755, 0, 0, '太原学院', '事业', '01', 3908.1, '074001', NULL, 3153.1, '140102197201202313', '邸冬生', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b2cd0eb870a847e79c364c7365b71383', 89, 0, 1327, 50, 30, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1991, 0, 0, '太原学院', '事业', '01', 9866, '074001', NULL, 7875, '152104198304170626', '董宏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b3069ce100a94db2a2763fb7b2d7d0d7', 89, 0, 1249, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1874, 0, 0, '太原学院', '事业', '01', 8970, '074001', NULL, 7096, '140122199008101742', '董国珍', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b3491622a55e439eb3f7c16402a5ded5', 64, 0, 994, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1491, 0, 0, '太原学院', '事业', '01', 8116, '074001', NULL, 6625, '13080219930107166X', '袁烁', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b3be4c02507845c696fa2ef328c31d36', 89, 0, 1297, 0, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1946, 0, 0, '太原学院', '事业', '01', 9561, '074001', NULL, 7615, '14010219790304652X', '王婷', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b3c3878321fa4de691a96fbc3327139b', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '342427199502065545', '张亚', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b3d135b5176847a1b89ea198e6a20361', 89, 0, 1337, 50, 30, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 2006, 0, 0, '太原学院', '事业', '01', 9876, '074001', NULL, 7870, '142732198207170022', '王迎敏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b3db017164264b4681f756419cddf8d1', 89, 0, 1250, 0, 30, 2185, 0, 1515, 2660, 1418, 0, 0, 0, 0, 1875, 0, 0, '太原学院', '事业', '01', 9147, '074001', NULL, 7272, '14010619870722128X', '彭翀', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b44c80ed55724cc79382ac3b5546781d', 99, 0, 1631, 0, 30, 3260, 0, 3026, 2730, 1540, 0, 0, 0, 0, 2447, 0, 0, '太原学院', '事业', '01', 12316, '074001', NULL, 9869, '142302197112031025', '白淑珍', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b45fa16a2ff441b39230a388e206e893', 89, 0, 1294, 0, 0, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1941, 0, 0, '太原学院', '事业', '01', 9528, '074001', NULL, 7587, '142601198410161914', '韩帅', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b47f9e24bc0d403d95357d4ed87eb4c7', 79, 0, 1345, 0, 30, 2200, 0, 2475, 2590, 1292, 0, 0, 0, 0, 2018, 0, 0, '太原学院', '事业', '01', 10011, '074001', NULL, 7993, '140104197605161725', '郑峰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b49ee6827b4c45d38575cbe15ff9fb59', 89, 0, 1347, 0, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2021, 0, 0, '太原学院', '事业', '01', 9804, '074001', NULL, 7783, '140107198302120663', '沈卓', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b4c5d7c9e5d2428ead0e5e4173cf8751', 94, 0, 1668, 0, 0, 3455, 0, 2796, 2800, 1810, 0, 0, 0, 0, 2502, 0, 0, '太原学院', '事业', '01', 12623, '074001', NULL, 10121, '142225197606075510', '祖珑', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b553f3954f314dc09b24db0e4263e401', 89, 0, 1191, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1787, 0, 0, '太原学院', '事业', '01', 8660, '074001', NULL, 6873, '140121199503078029', '张赵芝', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b56d8edd2cbb4abe84b24c8f73546392', 89, 0, 1261, 0, 30, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1892, 0, 0, '太原学院', '事业', '01', 9246, '074001', NULL, 7354, '142623198804060022', '梁荣', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b589225daeff4b858eb2f54b5325d6aa', 89, 0, 1331, 0, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1997, 0, 0, '太原学院', '事业', '01', 9788, '074001', NULL, 7791, '140103198110251524', '杨佳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b5e39b53804746d2a554043aa36cf404', 74, 0, 1117, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1676, 0, 0, '太原学院', '事业', '01', 7815, '074001', NULL, 6139, '140109199905255521', '刘聪', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b5e975ad60e446f099abea8cca0adf1d', 89, 4.3, 1583, 0, 0, 2650, 0, 3641, 2660, 1418, 0, 0, 0, 0, 2375, 0, 0, '太原学院', '事业', '01', 12045.3, '074001', NULL, 9670.3, '140102196607170636', '马洪洁', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b707319d881e4a839593e54533a22e8e', 89, 0, 1304, 0, 0, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1956, 0, 0, '太原学院', '事业', '01', 9538, '074001', NULL, 7582, '142623198501213036', '史俊冰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b713c4b6b9da4e35a1c651a7af003af0', 89, 0, 1377, 0, 30, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2066, 0, 0, '太原学院', '事业', '01', 10059, '074001', NULL, 7993, '140202198109302549', '刘晶', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b73947c2795c40c38cbdb44b7184c3d9', 89, 0, 1543, 0, 0, 2650, 0, 3266, 2660, 1418, 0, 0, 0, 0, 2315, 0, 0, '太原学院', '事业', '01', 11626, '074001', NULL, 9311, '140102196908135172', '李建军', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b740f06a2fc14e22aded5ff47e4be893', 89, 0, 1046, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1569, 0, 0, '太原学院', '事业', '01', 8433, '074001', NULL, 6864, '14260319960923302X', '杨慧芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b741dcbf9a4a481fa77cfb5be7bf5ee0', 99, 0, 1453, 50, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2180, 0, 0, '太原学院', '事业', '01', 10814, '074001', NULL, 8634, '140105198312291885', '王雅馨', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b74496ddd01b43af92ca16dc7dbc7972', 99, 0, 1499, 50, 0, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2249, 0, 0, '太原学院', '事业', '01', 11023, '074001', NULL, 8774, '140103198206133311', '赵荣', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b79c598142f241a9a2cf4f73682ea45d', 89, 0, 1214, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1821, 0, 0, '太原学院', '事业', '01', 8765, '074001', NULL, 6944, '140522199011079760', '马凯莉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b7ae5749f58547c5adaac8123c616853', 89, 0, 1316, 0, 0, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 1974, 0, 0, '太原学院', '事业', '01', 9643, '074001', NULL, 7669, '140104198101112211', '封俊', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b80cc105cc3a493bac7d5f45efa471f8', 74, 0, 1087, 0, 0, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1631, 0, 0, '太原学院', '事业', '01', 7755, '074001', NULL, 6124, '371325199610100519', '汪龙飞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b89f3815fc5348cf993d098bf959291b', 94, 0, 1668, 0, 0, 3455, 0, 2796, 2800, 1810, 0, 0, 0, 0, 2502, 0, 0, '太原学院', '事业', '01', 12623, '074001', NULL, 10121, '140102197010300690', '王建军', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b8b19ef5131d496da26b3d1081281867', 89, 0, 1334, 50, 30, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2001, 0, 0, '太原学院', '事业', '01', 9741, '074001', NULL, 7740, '142226198209194920', '智艳丽', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b8be28622b4e4abcb78b1f7d624d76d3', 89, 0, 1322, 0, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1983, 0, 0, '太原学院', '事业', '01', 9779, '074001', NULL, 7796, '142301198002132325', '武亮英', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b9759d0a8fab40a49efb2b22da931991', 99, 0, 1546, 50, 30, 3260, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2319, 0, 0, '太原学院', '事业', '01', 11430, '074001', NULL, 9111, '142431198010103042', '郝兴娥', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b98c258fb49e4b04b3637fe4be652638', 89, 0, 1285, 50, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1928, 0, 0, '太原学院', '事业', '01', 9506, '074001', NULL, 7578, '140107198209200626', '罗静', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b9d19890a13949d488b534906d6c08c1', 99, 0, 1493, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2240, 0, 0, '太原学院', '事业', '01', 11047, '074001', NULL, 8807, '140225198104123749', '郭丽丽', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('b9e4043599fc442aafd9fe4419a075df', 89, 0, 1238, 0, 30, 2185, 0, 1427, 2660, 1418, 0, 0, 0, 0, 1857, 0, 0, '太原学院', '事业', '01', 9047, '074001', NULL, 7190, '140108199106241223', '黄莺', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ba2ea621946d41f3ae1441ccacbe5184', 99, 0, 1443, 0, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2165, 0, 0, '太原学院', '事业', '01', 10754, '074001', NULL, 8589, '142724198603071421', '杨天敏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ba424b7041334ea0af8c3eaa472d5feb', 89, 0, 1261, 0, 30, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1892, 0, 0, '太原学院', '事业', '01', 9246, '074001', NULL, 7354, '142623198912055546', '张博', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ba49f59d233144fc89b3b20fc595fd20', 74, 0, 1081, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1622, 0, 0, '太原学院', '事业', '01', 7779, '074001', NULL, 6157, '140108199606194224', '李星儒', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ba5a93814f8a4824b4d9b928f1706384', 99, 0, 1708, 0, 30, 3810, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2562, 0, 0, '太原学院', '事业', '01', 13058, '074001', NULL, 10496, '140103197305110647', '张彤华', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ba84463bdcd0436a82ed89430c8bf6e0', 74, 0, 1192, 0, 30, 1925, 0, 1789, 2520, 1215, 0, 0, 0, 0, 1788, 0, 0, '太原学院', '事业', '01', 8745, '074001', NULL, 6957, '14010619850703122X', '宋璐', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bab5e793f5d8432db51e4de4a1cbfe1c', 74, 0, 1233, 50, 30, 1950, 0, 2075, 2520, 1215, 0, 0, 0, 0, 1850, 0, 0, '太原学院', '事业', '01', 9147, '074001', NULL, 7297, '140107198207233926', '王志桃', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bad536fc44584ee6925edc823015fbd9', 99, 0, 1601, 0, 30, 3260, 0, 2796, 2730, 1540, 0, 0, 0, 0, 2402, 0, 0, '太原学院', '事业', '01', 12056, '074001', NULL, 9654, '140103197402170027', '谭丽燕', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bad8ecc84bf6440fad5a8879c94bb152', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '140427199405308040', '贾楠', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bb643a601bd849c899c044a9da86f1c8', 94, 0, 1648, 0, 30, 3455, 0, 2375, 2800, 1810, 0, 0, 0, 0, 2472, 0, 0, '太原学院', '事业', '01', 12212, '074001', NULL, 9740, '140103198110030027', '杨欣', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bb71027a55b2480d811b0787912d98fc', 89, 0, 1333, 0, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 2000, 0, 0, '太原学院', '事业', '01', 9597, '074001', NULL, 7597, '140430198401290027', '何莉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bb726075e93d4e16bb8c358ebe6c5618', 89, 0, 1435, 0, 30, 2650, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2153, 0, 0, '太原学院', '事业', '01', 10757, '074001', NULL, 8604, '142225197601200028', '王改凤', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bb773020b09b4e67b9a5c8f8a24470e2', 89, 0, 1206, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1809, 0, 0, '太原学院', '事业', '01', 8593, '074001', NULL, 6784, '41152819950622002X', '文丽', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bb934ea0ca9d4f7eb8759e7884950aee', 99, 0, 1766, 0, 30, 3810, 0, 3516, 2730, 1540, 0, 0, 0, 0, 2649, 0, 0, '太原学院', '事业', '01', 13491, '074001', NULL, 10842, '140103197108184225', '张芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bba13820afd942578381a9f44440c14e', 74, 0, 1233, 0, 30, 1950, 0, 2075, 2520, 1215, 0, 0, 0, 0, 1850, 0, 0, '太原学院', '事业', '01', 9097, '074001', NULL, 7247, '142623198101120826', '胡筱瑜', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bbc14f83d38048168b61996894ebfc18', 99, 0, 1423, 0, 30, 3030, 0, 1789, 2730, 1540, 0, 0, 0, 0, 2135, 0, 0, '太原学院', '事业', '01', 10641, '074001', NULL, 8506, '142302198211241065', '郭建秀', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bc3e2f6361aa4b2ebd41eed55b0de71b', 89, 0, 1181, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1772, 0, 0, '太原学院', '事业', '01', 8568, '074001', NULL, 6796, '142226199603221223', '韩雪文', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bc41fc5cbf2f4c998c1766d7c2429276', 89, 0, 1438, 0, 30, 2410, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2157, 0, 0, '太原学院', '事业', '01', 10520, '074001', NULL, 8363, '142430197812080064', '高晓燕', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bc9db636b62d487cb1ddc610723c4d08', 99, 0, 1653, 0, 30, 3260, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2480, 0, 0, '太原学院', '事业', '01', 12578, '074001', NULL, 10098, '14010219700703204X', '秦小娟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bcbd29e0c0aa4f0c9deaff47b118e553', 74, 0, 1170, 0, 30, 1925, 0, 1427, 2520, 1215, 0, 0, 0, 0, 1755, 0, 0, '太原学院', '事业', '01', 8361, '074001', NULL, 6606, '130982198809061123', '丁立杰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bd105c9970d340d18ada9c8c74dfee4f', 89, 0, 1227, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1841, 0, 0, '太原学院', '事业', '01', 8948, '074001', NULL, 7107, '140109199006251527', '张驰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bd12ef76ad8a4e95b12cefe2f9e8ee32', 99, 3.9, 1653, 0, 30, 3260, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2480, 0, 0, '太原学院', '事业', '01', 12581.9, '074001', NULL, 10101.9, '14010219691215232X', '崔玉兰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bd4d8372131f4b7fb058123172b263f7', 99, 0, 1607, 0, 30, 3030, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2411, 0, 0, '太原学院', '事业', '01', 12177, '074001', NULL, 9766, '140104197310161760', '李英华', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bd6510ec992d46d4aad24279b1ed4734', 74, 0, 1078, 0, 0, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1617, 0, 0, '太原学院', '事业', '01', 7746, '074001', NULL, 6129, '140107199511240017', '郑孟曜', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bdce18c170644e5b8e768d2db4023cc7', 89, 0, 1191, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1787, 0, 0, '太原学院', '事业', '01', 8630, '074001', NULL, 6843, '130435199010031516', '谷志朋', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bde0b1126c0f41d7a2d73d6d6a7df628', 99, 0, 1653, 0, 30, 3260, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2480, 0, 0, '太原学院', '事业', '01', 12578, '074001', NULL, 10098, '142430197001182729', '翟其红', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bde1fedcda4448898e21a2f292dd62a3', 89, 0, 1309, 50, 30, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 1964, 0, 0, '太原学院', '事业', '01', 9716, '074001', NULL, 7752, '14010219771001322X', '赵慧', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bdf2dec0e3494428b5cb54e9cfba8fd2', 74, 0, 1230, 0, 30, 1925, 0, 1882, 2520, 1215, 0, 0, 0, 0, 1845, 0, 0, '太原学院', '事业', '01', 8876, '074001', NULL, 7031, '140106198405100028', '徐敏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bdf722610db140d4a15d26109eb3e800', 99, 0, 1516, 0, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2274, 0, 0, '太原学院', '事业', '01', 11120, '074001', NULL, 8846, '140112198211211421', '任婷婷', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('be11a75d1b774b89b78dc94d3f55b80c', 99, 3.5, 1810, 0, 30, 3810, 0, 3921, 2730, 1540, 0, 0, 0, 0, 2715, 0, 0, '太原学院', '事业', '01', 13943.5, '074001', NULL, 11228.5, '510102197001208541', '郭东玲', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bea07979123546f98466c7a50ff57f54', 89, 0, 1546, 0, 30, 2650, 0, 3266, 2660, 1418, 0, 0, 0, 0, 2319, 0, 0, '太原学院', '事业', '01', 11659, '074001', NULL, 9340, '140112197203050029', '董丽丽', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('beecb2e6f60a41adbd09accf5a624591', 89, 0, 1389, 50, 30, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2084, 0, 0, '太原学院', '事业', '01', 10321, '074001', NULL, 8237, '142202197811070968', '苑丽英', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bf1e57d63e7c4e189809b4159c981384', 94, 4, 1812, 0, 30, 3455, 0, 3641, 2800, 1810, 0, 0, 0, 0, 2718, 0, 0, '太原学院', '事业', '01', 13646, '074001', NULL, 10928, '140102196908032069', '常静', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bf340499d16c4f78bad4351ce7473370', 94, 0, 1295, 50, 0, 2880, 0, 1696, 2730, 1551, 560, 0, 0, 0, 1943, 3612, 0, '太原学院', '事业', '01', 14468, '074001', '2025-10-01', 12525, '140106198306260018', '王子健', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bf45399b11894b03b53a0d6de5a85337', 99, 0, 1809, 0, 30, 3810, 0, 3921, 2730, 1540, 0, 0, 0, 0, 2714, 0, 0, '太原学院', '事业', '01', 13939, '074001', NULL, 11225, '140103196807060622', '李京焱', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bf4ffe196f6941a698adaadb6ce0a67c', 89, 0, 1283, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1925, 0, 0, '太原学院', '事业', '01', 9361, '074001', NULL, 7436, '140107198710131249', '王雨晗', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('bffe724abb7744e9a508ce2d6ffbf11f', 89, 0, 1215, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1823, 0, 0, '太原学院', '事业', '01', 8848, '074001', NULL, 7025, '140603199404031027', '苏丽君', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c034520ba3c640bea57c7a849b717cd3', 74, 0, 1074, 0, 0, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1611, 0, 0, '太原学院', '事业', '01', 7671, '074001', NULL, 6060, '142327199403161715', '杨健', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c034cf9f9ac745db889332e77c8f9ff5', 99, 0, 1507, 50, 30, 3030, 0, 2375, 2730, 1540, 0, 0, 0, 0, 2261, 0, 0, '太原学院', '事业', '01', 11361, '074001', NULL, 9100, '140105197605125042', '王丽平', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c03c5fec63b640ed8f5e5d4c44b2b503', 99, 0, 1449, 0, 0, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2174, 0, 0, '太原学院', '事业', '01', 10730, '074001', NULL, 8556, '140402198204280019', '程亮', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c047cac6e50f48e49e5ba4cb50d42d9e', 99, 0, 1488, 50, 30, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2232, 0, 0, '太原学院', '事业', '01', 11242, '074001', NULL, 9010, '140102198207113420', '李宁宁', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c0be506adc42494e8d7b616610613a4d', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '140427199402158147', '秦雪洁', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c114ad923ea049bdbeb659835156ed2b', 74, 0, 1281, 0, 0, 1950, 0, 2475, 2520, 1215, 0, 0, 0, 0, 1922, 0, 0, '太原学院', '事业', '01', 9515, '074001', NULL, 7593, '140104197606190333', '董亮', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c175c25174cc4b23a99cd31a357d973f', 104, 6, 2011, 0, 30, 4345, 0, 3781, 3080, 2100, 0, 0, 0, 0, 3017, 0, 0, '太原学院', '事业', '01', 15457, '074001', NULL, 12440, '510102196610276123', '康晓红', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c1be35ebc550415e917eeded1e3add0f', 99, 0, 1663, 0, 30, 3810, 0, 2796, 2730, 1540, 0, 0, 0, 0, 2495, 0, 0, '太原学院', '事业', '01', 12668, '074001', NULL, 10173, '142223197408142724', '徐国华', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c1e86faf3f0d4e17a3f46acbaf374356', 89, 0, 1348, 50, 30, 2185, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2022, 0, 0, '太原学院', '事业', '01', 10055, '074001', NULL, 8033, '140221198011230048', '周杰宇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c219d187a6884cd68dbb1eb7230e10ed', 74, 0, 1106, 0, 30, 1925, 0, 1087, 2520, 1215, 0, 0, 0, 0, 1659, 0, 0, '太原学院', '事业', '01', 7957, '074001', NULL, 6298, '141181199405270268', '王雁', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c234bae064494a6c95dab8aa41302ce8', 89, 0, 1404, 50, 30, 2410, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2106, 0, 0, '太原学院', '事业', '01', 10536, '074001', NULL, 8430, '140121197804180028', '刘晓红', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c2b509717ceb4098a9c4d0208eed8c84', 94, 0, 1738, 0, 0, 3455, 0, 3266, 2800, 1810, 0, 0, 0, 0, 2607, 0, 0, '太原学院', '事业', '01', 13163, '074001', NULL, 10556, '632801197006160533', '吴康', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c2c1ca2ca2a145af93164e1e6a7b1ab1', 99, 0, 1468, 0, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2202, 0, 0, '太原学院', '事业', '01', 10779, '074001', NULL, 8577, '142223198503062428', '赵丹', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c2c3991a9dfd47f499eebf44f7557681', 99, 0, 1481, 0, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2222, 0, 0, '太原学院', '事业', '01', 11085, '074001', NULL, 8863, '140102197907171440', '侯乐旻', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c2d3649a0cc541e58e6e8acb088cce28', 89, 0, 1400, 0, 0, 2410, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2100, 0, 0, '太原学院', '事业', '01', 10452, '074001', NULL, 8352, '460001197701040712', '陈作行', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c2e46aa5c7364b73a7205659cbfbcc76', 74, 0, 1083, 0, 30, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1625, 0, 0, '太原学院', '事业', '01', 7710, '074001', NULL, 6085, '130184199901091521', '王若蓝', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c335ce8a7c6b4b9e99d335850e6fd307', 74, 0, 1277, 50, 0, 1925, 0, 2375, 2520, 1215, 0, 0, 0, 0, 1916, 0, 0, '太原学院', '事业', '01', 9436, '074001', NULL, 7520, '140102197609036558', '武小勇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c3be3e71bb5343869dd142c2557a6f5d', 74, 0, 1185, 0, 30, 1950, 0, 1696, 2520, 1215, 0, 0, 0, 0, 1778, 0, 0, '太原学院', '事业', '01', 8670, '074001', NULL, 6892, '140105198302010066', '叶丹青', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c426146ac3fd4546a9989016309bc25e', 104, 0, 1875, 0, 0, 4640, 0, 2582, 2940, 1908, 0, 0, 0, 0, 2813, 0, 0, '太原学院', '事业', '01', 14049, '074001', NULL, 11236, '140102197906082315', '杨立波', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c446f1ae5e46468eadf1cc9f35be6e69', 74, 0, 1101, 0, 30, 1925, 0, 1087, 2520, 1215, 0, 0, 0, 0, 1652, 0, 0, '太原学院', '事业', '01', 7952, '074001', NULL, 6300, '142431199207074841', '阴怀芬', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c55067021f32407086fc6078fa5637fe', 89, 0, 1181, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1772, 0, 0, '太原学院', '事业', '01', 8568, '074001', NULL, 6796, '140108199410063222', '张哲琪', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c56ded1d77aa41ab8928a37a617cb453', 89, 0, 1348, 0, 30, 2185, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2022, 0, 0, '太原学院', '事业', '01', 10005, '074001', NULL, 7983, '140103197602150645', '续冰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c58248db1e604455857677ff17aae102', 99, 0, 1603, 0, 0, 3030, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2405, 0, 0, '太原学院', '事业', '01', 12143, '074001', NULL, 9738, '220323197303106018', '陈显久', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c58c3553bcee4204bbdb7129a5da61d3', 79, 0, 1243, 0, 30, 2200, 0, 1603, 2590, 1292, 0, 0, 0, 0, 1865, 0, 0, '太原学院', '事业', '01', 9037, '074001', NULL, 7172, '142401198906281425', '杜竹', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c599c0ab11984ff4992a9263f13de3b4', 89, 0, 1201, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1802, 0, 0, '太原学院', '事业', '01', 8670, '074001', NULL, 6868, '14260119950909404X', '邢力元', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c5a5e8391c844beb994477710a1d6f0f', 89, 0, 1273, 50, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1910, 0, 0, '太原学院', '事业', '01', 9401, '074001', NULL, 7491, '140109198609095127', '李婷婷', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c5c0fadbccd3446e8ca227555e8e6ee5', 89, 0, 1552, 50, 0, 2650, 0, 3141, 2660, 1418, 0, 0, 0, 0, 2328, 0, 0, '太原学院', '事业', '01', 11560, '074001', NULL, 9232, '140402197302243217', '张金辉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c5d283d0b38d45ab9502e73144da9311', 89, 0, 1250, 50, 30, 2185, 0, 1515, 2660, 1418, 0, 0, 0, 0, 1875, 0, 0, '太原学院', '事业', '01', 9197, '074001', NULL, 7322, '14010719901228332X', '冀莎', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c60d257d766c454cb02f5ec6cba0129e', 74, 0, 1145, 0, 30, 1925, 0, 1427, 2520, 1215, 0, 0, 0, 0, 1718, 0, 0, '太原学院', '事业', '01', 8336, '074001', NULL, 6618, '142725198811012422', '杨君薇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c61f94f34f5040f8b0d1a448ce5c2719', 89, 0, 1215, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1823, 0, 0, '太原学院', '事业', '01', 8848, '074001', NULL, 7025, '140109199308033023', '周姝航', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c628ae96d5ea4892806f935763bfdd88', 89, 0, 1320, 50, 30, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 1980, 0, 0, '太原学院', '事业', '01', 9727, '074001', NULL, 7747, '140181198406034720', '韩雪', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c6a49b8e3dd24fada60392b11447fa37', 94, 0, 1716, 50, 30, 3455, 0, 3141, 2800, 1810, 0, 0, 0, 0, 2574, 0, 0, '太原学院', '事业', '01', 13096, '074001', NULL, 10522, '142401197402096280', '胡晋梅', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c6c80faac11e45af8dc3486cc0b91b64', 99, 0, 1586, 0, 30, 3260, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2379, 0, 0, '太原学院', '事业', '01', 11720, '074001', NULL, 9341, '142333197808130026', '高红霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c7396a0ab5974ed586284ca3a6613991', 89, 0, 1449, 0, 30, 2650, 0, 2582, 2660, 1418, 0, 0, 0, 0, 2174, 0, 0, '太原学院', '事业', '01', 10878, '074001', NULL, 8704, '140502197607200520', '徐妮妮', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c8043a911298475a964f8baac6278eea', 104, 4.2, 2051, 0, 0, 4640, 0, 4201, 2940, 1908, 0, 0, 0, 0, 3077, 0, 0, '太原学院', '事业', '01', 15848.2, '074001', NULL, 12771.2, '140103196612151313', '王坚', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c8ae745bf1734e84835470a6a6177ac0', 89, 0, 1215, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1823, 0, 0, '太原学院', '事业', '01', 8848, '074001', NULL, 7025, '140423199012262824', '王会芝', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c8f3d084dc0847f897854cc1b59fc468', 99, 0, 1455, 50, 30, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2183, 0, 0, '太原学院', '事业', '01', 10909, '074001', NULL, 8726, '130406198211140368', '何江', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c90de48abd8848288c4e1ee1f1c8daf2', 89, 0, 1327, 0, 30, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1991, 0, 0, '太原学院', '事业', '01', 9816, '074001', NULL, 7825, '140106198505021845', '傅锦', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c91515e3f65a4257a8d160643335b930', 94, 0, 1425, 0, 30, 2880, 0, 1882, 2730, 1551, 0, 0, 0, 0, 2138, 0, 0, '太原学院', '事业', '01', 10592, '074001', NULL, 8454, '140103197908220669', '郭慧辉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c91a964a87b34428b7ce7d2cb15710b5', 74, 0, 1133, 0, 30, 1925, 0, 1251, 2520, 1215, 0, 0, 0, 0, 1700, 0, 0, '太原学院', '事业', '01', 8148, '074001', NULL, 6448, '330424199211280066', '周博雅', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c93edc8672b04bed8094bd2dc78dc2c3', 89, 0, 1404, 50, 30, 2410, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2106, 0, 0, '太原学院', '事业', '01', 10536, '074001', NULL, 8430, '142431197904270021', '邵海林', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c97c26578d0f415cbc2b41ce154fbecd', 74, 0, 1209, 0, 30, 1950, 0, 1882, 2520, 1215, 0, 0, 0, 0, 1814, 0, 0, '太原学院', '事业', '01', 8880, '074001', NULL, 7066, '140107198212270641', '李雅', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c98b7d6837b649399fbbb7286f98e820', 99, 4.3, 1726, 0, 0, 3260, 0, 3781, 2730, 1540, 0, 0, 0, 0, 2589, 0, 0, '太原学院', '事业', '01', 13140.3, '074001', NULL, 10551.3, '140102196701162317', '武旭锦', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('c9da71f4d6b9476fb939c3413042be61', 99, 0, 1529, 0, 30, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2294, 0, 0, '太原学院', '事业', '01', 11433, '074001', NULL, 9139, '140102197408103224', '杨晋华', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ca1c568f0831449fa36f15a1abd11103', 89, 0, 1257, 0, 0, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1886, 0, 0, '太原学院', '事业', '01', 9212, '074001', NULL, 7326, '140402198507310414', '周扬', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ca31992ca4aa4e6594680469ef0b26c4', 69, 0, 1302, 0, 0, 2260, 0, 1954, 2590, 1365, 0, 0, 0, 0, 1953, 0, 0, '太原学院', '事业', '01', 9540, '074001', NULL, 7587, '14010219750325061X', '吴辉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cab2a489b062477c8776d82daba34dee', 74, 0, 1119, 0, 0, 1925, 0, 1251, 2520, 1215, 0, 0, 0, 0, 1679, 0, 0, '太原学院', '事业', '01', 8104, '074001', NULL, 6425, '140702199210207134', '智东敏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cb05b9d2d72a4aad98bb18dda5659c6b', 99, 4.2, 1799, 0, 30, 3810, 0, 3641, 2730, 1540, 0, 0, 0, 0, 2699, 0, 0, '太原学院', '事业', '01', 13653.2, '074001', NULL, 10954.2, '140106196901311220', '卢青', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cb2188b069914c1b80563b3a2578a6c8', 94, 0, 1544, 0, 30, 2880, 0, 2796, 2730, 1551, 0, 0, 0, 0, 2316, 0, 0, '太原学院', '事业', '01', 11625, '074001', NULL, 9309, '142732197207263224', '员丽霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cb21faafbdcf474eb959cab042b1a563', 99, 0, 1443, 0, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2165, 0, 0, '太原学院', '事业', '01', 10754, '074001', NULL, 8589, '140122198710301125', '张慧玲', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cb4f19ca81704333b451a32208dae05f', 89, 0, 1319, 50, 0, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1979, 0, 0, '太原学院', '事业', '01', 9796, '074001', NULL, 7817, '140103198205144211', '金烨', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cb7c8edb218f44928c4830d9d9e1afc6', 89, 0, 1331, 50, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1997, 0, 0, '太原学院', '事业', '01', 9838, '074001', NULL, 7841, '140108198606024220', '范宏宇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cb8d43db35ea4556abf4e798c8ee58a7', 99, 0, 1530, 0, 30, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2295, 0, 0, '太原学院', '事业', '01', 11434, '074001', NULL, 9139, '140123197910140022', '曹宏宏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cbac1d1e36c843d3b24a48b6d87fb904', 89, 0, 1332, 0, 0, 2410, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1998, 0, 0, '太原学院', '事业', '01', 9791, '074001', NULL, 7793, '140102198212190658', '赵朗朗', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cbb7563861e945baa06b24b681c92e7c', 94, 0, 1492, 0, 0, 2880, 0, 2175, 2730, 1551, 0, 0, 0, 0, 2238, 0, 0, '太原学院', '事业', '01', 10922, '074001', NULL, 8684, '142429197907130014', '王利国', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cbdc5ef031964964863e873272a216d7', 104, 0, 1915, 0, 0, 5220, 0, 2582, 2940, 1908, 0, 0, 0, 0, 2873, 0, 0, '太原学院', '事业', '01', 14669, '074001', NULL, 11796, '142702197501035814', '郑济孝', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cc2eb40fa7b04e29b0f48ecb7832501b', 89, 0, 1162, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1743, 0, 0, '太原学院', '事业', '01', 8601, '074001', NULL, 6858, '140203199507201234', '董小乐', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cc353c863b3444d8aa2f29bc1b9aba65', 89, 0, 1297, 0, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1946, 0, 0, '太原学院', '事业', '01', 9561, '074001', NULL, 7615, '140105198312210547', '刘旭峰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cc384112031e4d2aa27d0b04e0f70385', 99, 0, 1564, 0, 30, 3260, 0, 2582, 2730, 1540, 0, 0, 0, 0, 2346, 0, 0, '太原学院', '事业', '01', 11805, '074001', NULL, 9459, '140121197708078023', '陈慧茹', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cc3e8f3fefe6453b9c3a1b821a1de286', 79, 0, 1299, 0, 30, 2200, 0, 1882, 2590, 1292, 0, 0, 0, 0, 1949, 0, 0, '太原学院', '事业', '01', 9372, '074001', NULL, 7423, '140109198412260520', '闫堃', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cc86c6b08ed24a15941d0883df034d3f', 99, 0, 1516, 0, 0, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2274, 0, 0, '太原学院', '事业', '01', 11190, '074001', NULL, 8916, '142223197809182735', '徐彦峰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ccac91c3b3e74c79950c20788673d088', 99, 0, 1575, 0, 30, 3260, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2363, 0, 0, '太原学院', '事业', '01', 11709, '074001', NULL, 9346, '140430197605140026', '田大惠', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cd2f84a0266a49b79bc80c5ac4fe0ecc', 99, 0, 1382, 50, 0, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2073, 0, 0, '太原学院', '事业', '01', 11006, '074001', NULL, 8933, '140112198109023010', '李强', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cd5dad925dec43ea93f0ba9e548c66b7', 99, 0, 1612, 0, 30, 3260, 0, 2689, 2730, 1540, 0, 0, 0, 0, 2418, 0, 0, '太原学院', '事业', '01', 11960, '074001', NULL, 9542, '140102197507052346', '王莉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cd70a96636f046c98c9dfd0c41ee81fc', 74, 0, 1027, 50, 30, 1925, 0, 2275, 2520, 1215, 0, 0, 0, 0, 1541, 200, 0, '太原学院', '事业', '01', 9316, '074001', NULL, 7775, '140102198103226527', '毕涛', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cd79322c135947fea7a5e3f89d311ad5', 89, 0, 1398, 50, 0, 2185, 0, 2689, 2660, 1418, 0, 0, 0, 0, 2097, 0, 0, '太原学院', '事业', '01', 10489, '074001', NULL, 8392, '142223197607243915', '韩云伟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cd98954094ab44fb892853e3f765f92a', 89, 0, 1404, 0, 30, 2410, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2106, 0, 0, '太原学院', '事业', '01', 10486, '074001', NULL, 8380, '142629197712231027', '周雅娟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cda73cfaa5b94ea3adf1c42d30509282', 89, 0, 1261, 0, 30, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1892, 0, 0, '太原学院', '事业', '01', 9246, '074001', NULL, 7354, '140106198701210029', '郝婧翔', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cdbdfbc334d2494ebf81e2cfc574c7cd', 99, 0, 1477, 0, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2216, 0, 0, '太原学院', '事业', '01', 10981, '074001', NULL, 8765, '142726198205260027', '李俊彦', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cdf2e578626c4db1958ff778667aabbe', 99, 0, 1408, 0, 30, 3030, 0, 1339, 2730, 1540, 0, 0, 0, 0, 2112, 0, 0, '太原学院', '事业', '01', 10176, '074001', NULL, 8064, '140702199108227147', '寇海荣', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ce27aa83c005417492c45c4c6b9fcb45', 89, 0, 1396, 0, 30, 2650, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2094, 0, 0, '太原学院', '事业', '01', 10418, '074001', NULL, 8324, '140109198106211560', '张融', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ce881a2796d346e2aeb1f60bfd1691bc', 99, 0, 1443, 50, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2165, 0, 0, '太原学院', '事业', '01', 10804, '074001', NULL, 8639, '14010719850328172X', '李金菁', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ceb2cb8631ea4ce8972cf77a7f93eb88', 74, 0, 1205, 0, 30, 1925, 0, 1882, 2520, 1215, 0, 0, 0, 0, 1808, 0, 0, '太原学院', '事业', '01', 8851, '074001', NULL, 7043, '140107198403273925', '任燕', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cec560ad632b4cb687a36aa0ec05c915', 89, 0, 1319, 0, 0, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1979, 0, 0, '太原学院', '事业', '01', 9746, '074001', NULL, 7767, '140103198205071534', '李潼', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cf094364e4da4e3e85fcd7d5e4de63c4', 89, 0, 1503, 50, 0, 2650, 0, 3026, 2660, 1418, 0, 0, 0, 0, 2255, 0, 0, '太原学院', '事业', '01', 11396, '074001', NULL, 9141, '140102197204132314', '王永强', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cf36adf16f3f4948bf59608d5d60c8a2', 89, 0, 1347, 50, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2021, 0, 0, '太原学院', '事业', '01', 9854, '074001', NULL, 7833, '140121198204019024', '张芝秀', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cf55935ccb224909a5e1175cfd21ce74', 99, 0, 1649, 50, 0, 3260, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2474, 0, 0, '太原学院', '事业', '01', 12594, '074001', NULL, 10120, '140105196908140819', '范智华', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cfbb82a70dd24af6ae5b4587f81421ec', 59, 0, 930, 0, 0, 1730, 0, 1117, 2450, 1148, 0, 0, 0, 0, 1395, 0, 0, '太原学院', '事业', '01', 7434, '074001', NULL, 6039, '140429198903252017', '崔树鹏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cfc09399fe5f4b31bdb49170cbe9aa27', 59.2, 0, 773, 50, 30, 1560, 0, 1740, 0, 972, 0, 0, 0, 0, 1160, 0, 0, '太原学院', '事业', '01', 2184.2, '074001', NULL, 1024.2, '140102197910035167', '韩洁', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cfd3c825b2e946cab7e2f97774e423b4', 99, 0, 1440, 0, 0, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2160, 0, 0, '太原学院', '事业', '01', 10721, '074001', NULL, 8561, '140107198407254836', '魏鹏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cfd509b95dd74be18875eefdd912993a', 89, 0, 1310, 0, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1965, 0, 0, '太原学院', '事业', '01', 9481, '074001', NULL, 7516, '142329198510202322', '牛亚群', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('cfe0325d3286487286c1f05c41546aa8', 89, 0, 1273, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1910, 0, 0, '太原学院', '事业', '01', 9351, '074001', NULL, 7441, '140106198507121823', '赵佳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d025a40770734245a09620b8b1e19bbc', 74, 0, 1155, 0, 0, 1925, 0, 1339, 2520, 1215, 0, 0, 0, 0, 1733, 0, 0, '太原学院', '事业', '01', 8228, '074001', NULL, 6495, '140106199010091811', '李权峰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d025e3638d62482a9252fe5ae7e166f8', 94, 0, 1296, 50, 30, 2880, 0, 1789, 2730, 1551, 560, 0, 0, 0, 1944, 6321, 0, '太原学院', '事业', '01', 17301, '074001', '2025-07-01', 15357, '142603198205303023', '张会会', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d0414b15e1a64c0b9b2066bc89dfe534', 99, 0, 1453, 0, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2180, 0, 0, '太原学院', '事业', '01', 10764, '074001', NULL, 8584, '140202198412255589', '杜萱', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d04b7630f7af47ccb0287b81538a0dba', 99, 0, 1468, 0, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2202, 0, 0, '太原学院', '事业', '01', 10972, '074001', NULL, 8770, '140102198008195224', '张科星', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d05b275d307144c59b7479d4c63ce6db', 94, 0, 1604, 0, 0, 3455, 0, 2075, 2800, 1810, 0, 0, 0, 0, 2406, 0, 0, '太原学院', '事业', '01', 11838, '074001', NULL, 9432, '140411198202074816', '田冰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d05e118a1bfc438e802deec4daf97afa', 89, 0, 1238, 0, 30, 2185, 0, 1427, 2660, 1418, 0, 0, 0, 0, 1857, 0, 0, '太原学院', '事业', '01', 9047, '074001', NULL, 7190, '140106199001223069', '王天', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d05e4de6479542f8816a4ac8f67d96a9', 94, 0, 1416, 0, 30, 2880, 0, 1882, 2730, 1551, 0, 0, 0, 0, 2124, 0, 0, '太原学院', '事业', '01', 10583, '074001', NULL, 8459, '142322198605060529', '裴夏璇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d0f21cfc0f084ed8ae23785736a5a73a', 99, 0, 1419, 0, 0, 3030, 0, 1789, 2730, 1540, 0, 0, 0, 0, 2129, 0, 0, '太原学院', '事业', '01', 10607, '074001', NULL, 8478, '142228198410130016', '樊星男', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d16a34e83dd44e75adabba7da047304e', 89, 0, 1358, 50, 30, 2185, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2037, 0, 0, '太原学院', '事业', '01', 10065, '074001', NULL, 8028, '140102197810230627', '智建丽', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d1b319b1c54043a89272eeaae2e8efd8', 99, 0, 1506, 0, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2259, 0, 0, '太原学院', '事业', '01', 11110, '074001', NULL, 8851, '142202198207140522', '贾晓霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d1c15d6544a94e53836b81b2062eb01b', 99, 0, 1481, 0, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2222, 0, 0, '太原学院', '事业', '01', 11085, '074001', NULL, 8863, '142223198204213329', '张婧', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d1ca8a155a4147f694827ca5c17fe27c', 89, 0, 1459, 50, 0, 2650, 0, 2689, 2660, 1418, 0, 0, 0, 0, 2189, 0, 0, '太原学院', '事业', '01', 11015, '074001', NULL, 8826, '149001197611281217', '张为锋', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d1e1961e62fc4507849f6b5038efd1b5', 89, 3.5, 1414, 0, 30, 2185, 0, 2582, 2660, 1418, 0, 0, 0, 0, 2121, 0, 0, '太原学院', '事业', '01', 10381.5, '074001', NULL, 8260.5, '140102197211126529', '王志欣', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d23aa10a7b2e456d9316c8161525c4ca', 99, 0, 1653, 0, 30, 3260, 0, 3266, 2730, 1540, 0, 0, 0, 0, 2480, 0, 0, '太原学院', '事业', '01', 12578, '074001', NULL, 10098, '140104197003160821', '张彬', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d241efc7d1ce426e8994cca2759fbcea', 89, 0, 1181, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1772, 0, 0, '太原学院', '事业', '01', 8568, '074001', NULL, 6796, '142725199511040063', '贾玉茹', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d279eabef1d743769eeaa76a568fdf06', 99, 0, 1486, 0, 0, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2229, 0, 0, '太原学院', '事业', '01', 11060, '074001', NULL, 8831, '142430197908101210', '韩栋梁', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d2834c3c29ed4f1ba22b7c78d98f4e7f', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30000, '太原学院', '事业', '01', 30000, '074001', NULL, 30000, '140102196503223246', '冯俊伶', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d2934774356643e19031628a107ab527', 99, 0, 1432, 0, 30, 3030, 0, 1603, 2730, 1540, 0, 0, 0, 0, 2148, 0, 0, '太原学院', '事业', '01', 10464, '074001', NULL, 8316, '412723198711212948', '程凤伟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d2f2dcf5226f4a978e7525326f35859e', 89, 0, 1294, 0, 0, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1941, 0, 0, '太原学院', '事业', '01', 9528, '074001', NULL, 7587, '140302198106161352', '陈亮', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d31bc143a9c04d0280841f26e44b5a6d', 99, 0, 1558, 0, 0, 3030, 0, 2796, 2730, 1540, 0, 0, 0, 0, 2337, 0, 0, '太原学院', '事业', '01', 11753, '074001', NULL, 9416, '142701197712011277', '贾安民', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d34bb4bc2548435b86c050b68f272887', 79, 0, 1240, 0, 0, 2200, 0, 1696, 2590, 1292, 0, 0, 0, 0, 1860, 0, 0, '太原学院', '事业', '01', 9097, '074001', NULL, 7237, '140107198712062216', '王宁', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d3a788e839f04de1aad59f2435b27904', 89, 0, 1181, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1772, 0, 0, '太原学院', '事业', '01', 8568, '074001', NULL, 6796, '140581199606231629', '张茹杰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d3bf3b525c954532ae5472cef39af7c7', 99, 0, 1516, 50, 0, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2274, 0, 0, '太原学院', '事业', '01', 11240, '074001', NULL, 8966, '140226197906176019', '李建利', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d3e87a538c51422c83265bb7d80609aa', 79, 0, 1335, 50, 0, 2200, 0, 2175, 2590, 1292, 0, 0, 0, 0, 2003, 0, 0, '太原学院', '事业', '01', 9721, '074001', NULL, 7718, '140112197909131277', '张海鹏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d3feb67ef2cb4c67a9eee47dcf920556', 104, 0, 1804, 0, 30, 4640, 0, 2275, 2940, 1908, 0, 0, 0, 0, 2706, 0, 0, '太原学院', '事业', '01', 13701, '074001', NULL, 10995, '130622198012072420', '代红艳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d4170755d6a4491f8e787ea233fe941c', 74, 0, 1208, 0, 30, 1950, 0, 1882, 2520, 1215, 0, 0, 0, 0, 1812, 0, 0, '太原学院', '事业', '01', 8879, '074001', NULL, 7067, '142703197811053328', '周荣霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d44f221a626b4324993d7f2ffef1ba3a', 99, 0, 1491, 50, 30, 3030, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2237, 0, 0, '太原学院', '事业', '01', 11145, '074001', NULL, 8908, '140102198201121462', '王鹭', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d45bbffad74e466bbf9f5f532af87eed', 89, 0, 1352, 0, 30, 2410, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2028, 0, 0, '太原学院', '事业', '01', 9934, '074001', NULL, 7906, '140102198110235165', '钱晓燕', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d59cd66ff50e4a72b600c5cd57d56ff4', 99, 0, 1631, 0, 30, 3260, 0, 3026, 2730, 1540, 0, 0, 0, 0, 2447, 0, 0, '太原学院', '事业', '01', 12316, '074001', NULL, 9869, '14010219730218488X', '侯志红', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d6660d546cd84609a2781b69c5852265', 99, 0, 1503, 50, 30, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2255, 0, 0, '太原学院', '事业', '01', 11257, '074001', NULL, 9002, '142423197903040021', '赵佼', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d70a8f84641b4a9283315b74c9db2762', 99, 0, 1480, 0, 30, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2220, 0, 0, '太原学院', '事业', '01', 10884, '074001', NULL, 8664, '140103198211104822', '葛坤', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d75c651a04144e69a0df301466416054', 89, 0, 1364, 50, 30, 2410, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2046, 0, 0, '太原学院', '事业', '01', 9996, '074001', NULL, 7950, '140102198212132327', '邓懿', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d76519c3fbb240c78fe35a955689281a', 89, 0, 1415, 0, 0, 2650, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2123, 0, 0, '太原学院', '事业', '01', 10507, '074001', NULL, 8384, '142424197705276515', '张乃江', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d7b782a372174270909e2ac1d5233e70', 99, 0, 1575, 0, 30, 3260, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2363, 0, 0, '太原学院', '事业', '01', 11709, '074001', NULL, 9346, '140102197603052362', '郭银芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d820c3f82a48445a87e4d555ec90e99e', 104, 0, 1901, 0, 0, 4640, 0, 2796, 2940, 1908, 0, 0, 0, 0, 2852, 0, 0, '太原学院', '事业', '01', 14289, '074001', NULL, 11437, '140103197506235710', '刘彬', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d88cdc00386848f7b346b7f71ee9aff3', 64, 0, 975, 0, 0, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1463, 0, 0, '太原学院', '事业', '01', 8067, '074001', NULL, 6604, '142222199412260339', '史俊杰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d894e41e73af4bfc976cc23f759b6ca8', 74, 0, 1112, 0, 0, 1925, 0, 1005, 2520, 1215, 0, 0, 0, 0, 1668, 0, 0, '太原学院', '事业', '01', 7851, '074001', NULL, 6183, '142325199610017510', '张玮', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d8adec46f2d64151b48122b2a378a1e5', 99, 0, 1443, 50, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2165, 0, 0, '太原学院', '事业', '01', 10804, '074001', NULL, 8639, '140121198210260527', '王宾彦', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d94aaf15d0e94aed9aa0667f9a4a17d8', 99, 4.2, 1846, 0, 30, 3810, 0, 4201, 2730, 1540, 0, 0, 0, 0, 2769, 0, 0, '太原学院', '事业', '01', 14260.2, '074001', NULL, 11491.2, '140103196511274269', '李俊萍', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d9a22fbda19b4a77be3318d29141e2a7', 99, 0, 1491, 50, 0, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2237, 0, 0, '太原学院', '事业', '01', 11215, '074001', NULL, 8978, '140103198207173913', '齐晋', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('d9f1da070b38487796a8e90ac936e622', 89, 0, 1361, 50, 30, 2185, 0, 2375, 2660, 1418, 0, 0, 0, 0, 2042, 0, 0, '太原学院', '事业', '01', 10168, '074001', NULL, 8126, '15262619800101332X', '杨素宜', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('da0377c57d604ffebb06e1212ca362cb', 89, 0, 1403, 50, 30, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2105, 0, 0, '太原学院', '事业', '01', 10335, '074001', NULL, 8230, '142322197808146547', '潘艳花', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('da5ff66be4784384bfad9b6456601988', 89, 0, 1043, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1565, 0, 0, '太原学院', '事业', '01', 8430, '074001', NULL, 6865, '652826199104140042', '李俊毅', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('da68be392fea4e108ae2335a1bdde820', 89, 0, 1307, 0, 0, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1961, 0, 0, '太原学院', '事业', '01', 9448, '074001', NULL, 7487, '140107198206021219', '徐斌', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('da880af701f84d9d9325551234383f44', 74, 0, 1072, 0, 30, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1608, 0, 0, '太原学院', '事业', '01', 7699, '074001', NULL, 6091, '142402199707016646', '董颖虹', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('dac5cdc4cd764ceab99580490033cac9', 79, 0, 1330, 0, 0, 2520, 0, 1882, 2660, 1383, 0, 0, 0, 0, 1995, 0, 0, '太原学院', '事业', '01', 9854, '074001', NULL, 7859, '14010719860320481X', '张秀峰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('dad07b1c2050433ebc77307cdf908408', 89, 0, 1320, 0, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1980, 0, 0, '太原学院', '事业', '01', 9491, '074001', NULL, 7511, '142322198612220586', '孟超', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('daf8c4850da04fc18289151ea0b22a29', 89, 0, 1267, 0, 0, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1901, 0, 0, '太原学院', '事业', '01', 9222, '074001', NULL, 7321, '140211198204263310', '乔永胜', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('dafd683ccd6140b59cff681c4ec63a99', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '140203199411092328', '王安琪', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('dafd7e4af9d74a528aed44c61017d8ec', 99, 0, 1564, 50, 30, 3260, 0, 2582, 2730, 1540, 0, 0, 0, 0, 2346, 0, 0, '太原学院', '事业', '01', 11855, '074001', NULL, 9509, '140303197605040047', '张云志', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('db1875800503417995535c113b7f949e', 99, 0, 1491, 50, 0, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2237, 0, 0, '太原学院', '事业', '01', 11215, '074001', NULL, 8978, '142202197708062476', '付树林', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('dbd011f73c76405296ff89a9bab70b6c', 104, 0, 1950, 0, 30, 4640, 0, 3141, 2940, 1908, 0, 0, 0, 0, 2925, 0, 0, '太原学院', '事业', '01', 14713, '074001', NULL, 11788, '140103197303070688', '李文洁', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('dc130fc59d984e7e8d4586f5fe17d772', 89, 0, 1412, 0, 30, 2410, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2118, 0, 0, '太原学院', '事业', '01', 10494, '074001', NULL, 8376, '140113198007122321', '王晓霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('dc837e2052034527a128730eae82637d', 94, 0, 1498, 0, 0, 2880, 0, 2475, 2730, 1551, 0, 0, 0, 0, 2247, 0, 0, '太原学院', '事业', '01', 11228, '074001', NULL, 8981, '142321197603155013', '刘立新', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('dc8a82aebe78462389576ad7e279dea1', 99, 0, 1474, 50, 0, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2211, 0, 0, '太原学院', '事业', '01', 10998, '074001', NULL, 8787, '140102198108172310', '赵鸿博', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('dca840a264d84468b3bbfd9b32fb8eb7', 89, 0, 1205, 0, 30, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1808, 0, 0, '太原学院', '事业', '01', 8756, '074001', NULL, 6948, '140121199112200621', '刘洋', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('dd6128426632405fb7bdfcff9f032cbc', 89, 0, 1120, 0, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1680, 0, 0, '太原学院', '事业', '01', 9384, '074001', NULL, 7704, '140106198109201924', '郭妍琼', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('dd7f52e0214a441f8ffc0acca5ef7948', 89, 3.8, 1549, 0, 0, 2650, 0, 3266, 2660, 1418, 0, 0, 0, 0, 2324, 0, 0, '太原学院', '事业', '01', 11635.8, '074001', NULL, 9311.8, '140103196910070036', '田安谷', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ddf1facca3524442a45584758114c51f', 104, 0, 1857, 0, 30, 4640, 0, 2689, 2940, 1908, 0, 0, 0, 0, 2786, 0, 0, '太原学院', '事业', '01', 14168, '074001', NULL, 11382, '140103197710206327', '李影', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('de16d1b0d76e4ccead0cdd0a796b5e32', 89, 0, 1158, 0, 0, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1737, 0, 0, '太原学院', '事业', '01', 9299, '074001', NULL, 7562, '142422198506152159', '赵志毅', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('de16e5fd64e444ce92377bcc00ac1bcc', 89, 0, 1374, 0, 30, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2061, 0, 0, '太原学院', '事业', '01', 10156, '074001', NULL, 8095, '140102198106106520', '霍芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('de2b586e6b44439280bddbd4df833541', 104, 0, 1962, 0, 30, 5220, 0, 2911, 2940, 1908, 0, 0, 0, 0, 2943, 0, 0, '太原学院', '事业', '01', 15075, '074001', NULL, 12132, '142226197204137420', '张先平', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('de567878e8784fc8b4bb0204ee25a57b', 94, 3.8, 1729, 0, 0, 3455, 0, 3266, 2800, 1810, 0, 0, 0, 0, 2594, 0, 0, '太原学院', '事业', '01', 13157.8, '074001', NULL, 10563.8, '140102196604132335', '薛斌', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('de5c474e47bc4bca97afc3e616db8e68', 99, 0, 1682, 0, 0, 3260, 0, 3516, 2730, 1540, 0, 0, 0, 0, 2523, 0, 0, '太原学院', '事业', '01', 12827, '074001', NULL, 10304, '140104196810111335', '姚念武', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('de765490e99a4e638c0350c1f708705a', 94, 0, 1446, 0, 30, 2880, 0, 1975, 2730, 1551, 0, 0, 0, 0, 2169, 0, 0, '太原学院', '事业', '01', 10706, '074001', NULL, 8537, '140102198005135226', '赵甜甜', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('de8d0191c4d34477ade55d8cafd4e4a3', 99, 0, 1587, 0, 30, 3030, 0, 2911, 2730, 1540, 0, 0, 0, 0, 2381, 0, 0, '太原学院', '事业', '01', 11927, '074001', NULL, 9546, '142431197602170025', '严芳芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('de9003e9d1084665b42f59fad70549ed', 89, 0, 1261, 50, 30, 2185, 0, 1603, 2660, 1418, 0, 0, 0, 0, 1892, 0, 0, '太原学院', '事业', '01', 9296, '074001', NULL, 7404, '140108198208252527', '张瑶', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('df1603d58c9245afb71c4139731fac1b', 74, 0, 1029, 0, 30, 1925, 0, 1882, 2520, 1215, 0, 0, 0, 0, 1544, 0, 0, '太原学院', '事业', '01', 8675, '074001', NULL, 7131, '230421198312162627', '焦颖', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('df162ff82df349a89530b9160cff7ed0', 89, 0, 1309, 50, 30, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 1964, 0, 0, '太原学院', '事业', '01', 9716, '074001', NULL, 7752, '140106198406212523', '程晓洁', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('df35059f5759464bb4b6d08868d21f11', 99, 0, 1453, 50, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2180, 0, 0, '太原学院', '事业', '01', 10814, '074001', NULL, 8634, '142601198609262843', '王昕光', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('df5f770658804511865b1b97bb7259e8', 89, 0, 1235, 0, 0, 2185, 0, 1427, 2660, 1418, 0, 0, 0, 0, 1853, 0, 0, '太原学院', '事业', '01', 9014, '074001', NULL, 7161, '141124198909260192', '刘伟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('df67724bb75a4bfa9bcd9312a06c9b19', 79, 0, 1293, 0, 30, 2200, 0, 2075, 2590, 1292, 0, 0, 0, 0, 1940, 0, 0, '太原学院', '事业', '01', 9559, '074001', NULL, 7619, '411102198103205669', '任淑婷', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('dfb3b49cdb304fc4ac31a4f9f2950ad6', 99, 0, 1479, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2219, 0, 0, '太原学院', '事业', '01', 11033, '074001', NULL, 8814, '142625197903120025', '李慧慧', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('dfec023361de4e4dac7326cff81c368a', 89, 0, 1475, 0, 30, 2410, 0, 3026, 2660, 1418, 0, 0, 0, 0, 2213, 0, 0, '太原学院', '事业', '01', 11108, '074001', NULL, 8895, '14223319720528002X', '续珍', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e00c339048674373af99a1bc3cc6efdd', 99, 0, 1453, 0, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2180, 0, 0, '太原学院', '事业', '01', 10764, '074001', NULL, 8584, '140108198709041920', '尹婷婷', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e011a44c5b624b669e6430d8f8344f9c', 89, 0, 1226, 0, 0, 2185, 0, 1169, 2660, 1418, 0, 0, 0, 0, 1839, 0, 0, '太原学院', '事业', '01', 8747, '074001', NULL, 6908, '130406199210270616', '张鑫', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e012d7b6e3894b7190b960670019f534', 89, 0, 1270, 0, 0, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1905, 0, 0, '太原学院', '事业', '01', 9318, '074001', NULL, 7413, '142601198605089713', '王鹏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e03c42f290684ba9b4118f4d3e966e32', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '140202199511045020', '姜楠', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e049090098f044ff97c9f365113a8598', 89, 0, 1352, 50, 30, 2410, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2028, 0, 0, '太原学院', '事业', '01', 10084, '074001', NULL, 8056, '140104198112170847', '胥洋', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e054732114a84282bce026e7d268b41c', 74, 0, 1132, 0, 30, 1925, 0, 1251, 2520, 1215, 0, 0, 0, 0, 1698, 0, 0, '太原学院', '事业', '01', 8147, '074001', NULL, 6449, '140402199111280444', '张迪', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e0d78b96646f4ea8ac70f2cc593158ac', 89, 0, 1273, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1910, 0, 0, '太原学院', '事业', '01', 9351, '074001', NULL, 7441, '140121198402072520', '郝宇丽', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e0ee30ef82484286afe93a62b413bcba', 69, 4, 1328, 0, 0, 2260, 0, 2221, 2590, 1365, 0, 0, 0, 0, 1992, 0, 0, '太原学院', '事业', '01', 9837, '074001', NULL, 7845, '140103197506040657', '唐嘉尧', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e11652b4826a41838fea0f89ebe802b2', 89, 0, 1201, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1802, 0, 0, '太原学院', '事业', '01', 8922, '074001', NULL, 7120, '14232519900515252X', '裴婷', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e16bba1144324824b50c4a33bfac4931', 94, 0, 1435, 0, 30, 2880, 0, 1975, 2730, 1551, 0, 0, 0, 0, 2153, 0, 0, '太原学院', '事业', '01', 10695, '074001', NULL, 8542, '421002198106232423', '张霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e1d321921db1498da7ace3f83b705807', 99, 0, 1443, 0, 30, 3030, 0, 1882, 2730, 1540, 0, 0, 0, 0, 2165, 0, 0, '太原学院', '事业', '01', 10754, '074001', NULL, 8589, '142325198208065528', '陶燕贞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e1fe5ee2451d4e93a1836bd47d2963a3', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '140721199109070080', '杨静', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e245d3907d2c46c5b3d8e3160ec82d3f', 89, 0, 1212, 0, 0, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1818, 0, 0, '太原学院', '事业', '01', 8815, '074001', NULL, 6997, '14010619930607181X', '郭宇晨', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e256a1ae39ae4d30a5de11ff060af04e', 94, 0, 1431, 0, 0, 2880, 0, 2275, 2730, 1551, 560, 0, 0, 0, 2147, 1666, 0, '太原学院', '事业', '01', 13187, '074001', '2025-07-01', 11040, '142731197810186319', '高文艳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e274f00ade2d49d49e7b27086bf4ee88', 89, 0, 1270, 0, 0, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1905, 0, 0, '太原学院', '事业', '01', 9318, '074001', NULL, 7413, '130121198811123817', '陈志贤', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e2b1527d9b4440f8b0209c73d7026892', 79, 0, 1280, 0, 30, 2200, 0, 1975, 2590, 1292, 0, 0, 0, 0, 1920, 0, 0, '太原学院', '事业', '01', 9446, '074001', NULL, 7526, '140181198204112823', '王越英', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e2c80213e61a4d7ca9edc9188577c8f7', 89, 0, 1275, 0, 30, 2185, 0, 1515, 2660, 1418, 0, 0, 0, 0, 1913, 0, 0, '太原学院', '事业', '01', 9172, '074001', NULL, 7259, '142401198901291448', '侯莉芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e341ad2afb1f4610b0f29a35e55eeff3', 99, 0, 1468, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2202, 0, 0, '太原学院', '事业', '01', 11022, '074001', NULL, 8820, '142601198211181920', '张新华', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e345f05021944e8f82a78c0acb075c5c', 99, 4.6, 1837, 0, 30, 3810, 0, 4061, 2730, 1540, 0, 0, 0, 0, 2756, 0, 0, '太原学院', '事业', '01', 14111.6, '074001', NULL, 11355.6, '140112196512081289', '闫晓平', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e355e51023b1493d8f922a5c02275144', 89, 0, 1297, 50, 30, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1946, 0, 0, '太原学院', '事业', '01', 9611, '074001', NULL, 7665, '140106198309013047', '贾莉婷', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e3952848b282442d833beb99507c572c', 99, 0, 1517, 50, 0, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2276, 0, 0, '太原学院', '事业', '01', 11441, '074001', NULL, 9165, '142322197707211012', '张鹏飞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e3b684c1598f4686a4d880f479541758', 89, 0, 1378, 0, 30, 2410, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2067, 0, 0, '太原学院', '事业', '01', 10260, '074001', NULL, 8193, '140102197806146529', '张海燕', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e4bc6f0679ca41198389068b73535701', 79, 0, 1293, 50, 30, 2200, 0, 2075, 2590, 1292, 0, 0, 0, 0, 1940, 0, 0, '太原学院', '事业', '01', 9609, '074001', NULL, 7669, '14010719830608222X', '王胜利', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e4d11f300d0441e58e0e411147d33f39', 99, 0, 1465, 0, 0, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2198, 0, 0, '太原学院', '事业', '01', 10939, '074001', NULL, 8741, '140102198207313414', '胡轶', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e51e536767a74801b11972f388cd0db0', 94, 0, 1555, 0, 0, 2880, 0, 2911, 2730, 1551, 0, 0, 0, 0, 2333, 0, 0, '太原学院', '事业', '01', 11721, '074001', NULL, 9388, '140105197501303713', '施新彬', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e5210538d37a47e2b7b3b030dbd41309', 74, 0, 1077, 0, 30, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1616, 0, 0, '太原学院', '事业', '01', 7704, '074001', NULL, 6088, '142429199809122829', '张晓薇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e5252612f6cb49f38af40edf2ddc2e0e', 94, 3.9, 1778, 0, 0, 3455, 0, 3641, 2800, 1810, 0, 0, 0, 0, 2667, 0, 0, '太原学院', '事业', '01', 13581.9, '074001', NULL, 10914.9, '140105196911275036', '吴永胜', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e56aefd300fc438a9f3dac4b7d99b7a5', 74, 0, 1229, 50, 30, 1925, 0, 1789, 2520, 1215, 0, 0, 0, 0, 1844, 0, 0, '太原学院', '事业', '01', 8832, '074001', NULL, 6988, '130124198401014529', '李朔', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e5885fdcfe3348d9b7b8722eae2a789c', 74, 0, 1094, 0, 0, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1641, 0, 0, '太原学院', '事业', '01', 7691, '074001', NULL, 6050, '140424199705030010', '王旭', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e5d25ca0f07540c8951d3ee7590246f2', 89, 0, 1285, 0, 30, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1928, 0, 0, '太原学院', '事业', '01', 9456, '074001', NULL, 7528, '142332198803090027', '陈雅茜', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e5e8a59104ad44aeb278c9298a41e82e', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '140202199509104028', '刘晓燕', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e5f6b34e4d8c47a9912b1cea08cdd6a6', 89, 0, 1294, 50, 0, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1941, 0, 0, '太原学院', '事业', '01', 9578, '074001', NULL, 7637, '140112198206030415', '刘旭中', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e625b79eecb0497b8efd53d333316f9d', 94, 0, 1632, 0, 0, 3455, 0, 2475, 2800, 1810, 0, 0, 0, 0, 2448, 0, 0, '太原学院', '事业', '01', 12266, '074001', NULL, 9818, '140102197812056511', '赵永刚', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e6ddec217dc74ec2839ad0d4ae319bbb', 99, 0, 1796, 0, 30, 3810, 0, 3516, 2730, 1540, 0, 0, 0, 0, 2694, 0, 0, '太原学院', '事业', '01', 13521, '074001', NULL, 10827, '142324197202030024', '李彩兰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e6fe292fcd724f118d06a2b63d33c1cc', 89, 0, 1227, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1841, 0, 0, '太原学院', '事业', '01', 8948, '074001', NULL, 7107, '410521199406303527', '张晶晶', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e84b408cacb64da4b90296476edc75e4', 99, 0, 1431, 50, 30, 3030, 0, 1789, 2730, 1540, 0, 0, 0, 0, 2147, 0, 0, '太原学院', '事业', '01', 10699, '074001', NULL, 8552, '430482198308250026', '李芳萍', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e896748a04b943c095284ab0d2feb8c0', 89, 0, 1322, 0, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1983, 0, 0, '太原学院', '事业', '01', 9779, '074001', NULL, 7796, '140103198210024222', '乔虹', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e90d188008204549ba2134c9a8248c3c', 104, 0, 1827, 50, 30, 4640, 0, 2375, 2940, 1908, 0, 0, 0, 0, 2741, 0, 0, '太原学院', '事业', '01', 13874, '074001', NULL, 11133, '140103197812082441', '赵婕', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e91da651760041a7bd4b84d311c24958', 94, 0, 1613, 50, 0, 3455, 0, 2375, 2800, 1810, 0, 0, 0, 0, 2420, 0, 0, '太原学院', '事业', '01', 12197, '074001', NULL, 9777, '140103197903015738', '赵雨竹', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e92064588eb645ce8fa48e97d88e4762', 99, 0, 1455, 0, 30, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2183, 0, 0, '太原学院', '事业', '01', 10859, '074001', NULL, 8676, '140481198306063627', '陈荷花', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e94d438d6e674195b20879035751bdda', 89, 0, 1273, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1910, 0, 0, '太原学院', '事业', '01', 9351, '074001', NULL, 7441, '140511198710172389', '张珍珍', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e95acc13543a4fe9a933a33a408ff34c', 99, 0, 1498, 50, 30, 3260, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2247, 0, 0, '太原学院', '事业', '01', 11282, '074001', NULL, 9035, '140102198111271440', '尹一帆', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e987c26858ff4cb69e4bc2a211d35973', 64, 0, 979, 0, 30, 0, 0, 0, 2660, 1418, 0, 0, 2950, 0, 1469, 0, 0, '太原学院', '事业', '01', 8101, '074001', NULL, 6632, '142603199307182028', '李旋', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('e9d05352bf9c4c3aab65c7b471ac1ca5', 89, 0, 1291, 0, 0, 2185, 0, 1789, 2660, 1418, 0, 0, 0, 0, 1937, 0, 0, '太原学院', '事业', '01', 9432, '074001', NULL, 7495, '140108198609192510', '代欣', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ea5a27795d5c45e18cc5873c5bd2b340', 89, 4, 1492, 50, 30, 2650, 0, 2911, 2660, 1418, 0, 0, 0, 0, 2238, 0, 0, '太原学院', '事业', '01', 11304, '074001', NULL, 9066, '140103197503060628', '李敏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ea73ad95ff024fa292129c567cd43e86', 89, 0, 1318, 0, 30, 2185, 0, 1975, 2660, 1418, 0, 0, 0, 0, 1977, 0, 0, '太原学院', '事业', '01', 9675, '074001', NULL, 7698, '142401197810031443', '任艳慧', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ea867fe673174192ae7f7d2527898bee', 89, 0, 1365, 0, 30, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2048, 0, 0, '太原学院', '事业', '01', 10147, '074001', NULL, 8099, '140321198009070060', '王岚', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ea999a3e1e3445e7955876157bf15f40', 94, 0, 1526, 50, 0, 2880, 0, 2689, 2730, 1551, 0, 0, 0, 0, 2289, 0, 0, '太原学院', '事业', '01', 11520, '074001', NULL, 9231, '140121197803165512', '秦永刚', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('eaebaaa9d7864f44958a3b43fe9f1e5c', 99, 0, 1455, 0, 30, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2183, 0, 0, '太原学院', '事业', '01', 10859, '074001', NULL, 8676, '140109198303291520', '冯慧瑛', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('eafa8c8371294c73aabdf4b061b95d7d', 79, 0, 1398, 0, 30, 2520, 0, 2375, 2660, 1383, 0, 0, 0, 0, 2097, 0, 0, '太原学院', '事业', '01', 10445, '074001', NULL, 8348, '14010219811118702X', '武哲敏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('eb2f7d7c8cf24fd9a8143a9e89a595ae', 74, 0, 1210, 0, 0, 1925, 0, 1882, 2520, 1215, 0, 0, 0, 0, 1815, 0, 0, '太原学院', '事业', '01', 8826, '074001', NULL, 7011, '140102198211230013', '郭涛', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('eb5ba2fb69dd42a0b8bbcc6b32638172', 99, 0, 1524, 0, 30, 3260, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2286, 0, 0, '太原学院', '事业', '01', 11458, '074001', NULL, 9172, '14222719781004102X', '刘小英', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ebaa367881584195bcc17b2b1906b3eb', 74, 0, 1313, 0, 30, 1950, 0, 2689, 2520, 1215, 0, 0, 0, 0, 1970, 0, 0, '太原学院', '事业', '01', 9791, '074001', NULL, 7821, '140102197508045164', '尹艳芬', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ebeb6df7687049eb990c09fa57e5ac0a', 99, 4.5, 1727, 0, 30, 3260, 0, 3641, 2730, 1540, 0, 0, 0, 0, 2591, 0, 0, '太原学院', '事业', '01', 13031.5, '074001', NULL, 10440.5, '142429197201290841', '李燕', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ec67eb6b05cf45faa669d164961b23da', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 35000, '太原学院', '事业', '01', 35000, '074001', NULL, 35000, '140103196510302731', '王建伟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ec920c0fd9a549709c54d97f5c4d2bfb', 89, 0, 1391, 50, 30, 2410, 0, 2375, 2660, 1418, 0, 0, 0, 0, 2087, 0, 0, '太原学院', '事业', '01', 10423, '074001', NULL, 8336, '140102197807204049', '雷丽', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ecfcb35bae2047c482e5a87b38652815', 94, 0, 1489, 0, 0, 2880, 0, 2475, 2730, 1551, 0, 0, 0, 0, 2234, 0, 0, '太原学院', '事业', '01', 11219, '074001', NULL, 8985, '142622197908124210', '李峰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ed3e443fd6554ae6afbab15649ff52df', 94, 0, 1489, 0, 0, 2880, 0, 2075, 2730, 1551, 0, 0, 0, 0, 2234, -1708, 0, '太原学院', '事业', '01', 9111, '074001', '2025-07-01', 6877, '140511198107181918', '李小广', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ed5a8292f8c943919fdad2a9dd830322', 89, 0, 1190, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1785, 0, 0, '太原学院', '事业', '01', 8577, '074001', NULL, 6792, '140107199509124527', '段珮华', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('edb9f245c0eb4e1185e1c4d70ab0ff91', 69, 3.5, 1339, 0, 0, 2260, 0, 2041, 2590, 1365, 0, 0, 0, 0, 2009, 0, 0, '太原学院', '事业', '01', 9667.5, '074001', NULL, 7658.5, '140102197503276510', '张义强', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('edf88020b231492fbdda4d0d256a0b22', 89, 0, 1283, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1925, 0, 0, '太原学院', '事业', '01', 9361, '074001', NULL, 7436, '140109198511290020', '陈婧', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ee192f678e2940f480add0c2b1b73c84', 99, 0, 1530, 0, 0, 3260, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2295, 0, 0, '太原学院', '事业', '01', 11434, '074001', NULL, 9139, '140103197802274212', '张凯', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('eebed096953e4f7b88f882c4f833b505', 89, 0, 1225, 0, 30, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1838, 0, 0, '太原学院', '事业', '01', 8858, '074001', NULL, 7020, '140621199103086123', '王永丽', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ef0a2274c826412a8316302c464c2791', 89, 0, 1333, 50, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 2000, 0, 0, '太原学院', '事业', '01', 9840, '074001', NULL, 7840, '140103198201270640', '王蕾', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ef59b56bb3294649997c29646b87c843', 99, 0, 1508, 0, 0, 3260, 0, 2175, 2730, 1540, 0, 0, 0, 0, 2262, 0, 0, '太原学院', '事业', '01', 11312, '074001', NULL, 9050, '140103198008293373', '李渊', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ef8b676629e4470d9afdfc2da048dbd3', 89, 0, 1191, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1787, 0, 0, '太原学院', '事业', '01', 8660, '074001', NULL, 6873, '140429199504015625', '牛瑜霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('efb51fb73e1b44e881df965c2e74d8dd', 69, 0, 1137, 50, 30, 1830, 0, 1383, 2450, 1176, 0, 0, 0, 0, 1706, 0, 0, '太原学院', '事业', '01', 8125, '074001', NULL, 6419, '140105198805071821', '王荣', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('efca8dafd032480ebdf48b947c5896ee', 89, 0, 1400, 50, 30, 2410, 0, 2375, 2660, 1418, 0, 0, 0, 0, 2100, 0, 0, '太原学院', '事业', '01', 10432, '074001', NULL, 8332, '140103197907122725', '张静', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f06bfd4ff059443f978ee4d4d3234a1a', 99, 0, 1637, 0, 30, 3260, 0, 3141, 2730, 1540, 0, 0, 0, 0, 2456, 0, 0, '太原学院', '事业', '01', 12437, '074001', NULL, 9981, '140102197209134829', '李琦', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f0b0ddcdccfd4ea7ab30d9045bfb874a', 104, 0, 2272, 0, 0, 5125, 0, 4481, 3220, 2426, 0, 0, 0, 0, 3408, 0, 0, '太原学院', '事业', '01', 17628, '074001', NULL, 14220, '142601196805241936', '郝勇东', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f12097e6ac8a43f8a44a4f33c8d21022', 99, 0, 1455, 50, 30, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2183, 0, 0, '太原学院', '事业', '01', 10909, '074001', NULL, 8726, '220105198402111243', '李文欢', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f28d645ca3e144eb9e2dd52f869179be', 74, 0, 1078, 0, 0, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1617, 0, 0, '太原学院', '事业', '01', 7675, '074001', NULL, 6058, '142328199508200019', '薛驹', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f2cf2e3056984cbfb7b1a9deaa934f00', 89, 0, 1417, 0, 30, 2410, 0, 2582, 2660, 1418, 0, 0, 0, 0, 2126, 0, 0, '太原学院', '事业', '01', 10606, '074001', NULL, 8480, '140122197712081125', '张俊芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f2edbd49389d4c5ca77449b25fb0c916', 89, 0, 1418, 0, 30, 2650, 0, 2275, 2660, 1418, 0, 0, 0, 0, 2127, 0, 0, '太原学院', '事业', '01', 10540, '074001', NULL, 8413, '140522198009080020', '吴晨辉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f2f4e903111843febb6a05a2cafe55fe', 89, 0, 1177, 0, 0, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1766, 0, 0, '太原学院', '事业', '01', 8534, '074001', NULL, 6768, '141122199408250094', '毋伟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f33df960eedf45a6ae934901e0012a64', 79, 0, 1252, 0, 0, 2200, 0, 1696, 2590, 1292, 0, 0, 0, 0, 1878, 0, 0, '太原学院', '事业', '01', 9109, '074001', NULL, 7231, '142603198409045812', '赵晓华', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f3fdb296ab204357b375de9c3f9bb2a0', 89, 0, 1351, 0, 30, 2410, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2027, 0, 0, '太原学院', '事业', '01', 9933, '074001', NULL, 7906, '140121198204123526', '刘二娟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f406b36549634f72964377feead83314', 89, 0, 1273, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1910, 0, 0, '太原学院', '事业', '01', 9351, '074001', NULL, 7441, '142732198611210428', '董慧芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f42d83aed8064c919cc3432115c4fb39', 79, 0, 1328, 0, 0, 2520, 0, 1789, 2660, 1383, 0, 0, 0, 0, 1992, 0, 0, '太原学院', '事业', '01', 9759, '074001', NULL, 7767, '142401198609210911', '翟璠', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f45d47e251514a358af7d8089af7da8f', 89, 0, 1265, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1898, 0, 0, '太原学院', '事业', '01', 8986, '074001', NULL, 7088, '142702199302281245', '相蕾', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f47036c359e1418c9494503bc31f4bb1', 89, 0, 1250, 0, 30, 2185, 0, 1515, 2660, 1418, 0, 0, 0, 0, 1875, 0, 0, '太原学院', '事业', '01', 9147, '074001', NULL, 7272, '142326198410042123', '常星花', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f491cec055d644b999751a757c921685', 89, 0, 1203, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1805, 0, 0, '太原学院', '事业', '01', 8672, '074001', NULL, 6867, '140481199502086820', '甄家琪', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f4d2fa4f8acc49c397b4ffcf3e11f2b1', 89, 0, 1391, 0, 30, 2410, 0, 2375, 2660, 1418, 0, 0, 0, 0, 2087, 0, 0, '太原学院', '事业', '01', 10373, '074001', NULL, 8286, '140102197912204024', '张欣', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f547aca2f9de405e8fef0724c4d5d8f7', 94, 0, 1450, 0, 30, 2880, 0, 2075, 2730, 1551, 0, 0, 0, 0, 2175, 0, 0, '太原学院', '事业', '01', 10810, '074001', NULL, 8635, '140302198010170828', '杜芳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f58643ec90944b94985cee9bba23480e', 89, 0, 1404, 0, 30, 2410, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2106, 0, 0, '太原学院', '事业', '01', 10486, '074001', NULL, 8380, '142424197609202321', '李海珍', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f5d3e135190546f98eb125e63fa13852', 99, 0, 1616, 0, 30, 3260, 0, 2911, 2730, 1540, 0, 0, 0, 0, 2424, 0, 0, '太原学院', '事业', '01', 12186, '074001', NULL, 9762, '140104197402160845', '郭峥春', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f61dfe7e7bee4ceb94710e5418539e01', 74, 0, 1216, 0, 0, 1950, 0, 1975, 2520, 1215, 0, 0, 0, 0, 1824, 0, 0, '太原学院', '事业', '01', 8950, '074001', NULL, 7126, '140102198106232332', '崔欣', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f62251ded4894c68b7cf555c7f499bf1', 99, 0, 1737, 0, 0, 3260, 0, 3641, 2730, 1540, 0, 0, 0, 0, 2606, 0, 0, '太原学院', '事业', '01', 13007, '074001', NULL, 10401, '140102197002122310', '张武', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f64f30b6fd354bf487551f446fd96233', 94, 0, 1475, 50, 0, 2880, 0, 2175, 2730, 1551, 0, 0, 0, 0, 2213, 0, 0, '太原学院', '事业', '01', 10955, '074001', NULL, 8742, '140103197804024217', '杜杰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f6629fa9a5da401d9d8f9917593c87d5', 99, 0, 1468, 50, 30, 3030, 0, 2075, 2730, 1540, 0, 0, 0, 0, 2202, 0, 0, '太原学院', '事业', '01', 11022, '074001', NULL, 8820, '140107198307222626', '张婷', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f70f8312a5524a2eb817bf72924778db', 104, 0, 1855, 0, 30, 4640, 0, 2475, 2940, 1908, 0, 0, 0, 0, 2783, 0, 0, '太原学院', '事业', '01', 13952, '074001', NULL, 11169, '142329197509230022', '张梅英', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f72d37ca5a8a4cfbb6feab0ad0bda8f6', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '140109199309160024', '刘阳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f768f6ce8aa140cbba5c84d6e0cb6189', 89, 0, 1506, 0, 30, 2650, 0, 3026, 2660, 1418, 0, 0, 0, 0, 2259, 0, 0, '太原学院', '事业', '01', 11379, '074001', NULL, 9120, '140123197301020025', '郭建平', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f7a9684839b7453f8f4ca8d22db3894e', 89, 0, 1319, 0, 0, 2185, 0, 1882, 2660, 1418, 0, 0, 0, 0, 1979, 0, 0, '太原学院', '事业', '01', 9553, '074001', NULL, 7574, '140106198301200614', '南昊', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f7fd34f470f14c86a3100fbbd4233c06', 89, 0, 1339, 0, 30, 2410, 0, 1975, 2660, 1418, 0, 0, 0, 0, 2009, 0, 0, '太原学院', '事业', '01', 9921, '074001', NULL, 7912, '140107198312080626', '孙睿', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f808a088ce7143368fe0bbf1fb4085b6', 99, 0, 1432, 0, 30, 3030, 0, 1603, 2730, 1540, 0, 0, 0, 0, 2148, 0, 0, '太原学院', '事业', '01', 10464, '074001', NULL, 8316, '140430198410060047', '郝佳瑞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f8573f2954b44a3f96c09bd1cc5943ce', 99, 0, 1520, 0, 30, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2280, 0, 0, '太原学院', '事业', '01', 11424, '074001', NULL, 9144, '142724197809061945', '汪艳霞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f8649b379b74446f82c7aa14011d00fe', 89, 0, 1322, 50, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1983, 0, 0, '太原学院', '事业', '01', 9829, '074001', NULL, 7846, '142726198206260029', '杨旭丽', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f86720aba19f456d9d97c12deb99f3ee', 89, 0, 1331, 50, 30, 2185, 0, 2075, 2660, 1418, 0, 0, 0, 0, 1997, 0, 0, '太原学院', '事业', '01', 9838, '074001', NULL, 7841, '140107198202111225', '张红玉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f8b9c8d360be4daa918cfdfbef1dedd4', 74, 0, 1180, 0, 30, 1925, 0, 1696, 2520, 1215, 0, 0, 0, 0, 1770, 0, 0, '太原学院', '事业', '01', 8640, '074001', NULL, 6870, '140102198008075142', '陈炜', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f926f165fcc4472787e2db41631661f6', 89, 0, 1206, 0, 30, 2185, 0, 1005, 2660, 1418, 0, 0, 0, 0, 1809, 0, 0, '太原学院', '事业', '01', 8593, '074001', NULL, 6784, '140109199608190565', '张子怡', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f944b3e8084b49b59dcd7450c5e7a1af', 74, 0, 1078, 0, 0, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1617, 0, 0, '太原学院', '事业', '01', 7746, '074001', NULL, 6129, '140109199803091511', '宁瑞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f9735225ca8a4fd1aca9cdc18b0c33cd', 79, 0, 1276, 50, 0, 2200, 0, 1882, 2590, 1292, 0, 0, 0, 0, 1914, 0, 0, '太原学院', '事业', '01', 9369, '074001', NULL, 7455, '140106198305272519', '牛晓亮', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f98c262622ad43fdb26305b3c8c23171', 74, 0, 1137, 0, 30, 1925, 0, 1169, 2520, 1215, 0, 0, 0, 0, 1706, 0, 0, '太原学院', '事业', '01', 8070, '074001', NULL, 6364, '140829198803190025', '张秀丽', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('f9c0f1fe0c26481e89db4467d487646c', 94, 0, 1496, 0, 0, 2880, 0, 2275, 2730, 1551, 0, 0, 0, 0, 2244, 0, 0, '太原学院', '事业', '01', 11026, '074001', NULL, 8782, '140102197702160019', '蔡治国', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('fa09b6794ec84e54bbcf0c49744edbc8', 99, 0, 1399, 0, 30, 3030, 0, 1603, 2730, 1540, 0, 0, 0, 0, 2099, 0, 0, '太原学院', '事业', '01', 10431, '074001', NULL, 8332, '140109199007021029', '杨凡', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('fa1c0671c31745a096a601738b673d8b', 74, 0, 1081, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1622, 0, 0, '太原学院', '事业', '01', 7779, '074001', NULL, 6157, '142401199511171445', '张雯', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('fa43fb0a4cd342fe999ae4499c77c37d', 74, 0, 1363, 0, 30, 1925, 0, 3026, 2520, 1215, 0, 0, 0, 0, 2045, 0, 0, '太原学院', '事业', '01', 10153, '074001', NULL, 8108, '140103197112230087', '常玉萍', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('fa4cb0ef8aa0485dbe305c64aa91fab9', 99, 0, 1564, 0, 30, 3260, 0, 2582, 2730, 1540, 0, 0, 0, 0, 2346, 0, 0, '太原学院', '事业', '01', 11805, '074001', NULL, 9459, '140102197704222340', '郝丽珍', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('fa8f7344de3f4e33bddf8c5e2da5b184', 94, 4.2, 1832, 0, 0, 3455, 0, 4061, 2800, 1810, 0, 0, 0, 0, 2748, 0, 0, '太原学院', '事业', '01', 14056.2, '074001', NULL, 11308.2, '620102196707155390', '崔宪宏', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('fa93b63ecc4344e2b63f67b8fccf8066', 89, 0, 1227, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1841, 0, 0, '太原学院', '事业', '01', 8948, '074001', NULL, 7107, '140121199102220645', '孟洁', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('fad3384a929c451890077ef3873ab1a0', 99, 4.8, 1874, 0, 30, 3810, 0, 4341, 2730, 1540, 0, 0, 0, 0, 2811, 0, 0, '太原学院', '事业', '01', 14428.8, '074001', NULL, 11617.8, '140103196512205740', '马红梅', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('faf94f3b4a6d4805a782e4ab2332bf9c', 99, 0, 1494, 0, 30, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2241, 0, 0, '太原学院', '事业', '01', 11198, '074001', NULL, 8957, '142429198209172828', '张雅清', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('fb2db271be90477382dc87a01349af0e', 89, 0, 1365, 0, 30, 2410, 0, 2175, 2660, 1418, 0, 0, 0, 0, 2048, 0, 0, '太原学院', '事业', '01', 10147, '074001', NULL, 8099, '140102198201143426', '陈婷', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('fbc82def672f4b6caf5033ebe946e639', 94, 0, 1450, 0, 30, 2880, 0, 2075, 2730, 1551, 0, 0, 0, 0, 2175, 0, 0, '太原学院', '事业', '01', 10810, '074001', NULL, 8635, '140302198111050024', '范菲', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('fc015430ae134b4a8ac2d09c1bf1b4a3', 69, 0, 1303, 0, 0, 2260, 0, 1954, 2590, 1365, 0, 0, 0, 0, 1955, 0, 0, '太原学院', '事业', '01', 9541, '074001', NULL, 7586, '140103197505181239', '李伟', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('fc34ea48aa0d45ab90c2f9aeb7ff0dfc', 89, 0, 1212, 0, 0, 2185, 0, 1251, 2660, 1418, 0, 0, 0, 0, 1818, 0, 0, '太原学院', '事业', '01', 8815, '074001', NULL, 6997, '140106199008131212', '张云飞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('fc47230560d24bdca1fa44c484e33186', 89, 0, 1194, 0, 30, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1791, 0, 0, '太原学院', '事业', '01', 8663, '074001', NULL, 6872, '14112219940820010X', '杨阳', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('fc63f8e7ecfe4018847bd3c7426b4f3c', 89, 0, 1400, 0, 0, 2410, 0, 2475, 2660, 1418, 0, 0, 0, 0, 2100, 0, 0, '太原学院', '事业', '01', 10452, '074001', NULL, 8352, '412824197609063533', '陈磊刚', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('fc6b17a89363400b944ae8a9683c6d23', 89, 0, 1191, 0, 0, 2185, 0, 1087, 2660, 1418, 0, 0, 0, 0, 1787, 0, 0, '太原学院', '事业', '01', 8630, '074001', NULL, 6843, '14042819940608601X', '王志辉', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('fc8f3ea233fc4deaba52f658ad7b162a', 89, 0, 1252, 0, 30, 2185, 0, 1339, 2660, 1418, 0, 0, 0, 0, 1878, 0, 0, '太原学院', '事业', '01', 8973, '074001', NULL, 7095, '140721199105310083', '李圆圆', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('fca7d1333397408d8786868cc2f81d95', 69, 0, 1200, 0, 30, 1925, 0, 1789, 2520, 1215, 0, 0, 0, 0, 1800, 0, 0, '太原学院', '事业', '01', 8748, '074001', NULL, 6948, '140107198402281720', '于宏飞', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('fcb941b74dcd48b1b93fb290c9f3a081', 104, 0, 1887, 0, 30, 4640, 0, 2689, 2940, 1908, 0, 0, 0, 0, 2831, 0, 0, '太原学院', '事业', '01', 14198, '074001', NULL, 11367, '140102197608312346', '刘荷花', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('fcc627803feb46778e82e3a5adbee6ee', 99, 0, 1519, 0, 30, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2279, 0, 0, '太原学院', '事业', '01', 11223, '074001', NULL, 8944, '142628197910220023', '李晓茹', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('fcd05264f65240888c2b0b6d744c4fee', 104, 0, 2067, 0, 0, 5220, 0, 3641, 2940, 1908, 0, 0, 0, 0, 3101, 0, 0, '太原学院', '事业', '01', 15880, '074001', NULL, 12779, '142222197102090910', '张卫东', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('fce892d100144f0c99087f7d79f24c18', 74, 0, 1072, 0, 30, 1925, 0, 863, 2520, 1215, 0, 0, 0, 0, 1608, 0, 0, '太原学院', '事业', '01', 7699, '074001', NULL, 6091, '140702199701317100', '霍冰融', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('fd025105beb547dcbfda714599142892', 74, 0, 1095, 0, 30, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1643, 0, 0, '太原学院', '事业', '01', 7793, '074001', NULL, 6150, '140402199611160422', '王卓然', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('fd076701c27b426a84fd4cd072ee2d3d', 74, 0, 1088, 0, 0, 1925, 0, 934, 2520, 1215, 0, 0, 0, 0, 1632, 0, 0, '太原学院', '事业', '01', 7756, '074001', NULL, 6124, '371522199412057216', '董鹤', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('fd59e34ffaf4451bb7654aca95e948bb', 89, 0, 1298, 0, 30, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1947, 0, 0, '太原学院', '事业', '01', 9376, '074001', NULL, 7429, '41082119870809454X', '樊亚男', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('fd706aa7f9514abba0c4b7795d40e2c7', 94, 0, 1747, 0, 0, 3455, 0, 3141, 2800, 1810, 0, 0, 0, 0, 2621, 0, 0, '太原学院', '事业', '01', 13047, '074001', NULL, 10426, '140102197303235159', '翟四团', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('fe33b1226de3457f83605317c07a5d3b', 99, 0, 1461, 50, 0, 3030, 0, 1975, 2730, 1540, 0, 0, 0, 0, 2192, 0, 0, '太原学院', '事业', '01', 10885, '074001', NULL, 8693, '142402198008243319', '赵承勇', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ff55f2856eae43a0a37bb70bb0052797', 99, 0, 1520, 50, 30, 3030, 0, 2475, 2730, 1540, 0, 0, 0, 0, 2280, 0, 0, '太原学院', '事业', '01', 11474, '074001', NULL, 9194, '142601198003051929', '李晓华', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ff98bd117b8242b2bee43aef08e3b86c', 89, 0, 1270, 50, 0, 2185, 0, 1696, 2660, 1418, 0, 0, 0, 0, 1905, 0, 0, '太原学院', '事业', '01', 9368, '074001', NULL, 7463, '142228198309198518', '杨春龙', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ff9a44189fa3461c9a6109b3cf3391e1', 99, 0, 1494, 50, 30, 3030, 0, 2275, 2730, 1540, 0, 0, 0, 0, 2241, 0, 0, '太原学院', '事业', '01', 11248, '074001', NULL, 9007, '140102198102276522', '张琰', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ffa901d9b2af4b209cbea65467df1d8a', 99, 0, 1680, 0, 30, 3030, 0, 3516, 2730, 1540, 0, 0, 0, 0, 2520, 0, 0, '太原学院', '事业', '01', 12625, '074001', NULL, 10105, '140102196803175127', '张晋华', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ffc1db68b18a44e3b3efe954c7db2853', 79, 0, 1255, 0, 30, 2200, 0, 1696, 2590, 1292, 0, 0, 0, 0, 1883, 0, 0, '太原学院', '事业', '01', 9142, '074001', NULL, 7259, '411402198607064042', '刘俊庆', '6805a8cf06064387828e97acab641085');
INSERT INTO `salaryyingfa` VALUES ('ffff4fb5f4f94cf9be47324eeff18352', 74, 0, 1091, 0, 30, 1925, 0, 1005, 2520, 1215, 0, 0, 0, 0, 1637, 0, 0, '太原学院', '事业', '01', 7860, '074001', NULL, 6223, '140524199602133020', '宋月宇', '6805a8cf06064387828e97acab641085');

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
) ENGINE = InnoDB AUTO_INCREMENT = 492 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1237 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '00411a1b792540f7b1cd4b36feacd23f', '17635396080', '2021206027', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2021206027', '14262919910207107X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '007d65a3cd1d4c7c96813e55a63d78f3', '15386885797', '2003011001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2003011001', '142431198003246029');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '008dbd744fa048aaaffc9f794825a5ea', '18035168691', '2025513001', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025513001', '140106199109230025');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '00c91518e2314f86b7f62dd1a9bf18ab', '15233598153', '2024502003', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2024502003', '14260319960923302X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '00f6dd444f174d83a50b42345d12947f', '17836201863', '2023501003', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2023501003', '140322199503214227');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '028c9f55247e4f59b6d9c71a1d8405bd', '13620610586', '2004010010', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2004010010', '21032319800421226X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '02906ab72ce947c0a619b4e00ca50cf2', '13835181109', '200406171', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '200406171', '140502197602013080');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '02a7364efeb14a2d99397edbde5dee57', '17836048398', '2023504007', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2023504007', '140721199109070080');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '02e54be8332a46609b8118d102b09f93', '18636908111', '2003016419', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2003016419', '142321197902160023');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0366f93a041d42d88a1bf6ab37ff7035', '15901026171', '2022504004', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2022504004', '140603199101111046');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '03aac4cd6d3b4ab39726a8c59975963a', '13703515181', '1990016526', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1990016526', '140105196911275036');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '03b0383d4b43488893aae04fb72a504c', '13643602017', '2012040013', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2012040013', '142429197905012831');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '03fdcfc45f674099a7b008e36dcb53d4', '17808043239', '2021504002', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021504002', '140110199302112017');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '041df35b23614050a37e9f7bdf1ed61f', '13203415763', '2008050005', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2008050005', '140106198512132543');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '04517822f28246d99535299f7821857c', '18834139488', '2023505006', '', 1, 0, 0, '2026-01-29 01:31:05.226645', NULL, '2023505006', '140121199406302586');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '04588b6a814d4c55bd4c88cb207156cd', '13513629795', '2011050015', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2011050015', '142228198605270027');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0473a71da5e34ad8b6139190b57b65b8', '18703418009', '2011050021', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2011050021', '142601198609262843');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '04bcdbba22f04d7da08d2ba2f776a17d', '18613513012', '2012050012', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2012050012', '370832198509062314');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '04d0892797bd4c62b6a9300b9b31a943', '13753120378', '2014209003', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2014209003', '142726197503163052');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '04e0a7cdf9ff4cc2ade878875a395b19', '17836034849', '2022206012', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2022206012', '140110199701172041');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '04f90a5e310145cf927a5cc00c4044f8', '13935136832', '2003010010', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2003010010', '140107197903053916');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '052346e3b12e4f35a370fbc79c1242a1', '15386885887', '2011011228', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2011011228', '14010619870722128X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0555ec1e7b594ab8beade99768f96d22', '13903466160', '2007011206', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2007011206', '140107198401041223');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '05c0a0862bf04928a6e6595ac6961598', '13754828885', '1989016205', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1989016205', '140102196609231914');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '063c1352ddaf4b99a47f852f1c2ecc58', '13934617801', '2006016030', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2006016030', '142331198112250523');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '06bb97a154204794bfd080c1c00d553e', '15003511097', '2011050002', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2011050002', '142402198409224522');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '06ed14adde544468a91b7af8f0e35f35', '18636627819', '2014401003', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2014401003', '14011219670819041X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '07dc3e800ffb4201820eb12d655cd349', '13593187036', '2001011032', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2001011032', '142333197808130026');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '083ecea7a6dc4891b474c14fab86164a', '13327470167', '2013050022', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2013050022', '142623198501213036');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0863ee4e2cc5488490e4e3c244dbed80', '13453453111', '2021203001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2021203001', '142231197904040102');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '087a1a83fd8c4137af326f5aa9c920be', '18734821206', '2008016321', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2008016321', '142202197609020764');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '08a4fdae06f24ce195c12ee8303dceed', '15536967788', '2006040004', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2006040004', '140106198109201924');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '08b2e3600dcb441db174f6d8a3378c7e', '13513619817', '1994010009', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '1994010009', '140202197204204029');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '08d0662b21084f1aa0513f49b88b0d86', '18635844318', '2019070003', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2019070003', '142301199506130061');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '08d7a6caf45648f6b83fe2a7d5a76b4e', '13485322228', '2009016438', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2009016438', '140106198507121823');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '08dd484eb64f4e0d87fe9b8b72570fc3', '18234100777', '2006040006', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2006040006', '140102198106232332');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '08e92b5ed9d041d6888e9af0cd659f82', '18603418668', '1997016412', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '1997016412', '140112197409121726');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '092cc2f644b04b88832f0339380ec45b', '15035698855', '2008016624', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2008016624', '140107198411120662');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '09584ea5ce4b42368ba5fc6a2094d3f9', '13509739595', '2007011301', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2007011301', '140104198109033710');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '096b6218dc73405da88a7bb166b28814', '13233669628', '2008016021', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2008016021', '14233019851228622X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0998b3eb091c4534bd43f74a9c96c03d', '13803462204', '1999046000', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1999046000', '140103197409075727');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '09c1a7c1144a4094aa90c557aa1931b3', '13903514729', '1991020700', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1991020700', '140104196905310011');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '09d51f3ad4954577b6944a661667ddfd', '18035101310', '2021206035', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2021206035', '140108199410063222');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0a0da3eee2bc44d7b48a88ab3ab96fb4', '13834549940', '1998010003', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '1998010003', '142401197602057219');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0a1b5f5676d14329b930dd5ef4e13f69', '18235190893', '2025515001', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025515001', '140109199611122547');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0a57ac1a2d214ad798723c0c7bcca5fd', '18635123777', '2003016619', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2003016619', '140102197912225191');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0a85ad2799c7464d83677eaa6ef4f7fd', '18735118241', '2020115002', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2020115002', '140121197302178040');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0b715e045d364789ade6bb3490d66274', '13934216675', '2007010003', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2007010003', '140104197310110322');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0b893e83aa5c4388b550fc550d846ef6', '13935156462', '2000050001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2000050001', '142225197601200028');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0b89e0866b9846a1b62ec39726598933', '13513634657', '2021504008', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021504008', '142401198108204222');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0b8e67f19dcf4ce88095dc86d99e8c09', '13834248435', '2003011003', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2003011003', '142323197909190244');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0c2599dde5a4417b8b5c5c6969820444', '15135111850', '2022112003', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2022112003', '140522199011079760');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0c623c337f1a44509b26c5fa447280bb', '13623618477', '2003011002', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2003011002', '140511198209292360');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0cb422f539bb4c0dbc13c9306faf1994', '13753143104', '2003016517', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2003016517', '140102198003033410');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0d18fb0e03d1467198b256187d563995', '15536834199', '2004040001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2004040001', '140103198003231229');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0d298327a47a432f8edaca02c1cb43ae', '15903419655', '1993016207', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1993016207', '140102196902245151');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0d32385d828c44a18ef29d83af6a9a71', '13453180365', '2010050005', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2010050005', '140109198303291520');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0d330a94d6b94ddf8e807c6fc48837f5', '13027019888', '2004040128', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2004040128', '14010719860320481X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0d6b2996450f43408ca85128a05c74e0', '13935132806', '1994010003', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1994010003', '14220119711104456X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0da1e19f29da4b47a94428f6e9a0845c', '15110300128', '2010040148', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2010040148', '140108198501284819');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0e02502bdf73410995004a4ad4dd7e36', '15834157303', '2005011018', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2005011018', '142729198008171243');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0e2ecc290ee44e6da879c78a9dc5fbf4', '18636651260', '2006016317', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2006016317', '130406198211140368');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0e2fe2cac4094821b8445262ed53b8bd', '13934148636', '2010050002', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2010050002', '142726198402283922');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0e5353d8769e45b0aafcd3be32b498a4', '15735122888', '2019090016', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2019090016', '141102199312070122');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0e7c4c1653d84b8abfd8254095425355', '13934534584', '1998046002', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1998046002', '140122197805040015');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0e8d0c22d46942afaf85dd2a02ba0a15', '18235132481', '2021206029', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2021206029', '140522199302051039');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0e9c079c669e496e952cd67503228a35', '18134955792', '1991056002', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1991056002', '142223196712246718');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0f1895ba4ed44d6e992662a036adbf77', '13903462460', '2011050019', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2011050019', '140108198709041920');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0f3601f1b557437cac9c894b073b7180', '13934565346', '2003040159', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2003040159', '140411197809113629');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0f535f7617f44b73906d2f9c774cec2f', '18226602616', '2024505001', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2024505001', '140203199507201234');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '0f62f38864fb4da78b6ee04e747fe79f', '13934520822', '1997016614', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1997016614', '14010219731220061X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '102e3752c0dd45c6b39463a63e9f1892', '15536335299', '2024505005', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2024505005', '140109199401120017');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '103524b75ddf410e896b96d8c5ef65cf', '15386885663', '2004040119', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2004040119', '140302198010170828');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1054d9191cca42a48bc36ba17ea8622f', '13994238916', '2012016101', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2012016101', '140105198102120041');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '106f558fda194b2c84014da1a60eda7a', '13613411042', '2001010004', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2001010004', '412824197609063533');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '106f572730b441398f106fec1c25cc5c', '15333615439', '2021206036', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2021206036', '140603198909175726');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '10a016d1dfea4b70b3dcd5a33750443b', '13935109157', '2012050019', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2012050019', '430482198308250026');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '10bd236dd6454300937eaad3caacfb76', '18603458881', '2005016027', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2005016027', '14011019811027106X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '110205a3aae64260b37242c508660e63', '13593187751', '2005050001', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2005050001', '140107198301071724');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1133ed9f5fbf46d7a55152cc305e6237', '18334793683', '2025206002', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025206002', '142727199408295028');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '119f90ad9e2e4c10a3799bba354f6b0d', '15525437817', '2023505005', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2023505005', '142402199707016646');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '11a5e1c3de1740c394db1309ae259acf', '13653661171', '2003010003', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2003010003', '130622198012072420');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '11d43c20e5f347df95778550725c926f', '13633459888', '2012016751', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2012016751', '140108197311071981');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '11e3c2ccef094ec0b727b1c41c8142c8', '13546351983', '2004010008', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2004010008', '130402198103181538');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '11ef12b65b404092a22bc701d959210e', '15034126836', '2000016033', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2000016033', '142625197602224621');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '11f91d83926c405cad731c762ec94a90', '18035173938', '2020181029', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2020181029', '140202199507011522');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1202656a76f543cfa94ac031b9f50030', '13834134611', '2012016752', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2012016752', '140104197310161760');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1228936b369d43a9a14f3168a6e1bdbb', '13811671130', '2021510001', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2021510001', '421002198112051469');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '123096ba879c40d1bcceb0a6a5d98702', '19903511557', '1989016144', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '1989016144', '140102197104234022');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1231689e8e8949738c106a152c3717f3', '13311283361', '2024210001', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2024210001', '140429198903252017');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1252d1f0cf2f490eb3f93fc02d54e52d', '19135512928', '2021206038', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2021206038', '140429199301034826');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '12bec850e2b341d99e6ed19ac88e695b', '13038080561', '2007016324', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2007016324', '140106198409170015');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '12c23a07623746baafcb7964735128fa', '13633478177', '2006016736', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2006016736', '142636198308270022');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '12d4f0cb4161413c908ec8cdeb527dfa', '15934146777', '2006016427', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2006016427', '140107198212270641');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '12d5a402745a4d5b83c37997f54232b4', '13603519000', '2012016629', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2012016629', '140107198809294523');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '132efa4db19f478388b81fe94e28ae8e', '13803454855', '2006016018', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2006016018', '140103198008125425');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '134021c2e5224f16a5d01207e780bd90', '13513620824', '2011050011', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2011050011', '140105198301060037');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1397a543f84740ad9f0c2f3ab46ddb9e', '18234167787', '2021206011', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021206011', '142725199511040063');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '13ebb4d250584d01b0815f5f54d39005', '19834006251', '2019060003', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2019060003', '140427199405118095');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '13ef4e0278ed4fbebab0eef9d933fe5c', '17735613104', '2020114001', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2020114001', '140621199103086123');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '13f1ed84b7144eeaae1265f4b903a62f', '15536850973', '2010010008', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2010010008', '142431197602170025');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '13f20b886d724239bfe0e086facf108d', '13100000877', '2007011020', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2007011020', '140107198202034522');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1427545621ae426da1693f5683322af3', '17835131313', '2021206041', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2021206041', '140105198302010066');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '145a077afa8c474e81c5226853691e02', '15536303023', '2018010902', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2018010902', '140109199308033023');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1463932f05614a5bb9f4aa78dba2175f', '18603445716', '1995020003', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '1995020003', '140104197404051327');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '14862c330d384f38b28b28a275998e96', '13834153118', '2005016020', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2005016020', '140181198101044741');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '149e7b0594a7427bbcd36a5ff88494e5', '18636430200', '2023506001', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2023506001', '141182198807130083');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '14ba2d27fc9c4a9887bdb6712f8fa66e', '13934206508', '2014020021', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2014020021', '140109198603033021');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '14c0bc307a974e88a53746d2d5727ec4', '13803431822', '2003046901', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2003046901', '140102196604132335');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '14c45b4b0d8542e6ad19e3e810eb4a9c', '15383415233', '1992016622', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '1992016622', '140106197201311814');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '14d4b59b5d594acf948d938fd8e23ceb', '13015377705', '1985016505', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '1985016505', '140102196701162317');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '15385d1b561c49e48b0e48e7a308c51e', '15386885919', '2005011034', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2005011034', '140103198202184840');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '155f231b9faf41db8bb61724e94b3cee', '15386885708', '2002011020', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2002011020', '140103197602150645');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '170d41577a4e4035b79831f3db4ffe57', '13754818048', '2002011243', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2002011243', '140624197803201022');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '17c047ae518843ddac2fea76635d7bb2', '18636888591', '2011050003', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2011050003', '140106198511121236');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '17d934f1d5c747b4b393470a08a2c34f', '18835590483', '2024504002', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2024504002', '220721199212152017');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '17daa324a3234eb4b5c2a585b36aee0d', '15603402353', '2021206005', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021206005', '142202199512144567');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '184c7aa7a0fd4e4e87a3286e2f72eef5', '15145331783', '2021508001', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2021508001', '220105198402111243');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '189e2c6ebfae48e6866c2a09c173b062', '15203515698', '2005016039', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2005016039', '142726198205260027');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '18a1555aa4734dd7bc1fa731b304cd1e', '13934639092', '2003010006', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2003010006', '140103197307200611');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '196b6d351cdc40259382aa734423b1b2', '13121369977', '2021506002', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2021506002', '140624199209221521');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '19856990122f4a8a82922ff5ad2366a3', '15834185666', '1997016530', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1997016530', '140102197602031412');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1a20724cf000481183a76a7330bd6add', '13935170468', '2005066002', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2005066002', '142724198308210011');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1a2566eaf95c407bb85df954b6c006e7', '18139790802', '2025531001', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025531001', '140225198803292218');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1a46c2d2b3504f21a807d32e1cce5999', '15386885679', '1995011126', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1995011126', '140102197109084828');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1a84f5ab842942408316a811e21a3251', '13466809246', '2006016136', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2006016136', '140102197912204024');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1a955efec000438ba386be64a5981f44', '18735368267', '2013050024', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2013050024', '14270219870202274X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1abb3a38a5b44afc9e374100c5d51b5c', '15386885768', '2003011004', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2003011004', '142429198112043827');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1ace8d5d8d144c0e84408dfab1f54bba', '15318669938', '2024505004', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2024505004', '370612199503050038');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1b0dc944de1345b99992b31de50a3d44', '18536357211', '2022511002', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2022511002', '142326198410042123');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1c26b0da41f44a1b80d98087a37cc7e0', '13068073691', '2009016052', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2009016052', '210782198204173420');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1c2a1969cd1b41aa86c5f21cd2dba9d3', '18835196633', '2001016729', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2001016729', '142321197603155013');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1cbff73a2cfc46e0b7ff4be19168fa91', '13623519098', '2003016300', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2003016300', '140121198112195514');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1d205ceca6714178953f593282302ba2', '13403452988', '2020114002', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2020114002', '140105199207071842');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1d236423b6bb4639b4c8df436f9a1aed', '13994219516', '2005010001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2005010001', '140103198205130653');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1d5b9ec65e7747a3a8aa5556a6ceec78', '13753150098', '2000056015', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2000056015', '140104198207070013');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1d65ae1e293643be95e6c45b6505c436', '13754842650', '2021206015', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021206015', '140107199206202612');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1d9dc79ca30c47ccaebb7f4309a1fbc7', '18636646072', '2012040015', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2012040015', '140624198605020524');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1dbad2ab29d9407387dbc66e17c1a35c', '18903510217', '2022509001', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2022509001', '142402198202030018');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1dc1aad874974da0ad031dce57307358', '13546413506', '2005016715', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2005016715', '140113198007122321');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1e49be1230b941b195ff12436d16c1f2', '13623657119', '2005016029', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2005016029', '140302198111050024');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1ec8ff19df76438a94fc8f3832e7aba8', '13623519099', '1996016523', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1996016523', '14011219770818281X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1f44cbc3f6b84584a9645d387d5d8e73', '13934636210', '2008011226', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2008011226', '140104198207011734');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1f8624c1581f4e4084c3894c6967b60f', '13934221759', '1997040001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1997040001', '140102197308202030');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1f871b58f3154b3f9844248616d756aa', '13513626663', '2004046016', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2004046016', '140107198506113641');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1fa835b3c1fd4d2a84659885b9916fef', '18903409236', '2006016731', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2006016731', '142223197712306113');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1fee456ac6494c968b18e0d26136946d', '18635590396', '2002011033', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2002011033', '142424197705276515');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '1ff17caef8c3404790d7525c4091b185', '13513632345', '2001020001', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2001020001', '140102197608312346');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '20406a9a1fa74dc0a0686c10632c3a9e', '18634400900', '2013050026', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2013050026', '140511198710172389');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '20529d8fc88e4d739f560dd9502ed3dd', '15035698822', '2001016011', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2001016011', '142623197811044325');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '209a8f6a4bc04f51b2d5f6ff9c4f07b9', '15103511352', '2020181012', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2020181012', '140431199405303623');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '20ab8ff341974bb7b1fc18a59dd16be6', '18235126390', '2012040006', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2012040006', '140106198507243011');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '20b359184c3d481aa86fcc1cd1ee852d', '13546436341', '2003016124', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2003016124', '142123197811060520');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '20d7ed71abe3403fbc383712e429c2f4', '18635113311', '2002011295', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2002011295', '140103198008044828');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '20f01abca1374ba7bc5f85201843378d', '13593174827', '2012050002', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2012050002', '142431198610127523');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '212f9123e25a4b7187e38eec02c5ce2d', '15234075145', '2012050006', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2012050006', '142322198612220586');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2149585dd36749aea56bc7b7c31167d6', '13903511912', '1984040002', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '1984040002', '140102196607170636');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '21c51b8c322947619df9f177766c96fd', '13643662696', '2003016421', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2003016421', '140102197910035167');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '21db63cdc5084606b30781913525539b', '18636288221', '2023502007', '', 1, 0, 0, '2026-01-29 01:31:05.226645', NULL, '2023502007', '142429199809122829');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2207d4c40e6d463cbd252a8a56a8a68e', '18903408610', '2007011008', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2007011008', '14010219820125402X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '220a75597f6d434b9cea13fe697465eb', '18636802857', '2012016440', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2012016440', '14010719890205222X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2324ae417417494f916de0a540118fbf', '15035688227', '2016010004', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2016010004', '140106199001223069');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '23331a620661427697f12cbc27bff804', '13603569595', '2007016919', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2007016919', '140106198505021845');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2369f56acbc34b5ba9f8277129eb2a89', '13834645727', '2002011028', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2002011028', '142429197907130014');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '23a2f786ec3d4b3b940e7a6fb343fd1a', '13603553900', '2006011009', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2006011009', '142629197712231027');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '23d5ad9d7cea4a478391ea234554ba40', '13834661842', '2007011286', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2007011286', '14010719850328172X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '247e6c0dc371424f8de51a3003fd6f3d', '13835187968', '2008011005', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2008011005', '140122197910070021');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2510566014f4435db6cce06572fa9744', '13834577936', '1989016706', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1989016706', '140102196605134842');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '252783f3ce4741199af29760c6820c51', '13653407619', '2025206001', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025206001', '14010719911012172X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2536fd7e41b549e7814b8d805e5c3040', '13623677407', '2009016625', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2009016625', '430682198210071063');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '253ff92848b54b959efcf3ff17be11b1', '17635499193', '2023502004', '', 1, 0, 0, '2026-01-29 01:31:05.226645', NULL, '2023502004', '142327199403161715');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '25a9ce82975247ac95eb22f703ed68bc', '13503502462', '1994016407', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '1994016407', '140102197104015110');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '25c1382d953844fd94d95652b7347e14', '13834507109', '2012016855', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2012016855', '140104197402281735');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '26c5520d0aa647eca1ab9f92b6ad6523', '18635595381', '2009016439', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2009016439', '140107198505281723');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '27063c713c2b415e9352b7fd70df49c8', '18100347180', '2018120018', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2018120018', '140423199404120024');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '27c1a49c191748f49ddf7daaa2aff14b', '13754851446', '2006016048', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2006016048', '140107198407061268');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '280fa40955dc4177a2d1a12fd9ef81e3', '18035109939', '1991016508', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '1991016508', '140102197002084035');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2820701ad8c247e3b1b696b7e13debbc', '18633168508', '2025112001', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025112001', '230421198312162627');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '284a0a621ef94db28189f98ad5e464e0', '13191054629', '1994016210', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1994016210', '142602197110281027');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '286a37d17db643cb9f38844b8059b905', '13754897380', '2007010007', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2007010007', '140102198102276522');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2876c4882dec4af2a403449b003b5aa5', '18735109980', '2000010004', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2000010004', '140103197411080672');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '28a9f31cad084f70908b7ad3b37a9158', '15135081659', '2014010011', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2014010011', '140107198511090042');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '28c631a4683b4e0c93ca16a5c31d8223', '13935187654', '2020181021', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2020181021', '14010819930825193X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '28c79623600f4e438e93e458239a542a', '13935190519', '2005011256', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2005011256', '140311198006140622');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2928a5e18cca4fe398e85661e2615255', '18610608144', '2022112001', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2022112001', '140107198210191739');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2a0c0c95f0504357a0e5f2b44da99e3c', '18103514616', '2013016138', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2013016138', '140121198309307225');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2a32a9b872334193a5f2c31e2c32a443', '15034039736', '2006016718', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2006016718', '142228197807110019');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2a42852b9f384089bc9518e153592585', '15536301230', '2011016700', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2011016700', '142703197811053328');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2a7ec958b25d4e8a8e3b43ffa74925e7', '13934582258', '2001011027', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2001011027', '140102197603052362');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2a99480f5d72432faa963ab333d8b845', '13834800995', '2021209001', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2021209001', '142401196808130325');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2a9d5d12197b4a5491f6b55cb15b0701', '13934556575', '2005020003', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2005020003', '140321197805010056');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2b0b2a0750704b7f8bc5b973ba9ff27f', '15035132146', '1998011012', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1998011012', '142622198212307515');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2b1287335b8b480a94ac20ec19925cdf', '13835118989', '2017040002', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2017040002', '510102196610276123');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2b4262ae5e604200b62115062c3456ca', '15386885819', '2002011249', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2002011249', '140624197611204026');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2c0f7ab391e94c1e86abc59991716c87', '18334718910', '2009016742', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2009016742', '142401198310160921');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2c106668e9a34e0891ce6f8e5b813022', '13934138060', '2010050006', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2010050006', '140104198101112211');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2c4f65fc634340c9966c53d049421050', '15834170692', '2013050028', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2013050028', '150421198810211815');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2c512c2272c24931888d04796f3927bd', '13935100824', '2005016031', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2005016031', '140105198201180023');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2ce2b137a774498e85b6ca0d80ce5c72', '15333511801', '2004020008', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2004020008', '142323198104271025');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2ce9ac8c5dcd44f0aeb28064c00b3b3c', '18734822669', '1993016411', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '1993016411', '140103197309204261');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2cf6275b0ea443a7846e875fbf2eefc7', '13903466722', '2005020005', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2005020005', '140102196601091216');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2d661ed9c32b4b579b4fa388a4f84602', '19835115039', '2022206023', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2022206023', '140105199703210047');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2d7056525b6740a5b7c0bacdb114ab16', '15834140610', '2000016713', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2000016713', '142702197604243018');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2d7096bd33e94ec59750922ffb616c58', '18235139505', '2021502001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021502001', '14270219920929552X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2dc31ebb18c44c71b8931268a55d5996', '15296619363', '2002011002', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2002011002', '140103197802274212');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2df59b31d930434c81da4f0d4ee5d72a', '13934213619', '2002016123', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2002016123', '142223197809182735');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2dfc655917c74cb38565f418ab973baa', '13623665498', '2012050009', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2012050009', '142703198511170367');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2e1596e9fbcb4eb5bae69a5f0b444a18', '15135090273', '2012010001', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2012010001', '14263319860111226X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2e26cbde8fff4f82a0fc54cc79c1605a', '18334727130', '2022515003', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2022515003', '140202199202295018');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2e41ac1761504afa818d19fce3fcc387', '13834606836', '2009056012', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2009056012', '140107198307222626');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2e5ce13721314e6e853bfc6ebd61766e', '13513632565', '2007016217', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2007016217', '140623198108077013');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2e6949a0b9714721b1e171f2638eb3f0', '15536577737', '2008056013', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2008056013', '140108198208252527');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2e701f18f09b45dd97c57b8c6f8e5ca7', '13333516087', '2014216002', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2014216002', '140103197505181239');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2ede6232c6e3449890e99f31ca262400', '17636152049', '2023504004', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2023504004', '14112819930526001X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2f0da63fe3b442dda722d7f1b62026c4', '13403406904', '2007010010', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2007010010', '14010219810904402X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2f21296c442745a388942a56b1cc7dba', '18634437687', '2004010005', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2004010005', '142202198010040966');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2f50c04396434a039bff8772a97a0815', '18635588886', '2003016420', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2003016420', '14010219790304652X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2f906415b103410bafb74383da0e51c8', '18613517733', '2011050004', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2011050004', '140108198206043211');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '2feb562021fe42b8b4abd351d25b1553', '18335152254', '2021206026', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021206026', '142629199207182518');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3003ffd231ba46dfa8b927a8b0464233', '13994275032', '2000010003', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2000010003', '140121197708078023');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3034d1d4f3934be59ea7d16f0493cfac', '19935145689', '1993011149', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1993011149', '142325197105030010');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '30a563d41425447d917af6e77c45fbf7', '18943036771', '2023504006', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2023504006', '150421199211051228');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '30c2f72b7a1c4d689a5013e1a90d044a', '18612416563', '2020108001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2020108001', '522101198603070422');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '30fb75a900964f9499a23862d8183176', '15903460381', '2023511002', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2023511002', '142226199202252221');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '310a0125736d45708bdb3ff83b364fd9', '15303511111', '1997046001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1997046001', '140121197803165512');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3160e51c9f7e48809959183a319bc04a', '13753121571', '2006010001', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2006010001', '142725198212090015');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3201cb21de61442d9f8f68c4637f082c', '13653603471', '2014010018', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2014010018', '140181198408240210');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '32d3977d04e54a0597a85da4413d312c', '15386885745', '2009011004', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2009011004', '140107198302120663');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3330855e73774d9299e6b11edf198d58', '19800328783', '2021206012', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2021206012', '140224199512159343');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '336a2dc4d9de4f35ad8e7b47a83c4360', '15903512826', '2022506001', '', 1, 0, 0, '2026-01-29 01:31:05.226645', NULL, '2022506001', '140105199408070029');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '33af31ccc3014f9b9035accc3eb94b02', '13633440090', '2009016468', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2009016468', '140106198809113028');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '33b987a995b7411ca179df21eaa65b89', '18734836682', '2000016212', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2000016212', '142424197609202321');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3406d46c6e7b464999b72e7f32b804ce', '13603539096', '2004010013', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2004010013', '140103198110251524');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '343344ef64d74722991ee28da7441940', '18335106816', '2020181002', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2020181002', '140202199001072520');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '348d04a2dd584c00a3b63d28a4095ff7', '13834162989', '2008011252', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2008011252', '140108198411144222');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '34d79cf0402645dfb9013d61c93718ff', '15235131380', '2018120040', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2018120040', '142301199204240046');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '350e35c624e4460ba8915ddcc046c2d1', '18003510054', '2018120046', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2018120046', '14060219860705851X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '35102bd2714d43bfae1aa8b62bf6827b', '15525099267', '1995056011', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1995056011', '140104197203092245');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '351fb5e47c434b47b5086418d64548c4', '19834525433', '2018010901', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2018010901', '142402199307030625');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3532adc74625470f8218688ce2b5c3b3', '13834614411', '2014010004', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2014010004', '142601198605089713');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '356bdd254fe44ba59fb7cae1a2df7bfd', '13503511922', '2004046004', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2004046004', '140121198301197228');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '35770bb946ef4caab7806390fc3002c0', '13103510660', '2007046016', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2007046016', '14040219840908322X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3595de41e50e43c0a5c6aedd00dda392', '13546306271', '2005066000', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2005066000', '140102197508045164');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '35b46f6024254485b3519edd0bd41d92', '13403403521', '2002010005', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2002010005', '410184197910162561');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '35ec013e63d14da09fe5c762042cab8b', '15503630005', '2018121103', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2018121103', '140106199008131212');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '364baa243b574e3d8f10640509b9d1b4', '18035560000', '2020181014', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2020181014', '140424199006294842');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '365d9904d5654fd388e818c2251127b3', '18821776356', '2023501002', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2023501002', '142429199706282125');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3673322069a34888890a4b2439b85e0a', '17200611122', '2023113002', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2023113002', '142328199508200019');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '36d4f6afe98e420db691ae68be501185', '17824830351', '2020181003', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2020181003', '140429199504015625');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '37a4c58d9e27415e84ab2a378f7305ee', '18636663525', '2008050003', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2008050003', '142201198405250742');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '37b3d42a94e44ea2888c009d9786c1e0', '13620617544', '2005011028', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2005011028', '140107198207233926');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '37b83049e09b4e7484850e60f62c5ed2', '13700507259', '1992056003', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1992056003', '140105196610193731');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '37bd79f996584851a666a9984997b18e', '15871713747', '2020104001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2020104001', '140430198410060047');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '37c1abbd12784688a530418af6da0f3e', '13834243394', '2006016135', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2006016135', '140102197909165124');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '37cb7980059a41d1b5d131121cd5fee1', '13466808154', '2009011254', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2009011254', '142401198409081422');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '39350b68b09e4e33a8b38226c6db6e2d', '13613464134', '2007016430', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2007016430', '142429198507130028');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '39582ef7e2274e5a84fcb19c3d2bffe0', '17801196233', '2025514001', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025514001', '142225199304251020');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '396de62cfba84557aba676c4aa32ec70', '15835136118', '2003016147', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2003016147', '142601197906084014');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '397432f44b4242068030a5ccd17f5dcc', '18149490901', '2023504002', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2023504002', '140481199303083213');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '39ad8a0f5be8423dbbed66f56ba58506', '13834141605', '2004011015', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2004011015', '142726198206260029');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '39b63a39e99d482caa1efcaa3b9ee04f', '13015387936', '1989010002', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '1989010002', '140103196612151313');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '39d51d155ce94cffb3850badb7aa69c9', '18834118059', '2020114003', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2020114003', '142623199408194322');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3a0dd46911d94796a2f0eb2d9f2edf2c', '13663611340', '2007016044', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2007016044', '140102198212190658');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3ab05bd3bc014722990daceeb112e9aa', '15534030873', '2012050007', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2012050007', '140622198612190019');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3ab127ecc7724761b868283ebe608a6d', '15386885767', '2005011002', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2005011002', '140102198207313414');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3b430d4960d54a58928697545c0aa400', '18835174160', '2022505001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2022505001', '140624198208170115');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3b5d04c9cfe04c6bba8fc1ad134d367a', '17836048393', '2022504003', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2022504003', '142326199303042720');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3bda735c0d944c7c98343b7ebd75d7de', '18635100766', '1997016119', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1997016119', '140102197407051426');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3be7de39352e472d9d59498eadde0dd0', '13834565580', '1993016709', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1993016709', '142701197005151262');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3bf821ce656b4df0bb83b9a2aec0089f', '18603457939', '1995016132', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1995016132', '142622197411162027');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3ca1bf760835497ca47b96316b67d337', '18139608225', '2022206011', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2022206011', '142201199508229027');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3ce0caab7da04cc58a5d55b532a04b00', '15534469729', '2013050025', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2013050025', '140109198511290020');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3ce8a6a3a5b742ed88056d18a3e8f290', '15536800880', '1994010008', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '1994010008', '140102197009174842');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3d448ec70d2c4000909100af7368173a', '18834878461', '2023210003', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2023210003', '652926200004151714');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3d9e4099ed8f4d59bfca2ef9cc7e147a', '13546479204', '2006016901', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2006016901', '140103198211104822');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3da0b0ed9dfb477480e328b040193a33', '15234150718', '2025516001', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025516001', '142603199307182028');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3decfc802648468dbb32e09f3a175657', '13546364602', '2008016623', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2008016623', '130124198401014529');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3e76cc1e5f4343a8885ffb55dd2f12e1', '13513513518', '2004010007', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2004010007', '140104198107255029');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3e7cca866cc34f5aac3bd2988ac2c804', '13834653853', '2007010004', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2007010004', '142202197511200337');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3ea5bc01adca4773ba89918df73226ee', '15935130001', '2009011307', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2009011307', '140106198406221841');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3edbc78cb89b4970a5cd3cf0ec6d65e7', '13293718096', '2012010005', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2012010005', '140102196801223420');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3f2d6b98270b4b32aa8348ea4ec1d8b8', '15803468601', '2003010004', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2003010004', '140103198004050614');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3f3efe425db9439494234c61fabf2233', '13653605187', '2014020013', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2014020013', '14260119890820132X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3fa15312cd4d49a7b85dfe34569ed87e', '13834221344', '2000010188', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2000010188', '140104197606190333');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3fba96450db94851b923f42f10a9c5e4', '18335451939', '2023502003', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2023502003', '140411199403040457');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3fd76ae574a34c0daa037b74919ede7b', '15035167661', '2012056001', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2012056001', '430922198305160042');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '3ff3be4b25044a79b7975574a3848d09', '13503514123', '1993016512', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '1993016512', '140102197211290038');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '40572ca149254af8a4e49b0e6222e4cd', '15513087252', '2014121001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2014121001', '140104197210292712');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '40b18cf27aa841209847d9f9c84c7f5f', '13934247982', '1999016023', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '1999016023', '140102198106106520');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '40ba5cd3918a408f90c1c46d3fea8570', '13007077121', '1995010004', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '1995010004', '140102197107212021');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '40cf4fca57834605ae7bae7d5de3bdd0', '18616831993', '2021509002', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2021509002', '14020319900812561X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '411f43bc4a344a81a09c06d6934a13ff', '13934666120', '2009011021', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2009011021', '140109198609095127');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '414e061f3f8a41308c8d88daae6caeec', '13700500961', '2003016024', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2003016024', '140511198107181918');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '415739785c22405d92ce0d33d01c0ef6', '13935165816', '1998050001', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '1998050001', '140104196708251323');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '416dba08fb064c4198923f8c91913e1c', '15234101681', '2016041000', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2016041000', '14022119860116006X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '41cd08d43e8c4ab6a18e623930fefc77', '13485339879', '2013010002', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2013010002', '140105196908140819');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '41d5f2a2141940a196831082e815ef14', '15934132049', '2009010001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2009010001', '142701198102183623');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '41dcbc93e61a4c998edf71f3c8720f62', '13835133870', '1986040111', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1986040111', '14010319670211214X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '41e2fcb42dfc4d6ba3dc15de04c28249', '13007091815', '2006040003', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2006040003', '140112197909131277');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4265cde36f634bcf9b73c40d4dd6674c', '13453103327', '2007011253', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2007011253', '140107198403273925');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '42d99d768e5e4473b76d4fe92b303096', '18332059391', '2023502006', '', 1, 0, 0, '2026-01-29 01:31:05.226645', NULL, '2023502006', '130184199901091521');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4308315e6a9e4010b1bce3c3682c7736', '18834191750', '2024508002', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2024508002', '142726199602213325');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4345942346b44b5288874b9ec2535394', '13509710051', '2007050006', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2007050006', '142323197611280167');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '43683cb4f0594084864537223ba92c31', '19834422161', '2018010900', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2018010900', '330424199211280066');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4399a6e661354f0ebbbfe3d1ac500736', '13513644573', '2004020012', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2004020012', '140202198002146013');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '43a31a3a6e01466f961935cacd9fa6d6', '13754818186', '2006010002', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2006010002', '140103197812082441');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '43c6ff68ff8946c1ba0146ca1b7a8c01', '19503411978', '2020181022', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2020181022', '142623199406064049');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4450b370a7f14a87ab94fcbbec112793', '13935131540', '2005020011', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2005020011', '142433198104031652');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4469dd7fcb1d4d2b8439c04110f8c1e8', '13834676694', '2001010007', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2001010007', '142427197802283329');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4482b2bb790d4518a69e31d389744553', '18903518096', '2007016158', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2007016158', '140202198412255589');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '44942c25bfd24de5a171befdd361a34b', '13466839246', '1994016116', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1994016116', '14223319720528002X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '44a953b83e6e4c8683d95943c9bb88f3', '15935118074', '2007016010', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2007016010', '142401197810031443');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '44cb563949c54ae09cac69bffeb15ddf', '15503457844', '2005016034', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2005016034', '140107198202111225');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '44f80eefd16849b3a302e2275b81c33e', '18536826369', '1991010185', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '1991010185', '510102197001208541');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '450bcf5d4baf4cbe918eb224da50e54a', '15536568091', '2016016925', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2016016925', '150204198109270115');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4544a20829f2412bb4793f9769ac9198', '15386995719', '2007011007', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2007011007', '140522198211172324');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4552690fe425479885e13cca812b7bb9', '15296617693', '2013050006', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2013050006', '142603198908181149');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '45909bc0bd474bdd9bbbaae657944779', '15503483709', '2022209001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2022209001', '140423199611060829');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '46cf979f6f9c43b995b4ff32f9aac54f', '15110410808', '2005020006', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2005020006', '140103198206133311');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$ojqIH2xkJZxVkawPnzjanf$LDQjAUWgtFWWpYXRDcuZvbIiMFcXYT3n3+3KIVraBdo=', NULL, '46d6dc2bfdbf4c2abab1195bb9d7031c', '', 'admin', NULL, 1, 1, 1, '2025-11-10 12:19:38.247572', NULL, '88888888', '142423198501270611');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '46d91039da634d85bb47ff2125154ed3', '15513870700', '1991016208', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1991016208', '142601197002051922');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '46ff0d90502647faa0607b4f2ea278ae', '15834180653', '2013050003', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2013050003', '142325198606210022');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '471f64307ec4494bbf19f216e7d33d9e', '15735517016', '2023504005', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2023504005', '142228199402154522');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '47e7a599016f42fdb081802552b9fe2d', '19511405729', '2021206010', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021206010', '140322199411280016');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4859038051fa46f6a05f373c3affebbf', '13111096222', '2014209002', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2014209002', '140103197506040657');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '486e5c60d0ff436e9a6d42f7a86dfb5d', '18603458825', '2004010002', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2004010002', '140102198111271440');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '488cf26a2a32422eb7aef6b32ddf37e9', '18503566417', '2023510001', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2023510001', '140525198505186325');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '48bf79868f54452b8c7bfd4eee70a0ed', '13546316281', '2022507001', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2022507001', '140121199112200621');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '48d8d1681afd435e86771bdfa62b6cf2', '13754842566', '2007040168', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2007040168', '140109198503180526');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4940abe4fe7e4958ba176f53ad7b4239', '18735330000', '2023513002', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2023513002', '420116198902094562');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '49427c7c0616487fbb50323d90020bec', '18636112185', '2008010119', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2008010119', '140106198503101841');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4942e313e8b5493fb0b673d478bf05f8', '17703410327', '1997011240', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '1997011240', '140104197402160845');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '49654d0565e84362ad20e2bc6007b85c', '13233663539', '2006020002', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2006020002', '140103197907122725');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '499d0e0c88744df182869a9778606929', '18636168267', '2023505001', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2023505001', '140603198810264913');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '49d78114ce3e4c2da6645db50c01a6c6', '15135100393', '1994016612', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1994016612', '142401196909142413');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4a16ac0edf204638b6584d1c3d89c806', '13994273749', '2001011030', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2001011030', '140103197812070627');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4a28075de4bc4a95b687d6541d0943cd', '17808058283', '2020181025', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2020181025', '140481199502086820');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4a32b1f61aac422eab8d8fbba497ef90', '15513083699', '2023503004', '', 1, 0, 0, '2026-01-29 01:31:05.226645', NULL, '2023503004', '140108199011202811');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4a3bf8a2a0804ac386e71fc27fb3d30c', '18935195785', '2005016038', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2005016038', '140107198205143927');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4a4ae52463964a3eba8ac587e2c2c69c', '13934235456', '2004020006', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2004020006', '140103198202221541');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4a80f93351314e79bcf9cff90f6c07ba', '18634371183', '2006016929', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2006016929', '14010719831113002X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4ab0f1dcdf0d449f98f84a5bb2038406', '13835172650', '2012050030', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2012050030', '140107198206021219');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4b1dd7830de04e5f8f6e7d33109f7632', '13835110882', '2015011006', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2015011006', '140103197806030661');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4b54a6bdc0274e8a85d665c6829bae02', '13834117306', '2001016618', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2001016618', '140103197910300617');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4b6359e480184e4382088a0204ff4178', '13834047080', '1995016308', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1995016308', '140103197503060628');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4bc4cf6cdcbb48df8ce15bf4a561b403', '13453424774', '2008046002', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2008046002', '142423198501270611');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4bd4022110de4766b4454d2a4acb4f3a', '15935122806', '2007016312', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2007016312', '142628197910220023');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4c17dbfff62643b19b4f76937f01edc5', '13934141155', '1993016808', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '1993016808', '14010219700703204X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4c31feb6dfaf45718cd3658c68a13646', '13603583781', '2006016218', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2006016218', '140202198105264514');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4c36eb8fb1bb4128ac53aa90b4f379e7', '13834616186', '2006016156', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2006016156', '140113198010051229');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4c3874cf9a2641b886fee2e5af4631dc', '19928758191', '1998016122', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1998016122', '140102197806146529');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4c73c7110bbb4deabfcc4621ae82a46b', '15364918686', '2012040003', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2012040003', '140202198501182035');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4c7b0d776fce41fb92de54e26cdb1946', '15034425397', '2021206028', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2021206028', '142630199404271013');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4cb8ab5fefe14918836f482fa361fc28', '13293902400', '2006016161', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2006016161', '142222197810020024');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4ceb9a29854a48eab9718920720c0d22', '13934624078', '2014207006', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2014207006', '140102197503276510');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4cf6ce0ce1a946c098960c3c4fea2562', '13835110685', '2012010004', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2012010004', '140102196701114825');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4d2efc32c536400e8d8f0953b3e64471', '15386885762', '2005011010', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2005011010', '140303198209060040');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4d40a9592893412a8fe6f503e4a4089a', '13513515097', '2003020004', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2003020004', '140603198012090525');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4d83c91eece54a76bad53ea219dab62d', '13934592733', '1990016807', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '1990016807', '140103197005150663');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4dc38404e5a64250a1d39fea385c26fb', '13633459179', '2012010003', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2012010003', '140102196604140212');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4ddb6efcf4164403b2e2e9512219c6e9', '18235119493', '1999016811', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '1999016811', '140121197601042514');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4de9f47ef56745348dd42ed0475bde51', '13834133344', '2007016032', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2007016032', '140103198201270640');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4df9a19875a34685b7fbb2ec82931330', '18734130614', '2021503001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021503001', '140581199007153913');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4eea72bcd7204c6ba28decaecfe4f82d', '17735183306', '2014216004', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2014216004', '140110197608072063');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4f84ae4b22f644b0ad764a04dd11a522', '13753162053', '2003010009', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2003010009', '140102197610225161');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4f8ba3166ee14818abbf1d2b3d360c41', '13393519642', '2005016426', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2005016426', '140104198112170847');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '4fecc2ac11c541d4a2c68a7fafb9c5dc', '15386885638', '2004040130', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2004040130', '140521198206023627');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '50178ba45a27444cbcae02b57a0ae3c7', '15386885838', '1997011346', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '1997011346', '140123197910140022');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5036a0dfa06c409694cdd15d3c3856fe', '15135126897', '2014010012', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2014010012', '140321198807170947');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5047f25820dd4da9b2d12a2ed0e220ca', '18613221856', '2024508001', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2024508001', '652826199104140042');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '509f93b5d9024e4eab0944df87239a90', '13834515488', '1996010002', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '1996010002', '142322197303280521');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '50b6d95599dd4ea3925f8e2adfb92d69', '15989248392', '2023511001', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2023511001', '140622198003174718');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '50ce660a7e8e4dc6818f836eff1f8fa1', '18523943712', '2017011200', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2017011200', '220106198603110219');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '50f9f576f6fa4e74ae00e5c75e8f3b10', '13643611622', '2002010009', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2002010009', '14062419780128002X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '514896256be34809b20ce5ad929543b6', '13613449866', '2020110001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2020110001', '140624199309200066');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '514ee7fe0a54440eae059272eb5fc7ba', '18810101030', '2023509001', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2023509001', '14260119870731132X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '515b3d4515e540888a839449f5097a0e', '18636930152', '2013050010', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2013050010', '142625198606053326');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5165455e34a142298c66de2c32ae824f', '15110414238', '2011010001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2011010001', '14260119711129283X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '51f8966e39f34760b441cd090a59cb9b', '13633446303', '2006016138', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2006016138', '140121198403273527');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5215bf361ae2420eb9963f8019573c75', '13934164236', '2005011258', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2005011258', '142232198106240469');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '52581c0119164ae4bf017a0a1f118dcd', '18834713111', '2023113003', '', 1, 0, 0, '2026-01-29 01:31:05.226645', NULL, '2023113003', '142332199605230011');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '52672c989ea84dd7abe19d21fe274d1b', '15210691673', '2022206021', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2022206021', '140106199010091811');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '526e74299dfa41ae83855fe073b90d61', '13934221023', '2000016049', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2000016049', '140103198110030027');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '52f2555523c74774b5e0a80bd879a35e', '18435138107', '2021206033', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021206033', '140402199510220414');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '53aa8407a025432490f02eaaff8422bf', '13935164528', '2005016733', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2005016733', '14010219800406514X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '53ac2ba6d91148c69ffd207a4a2a4a59', '13703518065', '2001016416', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2001016416', '14010319780701062X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '541babfb2ec14013bf6b43af549ef414', '13633449991', '2010046001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2010046001', '140311198212111726');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5457df0b68a441f28cd052ebb49d05d0', '19834000862', '2025517001', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025517001', '140212199612032483');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '547d420fdd7b4977ad376c8488b7a87c', '13068030796', '2022206025', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2022206025', '142401199511171445');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '54abe236b40740e2bec23ff9fa26f3ab', '18636919592', '2013010006', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2013010006', '142729198212241827');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '54ae2c9da6a8437d956b6899d7c2899d', '15386885969', '2008011306', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2008011306', '142303198511140123');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '54def18d60094e1894863b2e2478b92d', '13485374036', '2003016036', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2003016036', '142323198204080226');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '54df21bf46164f30b402a05a4589e066', '19903439135', '2022206008', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2022206008', '140109199803091511');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '553de754e02e47acac1041d008127006', '18334718907', '2009016743', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2009016743', '140102198103125224');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$vfatbt5SaCCOCIephRdQp0$r6CtLdJ9A16uof3GWPA81ScJnOLotu3hHxSwydYuF1I=', NULL, '559091ace958461fa16b24571dfcad18', '13453424774', 'admin123', '117656431@qq.com', 1, 1, 0, '2025-11-15 01:56:18.958545', NULL, '66666666', '142423198501270611');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '55a00d9c77a04f2db765d8078f025d78', '13643612005', '2013050031', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2013050031', '140102197810230627');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '55a1723beb8e4baf838e1c5603e4af87', '15035113518', '2006016220', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2006016220', '142226198209194920');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '55b763737423457ba398f59e54aa37b9', '13613445102', '2021206023', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021206023', '41152819950622002X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '55c54da88ea44d89a5be7907ae2dbf81', '15735186217', '2022206004', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2022206004', '371522199412057216');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '55e17131e02a42dda75031955b485fcb', '15235190910', '2025112002', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025112002', '140106199109100626');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5619ed619316478b9ad4ac4d66421039', '13513619983', '1993011002', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1993011002', '14010219700620492X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '565000060db344af9c971394c3f36850', '17835155391', '2022206024', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2022206024', '140107199408260626');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5692ef3e593940e3b3167d637c8a14c9', '15834074608', '2007016917', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2007016917', '152104198304170626');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '56aa5375138943dcaceb2ca591f8eec3', '13403512201', '2020181023', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2020181023', '140622199302110102');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '571a6486a60a40dcb13386af25fc198b', '18636932961', '2022206026', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2022206026', '140829198803190025');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '57dbee7590c2424f86a6c287e9c8c4a9', '13753171721', '2005016028', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2005016028', '140104198110100028');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '57e4357e5a6647f4bfeb3f1d6da3e610', '15536637575', '2007040114', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2007040114', '140311198511141829');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '580cf870eb43435682ccf138c8789af3', '13934245246', '1985016724', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1985016724', '140102196710024047');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '582c7c8213dd40738bae16d01e057345', '15135166488', '2023502001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2023502001', '142303199004288339');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5852cb8795a044c39da3a5f33d4e3f42', '13994299335', '2004020001', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2004020001', '140103198002271229');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '586e6ba0317a4137a8e714771dec0f91', '15525481403', '2014010003', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2014010003', '14270119881025121X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '589f0e97f9bb40ef912732c9b0dd6759', '17703435286', '19990110006', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '19990110006', '140104197708152223');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '589f6d22d1934ea9ab5cc0ed2df0118f', '15386885668', '2008011004', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2008011004', '140102198112296527');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '589fa1843b444167ad55bb56ff8f7dfc', '13934533111', '2009016627', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2009016627', '140102198211183421');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '58e2c31348634065abaa9e7c537630f3', '13835123589', '2008050007', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2008050007', '14012219770621282X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '59274802d5ec430ba739b1038f7bc58a', '18734534618', '2014010007', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2014010007', '140424198606234822');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5940ba9f09654411a21e9defbb7b895a', '13643616363', '2022203001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2022203001', '140106199511131842');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5949d56f0aa8461c986680ac815c4913', '15935121441', '2006016215', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2006016215', '140102198205276525');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '596e294ab1484ccfb15f749b97dd659b', '13603518894', '2005040140', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2005040140', '140105198405090521');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '59e63c61107a40b0b1c06be00cc1d567', '13613470879', '1999011004', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1999011004', '142222197504200027');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '59fa9a96efde4b46b8191550513c56a5', '15296613096', '2005016716', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2005016716', '140311198011260944');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5a7a032c24c64c6b851222c8a4f46232', '15698358497', '1991016506', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '1991016506', '142601196810211926');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5a7c131dafd84fc3802c4335cfe13eb9', '15835122182', '2023505008', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2023505008', '140424199705030010');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5aa68dcfcd024dde8ea473121c6a6437', '13546469151', '2007040125', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2007040125', '140106198312251214');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5b3c7eb438e949ffb0a29171de6e819e', '13546467320', '1995016307', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1995016307', '142603198207101046');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5b43177f263a4f8ca85a46b1333f3694', '13552136711', '2021206009', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021206009', '140602199606209042');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5bb2b0a407e64a1eb02b0910b7aa9e59', '13935182166', '1993016209', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1993016209', '140104197003160821');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5c354ced465c443ca7dc1f02b4bd4239', '13663513873', '1988016130', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '1988016130', '140102196810100641');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5c61e1a9c86e4d1c81982c141e041e3d', '13643412880', '2000016514', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2000016514', '14010419771224223X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5c688bf75f464f3a984082bfa6862c22', '18734558942', '2013050008', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2013050008', '140110198209191019');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5cb95b7154b34246bfd16e496e310925', '18234418884', '2022206010', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2022206010', '142401199401104225');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5cdca7fb6dbe462fb638a51cbe095c6f', '15235385976', '2020109001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2020109001', '140121199306203521');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5d1e845ae92044839c6ab438c116f2f2', '13835163669', '2007016045', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2007016045', '140108198302024846');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5d2c0688762c4982ae529136d8273822', '13593155559', '2006040005', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2006040005', '140121198210260527');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5e626c6a9279416a8fd3203c2add2087', '18636950617', '2023505007', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2023505007', '370782199206170839');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5f459bdc780542d099e56b3801df27ed', '17735158987', '1997016115', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1997016115', '140511197203166342');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5f7ca5fab8b248f098080aac12b72232', '13935156021', '2003011030', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2003011030', '140109198106211560');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5fb1c0aa40054c1f885421e4d5548277', '13453457030', '2005020002', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2005020002', '140411198202074816');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5fc91eab4f87427284c5ededd343c0ae', '18235105821', '2023515003', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2023515003', '142301199306154149');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5fd17da83d374c9bbcb55391a6c82832', '13393415000', '2008011014', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2008011014', '14263119800715742X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '5ff6c9aa9a1e43d991a8cf6b853e512f', '13994246826', '2012040004', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2012040004', '140109198403110029');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '60065de34dbb4493a1e6818d748ca050', '13503547212', '1998040001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1998040001', '142603197807163027');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6022865f27ee4480884f07ed9a3bc070', '13633451599', '1990040002', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1990040002', '140102196910023225');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '604b57b0c32a457088dc7b808c5efc88', '13834682277', '2000011196', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2000011196', '140102197807204049');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '605aae29a8dd4cd68065f9b5bc04e292', '13327463479', '1996040161', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '1996040161', '140122197712081125');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '606863f5226647b6af292553dc95d5ab', '18635182769', '1997011291', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '1997011291', '140102197401062386');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '60b5b8742215448f8dc1fb7c40fe39a0', '13703584346', '1998010004', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1998010004', '142601197504221311');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '60d4da7128c0479f983153ec391043a2', '15035690398', '1999016308', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '1999016308', '140102197604156518');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '60da0847d2344974ab34dfab7a5af753', '13753153848', '2000016120', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2000016120', '460001197701040712');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '60dd159f485b4c6c9521b7bd28f3fbc9', '15383610803', '2022303001', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2022303001', '140223199506226267');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '61014164ba1e45db9262172265e11a08', '18135176245', '2002010002', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2002010002', '140424197708300013');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '613c80b86e7940fdb74bffc95d5749c1', '18734112838', '2016010041', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2016010041', '141124198909260192');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '614a232569a644fcb8efaf39e9965fa8', '13007020169', '2014209001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2014209001', '140106197504045138');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '614f911346b94684b36e428d3a32b49c', '13994219777', '1995016145', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1995016145', '140102197601024026');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6170757a6e8c43b098415c4d211670e7', '15680703858', '2020181009', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2020181009', '141125199203025431');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '618ab708339b43e1846936a369c08073', '15835128024', '2000010007', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2000010007', '142429197809140024');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '621320d862ba43bc8ce473c40d99040f', '13835149343', '2008050002', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2008050002', '142702198106140010');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6245b78bee4346109cab29cd7cc72764', '18834811585', '2013010003', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2013010003', '142321197502070029');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '626c2ae48b314a2c940f48540beed353', '15536623254', '2010010009', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2010010009', '140311197803183620');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '629a8b5f24dc46d29a363a29080fa84e', '13513629569', '1999040158', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1999040158', '140102197511150643');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '62bcd98892a54d8d907778e46d74f4ba', '13623468323', '2022206007', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2022206007', '14010819891003161X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '62bdec3048fb457c9abc35822686a9a7', '15903460234', '2021206030', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021206030', '142301199306100036');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '62beeff7bc6a440fab6834e7509e45fa', '13835174107', '2023503001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2023503001', '142301198003266018');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '63712f5c33604a67b2f03a28f94e3866', '13633472191', '2012016100', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2012016100', '140102198006141417');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '63904c3334c2447bbe84a122a87c3509', '18734836244', '2022503003', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2022503003', '142703199408111232');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6394b6556e67469787e846c6987c51d9', '15935890069', '2021206039', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021206039', '140402199603160430');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6417341e8c4d443ca50f1ba0fac04137', '15034101185', '2013020013', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2013020013', '142603198804082023');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6434957bee7b455cb98ebb3dee57ca39', '13613464920', '1993020800', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1993020800', '14010219740220514X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '643f7debbb7944c9828da33791c39fe3', '15386885900', '1993040155', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1993040155', '140103197111071213');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '647e5b1a885c4e7d86f86e6c84abde14', '15234255551', '2020181033', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2020181033', '140105199404171869');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '65bf21eaba764daaad0f9afdb0632ad0', '15340689352', '2005020010', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2005020010', '140108198204031946');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6629fb0206cc43c99be53d0b65f19a1a', '18634333366', '1996046001', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1996046001', '140102197711051420');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '66380afab2c1434e91615654ede38db2', '13633451580', '1993010002', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1993010002', '142324197202030024');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '66520645767248109ea9682df6b0bec0', '18735370716', '2001011010', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2001011010', '142622197807160028');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '66ccc306acb743418533f0f2d9736038', '13994243329', '2007016522', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2007016522', '140106198410110626');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '66fdb859411f4f448e6ebf8f7ef7216c', '18835118131', '2013050015', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2013050015', '140105198712020582');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '670433300fbc4fcd8b8d8ddc568d9972', '18003466817', '2006016216', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2006016216', '140302198008211029');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '674553bbd3ee4c00b7034771bd1c0a01', '18603450870', '2005011011', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2005011011', '140103198210024222');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '679d84fc3cc94aa8b6be477a2060acd0', '13623628625', '2008011302', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2008011302', '140108198403290844');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '67aba61734684e30afd657faf2777233', '15034068696', '2013050027', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2013050027', '13012319851212154X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '67dbf1c9561f4c55981784eb4d465e29', '18734874616', '2001016814', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2001016814', '142401197708202728');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '67faae5dbd164e029122019506bf93e0', '13603556363', '2011010003', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2011010003', '142326197304061246');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '67feb2fe12424a85988aad0f6ba6cf42', '18835156780', '2007040123', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2007040123', '140106198305272519');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '68149fb39261477e9376dc15f0942591', '13834646468', '1993046001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1993046001', '14010319710116001X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '68239e72ce9f491287fa8ca2892e1bd2', '13007099112', '2004010011', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2004010011', '320113196802024856');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6837eb743bdd4e71a8af6a9de3d89dd7', '13935169156', '2006011260', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2006011260', '140106198305250627');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6850b8e1743444889be7402729961c0d', '18636610820', '2022210001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2022210001', '14262119960902292X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6874c483c34549ecb680c0431ea09e0e', '13700541170', '2005016915', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2005016915', '140103197902220043');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '68b945b354104393901fbaf3004df622', '13834624958', '2010011285', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2010011285', '140102198212132327');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '690cc7b573654ab5a34425dd8fecfa7d', '13593142628', '2008011220', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2008011220', '140122198409090138');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '692cdb44344d48ac9a3093364b775db1', '15386885535', '2007040104', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2007040104', '140122198401090125');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '69731bc307f94af58e266e0a3d219cae', '15513601798', '1991066004', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1991066004', '140102197602235116');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6996b2f55ca64571bd5dd070909d526a', '17735157111', '2007040138', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2007040138', '142603198409045812');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '69f0a06f98594060a761934afb31db1b', '18903404620', '2013050023', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2013050023', '140106198610272566');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6a4142544194482aa5156f896f6e9105', '13754831460', '2007016041', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2007016041', '14010219820518062X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6a9c8c8b70624250892d20d1f6cba028', '13453400961', '2007040169', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2007040169', '411402198607064042');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6af7fedb1aed4e4aa8905443dc100e13', '15003416299', '2014217001', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2014217001', '140102197609036558');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6b0f7b8bc3b5404ca77a37e1d0f7b57d', '15903430029', '2016010001', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2016010001', '142702198901182420');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6b19c2e488434324b0fa3ff9ce11c21d', '18519716734', '2021509003', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2021509003', '140211198204263310');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6b2287baf5eb4264a31b15750bfc2581', '18844069725', '2024503001', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2024503001', '14112819930614001X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6b2c4271d8bf49c6abe88531a29caa76', '13834046772', '2006016214', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2006016214', '140621198001133115');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6b3c836a641a4349ad7a9f69eff44d11', '15110392660', '2024504001', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2024504001', '142402199501285429');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6b8c4a5e90d54c4f8c8c42784a50aaee', '18603464170', '1996010003', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '1996010003', '140402197302243217');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6bf02bbc1ab040b58ee29d30385fc004', '15035148085', '1996016305', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '1996016305', '140104197404152259');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6c0eaed722554120bd394c7da7548a2f', '13513609783', '2012050001', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2012050001', '140107198503180013');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6c5165471d9545018faa21ba172b96af', '18734865302', '2012040002', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2012040002', '142431198610120081');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6cbad3c9c54c446ba3256ba174b63fba', '13191056693', '2000016812', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2000016812', '140102197604250619');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6d2fe8261e1b4225be2bc90081cb8e40', '13703583919', '2012010006', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2012010006', '140102197309035166');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6d626a3f28594a05986fce06630b3966', '17839194910', '2025511001', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025511001', '142222199412260339');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6d62d249bdae4e7a81a8211fcdae6cd4', '18603463737', '1987011006', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '1987011006', '140102196510040827');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6d69bc28492340319b665e6057fc198c', '18434351516', '2023505009', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2023505009', '140702199701317100');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6d8aa9628012451db0fbd4a532195ef4', '13935187103', '2000010002', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2000010002', '140103197610034222');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6dbc16d581174a0c8032c83140ffacaa', '19903461506', '2025511002', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025511002', '140602199609101520');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6df443004fb8483b8b5bf5273f7dd7a8', '15803518581', '2001020007', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2001020007', '140302198001160556');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6e37c94cea064b279b2a738c3f2ccf4a', '15386885609', '2001040129', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2001040129', '140311197803090934');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6e398bda93a94447a034c28069d30b32', '15803518892', '2008011298', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2008011298', '140106198412260660');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6e4e2860e9d6482aabdc0daafc1d43ba', '18635387700', '2023113001', '', 1, 0, 0, '2026-01-29 01:31:05.226645', NULL, '2023113001', '140302199304120812');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6e995b93727643698636884fc5b84d25', '15392620629', '2019090162', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2019090162', '142301199007200264');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6f307647b77f4fbaa929ff0341bf8050', '13503512102', '2014401002', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2014401002', '140123198102170025');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6f5080fd8e0047c5bbbdc7a008233753', '13170256477', '2025506002', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025506002', '142303199408010114');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6f561619e3154f6683259b8d4093c1f3', '13753193968', '2003010174', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2003010174', '142601198007241914');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6f59ce1c70124419b29afbb4b4187a9a', '15235383855', '2013050014', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2013050014', '142228198309198518');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6f5c3c5fea014a7f98340bf1fa4adfde', '18035576795', '2020181035', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2020181035', '14042819940608601X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '6fc3795e181240ef8eb4382545dcbc7e', '13834568929', '1989016108', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1989016108', '142601196703151921');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '701dac37a638458d8e5e8bafd327ab9e', '15513670900', '1989016613', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1989016613', '140112197104011737');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '7036493e6b0447e28e31386105398bd7', '13934504460', '1999010005', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1999010005', '142733197603130331');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '70787e83e49b42c88117f5fffa0b5839', '15834073096', '2013050017', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2013050017', '142724198603071421');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '707f52e5ccd54b7faea646c5d42d8605', '18842315917', '2021206006', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2021206006', '142431199512280668');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '713a8f23e3b64dcabee3b3fea43b2fa3', '13038080290', '1987010001', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1987010001', '140102196510140633');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '71babfe1c9734fd9b931039f77a188af', '18334753692', '2013050012', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2013050012', '140181198609022826');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '721191cd2c7545be96aaa0cb7a199d99', '13934655257', '2016010006', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2016010006', '230505199003270528');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '729104fe09464ba8b00b72aae072b8c0', '13734001206', '1993016511', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '1993016511', '140103197108190035');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '72a07106f92c4e5b9743c3ca1d5c205b', '13546427725', '1996040107', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1996040107', '149001197307272826');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '72b587439d294d8aa882d2d66c0940e1', '15364960863', '2022213002', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2022213002', '140109199003144224');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '72d00370f2874a20a1ad56657bb9363f', '18835101133', '2005016315', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2005016315', '140112198111042835');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '72fec75d5fe44af7b5b5e1c0e54d8d38', '13996331165', '2022112002', '', 1, 0, 0, '2026-01-29 01:31:05.226645', NULL, '2022112002', '500222199001164620');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '733d0297d51a4ab9ac2d9429abac6407', '13834677155', '2003016422', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2003016422', '142701198006180924');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '738eb8773c4f4c9ab67e716837a4aeba', '13994255624', '2014010019', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2014010019', '140109198702060017');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '73d9ea0f587a499a9d162830fe0f72a6', '13934665488', '2003020001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2003020001', '140321198009070060');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '7426ed69584440c69cfd5f8d47e7e959', '15534079908', '2025516002', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025516002', '14012119960125468X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '74347aeb25264ea5ae7f4b1f951c3128', '15834166478', '2013050029', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2013050029', '140202198705202528');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '74a039003c1442b8a042249626f8fe48', '15513608722', '2007010012', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2007010012', '140112198110101303');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '74ab2d13db0d42c1b5a2603467142f68', '18822033213', '2021206032', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021206032', '140581199606231629');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '74ce8e768f824c6ab640a09ec8aa17ab', '15903468110', '2003016916', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2003016916', '140112198206030415');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '7509f56f0ef041058334756f7fb15565', '18636956850', '2001016874', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2001016874', '140430197605140026');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '751513503e3b43888a092194fcb8ca39', '18829085539', '2021519001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021519001', '14042319930207002X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '75598acd636b49069b58887b81c7a6ef', '18735196789', '2008016435', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2008016435', '14010619850703122X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '755ce03d58fb4f87842db976c06014f7', '15534474189', '2013020004', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2013020004', '140107198712062216');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '75917350b82548b0822a77499ebb796e', '17835100555', '2023201001', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2023201001', '220323197303106018');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '75ad9ff6585e463c84761e36c07661a6', '15235131302', '2010050001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2010050001', '142429197704103817');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '75e8c5eed9894375aa418fe76ec85cde', '15386885783', '2008011008', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2008011008', '142301198109134128');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '75fa34ad0b3049b68a97ac2999e83de7', '13753180227', '1999040102', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '1999040102', '140103197903015738');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '7636ec299bf649c0b83096ccd736b053', '13703510270', '2005011257', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2005011257', '140105198209200543');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '76374a77e6844f6082fa595d6a4b8321', '15135087325', '2001010005', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2001010005', '140103197810311220');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '76bcce957b004669badd050f206924aa', '13453431209', '2007011205', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2007011205', '140109198311100528');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '774388d4d32f4fe4a45168e289be3e67', '15103511968', '2020181032', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2020181032', '140106199506081828');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '77853495dda54fba9035c5f14ee285f8', '13934215791', '2001011009', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2001011009', '142625197804221664');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '7788e17fd1fd4903b055b7c6f69e38bf', '18404980539', '2026206001', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2026206001', '142226199310211718');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '780b7ad116cf4b0c802e33fa729fb9fa', '17836203272', '2025510001', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025510001', '142322199510167547');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '783ac37132e544719960d3993a8c4f68', '13485338908', '2013010001', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2013010001', '140104197209100824');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '78c86ecf053f4aeda05fd2909664aaf4', '19903462299', '2004040163', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2004040163', '14012219820915001X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '78f1a6d1252c42298c8a1fcade91d9fb', '18734157203', '2014020006', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2014020006', '412723198711212948');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '79c8cca786704c3cb3390262307f3cad', '18734862993', '2024505003', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2024505003', '320322199103104452');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '79ec5da4b7294f5f8982e34f8770c0ed', '13015376813', '2022202001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2022202001', '412931197301235537');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '7a7eceeb410e463abbb9bf6f65e8d88a', '18203419314', '2025209001', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025209001', '141082198806200013');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '7aaacdb99e7c4272b965292f722dcf3a', '13834653761', '2002011245', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2002011245', '142432197702221228');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '7ae0db9849e446bd93326135f8e06c67', '18503517788', '2006050002', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2006050002', '142325198208065528');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '7af1384ce96142aaba6eade0585fbd26', '13096501658', '2023515002', '', 1, 0, 0, '2026-01-29 01:31:05.226645', NULL, '2023515002', '140302199612260825');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '7b1d45b1c92348b392236d2727a686d5', '15510327064', '2023511003', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2023511003', '140202199509104028');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '7b353f94a9df466eb09a60adfeb5ce6d', '13623656119', '2020112002', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2020112002', '14020219920828554X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '7b7a955f3e024c4e9b7c89702030039b', '15034035507', '1988016910', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1988016910', '140103196511274269');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '7bcdad16c2bd4482822f2b431e00347f', '19834510847', '2025504002', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025504002', '152627199506050020');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '7c5273a3dec84439b46426c7cf875a02', '13834617326', '2014216003', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2014216003', '140112197405153210');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '7cdbfe32e00f4deaba6e45389ec0cab9', '13994268510', '1995016131', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '1995016131', '140102197209134829');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '7cea4bbd4e1e4b50a4c741d9cf90d1fb', '15386885816', '1995011241', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1995011241', '140103197303070688');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '7e616e2bf7814401bc41363b9abebb74', '13935172801', '1985016800', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1985016800', '140105196606033719');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '7e79e9c469a34b109ecc280f329c4bbd', '18135188006', '2009016626', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2009016626', '371121198001010015');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '7ecfa109987b4765a14f289d74e6c2a9', '13934048808', '1998046000', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '1998046000', '14010219760413233X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '7ef00fb80ba643fbaf577f26a25efe8c', '15536321112', '2011050001', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2011050001', '511028198401275149');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '7ef8bc0d4b88496789ebc0e8921828e8', '18035160981', '2007066005', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2007066005', '140221198011230048');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '7efb8485bdbe47149997589119140af5', '15235365351', '2011050008', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2011050008', '142601198410101938');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '7f3c90e5fd3b4964bd4bdc7d77ddd9e1', '18133929435', '2020808001', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2020808001', '142702199302281245');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '7f9c211ab7724ce380437e6895a57589', '13803462562', '2006010005', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2006010005', '15262619800101332X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '7fc2d526cc2a49b5888eef31ed190928', '13934654025', '1991016117', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1991016117', '140102197208312320');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '802be9e153d14fcf8035400ced26b2ae', '18649310901', '2013050021', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2013050021', '142630198508173018');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '806ae8958b194e83b167a01b9773d985', '13603536924', '2001046001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2001046001', '140102197702160019');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '80901e81cd0e42fd89ca6c649e63607a', '15386885511', '1995040170', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1995040170', '140102197609096534');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '80bda11fd3204d17a1b07104fbd13acd', '17735114820', '2021206019', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2021206019', '130625199107110825');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '80ed9e1321d64de28641b2f6b35a092f', '13485338166', '2012010007', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2012010007', '140113197112291616');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '81386820490e48e88c47fbe63d85333d', '13803439260', '1996020001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1996020001', '142401197402096280');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '81537aef091a4245b26850330890b14d', '13513609166', '2002016014', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2002016014', '140302197902010569');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '818e8e1db4c04089978457b2891bef02', '18535113509', '2020181024', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2020181024', '140109199412301040');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '81e0d78afaa1462494bc61c8ef0d2c76', '18435128848', '2021206024', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2021206024', '141122199408250094');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '81eac1293aec402da8f710808c00cc90', '15698573835', '2007046025', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2007046025', '140121198409205533');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '81f1763c8123427ca1ad4ac4e124bb4b', '17803477304', '2021206017', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021206017', '140411199512115243');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8239941c0a444e4598446304e74760ec', '15935151918', '2003016700', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2003016700', '142231196802250104');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '827312950e594f43a5fa3692b5ec08a3', '18635134118', '2016010042', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2016010042', '140109199007021029');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8286935c993f4fae8254bac13747c7b4', '13007072029', '2014010001', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2014010001', '142603198509202029');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '82dfd9589bac479a909caea38061073c', '13834169586', '2011040002', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2011040002', '140226197906176019');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '82e35c2a316645f78801e1b0e1572b51', '15513455111', '1994016513', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '1994016513', '140102197507052346');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '836472c641a643ffa38ff9a79399b58e', '18813143750', '2025510002', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025510002', '140623199505090048');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '83f301d9bd7f45deb56378289b41c2ea', '13994211300', '1989016611', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1989016611', '140102196807055157');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '841dcb2fade442859fa257b2d2831410', '13934228341', '2007050004', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2007050004', '140102196803175127');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '846559c58156420993f9404be7b36f65', '13934508978', '2014207002', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2014207002', '14010219700426403X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8550013e3b6e44f68dce6f745b1e0a12', '18734167802', '2024502001', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2024502001', '142202199312010337');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '858191e8239644aba8292e20fcc0928a', '13403465056', '2007016617', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2007016617', '140103197809261211');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '859a8fd788c541a3b7a88b8bc77b9210', '18903510860', '1999016013', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '1999016013', '142430197812080064');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8635ae1f7ff0477bb2e519cb16a63f24', '13453123103', '2009016437', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2009016437', '140108196912285534');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '86441e67828b43e5aacbc2ba8e725dba', '13293983532', '2025503001', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025503001', '140622198810043319');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '86d487de76964e3b9d982de7c08de30f', '18584564192', '2021506006', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2021506006', '14021219920930272X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '86d4f807c75f4d56b9a78aff7d2d6b2a', '15934106160', '2006016521', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2006016521', '140102198208316529');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8704322b743648bda3d68234885bcb16', '13903431221', '2003016148', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2003016148', '142727198001231511');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '874d9c9c230b48698db779884cf0b74b', '15386885717', '199901013', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '199901013', '330106197804290069');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '876fcb0cbb014720b3d44acf6d4d81f0', '13834598173', '2003016423', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2003016423', '140102198201143426');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '87981c3aa99f461cb86c1822463797c5', '18234199818', '2007011221', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2007011221', '14010719820818066X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '87d51dda444b4263b9a3e2d386aeef7c', '13015484344', '2005016306', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2005016306', '140121197405015519');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '88914c41bed0465eb763635b57ddd4b8', '15386885685', '2008011007', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2008011007', '142223198204213329');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '88931a4bb1f04d2a81bead20b9258764', '18035162018', '2007016516', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2007016516', '130225197909203723');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '89073ea41cfa42ca9ddc9991f685a147', '13934246159', '2014217002', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2014217002', '140103196511110037');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '896021c3ead245528c938e83adf14f8f', '15386885701', '2002011003', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2002011003', '14222719781004102X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '89614c2432b1441b91bfdc311eeb1b22', '15303512104', '1999016408', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '1999016408', '140102197204132314');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '89c6fcc842b44738bafd4d8b2755a83c', '13903431195', '2004011255', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2004011255', '140224198012100084');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8a017b7f37874f6499ba43fab168ed8d', '13934650926', '2007016918', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2007016918', '140106198309013047');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8a36f28568f245ab8ff7689cdca3bbad', '17735576524', '2020181015', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2020181015', '140427199405308040');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8a38f0618460440ab796bb6105d778e0', '13935198829', '1987016705', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '1987016705', '140112196512081289');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8a4527e6b1994867b1cc05b04e84e195', '13834200609', '1988016806', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '1988016806', '140103196807060622');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8a600d46b1a744bb8413f893776290f1', '13653664561', '1990040136', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1990040136', '140103197010141542');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8a738b7fca1d4163a329a241638fa3b6', '15386818692', '2007050002', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2007050002', '140104196810111335');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8ab2f2310d0a479ca7d720562af8f46b', '13934246186', '1991010001', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '1991010001', '61011319691114045X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8ac0ab0f6d924d4e966fa1da6d926f20', '13700543949', '2005020008', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2005020008', '140104198102202227');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8ae78b5030744c54aac1c1aa5fbde991', '18834811102', '2025206003', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025206003', '142703199611023625');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8b0bef9a34524cc788833c64cdd7a94b', '18234015162', '2006016137', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2006016137', '140103198110185715');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8b34f6b993264c58b55f062ad71e81d7', '13133026080', '2020181019', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2020181019', '14010719920306121X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8b4c930f5ed344e29230daffc14a7b38', '15535375207', '2020102001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2020102001', '140702199108227147');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8b9385522faf465cad713f83cc3696d2', '13663619636', '2015010011', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2015010011', '14010719901228332X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8c05e809163149d5a1aa491196286b05', '13453118014', '2013010005', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2013010005', '140624198209042043');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8c28d151aae04fb6ac52247f3474c03d', '15536573625', '2024502002', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2024502002', '140522199507150014');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8c8060f10f24466994d598908d1ff84c', '15386885733', '2015011003', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2015011003', '142731197810186319');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8d128e0951e74e13b3d9aba3971eeab4', '18135145345', '1995046001', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1995046001', '140102197010300690');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8d14840753354bbd9d76a5c29c4adebb', '15386885711', '1996011017', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1996011017', '140102197712140628');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8d2cbd645b144533bcfabb51679b7dd6', '18634302820', '2014010017', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2014010017', '142623198804060022');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8d51e19811834abf855a891e3fbc1904', '15635528008', '2022206019', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2022206019', '140402199111280444');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8db28413fca340489e240e364a07ddb4', '18635110008', '1993016615', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1993016615', '140102197502186521');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8df0a74a3be14c669f8e3613a47df58c', '15935687773', '2011050014', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2011050014', '142401198609210911');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8e480e7639a345028ffa7e148e0abab1', '18603513096', '2007011347', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2007011347', '140102198211230013');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8e51a9e3b2a84087a5a70e1ad7480288', '13935161868', '2001016417', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2001016417', '140103197808303387');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8ea3300fd499463381bc2e69859c6df6', '13934204429', '1987010002', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1987010002', '14010319651116211X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8ef9d57122334f3fbaf645afdc20d16d', '18634418295', '2022206009', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2022206009', '14012119941108152X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8f13fbf2ab8a41e590dd9799c2c4f766', '15801757217', '2020112003', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2020112003', '140107198908211228');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8fc4306fe83d43488beb400b18f7755e', '18834186104', '1993016112', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1993016112', '140102197004152089');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '8fe3db077460404795d00a3046be4368', '13994209398', '2006011008', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2006011008', '142601198107272822');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9022f5b78fc94b778c1e7cffa0a6692c', '13994218695', '2009016050', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2009016050', '140108198606024220');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9031d0f1e1b54796bd6e7f20cbcfd00b', '18135117467', '2006010004', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2006010004', '140102197306244827');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '90331e93a343411ca557fbd0b65c47b6', '15235197223', '2013050002', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2013050002', '370983198509231822');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '905e8ba5f7724338a34e90a41a3b55eb', '13834584131', '2003011035', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2003011035', '142601198108241710');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9066019367a84af29173f90b7ec018bc', '13754883311', '1994046018', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '1994046018', '140105197501303713');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '907a9639ffd24bb8bdc3b896d7ea60f2', '13613458038', '1990040001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1990040001', '620102196707155390');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '90c1ca572702430c94b47daa457e3469', '13513515758', '2005011036', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2005011036', '140103198205071534');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '90db076cc7e04a7683327cb59a195eb9', '18735109200', '1999020001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1999020001', '140121197407090029');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '90e4c18b6531417f97ca88493818e2f0', '13603582828', '2006016429', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2006016429', '140106198406212523');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '910bd9075cd74cb491ddd289d356c519', '15034008926', '2008050004', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2008050004', '142321197810040622');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9132baa1731d49678c177b12e4194f9f', '13466837671', '2005016025', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2005016025', '142723198107200021');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '916d15f218e94d5ca346e9ced248af83', '15386885898', '2007011308', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2007011308', '142702198304270326');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '91867c48e3a94b96b77702df9c79b45e', '13935110188', '1994010006', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1994010006', '142430197001182729');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '918751f22e0148d3a376319ff57a99b7', '13753181844', '1995066003', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1995066003', '140103197112230087');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '91ff02d9205c47a4960e5e9c881edc53', '13333430642', '2001010006', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2001010006', '140102197904141430');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '922c2f85681c4c9b95acb1f4a1718aa8', '15383416392', '2014010014', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2014010014', '142303198704170062');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '922f4324303c41f685d76c18b40e3980', '15203516569', '200501005', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '200501005', '142703197212200023');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9288d769552642eaaf510edad7ae8a07', '15513817425', '2009011007', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2009011007', '140122198710301125');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '92a31698fd034cd9b84d1d5468e013ea', '13503541150', '1995016154', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1995016154', '14230219720911058X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '92a6bb77fd9944258b463db5a8b23fd3', '13803492859', '2001011015', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2001011015', '142729198008290023');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '92abcb49a0c8442a8684e1bfab96476e', '13734007076', '2005016127', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2005016127', '142623198101120826');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '93af87417ca64ba88b5fd2e3ecf7d4ea', '18634312865', '2011050005', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2011050005', '142601198410161914');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '94179bc502f94991b52503b235289abd', '13503508748', '1992046001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1992046001', '140103197303304827');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '94378b24c649467e8ecd1252f1d97ac6', '17866556899', '2023112003', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2023112003', '140931199607030050');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '946c7fc87f564d99981eb753a8514bfe', '13994249910', '2022213001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2022213001', '142431199207074841');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '949ddaad13de478595e9ea07bedfcb37', '13803496255', '2003010002', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2003010002', '140103198008293373');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '949e3fb72943443794166fe13f97bf73', '18734845969', '2014113001', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2014113001', '142333199105271825');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '94aef43ad6c341a09e62020fe99a2983', '18834802085', '2020181017', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2020181017', '140212199209233365');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '94c9393ac4774d9bae1e72a3fd7cf049', '15850572377', '2021505002', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021505002', '142431198811217541');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '94f42fc6da4b4888b3f7bb910bbb0e69', '16603511500', '2022206005', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2022206005', '140107199511240017');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '94f93d18d2cf4423979d5fc941470022', '13603534665', '2011056014', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2011056014', '140102198106042344');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '957f4c8dfa5047df8d5f7d80ec9b183e', '13934132313', '1998010002', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '1998010002', '142431197104140034');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '95d3a1317c964788a13f9c17a5a3ccdd', '15386885905', '1993011198', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1993011198', '142224196810090012');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '95e8eddb887b42f98dff9abd2920ddfc', '18810555824', '2025501003', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025501003', '142621199008240040');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '960398f6b33e442b94380c0a00e701e2', '18435107324', '2024112001', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2024112001', '140107199308234527');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '967e2d620a4f4b54959c542fe488f48f', '13935181692', '2021503003', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021503003', '140104197001062216');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9695f1f8a0d54630b2ba7a3e4aa5fa88', '18334733668', '2020109002', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2020109002', '140423199012262824');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '96e849c7f6e84cdd8186a144cd37919f', '13834501032', '2007020001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2007020001', '142431197712294854');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '96e85d96503a49b6af7c2adb45f5e4e6', '18536668089', '2007011222', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2007011222', '140107198210201220');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9740896a2dfa4f56a7668d6e01346816', '13100112895', '2006020004', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2006020004', '140105197605125042');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9756b7d9d2ab40adac66f1406a54edf1', '19511406178', '2021206013', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021206013', '141181199411090052');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '977a9b7dee5e4f55af5a9755290237a3', '13485352588', '2020218001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2020218001', '140107198911043317');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '97e7105b5c4d4c288dfcb05182488447', '13994210858', '2005020009', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2005020009', '142622197908124210');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '987211cd0375407cb6eb1780609a1d94', '13513621990', '2008011006', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2008011006', '142725198108025627');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '987f552267e8485499067ba9f0565cb0', '15135155071', '2022504101', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2022504101', '41082119870809454X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '98998c8fe4234d479a23dbad0e1e1573', '13754895243', '1996016114', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1996016114', '140102197201295169');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '98a3c69e4ab548208f4cad633a94d824', '15764399739', '2020108003', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2020108003', '142625199301181727');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '98adcc0bae6c4faba2c89b300bae0252', '18434305721', '2013050018', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2013050018', '142732198207170022');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '98ddf9ee843d4667b037ee8691660376', '19581586609', '2021503002', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021503002', '130726198706141014');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9955988b5b994e44a6a0ea81f1c6b497', '13835134482', '2021206001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021206001', '140108199709291617');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '99b415748b6d4e9288e9c292568c9dc4', '13835155868', '2011010004', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2011010004', '140103196510302731');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9a3ed748699b4f769b36a247f4074dc9', '13643608127', '2006016518', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2006016518', '142402198008243319');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9a647400e01546439dfe7d5a68bf38d5', '13934559266', '2003011011', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2003011011', '140102198008072312');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9a6522508cd6452caf5e9f813e29be01', '15834033114', '2007016221', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2007016221', '142429198209172828');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9a65e7e7215448a3b233dc2aec97b363', '13007088099', '1989010005', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '1989010005', '120103196603067028');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9aeabfce5001423296ffcff4c55ad9d3', '13803416605', '2005016043', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2005016043', '14012219821207082X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9b08a6a30f654994b7fef0edcd20b701', '15536547213', '2023508001', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2023508001', '130603199202152160');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9b69258affa14b5f90781da9c3203775', '15386885686', '2007011021', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2007011021', '142225198105100524');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9b913d3645d148158bc52ad7c6a98698', '15135164528', '2012050003', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2012050003', '14232219840619054X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9bf54af6ec0d4876a82c3f0d2e5c8f30', '13623610099', '1994056007', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '1994056007', '140102197211126529');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9c3ed69b70894165acd41ce4731fa66d', '13233677810', '2017060012', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2017060012', '140107199007263324');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9c53a3dd20ce4b8b807e16a15350e7ac', '15386885740', '2003011014', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2003011014', '142601198007011932');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9c79ef6ceda44347b901a061fe70a846', '13803491662', '1985016143', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1985016143', '140104196711090823');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9c9a42f297614eccb87c7abea100e0e1', '15343430077', '1997040144', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1997040144', '140102197812056511');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9cd60728479644fc9367e7b7e2c6fcb9', '18935294709', '2023303001', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2023303001', '140581199409260025');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9ceeca250ea24108a6baa323260c2a0f', '13633473567', '2007040150', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2007040150', '140107198407254836');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9d22d19cea884762a7402bba4afc0cd2', '15829533976', '2021504004', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021504004', '61012319820410331X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9d8be8511ed64111b5bb911e23defc6c', '18636677520', '2011016760', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2011016760', '140102197907171440');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9d9509c40f5e4fe39cac6f67d1e4ace2', '18834199135', '2022501001', '', 1, 0, 0, '2026-01-29 01:31:05.226645', NULL, '2022501001', '140105199303051825');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9e5e222929a34a9db56235d35d123ec9', '15386885846', '2001011037', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2001011037', '142422197506111520');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9e6fb75abf3546c0ab1bf9d0650cd3a2', '13834697400', '1990016304', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '1990016304', '140102197101176541');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9e73a5eecada4238b642907443fa415d', '13080311551', '2014010016', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2014010016', '140107198711020620');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9f0b61688bcf4715bd014d3b6668b5f6', '18035192266', '2006016323', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2006016323', '140106198310193081');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, '9f407cd5df5649e9956f6d82b8ecb28e', '13503517151', '1996016409', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '1996016409', '140123197301020025');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a0611a98fcba486fb5135d9e60fe3023', '15234246908', '2025501001', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025501001', '140108199807293923');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a0735cf82a2b416487bcd9bd81a4ccdb', '15536812412', '2005011031', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2005011031', '142625197903120025');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a0cd16c431fd4d6d81d2aec6d143b017', '18235276371', '2023112002', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2023112002', '140525199709188722');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a101495470804edb95f6f92ea3603532', '15803465653', '1991040121', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '1991040121', '14010219701209232X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a1019c43c7c4456dbcff5b6b23a4c8d3', '15340707062', '1997011011', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1997011011', '14112419730127011X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a145150221d5407895b0473607bc724c', '13261535838', '2021509001', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2021509001', '370882199011054710');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a15fa4ee4d9a496890ac35745c2ee574', '15392630969', '2015010001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2015010001', '142623198902045213');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a183c9f4647d4f0ab1a740fc5720b193', '18636845318', '2003016311', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2003016311', '140103197903211210');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a1ac60dd4f1a400ea324ab4231448e9f', '13835183839', '1995010002', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1995010002', '140102197303235159');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a1bc68e6698b4a37b8f9ce6cfe6ba87e', '13643455980', '2008016320', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2008016320', '142202198207140522');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a1c190b5a51747649a7bf2b6798a34cb', '15834190475', '2024505002', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2024505002', '14232519900515252X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a1c8f7230df14533a8101dbb6befe7e8', '13994230596', '2003010008', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2003010008', '140102198007081428');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a269012989fc4a6b81ae8f5a209ab02a', '18234099788', '2013016063', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2013016063', '140102198008075142');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a2dc07a1724940c4adbce7560dc63470', '13191041206', '2007010005', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2007010005', '14272419770113054X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a31034221d4b4481bcf45bc28fc20a64', '13935116970', '2014207001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2014207001', '142131197112195514');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a315a6a6b32c4736b68a318d3e082a86', '13754822644', '2023505004', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2023505004', '140107198704141221');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a315f92e203d4f3e99f240c96c3780bd', '17735165951', '2013050016', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2013050016', '140121198611110642');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a3615d658a424c7798e29597bfeb8b81', '18835169741', '2025503003', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025503003', '142333199709290023');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a3a80554ea704fb69ff7099893a3228e', '18935102390', '2000046017', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2000046017', '140502197607200520');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a3ca85a20f0348ab93704493a1624145', '13834668850', '2011040004', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2011040004', '421002198106232423');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a4494448125b407dad84d58995437f10', '13934235886', '1989016432', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1989016432', '140102196908032069');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a48fe059f3634eb294700acb45e1b201', '13903416130', '2004016926', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2004016926', '142431197904270021');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a4db985393ea485c8ae6402e25cdcc1d', '13027070756', '2010010003', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2010010003', '14223019710627002X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a4f867f0ad5c46c7a243f2071c031ef6', '13623451826', '2007016222', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2007016222', '412728198211122526');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a5040f7d541f46fa8545a71ca893f9f5', '13835173621', '2017020700', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2017020700', '140202198012031025');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a56d584954bd4c308f7478c512420acf', '13994215880', '2004010001', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2004010001', '140102198202112349');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a5af333aea66442a8bcb84c312e6811e', '13466838899', '2001016515', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2001016515', '140426197704040026');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a63db1d781d9440f84cb2894fbbf7580', '13466822556', '2007040110', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2007040110', '142231198309240825');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a64894aee6204b59be45ffa162b8585f', '13834525386', '2002011244', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2002011244', '140203197907153922');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a70cb48cd87f42f78755607ffb2043e0', '13603559219', '2006010007', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2006010007', '142601197908051910');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a73ebff1ab674feb969db3a0f7248830', '13994230144', '2002010001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2002010001', '140102197906082315');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a75a8b999b44457c946c9bfba66d592c', '15123030397', '2020115003', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2020115003', '141124199204080209');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a7700ffc00e74c63abf2ef157229b446', '18834883234', '2012050015', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2012050015', '142322198605060529');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a788bc3a5cd84bd4b03b9a9d66c4347b', '18035833266', '2020181016', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2020181016', '141102199408300041');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a7c884f06bb94ce69edd89e0dbe6aee6', '13834629523', '1994016914', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1994016914', '140104197311092226');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a85295560f6e473686ab2db227797c3f', '13623610505', '2020181006', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2020181006', '140109199309160024');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a885393d963f4a00a344777293efa038', '13834118904', '2005016316', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2005016316', '142601198211181920');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a88a6e3ced3a47118478c282f9fa1bc7', '18735103035', '2010050003', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2010050003', '140502198410142288');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a9190cfa5e864291b87e0ca80d968011', '13393438986', '2004016314', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2004016314', '140102198008195224');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a9216367dcb549a187191ce28f7332c6', '18535199181', '2011050009', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2011050009', '410823198104276222');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'a9e427ea433945dcb0da26076be6b2ad', '15386885821', '2001011247', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2001011247', '140431197704184821');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'aa28f7402e354e648ca04d935f774791', '15386885763', '2001011005', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2001011005', '142326197803064820');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'aa3038ad49b447bc97ed74e1f9879641', '18711067213', '2023505002', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2023505002', '142625199301273314');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'aa61d5c5cdef4884973a26acf8e957cc', '15535365544', '2025503002', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025503002', '142301199408240048');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'aa646bb600e54b25aca8f9631b42d605', '13934669725', '2005020001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2005020001', '140102198207251436');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'aaa5675ee2d24cbebd3316aa5c24a3ec', '15503511010', '2003020003', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2003020003', '142431198010103042');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'aaba13b1bf304d80b991fa92997dc07c', '13994264279', '2002016125', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2002016125', '140102197901235167');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'aac565c3cf7c49c5a51781ec75eb0199', '15935793399', '2012016062', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2012016062', '142629198403071044');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'aaeb2ce90a5e4eedbf3b53f35311e21a', '15195766251', '2022515002', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2022515002', '140109199905255521');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ab000fa1af564d91beb79062e88abfe0', '15234053447', '2014010009', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2014010009', '142431198610032727');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ab108a6edcca49f19401b4d730a50fc2', '18211639550', '2021506004', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2021506004', '410521199406303527');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ab25ee71bde646999dfd126c961f9e32', '19135731015', '2022503001', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2022503001', '360681199608012629');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ab3bb9338b004cbdb812c35b7e1934e5', '13152600917', '2025509002', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025509002', '140481199502066440');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ab5f5a68bbcd4c1287909f68884799d2', '15921836827', '2021506003', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2021506003', '140107198604031228');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ab618871280442eda8bf1742c93a6337', '13803419046', '2004010014', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2004010014', '140103198009153321');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'abac6bdbd61d4130841c8b1a9ee8e670', '13834653623', '2005011016', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2005011016', '140105198311071928');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'abf00ced2fec461eaeb19e8f8ca48c55', '15503635193', '2016010008', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2016010008', '141102198812220049');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ac5a40d1a0f34b768e091c37a57a1dd6', '15135106515', '2023504003', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2023504003', '140623198905150025');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ac5c8089c61b4e669ff9b73da2cb25be', '18636813030', '2012040007', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2012040007', '41058119831013605X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'acb9eee5a58146a68c35fa8bf007e83e', '13303411127', '1999016413', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '1999016413', '14010219750120517X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'acc4f991d0d04f0f9354e25e76f4fdf8', '18835111852', '2024515001', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2024515001', '140581199503270035');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ace7d9e6216841448c40884c35134e83', '13834558257', '1994016406', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '1994016406', '140202197007251029');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ad274f2182d746e190685cec1caa6f82', '17735108767', '2003020002', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2003020002', '140102198005135226');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'adec12d28e0a4948b01e3b151e6737e1', '13934587023', '2004020004', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2004020004', '220104196604212661');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ae473d9ebc804787bd21565044f62bc1', '13835141287', '2008016930', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2008016930', '140105198302030016');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ae6598bebe0b49d7a58489cd41a6e649', '13903417357', '1993016003', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '1993016003', '140103197108184225');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ae6f7ece06bc4946b8c0e089dc08f1ea', '13834118577', '2014217005', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2014217005', '140103196806270652');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ae7d20cc37dc494e9436ff6660956388', '15834147269', '2008011002', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2008011002', '140102198107251420');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ae966f1b6eb64d24bc8ed06c4e159bc4', '18335192711', '2019060004', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2019060004', '14010619930607181X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ae9fe3ab2ac744bf964f9432865f67a2', '13653640666', '2003046000', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2003046000', '140122198312100010');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'aee5b4113c2f4f29b80a5ef38921bba5', '18536896626', '2008011216', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2008011216', '140402198302100421');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'af6b0e2aaed34c039bb5f13e70e1d984', '13191080921', '2022218001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2022218001', '140421199309231217');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'af6bd8ae1d6044b0a2bdad4813f87e99', '15503685707', '1998011001', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1998011001', '142401197604055524');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b0216b78624b4bfa81539da90853e4e6', '13835175817', '2011011011', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2011011011', '140102197808301414');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b0591da7225f4c0eb80459334180b36c', '15035147683', '2009040132', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2009040132', '140102198209106515');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b0a3ab9de81b47f296b05eaa53640803', '15034199587', '2011010189', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2011010189', '142223198503062428');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b0ae5ca294714f1cb995ee1303be055d', '13834137593', '2005016920', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2005016920', '140225198104123749');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b0c9c65ec129420489b822e9e40669d0', '15235190164', '2013050009', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2013050009', '140109198704295522');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b0fdd1f8595b4e81a91172f5691d77ca', '13653689939', '2007016152', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2007016152', '140105198312291885');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b1040971adea41d78ecf632e1e23bb9a', '18835116009', '2002010004', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2002010004', '142623198011256121');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b10d5813720f47cf8cfd4f8304dfccaf', '15735174882', '2025509003', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025509003', '370782199511107633');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b13750676f144efdb475958154c4047a', '18535537116', '2022210002', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2022210002', '140402199611160422');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b139e8983a96495a805ae33a16a0dd28', '18234081877', '2025504001', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025504001', '13080219930107166X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b148fbe416ac425eb8eee49922ae8896', '15513686129', '2014016745', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2014016745', '142401198901291448');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b14fb02d9e5840569d2bede396b0462d', '18835165968', '2007050003', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2007050003', '140203197812106226');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b18c4924ce1a4795a9bb5730e8d1c19d', '15735187655', '2020181018', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2020181018', '140203199411092328');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b22d2ec1edd84eaf9a036fa306e0c06f', '13994211255', '2002010011', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2002010011', '652322198010020528');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b2740aac05d44e81b2bc9b6973dbcd10', '13613484784', '2014016746', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2014016746', '140104197605161725');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b2aa194d6a5644a68a513577f3b4f655', '13546382686', '2007016157', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2007016157', '140105198005141326');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b2b1018a69644b2ebe640562385e23be', '15834186036', '1999016213', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1999016213', '149001197611281217');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b2c68806639d4289bee43cf10ae178ef', '13934246162', '1993010001', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1993010001', '142222197102090910');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b2c70bfe68774997b01477f5b49bacb6', '13994265234', '1990016206', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1990016206', '142601196810021946');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b2cb5671e6994798b155dca7a22aabd2', '13834643730', '2001016009', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2001016009', '142323197810290229');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b38ca71b88774cc89652b9f3a91a09f4', '13834661160', '2002010006', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2002010006', '142402198010090024');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b396f1b8f62b405fb0e8e81750869d75', '18603470112', '2011050022', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2011050022', '140102198201121462');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b39ec800f69b47a0b399af20d023ece3', '13834226853', '1995020002', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '1995020002', '140102197102200013');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b3d5729f0a1f48c6981aba826e87701f', '13513519983', '1993020001', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '1993020001', '632801197006160533');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b3dc2d7bac6d4b94a8da69dbb4fda6ba', '13903409266', '2013050011', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2013050011', '140107198710131249');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b3ee77dff6ef45658109fd65c45ec6ec', '18636886276', '2012040009', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2012040009', '14010519861212291X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b409268c68b64aac9793ad2b6766c95d', '13753154965', '2008011284', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2008011284', '142701198303201349');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b43862789e29451ebea0005306825915', '15834058499', '2012050004', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2012050004', '140108198609192510');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b43e84c7dddf4043b306393f285288bb', '13513631061', '2025531002', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025531002', '220302198911050428');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b48b6520f7a247ce8753c5ecb774522d', '15513029210', '2022206028', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2022206028', '130982198809061123');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b4981730fd0c4d04bdc5d8a523649e47', '19857184231', '2021506001', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2021506001', '140109199006251527');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b4d9464a0cfc4541b3bf48d6879fa39e', '15386885710', '2003011007', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2003011007', '140311198109163325');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b52c7e23a8f74ce48d71b389392702d7', '15535360721', '2021504003', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021504003', '142731199108205726');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b54cf224f79a478e9064b50b437d79d1', '18335191788', '2024515002', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2024515002', '142422199407212421');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b5c65d25f7e44eca86e6c1a7ca1e4e76', '13834637123', '2005011039', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2005011039', '140103198205144211');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b64305a25fbe418d89550f9f8e69ed34', '15034135952', '2020112004', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2020112004', '140721199105310083');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b64be0ae70c34e478361f7d27b65ecd5', '15635185939', '2020181028', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2020181028', '140105199409200024');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b67e84bd99bf4214b22076a7987a9646', '13835156611', '2013046102', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2013046102', '140102197711282341');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b6b5a5eadb5940beb924a252d8fbe728', '18734824916', '2006016248', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2006016248', '140102198002032328');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b6c69a709ac34b1eacabf52cf5374cfd', '13643693064', '2012050011', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2012050011', '142621198807120040');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b7042b7bd5814f2b99c560079d334864', '15535100333', '2014217011', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2014217011', '120102198410314128');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b7347ae978d342c99c5ff50888b00a79', '13803405291', '2006040002', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2006040002', '140102197907111421');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b7405e28bc874287b31bb2bef2f85587', '18636991081', '2020181005', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2020181005', '140108199305114227');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b779c1967e044b5eb32e268435e6fcd6', '13934518972', '1997016711', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '1997016711', '140103197402170027');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b7a8edc1d6fd4cdf8036bd6c03eec34d', '13703577763', '2022213003', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2022213003', '142725198811012422');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b832b5e52eb049868998972c69a2c339', '13700508503', '1998016155', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '1998016155', '140102197710246517');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b8578c72c84d47e8a6f02b55eda0c168', '13834644339', '2014215001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2014215001', '14010319811109572X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b88976c448a74d05a9708619e02c457a', '13700545407', '2003011008', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2003011008', '140102198101274015');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b8934fd5561c4a56a32d523e2a6a07a3', '13754891864', '2006040147', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2006040147', '140106198407171217');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b8a977125fd9434e9a4616094f137c93', '17853965699', '2022206002', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2022206002', '371325199610100519');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b913d596d8294058801f5c3c140da99d', '18335120968', '2020808002', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2020808002', '140402198308251247');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b96bd8b6d77e4a889d787a45c03fb21d', '13834040639', '2002016016', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2002016016', '140102197910265165');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b9af720ad33447b6aa3b6f220e2c020c', '13703583118', '2004016922', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2004016922', '140121197804180028');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'b9c3faac38d04494944e31ab6af7cf73', '15386885621', '2014207004', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2014207004', '140109196707270014');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ba1aaf233d624e15a4b9bb7a79327406', '13834633589', '1999010001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '1999010001', '140103196701191544');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ba4c2d5e6e98483c91fb3cd0b62c083e', '13734011919', '2010100005', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2010100005', '140107198703194815');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ba991f127c134ed2ae874a8d9a474fae', '19934976606', '2023210001', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2023210001', '654028199911040807');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ba993bca881c4cdc89067195555b2e96', '15386885695', '2010040162', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2010040162', '142401198906281425');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'bab4a22b08bf41e188b79396f37f19f8', '13935151944', '1996016211', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1996016211', '140102197210236021');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'bb04ab33db9443fd99ca69cd96028727', '18603445226', '2010010002', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2010010002', '140103198211041526');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'bb88c46c7dc046e5a31316326d674724', '13546362717', '2012050005', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2012050005', '140430198401290027');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'bb95600eea2146a8a3e6daac3e5bf88b', '15343400967', '2014016747', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2014016747', '140123198312240220');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'bb968584f8af4645aeaa11abc4bb1b2e', '13653415896', '2011050013', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2011050013', '140102198211022329');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'bba10b4df55141d6ac47f91d72ff087e', '13633415032', '2013046002', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2013046002', '142325198009050016');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'bbb1d3c0c96747458194a9189848c10a', '18635570591', '2007016735', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2007016735', '140121198402290624');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'bbe5d107098345f3a8a8c2d3b0253659', '13466805670', '2006016224', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2006016224', '140481198306063627');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'bcac9cf8b3de46c18ee23ecb1eeec658', '18635943760', '2025501004', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025501004', '142723199103180638');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'bcb28d9774564512ad41388510a37d43', '18636933144', '2007010002', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2007010002', '140602197909058617');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'bcb68814bade46a4ba0869748664666b', '18636886688', '2024209001', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2024209001', '14240119780707141X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'bcd6f5edee5748259d162b5b2c4277de', '13099098068', '2000016309', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2000016309', '142322197707211012');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'bcf64c7474f347dca97981eca21b4b32', '18810961289', '2023501001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2023501001', '14112219940820010X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'bd2dce354b1e4dad82e1eb61cecd8894', '15735161102', '2021506005', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2021506005', '142431198908014812');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'bd805de07a874adeaeae76321da7c587', '15503447709', '2007016134', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2007016134', '142322197808146547');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'bda6d7e493ce4daf828cccd1b461fd0e', '13834238887', '2025218001', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025218001', '140103197804252412');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'bdb50a0c936f418aa41e165110355574', '17582951180', '2022206006', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2022206006', '142333199112191815');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'bdb99966fba1498bacd8d15560c22dd8', '13994218342', '2002011248', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2002011248', '142430198102110024');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'bdbf3db605ae47a4bae1e4c6ececd418', '13834501193', '1995016715', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '1995016715', '140102198004223443');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'bde907d92fc94e3fa878098e04783551', '13803456214', '1996020002', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1996020002', '142732197207263224');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'be09719bd3a647bb95537f47d1090a69', '18035178029', '1996016527', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '1996016527', '140105197205073714');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'be697d74869742538d35f0040dc94fc5', '15386885760', '2001011003', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2001011003', '14032119771229271X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'be73b06788834113bab291850b7ca1f8', '18234088850', '2014010015', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2014010015', '142222198809110027');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'be7614cbd8514a648068b10eb858f303', '18235786221', '2023112004', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2023112004', '140107199208050616');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'be9cea5cf7b64054bb7b8d9ce1e0ded0', '13834210503', '2004020003', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2004020003', '142726198109240026');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'bec19f46aa894bd6a8068879de858a7b', '18649513800', '2006016040', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2006016040', '142430198205290021');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'bee6fddd0fa1474a8cbd64045816950b', '13593165868', '2003040143', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2003040143', '140104198107294511');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'bf07d4cf076a4878a9dff72adbcc3567', '15603511688', '2003040003', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2003040003', '140102197408103224');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'bf497708f5884b34bc4c4832a795136d', '13513600478', '1996056004', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1996056004', '140103197801095722');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'bfa4e7b5dd854386bad74c283054d0ed', '13466803609', '2012040005', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2012040005', '140105198201051846');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'bfcc742822e44b8c8aa7adc32e4bb54b', '13903419126', '2008010181', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2008010181', '140122198210220011');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'bfe71e5b1a2343b595db4271b83ceb37', '13593199277', '2000011004', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2000011004', '142202197708062476');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c06d9c64b4924aeaa3673f57bf48f50d', '13593132521', '2004010003', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2004010003', '142724197809061945');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c07013b279424e078c24f15615546b7f', '18636648076', '1998010001', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '1998010001', '142223197408142724');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c07e4507c64e48a886101f61ae1261d8', '18603458359', '2000016149', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2000016149', '140102198006076547');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c14f0d060243477ebaed7406039d4121', '13934530825', '2007050005', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2007050005', '140102198207113420');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c1693434f19c4bd2acfbe56d3ddd7239', '13466878833', '2020181034', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2020181034', '140121199503078029');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c1863c8b47a242b29f6b5d272d4aa499', '15513681983', '2006020006', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2006020006', '140106198301160624');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c1872ff117fc47beb7784ad32317be62', '13994265220', '1994010002', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '1994010002', '142224197110080029');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c1902ca4c47047b8a24955d4c873297e', '13994272143', '2013050004', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2013050004', '142228198712060017');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c1b96303bef649b3a2009f5c58b48c61', '15934128775', '2011050010', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2011050010', '140302198106161352');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c1e649a135094e33b88995eda5e1384b', '13453433763', '2005010002', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2005010002', '142424198107223522');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c1f90c7bb953499eae0188fe15686e62', '13835160331', '2012050014', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2012050014', '140123198504073914');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c24f3af0d774439b9116f70b7310ab24', '18835138800', '2000046015', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2000046015', '140102198007256523');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c25bc62ba3c041a7980462022ccff88f', '18640987425', '2021206021', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021206021', '140603199709219987');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c2721a6b671446a78da738d0e11453da', '13803468798', '2002016616', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2002016616', '142430197605180417');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c285c428baa144b5a8f660241bf9d700', '13834696107', '2008011017', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2008011017', '140103198012130622');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c2953093f3884eaabed4bf344a74a401', '13834640730', '2005016035', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2005016035', '140103198203161245');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c2f181892212441f8fab830e0f8926a9', '13934563986', '1990016109', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1990016109', '140102196812060727');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c2f82245c6d344118abab21834340c97', '13934505177', '2003010007', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2003010007', '140102196901182128');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c3242486373a499eab1d4a82ba2ffcbf', '13007077677', '1996050001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1996050001', '140431197303233629');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c35c74e37314471b8ef1ed717de8d53e', '15135160188', '200511016', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '200511016', '14010719830608222X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c37e58fffb8249c1868d6cb8445c2ad1', '13103510068', '2021206040', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021206040', '140107199407040015');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c39c240867bd451f85e53408964e354d', '15386885552', '2005040157', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2005040157', '140102198207230010');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c3c685369d834b698dc8935278ddaff8', '13994260644', '2005020004', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2005020004', '142726198204061579');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c437c462a871481f901abc35a5841109', '13934239433', '1990046001', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '1990046001', '140102197105086519');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c45e5f58cfeb4597889236b51515bd5c', '15386885683', '1995011003', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1995011003', '142223197607243915');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c482b1eceff7429d8a53bb15fd57163e', '13333413918', '2009016628', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2009016628', '440981198410086173');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c4a96eb4abfb42758798e0c4d06aa1a3', '15163752301', '2020181031', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2020181031', '370882199302234228');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c4e22717584b4d0da3f87c506d90f195', '18103514196', '2004016428', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2004016428', '142401198301302422');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c59e31d57cc4490886b2a5633446cc15', '13934558554', '2001010001', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2001010001', '142222197812100335');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c5ac87ce237e4146b8e4a0ae430ce620', '13834548502', '2005016017', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2005016017', '140603198008161618');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c5b1ad0f459d4f428dc8a67fa6ec3803', '18636185312', '2010010001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2010010001', '140225197901234914');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c5b99e2af9004994a339f4b2aceb3f47', '13754850226', '2006016431', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2006016431', '140121198204123526');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c5e35c46c3bc45c2bb636950a469dd12', '15834186298', '2016010009', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2016010009', '140107198402281720');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c6182dd09fe549689a33bea19427d429', '13753120475', '2005010006', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2005010006', '14031119810920182X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c624e7d1080047bab1f9d2190924a0db', '13834206109', '2021206018', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021206018', '140107198808081729');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c6338d18fd204cf19ede604e448e8355', '13571849081', '2020181008', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2020181008', '142301199311010027');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c64681fa82af4582b203da8fca38f351', '15536505136', '2013050007', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2013050007', '142635198201191213');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c6991d0210a7488d8cbbb3a4d3241b41', '15903411345', '2001016144', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2001016144', '140104197108071761');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c69c4a871eae4c01bfd468615a9f8c4f', '13027096661', '2006016019', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2006016019', '140102198009096527');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c6b3f72cd1e4403a8fb97eae8860e2ff', '18734926950', '2021501001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021501001', '140107198506153918');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c7185901153e47428cfddbb80c1602e5', '18003469209', '2020181020', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2020181020', '14260119950909404X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c72b672ffffe4de4851933836af877d1', '13546722911', '2011050006', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2011050006', '140106198301200614');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c77a9e35695047a2b7a1927019704c3c', '13934248336', '1994016507', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '1994016507', '140102196908135172');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c7b62eeb0eb64b9a93b3c7b61abff536', '18234177075', '2020181027', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2020181027', '140427199402158147');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c7c56df8c7c0437f9591f7862ac9eb0c', '18703512415', '2008046006', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2008046006', '140121198402072520');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c82196a7d76b464bb5aa77b68dee8725', '18603461015', '2004011037', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2004011037', '14010219801222514X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c834fd99263b49c482781ed25dbafafc', '17601280149', '2025509001', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025509001', '342427199502065545');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c840ef2a7d7c4a02b96d088a606b92f0', '15035144259', '2021206004', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2021206004', '140107199509124527');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c8b9076887bf42b1a1084209ad30c4c4', '15386885915', '2008011209', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2008011209', '140108198210112523');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c8ed380dc1dd4006a328f337d5b6198e', '13015470289', '2020107001', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2020107001', '142201197902029120');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c913fc072c2642189045d1f8ab3ee4d3', '19511406200', '2021206003', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2021206003', '140122199008101742');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c92609cd424049abb6a1442db861b6de', '15235187995', '2022206022', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2022206022', '142731199010270327');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c938100d518f47fb82647adc737184fb', '13663519973', '2010010010', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2010010010', '140104197311241762');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c95e31ce10f646a683ece61ba2378a35', '15388518506', '2021504007', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021504007', '140226199206103045');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c9660cbd42bc42cd9b81abab24260f0c', '13007048945', '1990050001', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '1990050001', '140103196802053335');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c9aa47a87b0c47a7a27d09c8deba79f9', '17735754726', '2021206016', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2021206016', '140105199512222918');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c9c414a5d447484daeef01c5799dd80f', '13803435781', '1992040145', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1992040145', '140104197209211735');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c9e0c2e952374b2eb5f6b13ba08e69be', '15364965777', '2007020002', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2007020002', '23108419781220001X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c9e337ca3fa842ab92dfabf40087c648', '13703580882', '1992010001', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1992010001', '140106196901311220');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c9e36fc5abf5471b96ff0f4e8601dd71', '18435101976', '2020115001', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2020115001', '14060319941222542X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c9e9701ee4524f7dadc01331846199b6', '13513606131', '2000010006', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2000010006', '140303197605040047');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'c9f6b4d9882d4835b07220f97b24f3c0', '15235171062', '2013016748', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2013016748', '142732198611210428');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ca1cd7551fc842788c463d57422caf7f', '19135125218', '2007040122', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2007040122', '140102198208161440');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'caa80c53378342898a0c4de7b9725362', '13834676654', '2002010010', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2002010010', '140522198009080020');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'cacb91330db74adc893b84c7898dcdac', '13613461260', '1993016510', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '1993016510', '14010519700610504X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'cbd1a116d7e446de80630bd551c5ab56', '15991767850', '2023503002', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2023503002', '370112198701185150');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'cc3d348ab4bc4366a117ced1bf381859', '13593181654', '2005016519', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2005016519', '140102198108172310');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'cc442dc9abcb47df819d2af551f66eb3', '15386885833', '1995011339', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '1995011339', '140123197510260025');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'cc60dcf6af7f40efa626cae8cd6c3236', '13834544219', '2007016012', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2007016012', '142202197811070968');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'cc94d58b45e842a7a0167b890711c492', '15135129908', '2001016008', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2001016008', '140202197709080527');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'cca980bcf0eb45ca8f272d7b48f40ce2', '15536914044', '2019090101', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2019090101', '140110199005071028');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ccd6870d60094fa8b3d77ba56ea1993e', '13934636022', '2007016928', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2007016928', '142301198410193127');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'cd5ce4cdbf384889a8a3872005f25065', '18834805667', '2023503003', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2023503003', '130526199407024612');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'cde0b387072d4a07a9a5983889363faf', '15386885588', '1997040112', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1997040112', '140102197602270050');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'cde3ae0c974647a89721c65b3d36bc11', '13834612128', '2000040105', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2000040105', '411102198103205669');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ce01c0c8a90a4804946666c125eac974', '15034001747', '2021206037', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2021206037', '140109199608190565');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ce408566237a4bcaacb0e9ca075bf689', '13834222869', '2006046001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2006046001', '140102198110235165');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ce6d621619e547c2b6a6f5e4a7b72baa', '13834659285', '2004010009', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2004010009', '142329197509230022');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'cee8580cd9ed474cbf998e7d4f46795c', '15935614884', '2007050007', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2007050007', '140103198207173913');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'cef05ab038de4f2bb4d9a60b7492a8d2', '15735181577', '2021206020', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021206020', '140524199602133020');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'cf04600a928b41749777febddaa4ce81', '13934647921', '1998040153', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1998040153', '140103197512050632');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'cf0a71306c22416a961234ae0d81a328', '15698575888', '2006020005', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2006020005', '14010219811118702X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'cf3bc872d027491c9bc80ad360112c1e', '13753177345', '2014010008', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2014010008', '140106198701210029');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'cf4803b73fd24c93b5a25a1cd5d4a027', '13512211612', '2023511004', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2023511004', '142723199506050029');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'cf5f4f5238f945189c8d6d9323b25cfd', '18636691983', '2009016051', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2009016051', '140109198310110521');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'cfb5e3d0b9394374ad48e0831672cc02', '13994263721', '2001010002', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2001010002', '140102197712201486');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd003a094dc79403abdadd0deef5aec25', '13453168950', '1999010002', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1999010002', '142701197712011277');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd006283c4d7a438e97ed0a8c13998863', '15386885718', '1993011008', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1993011008', '142701197101101222');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd00c4bbeb242467cbd354b2c0bd4b82b', '18734823495', '2022206017', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2022206017', '140423199201032016');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd02d9286d2ce41d4a82bcd8cfe01c48a', '13453151881', '2004020002', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2004020002', '142701198209071250');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd079fee3695f4da89ee056c690f37b02', '13663619698', '2007011214', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2007011214', '140106198310100615');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd098c261f395428cb053c2075c1d51aa', '15386885688', '2002011005', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2002011005', '142702197911295512');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd0c02106d62043119967a10550b69f55', '13934514397', '2008011343', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2008011343', '140103198012060628');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd0f9b8bb7e6c4a26931911292496fea9', '13383410118', '1988040151', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '1988040151', '140103196708150657');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd10f15bd2f654e2aad3b8bd367fe7834', '15343405888', '2001016418', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2001016418', '140102197810240016');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd1250b4fd8a54dc4b3e5a45813fcf95a', '18883720662', '2020104002', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2020104002', '14022319930903002X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd12c2dee73544267bd833ce26fdba2f9', '18735104344', '2020112005', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2020112005', '142332199108243620');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd1eb0b3947554f019b7d4d1fa271129b', '18235114787', '2021206002', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2021206002', '142431199308077515');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd21ba643b13442ad9540c9a58820ec9f', '15386885738', '2005011012', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2005011012', '140121198204019024');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd2957669aa8e4edeb9ee813f3b2a3070', '18536667003', '2007040160', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2007040160', '142723198409043025');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd2d0af4bea744dd0b12de2d0c4c8944e', '13613446255', '2007016037', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2007016037', '140402198204280019');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd2d7f998bdb442809584c4543729a123', '13133207745', '2021206007', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2021206007', '142226199603221223');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd2e99f5c9fa54354937fd5e5df81ac01', '13935110517', '2006016223', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2006016223', '142332198305120019');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd2f2810e1c464a55b110b5c2b5495821', '18636930000', '2014217006', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2014217006', '140105198805071821');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd3724e089f6947b3b56cbeb8c17f8d4a', '18603512158', '2007011022', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2007011022', '140107198310080024');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd37b4c72ad11474b9f0dfa89da3acebc', '15513807477', '1999011002', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1999011002', '14052219760721002X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd3a5feb56105440c80503618a6b1d6a5', '13623476111', '2012040012', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2012040012', '142327197402043785');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd4122fe9923f4df99e567f46177577fa', '13753177426', '2012040011', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2012040011', '140107198209200626');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd41bcb8b060b458cb806d4674873dd4d', '15035191185', '2006016047', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2006016047', '140181198406034720');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd4c006d45f574a1186771fe783275d60', '13485310792', '2014401001', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2014401001', '140102197106240012');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd4dfeb59be5440ad87005ffc2e33bbeb', '18636120891', '2010010004', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2010010004', '140226198111137045');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd51e38c300d04a31a33beba7ffd1dbee', '17582965118', '2023501004', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2023501004', '142732199509211621');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd52d94512327440e9f3e64d8d98461e8', '17646719596', '2023505010', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2023505010', '142601199509062822');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd57ed1bc36174f93baad940c436aa94a', '18636615683', '2008016319', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2008016319', '140106198305052524');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd5b140a774d14b6184550797e15352ba', '18003517580', '1984016141', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1984016141', '140102196511282326');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd5fc0bc83be444f8b722beb1c52e60e6', '13453154845', '2007016318', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2007016318', '140122198410230126');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd68511af93914bc2b9dd63efac38990c', '13753166699', '1999010004', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1999010004', '142427197512241227');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd687125dce274949b454ab181e969780', '15536808785', '2011050016', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2011050016', '140105198312210547');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd69c9aa98a624f01a43f69af987f7137', '15698333809', '1991016303', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '1991016303', '14010219691215232X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd6f9cb965b984ef2b97c6ded3cabea60', '13834620576', '1992016726', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '1992016726', '140102196911124810');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd6faca83e283444790c2160347d10fcf', '15735174854', '2021504006', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021504006', '142322199009184028');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd7247780c68a43498aa020c179bf0958', '13803499745', '2005056000', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2005056000', '140123198306300215');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd726b4e6f68e494f8e75a45f3fd0d2ba', '15303516861', '2007011213', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2007011213', '140106198405100028');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd79826d7fb3845cb80cc60527c46d850', '13593132868', '2002010007', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2002010007', '140103198001190021');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd7d25b2fb4db46799e9af5197eae084e', '13037032625', '2022206001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2022206001', '140602199111079039');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd7d57e1e2ac245439909f482517be15a', '18234077091', '2020112001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2020112001', '140481199309116581');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd81d4fdb38644b9f92549d5ed30b5909', '15135361668', '2023209002', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2023209002', '142601196805241936');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd876d20b5a9c47c99c40602ccf2562c5', '13994215628', '2005020007', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2005020007', '140106198203171928');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd8ae8cb716f443aaadd2f478e420fc9c', '15834054467', '1992040146', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1992040146', '140104197103073717');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd8bc67d9278247eeb13ddfda892cdad3', '18435203214', '2021206034', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2021206034', '142325199610017510');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd8ffd02d1fe04e7f9d6ced8555669d69', '15835104599', '2001010003', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2001010003', '140402198002191624');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd933ce80edd14afc911c8ad151b8fd81', '19834505852', '2021206014', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021206014', '140105199511050552');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd9a0ec56101a4b8a9b8992be58705451', '15034083526', '2022206014', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2022206014', '140108199606194224');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'd9cf63f73b684ce48dbfdc6108fb51b9', '15386885705', '2005011019', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2005011019', '140202198109302549');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'da3206ca27634c2db8df894439b07e40', '13620613260', '2007010006', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2007010006', '142331198107090529');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'da42d28d34334923a42e8741cad018e6', '18635329972', '2022511001', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2022511001', '140511198706236044');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'da4c9c8c567f4c7e888febdb05d75b59', '17671747100', '2023210002', '', 1, 0, 0, '2026-01-29 01:31:05.226645', NULL, '2023210002', '652723200006070723');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'dabdb5762c274cf0a414b6ff927a868a', '13935105575', '2005016126', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2005016126', '140102198012040022');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'dac2aee1f392499c85fdb91491042e3a', '13934241386', '2004010006', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2004010006', '140103198108201528');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'dad462621de048b18862c9c0d0ae9fa6', '13934225150', '2006010009', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2006010009', '210203196908075261');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'db624190e5514054b53c7ab9792b0146', '18234116963', '2014010005', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2014010005', '142623198912055546');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'db800a3396a746ca82d7087b969b9a62', '13903412401', '2000010005', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2000010005', '142424197709156510');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'db8239d89b3b4d9489f7d4c59fd38402', '18135117881', '2014207003', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2014207003', '372925197703216515');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'dbd77927e1f54b5c859f0d708f087a5c', '13834661180', '2002010008', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2002010008', '140522198005140049');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'dc14df82db6543718d6e279590d84644', '18598251551', '2021502002', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021502002', '130121198811123817');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'dc17c3d9df9c4024a2d73aacd5696371', '15934130608', '2004016927', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2004016927', '140322197907140018');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'dc25b076c63344d28ec162a2cea2b4d4', '13230938654', '2022503002', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2022503002', '130406199210270616');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'dd0ad4058362450a97def9d5e77863d0', '13934595482', '1995020004', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '1995020004', '142724197203181256');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'dd0d20f2be424893bd634bbb0799bb87', '13935173244', '1999010003', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1999010003', '142601197710031922');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'dd284a265fe44c5d9cb6b45662787a87', '13513644502', '2008016434', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2008016434', '14043019791118844X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'dd48a0f55b514ffd9b56010937ea6801', '13834680973', '2008011313', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2008011313', '140110198601230027');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'dd8da3bd1a98461fb7054cf1d8cc054c', '18234018881', '2003016424', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2003016424', '140104198009280378');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ddd0b5db8e0941b6a81bf41895f1a799', '15503510525', '2023502005', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2023502005', '141181199405270268');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ddf92508f86643bd909bb452162db55d', '13835116724', '2007016923', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2007016923', '140103198005221518');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'de0b408e56194b86bc5765a5c2de341e', '13453439168', '2003026004', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2003026004', '140181198204112823');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'de4d35bdb4094c829773570e2b07470b', '15386885735', '2015012005', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2015012005', '142601198003051929');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'de8aa5f8f4a4457e98f4b41e1afecbfc', '13633459997', '1994010001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '1994010001', '140102197108110641');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'dec3ebe18d34468b9801d4063c59c2b5', '18634346229', '2005120006', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2005120006', '140103197908220669');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'decb91ef432d4327a0ea90841a02a263', '13934544689', '2000010001', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2000010001', '140102197704222340');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'df2c0645a09b494194c327e6d1f3d9bf', '15313736117', '2023504001', '', 1, 0, 0, '2026-01-29 01:31:05.226645', NULL, '2023504001', '14112219881010009X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'df4f01755ef047e78b8b24c1cbcf8b10', '15034068498', '2016010005', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2016010005', '140108199106241223');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'df51d4a42e5b46b49da2ea11c8ec0a00', '18603512868', '2000016121', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2000016121', '140102197706281440');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'dfd01efba6974cc2bdfa45853dfc2149', '19935516388', '2022206013', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2022206013', '141122199604080061');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'dfd64e3141944f939bf42494709c317b', '13703533003', '2021508002', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2021508002', '140103197710206327');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e0279711aa544462a209a753bced1d41', '18635113360', '2003016213', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2003016213', '140303197912050026');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e02a7d9415174605af2cc9c5d659247e', '15386885675', '1995011148', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '1995011148', '140103197305110647');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e0ec47f55a2a48ea82b5be658c4bb291', '13613516884', '2022504001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2022504001', '140603199404031027');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e0ff4424652643a1a35b970f7b64c80f', '13161815674', '2020113001', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2020113001', '140121199109130829');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e14e9630f2864d1db4b5fee8a2da6642', '17806255297', '2020114004', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2020114004', '140430199407080025');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e1c7108b5e56484f88047cdd86a4e934', '18235515961', '2021206022', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021206022', '140427199502048033');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e1ee67306305489890b682a9c3b03a7b', '15110429657', '2002011290', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2002011290', '142631198009154927');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e208635f38634782b795ded68750ec85', '13994257880', '2006016219', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2006016219', '14030219820829042X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e298b6745ab945deb5ec4f349096ed96', '13703587531', '2001016730', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2001016730', '142431197606271536');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e344c61b940f4599a7b702c3915c16c1', '13834230246', '2004020010', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2004020010', '420623198209054053');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e38ebfd5b02c43a5a66f2b06d5ac2801', '15333439273', '1998016414', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '1998016414', '142429197603210023');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e3ae8bc002974f04a6eb6fe25aefbe95', '13753137275', '2008011342', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2008011342', '140112198211211421');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e3bd563ee3d54b779323fc129eb63098', '18636660330', '2006011310', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2006011310', '140102198103231422');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e41e1c4f3902464c9e12012cb578973b', '15386885907', '2007011204', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2007011204', '140105198307170042');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e461c9f77b1c4c7db24b9e0cc95e214f', '15620672120', '2020181030', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2020181030', '140202199511045020');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e463f1abeac8491aa813fd7bc3b40283', '13753184192', '2003046005', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2003046005', '140112198109023010');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e4719127d4ba4519a4b6de9272c4b683', '13593143033', '2003011009', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2003011009', '140103198003203922');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e499f8a981884efea1b05f92b6858bbb', '15803431035', '2025502002', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025502002', '140107199408263317');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e4a83d64bd94423f80782d05bbe19bca', '13903438283', '2011010002', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2011010002', '14042919781115321X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e557cb9ce1624f0da7e3a90c09459a1d', '13623516208', '1992050001', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '1992050001', '140102196904285173');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e55b7290153e4b1e961197114858c5a7', '15333608483', '2013050005', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2013050005', '142232198402080017');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e560516d3c8049759825e36d2b1a498c', '13934234965', '2000016500', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2000016500', '140103197804024217');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e59092a655be4175871c644e559cdea9', '15035682897', '2020181001', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2020181001', '142302199102160017');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e5b263ff4f174c8bbca8077a04d7117f', '18322694344', '2020108002', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2020108002', '142303199301284529');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e5c47ab4d90447f994917d7a56343220', '15834039679', '2005016425', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2005016425', '142302198107230542');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e5cd678d517544ceb5a1e7b2745beae9', '15333010171', '2007040141', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2007040141', '140107198311252238');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e5d52acc63d94e69ae9432229d95b255', '15834054888', '2009060003', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2009060003', '320324198206184481');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e6335bdef7b44661a10371d985d8e3f5', '18735196988', '2022515001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2022515001', '140103197506235710');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e682b493fc7646e189903c0ab3229c92', '13934576653', '2017011005', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2017011005', '140105199006190036');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e68fd14bd39b4532a6a39bb6256be145', '15033563302', '2023513001', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2023513001', '140423199305230826');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e690095e9b664f87ab4e12dc48708c2d', '13209827386', '1995016113', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1995016113', '140103197201100620');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e6c9fcca2c6040fbad19c248db84870a', '13623518884', '2003046002', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2003046002', '140102198009250635');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e70aeb20de0a4d898e480d93e58b8a6c', '13485357352', '2012010010', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2012010010', '140122198505281129');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e714662ad51f416ebfe6eb2b481153c3', '13546477946', '2014010010', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2014010010', '140105198706030530');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e716a32695cb4918b184f07f76349d9f', '18636856427', '2021504001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021504001', '140107199208100046');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e7a1af2e21fd4b6cb26d9dc08458f39a', '13593169320', '2003011006', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2003011006', '140311198004040628');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e83950b8ae4b4837af16cfd9cfe74e03', '13111056673', '1989040001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1989040001', '140103196911152121');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e8515ea49a644a7290cdd40347c49260', '13935182169', '2021209002', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2021209002', '120225197210292070');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e8539a15917648c0b626e69ff58c7714', '15386885806', '2002011242', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2002011242', '142423197903040021');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e8bedb4f5f06460d86991e57faeba5d2', '13994271609', '1996016005', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '1996016005', '14010219730218488X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e8cf14b6923c41df8e86606d63765dd1', '13934237839', '1990016006', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '1990016006', '140202197505124022');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e9196e6a171f43dcbca60cdcb2cf9461', '13753487578', '2016030111', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2016030111', '140106198306260018');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e91bf19dcc464ac2a8729c0598962228', '13934245397', '2008011259', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2008011259', '140106198504062522');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e92c8044f50a4ee3bedaf94990a6a6a8', '13015343040', '2007050001', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2007050001', '432503198305215016');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'e9ae6235e0454802bed100ec0a91186d', '18734892991', '2011050012', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2011050012', '14010219771001322X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ea06eaa4499d4d109853070069aff240', '17503436217', '1998016528', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '1998016528', '140102197510206510');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ea432a6b9797473da414a40ea3df1513', '13038006545', '1998020001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1998020001', '142225197606075510');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'eab368e79e934b248639e3cfe2c51801', '13453199213', '2023515001', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2023515001', '142430197908101210');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'eaef757582a44a27a82fca5a6b1b9f16', '18734140416', '2014010002', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2014010002', '142729198905110643');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'eb008c43289d4119af86c606cbf70d47', '13403434032', '2005040001', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2005040001', '140102196911262367');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'eb86ccf4cf5a427ea54be186c7160deb', '18636605571', '1995016410', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '1995016410', '142432197303030029');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'eb86e3011dcd4362ab505525532cad69', '13063212505', '2022504002', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2022504002', '140402198507310414');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ebb835a25f9649d0a459c6b8c6aa0f31', '18734130410', '2023503005', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2023503005', '140602198711296016');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ec839c5aede647f58fb2c875252d54c4', '13934628798', '2013050019', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2013050019', '140108198410010812');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'eca35de6136f4ba5934a6746303735c8', '13753494157', '2006016033', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2006016033', '142232198201260468');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ecaefeb39ca34360b7c5011fec0973d5', '13623638080', '2005050002', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2005050002', '140107198203061223');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ed15bd7f19674d8cb31b27077f480160', '13934563177', '2022206027', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2022206027', '140702199210207134');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ed495e91b5614a699ef2283052f11d6e', '15234251166', '2012050008', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2012050008', '142302198211241065');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ed5194c03a07455e98d8119daab9f456', '13015375592', '1987016704', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '1987016704', '140103196512205740');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ed5f15b1a82d43fcbd68cf23ff4ed9d1', '15203404408', '2022206003', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2022206003', '140105199210122233');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'edda0df7b22148108bf9fb4a7971e8d3', '15834060369', '2022206015', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2022206015', '142433199111140026');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ef31e0042e8d49d38cec811942ec1803', '15386885576', '2005040101', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2005040101', '140108197808270038');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'efae36b561f442978e62d3ca04bf0da5', '15513651077', '2023112001', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2023112001', '142623199209066416');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f09621bc0db747428f53cf7877aa40e2', '18434765476', '2025503004', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025503004', '142301199606120338');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f0e62cd6af0a49f09511268d8de83a4e', '13100009102', '2008016042', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2008016042', '142603198205303023');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f13e1d46431f426ba6b544d9ac354de2', '13754886959', '1998011003', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '1998011003', '142323197311181386');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f1457f3a590a41889fe0ef6ed214b671', '15834072178', '2007010011', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2007010011', '410323198204160553');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f1b837d851ff460397515ac1c258311d', '15022161553', '2020181010', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2020181010', '142601199408118516');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f1c978ca15c7445ba406559e7627e6f2', '13834154655', '2003020005', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2003020005', '142727198003230037');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f1fe845e318147798db0b0e19f3d274d', '18735109158', '2006020001', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2006020001', '130102198109272426');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f25210757fdb43ef9b06a5f681e59696', '18335139514', '1991016911', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1991016911', '140103196910070036');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f2693e1346c246b5b58dac483e04a5e7', '13934647576', '2018010600', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2018010600', '142226197204137420');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f272f230da134cf887d79bfb96ffa741', '13903415241', '2013050030', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2013050030', '140321197812011516');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f27c6e9d6ac94fb2b74a396e4b42dda3', '13977318464', '2023505003', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2023505003', '450305199010200042');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f27c7e08570a4058a6ed8981fd4c8244', '13700546890', '2007016026', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2007016026', '140104198108060389');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f27fb30be79944a897a1cee3fd6ad32d', '15935129992', '2002011195', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2002011195', '140103198002160641');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f28b582afc404be3997f1bee6d43b4cb', '13935118852', '1993016809', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1993016809', '140102197108040620');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f31aab6269444f9e8c7a596a02fd5799', '13703585083', '2005010004', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2005010004', '140107198208180627');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f31eb3df42df4493aaa0123dfad98ddb', '18635123116', '2008050006', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2008050006', '140102198201256527');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f3537e9e65b04cc1a449966117c3a3a2', '18636163989', '2012050013', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2012050013', '142332198803090027');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f360939fa3634d358fc25f98291f9dcb', '15834005887', '2006016720', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2006016720', '142322198205254041');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f3620f2d66af4943a09b36de7f312c2f', '18834115104', '2020181007', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2020181007', '130435199010031516');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f3d3d9a17b574c87b1dfbd2a36402c3f', '18434365835', '2021206008', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021206008', '142225199704087012');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f3e084e4dddb4ccd98b7839356502cb1', '18734854926', '2012040010', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2012040010', '142329198510202322');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f4102a32b24f454ca80631692a5fc7b3', '13803439531', '2011050018', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2011050018', '140105198411120547');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f4958ee624fc48b7befed5cd646a4131', '18434366377', '2025501002', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025501002', '142327199612106632');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f4a1419b013b48dfbac59df130d3d45f', '13485306372', '2011040001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2011040001', '140105198803241866');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f4a78528670f43e8ba5e2b8be326e538', '13073543963', '1992016913', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '1992016913', '142429197201290841');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f51b8623e53d457ca4b416779639f3f9', '13834660912', '2007010008', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2007010008', '142702197501035814');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f52933c7514a44dbbaae2e7b5a7fc32c', '18634355553', '2009011345', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2009011345', '140106198406063038');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f529d00f7c944455b1e649d43d3018b3', '15536932656', '2020181004', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2020181004', '140109199401100585');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f53bf726f0e74206918430addde64136', '13753145768', '2014209004', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2014209004', '140426197708234434');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f5f7fb8bf2ff40e685c6f7016c09ccec', '15513286724', '2025502001', '', 1, 0, 0, '2026-01-29 01:31:05.220682', NULL, '2025502001', '141127199701010091');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f677800576344f1092c418bc6bc84186', '18735151994', '2021206031', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021206031', '140303199402081614');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f6cf1141e9f34a6394ea0b79e21b1797', '13803456655', '2007016700', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2007016700', '140109198412260520');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f6e7005e5ef3468d8c6888f64b67fb05', '13834217770', '1992040118', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1992040118', '140102197009181233');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f79c67af8bad4771bf6b1aedb82b1a29', '18035158066', '2000016310', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2000016310', '140102197806096533');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f7e91884be1d484b861a37f3540fc3f5', '13754833216', '2011016740', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2011016740', '140107198312080626');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f7fc911f877a48b6ae0243590d4771fb', '13835163550', '1992016004', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1992016004', '140112197203050029');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f80260ea81ff404ba446ce333d0a2846', '18734852095', '2022508001', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2022508001', '140102197611082342');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f82de3fdf4144e229353c54e852a20fe', '15801594294', '2020113002', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2020113002', '140121199102220645');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f83cf1f9acef4ad6990b598f5c308350', '18734570919', '2001011294', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '2001011294', '140203197801155911');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f85f13ed52da459daa83d20bcfe21513', '18734157353', '2022206020', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2022206020', '14112119890731002X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f869166ab8554f1b9ac39193604c1190', '18632588829', '2023504008', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2023504008', '230404198509100239');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f969b9b863ad46b7b67dd3a45db53313', '13753160640', '1989016509', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '1989016509', '140102197005312048');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f96b984c55db4ebdb7ca9c8fcd219d3b', '15386885593', '2005040152', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2005040152', '140103198006114212');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f9927bbdf8bd465b9e650874e11ec83a', '18035105459', '1999016415', '', 1, 0, 0, '2026-01-29 01:31:05.233068', NULL, '1999016415', '140103197609140722');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f9dcecce0c9947f9b05e4e9382a9d557', '18335131927', '2014010020', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2014010020', '142303198601064566');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'f9fc9deea5834aff859b0e9d6dd71543', '13935124681', '1994046003', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1994046003', '140102197204022318');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'faa81ce91f7741bd98fef271f7297417', '', '2006050003', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2006050003', '140110198305030020');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'fb01391f5af14eb48f851de2d159c8c4', '13753146691', '2003010001', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2003010001', '142401198110021425');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'fb04a7c6c926481daa08f75105009526', '13513636435', '2006020003', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2006020003', '142402197206120032');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'fb204b5976774b40ac675629e822885d', '13835136066', '2017011000', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2017011000', '140109199110120025');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'fb3e1bfa55de4b3d96f53fb8ec1d9db6', '13994260769', '2014119001', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2014119001', '140104197803094180');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'fbff2425bd3e4479bd85d288a37db637', '15386885909', '2003011210', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2003011210', '140102198007151414');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'fc767fec51744bd1b4859ea14cc4a071', '13593167173', '2004020009', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2004020009', '140113198103152328');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'fc9e972e0f6a45508a41b087cba25134', '13934236828', '2004016520', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2004016520', '140303198201200424');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'fcab52536fbd486182c262ad8a5cabe0', '13393511639', '2009010173', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2009010173', '140121197707139525');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'fcc4131a6419426385da112a92472a0a', '18603468488', '2005011008', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2005011008', '142301198002132325');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'fcd449e3337e4e4c83be110fcf92f82e', '15386885544', '2008011040', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2008011040', '142422198506152159');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'fce5b88a58bd4195bc79feab77fc5ae9', '13934507689', '2008011038', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2008011038', '140121198411108046');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'fd1878c8ca5c4c43918a70fd51a8b9a7', '13363416161', '2004011017', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2004011017', '140103198005114245');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'fd315fb153664447b3b0d9e77f045b59', '13935122573', '1985016302', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '1985016302', '140102196706176523');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'fd41f069464448608a363fab265b5581', '15034130708', '2011050017', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2011050017', '142601198607082128');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'fd646b9866e84378b4bf8b0dd0147553', '15386885995', '1993011215', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '1993011215', '140102197002122310');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'fd809443cba1406b991355ee25ccde05', '', '2014207005', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2014207005', '14010219750325061X');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'fd9ba0c1583d4342a329054e42b11716', '13546719911', '2012010008', '', 1, 0, 0, '2026-01-29 01:31:05.227185', NULL, '2012010008', '142302197112031025');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'fda91a77e88349149ffd7ab1dd218b15', '13994220756', '2011050007', '', 1, 0, 0, '2026-01-29 01:31:05.244797', NULL, '2011050007', '140303198009021231');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'fe2213d53873468fbfdfe92332097703', '15803516010', '2021504005', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2021504005', '140108198303244226');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'fe4f0f9d51c04be9b9420228006df661', '13935149353', '2004020005', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2004020005', '140602198110041739');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'fe7d5751055a4ad59dc44db92ebb7af2', '13803400450', '2005046004', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '2005046004', '140103197706270676');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'fe85404584044c2c88a79c82141acbf3', '13191004436', '1993020002', '', 1, 0, 0, '2026-01-29 01:31:05.366119', NULL, '1993020002', '140104197010141346');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'fed2725dfba64850ae0053a1c2d6af33', '15135100444', '2005040149', '', 1, 0, 0, '2026-01-29 01:31:05.256604', NULL, '2005040149', '140102198211270621');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ff3b03c8f28943ba86c6d923169426ff', '18035164698', '2018120067', '', 1, 0, 0, '2026-01-29 01:31:05.238652', NULL, '2018120067', '140429199411275620');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ff66e0c5dc1e470e8abf92eba0cf4291', '15386885807', '2002011250', '', 1, 0, 0, '2026-01-29 01:31:05.237702', NULL, '2002011250', '142723197911203317');
INSERT INTO `userinfo` VALUES ('pbkdf2_sha256$1000000$xSUfgEA1bBaXRWIrCzHGkq$GHFw25bOpyqOEJ1YqQGl0A16//1ItMuYUHdAkNLYAo4=', NULL, 'ff7cc2bca5ea4c52ad848403c48f3494', '18635164396', '2013050020', '', 1, 0, 0, '2026-01-29 01:31:05.250861', NULL, '2013050020', '142228198410130016');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yearandmonth
-- ----------------------------
INSERT INTO `yearandmonth` VALUES ('6805a8cf06064387828e97acab641085', 2026, 2, '', '2026-02');

-- ----------------------------
-- Table structure for years
-- ----------------------------
DROP TABLE IF EXISTS `years`;
CREATE TABLE `years`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `year` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of years
-- ----------------------------
INSERT INTO `years` VALUES (6, '2025');

SET FOREIGN_KEY_CHECKS = 1;
