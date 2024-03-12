<?php
 

if (!isset($_GET["empresa_nit"]))
{
	echo "No existe el Usuario a editar";
	exit();
}
 
$empresa_nit = $_GET["empresa_nit"];
include_once "../../conexion.php";
$sentencia =  $base_de_datos->prepare("SELECT empresa_nit,empresa_nom,empresa_ciu,porc_iva,num_fact,primer_pago,admin_mail,admin_pass FROM parametros WHERE empresa_nit = ?;");
$sentencia->execute([$empresa_nit]);
$parametros = $sentencia->fetchObject();
if (!$parametros)
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
		<form action="update_parametros.php" method="POST">
		
		<div class="mb-3">
      <label for="empresa_nit">NIT</label>
      <input value="<?php echo $parametros->empresa_nit; ?>" readonly name="empresa_nit" type="text"
       id="empresa_nit" placeholder="ID Cliente"  pattern="[0-9]{1,10}" maxlength="10"  class="form-control">
    </div>

		  <div class="mb-3">
      		<label for="empresa_nom" class="form-label">Nombre de empresa</label>
       <input value="<?php echo $parametros->empresa_nom; ?>"required name="empresa_nom" type="text" 
       id="empresa_nom" placeholder="Nombre de empresa" pattern="[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ]{1,30}" maxlength="30" class="form-control">
    </div>


	 	<div class="mb-3">
          <label for="empresa_ciu" class="form-label">Ciudad</label>
            <input value="<?php echo $parametros->empresa_ciu ; ?>" required name="empresa_ciu" type="text" 
        	id="empresa_ciu"   placeholder="Ciudad" pattern="[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ]{1,15}" class="form-control">
        </div>

		 <div class="mb-3">
      <label for="porc_iva" class="form-label">Porcentaje de IVA</label>
      <input value="<?php echo $parametros->porc_iva; ?>" required name="porc_iva" type="number" 
        id="porc_iva"  placeholder="Porcentaje de IVA" class="form-control">
    </div>

	<div class="mb-3">
      <label for="num_fact" class="form-label">Número de factura</label>
     <input value="<?php echo $parametros->num_fact ; ?>" required name="num_fact" type="text"  
      id="num_fact" placeholder="Número de factura" pattern="[0-9]+" maxlength="12"  class="form-control"  >
    </div>

    <div class="mb-3">
      <label for="primer_pago">Pago Inicial</label>
      <input  value="<?php echo $parametros->primer_pago ; ?>" required name="primer_pago" type="number" 
       id="primer_pago"  placeholder="Pago Inicial"   class="form-control">
    </div>
    
    
	<div class="mb-3">
      <label for="admin_mail">Email</label>
      <input  value="<?php echo $parametros->admin_mail ; ?>" required name="admin_mail" type="email" 
       id="admin_mail"  placeholder="E-mail Admin" pattern="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$" class="form-control">
    </div>
     
     
    <div class="mb-3">
      <label for="admin_pass" >Contraseña</label>
      <input  value="<?php echo $parametros->admin_pass ; ?>"  required  name="admin_pass" type="password"  
        id="admin_pass"  placeholder="Contraseña"   class="form-control">
    </div>
			
			<button type="submit" class="btn btn-success">Guardar</button>
			<a href="./listar_parametros.php" class="btn btn-warning">Volver</a>
		</form>
	</div>
</div>
<?php include_once "../../templates/footer.php"?>