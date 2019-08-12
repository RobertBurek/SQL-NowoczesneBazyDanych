ALTER TABLE kursantki ADD wiek INT;

ALTER TABLE kursantki DROP wiek;

ALTER TABLE kursantki ADD klasa VARCHAR(5) DEFAULT 'AC01' AFTER kursantki_id;

SELECT * FROM testowa.kursantki;