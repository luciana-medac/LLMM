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
        contador.innerHTML = "Llevas escritas un total de " + ArrayTextarea.length;
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

/* LO SIGUIENTE OCULTA Y MUESTRA LAS REDES SOCIALES */

//Recogemos los elementos de aside y el boton
var asideRedes = document.getElementById('social');

//Creamos la lista de redes sociales
var listaRedesSociales = document.createElement('ul');
listaRedesSociales.id = 'listaRedesSociales';
listaRedesSociales.style.display = 'none';
asideRedes.appendChild(listaRedesSociales);

//Creamos los div y los elementos li
var divUno = document.createElement('div');
divUno.id = 'uno';
var divDos = document.createElement('div');
divDos.id = 'dos'

listaRedesSociales.appendChild(divUno);
listaRedesSociales.appendChild(divDos);

//funcion para crear una red social
function crearRedSocial(div, href, src){

    var li = document.createElement('li');
    var a = document.createElement('a');
    var img = document.createElement('img');

    a.href = href;
    a.target = "_blanck";
    img.src = src;

    a.appendChild(img);
    li.appendChild(a);
    div.appendChild(li);
}

//Añadimos las redes sociales usando la función
crearRedSocial(divUno, "https://facebook.com", "/img/face.png" );
crearRedSocial(divUno, "https://twitter.com", "/img/twitter.jpeg");
crearRedSocial(divDos, "https://instagram.com", "/img/insta.png" );
crearRedSocial(divDos, "https://youtube.com", "/img/youtube.png");

//Si pasamos el ratón por encima del aside se muestran las redes
asideRedes.addEventListener('mouseover', function(){
    listaRedesSociales.style.display = 'block';
})
//Si quitamos el ratón, se ocultan las redes sociales
asideRedes.addEventListener('mouseout', function(){
    listaRedesSociales.style.display = 'none';
})