<?php include("../../templates/header.php"); ?>

</br>

<?php

include_once "../../conexion.php";
/*echo "Entro a Listar para saber si está entrando o no....";*/
$sentencia = $base_de_datos->query('SELECT contacto_id,contacto_nom,contacto_tel,contacto_mail,contacto_msg  FROM contacto ORDER BY 1');
$contacto = $sentencia->fetchAll(PDO::FETCH_OBJ);
?>

 
<div class="card ">
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-lg table-cell-sm table-row-sm table-bordered table-hover" id="tabla_id">
          <thead class="table-dark thead-light">
                <tr class="text-center">
                    <th>ID</th>
                    <th>Nombre</th>
				            <th>Telefono</th>
				            <th>Email</th>
                    <th>Mensaje</th>
                    <th>Borrar</th>						
                </tr>
        </thead>

        <tbody>
            <?php foreach($contacto as $con)
					{
					?>
				      <tr class="text-center">
                  <td><?php echo $con->contacto_id?></td>
                  <td><?php echo $con->contacto_nom?></td>
					        <td><?php echo $con->contacto_tel?></td>
						      <td><?php echo $con->contacto_mail?></td>
                  <td><?php echo $con->contacto_msg?></td>
					    <td><a class="btn btn-danger"  href="<?php echo "./elim_contactos.php?contacto_id=" . $con->contacto_id?>">Borrar 🗑️</a></td>
					   </tr>
          <?php
					} ?>
        </tbody>
        </table>
      </div>
    </div>
</div>     

<?php include("../../templates/footer.php"); ?>