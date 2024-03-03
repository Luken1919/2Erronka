<?php
// Conexión a la base de datos (suponiendo que ya tienes la conexión establecida)
$servername = "mysql";
$username = "admin";
$password = "1234";
$database = "Erronka2_Rugby";

$conn = new mysqli($servername, $username, $password, $database);

// Verificar la conexiónn
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Consulta SQL para obtener todos los usuarios
$sql = "SELECT Kod, Izena, Abizena, ErabiltzaileIzena, HelbideElektronikoa FROM Erabiltzailea where Mota <> 'Admin'";
$result = $conn->query($sql);

// Mostrar los usuarios en una tabla
?>
<!DOCTYPE html>
<html lang="eu">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tolosa Union Rugby</title>
    <link rel="stylesheet" href="Style/index.css">
    <link rel="icon" href="Irudiak/logonew.png" type="image/png">
</head>

<body>
<header>
    <h1><a href="indexAdmin.php"><img src="Irudiak/logonew.png" width="160" height="160" alt="Mi foto" /></h1>
    <nav>
      
      <ul>
        <li class="menu"><a href="inkesta_ikusi.php">Inkesten emaitzak</a></li>
        <li class="menu"><a href="Erabiltzaileak.php">Erabiltzaileak</a></li>
      </ul>
      <ul class="proba">
        <li class="ikono"><img src="Irudiak/icono/usuario-de-perfil.png" alt="Mi foto" /></a>
          <ul>
            <li class="menu"><a href="index.html">Itxi</a></li>
          </ul>
        </li>
      </ul>
      
    </nav>
  </header>
    <main>
        <h2>Erabiltzaileak</h2>
        <table border="1">
            <tr>
                <th>Kod</th>
                <th>Izena</th>
                <th>Abizena</th>
                <th>ErabiltzaileIzena</th>
                <th>HelbideElektronikoa</th>
                <th>Ekintzak</th>
            </tr>
            <?php
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>" . $row["Kod"] . "</td>";
                    echo "<td>" . $row["Izena"] . "</td>";
                    echo "<td>" . $row["Abizena"] . "</td>";
                    echo "<td>" . $row["ErabiltzaileIzena"] . "</td>";
                    echo "<td>" . $row["HelbideElektronikoa"] . "</td>";
                    echo "<td><a href='?delete_id=" . $row["Kod"] . "'>Eliminar</a></td>";
                    echo "</tr>";
                }
            } else {
                echo "<tr><td colspan='5'>No hay usuarios</td></tr>";
            }
            ?>
        </table>
    </main>
    
    
</body>
</html>

<?php
// Si se recibe una solicitud para eliminar un usuario
if (isset($_GET['delete_id'])) {
    $id_to_delete = $_GET['delete_id'];

    // Consulta SQL para eliminar el usuario
    $sql_delete = "DELETE FROM Erabiltzailea WHERE Kod = $id_to_delete";
    if ($conn->query($sql_delete) === TRUE) {
        echo "<script>alert('Usuario eliminado correctamente.');window.location.href='Erabiltzaileak.php';</script>";
    } else {
        echo "<script>alert('Error al eliminar el usuario: " . $conn->error . "');</script>";
    }
}

// Cerrar la conexión
$conn->close();
?>
