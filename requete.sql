-- Difficulté * :

select distinct athlete.id_at, nom, prenom 
from athlete, (select id_equipe from finale where medaille is not null) as A, composition_equipe 
where athlete.id_pays = (select id_pays from pays where nom_pays = 'Italie') 
and composition_equipe.id_equipe = A.id_equipe;


-- Q2
select distinct nom, medaille, S.nom_sport, nom_pays
from athlete, 
(SELECT DISTINCT * FROM sport 
WHERE sport.nom_sport LIKE 'Athletisme%' ) as S, 
equipe, 
(select * from finale where medaille is not null) as A,
composition_equipe, pays
where equipe.id_equipe = A.id_equipe
and equipe.id_sport = S.id_sport
and composition_equipe.id_at = athlete.id_at
and composition_equipe.id_equipe = equipe.id_equipe
and athlete.id_pays = pays.id_pays;
-- Q3





-- Q4
SELECT DISTINCT 
	nom_sport, medaille, resultat
FROM
	(select medaille, id_equipe, id_finale from finale where medaille is not null) as A,
	(select id_at from athlete where nom LIKE 'PHELPS') as B,
	composition_equipe, equipe, (SELECT nom_sport, id_sport FROM sport WHERE nom_sport ILIKE '%NATATION%') AS S,
	etape_tournois
WHERE 
	equipe.id_sport = S.id_sport
AND
	B.id_at = composition_equipe.id_at
AND
	composition_equipe.id_equipe = equipe.id_equipe
AND 
	A.id_equipe = equipe.id_equipe
AND 
	etape_tournois.id_finale = a.id_finale;

-- Q5
SELECT DISTINCT nom_sport FROM sport, equipe 
WHERE nb_joueurs > 1
AND sport.id_sport = equipe.id_sport;

-- Q6
SELECT MIN (resultat) FROM sport, etape_tournois
WHERE sport.nom_sport ILIKE '%marathon%'
AND etape_tournois.id_sport = sport.id_sport;