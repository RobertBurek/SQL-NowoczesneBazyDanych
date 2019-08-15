SELECT * FROM sakila.payment;

SELECT COUNT(*) FROM sakila.payment;
SELECT COUNT(*) FROM sakila.payment WHERE customer_id = 1;
SELECT COUNT(*), MIN(amount), MAX(amount) FROM sakila.payment WHERE customer_id = 1;
SELECT COUNT(*), MIN(amount), MAX(amount), SUM(amount) FROM sakila.payment WHERE customer_id = 1;
SELECT COUNT(*), MIN(amount), MAX(amount), SUM(amount), SUM(amount)/COUNT(*) FROM sakila.payment WHERE customer_id = 1;
SELECT COUNT(*), MIN(amount), MAX(amount), SUM(amount), AVG(amount) FROM sakila.payment WHERE customer_id = 1;

SELECT COUNT(*), MIN(amount), MAX(amount), SUM(amount), AVG(amount), STD(amount) FROM sakila.payment WHERE customer_id = 1;

SELECT * FROM sakila.address;
SELECT COUNT(*), COUNT(address2) FROM sakila.address;

SELECT COUNT(DISTINCT(district)) FROM sakila.address;
SELECT district, COUNT(*) AS licznik FROM sakila.address GROUP BY district ORDER BY licznik DESC;
SELECT district AS D FROM sakila.address GROUP BY district ORDER BY D DESC;
SELECT DISTINCT(district) AS D FROM sakila.address ORDER BY D DESC;

SELECT district, COUNT(*) AS licznik FROM sakila.address GROUP BY district ORDER BY licznik DESC;  -- GOIS 5
SELECT GROUP_CONCAT(address SEPARATOR ' | ') FROM sakila.address WHERE district = 'GOIS';
SELECT GROUP_CONCAT(address SEPARATOR ' | '), COUNT(district) AS C FROM sakila.address GROUP BY district ORDER BY C DESC;
SELECT GROUP_CONCAT(address SEPARATOR ' | '), COUNT(district) AS C, district FROM sakila.address GROUP BY district ORDER BY C DESC;
SELECT district, GROUP_CONCAT(address ORDER BY district SEPARATOR ' | ') FROM sakila.address GROUP BY district;
