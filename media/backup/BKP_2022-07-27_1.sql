-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: tejidos
-- ------------------------------------------------------
-- Server version	5.7.33

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add backup',7,'add_backup'),(26,'Can change backup',7,'change_backup'),(27,'Can delete backup',7,'delete_backup'),(28,'Can view backup',7,'view_backup'),(29,'Can add asociada',8,'add_asociada'),(30,'Can change asociada',8,'change_asociada'),(31,'Can delete asociada',8,'delete_asociada'),(32,'Can view asociada',8,'view_asociada'),(33,'Can add factura',9,'add_factura'),(34,'Can change factura',9,'change_factura'),(35,'Can delete factura',9,'delete_factura'),(36,'Can view factura',9,'view_factura'),(37,'Can add detalle',10,'add_detalle'),(38,'Can change detalle',10,'change_detalle'),(39,'Can delete detalle',10,'delete_detalle'),(40,'Can view detalle',10,'view_detalle'),(41,'Can add rol',11,'add_rol'),(42,'Can change rol',11,'change_rol'),(43,'Can delete rol',11,'delete_rol'),(44,'Can view rol',11,'view_rol'),(45,'Can add uadministrador',12,'add_uadministrador'),(46,'Can change uadministrador',12,'change_uadministrador'),(47,'Can delete uadministrador',12,'delete_uadministrador'),(48,'Can view uadministrador',12,'view_uadministrador'),(49,'Can add usuario',13,'add_usuario'),(50,'Can change usuario',13,'change_usuario'),(51,'Can delete usuario',13,'delete_usuario'),(52,'Can view usuario',13,'view_usuario'),(53,'Can add pago',14,'add_pago'),(54,'Can change pago',14,'change_pago'),(55,'Can delete pago',14,'delete_pago'),(56,'Can view pago',14,'view_pago'),(57,'Can add detalle_pago',15,'add_detalle_pago'),(58,'Can change detalle_pago',15,'change_detalle_pago'),(59,'Can delete detalle_pago',15,'delete_detalle_pago'),(60,'Can view detalle_pago',15,'view_detalle_pago'),(61,'Can add color',16,'add_color'),(62,'Can change color',16,'change_color'),(63,'Can delete color',16,'delete_color'),(64,'Can view color',16,'view_color'),(65,'Can add marca',17,'add_marca'),(66,'Can change marca',17,'change_marca'),(67,'Can delete marca',17,'delete_marca'),(68,'Can view marca',17,'view_marca'),(69,'Can add talla',18,'add_talla'),(70,'Can change talla',18,'change_talla'),(71,'Can delete talla',18,'delete_talla'),(72,'Can view talla',18,'view_talla'),(73,'Can add producto',19,'add_producto'),(74,'Can change producto',19,'change_producto'),(75,'Can delete producto',19,'delete_producto'),(76,'Can view producto',19,'view_producto'),(77,'Can add post',20,'add_post'),(78,'Can change post',20,'change_post'),(79,'Can delete post',20,'delete_post'),(80,'Can view post',20,'view_post');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$320000$ax5IMYDSgv56Iai1dR3k6X$ec+eBhgA8k8gDRauemH0vM3+HNX39r9i3L3zl+RJLqw=','2022-07-27 12:57:29.198909',1,'admin','','','admin@misena.edu.co',1,1,'2022-07-27 12:27:20.137701');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta_post`
--

DROP TABLE IF EXISTS `cuenta_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cuenta_post_user_id_644c916b_fk_auth_user_id` (`user_id`),
  CONSTRAINT `cuenta_post_user_id_644c916b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta_post`
--

LOCK TABLES `cuenta_post` WRITE;
/*!40000 ALTER TABLE `cuenta_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuenta_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(20,'cuenta','post'),(8,'facturas','asociada'),(10,'facturas','detalle'),(9,'facturas','factura'),(7,'gestion','backup'),(15,'pago','detalle_pago'),(14,'pago','pago'),(16,'productos','color'),(17,'productos','marca'),(19,'productos','producto'),(18,'productos','talla'),(6,'sessions','session'),(11,'usuarios','rol'),(12,'usuarios','uadministrador'),(13,'usuarios','usuario');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-07-27 12:26:07.066920'),(2,'auth','0001_initial','2022-07-27 12:26:07.327639'),(3,'admin','0001_initial','2022-07-27 12:26:07.389541'),(4,'admin','0002_logentry_remove_auto_add','2022-07-27 12:26:07.396541'),(5,'admin','0003_logentry_add_action_flag_choices','2022-07-27 12:26:07.402955'),(6,'contenttypes','0002_remove_content_type_name','2022-07-27 12:26:07.447761'),(7,'auth','0002_alter_permission_name_max_length','2022-07-27 12:26:07.458110'),(8,'auth','0003_alter_user_email_max_length','2022-07-27 12:26:07.469112'),(9,'auth','0004_alter_user_username_opts','2022-07-27 12:26:07.477660'),(10,'auth','0005_alter_user_last_login_null','2022-07-27 12:26:07.498675'),(11,'auth','0006_require_contenttypes_0002','2022-07-27 12:26:07.500673'),(12,'auth','0007_alter_validators_add_error_messages','2022-07-27 12:26:07.507674'),(13,'auth','0008_alter_user_username_max_length','2022-07-27 12:26:07.518064'),(14,'auth','0009_alter_user_last_name_max_length','2022-07-27 12:26:07.527690'),(15,'auth','0010_alter_group_name_max_length','2022-07-27 12:26:07.539235'),(16,'auth','0011_update_proxy_permissions','2022-07-27 12:26:07.546234'),(17,'auth','0012_alter_user_first_name_max_length','2022-07-27 12:26:07.555448'),(18,'cuenta','0001_initial','2022-07-27 12:26:07.588822'),(19,'usuarios','0001_initial','2022-07-27 12:26:07.642037'),(20,'productos','0001_initial','2022-07-27 12:26:07.802439'),(21,'facturas','0001_initial','2022-07-27 12:26:07.890008'),(22,'facturas','0002_initial','2022-07-27 12:26:07.972766'),(23,'gestion','0001_initial','2022-07-27 12:26:07.992536'),(24,'pago','0001_initial','2022-07-27 12:26:08.025037'),(25,'pago','0002_detalle_pago','2022-07-27 12:26:08.097980'),(26,'pago','0003_detalle_pago_paga','2022-07-27 12:26:08.128221'),(27,'pago','0004_remove_detalle_pago_paga_detalle_pago_pago_and_more','2022-07-27 12:26:08.272640'),(28,'pago','0005_remove_detalle_pago_producto_detalle_pago_total_and_more','2022-07-27 12:26:08.451424'),(29,'pago','0006_remove_detalle_pago_valor_pago_detalle_pago_valor_and_more','2022-07-27 12:26:08.540331'),(30,'sessions','0001_initial','2022-07-27 12:26:08.562471');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('u4nb12zaay8t56okkpjc6s6ooz23le7x','.eJxVjDsOwjAQBe_iGlleb-IPJT1niHbtDQ4gW8qnQtwdIqWA9s3Me6mBtrUM2yLzMGV1VqBOvxtTekjdQb5TvTWdWl3nifWu6IMu-tqyPC-H-3dQaCnfWsRnC5YE2RvoPQeXQooRgrG9Q4OdMAAGzr5HixSMccI8QqRudL5T7w_I-jcI:1oGgbR:tKEy7cqju1au11tQogfhxOlkfOHgoorBMYvBaf_JqSE','2022-08-10 12:57:29.206904');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas_asociada`
--

