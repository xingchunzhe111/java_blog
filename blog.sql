/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2019-10-20 23:22:48
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
  `article_content` varchar(255) DEFAULT NULL,
  `cid` int(10) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `views_count` int(10) DEFAULT '0',
  `created_at` int(10) DEFAULT NULL,
  `updated_at` int(10) DEFAULT NULL,
  `is_hot` tinyint(1) DEFAULT '0',
  `tags_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

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
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除 0未删除  1已删除',
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for blog_logs
-- ----------------------------
DROP TABLE IF EXISTS `blog_logs`;
CREATE TABLE `blog_logs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0' COMMENT 'log type',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sp_comic_content
-- ----------------------------
DROP TABLE IF EXISTS `sp_comic_content`;
CREATE TABLE `sp_comic_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '产品自增ID',
  `code` char(21) DEFAULT NULL COMMENT '产品唯一的code码',
  `title` varchar(80) DEFAULT NULL COMMENT '标题',
  `desc` varchar(120) DEFAULT NULL COMMENT '副标题',
  `update_time` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '案例状态  1仓库中 2上线案例',
  `is_del` tinyint(1) DEFAULT NULL COMMENT '是否删除 0没有 1已删除',
  `store_id` tinyint(1) DEFAULT '0' COMMENT '店铺ID',
  `cate_id` int(10) DEFAULT NULL COMMENT '分类ID',
  `sort` int(10) DEFAULT NULL COMMENT '商品排序',
  `img` varchar(150) DEFAULT NULL COMMENT '默认的图片',
  `is_top` tinyint(1) DEFAULT '0' COMMENT '是否置顶  1是 0不是',
  `click_nub` int(10) unsigned DEFAULT '0',
  `type` tinyint(1) unsigned DEFAULT NULL COMMENT '信息类型 1案例 2资讯文章 3产品',
  `url` varchar(150) DEFAULT NULL COMMENT 'url链接',
  `look_nub` int(10) DEFAULT '0' COMMENT '浏览人数',
  `is_link` tinyint(1) DEFAULT '0' COMMENT '是否是跳转链接  0不是 1是',
  `is_recommend` tinyint(1) DEFAULT '0' COMMENT '是否推荐 0不推荐 1推荐',
  `vote_nub` int(10) DEFAULT '0' COMMENT '投票数量',
  `file_save_type` tinyint(1) DEFAULT '2' COMMENT '文件保存类型  1本地  2/又拍云   / 3七牛云',
  `is_sync` tinyint(1) DEFAULT '1' COMMENT '是否同步了数据',
  `push_bd_nub` tinyint(1) DEFAULT '0' COMMENT '推送百度的次数',
  `spider_type` tinyint(1) DEFAULT NULL COMMENT '漫画类型 1塔多  2漫画1234 3扑飞',
  `query_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=376378 DEFAULT CHARSET=utf8mb4 COMMENT='微分销-产品表';

-- ----------------------------
-- Table structure for sp_comic_content_ext
-- ----------------------------
DROP TABLE IF EXISTS `sp_comic_content_ext`;
CREATE TABLE `sp_comic_content_ext` (
  `content_id` int(10) NOT NULL COMMENT '产品ID',
  `content` mediumtext COMMENT '产品内容表',
  `spider_type` tinyint(1) DEFAULT '3' COMMENT '默认类型 1塔多 2漫画1234 3扑飞',
  `img_host` mediumtext,
  `dir_path` varchar(150) DEFAULT '' COMMENT '目录路径',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微分销-产品内容附属表';

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` int(2) unsigned DEFAULT NULL,
  `sex` varchar(100) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_attach
-- ----------------------------
DROP TABLE IF EXISTS `t_attach`;
CREATE TABLE `t_attach` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) NOT NULL DEFAULT '',
  `ftype` varchar(50) DEFAULT '',
  `fkey` text NOT NULL,
  `authorId` int(10) DEFAULT NULL,
  `created` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_comments
-- ----------------------------
DROP TABLE IF EXISTS `t_comments`;
CREATE TABLE `t_comments` (
  `coid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned DEFAULT '0',
  `created` int(10) unsigned DEFAULT '0',
  `author` varchar(200) DEFAULT NULL,
  `authorId` int(10) unsigned DEFAULT '0',
  `ownerId` int(10) unsigned DEFAULT '0',
  `mail` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `agent` varchar(200) DEFAULT NULL,
  `content` text,
  `type` varchar(16) DEFAULT 'comment',
  `status` varchar(16) DEFAULT 'approved',
  `parent` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`coid`) USING BTREE,
  KEY `cid` (`cid`) USING BTREE,
  KEY `created` (`created`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_contents
-- ----------------------------
DROP TABLE IF EXISTS `t_contents`;
CREATE TABLE `t_contents` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `titlePic` varchar(55) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `created` int(10) unsigned DEFAULT '0',
  `modified` int(10) unsigned DEFAULT '0',
  `content` text COMMENT '内容文字',
  `authorId` int(10) unsigned DEFAULT '0',
  `type` varchar(16) DEFAULT 'post',
  `status` varchar(16) DEFAULT 'publish',
  `tags` varchar(200) DEFAULT NULL,
  `categories` varchar(200) DEFAULT NULL,
  `hits` int(10) unsigned DEFAULT '0',
  `commentsNum` int(10) unsigned DEFAULT '0',
  `allowComment` tinyint(1) DEFAULT '1',
  `allowPing` tinyint(1) DEFAULT '1',
  `allowFeed` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`cid`) USING BTREE,
  UNIQUE KEY `slug` (`slug`) USING BTREE,
  KEY `created` (`created`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_logs
-- ----------------------------
DROP TABLE IF EXISTS `t_logs`;
CREATE TABLE `t_logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `action` varchar(100) DEFAULT NULL COMMENT '事件',
  `data` varchar(2000) DEFAULT NULL COMMENT '数据',
  `authorId` int(10) DEFAULT NULL COMMENT '作者编号',
  `ip` varchar(20) DEFAULT NULL COMMENT 'ip地址',
  `created` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_metas
-- ----------------------------
DROP TABLE IF EXISTS `t_metas`;
CREATE TABLE `t_metas` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `type` varchar(32) NOT NULL DEFAULT '',
  `contentType` varchar(32) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `sort` int(10) unsigned DEFAULT '0',
  `parent` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`mid`) USING BTREE,
  KEY `slug` (`slug`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_options
-- ----------------------------
DROP TABLE IF EXISTS `t_options`;
CREATE TABLE `t_options` (
  `name` varchar(32) NOT NULL DEFAULT '',
  `value` varchar(1000) DEFAULT '',
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_relationships
-- ----------------------------
DROP TABLE IF EXISTS `t_relationships`;
CREATE TABLE `t_relationships` (
  `cid` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cid`,`mid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_users
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `homeUrl` varchar(200) DEFAULT NULL,
  `screenName` varchar(32) DEFAULT NULL,
  `created` int(10) unsigned DEFAULT '0',
  `activated` int(10) unsigned DEFAULT '0',
  `logged` int(10) unsigned DEFAULT '0',
  `groupName` varchar(16) DEFAULT 'visitor',
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE KEY `name` (`username`) USING BTREE,
  UNIQUE KEY `mail` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
