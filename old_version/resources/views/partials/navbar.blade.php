    <!-- header -->
    <header class="site-header header"style="height: 80px;">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" />

		<!-- main header -->
        <div class="sticky-header main-bar-wraper">
            <div class="main-bar clearfix ">
                <div class="container clearfix">
                    <!-- website logo -->
                    <div class="logo-header mostion">
						<a href="{{ route('index') }}"><img src="{{ asset('assets/images/logo.png') }}" alt=""></a>
					</div>
                    <!-- nav toggle button -->
                    <button data-target=".header-nav" data-toggle="collapse" type="button" class="navbar-toggle collapsed" aria-expanded="false" >
						<i class="fa fa-bars"></i>
					</button>
                    <!-- main nav -->
                    <div class="header-nav navbar-collapse collapse">
                        <ul class="nav navbar-nav">
							<li> <a href="{{ route('achat.index') }}" style="color: #1f519b !important" >Achat</a></li>
							<li> <a href="{{ route('vente.index') }}" style="color: #1f519b !important" >Vente</a></li>
							<li> <a href="{{ route('reprise.index') }}" style="color: #1f519b !important" >Nado reprise</a></li>
							<li> <a href="{{ route('financement.index') }}" style="color: #1f519b !important">Auto finance</a></li>
							<li> <a href="{{ route('services.index') }}" style="color: #1f519b !important" >à-propos</a></li>
                            <li> <a href="{{ route('contactez-nous.index') }}" style="color: #1f519b !important" >Contactez-nous</a></li>

							<!-- <li> <a href="{{ route('services.index') }}" class="hide" >Services <i class="fa fa-chevron-down"></i></a>
								<ul class="sub-menu"> 
									<li><a href="{{ route('services.index') }}#intermediation" >Intermediation</a></li>
									<li><a href="{{ route('services.index') }}#reprise" >Reprise</a></li>
									<li><a href="{{ route('services.index') }}#nadopro" >Nado pro</a></li>
								</ul>
							</li>
							<li> <a href="{{ route('vendre.index') }}" class="hide">Vendre/Reprise</a></li> -->
                            @php 
    $client = Auth::guard('client')->user();
@endphp

@if ($client)
    <li class="nav-item dropdown" style="position: relative;">
        <a href="#" class="dropdown-toggle"
           data-toggle="dropdown"
           style="background-color: #FFD700;
                  color: #000 !important;
                  padding: 8px 16px;
                  border-radius: 20px;
                  display: inline-flex;
                  align-items: center;
                  gap: 8px;
                                    margin-top:20px;

                  font-weight: bold;
                  text-decoration: none;">
            <i class="fa fa-user"></i> {{ $client->name }}
            <i class="fa fa-chevron-down" style="margin-left: 5px;"></i>
        </a>

        <ul class="sub-menu"
            style="position: absolute;
                   background: white;
                   list-style: none;
                   padding: 0;
                   margin: 5px 0 0;
                   border: 1px solid #ddd;
                   min-width: 180px;
                   display: none;
                   border-radius: 8px;
                   box-shadow: 0 2px 8px rgba(0,0,0,0.1);">

            <li style="list-style: none;">
                <a href="{{ route('client.dashboard') }}"
                   style="display: block;
                          padding: 10px 15px;
                          text-decoration: none;
                          color: #333;
                          font-size: 14px;">
                    <i class="fa fa-home"></i> Mon espace
                </a>
            </li>

            <li style="list-style: none;">
                <form method="POST" action="{{ route('logout') }}">
                    @csrf
                    <button type="submit"
                            style="width: 100%;
                                   background: none;
                                   border: none;
                                   padding: 10px 15px;
                                   text-align: left;
                                   color: #c00;
                                   font-size: 14px;
                                   cursor: pointer;">
                        <i class="fa fa-sign-out-alt"></i> Déconnexion
                    </button>
                </form>
            </li>
        </ul>
    </li>

    {{-- Add dropdown toggle behavior --}}
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const dropdownToggle = document.querySelector('.nav-item.dropdown .dropdown-toggle');
            const submenu = document.querySelector('.nav-item.dropdown .sub-menu');

            dropdownToggle?.addEventListener('click', function (e) {
                e.preventDefault();
                submenu.style.display = submenu.style.display === 'block' ? 'none' : 'block';
            });

            document.addEventListener('click', function (e) {
                if (!dropdownToggle.contains(e.target) && !submenu.contains(e.target)) {
                    submenu.style.display = 'none';
                }
            });
        });
    </script>

@else
    <li class="nav-item">
        <a href="{{ route('client.login') }}"
           style="background-color: #FFD700;
                  color: #000 !important;
                  padding: 8px 8px;
                  margin-top:20px;
                  border-radius: 20px;
              
                  font-weight: bold;
                  text-decoration: none;">
            Espace Client
        </a>
    </li>
@endif

</ul>


						</ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- main header END -->
        <style>
            .navbar-nav > li.dropdown:hover > .sub-menu {
    display: block !important;
}

.navbar-nav .dropdown-toggle {
    display: inline-block !important;
}

.navbar-nav .nav-item {
    list-style: none !important;
}

    /* Remove default bullets and spacing */
.navbar-nav,
.navbar-nav ul,
.navbar-nav li,
.navbar-nav .sub-menu {
    list-style-type: none !important;
    list-style: none !important;
    padding-left: 0 !important;
    margin-left: 0 !important;
}
/* Optional: Remove marker if it's being injected */
.navbar-nav li::marker,
.navbar-nav li::before {
    content: none !important;
    display: none !important;
}
/* Align main nav items horizontally */
.navbar-nav > li {
    display: inline-block !important;
    margin-right: 20px !important;
}

/* Fix submenu appearance */
.sub-menu {
    background: white;
    border: 1px solid #ddd;
    position: absolute;
    min-width: 180px;
    display: none;
    z-index: 1000;
}

/* Show submenu on hover */
.dropdown:hover .sub-menu {
    display: block !important;
}

/* Style submenu links */
.sub-menu li a {
    display: block;
    padding: 10px 15px;
    color: #1f519b !important;
    text-decoration: none;
}

/* Remove dots that appear from list styling */
.navbar-nav li::marker,
.navbar-nav li::before {
    display: none !important;
    content: none !important;
}

/* Fix button inside form (Déconnexion) */
.sub-menu form button {
    width: 100%;
    background: none;
    border: none;
    padding: 10px 15px;
    text-align: left;
    color: #1f519b !important;
    font-size: 14px;
    cursor: pointer;
}

/* Fix dropdown icon spacing */
.dropdown-toggle i.fa {
    margin-left: 5px;
}

</style>

    </header>
    <!-- header END -->
