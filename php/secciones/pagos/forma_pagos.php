 <?php include "../../templates/header.php"; ?>

</br>

    <div class="card">
      <div class="card-header">
       Datos de Servicios
      </div>
    <div class="card-body">
    
    <?php
    
    include_once "../../conexion.php";
      /*echo "Entro a Listar para saber si está entrando o no....";*/
      $sentencia = $base_de_datos->query('SELECT proveedor_nit,proveedor_rnt,id_municipio,proveedor_nom,proveedor_dir,proveedor_mail,proveedor_tel   FROM proveedor ORDER BY 1');
      $proveedor = $sentencia->fetchAll(PDO::FETCH_OBJ);

    ?>

    <?php

include_once "../../conexion.php";
     /*echo "Entro a Listar para saber si está entrando o no....";*/
     $sentencia = $base_de_datos->query('SELECT banco_id,banco_nom  FROM banco ORDER BY 1');
     $banco = $sentencia->fetchAll(PDO::FETCH_OBJ);

    ?>
    
    
    <form action="./insertar_pagos.php" method="POST" id="form">

     <div class="mb-3">
       <label for="nit_proveedor">Proveedor</label>
        <select class="form-select form select-sm" name="nit_proveedor" id="nit_proveedor">
          <?php foreach ($proveedor as $prov) { ?>	 
            <option value="<?php echo $prov->proveedor_nit;?>"> 
          <?php echo $prov->proveedor_nom; ?></option> 
          <?php } ?>
      </select>

       </div>
      <div class="mb-3">
       <label for="id_banco">Banco</label>
        <select class="form-select form select-sm" name="id_banco" id="id_banco">
          <?php foreach ($banco as $ban) { ?>	 
          <option value="<?php echo $ban->banco_id; ?>"> 
          <?php echo $ban->banco_nom; ?></option> 
          <?php } ?>
        </select>
      </div>

      <div class="mb-3">
        <label for="pago_fec_hor">Fecha</label>
          <input required name="pago_fec_hor" type="datetime-local"
          id="pago_fec_hor" placeholder="Fecha Pago" min="2024-01-01T00:00" max="2025-01-01T00:00" class="form-control"  >
      </div>

       
      <div class="mb-3">
        <label for="val_iva">Valor Iva</label>
          <input required name="val_iva" type="text"
          id="val_iva" placeholder="Valor Iva"   pattern="\d+(\.\d{1,2})?" maxlength="2" class="form-control" >
      </div>

     <div class="mb-3">
        <label for="val_neto">Valor Neto</label>
         <input required name="val_neto" type="number"
         id="val_neto" placeholder="Valor Neto" pattern="[0-9]+" class="form-control" >
     </div>

     <div class="mb-3">
       <label for="val_total">Valor Total</label>
         <input required name="val_total" type="number" 
         id="val_total" placeholder="Valor Total" pattern="[0-9]+" class="form-control" >
     </div>

     <div class="mb-3">
       <label for="cta_pgo">Cuenta de Pago</label>
         <input  required name="cta_pgo" type="text"
         id="cta_pgo" placeholder="Cuenta" pattern="[0-9]{10,12}" maxlength="12" class="form-control" >
     </div>
       
      <button type="submit" class="btn btn-success">Agregar Registo</button>

      <a name="" id="" class="btn btn-primary" href="listar_pagos.php" role="button">Cancelar</a>  
    
    </form>
 

   

   
        
    
</div>

<?php include "../../templates/footer.php"; ?>
