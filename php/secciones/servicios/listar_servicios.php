<?php include("../../templates/header.php"); ?>

</br>

<?php

include_once "../../conexion.php";
/*echo "Entro a Listar para saber si está entrando o no....";*/
$sentencia = $base_de_datos->query('SELECT s.servicio_id,t.tpo_servicio_nom,s.servicio_nom,s.servicio_det  FROM  servicio s JOIN tipo_servicio t on s.id_tpo_servicio = t.tpo_servicio_id WHERE s.ind_borrado=TRUE ORDER BY s.servicio_nom');
$servicio = $sentencia->fetchAll(PDO::FETCH_OBJ);

?>
    <div class="card">
      <div class="card-header"> 
        <a name="" id="" class="btn btn-primary" 
          href="forma_servicios.php" role="button">
         Agregar Registro
        </a>
      </div>
    <div class="card-body">
    
     <div class="table-responsive-sm">
       <table class="table  table-sm table-cell-sm table-row-sm table-bordered table-hover" id="tabla_id">
         <thead class="table-dark thead-light">
           <tr>
             <th>Servicio</th>
             <th>Tipo de Servicio</th>
			       <th>Detalle</th>
             <th>Editar</th>
             <th>Eliminar</th>						
            </tr>
         </thead>
           <tbody>
             <?php foreach($servicio as $servi)
			   {           
				  ?>
				    <tr class="text-center">
                    <td><?php echo $servi->servicio_nom?></td>
                    <td><?php echo $servi->tpo_servicio_nom?></td>
         
					          <td><?php echo $servi->servicio_det?></td>
                    <td><a class="btn btn-warning" href="<?php echo "./editar_servicios.php?servicio_id=" . $servi->servicio_id?>">Editar 📝</a></td>
					          <td><a class="btn btn-danger"  href="<?php echo "./elim_servicios.php?servicio_id="   . $servi->servicio_id?>">Borrar 🗑️</a></td>
					</tr>
             <?php
			    } ?>
            </tbody>
        </table>
     </div>
     
         
  
<?php include("../../templates/footer.php"); ?>