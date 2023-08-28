-- Schemi delle varie tabelle
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
DROP DATABASE if exists SmartHome;
SET NAMES latin1;
BEGIN;
CREATE DATABASE `SmartHome`;
COMMIT;
USE `SmartHome`;
Drop Table if exists `Stanza`;
CREATE TABLE `Stanza` (
  `Codice_stanza` int NOT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `Larghezza` int DEFAULT NULL,
  `Lunghezza` int DEFAULT NULL,
  `Altezza` int DEFAULT NULL,
  `luci_accese` int default 0,
  PRIMARY KEY (`Codice_stanza`)
);

Drop table if exists `Utente`;
CREATE TABLE `Utente` (
  `Codice_fiscale` varchar(8) NOT NULL,
  `Nome` varchar(20) DEFAULT NULL,
  `Cognome` varchar(20) DEFAULT NULL,
  `Data_nascita` varchar(20) DEFAULT NULL,
  `Numero_telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Codice_fiscale`)
);

Drop Table if exists Account;
CREATE TABLE `Account` (
  `Username` varchar(20) NOT NULL Primary Key,
  `Codice_fiscale` varchar(8) DEFAULT NULL,
  `Domanda_sicurezza` varchar(200) DEFAULT NULL,
  `Risposta_sicurezza` varchar(200) DEFAULT NULL,
  `Data_registrazione` date DEFAULT NULL,
  `Password` varchar(30), 
  FOREIGN KEY (`Codice_fiscale`) REFERENCES `Utente` (`Codice_fiscale`)
);


Drop table if exists `ElementoIlluminazione`;
CREATE TABLE `ElementoIlluminazione` (
  `Codice_elemento` varchar(6) NOT NULL,
  `Nome` varchar(30) DEFAULT NULL,
  `Intensita` int DEFAULT NULL,
  `Colore` varchar(30) DEFAULT NULL,
  `Codice_stanza` int DEFAULT NULL,
  luci_accese int default 0,
  PRIMARY KEY (`Codice_elemento`),
  FOREIGN KEY (`Codice_stanza`) REFERENCES `Stanza` (`Codice_stanza`)
);


Drop table if exists `SmartPlug`;
CREATE TABLE `SmartPlug` (
  `Codice_smart_plug` varchar(6) NOT NULL,
  `Stato` tinyint(1) DEFAULT NULL,
  `Codice_stanza` int DEFAULT NULL,
  PRIMARY KEY (`Codice_smart_plug`),
  FOREIGN KEY (`Codice_stanza`) REFERENCES `Stanza` (`Codice_stanza`)
);

Drop Table if exists `Dispositivo`;
CREATE TABLE `Dispositivo` (
  `Codice_dispositivo` varchar(8) NOT NULL,
  `Nome` varchar(40) DEFAULT NULL,
  `Codice_smart_plug` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`Codice_dispositivo`),
  FOREIGN KEY (`Codice_smart_plug`) REFERENCES `SmartPlug` (`Codice_smart_plug`)
);

Drop Table if exists `ConsumoFisso`;
CREATE TABLE `ConsumoFisso` (
  `Codice_dispositivo` varchar(8) NOT NULL,
  `Potenza` int DEFAULT NULL,
  PRIMARY KEY (`Codice_dispositivo`),
  FOREIGN KEY (`Codice_dispositivo`) REFERENCES `Dispositivo` (`Codice_dispositivo`)
);

Drop Table if exists `Regolazione`;
CREATE TABLE `Regolazione` (
  `Codice_regolazione` int NOT NULL,
  `Livello` int DEFAULT NULL,
  PRIMARY KEY (`Codice_regolazione`)
);

