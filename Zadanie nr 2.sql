SELECT * FROM sakila.film;
-- replacement_cost 25-30, posortowany po rental_rate rosnąco, tylko 100 rekordów
-- 1 krok 
SELECT * FROM sakila.film where replacement_cost between 25 and 30;
-- 2 krok 
SELECT * FROM sakila.film where replacement_cost between 25 and 30 order by rental_rate asc;
-- 3 krok 
SELECT * FROM sakila.film where replacement_cost between 25 and 30 order by rental_rate asc limit 100;
