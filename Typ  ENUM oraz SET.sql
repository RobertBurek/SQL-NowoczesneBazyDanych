DROP TABLE IF EXISTS zapas;

CREATE TABLE zapas(
id SERIAL,
nazwa VARCHAR(100),
stan ENUM('wysoki','sredni','niski') DEFAULT 'niski'
--    index  1         2        3
);

INSERT INTO zapas(nazwa, stan) VALUES ('Mleko', 'wysoki');
INSERT INTO zapas(nazwa, stan) VALUES ('Ser', 'sredni');
INSERT INTO zapas(nazwa) VALUES ('Jogurt');
INSERT INTO zapas(nazwa, stan) VALUES ('Kefir', 'wysoki');

SELECT * FROM zapas;

-- INSERT INTO zapas(nazwa, stan) VALUES ('Serek', 'jakis');
INSERT INTO zapas(nazwa, stan) VALUES ('Serek', 2);

DROP TABLE IF EXISTS magazyn;

CREATE TABLE magazyn(
id SERIAL,
nazwa VARCHAR(100),
alejka SET('biala','czerwona','zielona') DEFAULT 'biala'
--    index   1         2        4
--    index  |----3---|    
--    index   |---------5-------|
--    index            |---6---|
--    index   |-------7|--------|
);

INSERT INTO magazyn(nazwa, alejka) VALUES ('Mleko', 'czerwona');
INSERT INTO magazyn(nazwa, alejka) VALUES ('Ser', 'zielona');
INSERT INTO magazyn(nazwa) VALUES ('Jogurt');
INSERT INTO magazyn(nazwa, alejka) VALUES ('Kefir', 'czerwona,zielona');
INSERT INTO magazyn(nazwa, alejka) VALUES ('Kefir owocowy', 7);

SELECT * FROM magazyn;