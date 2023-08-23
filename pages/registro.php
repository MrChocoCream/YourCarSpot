<?php session_start();
require("../php/connection.php");

$caracteristicas = $mysqli->query("SELECT * FROM `vehiculo_caracteristicas`");
$categoria = $mysqli->query("SELECT * FROM `vehiculo_categoria`");
$marcas = $mysqli->query("SELECT * FROM `vehiculos_marcas`");
$modelos = $mysqli->query("SELECT * FROM `vehiculos_modelos`");

$caracteristicas_array = array();
if (isset($_GET["id"])) {

    $resultado = $mysqli->query("SELECT * from vehiculos_venta left JOIN vehiculos_modelos on idVehiculos_Modelos = vehiculo_modelo  join vehiculos_marcas on vehiculos_modelos.marca = vehiculos_marcas.idVehiculos_Marca join vehiculo_categoria on vehiculos_venta.vehiculo_Categoria = vehiculo_categoria.idVehiculo_Categoria where vehiculos_venta.idVehiculos_Venta =" . $_GET["id"])->fetch_assoc();
    if ($resultado == null) {
        header("Location: ./registro.php");
        die();
    }
    extract($resultado);
 
    $caracteristicas_id = $mysqli->query("SELECT idVehiculo_Caracteristicas FROM caracteristicasvsvehiculoventa join vehiculo_caracteristicas on vehiculo_caracteristicas.idVehiculo_Caracteristicas = caracteristicasvsvehiculoventa.IdCaracteristica where IdVehiculoVenta =" . $_GET["id"]);
    
    while ($datos = $caracteristicas_id->fetch_assoc()) {
        $caracteristicas_array[] = $datos['idVehiculo_Caracteristicas'];
    }
}



?>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Incluir archivo de Js y estilos CSS -->
    <script src="../js/funciones.js" defer></script>

    <link href="../css/output.css" rel="stylesheet">
    <link href="../css/input.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <title>Login</title>

</head>

