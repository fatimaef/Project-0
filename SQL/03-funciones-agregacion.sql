
/* MIN y MAX */

-- Ejercicio 1: Encontrar la duración mínima de las pistas en milisegundos.
select MIN("Milliseconds")
from "Track";

-- Ejercicio 2: Encontrar la duración máxima de las pistas en milisegundos.
select max("Milliseconds")
from "Track" t ;

-- Ejercicio 3: Encontrar el precio mínimo de las pistas.
select min("UnitPrice")
from "Track" t ;

-- Ejercicio 4: Encontrar el precio máximo de las pistas.
select max("UnitPrice")
from "Track" t ;

-- Ejercicio 5: Encontrar la fecha mínima de la factura.
select min("InvoiceDate") 
from "Invoice" i ;

-- Ejercicio 6: Encontrar la fecha máxima de la factura.
select MAX("InvoiceDate")
from "Invoice";

/* COUNT y SUM */

-- Ejercicio 7: Contar el número total de pistas.
select count("TrackId") as "N Track"
from "Track" t ;

-- Ejercicio 8: Contar el número de clientes en Brasil.
select COUNT("Customer"."Country") as "Total Brasil Customers"
from "Customer" 
where "Country" ='Brazil';

-- Ejercicio 9: Sumar la duración total de todas las pistas en milisegundos.
select sum("Milliseconds") as "Total Duration"
from "Track" t ;

-- Ejercicio 10: Contar el número de empleados con el título 'Sales Support Agent'.
select COUNT("EmployeeId") as "N Sales Support Agent"
from "Employee" e 
where "Title" = 'Sales Support Agent';

-- Ejercicio 11: Sumar el total de las cantidades en las facturas.
select SUM("Total") as "Total Invoice"
from "Invoice";

/* AVG, STDDEV, VARIANCE */

-- Ejercicio 12: Calcular la duración media de las pistas en milisegundos.
select AVG("Milliseconds")
from "Track" t ;
   

-- Ejercicio 13: Calcular el precio medio de las pistas.
select AVG("UnitPrice")
from "Track" t ;

-- Ejercicio 14: Calcular la desviación estándar de la duración de las pistas.
select stddev("Milliseconds")
from "Track" t ;

-- Ejercicio 15: Calcular la varianza de la duración de las pistas.
select variance("Milliseconds") 
from "Track" t ;

-- Ejercicio 16: Calcular la desviación estándar del precio de las pistas.
select stddev("UnitPrice") 
from "Track" t ;

/* CONCAT */

-- Ejercicio 17: Concatenar el nombre y el apellido de los clientes.
select CONCAT("FirstName" ,' ', "LastName") as "CustomerName"
from "Customer";
