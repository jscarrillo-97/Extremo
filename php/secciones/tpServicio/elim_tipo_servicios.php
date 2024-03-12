<?php

if (!isset($_GET["tpo_servicio_id"]))
{
    exit();
}

$tpo_servicio_id = $_GET["tpo_servicio_id"];
include_once "../../conexion.php";
$sentencia = $base_de_datos->prepare("SELECT fun_delete_tpservicio( ? );");
$resultado = $sentencia->execute([$tpo_servicio_id ]);
if ($resultado === true) {
    header("Location: listar_tipo_servicios.php");
} else {
    echo "Algo salió mal... Go back to the elemental school";
}