/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
/* mysqldump -u root -p -v --skip-extended-insert --skip-comments --skip-add-locks --skip-disable-keys --skip-opt --skip-triggers vk22 > sql/backup_vendesK22-create-insert.sql */

CREATE TABLE `clients` (
  `num_clie` int NOT NULL AUTO_INCREMENT COMMENT 'Codi de client i clau primària',
  `societat` varchar(20) NOT NULL COMMENT 'Nom del client o empresa',
  `ven_clie` int DEFAULT NULL COMMENT 'Codi del venedor assignat al client',
  `credit` int DEFAULT NULL COMMENT 'Límit de credit que té el client',
  `pais` int DEFAULT NULL COMMENT 'País origen del client o societat',
  `idioma` enum('Alemany','Castella','Catala','Angles','Italia','Frances','Rus') DEFAULT 'Angles' COMMENT 'Idioma principal que utilitza el client',
  PRIMARY KEY (`num_clie`),
  KEY `ven_clie` (`ven_clie`),
  KEY `pais` (`pais`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`ven_clie`) REFERENCES `venedors` (`num_ven`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `clients_ibfk_2` FOREIGN KEY (`pais`) REFERENCES `pais` (`num_pais`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2125 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `clients` VALUES (2101,'Jones Mfg',106,65000,3,'Angles');
INSERT INTO `clients` VALUES (2102,'First Corp',101,65000,3,'Angles');
INSERT INTO `clients` VALUES (2103,'Acme Mfg',105,50000,1,'Angles');
INSERT INTO `clients` VALUES (2105,'AAA Investments',101,45000,2,'Catala');
INSERT INTO `clients` VALUES (2106,'Fred Lewis Corp.',102,65000,5,'Frances');
INSERT INTO `clients` VALUES (2107,'Ace International',110,35000,2,'Castella');
INSERT INTO `clients` VALUES (2108,'Holm & Landis',109,55000,6,'Catala');
INSERT INTO `clients` VALUES (2109,'Chen Associates',107,25000,1,'Alemany');
INSERT INTO `clients` VALUES (2110,'Pfizer-Biontech',105,150400,8,'Angles');
INSERT INTO `clients` VALUES (2111,'JCP Inc',103,50000,6,'Alemany');
INSERT INTO `clients` VALUES (2112,'Zetacorp',108,50000,4,'Italia');
INSERT INTO `clients` VALUES (2113,'Ian & Schmidt',104,20000,3,'Angles');
INSERT INTO `clients` VALUES (2114,'Orion Corp',102,20000,4,'Italia');
INSERT INTO `clients` VALUES (2115,'Smithson Corp',101,20000,4,'Italia');
INSERT INTO `clients` VALUES (2117,'J.P. Sinclair',106,35000,1,'Angles');
INSERT INTO `clients` VALUES (2118,'Midwest Systems',108,60000,2,'Castella');
INSERT INTO `clients` VALUES (2119,'Solomon Inc',109,25000,5,'Frances');
INSERT INTO `clients` VALUES (2120,'Rico Enterprises',102,50000,6,'Angles');
INSERT INTO `clients` VALUES (2121,'QMA Assoc',103,45000,3,'Angles');
INSERT INTO `clients` VALUES (2122,'Three-Way Lines',105,30000,6,'Frances');
INSERT INTO `clients` VALUES (2123,'Carter & Sons',102,40000,7,'Rus');
INSERT INTO `clients` VALUES (2124,'Peter Brothers',107,40000,4,'Angles');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comandes` (
  `num_comanda` int NOT NULL AUTO_INCREMENT COMMENT 'Codi de la comanda i clau primària',
  `descripcio` varchar(60) DEFAULT 'Comanda articles diversos...' COMMENT 'Descripció general de la comanda - Opcional',
  `data_comanda` date NOT NULL COMMENT 'Data en que es crea la comanda, NO pot ser NULL',
  `clie` int NOT NULL COMMENT 'Codi del client de la comanda - Clau forana de clients - No permet NULL',
  `ven` int DEFAULT NULL COMMENT 'Codi del venedor que ha fet la venda - clau forana de venedors',
  `iva` int unsigned NOT NULL DEFAULT '21' COMMENT 'Valor percentual aplicable com impost de venda - No permet NULL',
  `dte` int DEFAULT '0' COMMENT 'Valor percentual de descompte de la comanda - En cas de NULL valor es 0',
  PRIMARY KEY (`num_comanda`),
  KEY `clie` (`clie`),
  KEY `ven` (`ven`),
  CONSTRAINT `comandes_ibfk_1` FOREIGN KEY (`clie`) REFERENCES `clients` (`num_clie`) ON UPDATE CASCADE,
  CONSTRAINT `comandes_ibfk_2` FOREIGN KEY (`ven`) REFERENCES `venedors` (`num_ven`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=113100 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `comandes` VALUES (112885,'Autoservei','1989-06-15',2102,101,16,0);
INSERT INTO `comandes` VALUES (112950,'Autoservei','1995-11-21',2107,110,16,0);
INSERT INTO `comandes` VALUES (112963,'Comanda client VIP','1995-12-17',2103,105,21,0);
INSERT INTO `comandes` VALUES (112968,'Comanda client VIP','1989-12-10',2102,101,21,0);
INSERT INTO `comandes` VALUES (112975,'Comanda client VIP','1989-10-12',2111,103,21,0);
INSERT INTO `comandes` VALUES (112979,'Comanda client VIP','1989-12-10',2114,102,21,0);
INSERT INTO `comandes` VALUES (112983,'Comanda client VIP','1995-12-27',2103,105,21,0);
INSERT INTO `comandes` VALUES (112987,'Comanda articles diversos...','1995-12-31',2103,105,21,5);
INSERT INTO `comandes` VALUES (112989,'Comanda articles diversos...','1990-01-03',2101,106,21,5);
INSERT INTO `comandes` VALUES (112992,'Comanda articles diversos...','1995-11-04',2118,108,21,10);
INSERT INTO `comandes` VALUES (112993,'Comanda articles diversos...','1989-01-04',2106,102,21,10);
INSERT INTO `comandes` VALUES (112997,'Comanda articles diversos...','2001-08-01',2124,107,21,0);
INSERT INTO `comandes` VALUES (113003,'Comanda articles diversos...','2001-01-25',2108,109,21,0);
INSERT INTO `comandes` VALUES (113007,'Comanda articles diversos...','1990-08-01',2112,108,21,0);
INSERT INTO `comandes` VALUES (113012,'Comanda articles diversos...','1996-11-01',2111,105,21,0);
INSERT INTO `comandes` VALUES (113013,'Comanda articles diversos...','1990-01-14',2118,108,21,0);
INSERT INTO `comandes` VALUES (113024,'Comanda articles diversos...','1990-01-20',2114,108,21,0);
INSERT INTO `comandes` VALUES (113027,'Comanda articles diversos...','1996-01-22',2103,105,21,0);
INSERT INTO `comandes` VALUES (113034,'Comanda web','1990-01-29',2107,110,21,0);
INSERT INTO `comandes` VALUES (113042,'Comanda web','1990-02-02',2113,101,21,0);
INSERT INTO `comandes` VALUES (113045,'Comanda web','1990-02-02',2112,108,21,0);
INSERT INTO `comandes` VALUES (113048,'Comanda web','1990-02-10',2120,102,21,0);
INSERT INTO `comandes` VALUES (113049,'Comanda web','1990-10-02',2118,108,21,0);
INSERT INTO `comandes` VALUES (113051,'Comanda web','1990-10-02',2118,108,21,25);
INSERT INTO `comandes` VALUES (113055,'Comanda web','1990-02-15',2108,101,21,25);
INSERT INTO `comandes` VALUES (113057,'Comanda articles diversos...','1990-02-18',2111,103,21,15);
INSERT INTO `comandes` VALUES (113058,'Comanda articles diversos...','1990-02-23',2108,109,21,15);
INSERT INTO `comandes` VALUES (113062,'Comanda articles diversos...','1990-02-24',2124,107,21,5);
INSERT INTO `comandes` VALUES (113065,'Comanda articles diversos...','1990-02-27',2106,102,21,3);
INSERT INTO `comandes` VALUES (113069,'Comanda articles diversos...','2001-02-03',2109,107,21,3);
INSERT INTO `comandes` VALUES (113070,'Comanda extra','2020-10-10',2110,105,21,25);
INSERT INTO `comandes` VALUES (113071,'Comanda client VIP','2020-10-27',2111,105,21,5);
INSERT INTO `comandes` VALUES (113072,'Comanda client VIP','2020-10-27',2102,101,21,0);
INSERT INTO `comandes` VALUES (113073,'Comanda client VIP','2020-10-27',2111,103,21,0);
INSERT INTO `comandes` VALUES (113074,'Comanda client VIP','2020-10-27',2114,102,21,0);
INSERT INTO `comandes` VALUES (113075,'Comanda client VIP','2020-10-27',2103,105,21,10);
INSERT INTO `comandes` VALUES (113076,'Comanda articles diversos...','2020-10-27',2103,105,21,5);
INSERT INTO `comandes` VALUES (113077,'Comanda articles diversos...','2020-10-27',2101,106,21,5);
INSERT INTO `comandes` VALUES (113078,'Comanda articles diversos...','2020-10-28',2118,108,21,10);
INSERT INTO `comandes` VALUES (113079,'Comanda articles diversos...','2020-10-28',2106,102,21,10);
INSERT INTO `comandes` VALUES (113080,'Comanda articles diversos...','2020-10-29',2124,107,21,21);
INSERT INTO `comandes` VALUES (113081,'Comanda articles diversos...','2020-10-29',2108,109,21,21);
INSERT INTO `comandes` VALUES (113082,'Comanda articles diversos...','2020-10-29',2112,108,21,21);
INSERT INTO `comandes` VALUES (113083,'Comanda articles diversos...','2020-10-30',2111,105,21,21);
INSERT INTO `comandes` VALUES (113084,'Comanda articles diversos...','2020-11-03',2118,108,21,3);
INSERT INTO `comandes` VALUES (113085,'Comanda articles diversos...','2020-11-05',2114,108,21,3);
INSERT INTO `comandes` VALUES (113086,'Comanda articles diversos...','2020-11-09',2103,105,21,10);
INSERT INTO `comandes` VALUES (113087,'Comanda web','2020-11-25',2107,110,21,10);
INSERT INTO `comandes` VALUES (113088,'Comanda web','2020-11-28',2113,101,21,10);
INSERT INTO `comandes` VALUES (113089,'Comanda web','2020-12-04',2112,108,21,0);
INSERT INTO `comandes` VALUES (113090,'Comanda web','2020-12-15',2120,102,21,0);
INSERT INTO `comandes` VALUES (113091,'Comanda web','2020-12-27',2118,108,21,0);
INSERT INTO `comandes` VALUES (113092,'Comanda web','2020-12-31',2118,108,21,25);
INSERT INTO `comandes` VALUES (113093,'Comanda web','2020-12-31',2108,101,21,25);
INSERT INTO `comandes` VALUES (113094,'Comanda articles diversos...','2020-12-31',2103,105,21,15);
INSERT INTO `comandes` VALUES (113095,'Comanda articles diversos...','2021-01-05',2101,106,21,15);
INSERT INTO `comandes` VALUES (113096,'Comanda articles diversos...','2021-01-08',2124,107,21,5);
INSERT INTO `comandes` VALUES (113097,'Comanda articles diversos...','2021-01-11',2106,102,21,40);
INSERT INTO `comandes` VALUES (113098,'Comanda articles diversos...','2021-01-18',2109,107,21,3);
INSERT INTO `comandes` VALUES (113099,'Comanda articles diversos...','2021-01-20',2102,101,21,3);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detall` (
  `num_comanda` int NOT NULL,
  `fab` char(3) NOT NULL DEFAULT '',
  `producte` char(5) NOT NULL DEFAULT '',
  `quantitat` int unsigned NOT NULL,
  `preu` decimal(8,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`num_comanda`,`fab`,`producte`),
  KEY `fab` (`fab`,`producte`),
  CONSTRAINT `detall_ibfk_1` FOREIGN KEY (`num_comanda`) REFERENCES `comandes` (`num_comanda`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detall_ibfk_2` FOREIGN KEY (`fab`, `producte`) REFERENCES `productes` (`id_fab`, `id_producte`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `detall` VALUES (112885,'imm','887p',2,375.00);
INSERT INTO `detall` VALUES (112950,'foo','112',5,148.00);
INSERT INTO `detall` VALUES (112963,'aci','41004',28,117.00);
INSERT INTO `detall` VALUES (112968,'aci','41004',34,117.00);
INSERT INTO `detall` VALUES (112975,'aci','4100x',5,25.00);
INSERT INTO `detall` VALUES (112975,'foo','114',10,243.00);
INSERT INTO `detall` VALUES (112975,'rei','2a44g',6,350.00);
INSERT INTO `detall` VALUES (112979,'aci','4100z',6,2500.00);
INSERT INTO `detall` VALUES (112983,'aci','41004',6,117.00);
INSERT INTO `detall` VALUES (112987,'aci','4100y',11,2750.00);
INSERT INTO `detall` VALUES (112989,'foo','114',6,243.00);
INSERT INTO `detall` VALUES (112992,'aci','41002',10,76.00);
INSERT INTO `detall` VALUES (112993,'rei','2a45c',24,79.00);
INSERT INTO `detall` VALUES (112997,'bic','41003',1,652.00);
INSERT INTO `detall` VALUES (113003,'imm','779c',3,1875.00);
INSERT INTO `detall` VALUES (113007,'imm','773c',3,975.00);
INSERT INTO `detall` VALUES (113012,'aci','41003',35,107.00);
INSERT INTO `detall` VALUES (113013,'bic','41003',1,652.00);
INSERT INTO `detall` VALUES (113024,'qsa','xk47',20,355.00);
INSERT INTO `detall` VALUES (113027,'aci','41002',54,76.00);
INSERT INTO `detall` VALUES (113034,'rei','2a45c',8,79.00);
INSERT INTO `detall` VALUES (113042,'aci','41001',5,55.00);
INSERT INTO `detall` VALUES (113042,'rei','2a44r',5,4500.00);
INSERT INTO `detall` VALUES (113045,'rei','2a44r',10,4500.00);
INSERT INTO `detall` VALUES (113045,'rei','2a45c',30,79.00);
INSERT INTO `detall` VALUES (113048,'imm','779c',2,1875.00);
INSERT INTO `detall` VALUES (113049,'qsa','xk47',2,355.00);
INSERT INTO `detall` VALUES (113051,'qsa','xk47',4,355.00);
INSERT INTO `detall` VALUES (113055,'aci','4100x',6,25.00);
INSERT INTO `detall` VALUES (113055,'bic','41003',1,652.00);
INSERT INTO `detall` VALUES (113055,'rei','2a45c',10,79.00);
INSERT INTO `detall` VALUES (113057,'aci','4100x',24,25.00);
INSERT INTO `detall` VALUES (113058,'foo','112',10,148.00);
INSERT INTO `detall` VALUES (113062,'foo','114',10,243.00);
INSERT INTO `detall` VALUES (113065,'qsa','xk47',6,355.00);
INSERT INTO `detall` VALUES (113069,'imm','775c',22,1425.00);
INSERT INTO `detall` VALUES (113069,'imm','887p',4,375.00);
INSERT INTO `detall` VALUES (113070,'aci','41001',5,82.50);
INSERT INTO `detall` VALUES (113070,'bio','110',5,55.00);
INSERT INTO `detall` VALUES (113070,'bio','41001',15,20.00);
INSERT INTO `detall` VALUES (113070,'bio','41002',25,15.00);
INSERT INTO `detall` VALUES (113071,'bio','110',12,55.00);
INSERT INTO `detall` VALUES (113072,'bio','112',8,85.00);
INSERT INTO `detall` VALUES (113073,'bio','113',3,64.00);
INSERT INTO `detall` VALUES (113073,'bio','114',2,36.00);
INSERT INTO `detall` VALUES (113074,'bio','111',4,95.00);
INSERT INTO `detall` VALUES (113074,'bio','113',10,64.00);
INSERT INTO `detall` VALUES (113075,'bio','111',50,95.00);
INSERT INTO `detall` VALUES (113075,'bio','112',40,85.00);
INSERT INTO `detall` VALUES (113076,'bio','41003',16,40.00);
INSERT INTO `detall` VALUES (113077,'bio','111',10,142.50);
INSERT INTO `detall` VALUES (113077,'bio','41002',8,15.00);
INSERT INTO `detall` VALUES (113078,'bio','110',18,55.00);
INSERT INTO `detall` VALUES (113079,'aci','41003',10,107.00);
INSERT INTO `detall` VALUES (113079,'bio','41003',3,40.00);
INSERT INTO `detall` VALUES (113080,'foo','112',10,148.00);
INSERT INTO `detall` VALUES (113081,'aci','41003',10,107.00);
INSERT INTO `detall` VALUES (113081,'bio','41003',8,60.00);
INSERT INTO `detall` VALUES (113082,'aci','41004',80,117.00);
INSERT INTO `detall` VALUES (113083,'aci','4100x',6,25.00);
INSERT INTO `detall` VALUES (113084,'imm','887p',14,250.00);
INSERT INTO `detall` VALUES (113085,'imm','887h',9,54.00);
INSERT INTO `detall` VALUES (113086,'imm','775c',3,1425.00);
INSERT INTO `detall` VALUES (113086,'imm','887h',5,54.00);
INSERT INTO `detall` VALUES (113087,'bio','112',9,127.50);
INSERT INTO `detall` VALUES (113087,'imm','773c',9,975.00);
INSERT INTO `detall` VALUES (113087,'imm','887h',15,81.00);
INSERT INTO `detall` VALUES (113088,'imm','773c',7,975.00);
INSERT INTO `detall` VALUES (113089,'imm','887x',21,475.00);
INSERT INTO `detall` VALUES (113089,'qsa','xk47',30,355.00);
INSERT INTO `detall` VALUES (113090,'qsa','xk48',42,134.00);
INSERT INTO `detall` VALUES (113090,'rei','2a44r',14,6750.00);
INSERT INTO `detall` VALUES (113091,'qsa','xk48',32,134.00);
INSERT INTO `detall` VALUES (113091,'rei','2a45c',5,118.50);
INSERT INTO `detall` VALUES (113092,'qsa','xk48',12,134.00);
INSERT INTO `detall` VALUES (113092,'qsa','xk48a',12,117.00);
INSERT INTO `detall` VALUES (113093,'rei','2a44l',8,4500.00);
INSERT INTO `detall` VALUES (113093,'rei','2a45c',10,118.50);
INSERT INTO `detall` VALUES (113094,'rei','2a44r',3,4500.00);
INSERT INTO `detall` VALUES (113095,'rei','2a44l',2,4500.00);
INSERT INTO `detall` VALUES (113095,'rei','2a45c',15,79.00);
INSERT INTO `detall` VALUES (113096,'foo','112',18,148.00);
INSERT INTO `detall` VALUES (113096,'foo','114',3,243.00);
INSERT INTO `detall` VALUES (113097,'imm','887h',20,54.00);
INSERT INTO `detall` VALUES (113097,'imm','887p',12,375.00);
INSERT INTO `detall` VALUES (113098,'imm','887p',4,250.00);
INSERT INTO `detall` VALUES (113099,'bio','111',3,95.00);
INSERT INTO `detall` VALUES (113099,'bio','112',6,85.00);
INSERT INTO `detall` VALUES (113099,'bio','114',2,36.00);
INSERT INTO `detall` VALUES (113099,'bio','41001',4,20.00);
INSERT INTO `detall` VALUES (113099,'bio','41002',3,15.00);
INSERT INTO `detall` VALUES (113099,'bio','41003',7,40.00);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oficines` (
  `oficina` int NOT NULL,
  `ciutat` varchar(15) NOT NULL,
  `regio` varchar(10) NOT NULL,
  `dir` int DEFAULT NULL,
  `objectiu` int DEFAULT NULL,
  `vendes` int NOT NULL,
  PRIMARY KEY (`oficina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `oficines` VALUES (11,'New York','Est',106,575000,692637);
INSERT INTO `oficines` VALUES (12,'Chicago','Est',104,800000,735042);
INSERT INTO `oficines` VALUES (13,'Atlanta','Est',105,350000,367911);
INSERT INTO `oficines` VALUES (21,'Los Angeles','Oest',108,725000,835915);
INSERT INTO `oficines` VALUES (22,'Denver','Oest',108,300000,186042);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `num_pais` int NOT NULL AUTO_INCREMENT,
  `nompais` varchar(25) NOT NULL,
  PRIMARY KEY (`num_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `pais` VALUES (1,'Alemanyya');
INSERT INTO `pais` VALUES (2,'Espanya');
INSERT INTO `pais` VALUES (3,'Regne Unit');
INSERT INTO `pais` VALUES (4,'Italia');
INSERT INTO `pais` VALUES (5,'França');
INSERT INTO `pais` VALUES (6,'Luxemburg');
INSERT INTO `pais` VALUES (7,'Rusia');
INSERT INTO `pais` VALUES (8,'EEUU');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fabricants` (
  `id_fab` char(3) NOT NULL,
  `nomfab` varchar(24) NOT NULL, -- Es podria incloure categoria de producte principal 'roba','eines', 'tecnologia', etc.. i adreça
  `nomcontacte` varchar(20) NOT NULL,
  `telefon` char(9) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `datareg` date DEFAULT NULL COMMENT 'Data alta fabricant',
  PRIMARY KEY (`id_fab`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `fabricants` VALUES ('aci','Agency Composite International','Henry','611442663','vendes@aci.com',19880117);
INSERT INTO `fabricants` VALUES ('bic','BIC world','David','688253615','info@bic.com',19900112);
INSERT INTO `fabricants` VALUES ('bio','Biological Industries Online','William','644992676','vendes@bio.net',20200325);
INSERT INTO `fabricants` VALUES ('foo','Foobar company','Kilian','616152411','vendes@foo.net',19880430);
INSERT INTO `fabricants` VALUES ('imm','Immersion MultiMedia','Gerard','687099834','info@imm.cat',19890414);
INSERT INTO `fabricants` VALUES ('inc','Include this','Sergi','640415212','vendes@inc.net',19990612);
INSERT INTO `fabricants` VALUES ('qsa','Quit Sanity','Stuart','630200990','vendes@qsa.com',19890901);
INSERT INTO `fabricants` VALUES ('rei','Recovery End Input','Katy','606718903','info@rei.net',19880310);

SELECT 'fabricants table' AS 'OK';

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productes` (
  `id_fab` char(3) NOT NULL,
  `id_producte` char(5) NOT NULL,
  `descripcio` varchar(20) NOT NULL,
  `preu` decimal(8,2) unsigned DEFAULT NULL,
  `stock` int unsigned NOT NULL,
  `datamod` date DEFAULT NULL,
  `imatge` varchar(60) DEFAULT 'noimatge.png',
  PRIMARY KEY (`id_fab`,`id_producte`),
  CONSTRAINT `productes_ibfk_1` FOREIGN KEY (`id_fab`) REFERENCES `fabricants` (`id_fab`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `productes` VALUES ('aci','41001','Articulo Tipo 1',82.50,808,'2021-01-08','noimatge.png');
INSERT INTO `productes` VALUES ('aci','41002','Articulo Tipo 2',114.00,498,'2021-01-08','noimatge.png');
INSERT INTO `productes` VALUES ('aci','41003','Articulo Tipo 3',160.50,540,'2021-01-08','noimatge.png');
INSERT INTO `productes` VALUES ('aci','41004','Articulo Tipo 4',175.50,168,'2021-01-08','noimatge.png');
INSERT INTO `productes` VALUES ('aci','4100x','Ajustador',37.50,69,'2021-01-08','noimatge.png');
INSERT INTO `productes` VALUES ('aci','4100y','Desmontador',412.50,72,'2021-01-08','noimatge.png');
INSERT INTO `productes` VALUES ('aci','4100z','Montador',1800.00,84,'2021-01-08','noimatge.png');
INSERT INTO `productes` VALUES ('bic','41003','Tirador',978.00,36,'2021-01-08','tirador.png');
INSERT INTO `productes` VALUES ('bic','41089','Reten',337.50,234,'2021-01-08','noimatge.png');
INSERT INTO `productes` VALUES ('bic','41672','Placa',270.00,0,'2021-01-08','noimatge.png');
INSERT INTO `productes` VALUES ('bio','110','Pipeta serologica',82.50,2295,'2021-01-25','pipsero.png');
INSERT INTO `productes` VALUES ('bio','111','Pipeta de Shali',142.50,419,'2021-01-25','pipShali.png');
INSERT INTO `productes` VALUES ('bio','112','Pipeta 3 vias',127.50,729,'2021-01-25','pip3vias.png');
INSERT INTO `productes` VALUES ('bio','113','Pipeta de Thomas',96.00,2661,'2021-01-25','pipThomas.png');
INSERT INTO `productes` VALUES ('bio','114','Mechero Bunsen',54.00,360,'2021-01-25','bunKemper.png');
INSERT INTO `productes` VALUES ('bio','41001','Tubo ensayo c/250',30.00,1173,'2021-01-25','tubensc250.png');
INSERT INTO `productes` VALUES ('bio','41002','Tubo ensayo c/150',22.50,852,'2021-01-25','tubensc150.png');
INSERT INTO `productes` VALUES ('bio','41003','Pipeta Pasteur',60.00,1714,'2021-01-25','pippast.png');
INSERT INTO `productes` VALUES ('foo','112','Cubierta',148.00,256,'2020-01-01','noimatge.png');
INSERT INTO `productes` VALUES ('foo','114','Bancada Motor',390.00,435,'2021-01-08','noimatge.png');
INSERT INTO `productes` VALUES ('imm','773c','Abrazadera 300-lb',1462.50,36,'2021-01-08','noimatge.png');
INSERT INTO `productes` VALUES ('imm','775c','Abrazadera 500-lb',2137.50,6,'2021-01-08','noimatge.png');
INSERT INTO `productes` VALUES ('imm','779c','Abrazadera 900-lb',2812.50,27,'2021-01-08','noimatge.png');
INSERT INTO `productes` VALUES ('imm','887h','Soporte Abrazadera',81.00,552,'2021-01-08','noimatge.png');
INSERT INTO `productes` VALUES ('imm','887p','Perno Abrazadera',375.00,0,'2021-01-08','perno.png');
INSERT INTO `productes` VALUES ('imm','887x','Reten Abrazadera',712.50,33,'2021-01-08','noimatge.png');
INSERT INTO `productes` VALUES ('inc','kd55g','TV interactiva',4500.00,24,'2000-02-10','kd55ag9.png');
INSERT INTO `productes` VALUES ('inc','kd55x','TV interactiva',4900.00,18,'2000-02-10','kd55xt3.png');
INSERT INTO `productes` VALUES ('inc','kd65x','TV interactiva',6900.00,12,'2000-02-10','kd65xt3.png');
INSERT INTO `productes` VALUES ('inc','kd65z','TV hologràfica',9900.00,7,'2000-02-10','kd65znh.png');
INSERT INTO `productes` VALUES ('inc','kd90z','TV hologràfica',20990.00,5,'2000-02-10','kd90znh.png');
INSERT INTO `productes` VALUES ('qsa','xk47','Reductor',532.50,24,'2021-01-08','noimatge.png');
INSERT INTO `productes` VALUES ('qsa','xk48','Reductor',201.00,351,'2021-01-08','noimatge.png');
INSERT INTO `productes` VALUES ('qsa','xk48a','Reductor',175.50,75,'2021-01-08','noimatge.png');
INSERT INTO `productes` VALUES ('rei','2a44g','Pasador Bisagra',525.00,42,'2021-01-08','pasador.png');
INSERT INTO `productes` VALUES ('rei','2a44l','Bisagra Izqda.',675.00,6,'2021-01-08','bisagra.png');
INSERT INTO `productes` VALUES ('rei','2a44r','Bisagra Dcha.',675.00,13,'2021-01-08','bisagra.png');
INSERT INTO `productes` VALUES ('rei','2a45c','Union  Trinquete',118.50,450,'2021-01-08','noimatge.png');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venedors` (
  `num_ven` int NOT NULL,
  `nom` varchar(15) NOT NULL,
  `any_naix` int DEFAULT NULL,
  `oficina_ven` int DEFAULT NULL,
  `titol` varchar(10) DEFAULT NULL,
  `contracte` date NOT NULL,
  `director` int DEFAULT NULL,
  `quota` int DEFAULT NULL,
  `vendes` int NOT NULL,
  PRIMARY KEY (`num_ven`),
  KEY `oficina_ven` (`oficina_ven`),
  CONSTRAINT `venedors_ibfk_1` FOREIGN KEY (`oficina_ven`) REFERENCES `oficines` (`oficina`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `venedors` VALUES (101,'Dan Roberts',1945,12,'Venedor','1986-10-20',104,300000,354637);
INSERT INTO `venedors` VALUES (102,'Sue Smith',1948,21,'Venedor','1986-12-10',108,350000,581968);
INSERT INTO `venedors` VALUES (103,'Paul Cruz',1968,12,'Venedor','1987-03-01',104,275000,289594);
INSERT INTO `venedors` VALUES (104,'Bob Smith',1960,12,'Director','1987-05-19',106,200000,142594);
INSERT INTO `venedors` VALUES (105,'Bill Adams',1965,13,'Venedor','1995-02-12',104,350000,396919);
INSERT INTO `venedors` VALUES (106,'Sam Clark',1952,11,'Gerent','1988-06-14',NULL,275000,311697);
INSERT INTO `venedors` VALUES (107,'Nancy Angelli',1975,22,'Venedor','2000-11-14',108,300000,193415);
INSERT INTO `venedors` VALUES (108,'Larry Fitch',1962,21,'Director','1989-12-10',106,350000,407089);
INSERT INTO `venedors` VALUES (109,'Mary Jones',1980,11,'Venedor','2000-10-12',106,300000,394275);
INSERT INTO `venedors` VALUES (110,'Tom Snyder',1970,NULL,'Venedor','1990-01-13',101,NULL,91329);
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

