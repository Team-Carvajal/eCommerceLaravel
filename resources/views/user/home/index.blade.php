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
                                    <img src="{{ url('assets/images/productosparatesteo/00.jpg')}}" alt="" class="banner-1">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="right-content">
                        <div class="row">
                            @foreach ($category as $categories)
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
@php
    $pro = "";
    $image = "";
@endphp

{{-- @endisset --}}
    @foreach($category as $categories => $category)
        @php
            // $limitProduct = count($category->products) <= 8 && count($category->products) >= 4
        @endphp
    {{-- @if ($limitProduct) --}}
        <section class="section carousel-products">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7">
                        <div class="section-heading">
                            <h2>Mejores productos en {{$category->name}}</h2>
                            <span>Los mejores estampados para {{ $category->name }}</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="men-item-carousel">
                            <div class="owl-men-item owl-carousel">

                                <div class="item">
                                    <div class="thumb">
                                        <div class="hover-content">
                                            <ul>
                                                <li><a href="/producto/{{str_replace(' ' , '-', (strtolower($pro)))}}"><i class="fa fa-eye"></i></a></li>
                                                <li><a href="/producto"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <img src="{{ url('assets/images/productos/'.$image)}}"alt="" class="pd-carousel">
                                    </div>
                                    <div class="down-content bg-transparent">
                                            <h4 class="pe-3">{{$pro}}</h4> {{--nombre--}}
                                        {{-- <span>${{number_format($pro, 0, ',', '.')}}</span> precio --}}
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        {{-- @endif --}}
    @endforeach



@endsection
