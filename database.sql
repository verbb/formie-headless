# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.7.30)
# Database: formie_headless
# Generation Time: 2021-08-08 09:07:41 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table announcements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `announcements`;

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_kothzqrzsiqxtbfycddydrmvncjjqakxjiwy` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_eyygqqjxhofennnnbvvblzcuxxpdviikgnzz` (`dateRead`),
  KEY `fk_ncgktkrdlltldvjekbxmzthhanjvbgqrdfbh` (`pluginId`),
  CONSTRAINT `fk_ncgktkrdlltldvjekbxmzthhanjvbgqrdfbh` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sjddbsyzbhnnrmpqrwbllhwnbeuutayemypa` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table assetindexdata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assetindexdata`;

CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text COLLATE utf8_unicode_ci,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cexbelpkwuafxsrgaxswbdcbhjkkgppvgnbj` (`sessionId`,`volumeId`),
  KEY `idx_qhjxxxhxgvfvuddlwvyakewikhutszdhkapx` (`volumeId`),
  CONSTRAINT `fk_hcuwtklflydgtyfdfhwjeaheotgdkaxfvsas` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table assets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assets`;

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xnwzggtkoioukautxmodlaefocrcylzbjmaa` (`filename`,`folderId`),
  KEY `idx_saosffeghvjzagitduelajygcirieieszdrz` (`folderId`),
  KEY `idx_ifglsltythihbnuessrtmpziwnqivsafzoeu` (`volumeId`),
  KEY `fk_kselcddgatlbqovwcukappcuvcicsortwxew` (`uploaderId`),
  CONSTRAINT `fk_atwwmbspyqcrpgbpwkjbpzwshpiuhnzihksj` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_blcnesqyuckowzceruhlbnnttyaoqpqzeudw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_igvkzkpddciuzvwjqeideluqldvxumshkaap` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kselcddgatlbqovwcukappcuvcicsortwxew` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table assettransformindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assettransformindex`;

CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xszdttyzzdnlhxwoxoklithusjcmwdnabkcv` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table assettransforms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assettransforms`;

CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wzlpaghvqwsatmumeuxxzlulsruexplgvxgh` (`name`),
  KEY `idx_fsfenqtidmfgpawijevmtaiwtdbaaixcaobe` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dwnazogpanlalmntookksubheehzzxxqaqph` (`groupId`),
  KEY `fk_xipqybingciavhpohhadvcclxrruqqsoxyrj` (`parentId`),
  CONSTRAINT `fk_lojcgnjqurjdqacfahnedkfivbpodsvsrsya` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oajcchmggsmobhjpwuygioqlfdznfpthagkd` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xipqybingciavhpohhadvcclxrruqqsoxyrj` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `groupId`, `parentId`, `deletedWithGroup`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(4,1,NULL,NULL,'2021-08-07 00:11:05','2021-08-07 00:11:05','c76576a3-08a6-4555-aeac-3e32db21e22c'),
	(5,1,NULL,NULL,'2021-08-07 00:11:08','2021-08-07 00:11:08','23969bce-38d1-4127-b2e4-45b737b163ab'),
	(6,1,NULL,NULL,'2021-08-07 00:11:12','2021-08-07 00:11:12','5b07595f-842c-4550-bfbe-b8b7a833e484'),
	(7,1,NULL,NULL,'2021-08-07 00:11:16','2021-08-07 00:11:16','c80ba5cd-6671-4c39-b417-7c4658f5f727');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categorygroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categorygroups`;

CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ondbkltynyogxroqheprsaugrlyqbyamhtoh` (`name`),
  KEY `idx_vqplkidtxghnhtegbeqcliykqukopxklhicg` (`handle`),
  KEY `idx_qwutpsrcjeyzdkbfawubizsoakajzxnjcqrn` (`structureId`),
  KEY `idx_lgzrdmosgmcmodwykytnmazolmonafujvbgr` (`fieldLayoutId`),
  KEY `idx_ihnsdvcmvnsquxsiwwjraxptnnyvylxmpmyz` (`dateDeleted`),
  CONSTRAINT `fk_cvxtkcnxhjseazzvydgflpeowaielhjzdplb` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ytaigleyxvdmvsfvedvsusglrjbylrbpytyv` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;

INSERT INTO `categorygroups` (`id`, `structureId`, `fieldLayoutId`, `name`, `handle`, `defaultPlacement`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,1,3,'Demo','demo','end','2021-08-07 00:06:08','2021-08-07 00:06:08',NULL,'12530c06-549d-4664-97d3-2a96906bde12');

/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categorygroups_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categorygroups_sites`;

CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pfchayahwqbbzlhvjhbmebcqzsapjtmgyzkb` (`groupId`,`siteId`),
  KEY `idx_qwsrvqjxqxjyllvkbynqoxfertxsfqsqixcn` (`siteId`),
  CONSTRAINT `fk_hmaidcypmfrpongpmobehbjyudbuzngdrxlk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wodayztkwbgugkiuqociohxieujyrdyfqixo` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;

INSERT INTO `categorygroups_sites` (`id`, `groupId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,1,'demo/{slug}',NULL,'2021-08-07 00:06:08','2021-08-07 00:06:08','4d111ed7-2903-4575-92ab-6d0acff893a8');

/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table changedattributes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `changedattributes`;

CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_xuqiyjtithypxuuktunvpwegkaygjzrqvstk` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_kqtbjefkppbufrvsgvbskrulltrsdyzukkvu` (`siteId`),
  KEY `fk_kdwfvzfglhqgxnfidhxafcaozmenkkgbfgpl` (`userId`),
  CONSTRAINT `fk_fwsaweolgudzxmuzylqmzanlbrpnscbdtkwq` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kdwfvzfglhqgxnfidhxafcaozmenkkgbfgpl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_kqtbjefkppbufrvsgvbskrulltrsdyzukkvu` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;

INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`)
VALUES
	(1,1,'firstName','2021-08-07 11:32:50',0,1),
	(1,1,'lastName','2021-08-07 11:32:50',0,1),
	(3,1,'slug','2021-08-07 00:11:20',0,1),
	(3,1,'title','2021-08-07 00:11:20',0,1),
	(3,1,'uri','2021-08-07 00:11:20',0,1),
	(9,1,'slug','2021-08-07 00:11:27',0,1),
	(9,1,'title','2021-08-07 00:11:27',0,1),
	(9,1,'uri','2021-08-07 00:11:27',0,1),
	(11,1,'slug','2021-08-07 00:11:33',0,1),
	(11,1,'title','2021-08-07 00:11:33',0,1),
	(11,1,'uri','2021-08-07 00:11:33',0,1);

/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table changedfields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `changedfields`;

CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_ciefwlmiwneuzoqmdcqmkreuhwgwtpryhjzs` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_jmedryrxajhvhxejpqcozhfrdrvdwcpijoth` (`siteId`),
  KEY `fk_wnsyztvcmtmdrdquhzpxbgqwwyhegulrymez` (`fieldId`),
  KEY `fk_licsxxjjaowcgwelgsriwrhwsymheraufbbr` (`userId`),
  CONSTRAINT `fk_gcbtfjefjorvlpwxdblpeohcsjstxeqthtpm` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_jmedryrxajhvhxejpqcozhfrdrvdwcpijoth` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_licsxxjjaowcgwelgsriwrhwsymheraufbbr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_wnsyztvcmtmdrdquhzpxbgqwwyhegulrymez` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content`;

CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_plainText_kukrbgdv` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rnydhkxnoawjsejdcejskjzswcrpwsymidxo` (`elementId`,`siteId`),
  KEY `idx_wyxzveoscgbciphjbmahqmdcsqgnqjejddfu` (`siteId`),
  KEY `idx_ayomghrrusjmmouuxebeewsdafcfiozhdntc` (`title`),
  CONSTRAINT `fk_pcbutytytnogbmipiuyqrnjyojnzqqsbgigz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wzigkosnshqufuvqateunxtjmglzauucxjug` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_plainText_kukrbgdv`)
VALUES
	(1,1,1,NULL,'2021-08-07 00:01:41','2021-08-07 11:32:50','afef80ee-469c-46e5-900b-accabda42bbf',NULL),
	(2,2,1,NULL,'2021-08-07 00:06:03','2021-08-07 00:06:23','4f09d160-8289-4e57-a598-630d308c3c7c',NULL),
	(3,3,1,'Entry 1','2021-08-07 00:10:57','2021-08-07 00:11:23','59b495eb-c7a5-4310-aa8a-dbacd70cf921',NULL),
	(4,4,1,'Category 1','2021-08-07 00:11:05','2021-08-07 00:11:05','9c3bad5f-3366-4513-a8db-314386ec5775',NULL),
	(5,5,1,'Category 2','2021-08-07 00:11:08','2021-08-07 00:11:08','2fac8761-519b-4322-9032-67011137ae3b',NULL),
	(6,6,1,'Category 3','2021-08-07 00:11:12','2021-08-07 00:11:12','5c6507dd-8638-4128-bd52-c8baddb5bb8f',NULL),
	(7,7,1,'Category 4','2021-08-07 00:11:16','2021-08-07 00:11:16','11f871ca-8b39-4823-9420-acf99e328d28',NULL),
	(8,8,1,'Entry 1','2021-08-07 00:11:23','2021-08-07 00:11:23','2699c062-40ea-4779-9d5d-c224ee0c0a4e',NULL),
	(9,9,1,'Entry 2','2021-08-07 00:11:23','2021-08-07 00:11:29','2b5616c4-0b1e-4b1c-ad01-72ca14de7d01',NULL),
	(10,10,1,'Entry 2','2021-08-07 00:11:29','2021-08-07 00:11:29','062f26e8-3d19-43fe-aeab-d452111854aa',NULL),
	(11,11,1,'Entry 3','2021-08-07 00:11:30','2021-08-07 00:11:35','bc2f4f4f-43ff-48b9-8e70-e7bc3947a079',NULL),
	(12,12,1,'Entry 3','2021-08-07 00:11:35','2021-08-07 00:11:35','5f0992c3-6287-450f-b2df-b2839fea91ee',NULL),
	(13,13,1,NULL,'2021-08-07 00:11:36','2021-08-07 00:11:36','1b054429-f209-4ea2-8612-e80d7d27eb96',NULL),
	(14,14,1,'Fields Demo','2021-08-07 00:44:07','2021-08-08 06:48:19','ac7f54f8-fd11-4541-bb2e-5bf364dd82f1',NULL),
	(15,15,1,'Tag 1','2021-08-07 11:34:38','2021-08-07 11:34:38','2c90e814-b189-4b14-bb23-77372f322f63',NULL),
	(16,16,1,'Tag 2','2021-08-07 11:34:42','2021-08-07 11:34:42','bf0af949-ccf7-40bc-af04-2eb0eb645547',NULL),
	(17,17,1,'Tag 3','2021-08-07 11:34:44','2021-08-07 11:34:44','5d5f44f5-d615-47d1-b18a-7a6aee37af1f',NULL),
	(18,18,1,'Contact Form','2021-08-07 12:09:46','2021-08-08 04:58:49','28c3ac5a-8588-42fc-b501-4107232b980b',NULL);

/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craftidtokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craftidtokens`;

CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_oehcpoajhzosngmydyppprvnfknqnsecmgly` (`userId`),
  CONSTRAINT `fk_oehcpoajhzosngmydyppprvnfknqnsecmgly` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table deprecationerrors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `deprecationerrors`;

CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gbuvguoatnotbxuiwpvxzyhujegogaltlwyu` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table drafts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `drafts`;

CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_uamurmokmubuxdpjeaomhkqlvowvhssspuqc` (`creatorId`,`provisional`),
  KEY `idx_kbldpzqykqxlwwgnkdbqswbylyrkngchjplu` (`saved`),
  KEY `fk_vketqawpzffkyuzroqwvxkkgwknrmxvsdgcl` (`sourceId`),
  CONSTRAINT `fk_sgmtxrfqzydkxigmnxceaxvdhydscshwfqfw` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vketqawpzffkyuzroqwvxkkgwknrmxvsdgcl` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;

INSERT INTO `drafts` (`id`, `sourceId`, `creatorId`, `provisional`, `name`, `notes`, `trackChanges`, `dateLastMerged`, `saved`)
VALUES
	(4,NULL,1,0,'First draft',NULL,0,NULL,0);

/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table elementindexsettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `elementindexsettings`;

CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qryjcdqbymbuezoayjnnfrzdzuypjnpijooc` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table elements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `elements`;

CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_poilaaaffgcbyrknzwnnwdnfdnqnrfxkdcfa` (`dateDeleted`),
  KEY `idx_rqnpzplmcsaiirktgswmrwbfdcuqthqbgtfz` (`fieldLayoutId`),
  KEY `idx_cdcudrbxkdxzpactxvbizegqgmahhkckesgl` (`type`),
  KEY `idx_sfsmgfpymmtypiqfrvxkbjjrdszkzbourhyv` (`enabled`),
  KEY `idx_mlgroayylvbtuhumqgcnurtaidkrgsqxuqsg` (`archived`,`dateCreated`),
  KEY `idx_mywzxsavmygowzehospmwfjieyasybjkymlm` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  KEY `fk_kowkkdkjzfrzomrxjvvtmcaztplpocuugvxo` (`canonicalId`),
  KEY `fk_siigegthidtppinkzzxtvcaifdahpgrrwhzs` (`draftId`),
  KEY `fk_btwvctiyixkbaviiaospcwhgmzcxcqmfuirg` (`revisionId`),
  CONSTRAINT `fk_btwvctiyixkbaviiaospcwhgmzcxcqmfuirg` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hbioprmyyyporsvemvaevhzaubogsauzjyzw` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_kowkkdkjzfrzomrxjvvtmcaztplpocuugvxo` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_siigegthidtppinkzzxtvcaifdahpgrrwhzs` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;

INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`)
VALUES
	(1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2021-08-07 00:01:41','2021-08-07 11:32:50',NULL,NULL,'5e64d208-2a29-4654-a886-acb715838cf3'),
	(2,NULL,NULL,NULL,5,'craft\\elements\\GlobalSet',1,0,'2021-08-07 00:06:03','2021-08-07 00:06:23',NULL,NULL,'6b96e0b0-0c3f-4de5-8631-0de30b34872c'),
	(3,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2021-08-07 00:10:57','2021-08-07 00:11:23',NULL,NULL,'ed9b2386-94c7-4317-98d3-7031a2d6e55a'),
	(4,NULL,NULL,NULL,3,'craft\\elements\\Category',1,0,'2021-08-07 00:11:05','2021-08-07 00:11:05',NULL,NULL,'e4286357-1d43-4f84-80b5-bb862c1dbfcb'),
	(5,NULL,NULL,NULL,3,'craft\\elements\\Category',1,0,'2021-08-07 00:11:08','2021-08-07 00:11:08',NULL,NULL,'e3a08567-d607-48c7-8735-6db2814b1ab7'),
	(6,NULL,NULL,NULL,3,'craft\\elements\\Category',1,0,'2021-08-07 00:11:12','2021-08-07 00:11:12',NULL,NULL,'b3be05a4-43b1-459f-919d-b0b4c5d30d2b'),
	(7,NULL,NULL,NULL,3,'craft\\elements\\Category',1,0,'2021-08-07 00:11:16','2021-08-07 00:11:16',NULL,NULL,'72f7037b-8788-4f84-bf4a-8d818698b33f'),
	(8,3,NULL,1,1,'craft\\elements\\Entry',1,0,'2021-08-07 00:11:23','2021-08-07 00:11:23',NULL,NULL,'f725cfb0-f624-41a4-b5b7-344b54af82dc'),
	(9,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2021-08-07 00:11:23','2021-08-07 00:11:29',NULL,NULL,'946bbf7a-30ac-46a8-9bed-f033cc71096e'),
	(10,9,NULL,2,1,'craft\\elements\\Entry',1,0,'2021-08-07 00:11:29','2021-08-07 00:11:29',NULL,NULL,'61d4ba4b-28f1-4c2a-a793-44031c23ed08'),
	(11,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2021-08-07 00:11:30','2021-08-07 00:11:35',NULL,NULL,'5f6975e3-8278-433c-9769-62e8e9978d11'),
	(12,11,NULL,3,1,'craft\\elements\\Entry',1,0,'2021-08-07 00:11:35','2021-08-07 00:11:35',NULL,NULL,'c575d9e3-3ec9-47af-bb08-16c90f68cafa'),
	(13,NULL,4,NULL,1,'craft\\elements\\Entry',1,0,'2021-08-07 00:11:36','2021-08-07 00:11:36',NULL,NULL,'d457736a-8802-445f-b7c2-b99c61471133'),
	(14,NULL,NULL,NULL,6,'verbb\\formie\\elements\\Form',1,0,'2021-08-07 00:44:07','2021-08-08 06:48:19',NULL,NULL,'7329ef3a-c123-40f9-8a65-633e706de190'),
	(15,NULL,NULL,NULL,4,'craft\\elements\\Tag',1,0,'2021-08-07 11:34:38','2021-08-07 11:34:38',NULL,NULL,'8269e58e-792a-45bd-b80f-c04a54948cb9'),
	(16,NULL,NULL,NULL,4,'craft\\elements\\Tag',1,0,'2021-08-07 11:34:42','2021-08-07 11:34:42',NULL,NULL,'a9ed41f3-137a-4de0-9649-4e53046230fe'),
	(17,NULL,NULL,NULL,4,'craft\\elements\\Tag',1,0,'2021-08-07 11:34:44','2021-08-07 11:34:44',NULL,NULL,'d80cfb3e-c270-4466-944b-c19b44f0626f'),
	(18,NULL,NULL,NULL,9,'verbb\\formie\\elements\\Form',1,0,'2021-08-07 12:09:46','2021-08-08 04:58:49',NULL,NULL,'53e5ad40-ccfb-4d82-bf14-f284e553949b');

/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table elements_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `elements_sites`;

CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qxnujusdiuphokqxmxugarthamziqpggdrsi` (`elementId`,`siteId`),
  KEY `idx_osjrzormsplhqhcxgfekzlvigwkpqqysqbjr` (`siteId`),
  KEY `idx_uunwkjxyvprpbyrfavydfrmdymytqtqznoxt` (`slug`,`siteId`),
  KEY `idx_vppobvwbdhyrliutvsicninmztvemtbhsdif` (`enabled`),
  KEY `idx_uccttgnelvunuetujcmkgrzvgmuzbfuwxgzq` (`uri`,`siteId`),
  CONSTRAINT `fk_ifgwtuzikdnnzotzrhpsngbesrncqpercznw` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_jzuonxrcyodohdfeskfjllkgophlwfblkwdb` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,NULL,NULL,1,'2021-08-07 00:01:41','2021-08-07 00:01:41','88c7a1a3-3071-4588-943b-3d638760dea1'),
	(2,2,1,NULL,NULL,1,'2021-08-07 00:06:03','2021-08-07 00:06:03','7a1ce879-ea3f-4749-adc4-9c4bdb5a42cb'),
	(3,3,1,'entry-1','demo/entry-1',1,'2021-08-07 00:10:57','2021-08-07 00:11:20','799c296c-4da3-4fb9-aea8-2e62ae54c855'),
	(4,4,1,'category-1','demo/category-1',1,'2021-08-07 00:11:05','2021-08-07 00:11:06','dab6e4c1-a602-4a29-9d15-9bea56ca2905'),
	(5,5,1,'category-2','demo/category-2',1,'2021-08-07 00:11:08','2021-08-07 00:11:10','61f6fb68-4e91-4c6e-a433-007aebf315cc'),
	(6,6,1,'category-3','demo/category-3',1,'2021-08-07 00:11:12','2021-08-07 00:11:13','cc5d3829-c9b6-427d-a01f-06c294eb3cac'),
	(7,7,1,'category-4','demo/category-4',1,'2021-08-07 00:11:16','2021-08-07 00:11:18','2cb64c81-af2a-4bfb-8ad8-a539c35854e4'),
	(8,8,1,'entry-1','demo/entry-1',1,'2021-08-07 00:11:23','2021-08-07 00:11:23','57aeb271-108c-4267-a434-bfebffbccbb1'),
	(9,9,1,'entry-2','demo/entry-2',1,'2021-08-07 00:11:23','2021-08-07 00:11:27','f8adaada-b936-4292-8ccc-8370c737d024'),
	(10,10,1,'entry-2','demo/entry-2',1,'2021-08-07 00:11:29','2021-08-07 00:11:29','ab9b21ff-c573-4fbc-b77f-7219bf4135eb'),
	(11,11,1,'entry-3','demo/entry-3',1,'2021-08-07 00:11:30','2021-08-07 00:11:33','83caf4f9-617b-4df5-86b1-53536e0db5f0'),
	(12,12,1,'entry-3','demo/entry-3',1,'2021-08-07 00:11:35','2021-08-07 00:11:35','b0e7c2e8-66cf-4e72-a46f-ffba80f8b141'),
	(13,13,1,'__temp_ubsxpbvhefiiitalkeptgivacbnamlzkqzdh','demo/__temp_ubsxpbvhefiiitalkeptgivacbnamlzkqzdh',1,'2021-08-07 00:11:36','2021-08-07 00:11:36','e75dbd29-5ba1-48f4-83ce-cbfa1ba8564c'),
	(14,14,1,NULL,NULL,1,'2021-08-07 00:44:07','2021-08-07 00:44:07','358f2b02-5a4f-438c-a953-098901413939'),
	(15,15,1,'tag-1',NULL,1,'2021-08-07 11:34:38','2021-08-07 11:34:38','59c4c590-63fa-4e95-9938-3f23ac237e2f'),
	(16,16,1,'tag-2',NULL,1,'2021-08-07 11:34:42','2021-08-07 11:34:42','a963e495-8eb2-4185-ad46-1a542e9c4eaf'),
	(17,17,1,'tag-3',NULL,1,'2021-08-07 11:34:44','2021-08-07 11:34:44','a7c8b47e-8026-487c-b8fa-babe1de7b068'),
	(18,18,1,NULL,NULL,1,'2021-08-07 12:09:46','2021-08-07 12:09:46','cec38647-82b7-4385-8ca2-1f88a00902a0');

/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `entries`;

CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;

INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(3,1,NULL,1,1,'2021-08-07 00:10:00',NULL,NULL,'2021-08-07 00:10:57','2021-08-07 00:10:57','9412ebe4-c5a0-4134-8b01-8077106ac0a0'),
	(8,1,NULL,1,1,'2021-08-07 00:10:00',NULL,NULL,'2021-08-07 00:11:23','2021-08-07 00:11:23','6173fbd1-ffd6-4dc1-ae94-e0d83812f474'),
	(9,1,NULL,1,1,'2021-08-07 00:11:00',NULL,NULL,'2021-08-07 00:11:23','2021-08-07 00:11:23','28612a02-42a7-4b18-a267-bcf6ae917a7d'),
	(10,1,NULL,1,1,'2021-08-07 00:11:00',NULL,NULL,'2021-08-07 00:11:29','2021-08-07 00:11:29','916766a5-e705-4e45-8e24-055c9c5730f0'),
	(11,1,NULL,1,1,'2021-08-07 00:11:00',NULL,NULL,'2021-08-07 00:11:30','2021-08-07 00:11:30','34865ed3-a596-4738-a172-048f1a7b8f7b'),
	(12,1,NULL,1,1,'2021-08-07 00:11:00',NULL,NULL,'2021-08-07 00:11:35','2021-08-07 00:11:35','aaa83f0d-0f91-419c-952b-000f94df6a52'),
	(13,1,NULL,1,1,'2021-08-07 00:11:00',NULL,NULL,'2021-08-07 00:11:36','2021-08-07 00:11:36','40fb3b6a-2f03-48cf-969b-68754b6f2a55');

/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table entrytypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `entrytypes`;

CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nnevdkopbvggsturgwzldqngjjpqoyfhbyqt` (`name`,`sectionId`),
  KEY `idx_oueohympcqknchbijtwbiipauysroesmmkmx` (`handle`,`sectionId`),
  KEY `idx_ndlmggyyzusysmvevqoachmsylgggtcsceiv` (`sectionId`),
  KEY `idx_wcakwamyxdrhkskprroesiukpmklyacvhdlh` (`fieldLayoutId`),
  KEY `idx_bsxkxkaglerqlfrizmlxmqxialfebqzylykj` (`dateDeleted`),
  CONSTRAINT `fk_fpfpmwedzzupgeaallcsxntiegyzjdjtfzzz` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tklthwntqwiumlvlfzlsljqyjcwoyaumzbil` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;

INSERT INTO `entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,1,1,'Default','default',1,'site',NULL,NULL,1,'2021-08-07 00:05:46','2021-08-07 00:05:46',NULL,'ee2e044d-867d-4cdf-b1b3-4e0d51e7a818');

