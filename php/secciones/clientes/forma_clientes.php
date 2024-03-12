<?php include "../../templates/header.php"; ?>
 
 </br>
 
 <div class="card">
     <div class="card-header">
        Datos de clientes
     </div>
     <div class="card-body">
         
 
     <form action="./insertar_clientes.php" method="POST"     id="form_cliente">
 
      
  
     <div class="mb-3 formulario__grupo" id="grupo__cliente_id">
     <label for="cliente_id">ID Cliente</label>
     <input required name="cliente_id" type="text" id="cliente_id" placeholder="ID Cliente" pattern="[0-9]{8,15}" minlength="8" maxlength="15" class="form-control">
     </div>
 
     <div class="mb-3">
     <label for="cliente_tpdoc">Tipo de documento</label>
       <select required class="form-control" name="cliente_tpdoc" id="cliente_tpdoc">
         <option value="">Seleccione</option>
         <option value="CC">CC</option>
         <option value="CE">CE</option>  
         <option value="Pasaporte">Pasaporte</option>
       </select>
     </div>
 
     <div class="mb-3">
       <label for="cliente_nom">Nombres</label>
       <input required name="cliente_nom" type="text"
         id="cliente_nom" placeholder="Nombres Cliente" pattern="^[a-zA-Z0-9\s]+$" maxlength="30" class="form-control">
     </div>
 
     <div class="mb-3">
       <label for="cliente_ape">Apellidos</label>
       <input required name="cliente_ape" type="text"
         id="cliente_ape" placeholder="Apellidos Cliente" pattern="^[a-zA-Z0-9\s]+$" maxlength="30" class="form-control"    >
     </div>
 
     <div class="mb-3">
       <label for="cliente_nac">Fecha de nacimiento</label>
       <input required name="cliente_nac" type="date"
         id="cliente_nac" placeholder="Fecha de nacimiento Cliente" date-format="dd/mm/yyyy"  class="form-control">
     </div>
 
     <div class="mb-3">
       <label for="cliente_mail">Email</label>
       <input required name="cliente_mail" type="email" pattern="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"
        id="cliente_mail"  placeholder="E-mail Cliente" class="form-control">
   
          
     </div>
     
 
     <div class="mb-3">
       <label for="cliente_pass" >Contraseña</label>
       <input required  name="cliente_pass" type="password"
         id="cliente_pass"  placeholder="Contraseña"   class="form-control">
        
          
     </div>
  
     <div class="mb-3">
       <label for="cliente_tel">Telefono</label>
       <input required  name="cliente_tel" type="text"
         id="cliente_tel" placeholder="Telefono" pattern="[0-9]{10}" maxlength="10" class="form-control">
       
          
 
     <div class="mb-3">
       <label for="cliente_cto" >Contacto</label>
       <input required name="cliente_cto" type="text"
         id="cliente_cto" placeholder="Contacto" pattern="[0-9]{10}" maxlength="10" class="form-control">
        
     </div>
   
       <button type="submit" class="btn btn-success" id="insert_clientes" onclick='return enviarformulario();'>Agregar Registo</button>
       <a name="" id="" class="btn btn-primary" href="listar_clientes.php" role="button">Cancelar</a>
 
     </form>
     
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 <script src="../../../js/Validate/validar_form.js"></script>
 
         
     
 </div>
 
 <?php include "../../templates/footer.php"; ?>
 