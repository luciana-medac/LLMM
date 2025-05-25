//SCRIPT INDEX.HTML
//Al pasar el ratón se hace más grande el titulo
var destacados = document.getElementById('destacados2');

destacados.addEventListener('mouseover', function () {

    destacados.style.transform = 'scale(1.3)';

})

destacados.addEventListener('mouseout', function () {

    destacados.style.transform = 'scale(1)';

})



//Mostrar ventajas de ser cliente al darle al enlace

var enlace = document.getElementById('mostrarVentajas');

enlace.addEventListener('click', function () {

    var divVentajasExtra = document.getElementById('ventajaExtra');

    divVentajasExtra.style.display = 'block';
    enlace.style.display = 'none';
});


//TODAS LAS FUNCIONES DE LAS RESEÑAS

var reseñas = [

    "La mejor chimichanga que he probado.",

    "Excelente servicio.",

    "Me ha encantado el ambiente, volveré y recomiendo este lugar."

];

// Mostrar reseñas en pantalla
function mostrarReseñas() {

    document.getElementById('listaReseñas').innerHTML = reseñas
        //va recorriendo el array y por cada elemento, agrega un párrafo y el contido del array en esa posicion
        .map(res => `<p> ${res}</p>`)
        //une todo en una cadena
        .join('');

    //Para contar cuántas reseñas hay y lo muestra en el párrafo de la seccion
    document.getElementById('contadorReseñas').textContent = `Total de reseñas: ${reseñas.length}`;
    
}



//Agregar una reseña, pero al final
document.getElementById('agregarReseña').addEventListener('click', function () {
    //Saca el valor del input
    var nueva = document.getElementById('nuevaReseña').value;
    //Si contiene algo (true)
    if (nueva) {
        //Añade la reseña al final del array
        reseñas.push(nueva);
        //muestra todas las reseñas
        mostrarReseñas();
        //resetea el valor del input a vacio
        document.getElementById('nuevaReseña').value = '';
    } else {
        //Si no contiene nada el input, crea un alate
        alert('No has añadido ninguna reseña');
    }
});


//Agregar una reseña al principio
document.getElementById('agregarInicio').addEventListener('click', function () {
    var nueva = document.getElementById('nuevaReseña').value;
    if (nueva) {
        //Agrega la reseña al principio del array
        reseñas.unshift(nueva);
        mostrarReseñas();
        document.getElementById('nuevaReseña').value = '';
    } else {
        alert('No has añadido ninguna reseña');
    }
});

//Eliminar una reseña
document.getElementById('borrarUltima').addEventListener('click', function () {
    //Si la longitud del array es mayor que 0
    if (reseñas.length > 0) {
        //Elimina el último elemento del array
        reseñas.pop();
        mostrarReseñas();
    } else {
        //Si no es mayor que 0, muestra una alerta
        alert('No hay reseñas para eliminar');
    }
});

//Invertir el orden de las reseñas
document.getElementById('invertirReseñas').addEventListener('click', function () {
    //Cambia el orden de los elementos del array
    reseñas.reverse();
    mostrarReseñas();
});

// Mostrar reseñas al cargar
mostrarReseñas();


