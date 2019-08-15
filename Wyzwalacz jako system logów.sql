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