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
select avg(precio)
from producto
inner join fabricante
on fabricante.codigo = producto.codigo_fabricante
where fabricante.nombre = 'Asus';
-- 12
-- Calcula el preu més barat de tots els productes del fabricador Asus.
select producto.precio as 'Asus menor'
from producto
inner join fabricante
on fabricante.codigo = producto.codigo_fabricante
where fabricante.nombre = 'Asus' 
and producto.precio <= all (
select precio
from producto);
-- 13
-- Calcula el preu més car de tots els productes del fabricador Asus.

-- 14
-- Calcula la suma de tots els productes del fabricador Asus.

-- 15
-- Mostra el preu màxim, preu mínim, preu mitjà i el nombre total de productes que té el fabricant Crucial.

-- 16
-- Mostra el nombre total de productes que té cadascun dels fabricants. El llistat també ha d'incloure els fabricants que no tenen cap producte. El resultat mostrarà dues columnes, una amb el nom del fabricador i una altra amb el nombre de productes que té. Ordena el resultat descendentemente pel nombre de productes.

-- 17
-- Mostra el preu màxim, preu mínim i preu mitjà dels productes de cadascun dels fabricants. El resultat mostrarà el nom del fabricant juntament amb les dades que se sol·liciten.

-- 18
-- Mostra el preu màxim, preu mínim, preu mitjà i el nombre total de productes dels fabricants que tenen un preu mig superior a 200€. No és necessari mostrar el nom del fabricador, amb el codi del fabricador és suficient.

-- 19
-- Mostra el nom de cada fabricant, juntament amb el preu màxim, preu mínim, preu mitjà i el nombre total de productes dels fabricants que tenen un preu mig superior a 200€. És necessari mostrar el nom del fabricant.

-- 20
-- Calcula el nombre de productes que tenen un preu major o igual a 180€.

-- 21
-- Calcula el nombre de productes que té cada fabricant amb un preu major o igual a 180€.

-- 22
-- Llista el preu medio els productes de cada fabricant, mostrant solament el codi del fabricant.

-- 23
-- Llista el preu medio els productes de cada fabricant, mostrant solament el nom del fabricant.

-- 24
-- Llista els noms dels fabricants els productes dels quals tenen un preu mig major o igual a 150€.

-- 25
-- Retorna un llistat amb els noms dels fabricants que tenen 2 o més productes.

-- 26
-- Retorna un llistat amb els noms dels fabricants i el nombre de productes que té cadascun amb un preu superior o igual a 220 €. No és necessari mostrar el nom dels fabricants que no tenen productes que compleixin la condició.

-- 27
-- Exemple del resultat esperat: 
-- nom         total
-- Lenovo     2
-- Asus         1
-- Crucial     1
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

-- 28
-- Retorna un llistat amb els noms dels fabricants on la suma del preu de tots els seus productes és superior a 1000 €.

-- 29
-- Retorna un llistat amb el nom del producte més car que té cada fabricant. El resultat ha de tenir tres columnes: nom del producte, preu i nom del fabricant. El resultat ha d'estar ordenat alfabèticament de menor a major pel nom del fabricant.


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
select avg(precio)
from producto
inner join fabricante
on fabricante.codigo = producto.codigo_fabricante
where fabricante.nombre = 'Asus';
-- 12
-- Calcula el preu més barat de tots els productes del fabricador Asus.
select producto.precio as 'Asus menor'
from producto
inner join fabricante
on fabricante.codigo = producto.codigo_fabricante
where fabricante.nombre = 'Asus' 
and producto.precio <= all (
select precio
from producto);
-- 13
-- Calcula el preu més car de tots els productes del fabricador Asus.

-- 14
-- Calcula la suma de tots els productes del fabricador Asus.

-- 15
-- Mostra el preu màxim, preu mínim, preu mitjà i el nombre total de productes que té el fabricant Crucial.

-- 16
-- Mostra el nombre total de productes que té cadascun dels fabricants. El llistat també ha d'incloure els fabricants que no tenen cap producte. El resultat mostrarà dues columnes, una amb el nom del fabricador i una altra amb el nombre de productes que té. Ordena el resultat descendentemente pel nombre de productes.

-- 17
-- Mostra el preu màxim, preu mínim i preu mitjà dels productes de cadascun dels fabricants. El resultat mostrarà el nom del fabricant juntament amb les dades que se sol·liciten.

-- 18
-- Mostra el preu màxim, preu mínim, preu mitjà i el nombre total de productes dels fabricants que tenen un preu mig superior a 200€. No és necessari mostrar el nom del fabricador, amb el codi del fabricador és suficient.

-- 19
-- Mostra el nom de cada fabricant, juntament amb el preu màxim, preu mínim, preu mitjà i el nombre total de productes dels fabricants que tenen un preu mig superior a 200€. És necessari mostrar el nom del fabricant.

-- 20
-- Calcula el nombre de productes que tenen un preu major o igual a 180€.

-- 21
-- Calcula el nombre de productes que té cada fabricant amb un preu major o igual a 180€.

-- 22
-- Llista el preu medio els productes de cada fabricant, mostrant solament el codi del fabricant.

-- 23
-- Llista el preu medio els productes de cada fabricant, mostrant solament el nom del fabricant.

-- 24
-- Llista els noms dels fabricants els productes dels quals tenen un preu mig major o igual a 150€.

-- 25
-- Retorna un llistat amb els noms dels fabricants que tenen 2 o més productes.

-- 26
-- Retorna un llistat amb els noms dels fabricants i el nombre de productes que té cadascun amb un preu superior o igual a 220 €. No és necessari mostrar el nom dels fabricants que no tenen productes que compleixin la condició.

-- 27
-- Exemple del resultat esperat: 
-- nom         total
-- Lenovo     2
-- Asus         1
-- Crucial     1
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

-- 28
-- Retorna un llistat amb els noms dels fabricants on la suma del preu de tots els seus productes és superior a 1000 €.

-- 29
-- Retorna un llistat amb el nom del producte més car que té cada fabricant. El resultat ha de tenir tres columnes: nom del producte, preu i nom del fabricant. El resultat ha d'estar ordenat alfabèticament de menor a major pel nom del fabricant.


