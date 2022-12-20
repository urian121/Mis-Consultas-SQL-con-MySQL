-- La cláusula IN, es un operador sql logico, que permite evaluar
-- si una expresion está dentro de una lista de valores. 

-- Sintaxis Operador IN  expresion-para-busca IN (lista de valores)


USE universidad;

SELECT 'URIAN50' IN (20, 3, 56, 50, 'URIAN');

SELECT * FROM alumnos;
SELECT * FROM alumnos WHERE edad=20 or edad=18 or edad=17;
SELECT * FROM alumnos WHERE edad IN (20, 25, 17) order by cedula;
SELECT * FROM alumnos WHERE nombre IN ('Urian', 50, 'Sofia');
SELECT * FROM alumnos where id IN(3, 6, 1);
DELETE FROM alumnos WHERE id IN(3, 6, 1);