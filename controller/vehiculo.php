<?php
include '../functions/error.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    session_start();
    extract($_POST);

    $user_id = $_SESSION['persona']['idUsuario'];
    $condicion = $condicion[0];

    require("../php/connection.php");

    if ($accion == "create") {
        try {

            $query = "INSERT INTO vehiculos_venta  (`vehiculo_matricula`, `precio`, `year`, `vehiculo_modelo`, `vehiculo_Categoria`, `nuevo`,  `puertas`, `motor`, `trasmision`, `traccion`, `pasajeros`, `color`,`disponilbe`) 
                                                                 VALUES ('$matricula ','$precio','$year ','$modelo','$categoria','$condicion','$puertas','$motor','$trasmision','$traccion','$pasajeros',   '$color',`1`)";

            $mysqli->query($query);
            $_SESSION['success_message'] = "El Vehiculo fue registrado correctamente";


            try {
                $UltimoID =  $mysqli->query("SELECT MAX(idVehiculos_Venta) AS ultimo_id FROM vehiculos_venta")->fetch_assoc()['ultimo_id'];

                foreach ($caracteristicas as $caracteristica) {
                    $mysqli->query("INSERT INTO caracteristicasvsvehiculoventa (`IdCaracteristica`, `IdVehiculoVenta`) VALUES ('$caracteristica ','$UltimoID')");
                }
            } catch (Exception $e) {
                $_SESSION['error_message'] = Error_SQL($e);
            }
        } catch (Exception $e) {
            $_SESSION['error_message'] = Error_SQL($e);
        }

        header("Location: ../pages/detalle.php?id=".$UltimoID);
    } elseif ($accion == "update") {
        
        try {

            $query = "UPDATE `vehiculos_venta` SET `vehiculo_matricula`='$matricula',`precio`='$precio',`year`='$year',`vehiculo_modelo`='$modelo',`vehiculo_Categoria`='$categoria',`nuevo`='$condicion',`puertas`='$puertas',`motor`='$motor',`trasmision`='$trasmision',`traccion`='$traccion',`pasajeros`='$pasajeros',`color`='$color' WHERE `idVehiculos_Venta` =" . $_GET["id"];
           
            $mysqli->query($query);
            $_SESSION['success_message'] = "Registro actualizado correctamente";


            $UltimoID = $_GET["id"];

            $mysqli->query("delete from caracteristicasvsvehiculoventa where IdVehiculoVenta= $UltimoID ");

            if (isset($caracteristicas)) {
                foreach ($caracteristicas as $caracteristica) {
                   
                    $mysqli->query("INSERT INTO caracteristicasvsvehiculoventa (`IdCaracteristica`, `IdVehiculoVenta`) VALUES ('$caracteristica ','$UltimoID')");
                }
            }
        } catch (Exception $e) {

            $_SESSION['error_message'] = Error_SQL($e);
        }

        header("Location: ../pages/detalle.php?id=".$UltimoID);
    }
      
 exit;
}
