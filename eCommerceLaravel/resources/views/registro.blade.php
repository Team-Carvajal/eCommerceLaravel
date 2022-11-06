@extends('index')
@section('content')
    <link rel="stylesheet" href="{{ url('assets/css/login-registro.css')}}">

    <div class="d-grid mt-5">
            <div class="blur col-10 col-md-8  col-lg-5 col-sm-8 shadow rounded-2em m-auto">
                    <form>
                        <div class="d-grid">
                            <div class="mb-5 mt-5" >
                                <h1 class="fs-lg-1 text-lg-center text-center">Inicia Sesión</h1>
                            </div>
                            <div class="col-12 mx-auto">

                                        <div class="mb-3 d-flex">
                                            <span class="bg-transparent input-group-text border-0 position-absolute" id="basic-addon1"><i class="bi bi-person-fill text-muted"></i></span>
                                            <input required type="text" class="form-control ps-5" placeholder="Nombres" aria-label="Username" aria-describedby="basic-addon1">
                                        </div>
                                        <div class="mb-3 d-flex">
                                            <span class="bg-transparent input-group-text border-0 position-absolute" id="basic-addon1"><i class="bi bi-person-fill text-muted"></i></span>
                                            <input required type="text" class="form-control ps-5" placeholder="Apellidos" aria-label="Username" aria-describedby="basic-addon1">
                                        </div>
                                        <div class="mb-3 d-flex">
                                            <span class="bg-transparent input-group-text border-0 position-absolute" id="basic-addon1"><i class="text-muted">@</i></span>
                                            <input required type="mail" class="form-control ps-5" placeholder="Correo" aria-label="Username" aria-describedby="basic-addon1">
                                        </div>
                                        <div class="mb-3 d-flex">
                                            <span class="bg-transparent input-group-text border-0 position-absolute" id="basic-addon1"><i class="bi bi-telephone-fill text-muted"></i></span>
                                            <input required type="number" class="form-control ps-5" placeholder="Telefono" aria-label="Username" aria-describedby="basic-addon1">
                                        </div>
                                        <div class="mb-3 d-flex">
                                            <span class="bg-transparent input-group-text border-0 position-absolute" id="basic-addon1"><i class="bi bi-lock-fill text-muted"></i></span>
                                            <input required type="password" class="form-control ps-5" placeholder="Contraseña" aria-label="Username" aria-describedby="basic-addon1">
                                        </div>
                                        <div class="mb-3">
                                            <select class="form-select mb-3" required>
                                                <option selected disabled value="">Tipo de identificacion</option>
                                                <option value="">Cedula de ciudadania</option> 
                                                <option value="">Tarjeta de identidad</option> 
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <span class="bg-transparent input-group-text border-0 position-absolute" id="basic-addon1"><i class="bi bi-file-earmark-person text-muted"></i></span>
                                            <input required type="text" class="form-control ps-5" name="" value="" placeholder="Ingrese su numero de documento">
                                        </div>
                                        <div class="mb-4 d-flex">
                                            <span class="bg-transparent input-group-text border-0 position-absolute" id="basic-addon1"><i class= "bi bi-calendar-event text-muted"></i></span>
                                            <input type="date" class="form-control ps-5" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
                                        </div>

                                        <div class=" row col-md-6 col-sm-6 mx-auto mb-5 container ">
                                            <input type="submit" class="btn btn-primary shadow-sm " value="Registrate" >
                                        </div>
                                        
                                    </div>

                                    <div class="container mb-5 m">
                                        <a>Ya tienes una cuenta?</a>
                                        <a href="/inicio-de-sesion" class="text-primary">Inicia sesión</a>
                                    </div>
                            </div>
                        </div>
                    </form>
            </div>
        </div>


    <div class="background-login">
        <img src="{{ url('assets\images\background-login-01.svg')}}" alt="">
    </div>

@endsection
