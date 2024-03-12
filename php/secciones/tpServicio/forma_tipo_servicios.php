<?php include("../../templates/header.php"); ?>
<br/>

<div class="card">
    <div class="card-header">
    Tipo de Servicios
    </div>
    <div class="card-body">
        
 <form action="./insertar_tipo_servicios.php" method="post">



 
        <div class="mb-3">
          <label for="tpo_servicio_nom" >Nombre Tipo Servicio</label>
             <input  required  name="tpo_servicio_nom" type="text"
              id="tpo_servicio_nom " placeholder="Nombre Tipo de Servicio"  class="form-control">
        </div>

      
       <button type="submit" class="btn btn-success">Agregar Registo</button>
       <a name="" id="" class="btn btn-primary" href="index.php" role="button">Cancelar</a>


      

 </form>


 
         
</div>




<?php include("../../templates/footer.php"); ?>