DROP TABLE IF EXISTS `facturas_asociada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas_asociada` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `estado` varchar(10) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `factura_id` bigint(20) DEFAULT NULL,
  `producto_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `facturas_asociada_factura_id_13e23ebf_fk_facturas_factura_id` (`factura_id`),
  KEY `facturas_asociada_producto_id_b61c4bce_fk_productos_producto_id` (`producto_id`),
  CONSTRAINT `facturas_asociada_factura_id_13e23ebf_fk_facturas_factura_id` FOREIGN KEY (`factura_id`) REFERENCES `facturas_factura` (`id`),
  CONSTRAINT `facturas_asociada_producto_id_b61c4bce_fk_productos_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `productos_producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas_asociada`
--

LOCK TABLES `facturas_asociada` WRITE;
/*!40000 ALTER TABLE `facturas_asociada` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas_asociada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas_detalle`
--

DROP TABLE IF EXISTS `facturas_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas_detalle` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `estado` varchar(10) NOT NULL,
  `cantidad_detalle` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `factura_id` bigint(20) DEFAULT NULL,
  `producto_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `facturas_detalle_factura_id_2b4976b9_fk_facturas_factura_id` (`factura_id`),
  KEY `facturas_detalle_producto_id_e0906d15_fk_productos_producto_id` (`producto_id`),
  CONSTRAINT `facturas_detalle_factura_id_2b4976b9_fk_facturas_factura_id` FOREIGN KEY (`factura_id`) REFERENCES `facturas_factura` (`id`),
  CONSTRAINT `facturas_detalle_producto_id_e0906d15_fk_productos_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `productos_producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas_detalle`
--

LOCK TABLES `facturas_detalle` WRITE;
/*!40000 ALTER TABLE `facturas_detalle` DISABLE KEYS */;
INSERT INTO `facturas_detalle` VALUES (1,'Abierta',10,320000,1,1);
/*!40000 ALTER TABLE `facturas_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas_factura`
--

DROP TABLE IF EXISTS `facturas_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas_factura` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `tipofactura` varchar(10) NOT NULL,
  `neto_pagar` int(11) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `decision` varchar(10) NOT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `facturas_factura_rol_id_6180f164_fk_usuarios_rol_Rid` (`rol_id`),
  KEY `facturas_factura_usuario_id_2269c3b8_fk_usuarios_usuario_Uid` (`usuario_id`),
  CONSTRAINT `facturas_factura_rol_id_6180f164_fk_usuarios_rol_Rid` FOREIGN KEY (`rol_id`) REFERENCES `usuarios_rol` (`Rid`),
  CONSTRAINT `facturas_factura_usuario_id_2269c3b8_fk_usuarios_usuario_Uid` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios_usuario` (`Uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas_factura`
--

LOCK TABLES `facturas_factura` WRITE;
/*!40000 ALTER TABLE `facturas_factura` DISABLE KEYS */;
INSERT INTO `facturas_factura` VALUES (1,'2022-07-27','Venta',320000,'Cerrada','Activo',2,3);
/*!40000 ALTER TABLE `facturas_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestion_backup`
--

DROP TABLE IF EXISTS `gestion_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gestion_backup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `archivo` varchar(100) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion_backup`
--

LOCK TABLES `gestion_backup` WRITE;
/*!40000 ALTER TABLE `gestion_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `gestion_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago_detalle_pago`
--

DROP TABLE IF EXISTS `pago_detalle_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago_detalle_pago` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `estado` varchar(10) NOT NULL,
  `detalle_id` bigint(20) DEFAULT NULL,
  `pago_id` bigint(20) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `valor` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pago_detalle_pago_detalle_id_18612832_fk_facturas_detalle_id` (`detalle_id`),
  KEY `pago_detalle_pago_pago_id_dd0900a1_fk_pago_pago_id` (`pago_id`),
  CONSTRAINT `pago_detalle_pago_detalle_id_18612832_fk_facturas_detalle_id` FOREIGN KEY (`detalle_id`) REFERENCES `facturas_detalle` (`id`),
  CONSTRAINT `pago_detalle_pago_pago_id_dd0900a1_fk_pago_pago_id` FOREIGN KEY (`pago_id`) REFERENCES `pago_pago` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago_detalle_pago`
--

LOCK TABLES `pago_detalle_pago` WRITE;
/*!40000 ALTER TABLE `pago_detalle_pago` DISABLE KEYS */;
INSERT INTO `pago_detalle_pago` VALUES (2,'Abierta',1,1,272000,27200);
/*!40000 ALTER TABLE `pago_detalle_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago_pago`
--

DROP TABLE IF EXISTS `pago_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago_pago` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `neto_pagar` int(11) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `decision` varchar(10) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pago_pago_usuario_id_9af805af_fk_usuarios_usuario_Uid` (`usuario_id`),
  CONSTRAINT `pago_pago_usuario_id_9af805af_fk_usuarios_usuario_Uid` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios_usuario` (`Uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago_pago`
--

LOCK TABLES `pago_pago` WRITE;
/*!40000 ALTER TABLE `pago_pago` DISABLE KEYS */;
INSERT INTO `pago_pago` VALUES (1,'2022-07-27',0,'Abierta','Activo',1);
/*!40000 ALTER TABLE `pago_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_color`
--

DROP TABLE IF EXISTS `productos_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_color` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `estado` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_color`
--

LOCK TABLES `productos_color` WRITE;
/*!40000 ALTER TABLE `productos_color` DISABLE KEYS */;
INSERT INTO `productos_color` VALUES (1,'Rojo','Activo');
/*!40000 ALTER TABLE `productos_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_marca`
--

DROP TABLE IF EXISTS `productos_marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_marca` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `estado` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_marca`
--

LOCK TABLES `productos_marca` WRITE;
/*!40000 ALTER TABLE `productos_marca` DISABLE KEYS */;
INSERT INTO `productos_marca` VALUES (1,'Addidas','Activo');
/*!40000 ALTER TABLE `productos_marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_producto`
--

DROP TABLE IF EXISTS `productos_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_producto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `stock` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  `porcentaje` varchar(10) NOT NULL,
  `valorPorcentaje` double DEFAULT NULL,
  `estado` varchar(10) NOT NULL,
  `color_id` bigint(20) DEFAULT NULL,
  `marca_id` bigint(20) DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `talla_id` bigint(20) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productos_producto_color_id_c45f44ec_fk_productos_color_id` (`color_id`),
  KEY `productos_producto_marca_id_fc6a9dea_fk_productos_marca_id` (`marca_id`),
  KEY `productos_producto_rol_id_1f4c3164_fk_usuarios_rol_Rid` (`rol_id`),
  KEY `productos_producto_talla_id_bc4cde63_fk_productos_talla_id` (`talla_id`),
  KEY `productos_producto_usuario_id_0fed4d8f_fk_usuarios_usuario_Uid` (`usuario_id`),
  CONSTRAINT `productos_producto_color_id_c45f44ec_fk_productos_color_id` FOREIGN KEY (`color_id`) REFERENCES `productos_color` (`id`),
  CONSTRAINT `productos_producto_marca_id_fc6a9dea_fk_productos_marca_id` FOREIGN KEY (`marca_id`) REFERENCES `productos_marca` (`id`),
  CONSTRAINT `productos_producto_rol_id_1f4c3164_fk_usuarios_rol_Rid` FOREIGN KEY (`rol_id`) REFERENCES `usuarios_rol` (`Rid`),
  CONSTRAINT `productos_producto_talla_id_bc4cde63_fk_productos_talla_id` FOREIGN KEY (`talla_id`) REFERENCES `productos_talla` (`id`),
  CONSTRAINT `productos_producto_usuario_id_0fed4d8f_fk_usuarios_usuario_Uid` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios_usuario` (`Uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_producto`
--

LOCK TABLES `productos_producto` WRITE;
/*!40000 ALTER TABLE `productos_producto` DISABLE KEYS */;
INSERT INTO `productos_producto` VALUES (1,'Tejidos','Gorro',7,32000,'0.15',4800,'Activo',1,1,1,1,1),(2,'Ropa','Pantalon',40,120000,'0.2',24000,'Activo',1,1,3,1,2);
/*!40000 ALTER TABLE `productos_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_talla`
--

DROP TABLE IF EXISTS `productos_talla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_talla` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo_talla` varchar(8) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `estado` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_talla`
--

LOCK TABLES `productos_talla` WRITE;
/*!40000 ALTER TABLE `productos_talla` DISABLE KEYS */;
INSERT INTO `productos_talla` VALUES (1,'Numero','12','Activo');
/*!40000 ALTER TABLE `productos_talla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_rol`
--

DROP TABLE IF EXISTS `usuarios_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_rol` (
  `Rid` int(11) NOT NULL AUTO_INCREMENT,
  `Rnombre` varchar(12) NOT NULL,
  PRIMARY KEY (`Rid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_rol`
--

LOCK TABLES `usuarios_rol` WRITE;
/*!40000 ALTER TABLE `usuarios_rol` DISABLE KEYS */;
INSERT INTO `usuarios_rol` VALUES (1,'Asociada'),(2,'Cliente'),(3,'Proveedor');
/*!40000 ALTER TABLE `usuarios_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_uadministrador`
--

DROP TABLE IF EXISTS `usuarios_uadministrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_uadministrador` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(3) NOT NULL,
  `rol` varchar(13) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `documento` varchar(10) NOT NULL,
  `celular` varchar(10) NOT NULL,
  `tipo_documento` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `documento` (`documento`),
  UNIQUE KEY `celular` (`celular`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_uadministrador`
--

LOCK TABLES `usuarios_uadministrador` WRITE;
/*!40000 ALTER TABLE `usuarios_uadministrador` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_uadministrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_usuario`
--

DROP TABLE IF EXISTS `usuarios_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_usuario` (
  `Uid` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(3) NOT NULL,
  `Unombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `documento` varchar(10) NOT NULL,
  `celular` varchar(10) NOT NULL,
  `tipo_documento` varchar(3) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `rol_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Uid`),
  UNIQUE KEY `documento` (`documento`),
  UNIQUE KEY `celular` (`celular`),
  KEY `usuarios_usuario_rol_id_b0d64932_fk_usuarios_rol_Rid` (`rol_id`),
  CONSTRAINT `usuarios_usuario_rol_id_b0d64932_fk_usuarios_rol_Rid` FOREIGN KEY (`rol_id`) REFERENCES `usuarios_rol` (`Rid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_usuario`
--

LOCK TABLES `usuarios_usuario` WRITE;
/*!40000 ALTER TABLE `usuarios_usuario` DISABLE KEYS */;
INSERT INTO `usuarios_usuario` VALUES (1,'N/A','Elianita Asociada','Rojitas','545665','56333','C.C','Activo',1),(2,'N/A','brayan Proveedor','rivera','445454','5645321','C.C','Activo',3),(3,'N/A','Sebastian Cliente','Diaz','456544','5645321545','C.C','Activo',2),(4,'N/A','lksdjf','kjsfhksjdfh','45','456','T.I','Activo',2),(5,'N/A','tytr','fgh','478578','7878787878','C.E','Activo',2);
/*!40000 ALTER TABLE `usuarios_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-27  8:07:31
