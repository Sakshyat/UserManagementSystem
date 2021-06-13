-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2020 at 06:25 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `users`
--

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `history_id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `activity` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`history_id`, `username`, `activity`, `date`) VALUES
(173, 'admin', 'Logged in', 'Thu Jun 04 21:48:30 NPT 2020'),
(174, 'admin', 'Changed Password', 'Thu Jun 04 21:51:02 NPT 2020'),
(175, 'admin', 'New User saubhagya Added', 'Thu Jun 04 21:51:53 NPT 2020'),
(176, 'admin', 'Logged out', 'Thu Jun 04 21:52:16 NPT 2020'),
(177, 'saubhagya', 'Logged in', 'Thu Jun 04 21:52:29 NPT 2020'),
(178, 'saubhagya', 'Logged in', 'Thu Jun 04 21:54:03 NPT 2020'),
(179, 'saubhagya', 'Logged out', 'Thu Jun 04 21:54:54 NPT 2020'),
(180, 'saubhagya', 'Logged in', 'Thu Jun 04 21:55:01 NPT 2020'),
(181, 'saubhagya', 'Changed Password', 'Thu Jun 04 21:55:22 NPT 2020'),
(182, 'saubhagya', 'Logged out', 'Thu Jun 04 21:55:35 NPT 2020'),
(183, 'singha', 'Created a new Account', 'Thu Jun 04 21:56:07 NPT 2020'),
(184, 'singha', 'Logged in', 'Thu Jun 04 21:56:16 NPT 2020'),
(185, 'singha', 'Logged out', 'Thu Jun 04 21:56:31 NPT 2020'),
(186, 'admin', 'Logged in', 'Thu Jun 04 21:56:39 NPT 2020'),
(187, 'admin', 'Updated details of \'singha\'', 'Thu Jun 04 21:56:58 NPT 2020'),
(188, 'admin', 'Logged out', 'Thu Jun 04 21:57:16 NPT 2020'),
(189, 'veness', 'Created a new Account', 'Thu Jun 04 21:59:06 NPT 2020'),
(190, 'veness', 'Logged in', 'Thu Jun 04 21:59:55 NPT 2020'),
(191, 'veness', 'Changed Password', 'Thu Jun 04 22:00:12 NPT 2020'),
(192, 'veness', 'Logged out', 'Thu Jun 04 22:00:15 NPT 2020'),
(193, 'yuzu', 'Created a new Account', 'Thu Jun 04 22:01:38 NPT 2020'),
(194, 'tom', 'Created a new Account', 'Thu Jun 04 22:02:10 NPT 2020'),
(195, 'admin', 'Logged in', 'Thu Jun 04 22:02:20 NPT 2020'),
(196, 'admin', 'Logged out', 'Thu Jun 04 22:02:51 NPT 2020'),
(197, 'tom', 'Logged in', 'Thu Jun 04 22:03:02 NPT 2020'),
(198, 'tom', 'Logged out', 'Thu Jun 04 22:03:09 NPT 2020'),
(199, 'anonymous', 'Created a new Account', 'Thu Jun 04 22:07:07 NPT 2020');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `report_id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `created_date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`report_id`, `username`, `created_date`) VALUES
(18, 'saubhagya', 'Thu Jun 04 21:51:53 NPT 2020'),
(19, 'singha', 'Thu Jun 04 21:56:07 NPT 2020'),
(20, 'veness', 'Thu Jun 04 21:59:06 NPT 2020'),
(21, 'yuzu', 'Thu Jun 04 22:01:38 NPT 2020'),
(22, 'tom', 'Thu Jun 04 22:02:10 NPT 2020'),
(23, 'anonymous', 'Thu Jun 04 22:07:07 NPT 2020');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `confirm_pass` varchar(50) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `role` varchar(10) NOT NULL DEFAULT 'Client'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `email`, `password`, `confirm_pass`, `phone`, `role`) VALUES
(82, 'Sakshyat', 'Sharma', 'admin', 'sakshyats@gmail.com', 'admin12345', 'admin12345', 9841793851, 'Admin'),
(83, 'Saubhagya', 'Khadka', 'saubhagya', 'saubhagya@gmail.com', 'saub12345', 'saub12345', 9841578624, 'Client'),
(84, 'Singha', 'Tamang', 'singha', 'singha@gmail.com', 'ramesh12345', 'ramesh12345', 9841563218, 'Client'),
(85, 'Venisha', 'Pandey', 'veness', 'venishapandey012@gmail.com', 'venjun12345', 'venjun12345', 9841756489, 'Client'),
(86, 'Sahani', 'Shakya', 'yuzu', 'yuzu20@gmail.com', 'yuzu12345', 'yuzu12345', 9841754219, 'Client'),
(87, 'Thomas', 'Jones', 'tom', 'tomjones@gmail.com', 'tom12345', 'tom12345', 9841576148, 'Client'),
(88, 'John', 'Doe', 'anonymous', 'john@gmail.com', 'john12345', 'john12345', 9841674589, 'Client');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `history_ibfk_1` (`username`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `report_ibfk_1` (`username`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
