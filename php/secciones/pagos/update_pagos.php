 
<?php

#Salir si alguno de los datos no está presente
if (
    !isset($_POST["pago_id"])      ||   
    !isset($_POST["pago_fec_hor"]) ||    
    !isset($_POST["val_iva"])      ||
    !isset($_POST["val_neto"])     ||  
    !isset($_POST["val_total"])    ||  
    !isset($_POST["cta_pgo"])
  ) {
    exit();
}

#Si todo va bien, se ejecuta esta parte del código...

include_once "../../conexion.php";
$pago_id  = $_POST["pago_id"];
$fecha    = $_POST["pago_fec_hor"];
$iva      = $_POST["val_iva"];
$neto     = $_POST["val_neto"];
$total    = $_POST["val_total"];
$cuenta   = $_POST["cta_pgo"];
 
 
$sentencia = $base_de_datos->prepare("SELECT fun_update_pagos(?,?,?,?,?,?);");
$resultado = $sentencia->execute([$pago_id,$fecha,$iva,$neto,$total,$cuenta]);# Pasar en el mismo orden de los ?
if ($resultado === true) 
{
    header("Location:listar_pagos.php");
} else {
    echo "Algo salió mal. Por favor verifica que la tabla exista, así como el ID del clientes";
}