-- q1
SELECT firstName, surName FROM actor 
WHERE dateOfBirth >= '1975-01-01' ORDER BY firstName ASC, surName ASC

-- q2
SELECT actor.* FROM actor inner join director 
on actor.firstName = director.firstName AND actor.surName = director.surName

-- q3
SELECT DISTINCT actor.actorNum FROM actor inner join actedIn 
on actor.actorNum = actedIn.actorNum inner join film 
on actedIn.filmNum = film.filmNum inner join director 
on film.directorNum = director.directorNum
where film.releasedYear BETWEEN 2000 and 2010 
AND director.firstName = 'Francis' AND director.surName = 'Kopola'

-- q4
SELECT organizationCode, awardName FROM award 
where awardRank = (SELECT max(awardRank) FROM award)

-- q5
SELECT director.* FROM director inner join 
(SELECT directorNum, COUNT(*) FROM film GROUP BY filmName, directorNum HAVING COUNT(*) >= 2) as modFilm 
on director.directorNum = modFilm.directorNum

-- q6
SELECT director.* FROM director inner join film 
on director.directorNum = film.directorNum inner join actedIn 
on film.filmNum = actedIn.filmNum 
WHERE actedIn.movieRole ilike '%Police%' or actedIn.movieRole ilike '%detective%'

-- q7
SELECT actor.* FROM actor inner join actedIn 
on actor.actorNum = actedIn.actorNum inner join film 
on actedIn.filmNum = film.filmNum 
where film.releasedYear = (SELECT EXTRACT(YEAR FROM CURRENT_TIMESTAMP)) 
ORDER BY actor.dateOfBirth ASC LIMIT 1

