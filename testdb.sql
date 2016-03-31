-- MySQL dump 10.13  Distrib 5.6.26, for osx10.9 (x86_64)
--
-- Host: localhost    Database: symfony3
-- ------------------------------------------------------
-- Server version	5.6.26

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
-- Table structure for table `affiliate`
--

DROP TABLE IF EXISTS `affiliate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_597AA5CFE7927C74` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliate`
--

LOCK TABLES `affiliate` WRITE;
/*!40000 ALTER TABLE `affiliate` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_64C19C15E237E06` (`name`),
  UNIQUE KEY `UNIQ_64C19C1989D9B62` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'デザイン','デザイン'),(2,'プログラミング','プログラミング'),(3,'マネージャー','マネージャー'),(4,'アドミニストレーター','アドミニストレーター');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_affiliate`
--

DROP TABLE IF EXISTS `category_affiliate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_affiliate` (
  `affiliate_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`affiliate_id`,`category_id`),
  KEY `IDX_9E1A77FF9F12C49A` (`affiliate_id`),
  KEY `IDX_9E1A77FF12469DE2` (`category_id`),
  CONSTRAINT `FK_9E1A77FF12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_9E1A77FF9F12C49A` FOREIGN KEY (`affiliate_id`) REFERENCES `affiliate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_affiliate`
--

