@extends('user.layouts.index')
<?php $product = str_replace('-' , ' ', (ucfirst($product)))?>
@section('title', $product )
@section('content')
<style>
    .img-product{
        overflow: hidden;
    }
    .img-product img{
        width: 100%;
        margin: auto;
        transition: .2s;
    }
    .img-product img:hover{
        transform: scale(1.1);
    }
    label.miniatura{
        height: 60px;
        width: 60px;
        border: 2px solid #2a2a2a55;
        overflow: hidden;
    }
    label.miniatura:hover{
        height: 60px;
        width: 60px;
        border: 2px solid #ff005260;
        box-shadow: 0 0 10px #ff005260;
        overflow: hidden;
    }
    label.miniatura:hover>.imagen{
        width: 80px;
        height: 80px;
    }
    label.miniatura img{
        width: 100%;
        object-fit: cover;
    }

    .color{
        width: 20px;
    }

    <?php foreach ($color as $colors){ ?>
    .colores label[for="c-<?php echo $colors->name; ?>"]{
        background-color: {{$colors->color}};
    }
    <?php } ?>

    .colorActive{
        box-shadow: 0 0 1px 5px #00000040 ;
    }
    .colores label[for^="c-"]{
        width: 30px;
        height: 30px;
        border-radius: 100%;
        border: 1px solid #2a2a2a55;
        cursor: pointer;
        filter: brightness(100%);
    }
    label[for^="c-"]:hover{
        cursor: pointer;
        filter: brightness(95%);
    }

    a:hover{
        text-decoration: underline !important;
    }


</style>

<div class="mt-5 pt-5 container-fluid">
    <div class="mt-4 container-fluid">

@php
    $shirtcolor_id = "";
    // $shirtcolor_name = [];
    $shirtcolor_image = [];
    $price = $products->price;
    $stock = [];
@endphp
@foreach ($color as $colors)
@foreach( $productcolor as $procolor)
        @if ($procolor->shirtcolor_id == $colors->id)
            @php $shirtcolor_image[ucfirst($colors->name)] = $procolor->image @endphp
            @php $shirtcolor_image[$colors->id] = $procolor->image @endphp
        @endif
