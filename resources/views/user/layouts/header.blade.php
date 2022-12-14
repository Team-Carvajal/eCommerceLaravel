<header class="header-area header-sticky shadow-sm position-fixed">
    <div class="mx-lg-5 mx-0 mx-sm-0 mx-md-5">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                        <a href="/home" class="logo">
                            <div class="logoPingCont d-grid">
                                <div class="rounded-4 d-flex pe-3 px-3">
                                    <img class="logoPing pe-2" src="{{ url('assets/images/icon/isotipo1x.svg')}}">
                                    <img class="logoPing" src="{{ url('assets/images/icon/logotipo1x.svg')}}">
                                </div>
                            </div>
                        </a>
                    <!-- ***** Logo End ***** -->

                    <!-- ***** Menu Start ***** -->
                        <ul class="nav">

                            <li>
                                <a>
                                    <button type="button" class="btn btn-outline-ping search-bg" data-bs-toggle="modal" data-bs-target="#buscar" onclick="modalBuscar()">
                                        <span class="font"> Buscar </span>
                                    </button>
                                </a>
                            </li>


                            <li class="submenu font">

                                <a href="javascript:;" class="">
                                    Ver más
                                    <i class="down ms-4"></i>
                                </a>
                                <ul>
                                    <li>
                                        <a href="/categorias">
                                            <i>
                                                <img src="{{ url('assets/images/icon/border-all.svg')}}" width="14px" class="mx-2" alt="">
                                            </i>
                                            Categorias
                                        </a>
                                    </li>
                                    @if(Auth::check())
                                    <li>
                                        <a href="/carrito">
                                            <i>
                                                <img src="{{ url('assets/images/icon/cart2.svg')}}" width="14px" class="mx-2" alt="">
                                            </i>
                                            Carrito
                                        </a>
                                    </li>
                                    @endif

                                    @unless(Auth::check())
                                    <li>
                                        <a href="/registro">
                                            <i>
                                                <img src="{{ url('assets/images/icon/iconUser.svg')}}" width="14px" class="mx-2" alt="">
                                            </i>
                                            Registrate
                                        </a>
                                    </li>
                                    @endunless

                                    <li>
                                        <a href="/contactanos#contactUs">
                                            <i>
                                                <img src="{{ url('assets/images/icon/person-lines-fill.svg')}}" width="14px" class="mx-2" alt="">
                                            </i>
                                            Contactanos
                                        </a>
                                    </li>

                                    @auth
                                    <li>
                                        <a href="/logout">
                                            <i class="bi bi-box-arrow-left mx-2 "></i>
                                            Salir
                                        </a>
                                    </li>
                                    @endauth

                                </ul>
                            </li>

                            @if(Auth::check())
                            <li>
                                <a href="{{"/perfil" . "/" . session('id') }} " title="" class="textfloat">
                                    <i class="fa-solid fa-circle-user d-sm-none d-lg-block d-md-block iconuser"></i>
                                    <span class="d-lg-none d-md-none">
                                        Ingresa a tu perfil
                                    </span>
                                </a>
                            </li>
                            @else
                            <li>
                                <a href="/login" title="">
                                    <i class="fa-solid fa-circle-user d-sm-none d-lg-block d-md-block iconuser"></i>
                                    <span class="d-lg-none d-md-none font">
                                        Ingresa
                                    </span>
                                </a>
                            </li>
                            @endif

                        </ul>

                        <a class='menu-trigger'>
                            <span>Menu</span>
                        </a>

                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
</header>
