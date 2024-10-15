-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: instadb 
-- ------------------------------------------------------
-- Server version	5.7.28-log

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
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follow` (
  `nomuser` varchar(12) NOT NULL,
  `nomfollow` varchar(12) NOT NULL,
  PRIMARY KEY (`nomuser`,`nomfollow`),
  KEY `nomfollow` (`nomfollow`),
  CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`nomuser`) REFERENCES `user` (`nom`),
  CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`nomfollow`) REFERENCES `user` (`nom`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` VALUES ('Denise','Aladdin'),('Heidi','Amir'),('dante','andrea'),('maria','andrea'),('laia','angel'),('laia','antonio'),('Piper','Aquila'),('Ferris','Ashton'),('Blossom','Athena'),('Rose','Barbara'),('Briar','Bevis'),('Samantha','Brock'),('Mallory','Camden'),('victor','Camden'),('jose_antonio','Dale'),('eugene','dante'),('laia','dante'),('Tamara','dante'),('Alma','Dominic'),('Emi','Doris'),('Brody','eugene'),('dante','eugene'),('laia','eugene'),('Imogene','Faith'),('Isaiah','Finn'),('Lacota','Fletcher'),('Gloria','Francesca'),('Abra','Geoffrey'),('Camden','Geoffrey'),('Rahim','Hayley'),('Sybil','Heidi'),('Acton','Imogene'),('Cedric','Ivan'),('Gloria','Ivan'),('Dale','Jaden'),('eugene','jamile'),('joan','jamile'),('laia','jamile'),('oliver','jamile'),('Molly','Jenna'),('Nolan','Jennifer'),('Whilemina','Jessica'),('Rose','Joel'),('victor','jose_antonio'),('Kenneth','juliana'),('maria','juliana'),('Reagan','Kadeem'),('Yvette','Kadeem'),('Jocelyn','Kenneth'),('Bruce','laia'),('Hedley','laia'),('joan','laia'),('josep','laia'),('Sopoline','Lane'),('Alika','Leslie'),('Alika','Lev'),('dante','Lucius'),('Barrett','Madonna'),('andrea','maria'),('Devin','maria'),('Rinah','Marvin'),('Joel','Minerva'),('Kylie','Minerva'),('Briar','Molly'),('Rama','Odessa'),('jamile','oliver'),('laia','oliver'),('Patience','Ora'),('Gloria','Paul'),('antonio','peter'),('jamile','peter'),('joan','peter'),('laia','peter'),('Stacy','Piper'),('Eleanor','Rama'),('Freya','Raven'),('Melissa','Raya'),('Jessica','Reagan'),('Imogene','Rinah'),('Thaddeus','Robert'),('Ian','Savannah'),('Flavia','Skyler'),('Barrett','Summer'),('Preston','Summer'),('Robert','Tana'),('Ryan','Tatum'),('Ima','Troy'),('angel','victor'),('jose_antonio','victor'),('Jack','Whilemina');
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likephoto`
--

DROP TABLE IF EXISTS `likephoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likephoto` (
  `idphoto` int(11) NOT NULL,
  `nomuser` varchar(12) NOT NULL,
  `nomlikeuser` varchar(12) NOT NULL,
  `comentari` varchar(24) DEFAULT NULL COMMENT 'Comentari a la foto',
  PRIMARY KEY (`idphoto`,`nomuser`,`nomlikeuser`),
  KEY `nomlikeuser` (`nomlikeuser`),
  CONSTRAINT `likephoto_ibfk_1` FOREIGN KEY (`idphoto`, `nomuser`) REFERENCES `photouser` (`idphoto`, `nomuser`),
  CONSTRAINT `likephoto_ibfk_2` FOREIGN KEY (`nomlikeuser`) REFERENCES `user` (`nom`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likephoto`
--

