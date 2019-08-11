SELECT * FROM sakila.rental;
SELECT rental_id,return_date FROM rental; -- domyślnie ustawiona baza
SELECT rental_id,return_date FROM rental where return_date between '2005-06-30' and '2005-07-30'; 
SELECT rental_id,return_date FROM rental where return_date between '2005-06-30' and '2005-07-30' order by return_date; 
-- sformatowany zapis -- miotła 
SELECT 
    rental_id, return_date
FROM
    rental
WHERE
    return_date BETWEEN '2005-06-30 13:00:00' AND '2005-07-15 12:00:15'
ORDER BY return_date; 


-- zmieniamy tabelę w bazie 
SELECT * from customer;
SELECT first_name,last_name from customer;
SELECT first_name,last_name from customer where last_name between 'D' and 'E' order by last_name;
-- przedział domknięty wyświetli tylko 'D' 
SELECT first_name,last_name from customer where last_name between 'D' and 'f' order by last_name;
SELECT first_name,last_name from customer where left(last_name, 1) between 'D' and 'e' order by last_name;
-- pierwszy od lewej znak ma spełniać warunek od 'D' do 'E' 