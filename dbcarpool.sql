-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2021 at 11:06 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbcarpool`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user type', 7, 'add_usertype'),
(26, 'Can change user type', 7, 'change_usertype'),
(27, 'Can delete user type', 7, 'delete_usertype'),
(28, 'Can view user type', 7, 'view_usertype'),
(29, 'Can add passenger entry', 8, 'add_passengerentry'),
(30, 'Can change passenger entry', 8, 'change_passengerentry'),
(31, 'Can delete passenger entry', 8, 'delete_passengerentry'),
(32, 'Can view passenger entry', 8, 'view_passengerentry'),
(33, 'Can add owner entry', 9, 'add_ownerentry'),
(34, 'Can change owner entry', 9, 'change_ownerentry'),
(35, 'Can delete owner entry', 9, 'delete_ownerentry'),
(36, 'Can view owner entry', 9, 'view_ownerentry'),
(37, 'Can add offerride', 10, 'add_offerride'),
(38, 'Can change offerride', 10, 'change_offerride'),
(39, 'Can delete offerride', 10, 'delete_offerride'),
(40, 'Can view offerride', 10, 'view_offerride'),
(41, 'Can add car details', 11, 'add_cardetails'),
(42, 'Can change car details', 11, 'change_cardetails'),
(43, 'Can delete car details', 11, 'delete_cardetails'),
(44, 'Can view car details', 11, 'view_cardetails'),
(45, 'Can add seek ride', 12, 'add_seekride'),
(46, 'Can change seek ride', 12, 'change_seekride'),
(47, 'Can delete seek ride', 12, 'delete_seekride'),
(48, 'Can view seek ride', 12, 'view_seekride'),
(49, 'Can add feed back', 13, 'add_feedback'),
(50, 'Can change feed back', 13, 'change_feedback'),
(51, 'Can delete feed back', 13, 'delete_feedback'),
(52, 'Can view feed back', 13, 'view_feedback'),
(53, 'Can add comments', 14, 'add_comments'),
(54, 'Can change comments', 14, 'change_comments'),
(55, 'Can delete comments', 14, 'delete_comments'),
(56, 'Can view comments', 14, 'view_comments'),
(57, 'Can add support ticket', 15, 'add_supportticket'),
(58, 'Can change support ticket', 15, 'change_supportticket'),
(59, 'Can delete support ticket', 15, 'delete_supportticket'),
(60, 'Can view support ticket', 15, 'view_supportticket'),
(61, 'Can add payment', 16, 'add_payment'),
(62, 'Can change payment', 16, 'change_payment'),
(63, 'Can delete payment', 16, 'delete_payment'),
(64, 'Can view payment', 16, 'view_payment'),
(65, 'Can add feedback_ passenger', 17, 'add_feedback_passenger'),
(66, 'Can change feedback_ passenger', 17, 'change_feedback_passenger'),
(67, 'Can delete feedback_ passenger', 17, 'delete_feedback_passenger'),
(68, 'Can view feedback_ passenger', 17, 'view_feedback_passenger'),
(69, 'Can add feedback_ owner', 18, 'add_feedback_owner'),
(70, 'Can change feedback_ owner', 18, 'change_feedback_owner'),
(71, 'Can delete feedback_ owner', 18, 'delete_feedback_owner'),
(72, 'Can view feedback_ owner', 18, 'view_feedback_owner'),
(73, 'Can add rate', 19, 'add_rate'),
(74, 'Can change rate', 19, 'change_rate'),
(75, 'Can delete rate', 19, 'delete_rate'),
(76, 'Can view rate', 19, 'view_rate');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$fnAj8YIgCLq8ZZNotk53bD$Ehy4tImo2j/5OFVpvu0bRSZdAjpPrB1ZJOdKJKEEN7k=', '2021-12-02 09:50:44.486506', 0, 'owner me', 'Owner me', '1', 'ownerme@gmail.com', 0, 1, '2021-10-16 16:46:53.247786'),
(2, 'pbkdf2_sha256$260000$NOzFWaa1sOwIkaBZBzCbGq$v4LbU9zO5R0JsceCol4fJkvfDrVlL5t+4mSQlC554bw=', '2021-12-02 09:35:21.959206', 0, 'passenger me', 'Passenger me', '1', 'passengerme@gmail.com', 0, 1, '2021-10-16 17:37:16.264971'),
(3, 'pbkdf2_sha256$260000$jwYeML5Ai9NqFoQ8jsc383$HroWJ3p0XP/+WUFhQ7iKQuwu4rudiOgWPC7AGPejOPQ=', '2021-12-02 09:45:21.367826', 1, 'admin', '', '1', 'admin@gmail.com', 1, 1, '2021-10-20 17:24:05.210390'),
(4, 'pbkdf2_sha256$260000$jJxKQ8VDga1sgD6FoJgulU$IXMISerifVtV7et44jowRyj6xOvqYisA2MArDxTkvw4=', '2021-10-21 06:23:32.478703', 0, 'newowner', 'newowner', '1', 'newowner@gmail.com', 0, 1, '2021-10-21 06:23:20.576785'),
(5, 'pbkdf2_sha256$260000$GhWkubXDKkz9GPkcPLkMpD$1oYkPiyKudTPoSbJ8txDHiENol2kbV9HIi+8M5lTFKE=', '2021-10-22 10:37:54.813368', 0, 'ankit', 'ankit', '1', 'ankit@gmail.com', 0, 1, '2021-10-22 10:37:38.177405'),
(6, 'pbkdf2_sha256$260000$Nko1QdOJ8QHEFAfhAJI09x$fnrqiyiz4L6fx0+xolI5TmG50Ag4qKD0awIlXdSbS3w=', '2021-11-23 06:37:42.923563', 0, 'owner_joshmy', 'owner_joshmy', '1', 'joshmyjoshy99@gmail.com', 0, 1, '2021-10-25 11:52:24.795375'),
(7, 'pbkdf2_sha256$260000$zwITJI3THcsrDM5t5oUCdk$vvLoNjLvYx+MDXyUaNf35k6ARJq1lWHrCubRLoMWAQg=', '2021-10-30 04:33:17.472206', 0, 'passenger_joshmy', 'passenger_joshmy', '1', 'joshmyjoshy99@gmail.com', 0, 0, '2021-10-25 12:09:23.113620'),
(8, 'pbkdf2_sha256$260000$UGpYIPCUWilw2bk9HPFo3k$l3j4QyGmZ0qYy8evjNTa/YVViMUIs+yNmgg35RpQq8A=', '2021-10-30 04:42:06.615690', 0, 'sijo', 'sijo joy', '1', 'sijojoy@gmail.com', 0, 1, '2021-10-30 04:34:50.608870'),
(9, 'pbkdf2_sha256$260000$DAUfBHutBmXz5m5HDyJ2tF$OTyGqvfsSVhiA9qQI1vMotwkRKFWTiIuWz+/DC83ON0=', '2021-11-06 06:27:54.505228', 0, 'nasrin', 'nasrin', '1', 'nasrin@gmail.com', 0, 1, '2021-11-06 06:10:43.209338'),
(10, 'pbkdf2_sha256$260000$Q9PBhzhymZ73CdMmqd9Z8f$uj+GzCNMZicmY6I62doWIJUD/hZKINnC5QKWkdqW1u0=', '2021-11-06 07:21:15.506977', 0, 'merin', 'merin', '1', 'merin@gmail.com', 0, 1, '2021-11-06 06:22:13.967626'),
(11, 'pbkdf2_sha256$260000$fm4F8snkM35PX9TJWbFGS0$6xL9fubnpW92xcm0tmnF6mu2HqdrnOkqYSEg0UOSG7g=', NULL, 0, 'jomin', 'jomin joshy', '0', 'jomminjoshy2001@gmail.com', 0, 1, '2021-11-12 08:45:22.950720'),
(12, 'pbkdf2_sha256$260000$psnyfcVdU0mICvy7Rq6Mng$Nd5nCzZZMhTi1QP7ApQ6bD7Ys+rfwtP2vkkBBm+4psQ=', '2021-11-22 20:39:08.620916', 0, 'joshmy_owner', 'Joshmy Joshy', '1', 'joshmyjoshy99@gmail.com', 0, 1, '2021-11-22 20:38:21.480055'),
(13, 'pbkdf2_sha256$260000$18UOnO2C7IDRhPMjdA7Rey$2GKwGUdqmXkoRAIKyfAV7mGIM0vc8341nn9nVmK9o7A=', NULL, 0, 'passenger', 'passenger', '0', 'joshmyjoshy99@gmail.com', 0, 1, '2021-11-23 09:16:34.228723');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `carpool_cardetails`
--

CREATE TABLE `carpool_cardetails` (
  `id` bigint(20) NOT NULL,
  `carname` varchar(100) NOT NULL,
  `seat` varchar(50) NOT NULL,
  `color` varchar(100) NOT NULL,
  `carno` varchar(100) NOT NULL,
  `owner_id` bigint(20) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `acnonac` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carpool_cardetails`
