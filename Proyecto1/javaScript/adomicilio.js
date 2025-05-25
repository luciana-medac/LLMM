var btnPedido = document.getElementById('btnPedido');

btnPedido.addEventListener('click', function () {

    //Sacamo el valor de los input
    var numCliente = document.getElementById('numCliente').value;
    var nomCliente = document.getElementById('nomCliente').value;

    if (numCliente) {

        //Al darle click al botón, 
        // Si es cliente, se mostrará una alerta con el número del cliente y el número de pedido
        var numPedido = Math.floor(Math.random() * 1000); //Generamos un numero random entre 1 y 999
        alert("Cliente con número de cliente: " + numCliente + " ha hecho el pedido número: " + numPedido);

    } else {

        //Si no es cliente, se sacará de su nombre, un usuario temporal
        if (nomCliente) {

            //Separamos los valores por espacio y los guardamos en dos variables distintas
            var partes = nomCliente.split(" ");
            var nombre = partes[0];
            var apellido = partes[1];

            //Obtenemos caracteres del nombre
            var segunda = nombre.charAt(1).toUpperCase();
            var cuarta = nombre.charAt(3).toLowerCase();

            //Generamos un número random del 1 al 10
            var numRandom = Math.floor(Math.random() * 10) + 1;

            //Sacamoso las letras 1 al 3 del apellido
            var caractApellido = apellido.substring(0, 3);

            //Sacamos letras random del abecedario
            var letras = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            var letra1 = letras.charAt(Math.floor(Math.random() * letras.length));
            var letra2 = letras.charAt(Math.floor(Math.random() * letras.length));

            //último número final random del 1 al 10
            var numFinal = Math.floor(Math.random() * 10) + 1;

            //Nombre temporal del usuario:
            var usuarioTemporal = segunda + numRandom + cuarta + caractApellido + letra1 + letra2 + numFinal;

            var numPedido = Math.floor(Math.random() * 1000);
            alert("Usuario temporal generado: " + usuarioTemporal + " ha hecho el pedido número: " + numPedido);

        } else {
            //Si no ha introducido nombre o número cliente, salta una alerta
            alert("Por favor, introduce al menos un nombre o un número de cliente.");

        }
    }
});
