@extends('index')
@section('content')
    <link rel="stylesheet" href="{{ url('assets/css/login-registro.css')}}">



        <div class="vh-100 d-grid">
            <div class="blur col-10 col-md-8  col-lg-5 col-sm-8 shadow rounded-2em m-auto">
                    <form>
                        <div class="d-grid">
                            <div class="mb-5 mt-5" >
                                <h1 class="fs-lg-1 text-lg-center text-center">Inicia Sesión</h1>
                            </div>
                            <div class="col-12 mx-auto">
                                <div class="mb-3 d-flex">
                                    <span class="bg-transparent input-group-text border-0 position-absolute" id="basic-addon1"><i class="bi bi-envelope text-muted"></i></span>
                                    <input required type="mail" class="form-control ps-5" placeholder="Correo" aria-label="Username" aria-describedby="basic-addon1">
                                </div>
                                <div class="mb-4 d-flex">
                                    <span class="bg-transparent input-group-text border-0 position-absolute" id="basic-addon1"><i class="bi bi-lock-fill text-muted"></i></span>
                                    <input required type="password" class="form-control ps-5" placeholder="Contraseña" aria-label="Username" aria-describedby="basic-addon1">
                                </div>
                                <div class=" row col-md-6 col-sm-6 mx-auto mb-5 container ">
                                    <input type="submit" class="btn btn-primary shadow-sm " value="Continuar" >
                                </div>
                                
                            </div>
                            <div class="container mb-5 m">
                                <a>Aún no tiene una cuenta? </a>
                                <a href="/ping/registro" class="text-primary"> Registrate aquí</a>
                            </div>
                        </div>
                    </form>
            </div>
        </div>
    <div class="background-login">
        <img src="{{ url('assets\images\background-login-01.svg')}}" alt="">
    </div>
@endsection
    