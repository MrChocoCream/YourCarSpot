

const modal_password = document.getElementById('passwordForm');
/* const password = document.getElementById("edit_password"); // Cambiar Contraseña */

if (modal_password) {
modal_password.addEventListener('submit', function(event) {
    event.preventDefault(); // Evita que el formulario se envíe automáticamente


   
    const password1 = modal_password.password1.value;
    const password2 = modal_password.password2.value;
    const password3 = modal_password.password3.value;

    if (password2 !== password3) {
       
        // Las contraseñas no coinciden, muestra un mensaje de error
         if (!document.getElementById('msj')) {
            const errorMessage = document.createElement('p');
            errorMessage.id = 'msj';
            errorMessage.className = 'text-red-500 w-full text-center text-[15.5px] absolute transform duration-500 ease-in-out bottom-32';
            errorMessage.textContent = 'Las contraseñas no coinciden, Inténtelo nuevamente.';
            modal_password.appendChild(errorMessage);
        }   

        Msj();

    } else {
        // Las contraseñas coinciden, puedes enviar el formulario
        console.log("las contraseñas coinciden")
        alert("coinciden")
        this.submit();
    }
});
}

const enlaces = document.querySelectorAll('.activar');
let ultimoClickeado = localStorage.getItem('ultimoClickeado'); 
if (enlaces) {
  enlaces.forEach(enlace => {
    enlace.addEventListener('click', () => {
      // Restaurar el color original de todos los enlaces
      enlaces.forEach(enlace2 => {
        enlace2.classList.add('bg-orange-400');
        enlace2.classList.remove('bg-orange-200');
      });

      // Cambiar color del enlace clickeado
      enlace.classList.remove('bg-orange-400');
      enlace.classList.add('bg-orange-200');

      const mostrarId = enlace.getAttribute('mostrar');
      const contenidos = document.querySelectorAll('div.contenedor');
      
      contenidos.forEach(contenido => {
        contenido.classList.add('hidden');
      });

      document.querySelectorAll(mostrarId).forEach(contenido => {
        contenido.classList.remove('hidden');
      });

      ultimoClickeado = mostrarId; 
      localStorage.setItem('ultimoClickeado', ultimoClickeado); 
    });

    
    if (ultimoClickeado === enlace.getAttribute('mostrar')) {
      enlace.click(); 
    }
  });
}



const boton = document.getElementById("control-menu"); // Botón para controlar el menú
const cuadro = document.getElementById("cuadro"); // Cuadro principal
const targetDiv = document.getElementById("menu"); // Menú desplegable
    
boton.addEventListener('click', function () {
  targetDiv.classList.toggle("h-0"); 
  targetDiv.classList.toggle("h-52"); 
  targetDiv.classList.toggle("opacity-0"); 
});

// Agregar un evento al cuadro principal para ocultar el menú cuando se pasa el mouse sobre él
cuadro.addEventListener('mouseover', function () {
  targetDiv.classList.add("opacity-0"); 
  targetDiv.classList.add("h-0"); 
  targetDiv.classList.remove("h-52"); 
});


   
   