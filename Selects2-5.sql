
-- Consultes multitaula
-- (Cada consulta OK val 0,5 punts. Tota 6,5 punts).

-- Resol totes les consultes utilitzant la sintaxi de SQL

-- 1
-- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
select producto.nombre, producto.precio, fabricante.nombre as fabricante
from producto 
inner join fabricante 
on fabricante.codigo = producto.codigo_fabricante;

-- 2
-- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricador i per ordre alfabètic.
select producto.nombre, producto.precio, fabricante.nombre as fabricante
from producto 
inner join fabricante 
on fabricante.codigo = producto.codigo_fabricante
order by fabricante asc;
-- 3
-- Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.
select producto.codigo, producto.nombre, fabricante.codigo as 'cod. fabricante', fabricante.nombre as fabricante
from producto 
inner join fabricante 
on fabricante.codigo = producto.codigo_fabricante;
-- 4
-- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
select producto.nombre, producto.precio, fabricante.nombre
from producto
inner join fabricante
on fabricante.codigo = producto.codigo_fabricante
where producto.precio <= all (
select precio
from producto);
-- 5
-- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
select producto.nombre, producto.precio, fabricante.nombre
from producto
inner join fabricante
on fabricante.codigo = producto.codigo_fabricante
where producto.precio >= all (
select precio
from producto);
-- 6
-- Retorna una llista de tots els productes del fabricador Lenovo.
select *
from producto
inner join fabricante
on fabricante.codigo = producto.codigo_fabricante
where fabricante.nombre ='Lenovo';
-- 7
-- Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200€.
select *
from producto
inner join fabricante
on fabricante.codigo = producto.codigo_fabricante
where fabricante.nombre ='Crucial' and producto.precio > 200;
-- 8
-- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Sense utilitzar l'operador IN.
select *
from producto
inner join fabricante
on fabricante.codigo = producto.codigo_fabricante
where fabricante.nombre ='Asus' or fabricante.nombre ='Hewlett-Packard' or fabricante.nombre ='Seagate';
-- 9
-- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard y Seagate. Utilitzant l'operador IN.
select *
from producto
inner join fabricante
on fabricante.codigo = producto.codigo_fabricante
where fabricante.nombre  in ('Asus','Hewlett-Packard','Seagate');
-- 10 
-- Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
select producto.nombre, producto.precio, fabricante.nombre
from producto
inner join fabricante
on fabricante.codigo = producto.codigo_fabricante
where fabricante.nombre like '%e';
-- 11
-- Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
select producto.nombre, producto.precio, fabricante.nombre
from producto
inner join fabricante
on fabricante.codigo = producto.codigo_fabricante
where fabricante.nombre like '%w%';
-- 12
-- Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180€. Ordeni el resultat en primer lloc pel preu (en ordre descendent) i en segon lloc pel nom (en ordre ascendent)
select producto.nombre, producto.precio, fabricante.nombre
from producto
inner join fabricante
on fabricante.codigo = producto.codigo_fabricante
where producto.precio >= 180
order by producto.precio desc, producto.nombre asc;
-- 13
-- Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
select fabricante.codigo, fabricante.nombre
from producto
inner join fabricante
on fabricante.codigo = producto.codigo_fabricante
group by fabricante.codigo;

-- Consultes multitaula
-- (Cada consulta OK val 0,5 punts. Tota 1 punt).
-- Resolgui totes les consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

-- 1
-- Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
select *
from fabricante
left join producto
on fabricante.codigo = producto.codigo_fabricante;
-- 2
-- Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
select *
from fabricante
left join producto
on fabricante.codigo = producto.codigo_fabricante
where producto.codigo is null;

-- Consultes repàs
-- 90% han de estar OK per superar la tasca.
-- (26 consultes de 29 han d’estar OK).

