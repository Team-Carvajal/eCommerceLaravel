@extends('user.layouts.index')
@section('title', 'Carrito')
@section('content')
<br>
<section class="h-100 h-custom mt-5 pt-5" >
    @foreach($data as $bill)
      <div class="container py-5 h-100 shadow rounded-lg" style="background-color: #ffff;">
        <div class="row d-flex justify-content-center align-items-center h-100">
          <div class="col">
            <div class="card">
              <div class="card-body p-4">
                <div class="row">
                  <div class="col-lg-7">
                    <h5 class="mb-3"><a href="#!" class="text-body"><i
                          class="fas fa-long-arrow-alt-left me-2"></i>Carrito de compras</a></h5>
                    <hr>
                    <div class="d-flex justify-content-between align-items-center mb-4">
                      <div>
                        <p class="mb-0">Tienes {{$bill->orders_count}} Productos en el carrito </p>
                      </div>
                      <div>
                        <p class="mb-0">
                            <span class="text-muted">
                                Organizar por:
                                <select name="" id="" class="border-0 btn">
                                    <option class="" value="">Precio</option>
                                    <option class="" value="">Tamaño</option>
                                    <option class="" value="">Color</option>
                                </select>
                            </span>
                        </p>
                      </div>
                    </div>

                    {{-- Inicio de card --}}
                    @foreach($bill->orders as $order)
                    @foreach($order->products as $product)
                    <div class="card mb-3 shadow-sm">
                      <div class="card-body">
                        <div class="d-flex justify-content-between">
                          <div class="d-flex flex-row align-items-center">
                            <div>
                              <img
                                src="{{ url('assets/images/icon/isotipo1x.svg')}}"
                                class="img-fluid rounded-3" alt="Shopping item" style="width: 65px;">
                            </div>
                            <div class="ms-3">
                              <h5>{{$product->name}}</h5>
                              <p class="small mb-0">{{$product->description}}  </p>
                            </div>
                          </div>
                          <div class="d-flex flex-row align-items-center">
                            <form action="{{ url('/carrito/actualizar/'.$product->id) }}" method="post">
                              @csrf
                            <div style="width: 140px;" class="d-grid">
                              <h5 class="fw-normal mb-0">${{$product->price}}</h5>
                              <h5 class="fw-normal mb-0">${{$order->product_price}}</h5>
                            </div>
                            <div style="width: 140px;" class="d-grid">
                              <input type="number" name="quantity" class="col-7" value={{$order->quantity}} maxlength="11">
                            </div>
                            <button type="submit" style="color: #ffffff;" class="fas fa-trash-alt">🎇</button>
                            <a href="{{ url('/carrito/remover/'.$product->id) }}" style="color: #ffffff;"><i class="fas fa-trash-alt">💣</i></a>
                          </form>
                          </div>
                        </div>
                      </div>
                    </div>
                    @endforeach
                    @endforeach
                    {{-- Fin de Card --}}
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
                          <p class="mb-2">{{ $bill->subTotal }} $</p>
                        </div>
                        <div class="d-flex justify-content-between">
                          <p class="mb-2">Shipping</p>
                          <p class="mb-2">$</p>
                        </div>

                        <div class="d-flex justify-content-between mb-4">
                          <p class="mb-2">Total(Incl. taxes)</p>
                          <p class="mb-2">$</p>
                        </div>

                        <!-- <button type="button" class="btn btn-info btn-block btn-lg">
                          <div class="d-flex justify-content-between">
                            <span>$</span>
                            <span>Comprobar<i class="fas fa-long-arrow-alt-right ms-2"></i></span>
                          </div>
                        </button> -->
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
      </div>
      @endforeach
    </section>
@endsection
