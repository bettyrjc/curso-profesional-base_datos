-- store procedure, se ejecuta directamente en el gestor de bd
-- se puede ejecutar sentencia ciclos,
-- reciben parametros, pero no debe retornar nada

--dos crear procedimientos
--va a insertar un libro en libro usuarios y restar uno en el stock de libros
DELIMITER //
CREATE PROCEDURE prestamos(usuario_id int, libro_id int)
begin
insert into libros_usuarios(libro_id, usuario_id) values(libro_id, usuario_id);
update libros set stock = stock - 1 where libros.libro_id = libro_id;
end//
DELIMITER ;
--CONSULTAR
select name from mysql.proc WHERE db = database() AND type = 'PROCEDURE';
-- LLAMAR
CALL prestamos(3, 20);

--tres eliminar procedimientos, no se pùede editar un store procedure hay que eliminarlo
drop procedure prestamos;
--cuatro obtener valores
-- los procedures no retornan valores,LOS PROCEDURES NO LO HACEN
--OUT ES LA PALABRA CLAVE para obtener y modifica el valor, puedens ser n cantidad de out
set @cantidad = -1;
 DELIMITER //
CREATE PROCEDURE prestamos(usuario_id int, libro_id int, OUT cantidad int)
begin
insert into libros_usuarios(libro_id, usuario_id) values(libro_id, usuario_id);
update libros set stock = stock - 1 where libros.libro_id = libro_id;
SET cantidad = (select stock from libros where libros.libro_id = libro_id);
end//
DELIMITER ;
CALL prestamos(3, 20, @cantidad);

---cinco CONDICIONALES
--
DELIMITER //
CREATE PROCEDURE prestamos(usuario_id int, libro_id int, OUT cantidad int)
begin
SET cantidad = (select stock from libros where libros.libro_id = libro_id);

IF cantidad > 0 THEN

  insert into libros_usuarios(libro_id, usuario_id) values(libro_id, usuario_id);
  update libros set stock = stock - 1 where libros.libro_id = libro_id;
  SET cantidad = cantidad - 1 ;

-- ELSEIF condicion 

ELSE 

  select 'no es posible realizar el prestamos ' as notificacion;

END IF;

end//
DELIMITER ;

-- seis CASOS
-- un caso no es mas que una o mas condiciones
DELIMITER //
CREATE PROCEDURE tipo_lector(usuario_id INT)
BEGIN
  SET @cantidad = (SELECT COUNT(*) FROM libros_usuarios WHERE libros_usuarios.usuario_id = usuario_id);

  CASE
    WHEN @cantidad > 20 THEN
      SELECT "Fanatico" AS mensaje;
    WHEN @cantidad > 10 AND @cantidad < 20 THEN
      SELECT "Afionado" AS mensaje;
    WHEN @cantidad > 5 AND @cantidad < 10 THEN
      SELECT "Promedio" AS mensaje;
    ELSE
      SELECT "Nuevo" AS mensaje;
  END CASE;
END//

-- siete ciclos
--while: se ejecutara siempre y cuando la condicion sea true

DELIMITER //
CREATE PROCEDURE libros_azar_1()
BEGIN
  SET @iteraciones= 0;

  WHILE @iteraciones < 5 DO
    SELECT libro_id, titulo FROM libros ORDER BY RAND() LIMIT 1;
    SET @iteraciones = @iteraciones + 1;
  END WHILE;

END//
DELIMITER ;
--repeat: que se ejecutara hasta que la condicion se cumpla
DELIMITER //

CREATE PROCEDURE libros_azar_2()
BEGIN
  SET @iteraciones= 0;

  REPEAT
    SELECT libro_id, titulo FROM libros ORDER BY RAND() LIMIT 1;
    SET @iteraciones = @iteraciones + 1;

    UNTIL @iteraciones >= 5
  END REPEAT;

END//

DELIMITER ;