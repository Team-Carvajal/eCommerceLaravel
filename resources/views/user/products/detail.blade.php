@extends('user.layouts.index')
@section('title', ucfirst(strtolower($data['product']->name)) )
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

    @for ($i = 0; $i < count($data['product']->colors); $i++)
    .colores label[for="c-{{$data['product']->colors[$i]->name}}"]{
        background-color: {{$data['product']->colors[$i]->color}};
    }
    @endfor

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

        <div class="mb-4 float-start fs-6">
            <a  href="/categorias" class="text-dark">Categorias</a>
            /
            <a  href="/categoria/{{ strtolower($data['product']->categories[0]->name)}}" class="text-dark">{{$data['product']->categories[0]->name}}</a>
            /
            <a class="text-dark">{{str_replace(' ' , '-', strtolower($data['product']->name) )}}</a>
        </div>

        <div class=" d-md-grid d-grid d-lg-flex container-fluid ">

            <div class=" col-lg-6 col-md-10 col-sm-12 col-12 mx-auto d-grid mb-md-5 mb-5">
                <div class="d-flex">
                    <div class="col-10 img-product mx-auto left-images">
                        <img src="
                        @php
                            $color = explode('/', ("$_SERVER[REQUEST_URI]"));
                            $color = $color[4];
                        @endphp
                        {{
                            url('assets/images/productos/'. $data['product']->colors[0]->product_color->image );
                        }}"
                    alt=""
                    id="imageview">
                    </div>
                </div>
            </div>

            <div class=" col-lg-6 col-md-10 col-sm-12 col-12 mx-auto d-grid ">

                <div class="d-grid bg-white pt-5 rounded shadow-sm p-3">

                    <div class="right-content col-12 col-sm-12 mx-auto">

                        <form action="{{url('/carrito/agregar')}}" method="post" id="product">

                            <div class="mb-5">
                                <h3 class="mb-2">{{$data['product']->name}}</h3>
                                <span class="price">
                                    ${{number_format($data['product']->price, 0, ',', '.')}}
                                </span>
                            </div>

                            <span>{{$data['product']->description}}</span>

                            <div class="quantity-content">

                                    <div class="d-grid mb-3">
                                        <span>Color: <span id="pcolor"></span></span>
                                        <div class="d-flex gap-2 mt-3 colores">

                                            @for ($i = 0; $i < count($data['product']->colors); $i++)
                                                <label
                                                    class="shirtColor"
                                                    for="c-{{$data['product']->colors[$i]->name}}">
                                                </label>
                                                <input
                                                    value="{{ucfirst($data['product']->colors[$i]->name)}}.{{$data['product']->colors[$i]->id}}"
                                                    type="radio"
                                                    name="color"
                                                    id="c-{{$data['product']->colors[$i]->name}}"
                                                    hidden
                                                    required>
                                            @endfor

                                        </div>
                                    </div>

                                    <div class="d-grid">

                                        <span>Talla: <span id="ptalla"></span></span>
                                        <div class="d-flex gap-2 mt-3">
                                            <div>

                                                @for($i = 0; $i < count($data['product']->sizes); $i++)
                                                    <label
                                                        class="btn btn-outline-danger shirtSize"
                                                        for="t-{{$data['product']->sizes[$i]->size}}">
                                                        {{$data['product']->sizes[$i]->size}}
                                                    </label>
                                                    <input
                                                        type="radio"
                                                        name="talla"
                                                        id="t-{{$data['product']->sizes[$i]->size}}"
                                                        value=" {{$data['product']->sizes[$i]->size}}.{{$data['product']->sizes[$i]->id}}.{{$data['product']->sizes[$i]->pivot->stock}}"
                                                        hidden
                                                        required>
                                                @endfor

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
                        </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    if($("::input[]")){
        alert()
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
</script>



@endsection
