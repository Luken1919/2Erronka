<?php
// Verifica si se ha enviado el formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Verifica si se han enviado tanto el nombre de usuario como la contraseña
    if (isset($_POST['ErabiltzaileIzena']) && isset($_POST['Pasahitza'])) {
        // Variables de conexión a la base de datos (ajusta estos valores según tu configuración)
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

        // Escapa los datos de entrada para prevenir inyección SQL
        $username = $conn->real_escape_string($_POST['ErabiltzaileIzena']);
        $Pasahitza = $conn->real_escape_string($_POST['Pasahitza']);

        // Consulta SQL para verificar las credenciales
        $sql = "SELECT * FROM Erabiltzailea WHERE ErabiltzaileIzena='$username' AND Pasahitza='$Pasahitza'";
        $result = $conn->query($sql);

        if ($result->num_rows == 1) {
            // Inicio de sesión exitoso, redirecciona a la página principal
            session_start();
            $_SESSION['loggedin'] = true;
            $_SESSION['username'] = $username;
            header("Location: index.php");
        } else {
            // Credenciales incorrectas, redirecciona a la página de inicio de sesión con un mensaje de error
            header("Location: login.php?error=credenciales_invalidas");
        }

        // Cierra la conexión
        $conn->close();
    } else {
        // Redirecciona a la página de inicio de sesión si no se proporcionaron nombre de usuario y contraseña
        header("Location: login.php?error=falta_usuario_contraseña");
    }
} else {
    // Redirecciona a la página de inicio de sesión si se accede directamente a este script sin enviar el formulario
    header("Location: ../index.html");
}
?>
