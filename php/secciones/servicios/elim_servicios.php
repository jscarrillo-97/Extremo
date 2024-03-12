<?php

if (!isset($_GET["servicio_id"]))
{
    exit();
}

$servicio = $_GET["servicio_id"];
include_once "../../conexion.php";
$sentencia = $base_de_datos->prepare("SELECT fun_delete_servicio( ? );");
$resultado = $sentencia->execute([$servicio ]);
if ($resultado === true) {
    header("Location: listar_servicios.php");
} else {
    echo "Algo salió mal... Go back to the elemental school";
}