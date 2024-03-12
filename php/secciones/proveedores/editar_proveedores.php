<?php
 

if (!isset($_GET["proveedor_nit"]))
{
	echo "No existe el Usuario a editar";
	exit();
}
 
$proveedor_nit = $_GET["proveedor_nit"];
include_once "../../conexion.php";
$sentencia =  $base_de_datos->prepare("SELECT proveedor_nit,proveedor_rnt,id_municipio,proveedor_nom,proveedor_dir,proveedor_mail,proveedor_tel  FROM proveedor WHERE proveedor_nit = ?;");
$sentencia->execute([$proveedor_nit]);
$proveedor = $sentencia->fetchObject();
if (!$proveedor)
{
    #No existe
    echo "¡No existe algún Usuario con ese ID!";
    exit();
}
#Si el usuario existe, se ejecuta esta parte del código
?>
<?php 

include_once "../../conexion.php";
$sentencia = $base_de_datos->query('SELECT municipio_id,municipio_nom,cod_postal  FROM municipio  WHERE ind_borrado=TRUE ORDER BY 1');
$municipios = $sentencia->fetchAll(PDO::FETCH_OBJ);

?> 

 
 
<?php include_once "../../templates/header.php"?>
<div class="row">
	<div class="col-12">
		<h1>Editar</h1>
		<form action="update_proveedores.php" method="POST">
			 
 
   <div class="mb-3">
       <label for="proveedor_nit" class="form-label">NIT</label>
       <input value="<?php echo $proveedor->proveedor_nit ; ?>" readonly name="proveedor_nit" type="number" id="proveedor_nit" placeholder="ID proveedor"  maxlength="15" class="form-control">
       </div>
      
       <div class="mb-3">
         <label for="id_municipio" class="form-label">Municipio</label>
      <select class="form-select form select-sm" name="id_municipio"  id="id_municipio"> 
        <?php foreach($municipios as $muni) { ?>	 
        <option value="<?php echo $muni->municipio_id?>" <?php echo $select =($proveedor->id_municipio == $muni->municipio_id)? 'selected':''; ?>> 
        <?php echo $muni->municipio_nom?></option> 
       <?php } ?>
      </select>
    </div>	 
 
   <div class="mb-3">
      			<label for="proveedor_nom" class="form-label">Nombre</label>
      			<input value="<?php echo $proveedor->proveedor_nom; ?>" required name="proveedor_nom" type="text" id="proveedor_nom" placeholder="Nombre"  class="form-control">
			 </div>   

       <div class="mb-3">
         <label for="proveedor_dir" class="form-label">Dirección</label>
         <input value="<?php echo $proveedor->proveedor_nom; ?>" required name="proveedor_dir" type="text" id="proveedor_dir" placeholder="Direccion"  class="form-control">
       </div>

       <div class="mb-3">
         <label for="proveedor_mail" class="form-label">Correo electrónico</label>
         <input value="<?php echo $proveedor->proveedor_mail; ?>" required name="proveedor_mail" type="email" id="proveedor_mail" placeholder="Direccion"  class="form-control"> 
       </div>
       
       <div class="mb-3">
         <label for="proveedor_tel" class="form-label">Teléfono</label>
         <input value="<?php echo $proveedor->proveedor_tel;?>" required name="proveedor_tel" type="tel" id="proveedor_tel" placeholder="Direccion"  class="form-control"> 
       </div>
 
      
			<button type="submit" class="btn btn-success">Guardar</button>
			<a href="./listar_proveedors.php" class="btn btn-warning">Volver</a>
		</form>
	</div>
</div>
<?php include_once "../../templates/footer.php"?>