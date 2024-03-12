<?php

if (!isset($_GET["municipio_id"]))
{
    exit();
}

$municipio_id = $_GET["municipio_id"];
include_once "../../conexion.php";
$sentencia =  $base_de_datos->prepare("SELECT fun_delete_municipios( ? );");
$resultado = $sentencia->execute([$municipio_id]);
if ($resultado === true) {
    header("Location: listar_municipios.php");
} else {
    echo "Algo salió mal... Go back to the elemental school";
}

 