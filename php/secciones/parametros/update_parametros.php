 

<?php

#Salir si alguno de los datos no está presente
if (
    !isset($_POST["empresa_nit"])   ||   
    !isset($_POST["empresa_nom"])   ||    
    !isset($_POST["empresa_ciu"])   ||
    !isset($_POST["porc_iva"])      || 
    !isset($_POST["num_fact"])      ||
    !isset($_POST["primer_pago"])   ||
    !isset($_POST["admin_mail"])    || 
    !isset($_POST["admin_pass"])
  ) {
    exit();
}

#Si todo va bien, se ejecuta esta parte del código...

include_once "../../conexion.php";
$empresa  = $_POST["empresa_nit"];
$nombre   = $_POST["empresa_nom"];
$ciudad   = $_POST["empresa_ciu"];
$iva      = $_POST["porc_iva"];
$factura  = $_POST["num_fact"];
$pago     = $_POST["primer_pago"];
$admin    = $_POST["admin_mail"];
$clave    = $_POST["admin_pass"];

 
$sentencia = $base_de_datos->prepare("SELECT fun_update_parametros( ?, ?, ?, ?, ?, ?, ?, ?);");

$resultado = $sentencia->execute([$empresa,$nombre,$ciudad,$iva,$factura,$pago,$admin,$clave]); # Pasar en el mismo orden de los ?
if ($resultado === true) 
{
    header("Location:listar_parametros.php");
} else {
    echo "Algo salió mal. Por favor verifica que la tabla exista, así como el ID del clientes";
}