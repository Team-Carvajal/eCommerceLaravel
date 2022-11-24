@extends('user.layouts.index')
@section('title', 'Contactanos')
@section('content')

<!-- ***** Subscribe Area Starts ***** -->
<br><br><br><br><br><br>
<div class="subscribe espacio">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="section-heading">
                        <h2>Contactanos y estampa tus ideas en tú próxima camisa favorita!</h2>
                        <span>En ping te ofrecemos un servicio personalizado de camisas</span>
                        <!-- <span><br>--Escribemos un correo o envianos un mensaje a whatsapp--</span> -->
                    </div>
                    <form id="subscribe" action="" method="get">
                        <div class="row">
                                <div class="col-lg-6">
                                    <fieldset class="d-flex">
                                        <input name="email" type="text" id="email" pattern="[^ @]*@[^ @]*" placeholder="Escribenos un correo" class="text-dark" >
                                        <button type="submit" id="form-submit-email" class="main-dark-button"><i class="fa fa-paper-plane"></i></button>
                                    </fieldset>
                                </div>
                                <div class="col-lg-6">
                                    <fieldset class="d-flex">
                                        <input name="email" type="text" id="wapp-message" pattern="[^ @]*@[^ @]*" placeholder="Escribenos un mensaje" required="" class="text-dark">
                                        <button type="submit" id="form-submit-wapp" class="main-dark-button"><i class="fa fa-whatsapp"></i></button>
                                    </fieldset>
                                </div>
                        </div>
                    </form>
                </div>

                <div class="col-lg-4">
                        <div class="col-6">
                            <ul>
                                <li>Disponiblidad:<br><span>07:30 AM - 9:30 PM Lunes a viernes</span></li>
                                <li>Email:<br><span>pingep@gmail.com</span></li>
                                <li>Redes Sociales:<br>
                                    <span>
                                        <a href="https://www.instagram.com/estampados_personalizado_1025/" target="_blank"><i class="bi bi-instagram"></i> Instagram</a>
                                    </span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- ***** Subscribe Area Ends ***** -->
<script>

    $('#form-submit-wapp').click(function(){

        let num = '+573158559229';
        let msg = document.getElementById("wapp-message").value;

        var win = window.open(`https://wa.me/${num}?text=${msg}`, '_blank');

    });

</script>
@endsection
