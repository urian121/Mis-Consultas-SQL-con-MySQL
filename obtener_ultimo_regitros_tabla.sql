-- Max() y Min() son funciones en sql, que nos permiten obtener el maximo o minimo valor de una columna en nuestra tabla.

-- Seleccionar la BD
        use sala_chat;
-- OBTENER EL PRIMER REGISTRO DE UNA TABLA
SELECT MIN(id_user) As primer_registro FROM tbl_users;
SELECT id_user FROM tbl_users ORDER BY id_user ASC;
SELECT id_user FROM tbl_users ORDER BY id_user ASC LIMIT 1;

-- Obener el segundo registro de una tabla
SELECT * FROM tbl_users LIMIT 1, 1;
SELECT * FROM tbl_usersLIMIT 1, 2;
/*
LIMIT 1, 2: En este caso, "1" especifica que queremos comenzar desde el segundo registro (el primero se considera 0) y "2"
indica que deseamos recuperar dos filas a partir de ese punto. Por lo tanto, devolverá el segundo y el tercer registro de la tabla, 
es decir, un total de dos filas.
*/

-- OBTENER EL ULTIMO REGISTRO DE UNA TABLA
SELECT Max(id_user) AS ultimo_registro FROM tbl_users;
SELECT id_user FROM tbl_users ORDER BY id_user DESC LIMIT 1;

SELECT id_user FROM tbl_users
WHERE id_user = (SELECT MAX(id_user) FROM tbl_users);


-- Obtener el penúltimo registro de una tabla en SQL
/**
La cláusula OFFSET 1 en una consulta SQL se utiliza para saltar la primera fila (que sería el último registro en la tabla después de ordenarla en orden descendente). 
El LIMIT 1 se utiliza para limitar el resultado a una sola fila, lo que significa que obtendrás la segunda fila del conjunto de resultados,
que en este caso es el penúltimo registro de la tabla.
*/
SELECT *
FROM tbl_users
ORDER BY id_user DESC
LIMIT 1 OFFSET 1;
