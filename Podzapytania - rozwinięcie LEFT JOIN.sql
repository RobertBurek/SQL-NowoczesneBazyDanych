USE sakila;

SELECT * FROM sakila.film WHERE length<50;
SELECT * FROM sakila.film_actor;

SELECT * FROM actor WHERE actor_id IN(SELECT actor_id FROM film_actor WHERE film_id In(SELECT film_id FROM film WHERE length<50)) ;


SELECT a.first_name, a.last_name, f.title 
FROM film_actor AS tk 
	LEFT JOIN film AS f ON tk.film_id = f.film_id 
    LEFT JOIN actor AS a ON tk.actor_id = a.actor_id 
WHERE f.length<50;