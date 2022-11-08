@extends('index')
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
    .color{
        width: 20px;
    }
    label[for="c-negro"]{
        background-color: #000000;
        width: 30px;
        height: 30px;
        border-radius: 100%;
    }
    label[for="c-blanco"]{
        background-color: #ffffff;
    }
    label[for="c-negro"]{
        background-color: #000000ff;
    }
    label[for="c-negro"]:hover{
        background-color: #00000099;
    }
    label[for="c-rojo"]{
        background-color: #ff0000;
    }
    label[for="c-azul"]{
        background-color: #0000ff;
    }
    .colorActive{
        box-shadow: 0 0 1px 5px #00000040 ;
    }
    label[for^="c-"]{
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
            <div class=" d-md-grid d-grid d-lg-flex container-fluid">
                <div class=" col-lg-6 col-md-10 col-sm-12 col-12 mx-auto d-grid mb-md-5 mb-5">
                    <div class="col-10 img-product mx-auto left-images">
                        <img src="{{ url('assets/images/women-03.jpg') }} " alt="">
                    </div>
                </div>
                <div class=" col-lg-6 col-md-10 col-sm-12 col-12 mx-auto  d-grid">
                    <div class="d-grid">
                        <div class="right-content col-12 col-sm-12 mx-auto">
                            <div class="mb-5">
                                <ul class="stars d-flex float-end gap-1">
                                    <li><i class="fa fa-star text-ping"></i></li>
                                    <li><i class="fa fa-star text-ping"></i></li>
                                    <li><i class="fa fa-star text-ping"></i></li>
                                    <li><i class="fa fa-star text-ping"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                </ul>
                                <h3 class="mb-2">Camisa estampada</h3>
                                <span class="price">$35.000</span>
                            </div>
                            <span>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod kon tempor incididunt ut labore.</span>
                            <div class="quantity-content">
                                <div class="d-grid mb-3">
                                    <span>Color: <span id="pcolor"></span></span>
                                    <div class="d-flex gap-2 mt-3">
                                        <label class="shirtColor" for="c-negro"></label>
                                        <label class="shirtColor" for="c-blanco"></label>
                                        <input value="Negro" hidden type="radio" name="color" id="c-negro">
                                        <input value="Blanco" hidden type="radio" name="color" id="c-blanco">
                                    </div>
                                </div>
                                <div class="d-grid">
                                    <span>Talla: <span id="ptalla"></span></span>
                                    <div class="d-flex gap-2 mt-3">
                                        <div>
                                            <label class="btn btn-outline-danger shirtSize" for="t-S">S</label>
                                            <label class="btn btn-outline-danger shirtSize" for="t-M">M</label>
                                            <label class="btn btn-outline-danger shirtSize" for="t-L">L</label>
                                            <label class="btn btn-outline-danger shirtSize" for="t-XS">XS</label>
                                            <label class="btn btn-outline-danger shirtSize" for="t-XL">XL</label>
                                            <label class="btn btn-outline-danger shirtSize" for="t-XXL">XXL</label>

                                        </div>
                                        <div id="radio-talla">
                                            <input hidden type="radio" name="talla" id="t-S"   value="S"  >
                                            <input hidden type="radio" name="talla" id="t-M"   value="M"  >
                                            <input hidden type="radio" name="talla" id="t-L"   value="L"  >
                                            <input hidden type="radio" name="talla" id="t-XS"  value="XS" >
                                            <input hidden type="radio" name="talla" id="t-XL"  value="XL" >
                                            <input hidden type="radio" name="talla" id="t-XXL" value="XXL">
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
                                            <span class="fs-6 text-lg-center text-md-center">(0) Unidades disponibles</span>
                                        </div>
                                    </div>
                                </div> 
                            </div>
                            <div class="total">
                                <h4 class="mb-3">Total: $35.000</h4>
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
    let pTalla = document.querySelector('#ptalla');
    let radioTalla = document.querySelector('#radio-talla');
    if (document.querySelector('input[name="color"]')) {
        document.querySelectorAll('input[name="color"]').forEach((elem) => {
        elem.addEventListener("change", function(event) {
            var item = event.target.value;
            pColor.innerHTML = item;
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