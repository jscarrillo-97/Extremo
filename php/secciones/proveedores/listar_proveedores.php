<?php include("../../templates/header.php"); ?>

</br>

<?php

include_once "../../conexion.php";
/*echo "Entro a Listar para saber si está entrando o no....";*/
$sentencia = $base_de_datos->query('SELECT p.proveedor_nit,p.proveedor_rnt,m.municipio_nom,p.proveedor_nom,p.proveedor_dir,p.proveedor_mail,p.proveedor_tel   
FROM proveedor p JOIN municipio m on p.id_municipio=m.municipio_id WHERE p.ind_borrado=TRUE ORDER BY m.municipio_nom');
$proveedor = $sentencia->fetchAll(PDO::FETCH_OBJ);
 
?>

 
<div class="card"> 
    <div class="card-header"> 
            <a name="" id="" class="btn btn-primary" 
            href="forma_proveedores.php" role="button">
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
                <th scope="col">RNT</th>
                <th scope="col">Municipio</th>
                <th scope="col">Nombre</th>
                <th scope="col">Direccion</th>
                <th scope="col">E-mail</th>
                <th scope="col">Telefono</th>
                <th>Editar</th>
                <th>Borrar</th>
                </tr>
        </thead>

        <tbody>
            <?php foreach($proveedor as $prov)
					{
					?>
						  <tr class="text-center">
                <td><?php echo $prov->proveedor_nit?></td>
                <td><?php echo $prov->proveedor_rnt?></td>
                <td><?php echo $prov->municipio_nom?></td>
                <td><?php echo $prov->proveedor_nom?></td>
							  <td><?php echo $prov->proveedor_dir?></td>
                <td><?php echo $prov->proveedor_mail?></td>
							  <td><?php echo $prov->proveedor_tel?></td>   
							  <td><a class="btn btn-warning" href="<?php echo "./editar_proveedores.php?proveedor_nit=" . $prov->proveedor_nit?>">Editar 📝</a></td>
							  <td><a class="btn btn-danger"  href="<?php echo "./elim_proveedores.php?proveedor_nit="   . $prov->proveedor_nit?>">Borrar 🗑️</a></td>
						  </tr>
          <?php
					} ?>
        </tbody>
        </table>
      </div>
    </div>
</div>     

<?php include("../../templates/footer.php"); ?>