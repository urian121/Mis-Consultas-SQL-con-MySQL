USE universidad;
show tables;
SELECT * FROM alumnos;
SELECT * FROM cursos;
SELECT * FROM notas;

-- SQL 1
SELECT 
	a.*,
    c.*
FROM alumnos AS a
INNER JOIN cursos AS c
ON a.cursos_id = c.id;

-- SQL 2
SELECT 
	a.*,
    c.*,
    n.*
FROM alumnos AS a
INNER JOIN cursos AS c
ON a.cursos_id = c.id
INNER JOIN notas AS n
ON a.notas_id = n.id;

-- SQL 3
SELECT 
	a.nombre,
    a.cedula,
    c.nombre_curso,
    n.semestre_1,
    n.semestre_2
FROM alumnos AS a
INNER JOIN cursos AS c
ON a.cursos_id = c.id
INNER JOIN notas AS n
ON a.notas_id = n.id;


