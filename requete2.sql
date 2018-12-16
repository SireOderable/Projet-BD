select distinct resultat from etape_tournois, (select id_sport from sport where nom_sport like '%- 200m nage libre%') as S, equipe
where equipe.id_sport = S.id_sport; and etapes_tournois.id_equipe = equipe.id_equipe;
