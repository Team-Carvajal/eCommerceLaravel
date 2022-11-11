@extends('index')
@section('content')
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
                                    <label class="letra">Nombre completo:</label>
                                    <input type="text" class="form-control letra" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" readonly>
                                </div>
                                <br>
                                <div class="form-group">
                                    <label class="letra">Correo electronico:</label>
                                    <input type="text" class="form-control letra" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" readonly>
                                </div>
                                <br>
                                <div class="form-group">
                                    <label class="letra">Fecha de nacimiento:</label>
                                    <input type="datetime" class="form-control letra" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" readonly>
                                </div>
                                <br>
                                <div class="form-group">
                                    <label class="letra">Movil:</label>
                                    <input type="text" class="form-control letra" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" readonly>
                                </div>
                            </form>
                            <br>
                            <div class="col-sm-12">
                            <a class="btn btn-outline-ping" target="__blank" ><i class="bi bi-pen-fill"></i></a>
                            <a class="btn btn-outline-primary" target="__blank"><i class="bi bi-send-fill"></i></a>
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