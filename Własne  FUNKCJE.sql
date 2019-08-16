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