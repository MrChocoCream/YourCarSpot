<?php session_start(); 
require("../php/connection.php");
$marcas = $mysqli->query("SELECT * FROM `vehiculos_marcas`");
$modelo = $mysqli->query("SELECT * FROM `vehiculos_modelos`");
$categoria = $mysqli->query("SELECT * FROM `vehiculo_categoria`");
$combustible = $mysqli->query("SELECT * FROM `combustible`");
$transmision = $mysqli->query("SELECT * FROM `transmision`");
$caracteristicas = $mysqli->query("SELECT * FROM `vehiculo_caracteristicas`");
$capacidadbaul = $mysqli->query("SELECT * FROM `tamanobaul`");
$favoritos = $mysqli->query("select * from favoritos left join vehiculos_venta on favoritos.idVehiculo = vehiculos_venta.idVehiculos_Venta left JOIN vehiculos_modelos on idVehiculos_Modelos = vehiculo_modelo  join vehiculos_marcas on vehiculos_modelos.marca = vehiculos_marcas.idVehiculos_Marca join vehiculo_categoria on vehiculos_venta.vehiculo_Categoria = vehiculo_categoria.idVehiculo_Categoria");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <script src="../js/funciones.js" defer></script>
    <link href="../css/output.css" rel="stylesheet">
    <link href="../css/input.css" rel="stylesheet">
    
    <title>Busqueda Asistida</title>

    <style>
        .textSZ{
            font-size: 20px;
            margin-bottom: 10px;
        }
    </style>

</head>
<body>
<div class="w-screen">

    <?php include "./nav.php" ?>
    <div class="flex flex-col gap-8" style="justify-content: center; align-items: center; width: 100vw; padding-top: 20px;">
        <form action="../php/busquedasugerencias.php" method="post" class="mt-14 p-6">
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

            <!-- Rango de precio -->
            <label for="make" class="block text-sm font-medium text-gray-700 text-24px" style="font-size: 20px;">¿Cuál es tu presupuesto?</label>
            <label for="make" class="mb-6 block text-sm font-medium text-gray-700" style="margin-bottom: 10px;">Por favor, indica cuál es el presupuesto para tu coche nuevo.</label>
            <div class="grid grid-cols-2 gap-8">
                <label>
                    <input type="number" name="precio_min" placeholder="Precio mínimo">
                </label>
                
                <label>
                    <input type="number" name="precio_max" placeholder="Precio máximo">
                </label>
            </div>

            <!-- Tipo de vehiculo -->
            <label for="make" class="mt-6 block text-sm font-medium text-gray-700 text-24px textSZ">¿Qué tipos de coche te gustan?</label>
            <div class="grid grid-cols-2 gap-6 gap-x-8 h-75 pr-4 text-orange">
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
         

            <!-- Tipo de combustible -->
            <label for="make" class="mt-8 block text-sm font-medium text-gray-700 text-24px textSZ">¿Qué tipo de combustible te gustaría?</label>
            <div class="grid grid-cols-2 gap-6 gap-x-8 h-20 pr-4 text-orange">
            <?php
                if ($combustible) {
                    if ($combustible->num_rows > 0) {
                        while ($datos = $combustible->fetch_assoc()) {
                        ?>
                            <label class="bg-orange-600 rounded-lg p-1 ps-5 flex items-center h-fit">
                                <input type="checkbox" name="tipo[]" value="<?php echo $datos['idcombustible'] ?>">&nbsp;<?php echo $datos['descripcionCb'] ?>
                            </label>
                        <?php
                        }
                    }
                    $combustible->free();
                    } else {
                        echo "<option >Error executing the query: " . $mysqli->error . "</option>";
                    }
            ?>
            </div>
            

            <!-- Caracteristicas -->
            <label for="make" class="mt-8 block text-sm font-medium text-gray-700 text-24px textSZ">¿Cuál de los equipamientos más populares te interesan?</label>
            <div class="grid grid-cols-2 gap-6 gap-x-8 h-40 pr-4 text-orange" style="overflow-y: scroll;">
            <?php
                if ($caracteristicas) {
                    if ($caracteristicas->num_rows > 0) {
                        while ($datos = $caracteristicas->fetch_assoc()) {
                        ?>
                            <label class="bg-orange-600 rounded-lg p-1 ps-5 flex items-center h-fit">
                                <input type="checkbox" name="tipo[]" value="<?php echo $datos['idVehiculo_Caracteristicas'] ?>">&nbsp;<?php echo $datos['Vehiculo_Caracteristica'] ?>
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
            
            
            <!-- Tamaño Baul -->
            <label for="make" class="mt-8 block text-sm font-medium text-gray-700 text-24px textSZ">¿Cuál es el mínimo tamaño de baul que necesitas?</label>
            <div class="grid grid-cols-2 gap-6 gap-x-8 h-20 pr-4 text-orange">
            <?php
                if ($capacidadbaul) {
                    if ($capacidadbaul->num_rows > 0) {
                        while ($datos = $capacidadbaul->fetch_assoc()) {
                        ?>
                            <label class="bg-orange-600 rounded-lg p-1 ps-5 flex items-center h-fit">
                                <input type="checkbox" name="tipo[]" value="<?php echo $datos['idTamanoBaul'] ?>">&nbsp;<?php echo $datos['descripBaul'] ?>
                            </label>
                        <?php
                        }
                    }
                    $capacidadbaul->free();
                    } else {
                        echo "<option >Error executing the query: " . $mysqli->error . "</option>";
                    }
            ?>
            </div>
            
            <!-- Tipo transmision -->
            <div style="margin-top: 75px;;">
                <label for="transmission" class="block text-sm font-medium text-gray-700 textSZ">¿Qué transmisión quieres?</label>
                <select id="transmision" onchange="updateTransmision()" name="transmision" placeholder="transmision">
                                <option value="" selected>Transmision</option>
                                <?php
                                if ($transmision) {
                                    if ($marcas->num_rows > 0) {
                                        while ($datos = $transmision->fetch_assoc()) {
                                            echo "<option value=\"{$datos['idtransmision']}\">{$datos['descripTrans']}</option>";
                                        }
                                    }
                                    $transmision->free();
                                } else {
                                    echo "<option >Error executing the query: " . $mysqli->error . "</option>";
                                }
                                ?>
                            </select>
            </div>
            
            <!-- Enviar -->
            <button type="submit" class="mt-8 w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-indigo-600 text-base font-medium text-black hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 sm:w-auto sm:text-sm">
                Buscar
            </button>
        </form>
    </div>
         
        
    </body>
</html>