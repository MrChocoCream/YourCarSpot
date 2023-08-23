<?php

if (!isset($_SESSION['persona'])) {
    header("Location: ../index.php");
    die();
}
extract($_SESSION['persona']);


 ?>

<!-- Incluir archivo JavaScript "menu.js" de forma asíncrona -->
<script  src="../js/menu.js" defer></script>
<script  src="../js/funciones.js" defer></script>

<!-- Contenedor principal con diseño flexible, padding y logotipo -->
<div class=" z-10 flex justify-between w-screen px-4  sx:px-8 py-1 fixed top-0 border-b-2 border-orange-500 bg-white shadow-md">

    <!-- Sección del logotipo -->
    <a  href="./home.php" class="w-14">
        <!-- Mostrar logotipo "devchallenges" -->
        <img src="../pictures/auto.png" alt="">
    </a>

    <!-- Sección del control de menú -->
    <div id="control-menu" class="flex items-center gap-2 cursor-pointer">
        
     
        <span class="block font-semibold text-base leading-snug"><?php echo $nombre." ".$apellido ?></span>
       
        <div class="block w-6 rotate-180">
            <img src="../svg/arrow.svg" alt="logo" />
        </div>
    </div>

    <!-- Menú desplegable -->
    <div id="menu" class="border border-gray-BD rounded-xl p-2 w-36 bg-white text-xs absolute top-16 right-[2%] overflow-hidden h-0 opacity-0 transform duration-500 ease-in-out">
        <!-- Opción 1: Ir a la página de perfil del usuario -->
        <div class="border-b">
                




            <a href="./profile.php" class="flex items-center gap-2 p-2 hover:bg-gray-100 rounded-xl cursor-pointer">
                <div class="w-5">
                    <img src="../svg/profile.svg" alt="">
                </div>
                <span>My Profile</span>
            </a>
            <?php if ($isInterno == 1) : ?>
            <!-- Opción 2: Ir a la página de chat de grupo -->
            <a href="./mantenimiento.php" class="flex items-center gap-2 p-2 mb-2 hover:bg-gray-100 rounded-xl cursor-pointer">
                <div class="w-5">
                    <img src="../svg/ajustes.svg" alt="">
                </div>
                <span>Mantenimientos</span>
            </a> 
            <a href="./venta_usuario.php" class="flex items-center gap-2 p-2 hover:bg-gray-100 rounded-xl cursor-pointer">
                <div class="w-5">
                    <img src="../svg/profile.svg" alt="">
                </div>
                <span>Reporte</span>
            </a>
            <?php endif; ?>

            <a href="./agenda.php" class="flex items-center gap-2 p-2 hover:bg-gray-100 rounded-xl cursor-pointer">
                <div class="w-5">
                    <img src="../svg/profile.svg" alt="">
                </div>
                <span>Agenda</span>
            </a>

           
           

        </div>

        <!-- Opción 3: Cerrar sesión -->
        <a href="../php/logout.php" class="flex items-center gap-2 mt-2 p-2 hover:bg-gray-100 rounded-xl text-red-500 cursor-pointer">
            <div class="w-5">
                <img src="../svg/logout.svg" alt="">
            </div>
            <span>Logout</span>
        </a>
    </div>
</div>
