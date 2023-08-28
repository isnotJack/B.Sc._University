-- OPERAZIONE 1: CREAZIONE ACCOUNT

DROP PROCEDURE IF EXISTS CreaAccount;
DELIMITER $$
CREATE PROCEDURE CreaAccount (IN _nomeutente VARCHAR(50), IN _password VARCHAR(50), IN _domandasicurezza VARCHAR(100), IN _risposta VARCHAR(50), IN _dataregistrazione Date  ,
							  IN _codfiscale VARCHAR(50), IN _nome VARCHAR(50), IN _cognome VARCHAR(50), IN _telefono BIGINT(8), IN _datanascita Date, 
							  IN _numdocumento INT, IN _tipologia VARCHAR(50), IN _datascadenza DATE, IN _enterilascio VARCHAR(50))
BEGIN
	-- CONTROLLO SE IL DOCUMENTO E' SCADUTO
	IF 
		(_datascadenza < CURRENT_DATE)
    THEN 
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Errore. È necessario fornire un documento valido per creare un account.';
		
    ELSE
    
		INSERT INTO Documento (Numero_documento, Scadenza, Tipologia, Ente, CodiceFiscale)
		VALUES  (_numdocumento, _datascadenza, _tipologia, _enterilascio, _codfiscale);

        INSERT INTO Utente (Codice_fiscale, Nome, Cognome,Data_nascita, Numero_telefono)
		VALUES	(_codfiscale, _nome, _cognome,_datanascita , _telefono);
     
        INSERT INTO Account (Username,Codice_fiscale, Domanda_sicurezza, Risposta_sicurezza, Data_registrazione, Password)
		VALUES  (_nomeutente,_codfiscale, _domandasicurezza, _risposta , data_registrazione, _password);
	END IF;
END $$
DELIMITER ;

-- OPERAZIONE 2 Consumo mensile degli elementi di illuminazione
drop function if exists consumi_mensili_luci;
delimiter $$
create function consumi_mensili_luci()
returns double
reads sql data
not deterministic
begin
declare ris double;
select ifnull(sum(Consumo*timestampdiff(minute,inizio,fine)),0) into ris
from registroluce rl inner join elementoilluminazione el on rl.Codice_elemento=el.Codice_elemento
where rl.Inizio > current_timestamp - interval 30 day;
return ris;
end$$
delimiter ;



-- OPERAZIONE 3
-- Calcolo per ogni dispositivo (interrompibile, non interrompibile...) dei consumi mensili
drop function if exists ConsumiDispositivi_mensili;
delimiter $$
create function ConsumiDispositivi_mensili()
returns double
reads sql data
not deterministic
begin
declare cf double default 0;
declare cv double default 0;
declare cni double default 0;

-- Dispositivi a consumo fisso, ciclo interrompibile 
select ifnull(sum(Potenza* Timestampdiff(Minute,Inizio,Fine)),0) as Consumo into cf
From registroattivita a natural join ConsumoFisso cf
where Inizio > current_timestamp - interval 30 day;

-- Dispositivi a consumo variabile, ciclo interrompibile
select ifnull(sum(Consumo*(Timestampdiff(Minute,Inizio,Fine))),0) as Consumo into cv
from registroattivita natural join ConsumoVariabile
where Inizio > current_timestamp - interval 30 day;

-- Consumo dispositivi a ciclo non interrompibile
select ifnull(sum(Consumo_medio*(Timestampdiff(Minute,Inizio,Fine))),0)as Consumo into cni
from Programma p inner join RegistroAttivita ra on p.Codice_programma=ra.Codice_programma
where Inizio > current_timestamp - interval 30 day;

return cf + cv + cni;
end$$
delimiter ;

-- OPERAZIONE 4 Operazione che aumenta la temperatura intera di una data stanza di 10 gradi solo 
-- 				se questa inferiore alla temperatura esterna in quel momento.

DELIMITER $$

DROP PROCEDURE IF EXISTS aumentaTemperatura $$
CREATE PROCEDURE aumentaTemperatura(stanza VARCHAR(5))
BEGIN
DECLARE tempEsterna DOUBLE DEFAULT 0;
DECLARE tempInterna DOUBLE DEFAULT 0;

SELECT te.temperatura INTO tempEsterna
FROM temperaturaesterna TE
Order By Timestamp desc
LIMIT 1;

SELECT ti.temperatura INTO tempInterna
FROM temperaturainterna TI inner join Stanza S on TI.Codice_stanza = S.codice_stanza
WHERE S.codice_stanza = stanza
Order By Timestamp desc
LIMIT 1;

IF tempInterna > tempEsterna THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT ='WARNING! La temperatura interna è troppo alta per poterla aumentare';
ELSE
		UPDATE Temperaturainterna
		SET Temperatura = Temperatura + 10
		WHERE Timestamp = data_richiesta;
END IF ;
END $$

DELIMITER ;

-- OPERAZIONE 5 Data una determinata stanza verificare se la temperatura interna in quel momento è maggiore, minore oppure uguale 
-- 				ad una certa temperatura interna di riferimento.

drop procedure if exists temperaturaStanza;
delimiter $$
create procedure temperaturaStanza(IN _stanza VARCHAR(100) )
begin

DECLARE temperatura_stanza_attuale INT DEFAULT 0;

SET temperatura_stanza_attuale = (
				SELECT ti.temperatura
                FROM stanza s inner join temperaturainterna ti on (s.codice_stanza = ti.codice_stanza)  
				WHERE s.Codice_stanza = _stanza AND ti.timestamp = current_timestamp
                );

IF temperatura_stanza_attuale >= 0 AND temperatura_stanza_attuale <= 15 THEN 
	SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'La temperatura è compresa nell intervallo 0-15 gradi ';
ELSEIF temperatura_stanza_attuale >= 16 AND temperatura_stanza_attuale <= 30 THEN 
	SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'La temperatura è compresa nell intervallo 16-30 gradi ';
ELSE
	SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'La temperatura è superiore ai 30° accendi un condizionatore per il bene di tutti';

END IF; 

end$$
delimiter ;

-- OPERAZIONE 6 Trovare quale utente ha utilizzato per ultimo un certo dispositivo.
drop function if exists ultimoUtilizzatore;
delimiter $$
create function ultimoUtilizzatore(codDisp varchar(8))
returns varchar(20)
reads sql data
not deterministic
begin
declare ultimo varchar(20);
select first_value(Account) over (order by Inizio desc) into ultimo
from attivita
where Dispositivo = codDisp
limit 1;
return ultimo;
end $$
delimiter ;


# OPERAZIONE 7 Trovare l’energia prodotta da un pannello in tutta la sua storia fino all’ultima misurazione effettuata
drop function if exists EnergiaPannello;
delimiter $$
create function EnergiaPannello(pannello varchar(8))
returns double
not deterministic
reads sql data
begin 
return (
	select 30*sum(quantita)
	from contatorebidirezionale
	where Codice_pannello= pannello);
end$$
delimiter ;



-- OPERAZIONE 8 Trovare in quali stanze ci sono luci accese
drop procedure if exists LuciAccese;
delimiter $$
create procedure LuciAccese()
begin
select Codice_stanza
from Stanza
where luci_accese > 0;
end$$
delimiter ;


