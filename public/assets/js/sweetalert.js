function emailduplicate(){
    Swal.fire({
        icon: 'error',
        position: 'top-end',
        text: 'Este correo ya está registrado',
        timer: 2000,
        showConfirmButton: false,
        timerProgressBar: true,
        toast: true
      })
}
function dniduplicate(){
    Swal.fire({
        icon: 'error',
        position: 'top-end',
        text: 'Esta identificación ya está registrada',
        timer: 2000,
        showConfirmButton: false,
        timerProgressBar: true,
        toast: true
      })
}

function nouserexists(){
    Swal.fire({
        icon: 'error',
        position: 'top-end',
        text: 'La cuenta que ingresó no está registrada, revisa bien tu correo y contraseña',
        timer: 3000,
        showConfirmButton: false,
        timerProgressBar: true,
        toast: true
    })

}

function updateprofile(){
    Swal.fire({
        icon: 'success',
        position: 'top-end',
        text: 'Actualizado correctamente',
        timer: 2000,
        showConfirmButton: false,
        timerProgressBar: true,
        toast: true
      })
}

function noupdateprofile(){
    Swal.fire({
        icon: 'error',
        position: 'top-end',
        text: 'Error al actualizar',
        timer: 2000,
        showConfirmButton: false,
        timerProgressBar: true,
        toast: true
      })
}
