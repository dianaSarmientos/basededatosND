use NORTHWND
--1
select p.productName as 'Nombre Producto',(od.quantity * od.unitPrice) as 'Importe'
from [Order Details] as od
inner join Products as p
on p.ProductID = od.ProductID
inner join Orders as o
on o.OrderID = od.OrderID
where YEAR(o.OrderDate)= '1997'
order by 2

--2
select c.companyname as 'Cliente', count(*) as 'Cantidad compras'
from Orders as o
inner join Customers as c 
on o.CustomerID = c.CustomerID
group by c.CompanyName
having COUNT(*)>1

--3
select * from 
Products as p 
left join [Order Details] as od
on p.ProductID = od.ProductID
where od.ProductID is null
order by p.ProductName asc

--4
select c.categoryName count(*) as 'Total'
from Categories as c
inner join products as p 
on c.categoryId = p.categoryID
inner join [Order Details] as od
on od.productID = p.productID
group by c.categoryName
having count(*)>10

--5
select p.productName as 'Nombre Producto', c.categoryName as 'Nombre categoria'
from products as p 
inner category as c 
on p.categoryID = c.categoryID
where p.unitPrice > 50
order by 1,2 