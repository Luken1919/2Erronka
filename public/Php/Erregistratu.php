<?php
// Conexión a la base de datos (ajusta estos valores según tu configuración)
$host = "mysql";
$usuario = "admin";
$password = "1234";
$base_de_datos = "Erronka2_Rugby";



// Crear conexión
$conexion = new mysqli($host, $usuario, $password, $base_de_datos);

// Verificar la conexión
if ($conexion->connect_error) {
    die("Error en la conexión: " . $conexion->connect_error);
}

// Recibir datos del formulario
$izena = $_POST['Izena'];
$abizena = $_POST['abizena'];
$erabiltzaileIzena = $_POST['Erabiltzailea'];
$helbideElectronikoa = $_POST['email'];
$pasahitza = $_POST['Pasahitza'];

// Query para insertar datos
$sql = "INSERT INTO Erabiltzailea (Izena, Abizena, ErabiltzaileIzena, HelbideElektronikoa, Pasahitza) 
        VALUES ('$izena', '$abizena', '$erabiltzaileIzena', '$helbideElectronikoa', '$pasahitza')";

if ($conexion->query($sql) === TRUE) {
    echo "Registro exitoso";
} else {
    echo "Error: " . $sql . "<br>" . $conexion->error;
}

// Cerrar conexión
$conexion->close();
?>

