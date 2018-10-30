-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2018-10-30 06:32:18
-- 服务器版本： 10.1.36-MariaDB
-- PHP 版本： 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `practice`
--

-- --------------------------------------------------------

--
-- 表的结构 `issues`
--

CREATE TABLE `issues` (
  `id` int(11) NOT NULL COMMENT '主键',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `genre` int(10) UNSIGNED NOT NULL COMMENT '种类，1春日2秋日3寒4暑5新闻',
  `release_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  `effective_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间/有效时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `project`
--

CREATE TABLE `project` (
  `pid` int(10) NOT NULL COMMENT '项目主键',
  `issue_id` int(10) NOT NULL COMMENT '属于哪个issue',
  `name` varchar(50) NOT NULL COMMENT '项目名',
  `stu_id` varchar(20) NOT NULL COMMENT '申请人学号',
  `wechat` varchar(255) NOT NULL COMMENT '申请人微信',
  `tel` varchar(255) NOT NULL COMMENT '申请人电话',
  `email` varchar(50) NOT NULL COMMENT '申请人邮箱',
  `school` varchar(255) NOT NULL COMMENT '项目挂靠院系',
  `status` int(10) NOT NULL DEFAULT '0' COMMENT '申请状态 0 待审核 1 通过  2未通过 3 已结束',
  `genre` int(10) NOT NULL DEFAULT '0' COMMENT '项目种类 0 常规项目',
  `theme` varchar(50) NOT NULL COMMENT '项目主题',
  `background` text NOT NULL COMMENT '项目背景',
  `introduction` text NOT NULL COMMENT '项目介绍',
  `plan` text NOT NULL COMMENT '项目计划',
  `place` varchar(50) NOT NULL COMMENT '项目进行地点',
  `instructor` text NOT NULL COMMENT '导师信息',
  `d_opinion` text NOT NULL COMMENT '梦工厂项目详细观点',
  `d_goal` text NOT NULL COMMENT '梦工厂项目预期成果',
  `d_preparation` text NOT NULL COMMENT '梦工厂项目前期准备',
  `d_safety` text NOT NULL COMMENT '梦工厂项目安全准备'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `submissions`
--

CREATE TABLE `submissions` (
  `s_id` int(10) NOT NULL COMMENT '学生提交信息主键',
  `p_id` int(10) NOT NULL COMMENT '所属项目p_id',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `content` text NOT NULL COMMENT '内容',
  `issue_id` int(10) NOT NULL COMMENT '所属issue_id',
  `genre` int(11) NOT NULL COMMENT 'submission type 0 日志 1 结项信息',
  `submission_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转储表的索引
--

--
-- 表的索引 `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`pid`);

--
-- 表的索引 `submissions`
--
ALTER TABLE `submissions`
  ADD PRIMARY KEY (`s_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `issues`
--
ALTER TABLE `issues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `project`
--
ALTER TABLE `project`
  MODIFY `pid` int(10) NOT NULL AUTO_INCREMENT COMMENT '项目主键';

--
-- 使用表AUTO_INCREMENT `submissions`
--
ALTER TABLE `submissions`
  MODIFY `s_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '学生提交信息主键';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
