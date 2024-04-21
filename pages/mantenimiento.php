<?php session_start();

if (!isset($_SESSION['persona']['isInterno']) || $_SESSION['persona']['isInterno']==0 ) {
    header("Location: ./home.php");
    die();
}
  

require("../php/connection.php");
$marcas = $mysqli->query("SELECT * FROM `vehiculos_marcas`");
$marcas2 = $mysqli->query("SELECT * FROM `vehiculos_marcas`");
$modelo = $mysqli->query("SELECT * FROM `vehiculos_modelos` join vehiculos_marcas on marca = idVehiculos_Marca ");
$caracteristicas = $mysqli->query("SELECT * FROM `vehiculo_caracteristicas`");
$baul = $mysqli->query("SELECT * FROM `tamanobaul`");
$combustible = $mysqli->query("SELECT * FROM `consumocombustibles`");
$consumo = $mysqli->query("SELECT * FROM `consumocombustibles`");
$categoria = $mysqli->query("SELECT * FROM `vehiculo_categoria`");
?>
<!DOCTYPE html>
<html lang="en">
<!-- home -->

<head>
    <!-- Incluir archivo de Js y estilos CSS -->
    <script src="../js/funciones.js" defer></script>
    <script src="../js/menu.js" defer></script>

    <link href="../css/output.css" rel="stylesheet">
    <link href="../css/input.css" rel="stylesheet">


    <script src="../node_modules/flowbite/dist/flowbite.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="../DataTables/datatables.min.js"></script>
    <link href="../DataTables/datatables.min.css" rel="stylesheet">


    <title>Mantenimientos</title>

</head>

