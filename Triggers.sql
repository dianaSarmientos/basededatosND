drop database pruebatriggers

use NORTHWND

create database pruebatriggers
go

use pruebatriggers

create table productos(
idproducto int not null,
nombreProd varchar(100) not null,
existencia int not null,
preciounitario decimal(10,2) not null,
constraint pk_idproducto
primary key (idproducto),
constraint unique_nombreprd
unique (nombreProd)
)
go


create table ventas (
ventaid int not null,
fecha date not null,
idcliente nchar(5) not null,
idvendedor int not null,
constraint pk_ventas
primary key(ventaid)
)


create table clientes (
idcliente nchar(5) not null,
nombre varchar(100),
ciudad varchar(20),
pais varchar(20),
constraint pk_cliente
primary key(idcliente)
)



create table vendedor(
idvendedor int not null,
nombre varchar(100) not null,
apellidos varchar(50) not null,
ciudad varchar(20),
pais varchar(20),
constraint pk_vendedor
primary key(idvendedor)
)


create table detalle_venta
(
idventa int not null,
idproducto int not null,
precioVenta decimal(10,2),
cantidad int
constraint pk_detalle_venta
primary key(idventa),
constraint fk_detalle_venta_venta
foreign key (idventa)
references ventas(ventaid),
constraint fk_detalle_venta_producto
foreign key (idproducto)
references productos(idproducto)
)

alter table ventas
add constraint fk_venta_cliente
foreign key (idcliente)
references clientes

alter table ventas
add constraint fk_venta_vendedor
foreign key (idvendedor)
references vendedor

create or alter procedure llenar_tablas_catalogo
@nombreTabla varchar(100)
as
begin
    if @nombreTabla = 'clientes'
    begin
        insert into clientes
        select CustomerID,CompanyName,city, country
        from northwnd.dbo.customers
    end
    else if @nombreTabla = 'productos'
    begin
        insert into productos
        select ProductID, ProductName,UnitsInStock, UnitPrice
        from northwnd.dbo.Products
    end
    else if @nombreTabla = 'vendedor'
    begin
        insert into vendedor
        select EmployeeID, FirstName, LastName, city, country
        from northwnd.dbo.Employees
    end
    else
    begin
       print('Nombre de tabla no valida')
    end
end

 select * from clientes 
 exec llenar_tablas_catalogo 'clientes'

  select * from vendedor 
 exec llenar_tablas_catalogo 'vendedor'

 select * from productos
  exec llenar_tablas_catalogo 'productos'

 create or alter procedure cargar_ventas
as
begin
        insert into ventas
        select orderID, OrderDate, CustomerID, EmployeeID
        from northwnd.dbo.Orders
    end

select * from ventas
exec cargar_ventas

 create or alter procedure cargar_detalle_venta
 as 
 begin 
 select OrderID, ProductID, UnitPrice,Quantity
 from NORTHWND.dbo.[Order Details]
 end

 select * from detalle_venta
 exec cargar_detalle_venta


 create trigger verificar_producto 
 on clientes 
 after insert 
 AS
 begin 
  print('Se disparo el trigger de insert')
  end 

  insert into clientes
  values
  ('ABC10', 'Cliente nuevo', 'Santa Maria', 'Francia' )



  delete from clientes 
  where idcliente = 'ABC10'

   create trigger verificar_producto_eliminar
 on clientes 
 after delete 
 AS
 begin 
  print('Se disparo el trigger de delete')
  end 

   create trigger verificar_producto_update
 on clientes 
 after update 
 AS
 begin 
  print('Se disparo el trigger de update')
  end 

  update clientes 
  set nombre = 'clientexx'
  where idcliente = 'ABC10'


  create trigger verificar_cliente_eventos
 on clientes 
 after insert, delete, update 
 AS
 begin 
  if (select * from inserted) > 0 and (select count(*) from deleted) = 0
  begin 
   print ('Se realizo un insert')
  end 
  else if (select * from inserted) = 0 and (select count(*) from deleted) > 0
  begin
   print ('Se realizo un delete')
   end
     else if (select * from inserted) > 0 and (select count(*) from deleted) > 0
	 begin
   print ('Se realizo un update')
   end
end


use NORTHWND

use pruebatriggers

create trigger agregarpreciodetalleventa
on detalle_venta
for insert 
as 
begin
 declare @idproducto int 
 declare @precio decimal(10,2)
 set @idProducto = (select idproducto from inserted)
 set @precio = 
 (select preciounitario from productos where idproducto = @idproducto)
 end

 update detalle_venta
 set precioVenta = @precio
 where idproducto = @idproducto
end 


select * from detalle_venta

insert into detalle_venta
(idventa, idproducto, cantidad)
values ('101250' ,  22, 4)

select preciounitario from productos where idproducto= 22

select * from detalle_venta where idventa= '10250'


update d
 set d.precioVenta = pr.preciounitario 
 from 
  detalle_venta as dv

 where idproducto = @idproducto
end 