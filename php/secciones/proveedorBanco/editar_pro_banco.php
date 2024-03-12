<?php
 

if (!isset($_GET["nit_proveedor"]))
{
	echo "No existe el Usuario a editar";
	exit();
}
 
$nit_proveedor = $_GET["nit_proveedor"];
include_once "../../conexion.php";
$sentencia = $base_de_datos->prepare("SELECT pb.nit_proveedor, b.banco_nom, pb.num_cuenta, pb.ind_cta_aho
FROM proveedor_banco pb 
JOIN proveedor p ON pb.nit_proveedor = p.proveedor_nit 
JOIN banco b ON pb.id_banco = b.banco_id 
ORDER BY p.proveedor_nom");
$sentencia->execute([$servicio_id]);
$prov_ban = $sentencia->fetchObject();
if (!$prov_ban)
{
    #No existe
    echo "¡No existe algún Usuario con ese ID!";
    exit();
}

#Si el usuario existe, se ejecuta esta parte del código
?>

<?php

include_once "../../conexion.php";
  /*echo "Entro a Listar para saber si está entrando o no....";*/
  $sentencia = $base_de_datos->query('SELECT banco_id,banco_nom FROM banco  WHERE ind_borrado=TRUE ORDER BY 1');
  $banco = $sentencia->fetchAll(PDO::FETCH_OBJ);
?>
       
<?php include_once "../../templates/header.php"?>
<div class="row">
	<div class="col-12">
		<h1>Editar</h1>
		<form action="./update_pro_banco.php" method="POST">
 
  
     </div>
      <div class="mb-3">
       <label for="id_banco">Banco</label>
        <select class="form-select form select-sm" name="id_banco" id="id_banco">
          <?php foreach ($banco as $ban) { ?>	 
          <option value="<?php echo $ban->banco_id; ?>"<?php echo $select =($prov_ban->pb.nit_proveedor == $ban->banco_id)? 'selected':''; ?>>> 
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
        <label for="ind_cta_aho">Indicador Banco</label>
          <select class="form-control" id="ind_cta_aho" name="ind_cta_aho">
            <option value="1">Ahorros</option>
            <option option value="0">Corriente</option>
         </select>
    </div>

			
			<button type="submit" class="btn btn-success">Guardar</button>
			<a href="./listar_servicios.php" class="btn btn-warning">Volver</a>
		</form>
	</div>
</div>
<?php include_once "../../templates/footer.php"?>