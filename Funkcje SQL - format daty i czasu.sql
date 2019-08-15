SELECT NOW();

SELECT DATE_FORMAT(NOW(), '%T');
SELECT DATE_FORMAT(NOW(), '%r');
SELECT DATE_FORMAT(NOW(), '%H : %i : %s');
SELECT DATE_FORMAT(NOW(), '%w - %W');
SELECT DATE_FORMAT(NOW(), '%W %D of %M %Y ');

SHOW VARIABLES LIKE '%lc_time_names%';  -- en_US
SET lc_time_names = 'pl_PL';
SELECT DATE_FORMAT(NOW(), '%W %d %M %Y ');
SELECT DATE_FORMAT('2019-07-15', '%W %d %M %Y ');
