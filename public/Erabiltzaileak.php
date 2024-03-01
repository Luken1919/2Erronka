<?php
// Conexión a la base de datos (suponiendo que ya tienes la conexión establecida)
$servername = "mysql";
$username = "admin";
$password = "1234";
$database = "Erronka2_Rugby";

$conn = new mysqli($servername, $username, $password, $database);

// Verificar la conexión
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
        <h1><a href="index.html"><img src="Irudiak/logonew.png" width="160" height="160" alt="Mi foto" /></h1>
        <nav>
            <ul>
                <li class="menu"><a href="Albisteak.html">Taldearen albisteak</a></li>
                <li class="menu"><a href="#">Historia</a>
                    <ul>
                        <li class="menu"><a href="Klubhistoria.html">Klubaren historia</a></li>
                        <li class="menu"><a href="Tituloak.html">Irabazitako tituluak</a></li>
                    </ul>
                </li>
                <li class="menu"><a href="#">Taldea</a>
                    <ul>
                        <li class="menu"><a href="gizonak.php">Gizonak</a></li>
                        <li class="menu"><a href="emakumeak.php">Emakumeak</a></li>
                        <li class="menu"><a href="sub18.php">Sub 18</a></li>
                        <li class="menu"><a href="sub16.php">Sub 16</a></li>
                    </ul>
                </li>
                <li class="menu"><a href="bazkidea.html">Bazkideentzako inkesta</a></li>
            </ul>
            <ul class="proba">
                <li class="ikono"><img src="Irudiak/icono/usuario-de-perfil.png" alt="Mi foto" /></a>
                    <ul>
                        <li class="menu"><a href="profila_editatu.html">Profila editatu</a></li>
                        <br>
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
    <footer>
        <div class="kontaktatu">
            <img src="Irudiak/logoa-modified.png" alt="Mi foto" />
            <div class="espaciofoot"></div>
            <div>
                <h2>GURE SARE SOZIALAK</h2>
                <p><img src="Irudiak/icono/insta.png" alt="insta"> @tolosa_Rugby_Union</p>
                <p><img src="Irudiak/icono/face.png" alt="insta"> @tolosa_RU</p>
                <p><img src="Irudiak/icono/you.png" alt="insta"> TolosaRugbyU_</p>
            </div>
            <div class="espaciofoot"></div>
            <div>
                <h2>GUREKIN KONTAKTAU</h2>
                <p>TolosaRugbyUnion@gmail.com</p>
                <p>telf: +34 638 99 99 23</p>
            </div>
            <div class="espacio"></div>
        </div>
        <p>Copyright &copy; 2024 Tolosa Rugby Union</p>
    </footer>
    <script src="js/script.js"></script>
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