<body>
    <?php include "./nav.php" ?>
    <script>
        $(document).ready(function() {
            $('#table_marcas').DataTable();
            $('#table_modelos').DataTable();
            $('#table_caracteristica').DataTable();
            $('#table_categoria').DataTable();
            $('#table_intervalo').DataTable();
            $('#table_combustible').DataTable();
        });
    </script>

    <div class="w-screen p-6 mt-14">
        <div class="w-full  flex gap-5 items-center relative">

            <div class="flex gap-5">

                <button mostrar="#marcas" class="activar bg-orange-400 rounded-md p-2 ">Marcas</button>
                <button mostrar="#modelos" class="activar bg-orange-400 rounded-md p-2">Modelos</button>
                <button mostrar="#caracteristica" class="activar bg-orange-400 rounded-md p-2">Caracteristica</button>
                <button mostrar="#categoria" class="activar bg-orange-400 rounded-md p-2">Categoria</button>
                <button mostrar="#intervalos" class="activar bg-orange-400 rounded-md p-2">Capacidades de Baules</button>
                <button mostrar="#combustible" class="activar bg-orange-400 rounded-md p-2">Rango de Combustibles</button>

            </div>
            <?php
            if (isset($_SESSION['error_message'])) {
                echo '<p id="msj" class="text-red-500 w-full text-center absolute transform duration-500 ease-in-out -mb-16 bottom-8">' . $_SESSION['error_message'] . '</p>';
                unset($_SESSION['error_message']);
            }
            if (isset($_SESSION['success_message'])) {
                echo '<span id="msj" class="text-green-500 w-full text-center absolute transform duration-500 ease-in-out left-0 -mb-16 bottom-8">' . $_SESSION['success_message'] . '</span>';
                unset($_SESSION['success_message']);
            }
            ?>
        </div>
        <div id="marcas" class="contenedor ">
            <div class="flex justify-end">
                <button class="flex items-cent gap-2 bg-green-500 p-2 rounded-md text-white" data-modal-target="marca-modal" data-modal-toggle="marca-modal">
                    <span>Añadir Marca</span>
                    <div class="w-5">
                        <img class="w-full h-full" src="../svg/add.svg" alt="">
                    </div>
                </button>
            </div>
            <table id="table_marcas" class="display table bg-gray-50 py-2 ">
                <thead>
                    <tr>
                        <th>id</th>
                        <th>Marca</th>
                        <th>Accion</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    if ($marcas) {
                        if ($marcas->num_rows > 0) {

                            while ($datos = $marcas->fetch_assoc()) {
                                $eliminar = array(
                                    'query' => "delete from vehiculos_marcas where idVehiculos_Marca = " . $datos['idVehiculos_Marca'],
                                    'msj' =>  "Eliminar  " . $datos['marca_nombre']
                                );
                    ?>
                                <tr>
                                    <td><?php echo $datos['idVehiculos_Marca']; ?></td>
                                    <td><?php echo $datos['marca_nombre']; ?></td>
                                    <td>
                                        <div class="flex gap-2 w-12 justify-center overflow-hidden bg-transparent">
                                            <div>
                                                <img onclick='EditarMarca(<?php echo json_encode($datos); ?>)' data-modal-target="marca-modal" data-modal-toggle="marca-modal" class="cursor-pointer" src="../svg/edit.svg" alt="">
                                            </div>
                                            <div>
                                                <img onclick='Eliminar(<?php echo json_encode($eliminar); ?> )' data-modal-target="delete-modal" data-modal-toggle="delete-modal" src="../svg/trash.svg" class="cursor-pointer" alt="">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                    <?php
                            }
                        }
                    } else {
                        echo "<tr><td colspan='5'>Error executing the query: " . $mysqli->error . "</td></tr>";
                    }
                    ?>
                </tbody>
                <tfoot>
                    <tr>
                        <th>id</th>
                        <th>Marca</th>
                        <th>Accion</th>
                    </tr>
                </tfoot>
            </table>
        </div>

        <div id="modelos" class="contenedor hidden">
            <div class="flex justify-end">
                <button class="flex items-cent gap-2 bg-green-500 p-2 rounded-md text-white" data-modal-target="modelo-modal" data-modal-toggle="modelo-modal">
                    <span>Añadir Modelo</span>
                    <div class="w-5">
                        <img class="w-full h-full" src="../svg/add.svg" alt="">
                    </div>
                </button>
            </div>
            <table id="table_modelos" class=" display table bg-gray-50 py-2 ">
                <thead>
                    <tr>
                        <th>id</th>
                        <th>Modelo</th>
                        <th>Marca</th>
                        <th>Accion</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    if ($modelo) {
                        if ($modelo->num_rows > 0) {

                            while ($datos = $modelo->fetch_assoc()) {
                                $eliminar = array(
                                    'query' => "delete from vehiculos_modelos where idVehiculos_Modelos = " . $datos['idVehiculos_Modelos'],
                                    'msj' =>  "Eliminar  " . $datos['Modelo_nombre']
                                );
                    ?>
                                <tr>
                                    <td><?php echo $datos['idVehiculos_Modelos']; ?></td>
                                    <td><?php echo $datos['Modelo_nombre']; ?></td>
                                    <td><?php echo $datos['marca_nombre']; ?></td>
                                    <td>
                                        <div class="flex gap-2 w-12 justify-center overflow-hidden bg-transparent">
                                            <div>
                                                <img onclick='EditarModelo(<?php echo json_encode($datos); ?>)' data-modal-target="modelo-modal" data-modal-toggle="modelo-modal" class="cursor-pointer" src="../svg/edit.svg" alt="">
                                            </div>
                                            <div>
                                                <img onclick='Eliminar(<?php echo json_encode($eliminar); ?> )' data-modal-target="delete-modal" data-modal-toggle="delete-modal" src="../svg/trash.svg" class="cursor-pointer" alt="">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                    <?php
                            }
                        }
                    } else {
                        echo "<tr><td colspan='5'>Error executing the query: " . $mysqli->error . "</td></tr>";
                    }
                    ?>
                </tbody>
                <tfoot>
                    <tr>
                        <th>id</th>
                        <th>Modelo</th>
                        <th>Marca</th>
                        <th>Accion</th>
                    </tr>
                </tfoot>
            </table>
        </div>

        <div id="caracteristica" class="contenedor hidden">
            <div class="flex justify-end">
                <button class="flex items-cent gap-2 bg-green-500 p-2 rounded-md text-white" data-modal-target="caracteristia-modal" data-modal-toggle="caracteristica-modal">
                    <span>Añadir Caracteristica</span>
                    <div class="w-5">
                        <img class="w-full h-full" src="../svg/add.svg" alt="">
                    </div>
                </button>
            </div>
            <table id="table_caracteristica" class=" display table bg-gray-50 py-2   ">
                <thead>
                    <tr>
                        <th>id</th>
                        <th>caracteristica</th>

                        <th>Accion</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    if ($caracteristicas) {
                        if ($caracteristicas->num_rows > 0) {

                            while ($datos = $caracteristicas->fetch_assoc()) {
                                $eliminar = array(
                                    'query' => "delete from vehiculo_caracteristicas where idVehiculo_Caracteristicas = " . $datos['idVehiculo_Caracteristicas'],
                                    'msj' =>  "Eliminar  " . $datos['Vehiculo_Caracteristica']
                                );
                    ?>
                                <tr>
                                    <td><?php echo $datos['idVehiculo_Caracteristicas']; ?></td>
                                    <td><?php echo $datos['Vehiculo_Caracteristica']; ?></td>
                                    <td>
                                        <div class="flex gap-2 w-12 justify-center overflow-hidden bg-transparent">
                                            <div>
                                                <img onclick='EditarCaracteristica(<?php echo json_encode($datos); ?>)' data-modal-target="caracteristica-modal" data-modal-toggle="caracteristica-modal" class="cursor-pointer" src="../svg/edit.svg" alt="">
                                            </div>
                                            <div>
                                                <img onclick='Eliminar(<?php echo json_encode($eliminar); ?> )' data-modal-target="delete-modal" data-modal-toggle="delete-modal" src="../svg/trash.svg" class="cursor-pointer" alt="">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                    <?php
                            }
                        }
                    } else {
                        echo "<tr><td colspan='5'>Error executing the query: " . $mysqli->error . "</td></tr>";
                    }
                    ?>

                </tbody>
                <tfoot>
                    <tr>
                        <th>id</th>
                        <th>caracteristica</th>

                        <th>Accion</th>
                    </tr>
                </tfoot>
            </table>
        </div>

        <div id="categoria" class="contenedor hidden">
            <div class="flex justify-end">
                <button class="flex items-cent gap-2 bg-green-500 p-2 rounded-md text-white" data-modal-target="categoria-modal" data-modal-toggle="categoria-modal">
                    <span>Añadir Categoria</span>
                    <div class="w-5">
                        <img class="w-full h-full" src="../svg/add.svg" alt="">
                    </div>
                </button>
            </div>
            <table id="table_categoria" class=" display table bg-gray-50 py-2   ">
                <thead>
                    <tr>
                        <th>id</th>
                        <th>categoria</th>
                        <th>Accion</th>
                    </tr>
                </thead>
                <tbody>

                    <?php
                    if ($categoria) {
                        if ($categoria->num_rows > 0) {

                            while ($datos = $categoria->fetch_assoc()) {
                                $eliminar = array(
                                    'query' => "delete from vehiculo_categoria where idVehiculo_Categoria = " . $datos['idVehiculo_Categoria'],
                                    'msj' =>  "Eliminar  " . $datos['nombre_Categoria']
                                );
                    ?>
                                <tr>
                                    <td><?php echo $datos['idVehiculo_Categoria']; ?></td>
                                    <td><?php echo $datos['nombre_Categoria']; ?></td>
                                    <td>
                                        <div class="flex gap-2 w-12 justify-center overflow-hidden bg-transparent">
                                            <div>
                                                <img onclick='EditarCategoria(<?php echo json_encode($datos); ?>)' data-modal-target="categoria-modal" data-modal-toggle="categoria-modal" class="cursor-pointer" src="../svg/edit.svg" alt="">
                                            </div>
                                            <div>
                                                <img onclick='Eliminar(<?php echo json_encode($eliminar); ?> )' data-modal-target="delete-modal" data-modal-toggle="delete-modal" src="../svg/trash.svg" class="cursor-pointer" alt="">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                    <?php
                            }
                        }
                    } else {
                        echo "<tr><td colspan='5'>Error executing the query: " . $mysqli->error . "</td></tr>";
                    }
                    ?>
                </tbody>
                <tfoot>
                    <tr>
                        <th>id</th>
                        <th>categoria</th>

                        <th>Accion</th>
                    </tr>
                </tfoot>
            </table>
        </div>

        <div id="intervalos" class="contenedor hidden">
            <div class="flex justify-end">
                <button class="flex items-cent gap-2 bg-green-500 p-2 rounded-md text-white" data-modal-target="intervalo-modal" data-modal-toggle="intervalo-modal">
                    <span>Añadir Intervalo</span>
                    <div class="w-5">
                        <img class="w-full h-full" src="../svg/add.svg" alt="">
                    </div>
                </button>
            </div>
            <table id="table_intervalo" class=" display table bg-gray-50 py-2   ">
                <thead>
                    <tr>
                        <th>id</th>
                        <th>Descripcion de Baul</th>
                        <th>Tamaño Minimo del  Baul</th>
                        <th>Tamaño Maximo del Baul</th>
                        <th>Accion</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    if ($baul) {
                        if ($baul->num_rows > 0) {
                            while ($datos = $baul->fetch_assoc()) {
                                $eliminar = array(
                                    'query' => "delete from tamanoBaul where idTamanoBaul = " . $datos['idTamanoBaul'],
                                    'msj' =>  "Eliminar  " . $datos['descripBaul']
                                );
                    ?>
                                <tr>
                                    <td><?php echo $datos['idTamanoBaul']; ?></td>
                                    <td><?php echo $datos['descripBaul']; ?></td>
                                    <td><?php echo $datos['capacidadMinBaul']; ?></td>
                                    <td><?php echo $datos['capacidadMaxBaul']; ?></td>
                                    <td>
                                        <div class="flex gap-2 w-12 justify-center overflow-hidden bg-transparent">
                                            <div>
                                                <img onclick='EditarIntervalo(<?php echo json_encode($datos); ?>)' data-modal-target="intervalo-modal" data-modal-toggle="intervalo-modal" class="cursor-pointer" src="../svg/edit.svg" alt="">
                                            </div>
                                            <div>
                                                <img onclick='Eliminar(<?php echo json_encode($eliminar); ?> )' data-modal-target="delete-modal" data-modal-toggle="delete-modal" src="../svg/trash.svg" class="cursor-pointer" alt="">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                    <?php
                            }
                        }
                    } else {
                        echo "<tr><td colspan='5'>Error executing the query: " . $mysqli->error . "</td></tr>";
                    }
                    ?>
                </tbody>
               <tfoot>
                    <tr>
                        <th>id</th>
                        <th>Descripcion de Baul</th>
                        <th>Tamaño Minimo del  Baul</th>
                        <th>Tamaño Maximo del Baul</th>
                        <th>Accion</th>
                    </tr>
                </tfoot>
            </table>
        </div>

        <div id="combustible" class="contenedor hidden">
            <div class="flex justify-end">
                <button class="flex items-cent gap-2 bg-green-500 p-2 rounded-md text-white" data-modal-target="combustible-modal" data-modal-toggle="combustible-modal">
                    <span>Añadir Consumo a Combustible</span>
                    <div class="w-5">
                        <img class="w-full h-full" src="../svg/add.svg" alt="">
                    </div>
                </button>
            </div>
            <table id="table_combustible" class=" display table bg-gray-50 py-2   ">
                <thead>
                    <tr>
                        <th>id</th>
                        <th>Descripcion de Consumo</th>
                        <th>MPG Inicial</th>
                        <th>MPG Final</th>
                        <th>Accion</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    if ($combustible) {
                        if ($combustible->num_rows > 0) {
                            while ($datos = $combustible->fetch_assoc()) {
                                $eliminar = array(
                                    'query' => "delete from consumocombustibles where idconsumo = " . $datos['idconsumo'],
                                    'msj' =>  "Eliminar  " . $datos['descripTipoconsumo']
                                );
                    ?>
                                <tr>
                                    <td><?php echo $datos['idconsumo']; ?></td>
                                    <td><?php echo $datos['descripTipoconsumo']; ?></td>
                                    <td><?php echo $datos['tc_valinicial']; ?></td>
                                    <td><?php echo $datos['tc_valfinal']; ?></td>
                                    <td>
                                        <div class="flex gap-2 w-12 justify-center overflow-hidden bg-transparent">
                                            <div>
                                                <img onclick='EditarCombustible(<?php echo json_encode($datos); ?>)' data-modal-target="combustible-modal" data-modal-toggle="combustible-modal" class="cursor-pointer" src="../svg/edit.svg" alt="">
                                            </div>
                                            <div>
                                                <img onclick='Eliminar(<?php echo json_encode($eliminar); ?> )' data-modal-target="delete-modal" data-modal-toggle="delete-modal" src="../svg/trash.svg" class="cursor-pointer" alt="">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                    <?php
                            }
                        }
                    } else {
                        echo "<tr><td colspan='5'>Error executing the query: " . $mysqli->error . "</td></tr>";
                    }
                    ?>
                </tbody>
               <tfoot>
                    <tr>
                        <th>id</th>
                        <th>Descripcion de Consumo</th>
                        <th>MPG Inicial</th>
                        <th>MPG Final</th>
                        <th>Accion</th>
                    </tr>
                </tfoot>
            </table>
        </div>

    </div>
    <?php include  '../modales/modal_delete.php' ?>
    <?php include  '../modales/modal_create_update.php' ?>

</body>

</html>