/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fieldgroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldgroups`;

CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bfklndswcwoydzgcialpojkilhiijvbrrmuz` (`name`),
  KEY `idx_iayfljabcxbkhgifghzlaaekwpeioxtcookf` (`dateDeleted`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,'Common','2021-08-07 00:01:41','2021-08-07 00:01:41',NULL,'d644334e-fac0-46a1-8543-211e5168b02c');

/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fieldlayoutfields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldlayoutfields`;

CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cyvwftgvnhwatzrmdnbczsaaymgxznrphsdc` (`layoutId`,`fieldId`),
  KEY `idx_wpzmdehwqbsamuwecfwxghmdogxehfnadtep` (`sortOrder`),
  KEY `idx_nyhyjqjhnshetfmqqymxqdurwvtbjzvgiuqe` (`tabId`),
  KEY `idx_chsykqjmwpdpjlblvzaklxqubsdivqlhjyfd` (`fieldId`),
  CONSTRAINT `fk_qqrpzdetvqmnchkegmccdiekwsvhgcpleotp` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_syachfibqyrpsmfiqxgitxxznrclrugogksf` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yjxucykodtmkrbovphcfufggokyjfsvqkakw` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;

INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,5,5,1,0,0,'2021-08-07 00:06:23','2021-08-07 00:06:23','ef61d218-1e39-467e-9456-d795185ada64'),
	(2,3,6,1,0,1,'2021-08-07 00:11:59','2021-08-07 00:11:59','6dac5329-f68b-4120-b5d1-b7bda2cc4c04'),
	(3,1,7,1,0,1,'2021-08-07 00:12:01','2021-08-07 00:12:01','9a1505c8-f32a-468b-83bf-8ef42f56894e'),
	(4,2,8,1,0,1,'2021-08-07 00:12:16','2021-08-07 00:12:16','f1a6c3fd-426d-4f37-befd-ffe07cfe0870'),
	(5,4,9,1,0,1,'2021-08-07 00:12:18','2021-08-07 00:12:18','8b6012cf-9bd8-4070-a16f-da2a405167ad'),
	(1047,9,75,37,0,0,'2021-08-08 04:58:49','2021-08-08 04:58:49','ead04c03-bf72-47d5-8650-f52e8b4e5e1f'),
	(1048,9,75,38,1,1,'2021-08-08 04:58:49','2021-08-08 04:58:49','0c8df75f-75b2-4ce9-81b6-08c599cf0c4d'),
	(1049,9,75,39,1,2,'2021-08-08 04:58:49','2021-08-08 04:58:49','e215fc78-8f57-4a8e-9483-65fa68b79ec6'),
	(1260,7,92,33,0,0,'2021-08-08 06:48:19','2021-08-08 06:48:19','597459e6-9151-4ab4-8d33-e545d3b71d52'),
	(1261,8,93,34,0,0,'2021-08-08 06:48:19','2021-08-08 06:48:19','142f13d8-3a29-4373-b386-cc8d18bdd0bb'),
	(1262,6,10,2,0,0,'2021-08-08 06:48:19','2021-08-08 06:48:19','ad35050d-9136-45db-8b5c-7b851d2c4763'),
	(1263,6,10,3,0,1,'2021-08-08 06:48:19','2021-08-08 06:48:19','ecd410f0-f0d6-4bd0-9626-d3bb411f55e6'),
	(1264,6,10,4,0,2,'2021-08-08 06:48:19','2021-08-08 06:48:19','2657f0d6-a8ba-4f4d-b35a-e77090521f2d'),
	(1265,6,10,5,0,3,'2021-08-08 06:48:19','2021-08-08 06:48:19','65d555b4-5ff8-473e-b16a-0c49377388e6'),
	(1266,6,10,6,0,4,'2021-08-08 06:48:19','2021-08-08 06:48:19','1f60b84d-8bc1-42e5-901f-ee94fd5d3332'),
	(1267,6,10,7,0,5,'2021-08-08 06:48:19','2021-08-08 06:48:19','de9485e4-48f5-4da8-84e9-293b55e884ef'),
	(1268,6,10,8,0,6,'2021-08-08 06:48:19','2021-08-08 06:48:19','dcf30a24-4057-4f41-984d-a995296125f9'),
	(1269,6,10,9,0,7,'2021-08-08 06:48:19','2021-08-08 06:48:19','04187688-909d-4174-90e2-0965d7642f77'),
	(1270,6,10,10,0,8,'2021-08-08 06:48:19','2021-08-08 06:48:19','c7ed2a56-7768-48fe-bd0a-f0113ab78341'),
	(1271,6,10,11,0,9,'2021-08-08 06:48:19','2021-08-08 06:48:19','450e8830-7255-472a-8b25-b2d2491f9818'),
	(1272,6,10,12,0,10,'2021-08-08 06:48:19','2021-08-08 06:48:19','91b08530-80a6-42fe-8b91-17eef7e71918'),
	(1273,6,10,13,0,11,'2021-08-08 06:48:19','2021-08-08 06:48:19','871c9adf-5200-4779-a7f5-b85f47e530c1'),
	(1274,6,10,14,0,12,'2021-08-08 06:48:19','2021-08-08 06:48:19','f28775f1-1a30-4f0c-9509-1e6cafdad7c2'),
	(1275,6,11,15,0,0,'2021-08-08 06:48:19','2021-08-08 06:48:19','64808d1c-4b81-4127-a41a-099ee51cbff2'),
	(1276,6,11,16,0,1,'2021-08-08 06:48:19','2021-08-08 06:48:19','2b118f68-a7c2-4607-b7a7-495351560913'),
	(1277,6,11,17,0,2,'2021-08-08 06:48:19','2021-08-08 06:48:19','e9cb8762-88f1-483f-8e70-836850773812'),
	(1278,6,11,18,0,3,'2021-08-08 06:48:19','2021-08-08 06:48:19','8188e46b-4ab0-4df4-8fd0-05a68b64c6a0'),
	(1279,6,11,30,0,4,'2021-08-08 06:48:19','2021-08-08 06:48:19','621b9e2d-8c86-43d1-b19f-fb29e280f2a5'),
	(1280,6,11,31,0,5,'2021-08-08 06:48:19','2021-08-08 06:48:19','3c211a93-9336-4110-a761-eb6391c0dfaf'),
	(1281,6,11,32,0,6,'2021-08-08 06:48:19','2021-08-08 06:48:19','71a84602-57cf-4839-8e9e-f6a4bea9cc0c'),
	(1282,6,11,19,0,7,'2021-08-08 06:48:19','2021-08-08 06:48:19','ea8b554b-11ca-4788-9ab1-f07390391240'),
	(1283,6,11,20,0,8,'2021-08-08 06:48:19','2021-08-08 06:48:19','aacbfe58-3b3e-431c-83f4-a0aa5922d952'),
	(1284,6,11,21,0,9,'2021-08-08 06:48:19','2021-08-08 06:48:19','101da320-108b-4558-a20d-205a71d7d346'),
	(1285,6,11,22,0,10,'2021-08-08 06:48:19','2021-08-08 06:48:19','c965e597-6cf6-4b58-90eb-a165fa304b77'),
	(1286,6,11,23,0,11,'2021-08-08 06:48:19','2021-08-08 06:48:19','1b2ed290-631c-464f-b291-8ac6295355cf'),
	(1287,6,11,24,0,12,'2021-08-08 06:48:19','2021-08-08 06:48:19','b1ad33bd-78b3-46ac-9477-1fbb18992c25'),
	(1288,6,11,25,0,13,'2021-08-08 06:48:19','2021-08-08 06:48:19','0de50325-e004-4d13-9c44-2c72b6b65e5d'),
	(1289,6,12,26,0,0,'2021-08-08 06:48:19','2021-08-08 06:48:19','60050df8-639f-41db-8f6d-26ed73904d5d'),
	(1290,6,12,35,1,1,'2021-08-08 06:48:19','2021-08-08 06:48:19','6889c7d2-18ad-4bad-a1cc-c97ef535e22b'),
	(1291,6,12,36,0,2,'2021-08-08 06:48:19','2021-08-08 06:48:19','b8412d97-2c8e-44ba-9128-347a8e190b7c'),
	(1292,6,12,27,0,3,'2021-08-08 06:48:19','2021-08-08 06:48:19','a99d27d3-1f24-4690-b3e3-cf6a4c6bf7ce'),
	(1293,6,12,28,0,4,'2021-08-08 06:48:19','2021-08-08 06:48:19','811481c2-d06b-4c73-adab-65a6b34f7788'),
	(1294,6,12,29,0,5,'2021-08-08 06:48:19','2021-08-08 06:48:19','c9c90ab6-675c-4f48-956f-68995c72c374');

/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fieldlayouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldlayouts`;

CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eouxgdocvotlxlltycieumakkhflxkdzsmwv` (`dateDeleted`),
  KEY `idx_ffdztcwcablverwoauuirnpbydrxnogympgq` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;

INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,'craft\\elements\\Entry','2021-08-07 00:05:46','2021-08-07 00:05:46',NULL,'6bbdaea4-ec82-409c-92e1-f7dba84ecfc8'),
	(2,'craft\\elements\\Asset','2021-08-07 00:06:01','2021-08-07 00:06:01',NULL,'a65d044a-042f-4258-994d-611713ff5b4d'),
	(3,'craft\\elements\\Category','2021-08-07 00:06:08','2021-08-07 00:06:08',NULL,'db9789d3-9833-4279-a1cb-7f14d1d50ab3'),
	(4,'craft\\elements\\Tag','2021-08-07 00:06:12','2021-08-07 00:06:12',NULL,'4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558'),
	(5,'craft\\elements\\GlobalSet','2021-08-07 00:06:23','2021-08-07 00:06:23',NULL,'f6ac1175-0650-454a-87ac-3af1d5ed99c4'),
	(6,'verbb\\formie\\elements\\Form','2021-08-07 00:44:07','2021-08-07 00:44:07',NULL,'ebf9925b-9415-4b8f-89cc-7d6421a8e11c'),
	(7,'verbb\\formie\\fields\\formfields\\Repeater','2021-08-07 00:58:27','2021-08-07 00:58:27',NULL,'85a0ffb1-c107-4f9d-a2b5-9426edd52ffd'),
	(8,'verbb\\formie\\fields\\formfields\\Group','2021-08-07 00:58:27','2021-08-07 00:58:27',NULL,'8a67b428-2d70-4851-9646-45a4916d8645'),
	(9,'verbb\\formie\\elements\\Form','2021-08-07 12:09:46','2021-08-07 12:09:46',NULL,'eb58df8a-bed7-469b-bfa4-6234d6b5d32b');

/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fieldlayouttabs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldlayouttabs`;

CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elements` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xctbczeutgwfxftmtjaivvdnxyyndjspuotn` (`sortOrder`),
  KEY `idx_tvsbpbwqznpykpuyeeogkvlisltidwgvnsxw` (`layoutId`),
  CONSTRAINT `fk_uljcisfbxgnojhkekealcieqeekplwzonxkb` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;

INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(5,5,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a\"}]',1,'2021-08-07 00:06:23','2021-08-07 00:06:23','2eb1fa2c-f225-4b23-b5ae-8351c1fc67c0'),
	(6,3,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\TitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a\"}]',1,'2021-08-07 00:11:59','2021-08-07 00:11:59','ca0d1466-0bbe-407a-9611-c0cf907f0306'),
	(7,1,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a\"}]',1,'2021-08-07 00:12:01','2021-08-07 00:12:01','77cc68d7-9d2a-4197-9197-96aac48d3c65'),
	(8,2,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a\"}]',1,'2021-08-07 00:12:16','2021-08-07 00:12:16','0fd31b68-47cd-46c7-a16a-27806265ab2a'),
	(9,4,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\TitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a\"}]',1,'2021-08-07 00:12:18','2021-08-07 00:12:18','60f45000-9c35-4004-98f2-bb76f81cd0cd'),
	(10,6,'Common','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"83573e09-b99e-4356-9922-9a5728852d0d\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"dd42f888-e2df-41a6-a1e6-dff7a4c63e81\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"24c6f00c-3d84-47c3-9bd4-c000807c35ba\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"997d4ae2-1677-4e60-abc5-15b5116c5e93\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"612b3cae-0c2a-4d5d-b537-b63774da566a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"2b0664a9-75df-47d2-ae4c-25510ce5ba67\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"ce89d50c-4cb8-42a7-961e-a7b15fea77c5\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"24985483-e672-465b-9dcb-27756159b55e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"5bba6ecb-9f71-4f97-9a48-0fb0164f8b00\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"abe72576-ea08-41e6-9bde-41814249039d\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"c0ad1b7b-e90f-427d-bbe9-0c97be6b5dc5\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"8f5d7bc4-a867-412f-b317-9e417ab01021\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"6d50ea47-04df-4080-a7f1-b2294c133401\"}]',0,'2021-08-07 00:44:07','2021-08-08 06:48:19','6d848ba2-736e-4a98-a251-839250d7a928'),
	(11,6,'Advanced','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"3ea44a66-8efe-4436-a147-4650e0c29e00\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"6e590ae5-9621-4149-ba0a-268de5e7944c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1a41d78b-42cb-487c-9e0e-e26593ed1c06\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"0632ba0b-18a5-49b0-85d7-29446b7b1ab9\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"9e693c98-808f-49b2-8196-cfa84f6f55ac\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"61b87273-d0fc-4a55-81ec-b9803ecafde9\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"627856c4-707f-4684-a4da-dbd9f3ce6c04\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"f54e8ec1-62e8-465f-90ab-8fc68d1f801b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"198d0e65-1cf1-43b4-85e4-065ef51eaed4\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"a1072170-4b7e-4872-812f-c6c3a650ebad\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"d52b78e5-fb1f-4368-932a-9a59bdfc0b78\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"28aeed7a-e6b5-4b81-bacb-ceec52fb6c7b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"2914d115-4c92-4e2f-9a30-d2f935387e37\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7f73e5fa-db51-47c1-ad96-a670532a966a\"}]',1,'2021-08-07 00:56:32','2021-08-07 05:28:42','298bb57b-6ffb-451e-99e1-eaaee3bf218e'),
	(12,6,'Elements','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"6ba49b85-5301-4240-9650-921db92e3062\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"57252155-6064-45cb-a805-d99aa677c2cc\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"fd497ad6-a939-48d7-b736-87cbf1103edd\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"0a6ac0a5-d58b-4472-bb99-bbdd7c34daf3\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"e9166ffb-4ca8-4423-947b-0d05614a5f57\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"a878a70e-95af-4f63-b9f9-1ee3c61a56d3\"}]',2,'2021-08-07 00:56:32','2021-08-08 06:21:15','abd9f82a-e462-4521-82fe-c97531bb6478'),
	(75,9,'Page 1','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"c70240ab-f426-4353-880e-03ee4c8977b5\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"eb0f4f41-b0ed-4057-8908-3c7e5ff32bfb\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"7d34bb51-fa15-4dde-9f00-4cd28d3a77b5\"}]',0,'2021-08-07 12:09:46','2021-08-08 04:58:49','cc4f782b-656d-4091-b2a2-48e032910dee'),
	(92,7,'Fields','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"72c1cd95-cc9a-4291-bef0-f9ce458425f3\"}]',0,'2021-08-08 06:48:19','2021-08-08 06:48:19','02d4259a-8446-460a-af0f-1c887b41c2eb'),
	(93,8,'Fields','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"ec12ff3a-dbdc-4bc9-9ad5-f4a0fb5d3678\"}]',0,'2021-08-08 06:48:19','2021-08-08 06:48:19','47a3f1bf-3dd7-4c4b-8362-801f82c766ba');

/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fields`;

CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_clmovriquzkhubhvufnkayudfakstjuhypee` (`handle`,`context`),
  KEY `idx_wpevggbycmwmogmgbajnpxmpnvpvpbjafwlq` (`groupId`),
  KEY `idx_tmaxqhykdihaszkuxwxauihfcllrzmrohvtj` (`context`),
  CONSTRAINT `fk_lnmfvrrrdthfhlcwjswjcvrdvyliqgjcfmol` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;

INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'Plain Text','plainText','global','kukrbgdv',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-08-07 00:05:27','2021-08-07 00:05:27','2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a'),
	(2,NULL,'Single Line Text','singleLineText','formie:7329ef3a-c123-40f9-8a65-633e706de190','nqbzwzio','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\SingleLineText','{\"columnWidth\":12,\"limit\":true,\"limitType\":\"words\",\"limitAmount\":\"10\",\"placeholder\":\"\",\"defaultValue\":\"\",\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":\"test\",\"containerAttributes\":[{\"label\":\"data-test\",\"value\":\"tfgdfg\"}],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:46:54','2021-08-07 02:50:45','83573e09-b99e-4356-9922-9a5728852d0d'),
	(3,NULL,'Multi Line Text','multiLineText','formie:7329ef3a-c123-40f9-8a65-633e706de190','kxemonkx','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\MultiLineText','{\"useRichText\":null,\"richTextButtons\":[\"bold\",\"italic\"],\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:46:54','2021-08-07 00:48:50','dd42f888-e2df-41a6-a1e6-dff7a4c63e81'),
	(4,NULL,'Radio Buttons','radioButtons','formie:7329ef3a-c123-40f9-8a65-633e706de190','jhuukjto','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Radio','{\"layout\":\"vertical\",\"options\":[{\"label\":\"Option 1\",\"value\":\"Option 1\",\"isDefault\":false},{\"label\":\"Option 2\",\"value\":\"Option 2\",\"isDefault\":false},{\"label\":\"Option 3\",\"value\":\"Option 3\",\"isDefault\":false}],\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:46:54','2021-08-07 00:48:50','24c6f00c-3d84-47c3-9bd4-c000807c35ba'),
	(5,NULL,'Checkboxes','checkboxes','formie:7329ef3a-c123-40f9-8a65-633e706de190','olbsolji','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Checkboxes','{\"multi\":true,\"layout\":\"vertical\",\"toggleCheckbox\":\"\",\"toggleCheckboxLabel\":null,\"options\":[{\"label\":\"Option 1\",\"value\":\"Option 1\",\"isDefault\":false},{\"label\":\"Option 2\",\"value\":\"Option 2\",\"isDefault\":false},{\"label\":\"Option 3\",\"value\":\"Option 3\",\"isDefault\":false}],\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:48:51','2021-08-07 00:48:51','997d4ae2-1677-4e60-abc5-15b5116c5e93'),
	(6,NULL,'Dropdown','dropdown','formie:7329ef3a-c123-40f9-8a65-633e706de190','xgoxdjsf','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Dropdown','{\"multiple\":null,\"multi\":null,\"optgroups\":true,\"options\":[{\"label\":\"Select an option\",\"value\":\"\",\"isDefault\":true},{\"label\":\"Option 1\",\"value\":\"Option 1\",\"isDefault\":false},{\"label\":\"Option 2\",\"value\":\"Option 2\",\"isDefault\":false},{\"label\":\"Option 3\",\"value\":\"Option 3\",\"isDefault\":false}],\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:48:51','2021-08-07 00:48:51','612b3cae-0c2a-4d5d-b537-b63774da566a'),
	(7,NULL,'Dropdown Multi','dropdownMulti','formie:7329ef3a-c123-40f9-8a65-633e706de190','nwpqbdmu','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Dropdown','{\"multiple\":true,\"multi\":true,\"optgroups\":true,\"options\":[{\"label\":\"Select an option\",\"value\":\"\",\"isDefault\":true},{\"label\":\"Option 1\",\"value\":\"Option 1\",\"isDefault\":false},{\"label\":\"Option 2\",\"value\":\"Option 2\",\"isDefault\":false},{\"label\":\"Option 3\",\"value\":\"Option 3\",\"isDefault\":false}],\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:48:51','2021-08-07 03:54:29','2b0664a9-75df-47d2-ae4c-25510ce5ba67'),
	(8,NULL,'Number','number','formie:7329ef3a-c123-40f9-8a65-633e706de190','ukvrxrzu','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Number','{\"min\":null,\"max\":null,\"decimals\":0,\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:56:31','2021-08-07 00:56:31','ce89d50c-4cb8-42a7-961e-a7b15fea77c5'),
	(9,NULL,'Name','name1','formie:7329ef3a-c123-40f9-8a65-633e706de190','zpqpjlhd','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Name','{\"useMultipleFields\":null,\"prefixEnabled\":false,\"prefixCollapsed\":true,\"prefixLabel\":\"Prefix\",\"prefixPlaceholder\":null,\"prefixDefaultValue\":\"\",\"prefixPrePopulate\":\"\",\"prefixRequired\":null,\"prefixErrorMessage\":null,\"firstNameEnabled\":true,\"firstNameCollapsed\":true,\"firstNameLabel\":\"First Name\",\"firstNamePlaceholder\":null,\"firstNameDefaultValue\":\"\",\"firstNamePrePopulate\":\"\",\"firstNameRequired\":null,\"firstNameErrorMessage\":null,\"middleNameEnabled\":false,\"middleNameCollapsed\":true,\"middleNameLabel\":\"Middle Name\",\"middleNamePlaceholder\":null,\"middleNameDefaultValue\":\"\",\"middleNamePrePopulate\":\"\",\"middleNameRequired\":null,\"middleNameErrorMessage\":null,\"lastNameEnabled\":true,\"lastNameCollapsed\":true,\"lastNameLabel\":\"Last Name\",\"lastNamePlaceholder\":null,\"lastNameDefaultValue\":\"\",\"lastNamePrePopulate\":\"\",\"lastNameRequired\":null,\"lastNameErrorMessage\":null,\"subfieldLabelPosition\":\"\",\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:56:31','2021-08-07 00:56:31','24985483-e672-465b-9dcb-27756159b55e'),
	(10,NULL,'Name Multi','nameMulti','formie:7329ef3a-c123-40f9-8a65-633e706de190','nrfrfdvb','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Name','{\"useMultipleFields\":true,\"prefixEnabled\":true,\"prefixCollapsed\":false,\"prefixLabel\":\"Prefix\",\"prefixPlaceholder\":null,\"prefixDefaultValue\":\"\",\"prefixPrePopulate\":\"\",\"prefixRequired\":null,\"prefixErrorMessage\":null,\"firstNameEnabled\":true,\"firstNameCollapsed\":true,\"firstNameLabel\":\"First Name\",\"firstNamePlaceholder\":null,\"firstNameDefaultValue\":\"\",\"firstNamePrePopulate\":\"\",\"firstNameRequired\":null,\"firstNameErrorMessage\":null,\"middleNameEnabled\":true,\"middleNameCollapsed\":false,\"middleNameLabel\":\"Middle Name\",\"middleNamePlaceholder\":null,\"middleNameDefaultValue\":\"\",\"middleNamePrePopulate\":\"\",\"middleNameRequired\":null,\"middleNameErrorMessage\":null,\"lastNameEnabled\":true,\"lastNameCollapsed\":true,\"lastNameLabel\":\"Last Name\",\"lastNamePlaceholder\":null,\"lastNameDefaultValue\":\"\",\"lastNamePrePopulate\":\"\",\"lastNameRequired\":null,\"lastNameErrorMessage\":null,\"subfieldLabelPosition\":\"\",\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:56:31','2021-08-07 00:56:31','5bba6ecb-9f71-4f97-9a48-0fb0164f8b00'),
	(11,NULL,'Email Address','emailAddress','formie:7329ef3a-c123-40f9-8a65-633e706de190','vqgdazaj','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Email','{\"validateDomain\":false,\"blockedDomains\":[],\"uniqueValue\":false,\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:56:31','2021-08-07 00:56:31','abe72576-ea08-41e6-9bde-41814249039d'),
	(12,NULL,'Phone Number','phoneNumber','formie:7329ef3a-c123-40f9-8a65-633e706de190','iscbxhry','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Phone','{\"countryEnabled\":false,\"countryCollapsed\":true,\"countryShowDialCode\":true,\"countryDefaultValue\":\"\",\"countryAllowed\":[],\"subfieldLabelPosition\":null,\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:56:31','2021-08-07 00:56:31','c0ad1b7b-e90f-427d-bbe9-0c97be6b5dc5'),
	(13,NULL,'Phone Number Country','phoneNumberCountry','formie:7329ef3a-c123-40f9-8a65-633e706de190','rwvonsyq','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Phone','{\"countryEnabled\":true,\"countryCollapsed\":true,\"countryShowDialCode\":true,\"countryDefaultValue\":\"\",\"countryAllowed\":[],\"subfieldLabelPosition\":null,\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:56:31','2021-08-07 00:56:31','8f5d7bc4-a867-412f-b317-9e417ab01021'),
	(14,NULL,'Agree','agree','formie:7329ef3a-c123-40f9-8a65-633e706de190','imaejzom','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Agree','{\"description\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"I agree to this\\\"}]}]\",\"checkedValue\":\"Yes\",\"uncheckedValue\":\"No\",\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":false,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":null,\"formId\":14,\"isNested\":false}','2021-08-07 00:56:31','2021-08-08 05:47:11','6d50ea47-04df-4080-a7f1-b2294c133401'),
	(15,NULL,'Date','date','formie:7329ef3a-c123-40f9-8a65-633e706de190','bwqneecg','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Date','{\"dateFormat\":\"Y-m-d\",\"timeFormat\":\"H:i\",\"displayType\":\"calendar\",\"includeTime\":false,\"timeLabel\":\"\",\"defaultOption\":\"\",\"dayLabel\":\"Day\",\"dayPlaceholder\":\"\",\"monthLabel\":\"Month\",\"monthPlaceholder\":\"\",\"yearLabel\":\"Year\",\"yearPlaceholder\":\"\",\"hourLabel\":\"Hour\",\"hourPlaceholder\":\"\",\"minuteLabel\":\"Minute\",\"minutePlaceholder\":\"\",\"secondLabel\":\"Second\",\"secondPlaceholder\":\"\",\"ampmLabel\":\"AM/PM\",\"ampmPlaceholder\":\"\",\"useDatePicker\":true,\"minDate\":[],\"maxDate\":[],\"subfieldLabelPosition\":\"\",\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":\"\",\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:56:31','2021-08-07 00:56:31','3ea44a66-8efe-4436-a147-4650e0c29e00'),
	(16,NULL,'Address','address','formie:7329ef3a-c123-40f9-8a65-633e706de190','hzicgdmp','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Address','{\"autocompleteIntegration\":null,\"autocompleteEnabled\":false,\"autocompleteCollapsed\":true,\"autocompleteLabel\":\"Auto-Complete\",\"autocompletePlaceholder\":null,\"autocompleteDefaultValue\":\"\",\"autocompletePrePopulate\":\"\",\"autocompleteRequired\":null,\"autocompleteErrorMessage\":null,\"address1Enabled\":true,\"address1Collapsed\":true,\"address1Label\":\"Address 1\",\"address1Placeholder\":null,\"address1DefaultValue\":\"\",\"address1PrePopulate\":\"\",\"address1Required\":null,\"address1ErrorMessage\":null,\"address1Hidden\":null,\"address2Enabled\":true,\"address2Collapsed\":false,\"address2Label\":\"Address 2\",\"address2Placeholder\":null,\"address2DefaultValue\":\"\",\"address2PrePopulate\":\"\",\"address2Required\":null,\"address2ErrorMessage\":null,\"address2Hidden\":null,\"address3Enabled\":true,\"address3Collapsed\":false,\"address3Label\":\"Address 3\",\"address3Placeholder\":null,\"address3DefaultValue\":\"\",\"address3PrePopulate\":\"\",\"address3Required\":null,\"address3ErrorMessage\":null,\"address3Hidden\":null,\"cityEnabled\":true,\"cityCollapsed\":true,\"cityLabel\":\"City\",\"cityPlaceholder\":null,\"cityDefaultValue\":\"\",\"cityPrePopulate\":\"\",\"cityRequired\":null,\"cityErrorMessage\":null,\"cityHidden\":null,\"stateEnabled\":true,\"stateCollapsed\":true,\"stateLabel\":\"State / Province\",\"statePlaceholder\":null,\"stateDefaultValue\":\"\",\"statePrePopulate\":\"\",\"stateRequired\":null,\"stateErrorMessage\":null,\"stateHidden\":null,\"zipEnabled\":true,\"zipCollapsed\":true,\"zipLabel\":\"ZIP / Postal Code\",\"zipPlaceholder\":null,\"zipDefaultValue\":\"\",\"zipPrePopulate\":\"\",\"zipRequired\":null,\"zipErrorMessage\":null,\"zipHidden\":null,\"countryEnabled\":true,\"countryCollapsed\":true,\"countryLabel\":\"Country\",\"countryPlaceholder\":null,\"countryDefaultValue\":\"\",\"countryPrePopulate\":\"\",\"countryRequired\":null,\"countryErrorMessage\":null,\"countryHidden\":null,\"enableAutocomplete\":null,\"subfieldLabelPosition\":\"\",\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:58:27','2021-08-07 00:58:27','6e590ae5-9621-4149-ba0a-268de5e7944c'),
	(17,NULL,'File Upload','fileUpload','formie:7329ef3a-c123-40f9-8a65-633e706de190',NULL,'Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\FileUpload','{\"searchable\":true,\"sizeLimit\":null,\"sizeMinLimit\":null,\"limitFiles\":null,\"restrictFiles\":true,\"allowedKinds\":[\"image\",\"pdf\"],\"uploadLocationSource\":\"folder:adf62689-9e99-4040-8bb3-c06de71033be\",\"uploadLocationSubpath\":\"\",\"useSingleFolder\":true,\"allowUploads\":true,\"defaultUploadLocationSource\":null,\"defaultUploadLocationSubpath\":null,\"singleUploadLocationSource\":\"folder:adf62689-9e99-4040-8bb3-c06de71033be\",\"singleUploadLocationSubpath\":\"\",\"showUnpermittedVolumes\":false,\"showUnpermittedFiles\":false,\"previewMode\":\"full\",\"columnWidth\":12,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false,\"limitOptions\":null,\"displayType\":\"dropdown\",\"labelSource\":\"title\",\"orderBy\":\"title ASC\",\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":null,\"selectionLabel\":null,\"showSiteMenu\":false,\"localizeRelations\":false,\"validateRelatedElements\":false,\"allowSelfRelations\":false}','2021-08-07 00:58:27','2021-08-07 00:58:27','1a41d78b-42cb-487c-9e0e-e26593ed1c06'),
	(18,NULL,'Recipients - Hidden','recipientsHidden','formie:7329ef3a-c123-40f9-8a65-633e706de190','oyokmeqk','',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Recipients','{\"displayType\":\"hidden\",\"options\":[],\"multiple\":null,\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"verbb\\\\formie\\\\positions\\\\Hidden\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:58:27','2021-08-07 05:31:06','0632ba0b-18a5-49b0-85d7-29446b7b1ab9'),
	(19,NULL,'Hidden','hidden','formie:7329ef3a-c123-40f9-8a65-633e706de190','qebauvli','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Hidden','{\"defaultOption\":\"custom\",\"queryParameter\":null,\"cookieName\":null,\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"verbb\\\\formie\\\\positions\\\\Hidden\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":null,\"enableContentEncryption\":false,\"visibility\":null,\"formId\":14,\"isNested\":false}','2021-08-07 00:58:27','2021-08-07 00:58:27','f54e8ec1-62e8-465f-90ab-8fc68d1f801b'),
	(20,NULL,'Repeater','repeater','formie:7329ef3a-c123-40f9-8a65-633e706de190',NULL,'Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Repeater','{\"minRows\":null,\"maxRows\":null,\"addLabel\":\"Add another row\",\"contentTable\":\"{{%fmc_14_repeater}}\",\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:58:27','2021-08-07 00:58:27','198d0e65-1cf1-43b4-85e4-065ef51eaed4'),
	(21,NULL,'Table','table','formie:7329ef3a-c123-40f9-8a65-633e706de190','xzvobupk','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Table','{\"searchable\":true,\"columns\":{\"col1\":{\"heading\":\"Column 1\",\"handle\":\"column1\",\"width\":\"\",\"type\":\"checkbox\"},\"col2\":{\"heading\":\"Column 2\",\"handle\":\"column2\",\"width\":\"\",\"type\":\"color\"},\"col3\":{\"heading\":\"Column 3\",\"handle\":\"column3\",\"width\":\"\",\"type\":\"date\"},\"col4\":{\"heading\":\"Column 4\",\"handle\":\"column4\",\"width\":\"\",\"type\":\"select\",\"options\":[{\"label\":\"Option 1\",\"value\":\"Option 1\",\"isOptgroup\":false,\"isDefault\":false},{\"label\":\"Option 2\",\"value\":\"Option 2\",\"isOptgroup\":false,\"isDefault\":false}]},\"col5\":{\"heading\":\"Column 5\",\"handle\":\"column5\",\"width\":\"\",\"type\":\"email\"},\"col6\":{\"heading\":\"Column 6\",\"handle\":\"column6\",\"width\":\"\",\"type\":\"heading\"},\"col7\":{\"heading\":\"Column 7\",\"handle\":\"column7\",\"width\":\"\",\"type\":\"multiline\"},\"col8\":{\"heading\":\"Column 8\",\"handle\":\"column8\",\"width\":\"\",\"type\":\"number\"},\"col9\":{\"heading\":\"Column 9\",\"handle\":\"column9\",\"width\":\"\",\"type\":\"time\"},\"col10\":{\"heading\":\"Column 10\",\"handle\":\"column10\",\"width\":\"\",\"type\":\"singleline\"},\"col11\":{\"heading\":\"Column 11\",\"handle\":\"column11\",\"width\":\"\",\"type\":\"url\"}},\"static\":false,\"addRowLabel\":\"Add row\",\"maxRows\":null,\"minRows\":null,\"defaults\":[],\"columnType\":\"text\",\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:58:27','2021-08-07 06:33:57','a1072170-4b7e-4872-812f-c6c3a650ebad'),
	(22,NULL,'Group','group','formie:7329ef3a-c123-40f9-8a65-633e706de190',NULL,'Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Group','{\"contentTable\":\"{{%fmc_14_group}}\",\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:58:27','2021-08-07 00:58:27','d52b78e5-fb1f-4368-932a-9a59bdfc0b78'),
	(23,NULL,'Heading','heading','formie:7329ef3a-c123-40f9-8a65-633e706de190',NULL,'Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Heading','{\"headingSize\":\"h2\",\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":null,\"formId\":14,\"isNested\":false}','2021-08-07 00:58:27','2021-08-07 00:58:27','28aeed7a-e6b5-4b81-bacb-ceec52fb6c7b'),
	(24,NULL,'Section Label d829ed945e07f81dcf094187d190717d','sectionHandleeb34f5bfdc35eb4f287744858e38bc96','formie:7329ef3a-c123-40f9-8a65-633e706de190',NULL,'Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Section','{\"borderStyle\":\"solid\",\"borderWidth\":1,\"borderColor\":\"#ccc\",\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:58:27','2021-08-08 06:48:19','2914d115-4c92-4e2f-9a30-d2f935387e37'),
	(25,NULL,'HTML','html','formie:7329ef3a-c123-40f9-8a65-633e706de190',NULL,'Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Html','{\"htmlContent\":null,\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 00:58:27','2021-08-07 07:29:22','7f73e5fa-db51-47c1-ad96-a670532a966a'),
	(26,NULL,'Entries - Dropdown','entriesDropdown','formie:7329ef3a-c123-40f9-8a65-633e706de190',NULL,'Please fill out this field.',1,'site',NULL,'verbb\\formie\\fields\\formfields\\Entries','{\"searchable\":true,\"columnWidth\":12,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":\"Select an entry\",\"defaultValue\":[],\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false,\"limitOptions\":null,\"displayType\":\"dropdown\",\"labelSource\":\"title\",\"orderBy\":\"id ASC\",\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":null,\"selectionLabel\":null,\"showSiteMenu\":false,\"localizeRelations\":false,\"validateRelatedElements\":false,\"allowSelfRelations\":false}','2021-08-07 01:05:55','2021-08-07 11:31:54','6ba49b85-5301-4240-9650-921db92e3062'),
	(27,NULL,'Categories','categories','formie:7329ef3a-c123-40f9-8a65-633e706de190',NULL,'Please fill out this field.',1,'site',NULL,'verbb\\formie\\fields\\formfields\\Categories','{\"searchable\":true,\"allowLimit\":false,\"allowMultipleSources\":false,\"branchLimit\":null,\"columnWidth\":12,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":\"Select a category\",\"defaultValue\":[],\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false,\"limitOptions\":null,\"displayType\":\"dropdown\",\"labelSource\":\"id\",\"orderBy\":\"id ASC\",\"sources\":\"*\",\"source\":\"group:12530c06-549d-4664-97d3-2a96906bde12\",\"targetSiteId\":null,\"viewMode\":null,\"limit\":null,\"selectionLabel\":null,\"showSiteMenu\":false,\"localizeRelations\":false,\"validateRelatedElements\":false,\"allowSelfRelations\":false}','2021-08-07 01:05:55','2021-08-07 01:05:55','0a6ac0a5-d58b-4472-bb99-bbdd7c34daf3'),
	(28,NULL,'Tags','tags','formie:7329ef3a-c123-40f9-8a65-633e706de190',NULL,'Please fill out this field.',1,'site',NULL,'verbb\\formie\\fields\\formfields\\Tags','{\"searchable\":true,\"allowMultipleSources\":false,\"allowLimit\":false,\"columnWidth\":12,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":\"Select a tag\",\"defaultValue\":[],\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false,\"limitOptions\":null,\"displayType\":\"dropdown\",\"labelSource\":\"id\",\"orderBy\":\"title ASC\",\"sources\":\"*\",\"source\":\"taggroup:9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15\",\"targetSiteId\":null,\"viewMode\":null,\"limit\":null,\"selectionLabel\":null,\"showSiteMenu\":false,\"localizeRelations\":false,\"validateRelatedElements\":false,\"allowSelfRelations\":false}','2021-08-07 01:05:55','2021-08-07 01:05:55','e9166ffb-4ca8-4423-947b-0d05614a5f57'),
	(29,NULL,'Users','users','formie:7329ef3a-c123-40f9-8a65-633e706de190',NULL,'Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Users','{\"searchable\":true,\"columnWidth\":12,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":\"Select a user\",\"defaultValue\":[],\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false,\"limitOptions\":null,\"displayType\":\"dropdown\",\"labelSource\":\"id\",\"orderBy\":\"id ASC\",\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":null,\"selectionLabel\":null,\"showSiteMenu\":false,\"localizeRelations\":false,\"validateRelatedElements\":false,\"allowSelfRelations\":false}','2021-08-07 01:05:55','2021-08-07 01:05:55','a878a70e-95af-4f63-b9f9-1ee3c61a56d3'),
	(30,NULL,'Recipients - Dropdown','recipientsDropdown2','formie:7329ef3a-c123-40f9-8a65-633e706de190','tjydboqn','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Recipients','{\"displayType\":\"dropdown\",\"options\":[{\"label\":\"Recipient 1\",\"value\":\"Recipient 1\",\"isDefault\":false},{\"label\":\"Recipient 2\",\"value\":\"Recipient 2\",\"isDefault\":false},{\"label\":\"Recipient 3\",\"value\":\"Recipient 3\",\"isDefault\":false}],\"multiple\":null,\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 05:28:42','2021-08-07 05:31:06','9e693c98-808f-49b2-8196-cfa84f6f55ac'),
	(31,NULL,'Recipients - Checkboxes','recipientsCheckboxes','formie:7329ef3a-c123-40f9-8a65-633e706de190','vskdkugc','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Recipients','{\"displayType\":\"checkboxes\",\"options\":[{\"label\":\"Recipient 1\",\"value\":\"Recipient 1\",\"isDefault\":false},{\"label\":\"Recipient 2\",\"value\":\"Recipient 2\",\"isDefault\":false},{\"label\":\"Recipient 3\",\"value\":\"Recipient 3\",\"isDefault\":false}],\"multiple\":null,\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 05:28:42','2021-08-07 05:31:06','61b87273-d0fc-4a55-81ec-b9803ecafde9'),
	(32,NULL,'Recipients - Radio','recipientsRadio','formie:7329ef3a-c123-40f9-8a65-633e706de190','vbuwsqtc','Please fill out this field.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Recipients','{\"displayType\":\"radio\",\"options\":[{\"label\":\"Recipient 1\",\"value\":\"Recipient 1\",\"isDefault\":false},{\"label\":\"Recipient 2\",\"value\":\"Recipient 2\",\"isDefault\":false},{\"label\":\"Recipient 3\",\"value\":\"Recipient 3\",\"isDefault\":false}],\"multiple\":null,\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false}','2021-08-07 05:28:42','2021-08-07 05:31:06','627856c4-707f-4684-a4da-dbd9f3ce6c04'),
	(33,NULL,'Single Line Text','singleLineText','formieField:198d0e65-1cf1-43b4-85e4-065ef51eaed4','xnkiohlg',NULL,1,'none',NULL,'verbb\\formie\\fields\\formfields\\SingleLineText','{\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":true}','2021-08-07 05:38:58','2021-08-07 06:20:11','72c1cd95-cc9a-4291-bef0-f9ce458425f3'),
	(34,NULL,'Single Line Text','singleLineText','formieField:d52b78e5-fb1f-4368-932a-9a59bdfc0b78','flzldyae',NULL,1,'none',NULL,'verbb\\formie\\fields\\formfields\\SingleLineText','{\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":true}','2021-08-07 05:38:58','2021-08-07 06:20:11','ec12ff3a-dbdc-4bc9-9ad5-f4a0fb5d3678'),
	(35,NULL,'Entries - Checkboxes','entriesCheckboxes','formie:7329ef3a-c123-40f9-8a65-633e706de190',NULL,'Please fill out this field.',1,'site',NULL,'verbb\\formie\\fields\\formfields\\Entries','{\"searchable\":true,\"columnWidth\":12,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":\"Select an entry\",\"defaultValue\":[],\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false,\"limitOptions\":null,\"displayType\":\"checkboxes\",\"labelSource\":\"title\",\"orderBy\":\"id ASC\",\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":null,\"selectionLabel\":null,\"showSiteMenu\":false,\"localizeRelations\":false,\"validateRelatedElements\":false,\"allowSelfRelations\":false}','2021-08-07 09:08:05','2021-08-07 11:31:54','57252155-6064-45cb-a805-d99aa677c2cc'),
	(36,NULL,'Entries - Radio','entriesRadio','formie:7329ef3a-c123-40f9-8a65-633e706de190',NULL,'Please fill out this field.',1,'site',NULL,'verbb\\formie\\fields\\formfields\\Entries','{\"searchable\":true,\"columnWidth\":12,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":\"Select an entry\",\"defaultValue\":[],\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":14,\"isNested\":false,\"limitOptions\":null,\"displayType\":\"radio\",\"labelSource\":\"title\",\"orderBy\":\"id ASC\",\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":null,\"selectionLabel\":null,\"showSiteMenu\":false,\"localizeRelations\":false,\"validateRelatedElements\":false,\"allowSelfRelations\":false}','2021-08-07 09:08:05','2021-08-07 11:31:55','fd497ad6-a939-48d7-b736-87cbf1103edd'),
	(37,NULL,'Your Name','yourName','formie:53e5ad40-ccfb-4d82-bf14-f284e553949b','sjmijxhf','Please enter your full name.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Name','{\"useMultipleFields\":true,\"prefixEnabled\":false,\"prefixCollapsed\":true,\"prefixLabel\":\"Prefix\",\"prefixPlaceholder\":null,\"prefixDefaultValue\":\"\",\"prefixPrePopulate\":null,\"prefixRequired\":null,\"prefixErrorMessage\":null,\"firstNameEnabled\":true,\"firstNameCollapsed\":false,\"firstNameLabel\":\"First Name\",\"firstNamePlaceholder\":\"e.g. Peter\",\"firstNameDefaultValue\":\"\",\"firstNamePrePopulate\":null,\"firstNameRequired\":true,\"firstNameErrorMessage\":null,\"middleNameEnabled\":false,\"middleNameCollapsed\":true,\"middleNameLabel\":\"Middle Name\",\"middleNamePlaceholder\":null,\"middleNameDefaultValue\":\"\",\"middleNamePrePopulate\":null,\"middleNameRequired\":null,\"middleNameErrorMessage\":null,\"lastNameEnabled\":true,\"lastNameCollapsed\":false,\"lastNameLabel\":\"Last Name\",\"lastNamePlaceholder\":\"e.g. Sherman\",\"lastNameDefaultValue\":\"\",\"lastNamePrePopulate\":null,\"lastNameRequired\":true,\"lastNameErrorMessage\":null,\"subfieldLabelPosition\":\"\",\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":\"Your name\",\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"verbb\\\\formie\\\\positions\\\\Hidden\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enableContentEncryption\":false,\"visibility\":\"\",\"formId\":18,\"isNested\":false}','2021-08-07 12:09:46','2021-08-08 04:58:49','c70240ab-f426-4353-880e-03ee4c8977b5'),
	(38,NULL,'Email Address','emailAddress','formie:53e5ad40-ccfb-4d82-bf14-f284e553949b','qlaxlxfq','Please enter your email so we can get in touch.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\Email','{\"validateDomain\":false,\"blockedDomains\":[],\"uniqueValue\":false,\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":\"e.g. psherman@wallaby.com\",\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":null,\"enableContentEncryption\":false,\"visibility\":null,\"formId\":18,\"isNested\":false}','2021-08-07 12:09:46','2021-08-07 12:10:11','eb0f4f41-b0ed-4057-8908-3c7e5ff32bfb'),
	(39,NULL,'Message','message','formie:53e5ad40-ccfb-4d82-bf14-f284e553949b','astyvkry','Please enter your comments.',1,'none',NULL,'verbb\\formie\\fields\\formfields\\MultiLineText','{\"useRichText\":null,\"richTextButtons\":null,\"columnWidth\":12,\"limit\":null,\"limitType\":\"characters\",\"limitAmount\":null,\"placeholder\":\"e.g. The reason for my enquiry is...\",\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"\",\"instructionsPosition\":\"\",\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":null,\"includeInEmail\":true,\"enableConditions\":null,\"conditions\":null,\"enableContentEncryption\":false,\"visibility\":null,\"formId\":18,\"isNested\":false}','2021-08-07 12:09:46','2021-08-07 12:10:11','7d34bb51-fa15-4dde-9f00-4cd28d3a77b5');

/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fmc_14_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fmc_14_group`;

