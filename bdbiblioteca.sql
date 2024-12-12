CREATE DATABASE bdbiblioteca;

USE bdbiblioteca;

CREATE TABLE AUTOR
(
  codiAuto CHAR(5) NOT NULL,
  nombAuto VARCHAR(30) NOT NULL,
  PRIMARY KEY (codiAuto)
);

CREATE TABLE USUARIO
(
  numedocuUsua VARCHAR(13) NOT NULL,
  nombUsua VARCHAR(30) NOT NULL,
  direUsua VARCHAR(50) NOT NULL,
  teleUsua VARCHAR(13),
  PRIMARY KEY (numedocuUsua)
);

CREATE TABLE LIBRO
(
  codiLibr CHAR(5) NOT NULL,
  isbnLibr CHAR(13) NOT NULL,
  numepagiLibr INT NOT NULL,
  tituLibr VARCHAR(50) NOT NULL,
  editLibr VARCHAR(50) NOT NULL,
  PRIMARY KEY (isbnLibr)
);

CREATE TABLE ESCRIBE
(
  codiAuto CHAR(5) NOT NULL,
  isbnLibr CHAR(13) NOT NULL,
  PRIMARY KEY (codiAuto, isbnLibr),
  FOREIGN KEY (codiAuto) REFERENCES AUTOR(codiAuto),
  FOREIGN KEY (isbnLibr) REFERENCES LIBRO(isbnLibr)
);

CREATE TABLE EJEMPLAR
(
  codiEjem VARCHAR(5) NOT NULL,
  numeestaEjem VARCHAR(2) NOT NULL,
  numepasiEjem VARCHAR(2) NOT NULL,
  casiEjem VARCHAR(3) NOT NULL,
  isbnLibr CHAR(13) NOT NULL,
  PRIMARY KEY (codiEjem),
  FOREIGN KEY (isbnLibr) REFERENCES LIBRO(isbnLibr)
);

CREATE TABLE PRESTAMO
(
  numePres INT NOT NULL,
  fechPres DATE NOT NULL,
  fechvencPres DATE NOT NULL,
  fechdevoPrest DATE NOT NULL,
  numedocuUsua VARCHAR(13) NOT NULL,
  codiEjem VARCHAR(5) NOT NULL,
  PRIMARY KEY (numePres, numedocuUsua, codiEjem),
  FOREIGN KEY (numedocuUsua) REFERENCES USUARIO(numedocuUsua),
  FOREIGN KEY (codiEjem) REFERENCES EJEMPLAR(codiEjem)
);
