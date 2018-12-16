SELECT sport, nom, nom_pays, medaille AS n1, medaille AS n2


AND nom IN(SELECT DISTINCT nom
FROM equipe, athlete, composition_equipe
WHERE equipe.id_equipe = composition_equipe.id_equipe
AND athlete.id_at = composition_equipe.id_at 
AND equipe.id_equipe IN (SELECT id_equipe FROM finale WHERE medaille ILIKE '%or%' OR medaille ILIKE '%argent%'));