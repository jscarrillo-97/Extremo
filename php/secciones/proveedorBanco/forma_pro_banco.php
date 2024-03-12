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
      $sentencia = $base_de_datos->query('SELECT proveedor_nit,proveedor_rnt,id_municipio,proveedor_nom,proveedor_dir,proveedor_mail,proveedor_tel   FROM proveedor ORDER BY 1');
      $proveedor = $sentencia->fetchAll(PDO::FETCH_OBJ);

    ?>

    <?php

include_once "../../conexion.php";
     /*echo "Entro a Listar para saber si está entrando o no....";*/
     $sentencia = $base_de_datos->query('SELECT banco_id,banco_nom  FROM banco ORDER BY 1');
     $banco = $sentencia->fetchAll(PDO::FETCH_OBJ);

    ?>
        
 <form action="./insertar_pro_banco.php" method="post">
      
 
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
       <label for="num_cuenta">Cuenta de Pago</label>
         <input  required name="num_cuenta" type="text"
         id="num_cuenta" placeholder="Cuenta"  pattern="[0-9]{10,12}" maxlength="12" class="form-control" >
     </div>
      
      <div class="mb-3">
        <label for="ind_cta_aho">Disponibilidad</label>
          <select class="form-control" id="ind_cta_aho" name="ind_cta_aho">
            <option value="1">Ahorros</option>
            <option option value="0">Corriente</option>
         </select>
    </div>
   
       
       <button type="submit" class="btn btn-success">Agregar Registo</button>
       <a name="" id="" class="btn btn-primary" href="index.php" role="button">Cancelar</a>




 </form>


 
         
</div>




<?php include("../../templates/footer.php"); ?>