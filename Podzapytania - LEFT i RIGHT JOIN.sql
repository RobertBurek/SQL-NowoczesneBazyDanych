SELECT * FROM world.city;
SELECT * FROM world.country;
SELECT * FROM world.countrylanguage;

SELECT * FROM world.country WHERE code='POL';
SELECT ci.Name, ci.Population, co.Name FROM country AS co LEFT JOIN city AS ci ON ci.CountryCode = co.Code WHERE co.Code='Pol';
SELECT ci.Name, ci.Population, co.Name FROM country AS co RIGHT JOIN city AS ci ON ci.CountryCode = co.Code WHERE co.Code='Pol';

SELECT ci.Name, ci.Population, co.Name FROM country AS co LEFT JOIN city AS ci ON ci.CountryCode = co.Code;
SELECT ci.Name, ci.Population, co.Name FROM country AS co RIGHT JOIN city AS ci ON ci.CountryCode = co.Code;