-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: movies
-- ------------------------------------------------------
-- Server version	8.0.35
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actors`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actors` (
  `id_actor` int NOT NULL AUTO_INCREMENT,
  `nom_actor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_actor`),
  UNIQUE KEY `nom_actor` (`nom_actor`)
) ENGINE=InnoDB AUTO_INCREMENT=2048 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `directors`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directors` (
  `id_director` int NOT NULL AUTO_INCREMENT,
  `nom_director` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_director`),
  UNIQUE KEY `nom_director` (`nom_director`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genere`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genere` (
  `id_genere` int NOT NULL AUTO_INCREMENT,
  `nom_genere` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_genere`),
  UNIQUE KEY `nom_genere` (`nom_genere`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pais`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `id_pais` int NOT NULL AUTO_INCREMENT,
  `nom_pais` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pais`),
  UNIQUE KEY `nom_pais` (`nom_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pelicules`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicules` (
  `id_pelicula` int NOT NULL AUTO_INCREMENT,
  `titol` varchar(255) NOT NULL,
  `any` int DEFAULT NULL,
  `vots` int DEFAULT NULL,
  `estudis` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pelicula`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pelicules_actors`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicules_actors` (
  `id_pelicula` int NOT NULL,
  `id_actor` int NOT NULL,
  `rol` varchar(255) NOT NULL,
  PRIMARY KEY (`id_pelicula`,`id_actor`,`rol`),
  KEY `id_actor` (`id_actor`),
  CONSTRAINT `pelicules_actors_ibfk_1` FOREIGN KEY (`id_pelicula`) REFERENCES `pelicules` (`id_pelicula`),
  CONSTRAINT `pelicules_actors_ibfk_2` FOREIGN KEY (`id_actor`) REFERENCES `actors` (`id_actor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pelicules_directors`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicules_directors` (
  `id_pelicula` int NOT NULL,
  `id_director` int NOT NULL,
  PRIMARY KEY (`id_pelicula`,`id_director`),
  KEY `id_director` (`id_director`),
  CONSTRAINT `pelicules_directors_ibfk_1` FOREIGN KEY (`id_pelicula`) REFERENCES `pelicules` (`id_pelicula`),
  CONSTRAINT `pelicules_directors_ibfk_2` FOREIGN KEY (`id_director`) REFERENCES `directors` (`id_director`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pelicules_genere`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicules_genere` (
  `id_pelicula` int NOT NULL,
  `id_genere` int NOT NULL,
  PRIMARY KEY (`id_pelicula`,`id_genere`),
  KEY `id_genere` (`id_genere`),
  CONSTRAINT `pelicules_genere_ibfk_1` FOREIGN KEY (`id_pelicula`) REFERENCES `pelicules` (`id_pelicula`),
  CONSTRAINT `pelicules_genere_ibfk_2` FOREIGN KEY (`id_genere`) REFERENCES `genere` (`id_genere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pelicules_pais`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicules_pais` (
  `id_pelicula` int NOT NULL,
  `id_pais` int NOT NULL,
  PRIMARY KEY (`id_pelicula`,`id_pais`),
  KEY `id_pais` (`id_pais`),
  CONSTRAINT `pelicules_pais_ibfk_1` FOREIGN KEY (`id_pelicula`) REFERENCES `pelicules` (`id_pelicula`),
  CONSTRAINT `pelicules_pais_ibfk_2` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-26  8:53:30
