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

            $query = "INSERT INTO consumocombustibles (descripTipoconsumo, tc_valinicial, tc_valfinal) VALUES ('$consumo','$mpgmin','$mpgmax')";
        
            $mysqli->query($query);
            $_SESSION['success_message'] = "Registro agregada correctamente</b>";
           
        } catch (Exception $e) {
          
            $_SESSION['error_message'] = Error_SQL($e);
        }
    } elseif ($accion == "update") {
        try {
            $query = "UPDATE consumocombustibles SET descripTipoconsumo='$combustible', tc_valinicial='$combustibleMin',  tc_valfinal='$combustibleMax' WHERE idconsumo='$id'";
            $mysqli->query($query);
            $_SESSION['success_message'] = "Registro actualizado correctamente";
        } catch (Exception $e) {
            
            $_SESSION['error_message'] = Error_SQL($e);
        }
    }

    header("Location: ../pages/mantenimiento.php");
    exit;
}
