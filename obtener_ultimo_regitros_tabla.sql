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
