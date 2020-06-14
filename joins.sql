--joins
--uno trabajo con multiples tablas:
--joins para trabajar con multiples tablas.
--DOS inner join
--nos permites obtener registro que se obersen en la interseccion de dos tablas.
--todos los titulos de los autores que estan en la tabla autores y como esta join podemos unir dos tbalas
--hay que condicionar bajo que termino se va unir, que es la llave foranea con ON
select 
  libros.titulo,
  CONCAT( autores.nombre, ' ', autores.apellido) as nombre_autor,
  libros.fecha_creacion
from libros 
INNER JOIN autores
ON libros.autor_id = autores.autor_id;
--condicionando tablas
select 
  libros.titulo,
  CONCAT( autores.nombre, ' ', autores.apellido) as nombre_autor,
  libros.fecha_creacion
from libros 
INNER JOIN autores
ON libros.autor_id = autores.autor_id and autores.seudonimo is not null;
--TRES sub clausula using
--es un shorcut de on, pero no sirve para condicionar tablas
select 
  libros.titulo,
  CONCAT( autores.nombre, ' ', autores.apellido) as nombre_autor,
  libros.fecha_creacion
from libros 
INNER JOIN autores
using(autor_id);

--CUATRO LEFT JOIN
--left join es igual a a left outer join
--se obtiene registro de la unio de dos tablas, se pueden encontrar en la union o
-- en la tabla a, la del lado izquierdo
--nombre completo de los usuarios y el id de los libros usados.
-- usuarios = a es la tabla principla, la que se coloca en el from
-- libros_usuarios =B

select CONCAT(nombre, ' ', apellidos),
libros_usuarios.libro_id
 from usuarios
left join libros_usuarios on usuarios.usuario_id  = libros_usuarios.usuario_id
where libros_usuarios.libro_id is not null;

--CINCO Right Join
--Right join es igual a a Right outer join
-- se obtiene registro de la unio de dos tablas, se pueden encontrar en la union o
-- en la tabla b, la del lado derecho
-- libros_usuarios =a
-- usuarios = b
select CONCAT(nombre, ' ', apellidos),
libros_usuarios.libro_id
 from libros_usuarios
RIGHT JOIN usuarios on usuarios.usuario_id  = libros_usuarios.usuario_id
where libros_usuarios.libro_id is not null;

--SEIS multiples joins
-- usuarios, libros_usuarios, libros y libros autores

select  DISTINCT
CONCAT(usuarios.nombre, ' ', usuarios.apellidos) as nombre_usuario
from usuarios
INNER JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id
and DATE(libros_usuarios.fecha_creacion) = CURDATE()
INNER JOIN libros ON  libros_usuarios.usuario_id =libros.libro_id 
INNER JOIN autores ON libros.autor_id = autores.autor_id AND autores.seudonimo is not null
;
--seite productos cartesianos
--resultado de unir multiples tablas sin especeficar la unio
--cross join
select usuarios.username, libros.titulo from usuarios
cross JOIN libros order by username desc;
--util para insertar 220 registro a nuestra tabla libros_usuarios asginar a cada usuario un libro
insert into libros_usuarios(libro_id, usuario_id) 
select libro_id, usuario_id from usuarios
cross join libros;