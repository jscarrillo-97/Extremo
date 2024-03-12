<?php
 

if (!isset($_GET["tpo_servicio_id"]))
{
	echo "No existe el Usuario a editar";
	exit();
}
 
$tpo_servicio = $_GET["tpo_servicio_id"];
include_once "../../conexion.php";
$sentencia =  $base_de_datos->prepare("SELECT tpo_servicio_id,tpo_servicio_nom  FROM tipo_servicio WHERE tpo_servicio_id = ?;");
$sentencia->execute([$tpo_servicio]);
$tpo_servicio = $sentencia->fetchObject();
if (!$tpo_servicio)
{
    #No existe
    echo "¡No existe algún Usuario con ese ID!";
    exit();
}

#Si el usuario existe, se ejecuta esta parte del código
?>
<?php include_once "../../templates/header.php"?>
			 
	<div class="row">
	<div class="col-12">
		<h1>Editar</h1>
		<form action="update_tipo_servicios.php" method="POST">

      <div class="mb-3">
      <label for="tpo_servicio_id">ID Tipo Servicio</label>
      <input value="<?php echo $tpo_servicio->tpo_servicio_id; ?>" readonly  name="tpo_servicio_id"  
       id="tpo_servicio_id" placeholder="ID Tipo Servicio" class="form-control">
      </div>

      <div class="mb-3">
        <label for="tpo_servicio_nom" >Nombre Tipo Servicio</label>
           <input value="<?php echo $tpo_servicio->tpo_servicio_nom; ?>" required  name="tpo_servicio_nom"       type="text" id="tpo_servicio_nom" placeholder="Nombre Tipo de Servicio"  class="form-control">
           
      </div>

			
			<button type="submit" class="btn btn-success">Guardar</button>
			<a href="./listar_tipo_servicios.php" class="btn btn-warning">Volver</a>
		</form>
	</div>
</div>
<?php include_once "../../templates/footer.php"?>