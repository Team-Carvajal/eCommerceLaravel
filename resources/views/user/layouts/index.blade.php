<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
        <title>Ping - @yield('title')</title>
        <!-- CSS & JS Files Start-->
            <link rel="icon" href="{{ url('assets/images/icon/isotipo1x.svg') }}" type="image/x-icon">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="{{ url('assets/css/bootstrap.min.css')}}" rel="stylesheet">
            <link rel="stylesheet" type="text/css" href="{{ url('assets/css/font-awesome.css')}}">
            <link rel="stylesheet" href="{{ url('assets/css/templatemo-hexashop.css')}}">
            <link rel="stylesheet" href="{{ url('assets/css/home/banner.css')}}">
            <link rel="stylesheet" href="{{ url('assets/css/home/carousel1.css')}}">
            <link rel="stylesheet" href="{{ url('assets/css/about-us/about-us.css')}}">
            <link rel="stylesheet" href="{{ url('assets/css/fonts-reset.css')}}">
            <link rel="stylesheet" href="{{ url('assets/css/global-styles.css')}}">
            <link rel="stylesheet" href="{{ url('assets/css/owl-carousel.css')}}">
            <link rel="stylesheet" href="{{ url('assets/css/lightbox.css')}}">
            <link rel="stylesheet" href="{{ url('assets/css/header-footer/header.css')}}">
            <link rel="stylesheet" href="{{ url('assets/css/header-footer/footer.css')}}">
            <link rel="stylesheet" href="{{ url('assets/css/shopping-car/car.css')}}">
            <link rel="stylesheet" href="{{ url('assets/css/product.css')}}">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
            <style>
                    a.textfloat:hover::after {
                    content: "Perfil";
                    position: absolute;
                    font-size: 12px;
                    top: 130%;
                    left: -30px;
                    padding: 0 40px;
                    border-radius: 1em;
                    border: 1px solid white;
                    color: #f0f0f0;
                    background-color: #3d3d3d;
                    }
            </style>
            <!-- CSS & JS Files End-->
    </head>
    <body class="text-bg-light">
        <!-- ***** Preloader Start ***** -->
            <div id="preloader">
                <div class="jumper">
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </div>
        <!-- ***** Preloader End ***** -->
        <!-- ***** Header Area Start ***** -->
            <header class="header-area header-sticky shadow-sm position-fixed">
                <div class="mx-lg-5 mx-0 mx-sm-0 mx-md-5">
                    <div class="row">
                        <div class="col-12">
                            <nav class="main-nav">
                                <!-- ***** Logo Start ***** -->
                                <a href="/home" class="logo">
                                    <div class="logoPingCont d-grid">
                                        <div class="rounded-4 d-flex pe-3 px-3">
                                            <img class="logoPing pe-2" src="{{ url('assets/images/icon/isotipo1x.svg')}}">
                                            <img class="logoPing" src="{{ url('assets/images/icon/logotipo1x.svg')}}">
                                        </div>
                                    </div>
                                </a>
                                <ul class="nav">

                                    {{-- <li class="m-auto"> --}}
                                        {{-- <span class="font m-auto"> --}}
                                            {{-- {{session('name')}} --}}
                                        {{-- </span> --}}

                                    </li>
                                    <li>
                                        <a>
                                            <button type="button" class="btn btn-outline-ping search-bg" data-bs-toggle="modal" data-bs-target="#buscar" onclick="modalBuscar()">
                                                <span class="font">
                                                    Buscar
                                                </span>
                                            </button>
                                        </a>
                                    </li>


                                    <li class="submenu font">
                                        <a href="javascript:;" class="">Ver más <i class="down ms-4"></i></a>
                                        <ul>
                                            <li><a href="/categorias"><i><img src="{{ url('assets/images/icon/border-all.svg')}}" width="14px" class="mx-2" alt=""></i>Categorias</a></li>
                                            <li><a href="/carrito"><i><img src="{{ url('assets/images/icon/cart2.svg')}}" width="14px" class="mx-2" alt=""></i>Carrito</a></li>

@unless(Auth::check())

                                            <li><a href="/registro"><i><img src="{{ url('assets/images/icon/iconUser.svg')}}" width="14px" class="mx-2" alt=""></i>Registrate</a></li>
@endunless
                                            <!-- <li><a href="/sobre-nosotros"><i><img src="{{ url('assets/images/icon/people-fill.svg')}}" width="14px" class="mx-2" alt=""></i>Sobre nosotros</a></li> -->
                                            <li><a href="/contactanos"><i><img src="{{ url('assets/images/icon/person-lines-fill.svg')}}" width="14px" class="mx-2" alt=""></i>Contactanos</a></li>

                                            @auth
                                                <li><a href="/logout"><i><img src="{{ url('assets/images/icon/person-lines-fill.svg')}}" width="14px" class="mx-2" alt=""></i>Salir</a></li>
                                            @endauth

                                        </ul>
                                    </li>

@if(Auth::check())
                                    <li>
                                        {{-- <a href="{{"/perfil" . "/" . str_replace(' ' , '-', (strtolower(session('name'))))}} " title="" class="textfloat"> --}}
                                        <a href="{{"/perfil" . "/" . session('id') }} " title="" class="textfloat">
                                            <i>
                                                <img src="{{ url('assets/images/icon/iconUser.svg')}}" class="mx-sm-2 login-icono d-sm-none d-lg-block d-md-block" alt="">
                                            </i>
                                            <span class="d-lg-none d-md-none">
                                               Ingresa a tu perfil
                                            </span>
                                        </a>
                                    </li>
