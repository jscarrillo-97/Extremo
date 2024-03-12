<?php

if (!isset($_GET["proveedor_nit"]))
{
    exit();
}

$proveedor_nit = $_GET["proveedor_nit"];
include_once "../../conexion.php";
$sentencia =  $base_de_datos->prepare("SELECT fun_delete_proveedores( ? );");
$resultado = $sentencia->execute([$proveedor_nit]);
if ($resultado === true) {
    header("Location: listar_proveedores.php");
} else {
    echo "Algo salió mal... Go back to the elemental school";
}

 