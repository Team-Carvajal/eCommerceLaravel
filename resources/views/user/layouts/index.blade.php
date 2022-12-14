<!DOCTYPE html>
<html lang="es">
    <head>
        @extends('user.layouts.head')
        
        <!-- CSS & JS Files Start-->
            {{-- imported from the web --}}
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
                <script src="https://unpkg.com/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
                <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/css/bootstrap.min.css" >
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
                <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/js/all.min.js"></script>
            {{-- imported from the web --}}

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

            <script src="{{ url('assets/js/sweetalert.js')}}"></script>

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

                .iconuser{
                    font-size: 45px;
                    color: {{session('avatar')}};
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

        @extends('user.layouts.header')

        @extends('user.layouts.modal')


        <!-- ***** content ***** -->
            @yield('content')
        <!-- ***** content ***** -->

        @extends('user.layouts.footer')


        <!-- Plugins -->

            <script src="{{ url('assets/js/owl-carousel.js')}}"></script>
            <script src="{{ url('assets/js/accordions.js')}}"></script>
            <script src="{{ url('assets/js/datepicker.js')}}"></script>
            <script src="{{ url('assets/js/scrollreveal.min.js')}}"></script>
            <script src="{{ url('assets/js/imgfix.min.js')}}"></script>
            <script src="{{ url('assets/js/slick.js')}}"></script>
            <script src="{{ url('assets/js/lightbox.js')}}"></script>
            <script src="{{ url('assets/js/isotope.js')}}"></script>
            <script src="{{ url('assets/js/quantity.js')}} "></script>
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
                    // mo
                }


            </script>
            <script>



                $('#addon-wrapping').click(function(){
                    let text = $('#text-search').val()
                    location.href = "/productos/search/"+text;

                });
                $('#text-search').keypress(function(event){
                    if (event.key === "Enter")
                    $('#addon-wrapping').click();
                });


                $('#helpwha').click(function(){

                    let num = '+573158559229';
                    let msg = 'Hola, necesito hacer una consulta';

                    var win = window.open(`https://wa.me/${num}?text=${msg}`, '_blank');

                });

            </script>
    <!-- Plugins -->

</body>
</html>
