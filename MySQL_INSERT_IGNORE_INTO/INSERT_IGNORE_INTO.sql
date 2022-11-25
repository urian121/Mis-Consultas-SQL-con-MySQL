
use empresax;
show tables;
describe empleados;
select * from empleados;

INSERT INTO empleados(nombre, cedula, correo)
	VALUES ('urian', '123', 'urian@gmail.com');

    
INSERT IGNORE INTO empleados(nombre, cedula, correo)
	VALUES ('urian', '123', 'urian@gmail.com');
    
    
-- Si deseas tener la Tabla solo debes ejecutar este codigo, ya posicionado en una BD
    
CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `cedula` int(11) NOT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


