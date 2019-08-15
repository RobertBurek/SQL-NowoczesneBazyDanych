INSERT INTO zadania.memo(tytul, wpis, termin) VALUES ('Urodziny MAMY', 'Kupić kwiatki, posprzątac mieszkanie', ADDDATE(NOW(), 60));
INSERT INTO zadania.memo(tytul, wpis, termin) VALUES ('Urodziny MAMY', 'Kupić kwiatki, posprzątac mieszkanie', ADDDATE(NOW(), INTERVAL 60 DAY));

SELECT * FROM zadania.memo;