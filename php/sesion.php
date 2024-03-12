<?php

//Verificar si se han enviado las variables mediante el método POST
if  (!isset($_POST["use"])     ||  
    !isset($_POST["con"]))   
    {
    exit();
    }

    session_start();
    $user     = $_POST['use'];
    $password = md5($_POST['con']);
    
            // Iniciar sesión y redirigir al usuario a la página principal
            $_SESSION['admin_mail'] = $usuario;
            echo 'Inicio de sesión correcto';
             header('Location: index.php');
            exit;
        } else {
            echo 'Correo electrónico o contraseña incorrectos';
        }
    } catch (PDOException $e) {
        echo "Error de conexión: " . $e->getMessage();
    }
}
?>
