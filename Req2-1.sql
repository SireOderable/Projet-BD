SELECT id_pays, avg(resultat)

FROM etape_tournois as t natural join
(select distinct id_equipe, id_at, id_pays
from composition_equipe as c natural join athlete as a
where a.id_at = c.id_at order by id_equipe) as e

WHERE t.id_sport = (select id_sport from sport where nom_sport like '% 200m nage libre%')
group by id_pays order by id_pays;
