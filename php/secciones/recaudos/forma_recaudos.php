<?php include("../../templates/header.php"); ?>
<br/>

<div class="card">
    <div class="card-header">
        Cuentas de proveedores
    </div>
    <div class="card-body">

<?php

include_once "../../conexion.php";
/*echo "Entro a Listar para saber si está entrando o no....";*/
$sentencia = $base_de_datos->query('SELECT cliente_id,cliente_tpdoc,cliente_nom,cliente_ape,cliente_nac,cliente_mail,cliente_pass,cliente_tel,cliente_cto  FROM cliente ORDER BY 1');
$cliente = $sentencia->fetchAll(PDO::FETCH_OBJ);
?>

<?php

include_once "../../conexion.php";
/*echo "Entro a Listar para saber si está entrando o no....";*/
$sentencia = $base_de_datos->query('SELECT banco_id,banco_nom  FROM banco ORDER BY 1');
$banco = $sentencia->fetchAll(PDO::FETCH_OBJ);
?>

        
 <form action="./insertar_recaudos.php" method="post">
      
        <div class="mb-3">
         <label for="id_cliente" class="form-label">Cliente</label>
      <select class="form-select form select-sm" name="id_cliente"  id="id_cliente"> 
        <?php foreach($cliente as $clien) { ?>	 
        <option value="<?php echo $clien->cliente_id?>"> 
        <?php echo $clien->cliente_nom?></option> 
       <?php } ?>
      </select>
    </div>

      <div class="mb-3">
       <label for="id_banco" class="form-label">Banco</label>
      <select class="form-select form select-sm" name="id_banco"  id="id_banco">
        <?php foreach($banco as $ban) { ?>	 
        <option value="<?php echo $ban->banco_id?>"> 
        <?php echo $ban->banco_nom?></option> 
       <?php } ?>
      </select>
    </div>

     <div class="mb-3">
        <label for="recaudo_fec_hora">Fecha</label>
          <input required name="recaudo_fec_hora" type="datetime-local"
          id="recaudo_fec_hora" placeholder="Fecha Pago" class="form-control"  >
      </div>
      
      <div class="mb-3">
       <label for="recaudo_val_total">Valor Total</label>
         <input required name="recaudo_val_total" type="number"
         id="recaudo_val_total" placeholder="Valor Total" class="form-control" >
     </div>

       <button type="submit" class="btn btn-success">Agregar Registo</button>

      <a name="" id="" class="btn btn-primary" href="index.php" role="button">Cancelar</a>




 </form>


 
         
</div>




<?php include("../../templates/footer.php"); ?>