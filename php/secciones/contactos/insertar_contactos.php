 
<?php
if ( 
    !isset($_POST["contacto_nom"])   ||   
    !isset($_POST["contacto_tel"])   ||
    !isset($_POST["contacto_mail"])  ||
    !isset($_POST["contacto_msg"]))    
    {
    exit();
    }
#Si todo va bien, se ejecuta esta parte del código..., si no, nos jodimos

include_once "../../conexion.php";
 
$nombre   = $_POST["contacto_nom"];
$telefono = $_POST["contacto_tel"];
$email    = $_POST["contacto_mail"];
$mensaje  = $_POST["contacto_msg"];
 
/*
Al incluir el archivo "base_de_datos.php", todas sus variables están
a nuestra disposición. Por lo que podemos acceder a ellas tal como si hubiéramos
copiado y pegado el código
 */

$sentencia = $base_de_datos->prepare("SELECT fun_insert_contactos(?, ?, ?, ?);");
$resultado = $sentencia->execute([$nombre,$telefono,$email,$mensaje]); # Pasar en el mismo orden de los ?
#execute regresa un booleano. True en caso de que todo vaya bien, falso en caso contrario.
#Con eso podemos evaluar*/
if ($resultado === true) {
    # Redireccionar a la lista
    echo "Registro Insertado";
	header("Location: listar_contactos.php");
} else
    {
    echo "Registro NO Insertado";
    echo "Algo salió mal. Por favor verifica que la tabla exista";
    }