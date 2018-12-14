drop table if exists etape_tournois;
drop table if exists finale;
drop table if exists etape;
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
  
  
 CREATE TABLE etape (
   id_etape INTEGER PRIMARY KEY,
   id_equipe INTEGER REFERENCES equipe(id_equipe),
  id_sport  INTEGER REFERENCES sport(id_sport)
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
  id_etape  INTEGER REFERENCES etape(id_etape),
  id_finale INTEGER REFERENCES finale(id_finale),
  resultat FLOAT,
  journee INTEGER
);

--remplissage des tables


INSERT INTO pays VALUES
(1, 'Jamaïque'),
(2, 'Etats-Unis'),
(3, 'Canada'),
(4, 'Suisse'),
(5, 'Danemark'),
(6, 'France'),
(7, 'Espagne'),
(8, 'Inde'),
(9, 'Japon'),
(10, 'Italie'),
(11, 'Hongrie'),
(12, 'Fédération de Russie'),
(13, 'Chine');

INSERT INTO athlete VALUES
(1, '1986-08-21', 'BOLT', 'Usain', 'M', 1),
(2, '1982-02-10', 'GATLIN', 'Justin', 'M', 2),
(3, '1994-11-10', 'DE GRASSE', 'Andre', 'M', 3),
(4, '1992-06-28', 'THOMPSON', 'Elaine', 'F', 1),
(5, '1990-08-27', 'BOWIE', 'Torie', 'F', 2),
(6, '1986-12-27', 'FRASER-PRYCE', 'Shelly-Ann', 'F', 1),
(7, '1989-09-01', 'TRAMER', 'Lucas', 'M', 4),
(8, '1985-08-02', 'NIEPMANN', 'Simon', 'M', 4),
(9, '1985-05-02', 'GYR', 'Mario', 'M', 4),
(10, '1988-09-21', 'BARSOE', 'Jacob', 'M', 5),
(11, '1985-06-23', 'JORGENSEN', 'Morten', 'M', 5),
(12, '1987-12-15', 'BAROUKH', 'Thomas', 'M', 6),
(13, '1986-06-29', 'RAINEAU', 'Guillaume', 'M', 6),
(14, '1984-09-10', 'SOLFOROSI', 'Franck', 'M', 6),
(15, '1993-06-15', 'MARIN', 'Carolina', 'F', 7),
(16, '1995-07-05', 'PUSARLA', 'V.Sindhu', 'F', 8),
(17, '1995-03-13', 'OKUHARA', 'Nozumi', 'F', 9),
(18, '1990-08-13', 'COUSINS', 'DeMarcus', 'M', 2),
(19, '1988-07-21', 'JORDAN', 'DeAndre', 'M', 2),
(20, '1992-03-23', 'IRVING', 'Kyrie', 'M', 2),
(21, '1986-03-25', 'LOWRY', 'Kyle', 'M', 2),
(22, '1989-09-14', 'BUTLER', 'Jimmy', 'M', 2),
(23, '1989-08-07', 'DEROZAN', 'DeMar', 'M', 2),
(24, '1990-02-08', 'THOMPSON', 'Klay', 'M', 2),
(25, '1984-05-29', 'ANTHONY', 'Carmelo', 'M', 2),
(26, '1992-03-30', 'BARNES', 'Harrison', 'M', 2),
(27, '1988-09-29', 'DURANT', 'Kevin', 'M', 2),
(28, '1990-05-02', 'GEORGE', 'Paul', 'M', 2),
(29, '1990-03-04', 'GREEN', 'Draymond', 'M', 2),
(30, '1981-09-28', 'CALDERON', 'José', 'M', 7),
(31, '1986-06-12', 'RODRIGUEZ', 'Sergio', 'M', 7),
(32, '1990-10-21', 'RUBIO', 'Ricky', 'M', 7),
(33, '1993-08-01', 'ABRINES', 'Alex', 'M', 7),
(34, '1985-04-04', 'FERNANDEZ', 'Rudy', 'M', 7),
(35, '1987-11-15', 'LLULL', 'Sergio', 'M', 7),
(36, '1980-06-13', 'NAVARRO', 'Juan Carlos', 'M', 7),
(37, '1988-08-30', 'CLAVER', 'Victor', 'M', 7),
(38, '1980-07-06', 'GASOL', 'Pau', 'M', 7),
(39, '1994-05-27', 'HERNANGOMEZ', 'Willy', 'M', 7),
(40, '1991-02-11', 'MIROTIC', 'Nikola', 'M', 7),
(41, '1980-03-06', 'REYES', 'Felipe', 'M', 7),
(42, '1988-11-05', 'BOREL', 'Yannick', 'M', 6),
(43, '1984-05-29', 'GRUMIER', 'Gauthier', 'M', 6),
(44, '1991-06-04', 'JERENT', 'Daniel', 'M', 6),
(45, '1978-04-25', 'LUCENAY', 'Jean-Michel', 'M', 6),
(46, '1993-06-03', 'SANTARELLI', 'Andrea', 'M', 10),
(47, '1983-04-04', 'PIZZO', 'Paolo', 'M', 10),
(48, '1993-04-15', 'FICHERA', 'Marco', 'M', 10),
(49, '1989-06-21', 'GAROZZO', 'Enrico', 'M', 10),
(50, '1974-12-23', 'IMRE', 'Geza', 'M', 11),
(51, '1977-04-01', 'BOCZKO', 'Gabor', 'M', 11),
(52, '1983-10-21', 'REDLI', 'Andras', 'M', 11),
(53, '1980-04-02', 'SOMFAI', 'Peter', 'M', 11),
(54, '1997-03-14', 'BILES', 'Simone', 'F', 2),
(55, '1994-05-25', 'RAISMAN', 'Alexandra', 'F', 2),
(56, '1980-09-30', 'MUSTAFINA', 'Aliya', 'F', 12),
(57, '1995-12-31', 'DOUGLAS', 'Gabby', 'F', 2),
(58, '1997-06-15', 'KOCIAN', 'Madison', 'F', 2),
(59, '2000-06-09', 'HERNANDEZ', 'Lauren', 'F', 2),
(60, '2000-07-18', 'MELNIKOVA', 'Angelina', 'F', 12),
(61, '1995-09-19', 'PASEKA', 'Maria', 'F', 12),
(62, '1998-09-08', 'SPIRIDONOVA', 'Daria', 'F', 12),
(63, '1999-09-15', 'TUTKHALIAN', 'Seda', 'F', 12),
(64, '1999-11-11', 'YILIN', 'Fan', 'F', 13),
(65, '1999-09-16', 'YIN', 'Mao', 'F', 13),
(66, '1996-09-03', 'JIAXIN', 'Tan', 'F', 13),
(67, '1996-03-18', 'CHUNSONG', 'Shang', 'F', 13),
(68, '1999-10-30', 'YAN', 'Wang', 'F', 13);

INSERT INTO sport VALUES
(1, 'Athlétisme - 100m hommes'),
(2, 'Athlétisme - 100m femmes'),
(3, 'Aviron - Quatre en pointe sans barreur poids légers (4-) hommes'),
(4, 'Badminton - simple femmes'),
(5, 'Basketball - hommes'),
(6, 'Escrime - épée par équipes hommes'),
(7, 'Gymnastique Artistique - Concours multiple individuel femmes'),
(8, 'Gymnastique Artistique - Concours multiple par équipes femmes');

INSERT INTO equipe VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1),
(4, 1, 2),
(5, 1, 2),
(6, 1, 2),
(7, 3, 3),
(8, 2, 3),
(9, 3, 3),
(10, 1, 4),
(11, 1, 4),
(12, 1, 4),
(13, 12, 5),
(14, 12, 5),
(15, 4, 6),
(16, 4, 6),
(17, 4, 6),
(18, 1, 7),
(19, 1, 7),
(20, 1, 7),
(21, 5, 8),
(22, 5, 8),
(23, 5, 8);

INSERT INTO composition_equipe VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(7, 8),
(7, 9),
(8, 10),
(8, 11),
(9, 12),
(9, 13),
(9, 14),
(10, 15),
(11, 16),
(12, 17),
(13, 18),
(13, 19),
(13, 20),
(13, 21),
(13, 22),
(13, 23),
(13, 24),
(13, 25),
(13, 26),
(13, 27),
(13, 28),
(13, 29),
(14, 30),
(14, 31),
(14, 32),
(14, 33),
(14, 34),
(14, 35),
(14, 36),
(14, 37),
(14, 38),
(14, 39),
(14, 40),
(14, 41),
(15, 42),
(15, 43),
(15, 44),
(15, 45),
(16, 46),
(16, 47),
(16, 48),
(16, 49),
(17, 50),
(17, 51),
(17, 52),
(17, 53),
(18, 54),
(19, 55),
(20, 56),
(21, 57),
(21, 55),
(21, 54),
(21, 58),
(21, 59),
(22, 60),
(22, 56),
(22, 61),
(22, 62),
(22, 63),
(23, 64),
(23, 65),
(23, 66),
(23, 67),
(23, 68);
