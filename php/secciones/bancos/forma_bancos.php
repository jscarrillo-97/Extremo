<?php include("../../templates/header.php"); ?>
<br/>

<div class="card">
    <div class="card-header">
        Cuentas de proveedores
    </div>
    <div class="card-body">
        
 <form action="./insertar_bancos.php" method="post">

 
       <div class="mb-3">
         <label for="banco_nom" class="form-label">Nombre de Banco</label>
         <input type="text"
           class="form-control" name="banco_nom" id="banco_nom" placeholder="Nombre Banco"    required>
       </div>
 

       <button type="submit" class="btn btn-success">Agregar Registo</button>
       <a name="" id="" class="btn btn-primary" href="index.php" role="button">Cancelar</a>




 </form>


 
         
</div>




<?php include("../../templates/footer.php"); ?>