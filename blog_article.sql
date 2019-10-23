/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80011
Source Host           : 127.0.0.1:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2019-10-23 17:55:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `article_title` varchar(255) DEFAULT NULL,
  `article_desc` varchar(255) DEFAULT NULL,
  `article_content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `cid` int(10) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `views_count` int(10) DEFAULT '0',
  `created_at` varchar(20) DEFAULT NULL,
  `updated_at` int(10) DEFAULT NULL,
  `is_hot` tinyint(1) DEFAULT '0',
  `tags_id` int(10) DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES ('1', '这是标题啊1', '1231232描述', '有很多人说“内容为王”，内容是决定你是否可以创造出爆文的核心，但不知道大家有没有发现，很多时候即使你写出了或者拍出了非常优秀的作品，甚至在别的平台上发布已经取得了巨大成功，但是到了头条上就行不通了。\r\n\r\n为什么呢?因为每个平台都有一套自己的推荐机制，这个推荐机制是有一套很复杂的综合算法组成的，它考察的也是你综合的数据，只有满足了综合考核指标的情况下才能够成为真正的爆款。那推荐机制是如何操作的呢?今天我们就为大家详细解读头条推荐机制的工作原理以及运营原理，和大家一起玩转头条号。', '0', '1', '12', '1569209620000', '1569209620', '0', '5', '李想');
INSERT INTO `blog_article` VALUES ('37', '这是标题啊2', '1231232描述', '有很多人说“内容为王”，内容是决定你是否可以创造出爆文的核心，但不知道大家有没有发现，很多时候即使你写出了或者拍出了非常优秀的作品，甚至在别的平台上发布已经取得了巨大成功，但是到了头条上就行不通了。\r\n\r\n为什么呢?因为每个平台都有一套自己的推荐机制，这个推荐机制是有一套很复杂的综合算法组成的，它考察的也是你综合的数据，只有满足了综合考核指标的情况下才能够成为真正的爆款。那推荐机制是如何操作的呢?今天我们就为大家详细解读头条推荐机制的工作原理以及运营原理，和大家一起玩转头条号。', '0', '1', '12', '1569209620000', '1569209620', '0', '5', '李想');
INSERT INTO `blog_article` VALUES ('38', '这是标题啊3', '1231232描述', '有很多人说“内容为王”，内容是决定你是否可以创造出爆文的核心，但不知道大家有没有发现，很多时候即使你写出了或者拍出了非常优秀的作品，甚至在别的平台上发布已经取得了巨大成功，但是到了头条上就行不通了。\r\n\r\n为什么呢?因为每个平台都有一套自己的推荐机制，这个推荐机制是有一套很复杂的综合算法组成的，它考察的也是你综合的数据，只有满足了综合考核指标的情况下才能够成为真正的爆款。那推荐机制是如何操作的呢?今天我们就为大家详细解读头条推荐机制的工作原理以及运营原理，和大家一起玩转头条号。', '0', '1', '12', '1569209620000', '1569209620', '0', '5', '李想');
INSERT INTO `blog_article` VALUES ('39', '这是标题啊4', '1231232描述', '有很多人说“内容为王”，内容是决定你是否可以创造出爆文的核心，但不知道大家有没有发现，很多时候即使你写出了或者拍出了非常优秀的作品，甚至在别的平台上发布已经取得了巨大成功，但是到了头条上就行不通了。\r\n\r\n为什么呢?因为每个平台都有一套自己的推荐机制，这个推荐机制是有一套很复杂的综合算法组成的，它考察的也是你综合的数据，只有满足了综合考核指标的情况下才能够成为真正的爆款。那推荐机制是如何操作的呢?今天我们就为大家详细解读头条推荐机制的工作原理以及运营原理，和大家一起玩转头条号。', '0', '1', '12', '1569209620000', '1569209620', '0', '5', '李想');
INSERT INTO `blog_article` VALUES ('40', '这是标题啊5', '1231232描述', '有很多人说“内容为王”，内容是决定你是否可以创造出爆文的核心，但不知道大家有没有发现，很多时候即使你写出了或者拍出了非常优秀的作品，甚至在别的平台上发布已经取得了巨大成功，但是到了头条上就行不通了。\r\n\r\n为什么呢?因为每个平台都有一套自己的推荐机制，这个推荐机制是有一套很复杂的综合算法组成的，它考察的也是你综合的数据，只有满足了综合考核指标的情况下才能够成为真正的爆款。那推荐机制是如何操作的呢?今天我们就为大家详细解读头条推荐机制的工作原理以及运营原理，和大家一起玩转头条号。', '0', '1', '12', '1569209620000', '1569209620', '0', '5', '李想');

-- ----------------------------
-- Table structure for blog_article_tags
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_tags`;
CREATE TABLE `blog_article_tags` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_article_tags
-- ----------------------------

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除 0未删除  1已删除',
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES ('1', '热门新闻', '0', '2019-01-01 00:00:00');
INSERT INTO `blog_category` VALUES ('2', '好文分享', '0', '2019-01-01 00:00:00');

-- ----------------------------
-- Table structure for blog_logs
-- ----------------------------
DROP TABLE IF EXISTS `blog_logs`;
CREATE TABLE `blog_logs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0' COMMENT 'log type',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_logs
-- ----------------------------
