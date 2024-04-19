<?php
include '../functions/error.php';

if ($_GET) {
    session_start();

    extract($_GET);
    var_dump($_GET);
 
 
    require("../php/connection.php");
    
        try {

          
            $mysqli->query("UPDATE `agenda_compras` SET `status`='2' WHERE `id_agenda`=".$id);
            $mysqli->query("UPDATE `vehiculos_venta` SET `disponible`='1' WHERE `idVehiculos_Venta`=".$id_v);

        } catch (Exception $e) {
          
            $_SESSION['error_message'] = Error_SQL($e);
        }

   header("Location: ../pages/agenda.php");
    exit;
}
