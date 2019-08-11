SELECT * FROM sakila.actor;use testowa;
CREATE TABLE `kursant` (
  `kursant_id` int,
  `imie` varchar(15),
  `nazwisko` varchar(80),
  `kurs` varchar(5)
) 
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_polish_ci;

DROP TABLE IF EXISTS kursant;
SHOW CREATE TABLE kursant;
SHOW TABLE STATUS;

CREATE TABLE `testowa`.`kursantki` (
  `kursantki_id` INT NULL,
  `imie` VARCHAR(15) NULL,
  `nazwisko` VARCHAR(120) NULL,
  `kurs` VARCHAR(5) NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_polish_ci;

SHOW TABLE STATUS;