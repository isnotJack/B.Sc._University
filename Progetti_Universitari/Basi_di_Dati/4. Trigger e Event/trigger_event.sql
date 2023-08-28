-- TRIGGER che controlla, prima di inserire in registro_clima, che non esistano impostazione ricorrenti per quel periodo
drop trigger if exists controlla_Ricorrenti;
delimiter $$
create trigger controlla_Ricorrenti
before insert on registro_clima
for each row
begin
if exists (select * from registro_clima rc
			where rc.intervallo is not null and
			    (time(new.inizio) between time(inizio) and time(fine)
				or time(new.fine) between time(inizio) and time(fine))
				and datediff(date(new.Inizio), date(Inizio)) % intervallo = 0
				)
	then signal sqlstate '45000' set message_text='WARINING! esiste già un impostazione ricorrente in questo lasso di tempo';
end if;
end$$
delimiter ;

-- TRIGGER che incrementa l'attributo luci accese
drop trigger if exists incrementa_luciAccese;
delimiter $$
create trigger incrementa_luciAccese
after insert on registroluce
for each row
begin
if new.Fine is null
	then
    update Stanza s
    set s.luci_accese=s.luci_accese+1
    where s.Codice_stanza = (select Codice_stanza from elementoilluminazione where codice_elemento=new.codice_elemento);
end if;
end$$
delimiter ;

-- TRIGGER che decrementa luci_accese
drop trigger if exists decrementa_luciAccese;
delimiter $$
create trigger decrementa_luciAccese
after update on registroluce
for each row
begin
update Stanza s
set s.luci_accese=s.luci_accese-1
where s.Codice_stanza = (select Codice_stanza from elementoilluminazione where Codice_elemento=new.codice_elemento);
end$$
delimiter ;

-- TRIGGER aggiornare la ridondanza consumo, nei dispositivi interrompibili a consumo variabile
drop trigger if exists aggiorna_consumo;
delimiter $$
create trigger aggiorna_consumo
after insert on consumovariabile
for each row
begin
    
    update consumovariabile cv
    set cv.consumo= new.codice_regolazione * new.durata		-- il consumo viene calcolato come c = livello * durata
    where cv.codice_dispositivo = new.codice_dispositivo;

end$$
delimiter ;


-- EVENT SPEGNIMENTO LUCI
drop event if exists spegniLuci;
delimiter $$

create event spegniLuci
on schedule every 1 day
starts '2021-01-01 23:00:00'
do
begin

create temporary table stanzas like stanza;			-- creazione temporary table
insert into stanzas (select * from stanza);

update registroluce
set Fine = current_timestamp
where Fine is null and Codice_elemento in (
	select el.Codice_elemento
	from Stanzas s inner join elementoilluminazione el on s.codice_stanza=el.codice_stanza 
	where s.LuciAccese > 0 
);
end$$
delimiter ;



		

