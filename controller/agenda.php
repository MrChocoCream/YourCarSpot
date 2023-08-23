<?php
include '../functions/error.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    session_start();
   

    foreach ($_POST as $key => $value) {
    $_POST[$key] = trim($value);
    }
    extract($_POST);
    var_dump($_POST);
    $user_id = $_SESSION['persona']['idUsuario'];
 
    require("../php/connection.php");
    
        try {
            
            $query = "INSERT INTO agenda_compras (`id_usuario`, `id_vehiculo`, `fecha`, `hora`, `status`,`entrega_local`) VALUES ('$user_id ','$id ','$date ','$time','0','$entrega')";
        
            $mysqli->query($query);
            $_SESSION['success_message'] = "Su Compra fue agendada, Espere la visita de uno de nuestros representantes en caso se ser a domicilio";
            $mysqli->query("UPDATE `vehiculos_venta` SET `disponible`='0' WHERE `idVehiculos_Venta`=".$id);
        } catch (Exception $e) {
          
            $_SESSION['error_message'] = Error_SQL($e);
        }

    header("Location: ../pages/home.php");
    exit;
}
