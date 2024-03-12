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
$sentencia = $base_de_datos->query('SELECT municipio_id,municipio_nom,cod_postal  FROM municipio ORDER BY 1');
$municipios = $sentencia->fetchAll(PDO::FETCH_OBJ);
 
?>
 
        
 <form action="./insertar_proveedores.php" method="post">
      
 
       <div class="mb-3">
       <label for="proveedor_nit" class="form-label">NIT</label>
       <input type="number"
        class="form-control" name="proveedor_nit" id="proveedor_nit" placeholder="NIT del proveedor" required>
       </div>

       <div class="mb-3">
       <label for="proveedor_rnt" class="form-label">RNT</label>
       <input type="number"
        class="form-control" name="proveedor_rnt" id="proveedor_rnt" placeholder="RNT del proveedor" required>
       </div>

        <div class="mb-3">
         <label for="id_municipio" class="form-label">Municipio</label>
      <select class="form-select form select-sm" name="id_municipio"  id="id_municipio"> 
        <?php foreach($municipios as $muni) { ?>	 
        <option value="<?php echo $muni->municipio_id?>"> 
        <?php echo $muni->municipio_nom?></option> 
       <?php } ?>
      </select>
    </div>

   
       <div class="mb-3">
         <label for="proveedor_nom" class="form-label">Nombre del proveedor</label>
         <input type="text"
           class="form-control" name="proveedor_nom" id="proveedor_nom" placeholder="Nombre del proveedor" required>
       </div>

       <div class="mb-3">
         <label for="proveedor_dir" class="form-label">Dirección</label>
         <input type="text"
           class="form-control" name="proveedor_dir" id="proveedor_dir" placeholder="Dirección del proveedor" required>
       </div>

       <div class="mb-3">
         <label for="proveedor_mail" class="form-label">Correo electrónico</label>
         <input type="email"
           class="form-control" name="proveedor_mail" id="proveedor_mail" placeholder="Correo electrónico del proveedor"required>
       </div>
       
       <div class="mb-3">
         <label for="proveedor_tel" class="form-label">Teléfono</label>
         <input type="tel"
           class="form-control" name="proveedor_tel" id="proveedor_tel" placeholder="Teléfono del proveedor" required>
       </div>
 
      



       
       <button type="submit" class="btn btn-success">Agregar Registo</button>
       <a name="" id="" class="btn btn-primary" href="index.php" role="button">Cancelar</a>




 </form>


 
         
</div>




<?php include("../../templates/footer.php"); ?>