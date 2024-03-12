<?php
require '../Carrito/config.php';
include_once "../conexion.php";
$sentencia = $base_de_datos->query('SELECT s.servicio_id,s.servicio_nom,s.servicio_pre  FROM servicio s WHERE s.servicio_disp=true ORDER BY s.servicio_id');
$servicio = $sentencia->fetchAll(PDO::FETCH_OBJ);

  session_destroy();
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
                    <a href="./checkout.php" class="btn btn-primary">
                        Carrito <span id="num_cart" class="badge bg-secondary"><?php echo $num_cart; ?></span>
                    </a>
                </div>
            </div>
        </div>
    </header>

  <!--Contenido-->
  <main>
        <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <?php foreach($servicio as $row)
             {  ?>
                <div class="col">
                    <div class="card shadow-sm">

                    <?php

                    $servicio_id = $row->servicio_id;
                    $imagen = "../../images/servicios/" . $servicio_id . "/principal.jpg" ;
                    
                    if(!file_exists($imagen)){
                        $imagen = "../../images/servicios/no-photo.png";
                    }

                    ?>
                        <img src="<?php echo $imagen ; ?>" class="d-block w-100">
                        <div class="card-body">
                            <h5 class="card-title"><?php echo $row->servicio_nom; ?></h5>
                            <p class="card-text"><?php echo number_format($row->servicio_pre, 0, '.', '.'); ?>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <a href="./detalles.php?servicio_id=<?php echo $row->servicio_id; ?>&token=<?php echo 
                                    hash_hmac('sha256',$row->servicio_id,KEY_TOKEN); ?>" class="btn btn-primary">
                                    Detalles</a>
                                </div>
                                <button class="btn btn-outline-success" type="button" onclick="addProducto(<?php echo $row->servicio_id; ?>,
                                '<?php echo hash_hmac('sha256',$row->servicio_id,KEY_TOKEN); ?>')">Agregar al carrito</button>
                            </div>
                        </div>
                    </div>
                </div>
            <?php
			} ?>
            </div>
        </div>
    </main>

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    
    <script>
        function addProducto(servicio_id,token){
            let url = './clases/carrito.php'
            let formData = new FormData()
            formData.append('servicio_id',servicio_id)
            formData.append('token',token)

            fetch(url,{
                method: 'POST',
                body:   formData,
                mode:   'cors'
            }).then(respuesta =>respuesta.json())
              .then(data => {
              if(data.okay) {
                let elemento = document.getElementById("num_cart")
                elemento.innerHTML = data.numero
              }
        })
    }
    </script>
    
</body>

</html>

 