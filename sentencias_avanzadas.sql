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
-- ORDERNAR BAJO VARIOS CAMPOS
select titulo, libro_id  from libros order by titulo AND libro_id ASC;