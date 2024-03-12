 

<?php

#Salir si alguno de los datos no está presente
if (!isset($_POST["servicio_id"])       ||
    !isset($_POST["id_tpo_servicio"])       ||  
    !isset($_POST["servicio_nom"])      || 
    !isset($_POST["servicio_disp"])     ||
    !isset($_POST["servicio_det"])      || 
    !isset($_POST["servicio_pre"]))  
  {
    exit();
}

#Si todo va bien, se ejecuta esta parte del código...

include_once "../../conexion.php";
$servicio        = $_POST["servicio_id"];
$tipo            = $_POST["id_tpo_servicio"];
$nombre          = $_POST["servicio_nom"];
$disponibilidad  = $_POST["servicio_disp"];
$detalle         = $_POST["servicio_det"];
$precio          = $_POST["servicio_pre"]; 

$sentencia =  $base_de_datos->prepare("SELECT  fun_update_servicios(?,?, ?, ?, ?, ?);");
$resultado = $sentencia->execute([$servicio,$tipo,$nombre,$disponibilidad,$detalle,$precio]); #Pasar en el mismo orden de los ?
if ($resultado === true) 
{
    header("Location:listar_servicios.php");
} else {
    echo "Algo salió mal. Por favor verifica que la tabla exista, así como el ID del clientes";
}

 
 
 
 