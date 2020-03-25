-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2020 at 11:24 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

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
  `subject` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `feedbackinfo`
--

CREATE TABLE IF NOT EXISTS `feedbackinfo` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedbackinfo`
--

INSERT INTO `feedbackinfo` (`id`, `email`, `message`, `name`, `phone`) VALUES
(15, 'rohan@gmail.com', 'test was awesome and very good', 'rohan chouhan', '8987898789'),
(19, 'ronak@gmai.ocm', 'java test is very goood', 'Ronak  Neema', '4578547854'),
(22, 'sur@g.com', 'good test', 'surya tiwari', '7874785874'),
(30, 'aryan@gmail.comq', 'nice test', 'aryan kapor', '4578547896'),
(34, 'mohini123@gmail.comq', 'good test\r\n', 'Mohini sharma', '7874785874'),
(38, 'bhopu@gmail.com', 'nice test\r\n', 'rhaul bhopu', '8998899885');

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
(40),
(40),
(40),
(40),
(40),
(40),
(40),
(40);

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE IF NOT EXISTS `result` (
  `id` bigint(20) NOT NULL,
  `correct_opt` varchar(255) DEFAULT NULL,
  `que_id` int(11) NOT NULL,
  `selected_opt` varchar(255) DEFAULT NULL,
  `student_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`id`, `correct_opt`, `que_id`, `selected_opt`, `student_id`, `test_id`) VALUES
(13, 'option2', 3, 'option3', 12, 2),
(14, 'option2', 5, 'option3', 12, 2),
(17, 'option1', 7, NULL, 16, 6),
(18, 'option3', 8, 'option3', 16, 6),
(21, 'option1', 7, 'option4', 20, 6),
(28, 'option2', 24, 'option1', 27, 23),
(29, 'option2', 25, 'option3', 27, 23),
(32, 'option2', 24, 'option1', 31, 23),
(33, 'option2', 25, 'option2', 31, 23),
(36, 'option2', 24, 'option2', 35, 23),
(37, 'option2', 25, 'option2', 35, 23);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `id` bigint(20) NOT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `institute` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `marks` int(11) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `test_id` bigint(20) NOT NULL,
  `video` longblob
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `branch`, `email`, `firstname`, `gender`, `institute`, `lastname`, `marks`, `phone`, `result`, `test_id`, `video`) VALUES
(12, 'cs', 'rohan@gmail.com', 'rohan', 'male', 'cdgi', 'chouhan', 0, '8987898789', 'FAIL', 6, NULL),
(16, 'cs', 'ronak@gmai.ocm', 'Ronak ', 'male', 'cdgi', 'Neema', 3, '4578547854', 'PASS', 6, NULL),
(20, 'it', 'sur@g.com', 'surya', 'male', 'bansal', 'tiwari', -2, '7874785874', 'FAIL', 6, NULL),
(27, 'ec', 'aryan@gmail.comq', 'aryan', 'male', 'vaishnav', 'kapor', -2, '4578547896', 'FAIL', 23, NULL),
(31, 'it', 'mohini123@gmail.comq', 'Mohini', 'female', 'acro', 'sharma', 4, '7874785874', 'FAIL', 23, NULL),
(35, 'me', 'bhopu@gmail.com', 'rhaul', 'male', 'cd', 'bhopu', 10, '8998899885', 'PASS', 23, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `testinfo`
--

CREATE TABLE IF NOT EXISTS `testinfo` (
  `test_id` int(11) NOT NULL,
  `correct` varchar(255) DEFAULT NULL,
  `cutoff` varchar(255) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `expiry` varchar(255) DEFAULT NULL,
  `expiry_time` varchar(255) DEFAULT NULL,
  `f_id` int(11) NOT NULL,
  `incorrect` varchar(255) DEFAULT NULL,
  `n_questions` varchar(255) DEFAULT NULL,
  `privacy` varchar(255) DEFAULT NULL,
  `test_name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `testinfo`
--

INSERT INTO `testinfo` (`test_id`, `correct`, `cutoff`, `duration`, `expiry`, `expiry_time`, `f_id`, `incorrect`, `n_questions`, `privacy`, `test_name`) VALUES
(6, '5', '2', 10, '2020-04-02', '13:25', 1, '2', '2', 'public', 'java'),
(23, '5', '5', 20, '2020-03-25', '16:00', 1, '1', '3', 'public', 'Aptitude test');

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
  `test_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `upload_questions`
--

INSERT INTO `upload_questions` (`que_id`, `answer`, `opt1`, `opt2`, `opt3`, `opt4`, `question`, `test_id`) VALUES
(3, 'option2', '120 metres', '150 metres', '160 metres', '170 metres', 'A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?', 2),
(4, 'option2', '200 m', '245 m', '255 m', '260 m', 'The length of the bridge, which a train 130 metres long and travelling at 45 km/hr can cross in 30 seconds, is:', 2),
(5, 'option2', '1 : 3', '3:2', '2:3', '3:1', 'Two trains running in opposite directions cross a man standing on the platform in 27 seconds and 17 seconds respectively and they cross each other in 23 seconds. The ratio of their speeds is:', 2),
(7, 'option1', 'Bytecode is executed by JVM', 'The applet makes the Java code secure and portable', 'Use of exception handling', 'Dynamic binding between objects', 'Which of the following option leads to the portability and security of Java?', 6),
(8, 'option3', 'Dynamic', 'Architecture Neutral', 'Use of pointers', 'Object-oriented', 'Which of the following is not a Java features?', 6),
(24, 'option2', '120 metres', '150 metres', '165 metres', '155 metres', 'A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?', 23),
(25, 'option2', '200 m', '245 m', '247 m', '230 m', 'The length of the bridge, which a train 130 metres long and travelling at 45 km/hr can cross in 30 seconds, is:', 23),
(26, 'option1', '89 sec', '97 sec', '100 sec', '88 sec', 'A train 240 m long passes a pole in 24 seconds. How long will it take to pass a platform 650 m long?', 23);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userid` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `ln` int(11) NOT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `roles` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `email`, `image_name`, `ln`, `mobile`, `name`, `password`, `roles`, `username`) VALUES
(1, 'tohsib@gmail.com', 'pp.png', 0, '7878787878', 'Tohsib Qureshi', '1234', 'faculty', 'tohsib@gmail.com'),
(39, 'rohan@gmail.com', 'pp.png', 0, '000', 'rohan', '1234', 'student', 'rohan@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_role_id` bigint(20) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedbackinfo`
--
ALTER TABLE `feedbackinfo`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testinfo`
--
ALTER TABLE `testinfo`
 ADD PRIMARY KEY (`test_id`);

--
-- Indexes for table `upload_questions`
--
ALTER TABLE `upload_questions`
 ADD PRIMARY KEY (`que_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
 ADD PRIMARY KEY (`user_role_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
