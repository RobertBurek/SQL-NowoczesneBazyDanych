SELECT * FROM sakila.city;
-- dopisz do tabeli swoje miasto upewniając się jakie informacje są konieczne
DESCRIBE city;
INSERT INTO sakila.city(city, country_id) VALUES ('Warszawa', 76);
select * FROM sakila.city where country_id = 76;