--Consultas con joins 
--inner join 
use NORTHWND
--Seleccionar el numero de orden, el nombre del cliente y la fecha de la orden
select OrderID, CompanyName, OrderDate 
from Orders as o
inner join Customers as c
on c.CustomerID = o.CustomerID

--Mostrar el numero de ordenes de cada cliente mostrando el nombre de la compañia
select CompanyName, COUNT(*) as 'Total de pedidos'
from Orders as o
inner join Customers as c
on c.CustomerID = o.CustomerID
group by CompanyName
order by 2 desc

--Seleccionar el numero de productos, el nombre del producto y el 
-- nombre de categoria, ordenados de forma ascendente con respecto
--al nombre 
select ProductID, CategoryName,productName
from Products as p
inner join Categories as c
on p.CategoryID = C.CategoryID
group by CategoryName
order by 2 asc

--Seleccionar todas las ordenes 



