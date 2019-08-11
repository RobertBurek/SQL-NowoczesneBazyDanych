SELECT * FROM sakila.customer;
-- wyszukaj klientów sklepu 2 nieaktywnych 0 
SELECT * FROM sakila.customer where store_id = 2 and active = 0;
