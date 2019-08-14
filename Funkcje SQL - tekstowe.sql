SELECT * FROM sakila.film ORDER BY title;

SELECT LENGTH('Robert');

SELECT title, LENGTH(title) AS Length FROM sakila.film ORDER BY Length DESC;

SELECT LENGTH('zolty');
SELECT CHAR_LENGTH('żółty');

SELECT title, LEFT(title, 7) FROM sakila.film;
SELECT title, LEFT(title, 7), MID(title, 3, 7), RIGHT(title, 7) FROM sakila.film;

SELECT RIGHT(CONCAT(title, ' / ', release_year,' / ', length), 16) FROM sakila.film;
SELECT RIGHT(CONCAT_WS(' - ', title, release_year, length), 16) FROM sakila.film;

SELECT LOCATE('finger', 'goldfinger');
SELECT title, LOCATE('finger', title) FROM sakila.film WHERE title LIKE '%finger%';
SELECT title, LOCATE('Rob', title) FROM sakila.film WHERE title LIKE '%Rob%';

SELECT 'Robert Burek', REVERSE('Robert Burek');
SELECT title, REVERSE(title) FROM sakila.film;

SELECT description, UPPER(description) FROM sakila.film;