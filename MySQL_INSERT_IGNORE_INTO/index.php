<?php
if(isset($_POST['submit'])){
    $usuario  = "root";
    $password = "";
    $servidor = "localhost";
    $basededatos = "empresax";
    $con = mysqli_connect($servidor, $usuario, $password) or die("No se ha podido conectar al Servidor");
    $db = mysqli_select_db($con, $basededatos) or die("Upps! Error en conectar a la Base de Datos");

    $SqlInsert = ("INSERT INTO empleados(nombre, cedula, correo)
                    VALUES('{$_POST['nombre']}','{$_POST['cedula']}','{$_POST['correo']}')");
    $resulInsert = mysqli_query($con, $SqlInsert);
    echo '<pre><center>';
        print_r($SqlInsert);
    echo '</center></pre>';
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>urian viera | Web developer</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <style>
        .row{
            background: #e0e0e0 !important;
            padding: 15px 0px;
        }
    </style>
</head>
<body>
    
<div class="container mt-5">
  <div class="row justify-content-md-center">

    <form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
        <div class="form-group">
            <label for="nombre">Nombre</label>
            <input type="text" name="nombre" class="form-control">
        </div>
        <div class="form-group">
            <label for="cedula">Cedula</label>
            <input type="number" name="cedula" class="form-control">
        </div>
        <div class="form-group">
            <label for="correo">Correo</label>
            <input type="email" name="correo" class="form-control">
        </div>
        <input type="submit" name="submit" class="btn btn-primary btn-block" value="Enviar mi formulario"><br>
    </form>

  </div>
</div>

</body>
</html>