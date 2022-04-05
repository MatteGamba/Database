select stipendio from impiegato where id = 6;
select cognome, stipendio from impiegato where stipendio > 1500 order by cognome;

-- SUBQUERY
select cognome, stipendio from impiegato where stipendio > (select stipendio from impiegato where id = 6) order by cognome;

select titolo, nome 
from editore e, libro l
where e.id = l.editore_id
and editore_id = (select max(id) from editore);

select avg(prezzo)

select titolo, prezzo
from libro
where prezzo > (select concat(format(avg(prezzo),2,"de_DE"), "€") from libro)
order by prezzo
