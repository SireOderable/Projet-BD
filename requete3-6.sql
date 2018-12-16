SELECT nom_sport, nom_pays FROM 
(SELECT DISTINCT count(t1.id_etapetournois) as colonne_1, t1.id_sport 
FROM etape_tournois as t1, etape_tournois as t2, finale
WHERE t1.id_etapetournois = t2.id_etapetournois
GROUP BY t1.id_sport)