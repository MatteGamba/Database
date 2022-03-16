-- JSON function
create table if not exists articolo(
    id int auto_increment,
    descrizione varchar(100),
    specifiche json,
    primary key(id)
);

insert into articolo(descrizione, specifiche)
value(
    'TV SAMSUNG 32" SMART TV',
    '{
        "marca":"SAMSUNG",
        "pesoKg":"5.12",
        "schermo":"LCD",
        "pollici": 32,
        "uscite":["HDMI", "USB"]
    }'
);

insert into articolo(descrizione, specifiche)
value(
    'TV SAMSUNG 32" SMART TV',
    json_object(
        "marca", "SONY", "pesoKg", "6.5", "schermo", "LED", "pollici", 32, "uscite", "HDMI"
    )
)

insert into articolo(descrizione, specifiche)
value(
    'TV PHILIPS 55" SMART TV',
    json_object(
        "marca", "PHILIPS", "pesoKg", "9.5", "schermo", "LED", "pollici", 55, "uscite", json_array('HDMI', 'RCA', 'USB', 'COAXIAL', 'SCART')
    )
)

-- JSON ESTRACT

select descrizione, json_extract(specifiche, "$.uscite") from articolo;

select descrizione, specifiche -> "$.uscite" from articolo;

select json_extract('[10,20,[30,40]]', '$[1]', '$[0]');

select json_extract(specifiche, '$.uscite[2]') from articolo;

select specifiche -> '$uscite[2]' from articolo;

-- JSON SET

update articolo
set specifiche = 
JSON_SET(
    specifiche,
    '$.marca','LG','$.uscite',json_array('HDMI', 'SCART', 'SPIF'),
    '$.ingressi', json_array('ETHERNET', 'USB')
)
where id = 1;

-- JSON INSERT

update articolo
set specifiche = 
json_insert(
    specifiche,
    '$.uscite[2]', 'RGB'
)
where id = 1; -- NESSUN CAMBIAMENTO -- POSIZIONE 3 GIA OCCUPATA

update articolo
set specifiche = 
json_insert(
    specifiche,
    '$.uscite[3]', 'RGB'
)
where id = 1; -- AGGIUNTO -- POSIZIONE 4 LIBERA

-- JSON REPLACE

update articolo
set specifiche =
JSON_REPLACE(
    specifiche, '$.marca', 'SONY'
)
where id = 1;

update articolo
set specifiche =
JSON_REPLACE(
    specifiche, '$.marca', 'SONY', '$.schermo', 'PLASMA'
)
where id = 1;

update articolo
set specifiche =
JSON_REPLACE(
    specifiche, '$.uscite[1]', 'HDMI2'
)
where id = 1;

-- JSON REMOVE

update articolo
set specifiche =
JSON_REMOVE(
    specifiche,
    '$.profondita'
)
where id = 1;  -- NON RIMUOVE NIENTE PERCHE QUELLA PROPRIETA' NON ESISTE

update articolo
set specifiche =
JSON_REMOVE(
    specifiche,
    '$.uscite[1]'
)
where id = 1;