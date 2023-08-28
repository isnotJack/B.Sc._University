-- 1° Parte: Genero La tabella per l'algoritmo APriori

/*
	creo la tabella su cui eseguire l'algoritmo a priori. Le transazioni (le varie righe della tabella tabella_cucina) rappresentano un accesso 
    in cucina in cui è stata effettutata una attività su almeno un dispositivo(ognuno rappresentato da una colonna).
    In ogni cella viene indicato il numero di volte in cui un dispositivo è stato utilizzato. 
    La modellizzazione binaria(richiesta dall'algoritmo a priori) è rappresentata solamente dall'informazione sulla presenza o meno di una attività in 
    una transazione.
*/
use smarthome;

drop table if exists tabella_cucina;
with disp_cucina as (		#recupero i  dispositivi della cucina
	select d.Codice_dispositivo
    from Dispositivo d inner join SmartPlug sp on d.codice_smart_plug = sp.codice_smart_plug
    where sp.codice_stanza=0	#la cucina è rappresentata dal codice stanza = 0
)
select group_concat( # preparo la lista dei codici dei dispositivi
	concat(dc.Codice_dispositivo,' int default 0')
)
from disp_cucina dc
into @creazione_tabcucina;


set @creazione_tabcucina = concat ( 
'create table tabella_cucina (
  Data timestamp not null, ',
  @creazione_tabcucina,
  ', primary key (Data) )'
) ;
prepare sql_statement from @creazione_tabcucina; #Mi creo la tabella tab_cucina
execute sql_statement;

# popolo la tabella

