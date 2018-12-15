drop table if exists etape_tournois;
drop table if exists finale;
drop table if exists composition_equipe;
drop table if exists equipe;
drop table if exists sport;
drop table if exists athlete;
drop table if exists pays;

CREATE TABLE pays (
  id_pays SERIAL PRIMARY KEY,
  nom_pays VARCHAR (50) NOT NULL
);

CREATE TABLE athlete (	
  id_at SERIAL PRIMARY KEY,	
  date_naissance DATE CHECK (date_naissance BETWEEN '1900-01-01' AND '2018-12-30') NOT NULL,
  nom VARCHAR (50) NOT NULL,
  prenom VARCHAR (50) NOT NULL,
  genre VARCHAR (50) CHECK (genre IN ('M','F')) NOT NULL,
  id_pays INTEGER REFERENCES Pays(id_pays) NOT NULL
);

  CREATE TABLE sport (
    id_sport SERIAL PRIMARY KEY,
    nom_sport VARCHAR (50)
   );

CREATE TABLE equipe (
  id_equipe SERIAL PRIMARY KEY ,
  nb_joueurs INTEGER,
  id_sport INTEGER REFERENCES sport(id_sport)
  );
  
CREATE TABLE composition_equipe (
  id_equipe INTEGER REFERENCES equipe(id_equipe),
  id_at INTEGER REFERENCES athlete(id_at),
  PRIMARY KEY (id_equipe, id_at)
  );
  
 CREATE TABLE finale (
   id_finale SERIAL PRIMARY KEY,
   nom_finale VARCHAR (50) CHECK
   (nom_finale IN ('DEMI','QUART','HUITIEME','FINALE','PETITE FINALE')),
   id_equipe INTEGER REFERENCES equipe(id_equipe),
   medaille VARCHAR (50) CHECK (medaille IN ('or','argent','bronze'))
   );
  
CREATE TABLE etape_tournois (
  id_equipe INTEGER REFERENCES equipe(id_equipe),
  id_sport  INTEGER REFERENCES sport(id_sport),
  id_finale INTEGER REFERENCES finale(id_finale),
  resultat FLOAT,
  journee INTEGER
);

--remplissage des tables

\i pays.sql
\i athlete.sql
\i sport.sql
\i equipe.sql
\i composition_equipe.sql
\i finale.sql
\i etape_tournois.sql
