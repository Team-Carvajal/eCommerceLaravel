@extends('user.layouts.index')
@section('title', 'Categorias')
@section('content')

<!-- ***** Main Banner Area Start ***** -->
<div class="main-banner carousel-products espacio" id="top">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-6">
                <div class="right-content">
                        <div class="col-lg-6">
                            <div class="right-first-image">
                                <div class="thumb">
                                    <div class="inner-content">
                                        <h4>Mujer</h4>
                                        <span>Lo mejor para las chicas</span>
                                    </div>
                                    <div class="hover-content">
                                        <div class="inner">
                                            <h4>Women</h4>
                                            <p>Lorem ipsum dolor sit amet, conservisii ctetur adipiscing elit incid.</p>
                                            <div class="main-border-button">
                                                <a href="#">Discover More</a>
                                            </div>
                                        </div>
                                    </div>
                                    <img src="{{ url('assets/images/women-03.jpg')}}" class="banner-2">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="right-first-image">
                                <div class="thumb">
                                    <div class="inner-content">
                                        <h4>Hombre</h4>
                                        <span>Lo mejor para los caballeros</span>
                                    </div>
                                    <div class="hover-content">
                                        <div class="inner">
                                            <h4>Men</h4>
                                            <p>Lorem ipsum dolor sit amet, conservisii ctetur adipiscing elit incid.</p>
                                            <div class="main-border-button">
                                                <a href="#">Discover More</a>
                                            </div>
                                        </div>
                                    </div>
                                    <img src="{{ url('assets/images/men-03.jpg')}}" class="banner-2">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="right-first-image">
                                <div class="thumb">
                                    <div class="inner-content">
                                        <h4>Niños</h4>
                                        <span>Viste con tus personajes favoritos!</span>
                                    </div>
                                    <div class="hover-content">
                                        <div class="inner">
                                            <h4>Kids</h4>
                                            <p>Lorem ipsum dolor sit amet, conservisii ctetur adipiscing elit incid.</p>
                                            <div class="main-border-button">
                                                <a href="#">Discover More</a>
                                            </div>
                                        </div>
                                    </div>
                                    <img src="{{ url('assets/images/single-product-02.jpg')}}" class="banner-2">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="right-first-image">
                                <div class="thumb">
                                    <div class="inner-content">
                                        <h4>Otros</h4>
                                        <span>Soprendete con nuestros productos!</span>
                                    </div>
                                    <div class="hover-content">
                                        <div class="inner">
                                            <h4>Accessories</h4>
                                            <p>Lorem ipsum dolor sit amet, conservisii ctetur adipiscing elit incid.</p>
                                            <div class="main-border-button">
                                                <a href="#">Discover More</a>
                                            </div>
                                        </div>
                                    </div>
                                    <img src="{{ url('assets/images/baner-right-image-04.jpg')}}" class="banner-2">
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ***** Main Banner Area End ***** -->

@endsection
