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