-- Difficulté * :

select distinct athlete.id_at, nom, prenom 
from athlete, (select id_equipe from finale where medaille is not null) as A, composition_equipe 
where athlete.id_pays = (select id_pays from pays where nom_pays = 'Italie') 
and composition_equipe.id_equipe = A.id_equipe;

select distinct nom, medaille, S.nom_sport
from athlete, 
(SELECT DISTINCT * FROM sport 
WHERE sport.nom_sport LIKE 'Athletisme%' ) as S, 
equipe, 
(select * from finale where medaille is not null) as A,
composition_equipe
where equipe.id_equipe = A.id_equipe
and equipe.id_sport = S.id_sport
and composition_equipe.id_at = athlete.id_at
and composition_equipe.id_equipe = equipe.id_equipe;