LOCK TABLES `likephoto` WRITE;
/*!40000 ALTER TABLE `likephoto` DISABLE KEYS */;
INSERT INTO `likephoto` VALUES (5000,'peter','jamile','Great picture'),(5000,'peter','laia',NULL),(5000,'peter','Valentine',NULL),(5002,'jamile','laia','Molt maca'),(5002,'jamile','Liberty',NULL),(5005,'laia','eugene',NULL),(5006,'joan','dante','Awesome'),(5006,'joan','eugene','Fantàstica'),(5006,'joan','jamile','Amazing'),(5006,'joan','victor',NULL),(5008,'dante','eugene',NULL),(5008,'dante','jamile',NULL),(5008,'dante','laia',NULL),(5008,'dante','maria','Maravillosa perspectiva'),(5008,'dante','Tatyana',NULL),(5008,'dante','victor',NULL),(5009,'victor','andrea','Guay'),(5012,'Robert','Melissa',NULL),(5013,'victor','Whilemina',NULL),(5013,'victor','Yetta',NULL),(5014,'Raya','Rose',NULL),(5019,'Rama','Robert',NULL),(5020,'Isaiah','Ava',NULL),(5020,'Isaiah','Jarrod',NULL),(5026,'John','Robert',NULL),(5027,'Savannah','Casey',NULL),(5037,'Tate','Rinah',NULL),(5041,'Jennifer','Raven',NULL),(5045,'Marcia','Aquila',NULL),(5047,'Noel','Lydia',NULL),(5053,'Erich','Keith',NULL),(5056,'Olga','Jamalia',NULL),(5060,'Tyrone','Cameron',NULL),(5060,'Tyrone','Hannah',NULL),(5063,'Jena','Madonna',NULL),(5064,'Jennifer','Barclay',NULL),(5068,'victor','Reagan',NULL),(5069,'Caleb','Fletcher',NULL),(5069,'Caleb','Lydia',NULL),(5071,'Fletcher','Tyrone',NULL),(5073,'John','Lucius',NULL),(5073,'John','Olga',NULL),(5074,'Meghan','Tatyana',NULL),(5076,'Jennifer','Cameron',NULL),(5077,'Nyssa','Dale',NULL),(5079,'Adria','Meghan',NULL),(5080,'Whilemina','Joel',NULL),(5080,'Whilemina','Marvin',NULL),(5086,'Summer','Erich',NULL),(5089,'Briar','Jaden',NULL),(5089,'Briar','Jael',NULL),(5090,'Rose','Ima',NULL),(5090,'Rose','Jarrod',NULL),(5092,'Rahim','Willow',NULL),(5095,'Eleanor','Yvette',NULL),(5098,'Freya','Acton',NULL),(5100,'Carissa','Aiko',NULL),(5100,'Carissa','andrea',NULL),(5100,'Carissa','Gloria',NULL),(5100,'Carissa','Ian',NULL),(5100,'Carissa','Virginia',NULL),(5102,'peter','Lillith',NULL),(5102,'peter','Shelley',NULL),(5102,'peter','Whilemina',NULL),(5103,'Iola','Camden',NULL),(5104,'Acton','maria',NULL),(5110,'Keith','Cadman',NULL),(5112,'Clio','Doris',NULL),(5113,'Faith','Declan',NULL),(5115,'Piper','Isaiah',NULL);
/*!40000 ALTER TABLE `likephoto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `codepais` int(5) unsigned zerofill NOT NULL,
  `nom` varchar(18) NOT NULL,
  `poblacio` int(11) DEFAULT NULL COMMENT 'Num. habitants',
  `idioma` enum('English','Spanish','Catalan','German','French','Chinese','Japanese','Russian','Italian','Greek') DEFAULT 'English',
  PRIMARY KEY (`codepais`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (00100,'Ireland',9500000,'English'),(00101,'United Kingdom',12740000,'English'),(00102,'Spain',47000000,'Spanish'),(00103,'Spain',47000000,'Catalan'),(00104,'Italy',24200000,'Italian'),(00105,'France',38200000,'French');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photouser`
--

DROP TABLE IF EXISTS `photouser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photouser` (
  `idphoto` int(11) NOT NULL AUTO_INCREMENT,
  `nomuser` varchar(12) NOT NULL,
  `data` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Data en que es penja la foto',
  `lloc` varchar(24) DEFAULT NULL COMMENT 'Lloc on es va fer la foto',
  `descripcio` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`idphoto`,`nomuser`),
  KEY `nomuser` (`nomuser`),
  CONSTRAINT `photouser_ibfk_1` FOREIGN KEY (`nomuser`) REFERENCES `user` (`nom`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5117 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photouser`
--

LOCK TABLES `photouser` WRITE;
/*!40000 ALTER TABLE `photouser` DISABLE KEYS */;
INSERT INTO `photouser` VALUES (5000,'peter','2019-11-23 20:21:48','Mar negre','Estiu 2011'),(5001,'peter','2019-11-23 20:21:48','Lloret de mar',NULL),(5002,'jamile','2015-05-12 00:00:00','Viena','Carrers de nit'),(5003,'jamile','2015-05-14 15:30:10','Viena','Carrers de dia'),(5004,'eugene','2019-11-23 20:21:48',NULL,'Fotografia macro'),(5005,'laia','2018-07-14 00:00:00','Barcelona','La Pedrera'),(5006,'joan','2009-12-10 00:00:00','Lleida','Finestres blaves'),(5007,'laia','2019-11-23 20:21:48',NULL,NULL),(5008,'dante','2019-10-21 00:00:00','Venècia','Góndoles #venecianes'),(5009,'victor','2019-01-15 00:00:00','La Vall d_Aran','#Muntanyes nevades'),(5011,'Stacy','2019-11-23 20:52:10',NULL,NULL),(5012,'Robert','2019-11-23 21:08:02',NULL,NULL),(5013,'victor','2017-09-04 13:10:44',NULL,NULL),(5014,'Raya','2018-01-27 14:32:11','Tampa                   ','Sasquatch Ale'),(5016,'Freya','2017-04-21 13:01:36','Boston                  ','Lakkalikri'),(5017,'victor','2018-03-28 12:23:40','Racine                  ','Chocolade'),(5018,'Denise','2016-12-25 22:04:49','Savannah                ','Rogede sild'),(5019,'Rama','2017-11-15 11:42:03','Neward                  ','Sir Rodney\'s Marmalade'),(5020,'Isaiah','2013-09-30 16:24:15','Santa Clara             ','Gnocchi di nonna Alice'),(5021,'Leandra','2018-09-23 23:15:05','Fairport                ','Nord-Ost Matjeshering'),(5022,'antonio','2016-07-15 09:16:57','Austin                  ','Uncle Bob\'s Organic Dried Pears'),(5023,'Heidi','2018-06-17 11:31:12','Bentonville             ','Grandma\'s Boysenberry Spread'),(5024,'dante','2015-04-17 09:04:25','Atlanta                 ','Sasquatch Ale'),(5025,'Ora','2014-05-30 08:35:00','Hoffman Estates         ','Pt chinois'),(5026,'John','2013-08-08 04:16:07','Portsmouth              ','Sir Rodney\'s Marmalade'),(5027,'Savannah','2018-02-21 05:30:24','Louisville              ','Chef Anton\'s Gumbo Mix'),(5028,'dante','2015-02-10 16:16:02','Morristown              ','Lakkalikri'),(5029,'Basia','2016-10-03 09:44:05','Louisville              ','Boston Crab Meat'),(5030,'Shelley','2015-04-14 07:28:47','Morristown              ','Teatime Chocolate Biscuits'),(5031,'Tate','2018-08-05 12:29:28','Findlay                 ','Manjimup Dried Apples'),(5032,'Denise','2012-05-15 00:01:25','Hollis                  ','Pavlova'),(5033,'Finn','2014-02-24 21:48:22','Cary                    ','Tunnbrd'),(5034,'Kenneth','2013-04-08 08:13:25','Austin                  ','Jack\'s New England Clam Chowder'),(5035,'Devin','2013-01-20 00:08:17','Austin                  ','Perth Pasties'),(5036,'Cadman','2014-10-11 08:26:52','Phoenix                 ','Mishi Kobe Niku'),(5037,'Tate','2014-02-18 02:06:36','Portsmouth              ','Ravioli Angelo'),(5038,'Ashton','2014-06-01 18:19:11','Findlay                 ','Queso Cabrales'),(5039,'Troy','2014-02-08 03:45:17','Tampa                   ','Tunnbrd'),(5040,'Marsden','2015-01-06 05:21:12','Mellvile                ','Manjimup Dried Apples'),(5041,'Jennifer','2017-04-30 01:20:56','Hollis                  ','Ravioli Angelo'),(5042,'Nolan','2013-11-09 07:49:50','Chicago                 ','Gudbrandsdalsost'),(5043,'Selma','2012-05-19 22:02:10','Redmond                 ','Gudbrandsdalsost'),(5044,'Emi','2012-01-18 04:29:55','Greensboro              ','Pavlova'),(5045,'Marcia','2016-01-30 06:01:05','Hoffman Estates         ','Original Frankfurter grne Soe'),(5046,'Lev','2017-04-27 05:28:32','Austin                  ','Uncle Bob\'s Organic Dried Pears'),(5047,'Noel','2013-12-10 02:19:03','Atlanta                 ','Maxilaku'),(5048,'Ulysses','2012-09-18 17:37:56','Troy                    ','NuNuCa Nu-Nougat-Creme'),(5049,'Skyler','2016-09-14 20:06:32','Chicago                 ','Nord-Ost Matjeshering'),(5050,'Tyrone','2015-12-21 06:23:30','Braintree               ','Chocolade'),(5051,'Tyrone','2018-12-09 22:43:48','San Francisco           ','Ipoh Coffee'),(5052,'Summer','2017-11-18 06:34:09','Bloomfield Hills        ','Tunnbrd'),(5053,'Erich','2017-05-29 21:40:24','Hoffman Estates         ','Gnocchi di nonna Alice'),(5054,'Ira','2016-02-08 07:24:49','Minneapolis             ','Steeleye Stout'),(5055,'Daphne','2017-04-04 08:25:50','Rockville               ','Rssle Sauerkraut'),(5056,'Olga','2014-03-16 15:44:11','Menlo Park              ','Maxilaku'),(5057,'Lacota','2017-04-10 20:04:51','Hollis                  ','Manjimup Dried Apples'),(5058,'Yvette','2012-01-07 14:41:29','Hoffman Estates         ','Tunnbrd'),(5059,'Portia','2016-06-17 21:26:07','Braintree               ','Lakkalikri'),(5060,'Tyrone','2012-08-27 04:19:13','Braintree               ','Laughing Lumberjack Lager'),(5061,'Nolan','2014-10-01 11:01:48','Westboro                ','Ravioli Angelo'),(5062,'Declan','2017-03-18 00:08:09','Southfield              ','Konbu'),(5063,'Jena','2015-01-22 18:39:44','Orlando                 ','Northwoods Cranberry Sauce'),(5064,'Jennifer','2013-11-23 20:43:02','Seattle                 ','Pt chinois'),(5065,'Carissa','2015-07-29 13:55:51','Bellevue                ','Sir Rodney\'s Scones'),(5066,'Daquan','2013-02-25 17:15:50','Cambridge               ','Louisiana Hot Spiced Okra'),(5067,'Maxwell','2014-07-16 13:34:28','Troy                    ','Chef Anton\'s Gumbo Mix'),(5068,'victor','2017-02-07 22:00:16','Providence              ','Escargots de Bourgogne'),(5069,'Caleb','2015-10-22 04:34:34','Greensboro              ','Mozzarella di Giovanni'),(5070,'Carissa','2016-07-02 09:55:13','Phoenix                 ','Gumbr Gummibrchen'),(5071,'Fletcher','2013-11-06 15:32:30','Wilton                  ','Rd Kaviar'),(5072,'Tate','2016-02-24 12:20:45','Portsmouth              ','Tunnbrd'),(5073,'John','2016-04-16 10:58:36','Providence              ','Laughing Lumberjack Lager'),(5074,'Meghan','2018-04-28 11:09:46','Philadelphia            ','Gorgonzola Telino'),(5075,'Raya','2013-07-19 05:30:17','Findlay                 ','Louisiana Fiery Hot Pepper Sauce'),(5076,'Jennifer','2017-08-03 11:22:04','Campbell                ','Scottish Longbreads'),(5077,'Nyssa','2014-12-22 00:26:49','Redmond                 ','Louisiana Hot Spiced Okra'),(5078,'TaShya','2017-05-17 23:05:53','Neward                  ','Cte de Blaye'),(5079,'Adria','2016-05-24 10:14:41','Roseville               ','Perth Pasties'),(5080,'Whilemina','2017-12-09 16:01:09','Braintree               ','Louisiana Fiery Hot Pepper Sauce'),(5081,'Dane','2016-12-14 09:56:50','Austin                  ','Vegie-spread'),(5082,'Ulysses','2017-03-06 00:54:08','Santa Cruz              ','Boston Crab Meat'),(5083,'Yvette','2012-06-17 21:20:09','Colorado Springs        ','Gula Malacca'),(5084,'Athena','2017-08-24 14:14:11','Redmond                 ','Chartreuse verte'),(5085,'Jared','2015-09-25 20:21:57','Cambridge               ','Vegie-spread'),(5086,'Summer','2013-07-31 03:18:40','Cary                    ','Mozzarella di Giovanni'),(5087,'Lev','2015-08-17 17:48:11','Greensboro              ','Sirop d\'rable'),(5088,'Heidi','2017-08-21 22:57:28','Seattle                 ','Gravad lax'),(5089,'Briar','2012-08-15 14:55:09','Troy                    ','Sirop d\'rable'),(5090,'Rose','2016-02-10 21:27:47','Menlo Park              ','Genen Shouyu'),(5091,'Karina','2017-09-09 19:54:11','Campbell                ','Rssle Sauerkraut'),(5092,'Rahim','2017-07-14 02:20:23','Hollis                  ','Spegesild'),(5093,'Finn','2015-12-31 04:58:42','Atlanta                 ','Nord-Ost Matjeshering'),(5094,'Aimee','2013-09-09 13:14:16','Braintree               ','Alice Mutton'),(5095,'Eleanor','2016-02-29 12:22:24','Philadelphia            ','Gustaf\'s Knckebrd'),(5096,'Briar','2017-08-25 03:58:47','San Francisco           ','Escargots de Bourgogne'),(5097,'Hakeem','2012-06-30 17:03:54','Denver                  ','Gnocchi di nonna Alice'),(5098,'Freya','2012-02-27 16:49:14','Southfield              ','Chef Anton\'s Cajun Seasoning'),(5099,'Hannah','2018-11-03 15:13:00','Santa Clara             ','Geitost'),(5100,'Carissa','2014-05-19 05:06:14','Philadelphia            ','Laughing Lumberjack Lager'),(5101,'Tyrone','2014-06-20 17:14:27','Bellevue                ','Valkoinen suklaa'),(5102,'peter','2015-09-08 12:42:52','New York                ','Filo Mix'),(5103,'Iola','2017-09-02 16:37:51','Chicago                 ','Singaporean Hokkien Fried Mee'),(5104,'Acton','2015-04-13 09:43:50','Racine                  ','Northwoods Cranberry Sauce'),(5105,'Carissa','2017-02-18 05:06:02','Southfield              ','Northwoods Cranberry Sauce'),(5106,'dante','2015-09-23 10:25:02','Minneapolis             ','Konbu'),(5107,'Tyrone','2014-12-05 11:44:41','Scottsdale              ','Gudbrandsdalsost'),(5108,'Dale','2012-06-04 12:34:00','Menlo Park              ','Queso Manchego La Pastora'),(5109,'Aiko','2012-03-22 01:21:45','Chicago                 ','Tunnbrd'),(5110,'Keith','2015-07-03 04:16:36','Rockville               ','Steeleye Stout'),(5111,'Allen','2015-08-01 11:38:51','Greensboro              ','Sir Rodney\'s Scones'),(5112,'Clio','2012-05-13 12:09:28','Santa Cruz              ','Thringer Rostbratwurst'),(5113,'Faith','2017-03-18 12:57:28','Hoffman Estates         ','Sir Rodney\'s Marmalade'),(5114,'Freya','2012-12-22 23:38:23','New York                ','Vegie-spread'),(5115,'Piper','2017-12-03 09:29:52','Mellvile                ','Sir Rodney\'s Marmalade'),(5116,'Jasmine','2017-05-18 00:51:57','Providence              ','Rogede sild');
/*!40000 ALTER TABLE `photouser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagphoto`
--

DROP TABLE IF EXISTS `tagphoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagphoto` (
  `idphoto` int(11) NOT NULL,
  `nomuser` varchar(12) NOT NULL,
  `tag` varchar(24) NOT NULL COMMENT 'mots per cercar fotos',
  PRIMARY KEY (`idphoto`,`nomuser`,`tag`),
  CONSTRAINT `tagphoto_ibfk_1` FOREIGN KEY (`idphoto`, `nomuser`) REFERENCES `photouser` (`idphoto`, `nomuser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagphoto`
--

LOCK TABLES `tagphoto` WRITE;
/*!40000 ALTER TABLE `tagphoto` DISABLE KEYS */;
INSERT INTO `tagphoto` VALUES (5000,'peter','mar'),(5000,'peter','negre'),(5000,'peter','vaixell'),(5001,'peter','aquari'),(5001,'peter','lloretdemar'),(5001,'peter','peixos'),(5004,'eugene','insecte'),(5004,'eugene','macro'),(5005,'laia','blava'),(5005,'laia','finestra');
/*!40000 ALTER TABLE `tagphoto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `nom` varchar(12) NOT NULL,
  `datanaix` date DEFAULT NULL,
  `codepais` int(5) unsigned zerofill DEFAULT NULL,
  `empresa` enum('Si','No') DEFAULT 'No',
  PRIMARY KEY (`nom`),
  KEY `codepais` (`codepais`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`codepais`) REFERENCES `pais` (`codepais`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('Abra','1980-01-09',00105,'Si'),('Acton','1960-03-15',00103,'No'),('Adria','1977-06-23',00101,'Si'),('Adrian','1984-08-24',00105,'No'),('Aiko','1977-06-17',00104,'No'),('Aimee','1984-09-19',00102,'No'),('Aladdin','1963-01-24',00100,'Si'),('Alika','1978-02-19',00102,'Si'),('Allen','1985-01-04',00102,'Si'),('Alma','2001-06-05',00103,'Si'),('Amir','1975-10-03',00105,'No'),('andrea','1999-09-09',00104,'Si'),('angel','2001-01-15',00105,'No'),('antonio','1960-07-16',00102,'No'),('Aquila','2000-04-30',00100,'No'),('Arthur','1971-02-27',00105,'No'),('Ashton','1994-02-13',00102,'Si'),('Athena','1993-10-12',00105,'Si'),('Ava','1986-06-04',00100,'No'),('Barbara','1995-11-11',00100,'Si'),('Barclay','1989-07-14',00102,'No'),('Barrett','1988-01-21',00100,'Si'),('Basia','2000-05-29',00103,'No'),('Bevis','1976-05-03',00101,'No'),('Blossom','1994-12-05',00104,'Si'),('Blythe','1984-06-17',00103,'Si'),('Branden','1975-09-20',00102,'No'),('Briar','1976-02-08',00103,'Si'),('Britanney','1975-08-18',00100,'Si'),('Brock','1981-06-29',00103,'Si'),('Brody','1977-01-01',00104,'No'),('Bruce','1996-10-17',00102,'No'),('Bryar','1982-09-23',00102,'Si'),('Cadman','1976-10-15',00105,'No'),('Caleb','1993-05-27',00102,'No'),('Camden','1971-12-04',00101,'No'),('Cameron','1990-08-23',00102,'No'),('Camilla','1984-11-28',00102,'No'),('Carissa','1992-12-14',00103,'No'),('Casey','1962-09-21',00104,'No'),('Cedric','1996-10-03',00102,'Si'),('Clio','1967-04-26',00101,'No'),('Dale','1972-02-25',00102,'No'),('Dane','1984-09-27',00100,'Si'),('dante','1997-05-14',00104,'Si'),('Daphne','2000-08-07',00102,'No'),('Daquan','1970-04-29',00105,'Si'),('Darrel','1987-11-21',00105,'Si'),('Declan','1983-01-31',00105,'Si'),('Denise','1976-04-28',00101,'No'),('Devin','1973-08-29',00102,'Si'),('Dominic','1973-07-27',00100,'Si'),('Doris','1964-01-30',00101,'Si'),('Eleanor','1987-11-10',00104,'No'),('Emi','1995-06-22',00104,'Si'),('Erich','1976-08-20',00103,'No'),('Erin','1965-08-13',00103,'No'),('eugene','1992-04-13',00105,'No'),('Faith','1996-07-26',00100,'Si'),('Fatima','1977-02-11',00104,'Si'),('Ferdinand','1964-07-27',00100,'Si'),('Ferris','2001-02-09',00103,'No'),('Finn','1982-10-01',00101,'Si'),('Flavia','1988-06-19',00105,'No'),('Fletcher','1979-01-29',00104,'No'),('Florence','1994-11-02',00101,'No'),('Francesca','1963-08-23',00101,'No'),('Freya','1967-02-24',00104,'No'),('Geoffrey','1995-10-26',00105,'Si'),('Gil','1987-04-14',00104,'Si'),('Gloria','1994-06-28',00103,'No'),('Hakeem','1985-01-09',00103,'Si'),('Hannah','2001-04-23',00104,'Si'),('Hayley','1973-11-20',00105,'Si'),('Hedley','1995-05-31',00100,'No'),('Heidi','1979-10-20',00102,'Si'),('Ian','1994-09-07',00101,'No'),('Ima','1982-11-14',00100,'No'),('Imogene','1990-11-26',00104,'No'),('Iola','1987-06-13',00102,'No'),('Ira','1978-06-27',00104,'No'),('Isaiah','1983-02-01',00101,'No'),('Ivan','1960-10-20',00100,'Si'),('Jack','1970-02-17',00103,'No'),('Jacqueline','1963-05-22',00104,'No'),('Jaden','1976-02-18',00105,'No'),('Jael','1997-11-07',00103,'No'),('Jamalia','1969-10-15',00103,'No'),('jamile','1990-03-12',00104,'Si'),('Jared','1986-05-12',00101,'No'),('Jarrod','1990-10-11',00105,'Si'),('Jasmine','1966-01-19',00102,'Si'),('Jasper','1989-11-19',00105,'No'),('Jena','1997-07-03',00101,'Si'),('Jenna','1987-09-29',00101,'Si'),('Jennifer','1980-12-23',00100,'No'),('Jessica','1979-03-21',00104,'Si'),('joan','1970-01-10',00103,'No'),('Jocelyn','1963-10-05',00105,'Si'),('Joel','1993-02-18',00101,'Si'),('John','1990-01-15',00100,'Si'),('josep','1965-12-06',00103,'No'),('jose_antonio','1962-11-26',00102,'No'),('Julian','1973-10-08',00102,'Si'),('juliana','1955-06-21',00100,'No'),('Kadeem','1966-08-18',00102,'No'),('Karina','1987-05-22',00105,'No'),('Keith','1970-10-13',00101,'Si'),('Kendall','1964-12-04',00105,'No'),('Kenneth','1965-04-12',00105,'Si'),('Kerry','1964-11-23',00105,'Si'),('Kylie','1985-10-16',00102,'Si'),('Lacota','1976-06-04',00101,'Si'),('laia','1995-03-31',00101,'No'),('Lane','1992-06-15',00103,'Si'),('Leandra','1961-10-05',00100,'No'),('Leslie','1966-09-12',00105,'No'),('Lev','1997-01-24',00105,'Si'),('Liberty','1975-07-27',00105,'No'),('Lillith','1990-03-20',00104,'Si'),('Lucius','1979-07-28',00105,'Si'),('Lydia','1993-12-19',00105,'Si'),('Madonna','1971-03-07',00102,'Si'),('Mallory','1984-12-31',00104,'No'),('Marcia','1989-08-16',00105,'Si'),('maria','1982-05-12',00102,'No'),('Marsden','1985-09-11',00100,'Si'),('Marvin','1984-08-22',00101,'No'),('Maxwell','1980-12-15',00105,'Si'),('May','1978-12-04',00101,'No'),('Meghan','1975-05-21',00105,'Si'),('Melissa','1989-05-02',00105,'Si'),('Mercedes','1970-09-10',00103,'No'),('Minerva','1963-12-26',00104,'No'),('Moana','1975-07-28',00101,'Si'),('Molly','1996-02-27',00104,'Si'),('Mona','1964-04-30',00103,'Si'),('Nash','1997-06-18',00100,'Si'),('Noel','2000-09-05',00101,'Si'),('Nola','1987-12-21',00100,'No'),('Nolan','1971-05-26',00102,'No'),('Nyssa','1981-07-12',00101,'Si'),('Odessa','1963-01-16',00102,'No'),('Olga','1983-06-26',00104,'Si'),('oliver','2000-06-15',00101,'No'),('Ora','1992-09-02',00103,'No'),('Patience','1975-07-09',00100,'No'),('Paul','1975-07-28',00101,'Si'),('Perry','1983-01-29',00102,'Si'),('peter','1980-02-11',00100,'No'),('Piper','1988-04-25',00105,'Si'),('Portia','1981-04-26',00104,'Si'),('Preston','1984-06-11',00103,'No'),('Rahim','1980-06-07',00100,'Si'),('Rama','1975-12-19',00105,'No'),('Raven','1962-09-10',00105,'Si'),('Raya','1965-09-13',00101,'Si'),('Reagan','1984-02-27',00103,'No'),('Rigel','1990-12-10',00103,'Si'),('Rinah','2000-04-08',00100,'Si'),('Robert','1973-12-17',00103,'Si'),('Rose','1982-05-06',00105,'No'),('Ryan','1966-10-02',00101,'Si'),('Samantha','1978-04-29',00104,'Si'),('Savannah','1996-06-26',00101,'No'),('Selma','1974-03-15',00100,'No'),('Shelley','1960-06-27',00105,'Si'),('Skyler','1971-01-10',00105,'Si'),('Sopoline','1979-08-24',00104,'Si'),('Stacy','2000-01-16',00101,'Si'),('Summer','1984-06-19',00104,'No'),('Sybil','1961-02-12',00102,'No'),('Sydnee','1997-10-16',00101,'Si'),('Tamara','1990-11-24',00104,'No'),('Tana','1970-04-06',00101,'No'),('TaShya','1992-10-02',00104,'No'),('Tate','1974-04-12',00105,'Si'),('Tatum','1965-12-30',00105,'No'),('Tatyana','1969-12-31',00104,'No'),('Thaddeus','1988-05-03',00101,'Si'),('Troy','1965-06-13',00102,'Si'),('Tyler','1993-06-25',00102,'Si'),('Tyrone','1974-09-07',00103,'No'),('Ulysses','1977-01-03',00102,'No'),('Urielle','1982-10-09',00100,'No'),('Valentine','1999-06-29',00101,'Si'),('Veda','1970-04-28',00101,'Si'),('victor','1948-03-04',00101,'No'),('Virginia','1982-01-19',00104,'No'),('Vivian','1966-12-21',00101,'Si'),('Whilemina','1997-08-18',00103,'No'),('Willow','2001-10-15',00105,'Si'),('Xavier','1979-07-15',00103,'No'),('Yetta','1993-11-30',00104,'Si'),('Yvette','1978-09-08',00100,'Si');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-02 11:02:37
