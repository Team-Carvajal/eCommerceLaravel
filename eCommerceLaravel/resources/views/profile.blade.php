@extends('index')
@section('content')
<style>
    .rounded-1em{
        border-radius: 1.5em; 
    }
    /* .foto-perfil{
        overflow: hidden;
    } */
    .foto-perfil{
        content: "";
        width: 300px;
        height: 300px;
        background: #353535;
        /* background: url('{{ url('assets/images/baner-right-image-02.jpg')}}'); */
        background-size: cover;
        border-top-right-radius: 1.5em;
        border-top-left-radius: 1.5em;
        transition: 1s;
    }

    .info-user{
        color: #444041;
        /* background: #ff0052; */
        /* background: #444041; */
    }
    label[for="Ufoto-perfil"]{
        width: 300px;
        transition: 1s;
    }

    .btn-ping{
        /* border-radius: 0 !important; */
        background-color: #da0045;
        border-top-right-radius: 0;
        border-top-left-radius: 0;
        border-bottom-right-radius: 1.5em;
        border-bottom-left-radius: 1.5em;
        text-align: center;
        color: #ffff;
        cursor: pointer;
    }
    .btn-ping:hover{
        /* border-radius: 0 !important; */
        background-color: #ff0052;
        color: #ffff;
        cursor: pointer;
    }
    .imagen-camara{
        margin: auto;
        content: "";
        /* background: url('{{ url('assets/images/icon/camera-fill.svg')}}'); */
        width: 100px;
        height: 100px;
        background-size: cover;
    }

    @media (max-width: 576px) {
        .foto-perfil{
            content: "";
            width: 200px;
            height: 200px;
            background: #353535;
            /* background: url('{{ url('assets/images/baner-right-image-02.jpg')}}'); */
            background-size: cover;
            border-top-right-radius: 1.5em;
            border-top-left-radius: 1.5em;
            transition: 1s;
        }
        label[for="Ufoto-perfil"]{
            width: 200px;
            transition: 1s;
    }
    }

</style>
<div class="container-fluid d-grid mt-5 pt-5 ">
    <div class="m-auto d-lg-flex d-md-grid col-12 pt-4  container">
        <div class="col-12 col-lg-7 col-md-12 pb-5 mb-5 ">
            <div class="col-12">
                <!-- imagen de perfil -->
                <div class="d-grid">
                    <div class="foto-perfil mx-auto d-grid">
                        <div class="imagen-camara"></div>
                    </div>
                    <label for="Ufoto-perfil" class="btn-ping py-2 m-auto">Subir una foto</label>
                </div>
                <input type="file" hidden id="Ufoto-perfil" class="">
                <!-- ultimo pedido -->
            </div>
    
        </div>
        <div class="col-12 col-md-12 col-lg-5 col-sm-12 col-xs-12 d-grid  mx-auto ">
            <div class="col-12 col-md-8 col-lg-12 col-sm-8  h-100 m-auto shadow py-5 rounded-1em info-user bg-white">
                <div class="d-grid px-4">
                    <h2 class="mb-5">Datos del Usuario</h2>
                    <label for="">Nombre de usuario:</label>
                    <label for="">....</label>
                    <label for="">Nombres:</label>
                    <label for="">....</label>
                    <label for="">Apellidos:</label>
                    <label for="">....</label>
                    <label for="">Fecha de cumpleaños:</label>
                    <label for="">....</label> 
                    <label for="" class="espacio"></label>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection