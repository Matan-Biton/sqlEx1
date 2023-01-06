-- this file was used to create the database and all the table in it

CREATE DATABASE sqlEx1;

CREATE TABLE actor (
actorNum INTEGER PRIMARY KEY,
firstName VARCHAR(255),
surName VARCHAR(255),
dateOfBirth DATE
);

CREATE TABLE director (
directorNum INTEGER PRIMARY KEY,
firstName VARCHAR(255),
surName VARCHAR(255)
);

CREATE TABLE film (
filmNum INTEGER PRIMARY KEY,
filmName VARCHAR(255),
releasedYear INTEGER,
directorNum INTEGER,
FOREIGN KEY (directorNum) REFERENCES director(directorNum)
);

CREATE TABLE actedIn (
  actorNum INTEGER,
  filmNum INTEGER,
  movieRole VARCHAR(255),
  PRIMARY KEY (actorNum, filmNum),
  FOREIGN KEY (actorNum) REFERENCES actor(actorNum),
  FOREIGN KEY (filmNum) REFERENCES film(filmNum)
);

CREATE TABLE organization (
organizationCode INTEGER PRIMARY KEY,
organizationName VARCHAR(255)
);

CREATE TABLE award (
  organizationCode INTEGER,
  awardName VARCHAR(255),
  awardRank INTEGER,
  PRIMARY KEY (organizationCode, awardName),
  FOREIGN KEY (organizationCode) REFERENCES organization(organizationCode)
);

CREATE TABLE won (
organizationCode INTEGER,
awardName VARCHAR(255),
actorNum INTEGER,
filmNum INTEGER,
awardYear INTEGER,
FOREIGN KEY (organizationCode, awardName) REFERENCES award(organizationCode, awardName),
FOREIGN KEY (actorNum, filmNum) REFERENCES actedIn(actorNum, filmNum)
);

INSERT INTO actor (actorNum, firstName, surName, dateOfBirth)
VALUES
(1, 'Tom', 'Hanks', '1956-07-09'),
(2, 'Meryl', 'Streep', '1949-06-22'),
(3, 'Denzel', 'Washington', '1954-12-28'),
(4, 'Julia', 'Roberts', '1967-10-28'),
(5, 'Leonardo', 'DiCaprio', '1974-11-11');

INSERT INTO director (directorNum, firstName, surName)
VALUES
(1, 'Steven', 'Spielberg'),
(2, 'Martin', 'Scorsese'),
(3, 'Quentin', 'Tarantino'),
(4, 'Christopher', 'Nolan'),
(5, 'Ava', 'DuVernay');

INSERT INTO film (filmNum, filmName, releasedYear, directorNum)
VALUES
(1, 'Saving Private Ryan', 1998, 1),
(2, 'The Departed', 2006, 2),
(3, 'Pulp Fiction', 1994, 3),
(4, 'Inception', 2023, 4),
(5, 'Selma', 2023, 5),
(6, 'Saving Private Ryan', 2010, 1);

INSERT INTO actedIn (actorNum, filmNum, movieRole)
VALUES
(1, 1, 'Soldier'),
(2, 2, 'Criminal'),
(3, 3, 'Police'),
(4, 4, 'Mia Wallace'),
(5, 5, 'Detective');

INSERT INTO organization (organizationCode, organizationName)
VALUES
(1, 'Academy of Motion Picture Arts and Sciences'),
(2, 'Golden Globe Awards'),
(3, 'Screen Actors Guild'),
(4, 'British Academy of Film and Television Arts'),
(5, 'Cannes Film Festival');

INSERT INTO award (organizationCode, awardName, awardRank)
VALUES
(1, 'Best actor', 1),
(2, 'Best actress', 1),
(3, 'Best supporting actor', 2),
(4, 'Best supporting actress', 2),
(5, 'Best picture', 1);

INSERT INTO won (organizationCode, awardName, actorNum, filmNum, awardYear)
VALUES
(1, 'Best actor', 1, 1, 1999),
(2, 'Best actress', 2, 2, 2007),
(3, 'Best supporting actor', 3, 3, 1995),
(4, 'Best supporting actress', 4, 4, 2011),
(5, 'Best picture', 5, 5, 2015);