Drop Table if exists `ConsumoVariabile`;
CREATE TABLE `ConsumoVariabile` (
  `Codice_dispositivo` varchar(8) NOT NULL,
  `Consumo` int DEFAULT NULL,
  `Durata` int DEFAULT NULL,
  `Codice_regolazione` int DEFAULT NULL,
  PRIMARY KEY (`Codice_dispositivo`),
  FOREIGN KEY (`Codice_dispositivo`) REFERENCES `Dispositivo` (`Codice_dispositivo`),
  FOREIGN KEY (`Codice_regolazione`) REFERENCES `Regolazione` (`Codice_regolazione`)
);

Drop Table if exists `Documento`;
CREATE TABLE `Documento` (
  `Numero_documento` varchar(8) NOT NULL,
  `Scadenza` date DEFAULT NULL,
  `Tipologia` varchar(30) DEFAULT NULL,
  `Ente` varchar(30) DEFAULT NULL,
  `Codice_fiscale` varchar(8) NOT NULL,
  PRIMARY KEY (`Numero_documento`),
  FOREIGN KEY (`Codice_fiscale`) REFERENCES `Utente` (`Codice_fiscale`)
);
Drop Table if exists `RegistroLuce`;
CREATE TABLE `RegistroLuce` (
  `Inizio` timestamp NOT NULL,
  `Fine` timestamp default NULL,
  `Codice_elemento` varchar(6) NOT NULL,
  `Intensita` int DEFAULT NULL,
  `Colore` int DEFAULT NULL,
  `Predefinito` tinyint(1) DEFAULT NULL,
  `Username` varchar(20) NOT NULL,
  PRIMARY KEY (`Inizio`,`Codice_elemento`),
  FOREIGN KEY (`Codice_elemento`) REFERENCES `ElementoIlluminazione` (`Codice_elemento`)
);

Drop Table if exists `Programma`;
CREATE TABLE `Programma` (
  `Codice_programma` int NOT NULL,
  `Nome_programma` varchar(30) DEFAULT NULL,
  `Durata` int DEFAULT NULL,
  `Consumo_medio` int DEFAULT NULL,
  `Codice_dispositivo` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`Codice_programma`),
  FOREIGN KEY (`Codice_dispositivo`) REFERENCES `Dispositivo` (`Codice_dispositivo`)
) ;

Drop table if exists `RegistroClima`;
CREATE TABLE RegistroClima (
  `Inizio` timestamp NOT NULL,
  `Fine` timestamp NOT NULL,
  `Codice_stanza` int NOT NULL,
  `Umidita` double default null,
  `Temperatura` double default null,
  `Intervallo` int DEFAULT NULL,
  `Username` varchar(20) NOT NULL,
  PRIMARY KEY (`Inizio`,`Codice_stanza`),
  FOREIGN KEY (`Codice_stanza`) REFERENCES `Stanza` (`Codice_stanza`),
  FOREIGN KEY (`Username`) REFERENCES `Account` (`Username`)
);

Drop table if exists `TemperaturaInterna`; 
CREATE TABLE `TemperaturaInterna` (
  `Codice_stanza` int NOT NULL,
  `Timestamp` timestamp NOT NULL,
  `Temperatura` double DEFAULT NULL,
  PRIMARY KEY (`Codice_stanza`,`Timestamp`),
 FOREIGN KEY (`Codice_stanza`) REFERENCES `Stanza` (`Codice_stanza`) 
) ;


DROP TABLE IF EXISTS `TemperaturaEsterna`;
CREATE Table `TemperaturaEsterna`(
	`Timestamp` Timestamp,
    `Temperatura` int,
    Primary KEY(Timestamp)

);

  drop table if exists `Suggerimento`;
