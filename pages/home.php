<?php session_start();
require("../php/connection.php");
$marcas = $mysqli->query("SELECT * FROM `vehiculos_marcas`");
$modelo = $mysqli->query("SELECT * FROM `vehiculos_modelos`");
$categoria = $mysqli->query("SELECT * FROM `vehiculo_categoria`");
$favoritos = $mysqli->query("select * from favoritos left join vehiculos_venta on favoritos.idVehiculo = vehiculos_venta.idVehiculos_Venta left JOIN vehiculos_modelos on idVehiculos_Modelos = vehiculo_modelo  join vehiculos_marcas on vehiculos_modelos.marca = vehiculos_marcas.idVehiculos_Marca join vehiculo_categoria on vehiculos_venta.vehiculo_Categoria = vehiculo_categoria.idVehiculo_Categoria");


?>
<!DOCTYPE html>
<html lang="en">
<!-- home -->

<head>
    <!-- Incluir archivo de Js y estilos CSS -->
    <script src="../js/funciones.js" defer></script>
    <link href="../css/output.css" rel="stylesheet">
    <link href="../css/input.css" rel="stylesheet">

    <title>Login</title>
</head>

<body>
    <div class="w-screen">

        <?php include "./nav.php" ?>

        <form id="cuadro" action="../php/buscar.php" method="post" class="mt-14 p-6 ">
            <div class="p-2 shadow-md ">
                <span class="block text-3xl font-bold my-4  border-b-2 border-orange-300 relative ">Buscar Vehiculo
                <?php
            if (isset($_SESSION['error_message'])) {
                echo '<p id="msj" class="text-red-500 w-full text-center absolute transform duration-500 ease-in-out bottom-8">' . $_SESSION['error_message'] . '</p>';
                unset($_SESSION['error_message']);
            }
            if (isset($_SESSION['success_message'])) {
                echo '<span id="msj" class="text-green-500 w-full text-center absolute transform duration-500 ease-in-out left-0 bottom-8">' . $_SESSION['success_message'] . '</span>';
                unset($_SESSION['success_message']);
            }
            ?>
                </span>
                <div class="flex justify-center gap-14">

                    <div class="flex flex-col gap-6 max-w-xs">

                        <div class="flex text-xl font-bold text-orange-600 gap-4 ">
                            Condición:
                            <label>
                                <input type="checkbox" name="condicion[]" value="1"> Nuevo
                            </label>
                            <label>
                                <input type="checkbox" name="condicion[]" value="0"> Usado
                            </label>
                        </div>

                        <div class="grid grid-cols-2 gap-8">
                            <select id="marca" onchange="updateModelo()" name="marca" placeholder="Marca">
                                <option value="" selected>Marca</option>
                                <?php
                                if ($marcas) {
                                    if ($marcas->num_rows > 0) {
                                        while ($datos = $marcas->fetch_assoc()) {
                                            echo "<option value=\"{$datos['idVehiculos_Marca']}\">{$datos['marca_nombre']}</option>";
                                        }
                                    }
                                    $marcas->free();
                                } else {
                                    echo "<option >Error executing the query: " . $mysqli->error . "</option>";
                                }
                                ?>
                            </select>

                            <select id="modelo" name="modelo" placeholder="Modelo">
                                <option value="" selected>Modelo</option>
                            </select>

                            <label>

                                <input type="number" name="anio_min" placeholder="Año mínimo">
                            </label>
                            <label>

                                <input type="number" name="anio_max" placeholder="Año máximo">
                            </label>
                            <label>

                                <input type="number" name="precio_min" placeholder="Precio mínimo">
                            </label>
                            <label>

                                <input type="number" name="precio_max" placeholder="Precio máximo">
                            </label>

                        </div>

                    </div>

                    <div class="flex flex-col gap-8">
                        <span class="text-xl font-bold">Categoria de Vehiculo</span>
                        <div class="grid grid-cols-2 gap-6 gap-x-8 h-80 overflow-scroll pr-4 text-white">

                            <?php
                            if ($categoria) {
                                if ($categoria->num_rows > 0) {

                                    while ($datos = $categoria->fetch_assoc()) {
                            ?>
                                        <label class="bg-orange-600 rounded-lg p-1 ps-5 flex items-center h-fit">
                                            <input type="checkbox" name="tipo[]" value="<?php echo $datos['idVehiculo_Categoria'] ?>">&nbsp;<?php echo $datos['nombre_Categoria'] ?>
                                        </label>
                            <?php
                                    }
                                }
                                $categoria->free();
                            } else {
                                echo "<option >Error executing the query: " . $mysqli->error . "</option>";
                            }
                            ?>


                        </div>
                        <button type="submit" class="self-end flex gap-2 justify-center w-28 py-4 bg-orange-600 rounded-lg text-sm leading-normal font-semibold text-white">
                            <span>Buscar</span>
                            <img src="../svg/search.svg" alt="">
                        </button>

                    </div>
                </div>
            </div>

            <div class="p-2 shadow-md mt-2 ">
                <span class="block text-3xl font-bold my-4 border-b-2 border-orange-300 ">Favoritos</span>
                <div class="flex overflow-x-scroll gap-8 w-full">
                    <?php
                    if ($favoritos) {
                        if ($favoritos->num_rows > 0) {
                            while ($datos = $favoritos->fetch_assoc()) {
                    ?>
                                <a href="./detalle.php?id=<?php echo $datos['idVehiculos_Venta']?>" class="h-fit bg-gray-300 hover:bg-orange-200 rounded-xl p-1">
                                    <div class="w-72 h-48 object-fill rounded-xl bg-white overflow-hidden">
                                        <img src="../pictures/<?php echo is_file("../pictures/carro_" . $datos['idVehiculos_Venta']) ? "carro_" . $datos['idVehiculos_Venta'] : "default.jpg" ?> " alt="">
                                    </div>
                                    <p class="font-bold text-black"><?php echo   $datos['nombre_Categoria'] . " " . $datos['marca_nombre'] . " " . $datos['Modelo_nombre'] . " " . $datos['year']; ?> </p>
                                    <p class="text-gray-600">RD$ <?php echo number_format($datos['precio'], 2, ',', '.'); ?></p>
                            </a>
                    <?php
                            }
                        } else {
                            echo "<div class='w-full  text-center'> 
                                    <span class='text-xl font-semibold'>No hay vehiculos en favoritos.</span>
                                </div>";
                        }
                        $favoritos->free();
                    } else {
                        echo "<tr><td colspan='5'>Error executing the query: " . $mysqli->error . "</td></tr>";
                    }
                    ?>
                </div>
            </div>
        </form>
    </div>
</body>

</html>