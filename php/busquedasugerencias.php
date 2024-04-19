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

    if (!empty($anio_min)) {
        $condiciones[] = "year >= $anio_min";
    }

    if (!empty($anio_max)) {
        $condiciones[] = "year <= $anio_max";
    }

    if (!empty($precio_min)) {
        $condiciones[] = "precio >= $precio_min";
    }

    if (!empty($precio_max)) {
        $condiciones[] = "precio <= $precio_max";
    }

    // Define the columns to be included in the WHERE condition
    $columns = array(
        "tipocombustible",
        "tamano_baul"
    );

    // Loop through each column and add it to the conditions array if it's set in the $_POST data
    foreach ($columns as $column) {
        if (!empty($_POST[$column])) {
            // Assuming $column is a string column, you might need to sanitize it if it's user input
            $condiciones[] = "$column = '{$_POST[$column]}'";
        }
    }

    $sql = "SELECT * FROM vehiculos_venta 
            LEFT JOIN vehiculos_modelos ON idVehiculos_Modelos = vehiculo_modelo  
            JOIN vehiculos_marcas ON vehiculos_modelos.marca = vehiculos_marcas.idVehiculos_Marca 
            JOIN vehiculo_categoria ON vehiculos_venta.vehiculo_Categoria = vehiculo_categoria.idVehiculo_Categoria";

    if (!empty($condiciones)) {
        $sql .= " WHERE " . implode(" AND ", $condiciones);
    }

    $_SESSION['query'] = $sql;
    $_SESSION['post'] = $_POST;

    header("Location: ../pages/resultado.php");
}


?>