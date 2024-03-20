use NORTHWND

--Crear un sp que permite insertar registros en la tabla customers 
alter procedure InsertarRegistrosCustomers
@customerID nchar(5),
@companyname varchar(40),
@country varchar(15),
@city varchar(15)
as
begin 
  insert into Customers (CustomerID,CompanyName, country, city)
  values (@customerID ,@companyname, @country, @city)
  end 
  
   exec InsertarRegistrosCustomers '1','Ramos Company', 'Mexico', 'San Miguel del alto' 

   /*exec InsertarRegistroCustomers
    @country= ''
	@city= ''
	@companyname= ''*/

--crear un sp que permite eliminar registros en la tabla Customers por customersID
select * from Customers
CREATE PROC EliminarCliente
@CustomerID NVARCHAR(5)
AS
BEGIN
    DELETE FROM Customers
    WHERE CustomerID = @CustomerID
END
GO

exec EliminarCliente '1'

--crea un sp que permita eliminar un producto de una orden dada 
select * from [Order Details]

/*create proc EliminarProducto
@OrderID int,
@ProductID int
as
begin
   declare @cantidad int 
   select @cantidad=Quantity 
   from [Order Details]
   where OrderID= @OrderId
   and ProductID= @ProductID
   delete from [Order Details]
    where Quantity =  Quantity - @cantidad
end 
go

exec EliminarProducto '10248', '42', '10'*/

Alter proc EliminarProducto
@OrderID int,
@ProductID int,
@cantidad int
as
begin 
    delete from [Order Details]
    where OrderID = @OrderID AND ProductID = @ProductID
end 
go

exec EliminarProducto '10248', '42', '10'

--crea un sp que permita eliminar un producto de una orden y modificar el stock (unitsinstock del producto)
select * from [Order Details]

create proc EliminarProductoActualizarStock
@OrderID int,
@ProductID int,
@cantidad int
as
begin 
    delete from [Order Details]
    where OrderID = @OrderID AND ProductID = @ProductID
	
    update Products
    set UnitsInStock = UnitsInStock + @cantidad
    where ProductID = @ProductID
end
go

exec EliminarProductoActualizarStock '10248', '11', '12'

--Realizar un SP que calcule las ventas totales hechas por cada
--empleado por año, el sp debe solicitar el nombre del empleado y un año inicial y un año final


Create proc VentasTotalesPorEmpleado 
@nombreEmpl nvarchar(20), 
@añoInicial datetime, 
@añoFinal datetime
as 
begin 
  select CONCAT(e.LastName, e.FirstName), sum(od.Quantity* od.UnitPrice) as 'Total ventas'  
  from Employees as e
  inner join Orders as o
  on o.EmployeeID = e.EmployeeID
  inner join [Order Details] as od 
  on od.OrderID = o.OrderID
  where @nombreEmpl = CONCAT(e.LastName, e.FirstName) and @añoInicial =  
 end 
 go



 --crear y  sp que Muestre el precio
--promedio de los productos dentro de cada categoría, incluyendo solo aquellas
--categorías cuyo precio promedio de producto supere el precio enviado en el store procedure