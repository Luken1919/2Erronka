<?php

$servername = "mysql";
$username = "admin";
$password = "1234";
$database = "Erronka2_Rugby";


$conn = new mysqli($servername, $username, $password, $database);


if ($conn->connect_error) {
    die("Error en la conexión a la base de datos: " . $conn->connect_error);
}


if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $aukera_diseinua = $conn->real_escape_string($_POST["aukera_diseinua"]);
    $ekitaldi_mota = implode(", ", $_POST["ekitaldi_mota"]);
    $hobekuntza_oharra = $conn->real_escape_string($_POST["hobekuntza_oharra"]);
    $hobekuntza_entrenamenduak = $conn->real_escape_string($_POST["hobekuntza_entrenamenduak"]);
    $beste_ideiak = $conn->real_escape_string($_POST["beste_ideiak"]);
    $izena = $conn->real_escape_string($_POST["izena"]);
    $abizena = $conn->real_escape_string($_POST["abizena"]);
    $korreoa = $conn->real_escape_string($_POST["korreoa"]);
    $dni = $conn->real_escape_string($_POST["dni"]);

    
    $sql = "INSERT INTO inkesta (aukera_diseinua, ekitaldi_mota, hobekuntza_oharra, hobekuntza_entrenamenduak, beste_ideiak, izena, abizena, korreoa, dni) 
            VALUES ('$aukera_diseinua', '$ekitaldi_mota', '$hobekuntza_oharra', '$hobekuntza_entrenamenduak', '$beste_ideiak', '$izena', '$abizena', '$korreoa', '$dni')";

    if ($conn->query($sql) === TRUE) {
        header("Location: ../formularioabidalita.html");;
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}


$conn->close();
?>
