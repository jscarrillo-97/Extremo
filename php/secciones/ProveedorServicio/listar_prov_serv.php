<?php include("../../templates/header.php"); ?>

</br>

<?php

include_once "../../conexion.php";
/*echo "Entro a Listar para saber si está entrando o no....";*/
$sentencia = $base_de_datos->query('SELECT p.proveedor_nom,s.servicio_nom,ps.estado_dispo,ps.valor_iva,ps.valor_iva,
FROM proveedor_servicio ps JOIN proveedor p on ps.nit_proveedor=p.proveedor_nit JOIN servicio s ON ps.id_servicio=s.servicio_id order by p.proveedor_nom');
$prov_serv = $sentencia->fetchAll(PDO::FETCH_OBJ);
 
?>
 

 
<div class="card"> 
    <div class="card-header"> 
            <a name="" id="" class="btn btn-primary" 
            href="forma_prov_serv.php" role="button">
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
                <th scope="col">Servicio</th>
                <th scope="col">Disponibilidad</th>
                <th scope="col">IVA</th>
                <th scope="col">Precio Proveedor</th>
                <th>Editar</th>
                <th>Borrar</
                </tr>
        </thead>

        <tbody>
            <?php foreach($prov_serv as $prserv)
					{
					?>
						  <tr class="text-center">
                <td><?php echo $prserv->proveedor_nom?></td>
                <td><?php echo $prserv->servicio_nom?></td>
                <td><?php IF  ($prserv->estado_dispo==false){$prserv->estado_dispo='No disponible';} ELSE {$prserv->estado_dispo='Disponible';} Echo $prserv->estado_dispo?></td>
                <td><?php echo $prserv->valor_iva?></td>
               
							  <td ><a class="btn btn-warning" href="<?php echo "./editar_prov_serv
                 .php?id_municipio=" . $prserv->nit_proveedor?>">Editar 📝</a></td>
							  <td><a class="btn btn-danger"  href="<?php echo "./elim__prov_serv.php?id_municipio="   . $prserv->nit_proveedor?>">Borrar 🗑️</a></td>
						  </tr>
          <?php
					} ?>
        </tbody>
        </table>
      </div>
    </div>
</div>     

<?php include("../../templates/footer.php"); ?>