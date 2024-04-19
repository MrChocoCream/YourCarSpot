<?php session_start();
require("../php/connection.php");

require("../php/connection.php");
if (!isset($_SESSION['persona']['isInterno']) || $_SESSION['persona']['isInterno'] == 0) {
    header("Location: ./home.php");
    die();
}


$ventas = $mysqli->query("SELECT * FROM `ventasxusuario` ");

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
    <?php include "../pages/nav.php" ?>
    <script>
        $(document).ready(function() {
            $('#table_marcas').DataTable();
          
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
            <div class="flex ">
               <span class="font-bold text-xl my-4">Reporte Ventas por Usuario</span>
            </div>
            <table id="table_marcas" class="display table bg-gray-50 py-2 ">
                <thead>
                    <tr>
                       
                        <th>Usuario</th>
                        <th>Fecha</th>
                        <th>Matricula</th>
                        <th>Marca</th>
                        <th>Modelo</th>
                        <th>Año</th>
                        <th>Precio</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <?php
                    if ($ventas) {
                        if ($ventas->num_rows > 0) {
                               
                            while ($datos = $ventas->fetch_assoc()) {
                               
                    ?>
                                <tr>
                                   
                                    <td><?php echo $datos['usuario']; ?></td>
                                    <td><?php echo $datos['Fecha']; ?></td>
                                    <td><?php echo $datos['Matricula']; ?></td>
                                    <td><?php echo $datos['Marca']; ?></td>
                                    <td><?php echo $datos['Modelo']; ?></td>
                                    <td><?php echo $datos['Año']; ?></td>
                                    <td><?php echo $datos['Precio']; ?></td>
                                    
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
                    
                        <th>Usuario</th>
                        <th>Fecha</th>
                        <th>Matricula</th>
                        <th>Marca</th>
                        <th>Modelo</th>
                        <th>Año</th>
                        <th>Precio</th>
                    </tr>
                </tfoot>
            </table>
        </div>



    </div>
    

</body>

</html>