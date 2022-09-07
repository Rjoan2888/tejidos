-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_tapaton
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Equipo',7,'add_equipo'),(26,'Can change Equipo',7,'change_equipo'),(27,'Can delete Equipo',7,'delete_equipo'),(28,'Can view Equipo',7,'view_equipo'),(29,'Can add Aprendiz',8,'add_aprendiz'),(30,'Can change Aprendiz',8,'change_aprendiz'),(31,'Can delete Aprendiz',8,'delete_aprendiz'),(32,'Can view Aprendiz',8,'view_aprendiz'),(33,'Can add Fondo',9,'add_fondo'),(34,'Can change Fondo',9,'change_fondo'),(35,'Can delete Fondo',9,'delete_fondo'),(36,'Can view Fondo',9,'view_fondo'),(37,'Can add Tapa',10,'add_tapa'),(38,'Can change Tapa',10,'change_tapa'),(39,'Can delete Tapa',10,'delete_tapa'),(40,'Can view Tapa',10,'view_tapa'),(41,'Can add Detalle Fondo',11,'add_detallefondo'),(42,'Can change Detalle Fondo',11,'change_detallefondo'),(43,'Can delete Detalle Fondo',11,'delete_detallefondo'),(44,'Can view Detalle Fondo',11,'view_detallefondo'),(45,'Can add backup',12,'add_backup'),(46,'Can change backup',12,'change_backup'),(47,'Can delete backup',12,'delete_backup'),(48,'Can view backup',12,'view_backup');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$320000$8rXGkn1lyU89uUny19Jbmd$SekuFvDHlJF5Lyg/vBbnVj5UFOQcUSKjlrc8RcReMxg=','2022-06-01 13:29:21.101779',1,'admin','','','',1,1,'2022-06-01 13:01:05.248309');
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
-- Table structure for table `contabilidad_detallefondo`
--

DROP TABLE IF EXISTS `contabilidad_detallefondo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contabilidad_detallefondo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` varchar(4) NOT NULL,
  `pagado` tinyint(1) NOT NULL,
  `equipo_id` bigint DEFAULT NULL,
  `fondo_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contabilidad_detalle_equipo_id_49f76b39_fk_personal_` (`equipo_id`),
  KEY `contabilidad_detalle_fondo_id_0122d198_fk_contabili` (`fondo_id`),
  CONSTRAINT `contabilidad_detalle_equipo_id_49f76b39_fk_personal_` FOREIGN KEY (`equipo_id`) REFERENCES `personal_equipo` (`id`),
  CONSTRAINT `contabilidad_detalle_fondo_id_0122d198_fk_contabili` FOREIGN KEY (`fondo_id`) REFERENCES `contabilidad_fondo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contabilidad_detallefondo`
--

