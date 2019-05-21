-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2019-05-21 14:32:44
-- 服务器版本： 10.1.36-MariaDB
-- PHP 版本： 7.2.11

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
-- 表的结构 `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `sid` int(10) NOT NULL COMMENT '关联section id',
  `level` int(10) NOT NULL COMMENT '权限'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `password`, `sid`, `level`) VALUES
(1, 'admin', '111111', 0, 0),
(2, 'admin2', '111111', 2, 0),
(3, 'admin3', '111111', 3, 0);

-- --------------------------------------------------------

--
-- 表的结构 `attribute`
--

CREATE TABLE `attribute` (
  `aid` int(10) NOT NULL COMMENT 'attribute id （主键）',
  `sid` int(10) NOT NULL COMMENT '关联cid',
  `aname` varchar(50) NOT NULL COMMENT 'attribute name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `attribute`
--

INSERT INTO `attribute` (`aid`, `sid`, `aname`) VALUES
(1, 1, '关联PJ12018冬'),
(2, 2, '关联PJ22019春'),
(3, 3, '关联PJ32019夏'),
(4, 1, '关联2018秋2'),
(5, 5, '关联2019夏'),
(6, 6, 'att1');

-- --------------------------------------------------------

--
-- 表的结构 `issue`
--

CREATE TABLE `issue` (
  `issue_id` int(10) NOT NULL,
  `pid` int(10) NOT NULL COMMENT '关联pid',
  `title` varchar(50) NOT NULL COMMENT '日志标题',
  `content` text NOT NULL COMMENT '日志内容',
  `submit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `issue`
--

INSERT INTO `issue` (`issue_id`, `pid`, `title`, `content`, `submit_time`) VALUES
(1, 2, '2018冬测试项目用户01内容', '2018冬测试项目用户01内容sfasdfasdfsafdsafasdfasdfsadfsadfasdfa', '2019-04-06 15:01:24'),
(2, 2, '2018冬测试项目用户01内容2', '2018冬测试项目用户01内容2weqgrtbernnynytmtymymymtmymytmytumytum', '2019-04-06 15:02:01'),
(3, 4, 'Add Issue to 2018冬测试项目用户01::1', 'Add Issue to 2018冬测试项目用户01::1  XXXXXXXXXXXXXXXXXXXX', '2019-04-07 09:48:39');

-- --------------------------------------------------------

--
-- 表的结构 `project`
--

CREATE TABLE `project` (
  `pid` int(10) NOT NULL,
  `pname` varchar(50) NOT NULL COMMENT '项目名称',
  `stu_id` varchar(50) NOT NULL COMMENT '关联stu_id',
  `aid` int(10) NOT NULL COMMENT 'attribute id 关联',
  `content` text NOT NULL COMMENT '项目内容',
  `submit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `project`
--

INSERT INTO `project` (`pid`, `pname`, `stu_id`, `aid`, `content`, `submit_time`) VALUES
(1, '2018冬测试项目用户01', '1', 1, '2018冬测试项目用户01内容', '2019-04-06 14:52:36'),
(2, '2019春测试项目用户01', '01', 2, '2019春测试项目用户01内容', '2019-04-06 14:54:51'),
(3, '2019秋测试项目用户01', '01', 3, '2019夏测试项目用户01内容', '2019-04-06 14:56:03'),
(4, '2018冬测试项目用户02', '02', 2, '2018冬测试项目用户02内容', '2019-04-06 14:58:32'),
(5, '2019春测试项目用户02', '02', 2, '2019春测试项目用户02内容', '2019-04-06 14:59:06'),
(6, '2019夏测试项目用户02', '02', 2, '2019夏测试项目用户02内容', '2019-04-06 14:59:39'),
(7, '2018秋1', '01', 4, '208秋1sjdajdlsjdlsadlajsdpoajdpasjdas', '2019-05-17 13:47:18'),
(17, '测试水水水水', '01', 3, '<p>测试</p>', '2019-05-19 17:14:46'),
(18, 'test', '01', 2, '<p>ddd</p><p>ddd</p>', '2019-05-20 03:56:22'),
(19, 'admin22222', '01', 3, '<p>w222</p>', '2019-05-20 04:00:24'),
(20, 'test2019', '01', 1, '<p>测试&nbsp;</p>', '2019-05-20 04:20:09');

-- --------------------------------------------------------

--
-- 表的结构 `section`
--

CREATE TABLE `section` (
  `sid` int(10) NOT NULL,
  `classname` varchar(50) NOT NULL,
  `content` text NOT NULL COMMENT 'class 内容',
  `build_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `section`
--

INSERT INTO `section` (`sid`, `classname`, `content`, `build_time`) VALUES
(1, '2018秋', 'this is 2018 autumn random detail/////\r\n\r\nthis is lorem detailLorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!', '2019-04-06 15:35:11'),
(2, '2019春', 'this is 2019 spring random detail/////\r\n\r\nasdasddasdasdaasLorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!d', '2019-04-06 15:35:13'),
(3, '2019夏', 'this is 2019 summer random detail/////\r\n\r\nsafadfdfasdfasdfLorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!', '2019-04-06 15:35:33');

-- --------------------------------------------------------

--
-- 表的结构 `testdata`
--

CREATE TABLE `testdata` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `testdata`
--

INSERT INTO `testdata` (`id`, `name`, `status`) VALUES
(11, 'fsadffs', 1),
(12, 'asfdfsadf', 1),
(13, 'lly', 1),
(14, '23132123', 1),
(15, '123124234', 1);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `uid` int(10) NOT NULL,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `stu_id` varchar(50) NOT NULL COMMENT '学号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`uid`, `username`, `stu_id`) VALUES
(1, '样例用户名', '01'),
(2, 'testuser', '02');

--
-- 转储表的索引
--

--
-- 表的索引 `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- 表的索引 `attribute`
--
ALTER TABLE `attribute`
  ADD PRIMARY KEY (`aid`);

--
-- 表的索引 `issue`
--
ALTER TABLE `issue`
  ADD PRIMARY KEY (`issue_id`);

--
-- 表的索引 `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`pid`);

--
-- 表的索引 `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`sid`);

--
-- 表的索引 `testdata`
--
ALTER TABLE `testdata`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `attribute`
--
ALTER TABLE `attribute`
  MODIFY `aid` int(10) NOT NULL AUTO_INCREMENT COMMENT 'attribute id （主键）', AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `issue`
--
ALTER TABLE `issue`
  MODIFY `issue_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `project`
--
ALTER TABLE `project`
  MODIFY `pid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- 使用表AUTO_INCREMENT `section`
--
ALTER TABLE `section`
  MODIFY `sid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `testdata`
--
ALTER TABLE `testdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
