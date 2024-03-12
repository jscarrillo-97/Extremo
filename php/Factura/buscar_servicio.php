<?php
include_once "../configuracion/conexion.php";  

try {
    $servicio_id = $_POST["servicio_id "];; // Asegúrate de que $cliente_id sea un entero
    $stmt = $base_de_datos->prepare("SELECT * FROM servicio WHERE servicio_id = :codServicio");
    $stmt->bindParam(':codServicio', $servicio_id, PDO::PARAM_INT); // Utiliza PDO::PARAM_INT para valores enteros
    $stmt->execute();

    $servicio = $stmt->fetch(PDO::FETCH_ASSOC);

    if($servicio){
        echo json_encode($servicio);
    }else{
        echo json_encode(array('error' => 'Servicio no encontrado')); 
    }
   
} catch (PDOException $e) {
    echo json_encode(array('error' => 'Error de conexión: ' . $e->getMessage()));
}
?>
