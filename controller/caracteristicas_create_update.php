<?php
include '../functions/error.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    session_start();
    foreach ($_POST as $key => $value) {
    $_POST[$key] = trim($value);
    }
    extract($_POST);

    require("../php/connection.php");
    if ($accion == "create") {
        try {
            
            //idVehiculos_Caracteristica    , vehiculo_caracteristica

            $query = "INSERT INTO vehiculo_caracteristicas (vehiculo_caracteristica) VALUES ('$caracteristica')";
        
            $mysqli->query($query);
            $_SESSION['success_message'] = "Registro agregada correctamente</b>";
           
        } catch (Exception $e) {
          
            $_SESSION['error_message'] = Error_SQL($e);
        }
    } elseif ($accion == "update") {
        try {
            $query = "UPDATE vehiculo_caracteristicas SET Vehiculo_Caracteristica='$caracteristica' WHERE idVehiculo_Caracteristicas='$id'";
            $mysqli->query($query);
            $_SESSION['success_message'] = "Registro actualizado correctamente";
        } catch (Exception $e) {
            
            $_SESSION['error_message'] = Error_SQL($e);
        }
    }

  header("Location: ../pages/mantenimiento.php");
   exit;
}
