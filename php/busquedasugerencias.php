<?php
if ($_SERVER["REQUEST_METHOD"] === "POST") {

    session_start();
    require("connection.php");

    $_POST["condicion"] = (isset($_POST["condicion"]) && count($_POST["condicion"]) === 1) ? $_POST["condicion"][0] : "";
    extract($_POST);

    $condiciones = array();
    $condiciones[] = "disponible";

    if (isset($_POST["tipo_vehiculo"])) {
        $tipo = "'" . implode("','", $_POST["tipo_vehiculo"]) . "'";
        $condiciones[] = "vehiculo_categoria IN ($tipo)";
    }

    if (isset($_POST["tipo_combustible"])) {
        $tipo = "'" . implode("','", $_POST["tipo_combustible"]) . "'";
        $condiciones[] = "tipocombustible IN ($tipo)";
    }

    if (isset($_POST["caracteristicas"])) {
        $tipo = "'" . implode("','", $_POST["caracteristicas"]) . "'";
        $condiciones[] = "caracteristicasvsvehiculoventa.IdCaracteristica IN ($tipo)";
    }

    if (isset($_POST["tamano_bahul"])) {
        $tipo = "'" . implode("','", $_POST["tamano_bahul"]) . "'";
        $condiciones[] = "tamano_baul IN ($tipo)";
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

    $sql = "SELECT * FROM vehiculos_venta 
            LEFT JOIN vehiculos_modelos ON idVehiculos_Modelos = vehiculo_modelo  
            JOIN vehiculos_marcas ON vehiculos_modelos.marca = vehiculos_marcas.idVehiculos_Marca 
            JOIN vehiculo_categoria ON vehiculos_venta.vehiculo_Categoria = vehiculo_categoria.idVehiculo_Categoria
            JOIN caracteristicasvsvehiculoventa on vehiculos_venta.idVehiculos_Venta = caracteristicasvsvehiculoventa.IdVehiculoVenta
            JOIN combustible on vehiculos_venta.tipocombustible = combustible.idcombustible";

    if (!empty($condiciones)) {
        $sql .= " WHERE " . implode(" AND ", $condiciones);
    }

    $_SESSION['query'] = $sql;
    $_SESSION['post'] = $_POST;

    header("Location: ../pages/resultado.php");
}
?>
