<?php include_once("../../templates/header.php"); ?>

</br>

<?php

include_once "../../conexion.php";
/*echo "Entro a Listar para saber si está entrando o no....";*/
$sentencia = $base_de_datos->query('SELECT cliente_id,cliente_tpdoc,cliente_nom,cliente_ape,cliente_nac,cliente_mail,cliente_pass,cliente_tel,cliente_cto  FROM cliente ORDER BY 1');
$cliente = $sentencia->fetchAll(PDO::FETCH_OBJ);

?>

<div class="card">
    <div class="card-header">
       Datos de Reservas
    </div>
    <div class="card-body">
        

    <form action="./insertar_reservas.php" method="POST">
 
    
    <div class="mb-3">
      <label for="id_cliente" class="form-label">Cliente</label>
        <select class="form-select form select-sm" name="id_cliente"  id="id_cliente"> 
        <?php foreach($cliente as $clien) { ?>	 
       <option value="<?php echo $clien->cliente_id?>"> 
        <?php echo $clien->cliente_nom?>
       </option> 
       <?php } ?>
      </select>
    </div>

    <div class="mb-3">
      <label for="fecha_inicio">Fecha Inicio</label>
        <input required  name="fecha_inicio" type="datetime-local" id="fecha_inicio" placeholder="Fecha Inicio" 
        date-format="dd/mm/yyyy" class="form-control">
    </div>

    <div class="mb-3">
      <label for="fecha_fin">Fecha Fin</label>
        <input required  name="fecha_fin" type="datetime-local" id="fecha_fin" placeholder="Fecha Fin" 
        date-format="dd/mm/yyyy" class="form-control">
    </div>
 
    <div class="mb-3">
      <label for="reserva_val">Valor</label>
        <input required step="1000" name="reserva_val"  type="number" id="reserva_val"  placeholder="Valor"
        class="form-control">
    </div>

    <div class="mb-3">
      <label for="reserva_est">Estado Reserva</label>
        <select required name="reserva_est"     id="reserva_est" class="form-control" required>
          <option value="">Seleccione</option>
          <option value="1">Confirmada</option>
          <option value="2">Cancelada</option>
          <option value="3">Vencida</option>
        </select>
    </div>
 
     
    
      <button type="submit" class="btn btn-success">Agregar Registo</button>
      <a href="listar_clientes.php" class="btn btn-primary">Cancelar</a>
     

    </form>


   
        
    
</div>

<?php include("../../templates/footer.php"); ?>