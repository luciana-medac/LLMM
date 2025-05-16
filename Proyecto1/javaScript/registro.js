//SCRIPT DE REGISTRO.HTML

//Recogemos el valor del input del correo y el boton de enviar
var btnEnviar = document.getElementById('btnEnviar');


//Creamos un array que va a contener los correos de los usuarios registrados
var arrayRegistros = ['laura@example.com', 'martin@example.com', 'carla@example.com' , 
                'alejandro@example.com', 'sara@example.com', 'nicolas@example.com'
        ]


btnEnviar.addEventListener('click', function () {

    //evita que el formulario se envie automáticamente

    var correo = document.getElementById('correo').value;

        //compruebe si el correo está en el array y muestre una alerta de que está en uso
        if(arrayRegistros.includes(correo)){

            alert('Este correo ya está en uso');

        } else {
            alert('Se ha registrado correctamente, te mandaremos un correo con ');
            arrayRegistros.push(correo); //lo agregamos
            console.log(arrayRegistros);
        }
});