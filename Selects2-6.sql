-- Consultes sobre una taula
-- 90% han de estar OK per superar la tasca.
-- (9 consultes de 10 han d’estar OK).

-- Retorna un llistat amb totes les comandes que s'han realitzat. Les comandes han d'estar ordenats per la data de realització, mostrant en primer lloc les comandes més recents.
select * from pedido order by fecha desc;

-- Retorna totes les dades de les dues comandes de major valor.
select * from pedido order by cantidad desc limit 2;

-- Retorna un llistat amb els identificadors dels clients que han realitzat alguna comanda. Tingui en compte que no ha de mostrar identificadors que estiguin repetits.

SELECT cliente.id
FROM cliente
INNER JOIN pedido
ON cliente.id = pedido.id_cliente
group by id;

-- Retorna un llistat de totes les comandes que es van realitzar durant l'any 2017, la quantitat total del qual sigui superior a 500€.
select * from pedido where fecha between '2017-01-01' and '2017-12-31' and cantidad > 500;

-- Retorna un llistat amb el nom i els cognoms dels comercials que tenen una comissió entre 0.05 i 0.11.

select nombre, apellido1, apellido2 from comercial where comision between 0.05 and 0.11;

-- Retorna el valor de la comissió de major valor que existeix en la taula comercial.
select max(comision) from comercial;

-- Retorna l'identificador, nom i primer cognom d'aquells clients el segon cognom dels quals no és NULL. El llistat haurà d'estar ordenat alfabèticament per cognoms i nom.
select id,nombre,apellido1,apellido2 from cliente where apellido2 is not null order by apellido1 asc, nombre;

-- Retorna un llistat dels noms dels clients que comencen per “a” i acaben per “n” i també els noms que comencen per P. El llistat haurà d'estar ordenat alfabèticament.
select nombre from cliente where nombre like 'a%n' or nombre like 'p%' order by nombre asc;

-- Retorna un llistat dels noms dels clients que no comencen per “a”. El llistat haurà d'estar ordenat alfabèticament.
select nombre from cliente where nombre not like 'a%' order by nombre asc;

-- Retorna un llistat amb els noms dels comercials que acaben per “el” o “o”. Tingui en compte que s'hauran d'eliminar els noms repetits.
select nombre from comercial where nombre like '%el' or nombre like'%o' group by nombre;

-- Consultes multitaula
-- (Cada consulta OK val 0,5 punts. Tota 4 punts).

-- Retorna un llistat amb l'identificador, nom i els cognoms de tots els clients que han realitzat alguna comanda. El llistat ha d'estar ordenat alfabèticament i s'han d'eliminar els elements repetits.
SELECT cliente.id, cliente.nombre, cliente.apellido1, cliente.apellido2
FROM cliente
INNER JOIN pedido
ON cliente.id = pedido.id_cliente
group by id;

-- Retorna un llistat que mostri totes les comandes que ha realitzat cada client . El resultat ha de mostrar totes les dades de les comandes i del client. El llistat ha de mostrar les dades dels clients ordenats alfabèticament.
SELECT *
FROM pedido
INNER JOIN cliente
ON cliente.id = pedido.id_cliente
order by cliente.nombre;

-- Retorna un llistat que mostri totes les comandes en els quals ha participat un comercial. El resultat ha de mostrar totes les dades de les comandes i dels comercials. El llistat ha de mostrar les dades dels comercials ordenats alfabèticament.
select * from pedido 
inner join comercial
on pedido.id_comercial = comercial.id
order by comercial.nombre asc;

-- Retorna un llistat que mostri tots els clients, amb totes les comandes que han realitzat i amb les dades dels comercials associats a cada comanda.
select * from cliente
inner join pedido 
on cliente.id = pedido.id_cliente
inner join comercial
on pedido.id_comercial = comercial.id;

-- Retorna un llistat de tots els clients que no han realitzat cap comanda durant l'any 2017.

select * from cliente
inner join pedido
on cliente.id = pedido.id_cliente
where pedido.fecha not like '2017%';

-- Retorna un llistat de tots els clients que van realitzar una comanda durant l'any 2017, la quantitat del qual estigui entre 300 € i 1000 €.
select * from cliente
inner join pedido
on cliente.id = pedido.id_cliente
where pedido.fecha like '2017%' and
cantidad between 300 and 1000;

-- Retorna el nom i els cognoms de tots els comercials que ha participat en alguna comanda realitzada per María Santana Moreno.
select comercial.nombre, comercial.apellido1, comercial.apellido2 from comercial
inner join pedido
on comercial.id = pedido.id_comercial
inner join cliente
on cliente.id = pedido.id_cliente
where cliente.nombre = 'María' and cliente.apellido1 = 'Santana' and cliente.apellido2 = 'Moreno';

-- Retorna el nom de tots els clients que han realitzat alguna comanda amb el comercial Daniel Sáez Vega.
select * from cliente
inner join pedido
on cliente.id = pedido.id_cliente
inner join comercial
on comercial.id = pedido.id_comercial
where comercial.nombre = 'Daniel' and comercial.apellido1 = 'Sáez' and comercial.apellido2 = 'Vega';

