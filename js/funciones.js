// Función para mostrar la imagen seleccionada en un campo de archivo de entrada
function showImg(event) {
    
    const fileInput = event.target; // Obtener el campo de archivo de entrada
    const imagePreview = document.getElementById("imagePreview"); // Obtener el elemento de vista previa de la imagen

    if (fileInput.files && fileInput.files[0]) {
        // Si se selecciona un archivo
        const reader = new FileReader();
        reader.onload = function (e) {
            imagePreview.src = e.target.result; // Mostrar la imagen seleccionada en la vista previa
        };

        reader.readAsDataURL(fileInput.files[0]); // Leer el contenido del archivo seleccionado
    } else {
        // Si no se selecciona un archivo, mostrar la imagen predeterminada
        console.log("errors");
        imagePreview.src = `./pictures/<?php echo is_file("../pictures/photo_".$id) ? "photo_".$id : "usuario.jpg" ?>`;
    } 
}

//Mensaje de Errores y succes
function Msj(){
    const msj = document.getElementById("msj") ;
    
    if(msj){
       
        setTimeout(() => { 
            msj.classList.remove("bottom-8"); 
            msj.classList.add("bottom-0");    
        }, 1); 
        setTimeout(() => { 
            msj.remove();
        }, 5000); 
    }
}
Msj() ;


function updateModelos() {
    const marcaId = document.getElementById("marca").value;
    const modeloSelect = document.getElementById("modelo");

    
    const modeloSeleccionado = modeloSelect.attributes.value.value;
    

   
    console.log(modeloSelect,"hola2");
    console.log(modeloSeleccionado,"hola3");
  
    // Limpia las opciones actuales del menú de modelos
    modeloSelect.innerHTML = '<option value="" >Modelo</option>';

    // Si no se seleccionó una marca, no se realiza la consulta
    if (marcaId !== "") {
        // Realiza una solicitud AJAX para obtener los modelos de la marca seleccionada
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var modelos = JSON.parse(xhr.responseText);
                modelos.forEach(function (modelo) {
                    console.log(modelo);
                    var option = document.createElement("option");
                    option.value = modelo.id;
                    option.textContent = modelo.nombre;

                    // Si el modelo coincide con el valor previamente seleccionado, lo preselecciona
                    if (modelo.id == modeloSeleccionado) {
                        console.log(modelo.id+"encontrado"+modeloSeleccionado)
                        option.selected = true;
                    }
                    else{
                        console.log(modelo.id+"no en"+modeloSeleccionado)
                    }

                    modeloSelect.appendChild(option);
                });
            }
        };

        xhr.open("GET", "../php/get_modelos_por_marca.php?marcaId=" + marcaId, true);
        xhr.send();
    }
}

function updateModelo() {
    var marcaId = document.getElementById("marca").value;
    var modeloSelect = document.getElementById("modelo");
    
    // Limpia las opciones actuales del menú de modelos
    modeloSelect.innerHTML = '<option value=""  selected>Modelo</option>';
    
    // Si no se seleccionó una marca, no se realiza la consulta
    if (marcaId !== "") {
        // Realiza una solicitud AJAX para obtener los modelos de la marca seleccionada
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var modelos = JSON.parse(xhr.responseText);
                modelos.forEach(function(modelo) {
                    var option = document.createElement("option");
                    option.value = modelo.id;
                    option.textContent = modelo.nombre;
                    modeloSelect.appendChild(option);
                });
            }
        };
        
        xhr.open("GET", "../php/get_modelos_por_marca.php?marcaId=" + marcaId, true);
        xhr.send();
    }
}


    


function EditarMarca(data) {

    const modal = document.getElementById("marcaForm");
    document.getElementById("titulo").innerText ="Modificar Marca";
    modal.accion.value = "update";
    modal.id.value = data.idVehiculos_Marca;
    modal.marca.value = data.marca_nombre;
}
     
function EditarModelo(data) {

    const modal = document.getElementById("modeloForm");
    document.getElementById("titulo").innerText ="Modificar modelo";
    modal.accion.value = "update";
    modal.id.value = data.idVehiculos_Modelos;
    modal.modelo.value = data.Modelo_nombre;
    modal.marca.value = data.idVehiculos_Marca;
}

function EditarCaracteristica(data) {
    
        const modal = document.getElementById("caracteristicaForm");
        document.getElementById("titulo").innerText ="Modificar Caracteristica";
        modal.accion.value = "update";
        modal.id.value = data.idVehiculo_Caracteristicas;
        modal.caracteristica.value = data.Vehiculo_Caracteristica;
       
    }

    function EditarCategoria(data) {
    
        const modal = document.getElementById("categoriaForm");
        document.getElementById("titulo").innerText ="Modificar Categoria";
        modal.accion.value = "update";
        modal.id.value = data.idVehiculo_Categoria;
        modal.categoria.value = data.nombre_Categoria;
       
    }
  

function Eliminar(data) {

    console.log(data);
    const formulario = document.getElementById("modalDelete");
    formulario.query.value = data.query; 
    formulario.boton.textContent = data.msj.split(" ")[0].toUpperCase();
    document.getElementById("mensaje").textContent = data.msj;
               
  }; 


  