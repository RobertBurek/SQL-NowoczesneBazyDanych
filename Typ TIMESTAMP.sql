SHOW VARIABLES LIKE '%time_zone%';
SELECT NOW();
DROP TABLE IF EXISTS towary;

CREATE TABLE towary(
id SERIAL,
nazwa VARCHAR(255),
przyjecie TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO towary(nazwa) VALUES ('Mleko');
INSERT INTO towary(nazwa) VALUES ('Ser');
INSERT INTO towary(nazwa) VALUES ('Jogurt');
INSERT INTO towary(nazwa) VALUES ('Kefir');

SELECT * FROM towary;

UPDATE towary SET nazwa = 'Jogurt Truskawkowy' WHERE id = 3;

SELECT * FROM towary;