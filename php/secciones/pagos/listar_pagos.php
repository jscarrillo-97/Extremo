 <?php include("../../templates/header.php"); ?>

</br>

<?php

include_once "../../conexion.php";
/*echo "Entro a Listar para saber si está entrando o no....";*/
$sentencia = $base_de_datos->query('SELECT p.pago_id,pr.proveedor_nom,b.banco_nom,p.pago_fec_hor,p.val_iva,p.val_neto,p.val_total  FROM pago p JOIN proveedor pr on p.nit_proveedor = pr.proveedor_nit JOIN banco b ON p.id_banco=b.banco_id order by pr.proveedor_nom');
$pago= $sentencia->fetchAll(PDO::FETCH_OBJ);
 
?>
 
<div class="card"> 
    <div class="card-header"> 
            <a name="" id="" class="btn btn-primary" 
            href="./forma_pagos.php" role="button">
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
                <th scope="col">Id</th>
                <th scope="col">Nombre</th>
                <th scope="col">Banco</th>
                <th scope="col">Fecha</th>
                <th scope="col">Iva</th>
                <th scope="col">Valor Neto</th>
                <th scope="col">Valor Total</th>
                <th>Editar</th>
                <th>Borrar</th>
                </tr>
        </thead>

        <tbody>
            <?php foreach($pago as $pag)
					{
					?>
						  <tr class="text-center">
                <td><?php echo $pag->pago_id?></td>
                <td><?php echo $pag->proveedor_nom?></td>
							  <td><?php echo $pag->banco_nom?></td>
                <td><?php echo $pag->pago_fec_hor?></td>
                <td><?php echo $pag->val_iva?></td>
							  <td><?php echo $pag->val_neto?></td>
                <td><?php echo $pag->val_total?></td>
							  <td><a class="btn btn-warning" href="<?php echo "./editar_pagos.php?pago_id=" . $pag->pago_id?>">Editar 📝</a></td>
							  <td><a class="btn btn-danger"  href="<?php echo "./elim_pagos.php?pago_id="   . $pag->pago_id?>">Borrar 🗑️</a></td>
						  </tr>
          <?php
					} ?>
        </tbody>
        </table>
      </div>
    </div>
</div>     

<?php include("../../templates/footer.php"); ?>