--

INSERT INTO `carpool_cardetails` (`id`, `carname`, `seat`, `color`, `carno`, `owner_id`, `image`, `acnonac`) VALUES
(39, 'duster', '7', 'orange', 'kl-05-ag-8776', 1, 'blablacar-ride-share-2-720x720.jpg', 'ac');

-- --------------------------------------------------------

--
-- Table structure for table `carpool_comments`
--

CREATE TABLE `carpool_comments` (
  `id` bigint(20) NOT NULL,
  `comments` varchar(100) DEFAULT NULL,
  `reply` varchar(100) DEFAULT NULL,
  `time` time(6) NOT NULL,
  `date` datetime(6) NOT NULL,
  `rate` varchar(100) NOT NULL,
  `owner_id` bigint(20) NOT NULL,
  `passenger_id` bigint(20) NOT NULL,
  `ride_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `carpool_feedback`
--

CREATE TABLE `carpool_feedback` (
  `id` bigint(20) NOT NULL,
  `time` time(6) NOT NULL,
  `date` date NOT NULL,
  `reply` varchar(1000) NOT NULL,
  `status` varchar(500) NOT NULL,
  `feedback` varchar(1000) NOT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  `passenger_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carpool_feedback`
--

INSERT INTO `carpool_feedback` (`id`, `time`, `date`, `reply`, `status`, `feedback`, `owner_id`, `passenger_id`, `user_id`) VALUES
(1, '11:02:39.473874', '2021-10-29', '', 'not replied', '', NULL, 1, 2),
(57, '10:01:41.208279', '2021-10-30', '', 'not replied', '', 4, NULL, 5),
(62, '11:22:44.882346', '2021-10-30', '', 'not replied', 'gooood', 1, NULL, 1),
(63, '11:22:49.523853', '2021-10-30', '', 'not replied', 'nice one', 1, NULL, 1),
(64, '12:37:01.775042', '2021-10-30', '', 'not replied', 'okayy', NULL, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `carpool_feedback_owner`
--

CREATE TABLE `carpool_feedback_owner` (
  `id` bigint(20) NOT NULL,
  `time` time(6) NOT NULL,
  `date` date NOT NULL,
  `reply` varchar(1000) NOT NULL,
  `status` varchar(500) NOT NULL,
  `feedback` varchar(1000) NOT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carpool_feedback_owner`
--

INSERT INTO `carpool_feedback_owner` (`id`, `time`, `date`, `reply`, `status`, `feedback`, `owner_id`, `user_id`) VALUES
(1, '20:47:51.259309', '2021-11-25', 'okayy', 'replied', 'gooood', 4, 5),
(2, '15:25:08.264775', '2021-11-25', 'okayy', 'replied', 'nice one', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `carpool_feedback_passenger`
--

CREATE TABLE `carpool_feedback_passenger` (
  `id` bigint(20) NOT NULL,
  `time` time(6) NOT NULL,
  `date` date NOT NULL,
  `reply` varchar(1000) NOT NULL,
  `status` varchar(500) NOT NULL,
  `feedback` varchar(1000) NOT NULL,
  `passenger_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carpool_feedback_passenger`
--

INSERT INTO `carpool_feedback_passenger` (`id`, `time`, `date`, `reply`, `status`, `feedback`, `passenger_id`, `user_id`) VALUES
(1, '13:16:27.232424', '2021-11-23', 'okayy', 'replied', 'nice one', 1, 2),
(3, '15:29:25.616433', '2021-11-25', '', 'not replied', 'nice ride', 1, 2),
(4, '17:03:39.127068', '2021-11-25', 'okayy', 'replied', 'nice ride', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `carpool_offerride`
--

CREATE TABLE `carpool_offerride` (
  `id` bigint(20) NOT NULL,
  `startlocation` varchar(100) NOT NULL,
  `endlocation` varchar(100) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time(6) NOT NULL,
  `owner_id` bigint(20) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `cardetails_id` bigint(20) DEFAULT NULL,
  `food` varchar(100) NOT NULL,
  `laggage` varchar(100) NOT NULL,
  `music` varchar(100) NOT NULL,
  `pets` varchar(100) NOT NULL,
  `smoking` varchar(100) NOT NULL,
  `carnames` varchar(100) DEFAULT NULL,
  `seatno` varchar(100) DEFAULT NULL,
  `status` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carpool_offerride`
--

INSERT INTO `carpool_offerride` (`id`, `startlocation`, `endlocation`, `date`, `time`, `owner_id`, `amount`, `cardetails_id`, `food`, `laggage`, `music`, `pets`, `smoking`, `carnames`, `seatno`, `status`) VALUES
(2, 'kochi', 'kollam', '2021-10-20', '06:35:00.000000', 1, '100', NULL, 'yes', '10', 'yes', 'yes', 'yes', 'duster', '1', '1'),
(52, 'paduva', 'movattuupuzha', '2021-11-30', '04:00:00.000000', 1, '125', NULL, 'yes', '5', 'yes', 'yes', 'no', 'duster', '2', '1'),
(53, 'paduva', 'kollam', '2021-11-30', '01:00:00.000000', 1, '150', NULL, 'yes', '5', 'yes', 'yes', 'no', 'duster', '2', '1'),
(58, 'kochi', 'kottayam', '2021-12-01', '03:30:00.000000', 1, '100', NULL, 'yes', '5', 'yes', 'yes', 'no', 'pub.carname', '2', '1');

-- --------------------------------------------------------

--
-- Table structure for table `carpool_ownerentry`
--

CREATE TABLE `carpool_ownerentry` (
  `id` bigint(20) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `license` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `password2` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carpool_ownerentry`
--

INSERT INTO `carpool_ownerentry` (`id`, `contact`, `dob`, `gender`, `license`, `image`, `user_id`, `password2`) VALUES
(1, '9098755797', '05-01-1999', 'female', 'JOSHMY PIC_Rkbqzic.jpg', 'JOSHMY PIC_Rkbqzic.jpg', 1, '1'),
(2, '8790980978', '06/07/2000', 'male', 'license (2)_78YpCCp.jpg', 'license (2)_78YpCCp.jpg', 4, '1'),
(3, '+919562369909', '1/3/95', 'female', 'license (2)_FPH4mH7.jpg', 'license (2)_FPH4mH7.jpg', 5, '1'),
(4, '9562369909', '05-01-1999', 'male', 'joshmy joshy.jpg_KaUYKNR.jpg', 'joshmy joshy.jpg_KaUYKNR.jpg', 6, '1'),
(5, '9876678909', '06/07/2000', 'female', 'JOSHMY PIC_AD6vW33.jpg', 'JOSHMY PIC_AD6vW33.jpg', 8, '1'),
(6, '988988999', '27-10-1998', 'male', 'joshmy joshy.jpg_EvEgn5C.jpg', 'joshmy joshy.jpg_EvEgn5C.jpg', 9, '1'),
(7, '9061442174', '06/07/2000', 'male', 'joshmy joshy.jpg_hB0PYwD.jpg', 'joshmy joshy.jpg_hB0PYwD.jpg', 11, '1'),
(8, '+919562369909', '2021-11-19', 'female', 'joshmy joshy.jpg_C4wNXJN.jpg', 'joshmy joshy.jpg_yWVXiRX.jpg', 12, '1');

-- --------------------------------------------------------

--
-- Table structure for table `carpool_passengerentry`
--

CREATE TABLE `carpool_passengerentry` (
  `id` bigint(20) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `adhar` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `password2` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carpool_passengerentry`
--

INSERT INTO `carpool_passengerentry` (`id`, `contact`, `dob`, `gender`, `adhar`, `image`, `user_id`, `password2`) VALUES
(1, '', '05-01-1999', 'female', 'images/joshmy_joshy.jpg.jpg', 'images/joshmy_joshy.jpg_nDW3LzQ.jpg', 2, '1'),
(2, '+919562369909', '05-01-1999', 'male', 'JOSHMY PIC (1)_yKfFk7R.jpg', 'JOSHMY PIC (1)_wDFkAET.jpg', 7, '1'),
(3, '9900990990', '06/07/2000', 'female', 'JOSHMY PIC (1)_NLWi52T.jpg', 'JOSHMY PIC (1)_eEuFsdo.jpg', 10, '1'),
(4, '9562369909', '2021-11-17', 'male', 'joshmy joshy.jpg_BEjpl8O.jpg', 'joshmy joshy.jpg_Cu9pIia.jpg', 13, '');

-- --------------------------------------------------------

--
-- Table structure for table `carpool_payment`
--

CREATE TABLE `carpool_payment` (
  `id` bigint(20) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `time` time(6) NOT NULL,
  `date` datetime(6) NOT NULL,
  `owner_id` bigint(20) NOT NULL,
  `passenger_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `carpool_rate`
--

CREATE TABLE `carpool_rate` (
  `id` bigint(20) NOT NULL,
  `rating` varchar(100) NOT NULL,
  `review` varchar(1000) NOT NULL,
  `passenger_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carpool_rate`
--

INSERT INTO `carpool_rate` (`id`, `rating`, `review`, `passenger_id`) VALUES
(1, '3', 'good', 1),
(5, '3', 'okay', 1);

-- --------------------------------------------------------

--
-- Table structure for table `carpool_seekride`
--

CREATE TABLE `carpool_seekride` (
  `id` bigint(20) NOT NULL,
  `leavingfrom` varchar(200) NOT NULL,
  `leavingto` varchar(200) NOT NULL,
  `passenger_id` bigint(20) NOT NULL,
  `offerride_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carpool_seekride`
--

INSERT INTO `carpool_seekride` (`id`, `leavingfrom`, `leavingto`, `passenger_id`, `offerride_id`) VALUES
(2, 'kochi', 'kottayam', 1, NULL),
(23, 'pala', 'kakkanad', 1, NULL),
(25, 'hostel', 'college', 1, NULL),
(32, 'pala', 'college', 1, NULL),
(52, 'mangalam', 'madura', 1, NULL),
(53, 'kasargod', 'kannor', 1, NULL),
(55, 'paduva', 'kakkanad', 1, NULL),
(56, 'pala', 'college', 1, NULL),
(57, 'kochi', 'kollam', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carpool_supportticket`
--

CREATE TABLE `carpool_supportticket` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone_number` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `carpool_usertype`
--

CREATE TABLE `carpool_usertype` (
  `id` bigint(20) NOT NULL,
  `type` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carpool_usertype`
--

INSERT INTO `carpool_usertype` (`id`, `type`, `user_id`) VALUES
(1, 'owner', 1),
(2, 'passenger', 2),
(3, 'owner', 4),
(4, 'owner', 5),
(5, 'owner', 6),
(6, 'passenger', 7),
(7, 'owner', 8),
(8, 'owner', 9),
(9, 'passenger', 10),
(10, 'owner', 11),
(11, 'owner', 12),
(12, 'passenger', 13);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(11, 'carpool', 'cardetails'),
(14, 'carpool', 'comments'),
(13, 'carpool', 'feedback'),
(18, 'carpool', 'feedback_owner'),
(17, 'carpool', 'feedback_passenger'),
(10, 'carpool', 'offerride'),
(9, 'carpool', 'ownerentry'),
(8, 'carpool', 'passengerentry'),
(16, 'carpool', 'payment'),
(19, 'carpool', 'rate'),
(12, 'carpool', 'seekride'),
(15, 'carpool', 'supportticket'),
(7, 'carpool', 'usertype'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-10-16 16:45:00.592531'),
(2, 'auth', '0001_initial', '2021-10-16 16:45:02.074310'),
(3, 'admin', '0001_initial', '2021-10-16 16:45:02.396684'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-10-16 16:45:02.412324'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-10-16 16:45:02.443569'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-10-16 16:45:02.552978'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-10-16 16:45:02.631127'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-10-16 16:45:02.678038'),
(9, 'auth', '0004_alter_user_username_opts', '2021-10-16 16:45:02.693674'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-10-16 16:45:02.809732'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-10-16 16:45:02.813725'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-10-16 16:45:02.821965'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-10-16 16:45:02.868851'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-10-16 16:45:02.902895'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-10-16 16:45:02.934172'),
(16, 'auth', '0011_update_proxy_permissions', '2021-10-16 16:45:02.965417'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-10-16 16:45:02.996951'),
(18, 'carpool', '0001_initial', '2021-10-16 16:45:03.494692'),
(19, 'carpool', '0002_auto_20211011_1259', '2021-10-16 16:45:03.682513'),
(20, 'carpool', '0003_publishride', '2021-10-16 16:45:03.744770'),
(21, 'carpool', '0004_alter_publishride_date', '2021-10-16 16:45:03.843060'),
(22, 'carpool', '0005_publishride_user', '2021-10-16 16:45:03.951217'),
(23, 'carpool', '0006_rename_user_publishride_owner', '2021-10-16 16:45:04.154387'),
(24, 'carpool', '0007_auto_20211015_1204', '2021-10-16 16:45:04.326582'),
(25, 'carpool', '0008_alter_publishride_user', '2021-10-16 16:45:04.358172'),
(26, 'carpool', '0009_auto_20211015_1214', '2021-10-16 16:45:04.543251'),
(27, 'carpool', '0010_remove_publishride_owner', '2021-10-16 16:45:04.621206'),
(28, 'carpool', '0011_publishride_phone', '2021-10-16 16:45:04.668101'),
(29, 'carpool', '0012_remove_publishride_phone', '2021-10-16 16:45:04.699357'),
(30, 'carpool', '0013_delete_publishride', '2021-10-16 16:45:04.714980'),
(31, 'carpool', '0014_offerride', '2021-10-16 16:45:04.895502'),
(32, 'sessions', '0001_initial', '2021-10-16 16:45:05.060769'),
(33, 'carpool', '0015_cardetails', '2021-10-16 16:45:41.487723'),
(34, 'carpool', '0016_seekride', '2021-10-16 18:28:18.602624'),
(35, 'carpool', '0017_feedback', '2021-10-27 07:02:53.473727'),
(36, 'carpool', '0018_comments', '2021-10-27 09:31:59.250098'),
(37, 'carpool', '0019_auto_20211029_1102', '2021-10-29 05:32:23.900749'),
(38, 'carpool', '0020_supportticket', '2021-10-29 09:26:36.505424'),
(39, 'carpool', '0021_payment', '2021-10-29 11:28:54.997887'),
(40, 'carpool', '0002_auto_20211123_0205', '2021-11-22 20:35:55.309193'),
(41, 'carpool', '0003_auto_20211123_0903', '2021-11-23 03:34:02.108074'),
(42, 'carpool', '0002_feedback_owner_feedback_passenger', '2021-11-23 06:32:34.164651'),
(43, 'carpool', '0003_cardetails_carpic', '2021-11-27 07:21:01.691197'),
(44, 'carpool', '0004_cardetails_acnonac', '2021-11-27 07:39:17.289485'),
(45, 'carpool', '0005_auto_20211127_1441', '2021-11-27 09:12:03.567824'),
(46, 'carpool', '0006_auto_20211128_1814', '2021-11-28 12:44:17.864407'),
(47, 'carpool', '0007_rename_carname_offerride_carnames', '2021-11-28 16:49:33.752923'),
(48, 'carpool', '0008_alter_offerride_carnames', '2021-11-28 17:19:21.443403'),
(49, 'carpool', '0009_alter_offerride_seatno', '2021-11-28 17:20:53.545790'),
(50, 'carpool', '0010_auto_20211128_2254', '2021-11-28 17:24:19.064989'),
(51, 'carpool', '0011_auto_20211128_2258', '2021-11-28 17:28:53.303197'),
(52, 'carpool', '0012_auto_20211129_0805', '2021-11-29 02:35:31.538378'),
(53, 'carpool', '0013_rename_carpic_cardetails_image', '2021-11-29 07:18:47.609049'),
(54, 'carpool', '0014_seekride_offerride', '2021-11-29 10:19:33.460729'),
(55, 'carpool', '0015_offerride_status', '2021-11-29 14:24:42.585179'),
(56, 'carpool', '0016_rate', '2021-12-01 11:55:21.210232');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0epcl26gldiovpvvq8r8b540x1rs6lp6', '.eJxVjMsOwiAQRf-FtSEM5SEu3fcbyDAwUjU0Ke3K-O_apAvd3nPOfYmI21rj1ssSpywuAsTpd0tIj9J2kO_YbrOkua3LlOSuyIN2Oc65PK-H-3dQsddvrchb7wGyz5xMKcEwW2d1sgwATpsAaQAIQIiFlaZwNkReq6zNgOzE-wPXtTeW:1mds1W:-fUWXsCmHQvYJPAS-BisCVdHPAUlEg2wEMjxbAco37M', '2021-11-05 10:43:42.668329'),
('4jto63w194q10nufsoeb2wyvtdd833ss', '.eJxVjMsOwiAQRf-FtSEM5SEu3fcbyDAwUjU0Ke3K-O_apAvd3nPOfYmI21rj1ssSpywuAsTpd0tIj9J2kO_YbrOkua3LlOSuyIN2Oc65PK-H-3dQsddvrchb7wGyz5xMKcEwW2d1sgwATpsAaQAIQIiFlaZwNkReq6zNgOzE-wPXtTeW:1mdmhy:jkU4-Eq-ZfM4IgFdoDxIDD5U5U30mk__rTsrKZpFwas', '2021-11-05 05:03:10.467491'),
('4k9h8fh83pqw040a5iontfditoxhnz7f', '.eJxVjEEOwiAQRe_C2pB2KFBcuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uzMur0uyWkh9Qd8B3rbdY013WZkt4VfdCmrzPL83K4fwcFW_nWAs53JmT0zOMA5HygPBhiSA5tzogAZBMFY0dB7iwCWrF98oC-l6zeH_uKOL0:1mmXOF:h4nM_64-xHOqMvoLtUJMRissA8pJLBlGUEDWA8UcPp0', '2021-11-29 08:30:59.869549'),
('7z5pgv6prn9z1hos5d9t5gsmse4nxggd', '.eJxVjMsOwiAQRf-FtSEM5SEu3fcbyDAwUjU0Ke3K-O_apAvd3nPOfYmI21rj1ssSpywuAsTpd0tIj9J2kO_YbrOkua3LlOSuyIN2Oc65PK-H-3dQsddvrchb7wGyz5xMKcEwW2d1sgwATpsAaQAIQIiFlaZwNkReq6zNgOzE-wPXtTeW:1ml1tw:ZQDlrzwXKY5XLE0iRScjQRJJ8aCU_QtBeO5TvHSnL0s', '2021-11-25 04:41:28.142090'),
('9rmy6f050q9en6i1sshej1ydkwkvp48n', '.eJxVjEEOwiAQRe_C2hA7pcC4dO8ZyAwMUjU0Ke3KeHfbpAvd_vfef6tA61LC2mQOY1IX1YE6_Y5M8Sl1J-lB9T7pONVlHlnvij5o07cpyet6uH8HhVrZ6j6CE-qYDHgj_oyMgJgI0YHj3BNaIzQkgOiy42SH2FvhvBXosnj1-QIMsziw:1mpG5k:F0Nypjzuscc0jVG7VtjYwvx9BbptGk9HXhANrPw3y5w', '2021-12-06 20:39:08.628923'),
('ax6j7xbhm1d335b95f4qjcsqp3tmu47z', '.eJxVjEEOwiAQRe_C2hBgmJa6dO8ZCMOAVA0kpV0Z765NutDtf-_9l_BhW4vfelr8zOIsjDj9bhTiI9Ud8D3UW5Ox1XWZSe6KPGiX18bpeTncv4MSevnWo1ZkiXUAoBGy4UmzImSNecoQybpkXMLsBmCFARJodmgHjCay01m8P-cmN_s:1mc2Ma:FAaJE_4I9sxJnn03cjsK7mTRiZygzZ3cRduJMbI9xEk', '2021-10-31 09:21:52.338638'),
('b2y333lexbd0ok7tofo6qvo7dydebyar', '.eJxVjEEOwiAQRe_C2pB2KFBcuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uzMur0uyWkh9Qd8B3rbdY013WZkt4VfdCmrzPL83K4fwcFW_nWAs53JmT0zOMA5HygPBhiSA5tzogAZBMFY0dB7iwCWrF98oC-l6zeH_uKOL0:1mqGql:isBW8KdIzs-P4jxB-7q6dw60MI5QsjA_4KQaPcQItmk', '2021-12-09 15:39:51.930632'),
('f7d67alqciv83edii2m073guo4pw77kh', '.eJxVjEEOwiAQRe_C2pB2KFBcuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uzMur0uyWkh9Qd8B3rbdY013WZkt4VfdCmrzPL83K4fwcFW_nWAs53JmT0zOMA5HygPBhiSA5tzogAZBMFY0dB7iwCWrF98oC-l6zeH_uKOL0:1mfIDH:bHIskZhMLQwlD8CMb7I_zvoJ0BJvz3Tpo5WU76MGc6M', '2021-11-09 08:53:43.063086'),
('jpxonxt2bigoktfm92cw34973qwunbwq', '.eJxVjEEOwiAQRe_C2pB2KFBcuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uzMur0uyWkh9Qd8B3rbdY013WZkt4VfdCmrzPL83K4fwcFW_nWAs53JmT0zOMA5HygPBhiSA5tzogAZBMFY0dB7iwCWrF98oC-l6zeH_uKOL0:1mf3aU:zzS3HeRNDoBd0mpeQCWs-kGTXKVQ5q1c65ojMjruKz4', '2021-11-08 17:16:42.347733'),
('kbfk9hk94elxqnqz6b45tn7bhob40aa8', '.eJxVjMsOwiAQRf-FtSEM5SEu3fcbyDAwUjU0Ke3K-O_apAvd3nPOfYmI21rj1ssSpywuAsTpd0tIj9J2kO_YbrOkua3LlOSuyIN2Oc65PK-H-3dQsddvrchb7wGyz5xMKcEwW2d1sgwATpsAaQAIQIiFlaZwNkReq6zNgOzE-wPXtTeW:1mjZxU:2sUJ4PmvcVSVn9BMQl1Sg0URzDQT-0eLZyY8oH3CxXY', '2021-11-21 04:39:08.831577'),
('ojf3z9wrfbm0m9jj3hwl27zliey6l9n6', '.eJxVjEEOwiAQRe_C2hBgmJa6dO8ZCMOAVA0kpV0Z765NutDtf-_9l_BhW4vfelr8zOIsjDj9bhTiI9Ud8D3UW5Ox1XWZSe6KPGiX18bpeTncv4MSevnWo1ZkiXUAoBGy4UmzImSNecoQybpkXMLsBmCFARJodmgHjCay01m8P-cmN_s:1mpSkn:BlEa9CIS8046yGYtzGDPJ2uxjDZFeSXHtxecoG2ZM8w', '2021-12-07 10:10:21.285969'),
('raih1b5vav3fzbwpugzg8jtoefzp4ox5', '.eJxVjEEOwiAQRe_C2pB2KFBcuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uzMur0uyWkh9Qd8B3rbdY013WZkt4VfdCmrzPL83K4fwcFW_nWAs53JmT0zOMA5HygPBhiSA5tzogAZBMFY0dB7iwCWrF98oC-l6zeH_uKOL0:1mdRUX:uH7jrpy13I53lk8_ouzx8jPx00oQPYRAvv3med-4Fw4', '2021-11-04 06:23:53.815473'),
('rclws0wrfkzml2onqcpfj15j1q3120lu', '.eJxVjMsOwiAQRf-FtSEM5SEu3fcbyDAwUjU0Ke3K-O_apAvd3nPOfYmI21rj1ssSpywuAsTpd0tIj9J2kO_YbrOkua3LlOSuyIN2Oc65PK-H-3dQsddvrchb7wGyz5xMKcEwW2d1sgwATpsAaQAIQIiFlaZwNkReq6zNgOzE-wPXtTeW:1mnyFr:WGwo7DHrZvS84GzGfnwCzvKL6dCCpMiE6H2US6RACyg', '2021-12-03 07:24:15.081393'),
('snvm35tphu1mzwjy020p4m7lbi4scqdc', '.eJxVjEEOgjAQRe_StWk6QzsWl-45A5lOB0FNSSisjHdXEha6_e-9_zI9b-vYb1WXfsrmYsCZ0--YWB5adpLvXG6zlbmsy5TsrtiDVtvNWZ_Xw_07GLmO37qNDQ-ikTwHjuc4EIJjQUBQDDlJgy5HLwGpVeLB-URBUIEAJCGY9wcAmze6:1mjG0p:17qXqbJcaWyKRIIVutqeFJhqjKumvu6471CtvY3YqPI', '2021-11-20 07:21:15.514969'),
('uvq5tqwagsdwjm0w9kk4xyougkozh292', '.eJxVjMsOwiAQRf-FtSEM5SEu3fcbyDAwUjU0Ke3K-O_apAvd3nPOfYmI21rj1ssSpywuAsTpd0tIj9J2kO_YbrOkua3LlOSuyIN2Oc65PK-H-3dQsddvrchb7wGyz5xMKcEwW2d1sgwATpsAaQAIQIiFlaZwNkReq6zNgOzE-wPXtTeW:1msijk:oYN2WBuApmjEdDSFtblM-u3H9MFlbMua1REL0I6MJeA', '2021-12-16 09:50:44.493512'),
('vl3dxue9ohbddxs4h8gcprqunvmwtarh', '.eJxVjEEOwiAQRe_C2pB2KFBcuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uzMur0uyWkh9Qd8B3rbdY013WZkt4VfdCmrzPL83K4fwcFW_nWAs53JmT0zOMA5HygPBhiSA5tzogAZBMFY0dB7iwCWrF98oC-l6zeH_uKOL0:1mhnp5:iaZP8FaF1SkjaCxbC9yrJ6vRQ5Eb3OLapPYXwk9TtgA', '2021-11-16 07:03:07.717675'),
('w09uy8kiscxs6cubz9w1bwqr9xfi4wgb', '.eJxVjEEOwiAQRe_C2pB2KFBcuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uzMur0uyWkh9Qd8B3rbdY013WZkt4VfdCmrzPL83K4fwcFW_nWAs53JmT0zOMA5HygPBhiSA5tzogAZBMFY0dB7iwCWrF98oC-l6zeH_uKOL0:1mgiaL:UWX7NWZoIlDL1YWCT4QaOLLZk08oFcsYg6Dy6j_wRfE', '2021-11-13 07:15:25.814574'),
('ws7lce0m69zdbmvfon4k05tzwe44vq27', '.eJxVjEEOwiAQRe_C2hAKAwWX7j0DGZhBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4kTgLJ06_W8L84LYDumO7zTLPbV2mJHdFHrTL60z8vBzu30HFXr91Us4Wtga8IhgYMAelTWEK1o9sCwApw6BDweJxQAqq-NGRSR6V01a8P-V3N-A:1mpPR0:aU4SaoC4Dzli0zbpx2MBUnpiB0h0ck08pTVvtU6d9rw', '2021-12-07 06:37:42.931569'),
('yczwc7pocjo7tndrwcr53ttf1zmch1id', '.eJxVjEEOwiAQRe_C2pB2KFBcuvcMZJgZpGpoUtqV8e7apAvd_vfef6mI21ri1mSJE6uzMur0uyWkh9Qd8B3rbdY013WZkt4VfdCmrzPL83K4fwcFW_nWAs53JmT0zOMA5HygPBhiSA5tzogAZBMFY0dB7iwCWrF98oC-l6zeH_uKOL0:1mmsk4:RDtkERx2BzXRWZFC6ZRTlTbB1vCbb7LpP1L1Yu7d1SU', '2021-11-30 07:18:56.471922');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `carpool_cardetails`
--
ALTER TABLE `carpool_cardetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carpool_cardetails_owner_id_fa360448_fk_carpool_ownerentry_id` (`owner_id`);

--
-- Indexes for table `carpool_comments`
--
ALTER TABLE `carpool_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carpool_comments_owner_id_244ec3fd_fk_carpool_ownerentry_id` (`owner_id`),
  ADD KEY `carpool_comments_passenger_id_8fe0ab70_fk_carpool_p` (`passenger_id`),
  ADD KEY `carpool_comments_ride_id_6f042806_fk_carpool_seekride_id` (`ride_id`);

--
-- Indexes for table `carpool_feedback`
--
ALTER TABLE `carpool_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carpool_feedback_owner_id_46159181_fk_carpool_ownerentry_id` (`owner_id`),
  ADD KEY `carpool_feedback_passenger_id_3d6a5275_fk_carpool_p` (`passenger_id`),
  ADD KEY `carpool_feedback_user_id_02be4a65_fk_carpool_usertype_id` (`user_id`);

--
-- Indexes for table `carpool_feedback_owner`
--
ALTER TABLE `carpool_feedback_owner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carpool_feedback_own_owner_id_b33d18c5_fk_carpool_o` (`owner_id`),
  ADD KEY `carpool_feedback_owner_user_id_b5b91f86_fk_carpool_usertype_id` (`user_id`);

--
-- Indexes for table `carpool_feedback_passenger`
--
ALTER TABLE `carpool_feedback_passenger`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carpool_feedback_pas_passenger_id_0aa388f8_fk_carpool_p` (`passenger_id`),
  ADD KEY `carpool_feedback_pas_user_id_26eaf252_fk_carpool_u` (`user_id`);

--
-- Indexes for table `carpool_offerride`
--
ALTER TABLE `carpool_offerride`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carpool_offerride_owner_id_91661f3d_fk_carpool_ownerentry_id` (`owner_id`),
  ADD KEY `carpool_offerride_cardetails_id_ed645907_fk_carpool_c` (`cardetails_id`);

--
-- Indexes for table `carpool_ownerentry`
--
ALTER TABLE `carpool_ownerentry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carpool_ownerentry_user_id_f7a22f34_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `carpool_passengerentry`
--
ALTER TABLE `carpool_passengerentry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carpool_passengerentry_user_id_f31d81e9_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `carpool_payment`
--
ALTER TABLE `carpool_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carpool_payment_owner_id_8de22a6c_fk_carpool_ownerentry_id` (`owner_id`),
  ADD KEY `carpool_payment_passenger_id_20625c49_fk_carpool_p` (`passenger_id`);

--
-- Indexes for table `carpool_rate`
--
ALTER TABLE `carpool_rate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carpool_rate_passenger_id_2bc93680_fk_carpool_passengerentry_id` (`passenger_id`);

--
-- Indexes for table `carpool_seekride`
--
ALTER TABLE `carpool_seekride`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carpool_seekride_passenger_id_e48be0b7_fk_carpool_p` (`passenger_id`),
  ADD KEY `carpool_seekride_offerride_id_624df55c_fk_carpool_offerride_id` (`offerride_id`);

--
-- Indexes for table `carpool_supportticket`
--
ALTER TABLE `carpool_supportticket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carpool_usertype`
--
ALTER TABLE `carpool_usertype`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carpool_usertype_user_id_a64840aa_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carpool_cardetails`
--
ALTER TABLE `carpool_cardetails`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `carpool_comments`
--
ALTER TABLE `carpool_comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carpool_feedback`
--
ALTER TABLE `carpool_feedback`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `carpool_feedback_owner`
--
ALTER TABLE `carpool_feedback_owner`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `carpool_feedback_passenger`
--
ALTER TABLE `carpool_feedback_passenger`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `carpool_offerride`
--
ALTER TABLE `carpool_offerride`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `carpool_ownerentry`
--
ALTER TABLE `carpool_ownerentry`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `carpool_passengerentry`
--
ALTER TABLE `carpool_passengerentry`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `carpool_payment`
--
ALTER TABLE `carpool_payment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carpool_rate`
--
ALTER TABLE `carpool_rate`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `carpool_seekride`
--
ALTER TABLE `carpool_seekride`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `carpool_supportticket`
--
ALTER TABLE `carpool_supportticket`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carpool_usertype`
--
ALTER TABLE `carpool_usertype`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `carpool_cardetails`
--
ALTER TABLE `carpool_cardetails`
  ADD CONSTRAINT `carpool_cardetails_owner_id_fa360448_fk_carpool_ownerentry_id` FOREIGN KEY (`owner_id`) REFERENCES `carpool_ownerentry` (`id`);

--
-- Constraints for table `carpool_comments`
--
ALTER TABLE `carpool_comments`
  ADD CONSTRAINT `carpool_comments_owner_id_244ec3fd_fk_carpool_ownerentry_id` FOREIGN KEY (`owner_id`) REFERENCES `carpool_ownerentry` (`id`),
  ADD CONSTRAINT `carpool_comments_passenger_id_8fe0ab70_fk_carpool_p` FOREIGN KEY (`passenger_id`) REFERENCES `carpool_passengerentry` (`id`),
  ADD CONSTRAINT `carpool_comments_ride_id_6f042806_fk_carpool_seekride_id` FOREIGN KEY (`ride_id`) REFERENCES `carpool_seekride` (`id`);

--
-- Constraints for table `carpool_feedback`
--
ALTER TABLE `carpool_feedback`
  ADD CONSTRAINT `carpool_feedback_passenger_id_3d6a5275_fk_carpool_p` FOREIGN KEY (`passenger_id`) REFERENCES `carpool_passengerentry` (`id`),
  ADD CONSTRAINT `carpool_feedback_user_id_02be4a65_fk_carpool_usertype_id` FOREIGN KEY (`user_id`) REFERENCES `carpool_usertype` (`id`);

--
-- Constraints for table `carpool_feedback_owner`
--
ALTER TABLE `carpool_feedback_owner`
  ADD CONSTRAINT `carpool_feedback_own_owner_id_b33d18c5_fk_carpool_o` FOREIGN KEY (`owner_id`) REFERENCES `carpool_ownerentry` (`id`),
  ADD CONSTRAINT `carpool_feedback_owner_user_id_b5b91f86_fk_carpool_usertype_id` FOREIGN KEY (`user_id`) REFERENCES `carpool_usertype` (`id`);

--
-- Constraints for table `carpool_feedback_passenger`
--
ALTER TABLE `carpool_feedback_passenger`
  ADD CONSTRAINT `carpool_feedback_pas_passenger_id_0aa388f8_fk_carpool_p` FOREIGN KEY (`passenger_id`) REFERENCES `carpool_passengerentry` (`id`),
  ADD CONSTRAINT `carpool_feedback_pas_user_id_26eaf252_fk_carpool_u` FOREIGN KEY (`user_id`) REFERENCES `carpool_usertype` (`id`);

--
-- Constraints for table `carpool_offerride`
--
ALTER TABLE `carpool_offerride`
  ADD CONSTRAINT `carpool_offerride_cardetails_id_ed645907_fk_carpool_c` FOREIGN KEY (`cardetails_id`) REFERENCES `carpool_cardetails` (`id`),
  ADD CONSTRAINT `carpool_offerride_owner_id_91661f3d_fk_carpool_ownerentry_id` FOREIGN KEY (`owner_id`) REFERENCES `carpool_ownerentry` (`id`);

--
-- Constraints for table `carpool_ownerentry`
--
ALTER TABLE `carpool_ownerentry`
  ADD CONSTRAINT `carpool_ownerentry_user_id_f7a22f34_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `carpool_passengerentry`
--
ALTER TABLE `carpool_passengerentry`
  ADD CONSTRAINT `carpool_passengerentry_user_id_f31d81e9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `carpool_payment`
--
ALTER TABLE `carpool_payment`
  ADD CONSTRAINT `carpool_payment_owner_id_8de22a6c_fk_carpool_ownerentry_id` FOREIGN KEY (`owner_id`) REFERENCES `carpool_ownerentry` (`id`),
  ADD CONSTRAINT `carpool_payment_passenger_id_20625c49_fk_carpool_p` FOREIGN KEY (`passenger_id`) REFERENCES `carpool_passengerentry` (`id`);

--
-- Constraints for table `carpool_rate`
--
ALTER TABLE `carpool_rate`
  ADD CONSTRAINT `carpool_rate_passenger_id_2bc93680_fk_carpool_passengerentry_id` FOREIGN KEY (`passenger_id`) REFERENCES `carpool_passengerentry` (`id`);

--
-- Constraints for table `carpool_seekride`
--
ALTER TABLE `carpool_seekride`
  ADD CONSTRAINT `carpool_seekride_offerride_id_624df55c_fk_carpool_offerride_id` FOREIGN KEY (`offerride_id`) REFERENCES `carpool_offerride` (`id`),
  ADD CONSTRAINT `carpool_seekride_passenger_id_e48be0b7_fk_carpool_p` FOREIGN KEY (`passenger_id`) REFERENCES `carpool_passengerentry` (`id`);

--
-- Constraints for table `carpool_usertype`
--
ALTER TABLE `carpool_usertype`
  ADD CONSTRAINT `carpool_usertype_user_id_a64840aa_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
