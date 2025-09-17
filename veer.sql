-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: veera_ragav
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `app_aboutmodel`
--

DROP TABLE IF EXISTS `app_aboutmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_aboutmodel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `about_story_img` varchar(100) DEFAULT NULL,
  `card_1_img` varchar(100) DEFAULT NULL,
  `card_2_img` varchar(100) DEFAULT NULL,
  `card_3_img` varchar(100) DEFAULT NULL,
  `card_4_img` varchar(100) DEFAULT NULL,
  `designer_img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_aboutmodel`
--

LOCK TABLES `app_aboutmodel` WRITE;
/*!40000 ALTER TABLE `app_aboutmodel` DISABLE KEYS */;
INSERT INTO `app_aboutmodel` VALUES (1,'about/ani.jpg','about/pro2.jpg','about/fur2.jpg','about/erasebg-transformed.png','about/fur8.jpg','about/cat.png');
/*!40000 ALTER TABLE `app_aboutmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_contactsettingmodel`
--

DROP TABLE IF EXISTS `app_contactsettingmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_contactsettingmodel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contact_top_img` varchar(100) DEFAULT NULL,
  `contact_bottom_img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_contactsettingmodel`
--

LOCK TABLES `app_contactsettingmodel` WRITE;
/*!40000 ALTER TABLE `app_contactsettingmodel` DISABLE KEYS */;
INSERT INTO `app_contactsettingmodel` VALUES (1,'contact/3d-rendering-minimalist-interior-with-copy-space.jpg','contact/ani1.jpg');
/*!40000 ALTER TABLE `app_contactsettingmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_contactusmodel`
--

DROP TABLE IF EXISTS `app_contactusmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_contactusmodel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `ph_number` varchar(20) DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `message` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_contactusmodel`
--

LOCK TABLES `app_contactusmodel` WRITE;
/*!40000 ALTER TABLE `app_contactusmodel` DISABLE KEYS */;
INSERT INTO `app_contactusmodel` VALUES (1,'sam','samuelreegan372@gmail.com','9876543212','Demo','dsagfrhgtht','2025-05-16 05:45:58.673586'),(2,'sam','samuelreegan372@gmail.com','9876543212','Demo','dsagfrhgtht','2025-05-16 05:48:35.890535'),(3,'Samuel Reegan','samuelreegan372@gmail.com','9345532741','Example','sfdasfsdfdsf','2025-06-03 05:52:44.914401'),(4,'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrr','rajesrajesh33@gmail.com','9345532741','Example','wewwrwrrrew','2025-06-03 05:56:42.340348'),(5,'Samuel Reegan','rajesh@gmail.com','9345532741','Example','rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr','2025-06-03 05:57:41.265383');
/*!40000 ALTER TABLE `app_contactusmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add logo',7,'add_logo'),(26,'Can change logo',7,'change_logo'),(27,'Can delete logo',7,'delete_logo'),(28,'Can view logo',7,'view_logo'),(29,'Can add pro_ banner',8,'add_pro_banner'),(30,'Can change pro_ banner',8,'change_pro_banner'),(31,'Can delete pro_ banner',8,'delete_pro_banner'),(32,'Can view pro_ banner',8,'view_pro_banner'),(33,'Can add category',9,'add_category'),(34,'Can change category',9,'change_category'),(35,'Can delete category',9,'delete_category'),(36,'Can view category',9,'view_category'),(37,'Can add color',10,'add_color'),(38,'Can change color',10,'change_color'),(39,'Can delete color',10,'delete_color'),(40,'Can view color',10,'view_color'),(41,'Can add type',11,'add_type'),(42,'Can change type',11,'change_type'),(43,'Can delete type',11,'delete_type'),(44,'Can view type',11,'view_type'),(45,'Can add size',12,'add_size'),(46,'Can change size',12,'change_size'),(47,'Can delete size',12,'delete_size'),(48,'Can view size',12,'view_size'),(49,'Can add product size',13,'add_productsize'),(50,'Can change product size',13,'change_productsize'),(51,'Can delete product size',13,'delete_productsize'),(52,'Can view product size',13,'view_productsize'),(53,'Can add web link',14,'add_weblink'),(54,'Can change web link',14,'change_weblink'),(55,'Can delete web link',14,'delete_weblink'),(56,'Can view web link',14,'view_weblink'),(57,'Can add product size',15,'add_productsize'),(58,'Can change product size',15,'change_productsize'),(59,'Can delete product size',15,'delete_productsize'),(60,'Can view product size',15,'view_productsize'),(61,'Can add product',16,'add_product'),(62,'Can change product',16,'change_product'),(63,'Can delete product',16,'delete_product'),(64,'Can view product',16,'view_product'),(65,'Can add product image',17,'add_productimage'),(66,'Can change product image',17,'change_productimage'),(67,'Can delete product image',17,'delete_productimage'),(68,'Can view product image',17,'view_productimage'),(69,'Can add craft',18,'add_craft'),(70,'Can change craft',18,'change_craft'),(71,'Can delete craft',18,'delete_craft'),(72,'Can view craft',18,'view_craft'),(73,'Can add enquiries model',19,'add_enquiriesmodel'),(74,'Can change enquiries model',19,'change_enquiriesmodel'),(75,'Can delete enquiries model',19,'delete_enquiriesmodel'),(76,'Can view enquiries model',19,'view_enquiriesmodel'),(77,'Can add contact setting model',20,'add_contactsettingmodel'),(78,'Can change contact setting model',20,'change_contactsettingmodel'),(79,'Can delete contact setting model',20,'delete_contactsettingmodel'),(80,'Can view contact setting model',20,'view_contactsettingmodel'),(81,'Can add contact us model',21,'add_contactusmodel'),(82,'Can change contact us model',21,'change_contactusmodel'),(83,'Can delete contact us model',21,'delete_contactusmodel'),(84,'Can view contact us model',21,'view_contactusmodel'),(85,'Can add carousel image',22,'add_carouselimage'),(86,'Can change carousel image',22,'change_carouselimage'),(87,'Can delete carousel image',22,'delete_carouselimage'),(88,'Can view carousel image',22,'view_carouselimage'),(89,'Can add about model',23,'add_aboutmodel'),(90,'Can change about model',23,'change_aboutmodel'),(91,'Can delete about model',23,'delete_aboutmodel'),(92,'Can view about model',23,'view_aboutmodel'),(93,'Can add contact setting model',24,'add_contactsettingmodel'),(94,'Can change contact setting model',24,'change_contactsettingmodel'),(95,'Can delete contact setting model',24,'delete_contactsettingmodel'),(96,'Can view contact setting model',24,'view_contactsettingmodel'),(97,'Can add contact us model',25,'add_contactusmodel'),(98,'Can change contact us model',25,'change_contactusmodel'),(99,'Can delete contact us model',25,'delete_contactusmodel'),(100,'Can view contact us model',25,'view_contactusmodel'),(101,'Can add enquiries model',26,'add_enquiriesmodel'),(102,'Can change enquiries model',26,'change_enquiriesmodel'),(103,'Can delete enquiries model',26,'delete_enquiriesmodel'),(104,'Can view enquiries model',26,'view_enquiriesmodel'),(105,'Can add info',27,'add_info'),(106,'Can change info',27,'change_info'),(107,'Can delete info',27,'delete_info'),(108,'Can view info',27,'view_info'),(109,'Can add review',28,'add_review'),(110,'Can change review',28,'change_review'),(111,'Can delete review',28,'delete_review'),(112,'Can view review',28,'view_review');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$QFosDhBzEu2cDG8WTBgCJO$bAWlUqGI8cDFcmSjT2R9rvZ+gsflIMszio8BS8csH+o=','2025-06-05 09:02:29.130596',1,'admin','','','',1,1,'2025-04-25 11:42:58.594670'),(2,'pbkdf2_sha256$1000000$j1GFFLMUBxyKx62uk1ne5u$RlBwpxrQ8HrmPtOl+zw5DehD/1x/UR2nEzu1dIAWE/Y=',NULL,1,'admin1','','','',1,1,'2025-05-23 10:18:54.377314'),(3,'pbkdf2_sha256$1000000$kPDQ1GjVQl4V9iyZTY5qKn$6AMPO0mrdY3TdOxBrbBLkyKtweITzVx7bG1Zh4aEWGA=','2025-06-06 11:25:50.068848',1,'sam','','','samuelreegan372@gmail.com',1,1,'2025-06-03 06:55:12.058834');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carosel_carouselimage`
--

DROP TABLE IF EXISTS `carosel_carouselimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carosel_carouselimage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carosel_carouselimage`
--

LOCK TABLES `carosel_carouselimage` WRITE;
/*!40000 ALTER TABLE `carosel_carouselimage` DISABLE KEYS */;
INSERT INTO `carosel_carouselimage` VALUES (1,'carousel/fur1.jpg','2025-05-16 05:20:08.974878'),(2,'carousel/fur2.jpg','2025-05-16 05:20:19.766899'),(3,'carousel/fur5.jpg','2025-05-16 05:20:40.393700');
/*!40000 ALTER TABLE `carosel_carouselimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_category`
--

DROP TABLE IF EXISTS `categories_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `categorie` varchar(100) NOT NULL,
  `pic` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_category`
--

LOCK TABLES `categories_category` WRITE;
/*!40000 ALTER TABLE `categories_category` DISABLE KEYS */;
INSERT INTO `categories_category` VALUES (1,'sofa','category_images/sofa.png'),(9,'Dining Table','category_images/pngegg_cuJuMjc.png'),(10,'Bero','category_images/Layer_51_dMfURpF.png'),(11,'Cot','category_images/6000x4000_50.jpg'),(12,'Pooja Cuboard','category_images/erasebg-transformed_kxNo3DJ.png'),(13,'Tables','category_images/pngegg_IFnhLIk.png'),(14,'Dressing Table','category_images/pngegg.png');
/*!40000 ALTER TABLE `categories_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colorlist_color`
--

DROP TABLE IF EXISTS `colorlist_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colorlist_color` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `color_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `color_name` (`color_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colorlist_color`
--

LOCK TABLES `colorlist_color` WRITE;
/*!40000 ALTER TABLE `colorlist_color` DISABLE KEYS */;
INSERT INTO `colorlist_color` VALUES (1,'blue'),(5,'brown'),(3,'Green'),(2,'Red'),(4,'yellow');
/*!40000 ALTER TABLE `colorlist_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactinfo_info`
--

DROP TABLE IF EXISTS `contactinfo_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactinfo_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `adress` varchar(200) DEFAULT NULL,
  `ph_number` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `facebook_url` varchar(200) DEFAULT NULL,
  `instagram_url` varchar(200) DEFAULT NULL,
  `youtube_url` varchar(200) DEFAULT NULL,
  `whatsapp_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactinfo_info`
--

LOCK TABLES `contactinfo_info` WRITE;
/*!40000 ALTER TABLE `contactinfo_info` DISABLE KEYS */;
INSERT INTO `contactinfo_info` VALUES (2,'123 Main Street, City, Country','9345532742','samuelreegan372@gmail.com','https://facebook.com','https://instagram.com','https://www.youtube.com','9345532743');
/*!40000 ALTER TABLE `contactinfo_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_craft`
--

DROP TABLE IF EXISTS `craft_craft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `craft_craft` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client` bigint NOT NULL,
  `projects` bigint NOT NULL,
  `year` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_craft`
--

LOCK TABLES `craft_craft` WRITE;
/*!40000 ALTER TABLE `craft_craft` DISABLE KEYS */;
INSERT INTO `craft_craft` VALUES (1,498,150,90);
/*!40000 ALTER TABLE `craft_craft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-04-25 11:52:13.582211','1','logo',1,'[{\"added\": {}}]',7,1),(2,'2025-04-25 11:54:12.239340','1','logo',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',7,1),(3,'2025-04-25 12:18:31.663929','1','logo',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',7,1),(4,'2025-04-25 12:36:33.774429','1','logo',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',7,1),(5,'2025-04-25 12:36:44.247219','1','logo',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',7,1),(6,'2025-04-25 12:37:04.860604','2','logo',1,'[{\"added\": {}}]',7,1),(7,'2025-04-25 12:37:42.576286','1','logo',3,'',7,1),(8,'2025-04-25 12:37:53.142912','2','logo',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',7,1),(9,'2025-04-25 12:47:33.469411','3','logo1',1,'[{\"added\": {}}]',7,1),(10,'2025-04-25 12:48:35.489359','4','logo2',1,'[{\"added\": {}}]',7,1),(11,'2025-04-25 12:55:20.939322','5','logo3',1,'[{\"added\": {}}]',7,1),(12,'2025-04-25 12:55:57.374726','5','logo3',3,'',7,1),(13,'2025-04-25 12:56:01.960007','4','logo2',3,'',7,1),(14,'2025-04-25 12:56:06.501422','3','logo1',3,'',7,1),(15,'2025-04-25 12:56:21.008371','2','logo',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',7,1),(16,'2025-05-13 05:11:58.491153','1','sofa',1,'[{\"added\": {}}]',9,1),(17,'2025-05-13 05:30:57.131555','2','chair',1,'[{\"added\": {}}]',9,1),(18,'2025-05-13 05:42:50.242015','1','blue',1,'[{\"added\": {}}]',10,1),(19,'2025-05-13 05:45:08.410610','2','Red',1,'[{\"added\": {}}]',10,1),(20,'2025-05-13 06:00:24.593654','1','wood',1,'[{\"added\": {}}]',11,1),(21,'2025-05-13 06:02:34.968374','2','Fabric',1,'[{\"added\": {}}]',11,1),(22,'2025-05-13 06:27:08.769200','1','wood',2,'[]',11,1),(23,'2025-05-13 06:31:16.740698','2','chair',2,'[{\"changed\": {\"fields\": [\"Pic\"]}}]',9,1),(24,'2025-05-13 06:37:37.373344','1','Sizes for sofa',1,'[{\"added\": {}}]',12,1),(25,'2025-05-13 06:41:31.720933','2','Sizes for sofa',1,'[{\"added\": {}}]',12,1),(26,'2025-05-13 06:41:50.243870','1','Sizes for sofa',3,'',12,1),(27,'2025-05-13 06:41:55.289381','2','Sizes for sofa',3,'',12,1),(28,'2025-05-13 06:47:52.090265','3','Sizes for sofa',1,'[{\"added\": {}}]',12,1),(29,'2025-05-13 06:47:57.761727','3','Sizes for sofa',2,'[{\"changed\": {\"fields\": [\"sizes\"]}}]',12,1),(30,'2025-05-13 06:48:11.668351','4','Sizes for sofa',1,'[{\"added\": {}}]',12,1),(31,'2025-05-13 06:48:16.772390','4','Sizes for sofa',3,'',12,1),(32,'2025-05-13 06:48:22.302605','3','Sizes for sofa',3,'',12,1),(33,'2025-05-13 06:48:52.355702','5','Sizes for sofa',1,'[{\"added\": {}}]',12,1),(34,'2025-05-13 06:49:07.556306','5','Sizes for sofa',2,'[{\"changed\": {\"fields\": [\"sizes\"]}}]',12,1),(35,'2025-05-13 06:54:42.013971','5','Sizes for sofa',3,'',12,1),(36,'2025-05-13 06:54:49.990601','6','Sizes for sofa',1,'[{\"added\": {}}]',12,1),(37,'2025-05-13 07:01:20.475428','6','Sizes for sofa',3,'',12,1),(38,'2025-05-13 07:28:48.516280','7','sofa',1,'[{\"added\": {}}]',12,1),(39,'2025-05-13 07:29:11.217158','7','chair',2,'[{\"changed\": {\"fields\": [\"Category\", \"Size 1\", \"Size 2\", \"Size 3\", \"Size 4\"]}}]',12,1),(40,'2025-05-13 07:29:38.158418','7','sofa',2,'[{\"changed\": {\"fields\": [\"Category\", \"Sizes\", \"Size 1\", \"Size 2\", \"Size 3\", \"Size 4\"]}}]',12,1),(41,'2025-05-13 08:44:47.360308','1','all',1,'[{\"added\": {}}]',14,1),(42,'2025-05-13 08:44:52.978413','2','a',1,'[{\"added\": {}}]',14,1),(43,'2025-05-13 09:09:52.030086','1','all',3,'',14,1),(44,'2025-05-13 09:09:57.951545','2','a',3,'',14,1),(45,'2025-05-13 09:10:04.063706','4','a',3,'',14,1),(46,'2025-05-13 09:10:08.144336','3','all',3,'',14,1),(47,'2025-05-13 09:10:11.909151','5','a',3,'',14,1),(48,'2025-05-13 09:10:18.702567','6','a',1,'[{\"added\": {}}]',14,1),(49,'2025-05-13 09:18:43.690857','1','sofa',1,'[{\"added\": {}}]',15,1),(50,'2025-05-13 09:18:56.519046','2','chair',1,'[{\"added\": {}}]',15,1),(51,'2025-05-13 09:21:56.642974','3','table',1,'[{\"added\": {}}]',9,1),(52,'2025-05-13 10:05:15.440424','1','demo',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo\"}}]',16,1),(53,'2025-05-13 11:09:34.509895','2','demo',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo\"}}]',16,1),(54,'2025-05-13 11:10:06.645034','3','table',1,'[{\"added\": {}}]',15,1),(55,'2025-05-13 11:13:00.355588','4','sofa - 2',1,'[{\"added\": {}}]',15,1),(56,'2025-05-13 11:13:06.721668','5','sofa - 21',1,'[{\"added\": {}}]',15,1),(57,'2025-05-13 11:13:36.762370','1','sofa - [\"2\", \"3\", \"5\"]',3,'',15,1),(58,'2025-05-13 11:13:41.572652','2','chair - [\"1\"]',3,'',15,1),(59,'2025-05-13 11:13:44.984854','3','table - 2',3,'',15,1),(60,'2025-05-13 11:13:48.743421','4','sofa - 2',3,'',15,1),(61,'2025-05-13 11:13:53.854380','5','sofa - 21',3,'',15,1),(62,'2025-05-13 11:14:08.054532','6','sofa - 2',1,'[{\"added\": {}}]',15,1),(63,'2025-05-13 11:14:14.272499','7','sofa - 1',1,'[{\"added\": {}}]',15,1),(64,'2025-05-13 11:14:24.657439','8','chair - 2',1,'[{\"added\": {}}]',15,1),(65,'2025-05-13 11:16:30.803162','3','demo',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo\"}}]',16,1),(66,'2025-05-13 11:46:05.882481','4','test',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for test\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for test\"}}]',16,1),(67,'2025-05-13 12:58:29.203406','5','test1',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for test1\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for test1\"}}]',16,1),(68,'2025-05-13 12:59:07.065458','7','all',1,'[{\"added\": {}}]',14,1),(69,'2025-05-13 12:59:58.205604','6','asadfefg',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for asadfefg\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for asadfefg\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for asadfefg\"}}]',16,1),(70,'2025-05-13 13:01:16.579965','6','asadfefg',3,'',16,1),(71,'2025-05-13 13:01:20.681849','5','test1',3,'',16,1),(72,'2025-05-13 13:01:25.329571','4','test',3,'',16,1),(73,'2025-05-13 13:01:28.475294','3','demo',3,'',16,1),(74,'2025-05-13 13:02:30.784763','7','demo',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo\"}}]',16,1),(75,'2025-05-13 13:04:00.517012','8','demo1',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo1\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo1\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo1\"}}]',16,1),(76,'2025-05-13 13:08:21.564337','9','demo2',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo2\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo2\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo2\"}}]',16,1),(77,'2025-05-13 13:11:57.868711','10','star',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for star\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for star\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for star\"}}]',16,1),(78,'2025-05-14 05:19:09.532924','6','sofa - 2',3,'',15,1),(79,'2025-05-14 05:19:13.492090','7','sofa - 1',3,'',15,1),(80,'2025-05-14 05:19:17.799311','8','chair - 2',3,'',15,1),(81,'2025-05-14 05:23:24.829784','9','sofa - 3x2,7x2,2x3,4x4,5x5',1,'[{\"added\": {}}]',15,1),(82,'2025-05-14 05:36:03.622548','10','sofa - 3x2',1,'[{\"added\": {}}]',15,1),(83,'2025-05-14 05:36:07.673897','10','sofa - 3x2',3,'',15,1),(84,'2025-05-14 06:23:42.364105','11','demo',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo\"}}]',16,1),(85,'2025-05-14 06:24:26.794848','12','demo1',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo1\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo1\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo1\"}}]',16,1),(86,'2025-05-14 06:25:22.694579','13','demo2',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo2\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo2\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo2\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo2\"}}]',16,1),(87,'2025-05-14 07:03:38.239590','14','demo3',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo3\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo3\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo3\"}}]',16,1),(88,'2025-05-14 07:05:55.073455','11','demo',3,'',16,1),(89,'2025-05-14 07:05:58.621736','12','demo1',3,'',16,1),(90,'2025-05-14 07:06:02.355574','13','demo2',3,'',16,1),(91,'2025-05-14 07:08:08.667892','15','demo',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo\"}}]',16,1),(92,'2025-05-14 07:08:53.929505','16','demo2',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo2\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo2\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo2\"}}]',16,1),(93,'2025-05-14 07:38:36.477307','17','test',1,'[{\"added\": {}}]',16,1),(94,'2025-05-14 07:49:29.370632','18','demo a',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo a\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo a\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for demo a\"}}]',16,1),(95,'2025-05-14 08:04:47.407951','17','test',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for test\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for test\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for test\"}}]',16,1),(96,'2025-05-14 08:17:36.868629','11','chair - 1x1,2x2,3x3,4x4,5x5,6x6,7x7,8x8',1,'[{\"added\": {}}]',15,1),(97,'2025-05-14 08:23:09.783306','11','chair - 1x1,2x2,3x3,4x4,5x5,6x6,7x7,8x8,9x9',2,'[{\"changed\": {\"fields\": [\"size9\"]}}]',15,1),(98,'2025-05-14 08:23:19.796448','9','sofa - 3x2,7x2,2x3,4x4,5x5,3x4',2,'[{\"changed\": {\"fields\": [\"size6\"]}}]',15,1),(99,'2025-05-14 08:23:54.208311','9','sofa - 3x2,7x4,2x3,4x4,5x5,3x4',2,'[{\"changed\": {\"fields\": [\"size2\"]}}]',15,1),(100,'2025-05-14 09:27:35.876028','3','Green',1,'[{\"added\": {}}]',10,1),(101,'2025-05-14 09:27:55.622690','4','yellow',1,'[{\"added\": {}}]',10,1),(102,'2025-05-14 09:38:00.164301','9','sofa - 3x2,7x4,2x3,4x4,5x5,3x4,7x7',2,'[{\"changed\": {\"fields\": [\"size7\"]}}]',15,1),(103,'2025-05-14 09:56:50.997312','17','test',2,'[{\"changed\": {\"fields\": [\"Star\"]}}]',16,1),(104,'2025-05-14 09:57:16.704440','18','demo a',2,'[{\"changed\": {\"fields\": [\"Star\"]}}]',16,1),(105,'2025-05-14 11:50:36.009298','17','test',2,'[{\"changed\": {\"fields\": [\"Star\"]}}]',16,1),(108,'2025-05-14 12:39:44.103570','3','table',3,'',9,1),(109,'2025-05-14 12:47:05.034314','1','sofa',2,'[{\"changed\": {\"fields\": [\"Pic\"]}}]',9,1),(110,'2025-05-14 12:53:23.892308','1','sofa',2,'[{\"changed\": {\"fields\": [\"Pic\"]}}]',9,1),(111,'2025-05-14 13:05:16.510743','2','chair',2,'[{\"changed\": {\"fields\": [\"Pic\"]}}]',9,1),(112,'2025-05-14 13:15:19.233362','8','b',1,'[{\"added\": {}}]',14,1),(113,'2025-05-14 13:15:32.058757','18','demo a',2,'[{\"changed\": {\"fields\": [\"Link name\"]}}]',16,1),(114,'2025-05-14 13:16:10.511020','18','demo a',2,'[{\"changed\": {\"fields\": [\"Link name\"]}}]',16,1),(115,'2025-05-15 07:53:20.103923','1','Craft object (1)',1,'[{\"added\": {}}]',18,1),(116,'2025-05-15 07:53:56.696806','1','Craft object (1)',2,'[{\"changed\": {\"fields\": [\"Year\"]}}]',18,1),(117,'2025-05-15 08:11:12.909322','18','demo a',2,'[{\"changed\": {\"fields\": [\"Link name\"]}}]',16,1),(118,'2025-05-15 08:11:27.500668','18','demo a',2,'[{\"changed\": {\"fields\": [\"Link name\"]}}]',16,1),(119,'2025-05-15 08:11:33.818232','16','demo2',2,'[{\"changed\": {\"fields\": [\"Link name\"]}}]',16,1),(120,'2025-05-15 08:11:39.531392','14','demo3',2,'[{\"changed\": {\"fields\": [\"Link name\"]}}]',16,1),(121,'2025-05-15 08:12:22.016017','14','demo3',2,'[{\"changed\": {\"fields\": [\"Link name\"]}}]',16,1),(122,'2025-05-15 08:12:36.293189','16','demo2',2,'[{\"changed\": {\"fields\": [\"Link name\"]}}]',16,1),(123,'2025-05-15 10:17:44.264869','1','ContactSettingModel object (1)',1,'[{\"added\": {}}]',20,1),(124,'2025-05-15 10:18:12.056377','1','ContactUsModel object (1)',1,'[{\"added\": {}}]',21,1),(125,'2025-05-15 11:04:20.465343','1','Craft object (1)',2,'[{\"changed\": {\"fields\": [\"Year\"]}}]',18,1),(126,'2025-05-15 11:34:31.563952','4','table',1,'[{\"added\": {}}]',9,1),(127,'2025-05-15 11:35:46.655989','19','table demo',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for table demo\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for table demo\"}}]',16,1),(128,'2025-05-15 12:51:59.617485','5','dsfsdf',1,'[{\"added\": {}}]',9,1),(129,'2025-05-15 12:52:16.566087','6','secfrsdgfv',1,'[{\"added\": {}}]',9,1),(130,'2025-05-15 12:52:32.625674','7','fgfgrsg',1,'[{\"added\": {}}]',9,1),(131,'2025-05-15 12:53:14.401507','8','dgethrth',1,'[{\"added\": {}}]',9,1),(132,'2025-05-16 05:20:08.975790','1','Image 1',1,'[{\"added\": {}}]',22,1),(133,'2025-05-16 05:20:19.768664','2','Image 2',1,'[{\"added\": {}}]',22,1),(134,'2025-05-16 05:20:40.394700','3','Image 3',1,'[{\"added\": {}}]',22,1),(135,'2025-05-16 05:44:36.968459','1','about images',1,'[{\"added\": {}}]',23,1),(136,'2025-05-16 05:44:57.665160','1','ContactSettingModel object (1)',1,'[{\"added\": {}}]',24,1),(137,'2025-05-16 06:16:27.261780','20','Sofa blue',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Sofa blue\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Sofa blue\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Sofa blue\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Sofa blue\"}}]',16,1),(138,'2025-05-16 06:18:06.669013','20','Sofa blue',2,'[{\"changed\": {\"fields\": [\"Star\"]}}]',16,1),(139,'2025-05-16 06:19:55.816273','5','brown',1,'[{\"added\": {}}]',10,1),(140,'2025-05-16 06:22:12.360327','21','sofa brown',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for sofa brown\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for sofa brown\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for sofa brown\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for sofa brown\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for sofa brown\"}}]',16,1),(141,'2025-05-16 06:24:00.848147','22','sofa demo',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for sofa demo\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for sofa demo\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for sofa demo\"}}]',16,1),(142,'2025-05-16 06:38:04.789204','6','ss',1,'[{\"added\": {}}]',10,1),(143,'2025-05-16 06:38:19.038643','6','ss',3,'',10,1),(144,'2025-05-16 07:05:53.368163','22','sofa demo',2,'[{\"changed\": {\"fields\": [\"Star\"]}}]',16,1),(145,'2025-05-17 04:47:29.709586','22','sofa demo sdsdesfrgergrgergfrg',2,'[{\"changed\": {\"fields\": [\"Pro name\"]}}]',16,1),(146,'2025-05-17 04:47:48.604690','22','sofa demo sdsdesfrgergrgergfrg',2,'[{\"changed\": {\"fields\": [\"Star\"]}}]',16,1),(147,'2025-05-17 04:48:09.462847','22','sofa demo sdsdesfrgergrgergfrgdsffffffffffffffffffffffffffffffffffffff',2,'[{\"changed\": {\"fields\": [\"Pro name\"]}}]',16,1),(148,'2025-05-17 05:06:03.137774','22','sofa demo sdsdesfrgergrgergfrgdsffffffffffffffffffffffffffffffffffffff',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',16,1),(149,'2025-05-17 06:43:14.382528','3','Rajesh loosu - 9712543264',3,'',26,1),(150,'2025-05-17 08:38:00.278711','18','demo a',2,'[{\"changed\": {\"fields\": [\"Star\"]}}]',16,1),(151,'2025-05-17 08:39:50.993832','1','Craft object (1)',2,'[{\"changed\": {\"fields\": [\"Year\"]}}]',18,1),(152,'2025-05-17 08:40:43.355297','1','Craft object (1)',2,'[{\"changed\": {\"fields\": [\"Year\"]}}]',18,1),(153,'2025-05-17 09:49:26.100445','2','logo',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',7,1),(154,'2025-05-17 09:50:05.536562','2','logo',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',7,1),(155,'2025-05-17 10:22:49.063002','9','h',1,'[{\"added\": {}}]',14,1),(156,'2025-05-17 10:23:02.791282','18','demo a',2,'[{\"changed\": {\"fields\": [\"Link name\"]}}]',16,1),(157,'2025-05-17 10:24:09.629621','22','sofa demo sdsdesfrgergrgergfrgdsffffffffffffffffffffffffffffffffffffff',2,'[{\"changed\": {\"fields\": [\"Link name\"]}}]',16,1),(158,'2025-05-17 10:57:56.292129','21','sofa brown',2,'[{\"changed\": {\"fields\": [\"Link name\"]}}]',16,1),(159,'2025-05-17 11:00:23.430536','22','sofa demo sdsdesfrgergrgergfrgdsffffffffffffffffffffffffffffffffffffff',2,'[{\"changed\": {\"fields\": [\"Link name\"]}}]',16,1),(160,'2025-05-17 11:06:35.554673','22','sofa demo sdsdesfrgergrgergfrgdsffffffffffffffffffffffffffffffffffffff',2,'[{\"changed\": {\"fields\": [\"Link name\"]}}]',16,1),(161,'2025-05-17 12:48:22.739447','22','sofa demo sdsdesfrgergrgergfrgdsffffffffffffffffffffffffffffffffffffff',2,'[{\"changed\": {\"fields\": [\"Link name\"]}}]',16,1),(162,'2025-05-19 07:06:12.861061','2','123 Main Street, City, Country',1,'[{\"added\": {}}]',27,1),(163,'2025-05-19 09:03:00.831063','2','123 Main Street, City, Country - 09345532741 - samuelreegan372@gmail.com',2,'[]',27,1),(164,'2025-05-19 09:05:16.247215','1','Craft object (1)',2,'[]',18,1),(165,'2025-05-19 09:11:36.979132','2','123 Main Street, City, Country - 09345532741 - samuelreegan372@gmail.com',2,'[]',27,1),(166,'2025-05-19 10:12:06.953837','23','table 1',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for table 1\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for table 1\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for table 1\"}}]',16,1),(167,'2025-05-19 10:12:44.613272','23','table 1',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',16,1),(168,'2025-05-19 10:27:57.230740','2','123 Main Street, City, Country - 9345532741 - samuelreegan372@gmail.com',2,'[{\"changed\": {\"fields\": [\"Ph number\"]}}]',27,1),(169,'2025-05-19 10:30:52.274879','2','123 Main Street, City, Country - 919345532741 - samuelreegan372@gmail.com',2,'[{\"changed\": {\"fields\": [\"Ph number\"]}}]',27,1),(170,'2025-05-19 10:33:49.258019','2','123 Main Street, City, Country - 919345532741 - samuelreegan372@gmail.com',2,'[{\"changed\": {\"fields\": [\"Whatsapp url\"]}}]',27,1),(171,'2025-05-19 10:34:17.800093','2','123 Main Street, City, Country - 919345532741 - samuelreegan372@gmail.com',2,'[{\"changed\": {\"fields\": [\"Whatsapp url\"]}}]',27,1),(172,'2025-05-19 10:34:39.460613','2','123 Main Street, City, Country - 919345532741 - samuelreegan372@gmail.com',2,'[{\"changed\": {\"fields\": [\"Whatsapp url\"]}}]',27,1),(173,'2025-05-19 10:34:53.045939','2','123 Main Street, City, Country - 919345532741 - samuelreegan372@gmail.com',2,'[]',27,1),(174,'2025-05-19 10:37:54.315306','2','123 Main Street, City, Country - 9345532741 - samuelreegan372@gmail.com',2,'[{\"changed\": {\"fields\": [\"Ph number\"]}}]',27,1),(175,'2025-05-19 10:47:23.428567','18','demo a',2,'[{\"changed\": {\"fields\": [\"Star\"]}}]',16,1),(176,'2025-05-19 10:55:43.557085','21','sofa brown',2,'[{\"changed\": {\"fields\": [\"Link name\"]}}]',16,1),(177,'2025-05-19 10:56:10.152635','18','demo a',2,'[{\"changed\": {\"fields\": [\"Link name\"]}}]',16,1),(178,'2025-05-19 11:00:01.892789','22','sofa demo sdsdesfrgergrgergfrgdsffffffffffffffffffffffffffffffffffffff',2,'[{\"changed\": {\"fields\": [\"Link name\"]}}]',16,1),(179,'2025-05-19 11:00:34.025576','22','sofa demo sdsdesfrgergrgergfrgdsffffffffffffffffffffffffffffffffffffff',2,'[{\"changed\": {\"fields\": [\"Link name\"]}}]',16,1),(180,'2025-05-19 11:34:01.449107','14','demo3',2,'[{\"changed\": {\"fields\": [\"Link name\"]}}]',16,1),(181,'2025-05-21 05:17:34.261662','18','demo a',2,'[{\"changed\": {\"fields\": [\"Link name\"]}}]',16,1),(182,'2025-05-21 10:18:50.813354','24','afestwut7uherg',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for afestwut7uherg\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for afestwut7uherg\"}}]',16,1),(183,'2025-05-22 06:48:48.406720','12','sofa - 1x2',1,'[{\"added\": {}}]',15,1),(184,'2025-05-22 06:49:24.866411','12','sofa - 1x2',3,'',15,1),(185,'2025-05-22 06:50:39.559636','2','logo',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',7,1),(186,'2025-05-22 06:51:01.293624','2','logo',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',7,1),(187,'2025-05-22 06:53:26.596794','24','afestwut7uherg',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',16,1),(188,'2025-05-22 10:17:41.268865','24','afestwut7uherg',2,'[{\"changed\": {\"name\": \"product image\", \"object\": \"Image for afestwut7uherg\", \"fields\": [\"Image\"]}}]',16,1),(189,'2025-05-22 10:17:51.814582','23','table 1',2,'[{\"changed\": {\"name\": \"product image\", \"object\": \"Image for table 1\", \"fields\": [\"Image\"]}}]',16,1),(190,'2025-05-22 10:19:46.349429','23','table 12',2,'[{\"changed\": {\"fields\": [\"Pro name\"]}}]',16,1),(191,'2025-05-22 10:29:04.210101','20','Sofa blue',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',16,1),(192,'2025-05-22 10:29:31.048922','19','table demo',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',16,1),(193,'2025-05-22 10:32:31.482659','23','table 12',2,'[{\"changed\": {\"fields\": [\"Star\"]}}]',16,1),(194,'2025-05-22 10:37:31.959427','20','Sofa blue',2,'[{\"changed\": {\"name\": \"product image\", \"object\": \"Image for Sofa blue\", \"fields\": [\"Image\"]}}]',16,1),(195,'2025-05-22 10:38:39.791234','24','afestwut7uherg',2,'[{\"changed\": {\"name\": \"product image\", \"object\": \"Image for afestwut7uherg\", \"fields\": [\"Image\"]}}]',16,1),(196,'2025-05-22 10:50:53.340606','23','table 12',2,'[{\"changed\": {\"name\": \"product image\", \"object\": \"Image for table 12\", \"fields\": [\"Image\"]}}]',16,1),(197,'2025-05-22 10:51:13.722330','20','Sofa blue',2,'[{\"changed\": {\"name\": \"product image\", \"object\": \"Image for Sofa blue\", \"fields\": [\"Image\"]}}]',16,1),(198,'2025-05-22 11:12:26.550168','23','table 12',2,'[{\"changed\": {\"fields\": [\"Link name\"]}}]',16,1),(199,'2025-05-22 11:52:57.453955','24','afestwut7uherg',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',16,1),(200,'2025-05-23 05:29:00.488981','1','Rajesh',1,'[{\"added\": {}}]',28,1),(201,'2025-05-23 05:50:56.947066','1','Rajesh',2,'[{\"changed\": {\"fields\": [\"Message\"]}}]',28,1),(202,'2025-05-23 05:51:15.780303','1','Rajesh',2,'[{\"changed\": {\"fields\": [\"Point\"]}}]',28,1),(203,'2025-05-23 05:51:30.490700','1','Rajesh',2,'[{\"changed\": {\"fields\": [\"Point\"]}}]',28,1),(204,'2025-05-23 05:52:03.232787','2','Priya',1,'[{\"added\": {}}]',28,1),(205,'2025-05-23 05:52:43.883360','3','Arun',1,'[{\"added\": {}}]',28,1),(206,'2025-05-23 05:54:37.742797','4','Karthik',1,'[{\"added\": {}}]',28,1),(207,'2025-05-23 05:56:06.741089','5','Sindu',1,'[{\"added\": {}}]',28,1),(208,'2025-05-23 07:00:59.616048','13','table - 3x2,2x2',1,'[{\"added\": {}}]',15,1),(209,'2025-05-26 06:20:12.799150','2','123 Main Street, City, Country - 9345532742 - samuelreegan372@gmail.com',2,'[{\"changed\": {\"fields\": [\"Ph number\"]}}]',27,1),(210,'2025-05-26 06:37:13.214191','2','123 Main Street, City, Country - 9345532742 - samuelreegan372@gmail.com',2,'[{\"changed\": {\"fields\": [\"Whatsapp url\"]}}]',27,1),(211,'2025-05-26 06:37:29.813192','2','123 Main Street, City, Country - 9345532741 - samuelreegan372@gmail.com',2,'[{\"changed\": {\"fields\": [\"Ph number\", \"Whatsapp url\"]}}]',27,1),(212,'2025-05-26 06:37:32.624838','2','123 Main Street, City, Country - 9345532741 - samuelreegan372@gmail.com',2,'[]',27,1),(213,'2025-05-27 11:00:49.842876','5','Bero',2,'[{\"changed\": {\"fields\": [\"Categorie\"]}}]',9,1),(214,'2025-05-27 11:02:03.926588','25','Breo Check',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Breo Check\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Breo Check\"}}]',16,1),(215,'2025-05-29 05:43:11.357304','26','Bero 1',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 1\"}}]',16,1),(216,'2025-05-29 05:44:00.365465','14','Bero - 3x9,3x4',1,'[{\"added\": {}}]',15,1),(217,'2025-05-29 05:45:43.111502','26','Bero 1',2,'[{\"changed\": {\"fields\": [\"Color\"]}}]',16,1),(218,'2025-06-03 04:54:56.413582','2','123 Main Street, City, Country - 9345532741 - samuelreegan372@gmail.com',2,'[{\"changed\": {\"fields\": [\"Youtube url\"]}}]',27,1),(219,'2025-06-03 04:55:47.418259','2','123 Main Street, City, Country - 9345532741 - samuelreegan372@gmail.com',2,'[{\"changed\": {\"fields\": [\"Youtube url\"]}}]',27,1),(220,'2025-06-03 04:56:04.244740','2','123 Main Street, City, Country - 9345532742 - samuelreegan372@gmail.com',2,'[{\"changed\": {\"fields\": [\"Ph number\"]}}]',27,1),(221,'2025-06-03 05:01:01.008390','2','123 Main Street, City, Country - 9345532742 - samuelreegan372@gmail.com',2,'[{\"changed\": {\"fields\": [\"Whatsapp url\"]}}]',27,1),(222,'2025-06-03 05:21:40.165669','5','Bero',2,'[{\"changed\": {\"fields\": [\"Pic\"]}}]',9,1),(223,'2025-06-03 05:37:50.280061','6','logo',1,'[{\"added\": {}}]',7,1),(224,'2025-06-03 05:42:30.990204','2','logo',3,'',7,1),(225,'2025-06-03 05:44:18.879988','7','logo',1,'[{\"added\": {}}]',7,1),(226,'2025-06-03 06:03:41.657138','7','logo',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',7,1),(227,'2025-06-03 06:03:57.743995','7','logo',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',7,1),(228,'2025-06-03 06:19:46.652471','27','Samuel Reegan - 9345532741',2,'[]',26,1),(229,'2025-06-03 06:20:13.011979','27','Samuel Reegan - 9345532741',2,'[{\"changed\": {\"fields\": [\"Email\"]}}]',26,1),(230,'2025-06-03 06:25:53.485936','25','Breo Check',3,'',16,1),(232,'2025-06-03 06:33:40.755663','8','dgethrth',3,'',9,1),(233,'2025-06-03 06:33:47.816208','7','fgfgrsg',3,'',9,1),(234,'2025-06-03 06:34:47.067317','7','logo',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',7,1),(235,'2025-06-03 06:35:04.824479','7','logo',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',7,1),(236,'2025-06-03 06:35:50.089803','7','logo',2,'[{\"changed\": {\"fields\": [\"Picture\"]}}]',7,1),(237,'2025-06-03 06:38:13.569375','5','Bero',3,'',9,1),(238,'2025-06-03 06:38:22.979632','2','chair',3,'',9,1),(240,'2025-06-03 07:29:10.096268','6','secfrsdgfv',3,'',9,1),(241,'2025-06-03 08:46:15.549412','14','demo3',3,'',16,3),(242,'2025-06-03 08:46:20.906569','16','demo2',3,'',16,3),(243,'2025-06-03 08:46:25.454322','17','test',3,'',16,3),(244,'2025-06-03 08:46:30.649000','18','demo a',3,'',16,3),(245,'2025-06-03 08:46:35.107912','19','table demo',3,'',16,3),(246,'2025-06-03 08:46:39.829755','20','Sofa blue',3,'',16,3),(247,'2025-06-03 08:46:44.574407','21','sofa brown',3,'',16,3),(248,'2025-06-03 08:46:49.071993','22','sofa demo sdsdesfrgergrgergfrgdsffffffffffffffffffffffffffffffffffffff',3,'',16,3),(249,'2025-06-03 08:46:53.261535','23','table 12',3,'',16,3),(250,'2025-06-03 08:46:58.774634','24','afestwut7uherg',3,'',16,3),(251,'2025-06-03 08:53:42.612325','27','Sofa1',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Sofa1\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Sofa1\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Sofa1\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Sofa1\"}}]',16,3),(252,'2025-06-03 08:54:36.649864','28','Sofa 2',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Sofa 2\"}}]',16,3),(253,'2025-06-03 08:55:20.164503','29','sofa 3',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for sofa 3\"}}]',16,3),(254,'2025-06-03 08:56:05.517686','30','sofa 4',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for sofa 4\"}}]',16,3),(255,'2025-06-03 08:57:31.355736','31','sofa brown',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for sofa brown\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for sofa brown\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for sofa brown\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for sofa brown\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for sofa brown\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for sofa brown\"}}]',16,3),(256,'2025-06-03 08:57:43.740583','27','Sofa1',2,'[{\"changed\": {\"name\": \"product image\", \"object\": \"Image for Sofa1\", \"fields\": [\"Image\"]}}]',16,3),(257,'2025-06-03 08:58:21.869612','31','sofa brown',2,'[{\"changed\": {\"name\": \"product image\", \"object\": \"Image for sofa brown\", \"fields\": [\"Image\"]}}]',16,3),(258,'2025-06-03 08:59:07.465341','32','Sofa blue',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Sofa blue\"}}]',16,3),(259,'2025-06-03 08:59:51.236563','33','sofa 5',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for sofa 5\"}}]',16,3),(260,'2025-06-03 09:00:30.126901','34','sofa 6',1,'[{\"added\": {}}]',16,3),(261,'2025-06-03 09:01:10.368001','35','sofa 8',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for sofa 8\"}}]',16,3),(262,'2025-06-03 09:02:10.331792','36','Sofa 8',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Sofa 8\"}}]',16,3),(263,'2025-06-03 09:02:46.790026','37','sofa 9',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for sofa 9\"}}]',16,3),(264,'2025-06-03 09:03:57.854185','34','sofa 6',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for sofa 6\"}}]',16,3),(265,'2025-06-03 09:13:03.813728','38','sofa single',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for sofa single\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for sofa single\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for sofa single\"}}]',16,3),(266,'2025-06-03 09:16:12.378521','39','table 1',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for table 1\"}}]',16,3),(267,'2025-06-03 09:16:50.663357','9','Dining Table',1,'[{\"added\": {}}]',9,3),(268,'2025-06-03 09:17:05.821877','39','table 1',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',16,3),(269,'2025-06-03 09:17:14.133759','4','table',3,'',9,3),(270,'2025-06-03 09:20:15.994315','40','table 1',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for table 1\"}}]',16,3),(271,'2025-06-03 09:20:47.589592','41','table 12',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for table 12\"}}]',16,3),(272,'2025-06-03 09:21:28.202073','42','table 14',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for table 14\"}}]',16,3),(273,'2025-06-03 09:21:55.858220','43','table 5',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for table 5\"}}]',16,3),(274,'2025-06-03 09:25:51.018656','44','table 15',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for table 15\"}}]',16,3),(275,'2025-06-03 09:26:13.955917','10','Bero',1,'[{\"added\": {}}]',9,3),(276,'2025-06-03 09:26:53.480786','45','Bero 1',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 1\"}}]',16,3),(277,'2025-06-03 09:27:26.376351','3','Metal',1,'[{\"added\": {}}]',11,3),(278,'2025-06-03 09:28:23.132464','46','Bero 12',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 12\"}}]',16,3),(279,'2025-06-03 09:29:04.252121','47','Bero 3',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 3\"}}]',16,3),(280,'2025-06-03 09:30:17.913129','48','Bero 4',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 4\"}}]',16,3),(281,'2025-06-03 09:30:51.510076','49','Bero 5',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 5\"}}]',16,3),(282,'2025-06-03 09:31:37.009523','50','Bero 56',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 56\"}}]',16,3),(283,'2025-06-03 09:32:21.495736','51','Bero 6',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 6\"}}]',16,3),(284,'2025-06-03 09:32:48.964954','52','Bero 7',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(285,'2025-06-03 09:35:11.852288','53','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(286,'2025-06-03 09:38:26.542368','54','Bero 7',2,'[{\"changed\": {\"fields\": [\"Type\"]}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(287,'2025-06-03 09:38:46.013584','55','Bero 7',2,'[{\"changed\": {\"fields\": [\"Type\"]}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(288,'2025-06-03 09:39:02.815975','56','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(289,'2025-06-03 09:39:35.484436','57','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(290,'2025-06-03 09:39:45.504077','58','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(291,'2025-06-03 09:40:00.325657','59','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(292,'2025-06-03 09:40:09.592429','60','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(293,'2025-06-03 09:40:18.726846','61','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(294,'2025-06-03 09:40:52.556359','62','Bero 7',2,'[{\"changed\": {\"fields\": [\"Type\"]}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(295,'2025-06-03 09:42:50.414179','63','Bero 7',2,'[{\"changed\": {\"fields\": [\"Type\"]}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(296,'2025-06-03 09:43:07.270739','64','Bero 7',2,'[{\"changed\": {\"fields\": [\"Type\"]}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(297,'2025-06-03 09:43:23.045253','65','Bero 7',2,'[{\"changed\": {\"fields\": [\"Type\"]}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(298,'2025-06-03 09:43:39.731950','66','Bero 7',2,'[{\"changed\": {\"fields\": [\"Type\"]}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(299,'2025-06-03 09:43:53.769669','67','Bero 7',2,'[{\"changed\": {\"fields\": [\"Type\"]}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(300,'2025-06-03 09:44:06.627912','68','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(301,'2025-06-03 09:44:20.506448','69','Bero 7',2,'[{\"changed\": {\"fields\": [\"Type\"]}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(302,'2025-06-03 09:44:46.554339','69','Bero 7',2,'[{\"changed\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\", \"fields\": [\"Image\"]}}]',16,3),(303,'2025-06-03 09:45:15.708560','68','Bero 7',2,'[{\"changed\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\", \"fields\": [\"Image\"]}}]',16,3),(304,'2025-06-03 09:45:24.558068','68','Bero 7',2,'[{\"changed\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\", \"fields\": [\"Image\"]}}]',16,3),(305,'2025-06-03 09:45:40.837280','70','Bero 7',2,'[{\"changed\": {\"fields\": [\"Type\"]}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(306,'2025-06-03 09:45:57.570457','71','Bero 7',2,'[{\"changed\": {\"fields\": [\"Type\"]}}, {\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(307,'2025-06-03 09:47:49.767173','72','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(308,'2025-06-03 09:48:16.865339','73','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(309,'2025-06-03 09:48:28.930401','74','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(310,'2025-06-03 09:48:42.628372','75','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(311,'2025-06-03 09:48:54.577330','76','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(312,'2025-06-03 09:49:06.903606','77','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(313,'2025-06-03 09:49:18.633202','78','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(314,'2025-06-03 09:49:34.899167','79','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(315,'2025-06-03 09:49:44.310452','79','Bero 7',2,'[{\"changed\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\", \"fields\": [\"Image\"]}}]',16,3),(316,'2025-06-03 09:49:59.404644','80','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(317,'2025-06-03 09:50:19.103317','81','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(318,'2025-06-03 09:51:19.351095','81','Bero 7',2,'[{\"changed\": {\"fields\": [\"Star\"]}}]',16,3),(319,'2025-06-03 09:51:26.848455','80','Bero 7',2,'[{\"changed\": {\"fields\": [\"Star\"]}}]',16,3),(320,'2025-06-03 09:51:33.456042','79','Bero 7',2,'[{\"changed\": {\"fields\": [\"Star\"]}}]',16,3),(321,'2025-06-03 09:51:41.215683','78','Bero 7',2,'[{\"changed\": {\"fields\": [\"Star\"]}}]',16,3),(322,'2025-06-03 09:51:48.235688','77','Bero 7',2,'[{\"changed\": {\"fields\": [\"Star\"]}}]',16,3),(323,'2025-06-03 09:58:46.801736','82','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(324,'2025-06-03 09:59:03.166532','83','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(325,'2025-06-03 09:59:13.886809','84','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(326,'2025-06-03 09:59:49.497717','85','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(327,'2025-06-03 10:00:00.617114','86','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(328,'2025-06-03 10:00:31.573038','87','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(329,'2025-06-03 10:00:49.705230','88','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(330,'2025-06-03 10:01:39.795883','11','Cot',1,'[{\"added\": {}}]',9,3),(331,'2025-06-03 10:02:09.590447','88','Bero 7',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',16,3),(332,'2025-06-03 10:02:19.680181','87','Bero 7',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',16,3),(333,'2025-06-03 10:03:48.665281','89','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(334,'2025-06-03 10:04:07.581535','90','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(335,'2025-06-03 10:04:20.480602','91','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(336,'2025-06-03 10:04:33.962575','92','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(337,'2025-06-03 10:04:45.420647','93','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(338,'2025-06-03 10:04:58.046604','94','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(339,'2025-06-03 10:05:49.256192','95','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(340,'2025-06-03 10:06:02.377219','96','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(341,'2025-06-03 10:06:17.015273','97','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(342,'2025-06-03 10:06:31.810424','98','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(343,'2025-06-03 10:07:09.560970','99','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(344,'2025-06-03 10:07:20.934358','100','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(345,'2025-06-03 10:07:37.390534','101','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(346,'2025-06-03 10:08:21.920092','102','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(347,'2025-06-03 10:08:33.404131','103','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(348,'2025-06-03 10:08:55.688713','104','Bero 7',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Bero 7\"}}]',16,3),(349,'2025-06-03 10:15:20.771605','104','Bero 7',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',16,3),(350,'2025-06-03 10:17:13.060588','104','Bero 7',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',16,3),(351,'2025-06-03 10:32:51.816673','93','Bero 7',2,'[{\"changed\": {\"fields\": [\"Link name\"]}}]',16,3),(352,'2025-06-03 10:59:25.560291','104','Bero 7',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',16,3),(353,'2025-06-03 11:00:08.982333','104','Bero 7',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',16,3),(354,'2025-06-04 06:14:36.001415','12','Pooja Cuboard',1,'[{\"added\": {}}]',9,3),(355,'2025-06-04 06:15:55.943309','13','Tables',1,'[{\"added\": {}}]',9,3),(356,'2025-06-04 06:16:28.715520','83','Bero 7',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',16,3),(357,'2025-06-04 06:19:00.010317','14','Dressing Table',1,'[{\"added\": {}}]',9,3),(358,'2025-06-04 06:24:12.335732','30','Samuel Reegan - 9345532741',2,'[{\"changed\": {\"fields\": [\"Email\"]}}]',26,3),(359,'2025-06-04 07:25:28.428395','3','metal',2,'[{\"changed\": {\"fields\": [\"Type name\"]}}]',11,3),(360,'2025-06-05 10:14:01.701971','15','Rajesh Product',1,'[{\"added\": {}}]',9,1),(361,'2025-06-05 10:20:43.196009','27','Sofa190',2,'[{\"changed\": {\"fields\": [\"Pro name\"]}}, {\"changed\": {\"name\": \"product image\", \"object\": \"Image for Sofa190\", \"fields\": [\"Image\"]}}]',16,1),(362,'2025-06-05 10:21:42.668093','27','Sofa190',2,'[{\"changed\": {\"name\": \"product image\", \"object\": \"Image for Sofa190\", \"fields\": [\"Image\"]}}]',16,1),(363,'2025-06-05 12:08:42.774781','27','Sofa190',2,'[{\"changed\": {\"name\": \"product image\", \"object\": \"Image for Sofa190\", \"fields\": [\"Image\"]}}]',16,1),(364,'2025-06-05 12:14:17.563217','27','Sofa190',2,'[{\"changed\": {\"name\": \"product image\", \"object\": \"Image for Sofa190\", \"fields\": [\"Image\"]}}]',16,1),(365,'2025-06-05 12:25:40.807967','27','Sofa190',2,'[{\"changed\": {\"name\": \"product image\", \"object\": \"Image for Sofa190\", \"fields\": [\"Image\"]}}]',16,1),(366,'2025-06-05 12:25:58.964581','27','Sofa190',2,'[{\"changed\": {\"name\": \"product image\", \"object\": \"Image for Sofa190\", \"fields\": [\"Image\"]}}]',16,1),(367,'2025-06-05 12:28:03.217891','15','Rajesh Product',2,'[{\"changed\": {\"fields\": [\"Pic\"]}}]',9,1),(368,'2025-06-05 12:32:33.953191','14','Dressing Table',2,'[{\"changed\": {\"fields\": [\"Pic\"]}}]',9,1),(369,'2025-06-05 12:39:20.786734','15','Rajesh Product',2,'[{\"changed\": {\"fields\": [\"Pic\"]}}]',9,1),(370,'2025-06-05 12:45:20.828523','27','Sofa190',2,'[{\"changed\": {\"name\": \"product image\", \"object\": \"Image for Sofa190\", \"fields\": [\"Image\"]}}]',16,1),(371,'2025-06-05 12:56:44.878918','15','Rajesh Product',3,'',9,1),(372,'2025-06-06 05:37:10.075458','86','Bero 7',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',16,3),(373,'2025-06-06 05:37:54.204120','85','Bero 7',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',16,3),(374,'2025-06-06 05:38:03.791148','84','Bero 7',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',16,3),(375,'2025-06-06 05:38:34.845397','82','Bero 7',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',16,3),(376,'2025-06-06 05:38:49.832598','77','Bero 7',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',16,3),(377,'2025-06-06 05:38:58.213354','76','Bero 7',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',16,3),(378,'2025-06-06 05:39:08.568499','69','Bero 7',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',16,3),(379,'2025-06-06 05:39:18.932169','68','Bero 7',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',16,3),(380,'2025-06-06 05:39:29.816314','67','Bero 7',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',16,3),(381,'2025-06-06 05:39:41.858360','66','Bero 7',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',16,3),(382,'2025-06-06 05:39:52.683787','65','Bero 7',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',16,3),(383,'2025-06-06 05:40:03.667686','64','Bero 7',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',16,3),(384,'2025-06-06 05:40:16.041698','48','Bero 4',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',16,3),(385,'2025-06-06 05:42:43.265149','45','Bero 1',2,'[{\"changed\": {\"fields\": [\"Link name\"]}}]',16,3),(386,'2025-06-09 04:52:25.251600','6','a',3,'',14,3),(387,'2025-06-09 04:52:30.769172','8','b',3,'',14,3),(388,'2025-06-09 04:52:37.284435','9','h',3,'',14,3);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(23,'app','aboutmodel'),(24,'app','contactsettingmodel'),(25,'app','contactusmodel'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(22,'carosel','carouselimage'),(9,'categories','category'),(10,'colorList','color'),(20,'contact','contactsettingmodel'),(21,'contact','contactusmodel'),(27,'contactinfo','info'),(5,'contenttypes','contenttype'),(18,'craft','craft'),(26,'enquirie','enquiriesmodel'),(19,'enquiries','enquiriesmodel'),(7,'Logo','logo'),(8,'Pro_banner','pro_banner'),(16,'product','product'),(17,'product','productimage'),(13,'productsize','productsize'),(15,'proSize','productsize'),(28,'reviews','review'),(6,'sessions','session'),(12,'size','size'),(11,'type','type'),(14,'weblink','weblink');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-04-25 11:42:18.849229'),(2,'auth','0001_initial','2025-04-25 11:42:19.477113'),(3,'admin','0001_initial','2025-04-25 11:42:19.642801'),(4,'admin','0002_logentry_remove_auto_add','2025-04-25 11:42:19.649339'),(5,'admin','0003_logentry_add_action_flag_choices','2025-04-25 11:42:19.657238'),(6,'contenttypes','0002_remove_content_type_name','2025-04-25 11:42:19.744737'),(7,'auth','0002_alter_permission_name_max_length','2025-04-25 11:42:19.831835'),(8,'auth','0003_alter_user_email_max_length','2025-04-25 11:42:19.865509'),(9,'auth','0004_alter_user_username_opts','2025-04-25 11:42:19.872550'),(10,'auth','0005_alter_user_last_login_null','2025-04-25 11:42:19.948629'),(11,'auth','0006_require_contenttypes_0002','2025-04-25 11:42:19.952744'),(12,'auth','0007_alter_validators_add_error_messages','2025-04-25 11:42:19.961796'),(13,'auth','0008_alter_user_username_max_length','2025-04-25 11:42:20.057448'),(14,'auth','0009_alter_user_last_name_max_length','2025-04-25 11:42:20.134707'),(15,'auth','0010_alter_group_name_max_length','2025-04-25 11:42:20.154909'),(16,'auth','0011_update_proxy_permissions','2025-04-25 11:42:20.163255'),(17,'auth','0012_alter_user_first_name_max_length','2025-04-25 11:42:20.234455'),(18,'sessions','0001_initial','2025-04-25 11:42:20.272198'),(19,'Logo','0001_initial','2025-04-25 11:50:02.463337'),(20,'Logo','0002_logo_updated_at','2025-04-25 12:46:31.515954'),(21,'Logo','0003_logo_product_image','2025-04-25 16:53:44.014847'),(22,'Logo','0004_remove_logo_product_image','2025-04-25 17:16:44.509715'),(23,'Pro_banner','0001_initial','2025-04-25 17:16:44.530962'),(24,'categories','0001_initial','2025-05-13 05:10:08.351015'),(25,'colorList','0001_initial','2025-05-13 05:42:38.702035'),(26,'type','0001_initial','2025-05-13 05:58:44.067602'),(27,'size','0001_initial','2025-05-13 06:14:33.857832'),(28,'size','0002_remove_size_category_name_size_category','2025-05-13 06:35:30.626972'),(29,'size','0003_alter_size_category','2025-05-13 07:11:41.546698'),(30,'size','0004_alter_size_category_alter_size_sizes','2025-05-13 07:28:26.881267'),(31,'productsize','0001_initial','2025-05-13 08:34:57.954289'),(32,'weblink','0001_initial','2025-05-13 08:44:33.422603'),(33,'proSize','0001_initial','2025-05-13 09:14:10.164812'),(34,'proSize','0002_remove_productsize_name_productsize_category','2025-05-13 09:17:41.713041'),(35,'product','0001_initial','2025-05-13 09:34:11.445109'),(36,'product','0002_product_description_product_price_product_pro_img_and_more','2025-05-13 09:45:58.522171'),(37,'product','0003_remove_product_pro_img_alter_product_star_and_more','2025-05-13 10:04:15.303014'),(38,'product','0004_alter_product_pro_name_alter_product_size_and_more','2025-05-13 10:24:56.900623'),(39,'product','0005_alter_product_pro_name_alter_product_size_and_more','2025-05-13 10:25:21.720098'),(40,'proSize','0003_alter_productsize_sizes','2025-05-13 11:08:31.985526'),(41,'proSize','0004_alter_productsize_category_and_more','2025-05-13 11:12:50.663611'),(42,'proSize','0005_alter_productsize_unique_together_and_more','2025-05-14 05:25:51.957088'),(43,'proSize','0006_alter_productsize_sizes_and_more','2025-05-14 05:26:23.722032'),(44,'proSize','0007_category_alter_productsize_sizes_and_more','2025-05-14 05:49:57.679962'),(45,'proSize','0008_alter_productsize_category_alter_productsize_sizes_and_more','2025-05-14 05:49:57.700045'),(46,'product','0006_rename_size_product_size_group_product_selected_size','2025-05-14 05:59:47.355971'),(47,'product','0007_rename_size_group_product_size_and_more','2025-05-14 06:02:25.704814'),(48,'product','0008_remove_product_size_product_selected_size','2025-05-14 06:06:37.087104'),(49,'product','0009_remove_product_selected_size_product_size','2025-05-14 06:18:33.368790'),(50,'product','0010_alter_product_star','2025-05-14 07:02:23.570947'),(51,'proSize','0009_alter_productsize_unique_together','2025-05-15 07:26:00.526181'),(52,'craft','0001_initial','2025-05-15 07:32:02.621874'),(53,'craft','0002_craft_client_craft_projects_craft_year','2025-05-15 07:51:49.446863'),(54,'enquiries','0001_initial','2025-05-15 08:42:18.327057'),(55,'contact','0001_initial','2025-05-15 10:13:58.186137'),(56,'carosel','0001_initial','2025-05-16 05:19:22.770272'),(57,'app','0001_initial','2025-05-16 05:39:32.211860'),(58,'enquiries','0002_enquiriesmodel_created_at','2025-05-17 06:14:08.763327'),(59,'enquiries','0003_alter_enquiriesmodel_created_at','2025-05-17 06:15:31.364166'),(60,'enquirie','0001_initial','2025-05-17 06:21:56.030750'),(61,'enquirie','0002_enquiriesmodel_is_verified','2025-05-17 06:27:59.731339'),(62,'contactinfo','0001_initial','2025-05-19 07:02:15.143799'),(63,'reviews','0001_initial','2025-05-23 05:26:38.169844'),(64,'product','0011_alter_product_category','2025-06-03 06:55:37.531097');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1w4y881iocy5zwlixog1i6z1sboeksuu','.eJxVjDsOwjAQRO_iGllrYxZMSZ8zWPtxcAA5UpxUiLuTSCmgnHlv5m0SLXNJS8tTGtRcjTOH345JnrluQB9U76OVsc7TwHZT7E6b7UbNr9vu_h0UamVdM0oM4InZK2LMJ9DeX_JRFVCQI3jBIBAFxdE5OA5xDQrce8jORfP5Au4NN-0:1uJR6R:6p85e3Utit4aOTBkgI5LIm7f9sel21MKfrXfDs2ptdk','2025-06-09 06:14:27.076913'),('cs8vdgiqlp08oojtzc3uuqiux7a6oxg8','.eJxVjMsOwiAQRf-FtSEMjyIu3fcbyPAYqRpISrsy_ruSdKHbe865L-Zx34rfe179ktiFATv9bgHjI9cB0h3rrfHY6rYugQ-FH7TzuaX8vB7u30HBXr61jE6QwmTBapOBJAmMWqZw1sYZiGCyIAItoxVkg07TpNRwEUg7RPb-ANvUN5E:1u8HaA:4dnvKOxPeEJ6vXoqiSaliAd8xiraGkiX2_7-btutJKY','2025-05-09 11:51:02.812033'),('h2ee9sufh2m2tcl07l1kwpxvl6fn4mpz','.eJxVjMsOwiAQRf-FtSEMjyIu3fcbyPAYqRpISrsy_ruSdKHbe865L-Zx34rfe179ktiFATv9bgHjI9cB0h3rrfHY6rYugQ-FH7TzuaX8vB7u30HBXr61jE6QwmTBapOBJAmMWqZw1sYZiGCyIAItoxVkg07TpNRwEUg7RPb-ANvUN5E:1uI5QA:sAvlaxilwVfHz0pCHLmNTOwr3OyO-6LU5OayJRcXWY8','2025-06-05 12:53:14.081991'),('k0ku2yreg76m5l0ky9ylrmqt4qfq46ei','.eJxVjMsOwiAQAP-FsyHQrTw8evcbyMIuUjWQlPZk_HdD0oNeZybzFgH3rYS98xoWEhcB4vTLIqYn1yHogfXeZGp1W5coRyIP2-WtEb-uR_s3KNjL2JpE5JMyGrO3c7RZOcLkEUFFdzakHLO2BMkZhsk7mK0mQNJ5sgai-HwB9sM4Cg:1uNAJf:-m-WqJ0UW6zcFUwmkWNldrjnTV9BFJ3FfqMIAxm5XAs','2025-06-19 13:07:31.686894'),('k6cb3my2s6bplmmsc8l0uttnia9fqzbp','.eJxVjMsOwiAQAP-FsyHQrTw8evcbyMIuUjWQlPZk_HdD0oNeZybzFgH3rYS98xoWEhcB4vTLIqYn1yHogfXeZGp1W5coRyIP2-WtEb-uR_s3KNjL2JpE5JMyGrO3c7RZOcLkEUFFdzakHLO2BMkZhsk7mK0mQNJ5sgai-HwB9sM4Cg:1uNVCo:cvs4MGl3G8nVDImo-kqq_STwmlA3LP6I2-v3pa6W0bU','2025-06-20 11:25:50.073851'),('n25r5mbqo5klrvel7xcs6qhq5zflvomz','.eJxVjMsOwiAQRf-FtSEMjyIu3fcbyPAYqRpISrsy_ruSdKHbe865L-Zx34rfe179ktiFATv9bgHjI9cB0h3rrfHY6rYugQ-FH7TzuaX8vB7u30HBXr61jE6QwmTBapOBJAmMWqZw1sYZiGCyIAItoxVkg07TpNRwEUg7RPb-ANvUN5E:1uHcLO:AAHzPOxy2mFfLM0BeTFGZTbtfTzwTs-HwIrEvsLg-gI','2025-06-04 05:50:22.804476'),('oy1316d9tfb7bkctyp27adt1tqnjnl3r','.eJxVjDsOwjAQBe_iGlnrf0xJnzNYtneNA8iR4qRC3J1ESgHtm5n3ZiFuaw1bpyVMyK5MscvvlmJ-UjsAPmK7zzzPbV2mxA-Fn7TzcUZ63U7376DGXvfaGVuMMLo4LaQDjRJidpBB-UGi8FE4APJJ2IKSAG0i3FHRagAvlWSfL7K5Nqw:1uMNEg:8lVRrFFlHxIk6EucolKs8K343y02DeGkNirywSyiabU','2025-06-17 08:43:06.276920');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enquirie_enquiriesmodel`
--

DROP TABLE IF EXISTS `enquirie_enquiriesmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enquirie_enquiriesmodel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `name` longtext,
  `phone_number` bigint DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `enquiry_date` datetime(6) NOT NULL,
  `Product_id_id` bigint DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enquirie_enquiriesmo_Product_id_id_2913b5f4_fk_product_p` (`Product_id_id`),
  CONSTRAINT `enquirie_enquiriesmo_Product_id_id_2913b5f4_fk_product_p` FOREIGN KEY (`Product_id_id`) REFERENCES `product_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enquirie_enquiriesmodel`
--

LOCK TABLES `enquirie_enquiriesmodel` WRITE;
/*!40000 ALTER TABLE `enquirie_enquiriesmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `enquirie_enquiriesmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logo_logo`
--

DROP TABLE IF EXISTS `logo_logo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logo_logo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `picture` varchar(100) DEFAULT NULL,
  `logo_name` varchar(200) DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logo_logo`
--

LOCK TABLES `logo_logo` WRITE;
/*!40000 ALTER TABLE `logo_logo` DISABLE KEYS */;
INSERT INTO `logo_logo` VALUES (6,'images/404.gif','logo','2025-06-03 05:37:50.278566'),(7,'images/logo_TnY3G5l.png','logo','2025-06-03 06:35:50.087806');
/*!40000 ALTER TABLE `logo_logo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_banner_pro_banner`
--

DROP TABLE IF EXISTS `pro_banner_pro_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pro_banner_pro_banner` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_image` varchar(100) DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL,
  `Banner_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_banner_pro_banner`
--

LOCK TABLES `pro_banner_pro_banner` WRITE;
/*!40000 ALTER TABLE `pro_banner_pro_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `pro_banner_pro_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_product`
--

DROP TABLE IF EXISTS `product_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `star` varchar(3) NOT NULL,
  `category_id` bigint NOT NULL,
  `color_id` bigint NOT NULL,
  `link_name_id` bigint NOT NULL,
  `type_id` bigint NOT NULL,
  `description` longtext NOT NULL DEFAULT (_utf8mb4'1'),
  `price` decimal(10,2) NOT NULL,
  `pro_name` varchar(255) NOT NULL,
  `size` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_product_category_id_0c725779_fk_categories_category_id` (`category_id`),
  KEY `product_product_color_id_3e70209c_fk_colorList_color_id` (`color_id`),
  KEY `product_product_link_name_id_27093166_fk_weblink_weblink_id` (`link_name_id`),
  KEY `product_product_type_id_db92a7b7_fk_type_type_id` (`type_id`),
  CONSTRAINT `product_product_category_id_0c725779_fk_categories_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories_category` (`id`),
  CONSTRAINT `product_product_color_id_3e70209c_fk_colorList_color_id` FOREIGN KEY (`color_id`) REFERENCES `colorlist_color` (`id`),
  CONSTRAINT `product_product_link_name_id_27093166_fk_weblink_weblink_id` FOREIGN KEY (`link_name_id`) REFERENCES `weblink_weblink` (`id`),
  CONSTRAINT `product_product_type_id_db92a7b7_fk_type_type_id` FOREIGN KEY (`type_id`) REFERENCES `type_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_product`
--

LOCK TABLES `product_product` WRITE;
/*!40000 ALTER TABLE `product_product` DISABLE KEYS */;
INSERT INTO `product_product` VALUES (27,'yes',1,1,7,2,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Sofa190','3x2'),(28,'yes',1,1,7,2,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',1212.00,'Sofa 2','3x4'),(29,'yes',1,1,7,2,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',2000.00,'sofa 3','3x9'),(30,'yes',1,1,7,2,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',2000.00,'sofa 4','3x2'),(31,'yes',1,5,7,2,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',1212.00,'sofa brown','3x4'),(32,'no',1,1,7,2,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',1212.00,'Sofa blue','3x4'),(33,'no',1,5,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',200.00,'sofa 5','3x4'),(34,'no',1,5,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',12120.00,'sofa 6','3x9'),(35,'no',1,5,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',2000.00,'sofa 8','3x4'),(36,'no',1,5,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',12121.00,'Sofa 8','3x4'),(37,'no',1,5,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',20021.00,'sofa 9','3x4'),(38,'no',1,1,7,2,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',121223.00,'sofa single','3x4'),(39,'no',9,5,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',1212.00,'table 1','3x4'),(40,'no',9,5,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',200.00,'table 1','3x4'),(41,'no',9,5,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',1212.00,'table 12','3x9'),(42,'yes',9,5,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',121289.00,'table 14','3x2'),(43,'no',9,5,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',1212.00,'table 5','3x4'),(44,'no',9,5,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',20021.00,'table 15','3x4'),(46,'no',10,5,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',23332.00,'Bero 12','3x9'),(47,'no',10,5,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',45677.00,'Bero 3','3x2'),(48,'no',14,5,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',45333.00,'Bero 4','3x4'),(49,'no',10,5,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',20002.00,'Bero 5','3x2'),(50,'no',10,5,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',43322.00,'Bero 56','3x4'),(51,'yes',10,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',20002.00,'Bero 6','3x2'),(52,'no',10,1,7,3,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(53,'no',10,1,7,3,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(54,'no',10,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(55,'no',10,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(56,'no',10,1,7,3,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(57,'no',10,1,7,3,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(58,'yes',10,1,7,3,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(59,'no',10,1,7,3,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(60,'no',10,1,7,3,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(61,'no',10,1,7,3,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(62,'no',10,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(63,'no',10,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(64,'no',14,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(65,'no',14,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(66,'no',14,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(67,'no',14,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(68,'no',14,1,7,3,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(69,'no',14,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(70,'no',10,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(71,'no',10,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(72,'no',10,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(73,'no',10,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(74,'no',10,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(75,'no',10,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(76,'no',14,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(77,'no',14,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(78,'no',10,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(79,'no',10,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(80,'no',10,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(81,'no',10,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(82,'no',14,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(83,'no',12,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(84,'no',13,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(85,'no',13,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(86,'no',13,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(87,'no',11,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(88,'no',11,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(89,'no',11,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(90,'no',11,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(91,'no',11,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(92,'no',11,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(94,'no',11,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(95,'no',11,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(96,'no',11,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(97,'no',11,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(98,'no',11,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(99,'no',11,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(100,'no',11,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(101,'no',11,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(102,'no',11,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(103,'no',11,1,7,1,'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity',10000000.00,'Bero 7','3x9'),(104,'no',11,1,7,1,'communication that aims to make vivid a place, object, person, group, or other physical entityDescription is any type of communication that aims to make vivid a place, object, person, group, or other physical entityDescription is any type of communication that aims to make vivid a place, object, person, group, or other physical entityDescription is any type of communication that aims to make vivid a place, object, person, group, or other physical entityther physical entitycommunication that aims to make vivid a place, object, person, group, or other physical entityDescription is any type of communication that aims to make vivid a place, object, person, group, or other physical entityDescription is any type of communication that aims to make vivid a place, object, person, group, or other physical',10000000.00,'Bero 7','3x9');
/*!40000 ALTER TABLE `product_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_productimage`
--

DROP TABLE IF EXISTS `product_productimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_productimage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_productimage_product_id_544084bb_fk_product_product_id` (`product_id`),
  CONSTRAINT `product_productimage_product_id_544084bb_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_productimage`
--

LOCK TABLES `product_productimage` WRITE;
/*!40000 ALTER TABLE `product_productimage` DISABLE KEYS */;
INSERT INTO `product_productimage` VALUES (73,'product_images/6000x4000_57_Uacp9HW.jpg',27),(74,'product_images/_DSC6109_BHoEIzZ.JPG',27),(75,'product_images/_DSC6112_02TaKi9.JPG',27),(76,'product_images/_DSC6113_FrJxMGe.JPG',27),(77,'product_images/6000x4000_54_-_Copy.jpg',28),(78,'product_images/6000x4000_55_-_Copy.jpg',29),(79,'product_images/6000x4000_56_-_Copy.jpg',30),(80,'product_images/6000x4000_44.jpg',31),(81,'product_images/DSC_0255_TXwkyEk.JPG',31),(82,'product_images/DSC_0261_c5UfjWX.JPG',31),(83,'product_images/DSC_0254_ibO7Hpv.JPG',31),(84,'product_images/DSC_0262_Gf4Jgxg.JPG',31),(85,'product_images/DSC_0263.JPG',31),(86,'product_images/6000x4000_45.jpg',32),(87,'product_images/6000x4000_42.jpg',33),(88,'product_images/6000x4000_48.jpg',35),(89,'product_images/6000x4000_51_-_Copy.jpg',36),(90,'product_images/6000x4000_52_-_Copy.jpg',37),(91,'product_images/6000x4000_52_-_Copy_N3qeMSp.jpg',34),(92,'product_images/6000x4000_59.jpg',38),(93,'product_images/6000x4000_58.jpg',38),(94,'product_images/6000x4000_57.jpg',38),(95,'product_images/6000x4000_60.jpg',39),(96,'product_images/6000x4000_61.jpg',40),(97,'product_images/6000x4000_62.jpg',41),(98,'product_images/6000x4000_64.jpg',42),(99,'product_images/6000x4000_65.jpg',43),(100,'product_images/6000x4000_77.jpg',44),(102,'product_images/6000x4000_1_jjgmrnP.jpg',46),(103,'product_images/6000x4000_2.jpg',47),(104,'product_images/6000x4000_3.jpg',48),(105,'product_images/6000x4000_4.jpg',49),(106,'product_images/6000x4000_5.jpg',50),(107,'product_images/6000x4000_6.jpg',51),(108,'product_images/6000x4000_7.jpg',52),(109,'product_images/6000x4000_11.jpg',53),(110,'product_images/6000x4000_8_jsht3Tw.jpg',54),(111,'product_images/6000x4000_9.jpg',55),(112,'product_images/6000x4000_12.jpg',56),(113,'product_images/6000x4000_14.jpg',57),(114,'product_images/6000x4000_15.jpg',58),(115,'product_images/6000x4000_16.jpg',59),(116,'product_images/6000x4000_17.jpg',60),(117,'product_images/6000x4000_18.jpg',61),(118,'product_images/6000x4000_13.jpg',62),(119,'product_images/6000x4000_19.jpg',63),(120,'product_images/6000x4000_20.jpg',64),(121,'product_images/6000x4000_21.jpg',65),(122,'product_images/6000x4000_22.jpg',66),(123,'product_images/6000x4000_23.jpg',67),(124,'product_images/6000x4000_24_tmynPw0.jpg',68),(125,'product_images/6000x4000_25.jpg',69),(126,'product_images/6000x4000_26.jpg',70),(127,'product_images/6000x4000_27.jpg',71),(128,'product_images/6000x4000_28.jpg',72),(129,'product_images/6000x4000_29.jpg',73),(130,'product_images/6000x4000_30.jpg',74),(131,'product_images/6000x4000_31.jpg',75),(132,'product_images/6000x4000_32.jpg',76),(133,'product_images/6000x4000_33.jpg',77),(134,'product_images/6000x4000_34.jpg',78),(135,'product_images/6000x4000_35.jpg',79),(136,'product_images/6000x4000_37.jpg',80),(137,'product_images/6000x4000_38.jpg',81),(138,'product_images/6000x4000_39.jpg',82),(139,'product_images/6000x4000_66.jpg',83),(140,'product_images/6000x4000_74.jpg',84),(141,'product_images/6000x4000_75.jpg',85),(142,'product_images/6000x4000_76.jpg',86),(143,'product_images/6000x4000_41.jpg',87),(144,'product_images/6000x4000_43.jpg',88),(145,'product_images/6000x4000_46_1.jpg',89),(146,'product_images/6000x4000_47.jpg',90),(147,'product_images/6000x4000_49.jpg',91),(148,'product_images/6000x4000_50.jpg',92),(150,'product_images/6000x4000_67.jpg',94),(151,'product_images/6000x4000_68.jpg',95),(152,'product_images/6000x4000_69.jpg',96),(153,'product_images/6000x4000_70.jpg',97),(154,'product_images/6000x4000_71.jpg',98),(155,'product_images/6000x4000_72.jpg',99),(156,'product_images/6000x4000_73.jpg',100),(157,'product_images/6000x4000_78.jpg',101),(158,'product_images/6000x4000_79.jpg',102),(159,'product_images/6000x4000_80.jpg',103),(160,'product_images/6000x4000_43_ua356t1.jpg',104);
/*!40000 ALTER TABLE `product_productimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productsize_productsize`
--

DROP TABLE IF EXISTS `productsize_productsize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productsize_productsize` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `sizes` json NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productsize_productsize`
--

LOCK TABLES `productsize_productsize` WRITE;
/*!40000 ALTER TABLE `productsize_productsize` DISABLE KEYS */;
/*!40000 ALTER TABLE `productsize_productsize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prosize_category`
--

DROP TABLE IF EXISTS `prosize_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prosize_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `categorie` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prosize_category`
--

LOCK TABLES `prosize_category` WRITE;
/*!40000 ALTER TABLE `prosize_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `prosize_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prosize_productsize`
--

DROP TABLE IF EXISTS `prosize_productsize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prosize_productsize` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sizes` varchar(100) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proSize_productsize_category_id_09b4714a` (`category_id`),
  CONSTRAINT `proSize_productsize_category_id_09b4714a_fk_categorie` FOREIGN KEY (`category_id`) REFERENCES `categories_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prosize_productsize`
--

LOCK TABLES `prosize_productsize` WRITE;
/*!40000 ALTER TABLE `prosize_productsize` DISABLE KEYS */;
INSERT INTO `prosize_productsize` VALUES (9,'3x2,7x4,2x3,4x4,5x5,3x4,7x7',1);
/*!40000 ALTER TABLE `prosize_productsize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_review`
--

DROP TABLE IF EXISTS `reviews_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(100) NOT NULL,
  `profile_pic` varchar(100) NOT NULL,
  `message` longtext NOT NULL,
  `point` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_review`
--

LOCK TABLES `reviews_review` WRITE;
/*!40000 ALTER TABLE `reviews_review` DISABLE KEYS */;
INSERT INTO `reviews_review` VALUES (1,'Rajesh','review_pics/6174680770300462477.jpg','I purchased a solid wood dining table, and I’m truly impressed.\r\nThe craftsmanship is excellent and the finish is flawless.\r\nIt feels very sturdy and matches perfectly with my decor.\r\nDelivery was on time and packaging was secure.\r\nEven the chairs are super comfortable to sit on.\r\nDefinitely worth every penny I spent!',5),(2,'Priya','review_pics/6174680770300462477_ifZZ7it.jpg','Got a modern L-shaped sofa for my living room.\r\nThe cushions are soft yet firm – just the way I like.\r\nIt instantly enhanced the overall vibe of the space.\r\nAssembly was easy with the provided guide.\r\nOnly issue: the fabric attracts a bit of dust.\r\nBut overall, I’m really satisfied with the purchase.',4),(3,'Arun','review_pics/6174680770300462477_DqX89T9.jpg','I work from home and this ergonomic chair has been a blessing.\r\nGreat lumbar support and smooth wheel movement.\r\nI can sit for hours without feeling tired or sore.\r\nThe mesh back keeps it ventilated even in summer.\r\nBuild quality feels premium for the price.\r\nHighly recommended for office or study use!',5),(4,'Karthik','review_pics/6174680770300462477_B9H9x0q.jpg','Bought a 3-door wardrobe for my bedroom.\r\nIt offers great storage space with multiple shelves.\r\nThe sliding doors glide very smoothly.\r\nColor and finish match the website photos exactly.\r\nAssembly was a bit tricky without professional help.\r\nOverall, very happy with the product quality.',4),(5,'Sindu','review_pics/6174680770300462477_Zye7CZ7.jpg','The coffee table is beautiful and well-designed.\r\nGlass top adds a sleek and modern touch.\r\nHowever, one leg was slightly uneven.\r\nCustomer support was responsive and polite.\r\nThey sent a replacement part within 3 days.\r\nStill, expected a bit more for the price.',5);
/*!40000 ALTER TABLE `reviews_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size_size`
--

DROP TABLE IF EXISTS `size_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `size_size` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sizes` json NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `size_size_category_id_98a1f984_uniq` (`category_id`),
  CONSTRAINT `size_size_category_id_98a1f984_fk_categories_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size_size`
--

LOCK TABLES `size_size` WRITE;
/*!40000 ALTER TABLE `size_size` DISABLE KEYS */;
INSERT INTO `size_size` VALUES (7,'[\"12\", \"12\", \"32\", \"23\"]',1);
/*!40000 ALTER TABLE `size_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_type`
--

DROP TABLE IF EXISTS `type_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_type`
--

LOCK TABLES `type_type` WRITE;
/*!40000 ALTER TABLE `type_type` DISABLE KEYS */;
INSERT INTO `type_type` VALUES (2,'fabric'),(3,'metal'),(1,'wood');
/*!40000 ALTER TABLE `type_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weblink_weblink`
--

DROP TABLE IF EXISTS `weblink_weblink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weblink_weblink` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `link_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weblink_weblink`
--

LOCK TABLES `weblink_weblink` WRITE;
/*!40000 ALTER TABLE `weblink_weblink` DISABLE KEYS */;
INSERT INTO `weblink_weblink` VALUES (7,'all');
/*!40000 ALTER TABLE `weblink_weblink` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-11 14:02:28
