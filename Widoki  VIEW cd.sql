USE sakila;
SELECT * FROM sakila.customer;
SELECT * FROM sakila.payment;

DROP VIEW IF EXISTS Płatności;

CREATE VIEW Płatności AS
SELECT
	CONCAT(c.first_name, ' ', c.last_name) AS Klient,
    SUM(p.amount) AS Zapłacił,
    AVG(p.amount) AS Średnia
FROM
	payment AS p, customer AS c
WHERE
	c.customer_id=p.customer_id
GROUP BY 
	c.customer_id
ORDER BY Zapłacił DESC;

SELECT * FROM płatności;
SELECT * FROM płatności WHERE Zapłacił>=170;
SELECT * FROM płatności WHERE klient='MARY SMITH';
SELECT * FROM płatności WHERE klient LIKE '%MARION%';