@else
                                        <li>
                                        <a href="/login" title="">
                                            <i>
                                                <img src="{{ url('assets/images/icon/iconUser.svg')}}" class="mx-sm-2 login-icono d-sm-none d-lg-block d-md-block" alt="">
                                            </i>
                                            <span class="d-lg-none d-md-none font">
                                                Ingresa
                                            </span>
                                        </a>
                                    </li>
@endif


                                      <!-- <li class="d-grid">
                                            <a href="/login" class="m-auto">
                                                    <i class="d-flex">
                                                        <img src="{{ url('assets/images/icon/iconUser.svg')}}" width="14px" class="mx-sm-2" alt="">
                                                        <p class="">Inicia sesión</p>
                                                    </i>
                                            </a>
                                        </li> -->
                                </ul>
                                <a class='menu-trigger'>
                                    <span>Menu</span>
                                </a>
                                <!-- Modal -->

                                <!-- ***** Menu End ***** -->
                            </nav>
                        </div>
                    </div>
                </div>
            </header>
        <!-- ***** Header Area End ***** -->
        <!-- ***** Modal Global Start ***** -->
            <div class="modal fade col-12"  id="buscar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"  >
                <div class="modal-dialog modal-dialog-centered ">
                <div class="modal-content modalSearch shadow-lg">
                    <div class="modal-body d-flex align-items-center col-12 justify-content-end">
                        <div class="col-6 me-2">
                            <h1 class="modal-title fs-4  text-light " id="exampleModalLabel">Buscar</h1>
                        </div>
                        <div class="col-1">
                            <button type="button" class="btn-close m-2" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                    </div>
                    <div class="modal-body">
                        <div class="input-group flex-nowrap shadow-lg">
                            <input type="text" class="form-control" placeholder="Buscar.." aria-label="Username" aria-describedby="addon-wrapping">
                            <span class="input-group-text iconSearch" id="addon-wrapping" role="button"><img class="" src="{{ url('assets/images/icon/search.svg')}}" alt=""></span>
                        </div>
                    </div>
                </div>
                </div>
            </div>
        <!-- ***** Modal Global Start ***** -->
        <!-- ***** Body Banner Area Start ***** -->
            @yield('content')
        <!-- ***** Body Banner Area End ***** -->
        <!-- ***** Footer Start ***** -->
        <footer >
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="first-item">
                            <div class="logo">
                                <img class="logoPing pe-2" src="{{ url('assets/images/icon/isotipo1x.svg')}}">
                                <img class="logoPing pe-2" src="{{ url('assets/images/icon/logotipo1x.svg')}}">
                            </div>
                            <ul>
                                <li><a href="/">Ping Estampados Personalizados</a></li>
                                <li><a href="#" id="correo">pingep@gmail.com</a></li>
                                <li><a href="#" id="whatsapp">+57 315 855 9229</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 categorias--">
                        <h4>Tienda &amp; Categorías</h4>
                        <ul>
                            <li><a href="#">Hombres</a></li>
                            <li><a href="#">Mujeres</a></li>
                            <li><a href="#">Niños</a></li>
                            <li><a href="#">Otros</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3 enlaces-de-la-pagina--">
                        <h4>Enlaces de la página</h4>
                        <ul>
                            <li><a href="/home">Inicio</a></li>

                            <li><a href="/categorias">Categorías</a></li>
                            <li><a href="/registro">Registrate</a></li>
                            <li><a href="/">Inicia sesión</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3 ayuda-informacion">
                        <h4>Ayuda e Información</h4>
                        <ul>
                            <li><a href="" id="helpwha">Ayuda</a></li>
                            <li><a href="/contactanos#about-us">Sobre nosotros</a></li>
                            <li><a href="/contactanos">Contactanos</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-12">
                        <div class="under-footer">
                            <p>Copyright © 2022 Ping Estampados Personalizados. All Rights Reserved.

                            <br>Diseño: <a target="_parent" title="" class="text-ping">TPS1-114</a></p>
                            <ul>
                                <li><a href="https://github.com/Team-Carvajal"><i class="bi bi-github"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    <!-- ***** Footer End ***** -->
        <!-- Plugins -->
            <script src="{{ url('assets/js/popper.js')}}"></script>
            <script src="{{ url('assets/js/owl-carousel.js')}}"></script>
            <script src="{{ url('assets/js/accordions.js')}}"></script>
            <script src="{{ url('assets/js/datepicker.js')}}"></script>
            <script src="{{ url('assets/js/scrollreveal.min.js')}}"></script>
            <!-- <script src="{{ url('assets/js/waypoints.min.js')}}"></script> -->
            <!-- <script src="{{ url('assets/js/jquery.counterup.min.js')}}"></script> -->
            <script src="{{ url('assets/js/imgfix.min.js')}}"></script>
            <script src="{{ url('assets/js/slick.js')}}"></script>
            <script src="{{ url('assets/js/lightbox.js')}}"></script>
            <script src="{{ url('assets/js/isotope.js')}}"></script>
            <script src="{{ url('assets/js/quantity.js')}} "></script>

            <script>
            document.querySelector("").addEventListener("keypress", function (evt) {
            if (evt.which != 8 && evt.which != 0 && evt.which < 48 || evt.which > 57)
            {
                evt.preventDefault();
            }
            });
            </script>

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
                        <script>

                            $('#helpwha').click(function(){

                                let num = '+573158559229';
                                let msg = 'Hola, necesito hacer una consulta';

                                var win = window.open(`https://wa.me/${num}?text=${msg}`, '_blank');

                            });

                        </script>
        <!-- Plugins -->

    </body>
</html>
