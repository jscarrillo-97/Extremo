 
<?php
if (!isset($_POST["empresa_nit"])  ||  
    !isset($_POST["empresa_nom"])  ||   
    !isset($_POST["empresa_ciu"])  ||
    !isset($_POST["porc_iva"])     ||
    !isset($_POST["num_fact"])     ||
    !isset($_POST["primer_pago"])     ||
    !isset($_POST["admin_mail"])   ||
    !isset($_POST["admin_pass"]))    
    {
    exit();
    }
#Si todo va bien, se ejecuta esta parte del código..., si no, nos jodimos

include_once "../../conexion.php";
$nit      = $_POST["empresa_nit"];
$nombre   = $_POST["empresa_nom"];
$ciudad   = $_POST["empresa_ciu"];
$iva      = $_POST["porc_iva"];
$factura  = $_POST["num_fact"];
$pago     = $_POST["primer_pago"];
$email    = $_POST["admin_mail"];
$password = $_POST["admin_pass"];

/*
Al incluir el archivo "base_de_datos.php", todas sus variables están
a nuestra disposición. Por lo que podemos acceder a ellas tal como si hubiéramos
copiado y pegado el código
 */

$sentencia = $base_de_datos->prepare("SELECT fun_insert_parametros( ?, ?, ?, ?, ?, ?, ?, ?);");
$resultado = $sentencia->execute([$nit,$nombre,$ciudad,$iva,$factura,$pago,$email,$password]); # Pasar en el mismo orden de los ?
#execute regresa un booleano. True en caso de que todo vaya bien, falso en caso contrario.
#Con eso podemos evaluar*/
echo $resultado;
if ($resultado === true) {
    # Redireccionar a la lista
    echo "Registro Insertado";
	header("Location: listar_parametros.php");
} else
    {
    echo "Registro NO Insertado";
    echo "Algo salió mal. Por favor verifica que la tabla exista";
    }