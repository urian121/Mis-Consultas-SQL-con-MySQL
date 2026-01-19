-- ============================================
-- CONSULTAS: EMPLEADOS Y MENSAJEROS
-- ============================================

-- 1. Empleados que NO son mensajeros (usando NOT IN)
-- Identifica empleados que no tienen registro en la tabla de mensajeros.
-- Nota: Esta consulta puede ser lenta con grandes volúmenes de datos si hay valores NULL.
SELECT 
  id
FROM tbl_empleados
WHERE id NOT IN (
  SELECT empleado_id 
  FROM tbl_mensajeros 
  WHERE empleado_id IS NOT NULL
);

-- 2. Empleados que NO son mensajeros (usando LEFT JOIN - RECOMENDADO)
-- Versión optimizada usando LEFT JOIN, más eficiente y maneja correctamente los valores NULL.
-- Retorna solo los empleados que no tienen coincidencia en la tabla de mensajeros.
SELECT 
  e.id
FROM tbl_empleados e
LEFT JOIN tbl_mensajeros m ON e.id = m.empleado_id
WHERE m.empleado_id IS NULL;

-- 3. Listar todos los empleados
-- Obtiene el identificador de todos los empleados registrados en el sistema.
SELECT 
  id
FROM tbl_empleados
ORDER BY id;

-- 4. Listar todos los mensajeros
-- Obtiene los identificadores de empleados que tienen el rol de mensajero.
SELECT 
  empleado_id
FROM tbl_mensajeros
ORDER BY empleado_id;

-- 5. Empleados que SÍ son mensajeros (usando INNER JOIN)
-- Obtiene los empleados que tienen registro como mensajeros con información de ambas tablas.
SELECT 
  e.id,
  e.*
FROM tbl_empleados e
INNER JOIN tbl_mensajeros m ON e.id = m.empleado_id
ORDER BY e.id;

-- 6. Conteo de empleados por tipo
-- Compara el total de empleados vs el total de mensajeros para análisis estadístico.
SELECT 
  (SELECT COUNT(*) FROM tbl_empleados) AS total_empleados,
  (SELECT COUNT(*) FROM tbl_mensajeros) AS total_mensajeros,
  (SELECT COUNT(*) FROM tbl_empleados) - (SELECT COUNT(*) FROM tbl_mensajeros) AS empleados_no_mensajeros;
