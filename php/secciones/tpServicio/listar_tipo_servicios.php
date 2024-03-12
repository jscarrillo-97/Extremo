<?php include("../../templates/header.php"); ?>

</br>

<?php 

include_once "../../conexion.php";
$sentencia = $base_de_datos->query('SELECT tpo_servicio_id,tpo_servicio_nom  FROM tipo_servicio WHERE ind_borrado=TRUE ORDER BY 1');
$tpservicio = $sentencia->fetchAll(PDO::FETCH_OBJ);

?>


<div class="card">
    <div class="card-header"> 
        <a name="" id="" class="btn btn-primary" 
            href="forma_tipo_servicios.php" role="button">
        Agregar Registro
        </a>
    </div> 
</div>

<div class="card ">
    <div class="card-body">
      <div class="table-responsive-sm">
        <table class="table  table-sm table-bordered table-hover" id="tabla_id">
            <thead class="table-dark thead-light">
                <tr class="text-center">
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Editar</th>
                    <th>Eliminar</th>
                </tr>
            </thead>
            
          <tbody>
                <?php foreach($tpservicio as $tpservi)
				  	{
						?>
						  <tr class="text-center">
                <td><?php echo $tpservi->tpo_servicio_id ?></td>
                <td><?php echo $tpservi->tpo_servicio_nom?></td>
							  <td><a class="btn btn-warning" href="<?php echo "./editar_tipo_servicios.php?tpo_servicio_id=".$tpservi->tpo_servicio_id?>">Editar📝</a></td>
							  <td><a class="btn btn-danger"  href="<?php echo "./elim_tipo_servicios.php?tpo_servicio_id=". $tpservi->tpo_servicio_id?>">Eliminar🗑️</a></td>
						  </tr>
            <?php
					  } ?>
          </tbody>
        </table>
      </div>
    </div>
</div>

<?php include("../../templates/footer.php"); ?>

        