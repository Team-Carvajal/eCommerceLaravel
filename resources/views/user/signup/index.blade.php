@extends('user.layouts.index')
@section('title', 'Registro de usuarios')
@section('content')
<link rel="stylesheet" href="{{ url('assets/css/login-registro.css')}}">

<style>
input[type=number]::-webkit-inner-spin-button,
input[type=number]::-webkit-outer-spin-button {
  -webkit-appearance: none;
  margin: 0;
}
</style>




<div class="d-grid mt-5">
        <div class="blur col-10 col-md-8  col-lg-5 col-sm-8 shadow rounded-2em m-auto">
                <form method="POST" action="{{ route('save') }}">
                    @csrf
                    <div class="d-grid">
                    <a href="/"><i class="bi bi-arrow-left fs-2 position-absolute mt-3 ms-3"></i></a>
                        <div class="mb-5 mt-5" >
                            <h1 class="fs-lg-1 text-lg-center text-center">Registrate</h1>
                        </div>
                        <div class="col-12 mx-auto">
                                    <div class="mb-3 d-flex">
                                        <span class="bg-transparent input-group-text border-0 position-absolute" id="basic-addon1"><i class="bi bi-person-fill text-muted"></i></span>
                                        <input required type="text" class="form-control ps-5" name="name" placeholder="Nombres" aria-label="Username" aria-describedby="basic-addon1" autofocus pattern="[A-Za-z- ]*" maxlength="50">
                                    </div>
                                    <div class="mb-3 d-flex">
                                        <span class="bg-transparent input-group-text border-0 position-absolute" id="basic-addon1"><i class="bi bi-person-fill text-muted"></i></span>
                                        <input required type="text" class="form-control ps-5" name="lastName" placeholder="Apellidos" aria-label="Username" aria-describedby="basic-addon1" pattern="[A-Za-z- ]*" maxlength="50">
                                    </div>
                                    <div class="mb-3 d-flex">
                                        <span class="bg-transparent input-group-text border-0 position-absolute" id="basic-addon1"><i class="bi bi-envelope text-muted"></i></span>
                                        <input required type="mail" class="form-control ps-5" name="email" placeholder="Correo" aria-label="Username" aria-describedby="basic-addon1" maxlength="255" id="email">
                                    </div>
                                    <div class="mb-3 d-flex">
                                        <span class="bg-transparent input-group-text border-0 position-absolute" id="basic-addon1"><i class="bi bi-telephone-fill text-muted"></i></span>
                                        <input required type="tel" class="form-control ps-5" name="phone" placeholder="Teléfono" maxlength="10" aria-label="Username" aria-describedby="basic-addon1">
                                    </div>
                                    <div class="mb-3 d-flex">
                                        <span class="bg-transparent input-group-text border-0 position-absolute" id="basic-addon1"><i class="bi bi-person-fill text-muted"></i></span>
                                        <input required type="text" class="form-control ps-5" name="name" placeholder="Tipo de documento" aria-label="Username" value="Cedula de ciudadania" aria-describedby="basic-addon1" autofocus disabled>
                                    </div>
                                    <div class="mb-3 d-flex">
                                        <span class="bg-transparent input-group-text border-0 position-absolute" id="basic-addon1"><i class="bi bi-person-fill text-muted"></i></span>
                                        <input required type="number" class="form-control ps-5" id="dni" name="dni" placeholder="Numero de documento" maxlength="10"  aria-label="Username" aria-describedby="basic-addon1">
                                    </div>
                                    <div class="mb-3 d-flex">
                                        <span class="bg-transparent input-group-text border-0 position-absolute" id="basic-addon1"><i class="bi bi-lock-fill text-muted"></i></span>
                                        <input required type="password" class="form-control ps-5" name="password" placeholder="Contraseña" aria-label="Username" aria-describedby="basic-addon1">
                                    </div>

                                    <div class="mb-4 d-flex">
                                        <span class="bg-transparent input-group-text border-0 position-absolute" id="basic-addon1"><i class= "bi bi-calendar-event text-muted"></i></span>
                                        <input type="text" onclick="fecha()" id="date" name="birthDay" class="form-control ps-5" placeholder="Fecha de cumpleaños" aria-label="Username" aria-describedby="basic-addon1">
                                    </div>

                                    <div class=" row col-md-6 col-sm-6 mx-auto mb-5 container ">
                                        <input type="submit" class="btn btn-primary shadow-sm " value="Registrate" >
                                    </div>
                                </div>
                                <div class="container mb-5 m">
                                    <a>Ya tienes una cuenta?</a>
                                    <a href="/login" class="text-primary">Inicia sesión</a>
                                </div>
                        </div>
                    </div>
                </form>
        </div>
    </div>


<div class="background-login">
    <img src="{{ url('assets\images\background-login-01.svg')}}" alt="">
</div>


<script>

function fecha(){
    let date = document.getElementById('date');
    date.setAttribute('type', 'date');
    date.setAttribute('max', '2004-12-31');
}
{{--
    // $('#email').on('propertychange input', function (e) {
        // let email = $('#email').val();
    // });
    // text = text.split('')[text.length - 1];
--}}

    $('#email').focusout(function (e) {
        let text = $('#email').val();

            // var querymail = $.get("/check" , function(request)){
            //     alert('paso1');
            // }

            emailduplicate();
    });

    $('#dni').focusout(function (e) {
        let text = $('#dni').val();
            dniduplicate();
    });


</script>

@endsection
