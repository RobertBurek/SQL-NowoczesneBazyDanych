SELECT * FROM sakila.actor;
INSERT INTO sakila.actor values (201, 'Bogusław', 'Linda', '2019-08-11 16:09:00');
describe sakila.actor;
INSERT INTO sakila.actor(first_name, last_name) values ('KRYSTYNA', 'JANDA');
INSERT INTO sakila.actor(actor_id, first_name, last_name) values (202,'BEATA', 'FIDO');
INSERT INTO sakila.actor(actor_id, first_name, last_name) values (200, 'Marta', 'ŻAK');
INSERT INTO sakila.actor(actor_id, first_name, last_name) values (203, 'Marta', 'ŻAK');
INSERT INTO sakila.actor(first_name, last_name) value ('ROBERT', 'BUREK');