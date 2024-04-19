<?php
require("./connection.php");

if (isset($_GET["marcaId"])) {

   $marcaId = $_GET["marcaId"];
    
    $resultado = $mysqli->query("SELECT * FROM vehiculos_modelos WHERE marca = $marcaId");
    $modelos = array();
    
    while ($row = $resultado->fetch_assoc()) {
        $modelos[] = array(
            "id" => $row["idVehiculos_Modelos"],
            "nombre" => $row["Modelo_nombre"]
        );
    }
    
    $resultado->close();
    
    echo json_encode($modelos);
}
?>
