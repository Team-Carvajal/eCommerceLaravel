@extends('index')
@section('content')

<script>

function editar(){
document.getElementById('nombre').readOnly = false;
document.getElementById('apellidos').readOnly = false;
document.getElementById('correo').readOnly = false;
document.getElementById('fecha').readOnly = false;
document.getElementById('celular').readOnly = false;    
document.getElementById('editar').style.display = "none";    
document.getElementById('cancelar').style.display = "inline-block";


document.getElementById('cancelar').style.display = "inline-block";    

}

function cancelar(){
document.getElementById('nombre').readOnly = true;
document.getElementById('apellidos').readOnly =true;
document.getElementById('correo').readOnly = true;
document.getElementById('fecha').readOnly = true;
document.getElementById('celular').readOnly = true;    
document.getElementById('editar').style.display = "inline-block";    
document.getElementById('cancelar').style.display = "none";    
}

function enviar(){
document.getElementById('nombre').readOnly = true;
document.getElementById('apellidos').readOnly =true;
document.getElementById('correo').readOnly = true;
document.getElementById('fecha').readOnly = true;
document.getElementById('celular').readOnly = true;    
document.getElementById('editar').style.display = "inline-block";    
document.getElementById('cancelar').style.display = "none";  
}


</script>



<div class="container pt-5 mt-5">
    <div class="main-body pt-4 ">
            <div class="row gutters-sm">
                <div class="col-md-4 mb-3">
                  <div class="card">
                    <div class="card-body">
                      <div class="d-flex flex-column align-items-center text-center">
                        <!-- <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin" class="rounded-circle" width="150"> -->
                        <img src="{{ url('assets/images/icon/iconUser.svg')}}" alt="Admin" class="rounded-circle" width="150">
                        <div class="mt-3">
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
                            <form >
                                <div class="form-group">
                                    <label class="letra">Nombres:</label>
                                    <input type="text" class="form-control letra" id="nombre" aria-describedby="emailHelp" placeholder="" readonly >
                                </div>
                                <br>
                                <div class="form-group">
                                  <label class="letra">apellidos:</label>
                                  <input type="text" class="form-control letra" id="apellidos" aria-describedby="emailHelp" placeholder="" readonly >
                                </div>
                                <br>
                                <div class="form-group">
                                    <label class="letra">Correo electronico:</label>
                                    <input type="text" class="form-control letra" id="correo" aria-describedby="emailHelp" placeholder="" readonly >
                                </div>
                                <br>
                                <div class="form-group">
                                    <label class="letra">fecha de cumpleaños:</label>
                                    <input type="date" class="form-control letra" id="fecha" aria-describedby="emailHelp" placeholder="" readonly >
                                </div>
                                <br>
                                <div class="form-group">
                                    <label class="letra">celular:</label>
                                    <input type="text" class="form-control letra" id="celular" aria-describedby="emailHelp" placeholder="" readonly >
                                </div>
                            </form>
                            <br>
                            <div class="col-sm-12">
                            <button onclick ="editar()" id ="editar" class="btn btn-outline-ping"><i class="bi bi-pen-fill"></i></button>
                            <button onclick ="cancelar()" id ="cancelar" style="display: none" class="btn btn-outline-ping"><i class="bi bi-x-lg"></i></button>
                            <button onclick="enviar()" id ="enviar" class="btn btn-outline-primary"><i class="bi bi-send-fill"></i></button>
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
