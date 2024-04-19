<?php session_start(); ?>
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

            <div class="w-20 ">
                <img src="../pictures/auto.png" alt="">
            </div>

            <div class="my-40">
                <h3 class="font-bold text-lg text-center "> Se envio el correo correctamente  </h3>
                
            </div>

            <a href="../index.php" class="w-full py-4 bg-orange-600 text-center  rounded-lg text-sm leading-normal font-semibold text-white" type="submit">Aceptar</a>
         
           

        </div>
    </div>
</body>

</html>