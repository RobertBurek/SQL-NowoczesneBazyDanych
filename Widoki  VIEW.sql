USE world;

DROP VIEW IF EXISTS PozycjaPKB;

CREATE VIEW PozycjaPKB AS
SELECT 
    GNP AS PKB,
    Name AS Kraj,
    Continent AS Kontynent,
    Population AS Ludność,
    SurfaceArea AS Powierzchnia,
    LifeExpectancy AS DługośćŻycia
FROM
    country
ORDER BY PKB DESC;

SELECT * FROM world.pozycjapkb;
SET @nr := 0;
SELECT @nr := @nr + 1 AS id, pkb, kraj, długośćżycia FROM world.pozycjapkb;

SELECT * FROM pozycjapkb WHERE Kontynent = 'EUROPE' ORDER BY długośćżycia DESC;
SELECT * FROM pozycjapkb WHERE Kontynent = 'EUROPE' ORDER BY długośćżycia>79;

