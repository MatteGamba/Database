-- VIEW

create or replace view studente_v as
select nome, cognome, genere, indirizzo, citta, provincia, regione, email, data_nascita
from studente
order by cognome;

select * from studente_v;

insert into studente_v(cognome, email)
values("Palla", "pallina@icloud.com");

create or replace view libro_tot as
select 
    l.titolo Titolo,
    e.nome Editore,
    concat(a.nome, " ", a.cognome) Autore,
    round(prezzo*1.22, 2) Prezzo
from libro l
join editore e on e.id=l.editore_id 
join autore_libro al on al.libro_id = l.id
join autore a on al.autore_id=a.id
order by Titolo;

select table_name, table_type
from information_schema.tables
where table_schema = "tss_2022"
order by table_name;

drop view studente_v;

-- WITH CHECK OPTION

create or replace studente_v as
select
    nome,
    cognome,
    email,
    provincia
from studente
where provincia = "to"
with check option;

insert into studente_v(cognome, email,provincia)
value("matto", "matto@mail.it", "mi");  -- ERRORE

insert into studente_v(cognome, email,provincia)
value("matto", "matto@mail.it", "to");  -- GIUSTO

-- TABELLE TEMPORANEE -- ESISTE SOLO NELLA SESSIONE

create temporary table giovane
select nome, cognome, genere, eta
from studente
where eta < 31;