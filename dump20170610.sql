CREATE DATABASE  IF NOT EXISTS `sysgeo` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sysgeo`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: sysgeo
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `kontynenty`
--

DROP TABLE IF EXISTS `kontynenty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kontynenty` (
  `id` decimal(8,0) NOT NULL,
  `powierzchnia` decimal(12,2) NOT NULL,
  `linia_brzegowa` decimal(12,2) NOT NULL,
  `nazwa` varchar(18) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kontynenty`
--

LOCK TABLES `kontynenty` WRITE;
/*!40000 ALTER TABLE `kontynenty` DISABLE KEYS */;
INSERT INTO `kontynenty` VALUES (1,10200000.00,38000.00,'europa'),(2,44600000.00,230300.00,'azja'),(3,30400000.00,26000.00,'afryka');
/*!40000 ALTER TABLE `kontynenty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kontynenty_panstwa`
--

DROP TABLE IF EXISTS `kontynenty_panstwa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kontynenty_panstwa` (
  `id` decimal(8,0) NOT NULL,
  `id_kontynent` decimal(8,0) NOT NULL,
  `id_panstwo` decimal(8,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_kontynent` (`id_kontynent`),
  CONSTRAINT `kontynenty_panstwa_ibfk_1` FOREIGN KEY (`id_kontynent`) REFERENCES `kontynenty` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kontynenty_panstwa`
--

LOCK TABLES `kontynenty_panstwa` WRITE;
/*!40000 ALTER TABLE `kontynenty_panstwa` DISABLE KEYS */;
INSERT INTO `kontynenty_panstwa` VALUES (1,1,1),(2,1,2),(3,1,5),(4,1,4);
/*!40000 ALTER TABLE `kontynenty_panstwa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miara`
--

DROP TABLE IF EXISTS `miara`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miara` (
  `id` decimal(8,0) NOT NULL,
  `nazwa` varchar(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miara`
--

LOCK TABLES `miara` WRITE;
/*!40000 ALTER TABLE `miara` DISABLE KEYS */;
INSERT INTO `miara` VALUES (1,'dlugosc'),(2,'glebokosc'),(3,'powierzchnia');
/*!40000 ALTER TABLE `miara` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miasta`
--

DROP TABLE IF EXISTS `miasta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miasta` (
  `id` decimal(8,0) NOT NULL,
  `nazwa` varchar(60) NOT NULL,
  `ludnosc` decimal(12,0) NOT NULL,
  `powierzchnia` decimal(12,2) DEFAULT NULL,
  `czyStolica` decimal(1,0) NOT NULL,
  `id_panstwo` decimal(8,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miasta`
--

LOCK TABLES `miasta` WRITE;
/*!40000 ALTER TABLE `miasta` DISABLE KEYS */;
INSERT INTO `miasta` VALUES (1,'londyn',8000000,10000.00,1,5),(2,'warszawa',1800000,30.00,1,1),(3,'plock',130000,15.00,0,1);
/*!40000 ALTER TABLE `miasta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panstwa`
--

DROP TABLE IF EXISTS `panstwa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panstwa` (
  `id` decimal(8,0) NOT NULL,
  `powierzchnia` decimal(12,2) NOT NULL,
  `dlugosc_granica` decimal(12,2) NOT NULL,
  `nazwa` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panstwa`
--

LOCK TABLES `panstwa` WRITE;
/*!40000 ALTER TABLE `panstwa` DISABLE KEYS */;
INSERT INTO `panstwa` VALUES (1,312000.00,770.00,'polska'),(2,400000.00,770.00,'niemcy'),(3,410000.00,2500.00,'hiszpania'),(4,150000.00,0.00,'czechy'),(5,130279.00,500.00,'anglia');
/*!40000 ALTER TABLE `panstwa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panstwo_panstwo`
--

DROP TABLE IF EXISTS `panstwo_panstwo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panstwo_panstwo` (
  `id` decimal(8,0) NOT NULL,
  `dlugosc_granicy` decimal(12,2) NOT NULL,
  `id_panstwo1` decimal(8,0) NOT NULL,
  `id_panstwo2` decimal(8,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panstwo_panstwo`
--

LOCK TABLES `panstwo_panstwo` WRITE;
/*!40000 ALTER TABLE `panstwo_panstwo` DISABLE KEYS */;
INSERT INTO `panstwo_panstwo` VALUES (1,600.00,1,2),(2,200.00,1,4);
/*!40000 ALTER TABLE `panstwo_panstwo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasmo_gorskie`
--

DROP TABLE IF EXISTS `pasmo_gorskie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pasmo_gorskie` (
  `id` decimal(8,0) NOT NULL,
  `nazwa` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasmo_gorskie`
--

LOCK TABLES `pasmo_gorskie` WRITE;
/*!40000 ALTER TABLE `pasmo_gorskie` DISABLE KEYS */;
/*!40000 ALTER TABLE `pasmo_gorskie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasmo_gorskie_panstwa`
--

DROP TABLE IF EXISTS `pasmo_gorskie_panstwa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pasmo_gorskie_panstwa` (
  `id` decimal(8,0) NOT NULL,
  `id_pasmo_gorskie` decimal(8,0) NOT NULL,
  `id_panstwo` decimal(8,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pasmo_gorskie` (`id_pasmo_gorskie`),
  CONSTRAINT `pasmo_gorskie_panstwa_ibfk_1` FOREIGN KEY (`id_pasmo_gorskie`) REFERENCES `pasmo_gorskie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasmo_gorskie_panstwa`
--

LOCK TABLES `pasmo_gorskie_panstwa` WRITE;
/*!40000 ALTER TABLE `pasmo_gorskie_panstwa` DISABLE KEYS */;
/*!40000 ALTER TABLE `pasmo_gorskie_panstwa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pustynie`
--

DROP TABLE IF EXISTS `pustynie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pustynie` (
  `id` decimal(8,0) NOT NULL,
  `powierzchnia` decimal(12,2) NOT NULL,
  `nazwa` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pustynie`
--

LOCK TABLES `pustynie` WRITE;
/*!40000 ALTER TABLE `pustynie` DISABLE KEYS */;
/*!40000 ALTER TABLE `pustynie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pustynie_kont_panst`
--

DROP TABLE IF EXISTS `pustynie_kont_panst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pustynie_kont_panst` (
  `id` decimal(8,0) NOT NULL,
  `id_pustynia` decimal(8,0) NOT NULL,
  `id_kontynent_panstwo` decimal(8,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pustynia` (`id_pustynia`),
  CONSTRAINT `pustynie_kont_panst_ibfk_1` FOREIGN KEY (`id_pustynia`) REFERENCES `pustynie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pustynie_kont_panst`
--

LOCK TABLES `pustynie_kont_panst` WRITE;
/*!40000 ALTER TABLE `pustynie_kont_panst` DISABLE KEYS */;
/*!40000 ALTER TABLE `pustynie_kont_panst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `szczyty`
--

DROP TABLE IF EXISTS `szczyty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `szczyty` (
  `id` decimal(8,0) NOT NULL,
  `wysokosc` decimal(12,2) NOT NULL,
  `id_pasmo_gorskie_panstwa` decimal(8,0) NOT NULL,
  `nazwa` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pasmo_gorskie_panstwa` (`id_pasmo_gorskie_panstwa`),
  CONSTRAINT `szczyty_ibfk_1` FOREIGN KEY (`id_pasmo_gorskie_panstwa`) REFERENCES `pasmo_gorskie_panstwa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `szczyty`
--

LOCK TABLES `szczyty` WRITE;
/*!40000 ALTER TABLE `szczyty` DISABLE KEYS */;
/*!40000 ALTER TABLE `szczyty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zbiornik_typ`
--

DROP TABLE IF EXISTS `zbiornik_typ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zbiornik_typ` (
  `id` decimal(8,0) NOT NULL,
  `nazwa` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zbiornik_typ`
--

LOCK TABLES `zbiornik_typ` WRITE;
/*!40000 ALTER TABLE `zbiornik_typ` DISABLE KEYS */;
/*!40000 ALTER TABLE `zbiornik_typ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zbiorniki`
--

DROP TABLE IF EXISTS `zbiorniki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zbiorniki` (
  `id` decimal(8,0) NOT NULL,
  `typ` decimal(8,0) NOT NULL,
  `nazwa` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `typ` (`typ`),
  CONSTRAINT `zbiorniki_ibfk_1` FOREIGN KEY (`typ`) REFERENCES `zbiornik_typ` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zbiorniki`
--

LOCK TABLES `zbiorniki` WRITE;
/*!40000 ALTER TABLE `zbiorniki` DISABLE KEYS */;
/*!40000 ALTER TABLE `zbiorniki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zbiorniki_miary`
--

DROP TABLE IF EXISTS `zbiorniki_miary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zbiorniki_miary` (
  `id` decimal(8,0) NOT NULL,
  `id_zbiornik` decimal(8,0) NOT NULL,
  `id_miara` decimal(8,0) NOT NULL,
  `wartosc` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zbiorniki_miary`
--

LOCK TABLES `zbiorniki_miary` WRITE;
/*!40000 ALTER TABLE `zbiorniki_miary` DISABLE KEYS */;
/*!40000 ALTER TABLE `zbiorniki_miary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zbiorniki_panstwa`
--

DROP TABLE IF EXISTS `zbiorniki_panstwa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zbiorniki_panstwa` (
  `id` decimal(8,0) NOT NULL,
  `id_panstwo` decimal(8,0) NOT NULL,
  `id_zbiornik` decimal(8,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_panstwo` (`id_panstwo`),
  CONSTRAINT `zbiorniki_panstwa_ibfk_1` FOREIGN KEY (`id_panstwo`) REFERENCES `panstwa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zbiorniki_panstwa`
--

LOCK TABLES `zbiorniki_panstwa` WRITE;
/*!40000 ALTER TABLE `zbiorniki_panstwa` DISABLE KEYS */;
/*!40000 ALTER TABLE `zbiorniki_panstwa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-10 23:43:00
