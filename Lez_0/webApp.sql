user
test
domanda
user_test
test_domanda

create table if not exists user(
    user_id int auto_increment,
    username varchar(255),
    password varchar(255),
    primary key(user_id)
);

create table if not exists test(
    test_id int auto_increment,
    titolo varchar(255),
    data date,
    primary key(test_id)
);

create table if not exists domanda(
    domanda_id int auto_increment,
    testo varchar(255),
    risposta_esatta varchar(255),
    punteggio tinyint unsigned,
    primary key(domanda_id)
);

create table if not exists user_test(
    user_id int,
    test_id int,
    primary key (test_id, user_id)
);

create table if not exists test_domanda(
    test_id int,
    domanda_id int,
    primary key (test_id, domanda_id)
);