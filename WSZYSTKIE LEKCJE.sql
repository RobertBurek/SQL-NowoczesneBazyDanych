-- Sortowanie ORDER BY

SELECT * FROM sakila.film;
SELECT title FROM sakila.film order by title asc;
SELECT title FROM sakila.film order by title desc;
SELECT title, replacement_cost FROM sakila.film order by title desc;
SELECT title, replacement_cost FROM sakila.film order by replacement_cost desc, title;
SELECT title, replacement_cost,rental_rate FROM sakila.film order by replacement_cost desc,rental_rate, title;
SELECT title, replacement_cost,rental_rate FROM sakila.film order by rental_rate desc,replacement_cost, title;

-- Aliasy AS

SELECT * FROM sakila.film;
SELECT title, release_year, rental_rate, replacement_cost FROM sakila.film;
SELECT title, release_year, rental_rate, replacement_cost FROM sakila.film order by replacement_cost;
SELECT title as tytuł, release_year as 'rok wydania', rental_rate as 'koszt wyp', replacement_cost as zakup FROM sakila.film order by replacement_cost;
SELECT title tytuł, release_year 'rok wydania', rental_rate 'koszt wyp', replacement_cost zakup FROM sakila.film order by zakup;

-- Filtrowanie WHERE

SELECT * FROM sakila.film;
SELECT title, rental_rate FROM sakila.film;
SELECT title, rental_rate FROM sakila.film where rental_rate < 3;
SELECT title, rental_rate FROM sakila.film where rental_rate < 3 order by rental_rate;
SELECT title, rental_rate FROM sakila.film where rental_rate = 3 order by rental_rate;
SELECT title, rental_rate FROM sakila.film where rental_rate = 2.99 order by rental_rate;
SELECT 
    title, rental_rate
FROM
    sakila.film
WHERE
    rental_rate > 1 AND rental_rate < 5
ORDER BY rental_rate DESC;

-- Wyszukiwanie LIKE oraz IN

SELECT * FROM sakila.film;
SELECT title, description  FROM sakila.film where description like '%drama%';
SELECT title, description  FROM sakila.film where description like '%Epic%';
SELECT title, description  FROM sakila.film where description like '%Epic drama%';
SELECT title, description  FROM sakila.film where description like '%Epic drama%' order by title;
SELECT title, description, rating  FROM sakila.film where rating in ('G','Pg') order by rating;
SELECT title, description, rating  FROM sakila.film where rating in ('g','Pg') order by rating;
SELECT title, description, rating  FROM sakila.film where rating in ('G','pg') order by rating;

-- Zakres BETWEEN AND

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

-- Dodawanie do tabeli  INSERT INTO oraz VALUES

SELECT * FROM sakila.actor;
INSERT INTO sakila.actor values (201, 'Bogusław', 'Linda', '2019-08-11 16:09:00');
describe sakila.actor;
INSERT INTO sakila.actor(first_name, last_name) values ('KRYSTYNA', 'JANDA');
INSERT INTO sakila.actor(actor_id, first_name, last_name) values (202,'BEATA', 'FIDO');
INSERT INTO sakila.actor(actor_id, first_name, last_name) values (200, 'Marta', 'ŻAK');
INSERT INTO sakila.actor(actor_id, first_name, last_name) values (203, 'Marta', 'ŻAK');
INSERT INTO sakila.actor(first_name, last_name) value ('ROBERT', 'BUREK');

-- Modyfikacja rekordu UPDATE

SELECT * FROM sakila.actor;
SELECT * FROM sakila.actor where last_name='LINDA'; -- aby uzyskać id rekordu
UPDATE sakila.actor SET first_name='BOGUSŁAW' where actor_id=201;
UPDATE sakila.actor SET last_name='LINDA' where actor_id=201;
-- sformatowany zapis
UPDATE sakila.actor 
SET 
    first_name = 'POLA',
    last_name = 'RAKSA'
WHERE
    actor_id = 203;
-- ***********************

-- Usuwanie rekordu DELETE

