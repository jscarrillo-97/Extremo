<?php include("../templates/header.php"); ?>
<?php include_once "../configuracion/conexion.php"; ?>
</br> 
</br>

    <div class="row">
      <div class="col-lg-12">
        <div class="form-group">
          <h4 class="text-center">Datos de Reserva</h4>
       </div>

        <div class="card">
            <div class="card-body">
 
                    <div class="col-lg-4">         
                      <div class="input-group">
                        <input type="text" name="cliente_id" id="cliente_id" class="form-control" placeholder="Numero de identificación" required>
                          <button class="btn btn-outline-secondary" onclick="consultarCliente();">Buscar</button>
                      </div>
                      </br>
                   
                      <div class="input-group">                          
                        </br> <label>Nombre Cliente:</label>
                          <input type="text" readonly   class="form-control-plaintext" id="cliente_nom"  required>   
                      </div>

                        <div class="col-lg-4">
                           <!----  <div class="form-group">
                                <label>Dirreción</label>
                                <input type="text" name="dir_cliente" id="dir_cliente" class="form-control" disabled required>
                            </div>---->
                            <button  class="btn btn-primary btn-sm" onclick="insertarFactura();">Generar Factura</button>
                        </div>
                    </div>
                    </br>
            
                    <div class="card">
    <div class="card-header bg-primary text-white text-center">
        Buscar Servicio
    </div>
    <br>
    <div class="row">
        <div class="col-lg-4">
            <input type="text" class="form-control" id="txtCantidad" placeholder="Cantidad">
        </div>    
 
        </br><div class="col-lg-4">
            <div class="input-group">
                <input type="text" name="servicio_id" id="servicio_id" class="form-control" placeholder="Ingrese un codigo"  >
                <button class="btn btn-outline-secondary" onclick="consultarCliente();">Buscar</button>
            </div>
        </div>
    </div>
    <br>
    
    <div class="card-header bg-primary text-white text-center">
        Servicio Seleccionados
    </div>
    
    <div class="table-responsive">
            <table class="table table-hover" >
                <thead class="thead-dark">
                    <tr>
                        
                        <th scope="col">ID</th>
                        <th scope="col">Servicio</th>
                        <th scope="col">Cantidad</th>
                        <th scope="col">Descripción</th>
                        <th scope="col">Valor Bruto</th>
                        <th scope="col">IVA</th>
                        <th scope="col">Valor Neto</th>
                    </tr>
                </thead>
                 
                <tbody id="resultadoReserva">
            
            <!-- You can add more rows as needed -->
        </tbody>
            </table>

            <h4 id="subtotal">Sub Total:</h4>
            <h4 id="iva">IVA %:</h4>
            <h4 id="iva">Total Factura:</h4>
        </div>
        
        
<script>

var id=O;//ID del cliente,
var idFactura=0;
var iva=0;
var total = 0;

function consultarCliente(){
    
    var cliente_id = document.getElementById("cliente_id").value;
    console.log("Mensaje 1")
    $.ajax({
        url:'consultar_cliente.php',
        method: 'POST',
        data: {
         cliente_id  : cliente_id
        },
        dataType: 'json',
        success:function(data){
            if (data.error){
                alert(data.error)
            }else{
              document.getElementById("cliente_nom").value = data.cliente_nom + " "+data.cliente_ape;
              id = data.cliente_id;

            }
        }
    });
}

</script>
</div> 
<?php include_once "../templates/footer.php"; ?>