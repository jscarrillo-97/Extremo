 

<?php

#Salir si alguno de los datos no está presente
if (!isset($_POST["municipio_id"])     ||
    !isset($_POST["municipio_nom"])    ||    
    !isset($_POST["cod_postal"])
  ) {
    exit();
}

#Si todo va bien, se ejecuta esta parte del código...

include_once "../../conexion.php";
$idMuni    = $_POST["municipio_id"];
$nomMuni   = $_POST["municipio_nom"];
$postal    = $_POST["cod_postal"];


 
$sentencia = $base_de_datos->prepare("SELECT fun_update_municipios(?,?,?);");

$resultado = $sentencia->execute([$idMuni,$nomMuni,$postal]); # Pasar en el mismo orden de los ?
if ($resultado === true) 
{
    header("Location:listar_municipios.php");
} else {
    echo "Algo salió mal. Por favor verifica que la tabla exista, así como el ID del clientes";
}