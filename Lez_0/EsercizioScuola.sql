DOCENTE
Con i seguenti attributi
Nome, Cognome, Indirizzo, Città, Provincia, Regione,  Email, Telefono, Data di nascita, Codice Fiscale
Note: Nome, Cognome, Email devono essere obbligatori (required)
Mettere un indice sul Cognome

CORSO
Con i seguenti attributi
Nome, Argomento, Tipo
(Esempio di corso: jato45, java, fad)
Tipo può avere i seguenti valori: fad, presenza
Note: tutti campi obbligatori (required)
Mettere un indice sul Nome

AULA
Con i seguenti attributi
Nome, Capienza, Edificio, Piano (max 5), Numero aula (max 10), Numero pc (max 31), Proiettore, Lavagna
(Esempio di aula: a1, 31, XX settembre, 1, 1, 31, si, si)
Proiettore: si/no
Lavagna: si/no
Note: Nome, Capienza, Edificio devono essere obbligatori (required)

create table if not exists docente(
    id int auto_increment,
    nome varchar(60) not null,
    cognome varchar(80) not null,
    indirizzo varchar(100),
    citta varchar(50),
    provincia char(2),
    regione varchar(30),
    email varchar(100) not null unique,
    telefono varchar(20)
    data_nascita date,
    cod_fiscale char(16),
    primary key(id)
);
create index k_cognome on docente(cognome);

create table if not exists corso(
    id int auto_increment,
    nome varchar(30) not null,
    argomento varchar(60) not null,
    tipo enum("fad", "presenza") not null,
    primary key(id),
    key k_nome(nome)
);

create table if not exists aula(
    id int auto_increment,
    nome char(3) not null,
    capienza int not null,
    edificio varchar(40) not null,
    piano tinyint,
    num_aula tinyint,
    num_pc tinyint,
    proiettore enum("si", "no"),
    lavagna enum("si", "no"),
    primary key(id)
);