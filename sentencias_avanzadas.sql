--UNO:busqueda mediante strings, patrones en un string--.
-- Right y left, sus limitantes porque hay que saber donde esta el string.
--clausula que nos permite hacer lo que hacer r y l, mas el medio.
--Like, no se trabaja con el signo igual, directamente se coloca el string
-- que empiece
select * from libros where titulo LIKE 'cds%'; 
--que termine
select * from libros where titulo LIKE '%anillo';
--que posea la palabra
select * from libros where titulo LIKE '%after%'; 

--una palabra que tenga cinco caracteres y que pose una b, 
-- el _ denota cuantos caracteres o 
select * from libros where titulo LIKE  '_f___';
--para denotar que tiene una letra en su segundo caracter
select * from libros where titulo LIKE  '_a%';

--DOS Expresiones regulares
--que el titulo empiece por distintas letras, por eso se usa ER, facilita las consultas.
--CLAUSULA REGEXP
select titulo from libros where titulo REGEXP '^[AC]';
--expresiones mas complejas dependen de nuestra necesidades

--TRES Ordenar registros
--indicar que nos entreguen todo ordenado.
--aAz, default es asc
select titulo from libros order by titulo ASC;
--zAa
select titulo from libros order by titulo desc;
-- CUATRO ORDERNAR BAJO VARIOS CAMPOS
select titulo, libro_id  from libros order by titulo AND libro_id ASC;
--CINCO: LIMITAR REGISTROS
 select titulo from libros LIMIT 10;
 select titulo from libros WHERE autor_id = 2 LIMIT 10;
--con limit se puede paginar resultados, obtener poco a poco
--el primer rnumero toma el primer registro, y el segundo a cuantos registro necesito.

 select titulo from libros LIMIT 0, 5;
 select titulo from libros LIMIT 5, 5;

 --SEIS Qué son las funciones de agreación?
 --no son mas que funciones que se ejecutan en un grupo de datos, un grupo de datos es el resultado de una consulta.
 --son cinco funciones de agragacion
 -- count max min avg sum
 --count: contar registros puede ser todo * o una columna. Solo toma si tiene valores si es nuill lo ignora
 select COUNT(*) as total from autores;
 --sum
 select SUM(ventas) from libros;
 -- max y min
 select MAX(ventas) from libros;
 select min(ventas) from libros;
--avg: la cual nos permite saber el promedio de algo
 select avg(ventas) from libros;


--SIETE agrupamiento:
select autor_id, sum(ventas) from libros group by autor_id;
select autor_id, sum(ventas) as total from libros
 group by autor_id order by total desc limit 1;

-- Condiciones bajo agrupamiento
-- having: apoya a where, ya que se realiza funciones a travez de mas de cien mil ejempleares-
--las funcines de agrupacion no se condiciones con where, si no con
select ventas from libros;
select autor_id, sum(ventas) as total from libros  group by autor_id having sum(ventas)
> 600
;
--

--ocho unir resultados
--
select concat(nombre, ' ' , apellido) as nombre_completo from autores;
select concat(nombre, ' ' , apellido) as nombre_completo from usuarios;
--
select concat(nombre, ' ' , apellido)  from autores
union 
select concat(nombre, ' ' , apellidos)  from usuarios;

-- debe retornar ambas consultas la misma consulta, asi sea vacia

select concat(nombre, ' ' , apellido), ''  from autores
union 
select concat(nombre, ' ' , apellidos), email  from usuarios;

-- NUEVE subconsultas: consulta dentro de otra, anidadas.
--paso uno
select avg(ventas) from libros; --408.000
set @promedio = (select avg(ventas) from libros);
---
Set 
--dos
select autor_id from libros GROUP BY autor_id having sum(ventas) > @promedio ;
--
select autor_id from libros GROUP BY autor_id 
having sum(ventas) > (select avg(ventas) from libros);
---
--aninada todos
select concat(nombre, ' ' , apellido) 
from autores
where autor_id in(
  select 
  autor_id 
  from libros
   GROUP BY autor_id 
  having sum(ventas) > (select avg(ventas) from libros)
);


-----
--validar registros 10
--exist nos evaluara si existe una consulta o no,
--veremos si existe el hobbit esta y si nom dira agotada

select if (
  exists(select libro_id from libros where titulo='after'),
  'disponible',
  'agotado'
) as mensaje;
-----

