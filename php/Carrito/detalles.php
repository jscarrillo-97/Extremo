<?php
require '../Carrito/config.php';
include_once "../conexion.php";
$sentencia = $base_de_datos->query('SELECT s.servicio_id,s.servicio_nom,s.servicio_pre  FROM servicio s WHERE s.servicio_disp=true ORDER BY s.servicio_nom');
$servicio = $sentencia->fetchAll(PDO::FETCH_OBJ);

$servicio_id = isset($_GET['servicio_id']) ? $_GET['servicio_id'] : '';
$token       = isset($_GET['token']) ? $_GET['token'] : '';

if($servicio_id == ''|| $token == ''){
    echo 'Error al procesar la petición';
    exit;
}

$token_tmp =  hash_hmac('sha256',$servicio_id,KEY_TOKEN);

if ($token == $token_tmp) {

    $sentencia = $base_de_datos->prepare("SELECT count(servicio_id) FROM servicio WHERE servicio_id = :codServicio AND servicio_disp = true");
    $sentencia->bindParam(':codServicio', $servicio_id, PDO::PARAM_INT);
    $sentencia->execute();
    if ($sentencia->fetchColumn() > 0) {

        $sentencia = $base_de_datos->prepare('SELECT  servicio_nom, servicio_det, servicio_pre FROM servicio WHERE servicio_id = :codServicio AND servicio_disp = true LIMIT 1');
        $sentencia->bindParam(':codServicio', $servicio_id, PDO::PARAM_INT);
        $sentencia->execute();
        $row = $sentencia->fetch(PDO::FETCH_ASSOC);
        $nombre  = $row['servicio_nom']; //Asignar 'servicio_nom' a la variable $nombre
        $detalle = $row['servicio_det'];  
        $precio  = $row['servicio_pre'];
        $dir_images = '../../images/servicios/'. $servicio_id .'/';
        $rutaImg = $dir_images .'principal.jpg';

        if(!file_exists($rutaImg)){
            $rutaImg = '../../images/servicios/no-photo.png';
        }

        $imagenes = array();
        if(file_exists($dir_images)){
        $dir = dir($dir_images);

        while(($archivo = $dir->read()) !== false){
            if($archivo != '.' && $archivo != '..' && $archivo != '1' && (strpos($archivo,'jpg') || strpos($archivo,'jpeg'))){
                $imagenes[] = $dir_images. $archivo;
            }
        }
        $dir->close();
  }
} else {
    echo "Error al procesar la petición";
    exit;
}
} else {
    echo "Error al procesar la petición";
    exit;
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
            <div class="row">
            <div class="col-md-6 order-md-1">
              <div id="carousellImages" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                  <div class="carousel-item active">
                  <img src="<?php echo $rutaImg; ?>" class="d-block w-100">
             </div>

             <?php foreach($imagenes as $img) { ?> 
               <div class="carousel-item">
                 <img src="<?php echo $img; ?>" class="d-block w-100">
                </div>
             <?php } ?> 

            </div>
              <button class="carousel-control-prev" type="button" 
              data-bs-target="#carousellImages" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" 
              data-bs-target="#carousellImages" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
             </button>
            </div>

            </div>
                <div class="col-md-6 order-md-2">
                <h2><?php echo $nombre; ?></h2>
                <h2><?php echo MONEDA . number_format($precio, 0, '.', '.'); ?></h2>
                <p class="lead">
                    <?php echo $detalle;?>
                </p>

                <div class="d-grid gap-3 col-10 mx-auto">
                 <button class="btn btn-primary" type="button">Comprar Ahora</button>
                 <button class="btn btn-outline-primary" type="button" onclick="addProducto(<?php echo $servicio_id; ?>, '<?php echo $token_tmp; ?>')">Agregar al carrito</button>
                </div>

                </div>
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
 