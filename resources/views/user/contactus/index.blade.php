@extends('user.layouts.index')
@section('title', 'Contactanos')
@section('content')

<!-- ***** Subscribe Area Starts ***** -->
<br>
<section class="our-services">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-heading">
                    </div>
                </div>
                <div class="col-lg-4" heigh='30'>
                    <div class="service-item">
                    <h4>Sobre nosotros</h4>
                        <!-- <p>Somos una tienda de camisas estampadas<br><br><br></p> -->
                        <p>{{$data['aboutus']}}</p>
                    </div>
                </div>
                <div class="col-lg-4"  heigh='30'>
                    <div class="service-item">
                        <h4>Misión</h4>
                    <!-- <p>Ofrecer un servicio eficaz de todo tipo de prendas de buena calidad y en buen estado para satisfacer las necesidades de nuestros clientes.</p> -->
                    <p>{{$data['mission']}}</p>
                        </div>
                    </div>
                    <div class="col-lg-4"  height='30'>
                        <div class="service-item">

                            <h4>Visión</h4>
                            <!-- <p>Convertir mi tienda en una de las más conocidas y poder llevar mis productos a todo el país y al extranjero. <br><br> </p> -->
                            <p>{{$data['vision']}}</p>

                    </div>
                </div>
            </div>
        </div>
    </section>
<div class="subscribe espacio">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="section-heading">
                        <h2>Contactanos y estampa tus ideas en tú próxima camisa favorita!</h2>
                        <span>En ping te ofrecemos un servicio personalizado de camisas</span>
                        <!-- <span><br>--Escribemos un correo o envianos un mensaje a whatsapp--</span> -->
                    </div>
                    <!-- <form id="subscribe" action="" method="get"> -->
                    <form>
                        <div class="row">

                                <div class="col-lg-12">
                                    <fieldset>
                                    <textarea name="message" rows="6" id="wapp-message" placeholder="Dejanos un mensaje" style="height: 150px; width: 650px;"></textarea>
                                       <button type="submit" style="position: absolute;top:68%;" id="form-submit-wapp" class="main-dark-button"><i class="bi bi-cursor"></i></button>
                                    </fieldset>
                                </div>
                        </div>
                    </form>
                </div>

                <div class="col-lg-4">
                        <div class="col-6">
                            <ul>
                                <li>Disponiblidad:<br><span>07:30 AM - 9:30 PM Lunes a viernes</span></li>
                                </span></li>
                                <span>Email:<br></span><a href= "https://mail.google.com/mail/u/0/?tab=rm&ogbl#inbox?compose=CllgCJfsctWTqvBXsNCdPVMtFXfLglsMlCQHxcrTHNQQxKsfWNZrSWBpbBKPNLDfKtFRCQQRDpg"target="_blank"><i ></i>pingep@gmail.com</a></span><br><br>
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
