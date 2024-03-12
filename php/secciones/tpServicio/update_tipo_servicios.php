 

<?php

#Salir si alguno de los datos no está presente
if (
    !isset($_POST["tpo_servicio_id"])     ||   
    !isset($_POST["tpo_servicio_nom"])         
  ) {
    exit();
}

#Si todo va bien, se ejecuta esta parte del código...

include_once "../../conexion.php";
$servicioTpo  = $_POST["tpo_servicio_id"];
$servicioNom  = $_POST["tpo_servicio_nom"];
 

 
$sentencia = $base_de_datos->prepare("SELECT fun_update_tipo_servicios(?,?);");

$resultado = $sentencia->execute([$servicioTpo,$servicioNom]); # Pasar en el mismo orden de los ?
if ($resultado === true) 
{
    header("Location:listar_tipo_servicios.php");
} else {
    echo "Algo salió mal. Por favor verifica que la tabla exista, así como el ID del clientes";
}