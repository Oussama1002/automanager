@extends('layouts.app')

@section('content')
<div class="container py-5">
    <div class="text-center mb-5">
        <h5 class="fw-bold text-primary display-5">Nos <span class="text-dark">PACKs</span></h5>
    </div>

    <div class="row text-center justify-content-center mb-5">
        @foreach($packs as $pack)
            @if($pack->name !== 'Pack 1')
                @php
                $features = [];
                switch($pack->name) {
                    case 'Pack 2':
                        $title = 'BASIC';
                        $duration = 'Visibilité 7 Jours';
                        $price = '199 DH';
                        $features = [
                            'Renouvellement 1 fois/jour',
                            'Réseaux sociaux & sites de vente',
                            'Vitrine Nado.ma',
                            'Afficher votre numéro',
                        ];
                        break;
                    case 'Pack 3':
                        $title = 'MEDIUM';
                        $duration = 'Visibilité 15 Jours';
                        $price = '299 DH';
                        $features = [
                            'Renouvellement 1 fois/jour',
                            'Réseaux sociaux & sites de vente',
                            'Vitrine Nado.ma',
                            'Afficher votre numéro',
                        ];
                        break;
                    case 'Pack 4':
                        $title = 'PREMIUM';
                        $duration = 'Visibilité 30 Jours';
                        $price = '499 DH';
                        $features = [
                            'Renouvellement 2 fois/jour',
                            'Réseaux sociaux & sites de vente',
                            'Vitrine Nado.ma',
                            'Reels Instagram / TikTok',
                            'Vidéo / Short YouTube',
                            'Qualifications des appels',
                            'Gestion des rendez-vous',
                        ];
                        break;
                    default:
                        $title = $pack->name;
                        $duration = '';
                        $price = $pack->price . ' DH';
                        $features = ['Aucun détail disponible'];
                }
                @endphp

                <div class="col-md-4 mb-5">
                    <div class="pack-card border border-primary rounded-4 h-100 p-5 d-flex flex-column justify-content-between shadow-lg">
                        <div>
                            <span class="badge bg-primary mb-3 px-4 py-2 fs-4">{{ strtoupper($title) }}</span>
                            <h6 class="fw-bold mt-3 mb-4 text-primary fs-2">{{ $duration }}</h6>
                            <ul class="list-unstyled text-start px-2 fs-4">
                                @foreach($features as $feature)
                                    <li class="mb-3">• {{ $feature }}</li>
                                @endforeach
                            </ul>
                        </div>
                        <div class="mt-4">
                            <div class="fw-bold fs-1 text-primary mb-4">{{ $price }}</div>
                            <a href="{{ route('client.register') }}" class="btn btn-primary btn-lg w-100 fw-bold py-4 fs-4" style="border-radius: 35px;">
                                S'inscrire
                            </a>
                        </div>
                    </div>
                </div>
            @endif
        @endforeach
    </div>

    <!-- FREE PACK -->
    @php
    $pack1 = $packs->where('name', 'Pack 1')->first();
    @endphp
    @if($pack1)
    <div class="text-center mt-5 pt-5">
        <a href="{{ route('client.register') }}" class="btn btn-outline-primary fw-bold fs-3 py-4 px-5" style="border-radius: 40px;">
            Publiez gratuitement vos annonces sur Nado.ma
        </a>
    </div>
    @endif
</div>

<style>
/* General Layout */
h5.fw-bold.text-primary {
    font-size: 3.2rem;
    letter-spacing: 1px;
}
 .col-md-4 {
    height: 520px !important;

}

/* Pack Cards */
.pack-card {
    cursor: pointer;
    transition: all 0.3s ease;
    background-color: #ffffff;
    border: 3px solid #007bff;
    border-radius: 20px;
    height: 475px;
    font-size: 1.4rem;
    padding: 3rem !important;
}

.pack-card:hover {
    transform: scale(1.05);
    background-color: #f0f8ff;
    box-shadow: 0 0 35px rgba(0, 123, 255, 0.35);
}

/* Badge */
.pack-card .badge {
    font-size: 1.5rem !important;
    padding: 1rem 1.8rem !important;
    border-radius: 25px;
    font-weight: 700;
}

/* Titles */
.pack-card h6 {
    font-size: 2rem;
    font-weight: 700;
}

/* Features list */
.pack-card ul li {
    font-size: 1.6rem;
    margin-bottom: 1rem;
}

/* Price */
.pack-card .fw-bold.fs-1 {
    font-size: 2.8rem !important;
    color: #007bff !important;
}

/* Buttons */
.btn-primary {
    font-size: 1.6rem;
        padding: 2rem !important;
    border: none;
    transition: all 0.3s ease;
}
.btn-primary:hover {
    background-color: #0056b3;
    transform: scale(1.05);
}

/* Free pack button */
.btn-outline-primary {
    border-width: 3px;
    font-size: 1.8rem;
    transition: all 0.3s ease;
}
.btn-outline-primary:hover {
    background-color: #007bff;
    color: white;
    transform: scale(1.05);
}
 .btn-primary {
    }
/* Responsive adjustments */
@media (max-width: 768px) {
    .pack-card {
        min-height: auto;
        padding: 2rem !important;
    }
    .pack-card ul li {
        font-size: 1.4rem;
    }
    .btn-primary {
        font-size: 1.3rem;
        padding: 2rem !important;
    }
}
</style>
@endsection
