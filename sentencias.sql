DROP DATABASE IF EXISTS libreria_cf;
CREATE DATABASE IF NOT EXISTS  libreria_cf;
USE libreria_cf;

create table IF NOT EXISTS autores(
  autor_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(25) not null,
apellido VARCHAR(25) not null,
genero ENUM('M','F'),
fecha_nacimiento DATE not null,
pais_origen VARCHAR(40) not null,
fecha_creacion DATETIME DEFAULT current_timestamp
);

create table IF NOT EXISTS libros(
  libro_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
autor_id INT UNSIGNED NOT NULL,
titulo VARCHAR(50) not null,
descripcion VARCHAR(250),
paginas INTEGER UNSIGNED,
fecha_publicacion DATE not null,
fecha_creacion DATETIME DEFAULT current_timestamp,
foreign key(autor_id) references autores(autor_id) ON DELETE CASCADE
);
INSERT INTO autores( nombre,apellido, genero, fecha_nacimiento, pais_origen)
VALUES
( 'betty', 'jimenez', 'F',' 1997-10-30', 'venezuela'),
( 'betty', 'jimenez', 'F',' 1997-10-30', 'venezuela');

INSERT INTO libros( autor_id, titulo, descripcion, paginas, fecha_publicacion, ventas)
VALUES
( '1', 'cazadores de sombras', 'libro equis', '390',' 2017-10-30',44),
( '2', 'after', 'libro equis', '390',' 2017-10-30',44),
( '2', 'tda', 'libro equis', '390',' 2019-10-30',44)
;

SELECT * FROM autores;
SELECT * FROM libros;
