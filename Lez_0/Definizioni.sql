create table if not exists studente(
    id int auto_increment,
    nome varchar(30),
    cognome varchar(40),
    genere enum('m','f'),
    indirizzo varchar(100),
    citta varchar(30),
    provincia char(2) default 'To',
    regione varchar(30) default 'Piemonte',
    email varchar(100) not null unique,
    data_nascita date,
    ins timestamp default current_timestamp on update current_timestamp,
    primary key(id),
    key k_cogn(cognome)
);

create table if not exists parente(
    id int auto_increment primary key,
    nome varchar(30),
    cognome varchar(40)
    /*
     ## primary key(id)    modo di dichiarare una primary key
    */
);

-- visualizza elenco tabelle
show nameTables; 

-- visualissa tabella
desc nameTables;

-- rinomina tabella
rename table nameTable to newNameTable;

-- aggiungere colonna alla tabella
alter table nameTable add nameProp tinyint unsigned;

-- cambia nome e prop alla colonna
alter table nameTable change nameProp nameProp2 varchar(40);

-- cambia nome alla colonna
alter table nameTable rename column nameProp to nameProp2;

-- cambia valore alla colonna
alter table nameTable modify nameProp varchar(50);

-- cancella colonna
alter table nameTable drop nameProp;

-- aggiungere indice al valore
alter table nameTable add index nameIndex(nameProp);

-- visualizza indici
show index from nameTable;

-- creare una copia di un'altra tabella
create table nameTableCopy like nameTable;

-- visualizza più tabelle
desc nameTable;desc nameTableCopy;

-- cancellare tabella
drop table nameTable;

-- cancellare più tabelle
drop table nameTable, nameTableCopy;


-- inserimento record
insert into studente(nome, cognome, genere, indirizzo, citta, email, data_nascita)
value('Mario', 'Rossi', 'm', 'Via Torino 10', 'Moncalieri', 'mr@gmail.com', '1990-05-10');

insert into studente(nome, cognome, genere, indirizzo, citta, provincia, regione, email, data_nascita)
value('Marisa', 'Rossi', 'f', 'Via Milano 10', 'None', default, default, 'mariar@gmail.com', '1995-05-10');

insert into studente(nome, cognome, genere, indirizzo, citta, provincia, regione, email, data_nascita)
value
('Marco', 'Bruni', 'm', 'Via Domenico 20', 'Torino', default, default, 'dome@gmail.com', '1992-05-15'),
('Sara', 'Verdi', 'f', 'Via Collo 85', 'Asburgo', default, default, 'sara@gmail.com', '1993-06-12'),
('Carlo', 'Bello', 'm', 'Via Caspio 10', 'Taranto', 'mi', 'Lombardia', 'callo@gmail.com', '1997-02-12');

insert into studente --metodo alternatico
set email = 'matteo@ciao.it';

insert into studente -- se non specifico devo inserire tutti i campi
value(6, 'Franca', 'Pippo', 'f', 'Via Pluto 20', 'Saragoza', default, default, 'iopippo@gmail.com', '1991-09-27', '2022-02-08 12:08:46');

-- visualizzare i valori stabiliti del record
select nome, cognome, genere, indirizzo, citta, email, data_nascita from studente;

-- visualizzare tutti i valori del record
select * from studente;

-- update valori
update studente set nome = 'Matteo', cognome = 'Gamba', genere = 'm', indirizzo = 'Via Pisani 10', citta = 'Torino', email = 'mgamba@mail.it', data_nascita = '1993-08-14' where id = 7;

-- eliminare record non efficace -- non ripristina id
delete from studente where provincia = 'mi';

delete from studente where genere = 'm';

delete from studente; -- cancella tutto

-- eliminare record più efficace -- ripristina id
truncate studente;

-- ristabilisce l'auto increment
alter table studente auto_incremente = 1;

-- caratteristiche tabella
show table status like studente;

-- caratteristiche specifiche
select auto_increment from information_schema.tables where table_schema = 'tss_2022';

-- aggiungere file
source percorsoFile

----------------------------------------------------------------------------------------------------------

-- copiare dati da una tabella all'altra
insert into amico(nome, cognome) select nome,cognome from studente

-- creare tabella con dati presi da un'altra tabella
create table if not exists parente(
    id int auto_increment primary key,
    nome varchar(30),
    cognome varchar(40)
) select nome,cognome from amico;

-- duplicare tabelle
create table studente_bk like studente;
insert into studente_bk select * from studente;
-- oppure    -- perdi dei dati come primary key o autoincrement
create table studente_bk2 as select * from studente; 

-- ordinare i risultato di una query -- ordine alfabetico
select * from nameTable order by nameProp;


-- ordinare i risultato di una query -- ordine alfabetico inverso
select * from nameTable order by nameProp desc;