CREATE TABLE `Suggerimento` (
  `Codice_suggerimento` int NOT NULL,
  `Codice_dispositivo` varchar(8) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Informazione` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Codice_suggerimento`),
   FOREIGN KEY (`Username`) REFERENCES `Account` (`Username`),
    FOREIGN KEY (`Codice_dispositivo`) REFERENCES `Dispositivo` (`Codice_dispositivo`)
);
Drop Table if exists `RegistroAttivita`;
Create Table `RegistroAttivita`(
	`Inizio` Timestamp,
    `Fine` Timestamp,
    `Codice_dispositivo` Varchar(8),
    `Codice_programma` INT,
     `Username` varchar(20) NOT NULL ,
    Primary Key(`Inizio`,`Codice_dispositivo`),
    Foreign Key (`Username`) References Account(`Username`),
    Foreign Key (`Codice_dispositivo`) References `Dispositivo`(`Codice_dispositivo`),
    Foreign Key (`Codice_programma`) References `Programma`(`Codice_programma`)
);
 drop table if exists Finestra;
CREATE TABLE `Finestra` (
  `Codice_finestra` int NOT NULL,
  `Punto_cardinale` varchar(2) NOT NULL,
  `Codice_stanza` int NOT NULL,
  PRIMARY KEY (`Codice_finestra`),
  FOREIGN KEY (`Codice_stanza`) REFERENCES `Stanza` (`Codice_stanza`),
  check (`Punto_cardinale` in ('N', 'NE', 'NO', 'S', 'SE', 'SO', 'E', 'O'))
);

 drop table if exists PuntidiAccesso;
CREATE TABLE `PuntidiAccesso` (
  `Codice_accesso` int NOT NULL,
  `Punto_cardinale` varchar(2) NOT NULL,
  `Tipo` varchar(15) NOT NULL,
  `Codice_stanza` int NOT NULL,
  PRIMARY KEY (`Codice_accesso`,`tipo` ),
  FOREIGN KEY (`Codice_stanza`) REFERENCES `Stanza` (`Codice_stanza`)
);

Drop Table if exists `FasceOrarie`;
Create Table FasceOrarie(
	`Tipo_fascia` varchar(3) NOT NULL,
	`Ora_inizio` TIME NOT NULL,
    `Ora_fine` Time NOT NULL,
    `Prezzo` int NOT NULL,
	`Username` varchar(20) NOT NULL ,
    Primary Key(`Tipo_fascia`),
	FOREIGN KEY (`Username`) REFERENCES `Account` (`Username`)
);

Drop Table if exists `PannelloFotovoltaico`;
Create Table `PannelloFotovoltaico`(
	`Codice_pannello` VARCHAR(8) NOT NULL PRIMARY KEY,
    `Posizione` VARCHAR(100) NOT NULL,
    `Superficie` INT NOT NULL
    );
    
Drop Table if exists `ContatoreBidirezionale`;
Create Table `ContatoreBidirezionale`(
	`Timestamp` timestamp NOT NULL,
    `Quantita` INT NOT NULL,
    `Codice_pannello` VARCHAR(8) NOT NULL,
    `Tipo_fascia` varchar(3) NOT NULL,
    Primary Key(`Timestamp`, `Codice_pannello`),
	FOREIGN KEY (`Codice_pannello`) REFERENCES `PannelloFotovoltaico` (`Codice_pannello`),
    FOREIGN KEY (`Tipo_fascia`) REFERENCES `FasceOrarie` (`Tipo_fascia`)
    );
    
Drop Table if exists `Flusso`;
Create Table `Flusso`(
	`Codice_flusso` INT NOT NULL PRIMARY KEY,
    `Quantita` INT NOT NULL,
   `Timestamp` timestamp NOT NULL,
	`Tipo_fascia` varchar(3) NOT NULL,
	FOREIGN KEY (`Tipo_fascia`) REFERENCES `FasceOrarie` (`Tipo_fascia`)
    );

Drop Table if EXISTS `Accessi`;
CREATE TABLE `Accessi` (
  `Utente` varchar(20) NOT NULL,
  `Data` timestamp NOT NULL,
  `Stanza` int DEFAULT NULL,
  PRIMARY KEY (`Utente`,`Data`),
  FOREIGN KEY (`Stanza`) REFERENCES `Stanza` (`Codice_stanza`),
  Foreign Key (`Utente`) REFERENCES `Account`(`Username`)
) ;

