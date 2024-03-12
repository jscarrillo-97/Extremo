 
|
<?php

#Salir si alguno de lo s datos no está presente
if (!isset($_POST["banco_id"])     ||   
    !isset($_POST["banco_nom"])   
  ) {
    exit();
}
#Si todo va bien, se ejecuta esta parte del código...

include_once "../../conexion.php";
$bancoId   = $_POST["banco_id"]; 
$bancoNom  = $_POST["banco_nom"];
 
 
$sentencia = $base_de_datos->prepare("SELECT fun_update_bancos(?,?);");

$resultado = $sentencia->execute([$bancoId,$bancoNom]); # Pasar en el mismo orden de los ?
if ($resultado === true) 
{
    header("Location:listar_bancos.php");
} else {
    echo "Algo salió mal. Por favor verifica que la tabla exista, así como el ID del bancos";
}