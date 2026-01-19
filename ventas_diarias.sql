-- ============================================
-- ESTRUCTURA DE LA TABLA
-- ============================================
CREATE TABLE IF NOT EXISTS project.dataset.ventas_diarias (
  fecha DATE,
  cliente_id STRING,
  producto STRING,
  valor_venta NUMERIC
);

-- ============================================
-- DATOS DE EJEMPLO (10 REGISTROS FICTICIOS)
-- ============================================
INSERT INTO project.dataset.ventas_diarias (fecha, cliente_id, producto, valor_venta) VALUES
  ('2024-01-15', 'CLI001', 'Laptop Pro', 1250.00),
  ('2024-01-15', 'CLI002', 'Mouse Inalámbrico', 45.50),
  ('2024-01-16', 'CLI001', 'Teclado Mecánico', 89.99),
  ('2024-01-16', 'CLI003', 'Monitor 27"', 350.00),
  ('2024-01-17', 'CLI002', 'Laptop Pro', 1250.00),
  ('2024-01-17', 'CLI004', 'Auriculares Bluetooth', 75.25),
  ('2024-01-18', 'CLI001', 'Monitor 27"', 350.00),
  ('2024-01-18', 'CLI003', 'Webcam HD', 120.00),
  ('2024-01-19', 'CLI005', 'Laptop Pro', 1250.00),
  ('2024-01-20', 'CLI002', 'Teclado Mecánico', 89.99);

-- ============================================
-- CONSULTAS ANALÍTICAS
-- ============================================

-- 1. Total ventas por cliente
-- Agrupa las ventas por cliente y calcula el total de ventas de cada uno.
SELECT
  cliente_id,
  SUM(valor_venta) AS total_ventas
FROM project.dataset.ventas_diarias
GROUP BY cliente_id;

-- 2. Total ventas por mes
-- Agrupa las ventas por mes y año, ordenadas cronológicamente.
SELECT
  FORMAT_DATE('%Y-%m', fecha) AS mes,
  SUM(valor_venta) AS total_ventas
FROM project.dataset.ventas_diarias
GROUP BY mes
ORDER BY mes;

-- 3. Top 5 clientes por ventas
-- Identifica los 5 clientes con mayores ventas totales, ordenados de mayor a menor.
SELECT
  cliente_id,
  SUM(valor_venta) AS total_ventas
FROM project.dataset.ventas_diarias
GROUP BY cliente_id
ORDER BY total_ventas DESC
LIMIT 5;

-- 4. Ventas por producto
-- Analiza qué productos generan más ingresos, ordenados por total de ventas descendente.
SELECT
  producto,
  SUM(valor_venta) AS total_ventas
FROM project.dataset.ventas_diarias
GROUP BY producto
ORDER BY total_ventas DESC;

-- 5. Ventas por día
-- Muestra el total de ventas agrupado por fecha, útil para detectar picos o caídas diarias.
SELECT
  fecha,
  SUM(valor_venta) AS total_ventas
FROM project.dataset.ventas_diarias
GROUP BY fecha
ORDER BY fecha;

-- 6. Mejor cliente por mes
-- Identifica el cliente con mayores ventas en cada mes usando funciones de ventana.
SELECT
  mes,
  cliente_id,
  total_ventas
FROM (
  SELECT
    FORMAT_DATE('%Y-%m', fecha) AS mes,
    cliente_id,
    SUM(valor_venta) AS total_ventas,
    ROW_NUMBER() OVER (
      PARTITION BY FORMAT_DATE('%Y-%m', fecha)
      ORDER BY SUM(valor_venta) DESC
    ) AS rn
  FROM project.dataset.ventas_diarias
  GROUP BY mes, cliente_id
)
WHERE rn = 1;

-- 7. Ventas promedio por cliente
-- Calcula el valor promedio de venta por cliente, útil para medir consistencia en compras.
SELECT
  cliente_id,
  AVG(valor_venta) AS promedio_venta
FROM project.dataset.ventas_diarias
GROUP BY cliente_id;

-- 8. Número de transacciones por cliente
-- Cuenta cuántas transacciones tiene cada cliente, identificando clientes frecuentes vs ocasionales.
SELECT
  cliente_id,
  COUNT(*) AS total_transacciones
FROM project.dataset.ventas_diarias
GROUP BY cliente_id
ORDER BY total_transacciones DESC;
