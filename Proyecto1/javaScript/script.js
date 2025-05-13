//SCRIPT DEL BLOG.HTML

var boton = document.getElementById('btnArticulo');

boton.addEventListener('click' , function(){

    //Sacamos el contenido del input y del textarea
    var input = document.getElementById('tituloArticulo').value;
    var textarea = document.getElementById('contenidoArticulo').value;

    //Creamos la etiqueta articulo y la añadimos a la seccion
    var articulo = document.createElement('article');
    var seccion = document.getElementById('seccion');
    seccion.appendChild(articulo);

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

    articulo.id = 'blog';

    

});