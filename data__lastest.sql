-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2019 at 11:52 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `data`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `aid` int(10) NOT NULL COMMENT '关联attribute id',
  `level` int(10) NOT NULL COMMENT '权限'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `password`, `aid`, `level`) VALUES
(1, 'admin', '111111', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `attribute`
--

CREATE TABLE `attribute` (
  `aid` int(10) NOT NULL COMMENT 'attribute id （主键）',
  `sid` int(10) NOT NULL COMMENT '关联cid',
  `aname` varchar(50) NOT NULL COMMENT 'attribute name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attribute`
--

INSERT INTO `attribute` (`aid`, `sid`, `aname`) VALUES
(1, 1, '关联PJ12018冬'),
(2, 2, '关联PJ22019春'),
(3, 3, '关联PJ32019夏');

-- --------------------------------------------------------

--
-- Table structure for table `issue`
--

CREATE TABLE `issue` (
  `issue_id` int(10) NOT NULL,
  `pid` int(10) NOT NULL COMMENT '关联pid',
  `title` varchar(50) NOT NULL COMMENT '日志标题',
  `content` text NOT NULL COMMENT '日志内容',
  `submit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `issue`
--

INSERT INTO `issue` (`issue_id`, `pid`, `title`, `content`, `submit_time`) VALUES
(1, 1, '2018冬测试项目用户01内容', '2018冬测试项目用户01内容sfasdfasdfsafdsafasdfasdfsadfsadfasdfa', '2019-04-06 15:01:24'),
(2, 1, '2018冬测试项目用户01内容2', '2018冬测试项目用户01内容2weqgrtbernnynytmtymymymtmymytmytumytum', '2019-04-06 15:02:01'),
(3, 1, 'Add Issue to 2018冬测试项目用户01::1', 'Add Issue to 2018冬测试项目用户01::1  XXXXXXXXXXXXXXXXXXXX', '2019-04-07 09:48:39');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `pid` int(10) NOT NULL,
  `pname` varchar(50) NOT NULL COMMENT '项目名称',
  `uid` int(10) NOT NULL COMMENT '关联uid',
  `aid` int(10) NOT NULL COMMENT 'attribute id 关联',
  `content` text NOT NULL COMMENT '项目内容',
  `submit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`pid`, `pname`, `uid`, `aid`, `content`, `submit_time`) VALUES
(1, '2018冬测试项目用户01', 1, 1, '2018冬测试项目用户01内容', '2019-04-06 14:52:36'),
(2, '2019春测试项目用户01', 1, 2, '2019春测试项目用户01内容', '2019-04-06 14:54:51'),
(3, '2019秋测试项目用户01', 1, 3, '2019夏测试项目用户01内容', '2019-04-06 14:56:03'),
(4, '2018冬测试项目用户02', 2, 2, '2018冬测试项目用户02内容', '2019-04-06 14:58:32'),
(5, '2019春测试项目用户02', 2, 2, '2019春测试项目用户02内容', '2019-04-06 14:59:06'),
(6, '2019夏测试项目用户02', 2, 2, '2019夏测试项目用户02内容', '2019-04-06 14:59:39');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `sid` int(10) NOT NULL,
  `classname` varchar(50) NOT NULL,
  `content` text NOT NULL COMMENT 'class 内容',
  `build_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`sid`, `classname`, `content`, `build_time`) VALUES
(1, '2018秋', 'this is 2018 autumn random detail/////\r\n\r\nthis is lorem detailLorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!', '2019-04-06 15:35:11'),
(2, '2019春', 'this is 2019 spring random detail/////\r\n\r\nasdasddasdasdaasLorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!d', '2019-04-06 15:35:13'),
(3, '2019夏', 'this is 2019 summer random detail/////\r\n\r\nsafadfdfasdfasdfLorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta quo laborum saepe magnam exercitationem ipsam nisi ullam tempora quae minus fugit ea perferendis fuga voluptatibus magni quam aspernatur, aut architecto!', '2019-04-06 15:35:33');

-- --------------------------------------------------------

--
-- Table structure for table `testdata`
--

CREATE TABLE `testdata` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `testdata`
--

INSERT INTO `testdata` (`id`, `name`, `status`) VALUES
(11, 'fsadffs', 1),
(12, 'asfdfsadf', 1),
(13, 'lly', 1),
(14, '23132123', 1),
(15, '123124234', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(10) NOT NULL,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `stu_id` varchar(50) NOT NULL COMMENT '学号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `username`, `stu_id`) VALUES
(1, 'eddatt', '01'),
(2, 'testuser', '02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `attribute`
--
ALTER TABLE `attribute`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `issue`
--
ALTER TABLE `issue`
  ADD PRIMARY KEY (`issue_id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `testdata`
--
ALTER TABLE `testdata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attribute`
--
ALTER TABLE `attribute`
  MODIFY `aid` int(10) NOT NULL AUTO_INCREMENT COMMENT 'attribute id （主键）', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `issue`
--
ALTER TABLE `issue`
  MODIFY `issue_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `pid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `sid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `testdata`
--
ALTER TABLE `testdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