-- 03 --
-- Consultas multi taula

-- 1
-- Retorna un llistat amb tots els clients juntament amb les dades de les comandes que han realitzat. 
-- Aquest llistat també ha d'incloure els clients que no han realitzat cap comanda. 
-- El llistat ha d'estar ordenat alfabèticament pel primer cognom, segon cognom i nom dels clients.
select * from cliente
left join pedido
on cliente.id = pedido.id_cliente
order by cliente.apellido1 asc, apellido2;
-- 2
-- Retorna un llistat amb tots els clients residents a “Granada” juntament amb les dades de les comandes que han realitzat. 
-- Aquest llistat també ha d'incloure els clients que no han realitzat cap comanda. 
-- El llistat ha d'estar ordenat alfabèticament pel primer cognom, segon cognom i nom dels clients.
select * from cliente
left join pedido
on cliente.id = pedido.id_cliente
where cliente.ciudad = 'Granada'
order by cliente.apellido1 asc, apellido2, nombre;

-- 3
-- Retorna un llistat amb tots els comercials juntament amb les dades de les comandes que han realitzat. 
-- Aquest llistat també ha d'incloure els comercials que no han realitzat cap comanda. 
-- El llistat ha d'estar ordenat alfabèticament pel primer cognom, segon cognom i nom dels comercials.
select * from comercial
left join pedido
on comercial.id = pedido.id_comercial
order by comercial.apellido1 asc, comercial.apellido2, comercial.nombre;

-- 4
-- Retorna un llistat que solament mostri els clients que no han realitzat cap comanda.
select * from cliente
left join pedido
on cliente.id = pedido.id_cliente
where pedido.cantidad is null;

-- 5
-- Retorna un llistat que solament mostri els comercials que no han realitzat cap comanda.
select * from comercial
left join pedido
on comercial.id = pedido.id_comercial
where pedido.id is null;

-- 6
-- Retorna un llistat amb els clients que no han realitzat cap comanda i dels comercials que no han participat en cap comanda. 
-- Ordena el llistat alfabèticament pels cognoms i el nom. 
-- En en llistat haurà de diferenciar d'alguna manera els clients i els comercials.
select * from cliente
left join pedido
on cliente.id = pedido.id_cliente
where pedido.cantidad is null;

-- Subconsultes (Amb clàusules WHERE)
-- Amb operadors bàsics de comparació
-- 1
-- Retorna un llistat amb totes les comandes que ha realitzat Adela Salas Díaz. (Sense utilitzar INNER JOIN).
select * 
from pedido, cliente
where pedido.id_cliente = cliente.id
and cliente.nombre = 'Adela' and cliente.apellido1 = 'Salas' and cliente.apellido2 = 'Díaz';
-- 2
-- Retorna el nombre de comandes en els quals ha participat el comercial Daniel Sáez Vega. (Sense utilitzar INNER JOIN)
select * 
from pedido, comercial
where pedido.id_comercial = comercial.id
and comercial.nombre = 'Daniel' and comercial.apellido1 = 'Sáez' and comercial.apellido2 = 'Vega';
-- 3
-- Retorna les dades del client que va realitzar la comanda més cara l'any 2019. (Sense utilitzar INNER JOIN)
select *
from cliente, pedido
where pedido.id_cliente = cliente.id
and pedido.fecha like '2019%'
order by cantidad desc limit 1;
-- 4
-- Retorna la data i la quantitat de la comanda de menor valor realitzat pel client Pepe Ruiz Santana.
select fecha, cantidad
from pedido, cliente
where pedido.id_cliente = cliente.id
and cliente.nombre = 'Pepe' and cliente.apellido1 = 'Ruiz' and cliente.apellido2 = 'Santana'
order by cantidad asc limit 1;

-- Subconsultes amb ALL i ANY
-- --------------------------
-- Retorna la comanda més cara que existeix en la taula demanat sin fer ús de MAX, ORDER BY ni LIMIT.
-- 1
select *
from pedido
where cantidad >= all (
select cantidad
from pedido);

-- Retorna un llistat dels clients que no han realitzat cap comanda. (Utilitzant ANY o ALL).
-- 2

select *
from cliente
where id != all 
(select id_cliente
from pedido);


-- Retorna un llistat dels comercials que no han realitzat cap comanda. (Utilitzant ANY o ALL).
-- 3
select *
from comercial
where id != all 
(select id_comercial
from pedido);

-- Subconsultes amb IN i NOT IN
-- Retorna un llistat dels clients que no han realitzat cap comanda. (Utilitzant IN o NOT IN).
-- 1
SELECT *
FROM cliente
WHERE id NOT IN (SELECT id_cliente FROM pedido);
-- Retorna un llistat dels comercials que no han realitzat cap comanda. (Utilitzant IN o NOT IN).
-- 2
SELECT *
FROM comercial
WHERE id IN (SELECT id_comercial FROM pedido);