-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.5.57-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `Username` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `E-Mail` varchar(40) NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('example1','12345678','example1@gmail.com');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `Category` varchar(20) NOT NULL,
  `Course_title` varchar(100) NOT NULL,
  `Course_id` int(11) NOT NULL,
  PRIMARY KEY (`Category`,`Course_title`,`Course_id`),
  KEY `Ca_Course_idx` (`Course_id`,`Course_title`),
  CONSTRAINT `Ca_Course` FOREIGN KEY (`Course_id`, `Course_title`) REFERENCES `course` (`Course_id`, `Course_title`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('CAD_Pragramms','AutoCad For Begginers',110908),('Coding','Learn Java from Scratch',110986),('Coding','Learn Python from Scratch',110093),('Design','Creating 3D Environments using Blender',110185),('Finance','The Complete Investment Banking Course 2019',110489),('Lifestyle','Photography Lighting for Advanced Shooters',119842);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certification`
--

DROP TABLE IF EXISTS `certification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certification` (
  `Certification_id` int(11) NOT NULL,
  `Certification_name` varchar(70) NOT NULL,
  `Certification_date` date NOT NULL,
  PRIMARY KEY (`Certification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certification`
--

LOCK TABLES `certification` WRITE;
/*!40000 ALTER TABLE `certification` DISABLE KEYS */;
INSERT INTO `certification` VALUES (1110123,'Certification in AutoCAD for beginners','2019-03-04'),(1110287,'Certification in Java for Developers','2018-05-03'),(1110456,'Certification in Banking Investment','2018-12-12'),(1110789,'Certification in Professional Photography Editing','2017-04-11'),(1111000,'Certification in Python for Developers','2018-05-03'),(1112000,'Certification in Blender 3D Environments','2015-04-11');
/*!40000 ALTER TABLE `certification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `Content_id` int(11) NOT NULL,
  `Type` enum('Video','Slide') NOT NULL,
  `Chapter` int(11) DEFAULT NULL,
  `Download` tinyint(1) DEFAULT NULL,
  `Course_id` int(11) NOT NULL,
  `Course_title` varchar(100) NOT NULL,
  PRIMARY KEY (`Content_id`,`Course_title`,`Course_id`),
  KEY `Co_Course_id_idx` (`Course_id`,`Course_title`),
  CONSTRAINT `Co_Course` FOREIGN KEY (`Course_id`, `Course_title`) REFERENCES `course` (`Course_id`, `Course_title`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (100010502,'Slide',2,1,110986,'Learn Java from Scratch'),(111000192,'Video',5,0,119842,'Photography Lighting for Advanced Shooters'),(111000193,'Video',1,1,110093,'Learn Python from Scratch'),(122241242,'Slide',3,1,110185,'Creating 3D Environments using Blender'),(124053223,'Slide',4,1,110908,'AutoCad For Begginers'),(150305322,'Video',5,0,110489,'The Complete Investment Banking Course 2019');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `Course_id` int(11) NOT NULL,
  `Course_title` varchar(100) NOT NULL DEFAULT '',
  `Knowledge_Needed` varchar(300) DEFAULT NULL,
  `Hours_Needed` int(11) DEFAULT NULL,
  `Fee` float(4,2) DEFAULT NULL,
  `Forum` tinyint(1) DEFAULT NULL,
  `Username` varchar(30) NOT NULL,
  PRIMARY KEY (`Course_id`,`Course_title`),
  KEY `Co_Username_idx` (`Username`),
  CONSTRAINT `Co_Username` FOREIGN KEY (`Username`) REFERENCES `instructor` (`Username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (110093,'Learn Python From Scratch','No previous knowledge needed',40,85.00,1,'example1');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `course_and_cost`
--

DROP TABLE IF EXISTS `course_and_cost`;
/*!50001 DROP VIEW IF EXISTS `course_and_cost`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `course_and_cost` AS SELECT
 1 AS `Cat`,
 1 AS `Ctit`,
 1 AS `Cfee`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `course_details`
--

DROP TABLE IF EXISTS `course_details`;
/*!50001 DROP VIEW IF EXISTS `course_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `course_details` AS SELECT
 1 AS `Ctit`,
 1 AS `Cknow`,
 1 AS `Chour`,
 1 AS `Ctyp`,
 1 AS `Qquest`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `inst_asks`
--

DROP TABLE IF EXISTS `inst_asks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inst_asks` (
  `Username` varchar(30) NOT NULL,
  `Support_id` int(11) NOT NULL,
  PRIMARY KEY (`Username`,`Support_id`),
  KEY `ISupport_id_idx` (`Support_id`),
  KEY `IUsername_idx` (`Username`),
  CONSTRAINT `IUsername` FOREIGN KEY (`Username`) REFERENCES `instructor` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ISupport_id` FOREIGN KEY (`Support_id`) REFERENCES `support` (`Support_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inst_asks`
--

LOCK TABLES `inst_asks` WRITE;
/*!40000 ALTER TABLE `inst_asks` DISABLE KEYS */;
INSERT INTO `inst_asks` VALUES ('example1',999099);
/*!40000 ALTER TABLE `inst_asks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor` (
  `Username` varchar(30) NOT NULL,
  `Section` varchar(200) DEFAULT NULL,
  `Gender` enum('Male','Female') NOT NULL,
  `Birth_date` date DEFAULT NULL,
  `First_Name` varchar(30) DEFAULT NULL,
  `Last_Name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Username`),
  CONSTRAINT `AUsername` FOREIGN KEY (`Username`) REFERENCES `account` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES ('example1','Ph.D in Business Management','Male','1985-12-12','First_Name','Last_Name')
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `instructor_of_course`
--

DROP TABLE IF EXISTS `instructor_of_course`;
/*!50001 DROP VIEW IF EXISTS `instructor_of_course`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `instructor_of_course` AS SELECT
 1 AS `Ctit`,
 1 AS `Cuser`,
 1 AS `Ifir`,
 1 AS `Ilast`,
 1 AS `Isec`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz` (
  `Quiz_id` int(11) NOT NULL,
  `No_of_questions` int(11) NOT NULL,
  `Grade` float(4,2) DEFAULT NULL,
  `Average` float(4,2) DEFAULT NULL,
  `Course_title` varchar(100) NOT NULL,
  `Course_id` int(11) NOT NULL,
  `Certification_id` int(11) NOT NULL,
  PRIMARY KEY (`Quiz_id`,`Certification_id`,`Course_id`,`Course_title`),
  KEY `QCourse_idx` (`Course_id`,`Course_title`),
  KEY `QCertification_id_idx` (`Certification_id`),
  CONSTRAINT `QCourse` FOREIGN KEY (`Course_id`, `Course_title`) REFERENCES `course` (`Course_id`, `Course_title`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `QCertification_id` FOREIGN KEY (`Certification_id`) REFERENCES `certification` (`Certification_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` VALUES (11000368,8,6.25,6.25,'Creating 3D Environments using Blender',110185,1112000),(11001000,12,10.00,10.00,'Photography Lighting for Advanced Shooters',119842,1110789),(11001001,5,9.00,9.00,'Learn Python from Scratch',110093,1111000),(11003197,16,8.50,8.50,'The Complete Investment Banking Course 2019',110489,1110456),(11004912,10,10.00,10.00,'Learn Java from Scratch',110986,1110287),(11008743,10,5.00,5.00,'AutoCad For Begginers',110908,1110123);
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `quiz_grade`
--

DROP TABLE IF EXISTS `quiz_grade`;
/*!50001 DROP VIEW IF EXISTS `quiz_grade`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `quiz_grade` AS SELECT
 1 AS `Uname`,
 1 AS `Utitle`,
 1 AS `Qid`,
 1 AS `Qgr`,
 1 AS `Qav`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `support`
--

DROP TABLE IF EXISTS `support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `support` (
  `Support_id` int(11) NOT NULL,
  PRIMARY KEY (`Support_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support`
--

LOCK TABLES `support` WRITE;
/*!40000 ALTER TABLE `support` DISABLE KEYS */;
INSERT INTO `support` VALUES (999012),(999034),(999043),(999056),(999066),(999078),(999099);
/*!40000 ALTER TABLE `support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `Username` varchar(30) NOT NULL,
  `Phone_number` int(11) DEFAULT NULL,
  `Gender` enum('Male','Female') NOT NULL,
  `Birth_date` date DEFAULT NULL,
  `Bank_Account` int(11) DEFAULT NULL,
  `Education` enum('Undergraduate','Postgraduate','Else') DEFAULT NULL,
  `First_Name` varchar(30) DEFAULT NULL,
  `Last_Name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Username`),
  CONSTRAINT `UUsername` FOREIGN KEY (`Username`) REFERENCES `account` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('example1',695114234,'Male','1988-12-12',241421,'Undergraduate','First_Name','Last_Name');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_asks`
--

DROP TABLE IF EXISTS `user_asks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_asks` (
  `Username` varchar(30) NOT NULL,
  `Support_id` int(11) NOT NULL,
  PRIMARY KEY (`Username`,`Support_id`),
  KEY `ASupport_id_idx` (`Support_id`),
  KEY `Ask_Username_idx` (`Username`),
  CONSTRAINT `Ask_Username` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ASupport_id` FOREIGN KEY (`Support_id`) REFERENCES `support` (`Support_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_asks`
--

LOCK TABLES `user_asks` WRITE;
/*!40000 ALTER TABLE `user_asks` DISABLE KEYS */;
INSERT INTO `user_asks` VALUES ('example1',999056),
/*!40000 ALTER TABLE `user_asks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_enrolls`
--

DROP TABLE IF EXISTS `user_enrolls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_enrolls` (
  `Course_id` int(11) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Course_title` varchar(100) NOT NULL,
  PRIMARY KEY (`Course_id`,`Username`,`Course_title`),
  KEY `EUsername_idx` (`Username`),
  KEY `ECourse_idx` (`Course_id`,`Course_title`),
  CONSTRAINT `ECourse` FOREIGN KEY (`Course_id`, `Course_title`) REFERENCES `course` (`Course_id`, `Course_title`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EUsername` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_enrolls`
--

LOCK TABLES `user_enrolls` WRITE;
/*!40000 ALTER TABLE `user_enrolls` DISABLE KEYS */;
INSERT INTO `user_enrolls` VALUES (110093,'example1','Learn Python from Scratch');
/*!40000 ALTER TABLE `user_enrolls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rates`
--

DROP TABLE IF EXISTS `user_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_rates` (
  `Course_id` int(11) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Course_title` varchar(100) NOT NULL,
  `Rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`Course_id`,`Username`,`Course_title`),
  KEY `Ra_Username_idx` (`Username`),
  KEY `Ra_Course_idx` (`Course_id`,`Course_title`),
  CONSTRAINT `Ra_Course` FOREIGN KEY (`Course_id`, `Course_title`) REFERENCES `course` (`Course_id`, `Course_title`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Ra_Username` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rates`
--

LOCK TABLES `user_rates` WRITE;
/*!40000 ALTER TABLE `user_rates` DISABLE KEYS */;
INSERT INTO `user_rates` VALUES (110093,'example1','Learn Python from Scratch',10);
/*!40000 ALTER TABLE `user_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_receives`
--

DROP TABLE IF EXISTS `user_receives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_receives` (
  `Username` varchar(30) NOT NULL,
  `Certification_id` int(11) NOT NULL,
  PRIMARY KEY (`Username`,`Certification_id`),
  KEY `Re_Certification_id_idx` (`Certification_id`),
  KEY `Re_Username_idx` (`Username`),
  CONSTRAINT `Re_Username` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Re_Certification_id` FOREIGN KEY (`Certification_id`) REFERENCES `certification` (`Certification_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_receives`
--

LOCK TABLES `user_receives` WRITE;
/*!40000 ALTER TABLE `user_receives` DISABLE KEYS */;
INSERT INTO `user_receives` VALUES ('example1',1110456);
/*!40000 ALTER TABLE `user_receives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_takes`
--

DROP TABLE IF EXISTS `user_takes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_takes` (
  `Username` varchar(30) NOT NULL,
  `Quiz_id` int(11) NOT NULL,
  `Course_title` varchar(100) NOT NULL,
  `Course_id` int(11) NOT NULL,
  PRIMARY KEY (`Username`,`Quiz_id`,`Course_title`,`Course_id`),
  KEY `TQuiz_id_idx` (`Quiz_id`),
  KEY `TCourse_idx` (`Course_id`,`Course_title`),
  KEY `TUsername_idx` (`Username`),
  CONSTRAINT `TQuiz_id` FOREIGN KEY (`Quiz_id`) REFERENCES `quiz` (`Quiz_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `TUsername` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `TCourse` FOREIGN KEY (`Course_id`, `Course_title`) REFERENCES `course` (`Course_id`, `Course_title`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_takes`
--

LOCK TABLES `user_takes` WRITE;
/*!40000 ALTER TABLE `user_takes` DISABLE KEYS */;
INSERT INTO `user_takes` VALUES ('example1',11003197,'The Complete Investment Banking Course 2019',110489);
/*!40000 ALTER TABLE `user_takes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `course_and_cost`
--

/*!50001 DROP VIEW IF EXISTS `course_and_cost`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `course_and_cost` AS select `category`.`Category` AS `Cat`,`course`.`Course_title` AS `Ctit`,`course`.`Fee` AS `Cfee` from (`course` join `category` on((`course`.`Course_title` = `category`.`Course_title`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `course_details`
--

/*!50001 DROP VIEW IF EXISTS `course_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `course_details` AS select `course`.`Course_title` AS `Ctit`,`course`.`Knowledge_Needed` AS `Cknow`,`course`.`Hours_Needed` AS `Chour`,`content`.`Type` AS `Ctyp`,`quiz`.`No_of_questions` AS `Qquest` from ((`course` join `content` on((`course`.`Course_title` = `content`.`Course_title`))) join `quiz` on((`content`.`Course_title` = `quiz`.`Course_title`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `instructor_of_course`
--

/*!50001 DROP VIEW IF EXISTS `instructor_of_course`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `instructor_of_course` AS select `course`.`Course_title` AS `Ctit`,`course`.`Username` AS `Cuser`,`instructor`.`First_Name` AS `Ifir`,`instructor`.`Last_Name` AS `Ilast`,`instructor`.`Section` AS `Isec` from (`course` join `instructor` on((`course`.`Username` = `instructor`.`Username`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `quiz_grade`
--

/*!50001 DROP VIEW IF EXISTS `quiz_grade`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `quiz_grade` AS select `user`.`Username` AS `Uname`,`user_takes`.`Course_title` AS `Utitle`,`quiz`.`Quiz_id` AS `Qid`,`quiz`.`Grade` AS `Qgr`,`quiz`.`Average` AS `Qav` from ((`user` join `user_takes` on((`user`.`Username` = `user_takes`.`Username`))) join `quiz` on((`user_takes`.`Course_title` = `quiz`.`Course_title`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-20 19:37:53
