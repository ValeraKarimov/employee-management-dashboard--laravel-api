/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.23-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: hrm_saas_api
-- ------------------------------------------------------
-- Server version	10.6.23-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `original_name` varchar(255) DEFAULT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_user_id_foreign` (`user_id`),
  CONSTRAINT `documents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_requests`
--

DROP TABLE IF EXISTS `leave_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leave_requests_user_id_foreign` (`user_id`),
  CONSTRAINT `leave_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_requests`
--

LOCK TABLES `leave_requests` WRITE;
/*!40000 ALTER TABLE `leave_requests` DISABLE KEYS */;
INSERT INTO `leave_requests` VALUES (1,2,'2026-06-20','2026-06-25','Vacation','rejected','2026-05-17 17:51:16','2026-05-19 10:26:50'),(2,2,'2026-05-22','2026-05-25','because','approved','2026-05-19 10:23:55','2026-05-19 10:26:49');
/*!40000 ALTER TABLE `leave_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2026_05_17_115733_create_profiles_table',1),(6,'2026_05_17_130221_create_leave_requests_table',1),(7,'2026_05_17_134455_create_shifts_table',1),(8,'2026_05_17_205152_create_documents_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'hrm-api-token','ce38d984079cceef6949e1e7055b861abd42c0dffa2a56a9bfee7d32989f2493','[\"*\"]','2026-05-18 08:57:36',NULL,'2026-05-17 16:48:07','2026-05-18 08:57:36'),(2,'App\\Models\\User',2,'hrm-api-token','4dfb223d8958003618e6b01e953168571309c06bc537b952b66ed501fef1767f','[\"*\"]','2026-05-18 08:59:06',NULL,'2026-05-17 17:09:15','2026-05-18 08:59:06'),(3,'App\\Models\\User',2,'hrm-api-token','073df8245f7f16b1974b29105549f925803381061c52719db679a10ee8357e69','[\"*\"]',NULL,NULL,'2026-05-18 09:53:46','2026-05-18 09:53:46'),(4,'App\\Models\\User',1,'hrm-api-token','cba47c51e0e37fdfab763a79f2c7aaf80a496839da16d044e68e3d3710895f3d','[\"*\"]',NULL,NULL,'2026-05-18 09:53:50','2026-05-18 09:53:50'),(5,'App\\Models\\User',2,'hrm-api-token','677e524b813d3bf7d9f5638b00344206c859a3a7cd12c194a2d24ba66c3fd114','[\"*\"]',NULL,NULL,'2026-05-18 09:54:25','2026-05-18 09:54:25'),(6,'App\\Models\\User',1,'hrm-api-token','dae26ba449af57dd915ad4ac8398f51e2188f4a8d1942e2a0d63dfc18eb0775f','[\"*\"]',NULL,NULL,'2026-05-18 09:54:29','2026-05-18 09:54:29'),(7,'App\\Models\\User',1,'hrm-api-token','5719158f0f0ff91b0045184b7ed8d7914773cc9566d754b00e13f98f7ed31346','[\"*\"]',NULL,NULL,'2026-05-18 09:57:31','2026-05-18 09:57:31'),(8,'App\\Models\\User',2,'hrm-api-token','b82d0843d08c7b47a7a9d06bd9ea28c54e55ced8c9458d7d56b68a79796efa62','[\"*\"]',NULL,NULL,'2026-05-18 09:57:35','2026-05-18 09:57:35'),(9,'App\\Models\\User',1,'hrm-api-token','b9d908802c5f9163847f46480f1c7fc0a430ad2907fadc9bf8b1f0b43770f32e','[\"*\"]',NULL,NULL,'2026-05-18 10:02:26','2026-05-18 10:02:26'),(10,'App\\Models\\User',2,'hrm-api-token','831867354cd1503dba75300381a3966fbb011e91d7dd4631940746ec9a96aec6','[\"*\"]',NULL,NULL,'2026-05-18 10:11:21','2026-05-18 10:11:21'),(11,'App\\Models\\User',1,'hrm-api-token','11f3d3decd9939dddf4a246d7bfbc4a05c3c2bf3aa3f99c15478b9abb28df04c','[\"*\"]','2026-05-19 07:24:01',NULL,'2026-05-18 10:11:30','2026-05-19 07:24:01'),(12,'App\\Models\\User',2,'hrm-api-token','46b670e8bf0d8b0096c362b1d864e343d83ece4cb7c50879688406b8cb6d73ff','[\"*\"]',NULL,NULL,'2026-05-19 07:26:00','2026-05-19 07:26:00'),(13,'App\\Models\\User',1,'hrm-api-token','08720155990bd1a170cee2eac298425a27dca0ff7f418dc6d0b0deb5d8445121','[\"*\"]','2026-05-19 08:00:53',NULL,'2026-05-19 07:26:09','2026-05-19 08:00:53'),(14,'App\\Models\\User',2,'hrm-api-token','3a3e545c6922184c52759d98833847ee04a01bee6c18e22c837d6261aa11b28a','[\"*\"]','2026-05-19 08:02:48',NULL,'2026-05-19 08:02:36','2026-05-19 08:02:48'),(15,'App\\Models\\User',1,'hrm-api-token','48563eb1de3580523a4ae8933269698fd4df3436912096bec0c84441bd6af5ad','[\"*\"]','2026-05-19 08:03:44',NULL,'2026-05-19 08:02:59','2026-05-19 08:03:44'),(16,'App\\Models\\User',2,'hrm-api-token','1e42f82feffe76a38bd84c9cbe3aee4a7d9765a5c60b5ef9015f5c0078be5f21','[\"*\"]','2026-05-19 08:04:12',NULL,'2026-05-19 08:03:55','2026-05-19 08:04:12'),(17,'App\\Models\\User',2,'hrm-api-token','b489aa717434e5f8a02754778e8629880d9b825f3bb6673d59deecfab9ad1375','[\"*\"]','2026-05-19 08:04:25',NULL,'2026-05-19 08:04:17','2026-05-19 08:04:25'),(18,'App\\Models\\User',1,'hrm-api-token','2d2c4a50203cf2d072ee9aee81616bad9d1a3abaebbb9f00457f7c1c2b535fb7','[\"*\"]','2026-05-19 08:04:52',NULL,'2026-05-19 08:04:32','2026-05-19 08:04:52'),(19,'App\\Models\\User',2,'hrm-api-token','71a4b0f0dc4d39d05f115eeac55074d4f6cefe08618fbb1b0b55723274515661','[\"*\"]','2026-05-19 08:05:07',NULL,'2026-05-19 08:04:56','2026-05-19 08:05:07'),(20,'App\\Models\\User',1,'hrm-api-token','559c7b9d3cb6171d1f33f73c662af81b4e070b1f23258d016a77e85c90238082','[\"*\"]','2026-05-19 08:05:38',NULL,'2026-05-19 08:05:11','2026-05-19 08:05:38'),(21,'App\\Models\\User',2,'hrm-api-token','911cf10a90a84841e03bd24495f7e48228dacabf81d9161daf67aad5676d8fe5','[\"*\"]','2026-05-19 08:05:44',NULL,'2026-05-19 08:05:42','2026-05-19 08:05:44'),(22,'App\\Models\\User',1,'hrm-api-token','4d6c81aab828eb0b5bc1dc71e50d7ca7ef0c4512bac455cea6658f55241dde96','[\"*\"]','2026-05-19 08:06:34',NULL,'2026-05-19 08:06:34','2026-05-19 08:06:34'),(23,'App\\Models\\User',1,'hrm-api-token','c15cdf5e4335180f7d28f9321e585be1eb7d5796fe2cd0090ff271fdf4a5b783','[\"*\"]','2026-05-19 08:10:59',NULL,'2026-05-19 08:10:14','2026-05-19 08:10:59'),(24,'App\\Models\\User',2,'hrm-api-token','15b95703d7a3058a6500fdc996a8a4f82fc50a4379787aa6947108cdee71869a','[\"*\"]','2026-05-19 09:22:06',NULL,'2026-05-19 08:11:05','2026-05-19 09:22:06'),(25,'App\\Models\\User',1,'hrm-api-token','acbab7323b123cae04fee881493563cd19d8caa7048de68d41eb33ecfd69ac25','[\"*\"]','2026-05-19 09:34:29',NULL,'2026-05-19 09:22:10','2026-05-19 09:34:29'),(26,'App\\Models\\User',1,'hrm-api-token','d4c05b17af023f9a85ffbf9dfd11e3fee2b009b0410be641f85aa98a52099e46','[\"*\"]','2026-05-19 09:34:41',NULL,'2026-05-19 09:34:38','2026-05-19 09:34:41'),(27,'App\\Models\\User',2,'hrm-api-token','5347a576f96435766d50cfa0effa9389d64faf4393e8ea07a814f55c40b4a39c','[\"*\"]','2026-05-19 09:34:53',NULL,'2026-05-19 09:34:45','2026-05-19 09:34:53'),(28,'App\\Models\\User',2,'hrm-api-token','b4acc125b743645b97622b34046ea7b9fb4cdfb3c02d29a7e8b678257a443d1b','[\"*\"]','2026-05-19 09:35:18',NULL,'2026-05-19 09:35:18','2026-05-19 09:35:18'),(29,'App\\Models\\User',1,'hrm-api-token','1b2f995d8447e0923a763935b09b374b04026370745ae0ac8892267ef1383c69','[\"*\"]','2026-05-19 09:35:25',NULL,'2026-05-19 09:35:25','2026-05-19 09:35:25'),(30,'App\\Models\\User',1,'hrm-api-token','322150ffb386aa9086a10990c912f75b272a20df169d38273fe981f49eecc180','[\"*\"]',NULL,NULL,'2026-05-19 09:35:27','2026-05-19 09:35:27'),(31,'App\\Models\\User',1,'hrm-api-token','64af4b2aba0bbea66ade893b194e44ccfe9258d143f2b6d581e1609383076e4c','[\"*\"]',NULL,NULL,'2026-05-19 09:35:28','2026-05-19 09:35:28'),(32,'App\\Models\\User',1,'hrm-api-token','e01e65784537009d1802d10632a6b5e35d40cc4e2a8e6021382e4b5082080bcc','[\"*\"]',NULL,NULL,'2026-05-19 09:35:28','2026-05-19 09:35:28'),(33,'App\\Models\\User',1,'hrm-api-token','587a9072b445fedb39ad5371690ab3afef50843e16b2dbdf2d61c3e3e16dd9c5','[\"*\"]',NULL,NULL,'2026-05-19 09:35:28','2026-05-19 09:35:28'),(34,'App\\Models\\User',1,'hrm-api-token','a08f2fd4875b53d7a4b49deae82de111871ac13b9d8d5f871625fd7d63900f3f','[\"*\"]',NULL,NULL,'2026-05-19 09:35:29','2026-05-19 09:35:29'),(35,'App\\Models\\User',1,'hrm-api-token','516e92051a42ec65ad06bcc9a08dcd67f44cc6b45fbbbf65767171af57c450a8','[\"*\"]',NULL,NULL,'2026-05-19 09:35:29','2026-05-19 09:35:29'),(36,'App\\Models\\User',1,'hrm-api-token','b86ef92d4460a470ac6982f52385b1812be30180df287d579924fba47bcb97ce','[\"*\"]',NULL,NULL,'2026-05-19 09:35:29','2026-05-19 09:35:29'),(37,'App\\Models\\User',1,'hrm-api-token','6e6d95233e37ddf8778299e3a9efc0850d22b88aeb50f2168ff7b3a3e4dbd83d','[\"*\"]',NULL,NULL,'2026-05-19 09:35:29','2026-05-19 09:35:29'),(38,'App\\Models\\User',1,'hrm-api-token','c221167f4f5348118c4de5c3ed0fc3312c4f8b6870ff4a02fba12efa9565b552','[\"*\"]',NULL,NULL,'2026-05-19 09:35:30','2026-05-19 09:35:30'),(39,'App\\Models\\User',1,'hrm-api-token','f29596586dafc382028f48b0f80e34f9424a50333c121e4ac99c5d18239e06d6','[\"*\"]',NULL,NULL,'2026-05-19 09:35:30','2026-05-19 09:35:30'),(40,'App\\Models\\User',1,'hrm-api-token','11fae7c46f745d784ca74e70bc18d03ca1c22c1b6da0c0df3f5c5f4d8520cb6f','[\"*\"]',NULL,NULL,'2026-05-19 09:35:30','2026-05-19 09:35:30'),(41,'App\\Models\\User',2,'hrm-api-token','f77387aebbc6f8ed6473361d33071bc82c50175f769b85339f61742f0e7f1da5','[\"*\"]',NULL,NULL,'2026-05-19 09:35:31','2026-05-19 09:35:31'),(42,'App\\Models\\User',2,'hrm-api-token','8212afa00d1238f4414e5ef4edabe9c024680795aac71eba9060ca0bb1e59ffc','[\"*\"]',NULL,NULL,'2026-05-19 09:35:32','2026-05-19 09:35:32'),(43,'App\\Models\\User',2,'hrm-api-token','8b93c4f8e999f19d2ae2d213064152a38ce244656410b2b8870e95664283b16b','[\"*\"]',NULL,NULL,'2026-05-19 09:35:33','2026-05-19 09:35:33'),(44,'App\\Models\\User',2,'hrm-api-token','38bd9938dd2659fbddb3c3e8d929b201a9c372e438853c29e9d27d38041b65ca','[\"*\"]',NULL,NULL,'2026-05-19 09:35:33','2026-05-19 09:35:33'),(45,'App\\Models\\User',2,'hrm-api-token','06d045cff3130462742abe707f89daa4a4d3604e26cb0dfa9fda3b4ff1e64da5','[\"*\"]',NULL,NULL,'2026-05-19 09:35:33','2026-05-19 09:35:33'),(46,'App\\Models\\User',2,'hrm-api-token','70b779613c38231350b9f42a2dca5200e69f2c8b9ed9fea9e80ff79d9a9a31fc','[\"*\"]',NULL,NULL,'2026-05-19 09:35:33','2026-05-19 09:35:33'),(47,'App\\Models\\User',2,'hrm-api-token','4d594a221a756e2e93367e479e5a6d93f926a8d4e6ce5800f2b737220a6e59cc','[\"*\"]',NULL,NULL,'2026-05-19 09:35:33','2026-05-19 09:35:33'),(48,'App\\Models\\User',1,'hrm-api-token','b267e0e4622aeff94aba7de88f07e854cb9c8252a3d2dd64c28dfc43478ac47c','[\"*\"]','2026-05-19 09:35:45',NULL,'2026-05-19 09:35:34','2026-05-19 09:35:45'),(49,'App\\Models\\User',2,'hrm-api-token','4a9fc246ac01fb7a9a87c5e1a1a067bf7911ad69ae832b1d5a29fb3e01dae419','[\"*\"]','2026-05-19 09:35:51',NULL,'2026-05-19 09:35:51','2026-05-19 09:35:51'),(50,'App\\Models\\User',2,'hrm-api-token','89ea7f534cb4be8dfc7ccc0a50f5147ea664c61c1aa2d5f12261688948801abd','[\"*\"]',NULL,NULL,'2026-05-19 09:35:55','2026-05-19 09:35:55'),(51,'App\\Models\\User',1,'hrm-api-token','e8ebe101895d1fd0f7f755ed67949f1580cbe22f6bdab676fc1f34b865b0370b','[\"*\"]','2026-05-19 09:42:59',NULL,'2026-05-19 09:35:57','2026-05-19 09:42:59'),(52,'App\\Models\\User',2,'hrm-api-token','794514aa3de21489aafdc2f6f28a1a19fa3e88022b48959f2c460c28aa8ae156','[\"*\"]','2026-05-19 09:43:09',NULL,'2026-05-19 09:43:09','2026-05-19 09:43:09'),(53,'App\\Models\\User',1,'hrm-api-token','6f8bf582a10740414cb88fd57e8f3edf93d4b0ad8dd8324c8a8cdb7ab005510b','[\"*\"]','2026-05-19 09:43:18',NULL,'2026-05-19 09:43:18','2026-05-19 09:43:18'),(54,'App\\Models\\User',2,'hrm-api-token','69b7b56d939133ab4527187624a2dcef0a89428c78ad7bb5ea1caa23655b0ea4','[\"*\"]','2026-05-19 09:52:58',NULL,'2026-05-19 09:43:28','2026-05-19 09:52:58'),(55,'App\\Models\\User',1,'hrm-api-token','ca94a6f28c96ca78967807b0ee78c29698ccd59c5a61433452a25f62494eeb93','[\"*\"]','2026-05-19 09:53:06',NULL,'2026-05-19 09:53:06','2026-05-19 09:53:06'),(56,'App\\Models\\User',2,'hrm-api-token','d729571da100ea3cd1fe630352127d920529307cb9855e58c98065d200b9ab41','[\"*\"]','2026-05-19 10:00:50',NULL,'2026-05-19 09:53:13','2026-05-19 10:00:50'),(57,'App\\Models\\User',2,'hrm-api-token','545c2528fa4e592c998f17c8bbda8ad4e7deebd0fcf00e20da70feea1c4fb800','[\"*\"]','2026-05-19 10:00:56',NULL,'2026-05-19 10:00:56','2026-05-19 10:00:56'),(58,'App\\Models\\User',1,'hrm-api-token','9691378d6c2ca8f04dd7008d34ee84e7cf5db444376b34880196bd90c42107f1','[\"*\"]','2026-05-19 10:01:03',NULL,'2026-05-19 10:01:03','2026-05-19 10:01:03'),(59,'App\\Models\\User',1,'hrm-api-token','5885d5d682c0c6ac5d73d0e229cca167d904e77a5efa3f65d7d2500167f0f255','[\"*\"]','2026-05-19 10:20:12',NULL,'2026-05-19 10:14:59','2026-05-19 10:20:12'),(60,'App\\Models\\User',2,'hrm-api-token','6b7f4b64404f5d410957194cc95ab79d87d893e0834cdea1dc27f3c56b619a27','[\"*\"]','2026-05-19 10:23:55',NULL,'2026-05-19 10:20:20','2026-05-19 10:23:55'),(61,'App\\Models\\User',1,'hrm-api-token','4b372cfd3a32cc96050bf59e005d0dcda0896719dfc9fb01cfe33f6b98ab7abe','[\"*\"]','2026-05-19 10:24:05',NULL,'2026-05-19 10:24:01','2026-05-19 10:24:05'),(62,'App\\Models\\User',2,'hrm-api-token','610415d9771f523a08675747f3d131fa644f3ef90e52a3579f24b672d6e77dac','[\"*\"]','2026-05-19 10:26:39',NULL,'2026-05-19 10:24:15','2026-05-19 10:26:39'),(63,'App\\Models\\User',1,'hrm-api-token','ac579548cbc84682ef8789ecf79fe6c3bc552c05412fc567e2593051e3831103','[\"*\"]','2026-05-19 10:26:50',NULL,'2026-05-19 10:26:43','2026-05-19 10:26:50'),(64,'App\\Models\\User',2,'hrm-api-token','e9ed9d0b9af3319ea1414854874da850ed81a8071bf53d97c03bf9cebd1eb3d5','[\"*\"]','2026-05-19 10:27:03',NULL,'2026-05-19 10:26:54','2026-05-19 10:27:03'),(65,'App\\Models\\User',1,'hrm-api-token','eb5a31c9023d49070dbbef52f5d02fdea6ce3d3481cc6d8884580e934bc653f6','[\"*\"]','2026-05-19 11:02:44',NULL,'2026-05-19 10:27:10','2026-05-19 11:02:44'),(66,'App\\Models\\User',2,'hrm-api-token','0525d053ea15e756778dae1aadea76a210565877ee785d1655fbf998edec379c','[\"*\"]','2026-05-19 11:03:35',NULL,'2026-05-19 11:02:50','2026-05-19 11:03:35'),(67,'App\\Models\\User',1,'hrm-api-token','587da1b7566b90d5d0e0d946056fce5f598bfcda65ef3716c8461656bfc006c6','[\"*\"]','2026-05-19 11:21:43',NULL,'2026-05-19 11:03:40','2026-05-19 11:21:43'),(68,'App\\Models\\User',2,'hrm-api-token','ceeddb9f76a8ba659ef4e80b2ba33f28f42d0a80bbd91d93fb9802036e219d55','[\"*\"]','2026-05-19 11:22:00',NULL,'2026-05-19 11:21:49','2026-05-19 11:22:00'),(69,'App\\Models\\User',1,'hrm-api-token','ad33f3abbc1750f34f4deaabada6954f661e48d8110cd07c1ec6c952591d0912','[\"*\"]','2026-05-19 11:29:34',NULL,'2026-05-19 11:22:04','2026-05-19 11:29:34');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profiles_user_id_unique` (`user_id`),
  CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,2,'+31612345678','Rotterdam','1998-05-20','Forklift Driver','Warehouse','2026-05-17 18:38:31','2026-05-17 18:38:31'),(2,1,'+31699999999','Amsterdam','1990-01-10','HR Manager','HR','2026-05-17 18:40:29','2026-05-17 18:40:29');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shifts`
