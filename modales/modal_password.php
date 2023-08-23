<script src="../node_modules/flowbite/dist/flowbite.min.js"></script>

<!-- Main modal -->
<div id="authentication-modal" tabindex="-1" aria-hidden="true" class="fixed top-0 left-0 right-0 z-50  w-full p-4 overflow-x-hidden  overflow-y-auto hidden md:inset-0 h-[98%] max-h-full">
    <!-- cuadro -->
    <div class="flex flex-col items-center relative w-full max-w-md max-h-full bg-white rounded-lg shadow dark:bg-gray-700 px-6 py-6 lg:px-8">

        <!-- salir -->
        <button type="button" class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ml-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="authentication-modal">
            <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
            </svg>
        </button>


        <div class="">
            <h3 class="font-semibold text-lg text-center "> Cambiar <br>Contraseña </h3>

        </div>

        <div class="w-20 my-8">
            <img src="../pictures/auto.png" alt="">
        </div>

        <?php
        if (!isset($_SESSION['success_message'])) {
        ?>
            <form action="../php/password.php"   method="post" id="passwordForm" class="w-full flex flex-col gap-8 relative text-gray-500 " acction="#">

                <input  name="PasswUser" value="" hidden>
              
                <div class="flex items-center gap-3 border border-gray-BD rounded-lg p-3 ps-4">
                    <div class="w-4"><img src="../svg/password.svg" alt="logo"></div>
                    <input class=" bg-transparent" type="password" name="password1" autocomplete="off" placeholder="Contraseña actual" required>
                </div>

                <div class="flex items-center gap-3 border border-gray-BD rounded-lg p-3 ps-4">
                    <div class="w-4"><img src="../svg/password.svg" alt="logo"></div>
                    <input class=" bg-transparent" type="password" name="password2" autocomplete="off" placeholder="Contraseña Nueva" required>
                </div>
                <div class="flex items-center gap-3 border border-gray-BD rounded-lg p-3 ps-4">
                    <div class="w-4"><img src="../svg/password.svg" alt="logo"></div>
                    <input class=" bg-transparent" type="password" name="password3" autocomplete="off" placeholder="repetir Contraseña" required>
                </div>

                <?php
                if (isset($_SESSION['error_message'])) {
                    echo '<p id="msj" class="text-red-500 w-full text-center absolute transform duration-500 ease-in-out mb-8 bottom-32" >' . $_SESSION['error_message'] . '</p>';
                    unset($_SESSION['error_message']);
                }
                ?>

                <div class="w-full">

                    <button class="w-full py-4 mb-2 bg-orange-600 rounded-lg text-sm leading-normal font-semibold text-white" type="submit">Guardar Contraseña</button>
                    <button data-modal-hide="authentication-modal" class="w-full py-4 mt-2 bg-orange-600 rounded-lg text-sm leading-normal font-semibold text-white">Cancelar</button>
                </div>
            </form>
            
        <?php } else {   ?>
            <div class="flex flex-col items-center gap-11 mt-14 w-full">
                <h3 id="msj" class=" font-bold text-lg text-center mb-16"> Contraseña<br> cambiada<br> correctamete</h3>
                <button data-modal-hide="authentication-modal" class="w-3/4 py-4  bg-orange-600 rounded-lg text-sm leading-normal font-semibold text-white" type="submit">Aceptar</button>
            </div>
        <?php unset($_SESSION['success_message']);
        } ?>






    </div>
</div>