SELECT * FROM sakila.actor;
SELECT * FROM sakila.actor where actor_id = 202;
DELETE FROM sakila.actor where actor_id = 202;
DELETE FROM sakila.actor where actor_id > 200;

-- Zadanie nr 1

SELECT * FROM sakila.customer;
-- wyszukaj klientów sklepu 2 nieaktywnych 0 
SELECT * FROM sakila.customer where store_id = 2 and active = 0;

-- Zadanie nr 2

SELECT * FROM sakila.film;
-- replacement_cost 25-30, posortowany po rental_rate rosnąco, tylko 100 rekordów
-- 1 krok 
SELECT * FROM sakila.film where replacement_cost between 25 and 30;
-- 2 krok 
SELECT * FROM sakila.film where replacement_cost between 25 and 30 order by rental_rate asc;
-- 3 krok 
SELECT * FROM sakila.film where replacement_cost between 25 and 30 order by rental_rate asc limit 100;

-- Zadanie nr 3

SELECT * FROM sakila.country;
--  zamienić POLAND na POLSKA w dwuch SQL, wyszukujący i zmieniający
 SELECT * FROM sakila.country where country = 'Poland';
 UPDATE country set country = 'Polska' where country_id = 76;

-- Zadanie nr 4

SELECT * FROM sakila.city;
-- dopisz do tabeli swoje miasto upewniając się jakie informacje są konieczne
DESCRIBE city;
INSERT INTO sakila.city(city, country_id) VALUES ('Warszawa', 76);
select * FROM sakila.city where country_id = 76;

-- Tworzenie bazy  CREATE DATABASE oraz DROP

CREATE SCHEMA `test`;
create database testnowy;
USE test;
DROP database testnowy;
DROP database test;

-- Tworzenie tabel  CREATE TABLE

SELECT * FROM sakila.actor;use testowa;
CREATE TABLE `kursant` (
  `kursant_id` int,
  `imie` varchar(15),
  `nazwisko` varchar(80),
  `kurs` varchar(5)
) 
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_polish_ci;

DROP TABLE IF EXISTS kursant;
SHOW CREATE TABLE kursant;
SHOW TABLE STATUS;

