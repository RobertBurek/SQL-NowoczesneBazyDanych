SELECT * FROM sakila.film;
SELECT title, rental_rate FROM sakila.film;
SELECT title, rental_rate FROM sakila.film where rental_rate < 3;
SELECT title, rental_rate FROM sakila.film where rental_rate < 3 order by rental_rate;
SELECT title, rental_rate FROM sakila.film where rental_rate = 3 order by rental_rate;
SELECT title, rental_rate FROM sakila.film where rental_rate = 2.99 order by rental_rate;
SELECT 
    title, rental_rate
FROM
    sakila.film
WHERE
    rental_rate > 1 AND rental_rate < 5
ORDER BY rental_rate DESC;