-- 1
-- Calcula el nombre total de productes que hi ha en la taula productes.
select count(*)
from producto;
-- 2
-- Calcula el nombre total de fabricants que hi ha en la taula fabricadora.
select count(*)
from fabricante;
-- 3
-- Calcula el nombre de valors diferents de codi de fabricant apareixen en la taula productes.
select count(distinct codigo_fabricante)
from producto;
-- 4
-- Calcula la mitjana del preu de tots els productes.
select avg(precio)
from producto;
-- 5
-- Calcula el preu més barat de tots els productes.
select min(precio)
from producto;
-- 6
-- Calcula el preu més car de tots els productes.
select max(precio)
from producto;
-- 7
-- Llista el nom i el preu del producte més barat.
select producto.nombre, producto.precio
from producto
where producto.precio <= all (
select precio
from producto);
-- 8
-- Llista el nom i el preu del producte més car.
select producto.nombre, producto.precio
from producto
where producto.precio >= all (
select precio
from producto);
-- 9
-- Calcula la suma dels preus de tots els productes.
select sum(precio)
from producto;
-- 10
-- Calcula el nombre de productes que té el fabricant Asus.
select count(*)
from producto
inner join fabricante
on fabricante.codigo = producto.codigo_fabricante
where fabricante.nombre = 'Asus';
-- 11
-- Calcula la mitjana del preu de tots els productes del fabricador Asus.
select avg(precio) as 'avg Asus'
from producto
inner join fabricante
on fabricante.codigo = producto.codigo_fabricante
where fabricante.nombre = 'Asus';
-- 12
-- Calcula el preu més barat de tots els productes del fabricador Asus.
select min(producto.precio) as 'Asus menor'
from producto
inner join fabricante
on fabricante.codigo = producto.codigo_fabricante
where fabricante.nombre = 'Asus' ;
-- 13
-- Calcula el preu més car de tots els productes del fabricador Asus.
select max(producto.precio) as 'Asus mayor'
from producto
inner join fabricante
on fabricante.codigo = producto.codigo_fabricante
where fabricante.nombre = 'Asus';
-- 14
-- Calcula la suma de tots els productes del fabricador Asus.
select sum(producto.precio) as 'Total Asus'
from producto
inner join fabricante
on fabricante.codigo = producto.codigo_fabricante
where fabricante.nombre = 'Asus';
-- 15
-- Mostra el preu màxim, preu mínim, preu mitjà i el nombre total de productes que té el fabricant Crucial.
select count(*) as 'cantidad', max(producto.precio) as 'maximo', min(producto.precio) as 'minimo', avg(producto.precio) as 'avg'
from producto
inner join fabricante
on fabricante.codigo = producto.codigo_fabricante
where fabricante.nombre = 'crucial';
-- 16
-- Mostra el nombre total de productes que té cadascun dels fabricants. El llistat també ha d'incloure els fabricants que no tenen cap producte. El resultat mostrarà dues columnes, una amb el nom del fabricador i una altra amb el nombre de productes que té. Ordena el resultat descendentemente pel nombre de productes.
select fabricante.nombre, count(producto.precio) as 'cantidad'
from producto
right join fabricante
on fabricante.codigo = producto.codigo_fabricante
group by fabricante.nombre
order by count(producto.precio) desc; 
-- 17
-- Mostra el preu màxim, preu mínim i preu mitjà dels productes de cadascun dels fabricants. El resultat mostrarà el nom del fabricant juntament amb les dades que se sol·liciten.
select fabricante.nombre, max(producto.precio) as 'maximo', min(producto.precio) as 'minimo', avg(producto.precio) as 'avg'
from producto
inner join fabricante
on fabricante.codigo = producto.codigo_fabricante
group by fabricante.nombre;
-- 18
-- Mostra el preu màxim, preu mínim, preu mitjà i el nombre total de productes dels fabricants que tenen un preu mig superior a 200€. No és necessari mostrar el nom del fabricador, amb el codi del fabricador és suficient.
select fabricante.codigo, max(producto.precio) as 'maximo', min(producto.precio) as 'minimo', avg(producto.precio) as 'avg'
from producto
inner join fabricante
on fabricante.codigo = producto.codigo_fabricante
group by fabricante.codigo
having avg(producto.precio) > 200 ;

