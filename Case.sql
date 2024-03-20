use NORTHWND

--Sintaxis 
/* Case 
 when condicion1 the resultado1
  when condicion2 the resultado2
   when condicion3 the resultado3
   else result 
   end; 
   */
   select *, 
		Case 
		 when Quantity > 30 then 'La cantidad es mayor a 30'
		 when Quantity = 30 then 'La cantidad es 30'
		 else 'La cantidad esta por debajo de 30'
		 end as CantidadTexto
   from [Order Details]


   select *,
		case 
		  when UnitsInStock = 0 then 'sin stock'
		  when UnitsInStock between 1 and 20 then 'stock bajo'
		  when UnitsInStock between 21 and 50 then 'Stock medio'
		  when UnitsInStock>=51 and UnitsInStock<=90 then 'stock alto'
		  else 'stock maximo'
		  end as 'tipo de stock'
   from Products


   create database pruebaCase
   use pruebaCase

   create table nuevaTabla(
    id int not null, 
	nombre varchar(40) not null, 
	unitprice money, 
	unitsinstock smallint, 
	constraint pk_nuevatabla
	primary key (id)
   )

   --Crear la estructura de una tabla a base de una consulta
   create table nuevatabla2 as,
   (select top 0 ProductID as numeroProducto, 
   ProductName as descripcion, UnitPrice as preciounitario,
   UnitsInStock as existencia 
   into nuevatabla3
   from NORTHWND.dbo.Products)

   select * from nuevaTabla2 


   alter table nuevatabla2
   add constraint pk_nuevatabla2
   primary key(numeroproducto)

   create table nuevatabla2 as,
   (select top 0 ProductID as numeroProducto, 
   ProductName as descripcion, UnitPrice as preciounitario,
   UnitsInStock as existencia 

   from NORTHWND.dbo.Products)

   select * from nuevaTabla2 


    create table nuevatabla2 as,
   (select top 0 ProductID as numeroProducto, 
   ProductName as descripcion, UnitPrice as preciounitario,
   UnitsInStock as existencia 
   from NORTHWND.dbo.Products

      select p,productID, p.productName, p.UnitPrice, p.UnitInStock, 
		case 
		  when UnitsInStock = 0 then 'sin stock'
		  when UnitsInStock between 1 and 20 then 'stock bajo'
		  when UnitsInStock between 21 and 50 then 'Stock medio'
		  when UnitsInStock>=51 and UnitsInStock<=90 then 'stock alto'
		  else 'stock maximo'
		  end as 'tipo de stock'
		  into tablaconcaso 
   from nprewfgt9 Products as p

   select * from tablaconcaso


   