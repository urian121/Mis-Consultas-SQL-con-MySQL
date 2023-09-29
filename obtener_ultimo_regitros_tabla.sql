SELECT MAX(id) AS ultimo_id
FROM consignaciones;
SELECT id
FROM consignaciones
ORDER BY id DESC
LIMIT 1;
SELECT id
FROM consignaciones
WHERE id = (
        SELECT MAX(id)
        FROM consignaciones
    );