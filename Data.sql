-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: webcarcare
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Customers'),(2,'manager');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,2,1),(2,2,2),(3,2,3),(4,2,4),(5,2,5),(6,2,6),(7,2,7),(8,2,8),(9,2,9),(10,2,10),(11,2,11),(12,2,12),(13,2,13),(14,2,14),(15,2,15),(16,2,16),(17,2,17),(18,2,18),(20,2,20),(21,2,21),(22,2,22),(23,2,23),(24,2,24),(28,2,28),(29,2,29),(30,2,30),(31,2,31),(32,2,32),(35,2,35),(36,2,36),(40,2,40),(42,2,42),(43,2,43),(44,2,44);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add confirmation model',7,'add_confirmationmodel'),(26,'Can change confirmation model',7,'change_confirmationmodel'),(27,'Can delete confirmation model',7,'delete_confirmationmodel'),(28,'Can view confirmation model',7,'view_confirmationmodel'),(29,'Can add queue model',8,'add_queuemodel'),(30,'Can change queue model',8,'change_queuemodel'),(31,'Can delete queue model',8,'delete_queuemodel'),(32,'Can view queue model',8,'view_queuemodel'),(33,'Can add reservation model',9,'add_reservationmodel'),(34,'Can change reservation model',9,'change_reservationmodel'),(35,'Can delete reservation model',9,'delete_reservationmodel'),(36,'Can view reservation model',9,'view_reservationmodel'),(37,'Can add satisfaction model',10,'add_satisfactionmodel'),(38,'Can change satisfaction model',10,'change_satisfactionmodel'),(39,'Can delete satisfaction model',10,'delete_satisfactionmodel'),(40,'Can view satisfaction model',10,'view_satisfactionmodel'),(41,'Can add delivery model',11,'add_deliverymodel'),(42,'Can change delivery model',11,'change_deliverymodel'),(43,'Can delete delivery model',11,'delete_deliverymodel'),(44,'Can view delivery model',11,'view_deliverymodel');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (4,'pbkdf2_sha256$150000$zNiVHCemrv5R$ggUlKaRimt5s1ZeDwakzNWHpuPiufoNJfo4NdIANENo=','2019-05-04 19:18:20.786503',0,'champ2','narongded','Wattanapornpairoj','jadsaasdda13042542@gmail.com',0,1,'2019-05-04 19:18:20.040455'),(5,'pbkdf2_sha256$150000$KfedhNyGQXqm$EIAd2DRuzOdLaHMYYodt4B3s57e4GZ6Xt6h5SwjTwUg=','2019-05-04 19:23:04.487741',0,'sack','jadsada','wattanatum','sack123@gmail.com',0,1,'2019-05-04 19:23:03.554069'),(6,'pbkdf2_sha256$150000$tx7Q8kUu5K1G$rXzbGBgf7dGqEt7f8UKC+cF7EAJbJvczrizfgFHMebg=','2019-05-04 19:24:03.421628',0,'prach','prachya','tonhjarean','prach123@gmail.com',0,1,'2019-05-04 19:24:02.658001'),(7,'pbkdf2_sha256$150000$owAANTDBSYt0$ihAcpK9MP41W/7nR9wTAROCubPI1wTs17zrJYKZi/h4=','2019-05-04 19:24:35.839181',0,'non','non','ninkum','nonny123@gmail.com',0,1,'2019-05-04 19:24:35.193959'),(8,'pbkdf2_sha256$150000$OeklzaHzTcKb$b1fjhJAe1HIKZHibzIrMHwSY0rjvrCqnuZRB5OsXcrg=','2019-05-04 19:25:09.039029',0,'tanakorn','tanakorn','pantaikul','ohmza123@gmail.com',0,1,'2019-05-04 19:25:08.280069'),(9,'pbkdf2_sha256$150000$W5PWXExijlPK$PQuLAqurKoVWo+lYwksHEWATg9HVBW/3y2UdhqPi+H8=','2019-05-04 19:26:03.014238',0,'tharinee','tharinee','pantaison','tharinee1234@gmail.com',0,1,'2019-05-04 19:26:02.308126'),(10,'pbkdf2_sha256$150000$QcTE9RR5USdP$6L2BrVjLthFbsqYW+OUIbJw6fAoOwMCNb+yHtvfTNe0=','2019-05-04 19:26:45.280991',0,'pongsapak','pongsapak','sakhatun','pun123@gmail.com',0,1,'2019-05-04 19:26:44.518068'),(11,'pbkdf2_sha256$150000$FD8xtiVwaOXE$S/06QfVwaehsLHqpC72Rj0FHDfuv/tyVo6uX2rJmyXo=','2019-05-04 19:37:36.119222',0,'thanapon','thanapon','wongprosert','thanapon@gmail.com',0,1,'2019-05-04 19:37:35.443806'),(12,'pbkdf2_sha256$150000$MmBk1gsG6LrA$4NBikuzc0l1SoLs4Ef+Or/tmRlF23IZtfqyGW9VixnE=','2019-05-04 19:38:50.001963',0,'thongy','thongyern','yampradit','thongyern@gmail.com',0,1,'2019-05-04 19:38:49.375400'),(13,'pbkdf2_sha256$150000$aPGxQv1ZgWF0$28TJ6ix4imKfdafmY9ICmOldLvVL7OxJ76HoP+SzStM=','2019-05-04 19:39:32.028042',0,'dorn','dorn','nuntavet','princessdorn@gmail.com',0,1,'2019-05-04 19:39:31.275043'),(14,'pbkdf2_sha256$150000$eLwTq6uoqlHj$RzytJK+OniK7OxSShC8kTnm9rOEgUzF9BizaeWt1E74=','2019-05-04 19:40:05.195049',0,'thitipat','thitipat','ariyapattana','thitipat21@gmail.com',0,1,'2019-05-04 19:40:04.492927'),(15,'pbkdf2_sha256$150000$d155U2el4ihM$6+78FTRI7yHd0z0GlK1FXBr6Fc4PjIUm8ad8n2/cG5E=','2019-05-04 19:51:33.123521',0,'supatta','supatta','ummatorn','supatta53@gmail.com',0,1,'2019-05-04 19:51:32.454802'),(16,'pbkdf2_sha256$150000$SIGlEEYJqfc6$l+IrGYtjkH79jWJVOoui24QRxrmnId/g2y3x4Rz6P3c=','2019-05-04 19:53:39.125283',0,'saint','teerarut','panakorn','saintiwn@gmail.com',0,1,'2019-05-04 19:53:37.528770'),(17,'pbkdf2_sha256$150000$awtgXfl7BwOY$L6wpVnwpVaYio/z7j9TPHih9dzAR91FWJuAQSntZF38=','2019-05-04 19:56:20.534692',0,'ousa','pramuan','yongsuta','pramuan@gmail.com',0,1,'2019-05-04 19:56:19.792681'),(18,'pbkdf2_sha256$150000$gv6fFoMbn3Vh$EOLoJtRWLNod54/UKUZq72M6Lbi4i4B2pqK0s5ATxsA=','2019-05-04 19:59:52.494180',0,'warit','warit','kuntakob','warit23@gmail.com',0,1,'2019-05-04 19:59:51.777136'),(23,'pbkdf2_sha256$120000$vNcbpbxgL3l4$pe8QAeibORGtJXpnAeo1aeTt1ZNIiz1E0zAJurlIPUw=','2019-05-25 14:45:51.117353',1,'admin','','','admin@admin.com',1,1,'2019-05-25 11:26:18.000000'),(24,'pbkdf2_sha256$120000$UQQfm5kw4Az0$rJpizBJogPxaO/xTsLCoBIS5s6stSNqpaW1lvGuVTG0=','2019-05-25 12:01:00.746835',0,'naive555','Non','Ninkham','non.naive@gmail.com',0,1,'2019-05-25 12:01:00.534403'),(25,'pbkdf2_sha256$120000$8ugZNxLjOJDb$d1g7zoA+zK79sgwa+ap3S7lBCf37NpGwhTTqXnTbXdw=','2019-05-25 14:44:15.587501',0,'test','Non','Ninkham','1non.naive@gmail.com12',0,1,'2019-05-25 13:52:26.956208');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,4,1),(2,5,1),(3,6,1),(4,7,1),(5,8,1),(6,9,1),(7,10,1),(8,11,1),(9,12,1),(10,13,1),(11,14,1),(12,15,1),(13,16,1),(14,17,1),(15,18,1),(19,24,1),(20,25,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (9,23,28),(10,23,29),(11,23,30),(12,23,31),(1,23,32),(2,23,34),(3,23,35),(4,23,36),(5,23,40),(6,23,42),(7,23,43),(8,23,44);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carcare_confirmationmodel`
--

DROP TABLE IF EXISTS `carcare_confirmationmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `carcare_confirmationmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `confirm_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirm_desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `confirm_bool` tinyint(1) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reservation_id` (`reservation_id`),
  CONSTRAINT `carcare_confirmation_reservation_id_1d3faeb9_fk_carcare_r` FOREIGN KEY (`reservation_id`) REFERENCES `carcare_reservationmodel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carcare_confirmationmodel`
--

LOCK TABLES `carcare_confirmationmodel` WRITE;
/*!40000 ALTER TABLE `carcare_confirmationmodel` DISABLE KEYS */;
INSERT INTO `carcare_confirmationmodel` VALUES (1,'นข213',NULL,0,1),(2,'กร554',NULL,0,2),(3,'ฟห231',NULL,0,3),(4,'บล555',NULL,0,4),(5,'พฟ468',NULL,0,5),(6,'พก512',NULL,1,6),(7,'หฟ999',NULL,1,7),(8,'รส789',NULL,1,8),(9,'นย787',NULL,0,9),(10,'ทม555',NULL,1,10),(16,'5กข123456',NULL,0,16),(17,'2พด4566',NULL,0,17),(21,'11กด1111','',1,21);
/*!40000 ALTER TABLE `carcare_confirmationmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carcare_deliverymodel`
--

DROP TABLE IF EXISTS `carcare_deliverymodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `carcare_deliverymodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deliver_desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `car_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `serve_time` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `car_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carcare_deliverymodel_user_id_2e058f68_fk_auth_user_id` (`user_id`),
  CONSTRAINT `carcare_deliverymodel_user_id_2e058f68_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carcare_deliverymodel`
--

LOCK TABLES `carcare_deliverymodel` WRITE;
/*!40000 ALTER TABLE `carcare_deliverymodel` DISABLE KEYS */;
INSERT INTO `carcare_deliverymodel` VALUES (1,'Toyota Revo Smart Cab 4X2 2.4J Plus รีโว่ ปี 2019\r\nรถกระบะ 2 ประตู (แค็บ)','20/1 สรรค์ประศาสน์ 2 หน้าเมือง ฉะเชิงเทรา','S','2020-05-04 22:04:00.000000',18,'นข213'),(2,'Toyota C-HR 1.8 Mid ซี-เอชอาร์ ปี 2019','256/344 หมู่ 4 ถนนรามคำแหง ตำบลคลองกุ่ม อำเภอบึงกุ่ม กรุงเทพมหานคร 12400','S','2019-05-16 12:00:00.000000',17,'ทม555'),(4,'Toyota Vios 1.5 High MY19 วีออส ปี 2019','ที่อยู่ :448/16 ถ.สิงหไคล อ.เมือง จ.เชียงราย 57000 ','S','2019-05-02 15:40:00.000000',15,'รส789'),(5,'Toyota Revo Double Cab 4x2 2.4J Plus AT รีโว่ ปี 2019','209/7-8 ศูนย์การค้าสุรสีห์ ถ.บรมไตรโลกนาถ อ.เมือง จ.พิษณุโลก 65000 ','S','2019-05-11 11:00:00.000000',14,'หฟ999'),(6,'Toyota Vios 1.5 Mid MY19 วีออส ปี 2019','193 ถ.ตากสิน ต.หนองหลวง อ.เมือง จ.ตาก 63000 ','XXL','2019-05-12 09:00:00.000000',13,'พก512'),(7,'Toyota Revo Smart Cab 4X2 2.4J Plus AT รีโว่ ปี 2019','เลขที่ 4 ถ.ราชธรรมพิทักษ์ ต.จองคำ อ.เมือง จ.แม่ฮ่องสอน 58000 ','XL','2019-05-22 15:00:00.000000',12,'พฟ468'),(8,'Toyota Revo Double Cab 4x2 2.4J Plus รีโว่ ปี 2019','2 ถ.บ้านใหม่ ต.ในเวียง อ.เมือง จ.แพร่ 54000 ','L','2019-05-14 11:50:00.000000',11,'บล555'),(9,'Toyota Revo Smart Cab 4X2 2.4E รีโว่ ปี 2019',' 130 ถ.จรดวิถีถ่อง ต.ธานี อ.เมือง จ.สุโขทัย 64000 ','M','2019-05-03 11:20:00.000000',10,'ฟห231'),(10,'Toyota Vios 1.5 Entry My19 วีออส ปี 2019',' 28/5 ถ.รักการดี ต.อุทัยใหม่ อ.เมือง จ.อุทัยธานี 61000 ','S','2019-05-08 11:00:00.000000',9,'กร554'),(13,'กระบะ','88/1','S','2019-05-25 15:44:00.000000',25,'1ฟฟ1111');
/*!40000 ALTER TABLE `carcare_deliverymodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carcare_queuemodel`
--

DROP TABLE IF EXISTS `carcare_queuemodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `carcare_queuemodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reservation_id` int(11) DEFAULT NULL,
  `serve_time` time(6) DEFAULT NULL,
  `car_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `car_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `receive_time` time(6) DEFAULT NULL,
  `reserve_time` time(6) DEFAULT NULL,
  `serve_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reservation_id` (`reservation_id`),
  CONSTRAINT `carcare_queuemodel_reservation_id_6719594f_fk_carcare_r` FOREIGN KEY (`reservation_id`) REFERENCES `carcare_reservationmodel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carcare_queuemodel`
--

LOCK TABLES `carcare_queuemodel` WRITE;
/*!40000 ALTER TABLE `carcare_queuemodel` DISABLE KEYS */;
INSERT INTO `carcare_queuemodel` VALUES (1,1,'15:45:33.000000','นข213','S','Toyota Revo Smart Cab 4X2 2.4J Plus\r\nรถกระบะ 2 ประตู (แค็บ)','11:45:35.000000','04:22:00.000000','บริการล้างสี + ดูดฝุ่น'),(2,2,NULL,'กร554','M','Toyota Vios 1.5 Entry My19 วีออส ปี 2019',NULL,'20:00:00.000000','บริการล้างสี + ดูดฝุ่น'),(3,3,NULL,'ฟห231','L','Toyota Revo Smart Cab 4X2 2.4E รีโว่ ปี 2019',NULL,'13:22:00.000000','บริการเคลือบสีด้วย Quick Wax'),(4,4,NULL,'บล555','XL','Toyota Revo Double Cab 4x2 2.4J Plus รีโว่ ปี 2019',NULL,'19:22:00.000000','บริการเคลือบสีด้วย Meguiar’s Synthetic Sealant 2.0 (เบอร์ 21)'),(5,5,NULL,'พฟ468','XXL','Toyota Revo Smart Cab 4X2 2.4J Plus AT รีโว่ ปี 2019',NULL,'21:00:00.000000','บริการเคลือบแก้ว'),(6,6,NULL,'พก512','S','Toyota Vios 1.5 Mid MY19 วีออส ปี 2019',NULL,'23:00:00.000000','บริการเคลือบสีด้วย Quick Wax'),(7,7,NULL,'หฟ999','S','Toyota Revo Double Cab 4x2 2.4J Plus AT รีโว่ ปี 2019',NULL,'13:00:00.000000','บริการล้างสี + ดูดฝุ่น'),(8,8,NULL,'รส789','M','Toyota Vios 1.5 High MY19 วีออส ปี 2019',NULL,'11:22:00.000000','บริการเคลือบแก้ว'),(9,9,NULL,'นย787','S','Toyota C-HR 1.8 Entry ซี-เอชอาร์ ปี 2019',NULL,'16:45:00.000000','บริการเคลือบแก้ว'),(10,10,NULL,'ทม555','S','Toyota C-HR 1.8 Mid ซี-เอชอาร์ ปี 2019',NULL,'15:00:00.000000','บริการล้างสี + ดูดฝุ่น');
/*!40000 ALTER TABLE `carcare_queuemodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carcare_reservationmodel`
--

DROP TABLE IF EXISTS `carcare_reservationmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `carcare_reservationmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `car_desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `car_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `serve_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reserve_time` time(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `receive_time` time(6) DEFAULT NULL,
  `serve_time` time(6) DEFAULT NULL,
  `finish` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `carcare_reservationmodel_user_id_bb4d2a8e_fk_auth_user_id` (`user_id`),
  CONSTRAINT `carcare_reservationmodel_user_id_bb4d2a8e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carcare_reservationmodel`
--

LOCK TABLES `carcare_reservationmodel` WRITE;
/*!40000 ALTER TABLE `carcare_reservationmodel` DISABLE KEYS */;
INSERT INTO `carcare_reservationmodel` VALUES (1,'นข213','Toyota Revo Smart Cab 4X2 2.4J Plus\r\nรถกระบะ 2 ประตู (แค็บ)','S','บริการล้างสี + ดูดฝุ่น','04:22:00.000000',18,NULL,NULL,0),(2,'กร554','Toyota Vios 1.5 Entry My19 วีออส ปี 2019','M','บริการล้างสี + ดูดฝุ่น','20:00:00.000000',17,NULL,NULL,0),(3,'ฟห231','Toyota Revo Smart Cab 4X2 2.4E รีโว่ ปี 2019','L','บริการเคลือบสีด้วย Quick Wax','13:22:00.000000',16,NULL,NULL,0),(4,'บล555','Toyota Revo Double Cab 4x2 2.4J Plus รีโว่ ปี 2019','XL','บริการเคลือบสีด้วย Meguiar’s Synthetic Sealant 2.0 (เบอร์ 21)','19:22:00.000000',15,NULL,NULL,0),(5,'พฟ468','Toyota Revo Smart Cab 4X2 2.4J Plus AT รีโว่ ปี 2019','XXL','บริการเคลือบแก้ว','21:00:00.000000',14,NULL,NULL,0),(6,'พก512','Toyota Vios 1.5 Mid MY19 วีออส ปี 2019','S','บริการเคลือบสีด้วย Quick Wax','23:00:00.000000',13,NULL,NULL,0),(7,'หฟ999','Toyota Revo Double Cab 4x2 2.4J Plus AT รีโว่ ปี 2019','S','บริการล้างสี + ดูดฝุ่น','13:00:00.000000',12,NULL,NULL,0),(8,'รส789','Toyota Vios 1.5 High MY19 วีออส ปี 2019','M','บริการเคลือบแก้ว','11:22:00.000000',11,NULL,NULL,0),(9,'นย787','Toyota C-HR 1.8 Entry ซี-เอชอาร์ ปี 2019','S','บริการเคลือบแก้ว','16:45:00.000000',10,NULL,NULL,0),(10,'ทม555','Toyota C-HR 1.8 Mid ซี-เอชอาร์ ปี 2019','S','บริการล้างสี + ดูดฝุ่น','15:00:00.000000',9,NULL,NULL,0),(16,'5กข123456','Toyota Revo Smart Cab 4X2 2.4J Plus รีโว่ ปี 2019 รถกระบะ 2 ประตู (แค็บ)','S','บริการล้างสี + ดูดฝุ่น','20:20:00.000000',23,'21:52:03.000000','19:52:03.000000',0),(17,'2พด4566','Toyota Vios 1.5 Entry My19 วีออส ปี 2019 รถเก๋ง 4 ประตู','S','บริการเคลือบสีด้วย Quick Wax','20:31:00.000000',23,'21:51:47.000000','19:51:45.000000',1),(21,'11กด1111','กระบะ','S','บริการล้างสี + ดูดฝุ่น','22:00:00.000000',25,'23:42:13.000000','21:42:11.000000',1);
/*!40000 ALTER TABLE `carcare_reservationmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carcare_satisfactionmodel`
--

DROP TABLE IF EXISTS `carcare_satisfactionmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `carcare_satisfactionmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `satisfaction_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `satisfaction_desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reservation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reservation_id` (`reservation_id`),
  CONSTRAINT `carcare_satisfaction_reservation_id_d42da3d3_fk_carcare_r` FOREIGN KEY (`reservation_id`) REFERENCES `carcare_reservationmodel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carcare_satisfactionmodel`
--

LOCK TABLES `carcare_satisfactionmodel` WRITE;
/*!40000 ALTER TABLE `carcare_satisfactionmodel` DISABLE KEYS */;
INSERT INTO `carcare_satisfactionmodel` VALUES (1,'นข213','บริการดีมากเลย',1),(2,'กร554','ล้างไม่สะอาดเลย',2),(3,'ฟห231','พนักงายสุภาพ',3),(4,'บล555','รอบหน้าจะมาอีกแน่ๆ',4),(5,'พฟ468','ของหาย',5),(6,'พก512','ทำไมล้อเป็นรอย',6),(7,'หฟ999','ของหาย',7),(8,'รส789','ปรับปรุงการให้บริการหน่อย',8),(9,'นย787','ราคาถูกมากๆ',9),(16,'5กข123456',NULL,16),(17,'2พด4566',NULL,17),(21,'11กด1111','ดีจัง',21);
/*!40000 ALTER TABLE `carcare_satisfactionmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (13,'2019-05-25 11:31:53.828388','23','admin',2,'[{\"changed\": {\"fields\": [\"user_permissions\"]}}]',4,23),(14,'2019-05-25 11:32:14.925589','23','admin',2,'[]',4,23),(15,'2019-05-25 11:47:18.135769','3','(saint) นย787',3,'',11,23),(16,'2019-05-25 11:47:46.708911','15','(9กข1234) 9กข1234',3,'',7,23),(17,'2019-05-25 11:48:00.974389','15','9กข1234',3,'',8,23),(18,'2019-05-25 11:48:08.690211','15','(9กข1234) naive555',3,'',9,23),(19,'2019-05-25 11:48:15.703643','10','(ทม555) ทม555',3,'',10,23),(20,'2019-05-25 11:58:49.015452','2','manager',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',3,23),(21,'2019-05-25 12:00:39.373532','20','naive555',3,'',4,23),(22,'2019-05-25 12:51:58.454944','17','(2พด4566) admin',2,'[{\"changed\": {\"fields\": [\"serve_time\", \"receive_time\", \"finish\"]}}]',9,23),(23,'2019-05-25 12:52:16.045106','16','(5กข123456) admin',2,'[{\"changed\": {\"fields\": [\"serve_time\", \"receive_time\"]}}]',9,23),(24,'2019-05-25 13:45:22.137131','17','2พด4566',2,'[{\"changed\": {\"fields\": [\"serve_time\", \"receive_time\"]}}]',8,23),(25,'2019-05-25 13:45:50.862807','1','นข213',2,'[{\"changed\": {\"fields\": [\"serve_time\", \"receive_time\"]}}]',8,23),(26,'2019-05-25 13:48:47.872003','17','2พด4566',2,'[{\"changed\": {\"fields\": [\"receive_time\"]}}]',8,23),(27,'2019-05-25 13:48:58.676846','1','นข213',2,'[{\"changed\": {\"fields\": [\"receive_time\"]}}]',8,23),(28,'2019-05-25 14:42:23.927884','21','(11กด1111) test',2,'[{\"changed\": {\"fields\": [\"serve_time\", \"receive_time\"]}}]',9,23),(29,'2019-05-25 14:43:52.236533','21','(11กด1111) test',2,'[{\"changed\": {\"fields\": [\"finish\"]}}]',9,23),(30,'2019-05-25 14:46:36.176047','21','11กด1111',3,'',8,23),(31,'2019-05-25 14:46:36.191005','17','2พด4566',3,'',8,23),(32,'2019-05-25 14:46:36.193011','16','5กข123456',3,'',8,23);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'carcare','confirmationmodel'),(11,'carcare','deliverymodel'),(8,'carcare','queuemodel'),(9,'carcare','reservationmodel'),(10,'carcare','satisfactionmodel'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-05-04 19:09:46.751204'),(2,'auth','0001_initial','2019-05-04 19:09:53.074305'),(3,'admin','0001_initial','2019-05-04 19:10:09.651002'),(4,'admin','0002_logentry_remove_auto_add','2019-05-04 19:10:12.618143'),(5,'admin','0003_logentry_add_action_flag_choices','2019-05-04 19:10:12.885358'),(6,'contenttypes','0002_remove_content_type_name','2019-05-04 19:10:15.360781'),(7,'auth','0002_alter_permission_name_max_length','2019-05-04 19:10:20.898940'),(8,'auth','0003_alter_user_email_max_length','2019-05-04 19:10:21.435506'),(9,'auth','0004_alter_user_username_opts','2019-05-04 19:10:21.546242'),(10,'auth','0005_alter_user_last_login_null','2019-05-04 19:10:22.953451'),(11,'auth','0006_require_contenttypes_0002','2019-05-04 19:10:23.026256'),(12,'auth','0007_alter_validators_add_error_messages','2019-05-04 19:10:23.123994'),(13,'auth','0008_alter_user_username_max_length','2019-05-04 19:10:24.553175'),(14,'auth','0009_alter_user_last_name_max_length','2019-05-04 19:10:26.444121'),(15,'auth','0010_alter_group_name_max_length','2019-05-04 19:10:26.760276'),(16,'auth','0011_update_proxy_permissions','2019-05-04 19:10:26.866992'),(17,'carcare','0001_initial','2019-05-04 19:10:31.194424'),(18,'carcare','0002_deliverymodel','2019-05-04 19:10:42.132583'),(19,'carcare','0003_deliverymodel_car_type','2019-05-04 19:10:44.430612'),(20,'carcare','0004_deliverymodel_serve_time','2019-05-04 19:10:45.130927'),(21,'carcare','0005_remove_deliverymodel_reservation','2019-05-04 19:10:47.215156'),(22,'carcare','0006_deliverymodel_user','2019-05-04 19:10:47.985939'),(23,'carcare','0007_auto_20190503_0356','2019-05-04 19:10:56.409102'),(24,'carcare','0008_auto_20190503_1756','2019-05-04 19:10:58.789067'),(25,'carcare','0009_auto_20190503_1813','2019-05-04 19:10:59.411496'),(26,'carcare','0010_auto_20190504_1242','2019-05-04 19:11:08.342615'),(27,'carcare','0011_auto_20190504_1324','2019-05-04 19:11:10.294327'),(28,'carcare','0012_remove_queuemodel_queue_name','2019-05-04 19:11:11.460205'),(29,'carcare','0013_auto_20190504_1954','2019-05-04 19:11:18.068540'),(30,'carcare','0014_auto_20190504_2115','2019-05-04 19:11:22.132678'),(31,'carcare','0015_reservationmodel_fininsh','2019-05-04 19:11:23.336463'),(32,'carcare','0016_auto_20190504_2129','2019-05-04 19:11:23.936857'),(33,'sessions','0001_initial','2019-05-04 19:11:24.572774');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0vktg5wc2n5p3ykxox2c0hluelu93xtf','MzJlNDk5MTVmY2FkM2E3ZmYzYjlmOTU5YjBmYjFiMmYxYTkyNjBiNDp7Il9hdXRoX3VzZXJfaWQiOiIyMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDQyYjg1NWFlZjE5MzYyOWU4MmVhYTUzM2UwZWM1NzI1ZGNmZWI4MiJ9','2019-06-08 12:03:11.247622'),('5mcpi27rubs9p5zafqalvzwykqwld9i3','MWU0NjY5ZTJhYzdhZDQ5YTMyZWE4OTg5YWEwYmU1OGE5ZGVhNGFiZDp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWFhNmQ2MzJlMTc4MjZmODlhY2UwNjY5NDRjYTU4N2FiOTI0MDUzMCJ9','2019-06-08 11:00:09.120346'),('9821hqig3wmguy5pj84119a77rwkl02w','ZDczMTc4OWVmNDYzOTM0ZjM0NGYwM2UxNzIxYzcwNzI3ODRhYjY1NDp7Il9hdXRoX3VzZXJfaWQiOiIyMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2ViZmZmOThiOTE3MDgwZDgyNmYyMjA5YTE3Yjk5YTk3OGI0MWNiZiJ9','2019-05-27 10:39:24.653125'),('bvuy97j6mo2jrnwhwk1om9tbzki7p4t8','ZjY1NzZhN2YzZjA5OWRhNzRiNjVjZTk1NDQ5YzkwY2YzNzdmOTBlYzp7Il9hdXRoX3VzZXJfaWQiOiIxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjFmNzIxZTAxMDcxNWZlYTgzYTExNGI1ZGRlZjkzODFmOWY3OTFjNCJ9','2019-05-18 19:59:52.604893'),('jp73iu39ytyk9mty3bax40tinar8xnxz','MzQ5MzJlOTc2ODhmZDlmMWVkNmI1NDhkMTU1Zjg0Zjc5MWIzYTc1Yjp7Il9hdXRoX3VzZXJfaWQiOiIxOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjA2YmUwYjAwMzlkZGQzZGMwMmIwYzJkY2IxZTAxYWUwMzZhNDQ4NCJ9','2019-05-22 04:45:20.093719'),('kxxgr6ht2veo8yxgjt8n1qepn0hs5ff7','ZDczMTc4OWVmNDYzOTM0ZjM0NGYwM2UxNzIxYzcwNzI3ODRhYjY1NDp7Il9hdXRoX3VzZXJfaWQiOiIyMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2ViZmZmOThiOTE3MDgwZDgyNmYyMjA5YTE3Yjk5YTk3OGI0MWNiZiJ9','2019-05-22 04:40:54.189670'),('rqsj7fncwt903qo882znukjiztrb2mj4','MzJlNDk5MTVmY2FkM2E3ZmYzYjlmOTU5YjBmYjFiMmYxYTkyNjBiNDp7Il9hdXRoX3VzZXJfaWQiOiIyMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDQyYjg1NWFlZjE5MzYyOWU4MmVhYTUzM2UwZWM1NzI1ZGNmZWI4MiJ9','2019-06-08 14:45:51.121331');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-27 12:46:32
