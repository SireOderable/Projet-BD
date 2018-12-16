select athlete.id_at, nom, prenom from athlete, 
(select id_at from composition_equipe natural join equipe where id_sport = (select id_sport from sport where nom_sport like '%Handball%femmes%')) as a
where athlete.id_at = a.id_at and athlete.id_pays = (select id_pays from pays where nom_pays = 'France') group by athlete.id_at, nom, prenom having age(date_naissance) < '25 year'::interval;
