<?php include("../header.php"); ?>

</br>

<?php

include_once "../conexion.php";
/*echo "Entro a Listar para saber si está entrando o no....";*/
$sentencia = $base_de_datos->query('SELECT cliente_id,cliente_tpdoc,cliente_nom,cliente_ape,cliente_nac,cliente_mail,cliente_pass,cliente_tel,cliente_cto  FROM cliente  WHERE ind_borrado=TRUE ORDER BY 1');
$cliente = $sentencia->fetchAll(PDO::FETCH_OBJ);
?>

 
<div class="card"> 
    <div class="card-header"> 
            <a name="" id="" class="btn btn-primary" 
            href="forma_clientes.php" role="button">
            Agregar Registro
            </a>
    </div>
</div>

<div class="card ">
 
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-lg table-cell-sm table-row-sm table-bordered table-hover" id="tabla_id">
          <thead class="table-dark thead-light">
                <tr class="text-center">
                    <th>ID</th>
                    <th>Tipo</th>
					          <th>Nombres</th>
				            <th>Apellidos</th>
                    <th>Fecha nacimiento</th>
                    <th>Email</th>
                    <th>Telefono</th>
                    <th>Contacto</th>
                    <th>Editar</th>
                    <th>Borrar</th>						
                </tr>
        </thead>

        <tbody>
            <?php foreach($cliente as $clien)
					{
					?>
						  <tr class="text-center">
                <td><?php echo $clien->cliente_id ?></td>
                <td><?php echo $clien->cliente_tpdoc?></td>
						    <td><?php echo $clien->cliente_nom?></td>
						 	  <td><?php echo $clien->cliente_ape?></td>
                <td><?php echo $clien->cliente_nac?></td>
							  <td><?php echo $clien->cliente_mail?></td>
                <td><?php echo $clien->cliente_tel?></td>
                <td><?php echo $clien->cliente_cto?></td>
							  <td><a class="btn btn-warning" href="<?php echo "./editar_clientes.php?cliente_id=" . $clien->cliente_id?>">Editar 📝</a></td>
							  <td><a class="btn btn-danger"  href="<?php echo "./elim_clientes.php?cliente_id=" . $clien->cliente_id?>">Borrar 🗑️</a></td>
						  </tr>
          <?php
					} ?>
        </tbody>
        </table>
      </div>
    </div>
</div>     

<?php include("../footer.php"); ?>