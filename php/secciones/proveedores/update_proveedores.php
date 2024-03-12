 

<?php

#Salir si alguno de los datos no está presente
if (!isset($_POST["proveedor_nit"])  || 
    !isset($_POST["id_municipio"])  ||
    !isset($_POST["proveedor_nom"])  ||
    !isset($_POST["proveedor_dir"])  ||
    !isset($_POST["proveedor_mail"]) ||
    !isset($_POST["proveedor_tel"]) ) 
   
    {
    exit();
}

#Si todo va bien, se ejecuta esta parte del código...

include_once "../../conexion.php";
$nit       = $_POST["proveedor_nit"];
$municipio = $_POST["id_municipio"];
$nombre    = $_POST["proveedor_nom"];
$direccion = $_POST["proveedor_dir"];
$email     = $_POST["proveedor_mail"];
$telefono  = $_POST["proveedor_tel"];
 
 
$sentencia = $base_de_datos->prepare("SELECT fun_update_proveedores(?,?,?,?,?,?);");

$resultado = $sentencia->execute([$nit,$municipio,$nombre,$direccion,$email,$telefono]); # Pasar en el mismo orden de los ?
if ($resultado === true) 
{
    header("Location:listar_proveedores.php");
} else {
    echo "Algo salió mal. Por favor verifica que la tabla exista, así como el ID del nit$nits";
}