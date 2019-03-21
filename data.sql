-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2019-03-21 03:05:48
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
-- 数据库： `data`
--

-- --------------------------------------------------------

--
-- 表的结构 `Admin`
--

CREATE TABLE `Admin` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `aid` int(10) NOT NULL COMMENT '关联attribute id',
  `level` int(10) NOT NULL COMMENT '权限'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `Admin`
--

INSERT INTO `Admin` (`admin_id`, `admin_name`, `password`, `aid`, `level`) VALUES
(1, 'admin', '111111', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `Attribute`
--

CREATE TABLE `Attribute` (
  `aid` int(10) NOT NULL COMMENT 'attribute id （主键）',
  `cid` int(10) NOT NULL COMMENT '关联cid',
  `aname` varchar(50) NOT NULL COMMENT 'attribute name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `Class`
--

CREATE TABLE `Class` (
  `cid` int(10) NOT NULL,
  `classname` varchar(50) NOT NULL,
  `content` text NOT NULL COMMENT 'class 内容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `Issue`
--

CREATE TABLE `Issue` (
  `issue_id` int(10) NOT NULL,
  `pid` int(10) NOT NULL COMMENT '关联pid',
  `title` varchar(50) NOT NULL COMMENT '日志标题',
  `content` text NOT NULL COMMENT '日志内容',
  `submit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `Project`
--

CREATE TABLE `Project` (
  `pid` int(10) NOT NULL,
  `pname` varchar(50) NOT NULL COMMENT '项目名称',
  `uid` int(10) NOT NULL COMMENT '关联uid',
  `aid` int(10) NOT NULL COMMENT 'attribute id 关联',
  `content` text NOT NULL COMMENT '项目内容',
  `submit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `User`
--

CREATE TABLE `User` (
  `uid` int(10) NOT NULL,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `stu_id` varchar(50) NOT NULL COMMENT '学号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转储表的索引
--

--
-- 表的索引 `Admin`
--
ALTER TABLE `Admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- 表的索引 `Attribute`
--
ALTER TABLE `Attribute`
  ADD PRIMARY KEY (`aid`);

--
-- 表的索引 `Class`
--
ALTER TABLE `Class`
  ADD PRIMARY KEY (`cid`);

--
-- 表的索引 `Issue`
--
ALTER TABLE `Issue`
  ADD PRIMARY KEY (`issue_id`);

--
-- 表的索引 `Project`
--
ALTER TABLE `Project`
  ADD PRIMARY KEY (`pid`);

--
-- 表的索引 `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`uid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `Admin`
--
ALTER TABLE `Admin`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `Attribute`
--
ALTER TABLE `Attribute`
  MODIFY `aid` int(10) NOT NULL AUTO_INCREMENT COMMENT 'attribute id （主键）';

--
-- 使用表AUTO_INCREMENT `Class`
--
ALTER TABLE `Class`
  MODIFY `cid` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `Issue`
--
ALTER TABLE `Issue`
  MODIFY `issue_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `Project`
--
ALTER TABLE `Project`
  MODIFY `pid` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `User`
--
ALTER TABLE `User`
  MODIFY `uid` int(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
