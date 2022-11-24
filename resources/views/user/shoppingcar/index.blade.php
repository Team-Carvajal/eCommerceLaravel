@extends('user.layouts.index')
@section('title', 'Carrito')
@section('content')
<br>
<section class="h-100 h-custom mt-5 pt-5" >
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
                    <p class="mb-0">Tienes 0 Productos en el carrito </p>
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
                          <h5>Nombre producto 1</h5>
                          <p class="small mb-0">Descripcion...</p>
                        </div>
                      </div>
                      <div class="d-flex flex-row align-items-center">
                        <div style="width: 50px;" class="d-grid">
                          <h5 class="fw-normal mb-0">0</h5>
                        </div>
                        <div style="width: 80px;">
                          <h5 class="mb-0">$</h5>
                        </div>
                        <a href="#!" style="color: #cecece;"><i class="fas fa-trash-alt"></i></a>
                      </div>
                    </div>
                  </div>
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
                      <p class="mb-2">$</p>
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
                      
                      {{-- <script src="https://www.paypal.com/sdk/js?client-id=test&currency=USD"></script>
                          <!-- Set up a container element for the button -->
                          <div id="paypal-button-container" class=""></div>
                          <script>
                            paypal.Buttons({
                              // Sets up the transaction when a payment button is clicked
                              createOrder: (data, actions) => {
                                return actions.order.create({
                                  purchase_units: [{
                                    amount: {
                                      value: '77.44' // Can also reference a variable or function
                                    }
                                  }]
                                });
                              },
                              // Finalize the transaction after payer approval
                              onApprove: (data, actions) => {
                                return actions.order.capture().then(function(orderData) {
                                  // Successful capture! For dev/demo purposes:
                                  console.log('Capture result', orderData, JSON.stringify(orderData, null, 2));
                                  const transaction = orderData.purchase_units[0].payments.captures[0];
                                  alert(`Transaction ${transaction.status}: ${transaction.id}\n\nSee console for all available details`);
                                  // When ready to go live, remove the alert and show a success message within this page. For example:
                                  // const element = document.getElementById('paypal-button-container');
                                  // element.innerHTML = '<h3>Thank you for your payment!</h3>';
                                  // Or go to another URL:  actions.redirect('thank_you.html');
                                });
                              }
                            }).render('#paypal-button-container');
                      </script> --}}
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
</section>
@endsection
