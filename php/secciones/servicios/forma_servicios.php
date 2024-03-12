<?php include("../../templates/header.php"); ?>

</br>

<div class="card">
    <div class="card-header">
       Datos de Servicios
    </div>
    <div class="card-body">
<?php 

include_once "../../conexion.php";
$sentencia = $base_de_datos->query('SELECT tpo_servicio_id,tpo_servicio_nom  FROM tipo_servicio ORDER BY 1');
$tpservicio = $sentencia->fetchAll(PDO::FETCH_OBJ);

?>        
 

    <form action="./insertar_servicios.php" method="POST" id="form">
  
        <div class="mb-3">
      <label for="servicio_nom">Nombre Servicio</label>
        <input  required name="servicio_nom" type="text"
        id="servicio_nom" placeholder="Nombre Servicio"   class="form-control"  >
    </div>

    <div class="mb-3">
      <select class="form-select form select-sm" name="id_tpo_servicio"  id="id_tpo_servicio">
        <?php foreach($tpservicio as $tpservi) { ?>	 
        <option value="<?php echo $tpservi->tpo_servicio_id ?>"> 
        <?php echo $tpservi->tpo_servicio_nom?></option> 
       <?php } ?>
      </select>
    </div>

  <div class="mb-3">
  <label for="servicio_disp">Disponibilidad</label>
  <select class="form-control" id="servicio_disp" name="servicio_disp">
    <option value="true">Disponible</option>
    <option value="false">No disponible</option>
  </select>
</div>

    <div class="mb-3">
      <label for="servicio_det">Detalle</label>
      <textarea  required name="servicio_det" id="servicio_det" rows="3" placeholder="Detalle Servicio"  class="form-control"></textarea>
    </div>

    <div class="mb-3">
      <label for="servicio_pre">Precio</label>
      <input  required   name="servicio_pre" type="number"
        id="servicio_pre"   placeholder="Precio en COP"   pattern="^\d+(\.\d{1,2})?$" class="form-control" >
    </div>
       
      <button type="submit" class="btn btn-success">Agregar Registo</button>
      <a name="" id="" class="btn btn-primary" href="index.php" role="button">Cancelar</a>  
    
  </form>
 

   

   
        
    
</div>

<?php include("../../templates/footer.php"); ?>