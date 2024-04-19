<?php
require 'errores.php';

if($_SERVER["REQUEST_METHOD"]=="POST"){
    session_start();
    extract($_POST);

    require("connection.php");
 
  

    $idPersona= $_SESSION['persona']['idPersona'];
    $hash = password_hash($password3,PASSWORD_DEFAULT);
  

    $resultado = $mysqli -> query("select * from usuario where idPersona = '$idPersona'");
    $resultado = $resultado-> fetch_assoc();
    

    if($resultado && $password1 == $resultado['PasswUser']){
        $query = "UPDATE usuario SET PasswUser='$password3' WHERE idPersona='$idPersona'";
        $mysqli->query($query);

        $_SESSION['success_message'] = "Contraseña cambiada satisfactoriamente";
        header("Location: ../pages/profile.php");
        exit;

    } else {
       
        $_SESSION['error_message'] = "La contraseña proporcionada es incorrecta";
        header("Location: ../pages/profile.php");
        exit;
    } 

};
