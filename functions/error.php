<?php

function Error_File($error_code) {
    $mensajes = array(
        0 => "El archivo se subió con éxito.",
        1 => "El tamaño del archivo subido excede el límite máximo permitido.",
        2 => "El tamaño del archivo subido excede el límite especificado en el formulario.",
        3 => "El archivo fue solo parcialmente subido.",
        4 => "No se subió ningún archivo.",
        6 => "No se pudo encontrar la carpeta temporal para la carga del archivo.",
    );
    return isset($mensajes[$error_code]) ? $mensajes[$error_code] : "Error desconocido al subir el archivo.";
}


function Error_SQL(mysqli_sql_exception $e) {
    $errorCode = $e->getCode();
    $errorMessage = $e->getMessage();
    
    switch ($errorCode) {
        case 1062:
            if (preg_match("/Duplicate entry '(.*?)' for key/", $errorMessage, $matches)) {
                return "Error: Entrada duplicada de dato: " . $matches[1];
            }
            return "Error: Entrada duplicada de dato";
        case 1048:
            return "Error: Todos los datos deben llenarse";
        case 1451:
            return "Error: Este registro no se puede modificar o eliminar porque esta siendo usado por otra entidad";
        default:
            return "Error en la accion realizada".$errorCode;
    }
}


?>