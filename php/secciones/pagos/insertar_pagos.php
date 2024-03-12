 
<?php
if (!isset($_POST["nit_proveedor"])  ||  
    !isset($_POST["id_banco"])       ||   
    !isset($_POST["pago_fec_hor"])  ||
    !isset($_POST["val_iva"])        ||   
    !isset($_POST["val_neto"])       ||
    !isset($_POST["val_total"])      ||
    !isset($_POST["cta_pgo"]))
    {
    exit();
    }

#Si todo va bien, se ejecuta esta parte del código..., si no, nos jodimos
include_once "../../conexion.php";
$proveedor = $_POST["nit_proveedor"];
$banco     = $_POST["id_banco"];
$fecha     = $_POST["pago_fec_hor"];
$iva       = $_POST["val_iva"];
$neto      = $_POST["val_neto"];
$total     = $_POST["val_total"];
$cuenta    = $_POST["cta_pgo"];
/* 
Al incluir el archivo "base_de_datos.php", todas sus variables están
a nuestra disposición. Por lo que podemos acceder a ellas tal como si hubiéramos
copiado y pegado el código
 */

$sentencia = $base_de_datos->prepare("SELECT fun_insert_pagos( ?, ?, ?, ?, ?, ?, ?);");
$resultado = $sentencia->execute([$proveedor,$banco,$fecha,$iva,$neto,$total,$cuenta]); # Pasar en el mismo orden de los ?
#execute regresa un booleano. True en caso de que todo vaya bien, falso en caso contrario.
#Con eso podemos evaluar*/
echo $resultado;
if ($resultado === true) {
    # Redireccionar a la lista
    echo "Registro Insertado";
	header("Location: listar_pagos.php");
} else
    {
    echo "Registro NO Insertado";
    echo "Algo salió mal. Por favor verifica que la tabla exista";
    }