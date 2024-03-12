<?php
include_once "../configuracion/conexion.php";  

try {
    $cliente_id = $_POST["cliente_id"]; // Asegúrate de que $cliente_id sea un entero
    $stmt = $base_de_datos->prepare("SELECT * FROM cliente WHERE cliente_id = :id");
    $stmt->bindParam(':id', $cliente_id, PDO::PARAM_INT); // Utiliza PDO::PARAM_INT para valores enteros
    $stmt->execute();

    $cliente = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($cliente) {
        $respuesta = array(
            'cliente_nom' => $cliente['cliente_nom'],
            'cliente_ape' => $cliente['cliente_ape'],
            'cliente_id'  => $cliente['cliente_id'],
        );
        echo json_encode($respuesta);
    } else {
        echo json_encode(array('error' => 'Cliente no encontrado')); 
    }
} catch (PDOException $e) {
    echo json_encode(array('error' => 'Error de conexión: ' . $e->getMessage()));
}
?>
