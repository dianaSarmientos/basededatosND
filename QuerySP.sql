-- Procedimientos  almacenados 
use NORTHWND 

select * from Customers 
go

--SP para visualizar los clientes 
create proc visualizarClientes 
as
begin
select * from Customers 
end 
go

--cambiar sp
Alter proc visualizarClientes 
as
begin
select companyName, contactName from Customers 
end 
go

--eliminar sp
drop proc visualizarClientes 


--ejecutar sp
exec visualizarClientes
go

create proc listarClientesPorCiudad 
@ciudad nvarchar(15) 
as
begin
select * from Customers
where city = @ciudad
end 
go

exec listarClientesPorCiudad 'Madrid'

alter proc listarClientesPorNombre
@nombre nvarchar(40) 
as
begin
select * from Customers
where CompanyName like @nombre + '%'
end 
go

exec listarClientesPorNombre 'laz'

--Realizar un sp que obtenga las ventas totales realizadas a los clientes por año eleido
create proc ventasClientesPorAño 
@venta nvarchar(15) 
as
begin
select * from Customers
where city = @venta
end 
go



