/* 1) Valore del magazzino */

select format(sum(prezzo*rimanenza), 2, "de_DE") "Valore magazzino" from articolo;
/*
+------------------+
| Valore magazzino |
+------------------+
| 340.573,50       |
+------------------+
*/


/* 2) Valore del magazzino per categoria */

select categoria, format(sum(prezzo*rimanenza), 2, "de_DE") "Valore Magazzino" 
from articolo 
group by categoria;
/*
+-----------+------------------+
| categoria | Valore magazzino |
+-----------+------------------+
| hardware  | 106.676,00       |
| software  | 233.897,50       |
+-----------+------------------+
*/


/* 3) articoli ordinati e quantità relative ordinati per quantità */

select descrizione, sum(quantita) "Ordinati"
from articolo, ordine_dettaglio
where articolo.id = ordine_dettaglio.articolo_id
group by descrizione order by Ordinati desc;

/*
+-------------+----------+
| descrizione | ordinati |
+-------------+----------+
| chiavetta   |       16 |
| monitor     |       13 |
| Webcam      |        6 |
| hard-disk   |        6 |
| Office      |        5 |
| smartwatch  |        4 |
| Photoshop   |        2 |
+-------------+----------+
*/

/* 4) quantità articoli ordinati, divisi per categoria */

select categoria, sum(quantita) "Ordinati"
from articolo, ordine_dettaglio
where articolo.id = ordine_dettaglio.articolo_id
group by categoria order by Ordinati desc;

/*
+-----------+----------+
| categoria | ordinati |
+-----------+----------+
| hardware  |       45 |
| software  |        7 |
+-----------+----------+
*/

/* 5) articoli ordinati nell'ordine con id=7 */

select descrizione, quantita
from articolo, ordine_dettaglio
where articolo.id = ordine_dettaglio.articolo_id
and ordine_dettaglio.ordine_id = 7
order by quantita desc;

/*
+-------------+----------+
| descrizione | quantita |
+-------------+----------+
| chiavetta   |        5 |
| hard-disk   |        2 |
| Webcam      |        1 |
+-------------+----------+
*/

/* 6) Valore degli ordini: Totale denaro speso dai clienti  */

select sum(prezzo * quantita) "Valore ordini" 
from articolo, ordine_dettaglio
where articolo.id = ordine_dettaglio.articolo_id;

/* 
+---------------+
| Valore ordini |
+---------------+
| 12.126,50     |
+---------------+
*/

/* 7) Seleziono cognome, email dei clienti che hanno effettuato ordini */

select cognome, email
from cliente, ordine
where cliente.id = ordine.cliente_id
group by cognome
order by cognome;

/*
+----------+----------------------+
| cognome  | email                |
+----------+----------------------+
| bianchi  | luca2@gmail.com      |
| esposito | francoe@icloud.com   |
| rossi    | paolo25@gmail.com    |
| rosso    | alberto12@icloud.com |
+----------+----------------------+
*/

/* 8) Seleziono nome del cliente, l'id dell'ordine e la data */

select cognome, ordine.id "id", `data`
from cliente, ordine
where cliente.id = ordine.cliente_id
order by cognome;

/*
+----------+----+------------+
| cognome  | id | data       |
+----------+----+------------+
| bianchi  |  2 | 2018-01-11 |
| bianchi  |  4 | 2018-01-23 |
| bianchi  | 12 | 2018-02-28 |
| esposito |  5 | 2018-02-03 |
| esposito |  7 | 2018-02-13 |
| rossi    |  1 | 2017-12-01 |
| rosso    |  3 | 2018-01-21 |
+----------+----+------------+
*/

/* 9) Seleziono i clienti e il denaro speso in totale da ciascuno */

select cognome, sum(prezzo*quantita) "Speso"
from cliente, articolo, ordine, ordine_dettaglio
where cliente.id = ordine.cliente_id
and articolo.id = ordine_dettaglio.articolo_id
and ordine.id = ordine_dettaglio.ordine_id
group by cognome
order by cognome;

/*
+----------+---------+
| cognome  | Speso   |
+----------+---------+
| bianchi  | 7670.50 |
| esposito | 3428.50 |
| rossi    |  242.50 |
| rosso    |  785.00 |
+----------+---------+
*/