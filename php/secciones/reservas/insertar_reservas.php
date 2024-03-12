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
if  (!isset($_POST["id_cliente"])   ||  
     !isset($_POST["fecha_inicio"]) ||
     !isset($_POST["fecha_fin"])    ||
     !isset($_POST["reserva_val"])  ||
     !isset($_POST["reserva_est"]))    
    {
    exit();
     
    }
#Si todo va bien, se ejecuta esta parte del código..., si no, nos jodimos
include_once "../../conexion.php";
$cliente  = $_POST["id_cliente"];
$fecha    = $_POST["fecha_inicio"];
$duracion = $_POST["fecha_fin"];
$valor    = $_POST["reserva_val"];
$estado   = $_POST["reserva_est"];
  
/*
Al incluir el archivo "base_de_datos.php", todas sus variables están
a nuestra disposición. Por lo que podemos acceder a ellas tal como si hubiéramos
copiado y pegado el código
 */

$sentencia = $base_de_datos->prepare("SELECT fun_insert_reservas( ?, ?, ?, ?, ?);");
$resultado = $sentencia->execute([$cliente,$fecha,$duracion,$valor,$estado]); 
 
# Pasar en el mismo orden de los ?
#execute regresa un booleano. True en caso de que todo vaya bien, falso en caso contrario.
#Con eso podemos evaluar*/
echo $resultado;
if ($resultado === true) {
    # ,eeccioneccionar a la lista
    echo "Registro Insertado";
	header("Location: listar_reservas.php");
} else
    {
    echo "Registro NO Insertado";
    echo "Algo salió mal. Por favor verifica que la tabla exista";
    }