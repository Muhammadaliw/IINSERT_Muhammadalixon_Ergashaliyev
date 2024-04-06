-- Choose one of your favorite films and add it to the "film" table. Fill in rental rates with 4.99 and rental durations with 2 weeks.
INSERT INTO "film" 
	("title", "description", "release_year",
	"language_id", "rental_duration", "rental_rate", 
	"length", "replacement_cost", "rating")
SELECT 
	'Meg' AS "title",
	'The biggest shark on earth' AS "description",
	2017 AS "release_year",
	1 AS "language_id",
	10 AS "rental_duration",
	5.59 AS "rental_rate",
	200 AS "length",
	40.59 AS "replacement_cost",
	'PG' AS "rating";

-- Add the actors who play leading roles in your favorite film to the "actor" and "film_actor" tables (three or more actors in total).

INSERT INTO "actor" ("first_name", "last_name")
SELECT * FROM (
    VALUES 
        ('John', 'Week'),
        ('Mark', 'Pho'),
        ('Simth', 'George'),
        ('Erik', 'Robertson')
) AS actors ("first_name", "last_name");


INSERT INTO "film_actor" ("actor_id", "film_id")
SELECT 
    a."actor_id",
    f."film_id"
FROM 
    "actor" AS a
JOIN 
    "film" AS f
ON 
    f."title" = 'Meg'
WHERE 
    a."first_name" IN ('John', 'Mark', 'Simth', 'Erik');


-- Add your favorite movies to any store's inventory.

INSERT INTO "inventory" ("film_id", "store_id")
SELECT 
    "film_id",
    1
FROM 
    "film"
WHERE 
    "title" = 'Meg';


SELECT film.title, inventory.store_id, actor.first_name ||' '|| actor.last_name AS fullname
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
JOIN inventory ON film.film_id = inventory.film_id
WHERE film.title LIKE '%Me%';