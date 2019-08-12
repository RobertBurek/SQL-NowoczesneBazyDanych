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
