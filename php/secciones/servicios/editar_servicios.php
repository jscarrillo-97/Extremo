<?php
 

if (!isset($_GET["servicio_id"]))
{
	echo "No existe el Usuario a editar";
	exit();
}
 
$servicio_id = $_GET["servicio_id"];
include_once "../../conexion.php";
$sentencia = $base_de_datos->prepare("SELECT servicio_id,id_tpo_servicio,servicio_nom,servicio_det  FROM servicio WHERE servicio_id = ?;");
$sentencia->execute([$servicio_id]);
$servicio = $sentencia->fetchObject();
if (!$servicio)
{
    #No existe
    echo "¡No existe algún Usuario con ese ID!";
    exit();
}

#Si el usuario existe, se ejecuta esta parte del código
?>
<?php 

include_once("../../conexion.php");
$sentencia = $base_de_datos->query('SELECT tpo_servicio_id,tpo_servicio_nom   FROM tipo_servicio ORDER BY 1');
$tpservicio = $sentencia->fetchAll(PDO::FETCH_OBJ);

?>        
<?php include_once "../../templates/header.php"?>
<div class="row">
	<div class="col-12">
		<h1>Editar</h1>
		<form action="./update_servicios.php" method="POST">
 
  
    <div class="mb-3">
      <select class="form-select form select-sm" name="id_tpo_servicio"  id="id_tpo_servicio">
        <?php foreach($tpservicio as $tpservi) { ?>	 
        <option value="<?php echo $tpservi->tpo_servicio_id ?>"<?php echo $select =($servicio->servicio_id == $tpservi->tpo_servicio_id)? 'selected':''; ?>>  
        <?php echo $tpservi->tpo_servicio_nom?></option> 
       <?php } ?>
      </select>
    </div>
	 
  
    <div class="mb-3">
      <label for="servicio_nom">Nombre Servicio</label>
         <input value="<?php echo $servicio->servicio_nom ; ?>" required name="servicio_nom" type="text" id="servicio_nom" placeholder="Nombre Servicio" class="form-control">
    </div>

 
   <!-- <div class="mb-3">
     <label for="servicio_disp">Disponibilidad</label>
        <select value="<?php echo $servicio->servicio_disp; ?>" class="form-control" id=" servicio_disp" name="servicio_disp">
        <option value="1">Disponible</option>
        <option value="0">No disponible</option>
  </select>
</div>-->
  
			<div class="mb-3">
      <label for="servicio_det">Detalle</label>
      <textarea  required name="servicio_det" id="servicio_det" rows="3" placeholder="Detalle Servicio"  class="form-control"><?php echo $servicio->servicio_det; ?></textarea>  
    </div>
 
			
			<button type="submit" class="btn btn-success">Guardar</button>
			<a href="./listar_servicios.php" class="btn btn-warning">Volver</a>
		</form>
	</div>
</div>
<?php include_once "../../templates/footer.php"?>