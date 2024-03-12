<?php include("../../templates/header.php"); ?>
<br/>

<div class="card">
    <div class="card-header">
        Cuentas de proveedores
    </div>
    <div class="card-body">

<?php
    
    include_once "../../conexion.php";
      /*echo "Entro a Listar para saber si está entrando o no....";*/
      $sentencia = $base_de_datos->query('SELECT proveedor_nit,proveedor_rnt,id_municipio,proveedor_nom,proveedor_dir,proveedor_mail,proveedor_tel   FROM proveedor ORDER BY 1');
      $proveedor = $sentencia->fetchAll(PDO::FETCH_OBJ);

?>

<?php

include_once "../../conexion.php";
/*echo "Entro a Listar para saber si está entrando o no....";*/
$sentencia = $base_de_datos->query('SELECT s.servicio_id,t.tpo_servicio_nom,s.servicio_nom,s.servicio_disp,s.servicio_det,s.servicio_pre  FROM servicio s JOIN tipo_servicio t on s.id_tpo_servicio = t.tpo_servicio_id ORDER BY s.servicio_nom');
$servicio = $sentencia->fetchAll(PDO::FETCH_OBJ);

?>

    
        
 <form action="./insertar_prov_serv.php" method="post">
      
 
       <div class="mb-3">
       <label for="nit_proveedor">Proveedor</label>
        <select class="form-select form select-sm" name="nit_proveedor" id="nit_proveedor">
          <?php foreach ($proveedor as $prov) { ?>	 
            <option value="<?php echo $prov->proveedor_nit;?>"> 
          <?php echo $prov->proveedor_nom; ?></option> 
          <?php } ?>
      </select>
      </div>

       <div class="mb-3">
       <label for="id_servicio">Servicio</label>
        <select class="form-select form select-sm" name="id_servicio" id="id_servicio">
          <?php foreach ($servicio as $servi) { ?>	 
            <option value="<?php echo $servi->servicio_id;?>"> 
          <?php echo $servi->servicio_nom; ?></option> 
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


 
  
       
       <button type="submit" class="btn btn-success">Agregar Registo</button>
       <a name="" id="" class="btn btn-primary" href="index.php" role="button">Cancelar</a>




 </form>


 
         
</div>




<?php include("../../templates/footer.php"); ?>