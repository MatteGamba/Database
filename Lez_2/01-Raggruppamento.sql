-- DISTINCT -- estrae i record senza ripetizioni

select DISTINCT cognome
from studente;

select DISTINCT cognome
from studente where cognome like 'v%';

-- GROUP BY

select cognome 
from studente
group by cognome;

select genere, count(genere) 
from studente
group by genere;

select e.nome, count(*) quanti
from libro l, editore e
where l.editore_id = e.id
group by e.nome
order by quanti;

select genere,
floor(avg(timestampdiff(year, data_nascita, curdate())))
from studente
group by genere;

select e.nome, sum(prezzo) valore
from libro l, editore e
where l.editore_id = e.id
group by e.nome
order by valore desc;

-- HAVING

select e.nome, sum(prezzo) valore
from libro l, editore e
where l.editore_id = e.id
group by e.nome
having valore > 100
order by valore desc;

select provincia, genere, count(*)
from studente
group by provincia, genere
having count(*) > 1
order by provincia, genere;