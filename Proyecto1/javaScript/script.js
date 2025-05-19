//SCRIPT INDEX.HTML
//Al pasar el ratón se hace más grande el titulo
var destacados = document.getElementById('destacados2');

destacados.addEventListener('mouseover', function(){

    destacados.style.transform = 'scale(1.3)';

})

destacados.addEventListener('mouseout', function(){

    destacados.style.transform = 'scale(1)';

})

//Mostrar ventajas de ser cliente al darle al enlace
var mostrarVentajas = document.getElementById('mostrarVentajas');
var divVentajas = document.getElementById('ventajasCliente');

mostrarVentajas.addEventListener('mouseout', function(){

     divVentajas.style.display = 'none';
    mostrarVentajas.addEventListener('mouseover', function(){
       divVentajas.style.display = 'block';
    })
})



