<?php include("../../templates/header.php"); ?>

</br>

<?php
  
include_once "../../conexion.php";
/*echo "Entro a Listar para saber si está entrando o no....";*/
$sentencia = $base_de_datos->query('SELECT r.reserva_id,c.cliente_id,r.fec_fact,r.fecha_inicio,r.fecha_fin ,r.reserva_val,r.reserva_est  FROM reserva r JOIN cliente c  ON r.id_cliente = c.cliente_id ORDER BY r.reserva_id');
$reserva = $sentencia->fetchAll(PDO::FETCH_OBJ);

 
?>
<div class="card">
    <div class="card-header"> 
         <a name="" id="" class="btn btn-primary" 
         href="forma_reservas.php" role="button">
         Agregar Registro
        </a>
    </div>
    <div class="card-body">
    
     <div class="table-responsive-sm">
        <table class="table  table-sm table-cell-sm table-row-sm table-bordered table-hover" id="tabla_id">
            <thead class="table-dark thead-light">
                <tr>
                    <th>Reserva</th>
                    <th>Cliente</th>
                    <th>Fecha Factura</th>
                    <th>Fecha Inicio</th>
                    <th>Fecha Fin</th>
                    <th>Valor</th>
                    <th>Estado</th>
                    <th>Editar</th>
                    <th>Eliminar</th>						
                </tr>
            </thead>
            <tbody>
                    <?php foreach($reserva as $reser)
					{           
					?>
					   <tr class="text-center">
                            <td><?php echo $reser->reserva_id?></td>
                            <td><?php echo $reser->cliente_id?></td>
                            <td><?php echo $reser->fec_fact?></td>
                            <td><?php echo $reser->fecha_inicio?></td>
                            <td><?php echo $reser->fecha_fin?></td>
					        <td><?php echo $reser->reserva_val?></td>
                            <td><?php echo $reser->reserva_est?></td>
							<td><a class="btn btn-warning" href="<?php echo "./editar_reserva.php?reserva_id=" . $reser->reserva_id?>">Editar 📝</a></td>
							<td><a class="btn btn-danger"  href="<?php echo "./elim_reserva.php?reserva_id="   . $reser->reserva_id?>">Borrar 🗑️</a></td>
						</tr>
                    <?php
				    } ?>
        </tbody>
        </table>
     </div>
     
         
  
<?php include("../../templates/footer.php"); ?>