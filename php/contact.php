<?php

// Get the form data.
$fname = $_POST['fname'];
$lname = $_POST['lname'];
$email = $_POST['email'];
$message = $_POST['message'];

// Validate the form data.
if ($fname == "" || $lname == "" || $email == "" || $message == "") {
  echo "<h1>Por favor, complete todos los campos del formulario.</h1>";
  exit;
}

// Send the email.
$subject = "Mensaje de contacto de Untree";
$body = "De: $fname $lname\n\nCorreo electrónico: $email\n\nMensaje:\n$message";

mail("jscs2597@gmail.com", $subject, $body);

// Display a success message.
echo "<h1>Su mensaje ha sido enviado correctamente.</h1>";

?>