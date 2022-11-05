<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <link rel="stylesheet" href="{{ url('assets/css/login-registro.css')}}">
    <link rel="icon" href="{{ url('assets/images/icon/isotipo1x.svg') }}" type="image/x-icon">
    <link rel="stylesheet" href="{{ url('assets/css/templatemo-hexashop.css')}}">

    <style>
        .back{
            position: fixed;
            top: 10px; 
            left: 20px;
            z-index: 3;
        }
        .back a i{
            text-shadow: 0 0 10px #00000050;
        }
    </style>
</head>
<body>
    <!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    <!-- ***** Preloader End ***** -->
    <div>
        <div class=" d-grid">
            <div class=" blur col-lg-4 col-md-6 col-sm-8 col-11 m-auto di-flex v-100 my-lg-4 my-md-4 my-sm-4
             my-3 shadow rounded-2em">
                <div class="shadow-inset col-12 borde d-grid">
                    <div class="col-sm-11 col-md-11 my-auto mx-auto col-xs-11 col-11">
                        <div class="m-auto col-11">
                            <form>
                                <div class="">
                                    <div class="mb-5 mt-5" >
                                        <h1 class="fs-lg-1 text-lg-center text-center">Registrate</h1>
                                    </div>
                                    <div class="col-11 mx-auto">

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
                                    <div class="container d-flex gap-md-2 gap-2 mb-5">
                                        <p class="fw-normal"> Ya tienes una cuenta?</p>
                                        <a href="/inicio-de-sesion" class="text-dark fw-semibold">Inicia sesión</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="back">
        <a href="/"><i class="bi bi-arrow-left-square-fill fs-1 text-white"></i></a>
    </div>
    <div class="background-login">
        <img src="{{ url('assets\images\background-login-01.svg')}}" alt="">
    </div>

         <!-- Plugins -->
         <script src="{{ url('assets/js/popper.js')}}"></script>
            <script src="{{ url('assets/js/owl-carousel.js')}}"></script>
            <script src="{{ url('assets/js/accordions.js')}}"></script>
            <script src="{{ url('assets/js/datepicker.js')}}"></script>
            <script src="{{ url('assets/js/scrollreveal.min.js')}}"></script>
            <script src="{{ url('assets/js/waypoints.min.js')}}"></script>
            <script src="{{ url('assets/js/jquery.counterup.min.js')}}"></script>
            <script src="{{ url('assets/js/imgfix.min.js')}}"></script> 
            <script src="{{ url('assets/js/slick.js')}}"></script> 
            <script src="{{ url('assets/js/lightbox.js')}}"></script> 
            <script src="{{ url('assets/js/isotope.js')}}"></script> 
            
            <!-- Global Init -->
            <script src="{{ url('assets/js/custom.js')}}"></script>
            
            <script>
                
                $('.modal').on('shown.bs.modal', function() {
                    $(this).css("z-index", parseInt($('.modal-backdrop').css('z-index')) + 1);
                });

                $(function() {
                    var selectedClass = "";
                    $("p").click(function(){
                    selectedClass = $(this).attr("data-rel");
                    $("#portfolio").fadeTo(50, 0.1);
                        $("#portfolio div").not("."+selectedClass).fadeOut();
                    setTimeout(function() {
                    $("."+selectedClass).fadeIn();
                    $("#portfolio").fadeTo(50, 1);
                    }, 500);
                    
                    });
                });
                
                function modalBuscar(){
                    // alert('Hola');
                    }


            </script>
        <!-- Plugins -->
        
    
</body>
</html>