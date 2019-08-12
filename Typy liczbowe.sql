CREATE TABLE liczby(
a INT,
b INT,
c FLOAT,
d FLOAT,
e DOUBLE,
f DOUBLE,
g DECIMAL(4,2),
h DECIMAL(4,2)
);

INSERT INTO liczby VALUES(1, 2, 1.1, 2.2, 1.1, 2.2, 1.1, 2.2);

SELECT * FROM liczby;

SELECT a+b FROM liczby;
SELECT a+b, c+d, e+f, g+h FROM liczby;
SELECT a+b=3, a+b>3, a+b<3 FROM liczby;
SELECT c+d=3.3, c+d>3.3, c+d<3.3 FROM liczby;
SELECT e+f=3.3, e+f>3.3, e+f<3.3 FROM liczby;
SELECT g+h=3.3, g+h>3.3, g+h<3.3 FROM liczby;

