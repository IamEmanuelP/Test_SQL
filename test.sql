SELECT * FROM film;

/* 
Modify 2 films records values
*/
UPDATE film 
SET title = 'INTERSTELLAR', description = 'Travel beewten the space', release_year = 2014, rating = 'PG-13', language_id = 2
WHERE film_id=1;

UPDATE film 
SET title = 'IT', description = 'A group of bullied kids band together to ddestroy a shape-shifting monster', release_year = 2017, rating = 'NC-17'
WHERE title='AIRPLANE SIERRA';

SELECT * FROM film_actor;
SELECT * FROM actor;

/* 
List of movie by actor
*/
SELECT actor.first_name,actor.last_name,title
FROM actor
INNER JOIN film_actor 
ON actor.actor_id=film_actor.actor_id
INNER JOIN film
ON film_actor.film_id=film.film_id;

/* 
Count number of movies per actor 
*/

SELECT actor.first_name,actor.last_name,
count(film_actor.actor_id) AS Num_of_Films
FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id
GROUP BY film_actor.actor_id;


/* 
Count movie language
*/
SELECT * FROM language;
SELECT * FROM film;
SELECT COUNT(*) FROM language;

SELECT language.name,
count(language.name) AS Languages
FROM language
INNER JOIN film
ON language.language_id = film.language_id
GROUP BY film.language_id;

/* 
Calculate average cost for replacement of a film
*/
SELECT * FROM film;
SELECT AVG (replacement_cost) AS Average
FROM film;

/* 
Do a store procedure to update the film
SQL

CREATE PROCEDURE update_film( @title varchar(20), @film_id int)
AS
UPDATE film 
SET title = @title
WHERE film_id = @film,_id
GO;

EXECUTE new_procedure();
*/

/* 
Do a store procedure to update the film
MYSQL

Si se ejecuta desde StoredProcedures si lo ejecuta, pero aqui en el script no se por que me sale un error en el END
*/
CREATE DEFINER=`root`@`%` PROCEDURE `update_film`()
BEGIN
	UPDATE film 
	SET title = 'IT', description = 'A group of bullied kids band together to ddestroy a shape-shifting monster', release_year = 2017, rating = 'NC-17'
	WHERE title="ALABAMA DEVIL";
END

CALL update_film();








