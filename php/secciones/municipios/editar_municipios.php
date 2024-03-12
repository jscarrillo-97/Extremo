<?php
 

if (!isset($_GET["municipio_id"]))
{
	echo "No existe el Usuario a editar";
	exit();
}
 
$municipio_id = $_GET["municipio_id"];
include_once "../../conexion.php";
$sentencia = $base_de_datos->prepare("SELECT municipio_id,municipio_nom,cod_postal FROM municipio WHERE municipio_id = ?;");
$sentencia->execute([$municipio_id]);
$municipio = $sentencia->fetchObject();
if (!$municipio)
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
		<form action="update_municipios.php" method="POST">
			 
			<div class="mb-3">
      	<label for="municipio_id" class="form-label">ID Municipio </label>
      		<input value="<?php echo $municipio->municipio_id; ?>" readonly name="municipio_id" type="number" id="municipio_id" placeholder="ID Municipio "   class="form-control">
    	</div>

        <div class="mb-3">
      <label for="municipio_nom">Nombre de municipio</label>
      <input value="<?php echo $municipio->municipio_nom; ?>" required name="municipio_nom" type="text"
       id="municipio_nom" placeholder="Nombre de municipio" class="form-control">
    </div>
 
    <div class="mb-3">
      <label for="cod_postal">Código postal</label>
      <input value="<?php echo $municipio->cod_postal; ?>"  required name="cod_postal" type="number"
       id="cod_postal" placeholder="Código postal" class="form-control">
    </div>

   		 

			
			<button type="submit" class="btn btn-success">Guardar</button>
			<a href="./listar_municipios.php" class="btn btn-warning">Volver</a>
		</form>
	</div>
</div>
<?php include_once "../../templates/footer.php"?>