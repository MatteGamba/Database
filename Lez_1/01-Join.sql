-- JOIN tra tabelle

select titolo Titolo, nome Editore, prezzo Prezzo
from libro
inner join editore
on editore.id = libro.editore_id;

select titolo Titolo, cognome Autore, e.nome Editore, prezzo Prezzo
from libro l
join editore e on e.id=l.editore_id
join autore_libro al on al.libro_id=l.id
join autore a on a.id=al.autore; 

-- LEFT / RIGHT JOIN

select titolo Titolo, nome Editore, prezzo Prezzo
from editore
left join libro
on editore.id = libro.editore_id;

select titolo Titolo, nome Editore, prezzo Prezzo
from libro
right join editore
on editore.id = libro.editore_id;

select titolo Titolo, nome Editore, prezzo Prezzo
from libro
left join editore
on editore.id = libro.editore_id
where editore.id is null;

select titolo Titolo, nome Editore, prezzo Prezzo
from libro
right join editore
on editore.id = libro.editore_id
where libro.editore_id is null;

-- FULL OUTER JOIN (NON IMPLEMENTATA IN MYSQL)
-- ALTERNATIVA

select titolo Titolo, nome Editore, prezzo Prezzo
from libro
left join editore
on editore.id = libro.editore_id
where editore.id is null
union
select titolo Titolo, nome Editore, prezzo Prezzo
from libro
right join editore
on editore.id = libro.editore_id
where libro.editore_id is null;

select titolo Titolo, nome Editore, prezzo Prezzo
from libro
left join editore
on editore.id = libro.editore_id
## where editore.id is null
union
select titolo Titolo, nome Editore, prezzo Prezzo
from libro
right join editore
on editore.id = libro.editore_id
where libro.editore_id is null;

-- SCORCIATOIA JOIN

alter table editore rename column id to editore_id;

select titolo Titolo, nome Editore, prezzo Prezzo
from libro
inner join editore
using (editore_id);

alter table editore rename column editore_id to id;