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
if  (!isset($_POST["id_cliente"])          ||   
     !isset($_POST["id_banco"])            ||
     !isset($_POST["recaudo_fec_hora"])    ||
     !isset($_POST["recaudo_val_total"]))    
    {
    exit();
     
    }
#Si todo va bien, se ejecuta esta parte del código..., si no, nos jodimos
 
include_once "../../conexion.php";
$cliente = $_POST["id_cliente"];
$banco   = $_POST["id_banco"];
$fecha   = $_POST["recaudo_fec_hora"];
$total   = $_POST["recaudo_val_total"];
 
/*
Al incluir el archivo "base_de_datos.php", todas sus variables están
a nuestra disposición. Por lo que podemos acceder a ellas tal como si hubiéramos
copiado y pegado el código
 */

$sentencia = $base_de_datos->prepare("SELECT fun_insert_recaudos( ?, ?, ?, ?);");
$resultado = $sentencia->execute([$cliente,$banco,$fecha,$total]); 
# Pasar en el mismo orden de los ?
#execute regresa un booleano. True en caso de que todo vaya bien, falso en caso contrario.
#Con eso podemos evaluar*/
echo $resultado;
if ($resultado === true) {
    # ,eeccioneccionar a la lista
    echo "Registro Insertado";
	header("Location: listar_recaudos.php");
} else
    {
    echo "Registro NO Insertado";
    echo "Algo salió mal. Por favor verifica que la tabla exista";
    }