-- Como sumar cantidades - Como sumas mas de 1 campos 
-- Funcion SUM ()
USE universidad;
show tables;
select * from alumnos;
select * from cursos;
select * from notas;
Select SUM(5+2+39);
SELECT SUM(semestre_1 + semestre_2) AS Totala_acumulado from notas where id=4;

select
a.nombre,
a.cedula,
c.nombre_curso,
n.semestre_1,
n.semestre_2,
SUM(n.semestre_1 + n.semestre_2) AS total_semestre_acumulado
FROM alumnos AS a
INNER JOIN cursos as c
ON a.cursos_id = c.id
INNER JOIN notas as n
ON a.notas_id = n.id
GROUP BY a.cedula;
