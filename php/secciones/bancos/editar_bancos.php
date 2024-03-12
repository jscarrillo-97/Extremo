<?php
 

if (!isset($_GET["banco_id"]))
{
	echo "No existe el Usuario a editar";
	exit();
}
 
$banco_id = $_GET["banco_id"];
include_once "../../conexion.php";
$sentencia =  $base_de_datos->prepare("SELECT banco_id,banco_nom  FROM banco WHERE banco_id = ?;");
$sentencia->execute([$banco_id]);
$banco = $sentencia->fetchObject();
if (!$banco)
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
		<form action="update_bancos.php" method="POST">
			 
			<div class="mb-3">
      	<label for="banco_id" class="form-label">ID Banco</label>
      		<input value="<?php echo $banco->banco_id ; ?>" readonly name="banco_id" type="number" id="banco_id" placeholder="ID Cliente"  maxlength="15" class="form-control">
    	</div>

			 
       <div class="mb-3">
         <label for="banco_nom">Nombre de Banco</label>
          <input value="<?php echo $banco->banco_nom; ?>"  
           required  name="banco_nom" type="text" id="banco_nom" placeholder="Nombre Banco"   
           class="form-control">
       </div>
 
			<button type="submit" class="btn btn-success">Guardar</button>
			<a href="./listar_clientes.php" class="btn btn-warning">Volver</a>
		</form>
	</div>
</div>
<?php include_once "../../templates/footer.php"?>