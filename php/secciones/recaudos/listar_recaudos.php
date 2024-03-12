<?php include("../../templates/header.php"); ?>

</br>

<?php

include_once "../../conexion.php";
/*echo "Entro a Listar para saber si está entrando o no....";*/
$sentencia = $base_de_datos->query('SELECT  a.abono_id,cl.cliente_id, b.banco_nom, a.abono_monto, a.abono_fecha FROM abono a JOIN cliente cl ON a.id_cliente = cl.cliente_id JOIN banco b ON a.id_banco=b.banco_id ORDER BY a.abono_id');
$recaudo = $sentencia->fetchAll(PDO::FETCH_OBJ);

?>                                          
 

    <div class="card">
      <div class="card-header"> 
        <a name="" id="" class="btn btn-primary" 
         href="forma_recaudos.php" role="button">
         Agregar Registro
        </a>
      </div>
    <div class="card-body">
    
     <div class="table-responsive-sm">
       <table class="table  table-sm table-cell-sm table-row-sm table-bordered table-hover" id="tabla_id">
         <thead class="table-dark thead-light">
           <tr>
             <th>ID Recaudo</th>
             <th>Cliente</th>
				     <th>Banco</th>
					   <th>Fecha Hora</th>
             <th>Valor Total</th>
             <th>Editar</th>
             <th>Eliminar</th>						
            </tr>
          </thead>

          <tbody>
            <?php foreach($recaudo as $recau)
              {  ?>
				            <tr class="text-center">
                      <td><?php echo $recau->recaudo_id?></td>
                      <td><?php echo $recau->cliente_id?></td>
                      <td><?php echo $recau->banco_nom?></td>
                      <td><?php echo $recau->recaudo_fec_hora?></td>
				              <td><?php echo $recau->recaudo_val_total?></td>
				              <td><a class="btn btn-warning" href="<?php echo "./editar_recaudo.php?recaudo_id=" . $recau->recaudo_id?>">Editar 📝</a></td>
				              <td><a class="btn btn-danger"  href="<?php echo "./elim_recaudo.php?recaudo_id="   . $recau->recaudo_id?>">Borrar 🗑️</a></td>
				            </tr>
            <?php
			           }  ?>
           </tbody>
     </div>

<?php include("../../templates/footer.php"); ?>