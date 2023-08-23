<?php
include '../functions/error.php';
require("../php/connection.php");
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    session_start();
    extract($_POST);

    $agenda_data = $mysqli->query("SELECT * FROM `agenda_compras` where id_agenda =" . $agenda)->fetch_assoc();
    $hoy = date('Y-m-d');
    extract($_POST);
    extract($agenda_data);

    var_dump($agenda_data);
    var_dump($_POST);

    $user_id = $_SESSION['persona']['idUsuario'];
 
    try {

        $mysqli->query("UPDATE `vehiculos_venta` SET `disponible`='0' WHERE `idVehiculos_Venta`=".$id_vehiculo);
        $mysqli->query("UPDATE `agenda_compras` SET `status`='1' WHERE `id_agenda`=".$agenda);
        
        $mysqli->query("INSERT INTO vehiculos_vendidos (`idVehiculoVenta`, `id_usuario`, `idCliente`, `PrecioAcordado`, `fechaVenta`) VALUES ('$id_vehiculo ','$user_id ','$id_usuario ','$precio','$hoy')");;

        $_SESSION['success_message'] = "Gracias por su compra";

    } catch (Exception $e) {
      
        $_SESSION['error_message'] = Error_SQL($e);
    }

        header("Location: ../pages/home.php");
            exit;
}
