SELECT nom_sport, colonne_1 as Nombre_epreuve FROM sport natural join
(SELECT DISTINCT count(t1.id_etapetournois) as colonne_1, t1.id_sport 
FROM etape_tournois as t1, etape_tournois as t2
WHERE t1.id_etapetournois = t2.id_etapetournois
GROUP BY t1.id_sport) AS c1 ORDER BY colonne_1 LIMIT 5;

