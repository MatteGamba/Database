-- AVG() -- CALCOLO MEDIA

select AVG(prezzo) from libro;

-- COUNT -- CONTEGGIO DEI RECORD

select COUNT(*) from libro;

select COUNT(genere) from studente where genere = "f";

select COUNT(*) from libro where pagine is null;

-- MIN -- valore minimo -- MAX -- valore massimo

select MIN(prezzo) economico, MAX(prezzo) Caro from libro;

-- SUM -- somma

select SUM(prezzo) "Valore magazzino" from libro;

select SUM(prezzo) "Valore magazzino" from libro where editore_id = 1;

-- FLOOR / CEIL / ROUND -- arrotondamento / valore intero / arrotorndamento matematico

select floor(prezzo), ceiling(prezzo), round(prezzo, 2) from libro;

-- LENGTH -- lunghezza caratteri

select nome, LENGTH(nome) from studente;

-- CONCAT / CONCAT_WS -- concatenare piu di un attributo

SELECT CONCAT(nome,cognome,genere) from studente;

SELECT CONCAT_WS("-", nome, cognome, genere) from studente;

-- SUBSTRING -- parte di una stringa

select cognome, SUBSTRING(cognome, 2), SUBSTRING(cognome, 2,5) from studente limit 10;

-- LEFT / RIGHT -- da sx o da dx una certa quantita di caratteri

select nome, LEFT(nome, 1) from studente;

select nome, RIGHT(nome, 3) from studente;

-- unione di funzioni

select AVG(LENGTH(cognome) + LENGTH(nome)) "Lunghezza media stringa" from studente;

select FLOOR(AVG(LENGTH(cognome) + LENGTH(nome))) "Lunghezza media stringa" from studente;

-- REPLACE

update studente set email = REPLACE(email, "gmail.com","gmail.it");

-- DATA E ORA

select now();
select curtime();
select curdate();

insert into studente(cognome, email, data_nascita) value ("Remogna", "Remo.cloud.com", now());

select cognome, data_nascita, year(data_nascita) from studente;
select cognome, data_nascita, month(data_nascita) from studente;
select cognome, data_nascita, day(data_nascita) from studente;

select dayofweek(curdate());

-- VARIABILI LOCALI

select @@lc_time_names;

set lc_time_names = "it_IT";

select @@lc_time_names;

select cognome, data_nascita, dayname(data_nascita) from studente;

select dayofweek(curdate());

-- FOMRMATO DATA E ORA DIFFERENTE

select cognome, data_nascita, date_format(data_nascita, "%d/%m/%Y") "data di nascita" from studente;

select cognome, data_nascita, date_format(data_nascita, "%d %M del %Y") "data di nascita" from studente;

select cognome, data_nascita, date_format(data_nascita, "%d %m %y") "data di nascita" from studente;

select time_format(curtime(), "%h %p");

-- MEMORIZZARE 3 VALORI IN UNA DATA COMPLETA

insert into studente(cognome, email, data_nascita) 
values("Sudosi", "daniele.sudosi@icloud.com", str_to_date("06-10-1995", "%d-%m-%Y"));

-- CALCOLI CON DATE E ORA -- ADD/SUB/DATEDIFF

select data_nascita, adddate(data_nascita, 5) from studente; -- I GIORNI VALORE DI DEFAULT

select data_nascita, adddate(data_nascita, interval 1000 year) from studente;

select addtime(curtime(), "00:10");

select subdate(curdate(), 5);

select subtime(curtime(), "02:00");

select DATEDIFF(curdate(), "2022-08-15");

select cognome, data_nascita, DATEDIFF(curdate(), data_nascita) from studente;

select timestampadd(day,5, "2002-01-01");

select timestampadd(minute,5, "2002-01-01 00:10:00");

select cognome, data_nascita, timestampdiff(year, data_nascita, curdate()) "Età" from studente order by Età;

alter table studente add eta tinyint unsigned after data_nascita;
insert into studente(cognome, nome, data_nascita, email, eta)
value("Garone", "Giuseppe", "1995-07-04", "giuseppe.garone@mail.it", timestampdiff(year, data_nascita, curdate()));
update studente set eta = timestampdiff(year, data_nascita, curdate());

select cognome, data_nascita, dayofyear(data_nascita) - dayofyear(curdate()) from studente;

select cognome, data_nascita, dayofyear(data_nascita) - dayofyear(curdate()) from studente;