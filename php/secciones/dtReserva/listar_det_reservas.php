<?php include("../../templates/header.php"); ?>

</br>

<?php

include_once "../../conexion.php";
/*echo "Entro a Listar para saber si está entrando o no....";*/
$sentencia = $base_de_datos->query('SELECT rs.reserva_id,s.servicio_nom, d.cant_serv,d.val_bruto,d.val_iva,d.val_total FROM detalle_reserva d JOIN reserva rs ON d.id_reserva = rs.reserva_id JOIN servicio s ON d.id_servicio = s.servicio_id ORDER BY rs.reserva_id');
$dt_reserva = $sentencia->fetchAll(PDO::FETCH_OBJ);

?>
<div class="card">
    <div class="card-header"> 
         <a name="" id="" class="btn btn-primary" 
         href="forma_detalle_reservas.php" role="button">
         Agregar Registro
        </a>
    </div>
    <div class="card-body">
    
     <div class="table-responsive-sm">
        <table class="table  table-sm table-cell-sm table-row-sm table-bordered table-hover" id="tabla_id">
            <thead class="table-dark thead-light">
                <tr>
                    <th>ID Reserva</th>
                    <th>Servicio</th>
				    <th>Cantidad</th>
					<th>Valor Bruto</th>
                    <th>Iva</th>
                    <th>Valor Total</th>
                    <th>Editar</th>
                    <th>Eliminar</th>						
                </tr>
            </thead>
            <tbody>
                    <?php foreach($dt_reserva as $dtreser)
					{           
					?>
					   <tr class="text-center">
                            <td><?php echo $dtreser->reserva_id?></td>
                            <td><?php echo $dtreser->servicio_nom?></td>
                            <td><?php echo $dtreser->cant_serv?></td>
                            <td><?php echo $dtreser->val_bruto?></td>
                            <td><?php echo $dtreser->val_iva?></td>
                            <td><?php echo $dtreser->val_total?></td>
							<td><a class="btn btn-warning" href="<?php echo "./editar_servicios.php?reserva_id=" . $dtreser->reserva_id?>">Editar 📝</a></td>
							<td><a class="btn btn-danger"  href="<?php echo "./elim_servicios.php?reserva_id="   . $dtreser->reserva_id?>">Borrar 🗑️</a></td>
						</tr>
                    <?php
				    } ?>
        </tbody>
        </table>
     </div>
     
         
  
<?php include("../../templates/footer.php"); ?>