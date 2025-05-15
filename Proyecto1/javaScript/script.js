//SCRIPT DEL BLOG.HTML

var boton = document.getElementById('btnArticulo');

boton.addEventListener('click', function () {

    //Sacamos el contenido del input y del textarea
    var input = document.getElementById('tituloArticulo').value;
    var textarea = document.getElementById('contenidoArticulo').value;

    // Restaurar estilo al enfocar el input o escribir
    document.getElementById('tituloArticulo').addEventListener('focus', function () {
        input = document.getElementById('tituloArticulo').style.backgroundColor = 'rgb(245, 234, 214)';
    });

    document.getElementById('contenidoArticulo').addEventListener('focus', function () {
        textarea = document.getElementById('contenidoArticulo').style.backgroundColor = 'rgb(245, 234, 214)';
    });


    if (input && textarea) {
        //Creamos la etiqueta articulo y la añadimos a la seccion
        var articulo = document.createElement('article');
        var seccion = document.getElementById('seccionVacia')
        seccion.appendChild(articulo)

        //Creamos las etiquetas que va a contener el articulo
        var h3 = document.createElement('h3');
        var p = document.createElement('p');
        //Las añadimos a la etiqueta articulo
        articulo.appendChild(h3);
        articulo.appendChild(p);

        //El contenido de input va en el titulo del articulo
        h3.innerHTML = input;
        //El contenido de textarea va en el párrafo del articulo
        p.innerHTML = textarea;

        articulo.className = 'articuloNuevo';
        articulo.id = 'blog';
        seccion.className = 'seccion3';

        //Contar palabras --> echarle un vistazo a esto
        var ArrayTextarea = textarea.split(" ");
        var contador = document.getElementById('contadorPalabras');
        contador.innerHTML = "Llevas escritas un total de " + ArrayTextarea.lenght;
        console.log(textarea.lenght)

        //Restaura los valores, vuelve a dejar vacio el input y el textarea y vuelve a su color original
        input = document.getElementById('tituloArticulo').value = '';
        textarea = document.getElementById('contenidoArticulo').value = '';
        input = document.getElementById('tituloArticulo').style.backgroundColor = 'rgb(245, 234, 214)';
        textarea = document.getElementById('contenidoArticulo').style.backgroundColor = 'rgb(245, 234, 214)';


    } else {
        //Muestra una alerta si no se completan los campos
        alert("Debes completar todos los campos");
        //Cambia el color
        input = document.getElementById('tituloArticulo').style.backgroundColor = 'rgb(218, 88, 71)';
        textarea = document.getElementById('contenidoArticulo').style.backgroundColor = ' rgb(218, 88, 71)';
    }



});

//Ocultar las redes sociales y cuando se le pase el ratón aparezcan
/*
var botonRedes = document.getElementById('hoverRedes');
var asideRedes = document.getElementById('social');

botonRedes.addEventListener('onmouseover', function(){

    asideRedes.style.opacity = 1;
    asideRedes.style.visibility = visibility;

});

botonRedes.addEventListener('onmouseout', function(){

    asideRedes.style.opacity = 0
    asideRedes.style.visibility = hidden;
    
});
*/


