@extends('user.layouts.index')
@section('title', ucfirst($name))
@section('content')

<!-- ***** Products Area Starts ***** -->
    <section class="section espacio pt-5 " id="products">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-heading">
                        <h2>{{$name}}</h2>
                        <span>Ropa a tu gusto</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="container pt-5">
            <div class="row">

            @foreach ($data as $product)
                <div class="col-lg-4">
                    <div class="item">
                        <div class="thumb">
                            <div class="hover-content">
                                <ul>
                                    <li><a href="{{$name . '/' . str_replace(' ' , '-', (strtolower($product->name)))}}"><i class="fa fa-eye"></i></a></li>
                                    <!-- <li><a href="single-product.html"><i class="fa fa-star"></i></a></li> -->

                                    <!-- AQUI CARRITO  -->
                                    <li><a href="/ping/carrito"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <img src="assets/images/men-01.jpg" alt="">
                        </div>
                        <div class="down-content centradito">
                            <h4>{{ $product->name}}</h4>
                            <span>$ {{ $product->price}}</span>
                        </div>
                    </div>
                </div>
            @endforeach



                <div class="col-lg-12">
                    <div class="pagination">
                        <ul>
                            <li class="active">
                                <a href="#">1</a>
                            </li>
                            <li>
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
<!-- ***** Products Area Ends ***** -->

@endsection
