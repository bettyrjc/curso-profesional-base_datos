-- Creación de Triggers
create TRIGGER nombre
el tiempo el evento y se asocia a una tabla (ON) 
-----------------------
CREATE TRIGGER after_insert_actualizacion_libros --Nombre del trigger
AFTER INSERT ON libros -- Definimos tiempo y cuando
FOR EACH ROW -- que se ejecutara cada vez que el triger sea ejecutada
BEGIN
  UPDATE autores SET libros = libros + 1 WHERE autor_id = NEW.autor_id;
  --new hacer referencia al registro que se ha insertado
END;
//


---------------
--old hace referencia al registro eliminado
-- delete
DELIMITER //
CREATE TRIGGER after_delete_actualizacion_libros
AFTER DELETE ON libros 
FOR EACH ROW
BEGIN
  UPDATE autores SET libros = libros - 1 WHERE autor_id = OLD.autor_id;
END;
//
DELIMITER ;

-- Evento Update
DELIMITER //
CREATE TRIGGER after_update_actualizacion_libros
AFTER UPDATE ON libros
FOR EACH ROW
BEGIN

  IF (NEW.autor_id != OLD.autor_id) THEN

    UPDATE autores SET libros = libros - 1 WHERE autor_id = OLD.autor_id;
    UPDATE autores SET libros = libros + 1 WHERE autor_id = NEW.autor_id;

  END IF;

END;//

DELIMITER ;
---------------------
-- Listado y eliminación de Triggers
SHOW TRIGGERS;
-- DROP TRIGGER IF EXISTS base de datos . nombre;
