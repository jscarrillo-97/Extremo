<?php
 

if (!isset($_GET["pago_id"]))
{
	echo "No existe el Usuario a editar";
	exit();
}
 
$pago_id = $_GET["pago_id"];
include_once "../../conexion.php";
$sentencia =  $base_de_datos->prepare("SELECT pago_id,pago_fec_hor,val_iva,val_neto,val_total,cta_pgo FROM pago WHERE pago_id = ?;");
$sentencia->execute([$pago_id]);
$pago = $sentencia->fetchObject();
if (!$pago)
{
    #No existe
    echo "¡No existe algún Usuario con ese ID!";
    exit();
}

#Si el usuario existe, se ejecuta esta parte del código
?>
<?php include_once "../../templates/header.php"?>
<div class="row">
	<div class="col-12">
		<h1>Editar</h1>
		<form action="update_pagos.php" method="POST">
			 
			<div class="mb-3">
      	<label for="pago_id" class="form-label">ID Pago</label>
      		<input value="<?php echo $pago->pago_id ; ?>" readonly name="pago_id" type="number" id="pago_id" placeholder="ID Cliente"  maxlength="15" class="form-control">
    	</div>

        <div class="mb-3">
        <label for="pago_fec_hor">Fecha</label>
          <input value="<?php echo $pago->pago_fec_hor; ?>" required name="pago_fec_hor" type="datetime-local"
          id="pago_fec_hor" placeholder="Fecha Pago" min="2024-01-01T00:00" max="2025-01-01T00:00" class="form-control"  >
      </div>

      <div class="mb-3">
        <label for="val_iva">Valor Iva</label>
          <input value="<?php echo $pago->val_iva; ?>" required name="val_iva" type="text"
          id="val_iva" placeholder="Valor Iva"  pattern="\d+(\.\d{1,2})?" maxlength="2" class="form-control" >
      </div>
      
      <div class="mb-3">
        <label for="val_neto">Valor Neto</label>
        <input value="<?php echo $pago->val_neto; ?>" required name="val_neto" type="number"
         id="val_neto" placeholder="Valor Neto" pattern="[0-9]+" class="form-control" >
     </div>

     <div class="mb-3">
       <label for="val_total">Valor Total</label>
        <input value="<?php echo $pago->val_total; ?>" required name="val_total" type="number" 
         id="val_total" placeholder="Valor Total" pattern="[0-9]+" class="form-control" >
     </div>
		
     <div class="mb-3">
       <label for="cta_pgo">Cuenta de Pago</label>
         <input value="<?php echo $pago->cta_pgo; ?>" required name="cta_pgo" type="text"
         id="cta_pgo" placeholder="Cuenta" pattern="[0-9]{10,12}" maxlength="12" class="form-control" >
     </div>
			
			<button type="submit" class="btn btn-success">Guardar</button>
			<a href="./listar_pagos.php" class="btn btn-warning">Volver</a>
		</form>
	</div>
</div>
<?php include_once "../../templates/footer.php"?>