CREATE TABLE `testowa`.`kursantki` (
  `kursantki_id` INT NULL,
  `imie` VARCHAR(15) NULL,
  `nazwisko` VARCHAR(120) NULL,
  `kurs` VARCHAR(5) NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_polish_ci;

SHOW TABLE STATUS;

-- Ustawianie indeksów INDEX

INSERT INTO kursantki(kursantki_id,imie,nazwisko,kurs) VALUES (1,'Ala','Nowak','AB123');
INSERT INTO kursantki(kursantki_id,imie,nazwisko,kurs) VALUES (2,'Ewa','Kowalska','CD456');
INSERT INTO kursantki(kursantki_id,imie,nazwisko,kurs) VALUES (3,'Ola','Żółta','EF789');

SELECT * FROM testowa.kursantki;
DESCRIBE kursantki;

SHOW INDEXES FROM kursantki;
SHOW create TABLE kursantki;

DROP table kursantki;

CREATE TABLE `kursantki` (
  `kursantki_id` int(11) DEFAULT NULL,
  `imie` varchar(15) COLLATE utf8_polish_ci DEFAULT NULL,
  `nazwisko` varchar(120) COLLATE utf8_polish_ci DEFAULT NULL,
  `kurs` varchar(5) COLLATE utf8_polish_ci DEFAULT NULL,
  INDEX nauka(nazwisko, kurs)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

SHOW INDEXES FROM kursantki;

-- Ograniczenia dla danych  NOT NULL UNIQUE DEFAULT 

SELECT * FROM testowa.kursantki;
INSERT INTO kursantki(nazwisko) VALUES ('Nowa');

describe kursantki; 

show create table kursantki;
drop table if exists kursantki;

CREATE TABLE `kursantki` (
  `kursantki_id` int(11) not null unique,
  `imie` varchar(15) not null,
  `nazwisko` varchar(120) not null,
  `kurs` varchar(5) default 'AB000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

INSERT INTO kursantki(kursantki_id,nazwisko,imie,kurs) VALUES (1,'Nowak', 'Ala','AB123');
INSERT INTO kursantki(kursantki_id,imie,nazwisko) VALUES (2,'Ewa','Kowalska');
INSERT INTO kursantki(kurs,kursantki_id,imie,nazwisko) VALUES ('EF789',3,'Ola','Żółta');

show indexes from kursantki;

-- Klucz obcy FOREGN KEY REFERENCES

drop table if exists nauka;
drop table if exists kursantki;
drop table if exists kursy;

CREATE TABLE `kursantki` (
  `kursantki_id` int AUTO_INCREMENT PRIMARY KEY,
  `imie` varchar(15) NOT NULL,
  `nazwisko` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

INSERT INTO kursantki(nazwisko,imie) VALUES ('Nowak', 'Ala');
INSERT INTO kursantki(imie,nazwisko) VALUES ('Ewa','Kowalska');
INSERT INTO kursantki(imie,nazwisko) VALUES ('Ola','Żółta');
INSERT INTO kursantki(imie,nazwisko) VALUES ('Wiola','Nowakowska');

CREATE TABLE `kursy` (
  `kurs_id` int AUTO_INCREMENT PRIMARY KEY,
  `nazwa` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

INSERT INTO kursy(nazwa) VALUES ('C++');
INSERT INTO kursy(nazwa) VALUES ('C#');
INSERT INTO kursy(nazwa) VALUES ('PHP');
INSERT INTO kursy(nazwa) VALUES ('Java');

CREATE TABLE `nauka` (
  `nauka_id` int AUTO_INCREMENT PRIMARY KEY,
  `kursantki_id` int,
  `kurs_id` int,
  FOREIGN KEY(kursantki_id) REFERENCES kursantki(kursantki_id),
  FOREIGN KEY(kurs_id) REFERENCES kursy(kurs_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

INSERT INTO nauka(kursantki_id, kurs_id) VALUES (1,1);
INSERT INTO nauka(kursantki_id, kurs_id) VALUES (1,4);
INSERT INTO nauka(kursantki_id, kurs_id) VALUES (2,2);
INSERT INTO nauka(kursantki_id, kurs_id) VALUES (3,4);
INSERT INTO nauka(kursantki_id, kurs_id) VALUES (4,3);
INSERT INTO nauka(kursantki_id, kurs_id) VALUES (4,4);

SELECT * FROM testowa.kursantki;
SELECT * FROM testowa.kursy;
SELECT * FROM testowa.nauka;

SELECT 
    nauka.nauka_id, 
    kursantki.imie, 
    kursantki.nazwisko, 
    kursy.nazwa
FROM
    nauka
        LEFT JOIN
    kursantki ON nauka.kursantki_id = kursantki.kursantki_id
        LEFT JOIN
    kursy ON nauka.kurs_id = kursy.kurs_id;

--  Modyfikacja kolumn ALTER TABLE

ALTER TABLE kursantki ADD wiek INT;

ALTER TABLE kursantki DROP wiek;

ALTER TABLE kursantki ADD klasa VARCHAR(5) DEFAULT 'AC01' AFTER kursantki_id;

SELECT * FROM testowa.kursantki;

-- Zadanie nr 5

DROP DATABASE IF EXISTS zadania;
CREATE SCHEMA zadania;
USE zadania;
CREATE TABLE memo(
memo_id SERIAL,
tytul VARCHAR(150) NOT NULL,
wpis TEXT NOT NULL,
termin DATETIME NOT NULL,
dodanie TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

INSERT INTO memo(tytul, wpis, termin) VALUES ('Urodziny Babci', 'Kupić kwiatki oraz torcik Wedlowski', '2019-06-17 16:00:00');
INSERT INTO memo(tytul, wpis, termin) VALUES ('Urodziny Dziadka', 'Kupić dwa piwa i karkówkę', '2019-08-19 17:00:00');

SELECT * FROM memo;

-- Typy liczbowe

CREATE TABLE liczby(
a INT,
b INT,
c FLOAT,
d FLOAT,
e DOUBLE,
f DOUBLE,
g DECIMAL(4,2),
h DECIMAL(4,2)
);

INSERT INTO liczby VALUES(1, 2, 1.1, 2.2, 1.1, 2.2, 1.1, 2.2);

SELECT * FROM liczby;

SELECT a+b FROM liczby;
SELECT a+b, c+d, e+f, g+h FROM liczby;
SELECT a+b=3, a+b>3, a+b<3 FROM liczby;
SELECT c+d=3.3, c+d>3.3, c+d<3.3 FROM liczby;
SELECT e+f=3.3, e+f>3.3, e+f<3.3 FROM liczby;
SELECT g+h=3.3, g+h>3.3, g+h<3.3 FROM liczby;

-- Typ TIMESTAMP

SHOW VARIABLES LIKE '%time_zone%';
SELECT NOW();
DROP TABLE IF EXISTS towary;

CREATE TABLE towary(
id SERIAL,
nazwa VARCHAR(255),
przyjecie TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO towary(nazwa) VALUES ('Mleko');
INSERT INTO towary(nazwa) VALUES ('Ser');
INSERT INTO towary(nazwa) VALUES ('Jogurt');
INSERT INTO towary(nazwa) VALUES ('Kefir');

SELECT * FROM towary;

UPDATE towary SET nazwa = 'Jogurt Truskawkowy' WHERE id = 3;

SELECT * FROM towary;

-- Typ ENUM oraz SET

DROP TABLE IF EXISTS zapas;

CREATE TABLE zapas(
id SERIAL,
nazwa VARCHAR(100),
stan ENUM('wysoki','sredni','niski') DEFAULT 'niski'
--    index  1         2        3
);

INSERT INTO zapas(nazwa, stan) VALUES ('Mleko', 'wysoki');
INSERT INTO zapas(nazwa, stan) VALUES ('Ser', 'sredni');
INSERT INTO zapas(nazwa) VALUES ('Jogurt');
INSERT INTO zapas(nazwa, stan) VALUES ('Kefir', 'wysoki');

SELECT * FROM zapas;

-- INSERT INTO zapas(nazwa, stan) VALUES ('Serek', 'jakis');
INSERT INTO zapas(nazwa, stan) VALUES ('Serek', 2);

DROP TABLE IF EXISTS magazyn;

CREATE TABLE magazyn(
id SERIAL,
nazwa VARCHAR(100),
alejka SET('biala','czerwona','zielona') DEFAULT 'biala'
--    index   1         2        4
--    index  |----3---|    
--    index   |---------5-------|
--    index            |---6---|
--    index   |-------7|--------|
);

INSERT INTO magazyn(nazwa, alejka) VALUES ('Mleko', 'czerwona');
INSERT INTO magazyn(nazwa, alejka) VALUES ('Ser', 'zielona');
INSERT INTO magazyn(nazwa) VALUES ('Jogurt');
INSERT INTO magazyn(nazwa, alejka) VALUES ('Kefir', 'czerwona,zielona');
INSERT INTO magazyn(nazwa, alejka) VALUES ('Kefir owocowy', 7);

SELECT * FROM magazyn;

-- Funkcje SQL - tekstowe

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

-- Funkcje SQL - matematyczne

SELECT 2+3, 5-3, 4*3, 24/2, 10/3;

SELECT POWER(2, 3);
SELECT POW(2, 3);

SELECT SQRT(4), SQRT(16), SQRT(2);

SELECT 4 % 2, 5 MOD 2, 8 MOD 5;
SELECT ABS(-34);

SELECT SIGN(-5), SIGN(-10), SIGN(0), SIGN(5), SIGN(10);

SELECT CONV(21, 10, 2);
SELECT CONV(10101, 2, 10);
SELECT POW(2,0)+POW(2,2)+POW(2,4);

SELECT PI();

SELECT SQRT(2), ROUND(SQRT(2), 7);
SELECT SQRT(2), TRUNCATE(SQRT(2), 7);

SELECT CEIL(1.7136);
SELECT FLOOR(1.9999);

SELECT RAND();
SELECT RAND(7);

-- Funkcje SQL - daty i czasu

SELECT NOW(), CURRENT_TIMESTAMP(), UNIX_TIMESTAMP();

SELECT DAYNAME(NOW()), DAYOFMONTH(NOW()), DAYOFWEEK(NOW()), DAYOFYEAR(NOW());

SELECT MONTH(NOW()), MONTHNAME(NOW());

SELECT TIME_TO_SEC('00:10:00');
SELECT TIME_TO_SEC('01:21:12');
SELECT SEC_TO_TIME(4872);

SELECT ADDTIME('01:59:30','01:03:54');
SELECT SUBTIME('01:59:30','01:03:54');

SELECT ADDDATE('2019-04-20',INTERVAL 45 DAY);
SELECT ADDDATE(NOW(),INTERVAL 45 DAY);

SELECT SUBDATE('2019-04-20',INTERVAL 109 DAY);
SELECT SUBDATE(NOW(),INTERVAL 83 DAY);

-- Funkcje SQL - format daty i czasu

SELECT NOW();

SELECT DATE_FORMAT(NOW(), '%T');
SELECT DATE_FORMAT(NOW(), '%r');
SELECT DATE_FORMAT(NOW(), '%H : %i : %s');
SELECT DATE_FORMAT(NOW(), '%w - %W');
SELECT DATE_FORMAT(NOW(), '%W %D of %M %Y ');

SHOW VARIABLES LIKE '%lc_time_names%';  -- en_US
SET lc_time_names = 'pl_PL';
SELECT DATE_FORMAT(NOW(), '%W %d %M %Y ');
SELECT DATE_FORMAT('2019-07-15', '%W %d %M %Y ');

-- Funkcje SQL - agregujące

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

-- Funkcje SQL - warunkowa CASE

SELECT 
    imie,
    CASE imie
        WHEN 'OLA' THEN 'to jest Ola'
        ELSE 'to nie jest Ola'
    END AS Ola,
    CASE imie
        WHEN 'EWA' THEN 'to jest Ewa'
        ELSE 'to nie jest Ewa'
    END AS Ewa,
    CASE imie
        WHEN 'Ala' THEN 'to jest Ala'
        ELSE 'to nie jest Ale'
    END AS Ala
FROM
    testowa.kursantki;

-- Zadanie nr 6

INSERT INTO zadania.memo(tytul, wpis, termin) VALUES ('Urodziny MAMY', 'Kupić kwiatki, posprzątac mieszkanie', ADDDATE(NOW(), 60));
INSERT INTO zadania.memo(tytul, wpis, termin) VALUES ('Urodziny MAMY', 'Kupić kwiatki, posprzątac mieszkanie', ADDDATE(NOW(), INTERVAL 60 DAY));

SELECT * FROM zadania.memo;

-- Transakcje TRANSACTION

-- ALTER TABLE testowa.towary ADD stan INT NOT NULL DEFAULT 30;

-- CREATE TABLE testowa.sprzedaz(
-- id SERIAL,
-- id_tow INT,
-- sztuk INT,
-- cena INT
-- );

SELECT * FROM testowa.sprzedaz;

START TRANSACTION;
	INSERT INTO testowa.sprzedaz(id_tow, sztuk, cena) VALUES (1, 5, 23);
	UPDATE testowa.towary SET stan = stan - 5 WHERE id = 1;
-- COMMIT;  --  gdy nie chcesz zamykać transakcji i móc ją cofnąć komendą ROLLBACK

ROLLBACK; -- cofnięcie transakcji jeszcze nie zapisanej przez COMMIT

SELECT * FROM testowa.towary;

-- Restrykcyjne wyzwalacze TRIGGER

-- ALTER TABLE sprzedaz ADD blokada INT DEFAULT 1;

 
DELIMITER $$ IF NOT exists trigger aktualizacjaSprzedazy;
CREATE TRIGGER aktualizacjaSprzedazy BEFORE UPDATE ON sprzedaz
     FOR EACH ROW 
 		BEGIN
 			IF(SELECT blokada FROM sprzedaz WHERE id = NEW.id)>0 THEN
 				SIGNAL SQLSTATE '45000' SET message_text = 'Błąd: nie można zaktualizować rekordu';
 			END IF;
 		END $$
DELIMITER ;

SELECT * FROM testowa.sprzedaz;

-- INSERT INTO testowa.sprzedaz(id_tow, sztuk, cena, kursantki_id, blokada) VALUES (1, 2, 15, 3, 0);

START TRANSACTION;
	UPDATE sprzedaz SET sztuk = 66 WHERE id = 9;
COMMIT;

SELECT * FROM testowa.sprzedaz;

-- Wyzwalacz jako system logów

USE testowa;

DROP TABLE IF EXISTS zdarzenia;

CREATE TABLE zdarzenia(
id SERIAL,
czas TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
wydarzenia VARCHAR(255),
uzytkownik VARCHAR(255),
tablica VARCHAR(255),
rekord_id BIGINT
);

DROP TRIGGER IF EXISTS nowaSprzedaz;

DELIMITER $$
	CREATE TRIGGER nowaSprzedaz AFTER INSERT ON sprzedaz
    FOR EACH ROW
    BEGIN
		UPDATE kursantki SET ostatni_zakup_id = new.id WHERE kursantki_id = new.kursantki_id;
		INSERT INTO zdarzenia(wydarzenia, uzytkownik, tablica, rekord_id) VALUES ('insert', 'trigger', 'sprzedaz', NEW.id);
    END $$
DELIMITER ;

SELECT * FROM zdarzenia;
SELECT * FROM sprzedaz;
INSERT INTO sprzedaz(id_tow, sztuk, cena, kursantki_id, blokada) VALUES (1, 555, 20, 4, 0);
SELECT * FROM kursantki;

-- Zadanie nr 7

SELECT * FROM zadania.memo;
USE zadania;
-- ALTER TABLE memo ADD zrobione INT not null DEFAULT 0;

DROP TABLE IF EXISTS sukcesy;

CREATE TABLE sukcesy(
id SERIAL,
tytul VARCHAR(150),
opis text,
kiedy TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
id_memo INT
);

SELECT * FROM sukcesy;

DROP TRIGGER IF EXISTS zrobioneMemo;

DELIMITER $$
CREATE TRIGGER zrobioneMemo AFTER UPDATE ON memo
     FOR EACH ROW 
 		BEGIN
 			IF(SELECT zrobione FROM memo WHERE memo_id = NEW.memo_id)=1 THEN
 				INSERT INTO sukcesy(tytul, opis, id_memo) VALUES (NEW.tytul, New.wpis, NEW.memo_id);
 			END IF;
 		END $$
DELIMITER ;

UPDATE memo SET zrobione = 1 WHERE memo_id = 3;
SELECT * FROM sukcesy;
SELECT * FROM memo;

-- Podzapytanie - wstęp

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

-- Podzapytanie - rozwinięcie LEFT JOIN

USE sakila;

SELECT * FROM sakila.film WHERE length<50;
SELECT * FROM sakila.film_actor;

SELECT * FROM actor WHERE actor_id IN(SELECT actor_id FROM film_actor WHERE film_id In(SELECT film_id FROM film WHERE length<50)) ;


SELECT a.first_name, a.last_name, f.title 
FROM film_actor AS tk 
	LEFT JOIN film AS f ON tk.film_id = f.film_id 
    LEFT JOIN actor AS a ON tk.actor_id = a.actor_id 
WHERE f.length<50;

-- Podzapytanie - LEFT i RIGHT JOIN

SELECT * FROM world.city;
SELECT * FROM world.country;
SELECT * FROM world.countrylanguage;

SELECT * FROM world.country WHERE code='POL';
SELECT ci.Name, ci.Population, co.Name FROM country AS co LEFT JOIN city AS ci ON ci.CountryCode = co.Code WHERE co.Code='Pol';
SELECT ci.Name, ci.Population, co.Name FROM country AS co RIGHT JOIN city AS ci ON ci.CountryCode = co.Code WHERE co.Code='Pol';

SELECT ci.Name, ci.Population, co.Name FROM country AS co LEFT JOIN city AS ci ON ci.CountryCode = co.Code;
SELECT ci.Name, ci.Population, co.Name FROM country AS co RIGHT JOIN city AS ci ON ci.CountryCode = co.Code;

-- Widoki VIEW

USE world;

DROP VIEW IF EXISTS PozycjaPKB;

CREATE VIEW PozycjaPKB AS
SELECT 
    GNP AS PKB,
    Name AS Kraj,
    Continent AS Kontynent,
    Population AS Ludność,
    SurfaceArea AS Powierzchnia,
    LifeExpectancy AS DługośćŻycia
FROM
    country
ORDER BY PKB DESC;

SELECT * FROM world.pozycjapkb;
SET @nr := 0;
SELECT @nr := @nr + 1 AS id, pkb, kraj, długośćżycia FROM world.pozycjapkb;

SELECT * FROM pozycjapkb WHERE Kontynent = 'EUROPE' ORDER BY długośćżycia DESC;
SELECT * FROM pozycjapkb WHERE Kontynent = 'EUROPE' ORDER BY długośćżycia>79;


-- Widoki VIEW cd

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

-- Zadanie nr 8

USE world;
SELECT * FROM world.countrylanguage;
SELECT * FROM world.country;

Drop VIEW IF EXISTS Języki;

CREATE VIEW Języki AS
	SELECT 
		c.Name AS Kraj, 
        cl.Language AS Język, 
        cl.IsOfficial AS Oficjalny, 
        cl.Percentage AS Procent
FROM countrylanguage AS cl 
	LEFT JOIN country AS c ON cl.countryCode=c.Code;

SELECT c.Name, cl.Language, cl.IsOfficial, cl.Percentage FROM countrylanguage AS cl LEFT JOIN country AS c ON cl.countryCode=c.Code WHERE c.Name='Poland';

SELECT * FROM Języki;

-- Własne PROCEDURY

USE world;
SELECT * FROM country;

DROP PROCEDURE IF EXISTS Państwa;

DELIMITER $$
CREATE PROCEDURE Państwa()
BEGIN
	SELECT * FROM country;
END $$
DELIMITER ;

call Państwa();

DROP PROCEDURE IF EXISTS Kraj;

DELIMITER $$
CREATE PROCEDURE Kraj(IN kod VARCHAR(3))  -- , OUT wyjscie TEXT
BEGIN
	SELECT CONCAT(Name, ' ', Continent, ' ', Region) AS Kraj FROM country WHERE Code=kod;
    SET @wyjscie := 'ZROBIONE';
END $$
DELIMITER ;

call Kraj('aia');
call Kraj('pol');

-- Własne FUNKCJE

DROP FUNCTION IF EXISTS witaj;

DELIMITER $$
CREATE FUNCTION witaj()
RETURNS text
DETERMINISTIC
BEGIN
	RETURN 'Witaj w kursie SQL';
END 
$$
DELIMITER ;

select witaj() AS Powitanie;


DROP FUNCTION IF EXISTS witajUczestnik;

DELIMITER $$
CREATE FUNCTION witajUczestnik( imie VARCHAR(20) )
RETURNS text
DETERMINISTIC
BEGIN
	RETURN CONCAT('Witaj ', imie, ' w kursie SQL!!!');
END 
$$
DELIMITER ;

select witajUczestnik('Robert') AS Powitanie;


DROP FUNCTION IF EXISTS brutto;

DELIMITER $$
CREATE FUNCTION brutto( Cena_Netto DOUBLE)
RETURNS text
DETERMINISTIC
BEGIN
	DECLARE podatek double;
	DECLARE cena_brutto DECIMAL(5,2);
    SET podatek = 23;
    SET cena_brutto = cena_netto * ((podatek/100)+1);
	RETURN CONCAT('Cena netto: ', cena_netto, ' zł, podatek: ', podatek, '%, cena brutto: ', cena_brutto, ' zł.');
END 
$$
DELIMITER ;

select brutto(25.85) AS Brutto;