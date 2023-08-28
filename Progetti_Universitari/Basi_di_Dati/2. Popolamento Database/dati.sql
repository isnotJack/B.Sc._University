Use SmartHome;
Set FOREIGN_KEY_CHECKS = 0;

Insert Into utente (Codice_fiscale, Nome, Cognome, Data_nascita, Numero_telefono) VALUES
	('MLDGCM01', 'Giacomo', 'Maldarella', '2001-05-17', '3494109336'),
	('PTRMNS77', 'Patrizio', 'Miniatore', '1977-03-05','3521485996'), 
	('DSLART50', 'Arturo', 'Desolu', '1950-02-06',' 3698541225'),
	('GNVFDR78', 'Federico', 'Genova', '1978-04-01', '3658974551'),
	('PSLGNN81', 'Ginevra', 'Pistolari', '1981-08-13', '3655896224'),
	('CVLGRG79', 'Giorgio', 'Cavallo', '1979-04-01', '3589658965'),
	('DGVARN85', 'Arnaldo', 'Digiovanni', '1985-01-03', '3256589774')
;

Insert INTO Documento Values
	('EA123BC','2022-01-02','Passaporto','Questura Milano','MLDGCM01'),
    ('GC456ED','2026-02-07','Passaporto', 'Questura Napoli', 'PTRMNS77'),
    ('ED774SA','2027-05-17','Passaporto ', 'Questura Genova', 'DSLART50'),
    ('WE587RF','2025-07-27','Patente di Guida', 'Motorizzazione Civile', 'GNVFDR78'),
    ('AH554FC','2024-10-21','Patente di Guida', 'Motorizzazione Civile', 'PSLGNN81'),
    ('ED445FD','2021-11-05','Patente di Guida', 'Motorizzazione Civile', 'CVLGRG79'),
    ('GI442AI','2025-05-17','Carta Di Identità', 'Comune di Novara', 'DGVARN85');
    
Insert INTO Account Values
	('Jack','MLDGCM01','Qual è il tuo libro preferito','Hunger Games - Suzane Collins','2020-02-01','GattoMiao'),
    ('Patrix','PTRMNS77','Soprannome da bambino?','Paperino','2020-03-04','CaneBao'),
    ('Arturito','DSLART50','Qual è il nome di tua madre?','Lucia','2020-04-11','PaperellaSquick'),
    ('Fred','GNVFDR78','Qual è il nome del tuo migliore amico','Abele','2020-12-01','ApeRonza'),
    ('Giny','PSLGNN81','Chi sono i tuoi insegnati preferiti?','Pistolesi e Vaglini','2021-09-01','AsinoRaglia'),
    ('George','CVLGRG79','Qual è il tuo colore preferito?','Amaranto','2021-09-25','CavalloNitrisce'),
    ('Ron','DGVARN85','Qual è la tua Squadra Preferita','Albinoleffe','2018-05-08','ElefanteBarrisce');
    
    
Insert into Stanza Values 
	(0,'Cucina',8,6,4,0),
    (1,'Corridoio',20,3,4,0),
    (2,'Ingresso',2,3,4,0),
    (3,'Salotto',9,7,4,0),
    (4,'Camera Genitori',5,4,4,0),
    (5,'Bagno Genitori',3,4,4,0),
    (6,'Studio Giacomo e Arnaldo',4,7,4,0),
    (7,'Palestra',9,7,4,0),
    (8,'Camera Ospiti ',4,5,4,0),
    (9,'Studio Ragazzi',6,7,4,0),
    (10,'Camera Arturo - Patrizio',6,8,4,0),
    (11,'Scale',4,2,4,0),
    (12,'Camera Ginevra - Federico - Giorgio',9,7,3,1),
    (13,'Lavanderia',4,3,3,1),
    (14,'Magazzino',9,6,3,1),
    (15,'Bagno',6,5,3,1),
    (16,'Sala Pranzo',7,7,3,1),
    (17,'Sala Cinema',9,7,3,1),
    (18,'Camera Giorgio - Arnaldo',5,4,3,1);
    
Insert Into SmartPlug VALUES
	('aaa1',1,0),('aaa2',1,0),('aaa3',1,0),('aaa4',1,0),('aaa5',1,0),('aaa6',1,0),('aaa7',1,0),('aaa8',0,0), -- smartplug nella stanza 0
    ('aba1',1,1),('cba1',0,1),('abv1',1,1),																	 -- smartplug nella stanza 1
    ('abd1',0,2),																							 -- smartplug nella stanza 2
    ('abc3',1,3),('aba4',1,3),('aba5',1,3),('aba6',1,3),('aba7',1,3),										 -- smartplug nella stanza 3
    ('aba8',0,4),('add3',1,4),('abr4',1,4),('lba3',1,4),													 -- smartplug nella stanza 4
    ('aba3',0,5),('tba5',1,5),																				 -- smartplug nella stanza 5
    ('rbs3',1,6),('asa3',1,6), 																				 -- smartplug nella stanza 6
    ('rtl3',1,7),('rtl2',1,7),('rtl4',1,7),('qsd3',0,7),													 -- smartplug nella stanza 7
    ('osr2',0,8),																							 -- smartplug nella stanza 8
    ('ost3',0,9),('ost4',0,9),																				 -- smartplug nella stanza 9
    ('lst2',1,10),																							 -- smartplug nella stanza 10
	('ost5',0,11),																							 -- smartplug nella stanza 11
    ('ost6',1,12),																							 -- smartplug nella stanza 12
    ('osr',0,13),																							 -- smartplug nella stanza 13
    ('ost2',1,14),																							 -- smartplug nella stanza 14
    ('hp3',1,15);																							 -- smartplug nella stanza 15


Insert into Dispositivo values
	('lvs','Lavastoviglie','aaa1'),
	('mcf','Macchina Caffè','aaa2'),
    ('tsp','Tostapane','aaa3'),
    ('bmb','Bimby','aaa4'),
    ('frl','Piastra Induzione','aaa5'),
    ('cnt','Centrifuga','aaa7'),
    ('asp','Aspirapolvere ','aba1'),
    ('tvs1','Televisore 1','aba4'),
    ('tvs2','Televisore 2','aba5'),
    ('pln','Poltrona Massaggiante','aba6'),
    ('grd','Giradischi','aba7'),
    ('wii','Nintendo WII','abc3'),
    ('ps6','Playstation 6','abr4'),
    ('xbx','Xbox 1000','abv1'),
	('nts','Nintendo Switch','add3'),
    ('pcf','PC fisso','asa3'),
	('asc','Aspira caminetto','hp3'),
	('prt','Proiettore','lba3'),
	('csb','cassa subwoofer ','lst2'),
	('spb','Speakers bluetooth','ost2'),
    ('lav','Lavatrice','ost6'),
    ('mtr','Monitor','rbs3'),
    ('tpr','Tapis Roulant','rtl2'),
    ('clt','Cyclette','rtl3'),
    ('ctr','Centrifuga','rtl4'),
    ('phn','Asciugacapelli LUMOS','tba5');
/*    
Insert INTO PannelloFotovoltaico VALUES
	('tsolar00', "Tetto Lato Nord"),('tsolar01',"Tetto Lato Ovest"),('tsolar03',"Tettoia ingresso Ovest"),('tsolar4','Tetto Lato Est');
*/

INSERT INTO Programma VALUES
	(1,'Lavaggio Ecologico',145,930, 'lvs'),(2,'Lavaggio Intensivo',150,1500, 'lvs'),(3,'Lavaggio Normale',120,1350, 'lvs'),(4,'Lavaggio Rapido',30,500, 'lvs'), 										-- lavaggio lavastoviglie
	(5,'Cotone ECO',100,800,'lav'),(6,'Colorati ECO',95,800,'lav'),(7,'Delicati ECO',80,700,'lav'),(8,'Sintetici',120,1000,'lav'),(9,'Cotone',150,1200,'lav'),(10,'Asciugatura Rapida',40,150,'lav'),	-- lavaggio lavatrice		
    (11,'Pulizia Rapida',30,600,'asp'),(12,'Pulizia Approfondita',90,1400,'asp'),(13,'Singola stanza approfondita',10,200,'asp');

