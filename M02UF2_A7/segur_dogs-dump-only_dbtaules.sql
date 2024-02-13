-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- mysqldump -u root -p -v --no-data --skip-triggers --no-create-db --skip-opt dogs > ~/sql/segur_dogs-dump-only_dbtaules.sql
-- 
-- Host: localhost    Database: dogs
-- ------------------------------------------------------
-- Server version	8.0.35
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `caracter`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caracter` (
  `idcar` int NOT NULL AUTO_INCREMENT,
  `caracter` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`idcar`),
  UNIQUE KEY `caracter` (`caracter`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `color_pelatge`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color_pelatge` (
  `idcolpel` int NOT NULL AUTO_INCREMENT,
  `color_pel` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`idcolpel`),
  UNIQUE KEY `color_pel` (`color_pel`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `color_ulls`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color_ulls` (
  `idcolulls` int NOT NULL AUTO_INCREMENT,
  `color_ulls` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`idcolulls`),
  UNIQUE KEY `color_ulls` (`color_ulls`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documents`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `iddog` int NOT NULL,
  `url` varchar(48) DEFAULT NULL,
  `imatge` varchar(48) DEFAULT NULL,
  `pdf` varchar(48) DEFAULT NULL,
  PRIMARY KEY (`iddog`),
  UNIQUE KEY `url` (`url`),
  UNIQUE KEY `imatge` (`imatge`),
  UNIQUE KEY `pdf` (`pdf`),
  CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`iddog`) REFERENCES `dog` (`iddog`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dog`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dog` (
  `iddog` int NOT NULL AUTO_INCREMENT,
  `name` varchar(42) DEFAULT NULL COMMENT 'Nom original de la raça en anglès',
  `nom` varchar(42) DEFAULT NULL COMMENT 'Traducció al Català',
  `idgrup` int DEFAULT NULL,
  `idsubgrup` int DEFAULT NULL,
  `alt_min` tinyint DEFAULT NULL,
  `alt_max` tinyint DEFAULT NULL,
  `edat_min` tinyint DEFAULT NULL,
  `edat_max` tinyint DEFAULT NULL,
  PRIMARY KEY (`iddog`),
  KEY `idgrup` (`idgrup`,`idsubgrup`),
  CONSTRAINT `dog_ibfk_1` FOREIGN KEY (`idgrup`, `idsubgrup`) REFERENCES `subgrup` (`idgrup`, `idsubgrup`)
) ENGINE=InnoDB AUTO_INCREMENT=357 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dog_caracter`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dog_caracter` (
  `iddog` int NOT NULL,
  `idcar` int NOT NULL,
  PRIMARY KEY (`iddog`,`idcar`),
  KEY `idcar` (`idcar`),
  CONSTRAINT `dog_caracter_ibfk_1` FOREIGN KEY (`iddog`) REFERENCES `dog` (`iddog`),
  CONSTRAINT `dog_caracter_ibfk_2` FOREIGN KEY (`idcar`) REFERENCES `caracter` (`idcar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dog_color_pelatge`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dog_color_pelatge` (
  `iddog` int NOT NULL,
  `idcolpel` int NOT NULL,
  PRIMARY KEY (`iddog`,`idcolpel`),
  KEY `idcolpel` (`idcolpel`),
  CONSTRAINT `dog_color_pelatge_ibfk_1` FOREIGN KEY (`iddog`) REFERENCES `dog` (`iddog`),
  CONSTRAINT `dog_color_pelatge_ibfk_2` FOREIGN KEY (`idcolpel`) REFERENCES `color_pelatge` (`idcolpel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dog_color_ulls`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dog_color_ulls` (
  `iddog` int NOT NULL,
  `idcolulls` int NOT NULL,
  PRIMARY KEY (`iddog`,`idcolulls`),
  KEY `idcolulls` (`idcolulls`),
  CONSTRAINT `dog_color_ulls_ibfk_1` FOREIGN KEY (`iddog`) REFERENCES `dog` (`iddog`),
  CONSTRAINT `dog_color_ulls_ibfk_2` FOREIGN KEY (`idcolulls`) REFERENCES `color_ulls` (`idcolulls`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dog_pais`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dog_pais` (
  `iddog` int NOT NULL,
  `idpais` int NOT NULL,
  PRIMARY KEY (`iddog`,`idpais`),
  KEY `idpais` (`idpais`),
  CONSTRAINT `dog_pais_ibfk_1` FOREIGN KEY (`iddog`) REFERENCES `dog` (`iddog`),
  CONSTRAINT `dog_pais_ibfk_2` FOREIGN KEY (`idpais`) REFERENCES `pais` (`idpais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dog_salut`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dog_salut` (
  `iddog` int NOT NULL,
  `idsalut` int NOT NULL,
  PRIMARY KEY (`iddog`,`idsalut`),
  KEY `idsalut` (`idsalut`),
  CONSTRAINT `dog_salut_ibfk_1` FOREIGN KEY (`iddog`) REFERENCES `dog` (`iddog`),
  CONSTRAINT `dog_salut_ibfk_2` FOREIGN KEY (`idsalut`) REFERENCES `salut` (`idsalut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grup`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grup` (
  `idgrup` int NOT NULL AUTO_INCREMENT,
  `nomgrup` varchar(48) DEFAULT NULL,
  PRIMARY KEY (`idgrup`),
  UNIQUE KEY `nomgrup` (`nomgrup`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pais`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `idpais` int NOT NULL AUTO_INCREMENT,
  `nompais` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`idpais`),
  UNIQUE KEY `nompais` (`nompais`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salut`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salut` (
  `idsalut` int NOT NULL AUTO_INCREMENT,
  `salut` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`idsalut`),
  UNIQUE KEY `salut` (`salut`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subgrup`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subgrup` (
  `idgrup` int NOT NULL,
  `idsubgrup` int NOT NULL AUTO_INCREMENT,
  `nomsubgrup` varchar(48) DEFAULT NULL,
  PRIMARY KEY (`idsubgrup`,`idgrup`),
  UNIQUE KEY `nomsubgrup` (`nomsubgrup`),
  KEY `idgrup` (`idgrup`),
  CONSTRAINT `subgrup_ibfk_1` FOREIGN KEY (`idgrup`) REFERENCES `grup` (`idgrup`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-23 19:57:11
