create database Practica4

use Practica4

create table tblcateoria(
 categoriaId int not null, 
 numero int not null, 
 descripcion varchar(50) not null,
 constraint pk_categoria
 primary key (categoriaId,numero)
)

create table tblproducto(
 productoId int not null, 
 descripcion varchar(100) not null, 
 precio decimal(10,2) not null,
 stock int not null,
 categgoriaId INT NOT NULL,
 numeroInventario int not null
 constraint pk_producto
 primary key (productoId),
 constraint fk_producto_categoria
 foreign key(categgoriaId,numeroInventario)
 references tblcateoria(categoriaId, numero)
)