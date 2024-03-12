<?php
if (!isset($_POST['admin_mail']))

session_start();

// Incluir el archivo de conexión
require_once "./conexion.php";

// Verificar si se enviaron datos mediante el método POST
if ($_POST) {
    // Obtener el correo electrónico y la contraseña del formulario
    $usuario = $_POST['admin_mail'];
    $password = $_POST['admin_pass'];

    try {
        // Construir la consulta SQL
        $consulta = "SELECT * FROM parametros WHERE admin_mail = '$usuario' AND  admin_pass = MD5('$password')";

        // Ejecutar la consulta usando la conexión existente
        $resultado = $base_de_datos->query($consulta);

        // Verificar si se encontraron resultados
        if ($resultado->rowCount() > 0) {
            // Iniciar sesión y redirigir al usuario a la página principal
            $_SESSION['admin_mail'] = $usuario;
            echo 'Inicio de sesión correcto';
             header('Location: index.php');
            exit;
        } else {
            echo 'Correo electrónico o contraseña incorrectos';
        }
    } catch (PDOException $e) {
        echo "Error de conexión: " . $e->getMessage();
    }
}
?>
