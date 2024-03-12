 
<?php
if (!isset($_POST["id_reserva"])  ||
    !isset($_POST["id_servicio"]) ||
    !isset($_POST["cant_serv"])   ||
    !isset($_POST["val_bruto"])   ||
    !isset($_POST["val_iva"])     ||
    !isset($_POST["val_total"]))
    {
    exit();
    }

#Si todo va bien, se ejecuta esta parte del código..., si no, nos jodimos
include_once "../../conexion.php";
$reserva  = $_POST["id_reserva"];
$servicio = $_POST["id_servicio"];
$cantidad = $_POST["cant_serv"];
$bruto    = $_POST["val_bruto"];
$iva      = $_POST["val_iva"];
$total    = $_POST["val_total"];

/* 
Al incluir el archivo "base_de_datos.php", todas sus variables están
a nuestra disposición. Por lo que podemos acceder a ellas tal como si hubiéramos
copiado y pegado el código
 */

$sentencia = $base_de_datos->prepare("SELECT fun_insert_det_reservas(?,?,?,?,?,?);");
$resultado = $sentencia->execute([$reserva,$servicio,$cantidad,$bruto,$iva,$total]); # Pasar en el mismo orden de los ?
#execute regresa un booleano. True en caso de que todo vaya bien, falso en caso contrario.
#Con eso podemos evaluar*/
 
if ($resultado === true) {
    # Redireccionar a la lista
    echo "Registro Insertado";
	header("Location: listar_det_reservas.php");
} else
    {
    echo "Registro NO Insertado";
    echo "Algo salió mal. Por favor verifica que la tabla exista";
    }