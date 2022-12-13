@extends('user.layouts.index')
@section('title', 'Login')
@section('content')

    <link rel="stylesheet" href="{{ url('assets/css/login-registro.css')}}">

    <div class="vh-100 d-grid">
        <div class="blur  col-10 col-md-8 col-lg-5 col-sm-8 shadow rounded-2em m-auto">
            <form method="POST" action="{{ route('authentication') }}" >
                <div class="d-grid">

                    @csrf

                    <!-- <a href="/"><i class="bi bi-arrow-left-circle-fill bg-muted fs-1 position-absolute mt-1"></i></a> -->
                    <a href="/"><i class="bi bi-arrow-left fs-2 position-absolute mt-3 ms-3"></i></a>
                    <div class="mb-5 mt-5" >
                        <!-- <h1 class="text-center"><a href="/"><img class="logo-lr pb-4" src="{{ url('assets/images/icon/isotipo1x.svg') }}" alt=""></a></h1> -->
                        <h1 class="fs-lg-1 text-lg-center text-center">Inicia Sesión</h1>
                    </div>
                    <div class="col-12 mx-auto">
                        <div class="mb-3 d-flex">
                            <span class="bg-transparent input-group-text border-0 position-absolute" id="basic-addon1"><i class="bi bi-envelope text-muted"></i></span>
                            <input required type="mail" name="email" class="form-control ps-5" placeholder="Correo" aria-label="Username" aria-describedby="basic-addon1" autofocus>
                        </div>
                        <div class="mb-4 d-flex">
                            <span class="bg-transparent input-group-text border-0 position-absolute" id="basic-addon1"><i class="bi bi-lock-fill text-muted"></i></span>
                            <input required type="password" name="password" class="form-control ps-5" placeholder="Contraseña" aria-label="Username" aria-describedby="basic-addon1">
                        </div>
                        <div class=" row col-md-6 col-sm-6 mx-auto mb-5 container ">
                            <input type="submit" class="btn btn-primary shadow-sm " value="Continuar" >
                        </div>

                    </div>
                    <div class="container mb-5 m">
                        <a>Aún no tiene una cuenta? </a>
                        <a href="/registro" class="text-primary"> Registrate aquí</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="background-login">
        <img src="{{ url('assets\images\background-login-01.svg')}}" alt="">
    </div>

    <script>
        {{--
            window.addEventListener("load",function(){
                @if (Auth::id())
                    let userexists = 1;
                @else
                    let userexists = 0;
                @endif

                if(!userexists){
                    nouserexists();
                }
            })
        --}}
    </script>
@endsection
