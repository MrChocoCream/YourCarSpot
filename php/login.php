<?php

if($_SERVER["REQUEST_METHOD"]=="POST"){
    session_start();
    extract($_POST);

    require("connection.php");
    
    $resultado = $mysqli -> query("select * from usuario where NombreUser = '$user'");
    $resultado = $resultado-> fetch_assoc();
    var_dump($resultado);


    
    /* if($resultado && password_verify($password, $resultado['password'])){ */
        if($resultado && $password == $resultado['PasswUser']){
            $persona = $mysqli -> query("select * from persona join correos on persona.idcorreo = correos.idcorreos join telefono on persona.idtelefono = telefono.idtelefono join usuario on persona.idPersona = usuario.idUsuario where persona.idPersona = '".$resultado['idPersona']."'");
            $persona = $persona-> fetch_assoc();
            $_SESSION['persona'] = $persona;
            header("Location: ../pages/home.php");
            exit;
        } else {
            $_SESSION['login_email'] = $user;
            $_SESSION['error_message'] = "Usuario o contraseña incorecta";
            header("Location: ../index.php");
            exit;
        }  
};
