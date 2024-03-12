<?php

require '../config.php';

if(isset($_POST['servicio_id'])){

    $servicio_id = $_POST['servicio_id'];
    $token = $_POST['token'];

    $token_tmp =  hash_hmac('sha256',$servicio_id,KEY_TOKEN);

    if ($token == $token_tmp) {

    if(isset($_SESSION['carrito']['servicios'][$servicio_id])){
        $_SESSION['carrito']['servicios'][$servicio_id] += 1;    
    } else{
    $_SESSION['carrito']['servicios'][$servicio_id] =1;
    }
    
    $datos['numero'] = count($_SESSION['carrito']['servicios']);
    $datos['okay']   = true; 

    } else {
        $datos['okay'] = false; 
    }   
}else{
    $datos['okay'] =false;
}

echo json_encode($datos);