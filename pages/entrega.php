<?php session_start();
require("../php/connection.php");

if (!isset($_GET["id"])) {
    header("Location: ./home.php");
    die();
}


$agenda = $mysqli->query("SELECT * FROM `agenda_compras` where id_agenda =" . $_GET["id"])->fetch_assoc();
extract($agenda);
$cliente = $mysqli->query("SELECT * FROM usuario join persona on usuario.idUsuario = persona.idPersona where usuario.idUsuario=" . $id_usuario)->fetch_assoc();
         

$vehiculo = $mysqli->query("SELECT * from vehiculos_venta left JOIN vehiculos_modelos on idVehiculos_Modelos = vehiculo_modelo  join vehiculos_marcas on vehiculos_modelos.marca = vehiculos_marcas.idVehiculos_Marca join vehiculo_categoria on vehiculos_venta.vehiculo_Categoria = vehiculo_categoria.idVehiculo_Categoria  where vehiculos_venta.idVehiculos_Venta=" . $id_vehiculo)->fetch_assoc();
extract($vehiculo);



$caracteristicas = $mysqli->query("SELECT * FROM caracteristicasvsvehiculoventa join vehiculo_caracteristicas on vehiculo_caracteristicas.idVehiculo_Caracteristicas = caracteristicasvsvehiculoventa.IdCaracteristica where IdVehiculoVenta =" . $id_vehiculo);


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
        <div class=" flex justify-between items-center mt-2">
            <span class="text-3xl font-bold ">Registro de Vehiculo</span>
            <div class="w-20">
                <img src="../pictures/auto.png" alt="">
            </div>
        </div>
        <form action="../controller/comprar.php" method="post" class="flex flex-col gap-6 items-center ">
            <div class=" gap-12">

                <div class="grid grid-cols-2 gap-4">
        <input type="hidden" name="agenda" value="<?php echo $_GET["id"] ?>">
                    
            <?php 
             extract($cliente);
            ?>
        
        <label>
                        <span>Nombre Cliente</span></br>
                        <input type="text" value="<?php echo $nombre." ".$apellido ?>" disabled>
                    </label>


                    <label>
                        <span>Entrega</span></br>
                        <input type="text" value="<?php echo $entrega_local ? "Entrega Local" : "Direccion Cliente"; ?>" disabled>

                    </label>

                    <label>
                        <span>Marca</span></br>
                        <input type="text" value="<?php echo $marca_nombre ?>" disabled>
                    </label>


                    <label>
                        <span>Modelo</span></br>
                        <input type="text" value="<?php echo $Modelo_nombre ?>" disabled>
                    </label>

                    <label>
                        <span>Tipo de Vehiculo</span></br>
                        <input type="text" value="<?php echo $nombre_Categoria ?>" disabled>
                    </label>

                    <label>
                        <span>Año</span></br>
                        <input type="text" value="<?php echo $year ?>" disabled>
                    </label>


                    <div class=" text-xl font-bold  gap-4 ">
                        <span>Condición</span></br>

                        <label>
                            <input disabled class="outline " type="checkbox" <?php if ($nuevo) echo  "checked" ?>> Nuevo
                        </label>
                        <label>
                            <input disabled class="outline" type="checkbox" <?php if (!$nuevo) echo  "selected"  ?>> Usado
                        </label>
                    </div>

                </div>
                <div>
                    <span>Caracteristicas</span>
                    <div class="grid grid-cols-2 gap-1 gap-x-14 max-h-80  pr-4 ">

                        <?php
                        if ($caracteristicas) {

                            if ($caracteristicas->num_rows > 0) {

                                while ($datos = $caracteristicas->fetch_assoc()) {

                        ?>

                                    <label class="bg-orange-600 text-white rounded-md">
                                        <input type="hidden">
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
                <label class="">
                    <span>Precio</span>
                    <input value="<?php echo number_format($precio, 2, '.', ','); ?>" name="precio" placeholder="Precio ">
                </label>


            </div>
            <div class="w-full max-w-sm  ">

                <label class="  ">
                    <span>Notas de recepcion</span>
                    <textarea rows="5"  placeholder="Escriba una descripcion sobre su vehiculo "></textarea>
                </label>


                <?php
                if ($status == 0) {
                    echo '<button class="w-full text-center  py-4 mt-5 bg-orange-600 rounded-lg text-sm  font-semibold text-white" type="submit">Canfirmar Compra</button>';
                    echo '<a href="../controller/cancelar_compra.php?id=' . $_GET["id"] . '&id_v=' . $id_vehiculo . '" class="w-full block text-center py-4 mt-5 bg-orange-600 rounded-lg text-sm font-semibold text-white" type="submit">Cancelar Compra</a>';
                } elseif ($status == 1) {
                    echo '<span disabled class="w-full block text-center  py-4 mt-5 bg-gren-600 rounded-lg text-sm  font-semibold text-white" >Vehiculo Recibido</span>';
                } else {
                    echo '<span disabled class="w-full block text-center  py-4 mt-5 bg-gray-600 rounded-lg text-sm  font-semibold text-white" >Compra Cancelada</span>';
                }

                ?>

            </div>
        </form>
    </div>
</body>

</html>