-- 19
-- Mostra el nom de cada fabricant, juntament amb el preu màxim, preu mínim, preu mitjà i el nombre total de productes dels fabricants que tenen un preu mig superior a 200€. És necessari mostrar el nom del fabricant.
select fabricante.nombre, max(producto.precio) as 'maximo', min(producto.precio) as 'minimo', avg(producto.precio) as 'avg'
from producto
inner join fabricante
on fabricante.codigo = producto.codigo_fabricante
group by fabricante.nombre
having avg(producto.precio) > 200 ;
-- 20
-- Calcula el nombre de productes que tenen un preu major o igual a 180€.
select COUNT(*) 
from producto 
where precio >= 180;
-- 21
-- Calcula el nombre de productes que té cada fabricant amb un preu major o igual a 180€.
select fabricante.nombre, count(producto.precio) as 'cantidad'
from producto
right join fabricante
on fabricante.codigo = producto.codigo_fabricante
where producto.precio >= 180
group by fabricante.nombre
order by count(producto.precio) desc; 
-- 22
-- Llista el preu medio els productes de cada fabricant, mostrant solament el codi del fabricant.
select fabricante.codigo, avg(producto.precio) as 'cantidad'
from producto
right join fabricante
on fabricante.codigo = producto.codigo_fabricante
where producto.precio >= 180
group by fabricante.codigo;

-- 23
-- Llista el preu medio els productes de cada fabricant, mostrant solament el nom del fabricant.
select fabricante.nombre, avg(producto.precio) as 'precio medio'
from producto
right join fabricante
on fabricante.codigo = producto.codigo_fabricante
group by fabricante.nombre;
-- 24
-- Llista els noms dels fabricants els productes dels quals tenen un preu mig major o igual a 150€.
select fabricante.nombre, avg(producto.precio)
from producto
inner join fabricante
on fabricante.codigo = producto.codigo_fabricante
group by fabricante.nombre
having avg(producto.precio) >= 150;
-- 25
-- Retorna un llistat amb els noms dels fabricants que tenen 2 o més productes.
select fabricante.nombre, count(*)
from producto
inner join fabricante
on fabricante.codigo = producto.codigo_fabricante
group by fabricante.nombre
having count(*) >= 2;
-- 26
-- Retorna un llistat amb els noms dels fabricants i el nombre de productes que té cadascun amb un preu superior o igual a 220 €. No és necessari mostrar el nom dels fabricants que no tenen productes que compleixin la condició.
-- Exemple del resultat esperat: 
-- nom         total
-- Lenovo     2
-- Asus         1
-- Crucial     1
select fabricante.nombre, count(*)
from producto
inner join fabricante
on fabricante.codigo = producto.codigo_fabricante
where producto.precio >= 220
group by fabricante.nombre;

-- 27
-- Retorna un llistat amb els noms dels fabricants i el nombre de productes que té cadascun amb un preu superior o igual a 220 €. El llistat ha de mostrar el nom de tots els fabricants, és a dir, si hi ha algun fabricant que no té productes amb un preu superior o igual a 220€ haurà d'aparèixer en el llistat amb un valor igual a 0 en el nombre de productes.
-- 
-- nom            total
-- Lenovo        2
-- Crucial            1
-- Asus            1
-- Huawei        0
-- Samsung        0
-- Gigabyte        0
-- Hewlett-Packard    0
-- Xiaomi            0
-- Seagate        0
-- 
select fabricante.nombre, COUNT(consulta.codigo_fabricante) as 'total'
from fabricante 
left join (select producto.codigo_fabricante
from producto 
where producto.precio >= 220) as consulta
on fabricante.codigo = consulta.codigo_fabricante
group by fabricante.codigo;

-- 28
-- Retorna un llistat amb els noms dels fabricants on la suma del preu de tots els seus productes és superior a 1000 €.
select fabricante.nombre, sum(producto.precio)
from fabricante
right join producto
on fabricante.codigo = producto.codigo_fabricante
group by fabricante.nombre
having sum(producto.precio)>= 1000;
-- 29
-- Retorna un llistat amb el nom del producte més car que té cada fabricant. El resultat ha de tenir tres columnes: nom del producte, preu i nom del fabricant. El resultat ha d'estar ordenat alfabèticament de menor a major pel nom del fabricant.


-- Subconsultes (Amb clàusules WHERE)
-- Amb operadors bàsics de comparació
-- (100% OK -> 0,5 punts).