-- determina la quantita di record visualizzata -- due valori dopo limit(il primo indica la partenza, il secondo la quantità)
select * from studente order by cognome, nome limit 10;

-- condizione
select cognome, email from studente where genere = "f" order by cognome;

select cognome, email from studente where data_nascita > "1989-12-31" order by data_nascita desc;

-- AND / OR
select nome, cognome, email, data_nascita from studente where genere = "m" and provincia = "to";

select nome, cognome, email, data_nascita,genere, provincia from studente where genere = "m" or provincia = "to";

select nome, cognome, provincia, email from studente where (cognome = "verdi" and provincia = "to") or (nome = "rossi" and provincia = "mi");  

-- IN / NOT IN
select nome, cognome, email, genere, provincia from studente where provincia in ("cn", "at", "no") order by cognome;

select nome, cognome, email, genere, provincia from studente where provincia not in ("cn", "at", "no") order by cognome;

-- BETWEEN / NOT BETWEEN
select nome, cognome, email, data_nascita from studente where data_nascita between "1985-01-01" and "1994-12-31" order by data_nascita;

select nome, cognome, email, data_nascita from studente where cognome between "a" and "m" order by cognome;

-- IS NULL / IS NOT NULL
select nome, cognome from studente where citta is null;

select nome, cognome from studente where citta is not null;

-- LIKE -- costruzione di pattern 
-- %(qualunque carattere per qualsiasi lunghezza dimensione -- prima o dopo) 
-- _(indica un solo carattere prima o dopo di una lettera)
select cognome from studente where cognome like "v%" order by cognome; -- inizia con v

select cognome from studente where cognome like "%o" order by cognome; -- finisce con o

select nome, cognome, indirizzo from studente where indirizzo like "via %";

select nome, cognome, email, indirizzo from studente where email like "%@icloud.com" or indirizzo like "via %";

select * from studente where nome like "franc_";

-- OPERATORI MATEMATICI
select 5*55;

-- crea una colonna temporanea
select titolo, prezzo, prezzo*1.10, pagine from libro order by titolo;



-- INTERROGAZIONE TABELLE
select titolo, pagine, prezzo, editore_id, editore.id, nome
from libro, editore
where editore.id = libro.editore_id; 

select titolo, cognome, nome
from libro, autore_libro, autore
where libro.id = autore_libro.libro_id
and autore.id = autore_libro.autore_id
order by titolo;

select titolo, pagine, prezzo, editore.nome, cognome, autore.nome 
from libro, editore, autore, autore_libro
where libro.editore_id = editore.id
and libro.id = autore_libro.libro_id
and autore.id = autore_libro.autore_id;

select titolo, nome from libro, editore where libro.editore_id = editore.id;

select titolo, prezzo, editore_id, editore.id, nome 
from libro, editore
where editore.id = libro.editore_id
order by editore_id;

-- Condizione di Join
select titolo, nome, cognome
from libro, autore, autore_libro
where libro.id = autore_libro.libro_id
and autore.id = autore_libro.autore_id;

select titolo, prezzo, editore.nome, autore.nome, cognome
from libro, editore, autore, autore_libro
where libro.editore_id = editore.id
and libro.id = autore_libro.libro_id
and autore.id = autore_libro.autore_id
and editore.nome = "Mondadori";

-- ALIAS -- rietichettatura temporanea
select 
    titolo Titolo, 
    pagine as Pagine, 
    prezzo Prezzo, 
    e.nome as Editore, 
    a.nome Nome, 
    a.cognome as Cognome  
from libro as l, editore e, autore as a, autore_libro al
where l.editore_id = e.id
and l.id = al.libro_id
and a.id = al.autore_id;

-- FOREIGN KEY --INTEGRITA' REFERENZIALE
constraint fk_libro_editore
foreign key(editore_id) references editore(id)
on delete cascade
on update cascade;

-- aggiungere foreign key
alter table libro
add constraint fk_libro_editore
foreign key(editore_id) references editore(id)
on delete no action
on update cascade;

-- cancellare
delete from editore where id = 1;

delete from editore where id = 10;

delete from editore where id = 2;

-- modificare dati
update editore set id = 2 where id = 1;

-- modificare foreign key
alter table libro drop foreign key fk_libro_editore;

alter table libro
add constraint fk_libro_editore
foreign key(editore_id) references editore(id)
on delete cascade
on update cascade;


alter table libro drop foreign key fk_libro_editore;

alter table libro
add constraint fk_libro_editore
foreign key(editore_id) references editore(id)
on delete set null
on update cascade;

-- disabilitare temporaneamente la FK
set foreign_key_checks = 0;
--ripristinarle
set foreign_key_checks = 1;

-- Union -- tabella temporanea
select nome, cognome from parente
union
select nome, cognome from amico where cognome like "v%"
union 
select nome, cognome from studente where genere = "f"
order by cognome;

-- JOIN
