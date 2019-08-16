USE world;
SELECT * FROM world.countrylanguage;
SELECT * FROM world.country;

Drop VIEW IF EXISTS Języki;

CREATE VIEW Języki AS
	SELECT 
		c.Name AS Kraj, 
        cl.Language AS Język, 
        cl.IsOfficial AS Oficjalny, 
        cl.Percentage AS Procent
FROM countrylanguage AS cl 
	LEFT JOIN country AS c ON cl.countryCode=c.Code;

SELECT c.Name, cl.Language, cl.IsOfficial, cl.Percentage FROM countrylanguage AS cl LEFT JOIN country AS c ON cl.countryCode=c.Code WHERE c.Name='Poland';

SELECT * FROM Języki;