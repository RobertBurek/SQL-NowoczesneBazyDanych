USE sakila;
SELECT customer_id FROM customer WHERE last_name='SMITH';

SELECT amount FROM payment WHERE customer_id=1;
SELECT SUM(amount) FROM payment WHERE customer_id=1;
SELECT SUM(amount), AVG(amount) FROM payment WHERE customer_id=1;

SELECT SUM(amount), AVG(amount) FROM payment WHERE customer_id IN(SELECT customer_id FROM customer WHERE last_name='SMITH');
SELECT SUM(amount), AVG(amount) FROM payment WHERE customer_id IN(SELECT customer_id FROM customer WHERE first_name='MARION');
SELECT customer_id, SUM(amount), AVG(amount) FROM payment WHERE customer_id IN(SELECT customer_id FROM customer WHERE first_name='MARION');
SELECT customer_id, SUM(amount), AVG(amount) FROM payment WHERE customer_id IN(SELECT customer_id FROM customer WHERE first_name='MARION') GROUP BY customer_id;

SELECT * FROM sakila.payment;