SELECT nom_pays, a.c
FROM 
(SELECT id_pays, count(medaille) as c

FROM finale natural join
(select distinct id_equipe, id_pays
from composition_equipe as c natural join athlete as a
where a.id_at = c.id_at order by id_equipe) as e

WHERE medaille is not null group by id_pays order by id_pays) as A, pays
WHERE a.id_pays = pays.id_pays;