LOCK TABLES `category_affiliate` WRITE;
/*!40000 ALTER TABLE `category_affiliate` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_affiliate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `how_to_apply` longtext COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `is_activated` tinyint(1) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_FBD8E0F85F37A13B` (`token`),
  KEY `IDX_FBD8E0F812469DE2` (`category_id`),
  CONSTRAINT `FK_FBD8E0F812469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,2,'full-time','Company 100',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_100',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(2,2,'full-time','Company 101',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_101',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(3,2,'full-time','Company 102',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_102',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(4,2,'full-time','Company 103',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_103',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(5,2,'full-time','Company 104',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_104',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(6,2,'full-time','Company 105',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_105',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(7,2,'full-time','Company 106',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_106',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(8,2,'full-time','Company 107',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_107',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(9,2,'full-time','Company 108',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_108',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(10,2,'full-time','Company 109',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_109',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(11,2,'full-time','Company 110',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_110',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(12,2,'full-time','Company 111',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_111',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(13,2,'full-time','Company 112',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_112',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(14,2,'full-time','Company 113',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_113',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(15,2,'full-time','Company 114',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_114',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(16,2,'full-time','Company 115',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_115',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(17,2,'full-time','Company 116',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_116',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(18,2,'full-time','Company 117',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_117',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(19,2,'full-time','Company 118',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_118',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(20,2,'full-time','Company 119',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_119',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(21,2,'full-time','Company 120',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_120',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(22,2,'full-time','Company 121',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_121',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(23,2,'full-time','Company 122',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_122',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(24,2,'full-time','Company 123',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_123',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(25,2,'full-time','Company 124',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_124',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(26,2,'full-time','Company 125',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_125',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(27,2,'full-time','Company 126',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_126',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(28,2,'full-time','Company 127',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_127',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(29,2,'full-time','Company 128',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_128',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(30,2,'full-time','Company 129',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_129',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(31,2,'full-time','Company 130',NULL,NULL,'Web Developer','Paris, France','Lorem ipsum dolor sit amet, consectetur adipisicing elit.','Send your resume to lorem.ipsum [at] dolor.sit','job_130',1,1,'job@example.com','2016-04-14 12:35:15','2016-03-15 11:35:15',NULL),(32,1,'full-time','aaa',NULL,'http://127.0.0.1:8000/job/new','cs','csc','cscs','csacs','5e54981cd32d8a018daaa40459c0948173d69a76',1,NULL,'scscsa@cdcs.com','2016-04-20 10:34:57','2016-03-21 09:34:57',NULL),(33,1,'full-time','aaa',NULL,'http://127.0.0.1:8000/job/new','cs','csc','cscs','csacs','61bc50473a7c305ec91a39eb2d6767e60649faeb',1,NULL,'scscsa@cdcs.com','2016-04-20 10:36:26','2016-03-21 09:36:26',NULL),(34,1,'full-time','aaa',NULL,'http://127.0.0.1:8000/job/new','cs','csc','cscs','csacs','decfe333cdf1e3500bbd1616a02fd81ccf133777',1,NULL,'scscsa@cdcs.com','2016-04-20 10:40:46','2016-03-21 09:40:46',NULL),(35,1,'full-time','ascsa',NULL,'http://127.0.0.1:8000/job/new','csaca','csac','cascs','csacas','5455df8d61cfb97efeea55b65bbd1d0730083ef5',1,NULL,'scscsa@cdcs.com','2016-04-20 11:26:59','2016-03-21 10:26:59',NULL),(36,1,'full-time','ascsa',NULL,'http://127.0.0.1:8000/job/new','csaca','csac','cascs','csacas','2c8a8156391f524951a2ffc5df04fc9251ef7ad1',1,NULL,'scscsa@cdcs.com','2016-04-20 11:29:26','2016-03-21 10:29:26',NULL),(37,1,'full-time','ascsa',NULL,'http://127.0.0.1:8000/job/new','csaca','csac','cascs','csacas','70c928cdbb2d21f15afd698baa39965ac2c4841a',1,NULL,'scscsa@cdcs.com','2016-04-20 11:30:10','2016-03-21 10:30:10',NULL),(38,1,'full-time','aa',NULL,'http://docs.symfony.gr.jp/symfony2/book/security.html','aa','aa','aa','aa','acc70ba22b45684811fd622ebdeea29fea2cda1d',1,NULL,'scscsa@cdcs.com','2016-04-20 12:55:48','2016-03-21 11:55:48',NULL),(39,1,'full-time','cscs',NULL,'http://127.0.0.1:8000/job/new','cdscds','csd','csd','cdscds','2e4cf0d4d8934064591075eb7661356677727b82',0,NULL,'scscsa@cdcs.com','2016-04-20 13:23:49','2016-03-21 12:23:49',NULL),(40,1,'full-time','cscs',NULL,'http://127.0.0.1:8000/job/new','cdscds','csd','csd','cdscds','fd18cad6f65fde85baf6f149844796c19e86c7ed',0,NULL,'scscsa@cdcs.com','2016-04-20 13:28:34','2016-03-21 12:28:34',NULL),(41,1,'full-time','sadsdas',NULL,'http://docs.symfony.gr.jp/symfony2/book/security.html','saca','csacs','csacs','casc','6953f0121f97c3f5caa0c9018224e6224325ca26',1,NULL,'cascsa','2016-04-20 13:44:38','2016-03-21 12:44:38',NULL),(42,2,'full-time','attttttt',NULL,'http://docs.symfony.gr.jp/symfony2/book/security.html','saca','csacs','csacs','casc','15da72d95f787d8879c60a4952371d0c3981945a',1,NULL,'cascsa','2016-04-20 13:45:06','2016-03-21 12:45:06',NULL),(43,3,'full-time','sacasa',NULL,'http://127.0.0.1:8000/job/new','csac','csasa','casc','cascsa','51475a334100129a1c962e0233b37d8f32b019c0',1,NULL,'scscsa@cdcs.com','2016-04-20 13:45:48','2016-03-21 12:45:48',NULL),(44,1,'full-time','xxxxxx',NULL,'http://docs.symfony.gr.jp/symfony2/book/security.html','cdscd','csd','cdscdcd','cdscs','9e93ce7744dbb17355dde6862ac6841e7a9e08e2',1,NULL,'dsdasdsa@dsads.com','2016-04-20 14:09:33','2016-03-21 13:09:33',NULL),(45,1,'full-time','xxxxxx','56efe63381e62.jpeg','http://docs.symfony.gr.jp/symfony2/book/security.html','cdscd','csd','cdscdcd','cdscs','8b7ba2d659712f56b0f8aa8435abda24590ab89d',1,NULL,'dsdasdsa@dsads.com','2016-04-20 14:16:51','2016-03-21 13:16:51',NULL),(46,1,'full-time','ooooooooo',NULL,'https://www.youtube.com/watch?v=1ztXTMyx8bk','csac','casacs','cassccas','csacsacsad','47b20ae3230790c177b7760737a97ba7c9a00a33',1,NULL,'scscsa@cdcs.com','2016-04-20 15:33:22','2016-03-21 14:33:22',NULL),(47,4,'full-time','vvvvvvv',NULL,'http://docs.symfony.gr.jp/symfony2/book/service_container.html','dcdaccd','cascsa','cascsa','csacsaad','4c63686e390ad141659c82703d3e133e335790dc',1,NULL,'scscsa@cdcs.com','2016-04-20 16:14:00','2016-03-21 15:14:00',NULL),(48,4,'full-time','vvvvvvv',NULL,'http://docs.symfony.gr.jp/symfony2/book/service_container.html','dcdaccd','cascsa','cascsa','csacsaad','bd90c10ebea60f73855e0198759ceb5021d023cf',1,NULL,'scscsa@cdcs.com','2016-04-20 16:28:22','2016-03-21 15:28:22',NULL),(49,NULL,'full-time','cccc',NULL,'https://www.youtube.com/watch?v=1ztXTMyx8bk','cdsc','cs','cdsc','cds','641d0edc7e489fc7e68bba8f4e8f7750216d00af',1,NULL,'cscsacsa@csacsa.com','2016-04-20 16:30:28','2016-03-21 15:30:28',NULL),(50,NULL,'full-time','cccc',NULL,'https://www.youtube.com/watch?v=1ztXTMyx8bk','cdsc','cs','cdsc','cds','6a0e8878a99efa6a6664b6b95dca2e0b68bf4040',1,NULL,'cscsacsa@csacsa.com','2016-04-20 16:31:51','2016-03-21 15:31:51',NULL),(51,1,'full-time','cssd',NULL,'https://www.youtube.com/watch?v=1ztXTMyx8bk','cdcds','cd','cdscsd','cdcds','0ded59440bb97d5eef4e889206e21e0ea7754d04',0,NULL,'scscsa@cdcs.com','2016-04-20 16:32:23','2016-03-21 15:32:23',NULL),(52,1,'full-time','cssd',NULL,'https://www.youtube.com/watch?v=1ztXTMyx8bk','cdcds','cd','cdscsd','cdcds','a1dba734380b44733a653f0f60ed51467e6dad7d',0,NULL,'scscsa@cdcs.com','2016-04-20 16:39:26','2016-03-21 15:39:26',NULL),(53,2,'full-time','sdasa',NULL,'http://127.0.0.1:8000/job/new','dsf','fdsf','fsdf','fsdfsd','c6ad11391a42d358347b8458de378f2464c5357f',1,NULL,'scscsa@cdcs.com','2016-04-22 08:13:37','2016-03-23 07:13:37',NULL);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','nhDr7OyKlXQju+Ge/WKGrPQ9lPBSUFfpK+B1xqx/+8zLZqRNX0+5G1zBQklXUFy86lCpkAofsExlXiorUcKSNQ=='),(2,'admin','nhDr7OyKlXQju+Ge/WKGrPQ9lPBSUFfpK+B1xqx/+8zLZqRNX0+5G1zBQklXUFy86lCpkAofsExlXiorUcKSNQ==');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2016-03-30 20:25:22
