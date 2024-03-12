<?php

require_once '../config.php'; // Agrega un punto y coma al final
require_once '../../conexion.php'; // Agrega un punto y coma al final

if (isset($_POST['action'])) {

    $action = $_POST['action'];
    $servicio_id = isset($_POST['servicio_id']) ? $_POST['servicio_id'] : 0;

    if ($action == 'agregar') {
        $cantidad = isset($_POST['cantidad']) ? $_POST['cantidad'] : 0;
        $respuesta = agregar($servicio_id, $cantidad);
        if ($respuesta > 0) {
            $datos['okay'] = true;
        } else {
            $datos['okay'] = false;
        }
        $datos['sub'] = MONEDA . number_format($respuesta, 0, '.', '.');
    } else {
        $datos['okay'] = false;
    }
} else {
    $datos['okay'] = false;
}  

echo json_encode($datos);

function agregar($servicio_id, $cantidad)
{
    $res = 0;
    if ($servicio_id > 0 && is_numeric($cantidad)) {
        if (isset($_SESSION['carrito']['servicios'][$servicio_id])) {
            $_SESSION['carrito']['servicios'][$servicio_id] = $cantidad;

            $sentencia = $conexion->prepare('SELECT servicio_pre FROM servicio WHERE servicio_id = :codServicio AND servicio_disp = true LIMIT 1');
            $sentencia->bindParam(':codServicio', $servicio_id, PDO::PARAM_INT);
            $sentencia->execute([$servicio_id]);
            $row = $sentencia->fetch(PDO::FETCH_ASSOC);
            $nombre  = $row['servicio_nom'];
            $detalle = $row['servicio_det'];  
            $precio  = $row['servicio_pre'];
            $res = $cantidad * $precio;

            return $res;
        }
    } else {
        return $res;
    }
}
 