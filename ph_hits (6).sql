-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 08, 2023 at 04:27 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ph_hits`
--

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `contentID` int(11) NOT NULL,
  `contentTitle` varchar(60) NOT NULL,
  `contentDesc` varchar(155) NOT NULL,
  `schedDate` date NOT NULL,
  `userID` int(11) NOT NULL,
  `filePath` varchar(200) DEFAULT NULL,
  `duration` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`contentID`, `contentTitle`, `contentDesc`, `schedDate`, `userID`, `filePath`, `duration`) VALUES
(48, 'Lazy Song - Bruno Mars', 'jjj', '2023-12-07', 1, 'uploads/Bruno Mars - The Lazy Song (Official Music Video).mp4', '00:03:19'),
(49, 'Smokin Out The Window - Bruno Mars ft. Anderson Paak', 'Sang by Silk Sonic', '2023-12-07', 1, 'uploads/Bruno Mars, Anderson .Paak, Silk Sonic - Smokin Out The Window [Official Music Video].mp4', '00:03:20'),
(50, 'I\'m The One - DJ Khaled', 'Anotha One!', '2023-12-07', 1, 'uploads/DJ Khaled - I\'m The One ft. Justin Bieber, Quavo, Chance the Rapper, Lil Wayne.mp3', '00:05:21'),
(51, 'Marshmello - Alone', 'Do you like smores?', '2023-12-07', 1, 'uploads/Marshmello - Alone (Official Music Video).mp4', '00:03:19'),
(52, 'Happy - Pharell Williams', 'What\'s the opposite of happy? Ethan.', '2023-12-07', 1, 'uploads/Pharrell Williams - Happy (Video).mp3', '00:04:00'),
(53, 'Finesse - Bruno Mars', 'Sang by Bruno Mars the one and only!', '2023-12-07', 1, 'uploads/Bruno Mars - Finesse (Remix) (feat. Cardi B) (Official Music Video).mp3', '00:03:42'),
(54, 'Hymn for the Weeknd - Coldplay', 'Hotwork', '2023-12-07', 1, 'uploads/Coldplay - Hymn For The Weekend (Official Video).mp4', '00:04:20'),
(55, 'Hymn for the Weeknd - Coldplay', 'Hotwork', '2023-12-07', 1, 'uploads/Coldplay - Hymn For The Weekend (Official Video).mp4', '00:04:20'),
(57, 'Welcome to phHits!', 'Listen to the Philippines\' top hits today!', '2023-12-08', 2, 'uploads/Advertisement.mp4', '00:00:35');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `historyID` int(11) NOT NULL,
  `streamDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `queueID` int(11) NOT NULL,
  `contentID` int(11) NOT NULL,
  `dateOfAiring` date NOT NULL,
  `schedTime` time NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `queue`
--

INSERT INTO `queue` (`queueID`, `contentID`, `dateOfAiring`, `schedTime`, `status`) VALUES
(1903, 48, '2023-12-08', '23:05:00', 'queued'),
(1904, 49, '2023-12-08', '23:08:20', 'queued'),
(1905, 50, '2023-12-08', '23:11:00', 'queued'),
(1906, 54, '2023-12-08', '23:16:22', 'queued');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `fName` varchar(20) NOT NULL,
  `lName` varchar(20) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `status` varchar(8) DEFAULT NULL,
  `role` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `fName`, `lName`, `userName`, `password`, `status`, `role`) VALUES
(1, 'Aden', 'Lim', 'sniper', '123', 'ACTIVE', 'Admin'),
(2, 'John', 'Doe', 'woshu', '123', 'ACTIVE', 'Content Manager'),
(3, 'Alice', 'Smith', 'meep', '123', 'ACTIVE', 'Content Manager'),
(4, 'Emily', 'Johnson', 'emilyj', '123', 'ACTIVE', 'Content Manager'),
(5, 'Michael', 'Williams', 'mwill', '123', 'ACTIVE', 'Content Manager'),
(6, 'Sophia', 'Brown', 'lab', '123', 'ACTIVE', 'Content Manager'),
(9, 'Shan', 'Man', 'smac', '123', 'ACTIVE', 'Content Manager');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`contentID`) USING BTREE,
  ADD KEY `userID` (`userID`) USING BTREE;

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`historyID`),
  ADD KEY `streamDate` (`streamDate`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`queueID`),
  ADD KEY `contentID` (`contentID`),
  ADD KEY `dateOfAiring` (`dateOfAiring`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`,`userName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `contentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `historyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `queueID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1907;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `content_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE;

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`streamDate`) REFERENCES `queue` (`dateOfAiring`);

--
-- Constraints for table `queue`
--
ALTER TABLE `queue`
  ADD CONSTRAINT `queue_ibfk_1` FOREIGN KEY (`contentID`) REFERENCES `content` (`contentID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
