SELECT * FROM sakila.film;
SELECT title FROM sakila.film order by title asc;
SELECT title FROM sakila.film order by title desc;
SELECT title, replacement_cost FROM sakila.film order by title desc;
SELECT title, replacement_cost FROM sakila.film order by replacement_cost desc, title;
SELECT title, replacement_cost,rental_rate FROM sakila.film order by replacement_cost desc,rental_rate, title;
SELECT title, replacement_cost,rental_rate FROM sakila.film order by rental_rate desc,replacement_cost, title;