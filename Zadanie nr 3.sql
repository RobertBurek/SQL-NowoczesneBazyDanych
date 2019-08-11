SELECT * FROM sakila.country;
--  zamienić POLAND na POLSKA w dwuch SQL, wyszukujący i zmieniający
 SELECT * FROM sakila.country where country = 'Poland';
 UPDATE country set country = 'Polska' where country_id = 76;