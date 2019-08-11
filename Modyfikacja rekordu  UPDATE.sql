SELECT * FROM sakila.actor;
SELECT * FROM sakila.actor where last_name='LINDA'; -- aby uzyskać id rekordu
UPDATE sakila.actor SET first_name='BOGUSŁAW' where actor_id=201;
UPDATE sakila.actor SET last_name='LINDA' where actor_id=201;
-- sformatowany zapis
UPDATE sakila.actor 
SET 
    first_name = 'POLA',
    last_name = 'RAKSA'
WHERE
    actor_id = 203;
-- ***********************