LOCK TABLES `contabilidad_detallefondo` WRITE;
/*!40000 ALTER TABLE `contabilidad_detallefondo` DISABLE KEYS */;
/*!40000 ALTER TABLE `contabilidad_detallefondo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contabilidad_fondo`
--

DROP TABLE IF EXISTS `contabilidad_fondo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contabilidad_fondo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contabilidad_fondo`
--

LOCK TABLES `contabilidad_fondo` WRITE;
/*!40000 ALTER TABLE `contabilidad_fondo` DISABLE KEYS */;
/*!40000 ALTER TABLE `contabilidad_fondo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contabilidad_tapa`
--

DROP TABLE IF EXISTS `contabilidad_tapa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contabilidad_tapa` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `cantidad` int unsigned NOT NULL,
  `aprendiz_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contabilidad_tapa_aprendiz_id_96c06fbd_fk_personal_aprendiz_id` (`aprendiz_id`),
  CONSTRAINT `contabilidad_tapa_aprendiz_id_96c06fbd_fk_personal_aprendiz_id` FOREIGN KEY (`aprendiz_id`) REFERENCES `personal_aprendiz` (`id`),
  CONSTRAINT `contabilidad_tapa_chk_1` CHECK ((`cantidad` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contabilidad_tapa`
--

LOCK TABLES `contabilidad_tapa` WRITE;
/*!40000 ALTER TABLE `contabilidad_tapa` DISABLE KEYS */;
/*!40000 ALTER TABLE `contabilidad_tapa` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(11,'contabilidad','detallefondo'),(9,'contabilidad','fondo'),(10,'contabilidad','tapa'),(5,'contenttypes','contenttype'),(12,'gestion','backup'),(8,'personal','aprendiz'),(7,'personal','equipo'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-06-01 12:59:57.686525'),(2,'auth','0001_initial','2022-06-01 12:59:58.301584'),(3,'admin','0001_initial','2022-06-01 12:59:58.425793'),(4,'admin','0002_logentry_remove_auto_add','2022-06-01 12:59:58.434989'),(5,'admin','0003_logentry_add_action_flag_choices','2022-06-01 12:59:58.442990'),(6,'contenttypes','0002_remove_content_type_name','2022-06-01 12:59:58.605169'),(7,'auth','0002_alter_permission_name_max_length','2022-06-01 12:59:58.678452'),(8,'auth','0003_alter_user_email_max_length','2022-06-01 12:59:58.700944'),(9,'auth','0004_alter_user_username_opts','2022-06-01 12:59:58.708975'),(10,'auth','0005_alter_user_last_login_null','2022-06-01 12:59:58.767177'),(11,'auth','0006_require_contenttypes_0002','2022-06-01 12:59:58.770202'),(12,'auth','0007_alter_validators_add_error_messages','2022-06-01 12:59:58.777148'),(13,'auth','0008_alter_user_username_max_length','2022-06-01 12:59:58.848178'),(14,'auth','0009_alter_user_last_name_max_length','2022-06-01 12:59:58.909179'),(15,'auth','0010_alter_group_name_max_length','2022-06-01 12:59:58.925145'),(16,'auth','0011_update_proxy_permissions','2022-06-01 12:59:58.932149'),(17,'auth','0012_alter_user_first_name_max_length','2022-06-01 12:59:58.998179'),(18,'personal','0001_initial','2022-06-01 12:59:59.092246'),(19,'contabilidad','0001_initial','2022-06-01 12:59:59.287495'),(20,'contabilidad','0002_alter_detallefondo_options_alter_fondo_options_and_more','2022-06-01 12:59:59.310797'),(21,'personal','0002_alter_aprendiz_options_alter_equipo_options_and_more','2022-06-01 12:59:59.378795'),(22,'personal','0003_rename_activo_aprendiz_estado','2022-06-01 12:59:59.393797'),(23,'sessions','0001_initial','2022-06-01 12:59:59.437808'),(24,'gestion','0001_initial','2022-06-07 19:30:47.356997'),(25,'gestion','0002_rename_uploadedfile_backup_archivo_and_more','2022-06-07 19:30:47.383179'),(26,'gestion','0003_alter_backup_archivo','2022-06-07 19:30:47.389178'),(27,'gestion','0004_alter_backup_archivo_alter_backup_nombre','2022-06-07 19:30:58.452759');
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
INSERT INTO `django_session` VALUES ('esgj25jyaq5d40nl3q7r7ybbbnkjhgnh','.eJxVjMsOwiAQRf-FtSE8pGVcuvcbyJQZpGogKe3K-O-WpAvdnnPufYuA25rD1ngJM4mL0OL0yyaMTy5d0APLvcpYy7rMk-yJPGyTt0r8uh7t30HGlvvaRB8BFAAnD0QKLSercCdDpFFHr3jwZwZKhhyxNg5G5_csOQvWis8X8j43xw:1nwOPZ:G8dD88Ak07zlGXdj_j1xn-yPPTMyI3W-mxkEAKBOkPQ','2022-06-15 13:29:21.104766'),('qbac2jsjg33rqka1fcdx4jrrdezg07am','.eJxVjMsOwiAQRf-FtSE8pGVcuvcbyJQZpGogKe3K-O-WpAvdnnPufYuA25rD1ngJM4mL0OL0yyaMTy5d0APLvcpYy7rMk-yJPGyTt0r8uh7t30HGlvvaRB8BFAAnD0QKLSercCdDpFFHr3jwZwZKhhyxNg5G5_csOQvWis8X8j43xw:1nwO21:cnzypaKK0S5ogzJfzA-MaDFl1U5YlWjEJ6PEckb5TkE','2022-06-15 13:05:01.494204');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestion_backup`
--

DROP TABLE IF EXISTS `gestion_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gestion_backup` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `archivo` varchar(100) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion_backup`
--

LOCK TABLES `gestion_backup` WRITE;
/*!40000 ALTER TABLE `gestion_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `gestion_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_aprendiz`
--

DROP TABLE IF EXISTS `personal_aprendiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_aprendiz` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `documento` varchar(10) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `equipo_id` bigint DEFAULT NULL,
  `estado` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `documento` (`documento`),
  KEY `personal_aprendiz_equipo_id_f64701f0_fk_personal_equipo_id` (`equipo_id`),
  CONSTRAINT `personal_aprendiz_equipo_id_f64701f0_fk_personal_equipo_id` FOREIGN KEY (`equipo_id`) REFERENCES `personal_equipo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_aprendiz`
--

LOCK TABLES `personal_aprendiz` WRITE;
/*!40000 ALTER TABLE `personal_aprendiz` DISABLE KEYS */;
INSERT INTO `personal_aprendiz` VALUES (1,'Nina','Lopez','1','M',1,'1');
/*!40000 ALTER TABLE `personal_aprendiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_equipo`
--

DROP TABLE IF EXISTS `personal_equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_equipo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `puntos` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  CONSTRAINT `personal_equipo_chk_1` CHECK ((`puntos` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_equipo`
--

LOCK TABLES `personal_equipo` WRITE;
/*!40000 ALTER TABLE `personal_equipo` DISABLE KEYS */;
INSERT INTO `personal_equipo` VALUES (1,'Bgd',0),(2,'Sss',0);
/*!40000 ALTER TABLE `personal_equipo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-08 13:34:40
