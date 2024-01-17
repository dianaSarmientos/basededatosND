create database Practica1
go 

use Practica1
go

CREATE TABLE tblContacto(
   idContacto int not null,
   nombre varchar(30) not null,
   constraint pk_tblContacto
   primary key(idContacto)
)
go


create table tblTelefono(
 idTelefono int not null,  
 numeroTel varchar(15) not null, 
 idcontacto int not null,
  constraint fk_tblTelefono
  foreign key(idcontacto)
  references tblContacto(idContacto)
)
