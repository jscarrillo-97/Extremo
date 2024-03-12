<?php

define("KEY_TOKEN", "ASc.wpc-098$");
define("MONEDA", "COP $");

session_start();

$num_cart = 0;
if(isset($_SESSION['carrito']['servicios'])){
    $num_cart = count($_SESSION['carrito']['servicios']);
}

?>