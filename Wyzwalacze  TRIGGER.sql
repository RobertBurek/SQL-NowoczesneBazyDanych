USE testowa;

ALTER TABLE testowa.kursantki ADD ostatni_zakup_id INT;
SELECT * FROM testowa.kursantki;

ALTER TABLE testowa.sprzedaz ADD kursantki_id INT;
SELECT * FROM testowa.sprzedaz;

CREATE 
    TRIGGER  nowaSprzedaz
 AFTER INSERT ON sprzedaz FOR EACH ROW 
    UPDATE kursantki SET ostatni_zakup_id = new.id WHERE
        kursantki_id = new.kursantki_id;
        
-- DELIMITER $$
-- USE `testowa`$$
-- DROP TRIGGER IF EXISTS `testowa`.`nowaSprzedaz` $$
-- DELIMITER ;
        
INSERT INTO testowa.sprzedaz(id_tow, sztuk, cena, kursantki_id) VALUES (1, 2, 15, 3);
SELECT * FROM testowa.sprzedaz;
SELECT * FROM testowa.kursantki;