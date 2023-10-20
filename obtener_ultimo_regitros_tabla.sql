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