-- uno Bloqueo de tablas
--dos tipos,
--uno: cuando alguna de la sentencia es ejecutada.
--dos: cuando ocurre una de esta setencia.

--dos Transacciones;
-- realizando tablas que impactaran en mas de una tabla
--es el mecanismo que nos permite agrupa n sentencia sql en una sola
--de modo que tengan o no exito, es atomicida
--utilizar esto nos permite atravesar la tabla de forma segura
--tres estados antes, durante y despues

--tres implementar transacciones

start TRANSACTION; --empezar
--estas dos sentencias terminan la transaccion
commit; --terminar la transacion, y los datos de añaden permanetenmente
ROLLBACK ; --revertir


-- cuatro  Transacciones y store procedures
DELIMITER //


CREATE PROCEDURE prestamo(usuario_id INT, libro_id INT)
BEGIN

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
  END;

  START TRANSACTION;

  INSERT INTO libros_usuarios(libro_id, usuario_id) VALUES(libro_id, usuario_id);
  UPDATE libros SET stock = stock - 1 WHERE libros.libro_id = libro_id;
  
  COMMIT;

END//
DELIMITER ;

CREATE PROCEDURE prestamo(usuario_id INT, libro_id INT)
BEGIN
-- la accion que queremos que se ejecute, cuando ocurre un error
--y que ejecute lo que esta en medio del begin y end
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
  END;

  START TRANSACTION;

  INSERT INTO libros_usuarios(libro_id, usuario_id) VALUES(libro_id, usuario_id);
  UPDATE libros SET stock = stock - 1 WHERE libros.libro_id = libro_id;
  
  COMMIT;

END//