CREATE DATABASE  IF NOT EXISTS `projectdb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `projectdb`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: projectdb
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `addarticle`
--

DROP TABLE IF EXISTS `addarticle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addarticle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `experience` varchar(2000) NOT NULL,
  `ano` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addarticle`
--

LOCK TABLES `addarticle` WRITE;
/*!40000 ALTER TABLE `addarticle` DISABLE KEYS */;
INSERT INTO `addarticle` VALUES (32,'ccccccc','ccccccccccc',2),(36,'bbbbbbbbbbb','bbbbbbbbbbbbbb',1),(39,'阿里','好玩',3),(40,'1111111','1111111111111111',1);
/*!40000 ALTER TABLE `addarticle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attractions`
--

DROP TABLE IF EXISTS `attractions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attractions` (
  `id` int NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `img` varchar(50) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `introduce` varchar(2000) DEFAULT NULL,
  `map` varchar(100) DEFAULT NULL,
  `locate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attractions`
--

LOCK TABLES `attractions` WRITE;
/*!40000 ALTER TABLE `attractions` DISABLE KEYS */;
INSERT INTO `attractions` VALUES (1,'台北','imgs/101.jpg','台北101','&nbsp;&nbsp;位於臺灣臺北市信義區的摩天大樓，樓高509公尺（1,670英尺），地上101層、地下5層,自落成以來即成為台北重要地標與觀光景點之一。\r <br><br>台北101是台灣第一高樓、以及唯一樓層超過100層的建築物， 曾於2004年12月1日至2010年1月7日間擁有世界第一高樓的紀錄。\r <br><br>目前為世界第十一高樓（截至2022年）以及世界最高的綠建築。大樓內擁有全球第二大、全球唯二開放給遊客觀賞的 巨型阻尼器。\r <br><br>標高509公尺的101樓上方之觀景台為全球最高的戶外屋頂觀景步道。 ','https://goo.gl/maps/6HhEkQ5GnRcA8eLq9','台北市信義區信義路五段7號'),(2,'陽明山','imgs/yanmin.jpg','陽明山國家公園','&nbsp;&nbsp;陽明山地區早自日治時期即為「大屯國立公園」預定地；當時範圍包括七星山、大屯山區及觀音山等地，此計畫惜因第二次世界大戰爆發而作罷。民國52年，交通部觀光事業小組曾委託臺灣省公共工程局，將陽明公園及鄰近七星山、大屯山、金山、野柳與富貴角等北部濱海地區，合併規劃為「陽明國家公園」，面積約28,400公頃，惟因當時尚無國家公園法而擱置。<br><br>直至民國70年，經何應欽將軍之提議，並由有關單位研究推動，於74年正式公告實施陽明山國家公園計劃，並於同年9月16日及翌年3月13日先後成立國家公園管理處及警察隊，積極推展各項經營管理業務。','https://goo.gl/maps/vkWHdkMLv89LF4C76','台北市北投區'),(3,'阿里山','imgs/ari.jpg','阿里山國家森林遊樂區','&nbsp;&nbsp;阿里山地區橫跨臺灣森林垂直分佈之熱、暖、溫三帶，蘊藏豐富的森林資源，尤以檜木名聞國際，漫步林間隨處可見。紅檜、臺灣扁柏、臺灣杉、鐵杉及華山松稱為阿里山五木，柳杉為本區人工造林最成功的外來樹種，沿森林鐵路漫山遍谷林木鬱成奇觀勝景。每年三月中旬至四月中旬為本區之櫻花季，吉野櫻、重瓣櫻、山櫻花點綴滿山，繽紛旖旎。其他花卉如森氏杜鵑、石楠花、毛地黃等等也陸續開放。另有列入保護之臺灣一葉蘭自然保留區，亦值得欣賞。','https://goo.gl/maps/zCSdnwNNQ8QJ8dLVA','嘉義縣阿里山鄉59號');
/*!40000 ALTER TABLE `attractions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `no` int NOT NULL AUTO_INCREMENT,
  `content` varchar(100) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `ano` int DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (53,'SUGOI','台北',1),(54,'TANOSHI','台北',1),(60,'YYYY','台北',2),(61,'1234456798','台北',2),(62,'YOYO','台北',1),(63,'TTTTRRRR','台北',2),(67,'123','台北',3),(68,'654','台北',3),(69,'好好玩','台北',3);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-07  8:58:14
