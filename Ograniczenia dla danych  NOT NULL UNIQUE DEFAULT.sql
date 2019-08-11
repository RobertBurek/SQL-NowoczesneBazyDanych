SELECT * FROM testowa.kursantki;
INSERT INTO kursantki(nazwisko) VALUES ('Nowa');

describe kursantki; 

show create table kursantki;
drop table if exists kursantki;

CREATE TABLE `kursantki` (
  `kursantki_id` int(11) not null unique,
  `imie` varchar(15) not null,
  `nazwisko` varchar(120) not null,
  `kurs` varchar(5) default 'AB000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

INSERT INTO kursantki(kursantki_id,nazwisko,imie,kurs) VALUES (1,'Nowak', 'Ala','AB123');
INSERT INTO kursantki(kursantki_id,imie,nazwisko) VALUES (2,'Ewa','Kowalska');
INSERT INTO kursantki(kurs,kursantki_id,imie,nazwisko) VALUES ('EF789',3,'Ola','Żółta');

show indexes from kursantki;