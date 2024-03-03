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
    <section>
      <h2>Inkesten Emaitzak</h2>
      <?php
        // Conexión a la base de datos (cambiar los valores según corresponda)
        $servername = "mysql";
        $username = "admin";
        $password = "1234";
        $database = "Erronka2_Rugby";
        
        $conn = new mysqli($servername, $username, $password, $database);

        // Verificar la conexión
        if ($conn->connect_error) {
            die("Error en la conexión a la base de datos: " . $conn->connect_error);
        }

        // Consulta SQL para obtener los resultados de la encuesta
        $sql = "SELECT * FROM inkesta";
        $result = $conn->query($sql);

        // Mostrar los resultados en forma de tabla
        if ($result->num_rows > 0) {
            echo "<table><tr><th>ID</th><th>Diseinua</th><th>Ekitaldi Mota</th><th>Hobekuntza Oharra</th><th>Hobekuntza Entrenamenduak</th><th>Beste Ideiak</th><th>Izena</th><th>Abizena</th><th>Korreoa</th><th>DNI</th></tr>";
            // Output data of each row
            while($row = $result->fetch_assoc()) {
                echo "<tr><td>" . $row["id"]. "</td><td>" . $row["aukera_diseinua"]. "</td><td>" . $row["ekitaldi_mota"]. "</td><td>" . $row["hobekuntza_oharra"]. "</td><td>" . $row["hobekuntza_entrenamenduak"]. "</td><td>" . $row["beste_ideiak"]. "</td><td>" . $row["izena"]. "</td><td>" . $row["abizena"]. "</td><td>" . $row["korreoa"]. "</td><td>" . $row["dni"]. "</td></tr>";
            }
            echo "</table>";
        } else {
            echo "Ez dago inkestarik.";
        }

        // Cerrar la conexión
        $conn->close();
      ?>
    </section>
  </main>
</body>
</html>
