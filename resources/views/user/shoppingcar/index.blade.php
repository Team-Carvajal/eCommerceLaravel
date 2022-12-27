@extends('user.layouts.index')
@section('title', 'Carrito')
@section('content')
<style>
    .inproduct, .inproduct:focus{
        border: 0 solid;
        outline: none;
        width: 40px;
    }
    .inselect {
        outline: none !important;
        border: 0 solid !important;
        font-size: 14px !important;
        padding: 0 !important;
        pointer-events: none !important;
        -webkit-appearance: none;
        -moz-appearance: none;
        cursor: text !important;
    }

</style>


<br>
<section class="h-100 h-custom mt-5 pt-5">
    <div class="container py-5 h-100 shadow rounded-lg" style="background-color: #ffff;">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col">
          <div class="card">
            <div class="card-body p-4">
              <div class="row">
                <div class="col-lg-7">
                    <h5 class="mb-3">
                        <a href="" class="text-body">
                            <i class="fas fa-long-arrow-alt-left me-2"></i>
                            Carrito de compras
                        </a>
                    </h5>
                  <hr>
                  <div class="d-flex justify-content-between align-items-center mb-4">
                    <div class="d-flex">
                      <p class="mb-0" id="carQuantity">Tienes 0 Productos en el carrito</p>
                    </div>
                  </div>
                    <div class="accordion" id="productsInCar">

                    </div>

                </div>
                <div class="col-lg-5 ">
                  <div class="card text-white rounded-3 shadow-sm bg-light">
                    <div class="card-body">
                      <div class="d-flex justify-content-between align-items-center mb-4">
                        <h5 class="mb-0 text-dark">Sección de pago</h5>
                        <img src="{{ url('assets/images/icon/iconUser.svg') }}"
                          class="img-fluid rounded-3" style="width: 45px;" alt="Avatar">
                      </div>

                      <hr class="my-4">
                      <div class="d-flex justify-content-between ">
                        <p class="mb-2">Subtotal</p>
                        <p class="mb-2" id="total">$</p>
                      </div>
                      <div>

                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</section>

<script>
        document.getElementsByClassName("edit").addEventListener('click', function(e){
        alert();
        })
</script>
<script>
    let data = @json($data);
</script>
<script src="{{ url('assets/js/shoppingCar.js')}}"></script>

@endsection
