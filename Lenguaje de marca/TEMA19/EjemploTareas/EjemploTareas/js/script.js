
var boton = document.getElementById('btn');


boton.addEventListener('click', function () {

    var entrada = document.getElementById('entrada').value;

    if (entrada) {

        //CREAMOS EL ELEMENTO DIV
        var divTarea = document.createElement('div');
        //SACAMOS EL ELEMENTO DE LAS TAREAS CON EL CLASS (RECUERDA LA POSICIÓN)
        var divTodasTareas = document.getElementsByClassName('tasks')[0];
        //AÑADIMOS EL DIV CREADO AL OTRO DIV
        divTodasTareas.appendChild(divTarea);
        //CREAMOS UNA ETIQUETA PARA PÁRRAFO
        var titulo = document.createElement('p');
        //AÑADIMOS EL PÁRRAFO AL DIV CREADO
        divTarea.appendChild(titulo);

        //LE AÑADIMOS LA CLASE AL DIV PARA QUE SE LE APLIQUE EL CSS
        divTarea.className = 'task';
        //GUARDAMOS EN EL PÁRRAFO, EL VALOR DEL INPUT
        titulo.innerHTML = entrada;

        //RECOGEMOS EL ELEMENTO EQUIS
        var span = document.createElement('span');
        //LO AÑADIMOS AL DIV CREADO
        divTarea.appendChild(span);
        //AÑADIMOS LA CLASE CORRESPONDIENTE DE SPAN
        span.className = 'close';
        //LE DAMOS UN VALOR AL SPAN
        span.innerHTML = 'X';
        
        //PARA QUE NO SE MANTENGA CON EL COLOR AL NO AÑADIR NADA, HACEMOS LO SIGUIENTE:
        entrada = document.getElementById('entrada').value = '';
        entrada = document.getElementById('entrada').style.backgroundColor = 'white';

        span.addEventListener('click', function(){

            borrar(divTarea);

        });

    }

    else {
        alert("Debes escribir algo");
        var entrada2 = document.getElementById('entrada').style.backgroundColor = 'red';
    }

    


});

//PASAMOS POR PARÁMETRO LA TAREA A BORRAR
function borrar(tarea){

    //RECOGEMOS EL DIV DE TAREAS REALIZADAS
    var tareasRealizadas = document.getElementById('tareas-realizadas');
    //BORRAMOS LA TAREA
    tarea.remove();
    //LA AÑADIMOS A TAREAS REALIZADAS
    tareasRealizadas.appendChild(tarea);

}
