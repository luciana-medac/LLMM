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
var ventajasExtras = document.getElementById('ventajaExtra');

mostrarVentajas.addEventListener('click', function(){

        ventajaExtra.style.display = 'block';

    mostrarVentajas.addEventListener('click', function(){
        
        ventajaExtra.style.display = 'none';

    })
})





