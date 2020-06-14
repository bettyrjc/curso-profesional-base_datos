--el tema de seguridad es bien importante.
--en esos casos como diseñadores hay que tener cosas privadas
--una vista es un mecanismo que nos ayuda a consultar datos, no se almacenan los datos.
--CREAR VISTAS
--una vista que nos permita conocer usuario que han prestado libros y cantidad
--1 vw_que es vista
create view prestamos_usuarios_vw as
select 
usuarios.usuario_id,
usuarios.nombre,
usuarios.email,
usuarios.username,
count(usuarios.usuario_id) as total_prestados
 from usuarios
inner join libros_usuarios
on usuarios.usuario_id = libros_usuarios.usuario_id
group by usuarios.usuario_id;


show tables;
--el estandar vw es para daber que es vista, porque se puede tratar como tabla
--se pude usar el where
select * from prestamos_usuarios_vw where total_prestados > 4;
--eliminar

drop view prestamos_usuarios_vw;

--- editar vistas
--vista creada
create view prestamos_usuarios_vw as
select 
usuarios.usuario_id,
usuarios.nombre,
usuarios.email,
usuarios.username,
count(usuarios.usuario_id) as total_prestados
 from usuarios
inner join libros_usuarios and libros_usuarios.fecha_creacion >= CURDATE() - interval 5 day
on usuarios.usuario_id = libros_usuarios.usuario_id
group by usuarios.usuario_id;
---editada
create or replace view prestamos_usuarios_vw as
select 
usuarios.usuario_id,
usuarios.nombre,
usuarios.email,
usuarios.username,
count(usuarios.usuario_id) as total_prestados
 from usuarios
inner join libros_usuarios
on usuarios.usuario_id = libros_usuarios.usuario_id
group by usuarios.usuario_id;

