-- phpMyAdmin SQL Dump
-- version 4.0.10deb1ubuntu0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 28, 2020 at 05:08 PM
-- Server version: 5.7.16
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `testportal6`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE IF NOT EXISTS `contact_us` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `msg_body` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `email`, `msg_body`, `name`, `subject`) VALUES
(8, 'hatian3105@gmail.com', 'hey', 'tohsib qureshi', 'hello'),
(9, 'hatian3105@gmail.com', 'hey', 'tohsib qureshi', 'hello'),
(10, 'hatian3105@gmail.com', 'hey', 'tohsib qureshi', 'hello'),
(11, 'hatian3105@gmail.com', 'khuhou', 'lj;', 'ljhlji'),
(12, 'hatian3105@gmail.com', 'khuhou', 'lj;', 'ljhlji'),
(13, 'hatian3105@gmail.com', 'khuhou', 'lj;', 'ljhlji');

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(23),
(23),
(23),
(23);

-- --------------------------------------------------------

--
-- Table structure for table `testinfo`
--

CREATE TABLE IF NOT EXISTS `testinfo` (
  `test_id` int(11) NOT NULL,
  `f_id` int(11) NOT NULL,
  `correct` varchar(255) DEFAULT NULL,
  `cutoff` varchar(255) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `expiry` varchar(255) DEFAULT NULL,
  `expiry_time` varchar(255) DEFAULT NULL,
  `incorrect` varchar(255) DEFAULT NULL,
  `n_questions` varchar(255) DEFAULT NULL,
  `test_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`test_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `testinfo`
--

INSERT INTO `testinfo` (`test_id`, `f_id`, `correct`, `cutoff`, `duration`, `expiry`, `expiry_time`, `incorrect`, `n_questions`, `test_name`) VALUES
(2, 1, '1', '12', 12, '2020-02-22', '04:00', '1', '45', 'math'),
(3, 1, '1', '12', 12, '2020-02-22', '04:00', '1', '4', 'math'),
(20, 1, '5', '45', 45, '2020-05-04', '04:54', '4', '4', 'math'),
(21, 1, '4', '5', 4, '2020-04-05', '05:01', '8', '4', 'Sample template 2');

-- --------------------------------------------------------

--
-- Table structure for table `upload_questions`
--

CREATE TABLE IF NOT EXISTS `upload_questions` (
  `que_id` int(11) NOT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `opt1` varchar(255) DEFAULT NULL,
  `opt2` varchar(255) DEFAULT NULL,
  `opt3` varchar(255) DEFAULT NULL,
  `opt4` varchar(255) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `test_id` int(11) NOT NULL,
  PRIMARY KEY (`que_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `upload_questions`
--

INSERT INTO `upload_questions` (`que_id`, `answer`, `opt1`, `opt2`, `opt3`, `opt4`, `question`, `test_id`) VALUES
(4, 'option3', 'igiy', 'giuhiu', 'yjgyt86', 'yiiyi', '						ques1	\r\n		akfjjkehhafheofhuoqefhouwehfouewhouhfw			\r\n				', 3),
(5, 'option4', 'iojoji', '89u', 'ansewer', 'iuhu', 'Quest222	\r\n					', 3),
(6, 'option2', 'vvhgj', 'ghjk', 'vhjkl', 'ghjkl', '	123\r\n					', 3),
(7, 'option3', 'jjoy', 'uho8674kh$$', 'iyyiy767&&', 'o8u8oy', '	\r\n					11111', 3),
(22, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userid` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ln` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `roles` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `email`, `ln`, `name`, `password`, `roles`, `username`) VALUES
(1, 'hatian3105@gmail.com', 0, 'tohsib', '123', 'f', 'qq'),
(14, 'a@b.c', 0, 'neema', '1111', 'faculty', 'nn'),
(15, 'a@b.c', 0, 'neema', '1111', 'faculty', 'nn'),
(16, 'a@b.com', 0, 'neema', '123', 'faculty', 'nn'),
(17, 'a@b.com', 0, 'neema', '123', 'faculty', 'nn'),
(18, 'a@b.com', 0, 'neema', '123', 'faculty', 'nn'),
(19, 'a@b.com', 0, 'neema1', '123456', 'faculty', 'nn');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_role_id` bigint(20) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user_role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
