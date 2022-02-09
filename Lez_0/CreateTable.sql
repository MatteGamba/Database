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
source percordoFile

