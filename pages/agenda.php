<?php session_start();
require("../php/connection.php");
// if (!isset($_SESSION['persona']['isInterno']) || $_SESSION['persona']['isInterno'] == 0) {
if (!isset($_SESSION['persona']['isInterno']) ) {
    header("Location: ./home.php");
    die();
}

if( $_SESSION['persona']['isInterno'] == 1) {

    $agenda = $mysqli->query("SELECT * FROM `agenda_compras`");
}else{  
    $agenda = $mysqli->query("SELECT * FROM `agenda_compras` where id_usuario=".$_SESSION['persona']['idUsuario']);
}

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


    <title>Login</title>

</head>

<body>
    <?php include "./nav.php" ?>
    <script>
        $(document).ready(function() {
            $('#table_marcas').DataTable();
            $('#table_modelos').DataTable();
            $('#table_caracteristica').DataTable();
            $('#table_categoria').DataTable();
        });
    </script>

    <div class="w-screen p-6 mt-14">
        <div class="w-full  flex gap-5 items-center relative">


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

            <table id="table_marcas" class="display table bg-gray-50 py-2 ">
                <thead>
                    <tr>
                        <th>id</th>
                        <th>Usuario</th>
                        <th>Vehiculo</th>
                        <th>Fecha</th>
                        <th>Hora</th>
                        <th>Ver</th>
                        <th>Accion</th>

                    </tr>
                </thead>
                <tbody>
                    <?php
                    if ($agenda) {
                        if ($agenda->num_rows > 0) {

                            while ($datos = $agenda->fetch_assoc()) {

                    ?>
                                <tr>
                                    <td><?php echo $datos['id_agenda']; ?></td>
                                    <td><?php echo $datos['id_usuario']; ?></td>
                                    <td><?php echo $datos['id_vehiculo']; ?></td>
                                    <td><?php echo $datos['fecha']; ?></td>
                                    <td><?php echo $datos['hora']; ?></td>
                                    <td> <?php
                                            if ($datos['status'] == 0) {
                                                echo "Pendiente";
                                            } elseif ($datos['status'] == 1) {
                                                echo "Completada";
                                            } else {
                                                echo "Cancelada"; // Cambia este mensaje según necesites
                                            } 
                                            ?></td>


                                    
                                    <td><a class="bg-green-400 hover:bg-green-800 p-2 rounded-md" href="./entrega.php?id=<?php echo $datos['id_agenda']; ?>">Ver</a></td>
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
                        <th>Usuario</th>
                        <th>Vehiculo</th>
                        <th>Fecha</th>
                        <th>Hora</th>
                        <th>Ver</th>
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