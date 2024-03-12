function validateForm() {
    var fname = document.getElementById("fname").value;
    var lname = document.getElementById("lname").value;
    var email = document.getElementById("email").value;
    var message = document.getElementById("message").value;
  
    // Validate the name fields.
    if (fname == "") {
      alert("El nombre es obligatorio.");
      return false;
    }
    if (lname == "") {
      alert("Los apellidos son obligatorios.");
      return false;
    }
  
    // Validate the email field.
    if (email == "") {
      alert("El correo electrónico es obligatorio.");
      return false;
    } else if (!(/^\w+@\w+\.[a-zA-Z]{2,}$/.test(email))) {
      alert("El correo electrónico no es válido.");
      return false;
    }
  
    // Validate the message field.
    if (message == "") {
      alert("El mensaje es obligatorio.");
      return false;
    }
  
    return true;
  }