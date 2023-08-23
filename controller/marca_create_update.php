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
            
            $query = "INSERT INTO vehiculos_marcas (marca_nombre) VALUES ('$marca')";
        
            $mysqli->query($query);
            $_SESSION['success_message'] = "Registro agregada correctamente</b>";
           
        } catch (Exception $e) {
          
            $_SESSION['error_message'] = Error_SQL($e);
        }
    } elseif ($accion == "update") {
        try {
            $query = "UPDATE vehiculos_marcas SET marca_nombre='$marca' WHERE idVehiculos_Marca='$id'";
            $mysqli->query($query);
            $_SESSION['success_message'] = "Registro actualizado correctamente";
        } catch (Exception $e) {
            
            $_SESSION['error_message'] = Error_SQL($e);
        }
    }

    header("Location: ../pages/mantenimiento.php");
    exit;
}
