<?php
require '../Carrito/config.php';
include_once "../conexion.php";

//Validar si existe la variable de sesion 
$servicios = isset($_SESSION['carrito']['servicios']) ? $_SESSION['carrito']['servicios'] : null;

print_r($_SESSION);

//Extraer Servicios

$lista_carrito = array();

if ($servicios != null) {
    foreach ($servicios as $clave => $cantidad) {

        //Consulta preparada
        $sentencia = $base_de_datos->prepare("SELECT s.servicio_id, s.servicio_nom, s.servicio_pre, :cantidad AS cantidad FROM servicio s WHERE s.servicio_id = :id AND s.servicio_disp=true ORDER BY s.servicio_id");
        
        // Vincular parámetros
        $sentencia->bindParam(':id', $clave, PDO::PARAM_INT);
        $sentencia->bindParam(':cantidad', $cantidad, PDO::PARAM_INT);
        
        // Ejecutar consulta
        $sentencia->execute();

        $lista_carrito[] = $sentencia->fetch(PDO::FETCH_ASSOC);
    }
}


 
?>  

 
 
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tienda Online</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="../../css/estilos.css" rel="stylesheet">
</head>

<body>
    <!--Barra de navegación-->
    <header>
        <div class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a href="#" class="navbar-brand">
                    <strong>SantanderXtreme</strong>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                data-bs-target="#navbarHeader" aria-controls="navbarHeader"
                aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarHeader">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a href="#" class="nav-link active">Catalogo</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">Contacto</a>
                        </li>
                    </ul>
                    <a href="carrito.php" class="btn btn-primary">
                        Carrito <span id="num_cart" class="badge bg-secondary"><?php echo $num_cart; ?></span>
                    </a>
                </div>
            </div>
        </div>
    </header>

    <!--Contenido-->
    <main>
        <div class="container">
          <div class="table-responsive">
            <table class ="table">
                <thead>
                    <tr>
                        <th>Servicio</th>
                        <th>Precio</th>
                        <th>Cantidad</th>
                        <th>Subtotal</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
    <?php if ($lista_carrito == null){
        echo '<tr><td colspan="5" class="text-center"><b>Lista vacia</b></td></tr>';
    } else {
        $total = 0;
        foreach($lista_carrito as $servicio){
            $servicio_id  =$servicio['servicio_id'];
            $servicio_nom =$servicio['servicio_nom'];
            $servicio_pre =$servicio['servicio_pre'];
            $cantidad     =$servicio['cantidad'];
            $subtotal = $cantidad * $servicio_pre;
            $total   += $subtotal;
            ?>
            <tr>
                <td><?php echo $servicio_nom; ?></td>
                <td><?php echo MONEDA . number_format($servicio_pre,0, '.', '.'); ?></td>
                <td>
                    <input type="number" min="1" max="10" step="1" value="<?php echo $cantidad?>"
                    size="5" id="cantidad<?php echo $servicio_id;?>" 
                    onchange="actualizaCantidad(this.value, <?php echo $servicio_id; ?> )">
                </td>
  
         

                <td>
                    <div id="subtotal_<?php echo $servicio_id; ?>" name="subtotal[]"><?php echo MONEDA . number_format($subtotal,0, '.', '.'); ?></div>
                </td>
                <td><a  href="#" id="eliminar" class="btn btn-warning btn-sm" data-bs-servicio_id="<?php echo $servicio_id?>"
            data-ds-toogle="modal" data-bs-targer="eliminaModal">Eliminar</td>
           
            </tr>       
        <?php } // Cerrar el bucle foreach correctamente ?>
        <tr>
             <td colspan="3"></td>
             <td colspan="2"> 
                <p class="h4" id="total"><?php echo MONEDA . number_format($total,0, '.', '.'); ?></p>
             </td>
        </tr>   
    <?php } ?>
</tbody>
</table> 

  
 
          </div>
          <div class="row">
              <div class="col-md-5 offset-md-7 d-grid gap-2">
                <button class="btn btn-primary btn-lg">Realizar pago</button>
              </div>
            </div>
        </div>
        </div>
    </main>

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    
    <script>
        function actualizaCantidad(cantidad, servicio_id) {
            let url = './clases/actualizar_carrito.php';
            let formData = new FormData();
            formData.append('action', 'agregar');
            formData.append('servicio_id', servicio_id);
            formData.append('cantidad', cantidad);

            fetch(url, {
                method: 'POST',
                body: formData,
                mode: 'cors'
            }).then(response => response.json())
                .then(data => {
                    console.log(data); // Muestra la respuesta JSON recibida
                    if (data.okay) {
                        let divsubtotal = document.querySelector('#subtotal_' + servicio_id);
                        divsubtotal.innerHTML = data.sub;
                    }
                });
        }
    </script>
    
</body>