-- 1
-- Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
select producto.nombre
from producto, fabricante
where producto.codigo_fabricante = fabricante.codigo and fabricante.nombre = 'Lenovo';

-- 2 
-- Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricador Lenovo. (Sense utilitzar INNER JOIN).
select *
from producto
where precio = (
select MAX(precio)
from producto
where codigo_fabricante = (
select codigo
from fabricante
where nombre = 'Lenovo'));


-- 3
-- Llista el nom del producte més car del fabricador Lenovo.
select producto.nombre, producto.precio
from producto, fabricante
where producto.codigo_fabricante = fabricante.codigo 
and fabricante.nombre = 'Lenovo' 
order by producto.precio desc limit 1;
-- 4
-- Llista el nom del producte més barat del fabricant Hewlett-Packard.
select producto.nombre, producto.precio
from producto, fabricante
where producto.codigo_fabricante = fabricante.codigo 
and fabricante.nombre = 'Hewlett-Packard' 
order by producto.precio asc limit 1;
-- 5
-- Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricador Lenovo.
SELECT *
FROM fabricante INNER JOIN producto
ON fabricante.codigo = producto.codigo_fabricante
WHERE precio >= (SELECT MAX(precio)
    FROM fabricante INNER JOIN producto
    ON fabricante.codigo = producto.codigo_fabricante
    WHERE fabricante.nombre = 'Lenovo');

-- 6
-- Llista tots els productes del fabricador Asus que tenen un preu superior al preu mitjà de tots els seus productes.
select *
from producto INNER JOIN (
    SELECT codigo_fabricante, AVG(precio) AS media
    FROM producto
    GROUP BY codigo_fabricante) AS t
ON producto.codigo_fabricante = t.codigo_fabricante
WHERE producto.precio >= t.media;

-- Subconsultes amb ALL i ANY
-- (100% OK -> 0,5 punts).

-- Retorna el producte més car que existeix en la taula producte sense fer ús de MAX, ORDER BY ni LIMIT.
select *
from producto
where precio >= all (
select precio
from producto);
-- Retorna el producte més barat que existeix en la taula producte sense fer ús de MIN, ORDER BY ni LIMIT.
select *
from producto
where precio <= all (
select precio
from producto);
-- Retorna els noms dels fabricants que tenen productes associats. (Utilitzant ALL o ANY).
select fabricante.nombre
from producto, fabricante
where (fabricante.codigo = producto.codigo_fabricante);
-- Retorna els noms dels fabricants que no tenen productes associats. (Utilitzant ALL o ANY).
select * from producto;

-- Subconsultes amb IN i NOT IN
-- (100% OK -> 0,5 punts).

-- Retorna els noms dels fabricants que tenen productes associats. (Utilitzant IN o NOT IN).
select *
from fabricante
where codigo  in (select codigo_fabricante from producto);
-- Retorna els noms dels fabricants que no tenen productes associats. (Utilitzant IN o NOT IN).
select *
from fabricante
where codigo not in (select codigo_fabricante from producto);

-- Subconsultes “correlacionades”
-- (100% OK -> 0,5 punts).

-- Llista el nom de cada fabricant amb el nom i el preu del seu producte més car.



-- Retorna un llistat de tots els productes que tenen un preu major o igual a la mitjana de tots els productes del seu mateix fabricador.
select *
from producto inner join (
select codigo_fabricante, avg(precio) as mitjana
from producto
group by codigo_fabricante) as grupo
on producto.codigo_fabricante = grupo.codigo_fabricante
where producto.precio >= grupo.mitjana;
-- Llista el nom del producte més car del fabricador Lenovo.


-- Subconsultes (Amb la clàusula HAVING)
-- (100% OK -> 0,5 punts).

-- Retorna un llistat amb tots els noms dels fabricants que tenen el mateix nombre de productes que el fabricant Lenovo.
select fabricante.nombre, COUNT(producto.codigo)
from fabricante inner join producto
on fabricante.codigo = producto.codigo_fabricante
group by fabricante.codigo
having COUNT(producto.codigo) >= (
SELECT COUNT(producto.codigo)
from fabricante inner join producto
on fabricante.codigo = producto.codigo_fabricante
where fabricante.nombre = 'Lenovo');