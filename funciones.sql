SELECT CONCAT(nombre, apellido) from autores;
SELECT CONCAT(nombre, ' ' ,apellido)  as nombre_completo from autores;
--
SELECT LENGTH('HOLA MUNDO');
SELECT * FROM autores WHERE LENGTH(nombre) > 4;
-- 
--upper
SELECT UPPER(nombre), LOWER(nombre) from autores;
--
SELECT TRIM( '              ESPACIOS         ');
SELECT LEFT('ESTA ES UNA CADENA', 5) as substring_izquierdo,
RIGHT(' esta es derecha' , 10) as substring_derecha;

select * from libros WHERE LEFT(titulo, '9') = 'cazadores';

select ROUND( RAND() * 100);

SELECT TRUNCATE(1.1231223, 3);
SELECT POW(3, 2);

--FECHAS
 SET @now = NOW();
 select SECOND(@now),
  HOUR(@now);

SELECT DAYOFWEEK(@now), DAYOFMONTH(@now), DAYOFYEAR(@now);
select DATE(@now);

select * from libros WHERE DATE(fecha_creado) = CURDATE();

SELECT @now + INTERVAL 30 DAY;

-- if(condicion, valor que retornara si la condicion se cumple, valor que retornara si no se comple);
select if( 100 >230, 'yey', 'opps');

select IF(paginas = 390, 'el libro tiene paginas', 'no tiene paginas') FROM libros;
 update libros set paginas=10  WHERE libro_id > 1;

 select if null('valor a evaluar', 'que pasa si es nulo') from tabla;

--CON LO QUE FINALICE LA SENTENCIA
  DELIMITER //
  SELECT * FROM libros//
-- se creo una funcion
 create function add_dias(fecha date, dias int)
 returns DATE
 BEGIN
 return fecha + INTERVAL dias DAY;
 END//
-- que finalice con ;
 DELIMITER ;
--usando la funcion
 set @now = CURDATE();
 select @now;
 select add_dias(@now, 60);

--listar funciones, hay que espeficicar de que data base y el tipo, porque proc alamecena todos los procedures
--proc es una tabla que esta dentro de la base de datos mysql
SELECT name FROM mysql.proc WHERE db = database() and type = 'FUNCTION'; 

-- eliminar funciones -- DROP FUNCTION nombe_de_la funcion_a_eliminar
drop function add_dias;

--Ejecutar sentencias dentro de funciones
DELIMITER //
create FUNCTION obtener_paginas()
returns int
BEGIN
 SET @paginas = (SELECT (ROUND( RAND() * 100) *4));
 return @paginas;
END//
DELIMITER ;

DELIMITER //
create FUNCTION obtener_ventas()
returns int
BEGIN
 SET @paginas = (SELECT (ROUND( RAND() * 100) *6));
 return @paginas;
END//
DELIMITER ;
-- que cada libro tenga paginas random
update libros SET paginas = obtener_paginas();
update libros SET ventas = obtener_ventas();