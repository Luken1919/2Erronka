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
$izena = Garbitu($_POST['Izena']);
$abizena = Garbitu($_POST['abizena']);
$erabiltzaileIzena = Garbitu($_POST['Erabiltzailea']);
$helbideElectronikoa = Garbitu($_POST['email']);
$pasahitza = Garbitu($_POST['Pasahitza']);

// Query para insertar datos
$sql = "INSERT INTO Erabiltzailea (Izena, Abizena, ErabiltzaileIzena, HelbideElektronikoa, Pasahitza, Mota) 
        VALUES ('$izena', '$abizena', '$erabiltzaileIzena', '$helbideElectronikoa', '$pasahitza', 'Arrunta')";

if ($conexion->query($sql) === TRUE) {
    header("Location: ../SaioaHasi.html");
    exit;
} else {
    echo "Error: " . $sql . "<br>" . $conexion->error;
    header("Location: ../Erregistratu.html");
}

// Cerrar conexión
$conexion->close();

function Garbitu($datos) {
    $datos = trim($datos); // Eliminar espacios en blanco antes y después de los datos
    $datos = stripslashes($datos); // Eliminar barras invertidas
    $datos = htmlspecialchars($datos); // Convertir caracteres especiales en entidades HTML
    return $datos;
}

?>

