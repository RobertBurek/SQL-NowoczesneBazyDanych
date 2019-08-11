SELECT * FROM sakila.film;
SELECT title FROM sakila.film where title like 'b%';
SELECT title FROM sakila.film where title like '_a%';
SELECT title FROM sakila.film where title like '__a%';
SELECT title FROM sakila.film where title like 'a%' or title like'b%';
SELECT title FROM sakila.film where title like 'a%' or title like'b%' or title like'c%';
SELECT title FROM sakila.film where title regexp '^[a-c]';
SELECT title FROM sakila.film where title regexp '^.[a-e]';
SELECT title FROM sakila.film where title regexp '^..[a-e]';
SELECT title FROM sakila.film where title regexp 'w$';
SELECT title FROM sakila.film where title regexp 'a.c';
SELECT title FROM sakila.film where title regexp '^a.c';
SELECT title FROM sakila.film where title regexp '[[:space:]]';
SELECT title FROM sakila.film where title regexp '[[.~.]]';
SELECT title FROM sakila.film where title regexp '[[.tilde.]]'; -- coś nie tak
SELECT title FROM sakila.film WHERE title REGEXP '[[.apostrophe.]]'; -- coś nie tak
SELECT title FROM sakila.film WHERE title REGEXP '^[a-k]';
SELECT title FROM sakila.film WHERE title REGEXP '^[^a-k]';
SELECT title FROM sakila.film WHERE title REGEXP '^[^a-x]';
SELECT title FROM sakila.film WHERE title rlike '^[^a-x]';