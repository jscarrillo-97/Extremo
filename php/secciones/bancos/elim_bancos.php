<?php

if (!isset($_GET["banco_id"]))
{
    exit();
}

$banco_id = $_GET["banco_id"];
include_once "../../conexion.php";
$sentencia =  $base_de_datos->prepare("SELECT fun_delete_bancos( ? );");
$resultado = $sentencia->execute([$banco_id]);
if ($resultado === true) {
    header("Location: listar_bancos.php");
} else {
    echo "Algo salió mal... Go back to the elemental school";
}

 