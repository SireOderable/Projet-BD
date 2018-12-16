SELECT nom, prenom FROM 
(SELECT id_sport FROM sport WHERE sport.nom_sport ILIKE '%Athletisme%') as S, 
athlete, 
etape_tournois, 
composition_equipe
WHERE etape_tournois.resultat < 10
AND etape_tournois.id_sport = S.id_sport
AND etape_tournois.id_equipe = composition_equipe.id_equipe
AND composition_equipe.id_at = athlete.id_at;