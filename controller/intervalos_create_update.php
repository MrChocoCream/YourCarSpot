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
            
            //idVehiculos_Categoria    , nombre_Categoria

            $query = "INSERT INTO tamanobaul (descripBaul, capacidadMinBaul, capacidadMaxBaul ) VALUES ('$intervalo','$capMin','$capMax')";
        
            $mysqli->query($query);
            $_SESSION['success_message'] = "Registro agregada correctamente</b>";
           
        } catch (Exception $e) {
          
            $_SESSION['error_message'] = Error_SQL($e);
        }
    } elseif ($accion == "update") {
        try {
            $query = "UPDATE tamanobaul SET descripBaul='$intervalo', capacidadMinBaul='$intervaloMin',  capacidadMaxBaul='$intervaloMax' WHERE idTamanoBaul='$id'";
            $mysqli->query($query);
            $_SESSION['success_message'] = "Registro actualizado correctamente";
        } catch (Exception $e) {
            
            $_SESSION['error_message'] = Error_SQL($e);
        }
    }

    header("Location: ../pages/mantenimiento.php");
    exit;
}
