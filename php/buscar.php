
<?php


if ($_SERVER["REQUEST_METHOD"] === "POST") {


    session_start();
    require("connection.php");

    $_POST["condicion"] = (isset($_POST["condicion"]) && count($_POST["condicion"]) === 1) ? $_POST["condicion"][0] : "";
    extract($_POST);

    $condiciones = array();

    $condiciones[] = "disponible";
    
    if (isset($_POST["tipo"])) {
        $tipo = "'" . implode("','", $tipo) . "'";
        $condiciones[] = "vehiculo_categoria IN ($tipo)";
    }

    if ($condicion != "") {
       
        $condiciones[] = "nuevo = '$condicion'";
    }

    if (!empty($marca)) {
        $condiciones[] = "marca = '$marca'";
    }

    if (!empty($modelo)) {
        $condiciones[] = "idVehiculos_Modelos = '$modelo'";
    } 

    if (!empty($anioMin)) {
      
        $condiciones[] = "year >= $anioMin";
    }

    if (!empty($anioMax)) {
        $condiciones[] = "year <= $anioMax";
    }

    if (!empty($precioMin)) {
        $condiciones[] = "precio >= $precioMin";
    }

    if (!empty($precioMax)) {
        $condiciones[] = "precio <= $precioMax";
    }

    $sql = "select * from vehiculos_venta left JOIN vehiculos_modelos on idVehiculos_Modelos = vehiculo_modelo  join vehiculos_marcas on vehiculos_modelos.marca = vehiculos_marcas.idVehiculos_Marca join vehiculo_categoria on vehiculos_venta.vehiculo_Categoria = vehiculo_categoria.idVehiculo_Categoria" ;

    if (!empty($condiciones)) {
        $sql .= " WHERE " . implode(" AND ", $condiciones);
    }


    $_SESSION['query'] = $sql;
    $_SESSION['post'] = $_POST;
  
    var_dump($sql);
   
    header("Location: ../pages/resultado.php"); 
}

?>
