--Lenguaje SQL-LMD
--Seleccionar todos los datos en la tabla categoria
use ejercicio1
select * from Categoria 

--Agregar una sola fila a Categoria
insert into categoria 
values (1, '
 Carnes frias
')

insert into categoria 
values (2, '
 Lacteos 
')

insert into categoria 
values (3, '
 Vinos y licores
')
insert into categoria 
values (4, '
 Ropa 
')


--Volver a ejecutar select

insert into categoria(idCategoria, Descripcion)
values (5, 'Linea Blanca')

insert into categoria(idCategoria, Descripcion)
values (6, 'Electronica')

insert into Categoria 
values (7, 'Carnes buenas'),
(8, 'Dulces'),
(9, 'Panaderia'),
(10, 'Salchiconeria')

--Insertar a partir de una consulta 

create table categoriaCopia (
 categoriaId int not null primary key,
 nombre varchar(100) not null
)

select * from categoriaCopia

insert into categoriaCopia (categoriaId, nombre)
select idCategoria, descripcion from Categoria 

select * from producto

insert into Producto
values(1, 'Salchicha', 600, 12, 1)

insert into Producto
values(2, 'Paleta de pollo', 22, 56, 8)

insert into Producto
values(3, 'Refrigerador', 3000, 22, 5),
	  (4, 'Chilindrina', 23, 43, 9),
	  (5, 'Terrible mezcal', 200, 12,3),
	  (6, 'Leche de burra', 2350, 3, 2)


--alter table producto 
--add constraint pk_producto
--primary key(producto)

update producto 
set idproducto = 2
where nombre = 'Paleta de pollo'