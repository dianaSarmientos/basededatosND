create database Practica2
go 

use Practica2
go

-- Crear tabla cliente 
CREATE TABLE tblcliente(
   idCliente int not null,
   nombre varchar(100) not null,
   direccion varchar(100),
   tel varchar(20) not null, 
   constraint pk_tblcliente
   primary key(idCliente),
   constraint unique_nombre
   unique(nombre)
)
go

-- Crear tabla empleado 
CREATE TABLE tbempleado(
   idEmpleado int not null,
   nombre varchar(50) not null,
   apellidos varchar(50) not null,
   direccion varchar(100),
   sexo char(1) not null,
   salario decimal(10,2) not null,
   constraint pk_tblempleado
   primary key(idEmpleado),
   constraint chk_salario
  check(salario>=400 and salario<=50000),
)
go

create table tblVenta(
 idVenta int not null,  
 fecha date not null, 
 idcliente int not null,
 idempleado int not null,
  constraint pk_tblVenta
   primary key(idVenta),
  constraint fk_tblcliente
  foreign key(idcliente)
  references tblcliente(idCliente),
  constraint fk_tblempleado
  foreign key(idempleado)
  references tbempleado(idEmpleado)
)
