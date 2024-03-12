<script>

 
var id=O;//ID del cliente,
var idFactura=0;
var iva=0;
var total = 0;

function consultarCliente(){
    var cliente_id = document.getElementById("cliente_id").value;
    $.ajax({
        url:'consultar_cliente.php'
        method: 'POST',
        data: {
        cliente_id : cliente_id
        }
    })
}

</script>