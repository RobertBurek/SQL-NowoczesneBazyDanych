SELECT * FROM sakila.film;
SELECT title, release_year, rental_rate, replacement_cost FROM sakila.film;
SELECT title, release_year, rental_rate, replacement_cost FROM sakila.film order by replacement_cost;
SELECT title as tytuł, release_year as 'rok wydania', rental_rate as 'koszt wyp', replacement_cost as zakup FROM sakila.film order by replacement_cost;
SELECT title tytuł, release_year 'rok wydania', rental_rate 'koszt wyp', replacement_cost zakup FROM sakila.film order by zakup;