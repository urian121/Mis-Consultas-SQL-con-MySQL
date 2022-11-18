$sqlCar = ("SELECT fotocars.*, carros.* FROM carros, fotocars  WHERE carros.id=fotocars.carro_id AND carros.id='".$idCar."' ");
$queryCar = mysqli_query($con, $sqlCar);
$DataCar  = mysqli_fetch_array($queryCar);