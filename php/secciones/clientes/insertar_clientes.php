 
<?php
if (!isset($_POST["cliente_id"])     ||  
    !isset($_POST["cliente_tpdoc"])  ||   
    !isset($_POST["cliente_nom"])    ||
    !isset($_POST["cliente_ape"])    ||
    !isset($_POST["cliente_nac"])    ||
    !isset($_POST["cliente_mail"])   ||
    !isset($_POST["cliente_pass"])   ||
    !isset($_POST["cliente_tel"])    ||
    !isset($_POST["cliente_cto"]))    
    {
    exit();
    }
#Si todo va bien, se ejecuta esta parte del código..., si no, nos jodimos

include_once "../../conexion.php";
$idCliente   = $_POST["cliente_id"];
$documento   = $_POST["cliente_tpdoc"];
$nombres     = $_POST["cliente_nom"];
$apellidos   = $_POST["cliente_ape"];
$nacimiento  = $_POST["cliente_nac"];
$email       = $_POST["cliente_mail"];
$password    = $_POST["cliente_pass"];
$telefono    = $_POST["cliente_tel"];
$contacto    = $_POST["cliente_cto"];
/*
Al incluir el archivo "base_de_datos.php", todas sus variables están
a nuestra disposición. Por lo que podemos acceder a ellas tal como si hubiéramos
copiado y pegado el código
 */

$sentencia = $base_de_datos->prepare("SELECT fun_insert_clientes(?, ?, ?, ?, ?,?, ?, ?, ?);");
$resultado = $sentencia->execute([$idCliente,$documento,$nombres,$apellidos,$nacimiento,$email,$password,$telefono,$contacto]); # Pasar en el mismo orden de los ?
#execute regresa un booleano. True en caso de que todo vaya bien, falso en caso contrario.
#Con eso podemos evaluar*/
echo $resultado;
if ($resultado === true) {
    # Redireccionar a la lista
    echo "Registro Insertado";
	header("Location: listar_clientes.php");
} else
    {
    echo "Registro NO Insertado";
    echo "Algo salió mal. Por favor verifica que la tabla exista";
    }