@endforeach
@endforeach
        {{-- Inicio de enlaces--}}
        <div class="mb-4  float-start fs-6">
            <a  href="/categorias" class="text-dark">Categorias</a>
            /
            <a  href="/categoria/{{$categoryname}}" class="text-dark">{{$categoryname}}</a>
            /
            <a class="text-dark">{{str_replace(' ' , '-', $product)}}</a>
        </div>
        {{-- Fin de enlaces--}}

            <div class=" d-md-grid d-grid d-lg-flex container-fluid ">

                <div class=" col-lg-6 col-md-10 col-sm-12 col-12 mx-auto d-grid mb-md-5 mb-5">
                    <div class="d-flex">
                        <div class="col-10 img-product mx-auto left-images">
                            <img src="{{ url('assets/images/productos/'. $procolor->image )}}" alt="" id="imageview">
                        </div>
                    </div>
                </div>

                <div class=" col-lg-6 col-md-10 col-sm-12 col-12 mx-auto d-grid ">

                    <div class="d-grid bg-white pt-5 rounded shadow-sm p-3">

                        <div class="right-content col-12 col-sm-12 mx-auto">

                            {{-- <form action="{{url('/carrito/agregar')}}" method="post" id="product"> --}}
                                <div class="mb-5">
                                    <h3 class="mb-2">{{$product}}</h3>
                                    <span class="price">${{number_format($price, 0, ',', '.')}}</span>
                                </div>

                                <span>{{$products->description}}</span>

                                <div class="quantity-content">

                                        <div class="d-grid mb-3">
                                            <span>Color: <span id="pcolor"></span></span>
                                            <div class="d-flex gap-2 mt-3 colores">
                                                @foreach ($color as $colors)
                                                @foreach( $productcolor as $procolor)
                                                @if ($procolor->shirtcolor_id == $colors->id)
                                                    <label class="shirtColor" for="c-{{$colors->name}}"></label>
                                                    <input value="{{ucfirst($colors->name)}}.{{$colors->id}}" hidden type="radio" name="color" id="c-{{$colors->name}}" required>
                                                @endif
                                                @endforeach
                                                @endforeach
                                            </div>
                                        </div>

                                        <div class="d-grid">

                                            <span>Talla: <span id="ptalla"></span></span>
                                            <div class="d-flex gap-2 mt-3">
                                                <div>
                                                    {{--Product Sizes label --}}
                                                        @foreach ($size as $sizes)
                                                        @foreach ($productsize as $prosize )
                                                        @if ($prosize->shirtsize_id == $sizes->id)
                                                            <label class="btn btn-outline-danger shirtSize" for="t-{{$sizes->size}}">{{$sizes->size}}</label>
                                                            @php $stock[$prosize->shirtsize_id] = [$prosize->shirtsize_id, $prosize->stock] @endphp
                                                        @endif
                                                        @endforeach
                                                        @endforeach
                                                    {{--Product Sizes label --}}
                                                </div>
                                                <div id="radio-talla">
                                                    @foreach ($size as $sizes)
                                                        <input hidden type="radio" name="talla" id="t-{{$sizes->size}}" value="{{$sizes->size}}.{{$sizes->id}}" required>
                                                    @endforeach
                                                </div>
                                            </div>

                                        </div>
                                <form action="{{url('/carrito/agregar')}}" method="post">
                                        <div class="d-grid d-lg-flex mt-4">
                                            <div class="col-12 col-sm-12 col-lg-6 d-grid">
                                                <span class="fs-6 my-auto">Cantidad:</span>
                                            </div>
                                            <div class="quantity buttons_added col-6 d-grid">
                                                <div class="mx-lg-auto mx-md-auto">
                                                    <input type="button" value="-" class="minus" >
                                                    <input type="number" step="1" min="1" max="1" id="quantity" name="quantity" value="1" title="Qty" class="input-text qty text" size="4" pattern="" inputmode="">
                                                    <input type="button" value="+" class="plus" >
                                                </div>
                                                <div class="d-grid mt-2 d-flex">
                                                    <span class="fs-6 text-lg-center text-md-center me-1 quantityStock"></span>
                                                    <span class="fs-6 text-lg-center text-md-center"> Unidades disponibles</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="total">
                                        {{-- <h4 class="mb-3" id="total">Total : ${{number_format($price, 0, ',', '.')}}</h4> --}}
                                        <div class="main-border-button text-center ">
                                            <button class="btn text-center btn-outline-dark py-2 px-4" type="submit">Añadir al carrito</button>
                                        </div>
                                    </div>
                                </div>


                                    @csrf
                                {{-- --input price && productID-- --}}
                                <input type="hidden" required name="nameproduct" value="{{$product}}">
                                {{-- --input price && productID-- --}}
                                {{-- --input price && productID-- --}}
                                <input type="hidden" required name="product_id" value="{{$procolor->product_id}}">
                                <input type="hidden" required value="{{$price}}" name="product_price">
                                {{-- --input price && productID-- --}}
                                {{-- --input color-- --}}
                                <input type="hidden" required value="" name="idColor" id="idColor" size="2">
                                <input type="hidden" required value="" name="nameColor" id="nameColor" size="2">
                                {{-- --input color-- --}}
                                {{-- --input size-- --}}
                                <input type="hidden" required value="" id="idSize" name="idSize" size="2">
                                <input type="hidden" required value="" id="nameSize" name="nameSize" size="2">
                                {{-- --input size-- --}}
                                {{-- --input quantity-- --}}
                                <input type="hidden" required value="" name="" class="quantityStock" size="2">
                                {{-- --input quantity-- --}}



                            </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@php $limitProduct = count($category->products) <= 8 && count($category->products) >= 4 @endphp

