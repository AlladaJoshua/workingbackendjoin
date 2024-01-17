-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: mergedb
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `courseID` int NOT NULL AUTO_INCREMENT,
  `instructor_id` int DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `criteria` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`courseID`),
  KEY `instructor_id` (`instructor_id`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`instructorID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (15,3,'Java programming','Java basics 101.','test','java.pdf','java.png','2024-01-20','2024-02-20'),(18,1,'Java programming','Java basics 101.','test','java.pdf','java.png','2024-01-20','2024-02-20');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollment` (
  `enrollmentID` int NOT NULL AUTO_INCREMENT,
  `course_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `support_id` int DEFAULT NULL,
  `enrollmentDate` date DEFAULT NULL,
  `cancelled` varchar(255) DEFAULT NULL,
  `cancellationReason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`enrollmentID`),
  KEY `course_id` (`course_id`),
  KEY `user_id` (`user_id`),
  KEY `support_id` (`support_id`),
  CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`courseID`),
  CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`userID`),
  CONSTRAINT `enrollment_ibfk_3` FOREIGN KEY (`support_id`) REFERENCES `support` (`supportID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `instructorID` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile` varchar(255) NOT NULL,
  `signature` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`instructorID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (1,'Norman Badong','nbadong','nbadong@tgsi.com.ph','tgsivsbu','nbadong.png','nbadongSignature.png'),(2,'John Doe','jdoe','jdoe@tgsi.com.ph','tgsivsbu','jdoe.png','jdoeSignature.png'),(3,'Norman Badong','nbadong','nbadong@tgsi.com.ph','tgsivsbu','nbadong.png','nbadongSignature.png');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support`
--

DROP TABLE IF EXISTS `support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support` (
  `supportID` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `profile` varchar(255) NOT NULL,
  PRIMARY KEY (`supportID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support`
--

LOCK TABLES `support` WRITE;
/*!40000 ALTER TABLE `support` DISABLE KEYS */;
/*!40000 ALTER TABLE `support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Joshua Allada','jallada@tgsi.com.ph','tgsivsbu','jallada.png','jallada'),(2,'ichan','ichan@tgsi.com.ph','tgsivsbu','ichan.png','ichan');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-18  1:40:54
