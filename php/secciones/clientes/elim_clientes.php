<?php

if (!isset($_GET["cliente_id"]))
{
    exit();
}

$cliente_id = $_GET["cliente_id"];
include_once "../../conexion.php";
$sentencia =  $base_de_datos->prepare("SELECT fun_delete_clientes( ? );");
$resultado = $sentencia->execute([$cliente_id]);
if ($resultado === true) {
    header("Location: listar_clientes.php");
} else {
    echo "Algo salió mal... Go back to the elemental school";
}

 