CREATE TABLE `fmc_14_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_singleLineText_flzldyae` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qngwjqtxgwylghdyxtecmoyqjrmrugsecyns` (`elementId`,`siteId`),
  KEY `fk_psyrvgtwlrbrdwfynyagopwirtjpccqrveoz` (`siteId`),
  CONSTRAINT `fk_mhkkfmrjfcdrblyejnjmoabmtnaxcmvkytgr` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_psyrvgtwlrbrdwfynyagopwirtjpccqrveoz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table fmc_14_repeater
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fmc_14_repeater`;

CREATE TABLE `fmc_14_repeater` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_singleLineText_xnkiohlg` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kvrczldbnvybafdkywqqqhvbwkxokmhzsopm` (`elementId`,`siteId`),
  KEY `fk_gbgaqzsxankxlkkrdpatxppjclobzqrvosbg` (`siteId`),
  CONSTRAINT `fk_gbgaqzsxankxlkkrdpatxppjclobzqrvosbg` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_iebfvihbdbwttzkmgtgaaefceerxoevzbxvw` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table fmc_contactform
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fmc_contactform`;

CREATE TABLE `fmc_contactform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_yourName_sjmijxhf` text COLLATE utf8_unicode_ci,
  `field_emailAddress_qlaxlxfq` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_message_astyvkry` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cvsadljhxgcwrxmgghyofrtetiidpbuexzng` (`elementId`,`siteId`),
  KEY `fk_xgsseyxtjffvifmdnkyaroctjhyoowjblxkn` (`siteId`),
  CONSTRAINT `fk_xgsseyxtjffvifmdnkyaroctjhyoowjblxkn` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zhwnqqowwmgkerefuulunsbepcyhvshgdjfb` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table fmc_fieldsdemo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fmc_fieldsdemo`;

CREATE TABLE `fmc_fieldsdemo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_singleLineText_nqbzwzio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_multiLineText_kxemonkx` text COLLATE utf8_unicode_ci,
  `field_radioButtons_jhuukjto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_checkboxes_olbsolji` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_dropdown_xgoxdjsf` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_dropdownMulti_nwpqbdmu` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_number_ukvrxrzu` int(10) DEFAULT NULL,
  `field_name1_zpqpjlhd` text COLLATE utf8_unicode_ci,
  `field_nameMulti_nrfrfdvb` text COLLATE utf8_unicode_ci,
  `field_emailAddress_vqgdazaj` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_phoneNumber_iscbxhry` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_phoneNumberCountry_rwvonsyq` text COLLATE utf8_unicode_ci,
  `field_agree_imaejzom` tinyint(1) DEFAULT NULL,
  `field_date_bwqneecg` datetime DEFAULT NULL,
  `field_address_hzicgdmp` text COLLATE utf8_unicode_ci,
  `field_recipientsHidden_oyokmeqk` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_hidden_qebauvli` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_table_xzvobupk` text COLLATE utf8_unicode_ci,
  `field_recipientsDropdown2_tjydboqn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_recipientsCheckboxes_vskdkugc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_recipientsRadio_vbuwsqtc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_shgcinnrdcinhnolqmjddosvoyvoagwibhyv` (`elementId`,`siteId`),
  KEY `idx_zsfconvxxntsjizfgpbbjlbuonxgzkboxzxv` (`siteId`),
  CONSTRAINT `fk_flnsbycptmgotfwuzuorgabpyfyggztavnpg` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oymwhpzvdclhrzrdyztlwzqphgzrfxvaicno` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table formie_emailtemplates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `formie_emailtemplates`;

CREATE TABLE `formie_emailtemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table formie_forms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `formie_forms`;

CREATE TABLE `formie_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `fieldContentTable` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `settings` mediumtext COLLATE utf8_unicode_ci,
  `templateId` int(11) DEFAULT NULL,
  `submitActionEntryId` int(11) DEFAULT NULL,
  `requireUser` tinyint(1) DEFAULT NULL,
  `availability` enum('always','date','submissions') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'always',
  `availabilityFrom` datetime DEFAULT NULL,
  `availabilityTo` datetime DEFAULT NULL,
  `availabilitySubmissions` int(11) DEFAULT NULL,
  `defaultStatusId` int(11) DEFAULT NULL,
  `dataRetention` enum('forever','minutes','hours','days','weeks','months','years') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'forever',
  `dataRetentionValue` int(11) DEFAULT NULL,
  `userDeletedAction` enum('retain','delete') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'retain',
  `fileUploadsAction` enum('retain','delete') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'retain',
  `fieldLayoutId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rytnpfpjcfhbzmzxthadzgrjcuzdgmvdqose` (`templateId`),
  KEY `idx_arxyysynfzaewypdibveuipqwrnumporankk` (`defaultStatusId`),
  KEY `idx_waghcblsodsyubgzrhrskisexzzpwoumrncu` (`submitActionEntryId`),
  KEY `idx_dtavnsexgsmqenqbjmwpsbakdgruyxgkjzvf` (`fieldLayoutId`),
  CONSTRAINT `fk_lmmbqasmralvwyrjdlcncrduogpgqwrsxsfk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_thttzrvngewtpapknpkopdlrllbwnepbwsmh` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ukzrjizqzyjkvlmqtmztawwbqmtmgqgdbyiv` FOREIGN KEY (`submitActionEntryId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xdshcpixrcppuaedcwoqfjaazrdxevnapewu` FOREIGN KEY (`templateId`) REFERENCES `formie_formtemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zqzetmdkzkocgazdtwebbydynrxjirgwldcf` FOREIGN KEY (`defaultStatusId`) REFERENCES `formie_statuses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `formie_forms` WRITE;
/*!40000 ALTER TABLE `formie_forms` DISABLE KEYS */;

