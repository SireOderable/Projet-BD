SELECT nom, prenom FROM athlete WHERE (nom,prenom) NOT IN (SELECT DISTINCT nom, prenom
FROM equipe, athlete, composition_equipe
WHERE equipe.id_equipe = composition_equipe.id_equipe
AND athlete.id_at = composition_equipe.id_at 
AND equipe.id_equipe IN (SELECT id_equipe FROM finale WHERE medaille ILIKE '%or%'));