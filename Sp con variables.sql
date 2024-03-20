/*Realizar un codigo transact para determinar si una persona tiene la edad para beber alcohol 
El codigo debe tener variable que determine la edad minima permitida y otro variable con la edad de la persona 
Comprar si la persona tiene la edad minima permitida, mostrando un mensaje 'Edad'*/
declare @EdadMinPermitida int;
declare @edadPersona int;

set @EdadMinPermitida = 18;
set @edadPersona = 21;
if @edadPersona >= @EdadMinPermitida
begin 
  print 'Edad permitida';
end 
else 
begin 
print 'Edad no permitida';
end;

--		SOLICITAR UNA EVALUACION 
-- >=40 IMPRIMIR A 
-- >=80 IMPRIMIR B 
-- >=70 IMPRIMIR C 
--      IMPRIMIR D
declare @Evaluacion int 
set @Evaluacion = 60;
select 
  case 
   when @Evaluacion >=90 then 'A'
   when @Evaluacion >=80 then 'B'
   when @Evaluacion >=70 then 'C'
ELSE 'F'
 end as 'Calificacion'

--solicictar un salario
-- >4000
-- calcule el incremento de 20%
-- >=5000
--calcule el incremento de 30%
-- <4000 aumento = 0




--generar un sp en donde se compare si un producto tiene mas de 100 unidades en stock, incrementar su precio 
--en 10% de lo contrario incrementara en 20%, utilizar la bd northwind 
