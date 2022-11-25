@extends('user.layouts.index')
@section('title', 'Home')
@section('content')

<!-- ***** Main Banner Area Start ***** -->
    <div class="main-banner carousel-products espacio" id="top">
        <div class="container-fluid">
            <div class="row">

                <div class="col-lg-6">
                    <div class="left-content">
                        <div class="thumb ban-1">
                            <div class="inner-content">
                                <h4 class="">Ahora tendras tu prenda favorita!</h4>
                                <span>Prueba nuestros sistema de diseños personalizados</span>
                                <div class="main-border-button">
                                    <a href="/contactanos">Escribenos</a>
                                </div>
                            </div>
                            {{-- @foreach ($joincolor as $joinimage ) --}}
                                {{-- @if ($joinimage->product_id == 3 && $joinimage->shirtcolor_id == 2 ) --}}
                                    <img src="{{ url('assets/images/productosparatesteo/00.jpg')}}" alt="" class="banner-1">
                                {{-- @endif --}}
                            {{-- @endforeach --}}
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="right-content">
                        <div class="row">
                            @foreach ($productbanner as $categories)
                                @if ($categories->id <= 3)
                                    <div class="col-lg-6">
                                        <div class="right-first-image">
                                            <div class="thumb">
                                                <div class="inner-content">
                                                    <h4>{{ ucfirst($categories->name) }}</h4>
                                                    <span>{{ $categories->description }}</span>
                                                </div>
                                                <div class="hover-content">
                                                    <div class="inner">
                                                        <h4>{{ ucfirst($categories->name) }}</h4>
                                                        <p>{{ $categories->description }}</p>
                                                        <div class="main-border-button">
                                                            <a href="/{{ $categories->name }}">Ver más</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <img src="{{ url('assets/images/' . $categories->image) }}" class="banner-2">
                                            </div>
                                        </div>
                                    </div>
                                @endif
                            @endforeach


                            <div class="col-lg-6">
                                <div class="right-first-image">
                                    <div class="thumb">
                                        <div class="inner-content">
                                            <h4>Otros</h4>
                                            <span>Soprendete con nuestros productos!</span>
                                        </div>
                                        <div class="hover-content">
                                            <div class="inner">
                                                <h4>Otros</h4>
                                                <p>Soprendete con nuestros productos!</p>
                                                <div class="main-border-button">
                                                    <a href="#">Ver más</a>
                                                </div>
                                            </div>
                                        </div>
                                        <img src="{{ url('assets/images/baner-right-image-04.jpg') }}" class="banner-2">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


<!-- ***** Main Banner Area End ***** -->
<!-- ***** Carousel Area Starts ***** -->
{{-- @isset ($joincolor) --}}
    {{-- {{$cantidad = count($joincolor)}} --}}
    {{-- @foreach ($joincolor as $ca ) --}}
        {{-- {{($ca->shirtcolor_id)}} --}}
    {{-- @endforeach --}}
    {{-- {{$joincolor}} --}}
{{-- @endisset --}}
    @foreach ($productbanner as $categories)
        <section class="section carousel-products" id="men">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7">
                        <div class="section-heading">
                            <h2>Mejores productos en {{$categories->name}}</h2>
                            <span>Los mejores estampados para {{ $categories->name }}</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="men-item-carousel">
                            <div class="owl-men-item owl-carousel">

                                @foreach ($joincolor as $joc)
                                        @foreach ($product as $pro)
                                            @if($joc->product_id == $pro->id)
                                                @foreach ($pro->JoinCategories as $ca)
                                                    @if ($categories->id == $ca->prodcategories->category_id)
                                                        @if ($ca->prodcategories->product_id == $pro->id)
                                                            <div class="item">
                                                                <div class="thumb">
                                                                    <div class="hover-content">
                                                                        <ul>
                                                                            <li><a href="/producto/{{str_replace(' ' , '-', (strtolower($pro->name)))}}"><i class="fa fa-eye"></i></a></li>
                                                                            <li><a href="/producto"><i class="fa fa-shopping-cart"></i></a></li>
                                                                        </ul>
                                                                    </div>
                                                                    <img src="{{ url('assets/images/productosparatesteo/'.$joc->image)}}"alt="" class="pd-carousel">
                                                                </div>
                                                                <div class="down-content bg-transparent">
                                                                        <h4 class="pe-3">{{$pro->name}}</h4>
                                                                    <span>${{number_format($pro->price, 0, ',', '.')}}</span>
                                                                </div>
                                                            </div>
                                                        @endif
                                                    @endif
                                                @endforeach
                                            @endif
                                        @endforeach
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    @endforeach


    <!-- ***** Carousel Area Ends ***** -->
    <!-- ***** Explore Area Starts ***** -->
    {{-- <section class="section" id="explore">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                    <div class="left-content">
                        <h2>Explore Our Products</h2>
                        <span>You are allowed to use this HexaShop HTML CSS template. You can feel free to modify or edit this layout. You can convert this template as any kind of ecommerce CMS theme as you wish.</span>
                        <div class="quote">
                            <i class="fa fa-quote-left"></i><p>You are not allowed to redistribute this template ZIP file on any other website.</p>
                        </div>
                        <p>There are 5 pages included in this HexaShop Template and we are providing it to you for absolutely free of charge at our TemplateMo website. There are web development costs for us.</p>
                        <p>If this template is beneficial for your website or business, please kindly <a rel="nofollow" href="https://paypal.me/templatemo" target="_blank">support us</a> a little via PayPal. Please also tell your friends about our great website. Thank you.</p>
                        <div class="main-border-button">
                            <a href="products.html">Discover More</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="right-content">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="leather">
                                    <h4>Leather Bags</h4>
                                    <span>Latest Collection</span>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="first-image">
                                    <img src="{{ url('assets/images/explore-image-01.jpg')}}" alt="">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="second-image">
                                    <img src="{{ url('assets/images/explore-image-02.jpg')}}" alt="">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="types">
                                    <h4>Different Types</h4>
                                    <span>Over 304 Products</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> --}}
    <!-- ***** Explore Area Ends ***** -->

@endsection