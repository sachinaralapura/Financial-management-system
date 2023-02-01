-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2023 at 05:08 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `financial1`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `accid` int(8) NOT NULL,
  `accname` varchar(30) NOT NULL,
  `userid` int(8) NOT NULL,
  `amount` int(12) NOT NULL,
  `Accountnumber` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`accid`, `accname`, `userid`, `amount`, `Accountnumber`) VALUES
(3, 'canara', 1, 10000, 1234567);

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `Name` varchar(30) DEFAULT NULL,
  `accid` int(11) NOT NULL,
  `number` int(30) DEFAULT NULL,
  `cardid` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit`
--

CREATE TABLE `credit` (
  `name` varchar(20) DEFAULT NULL,
  `ammount` int(12) NOT NULL,
  `date` date NOT NULL,
  `accountid` int(8) NOT NULL,
  `credid` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `title` varchar(20) DEFAULT NULL,
  `accountid` int(8) NOT NULL,
  `ammount` int(12) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `title` varchar(20) DEFAULT NULL,
  `date` date NOT NULL,
  `amount` int(12) NOT NULL,
  `accountid` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `EMAIL` varchar(100) NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(260) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`EMAIL`, `name`, `password`) VALUES
('sachin.aralapura@gmail.com', 'sachin', '$2y$10$dk8WTZFU2zUYNcmdtp1TdOg.XQtqkYh8JAkzBAg7gx.Px4qEiGF0y'),
('vinag@gmail.com', 'vinag', '$2y$10$iS7eSfTZHeOURZVXKdrz3.PuN9i5tlD.j6JlUJwEUoVmmVEIrYWZq');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(8) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `username`, `email`) VALUES
(1, 'sachin', 'sachin.aralapura@gmail.com'),
(2, 'vinag', 'vinag@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`accid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`cardid`),
  ADD KEY `accid` (`accid`);

--
-- Indexes for table `credit`
--
ALTER TABLE `credit`
  ADD PRIMARY KEY (`credid`),
  ADD KEY `accountid` (`accountid`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD KEY `expenses_ibfk_1` (`accountid`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD KEY `income_ibfk_1` (`accountid`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`EMAIL`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `accid` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `cardid` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `credit`
--
ALTER TABLE `credit`
  MODIFY `credid` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`uid`);

--
-- Constraints for table `cards`
--
ALTER TABLE `cards`
  ADD CONSTRAINT `cards_ibfk_1` FOREIGN KEY (`accid`) REFERENCES `accounts` (`accid`);

--
-- Constraints for table `credit`
--
ALTER TABLE `credit`
  ADD CONSTRAINT `credit_ibfk_1` FOREIGN KEY (`accountid`) REFERENCES `accounts` (`accid`);

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`accountid`) REFERENCES `accounts` (`accid`) ON DELETE CASCADE;

--
-- Constraints for table `income`
--
ALTER TABLE `income`
  ADD CONSTRAINT `income_ibfk_1` FOREIGN KEY (`accountid`) REFERENCES `accounts` (`accid`) ON DELETE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`email`) REFERENCES `login` (`EMAIL`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
