<?php

include '../functions/error.php';
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    session_start();

    extract($_POST);

    require("./connection.php");
    
    try {
        var_dump($query);
        $mysqli->query($query);
        $_SESSION['success_message'] = "Registro eliminado correctamente";
    } catch (Exception $e) {
        $_SESSION['error_message'] = Error_SQL($e);
    }
   header("Location: ../pages/mantenimiento.php");
     exit;
}
