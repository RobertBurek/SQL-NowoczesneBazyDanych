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