INSERT INTO `formie_forms` (`id`, `handle`, `fieldContentTable`, `settings`, `templateId`, `submitActionEntryId`, `requireUser`, `availability`, `availabilityFrom`, `availabilityTo`, `availabilitySubmissions`, `defaultStatusId`, `dataRetention`, `dataRetentionValue`, `userDeletedAction`, `fileUploadsAction`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(14,'fieldsDemo','{{%fmc_fieldsdemo}}','{\"displayFormTitle\":\"\",\"displayCurrentPageTitle\":\"\",\"displayPageTabs\":\"1\",\"displayPageProgress\":\"\",\"progressPosition\":\"start\",\"defaultLabelPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"defaultInstructionsPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"submitMethod\":\"page-reload\",\"submitAction\":\"message\",\"submitActionTab\":null,\"submitActionUrl\":\"\",\"submitActionFormHide\":\"\",\"submitActionMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Thanks for your submission.\\\"}]}]\",\"submitActionMessageTimeout\":\"\",\"submitActionMessagePosition\":\"top-form\",\"loadingIndicator\":\"spinner\",\"loadingIndicatorText\":\"\",\"validationOnSubmit\":\"1\",\"validationOnFocus\":\"\",\"errorMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Couldn’t save submission due to errors.\\\"}]}]\",\"errorMessagePosition\":\"top-form\",\"availabilityMessage\":null,\"availabilityMessageDate\":null,\"availabilityMessageSubmissions\":null,\"integrations\":[],\"submissionTitleFormat\":\"{timestamp}\",\"collectIp\":\"\",\"collectUser\":\"\",\"dataRetention\":null,\"dataRetentionValue\":null,\"fileUploadsAction\":null,\"redirectUrl\":null,\"defaultEmailTemplateId\":\"\",\"storeData\":null,\"userDeletedAction\":null}',NULL,NULL,0,'always',NULL,NULL,NULL,1,'forever',NULL,'retain','retain',6,'2021-08-07 00:44:07','2021-08-07 11:46:03','7329ef3a-c123-40f9-8a65-633e706de190'),
	(18,'contactForm','{{%fmc_contactform}}','{\"displayFormTitle\":\"\",\"displayCurrentPageTitle\":\"\",\"displayPageTabs\":\"\",\"displayPageProgress\":\"\",\"progressPosition\":\"end\",\"defaultLabelPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"defaultInstructionsPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"submitMethod\":\"ajax\",\"submitAction\":\"message\",\"submitActionTab\":null,\"submitActionUrl\":\"\",\"submitActionFormHide\":\"\",\"submitActionMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Thank you for contacting us! Our team will get in touch shortly to follow up on your message.\\\"}]}]\",\"submitActionMessageTimeout\":\"\",\"submitActionMessagePosition\":\"top-form\",\"loadingIndicator\":\"spinner\",\"loadingIndicatorText\":\"\",\"validationOnSubmit\":\"1\",\"validationOnFocus\":\"1\",\"errorMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Couldn’t save submission due to errors.\\\"}]}]\",\"errorMessagePosition\":\"top-form\",\"availabilityMessage\":null,\"availabilityMessageDate\":null,\"availabilityMessageSubmissions\":null,\"integrations\":[],\"submissionTitleFormat\":\"{timestamp}\",\"collectIp\":\"\",\"collectUser\":\"\",\"dataRetention\":null,\"dataRetentionValue\":null,\"fileUploadsAction\":null,\"redirectUrl\":null,\"defaultEmailTemplateId\":\"\",\"storeData\":null,\"userDeletedAction\":null}',NULL,NULL,0,'always',NULL,NULL,NULL,1,'forever',NULL,'retain','retain',9,'2021-08-07 12:09:46','2021-08-07 12:10:11','53e5ad40-ccfb-4d82-bf14-f284e553949b');

/*!40000 ALTER TABLE `formie_forms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table formie_formtemplates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `formie_formtemplates`;

CREATE TABLE `formie_formtemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `useCustomTemplates` tinyint(1) DEFAULT '1',
  `outputCssLayout` tinyint(1) DEFAULT '1',
  `outputCssTheme` tinyint(1) DEFAULT '1',
  `outputJsBase` tinyint(1) DEFAULT '1',
  `outputJsTheme` tinyint(1) DEFAULT '1',
  `outputCssLocation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outputJsLocation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uzjpgsahlexilwbmttpquktxwvecohvzlaog` (`fieldLayoutId`),
  CONSTRAINT `fk_rfcyupkzvvmtamvcazshikyabeckhviyzlxg` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table formie_integrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `formie_integrations`;

CREATE TABLE `formie_integrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `settings` text COLLATE utf8_unicode_ci,
  `cache` longtext COLLATE utf8_unicode_ci,
  `tokenId` int(11) DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table formie_nested
# ------------------------------------------------------------

DROP TABLE IF EXISTS `formie_nested`;

CREATE TABLE `formie_nested` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jnkkaytpdsfmijhgterrnriodqfettkxayhi` (`fieldId`),
  KEY `idx_kqxadfmxaiksefriznnobpfzrxmndiczfqaw` (`fieldLayoutId`),
  CONSTRAINT `fk_bmsviipciwiqpgcmlmpqtzfkwwigrxgnwcdd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kjsdonilsdcvsxmqkhfmadytemxuqcmjnlez` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `formie_nested` WRITE;
/*!40000 ALTER TABLE `formie_nested` DISABLE KEYS */;

INSERT INTO `formie_nested` (`id`, `fieldId`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,20,7,'2021-08-07 00:58:27','2021-08-07 00:58:27','93497876-2b89-4504-bc84-9a6aa36709a6'),
	(2,22,8,'2021-08-07 00:58:27','2021-08-07 00:58:27','839b7258-5cd5-49e3-b0f7-00e82adc325a');

/*!40000 ALTER TABLE `formie_nested` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table formie_nestedfieldrows
# ------------------------------------------------------------

DROP TABLE IF EXISTS `formie_nestedfieldrows`;

CREATE TABLE `formie_nestedfieldrows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kltmgzfmucavmwnnlqvuadcqexfpouyadkyr` (`ownerId`),
  KEY `idx_ovaczjipeydgounkpmvyorpdozgsaajepplx` (`fieldId`),
  KEY `idx_fzqxghnsmzlzqsjpxgmzqhfdmjzpmfoktiox` (`sortOrder`),
  CONSTRAINT `fk_ionuerjafkrqevjchffmldhzfthhvxccpzmu` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lliqzwvxryqvcgqtljgbvorfbkzobtphirtl` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tptcvumdrryntmcmbgcwvpfvrtadlghhqfnq` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table formie_notifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `formie_notifications`;

CREATE TABLE `formie_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formId` int(11) NOT NULL,
  `templateId` int(11) DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `subject` text COLLATE utf8_unicode_ci,
  `to` text COLLATE utf8_unicode_ci,
  `cc` text COLLATE utf8_unicode_ci,
  `bcc` text COLLATE utf8_unicode_ci,
  `replyTo` text COLLATE utf8_unicode_ci,
  `replyToName` text COLLATE utf8_unicode_ci,
  `from` text COLLATE utf8_unicode_ci,
  `fromName` text COLLATE utf8_unicode_ci,
  `content` text COLLATE utf8_unicode_ci,
  `attachFiles` tinyint(1) DEFAULT '1',
  `enableConditions` tinyint(1) DEFAULT '0',
  `conditions` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sqylstqqerklogcrzyyiaemwxarkfioswuzw` (`formId`),
  KEY `idx_cgceaqewqvvoveqkysfymqswrfdmkktdrjjo` (`templateId`),
  CONSTRAINT `fk_buscedipempxmgrpfucfadaposgmgtppwnko` FOREIGN KEY (`formId`) REFERENCES `formie_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xcqgafcrhnwzrpgxtajqhvzcboklqgyydcgu` FOREIGN KEY (`templateId`) REFERENCES `formie_emailtemplates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table formie_pagesettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `formie_pagesettings`;

CREATE TABLE `formie_pagesettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) NOT NULL,
  `fieldLayoutTabId` int(11) NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cldnqwhygkrgjzcavfwghnvalovpegmejpfl` (`fieldLayoutTabId`),
  KEY `idx_dhkkzkawfkzgpekxlbcdgcscagvniufhppas` (`fieldLayoutId`),
  CONSTRAINT `fk_hisqglwdqplgoepholplqfmaujjerckxdinn` FOREIGN KEY (`fieldLayoutTabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vnjpzoxgciflgiqenanlxuqqhsnxlnfzrmle` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `formie_pagesettings` WRITE;
/*!40000 ALTER TABLE `formie_pagesettings` DISABLE KEYS */;

INSERT INTO `formie_pagesettings` (`id`, `fieldLayoutId`, `fieldLayoutTabId`, `settings`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,6,10,'{\"submitButtonLabel\":\"Next\",\"backButtonLabel\":\"Back\",\"showBackButton\":false,\"buttonsPosition\":\"right\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"enableNextButtonConditions\":false,\"nextButtonConditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enablePageConditions\":false,\"pageConditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\"}','2021-08-07 00:44:07','2021-08-07 01:05:56','f67fb03e-ffec-4ece-82a3-67a3fc24faf4'),
	(2,6,11,'{\"submitButtonLabel\":\"Next\",\"backButtonLabel\":\"Back\",\"showBackButton\":true,\"buttonsPosition\":\"left-right\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"enableNextButtonConditions\":false,\"nextButtonConditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enablePageConditions\":false,\"pageConditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\"}','2021-08-07 00:56:32','2021-08-07 01:05:56','1772fbd3-3c7c-4a42-8a9f-39ace27fc974'),
	(3,6,12,'{\"submitButtonLabel\":\"Finish\",\"backButtonLabel\":\"Back\",\"showBackButton\":true,\"buttonsPosition\":\"left-right\",\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"enableNextButtonConditions\":false,\"nextButtonConditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"enablePageConditions\":false,\"pageConditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\"}','2021-08-07 00:56:32','2021-08-07 01:05:56','329a9273-3719-4cd6-b6dc-af6bbb7bb02d'),
	(66,9,75,'{\"submitButtonLabel\":\"Contact us\",\"backButtonLabel\":\"Back\",\"showBackButton\":false,\"buttonsPosition\":\"left\",\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":null,\"enableNextButtonConditions\":false,\"nextButtonConditions\":[],\"enablePageConditions\":false,\"pageConditions\":[]}','2021-08-07 12:09:46','2021-08-07 12:09:46','f22c61f2-fe00-4bc0-a15c-cf8127968d9a'),
	(83,7,92,'{\"submitButtonLabel\":\"Submit\",\"backButtonLabel\":\"Back\",\"showBackButton\":false,\"buttonsPosition\":\"left\",\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":null,\"enableNextButtonConditions\":false,\"nextButtonConditions\":[],\"enablePageConditions\":false,\"pageConditions\":[]}','2021-08-08 06:48:19','2021-08-08 06:48:19','6e00264c-8337-4e99-9a0c-78a5bce2fa01'),
	(84,8,93,'{\"submitButtonLabel\":\"Submit\",\"backButtonLabel\":\"Back\",\"showBackButton\":false,\"buttonsPosition\":\"left\",\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":null,\"enableNextButtonConditions\":false,\"nextButtonConditions\":[],\"enablePageConditions\":false,\"pageConditions\":[]}','2021-08-08 06:48:19','2021-08-08 06:48:19','6a3092b2-f134-423f-9ec3-29e815fc857d');

/*!40000 ALTER TABLE `formie_pagesettings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table formie_relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `formie_relations`;

CREATE TABLE `formie_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kxepdyhlvxnebtcxcpycynlfyjjxgiuzwoxw` (`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_mmpijkwfebiyptgjtichvqtohgkgwkkxmize` (`sourceId`),
  KEY `idx_hllnmfsqhstfaondldhvtdtxeaogzwcfvwyz` (`targetId`),
  KEY `idx_hcsisnmahlxvdxkzzyswsjfdknhoxgaimwyu` (`sourceSiteId`),
  CONSTRAINT `fk_lkvgpcxyasxrnwhniascmbhucmglwtpsadry` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_oykxaxnqmfrapuotlbvqckabbguzudnndsyj` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zmkudwtrvrpyobzqlsfbrtqgrhjsdafrkklo` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table formie_rows
# ------------------------------------------------------------

DROP TABLE IF EXISTS `formie_rows`;

CREATE TABLE `formie_rows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) NOT NULL,
  `fieldLayoutFieldId` int(11) NOT NULL,
  `row` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uvhltpttqaunqaxlwooeptbjiwwgtwpagcln` (`fieldLayoutFieldId`),
  KEY `idx_lifkergrorertitevzgoriddvzdxhdlfvhnw` (`fieldLayoutId`),
  CONSTRAINT `fk_dlqvmdpsnwvmzqdqanbaymibysupfldyutdl` FOREIGN KEY (`fieldLayoutFieldId`) REFERENCES `fieldlayoutfields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ixamkdnqbjbkmaazsflcwzvwhnocexdimyix` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `formie_rows` WRITE;
/*!40000 ALTER TABLE `formie_rows` DISABLE KEYS */;

INSERT INTO `formie_rows` (`id`, `fieldLayoutId`, `fieldLayoutFieldId`, `row`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1042,9,1047,0,'2021-08-08 04:58:49','2021-08-08 04:58:49','5e6bb870-9d54-4ce6-874e-28aa0dd57300'),
	(1043,9,1048,1,'2021-08-08 04:58:49','2021-08-08 04:58:49','b326e1d1-39c2-4706-9195-b6ff7533d1bd'),
	(1044,9,1049,2,'2021-08-08 04:58:49','2021-08-08 04:58:49','ebfaa13d-933d-41d3-97e3-fb2bf847dbf4'),
	(1255,7,1260,0,'2021-08-08 06:48:19','2021-08-08 06:48:19','f3937a94-ea84-4635-bcd9-308f255c9b8a'),
	(1256,8,1261,0,'2021-08-08 06:48:19','2021-08-08 06:48:19','4eedfd26-e775-42ee-99cf-6260b42c55c3'),
	(1257,6,1262,0,'2021-08-08 06:48:19','2021-08-08 06:48:19','e5c1272c-b2a3-463f-ba55-fa687f240d81'),
	(1258,6,1263,1,'2021-08-08 06:48:19','2021-08-08 06:48:19','36c018b1-349d-4971-8742-1b4313ca7ebf'),
	(1259,6,1264,2,'2021-08-08 06:48:19','2021-08-08 06:48:19','47dc56ba-eab9-415e-99b7-985151ff77c5'),
	(1260,6,1265,3,'2021-08-08 06:48:19','2021-08-08 06:48:19','7db339d6-b496-4e1a-baf2-91df0bb77331'),
	(1261,6,1266,4,'2021-08-08 06:48:19','2021-08-08 06:48:19','91c14d02-025b-4c83-8dbd-95924ee1fafc'),
	(1262,6,1267,5,'2021-08-08 06:48:19','2021-08-08 06:48:19','a9eebbe2-8864-4acd-9f12-60729e2e7335'),
	(1263,6,1268,6,'2021-08-08 06:48:19','2021-08-08 06:48:19','5f8a0549-ed4f-4e2f-93eb-1f195faddc9a'),
	(1264,6,1269,7,'2021-08-08 06:48:19','2021-08-08 06:48:19','cf06c9e0-0f66-4b1b-98e5-344055a225a8'),
	(1265,6,1270,8,'2021-08-08 06:48:19','2021-08-08 06:48:19','b4adc5e9-e920-40a8-ab28-114e13342730'),
	(1266,6,1271,9,'2021-08-08 06:48:19','2021-08-08 06:48:19','31440a8d-9cf8-41d9-9b8f-7bf198c73b19'),
	(1267,6,1272,10,'2021-08-08 06:48:19','2021-08-08 06:48:19','2c426e1a-7ba5-4060-a7fe-6c4f9c827490'),
	(1268,6,1273,11,'2021-08-08 06:48:19','2021-08-08 06:48:19','8b8cf2c9-237d-48f4-a7e8-50e27b4d0dbe'),
	(1269,6,1274,12,'2021-08-08 06:48:19','2021-08-08 06:48:19','3a6d2dff-4917-4f9f-9e54-f052bfdf0961'),
	(1270,6,1275,0,'2021-08-08 06:48:19','2021-08-08 06:48:19','234287bd-7fdf-4a20-975e-e7e0077db578'),
	(1271,6,1276,1,'2021-08-08 06:48:19','2021-08-08 06:48:19','768f7e88-ff5a-404d-86b9-951c192dcbc9'),
	(1272,6,1277,2,'2021-08-08 06:48:19','2021-08-08 06:48:19','22dd29c6-b227-4d70-aff9-32744f0dd945'),
	(1273,6,1278,3,'2021-08-08 06:48:19','2021-08-08 06:48:19','a760ac02-b034-4a6a-8511-1bab6d705c7f'),
	(1274,6,1279,4,'2021-08-08 06:48:19','2021-08-08 06:48:19','02d1f480-98d3-4ffe-8ea9-c140c26ccd24'),
	(1275,6,1280,5,'2021-08-08 06:48:19','2021-08-08 06:48:19','7aa730d7-85ea-4754-ae33-4b2bab3c497d'),
	(1276,6,1281,6,'2021-08-08 06:48:19','2021-08-08 06:48:19','a7df032f-0548-4104-966f-935e8b4faf4e'),
	(1277,6,1282,7,'2021-08-08 06:48:19','2021-08-08 06:48:19','a9b6b24a-4b0a-45f6-b95d-33ddedc8ed00'),
	(1278,6,1283,8,'2021-08-08 06:48:19','2021-08-08 06:48:19','24aa6381-3534-44d2-9a70-06ccf3f635e1'),
	(1279,6,1284,9,'2021-08-08 06:48:19','2021-08-08 06:48:19','8fbe207a-4004-4ec9-b8e5-07536942d846'),
	(1280,6,1285,10,'2021-08-08 06:48:19','2021-08-08 06:48:19','e4303205-903c-42df-bed1-b69603c94e1f'),
	(1281,6,1286,11,'2021-08-08 06:48:19','2021-08-08 06:48:19','c92ae608-0967-4d06-b83d-b5321cbf0b96'),
	(1282,6,1287,12,'2021-08-08 06:48:19','2021-08-08 06:48:19','5186b69f-33c0-4951-8832-bd1f0060312d'),
	(1283,6,1288,13,'2021-08-08 06:48:19','2021-08-08 06:48:19','a00ef073-ab0b-4708-9ffd-f3cfa0fea089'),
	(1284,6,1289,0,'2021-08-08 06:48:19','2021-08-08 06:48:19','6f59c1ea-6e92-43b1-a528-c348c6b8d895'),
	(1285,6,1290,1,'2021-08-08 06:48:19','2021-08-08 06:48:19','cde6a814-40f2-4071-99d5-c0262554abc9'),
	(1286,6,1291,2,'2021-08-08 06:48:19','2021-08-08 06:48:19','1aec28a2-b372-4647-826d-e4758d558e9f'),
	(1287,6,1292,3,'2021-08-08 06:48:19','2021-08-08 06:48:19','f787c90c-7ce8-4c89-b911-4217470534b8'),
	(1288,6,1293,4,'2021-08-08 06:48:19','2021-08-08 06:48:19','a778873e-7fbf-4f94-bcf2-8e5fbd468b33'),
	(1289,6,1294,5,'2021-08-08 06:48:19','2021-08-08 06:48:19','9e7082e7-36ac-4ae4-8027-d3ed46ec7ee4');

/*!40000 ALTER TABLE `formie_rows` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table formie_sentnotifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `formie_sentnotifications`;

CREATE TABLE `formie_sentnotifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `formId` int(11) DEFAULT NULL,
  `submissionId` int(11) DEFAULT NULL,
  `notificationId` int(11) DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bcc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `replyTo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `replyToName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fromName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci,
  `htmlBody` mediumtext COLLATE utf8_unicode_ci,
  `info` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime DEFAULT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_pjgbibqanujvmazfdwvdxvzijomnpodziaut` (`formId`),
  KEY `fk_wmtakcwtckxickpnjhqxmmjjsvddfwvkvoby` (`submissionId`),
  KEY `fk_krtlcctytbussqfpxbhviupclcuakpjfbyri` (`notificationId`),
  CONSTRAINT `fk_krtlcctytbussqfpxbhviupclcuakpjfbyri` FOREIGN KEY (`notificationId`) REFERENCES `formie_notifications` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oivuwilrbzxbsoaddqzemffjlbufhzutntsg` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pjgbibqanujvmazfdwvdxvzijomnpodziaut` FOREIGN KEY (`formId`) REFERENCES `formie_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wmtakcwtckxickpnjhqxmmjjsvddfwvkvoby` FOREIGN KEY (`submissionId`) REFERENCES `formie_submissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table formie_statuses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `formie_statuses`;

CREATE TABLE `formie_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `color` enum('green','orange','red','blue','yellow','pink','purple','turquoise','light','grey','black') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'green',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `isDefault` tinyint(1) DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `formie_statuses` WRITE;
/*!40000 ALTER TABLE `formie_statuses` DISABLE KEYS */;

INSERT INTO `formie_statuses` (`id`, `name`, `handle`, `color`, `description`, `sortOrder`, `isDefault`, `dateDeleted`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'New','new','green',NULL,1,1,NULL,'2021-08-07 00:04:50','2021-08-07 00:04:50','20b1f3d0-fc0e-4182-b8b0-a619c9a57633');

/*!40000 ALTER TABLE `formie_statuses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table formie_stencils
# ------------------------------------------------------------

DROP TABLE IF EXISTS `formie_stencils`;

CREATE TABLE `formie_stencils` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` mediumtext COLLATE utf8_unicode_ci,
  `templateId` int(11) DEFAULT NULL,
  `defaultStatusId` int(11) DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_waxcrdvvuarskrucshyqdukxegzbvfqpvwgn` (`templateId`),
  KEY `idx_vifqmlnqfvgymvuktgbtmmmcelwjvzzylhgx` (`defaultStatusId`),
  CONSTRAINT `fk_cwiojtcelzlbftnbvmrkmyapqcgmjeiqfhjj` FOREIGN KEY (`defaultStatusId`) REFERENCES `formie_statuses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_snwjzfuomxnktlijddwqkxrbjdibuontazty` FOREIGN KEY (`templateId`) REFERENCES `formie_formtemplates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `formie_stencils` WRITE;
/*!40000 ALTER TABLE `formie_stencils` DISABLE KEYS */;

INSERT INTO `formie_stencils` (`id`, `name`, `handle`, `data`, `templateId`, `defaultStatusId`, `dateDeleted`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Contact Form','contactForm','{\"availability\":\"always\",\"availabilityFrom\":null,\"availabilitySubmissions\":null,\"availabilityTo\":null,\"dataRetention\":\"forever\",\"dataRetentionValue\":null,\"fileUploadsAction\":\"retain\",\"notifications\":[{\"attachFiles\":true,\"content\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"A user submission has been made on the \\\\\\\"\\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Form Name\\\",\\\"value\\\":\\\"{formName}\\\"}},{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"\\\\\\\" form on \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Site Name\\\",\\\"value\\\":\\\"{siteName}\\\"}},{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\" at \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Timestamp (yyyy-mm-dd hh:mm:ss)\\\",\\\"value\\\":\\\"{timestamp}\\\"}}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Their submission details are:\\\"}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"All Form Fields\\\",\\\"value\\\":\\\"{allFields}\\\"}}]}]\",\"enabled\":true,\"id\":\"new981-8077\",\"name\":\"Admin Notification\",\"replyTo\":\"{field.emailAddress}\",\"subject\":\"A new submission was made on \\\"{formName}\\\"\",\"templateId\":\"\",\"to\":\"{systemEmail}\"},{\"attachFiles\":true,\"content\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Thanks again for contacting us. Our team will get back to you as soon as we can.\\\"}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"As a reminder, you submitted the following details at \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Timestamp (yyyy-mm-dd hh:mm:ss)\\\",\\\"value\\\":\\\"{timestamp}\\\"}}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"All Form Fields\\\",\\\"value\\\":\\\"{allFields}\\\"}}]}]\",\"enabled\":true,\"id\":\"new7052-5168\",\"name\":\"User Notification\",\"subject\":\"Thanks for contacting us!\",\"templateId\":\"\",\"to\":\"{field.emailAddress}\"}],\"pages\":[{\"id\":\"new1272610411\",\"label\":\"Page 1\",\"rows\":[{\"fields\":[{\"brandNewField\":false,\"columnWidth\":12,\"handle\":\"yourName\",\"hasLabel\":true,\"id\":\"new7715-7348\",\"label\":\"Your Name\",\"settings\":{\"firstNameCollapsed\":false,\"firstNameDefaultValue\":\"\",\"firstNameEnabled\":true,\"firstNameLabel\":\"First Name\",\"firstNamePlaceholder\":\"e.g. Peter\",\"firstNameRequired\":true,\"handle\":\"yourName\",\"instructions\":\"Please enter your full name.\",\"instructionsPosition\":\"\",\"label\":\"Your Name\",\"labelPosition\":\"verbb\\\\formie\\\\positions\\\\Hidden\",\"lastNameCollapsed\":false,\"lastNameDefaultValue\":\"\",\"lastNameEnabled\":true,\"lastNameLabel\":\"Last Name\",\"lastNamePlaceholder\":\"e.g. Sherman\",\"lastNameRequired\":true,\"limitType\":\"characters\",\"middleNameCollapsed\":true,\"middleNameDefaultValue\":\"\",\"middleNameEnabled\":false,\"middleNameLabel\":\"Middle Name\",\"placeholder\":\"Your name\",\"prefixCollapsed\":true,\"prefixDefaultValue\":\"\",\"prefixEnabled\":false,\"prefixLabel\":\"Prefix\",\"subfieldLabelPosition\":\"\",\"useMultipleFields\":true},\"type\":\"verbb\\\\formie\\\\fields\\\\formfields\\\\Name\"}],\"id\":\"new8990-9934\"},{\"fields\":[{\"brandNewField\":false,\"columnWidth\":12,\"handle\":\"emailAddress\",\"hasLabel\":true,\"id\":\"new6482-9528\",\"label\":\"Email Address\",\"settings\":{\"handle\":\"emailAddress\",\"instructions\":\"Please enter your email so we can get in touch.\",\"instructionsPosition\":\"\",\"label\":\"Email Address\",\"labelPosition\":\"\",\"limitType\":\"characters\",\"placeholder\":\"e.g. psherman@wallaby.com\",\"required\":true},\"type\":\"verbb\\\\formie\\\\fields\\\\formfields\\\\Email\"}],\"id\":\"new9524-8509\"},{\"fields\":[{\"brandNewField\":false,\"columnWidth\":12,\"handle\":\"message\",\"hasLabel\":true,\"id\":\"new982-7322\",\"label\":\"Message\",\"settings\":{\"handle\":\"message\",\"instructions\":\"Please enter your comments.\",\"instructionsPosition\":\"\",\"label\":\"Message\",\"labelPosition\":\"\",\"limitType\":\"characters\",\"placeholder\":\"e.g. The reason for my enquiry is...\",\"required\":true},\"type\":\"verbb\\\\formie\\\\fields\\\\formfields\\\\MultiLineText\"}],\"id\":\"new2177-9685\"}],\"settings\":{\"backButtonLabel\":\"Back\",\"buttonsPosition\":\"left\",\"label\":\"Page 1\",\"showBackButton\":false,\"submitButtonLabel\":\"Contact us\"},\"sortOrder\":0}],\"requireUser\":false,\"settings\":{\"availabilityMessage\":null,\"availabilityMessageDate\":null,\"availabilityMessageSubmissions\":null,\"collectIp\":\"\",\"collectUser\":null,\"dataRetention\":null,\"dataRetentionValue\":null,\"defaultEmailTemplateId\":\"\",\"defaultInstructionsPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"defaultLabelPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"displayCurrentPageTitle\":\"\",\"displayFormTitle\":\"\",\"displayPageProgress\":\"\",\"displayPageTabs\":\"\",\"errorMessage\":[{\"content\":[{\"text\":\"Couldn’t save submission due to errors.\",\"type\":\"text\"}],\"type\":\"paragraph\"}],\"errorMessagePosition\":\"top-form\",\"fileUploadsAction\":null,\"loadingIndicator\":\"spinner\",\"loadingIndicatorText\":\"\",\"progressPosition\":\"end\",\"redirectUrl\":null,\"storeData\":null,\"submissionTitleFormat\":\"{timestamp}\",\"submitAction\":\"message\",\"submitActionFormHide\":\"\",\"submitActionMessage\":[{\"content\":[{\"text\":\"Thank you for contacting us! Our team will get in touch shortly to follow up on your message.\",\"type\":\"text\"}],\"type\":\"paragraph\"}],\"submitActionMessagePosition\":\"top-form\",\"submitActionMessageTimeout\":\"\",\"submitActionTab\":null,\"submitActionUrl\":\"\",\"submitMethod\":\"ajax\",\"userDeletedAction\":null,\"validationOnFocus\":\"1\",\"validationOnSubmit\":\"1\"},\"userDeletedAction\":\"retain\"}',NULL,NULL,NULL,'2021-08-07 00:04:50','2021-08-07 00:04:50','733f65cb-1f36-44e4-a626-4d062c4224f0');

/*!40000 ALTER TABLE `formie_stencils` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table formie_submissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `formie_submissions`;

CREATE TABLE `formie_submissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `formId` int(11) NOT NULL,
  `statusId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `isIncomplete` tinyint(1) DEFAULT '0',
  `isSpam` tinyint(1) DEFAULT '0',
  `spamReason` text COLLATE utf8_unicode_ci,
  `ipAddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ncmfydzvwavtuvcjfsktesxmedstfvsaeqor` (`formId`),
  KEY `idx_gxzdbzftrhnqbxqattetrkeycufawyiewfky` (`statusId`),
  KEY `idx_gmzlttohwxbobognbkeccbccnhopbnrqhyce` (`userId`),
  CONSTRAINT `fk_awwwnmpjdcrbcxsynxxozgeclskfzemexdma` FOREIGN KEY (`statusId`) REFERENCES `formie_statuses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_kmcsspbqewnvhuingqrsxafpjcobguyqhvke` FOREIGN KEY (`formId`) REFERENCES `formie_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qrqysqpakubphsqinygkowrgjoaontiowsxi` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xjbnectrndqybcyxzuxnmsydvalqruwcbxhx` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table formie_syncfields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `formie_syncfields`;

CREATE TABLE `formie_syncfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `syncId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usnhxcvvmurfzftmaiimrtlggshvhyjyynes` (`syncId`,`fieldId`),
  KEY `fk_omkeifmjtfdxbsfvbdneqzvokgnvfcbnwllr` (`fieldId`),
  CONSTRAINT `fk_lxktkimwxjyhvfmdwgzufcucgaowcnphjtqj` FOREIGN KEY (`syncId`) REFERENCES `formie_syncs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_omkeifmjtfdxbsfvbdneqzvokgnvfcbnwllr` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table formie_syncs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `formie_syncs`;

CREATE TABLE `formie_syncs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table formie_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `formie_tokens`;

CREATE TABLE `formie_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci,
  `secret` text COLLATE utf8_unicode_ci,
  `endOfLife` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refreshToken` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table globalsets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `globalsets`;

CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eivoypliwvdtvkuqxnisjevzqsexneivwqid` (`name`),
  KEY `idx_huzrxfqvktxhbbtsadtrrihhrwmfxravbkue` (`handle`),
  KEY `idx_lpklgwpcsxskosxbotnqtftqgdqkfyhzaneo` (`fieldLayoutId`),
  KEY `idx_plmggfjmsjshtrvudlojncipabncbklczahx` (`sortOrder`),
  CONSTRAINT `fk_faqckdeqbbllwnlrxttvtuatiigpuoexksyc` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_majhvygrrbbjfklmfjbdztdqpryoxdemwtnz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;

INSERT INTO `globalsets` (`id`, `name`, `handle`, `fieldLayoutId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(2,'Demo','demo',5,1,'2021-08-07 00:06:03','2021-08-07 00:06:23','6b96e0b0-0c3f-4de5-8631-0de30b34872c');

/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table gqlschemas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gqlschemas`;

CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;

INSERT INTO `gqlschemas` (`id`, `name`, `scope`, `isPublic`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Public Schema','[\"elements.drafts:read\",\"elements.revisions:read\",\"elements.inactive:read\",\"sections.fbe2bb47-a84e-4366-b957-3e127152e75a:read\",\"entrytypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818:read\",\"volumes.adf62689-9e99-4040-8bb3-c06de71033be:read\",\"globalsets.6b96e0b0-0c3f-4de5-8631-0de30b34872c:read\",\"usergroups.everyone:read\",\"categorygroups.12530c06-549d-4664-97d3-2a96906bde12:read\",\"taggroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15:read\",\"formieForms.all:read\",\"formieSubmissions.all:read\",\"formieSubmissions.all:edit\",\"formieSubmissions.all:create\",\"formieSubmissions.all:save\",\"formieSubmissions.all:delete\"]',1,'2021-08-07 00:49:15','2021-08-07 13:40:58','e721824b-3a96-44ce-979f-1e77d543df97');

/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table gqltokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gqltokens`;

CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asklyfuiahmunprircudngcltyexmuivfjip` (`accessToken`),
  UNIQUE KEY `idx_kelzjgacydregdwizvhxwbcpftcejmplkgxu` (`name`),
  KEY `fk_tkyrhrxwuwfvwhvybqnqdxyvcbxtjkvizfha` (`schemaId`),
  CONSTRAINT `fk_tkyrhrxwuwfvwhvybqnqdxyvcbxtjkvizfha` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;

INSERT INTO `gqltokens` (`id`, `name`, `accessToken`, `enabled`, `expiryDate`, `lastUsed`, `schemaId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Public Token','__PUBLIC__',1,NULL,NULL,1,'2021-08-07 00:49:15','2021-08-07 00:49:15','0c1070db-f4fc-44de-9ce3-fb25e555cc99');

/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `info`;

CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'3.7.8','3.7.7',0,'pbuaujymxecn','uwcnjdwnrzki','2021-08-07 00:01:41','2021-08-08 06:48:19','cd697dc7-510f-48ee-a6ae-505ce136a4bb');

/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table matrixblocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `matrixblocks`;

CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kzyqsnqwvahcfcizlncgpcqgpbomsqujbksa` (`ownerId`),
  KEY `idx_tsyqvtisgcitstrwbkaaqwppdbubbzkukavd` (`fieldId`),
  KEY `idx_apzhizzthnkvkevwnsaeljqbctubrvqassoo` (`typeId`),
  KEY `idx_oqidnbctctcjsenkoknhewuegoaodsvvqqvl` (`sortOrder`),
  CONSTRAINT `fk_dkhkwenbwqufuzovvwgztadzjoumhtvzolck` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gjpjtxhaqbtnfozxngmaxhvsjxsnzgibmyvd` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_smdjqlakpsqgqdkdenmcfywjymsfbkwtjnbo` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yfmfiisnhdbxizxycqsjfkbnltqyogzbhqwy` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table matrixblocktypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `matrixblocktypes`;

CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_njmaexhnnbnuopqvxseqpdktvgpstzfqpmro` (`name`,`fieldId`),
  KEY `idx_kvwhbofdvmobjzatxjawafmqnztjhduxihja` (`handle`,`fieldId`),
  KEY `idx_jijagerullbobukfiduxflispbozbjyehsqx` (`fieldId`),
  KEY `idx_vmpuwkqarpfpsbdsmtnconnyfapzmldlnfmz` (`fieldLayoutId`),
  CONSTRAINT `fk_lkedjxlzecrkstzppavpxjkfodxpatycmzgk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qquqfbeeppepqwfcxcrfbsofzjlavftikfvw` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gprnbvhnazjtuozpujsedhmugmpdavlmfbpr` (`track`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'craft','Install','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','f9ac5b1a-f8c4-419c-b6cf-a278212464de'),
	(2,'craft','m150403_183908_migrations_table_changes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','5b263962-0010-4101-907d-f8d65b1a7642'),
	(3,'craft','m150403_184247_plugins_table_changes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','2e9d7105-2bb2-4012-9833-da601466c547'),
	(4,'craft','m150403_184533_field_version','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','bb080343-bb1d-45ed-9d73-2231a3aeb825'),
	(5,'craft','m150403_184729_type_columns','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','8cdd1fb3-61a3-46a8-afba-694bfd295e04'),
	(6,'craft','m150403_185142_volumes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','1885f310-91ee-47a1-8826-c58803a71583'),
	(7,'craft','m150428_231346_userpreferences','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','b2db7149-df65-4084-a10e-5704c3aade35'),
	(8,'craft','m150519_150900_fieldversion_conversion','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','fe24575a-b76b-4427-b8a2-d08d43cb68eb'),
	(9,'craft','m150617_213829_update_email_settings','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','c85bdecb-ac03-4609-b8df-d4234f1c5ed7'),
	(10,'craft','m150721_124739_templatecachequeries','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','4b1aa132-b586-476d-817e-06147a6cbc7b'),
	(11,'craft','m150724_140822_adjust_quality_settings','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','4b196944-f014-40f0-8bcc-289e2fcd5149'),
	(12,'craft','m150815_133521_last_login_attempt_ip','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','0cf16683-e33a-4a18-8a67-df6b67c4eb8a'),
	(13,'craft','m151002_095935_volume_cache_settings','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','762cbe47-aceb-4bbd-af0a-8726ddeebd45'),
	(14,'craft','m151005_142750_volume_s3_storage_settings','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','75734461-83fd-4270-abf2-2af148cd75f0'),
	(15,'craft','m151016_133600_delete_asset_thumbnails','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','215f6dd5-9dca-458b-bae5-b35024fcd4ac'),
	(16,'craft','m151209_000000_move_logo','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','80ecfdff-6eb0-4280-88a8-d1ecb806db7c'),
	(17,'craft','m151211_000000_rename_fileId_to_assetId','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','0168d041-57a0-458a-a639-608e8a201b14'),
	(18,'craft','m151215_000000_rename_asset_permissions','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','28625910-11dc-4e92-bc44-6dabfd02bc84'),
	(19,'craft','m160707_000001_rename_richtext_assetsource_setting','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','32b823f8-867d-49d4-8169-20c019ea9337'),
	(20,'craft','m160708_185142_volume_hasUrls_setting','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','a6785e4e-22d9-4dde-891c-710eee65a13a'),
	(21,'craft','m160714_000000_increase_max_asset_filesize','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','ec7e9691-bb7f-46b2-a2b9-ba6472476842'),
	(22,'craft','m160727_194637_column_cleanup','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','f5810661-36bf-4ebd-918e-1fbcc575a885'),
	(23,'craft','m160804_110002_userphotos_to_assets','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','b20f44b3-b8f2-4bfb-bbf8-f8e2298a8cfc'),
	(24,'craft','m160807_144858_sites','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','b83bbcea-719d-43f5-ba3a-0d64eee67327'),
	(25,'craft','m160829_000000_pending_user_content_cleanup','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','9a0692e7-5eb8-4995-ab15-e1ce5113b4d5'),
	(26,'craft','m160830_000000_asset_index_uri_increase','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','3ce3e3e6-45c9-444f-9fdf-2477f96cd2b5'),
	(27,'craft','m160912_230520_require_entry_type_id','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','edee6b72-f21a-451d-840f-d04c89afff96'),
	(28,'craft','m160913_134730_require_matrix_block_type_id','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','89c2a7a9-0095-446d-9746-777c79a634e3'),
	(29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','9d6a50ac-a797-4abd-a5b2-04d59639449e'),
	(30,'craft','m160920_231045_usergroup_handle_title_unique','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','6f1a1134-91b6-4e92-b580-d612208da004'),
	(31,'craft','m160925_113941_route_uri_parts','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','896471cb-8efd-41c7-b035-9cbc45e64446'),
	(32,'craft','m161006_205918_schemaVersion_not_null','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','321326bf-7e17-429c-8561-827ea754c3c8'),
	(33,'craft','m161007_130653_update_email_settings','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','fe88e94b-a49a-4c09-a33f-a387cb65f91c'),
	(34,'craft','m161013_175052_newParentId','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','fdde0456-ecb6-44f8-88fc-eb062fa21009'),
	(35,'craft','m161021_102916_fix_recent_entries_widgets','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','925e52ed-011b-4418-b2e4-694b1265913d'),
	(36,'craft','m161021_182140_rename_get_help_widget','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','8ce34d49-1fb3-4a45-9536-6c4580ca1821'),
	(37,'craft','m161025_000000_fix_char_columns','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','a7e55d9d-c0c7-4606-85c3-84e18f0d01cd'),
	(38,'craft','m161029_124145_email_message_languages','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','bbf12539-5e81-49e2-b2d2-b25deaa1d455'),
	(39,'craft','m161108_000000_new_version_format','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','435fa87d-94f5-4f38-b807-78109ee036e4'),
	(40,'craft','m161109_000000_index_shuffle','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','28e97557-5de0-4fb9-9c5f-1521489dd92c'),
	(41,'craft','m161122_185500_no_craft_app','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','febfe338-bf3d-4927-a4b8-3d0ba23176b7'),
	(42,'craft','m161125_150752_clear_urlmanager_cache','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','730febb5-d9a1-45e2-b9c8-b17eef549571'),
	(43,'craft','m161220_000000_volumes_hasurl_notnull','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','c236054f-a5d9-467a-8044-e6385f2edce9'),
	(44,'craft','m170114_161144_udates_permission','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','33308869-a4c7-4813-afc1-e440b8fb9ec7'),
	(45,'craft','m170120_000000_schema_cleanup','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','da121b83-6e51-40e7-bcc2-6c8677645491'),
	(46,'craft','m170126_000000_assets_focal_point','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','827f887d-ed89-45c2-80c4-c27b3685ea2d'),
	(47,'craft','m170206_142126_system_name','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','c46c3465-7cb1-425d-b41e-10476d1b5f67'),
	(48,'craft','m170217_044740_category_branch_limits','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','cf604be1-4277-4bf6-a3d6-d5932b12cd24'),
	(49,'craft','m170217_120224_asset_indexing_columns','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','1151cd24-14d9-4aaf-8bb0-c8db10922027'),
	(50,'craft','m170223_224012_plain_text_settings','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','45b69814-38e1-4f41-92e7-20dd710e6724'),
	(51,'craft','m170227_120814_focal_point_percentage','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','f13df08b-f89e-4e1a-84bd-4afc1cb01866'),
	(52,'craft','m170228_171113_system_messages','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','57fcd576-21c2-4317-aca1-e5839b9e9718'),
	(53,'craft','m170303_140500_asset_field_source_settings','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','fb94d2c1-7767-47a0-88a5-3d410f315110'),
	(54,'craft','m170306_150500_asset_temporary_uploads','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','14ab0146-5a46-4ec5-bef6-5d1c6ca1dc37'),
	(55,'craft','m170523_190652_element_field_layout_ids','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','9aa2e034-3083-46ce-bdcb-365d47181f27'),
	(56,'craft','m170621_195237_format_plugin_handles','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','31e4c481-9cc8-47ca-9891-63310120ebb1'),
	(57,'craft','m170630_161027_deprecation_line_nullable','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','b95912ff-c260-4d10-95fc-9eaeda1fc674'),
	(58,'craft','m170630_161028_deprecation_changes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','737e6d97-c104-48a2-81ec-98c8e03e9066'),
	(59,'craft','m170703_181539_plugins_table_tweaks','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','e282bbad-0a57-402c-b5be-f12bcee9edc6'),
	(60,'craft','m170704_134916_sites_tables','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','256320d4-0ccb-43ea-aead-d9ff661bc0ff'),
	(61,'craft','m170706_183216_rename_sequences','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','335e3ed9-7d43-4b7a-bed2-7298931e1692'),
	(62,'craft','m170707_094758_delete_compiled_traits','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','a54c2531-29e1-4f18-9bd3-12f7e5cebfcb'),
	(63,'craft','m170731_190138_drop_asset_packagist','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','b0124e2d-e8f0-400a-9f9b-3b262b1c10bc'),
	(64,'craft','m170810_201318_create_queue_table','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','a17f6987-c3ec-4b5b-977d-9451d374586e'),
	(65,'craft','m170903_192801_longblob_for_queue_jobs','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','0e6da7fa-eaf0-4286-965e-2913ffa9b5b2'),
	(66,'craft','m170914_204621_asset_cache_shuffle','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','ea6eb571-668a-411e-b4ae-ccbe9a35447a'),
	(67,'craft','m171011_214115_site_groups','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','1ba823ee-a68e-48f2-a51e-2bc6e55aeca6'),
	(68,'craft','m171012_151440_primary_site','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','d0e748df-60ba-4a47-bc06-f3c29c1c7931'),
	(69,'craft','m171013_142500_transform_interlace','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','35d10528-b486-4370-a371-0c1a2e002d73'),
	(70,'craft','m171016_092553_drop_position_select','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','e02a1d1e-11b3-42d5-b829-5acbb7ffc286'),
	(71,'craft','m171016_221244_less_strict_translation_method','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','7a122a5e-9366-4a08-b1cf-6fb7019e39a2'),
	(72,'craft','m171107_000000_assign_group_permissions','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','5d6cee17-836b-49b1-9b1c-ec29c707a9fb'),
	(73,'craft','m171117_000001_templatecache_index_tune','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','a7eb5c73-b65b-4461-af6f-7246ff7d95a3'),
	(74,'craft','m171126_105927_disabled_plugins','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','938b2be3-d1dd-426b-acc9-6954c85ac995'),
	(75,'craft','m171130_214407_craftidtokens_table','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','18b894d6-b092-4281-b833-01c461f65b76'),
	(76,'craft','m171202_004225_update_email_settings','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','d40351dc-7c40-44fb-a400-def82c08368a'),
	(77,'craft','m171204_000001_templatecache_index_tune_deux','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','1a2e6c2e-ef67-4be4-8b22-d3c4aaff163b'),
	(78,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','340a6a2c-100a-4572-a0b0-f476ec64b0e1'),
	(79,'craft','m171218_143135_longtext_query_column','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','c18db377-7f27-4578-bf33-621d51e00c14'),
	(80,'craft','m171231_055546_environment_variables_to_aliases','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','d086d163-c3ed-4265-adbf-7025169a8ef8'),
	(81,'craft','m180113_153740_drop_users_archived_column','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','f6c6162d-679b-4f98-b6f0-e39496cc12e7'),
	(82,'craft','m180122_213433_propagate_entries_setting','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','ce78f049-f7be-4720-a8a3-893055fb9fa7'),
	(83,'craft','m180124_230459_fix_propagate_entries_values','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','35d6c1ff-41eb-41b0-a569-e754eb07a906'),
	(84,'craft','m180128_235202_set_tag_slugs','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','53e02599-d053-4126-83ca-0807bc202f0a'),
	(85,'craft','m180202_185551_fix_focal_points','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','74b47214-5254-4c1b-9a6f-4c60c34cdb8f'),
	(86,'craft','m180217_172123_tiny_ints','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','14edcbe8-4cf0-47aa-8c31-aee74b3ccaa1'),
	(87,'craft','m180321_233505_small_ints','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','1e715ede-9990-4336-a3dd-7f3b1290ec3e'),
	(88,'craft','m180404_182320_edition_changes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','cb904893-6e61-46e3-b3a9-5a550748bd92'),
	(89,'craft','m180411_102218_fix_db_routes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','efed1350-1b0a-4bb0-abdc-5880b970724e'),
	(90,'craft','m180416_205628_resourcepaths_table','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','5214dca8-c89a-49be-8d8c-58da8efaa92b'),
	(91,'craft','m180418_205713_widget_cleanup','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','55cbafd6-96fc-4664-8980-a3793b1d8f5d'),
	(92,'craft','m180425_203349_searchable_fields','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','4c6cfff6-ef9c-488f-a362-847acc8121e2'),
	(93,'craft','m180516_153000_uids_in_field_settings','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','85051aaa-ff6d-4964-89dc-a70c07b1373c'),
	(94,'craft','m180517_173000_user_photo_volume_to_uid','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','88aef550-9e98-4d8b-acea-eb34a77f3072'),
	(95,'craft','m180518_173000_permissions_to_uid','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','2f91a2d1-3470-43bc-907b-091f4ce01210'),
	(96,'craft','m180520_173000_matrix_context_to_uids','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','a01afecb-f729-4a76-8877-4be118f8dddc'),
	(97,'craft','m180521_172900_project_config_table','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','9ac64dcb-d3f2-4fb7-9c63-4fc8241518f2'),
	(98,'craft','m180521_173000_initial_yml_and_snapshot','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','8ea062db-ecdb-468f-8384-63fa5ac09f78'),
	(99,'craft','m180731_162030_soft_delete_sites','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','c6fa54aa-0b9e-42b8-8ab3-713aeace4b10'),
	(100,'craft','m180810_214427_soft_delete_field_layouts','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','87885a3b-452b-4016-9da7-f6ef2a7e623d'),
	(101,'craft','m180810_214439_soft_delete_elements','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','a2cb940d-a30d-41ee-837c-759595499e1e'),
	(102,'craft','m180824_193422_case_sensitivity_fixes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','462f9f43-6ca7-43d7-a7f0-f68d3854d329'),
	(103,'craft','m180901_151639_fix_matrixcontent_tables','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','a8e37b1a-a181-4dd9-b946-8cdd7f505230'),
	(104,'craft','m180904_112109_permission_changes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','486a8331-5183-496e-ae69-4e532be66c04'),
	(105,'craft','m180910_142030_soft_delete_sitegroups','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','7272d08e-a682-41aa-8349-06cba6943af2'),
	(106,'craft','m181011_160000_soft_delete_asset_support','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','3da89369-84a9-48f1-95d8-6b5553f0b449'),
	(107,'craft','m181016_183648_set_default_user_settings','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','5c9cb1ec-ea84-401c-8c27-f8c994ec432a'),
	(108,'craft','m181017_225222_system_config_settings','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','cf1ab282-fade-4023-8733-920aa063a05a'),
	(109,'craft','m181018_222343_drop_userpermissions_from_config','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','f949d540-4ba7-4a46-96e9-1c95ed8c1a13'),
	(110,'craft','m181029_130000_add_transforms_routes_to_config','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','b6ce081c-fbed-4d17-aa89-9d2efd88631e'),
	(111,'craft','m181112_203955_sequences_table','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','1d0cc342-6fe2-46b0-9b06-367d92f54549'),
	(112,'craft','m181121_001712_cleanup_field_configs','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','3e9b8e0d-e4b0-40a0-90d3-1566a246f576'),
	(113,'craft','m181128_193942_fix_project_config','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','5b61c374-d41c-44e4-8939-725edd7bc483'),
	(114,'craft','m181130_143040_fix_schema_version','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','d479599e-7210-4823-8889-d644fb8d263b'),
	(115,'craft','m181211_143040_fix_entry_type_uids','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','667353e9-20f5-4ec4-8c4d-c1e4851948d8'),
	(116,'craft','m181217_153000_fix_structure_uids','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','9dcd223c-8a86-4d80-9f56-21911b5482c5'),
	(117,'craft','m190104_152725_store_licensed_plugin_editions','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','d9990544-d4cd-4b4c-bd73-bf0af822d8ab'),
	(118,'craft','m190108_110000_cleanup_project_config','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','dd4c4d34-2538-47f9-9ab3-fb743f72be43'),
	(119,'craft','m190108_113000_asset_field_setting_change','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','18ef5355-37e4-4002-943f-032d981c4005'),
	(120,'craft','m190109_172845_fix_colspan','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','11df82e3-5a25-4972-97b0-baf5463e107b'),
	(121,'craft','m190110_150000_prune_nonexisting_sites','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','3ef527de-3db2-47d3-9118-d1314a33b3c5'),
	(122,'craft','m190110_214819_soft_delete_volumes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','832730ae-c77b-41e8-8d52-acf7d5fa57bc'),
	(123,'craft','m190112_124737_fix_user_settings','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','60643442-14f5-4ec9-bde4-faaf99912271'),
	(124,'craft','m190112_131225_fix_field_layouts','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','a6cbcd07-a7a2-433e-ad11-2b66a6fef24e'),
	(125,'craft','m190112_201010_more_soft_deletes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','fa63ab54-dcf0-4eab-8b1f-6645fd4e8895'),
	(126,'craft','m190114_143000_more_asset_field_setting_changes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','7ccc8981-bad0-40e7-bba1-849ce74189e0'),
	(127,'craft','m190121_120000_rich_text_config_setting','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','bbf3842d-dcde-4686-a1ac-c3ad3a4f83ae'),
	(128,'craft','m190125_191628_fix_email_transport_password','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','bdb3f21e-42c8-4f7a-b55f-cfe82d109093'),
	(129,'craft','m190128_181422_cleanup_volume_folders','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','d719820e-c09c-4527-a84c-549ebf9b464a'),
	(130,'craft','m190205_140000_fix_asset_soft_delete_index','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','613a6e36-fc63-4858-8aaa-cea1d6a6be9e'),
	(131,'craft','m190218_143000_element_index_settings_uid','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','44584d6d-e80b-4d1d-a04a-a17b9fb118ba'),
	(132,'craft','m190312_152740_element_revisions','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','131c2894-0696-4e2d-9b44-cfdbb6a74e4c'),
	(133,'craft','m190327_235137_propagation_method','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','0d15b925-43cc-4bd0-9016-1c4a1f9eb2b1'),
	(134,'craft','m190401_223843_drop_old_indexes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','0d926fa5-391f-448c-bff5-ea57fa5e72ed'),
	(135,'craft','m190416_014525_drop_unique_global_indexes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','de34c7b9-f935-4ec8-b72d-ed76f301e1d5'),
	(136,'craft','m190417_085010_add_image_editor_permissions','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','c9569a5e-2c61-4623-ba0e-ec3c716776e7'),
	(137,'craft','m190502_122019_store_default_user_group_uid','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','0d26c52d-5812-4661-8ec7-8d6df9c97a6f'),
	(138,'craft','m190504_150349_preview_targets','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','038ffa13-c360-430f-9d62-e63a73f27c81'),
	(139,'craft','m190516_184711_job_progress_label','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','3f9bdca1-2676-4cf3-91c8-e72082d03bfa'),
	(140,'craft','m190523_190303_optional_revision_creators','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','0966befb-6f2a-4d4f-b40a-dac4fda0f04f'),
	(141,'craft','m190529_204501_fix_duplicate_uids','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','9e468bdd-21b9-4921-9e80-d9b74de03657'),
	(142,'craft','m190605_223807_unsaved_drafts','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','860a2ddc-f12a-4d78-b8b2-93f43c18c189'),
	(143,'craft','m190607_230042_entry_revision_error_tables','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','1e8cb35d-f505-4452-b145-a5888b6ffeac'),
	(144,'craft','m190608_033429_drop_elements_uid_idx','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','a56d840d-7990-4e13-a148-f5e06bfd40e1'),
	(145,'craft','m190617_164400_add_gqlschemas_table','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','257a77ca-11a2-4f8a-a5ce-95cb29c02382'),
	(146,'craft','m190624_234204_matrix_propagation_method','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','8908e54c-5936-42e7-9ee8-6ba17a246c5f'),
	(147,'craft','m190711_153020_drop_snapshots','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','07ec4bde-388b-4caa-a194-b2c59e9f86ed'),
	(148,'craft','m190712_195914_no_draft_revisions','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','a1a97aae-cc26-4be1-a8b1-e2e04d58ed71'),
	(149,'craft','m190723_140314_fix_preview_targets_column','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','e24e333b-7559-4f00-80c2-f09235344045'),
	(150,'craft','m190820_003519_flush_compiled_templates','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','83a1c942-036e-42d4-8c4d-73f6e1194486'),
	(151,'craft','m190823_020339_optional_draft_creators','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','b2744b78-552a-4e45-af71-478c8fcdc43b'),
	(152,'craft','m190913_152146_update_preview_targets','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','0c3a59e9-7298-4ab2-af93-778b1e8df67b'),
	(153,'craft','m191107_122000_add_gql_project_config_support','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','eaa2620a-939a-4b7f-8f95-cb1cf030d723'),
	(154,'craft','m191204_085100_pack_savable_component_settings','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','154d6d62-53fc-4dbd-b489-48ebd339f78c'),
	(155,'craft','m191206_001148_change_tracking','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','59531653-7cd7-4352-85ad-2228a349b2da'),
	(156,'craft','m191216_191635_asset_upload_tracking','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','5a296dc7-1374-4c7a-8571-16ed6891e0e5'),
	(157,'craft','m191222_002848_peer_asset_permissions','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','76a6e2d4-be12-4e93-88ea-397f4a7c0309'),
	(158,'craft','m200127_172522_queue_channels','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','94ef9dee-1378-44c2-9254-8d4ab210336c'),
	(159,'craft','m200211_175048_truncate_element_query_cache','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','2855c71b-0437-423e-b86f-2840475b502a'),
	(160,'craft','m200213_172522_new_elements_index','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','ebc9d79d-ca70-47c6-9507-ead69d12a69e'),
	(161,'craft','m200228_195211_long_deprecation_messages','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','1576e7b9-523d-4cf2-b52c-528071e7ce8b'),
	(162,'craft','m200306_054652_disabled_sites','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','b744e4e6-81c2-4b19-af8e-0d8bdf02dbf6'),
	(163,'craft','m200522_191453_clear_template_caches','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','6d2e3be3-d43f-4813-8766-2b3fad6bcbbc'),
	(164,'craft','m200606_231117_migration_tracks','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','fecc7312-f007-4a9d-a819-2f0eecc89485'),
	(165,'craft','m200619_215137_title_translation_method','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','04140f6a-cba4-4331-8ad8-ff20ee4df5f6'),
	(166,'craft','m200620_005028_user_group_descriptions','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','cfced342-503b-4f48-865a-d9b8eb39c0c7'),
	(167,'craft','m200620_230205_field_layout_changes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','d43257f4-60f8-46ff-912e-ae19282c58ea'),
	(168,'craft','m200625_131100_move_entrytypes_to_top_project_config','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','2f7f45ad-210b-4924-b7e9-7f8b691c1202'),
	(169,'craft','m200629_112700_remove_project_config_legacy_files','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','1e960048-75b4-4bd4-9b7c-3c0b65f19473'),
	(170,'craft','m200630_183000_drop_configmap','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','146ed8a1-7169-4967-b975-d5988645944a'),
	(171,'craft','m200715_113400_transform_index_error_flag','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','7fa4eea0-7baf-4037-8d73-611c17598b85'),
	(172,'craft','m200716_110900_replace_file_asset_permissions','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','4b1bf38d-af7d-4868-8d27-fefe50b14488'),
	(173,'craft','m200716_153800_public_token_settings_in_project_config','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','1905a6de-4f92-4c84-b40c-12e2becae906'),
	(174,'craft','m200720_175543_drop_unique_constraints','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','60d54193-891f-4437-9903-f8eb505c409a'),
	(175,'craft','m200825_051217_project_config_version','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','ad816618-07e4-436a-af8a-8434d0c63a4d'),
	(176,'craft','m201116_190500_asset_title_translation_method','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','bb0978f6-4439-42ed-aad7-5a468f9fbf78'),
	(177,'craft','m201124_003555_plugin_trials','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','b7211f5b-809e-4ede-8230-3214dc8f4d6a'),
	(178,'craft','m210209_135503_soft_delete_field_groups','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','dba8e0d0-d90e-4f31-b8da-7e3b0479380d'),
	(179,'craft','m210212_223539_delete_invalid_drafts','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','6a3fee15-c4ed-4625-a6f9-0687388bcf39'),
	(180,'craft','m210214_202731_track_saved_drafts','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','1e94430d-e2a9-4c74-903b-962317c6a82b'),
	(181,'craft','m210223_150900_add_new_element_gql_schema_components','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','3613b443-b438-42d7-92f8-a80f67a9ba83'),
	(182,'craft','m210302_212318_canonical_elements','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','231866cc-380e-42f3-8fca-78e8011d6c8b'),
	(183,'craft','m210326_132000_invalidate_projectconfig_cache','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','90ff5266-7bab-4776-bf73-cbefe6d99e22'),
	(184,'craft','m210329_214847_field_column_suffixes','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','f7e50b52-49e4-4c5f-a890-f1392c2e9ae9'),
	(185,'craft','m210331_220322_null_author','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','824575b0-bc36-4282-a386-36c693881275'),
	(186,'craft','m210405_231315_provisional_drafts','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','897bf4e0-75c4-434e-9838-6764bda4ca35'),
	(187,'craft','m210602_111300_project_config_names_in_config','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','b1dc146d-fe1e-43f0-bf7a-278d1a98bfbc'),
	(188,'craft','m210611_233510_default_placement_settings','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','9e4bb496-2fee-452e-acf7-3426ccb81963'),
	(189,'craft','m210613_145522_sortable_global_sets','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','84024a03-1298-4d92-afff-9ad2fa3a6153'),
	(190,'craft','m210613_184103_announcements','2021-08-07 00:01:43','2021-08-07 00:01:43','2021-08-07 00:01:43','2aa1d67a-c0cf-408d-ab0f-40459faed424'),
	(191,'plugin:formie','Install','2021-08-07 00:04:50','2021-08-07 00:04:50','2021-08-07 00:04:50','380f4554-da18-4139-a9d8-47f71affd844'),
	(192,'plugin:formie','m200724_000000_submissions_ipAddress','2021-08-07 00:04:50','2021-08-07 00:04:50','2021-08-07 00:04:50','151823ad-5292-4fc4-b88f-466a87844b8a'),
	(193,'plugin:formie','m200725_000000_convert_success_message','2021-08-07 00:04:50','2021-08-07 00:04:50','2021-08-07 00:04:50','afc84918-db1e-4068-ba03-4419319eb6d6'),
	(194,'plugin:formie','m200725_100000_convert_error_message','2021-08-07 00:04:50','2021-08-07 00:04:50','2021-08-07 00:04:50','a540d06c-78b4-4f4e-a485-e3839b452479'),
	(195,'plugin:formie','m200731_000000_date_default_value','2021-08-07 00:04:50','2021-08-07 00:04:50','2021-08-07 00:04:50','972be197-5a21-4ec0-9728-3a2d6a1c5fa5'),
	(196,'plugin:formie','m200731_100000_hidden_defaults','2021-08-07 00:04:50','2021-08-07 00:04:50','2021-08-07 00:04:50','20a045fe-ae05-4c3a-a79e-663da8002b66'),
	(197,'plugin:formie','m200807_000000_form_css_js','2021-08-07 00:04:50','2021-08-07 00:04:50','2021-08-07 00:04:50','bcb6bf7d-c2e2-4a71-939e-fe554bd3fb9e'),
	(198,'plugin:formie','m200810_000000_form_template_defaults','2021-08-07 00:04:50','2021-08-07 00:04:50','2021-08-07 00:04:50','7b3bb306-52d6-43e0-b8cf-b4811b4b73a1'),
	(199,'plugin:formie','m200819_000000_tokens','2021-08-07 00:04:50','2021-08-07 00:04:50','2021-08-07 00:04:50','5a727e73-257b-4bff-bc11-17b834f12e73'),
	(200,'plugin:formie','m200822_000000_integrations','2021-08-07 00:04:50','2021-08-07 00:04:50','2021-08-07 00:04:50','ce9cb8af-a291-4af6-9c3f-a9d531594f11'),
	(201,'plugin:formie','m201010_000000_resave_submissions','2021-08-07 00:04:50','2021-08-07 00:04:50','2021-08-07 00:04:50','83582945-43b1-47b0-bd52-3b1588b234a9'),
	(202,'plugin:formie','m201011_000000_convert_agree_description','2021-08-07 00:04:50','2021-08-07 00:04:50','2021-08-07 00:04:50','17cae5d0-ae63-4833-9abf-f14f50d2987a'),
	(203,'plugin:formie','m201012_000000_address_autocomplete','2021-08-07 00:04:50','2021-08-07 00:04:50','2021-08-07 00:04:50','75acea39-4cd3-44af-b4a8-53e8ca8ceda6'),
	(204,'plugin:formie','m201016_000000_fix_agree_descriptionHtml','2021-08-07 00:04:50','2021-08-07 00:04:50','2021-08-07 00:04:50','4df17e2b-e7dc-49e3-b3ea-254828561ee5'),
	(205,'plugin:formie','m201108_000000_sent_notifications','2021-08-07 00:04:50','2021-08-07 00:04:50','2021-08-07 00:04:50','90e8e556-8296-4450-9530-d81cfafc885b'),
	(206,'plugin:formie','m201119_000000_increase_stencil','2021-08-07 00:04:50','2021-08-07 00:04:50','2021-08-07 00:04:50','8ce68a15-61d9-4803-b050-8202f339dc41'),
	(207,'plugin:formie','m201122_000000_notification_conditions','2021-08-07 00:04:50','2021-08-07 00:04:50','2021-08-07 00:04:50','0727bb71-1cf5-4704-8788-c185c0628eb5'),
	(208,'plugin:formie','m201123_000000_phone_refactor','2021-08-07 00:04:50','2021-08-07 00:04:50','2021-08-07 00:04:50','c62ae816-d360-455c-9074-4c8c569853b9'),
	(209,'plugin:formie','m201124_000000_form_data_retention','2021-08-07 00:04:50','2021-08-07 00:04:50','2021-08-07 00:04:50','8376dcb1-73b9-4e36-ae4e-3285b70a1e34'),
	(210,'plugin:formie','m201124_100000_form_file_uploads_data_retention','2021-08-07 00:04:50','2021-08-07 00:04:50','2021-08-07 00:04:50','751484b0-701d-4388-a6ac-27608d117de2'),
	(211,'plugin:formie','m210131_000000_form_data_retention','2021-08-07 00:04:50','2021-08-07 00:04:50','2021-08-07 00:04:50','7a42b5ef-94a6-4078-b8e1-bbc14e760469'),
	(212,'plugin:formie','m210307_000000_relations','2021-08-07 00:04:50','2021-08-07 00:04:50','2021-08-07 00:04:50','c54c01e8-ea2f-41b9-9e53-dd8cdc791296'),
	(213,'plugin:formie','m210309_000000_fix_formId','2021-08-07 00:04:50','2021-08-07 00:04:50','2021-08-07 00:04:50','2651e52f-1ba0-4417-b4ed-a7f282749f80'),
	(214,'plugin:formie','m210530_000000_sentnotifications_body','2021-08-07 00:04:50','2021-08-07 00:04:50','2021-08-07 00:04:50','be59ebcb-9d81-4e28-8ebd-333ac105bad3'),
	(215,'plugin:formie','m210607_000000_permissions','2021-08-07 00:04:50','2021-08-07 00:04:50','2021-08-07 00:04:50','99628a81-6499-43fb-a1e5-0b8826969f59'),
	(216,'plugin:formie','m210613_000000_sentnotifications_notificationId','2021-08-07 00:04:50','2021-08-07 00:04:50','2021-08-07 00:04:50','ed51c767-d72d-4537-a0bf-180fda59f74e');

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table plugins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `plugins`;

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wubandncdtgqlypvqhydkjouauayjacwlgai` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;

INSERT INTO `plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKeyStatus`, `licensedEdition`, `installDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'formie','dev-craft-3','1.1.11','trial',NULL,'2021-08-07 00:04:49','2021-08-07 00:04:49','2021-08-08 08:34:34','855878ec-1145-4425-beef-82116156d3cb'),
	(2,'tag-manager','1.0.7','1.0.0','unknown',NULL,'2021-08-07 11:34:11','2021-08-07 11:34:11','2021-08-08 03:37:16','f3fc29ca-7679-4624-baac-5819c0cc74ab');

/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table projectconfig
# ------------------------------------------------------------

DROP TABLE IF EXISTS `projectconfig`;

CREATE TABLE `projectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;

INSERT INTO `projectconfig` (`path`, `value`)
VALUES
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.defaultPlacement','\"end\"'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.autocapitalize','true'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.autocomplete','false'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.autocorrect','true'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.class','null'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.disabled','false'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.id','null'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.instructions','null'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.label','null'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.max','null'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.min','null'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.name','null'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.orientation','null'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.placeholder','null'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.readonly','false'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.requirable','false'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.size','null'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.step','null'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.tip','null'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.title','null'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\TitleField\"'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.warning','null'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.0.width','100'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.1.fieldUid','\"2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a\"'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.1.instructions','null'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.1.label','null'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.1.required','false'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.1.tip','null'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.1.warning','null'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.elements.1.width','100'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.name','\"Content\"'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.fieldLayouts.db9789d3-9833-4279-a1cb-7f14d1d50ab3.tabs.0.sortOrder','1'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.handle','\"demo\"'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.name','\"Demo\"'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.siteSettings.00079eeb-bb55-40b2-867b-65ed3665219f.hasUrls','true'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.siteSettings.00079eeb-bb55-40b2-867b-65ed3665219f.template','null'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.siteSettings.00079eeb-bb55-40b2-867b-65ed3665219f.uriFormat','\"demo/{slug}\"'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.structure.maxLevels','null'),
	('categoryGroups.12530c06-549d-4664-97d3-2a96906bde12.structure.uid','\"f6971801-c7f1-4cc7-9a40-4fa832abfa39\"'),
	('dateModified','1628343658'),
	('email.fromEmail','\"demo@verbb.io\"'),
	('email.fromName','\"Formie Headless\"'),
	('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.autocapitalize','true'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.autocomplete','false'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.autocorrect','true'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.class','null'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.disabled','false'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.id','null'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.instructions','null'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.label','null'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.max','null'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.min','null'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.name','null'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.orientation','null'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.placeholder','null'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.readonly','false'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.requirable','false'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.size','null'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.step','null'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.tip','null'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.title','null'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.warning','null'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.0.width','100'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.1.fieldUid','\"2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a\"'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.1.instructions','null'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.1.label','null'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.1.required','false'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.1.tip','null'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.1.warning','null'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.elements.1.width','100'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.name','\"Content\"'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.fieldLayouts.6bbdaea4-ec82-409c-92e1-f7dba84ecfc8.tabs.0.sortOrder','1'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.handle','\"default\"'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.hasTitleField','true'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.name','\"Default\"'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.section','\"fbe2bb47-a84e-4366-b957-3e127152e75a\"'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.sortOrder','1'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.titleFormat','null'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.titleTranslationKeyFormat','null'),
	('entryTypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818.titleTranslationMethod','\"site\"'),
	('fieldGroups.d644334e-fac0-46a1-8543-211e5168b02c.name','\"Common\"'),
	('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.columnSuffix','\"kukrbgdv\"'),
	('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.contentColumnType','\"text\"'),
	('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.fieldGroup','\"d644334e-fac0-46a1-8543-211e5168b02c\"'),
	('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.handle','\"plainText\"'),
	('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.instructions','\"\"'),
	('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.name','\"Plain Text\"'),
	('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.searchable','false'),
	('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.settings.byteLimit','null'),
	('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.settings.charLimit','null'),
	('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.settings.code','\"\"'),
	('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.settings.columnType','null'),
	('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.settings.initialRows','\"4\"'),
	('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.settings.multiline','\"\"'),
	('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.settings.placeholder','null'),
	('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.settings.uiMode','\"normal\"'),
	('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.translationKeyFormat','null'),
	('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.translationMethod','\"none\"'),
	('fields.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a.type','\"craft\\\\fields\\\\PlainText\"'),
	('formie.statuses.20b1f3d0-fc0e-4182-b8b0-a619c9a57633.color','\"green\"'),
	('formie.statuses.20b1f3d0-fc0e-4182-b8b0-a619c9a57633.description','null'),
	('formie.statuses.20b1f3d0-fc0e-4182-b8b0-a619c9a57633.handle','\"new\"'),
	('formie.statuses.20b1f3d0-fc0e-4182-b8b0-a619c9a57633.isDefault','true'),
	('formie.statuses.20b1f3d0-fc0e-4182-b8b0-a619c9a57633.name','\"New\"'),
	('formie.statuses.20b1f3d0-fc0e-4182-b8b0-a619c9a57633.sortOrder','1'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.availability','\"always\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.availabilityFrom','null'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.availabilitySubmissions','null'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.availabilityTo','null'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.dataRetention','\"forever\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.dataRetentionValue','null'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.fileUploadsAction','\"retain\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.notifications.0.attachFiles','true'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.notifications.0.content','\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"A user submission has been made on the \\\\\\\"\\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Form Name\\\",\\\"value\\\":\\\"{formName}\\\"}},{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"\\\\\\\" form on \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Site Name\\\",\\\"value\\\":\\\"{siteName}\\\"}},{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\" at \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Timestamp (yyyy-mm-dd hh:mm:ss)\\\",\\\"value\\\":\\\"{timestamp}\\\"}}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Their submission details are:\\\"}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"All Form Fields\\\",\\\"value\\\":\\\"{allFields}\\\"}}]}]\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.notifications.0.enabled','true'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.notifications.0.id','\"new981-8077\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.notifications.0.name','\"Admin Notification\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.notifications.0.replyTo','\"{field.emailAddress}\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.notifications.0.subject','\"A new submission was made on \\\"{formName}\\\"\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.notifications.0.templateId','\"\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.notifications.0.to','\"{systemEmail}\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.notifications.1.attachFiles','true'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.notifications.1.content','\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Thanks again for contacting us. Our team will get back to you as soon as we can.\\\"}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"As a reminder, you submitted the following details at \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Timestamp (yyyy-mm-dd hh:mm:ss)\\\",\\\"value\\\":\\\"{timestamp}\\\"}}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"All Form Fields\\\",\\\"value\\\":\\\"{allFields}\\\"}}]}]\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.notifications.1.enabled','true'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.notifications.1.id','\"new7052-5168\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.notifications.1.name','\"User Notification\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.notifications.1.subject','\"Thanks for contacting us!\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.notifications.1.templateId','\"\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.notifications.1.to','\"{field.emailAddress}\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.id','\"new1272610411\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.label','\"Page 1\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.brandNewField','false'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.columnWidth','12'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.handle','\"yourName\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.hasLabel','true'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.id','\"new7715-7348\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.label','\"Your Name\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.firstNameCollapsed','false'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.firstNameDefaultValue','\"\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.firstNameEnabled','true'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.firstNameLabel','\"First Name\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.firstNamePlaceholder','\"e.g. Peter\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.firstNameRequired','true'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.handle','\"yourName\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.instructions','\"Please enter your full name.\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.instructionsPosition','\"\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.label','\"Your Name\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.labelPosition','\"verbb\\\\formie\\\\positions\\\\Hidden\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.lastNameCollapsed','false'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.lastNameDefaultValue','\"\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.lastNameEnabled','true'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.lastNameLabel','\"Last Name\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.lastNamePlaceholder','\"e.g. Sherman\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.lastNameRequired','true'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.limitType','\"characters\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.middleNameCollapsed','true'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.middleNameDefaultValue','\"\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.middleNameEnabled','false'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.middleNameLabel','\"Middle Name\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.placeholder','\"Your name\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.prefixCollapsed','true'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.prefixDefaultValue','\"\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.prefixEnabled','false'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.prefixLabel','\"Prefix\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.subfieldLabelPosition','\"\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.settings.useMultipleFields','true'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.fields.0.type','\"verbb\\\\formie\\\\fields\\\\formfields\\\\Name\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.0.id','\"new8990-9934\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.1.fields.0.brandNewField','false'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.1.fields.0.columnWidth','12'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.1.fields.0.handle','\"emailAddress\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.1.fields.0.hasLabel','true'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.1.fields.0.id','\"new6482-9528\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.1.fields.0.label','\"Email Address\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.1.fields.0.settings.handle','\"emailAddress\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.1.fields.0.settings.instructions','\"Please enter your email so we can get in touch.\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.1.fields.0.settings.instructionsPosition','\"\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.1.fields.0.settings.label','\"Email Address\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.1.fields.0.settings.labelPosition','\"\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.1.fields.0.settings.limitType','\"characters\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.1.fields.0.settings.placeholder','\"e.g. psherman@wallaby.com\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.1.fields.0.settings.required','true'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.1.fields.0.type','\"verbb\\\\formie\\\\fields\\\\formfields\\\\Email\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.1.id','\"new9524-8509\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.2.fields.0.brandNewField','false'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.2.fields.0.columnWidth','12'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.2.fields.0.handle','\"message\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.2.fields.0.hasLabel','true'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.2.fields.0.id','\"new982-7322\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.2.fields.0.label','\"Message\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.2.fields.0.settings.handle','\"message\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.2.fields.0.settings.instructions','\"Please enter your comments.\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.2.fields.0.settings.instructionsPosition','\"\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.2.fields.0.settings.label','\"Message\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.2.fields.0.settings.labelPosition','\"\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.2.fields.0.settings.limitType','\"characters\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.2.fields.0.settings.placeholder','\"e.g. The reason for my enquiry is...\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.2.fields.0.settings.required','true'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.2.fields.0.type','\"verbb\\\\formie\\\\fields\\\\formfields\\\\MultiLineText\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.rows.2.id','\"new2177-9685\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.settings.backButtonLabel','\"Back\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.settings.buttonsPosition','\"left\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.settings.label','\"Page 1\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.settings.showBackButton','false'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.settings.submitButtonLabel','\"Contact us\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.pages.0.sortOrder','0'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.requireUser','false'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.availabilityMessage','null'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.availabilityMessageDate','null'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.availabilityMessageSubmissions','null'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.collectIp','\"\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.collectUser','null'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.dataRetention','null'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.dataRetentionValue','null'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.defaultEmailTemplateId','\"\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.defaultInstructionsPosition','\"verbb\\\\formie\\\\positions\\\\AboveInput\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.defaultLabelPosition','\"verbb\\\\formie\\\\positions\\\\AboveInput\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.displayCurrentPageTitle','\"\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.displayFormTitle','\"\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.displayPageProgress','\"\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.displayPageTabs','\"\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.errorMessage.0.content.0.text','\"Couldn’t save submission due to errors.\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.errorMessage.0.content.0.type','\"text\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.errorMessage.0.type','\"paragraph\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.errorMessagePosition','\"top-form\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.fileUploadsAction','null'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.loadingIndicator','\"spinner\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.loadingIndicatorText','\"\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.progressPosition','\"end\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.redirectUrl','null'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.storeData','null'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.submissionTitleFormat','\"{timestamp}\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.submitAction','\"message\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.submitActionFormHide','\"\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.submitActionMessage.0.content.0.text','\"Thank you for contacting us! Our team will get in touch shortly to follow up on your message.\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.submitActionMessage.0.content.0.type','\"text\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.submitActionMessage.0.type','\"paragraph\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.submitActionMessagePosition','\"top-form\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.submitActionMessageTimeout','\"\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.submitActionTab','null'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.submitActionUrl','\"\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.submitMethod','\"ajax\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.userDeletedAction','null'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.validationOnFocus','\"1\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.settings.validationOnSubmit','\"1\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.data.userDeletedAction','\"retain\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.defaultStatusId','null'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.handle','\"contactForm\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.name','\"Contact Form\"'),
	('formie.stencils.733f65cb-1f36-44e4-a626-4d062c4224f0.templateId','null'),
	('globalSets.6b96e0b0-0c3f-4de5-8631-0de30b34872c.fieldLayouts.f6ac1175-0650-454a-87ac-3af1d5ed99c4.tabs.0.elements.0.fieldUid','\"2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a\"'),
	('globalSets.6b96e0b0-0c3f-4de5-8631-0de30b34872c.fieldLayouts.f6ac1175-0650-454a-87ac-3af1d5ed99c4.tabs.0.elements.0.instructions','null'),
	('globalSets.6b96e0b0-0c3f-4de5-8631-0de30b34872c.fieldLayouts.f6ac1175-0650-454a-87ac-3af1d5ed99c4.tabs.0.elements.0.label','null'),
	('globalSets.6b96e0b0-0c3f-4de5-8631-0de30b34872c.fieldLayouts.f6ac1175-0650-454a-87ac-3af1d5ed99c4.tabs.0.elements.0.required','false'),
	('globalSets.6b96e0b0-0c3f-4de5-8631-0de30b34872c.fieldLayouts.f6ac1175-0650-454a-87ac-3af1d5ed99c4.tabs.0.elements.0.tip','null'),
	('globalSets.6b96e0b0-0c3f-4de5-8631-0de30b34872c.fieldLayouts.f6ac1175-0650-454a-87ac-3af1d5ed99c4.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('globalSets.6b96e0b0-0c3f-4de5-8631-0de30b34872c.fieldLayouts.f6ac1175-0650-454a-87ac-3af1d5ed99c4.tabs.0.elements.0.warning','null'),
	('globalSets.6b96e0b0-0c3f-4de5-8631-0de30b34872c.fieldLayouts.f6ac1175-0650-454a-87ac-3af1d5ed99c4.tabs.0.elements.0.width','100'),
	('globalSets.6b96e0b0-0c3f-4de5-8631-0de30b34872c.fieldLayouts.f6ac1175-0650-454a-87ac-3af1d5ed99c4.tabs.0.name','\"Content\"'),
	('globalSets.6b96e0b0-0c3f-4de5-8631-0de30b34872c.fieldLayouts.f6ac1175-0650-454a-87ac-3af1d5ed99c4.tabs.0.sortOrder','1'),
	('globalSets.6b96e0b0-0c3f-4de5-8631-0de30b34872c.handle','\"demo\"'),
	('globalSets.6b96e0b0-0c3f-4de5-8631-0de30b34872c.name','\"Demo\"'),
	('globalSets.6b96e0b0-0c3f-4de5-8631-0de30b34872c.sortOrder','1'),
	('graphql.publicToken.enabled','true'),
	('graphql.publicToken.expiryDate','null'),
	('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.isPublic','true'),
	('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.name','\"Public Schema\"'),
	('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.0','\"elements.drafts:read\"'),
	('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.1','\"elements.revisions:read\"'),
	('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.10','\"formieForms.all:read\"'),
	('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.11','\"formieSubmissions.all:read\"'),
	('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.12','\"formieSubmissions.all:edit\"'),
	('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.13','\"formieSubmissions.all:create\"'),
	('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.14','\"formieSubmissions.all:save\"'),
	('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.15','\"formieSubmissions.all:delete\"'),
	('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.2','\"elements.inactive:read\"'),
	('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.3','\"sections.fbe2bb47-a84e-4366-b957-3e127152e75a:read\"'),
	('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.4','\"entrytypes.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818:read\"'),
	('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.5','\"volumes.adf62689-9e99-4040-8bb3-c06de71033be:read\"'),
	('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.6','\"globalsets.6b96e0b0-0c3f-4de5-8631-0de30b34872c:read\"'),
	('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.7','\"usergroups.everyone:read\"'),
	('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.8','\"categorygroups.12530c06-549d-4664-97d3-2a96906bde12:read\"'),
	('graphql.schemas.e721824b-3a96-44ce-979f-1e77d543df97.scope.9','\"taggroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15:read\"'),
	('meta.__names__.00079eeb-bb55-40b2-867b-65ed3665219f','\"Formie Headless\"'),
	('meta.__names__.12530c06-549d-4664-97d3-2a96906bde12','\"Demo\"'),
	('meta.__names__.20b1f3d0-fc0e-4182-b8b0-a619c9a57633','\"New\"'),
	('meta.__names__.2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a','\"Plain Text\"'),
	('meta.__names__.6b96e0b0-0c3f-4de5-8631-0de30b34872c','\"Demo\"'),
	('meta.__names__.733f65cb-1f36-44e4-a626-4d062c4224f0','\"Contact Form\"'),
	('meta.__names__.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15','\"Demo\"'),
	('meta.__names__.adf62689-9e99-4040-8bb3-c06de71033be','\"Demo\"'),
	('meta.__names__.cf7b2541-4843-417e-9652-9a5d1a5a15a7','\"Formie Headless\"'),
	('meta.__names__.d644334e-fac0-46a1-8543-211e5168b02c','\"Common\"'),
	('meta.__names__.e721824b-3a96-44ce-979f-1e77d543df97','\"Public Schema\"'),
	('meta.__names__.ee2e044d-867d-4cdf-b1b3-4e0d51e7a818','\"Default\"'),
	('meta.__names__.fbe2bb47-a84e-4366-b957-3e127152e75a','\"Demo\"'),
	('plugins.formie.edition','\"standard\"'),
	('plugins.formie.enabled','true'),
	('plugins.formie.licenseKey','\"8ZPBQILHYI3D5WA3M5VK5FK9\"'),
	('plugins.formie.schemaVersion','\"1.1.11\"'),
	('plugins.tag-manager.edition','\"standard\"'),
	('plugins.tag-manager.enabled','true'),
	('plugins.tag-manager.schemaVersion','\"1.0.0\"'),
	('sections.fbe2bb47-a84e-4366-b957-3e127152e75a.defaultPlacement','\"end\"'),
	('sections.fbe2bb47-a84e-4366-b957-3e127152e75a.enableVersioning','true'),
	('sections.fbe2bb47-a84e-4366-b957-3e127152e75a.handle','\"demo\"'),
	('sections.fbe2bb47-a84e-4366-b957-3e127152e75a.name','\"Demo\"'),
	('sections.fbe2bb47-a84e-4366-b957-3e127152e75a.propagationMethod','\"all\"'),
	('sections.fbe2bb47-a84e-4366-b957-3e127152e75a.siteSettings.00079eeb-bb55-40b2-867b-65ed3665219f.enabledByDefault','true'),
	('sections.fbe2bb47-a84e-4366-b957-3e127152e75a.siteSettings.00079eeb-bb55-40b2-867b-65ed3665219f.hasUrls','true'),
	('sections.fbe2bb47-a84e-4366-b957-3e127152e75a.siteSettings.00079eeb-bb55-40b2-867b-65ed3665219f.template','\"demo/_entry\"'),
	('sections.fbe2bb47-a84e-4366-b957-3e127152e75a.siteSettings.00079eeb-bb55-40b2-867b-65ed3665219f.uriFormat','\"demo/{slug}\"'),
	('sections.fbe2bb47-a84e-4366-b957-3e127152e75a.type','\"channel\"'),
	('siteGroups.cf7b2541-4843-417e-9652-9a5d1a5a15a7.name','\"Formie Headless\"'),
	('sites.00079eeb-bb55-40b2-867b-65ed3665219f.baseUrl','\"$PRIMARY_SITE_URL\"'),
	('sites.00079eeb-bb55-40b2-867b-65ed3665219f.handle','\"default\"'),
	('sites.00079eeb-bb55-40b2-867b-65ed3665219f.hasUrls','true'),
	('sites.00079eeb-bb55-40b2-867b-65ed3665219f.language','\"en-US\"'),
	('sites.00079eeb-bb55-40b2-867b-65ed3665219f.name','\"Formie Headless\"'),
	('sites.00079eeb-bb55-40b2-867b-65ed3665219f.primary','true'),
	('sites.00079eeb-bb55-40b2-867b-65ed3665219f.siteGroup','\"cf7b2541-4843-417e-9652-9a5d1a5a15a7\"'),
	('sites.00079eeb-bb55-40b2-867b-65ed3665219f.sortOrder','1'),
	('system.edition','\"pro\"'),
	('system.live','true'),
	('system.name','\"Formie Headless\"'),
	('system.schemaVersion','\"3.7.7\"'),
	('system.timeZone','\"America/Los_Angeles\"'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.autocapitalize','true'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.autocomplete','false'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.autocorrect','true'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.class','null'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.disabled','false'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.id','null'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.instructions','null'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.label','null'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.max','null'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.min','null'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.name','null'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.orientation','null'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.placeholder','null'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.readonly','false'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.requirable','false'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.size','null'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.step','null'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.tip','null'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.title','null'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\TitleField\"'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.warning','null'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.0.width','100'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.1.fieldUid','\"2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a\"'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.1.instructions','null'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.1.label','null'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.1.required','false'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.1.tip','null'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.1.warning','null'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.elements.1.width','100'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.name','\"Content\"'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.fieldLayouts.4ac58eaa-d7bd-49c0-bb3a-ab20c42ef558.tabs.0.sortOrder','1'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.handle','\"demo\"'),
	('tagGroups.9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15.name','\"Demo\"'),
	('users.allowPublicRegistration','false'),
	('users.defaultGroup','null'),
	('users.photoSubpath','null'),
	('users.photoVolumeUid','null'),
	('users.requireEmailVerification','true'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.autocapitalize','true'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.autocomplete','false'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.autocorrect','true'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.class','null'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.disabled','false'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.id','null'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.instructions','null'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.label','null'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.max','null'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.min','null'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.name','null'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.orientation','null'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.placeholder','null'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.readonly','false'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.requirable','false'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.size','null'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.step','null'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.tip','null'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.title','null'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\AssetTitleField\"'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.warning','null'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.0.width','100'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.1.fieldUid','\"2a7dfeb1-2876-4d66-8cb7-ccb1c55b042a\"'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.1.instructions','null'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.1.label','null'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.1.required','false'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.1.tip','null'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.1.warning','null'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.elements.1.width','100'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.name','\"Content\"'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.fieldLayouts.a65d044a-042f-4258-994d-611713ff5b4d.tabs.0.sortOrder','1'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.handle','\"demo\"'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.hasUrls','false'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.name','\"Demo\"'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.settings.path','\"@webroot/uploads/demo\"'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.sortOrder','1'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.titleTranslationKeyFormat','null'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.titleTranslationMethod','null'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.type','\"craft\\\\volumes\\\\Local\"'),
	('volumes.adf62689-9e99-4040-8bb3-c06de71033be.url','\"\"');

/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table queue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `queue`;

CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_jnkaocmtmnmooktachttlfqkttaykvhfctpk` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_ekyyyvnesqqgxohaqnhkghzdhwqobmxjarjm` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `relations`;

CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pzxrcobdmktiyrtbzlppqtyjescsnntoombx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_hkyqwjbmbvaztgyarlwsyhpoigrptyeubeya` (`sourceId`),
  KEY `idx_qwxftlocnxunkhdnugxemfqlbbdbuvijdijp` (`targetId`),
  KEY `idx_ulkpuatjkdzuzrttydknqwsdbwcjglclhner` (`sourceSiteId`),
  CONSTRAINT `fk_bjlztzuhlroxlhmttcqewgeancytyndodsnd` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ilkeoifxfdlikcdmmavtoyoyovdqhoanxjun` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wwwfjrhitaomjmynzpmsxwdpawrgejmrgkfc` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ypgcflsspudvlbqrhfvaulysqfclqhjaplyz` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table resourcepaths
# ------------------------------------------------------------

DROP TABLE IF EXISTS `resourcepaths`;

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;

INSERT INTO `resourcepaths` (`hash`, `path`)
VALUES
	('10929eef','@lib/jquery.payment'),
	('124447a2','@lib/selectize'),
	('146b62eb','@craft/web/assets/cp/dist'),
	('18280328','@lib/xregexp'),
	('1d3ac67a','@bower/jquery/dist'),
	('27d75b5d','@lib/timepicker'),
	('2a86e381','/Users/joshcrawford/public_html/craft3-plugins/formie/src/web/assets/forms/dist'),
	('2fdd9f19','@app/web/assets/plugins/dist'),
	('32aa6d8f','@lib/element-resize-detector'),
	('33d3165a','@app/web/assets/admintable/dist'),
	('36f64840','@verbb/formie/web/assets/cp/dist'),
	('3845c627','@craft/web/assets/dashboard/dist'),
	('40d76022','@verbb/base/resources/dist'),
	('4106e0ec','@craft/web/assets/feed/dist'),
	('419e56e4','@lib/jquery-touch-events'),
	('421caaa2','@lib/jquery-ui'),
	('463a6a26','@lib/picturefill'),
	('489f4a77','@lib/d3'),
	('48cbeaeb','@lib/axios'),
	('497aa001','@craft/web/assets/queuemanager/dist'),
	('4cf68c6b','@craft/web/assets/userpermissions/dist'),
	('4e995a21','@craft/web/assets/utilities/dist'),
	('527154cf','@lib/iframe-resizer'),
	('52e6625','@app/web/assets/userpermissions/dist'),
	('57054a27','@app/web/assets/fieldsettings/dist'),
	('59862d9','@app/web/assets/edituser/dist'),
	('5ca21b13','@craft/web/assets/plugins/dist'),
	('5ed26bd8','@lib/fileupload'),
	('628941b6','@app/web/assets/pluginstore/dist'),
	('6520499e','@lib/vue'),
	('678fb8f7','@craft/web/assets/admintable/dist'),
	('6d16d20a','@app/web/assets/dashboard/dist'),
	('6d4cb829','/Users/joshcrawford/public_html/craft3-plugins/formie/src/web/assets/cp/dist'),
	('6e6489cf','@lib/fabric'),
	('6e826144','@craft/web/assets/graphiql/dist'),
	('76156a65','@craft/web/assets/login/dist'),
	('79b10c9d','@app/web/assets/cp/dist'),
	('7b225df1','@lib/garnishjs'),
	('7e13dda8','@craft/web/assets/craftsupport/dist'),
	('837e5564','@app/web/assets/craftsupport/dist'),
	('85dbc414','@lib/iframe-resizer'),
	('8978fb03','@lib/fileupload'),
	('8b088bc8','@craft/web/assets/plugins/dist'),
	('8decf9a5','@app/web/assets/updateswidget/dist'),
	('9190fafd','@lib/picturefill'),
	('95b63a79','@lib/jquery-ui'),
	('9634c63f','@lib/jquery-touch-events'),
	('96b5b04f','@craft/web/assets/clearcaches/dist'),
	('9924a1a8','@verbb/base/resources/dist'),
	('9a1a80d1','@app/web/assets/editentry/dist'),
	('9f35daac','@lib/d3'),
	('9f617a30','@lib/axios'),
	('9ff25612','@app/web/assets/graphiql/dist'),
	('abb2585f','/Users/joshcrawford/public_html/craft3-plugins/formie/src/web/assets/frontend/dist/js'),
	('ac88cd2a','@lib/garnishjs'),
	('ae1b9c46','@app/web/assets/cp/dist'),
	('b28ad945','@lib/vue'),
	('b356bbcb','@app/web/assets/recententries/dist'),
	('b9ce1914','@lib/fabric'),
	('bddb6c9f','@app/web/assets/fields/dist'),
	('c3c1f230','@craft/web/assets/cp/dist'),
	('c5eed779','@lib/selectize'),
	('c7380e34','@lib/jquery.payment'),
	('c7d65b77','/Users/joshcrawford/public_html/craft3-plugins/formie/src/web/assets/frontend/dist/css/fields'),
	('ca9056a1','@bower/jquery/dist'),
	('cb53107','@lib/velocity'),
	('cf8293f3','@lib/xregexp'),
	('d284f6fe','@app/web/assets/userpermissions/dist'),
	('d9bf2ba1','@craft/web/assets/updateswidget/dist'),
	('db1fa1dc','@lib/velocity'),
	('e4798681','@app/web/assets/admintable/dist'),
	('e500fd54','@lib/element-resize-detector'),
	('e6173d96','/Users/joshcrawford/public_html/craft3-plugins/formie/src/web/assets/frontend/dist/js/fields'),
	('e70569cf','@craft/web/assets/recententries/dist'),
	('f07dcb86','@lib/timepicker'),
	('f248c4fa','@app/web/assets/editsection/dist'),
	('f3062a69','@verbb/formie/web/assets/forms/dist'),
	('f3ef9e73','@ether/tagManager/web/assets'),
	('f8770fc2','@app/web/assets/plugins/dist');

/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table revisions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `revisions`;

CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zmqrvrhrljakrdktgtftbdbqehuwrtcjkmei` (`sourceId`,`num`),
  KEY `fk_vjbpdtgncyjrrmobrhuumffqrorkuducaedt` (`creatorId`),
  CONSTRAINT `fk_hwscddxuvslxlswcjxzzkmpeflzgzswvoupw` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vjbpdtgncyjrrmobrhuumffqrorkuducaedt` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;

INSERT INTO `revisions` (`id`, `sourceId`, `creatorId`, `num`, `notes`)
VALUES
	(1,3,1,1,''),
	(2,9,1,1,''),
	(3,11,1,1,'');

/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table searchindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `searchindex`;

CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_dircbqsrptjyseswojdffwjsphijgcbzokku` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`)
VALUES
	(1,'username',0,1,' formie '),
	(1,'lastname',0,1,' demo '),
	(1,'firstname',0,1,' formie '),
	(2,'slug',0,1,''),
	(3,'slug',0,1,' entry 1 '),
	(3,'title',0,1,' entry 1 '),
	(4,'slug',0,1,' category 1 '),
	(4,'title',0,1,' category 1 '),
	(5,'slug',0,1,' category 2 '),
	(5,'title',0,1,' category 2 '),
	(6,'slug',0,1,' category 3 '),
	(6,'title',0,1,' category 3 '),
	(7,'slug',0,1,' category 4 '),
	(7,'title',0,1,' category 4 '),
	(9,'title',0,1,' entry 2 '),
	(9,'slug',0,1,' entry 2 '),
	(11,'slug',0,1,' entry 3 '),
	(11,'title',0,1,' entry 3 '),
	(13,'slug',0,1,' temp ubsxpbvhefiiitalkeptgivacbnamlzkqzdh '),
	(13,'title',0,1,''),
	(14,'title',0,1,' fields demo '),
	(14,'handle',0,1,' fieldsdemo '),
	(14,'slug',0,1,''),
	(1,'fullname',0,1,' formie demo '),
	(1,'email',0,1,' demo verbb io '),
	(1,'slug',0,1,''),
	(15,'slug',0,1,' tag 1 '),
	(15,'title',0,1,' tag 1 '),
	(16,'slug',0,1,' tag 2 '),
	(16,'title',0,1,' tag 2 '),
	(17,'slug',0,1,' tag 3 '),
	(17,'title',0,1,' tag 3 '),
	(18,'title',0,1,' contact form '),
	(18,'handle',0,1,' contactform '),
	(18,'slug',0,1,'');

/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ntfkgkoxgkmvkbfeilmkjbapxkrnvyinemmd` (`handle`),
  KEY `idx_pqwdprimguqlxhsxiqetvitdzxhuwvjborsa` (`name`),
  KEY `idx_qkkbjcmpsjysxcyuupnmoxmmshhhhckvioau` (`structureId`),
  KEY `idx_uogngnciwpioqwptkgipjibqhxmyyrdozdyc` (`dateDeleted`),
  CONSTRAINT `fk_fugovcqotvsphyqcpobjujfkomivsakpvjhr` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagationMethod`, `defaultPlacement`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,NULL,'Demo','demo','channel',1,'all','end',NULL,'2021-08-07 00:05:46','2021-08-07 00:05:46',NULL,'fbe2bb47-a84e-4366-b957-3e127152e75a');

/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sections_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sections_sites`;

CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_slxwzvytquepcnbylpxohyxtlwqlktqmvavh` (`sectionId`,`siteId`),
  KEY `idx_ykcuipaswketxftuquamdlaoaymqkrnuuijc` (`siteId`),
  CONSTRAINT `fk_dytrwikjpjmmzgnkgefggylsleozwlnfqnit` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mjdfmkpmoqpuwelgvlnnlmctekzhpebpoiwg` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,1,'demo/{slug}','demo/_entry',1,'2021-08-07 00:05:46','2021-08-07 00:05:46','3bc33975-182f-486b-bd92-86607891b755');

/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sequences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sequences`;

CREATE TABLE `sequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eyhluwyqylmzjyjzttiogmamuvrkperllsmw` (`uid`),
  KEY `idx_macornsmeavtbcoyaottudchzafuqnzsxobs` (`token`),
  KEY `idx_nqhovpqulvmdutqvynsezvnorxhhqnxxybjl` (`dateUpdated`),
  KEY `idx_jwjxtrtvyxecpzihnlrfnmwycnyqrzbneolf` (`userId`),
  CONSTRAINT `fk_upveihnwvnbwkluowedopxiruacukoixdvuj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'Wy1Ys7fhY4-5nOQtrghm2O7JD_d13MEpgfLUIKAu5PB595cj_VEy4ED4LQPeAn99jbnnI9JGZiXd-SdQCJpN7pLJAofcb52k8U5J','2021-08-07 00:03:48','2021-08-08 09:07:11','6aef8a73-fe74-4abe-b163-a3b347c9f2ed');

/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shunnedmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shunnedmessages`;

CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usyqkuremafthrlzaeiwbypprdowclttfmpr` (`userId`,`message`),
  CONSTRAINT `fk_gnnzclgwmystppbykbmcovzqchsvmgonrjsx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sitegroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sitegroups`;

CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kwcpxouobiyxioiktjawzsjzgwgpppqgzpzu` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,'Formie Headless','2021-08-07 00:01:41','2021-08-07 00:01:41',NULL,'cf7b2541-4843-417e-9652-9a5d1a5a15a7');

/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sites`;

CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aojhpnrarjwfbwlrxprqdvqepnrvolxhxxdc` (`dateDeleted`),
  KEY `idx_jdtfoutsmwxrbzqpmpgjsphhxxbqxpqtxptz` (`handle`),
  KEY `idx_qisnfziqmsgibhxlojpekrlahxrzadhpidnn` (`sortOrder`),
  KEY `fk_gwwmexaqagquttgahxhkfgtlvrracpaepsdo` (`groupId`),
  CONSTRAINT `fk_gwwmexaqagquttgahxhkfgtlvrracpaepsdo` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;

INSERT INTO `sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,1,1,1,'Formie Headless','default','en-US',1,'$PRIMARY_SITE_URL',1,'2021-08-07 00:01:41','2021-08-07 00:01:41',NULL,'00079eeb-bb55-40b2-867b-65ed3665219f');

/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table structureelements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `structureelements`;

CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_laxpviqpbbpzajtcwtvbfptyqavoogdyiizm` (`structureId`,`elementId`),
  KEY `idx_hyvsjgvsckspdloakuprmzpgpioaxzmkbxbt` (`root`),
  KEY `idx_ciqgfunismlyrbvvznjjfkmumdcviyhqsttx` (`lft`),
  KEY `idx_ogqesppqhncqdhjtsdftuinyzuciynjjbhot` (`rgt`),
  KEY `idx_bzthuvnsujactdzdkgkmxeircpzxxfzjgjim` (`level`),
  KEY `idx_bufqjgwfissgkixjviowuxiinqthtsomafrf` (`elementId`),
  CONSTRAINT `fk_urnvfixthigvpyjpgusnyxabwbeyapvexfql` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vzdiystlksrdkldqoxgbezpqvbxtxadmxzwt` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;

INSERT INTO `structureelements` (`id`, `structureId`, `elementId`, `root`, `lft`, `rgt`, `level`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,NULL,1,1,10,0,'2021-08-07 00:11:05','2021-08-07 00:11:16','55e65596-5f58-4e3f-82ff-c217e137242b'),
	(2,1,4,1,2,3,1,'2021-08-07 00:11:05','2021-08-07 00:11:05','47741905-f624-4daa-bed5-3fd3729fce56'),
	(3,1,5,1,4,5,1,'2021-08-07 00:11:08','2021-08-07 00:11:08','0e5580bf-b281-43ec-a98f-b30b4a268a06'),
	(4,1,6,1,6,7,1,'2021-08-07 00:11:12','2021-08-07 00:11:12','2231902f-9c69-49ff-a745-7cde4b633a3a'),
	(5,1,7,1,8,9,1,'2021-08-07 00:11:16','2021-08-07 00:11:16','bbf40784-51aa-4c46-8032-d9412a0c9875');

/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table structures
# ------------------------------------------------------------

DROP TABLE IF EXISTS `structures`;

CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dlsevbvcpzearhjsyndfywuizljmbehhkacq` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;

INSERT INTO `structures` (`id`, `maxLevels`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,NULL,'2021-08-07 00:06:08','2021-08-07 00:06:08',NULL,'f6971801-c7f1-4cc7-9a40-4fa832abfa39');

/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table systemmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `systemmessages`;

CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jlfgotrypnntsdwrwselyzwlhrpauwtuxqyc` (`key`,`language`),
  KEY `idx_bpgghdnxyiveeuckydnbnduaueracjorjgkk` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table taggroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `taggroups`;

CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yfylvccabfmslmzcbytsulsxjlhuqhoomamx` (`name`),
  KEY `idx_eqwppyfjfzqnnzacqidcphbmccmrlyfdbkmr` (`handle`),
  KEY `idx_corjuasgirscqmwbdcanifljgnscpnufasod` (`dateDeleted`),
  KEY `fk_gyrgxsrujacyggixmnbfdvwvzprjvanxfvxi` (`fieldLayoutId`),
  CONSTRAINT `fk_gyrgxsrujacyggixmnbfdvwvzprjvanxfvxi` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;

INSERT INTO `taggroups` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,'Demo','demo',4,'2021-08-07 00:06:12','2021-08-07 00:06:12',NULL,'9ee7d758-c5b1-4f5a-a4d4-8c2e19e6cb15');

/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xgsykprhkkcrvptgotfkodcjlmioavrzjzsl` (`groupId`),
  CONSTRAINT `fk_ldlnjaflxduahpurbljblmucemfsdpqncfym` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sleboqknpskligtvzjavpgwyxvcckcstqbri` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;

INSERT INTO `tags` (`id`, `groupId`, `deletedWithGroup`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(15,1,NULL,'2021-08-07 11:34:38','2021-08-07 11:34:38','858febf4-4bea-4d08-85cb-872d3fa4da7e'),
	(16,1,NULL,'2021-08-07 11:34:42','2021-08-07 11:34:42','6a173c0b-f60e-44a0-bc54-c2f779fc3f8a'),
	(17,1,NULL,'2021-08-07 11:34:44','2021-08-07 11:34:44','9ad911d3-1a56-4fab-94b2-fd06611a4490');

/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table templatecacheelements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `templatecacheelements`;

CREATE TABLE `templatecacheelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ugzilrbdabyeaybadbsqkabvkjtqfmjilpvc` (`cacheId`),
  KEY `idx_tssofdisrkntxfuiiiuafdbhfkulyspnoyve` (`elementId`),
  CONSTRAINT `fk_casutkchjlcwftlalrpydfismoayuohaktdh` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qyvxsbbnmvdnftcdmayyydmhznonkivgoppd` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table templatecachequeries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `templatecachequeries`;

CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ojrntfjlvjiobsyosiliowymoyecqwyzpxgh` (`cacheId`),
  KEY `idx_scnlxxrdiqmcyqzbvxfrygakimeipfkcxjpn` (`type`),
  CONSTRAINT `fk_yemhiwocucoisqtviogiufcaaatnsrmussqd` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table templatecaches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `templatecaches`;

CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_fscnsjulqsriaedbfadrqzxdokmqeuqejchm` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `idx_dpxbhvqrteqchdsmkyaittsvgjdjyiqdnllb` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `idx_gifawsrtijyfpdimvwyrpsmfgxviphrvecru` (`siteId`),
  CONSTRAINT `fk_rvkpidhbneajhgyvhttrobztwtmpibdlrqwo` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tokens`;

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ktobuujveyupgftiydpevdhprplncskdcnco` (`token`),
  KEY `idx_cbsndvnsyswtmsydmpxvongyxbexqohynrht` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usergroups`;

CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_totiyklijbzwxjiptqfrwooetadepjhjnagn` (`handle`),
  KEY `idx_ffixqlytjchovbipaykjcikdmpxgonhwdrqz` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table usergroups_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usergroups_users`;

CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ootxzazrcdryoirjcslrujghefbfnmzggcag` (`groupId`,`userId`),
  KEY `idx_sutuijjisptfaqhdwrtqexgttfvgbrwyomhu` (`userId`),
  CONSTRAINT `fk_sjvulkdozdfclrhfenwbefporxpbclorngiu` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zcgdonwiasxvaslmunoilckvgngntrrziial` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table userpermissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpermissions`;

CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wrfacjtypuhgbbnykkrijdhbkgipercamlqg` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table userpermissions_usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpermissions_usergroups`;

CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qbzabweoeyopoiijxysydjkojahkdqambigy` (`permissionId`,`groupId`),
  KEY `idx_dbyuqcgqhtkfftzkmvdtmgdbsiparqgoietv` (`groupId`),
  CONSTRAINT `fk_xokjzqwpuluikwhwpvjnmqxghyflfdodldnr` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yrpyixwegebtkgzjsjgnwcfnlilhcgamtumy` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table userpermissions_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpermissions_users`;

CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lamzsluctfdtqconsblalfddmndbncdlrbbu` (`permissionId`,`userId`),
  KEY `idx_rsetcfqtenthhplzfytidzzioqfiwkvrnhny` (`userId`),
  CONSTRAINT `fk_hdyjmetswqexztsjqdznnfmjxvrrdyyqmclw` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_makxtgupnibqeaueadeqvtaeplxpjsnmxpto` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table userpreferences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpreferences`;

CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_jzaefgzayondcehqzasoipclngzlsffkjkeh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;

INSERT INTO `userpreferences` (`userId`, `preferences`)
VALUES
	(1,'{\"language\":\"en-US\",\"locale\":null,\"weekStartDay\":\"1\",\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false,\"showFieldHandles\":false,\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false,\"showExceptionView\":false,\"profileTemplates\":false}');

/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ejzxnjquoepgxbhhqeqzdfqgweqljmkbkzis` (`uid`),
  KEY `idx_aewtsdhqgmsuqynirojuvngosmwpqmhnrzpr` (`verificationCode`),
  KEY `idx_pckvwvrkqnqpvqvgbsshjwsjdiorappxlitw` (`email`),
  KEY `idx_xfgxgdafkydsddygahefziymvmqpcprjvzgl` (`username`),
  KEY `fk_pmzpmgzvdatzmpqypyevmelxheabojiwnqbw` (`photoId`),
  CONSTRAINT `fk_pmzpmgzvdatzmpqypyevmelxheabojiwnqbw` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tbywxvklfnixqevfhnjnhdzywgziiscbnery` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'formie',NULL,'Formie','Demo','demo@verbb.io','$2y$13$bWBMDbFNp3g0cg1kbQ1FFua89/amjEnaByfoyh2ItwzzCrBV0IVs2',1,0,0,0,'2021-08-07 00:03:48',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2021-08-07 00:01:42','2021-08-07 00:01:42','2021-08-07 11:32:50','1ea3c4a0-a1bf-4ecd-80e6-425620813daa');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table volumefolders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `volumefolders`;

CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xhqanulomzqoidxpijtvcemcvttyytqxwzyx` (`name`,`parentId`,`volumeId`),
  KEY `idx_aclwjnbkviajfzagippbvhxinvixumyldhbu` (`parentId`),
  KEY `idx_ujyxezcopiapkrcukrfymkahlrbsmwgeremc` (`volumeId`),
  CONSTRAINT `fk_dwxxemdptkkqjmgfxvjculzfvwyddklntjfu` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xsmhnzqunkbngvorgkpsjuvkhaiznbohdjtw` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;

INSERT INTO `volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,1,'Demo','','2021-08-07 00:06:01','2021-08-07 00:06:01','a61e8f67-28cc-43ec-8a76-730c60a192bf');

/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table volumes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `volumes`;

CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yrrcalzgcdnoawpegmmdalefnlddcagkglrj` (`name`),
  KEY `idx_pnzwryfgmurbsmfhavqxaralgkuekfgbrkov` (`handle`),
  KEY `idx_qgjrgxiqxkjzyybsjqapmtkcysvkikiklifj` (`fieldLayoutId`),
  KEY `idx_xymrkcdrummughimshxygznlvzmkmeymrehl` (`dateDeleted`),
  CONSTRAINT `fk_ckixtfkovvvxgbjbvsojkkajgcoueextwxxp` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;

INSERT INTO `volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `type`, `hasUrls`, `url`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `settings`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,2,'Demo','demo','craft\\volumes\\Local',0,NULL,'site',NULL,'{\"path\":\"@webroot/uploads/demo\"}',1,'2021-08-07 00:06:01','2021-08-07 00:06:01',NULL,'adf62689-9e99-4040-8bb3-c06de71033be');

/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table widgets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `widgets`;

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mzjtoccfqcetxqjnsyaqxefmxacwcpjbcckd` (`userId`),
  CONSTRAINT `fk_vocehnguepjbxcwneuzgexwebidejphubcaf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2021-08-07 00:03:49','2021-08-07 00:03:49','2c2f3526-0055-4644-87f3-52f5b17e5e31'),
	(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2021-08-07 00:03:49','2021-08-07 00:03:49','6ecbb3b0-5f19-4f6d-9c76-14cf8ce825c0'),
	(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2021-08-07 00:03:49','2021-08-07 00:03:49','d5f56ae5-9c95-4dc0-8984-d76dfa465816'),
	(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2021-08-07 00:03:49','2021-08-07 00:03:49','1ec56085-4845-43ff-8721-b13aad54687e');

/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
