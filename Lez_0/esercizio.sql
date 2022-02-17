create table if not exists amico(
    id int auto_increment primary key,
    nome varchar(30),
    cognome varchar(40)
    /*
     ## primary key(id)    modo di dichiarare una primary key
    */
);

-- TABELLE
-- editore (id, nome, contatto)
-- libro (id, titolo, prezzo, pagine,  editore_id)
-- autore (id, nome, cognome, nazionalità)
-- autore_libo (autore_id, libro_id)

create table if not exists editore(
    id int auto_increment primary key,
    nome varchar(30),
    contatto varchar(50) unique
);

create table if not exists libro(
    id int auto_increment primary key,
    titolo varchar(100),
    prezzo decimal(6,2),
    pagine smallint,
    editore_id int
);

create table if not exists autore(
    id int auto_increment primary key,
    nome varchar(30),
    cognome varchar(50),
    nazionalità char(2)
);

create table if not exists autore_libro(
    autore_id int primary key,
    libro_id int primary key
);