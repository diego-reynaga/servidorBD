
CREATE DATABASE IF NOT EXISTS `tienda`;
USE `tienda`;


CREATE TABLE IF NOT EXISTS `categoriaproducto` (
  `idCateProd` int(11) NOT NULL,
  `nombCateProd` varchar(45) NOT NULL,
  `descCateProd` varchar(45) NOT NULL,
  PRIMARY KEY (`idCateProd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


CREATE TABLE IF NOT EXISTS `cliente` (
  `idClie` int(11) NOT NULL,
  `nombClie` varchar(45) NOT NULL,
  `direClie` varchar(50) NOT NULL,
  PRIMARY KEY (`idClie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


CREATE TABLE IF NOT EXISTS `detalleventa` (
  `idDetaVent` int(11) NOT NULL,
  `precDetaVent` float NOT NULL,
  `cantDetaVent` int(11) NOT NULL,
  `idVent` int(11) NOT NULL,
  `idProd` int(11) NOT NULL,
  PRIMARY KEY (`idDetaVent`),
  KEY `idVent` (`idVent`),
  KEY `idProd` (`idProd`),
  CONSTRAINT `detalleventa_ibfk_1` FOREIGN KEY (`idVent`) REFERENCES `venta` (`idVent`),
  CONSTRAINT `detalleventa_ibfk_2` FOREIGN KEY (`idProd`) REFERENCES `producto` (`idProd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


CREATE TABLE IF NOT EXISTS `producto` (
  `idProd` int(11) NOT NULL,
  `nombProd` varchar(45) NOT NULL,
  `precProd` float NOT NULL,
  `stokProd` int(11) NOT NULL,
  `idCateProd` int(11) NOT NULL,
  `dniProv` int(11) NOT NULL,
  PRIMARY KEY (`idProd`),
  KEY `idCateProd` (`idCateProd`),
  KEY `dniProv` (`dniProv`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idCateProd`) REFERENCES `categoriaproducto` (`idCateProd`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`dniProv`) REFERENCES `proveedor` (`dniProv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


CREATE TABLE IF NOT EXISTS `proveedor` (
  `dniProv` int(11) NOT NULL,
  `nombProv` varchar(45) NOT NULL,
  `teleProv` decimal(12,0) DEFAULT NULL,
  PRIMARY KEY (`dniProv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;


CREATE TABLE IF NOT EXISTS `venta` (
  `idVent` int(11) NOT NULL,
  `fechVent` date NOT NULL,
  `descVent` float NOT NULL,
  `idClie` int(11) NOT NULL,
  PRIMARY KEY (`idVent`),
  KEY `idClie` (`idClie`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`idClie`) REFERENCES `cliente` (`idClie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
