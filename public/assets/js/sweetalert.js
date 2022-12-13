// dataAlertMessage(mensaje, icono, posicion, tiempo);

function dataAlertMessage(texto, icon, position, time){
    Swal.fire({
        icon: icon,
        position: position,
        text: texto,
        timer: time,
        showConfirmButton: false,
        timerProgressBar: true,
        toast: true
      })
}
