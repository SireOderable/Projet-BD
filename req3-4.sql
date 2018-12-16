

SELECT (Femme.p::float/Total.p::float)*100 FROM

(SELECT COUNT(*) as p FROM (SELECT DISTINCT nom, genre
FROM equipe, athlete NATURAL JOIN pays, composition_equipe, finale, sport
WHERE equipe.id_equipe = composition_equipe.id_equipe
AND athlete.id_at = composition_equipe.id_at 
AND equipe.id_equipe IN (SELECT id_equipe FROM finale WHERE medaille ILIKE '%or%' OR medaille ILIKE '%argent%' OR medaille ILIKE '%bronze%')
AND finale.id_equipe = composition_equipe.id_equipe
AND equipe.id_sport = sport.id_sport AND genre ILIKE 'f') as c) as Femme,

(SELECT COUNT (*) as p FROM (SELECT DISTINCT sport.nom_sport, nom, nom_pays, medaille
FROM equipe, athlete NATURAL JOIN pays, composition_equipe, finale, sport
WHERE equipe.id_equipe = composition_equipe.id_equipe
AND athlete.id_at = composition_equipe.id_at 
AND equipe.id_equipe IN (SELECT id_equipe FROM finale WHERE medaille ILIKE '%or%' OR medaille ILIKE '%argent%' OR medaille ILIKE '%bronze%')
AND finale.id_equipe = composition_equipe.id_equipe
AND equipe.id_sport = sport.id_sport) as a) as Total
;
