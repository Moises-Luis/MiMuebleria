
var btnAbrirPopup = document.getElementById('crear-registro');

var overlay = document.getElementById('overlay'),
    popup = document.getElementById('popup'),
    btnCerrarPopup = document.getElementById('btn-cerrar-popup');
var botonAuxCerrar = document.getElementById('botonCerrarAuxiliar');

    btnAbrirPopup.addEventListener('click', function (){
        /*url.searchParams.append('crear','true');
        console.log("URL actual: "+url.href);
        window.location = url;*/
        overlay.classList.add('active');
        popup.classList.add('active');
        console.log(overlay.classList);
    });