select * from 
clientes as c 
inner join ordenes as o 
on c.numero = o.ClienteId

select c.numero as 'Numero de cliente', 
c.nombre as 'Nombre del cliente',
c.pais as 'Pais del cliente',
o.FechaOrden as 'Fecha de la orden', 
o.fechaEntrega as 'Feca de entrega',
o.ClienteId as 'Foreing key de la tabla cliente'
from 
clientes as c 
inner join ordenes as o 
on c.numero = o.ClienteId

--left join (la tabla izquierda siempre es la primera que se pone en el join)
select c.numero as 'Numero de cliente', 
c.nombre as 'Nombre del cliente',
c.pais as 'Pais del cliente',
o.FechaOrden as 'Fecha de la orden', 
o.fechaEntrega as 'Feca de entrega',
o.ClienteId as 'Foreing key de la tabla cliente'
from 
clientes as c 
left join ordenes as o 
on c.numero = o.ClienteId
where o.ClienteId is null

--seleccionar todos los datos de la tabla ordenes y la tabla clientes utilizando un left join
select * from 
clientes as c 
left join ordenes as o 
on c.numero = o.ClienteId
where o.ClienteId


select c.numero as 'Numero de cliente', 
c.nombre as 'Nombre del cliente',
c.pais as 'Pais del cliente',
o.FechaOrden as 'Fecha de la orden', 
o.fechaEntrega as 'Fecha de entrega',
o.ClienteId as 'Foreing key de la tabla cliente'
from 
Ordenes as o
right join Clientes as c
on c.numero = o.ClienteId


select c.numero as 'Numero de cliente', 
c.nombre as 'Nombre del cliente',
c.pais as 'Pais del cliente',
o.FechaOrden as 'Fecha de la orden', 
o.fechaEntrega as 'Fecha de entrega',
o.ClienteId as 'Foreing key de la tabla cliente'
from 
Ordenes as o
full join Clientes as c
on c.numero = o.ClienteId



select o.numero, nombre, pais, fechaOrden
from Ordenes as o
inner join 
(select numero, nombre, pais from Clientes) as a
on o.ClienteId = o.numero


select o.numero, nombre, pais, fechaOrden
from Ordenes as o
full join 
(select numero, nombre, pais from Clientes) as a
on o.ClienteId = o.numero