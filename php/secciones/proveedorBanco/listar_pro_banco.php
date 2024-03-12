<?php include("../../templates/header.php"); ?>

</br>

<?php

include_once "../../conexion.php";
/*echo "Entro a Listar para saber si está entrando o no....";*/
$sentencia = $base_de_datos->query('SELECT p.proveedor_nom,b.banco_nom,pb.num_cuenta,pb.ind_cta_aho    
FROM proveedor_banco pb JOIN proveedor p on pb.nit_proveedor=p.proveedor_nit JOIN banco b ON pb.id_banco=b.banco_id order by p.proveedor_nom');
$prov_banco = $sentencia->fetchAll(PDO::FETCH_OBJ);
 
?>

  
<div class="card"> 
    <div class="card-header"> 
            <a name="" id="" class="btn btn-primary" 
            href="forma_pro_banco.php" role="button">
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
                <th scope="col">NIT</th>
                <th scope="col">Banco</th>
                <th scope="col">Numero Cuenta</th>
                <th scope="col">Indicador Cuenta</th>
                <th>Editar</th>
                <th>Borrar</th>
                </tr>
        </thead>

        <tbody>
            <?php foreach($prov_banco as $provban)
					{
					?>
						  <tr class="text-center">
                            <td><?php echo $provban->proveedor_nom?></td>
                            <td><?php echo $provban->banco_nom?></td>
                            <td><?php echo $provban->num_cuenta?></td>
                            <td><?php IF  ($provban->ind_cta_aho==false){$provban->ind_cta_aho='Corriente';} ELSE {$provban->ind_cta_aho='Ahorros';} Echo $provban->ind_cta_aho?></td>

                            <td ><a class="btn btn-warning" href="<?php echo "./editar_pro_banco.php.php?nit_proveedor =" . $provban->nit_proveedor?>">Editar 📝</a></td>
                            
							              <td><a class="btn btn-danger"  href="<?php echo " "   . $provban->nit_proveedor?>">Borrar 🗑️</a></td>
						  </tr>
          <?php
					} ?>
        </tbody>
        </table>
      </div>
    </div>
</div>     

<?php include("../../templates/footer.php"); ?>