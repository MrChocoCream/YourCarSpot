
<div id="marca-modal" tabindex="-1" aria-hidden="true" class="fixed top-0 left-0 right-0 z-50  w-full p-4 overflow-x-hidden  overflow-y-auto hidden md:inset-0 h-[98%] max-h-full">
    <!-- cuadro -->
    <div class="relative w-full max-w-md max-h-full bg-white rounded-lg shadow dark:bg-gray-700 px-6 py-6 lg:px-8">

        <!-- salir -->
        <button type="button" class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ml-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="marca-modal">
            <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
            </svg>
        </button>

        <div class="flex items-center gap-4 mb-4">
            <span id="titulo" class="text-xl font-medium text-gray-900 dark:text-white">Agregar Marca</span>
        </div>

        <form action="../controller/marca_create_update.php" id="marcaForm" method="post" class="space-y-6 relative" action="#">
            <input type="hidden" name="accion" value="create">
            <input type="hidden" name="id">

            <label class="block text-sm font-medium text-gray-900 dark:text-white">Marca
                <input type="text" name="marca" autocomplete="off" placeholder="Ingrese la Marca" required class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg mt-2 focus:ring-blue-500  focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white">
            </label>


            <div id="btn_modal" class="flex justify-end gap-2 mt-2">
                <button type="button" data-modal-hide="marca-modal" class="w-fit text-white bg-gray-600 hover:bg-gray-800 font-medium rounded-lg text-sm px-5 py-2.5 text-center">Close</button>
                <button type="submit" class="w-fit   text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Guardar cambios</button>
            </div>
        </form>




    </div>
</div>

<div id="modelo-modal" tabindex="-1" aria-hidden="true" class="fixed top-0 left-0 right-0 z-50  w-full p-4 overflow-x-hidden  overflow-y-auto hidden md:inset-0 h-[98%] max-h-full">
    <!-- cuadro -->
    <div class="relative w-full max-w-md max-h-full bg-white rounded-lg shadow dark:bg-gray-700 px-6 py-6 lg:px-8">

        <!-- salir -->
        <button type="button" class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ml-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="modelo-modal">
            <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
            </svg>
        </button>

        <div class="flex items-center gap-4 mb-4">
            <span id="titulo" class="text-xl font-medium text-gray-900 dark:text-white">Agregar Modelo</span>
        </div>

        <form action="../controller/modelo_create_update.php" id="modeloForm" method="post" class="space-y-6 relative" action="#">
            <input type="hidden" name="accion" value="create">
            <input type="hidden" name="id">

            <label class="block text-sm font-medium text-gray-900 dark:text-white">Modelo
                <input type="text" name="modelo" autocomplete="off" placeholder="Ingrese la modelo" required class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg mt-2   block w-full p-2.5 ">
            </label>

            <label>
                <span>marca</span></br>
                <select id="marca" name="marca" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg mt-2   block w-full p-2.5 "> 
                    <option value="" selected>Marca</option>
                    <?php
                    if ($marcas2) {
                        if ($marcas2->num_rows > 0) {
                            while ($datos = $marcas2->fetch_assoc()) {
                                
                                echo "<option value=\"{$datos['idVehiculos_Marca']}\">{$datos['marca_nombre']}</option>";
                            }
                        }
                        $marcas2->free();
                    } else {
                        echo "<option >Error executing the query: " . $mysqli->error . "</option>";
                    }
                    ?>
                </select>
            </label>

            <div id="btn_modal" class="flex justify-end gap-2 mt-2">
                <button type="button" data-modal-hide="modelo-modal" class="w-fit text-white bg-gray-600 hover:bg-gray-800 font-medium rounded-lg text-sm px-5 py-2.5 text-center">Close</button>
                <button type="submit" class="w-fit   text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Guardar cambios</button>
            </div>
        </form>




    </div>
</div>

<div id="caracteristica-modal" tabindex="-1" aria-hidden="true" class="fixed top-0 left-0 right-0 z-50  w-full p-4 overflow-x-hidden  overflow-y-auto hidden md:inset-0 h-[98%] max-h-full">
    <!-- cuadro -->
    <div class="relative w-full max-w-md max-h-full bg-white rounded-lg shadow dark:bg-gray-700 px-6 py-6 lg:px-8">

        <!-- salir -->
        <button type="button" class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ml-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="caracteristica-modal">
            <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
            </svg>
        </button>

        <div class="flex items-center gap-4 mb-4">
            <span id="titulo" class="text-xl font-medium text-gray-900 dark:text-white">Agregar Caracteristica</span>
        </div>

        <form action="../controller/caracteristicas_create_update.php" id="caracteristicaForm" method="post" class="space-y-6 relative" action="#">
            <input type="hidden" name="accion" value="create">
            <input type="hidden" name="id">

            <label class="block text-sm font-medium text-gray-900 dark:text-white">Caracteristica
                <input type="text" name="caracteristica" autocomplete="off" placeholder="Ingrese la caracteristica" required class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg mt-2 focus:ring-blue-500  focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white">
            </label>


            <div id="btn_modal" class="flex justify-end gap-2 mt-2">
                <button type="button" data-modal-hide="caracteristica-modal" class="w-fit text-white bg-gray-600 hover:bg-gray-800 font-medium rounded-lg text-sm px-5 py-2.5 text-center">Close</button>
                <button type="submit" class="w-fit   text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Guardar cambios</button>
            </div>
        </form>




    </div>
</div>

<div id="categoria-modal" tabindex="-1" aria-hidden="true" class="fixed top-0 left-0 right-0 z-50  w-full p-4 overflow-x-hidden  overflow-y-auto hidden md:inset-0 h-[98%] max-h-full">
    <!-- cuadro -->
    <div class="relative w-full max-w-md max-h-full bg-white rounded-lg shadow dark:bg-gray-700 px-6 py-6 lg:px-8">

        <!-- salir -->
        <button type="button" class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ml-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="categoria-modal">
            <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
            </svg>
        </button>

        <div class="flex items-center gap-4 mb-4">
            <span id="titulo" class="text-xl font-medium text-gray-900 dark:text-white">Agregar Categoria</span>
        </div>

        <form action="../controller/categoria_create_update.php" id="categoriaForm" method="post" class="space-y-6 relative" action="#">
            <input type="hidden" name="accion" value="create">
            <input type="hidden" name="id">

            <label class="block text-sm font-medium text-gray-900 dark:text-white">Categoria
                <input type="text" name="categoria" autocomplete="off" placeholder="Ingrese la categoria" required class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg mt-2 focus:ring-blue-500  focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white">
            </label>


            <div id="btn_modal" class="flex justify-end gap-2 mt-2">
                <button type="button" data-modal-hide="categoria-modal" class="w-fit text-white bg-gray-600 hover:bg-gray-800 font-medium rounded-lg text-sm px-5 py-2.5 text-center">Close</button>
                <button type="submit" class="w-fit   text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Guardar cambios</button>
            </div>
        </form>




    </div>
</div>