<?php include("../../templates/header.php"); ?>
 
</br>

<div class="card">
    <div class="card-header">
       Datos de clientes
    </div>
    <div class="card-body">
        

    <form action="./insertar_municipios.php" method="POST" id="form">

     
 
    
    <div class="mb-3">
      <label for="municipio_nom">Nombre de municipio</label>
      <input required name="municipio_nom" type="text"
       id="municipio_nom" placeholder="Nombre de municipio" pattern="^[a-zA-Z0-9\s]+$" maxlength="30" class="form-control">
    </div>

    <div class="mb-3">
      <label for="cod_postal">Código postal</label>
      <input required name="cod_postal" type="text"
       id="cod_postal" placeholder="Código postal"pattern="[0-9]{6}" maxlength="6" class="form-control">
    </div>

    
    
      <button type="submit" class="btn btn-success">Agregar Registo</button>
      <a name="" id="" class="btn btn-primary" href="index.php" role="button">Cancelar</a>

    </form>


   
        
    
</div>

<?php include("../../templates/footer.php"); ?>