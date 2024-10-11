
-- Ejercicio  1: Encuentra el nombre de las pistas y los títulos de los álbumes a los que pertenecen.
select "t"."Name" as "Track Name" , "a2"."Title" as "Album Title" 
from "Track" t 
left join "Album" a2 on "t"."AlbumId" = "a2"."AlbumId" ;

-- Ejercicio 2: Lista los nombres de los artistas y los títulos de sus álbumes. Ordena los resultados por artista.
select "a"."Name" , "Title" , "a"."ArtistId" 
from "Artist" a 
left join "Album" a2 on "a"."ArtistId" = "a2"."ArtistId" 
order by "a"."Name" ;

-- comprobación ej 2
select *
from "Album" a 
where "ArtistId" = 43 ;

-- Ejercicio 3: Encuentra los nombres de los clientes y los totales de sus facturas. Extrae solo los 5 clientes con mayor total. 
select concat("FirstName" ,' ' , "LastName") as "Customer Name" , "i"."Total" as "Total Spent" 
from "Customer" c 
inner join "Invoice" i ON "c"."CustomerId" = "i"."CustomerId" 
order by "i"."Total" desc 
limit 5 ;

-- Ejercicio 4: Lista los nombres de los empleados y los nombres de los clientes que les han sido asignados.
select CONCAT("e"."FirstName" ,' ', "e"."LastName") as "Employee Name" , CONCAT("c"."FirstName" , ' ' , "c"."LastName") as "Customer Name"
from "Employee" e 
inner join "Customer" c ON "EmployeeId" = "SupportRepId" ;


-- Ejercicio 5: Muestra los ID de las facturas y los nombres de las pistas incluidas en esas facturas.
select "InvoiceId" , "t"."Name" as "TrackName"
from "InvoiceLine" il 
inner join "Track" t ON "il"."TrackId" = "t"."TrackId" ;

-- Ejercicio 6: Encuentra los nombres de los artistas y los géneros de sus pistas.
select distinct "r"."Name" as "Artist_Name" , "g"."Name" as "Genre_Name"
from "Artist" r
left join "Album" a ON "r"."ArtistId" = "a"."ArtistId"
left join "Track" t ON "a"."AlbumId" = "t"."AlbumId" 
left join "Genre" g on "t"."GenreId" = "g"."GenreId" ;

-- Ejercicio 7: Muestra los nombres de las pistas y el tipo de medio en el que están disponibles.
select "t"."Name" as "Track Name" , "mt"."Name" as "Media Type"
from "Track" t 
inner join "MediaType" mt ON "t"."MediaTypeId" = "mt"."MediaTypeId" ;

-- Ejercicio 8: Encuentra todas las pistas y, si existen, muestra los nombres de los géneros a los que pertenecen. Incluye también las pistas que no tienen un género asignado.**
select "t"."Name" as "Track Name" , "g"."Name" as "Genre Name"
from "Track" t 
left join "Genre" g ON "t"."GenreId" = "g"."GenreId" ;

-- Ejercicio 9: Muestra todos los clientes y, si existen, muestra las facturas que han realizado. Incluye también los clientes que no tienen ninguna factura.
select concat("c"."FirstName" , ' ' , "c"."LastName") as "Customers", "i"."InvoiceId" , "i"."Total" as "Spent"
from "Customer" c 
left join "Invoice" i ON "c"."CustomerId" = "i"."CustomerId" ;

-- Ejercico 10: Encuentra todos los álbumes y, si existen, muestra los nombres de los artistas que los crearon. Incluye también los álbumes que no tienen un artista asignado (aunque en este caso en la base de datos de Chinook, todos los álbumes tienen un artista asignado).
select "Title" as "Album Title" , "Name" as "Artists"
from "Album" a 
left join "Artist" a2 ON "a"."ArtistId" = "a2"."ArtistId" ;

-- Ejercicio 11: Cuenta cuántas pistas hay en cada género. Ordena los generos en función del número de canciones de mayor a menor. 
select COUNT ("TrackId") as "N Track" , "g"."Name" as "Genre Type"
from "Genre" g 
inner join "Track" t ON "g"."GenreId" = "t"."GenreId" 
GROUP by "g"."Name"
ORDER by "N Track" desc ;

--  Ejercicio 12: Muestra los títulos de los álbumes y la duración total de todas las pistas en cada álbum.
select SUM ("t"."Milliseconds") as "Track Duration" , "a"."Title" as "Album Title"
from "Album" a 
inner join "Track" t ON "a"."AlbumId" = "t"."AlbumId"
group by "a"."AlbumId" ;

-- Ejercicio 14: Encuentra los nombres de los clientes y el total gastado por cada uno.
select "c"."CustomerId" , CONCAT ("FirstName" , ' ' , "LastName") as "Customer Name" , sum("i"."Total") as "Total Spent"
from "Customer" c 
inner join "Invoice" i ON "c"."CustomerId" = "i"."CustomerId" 
group by "c"."CustomerId" ;

-- Ejercicio 15: Encuentra todos los empleados y, si existen, muestra los nombres de los clientes que tienen asignados. Incluye también los empleados que no tienen clientes asignados.
select concat("e"."FirstName" , ' ' , "e"."LastName") as "Employee Name" , concat("Customer"."FirstName", ' ', "Customer"."LastName") as "Customer Name"
from "Employee" e 
left join "Customer" on "e"."EmployeeId" = "Customer"."SupportRepId" ;


