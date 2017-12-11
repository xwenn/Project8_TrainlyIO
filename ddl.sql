-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 09, 2017 at 01:37 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
DROP DATABASE IF EXISTS `TRAINLY`;


/*******************************************************************************
   Create database
********************************************************************************/
CREATE DATABASE `TRAINLY`;


USE `TRAINLY`;


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `TRAINLY`
--

-- --------------------------------------------------------

--
-- Table structure for table `Administrator`
--

CREATE TABLE `Administrator` (
  `AdminId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `Grantor` int(11) DEFAULT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Course`
--

CREATE TABLE `Course` (
  `CourseId` int(11) NOT NULL,
  `Name` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Description` text CHARACTER SET utf8,
  `Icon` text CHARACTER SET utf8,
  `Cost` decimal(10,2) NOT NULL,
  `TopicId` int(11) NOT NULL,
  `AvgRating` decimal(10,0) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CourseCreation`
--

CREATE TABLE `CourseCreation` (
  `CourseId` int(11) NOT NULL,
  `FacultyId` int(11) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CourseEnrollment`
--

CREATE TABLE `CourseEnrollment` (
  `StuId` int(11) NOT NULL,
  `CourseId` int(11) NOT NULL,
  `Code` varchar(20) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Rating` enum('1','2','3','4','5') DEFAULT NULL,
  `Certification` tinyint(1) DEFAULT NULL,
  `CompleteDate` date DEFAULT NULL,
  `Comment` text CHARACTER SET utf8
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CourseInterest`
--

CREATE TABLE `CourseInterest` (
  `CourseId` int(11) NOT NULL,
  `StuId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `CourseMaterial`
--

CREATE TABLE `CourseMaterial` (
  `MaterialId` int(11) NOT NULL,
  `CourseId` int(11) NOT NULL,
  `OrderId` int(4) NOT NULL,
  `Name` varchar(200) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `DownloadableFile`
--

CREATE TABLE `DownloadableFile` (
  `MaterialId` int(11) NOT NULL,
  `Path` varchar(400) CHARACTER SET utf8 NOT NULL,
  `Size` int(20) NOT NULL,
  `Type` varchar(40) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Faculty`
--

CREATE TABLE `Faculty` (
  `FacultyId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `Title` varchar(30) CHARACTER SET utf8 NOT NULL,
  `Affiliation` varchar(40) CHARACTER SET utf8 NOT NULL,
  `Website` text CHARACTER SET utf8 NOT NULL,
  `VerifiedBy` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `FindUseful`
--

CREATE TABLE `FindUseful` (
  `FacultyId` int(11) NOT NULL,
  `QuestionId` int(11) NOT NULL,
  `Visible` tinyint(1) NOT NULL,
  `Answer` text CHARACTER SET utf8
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `LikeQuestion`
--

CREATE TABLE `LikeQuestion` (
  `StuId` int(11) NOT NULL,
  `QuestionId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Link`
--

CREATE TABLE `Link` (
  `MaterialId` int(11) NOT NULL,
  `URL` text CHARACTER SET utf8 NOT NULL,
  `VideoTag` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `MaterialCompletion`
--

CREATE TABLE `MaterialCompletion` (
  `StuId` int(11) NOT NULL,
  `MaterialId` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Post`
--

CREATE TABLE `Post` (
  `MaterialId` int(11) NOT NULL,
  `Text` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Question`
--

CREATE TABLE `Question` (
  `QuestionId` int(11) NOT NULL,
  `Title` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Content` text CHARACTER SET utf8 NOT NULL,
  `StuId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `QuestionRelateTo`
--

CREATE TABLE `QuestionRelateTo` (
  `QuestionId` int(11) NOT NULL,
  `MaterialId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `SecondaryTopics`
--

CREATE TABLE `SecondaryTopics` (
  `CourseId` int(11) NOT NULL,
  `TopicId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE `Student` (
  `StuId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Topic`
--

CREATE TABLE `Topic` (
  `TopicId` int(11) NOT NULL,
  `Name` varchar(200) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `UserId` int(11) NOT NULL,
  `Email` varchar(60) CHARACTER SET utf8 NOT NULL,
  `FirstName` varchar(40) CHARACTER SET utf8 NOT NULL,
  `LastName` varchar(20) CHARACTER SET utf8 NOT NULL,
  `Password` varchar(100) CHARACTER SET utf8 NOT NULL,
  `Salt` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `Phone` varchar(24) CHARACTER SET utf8 DEFAULT NULL,
  `ProfilePic` text CHARACTER SET utf8,
  `Street` varchar(70) CHARACTER SET utf8 DEFAULT NULL,
  `City` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `PostalCode` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `Country` varchar(40) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Administrator`
--
ALTER TABLE `Administrator`
  ADD PRIMARY KEY (`AdminId`),
  ADD KEY `Grantor` (`Grantor`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `Course`
--
ALTER TABLE `Course`
  ADD PRIMARY KEY (`CourseId`),
  ADD KEY `TopicId` (`TopicId`);

--
-- Indexes for table `CourseCreation`
--
ALTER TABLE `CourseCreation`
  ADD PRIMARY KEY (`CourseId`,`FacultyId`),
  ADD KEY `FacultyId` (`FacultyId`);

--
-- Indexes for table `CourseEnrollment`
--
ALTER TABLE `CourseEnrollment`
  ADD PRIMARY KEY (`StuId`,`CourseId`),
  ADD KEY `CourseId` (`CourseId`);

--
-- Indexes for table `CourseInterest`
--
ALTER TABLE `CourseInterest`
  ADD PRIMARY KEY (`CourseId`,`StuId`),
  ADD KEY `StuId` (`StuId`);

--
-- Indexes for table `CourseMaterial`
--
ALTER TABLE `CourseMaterial`
  ADD PRIMARY KEY (`MaterialId`),
  ADD KEY `CourseId` (`CourseId`);

--
-- Indexes for table `DownloadableFile`
--
ALTER TABLE `DownloadableFile`
  ADD PRIMARY KEY (`MaterialId`);

--
-- Indexes for table `Faculty`
--
ALTER TABLE `Faculty`
  ADD PRIMARY KEY (`FacultyId`),
  ADD KEY `UserId` (`UserId`),
  ADD KEY `VerifiedBy` (`VerifiedBy`);

--
-- Indexes for table `FindUseful`
--
ALTER TABLE `FindUseful`
  ADD PRIMARY KEY (`FacultyId`,`QuestionId`),
  ADD KEY `QuestionId` (`QuestionId`);

--
-- Indexes for table `LikeQuestion`
--
ALTER TABLE `LikeQuestion`
  ADD PRIMARY KEY (`StuId`,`QuestionId`),
  ADD KEY `QuestionId` (`QuestionId`);

--
-- Indexes for table `Link`
--
ALTER TABLE `Link`
  ADD PRIMARY KEY (`MaterialId`);

--
-- Indexes for table `MaterialCompletion`
--
ALTER TABLE `MaterialCompletion`
  ADD PRIMARY KEY (`StuId`,`MaterialId`),
  ADD KEY `MaterialId` (`MaterialId`);

--
-- Indexes for table `Post`
--
ALTER TABLE `Post`
  ADD PRIMARY KEY (`MaterialId`);

--
-- Indexes for table `Question`
--
ALTER TABLE `Question`
  ADD PRIMARY KEY (`QuestionId`),
  ADD KEY `StuId` (`StuId`);

--
-- Indexes for table `QuestionRelateTo`
--
ALTER TABLE `QuestionRelateTo`
  ADD PRIMARY KEY (`QuestionId`,`MaterialId`),
  ADD KEY `MaterialId` (`MaterialId`);

--
-- Indexes for table `SecondaryTopics`
--
ALTER TABLE `SecondaryTopics`
  ADD PRIMARY KEY (`CourseId`,`TopicId`),
  ADD KEY `TopicId` (`TopicId`);

--
-- Indexes for table `Student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`StuId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `Topic`
--
ALTER TABLE `Topic`
  ADD PRIMARY KEY (`TopicId`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Administrator`
--
ALTER TABLE `Administrator`
  MODIFY `AdminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `Course`
--
ALTER TABLE `Course`
  MODIFY `CourseId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `CourseMaterial`
--
ALTER TABLE `CourseMaterial`
  MODIFY `MaterialId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=265;
--
-- AUTO_INCREMENT for table `Faculty`
--
ALTER TABLE `Faculty`
  MODIFY `FacultyId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `Question`
--
ALTER TABLE `Question`
  MODIFY `QuestionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `Student`
--
ALTER TABLE `Student`
  MODIFY `StuId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=341;
--
-- AUTO_INCREMENT for table `Topic`
--
ALTER TABLE `Topic`
  MODIFY `TopicId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Administrator`
--
ALTER TABLE `Administrator`
  ADD CONSTRAINT `administrator_ibfk_1` FOREIGN KEY (`Grantor`) REFERENCES `Administrator` (`AdminId`),
  ADD CONSTRAINT `administrator_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Course`
--
ALTER TABLE `Course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`TopicId`) REFERENCES `Topic` (`TopicId`);

--
-- Constraints for table `CourseCreation`
--
ALTER TABLE `CourseCreation`
  ADD CONSTRAINT `coursecreation_ibfk_2` FOREIGN KEY (`FacultyId`) REFERENCES `Faculty` (`FacultyId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `coursecreation_ibfk_3` FOREIGN KEY (`CourseId`) REFERENCES `Course` (`CourseId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `CourseEnrollment`
--
ALTER TABLE `CourseEnrollment`
  ADD CONSTRAINT `courseenrollment_ibfk_1` FOREIGN KEY (`StuId`) REFERENCES `Student` (`StuId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `courseenrollment_ibfk_2` FOREIGN KEY (`CourseId`) REFERENCES `Course` (`CourseId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `CourseInterest`
--
ALTER TABLE `CourseInterest`
  ADD CONSTRAINT `courseinterest_ibfk_1` FOREIGN KEY (`CourseId`) REFERENCES `Course` (`CourseId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `courseinterest_ibfk_2` FOREIGN KEY (`StuId`) REFERENCES `Student` (`StuId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `CourseMaterial`
--
ALTER TABLE `CourseMaterial`
  ADD CONSTRAINT `coursematerial_ibfk_1` FOREIGN KEY (`CourseId`) REFERENCES `Course` (`CourseId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `DownloadableFile`
--
ALTER TABLE `DownloadableFile`
  ADD CONSTRAINT `downloadablefile_ibfk_1` FOREIGN KEY (`MaterialId`) REFERENCES `CourseMaterial` (`MaterialId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Faculty`
--
ALTER TABLE `Faculty`
  ADD CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `faculty_ibfk_2` FOREIGN KEY (`VerifiedBy`) REFERENCES `Administrator` (`AdminId`);

--
-- Constraints for table `FindUseful`
--
ALTER TABLE `FindUseful`
  ADD CONSTRAINT `finduseful_ibfk_1` FOREIGN KEY (`FacultyId`) REFERENCES `Faculty` (`FacultyId`),
  ADD CONSTRAINT `finduseful_ibfk_2` FOREIGN KEY (`QuestionId`) REFERENCES `Question` (`QuestionId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `LikeQuestion`
--
ALTER TABLE `LikeQuestion`
  ADD CONSTRAINT `likequestion_ibfk_1` FOREIGN KEY (`QuestionId`) REFERENCES `Question` (`QuestionId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likequestion_ibfk_2` FOREIGN KEY (`StuId`) REFERENCES `Student` (`StuId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Link`
--
ALTER TABLE `Link`
  ADD CONSTRAINT `link_ibfk_1` FOREIGN KEY (`MaterialId`) REFERENCES `CourseMaterial` (`MaterialId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `MaterialCompletion`
--
ALTER TABLE `MaterialCompletion`
  ADD CONSTRAINT `materialcompletion_ibfk_1` FOREIGN KEY (`StuId`) REFERENCES `Student` (`StuId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `materialcompletion_ibfk_2` FOREIGN KEY (`MaterialId`) REFERENCES `CourseMaterial` (`MaterialId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Post`
--
ALTER TABLE `Post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`MaterialId`) REFERENCES `CourseMaterial` (`MaterialId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Question`
--
ALTER TABLE `Question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`StuId`) REFERENCES `Student` (`StuId`);

--
-- Constraints for table `QuestionRelateTo`
--
ALTER TABLE `QuestionRelateTo`
  ADD CONSTRAINT `questionrelateto_ibfk_1` FOREIGN KEY (`QuestionId`) REFERENCES `Question` (`QuestionId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questionrelateto_ibfk_2` FOREIGN KEY (`MaterialId`) REFERENCES `CourseMaterial` (`MaterialId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `SecondaryTopics`
--
ALTER TABLE `SecondaryTopics`
  ADD CONSTRAINT `secondarytopics_ibfk_1` FOREIGN KEY (`CourseId`) REFERENCES `Course` (`CourseId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `secondarytopics_ibfk_2` FOREIGN KEY (`TopicId`) REFERENCES `Topic` (`TopicId`);

--
-- Constraints for table `Student`
--
ALTER TABLE `Student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
