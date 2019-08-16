USE world;
SELECT * FROM country;

DROP PROCEDURE IF EXISTS Państwa;

DELIMITER $$
CREATE PROCEDURE Państwa()
BEGIN
	SELECT * FROM country;
END $$
DELIMITER ;

call Państwa();

DROP PROCEDURE IF EXISTS Kraj;

DELIMITER $$
CREATE PROCEDURE Kraj(IN kod VARCHAR(3))  -- , OUT wyjscie TEXT
BEGIN
	SELECT CONCAT(Name, ' ', Continent, ' ', Region) AS Kraj FROM country WHERE Code=kod;
    SET @wyjscie := 'ZROBIONE';
END $$
DELIMITER ;

call Kraj('aia');
call Kraj('pol');