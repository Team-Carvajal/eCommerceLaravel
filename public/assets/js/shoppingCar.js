
    $('#carQuantity').html(`Tienes ${data[0]['orders_count']} Productos en el carrito`);
    setTimeout(function(){
        for (let i = 0; i < data[0]['orders_count']; i++) {

            productOrders = Object.values(data[0]['orders'][i]);
            productOrders = JSON.parse(productOrders[2]);
            // console.log(data[0]['orders'][i]['product_id']);
            $('#total').html('$' + Intl.NumberFormat('es-ES').format(data[0]['subTotalCop']));

            // console.log(productOrders);

            $('#productsInCar').append(`
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingOne">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${i}" aria-expanded="true" aria-controls="collapse${i}">
                                <img src="assets/images/productos/${productOrders['image']}.jpg" alt="" height="100px" class="pe-3 view">
                                <div class="d-grid gap-1">
                                    <span class="pb-3">${productOrders['nameproduct']}</span>
                                    <span class="small">Color: ${productOrders['nameColor']}</span>
                                    <span class="small">Precio unitario: $${Intl.NumberFormat('es-ES').format(productOrders['product_price'])}</span>
                                    <span class="small">Subtotal: $${Intl.NumberFormat('es-ES').format(productOrders['product_price'] * productOrders['quantity'])}</span>
                                </div>
                        </button>
                    </h2>

                        <div id="collapse${i}" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="ms-3">
                                    <table class="table table-borderless">
                                        <tr class="small">
                                            <td>
                                                Tipo de impresión:
                                            </td>
                                            <td>
                                                ${productOrders['print']}
                                            </td>
                                        </tr>
                                        <tr class="small">
                                            <td>
                                                Tipo de Camisa:
                                            </td>
                                            <td>
                                                ${productOrders['type']}
                                            </td>
                                        </tr>
                                        <tr class="small">
                                            <td>
                                                Color:
                                            </td>
                                            <td>
                                                <select name="" id="" class="small inselect" aria-label="Default select example">
                                                    <option value="${productOrders['nameColor']}" class="">${productOrders['nameColor']}</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr class="small">
                                            <td>
                                                Cantidad:
                                            </td>
                                            <td>
                                                <input type="number" name="" id="quantity" class="inproduct " value="${productOrders['quantity']}" readonly>
                                            </td>
                                        </tr>
                                        <tr class="small">
                                            <td>
                                                Talla:
                                            </td>
                                            <td>
                                                <select name="" id="" class="small inselect" aria-label="Default select example">
                                                    <option value="${productOrders['nameSize']}" class="">${productOrders['nameSize']}</option>
                                                </select>

                                            </td>
                                        </tr>
                                        <tr class="small">
                                            <td>
                                                Precio individual:
                                            </td>
                                            <td>
                                                $${Intl.NumberFormat('es-ES').format(productOrders['product_price'])}
                                            </td>
                                        </tr>
                                        <tr class="small">
                                            <td>
                                                Precio total por producto:
                                            </td>
                                            <td>
                                                $${Intl.NumberFormat('es-ES').format(productOrders['product_price'] * productOrders['quantity'])}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="/carrito/remover/${data[0]['orders'][i]['product_id']}" class="btn btn-outline-dark"><i class="bi bi-trash-fill"></i></a>
                                                <button class="btn btn-outline-dark edit" ><i class="fa-solid fa-pencil"></i></button>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            `);
        }
            }, 0);

