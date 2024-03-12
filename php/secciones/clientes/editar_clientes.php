<?php
 

if (!isset($_GET["cliente_id"]))
{
	echo "No existe el Usuario a editar";
	exit();
}
 
$cliente_id = $_GET["cliente_id"];
include_once "../../conexion.php";
$sentencia =  $base_de_datos->prepare("SELECT cliente_id,cliente_tpdoc,cliente_nom,cliente_ape,cliente_nac,cliente_mail,cliente_pass,cliente_tel,cliente_cto FROM cliente WHERE cliente_id = ?;");
$sentencia->execute([$cliente_id]);
$cliente = $sentencia->fetchObject();
if (!$cliente)
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
		<form action="update_clientes.php" method="POST" id="edit_cliente">
			 
			<div class="mb-3">
      	<label for="cliente_id" class="form-label">ID Cliente</label>
      		<input value="<?php echo $cliente->cliente_id ; ?>" readonly name="cliente_id" type="number" id="cliente_id" placeholder="ID Cliente"  maxlength="15" class="form-control">
    	</div>

			<div class="mb-3">
      		 <label for="cliente_mail" class="form-label">Email</label>
			   <input value="<?php echo $cliente->cliente_mail; ?>" required name="cliente_mail" type="email" id="cliente_mail"  placeholder="E-mail Cliente" class="form-control">	  
            </div>

			 <div class="mb-3">
      			<label for="cliente_pass" class="form-label">Contraseña</label>
      			<input  value="<?php echo $cliente->cliente_pass; ?>" required  name="cliente_pass" type="password" id="cliente_pass"  placeholder="Contraseña"   class="form-control">
 		     </div>

			  <div class="mb-3">
      			<label for="cliente_tel" class="form-label">Telefono</label>
      			<input value="<?php echo $cliente->cliente_tel; ?>" required  name="cliente_tel" type="number"   id="cliente_tel" placeholder="Telefono" pattern="[0-9]{10}" class="form-control">
       		 </div>

			  <div class="mb-3">
      			<label for="cliente_cto" class="form-label">Contacto</label>
      			<input value="<?php echo $cliente->cliente_cto; ?>" required name="cliente_cto" type="number" id="cliente_cto" placeholder="Contacto"  pattern="[0-9]{10}" class="form-control">
			 </div>
   		 

			
			<button type="submit" class="btn btn-success">Guardar</button>
			<a href="./listar_clientes.php" class="btn btn-warning">Volver</a>
		</form>
	</div>
</div>
<?php include_once "../../templates/footer.php"?>