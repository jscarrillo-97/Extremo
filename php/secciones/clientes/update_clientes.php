 

<?php

#Salir si alguno de los datos no está presente
if (
    !isset($_POST["cliente_id"])     ||   
    !isset($_POST["cliente_mail"])   ||    
    !isset($_POST["cliente_pass"])   ||
    !isset($_POST["cliente_tel"])    ||  
    !isset($_POST["cliente_cto"])
  ) {
    exit();
}

#Si todo va bien, se ejecuta esta parte del código...

include_once "../../conexion.php";
$idCliente   = $_POST["cliente_id"];
$email       = $_POST["cliente_mail"];
$password    = $_POST["cliente_pass"];
$telefono    = $_POST["cliente_tel"];
$contacto    = $_POST["cliente_cto"];

 
$sentencia = $base_de_datos->prepare("SELECT fun_update_clientes(?,?,?,?,?);");

$resultado = $sentencia->execute([$idCliente,$email,$password,$telefono,$contacto]); # Pasar en el mismo orden de los ?
if ($resultado === true) 
{
    header("Location:listar_clientes.php");
} else {
    echo "Algo salió mal. Por favor verifica que la tabla exista, así como el ID del clientes";
}