<?php session_start();
require("../php/connection.php");

if (!isset($_GET["id"])) {
    header("Location: ./home.php");
    die();
}

$caracteristicas = $mysqli->query("SELECT * FROM caracteristicasvsvehiculoventa join vehiculo_caracteristicas on vehiculo_caracteristicas.idVehiculo_Caracteristicas = caracteristicasvsvehiculoventa.IdCaracteristica where IdVehiculoVenta =" . $_GET["id"]);
$resultado = $mysqli->query("SELECT * from vehiculos_venta JOIN vehiculos_modelos on idVehiculos_Modelos = vehiculo_modelo  join vehiculos_marcas on vehiculos_modelos.marca = vehiculos_marcas.idVehiculos_Marca join vehiculo_categoria on vehiculos_venta.vehiculo_Categoria = vehiculo_categoria.idVehiculo_Categoria where vehiculos_venta.idVehiculos_Venta =" . $_GET["id"])->fetch_assoc();
if ($resultado==null) {
    header("Location: ./home.php");
    die();
}
extract($resultado);

/* 
$data = $mysqli->query("SELECT * FROM `vehiculo_categoria`");
$categoria = $mysqli->query("SELECT * FROM `vehiculo_categoria`");
$marcas = $mysqli->query("SELECT * FROM `vehiculos_marcas`");
$modelos = $mysqli->query("SELECT * FROM `vehiculos_modelos`");
*/

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Incluir archivo de Js y estilos CSS -->
    <script src="../js/funciones.js" defer></script>

    <link href="../css/output.css" rel="stylesheet">
    <link href="../css/input.css" rel="stylesheet">
    <title>Login</title>

</head>

<body>
    <?php include "./nav.php" ?>
    <div class="w-screen p-6 mt-14 ">
        <span class=" text-3xl font-bold border-b-2 border-orange-300 mb-4 flex justify-between">
            <div>
            <?php echo $year . " " . $marca_nombre . " " . $Modelo_nombre . " "; ?>
            <span class="text-gray-500"> RD$ <?php echo number_format($precio, 2, '.', ','); ?> </span>
            </div>
            <?php if ($isInterno == 1) : ?>
            <a href="./registro.php?id=<?php echo $_GET["id"]?>" class=" flex w-8  hover:bg-blue-200">
                <img src="../svg/edit.svg" alt="">
            </a>
            <?php endif; ?>

        </span>

        <div class="flex  gap-6 justify-center ">

            <div class="mt-2 flex flex-col gap-4">

                <div class="w-60 h-40">
                    <img class="w-full h-full object-cover" src="../pictures/carro_1" alt="">
                </div>
                <div class="w-60 h-40">
                    <img class="w-full h-full object-cover" src="../pictures/carro_4" alt="">
                </div>
                <div class="w-60 h-40">
                    <img class="w-full h-full object-cover" src="../pictures/carro_3" alt="">
                </div>
            </div>
            <div class="flex flex-col font-semibold gap-1 ">

                <div class="flex gap-8">
                    <div class="flex flex-col gap-2">
                        <span class="text-lg mb-2">Datos Generales</span>
                        <span>Precio: <span class="text-gray-500"><?php echo number_format($precio, 2, '.', ',');  ?> </span></span>
                        <span>Marca: <span class="text-gray-500"><?php echo $marca_nombre; ?> </span></span>
                        <span>Modelo: <span class="text-gray-500"><?php echo $Modelo_nombre; ?> </span></span>
                        <span>Tipo: <span class="text-gray-500"><?php echo $nombre_Categoria; ?> </span></span>
                        <span>Año: <span class="text-gray-500"><?php echo $year; ?> </span></span>
                        <span>Color: <span class="text-gray-500"><?php echo $color; ?> </span></span>
                    </div>
                    <div class="flex flex-col gap-2">
                        <span class="text-lg mb-2">Datos Tecnicos</span>
                        <span>Matricula: <span class="text-gray-500"><?php echo $vehiculo_matricula; ?> </span></span>
                        <span>Motor: <span class="text-gray-500"><?php echo $motor; ?> </span></span>
                        <span>Transmision: <span class="text-gray-500"><?php echo $trasmision; ?> </span></span>
                        <span>Traccion: <span class="text-gray-500"><?php echo $traccion; ?> </span></span>
                        <span>Pasajeros: <span class="text-gray-500"><?php echo $pasajeros; ?> </span></span>
                        <span>Puertas: <span class="text-gray-500"><?php echo $puertas; ?> </span></span>
                    </div>

                </div>


                <span class="text-lg mb-2">Caracteristicas</span>
                <div class="grid grid-cols-2 gap-1 max-h-80  pr-4 ">

                    <?php
                    if ($caracteristicas) {
                        if ($caracteristicas->num_rows > 0) {

                            while ($datos = $caracteristicas->fetch_assoc()) {
                    ?>
                                <label class="bg-orange-600 text-white rounded-md">
                                    <input type="hidden" name="tipo[]" value="<?php echo $datos['idVehiculo_Caracteristicas'] ?>">
                                    &nbsp;<?php echo $datos['Vehiculo_Caracteristica'] ?>
                                </label>
                    <?php
                            }
                        }
                        $caracteristicas->free();
                    } else {
                        echo "<option >Error executing the query: " . $mysqli->error . "</option>";
                    }
                    ?>


                </div>
                <div class="grid grid-cols-2 gap-3 gap-x-14  pr-4 mt-6 ">
                    <span> <?php
                            if ($disponible) {
                                echo 'En posesion de la empresa';
                            } else {
                                echo 'No disponible';
                            }
                        ?> </span>
                    <button class="w-full text-center p-2 bg-orange-600 hover:bg-blue-600 rounded-lg text-sm  font-semibold text-white" type="submit">Solicitar test Driver</button>
                    <span>809-889-2235</span> 
                    <form action="./compra.php" method="post">
                        <input type="hidden" name="id" value="<?php echo $_GET["id"] ?>">
                        <?php
                            if ($disponible) {
                                echo '<button class="w-full text-center p-2 bg-orange-600 rounded-lg text-sm font-semibold text-white" type="submit">Agendar Compra</button>';
                            } else {
                                echo '<span disabled class="w-full block text-center p-2 bg-gray-600 rounded-lg text-sm font-semibold text-white" >Vehiculo No Disponible</span>';
                            }
                        ?>
                    </form>
                </div>
            </div>
        </div>

    </div>
</body>

</html>