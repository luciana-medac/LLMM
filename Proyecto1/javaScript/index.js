
//Al pasar el ratón se hace más grande el titulo
var destacados = document.getElementById('destacados2');

destacados.addEventListener('mouseover', function(){

    destacados.style.transform = 'scale(1.3)';

})

destacados.addEventListener('mouseout', function(){

    destacados.style.transform = 'scale(1)';

})



