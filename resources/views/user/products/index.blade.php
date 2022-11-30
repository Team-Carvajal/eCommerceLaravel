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
                @foreach($data as $products)
                @foreach($products->colors as $detail)
                @if ($loop->first)
                    <div class="col-lg-4 ">
                        <form action="{{url('/carrito/agregar')}}" method="post">
                            @csrf
                            <div class="item">
                                <div class="thumb">
                                    <div class="hover-content">
                                        <ul>
                                            <li><a href="{{$name . '/' . str_replace(' ' , '-', (strtolower($products->name)))}}"><i class="fa fa-eye"></i></a></li>

                                            <!-- AQUI CARRITO  -->
                                            <li><a href="/ping/carrito"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    @if(isset($detail->product_color->image))
                                        <img src="{{ url('assets/images/productosparatesteo/'.$detail->product_color->image) }}" alt="{{ $products->name }} - {{ $detail->name }} ">
                                    @else
                                    {{-- Poner una imagen por defecto aqui, en caso de que no haya imagen --}}
                                        <img src="{{ url('assets/images/') }}" alt="">
                                    @endif
                                </div>
                                <div class="down-content ">
                                    <input type="hidden" value="{{$products->id}}" name="product_id">
                                    <h4 class="">{{$products->name}}</h4>
                                    <input type="hidden" value="{{$products->price}}" name="product_price">
                                    <span> {{$products->price}}</span>
                                </div>
                            </div>
                        </form>
                    </div>
                @endif
                @endforeach
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