Insert INTO ConsumoFisso VALUES
	('tvs1',200),('tvs2',210),('spb',50),('csb',60),('mtr',70),('grd',100),('xbx',120),('ps6',130),('wii',140),('nts',150),('pln',50),('asc',70),('pcf',100);
 
INSERT INTO ConsumoVariabile VALUES
	('mcf',50,10,1),('mcf',60,10,2), ('tsp',50,10,1),('tsp',60,10,2), ('bmb',80,15,1),('bmb',90,15,2), ('frl',20,10,1),('frl',25,10,2),('cnt',20,10,1),('cnt',25,10,2),('prt',20,10,1),('prt',25,10,2),('prt',25,10,2), ('tpr',10,10,1),('tpr',20,10,2),('tpr',30,10,3),('clt',10,10,1),('clt',20,10,2),('clt',30,10,3), ('crt',40,10,1),('crt',45,10,2),('phn',10,10,1),('phn',30,10,2);

INSERT INTO regolazione VALUES
    (0,0),
    (1,1),
    (2,2),
	(3,3),
    (4,4),
	(5,5);


Insert INTO ElementoIlluminazione Values
	('lmp1','Lampada Dedon',NULL,'caldo - giallo',0),('lamp1','Lampadario Flos',160,'caldo - giallo',0), -- stanza 0
    ('lamp2','Lampadario Ikea', NULL, NULL,1),										-- stanza 1
    ('lamp3','Lampadario Fabbian',NULL,'freddo - blu',2),							-- stanza 2
    ('led1','Led Philips', NULL,NULL,3),('far1','Faretto Philips',NULL,NULL,3),('led2','Led da Gaming',NULL,NULL,3),('lamp4','Lampada Lumos',NULL,'freddo - celeste',3),	-- stanza 3
    ('lamp5','Lampadario Axolight',NULL,'clado - giallo',4),('cmd1','Lampada da Comodino Nox',NULL,NULL,4),('cmd2','Lampada da Comodino Nox',NULL,NULL,4),	-- stanza 4
    ('lamp6','Lampadario Ikea',NULL,'caldo - bianco',5),							-- stanza 5
    ('led3','Led Ikea',3200,NULL,6),												-- stanza 6
    ('lamp7','Lampada Ikea',NULL,NULL,7),											-- stanza 7
    ('lamp8','Lampadario Ikea',NULL,NULL,8),										-- stanza 8
    ('led4','Led Ikea ',3200,NULL,9),												-- stanza 9
    ('lamp9','Lampadario Lumos',NULL,NULL,10),										-- stanza 10
    ('lamp10','Lampada Leucos',3200,'nuetro - bianco',11),							-- stanza 11
    ('lamp11','Lampadario Karman',NULL,'freddo - bianco',12),						-- stanza 12
    ('cmd3','Lampada da Comodino Nox',NULL,NULL,13),('cmd4','Lampada da Comodino Nox',NULL,NULL,13),('cmd5','Lampada da Comodino Nox',NULL,NULL,13),	-- stanza 13
    ('lamp12','Lampada Ikea',NULL,'caldo - rosso',14),								-- stanza 14
    ('lamp13','Lampada Ikea',NULL,NULL,15),											-- stanza 15
    ('lamp15','Lampadario Morosini',NULL,NULL,16),									-- stanza 16
    ('far2','Faretti Sikrea',NULL,NULL,17),('lamp14','Lampada Ikea',NULL,NULL,17),('led5','Led per Calderone Slamp', NULL,NULL,17),	-- stanza 17
	('cmd6','Lampada da Comodino Nox',NULL,NULL,18);								-- stanza 18


INSERT INTO fasceorarie VALUES
    ('AA1','00:00:00', '05:59:59', 30, 'Jack'),
    ('AA2','06:00:00', '11:59:59', 60, 'Jack'),
    ('AA3','12:00:00', '17:59:59', 70, 'Arturito'),
	('AA4','18:00:00', '23:59:59', 40, 'Arturito');
    
    
INSERT INTO suggerimento VALUES
    (1,'lvs', 'Jack', 'la lavastoviglie è meglio attivarla nella AA1 fascia oraria in cui il cunsumo è minore'),
    (2,'lav', 'Ron','la lavatrice è meglio attivarla nella AA1 fascia oraria in cui il cunsumo è minore'),
    (3,'ps6', 'Giny','Non attivare questo dispositivo nella AA4 fascia oraria'),
	(4,'wii', 'Giny','Non attivare questo dispositivo nella AA4 fascia oraria'),
	(5,'xbx', 'Giny','Non attivare questo dispositivo nella AA4 fascia oraria'),
	(6,'grd', 'Giny','Non attivare questo dispositivo nella AA4 fascia oraria'),
	(7,'nts', 'Giny','Non attivare questo dispositivo nella AA4 fascia oraria'),
	(8,'pcf', 'Giny','Non attivare questo dispositivo nella AA4 fascia oraria');

Insert Into finestra (Codice_finestra, Punto_cardinale, Codice_stanza) VALUES
	('0', 'S', '0'),
	('1', 'NO', '1'), 
	('2', 'SE', '2'),
	('3', 'O', '3'),
	('4', 'E', '4'),
	('5', 'SO', '5'),
	('6', 'NE', '6'),
    ('7', 'SO', '7'),
    ('8', 'SE', '8'),
    ('9', 'N', '9'),
    ('10', 'SO', '10'),
    ('11', 'S', '11'),
    ('12', 'NO', '12'),
    ('13', 'SE', '13'),
    ('14', 'O', '14'),
    ('15', 'O', '15'),
    ('16', 'E', '16'),
    ('17', 'S', '17'),
    ('18', 'S', '18');
    
Insert Into puntidiaccesso (Codice_accesso, Punto_cardinale,tipo, Codice_stanza) VALUES
	('0', 'S','porta', '0'),
	('1', 'NO','porta finestra', '1'), 
	('2', 'SE','porta finestra', '2'),
	('3', 'O','porta finestra', '3'),
	('4', 'E','porta', '4'),
	('5', 'SO','porta finestra', '5'),
	('6', 'NE','porta finestra', '6'),
    ('7', 'SO','porta', '7'),
	('7', 'SO','porta finestra', '7'),
    ('8', 'SE','porta finestra', '8'),
    ('9', 'N','porta finestra', '9'),
    ('10', 'SO','porta', '10'),
    ('11', 'S','porta', '11'),
    ('12', 'NO','porta', '12'),
    ('13', 'SE','porta', '13'),
    ('14', 'O','porta', '14'),
    ('15', 'O','porta', '15'),
    ('16', 'E','porta finestra', '16'),
    ('17', 'S','porta finestra', '17'),
    ('18', 'S','porta', '18');
    
    
Insert Into pannellofotovoltaico (Codice_pannello, Posizione,Superficie) VALUES
	('A0','ZA', 10),
	('A1','ZA', 11), 
	('A2','ZA', 12),
	('B0','ZB', 13),
	('B1','ZB', 14),
	('B2','ZB', 15),
	('B3','ZB', 16),
    ('C1','ZC', 17),
	('C2','ZC', 17),
    ('C3','ZC', 18),
    ('D1','ZD', 19),
    ('D2','ZD', 10),
    ('D3','ZD', 11),
    ('E1','ZE', 19),
    ('E2','ZE', 10),
    ('E3','ZE', 11),
    ('F1','ZF', 12),
    ('F2','ZF', 13),
    ('F3','ZF', 14),
    ('G1','ZG', 15),
    ('G2','ZG', 16),
    ('G3','ZG', 17),
    ('H1','ZH', 17),
    ('H2','ZH',17),
    ('H3','ZH', 18),
    ('I1','ZI', 17),
    ('I2','ZI', 17),
    ('I3','ZI', 17);

insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (1, 34, '2021-03-21 07:07:32', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (2, 80, '2021-10-30 23:34:07', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (3, 23, '2021-08-19 06:39:47', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (4, 87, '2022-01-24 06:25:56', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (5, 88, '2021-10-17 06:23:11', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (6, 83, '2021-06-09 14:52:44', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (7, 2, '2022-01-26 06:58:12', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (8, 85, '2021-07-26 10:32:52', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (9, 22, '2022-02-13 22:32:56', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (10, 43, '2021-06-19 01:45:41', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (11, 73, '2022-01-01 12:29:23', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (12, 93, '2022-01-21 00:04:11', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (13, 66, '2021-06-05 08:24:59', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (14, 23, '2021-05-24 07:35:41', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (15, 14, '2021-04-08 09:29:34', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (16, 72, '2022-01-23 15:55:48', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (17, 99, '2022-01-30 03:23:30', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (18, 78, '2021-07-02 19:49:32', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (19, 24, '2021-12-22 03:12:26', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (20, 86, '2022-01-04 03:59:17', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (21, 34, '2021-11-16 22:26:32', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (22, 20, '2021-12-27 14:53:07', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (23, 41, '2022-02-21 22:00:11', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (24, 57, '2021-04-29 15:12:55', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (25, 16, '2021-09-08 13:34:41', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (26, 62, '2021-08-07 15:27:28', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (27, 11, '2021-04-25 21:52:58', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (28, 100, '2021-09-07 19:41:29', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (29, 34, '2021-05-03 05:28:08', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (30, 85, '2021-03-29 09:11:03', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (31, 34, '2021-12-30 02:12:34', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (32, 97, '2021-08-28 16:56:22', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (33, 63, '2021-12-04 08:16:06', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (34, 90, '2021-09-05 15:30:04', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (35, 91, '2021-07-24 00:27:06', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (36, 35, '2021-08-13 16:46:18', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (37, 56, '2021-07-22 01:37:34', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (38, 43, '2021-08-23 20:01:26', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (39, 79, '2021-05-12 02:00:15', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (40, 49, '2021-09-20 04:58:29', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (41, 2, '2021-04-29 01:18:15', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (42, 33, '2021-05-05 04:57:54', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (43, 19, '2021-09-19 15:09:38', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (44, 24, '2022-02-25 10:50:03', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (45, 18, '2021-09-13 05:09:40', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (46, 59, '2022-03-06 05:33:08', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (47, 99, '2021-07-02 08:17:17', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (48, 84, '2021-12-15 14:06:00', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (49, 80, '2021-10-23 09:21:25', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (50, 65, '2021-11-01 04:34:57', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (51, 57, '2021-04-20 12:57:43', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (52, 57, '2021-12-06 04:20:18', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (53, 51, '2022-01-11 03:15:46', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (54, 28, '2022-01-31 07:35:04', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (55, 78, '2021-04-29 01:13:43', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (56, 90, '2021-10-25 14:31:55', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (57, 55, '2021-06-06 22:50:13', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (58, 78, '2021-06-06 04:44:47', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (59, 51, '2021-05-19 00:42:25', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (60, 93, '2021-03-10 16:14:27', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (61, 80, '2021-11-08 23:20:56', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (62, 38, '2021-09-24 00:53:59', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (63, 52, '2022-03-04 10:08:11', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (64, 85, '2022-02-21 20:37:15', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (65, 66, '2021-12-26 19:01:52', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (66, 66, '2021-09-01 23:05:26', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (67, 9, '2021-09-28 07:33:51', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (68, 1, '2021-09-05 06:05:01', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (69, 77, '2021-05-09 04:36:19', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (70, 70, '2021-08-02 02:13:36', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (71, 24, '2021-06-17 17:59:10', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (72, 82, '2022-03-01 03:19:29', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (73, 22, '2021-12-30 00:44:04', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (74, 65, '2021-04-13 12:20:22', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (75, 40, '2022-01-03 19:50:16', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (76, 72, '2021-07-19 16:15:35', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (77, 71, '2021-05-06 10:05:56', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (78, 73, '2021-10-25 17:54:12', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (79, 41, '2022-01-21 11:17:12', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (80, 42, '2021-04-03 16:16:07', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (81, 99, '2021-03-07 05:40:41', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (82, 66, '2022-02-06 10:29:56', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (83, 12, '2021-08-28 09:59:52', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (84, 39, '2022-01-17 06:30:31', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (85, 89, '2021-08-11 14:14:17', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (86, 55, '2021-10-12 16:13:37', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (87, 35, '2022-03-05 18:25:25', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (88, 95, '2021-11-08 15:29:30', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (89, 67, '2022-03-06 04:13:34', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (90, 72, '2022-02-11 00:04:15', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (91, 96, '2021-12-26 16:38:45', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (92, 5, '2021-04-20 16:53:53', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (93, 64, '2021-06-29 20:33:49', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (94, 15, '2021-03-25 06:43:59', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (95, 58, '2022-02-21 17:18:30', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (96, 45, '2022-02-11 11:58:19', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (97, 80, '2022-02-14 18:58:20', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (98, 23, '2021-09-23 18:46:34', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (99, 84, '2021-12-17 05:03:28', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (100, 45, '2021-08-30 21:38:32', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (101, 77, '2021-08-08 04:24:03', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (102, 70, '2021-09-10 17:42:12', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (103, 67, '2021-03-26 15:59:44', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (104, 57, '2021-05-25 02:24:33', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (105, 48, '2021-12-19 13:21:56', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (106, 94, '2021-05-27 10:25:07', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (107, 69, '2021-08-13 01:45:12', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (108, 57, '2021-09-05 13:57:36', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (109, 34, '2021-12-04 14:33:47', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (110, 84, '2021-05-31 07:59:10', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (111, 58, '2021-09-14 22:11:05', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (112, 98, '2021-11-04 14:55:26', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (113, 21, '2022-01-22 11:59:26', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (114, 97, '2021-06-26 22:13:32', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (115, 87, '2021-05-31 04:50:13', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (116, 63, '2021-10-16 16:53:21', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (117, 45, '2021-09-02 01:27:53', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (118, 64, '2021-07-27 06:03:32', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (119, 27, '2021-10-18 00:48:30', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (120, 61, '2022-02-16 23:13:48', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (121, 61, '2021-03-23 11:52:03', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (122, 79, '2021-08-09 02:35:32', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (123, 43, '2021-06-26 10:21:25', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (124, 32, '2021-07-03 20:03:26', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (125, 74, '2021-07-07 19:08:24', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (126, 26, '2022-01-09 11:10:30', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (127, 23, '2021-07-08 05:42:16', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (128, 42, '2022-03-01 19:09:33', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (129, 19, '2021-10-08 01:55:48', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (130, 97, '2021-04-28 05:52:05', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (131, 13, '2021-08-31 19:37:19', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (132, 88, '2021-06-27 02:31:46', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (133, 95, '2022-01-03 06:33:58', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (134, 41, '2021-10-11 09:35:46', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (135, 2, '2022-02-11 13:48:32', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (136, 66, '2022-02-14 08:26:18', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (137, 7, '2021-07-31 12:26:38', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (138, 50, '2021-09-06 15:44:17', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (139, 54, '2021-12-29 22:55:05', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (140, 90, '2021-08-22 19:58:17', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (141, 49, '2021-08-03 12:10:10', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (142, 40, '2021-12-11 15:51:08', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (143, 86, '2022-02-13 11:26:01', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (144, 52, '2021-12-18 13:40:56', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (145, 40, '2021-09-18 08:19:00', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (146, 19, '2021-12-15 09:25:09', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (147, 52, '2021-06-12 01:05:25', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (148, 17, '2021-12-25 01:44:06', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (149, 12, '2021-08-16 18:25:07', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (150, 12, '2021-04-27 06:18:51', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (151, 50, '2021-04-28 17:29:08', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (152, 96, '2022-01-20 04:52:03', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (153, 63, '2021-07-28 09:55:19', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (154, 34, '2022-02-18 06:40:46', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (155, 69, '2021-12-09 05:49:53', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (156, 3, '2022-02-19 11:44:47', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (157, 17, '2021-09-23 06:33:38', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (158, 38, '2021-11-11 01:42:40', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (159, 74, '2022-01-05 09:01:41', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (160, 9, '2021-12-19 02:43:17', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (161, 31, '2021-10-16 06:34:48', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (162, 96, '2021-05-12 02:01:31', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (163, 99, '2021-12-21 23:14:25', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (164, 9, '2021-10-24 10:24:44', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (165, 1, '2021-11-10 20:48:45', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (166, 49, '2021-10-28 07:21:27', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (167, 5, '2022-01-21 06:14:39', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (168, 99, '2022-01-12 14:23:28', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (169, 50, '2021-12-22 06:38:25', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (170, 29, '2021-12-18 07:38:59', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (171, 44, '2021-12-10 02:30:21', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (172, 42, '2021-05-28 20:16:53', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (173, 17, '2021-06-25 06:23:07', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (174, 33, '2021-05-22 16:10:23', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (175, 7, '2021-04-30 14:01:05', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (176, 68, '2021-12-15 14:18:53', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (177, 75, '2021-11-19 02:11:47', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (178, 3, '2021-05-01 02:37:29', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (179, 7, '2021-04-13 23:02:02', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (180, 98, '2021-08-28 00:14:25', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (181, 80, '2021-10-14 06:19:49', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (182, 49, '2022-02-06 18:58:30', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (183, 75, '2021-12-08 00:59:18', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (184, 83, '2021-12-24 03:37:41', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (185, 15, '2021-10-10 05:27:19', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (186, 33, '2021-05-19 14:04:32', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (187, 31, '2021-07-21 00:43:41', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (188, 3, '2022-01-20 08:37:01', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (189, 64, '2022-02-20 00:21:04', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (190, 87, '2021-07-18 19:40:56', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (191, 79, '2021-12-23 15:23:14', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (192, 76, '2021-11-30 11:09:22', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (193, 85, '2021-12-16 00:03:20', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (194, 71, '2021-05-21 18:03:15', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (195, 26, '2021-11-26 13:00:18', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (196, 48, '2021-06-02 07:32:37', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (197, 43, '2022-02-06 03:55:45', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (198, 80, '2021-11-17 20:40:30', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (199, 61, '2022-01-18 18:46:54', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (200, 64, '2022-01-26 20:36:20', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (201, 48, '2021-06-30 18:58:43', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (202, 79, '2021-04-09 03:34:15', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (203, 55, '2021-04-25 15:57:02', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (204, 6, '2021-03-21 11:48:26', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (205, 95, '2021-08-04 06:06:01', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (206, 26, '2022-02-08 13:40:24', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (207, 84, '2021-05-31 22:18:14', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (208, 50, '2021-03-13 00:46:44', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (209, 10, '2021-12-30 18:22:25', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (210, 54, '2021-09-30 08:33:33', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (211, 15, '2021-06-22 18:30:03', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (212, 78, '2021-09-23 03:10:07', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (213, 7, '2021-10-03 17:32:46', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (214, 35, '2022-02-13 22:36:07', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (215, 77, '2022-01-09 10:27:56', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (216, 61, '2021-10-29 10:53:43', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (217, 3, '2021-08-04 16:31:55', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (218, 100, '2021-04-11 23:08:18', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (219, 4, '2021-12-10 00:17:50', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (220, 41, '2022-01-24 18:24:34', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (221, 76, '2021-06-15 22:47:42', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (222, 60, '2022-01-16 23:41:49', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (223, 22, '2021-12-22 03:24:07', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (224, 78, '2021-12-21 12:40:16', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (225, 21, '2021-12-30 06:38:43', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (226, 20, '2021-04-10 15:15:31', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (227, 31, '2021-10-09 23:26:44', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (228, 85, '2022-03-02 22:20:16', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (229, 65, '2021-11-09 13:17:06', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (230, 47, '2021-10-01 07:34:26', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (231, 89, '2021-08-13 14:45:12', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (232, 27, '2021-11-20 08:22:53', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (233, 36, '2021-10-16 08:35:07', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (234, 13, '2021-08-05 20:47:27', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (235, 59, '2021-06-27 09:43:55', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (236, 76, '2021-08-25 00:28:19', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (237, 60, '2021-04-20 13:38:05', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (238, 8, '2021-10-18 07:14:00', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (239, 2, '2021-07-09 11:49:21', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (240, 15, '2022-02-03 21:46:40', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (241, 56, '2021-11-24 10:13:23', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (242, 77, '2021-05-26 16:29:40', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (243, 5, '2022-01-07 16:23:42', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (244, 81, '2021-03-30 15:30:26', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (245, 86, '2021-06-14 09:35:24', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (246, 47, '2021-06-14 12:42:41', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (247, 24, '2021-04-14 10:42:33', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (248, 91, '2022-01-12 00:54:33', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (249, 62, '2021-12-22 15:22:09', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (250, 25, '2021-08-03 08:32:40', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (251, 60, '2021-05-20 11:15:03', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (252, 28, '2021-07-07 20:51:02', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (253, 98, '2021-06-07 06:46:31', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (254, 45, '2021-08-03 21:48:01', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (255, 91, '2021-09-22 21:13:08', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (256, 36, '2021-07-14 04:04:54', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (257, 4, '2021-11-15 21:17:07', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (258, 18, '2021-12-04 03:47:51', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (259, 29, '2021-08-28 18:30:43', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (260, 52, '2021-07-17 14:30:49', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (261, 75, '2021-06-10 19:30:08', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (262, 65, '2021-05-30 03:51:15', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (263, 62, '2021-09-05 14:38:18', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (264, 57, '2021-03-25 00:54:20', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (265, 31, '2021-12-13 23:31:36', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (266, 49, '2021-07-27 00:27:09', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (267, 25, '2021-08-18 14:00:30', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (268, 10, '2021-12-06 00:36:43', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (269, 53, '2021-10-06 03:30:49', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (270, 70, '2021-03-29 23:09:24', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (271, 11, '2021-11-28 06:54:18', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (272, 60, '2021-05-03 03:58:52', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (273, 24, '2021-05-07 05:47:49', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (274, 10, '2022-01-23 23:39:13', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (275, 70, '2021-09-05 11:43:54', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (276, 1, '2021-04-20 17:57:51', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (277, 91, '2021-07-15 05:19:40', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (278, 74, '2021-11-10 04:41:15', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (279, 86, '2021-11-06 23:00:55', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (280, 42, '2021-04-23 02:21:51', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (281, 56, '2022-01-01 16:00:32', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (282, 79, '2021-04-05 00:00:35', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (283, 41, '2022-03-03 19:51:40', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (284, 57, '2022-02-17 09:04:05', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (285, 80, '2021-11-15 15:42:34', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (286, 77, '2021-07-18 08:24:27', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (287, 98, '2021-09-26 20:38:35', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (288, 66, '2021-07-18 06:30:18', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (289, 47, '2022-02-18 18:42:21', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (290, 21, '2021-10-17 00:26:10', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (291, 69, '2021-05-13 13:33:14', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (292, 24, '2021-07-02 01:27:55', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (293, 40, '2021-07-01 14:46:43', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (294, 26, '2021-12-03 17:47:27', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (295, 33, '2021-08-14 22:40:52', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (296, 75, '2021-12-06 03:54:40', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (297, 28, '2021-06-17 12:35:28', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (298, 1, '2021-12-03 05:36:42', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (299, 58, '2021-05-20 03:56:22', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (300, 7, '2021-11-18 07:30:34', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (301, 13, '2021-12-13 21:42:21', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (302, 74, '2022-02-19 19:28:58', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (303, 76, '2021-09-30 23:53:19', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (304, 26, '2021-10-21 13:44:23', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (305, 79, '2022-01-28 18:35:09', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (306, 33, '2021-10-04 06:09:33', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (307, 84, '2021-06-11 01:09:35', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (308, 62, '2021-11-03 15:45:20', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (309, 36, '2022-01-24 16:10:56', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (310, 21, '2021-10-05 08:27:11', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (311, 17, '2022-02-16 08:48:24', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (312, 46, '2021-12-11 06:08:01', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (313, 49, '2021-11-18 20:09:31', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (314, 13, '2021-11-16 02:16:13', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (315, 95, '2021-08-29 09:58:56', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (316, 49, '2022-03-04 06:27:27', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (317, 91, '2022-01-15 19:25:00', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (318, 77, '2022-03-05 03:11:47', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (319, 72, '2021-12-16 17:38:49', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (320, 78, '2021-07-20 23:29:19', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (321, 66, '2021-07-17 01:06:20', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (322, 12, '2021-06-10 12:54:51', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (323, 43, '2021-10-10 23:20:46', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (324, 40, '2021-10-07 21:52:06', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (325, 24, '2021-03-16 12:44:41', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (326, 24, '2021-08-21 11:30:42', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (327, 74, '2021-05-06 06:57:46', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (328, 15, '2021-03-31 23:37:05', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (329, 64, '2021-07-11 09:47:14', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (330, 19, '2021-11-05 10:51:26', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (331, 67, '2021-06-01 20:53:51', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (332, 79, '2021-08-08 21:41:35', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (333, 27, '2021-07-17 05:08:59', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (334, 25, '2021-08-05 02:09:25', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (335, 28, '2021-10-13 01:49:49', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (336, 55, '2021-05-06 21:26:19', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (337, 34, '2022-02-15 04:35:35', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (338, 93, '2022-01-27 19:56:39', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (339, 5, '2021-09-19 11:54:04', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (340, 81, '2021-11-05 04:19:05', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (341, 14, '2021-08-07 16:05:16', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (342, 37, '2021-07-26 21:16:58', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (343, 64, '2021-03-19 03:36:51', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (344, 18, '2021-11-12 17:27:53', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (345, 87, '2021-09-02 13:06:52', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (346, 70, '2021-09-21 05:01:00', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (347, 45, '2021-07-23 23:44:39', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (348, 50, '2021-12-13 16:29:03', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (349, 28, '2021-11-27 07:34:41', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (350, 70, '2022-01-06 17:02:28', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (351, 10, '2021-04-28 22:23:30', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (352, 9, '2021-08-20 11:11:26', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (353, 82, '2021-08-23 02:04:28', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (354, 19, '2021-10-01 12:50:27', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (355, 45, '2021-09-30 22:26:10', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (356, 33, '2021-12-03 09:33:38', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (357, 25, '2022-02-05 20:12:08', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (358, 90, '2021-05-09 22:33:43', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (359, 19, '2021-12-08 09:08:00', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (360, 14, '2021-09-23 19:48:05', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (361, 53, '2021-08-10 21:39:48', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (362, 58, '2021-07-05 00:45:03', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (363, 82, '2022-01-09 18:04:40', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (364, 60, '2021-06-13 08:30:33', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (365, 32, '2021-12-25 17:12:57', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (366, 3, '2021-10-15 11:01:43', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (367, 87, '2021-08-05 14:08:38', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (368, 48, '2021-11-20 15:00:58', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (369, 76, '2021-04-21 11:39:43', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (370, 70, '2021-07-25 22:57:20', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (371, 89, '2021-12-28 10:06:40', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (372, 17, '2021-08-10 16:23:31', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (373, 86, '2021-06-24 07:28:09', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (374, 13, '2021-07-15 16:28:21', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (375, 54, '2021-11-27 11:58:12', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (376, 86, '2021-06-28 16:41:30', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (377, 69, '2021-06-26 08:37:54', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (378, 93, '2022-02-22 21:18:22', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (379, 47, '2021-03-16 21:03:46', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (380, 8, '2022-01-09 01:31:32', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (381, 38, '2021-04-06 21:17:22', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (382, 70, '2022-01-30 03:35:57', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (383, 29, '2021-04-20 08:09:29', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (384, 53, '2021-10-12 12:00:31', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (385, 98, '2021-05-26 14:46:19', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (386, 32, '2021-08-10 06:31:00', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (387, 3, '2021-06-25 23:39:24', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (388, 43, '2021-11-02 04:15:39', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (389, 86, '2021-11-18 01:56:06', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (390, 49, '2022-01-10 10:27:49', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (391, 28, '2021-04-24 19:44:10', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (392, 90, '2021-11-30 09:35:10', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (393, 20, '2022-02-27 08:51:16', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (394, 75, '2022-02-16 20:44:30', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (395, 42, '2021-09-21 21:10:36', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (396, 69, '2021-05-18 14:53:44', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (397, 38, '2021-09-22 00:52:39', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (398, 45, '2021-11-26 18:34:15', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (399, 28, '2022-01-03 05:52:44', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (400, 35, '2021-07-06 14:16:16', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (401, 31, '2021-11-21 08:51:49', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (402, 67, '2022-02-22 04:22:49', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (403, 13, '2021-05-15 22:50:58', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (404, 18, '2021-12-23 20:03:19', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (405, 92, '2021-10-06 02:22:53', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (406, 66, '2021-09-09 14:35:40', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (407, 69, '2021-03-07 14:33:18', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (408, 94, '2021-06-21 03:13:56', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (409, 21, '2021-11-11 07:19:41', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (410, 66, '2022-02-25 05:39:37', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (411, 2, '2021-07-01 09:46:52', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (412, 27, '2021-09-19 10:17:33', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (413, 36, '2021-07-06 22:22:46', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (414, 62, '2021-07-12 00:03:43', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (415, 22, '2021-05-26 16:10:50', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (416, 41, '2021-11-16 06:26:52', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (417, 95, '2021-05-02 16:38:05', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (418, 66, '2022-02-15 23:23:26', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (419, 51, '2021-12-21 04:19:00', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (420, 35, '2021-10-09 05:48:21', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (421, 45, '2021-04-15 05:53:58', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (422, 10, '2021-06-29 12:30:19', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (423, 40, '2021-08-14 01:34:18', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (424, 98, '2021-07-07 11:21:38', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (425, 65, '2021-05-14 23:33:02', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (426, 99, '2021-07-12 16:01:55', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (427, 16, '2021-09-27 12:26:22', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (428, 99, '2022-02-20 11:21:49', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (429, 54, '2021-08-24 01:59:51', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (430, 20, '2022-02-27 11:08:27', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (431, 8, '2021-10-17 20:09:38', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (432, 36, '2021-11-16 07:01:08', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (433, 4, '2021-12-27 20:32:50', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (434, 11, '2021-10-07 11:08:23', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (435, 35, '2021-03-29 20:50:25', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (436, 32, '2021-12-03 13:23:01', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (437, 69, '2021-09-08 23:20:18', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (438, 54, '2021-03-25 02:54:36', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (439, 38, '2021-03-26 05:59:23', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (440, 37, '2022-02-08 14:48:09', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (441, 53, '2021-03-21 18:06:27', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (442, 93, '2021-09-19 03:00:44', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (443, 54, '2021-03-25 15:46:40', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (444, 95, '2021-09-09 07:26:10', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (445, 73, '2022-02-04 19:28:08', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (446, 87, '2021-06-22 19:54:17', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (447, 22, '2022-01-29 20:52:46', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (448, 74, '2021-07-19 07:42:57', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (449, 67, '2021-08-19 00:14:49', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (450, 81, '2021-05-11 16:12:10', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (451, 40, '2021-12-14 02:22:45', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (452, 73, '2021-04-28 04:25:03', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (453, 31, '2021-12-02 03:13:47', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (454, 59, '2021-08-27 14:35:27', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (455, 74, '2021-07-23 07:35:13', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (456, 90, '2021-03-31 21:16:57', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (457, 40, '2021-12-04 08:55:11', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (458, 42, '2021-03-20 22:34:22', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (459, 87, '2022-02-01 16:16:04', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (460, 9, '2022-01-06 06:47:35', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (461, 30, '2021-07-21 19:42:54', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (462, 47, '2021-07-26 05:46:43', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (463, 10, '2021-06-15 14:05:53', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (464, 76, '2021-09-06 13:46:40', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (465, 3, '2021-04-24 14:27:21', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (466, 63, '2021-06-13 10:05:24', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (467, 89, '2021-04-01 13:59:46', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (468, 89, '2021-04-01 22:29:05', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (469, 49, '2021-08-23 07:31:38', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (470, 34, '2021-12-18 15:43:19', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (471, 22, '2021-06-09 13:01:39', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (472, 94, '2021-05-12 23:24:22', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (473, 82, '2021-08-23 13:28:25', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (474, 17, '2021-03-11 17:49:29', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (475, 25, '2021-10-26 11:30:26', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (476, 72, '2021-08-23 14:34:57', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (477, 19, '2022-02-25 09:11:50', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (478, 38, '2021-06-22 04:54:21', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (479, 6, '2021-06-14 14:34:10', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (480, 79, '2021-12-24 22:14:47', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (481, 95, '2022-01-31 12:16:54', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (482, 66, '2021-04-19 17:14:05', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (483, 40, '2021-09-22 02:57:44', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (484, 4, '2022-01-12 02:12:45', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (485, 93, '2022-02-02 01:37:23', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (486, 98, '2022-02-27 14:33:05', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (487, 22, '2021-12-16 23:03:54', 'AA2');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (488, 75, '2021-09-25 01:03:36', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (489, 43, '2021-03-12 16:30:35', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (490, 43, '2022-01-13 04:43:18', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (491, 90, '2022-02-04 12:51:34', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (492, 63, '2022-02-22 20:38:15', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (493, 6, '2021-05-15 02:40:03', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (494, 16, '2021-11-09 10:06:03', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (495, 57, '2021-11-11 00:28:53', 'AA4');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (496, 11, '2021-04-09 17:14:43', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (497, 79, '2021-04-17 02:38:38', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (498, 21, '2022-02-16 18:44:10', 'AA3');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (499, 10, '2021-11-21 15:15:07', 'AA1');
insert into flusso (Codice_flusso, Quantita, Timestamp, Tipo_fascia) values (500, 26, '2022-02-27 00:44:52', 'AA4');

insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-26 21:10:51', 38, 'F3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-10 06:23:07', 88, 'H2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-31 00:05:44', 30, 'G2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-09 15:14:27', 21, 'A1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-25 14:10:39', 28, 'B3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-20 08:13:12', 55, 'E3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-07 16:14:50', 10, 'E3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-27 10:55:09', 14, 'F3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-11 07:55:30', 64, 'I2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-01 09:26:19', 3, 'A0', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-14 10:52:16', 63, 'A0', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-02 06:14:51', 28, 'A1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-26 13:01:50', 26, 'H2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-29 13:10:33', 55, 'B2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-11 12:18:00', 9, 'B2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-20 14:44:51', 34, 'D3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-27 20:06:58', 40, 'A1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-08 21:25:38', 35, 'G3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-18 19:21:22', 87, 'E3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-17 14:46:48', 70, 'F1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-10 13:03:19', 86, 'A1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-29 00:50:20', 10, 'B3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-24 13:04:46', 32, 'B3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-02 02:46:54', 62, 'E2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-12 00:45:21', 19, 'C3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-27 10:27:17', 35, 'A2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-24 14:10:44', 46, 'H3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-10 18:49:46', 22, 'C1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-22 18:08:10', 22, 'I3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-11 00:12:59', 20, 'H3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-25 01:02:25', 14, 'I2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-13 09:44:47', 19, 'G2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-06 04:47:19', 26, 'A2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-03-05 23:51:20', 84, 'D3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-22 05:00:12', 43, 'B1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-08 02:33:40', 21, 'F1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-14 04:51:13', 45, 'I1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-03 01:32:54', 64, 'E1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-09 17:57:54', 91, 'G1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-20 18:08:45', 72, 'C3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-29 13:21:19', 31, 'D1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-04 14:49:21', 35, 'D2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-24 13:05:50', 66, 'H1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-20 08:55:27', 14, 'B2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-12 13:07:39', 59, 'I2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-21 22:13:30', 17, 'G3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-16 00:15:12', 92, 'E2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-02 06:33:24', 91, 'C3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-21 07:37:08', 18, 'D2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-19 00:03:56', 17, 'C3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-30 00:48:54', 14, 'A1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-09 03:15:02', 5, 'H3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-13 07:33:27', 5, 'A1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-14 15:07:52', 55, 'A1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-26 22:25:19', 29, 'H2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-25 15:15:40', 40, 'A1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-17 13:51:40', 50, 'G1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-05 22:01:27', 38, 'F2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-19 23:02:47', 42, 'B1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-22 00:55:23', 92, 'D3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-10 21:54:27', 58, 'C3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-12 05:16:21', 82, 'H3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-03 08:40:54', 6, 'A1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-27 18:41:34', 33, 'I3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-31 01:50:53', 83, 'G1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-11 09:56:16', 92, 'I1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-12 02:19:30', 72, 'B2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-12 09:31:43', 60, 'D2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-06 02:12:20', 48, 'C1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-17 10:48:14', 61, 'E3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-08 19:56:08', 54, 'B0', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-28 14:56:48', 62, 'C2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-03-03 06:06:16', 74, 'E2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-08 12:27:43', 57, 'F1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-12 17:54:45', 23, 'A1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-28 03:44:18', 64, 'E2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-11 20:42:42', 30, 'E2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-27 06:52:47', 36, 'I3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-14 19:18:22', 17, 'C2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-11 05:48:59', 93, 'F1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-22 23:48:35', 64, 'A0', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-29 18:22:45', 84, 'C1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-02 16:09:23', 66, 'E3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-20 00:41:11', 68, 'G2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-19 18:57:30', 5, 'A0', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-19 10:23:13', 3, 'B2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-06 17:05:27', 87, 'I2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-31 18:18:47', 94, 'H1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-21 00:15:24', 95, 'I3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-24 03:37:40', 47, 'I1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-06 12:13:16', 67, 'F3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-19 08:33:28', 57, 'H3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-07 21:00:54', 13, 'I3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-16 15:47:31', 100, 'F1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-10 13:58:18', 9, 'I2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-22 08:17:26', 28, 'A0', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-04 02:35:12', 89, 'I1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-07 20:19:02', 62, 'I1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-08 12:07:12', 70, 'B0', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-23 21:58:46', 69, 'H1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-29 03:00:24', 2, 'G2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-03-04 04:18:06', 54, 'H2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-09 13:37:46', 85, 'B0', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-27 08:03:26', 76, 'D1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-06 05:54:13', 80, 'C1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-26 09:16:03', 68, 'B3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-25 16:14:05', 93, 'C2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-03 22:11:04', 22, 'B0', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-11 08:37:34', 6, 'I3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-18 18:05:43', 29, 'A2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-07 13:47:23', 39, 'C3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-16 00:30:50', 4, 'D1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-02 02:16:23', 73, 'E1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-27 23:16:36', 38, 'I3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-09 17:05:30', 13, 'A0', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-10 00:04:36', 40, 'E3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-09 04:19:33', 4, 'A2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-19 22:14:40', 99, 'G3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-13 14:36:24', 100, 'G1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-25 00:51:43', 89, 'D3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-05 02:09:06', 25, 'A0', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-16 10:41:38', 70, 'I3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-07 20:39:31', 80, 'H3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-16 05:25:59', 50, 'F3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-02 10:21:40', 18, 'B1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-23 17:43:02', 90, 'H3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-26 09:58:00', 30, 'F2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-16 23:33:06', 40, 'H1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-26 15:22:42', 62, 'C3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-23 10:35:17', 96, 'F1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-02 15:15:24', 2, 'A0', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-24 17:09:49', 20, 'H2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-13 11:41:43', 72, 'F3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-12 04:49:30', 87, 'E3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-01 17:47:08', 56, 'B3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-22 09:08:39', 2, 'D2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-26 21:02:50', 4, 'C1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-14 00:15:15', 57, 'E2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-06 11:43:18', 5, 'F1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-11 01:53:51', 6, 'H1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-25 12:15:42', 45, 'G1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-28 12:43:18', 68, 'F3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-03-05 12:47:10', 93, 'C1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-11 00:35:53', 52, 'I2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-25 05:40:53', 22, 'D3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-15 20:04:57', 8, 'B3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-10 20:17:53', 26, 'I3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-09 04:09:21', 88, 'A0', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-12 04:49:41', 57, 'H2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-24 00:59:47', 21, 'C3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-31 10:25:56', 11, 'A0', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-30 20:26:24', 34, 'F2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-23 13:06:42', 92, 'H3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-17 10:12:21', 76, 'F3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-09 20:41:29', 30, 'C1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-08 08:48:27', 26, 'D1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-10 08:18:12', 86, 'F1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-28 06:27:23', 74, 'C2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-01 06:41:17', 14, 'A1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-13 09:15:06', 82, 'G1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-24 17:12:22', 58, 'F1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-27 17:28:54', 94, 'D3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-16 12:39:14', 47, 'A2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-06 01:03:00', 74, 'C1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-08 06:27:00', 17, 'D2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-22 22:05:45', 33, 'H3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-20 05:28:53', 84, 'B1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-26 11:38:12', 35, 'H3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-28 01:06:42', 62, 'H3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-23 14:04:29', 69, 'B1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-23 14:45:51', 11, 'C2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-17 22:58:23', 51, 'A0', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-09 12:16:03', 15, 'C3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-18 19:13:46', 55, 'A2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-11 09:20:42', 15, 'I2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-13 02:43:10', 6, 'F3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-23 09:47:48', 9, 'A0', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-19 18:23:37', 92, 'H1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-18 05:17:45', 97, 'E1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-25 18:33:14', 20, 'B3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-22 07:26:52', 28, 'D3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-24 21:56:20', 19, 'A2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-26 01:55:41', 45, 'A2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-16 05:28:19', 99, 'D2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-02 09:23:48', 51, 'B2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-26 06:57:55', 68, 'C1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-14 15:01:24', 87, 'E2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-10 21:48:32', 95, 'F1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-21 18:33:24', 91, 'I1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-11 22:58:34', 37, 'I3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-25 16:47:44', 10, 'I1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-22 11:54:14', 34, 'G2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-03-06 07:06:31', 2, 'F3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-01 11:37:46', 66, 'B3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-28 06:43:12', 73, 'G3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-21 07:10:18', 94, 'H2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-25 12:18:35', 17, 'F3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-29 16:22:45', 1, 'I2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-31 09:38:38', 49, 'E3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-19 00:57:27', 10, 'H1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-14 16:51:16', 7, 'I1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-17 05:56:56', 66, 'F2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-15 15:01:44', 8, 'B2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-03 09:51:40', 51, 'A1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-01 19:41:24', 98, 'H3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-16 22:55:19', 9, 'B0', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-30 18:24:09', 92, 'H2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-18 13:19:57', 16, 'A0', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-29 10:26:07', 78, 'E2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-03 11:15:01', 23, 'C2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-15 07:17:39', 22, 'A2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-25 05:36:42', 83, 'A1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-30 04:12:25', 24, 'B0', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-28 02:59:33', 82, 'G1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-04 17:12:53', 29, 'E3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-26 17:08:16', 14, 'D2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-07 07:26:08', 3, 'E1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-14 00:30:43', 13, 'A0', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-03 01:32:26', 52, 'G1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-04 07:53:25', 98, 'E1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-03 04:47:39', 99, 'I3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-19 01:48:55', 9, 'C1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-31 00:51:11', 50, 'H3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-26 08:40:22', 49, 'B0', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-05 03:08:50', 92, 'E1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-19 13:01:01', 14, 'C1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-07 13:53:05', 47, 'F2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-18 05:56:15', 71, 'C2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-05 09:09:10', 63, 'B0', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-06 00:41:17', 49, 'E3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-29 06:12:23', 48, 'F2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-14 23:15:28', 16, 'E2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-24 09:34:58', 49, 'B3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-05 18:15:58', 19, 'G3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-20 03:13:43', 52, 'D3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-16 22:18:32', 87, 'G1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-30 22:12:34', 92, 'F3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-10 07:52:57', 77, 'E1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-19 20:07:07', 2, 'E2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-27 00:18:13', 58, 'F1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-07 03:58:15', 17, 'C2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-05 18:12:13', 12, 'I3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-26 03:10:52', 78, 'G2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-14 04:16:06', 52, 'D1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-17 02:38:15', 38, 'G3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-17 09:19:06', 60, 'F1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-25 03:56:55', 8, 'D1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-23 19:52:38', 44, 'D3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-31 12:32:10', 99, 'C1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-26 01:21:29', 79, 'G2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-01 03:15:44', 39, 'D1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-30 22:34:23', 96, 'G2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-23 10:34:50', 93, 'E1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-07 13:55:36', 62, 'H3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-30 15:13:54', 91, 'I2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-03 00:47:38', 2, 'H1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-08 16:51:19', 97, 'A0', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-31 09:38:05', 80, 'G2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-04 13:03:51', 53, 'F1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-28 06:56:11', 8, 'D1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-11 05:50:53', 42, 'D1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-27 05:58:17', 81, 'D3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-24 20:38:09', 13, 'F2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-10 01:19:34', 67, 'H2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-30 22:23:48', 2, 'B1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-16 11:21:51', 90, 'F3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-04 14:48:50', 85, 'I2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-13 03:38:21', 55, 'C2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-25 19:08:12', 92, 'E2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-13 14:46:47', 30, 'C2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-30 20:28:20', 5, 'C3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-14 10:06:25', 46, 'B3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-01 04:30:47', 42, 'E3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-17 06:09:31', 81, 'I1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-21 18:19:49', 57, 'H3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-14 09:08:37', 8, 'F3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-12 20:50:48', 91, 'F3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-14 03:48:58', 60, 'B2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-26 10:44:39', 52, 'E3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-08 05:07:58', 95, 'D1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-11 12:01:01', 59, 'C3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-19 08:45:20', 25, 'C1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-08 07:38:27', 74, 'E3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-12 04:17:54', 71, 'B1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-03-01 23:27:45', 17, 'H2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-12 14:06:45', 96, 'C2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-18 02:51:17', 67, 'D1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-30 12:05:30', 86, 'C1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-10 21:40:03', 22, 'I3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-01 03:49:26', 61, 'F3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-05 01:53:29', 25, 'D3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-16 00:15:18', 62, 'I1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-24 19:30:54', 66, 'G3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-14 02:16:53', 89, 'F3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-12 03:41:11', 42, 'E2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-06 21:52:38', 51, 'D1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-30 23:42:14', 17, 'D1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-12 02:29:35', 45, 'D3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-09 12:41:32', 62, 'F2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-06 02:02:39', 55, 'H1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-26 04:04:57', 79, 'F2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-10 01:48:53', 62, 'F1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-08 01:53:59', 64, 'A0', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-01 06:11:21', 96, 'B2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-10 12:32:44', 85, 'H3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-28 22:19:49', 4, 'D3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-19 16:13:18', 67, 'A2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-11 23:41:50', 83, 'G3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-26 08:45:50', 6, 'H2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-01 23:51:30', 40, 'C2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-17 17:53:11', 100, 'I1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-29 01:39:19', 26, 'F2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-11 15:08:47', 48, 'A2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-24 23:18:15', 9, 'G1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-10 09:12:02', 23, 'H2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-30 23:29:25', 84, 'B1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-07 01:02:00', 92, 'A1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-02 21:13:12', 67, 'D1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-23 11:35:58', 67, 'G2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-20 06:40:44', 94, 'A2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-03 23:43:33', 32, 'C3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-14 11:03:37', 28, 'B0', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-07 00:56:53', 39, 'C3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-09 22:04:42', 87, 'A0', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-16 17:13:36', 93, 'D2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-30 16:25:31', 96, 'A0', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-19 01:29:47', 72, 'A1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-05 20:11:23', 57, 'E2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-26 08:01:18', 54, 'H3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-23 13:17:37', 46, 'A0', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-29 23:18:00', 49, 'H2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-12 21:37:23', 29, 'D3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-28 21:19:30', 93, 'A0', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-09 15:53:15', 47, 'F3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-20 12:00:54', 86, 'G1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-12 17:23:29', 37, 'H1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-02 11:57:52', 54, 'G2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-15 08:58:34', 39, 'C1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-21 18:26:30', 59, 'H2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-27 18:00:00', 87, 'F1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-20 21:01:44', 70, 'E1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-15 11:10:07', 13, 'H2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-10 22:36:21', 80, 'B0', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-12 01:20:56', 100, 'H1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-06 09:33:56', 78, 'G1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-14 18:55:17', 77, 'H1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-15 19:53:30', 18, 'D3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-07 20:34:21', 93, 'I1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-05 05:25:14', 79, 'D3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-04 07:53:15', 43, 'H1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-31 00:50:30', 33, 'A2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-27 07:55:43', 54, 'F1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-20 10:46:13', 87, 'I1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-05 09:38:30', 48, 'C3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-26 12:38:56', 86, 'D1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-23 22:30:42', 100, 'I2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-09 16:04:00', 39, 'G1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-21 12:55:12', 72, 'E2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-24 15:16:47', 43, 'D1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-04 15:34:13', 10, 'F3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-22 18:52:34', 100, 'H2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-14 06:38:08', 33, 'H1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-20 01:58:03', 25, 'F3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-11 16:07:10', 61, 'F2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-07 21:57:18', 49, 'E3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-15 04:17:28', 75, 'F3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-10 23:37:44', 6, 'E3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-03-01 02:09:14', 47, 'D3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-02 15:04:26', 36, 'H1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-19 15:36:57', 3, 'I1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-17 19:47:45', 44, 'D3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-06 08:15:36', 79, 'F1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-20 19:01:54', 2, 'I1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-12 18:10:50', 36, 'E1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-05 22:45:54', 36, 'C3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-11 23:40:50', 72, 'B1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-26 13:47:13', 5, 'I3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-14 14:52:28', 11, 'E2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-03 20:25:51', 32, 'G1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-22 19:11:50', 100, 'D1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-16 04:04:09', 81, 'E1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-01 13:22:13', 8, 'G1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-29 19:12:29', 19, 'I2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-20 05:49:36', 67, 'I1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-09 00:46:19', 50, 'D1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-14 16:20:38', 80, 'A2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-12 03:58:03', 20, 'B1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-02 10:43:24', 55, 'E3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-04 18:04:57', 84, 'E2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-21 21:29:52', 36, 'B1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-29 14:54:19', 32, 'G2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-20 00:42:32', 99, 'C2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-12 22:28:27', 1, 'E3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-06 02:25:28', 72, 'E3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-13 18:02:04', 40, 'B0', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-08 23:45:35', 26, 'B1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-25 17:27:08', 49, 'E3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-16 06:32:23', 69, 'D1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-03 08:16:53', 37, 'D3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-06 02:52:01', 75, 'F1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-08 00:33:37', 42, 'C2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-03 04:08:35', 62, 'H1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-10 17:50:41', 94, 'F1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-16 03:01:47', 59, 'B1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-05 09:03:03', 100, 'G3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-28 03:42:55', 19, 'D3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-25 04:32:25', 25, 'G1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-04 22:48:16', 22, 'G3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-14 10:02:55', 71, 'E2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-08 21:38:39', 99, 'C3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-18 02:30:42', 33, 'B0', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-20 05:14:30', 75, 'E2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-14 01:13:04', 28, 'A0', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-25 04:40:35', 16, 'D2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-26 18:59:25', 78, 'H3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-17 11:14:37', 71, 'E2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-01 09:41:54', 1, 'C3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-08 07:18:38', 77, 'E1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-22 02:12:21', 41, 'C3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-01 13:55:54', 100, 'F3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-16 01:55:02', 47, 'E2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-28 14:28:45', 29, 'G1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-02 04:08:00', 10, 'A0', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-24 01:50:25', 33, 'I1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-28 00:25:04', 59, 'F3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-02 21:57:09', 5, 'H3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-09 03:30:47', 73, 'G3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-06 22:55:26', 99, 'F1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-08 17:13:53', 29, 'E2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-11 22:56:56', 74, 'B0', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-08 13:54:36', 72, 'F3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-03 18:20:01', 82, 'B0', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-28 21:17:08', 1, 'I2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-05 03:11:40', 32, 'D1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-23 04:58:42', 98, 'D3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-08 05:40:32', 100, 'C3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-11 19:28:43', 86, 'G3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-20 13:19:54', 93, 'G2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-24 08:55:48', 55, 'B3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-31 20:59:23', 70, 'E1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-22 08:23:28', 33, 'A0', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-24 23:47:55', 67, 'I2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-24 05:36:09', 24, 'G2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-11 03:23:09', 83, 'F2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-03 15:52:57', 52, 'B0', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-14 12:06:39', 16, 'E2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-28 05:29:29', 22, 'E3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-25 14:06:37', 95, 'E2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-07 00:52:54', 58, 'E2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-21 22:11:11', 63, 'G3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-02 14:14:10', 67, 'A0', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-11 13:37:14', 25, 'F1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-23 02:32:33', 94, 'H3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-12 23:01:08', 100, 'A2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-06 15:42:43', 51, 'A0', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-20 21:27:42', 73, 'C2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-08 10:22:27', 10, 'G3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-16 06:41:54', 3, 'C1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-06 08:59:13', 37, 'I2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-10 00:27:30', 71, 'F2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-28 00:04:00', 29, 'E2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-18 01:46:01', 81, 'E2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-03-08 18:36:31', 55, 'C2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-03 08:29:45', 59, 'G3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-29 01:01:03', 91, 'G1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-06 11:06:50', 62, 'B2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-28 22:24:23', 39, 'I1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-06 19:16:32', 53, 'G3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-20 10:45:36', 90, 'G1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-29 17:38:09', 70, 'B2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-21 11:35:27', 92, 'F2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-16 01:58:36', 62, 'H1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-23 01:19:09', 14, 'E2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-28 08:40:55', 54, 'B2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-05 13:29:36', 100, 'B3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-08 18:45:09', 73, 'A1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-12 01:13:07', 49, 'C3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-08 09:03:53', 77, 'I1', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-10-11 17:48:24', 40, 'B2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-12-23 10:35:32', 8, 'B2', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-06-27 09:11:50', 17, 'E2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-06 19:32:58', 26, 'I2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-21 05:47:31', 53, 'F3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-05-01 23:05:21', 60, 'I1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-12 12:17:14', 79, 'G1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-02 05:36:57', 24, 'I1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-17 12:23:28', 39, 'A2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-21 21:49:25', 71, 'H2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-29 04:54:20', 13, 'F2', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-17 13:27:14', 77, 'D1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-09-21 22:46:42', 93, 'C3', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-01-09 05:17:19', 65, 'F3', 'AA4');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-07-22 09:42:11', 48, 'F3', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-11-26 10:30:10', 53, 'G1', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-26 20:58:51', 8, 'E2', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-05 01:57:34', 29, 'G1', 'AA1');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2022-02-14 07:54:46', 52, 'A2', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-08-13 02:50:27', 31, 'D3', 'AA2');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-16 15:58:36', 93, 'B1', 'AA3');
insert into contatorebidirezionale (Timestamp, Quantita, Codice_pannello, Tipo_fascia) values ('2021-04-20 10:16:23', 24, 'H3', 'AA3');
