-- Max() y Min() son funciones en sql, que nos permiten obtener el maximo o minimo valor de una columna en nuestra tabla.

-- Opción 1
SELECT MAX(id) AS ultimo_id
FROM consignaciones;
-- Opción 2
SELECT id
FROM consignaciones
ORDER BY id DESC
LIMIT 1;
-- Opción 3
SELECT id
FROM consignaciones
WHERE id = (
        SELECT MAX(id)
        FROM consignaciones
    );


-- Para obtener el penúltimo registro de una tabla en SQL
/**
La cláusula OFFSET 1 en una consulta SQL se utiliza para saltar la primera fila (que sería el último registro en la tabla después de ordenarla en orden descendente). 
El LIMIT 1 se utiliza para limitar el resultado a una sola fila, lo que significa que obtendrás la segunda fila del conjunto de resultados,
que en este caso es el penúltimo registro de la tabla.
*/
SELECT *
FROM tbl_users
ORDER BY id_user DESC
LIMIT 1 OFFSET 1;
