<?php
include '../functions/error.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    session_start();
    extract($_POST);

    $user_id = $_SESSION['persona']['idUsuario'];
    $condicion = $condicion[0];

    require("../php/connection.php");

    if ($accion == "create") {
        $UltimoID = 0;
         try {
            
            $query = "INSERT INTO vehiculos_venta (`vehiculo_matricula`, `precio`, `year`, `vehiculo_modelo`, `image`, `vehiculo_Categoria`, `nuevo`, `puertas`, `motor`, `transmision`, `traccion`, `pasajeros`, `color`, `disponible`, `tipocombustible`, `tipoconsumo`, `tamano_baul`) 
                           VALUES ('$Matricula', '$precio', '$year', '$modelo', '$foto', '$categoria', '$condicion', '$puertas', '$motor', '$transmision', '$traccion', '$pasajeros', '$color', 1, '$combustible', '$rendimiento', '$baul')";

            $mysqli->query($query);
            $_SESSION['success_message'] = "El Vehiculo fue registrado correctamente";

             try {
                $UltimoID =  $mysqli->query("SELECT MAX(idVehiculos_Venta) AS ultimo_id FROM vehiculos_venta")->fetch_assoc()['ultimo_id'];

                foreach ($caracteristicas as $caracteristica) {
                    $mysqli->query("INSERT INTO caracteristicasvsvehiculoventa (`idCaracteristica`, `idVehiculoVenta`) VALUES ('$caracteristica ','$UltimoID')");
                }
            } catch (Exception $e) {
                $_SESSION['error_message'] = Error_SQL($e);
        } 
        } catch (Exception $e) {
            $_SESSION['error_message'] = $e;
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
