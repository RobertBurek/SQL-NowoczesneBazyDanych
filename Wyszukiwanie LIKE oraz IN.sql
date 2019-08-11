SELECT * FROM sakila.film;
SELECT title, description  FROM sakila.film where description like '%drama%';
SELECT title, description  FROM sakila.film where description like '%Epic%';
SELECT title, description  FROM sakila.film where description like '%Epic drama%';
SELECT title, description  FROM sakila.film where description like '%Epic drama%' order by title;
SELECT title, description, rating  FROM sakila.film where rating in ('G','Pg') order by rating;
SELECT title, description, rating  FROM sakila.film where rating in ('g','Pg') order by rating;
SELECT title, description, rating  FROM sakila.film where rating in ('G','pg') order by rating;