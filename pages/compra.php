<?php session_start();

require("../php/connection.php");


if (!isset($_POST["id"])) {
    header("Location: ./home.php");
    die();
}

$resultado = $mysqli->query("SELECT * from vehiculos_venta left JOIN vehiculos_modelos on idVehiculos_Modelos = vehiculo_modelo  join vehiculos_marcas on vehiculos_modelos.marca = vehiculos_marcas.idVehiculos_Marca join vehiculo_categoria on vehiculos_venta.vehiculo_Categoria = vehiculo_categoria.idVehiculo_Categoria where vehiculos_venta.idVehiculos_Venta =" . $_POST["id"])->fetch_assoc();
if ($resultado == null) {
    header("Location: ./home.php");
    die();
}
extract($resultado);


?>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Incluir archivo de Js y estilos CSS -->
    <script src="../js/funciones.js" defer></script>
    <link href="../css/output.css" rel="stylesheet">
    <title>Login</title>
</head>


<body>
    <div class="min-h-screen flex flex-wrap justify-center sm:content-center font-['Open_Sans']">
        <div class="flex flex-col items-center w-full max-w-md  sm:p-12  rounded-3xl  text-[#333]">

            <div class="w-20">
                <img src="../pictures/auto.png" alt="">
            </div>
            <form action="../controller/agenda.php" method="post" class=" flex  w-full flex-col gap-4 relative text-gray-500">
                <input type="hidden" value="<?php echo $_POST["id"] ?>" name="id">
                <div class="my-8 text-center">
                    <h3 class="font-bold text-lg text-center "> Tipo de entrega </h3>
                    <div class="flex gap-4 justify-center    ">

                        <label>
                            <span>En el Local</span>
                            <input required class="w-fit" type="radio" name="entrega" value="1">
                        </label>
                        <label>
                            <span>Mi direccion</span>
                            <input  required class="w-fit" type="radio" name="entrega" value="0">
                        </label>
                    </div>

                    <div class="pt-4">
                        <span class="font-semibold ">
                            Ingresa la fecha en la que desea agendar la compra de su:
                        </span></br>
                        <span class="text-xl font-bold"> <?php echo $year . " " . $marca_nombre . " " . $Modelo_nombre . " "; ?></span>
                    </div>

                    <div>
                        <label class=" mt-5  flex items-center gap-3 border border-gray-BD rounded-lg p-1 ps-4">
                            <div class="w-5 h-5">
                                <img class="w-full h-full" src="../svg/lapiz.svg" alt="">
                            </div>
                            <input required class="bg-transparent" type="date" name="date">
                        </label>

                        <label class="mt-5 flex items-center gap-3 border border-gray-BD rounded-lg p-1 ps-4">
                            <div class="w-5 h-5">
                                <img class="w-full h-full" src="../svg/lapiz.svg" alt="">
                            </div>
                            <input required class="bg-transparent" type="text" name="time" pattern="^(0[1-9]|1[0-2]):[0-5][0-9] (AM|PM|am|pm)$" title="Ejemplo: 07:30 AM" placeholder="Ejemplo: 07:30 AM">
                        </label>
                    </div>
                </div>

                <?php
                if (isset($_SESSION['error_message'])) {
                    echo '<p id="msj" class="text-red-500 w-full text-center absolute transform duration-500 ease-in-out mb-8 bottom-8" >' . $_SESSION['error_message'] . '</p>';
                    unset($_SESSION['error_message']);
                }
                ?>


                <button class="w-full py-4 mt-2 bg-orange-600 rounded-lg text-sm leading-normal font-semibold text-white" type="submit">Agendar Compra</button>
                <a href="./detalle.php?id=<?php echo $_POST["id"] ?>" tipe="button" class="w-full py-4 mt-2 bg-orange-600 text-center  rounded-lg text-sm leading-normal font-semibold text-white">Cancelar</a>
            </form>
        </div>
    </div>
</body>

</html>