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


//Recogemos el aside
var asideRedes = document.getElementById('social');
var botonRedes = document.getElementById('hoverRedes');
var listaRedesSociales = document.getElementById('listaRedesSociales');

//Ocultar las redes sociales y cuando pase el ratón aparezcan
botonRedes.addEventListener('mouseout', function () {
    borrar(listaRedesSociales);
});

function borrar(listaRedesSociales) {
    listaRedesSociales.remove();
}

botonRedes.addEventListener('mouseover', function () {

    /*
    var ul = document.createElement('ul');
    ul.id = 'listaRedesSociales';

    var divUno = document.createElement('div');
    ul.appendChild(divUno);
    divUno.id = 'uno';

    var divDos = document.createElement('div');
    ul.appendChild(divDos);
    divDos.id = 'dos';

    var li1 = document.createElement('li');
    divUno.appendChild(li1);
    var li2 = document.createElement('li');
    divUno.appendChild(li2);

    var li3 = document.createElement('li');
    divUno.appendChild(li3);
    var li4 = document.createElement('li');
    divUno.appendChild(li4);

    var li5 = document.createElement('li');
    divDos.appendChild(li5);
    var li6 = document.createElement('li');
    divDos.appendChild(li6);

    var li7 = document.createElement('li');
    divDos.appendChild(li7);
    var li28 = document.createElement('li');
    divDos.appendChild(li8);

    var a1 = document.createElement('a');
    var img1 = document.createElement('img');
    li1.appendChild(a1);
    a1.href = "https://facebook.com";
    a1.target = "_blank";
    li1.appendChild(img1);
    img1.src = "/img/face.png";

    var a2 = document.createElement('a');
    var img2 = document.createElement('img');
    li2.appendChild(a2);
    a2.href = "https://twitter.com";
    a2.target = "_blank";
    li2.appendChild(img2);
    img2.src = "/img/twitter.jpeg";

    var a3 = document.createElement('a');
    var img3 = document.createElement('img');
    li3.appendChild(a3);
    a3.href = "https://instagram.com";
    a3.target = "_blank";
    li3.appendChild(img3);
    img3.src = "/img/insta.png";

    var a4 = document.createElement('a');
    var img4 = document.createElement('img');
    li4.appendChild(a4);
    a4.href = "https://youtube.com";
    a4.target = "_blank";
    li4.appendChild(img4);
    img4.src = "/img/youtube.png";
    */

    

});


