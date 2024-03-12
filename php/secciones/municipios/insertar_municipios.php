 
<?php
if ( 
    !isset($_POST["municipio_nom"])   ||   
    !isset($_POST["cod_postal"]))    
    {
    exit();
    }
#Si todo va bien, se ejecuta esta parte del código..., si no, nos jodimos

include_once "../../conexion.php";
 
$nomdoc   = $_POST["municipio_nom"];
$postal   = $_POST["cod_postal"];
 
/*
Al incluir el archivo "base_de_datos.php", todas sus variables están
a nuestra disposición. Por lo que podemos acceder a ellas tal como si hubiéramos
copiado y pegado el código
 */

$sentencia = $base_de_datos->prepare("SELECT fun_insert_municipios(?, ? );");
$resultado = $sentencia->execute([$nomdoc,$postal]); # Pasar en el mismo orden de los ?
#execute regresa un booleano. True en caso de que todo vaya bien, falso en caso contrario.
#Con eso podemos evaluar*/
echo $resultado;
if ($resultado === true) {
    # Redireccionar a la lista
    echo "Registro Insertado";
	header("Location: listar_municipios.php");
} else
    {
    echo "Registro NO Insertado";
    echo "Algo salió mal. Por favor verifica que la tabla exista";
    }