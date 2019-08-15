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