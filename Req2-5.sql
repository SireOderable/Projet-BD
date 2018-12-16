-- Uniquement pour les sports où la France a participée.

SELECT DISTINCT nom_sport FROM sport, equipe, pays, athlete, composition_equipe
WHERE nb_joueurs = 1
AND equipe.id_equipe = composition_equipe.id_equipe
AND composition_equipe.id_at = athlete.id_at
AND athlete.id_pays = (SELECT id_pays FROM pays WHERE nom_pays ILIKE '%france%')
AND sport.id_sport = equipe.id_sport
AND equipe.id_equipe NOT IN (SELECT id_equipe FROM finale WHERE medaille IS NOT NULL);
