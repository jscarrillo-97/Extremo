<?php
/*
CRUD con PostgreSQL y PHP
@Carlos Eduardo Perez Rueda
@Marzo de 2023
===================================================================
Este archivo inserta los datos enviados a través de formulario.php
===================================================================
*/
?>
<?php
if  (!isset($_POST["proveedor_nit"])  ||  
    !isset($_POST["proveedor_rnt"])   ||   
    !isset($_POST["id_municipio"])    ||
    !isset($_POST["proveedor_nom"])   ||
    !isset($_POST["proveedor_dir"])   ||
    !isset($_POST["proveedor_mail"])   ||
    !isset($_POST["proveedor_tel"])) 
    {
    exit();
     
    }
#Si todo va bien, se ejecuta esta parte del código..., si no, nos jodimos
 
include_once "../../conexion.php";
$nit        = $_POST["proveedor_nit"];
$rnt        = $_POST["proveedor_rnt"];
$nombre     = $_POST["proveedor_rnt"];
$municipio  = $_POST["id_municipio"];
$direccion  = $_POST["proveedor_dir"];
$email      = $_POST["proveedor_mail"];
$telefono   = $_POST["proveedor_tel"];

 
/*
Al incluir el archivo "base_de_datos.php", todas sus variables están
a nuestra disposición. Por lo que podemos acceder a ellas tal como si hubiéramos
copiado y pegado el código
 */

$sentencia = $base_de_datos->prepare("SELECT fun_insert_proveedores(?, ?, ?, ?, ?, ?, ?);");
$resultado = $sentencia->execute([$nit,$rnt,$municipio,$nombre,$direccion,$email,$telefono]); 
 
# Pasar en el mismo orden de los ?
#execute regresa un booleano. True en caso de que todo vaya bien, falso en caso contrario.
#Con eso podemos evaluar*/
echo $resultado;
if ($resultado === true) {
    # ,eeccioneccionar a la lista
    echo "Registro Insertado";
	header("Location: listar_proveedores.php");
} else
    {
    echo "Registro NO Insertado";
    echo "Algo salió mal. Por favor verifica que la tabla exista";
    }