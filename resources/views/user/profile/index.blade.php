@extends('user.layouts.index')
@section('title', 'Perfil')
@section('content')


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
                            <form method="post" action="{{ url('perfil/update') }}" id="profile" class="d-grid mb-4">
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
                                    <label class="letra">Número identificación:</label>
                                    <input type="text" class="form-control letra" id="dni" name="phone" aria-describedby="emailHelp" placeholder=""  value="{{$profile->dni}}" readOnly required>
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
                                    <button id ="editar" class="btn btn-outline-ping"><i class="bi bi-pen-fill" ></i> Editar</button>
                                    <button id ="cancelar" style="display: none" class="btn btn-outline-ping"><i class="bi bi-x-lg"> Cancelar</i></button>
                                    <button type="button" id ="enviar" style="display: none" class="btn btn-outline-success" form="profile"><i class="bi bi-check2-all" width="1 em" height="1 em"> Enviar</i></button>
                                    {{-- <button type="submit" id ="enviar" style="display: none" class="btn btn-outline-success" form="profile"><i class="bi bi-check2-all" width="1 em" height="1 em"> Enviar</i></button> --}}

                                    <!--Aqui envio el correo para que se le pueda enviar una notificacion al mismo--->
                                    <form method="post" action="{{route('password.email')}}">
                                        @csrf
                                        <button type="submit" onclick="modal()" class="btn btn-outline-ping mt-3"><i class="bi bi-check2-all" width="1 em" height="1 em">Cambiar contraseña</i></a>
                                        <input type="text" name="email" value="{{$profile->email}}" hidden>
                                    </form>
                                </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
            </div>
        </div>
    </div>


    <script>

      let id = {{session('id')}};
      let parametros;

      $('#editar').click(function (){
          $('#nombre').removeAttr('readonly');
          $('#apellidos').removeAttr('readonly');
          $('#celular').removeAttr('readonly');
          $('#editar').css('display', 'none');
          $('#cancelar').css('display', 'inline-block');
          $('#enviar').css('display', 'inline-block');
      });

      $('#cancelar').click(function (){
          document.querySelector('#nombre').setAttribute('readonly', true);
          document.querySelector('#apellidos').setAttribute('readonly', true);
          document.querySelector('#celular').setAttribute('readonly', true);
          $('#editar').css('display', 'inline-block');
          $('#cancelar').css('display', 'none');
          $('#enviar').css('display', 'none');
          dataAlertMessage("Cancelado", 'info', 'bottom-end', 3000);
      });


      function getdata(){
        var name = $('#nombre').val();
        var lastName = $('#apellidos').val();
        var phone = $('#celular').val();

        request = {
          "id" : id,
          "name" : name,
          "lastName": lastName,
          "phone": phone
          };
      }

      $('#enviar').click(function (e) {
        getdata();
        var url = '/perfil/update';
        $.ajax({
          type: "POST",
          url: url,
          data: $("#profile").serialize(),

           success: function(data)
           {
            dataAlertMessage("Actualizado", 'success', 'bottom-end', 3000);
            document.querySelector('#nombre').setAttribute('readonly', true);
            document.querySelector('#apellidos').setAttribute('readonly', true);
            document.querySelector('#celular').setAttribute('readonly', true);
            $('#editar').css('display', 'inline-block');
            $('#cancelar').css('display', 'none');
            $('#enviar').css('display', 'none');
          }

       });
      });




    //   let datos = $.ajax({
    //         type:  'post',
    //         data:  data,
    //         url:   'profile.update',
    //         beforeSend: function () {
    //           dataAlertMessage("Procesando información", 'info', 'bottom-end', 3000);
    //         },
    //         success:  function (response) {
    //           dataAlertMessage("Actualizado", 'success', 'bottom-end', 3000);
    //         }
    //       });


        //   $.post("perfil/update/" + id,
        //   {
        //     name: $('#nombre'),
        //     lastName: $('#apellidos'),
        //     phone: $('#celular')
        //   },function(data){
        //     alert(data);
        //   });



      </script>

@endsection