--

DROP TABLE IF EXISTS `shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `shifts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `city` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `schedule_status` varchar(255) NOT NULL DEFAULT 'pending',
  `hours_approval_status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shifts_user_id_foreign` (`user_id`),
  CONSTRAINT `shifts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shifts`
--

LOCK TABLES `shifts` WRITE;
/*!40000 ALTER TABLE `shifts` DISABLE KEYS */;
INSERT INTO `shifts` VALUES (1,2,'2026-06-10','09:00:00','17:00:00','Roosendaal','Forklift','Andy works N.V.','pending','approved','2026-05-17 16:50:00','2026-05-17 16:53:05'),(2,2,'2026-05-24','14:59:00','18:00:00','Roosendaaal','Free','Dream Company','pending','pending','2026-05-18 10:55:36','2026-05-19 08:05:35'),(3,2,'2026-05-23','06:00:00','15:00:00','Roosendaal','Second One','The Best Company','pending','pending','2026-05-19 08:10:59','2026-05-19 08:10:59');
/*!40000 ALTER TABLE `shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'employee',
  `department` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin User','admin@example.com',NULL,'$2y$12$Qv.aUiVqFuvZL9sL7odDVeAyctFaO2aL3/APTBXp56I78qZVhAQKK','admin','Management','A&R','active',NULL,'2026-05-17 12:48:29','2026-05-19 11:29:25'),(2,'Employee User','employee@example.com',NULL,'$2y$12$fecCAuhoIuuOrSJKIlIlke2BVjEoPyrI5qIWkZms1EN9IS9byQXvC','employee','Sales','HR','active',NULL,'2026-05-17 12:48:29','2026-05-19 11:27:07');
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

-- Dump completed on 2026-05-19 15:34:28
