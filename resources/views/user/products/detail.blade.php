@extends('user.layouts.index')
<?php $product = str_replace('-' , ' ', (ucfirst($product)))?>
<?php $shirttype = str_replace('-' , ' ', (ucfirst($shirttype)))?>
@section('title', $shirttype . "-" . $product )
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

    @php foreach ($color as $colors){
    .colores label[for="c-<?php echo $colors->name; ?>"]{
        background-color: {{$colors->color}};
    }
    } @endphp

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




</style>

<div class="mt-5 pt-5 container-fluid">
    <div class="mt-4 container-fluid">

{{-- ///////////////////// --}}
{{-- <div>
    <input type="text" value="" id="color">
    <span id="colo" class=""></span>
    <input type="button" value="" onclick="ver()">
</div>

<script>
    var Colorvalue = document.querySelector("#color");
</script> --}}


{{-- ///////////////////// --}}

        <div class="mb-4  float-start fs-6">
            <a href="/categorias" class="text-dark">Categorias</a>
            <a href="/{{$categoryname}}" class="text-dark">>{{$categoryname}}</a>
            <a href="/{{$categoryname}}/{{str_replace(' ' , '-', (strtolower($shirttype . "/" . $product)))}}" class="text-dark">>{{str_replace(' ' , '-', (ucfirst($shirttype)))}}</a>
        </div>
            <div class=" d-md-grid d-grid d-lg-flex container-fluid">
                <div class=" col-lg-6 col-md-10 col-sm-12 col-12 mx-auto d-grid mb-md-5 mb-5">
                    <div class="d-flex">
                        <div class="d-inline">
                            @foreach ($color as $colors)
                            @foreach( $productcolor as $procolor)
                                    @if ($procolor->shirtcolor_id == $colors->id)
                                    <label class="shirtColor miniatura mb-2 me-2" for="c-{{$colors->name}}">
                                        <img src="{{ url('assets/images/productosparatesteo/'. $procolor->image) }} " alt="" class="{{$colors->name . "" . $colors->id }}">
                                    </label>
                                        {{-- <label class="shirtColor" for="c-{{$colors->name}}"></label> --}}
                                        {{-- <input value="{{ucfirst($colors->name)}}" hidden type="radio" name="color" id="c-{{$colors->name}}"> --}}
                                    @endif
                            @endforeach
                            @endforeach
                        </div>
                        <div class="col-10 img-product mx-auto left-images">
                            @foreach ($color as $colors)
                            @foreach( $productcolor as $procolor)
                                    @if ($procolor->shirtcolor_id == $colors->id)
                                        <img src="{{ url('assets/images/productosparatesteo/'. $procolor->image) }} " alt="">
                                    @endif
                            @endforeach
                            @endforeach
                        </div>
                    </div>
                </div>
                <div class=" col-lg-6 col-md-10 col-sm-12 col-12 mx-auto  d-grid">
                    <div class="d-grid">
                        <div class="right-content col-12 col-sm-12 mx-auto">
                            <div class="mb-5">
                                {{-- <ul class="stars d-flex float-end gap-1">
                                    <li><i class="fa fa-star text-ping"></i></li>
                                    <li><i class="fa fa-star text-ping"></i></li>
                                    <li><i class="fa fa-star text-ping"></i></li>
                                    <li><i class="fa fa-star text-ping"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                </ul> --}}
                                <h3 class="mb-2">{{$shirttype . "-" . $product}}</h3>
                                <span class="price">${{number_format($products->price, 0, ',', '.')}}</span>
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
                                                    <input value="{{ucfirst($colors->name)}}" hidden type="radio" name="color" id="c-{{$colors->name}}">
                                                @endif
                                        @endforeach
                                        @endforeach
                                    </div>
                                </div>
                                <div class="d-grid">
                                    <span>Talla: <span id="ptalla"></span></span>
                                    <div class="d-flex gap-2 mt-3">
                                        <div>
                                            @foreach ($size as $sizes)
                                            @foreach ($productsize as $prosize )
                                                @if ($prosize->shirtsize_id == $sizes->id)
                                                    <label class="btn btn-outline-danger shirtSize" for="t-{{$sizes->sizes}}">{{$sizes->sizes}}</label>
                                                @endif
                                            @endforeach
                                            @endforeach

                                        </div>
                                        <div id="radio-talla">
                                            @foreach ($size as $sizes)
                                                <input hidden type="radio" name="talla" id="t-{{$sizes->sizes}}"   value="{{$sizes->sizes}}"  >
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                                <div class="d-grid d-lg-flex mt-4">
                                    <div class="col-12 col-sm-12 col-lg-6 d-grid">
                                        <span class="fs-6 my-auto">Cantidad:</span>
                                    </div>
                                    <div class="quantity buttons_added col-6 d-grid">
                                        <div class="mx-lg-auto mx-md-auto">
                                            <input type="button" value="-" class="minus"><input type="number" step="1" min="1" max="" name="quantity" value="1" title="Qty" class="input-text qty text" size="4" pattern="" inputmode=""><input type="button" value="+" class="plus">
                                        </div>
                                        <div class="d-grid mt-2">
                                            <span class="fs-6 text-lg-center text-md-center">({{$products->quantity}}) Unidades disponibles</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="total">
                                <h4 class="mb-3">Total: ${{number_format($products->price, 0, ',', '.')}}</h4>
                                <div class="main-border-button text-center "><a href="#">Añadir al carrito</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>




<script>
    let pColor = document.querySelector('#pcolor');
    let color = document.querySelector('#color');
    let pTalla = document.querySelector('#ptalla');
    let radioTalla = document.querySelector('#radio-talla');
    if (document.querySelector('input[name="color"]')) {
        document.querySelectorAll('input[name="color"]').forEach((elem) => {
        elem.addEventListener("change", function(event) {
            var item = event.target.value;
            pColor.innerHTML = item;
            color.setAttribute('value', item);
        });
      });
    }
    if (document.querySelector('input[name="talla"]')) {
        document.querySelectorAll('input[name="talla"]').forEach((elem) => {
        elem.addEventListener("change", function(event) {
            var tItem = event.target.value;
            pTalla.innerHTML = tItem;
            var talla = document.querySelector(`label[for='t-${tItem}']`);
            // alert(talla.getAttribute("for"));
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
    })
    })

</script>

@endsection
