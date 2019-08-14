SELECT NOW(), CURRENT_TIMESTAMP(), UNIX_TIMESTAMP();

SELECT DAYNAME(NOW()), DAYOFMONTH(NOW()), DAYOFWEEK(NOW()), DAYOFYEAR(NOW());

SELECT MONTH(NOW()), MONTHNAME(NOW());

SELECT TIME_TO_SEC('00:10:00');
SELECT TIME_TO_SEC('01:21:12');
SELECT SEC_TO_TIME(4872);

SELECT ADDTIME('01:59:30','01:03:54');
SELECT SUBTIME('01:59:30','01:03:54');

SELECT ADDDATE('2019-04-20',INTERVAL 45 DAY);
SELECT ADDDATE(NOW(),INTERVAL 45 DAY);

SELECT SUBDATE('2019-04-20',INTERVAL 109 DAY);
SELECT SUBDATE(NOW(),INTERVAL 83 DAY);
