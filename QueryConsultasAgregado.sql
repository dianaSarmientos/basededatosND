--Consultas de Agregado
--Caracteristicas principales que devuelven un solo registro

--Top y percent 
--Selecciona las primeras 10 ordenes de compra 
use NORTHWND 
--Primeros 10
select top 10 * from Orders 

--Ultimos 10
select top 10 * from Orders 
order by OrderID desc

select top 10 CustomerID as 'Numero de cliente',
OrderDate as 'Fecha de Orden', ShipCountry as 'Pais de entrega '
from Orders 
order by OrderID desc

--Seleccionar el 50% de los registros 
select top 50 percent * from Orders 

select top 25 percent * from Orders 

--Seleccionar los primeros tres clientes de Alemania 
select top 3 * from Customers
where Country= 'Germany'

select top 3 CompanyName as 'Cliente', Country as pais, address as direccion
from Customers
where Country= 'Germany'

--Seleccionar el producto con el precio mayor
SELECT *
FROM Products
ORDER BY UnitPrice DESC;

--Muestra el precio mas alto de los productos (max)
select max(unitprice) as 'Precio Maximo' from Products

--Mostrar el precio minimo de los productos (min)
select min(unitprice) as 'Precio Maximo' from Products

--Seleccionar todas las ordenes de compra 
select * from Orders

--Seleccionar el numero total de ordenes (count)
select count(*) as 'Total de ordenes' from Orders

select count(ShipRegion) as 'Total de ordenes' from Orders

--Seleccionar todas aquellas ordenes donde la region de envio no sea null
select COUNT(*) from Orders
where ShipRegion is not null 

--Seleccionar de forma ascendente los productos por precios
SELECT *
FROM Products
ORDER BY UnitPrice asc;

--Seleccionar el numero de precios de los productos 
select count(distinct unitPrice) from Products

--Contar todos los diferentes paises de los clientes
select count(distinct Country) from Customers

--Seleccionar la suma total de cantidades de las ordenes de compra 
select sum(Quantity) from [Order Details] 

select * from [Order Details]

--Seleccionar todos los registros de orders details calculando su importe
--Campo calculado
select *, (UnitPrice*Quantity) as 'Importe' from [Order Details]

--Seleccionar el total en dinero que ha vendido la empresa utilizando el (sum)
select sum(UnitPrice*Quantity) as 'Total' from [Order Details]

--Seleccionar el total de venta del producto Chang
SELECT SUM(UnitPrice*Quantity) as Total 
FROM [Order Details]
WHERE ProductID = 2

--Seleccionar el promedio de los precios de los productos (avg)
SELECT AVG(UnitPrice) as PromedioPrecios
FROM Products

--Seleccionar el promedio total y el total de venta de los productos  41, 60, 31
SELECT sum(UnitPrice * Quantity) as PromedioTotal,
avg(UnitPrice * Quantity)
FROM [Order Details]
WHERE ProductID IN (41, 60, 31)

--Forma 2
SELECT sum(UnitPrice * Quantity) as PromedioTotal,
avg(UnitPrice * Quantity)
FROM [Order Details]
WHERE ProductID = 4 or ProductID= 60 or ProductID= 31

--Seleccionar el numero de ordenes realizadas entre 1996 y 1997
SELECT COUNT(*) as 'Total de ordenes'
FROM Orders
WHERE OrderDate='1996-01-01' and OrderDate<='1997-01-01'
--Forma 2
SELECT COUNT(*) as 'Total de ordenes'
FROM Orders
WHERE OrderDate between '1996-01-01' and '1997-01-01'

select  count(*) from Orders
where YEAR(orderDate)>= '1996' and OrderDate<='1997'

select COUNT(*) from Orders
where year(OrderDate)in('1996','1997')

select COUNT(*) from Orders
where year(OrderDate)between '1996' and '1997'

--Instruccion group by

use NORTHWND
--Seleccionar el numero de clientes agrupados por pais 
select Country, count(*) as 'Total de clientes'
from Customers
group by Country
order by 1 asc

--Seleccionar el numero de ordenes enviadas por el shipperName
select ShipVia, COUNT(*) as 'Total de ordenes'
from Orders
group by ShipVia
order by 1

select s.CompanyName as 'Total de ordenes', COUNT(*) AS Total
from Orders as o
inner join Shippers as s
on o.ShipVia = s.ShipperID
group by s.CompanyName




