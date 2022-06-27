
/** SQL para obtener Registros repetidos (Duplicados) en una tabla - MySQL */
$sql = ("SELECT * FROM demo GROUP BY Correo, Nombre HAVING COUNT(*) > 1")

$sql= ("SELECT Correo, COUNT(*) AS Total FROM demo GROUP BY Correo HAVING COUNT(*) > 1")

$sql = ("SELECT Correo, Nombre COUNT(*) Total FROM demo GROUP BY Correo, Nombre HAVING COUNT(*) > 1")