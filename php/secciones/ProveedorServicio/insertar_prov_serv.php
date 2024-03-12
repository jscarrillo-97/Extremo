 
<?php
if (!isset($_POST["nit_proveedor"])  ||  
    !isset($_POST["id_servicio"]))
    {
    exit();
    }

#Si todo va bien, se ejecuta esta parte del código..., si no, nos jodimos
include_once "../../conexion.php";
$proveedor = $_POST["nit_proveedor"];
$servicio  = $_POST["id_servicio"];
 
/* 
Al incluir el archivo "base_de_datos.php", todas sus variables están
a nuestra disposición. Por lo que podemos acceder a ellas tal como si hubiéramos
copiado y pegado el código
 */

$sentencia = $base_de_datos->prepare("SELECT fun_insert_pro_serv( ?, ?);");
$resultado = $sentencia->execute([$proveedor,$servicio]); # Pasar en el mismo orden de los ?
#execute regresa un booleano. True en caso de que todo vaya bien, falso en caso contrario.
#Con eso podemos evaluar*/
 
if ($resultado === true) {
    # Redireccionar a la lista
    echo "Registro Insertado";
	header("Location: listar_pro_serv.php");
} else
    {
    echo "Registro NO Insertado";
    echo "Algo salió mal. Por favor verifica que la tabla exista";
    }