<body>

    <?php include "./nav.php" ?>
    <div class="w-screen p-6 mt-14">

        <span class="block text-3xl font-bold border-b-2 border-orange-300 ">Registro de Vehiculo</span>
        <form action="../controller/vehiculo.php<?php if (isset($_GET["id"])) echo '?id='.$_GET["id"]; ?>" method="post" class="flex flex-col gap-6 items-center mt-4 ">
            <div id="cuadro" class="flex gap-12">
                <div class="flex flex-col gap-5">
                    <span class="font-semibold ">Datos Generales:</span>
                    <div class="grid grid-cols-2 gap-4">

                    <input type="hidden" name="accion" value="<?php  echo isset($_GET["id"])? 'update':"create" ?>">
                   
                    <label>
                            <span>Matricula</span></br>
                            <input required  type="text" name="matricula" placeholder="matricula" value="<?php if (isset($vehiculo_matricula)) echo $vehiculo_matricula; ?>">
                        </label>
                        <label>
                            <span>Color</span></br>
                            <input required type="text" name="color" placeholder="color" value="<?php if (isset($color)) echo $color; ?>">
                        </label>

                        <label>
                            <span>Marca</span></br>
                            <select id="marca" name="marca" onchange="updateModelos()">
                                <option value="" <?php if (!isset($marca)) echo 'selected'; ?>>Marca</option>
                                <?php
                                if ($marcas) {
                                    if ($marcas->num_rows > 0) {
                                        while ($datos = $marcas->fetch_assoc()) {
                                            $selected = (isset($marca)) && $marca == $datos['idVehiculos_Marca'] ? 'selected' : '';
                                            echo "<option value=\"{$datos['idVehiculos_Marca']}\" $selected>{$datos['marca_nombre']}</option>";
                                        }
                                    }
                                    $marcas->free();
                                } else {
                                    echo "<option>Error executing the query: " . $mysqli->error . "</option>";
                                }
                                ?>
                            </select>

                        </label>
                        <label>
                            <span>Modelo</span></br>
                            <select id="modelo" value="<?php if (isset($vehiculo_modelo)) echo $vehiculo_modelo; ?>" name="modelo">

                                <option value="" selected>Modelo</option>
                            </select>
                        </label>


                        <label>
                            <span>Tipo de Vehiculo</span><br>
                            <select id="categoria" name="categoria">

                                <option value="" <?php if (!isset($vehiculo_Categoria)) echo 'selected'; ?>>Tipo</option>
                                <?php
                                if ($categoria) {
                                    if ($categoria->num_rows > 0) {
                                        while ($datos = $categoria->fetch_assoc()) {
                                            $selected = (isset($vehiculo_Categoria) && $vehiculo_Categoria == $datos['idVehiculo_Categoria']) ? 'selected' : '';
                                            echo "<option value=\"{$datos['idVehiculo_Categoria']}\" $selected>{$datos['nombre_Categoria']}</option>";
                                        }
                                    }
                                    $categoria->free();
                                } else {
                                    echo "<option>Error executing the query: " . $mysqli->error . "</option>";
                                }
                                ?>
                            </select>
                        </label>


                        <label>
                            <span>Año</span></br>
                            <input required type="number" name="year" placeholder="Año" value="<?php if (isset($year)) echo $year; ?>">
                        </label>
                        <div class="flex gap-4 items-center ">
                            Condición:
                            <label>
                                <input required class="w-fit" type="radio" name="condicion[]" value="1" <?php if (isset($nuevo) && $nuevo) echo "checked"; ?>> Nuevo
                            </label>
                            <label>
                                <input required class="w-fit" type="radio" name="condicion[]" value="0" <?php if (isset($nuevo) && !$nuevo) echo "checked"; ?>> Usado
                            </label>
                        </div>

                        
                    </div>

                    <div>
                        <span class="font-semibold text-base">Caracteristicas:</span>
                        <div class="grid grid-cols-2 gap-1 h-80 max-w-md overflow-scroll mt-3 ">

                            <?php

                            if ($caracteristicas) {
                                if ($caracteristicas->num_rows > 0) {

                                    while ($datos = $caracteristicas->fetch_assoc()) {
                                $checkbox_value = in_array($datos['idVehiculo_Caracteristicas'], $caracteristicas_array) ? "checked" : "";
                            ?>
                                        <label class="  ">
                                            <input <?php echo $checkbox_value ?>  type="checkbox" name="caracteristicas[]" value="<?php echo $datos['idVehiculo_Caracteristicas'] ?>">
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
                    </div>
                    <label>
                        <span>Precio</span>
                        <input required type="number" name="precio" value="<?php if (isset($precio)) echo  $precio; ?>" placeholder="Precio ">
                    </label>
                </div>
                <div class="flex flex-col gap-5 w-40  ">
                    <span class="font-semibold">Datos tecnicos</span>
                    <label>
                        <span>Motor</span></br>
                        <input required type="text" name="motor" value="<?php if (isset($precio)) echo  $motor; ?>" placeholder="motor ">
                    </label>

                    <label>
                        <span>Trasmision</span></br>
                        <input required type="text" name="trasmision" value="<?php if (isset($precio)) echo  $trasmision; ?>" placeholder="Trasmision ">
                    </label>
                    <label>
                        <span>Traccion</span></br>
                        <input required type="text" name="traccion" value="<?php if (isset($precio)) echo  $traccion; ?>"  placeholder="Traccion ">
                    </label>
                    <label>
                        <span>Pasajeros</span></br>
                        <input required type="text" name="pasajeros" value="<?php if (isset($pasajeros)) echo  $pasajeros; ?>"  placeholder="Pasajeros ">
                    </label>
                    <label>
                        <span>Puertas</span></br>
                        <input required type="text" name="puertas" value="<?php if (isset($puertas)) echo  $puertas; ?>" placeholder="Puertas ">
                    </label>
                </div>
            </div>
            <div class="w-full max-w-sm  ">

                <label>
                    <span>Descripcion</span>
                    <textarea rows="5" name="Descripcion" placeholder="Escriba una descripcion sobre su vehiculo "></textarea>
                </label>
                <label>
                    <span>Subir Fotos</span>
                    <input  type="file" class="hidden">
                </label>

                <button class="w-full text-center  py-4 mt-5 bg-orange-600 rounded-lg text-sm  font-semibold text-white" type="submit">Registrar Vehiculo</a>
            </div>
        </form>
    </div>
    <script>
        $(document).ready(function() {
            updateModelos();
        });
    </script>


</body>

</html>