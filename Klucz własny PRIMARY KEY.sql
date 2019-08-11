SELECT * FROM testowa.kursantki;
describe kursantki;

SHOW CREATE TABLE kursantki;
DROP TABLE kursantki;

CREATE TABLE `kursantki` (
  `kursantki_id` int(11) AUTO_INCREMENT PRIMARY KEY,
  `imie` varchar(15) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(120) COLLATE utf8_polish_ci NOT NULL,
  `kurs` varchar(5) COLLATE utf8_polish_ci DEFAULT 'AB000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

INSERT INTO kursantki(kursantki_id,nazwisko,imie,kurs) VALUES (1,'Nowak', 'Ala','AB123');
INSERT INTO kursantki(kursantki_id,imie,nazwisko) VALUES (2,'Ewa','Kowalska');
INSERT INTO kursantki(kurs,kursantki_id,imie,nazwisko) VALUES ('EF789',3,'Ola','Żółta');
INSERT INTO kursantki(kurs,imie,nazwisko) VALUES ('EF789','Wiola','Nowak');

DROP TABLE kursantki;

CREATE TABLE `kursantki` (
  `kursantki_id` SERIAL,
  `imie` varchar(15) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(120) COLLATE utf8_polish_ci NOT NULL,
  `kurs` varchar(5) COLLATE utf8_polish_ci DEFAULT 'AB000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

INSERT INTO kursantki(kursantki_id,nazwisko,imie,kurs) VALUES (1,'Nowak', 'Ala','AB123');
INSERT INTO kursantki(kursantki_id,imie,nazwisko) VALUES (2,'Ewa','Kowalska');
INSERT INTO kursantki(kurs,kursantki_id,imie,nazwisko) VALUES ('EF789',3,'Ola','Żółta');
INSERT INTO kursantki(kurs,imie,nazwisko) VALUES ('EF789','Wiola','Nowak');
INSERT INTO kursantki(kurs,imie,nazwisko) VALUES ('EF789','Wiola','Nowak');
INSERT INTO kursantki(kurs,imie,nazwisko) VALUES ('EF789','Wiola','Nowak');