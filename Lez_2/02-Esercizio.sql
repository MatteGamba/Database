-- TABELLA AUTORI
create table if not exists autore(
autore_id int auto_increment,
post_id int,
nome varchar(50),
cognome varchar(50),
primary key(autore_id)
);

-- TABELLA POST
create table if not exists post(
post_id int auto_increment
autore_id int,
commento_id int
contenuto text,
categoria_id int,
tag_id int,
data datetime,
primary key(post_id),
);

-- TABELLA COMMENTO
create table if not exists commento(
commento_id int auto_increment,
contenuto text,
post_id int,
username varchar(30),
data datetime,
primary key(commento_id)
);

-- TABELLA CATEGORIA-TAG
create table if not exists terms(
terms_id int,
nome varchar(30),
primary key(categoria_id)
);

-- TABELLA POST_TERMS
create table if not exists post_terms(
    post_id int,
    tag_id int
)