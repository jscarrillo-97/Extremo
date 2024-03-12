
//Validacion del formulario de Forma Cliente//
const formCliente = document.getElementById('form_cliente');
const InputCliente = document.querySelectorAll('#form_cliente input');


//Validacion del formulario de Editar Cliente//
//const editCliente = document.getElementById('edit_cliente').value;
//const InputEditCliente = document.querySelector('#edit_cliente input');

//Constante de declaracion de campos //
const campos = {
    //Campos de Cliente//
    //Obligatorios//
    cliente_id: false,
	cliente_nom: false,
	cliente_ape: false,
	fecha: true,
    cliente_pass:false,
	cliente_mail: false,
	cliente_tel: false,
	cliente_cto: false
 
}

 
//Expresiones regulares //
const expresiones = {
	cedula: /^[0-9]{7,11}$/, // numeros
	nombre: /^[a-zA-ZÀ-ÿ\s]{2,30}$/, // Letras y espacios, pueden llevar acentos.
	correo: /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/, 
	telefono: /^[0-9]{10}$/, // 10 a 11 numeros.
 
}

//Declaraciòn de la funcion que valida las expresiones regulares //
const validarFormulario = (e) => {
	switch (e.target.name) {
        /*Campos de instructores */
        /************************************************************/
        case "cliente_id":
			validarCampo(expresiones.cedula, e.target, 'cliente_id');
		break;
		case "cliente_nom":
			validarCampo(expresiones.nombre, e.target, 'cliente_nom');
		break;
		case "cliente_ape":
			validarCampo(expresiones.nombre, e.target, 'cliente_ape');
		break;
        case "cliente_mail":
            validarCampo(expresiones.correo, e.target, 'cliente_mail');
        break;
		case "cliente_pass":
			validarCampo(expresiones.nombre, e.target, 'cliente_pass');
		break;
        case "cliente_tel":
			validarCampo(expresiones.telefono, e.target,'cliente_tel');
		break;
        case "cliente_cto":
			validarCampo(expresiones.telefono, e.target, 'cliente_cto');
		break;
		 
	}
}

//Funcion que valida las expresiones regulares //
const validarCampo = (expresion, input, campo) => {
	if(expresion.test(input.value)){
        input.classList.remove('borde-rojo');
        input.classList.add('borde-verde');
		campos[campo] = true;
	} else {
        input.classList.remove('borde-verde');
        input.classList.add('borde-rojo');
		campos[campo] = false;
	}
}

//Inputs para el formulario de Forma Clientes//
InputCliente.forEach((input) => {
	input.addEventListener('keyup', validarFormulario);
	input.addEventListener('blur', validarFormulario);
});
//Inputs para el formulario de Editar Clientes//
/*InputEditCliente.forEach((input) => {
	input.addEventListener('keyup', validarFormulario);
	input.addEventListener('blur', validarFormulario);
});
*/

//Funcion para el formulario Forma Clientes// 
function enviarformulario (){
    if(campos.cliente_id && campos.cliente_nom && campos.cliente_ape && campos.cliente_mail && campos.cliente_tel && campos.cliente_cto){
        // Mostrar mensaje de éxito con SweetAlert2 y permitir que permanezca en pantalla hasta que el usuario interactúe
        Swal.fire({
            icon: 'success',
            title: 'Formulario Enviado',
            text:  'El formulario se ha enviado correctamente.',
            timer: 30000, // Duración de la alerta en milisegundos (30000 ms = 30 segundos)
        });
        console.log("Formulario Enviado");
        return true;
    } else {
        // Mostrar mensaje de error con SweetAlert2
        Swal.fire({
            icon: 'error',
            title: 'Formulario No Enviado',
            text: 'Por favor, complete todos los campos del formulario.'
        });
        console.log("Formulario No Enviado");
        return false;
    }
}

function enviarEditformulario (){
    if(campos.nombre && campos.apellido && campos.email && campos.telefono && campos.contacto){console.log("Formulario Enviado");return TRUE;} 
    else{console.log("Formulario No Enviado");return false;
    }
}
