 

<?php

#Salir si alguno de los datos no está presente
if (
    !isset($_POST["id_banco"])      ||   
    !isset($_POST["num_cuenta"])    ||    
    !isset($_POST["ind_cta_aho"]) ) 
    { exit();
}

#Si todo va bien, se ejecuta esta parte del código...

include_once "../../conexion.php";
$banco      = $_POST["id_banco"];
$cuenta     = $_POST["num_cuenta"];
$indicador  = $_POST["ind_cta_aho"];
 

 
$sentencia = $base_de_datos->prepare("SELECT fun_update_pro_banco(?,?,?);");

$resultado = $sentencia->execute([$banco,$cuenta,$indicador]); # Pasar en el mismo orden de los ?
if ($resultado === true) 
{
    header("Location:listar_clientes.php");
} else {
    echo "Algo salió mal. Por favor verifica que la tabla exista, así como el ID del clientes";
}