with disp_cucina as (
	select d.Codice_dispositivo
    from Dispositivo d inner join SmartPlug sp on d.codice_smart_plug = sp.codice_smart_plug
    where sp.codice_stanza=0
)
select group_concat(
	concat('count(if(Codice_dispositivo=''',dc.Codice_dispositivo,''',1,NULL)) as ''', dc.Codice_dispositivo,'''')
)
from disp_cucina dc
into @pivoting;
set @pivoting = concat ( -- Seleziono le attività per ogni accesso
	'insert into tabella_cucina(
    
    with Accessi_cucina as (
		select *
		from accessi
		where stanza=0
	),
	disp_cucina as (
		select d.Codice_dispositivo
		from Dispositivo d inner join SmartPlug sp on d.codice_smart_plug = sp.codice_smart_plug
		where sp.codice_stanza=0
	),
	Attivita_cucina as (
		select *
		from Registroattivita
		where codice_dispositivo in (select * from disp_cucina)
	),
	utilizzi_cucina as (
		select Utente, Data, Stanza, Inizio, Fine, Codice_dispositivo
		from Accessi_cucina ac inner join Attivita_cucina att on ac.Utente=att.Username					
		where 
			date(ac.Data) <= date(att.Inizio) and										
            date(ac.Data) + INTERVAL 2 DAY >  date(att.Inizio) and
			Data < Inizio and
			not exists (select * from Accessi_cucina a1  where a1.Utente=ac.Utente and a1.Data > ac.Data and a1.Data < att.Inizio)
		order by utente, data, inizio
	) ', #la data di accesso alla cucina deve essere <= alla data di inizio attività and la data di accesso alla cucina deve essere almeno fatta il giorno prima a quella di utilizzo del dispositivo
	'select Data, ', @pivoting, ' from utilizzi_cucina group by Data);'
    );
    


prepare sql_statement from @pivoting;
execute sql_statement;




/*
Abbiamo ottenuto la tabella su cui andare ad eseguire l'algoritmo APriori
 Ci creiamo due tabelle che ci serviranno:
-	La Prima Tabella: QuerySupporto contiene per ogni itemset:
		- l'identificativo per ogni Itemset: Un numero naturale del quale consideriamo la rappresentazione in base 2 (si veda la documentazione)
		- La lista degli elementi componenti l'itemset
        - la query di calcolo del supporto (costruita tramita uno script python che si connette al database grazie alla libreria SQL CONNECTOR), 
-    La seconda Tabella LargeItemset che verrà popolata dall'Algoritmo

*/
use smarthome;
DROP TABLE IF EXISTS QuerySupporto;
CREATE TABLE QuerySupporto (
    Itemset INT NOT NULL,		#identificativo per ogni Itemset
    Dispositivi VARCHAR(200),	#lista degli elementi componenti l'itemset
    Query TEXT NOT NULL,		#query di calcolo del supporto
    PRIMARY KEY (Itemset)
);

DROP TABLE IF EXISTS LargeItemset;
CREATE TABLE LargeItemset (
    Itemset INTEGER NOT NULL,
    Cardinalita INTEGER NOT NULL,
    Supporto Double NOT NULL,
    PRIMARY KEY (Itemset)
);
-- INSERIMENTO
INSERT INTO QuerySupporto VALUES
(1, 'lvs',"SELECT 1, SUM(IF(lvs = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(2, 'mcf',"SELECT 2, SUM(IF(mcf = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(3, 'lvs mcf',"SELECT 3, SUM(IF(lvs = 0 OR mcf = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(4, 'tsp',"SELECT 4, SUM(IF(tsp = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(5, 'lvs tsp',"SELECT 5, SUM(IF(lvs = 0 OR tsp = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(6, 'mcf tsp',"SELECT 6, SUM(IF(mcf = 0 OR tsp = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(7, 'lvs mcf tsp',"SELECT 7, SUM(IF(lvs = 0 OR mcf = 0 OR tsp = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(8, 'bmb',"SELECT 8, SUM(IF(bmb = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(9, 'lvs imb',"SELECT 9, SUM(IF(lvs = 0 OR bmb = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(10, 'mcf bmb',"SELECT 10, SUM(IF(mcf = 0 OR bmb = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(11, 'lvs mcf bmb',"SELECT 11, SUM(IF(lvs = 0 OR mcf = 0 OR bmby= 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(12, 'tsp bmb',"SELECT 12, SUM(IF(tsp = 0 OR bmb = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(13, 'lvs tsp bmb',"SELECT 13, SUM(IF(lvs = 0 OR tsp = 0 OR bmb = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(14, 'mcf tsp bmb',"SELECT 14, SUM(IF(mcf = 0 OR tsp = 0 OR bmb = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(15, 'lvs mcf tsp bmb',"SELECT 15, SUM(IF(lvs = 0 OR mcf = 0 OR tsp = 0 OR bmb = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(16, 'frl',"SELECT 16, SUM(IF(frl = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(17, 'lvs frl',"SELECT 17, SUM(IF(lvs = 0 OR frl = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(18, 'mcf frl',"SELECT 18, SUM(IF(mcf = 0 OR frl = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(19, 'lvs mcf frl',"SELECT 19, SUM(IF(lvs = 0 OR mcf = 0 OR frl = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(20, 'tsp frl',"SELECT 20, SUM(IF(tsp = 0 OR frl = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(21, 'lvs tsp frl',"SELECT 21, SUM(IF(lvs = 0 OR tsp = 0 OR frl = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(22, 'mcf tsp frl',"SELECT 22, SUM(IF(mcf = 0 OR tsp = 0 OR frl = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(23, 'lvs mcf tsp frl',"SELECT 23, SUM(IF(lvs = 0 OR mcf = 0 OR tsp = 0 OR frl = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(24, 'bmb frl',"SELECT 24, SUM(IF(bmb = 0 OR frl = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(25, 'lvs bmb frl',"SELECT 25, SUM(IF(lvs = 0 OR bmb = 0 OR frl = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(26, 'mcf bmb frl',"SELECT 26, SUM(IF(mcf = 0 OR bmb = 0 OR frl = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(27, 'lvs mcf bmb frl',"SELECT 27, SUM(IF(lvs = 0 OR mcf = 0 OR bmb = 0 OR frl = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(28, 'tsp bmb frl',"SELECT 28, SUM(IF(tsp = 0 OR bmb = 0 OR frl = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(29, 'lvs tsp bmb frl',"SELECT 29, SUM(IF(lvs = 0 OR tsp = 0 OR bmb = 0 OR frl = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(30, 'mcf tsp bmb frl',"SELECT 30, SUM(IF(mcf = 0 OR tsp = 0 OR bmb = 0 OR frl = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(31, 'lvs mcf tsp bmb frl',"SELECT 31, SUM(IF(lvs = 0 OR mcf = 0 OR tsp = 0 OR bmb = 0 OR frl = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(32, 'cnt',"SELECT 32, SUM(IF(cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(33, 'lvs cnt',"SELECT 33, SUM(IF(lvs = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(34, 'mcf cnt',"SELECT 34, SUM(IF(mcf = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(35, 'lvs mcf cnt',"SELECT 35, SUM(IF(lvs = 0 OR mcf = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(36, 'tsp cnt',"SELECT 36, SUM(IF(tsp = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(37, 'lvs tsp cnt',"SELECT 37, SUM(IF(lvs = 0 OR tsp = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(38, 'mcf tsp cnt',"SELECT 38, SUM(IF(mcf = 0 OR tsp = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(39, 'lvs mcf tsp cnt',"SELECT 39, SUM(IF(lvs = 0 OR mcf = 0 OR tsp = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(40, 'bmb cnt',"SELECT 40, SUM(IF(bmb = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(41, 'lvs bmb cnt',"SELECT 41, SUM(IF(lvs = 0 OR bmb = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(42, 'mcf bmb cnt',"SELECT 42, SUM(IF(mcf = 0 OR bmb = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(43, 'lvs mcf bmb cnt',"SELECT 43, SUM(IF(lvs = 0 OR mcf = 0 OR bmb = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(44, 'tsp bmb cnt',"SELECT 44, SUM(IF(tsp = 0 OR bmb = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(45, 'lvs tsp bmb cnt',"SELECT 45, SUM(IF(lvs = 0 OR tsp = 0 OR bmb = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(46, 'mcf tsp bmb cnt',"SELECT 46, SUM(IF(mcf = 0 OR tsp = 0 OR bmb = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(47, 'lvs mcf bmb cnt',"SELECT 47, SUM(IF(lvs = 0 OR mcf = 0 OR tsp = 0 OR bmb = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(48, 'frl cnt',"SELECT 48, SUM(IF(frl = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(49, 'lvs frl cnt',"SELECT 49, SUM(IF(lvs = 0 OR frl = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(50, 'mcf frl cnt',"SELECT 50, SUM(IF(mcf = 0 OR frl = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(51, 'lvs mcf frl cnt',"SELECT 51, SUM(IF(lvs = 0 OR mcf = 0 OR frl = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(52, 'tsp frl cnt',"SELECT 52, SUM(IF(tsp = 0 OR frl = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(53, 'lvs tsp frl cnt',"SELECT 53, SUM(IF(lvs = 0 OR tsp = 0 OR frl = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(54, 'mcf tsp frl cnt',"SELECT 54, SUM(IF(mcf = 0 OR tsp = 0 OR frl = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(55, 'lvs mcf tsp frl cnt',"SELECT 55, SUM(IF(lvs = 0 OR mcf = 0 OR tsp = 0 OR frl = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(56, 'bmb frl cnt',"SELECT 56, SUM(IF(bmb = 0 OR frl = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(57, 'lvs bmb frl cnt',"SELECT 57, SUM(IF(lvs = 0 OR bmb = 0 OR frl = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(58, 'mcf bmb frl cnt',"SELECT 58, SUM(IF(mcf = 0 OR bmb = 0 OR frl = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(59, 'lvs mcf bmb frl cnt',"SELECT 59, SUM(IF(lvs = 0 OR mcf = 0 OR bmb = 0 OR frl = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(60, 'tsp bmb frl cnt',"SELECT 60, SUM(IF(tsp = 0 OR bmb = 0 OR frl = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(61, 'lvs tsp bmb frl cnt',"SELECT 61, SUM(IF(lvs = 0 OR tsp = 0 OR bmb = 0 OR frl = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(62, 'mcf tsp bmb frl cnt',"SELECT 62, SUM(IF(mcf = 0 OR tsp = 0 OR bmb = 0 OR frl = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;")
,(63, 'lvs mcf tsp bmb frl cnt',"SELECT 63, SUM(IF(lvs = 0 OR mcf = 0 OR tsp = 0 OR bmb = 0 OR frl = 0 OR cnt = 0 ,0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;");

#Questa stored procedure calcola il numero di occorrenze di un determinato itemset grazie alla tabella QuerySupporto. 
# Va a mettere il risultato in @Occorrenze
use smarthome;
DROP Procedure IF EXISTS get_occorrenze; 
DELIMITER $$
CREATE Procedure get_occorrenze(num Integer)
BEGIN
	set @D = (Select Query FROM QuerySupporto WHERE Itemset = num);  /*prendiamo le occorrenze di un determinato itemset passato da tastiera*/
	prepare sql_statement from @D;
	execute sql_statement;

END$$

DELIMITER ;

use smarthome;
DROP PROCEDURE IF EXISTS APriori;
DELIMITER $$
CREATE PROCEDURE APriori(supporto DOUBLE, Confidenza Double)
BEGIN
	DECLARE numtransazioni integer default 0;
    DECLARE num_sottoinsiemi integer default 0;
    declare mask integer default 0;
    declare indice integer default 0;
	declare cardinalita integer default 0;
    declare candidato integer default 0;
    declare ss integer default 0;
    set numtransazioni = (Select Count(*) FROM tabella_cucina); #Numero di elementi in tabella cucina
    set num_sottoinsiemi = (select count(*) FROM QuerySupporto);
    truncate table LargeItemset; #FLUSH dei risultati precedenti
    
    #Iniziamo popolando la tabella LargeItemset con gli elementi con cardinalita 1
	set cardinalita = 1;
    set indice = 1;
    
    L1: LOOP
       
        if indice >= num_sottoinsiemi then	
			leave L1;
		end if;
		call get_occorrenze(indice);
		
		if @Occorrenze/numtransazioni > supporto then
			begin
				insert into LargeItemset
				values(indice,cardinalita, @Occorrenze/numtransazioni);
			end;
		end if;
        set indice = indice<<1;
		
    end loop L1;
    
    #A questo punto ho la tabella contenente tutti i Largeitemset con cardinalità 1
    Algo: LOOP
	
		set cardinalita = cardinalita + 1;
        if POW(2,cardinalita -1 )> num_sottoinsiemi  then
			leave Algo;
		end if;
        # Aggiungo un elemento ad ogni large itemset con Dimensione = cardinalita-1 per ottenere
        # candidati large itemset con Dimensione = cardinalità
        
        BEGIN 
			declare finito integer default 0;
			declare l1 integer default 0;
			declare c cursor for(
				select L1.Itemset
				FROM LargeItemset L1
				WHERE 
					L1.Cardinalita = cardinalita - 1);
			declare continue handler for not found set finito = 1;
			open c;
     
			estendil1: LOOP
				fetch c into l1;
				if finito = 1 then 
					leave estendil1;
				end if;
				set indice = 0; #Indice ora fa la funzione di maschera
               
               candi: LOOP
					if indice = 0 then set indice = 1;
					else set indice = indice <<1;
					end if;
					
					if indice > num_sottoinsiemi then
						signal SQLSTATE '45000'
						set MESSAGE_TEXT = "C'è stato un errore in indice";
					end if;
					
						
						BEGIN #Prova con singolo candidato
							set candidato = l1 | indice;
								if EXISTS(Select * FROM LargeItemset WHERE Itemset = candidato) then iterate candi; #L'elemento è gia presente
							end if;
							
							
							#Altrimenti mi genero tutti i subset di candidato con dimensione  = cardinalita -1 e controllo che stiano in LargeItemset
							set mask = indice;
							
							Subset: LOOP
								set mask = mask <<1;
								if mask > num_sottoinsiemi then
									leave Subset;
								elseif mask & candidato > 0 then
									BEGIN #Prova a vedere se il subset è Large
										set ss =  candidato - mask; 
							
										if (NOT EXISTS(select * 
												From LargeItemset 
												Where 
                                                (ss & Itemset) = ss))
								
										then
											ITERATE candi; -- cambia candidato: Ho trovato un suo subset non Large
												
										end if;
										END; #FINE Tentativo sul singolo subset
									end if;
							end LOOP Subset;
					
							#Il candidato ha passato tutti i test sui subset. Controllo il suo supporto e nel caso lo aggiungo
		
							CALL get_occorrenze(candidato);
							if @Occorrenze/numtransazioni > supporto then
								BEGIN
								insert into LargeItemset
								values(candidato,cardinalita, @Occorrenze/numtransazioni);

                                END;
                            end if;
					
					
						END; 
				
					end if;  
				
                END LOOP candi;
            
			END LOOP estendil1;
		close c;
        END; 
		
		End Loop Algo;

        #A questo punto ho ottenuto la tabella completa dei LargeItemset. Mi calcolo la confidenza e passo dalla notazione con i numeri ai codici dei dispositivi
	
       
WITH XY AS(
			Select L.Itemset AS LargeItemset, X.Itemset AS X , X.Supporto AS SupportoX, L.Supporto AS SupportoXUY
            FROM LargeItemset L CROSS JOIN LargeItemset X
            WHERE 
				L.Cardinalita > X.Cardinalita AND
                L.Itemset | X.Itemset = L.Itemset #NON ESISTE UN ELEMENTO DI X.Itemset NON in L
                
            ),
			Regole AS(
				SELECT X, LargeItemset - X AS Y, SupportoXUY/SupportoX
				FROM XY
                WHERE SupportoXUY/SupportoX > Confidenza) ,
                
			 Nomi AS (
				Select Itemset, Dispositivi 
                FROM QuerySupporto
                WHERE Itemset IN (Select X FROM Regole) OR Itemset IN (Select Y From Regole)
            
            )
            Select X, Nomi.Dispositivi AS Y
            FROM (Select Y, Dispositivi AS X FROM Regole INNER JOIN Nomi ON X = Nomi.Itemset) AS D INNER JOIN Nomi ON D.Y = Nomi.Itemset;        
        
        
END$$
        