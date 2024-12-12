
CREATE DATABASE IF NOT EXISTS `bdzoologico`;
USE `bdzoologico`;

CREATE TABLE IF NOT EXISTS `animal` (
  `codiAnim` char(10) NOT NULL,
  `paisAnim` varchar(25) NOT NULL,
  `contAnim` varchar(9) NOT NULL,
  `sexoAnim` varchar(6) NOT NULL,
  `anioNaciAnim` char(4) NOT NULL DEFAULT '',
  `codiZoo` char(5) NOT NULL,
  `nombCienEspe` varchar(50) NOT NULL,
  PRIMARY KEY (`codiAnim`),
  KEY `FK_animal_zoo` (`codiZoo`),
  KEY `FK_animal_especie` (`nombCienEspe`),
  CONSTRAINT `FK_animal_especie` FOREIGN KEY (`nombCienEspe`) REFERENCES `especie` (`nombCienEspe`),
  CONSTRAINT `FK_animal_zoo` FOREIGN KEY (`codiZoo`) REFERENCES `zoo` (`codiZoo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `especie` (
  `nombCienEspe` varchar(50) NOT NULL,
  `nombVulgEspe` varchar(50) NOT NULL,
  `famiEspe` varchar(45) NOT NULL,
  `peliExtiEspe` char(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`nombCienEspe`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




CREATE TABLE IF NOT EXISTS `zoo` (
  `codiZoo` char(5) NOT NULL DEFAULT '',
  `nombZoo` varchar(45) NOT NULL DEFAULT '',
  `ciudZoo` varchar(45) NOT NULL DEFAULT '',
  `tamaZoo` double(22,0) NOT NULL DEFAULT 0,
  `paisZoo` varchar(45) NOT NULL DEFAULT '0',
  `presZoo` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`codiZoo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


