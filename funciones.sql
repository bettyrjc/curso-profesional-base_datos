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