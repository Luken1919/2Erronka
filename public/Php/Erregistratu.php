<?php
// Verifica si se ha enviado el formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Conexión a la base de datos (ajusta estos valores según tu configuración)
    $servername = "mysql";
    $username = "admin";
    $password = "1234";
    $dbname = "Erronka2_Rugby";

    // Crea la conexión
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Verifica la conexión
    if ($conn->connect_error) {
        die("Conexión fallida: " . $conn->connect_error);
    }

    // Obtiene los datos del formulario
    $izena = $_POST['izena'];
    $abizena = $_POST['abizena'];
    $erabiltzailea = $_POST['erabiltzailea'];
    $email = $_POST['email'];
    $pasahitza = $_POST['pasahitza'];

    // Prepara y ejecuta la consulta SQL para insertar los datos
    $sql = "INSERT INTO Erabiltzailea (Izena, Abizena, Erabiltzailearen Izena, Helbide_elektronikoa, Pasahitza) VALUES ('$izena', '$abizena', '$erabiltzailea', '$email', '$pasahitza')";

    if ($conn->query($sql) === TRUE) {
        echo "Registro insertado correctamente";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    // Cierra la conexión
    $conn->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Registro</title>
</head>
<body>
    <h2>Registro de Usuario</h2>
    <form method="post" action="<?php echo $_SERVER["PHP_SELF"]; ?>">
        Izena: <input type="text" name="izena"><br>
        Abizena: <input type="text" name="abizena"><br>
        Erabiltzailearen Izena: <input type="text" name="erabiltzailea"><br>
        Helbide elektronikoa: <input type="email" name="email"><br>
        Pasahitza: <input type="password" name="pasahitza"><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
