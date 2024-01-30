use NORTHWND

select * from Customers

select CompanyName, ContactName, City from Customers 

--Seleccionar todos los paises de los clientes 
select country from Customers 

select distinct country from customers

--Selecciona el numero de paises de donde son mis clientes
select count(*) from Customers


select count(Country) from Customers

select count(distinct Country) from Customers

--Seleccionar el cliente que tenga un ID Anton 

select * from Customers
where CustomerID = 'ANTON'

--Seleccionar todos loc clientes de Mexico 
select * from Customers
where country = 'Mexico'

--Seleccionar todos los registros de los clientes de Berlin 
select * from Customers
where city = 'Berlin'

--Order by 
--Seleccionar todos los productos ordenados por precio 
select * from Products 
order by UnitPrice

--Seleccionar todos los productos ordenados por el precio de mayor a menor 
select * from Products 
order by UnitPrice desc

--Seleccionar todos los productos alfabeticamente
select * from Products
order by ProductName asc

--Seleccionar todos los clientes por pais y dentro por nombre de forma ascendente
select  Country, CompanyName, city from Customers
order by Country desc, CompanyName desc


--Operador and 
--Seleccionar todos los clientes de españa y que su nombre comience con G
select * from Customers
where  Country = 'Spain' and CompanyName like 'G%' 
--Seleccionar todos los clientes de Berlin, alemania con un codigo postal mayor a 1200
select * from  Customers 
where city = 'Berlin' and country= 'Germany' and PostalCode >1200

--Seleccionar todos los clientes de españa y que su nombre comience con G o con R
select * from Customers
where Country = 'Spain' and (CompanyName like 'G%' or CompanyName like 'R%')

--OR
--Seleccionar todods los clientes de alemania o de españa 
select * from Customers
where country= 'Spain' or Country= 'Germany'

--Seleccionar todos los clientes de berlin o de noruega o que comience su nombre con G
select * from Customers
where City= 'Berlin' or Country='Norway' or CompanyName like 'G%'

--Seleccionar solo los clientes que no son de españa 
select * from Customers 
where not country = 'Spain' 

--Seleccionar todos los productos que no tengan un precio entre 18 y 20 dolares 
select * from Products
where not UnitPrice>=18 and UnitPrice<=20

select * from Products
where UnitPrice not between 18 AND 20

--Seleccionar todos los clientes que no son de paris o de londres 
select * from Customers
where not  (city= 'Paris' or city='London')

select * from Customers
where city in('London', 'Paris')

select * from Customers
where city not in('London', 'Paris')

--Seleccionar todos los productos que no tienen precios mayores a 30
select * from Products
where  not  UnitPrice>30

--Seleccionar todos los productos que no tienen precios menores a 30
select * from Products
where  not  UnitPrice<30

--Instruccion like
--Seleccionar todos los clientes que comienzan con la letra A
select * from Customers
where CompanyName like 'A%'

--Seleccionar todos los clientes que finalizan con la palabra "es"

select * from Customers
where CompanyName like '%es'

--Seleccionar todos los clientes que contengan la palabra "mer"
select * from Customers
where CompanyName like '%mer'

--Seleccionar todos los clientes con una ciudad que comience 
select * from Customers
where city like '_ondon'

--Seleccionar todos los clientes con una ciudad que comience con L y seguido de tres cualquiera caracteres y que termine con la palabra "on"
select * from Customers
where City like '%L___on'

--Selecciona todos los productos que comiencen con la "a" o "c" o "t"
select * from Products
where ProductName like '[act]%' 

--Seleccionar todos los productos que comiencen de la letra b a la g
select * from Products
where ProductName like '[b-g]%' 

--Clausula in()
--Seleccionar todos los clientes de alemania, españa, y reino unido 
select * from Customers
where Country in('Germany', 'Spain', 'UK')


/* Forma2
select * from Customers
where Country in('Germany')
or Country= 'Spain' or 
Country = 'UK'*/

--not in
--Seleccionar todos los clientes que no son de alemania, españa, y reino unido
select * from Customers
where Country not in('Germany', 'Spain', 'UK')

/*Forma 2
select * from Customers
where not(Country = 'Germany'
or Country= 'Spain' or 
Country = 'UK')*/

--Beetwen
--Seleccionar todos los productos con un precio entre 10 y 20 dolares
select * from Products
where UnitPrice not between 18 AND 20
 --Forma 2
select * from Products
where UnitPrice>= 18 AND UnitPrice<= 20

--Alias de columnas y alias de tablas
--Seleccionar el nombre del producto, su stock y su precio
select ProductName as 'Nombre del Producto', UnitsInStock as 
Existencia, UnitPrice as Precio from Products

select ProductName as 'Nombre del Producto', UnitsInStock as 
Existencia, p.UnitPrice as Precio
from Products as p 
inner join [Order Details] as od
on p.ProductID = od.ProductID

