<?php include("../../templates/header.php"); ?>

</br>
<div class="card">
    <div class="card-header">
       Parametros
    </div>
    <div class="card-body">
        

    <form action="./insertar_parametros.php" method="post">


    <div class="mb-3">
      <label for="empresa_nit">NIT</label>
      <input required name="empresa_nit" type="text"
       id="empresa_nit" placeholder="ID Cliente"  pattern="[0-9]{1,10}" maxlength="10"  class="form-control">
    </div>

    <div class="mb-3">
      <label for="empresa_nom" class="form-label">Nombre de empresa</label>
      <input required name="empresa_nom" type="text" 
       id="empresa_nom" placeholder="Nombre de empresa" pattern="[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ]{1,30}" maxlength="30" class="form-control">
    </div>

    <div class="mb-3">
      <label for="empresa_ciu" class="form-label">Ciudad</label>
      <input required name="empresa_ciu" type="text" 
        id="empresa_ciu"   placeholder="Ciudad"  pattern="[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ]{1,15}" class="form-control">
    </div>

    <div class="mb-3">
      <label for="porc_iva" class="form-label">Porcentaje de IVA</label>
      <input required name="porc_iva" type="number" 
        id="porc_iva"  placeholder="Porcentaje de IVA"   pattern="^([0-9](\.\d{1,2})?|1[0-8](\.\d{1,2})?|19(\.0{1,2})?)$"  class="form-control">
    </div>
 
    <div class="mb-3">
      <label for="num_fact" class="form-label">Número de factura</label>
      <input  required name="num_fact" type="text"  
      id="num_fact" placeholder="Número de factura" pattern="[0-9]+" maxlength="12"  class="form-control"  >
    </div>

    <div class="mb-3">
      <label for="primer_pago" class="form-label">Pago Inicial</label>
      <input required name="primer_pago" type="number" 
        id="primer_pago"  placeholder="Pago Inicial" class="form-control">
    </div>

    <div class="mb-3">
      <label for="admin_mail">Email</label>
      <input required name="admin_mail" type="email" 
       id="admin_mail"  placeholder="E-mail Admin" pattern="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$" class="form-control">
    </div>
    

    <div class="mb-3">
      <label for="admin_pass" >Contraseña</label>
      <input required  name="admin_pass" type="password"  
        id="admin_pass"  placeholder="Contraseña"   class="form-control">
    </div>
 
    
      <button type="submit" class="btn btn-success">Agregar Registo</button>
      <a name="" id="" class="btn btn-primary" href="index.php" role="button">Cancelar</a>

    </form>


   
        
    
</div>

<?php include("../../templates/footer.php"); ?>