CREATE DATABASE  IF NOT EXISTS `university` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `university`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: university
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adviser`
--

DROP TABLE IF EXISTS `adviser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adviser` (
  `adviserNo` int NOT NULL,
  `fullName` varchar(50) DEFAULT NULL,
  `phoneNo` char(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `position` varchar(25) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `placeNo` char(5) DEFAULT NULL,
  `studentID` int DEFAULT NULL,
  PRIMARY KEY (`adviserNo`),
  UNIQUE KEY `adviserNo` (`adviserNo`),
  UNIQUE KEY `phoneNo` (`phoneNo`),
  UNIQUE KEY `email` (`email`),
  KEY `placeNo` (`placeNo`),
  KEY `studentID` (`studentID`),
  CONSTRAINT `adviser_ibfk_1` FOREIGN KEY (`placeNo`) REFERENCES `room` (`placeNo`),
  CONSTRAINT `adviser_ibfk_2` FOREIGN KEY (`studentID`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `courseNo` char(5) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `instructor` varchar(50) DEFAULT NULL,
  `instr_phoneNo` varchar(20) DEFAULT NULL,
  `instr_email` varchar(50) DEFAULT NULL,
  `instr_roomNo` varchar(20) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`courseNo`),
  UNIQUE KEY `courseNo` (`courseNo`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `instr_phoneNo` (`instr_phoneNo`),
  UNIQUE KEY `instr_email` (`instr_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flat`
--

DROP TABLE IF EXISTS `flat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flat` (
  `flatNo` char(5) NOT NULL,
  `noOfRooms` int DEFAULT NULL,
  `fAddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`flatNo`),
  UNIQUE KEY `flatNo` (`flatNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hall`
--

DROP TABLE IF EXISTS `hall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hall` (
  `hallNo` char(5) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `hAddress` varchar(50) DEFAULT NULL,
  `phoneNo` varchar(20) DEFAULT NULL,
  `staffID` int DEFAULT NULL,
  PRIMARY KEY (`hallNo`),
  UNIQUE KEY `hallNo` (`hallNo`),
  UNIQUE KEY `phoneNo` (`phoneNo`),
  KEY `staffID` (`staffID`),
  CONSTRAINT `hall_ibfk_1` FOREIGN KEY (`staffID`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inspection`
--

DROP TABLE IF EXISTS `inspection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inspection` (
  `iDate` date NOT NULL,
  `monthlyRent` varchar(10) DEFAULT NULL,
  `Comments` text,
  `staffNo` int DEFAULT NULL,
  `flatNo` char(5) DEFAULT NULL,
  PRIMARY KEY (`iDate`),
  UNIQUE KEY `iDate` (`iDate`),
  KEY `staffNo` (`staffNo`),
  KEY `flatNo` (`flatNo`),
  CONSTRAINT `inspection_ibfk_1` FOREIGN KEY (`staffNo`) REFERENCES `staff` (`id`),
  CONSTRAINT `inspection_ibfk_2` FOREIGN KEY (`flatNo`) REFERENCES `flat` (`flatNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `invoiceNo` int NOT NULL,
  `stdName` varchar(50) DEFAULT NULL,
  `paymentMethod` varchar(10) DEFAULT NULL,
  `paymentDue` date DEFAULT NULL,
  `reminderDate1` date DEFAULT NULL,
  `reminderDate2` date DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `studentID` int DEFAULT NULL,
  `leaseNo` int DEFAULT NULL,
  `placeNo` char(5) DEFAULT NULL,
  PRIMARY KEY (`invoiceNo`),
  UNIQUE KEY `invoiceNo` (`invoiceNo`),
  UNIQUE KEY `paymentDue` (`paymentDue`),
  UNIQUE KEY `reminderDate1` (`reminderDate1`),
  UNIQUE KEY `reminderDate2` (`reminderDate2`),
  KEY `leaseNo` (`leaseNo`),
  KEY `placeNo` (`placeNo`),
  KEY `studentID` (`studentID`),
  CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`leaseNo`) REFERENCES `lease` (`leaseNo`),
  CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`placeNo`) REFERENCES `room` (`placeNo`),
  CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`studentID`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lease`
--

DROP TABLE IF EXISTS `lease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lease` (
  `leaseNo` int NOT NULL,
  `duration` varchar(20) DEFAULT NULL,
  `entreDate` date DEFAULT NULL,
  `leaveDate` date DEFAULT NULL,
  `placeNo` char(5) DEFAULT NULL,
  `studentID` int DEFAULT NULL,
  PRIMARY KEY (`leaseNo`),
  UNIQUE KEY `leaseNo` (`leaseNo`),
  UNIQUE KEY `entreDate` (`entreDate`),
  UNIQUE KEY `leaveDate` (`leaveDate`),
  KEY `placeNo` (`placeNo`),
  KEY `studentID` (`studentID`),
  CONSTRAINT `lease_ibfk_1` FOREIGN KEY (`placeNo`) REFERENCES `room` (`placeNo`),
  CONSTRAINT `lease_ibfk_2` FOREIGN KEY (`studentID`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `next_of_kin`
--

DROP TABLE IF EXISTS `next_of_kin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `next_of_kin` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `relationship` varchar(25) DEFAULT NULL,
  `phoneNo` varchar(20) DEFAULT NULL,
  `street` varchar(25) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  `pcode` char(8) DEFAULT NULL,
  `studentID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `phoneNo` (`phoneNo`),
  KEY `studentID` (`studentID`),
  CONSTRAINT `next_of_kin_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `placeNo` char(5) NOT NULL,
  `roomNo` int DEFAULT NULL,
  `monthlyRent` varchar(10) DEFAULT NULL,
  `hallNo` varchar(5) DEFAULT NULL,
  `flatNo` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`placeNo`),
  UNIQUE KEY `placeNo` (`placeNo`),
  KEY `hallNo` (`hallNo`),
  KEY `flatNo` (`flatNo`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`hallNo`) REFERENCES `hall` (`hallNo`),
  CONSTRAINT `room_ibfk_2` FOREIGN KEY (`flatNo`) REFERENCES `flat` (`flatNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `id` int NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `lname` varchar(25) DEFAULT NULL,
  `phoneNo` char(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `street` varchar(25) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  `pcode` char(8) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `sex` varchar(6) DEFAULT NULL,
  `position` varchar(25) DEFAULT NULL,
  `comments` text,
  `hallNo` char(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `phoneNo` (`phoneNo`),
  UNIQUE KEY `email` (`email`),
  KEY `hallNo` (`hallNo`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`hallNo`) REFERENCES `hall` (`hallNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `lname` varchar(25) DEFAULT NULL,
  `phoneNo` char(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `street` varchar(25) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  `pcode` char(8) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `sex` varchar(6) DEFAULT NULL,
  `nationality` varchar(20) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `spatialNeeds` varchar(50) DEFAULT NULL,
  `comments` text,
  `status` varchar(7) DEFAULT NULL,
  `courseNo` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `phoneNo` (`phoneNo`),
  UNIQUE KEY `email` (`email`),
  KEY `courseNo` (`courseNo`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`courseNo`) REFERENCES `course` (`courseNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'university'
--

--
-- Dumping routines for database 'university'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-14 23:34:07
