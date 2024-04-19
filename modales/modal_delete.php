<!-- Main modal -->
<div id="delete-modal" tabindex="-1" aria-hidden="true" class="fixed top-0 left-0 right-0 z-50  w-full p-4 overflow-x-hidden  overflow-y-auto hidden md:inset-0 h-[98%] max-h-full">

    <div class="relative w-full max-w-lg max-h-full bg-white rounded-lg shadow dark:bg-gray-700 pb-6 pt-4 lg:pb-6 lg:pt-4 ">

        <button type="button" class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ml-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="delete-modal">
            <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
            </svg>
        </button>

        <h3 id="titutlo" class="pb-2 mb-4 border-b-2 text-xl font-medium text-gray-900 dark:text-white px-6 lg:px-8">Retiro de asignaturas</h3>

        <form action="../controller/eliminar.php" id="modalDelete" method="post" class="space-y-6 relative px-6 lg:px-8">
           
        <label  class="block text-lg font-medium text-gray-900 dark:text-white">
                ¿Está seguro de que desea <span disabled class="font-extrabold" id="mensaje"> </span>?
            </label>
        
            <input type="hidden" name="query">
            
            <div id="btn_modal" class="flex justify-end gap-2 mt-4">
                <button name="boton" type="submit" class="w-fit text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-800">Retirar Materia</button>
                <button type="button" data-modal-hide="delete-modal" class="w-fit text-white bg-gray-600 hover:bg-gray-800 font-medium rounded-lg text-sm px-5 py-2.5 text-center">Cancelar</button>
            </div>
        </form>
    </div>

</div>