@if ($limitProduct)
    <section class="section carousel-products">
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    <div class="section-heading">
                        <h2>Más productos para {{$category->name}}</h2>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="men-item-carousel">
                        <div class="owl-men-item owl-carousel">

                            @foreach($category->products as $product)
                            @php
                                $rand = rand(0, count($product->colors)-1);
                            @endphp
                                @foreach($product->colors as $key => $img)
                                @if($rand == $key)
                                        <div class="item bg-white p-3 pb-4 rounded shadow-sm">
                                            <div class="thumb">
                                                <div class="hover-content">
                                                    <ul>
                                                        <li><a href="{{'/' . 'categoria/' . $category->name . '/' . str_replace(' ' , '-', (strtolower($product->name)))}}"><i class="fa fa-eye"></i></a></li>
                                                    </ul>
                                                </div>
                                                <img src="{{ url('assets/images/productos/'. $img->product_color->image )}}" alt="" class="pd-carousel">
                                            </div>
                                            <div class="down-content bg-transparent">
                                                <h4 class="pe-3">{{$product->name}}</h4>
                                                <span>$ {{ $product->price}}</span>
                                            </div>
                                        </div>
                                    @endif
                                @endforeach
                            @endforeach

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    @endif

{{-- Start code scripts --}}
<script>

    let pColor = document.querySelector('#pcolor');
    let color = document.querySelector('#color');

    const colores = @json($shirtcolor_image);
    const stock = @json($stock);

    let pTalla = document.querySelector('#ptalla');
    let imageview = document.querySelector('#imageview');
    let radioTalla = document.querySelector('#radio-talla');
    let quantity = document.querySelector('#quantity');
    let total = document.querySelector('#total');
    let quant, quantityValue, item, tItem;

    document.querySelector('#quantity').addEventListener('input', function(){
        console.log(document.querySelector('#quantity').value)
    })


    function stockSearch(data){
        data = stock[data[1]];
        document.querySelector('.quantityStock').innerHTML = data[1];
        document.querySelector('input.quantityStock').setAttribute('value', data[1]);
        document.querySelector('#quantity').setAttribute('max', data[1]);
    }

    if (document.querySelector('input[name="color"]')) {
        document.querySelectorAll('input[name="color"]').forEach((elem) => {
        elem.addEventListener("change", function(event) {
            item = event.target.value;
            item = item.split('.');
            pColor.innerHTML = item[0];
            imageview.src = `{{url('assets/images/productos')}}/${colores[item[0]]}`;
            document.querySelector('#idColor').setAttribute('value', item[1]);
            document.querySelector('#nameColor').setAttribute('value', item[0].toLowerCase());
        });
    });
    }
    if (document.querySelector('input[name="talla"]')) {
        document.querySelectorAll('input[name="talla"]').forEach((elem) => {
            elem.addEventListener("change", function(event) {
                tItem = event.target.value;
                tItem = tItem.split('.');
                stockSearch(tItem);
                pTalla.innerHTML = tItem[0];
                document.querySelector(`label[for='t-${tItem[0]}']`);
                document.querySelector('#idSize').setAttribute('value', tItem[1]);
                document.querySelector('#nameSize').setAttribute('value', tItem[0]);

            });
        });
    }
    let shirtSize = document.querySelectorAll('label.shirtSize');
    // For each button, register an event listener
    shirtSize.forEach(function(elem){
        elem.addEventListener("click", function(e){
            // On click, remove the MyClass on ALL buttons
            shirtSize.forEach(function(el){
                el.classList.remove("active");
            });
            // Add the class on clicked one
            e.target.classList.add("active");

        })
    })
    let ShirtColor = document.querySelectorAll('label.shirtColor');
    // For each button, register an event listener
    ShirtColor.forEach(function(elem){
        elem.addEventListener("click", function(e){
            // On click, remove the MyClass on ALL buttons
        ShirtColor.forEach(function(el){
            el.classList.remove("colorActive");
        });
        // Add the class on clicked one
        e.target.classList.add("colorActive");


        // imageview.src = "item";
    })
    })

</script>

@endsection

