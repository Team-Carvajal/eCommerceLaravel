@extends('user.layouts.index')
@section('title', 'Perfil')
@section('content')
@php
  session(['avatar' => "{$profile->avatar}"]);
@endphp

<script>

function editar(){
  document.getElementById('nombre').readOnly = false;
  document.getElementById('apellidos').readOnly = false;
  // document.getElementById('correo').readOnly = false;
  // document.getElementById('fecha').readOnly = false;
  document.getElementById('celular').readOnly = false;
  document.getElementById('editar').style.display = "none";
  document.getElementById('cancelar').style.display = "inline-block";
  document.getElementById('enviar').style.display = "inline-block";
}

function cancelar(){
  document.getElementById('nombre').readOnly = true;
  document.getElementById('apellidos').readOnly =true;
  // document.getElementById('correo').readOnly = true;
  // document.getElementById('fecha').readOnly = true;
  document.getElementById('celular').readOnly = true;
  document.getElementById('editar').style.display = "inline-block";
  document.getElementById('cancelar').style.display = "none";
  document.getElementById('enviar').style.display = "none";

  let texto = "Cancelado";
  dataAlertMessage(texto, 'info', 'top-end', 3000);
}

function enviar(){
  document.getElementById('nombre').readOnly = true;
  document.getElementById('apellidos').readOnly =true;
  // document.getElementById('correo').readOnly = true;
  // document.getElementById('fecha').readOnly = true;
  document.getElementById('celular').readOnly = true;
  document.getElementById('editar').style.display = "inline-block";
  document.getElementById('cancelar').style.display = "none";
  document.getElementById('enviar').style.display = "none";

<<<<<<< HEAD
</script>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>


function modal(){
    Swal.fire(
      'Revisa tu correo',
        'Enviamos un correo para cambiar tu contraseña',
      'success'
    )
}


</script>


dd(session('id'));
=======
  let texto = "Actualizado correctamente";
  dataAlertMessage(texto, 'success', 'top-end', 3000);
}

</script>

<style>
  .profileIcon{
    font-size: 180px;
    color: {{$profile->avatar}};
  }
  input[type="color"]{
    padding: 20px;
  }
  label[for="avatarhexauser"]{
    text-align: right;
    cursor: pointer;
    border-radius: 100%;
    width: 40px;
    height: 40px;
    background: {{$profile->avatar}};
  }
  label[for="avatarhexauser"]:hover{
    background: {{$profile->avatar}}80;
  }
</style>

{{-- dd(session('id')); --}}
>>>>>>> 846dca3b6a20ecbcf5ecf0e61dd660a8d8ed32fe

<div class="container pt-5 mt-5">
    <div class="main-body pt-4 ">
            <div class="row gutters-sm">
                <div class="col-md-4 mb-3">
                  <div class="card">
                    <div class="card-body">
                      <div class="d-flex flex-column align-items-center text-center">

                        <i class="fa-solid fa-circle-user d-sm-none d-lg-block d-md-block profileIcon"></i>

                        <div class="mt-3 col-12">
                          <label for="avatarhexauser" class="float-right"></label>
                          <input type="color" name="" value="#353535" id="avatarhexauser" class="d-none">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-8">
                  <div class="card mb-3">
                    <div class="card-body">
                      <div class="row">

                        <div class="container">
                            <form method="post" action="{{ url('perfil/update/'. session('id')) }}" id="profile" class="d-grid mb-4">
                                @csrf
                                <div class="form-group">
                                    <label class="letra">Nombres:</label>
                                    <input type="text" class="form-control letra" id="nombre" name="name" aria-describedby="emailHelp" placeholder=""  value="{{$profile->name}}" readOnly required pattern="[A-Za-z- ]*" autocapitalize="words">
                                </div>
                                <div class="form-group">
                                  <label class="letra">Apellidos:</label>
                                  <input type="text" class="form-control letra" id="apellidos" name="lastName" aria-describedby="emailHelp" placeholder=""  value="{{$profile->lastName}}" readOnly required pattern="[A-Za-z- ]*" autocapitalize="words">
                                </div>
                                <div class="form-group">
                                    <label class="letra">Correo electronico:</label>
                                    <input type="text" class="form-control letra" id="correo" name="email" aria-describedby="emailHelp" placeholder=""  value="{{$profile->email}}" readOnly required>
                                </div>
                                <div class="form-group">
                                    <label class="letra">Fecha de cumpleaños:</label>
                                    <input type="date" class="form-control letra" id="fecha" name="birthDate" aria-describedby="emailHelp" placeholder=""  value="{{$profile->birthDate}}" readOnly required>
                                </div>
                                <div class="form-group">
                                    <label class="letra">Celular:</label>
                                    <input type="text" class="form-control letra" id="celular" name="phone" aria-describedby="emailHelp" placeholder=""  value="{{$profile->phone}}" readOnly required>
                                </div>
                            </form>
                                <div class="col-sm-12">
                                    <button onclick ="editar()" id ="editar" class="btn btn-outline-ping"><i class="bi bi-pen-fill" ></i> Editar</button>
                                    <button onclick ="cancelar()" id ="cancelar" style="display: none" class="btn btn-outline-ping"><i class="bi bi-x-lg"> Cancelar</i></button>
<<<<<<< HEAD
                                    <button type="submit" onclick="enviar()" id ="enviar" style="display: none" class="btn btn-outline-success" form="profile"><i class="bi bi-check2-all" width="1 em" height="1 em"> Enviar</i></button>
                                    
                                    <!--Aqui envio el correo para que se le pueda enviar una notificacion al mismo--->
                                    <form method="post" action="{{route('password.email')}}">
                                        @csrf
                                        <button type="submit" onclick="modal()" class="btn btn-outline-ping"><i class="bi bi-check2-all" width="1 em" height="1 em">Cambiar contraseña</i></a>                                    
                                        <input type="text" name="email" value="{{$profile->email}}" hidden>
                                    </form>
                                    
=======
                                    {{-- <button type="" onclick="enviar()" id ="enviar" style="display: none" class="btn btn-outline-success" form="profile"><i class="bi bi-check2-all" width="1 em" height="1 em"> Enviar</i></button> --}}
                                    <button type="" onclick="enviar()" id ="enviar" style="display: none" class="btn btn-outline-success"><i class="bi bi-check2-all" width="1 em" height="1 em"> Enviar</i></button>
>>>>>>> 846dca3b6a20ecbcf5ecf0e61dd660a8d8ed32fe
                                </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
            </div>
        </div>
    </div>

@endsection
