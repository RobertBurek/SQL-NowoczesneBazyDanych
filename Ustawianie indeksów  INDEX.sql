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