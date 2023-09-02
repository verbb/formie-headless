-- MySQL dump 10.13  Distrib 8.0.33, for Linux (aarch64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.20.04.2

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `ownerId` int DEFAULT NULL,
  `countryCode` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `administrativeArea` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `locality` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dependentLocality` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `postalCode` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sortingCode` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `addressLine1` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `addressLine2` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `organization` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `organizationTaxId` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `fullName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cbvnclaunnxxgiastvonbsjjproidedrwjmo` (`ownerId`),
  CONSTRAINT `fk_cbvnclaunnxxgiastvonbsjjproidedrwjmo` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nutjmjngiujnjhpwfrogbnlpxmkbpegaihgd` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_kothzqrzsiqxtbfycddydrmvncjjqakxjiwy` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_eyygqqjxhofennnnbvvblzcuxxpdviikgnzz` (`dateRead`),
  KEY `fk_ncgktkrdlltldvjekbxmzthhanjvbgqrdfbh` (`pluginId`),
  CONSTRAINT `fk_ncgktkrdlltldvjekbxmzthhanjvbgqrdfbh` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sjddbsyzbhnnrmpqrwbllhwnbeuutayemypa` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cexbelpkwuafxsrgaxswbdcbhjkkgppvgnbj` (`volumeId`),
  KEY `idx_qhjxxxhxgvfvuddlwvyakewikhutszdhkapx` (`volumeId`),
  KEY `fk_vgodcratdvfflwvatpuzolgvjswnbddydymn` (`sessionId`),
  CONSTRAINT `fk_hcuwtklflydgtyfdfhwjeaheotgdkaxfvsas` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vgodcratdvfflwvatpuzolgvjswnbddydymn` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexdata`
--

LOCK TABLES `assetindexdata` WRITE;
/*!40000 ALTER TABLE `assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text COLLATE utf8mb3_unicode_ci,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `kind` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'unknown',
  `alt` text COLLATE utf8mb3_unicode_ci,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_xnwzggtkoioukautxmodlaefocrcylzbjmaa` (`filename`,`folderId`),
  KEY `idx_saosffeghvjzagitduelajygcirieieszdrz` (`folderId`),
  KEY `idx_ifglsltythihbnuessrtmpziwnqivsafzoeu` (`volumeId`),
  KEY `fk_kselcddgatlbqovwcukappcuvcicsortwxew` (`uploaderId`),
  CONSTRAINT `fk_atwwmbspyqcrpgbpwkjbpzwshpiuhnzihksj` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_blcnesqyuckowzceruhlbnnttyaoqpqzeudw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_igvkzkpddciuzvwjqeideluqldvxumshkaap` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kselcddgatlbqovwcukappcuvcicsortwxew` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_dwnazogpanlalmntookksubheehzzxxqaqph` (`groupId`),
  KEY `fk_xipqybingciavhpohhadvcclxrruqqsoxyrj` (`parentId`),
  CONSTRAINT `fk_lojcgnjqurjdqacfahnedkfivbpodsvsrsya` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oajcchmggsmobhjpwuygioqlfdznfpthagkd` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xipqybingciavhpohhadvcclxrruqqsoxyrj` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (4,1,NULL,NULL,'2021-08-07 00:11:05','2021-08-07 00:11:05'),(5,1,NULL,NULL,'2021-08-07 00:11:08','2021-08-07 00:11:08'),(6,1,NULL,NULL,'2021-08-07 00:11:12','2021-08-07 00:11:12'),(7,1,NULL,NULL,'2021-08-07 00:11:16','2021-08-07 00:11:16');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ondbkltynyogxroqheprsaugrlyqbyamhtoh` (`name`),
  KEY `idx_vqplkidtxghnhtegbeqcliykqukopxklhicg` (`handle`),
  KEY `idx_qwutpsrcjeyzdkbfawubizsoakajzxnjcqrn` (`structureId`),
  KEY `idx_lgzrdmosgmcmodwykytnmazolmonafujvbgr` (`fieldLayoutId`),
  KEY `idx_ihnsdvcmvnsquxsiwwjraxptnnyvylxmpmyz` (`dateDeleted`),
  CONSTRAINT `fk_cvxtkcnxhjseazzvydgflpeowaielhjzdplb` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ytaigleyxvdmvsfvedvsusglrjbylrbpytyv` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
INSERT INTO `categorygroups` VALUES (1,1,3,'Demo','demo','end','2021-08-07 00:06:08','2021-08-07 00:06:08',NULL,'12530c06-549d-4664-97d3-2a96906bde12');
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `template` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pfchayahwqbbzlhvjhbmebcqzsapjtmgyzkb` (`groupId`,`siteId`),
  KEY `idx_qwsrvqjxqxjyllvkbynqoxfertxsfqsqixcn` (`siteId`),
  CONSTRAINT `fk_hmaidcypmfrpongpmobehbjyudbuzngdrxlk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wodayztkwbgugkiuqociohxieujyrdyfqixo` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
INSERT INTO `categorygroups_sites` VALUES (1,1,1,1,'demo/{slug}',NULL,'2021-08-07 00:06:08','2021-08-07 00:06:08','4d111ed7-2903-4575-92ab-6d0acff893a8');
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_xuqiyjtithypxuuktunvpwegkaygjzrqvstk` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_kqtbjefkppbufrvsgvbskrulltrsdyzukkvu` (`siteId`),
  KEY `fk_kdwfvzfglhqgxnfidhxafcaozmenkkgbfgpl` (`userId`),
  CONSTRAINT `fk_fwsaweolgudzxmuzylqmzanlbrpnscbdtkwq` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kdwfvzfglhqgxnfidhxafcaozmenkkgbfgpl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_kqtbjefkppbufrvsgvbskrulltrsdyzukkvu` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
INSERT INTO `changedattributes` VALUES (1,1,'firstName','2021-08-07 11:32:50',0,1),(1,1,'lastName','2021-08-07 11:32:50',0,1),(3,1,'slug','2021-08-07 00:11:20',0,1),(3,1,'title','2021-08-07 00:11:20',0,1),(3,1,'uri','2021-08-07 00:11:20',0,1),(9,1,'slug','2021-08-07 00:11:27',0,1),(9,1,'title','2021-08-07 00:11:27',0,1),(9,1,'uri','2021-08-07 00:11:27',0,1),(11,1,'slug','2021-08-07 00:11:33',0,1),(11,1,'title','2021-08-07 00:11:33',0,1),(11,1,'uri','2021-08-07 00:11:33',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_ciefwlmiwneuzoqmdcqmkreuhwgwtpryhjzs` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_jmedryrxajhvhxejpqcozhfrdrvdwcpijoth` (`siteId`),
  KEY `fk_wnsyztvcmtmdrdquhzpxbgqwwyhegulrymez` (`fieldId`),
  KEY `fk_licsxxjjaowcgwelgsriwrhwsymheraufbbr` (`userId`),
  CONSTRAINT `fk_gcbtfjefjorvlpwxdblpeohcsjstxeqthtpm` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_jmedryrxajhvhxejpqcozhfrdrvdwcpijoth` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_licsxxjjaowcgwelgsriwrhwsymheraufbbr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_wnsyztvcmtmdrdquhzpxbgqwwyhegulrymez` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `field_plainText_kukrbgdv` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rnydhkxnoawjsejdcejskjzswcrpwsymidxo` (`elementId`,`siteId`),
  KEY `idx_wyxzveoscgbciphjbmahqmdcsqgnqjejddfu` (`siteId`),
  KEY `idx_ayomghrrusjmmouuxebeewsdafcfiozhdntc` (`title`),
  CONSTRAINT `fk_pcbutytytnogbmipiuyqrnjyojnzqqsbgigz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wzigkosnshqufuvqateunxtjmglzauucxjug` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,1,1,NULL,'2021-08-07 00:01:41','2021-08-07 11:32:50','afef80ee-469c-46e5-900b-accabda42bbf',NULL),(2,2,1,NULL,'2021-08-07 00:06:03','2021-08-07 00:06:23','4f09d160-8289-4e57-a598-630d308c3c7c',NULL),(3,3,1,'Entry 1','2021-08-07 00:10:57','2021-08-07 00:11:23','59b495eb-c7a5-4310-aa8a-dbacd70cf921',NULL),(4,4,1,'Category 1','2021-08-07 00:11:05','2021-08-07 00:11:05','9c3bad5f-3366-4513-a8db-314386ec5775',NULL),(5,5,1,'Category 2','2021-08-07 00:11:08','2021-08-07 00:11:08','2fac8761-519b-4322-9032-67011137ae3b',NULL),(6,6,1,'Category 3','2021-08-07 00:11:12','2021-08-07 00:11:12','5c6507dd-8638-4128-bd52-c8baddb5bb8f',NULL),(7,7,1,'Category 4','2021-08-07 00:11:16','2021-08-07 00:11:16','11f871ca-8b39-4823-9420-acf99e328d28',NULL),(8,8,1,'Entry 1','2021-08-07 00:11:23','2021-08-07 00:11:23','2699c062-40ea-4779-9d5d-c224ee0c0a4e',NULL),(9,9,1,'Entry 2','2021-08-07 00:11:23','2021-08-07 00:11:29','2b5616c4-0b1e-4b1c-ad01-72ca14de7d01',NULL),(10,10,1,'Entry 2','2021-08-07 00:11:29','2021-08-07 00:11:29','062f26e8-3d19-43fe-aeab-d452111854aa',NULL),(11,11,1,'Entry 3','2021-08-07 00:11:30','2021-08-07 00:11:35','bc2f4f4f-43ff-48b9-8e70-e7bc3947a079',NULL),(12,12,1,'Entry 3','2021-08-07 00:11:35','2021-08-07 00:11:35','5f0992c3-6287-450f-b2df-b2839fea91ee',NULL),(13,13,1,NULL,'2021-08-07 00:11:36','2021-08-07 00:11:36','1b054429-f209-4ea2-8612-e80d7d27eb96',NULL),(15,15,1,'Tag 1','2021-08-07 11:34:38','2021-08-07 11:34:38','2c90e814-b189-4b14-bb23-77372f322f63',NULL),(16,16,1,'Tag 2','2021-08-07 11:34:42','2021-08-07 11:34:42','bf0af949-ccf7-40bc-af04-2eb0eb645547',NULL),(17,17,1,'Tag 3','2021-08-07 11:34:44','2021-08-07 11:34:44','5d5f44f5-d615-47d1-b18a-7a6aee37af1f',NULL),(19,19,1,'Contact Form','2023-09-02 11:34:09','2023-09-02 11:34:09','c2eba1b2-6beb-40f5-8bec-5ccd45f3232b',NULL),(20,20,1,'Fields Demo','2023-09-02 11:34:24','2023-09-02 11:34:24','a850022a-2851-478a-ba16-f5c9cfe97b8c',NULL);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_oehcpoajhzosngmydyppprvnfknqnsecmgly` (`userId`),
  CONSTRAINT `fk_oehcpoajhzosngmydyppprvnfknqnsecmgly` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `fingerprint` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `traces` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gbuvguoatnotbxuiwpvxzyhujegogaltlwyu` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_uamurmokmubuxdpjeaomhkqlvowvhssspuqc` (`creatorId`,`provisional`),
  KEY `idx_kbldpzqykqxlwwgnkdbqswbylyrkngchjplu` (`saved`),
  KEY `fk_vketqawpzffkyuzroqwvxkkgwknrmxvsdgcl` (`canonicalId`),
  CONSTRAINT `fk_sgmtxrfqzydkxigmnxceaxvdhydscshwfqfw` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vketqawpzffkyuzroqwvxkkgwknrmxvsdgcl` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
INSERT INTO `drafts` VALUES (4,NULL,1,0,'First draft',NULL,0,NULL,0);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_jitufjtaaqgbhkgjeqgdqlccvfnlzdzoawid` (`elementId`,`timestamp`,`userId`),
  KEY `fk_ykbwvcbpxwbsupohhcdtewlratjthmbstyzl` (`userId`),
  KEY `fk_gdxacwkwmuqrqcvtcfbcpyggbbrpbpqfhtgf` (`siteId`),
  KEY `fk_mysogmskoqkybabhfjuksdxdyiginkrfqlbe` (`draftId`),
  CONSTRAINT `fk_dajdbcrrostjozesqbmompttcqjdstlxwqgx` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gdxacwkwmuqrqcvtcfbcpyggbbrpbpqfhtgf` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mysogmskoqkybabhfjuksdxdyiginkrfqlbe` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ykbwvcbpxwbsupohhcdtewlratjthmbstyzl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_poilaaaffgcbyrknzwnnwdnfdnqnrfxkdcfa` (`dateDeleted`),
  KEY `idx_rqnpzplmcsaiirktgswmrwbfdcuqthqbgtfz` (`fieldLayoutId`),
  KEY `idx_cdcudrbxkdxzpactxvbizegqgmahhkckesgl` (`type`),
  KEY `idx_sfsmgfpymmtypiqfrvxkbjjrdszkzbourhyv` (`enabled`),
  KEY `idx_mlgroayylvbtuhumqgcnurtaidkrgsqxuqsg` (`archived`,`dateCreated`),
  KEY `fk_kowkkdkjzfrzomrxjvvtmcaztplpocuugvxo` (`canonicalId`),
  KEY `fk_siigegthidtppinkzzxtvcaifdahpgrrwhzs` (`draftId`),
  KEY `fk_btwvctiyixkbaviiaospcwhgmzcxcqmfuirg` (`revisionId`),
  KEY `idx_ccesymtrlevowgbsinqyjtzptgrxdkpmcyrq` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_lasugpbjqkumubvcukqqzdqruwiwsycgupno` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  CONSTRAINT `fk_btwvctiyixkbaviiaospcwhgmzcxcqmfuirg` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hbioprmyyyporsvemvaevhzaubogsauzjyzw` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_kowkkdkjzfrzomrxjvvtmcaztplpocuugvxo` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_siigegthidtppinkzzxtvcaifdahpgrrwhzs` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2021-08-07 00:01:41','2021-08-07 11:32:50',NULL,NULL,'5e64d208-2a29-4654-a886-acb715838cf3'),(2,NULL,NULL,NULL,5,'craft\\elements\\GlobalSet',1,0,'2021-08-07 00:06:03','2021-08-07 00:06:23',NULL,NULL,'6b96e0b0-0c3f-4de5-8631-0de30b34872c'),(3,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2021-08-07 00:10:57','2021-08-07 00:11:23',NULL,NULL,'ed9b2386-94c7-4317-98d3-7031a2d6e55a'),(4,NULL,NULL,NULL,3,'craft\\elements\\Category',1,0,'2021-08-07 00:11:05','2021-08-07 00:11:05',NULL,NULL,'e4286357-1d43-4f84-80b5-bb862c1dbfcb'),(5,NULL,NULL,NULL,3,'craft\\elements\\Category',1,0,'2021-08-07 00:11:08','2021-08-07 00:11:08',NULL,NULL,'e3a08567-d607-48c7-8735-6db2814b1ab7'),(6,NULL,NULL,NULL,3,'craft\\elements\\Category',1,0,'2021-08-07 00:11:12','2021-08-07 00:11:12',NULL,NULL,'b3be05a4-43b1-459f-919d-b0b4c5d30d2b'),(7,NULL,NULL,NULL,3,'craft\\elements\\Category',1,0,'2021-08-07 00:11:16','2021-08-07 00:11:16',NULL,NULL,'72f7037b-8788-4f84-bf4a-8d818698b33f'),(8,3,NULL,1,1,'craft\\elements\\Entry',1,0,'2021-08-07 00:11:23','2021-08-07 00:11:23',NULL,NULL,'f725cfb0-f624-41a4-b5b7-344b54af82dc'),(9,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2021-08-07 00:11:23','2021-08-07 00:11:29',NULL,NULL,'946bbf7a-30ac-46a8-9bed-f033cc71096e'),(10,9,NULL,2,1,'craft\\elements\\Entry',1,0,'2021-08-07 00:11:29','2021-08-07 00:11:29',NULL,NULL,'61d4ba4b-28f1-4c2a-a793-44031c23ed08'),(11,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2021-08-07 00:11:30','2021-08-07 00:11:35',NULL,NULL,'5f6975e3-8278-433c-9769-62e8e9978d11'),(12,11,NULL,3,1,'craft\\elements\\Entry',1,0,'2021-08-07 00:11:35','2021-08-07 00:11:35',NULL,NULL,'c575d9e3-3ec9-47af-bb08-16c90f68cafa'),(13,NULL,4,NULL,1,'craft\\elements\\Entry',1,0,'2021-08-07 00:11:36','2021-08-07 00:11:36',NULL,NULL,'d457736a-8802-445f-b7c2-b99c61471133'),(15,NULL,NULL,NULL,4,'craft\\elements\\Tag',1,0,'2021-08-07 11:34:38','2021-08-07 11:34:38',NULL,NULL,'8269e58e-792a-45bd-b80f-c04a54948cb9'),(16,NULL,NULL,NULL,4,'craft\\elements\\Tag',1,0,'2021-08-07 11:34:42','2021-08-07 11:34:42',NULL,NULL,'a9ed41f3-137a-4de0-9649-4e53046230fe'),(17,NULL,NULL,NULL,4,'craft\\elements\\Tag',1,0,'2021-08-07 11:34:44','2021-08-07 11:34:44',NULL,NULL,'d80cfb3e-c270-4466-944b-c19b44f0626f'),(19,NULL,NULL,NULL,10,'verbb\\formie\\elements\\Form',1,0,'2023-09-02 11:34:09','2023-09-02 11:34:09',NULL,NULL,'7ddcdd30-9076-4648-8741-6feacee33815'),(20,NULL,NULL,NULL,13,'verbb\\formie\\elements\\Form',1,0,'2023-09-02 11:34:24','2023-09-02 11:34:24',NULL,NULL,'a804f03c-9345-4aba-9c7e-e49a54f390c1');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `uri` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qxnujusdiuphokqxmxugarthamziqpggdrsi` (`elementId`,`siteId`),
  KEY `idx_osjrzormsplhqhcxgfekzlvigwkpqqysqbjr` (`siteId`),
  KEY `idx_uunwkjxyvprpbyrfavydfrmdymytqtqznoxt` (`slug`,`siteId`),
  KEY `idx_vppobvwbdhyrliutvsicninmztvemtbhsdif` (`enabled`),
  KEY `idx_uccttgnelvunuetujcmkgrzvgmuzbfuwxgzq` (`uri`,`siteId`),
  CONSTRAINT `fk_ifgwtuzikdnnzotzrhpsngbesrncqpercznw` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_jzuonxrcyodohdfeskfjllkgophlwfblkwdb` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2021-08-07 00:01:41','2021-08-07 00:01:41','88c7a1a3-3071-4588-943b-3d638760dea1'),(2,2,1,NULL,NULL,1,'2021-08-07 00:06:03','2021-08-07 00:06:03','7a1ce879-ea3f-4749-adc4-9c4bdb5a42cb'),(3,3,1,'entry-1','demo/entry-1',1,'2021-08-07 00:10:57','2021-08-07 00:11:20','799c296c-4da3-4fb9-aea8-2e62ae54c855'),(4,4,1,'category-1','demo/category-1',1,'2021-08-07 00:11:05','2021-08-07 00:11:06','dab6e4c1-a602-4a29-9d15-9bea56ca2905'),(5,5,1,'category-2','demo/category-2',1,'2021-08-07 00:11:08','2021-08-07 00:11:10','61f6fb68-4e91-4c6e-a433-007aebf315cc'),(6,6,1,'category-3','demo/category-3',1,'2021-08-07 00:11:12','2021-08-07 00:11:13','cc5d3829-c9b6-427d-a01f-06c294eb3cac'),(7,7,1,'category-4','demo/category-4',1,'2021-08-07 00:11:16','2021-08-07 00:11:18','2cb64c81-af2a-4bfb-8ad8-a539c35854e4'),(8,8,1,'entry-1','demo/entry-1',1,'2021-08-07 00:11:23','2021-08-07 00:11:23','57aeb271-108c-4267-a434-bfebffbccbb1'),(9,9,1,'entry-2','demo/entry-2',1,'2021-08-07 00:11:23','2021-08-07 00:11:27','f8adaada-b936-4292-8ccc-8370c737d024'),(10,10,1,'entry-2','demo/entry-2',1,'2021-08-07 00:11:29','2021-08-07 00:11:29','ab9b21ff-c573-4fbc-b77f-7219bf4135eb'),(11,11,1,'entry-3','demo/entry-3',1,'2021-08-07 00:11:30','2021-08-07 00:11:33','83caf4f9-617b-4df5-86b1-53536e0db5f0'),(12,12,1,'entry-3','demo/entry-3',1,'2021-08-07 00:11:35','2021-08-07 00:11:35','b0e7c2e8-66cf-4e72-a46f-ffba80f8b141'),(13,13,1,'__temp_ubsxpbvhefiiitalkeptgivacbnamlzkqzdh','demo/__temp_ubsxpbvhefiiitalkeptgivacbnamlzkqzdh',1,'2021-08-07 00:11:36','2021-08-07 00:11:36','e75dbd29-5ba1-48f4-83ce-cbfa1ba8564c'),(15,15,1,'tag-1',NULL,1,'2021-08-07 11:34:38','2021-08-07 11:34:38','59c4c590-63fa-4e95-9938-3f23ac237e2f'),(16,16,1,'tag-2',NULL,1,'2021-08-07 11:34:42','2021-08-07 11:34:42','a963e495-8eb2-4185-ad46-1a542e9c4eaf'),(17,17,1,'tag-3',NULL,1,'2021-08-07 11:34:44','2021-08-07 11:34:44','a7c8b47e-8026-487c-b8fa-babe1de7b068'),(19,19,1,NULL,NULL,1,'2023-09-02 11:34:09','2023-09-02 11:34:09','7b224618-8b41-446a-9442-2d328f9f1e87'),(20,20,1,NULL,NULL,1,'2023-09-02 11:34:24','2023-09-02 11:34:24','4bfec335-c7b1-45bb-aeff-f5691af45236');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `authorId` int DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_eoecxnpkqbkklbtkmrwprnnteywkqtouezxi` (`postDate`),
  KEY `idx_mlodtlhvgvndswstulrnstkovydrecwbaxgp` (`expiryDate`),
  KEY `idx_odtlfijsmculstqolmmtidlgglwzuqvmurov` (`authorId`),
  KEY `idx_hkmrkbddqwpzbdneuqvhbkngjlmgikfezggf` (`sectionId`),
  KEY `idx_cjxcjcqpyurknvscgktdlmgpguefjqjtajzq` (`typeId`),
  KEY `fk_fteudileocxuzxbvzzkbnjaqycfisxdgpyks` (`parentId`),
  CONSTRAINT `fk_fqlwdatcpfjrnnmjodestxnwterzdcvmqgym` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_fteudileocxuzxbvzzkbnjaqycfisxdgpyks` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_krqdalsyqxtjzqarunvusrjjtcjzmyhcewvy` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qqpldusabugwjyewdilhyhfaiisbqjwmczzx` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uchuoxstknygonmasyiagvkurgacftueywms` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES (3,1,NULL,1,1,'2021-08-07 00:10:00',NULL,NULL,'2021-08-07 00:10:57','2021-08-07 00:10:57'),(8,1,NULL,1,1,'2021-08-07 00:10:00',NULL,NULL,'2021-08-07 00:11:23','2021-08-07 00:11:23'),(9,1,NULL,1,1,'2021-08-07 00:11:00',NULL,NULL,'2021-08-07 00:11:23','2021-08-07 00:11:23'),(10,1,NULL,1,1,'2021-08-07 00:11:00',NULL,NULL,'2021-08-07 00:11:29','2021-08-07 00:11:29'),(11,1,NULL,1,1,'2021-08-07 00:11:00',NULL,NULL,'2021-08-07 00:11:30','2021-08-07 00:11:30'),(12,1,NULL,1,1,'2021-08-07 00:11:00',NULL,NULL,'2021-08-07 00:11:35','2021-08-07 00:11:35'),(13,1,NULL,1,1,'2021-08-07 00:11:00',NULL,NULL,'2021-08-07 00:11:36','2021-08-07 00:11:36');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `titleFormat` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `slugTranslationMethod` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text COLLATE utf8mb3_unicode_ci,
  `showStatusField` tinyint(1) DEFAULT '1',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nnevdkopbvggsturgwzldqngjjpqoyfhbyqt` (`name`,`sectionId`),
  KEY `idx_oueohympcqknchbijtwbiipauysroesmmkmx` (`handle`,`sectionId`),
  KEY `idx_ndlmggyyzusysmvevqoachmsylgggtcsceiv` (`sectionId`),
  KEY `idx_wcakwamyxdrhkskprroesiukpmklyacvhdlh` (`fieldLayoutId`),
  KEY `idx_bsxkxkaglerqlfrizmlxmqxialfebqzylykj` (`dateDeleted`),
  CONSTRAINT `fk_fpfpmwedzzupgeaallcsxntiegyzjdjtfzzz` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tklthwntqwiumlvlfzlsljqyjcwoyaumzbil` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
INSERT INTO `entrytypes` VALUES (1,1,1,'Default','default',1,'site',NULL,NULL,'site',NULL,1,1,'2021-08-07 00:05:46','2021-08-07 00:05:46',NULL,'ee2e044d-867d-4cdf-b1b3-4e0d51e7a818');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldgroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bfklndswcwoydzgcialpojkilhiijvbrrmuz` (`name`),
  KEY `idx_iayfljabcxbkhgifghzlaaekwpeioxtcookf` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
INSERT INTO `fieldgroups` VALUES (1,'Common','2021-08-07 00:01:41','2021-08-07 00:01:41',NULL,'d644334e-fac0-46a1-8543-211e5168b02c');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `tabId` int NOT NULL,
  `fieldId` int NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cyvwftgvnhwatzrmdnbczsaaymgxznrphsdc` (`layoutId`,`fieldId`),
  KEY `idx_wpzmdehwqbsamuwecfwxghmdogxehfnadtep` (`sortOrder`),
  KEY `idx_nyhyjqjhnshetfmqqymxqdurwvtbjzvgiuqe` (`tabId`),
  KEY `idx_chsykqjmwpdpjlblvzaklxqubsdivqlhjyfd` (`fieldId`),
  CONSTRAINT `fk_qqrpzdetvqmnchkegmccdiekwsvhgcpleotp` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_syachfibqyrpsmfiqxgitxxznrclrugogksf` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yjxucykodtmkrbovphcfufggokyjfsvqkakw` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1368 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
INSERT INTO `fieldlayoutfields` VALUES (1,5,5,1,0,0,'2021-08-07 00:06:23','2021-08-07 00:06:23','ef61d218-1e39-467e-9456-d795185ada64'),(2,3,6,1,0,1,'2021-08-07 00:11:59','2021-08-07 00:11:59','6dac5329-f68b-4120-b5d1-b7bda2cc4c04'),(5,4,9,1,0,1,'2021-08-07 00:12:18','2021-08-07 00:12:18','8b6012cf-9bd8-4070-a16f-da2a405167ad'),(1047,9,75,37,0,0,'2021-08-08 04:58:49','2021-08-08 04:58:49','ead04c03-bf72-47d5-8650-f52e8b4e5e1f'),(1048,9,75,38,1,1,'2021-08-08 04:58:49','2021-08-08 04:58:49','0c8df75f-75b2-4ce9-81b6-08c599cf0c4d'),(1049,9,75,39,1,2,'2021-08-08 04:58:49','2021-08-08 04:58:49','e215fc78-8f57-4a8e-9483-65fa68b79ec6'),(1295,7,94,33,0,0,'2021-08-08 11:28:27','2021-08-08 11:28:27','ec74ef6b-a52b-42c1-8d82-95512c84fa31'),(1296,8,95,34,0,0,'2021-08-08 11:28:27','2021-08-08 11:28:27','76134cef-2186-43ee-a315-0bc8085df82b'),(1297,6,10,2,0,0,'2021-08-08 11:28:27','2021-08-08 11:28:27','d925dd02-e681-4a40-ac41-afe2a0350fb0'),(1298,6,10,3,0,1,'2021-08-08 11:28:27','2021-08-08 11:28:27','41a308df-40fb-498b-9ec6-b9e24741bfea'),(1299,6,10,4,0,2,'2021-08-08 11:28:27','2021-08-08 11:28:27','57b8b788-7f03-41cf-967b-103289ff411c'),(1300,6,10,5,0,3,'2021-08-08 11:28:27','2021-08-08 11:28:27','5e66566b-82d0-40e3-a02c-7e7d07475321'),(1301,6,10,6,0,4,'2021-08-08 11:28:27','2021-08-08 11:28:27','903f7c3e-bab6-4b18-b92c-7734e991db43'),(1302,6,10,7,0,5,'2021-08-08 11:28:27','2021-08-08 11:28:27','258032a9-1119-4b12-b5fe-1e630f1c3542'),(1303,6,10,8,0,6,'2021-08-08 11:28:27','2021-08-08 11:28:27','54b8374d-161f-423c-b2cf-af94b3efb9d9'),(1304,6,10,9,0,7,'2021-08-08 11:28:27','2021-08-08 11:28:27','c64a089e-a236-4b05-83e5-87651bad3adc'),(1305,6,10,10,0,8,'2021-08-08 11:28:27','2021-08-08 11:28:27','7264e4c4-e278-43e3-9580-889658e2c534'),(1306,6,10,11,0,9,'2021-08-08 11:28:27','2021-08-08 11:28:27','77dc3b86-8443-4a25-beb6-43add736ddb1'),(1307,6,10,12,0,10,'2021-08-08 11:28:27','2021-08-08 11:28:27','d52d3c48-daa0-48e4-848f-d8d180dc5b78'),(1308,6,10,13,0,11,'2021-08-08 11:28:27','2021-08-08 11:28:27','de9a9915-ac3d-4796-a8f4-8ce91517d0ff'),(1309,6,10,14,0,12,'2021-08-08 11:28:27','2021-08-08 11:28:27','a8492224-d813-44fd-99d8-705c79d4ee6c'),(1310,6,11,15,0,0,'2021-08-08 11:28:27','2021-08-08 11:28:27','bcbe7398-2b13-4e70-a128-b6f86c5d1ae7'),(1311,6,11,16,0,1,'2021-08-08 11:28:27','2021-08-08 11:28:27','3e19f90f-616c-4e94-b3b1-fa94984e2051'),(1312,6,11,17,0,2,'2021-08-08 11:28:27','2021-08-08 11:28:27','28deb4b9-762d-470e-a0ae-0d7c3013aa0e'),(1313,6,11,18,0,3,'2021-08-08 11:28:27','2021-08-08 11:28:27','d5ec39d7-efe4-4d68-aa83-9a4c137ba046'),(1314,6,11,30,0,4,'2021-08-08 11:28:27','2021-08-08 11:28:27','baf53c5b-fab3-433d-962e-f57ad5f8e862'),(1315,6,11,31,0,5,'2021-08-08 11:28:27','2021-08-08 11:28:27','f7edf222-f59d-4939-8617-e9f685b2b6e4'),(1316,6,11,32,0,6,'2021-08-08 11:28:27','2021-08-08 11:28:27','7e52a972-e8c6-476a-aee2-782d8cdc7778'),(1317,6,11,19,0,7,'2021-08-08 11:28:27','2021-08-08 11:28:27','8710858f-adfd-4613-90a5-5bb62d85c26d'),(1318,6,11,20,0,8,'2021-08-08 11:28:27','2021-08-08 11:28:27','df90d822-a94c-439c-9cc0-e380e9046a3f'),(1319,6,11,21,0,9,'2021-08-08 11:28:27','2021-08-08 11:28:27','b2aa74ab-6dc5-4ef0-94df-2c12e8fb9418'),(1320,6,11,22,0,10,'2021-08-08 11:28:27','2021-08-08 11:28:27','a60a33a2-a7e9-4bb7-a21b-559ae9880f10'),(1321,6,11,23,0,11,'2021-08-08 11:28:27','2021-08-08 11:28:27','4b1b256c-2a6c-4e6c-84b9-b57e39df80e3'),(1322,6,11,24,0,12,'2021-08-08 11:28:27','2021-08-08 11:28:27','fbd995f5-c89d-4d7f-a0ed-093cf9a0e11f'),(1323,6,11,25,0,13,'2021-08-08 11:28:27','2021-08-08 11:28:27','871171e1-dfa4-49a4-b47b-35b3e53d8d49'),(1324,6,12,26,0,0,'2021-08-08 11:28:27','2021-08-08 11:28:27','8bf24808-6dd7-48e7-8303-00d62c640725'),(1325,6,12,35,0,1,'2021-08-08 11:28:27','2021-08-08 11:28:27','e443b56e-1493-4e45-af3a-513a0e740407'),(1326,6,12,36,0,2,'2021-08-08 11:28:27','2021-08-08 11:28:27','b757b9ea-578b-4f1f-b934-67658b54abd3'),(1327,6,12,27,0,3,'2021-08-08 11:28:27','2021-08-08 11:28:27','789c4414-01b4-4997-be10-16267664666b'),(1328,6,12,28,0,4,'2021-08-08 11:28:27','2021-08-08 11:28:27','ae7fd8b3-81e2-4423-a91d-38e91b41532d'),(1329,6,12,29,0,5,'2021-08-08 11:28:27','2021-08-08 11:28:27','6a5fc5d4-3e5b-4166-b14d-81644b77c86e'),(1330,10,98,40,0,0,'2023-09-02 11:34:09','2023-09-02 11:34:09','5b423075-ddb0-4252-a48e-f07b781b7960'),(1331,10,98,41,1,1,'2023-09-02 11:34:09','2023-09-02 11:34:09','d535ff4b-a3d7-4c37-9494-bf4fb9215f5c'),(1332,10,98,42,1,2,'2023-09-02 11:34:09','2023-09-02 11:34:09','01070f50-b0d2-4b44-821e-038ad6a20586'),(1333,11,99,65,0,0,'2023-09-02 11:34:24','2023-09-02 11:34:24','346237c0-a34c-4166-909c-f3c3f0c12e1d'),(1334,12,100,68,0,0,'2023-09-02 11:34:24','2023-09-02 11:34:24','461a1155-b044-43eb-a7cf-95e06523cd82'),(1335,13,101,43,0,0,'2023-09-02 11:34:24','2023-09-02 11:34:24','84d584ba-82df-4c4e-b6f2-ec4726ea4893'),(1336,13,101,44,0,1,'2023-09-02 11:34:24','2023-09-02 11:34:24','1f2d91ca-b92d-40cd-a72b-32140f098153'),(1337,13,101,45,0,2,'2023-09-02 11:34:24','2023-09-02 11:34:24','3e802e1c-8201-4ad1-ad2c-28e9c9a14768'),(1338,13,101,46,0,3,'2023-09-02 11:34:24','2023-09-02 11:34:24','4bdfd136-037b-46b9-90ce-1e8d8c347616'),(1339,13,101,47,0,4,'2023-09-02 11:34:24','2023-09-02 11:34:24','e4c6dfb1-e280-4367-bbbb-80966d138d54'),(1340,13,101,48,0,5,'2023-09-02 11:34:24','2023-09-02 11:34:24','474be66a-5fe2-400b-9a1f-2256933c7f21'),(1341,13,101,49,0,6,'2023-09-02 11:34:24','2023-09-02 11:34:24','6eefe836-59de-451a-87a1-56fbdafd18af'),(1342,13,101,50,0,7,'2023-09-02 11:34:24','2023-09-02 11:34:24','185ac006-4434-45f1-b26f-2bbf6bdbbdfc'),(1343,13,101,51,0,8,'2023-09-02 11:34:24','2023-09-02 11:34:24','6edf0e09-a506-415c-ac3a-5e51b40914da'),(1344,13,101,52,0,9,'2023-09-02 11:34:24','2023-09-02 11:34:24','552cd351-04c8-4448-b5e4-dea765e55584'),(1345,13,101,53,0,10,'2023-09-02 11:34:24','2023-09-02 11:34:24','72d7fc03-bcf7-40a9-9a46-cdc3b75a266f'),(1346,13,101,54,0,11,'2023-09-02 11:34:24','2023-09-02 11:34:24','6b6ac1da-4b5b-47f9-8396-0fcdd671e696'),(1347,13,101,55,0,12,'2023-09-02 11:34:24','2023-09-02 11:34:24','69d51f86-989b-4f64-b913-7cdb3deea741'),(1348,13,102,56,0,0,'2023-09-02 11:34:24','2023-09-02 11:34:24','e0b887f8-7264-43b4-bd7f-2d95e61a5817'),(1349,13,102,57,0,1,'2023-09-02 11:34:24','2023-09-02 11:34:24','90c68a90-4026-44c1-a814-46ed11bc57ee'),(1350,13,102,58,0,2,'2023-09-02 11:34:24','2023-09-02 11:34:24','ad45f76a-4fb7-4bfc-843c-979943e0e5ab'),(1351,13,102,59,0,3,'2023-09-02 11:34:24','2023-09-02 11:34:24','24888ed1-741b-4d9f-a778-36adfc8491ae'),(1352,13,102,60,0,4,'2023-09-02 11:34:24','2023-09-02 11:34:24','634ee5a4-2570-405f-a96d-be0bc82c01e2'),(1353,13,102,61,0,5,'2023-09-02 11:34:24','2023-09-02 11:34:24','edc1cb35-da02-45f9-b67d-846a568a6435'),(1354,13,102,62,0,6,'2023-09-02 11:34:24','2023-09-02 11:34:24','0700ae5d-1e04-4834-a6c3-ad689aa8adbf'),(1355,13,102,63,0,7,'2023-09-02 11:34:24','2023-09-02 11:34:24','3c8a2f65-4d1f-4fc1-b8f8-28b2aabea438'),(1356,13,102,64,0,8,'2023-09-02 11:34:24','2023-09-02 11:34:24','133ccbcf-a52a-4d60-a5ed-987b19e074e7'),(1357,13,102,66,0,9,'2023-09-02 11:34:24','2023-09-02 11:34:24','7d62832e-abea-4498-ac5f-bca789dba97f'),(1358,13,102,67,0,10,'2023-09-02 11:34:24','2023-09-02 11:34:24','c10b6c9a-8fcf-4c5b-8738-dd60511d3e25'),(1359,13,102,69,0,11,'2023-09-02 11:34:24','2023-09-02 11:34:24','4a8d7ea9-ea69-49f6-a256-eefac858603d'),(1360,13,102,70,0,12,'2023-09-02 11:34:24','2023-09-02 11:34:24','0868120f-1a2d-405a-9d70-cd99ebc216ae'),(1361,13,102,71,0,13,'2023-09-02 11:34:24','2023-09-02 11:34:24','2f1c3dbb-44e5-4d80-a75a-da3b926a37e3'),(1362,13,103,72,0,0,'2023-09-02 11:34:24','2023-09-02 11:34:24','14bb5cc7-02f0-48f1-805a-b287bb83e388'),(1363,13,103,73,0,1,'2023-09-02 11:34:24','2023-09-02 11:34:24','e1a153c2-dab5-4415-8962-85796503b766'),(1364,13,103,74,0,2,'2023-09-02 11:34:24','2023-09-02 11:34:24','45479565-e5f4-4c28-a70d-649f5af97457'),(1365,13,103,75,0,3,'2023-09-02 11:34:24','2023-09-02 11:34:24','73a7f5bd-3bf9-4092-a726-083e41db2677'),(1366,13,103,76,0,4,'2023-09-02 11:34:24','2023-09-02 11:34:24','983298ba-afc0-4a8e-a3f9-d5ef21502d25'),(1367,13,103,77,0,5,'2023-09-02 11:34:24','2023-09-02 11:34:24','0eca94af-effc-4ae7-bc08-454c7b5a2c37');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eouxgdocvotlxlltycieumakkhflxkdzsmwv` (`dateDeleted`),
  KEY `idx_ffdztcwcablverwoauuirnpbydrxnogympgq` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2021-08-07 00:05:46','2021-08-07 00:05:46',NULL,'6bbdaea4-ec82-409c-92e1-f7dba84ecfc8'),(2,'craft\\elements\\Asset','2021-08-07 00:06:01','2021-08-07 00:06:01',NULL,'a65d044a-042f-4258-994d-611713ff5b4d'),(3,'craft\\elements\\Category','2021-08-07 00:06:08','2021-08-07 00:06:08',NULL,'db9789d3-9833-4279-a1cb-7f14d1d50ab3'),(4,'craft\\elements\\Tag','2021-08-07 00:06:12','2021-08-07 00:06:12',NULL,'4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558'),(5,'craft\\elements\\GlobalSet','2021-08-07 00:06:23','2021-08-07 00:06:23',NULL,'f6ac1175-0650-454a-87ac-3af1d5ed99c4'),(6,'verbb\\formie\\elements\\Form','2021-08-07 00:44:07','2021-08-07 00:44:07',NULL,'ebf9925b-9415-4b8f-89cc-7d6421a8e11c'),(7,'verbb\\formie\\fields\\formfields\\Repeater','2021-08-07 00:58:27','2021-08-07 00:58:27',NULL,'85a0ffb1-c107-4f9d-a2b5-9426edd52ffd'),(8,'verbb\\formie\\fields\\formfields\\Group','2021-08-07 00:58:27','2021-08-07 00:58:27',NULL,'8a67b428-2d70-4851-9646-45a4916d8645'),(9,'verbb\\formie\\elements\\Form','2021-08-07 12:09:46','2021-08-07 12:09:46',NULL,'eb58df8a-bed7-469b-bfa4-6234d6b5d32b'),(10,'verbb\\formie\\elements\\Form','2023-09-02 11:34:09','2023-09-02 11:34:09',NULL,'82d6ead5-8b65-4e26-be8c-8f2edefaa3c0'),(11,'verbb\\formie\\fields\\formfields\\Repeater','2023-09-02 11:34:24','2023-09-02 11:34:24',NULL,'2872b042-f26a-4633-8642-66d55ac982a2'),(12,'verbb\\formie\\fields\\formfields\\Group','2023-09-02 11:34:24','2023-09-02 11:34:24',NULL,'212960e6-d4fa-4d40-9836-a646acb41030'),(13,'verbb\\formie\\elements\\Form','2023-09-02 11:34:24','2023-09-02 11:34:24',NULL,'45596544-7df7-45f3-8c0b-14173830ea9b');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb3_unicode_ci,
  `elements` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xctbczeutgwfxftmtjaivvdnxyyndjspuotn` (`sortOrder`),
  KEY `idx_tvsbpbwqznpykpuyeeogkvlisltidwgvnsxw` (`layoutId`),
  CONSTRAINT `fk_uljcisfbxgnojhkekealcieqeekplwzonxkb` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
INSERT INTO `fieldlayouttabs` VALUES (5,5,'Content',NULL,'[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a\",\"uid\":\"2b8946be-0cd8-46d6-ad46-7e61b1f56646\"}]',1,'2021-08-07 00:06:23','2023-09-02 11:22:20','2eb1fa2c-f225-4b23-b5ae-8351c1fc67c0'),(6,3,'Content',NULL,'[{\"type\":\"craft\\\\fieldlayoutelements\\\\TitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"cd52488a-5c19-45f7-bbed-7a380e08e508\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a\",\"uid\":\"37da079a-958f-4e63-b94f-c11ea05cf320\"}]',1,'2021-08-07 00:11:59','2023-09-02 11:22:20','ca0d1466-0bbe-407a-9611-c0cf907f0306'),(9,4,'Content',NULL,'[{\"type\":\"craft\\\\fieldlayoutelements\\\\TitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"3aab9b9e-361f-4f41-9669-ebf80d318832\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a\",\"uid\":\"c4790275-fa7d-4b4c-add8-a755429a44dc\"}]',1,'2021-08-07 00:12:18','2023-09-02 11:22:20','60f45000-9c35-4004-98f2-bb76f81cd0cd'),(10,6,'Common',NULL,'[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"83573e09-b99e-4356-9922-9a5728852d0d\",\"uid\":\"0392ffdc-d786-42dc-a1e4-6220a57c60e1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"dd42f888-e2df-41a6-a1e6-dff7a4c63e81\",\"uid\":\"6ce858bb-47a9-4e78-a3ef-31eab1992e9a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"24c6f00c-3d84-47c3-9bd4-c000807c35ba\",\"uid\":\"d1893d2c-35a7-4aa4-b58d-8fd0a43e05f3\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"997d4ae2-1677-4e60-abc5-15b5116c5e93\",\"uid\":\"673e0ab1-7724-4b16-93b5-ab11ed2da57d\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"612b3cae-0c2a-4d5d-b537-b63774da566a\",\"uid\":\"a030513e-a1cd-428f-b86a-dd0988f5fc5e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"2b0664a9-75df-47d2-ae4c-25510ce5ba67\",\"uid\":\"5a721db8-e418-448b-aa38-422eaecbd3f2\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"ce89d50c-4cb8-42a7-961e-a7b15fea77c5\",\"uid\":\"f3d88064-8773-4a21-8124-80e4a770d082\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"24985483-e672-465b-9dcb-27756159b55e\",\"uid\":\"acb4b5e0-b1ac-46d7-ac7a-a710a79d3d37\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"5bba6ecb-9f71-4f97-9a48-0fb0164f8b00\",\"uid\":\"a8df8cf1-7ff0-4471-b8e7-571d37c5b324\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"abe72576-ea08-41e6-9bde-41814249039d\",\"uid\":\"bf35c9c5-6e51-44dd-b285-bffa7a706b09\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"c0ad1b7b-e90f-427d-bbe9-0c97be6b5dc5\",\"uid\":\"22775f25-4d83-4c52-a311-1b37a4f6a8fd\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"8f5d7bc4-a867-412f-b317-9e417ab01021\",\"uid\":\"5cc994d3-4edd-4a4c-b8fe-8d00303e7d79\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"6d50ea47-04df-4080-a7f1-b2294c133401\",\"uid\":\"e029dd96-868a-4eff-9f06-3f7228fde677\"}]',0,'2021-08-07 00:44:07','2023-09-02 11:22:20','6d848ba2-736e-4a98-a251-839250d7a928'),(11,6,'Advanced',NULL,'[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"3ea44a66-8efe-4436-a147-4650e0c29e00\",\"uid\":\"e7d23a0e-0e74-4673-b1ce-b53467cb1918\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"6e590ae5-9621-4149-ba0a-268de5e7944c\",\"uid\":\"97257248-a2a0-46c7-b9dc-1722b9add436\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1a41d78b-42cb-487c-9e0e-e26593ed1c06\",\"uid\":\"e991260d-bb3b-484c-b121-4b09f9401058\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"0632ba0b-18a5-49b0-85d7-29446b7b1ab9\",\"uid\":\"1b169ab9-2cf6-4cea-b145-7736657de9e0\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"9e693c98-808f-49b2-8196-cfa84f6f55ac\",\"uid\":\"df507eec-47f8-4ac4-bc17-ce92959ba9ad\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"61b87273-d0fc-4a55-81ec-b9803ecafde9\",\"uid\":\"4af91ced-10d0-4110-a1ec-15f83a536a76\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"627856c4-707f-4684-a4da-dbd9f3ce6c04\",\"uid\":\"4ba5ca35-87c7-453d-8a02-a9acadda653d\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"f54e8ec1-62e8-465f-90ab-8fc68d1f801b\",\"uid\":\"f5b77b34-4137-48ef-966a-945f749b87a9\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"198d0e65-1cf1-43b4-85e4-065ef51eaed4\",\"uid\":\"fe015f44-aa65-445e-aa6f-e15aeb56c58a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"a1072170-4b7e-4872-812f-c6c3a650ebad\",\"uid\":\"eb4ff852-5290-4416-aa18-92a2bcc2bdee\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"d52b78e5-fb1f-4368-932a-9a59bdfc0b78\",\"uid\":\"e3cac556-918d-4126-bbfe-5c15c00636e6\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"28aeed7a-e6b5-4b81-bacb-ceec52fb6c7b\",\"uid\":\"bc77f0fd-07b0-4471-ae7e-3cfa7e2d5fe8\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"2914d115-4c92-4e2f-9a30-d2f935387e37\",\"uid\":\"b968f3a8-449d-4338-8145-b58e8ff1ab02\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7f73e5fa-db51-47c1-ad96-a670532a966a\",\"uid\":\"2756fef4-77e7-437b-882a-bb9e43f49207\"}]',1,'2021-08-07 00:56:32','2023-09-02 11:22:20','298bb57b-6ffb-451e-99e1-eaaee3bf218e'),(12,6,'Elements',NULL,'[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"6ba49b85-5301-4240-9650-921db92e3062\",\"uid\":\"df357bb2-5e92-49ae-9cff-c6a31ed05acd\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"57252155-6064-45cb-a805-d99aa677c2cc\",\"uid\":\"3776937a-ab83-4e83-a55a-865d2df4920e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"fd497ad6-a939-48d7-b736-87cbf1103edd\",\"uid\":\"51b04864-988b-4d89-9403-8cca85b0bb2e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"0a6ac0a5-d58b-4472-bb99-bbdd7c34daf3\",\"uid\":\"85d179a8-4edc-4a20-a602-d243515bfb13\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"e9166ffb-4ca8-4423-947b-0d05614a5f57\",\"uid\":\"d77f3190-a90f-4583-8002-cd2e8b77ffef\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"a878a70e-95af-4f63-b9f9-1ee3c61a56d3\",\"uid\":\"b3f3458b-0376-46cf-ad46-d810f78c46eb\"}]',2,'2021-08-07 00:56:32','2023-09-02 11:22:20','abd9f82a-e462-4521-82fe-c97531bb6478'),(75,9,'Page 1',NULL,'[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"c70240ab-f426-4353-880e-03ee4c8977b5\",\"uid\":\"b69fc0f2-2d5d-406a-879e-cd70e4c71537\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"eb0f4f41-b0ed-4057-8908-3c7e5ff32bfb\",\"uid\":\"5da60234-abf7-4b82-b891-a771d401cc34\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"7d34bb51-fa15-4dde-9f00-4cd28d3a77b5\",\"uid\":\"9a98ee72-a74b-4065-8bf3-ea9bb0aacab6\"}]',0,'2021-08-07 12:09:46','2023-09-02 11:22:20','cc4f782b-656d-4091-b2a2-48e032910dee'),(94,7,'Fields',NULL,'[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"72c1cd95-cc9a-4291-bef0-f9ce458425f3\",\"uid\":\"98f7cb91-dc1e-4161-a08e-c5a9526066f1\"}]',0,'2021-08-08 11:28:27','2023-09-02 11:22:20','68bb73c1-22c2-423b-9412-a72be3624647'),(95,8,'Fields',NULL,'[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"ec12ff3a-dbdc-4bc9-9ad5-f4a0fb5d3678\",\"uid\":\"ebfa8cd9-8114-4bad-87f9-17968c95069e\"}]',0,'2021-08-08 11:28:27','2023-09-02 11:22:20','7bf10000-0649-4776-a072-c15b1c875237'),(96,2,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"autocapitalize\":true,\"autocomplete\":false,\"autocorrect\":true,\"class\":null,\"disabled\":false,\"id\":null,\"instructions\":null,\"label\":null,\"max\":null,\"min\":null,\"name\":null,\"orientation\":null,\"placeholder\":null,\"readonly\":false,\"requirable\":false,\"size\":null,\"step\":null,\"tip\":null,\"title\":null,\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"warning\":null,\"width\":100,\"uid\":\"a852264a-dd9e-4eba-812d-a16e2790442b\"},{\"fieldUid\":\"2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a\",\"instructions\":null,\"label\":null,\"required\":false,\"tip\":null,\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"warning\":null,\"width\":100,\"uid\":\"f3b7fda1-a9ac-402a-b069-c8a9dd6d5033\"}]',1,'2023-09-02 11:22:20','2023-09-02 11:22:20','ad782584-77de-476d-8738-246c29fce5ef'),(97,1,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"autocapitalize\":true,\"autocomplete\":false,\"autocorrect\":true,\"class\":null,\"disabled\":false,\"id\":null,\"instructions\":null,\"label\":null,\"max\":null,\"min\":null,\"name\":null,\"orientation\":null,\"placeholder\":null,\"readonly\":false,\"requirable\":false,\"size\":null,\"step\":null,\"tip\":null,\"title\":null,\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"warning\":null,\"width\":100,\"uid\":\"e33b605b-70e2-434a-b116-5741bf777709\"},{\"fieldUid\":\"2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a\",\"instructions\":null,\"label\":null,\"required\":false,\"tip\":null,\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"warning\":null,\"width\":100,\"uid\":\"172723ab-42fd-49ee-ad57-642289d24824\"}]',1,'2023-09-02 11:22:20','2023-09-02 11:22:20','1f190d05-094d-447c-ae3c-f6bbcaa2d7f7'),(98,10,'Page 1','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"7aefe64f-a906-496c-a752-93a2982c48b7\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"dc22e35a-d1f6-4c8c-9501-102faae591c9\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"51bf2277-dd9e-4f26-88ae-bb8fe24b9225\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"1d0b5d37-1863-488a-9b93-d57cef452965\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"2d11b82d-ec8d-4179-9d9a-4ccbbac7d3f3\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"6935748c-200b-4871-8ff4-e93cfeb39f21\"}]',0,'2023-09-02 11:34:09','2023-09-02 11:34:09','d639cd5b-ef8b-4475-8f6e-df8c62b2065d'),(99,11,'Fields','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"2747bc58-7868-4dc4-9a90-90aba605476f\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"e928183a-aca8-4126-86b2-321a70aa1088\"}]',0,'2023-09-02 11:34:24','2023-09-02 11:34:24','37d7571d-8e7d-4e72-909d-9490debbfd4f'),(100,12,'Fields','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"9bb9df92-8bf3-49ec-8a12-d93a02688160\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"0baa85ca-7f29-4398-8879-e8d3f8d7095d\"}]',0,'2023-09-02 11:34:24','2023-09-02 11:34:24','c2a8f968-68f7-43e7-8896-2516d1d186b1'),(101,13,'Common','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"4b1a05b3-9b90-4246-8b41-2eec8b94fec3\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"eac8a271-de29-4bb6-99cd-2395fa4cba81\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"97749ea3-cd21-4ae2-b0b3-783256d5030a\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"f937ab7f-4bd1-4dec-b10b-1973b2246416\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"b2449b5b-552f-4f74-b996-c66856e6e171\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"7c134309-ea4e-4c52-8979-ef85e2362e22\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"9d408559-28a2-4343-8282-8713e274dd94\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"1c82fa40-bec5-4af8-995b-9feffdf3c96d\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"649dfc63-3354-4e0a-b72d-a93190c716f7\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"bc4ceac3-2430-47d9-96f8-da304b822998\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"3a897278-66b0-450a-9aeb-c78264955d53\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"420f92ed-1419-4aae-a120-f78f586be4fe\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"aed9f0be-a542-493a-9e63-b2f7b64ab456\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"12aea35f-9176-4b6f-9ad4-99b90a0f00fb\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"1f8d43be-e632-40a5-a9e8-e31cae3475c6\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"1b875901-c7af-4836-8315-1ff9b25237f2\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"a6ff11c9-43a9-460e-940e-e79940999ae7\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d1dea267-8a66-4440-beb7-082ae7c32621\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"650793e5-7d7a-4ff1-900a-4d298b459150\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"6235aae5-b1d6-4c67-bc03-36fbc1f9b9d1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"7e43d80e-5376-4d6f-b644-8ebd022ae76a\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"3b85862c-0ab1-4ef2-8ba1-2c621f7adc6f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"0b83b591-2c3d-4d93-8434-a3eb5db06524\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d64b7c1b-45ec-41b9-9d93-6fa03a6881dc\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"efb2a209-1f91-4b8b-a7ba-12bb9b19d67d\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"8ab11e95-2c0b-49dc-bd95-10b8c135b8c3\"}]',0,'2023-09-02 11:34:24','2023-09-02 11:34:24','592d1a9b-a3e9-4e56-96c5-b514e2f365f0'),(102,13,'Advanced','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"2d36202e-ea85-4caa-a7b1-8017b1afa37f\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"dd8a1bff-8ea9-4ed8-bae6-a1af6ccb314f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"9d2c746e-7b0b-441e-98cd-5c3102f7d497\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"93d7e124-2507-492a-8d57-0abc973dc1e1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"3d24f54c-371f-49a8-8252-ec107fd29b31\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"28e43436-f50a-4443-b38d-404df407cd8d\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"bd5c72c0-f2c5-4f0e-b99b-7f6f2a328b19\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"993f232d-0e2a-424a-b41a-d6379e8947d6\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"b2075297-c523-4376-93c8-e3442b8529e9\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"95ecfcb3-ffdd-44a0-a8fa-e80fcd702853\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"88283e55-3934-4b46-84eb-331a51c5e8fb\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"6c4e2411-ad13-4da0-996b-8d3646979814\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"70e2e616-fdc3-46ca-b3ed-384eb39e6d83\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"1cc6faf5-e447-4fd0-a963-690680058020\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"fc9be3a0-d608-49ec-ac8c-e702b9f9ec5e\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"495d161d-4c94-4112-abea-264880a68e9f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"0711c4af-7c80-4f08-8ace-5d8056535f13\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"61f76bdd-3958-45e6-96e0-613339c5ca39\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"aa7e74e2-5357-4e16-ab12-b9554dea4663\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"e6db45bc-8114-4d97-b744-d1eabe143b8a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"af3dddc7-5ed4-4101-bfda-86981a6bd5ba\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"8ac0c615-4474-415c-916a-2c7105b6c28d\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"ad2a7b0a-8576-47e1-b774-b6127d3a56fa\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d22e2dda-04a2-4d15-bd8f-52b2f654af7b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"faac696b-faa9-4175-bcfe-de1677332588\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"411de20c-71ca-4771-a1a5-5969fc20e4de\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"4b1d6240-8ffc-4310-b749-d2078e855fa9\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"e406ea2c-1d13-419a-91e4-435336f6fb59\"}]',1,'2023-09-02 11:34:24','2023-09-02 11:34:24','77b60a6d-fc89-4d60-9483-9b88e3d37a96'),(103,13,'Elements','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"bc4c03c6-f1e5-4e27-8324-f31e5a302add\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"dce861f7-9ca1-4d2d-aef2-793c0f2b3a19\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"661e5218-e1a9-483d-8cf0-4ad21b924a9d\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"7b761e1c-6348-4b7a-8414-06d323066475\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"b6f8126d-388f-4409-a23d-328f659ceca3\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"bc26421e-afbb-4e1d-b8fd-982019e9409c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"1ef6a166-edc3-422b-9931-439a979b430b\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"72a6f458-76c5-4d31-93f8-2693d31f7b9a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"ba7c5cd2-a091-4b91-a989-22ec16b5ec90\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"23b442e2-4a42-49de-b941-3b1c218636cf\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"12d787ad-2b4f-4609-b0d0-cad3de398e8c\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"5c472db1-1707-4189-9b42-ee0c8517aaae\"}]',2,'2023-09-02 11:34:24','2023-09-02 11:34:24','ce6bfd9b-a991-47fa-91a6-7892f86b8337');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `context` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `instructions` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `settings` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_clmovriquzkhubhvufnkayudfakstjuhypee` (`handle`,`context`),
  KEY `idx_wpevggbycmwmogmgbajnpxmpnvpvpbjafwlq` (`groupId`),
  KEY `idx_tmaxqhykdihaszkuxwxauihfcllrzmrohvtj` (`context`),
  CONSTRAINT `fk_lnmfvrrrdthfhlcwjswjcvrdvyliqgjcfmol` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (1,1,'Plain Text','plainText','global','kukrbgdv',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-08-07 00:05:27','2021-08-07 00:05:27','2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a'),(2,NULL,'Single Line Text','singleLineText','formie:7329ef3a-c123-40f9-8a65-633e706de190','nqbzwzio','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\SingleLineText','{\"columnWidth\":12,\"limit\":true,\"limitType\":\"words\",\"limitAmount\":\"10\",\"placeholder\":\"\",\"defaultValue\":\"\",\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":\"test\",\"containerAttributes\":[{\"label\":\"data-test\",\"value\":\"tfgdfg\"}],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:46:54','2021-08-07 02:50:45','83573e09-b99e-4356-9922-9a5728852d0d'),(3,NULL,'Multi Line Text','multiLineText','formie:7329ef3a-c123-40f9-8a65-633e706de190','kxemonkx','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\MultiLineText','{\"useRichText\":null,\"richTextButtons\":[\"bold\",\"italic\"],\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:46:54','2021-08-07 00:48:50','dd42f888-e2df-41a6-a1e6-dff7a4c63e81'),(4,NULL,'Radio Buttons','radioButtons','formie:7329ef3a-c123-40f9-8a65-633e706de190','jhuukjto','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Radio','{\"layout\":\"vertical\",\"options\":[{\"label\":\"Option 1\",\"value\":\"Option 1\",\"isDefault\":false},{\"label\":\"Option 2\",\"value\":\"Option 2\",\"isDefault\":false},{\"label\":\"Option 3\",\"value\":\"Option 3\",\"isDefault\":false}],\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:46:54','2021-08-07 00:48:50','24c6f00c-3d84-47c3-9bd4-c000807c35ba'),(5,NULL,'Checkboxes','checkboxes','formie:7329ef3a-c123-40f9-8a65-633e706de190','olbsolji','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Checkboxes','{\"multi\":true,\"layout\":\"vertical\",\"toggleCheckbox\":\"\",\"toggleCheckboxLabel\":null,\"options\":[{\"label\":\"Option 1\",\"value\":\"Option 1\",\"isDefault\":false},{\"label\":\"Option 2\",\"value\":\"Option 2\",\"isDefault\":false},{\"label\":\"Option 3\",\"value\":\"Option 3\",\"isDefault\":false}],\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:48:51','2021-08-07 00:48:51','997d4ae2-1677-4e60-abc5-15b5116c5e93'),(6,NULL,'Dropdown','dropdown','formie:7329ef3a-c123-40f9-8a65-633e706de190','xgoxdjsf','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Dropdown','{\"multiple\":null,\"multi\":null,\"optgroups\":true,\"options\":[{\"label\":\"Select an option\",\"value\":\"\",\"isDefault\":true},{\"label\":\"Option 1\",\"value\":\"Option 1\",\"isDefault\":false},{\"label\":\"Option 2\",\"value\":\"Option 2\",\"isDefault\":false},{\"label\":\"Option 3\",\"value\":\"Option 3\",\"isDefault\":false}],\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:48:51','2021-08-07 00:48:51','612b3cae-0c2a-4d5d-b537-b63774da566a'),(7,NULL,'Dropdown Multi','dropdownMulti','formie:7329ef3a-c123-40f9-8a65-633e706de190','nwpqbdmu','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Dropdown','{\"multiple\":true,\"multi\":true,\"optgroups\":true,\"options\":[{\"label\":\"Select an option\",\"value\":\"\",\"isDefault\":true},{\"label\":\"Option 1\",\"value\":\"Option 1\",\"isDefault\":false},{\"label\":\"Option 2\",\"value\":\"Option 2\",\"isDefault\":false},{\"label\":\"Option 3\",\"value\":\"Option 3\",\"isDefault\":false}],\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:48:51','2021-08-07 03:54:29','2b0664a9-75df-47d2-ae4c-25510ce5ba67'),(8,NULL,'Number','number','formie:7329ef3a-c123-40f9-8a65-633e706de190','ukvrxrzu','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Number','{\"min\":null,\"max\":null,\"decimals\":0,\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:56:31','2021-08-07 00:56:31','ce89d50c-4cb8-42a7-961e-a7b15fea77c5'),(9,NULL,'Name','name1','formie:7329ef3a-c123-40f9-8a65-633e706de190','zpqpjlhd','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Name','{\"useMultipleFields\":null,\"prefixEnabled\":false,\"prefixCollapsed\":true,\"prefixLabel\":\"Prefix\",\"prefixPlaceholder\":null,\"prefixDefaultValue\":\"\",\"prefixPrePopulate\":\"\",\"prefixRequired\":null,\"prefixErrorMessage\":null,\"firstNameEnabled\":true,\"firstNameCollapsed\":true,\"firstNameLabel\":\"First Name\",\"firstNamePlaceholder\":null,\"firstNameDefaultValue\":\"\",\"firstNamePrePopulate\":\"\",\"firstNameRequired\":null,\"firstNameErrorMessage\":null,\"middleNameEnabled\":false,\"middleNameCollapsed\":true,\"middleNameLabel\":\"Middle Name\",\"middleNamePlaceholder\":null,\"middleNameDefaultValue\":\"\",\"middleNamePrePopulate\":\"\",\"middleNameRequired\":null,\"middleNameErrorMessage\":null,\"lastNameEnabled\":true,\"lastNameCollapsed\":true,\"lastNameLabel\":\"Last Name\",\"lastNamePlaceholder\":null,\"lastNameDefaultValue\":\"\",\"lastNamePrePopulate\":\"\",\"lastNameRequired\":null,\"lastNameErrorMessage\":null,\"subfieldLabelPosition\":\"\",\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:56:31','2021-08-07 00:56:31','24985483-e672-465b-9dcb-27756159b55e'),(10,NULL,'Name Multi','nameMulti','formie:7329ef3a-c123-40f9-8a65-633e706de190','nrfrfdvb','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Name','{\"useMultipleFields\":true,\"prefixEnabled\":true,\"prefixCollapsed\":false,\"prefixLabel\":\"Prefix\",\"prefixPlaceholder\":null,\"prefixDefaultValue\":\"\",\"prefixPrePopulate\":\"\",\"prefixRequired\":null,\"prefixErrorMessage\":null,\"firstNameEnabled\":true,\"firstNameCollapsed\":true,\"firstNameLabel\":\"First Name\",\"firstNamePlaceholder\":null,\"firstNameDefaultValue\":\"\",\"firstNamePrePopulate\":\"\",\"firstNameRequired\":null,\"firstNameErrorMessage\":null,\"middleNameEnabled\":true,\"middleNameCollapsed\":false,\"middleNameLabel\":\"Middle Name\",\"middleNamePlaceholder\":null,\"middleNameDefaultValue\":\"\",\"middleNamePrePopulate\":\"\",\"middleNameRequired\":null,\"middleNameErrorMessage\":null,\"lastNameEnabled\":true,\"lastNameCollapsed\":true,\"lastNameLabel\":\"Last Name\",\"lastNamePlaceholder\":null,\"lastNameDefaultValue\":\"\",\"lastNamePrePopulate\":\"\",\"lastNameRequired\":null,\"lastNameErrorMessage\":null,\"subfieldLabelPosition\":\"\",\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:56:31','2021-08-07 00:56:31','5bba6ecb-9f71-4f97-9a48-0fb0164f8b00'),(11,NULL,'Email Address','emailAddress','formie:7329ef3a-c123-40f9-8a65-633e706de190','vqgdazaj','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Email','{\"validateDomain\":false,\"blockedDomains\":[],\"uniqueValue\":false,\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:56:31','2021-08-07 00:56:31','abe72576-ea08-41e6-9bde-41814249039d'),(12,NULL,'Phone Number','phoneNumber','formie:7329ef3a-c123-40f9-8a65-633e706de190','iscbxhry','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Phone','{\"countryEnabled\":false,\"countryCollapsed\":true,\"countryShowDialCode\":true,\"countryDefaultValue\":\"\",\"countryAllowed\":[],\"subfieldLabelPosition\":null,\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:56:31','2021-08-07 00:56:31','c0ad1b7b-e90f-427d-bbe9-0c97be6b5dc5'),(13,NULL,'Phone Number Country','phoneNumberCountry','formie:7329ef3a-c123-40f9-8a65-633e706de190','rwvonsyq','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Phone','{\"countryEnabled\":true,\"countryCollapsed\":true,\"countryShowDialCode\":true,\"countryDefaultValue\":\"\",\"countryAllowed\":[],\"subfieldLabelPosition\":null,\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:56:31','2021-08-07 00:56:31','8f5d7bc4-a867-412f-b317-9e417ab01021'),(14,NULL,'Agree','agree','formie:7329ef3a-c123-40f9-8a65-633e706de190','imaejzom','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Agree','{\"description\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"I agree to this\\\"}]}]\",\"checkedValue\":\"Yes\",\"uncheckedValue\":\"No\",\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":false,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":null,\"formId\":14,\"isNested\":false}','2021-08-07 00:56:31','2021-08-08 05:47:11','6d50ea47-04df-4080-a7f1-b2294c133401'),(15,NULL,'Date','date','formie:7329ef3a-c123-40f9-8a65-633e706de190','bwqneecg','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Date','{\"dateFormat\":\"Y-m-d\",\"timeFormat\":\"H:i\",\"displayType\":\"calendar\",\"includeTime\":false,\"timeLabel\":\"\",\"defaultOption\":\"\",\"dayLabel\":\"Day\",\"dayPlaceholder\":\"\",\"monthLabel\":\"Month\",\"monthPlaceholder\":\"\",\"yearLabel\":\"Year\",\"yearPlaceholder\":\"\",\"hourLabel\":\"Hour\",\"hourPlaceholder\":\"\",\"minuteLabel\":\"Minute\",\"minutePlaceholder\":\"\",\"secondLabel\":\"Second\",\"secondPlaceholder\":\"\",\"ampmLabel\":\"AM\\/PM\",\"ampmPlaceholder\":\"\",\"useDatePicker\":true,\"minDate\":[],\"maxDate\":[],\"subfieldLabelPosition\":\"\",\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":\"\",\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:56:31','2021-08-07 00:56:31','3ea44a66-8efe-4436-a147-4650e0c29e00'),(16,NULL,'Address','address','formie:7329ef3a-c123-40f9-8a65-633e706de190','hzicgdmp','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Address','{\"autocompleteIntegration\":null,\"autocompleteEnabled\":false,\"autocompleteCollapsed\":true,\"autocompleteLabel\":\"Auto-Complete\",\"autocompletePlaceholder\":null,\"autocompleteDefaultValue\":\"\",\"autocompletePrePopulate\":\"\",\"autocompleteRequired\":null,\"autocompleteErrorMessage\":null,\"address1Enabled\":true,\"address1Collapsed\":true,\"address1Label\":\"Address 1\",\"address1Placeholder\":null,\"address1DefaultValue\":\"\",\"address1PrePopulate\":\"\",\"address1Required\":null,\"address1ErrorMessage\":null,\"address1Hidden\":null,\"address2Enabled\":true,\"address2Collapsed\":false,\"address2Label\":\"Address 2\",\"address2Placeholder\":null,\"address2DefaultValue\":\"\",\"address2PrePopulate\":\"\",\"address2Required\":null,\"address2ErrorMessage\":null,\"address2Hidden\":null,\"address3Enabled\":true,\"address3Collapsed\":false,\"address3Label\":\"Address 3\",\"address3Placeholder\":null,\"address3DefaultValue\":\"\",\"address3PrePopulate\":\"\",\"address3Required\":null,\"address3ErrorMessage\":null,\"address3Hidden\":null,\"cityEnabled\":true,\"cityCollapsed\":true,\"cityLabel\":\"City\",\"cityPlaceholder\":null,\"cityDefaultValue\":\"\",\"cityPrePopulate\":\"\",\"cityRequired\":null,\"cityErrorMessage\":null,\"cityHidden\":null,\"stateEnabled\":true,\"stateCollapsed\":true,\"stateLabel\":\"State \\/ Province\",\"statePlaceholder\":null,\"stateDefaultValue\":\"\",\"statePrePopulate\":\"\",\"stateRequired\":null,\"stateErrorMessage\":null,\"stateHidden\":null,\"zipEnabled\":true,\"zipCollapsed\":true,\"zipLabel\":\"ZIP \\/ Postal Code\",\"zipPlaceholder\":null,\"zipDefaultValue\":\"\",\"zipPrePopulate\":\"\",\"zipRequired\":null,\"zipErrorMessage\":null,\"zipHidden\":null,\"countryEnabled\":true,\"countryCollapsed\":true,\"countryLabel\":\"Country\",\"countryPlaceholder\":null,\"countryDefaultValue\":\"\",\"countryPrePopulate\":\"\",\"countryRequired\":null,\"countryErrorMessage\":null,\"countryHidden\":null,\"enableAutocomplete\":null,\"subfieldLabelPosition\":\"\",\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:58:27','2021-08-07 00:58:27','6e590ae5-9621-4149-ba0a-268de5e7944c'),(17,NULL,'File Upload','fileUpload','formie:7329ef3a-c123-40f9-8a65-633e706de190',NULL,'Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\FileUpload','{\"searchable\":true,\"sizeLimit\":null,\"sizeMinLimit\":null,\"limitFiles\":null,\"restrictFiles\":true,\"allowedKinds\":[\"image\",\"pdf\"],\"uploadLocationSource\":\"volume:adf62689-9e99-4040-8bb3-c06de71033be\",\"uploadLocationSubpath\":\"\",\"useSingleFolder\":true,\"allowUploads\":true,\"defaultUploadLocationSource\":\"\",\"defaultUploadLocationSubpath\":null,\"singleUploadLocationSource\":\"folder:adf62689-9e99-4040-8bb3-c06de71033be\",\"singleUploadLocationSubpath\":\"\",\"showUnpermittedVolumes\":false,\"showUnpermittedFiles\":false,\"previewMode\":\"full\",\"columnWidth\":12,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false,\"limitOptions\":null,\"displayType\":\"dropdown\",\"labelSource\":\"title\",\"orderBy\":\"title ASC\",\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":null,\"selectionLabel\":null,\"showSiteMenu\":false,\"localizeRelations\":false,\"validateRelatedElements\":false,\"allowSelfRelations\":false,\"restrictedLocationSource\":\"\"}','2021-08-07 00:58:27','2021-08-07 00:58:27','1a41d78b-42cb-487c-9e0e-e26593ed1c06'),(18,NULL,'Recipients - Hidden','recipientsHidden','formie:7329ef3a-c123-40f9-8a65-633e706de190','oyokmeqk','',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Recipients','{\"displayType\":\"hidden\",\"options\":[],\"multiple\":null,\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"verbb\\\\formie\\\\positions\\\\Hidden\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:58:27','2021-08-07 05:31:06','0632ba0b-18a5-49b0-85d7-29446b7b1ab9'),(19,NULL,'Hidden','hidden','formie:7329ef3a-c123-40f9-8a65-633e706de190','qebauvli','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Hidden','{\"defaultOption\":\"custom\",\"queryParameter\":null,\"cookieName\":null,\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"verbb\\\\formie\\\\positions\\\\Hidden\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":null,\"enableContentEncryption\":false,\"visibility\":null,\"formId\":14,\"isNested\":false}','2021-08-07 00:58:27','2021-08-07 00:58:27','f54e8ec1-62e8-465f-90ab-8fc68d1f801b'),(20,NULL,'Repeater','repeater','formie:7329ef3a-c123-40f9-8a65-633e706de190',NULL,'Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Repeater','{\"minRows\":null,\"maxRows\":null,\"addLabel\":\"Add another row\",\"contentTable\":\"{{%fmc_14_repeater}}\",\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:58:27','2021-08-07 00:58:27','198d0e65-1cf1-43b4-85e4-065ef51eaed4'),(21,NULL,'Table','table','formie:7329ef3a-c123-40f9-8a65-633e706de190','xzvobupk','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Table','{\"searchable\":true,\"columns\":{\"col1\":{\"heading\":\"Column 1\",\"handle\":\"column1\",\"width\":\"\",\"type\":\"checkbox\"},\"col2\":{\"heading\":\"Column 2\",\"handle\":\"column2\",\"width\":\"\",\"type\":\"color\"},\"col3\":{\"heading\":\"Column 3\",\"handle\":\"column3\",\"width\":\"\",\"type\":\"date\"},\"col4\":{\"heading\":\"Column 4\",\"handle\":\"column4\",\"width\":\"\",\"type\":\"select\",\"options\":[{\"label\":\"Option 1\",\"value\":\"Option 1\",\"isOptgroup\":false,\"isDefault\":false},{\"label\":\"Option 2\",\"value\":\"Option 2\",\"isOptgroup\":false,\"isDefault\":false}]},\"col5\":{\"heading\":\"Column 5\",\"handle\":\"column5\",\"width\":\"\",\"type\":\"email\"},\"col6\":{\"heading\":\"Column 6\",\"handle\":\"column6\",\"width\":\"\",\"type\":\"heading\"},\"col7\":{\"heading\":\"Column 7\",\"handle\":\"column7\",\"width\":\"\",\"type\":\"multiline\"},\"col8\":{\"heading\":\"Column 8\",\"handle\":\"column8\",\"width\":\"\",\"type\":\"number\"},\"col9\":{\"heading\":\"Column 9\",\"handle\":\"column9\",\"width\":\"\",\"type\":\"time\"},\"col10\":{\"heading\":\"Column 10\",\"handle\":\"column10\",\"width\":\"\",\"type\":\"singleline\"},\"col11\":{\"heading\":\"Column 11\",\"handle\":\"column11\",\"width\":\"\",\"type\":\"url\"}},\"static\":false,\"addRowLabel\":\"Add row\",\"maxRows\":null,\"minRows\":null,\"defaults\":[],\"columnType\":\"text\",\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:58:27','2021-08-07 06:33:57','a1072170-4b7e-4872-812f-c6c3a650ebad'),(22,NULL,'Group','group','formie:7329ef3a-c123-40f9-8a65-633e706de190',NULL,'Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Group','{\"contentTable\":\"{{%fmc_14_group}}\",\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:58:27','2021-08-07 00:58:27','d52b78e5-fb1f-4368-932a-9a59bdfc0b78'),(23,NULL,'Heading','heading','formie:7329ef3a-c123-40f9-8a65-633e706de190',NULL,'Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Heading','{\"headingSize\":\"h2\",\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":null,\"formId\":14,\"isNested\":false}','2021-08-07 00:58:27','2021-08-07 00:58:27','28aeed7a-e6b5-4b81-bacb-ceec52fb6c7b'),(24,NULL,'Section Label 0c0e54c799aea42ab1262a3715e3f782','sectionHandle55f835d9c17ada919a129c71e425f835','formie:7329ef3a-c123-40f9-8a65-633e706de190',NULL,'Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Section','{\"borderStyle\":\"solid\",\"borderWidth\":1,\"borderColor\":\"#ccc\",\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:58:27','2021-08-08 11:28:27','2914d115-4c92-4e2f-9a30-d2f935387e37'),(25,NULL,'HTML','html','formie:7329ef3a-c123-40f9-8a65-633e706de190',NULL,'Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Html','{\"htmlContent\":null,\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:58:27','2021-08-07 07:29:22','7f73e5fa-db51-47c1-ad96-a670532a966a'),(26,NULL,'Entries - Dropdown','entriesDropdown','formie:7329ef3a-c123-40f9-8a65-633e706de190',NULL,'Please fill out this field.',1,'site',NULL,'verbb\\formie\\fields\\formfields\\Entries','{\"searchable\":true,\"columnWidth\":12,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":\"Select an entry\",\"defaultValue\":[],\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false,\"limitOptions\":null,\"displayType\":\"dropdown\",\"labelSource\":\"title\",\"orderBy\":\"id ASC\",\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":null,\"selectionLabel\":null,\"showSiteMenu\":false,\"localizeRelations\":false,\"validateRelatedElements\":false,\"allowSelfRelations\":false}','2021-08-07 01:05:55','2021-08-07 11:31:54','6ba49b85-5301-4240-9650-921db92e3062'),(27,NULL,'Categories','categories','formie:7329ef3a-c123-40f9-8a65-633e706de190',NULL,'Please fill out this field.',1,'site',NULL,'verbb\\formie\\fields\\formfields\\Categories','{\"searchable\":true,\"allowLimit\":false,\"allowMultipleSources\":false,\"branchLimit\":null,\"columnWidth\":12,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":\"Select a category\",\"defaultValue\":[],\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false,\"limitOptions\":null,\"displayType\":\"dropdown\",\"labelSource\":\"id\",\"orderBy\":\"id ASC\",\"sources\":\"*\",\"source\":\"group:12530c06-549d-4664-97d3-2a96906bde12\",\"targetSiteId\":null,\"viewMode\":null,\"limit\":null,\"selectionLabel\":null,\"showSiteMenu\":false,\"localizeRelations\":false,\"validateRelatedElements\":false,\"allowSelfRelations\":false}','2021-08-07 01:05:55','2021-08-07 01:05:55','0a6ac0a5-d58b-4472-bb99-bbdd7c34daf3'),(28,NULL,'Tags','tags','formie:7329ef3a-c123-40f9-8a65-633e706de190',NULL,'Please fill out this field.',1,'site',NULL,'verbb\\formie\\fields\\formfields\\Tags','{\"searchable\":true,\"allowMultipleSources\":false,\"allowLimit\":false,\"columnWidth\":12,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":\"Select a tag\",\"defaultValue\":[],\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false,\"limitOptions\":null,\"displayType\":\"dropdown\",\"labelSource\":\"id\",\"orderBy\":\"title ASC\",\"sources\":\"*\",\"source\":\"taggroup:9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15\",\"targetSiteId\":null,\"viewMode\":null,\"limit\":null,\"selectionLabel\":null,\"showSiteMenu\":false,\"localizeRelations\":false,\"validateRelatedElements\":false,\"allowSelfRelations\":false}','2021-08-07 01:05:55','2021-08-07 01:05:55','e9166ffb-4ca8-4423-947b-0d05614a5f57'),(29,NULL,'Users','users','formie:7329ef3a-c123-40f9-8a65-633e706de190',NULL,'Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Users','{\"searchable\":true,\"columnWidth\":12,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":\"Select a user\",\"defaultValue\":[],\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false,\"limitOptions\":null,\"displayType\":\"dropdown\",\"labelSource\":\"id\",\"orderBy\":\"id ASC\",\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":null,\"selectionLabel\":null,\"showSiteMenu\":false,\"localizeRelations\":false,\"validateRelatedElements\":false,\"allowSelfRelations\":false}','2021-08-07 01:05:55','2021-08-07 01:05:55','a878a70e-95af-4f63-b9f9-1ee3c61a56d3'),(30,NULL,'Recipients - Dropdown','recipientsDropdown2','formie:7329ef3a-c123-40f9-8a65-633e706de190','tjydboqn','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Recipients','{\"displayType\":\"dropdown\",\"options\":[{\"label\":\"Recipient 1\",\"value\":\"Recipient 1\",\"isDefault\":false},{\"label\":\"Recipient 2\",\"value\":\"Recipient 2\",\"isDefault\":false},{\"label\":\"Recipient 3\",\"value\":\"Recipient 3\",\"isDefault\":false}],\"multiple\":null,\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 05:28:42','2021-08-07 05:31:06','9e693c98-808f-49b2-8196-cfa84f6f55ac'),(31,NULL,'Recipients - Checkboxes','recipientsCheckboxes','formie:7329ef3a-c123-40f9-8a65-633e706de190','vskdkugc','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Recipients','{\"displayType\":\"checkboxes\",\"options\":[{\"label\":\"Recipient 1\",\"value\":\"Recipient 1\",\"isDefault\":false},{\"label\":\"Recipient 2\",\"value\":\"Recipient 2\",\"isDefault\":false},{\"label\":\"Recipient 3\",\"value\":\"Recipient 3\",\"isDefault\":false}],\"multiple\":null,\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 05:28:42','2021-08-07 05:31:06','61b87273-d0fc-4a55-81ec-b9803ecafde9'),(32,NULL,'Recipients - Radio','recipientsRadio','formie:7329ef3a-c123-40f9-8a65-633e706de190','vbuwsqtc','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Recipients','{\"displayType\":\"radio\",\"options\":[{\"label\":\"Recipient 1\",\"value\":\"Recipient 1\",\"isDefault\":false},{\"label\":\"Recipient 2\",\"value\":\"Recipient 2\",\"isDefault\":false},{\"label\":\"Recipient 3\",\"value\":\"Recipient 3\",\"isDefault\":false}],\"multiple\":null,\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 05:28:42','2021-08-07 05:31:06','627856c4-707f-4684-a4da-dbd9f3ce6c04'),(33,NULL,'Single Line Text','singleLineText','formieField:198d0e65-1cf1-43b4-85e4-065ef51eaed4','xnkiohlg',NULL,1,'none',NULL,'verbb\\formie\\fields\\formfields\\SingleLineText','{\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":true}','2021-08-07 05:38:58','2021-08-07 06:20:11','72c1cd95-cc9a-4291-bef0-f9ce458425f3'),(34,NULL,'Single Line Text','singleLineText','formieField:d52b78e5-fb1f-4368-932a-9a59bdfc0b78','flzldyae',NULL,1,'none',NULL,'verbb\\formie\\fields\\formfields\\SingleLineText','{\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":true}','2021-08-07 05:38:58','2021-08-07 06:20:11','ec12ff3a-dbdc-4bc9-9ad5-f4a0fb5d3678'),(35,NULL,'Entries - Checkboxes','entriesCheckboxes','formie:7329ef3a-c123-40f9-8a65-633e706de190',NULL,'Please fill out this field.',1,'site',NULL,'verbb\\formie\\fields\\formfields\\Entries','{\"searchable\":true,\"columnWidth\":12,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":\"Select an entry\",\"defaultValue\":[],\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false,\"limitOptions\":null,\"displayType\":\"checkboxes\",\"labelSource\":\"title\",\"orderBy\":\"id ASC\",\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":null,\"selectionLabel\":null,\"showSiteMenu\":false,\"localizeRelations\":false,\"validateRelatedElements\":false,\"allowSelfRelations\":false}','2021-08-07 09:08:05','2021-08-07 11:31:54','57252155-6064-45cb-a805-d99aa677c2cc'),(36,NULL,'Entries - Radio','entriesRadio','formie:7329ef3a-c123-40f9-8a65-633e706de190',NULL,'Please fill out this field.',1,'site',NULL,'verbb\\formie\\fields\\formfields\\Entries','{\"searchable\":true,\"columnWidth\":12,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":\"Select an entry\",\"defaultValue\":[],\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false,\"limitOptions\":null,\"displayType\":\"radio\",\"labelSource\":\"title\",\"orderBy\":\"id ASC\",\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":null,\"selectionLabel\":null,\"showSiteMenu\":false,\"localizeRelations\":false,\"validateRelatedElements\":false,\"allowSelfRelations\":false}','2021-08-07 09:08:05','2021-08-07 11:31:55','fd497ad6-a939-48d7-b736-87cbf1103edd'),(37,NULL,'Your Name','yourName','formie:53e5ad40-ccfb-4d82-bf14-f284e553949b','sjmijxhf','Please enter your full name.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Name','{\"useMultipleFields\":true,\"prefixEnabled\":false,\"prefixCollapsed\":true,\"prefixLabel\":\"Prefix\",\"prefixPlaceholder\":null,\"prefixDefaultValue\":\"\",\"prefixPrePopulate\":null,\"prefixRequired\":null,\"prefixErrorMessage\":null,\"firstNameEnabled\":true,\"firstNameCollapsed\":false,\"firstNameLabel\":\"First Name\",\"firstNamePlaceholder\":\"e.g. Peter\",\"firstNameDefaultValue\":\"\",\"firstNamePrePopulate\":null,\"firstNameRequired\":true,\"firstNameErrorMessage\":null,\"middleNameEnabled\":false,\"middleNameCollapsed\":true,\"middleNameLabel\":\"Middle Name\",\"middleNamePlaceholder\":null,\"middleNameDefaultValue\":\"\",\"middleNamePrePopulate\":null,\"middleNameRequired\":null,\"middleNameErrorMessage\":null,\"lastNameEnabled\":true,\"lastNameCollapsed\":false,\"lastNameLabel\":\"Last Name\",\"lastNamePlaceholder\":\"e.g. Sherman\",\"lastNameDefaultValue\":\"\",\"lastNamePrePopulate\":null,\"lastNameRequired\":true,\"lastNameErrorMessage\":null,\"subfieldLabelPosition\":\"\",\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":\"Your name\",\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"verbb\\\\formie\\\\positions\\\\Hidden\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":18,\"isNested\":false}','2021-08-07 12:09:46','2021-08-08 04:58:49','c70240ab-f426-4353-880e-03ee4c8977b5'),(38,NULL,'Email Address','emailAddress','formie:53e5ad40-ccfb-4d82-bf14-f284e553949b','qlaxlxfq','Please enter your email so we can get in touch.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Email','{\"validateDomain\":false,\"blockedDomains\":[],\"uniqueValue\":false,\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":\"e.g. psherman@wallaby.com\",\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":null,\"enableContentEncryption\":false,\"visibility\":null,\"formId\":18,\"isNested\":false}','2021-08-07 12:09:46','2021-08-07 12:10:11','eb0f4f41-b0ed-4057-8908-3c7e5ff32bfb'),(39,NULL,'Message','message','formie:53e5ad40-ccfb-4d82-bf14-f284e553949b','astyvkry','Please enter your comments.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\MultiLineText','{\"useRichText\":null,\"richTextButtons\":null,\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":\"e.g. The reason for my enquiry is...\",\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":null,\"enableContentEncryption\":false,\"visibility\":null,\"formId\":18,\"isNested\":false}','2021-08-07 12:09:46','2021-08-07 12:10:11','7d34bb51-fa15-4dde-9f00-4cd28d3a77b5'),(40,NULL,'Your Name','yourName','formie:7ddcdd30-9076-4648-8741-6feacee33815','wfoqhoys','Please enter your full name.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Name','{\"useMultipleFields\":true,\"prefixEnabled\":false,\"prefixCollapsed\":true,\"prefixLabel\":\"Prefix\",\"prefixPlaceholder\":null,\"prefixDefaultValue\":null,\"prefixPrePopulate\":null,\"prefixRequired\":false,\"prefixErrorMessage\":null,\"firstNameEnabled\":true,\"firstNameCollapsed\":false,\"firstNameLabel\":\"First Name\",\"firstNamePlaceholder\":\"e.g. Peter\",\"firstNameDefaultValue\":null,\"firstNamePrePopulate\":null,\"firstNameRequired\":true,\"firstNameErrorMessage\":null,\"middleNameEnabled\":false,\"middleNameCollapsed\":true,\"middleNameLabel\":\"Middle Name\",\"middleNamePlaceholder\":null,\"middleNameDefaultValue\":null,\"middleNamePrePopulate\":null,\"middleNameRequired\":false,\"middleNameErrorMessage\":null,\"lastNameEnabled\":true,\"lastNameCollapsed\":false,\"lastNameLabel\":\"Last Name\",\"lastNamePlaceholder\":\"e.g. Sherman\",\"lastNameDefaultValue\":null,\"lastNamePrePopulate\":null,\"lastNameRequired\":true,\"lastNameErrorMessage\":null,\"subfieldLabelPosition\":null,\"matchField\":null,\"placeholder\":\"Your name\",\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"verbb\\\\formie\\\\positions\\\\Hidden\",\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:09','2023-09-02 11:34:09','dc22e35a-d1f6-4c8c-9501-102faae591c9'),(41,NULL,'Email Address','emailAddress','formie:7ddcdd30-9076-4648-8741-6feacee33815','zedkdxnz','Please enter your email so we can get in touch.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Email','{\"validateDomain\":false,\"blockedDomains\":[],\"uniqueValue\":false,\"matchField\":null,\"placeholder\":\"e.g. psherman@wallaby.com\",\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":null,\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:09','2023-09-02 11:34:09','1d0b5d37-1863-488a-9b93-d57cef452965'),(42,NULL,'Message','message','formie:7ddcdd30-9076-4648-8741-6feacee33815','anpfmdrt','Please enter your comments.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\MultiLineText','{\"limit\":false,\"min\":null,\"minType\":null,\"max\":null,\"maxType\":\"characters\",\"useRichText\":false,\"richTextButtons\":null,\"matchField\":null,\"placeholder\":\"e.g. The reason for my enquiry is...\",\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":null,\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:09','2023-09-02 11:34:09','6935748c-200b-4871-8ff4-e93cfeb39f21'),(43,NULL,'Single Line Text','singleLineText','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1','stxyhxuq','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\SingleLineText','{\"limit\":true,\"min\":null,\"minType\":null,\"max\":10,\"maxType\":\"words\",\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":\"test\",\"containerAttributes\":[{\"label\":\"data-test\",\"value\":\"tfgdfg\"}],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:23','2023-09-02 11:34:23','eac8a271-de29-4bb6-99cd-2395fa4cba81'),(44,NULL,'Multi Line Text','multiLineText','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1','rlyleqcg','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\MultiLineText','{\"limit\":false,\"min\":null,\"minType\":null,\"max\":null,\"maxType\":\"characters\",\"useRichText\":false,\"richTextButtons\":[\"bold\",\"italic\"],\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:24','2023-09-02 11:34:24','f937ab7f-4bd1-4dec-b10b-1973b2246416'),(45,NULL,'Radio Buttons','radioButtons','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1','vvcuvxgl','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Radio','{\"layout\":\"vertical\",\"options\":[{\"label\":\"Option 1\",\"value\":\"Option 1\",\"isDefault\":false},{\"label\":\"Option 2\",\"value\":\"Option 2\",\"isDefault\":false},{\"label\":\"Option 3\",\"value\":\"Option 3\",\"isDefault\":false}],\"columnType\":\"string\",\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:24','2023-09-02 11:34:24','7c134309-ea4e-4c52-8979-ef85e2362e22'),(46,NULL,'Checkboxes','checkboxes','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1','fhlljkeg','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Checkboxes','{\"multi\":true,\"layout\":\"vertical\",\"toggleCheckbox\":null,\"toggleCheckboxLabel\":null,\"options\":[{\"label\":\"Option 1\",\"value\":\"Option 1\",\"isDefault\":false},{\"label\":\"Option 2\",\"value\":\"Option 2\",\"isDefault\":false},{\"label\":\"Option 3\",\"value\":\"Option 3\",\"isDefault\":false}],\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:24','2023-09-02 11:34:24','1c82fa40-bec5-4af8-995b-9feffdf3c96d'),(47,NULL,'Dropdown','dropdown','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1','shomclgg','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Dropdown','{\"multiple\":false,\"multi\":false,\"optgroups\":true,\"options\":[{\"label\":\"Select an option\",\"value\":\"\",\"isDefault\":true},{\"label\":\"Option 1\",\"value\":\"Option 1\",\"isDefault\":false},{\"label\":\"Option 2\",\"value\":\"Option 2\",\"isDefault\":false},{\"label\":\"Option 3\",\"value\":\"Option 3\",\"isDefault\":false}],\"columnType\":\"string\",\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:24','2023-09-02 11:34:24','bc4ceac3-2430-47d9-96f8-da304b822998'),(48,NULL,'Dropdown Multi','dropdownMulti','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1','lwxydzmz','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Dropdown','{\"multiple\":true,\"multi\":true,\"optgroups\":true,\"options\":[{\"label\":\"Select an option\",\"value\":\"\",\"isDefault\":true},{\"label\":\"Option 1\",\"value\":\"Option 1\",\"isDefault\":false},{\"label\":\"Option 2\",\"value\":\"Option 2\",\"isDefault\":false},{\"label\":\"Option 3\",\"value\":\"Option 3\",\"isDefault\":false}],\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:24','2023-09-02 11:34:24','420f92ed-1419-4aae-a120-f78f586be4fe'),(49,NULL,'Number','number','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1','ycewvcut','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Number','{\"limit\":false,\"min\":null,\"max\":null,\"decimals\":0,\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:24','2023-09-02 11:34:24','12aea35f-9176-4b6f-9ad4-99b90a0f00fb'),(50,NULL,'Name','name1','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1','xnxyjcwz','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Name','{\"useMultipleFields\":false,\"prefixEnabled\":false,\"prefixCollapsed\":true,\"prefixLabel\":\"Prefix\",\"prefixPlaceholder\":null,\"prefixDefaultValue\":null,\"prefixPrePopulate\":null,\"prefixRequired\":false,\"prefixErrorMessage\":null,\"firstNameEnabled\":true,\"firstNameCollapsed\":true,\"firstNameLabel\":\"First Name\",\"firstNamePlaceholder\":null,\"firstNameDefaultValue\":null,\"firstNamePrePopulate\":null,\"firstNameRequired\":false,\"firstNameErrorMessage\":null,\"middleNameEnabled\":false,\"middleNameCollapsed\":true,\"middleNameLabel\":\"Middle Name\",\"middleNamePlaceholder\":null,\"middleNameDefaultValue\":null,\"middleNamePrePopulate\":null,\"middleNameRequired\":false,\"middleNameErrorMessage\":null,\"lastNameEnabled\":true,\"lastNameCollapsed\":true,\"lastNameLabel\":\"Last Name\",\"lastNamePlaceholder\":null,\"lastNameDefaultValue\":null,\"lastNamePrePopulate\":null,\"lastNameRequired\":false,\"lastNameErrorMessage\":null,\"subfieldLabelPosition\":null,\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:24','2023-09-02 11:34:24','1b875901-c7af-4836-8315-1ff9b25237f2'),(51,NULL,'Name Multi','nameMulti','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1','apubilmo','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Name','{\"useMultipleFields\":true,\"prefixEnabled\":true,\"prefixCollapsed\":false,\"prefixLabel\":\"Prefix\",\"prefixPlaceholder\":null,\"prefixDefaultValue\":null,\"prefixPrePopulate\":null,\"prefixRequired\":false,\"prefixErrorMessage\":null,\"firstNameEnabled\":true,\"firstNameCollapsed\":true,\"firstNameLabel\":\"First Name\",\"firstNamePlaceholder\":null,\"firstNameDefaultValue\":null,\"firstNamePrePopulate\":null,\"firstNameRequired\":false,\"firstNameErrorMessage\":null,\"middleNameEnabled\":true,\"middleNameCollapsed\":false,\"middleNameLabel\":\"Middle Name\",\"middleNamePlaceholder\":null,\"middleNameDefaultValue\":null,\"middleNamePrePopulate\":null,\"middleNameRequired\":false,\"middleNameErrorMessage\":null,\"lastNameEnabled\":true,\"lastNameCollapsed\":true,\"lastNameLabel\":\"Last Name\",\"lastNamePlaceholder\":null,\"lastNameDefaultValue\":null,\"lastNamePrePopulate\":null,\"lastNameRequired\":false,\"lastNameErrorMessage\":null,\"subfieldLabelPosition\":null,\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:24','2023-09-02 11:34:24','d1dea267-8a66-4440-beb7-082ae7c32621'),(52,NULL,'Email Address','emailAddress','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1','ksljfbcs','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Email','{\"validateDomain\":false,\"blockedDomains\":[],\"uniqueValue\":false,\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:24','2023-09-02 11:34:24','6235aae5-b1d6-4c67-bc03-36fbc1f9b9d1'),(53,NULL,'Phone Number','phoneNumber','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1','cpqcmqua','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Phone','{\"countryEnabled\":false,\"countryCollapsed\":true,\"countryShowDialCode\":true,\"countryDefaultValue\":null,\"countryAllowed\":[],\"subfieldLabelPosition\":null,\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:24','2023-09-02 11:34:24','3b85862c-0ab1-4ef2-8ba1-2c621f7adc6f'),(54,NULL,'Phone Number Country','phoneNumberCountry','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1','hiuggqlo','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Phone','{\"countryEnabled\":true,\"countryCollapsed\":true,\"countryShowDialCode\":true,\"countryDefaultValue\":null,\"countryAllowed\":[],\"subfieldLabelPosition\":null,\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:24','2023-09-02 11:34:24','d64b7c1b-45ec-41b9-9d93-6fa03a6881dc'),(55,NULL,'Agree','agree','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1','omhebvzo','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Agree','{\"description\":[{\"type\":\"paragraph\",\"content\":[{\"type\":\"text\",\"text\":\"I agree to this\"}]}],\"checkedValue\":\"Yes\",\"uncheckedValue\":\"No\",\"matchField\":null,\"placeholder\":null,\"defaultValue\":false,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:24','2023-09-02 11:34:24','8ab11e95-2c0b-49dc-bd95-10b8c135b8c3'),(56,NULL,'Date','date','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1','mpgmazyu','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Date','{\"dateFormat\":\"Y-m-d\",\"timeFormat\":\"H:i\",\"displayType\":\"calendar\",\"includeDate\":true,\"includeTime\":false,\"timeLabel\":null,\"defaultOption\":null,\"dayLabel\":\"Day\",\"dayPlaceholder\":null,\"monthLabel\":\"Month\",\"monthPlaceholder\":null,\"yearLabel\":\"Year\",\"yearPlaceholder\":null,\"hourLabel\":\"Hour\",\"hourPlaceholder\":null,\"minuteLabel\":\"Minute\",\"minutePlaceholder\":null,\"secondLabel\":\"Second\",\"secondPlaceholder\":null,\"ampmLabel\":\"AM\\/PM\",\"ampmPlaceholder\":null,\"useDatePicker\":true,\"datePickerOptions\":[],\"minDateOption\":\"\",\"minDate\":null,\"minDateOffset\":\"add\",\"minDateOffsetNumber\":0,\"minDateOffsetType\":\"days\",\"maxDateOption\":\"\",\"maxDate\":null,\"maxDateOffset\":\"add\",\"maxDateOffsetNumber\":0,\"maxDateOffsetType\":\"days\",\"minYearRange\":100,\"maxYearRange\":100,\"availableDaysOfWeek\":\"*\",\"subfieldLabelPosition\":null,\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:24','2023-09-02 11:34:24','dd8a1bff-8ea9-4ed8-bae6-a1af6ccb314f'),(57,NULL,'Address','address','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1','tznvppqp','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Address','{\"autocompleteIntegration\":null,\"autocompleteEnabled\":false,\"autocompleteCollapsed\":true,\"autocompleteLabel\":\"Auto-Complete\",\"autocompletePlaceholder\":null,\"autocompleteDefaultValue\":null,\"autocompletePrePopulate\":null,\"autocompleteRequired\":false,\"autocompleteErrorMessage\":null,\"autocompleteCurrentLocation\":false,\"address1Enabled\":true,\"address1Collapsed\":true,\"address1Label\":\"Address 1\",\"address1Placeholder\":null,\"address1DefaultValue\":null,\"address1PrePopulate\":null,\"address1Required\":false,\"address1ErrorMessage\":null,\"address1Hidden\":false,\"address2Enabled\":true,\"address2Collapsed\":false,\"address2Label\":\"Address 2\",\"address2Placeholder\":null,\"address2DefaultValue\":null,\"address2PrePopulate\":null,\"address2Required\":false,\"address2ErrorMessage\":null,\"address2Hidden\":false,\"address3Enabled\":true,\"address3Collapsed\":false,\"address3Label\":\"Address 3\",\"address3Placeholder\":null,\"address3DefaultValue\":null,\"address3PrePopulate\":null,\"address3Required\":false,\"address3ErrorMessage\":null,\"address3Hidden\":false,\"cityEnabled\":true,\"cityCollapsed\":true,\"cityLabel\":\"City\",\"cityPlaceholder\":null,\"cityDefaultValue\":null,\"cityPrePopulate\":null,\"cityRequired\":false,\"cityErrorMessage\":null,\"cityHidden\":false,\"stateEnabled\":true,\"stateCollapsed\":true,\"stateLabel\":\"State \\/ Province\",\"statePlaceholder\":null,\"stateDefaultValue\":null,\"statePrePopulate\":null,\"stateRequired\":false,\"stateErrorMessage\":null,\"stateHidden\":false,\"zipEnabled\":true,\"zipCollapsed\":true,\"zipLabel\":\"ZIP \\/ Postal Code\",\"zipPlaceholder\":null,\"zipDefaultValue\":null,\"zipPrePopulate\":null,\"zipRequired\":false,\"zipErrorMessage\":null,\"zipHidden\":false,\"countryEnabled\":true,\"countryCollapsed\":true,\"countryLabel\":\"Country\",\"countryPlaceholder\":null,\"countryDefaultValue\":null,\"countryPrePopulate\":null,\"countryRequired\":false,\"countryErrorMessage\":null,\"countryHidden\":false,\"subfieldLabelPosition\":null,\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:24','2023-09-02 11:34:24','93d7e124-2507-492a-8d57-0abc973dc1e1'),(58,NULL,'File Upload','fileUpload','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1',NULL,'Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\FileUpload','{\"searchable\":true,\"sizeLimit\":null,\"sizeMinLimit\":null,\"limitFiles\":null,\"restrictFiles\":true,\"allowedKinds\":[\"image\",\"pdf\"],\"uploadLocationSource\":\"volume:adf62689-9e99-4040-8bb3-c06de71033be\",\"uploadLocationSubpath\":null,\"restrictLocation\":true,\"filenameFormat\":null,\"restrictedLocationSource\":\"volume:adf62689-9e99-4040-8bb3-c06de71033be\",\"restrictedLocationSubpath\":\"\",\"allowSubfolders\":false,\"restrictedDefaultUploadSubpath\":null,\"defaultUploadLocationSource\":null,\"defaultUploadLocationSubpath\":null,\"allowUploads\":true,\"showUnpermittedVolumes\":false,\"showUnpermittedFiles\":false,\"previewMode\":\"full\",\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false,\"limitOptions\":null,\"displayType\":\"dropdown\",\"labelSource\":\"title\",\"orderBy\":\"title ASC\",\"multiple\":false,\"allowSelfRelations\":false,\"localizeRelations\":false,\"maxRelations\":null,\"minRelations\":null,\"selectionLabel\":null,\"showSiteMenu\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null,\"maintainHierarchy\":false,\"branchLimit\":null}','2023-09-02 11:34:24','2023-09-02 11:34:24','28e43436-f50a-4443-b38d-404df407cd8d'),(59,NULL,'Recipients - Hidden','recipientsHidden','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1','ykhycpjf',NULL,1,'none',NULL,'verbb\\formie\\fields\\formfields\\Recipients','{\"displayType\":\"hidden\",\"options\":[],\"multiple\":null,\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"verbb\\\\formie\\\\positions\\\\Hidden\",\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:24','2023-09-02 11:34:24','993f232d-0e2a-424a-b41a-d6379e8947d6'),(60,NULL,'Recipients - Dropdown','recipientsDropdown2','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1','bmatqfmz','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Recipients','{\"displayType\":\"dropdown\",\"options\":[{\"label\":\"Recipient 1\",\"value\":\"Recipient 1\",\"isDefault\":false},{\"label\":\"Recipient 2\",\"value\":\"Recipient 2\",\"isDefault\":false},{\"label\":\"Recipient 3\",\"value\":\"Recipient 3\",\"isDefault\":false}],\"multiple\":null,\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:24','2023-09-02 11:34:24','95ecfcb3-ffdd-44a0-a8fa-e80fcd702853'),(61,NULL,'Recipients - Checkboxes','recipientsCheckboxes','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1','edlrdxqp','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Recipients','{\"displayType\":\"checkboxes\",\"options\":[{\"label\":\"Recipient 1\",\"value\":\"Recipient 1\",\"isDefault\":false},{\"label\":\"Recipient 2\",\"value\":\"Recipient 2\",\"isDefault\":false},{\"label\":\"Recipient 3\",\"value\":\"Recipient 3\",\"isDefault\":false}],\"multiple\":null,\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:24','2023-09-02 11:34:24','6c4e2411-ad13-4da0-996b-8d3646979814'),(62,NULL,'Recipients - Radio','recipientsRadio','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1','xfpbsfcp','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Recipients','{\"displayType\":\"radio\",\"options\":[{\"label\":\"Recipient 1\",\"value\":\"Recipient 1\",\"isDefault\":false},{\"label\":\"Recipient 2\",\"value\":\"Recipient 2\",\"isDefault\":false},{\"label\":\"Recipient 3\",\"value\":\"Recipient 3\",\"isDefault\":false}],\"multiple\":null,\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:24','2023-09-02 11:34:24','1cc6faf5-e447-4fd0-a963-690680058020'),(63,NULL,'Hidden','hidden','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1','gvwchqyo','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Hidden','{\"defaultOption\":\"custom\",\"queryParameter\":null,\"cookieName\":null,\"columnType\":null,\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"verbb\\\\formie\\\\positions\\\\Hidden\",\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":null,\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:24','2023-09-02 11:34:24','495d161d-4c94-4112-abea-264880a68e9f'),(64,NULL,'Repeater','repeater','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1',NULL,'Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Repeater','{\"minRows\":null,\"maxRows\":null,\"addLabel\":\"Add another row\",\"contentTable\":\"{{%fmc__repeater}}\",\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:24','2023-09-02 11:34:24','61f76bdd-3958-45e6-96e0-613339c5ca39'),(65,NULL,'Single Line Text','singleLineText','formieField:61f76bdd-3958-45e6-96e0-613339c5ca39','iwxbemtd',NULL,1,'none',NULL,'verbb\\formie\\fields\\formfields\\SingleLineText','{\"limit\":false,\"min\":null,\"minType\":null,\"max\":null,\"maxType\":\"characters\",\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":true}','2023-09-02 11:34:24','2023-09-02 11:34:24','e928183a-aca8-4126-86b2-321a70aa1088'),(66,NULL,'Table','table','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1','gwfnpuih','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Table','{\"searchable\":true,\"columns\":{\"col1\":{\"heading\":\"Column 1\",\"handle\":\"column1\",\"width\":\"\",\"type\":\"checkbox\"},\"col2\":{\"heading\":\"Column 2\",\"handle\":\"column2\",\"width\":\"\",\"type\":\"color\"},\"col3\":{\"heading\":\"Column 3\",\"handle\":\"column3\",\"width\":\"\",\"type\":\"date\"},\"col4\":{\"heading\":\"Column 4\",\"handle\":\"column4\",\"width\":\"\",\"type\":\"select\",\"options\":[{\"label\":\"Option 1\",\"value\":\"Option 1\",\"isOptgroup\":false,\"isDefault\":false},{\"label\":\"Option 2\",\"value\":\"Option 2\",\"isOptgroup\":false,\"isDefault\":false}]},\"col5\":{\"heading\":\"Column 5\",\"handle\":\"column5\",\"width\":\"\",\"type\":\"email\"},\"col6\":{\"heading\":\"Column 6\",\"handle\":\"column6\",\"width\":\"\",\"type\":\"heading\"},\"col7\":{\"heading\":\"Column 7\",\"handle\":\"column7\",\"width\":\"\",\"type\":\"multiline\"},\"col8\":{\"heading\":\"Column 8\",\"handle\":\"column8\",\"width\":\"\",\"type\":\"number\"},\"col9\":{\"heading\":\"Column 9\",\"handle\":\"column9\",\"width\":\"\",\"type\":\"time\"},\"col10\":{\"heading\":\"Column 10\",\"handle\":\"column10\",\"width\":\"\",\"type\":\"singleline\"},\"col11\":{\"heading\":\"Column 11\",\"handle\":\"column11\",\"width\":\"\",\"type\":\"url\"}},\"static\":false,\"staticRows\":false,\"addRowLabel\":\"Add row\",\"maxRows\":null,\"minRows\":null,\"defaults\":[],\"columnType\":\"text\",\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:24','2023-09-02 11:34:24','e6db45bc-8114-4d97-b744-d1eabe143b8a'),(67,NULL,'Group','group','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1',NULL,'Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Group','{\"contentTable\":\"{{%fmc__group}}\",\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:24','2023-09-02 11:34:24','8ac0c615-4474-415c-916a-2c7105b6c28d'),(68,NULL,'Single Line Text','singleLineText','formieField:8ac0c615-4474-415c-916a-2c7105b6c28d','ztmiffjd',NULL,1,'none',NULL,'verbb\\formie\\fields\\formfields\\SingleLineText','{\"limit\":false,\"min\":null,\"minType\":null,\"max\":null,\"maxType\":\"characters\",\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":true}','2023-09-02 11:34:24','2023-09-02 11:34:24','0baa85ca-7f29-4398-8879-e8d3f8d7095d'),(69,NULL,'Heading','heading','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1',NULL,'Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Heading','{\"headingSize\":\"h2\",\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:24','2023-09-02 11:34:24','d22e2dda-04a2-4d15-bd8f-52b2f654af7b'),(70,NULL,'Section Label 8c87d454f6b8ad60c607060871764fb3','sectionHandlef63e8fa27dab4d7b0b535ea46ded86ab','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1',NULL,'Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Section','{\"borderStyle\":\"solid\",\"borderWidth\":1,\"borderColor\":\"#ccc\",\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:24','2023-09-02 11:34:24','411de20c-71ca-4771-a1a5-5969fc20e4de'),(71,NULL,'HTML','html','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1',NULL,'Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Html','{\"htmlContent\":\"\",\"purifyContent\":true,\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false}','2023-09-02 11:34:24','2023-09-02 11:34:24','e406ea2c-1d13-419a-91e4-435336f6fb59'),(72,NULL,'Entries - Dropdown','entriesDropdown','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1',NULL,'Please fill out this field.',1,'site',NULL,'verbb\\formie\\fields\\formfields\\Entries','{\"searchable\":true,\"matchField\":null,\"placeholder\":\"Select an entry\",\"defaultValue\":[],\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false,\"limitOptions\":null,\"displayType\":\"dropdown\",\"labelSource\":\"title\",\"orderBy\":\"id ASC\",\"multiple\":false,\"allowSelfRelations\":false,\"localizeRelations\":false,\"maxRelations\":null,\"minRelations\":null,\"selectionLabel\":null,\"showSiteMenu\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null,\"maintainHierarchy\":false,\"branchLimit\":null}','2023-09-02 11:34:24','2023-09-02 11:34:24','dce861f7-9ca1-4d2d-aef2-793c0f2b3a19'),(73,NULL,'Entries - Checkboxes','entriesCheckboxes','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1',NULL,'Please fill out this field.',1,'site',NULL,'verbb\\formie\\fields\\formfields\\Entries','{\"searchable\":true,\"matchField\":null,\"placeholder\":\"Select an entry\",\"defaultValue\":[],\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false,\"limitOptions\":null,\"displayType\":\"checkboxes\",\"labelSource\":\"title\",\"orderBy\":\"id ASC\",\"multiple\":false,\"allowSelfRelations\":false,\"localizeRelations\":false,\"maxRelations\":null,\"minRelations\":null,\"selectionLabel\":null,\"showSiteMenu\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null,\"maintainHierarchy\":false,\"branchLimit\":null}','2023-09-02 11:34:24','2023-09-02 11:34:24','7b761e1c-6348-4b7a-8414-06d323066475'),(74,NULL,'Entries - Radio','entriesRadio','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1',NULL,'Please fill out this field.',1,'site',NULL,'verbb\\formie\\fields\\formfields\\Entries','{\"searchable\":true,\"matchField\":null,\"placeholder\":\"Select an entry\",\"defaultValue\":[],\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false,\"limitOptions\":null,\"displayType\":\"radio\",\"labelSource\":\"title\",\"orderBy\":\"id ASC\",\"multiple\":false,\"allowSelfRelations\":false,\"localizeRelations\":false,\"maxRelations\":null,\"minRelations\":null,\"selectionLabel\":null,\"showSiteMenu\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null,\"maintainHierarchy\":false,\"branchLimit\":null}','2023-09-02 11:34:24','2023-09-02 11:34:24','bc26421e-afbb-4e1d-b8fd-982019e9409c'),(75,NULL,'Categories','categories','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1',NULL,'Please fill out this field.',1,'site',NULL,'verbb\\formie\\fields\\formfields\\Categories','{\"searchable\":true,\"rootCategory\":null,\"showStructure\":false,\"matchField\":null,\"placeholder\":\"Select a category\",\"defaultValue\":[],\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false,\"limitOptions\":null,\"displayType\":\"dropdown\",\"labelSource\":\"id\",\"orderBy\":\"id ASC\",\"multiple\":false,\"allowSelfRelations\":false,\"localizeRelations\":false,\"maxRelations\":null,\"minRelations\":null,\"selectionLabel\":null,\"showSiteMenu\":false,\"source\":\"group:12530c06-549d-4664-97d3-2a96906bde12\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null,\"maintainHierarchy\":true,\"branchLimit\":null}','2023-09-02 11:34:24','2023-09-02 11:34:24','72a6f458-76c5-4d31-93f8-2693d31f7b9a'),(76,NULL,'Tags','tags','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1',NULL,'Please fill out this field.',1,'site',NULL,'verbb\\formie\\fields\\formfields\\Tags','{\"searchable\":true,\"matchField\":null,\"placeholder\":\"Select a tag\",\"defaultValue\":[],\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false,\"limitOptions\":null,\"displayType\":\"dropdown\",\"labelSource\":\"title\",\"orderBy\":\"title ASC\",\"multiple\":false,\"allowSelfRelations\":false,\"localizeRelations\":false,\"maxRelations\":null,\"minRelations\":null,\"selectionLabel\":null,\"showSiteMenu\":false,\"source\":\"taggroup:9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null,\"maintainHierarchy\":false,\"branchLimit\":null}','2023-09-02 11:34:24','2023-09-02 11:34:24','23b442e2-4a42-49de-b941-3b1c218636cf'),(77,NULL,'Users','users','formie:a804f03c-9345-4aba-9c7e-e49a54f390c1',NULL,'Please fill out this field.',1,'site',NULL,'verbb\\formie\\fields\\formfields\\Users','{\"searchable\":true,\"matchField\":null,\"placeholder\":\"Select a user\",\"defaultValue\":[],\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":false,\"conditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableContentEncryption\":false,\"visibility\":null,\"formId\":null,\"isNested\":false,\"limitOptions\":null,\"displayType\":\"dropdown\",\"labelSource\":\"fullName\",\"orderBy\":\"id ASC\",\"multiple\":false,\"allowSelfRelations\":false,\"localizeRelations\":false,\"maxRelations\":null,\"minRelations\":null,\"selectionLabel\":null,\"showSiteMenu\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null,\"maintainHierarchy\":false,\"branchLimit\":null}','2023-09-02 11:34:24','2023-09-02 11:34:24','5c472db1-1707-4189-9b42-ee0c8517aaae');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fmc__group`
--

DROP TABLE IF EXISTS `fmc__group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fmc__group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `field_singleLineText_ztmiffjd` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ahnoihrwgnvwxzqqanbfdlrnhpiwgacyspzz` (`elementId`,`siteId`),
  KEY `fk_ikszgdfgjyfoyidzqaqjhfkibfmzjgyitwhq` (`siteId`),
  CONSTRAINT `fk_ikszgdfgjyfoyidzqaqjhfkibfmzjgyitwhq` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_iqilojkitmwioymkualnyekbhpvluqitwbhn` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fmc__group`
--

LOCK TABLES `fmc__group` WRITE;
/*!40000 ALTER TABLE `fmc__group` DISABLE KEYS */;
/*!40000 ALTER TABLE `fmc__group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fmc__repeater`
--

DROP TABLE IF EXISTS `fmc__repeater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fmc__repeater` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `field_singleLineText_iwxbemtd` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fsjuxnatrlwnyrcwycikfnrizgjikqfnmrjd` (`elementId`,`siteId`),
  KEY `fk_atonyxqwzaucuvyhpfntwtffckpfyagfdfxl` (`siteId`),
  CONSTRAINT `fk_atonyxqwzaucuvyhpfntwtffckpfyagfdfxl` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_lqsvyfgvjwfdrsppemyjhpczytszryosyxwe` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fmc__repeater`
--

LOCK TABLES `fmc__repeater` WRITE;
/*!40000 ALTER TABLE `fmc__repeater` DISABLE KEYS */;
/*!40000 ALTER TABLE `fmc__repeater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fmc_contactform`
--

DROP TABLE IF EXISTS `fmc_contactform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fmc_contactform` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `field_yourName_wfoqhoys` text COLLATE utf8mb3_unicode_ci,
  `field_emailAddress_zedkdxnz` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `field_message_anpfmdrt` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uiiyzanzjzpbzeiqryxcdvpotitohnvcsitx` (`elementId`,`siteId`),
  KEY `fk_sfznemleofifqyvlenpywuizkbnxaafuryxc` (`siteId`),
  CONSTRAINT `fk_owixrokzbfzfqbzxolvpzodikcpbhgyevlhj` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sfznemleofifqyvlenpywuizkbnxaafuryxc` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fmc_contactform`
--

LOCK TABLES `fmc_contactform` WRITE;
/*!40000 ALTER TABLE `fmc_contactform` DISABLE KEYS */;
/*!40000 ALTER TABLE `fmc_contactform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fmc_fieldsdemo`
--

DROP TABLE IF EXISTS `fmc_fieldsdemo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fmc_fieldsdemo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `field_singleLineText_stxyhxuq` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `field_multiLineText_rlyleqcg` text COLLATE utf8mb3_unicode_ci,
  `field_radioButtons_vvcuvxgl` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `field_checkboxes_fhlljkeg` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `field_dropdown_shomclgg` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `field_dropdownMulti_lwxydzmz` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `field_number_ycewvcut` text COLLATE utf8mb3_unicode_ci,
  `field_name1_xnxyjcwz` text COLLATE utf8mb3_unicode_ci,
  `field_nameMulti_apubilmo` text COLLATE utf8mb3_unicode_ci,
  `field_emailAddress_ksljfbcs` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `field_phoneNumber_cpqcmqua` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `field_phoneNumberCountry_hiuggqlo` text COLLATE utf8mb3_unicode_ci,
  `field_agree_omhebvzo` tinyint(1) DEFAULT NULL,
  `field_date_mpgmazyu` datetime DEFAULT NULL,
  `field_address_tznvppqp` text COLLATE utf8mb3_unicode_ci,
  `field_recipientsHidden_ykhycpjf` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `field_recipientsDropdown2_bmatqfmz` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `field_recipientsCheckboxes_edlrdxqp` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `field_recipientsRadio_xfpbsfcp` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `field_hidden_gvwchqyo` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `field_table_gwfnpuih` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ohkdfzxlzriommmwncpgpeinzuflpisztmyn` (`elementId`,`siteId`),
  KEY `fk_jzwezvutsrrjbuqmrpwwhqqmcrrwcvueirqf` (`siteId`),
  CONSTRAINT `fk_jzwezvutsrrjbuqmrpwwhqqmcrrwcvueirqf` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pzbzpyfszcnbxbohxdsfvwciabvfunfrjorl` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fmc_fieldsdemo`
--

LOCK TABLES `fmc_fieldsdemo` WRITE;
/*!40000 ALTER TABLE `fmc_fieldsdemo` DISABLE KEYS */;
/*!40000 ALTER TABLE `fmc_fieldsdemo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_emailtemplates`
--

DROP TABLE IF EXISTS `formie_emailtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_emailtemplates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_emailtemplates`
--

LOCK TABLES `formie_emailtemplates` WRITE;
/*!40000 ALTER TABLE `formie_emailtemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_emailtemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_forms`
--

DROP TABLE IF EXISTS `formie_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_forms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `fieldContentTable` varchar(74) COLLATE utf8mb3_unicode_ci NOT NULL,
  `settings` mediumtext COLLATE utf8mb3_unicode_ci,
  `templateId` int DEFAULT NULL,
  `submitActionEntryId` int DEFAULT NULL,
  `submitActionEntrySiteId` int DEFAULT NULL,
  `defaultStatusId` int DEFAULT NULL,
  `dataRetention` enum('forever','minutes','hours','days','weeks','months','years') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'forever',
  `dataRetentionValue` int DEFAULT NULL,
  `userDeletedAction` enum('retain','delete') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'retain',
  `fileUploadsAction` enum('retain','delete') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'retain',
  `fieldLayoutId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tpijrpvmxefydoasicbszznhmpdpsnvbcrvs` (`templateId`),
  KEY `idx_zymdazokikeonddktetkmxdtmqjvuudmyteo` (`defaultStatusId`),
  KEY `idx_tufknfhpqttezhfyoqvgmpvphcwbqfgxpjfm` (`submitActionEntryId`),
  KEY `idx_kwyyujeokyiqtojgbtgvyzpsaumgcepuoaxm` (`submitActionEntrySiteId`),
  KEY `idx_lbdcycggkypqbbvkfvpcvdfbvzoamgoyzwqg` (`fieldLayoutId`),
  CONSTRAINT `fk_aiffjfzxiycrrxuualsqbazbzyarkpeujfhl` FOREIGN KEY (`defaultStatusId`) REFERENCES `formie_statuses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_coxpnsvzirkuhdcbezphgszaewrpxfguaqwf` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_edyqmtcbwoxwvromgjmoerlarvnqxxisogzf` FOREIGN KEY (`submitActionEntryId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ghncdvfadbhkpltgbtehlqpxwedhpluxzwlu` FOREIGN KEY (`templateId`) REFERENCES `formie_formtemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tybbnldttbfsbasnuqcmztigcglvzxhyhjbc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_forms`
--

LOCK TABLES `formie_forms` WRITE;
/*!40000 ALTER TABLE `formie_forms` DISABLE KEYS */;
INSERT INTO `formie_forms` VALUES (19,'contactForm','{{%fmc_contactform}}','{\"displayFormTitle\":false,\"displayCurrentPageTitle\":false,\"displayPageTabs\":false,\"displayPageProgress\":false,\"scrollToTop\":true,\"progressPosition\":\"end\",\"defaultLabelPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"defaultInstructionsPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"submitMethod\":\"ajax\",\"submitAction\":\"message\",\"submitActionTab\":null,\"submitActionUrl\":null,\"submitActionFormHide\":false,\"submitActionMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Thank you for contacting us! Our team will get in touch shortly to follow up on your message.\\\"}]}]\",\"submitActionMessageTimeout\":null,\"submitActionMessagePosition\":\"top-form\",\"loadingIndicator\":\"spinner\",\"loadingIndicatorText\":null,\"validationOnSubmit\":true,\"validationOnFocus\":true,\"errorMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Couldn’t save submission due to errors.\\\"}]}]\",\"errorMessagePosition\":\"top-form\",\"requireUser\":false,\"requireUserMessage\":null,\"scheduleForm\":false,\"scheduleFormStart\":null,\"scheduleFormEnd\":null,\"scheduleFormPendingMessage\":null,\"scheduleFormExpiredMessage\":null,\"limitSubmissions\":false,\"limitSubmissionsNumber\":null,\"limitSubmissionsType\":null,\"limitSubmissionsMessage\":null,\"integrations\":[],\"submissionTitleFormat\":\"{timestamp}\",\"collectIp\":false,\"collectUser\":false,\"dataRetention\":null,\"dataRetentionValue\":null,\"fileUploadsAction\":null,\"redirectUrl\":null,\"defaultEmailTemplateId\":null,\"disableCaptchas\":false}',NULL,NULL,NULL,1,'forever',NULL,'retain','retain',10,'2023-09-02 11:34:09','2023-09-02 11:34:09','7ddcdd30-9076-4648-8741-6feacee33815'),(20,'fieldsDemo','{{%fmc_fieldsdemo}}','{\"displayFormTitle\":false,\"displayCurrentPageTitle\":false,\"displayPageTabs\":true,\"displayPageProgress\":false,\"scrollToTop\":true,\"progressPosition\":\"start\",\"defaultLabelPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"defaultInstructionsPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"submitMethod\":\"page-reload\",\"submitAction\":\"message\",\"submitActionTab\":null,\"submitActionUrl\":null,\"submitActionFormHide\":false,\"submitActionMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Thanks for your submission.\\\"}]}]\",\"submitActionMessageTimeout\":null,\"submitActionMessagePosition\":\"top-form\",\"loadingIndicator\":\"spinner\",\"loadingIndicatorText\":null,\"validationOnSubmit\":true,\"validationOnFocus\":false,\"errorMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Couldn’t save submission due to errors.\\\"}]}]\",\"errorMessagePosition\":\"top-form\",\"requireUser\":false,\"requireUserMessage\":null,\"scheduleForm\":false,\"scheduleFormStart\":null,\"scheduleFormEnd\":null,\"scheduleFormPendingMessage\":null,\"scheduleFormExpiredMessage\":null,\"limitSubmissions\":false,\"limitSubmissionsNumber\":null,\"limitSubmissionsType\":null,\"limitSubmissionsMessage\":null,\"integrations\":[],\"submissionTitleFormat\":\"{timestamp}\",\"collectIp\":false,\"collectUser\":false,\"dataRetention\":null,\"dataRetentionValue\":null,\"fileUploadsAction\":null,\"redirectUrl\":null,\"defaultEmailTemplateId\":null,\"disableCaptchas\":false}',NULL,NULL,NULL,1,'forever',NULL,'retain','retain',13,'2023-09-02 11:34:24','2023-09-02 11:34:24','a804f03c-9345-4aba-9c7e-e49a54f390c1');
/*!40000 ALTER TABLE `formie_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_formtemplates`
--

DROP TABLE IF EXISTS `formie_formtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_formtemplates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `useCustomTemplates` tinyint(1) DEFAULT '1',
  `outputCssLayout` tinyint(1) DEFAULT '1',
  `outputCssTheme` tinyint(1) DEFAULT '1',
  `outputJsBase` tinyint(1) DEFAULT '1',
  `outputJsTheme` tinyint(1) DEFAULT '1',
  `outputCssLocation` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `outputJsLocation` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sfalskxylfkfhwvqrjmaovwmvgyunsipmsud` (`fieldLayoutId`),
  CONSTRAINT `fk_biriwnvfhgkmhmizrisfvnttiastkrowgikj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_formtemplates`
--

LOCK TABLES `formie_formtemplates` WRITE;
/*!40000 ALTER TABLE `formie_formtemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_formtemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_integrations`
--

DROP TABLE IF EXISTS `formie_integrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_integrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `enabled` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'true',
  `settings` text COLLATE utf8mb3_unicode_ci,
  `cache` longtext COLLATE utf8mb3_unicode_ci,
  `tokenId` int DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_integrations`
--

LOCK TABLES `formie_integrations` WRITE;
/*!40000 ALTER TABLE `formie_integrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_integrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_nested`
--

DROP TABLE IF EXISTS `formie_nested`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_nested` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cgnncebiijwvtekkoezfpwjjkkexwlaezzwn` (`fieldId`),
  KEY `idx_vtoqraloxwowvsozhjvxeqfxdkiougycmkiw` (`fieldLayoutId`),
  CONSTRAINT `fk_cezyqawkujsvbhneqscrwuxshkgetlcfcdea` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gwihrdptxjbjnyeieywotplfrjgrcotvzgms` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_nested`
--

LOCK TABLES `formie_nested` WRITE;
/*!40000 ALTER TABLE `formie_nested` DISABLE KEYS */;
INSERT INTO `formie_nested` VALUES (1,64,11,'2023-09-02 11:34:24','2023-09-02 11:34:24','edaf9b45-38c6-4d54-9b94-bed8a4bed7b6'),(2,67,12,'2023-09-02 11:34:24','2023-09-02 11:34:24','fa7df2a8-739b-4743-9c7a-5d58f1092c9f');
/*!40000 ALTER TABLE `formie_nested` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_nestedfieldrows`
--

DROP TABLE IF EXISTS `formie_nestedfieldrows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_nestedfieldrows` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ownerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jgcytiqtmothurntpqbrooghlvldjdfgrffu` (`ownerId`),
  KEY `idx_kjyctlfrqpnyiktazddiqoqgkdrcvysoriok` (`fieldId`),
  KEY `idx_zofdodmdlrfpdzoyhvaxipqptdjavwtyvcwr` (`sortOrder`),
  CONSTRAINT `fk_ohcemgihvzvttqtmvrqspcmxrjsmkbgrhyuz` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qdngldwdramigwfebwcyskburbwmniwslsgq` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tfpgzfmmkgytzogkjhnewmchuxjkifyflaef` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_nestedfieldrows`
--

LOCK TABLES `formie_nestedfieldrows` WRITE;
/*!40000 ALTER TABLE `formie_nestedfieldrows` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_nestedfieldrows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_notifications`
--

DROP TABLE IF EXISTS `formie_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `formId` int NOT NULL,
  `templateId` int DEFAULT NULL,
  `pdfTemplateId` int DEFAULT NULL,
  `name` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `subject` text COLLATE utf8mb3_unicode_ci,
  `recipients` enum('email','conditions') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'email',
  `to` text COLLATE utf8mb3_unicode_ci,
  `toConditions` text COLLATE utf8mb3_unicode_ci,
  `cc` text COLLATE utf8mb3_unicode_ci,
  `bcc` text COLLATE utf8mb3_unicode_ci,
  `replyTo` text COLLATE utf8mb3_unicode_ci,
  `replyToName` text COLLATE utf8mb3_unicode_ci,
  `from` text COLLATE utf8mb3_unicode_ci,
  `fromName` text COLLATE utf8mb3_unicode_ci,
  `sender` text COLLATE utf8mb3_unicode_ci,
  `content` text COLLATE utf8mb3_unicode_ci,
  `attachFiles` tinyint(1) DEFAULT '1',
  `attachPdf` tinyint(1) DEFAULT '0',
  `attachAssets` text COLLATE utf8mb3_unicode_ci,
  `enableConditions` tinyint(1) DEFAULT '0',
  `conditions` text COLLATE utf8mb3_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_snniuultlvqnpmcwjugdgdahtvuqjhjvobgo` (`formId`),
  KEY `idx_ghzfrqofuolbkfjvyoaluvnuishlhmwqcjvn` (`templateId`),
  KEY `fk_yxuxowrzmgbzfmsuowwqfoihhittzdsdxqph` (`pdfTemplateId`),
  CONSTRAINT `fk_rpwokjogzhsgevepqnyiyumdnnvrqevktidy` FOREIGN KEY (`templateId`) REFERENCES `formie_emailtemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xthxxxxspdceghelrjsqerqwevaryetxkhef` FOREIGN KEY (`formId`) REFERENCES `formie_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yxuxowrzmgbzfmsuowwqfoihhittzdsdxqph` FOREIGN KEY (`pdfTemplateId`) REFERENCES `formie_pdftemplates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_notifications`
--

LOCK TABLES `formie_notifications` WRITE;
/*!40000 ALTER TABLE `formie_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_pagesettings`
--

DROP TABLE IF EXISTS `formie_pagesettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_pagesettings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int NOT NULL,
  `fieldLayoutTabId` int NOT NULL,
  `settings` text COLLATE utf8mb3_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_siajfhoxrjhbhrskpgkzsybttwbiqkjixymr` (`fieldLayoutTabId`),
  KEY `idx_vshakuybdznbbgtipcqmbxpqcjevbltztxgk` (`fieldLayoutId`),
  CONSTRAINT `fk_febsuulanqtcfzdsheofqnjwtnbggjicbphi` FOREIGN KEY (`fieldLayoutTabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ovgdkszppgamnjqxljgcpndbfefriuectbwz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_pagesettings`
--

LOCK TABLES `formie_pagesettings` WRITE;
/*!40000 ALTER TABLE `formie_pagesettings` DISABLE KEYS */;
INSERT INTO `formie_pagesettings` VALUES (1,10,98,'{\"submitButtonLabel\":\"Contact us\",\"backButtonLabel\":\"Back\",\"showBackButton\":false,\"saveButtonLabel\":\"Save\",\"showSaveButton\":false,\"saveButtonStyle\":\"link\",\"buttonsPosition\":\"left\",\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":null,\"enableNextButtonConditions\":false,\"nextButtonConditions\":[],\"enablePageConditions\":false,\"pageConditions\":[],\"enableJsEvents\":false,\"jsGtmEventOptions\":[]}','2023-09-02 11:34:09','2023-09-02 11:34:09','fdd7d05b-9f44-4035-abf5-0d79724a7e7e'),(2,11,99,'{\"submitButtonLabel\":\"Submit\",\"backButtonLabel\":\"Back\",\"showBackButton\":false,\"saveButtonLabel\":\"Save\",\"showSaveButton\":false,\"saveButtonStyle\":\"link\",\"buttonsPosition\":\"left\",\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":null,\"enableNextButtonConditions\":false,\"nextButtonConditions\":[],\"enablePageConditions\":false,\"pageConditions\":[],\"enableJsEvents\":false,\"jsGtmEventOptions\":[]}','2023-09-02 11:34:24','2023-09-02 11:34:24','ed595d25-eb51-43d3-9a77-cef03572b4b4'),(3,12,100,'{\"submitButtonLabel\":\"Submit\",\"backButtonLabel\":\"Back\",\"showBackButton\":false,\"saveButtonLabel\":\"Save\",\"showSaveButton\":false,\"saveButtonStyle\":\"link\",\"buttonsPosition\":\"left\",\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":null,\"enableNextButtonConditions\":false,\"nextButtonConditions\":[],\"enablePageConditions\":false,\"pageConditions\":[],\"enableJsEvents\":false,\"jsGtmEventOptions\":[]}','2023-09-02 11:34:24','2023-09-02 11:34:24','c33c85d6-0deb-4378-b38e-1477ee398cc8'),(4,13,101,'{\"submitButtonLabel\":\"Next\",\"backButtonLabel\":\"Back\",\"showBackButton\":false,\"saveButtonLabel\":\"Save\",\"showSaveButton\":false,\"saveButtonStyle\":\"link\",\"buttonsPosition\":\"right\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"enableNextButtonConditions\":false,\"nextButtonConditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enablePageConditions\":false,\"pageConditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableJsEvents\":false,\"jsGtmEventOptions\":[]}','2023-09-02 11:34:24','2023-09-02 11:34:24','9cf8c1e0-29c1-4dfe-90f8-44886ec6a1bc'),(5,13,102,'{\"submitButtonLabel\":\"Next\",\"backButtonLabel\":\"Back\",\"showBackButton\":true,\"saveButtonLabel\":\"Save\",\"showSaveButton\":false,\"saveButtonStyle\":\"link\",\"buttonsPosition\":\"left-right\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"enableNextButtonConditions\":false,\"nextButtonConditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enablePageConditions\":false,\"pageConditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableJsEvents\":false,\"jsGtmEventOptions\":[]}','2023-09-02 11:34:24','2023-09-02 11:34:24','09ed1926-c21a-4f71-a1b2-dbf6e6038e05'),(6,13,103,'{\"submitButtonLabel\":\"Finish\",\"backButtonLabel\":\"Back\",\"showBackButton\":true,\"saveButtonLabel\":\"Save\",\"showSaveButton\":false,\"saveButtonStyle\":\"link\",\"buttonsPosition\":\"left-right\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"enableNextButtonConditions\":false,\"nextButtonConditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enablePageConditions\":false,\"pageConditions\":{\"showRule\":\"show\",\"conditionRule\":\"all\",\"conditions\":[]},\"enableJsEvents\":false,\"jsGtmEventOptions\":[]}','2023-09-02 11:34:24','2023-09-02 11:34:24','b268a453-da38-4252-899e-291306c9b434');
/*!40000 ALTER TABLE `formie_pagesettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_payments`
--

DROP TABLE IF EXISTS `formie_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `integrationId` int NOT NULL,
  `submissionId` int NOT NULL,
  `fieldId` int NOT NULL,
  `subscriptionId` int DEFAULT NULL,
  `amount` decimal(14,4) DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` enum('pending','redirect','success','failed','processing') COLLATE utf8mb3_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb3_unicode_ci,
  `note` mediumtext COLLATE utf8mb3_unicode_ci,
  `response` text COLLATE utf8mb3_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fxtanasdoberaleteralasfvtkjlesppefyq` (`integrationId`),
  KEY `idx_atncxscomthwfavaflpcvvqridaxyboyeftf` (`fieldId`),
  KEY `idx_yyofvqikgayiwjvbyhjnkmpdquaedyrshepm` (`reference`),
  KEY `fk_nlqunjuidgtrvqcikwdagrwxgbrnjzdghbcw` (`submissionId`),
  KEY `fk_xzwazrlkvvueagfjnxpnecritvckqdjywyur` (`subscriptionId`),
  CONSTRAINT `fk_kbwgzsnippifqypszwcpwfpogfhixnmpvadr` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mzrpxlkzcqnjoqkodkhmkizdotutauombmkr` FOREIGN KEY (`integrationId`) REFERENCES `formie_integrations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nlqunjuidgtrvqcikwdagrwxgbrnjzdghbcw` FOREIGN KEY (`submissionId`) REFERENCES `formie_submissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xzwazrlkvvueagfjnxpnecritvckqdjywyur` FOREIGN KEY (`subscriptionId`) REFERENCES `formie_payments_subscriptions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_payments`
--

LOCK TABLES `formie_payments` WRITE;
/*!40000 ALTER TABLE `formie_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_payments_plans`
--

DROP TABLE IF EXISTS `formie_payments_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_payments_plans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `integrationId` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `planData` text COLLATE utf8mb3_unicode_ci,
  `isArchived` tinyint(1) NOT NULL,
  `dateArchived` datetime DEFAULT NULL,
  `sortOrder` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qjwzaplaxtaasshampjoehjmjcwwjiunbipt` (`handle`),
  KEY `idx_jfzrchtpjhosgncdxyshldgomjykbrndbevc` (`integrationId`),
  KEY `idx_ibqjrxhluvgyodarwaefibnhxyyufrsybfbp` (`reference`),
  CONSTRAINT `fk_tgibcyaptwgmgncclnxlkwuzkxrzjujcoqfm` FOREIGN KEY (`integrationId`) REFERENCES `formie_integrations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_payments_plans`
--

LOCK TABLES `formie_payments_plans` WRITE;
/*!40000 ALTER TABLE `formie_payments_plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_payments_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_payments_subscriptions`
--

DROP TABLE IF EXISTS `formie_payments_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_payments_subscriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `integrationId` int DEFAULT NULL,
  `submissionId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `planId` int DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `subscriptionData` text COLLATE utf8mb3_unicode_ci,
  `trialDays` int NOT NULL,
  `nextPaymentDate` datetime DEFAULT NULL,
  `hasStarted` tinyint(1) NOT NULL DEFAULT '1',
  `isSuspended` tinyint(1) NOT NULL DEFAULT '0',
  `dateSuspended` datetime DEFAULT NULL,
  `isCanceled` tinyint(1) NOT NULL,
  `dateCanceled` datetime DEFAULT NULL,
  `isExpired` tinyint(1) NOT NULL,
  `dateExpired` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_szixzwkuvzuavipsvgvpglgyxflqmpvnfdkt` (`integrationId`),
  KEY `idx_jnimxxpezbljlfwohxswohvwhixeuouxbakk` (`submissionId`),
  KEY `idx_dycwxsktyurjruwfqgxzqqnvulaibgyilmid` (`fieldId`),
  KEY `idx_bhpvzgyasxicujjhnvehtvtwqhpjjhrvzftj` (`planId`),
  KEY `idx_nbvlscdaphofzjsxtbromeqsojserykihgud` (`reference`),
  KEY `idx_zuhdfbkklvgkzlmlfrqlsrzuwxnzlbhxnjnq` (`nextPaymentDate`),
  KEY `idx_hyrpzgpexikarmwmyncodbpggyhnwpulagoi` (`dateExpired`),
  KEY `idx_vhpalyzqbygbdzxdyzztedmodelalvkwhcsk` (`dateExpired`),
  CONSTRAINT `fk_kutfkjzivrubilzkoitzlkwaihouuirprvtr` FOREIGN KEY (`integrationId`) REFERENCES `formie_integrations` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_mnsqqgwsqumayjbhimdfpsqmvbwqtctzplgx` FOREIGN KEY (`planId`) REFERENCES `formie_payments_plans` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_refharwccaaegfamebjzpotesfcsgyemalkr` FOREIGN KEY (`submissionId`) REFERENCES `formie_submissions` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_zeczkytaddeagelxdslifmlokmmbuphrvqyd` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_payments_subscriptions`
--

LOCK TABLES `formie_payments_subscriptions` WRITE;
/*!40000 ALTER TABLE `formie_payments_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_payments_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_pdftemplates`
--

DROP TABLE IF EXISTS `formie_pdftemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_pdftemplates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `filenameFormat` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_pdftemplates`
--

LOCK TABLES `formie_pdftemplates` WRITE;
/*!40000 ALTER TABLE `formie_pdftemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_pdftemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_relations`
--

DROP TABLE IF EXISTS `formie_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bkkoemixrqkwtrpvbesrixayzwvdrpxldwuo` (`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_grofshgdzxbjxojfyuouyxpiomttoqjeutre` (`sourceId`),
  KEY `idx_fjwvbsuicnkajkitsmginbjppyaccgdnfmks` (`targetId`),
  KEY `idx_monwucrfzqgbdobymnwmuctenoejwzvhbrro` (`sourceSiteId`),
  CONSTRAINT `fk_ckplepcmoszfewvbqdybcfotarikahgzouim` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rnqmpxurgnaaexhjnajcnnujnnuspzzmjigo` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ubfnxslyusjkivykmgbkpddejhrfrkaftggg` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_relations`
--

LOCK TABLES `formie_relations` WRITE;
/*!40000 ALTER TABLE `formie_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_rows`
--

DROP TABLE IF EXISTS `formie_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_rows` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int NOT NULL,
  `fieldLayoutFieldId` int NOT NULL,
  `row` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dlilrymwhczgujotefsvzvdctcegrzvqdpqs` (`fieldLayoutFieldId`),
  KEY `idx_alekwijanrvinzozwpgfzfpafksqsdolhlvb` (`fieldLayoutId`),
  CONSTRAINT `fk_igrffgxvltcurdlmkflmuaziqozesetgtcuv` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_phquvhfdngnyfdinlidvzqqvxuapyqsfwmnr` FOREIGN KEY (`fieldLayoutFieldId`) REFERENCES `fieldlayoutfields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_rows`
--

LOCK TABLES `formie_rows` WRITE;
/*!40000 ALTER TABLE `formie_rows` DISABLE KEYS */;
INSERT INTO `formie_rows` VALUES (1,10,1330,0,'2023-09-02 11:34:09','2023-09-02 11:34:09','7ed5b20f-3321-4d3e-a323-89c086531c45'),(2,10,1331,1,'2023-09-02 11:34:09','2023-09-02 11:34:09','a411e90e-6b0f-461e-853e-60f48bb2d9bf'),(3,10,1332,2,'2023-09-02 11:34:09','2023-09-02 11:34:09','18e3f17d-a341-423b-b42f-598c05416a55'),(4,11,1333,0,'2023-09-02 11:34:24','2023-09-02 11:34:24','4893e4fe-6258-407f-bc2f-99e58ec0ff1d'),(5,12,1334,0,'2023-09-02 11:34:24','2023-09-02 11:34:24','d29db502-334a-4505-8965-f6444a7c498e'),(6,13,1335,0,'2023-09-02 11:34:24','2023-09-02 11:34:24','04c78275-da47-42b6-8f7c-29af83885e1b'),(7,13,1336,1,'2023-09-02 11:34:24','2023-09-02 11:34:24','5324274a-976c-4a55-870c-25b292545040'),(8,13,1337,2,'2023-09-02 11:34:24','2023-09-02 11:34:24','86719941-fe63-4a77-8e79-e7a10846754f'),(9,13,1338,3,'2023-09-02 11:34:24','2023-09-02 11:34:24','7c26c53b-686c-4798-9544-3d158f717574'),(10,13,1339,4,'2023-09-02 11:34:24','2023-09-02 11:34:24','9dae71b3-2eb7-48d0-930b-0481b41e8cde'),(11,13,1340,5,'2023-09-02 11:34:24','2023-09-02 11:34:24','6cc9b963-715a-4c04-a88f-90c06578dafd'),(12,13,1341,6,'2023-09-02 11:34:24','2023-09-02 11:34:24','b086c8f2-57dc-4cd7-a4e2-5a4cb5aa3514'),(13,13,1342,7,'2023-09-02 11:34:24','2023-09-02 11:34:24','62f28494-a133-4930-9c74-39a00a40962a'),(14,13,1343,8,'2023-09-02 11:34:24','2023-09-02 11:34:24','79edbbb5-9796-4fbf-9f2b-2f994d8411d4'),(15,13,1344,9,'2023-09-02 11:34:24','2023-09-02 11:34:24','865194aa-901d-475c-b99a-279633991694'),(16,13,1345,10,'2023-09-02 11:34:24','2023-09-02 11:34:24','f8008da5-f172-4e9b-bd61-8dced86e09ed'),(17,13,1346,11,'2023-09-02 11:34:24','2023-09-02 11:34:24','8144462f-b816-4d54-bee8-19f0e4cb68fd'),(18,13,1347,12,'2023-09-02 11:34:24','2023-09-02 11:34:24','c82054a6-80c8-4223-81c2-e8ea5e084e13'),(19,13,1348,0,'2023-09-02 11:34:24','2023-09-02 11:34:24','9ab04430-b795-4a63-8eef-39e2a074454a'),(20,13,1349,1,'2023-09-02 11:34:24','2023-09-02 11:34:24','3cd63117-31c5-44ba-8c58-80eb63bab70b'),(21,13,1350,2,'2023-09-02 11:34:24','2023-09-02 11:34:24','fc50125c-1440-4908-80eb-0e9065934d61'),(22,13,1351,3,'2023-09-02 11:34:24','2023-09-02 11:34:24','9d089bcc-d27d-48df-91f9-5174012d53e1'),(23,13,1352,4,'2023-09-02 11:34:24','2023-09-02 11:34:24','d4af4b22-7281-41c4-adb1-8562446e9d4e'),(24,13,1353,5,'2023-09-02 11:34:24','2023-09-02 11:34:24','7099c176-e07b-41b7-848d-59fc308311bb'),(25,13,1354,6,'2023-09-02 11:34:24','2023-09-02 11:34:24','8188f3ab-5785-45fd-b7e5-ed7fe1045914'),(26,13,1355,7,'2023-09-02 11:34:24','2023-09-02 11:34:24','9ff97c5a-197b-40f2-a5ea-f140363da547'),(27,13,1356,8,'2023-09-02 11:34:24','2023-09-02 11:34:24','a6e112a4-f2fa-4a80-9374-d6b7f6dbb3e3'),(28,13,1357,9,'2023-09-02 11:34:24','2023-09-02 11:34:24','19463668-618f-4d22-8b64-e76771ec2c75'),(29,13,1358,10,'2023-09-02 11:34:24','2023-09-02 11:34:24','0fc77cbb-8d8e-4fb0-bb47-3930a0f3e4b3'),(30,13,1359,11,'2023-09-02 11:34:24','2023-09-02 11:34:24','2a806477-08cd-4ed7-a0ad-9c4475aeaea4'),(31,13,1360,12,'2023-09-02 11:34:24','2023-09-02 11:34:24','f1e99de8-e56c-4d42-b459-171012005fca'),(32,13,1361,13,'2023-09-02 11:34:24','2023-09-02 11:34:24','9083899c-e8e5-4df1-8e7b-885683aa8597'),(33,13,1362,0,'2023-09-02 11:34:24','2023-09-02 11:34:24','5369c1fd-cf58-4d53-bd0c-3b0337f19b80'),(34,13,1363,1,'2023-09-02 11:34:24','2023-09-02 11:34:24','6433f427-b73b-49c3-bfde-ce776094b507'),(35,13,1364,2,'2023-09-02 11:34:24','2023-09-02 11:34:24','520b89ed-b4a3-462a-82c9-411317bc7cff'),(36,13,1365,3,'2023-09-02 11:34:24','2023-09-02 11:34:24','4eefb2a5-fdab-4929-bc1b-fe795101ae43'),(37,13,1366,4,'2023-09-02 11:34:24','2023-09-02 11:34:24','dad03761-989f-4a15-b069-acc45d3b8a7f'),(38,13,1367,5,'2023-09-02 11:34:24','2023-09-02 11:34:24','079c99dd-2d1a-4a94-b54f-e7362be70b25');
/*!40000 ALTER TABLE `formie_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_sentnotifications`
--

DROP TABLE IF EXISTS `formie_sentnotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_sentnotifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `formId` int DEFAULT NULL,
  `submissionId` int DEFAULT NULL,
  `notificationId` int DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `to` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cc` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bcc` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `replyTo` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `replyToName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `from` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `fromName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sender` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `body` mediumtext COLLATE utf8mb3_unicode_ci,
  `htmlBody` mediumtext COLLATE utf8mb3_unicode_ci,
  `info` text COLLATE utf8mb3_unicode_ci,
  `success` tinyint(1) DEFAULT NULL,
  `message` text COLLATE utf8mb3_unicode_ci,
  `dateCreated` datetime DEFAULT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_ftplcwnozopgfiowarygjbmbxcpwfdvawcnr` (`formId`),
  KEY `fk_hhkxcvphxohjhueknplozisktzlziuduvrck` (`submissionId`),
  KEY `fk_blfhghbmqepfgnqpdkmskxkbzjshsjjyiwuu` (`notificationId`),
  CONSTRAINT `fk_blfhghbmqepfgnqpdkmskxkbzjshsjjyiwuu` FOREIGN KEY (`notificationId`) REFERENCES `formie_notifications` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ftplcwnozopgfiowarygjbmbxcpwfdvawcnr` FOREIGN KEY (`formId`) REFERENCES `formie_forms` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_hhkxcvphxohjhueknplozisktzlziuduvrck` FOREIGN KEY (`submissionId`) REFERENCES `formie_submissions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_nqdevyluzxenmcftdahhwmvnkezpjljzwjqh` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_sentnotifications`
--

LOCK TABLES `formie_sentnotifications` WRITE;
/*!40000 ALTER TABLE `formie_sentnotifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_sentnotifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_statuses`
--

DROP TABLE IF EXISTS `formie_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_statuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `color` enum('green','orange','red','blue','yellow','pink','purple','turquoise','light','grey','black') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'green',
  `description` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `isDefault` tinyint(1) DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_statuses`
--

LOCK TABLES `formie_statuses` WRITE;
/*!40000 ALTER TABLE `formie_statuses` DISABLE KEYS */;
INSERT INTO `formie_statuses` VALUES (1,'New','new','green',NULL,1,1,NULL,'2023-09-02 11:32:23','2023-09-02 11:32:23','db4546f1-7c70-4695-8bab-42fda0481ec6');
/*!40000 ALTER TABLE `formie_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_stencils`
--

DROP TABLE IF EXISTS `formie_stencils`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_stencils` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `data` mediumtext COLLATE utf8mb3_unicode_ci,
  `templateId` int DEFAULT NULL,
  `submitActionEntryId` int DEFAULT NULL,
  `submitActionEntrySiteId` int DEFAULT NULL,
  `defaultStatusId` int DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_upndboqsvelwdflqpqpraoulncwuiujsjjwg` (`templateId`),
  KEY `idx_jdeljjffjgaszcwfonukohudqxldknhhqlnf` (`defaultStatusId`),
  CONSTRAINT `fk_nzaqwghvbxoipcbkbuicvtrkownsfkuxpkax` FOREIGN KEY (`templateId`) REFERENCES `formie_formtemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tcabqexnxlnxanakukiniffcfmirozlloecg` FOREIGN KEY (`defaultStatusId`) REFERENCES `formie_statuses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_stencils`
--

LOCK TABLES `formie_stencils` WRITE;
/*!40000 ALTER TABLE `formie_stencils` DISABLE KEYS */;
INSERT INTO `formie_stencils` VALUES (1,'Contact Form','contactForm','{\"dataRetention\":\"forever\",\"dataRetentionValue\":null,\"fileUploadsAction\":\"retain\",\"notifications\":[{\"attachFiles\":true,\"attachPdf\":false,\"bcc\":null,\"cc\":null,\"conditions\":\"{\\\"sendRule\\\":\\\"send\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"content\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"A user submission has been made on the \\\\\\\"\\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Form Name\\\",\\\"value\\\":\\\"{formName}\\\"}},{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"\\\\\\\" form on \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Site Name\\\",\\\"value\\\":\\\"{siteName}\\\"}},{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\" at \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Timestamp (yyyy-mm-dd hh:mm:ss)\\\",\\\"value\\\":\\\"{timestamp}\\\"}}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Their submission details are:\\\"}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"All Form Fields\\\",\\\"value\\\":\\\"{allFields}\\\"}}]}]\",\"enableConditions\":false,\"enabled\":true,\"formId\":null,\"from\":null,\"fromName\":null,\"id\":\"new981-8077\",\"name\":\"Admin Notification\",\"pdfTemplateId\":null,\"recipients\":\"email\",\"replyTo\":\"{field.emailAddress}\",\"replyToName\":null,\"subject\":\"A new submission was made on \\\"{formName}\\\"\",\"templateId\":null,\"to\":\"{systemEmail}\",\"toConditions\":\"{\\\"toRecipients\\\":[]}\",\"uid\":null},{\"attachFiles\":true,\"attachPdf\":false,\"bcc\":null,\"cc\":null,\"conditions\":\"{\\\"sendRule\\\":\\\"send\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"content\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Thanks again for contacting us. Our team will get back to you as soon as we can.\\\"}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"As a reminder, you submitted the following details at \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Timestamp (yyyy-mm-dd hh:mm:ss)\\\",\\\"value\\\":\\\"{timestamp}\\\"}}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"All Form Fields\\\",\\\"value\\\":\\\"{allFields}\\\"}}]}]\",\"enableConditions\":false,\"enabled\":true,\"formId\":null,\"from\":null,\"fromName\":null,\"id\":\"new7052-5168\",\"name\":\"User Notification\",\"pdfTemplateId\":\"\",\"recipients\":\"email\",\"replyTo\":null,\"replyToName\":null,\"subject\":\"Thanks for contacting us!\",\"templateId\":\"\",\"to\":\"{field.emailAddress}\",\"toConditions\":\"{\\\"toRecipients\\\":[]}\",\"uid\":null}],\"pages\":[{\"id\":\"new1272610411\",\"label\":\"Page 1\",\"notificationFlag\":true,\"rows\":[{\"fields\":[{\"brandNewField\":false,\"handle\":\"yourName\",\"hasLabel\":true,\"id\":\"new7715-7348\",\"label\":\"Your Name\",\"settings\":{\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"firstNameCollapsed\":false,\"firstNameDefaultValue\":\"\",\"firstNameEnabled\":true,\"firstNameLabel\":\"First Name\",\"firstNamePlaceholder\":\"e.g. Peter\",\"firstNameRequired\":true,\"handle\":\"yourName\",\"instructions\":\"Please enter your full name.\",\"instructionsPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"label\":\"Your Name\",\"labelPosition\":\"verbb\\\\formie\\\\positions\\\\Hidden\",\"lastNameCollapsed\":false,\"lastNameDefaultValue\":\"\",\"lastNameEnabled\":true,\"lastNameLabel\":\"Last Name\",\"lastNamePlaceholder\":\"e.g. Sherman\",\"lastNameRequired\":true,\"maxType\":\"characters\",\"middleNameCollapsed\":true,\"middleNameDefaultValue\":\"\",\"middleNameEnabled\":false,\"middleNameLabel\":\"Middle Name\",\"placeholder\":\"Your name\",\"prefixCollapsed\":true,\"prefixDefaultValue\":\"\",\"prefixEnabled\":false,\"prefixLabel\":\"Prefix\",\"subfieldLabelPosition\":\"\",\"useMultipleFields\":true,\"visibility\":\"\"},\"type\":\"verbb\\\\formie\\\\fields\\\\formfields\\\\Name\"}],\"id\":\"new8990-9934\"},{\"fields\":[{\"brandNewField\":false,\"handle\":\"emailAddress\",\"hasLabel\":true,\"id\":\"new6482-9528\",\"label\":\"Email Address\",\"settings\":{\"handle\":\"emailAddress\",\"instructions\":\"Please enter your email so we can get in touch.\",\"instructionsPosition\":\"\",\"label\":\"Email Address\",\"labelPosition\":\"\",\"maxType\":\"characters\",\"placeholder\":\"e.g. psherman@wallaby.com\",\"required\":true},\"type\":\"verbb\\\\formie\\\\fields\\\\formfields\\\\Email\"}],\"id\":\"new9524-8509\"},{\"fields\":[{\"brandNewField\":false,\"handle\":\"message\",\"hasLabel\":true,\"id\":\"new982-7322\",\"label\":\"Message\",\"settings\":{\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"handle\":\"message\",\"instructions\":\"Please enter your comments.\",\"instructionsPosition\":\"\",\"label\":\"Message\",\"labelPosition\":\"\",\"maxType\":\"characters\",\"placeholder\":\"e.g. The reason for my enquiry is...\",\"required\":true,\"visibility\":\"\"},\"type\":\"verbb\\\\formie\\\\fields\\\\formfields\\\\MultiLineText\"}],\"id\":\"new2177-9685\"}],\"settings\":{\"backButtonLabel\":\"Back\",\"buttonsPosition\":\"left\",\"label\":\"Page 1\",\"showBackButton\":false,\"submitButtonLabel\":\"Contact us\"},\"sortOrder\":0}],\"settings\":{\"collectIp\":false,\"collectUser\":false,\"dataRetention\":null,\"dataRetentionValue\":null,\"defaultEmailTemplateId\":null,\"defaultInstructionsPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"defaultLabelPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"disableCaptchas\":false,\"displayCurrentPageTitle\":false,\"displayFormTitle\":false,\"displayPageProgress\":false,\"displayPageTabs\":false,\"errorMessage\":[{\"content\":[{\"text\":\"Couldn’t save submission due to errors.\",\"type\":\"text\"}],\"type\":\"paragraph\"}],\"errorMessagePosition\":\"top-form\",\"fileUploadsAction\":null,\"limitSubmissions\":false,\"limitSubmissionsMessage\":null,\"limitSubmissionsNumber\":null,\"limitSubmissionsType\":null,\"loadingIndicator\":\"spinner\",\"loadingIndicatorText\":null,\"progressPosition\":\"end\",\"redirectUrl\":null,\"requireUser\":false,\"requireUserMessage\":null,\"scheduleForm\":false,\"scheduleFormEnd\":null,\"scheduleFormExpiredMessage\":null,\"scheduleFormPendingMessage\":null,\"scheduleFormStart\":null,\"scrollToTop\":true,\"submissionTitleFormat\":\"{timestamp}\",\"submitAction\":\"message\",\"submitActionFormHide\":false,\"submitActionMessage\":[{\"content\":[{\"text\":\"Thank you for contacting us! Our team will get in touch shortly to follow up on your message.\",\"type\":\"text\"}],\"type\":\"paragraph\"}],\"submitActionMessagePosition\":\"top-form\",\"submitActionMessageTimeout\":null,\"submitActionTab\":null,\"submitActionUrl\":null,\"submitMethod\":\"ajax\",\"validationOnFocus\":true,\"validationOnSubmit\":true},\"userDeletedAction\":\"retain\"}',NULL,NULL,NULL,1,NULL,'2023-09-02 11:32:23','2023-09-02 11:32:23','e100dd43-9a1a-4980-bfb5-806d761f1192');
/*!40000 ALTER TABLE `formie_stencils` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_submissions`
--

DROP TABLE IF EXISTS `formie_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_submissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `formId` int NOT NULL,
  `statusId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `isIncomplete` tinyint(1) DEFAULT '0',
  `isSpam` tinyint(1) DEFAULT '0',
  `spamReason` text COLLATE utf8mb3_unicode_ci,
  `spamClass` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `snapshot` text COLLATE utf8mb3_unicode_ci,
  `ipAddress` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jlzalatmcbsyodwnfeasaiibsshcsnajhvge` (`formId`),
  KEY `idx_ucxeiydyqhsndcvkezjayrwvxghwoblmbsfo` (`statusId`),
  KEY `idx_tighwjsexqleuqjnsyfzemxqwrdqggcamsks` (`userId`),
  CONSTRAINT `fk_crbxzvmeappiaykmifkxnzmwpjufytpkufhu` FOREIGN KEY (`formId`) REFERENCES `formie_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ftzjtdncqbvgmiyxacgjszsznangrqrulwjf` FOREIGN KEY (`statusId`) REFERENCES `formie_statuses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tgbospthuuwwobuzslsllkpgupoqvnymdaxt` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vojikgyizlsgnuybgjfcqntfailqmqkxwatq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_submissions`
--

LOCK TABLES `formie_submissions` WRITE;
/*!40000 ALTER TABLE `formie_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_syncfields`
--

DROP TABLE IF EXISTS `formie_syncfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_syncfields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `syncId` int NOT NULL,
  `fieldId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jaxllpymxcvftheizhexeqwdlhcqtqcxazys` (`syncId`,`fieldId`),
  KEY `fk_osejnqxitwejrnusfvciwjwjccunlfuxwzmr` (`fieldId`),
  CONSTRAINT `fk_osejnqxitwejrnusfvciwjwjccunlfuxwzmr` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zkxlkikrlfffvviubdlylygbogcxnhbtkgjq` FOREIGN KEY (`syncId`) REFERENCES `formie_syncs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_syncfields`
--

LOCK TABLES `formie_syncfields` WRITE;
/*!40000 ALTER TABLE `formie_syncfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_syncfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_syncs`
--

DROP TABLE IF EXISTS `formie_syncs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_syncs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_syncs`
--

LOCK TABLES `formie_syncs` WRITE;
/*!40000 ALTER TABLE `formie_syncs` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_syncs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_tokens`
--

DROP TABLE IF EXISTS `formie_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `accessToken` text COLLATE utf8mb3_unicode_ci,
  `secret` text COLLATE utf8mb3_unicode_ci,
  `endOfLife` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `refreshToken` text COLLATE utf8mb3_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_tokens`
--

LOCK TABLES `formie_tokens` WRITE;
/*!40000 ALTER TABLE `formie_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eivoypliwvdtvkuqxnisjevzqsexneivwqid` (`name`),
  KEY `idx_huzrxfqvktxhbbtsadtrrihhrwmfxravbkue` (`handle`),
  KEY `idx_lpklgwpcsxskosxbotnqtftqgdqkfyhzaneo` (`fieldLayoutId`),
  KEY `idx_plmggfjmsjshtrvudlojncipabncbklczahx` (`sortOrder`),
  CONSTRAINT `fk_faqckdeqbbllwnlrxttvtuatiigpuoexksyc` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_majhvygrrbbjfklmfjbdztdqpryoxdemwtnz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
INSERT INTO `globalsets` VALUES (2,'Demo','demo',5,1,'2021-08-07 00:06:03','2021-08-07 00:06:23','6b96e0b0-0c3f-4de5-8631-0de30b34872c');
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `scope` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
INSERT INTO `gqlschemas` VALUES (1,'Public Schema','[\"elements.drafts:read\",\"elements.revisions:read\",\"elements.inactive:read\",\"sections.fbe2bb47-a84e-4366-b957-3e127152e75a:read\",\"entrytypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818:read\",\"volumes.adf62689-9e99-4040-8bb3-c06de71033be:read\",\"globalsets.6b96e0b0-0c3f-4de5-8631-0de30b34872c:read\",\"usergroups.everyone:read\",\"categorygroups.12530c06-549d-4664-97d3-2a96906bde12:read\",\"taggroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15:read\",\"formieForms.all:read\",\"formieSubmissions.all:read\",\"formieSubmissions.all:edit\",\"formieSubmissions.all:create\",\"formieSubmissions.all:save\",\"formieSubmissions.all:delete\",\"sites.00079eeb-bb55-40b2-867b-65ed3665219f:read\"]',1,'2021-08-07 00:49:15','2023-09-02 11:22:20','e721824b-3a96-44ce-979f-1e77d543df97');
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `accessToken` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asklyfuiahmunprircudngcltyexmuivfjip` (`accessToken`),
  UNIQUE KEY `idx_kelzjgacydregdwizvhxwbcpftcejmplkgxu` (`name`),
  KEY `fk_tkyrhrxwuwfvwhvybqnqdxyvcbxtjkvizfha` (`schemaId`),
  CONSTRAINT `fk_tkyrhrxwuwfvwhvybqnqdxyvcbxtjkvizfha` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
INSERT INTO `gqltokens` VALUES (1,'Public Token','__PUBLIC__',1,NULL,NULL,1,'2021-08-07 00:49:15','2021-08-07 00:49:15','0c1070db-f4fc-44de-9ce3-fb25e555cc99');
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `format` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `transformString` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yidrbyaojfwjutnubdjsyxvmxwcopwluftvy` (`assetId`,`format`,`transformString`),
  KEY `idx_rwtbnqftkmvfffvklvbpbnpjrjjgzqqjdpfy` (`assetId`,`transformString`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagetransformindex`
--

LOCK TABLES `imagetransformindex` WRITE;
/*!40000 ALTER TABLE `imagetransformindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagetransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'none',
  `fill` varchar(11) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wzlpaghvqwsatmumeuxxzlulsruexplgvxgh` (`name`),
  KEY `idx_fsfenqtidmfgpawijevmtaiwtdbaaixcaobe` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'4.5.3','4.5.3.0',0,'flgcqofqilmk','3@sbagqnynzv','2021-08-07 00:01:41','2023-09-02 11:34:24','cd697dc7-510f-48ee-a6ae-505ce136a4bb');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_kzyqsnqwvahcfcizlncgpcqgpbomsqujbksa` (`primaryOwnerId`),
  KEY `idx_tsyqvtisgcitstrwbkaaqwppdbubbzkukavd` (`fieldId`),
  KEY `idx_apzhizzthnkvkevwnsaeljqbctubrvqassoo` (`typeId`),
  CONSTRAINT `fk_dkhkwenbwqufuzovvwgztadzjoumhtvzolck` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gjpjtxhaqbtnfozxngmaxhvsjxsnzgibmyvd` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_smdjqlakpsqgqdkdenmcfywjymsfbkwtjnbo` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yfmfiisnhdbxizxycqsjfkbnltqyogzbhqwy` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocks_owners`
--

DROP TABLE IF EXISTS `matrixblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixblocks_owners` (
  `blockId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_vhavxonrnwkeyrdkxylspzvuhyhnpvgklldp` (`ownerId`),
  CONSTRAINT `fk_purvzjcvmspvklkcbsorrygfqikyjvttizjt` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vhavxonrnwkeyrdkxylspzvuhyhnpvgklldp` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocks_owners`
--

LOCK TABLES `matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `matrixblocks_owners` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixblocktypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_njmaexhnnbnuopqvxseqpdktvgpstzfqpmro` (`name`,`fieldId`),
  KEY `idx_kvwhbofdvmobjzatxjawafmqnztjhduxihja` (`handle`,`fieldId`),
  KEY `idx_jijagerullbobukfiduxflispbozbjyehsqx` (`fieldId`),
  KEY `idx_vmpuwkqarpfpsbdsmtnconnyfapzmldlnfmz` (`fieldLayoutId`),
  CONSTRAINT `fk_lkedjxlzecrkstzppavpxjkfodxpatycmzgk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qquqfbeeppepqwfcxcrfbsofzjlavftikfvw` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gprnbvhnazjtuozpujsedhmugmpdavlmfbpr` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'craft','Install','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','f9ac5b1a-f8c4-419c-b6cf-a278212464de'),(2,'craft','m150403_183908_migrations_table_changes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','5b263962-0010-4101-907d-f8d65b1a7642'),(3,'craft','m150403_184247_plugins_table_changes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','2e9d7105-2bb2-4012-9833-da601466c547'),(4,'craft','m150403_184533_field_version','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','bb080343-bb1d-45ed-9d73-2231a3aeb825'),(5,'craft','m150403_184729_type_columns','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','8cdd1fb3-61a3-46a8-afba-694bfd295e04'),(6,'craft','m150403_185142_volumes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','1885f310-91ee-47a1-8826-c58803a71583'),(7,'craft','m150428_231346_userpreferences','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','b2db7149-df65-4084-a10e-5704c3aade35'),(8,'craft','m150519_150900_fieldversion_conversion','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','fe24575a-b76b-4427-b8a2-d08d43cb68eb'),(9,'craft','m150617_213829_update_email_settings','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','c85bdecb-ac03-4609-b8df-d4234f1c5ed7'),(10,'craft','m150721_124739_templatecachequeries','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','4b1aa132-b586-476d-817e-06147a6cbc7b'),(11,'craft','m150724_140822_adjust_quality_settings','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','4b196944-f014-40f0-8bcc-289e2fcd5149'),(12,'craft','m150815_133521_last_login_attempt_ip','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','0cf16683-e33a-4a18-8a67-df6b67c4eb8a'),(13,'craft','m151002_095935_volume_cache_settings','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','762cbe47-aceb-4bbd-af0a-8726ddeebd45'),(14,'craft','m151005_142750_volume_s3_storage_settings','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','75734461-83fd-4270-abf2-2af148cd75f0'),(15,'craft','m151016_133600_delete_asset_thumbnails','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','215f6dd5-9dca-458b-bae5-b35024fcd4ac'),(16,'craft','m151209_000000_move_logo','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','80ecfdff-6eb0-4280-88a8-d1ecb806db7c'),(17,'craft','m151211_000000_rename_fileId_to_assetId','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','0168d041-57a0-458a-a639-608e8a201b14'),(18,'craft','m151215_000000_rename_asset_permissions','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','28625910-11dc-4e92-bc44-6dabfd02bc84'),(19,'craft','m160707_000001_rename_richtext_assetsource_setting','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','32b823f8-867d-49d4-8169-20c019ea9337'),(20,'craft','m160708_185142_volume_hasUrls_setting','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','a6785e4e-22d9-4dde-891c-710eee65a13a'),(21,'craft','m160714_000000_increase_max_asset_filesize','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','ec7e9691-bb7f-46b2-a2b9-ba6472476842'),(22,'craft','m160727_194637_column_cleanup','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','f5810661-36bf-4ebd-918e-1fbcc575a885'),(23,'craft','m160804_110002_userphotos_to_assets','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','b20f44b3-b8f2-4bfb-bbf8-f8e2298a8cfc'),(24,'craft','m160807_144858_sites','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','b83bbcea-719d-43f5-ba3a-0d64eee67327'),(25,'craft','m160829_000000_pending_user_content_cleanup','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','9a0692e7-5eb8-4995-ab15-e1ce5113b4d5'),(26,'craft','m160830_000000_asset_index_uri_increase','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','3ce3e3e6-45c9-444f-9fdf-2477f96cd2b5'),(27,'craft','m160912_230520_require_entry_type_id','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','edee6b72-f21a-451d-840f-d04c89afff96'),(28,'craft','m160913_134730_require_matrix_block_type_id','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','89c2a7a9-0095-446d-9746-777c79a634e3'),(29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','9d6a50ac-a797-4abd-a5b2-04d59639449e'),(30,'craft','m160920_231045_usergroup_handle_title_unique','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','6f1a1134-91b6-4e92-b580-d612208da004'),(31,'craft','m160925_113941_route_uri_parts','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','896471cb-8efd-41c7-b035-9cbc45e64446'),(32,'craft','m161006_205918_schemaVersion_not_null','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','321326bf-7e17-429c-8561-827ea754c3c8'),(33,'craft','m161007_130653_update_email_settings','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','fe88e94b-a49a-4c09-a33f-a387cb65f91c'),(34,'craft','m161013_175052_newParentId','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','fdde0456-ecb6-44f8-88fc-eb062fa21009'),(35,'craft','m161021_102916_fix_recent_entries_widgets','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','925e52ed-011b-4418-b2e4-694b1265913d'),(36,'craft','m161021_182140_rename_get_help_widget','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','8ce34d49-1fb3-4a45-9536-6c4580ca1821'),(37,'craft','m161025_000000_fix_char_columns','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','a7e55d9d-c0c7-4606-85c3-84e18f0d01cd'),(38,'craft','m161029_124145_email_message_languages','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','bbf12539-5e81-49e2-b2d2-b25deaa1d455'),(39,'craft','m161108_000000_new_version_format','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','435fa87d-94f5-4f38-b807-78109ee036e4'),(40,'craft','m161109_000000_index_shuffle','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','28e97557-5de0-4fb9-9c5f-1521489dd92c'),(41,'craft','m161122_185500_no_craft_app','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','febfe338-bf3d-4927-a4b8-3d0ba23176b7'),(42,'craft','m161125_150752_clear_urlmanager_cache','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','730febb5-d9a1-45e2-b9c8-b17eef549571'),(43,'craft','m161220_000000_volumes_hasurl_notnull','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','c236054f-a5d9-467a-8044-e6385f2edce9'),(44,'craft','m170114_161144_udates_permission','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','33308869-a4c7-4813-afc1-e440b8fb9ec7'),(45,'craft','m170120_000000_schema_cleanup','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','da121b83-6e51-40e7-bcc2-6c8677645491'),(46,'craft','m170126_000000_assets_focal_point','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','827f887d-ed89-45c2-80c4-c27b3685ea2d'),(47,'craft','m170206_142126_system_name','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','c46c3465-7cb1-425d-b41e-10476d1b5f67'),(48,'craft','m170217_044740_category_branch_limits','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','cf604be1-4277-4bf6-a3d6-d5932b12cd24'),(49,'craft','m170217_120224_asset_indexing_columns','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','1151cd24-14d9-4aaf-8bb0-c8db10922027'),(50,'craft','m170223_224012_plain_text_settings','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','45b69814-38e1-4f41-92e7-20dd710e6724'),(51,'craft','m170227_120814_focal_point_percentage','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','f13df08b-f89e-4e1a-84bd-4afc1cb01866'),(52,'craft','m170228_171113_system_messages','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','57fcd576-21c2-4317-aca1-e5839b9e9718'),(53,'craft','m170303_140500_asset_field_source_settings','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','fb94d2c1-7767-47a0-88a5-3d410f315110'),(54,'craft','m170306_150500_asset_temporary_uploads','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','14ab0146-5a46-4ec5-bef6-5d1c6ca1dc37'),(55,'craft','m170523_190652_element_field_layout_ids','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','9aa2e034-3083-46ce-bdcb-365d47181f27'),(56,'craft','m170621_195237_format_plugin_handles','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','31e4c481-9cc8-47ca-9891-63310120ebb1'),(57,'craft','m170630_161027_deprecation_line_nullable','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','b95912ff-c260-4d10-95fc-9eaeda1fc674'),(58,'craft','m170630_161028_deprecation_changes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','737e6d97-c104-48a2-81ec-98c8e03e9066'),(59,'craft','m170703_181539_plugins_table_tweaks','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','e282bbad-0a57-402c-b5be-f12bcee9edc6'),(60,'craft','m170704_134916_sites_tables','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','256320d4-0ccb-43ea-aead-d9ff661bc0ff'),(61,'craft','m170706_183216_rename_sequences','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','335e3ed9-7d43-4b7a-bed2-7298931e1692'),(62,'craft','m170707_094758_delete_compiled_traits','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','a54c2531-29e1-4f18-9bd3-12f7e5cebfcb'),(63,'craft','m170731_190138_drop_asset_packagist','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','b0124e2d-e8f0-400a-9f9b-3b262b1c10bc'),(64,'craft','m170810_201318_create_queue_table','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','a17f6987-c3ec-4b5b-977d-9451d374586e'),(65,'craft','m170903_192801_longblob_for_queue_jobs','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','0e6da7fa-eaf0-4286-965e-2913ffa9b5b2'),(66,'craft','m170914_204621_asset_cache_shuffle','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','ea6eb571-668a-411e-b4ae-ccbe9a35447a'),(67,'craft','m171011_214115_site_groups','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','1ba823ee-a68e-48f2-a51e-2bc6e55aeca6'),(68,'craft','m171012_151440_primary_site','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','d0e748df-60ba-4a47-bc06-f3c29c1c7931'),(69,'craft','m171013_142500_transform_interlace','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','35d10528-b486-4370-a371-0c1a2e002d73'),(70,'craft','m171016_092553_drop_position_select','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','e02a1d1e-11b3-42d5-b829-5acbb7ffc286'),(71,'craft','m171016_221244_less_strict_translation_method','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','7a122a5e-9366-4a08-b1cf-6fb7019e39a2'),(72,'craft','m171107_000000_assign_group_permissions','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','5d6cee17-836b-49b1-9b1c-ec29c707a9fb'),(73,'craft','m171117_000001_templatecache_index_tune','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','a7eb5c73-b65b-4461-af6f-7246ff7d95a3'),(74,'craft','m171126_105927_disabled_plugins','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','938b2be3-d1dd-426b-acc9-6954c85ac995'),(75,'craft','m171130_214407_craftidtokens_table','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','18b894d6-b092-4281-b833-01c461f65b76'),(76,'craft','m171202_004225_update_email_settings','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','d40351dc-7c40-44fb-a400-def82c08368a'),(77,'craft','m171204_000001_templatecache_index_tune_deux','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','1a2e6c2e-ef67-4be4-8b22-d3c4aaff163b'),(78,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','340a6a2c-100a-4572-a0b0-f476ec64b0e1'),(79,'craft','m171218_143135_longtext_query_column','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','c18db377-7f27-4578-bf33-621d51e00c14'),(80,'craft','m171231_055546_environment_variables_to_aliases','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','d086d163-c3ed-4265-adbf-7025169a8ef8'),(81,'craft','m180113_153740_drop_users_archived_column','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','f6c6162d-679b-4f98-b6f0-e39496cc12e7'),(82,'craft','m180122_213433_propagate_entries_setting','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','ce78f049-f7be-4720-a8a3-893055fb9fa7'),(83,'craft','m180124_230459_fix_propagate_entries_values','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','35d6c1ff-41eb-41b0-a569-e754eb07a906'),(84,'craft','m180128_235202_set_tag_slugs','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','53e02599-d053-4126-83ca-0807bc202f0a'),(85,'craft','m180202_185551_fix_focal_points','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','74b47214-5254-4c1b-9a6f-4c60c34cdb8f'),(86,'craft','m180217_172123_tiny_ints','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','14edcbe8-4cf0-47aa-8c31-aee74b3ccaa1'),(87,'craft','m180321_233505_small_ints','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','1e715ede-9990-4336-a3dd-7f3b1290ec3e'),(88,'craft','m180404_182320_edition_changes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','cb904893-6e61-46e3-b3a9-5a550748bd92'),(89,'craft','m180411_102218_fix_db_routes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','efed1350-1b0a-4bb0-abdc-5880b970724e'),(90,'craft','m180416_205628_resourcepaths_table','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','5214dca8-c89a-49be-8d8c-58da8efaa92b'),(91,'craft','m180418_205713_widget_cleanup','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','55cbafd6-96fc-4664-8980-a3793b1d8f5d'),(92,'craft','m180425_203349_searchable_fields','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','4c6cfff6-ef9c-488f-a362-847acc8121e2'),(93,'craft','m180516_153000_uids_in_field_settings','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','85051aaa-ff6d-4964-89dc-a70c07b1373c'),(94,'craft','m180517_173000_user_photo_volume_to_uid','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','88aef550-9e98-4d8b-acea-eb34a77f3072'),(95,'craft','m180518_173000_permissions_to_uid','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','2f91a2d1-3470-43bc-907b-091f4ce01210'),(96,'craft','m180520_173000_matrix_context_to_uids','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','a01afecb-f729-4a76-8877-4be118f8dddc'),(97,'craft','m180521_172900_project_config_table','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','9ac64dcb-d3f2-4fb7-9c63-4fc8241518f2'),(98,'craft','m180521_173000_initial_yml_and_snapshot','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','8ea062db-ecdb-468f-8384-63fa5ac09f78'),(99,'craft','m180731_162030_soft_delete_sites','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','c6fa54aa-0b9e-42b8-8ab3-713aeace4b10'),(100,'craft','m180810_214427_soft_delete_field_layouts','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','87885a3b-452b-4016-9da7-f6ef2a7e623d'),(101,'craft','m180810_214439_soft_delete_elements','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','a2cb940d-a30d-41ee-837c-759595499e1e'),(102,'craft','m180824_193422_case_sensitivity_fixes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','462f9f43-6ca7-43d7-a7f0-f68d3854d329'),(103,'craft','m180901_151639_fix_matrixcontent_tables','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','a8e37b1a-a181-4dd9-b946-8cdd7f505230'),(104,'craft','m180904_112109_permission_changes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','486a8331-5183-496e-ae69-4e532be66c04'),(105,'craft','m180910_142030_soft_delete_sitegroups','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','7272d08e-a682-41aa-8349-06cba6943af2'),(106,'craft','m181011_160000_soft_delete_asset_support','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','3da89369-84a9-48f1-95d8-6b5553f0b449'),(107,'craft','m181016_183648_set_default_user_settings','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','5c9cb1ec-ea84-401c-8c27-f8c994ec432a'),(108,'craft','m181017_225222_system_config_settings','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','cf1ab282-fade-4023-8733-920aa063a05a'),(109,'craft','m181018_222343_drop_userpermissions_from_config','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','f949d540-4ba7-4a46-96e9-1c95ed8c1a13'),(110,'craft','m181029_130000_add_transforms_routes_to_config','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','b6ce081c-fbed-4d17-aa89-9d2efd88631e'),(111,'craft','m181112_203955_sequences_table','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','1d0cc342-6fe2-46b0-9b06-367d92f54549'),(112,'craft','m181121_001712_cleanup_field_configs','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','3e9b8e0d-e4b0-40a0-90d3-1566a246f576'),(113,'craft','m181128_193942_fix_project_config','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','5b61c374-d41c-44e4-8939-725edd7bc483'),(114,'craft','m181130_143040_fix_schema_version','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','d479599e-7210-4823-8889-d644fb8d263b'),(115,'craft','m181211_143040_fix_entry_type_uids','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','667353e9-20f5-4ec4-8c4d-c1e4851948d8'),(116,'craft','m181217_153000_fix_structure_uids','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','9dcd223c-8a86-4d80-9f56-21911b5482c5'),(117,'craft','m190104_152725_store_licensed_plugin_editions','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','d9990544-d4cd-4b4c-bd73-bf0af822d8ab'),(118,'craft','m190108_110000_cleanup_project_config','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','dd4c4d34-2538-47f9-9ab3-fb743f72be43'),(119,'craft','m190108_113000_asset_field_setting_change','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','18ef5355-37e4-4002-943f-032d981c4005'),(120,'craft','m190109_172845_fix_colspan','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','11df82e3-5a25-4972-97b0-baf5463e107b'),(121,'craft','m190110_150000_prune_nonexisting_sites','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','3ef527de-3db2-47d3-9118-d1314a33b3c5'),(122,'craft','m190110_214819_soft_delete_volumes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','832730ae-c77b-41e8-8d52-acf7d5fa57bc'),(123,'craft','m190112_124737_fix_user_settings','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','60643442-14f5-4ec9-bde4-faaf99912271'),(124,'craft','m190112_131225_fix_field_layouts','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','a6cbcd07-a7a2-433e-ad11-2b66a6fef24e'),(125,'craft','m190112_201010_more_soft_deletes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','fa63ab54-dcf0-4eab-8b1f-6645fd4e8895'),(126,'craft','m190114_143000_more_asset_field_setting_changes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','7ccc8981-bad0-40e7-bba1-849ce74189e0'),(127,'craft','m190121_120000_rich_text_config_setting','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','bbf3842d-dcde-4686-a1ac-c3ad3a4f83ae'),(128,'craft','m190125_191628_fix_email_transport_password','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','bdb3f21e-42c8-4f7a-b55f-cfe82d109093'),(129,'craft','m190128_181422_cleanup_volume_folders','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','d719820e-c09c-4527-a84c-549ebf9b464a'),(130,'craft','m190205_140000_fix_asset_soft_delete_index','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','613a6e36-fc63-4858-8aaa-cea1d6a6be9e'),(131,'craft','m190218_143000_element_index_settings_uid','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','44584d6d-e80b-4d1d-a04a-a17b9fb118ba'),(132,'craft','m190312_152740_element_revisions','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','131c2894-0696-4e2d-9b44-cfdbb6a74e4c'),(133,'craft','m190327_235137_propagation_method','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','0d15b925-43cc-4bd0-9016-1c4a1f9eb2b1'),(134,'craft','m190401_223843_drop_old_indexes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','0d926fa5-391f-448c-bff5-ea57fa5e72ed'),(135,'craft','m190416_014525_drop_unique_global_indexes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','de34c7b9-f935-4ec8-b72d-ed76f301e1d5'),(136,'craft','m190417_085010_add_image_editor_permissions','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','c9569a5e-2c61-4623-ba0e-ec3c716776e7'),(137,'craft','m190502_122019_store_default_user_group_uid','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','0d26c52d-5812-4661-8ec7-8d6df9c97a6f'),(138,'craft','m190504_150349_preview_targets','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','038ffa13-c360-430f-9d62-e63a73f27c81'),(139,'craft','m190516_184711_job_progress_label','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','3f9bdca1-2676-4cf3-91c8-e72082d03bfa'),(140,'craft','m190523_190303_optional_revision_creators','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','0966befb-6f2a-4d4f-b40a-dac4fda0f04f'),(141,'craft','m190529_204501_fix_duplicate_uids','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','9e468bdd-21b9-4921-9e80-d9b74de03657'),(142,'craft','m190605_223807_unsaved_drafts','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','860a2ddc-f12a-4d78-b8b2-93f43c18c189'),(143,'craft','m190607_230042_entry_revision_error_tables','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','1e8cb35d-f505-4452-b145-a5888b6ffeac'),(144,'craft','m190608_033429_drop_elements_uid_idx','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','a56d840d-7990-4e13-a148-f5e06bfd40e1'),(145,'craft','m190617_164400_add_gqlschemas_table','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','257a77ca-11a2-4f8a-a5ce-95cb29c02382'),(146,'craft','m190624_234204_matrix_propagation_method','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','8908e54c-5936-42e7-9ee8-6ba17a246c5f'),(147,'craft','m190711_153020_drop_snapshots','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','07ec4bde-388b-4caa-a194-b2c59e9f86ed'),(148,'craft','m190712_195914_no_draft_revisions','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','a1a97aae-cc26-4be1-a8b1-e2e04d58ed71'),(149,'craft','m190723_140314_fix_preview_targets_column','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','e24e333b-7559-4f00-80c2-f09235344045'),(150,'craft','m190820_003519_flush_compiled_templates','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','83a1c942-036e-42d4-8c4d-73f6e1194486'),(151,'craft','m190823_020339_optional_draft_creators','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','b2744b78-552a-4e45-af71-478c8fcdc43b'),(152,'craft','m190913_152146_update_preview_targets','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','0c3a59e9-7298-4ab2-af93-778b1e8df67b'),(153,'craft','m191107_122000_add_gql_project_config_support','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','eaa2620a-939a-4b7f-8f95-cb1cf030d723'),(154,'craft','m191204_085100_pack_savable_component_settings','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','154d6d62-53fc-4dbd-b489-48ebd339f78c'),(155,'craft','m191206_001148_change_tracking','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','59531653-7cd7-4352-85ad-2228a349b2da'),(156,'craft','m191216_191635_asset_upload_tracking','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','5a296dc7-1374-4c7a-8571-16ed6891e0e5'),(157,'craft','m191222_002848_peer_asset_permissions','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','76a6e2d4-be12-4e93-88ea-397f4a7c0309'),(158,'craft','m200127_172522_queue_channels','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','94ef9dee-1378-44c2-9254-8d4ab210336c'),(159,'craft','m200211_175048_truncate_element_query_cache','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','2855c71b-0437-423e-b86f-2840475b502a'),(160,'craft','m200213_172522_new_elements_index','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','ebc9d79d-ca70-47c6-9507-ead69d12a69e'),(161,'craft','m200228_195211_long_deprecation_messages','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','1576e7b9-523d-4cf2-b52c-528071e7ce8b'),(162,'craft','m200306_054652_disabled_sites','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','b744e4e6-81c2-4b19-af8e-0d8bdf02dbf6'),(163,'craft','m200522_191453_clear_template_caches','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','6d2e3be3-d43f-4813-8766-2b3fad6bcbbc'),(164,'craft','m200606_231117_migration_tracks','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','fecc7312-f007-4a9d-a819-2f0eecc89485'),(165,'craft','m200619_215137_title_translation_method','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','04140f6a-cba4-4331-8ad8-ff20ee4df5f6'),(166,'craft','m200620_005028_user_group_descriptions','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','cfced342-503b-4f48-865a-d9b8eb39c0c7'),(167,'craft','m200620_230205_field_layout_changes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','d43257f4-60f8-46ff-912e-ae19282c58ea'),(168,'craft','m200625_131100_move_entrytypes_to_top_project_config','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','2f7f45ad-210b-4924-b7e9-7f8b691c1202'),(169,'craft','m200629_112700_remove_project_config_legacy_files','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','1e960048-75b4-4bd4-9b7c-3c0b65f19473'),(170,'craft','m200630_183000_drop_configmap','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','146ed8a1-7169-4967-b975-d5988645944a'),(171,'craft','m200715_113400_transform_index_error_flag','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','7fa4eea0-7baf-4037-8d73-611c17598b85'),(172,'craft','m200716_110900_replace_file_asset_permissions','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','4b1bf38d-af7d-4868-8d27-fefe50b14488'),(173,'craft','m200716_153800_public_token_settings_in_project_config','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','1905a6de-4f92-4c84-b40c-12e2becae906'),(174,'craft','m200720_175543_drop_unique_constraints','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','60d54193-891f-4437-9903-f8eb505c409a'),(175,'craft','m200825_051217_project_config_version','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','ad816618-07e4-436a-af8a-8434d0c63a4d'),(176,'craft','m201116_190500_asset_title_translation_method','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','bb0978f6-4439-42ed-aad7-5a468f9fbf78'),(177,'craft','m201124_003555_plugin_trials','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','b7211f5b-809e-4ede-8230-3214dc8f4d6a'),(178,'craft','m210209_135503_soft_delete_field_groups','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','dba8e0d0-d90e-4f31-b8da-7e3b0479380d'),(179,'craft','m210212_223539_delete_invalid_drafts','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','6a3fee15-c4ed-4625-a6f9-0687388bcf39'),(180,'craft','m210214_202731_track_saved_drafts','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','1e94430d-e2a9-4c74-903b-962317c6a82b'),(181,'craft','m210223_150900_add_new_element_gql_schema_components','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','3613b443-b438-42d7-92f8-a80f67a9ba83'),(182,'craft','m210302_212318_canonical_elements','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','231866cc-380e-42f3-8fca-78e8011d6c8b'),(183,'craft','m210326_132000_invalidate_projectconfig_cache','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','90ff5266-7bab-4776-bf73-cbefe6d99e22'),(184,'craft','m210329_214847_field_column_suffixes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','f7e50b52-49e4-4c5f-a890-f1392c2e9ae9'),(185,'craft','m210331_220322_null_author','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','824575b0-bc36-4282-a386-36c693881275'),(186,'craft','m210405_231315_provisional_drafts','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','897bf4e0-75c4-434e-9838-6764bda4ca35'),(187,'craft','m210602_111300_project_config_names_in_config','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','b1dc146d-fe1e-43f0-bf7a-278d1a98bfbc'),(188,'craft','m210611_233510_default_placement_settings','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','9e4bb496-2fee-452e-acf7-3426ccb81963'),(189,'craft','m210613_145522_sortable_global_sets','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','84024a03-1298-4d92-afff-9ad2fa3a6153'),(190,'craft','m210613_184103_announcements','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','2aa1d67a-c0cf-408d-ab0f-40459faed424'),(217,'craft','m210829_000000_element_index_tweak','2023-09-02 11:12:06','2023-09-02 11:12:06','2023-09-02 11:12:06','f89eefa2-5a05-4e94-8582-c2a328965507'),(218,'craft','m220209_095604_add_indexes','2023-09-02 11:12:06','2023-09-02 11:12:06','2023-09-02 11:12:06','9a7bd881-7f11-49d6-b18d-9f49774ba4f4'),(219,'craft','m220214_000000_truncate_sessions','2023-09-02 11:12:06','2023-09-02 11:12:06','2023-09-02 11:12:06','a79e42dc-bc0d-4ecc-8783-9061b5421461'),(220,'craft','m230221_185926_drop_element_fks','2023-09-02 11:12:06','2023-09-02 11:12:06','2023-09-02 11:12:06','bdc96522-e761-48b1-8bd4-5b8efed11c9a'),(221,'craft','m230226_013114_drop_plugin_license_columns','2023-09-02 11:12:06','2023-09-02 11:12:06','2023-09-02 11:12:06','b97263f6-415f-45a0-93a4-1bd7a49d9db4'),(222,'craft','m210121_145800_asset_indexing_changes','2023-09-02 11:22:19','2023-09-02 11:22:19','2023-09-02 11:22:19','25128b3c-f3b2-46cd-8139-60044c091f06'),(223,'craft','m210624_222934_drop_deprecated_tables','2023-09-02 11:22:19','2023-09-02 11:22:19','2023-09-02 11:22:19','2aafeacb-5e8d-41a7-b63e-c2188b0bdcc0'),(224,'craft','m210724_180756_rename_source_cols','2023-09-02 11:22:19','2023-09-02 11:22:19','2023-09-02 11:22:19','118d11cc-32af-4964-b715-828ff257af2b'),(225,'craft','m210809_124211_remove_superfluous_uids','2023-09-02 11:22:19','2023-09-02 11:22:19','2023-09-02 11:22:19','37fa7131-fa1e-411c-a383-c44c658b5642'),(226,'craft','m210817_014201_universal_users','2023-09-02 11:22:19','2023-09-02 11:22:19','2023-09-02 11:22:19','8ff501e2-c601-44f5-9bca-b5fa35735b0d'),(227,'craft','m210904_132612_store_element_source_settings_in_project_config','2023-09-02 11:22:19','2023-09-02 11:22:19','2023-09-02 11:22:19','5536cc22-071e-4a36-bd06-246b4c66ffdc'),(228,'craft','m211115_135500_image_transformers','2023-09-02 11:22:19','2023-09-02 11:22:19','2023-09-02 11:22:19','efcc51fe-b191-45ac-8fe2-325a51a3aa3a'),(229,'craft','m211201_131000_filesystems','2023-09-02 11:22:19','2023-09-02 11:22:19','2023-09-02 11:22:19','bfc87d65-c65e-442a-bb7d-55568aeedf8c'),(230,'craft','m220103_043103_tab_conditions','2023-09-02 11:22:19','2023-09-02 11:22:19','2023-09-02 11:22:19','d476aff2-b92e-4545-9d47-e343e4cd5dfc'),(231,'craft','m220104_003433_asset_alt_text','2023-09-02 11:22:19','2023-09-02 11:22:19','2023-09-02 11:22:19','5323a718-72b2-4c52-a2e3-fe070b1c19ce'),(232,'craft','m220123_213619_update_permissions','2023-09-02 11:22:19','2023-09-02 11:22:19','2023-09-02 11:22:19','a0d78a31-c44d-479e-809d-ab1f149767ba'),(233,'craft','m220126_003432_addresses','2023-09-02 11:22:19','2023-09-02 11:22:20','2023-09-02 11:22:20','34ced4da-2f14-48d1-a4d1-6548553ab80a'),(234,'craft','m220213_015220_matrixblocks_owners_table','2023-09-02 11:22:20','2023-09-02 11:22:20','2023-09-02 11:22:20','e4e40591-49bc-4efb-9e29-8cab875df9d2'),(235,'craft','m220222_122159_full_names','2023-09-02 11:22:20','2023-09-02 11:22:20','2023-09-02 11:22:20','fbf1bb37-10dc-4996-ab4c-20ebf9d752d2'),(236,'craft','m220223_180559_nullable_address_owner','2023-09-02 11:22:20','2023-09-02 11:22:20','2023-09-02 11:22:20','279fc21e-3783-43c5-9b10-a9b4eb17bb71'),(237,'craft','m220225_165000_transform_filesystems','2023-09-02 11:22:20','2023-09-02 11:22:20','2023-09-02 11:22:20','9f2eaf9e-9153-48ae-892a-d5b22fa6cd61'),(238,'craft','m220309_152006_rename_field_layout_elements','2023-09-02 11:22:20','2023-09-02 11:22:20','2023-09-02 11:22:20','40a69327-6cf7-4c32-a241-87209f084d7d'),(239,'craft','m220314_211928_field_layout_element_uids','2023-09-02 11:22:20','2023-09-02 11:22:20','2023-09-02 11:22:20','24522598-2020-4e4a-85fb-187c4fdfca81'),(240,'craft','m220316_123800_transform_fs_subpath','2023-09-02 11:22:20','2023-09-02 11:22:20','2023-09-02 11:22:20','5d00ab40-a9a2-4250-8a95-198dbd6d0631'),(241,'craft','m220317_174250_release_all_jobs','2023-09-02 11:22:20','2023-09-02 11:22:20','2023-09-02 11:22:20','d026296e-c15a-4012-bb35-89026211559f'),(242,'craft','m220330_150000_add_site_gql_schema_components','2023-09-02 11:22:20','2023-09-02 11:22:20','2023-09-02 11:22:20','bf5db070-4e2d-4a98-859b-5545d50b32de'),(243,'craft','m220413_024536_site_enabled_string','2023-09-02 11:22:20','2023-09-02 11:22:20','2023-09-02 11:22:20','07753142-7b28-4938-9129-ff01ecfb0234'),(244,'craft','m221027_160703_add_image_transform_fill','2023-09-02 11:22:20','2023-09-02 11:22:20','2023-09-02 11:22:20','0095e74d-e4fa-40ba-bba0-7f5ba89e2076'),(245,'craft','m221028_130548_add_canonical_id_index','2023-09-02 11:22:20','2023-09-02 11:22:20','2023-09-02 11:22:20','ea0bef0e-97cf-4c45-8371-2afc81013d6d'),(246,'craft','m221118_003031_drop_element_fks','2023-09-02 11:22:20','2023-09-02 11:22:20','2023-09-02 11:22:20','47bd315d-1118-40d1-8983-07e519cdabc5'),(247,'craft','m230131_120713_asset_indexing_session_new_options','2023-09-02 11:22:20','2023-09-02 11:22:20','2023-09-02 11:22:20','77d63845-3add-4fa3-9a63-34615502c2b9'),(248,'craft','m230531_123004_add_entry_type_show_status_field','2023-09-02 11:22:20','2023-09-02 11:22:20','2023-09-02 11:22:20','e6d794a0-30be-4f78-855a-f25f0ec03b7f'),(249,'craft','m230607_102049_add_entrytype_slug_translation_columns','2023-09-02 11:22:20','2023-09-02 11:22:20','2023-09-02 11:22:20','04d58032-03db-442f-bf44-4a10f3107bd2'),(250,'craft','m230710_162700_element_activity','2023-09-02 11:22:20','2023-09-02 11:22:20','2023-09-02 11:22:20','523f65cc-ca1c-4b25-aeec-94a3a22b2726'),(251,'craft','m230820_162023_fix_cache_id_type','2023-09-02 11:22:20','2023-09-02 11:22:20','2023-09-02 11:22:20','dd9189f3-3795-4060-9cb3-096e3d9ea5f9'),(252,'craft','m230826_094050_fix_session_id_type','2023-09-02 11:22:20','2023-09-02 11:22:20','2023-09-02 11:22:20','125c2847-13fb-425b-b8b3-edb344a9c651'),(264,'plugin:formie','Install','2023-09-02 11:32:23','2023-09-02 11:32:23','2023-09-02 11:32:23','78413a45-c5e5-4735-8b2b-1d309744fd44'),(265,'plugin:formie','m220420_000000_stencil_add_entryid','2023-09-02 11:32:23','2023-09-02 11:32:23','2023-09-02 11:32:23','00c1cc2e-dc51-46c0-bd4a-70175bf9d1cc'),(266,'plugin:formie','m220422_000000_migrate_asset_fields','2023-09-02 11:32:23','2023-09-02 11:32:23','2023-09-02 11:32:23','cd5ac109-8b6e-4152-85e4-d03942452c8b'),(267,'plugin:formie','m220530_000000_payments','2023-09-02 11:32:23','2023-09-02 11:32:23','2023-09-02 11:32:23','dbdb8495-caa6-45bb-b855-174efeff1e19'),(268,'plugin:formie','m220727_000000_hubspot','2023-09-02 11:32:23','2023-09-02 11:32:23','2023-09-02 11:32:23','c432f595-30ab-4242-af24-d2de3bb09ea0'),(269,'plugin:formie','m220903_000000_remove_old_form_settings','2023-09-02 11:32:23','2023-09-02 11:32:23','2023-09-02 11:32:23','20bba35d-7fa9-4f92-994e-def4ef5cf1cb'),(270,'plugin:formie','m220904_000000_add_siteid_entry_redirect','2023-09-02 11:32:23','2023-09-02 11:32:23','2023-09-02 11:32:23','15502d4a-0677-446b-ae07-4b4d018260aa'),(271,'plugin:formie','m220905_000000_integration_enabled','2023-09-02 11:32:23','2023-09-02 11:32:23','2023-09-02 11:32:23','56e9cbb2-b5c7-4cf1-8f93-d933baa86f2b'),(272,'plugin:formie','m220917_000000_submission_spamclass','2023-09-02 11:32:23','2023-09-02 11:32:23','2023-09-02 11:32:23','f3b8851e-94cf-4f7b-9fdf-da3d0fd026f9'),(273,'plugin:formie','m220918_000000_email_sender','2023-09-02 11:32:23','2023-09-02 11:32:23','2023-09-02 11:32:23','72659102-7f4a-4d17-8ea5-6b9c0a1b34f7'),(274,'plugin:formie','m221130_000000_sent_notifications','2023-09-02 11:32:23','2023-09-02 11:32:23','2023-09-02 11:32:23','c22916a0-d6d7-4524-9a56-30aa15938f29'),(275,'plugin:formie','m221206_000000_fix_syncs','2023-09-02 11:32:23','2023-09-02 11:32:23','2023-09-02 11:32:23','b43facec-55a6-48d0-9f99-699e79ffd1aa');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `version` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wubandncdtgqlypvqhydkjouauayjacwlgai` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
INSERT INTO `plugins` VALUES (2,'tag-manager','2.0.0','1.0.0','2021-08-07 11:34:11','2021-08-07 11:34:11','2023-09-02 11:22:16','f3fc29ca-7679-4624-baac-5819c0cc74ab'),(3,'formie','2.0.35','2.0.10','2023-09-02 11:32:22','2023-09-02 11:32:22','2023-09-02 11:32:22','17bb2ed9-e739-49b6-8bf4-7b437c6250d8');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
INSERT INTO `projectconfig` VALUES ('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.defaultPlacement','\"end\"'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.autocapitalize','true'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.autocomplete','false'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.autocorrect','true'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.class','null'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.disabled','false'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.id','null'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.instructions','null'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.label','null'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.max','null'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.min','null'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.name','null'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.orientation','null'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.placeholder','null'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.readonly','false'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.requirable','false'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.size','null'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.step','null'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.tip','null'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.title','null'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\TitleField\"'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.warning','null'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.width','100'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.1.fieldUid','\"2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a\"'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.1.instructions','null'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.1.label','null'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.1.required','false'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.1.tip','null'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.1.warning','null'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.1.width','100'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.name','\"Content\"'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.sortOrder','1'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.handle','\"demo\"'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.name','\"Demo\"'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.siteSettings.00079eeb-bb55-40b2-867b-65ed3665219f.hasUrls','true'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.siteSettings.00079eeb-bb55-40b2-867b-65ed3665219f.template','null'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.siteSettings.00079eeb-bb55-40b2-867b-65ed3665219f.uriFormat','\"demo/{slug}\"'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.structure.maxLevels','null'),('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.structure.uid','\"f6971801-c7f1-4cc7-9a40-4fa832abfa39\"'),('dateModified','1693654345'),('email.fromEmail','\"demo@verbb.io\"'),('email.fromName','\"Formie Headless\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.autocapitalize','true'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.autocomplete','false'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.autocorrect','true'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.class','null'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.disabled','false'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.id','null'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.instructions','null'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.label','null'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.max','null'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.min','null'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.name','null'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.orientation','null'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.placeholder','null'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.readonly','false'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.requirable','false'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.size','null'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.step','null'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.tip','null'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.title','null'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.warning','null'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.width','100'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.1.fieldUid','\"2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a\"'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.1.instructions','null'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.1.label','null'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.1.required','false'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.1.tip','null'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.1.warning','null'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.1.width','100'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.name','\"Content\"'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.sortOrder','1'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.handle','\"default\"'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.hasTitleField','true'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.name','\"Default\"'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.section','\"fbe2bb47-a84e-4366-b957-3e127152e75a\"'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.sortOrder','1'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.titleFormat','null'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.titleTranslationKeyFormat','null'),('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.titleTranslationMethod','\"site\"'),('fieldGroups.d644334e-fac0-46a1-8543-211e5168b02c.name','\"Common\"'),('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.columnSuffix','\"kukrbgdv\"'),('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.contentColumnType','\"text\"'),('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.fieldGroup','\"d644334e-fac0-46a1-8543-211e5168b02c\"'),('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.handle','\"plainText\"'),('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.instructions','null'),('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.name','\"Plain Text\"'),('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.searchable','false'),('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.settings.byteLimit','null'),('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.settings.charLimit','null'),('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.settings.code','\"\"'),('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.settings.columnType','null'),('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.settings.initialRows','\"4\"'),('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.settings.multiline','\"\"'),('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.settings.placeholder','null'),('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.settings.uiMode','\"normal\"'),('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.translationKeyFormat','null'),('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.translationMethod','\"none\"'),('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.type','\"craft\\\\fields\\\\PlainText\"'),('formie.statuses.db4546f1-7c70-4695-8bab-42fda0481ec6.color','\"green\"'),('formie.statuses.db4546f1-7c70-4695-8bab-42fda0481ec6.description','null'),('formie.statuses.db4546f1-7c70-4695-8bab-42fda0481ec6.handle','\"new\"'),('formie.statuses.db4546f1-7c70-4695-8bab-42fda0481ec6.isDefault','true'),('formie.statuses.db4546f1-7c70-4695-8bab-42fda0481ec6.name','\"New\"'),('formie.statuses.db4546f1-7c70-4695-8bab-42fda0481ec6.sortOrder','1'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.dataRetention','\"forever\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.dataRetentionValue','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.fileUploadsAction','\"retain\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.0.attachFiles','true'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.0.attachPdf','false'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.0.bcc','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.0.cc','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.0.conditions','\"{\\\"sendRule\\\":\\\"send\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.0.content','\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"A user submission has been made on the \\\\\\\"\\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Form Name\\\",\\\"value\\\":\\\"{formName}\\\"}},{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"\\\\\\\" form on \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Site Name\\\",\\\"value\\\":\\\"{siteName}\\\"}},{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\" at \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Timestamp (yyyy-mm-dd hh:mm:ss)\\\",\\\"value\\\":\\\"{timestamp}\\\"}}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Their submission details are:\\\"}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"All Form Fields\\\",\\\"value\\\":\\\"{allFields}\\\"}}]}]\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.0.enableConditions','false'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.0.enabled','true'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.0.formId','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.0.from','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.0.fromName','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.0.id','\"new981-8077\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.0.name','\"Admin Notification\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.0.pdfTemplateId','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.0.recipients','\"email\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.0.replyTo','\"{field.emailAddress}\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.0.replyToName','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.0.subject','\"A new submission was made on \\\"{formName}\\\"\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.0.templateId','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.0.to','\"{systemEmail}\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.0.toConditions','\"{\\\"toRecipients\\\":[]}\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.0.uid','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.1.attachFiles','true'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.1.attachPdf','false'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.1.bcc','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.1.cc','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.1.conditions','\"{\\\"sendRule\\\":\\\"send\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.1.content','\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Thanks again for contacting us. Our team will get back to you as soon as we can.\\\"}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"As a reminder, you submitted the following details at \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Timestamp (yyyy-mm-dd hh:mm:ss)\\\",\\\"value\\\":\\\"{timestamp}\\\"}}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"All Form Fields\\\",\\\"value\\\":\\\"{allFields}\\\"}}]}]\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.1.enableConditions','false'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.1.enabled','true'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.1.formId','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.1.from','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.1.fromName','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.1.id','\"new7052-5168\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.1.name','\"User Notification\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.1.pdfTemplateId','\"\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.1.recipients','\"email\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.1.replyTo','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.1.replyToName','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.1.subject','\"Thanks for contacting us!\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.1.templateId','\"\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.1.to','\"{field.emailAddress}\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.1.toConditions','\"{\\\"toRecipients\\\":[]}\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.notifications.1.uid','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.id','\"new1272610411\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.label','\"Page 1\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.notificationFlag','true'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.brandNewField','false'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.handle','\"yourName\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.hasLabel','true'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.id','\"new7715-7348\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.label','\"Your Name\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.conditions','\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.firstNameCollapsed','false'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.firstNameDefaultValue','\"\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.firstNameEnabled','true'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.firstNameLabel','\"First Name\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.firstNamePlaceholder','\"e.g. Peter\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.firstNameRequired','true'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.handle','\"yourName\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.instructions','\"Please enter your full name.\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.instructionsPosition','\"verbb\\\\formie\\\\positions\\\\AboveInput\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.label','\"Your Name\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.labelPosition','\"verbb\\\\formie\\\\positions\\\\Hidden\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.lastNameCollapsed','false'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.lastNameDefaultValue','\"\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.lastNameEnabled','true'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.lastNameLabel','\"Last Name\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.lastNamePlaceholder','\"e.g. Sherman\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.lastNameRequired','true'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.maxType','\"characters\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.middleNameCollapsed','true'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.middleNameDefaultValue','\"\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.middleNameEnabled','false'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.middleNameLabel','\"Middle Name\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.placeholder','\"Your name\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.prefixCollapsed','true'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.prefixDefaultValue','\"\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.prefixEnabled','false'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.prefixLabel','\"Prefix\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.subfieldLabelPosition','\"\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.useMultipleFields','true'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.settings.visibility','\"\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.fields.0.type','\"verbb\\\\formie\\\\fields\\\\formfields\\\\Name\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.0.id','\"new8990-9934\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.1.fields.0.brandNewField','false'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.1.fields.0.handle','\"emailAddress\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.1.fields.0.hasLabel','true'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.1.fields.0.id','\"new6482-9528\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.1.fields.0.label','\"Email Address\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.1.fields.0.settings.handle','\"emailAddress\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.1.fields.0.settings.instructions','\"Please enter your email so we can get in touch.\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.1.fields.0.settings.instructionsPosition','\"\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.1.fields.0.settings.label','\"Email Address\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.1.fields.0.settings.labelPosition','\"\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.1.fields.0.settings.maxType','\"characters\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.1.fields.0.settings.placeholder','\"e.g. psherman@wallaby.com\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.1.fields.0.settings.required','true'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.1.fields.0.type','\"verbb\\\\formie\\\\fields\\\\formfields\\\\Email\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.1.id','\"new9524-8509\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.2.fields.0.brandNewField','false'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.2.fields.0.handle','\"message\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.2.fields.0.hasLabel','true'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.2.fields.0.id','\"new982-7322\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.2.fields.0.label','\"Message\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.2.fields.0.settings.conditions','\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.2.fields.0.settings.handle','\"message\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.2.fields.0.settings.instructions','\"Please enter your comments.\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.2.fields.0.settings.instructionsPosition','\"\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.2.fields.0.settings.label','\"Message\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.2.fields.0.settings.labelPosition','\"\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.2.fields.0.settings.maxType','\"characters\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.2.fields.0.settings.placeholder','\"e.g. The reason for my enquiry is...\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.2.fields.0.settings.required','true'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.2.fields.0.settings.visibility','\"\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.2.fields.0.type','\"verbb\\\\formie\\\\fields\\\\formfields\\\\MultiLineText\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.rows.2.id','\"new2177-9685\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.settings.backButtonLabel','\"Back\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.settings.buttonsPosition','\"left\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.settings.label','\"Page 1\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.settings.showBackButton','false'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.settings.submitButtonLabel','\"Contact us\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.pages.0.sortOrder','0'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.collectIp','false'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.collectUser','false'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.dataRetention','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.dataRetentionValue','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.defaultEmailTemplateId','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.defaultInstructionsPosition','\"verbb\\\\formie\\\\positions\\\\AboveInput\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.defaultLabelPosition','\"verbb\\\\formie\\\\positions\\\\AboveInput\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.disableCaptchas','false'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.displayCurrentPageTitle','false'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.displayFormTitle','false'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.displayPageProgress','false'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.displayPageTabs','false'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.errorMessage.0.content.0.text','\"Couldn’t save submission due to errors.\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.errorMessage.0.content.0.type','\"text\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.errorMessage.0.type','\"paragraph\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.errorMessagePosition','\"top-form\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.fileUploadsAction','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.limitSubmissions','false'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.limitSubmissionsMessage','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.limitSubmissionsNumber','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.limitSubmissionsType','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.loadingIndicator','\"spinner\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.loadingIndicatorText','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.progressPosition','\"end\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.redirectUrl','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.requireUser','false'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.requireUserMessage','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.scheduleForm','false'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.scheduleFormEnd','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.scheduleFormExpiredMessage','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.scheduleFormPendingMessage','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.scheduleFormStart','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.scrollToTop','true'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.submissionTitleFormat','\"{timestamp}\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.submitAction','\"message\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.submitActionFormHide','false'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.submitActionMessage.0.content.0.text','\"Thank you for contacting us! Our team will get in touch shortly to follow up on your message.\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.submitActionMessage.0.content.0.type','\"text\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.submitActionMessage.0.type','\"paragraph\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.submitActionMessagePosition','\"top-form\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.submitActionMessageTimeout','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.submitActionTab','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.submitActionUrl','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.submitMethod','\"ajax\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.validationOnFocus','true'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.settings.validationOnSubmit','true'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.data.userDeletedAction','\"retain\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.defaultStatus','\"db4546f1-7c70-4695-8bab-42fda0481ec6\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.handle','\"contactForm\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.name','\"Contact Form\"'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.submitActionEntry','null'),('formie.stencils.e100dd43-9a1a-4980-bfb5-806d761f1192.template','null'),('fs.demo.hasUrls','false'),('fs.demo.name','\"Demo\"'),('fs.demo.settings.path','\"@webroot/uploads/demo\"'),('fs.demo.type','\"craft\\\\fs\\\\Local\"'),('fs.demo.url','null'),('globalSets.6b96e0b0-0c3f-4de5-8631-0de30b34872c.fieldLayouts.f6ac1175-0650-454a-87ac-3af1d5ed99c4.tabs.0.elements.0.fieldUid','\"2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a\"'),('globalSets.6b96e0b0-0c3f-4de5-8631-0de30b34872c.fieldLayouts.f6ac1175-0650-454a-87ac-3af1d5ed99c4.tabs.0.elements.0.instructions','null'),('globalSets.6b96e0b0-0c3f-4de5-8631-0de30b34872c.fieldLayouts.f6ac1175-0650-454a-87ac-3af1d5ed99c4.tabs.0.elements.0.label','null'),('globalSets.6b96e0b0-0c3f-4de5-8631-0de30b34872c.fieldLayouts.f6ac1175-0650-454a-87ac-3af1d5ed99c4.tabs.0.elements.0.required','false'),('globalSets.6b96e0b0-0c3f-4de5-8631-0de30b34872c.fieldLayouts.f6ac1175-0650-454a-87ac-3af1d5ed99c4.tabs.0.elements.0.tip','null'),('globalSets.6b96e0b0-0c3f-4de5-8631-0de30b34872c.fieldLayouts.f6ac1175-0650-454a-87ac-3af1d5ed99c4.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.6b96e0b0-0c3f-4de5-8631-0de30b34872c.fieldLayouts.f6ac1175-0650-454a-87ac-3af1d5ed99c4.tabs.0.elements.0.warning','null'),('globalSets.6b96e0b0-0c3f-4de5-8631-0de30b34872c.fieldLayouts.f6ac1175-0650-454a-87ac-3af1d5ed99c4.tabs.0.elements.0.width','100'),('globalSets.6b96e0b0-0c3f-4de5-8631-0de30b34872c.fieldLayouts.f6ac1175-0650-454a-87ac-3af1d5ed99c4.tabs.0.name','\"Content\"'),('globalSets.6b96e0b0-0c3f-4de5-8631-0de30b34872c.fieldLayouts.f6ac1175-0650-454a-87ac-3af1d5ed99c4.tabs.0.sortOrder','1'),('globalSets.6b96e0b0-0c3f-4de5-8631-0de30b34872c.handle','\"demo\"'),('globalSets.6b96e0b0-0c3f-4de5-8631-0de30b34872c.name','\"Demo\"'),('globalSets.6b96e0b0-0c3f-4de5-8631-0de30b34872c.sortOrder','1'),('graphql.publicToken.enabled','true'),('graphql.publicToken.expiryDate','null'),('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.isPublic','true'),('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.name','\"Public Schema\"'),('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.0','\"elements.drafts:read\"'),('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.1','\"elements.revisions:read\"'),('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.10','\"formieForms.all:read\"'),('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.11','\"formieSubmissions.all:read\"'),('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.12','\"formieSubmissions.all:edit\"'),('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.13','\"formieSubmissions.all:create\"'),('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.14','\"formieSubmissions.all:save\"'),('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.15','\"formieSubmissions.all:delete\"'),('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.16','\"sites.00079eeb-bb55-40b2-867b-65ed3665219f:read\"'),('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.2','\"elements.inactive:read\"'),('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.3','\"sections.fbe2bb47-a84e-4366-b957-3e127152e75a:read\"'),('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.4','\"entrytypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818:read\"'),('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.5','\"volumes.adf62689-9e99-4040-8bb3-c06de71033be:read\"'),('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.6','\"globalsets.6b96e0b0-0c3f-4de5-8631-0de30b34872c:read\"'),('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.7','\"usergroups.everyone:read\"'),('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.8','\"categorygroups.12530c06-549d-4664-97d3-2a96906bde12:read\"'),('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.9','\"taggroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15:read\"'),('meta.__names__.00079eeb-bb55-40b2-867b-65ed3665219f','\"Formie Headless\"'),('meta.__names__.12530c06-549d-4664-97d3-2a96906bde12','\"Demo\"'),('meta.__names__.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a','\"Plain Text\"'),('meta.__names__.6b96e0b0-0c3f-4de5-8631-0de30b34872c','\"Demo\"'),('meta.__names__.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15','\"Demo\"'),('meta.__names__.adf62689-9e99-4040-8bb3-c06de71033be','\"Demo\"'),('meta.__names__.cf7b2541-4843-417e-9652-9a5d1a5a15a7','\"Formie Headless\"'),('meta.__names__.d644334e-fac0-46a1-8543-211e5168b02c','\"Common\"'),('meta.__names__.db4546f1-7c70-4695-8bab-42fda0481ec6','\"New\"'),('meta.__names__.e100dd43-9a1a-4980-bfb5-806d761f1192','\"Contact Form\"'),('meta.__names__.e721824b-3a96-44ce-979f-1e77d543df97','\"Public Schema\"'),('meta.__names__.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818','\"Default\"'),('meta.__names__.fbe2bb47-a84e-4366-b957-3e127152e75a','\"Demo\"'),('plugins.formie.edition','\"standard\"'),('plugins.formie.enabled','true'),('plugins.formie.licenseKey','\"EBTN7CN6DN91HL7M2DQHB3ZL\"'),('plugins.formie.schemaVersion','\"2.0.10\"'),('plugins.tag-manager.edition','\"standard\"'),('plugins.tag-manager.enabled','true'),('plugins.tag-manager.schemaVersion','\"1.0.0\"'),('sections.fbe2bb47-a84e-4366-b957-3e127152e75a.defaultPlacement','\"end\"'),('sections.fbe2bb47-a84e-4366-b957-3e127152e75a.enableVersioning','true'),('sections.fbe2bb47-a84e-4366-b957-3e127152e75a.handle','\"demo\"'),('sections.fbe2bb47-a84e-4366-b957-3e127152e75a.name','\"Demo\"'),('sections.fbe2bb47-a84e-4366-b957-3e127152e75a.propagationMethod','\"all\"'),('sections.fbe2bb47-a84e-4366-b957-3e127152e75a.siteSettings.00079eeb-bb55-40b2-867b-65ed3665219f.enabledByDefault','true'),('sections.fbe2bb47-a84e-4366-b957-3e127152e75a.siteSettings.00079eeb-bb55-40b2-867b-65ed3665219f.hasUrls','true'),('sections.fbe2bb47-a84e-4366-b957-3e127152e75a.siteSettings.00079eeb-bb55-40b2-867b-65ed3665219f.template','\"demo/_entry\"'),('sections.fbe2bb47-a84e-4366-b957-3e127152e75a.siteSettings.00079eeb-bb55-40b2-867b-65ed3665219f.uriFormat','\"demo/{slug}\"'),('sections.fbe2bb47-a84e-4366-b957-3e127152e75a.type','\"channel\"'),('siteGroups.cf7b2541-4843-417e-9652-9a5d1a5a15a7.name','\"Formie Headless\"'),('sites.00079eeb-bb55-40b2-867b-65ed3665219f.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.00079eeb-bb55-40b2-867b-65ed3665219f.enabled','true'),('sites.00079eeb-bb55-40b2-867b-65ed3665219f.handle','\"default\"'),('sites.00079eeb-bb55-40b2-867b-65ed3665219f.hasUrls','true'),('sites.00079eeb-bb55-40b2-867b-65ed3665219f.language','\"en-US\"'),('sites.00079eeb-bb55-40b2-867b-65ed3665219f.name','\"Formie Headless\"'),('sites.00079eeb-bb55-40b2-867b-65ed3665219f.primary','true'),('sites.00079eeb-bb55-40b2-867b-65ed3665219f.siteGroup','\"cf7b2541-4843-417e-9652-9a5d1a5a15a7\"'),('sites.00079eeb-bb55-40b2-867b-65ed3665219f.sortOrder','1'),('system.edition','\"pro\"'),('system.live','true'),('system.name','\"Formie Headless\"'),('system.schemaVersion','\"4.5.3.0\"'),('system.timeZone','\"America/Los_Angeles\"'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.autocapitalize','true'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.autocomplete','false'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.autocorrect','true'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.class','null'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.disabled','false'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.id','null'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.instructions','null'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.label','null'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.max','null'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.min','null'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.name','null'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.orientation','null'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.placeholder','null'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.readonly','false'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.requirable','false'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.size','null'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.step','null'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.tip','null'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.title','null'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\TitleField\"'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.warning','null'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.width','100'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.1.fieldUid','\"2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a\"'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.1.instructions','null'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.1.label','null'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.1.required','false'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.1.tip','null'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.1.warning','null'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.1.width','100'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.name','\"Content\"'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.sortOrder','1'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.handle','\"demo\"'),('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.name','\"Demo\"'),('users.allowPublicRegistration','false'),('users.deactivateByDefault','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.autocapitalize','true'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.autocomplete','false'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.autocorrect','true'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.class','null'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.disabled','false'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.id','null'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.instructions','null'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.label','null'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.max','null'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.min','null'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.name','null'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.orientation','null'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.placeholder','null'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.readonly','false'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.requirable','false'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.size','null'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.step','null'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.tip','null'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.title','null'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.warning','null'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.width','100'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.1.fieldUid','\"2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a\"'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.1.instructions','null'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.1.label','null'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.1.required','false'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.1.tip','null'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.1.warning','null'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.1.width','100'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.name','\"Content\"'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.sortOrder','1'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fs','\"demo\"'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.handle','\"demo\"'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.hasUrls','false'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.name','\"Demo\"'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.sortOrder','1'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.titleTranslationKeyFormat','null'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.titleTranslationMethod','\"site\"'),('volumes.adf62689-9e99-4040-8bb3-c06de71033be.url','null');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_jnkaocmtmnmooktachttlfqkttaykvhfctpk` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_ekyyyvnesqqgxohaqnhkghzdhwqobmxjarjm` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pzxrcobdmktiyrtbzlppqtyjescsnntoombx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_hkyqwjbmbvaztgyarlwsyhpoigrptyeubeya` (`sourceId`),
  KEY `idx_qwxftlocnxunkhdnugxemfqlbbdbuvijdijp` (`targetId`),
  KEY `idx_ulkpuatjkdzuzrttydknqwsdbwcjglclhner` (`sourceSiteId`),
  CONSTRAINT `fk_bjlztzuhlroxlhmttcqewgeancytyndodsnd` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ilkeoifxfdlikcdmmavtoyoyovdqhoanxjun` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ypgcflsspudvlbqrhfvaulysqfclqhjaplyz` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
INSERT INTO `resourcepaths` VALUES ('10929eef','@lib/jquery.payment'),('124447a2','@lib/selectize'),('146b62eb','@craft/web/assets/cp/dist'),('16e72fb0','@app/web/assets/updates/dist'),('18280328','@lib/xregexp'),('1ae27a45','@craft/web/assets/axios/dist'),('1d3ac67a','@bower/jquery/dist'),('217ef1c','@craft/web/assets/recententries/dist'),('23140900','@app/web/assets/upgrade/dist'),('26d374e3','@craft/web/assets/cp/dist'),('27d75b5d','@lib/timepicker'),('2a86e381','/Users/joshcrawford/public_html/craft3-plugins/formie/src/web/assets/forms/dist'),('2a9bd6ab','@craft/web/assets/selectize/dist'),('2d8e6c89','@craft/web/assets/tailwindreset/dist'),('2fa8449e','@craft/web/assets/pluginstore/dist'),('2fdd9f19','@app/web/assets/plugins/dist'),('32aa6d8f','@lib/element-resize-detector'),('33d3165a','@app/web/assets/admintable/dist'),('3582f929','@craft/web/assets/generalsettings/dist'),('36f64840','@verbb/formie/web/assets/cp/dist'),('37875b1d','@craft/web/assets/iframeresizer/dist'),('3845c627','@craft/web/assets/dashboard/dist'),('3cadad72','@craft/web/assets/updateswidget/dist'),('3ce652aa','@craft/web/assets/d3/dist'),('3e1e4d23','@verbb/formie/web/assets/forms/dist'),('3e6f42b2','@app/web/assets/fabric/dist'),('40d76022','@verbb/base/resources/dist'),('4106e0ec','@craft/web/assets/feed/dist'),('419e56e4','@lib/jquery-touch-events'),('421caaa2','@lib/jquery-ui'),('448768cf','@app/web/assets/jquerytouchevents/dist'),('44b9ed00','@craft/web/assets/garnish/dist'),('463a6a26','@lib/picturefill'),('47cc2d00','@app/web/assets/axios/dist'),('489f4a77','@lib/d3'),('48cbeaeb','@lib/axios'),('497aa001','@craft/web/assets/queuemanager/dist'),('4cf68c6b','@craft/web/assets/userpermissions/dist'),('4e995a21','@craft/web/assets/utilities/dist'),('527154cf','@lib/iframe-resizer'),('52e6625','@app/web/assets/userpermissions/dist'),('550bc32a','@app/web/assets/jqueryui/dist'),('57054a27','@app/web/assets/fieldsettings/dist'),('59862d9','@app/web/assets/edituser/dist'),('5ca21b13','@craft/web/assets/plugins/dist'),('5ed26bd8','@lib/fileupload'),('628941b6','@app/web/assets/pluginstore/dist'),('62f9de0a','@craft/web/assets/sites/dist'),('630ef9f1','@app/web/assets/elementresizedetector/dist'),('6465c330','@verbb/formie/web/assets/forms/dist'),('6520499e','@lib/vue'),('678fb8f7','@craft/web/assets/admintable/dist'),('6b04bcad','@app/web/assets/xregexp/dist'),('6c0bda17','@craft/web/assets/fabric/dist'),('6c5a9687','@app/web/assets/picturefill/dist'),('6d16d20a','@app/web/assets/dashboard/dist'),('6d4cb829','/Users/joshcrawford/public_html/craft3-plugins/formie/src/web/assets/cp/dist'),('6e6489cf','@lib/fabric'),('6e826144','@craft/web/assets/graphiql/dist'),('72eb1d7b','@app/web/assets/updates/dist'),('76156a65','@craft/web/assets/login/dist'),('79b10c9d','@app/web/assets/cp/dist'),('7b225df1','@lib/garnishjs'),('7bcb8d7d','@app/web/assets/jquerypayment/dist'),('7c214c29','@craft/web/assets/utilities/dist'),('7e13dda8','@craft/web/assets/craftsupport/dist'),('837e5564','@app/web/assets/craftsupport/dist'),('85dbc414','@lib/iframe-resizer'),('8978fb03','@lib/fileupload'),('8b088bc8','@craft/web/assets/plugins/dist'),('8decf9a5','@app/web/assets/updateswidget/dist'),('9190fafd','@lib/picturefill'),('91967c77','@craft/web/assets/dbbackup/dist'),('92dd31bf','@craft/web/assets/picturefill/dist'),('95362fe6','@ether/tagManager/web/assets'),('95b63a79','@lib/jquery-ui'),('9634c63f','@lib/jquery-touch-events'),('96b5b04f','@craft/web/assets/clearcaches/dist'),('9924a1a8','@verbb/base/resources/dist'),('99658cbf','@craft/web/assets/xregexp/dist'),('9a1a80d1','@app/web/assets/editentry/dist'),('9b015b7b','@craft/web/assets/craftsupport/dist'),('9db9ab9a','@app/web/assets/updater/dist'),('9f35daac','@lib/d3'),('9f617a30','@lib/axios'),('9ff25612','@app/web/assets/graphiql/dist'),('a08d62a6','@craft/web/assets/datepickeri18n/dist'),('a40da647','@craft/web/assets/clearcaches/dist'),('a86cec1c','@app/web/assets/utilities/dist'),('aa258938','@app/web/assets/login/dist'),('ab11e9d6','@craft/web/assets/velocity/dist'),('abb2585f','/Users/joshcrawford/public_html/craft3-plugins/formie/src/web/assets/frontend/dist/js'),('ac88cd2a','@lib/garnishjs'),('ae1b9c46','@app/web/assets/cp/dist'),('ae86eb61','@craft/web/assets/jquerypayment/dist'),('ae9c646a','@bower/jquery/dist'),('aed53403','@craft/web/assets/jquerytouchevents/dist'),('b28ad945','@lib/vue'),('b356bbcb','@app/web/assets/recententries/dist'),('b6d8dd12','@app/web/assets/garnish/dist'),('b88e9058','@verbb/formie/web/assets/cp/dist'),('b9ce1914','@lib/fabric'),('bd4a943','@craft/web/assets/updater/dist'),('bddb6c9f','@app/web/assets/fields/dist'),('be7e0be','@lib/datepicker-i18n'),('bf31318d','@craft/web/assets/vue/dist'),('c3c1f230','@craft/web/assets/cp/dist'),('c5eed779','@lib/selectize'),('c7380e34','@lib/jquery.payment'),('c7d65b77','/Users/joshcrawford/public_html/craft3-plugins/formie/src/web/assets/frontend/dist/css/fields'),('ca17ae8d','@app/web/assets/cp/dist'),('ca9056a1','@bower/jquery/dist'),('cb53107','@lib/velocity'),('cc60ded7','@app/web/assets/utilities/dist'),('cd5fa43','@app/web/assets/velocity/dist'),('ce29bbf3','@app/web/assets/login/dist'),('cf8293f3','@lib/xregexp'),('d02288c4','@app/web/assets/d3/dist'),('d284f6fe','@app/web/assets/userpermissions/dist'),('d700d7f8','@app/web/assets/feed/dist'),('d9bf2ba1','@craft/web/assets/updateswidget/dist'),('db1fa1dc','@lib/velocity'),('dd5740f4','@craft/web/assets/dashboard/dist'),('e0d67062','@app/web/assets/datepickeri18n/dist'),('e2ca3d01','@app/web/assets/iframeresizer/dist'),('e4798681','@app/web/assets/admintable/dist'),('e500fd54','@lib/element-resize-detector'),('e6173d96','/Users/joshcrawford/public_html/craft3-plugins/formie/src/web/assets/frontend/dist/js/fields'),('e70569cf','@craft/web/assets/recententries/dist'),('ea050731','@verbb/base/resources/dist'),('ecb40614','@craft/web/assets/fileupload/dist'),('ee5c8c7a','@app/web/assets/fileupload/dist'),('f07dcb86','@lib/timepicker'),('f248c4fa','@app/web/assets/editsection/dist'),('f2cfd0bf','@craft/web/assets/jqueryui/dist'),('f3062a69','@verbb/formie/web/assets/forms/dist'),('f3ef9e73','@ether/tagManager/web/assets'),('f82840a9','@bower/jquery/dist'),('f8770fc2','@app/web/assets/plugins/dist'),('f9b59951','@app/web/assets/updater/dist'),('fbee2f0a','@verbb/formie/web/assets/cp/dist'),('fdc85f41','@craft/web/assets/elementresizedetector/dist'),('fed6769e','@app/web/assets/selectize/dist');
/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zmqrvrhrljakrdktgtftbdbqehuwrtcjkmei` (`canonicalId`,`num`),
  KEY `fk_vjbpdtgncyjrrmobrhuumffqrorkuducaedt` (`creatorId`),
  CONSTRAINT `fk_hwscddxuvslxlswcjxzzkmpeflzgzswvoupw` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vjbpdtgncyjrrmobrhuumffqrorkuducaedt` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
INSERT INTO `revisions` VALUES (1,3,1,1,''),(2,9,1,1,''),(3,11,1,1,'');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_dircbqsrptjyseswojdffwjsphijgcbzokku` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES (1,'username',0,1,' formie '),(1,'lastname',0,1,' demo '),(1,'firstname',0,1,' formie '),(2,'slug',0,1,''),(3,'slug',0,1,' entry 1 '),(3,'title',0,1,' entry 1 '),(4,'slug',0,1,' category 1 '),(4,'title',0,1,' category 1 '),(5,'slug',0,1,' category 2 '),(5,'title',0,1,' category 2 '),(6,'slug',0,1,' category 3 '),(6,'title',0,1,' category 3 '),(7,'slug',0,1,' category 4 '),(7,'title',0,1,' category 4 '),(9,'title',0,1,' entry 2 '),(9,'slug',0,1,' entry 2 '),(11,'slug',0,1,' entry 3 '),(11,'title',0,1,' entry 3 '),(13,'slug',0,1,' temp ubsxpbvhefiiitalkeptgivacbnamlzkqzdh '),(13,'title',0,1,''),(14,'title',0,1,' fields demo '),(14,'handle',0,1,' fieldsdemo '),(1,'fullname',0,1,' formie demo '),(1,'email',0,1,' demo verbb io '),(1,'slug',0,1,''),(15,'slug',0,1,' tag 1 '),(15,'title',0,1,' tag 1 '),(16,'slug',0,1,' tag 2 '),(16,'title',0,1,' tag 2 '),(17,'slug',0,1,' tag 3 '),(17,'title',0,1,' tag 3 '),(18,'title',0,1,' contact form '),(18,'handle',0,1,' contactform '),(18,'slug',0,1,''),(14,'slug',0,1,''),(19,'title',0,1,' contact form '),(19,'handle',0,1,' contactform '),(19,'slug',0,1,''),(20,'title',0,1,' fields demo '),(20,'handle',0,1,' fieldsdemo '),(20,'slug',0,1,'');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ntfkgkoxgkmvkbfeilmkjbapxkrnvyinemmd` (`handle`),
  KEY `idx_pqwdprimguqlxhsxiqetvitdzxhuwvjborsa` (`name`),
  KEY `idx_qkkbjcmpsjysxcyuupnmoxmmshhhhckvioau` (`structureId`),
  KEY `idx_uogngnciwpioqwptkgipjibqhxmyyrdozdyc` (`dateDeleted`),
  CONSTRAINT `fk_fugovcqotvsphyqcpobjujfkomivsakpvjhr` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,NULL,'Demo','demo','channel',1,'all','end',NULL,'2021-08-07 00:05:46','2021-08-07 00:05:46',NULL,'fbe2bb47-a84e-4366-b957-3e127152e75a');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `template` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_slxwzvytquepcnbylpxohyxtlwqlktqmvavh` (`sectionId`,`siteId`),
  KEY `idx_ykcuipaswketxftuquamdlaoaymqkrnuuijc` (`siteId`),
  CONSTRAINT `fk_dytrwikjpjmmzgnkgefggylsleozwlnfqnit` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mjdfmkpmoqpuwelgvlnnlmctekzhpebpoiwg` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'demo/{slug}','demo/_entry',1,'2021-08-07 00:05:46','2021-08-07 00:05:46','3bc33975-182f-486b-bd92-86607891b755');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequences` (
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eyhluwyqylmzjyjzttiogmamuvrkperllsmw` (`uid`),
  KEY `idx_macornsmeavtbcoyaottudchzafuqnzsxobs` (`token`),
  KEY `idx_nqhovpqulvmdutqvynsezvnorxhhqnxxybjl` (`dateUpdated`),
  KEY `idx_jwjxtrtvyxecpzihnlrfnmwycnyqrzbneolf` (`userId`),
  CONSTRAINT `fk_upveihnwvnbwkluowedopxiruacukoixdvuj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,1,'Nq_f1OO5YNTzJ-k1Z5-CeqCsPbhwUrGNC50G2ybWuzlBO4W2WPz4HTNap81IWsIMK7W8BIuHeAwEpkB4V2yZtwn6QNOM4LXB3_PP','2023-09-02 11:12:11','2023-09-02 11:15:27','f51905b2-12bd-4bba-b656-a52909a1dad3'),(2,1,'jLykiDfAvKgIXsoRAp820_rO66ARR5zK4op9EKKXdDJRJ1TtmktFdmSqZpEROF4N0lScDUriol1VgN7EJK7Jydx4vV4QW_HU99NN','2023-09-02 11:15:27','2023-09-02 11:16:28','e466ff47-2de7-4c21-800c-08677259f086'),(3,1,'6l_vEqCRq8Fd_T4bMVCBU9j8ewXWnazJHbIakocSfUaMXD5GDfdVD2m__BT7uerXyabl0gReOU13B4bewxNbLhjziKop6WybsSX_','2023-09-02 11:22:25','2023-09-02 11:24:40','8a2fac8a-0ab8-449c-9792-696bd9d66fbe'),(4,1,'Rea9pnGUyzlZpEGsAcv1ZfYzuABlAKZ4u5aidvPTwT3HH9FeoPcMsGvUlqmhHuVA0UhtZYiAg4o99X34l5V3hmdY7kn6G2HuOD99','2023-09-02 11:24:40','2023-09-02 11:36:59','ea4f43ee-24f9-4c07-ad51-d7e037707418');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usyqkuremafthrlzaeiwbypprdowclttfmpr` (`userId`,`message`),
  CONSTRAINT `fk_gnnzclgwmystppbykbmcovzqchsvmgonrjsx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kwcpxouobiyxioiktjawzsjzgwgpppqgzpzu` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
INSERT INTO `sitegroups` VALUES (1,'Formie Headless','2021-08-07 00:01:41','2021-08-07 00:01:41',NULL,'cf7b2541-4843-417e-9652-9a5d1a5a15a7');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'true',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `language` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aojhpnrarjwfbwlrxprqdvqepnrvolxhxxdc` (`dateDeleted`),
  KEY `idx_jdtfoutsmwxrbzqpmpgjsphhxxbqxpqtxptz` (`handle`),
  KEY `idx_qisnfziqmsgibhxlojpekrlahxrzadhpidnn` (`sortOrder`),
  KEY `fk_gwwmexaqagquttgahxhkfgtlvrracpaepsdo` (`groupId`),
  CONSTRAINT `fk_gwwmexaqagquttgahxhkfgtlvrracpaepsdo` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,1,1,'1','Formie Headless','default','en-US',1,'$PRIMARY_SITE_URL',1,'2021-08-07 00:01:41','2021-08-07 00:01:41',NULL,'00079eeb-bb55-40b2-867b-65ed3665219f');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_laxpviqpbbpzajtcwtvbfptyqavoogdyiizm` (`structureId`,`elementId`),
  KEY `idx_hyvsjgvsckspdloakuprmzpgpioaxzmkbxbt` (`root`),
  KEY `idx_ciqgfunismlyrbvvznjjfkmumdcviyhqsttx` (`lft`),
  KEY `idx_ogqesppqhncqdhjtsdftuinyzuciynjjbhot` (`rgt`),
  KEY `idx_bzthuvnsujactdzdkgkmxeircpzxxfzjgjim` (`level`),
  KEY `idx_bufqjgwfissgkixjviowuxiinqthtsomafrf` (`elementId`),
  CONSTRAINT `fk_vzdiystlksrdkldqoxgbezpqvbxtxadmxzwt` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
INSERT INTO `structureelements` VALUES (1,1,NULL,1,1,10,0,'2021-08-07 00:11:05','2021-08-07 00:11:16','55e65596-5f58-4e3f-82ff-c217e137242b'),(2,1,4,1,2,3,1,'2021-08-07 00:11:05','2021-08-07 00:11:05','47741905-f624-4daa-bed5-3fd3729fce56'),(3,1,5,1,4,5,1,'2021-08-07 00:11:08','2021-08-07 00:11:08','0e5580bf-b281-43ec-a98f-b30b4a268a06'),(4,1,6,1,6,7,1,'2021-08-07 00:11:12','2021-08-07 00:11:12','2231902f-9c69-49ff-a745-7cde4b633a3a'),(5,1,7,1,8,9,1,'2021-08-07 00:11:16','2021-08-07 00:11:16','bbf40784-51aa-4c46-8032-d9412a0c9875');
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dlsevbvcpzearhjsyndfywuizljmbehhkacq` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
INSERT INTO `structures` VALUES (1,NULL,'2021-08-07 00:06:08','2021-08-07 00:06:08',NULL,'f6971801-c7f1-4cc7-9a40-4fa832abfa39');
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `subject` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jlfgotrypnntsdwrwselyzwlhrpauwtuxqyc` (`key`,`language`),
  KEY `idx_bpgghdnxyiveeuckydnbnduaueracjorjgkk` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yfylvccabfmslmzcbytsulsxjlhuqhoomamx` (`name`),
  KEY `idx_eqwppyfjfzqnnzacqidcphbmccmrlyfdbkmr` (`handle`),
  KEY `idx_corjuasgirscqmwbdcanifljgnscpnufasod` (`dateDeleted`),
  KEY `fk_gyrgxsrujacyggixmnbfdvwvzprjvanxfvxi` (`fieldLayoutId`),
  CONSTRAINT `fk_gyrgxsrujacyggixmnbfdvwvzprjvanxfvxi` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
INSERT INTO `taggroups` VALUES (1,'Demo','demo',4,'2021-08-07 00:06:12','2021-08-07 00:06:12',NULL,'9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15');
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_xgsykprhkkcrvptgotfkodcjlmioavrzjzsl` (`groupId`),
  CONSTRAINT `fk_ldlnjaflxduahpurbljblmucemfsdpqncfym` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sleboqknpskligtvzjavpgwyxvcckcstqbri` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (15,1,NULL,'2021-08-07 11:34:38','2021-08-07 11:34:38'),(16,1,NULL,'2021-08-07 11:34:42','2021-08-07 11:34:42'),(17,1,NULL,'2021-08-07 11:34:44','2021-08-07 11:34:44');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `route` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ktobuujveyupgftiydpevdhprplncskdcnco` (`token`),
  KEY `idx_cbsndvnsyswtmsydmpxvongyxbexqohynrht` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_totiyklijbzwxjiptqfrwooetadepjhjnagn` (`handle`),
  KEY `idx_ffixqlytjchovbipaykjcikdmpxgonhwdrqz` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ootxzazrcdryoirjcslrujghefbfnmzggcag` (`groupId`,`userId`),
  KEY `idx_sutuijjisptfaqhdwrtqexgttfvgbrwyomhu` (`userId`),
  CONSTRAINT `fk_sjvulkdozdfclrhfenwbefporxpbclorngiu` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zcgdonwiasxvaslmunoilckvgngntrrziial` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wrfacjtypuhgbbnykkrijdhbkgipercamlqg` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qbzabweoeyopoiijxysydjkojahkdqambigy` (`permissionId`,`groupId`),
  KEY `idx_dbyuqcgqhtkfftzkmvdtmgdbsiparqgoietv` (`groupId`),
  CONSTRAINT `fk_xokjzqwpuluikwhwpvjnmqxghyflfdodldnr` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yrpyixwegebtkgzjsjgnwcfnlilhcgamtumy` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lamzsluctfdtqconsblalfddmndbncdlrbbu` (`permissionId`,`userId`),
  KEY `idx_rsetcfqtenthhplzfytidzzioqfiwkvrnhny` (`userId`),
  CONSTRAINT `fk_hdyjmetswqexztsjqdznnfmjxvrrdyyqmclw` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_makxtgupnibqeaueadeqvtaeplxpjsnmxpto` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_jzaefgzayondcehqzasoipclngzlsffkjkeh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\",\"locale\":null,\"weekStartDay\":\"1\",\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false,\"showFieldHandles\":false,\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false,\"showExceptionView\":false,\"profileTemplates\":false}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `fullName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `photoId` int DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aewtsdhqgmsuqynirojuvngosmwpqmhnrzpr` (`verificationCode`),
  KEY `idx_pckvwvrkqnqpvqvgbsshjwsjdiorappxlitw` (`email`),
  KEY `idx_xfgxgdafkydsddygahefziymvmqpcprjvzgl` (`username`),
  KEY `fk_pmzpmgzvdatzmpqypyevmelxheabojiwnqbw` (`photoId`),
  KEY `idx_hfiiuqkxhdyxawyhiaahkuxttdkuhnjosbam` (`active`),
  KEY `idx_rqxqlotekraepqcfxqnodfpaarrjqiaawivu` (`locked`),
  KEY `idx_vflgmzgnhabehdmpcfdlykmhcnzyqioidrfk` (`pending`),
  KEY `idx_asnmjusjmlersyflskziusrabmlbvogzisno` (`suspended`),
  CONSTRAINT `fk_pmzpmgzvdatzmpqypyevmelxheabojiwnqbw` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tbywxvklfnixqevfhnjnhdzywgziiscbnery` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'formie','Formie Demo',NULL,'Formie','Demo','demo@verbb.io','$2y$13$bWBMDbFNp3g0cg1kbQ1FFua89/amjEnaByfoyh2ItwzzCrBV0IVs2',1,1,0,0,0,'2023-09-02 11:24:40',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2021-08-07 00:01:42','2021-08-07 00:01:42','2023-09-02 11:24:40');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xhqanulomzqoidxpijtvcemcvttyytqxwzyx` (`name`,`parentId`,`volumeId`),
  KEY `idx_aclwjnbkviajfzagippbvhxinvixumyldhbu` (`parentId`),
  KEY `idx_ujyxezcopiapkrcukrfymkahlrbsmwgeremc` (`volumeId`),
  CONSTRAINT `fk_dwxxemdptkkqjmgfxvjculzfvwyddklntjfu` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xsmhnzqunkbngvorgkpsjuvkhaiznbohdjtw` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Demo','','2021-08-07 00:06:01','2021-08-07 00:06:01','a61e8f67-28cc-43ec-8a76-730c60a192bf'),(2,NULL,NULL,'Temporary filesystem',NULL,'2023-09-02 11:22:36','2023-09-02 11:22:36','e5b06441-3d7e-49f4-9a5c-0c2e31d7056b'),(3,2,NULL,'user_1','user_1/','2023-09-02 11:22:36','2023-09-02 11:22:36','ce960e37-356a-4967-942e-88a86d2386d4');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `fs` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `transformFs` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `transformSubpath` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yrrcalzgcdnoawpegmmdalefnlddcagkglrj` (`name`),
  KEY `idx_pnzwryfgmurbsmfhavqxaralgkuekfgbrkov` (`handle`),
  KEY `idx_qgjrgxiqxkjzyybsjqapmtkcysvkikiklifj` (`fieldLayoutId`),
  KEY `idx_xymrkcdrummughimshxygznlvzmkmeymrehl` (`dateDeleted`),
  CONSTRAINT `fk_ckixtfkovvvxgbjbvsojkkajgcoueextwxxp` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
INSERT INTO `volumes` VALUES (1,2,'Demo','demo','demo',NULL,NULL,'site',NULL,1,'2021-08-07 00:06:01','2021-08-07 00:06:01',NULL,'adf62689-9e99-4040-8bb3-c06de71033be');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mzjtoccfqcetxqjnsyaqxefmxacwcpjbcckd` (`userId`),
  CONSTRAINT `fk_vocehnguepjbxcwneuzgexwebidejphubcaf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2021-08-07 00:03:49','2021-08-07 00:03:49','2c2f3526-0055-4644-87f3-52f5b17e5e31'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2021-08-07 00:03:49','2021-08-07 00:03:49','6ecbb3b0-5f19-4f6d-9c76-14cf8ce825c0'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2021-08-07 00:03:49','2021-08-07 00:03:49','d5f56ae5-9c95-4dc0-8984-d76dfa465816'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2021-08-07 00:03:49','2021-08-07 00:03:49','1ec56085-4845-43ff-8721-b13aad54687e');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-02 11:37:59
