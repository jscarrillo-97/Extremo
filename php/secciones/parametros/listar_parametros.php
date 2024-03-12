<?php include("../../templates/header.php"); ?>

</br>

<?php

include_once "../../conexion.php";
/*echo "Entro a Listar para saber si está entrando o no....";*/
$sentencia = $base_de_datos->query('SELECT empresa_nit,empresa_nom,empresa_ciu,porc_iva,num_fact,primer_pago,primer_pago,admin_mail  FROM parametros ORDER BY 1');
$parametros = $sentencia->fetchAll(PDO::FETCH_OBJ);
?>

 
<div class="card"> 
    <div class="card-header"> 
            <a name="" id="" class="btn btn-primary" 
            href="forma_parametros.php" role="button">
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
                    <th>NIT</th>
			              <th>Nombre</th>
			              <th>Ciudad</th>
                    <th>Iva</th>
                    <th>Facturacion</th>
                    <th>Pago Inicial</th>
                    <th>Email</th>
                    <th>Editar</th>
                    <th>Borrar</th>						
                </tr>
        </thead>

        <tbody>
            <?php foreach($parametros  as $para)
					{
					?>
			        <tr class="text-center">
                <td><?php echo $para->empresa_nit?></td>
                <td><?php echo $para->empresa_nom?></td>
				        <td><?php echo $para->empresa_ciu?></td>
				        <td><?php echo $para->porc_iva?></td>
				        <td><?php echo $para->num_fact?></td>
                <td><?php echo $para->primer_pago?></td>
				        <td><?php echo $para->admin_mail?></td>
			          <td><a class="btn btn-warning" href="<?php echo "./editar_parametros.php?empresa_nit=" . $para->empresa_nit?>">Editar 📝</a></td>
		            <td><a class="btn btn-danger" href="<?php echo "./elim_clientes.php?cliente_id="  . $para->empresa_nit?>">Borrar 🗑️</a></td>
			        </tr>
          <?php
					} ?>
        </tbody>
        </table>
      </div>
    </div>
</div>     

<?php include("../../templates/footer.php"); ?>