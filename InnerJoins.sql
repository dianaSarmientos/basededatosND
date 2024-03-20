use northwnd

--Seleccionar todas las ordenes de compra mostrando las fechas, ordenes de compra 
--nombre del shipper y el nombre al cliente al que se le vendio (inner join a tres tablas)
select c.CompanyName as 'Cliente', 
o.OrderDate as 'Fecha de orden', s.CompanyName as 'Nombre del flete'
from Customers as c
inner join Orders as o
on  c.CustomerID = o.CustomerID
inner join Shippers as s
on o.ShipVia = s.ShipperID

select c.CompanyName as 'Cliente', 
o.OrderDate as 'Fecha de orden', s.CompanyName as 'Nombre del flete'
from Customers as c
 join Orders as o
on  c.CustomerID = o.CustomerID
 join Shippers as s
on o.ShipVia = s.ShipperID

--Seleccionar el nombre del producto y su categoria 
select c.CategoryName, p.ProductName
from Categories as c
inner join 
Products as p
on c.CategoryID = p.CategoryID


--Listar el nombre del cliente, la fecha de la orden y los nombres de los productos q fueron vendidos
select c.CompanyName, o.OrderDate, p.ProductName from 
Customers as c
inner join orders as o 
on c.CustomerID = o.CustomerID
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Products as p
on od.ProductID = p.ProductID

--Seleccionar los nombres completos de los empleados, los nombres de los productos que vendio y la cantidad de ellos y calcular el importe
select concat(e.firstName, ' ', e.LastName) as 'Nombre completo', p.ProductName as 'Descripcion', od.Quantity as 'Cantidad', 
(od.Quantity * od.UnitPrice) as 'Importe'
from Employees as e
inner join Orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID

--Seleccionar los nombres completos de los empleados, los nombres de los productos que vendio y la cantidad de ellos y calcular el importe
--pero de suiza, alemania y francia 
select concat(e.firstName, ' ', e.LastName) as 'Nombre completo', p.ProductName as 'Descripcion', od.Quantity as 'Cantidad', 
(od.Quantity * od.UnitPrice) as 'Importe'
from Employees as e
inner join Orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
WHERE 
    o.ShipCountry IN ('Switzerland', 'Germany', 'France');


-- Total de ordenes enviadas a Francia, alemania y suiza
select count(*) as 'Total de Ordenes'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland')


-- Seleccionar el numero de ordenes enviadas a alemania, suiza y francia
-- agrupadas por el empleado
select count(*) as 'Total de Ordenes', CONCAT(e.FirstName, ' ', e.LastName)
as 'Nombre Completo'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland')
group by CONCAT(e.FirstName, ' ', e.LastName)

--Seleccionar el numero de ordenes enviadas a alemania, suiza y francia agrupadas por el empleado y el pais de envio 
select CONCAT(e.FirstName, ' ', e.LastName)
as 'Nombre Completo',o.ShipCountry ,count(*) as 'Total de Ordenes'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland')
group by CONCAT(e.FirstName, ' ', e.LastName), o.ShipCountry
order by 1

--Contar por total de ordenes de cada empleado
select CONCAT(e.FirstName, ' ', e.LastName)
as 'Nombre Completo',o.ShipCountry ,count(*) as 'Total de Ordenes'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland') 
group by CONCAT(e.FirstName, ' ', e.LastName), o.ShipCountry
order by 1

--Seleccionar el total de dinero que se le han vendido a cada uno de los clientes de 1996
select companyName as 'Cliente',
SUM(unitPrice * Quantity) as 'Total de venta' from 
[Order Details] as od
inner join Orders as o
on od.OrderID = o.OrderID
inner join Customers as c 
on o.CustomerID = c.CustomerID
where YEAR(o.OrderDate) = '1996'
group by CompanyName
order by 2 desc

--Seleccionar el total de dinero que se le han vendido a cada uno de los clientes por cada año
select companyName as 'Cliente',
SUM(unitPrice * Quantity) as 'Total de venta',
YEAR(o.OrderDate) as 'Año'
from 
[Order Details] as od
inner join Orders as o
on od.OrderID = o.OrderID
inner join Customers as c 
on o.CustomerID = c.CustomerID
where CompanyName = 'QUICK-Stop'
group by CompanyName, YEAR(o.OrderDate)
order by 2 asc


select 
SUM(unitPrice * Quantity) as 'Total de venta'
from 
[Order Details] as od
inner join Orders as o
on od.OrderID = o.OrderID
inner join Customers as c 
on o.CustomerID = c.CustomerID
where CompanyName = 'QUICK-Stop'


--Seleccionar el importe total que he vendido por categoria de producto
select c.categoryName,
SUM(od. Quantity* od.UnitPrice) as 'Total'
from Categories as c
join products as p
on p.categoryID = c.categoryID
join [Order Details] as od 
on od.ProductID = p.ProductID
group by c.CategoryName
order by 2 desc

--Seleccionar el importe total que he vendido por categoria de producto y nombre de producto, que visualice el producto mas vendido

--Seleccionar el numero de producto, el nombre del producto y el nombre 
--de categgoria, ordenados de forma ascendente con respecto al nombre de la categoria
select p.ProductID, p.ProductName, c. CategoryName from Products as p 
inner join Categories as c
on p.CategoryId= c.CategoryID
order by c.CategoryName asc

--LEFT JOIN
select * from customers as c 
left outer join 
orders  as o
on c.CustomerID = o.CustomerID
where o.OrderID is null

select c.CompanyName, o.OrderID, o.OrderDate, o.CustomerID
from Customers as c 
inner join orders as o 
on c.CustomerID = o.CustomerID


select c.CompanyName, o.OrderID, o.OrderDate, o.CustomerID
from Customers as c 
left  join orders as o 
on c.CustomerID = o.CustomerID


use bdjoins