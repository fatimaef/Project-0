
-- Ejercicio 1:  Selecciona el nombre de todos los álbumes y ordénalos alfabéticamente.
select *
from "Album"
order by "Title" asc;

-- Ejercicio 2:  Encuentra el álbum con el mayor número de canciones.
select "Track"."AlbumId" , "Album"."Title" , COUNT("Track"."TrackId") as "N_canciones"
from "Album"
inner join "Track" on "Album"."AlbumId" = "Track"."AlbumId"
group by "Track"."AlbumId" , "Album"."Title" 
order by "N_canciones" desc
limit 1 ;

-- Ejercicio 3:  Calcula la duración promedio, desviación estándar y varianza por compositor.
select avg("Milliseconds") , stddev("Milliseconds") , variance("Milliseconds") , "Composer" 
from "Track" t 
group by "Composer" ;

-- Ejercicio 4: Selecciona el título y el precio de las pistas, y limita los resultados a 10.
select "Name" , "UnitPrice" 
from "Track" t 
order by "Name" desc 
limit 10 ;
   
-- Ejercicio 5: Lista los nombres de los empleados y ordénalos por el ID del empleado en orden descendente.
select concat("FirstName" , ' ' , "LastName") as "Employee" , "EmployeeId" 
from "Employee"
order by "EmployeeId" desc ;

-- Ejercicio 6:  Muestra el número de géneros distintos disponibles en la base de datos.
select count("Name") as "N_Genre"
from "Genre" g ;

-- Ejercicio 7: Selecciona el nombre del cliente y el país, limitando los resultados a 5, y ordena por el nombre del cliente.
select concat("FirstName" , ' ' , "LastName") as "Name" , "Country" 
from "Customer" c 
order by "Name" 
limit 5 ;
    
-- Ejercicio 8: Muestra la cantidad total de clientes agrupados por país.
select COUNT (*) , "Country"  
from "Customer" c 
group by "Country" ;

-- Ejercicio 9: Obtén el total de importes de facturas para cada país y muestra solo aquellos con un total superior a 10,000.
select SUM("Total") , "BillingCountry"
from "Invoice" i 
group by "BillingCountry"
having SUM("Total") > 10 ;

-- Ejercicio 10: Encuentra los países donde el número total de clientes es mayor a 5. Muestra el país y el número de clientes.
select COUNT ("CustomerId") as "N_Customer" , "Country"  
from "Customer" c 
group by "Country" 
having COUNT ("CustomerId") > 5 ;

-- Ejercicio 11: Obtén la cantidad de pistas en cada tipo de medio (MediaType) que tienen una duración mayor a 250,000 milisegundos.
 select COUNT (*) as "N_Track" , "mt"."MediaTypeId" as MediaType
 from "Track" t 
 inner join "MediaType" mt on "t"."MediaTypeId" = "mt"."MediaTypeId" 
 where "Milliseconds" > 250000
 group by "mt"."MediaTypeId" ;

-- Ejercicio 12: Lista el país y el número total de clientes que han sido asistidos por un representante de ventas específico, cuyo ID sea menor a 5.
select COUNT ("CustomerId") as "N_Customer" , "Country" 
from "Customer" c 
where "SupportRepId" < 5
group by "Country" ;

-- Ejercicio 13: Muestra los códigos postales de los clientes que han hecho más de 5 compras.
select distinct "PostalCode" 
from "Customer" c 
inner join "Invoice" i ON "c"."CustomerId"= "i"."CustomerId"
group by "c"."CustomerId" , "PostalCode" 
having COUNT (*) > 5 ;

-- Ejercicio 14: Encuentra la cantidad total de pistas en cada tipo de medio (MediaTypeId) donde el precio de la pista (UnitPrice) es mayor a 0.99 y la duración de la pista (Milliseconds) es mayor a 200,000. Muestra el tipo de medio y el número total de pistas.
select count("t"."Name") as "N_track" , "mt"."Name" as "Type_Media"
from "Track" t 
inner join "MediaType" mt ON "t"."MediaTypeId" = "mt"."MediaTypeId" 
where "UnitPrice" > 0.99 and "Milliseconds" > 200000
group by "mt"."MediaTypeId" ;

-- Ejercicio 15: Lista el país y el estado de los clientes que tienen el soporte asignado a un representante con ID mayor a 3 y cuyo nombre de empresa (Company) no es nulo. Muestra el país, el estado y el número de clientes.
select "Country" , "State" , count("CustomerId") as "N_Customer"
from "Customer" c 
where "SupportRepId" > 3 and "Company" is not null 
group by "Country" , "State" ;