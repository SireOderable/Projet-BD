/*select avg(resultat) from etape_tournois where id_sport = (select id_sport from sport where nom_sport like '% 200m nage libre%');

select id_at from composition_equipe, 
(select id_equipe from etape_tournois where id_sport = (select id_sport from sport where nom_sport like '% 200m nage libre%')) as E 
where composition_equipe.id_equipe = E.id_equipe;

select id_pays from athlete, 
(select id_at from composition_equipe, (select id_equipe from etape_tournois where id_sport = (select id_sport from sport where nom_sport like '% 200m nage libre%')) as E where composition_equipe.id_equipe = E.id_equipe) as A
 where athlete.id_at = A.id_at order by id_pays;

select distinct id_equipe, id_at, id_pays
from composition_equipe as c natural join athlete as a
where a.id_at = c.id_at order by id_equipe;*/

SELECT avg(resultat)

FROM etape_tournois as t natural join
(select distinct id_equipe, id_at, id_pays
from composition_equipe as c natural join athlete as a
where a.id_at = c.id_at order by id_equipe) as e

WHERE t.id_sport = (select id_sport from sport where nom_sport like '% 200m nage libre%');


