/*
 Navicat Premium Data Transfer

 Source Server         : tutor_it
 Source Server Type    : MySQL
 Source Server Version : 50712
 Source Host           : localhost:3306
 Source Schema         : read

 Target Server Type    : MySQL
 Target Server Version : 50712
 File Encoding         : 65001

 Date: 09/05/2020 22:27:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员编号',
  `admin_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员账号',
  `admin_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of administrator
-- ----------------------------
INSERT INTO `administrator` VALUES (1, 'zs', '123456');

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告编号',
  `anno_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告标题',
  `anno_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `anno_publishtime` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `anno_cancel` tinyint(4) NULL DEFAULT NULL COMMENT '是否撤销：0—否；1—是',
  `anno_canceltime` datetime(0) NULL DEFAULT NULL COMMENT '撤销时间',
  `anno_delete` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除：0—否；1—是',
  `anno_deletetime` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  `attach_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of announcement
-- ----------------------------
INSERT INTO `announcement` VALUES (1, '公告标题', '公告内容', '2020-04-01 12:23:40', 0, '2020-04-03 12:23:52', 0, '2020-04-03 12:24:05', NULL);
INSERT INTO `announcement` VALUES (2, '公告标题1', '公告内容1', '2020-04-02 12:24:57', 0, '2020-04-03 12:25:05', 0, NULL, NULL);
INSERT INTO `announcement` VALUES (7, 'sdfsdf', 'sdfsdf', '2020-04-21 16:01:06', NULL, NULL, 0, NULL, 'http://localhost:8081/bookResource/view/?fileName=c1be6d4f-d李真管理员端——数据库对应表名.txt');

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '回答编号',
  `ans_readerid` int(11) NULL DEFAULT NULL COMMENT '读者编号',
  `ans_questionid` int(11) NULL DEFAULT NULL COMMENT '问题编号',
  `ans_content` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回答内容',
  `ans_score` int(2) NULL DEFAULT NULL COMMENT '分值：1 - 5分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES (1, 1, 1, '我觉得挺满意的', 1);
INSERT INTO `answer` VALUES (2, 2, 1, '我觉得还不错呀', 2);
INSERT INTO `answer` VALUES (3, 3, 1, '有很多需要改进的地方哦，比如。。。。', 3);
INSERT INTO `answer` VALUES (4, 4, 1, '不满意', 4);
INSERT INTO `answer` VALUES (5, 1, 3, NULL, 1);
INSERT INTO `answer` VALUES (6, 2, 3, NULL, 2);
INSERT INTO `answer` VALUES (7, 3, 3, NULL, 3);
INSERT INTO `answer` VALUES (8, 4, 3, NULL, 4);
INSERT INTO `answer` VALUES (9, 1, 4, NULL, 1);
INSERT INTO `answer` VALUES (10, 2, 4, NULL, 2);
INSERT INTO `answer` VALUES (11, 3, 4, NULL, 2);
INSERT INTO `answer` VALUES (12, 4, 4, NULL, 4);

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '书的id',
  `bookname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '书的名字',
  `pictureurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '书的图片路径名',
  `bookstate` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '1 看书、2 听书',
  `bookauthor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '书的作者',
  `bookreadnum` int(11) NULL DEFAULT NULL COMMENT '阅读数量',
  `bookcredit` int(11) NULL DEFAULT NULL COMMENT '书的积分',
  `book_shelves` tinyint(4) NULL DEFAULT NULL COMMENT '是否上架 0 ：未上架  1：上架',
  `book_type_id` int(11) NULL DEFAULT NULL COMMENT '图书类别id',
  `book_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '观看图书地址',
  `booktoken_id` int(11) NULL DEFAULT NULL COMMENT '书卷id',
  `is_charge` tinyint(4) NULL DEFAULT NULL COMMENT '是否收费,0 否， 1 收费',
  `book_press` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '出版社',
  `press_time` datetime(0) NULL DEFAULT NULL COMMENT '出版日期',
  `short_intro` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '简介',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'book表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '格林童话', 'http://url.picture', '说书', '格林', 23, 1, 0, 2, 'http://localhost:8081/bookResource/view/?fileName=666e8d4f-e一文搞定HashMap.md', NULL, 0, '清华大学出版社', '2020-05-05 00:49:37', '简介');
INSERT INTO `book` VALUES (2, '安徒生童话', 'http://url.picture', '听书', '安徒生', 666, 10, 1, 1, 'http://localhost:8081/bookResource/view/?fileName=666e8d4f-e一文搞定HashMap.md', NULL, 0, '清华大学出版社', '2020-05-01 00:49:41', '简介');
INSERT INTO `book` VALUES (3, 'xx', 'xx', 'xx', 'xx1', 223, 112, 1, 1, 'http://localhost:8081/bookResource/view/?fileName=666e8d4f-e一文搞定HashMap.md', NULL, 0, '人民大学出版社', '2020-05-07 00:49:45', '简介');
INSERT INTO `book` VALUES (4, '安徒生童话', 'http://url.picture', '听书', '安徒生', 66, 10, 1, 1, 'http://localhost:8081/bookResource/view/?fileName=666e8d4f-e一文搞定HashMap.md', NULL, 0, '人民大学出版社', '2020-05-01 00:49:48', '简介');
INSERT INTO `book` VALUES (6, '安徒生童话12', 'http://url.picture', '听书', '安徒生', 3, 10, 0, 1, 'http://localhost:8081/bookResource/view/?fileName=666e8d4f-e一文搞定HashMap.md', NULL, 0, '人民大学出版社', '2020-05-01 00:49:48', '简介');
INSERT INTO `book` VALUES (7, '安徒生童话123', 'http://url.picture', '听书', '安徒生', 4, 10, 1, 1, 'http://localhost:8081/bookResource/view/?fileName=666e8d4f-e一文搞定HashMap.md', NULL, 0, '人民大学出版社', '2020-05-01 00:49:53', '简介');
INSERT INTO `book` VALUES (8, '安徒生童话1234', 'http://url.picture', '听书', '安徒生', 22, 10, 1, 1, 'http://localhost:8081/bookResource/view/?fileName=666e8d4f-e一文搞定HashMap.md', NULL, 0, '人民大学出版社', '2020-05-01 00:49:48', '简介');
INSERT INTO `book` VALUES (9, '安徒生童话12345', 'http://url.picture', '听书', '安徒生', 32, 10, 1, 1, 'http://localhost:8081/bookResource/view/?fileName=666e8d4f-e一文搞定HashMap.md', NULL, 0, '人民大学出版社', '2020-05-01 00:49:48', '简介');
INSERT INTO `book` VALUES (10, '安徒生童话12345', 'http://url.picture', '听书', '安徒生', 33, 10, 1, 1, 'http://localhost:8081/bookResource/view/?fileName=666e8d4f-e一文搞定HashMap.md', NULL, 0, '工业出版社', '2020-05-01 00:49:48', '简介');
INSERT INTO `book` VALUES (11, '安徒生童话123456', 'http://url.picture', '听书', '安徒生', 3, 10, 1, 1, 'http://localhost:8081/bookResource/view/?fileName=666e8d4f-e一文搞定HashMap.md', NULL, 0, '工业出版社', '2020-05-01 00:49:48', '简介');
INSERT INTO `book` VALUES (12, '安徒生童话1234567', 'http://url.picture', '听书', '安徒生', 33, 10, 1, 1, 'http://localhost:8081/bookResource/view/?fileName=666e8d4f-e一文搞定HashMap.md', NULL, 0, '工业出版社', '2020-05-01 00:49:48', '简介');
INSERT INTO `book` VALUES (13, 'test1', NULL, NULL, 'wqq', 14, NULL, NULL, 1, 'http://localhost:8081/bookResource/view/?fileName=666e8d4f-e一文搞定HashMap.md', 1, 1, '工业出版社', '2020-05-01 00:49:48', '简介');
INSERT INTO `book` VALUES (14, 'tesqwqq', NULL, NULL, 'wqqw', NULL, NULL, NULL, 2, 'http://localhost:8081/bookResource/view/?fileName=4dffc01d-2一文搞定HashMap.md', 1, 1, '工业出版社', '2020-05-01 00:49:48', '简介');
INSERT INTO `book` VALUES (15, '123123', NULL, NULL, '123123', NULL, NULL, NULL, 1, 'http://localhost:8081/bookResource/view/?fileName=16353818-5论文提纲.md', NULL, 0, '1231231', '2020-05-12 00:00:00', '1231231');

-- ----------------------------
-- Table structure for bookcoupon
-- ----------------------------
DROP TABLE IF EXISTS `bookcoupon`;
CREATE TABLE `bookcoupon`  (
  `dcid` int(20) NOT NULL AUTO_INCREMENT COMMENT '书券id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '书券标题',
  `starttime` date NULL DEFAULT NULL COMMENT '开始时间',
  `endtime` date NULL DEFAULT NULL COMMENT '截至时间',
  `integral` int(11) NULL DEFAULT NULL COMMENT '所需积分',
  `dc_status` int(20) NULL DEFAULT NULL COMMENT '书券状态，0启用，1不可用',
  PRIMARY KEY (`dcid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '书券表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bookresource
-- ----------------------------
DROP TABLE IF EXISTS `bookresource`;
CREATE TABLE `bookresource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图书资源编号',
  `rs_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名称',
  `rs_synopsis` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源简介',
  `rs_amount` int(11) NULL DEFAULT NULL COMMENT '资源大小，单位为KB或MB',
  `rs_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源类型，类似于doc、ppt、pdf、MP3、wmv等常用格式',
  `book_id` int(11) NULL DEFAULT NULL COMMENT '相关联的图书id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bookresource
-- ----------------------------
INSERT INTO `bookresource` VALUES (1, '8bb913af-e一文搞定HashMap.md', NULL, 779, NULL, NULL);
INSERT INTO `bookresource` VALUES (2, '7c337ba0-a一文搞定HashMap.md', NULL, 779, NULL, NULL);
INSERT INTO `bookresource` VALUES (3, '3f558843-4一文搞定HashMap.md', NULL, 779, NULL, NULL);
INSERT INTO `bookresource` VALUES (4, '4dffc01d-2一文搞定HashMap.md', NULL, 779, NULL, 14);
INSERT INTO `bookresource` VALUES (5, '666e8d4f-e一文搞定HashMap.md', NULL, 779, '.md', 3);
INSERT INTO `bookresource` VALUES (6, '16353818-5论文提纲.md', NULL, 2658, '.md', 15);

-- ----------------------------
-- Table structure for booktoken
-- ----------------------------
DROP TABLE IF EXISTS `booktoken`;
CREATE TABLE `booktoken`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '书券编号',
  `btn_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '书卷名称',
  `btn_credit` int(11) NULL DEFAULT NULL COMMENT '兑换所需积分',
  `btn_status` tinyint(4) NULL DEFAULT NULL COMMENT '书券状态：0—可用；1—不可用',
  `btn_time` datetime(0) NULL DEFAULT NULL COMMENT '书券有效期截至日',
  `btn_num` int(11) NULL DEFAULT NULL COMMENT '书券数量',
  `btn_explain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '书券说明',
  `btn_begin` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '书卷兑换日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of booktoken
-- ----------------------------
INSERT INTO `booktoken` VALUES (1, '童话书卷', 10, 1, '2020-04-15 00:00:00', 1001, '不可以借阅，抓住关小黑屋', '2020-04-07 17:17:56.000000');
INSERT INTO `booktoken` VALUES (2, 'test', 1231, NULL, '2020-04-16 21:20:33', 1213, '1231', '2020-04-07 17:17:56.000000');

-- ----------------------------
-- Table structure for booktype
-- ----------------------------
DROP TABLE IF EXISTS `booktype`;
CREATE TABLE `booktype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图书类别编号',
  `bt_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书类别名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of booktype
-- ----------------------------
INSERT INTO `booktype` VALUES (1, '童话');
INSERT INTO `booktype` VALUES (2, '名著');
INSERT INTO `booktype` VALUES (7, '都市小说');

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '借阅编号',
  `bw_bookid` int(11) NULL DEFAULT NULL COMMENT '图书编号',
  `bw_readerid` int(11) NULL DEFAULT NULL COMMENT '读者编号',
  `bw_outtime` datetime(6) NULL DEFAULT NULL COMMENT '借出日期',
  `bw_endtime` datetime(6) NULL DEFAULT NULL COMMENT '到期日期',
  `bw_backtime` datetime(6) NULL DEFAULT NULL COMMENT '归还日期',
  `bw_isexpired` tinyint(4) NULL DEFAULT NULL COMMENT '是否过期：0--不过期；1--过期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrow
-- ----------------------------
INSERT INTO `borrow` VALUES (1, 1, 1, '2020-04-01 08:55:22.000000', '2020-04-04 08:55:27.000000', '2020-04-02 08:55:33.000000', 0);
INSERT INTO `borrow` VALUES (2, 1, 1, '2020-04-01 08:56:00.000000', '2020-04-03 08:56:06.000000', '2020-04-04 08:56:10.000000', 0);
INSERT INTO `borrow` VALUES (3, 1, 2, '2020-04-02 08:56:26.000000', '2020-04-04 08:56:30.000000', NULL, 0);
INSERT INTO `borrow` VALUES (4, 2, 2, '2020-04-01 08:57:37.000000', '2020-04-16 08:57:41.000000', NULL, 0);

-- ----------------------------
-- Table structure for check
-- ----------------------------
DROP TABLE IF EXISTS `check`;
CREATE TABLE `check`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图书审核编号',
  `ck_expertid` int(11) NULL DEFAULT NULL COMMENT '专家编号',
  `ck_recommendid` int(11) NULL DEFAULT NULL COMMENT '推荐图书编号',
  `ck_pass` tinyint(4) NULL DEFAULT NULL COMMENT '审核是否通过：0—通过；1—不通过',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for child
-- ----------------------------
DROP TABLE IF EXISTS `child`;
CREATE TABLE `child`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '儿童表的id',
  `parentid` int(10) NULL DEFAULT NULL COMMENT '父id（用户）',
  `childpassword` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '儿童的密码',
  `starttime` date NULL DEFAULT NULL COMMENT '开始时间',
  `endtime` date NULL DEFAULT NULL COMMENT '结束时间',
  `booktype` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '图书类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '儿童表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for expert
-- ----------------------------
DROP TABLE IF EXISTS `expert`;
CREATE TABLE `expert`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '专家编号',
  `ex_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专家账号',
  `ex_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专家密码',
  `ex_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专家姓名',
  `ex_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专家电话',
  `ex_addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专家地址',
  `ex_identity` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专家身份证',
  `ex_typeid` int(11) NULL DEFAULT NULL COMMENT '专家类别',
  `is_review` tinyint(4) NULL DEFAULT 3 COMMENT '是否审核通过1：是  0：否，3：未审核',
  `book_types` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '擅长的图书类别ids',
  `company_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作单位',
  `job_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of expert
-- ----------------------------
INSERT INTO `expert` VALUES (1, '砖家', '123456', '李白', '14525525567', '地址', '324242456787654567', 1, 1, '2', '郑州二七区', '教授');
INSERT INTO `expert` VALUES (2, '专家164', '1234567', '张震', '141414', '我的地址', '2222222212112', 2, 3, '1,2', '郑州二七区', '讲师');
INSERT INTO `expert` VALUES (5, '专家1', '12312', '瞅瞅', '234234', '往往', '23423423', 2, 0, '1,2', '郑州二七区', '教授');
INSERT INTO `expert` VALUES (6, 'test111', '123456', '任命', '13333341445', '郑州', '333333456789667567', 1, 3, '1,2', '郑州二七区', '副教授');
INSERT INTO `expert` VALUES (7, '专家头子', '123456', '彭于晏', '15649860087', '郑州', '373838388383883838', 1, 3, '1,2', '郑州二七区', '教授');

-- ----------------------------
-- Table structure for experttype
-- ----------------------------
DROP TABLE IF EXISTS `experttype`;
CREATE TABLE `experttype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '专家类别编号',
  `et_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专家类别名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of experttype
-- ----------------------------
INSERT INTO `experttype` VALUES (1, '文学专家');
INSERT INTO `experttype` VALUES (2, '古诗专家');

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '问卷编号',
  `pa_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问卷标题',
  `pa_futitle` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问卷副标题',
  `pa_direction` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问卷说明，描述',
  `pa_adddate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加问卷日期',
  `pa_operatedate` datetime(0) NULL DEFAULT NULL COMMENT '操作开始日期',
  `pa_enddate` datetime(0) NULL DEFAULT NULL COMMENT '结束问卷日期',
  `pa_thankmsg` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '感谢信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES (1, '调查问卷', NULL, '本系统调查问卷', '2020-04-16 14:10:36', NULL, NULL, '感谢您的参与');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '问题编号',
  `que_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题名称',
  `que_direction` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题说明',
  `que_answer` tinyint(4) NULL DEFAULT NULL COMMENT '是否必答：0—是；1—否',
  `que_paperid` int(11) NULL DEFAULT NULL COMMENT '问卷编号',
  `que_topicid` int(11) NULL DEFAULT NULL COMMENT '题型编号',
  `que_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单选题/问答题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (1, '系统调查问卷', '您对该系统满意吗，有什么建议呢？', 1, 1, NULL, NULL);
INSERT INTO `question` VALUES (3, '请为该系统打分', '请为该系统评分', NULL, NULL, NULL, '单选题');
INSERT INTO `question` VALUES (4, '请为我的颜值打分', '请为阅读体验评分', NULL, NULL, NULL, '单选题');

-- ----------------------------
-- Table structure for readrecord
-- ----------------------------
DROP TABLE IF EXISTS `readrecord`;
CREATE TABLE `readrecord`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NULL DEFAULT NULL COMMENT '用户id',
  `bookid` int(10) NULL DEFAULT NULL COMMENT '书的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '阅读记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for recommend
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '推荐图书编号',
  `re_readerid` int(11) NULL DEFAULT NULL COMMENT '读者编号',
  `re_bookid` int(11) NULL DEFAULT NULL COMMENT '图书编号',
  `re_result` tinyint(4) NULL DEFAULT NULL COMMENT '0:不通过  1：通过',
  `re_expertid` int(11) NULL DEFAULT NULL COMMENT '审核的专家id',
  `re_status` tinyint(4) NULL DEFAULT NULL COMMENT '审核状态 0:未审核  1：已审核',
  `re_opinion` varchar(700) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核意见、结论',
  `re_reason` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐理由',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recommend
-- ----------------------------
INSERT INTO `recommend` VALUES (1, 1, 1, 1, 1, 1, '还不错哈！！！！1', '内容不错，才推荐的');
INSERT INTO `recommend` VALUES (2, 2, 2, 0, 2, 1, '书籍内容逻辑不通顺。', '内容不错，才推荐的');
INSERT INTO `recommend` VALUES (3, 1, 1, 0, 1, 1, '哎呦，不错哦', '内容不错，才推荐的');
INSERT INTO `recommend` VALUES (4, 2, 6, 0, 1, 0, '内容过于浮夸1', '内容不错，才推荐的');

-- ----------------------------
-- Table structure for select
-- ----------------------------
DROP TABLE IF EXISTS `select`;
CREATE TABLE `select`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '选项编号',
  `sel_questionid` int(11) NULL DEFAULT NULL COMMENT '问题编号',
  `sel_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of select
-- ----------------------------
INSERT INTO `select` VALUES (1, 1, '满意');
INSERT INTO `select` VALUES (2, 1, '一般般');
INSERT INTO `select` VALUES (3, 1, '非常满意');
INSERT INTO `select` VALUES (4, 1, '不满意');

-- ----------------------------
-- Table structure for sys_file_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_info`;
CREATE TABLE `sys_file_info`  (
  `file_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `file_bucket` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件仓库（oss仓库）',
  `file_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名称',
  `file_suffix` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件后缀',
  `file_size_kb` bigint(20) NULL DEFAULT NULL COMMENT '文件大小kb',
  `final_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件唯一标识id',
  `file_path` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存储路径',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_file_info
-- ----------------------------
INSERT INTO `sys_file_info` VALUES ('1167385745179131905', NULL, '请假流程.bpmn20.xml', 'xml', 6, '1167385745179131905.xml', '/Users/stylefeng/tmp/gunsTempFiles/1167385745179131905.xml', '2019-08-30 18:37:05', NULL, 1, NULL);

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '题型编号',
  `topic_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '题型名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for update_recommend_msg
-- ----------------------------
DROP TABLE IF EXISTS `update_recommend_msg`;
CREATE TABLE `update_recommend_msg`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NULL DEFAULT NULL COMMENT '书籍id',
  `result` tinyint(1) NULL DEFAULT NULL COMMENT '结果',
  `opinion` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '意见',
  `is_read` tinyint(1) NULL DEFAULT NULL COMMENT '是否已经阅读过，0：false 1:true',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `book_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `book_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expert_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expert_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of update_recommend_msg
-- ----------------------------
INSERT INTO `update_recommend_msg` VALUES (1, 1, 1, '还不错', 1, '张三', '格林童话', '童话', '砖家', NULL, NULL);
INSERT INTO `update_recommend_msg` VALUES (2, 6, 0, '内容过于浮夸', 1, '张三', '格林童话', '童话', '砖家', NULL, NULL);
INSERT INTO `update_recommend_msg` VALUES (3, 6, 0, '内容过于浮夸1', 0, '张三', '格林童话', '童话', '砖家', NULL, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userpwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `usersex` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userage` int(3) NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idcard` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `readid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子阅读id',
  `del` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '0 ：未删除、1已删除',
  `credit` int(11) NULL DEFAULT NULL COMMENT '用户的积分数量',
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '张三', '123', '男', 23, '1234567', NULL, '11231', '0', 1);
INSERT INTO `user` VALUES (2, '李四', '123', '女', 22, '123123', NULL, '1231', '0', 13);
INSERT INTO `user` VALUES (3, '王五', '12', '男', 22, '23123', NULL, '11231', '0', 14);
INSERT INTO `user` VALUES (4, '赵四', '123123', '男', 12, '231231', NULL, '1231', '0', 22);

-- ----------------------------
-- Table structure for user_booktoken_rel
-- ----------------------------
DROP TABLE IF EXISTS `user_booktoken_rel`;
CREATE TABLE `user_booktoken_rel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `book_token_id` int(11) NULL DEFAULT NULL COMMENT '书卷id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for userbookcoupon
-- ----------------------------
DROP TABLE IF EXISTS `userbookcoupon`;
CREATE TABLE `userbookcoupon`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '用户书券id',
  `uid` int(20) NULL DEFAULT NULL COMMENT '用户id',
  `dcid` int(20) NULL DEFAULT NULL COMMENT '书券id',
  `udc_status` int(20) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户书券表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for usercollection
-- ----------------------------
DROP TABLE IF EXISTS `usercollection`;
CREATE TABLE `usercollection`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '收藏表的id',
  `userid` int(10) NULL DEFAULT NULL COMMENT '用户id',
  `bookid` int(10) NULL DEFAULT NULL COMMENT '收藏书的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for usercredit
-- ----------------------------
DROP TABLE IF EXISTS `usercredit`;
CREATE TABLE `usercredit`  (
  `ucid` int(20) NOT NULL AUTO_INCREMENT COMMENT '用户积分表',
  `uid` int(20) NULL DEFAULT NULL COMMENT '用户id',
  `integral` int(20) NULL DEFAULT NULL COMMENT '积分',
  PRIMARY KEY (`ucid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户积分表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for userevaluation
-- ----------------------------
DROP TABLE IF EXISTS `userevaluation`;
CREATE TABLE `userevaluation`  (
  `ueid` int(20) NOT NULL COMMENT '评价表id',
  `bookid` int(20) NULL DEFAULT NULL COMMENT '书的id',
  `evaluationdetails` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价详情',
  `uid` int(20) NULL DEFAULT NULL COMMENT '用户id',
  `grade` int(20) NULL DEFAULT NULL COMMENT '评分',
  `ue_cretime` date NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ueid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户对书的评价表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wx_user
-- ----------------------------
DROP TABLE IF EXISTS `wx_user`;
CREATE TABLE `wx_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户openid，当前公众号用户唯一标识',
  `subscribe` int(4) NULL DEFAULT NULL COMMENT '关注状态，0取消，1订阅',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` int(4) NULL DEFAULT NULL COMMENT '性别，1是男，2是女，0是未知',
  `city` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市',
  `country` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家',
  `province` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省份',
  `language` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语言',
  `headimgurl` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `subscribeTime` datetime(0) NULL DEFAULT NULL COMMENT '关注时间',
  `unionid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '多个公众号用户唯一标识',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `groupid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '分组',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表（微信交互时）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wx_user
-- ----------------------------
INSERT INTO `wx_user` VALUES (1, 'o6ANqvzl8JHQzlenxJ4I0s1AuemU', 0, '^小~二~哥^', 1, '周口', '中国', '河南', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/pZ0sicILhNOl4gL9iaoPVjmX4AHtXyH3PUACVLUJPzicsjZ5J8poicM5cGQDghmRCfBE4oYBCvorVLRX9xwBr2ztJg/132', '2019-10-07 19:20:40', NULL, '', '0');
INSERT INTO `wx_user` VALUES (2, 'o6ANqv4ZycAyAxUnXFcsl_JG4nfs', 1, 'Vincent', 1, '郑州', '中国', '河南', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/pZ0sicILhNOn9icrE7ibZicmNNuqGw1FLHSLiaZp7Vb96iarKeOoNya8UdlfLDT5oBSfdULwKBHErrtsQiaZu6nU0lBKB3j7oKG5LaM/132', '2019-10-07 19:21:42', NULL, '', '0');
INSERT INTO `wx_user` VALUES (3, 'o6ANqvz0483M-FeBK4osOTJeVv2o', 0, 'Biu🚙 Biu', 1, '海淀', '中国', '北京', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/0yOibuhvkGF8ePdySaOKgibY149alBIicicDmTDp8cdA8RibSiayR3As4zuoZcaXRN36Hy7yviaSHtID78DorecJg3K7A/132', '2019-10-07 19:50:16', NULL, '', '0');
INSERT INTO `wx_user` VALUES (4, 'o6ANqvyc62spbeKOCwVmpxxdu-FY', 1, '逗you', 1, '', '安道尔', '', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/sXQXOHQxApvaib4l8jzW0bT2qibyWZYpcYU6RX4hxBSCs7cx067DkyibKySr07k0zXiaG6YE4Nv4HuJVGEpq1oxREGjMesHibQ1Ua/132', '2019-10-07 21:47:18', NULL, '', '0');
INSERT INTO `wx_user` VALUES (5, 'o6ANqv9irs5gpMuG6zrbbJ63bbnU', 0, '浅墨🌜', 1, '平顶山', '中国', '河南', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/sXQXOHQxApuYotFjIiaibBS21zybI5XAth5diaxcA7LbQC9icibYAv44jqPicRavmvkDia9TSgrJhCo0TlXDw1PpnRjDa8EDnE4Q9ice/132', '2019-10-07 22:10:52', NULL, '', '0');

SET FOREIGN_KEY_CHECKS = 1;
