-- Difficulté * :

select distinct athlete.id_at, nom, prenom from athlete, (select id_equipe from finale where medaille is not null) as A, composition_equipe where athlete.id_pays = (select id_pays from pays where nom_pays = 'Italie') and composition_equipe.id_equipe = A.id_equipe;

