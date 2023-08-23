<?php session_start();
require("../php/connection.php");

if (!isset($_SESSION['query'])) {
    header("Location: ./home.php");
    die();
}

extract($_SESSION['post']);
$resultado = $mysqli->query($_SESSION['query']);
$marcas = $mysqli->query("SELECT * FROM `vehiculos_marcas`");
$modelo = $mysqli->query("SELECT * FROM `vehiculos_modelos`");

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
    <div id="cuadro" class="w-screen p-6 mt-14 ">
    <span class=" block w-full text-3xl font-bold border-b-2 border-orange-300">Buscar Vehiculo</span>
        <div class="flex gap-8 mt-8 ">
            <!-- IZQUIERDA -->
            <form action="../php/buscar.php" method="post" class="p-2 shadow-lg" >
                <div class="flex justify-center gap-16  mb-12">

                    <div class="flex flex-col  gap-6 max-w-xs">

                        <div class=" flex flex-col gap-6 ">
                            <label >
                            <span>Marca</span>
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
                            </label>
                            <label for="">
                                <span>Modelo</span>
                                <select id="modelo" name="modelo" placeholder="Modelo">
                                    <option value="" selected>Modelo</option>
                                </select>
                            </label>
                            <label class="flex flex-col w-full">
                                <span>Año desde</span>
                                <input type="number" name="anio_min" placeholder="Año" value="<?php echo $anio_min; ?>">
                            </label>
                            <label class="flex flex-col w-full">
                                <span>Año hasta</span>
                                <input type="number" name="anio_max" placeholder="Año" value="<?php echo $anio_max; ?>">
                            </label>
                            <label class="flex flex-col w-full">
                                <span>Precio desde</span>
                                <input type="number" name="precio_min" placeholder="Precio mínimo" value="<?php echo $precio_min; ?>">
                            </label>
                            <label class="flex flex-col w-full">
                                <span>Precio hasta</span>
                                <input type="number" name="precio_max" placeholder="Precio máximo" value="<?php echo $precio_max; ?>">
                            </label>
                            <label class="flex flex-col w-full">
                                <span>Estado</span>
                                <select name="condicion[]" class=" w-full" placeholder="Marca">
                                    <option value="1" <?php echo ($condicion === 'Nuevo') ? 'selected' : ''; ?>>Nuevo</option>
                                    <option value="0" <?php echo ($condicion === 'Usado') ? 'selected' : ''; ?>>Usado</option>
                                    <option value="" <?php echo ($condicion == '') ? 'selected' : ''; ?>>Ambos</option>
                                </select>
                            </label>
                            <!-- Resto del código HTML del formulario ... -->


                        </div>
                    </div>
                </div>
                <div class="flex flex-col items-center w-full gap-14">
                    <button class="text-center w-full py-4 bg-orange-600 rounded-lg text-sm leading-normal font-semibold text-white" type="submit">Ajustar Busqueda</button>
                </div>
            </form>
            <!-- DERECHA -->
            <div class="flex flex-wrap justify-between gap-8 p-2 w-full h-[calc(100vh-175px)] shadow-lg overflow-y-scroll">
                <?php
                if ($resultado) {
                    if ($resultado->num_rows > 0) {
                        while ($datos = $resultado->fetch_assoc()) {
                            
                ?>
                           <a href="./detalle.php?id=<?php echo $datos['idVehiculos_Venta']?>" class="h-fit bg-gray-300 hover:bg-orange-200 rounded-xl p-1">
                                <div class="w-72 h-48 object-fill rounded-xl bg-white overflow-hidden">
                                    <img src="../pictures/<?php echo is_file("../pictures/carro_" . $datos['idVehiculos_Venta']) ? "carro_" . $datos['idVehiculos_Venta'] : "default.jpg" ?> " alt="">
                                </div>
                                <p class="font-bold text-black"><?php echo   $datos['nombre_Categoria'] . " " .$datos['marca_nombre'] . " " . $datos['Modelo_nombre'] . " " . $datos['year']; ?> </p>
                                <p class="text-gray-600">RD$ <?php echo number_format($datos['precio'], 2, ',', '.'); ?></p>
                        </a>

                <?php
                        }
                    } else {
                        echo "<div class='w-full  text-center'> 
                                <span class='text-xl font-semibold'>No hay vehiculos con las caracteristicas especificadas.</span>
                             </div>";
                    }
                    $resultado->free();
                } else {
                    echo "<tr><td colspan='5'>Error executing the query: " . $mysqli->error . "</td></tr>";
                }
                ?>
            </div>
        </div>
    </div>
</body>

</html>