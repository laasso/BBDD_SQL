CREATE TABLE `transcrip` (
  `idadn` char(1) NOT NULL,
  `idarn` char(1) DEFAULT NULL,
  PRIMARY KEY (`idadn`),
  KEY `idarn` (`idarn`),
  CONSTRAINT `transcrip_ibfk_1` FOREIGN KEY (`idadn`) REFERENCES `nucleotid` (`idnucli`),
  CONSTRAINT `transcrip_ibfk_2` FOREIGN KEY (`idarn`) REFERENCES `nucleotid` (`idnucli`)
) ENGINE=InnoDB;

