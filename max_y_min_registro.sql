
USE ejemplo_youtube;
-- Como obtener el primer registro de una tabla
-- Como obtener el Ultimo registro de una Tabla
-- Mostrar los registros con fecha maxima y fecha minima

SELECT * FROM demo;
SELECT MAX(id) AS ultimo_registro FROM demo;
SELECT MIN(id) AS primer_registro FROM demo;

SELECT max(fecha) as maxima_fecha from demo;
SELECT MIN(fecha) as minima_fecha from demo;

