use NORTHWND

--Realizar un sp para Calcular el Total de una orden.
create proc CalcularOrden
@NumeroCliente int
AS
begin
	select OrderID as 'Numero del cliente' , sum(UnitPrice * Quantity) as 'Total de la orden' from [Order Details]
	where OrderID = @NumeroCliente
	group by OrderID
end
go

exec CalCalcularOrden'10248'

--Realizar un sp para Actualizar la Cantidad de Productos en Stock
CREATE PROC ActualizarStock
@productoID INT,
@cantidad INT
AS
BEGIN
    UPDATE Products
    SET UnitsInStock = UnitsInStock - @cantidad
    WHERE ProductID = @productoID
END
GO

exec ActualizarStock '1', '4'
go


--Realizar un SP para Calcular el Total de Ventas de un Empleado
Create proc CalcularElTotalDeVentasEmpleado
@Empleado int
as
begin
	select e.FirstName as 'Empleado',sum(od.Quantity*od.UnitPrice) as 'Total de ventas' from Employees as e
	inner join Orders as o
	on o.EmployeeID = e.EmployeeID
	inner join [Order Details] as od
	on od.OrderID = o.OrderID
	where @Empleado = e.EmployeeID
	group by e.FirstName
end
go

exec CalcularElTotalDeVentasEmpleado '4'

--Realizar un SP para Actualizar el Nombre de un Empleado
CREATE PROC ActualizarNombreEmpleado
@employeeID int,
@newName nvarchar(30),
@newLastName nvarchar(30)
AS
BEGIN
    UPDATE Employees
    SET FirstName = @newName, LastName = @newLastName
    WHERE EmployeeID = @employeeID
END
GO

exec ActualizarNombreEmpleado '1','Diana','Sarmientos'

--Realizar un SP para Obtener el Total de Ventas por País
Create proc TotalVentasPais
@Pais nvarchar(20)
AS
begin
	select  c.Country as Pais, sum(oc.UnitPrice * oc.Quantity) as 'Total de ventas' from Customers as c
	inner join Orders as o
	on o.CustomerID = c.CustomerID
	inner join [Order Details] as oc
	on o.OrderID = oc.OrderID
	where @Pais = c.Country
	group by c.Country
end
go

--Realizar un SP para Obtener el Número de Órdenes por Cliente
Create proc OrdenesCliente
@Cliente nvarchar(100)
AS
begin
	select c.CustomerID ,c.CompanyName as Cliente, count(*) as 'Numero de Ordenes' from Orders as o
	inner join Customers as c
	on c.CustomerID = o.CustomerID
	where @Cliente = c.CompanyName
	group by c.CustomerID ,c.CompanyName
end
go

--Realizar un SP para Calcular el Total de Productos Vendidos por Categoría
Create proc ProductosVendidosCategoria
@Categoria nvarchar(20)
AS
begin
	select  c.CategoryName as Categoria, count(*) as 'Total de ventas' from [Order Details] as od
	inner join Products as p
	on p.ProductID = od.ProductID
	inner join Categories as c
	on c.CategoryID = p.CategoryID
	where @Categoria = c.CategoryName
	group by c.CategoryName
end
go

exec ProProductosVendidosCategoria '2' 

--SP para Calcular el Total de Ventas por Año
create proc CalcularElTotalDeVentasPorAño
@Fecha int
AS
begin
	select year(o.OrderDate) as Año, sum(od.UnitPrice*od.Quantity) as 'Total de venta' from
	[Order Details] as od
	inner join Orders as o
	on od.OrderID = o.OrderID
	where @Fecha = year(o.OrderDate)
	group by year(o.OrderDate)
end
go

exec CalcularElTotalDeVentasPorAño '1996'