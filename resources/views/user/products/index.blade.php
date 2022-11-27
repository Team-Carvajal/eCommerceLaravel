@extends('user.layouts.index')
@section('title', '')
@section('content')

<!-- ***** Products Area Starts ***** -->
    <section class="section" id="products">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-heading">
                    @foreach ($data as $category)
                        <h2>{{ $category->name}}</h2>
                        <span>Ropa a tu gusto</span>
                @endforeach

                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">

                @foreach ($data as $product)
                <div class="col-lg-4">
                    <div class="item">
                        <div class="thumb">
                            <div class="hover-content">
                                <ul>
                                    <li><a href="single-product.html"><i class="fa fa-eye"></i></a></li>
                                    <!-- <li><a href="single-product.html"><i class="fa fa-star"></i></a></li> -->

                                    <!-- AQUI CARRITO  -->
                                    <li><a href="single-product.html"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <img src="assets/images/men-01.jpg" alt="">
                        </div>
                        <div class="down-content">
                            <h4>{{ $product->name}}</h4>
                            <span>$ {{ $product->price}}</span>
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
