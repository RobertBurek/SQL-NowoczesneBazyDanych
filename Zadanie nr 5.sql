DROP DATABASE IF EXISTS zadania;
CREATE SCHEMA zadania;
USE zadania;
CREATE TABLE memo(
memo_id SERIAL,
tytul VARCHAR(150) NOT NULL,
wpis TEXT NOT NULL,
termin DATETIME NOT NULL,
dodanie timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

INSERT INTO memo(tytul, wpis, termin) VALUES ('Urodziny Babci', 'Kupić kwiatki oraz torcik Wedlowski', '2019-06-17 16:00:00');
INSERT INTO memo(tytul, wpis, termin) VALUES ('Urodziny Dziadka', 'Kupić dwa piwa i karkówkę', '2019-08-19 17:00:00');

SELECT * FROM memo;