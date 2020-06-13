SELECT * from libros where autor_id = 2;
SELECT * from libros where autor_id = 2 AND  paginas ='390' AND titulo= 'cazadores';
SELECT * FROM libros where( autor_id = 1 and titulo='carrie') or (autor_id = 2 and titulo= 'el hobbit');

select * from libros where seudonimo is null;
select * from libros where seudonimo is not null;
select * from libros where seudonimo <=> null;

desc autores;
desc libros;

select titulo, fecha_publicacion from libros where fecha_publicacion between '1997-10-30'  and '2020-10-12';

select * from libros where titulo in ( 'after', 'tda', 'carrie');
SELECT DISTINCT titulos FROM libros;
select titulo from libros as books;

update libros set descripcion = 'nueva descrpcion', ventas = '100' ;
update libros set descripcion = 'nueva cambio', ventas = '190'  where titulo = 'TDA';
delete from libros where titulo = 'TDA';

ALTER TABLE libros add foreign key(autor_id) references autores(autor_id) ON DELETE CASCADE;

TRUNCATE TABLE libros;