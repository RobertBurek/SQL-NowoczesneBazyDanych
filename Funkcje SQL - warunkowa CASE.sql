SELECT 
    imie,
    CASE imie
        WHEN 'OLA' THEN 'to jest Ola'
        ELSE 'to nie jest Ola'
    END AS Ola,
    CASE imie
        WHEN 'EWA' THEN 'to jest Ewa'
        ELSE 'to nie jest Ewa'
    END AS Ewa,
    CASE imie
        WHEN 'Ala' THEN 'to jest Ala'
        ELSE 'to nie jest Ale'
    END AS Ala
FROM
    testowa.kursantki;