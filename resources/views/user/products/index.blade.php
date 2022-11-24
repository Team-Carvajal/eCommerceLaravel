@extends('user.layouts.index')
@section('title', '')
@section('content')

<!-- ***** Products Area Starts ***** -->
    <div class="contenedorPadre mt-5 pt-5">
        <section class="section mt-4" id="products">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-heading">
                            <h2>Todos Los Productos</h2>
                            <span>Aqui puedes encontrar todos los productos de la tienda</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="item">
                            <div class="thumb">
                                <div class="hover-content">
                                    <ul>
                                        <li><a href="single-product.html"><i class="fa fa-eye"></i></a></li>
                                        <li><a href="single-product.html"><i class="fa fa-star"></i></a></li>
                                        <li><a href="single-product.html"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <img src="{{ url('assets/images/men-01.jpg') }}" alt="" class="pd-carousel">
                            </div>
                            <div class="down-content">
                                <h4>Classic Spring</h4>
                                <span>$120.00</span>
                                <ul class="stars">
                                    <li><i class="fa fa-star"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="pagination">
                            <ul>
                                <li>
                                    <a href="#">1</a>
                                </li>
                                <li class="active">
                                    <a href="#">2</a>
                                </li>
                                <li>
                                    <a href="#">3</a>
                                </li>
                                <li>
                                    <a href="#">4</a>
                                </li>
                                <li>
                                    <a href="#">></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
<!-- ***** Products Area Ends ***** -->

@endsection
